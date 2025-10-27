local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local ETalkOptionType = {
  Dialogue = "dialogue",
  Normal = "normal",
  Random = "random",
  Plus = "plus",
  Check = "check",
  RougeLike = "rougeLike",
  Branch = "branch"
}
local TalkOptionData_C = {}

function TalkOptionData_C.New(OptionType, TalkNodeData, DialogueOptionData, DialogueIterationComponent)
  local Obj = setmetatable({}, {__index = TalkOptionData_C})
  Obj.OptionType = OptionType
  Obj.bHasFinalDialogue = DialogueIterationComponent and DialogueIterationComponent:HasFinalDialogue()
  Obj.SavedOptions = DialogueIterationComponent and DialogueIterationComponent:GetSavedOptions() or {}
  Obj.Options = {}
  Obj.OptionId2Idx = {}
  if not TalkNodeData and not DialogueOptionData then
    DebugPrint("TalkOptionData_C.New:TalkNodeData\228\184\142DialogueOptionData\233\131\189\228\184\186nil")
    return
  end
  local Avatar = GWorld:GetAvatar()
  if OptionType == ETalkOptionType.Dialogue then
    for idx, Option in ipairs(DialogueOptionData) do
      local OptionInfo = {
        Index = idx,
        OptionId = Option,
        OptionText = TalkUtils:OptionIdToContent(Option),
        bIsSelected = DialogueIterationComponent and DialogueIterationComponent:IsSelectedOption(Option)
      }
      table.insert(Obj.Options, OptionInfo)
      Obj.OptionId2Idx[Option] = idx
    end
  elseif OptionType == ETalkOptionType.Normal then
    Obj.RandomOptionNum = TalkNodeData.RandomOptionNum
    for idx, Option in ipairs(TalkNodeData.NormalOptions) do
      table.insert(Obj.Options, {
        OptionId = tonumber(Option.OptionText),
        OptionText = TalkUtils:OptionIdToContent(Option.OptionText),
        OverrideBlend = Option.OverrideBlend,
        OverrideOutype = Option.OverrideOutype,
        OverrideOutTime = Option.OverrideOutTime,
        Index = idx
      })
      Obj.OptionId2Idx[tonumber(Option.OptionText)] = idx
    end
  elseif OptionType == ETalkOptionType.Random then
    Obj.RandomOptionNum = TalkNodeData.RandomOptionNum
    for idx, Option in ipairs(TalkNodeData.RandomOptions) do
      table.insert(Obj.Options, {
        OptionId = tonumber(Option.OptionText),
        OptionText = TalkUtils:OptionIdToContent(Option.OptionText),
        OverrideBlend = Option.OverrideBlend,
        OverrideOutype = Option.OverrideOutype,
        OverrideOutTime = Option.OverrideOutTime,
        Index = idx
      })
    end
  elseif OptionType == ETalkOptionType.Plus then
    if TalkNodeData then
      Obj.RandomOptionNum = TalkNodeData.RandomOptionNum
      for idx, Option in ipairs(TalkNodeData.PlusOptions) do
        local OptionId = tonumber(Option.OptionText)
        table.insert(Obj.Options, {
          OptionId = OptionId,
          OptionText = TalkUtils:OptionIdToContent(Option.OptionText),
          OverrideBlend = Option.OverrideBlend,
          OverrideOutype = Option.OverrideOutype,
          OverrideOutTime = Option.OverrideOutTime,
          PlusId = Option.PlusId,
          Index = idx
        })
        Obj.OptionId2Idx[OptionId] = idx
        if Avatar and Avatar:IsImpressionCheckSuccess(OptionId) then
          table.insert(Obj.SavedOptions, OptionId)
        end
      end
    elseif DialogueOptionData then
      for idx, Option in ipairs(DialogueOptionData) do
        local DialogueData = DataMgr.Dialogue[Option]
        local OptionInfo = {
          Index = idx,
          OptionId = Option,
          OptionText = TalkUtils:OptionIdToContent(Option),
          PlusId = DialogueData.ImprPlusId
        }
        table.insert(Obj.Options, OptionInfo)
        Obj.OptionId2Idx[Option] = idx
      end
    end
  elseif OptionType == ETalkOptionType.Check then
    if TalkNodeData then
      Obj.RandomOptionNum = TalkNodeData.RandomOptionNum
      for idx, Option in ipairs(TalkNodeData.CheckOptions) do
        local OptionId = tonumber(Option.OptionText)
        table.insert(Obj.Options, {
          OptionId = OptionId,
          OptionText = TalkUtils:OptionIdToContent(Option.OptionText),
          OverrideBlend = Option.OverrideBlend,
          OverrideOutype = Option.OverrideOutype,
          OverrideOutTime = Option.OverrideOutTime,
          CheckId = Option.CheckId,
          NotCheck = Option.NotCheck,
          Index = idx
        })
        Obj.OptionId2Idx[OptionId] = idx
        if Avatar and Avatar:IsImpressionCheckSuccess(OptionId) then
          table.insert(Obj.SavedOptions, OptionId)
        end
      end
    elseif DialogueOptionData then
      for idx, Option in ipairs(DialogueOptionData) do
        local DialogueData = DataMgr.Dialogue[Option]
        local OptionInfo = {
          Index = idx,
          OptionId = Option,
          OptionText = TalkUtils:OptionIdToContent(Option),
          CheckId = DialogueData.ImprCheckId
        }
        table.insert(Obj.Options, OptionInfo)
        Obj.OptionId2Idx[Option] = idx
      end
    end
  else
    if OptionType == ETalkOptionType.RougeLike then
      for i, Option in ipairs(TalkNodeData.RougeLikeOptions) do
        table.insert(Obj.Options, {
          Index = i,
          OptionId = tonumber(Option.OptionText),
          OptionText = Option.OptionText,
          OverrideBlend = Option.OverrideBlend,
          OverrideOutype = Option.OverrideOutype,
          OverrideOutTime = Option.OverrideOutTime
        })
      end
    else
    end
  end
  return Obj
end

function TalkOptionData_C:GetOptionTexts()
  local OptionTexts = {}
  for _, Option in ipairs(self.Options) do
    table.insert(OptionTexts, Option.OptionText)
  end
  return OptionTexts
end

function TalkOptionData_C:IsShow()
  return self.OptionType ~= ETalkOptionType.Branch
end

return {TalkOptionData_C = TalkOptionData_C, ETalkOptionType = ETalkOptionType}
