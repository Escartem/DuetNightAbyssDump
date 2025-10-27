local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
M.State_Tab = 1
M.State_List = 2
local OBTAIN_SKIN_POP = 100210
local HAS_SKIN_ALERT_POP = 100264
M.PreviewBehaviorType = {
  BattlePassPreview = "BattlePassPreview",
  SkinSelect = "SkinSelect"
}
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")

function M:Construct(...)
  M.Super.Construct(self, ...)
  self.KeyDownEvents = self.KeyDownEvents or {}
  self.RepeatKeyDownEvents = self.RepeatKeyDownEvents or {}
  self.EscapeKey = EKeys and EKeys.Escape and EKeys.Escape.KeyName or "Escape"
  if UIConst.GamePadKey then
    self.GamePadBackKey = UIConst.GamePadKey.FaceButtonRight
    self.GamePadConfirmKey = UIConst.GamePadKey.FaceButtonBottom
    self.GamePadHideUIKey = UIConst.GamePadKey.FaceButtonLeft
    self.LeftTriggerKey = UIConst.GamePadKey.LeftTriggerThreshold
    self.RightTriggerKey = UIConst.GamePadKey.RightTriggerThreshold
    self.RightThumbstickX = "Gamepad_RightX"
  end
  self.ZoomKey = "Mouse_Button"
  self.bSelfHidden = false
  self.bConsumeFocused = false
  self.EMListView_Role.BP_OnItemClicked:Clear()
  self.EMListView_Role.BP_OnItemClicked:Add(self, function(self, Content)
    self:OnRoleListItemClicked(Content)
  end)
  self.CurRoleContent = nil
  self.EMListView_Role.BP_OnItemSelectionChanged:Clear()
  self.EMListView_Role.BP_OnItemSelectionChanged:Add(self, function(self, Content, bIsSelected)
    if bIsSelected and self:IsGamepadInput() and Content and Content ~= self.CurRoleContent then
      self:OnRoleListItemClicked(Content)
    end
  end)
  self.EMListView_Role.BP_OnEntryInitialized:Clear()
  self.EMListView_Role.BP_OnEntryInitialized:Add(self, self.OnRoleListEntryInitialized)
  self.Btn_List:UnBindEventOnClicked(self)
  self.Btn_List:BindEventOnClicked(self, function()
    self:ToggleRoleListPanel()
  end)
  self.Btn_Confirm:UnBindEventOnClicked(self)
  self.Btn_Confirm:SetText(GText("UI_CONFIRM_SELECTION"))
  self.Btn_Confirm:BindEventOnClicked(self, self.OnConfirmClicked)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnLoaded", ...)
  self.ActorController, self.Params = ...
  self.bIsFocusable = true
  self:SetFocus()
  self:InitParams()
  self:InitTabInfo()
  self:InitRoleList()
  self:InitSelectiveListing()
  self:InitInputSettings()
  self:UpdatePreviewSkinActor()
  self.bRoleListOpen = false
  self.CurState = M.State_Tab
  self:PlayAnimation(self.In)
  self:RefreshDetailPanel()
  self:InitKeySetting()
  self:ApplyRoleListVisibility()
end

function M:InitParams()
  if self.Params then
    self.BehaviorType = self.Params.Type
    self.InitSkinId = self.Params.SkinId
    self.SkinOptRewardId = self.Params.SkinOptRewardId
    self.ResourceId = self.Params.ResourceId
    DebugPrint("gmy@WBP_CharSkinPreview_C M:InitParams", self.BehaviorType, self.InitSkinId, self.SkinSeriesId, self.SkinOptRewardId)
    if self.SkinOptRewardId then
      local OptCfg = DataMgr.OptReward and DataMgr.OptReward[self.SkinOptRewardId]
      if OptCfg and OptCfg.Type and OptCfg.Id then
        local bHasSkinType = false
        for _, t in pairs(OptCfg.Type) do
          if "Skin" == t then
            bHasSkinType = true
            break
          end
        end
        if bHasSkinType then
          self.bUseOptRewardSkinList = true
          if not self.InitSkinId then
            local Avatar = GWorld:GetAvatar()
            local CurChar = Avatar and Avatar.Chars and Avatar.Chars[Avatar.CurrentChar]
            local CurCharId = CurChar and CurChar.CharId
            local FirstSkinId, MinSkinId
            for _, sid in pairs(OptCfg.Id) do
              FirstSkinId = FirstSkinId or sid
              if not MinSkinId or sid < MinSkinId then
                MinSkinId = sid
              end
              local SkinData = DataMgr.Skin[sid]
              if CurCharId and SkinData and SkinData.CharId == CurCharId then
                self.InitSkinId = sid
                break
              end
            end
            if not self.InitSkinId then
              self.InitSkinId = MinSkinId or FirstSkinId
            end
          end
        else
          DebugPrint("gmy@WBP_CharSkinPreview_C M:InitParams OptReward Type not Skin", self.SkinOptRewardId)
        end
      else
        DebugPrint("gmy@WBP_CharSkinPreview_C M:InitParams OptReward cfg missing", self.SkinOptRewardId)
      end
    end
    if not self.bUseOptRewardSkinList and self.InitSkinId and self.SkinSeriesId == nil then
      local SkinData = DataMgr.Skin[self.InitSkinId]
      self.SkinSeriesId = SkinData and SkinData.SkinSeries
    end
  end
  if nil == self.ActorController then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar.Chars and Avatar.CurrentChar then
      local CurrentChar = Avatar.Chars[Avatar.CurrentChar]
      local CurrentSkinId = CurrentChar and CurrentChar:GetAppearance().SkinId
      local PreviewSkinId
      if self.bUseOptRewardSkinList and self.InitSkinId then
        PreviewSkinId = self.InitSkinId
      elseif self.SkinSeriesId then
        local PreferredId, MinId
        for SkinId, Info in pairs(DataMgr.Skin) do
          if Info.SkinSeries == self.SkinSeriesId then
            if Info.CharId == (CurrentChar and CurrentChar.CharId) then
              PreferredId = SkinId
              break
            end
            if not MinId or SkinId < MinId then
              MinId = SkinId
            end
          end
        end
        PreviewSkinId = PreferredId or MinId
      end
      PreviewSkinId = PreviewSkinId or self.InitSkinId or CurrentSkinId
      if not self.InitSkinId then
        self.InitSkinId = PreviewSkinId
      end
      local PreviewParams = {
        Type = "Char",
        SkinId = PreviewSkinId,
        EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
        ViewUI = self
      }
      self.Target = self:CreatePreviewTargetData(PreviewParams)
      PreviewParams.Target = self.Target
      self.ActorController = self:CreatePreviewActor(PreviewParams)
      self.ActorController:OnOpened()
      self.IsPreviewMode = true
    end
  end
