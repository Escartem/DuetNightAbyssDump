local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self._Avatar = nil
  self:GetAvatar()
  self._ModelInfo = {}
  self._PersonID = nil
  self._DisplayPlan = {}
  self.OtherPersonInfo = nil
  self.OtherBattleDumpInfo = nil
end

function M:InitData(PlayerInfo)
  if self._Avatar == nil then
    self._Avatar = GWorld:GetAvatar()
  end
  if nil ~= PlayerInfo then
    self._PersonID = PlayerInfo.Uuid
    self.OtherPersonInfo = PlayerInfo
  else
    self._PersonID = nil
    self.OtherPersonInfo = nil
  end
  self._DisplayPlan = {}
  self._DisplayPlan.CharDisplayPlans = {
    [1] = {},
    [2] = {},
    [3] = {}
  }
  self._DisplayPlan.WeaponDisplayPlans = {
    [1] = {},
    [2] = {},
    [3] = {}
  }
  if nil ~= self._PersonID then
    local CharInfo = self:ChangeToCharBattleDumpInfo(PlayerInfo.Char)
    local WeaponInfo = self:ChangeToWeaponBattleDumpInfo(PlayerInfo.Weapon)
    self.OtherBattleDumpInfo = {Char = CharInfo, Weapon = WeaponInfo}
    self.OtherPersonInfo = PlayerInfo
    for i = 1, 3 do
      if self.OtherPersonInfo.Char[i] then
        self.OtherPersonInfo.Char[i].RoleId = self.OtherPersonInfo.Char[i].CharId
        self._DisplayPlan.CharDisplayPlans[i] = {
          CharId = self.OtherPersonInfo.Char[i].CharId
        }
      end
      if self.OtherPersonInfo.Weapon[i] then
        self.OtherPersonInfo.Weapon[i].RoleId = self.OtherPersonInfo.Weapon[i].WeaponId
        self._DisplayPlan.WeaponDisplayPlans[i] = {
          WeaponId = self.OtherPersonInfo.Weapon[i].WeaponId
        }
      end
    end
  else
    for i = 1, 3 do
      if nil ~= self._Avatar.PersonalInfo.CharDisplay[i] then
        if nil == self._Avatar.Chars[self._Avatar.PersonalInfo.CharDisplay[i].Id] then
          self._Avatar.PersonalInfo.CharDisplay[i].Id = -1
        end
        self._DisplayPlan.CharDisplayPlans[i] = {
          CharId = self._Avatar.PersonalInfo.CharDisplay[i].Id,
          AppearancePlan = self._Avatar.PersonalInfo.CharDisplay[i].AppearancePlan,
          ModPlan = self._Avatar.PersonalInfo.CharDisplay[i].ModPlan
        }
      end
      if nil ~= self._Avatar.PersonalInfo.WeaponDisplay[i] then
        if nil == self._Avatar.Weapons[self._Avatar.PersonalInfo.WeaponDisplay[i].Id] then
          self._Avatar.PersonalInfo.WeaponDisplay[i].Id = -1
        end
        self._DisplayPlan.WeaponDisplayPlans[i] = {
          WeaponId = self._Avatar.PersonalInfo.WeaponDisplay[i].Id,
          ModPlan = self._Avatar.PersonalInfo.WeaponDisplay[i].ModPlan
        }
      end
    end
  end
  for i = 1, 3 do
    local Plan = self._DisplayPlan.CharDisplayPlans[i]
    if nil == Plan then
      self._DisplayPlan.CharDisplayPlans[i] = {CharId = -1}
    elseif nil == Plan.CharId then
      Plan.CharId = -1
    end
    Plan = self._DisplayPlan.WeaponDisplayPlans[i]
    if nil == Plan then
      self._DisplayPlan.WeaponDisplayPlans[i] = {WeaponId = -1}
    elseif nil == Plan.WeaponId then
      Plan.WeaponId = -1
    end
  end
end

function M:IniOthersAvatar()
end

