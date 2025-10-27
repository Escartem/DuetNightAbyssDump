require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Lv:SetText(GText("UI_LEVEL_NAME"))
  self:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnPreviewKeyDown = Content.OnPreviewKeyDown
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  Content.Widget = self
  if Content.Type == CommonConst.DataType.Weapon then
    self:SetIcon(Content.Icon or Content.IconPath, 1)
  else
    self:SetIcon(Content.Icon or Content.IconPath, 0)
  end
  self:SetLevel(Content.Level)
  self:SetInGear(Content.bInGear)
  self:SetWeaponPhantomIcon(Content.Uuid)
  self:SetRarity(Content.Rarity)
  self:HideRarity(Content.bHideRarity)
  self:StopAllAnimations()
  self:FlushAnimations()
  self.IsSelect = Content.IsSelect
  self:SetSelected(Content.IsSelect)
  self:SetReddot(Content.RedDotType)
  self:SetIsPremium(Content.IsPremium)
  self:ShowShadow(Content.bShadowed)
  self:SetPetStar(Content)
  self:SetIsLocked(Content.LockType)
  self:SetIsGot(Content.GotType)
  self:SetHideLevelPanel(Content.bHideLevelPanel)
  self:SetCharSkinPreViewItemIsLocked(Content.CharSkinPreViewLockType)
  self.OwningList = UE4.UUserListEntryLibrary.GetOwningListView(self)
  if self.OwningList then
    self.OwningList.BP_OnItemClicked:Remove(self, self.OnOwningListItemClicked)
    self.OwningList.BP_OnItemClicked:Add(self, self.OnOwningListItemClicked)
  end
end

function M:SetIsLocked(LockType)
  if 2 == LockType then
    self:StopAnimation(self.Lock_Normal)
    self:PlayAnimation(self.Lock)
  else
    self:StopAnimation(self.Lock)
    self:PlayAnimation(self.Lock_Normal)
  end
end

function M:SetCharSkinPreViewItemIsLocked(CharSkinPreViewLockType)
  if not CharSkinPreViewLockType then
    return
  end
  self:SetIsLocked(CharSkinPreViewLockType)
end

function M:SetIsGot(bGotType)
  DebugPrint("gmy@WBP_Armory_TabItem01_C M:SetIsGot", bGotType)
  if bGotType then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Icon_Got:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Icon_Got:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetHideLevelPanel(bHide)
  if bHide then
    self.Panel_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:ShowShadow(bShow)
  if bShow then
    self.Img_Shadow:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Img_Shadow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIcon(Icon, SwitcherIdx)
  SwitcherIdx = SwitcherIdx or 0
  self.WidgetSwitcher_Head:SetActiveWidgetIndex(SwitcherIdx)
  local ImgWidget = self.WidgetSwitcher_Head:GetChildAt(SwitcherIdx)
  local IconDynaMaterial = ImgWidget:GetDynamicMaterial()
  if IconDynaMaterial then
    if type(Icon) == "string" then
      IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(Icon))
    else
      IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    end
  end
end

function M:SetRarity(Rarity)
  local RariryName = UIConst.RarityColorName[Rarity]
  local Path = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Corner_" .. RariryName .. ".T_Armory_Corner_" .. RariryName
  self.Quality_Bar:SetBrushResourceObject(LoadObject(Path))
end

function M:HideRarity(bHideRarity)
  self.Quality_Bar:SetVisibility(bHideRarity and UIConst.VisibilityOp.Collapsed or UIConst.VisibilityOp.Visible)
end

function M:SetInGear(IsEquipped)
  if IsEquipped then
    self.Image_Equipped:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Equipped:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetLevel(Level)
  if not Level then
    self.Text_Lv:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_Level:SetText("")
  else
    self.Text_Lv:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Level:SetText(Level)
  end
end

function M:SetReddot(RedDotType)
  if RedDotType == UIConst.RedDotType.CommonRedDot then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if RedDotType == UIConst.RedDotType.NewRedDot then
      self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:SetWeaponPhantomIcon(_Uuid)
  local Avatar = ArmoryUtils:GetAvatar()
  local Uuid = _Uuid
  local Weapon = Uuid and Avatar.Weapons[Uuid]
  if not Weapon then
    Uuid = CommonUtils.Str2ObjId(_Uuid)
    Weapon = Avatar.Weapons[Uuid]
  end
  local AssisterId = Weapon and Weapon.AssisterId
  if AssisterId and DataMgr.Resource[AssisterId] then
    local CharId = DataMgr.Resource[AssisterId].UseParam
    if CharId and DataMgr.BattleChar[CharId] then
      local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
      local IconImage = LoadObject(MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'")
      self.Image_Phantom:SetBrushResourceObject(IconImage)
      self.Image_Phantom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Image_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Image_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:SetIsPremium(IsPremium)
  if IsPremium then
    self.PetEffect:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:PlayAnimationForward(self.PetLight)
  else
    self.PetEffect:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:PlayAnimationReverse(self.PetLight)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:SetSelected(IsSelect)
  self.IsSelect = IsSelect
  if IsSelect then
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  else
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.IsSelect then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnMouseLeave(MouseEvent)
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimationReverse(self.Hover)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self._OnPreviewKeyDown == nil then
    return UIUtils.Unhandled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  return self._OnPreviewKeyDown(self.Owner, InKeyName)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.IsSelect then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self:PlayAnimation(self.Press)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.IsSelect then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if self:IsHovered() then
    self:OnMouseEnter()
  else
    self:PlayAnimation(self.Normal)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnOwningListItemClicked(Content)
  if not self.Content or Content ~= self.Content then
    return
  end
  AudioManager(self):PlayItemSound(self, self.Content.UnitId, "Click", self.Content.Type)
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:SetPetStar(Content)
  if Content.ItemType ~= "Pet" then
    self.Panel_PetStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local BreakNum = Content.BreakNum
  if not BreakNum or 0 == BreakNum then
    self.Panel_PetStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.Panel_PetStar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local totalStars = 3
  for i = 1, totalStars do
    local starWidget = self["PetStar_" .. i]
    if starWidget then
      if BreakNum > i - 1 then
        starWidget.PetStar:SetActiveWidgetIndex(1)
      else
        starWidget.PetStar:SetActiveWidgetIndex(0)
      end
    end
  end
end

return M
