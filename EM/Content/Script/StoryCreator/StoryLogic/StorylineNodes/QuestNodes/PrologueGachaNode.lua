local PrologueGachaNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function PrologueGachaNode:Init()
end

function PrologueGachaNode:Start(Context)
  self.Context = Context
  DebugPrint("===============PrologueGachaNode Start===============", self)
  self:PrologueGacha()
end

function PrologueGachaNode:PrologueGacha()
  local Avatar = GWorld:GetAvatar()
  local Config = DataMgr.InitConfig[1]
  if nil == Config or nil == Config.AlternativeCharId then
    self:FinishAction()
    return
  end
  local AlternativeCharId = Config.AlternativeCharId
  if Avatar then
    for _, Char in pairs(Avatar.Chars) do
      if AlternativeCharId == Char.CharId then
        self:FinishAction()
        return
      end
    end
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if BattleMain then
      BattleMain:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    if Player then
      Player:SetActorHideTag("PrologueGacha", true)
    end
    Avatar:PrologueGacha(self, self.FinishAction)
  end
end

function PrologueGachaNode:FinishAction()
  DebugPrint("===============PrologueGachaNode End===============")
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    BattleMain:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if Player then
    Player:SetActorHideTag("PrologueGacha", false)
  end
  self:Finish()
end

return PrologueGachaNode