function M:fakaini()
  local i = 1
  for __, char in pairs(self._Avatar.Chars) do
    if i > 3 then
      break
    end
    self._DisplayPlan.CharDisplayPlans[i] = {
      CharId = char.Uuid,
      AppearancePlan = 1,
      ModPlan = 2
    }
    i = i + 1
  end
  i = 1
  for __, weapon in pairs(self._Avatar.Weapons) do
    if i > 3 then
      break
    end
    self._DisplayPlan.WeaponDisplayPlans[i] = {
      WeaponId = weapon.Uuid,
      ModPlan = 2
    }
    i = i + 1
  end
end

function M:SetPersonID(PersonID)
  self._PersonID = PersonID
end

function M:GetDisplayContent()
  local DisplayContent = {
    CharContent = {},
    WeaponContent = {}
  }
  if self:IsOwener() then
    for index, Plan in ipairs(self._DisplayPlan.CharDisplayPlans) do
      local uuid = Plan.CharId
      local CharData = {}
      if -1 ~= uuid then
        local id = self._Avatar.Chars[uuid].CharId
        CharData.Id = id
        local IconPath = DataMgr.Char[id].Icon
        CharData.Icon = IconPath
        local Rarity = DataMgr.Char[id].CharRarity
        CharData.Rarity = Rarity
        CharData.ItemType = "Char"
        CharData.Level = self._Avatar.Chars[uuid].Level
      else
        CharData.Id = uuid
      end
      DisplayContent.CharContent[index] = CharData
    end
    for index, Plan in ipairs(self._DisplayPlan.WeaponDisplayPlans) do
      local WeaponData = {}
      local uuid = Plan.WeaponId
      if -1 ~= uuid then
        local id = self._Avatar.Weapons[uuid].WeaponId
        WeaponData.Id = id
        local IconPath = DataMgr.Weapon[id].Icon
        WeaponData.Icon = IconPath
        local Rarity = DataMgr.Weapon[id].WeaponRarity
        WeaponData.Rarity = Rarity
        WeaponData.Level = self._Avatar.Weapons[uuid].Level
      else
        WeaponData.Id = -1
      end
      DisplayContent.WeaponContent[index] = WeaponData
    end
  else
    for i = 1, 3 do
      local CharData = {}
      if self.OtherPersonInfo and self.OtherPersonInfo.Char and self.OtherPersonInfo.Char[i] then
        local id = self.OtherPersonInfo.Char[i].CharId
        CharData.Id = id
        local IconPath = DataMgr.Char[id].Icon
        CharData.Icon = IconPath
        local Rarity = DataMgr.Char[id].CharRarity
        CharData.Rarity = Rarity
        CharData.ItemType = "Char"
        CharData.Level = self.OtherPersonInfo.Char[i].Level
      else
        CharData.Id = -1
      end
      DisplayContent.CharContent[i] = CharData
    end
    for i = 1, 3 do
      local WeaponData = {}
      if self.OtherPersonInfo and self.OtherPersonInfo.Weapon and self.OtherPersonInfo.Weapon[i] then
        local id = self.OtherPersonInfo.Weapon[i].WeaponId
        WeaponData.Id = id
        local IconPath = DataMgr.Weapon[id].Icon
        WeaponData.Icon = IconPath
        WeaponData.ItemType = "Weapon"
        local Rarity = DataMgr.Weapon[id].WeaponRarity
        WeaponData.Rarity = Rarity
        WeaponData.Level = self.OtherPersonInfo.Weapon[i].Level
      else
        WeaponData.Id = -1
      end
      DisplayContent.WeaponContent[i] = WeaponData
    end
    DisplayContent.Birthday = self.OtherPersonInfo.Birthday
  end
  return DisplayContent
end

function M:GetCharSuitIndex(index)
  if -1 == index or nil == index then
    DebugPrint("index \228\184\141\232\131\189\228\184\186-1\230\136\1500")
    return
  end
  local Uuid = self._DisplayPlan.CharDisplayPlans[index].CharId
  local suitindex = self._DisplayPlan.CharDisplayPlans[index].AppearancePlan
  if -1 == suitindex or 0 == suitindex then
    DebugPrint("\229\164\150\232\167\130\230\150\185\230\161\136\228\184\186-1\230\136\1500")
  end
  return Uuid, suitindex
end

