require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.CoinItem = {
    self.ConsumeItem01,
    self.ConsumeItem02
  }
  self.Btn_Click.OnClicked:Add(self, self.OpenJumpShop)
  self.Btn_Tips:BindEventOnClicked(self, self.OpenJumpShopTips)
  self.Btn_Tips:TryOverrideSoundFunc(function()
  end)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  local Key_RewardDesc_Params = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText
      }
    }
  }
  self.Key_Tips:CreateCommonKey(Key_RewardDesc_Params)
  self:AddInputMethodChangedListen()
end

function M:OpenJumpShop()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  PageJumpUtils:JumpToTargetPageByJumpId(self.JumpShopData.InterfaceJumpId)
end

function M:OpenJumpShopTips()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.JumpShopData.RegionPointId then
    local SubRegionId = DataMgr.RegionPoint[self.JumpShopData.RegionPointId].SubRegion
    local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
    if RegionId then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:LoadUINew("LevelMapMain", false, RegionId, "RegionPoint", self.JumpShopData.RegionPointId)
      UIManager:GetUIObj("LevelMapMain").RealWildMap.CheckBreak = true
    end
  end
end

function M:OnListItemObjectSet(Content)
  self.JumpShopData = Content.JumpShopData
  self:InitJumpShopInfo()
end

function M:InitJumpShopInfo()
  if not self.JumpShopData then
    self.WS_Item:SetActiveWidgetIndex(1)
    self.WBP_Com_EmptyBg.Slot_Text:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.WS_Item:SetActiveWidgetIndex(0)
  self:SetCoin()
  self:SetIcon()
  self.Text_JumpShopTitle:SetText(GText(self.JumpShopData.ShopName))
  self.Panel_RefreshTime:SetVisibility(ESlateVisibility.Collapsed)
  if self.JumpShopData.RefreshTime then
    self.Panel_RefreshTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:UpdateShopItemRefreshTime(self.JumpShopData.RefreshTime)
  end
  if self.JumpShopData.RegionPointId then
    self.Btn_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Tips:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetCoin()
  local Avatar = GWorld:GetAvatar()
  for i = 1, #self.CoinItem do
    local activeIndex = 1
    local coinId
    if self.JumpShopData.CoinId then
      coinId = self.JumpShopData.CoinId[i]
    end
    if coinId then
      activeIndex = 0
      local coinIcon = LoadObject(DataMgr.Resource[coinId].Icon)
      self.CoinItem[i].Com_ItemIcon:Init({
        Id = coinId,
        Icon = coinIcon,
        ItemType = "Resource"
      })
      local data = DataMgr.Resource[coinId]
      if Avatar and data then
        local resource = Avatar.Resources[coinId] or {Count = 0}
        self.CoinItem[i].Num_Hold:SetText(resource.Count)
      end
    end
    self.CoinItem[i].WS_Consume:SetActiveWidgetIndex(activeIndex)
  end
end

function M:SetIcon()
  local IconPath = self.JumpShopData.BackgroundIcon or "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Event02"
  if string.find(IconPath, "/Game/") == nil then
    IconPath = "/Game/" .. IconPath
  end
  local IconDynaMaterial = self.Image_Icon:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(IconPath))
  end
end

function M:UpdateShopItemRefreshTime(RefreshTime)
  if not RefreshTime then
    self.Panel_RefreshTime:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Panel_RefreshTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    ShopUtils:RefreshShopRefreshTime(RefreshTime, self.Text_RefreshTime)
    self:AddTimer(1, ShopUtils.RefreshShopRefreshTime, true, 0, "RefreshTimeTimer", true, RefreshTime, self.Text_RefreshTime)
  end
end

function M:UpdateKeyTipsVisibility()
  if not self.Key_Tips then
    return
  end
  local isGamepadMode = self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  local hasRegionPoint = self.JumpShopData and self.JumpShopData.RegionPointId
  local shouldShow = isGamepadMode and self.IsSelected and hasRegionPoint
  self.Key_Tips:SetVisibility(shouldShow and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
end

function M:BP_OnItemSelectionChanged(IsSelected)
  if self.IsEmpty then
    return
  end
  self.IsSelected = IsSelected
  self:UpdateKeyTipsVisibility()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadSpecialLeft or InKeyName == Const.GamepadSpecialRight then
    self:OpenJumpShopTips()
  end
  return UIUtils.Unhandled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if not self.Key_Tips then
    return
  end
  self:UpdateKeyTipsVisibility()
end

function M:Destruct()
  self:RemoveInputMethodChangedListen()
end

return M
