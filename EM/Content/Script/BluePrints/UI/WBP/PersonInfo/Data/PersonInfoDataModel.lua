require("UnLua")
local M = {}
local DesignatedName2Func

function M:Init(OtherPersonInfo)
  if OtherPersonInfo then
    self:InitOthers(OtherPersonInfo)
  else
    self:InitSelf()
  end
end

function M:Clear()
end

function M:InitSelf()
  self._Avatar = GWorld:GetAvatar()
  self.IsSelf = true
  self.PersonalInfoVisible = self._Avatar.PersonalInfo.Visible or 1
  self.Name = self._Avatar.Nickname or " "
  self.Uid = self._Avatar.Uid or 0
  local totalSeconds = self._Avatar.TotalOnlineTime or 0
  self.TotalOnlineTime = string.format("%.1f", totalSeconds / 3600)
  self.CreateTime = os.date("%Y/%m/%d", self._Avatar.CreateTime) or ""
  ScreenPrint("CreateTime:", self.CreateTime)
  self.CharsCount = self._Avatar.Chars:Length()
  self.MeleeCount, self.RangedCount = AvatarUtils:GetPlayerPersonalInfoWeaponCount(self._Avatar)
  self.MeleeCount = self._Avatar.Archives[1002]:GetArchiveCount()
  self.RangedCount = self._Avatar.Archives[1003]:GetArchiveCount()
  self.PetCount = self._Avatar.Pets:Length()
  self.ModCount = self._Avatar.Mods:Length()
  self.CharSkinCount = AvatarUtils:GetPlayerPersonalInfoCharSkinCount(self._Avatar)
  self.WeaponSkinCount = self._Avatar.OwnedWeaponSkins:Length()
  self.CharAccessorys = self._Avatar.CharAccessorys:Length()
  self.WeaponAccessorys = self._Avatar.WeaponAccessorys:Length()
  self.Achievement_Array, self.Achievement_Count = AvatarUtils:GetPlayerPersonalInfoAchievementCount(self._Avatar)
  for i = 1, 3 do
    if not self.Achievement_Array[i] then
      self.Achievement_Array[i] = 0
    end
  end
  self.Abyss_Difficulty, self.Abyss_Step, self.Abyss_Star = table.unpack(AvatarUtils:GetAbyssSeasonMaxProgress(self._Avatar))
  self.Rouge_Difficulty = AvatarUtils:GetPlayerPersonalInfoRougeLikeProgress(self._Avatar)
end

function M:InitOthers(OtherPersonInfo)
  self.IsSelf = false
  self.OtherPersonInfo = OtherPersonInfo
  self.PersonalInfoVisible = OtherPersonInfo.Visible or 1
  self.Name = OtherPersonInfo.Nickname or " "
  self.Uid = OtherPersonInfo.Uuid or 0
  self.TotalOnlineTime = string.format("%.1f", OtherPersonInfo.TotalOnlineTime / 3600)
  self.CreateTime = os.date("%Y/%m/%d", OtherPersonInfo.CreateTime) or ""
  ScreenPrint("CreateTime:" .. self.CreateTime)
  self.CharsCount = OtherPersonInfo.CharCount or 0
  self.MeleeCount = OtherPersonInfo.MeleeWeaponCount or 0
  self.RangedCount = OtherPersonInfo.RangedWeaponCount or 0
  self.CharSkinCount = OtherPersonInfo.CharSkinCount or 0
  self.WeaponSkinCount = OtherPersonInfo.WeaponSkinCount or 0
  self.CharAccessorys = OtherPersonInfo.CharAccessoryCount or 0
  self.WeaponAccessorys = OtherPersonInfo.WeaponAccessoryCount or 0
  self.ModCount = OtherPersonInfo.ModCount or 0
  self.PetCount = OtherPersonInfo.PetCount or 0
  self.Achievement_Array = OtherPersonInfo.AchievementCount or {}
  self.Achievement_Count = 0
  for i = 1, 3 do
    if not self.Achievement_Array[i] then
      self.Achievement_Array[i] = 0
    end
    self.Achievement_Count = self.Achievement_Count + self.Achievement_Array[i]
  end
  self.Rouge_Difficulty = OtherPersonInfo.RougeLikeProgress
  local AbyssProgress = OtherPersonInfo.AbyssProgress or {}
  for i = 1, 3 do
    if not AbyssProgress[i] then
      AbyssProgress[i] = 0
    end
  end
  self.Abyss_Difficulty, self.Abyss_Step, self.Abyss_Star = table.unpack(AbyssProgress)
end

function M:CalulatorCreateTime()
end

function M:GetIsSelf()
  return self.IsSelf
end

function M:GetPersonalInfoVisible()
  return self.PersonalInfoVisible
end

function M:GetPlayerName()
  return self.Name
end

function M:GetPlayerUid()
  return self.Uid
end

function M:GetPlayTime()
  return self.TotalOnlineTime
end

function M:GetCreateTime()
  return self.CreateTime
end

function M:GetRougeLikeProgress()
  return self.RougeLikeProgress
end

function M:GetUniqueDatailedDatas()
  local OriginData = DataMgr.PersonalUniqueDetails
  local UniqueDatailedDatas = {}
  for k, value in pairs(OriginData) do
    local Copy = {}
    Copy.Count = self:GetUniqueDatailedNumber(value.Event)
    Copy.Name = value.Des
    Copy.Sort = value.Sort
    table.insert(UniqueDatailedDatas, Copy)
  end
  table.sort(UniqueDatailedDatas, function(a, b)
    return a.Sort < b.Sort
  end)
  return UniqueDatailedDatas