function M:GetShowCharBaseInfo(index)
  if -1 == index then
    return nil
  end
  local CharId
  if self:IsOwener() then
    CharId = self._Avatar.Chars[self._DisplayPlan.CharDisplayPlans[index].CharId].CharId
  elseif self.OtherPersonInfo and self.OtherPersonInfo.Char[index] and self.OtherPersonInfo.Char[index].CharId then
    CharId = self.OtherPersonInfo.Char[index].CharId
  else
    return nil
  end
  local ElmtType = DataMgr.BattleChar[CharId].Attribute
  local IconName = "Armory_" .. ElmtType
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  local Rarity = DataMgr.Char[CharId].CharRarity
  local Name = DataMgr.Char[CharId].CharName
  if not self:IsOwener() and (160101 == CharId or 1601 == CharId) and self.OtherPersonInfo and self.OtherPersonInfo.Nickname then
    Name = self.OtherPersonInfo.Nickname
  end
  local CharData = {
    AttributeIcon = AttributeIcon,
    Rarity = Rarity,
    Name = Name
  }
  return CharData
end

function M:GetShowCharData(index)
  if self:IsOwener() then
    local CharData = self._Avatar.Chars[self._DisplayPlan.CharDisplayPlans[index].CharId]
    return CharData
  else
    for i, Char in pairs(self._fakeAvatar.Chars) do
      if Char.CharId == self.OtherBattleDumpInfo.Char[index].RoleId then
        return Char
      end
    end
    ScreenPrint("\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\230\173\166\229\153\168\230\149\176\230\141\174" .. debug.traceback())
    return self._fakeAvatar.Chars[index]
  end
end

function M:GetShowWeaponData(index)
  if -1 == index then
    return nil
  end
  if self:IsOwener() then
    local WeaponData = self._Avatar.Weapons[self._DisplayPlan.WeaponDisplayPlans[index].WeaponId]
    return WeaponData
  else
    for i, weapon in pairs(self._fakeAvatar.Weapons) do
      if weapon.WeaponId == self.OtherBattleDumpInfo.Weapon[index].WeaponId then
        return weapon
      end
    end
    ScreenPrint("\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\230\173\166\229\153\168\230\149\176\230\141\174" .. debug.traceback())
  end
end

function M:IsOwener()
  if self._PersonID ~= nil then
    return false
  else
    return true
  end
end

function M:GetPersonalBaseInfo()
  local _ModelInfo = {}
  if self:IsOwener() then
    _ModelInfo.PlayerName = self._Avatar.Nickname
    _ModelInfo.PlayerSignature = self._Avatar.Signature
    _ModelInfo.CurrentLevel = self._Avatar.Level
    _ModelInfo.HeadIconId = self._Avatar.HeadIconId
    _ModelInfo.HeadFrameId = self._Avatar.HeadFrameId
    _ModelInfo.Uid = self._Avatar.Uid
    _ModelInfo.IsOwner = true
    _ModelInfo.TitleFrame = self._Avatar.TitleFrame
    _ModelInfo.TitleAfter = self._Avatar.TitleAfter
    _ModelInfo.TitleBefore = self._Avatar.TitleBefore
  else
    _ModelInfo.PlayerName = self.OtherPersonInfo.Nickname
    _ModelInfo.PlayerSignature = self.OtherPersonInfo.Signature
    _ModelInfo.CurrentLevel = self.OtherPersonInfo.Level
    _ModelInfo.HeadIconId = self.OtherPersonInfo.HeadIconId
    _ModelInfo.HeadFrameId = self.OtherPersonInfo.HeadFrameId
    _ModelInfo.Uid = self.OtherPersonInfo.Uuid
    _ModelInfo.TitleFrame = self.OtherPersonInfo.TitleFrame
    _ModelInfo.TitleAfter = self.OtherPersonInfo.TitleAfter
    _ModelInfo.TitleBefore = self.OtherPersonInfo.TitleBefore
  end
  return _ModelInfo
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetWeaponUuid()
  return self._Avatar.WeaponUuid
end

function M:GetHeadIcon()
  local HeadFrameId = self._ModelInfo.HeadIconId
  if HeadFrameId then
    if -1 == HeadFrameId then
      return nil
    else
      local Path = DataMgr.HeadFrame[HeadFrameId].SmallIcon
      local ImageResource = LoadObject(Path)
      return ImageResource
    end
  end
