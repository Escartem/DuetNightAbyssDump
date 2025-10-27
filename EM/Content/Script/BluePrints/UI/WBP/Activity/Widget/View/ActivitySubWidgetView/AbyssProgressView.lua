require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:GenerateServerData(PlayerAvatar)
  local Result = {CurProcessStr = "", AllStarCount = 0}
  local AbyssSeasonId = PlayerAvatar.CurrentAbyssSeasonId
  local IsConstantAbyssPass = self:IsConstantAbyssPass(PlayerAvatar)
  if IsConstantAbyssPass then
    if AbyssSeasonId then
      local CurrentAbyssId = PlayerAvatar:GetAbyssSeasonBestAbyssId(AbyssSeasonId)
      if CurrentAbyssId then
        local AbyssSeasonConfig = DataMgr.AbyssSeason[CurrentAbyssId]
        local MaxAbyssProgress = PlayerAvatar.Abysses[CurrentAbyssId].MaxAbyssProgress[1]
        local MaxAbyssProgressStr = string.format(GText("Abyss_LevelName"), MaxAbyssProgress)
        Result.CurProcessStr = string.format("%s%s%s", GText(AbyssSeasonConfig.AbyssIdName), "/", MaxAbyssProgressStr)
      end
      local AbyssSeasonListConfig = DataMgr.AbyssSeasonList[AbyssSeasonId]
      local AbysRotateId, AbyssInfiniteId
      if AbyssSeasonListConfig then
        AbysRotateId, AbyssInfiniteId = AbyssSeasonListConfig.Abyss.Rotate, AbyssSeasonListConfig.Abyss.Infinite
      end
      if AbysRotateId then
        Result.AllStarCount = PlayerAvatar.Abysses[AbysRotateId]:GetAllPassRoomCount()
      end
      if AbyssInfiniteId then
        Result.AllStarCount = Result.AllStarCount + PlayerAvatar.Abysses[AbyssInfiniteId]:GetAllPassRoomCount()
      end
    end
  else
    local ConstantAbyssId = self:GetConstantAbyssSeasonId()
    if ConstantAbyssId then
      local AbyssSeasonConfig = DataMgr.AbyssSeason[ConstantAbyssId]
      local MaxAbyssProgress = PlayerAvatar.Abysses[ConstantAbyssId].MaxAbyssProgress[1]
      local MaxAbyssProgressStr = string.format(GText("Abyss_LevelName"), MaxAbyssProgress)
      Result.CurProcessStr = string.format("%s%s%s", GText(AbyssSeasonConfig.AbyssIdName), "/", MaxAbyssProgressStr)
      Result.AllStarCount = PlayerAvatar.Abysses[ConstantAbyssId]:GetAllPassRoomCount()
    end
  end
  return Result
end

function M:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
  self.Text_Progress:SetText(GText("Abyss_SeasonFightProgress"))
  self.Text_Collect:SetText(GText("Abyss_SeasonRewardProgress"))
  local AllInfo = self:GenerateServerData(PlayerAvatar)
  self.Text_Name:SetText(AllInfo.CurProcessStr)
  self.Text_Star:SetText(string.format("x%s", AllInfo.AllStarCount))
end

function M:Update(PlayerAvatar)
  local AllInfo = self:GenerateServerData(PlayerAvatar)
  self.Text_Name:SetText(AllInfo.CurProcessStr)
  self.Text_Star:SetText(string.format("X%s", AllInfo.AllStarCount))
end

function M:GetConstantAbyssSeasonId()
  for AbyssSeasonId, AbyssSeasonConfig in pairs(DataMgr.AbyssSeason) do
    if 1 == AbyssSeasonConfig.AbyssType then
      return AbyssSeasonId
    end
  end
  return nil
end

function M:IsConstantAbyssPass(PlayerAvatar)
  local ConstantAbyssId = self:GetConstantAbyssSeasonId()
  if ConstantAbyssId then
    return PlayerAvatar.Abysses[ConstantAbyssId]:IsAbyssPass()
  end
  return false
end

return M
