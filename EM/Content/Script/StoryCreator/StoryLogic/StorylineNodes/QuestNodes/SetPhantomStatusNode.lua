local SetPhantomStatusNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function SetPhantomStatusNode:Init()
  self.BuffList = {}
  self.PhantomRoleId = 0
end

function SetPhantomStatusNode:Execute()
  local Avatar = GWorld:GetAvatar()
  local GameInstance = GWorld.GameInstance
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  local PlayerCharacter = PlayerController:GetMyPawn()
  local Phantoms = PlayerCharacter:GetPhantomTeammates(false, true)
  local NPCPhantoms = PlayerCharacter:GetNpcPhantoms()
  local PhantomsTable = Phantoms:ToTable()
  local NPCPhantomsTable = NPCPhantoms:ToTable()
  DebugPrint("Tianyi@ \229\188\128\229\167\139\230\137\167\232\161\140\233\173\133\229\189\177\229\138\160Buff\232\138\130\231\130\185, PhantomId = " .. tostring(self.PhantomRoleId))
  for _, Teammate in pairs(PhantomsTable) do
    if Teammate.UnitId == self.PhantomRoleId then
      self:AddBuffsToPhantom(Teammate)
      return
    end
  end
  for _, NPCPhantom in pairs(NPCPhantomsTable) do
    if NPCPhantom.UnitId == self.PhantomRoleId then
      self:AddBuffsToPhantom(NPCPhantom)
      return
    end
  end
end

function SetPhantomStatusNode:Clear()
end

function SetPhantomStatusNode:AddBuffsToPhantom(Phantom)
  for _, Buff in pairs(self.BuffList) do
    DebugPrint("Tianyi@ \231\187\153\233\173\133\229\189\177\229\138\160Buff: " .. tostring(Buff.Id))
    Battle(Phantom):AddBuffToTarget(Phantom, Phantom, Buff.Id, Buff.LastTime, Buff.Value, nil)
  end
end

return SetPhantomStatusNode
