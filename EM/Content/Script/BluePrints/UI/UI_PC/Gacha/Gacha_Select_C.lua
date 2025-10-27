require("UnLua")
local G = Class("BluePrints.UI.BP_UIState_C")

function G:Construct()
  self.Text_ChooseTipsTitle:SetText(GText("UI_Gacha_Start_Select"))
  self.Text_Choose_TipsDesc:SetText(GText("UI_Gacha_Start_Warning"))
  self.Btn_TryOut:SetText(GText("UI_Gacha_TrialPortal"))
  self.Btn_TryOut:SetDefaultGamePadImg("X")
  self.Btn_TryOut:BindEventOnClicked(self, self.OnBtnTryOutClicked)
  self.Btn_Yes:SetText(GText("UI_Gacha_Confirm_Selection"))
  self.Btn_Yes:SetDefaultGamePadImg("A")
  self.Btn_Yes:BindEventOnClicked(self, self.OnBtnConfirmClicked)
  self.Btn_Close:Init("Close", self, self.OnBtnCloseClicked)
  self.Com_MidKeyTips:UpdateKeyInfo({
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnBtnCloseClicked,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  })
  self.Com_MidKeyTips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if UIUtils.IsMobileInput() then
    self.Com_MidKeyTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.List_ChooseAvatar.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
end

function G:Init(Parent)
  self.Parent = Parent
  self.NowSelectGachaId = Parent.NowGachaId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GachaPool = Avatar.GachaPool[Parent.NowGachaId]
  self.GachaSelfSelect = GachaPool.SelfSelect
  self.NowSelectTargetId = nil
  self.CurContent = nil
  self:InitChooseTipTitle()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:UnbindAllFromAnimationFinished(self.In)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/trail_role_select_panel_show", "GachaSelect", nil)
  self.List_ChooseAvatar:SetFocus()
  self:InitListSelect()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self.Parent.CantClick = true
end

function G:InitChooseTipTitle()
  local ChooseTipTitleSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.ChooseTipTitle)
  if ChooseTipTitleSlot then
    local Position = ChooseTipTitleSlot:GetPosition()
    if self.Parent.IsPCPlatform then
      Position.Y = self.Position_ChooseTipTitle_Y_PC
    else
      Position.Y = self.Position_ChooseTipTitle_Y_M
    end
    ChooseTipTitleSlot:SetPosition(Position)
  end
end

function G:InitListSelect()
  local GachaInfo = DataMgr.GachaSelect[self.NowSelectGachaId]
  if not GachaInfo or not GachaInfo.ItemType then
    return
  end
  self.List_ChooseAvatar:ClearListItems()
  local ItemType = GachaInfo.ItemType
  local SelectContent = GachaInfo.ItemId[1]
  if 0 ~= self.GachaSelfSelect then
    SelectContent = self.GachaSelfSelect
  end
  for key, value in ipairs(GachaInfo.ItemId) do
    local TargetInfo, TargetRarity, TargetName, TargetType, TargetTypeIcon
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    if ItemType == CommonConst.GachaCharType then
      TargetInfo = DataMgr.Char[value]
      TargetRarity = TargetInfo.CharRarity
      TargetName = TargetInfo.CharName
      TargetType = "Character"
      local Attribute = DataMgr.BattleChar[value].Attribute
      local IconName = "Armory_" .. Attribute
      TargetTypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
      Content.OnClickCheckBtnEvent = {
        Callback = self.OpenShowCharDetail,
        Obj = self,
        Params = {value},
        KeyName = UIConst.GamePadKey.SpecialLeft,
        CreateInfo = {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "View"}
          },
          Desc = GText("UI_Controller_Check")
        }
      }
    elseif ItemType == CommonConst.GachaWeaponType then
      TargetInfo = DataMgr.Weapon[value]
      TargetRarity = TargetInfo.WeaponRarity
      TargetName = TargetInfo.WeaponName
      TargetType = "Weapon"
      for _, Tag in pairs(TargetInfo.WeaponTag) do
        local TagInfo = DataMgr.WeaponTag[Tag]
        if TagInfo and TagInfo.WeaponTagfilter then
          TargetTypeIcon = TagInfo.Icon
          break
        end
      end
      Content.OnClickCheckBtnEvent = {
        Callback = self.OpenShowWeaponDetail,
        Obj = self,
        Params = {value}
      }
    else
      return
    end
    Content.Id = value
    Content.Index = key
    Content.IsSelect = false
    if SelectContent == value then
      Content.IsSelect = true
      self.CurContent = Content
    end
    Content.Name = TargetName
    Content.ItemIcon = TargetInfo.Icon
    Content.TypeIcon = TargetTypeIcon
    Content.Type = TargetType
    Content.Rarity = TargetRarity
    Content.ParentWidget = self
    Content.OnMouseButtonUpEvent = {
      Callback = self.OnGachaSelectListItemClicked,
      Obj = self,
      Params = {Content}
    }
    self.List_ChooseAvatar:AddItem(Content)
  end
  self.List_ChooseAvatar:ScrollIndexIntoView(self.CurContent.Index - 1)
  self:AddTimer(0.1, function()
    if #GachaInfo.ItemId <= CommonConst.GachaSelectCount then
      self.List_ChooseAvatar:DisableScroll(true)
    else
      self.List_ChooseAvatar:DisableScroll(false)
    end
    self.List_ChooseAvatar:RequestPlayEntriesAnim()
    self:OnGachaSelectListItemClicked(self.CurContent)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.List_ChooseAvatar:NavigateToIndex(self.CurContent.Index - 1)
    end
  end)
