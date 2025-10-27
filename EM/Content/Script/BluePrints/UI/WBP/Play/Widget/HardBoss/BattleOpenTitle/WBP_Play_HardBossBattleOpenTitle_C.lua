require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Overridden.Construct(self)
end

function M:Destruct()
  self.Overridden.Destruct(self)
end

function M:SetBossENNameVisibilityByLanguage(Language)
  if not Language or not self.Text_BossENName then
    return
  end
  if Language == CommonConst.SystemLanguages.EN then
    self.Text_BossENName:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_BossENName:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:SetBossName(BossName)
  if not BossName or not self.Text_BossName then
    return
  end
  self.Text_BossName:SetText(BossName)
end

function M:SetLevelType(LevelType)
  if not LevelType or not self.Text_BossLvType then
    return
  end
  self.Text_BossLvType:SetText(LevelType)
end

function M:SetLevelNum(LevelNum)
  if not LevelNum or not self.Text_BossLvNum then
    return
  end
  self.Text_BossLvNum:SetText(LevelNum)
end

function M:Show()
  self:SetVisibility(ESlateVisibility.HitTestInvisible)
  self:PlayAnimation(self.In)
end

function M:Hide()
  self:PlayAnimation(self.Out)
end

return M
