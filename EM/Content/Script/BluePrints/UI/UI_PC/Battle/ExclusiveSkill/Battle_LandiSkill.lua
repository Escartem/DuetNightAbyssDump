local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local LANDI_SUMMON_ID = 420201

function M:Construct()
  self.Main:SetVisibility(ESlateVisibility.Collapsed)
  self.FrameCount = 0
  self:InitListenEvent()
  self:SetSummonText()
  self:SetSummonPercent(1)
end

function M:OnLoaded(OwnerPlayer, Params)
  self:InitLandiUIInfo(OwnerPlayer, Params)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnCharCallSummoner, self, self.OnSummonerAdd)
  self:AddDispatcher(EventID.OnCharRemoveSummoner, self, self.OnSummonRemove)
end

function M:InitLandiUIInfo(OwnerPlayer, Params)
  DebugPrint("gmy@M:InitLandiUIInfo OwnerPlayer, Params", OwnerPlayer, Params)
  self.OwnerPlayer = OwnerPlayer
  self.SummonerId = Params.SummonerId
  self:UpdateSummonState()
end

function M:OnLandiSummonCreated(Summon)
  DebugPrint("gmy@M:OnLandiSummonCreated Summon", Summon)
end

function M:Tick(MyGeometry, InDeltaTime)
  M.Super.Tick(self, MyGeometry, InDeltaTime)
  if 0 == self.FrameCount % 3 then
    self:UpdateSummonState()
  end
end

function M:UpdateSummonState()
  if self.OwnerPlayer and self.SummonerId then
    self:SetSummonState()
  end
end

function M:SetSummonState()
  if IsValid(self.Summoner) then
    self.Main:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local Hp = self.Summoner:GetAttr("Hp")
    local HpPercent = self.Summoner:GetAttr("HpPercent")
    self:SetSummonText(Hp)
    self:SetSummonPercent(HpPercent)
  else
    self.Main:SetVisibility(ESlateVisibility.Collapsed)
    self:TryGetSummon()
  end
end

function M:SetSummonPercent(Percent)
  self.Process_Landi:SetPercent(Percent)
  self.Process_Landi_Glow:SetPercent(Percent)
end

function M:SetSummonText(Hp)
  if Hp then
    local HpText = string.format("%.0f", Hp)
    self.Process_Landi_Num:SetText(HpText)
  else
    self.Process_Landi_Num:SetText("")
  end
end

function M:OnSummonerAdd(Summoner)
  DebugPrint("gmy@Battle_LandiSkill M:OnSummonerAdd", Summoner and Summoner.UnitId, self.SummonerId)
  if Summoner and LANDI_SUMMON_ID == Summoner.UnitId then
    self.Summoner = Summoner
    self:UpdateSummonState()
  end
end

function M:OnSummonRemove(Summoner)
  DebugPrint("gmy@Battle_LandiSkill M:OnSummonRemove", Summoner and Summoner.UnitId, self.SummonerId)
  if Summoner and LANDI_SUMMON_ID == Summoner.UnitId then
    self:Close()
  end
end

function M:TryGetSummon()
  local Player = GWorld:GetMainPlayer()
  local Summons = Player:GetSummonsList(LANDI_SUMMON_ID, false, true)
  for _, Eid in pairs(Summons) do
    local Summoner = Battle(self):GetEntity(Eid)
    if IsValid(Summoner) and Summoner.UnitId == LANDI_SUMMON_ID then
      self.Summoner = Summoner
      return
    end
  end
end

return M
