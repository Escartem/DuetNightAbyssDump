require("UnLua")
local StoryPlayableUtils = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local BP_EmptyNPC_C = Class("BluePrints.Char.BP_NPC_C")

function BP_EmptyNPC_C:InitInfo(Info)
  DebugPrint("BP_EmptyNPC_C:InitInfo")
  self.Super.InitInfo(self, Info)
  self.UnitType = "Npc"
  self.NpcTalkInteractiveComponent:DisableNameDisplay()
  self:AddNpc()
  self.ServerInitSuccess = true
  self.InitSuccess = true
  if Info.LoadFinishCallback then
    Info.LoadFinishCallback(self)
  end
end

function BP_EmptyNPC_C:ReceiveBeginPlay()
  self.DelayFuncs = {}
  self.IsDestroied = false
end

function BP_EmptyNPC_C:ReceiveEndPlay()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:RecordNpcEntity(self, false)
  self:UnRegisterHeadUI()
  self.IsDestroied = true
end

function BP_EmptyNPC_C:LoadCurrentModel()
  DebugPrint("EmptyNPC do not need to LoadCurrentModel: Name=>" .. self:GetName() .. "NpcId:" .. self.NpcId .. "Eid:" .. self.Eid)
end

function BP_EmptyNPC_C:GetFreeCameraOffset()
  return FVector(0)
end

function BP_EmptyNPC_C:RotateOffset(RotationAngle, OnFinished, MontageName)
  StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
end

function BP_EmptyNPC_C:PlayTalkAction(ActionId, OnFinished, CallbackObj, CallbackFuncName, IsSync)
  if IsValid(CallbackObj) and CallbackFuncName then
    CallbackObj[CallbackFuncName](CallbackObj)
  else
    StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
  end
  return 0
end

return BP_EmptyNPC_C
