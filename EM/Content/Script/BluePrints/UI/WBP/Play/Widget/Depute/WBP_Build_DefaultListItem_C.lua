require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.SquadInfo = Content.SquadInfo
  self.Parent = Content.Parent
  self.Content.UI = self
  self.IsSelected = false
  self:InitItemContent()
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:InitItemContent()
  self.Selected:SetRenderOpacity(0)
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  if not self.SquadInfo then
    self.IsComMissing = false
    self.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  self.Switch_Type:SetActiveWidgetIndex(0)
  if self.SquadInfo.Name == "" or not self.SquadInfo.Name then
    self.Text_Name:SetText(GText("Squad_DefaultName1"))
  else
    self.Text_Name:SetText(self.SquadInfo.Name)
  end
  
  local function SetEmptyIcon(Widget, EmptyMethod, Type)
    if Widget and Widget[EmptyMethod] then
      Widget[EmptyMethod](Widget, nil, Type, IsEmptyRed)
    end
  end
  
  local function SetIcon(Widget, Info)
    if not Widget or not Info then
      return
    end
    local DataEntry = Info.DataTable and Info.DataTable[Info.Id]
    if Info.Id and DataEntry then
      local IconPath = DataEntry.Icon
      if Info.IsMiniIcon then
        local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
        local PhantomGuideIconImg = DataMgr.BattleChar[Info.Id].GuideIconImg
        local NormalIconName = "T_Normal_" .. PhantomGuideIconImg
        IconPath = MiniIconPath .. NormalIconName .. "." .. NormalIconName
      end
      Widget[Info.SetMethod](Widget, IconPath, Info.Level)
    else
      SetEmptyIcon(Widget, Info.EmptyMethod, Info.Type)
    end
  end
  
  local SquadIcons = {
    {
      Widget = self.Character,
      DataTable = DataMgr.Char,
      Id = self.SquadInfo.CharId,
      SetMethod = "SetCharIcon",
      EmptyMethod = "SetEmptyIcon",
      Level = self.SquadInfo.CharLevel
    },
    {
      Widget = self.Melee,
      DataTable = DataMgr.Weapon,
      Id = self.SquadInfo.MeleeWeaponId,
      SetMethod = "SetWeaponIcon",
      EmptyMethod = "SetEmptyIcon",
      Level = self.SquadInfo.MeleeWeaponLevel
    },
    {
      Widget = self.Range,
      DataTable = DataMgr.Weapon,
      Id = self.SquadInfo.RangedWeaponId,
      SetMethod = "SetWeaponIcon",
      EmptyMethod = "SetEmptyIcon",
      Level = self.SquadInfo.RangedWeaponLevel
    },
    {
      Widget = self.Pet,
      DataTable = DataMgr.Pet,
      Id = self.SquadInfo.PetId,
      SetMethod = "SetPetIcon",
      EmptyMethod = "SetEmptyPetIcon",
      Level = self.SquadInfo.PetLevel
    },
    {
      Widget = self.Phantom01,
      DataTable = DataMgr.Char,
      Id = self.SquadInfo.Phantom1Id,
      SetMethod = "SetCharIcon",
      EmptyMethod = "SetEmptyIcon",
      Type = "Phantom",
      IsMiniIcon = true
    },
    {
      Widget = self.Phantom02,
      DataTable = DataMgr.Char,
      Id = self.SquadInfo.Phantom2Id,
      SetMethod = "SetCharIcon",
      EmptyMethod = "SetEmptyIcon",
      Type = "Phantom",
      IsMiniIcon = true
    },
    {
      Widget = self.Weapon01,
      DataTable = DataMgr.Weapon,
      Id = self.SquadInfo.PhantomWeapon1Id,
      SetMethod = "SetWeaponIcon",
      EmptyMethod = "SetEmptyIcon",
      Type = "Weapon"
    },
    {
      Widget = self.Weapon02,
      DataTable = DataMgr.Weapon,
      Id = self.SquadInfo.PhantomWeapon2Id,
      SetMethod = "SetWeaponIcon",
      EmptyMethod = "SetEmptyIcon",
      Type = "Weapon"
    }
  }
  for _, Info in ipairs(SquadIcons) do
    SetIcon(Info.Widget, Info)
  end
  if self.SquadInfo.Phantom1Id and not self.SquadInfo.PhantomWeapon1Id then
    self.Weapon01:SetDeficiencyIcon()
    self.Panel_Lack01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Lack01:SetText(GText("UI_Squad_Miss_Weapon"))
    self.Phantom01:CharIconGray()
  else
    self.Panel_Lack01:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.SquadInfo.Phantom2Id and not self.SquadInfo.PhantomWeapon2Id then
    self.Weapon02:SetDeficiencyIcon()
    self.Panel_Lack02:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Lack02:SetText(GText("UI_Squad_Miss_Weapon"))
    self.Phantom02:CharIconGray()
  else
    self.Panel_Lack02:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.SquadInfo.WheelIndex then
    self.Roulette:SetWheelIcon(nil, self.SquadInfo.WheelIndex)
  else
    self.Roulette:SetWheelIcon(nil, 1)
  end
  if self.SquadInfo.Index == self.Parent.CurrentSquad then
    self.Parent.CurSelectContent = self.Content
    self.IsSelected = true
    self:SetIsSelected(true, true)
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  else
    self:SetIsSelected(false)
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
  self.IsComMissing = not self.SquadInfo.CharId or not self.SquadInfo.MeleeWeaponId or not self.SquadInfo.RangedWeaponId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not (self.SquadInfo.PhantomWeapon1Id and self.SquadInfo.PhantomWeapon2Id) or not self.SquadInfo.PetId then
    local Info = {}
    if not self.SquadInfo.PhantomWeapon1Id then
      Info.PhantomWeapon1 = ""
    end
    if not self.SquadInfo.PhantomWeapon2Id then
      Info.PhantomWeapon2 = ""
    end
    if not self.SquadInfo.PetId then
      Info.Pet = 0
    end
    Avatar:UpdateSquad(nil, self.SquadInfo.Index, Info)
  end
