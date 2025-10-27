require("UnLua")
local BP_TrainingComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_TrainingComponent_C:InitTrainingComponent()
  self.GameMode = self:GetOwner()
  self.TrainingData = DataMgr.Training[self.GameMode.DungeonId]
  self.StopBTReason = "Training"
  self.MonsterCreateInfo = {}
  self.MonsterNeedToStartBT = true
end

function BP_TrainingComponent_C:InitTrainingBaseInfo()
  self.StaticCreators = {}
  for _, Creator in pairs(self.GameMode.EMGameState.StaticCreatorMap) do
    if Creator.UnitType == "Monster" then
      table.insert(self.StaticCreators, Creator)
    end
  end
  table.sort(self.StaticCreators, function(CreatorA, CreatorB)
    return CreatorA.StaticCreatorId < CreatorB.StaticCreatorId
  end)
end

function BP_TrainingComponent_C:GetPlayerRecoveryTime()
  return DataMgr.GlobalConstant.TrainingPlayerRecoveryTime.ConstantValue
end

function BP_TrainingComponent_C:GetMonsterNeedToStartBT()
  return self.MonsterNeedToStartBT
end

function BP_TrainingComponent_C:CreateMonster(CreateInfo)
  if #CreateInfo <= 0 then
    CreateInfo = self.MonsterCreateInfo
  else
    self.MonsterCreateInfo = CreateInfo
  end
  local Res, Index, Creator = {}, 1
  for _, Info in ipairs(CreateInfo) do
    for __ = 1, Info[2] do
      while true do
        Creator = self.StaticCreators[Index]
        if nil == Creator then
          DebugPrint("\232\174\173\231\187\131\229\156\186\229\136\183\230\128\170\239\188\154\229\136\183\230\128\170\231\130\185\228\184\141\232\182\179\239\188\140\230\156\137\230\128\170\231\137\169\230\178\161\229\136\134\233\133\141\229\136\176\229\136\183\230\128\170\231\130\185")
          return
        end
        if Creator.ChildEids:Num() <= 0 then
          Creator.UnitId = Info[1]
          Creator.Level = Info[3]
          table.insert(Res, Creator.StaticCreatorId)
          Index = Index + 1
          break
        end
        Index = Index + 1
      end
    end
  end
  if #Res > 0 then
    self.GameMode:TriggerActiveStaticCreator(Res)
  end
end

function BP_TrainingComponent_C:SetMonsterAI(Flag)
  self.MonsterNeedToStartBT = Flag
  for _, Creator in pairs(self.StaticCreators) do
    for __, MonsterEid in pairs(Creator.ChildEids) do
      local Monster = Battle(self):GetEntity(MonsterEid)
      if nil ~= Monster then
        if true == Flag then
          Monster:StartBT(self.StopBTReason)
        else
          Monster:StopBT(self.StopBTReason)
        end
      end
    end
  end
end

function BP_TrainingComponent_C:RemoveMonster()
  for _, Creator in pairs(self.StaticCreators) do
    for __, MonsterEid in pairs(Creator.ChildEids) do
      Battle(self):BattleOnDead(MonsterEid, MonsterEid, 0, EDeathReason.Training)
    end
  end
end

function BP_TrainingComponent_C:ClearCreateInfo()
  self.MonsterCreateInfo = {}
end

return BP_TrainingComponent_C