end

function M:InitRoleList()
  self:BuildRoleItemContents()
  self.EMListView_Role:ClearListItems()
  for _, Content in ipairs(self.RoleItemContentsArray) do
    self.EMListView_Role:AddItem(Content)
    if Content.IsSelect then
      self.EMListView_Role:BP_ScrollItemIntoView(Content)
    end
  end
  self.EMListView_Role:RegenerateAllEntries()
end

function M:BuildRoleItemContents()
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Avatar.Chars then
    return
  end
  self.RoleItemContentsMap = {}
  self.RoleItemContentsArray = {}
  self.CharId2SkinId = {}
  self.UnownedCharContentMap = {}
  local ExcludeCharId
  local Gender2RoleIds = Const and Const.DefaultAttributeMaster
  if Avatar and Gender2RoleIds and Avatar.Sex ~= nil then
    ExcludeCharId = Gender2RoleIds[1 - Avatar.Sex]
  end
  
  local function ShouldIncludeChar(CharId)
    if not CharId then
      return false
    end
    if ExcludeCharId and CharId == ExcludeCharId then
      return false
    end
    local CharCfg = DataMgr.Char and DataMgr.Char[CharId]
    if not CharCfg then
      return false
    end
    if CharCfg.IsNotOpen then
      return false
    end
    return true
  end
  
  local TargetCharIds
  if self.bUseOptRewardSkinList and self.SkinOptRewardId then
    local OptCfg = DataMgr.OptReward and DataMgr.OptReward[self.SkinOptRewardId]
    if OptCfg and OptCfg.Id and OptCfg.Type then
      local bHasSkinType = false
      for _, t in pairs(OptCfg.Type) do
        if "Skin" == t then
          bHasSkinType = true
          break
        end
      end
      if bHasSkinType then
        TargetCharIds = {}
        for _, SkinId in pairs(OptCfg.Id) do
          local SkinData = DataMgr.Skin[SkinId]
          local CharId = SkinData and SkinData.CharId
          if CharId and ShouldIncludeChar(CharId) then
            TargetCharIds[CharId] = true
            if not self.CharId2SkinId[CharId] then
              self.CharId2SkinId[CharId] = SkinId
            end
          else
            DebugPrint("WBP_CharSkinPreview_C BuildRoleItemContents \229\165\150\229\138\177\232\191\135\230\187\164\230\142\146\233\153\164", SkinId, CharId)
          end
        end
        DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildRoleItemContents UseOptReward", self.SkinOptRewardId)
      else
        DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildRoleItemContents OptReward Type not Skin", self.SkinOptRewardId)
      end
    end
  end
  if not TargetCharIds and self.SkinSeriesId then
    local SkinConverter = DataMgr.SkinConverter
    local SkinSeries2SkinId = SkinConverter and SkinConverter.SkinSeries2SkinId
    local SkinIdList = SkinSeries2SkinId and SkinSeries2SkinId[tostring(self.SkinSeriesId)]
    if SkinIdList then
      TargetCharIds = {}
      for _, SkinId in pairs(SkinIdList) do
        local SkinData = DataMgr.Skin[SkinId]
        local CharId = SkinData and SkinData.CharId
        if CharId and ShouldIncludeChar(CharId) then
          TargetCharIds[CharId] = true
          self.CharId2SkinId[CharId] = SkinId
        else
          DebugPrint("WBP_CharSkinPreview_C BuildRoleItemContents \231\179\187\229\136\151\232\191\135\230\187\164\230\142\146\233\153\164", SkinId, CharId)
        end
      end
    end
  end
  local OwnedCharIds = {}
  for Uuid, Char in pairs(Avatar.Chars) do
    if Char and ShouldIncludeChar(Char.CharId) and (not TargetCharIds or TargetCharIds[Char.CharId]) then
      local Content = ArmoryUtils:NewCharOrWeaponItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil)
      Content.Level = nil
      Content.IsOwned = true
      local SkinIdForChar = self.CharId2SkinId[Char.CharId]
      local bHasSkin = false
      if SkinIdForChar then
        bHasSkin = self:HasSkin(Char.CharId, SkinIdForChar)
      end
      Content.bHideLevelPanel = not bHasSkin
      Content.CharSkinPreViewLockType = bHasSkin and 2 or 0
      Content.LockType = 0
      Content.GotType = bHasSkin
      Content.bHideRarity = true
      Content.bSet = bHasSkin
      Content.SetOwnText = bHasSkin and GText("UI_Skin_HasSkin_Short") or nil
      Content.bShadow = bHasSkin
      Content.SortHasSkin = bHasSkin
      Content.SortIsOwned = true
      Content.SortSkinId = SkinIdForChar
      self.RoleItemContentsMap[Uuid] = Content
      table.insert(self.RoleItemContentsArray, Content)
      OwnedCharIds[Char.CharId] = true
    end
  end
  if TargetCharIds then
    ArmoryUtils:DontResetUuid(true)
    for CharId, _ in pairs(TargetCharIds) do
      if ShouldIncludeChar(CharId) and not OwnedCharIds[CharId] then
        local DummyAvatar = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Prime, {
          CharIds = {CharId}
        })
        local _, DummyChar = next(DummyAvatar.Chars)
        if DummyChar then
          local SkinIdForChar = self.CharId2SkinId[CharId]
          local bHasSkin = false
          if SkinIdForChar then
            bHasSkin = self:HasSkin(CharId, SkinIdForChar)
          end
          local Content = ArmoryUtils:NewCharOrWeaponItemContent(DummyChar, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, true)
          Content.IsOwned = false
          Content.CharSkinPreViewLockType = 2
          Content.LockType = bHasSkin and 0 or 2
          Content.GotType = bHasSkin
          Content.bHideRarity = true
          Content.bSet = bHasSkin
          Content.SetOwnText = bHasSkin and GText("UI_Skin_HasSkin_Short") or nil
          Content.bShadow = bHasSkin
          Content.Level = nil
          Content.Target = DummyChar
          Content.Avatar = DummyAvatar
          Content.SortHasSkin = bHasSkin
          Content.SortIsOwned = false
          Content.SortSkinId = SkinIdForChar
          self.RoleItemContentsMap[Content.Uuid] = Content
          self.UnownedCharContentMap[CharId] = Content
          table.insert(self.RoleItemContentsArray, Content)
        end
      end
    end
    ArmoryUtils:DontResetUuid(false)
  end
  table.sort(self.RoleItemContentsArray, function(a, b)
    local AHasSkin = a.SortHasSkin and 1 or 0
    local BHasSkin = b.SortHasSkin and 1 or 0
    local AOwned = a.SortIsOwned and 1 or 0
    local BOwned = b.SortIsOwned and 1 or 0
    
    local function Group(Owned, HasSkin)
      if 1 == Owned then
        if 0 == HasSkin then
          return 1
        else
          return 2
        end
      elseif 0 == HasSkin then
        return 3
      else
        return 4
      end
    end
    
    local GroupA = Group(AOwned, AHasSkin)
    local GroupB = Group(BOwned, BHasSkin)
    if GroupA ~= GroupB then
      return GroupA < GroupB
    end
    local ASkinId = a.SortSkinId or math.huge
    local BSkinId = b.SortSkinId or math.huge
    if ASkinId ~= BSkinId then
      return ASkinId < BSkinId
    end
    local ACharId = a.CharId or a.Char and a.Char.CharId or a.UnitId or 0
    local BCharId = b.CharId or b.Char and b.Char.CharId or b.UnitId or 0
    if ACharId ~= BCharId then
      return ACharId < BCharId
    end
    local AUuid = tostring(a.Uuid or "")
    local BUuid = tostring(b.Uuid or "")
    return AUuid < BUuid
  end)
  local SelectedContent
  if self.InitSkinId then
    local InitSkinData = DataMgr.Skin[self.InitSkinId]
    local InitCharId = InitSkinData and InitSkinData.CharId
    if InitCharId and ShouldIncludeChar(InitCharId) then
      for _, Content in ipairs(self.RoleItemContentsArray) do
        if Content.Char and Content.Char.CharId == InitCharId or Content.CharId == InitCharId then
          SelectedContent = Content
          break
        end
      end
    end
  end
  if not SelectedContent then
    local CurrentUuid = Avatar.CurrentChar
    local CurContent = CurrentUuid and self.RoleItemContentsMap[CurrentUuid]
    if CurContent and CurContent.Char and ShouldIncludeChar(CurContent.Char.CharId) then
      SelectedContent = CurContent
    else
      SelectedContent = self.RoleItemContentsArray[1]
    end
  end
  if SelectedContent then
    ArmoryUtils:SetItemIsSelected(SelectedContent, true)
    SelectedContent.IsSelect = true
    self.CurRoleContent = SelectedContent
  end
  if self.RoleItemContentsArray then
    for _, Content in ipairs(self.RoleItemContentsArray) do
      Content.RedDotType = nil
    end
  end
