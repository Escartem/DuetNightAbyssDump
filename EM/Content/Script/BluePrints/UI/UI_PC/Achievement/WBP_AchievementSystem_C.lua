require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Super.Construct(self)
  self.Btn_Close:Init("Close", self, self.OnReturnKeyDown)
  EventManager:AddEvent(EventID.OnAchvHyperlinkClick, self, self.OnAchvHyperlinkClick)
  EventManager:AddEvent(EventID.OnGetAchvReward, self, self.OnGetAchvReward)
  local ret = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.OnReturnKeyDown,
        Owner = self
      }
    },
    bLongPress = false,
    Desc = GText("UI_BACK")
  }
  self.Common_Key_Btn_Desc_A_PC:CreateCommonKey(ret)
  self.Achievement_SystemDetail_PC.Common_Key_Btn_Desc_A_PC:CreateCommonKey(ret)
  self:PlayAnimation("In")
  local objectClass = LoadClass("/Game/UI/UI_PC/Achievement/Achievement_System_Item_Content.Achievement_System_Item_Content_C")
  self.List_Achievement:ClearListItems()
  local index = 0
  self.Type2Index = {}
  for i = 1, 2 do
    local object = NewObject(objectClass)
    object.ID = -1
    object.AchievementSystem = self
    object.Index = i
    self.List_Achievement:AddItem(object)
  end
  local tempId
  for id, _ in pairs(DataMgr.AchievementType) do
    local object = NewObject(objectClass)
    object.ID = id
    object.AchievementSystem = self
    object.Index = index
    self.Type2Index[id] = index
    self.List_Achievement:AddItem(object)
    tempId = tempId or id
    index = index + 1
  end
  for i = 1, 2 do
    local object = NewObject(objectClass)
    object.ID = -1
    object.AchievementSystem = self
    object.Index = i
    self.List_Achievement:AddItem(object)
  end
  self:PlayAnim("In")
  self.Btn_Close:PlayAnimation(self.Btn_Close.In)
  local avatar = GWorld:GetAvatar()
  local count = 0
  for _, achieve in pairs(avatar.Achvs) do
    if achieve:IsFinished() then
      count = count + 1
    end
  end
  self.Count_Total:SetText(count)
  self.Total_Count:SetText(GText("UI_Achievement_TotalCount"))
  self.Achievement_SystemDetail_PC.Parent = self
  self:OpenDetail(tempId, 0)
end

function M:Destruct()
  self.Super.Destruct(self)
  EventManager:RemoveEvent(EventID.OnAchvHyperlinkClick, self)
  EventManager:RemoveEvent(EventID.OnGetAchvReward, self)
end

function M:OnAchvHyperlinkClick(url)
  local inUrl = Split(url, ".")
  local id = tonumber(inUrl[1])
  local typeId = tonumber(inUrl[2])
  if not DataMgr.Achievement[id] or not DataMgr.AchievementType[typeId] then
    return
  end
  if self.Achievement_SystemDetail_PC:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    if self.Achievement_SystemDetail_PC.CurrentTypeId == typeId then
      self.Achievement_SystemDetail_PC:ScrollToId(id)
    else
      self.Achievement_SystemDetail_PC:OpenDetail(typeId, self.Type2Index[typeId])
    end
  else
    self:OpenDetail(typeId, self.Type2Index[typeId])
  end
end

function M:OpenDetail(TypeId, Index)
  self.Achievement_SystemDetail_PC:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Achievement_SystemDetail_PC:PlayIn()
  self.Achievement_SystemDetail_PC:OpenDetail(TypeId, Index)
end

function M:OnReturnKeyDown()
  self.Achievement_SystemDetail_PC:OnReturnKeyDown()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnReturnKeyDown()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnGetAchvReward(AchvId, Ret)
  if Ret ~= ErrorCode.RET_SUCCESS then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowError(Ret, 1.5)
    return
  end
  if self.Achievement_SystemDetail_PC:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self.Achievement_SystemDetail_PC:OnGetAchvReward(AchvId)
  end
end

return M
