require("UnLua")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Item.ItemDetails_MenuAnchor:SetLastFocusWidget(self)
  self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:Destruct()
  self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function M:Init(ItemType, ItemData, ChooseCallback, ParentWidget, ...)
  if not ItemType then
    return
  end
  if not self._components then
    if ItemType == BagCommon.OptionalItemType.Weapon then
      self._components = {
        "BluePrints.UI.WBP.Common.ItemOptional.Components.WBP_Weapon_Item_Comp_C"
      }
    elseif ItemType == BagCommon.OptionalItemType.Avatar then
      self._components = {
        "BluePrints.UI.WBP.Common.ItemOptional.Components.WBP_Char_Item_Comp_C"
      }
    elseif ItemType == BagCommon.OptionalItemType.Pet then
      self._components = {
        "BluePrints.UI.WBP.Common.ItemOptional.Components.WBP_Pet_Item_Comp_C"
      }
    end
    AssembleComponents(self)
  end
  self.ChooseCallback = ChooseCallback
  self.ParentWidget = ParentWidget
  self.ItemType = ItemType
  self.ChooseDataInfo = {
    ResourceId = ItemData.ResourceId,
    OptionalId = ItemData.OptionalId,
    ChooseId = ItemData.StuffId,
    ChooseIndex = ItemData.Index,
    ChooseName = ItemData.StuffName,
    ChooseWidget = self
  }
  self.Content = ItemData
  self:InitCommonView(ItemData)
  if ItemType == BagCommon.OptionalItemType.Weapon then
    self:InitSpecialView(ItemData, ...)
  elseif ItemType == BagCommon.OptionalItemType.Avatar then
    self:InitSpecialView(ItemData, ...)
  elseif ItemType == BagCommon.OptionalItemType.Pet then
    self:InitSpecialView(ItemData, ...)
  end
end

function M:InitCommonView(ItemData)
  self.Text_Name:SetText(ItemData.StuffName)
  if ItemData.AttrIcon then
    if type(ItemData.AttrIcon) == "string" then
      self.Image_Element:SetBrushResourceObject(LoadObject(ItemData.AttrIcon))
    else
      self.Image_Element:SetBrushResourceObject(ItemData.AttrIcon)
    end
    self.Image_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local StarNum = ItemData.Rarity
  for i = 1, BagCommon.RarityColorInfo.Yellow do
    local StarWidget = self["Star_" .. i]
    if i <= StarNum then
      StarWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      StarWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self:SetIcon(ItemData.StuffIcon)
  self:SetRarity(ItemData.Rarity)
  self.Btn_Check:BindEventOnClicked(self, self.OnBtnCheckClicked)
  self.Button_Area.OnClicked:Add(self, self.OnBtnChooseClicked)
  self.Btn_Check.AudioEventPath = "event:/ui/common/click_btn_small"
end

function M:SetIcon(IconPath, bAsyncLoadIcon)
  if bAsyncLoadIcon then
    self:LoadTextureAsync(IconPath, function(Texture)
      if not Texture then
        Texture = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
      end
      if Texture then
        local __IconDynaMaterial = self.Item.Item_BG:GetDynamicMaterial()
        if __IconDynaMaterial then
          __IconDynaMaterial:SetTextureParameterValue("IconMap", Texture)
        end
      end
    end, "LoadIcon")
  else
    assert(IconPath, "\233\129\147\229\133\183\230\161\134\228\188\160\229\133\165Icon\232\183\175\229\190\132\228\184\186\231\169\186")
    local Icon = LoadObject(IconPath)
    if not Icon then
      Icon = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
      DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
    end
    local DynamicMaterial = self.Item.Item_BG:GetDynamicMaterial()
    if not IsValid(DynamicMaterial) then
      DebugPrint("ZDX_DynamicMaterial\228\184\141\229\144\136\230\179\149")
    end
    DynamicMaterial:SetTextureParameterValue("IconMap", Icon)
  end
end