end

function M:OnRoleListEntryInitialized(_Content, _Widget)
  local Content, Widget = _Content, _Widget
  if Content then
    Content.RedDotType = nil
  end
  if Widget then
    if Widget.SetReddot then
      Widget:SetReddot(nil)
    else
      if Widget.Reddot and Widget.Reddot.SetVisibility then
        Widget.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      if Widget.New and Widget.New.SetVisibility then
        Widget.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end

function M:OnRoleListItemClicked(Content)
  if self.CurRoleContent == Content then
    return
  end
  if self.CurRoleContent then
    ArmoryUtils:SetItemIsSelected(self.CurRoleContent, false)
    self.CurRoleContent.IsSelect = false
    if self.CurRoleContent.Widget and self.CurRoleContent.Widget.SetIsSelected then
      self.CurRoleContent.Widget:SetIsSelected(false)
    end
  end
  ArmoryUtils:SetItemIsSelected(Content, true)
  Content.IsSelect = true
  if Content.Widget and Content.Widget.SetIsSelected then
    Content.Widget:SetIsSelected(true)
  end
  self.CurRoleContent = Content
  self:UpdatePreviewSkinActorForContent(Content)
  self:RefreshDetailPanel()
end

function M:UpdatePreviewSkinActorForContent(Content)
  local RealAvatar = GWorld:GetAvatar()
  local RealChar = RealAvatar.Chars[Content.Uuid]
  local CharId
  if RealChar then
    CharId = RealChar.CharId or Content.CharId or Content.UnitId
    self.ActorController:ChangeCharModel(RealChar)
  elseif Content.Target then
    if Content.Avatar then
      self.ActorController:SetAvatar(Content.Avatar)
    end
    self.ActorController:ChangeCharModel(Content.Target)
    CharId = Content.Target and Content.Target.CharId or Content.CharId or Content.UnitId
    self.ActorController:SetAvatar(RealAvatar)
  end
  if CharId then
    self:ApplyCurrentSkinAppearance(CharId)
  end
  self:EnterSkinCameraAnimation()
end

function M:Close()
  M.Super.Close(self)
  DebugPrint("gmy@@@WBP_CharSkinPreview_C M:Close111")
  EventManager:FireEvent(EventID.BattlePassSkinClose)
end

function M:Destruct(...)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
  end
  local UIBattleMain = UIManager(self):GetUI("BattlePassMain")
  if UIBattleMain then
    if self.BehaviorType == M.PreviewBehaviorType.BattlePassPreview and self.InitSkinId and self.ActorController then
      local SkinData = DataMgr.Skin[self.InitSkinId]
      local Avatar = GWorld:GetAvatar()
      local RestoreChar
      for _, C in pairs(Avatar.Chars) do
        if C.CharId == SkinData.CharId then
          RestoreChar = C
          break
        end
      end
      if RestoreChar then
        self.ActorController:ChangeCharModel(RestoreChar)
        local AppearanceInfo = {
          CharId = SkinData.CharId,
          SkinId = self.InitSkinId,
          AccessorySuit = {}
        }
        self.ActorController:ChangeCharAppearance(AppearanceInfo)
      end
    end
  else
    self.ActorController:OnClosed()
    self.ActorController:OnDestruct()
  end
  DebugPrint("gmy@@@WBP_CharSkinPreview_C M:Destruct")
  M.Super.Destruct(self, ...)
