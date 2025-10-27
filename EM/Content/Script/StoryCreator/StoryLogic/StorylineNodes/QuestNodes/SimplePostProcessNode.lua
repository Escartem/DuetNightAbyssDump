local SimplePostProcessNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local LibraryPath = "/Game/Asset/Effect/Blueprint/PostProcess/PostProcessFunctionLibrary"
local UPostProcessFunctionLibrary = LoadClass(LibraryPath)

function SimplePostProcessNode:Init()
  self.bEnablePP = true
  self.PPEnum = 0
end

function SimplePostProcessNode:Start(Context)
  local Player = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(Player) then
    local Message = "\232\174\190\231\189\174\231\155\184\230\156\186\229\144\142\229\164\132\231\144\134\230\149\136\230\158\156\230\151\182\239\188\140\231\142\169\229\174\182PlayerCharacter\230\151\160\230\149\136\n"
    local Title = "\229\144\142\229\164\132\231\144\134\232\138\130\231\130\185\233\148\153\232\175\175"
    UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    self:FinishAction()
    return
  end
  self.Player = Player
  if self.bEnablePP then
    if not self.PPEnum or type(self.PPEnum) ~= "number" then
      local Message = "\229\144\142\229\164\132\231\144\134\230\149\136\230\158\156\230\158\154\228\184\190\229\128\188\230\151\160\230\149\136:" .. "\n" .. tostring(self.PPEnum or "")
      local Title = "\229\144\142\229\164\132\231\144\134\232\138\130\231\130\185\233\148\153\232\175\175"
      UStoryLogUtils.PrintToFeiShu(self, Title, Message)
      self:FinishAction()
      return
    end
    self:ClearPostProcess(Player)
    local MaterialInst = UPostProcessFunctionLibrary.SimplePostProcess(self.PPEnum)
    rawset(Player, "SimplePPMaterial", MaterialInst)
  else
    self:ClearPostProcess(Player)
  end
  self:FinishAction()
end

function SimplePostProcessNode:ClearPostProcess(Player)
  local MaterialCache = rawget(Player, "SimplePPMaterial")
  if MaterialCache then
    UPostProcessFunctionLibrary.ClearSimplePostProcess(MaterialCache)
    rawset(Player, "SimplePPMaterial", nil)
  end
end

function SimplePostProcessNode:FinishAction()
  self:Finish()
end

return SimplePostProcessNode
