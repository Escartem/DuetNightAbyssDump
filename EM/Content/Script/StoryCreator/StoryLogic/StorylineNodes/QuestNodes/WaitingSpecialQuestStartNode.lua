local WaitingSpecialQuestStartNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitingSpecialQuestStartNode:Init()
  self.SpecialConfigId = nil
end

function WaitingSpecialQuestStartNode:Execute(Callback)
  self:SetUniversalConfig()
  self:SendInfosAndWaiting(Callback)
end

function WaitingSpecialQuestStartNode:SendInfosAndWaiting(Callback)
  local Avatar = GWorld:GetAvatar()
  local SpecialQuestInfo = DataMgr.SpecialQuestConfig[self.SpecialConfigId]
  if Avatar and SpecialQuestInfo then
    local Infos = {}
    if self.IsBossBattle then
      Infos = {
        pve_id = self.SpecialConfigId
      }
    end
    Avatar:StartSpecialQuest(self.SpecialConfigId, Infos, Callback)
  end
end

function WaitingSpecialQuestStartNode:SetUniversalConfig()
  local SpecialQuestInfo = DataMgr.SpecialQuestConfig[self.SpecialConfigId]
  if SpecialQuestInfo and SpecialQuestInfo.UniversalConfigId then
    local UniversalConfig = DataMgr.UniversalConfig[SpecialQuestInfo.UniversalConfigId]
    if UniversalConfig then
      local GameInstance = GWorld.GameInstance
      if UniversalConfig.DisableBattleWheel then
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
        if Player then
          Player:DisableBattleWheel()
        end
      end
    end
  end
end

return WaitingSpecialQuestStartNode
