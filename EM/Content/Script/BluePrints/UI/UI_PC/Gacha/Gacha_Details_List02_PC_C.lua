require("UnLua")
local G = Class("BluePrints.UI.BP_EMUserWidget_C")

function G:OnListItemObjectSet(Obj)
  self.Obj = Obj
  Obj.SelfWidget = self
  if Obj.NotShow then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  else
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.StarLevel = Obj.TargetRarity
  for i = 1, CommonConst.GachaRarityMax do
    self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for i = 1, self.StarLevel do
    self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self:SetGachaProbability(Obj.IsUp)
  if Obj.IsUp then
    self.Group_Arrow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:InitUpListItem()
  else
    self.Group_Arrow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:InitGachaListItem()
  end
  self.List_Probability:DisableScroll(true)
end

function G:SetGachaProbability(IsUp)
  if IsUp then
    local Probability = 0
    for Index, Info in pairs(self.Obj.ParentWidget.GachaUpList[self.StarLevel]) do
      Probability = Probability + Info.Probability
    end
    local Rate = math.min(math.max(Probability / CommonConst.GACHA_PROBABILITY_BASE, 0), 1) * 100
    self.Text_Title:SetText(string.format(GText("UI_GACHA_UP_PROB"), self.StarLevel, Rate))
  else
    local Probability
    local GachaInfo = DataMgr.Gacha[self.Obj.ParentWidget.GachaIndex]
    local GachaProbabilityInfo = DataMgr.GachaProbability[GachaInfo.ProbabilityId]
    if 3 == self.StarLevel then
      Probability = CommonConst.GACHA_PROBABILITY_BASE - GachaProbabilityInfo.ProbabilityStar4 - GachaProbabilityInfo.ProbabilityStar5
    else
      Probability = GachaProbabilityInfo["ProbabilityStar" .. self.StarLevel]
    end
    local Rate = math.min(math.max(Probability / CommonConst.GACHA_PROBABILITY_BASE, 0), 1) * 100
    self.Text_Title:SetText(string.format(GText("UI_GACHA_PROB"), self.StarLevel, Rate))
  end
end

function G:InitUpListItem()
  local CurListNums = self.List_Probability:GetNumItems()
  local Count = 0
  for Index, Info in pairs(self.Obj.ParentWidget.GachaUpList[self.StarLevel]) do
    Count = Count + 1
    local Object
    if CurListNums >= Count then
      Object = self.List_Probability:GetItemAt(Count - 1)
    else
      Object = NewObject(UIUtils.GetCommonItemContentClass())
    end
    Object.ParentWidget = self
    Object.NotShow = false
    if Info.Type == "Char" then
      Object.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = self.OpenShowCharDetail,
        Params = {
          Info.TargetId
        }
      }
    else
      Object.ItemType = Info.Type
      Object.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = self.OpenShowWeaponDetail,
        Params = {
          Info.TargetId
        }
      }
    end
    Object.HandleMouseDown = true
    Object.bAsyncLoadIcon = true
    Object.Id = Info.TargetId
    local IconPath = DataMgr[Info.Type][Info.TargetId].Icon
    Object.Icon = IconPath
    Object.Rarity = Info.TargetRarity
    if CurListNums < Count then
      self.List_Probability:AddItem(Object)
    end
  end
  if CurListNums > Count then
    for index = Count + 1, CurListNums do
      local Item = self.List_Probability:GetItemAt(index - 1)
      Item.NotShow = true
    end
  end
end

function G:InitGachaListItem()
  local CurListNums = self.List_Probability:GetNumItems()
  local Count = 0
  for Index, Value in pairs(self.Obj.ParentWidget.GachaCharList[self.StarLevel]) do
    Count = Count + 1
    local Object
    if CurListNums >= Count then
      Object = self.List_Probability:GetItemAt(Count - 1)
    else
      Object = NewObject(UIUtils.GetCommonItemContentClass())
    end
    Object.ParentWidget = self
    Object.HandleMouseDown = true
    Object.bAsyncLoadIcon = true
    Object.NotShow = false
    Object.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = self.OpenShowCharDetail,
      Params = {Value}
    }
    Object.Id = Value
    local IconPath = DataMgr.Char[Value].Icon
    Object.Icon = IconPath
    Object.Rarity = self.StarLevel
    if CurListNums < Count then
      self.List_Probability:AddItem(Object)
    end
  end
  for Index, Value in pairs(self.Obj.ParentWidget.GachaWeaponList[self.StarLevel]) do
    Count = Count + 1
    local Object
    if CurListNums >= Count then
      Object = self.List_Probability:GetItemAt(Count - 1)
    else
      Object = NewObject(UIUtils.GetCommonItemContentClass())
    end
    Object.ParentWidget = self
    Object.ItemType = "Weapon"
    Object.Id = Value
    Object.HandleMouseDown = true
    Object.bAsyncLoadIcon = true
    Object.NotShow = false
    Object.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = self.OpenShowWeaponDetail,
      Params = {Value}
    }
    local IconPath = DataMgr.Weapon[Value].Icon
    Object.Icon = IconPath
    Object.Rarity = self.StarLevel
    if CurListNums < Count then
      self.List_Probability:AddItem(Object)
    end
  end
  if CurListNums > Count then
    for index = Count + 1, CurListNums do
      local Item = self.List_Probability:GetItemAt(index - 1)
      Item.NotShow = true
    end
  end
  self.List_Probability:RequestRefresh()
end

function G:OpenShowCharDetail(CharId)
  local GachaMain = UIManager(self):GetUIObj("GachaMain")
  if GachaMain and GachaMain.DetailPopupUI then
    GachaMain.DetailPopupUI:OnClose()
  end
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {CharId},
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    OnCloseDelegate = {
      GachaMain,
      GachaMain.OnClickBtnRecord
    }
  })
end

function G:OpenShowWeaponDetail(WeaponId)
  local GachaMain = UIManager(self):GetUIObj("GachaMain")
  if GachaMain and GachaMain.DetailPopupUI then
    GachaMain.DetailPopupUI:OnClose()
  end
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = {WeaponId},
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    bHideBoxBtn = true,
    bNoEndCamera = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    OnCloseDelegate = {
      GachaMain,
      GachaMain.OnClickBtnRecord
    }
  })
end

return G
