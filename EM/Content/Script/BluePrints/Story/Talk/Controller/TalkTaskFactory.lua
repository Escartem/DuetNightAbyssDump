local TalkTaskFactory = {}

function TalkTaskFactory:CreateTalkTask(TalkNodeData)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  local BasicTalkType = TalkTypeData.BasicType
  if "Cinematic" == BasicTalkType or "FreeSimple" == BasicTalkType or "FixSimple" == BasicTalkType or "Impression" == BasicTalkType or "Black" == BasicTalkType then
    return self:CreateCommonTalkTask(TalkNodeData)
  elseif "Guide" == BasicTalkType or "Audio" == BasicTalkType or "Boss" == BasicTalkType or "Bubble" == BasicTalkType then
    return self:CreateLightTalkTask(TalkNodeData)
  end
  DebugPrint("@@@ \229\136\155\229\187\186TalkTask ", TalkNodeData.TalkType, BasicTalkType)
  local TalkTask_C = require("BluePrints.Story.Talk.Controller." .. BasicTalkType .. "TalkTask")
  local TalkTaskData_C = require("BluePrints.Story.Talk.Model." .. BasicTalkType .. "TalkTaskData")
  local TalkTaskData = TalkTaskData_C.New(TalkNodeData)
  local TalkTask = TalkTask_C:New(TalkTaskData, TalkNodeData.TalkType)
  self:AttachCompsToTask(TalkTask, TalkTaskData, BasicTalkType)
  if TalkNodeData.TalkType == "Bubble" or TalkNodeData.TalkType == "Guide" then
    TalkTaskData.BlendInType = nil
    TalkTaskData.BlendOutType = nil
  end
  TalkTaskData.TalkNodeName = TalkNodeData.Name
  return TalkTask, TalkTaskData
end

function TalkTaskFactory:CreateCommonTalkTask(TalkNodeData)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  local BasicTalkType = TalkTypeData.BasicType
  DebugPrint("@@@ \229\136\155\229\187\186TalkTask ", TalkNodeData.TalkType, BasicTalkType)
  local TalkTask_C
  local TalkTaskData_C = require("BluePrints.Story.Talk.Model.CommonTalkTaskData")
  if "Cinematic" == BasicTalkType then
    TalkTask_C = require("BluePrints.Story.Talk.Controller.NewCinematicTalkTask")
  else
    TalkTask_C = require("BluePrints.Story.Talk.Controller.CommonTalkTask")
  end
  local TalkTaskData = TalkTaskData_C.New(TalkNodeData)
  local TalkTask = TalkTask_C:New(TalkTaskData, TalkNodeData.TalkType)
  TalkTaskData.TalkNodeName = TalkNodeData.Name
  return TalkTask, TalkTaskData
end

function TalkTaskFactory:CreateLightTalkTask(TalkNodeData)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  local BasicTalkType = TalkTypeData.BasicType
  DebugPrint("@@@ \229\136\155\229\187\186TalkTask ", TalkNodeData.TalkType, BasicTalkType)
  local TalkTask_C
  local TalkTaskData_C = require("BluePrints.Story.Talk.Model.CommonTalkTaskData")
  if "Bubble" == BasicTalkType then
    TalkTask_C = require("BluePrints.Story.Talk.Controller.NewBubbleTalkTask")
  elseif "Audio" == BasicTalkType then
    TalkTask_C = require("BluePrints.Story.Talk.Controller.NewAudioTalkTask")
  elseif "Boss" == BasicTalkType then
    TalkTask_C = require("BluePrints.Story.Talk.Controller.NewBossTalkTask")
  else
    TalkTask_C = require("BluePrints.Story.Talk.Controller.LightTalkTask")
  end
  local TalkTaskData = TalkTaskData_C.New(TalkNodeData)
  local TalkTask = TalkTask_C:New(TalkTaskData, TalkNodeData.TalkType)
  TalkTaskData.TalkNodeName = TalkNodeData.Name
  return TalkTask, TalkTaskData
end

