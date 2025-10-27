require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Panel_Level:ClearListItems()
  self:InitMap()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "SystemOpenSound", nil)
end

function M:Destruct()
  self:CleanTimer()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:InitMap()
  local DungeonData = CommonUtils.DeepCopy(DataMgr.SelectDungeon)
  table.sort(DungeonData, function(A, B)
    return A.Sequence < B.Sequence
  end)
  for i = 1, #DungeonData do
    self:AddTimer(self.IntervalTime * (i - 1), function()
      local Content = NewObject(self.LevelCellContentClass)
      Content.ChapterId = DungeonData[i].ChapterId
      Content.TextTitle = DungeonData[i].ChapterName
      Content.DungeonList = DungeonData[i].DungeonList
      Content.IconPath = DungeonData[i].Path
      Content.Reward = DungeonData[i].ChapterSubName
      Content.IsUnLocked = PageJumpUtils:CheckDungeonCondition(DungeonData[i].Condition)
      Content.Parent = self
      self.Panel_Level:AddItem(Content)
    end, false, 0, nil, true)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    AudioManager(self):SetEventSoundParam(self, "SystemOpenSound", {ToEnd = 1})
  end
end

return M
