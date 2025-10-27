require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:RefreshProgress(Parent)
  self.Parent = Parent
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local DataArray = {}
  local key, maxLv, prevLv
  local SortedKeys = {}
  for lv in pairs(DataMgr.DailyGoalReward) do
    table.insert(SortedKeys, lv)
  end
  table.sort(SortedKeys)
  for _, lv in ipairs(SortedKeys) do
    if not maxLv or maxLv < lv then
      maxLv = lv
    end
    if lv == PlayerAvatar.DailyInitLevel then
      key = lv
      break
    elseif lv > PlayerAvatar.DailyInitLevel then
      key = prevLv
      break
    end
    prevLv = lv
  end
  key = key or maxLv
  local DailyGoalReward = DataMgr.DailyGoalReward[key]
  for key, ItemData in pairs(DailyGoalReward) do
    table.insert(DataArray, ItemData)
  end
  table.sort(DataArray, function(a, b)
    return a.RequiredActiveness < b.RequiredActiveness
  end)
  for i, ItemData in ipairs(DataArray) do
    local Reward = self["Reward0" .. i]
    Reward:Init(ItemData, Parent)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self.Mobile then
    return
  end
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure"),
      bLongPress = false
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Parent.CloseSelf,
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

return M
