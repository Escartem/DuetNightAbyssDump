local TalkUtils = {}
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
TalkUtils.EDialogueNodeType = {
  Dialogue = 0,
  Option = 1,
  Start = 2,
  End = 3,
  CheckCondition = 4
}
TalkUtils.EDialogueIterType = {
  Out = "Out",
  Option = "Option",
  Fail = "Fail",
  Final = "Final"
}

function TalkUtils:GetTalkActorName(UnitType, UnitId)
  if "Npc" == UnitType then
    local Npc = DataMgr.Npc[UnitId]
    if Npc then
      return GText(Npc.UnitName)
    end
  elseif "Mechanism" == UnitType then
    local Mechanism = DataMgr.Mechanism[UnitId]
    if Mechanism then
      return GText(Mechanism.InteractiveName)
    end
  end
  return ""
end

function TalkUtils:GetHeadIcon(UnitType, UnitId)
  if "Npc" == UnitType then
    local Npc = DataMgr.Npc[UnitId]
    local HeadIconPath = Npc.HeadIconPath
    if HeadIconPath then
      local ReversePath = string.reverse(HeadIconPath)
      local _, ReverseId = string.find(ReversePath, "/")
      local Id = string.len(HeadIconPath) - ReverseId + 2
      local ObjName = string.sub(HeadIconPath, Id, -1)
      HeadIconPath = string.format("Texture2D'%s.%s'", HeadIconPath, ObjName)
      local HeadIcon = LoadObject(HeadIconPath)
      return HeadIcon
    end
  end
  return nil
end

function TalkUtils:DialogueIdToContent(DialogueId)
  DialogueId = tonumber(DialogueId)
  local DialogueInfo = DataMgr.Dialogue[DialogueId]
  if not DialogueInfo then
    local Message = "DialogueId\229\156\168Dialogue\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

DialogueId:]] .. DialogueId
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local Content = DialogueInfo.Content
  if CommonConst.SystemLanguage ~= CommonConst.SystemLanguages.Default then
    local ContentLanguage = DialogueInfo[CommonConst.SystemLanguage]
    if ContentLanguage then
      Content = ContentLanguage
    else
      DebugPrint(DialogueId .. ", " .. CommonConst.SystemLanguage .. " \230\150\135\230\156\172\232\175\173\232\168\128\231\188\186\229\164\177\239\188\140\229\183\178\228\189\191\231\148\168\233\187\152\232\174\164\230\150\135\230\156\172\227\128\130")
    end
  end
  Content = Content or " "
  local WildcardSubsystem = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
  Content = WildcardSubsystem:ReplaceWildcard(Content)
  return Content
end

function TalkUtils:OptionIdToContent(OptionId)
  return self:DialogueIdToContent(OptionId)
end

function TalkUtils:IsKeyOption(DialogueId)
  DialogueId = tonumber(DialogueId)
  local DialogueInfo = DataMgr.Dialogue[DialogueId]
  if not DialogueInfo then
    local Message = "DialogueId\229\156\168Dialogue\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

DialogueId:]] .. DialogueId
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  return DialogueInfo.IsKeyOption
end

function TalkUtils:GetUnitType(UnitId)
  if DataMgr.Npc[UnitId] then
    return "Npc"
  elseif DataMgr.Mechanism[UnitId] then
    return "Mechanism"
  elseif 0 == UnitId or "0" == UnitId then
    return "Player"
  end
end

function TalkUtils:FirstToUpper(Str)
  if Str then
    return (Str:gsub("^%l", string.upper))
  end
end

function TalkUtils:FindTargetString(Str, SubStr)
  local StrInfo = string.match(Str, SubStr .. ":[^;^}]*")
  if StrInfo then
    local ResStr = string.sub(StrInfo, #SubStr + 2)
    return ResStr
  end
end

function TalkUtils:GetImpressionPlusInfo(ImpressionPlusId)
  local PlusInfo = DataMgr.ImpressionPlus[ImpressionPlusId]
  if PlusInfo then
    local Res = {}
    Res.ImpressionAreaId = PlusInfo.RegionId
    for _, ImpressionType in pairs(ImpressionTypes) do
      local PlusValue = PlusInfo[ImpressionType .. "Plus"]
      if PlusValue > 0 then
        Res.PlusType = ImpressionType
        Res.PlusValue = PlusValue
      end
    end
    return Res
  else
    DebugPrint("Error: ImpressionPlusId\228\184\141\229\173\152\229\156\168", ImpressionPlusId)
  end
end

function TalkUtils:SetPlayerInvincible()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player then
    DebugPrint("TalkUtils:SetPlayerInvincible true")
    Player:SetInvincible(true, "Talk")
  end
end

function TalkUtils:RemovePlayerInvincible()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player then
    DebugPrint("TalkUtils:RemovePlayerInvincible false")
    Player:SetInvincible(false, "Talk")
  end
end

function TalkUtils:GetPlayDialogueWaitItemTags()
  return {
    UIPlayDialogue = "UIPlayDialogue",
    PlayAction = "PlayAction",
    RotateTo = "RotateTo",
    PlayAudio = "PlayAudio",
    PlayScript = "PlayScript",
    LookAt = "LookAt",
    Expression = "Expression"
  }
end

function TalkUtils:TryResolveStoryPanel(DialoguePanelType)
  if not DialoguePanelType then
    return
  end
  local Type = TalkUtils:FindTargetString(DialoguePanelType, "type")
  if "showtext" == Type then
    return {
      Type = Type,
      Topic = TalkUtils:FindTargetString(DialoguePanelType, "topic"),
      Content = TalkUtils:FindTargetString(DialoguePanelType, "content"),
      AnimationName = TalkUtils:FindTargetString(DialoguePanelType, "animation")
    }
  end
  return
end

return TalkUtils
