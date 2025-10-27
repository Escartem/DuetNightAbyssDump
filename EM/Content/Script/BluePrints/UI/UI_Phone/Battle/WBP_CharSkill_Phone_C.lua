require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
end

function M:Construct()
  self.Super.Construct(self)
  self.SkillItems = {
    self.CharSkill_1,
    self.CharSkill_2
  }
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.CharSkill_1:SetSkillIndex(1, UE.ESkillType.Skill1, ESkillName.Skill1, "Skill1", self)
  self.CharSkill_2:SetSkillIndex(2, UE.ESkillType.Skill2, ESkillName.Skill2, "Skill2", self)
  self:OnUpdateCharSp(nil, nil, self.OwnerPlayer)
  if self.OwnerPlayer then
    self.MaxSp = self.OwnerPlayer:GetAttr("MaxSp")
  end
end

function M:UpdateSkillInTimer()
  self.CharSkill_1:UpdateSkillInTimer()
  self.CharSkill_2:UpdateSkillInTimer()
end

function M:OnUpdateMaxSp(NewMaxSp)
  if not NewMaxSp then
    return
  end
  DebugPrint("@zyh \230\156\128\230\150\176MaxSp\230\155\180\230\150\176\228\184\186", NewMaxSp)
  self.MaxSp = NewMaxSp
  local SpPercent = math.min(math.max(self.NowSp / self.MaxSp, 0), 1)
  self.EnergyBar = self.Bg_BarPercent.SlateMesh.Material
  self.EnergyBar:SetScalarParameterValue("percent", SpPercent)
end

function M:OnUpdateCharSp(NowSp, OldSp, Owner)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  if not Owner or Owner ~= self.OwnerPlayer then
    return
  end
  if not self.MaxSp then
    self.MaxSp = self.OwnerPlayer:GetAttr("MaxSp")
  end
  if NowSp then
    self.NowSp = NowSp
  else
    self.NowSp = self.OwnerPlayer:GetAttr("Sp")
  end
  self.Total_Energy_Num:SetText(math.floor(self.NowSp))
  local SpPercent = math.min(math.max(self.NowSp / self.MaxSp, 0), 1)
  self.EnergyBar = self.Bg_BarPercent.SlateMesh.Material
  self.EnergyBar:SetScalarParameterValue("percent", SpPercent)
  for i = 1, 2 do
    if not self.SkillItems[i].SkillInfo.CostSp then
      return
    end
    if self.NowSp < self.SkillItems[i].SkillInfo.CostSp then
      self.SkillItems[i].SkillInfo.HasEnoughSp = false
    else
      self.SkillItems[i].SkillInfo.HasEnoughSp = true
    end
  end
end

return M