end

function M:GetDisplayItemsUuid(bisweapon, index)
  local str
  if true == bisweapon then
    str = "Weapon"
  else
    str = "Char"
  end
  local uuid = self._DisplayPlan[str .. "DisplayPlans"][index][str .. "Id"]
  return uuid
end

function M:GetTemporModelPlan(bisweapon, index, Plans)
  local str, tempplans
  if true == bisweapon then
    str = "Weapon"
    tempplans = Plans.TempWeaponShowPlan
  else
    str = "Char"
    tempplans = Plans.TempCharShowPlan
  end
  if nil ~= tempplans and tempplans[index] then
    local plan = tempplans[index]
    return plan
  else
    return self._DisplayPlan[str .. "DisplayPlans"][index]
  end
end

function M:GetTemporModelBoxItemData(bisweapon, index, Plans)
  local data = self:GetTempEditBoxItemData(bisweapon, index, Plans)
  if -1 == data then
    return nil
  end
  if nil == data then
    return self:GetEditBoxItemData(bisweapon, index)
  end
  return data
end

function M:GetEditBoxItemData(bisweapon, index)
  local str
  if true == bisweapon then
    str = "Weapon"
  else
    str = "Char"
  end
  local uuid = self._DisplayPlan[str .. "DisplayPlans"][index][str .. "Id"]
  if -1 == uuid then
    return nil
  end
  local id = self._Avatar[str .. "s"][uuid][str .. "Id"]
  local data = {}
  local IconPath = DataMgr[str][id].GachaIcon
  data.image = LoadObject(IconPath)
  data.name = DataMgr[str][id][str .. "Name"]
  data.lv = self._Avatar[str .. "s"][uuid].Level
  local Rarity = DataMgr[str][id][str .. "Rarity"]
  data.Rarity = Rarity
  if bisweapon then
    data.Tag = self._Avatar[str .. "s"][uuid].WeaponTag
  end
  data.Uuid = uuid
  return data
end

function M:GetTempEditBoxItemData(bisweapon, index, Plans)
  local str, tempplan
  if true == bisweapon then
    str = "Weapon"
    tempplan = Plans.TempWeaponShowPlan
  else
    str = "Char"
    tempplan = Plans.TempCharShowPlan
  end
  local uuid
  if nil ~= tempplan and tempplan[index] then
    uuid = tempplan[index][str .. "Id"]
  end
  if -1 == uuid then
    return -1
  elseif nil == uuid then
    return nil
  end
  local id = self._Avatar[str .. "s"][uuid][str .. "Id"]
  local data = {}
  local IconPath = DataMgr[str][id].GachaIcon
  data.image = LoadObject(IconPath)
  data.name = DataMgr[str][id][str .. "Name"]
  data.lv = self._Avatar[str .. "s"][uuid].Level
  local Rarity = DataMgr[str][id][str .. "Rarity"]
  data.Rarity = Rarity
  if bisweapon then
    data.Tag = self._Avatar[str .. "s"][uuid].WeaponTag
  end
  data.Uuid = uuid
  return data
end

function M:GetItemName(bisweapon, content)
  local str
  if bisweapon then
    str = "Weapon"
  else
    str = "Char"
  end
  local id = content.UnitId
  return DataMgr[str][id][str .. "Name"]
end

function M:GetItemUuid(content)
  local id = content.Uuid
  return id
end