function TalkTaskFactory:AttachCompsToTask(TalkTask, TalkTaskData, TalkType)
  local TalkComps = require("BluePrints.Story.Talk.Controller.TalkComps")
  if not TalkTaskData.bShowGameUI then
    local TalkComp_HideGameUI_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_HideGameUI_C
    local TalkComp_HideGame = TalkComp_HideGameUI_C.New(TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, TalkComp_HideGame)
  end
  if TalkTaskData.bDisableGameInput then
    local TalkComp_DisableInput_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_DisableInput_C
    local TalkComp_DisableInput = TalkComp_DisableInput_C.New(TalkTaskData.Player, TalkTaskData.PlayerController, TalkTaskData)
    self:AttachCompToTask(TalkTask, TalkComp_DisableInput)
  end
  if TalkTaskData.bPopMouse then
    local TalkComp_PopMouse_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_PopMouse_C
    local TalkComp_PopMouse = TalkComp_PopMouse_C.New(TalkTaskData.PlayerController, TalkTaskData)
    self:AttachCompToTask(TalkTask, TalkComp_PopMouse)
  end
  if TalkTaskData.bDisableGameInput and TalkTaskData.bPlayerMove then
    local TalkComp_StopPlayerAction_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_StopPlayerAction_C
    local TalkComp_StopPlayerAction = TalkComp_StopPlayerAction_C.New(TalkTaskData.Player, TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, TalkComp_StopPlayerAction)
  end
  if TalkTaskData.bPauseGameGlobal then
    local TalkComp_PauseGame_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_PauseGame_C
    local TalkComp_PauseGame = TalkComp_PauseGame_C.New(TalkTaskData.TalkContext, TalkTaskData.bDisableMonsterAI, TalkTaskData.bDisableNPCAI)
    self:AttachCompToTask(TalkTask, TalkComp_PauseGame)
  end
  if TalkTaskData.bDisableGameInput then
    local TalkComp_DisableInteractiveTrigger_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_DisableInteractiveTrigger_C
    local TalkComp_DisableInteractiveTrigger = TalkComp_DisableInteractiveTrigger_C.New(TalkTaskData.TalkContext.Player)
    self:AttachCompToTask(TalkTask, TalkComp_DisableInteractiveTrigger)
  end
  if TalkTaskData.bHideAllBattleEntity then
    local TalkComp_HideAllBattleEntity_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_HideAllBattleEntity_C
    local TalkComp_HideAllBattleEntity = TalkComp_HideAllBattleEntity_C.New(TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, TalkComp_HideAllBattleEntity)
  end
  if TalkTaskData.bHideElseCharacter then
    local TalkComp_HideElseCharacter_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_HideElseCharacter_C
    local TalkComp_HideElseCharacter = TalkComp_HideElseCharacter_C.New(TalkTaskData.TalkContext, TalkTaskData.CreateTalkActors)
    self:AttachCompToTask(TalkTask, TalkComp_HideElseCharacter)
  end
  if TalkTaskData.bDisableMonsterAIForSimpleTalk then
    local TalkComp_DisableAndHideMonster_C = require("BluePrints.Story.Talk.Controller.TalkComps").TalkComp_DisableAndHideMonster_C
    local TalkComp_DisableAndHideMonster = TalkComp_DisableAndHideMonster_C.New(TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, TalkComp_DisableAndHideMonster)
  end
  if TalkTaskData.bDisableGameInput then
    local SoundEffect = TalkComps.TalkComp_SoundEffect_C.New(TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, SoundEffect)
  end
  if TalkTaskData.bHideNpcHeadUI then
    local HideNpcHeadUI = TalkComps.TalkComp_HideNpcHeadUI_C.New(TalkTaskData.TalkContext)
    self:AttachCompToTask(TalkTask, HideNpcHeadUI)
  end
end

function TalkTaskFactory:AttachCompToTask(TalkTask, TalkComp)
  DebugPrint("Attach prop to task", TalkTask, TalkComp)
  local TalkCompType = TalkComp:GetType()
  TalkTask.TalkComps[TalkCompType] = TalkComp
end

return TalkTaskFactory
