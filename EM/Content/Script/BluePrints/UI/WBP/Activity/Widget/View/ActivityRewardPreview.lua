require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnListItemObjectSet(Content)
  self.Parent = Content.Parent
  self.Index = Content.Index
  self.PhaseId = Content.PhaseId
  self.RewardPreview = Content.RewardPreview
  self.IsZhiliuQuest = Content.IsZhiliuQuest
  self:InitPreRewardView()
end

function M:InitPreRewardView()
  if self.IsZhiliuQuest then
    self.Text_TitleNum:SetText(GText("ZhiLiuEntrust_GrandReward_Name"))
  else
    self.Text_TitleNum:SetText(string.format(GText("UI_GameEvent_StarterQuest_Phase"), self.Index))
  end
  local RewardContentList = {}
  
  local function FillWithRewardData(RewardInfo)
    if RewardInfo then
      local RewardObject = {}
      RewardObject.Id = RewardInfo.Id
      RewardObject.Icon = ItemUtils.GetItemIconPath(RewardInfo.Id, RewardInfo.Type)
      RewardObject.ParentWidget = self
      RewardObject.ItemType = RewardInfo.Type
      RewardObject.Rarity = RewardInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = "ActivityRewardPreview"
      RewardObject.HandleMouseDown = true
      if RewardInfo.Quantity then
        if #RewardInfo.Quantity > 1 then
          RewardObject.Count = RewardInfo.Quantity[1]
          RewardObject.MaxCount = RewardInfo.Quantity[2]
        else
          RewardObject.Count = RewardInfo.Quantity[1]
        end
      end
      table.insert(RewardContentList, RewardObject)
    end
  end
  
  local PreViewReward = self.RewardPreview or DataMgr.CommonQuestPhase[self.PhaseId].RewardPreview
  local AllRewardList = RewardUtils:GetRewardViewInfoById(PreViewReward)
  if type(AllRewardList) == "table" then
    for i, v in ipairs(AllRewardList) do
      FillWithRewardData(v)
    end
  else
    FillWithRewardData(AllRewardList)
  end
  if 0 == #RewardContentList then
    self.Wrap_RewardBox:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Wrap_RewardBox:ClearChildren()
    for Index, v in ipairs(RewardContentList) do
      local Widget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
      if Widget then
        self.Wrap_RewardBox:AddChild(Widget)
        Widget:Init(v)
        Widget:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      end
    end
    self.Wrap_RewardBox:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self.Parent:UpdatKeyDisplay("RewardWidget")
  else
    self.Parent:UpdatKeyDisplay("SelfWidget")
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local FocusWidget = self.Wrap_RewardBox:GetChildAt(0)
  if FocusWidget then
    FocusWidget:SetFocus()
    return UIUtils.Handle
  end
  return UIUtils.Unhandled
end

return M