function M:SaveShowPlan(TempCharShowPlan, TempWeaponShowPlan)
  local strs = {"Char", "Weaqpon"}
  if nil ~= TempCharShowPlan then
    for i = 1, 3 do
      if nil ~= TempCharShowPlan[i] then
        local Plan = TempCharShowPlan[i]
        self:LocalUpdateCharDisplay(i, Plan.CharId, Plan.AppearancePlan, Plan.ModPlan)
      end
    end
    self:SortCharDisplay()
    for i = 1, 3 do
      if nil ~= self._DisplayPlan.CharDisplayPlans[i] then
        local Plan = self._DisplayPlan.CharDisplayPlans[i]
        if -1 ~= Plan.CharId and self._Avatar.PersonalInfo.CharDisplay[i] then
          self._Avatar:UpdateCharDisplay(self.ReallyUpdate, i, Plan.CharId, Plan.AppearancePlan, Plan.ModPlan)
        elseif -1 ~= Plan.CharId and not self._Avatar.PersonalInfo.CharDisplay[i] then
          self._Avatar:AddCharDisplay(self.ReallyUpdate, Plan.CharId, Plan.AppearancePlan, Plan.ModPlan)
        end
      end
    end
    for i = 3, 1, -1 do
      if nil ~= self._DisplayPlan.CharDisplayPlans[i] then
        local Plan = self._DisplayPlan.CharDisplayPlans[i]
        if -1 == Plan.CharId and self._Avatar.PersonalInfo.CharDisplay[i] then
          self._Avatar:RemoveCharDisplay(self.ReallyUpdate, i)
        end
      end
    end
  end
  if nil ~= TempWeaponShowPlan then
    for i = 1, 3 do
      if nil ~= TempWeaponShowPlan[i] then
        local Plan = TempWeaponShowPlan[i]
        self:LocalUpdateWeaponDisplay(i, Plan.WeaponId, Plan.ModPlan)
      end
    end
    self:SortWeaponDisplay()
    for i = 1, 3 do
      if nil ~= self._DisplayPlan.WeaponDisplayPlans[i] then
        local Plan = self._DisplayPlan.WeaponDisplayPlans[i]
        if -1 ~= Plan.WeaponId and self._Avatar.PersonalInfo.WeaponDisplay[i] then
          self._Avatar:UpdateWeaponDisplay(self.ReallyUpdate, i, Plan.WeaponId, Plan.ModPlan)
        elseif -1 ~= Plan.WeaponId and not self._Avatar.PersonalInfo.WeaponDisplay[i] then
          self._Avatar:AddWeaponDisplay(self.ReallyUpdate, Plan.WeaponId, Plan.ModPlan)
        end
      end
    end
    for i = 3, 1, -1 do
      if nil ~= self._DisplayPlan.WeaponDisplayPlans[i] then
        local Plan = self._DisplayPlan.WeaponDisplayPlans[i]
        if -1 == Plan.WeaponId and self._Avatar.PersonalInfo.WeaponDisplay[i] then
          self._Avatar:RemoveWeaponDisplay(self.ReallyUpdate, i)
        end
      end
    end
  end
end

function M:GetDisplayCharInfos()
  local CharInfos = {}
  if self:IsOwener() then
    local Avatar = GWorld:GetAvatar()
    for index = 1, 3 do
      if -1 == self._DisplayPlan.CharDisplayPlans[index].CharId then
        return CharInfos
      end
      local Char = self._Avatar.Chars[self._DisplayPlan.CharDisplayPlans[index].CharId]
      local ExtraModSuitIndex = self._DisplayPlan.CharDisplayPlans[index].ModPlan
      local AppearanceIndex = self._DisplayPlan.CharDisplayPlans[index].AppearancePlan
      local CharInfo = AvatarUtils:GetCharBattleInfo(Avatar, Char, ExtraModSuitIndex).RoleInfo
      CharInfo.AppearanceSuit = Char:DumpAppearanceSuit(Avatar, AppearanceIndex)
      table.insert(CharInfos, CharInfo)
    end
  else
    CharInfos = self.OtherBattleDumpInfo.Char
  end
  return CharInfos
end

function M:GetDisplayWeaponInfos()
  local WeaponInfos = {}
  if self:IsOwener() then
    local Avatar = GWorld:GetAvatar()
    for index = 1, 3 do
      if -1 == self._DisplayPlan.WeaponDisplayPlans[index].WeaponId then
        return WeaponInfos
      end
      local Weapon = self._Avatar.Weapons[self._DisplayPlan.WeaponDisplayPlans[index].WeaponId]
      local ExtraModSuitIndex = self._DisplayPlan.WeaponDisplayPlans[index].ModPlan
      local AvatarInfo = AvatarUtils:GetWeaponBattleInfo(Avatar, Weapon, ExtraModSuitIndex)
      local WeaponInfo
      if Weapon:IsMelee() then
        WeaponInfo = AvatarInfo.MeleeWeapon
      else
        WeaponInfo = AvatarInfo.RangedWeapon
      end
      table.insert(WeaponInfos, WeaponInfo)
    end
  else
    WeaponInfos = self.OtherBattleDumpInfo.Weapon
  end
  return WeaponInfos