end

function M:SetIsSelected(IsSelected, IsAutoSelected)
  if self.IsSelected == IsSelected or IsAutoSelected then
    return
  end
  self.IsSelected = IsSelected
  if IsSelected then
    if self.IsComMissing then
      self:StopAllAnimations()
      self:PlayAnimation(self.Normal)
      return
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
    if self.SquadInfo then
      self.Parent:UpdateCurrentDungeonSquad(self.SquadInfo.Index)
      self:UpdatKeyDisplay("Selected")
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_Squad_ChangeSuccess_Tips")
      self:StopAllAnimations()
      self:PlayAnimation(self.Click)
    end
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnMouseButtonUp(MyGeometry, InTouchEvent)
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return self:OnMouseButtonDown(MyGeometry, InTouchEvent)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if not self.IsComMissing and not self.IsSelected then
    self:StopAllAnimations()
    self:PlayAnimation(self.Press)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:ShowMissingComponentHint()
  if not self.SquadInfo then
    local SquadMainUI = UIManager(self):GetUIObj("SquadMainUINew")
    if SquadMainUI then
      SquadMainUI.IsFromDungeonPage = true
      PageJumpUtils:JumpToTargetPage("SquadMainUINew")
      SquadMainUI:JumpToAddSquad()
    else
      PageJumpUtils:JumpToTargetPage("SquadMainUINew", nil, true)
    end
    return
  end
  if self.IsComMissing then
    if not self.SquadInfo.CharId then
      self.Character:PlayAnimation(self.Character.FlashRed)
    end
    if not self.SquadInfo.MeleeWeaponId then
      self.Melee:PlayAnimation(self.Melee.FlashRed)
    end
    if not self.SquadInfo.RangedWeaponId then
      self.Range:PlayAnimation(self.Range.FlashRed)
    end
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_Squad_Miss_Challenge")
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.IsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
  self:UpdatKeyDisplay("NotSelected")
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if self.IsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Unhover)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonLeft then
    self.Parent:OnGoToSystem()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:UpdatKeyDisplay(FocusTypeName)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  if "NotSelected" == FocusTypeName then
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("ModFilter_Confirm"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  elseif "Selected" == FocusTypeName then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  end
end

return M