end

function M:InitTabInfo()
  self.MainTabsStyle = {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = {},
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {},
    StyleName = "Text",
    OwnerPanel = self,
    LastFocusWidget = self,
    BackCallback = self.ExitSkin
  }
  self.BackKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.ExitSkin,
        Owner = self
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = self.ExitSkin,
        Owner = self
      }
    },
    Desc = GText("UI_BACK")
  }
  self.Tab_SkinPreview:Init(self.MainTabsStyle)
end

function M:ExitSkin()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
end

function M:UpdatePreviewSkinActor()
  local RealAvatar = GWorld:GetAvatar()
  local CharUuid = RealAvatar.CurrentChar
  if self.CurRoleContent and self.CurRoleContent.Uuid then
    CharUuid = self.CurRoleContent.Uuid
  end
  local RealChar = RealAvatar.Chars[CharUuid]
  local CharId
  if RealChar then
    CharId = RealChar.CharId
    self.ActorController:ChangeCharModel(RealChar)
  elseif self.CurRoleContent and self.CurRoleContent.Target then
    if self.CurRoleContent.Avatar then
      self.ActorController:SetAvatar(self.CurRoleContent.Avatar)
    end
    self.ActorController:ChangeCharModel(self.CurRoleContent.Target)
    CharId = self.CurRoleContent.Target and self.CurRoleContent.Target.CharId or self.CurRoleContent.CharId or self.CurRoleContent.UnitId
    self.ActorController:SetAvatar(RealAvatar)
  end
  if CharId then
    self:ApplyCurrentSkinAppearance(CharId)
  end
  self:EnterSkinCameraAnimation()
end

function M:EnterSkinCameraAnimation()
  self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char)
end

function M:GetPreviewSkinIdForChar(CharId)
  if not CharId then
    return nil
  end
  local SkinId
  if self.CharId2SkinId then
    SkinId = self.CharId2SkinId[CharId]
  end
  if not SkinId and self.InitSkinId then
    local Data = DataMgr.Skin[self.InitSkinId]
    if Data and Data.CharId == CharId then
      SkinId = self.InitSkinId
    end
  end
  return SkinId
end

function M:ApplyCurrentSkinAppearance(CharId)
  if not self.ActorController or not CharId then
    return
  end
  local SkinId = self:GetPreviewSkinIdForChar(CharId)
  if not SkinId then
    return
  end
  local AppearanceInfo = {
    CharId = CharId,
    SkinId = SkinId,
    AccessorySuit = {}
  }
  self.ActorController:ChangeCharAppearance(AppearanceInfo)
end

function M:InitInputSettings()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  end
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  self.Key_List_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    },
    Desc = GText("UI_CTL_ExpandList")
  })
  if self.Key_Consume_GamePad then
    self.Key_Consume_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnUpdateUIStyleByInputTypeChange", CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self:FocusFirstForInputMode()
    if self.Key_Consume_GamePad then
      if self.bRoleListOpen then
        self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      else
        self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
    if self.bRoleListOpen then
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    if self.Key_Consume_GamePad then
      self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:FocusFirstForInputMode()
  DebugPrint("gmy@WBP_CharSkinPreview_C M:FocusFirstForInputMode111")
  if self.bRoleListOpen then
    local Target = self.CurRoleContent
    if Target then
      self.TileView_Select_Role:BP_SetSelectedItem(Target)
      self.TileView_Select_Role:BP_ScrollItemIntoView(Target)
    end
    if self:HasAnyFocus() then
      self.TileView_Select_Role:SetFocus()
    end
  else
    local Target = self.CurRoleContent
    if Target then
      if self.EMListView_Role.BP_SetSelectedItem then
        self.EMListView_Role:BP_SetSelectedItem(Target)
      end
      self.EMListView_Role:BP_ScrollItemIntoView(Target)
    end
    if self:HasAnyFocus() then
      self.EMListView_Role:SetFocus()
    end
  end
  self.bConsumeFocused = false
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  DebugPrint("gmy@WBP_CharSkinPreview_C M:On_Image_Click_MouseButtonDown")
  if self.bRoleListOpen then
    self:CloseRoleListPanel()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return self:OnPointerMove(MyGeometry, MouseEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnPointerUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnPointerMove(MyGeometry, InTouchEvent)
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnKeyDown(_, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.bConsumeFocused and self.Item_Consume and ("Escape" == InKeyName or InKeyName == self.EscapeKey or InKeyName == self.GamePadBackKey or InKeyName == Const.GamepadFaceButtonRight) then
    if self.bRoleListOpen and self.TileView_Select_Role then
      self.TileView_Select_Role:SetFocus()
    elseif self.EMListView_Role then
      self.EMListView_Role:SetFocus()
    end
    self.bConsumeFocused = false
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if self.KeyDownEvents and self.KeyDownEvents[InKeyName] then
    local func = self.KeyDownEvents[InKeyName]
    if func then
      func(self)
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnKeyDown", InKeyName)
  if "Escape" == InKeyName or InKeyName == Const.GamepadFaceButtonRight then
    if self.bRoleListOpen then
      self:CloseRoleListPanel()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    self:ExitSkin()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if InKeyName == Const.GamepadFaceButtonBottom and false ~= self.Btn_Confirm.IsEnabled then
    self:OnConfirmClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if InKeyName == Const.GamepadFaceButtonTop then
    self:ToggleRoleListPanel()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnRepeatKeyDown(_MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local func = self.RepeatKeyDownEvents and self.RepeatKeyDownEvents[InKeyName]
  if func then
    func(self)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:InitKeySetting()
  self.KeyDownEvents[self.EscapeKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.GamePadBackKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.GamePadHideUIKey] = self.OnHideUIKeyDown
  self.KeyDownEvents[self.GamePadConfirmKey] = self.OnConfirmKeyDown
  self.KeyDownEvents.U = self.OnHideUIKeyDown
  self.KeyDownEvents[Const.GamepadSpecialLeft] = function(self)
    self:ToggleRoleListPanel()
  end
  self.KeyDownEvents[Const.GamepadLeftThumbstick] = function(self)
    if self.bRoleListOpen then
      if self.Key_Consume_GamePad then
        self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
      self.bConsumeFocused = false
    else
      self.Item_Consume:SetFocus()
      self.bConsumeFocused = true
      if self.Key_Consume_GamePad then
        if self:IsGamepadInput() then
          self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        else
          self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
        end
      end
    end
  end
  self.RepeatKeyDownEvents[self.LeftTriggerKey] = self.OnCameraScrollBackwardKeyDown
  self.RepeatKeyDownEvents[self.RightTriggerKey] = self.OnCameraScrollForwardKeyDown
  self:BuildBottomKeyInfo()
end

function M:BuildBottomKeyInfo()
  self.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(self.EscapeKey),
        ClickCallback = self.OnBackKeyDown,
        Owner = self
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = self.OnBackKeyDown,
        Owner = self
      }
    },
    Desc = GText("UI_BACK")
  }
  self.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnHideUIKeyDown,
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    Desc = GText("UI_Dye_HideUI")
  }
  self.ZoomKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(self.ZoomKey),
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Or"},
      GamePadSubKeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
          Owner = self
        },
        {
          Type = "Img",
          ImgShortPath = "RT",
          Owner = self
        }
      }
    },
    Desc = GText("UI_Dye_Zoom"),
    bLongPress = false
  }
  self.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "RH"}
    },
    Desc = GText("UI_CTL_RotatePreview")
  }
  self.BottomKeyInfo = {}
  table.insert(self.BottomKeyInfo, self.HideUI_KeyInfoList)
  table.insert(self.BottomKeyInfo, self.ZoomKeyInfoList)
  table.insert(self.BottomKeyInfo, self.RightThumbstickAnalogBottomKeyInfoList)
  table.insert(self.BottomKeyInfo, self.ESCKeyInfoList)
  if self.Tab_SkinPreview and self.Tab_SkinPreview.UpdateBottomKeyInfo then
    self.Tab_SkinPreview:UpdateBottomKeyInfo(self.BottomKeyInfo)
  end