end

function M:ChangeToCharBattleDumpInfo(CharInfos)
  local Chars = {}
  for i, CharInfo in ipairs(CharInfos) do
    local AppearanceSuit = {
      Colors = CharInfo.Appearance.SkinColors[CharInfo.Appearance.CurrentPlanIndex],
      SkinId = CharInfo.Appearance.SkinId,
      AccessorySuit = CharInfo.Appearance.Accessory
    }
    local SkillInfos = {}
    for _, Skill in ipairs(CharInfo.Skills) do
      if 1 ~= Skill.LockState then
        local bOnlyPhantom = false
        local SkillData = DataMgr.Skill[Skill.SkillId][Skill.Level][CharInfo.GradeLevel]
        if SkillData then
          bOnlyPhantom = SkillData.OnlyPhantom
        end
        if bOnlyPhantom then
        else
          local SkillInfo = {}
          SkillInfo.Level = Skill.Level
          SkillInfo.ExtraLevel = Skill.ExtraLevel
          if 0 ~= CharInfo.GradeLevel then
            SkillInfo.Grade = CharInfo.GradeLevel
          end
          table.insert(SkillInfos, {
            SkillId = Skill.SkillId,
            SkillInfo = SkillInfo
          })
        end
      end
    end
    local SlotData = {}
    local ModData = {}
    for Index, ModSuit in ipairs(CharInfo.ModSuit) do
      table.insert(SlotData, {
        ModEid = ModSuit.Mod and ModSuit.Mod.ModId or nil,
        SlotId = Index,
        Polarity = ModSuit.Polarity
      })
      if ModSuit.Mod then
        table.insert(ModData, {
          Uuid = ModSuit.Mod.ModId,
          ModId = ModSuit.Mod.ModId,
          Level = ModSuit.Mod.Level,
          CurrentModCardLevel = ModSuit.Mod.CurrentModCardLevel
        })
      end
    end
    local Char = {
      AppearanceSuit = AppearanceSuit,
      RoleId = CharInfo.CharId,
      Level = CharInfo.Level,
      GradeLevel = CharInfo.GradeLevel,
      EnhanceLevel = CharInfo.EnhanceLevel,
      SkillInfos = SkillInfos,
      SlotData = SlotData,
      ModData = ModData,
      SkillTreeInfos = CharInfo.SkillTree,
      ModSuitIndex = 1
    }
    table.insert(Chars, Char)
  end
  return Chars
end

function M:ChangeToWeaponBattleDumpInfo(WeaponInfos)
  local Weapons = {}
  for i, WeaponInfo in ipairs(WeaponInfos) do
    local AppearanceInfo = {
      SkinId = WeaponInfo.Appearance.SkinId,
      AccessoryId = WeaponInfo.Appearance.Accessory[1],
      Colors = {
        Colors = WeaponInfo.Appearance.SkinColors[WeaponInfo.Appearance.CurrentPlanIndex],
        SpecialColor = WeaponInfo.Appearance.SpecialColor[WeaponInfo.Appearance.CurrentPlanIndex]
      }
    }
    local SlotData = {}
    local ModData = {}
    for Index, ModSuit in ipairs(WeaponInfo.ModSuit) do
      table.insert(SlotData, {
        ModEid = ModSuit.Mod and ModSuit.Mod.ModId or nil,
        SlotId = Index,
        Polarity = ModSuit.Polarity
      })
      if ModSuit.Mod then
        table.insert(ModData, {
          Uuid = ModSuit.Mod.ModId,
          ModId = ModSuit.Mod.ModId,
          Level = ModSuit.Mod.Level,
          CurrentModCardLevel = ModSuit.Mod.CurrentModCardLevel
        })
      end
    end
    local Weapon = {
      AppearanceInfo = AppearanceInfo,
      WeaponId = WeaponInfo.WeaponId,
      Level = WeaponInfo.Level,
      GradeLevel = WeaponInfo.GradeLevel,
      EnhanceLevel = WeaponInfo.EnhanceLevel,
      SlotData = SlotData,
      ModData = ModData,
      ModSuitIndex = 1
    }
    table.insert(Weapons, Weapon)
  end
  return Weapons
