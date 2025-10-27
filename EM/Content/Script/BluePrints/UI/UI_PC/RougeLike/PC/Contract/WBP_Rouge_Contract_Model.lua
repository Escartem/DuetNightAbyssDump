local SkillUtils = require("Utils.SkillUtils")
local RougeContractModel = {}

function RougeContractModel:InitModel(Avatar)
  self.Avatar = Avatar
  self.SeasonId = self.Avatar.RougeLike.ProgressingSeasonId
  self.SelectedContracts = {}
  for ContractId, ContractLevel in pairs(self.Avatar.RougeLike.Contract) do
    self.SelectedContracts[ContractId] = ContractLevel
  end
end

function RougeContractModel:GetContractItemList(OnlySelected)
  local ContractItemList = {}
  if not self.SeasonId then
    DebugPrint("\232\142\183\229\143\150\229\165\145\231\186\166\229\136\151\232\161\168\229\164\177\232\180\165\239\188\140\229\189\147\229\137\141\232\181\155\229\173\163\228\184\186\231\169\186!")
    UE.ARougeLikeManager.ShowRougeLikeError("\232\142\183\229\143\150\229\165\145\231\186\166\229\136\151\232\161\168\229\164\177\232\180\165\239\188\140\229\189\147\229\137\141\232\181\155\229\173\163\228\184\186\231\169\186! \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165!")
    return
  end
  local ContractSeasonData = DataMgr.RougeLikeSeason[self.SeasonId]
  if not ContractSeasonData then
    DebugPrint("\232\142\183\229\143\150\229\165\145\231\186\166\229\136\151\232\161\168\229\164\177\232\180\165\239\188\140\229\189\147\229\137\141\232\181\155\229\173\163\228\184\141\229\173\152\229\156\168!")
    UE.ARougeLikeManager.ShowRougeLikeError("\232\142\183\229\143\150\229\165\145\231\186\166\229\136\151\232\161\168\229\164\177\232\180\165\239\188\140\229\189\147\229\137\141\232\181\155\229\173\163\228\184\141\229\173\152\229\156\168! \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165!")
    return
  end
  local OpenContracts = ContractSeasonData.OpenContract
  for Index, ContractId in ipairs(OpenContracts) do
    local SelectedLevel = self:GetContractLevel(ContractId)
    if OnlySelected and SelectedLevel <= 0 then
    else
      local ContractData = DataMgr.RougeLikeContract[ContractId]
      local ItemObj = NewObject(UIUtils.GetCommonItemContentClass())
      ItemObj.ContractId = ContractId
      ItemObj.Icon = ContractData.Icon
      ItemObj.Name = GText(ContractData.Name)
      ItemObj.MaxLevel = ContractData.MaxLevel
      ItemObj.HeatValuePerLevel = ContractData.HeatValue
      ItemObj.Icon = ContractData.Icon
      ItemObj.SelectedLevel = SelectedLevel
      ItemObj.Desc = self:MakeContractDesc(ContractData, ItemObj.SelectedLevel)
      ItemObj.Model = self
      table.insert(ContractItemList, ItemObj)
    end
  end
  return ContractItemList
end

function RougeContractModel:SetContractLevel(ContractId, Level)
  self.SelectedContracts[ContractId] = Level
  if Level <= 0 then
    self.SelectedContracts[ContractId] = nil
  end
end

function RougeContractModel:GetContractLevel(ContractId)
  return self.SelectedContracts[ContractId] or 0
end

function RougeContractModel:ResetContractLevel()
  self.SelectedContracts = {}
end

function RougeContractModel:MakeContractDesc(ContractData, Level)
  Level = Level or 0
  local ResultDesc = string.gsub(GText(ContractData.Desc) or "", "#%d", function(Word)
    local Index = tonumber(string.sub(Word, 2, 2))
    if Index and ContractData.DescValues[Index] then
      return SkillUtils.CalcSkillDesc(ContractData.DescValues[Index], math.max(Level - 1, 0))
    end
    DebugPrint("\230\137\190\228\184\141\229\136\176\229\165\145\231\186\166" .. ContractData.Id .. " \231\154\132\231\172\172 " .. Index .. " \230\157\161\230\143\143\232\191\176, \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165, \230\159\165\231\156\139RougeLikeContract\232\161\168!")
    UE.ARougeLikeManager.ShowRougeLikeError("\230\137\190\228\184\141\229\136\176\229\165\145\231\186\166" .. ContractData.Id .. " \231\154\132\231\172\172 " .. Index .. " \230\157\161\230\143\143\232\191\176,  \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165, \230\159\165\231\156\139RougeLikeContract\232\161\168!")
    return "?"
  end)
  return ResultDesc
end

function RougeContractModel:GetCurrentHeatValue()
  local HeatValue = 0
  for ContractId, ContractLevel in pairs(self.SelectedContracts) do
    local ContractData = DataMgr.RougeLikeContract[ContractId]
    if ContractData then
      HeatValue = HeatValue + ContractData.HeatValue * ContractLevel
    end
  end
  return HeatValue
end

function RougeContractModel:GetCurrentContractPointRate()
  local ContractSeasonData = DataMgr.RougeLikeSeason[self.SeasonId]
  if ContractSeasonData then
    if not ContractSeasonData.PointContractRate then
      UE.ARougeLikeManager.ShowRougeLikeError("\229\189\147\229\137\141\232\181\155\229\173\163\230\156\170\229\161\171\229\134\153\232\181\155\229\173\163\231\167\175\229\136\134\229\128\141\231\142\135! \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165")
      return 0
    end
    return ContractSeasonData.PointContractRate * self:GetCurrentHeatValue()
  end
  return 0
end

function RougeContractModel:ConfirmSelectedContract()
  self.Avatar.RougeLike.Contract = self.SelectedContracts
  self.Avatar:SaveContract(nil, self.Avatar.RougeLike.Contract)
end

return RougeContractModel