end

function G:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and SelectItem.Entry then
    SelectItem.Entry:OnMouseButtonDown()
    SelectItem.Entry:OnMouseButtonUp()
  end
end

function G:OnGachaSelectListItemClicked(Content)
  if self.CurContent and self.CurContent ~= Content then
    self.CurContent.Entry:SetSelected(false)
    self.CurContent.Entry:SetCheckBtnKeyTipVisible(false)
  end
  self.CurContent = Content
  self.CurContent.Entry:SetSelected(true)
  self.CurContent.Entry:SetCheckBtnKeyTipVisible(true)
  self.NowSelectTargetId = Content.Id
  if self.GachaSelfSelect == self.NowSelectTargetId then
    self.Btn_Yes:ForbidBtn(true)
  else
    self.Btn_Yes:ForbidBtn(false)
  end
end

function G:OpenShowCharDetail(CharId)
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {CharId},
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true
  })
end

function G:OpenShowWeaponDetail(WeaponId)
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = {WeaponId},
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true
  })
end

function G:OnParentUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if UIUtils.IsMobileInput() then
    return
  end
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function G:InitGamepadView()
  self.List_ChooseAvatar:SetFocus()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.List_ChooseAvatar:NavigateToIndex(self.CurContent.Index - 1)
  end
  self.Com_MidKeyTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Com_MidKeyTips:UpdateKeyInfoNew({
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnBtnCloseClicked,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  })
  self.Btn_Close:SetVisibility(ESlateVisibility.Collapsed)
end

function G:InitKeyboardView()
  if UIUtils.IsMobileInput() then
    self.Com_MidKeyTips:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Com_MidKeyTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Com_MidKeyTips:UpdateKeyInfoNew({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnBtnCloseClicked,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  end
  self.Btn_Close:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function G:OnParentKeyDown(MyGeometry, InKeyEvent)
  if self.CantClick == true then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:OnBtnCloseClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self:OnBtnTryOutClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom and self.GachaSelfSelect ~= self.NowSelectTargetId then
    self:OnBtnConfirmClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function G:OnBtnTryOutClicked()
  if not self.CurContent then
    DebugPrint("----jzn---\229\189\147\229\137\141\230\156\170\233\128\137\230\139\169\228\187\187\228\189\149\232\167\146\232\137\178---OnBtnTryOutClicked--")
    return
  end
  local Index = self.CurContent.Index
  local GachaInfo = DataMgr.GachaSelect[self.NowSelectGachaId]
  local TrialId = GachaInfo.CharTrialId[Index]
  if TrialId then
    local TrialDungeonId = DataMgr.CharTrial[TrialId].TrialDungeonId
    local Avatar = GWorld:GetAvatar()
    Avatar:EnterCharTrial(nil, TrialDungeonId, TrialId)
  end
end

function G:OnBtnConfirmClicked()
  if self.NowSelectTargetId then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      self.CantClick = true
      
      local function SelectGachaCallback(Ret)
        if Ret == ErrorCode.RET_SUCCESS then
          self.CantClick = false
          self.Btn_Yes:ForbidBtn(true)
          self.GachaSelfSelect = self.NowSelectTargetId
          local ErrorText = "UI_Gacha_Switch_Success"
          UIManager(self):ShowUITip("CommonToastMain", GText(ErrorText), 1.5)
          self:OnBtnCloseClicked()
          self.Parent:RefreshSelectedGachaPool()
        elseif DataMgr.ErrorCode[Ret] then
          self.CantClick = false
          UIManager(self):ShowError(Ret, nil, UIConst.Tip_CommonToast)
        else
          self.CantClick = false
          local ErrorText = "Unknown_Error"
          UIManager(self):ShowUITip("CommonToastMain", GText(ErrorText), 1.5)
        end
      end
      
      Avatar:SetGachaSelfSelect(SelectGachaCallback, self.NowSelectGachaId, self.NowSelectTargetId)
    end
  else
    DebugPrint("----jzn---\229\189\147\229\137\141\230\156\170\233\128\137\230\139\169\228\187\187\228\189\149\232\167\146\232\137\178---OnBtnConfirmClicked--")
  end
end

function G:OnBtnCloseClicked()
  if self.CantClick then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:PlayOutAnim()
end

function G:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "GachaSelect", {ToEnd = 1})
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnClickBtnClose
  })
end

function G:OnClickBtnClose()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Parent:SetFocus()
  self.Parent.CantClick = false
end

return G