end

function M:LocalUpdateCharDisplay(index, CharId, AppearancePlan, ModPlan)
  self._DisplayPlan.CharDisplayPlans[index] = {
    CharId = CharId or -1,
    AppearancePlan = AppearancePlan or 1,
    ModPlan = ModPlan or 1
  }
end

function M:LocalUpdateWeaponDisplay(index, WeaponId, ModId)
  self._DisplayPlan.WeaponDisplayPlans[index] = {
    WeaponId = WeaponId or -1,
    ModPlan = ModId or 1
  }
end

function M:ReallyUpdate()
  DebugPrint("yklua66 SuccessCallback")
end

function M:SortCharDisplay()
  local j = 1
  for i = 1, #self._DisplayPlan.CharDisplayPlans do
    local temp = self._DisplayPlan.CharDisplayPlans[i]
    if nil ~= temp and -1 ~= temp.CharId then
      if i ~= j then
        self._DisplayPlan.CharDisplayPlans[j] = self._DisplayPlan.CharDisplayPlans[i]
        self._DisplayPlan.CharDisplayPlans[i] = {CharId = -1}
      end
      j = j + 1
    end
  end
  for k = j, #self._DisplayPlan.CharDisplayPlans do
    self._DisplayPlan.CharDisplayPlans[k] = {CharId = -1}
  end
end

function M:SortWeaponDisplay()
  local j = 1
  for i = 1, #self._DisplayPlan.WeaponDisplayPlans do
    local temp = self._DisplayPlan.WeaponDisplayPlans[i]
    if nil ~= temp and -1 ~= temp.WeaponId then
      if i ~= j then
        self._DisplayPlan.WeaponDisplayPlans[j] = self._DisplayPlan.WeaponDisplayPlans[i]
        self._DisplayPlan.WeaponDisplayPlans[i] = {WeaponId = -1}
      end
      j = j + 1
    end
  end
  for k = j, #self._DisplayPlan.WeaponDisplayPlans do
    self._DisplayPlan.WeaponDisplayPlans[k] = {WeaponId = -1}
  end
end

function M:GetAppearanceAndModPlan(bisweapon, index)
  local str, plan = "Char", self._DisplayPlan.CharDisplayPlans[index]
  if true == bisweapon then
    str = "Weapon"
    plan = self._DisplayPlan.WeaponDisplayPlans[index]
  end
  if nil ~= plan then
    if bisweapon then
      return 1, plan.ModPlan
    else
      return plan.AppearancePlan, plan.ModPlan
    end
  else
    return 1, 1
  end
end

function M:GetFakeAvatar()
  if self._fakeAvatar == nil then
    ArmoryUtils:CreateDummyAvatar({
      CharInfos = {
        self.OtherBattleDumpInfo.Char[1],
        self.OtherBattleDumpInfo.Char[2],
        self.OtherBattleDumpInfo.Char[3]
      },
      WeaponInfos = {
        self.OtherBattleDumpInfo.Weapon[1],
        self.OtherBattleDumpInfo.Weapon[2],
        self.OtherBattleDumpInfo.Weapon[3]
      }
    })
    ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Custom)
    local Avatar = ArmoryUtils:GetAvatar()
    self._fakeAvatar = Avatar
    return Avatar
  else
    return self._fakeAvatar
  end
end

function M:DeleteFakeAvatar()
  if self._fakeAvatar ~= nil then
    ArmoryUtils:DestroyDummyAvatar()
    self._fakeAvatar = nil
  end
end

function M:GetDataPageVisibility()
  if self:IsOwener() then
    ScreenPrint("\228\184\141\229\186\148\232\175\165\232\142\183\229\143\150\232\135\170\229\183\177\231\149\140\233\157\162\231\154\132\229\143\175\232\167\129\230\128\167")
  else
    return self.OtherPersonInfo.Visible
  end
end

function M:ClearModel()
  self._ModelInfo = {}
  self._PersonID = nil
  self._DisplayPlan = {}
  self.OtherPersonInfo = nil
  self.OtherBattleDumpInfo = nil
end

return M