end

function M:GetUniqueDatailedNumber(Key)
  print("GetUniqueDatailedNumber:", Key)
  if nil == DesignatedName2Func[Key] then
    ScreenPrint("Key \228\184\141\229\173\152\229\156\168 Key=" .. Key)
    for k, value in pairs(DataMgr.PersonalUniqueDetails) do
      ScreenPrint("Key=", Key, "value= ", value)
    end
    return nil
  end
  return DesignatedName2Func[Key](self) or "888"
end

function M:SortDetailedTabInfo()
  if self.DetailedTabInfo == nil then
    self.DetailedTabInfo = {}
  end
  local OriginTabsInfo = DataMgr.PersonalDetailsTab
  self.DetailedTabInfo = {}
  for index, value in pairs(OriginTabsInfo) do
    local copy = {}
    copy.Name = value.Name
    copy.TabID = value.TabID
    self.DetailedTabInfo[value.TabID] = copy
  end
  table.sort(self.DetailedTabInfo, function(a, b)
    return a.Sort < b.Sort
  end)
  local RawData = DataMgr.PersonalDetails
  local SortData = {}
  for k, value in pairs(RawData) do
    table.insert(SortData, value)
  end
  table.sort(SortData, function(a, b)
    return a.Sort < b.Sort
  end)
  for k, value in pairs(SortData) do
    if value.TabID then
      if nil == self.DetailedTabInfo[value.TabID] then
      else
        if nil == self.DetailedTabInfo[value.TabID].Contents then
          self.DetailedTabInfo[value.TabID].Contents = {}
        end
        local copy = {}
        copy.Des = value.Des
        copy.Event = value.Event
        copy.Count = self:GetUniqueDatailedNumber(value.Event)
        table.insert(self.DetailedTabInfo[value.TabID].Contents, copy)
      end
    else
      ScreenPrint("PersonalDetailsTab \232\161\168\229\134\133TabID\228\184\186\231\169\186,Event\228\184\186\239\188\154" .. value.Event or "\231\169\186")
    end
  end
end

function M:GetHaveCharsCount()
  return self.CharsCount or 0
end

function M:GetHaveMeleeCount()
  return self.MeleeCount or 0
end

function M:GetHaveRangedCount()
  return self.RangedCount or 0
end

function M:GetHaveCharSkinCount()
  return self.CharSkinCount or 0
end

function M:GetHaveWeaponSkinCount()
  return self.WeaponSkinCount or 0
end

function M:GetHaveCharAccessoryCount()
  return self.CharAccessorys or 0
end

function M:GetHaveWeaponAccessoryCount()
  return self.WeaponAccessorys or 0
end

function M:GetHaveModCount()
  return self.ModCount or 0
end

function M:GetHavePetCount()
  return self.PetCount or 0
end

function M:GetHaveModCount()
  return self.ModCount or 0
end

function M:GetAccoutCreateTime()
  return self.CreateTime or 0
end

function M:GetAchievementCount()
  return self.Achievement_Count or 0
end

function M:GetAchievementArray()
  return self.Achievement_Array or {
    0,
    0,
    0
  }
end

function M:GetMoreDetailedTabs()
  return self.DetailedTabInfo
end

function M:FindTabDetailedData(TabName)
  return DataMgr.PersonalDetails[TabName]
end

function M:GetChildInfoInTab(TabIndex)
  return DataMgr.PersonalDetails[TabIndex]
end

function M:GetAbyss_Difficulty()
  local Text, AbyssSeasonConfig
  for index, value in pairs(DataMgr.AbyssSeason) do
    if value.AbyssType == self.Abyss_Difficulty then
      AbyssSeasonConfig = value
      break
    end
  end
  local MaxAbyssProgress = self.Abyss_Step
  local MaxAbyssProgressStr = string.format(GText("Abyss_LevelName"), MaxAbyssProgress)
  Text = string.format("%s%s%s", GText(AbyssSeasonConfig.AbyssIdName), "/", MaxAbyssProgressStr)
  return Text
end

function M:GetAbyss_Step()
  return self.Abyss_Step
end

function M:GetAbyss_Star()
  return self.Abyss_Star
end

function M:GetRouge_Difficulty()
  return self.Rouge_Difficulty
end

function M:SetInfoVisibility(Visible)
  self._Avatar:SetPersonalInfoVisible(Visible)
end

function M:ClearModel()
  self._Avatar = nil
end

DesignatedName2Func = {
  Collection_Char = M.GetHaveCharsCount,
  Collection_Melee = M.GetHaveMeleeCount,
  Collection_Range = M.GetHaveRangedCount,
  Collection_Skin = M.GetHaveCharSkinCount,
  Collection_WeaponSkin = M.GetHaveWeaponSkinCount,
  Collection_CharAccessory = M.GetHaveCharAccessoryCount,
  Collection_WeaponAccessory = M.GetHaveWeaponAccessoryCount,
  Collection_Mod = M.GetHaveModCount,
  Collection_Pet = M.GetHavePetCount,
  Rouge_Difficulty = M.GetRouge_Difficulty,
  Abyss_Star = M.GetAbyss_Star,
  Abyss_Step = M.GetAbyss_Step,
  Abyss_Difficulty = M.GetAbyss_Difficulty
}
return M
