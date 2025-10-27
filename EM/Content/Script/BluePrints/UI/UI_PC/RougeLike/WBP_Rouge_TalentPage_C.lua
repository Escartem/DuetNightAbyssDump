local WBP_Rouge_TalentPage_C = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_TalentPage_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Rouge_TalentPage_C:Destruct()
  AudioManager(self):StopSound(self, "TalentPageOpenSound")
  self:ClearListenEvent()
end

function WBP_Rouge_TalentPage_C:SetInfo()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.RemainingTalentPoint = Avatar:GetCurrentRougeLikeTalent()
  else
    self.RemainingTalentPoint = 0
  end
  self.RougeTalent = DataMgr.RougeLikeTalent
  self.Lines = {}
  self.ReddotCondition = {}
  self.ReachableTable = {}
  local AllActiveTalent = {}
  if Avatar then
    AllActiveTalent = Avatar.RougeLike.Talent
  end
  self.BranchInfo = {}
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if not self.BranchInfo[RougeTalentInfo.Branch] then
      self.BranchInfo[RougeTalentInfo.Branch] = {}
      self.BranchInfo[RougeTalentInfo.Branch].Branch = RougeTalentInfo.Branch
      self.BranchInfo[RougeTalentInfo.Branch].BranchTalentNum = 0
      self.BranchInfo[RougeTalentInfo.Branch].ActivedBranchTalentNum = 0
    end
    if self.BranchInfo[RougeTalentInfo.Branch] then
      self.BranchInfo[RougeTalentInfo.Branch].BranchTalentNum = self.BranchInfo[RougeTalentInfo.Branch].BranchTalentNum + 1
      if AllActiveTalent[TalentId] then
        self.BranchInfo[RougeTalentInfo.Branch].ActivedBranchTalentNum = self.BranchInfo[RougeTalentInfo.Branch].ActivedBranchTalentNum + 1
      end
    end
  end
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if RougeTalentInfo.UnLock then
      for _, PostTalentId in pairs(RougeTalentInfo.UnLock) do
        if not self.Lines[PostTalentId] then
          self.Lines[PostTalentId] = {}
        end
        self.Lines[PostTalentId][TalentId] = 1
      end
    end
  end
  self.AllActiveTalent = {}
  if Avatar then
    self.AllActiveTalent = Avatar.RougeLike.Talent
  end
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if not self.ReddotCondition[RougeTalentInfo.Branch] and self:CheckReachable(TalentId) and not self.AllActiveTalent[TalentId] then
      self.ReddotCondition[RougeTalentInfo.Branch] = true
    end
  end
  local BranchInfoTable = {}
  for _, Info in pairs(self.BranchInfo) do
    table.insert(BranchInfoTable, Info)
  end
  table.sort(BranchInfoTable, function(a, b)
    return a.Branch < b.Branch
  end)
  for i = 1, 4 do
    if BranchInfoTable[i] then
      self["Entrance_0" .. i]:Init(self, self.ReddotCondition[BranchInfoTable[i].Branch], BranchInfoTable[i].Branch, BranchInfoTable[i].BranchTalentNum, BranchInfoTable[i].ActivedBranchTalentNum, 1 == i)
    end
    self["Entrance_0" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Rouge_TalentPage_C:CheckReachable(TalentId)
  if 1 == self.ReachableTable[TalentId] then
    return true
  elseif 0 == self.ReachableTable[TalentId] then
    return false
  end
  if self.AllActiveTalent[TalentId] then
    self.ReachableTable[TalentId] = 1
    return true
  end
  if self.Lines[TalentId] then
    for FrontTalentId, _ in pairs(self.Lines[TalentId]) do
      if not self:CheckReachable(FrontTalentId) then
        self.ReachableTable[TalentId] = 0
        return false
      end
    end
  end
  if self.RemainingTalentPoint >= self.RougeTalent[TalentId].LevelUpPoint then
    self.ReachableTable[TalentId] = 1
    return true
  else
    self.ReachableTable[TalentId] = 0
    return false
  end
end

function WBP_Rouge_TalentPage_C:InitTable()
  self:SetInfo()
  self.TabConfigData = {
    TitleName = GText("System_Name_Rouge_TalentTree"),
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  local ResoucesTab = DataMgr.SystemUI.RougeTalentPage.TabCoin
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true, self)
end

function WBP_Rouge_TalentPage_C:OpenTalentMenu(BranchId)
  if not self:IsAnyAnimationPlaying() then
    self.SecondaryPageName = "RougeTalentMenu"
    local TalentMenu = self.Root:OpenSubUI("RougeTalentMenu")
    self.Root.IsOpenSelectLevel = false
    TalentMenu:InitTable(BranchId)
  end
end

function WBP_Rouge_TalentPage_C:OnReturnKeyDown()
  if not self:IsAnyAnimationPlaying() then
    local WidgetUI = self.Root:OpenSubUI("RougeMain")
    self.Root.IsOpenSelectLevel = false
    WidgetUI:InitTable()
  end
end

function WBP_Rouge_TalentPage_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  return IsEventHandled
end

function WBP_Rouge_TalentPage_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_TalentPage_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_TalentPage_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_TalentPage_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self.IsInSelectState = false
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_TalentPage_C:InitGamepadView()
  if UIUtils.HasAnyFocus(self) then
    self.Entrance_01.Btn_Click:SetFocus()
  end
end

function WBP_Rouge_TalentPage_C:InitKeyboardView()
end

function WBP_Rouge_TalentPage_C:InitWidgetInfoInGamePad()
end

function WBP_Rouge_TalentPage_C:SwitchIn()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/strengthen_open", "TalentPageOpenSound", nil)
end

function WBP_Rouge_TalentPage_C:SwitchOut()
  AudioManager(self):SetEventSoundParam(self, "TalentPageOpenSound", {ToEnd = 1})
end

return WBP_Rouge_TalentPage_C