end

function M:OnBackKeyDown()
  if self.bRoleListOpen then
    self:CloseRoleListPanel()
  else
    self:ExitSkin()
  end
end

function M:OnConfirmKeyDown()
  if self.Btn_Confirm.IsEnabled ~= false then
    self:OnConfirmClicked()
  end
end

function M:OnHideUIKeyDown()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    self:SetRenderOpacity(0)
    if self.Image_Click and self.Image_Click.Slot then
      self.Image_Click.Slot:SetZOrder(10)
    end
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
  else
    self:SetRenderOpacity(1)
    if self.Image_Click and self.Image_Click.Slot then
      self.Image_Click.Slot:SetZOrder(-1)
    end
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
  end
end

function M:OnCameraScrollBackwardKeyDown()
  if not self.bSelfHidden then
    self:ScrollCamera(1)
  end
end

function M:OnCameraScrollForwardKeyDown()
  if not self.bSelfHidden then
    self:ScrollCamera(-1)
  end
end

function M:InitSelectiveListing()
  if self.bSelectiveInited then
    return
  end
  self.bSelectiveInited = true
  self.TileView_Select_Role.BP_OnItemClicked:Clear()
  self.TileView_Select_Role.BP_OnItemClicked:Add(self, function(self, Content)
    self:OnTileRoleItemClicked(Content)
  end)
  self.TileView_Select_Role.BP_OnItemSelectionChanged:Clear()
  self.TileView_Select_Role.BP_OnItemSelectionChanged:Add(self, function(self, Content, bIsSelected)
    if bIsSelected and self:IsGamepadInput() and Content and Content ~= self.CurRoleContent then
      self:OnRoleListItemClicked(Content)
    end
  end)
  self.CharFilterTags, self.CharFilterNames = UIUtils.GetAllElementTypes()
  self.CharFilterIcons = {}
  for _, Tag in pairs(self.CharFilterTags) do
    local IconName = "Armory_" .. Tag
    table.insert(self.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  end
  self.Filters = self:CreateFilters(self.CharFilterTags, self.CharFilterNames, self.CharFilterIcons, self.ExcelWeaponTags)
  self.FilterMod = "Single"
  self.FilterIdxes = {}
  self.SelectedFilterContents = {}
  self.LastSelectedFilterContent = nil
  self.EMListView_Filter.BP_OnItemClicked:Clear()
  self.EMListView_Filter.BP_OnItemClicked:Add(self, self.OnFilterListItemClicked)
  local OrderByDisplayNames = {
    GText("UI_RARITY_NAME")
  }
  self:BuildFilterContents()
  self:FillSelectiveTileView()
end

function M:BuildFilterContents()
  self.EMListView_Filter:ClearListItems()
  self.FilterContents = {}
  self.SelectedFilterContents = {}
  self.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
  self.FilterContentObj_All.IsSelect = true
  self.FilterContentObj_All.Index = 0
  self.FilterContentObj_All.Tag = "ALL"
  self.FilterContentObj_All.Text = GText("UI_ALL")
  self.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
  self.FilterContentObj_All.IsSelected = true
  self.FilterContentObj_All.Owner = self
  self.LastSelectedFilterContent = self.FilterContentObj_All
  table.insert(self.FilterContents, self.FilterContentObj_All)
  self.EMListView_Filter:AddItem(self.FilterContentObj_All)
  for Index, FilterData in ipairs(self.Filters) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    if "table" == type(FilterData) then
      for Key, Value in pairs(FilterData) do
        Obj[Key] = Value
      end
    else
      Obj.Text = FilterData
      Obj.Tag = FilterData
    end
    Obj.Index = Index
    Obj.IsSelected = false
    Obj.Owner = self
    table.insert(self.FilterContents, Obj)
    self.EMListView_Filter:AddItem(Obj)
    DebugPrint("gmy@WBP_CharSkinPreview_C M:BuildFilterContents", Obj.Text, Obj.Tag)
  end
  self.CurrentFilterTag = "ALL"
  self.EMListView_Filter:RegenerateAllEntries()
end

function M:OnFilterEntryInitialized(Content, Widget)
  if Widget and Widget.SetIsSelected then
    Widget:SetIsSelected(Content.IsSelected == true)
    Content.UI = Widget
  end
end

function M:GetSelectiveSourceContents()
  return self.RoleItemContentsArray or {}
end

function M:FillSelectiveTileView()
  local Source = self:GetSelectiveSourceContents()
  local FilterTag = self.CurrentFilterTag
  self.TileView_Select_Role:ClearListItems()
  self.SelectiveDisplayedContents = {}
  for _, Content in ipairs(Source) do
    local CharId = Content.CharId or Content.Char and Content.Char.CharId or Content.UnitId
    local Attr = DataMgr.BattleChar[CharId].Attribute
    if "ALL" == FilterTag or Attr == FilterTag then
      Content.OnFocusReceivedEvent = {
        Obj = self,
        Callback = self.OnFocusReceivedEvent
      }
      table.insert(self.SelectiveDisplayedContents, Content)
      self.TileView_Select_Role:AddItem(Content)
    end
  end
  if self.CurRoleContent then
    local bKeep = false
    for _, c in ipairs(self.SelectiveDisplayedContents) do
      if c == self.CurRoleContent then
        bKeep = true
        break
      end
    end
    if bKeep then
      self.TileView_Select_Role:BP_SetSelectedItem(self.CurRoleContent)
      self.TileView_Select_Role:BP_ScrollItemIntoView(self.CurRoleContent)
    else
      local NewContent = self.SelectiveDisplayedContents[1]
      if NewContent then
        self:OnRoleListItemClicked(NewContent)
        self.TileView_Select_Role:BP_SetSelectedItem(NewContent)
        self.TileView_Select_Role:BP_ScrollItemIntoView(NewContent)
      end
    end
  end
  self:SetIsEmpty(0 == #self.SelectiveDisplayedContents)
  if 0 == #self.SelectiveDisplayedContents then
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:SetIsEmpty(bIsEmpty)
  if bIsEmpty then
    self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnTileRoleItemClicked(Content)
  self:OnRoleListItemClicked(Content)
end

function M:OnFilterListItemClicked(Content)
  if Content.Tag == self.CurrentFilterTag then
    return
  end
  local Items = self.EMListView_Filter:GetListItems()
  local Len = Items:Length()
  for I = 1, Len do
    local Item = Items[I]
    if Item.Tag == self.CurrentFilterTag then
      Item.IsSelected = false
      if Item.UI and Item.UI.SetIsSelected then
        Item.UI:SetIsSelected(false)
      end
      break
    end
  end
  self.CurrentFilterTag = Content.Tag
  Content.IsSelected = true
  if Content.UI and Content.UI.SetIsSelected then
    Content.UI:SetIsSelected(true)
  end
  self:FillSelectiveTileView()
end

function M:OnSelectiveSortChanged()
end

function M:CreateFilters(InTags, InTexts, InIcons, ExcelWeaponTags)
  local Filters = {}
  for i, value in ipairs(InTags) do
    table.insert(Filters, {
      Tag = value,
      Text = InTexts[i],
      Icon = InIcons[i],
      bShowRecommend = ExcelWeaponTags and CommonUtils.HasValue(ExcelWeaponTags, value)
    })
  end
  return Filters
end

function M:HasSkin(CharId, SkinId)
  if not CharId or not SkinId then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Avatar.CommonChars then
    return false
  end
  local CommonChar = Avatar.CommonChars[CharId]
  local OtherCharSkins = Avatar.OtherCharSkins[CharId]
  if CommonChar and CommonChar.OwnedSkins then
    for Id, _ in pairs(CommonChar.OwnedSkins) do
      if Id == SkinId then
        return true
      end
    end
  end
  if OtherCharSkins then
    for _, Id in pairs(OtherCharSkins) do
      if Id == SkinId then
        return true
      end
    end
  end
  return false
end

function M:RefreshDetailPanel()
  local Content = self.CurRoleContent
  local CharId = Content.UnitId
  local SkinId = self.CharId2SkinId[CharId] or self.InitSkinId
  DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", self.CurRoleContent, CharId, SkinId)
  local SkinData = DataMgr.Skin[SkinId]
  local CharCfg = DataMgr.Char[CharId]
  self.Text_CharName:SetText(GText(CharCfg.CharName))
  self.Text_SkinName:SetText(GText(SkinData.SkinName))
  local SkinNameFont = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if SkinData.Rarity and SkinNameFont[SkinData.Rarity] and self[SkinNameFont[SkinData.Rarity]] then
    self.Text_SkinName:SetFont(self[SkinNameFont[SkinData.Rarity]])
  end
  self.Text_SkinName_World:SetText(EnText(SkinData.SkinName))
  self.Text_Info:SetText(GText(SkinData.SkinDescribe))
  self.Tag_Quality:Init(SkinData.Rarity)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local ElementType = DataMgr.BattleChar[CharId].Attribute
  if ElementType then
    local IconName = "Armory_" .. ElementType
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    self.Icon_Element:SetBrushResourceObject(AttributeIcon)
    self.Icon_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Icon_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel IsOwned", Content.IsOwned)
  if Content.IsOwned then
    self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    self.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local bHasSkin = self:HasSkin(CharId, SkinId)
  local bHasChar = Content.IsOwned
  DebugPrint("SkinOwnCheck", CharId, SkinId, bHasSkin)
  if bHasSkin then
    self.Text_Consume:SetText(GText("UI_Already_Have_Char_Skin"))
  elseif not bHasChar then
    self.Text_Consume:SetText(GText("UI_Skin_Not_Have_Char"))
  else
    self.Text_Consume:SetText(GText("UI_Consume_Select_Skin"))
  end
  if bHasChar and not bHasSkin then
    self.Icon_Hint:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Icon_Hint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:PlayAnimation(self.Change)
  if self.SkinOptRewardId then
    self.Panel_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Confirm:SetVisibility(ESlateVisibility.Visible)
  else
    self.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Confirm:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local SkinIconPath = SkinData and SkinData.Icon
  local Rarity = SkinData and SkinData.Rarity or 0
  if SkinIconPath then
    DebugPrint("gmy@WBP_CharSkinPreview_C M:RefreshDetailPanel", SkinId)
    local ConsumeContent = {
      Id = SkinId,
      ItemType = "Skin",
      Rarity = Rarity,
      Icon = SkinIconPath,
      bAsyncLoadIcon = true,
      IsShowDetails = true,
      bDisableCommonClick = true,
      Des = GText("ASJHKAJKADSJFSJKDF")
    }
    if not self.Item_Consume.Content or self.Item_Consume.Content.Id ~= SkinId then
      if self.Item_Consume.Init then
        self.Item_Consume:Init(ConsumeContent)
      elseif self.Item_Consume.OnListItemObjectSet then
        self.Item_Consume:OnListItemObjectSet(ConsumeContent)
      end
    elseif self.Item_Consume.SetIcon then
      self.Item_Consume:SetIcon(SkinIconPath)
    end
    self.Item_Consume:SetIsGot(bHasSkin)
  else
    DebugPrint("WBP_CharSkinPreview_C RefreshDetailPanel \231\154\174\232\130\164\231\188\186\229\176\145\229\155\190\230\160\135", SkinId)
  end
end

function M:OnConfirmClicked()
  local Content = self.CurRoleContent
  local CharId = Content.UnitId
  local SkinId = self.CharId2SkinId[CharId] or self.InitSkinId
  local bHasChar = Content.IsOwned == true
  local bHasSkin = self:HasSkin(CharId, SkinId)
  local ConfirmId = OBTAIN_SKIN_POP
  local CharName = GText(DataMgr.Char[CharId].CharName)
  local SkinName = GText(DataMgr.Skin[SkinId].SkinName)
  DebugPrint("gmy@WBP_CharSkinPreview_C M:OnConfirmClicked111", CharId, SkinId, bHasChar, bHasSkin, ConfirmId)
  local ConfirmText, ItemList
  if bHasSkin then
    ConfirmText = string.format(GText("UI_Consumable_Choose_Confirm_Have_Skin"), SkinName)
    ConfirmId = HAS_SKIN_ALERT_POP
    local RegainItemNum = DataMgr.Skin[SkinId].RegainItemNum
    local RegainItemId = DataMgr.Skin[SkinId].RegainItemId
    if RegainItemId and RegainItemNum then
      ItemList = {
        {
          ItemId = RegainItemId,
          ItemType = CommonConst.ItemType.Resource,
          ItemNum = RegainItemNum
        }
      }
    end
  elseif bHasChar then
    ConfirmText = string.format(GText("UI_Consumable_Choose_Confirm"), SkinName)
  else
    ConfirmText = string.format(GText("UI_Skin_CharHasnotGottenReminder"), CharName, SkinName)
  end
  DebugPrint("WBP_CharSkinPreview_C OnConfirmClicked", ConfirmId, CharId, SkinId, bHasChar, bHasSkin, ConfirmText)
  local Params = {
    CharId = CharId,
    SkinId = SkinId,
    bHasChar = bHasChar,
    bHasSkin = bHasSkin,
    SkinOptRewardId = self.SkinOptRewardId,
    ResourceId = self.ResourceId,
    Content = Content
  }
  local PopupParams = {
    RightCallbackObj = self,
    RightCallbackFunction = function()
      if self._ApplyingSkin then
        return
      end
      self._ApplyingSkin = true
      self:DoApplySkinOptReward(Params)
      self._ApplyingSkin = nil
    end,
    LeftCallbackObj = self,
    LeftCallbackFunction = function()
    end,
    CloseBtnCallbackObj = self,
    CloseBtnCallbackFunction = function()
    end,
    ShortText = ConfirmText,
    LongText = ConfirmText
  }
  PopupParams.ItemList = ItemList
  self.SecondConfirmPopup = UIManager(self):ShowCommonPopupUI(ConfirmId, PopupParams, self.EMListView_Role)
  if ConfirmId == HAS_SKIN_ALERT_POP then
    self:PopupUIGamepadSetting()
  end
end

function M:DoApplySkinOptReward(Context)
  DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward", Context.CharId, Context.SkinId, Context.SkinOptRewardId, Context.bHasSkin)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \230\151\160\230\179\149\232\142\183\229\143\150 Avatar")
    return
  end
  local ResourceId = Context.ResourceId
  local SkinOptRewardId = Context.SkinOptRewardId
  local SkinId = Context.SkinId
  local bHasSkin = Context.bHasSkin
  if not (ResourceId and SkinOptRewardId) or not SkinId then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \229\143\130\230\149\176\231\188\186\229\164\177", ResourceId, SkinOptRewardId, SkinId)
    return
  end
  local OptCfg = DataMgr.OptReward and DataMgr.OptReward[SkinOptRewardId]
  if not OptCfg or not OptCfg.Id then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \230\137\190\228\184\141\229\136\176\232\135\170\233\128\137\229\165\150\229\138\177\233\133\141\231\189\174", SkinOptRewardId)
    return
  end
  local ChooseIndex
  for idx, id in ipairs(OptCfg.Id) do
    if id == SkinId then
      ChooseIndex = idx
      break
    end
  end
  if not ChooseIndex then
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\174\232\130\164\231\180\162\229\188\149", SkinId)
    return
  end
  local OptIdxList = {ChooseIndex}
  DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \232\176\131\231\148\168RPC UseOptResourceInBag", ResourceId, ChooseIndex)
  
  local function OnFinish(ErrCode)
    DebugPrint("WBP_CharSkinPreview_C DoApplySkinOptReward \229\155\158\232\176\131\230\136\144\229\138\159", ErrCode, ResourceId, SkinId, ChooseIndex, bHasSkin)
    if ErrCode == ErrorCode.RET_SUCCESS then
      local BagMainPage = UIManager(self):GetUIObj("BagMain")
      if BagMainPage then
        BagMainPage:AddTimer(0.3, function()
          if bHasSkin then
            local RegainItemId = DataMgr.Skin[SkinId].RegainItemId
            local RegainItemNum = DataMgr.Skin[SkinId].RegainItemNum
            UIUtils.ShowGetItemPage(CommonConst.ItemType.Resource, RegainItemId, RegainItemNum, nil, nil, nil, nil, true, true)
          else
            UIUtils.ShowGetItemPage("Skin", SkinId, 1, nil, nil, nil, nil, true, true)
          end
        end)
      end
    end
    self:Close()
  end
  
  Avatar:UseOptResourceInBag(ResourceId, OptIdxList, OnFinish)
  self:Close()
end

function M:ToggleRoleListPanel()
  if self.bRoleListOpen then
    self:CloseRoleListPanel()
  else
    self:OpenRoleListPanel()
  end
end

function M:PlayRoleListAnimation()
  DebugPrint("gmy@WBP_CharSkinPreview_C M:PlayRoleListAnimation", self.Change_List)
  self:StopAllAnimations()
  if self.Change_List then
    self:PlayAnimation(self.Change_List)
  end
end

function M:PlayTabAnimation()
  DebugPrint("gmy@WBP_CharSkinPreview_C M:PlayTabAnimation", self.Change_Tab)
  self:StopAllAnimations()
  if self.Change_Tab then
    self:PlayAnimation(self.Change_Tab)
  end
end

function M:ResetFilterToDefault()
  DebugPrint("gmy@WBP_CharSkinPreview_C M:ResetFilterToDefault", self.CurrentFilterTag)
  if not self.EMListView_Filter or not self.EMListView_Filter.GetListItems then
    self.CurrentFilterTag = "ALL"
    self:FillSelectiveTileView()
    return
  end
  local Items = self.EMListView_Filter:GetListItems()
  if not Items then
    self.CurrentFilterTag = "ALL"
    self:FillSelectiveTileView()
    return
  end
  if self.CurrentFilterTag == "ALL" then
    local LenA = Items:Length()
    for i = 1, LenA do
      local It = Items[i]
      if It and "ALL" == It.Tag then
        It.IsSelected = true
        if It.UI and It.UI.SetIsSelected then
          It.UI:SetIsSelected(true)
        end
        break
      end
    end
    self:FillSelectiveTileView()
    return
  end
  local Len = Items:Length()
  local AllItem
  for i = 1, Len do
    local It = Items[i]
    if It and "ALL" == It.Tag then
      AllItem = It
      break
    end
  end
  if AllItem then
    self:OnFilterListItemClicked(AllItem)
  else
    self.CurrentFilterTag = "ALL"
    if self.FilterContentObj_All then
      self.FilterContentObj_All.IsSelected = true
      if self.FilterContentObj_All.UI and self.FilterContentObj_All.UI.SetIsSelected then
        self.FilterContentObj_All.UI:SetIsSelected(true)
      end
    end
    self:FillSelectiveTileView()
  end
end

function M:OpenRoleListPanel()
  if self.bRoleListOpen then
    return
  end
  self.bRoleListOpen = true
  self.CurState = M.State_List
  self:ApplyRoleListVisibility()
  self:ResetFilterToDefault()
  self:PlayRoleListAnimation()
  if self.CurRoleContent then
    self.TileView_Select_Role:BP_SetSelectedItem(self.CurRoleContent)
    self.TileView_Select_Role:BP_ScrollItemIntoView(self.CurRoleContent)
  end
  self.TileView_Select_Role:SetFocus()
  self.bConsumeFocused = false
end

function M:CloseRoleListPanel()
  if not self.bRoleListOpen then
    return
  end
  self.bRoleListOpen = false
  self.CurState = M.State_Tab
  self:ApplyRoleListVisibility()
  self:PlayTabAnimation()
  if self.CurRoleContent then
    if self.EMListView_Role.BP_SetSelectedItem then
      self.EMListView_Role:BP_SetSelectedItem(self.CurRoleContent)
    end
    self.EMListView_Role:BP_ScrollItemIntoView(self.CurRoleContent)
  end
  if self.EMListView_Role then
    self.EMListView_Role:SetFocus()
  end
  self.bConsumeFocused = false
end

function M:ApplyRoleListVisibility()
  DebugPrint("gmy@WBP_CharSkinPreview_C M:ApplyRoleListVisibility", self.bRoleListOpen)
  local bShow = self.bRoleListOpen
  local VisShow = ESlateVisibility.SelfHitTestInvisible
  local VisHide = ESlateVisibility.Collapsed
  self.Panel_List:SetVisibility(bShow and VisShow or VisHide)
  self.Panel_List_L:SetVisibility(bShow and VisShow or VisHide)
  self.WS_List:SetActiveWidgetIndex(bShow and 0 or 1)
  self.EMListView_Filter:SetVisibility(bShow and VisShow or VisHide)
  self.TileView_Select_Role:SetVisibility(bShow and VisShow or VisHide)
  self.EMListView_Role:SetVisibility(not bShow and VisShow or VisHide)
  if self.Key_Consume_GamePad then
    if bShow then
      self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    elseif self:IsGamepadInput() then
      self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Key_Consume_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if bShow then
    self.Btn_Confirm.IsEnabled = false
  else
    self.Btn_Confirm.IsEnabled = true
  end
  if self:IsGamepadInput() then
    if bShow then
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnAnalogValueChanged(_MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightX" == InKeyName and self.ActorController then
    local DeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
    self.ActorController:OnDragging({X = DeltaX})
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:IsGamepadInput()
  return self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
end

function M:PopupUIGamepadSetting()
  self.SecondConfirmPopup.OpenTipsButtonIndex = self.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.SecondConfirmPopup.ConfirmButtonIndex = self.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
      }
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.SecondConfirmPopup.CancelButtonIndex = self.SecondConfirmPopup:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight
      }
    },
    Desc = GText("UI_BACK")
  })
  self.SecondConfirmPopup:HideGamepadShortcut(self.SecondConfirmPopup.ConfirmButtonIndex)
  self.SecondConfirmPopup:HideGamepadShortcut(self.SecondConfirmPopup.CancelButtonIndex)
  local ItemWidget = self.SecondConfirmPopup:GetContentWidgetByName("ItemSubsize")
  if ItemWidget then
    ItemWidget.OnContentKeyDown = self.OnContentKeyDown
    local Item = ItemWidget.Item:GetChildAt(0)
    Item:BindEventOnMenuOpenChanged(self, self.ItemMenuAnchorChanged)
  end
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  local Item = self.Item:GetChildAt(0)
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    if Item then
      Item:SetFocus()
      self.Owner.ButtonBar:SetGamepadBtnKeyVisibility(false)
      self.Owner:ShowGamepadShortcut(self.Owner.ConfirmButtonIndex)
      self.Owner:ShowGamepadShortcut(self.Owner.CancelButtonIndex)
      self.Owner:HideGamepadShortcut(self.Owner.OpenTipsButtonIndex)
      IsEventHandled = true
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and Item:HasAnyFocus() then
    self.Owner.ButtonBar:SetGamepadBtnKeyVisibility(true)
    self.Owner:HideGamepadShortcut(self.Owner.ConfirmButtonIndex)
    self.Owner:HideGamepadShortcut(self.Owner.CancelButtonIndex)
    self.Owner:ShowGamepadShortcut(self.Owner.OpenTipsButtonIndex)
    self.Owner:SetFocus()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnFocusReceivedEvent()
  self.IsFromListContent = true
end

AssembleComponents(M)
return M
