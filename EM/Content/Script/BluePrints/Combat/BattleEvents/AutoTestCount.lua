local Component = Class("BluePrints.Combat.BattleEvents.BaseEvent")
Component = setmetatable(Component, getmetatable(Component.Super))
Component:Decorator(BattleEventName.Heal)

function Component:CountHealData(Character, Heal, Source, Target)
  if not self:IsInAutoTest() then
    return
  end
  print(_G.LogTag, "CountHealData Event")
  local RootSource = Source:GetRootSource()
  if not RootSource or not RootSource:IsPhantom() then
    return
  end
  Character = RootSource
  if not self.CharacterData then
    self.CharacterData = {}
  end
  if not self.RobotData then
    self.RobotData = {}
  end
  if not self.Data then
    self.Data = {}
  end
  local CharacterType = "Robot"
  if Character:IsRobot() then
    CharacterType = "Player"
  end
  local HealData = CharacterType .. Character.CurrentRoleId
  if not Character:IsRobot() then
    self.RobotData[HealData] = self.RobotData[HealData] or {}
    self.RobotData[HealData].Heal = self.RobotData[HealData].Heal or 0
    self.RobotData[HealData].Heal = self.RobotData[HealData].Heal + Heal.TrueValue
  else
    self.CharacterData[HealData] = self.CharacterData[HealData] or {}
    self.CharacterData[HealData].Heal = self.CharacterData[HealData].Heal or 0
    self.CharacterData[HealData].Heal = self.CharacterData[HealData].Heal + Heal.TrueValue
  end
  self.Data.RobotData = self.RobotData
  self.Data.CharacterData = self.CharacterData
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    GameMode.AutoTestData = self.Data
    print(_G.LogTag, "Save AutoTestData Heal" .. HealData)
  end
end

Component:Decorator(BattleEventName.Damage)

function Component:CountDamageData(Character, Damage, Source, Target)
  print(_G.LogTag, "CountDamageData Event")
  local RootSource = Source:GetRootSource()
  if not RootSource or not RootSource:IsPhantom() then
    return
  end
  Character = RootSource
  if not self.CharacterData then
    self.CharacterData = {}
  end
  if not self.RobotData then
    self.RobotData = {}
  end
  if not self.Data then
    self.Data = {}
  end
  local CharacterType = "Robot"
  if Character:IsRobot() then
    CharacterType = "Player"
  end
  local DamageData = CharacterType .. Character.CurrentRoleId
  if not Character:IsRobot() then
    self.RobotData[DamageData] = self.RobotData[DamageData] or {}
    self.RobotData[DamageData].Damage = self.RobotData[DamageData].Damage or 0
    self.RobotData[DamageData].Damage = self.RobotData[DamageData].Damage + Damage.TrueValue
  else
    self.CharacterData[DamageData] = self.CharacterData[DamageData] or {}
    self.CharacterData[DamageData].Damage = self.CharacterData[DamageData].Damage or 0
    self.CharacterData[DamageData].Damage = self.CharacterData[DamageData].Damage + Damage.TrueValue
  end
  self.Data.RobotData = self.RobotData
  self.Data.CharacterData = self.CharacterData
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    GameMode.AutoTestData = self.Data
    print(_G.LogTag, "Save AutoTestData Damage" .. DamageData)
  end
end

Component:Decorator(BattleEventName.AddEnergyShield)

function Component:CountAddEnergyShieldData(Source, Target, Change)
  if not self:IsInAutoTest() then
    return
  end
  print(_G.LogTag, "CountAddEnergyShieldData Event")
  local RootSource = Source:GetRootSource()
  if not RootSource or not RootSource:IsPhantom() then
    return
  end
  Source = RootSource
  if not self.CharacterData then
    self.CharacterData = {}
  end
  if not self.RobotData then
    self.RobotData = {}
  end
  if not self.Data then
    self.Data = {}
  end
  local CharacterType = "Robot"
  if Source:IsRobot() then
    CharacterType = "Player"
  end
  local AddEnergyData = CharacterType .. Source.CurrentRoleId
  if not Source:IsRobot() then
    self.RobotData[AddEnergyData] = self.RobotData[AddEnergyData] or {}
    self.RobotData[AddEnergyData].AddEnergyShield = self.RobotData[AddEnergyData].AddEnergyShield or 0
    self.RobotData[AddEnergyData].AddEnergyShield = self.RobotData[AddEnergyData].AddEnergyShield + Change
  else
    self.CharacterData[AddEnergyData] = self.CharacterData[AddEnergyData] or {}
    self.CharacterData[AddEnergyData].AddEnergyShield = self.CharacterData[AddEnergyData].AddEnergyShield or 0
    self.CharacterData[AddEnergyData].AddEnergyShield = self.CharacterData[AddEnergyData].AddEnergyShield + Change
  end
  self.Data.RobotData = self.RobotData
  self.Data.CharacterData = self.CharacterData
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    GameMode.AutoTestData = self.Data
    print(_G.LogTag, "Save AutoTestData AddEnergyShield" .. AddEnergyData)
  end
end

function Component:IsInAutoTest()
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    return GameMode.IsInAutoTestCombat
  end
  return false
end

function Component:ClearData()
  self.CharacterData = {}
  self.RobotData = {}
  self.Data = {}
  self.Heal = nil
  self.Damage = nil
  self.Damaged = nil
  self.AddEnergyShieldData = nil
end

return Component