function M:SetSelected(IsSelected)
  self.IsSelected = IsSelected
  self.Item:StopAllAnimations()
  if IsSelected then
    self.Item:PlayAnimation(self.Item.Click)
    self:PlayAnimation(self.Click)
    self.Item_Select:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Item:PlayAnimation(self.Item.Normal)
    self.Item_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetRarity(Rarity)
  self.Item:SetRarity(Rarity)
end

function M:OnAddedToFocusPath(InFocusEvent)
  if UIUtils.IsGamepadInput() then
    self:OnBtnChooseHovered()
    if self.ParentWidget then
      self.ParentWidget:ScrollToTargetItem(self)
    end
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if UIUtils.IsGamepadInput() then
    self:OnBtnChooseUnHovered()
  end
end

function M:CheckIsInHovered()
  return self.IsInHovered
end

function M:OnMenuOpenChanged(bIsOpen)
  self.IsShowTips = bIsOpen
  if self.Event_OnMenuOpenChanged then
    self.Event_OnMenuOpenChanged(self.ParentWidget, bIsOpen)
  end
end

function M:InitSpecialView(ItemData, ...)
end

function M:OnBtnCheckClicked()
  if self.ParentWidget then
    self.ParentWidget:CloseDialog()
  end
  if self.ItemType == BagCommon.OptionalItemType.Weapon then
    local BagMainPage = UIManager(self):GetUIObj("BagMain")
    UIManager(self):LoadUINew("ArmoryDetail", {
      OnCloseDelegate = {
        BagMainPage,
        BagMainPage.ReClickGoToUseConsume
      },
      PreviewWeaponIds = {
        self.Content.StuffId
      },
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      bHideBoxBtn = true,
      bNoEndCamera = true,
      bHideCharAppearance = true,
      bHideWeaponAppearance = true
    })
  elseif self.ItemType == BagCommon.OptionalItemType.Avatar then
    local BagMainPage = UIManager(self):GetUIObj("BagMain")
    UIManager(self):LoadUINew("ArmoryDetail", {
      OnCloseDelegate = {
        BagMainPage,
        BagMainPage.ReClickGoToUseConsume
      },
      PreviewCharIds = {
        self.Content.StuffId
      },
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      bHideBoxBtn = true,
      bNoEndCamera = true,
      bHideCharAppearance = true,
      bHideWeaponAppearance = true
    })
  elseif self.ItemType == BagCommon.OptionalItemType.Pet then
    local BagMainPage = UIManager(self):GetUIObj("BagMain")
    UIManager(self):LoadUINew("ArmoryDetail", {
      OnCloseDelegate = {
        BagMainPage,
        BagMainPage.ReClickGoToUseConsume
      },
      PreviewPetIds = {
        self.Content.StuffId
      },
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      bHideBoxBtn = true,
      bNoEndCamera = true,
      bHideCharAppearance = true,
      bHideWeaponAppearance = true
    })
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  self:OnBtnChooseHovered()
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self:OnBtnChooseUnHovered()
end

function M:OnBtnChooseClicked()
  local bNewSelectState = not self.IsSelected
  self:SetSelected(bNewSelectState)
  local CallbackData
  if bNewSelectState then
    CallbackData = self.ChooseDataInfo
  end
  if type(self.ChooseCallback) == "function" then
    self.ChooseCallback(self.ParentWidget, bNewSelectState, CallbackData)
  end
  local ItemType = self.ItemType
  if self.ItemType == BagCommon.OptionalItemType.Avatar then
    ItemType = "Char"
  end
  AudioManager(self):PlayItemSound(self, self.ChooseDataInfo.ChooseId, "Click", ItemType)
  return true
end

function M:OnBtnChooseHovered()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsSelected then
    return
  end
  if not self.IsInHovered then
    self.Item:StopAllAnimations()
    self.Item:PlayAnimation(self.Item.Hover)
  end
  self.IsInHovered = true
end

function M:OnBtnChooseUnHovered()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsSelected then
    return
  end
  if self.IsInHovered then
    self.Item:StopAllAnimations()
    self.Item:PlayAnimation(self.Item.UnHover)
  end
  self.IsInHovered = false
end

return M
