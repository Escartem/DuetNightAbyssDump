require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local BattleProfile = Class()

function BattleProfile:OnFinishProfile()
  local PassTime = self.StopTime - self.StartTime
  local PassFrameCount = self.StopFrameCount - self.StartFrameCount
  local ct = {"\n"}
  Battle(self):FillBattleLog(ct)
  local ret = table.concat(ct)
  local LogStr = "\230\136\152\230\150\151Profile\231\187\147\230\157\159\239\188\140\231\148\168\230\151\182:[" .. tostring(PassTime) .. "]\231\167\146\239\188\140\231\148\168\230\151\182:[" .. tostring(PassFrameCount) .. "]\229\184\167\227\128\130\n\229\185\179\229\157\135\229\184\167\231\142\135:[" .. tostring(PassFrameCount / PassTime) .. "](\228\188\154\229\143\151\230\154\130\229\129\156/\230\151\182\233\151\180\232\134\168\232\131\128\229\189\177\229\147\141,\228\184\141\228\184\128\229\174\154\229\135\134)" .. ret
  DebugPrint(LogStr)
  if not (PassTime and not (PassTime <= 0) and PassFrameCount) or PassFrameCount <= 0 then
    return
  end
  local BattleProfileInfo = {}
  BattleProfileInfo["\228\188\164\229\174\179Profile"] = self:GetDamageInfo(PassTime, PassFrameCount)
  BattleProfileInfo["\230\138\128\232\131\189Profile"] = self:GetSkillInfo(PassTime, PassFrameCount)
  BattleProfileInfo.BuffProfile = self:GetBuffInfo(PassTime, PassFrameCount)
  BattleProfileInfo.BuffChangedProfile = self:GetBuffChangedInfo(PassTime, PassFrameCount)
  BattleProfileInfo["\231\137\185\230\149\136Profile"] = self:GetPlayFxInfo(PassTime, PassFrameCount)
  BattleProfileInfo["\233\159\179\233\162\145Profile"] = self:GetPlaySEInfo(PassTime, PassFrameCount)
  BattleProfileInfo["\229\135\189\230\149\176\232\176\131\231\148\168Profile"] = self:GetFunctionCallInfo(PassTime, PassFrameCount)
  BattleProfileInfo["UProperty\232\176\131\231\148\168Profile"] = self:GetUPropertyCallInfo(PassTime, PassFrameCount)
  LogStr = LogStr .. PrintTable(BattleProfileInfo, 10, "\230\136\152\230\150\151Profile\232\175\166\230\131\133", true)
  local TimeStr = TimeUtils.TimeToYMDHMSStr(TimeUtils.RealTime(), false, "_", "_")
  local FilePath = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "BattleProfile/" .. tostring(TimeStr) .. ".txt"
  UE.URuntimeCommonFunctionLibrary.SaveFile(FilePath, LogStr)
end

function BattleProfile:GetDamageInfo(PassTime, PassFrameCount)
  local TotalTime = self.Damages:Length()
  local DamageProfileInfo = {}
  DamageProfileInfo["\230\128\187\228\188\164\229\174\179\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    local TimePerSecond = TotalTime / PassTime
    DamageProfileInfo["\229\185\179\229\157\135\228\188\164\229\174\179\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local FrameCountToTimeSecond = {}
    for _, DamageInfo in pairs(self.Damages) do
      local TimeSecond = DamageInfo.TimeSecond
      TimeSecondInfos[TimeSecond] = (TimeSecondInfos[TimeSecond] or 0) + 1
      local FrameCount = DamageInfo.FrameCount
      FrameCountInfos[FrameCount] = (FrameCountInfos[FrameCount] or 0) + 1
      FrameCountToTimeSecond[FrameCount] = TimeSecond
    end
    local MaxNum = 0
    local MaxNumIndex = 0
    for TimeSecond, Num in pairs(TimeSecondInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = TimeSecond
      end
    end
    DamageProfileInfo["\230\156\128\233\171\152\228\188\164\229\174\179\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152\228\188\164\229\174\179\230\172\161\230\149\176"] = MaxNum
    }
    local MaxNum = 0
    local MaxNumIndex = 0
    for FrameCount, Num in pairs(FrameCountInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = FrameCount
      end
    end
    DamageProfileInfo["\230\156\128\233\171\152\228\188\164\229\174\179\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152\228\188\164\229\174\179\230\172\161\230\149\176"] = MaxNum
    }
    local TagDamages = {}
    for _, DamageInfo in pairs(self.Damages) do
      for _, Tag in pairs(DamageInfo.DamageTag) do
        TagDamages[Tag] = (TagDamages[Tag] or 0) + 1
      end
    end
    local SortedTagDamages = {}
    for Tag, Num in pairs(TagDamages) do
      table.insert(SortedTagDamages, {
        ["\228\188\164\229\174\179Tag"] = Tag,
        ["\228\188\164\229\174\179\230\149\176\233\135\143"] = Num,
        ["\229\141\160\228\188\164\229\174\179\230\149\176\233\135\143\231\153\190\229\136\134\230\175\148"] = tostring(math.floor(Num / TotalTime * 100)) .. "%"
      })
    end
    table.sort(SortedTagDamages, function(a, b)
      return a["\228\188\164\229\174\179\230\149\176\233\135\143"] > b["\228\188\164\229\174\179\230\149\176\233\135\143"]
    end)
    DamageProfileInfo["\228\188\164\229\174\179\229\136\134\229\184\131(\230\140\137\230\149\176\233\135\143\228\187\142\233\171\152\229\136\176\229\186\149)"] = SortedTagDamages
    local MaxTrueValue = 0
    for _, DamageInfo in pairs(self.Damages) do
      if MaxTrueValue < DamageInfo.TrueValue then
        MaxTrueValue = DamageInfo.TrueValue
      end
    end
    DamageProfileInfo["\230\156\128\233\171\152\228\188\164\229\174\179\229\128\188"] = MaxTrueValue
    local CritNum = 0
    local MaxCritLevel = 0
    for _, DamageInfo in pairs(self.Damages) do
      local IsCrit = DamageInfo.IsCrit
      if IsCrit then
        CritNum = CritNum + 1
        local DamageCritLevel = DamageInfo.DamageCritLevel
        MaxCritLevel = math.max(MaxCritLevel, DamageCritLevel)
      end
    end
    if CritNum > 0 then
      DamageProfileInfo["\230\154\180\229\135\187\228\191\161\230\129\175"] = {
        ["\230\128\187\230\154\180\229\135\187\233\162\145\231\142\135"] = CritNum / TotalTime
      }
    end
  end
  return DamageProfileInfo
end

function BattleProfile:GetSkillInfo(PassTime, PassFrameCount)
  local TotalTime = self.Skills:Length()
  local SkillProfileInfo = {}
  SkillProfileInfo["\230\138\128\232\131\189\228\189\191\231\148\168\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    local TimePerSecond = TotalTime / PassTime
    SkillProfileInfo["\229\185\179\229\157\135\230\138\128\232\131\189\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local FrameCountToTimeSecond = {}
    for _, SkillInfo in pairs(self.Skills) do
      local TimeSecond = SkillInfo.TimeSecond
      TimeSecondInfos[TimeSecond] = (TimeSecondInfos[TimeSecond] or 0) + 1
      local FrameCount = SkillInfo.FrameCount
      FrameCountInfos[FrameCount] = (FrameCountInfos[FrameCount] or 0) + 1
      FrameCountToTimeSecond[FrameCount] = TimeSecond
    end
    local MaxNum = 0
    local MaxNumIndex = 0
    for TimeSecond, Num in pairs(TimeSecondInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = TimeSecond
      end
    end
    SkillProfileInfo["\230\156\128\233\171\152\230\138\128\232\131\189\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152\230\138\128\232\131\189\230\172\161\230\149\176"] = MaxNum
    }
    local MaxNum = 0
    local MaxNumIndex = 0
    for FrameCount, Num in pairs(FrameCountInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = FrameCount
      end
    end
    SkillProfileInfo["\230\156\128\233\171\152\230\138\128\232\131\189\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152\230\138\128\232\131\189\230\172\161\230\149\176"] = MaxNum
    }
  end
  return SkillProfileInfo
end

function BattleProfile:GetBuffInfo(PassTime, PassFrameCount)
  local TotalTime = self.Buffs:Length()
  local BuffProfileInfo = {}
  BuffProfileInfo["1. Buff\230\183\187\229\138\160\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    local TimePerSecond = TotalTime / PassTime
    BuffProfileInfo["\229\185\179\229\157\135Buff\230\183\187\229\138\160\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local FrameCountToTimeSecond = {}
    for _, BuffInfo in pairs(self.Buffs) do
      local TimeSecond = BuffInfo.TimeSecond
      TimeSecondInfos[TimeSecond] = (TimeSecondInfos[TimeSecond] or 0) + 1
      local FrameCount = BuffInfo.FrameCount
      FrameCountInfos[FrameCount] = (FrameCountInfos[FrameCount] or 0) + 1
      FrameCountToTimeSecond[FrameCount] = TimeSecond
    end
    local MaxNum = 0
    local MaxNumIndex = 0
    for TimeSecond, Num in pairs(TimeSecondInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = TimeSecond
      end
    end
    BuffProfileInfo["2. \230\156\128\233\171\152Buff\230\183\187\229\138\160\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152Buff\230\183\187\229\138\160\230\172\161\230\149\176"] = MaxNum
    }
    local MaxNum = 0
    local MaxNumIndex = 0
    for FrameCount, Num in pairs(FrameCountInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = FrameCount
      end
    end
    BuffProfileInfo["3. \230\156\128\233\171\152Buff\230\183\187\229\138\160\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152Buff\230\183\187\229\138\160\230\172\161\230\149\176"] = MaxNum
    }
    local BuffNums = {}
    for _, BuffInfo in pairs(self.Buffs) do
      local BuffId = BuffInfo.Buffid
      BuffNums[BuffId] = (BuffNums[BuffId] or 0) + 1
    end
    local SorteBuffNums = {}
    for BuffId, Num in pairs(BuffNums) do
      table.insert(SorteBuffNums, {
        BuffID = BuffId,
        ["Buff\230\183\187\229\138\160\230\172\161\230\149\176"] = Num,
        ["\229\141\160Buff\230\149\176\233\135\143\231\153\190\229\136\134\230\175\148"] = tostring(math.floor(Num / TotalTime * 100)) .. "%"
      })
    end
    table.sort(SorteBuffNums, function(a, b)
      return a["Buff\230\183\187\229\138\160\230\172\161\230\149\176"] > b["Buff\230\183\187\229\138\160\230\172\161\230\149\176"]
    end)
    BuffProfileInfo["4. Buff\229\136\134\229\184\131(\230\140\137\230\149\176\233\135\143\228\187\142\233\171\152\229\136\176\229\186\149)"] = SorteBuffNums
  end
  return BuffProfileInfo
end

function BattleProfile:GetPlayFxInfo(PassTime, PassFrameCount)
  local TotalTime = self.PlayFxs:Length()
  local PlayFxProfileInfo = {}
  PlayFxProfileInfo["\231\137\185\230\149\136\228\189\191\231\148\168\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    local TimePerSecond = TotalTime / PassTime
    PlayFxProfileInfo["\229\185\179\229\157\135\231\137\185\230\149\136\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local FrameCountToTimeSecond = {}
    for _, PlayFxInfo in pairs(self.PlayFxs) do
      local TimeSecond = PlayFxInfo.TimeSecond
      TimeSecondInfos[TimeSecond] = (TimeSecondInfos[TimeSecond] or 0) + 1
      local FrameCount = PlayFxInfo.FrameCount
      FrameCountInfos[FrameCount] = (FrameCountInfos[FrameCount] or 0) + 1
      FrameCountToTimeSecond[FrameCount] = TimeSecond
    end
    local MaxNum = 0
    local MaxNumIndex = 0
    for TimeSecond, Num in pairs(TimeSecondInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = TimeSecond
      end
    end
    PlayFxProfileInfo["\230\156\128\233\171\152\231\137\185\230\149\136\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152\231\137\185\230\149\136\230\172\161\230\149\176"] = MaxNum
    }
    local MaxNum = 0
    local MaxNumIndex = 0
    for FrameCount, Num in pairs(FrameCountInfos) do
      if Num > MaxNum then
        MaxNum = Num
        MaxNumIndex = FrameCount
      end
    end
    PlayFxProfileInfo["\230\156\128\233\171\152\231\137\185\230\149\136\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152\231\137\185\230\149\136\230\172\161\230\149\176"] = MaxNum
    }
    local PlayFxNums = {}
    for _, PlayFxInfo in pairs(self.PlayFxs) do
      local FxId = PlayFxInfo.FxId
      PlayFxNums[FxId] = (PlayFxNums[FxId] or 0) + 1
    end
    local SortePlayFxNums = {}
    for FxId, Num in pairs(PlayFxNums) do
      table.insert(SortePlayFxNums, {
        ["\231\137\185\230\149\136ID"] = FxId,
        ["\231\137\185\230\149\136\230\172\161\230\149\176"] = Num,
        ["\229\141\160\231\137\185\230\149\136\230\149\176\233\135\143\231\153\190\229\136\134\230\175\148"] = tostring(math.floor(Num / TotalTime * 100)) .. "%"
      })
    end
    table.sort(SortePlayFxNums, function(a, b)
      return a["\231\137\185\230\149\136\230\172\161\230\149\176"] > b["\231\137\185\230\149\136\230\172\161\230\149\176"]
    end)
    PlayFxProfileInfo["\231\137\185\230\149\136\229\136\134\229\184\131(\230\140\137\230\149\176\233\135\143\228\187\142\233\171\152\229\136\176\229\186\149)"] = SortePlayFxNums
  end
  return PlayFxProfileInfo
end

function BattleProfile:GetPlaySEInfo(PassTime, PassFrameCount)
  local TotalTime = self.PlaySEs:Length()
  local PlaySEProfileInfo = {}
  PlaySEProfileInfo["\233\159\179\230\149\136\232\176\131\231\148\168\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    PlaySEProfileInfo["\229\185\179\229\157\135\232\176\131\231\148\168\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local PlaySENums = {}
    local LEPlaySEs = {}
    local SoundId, LEPName, OName
    for _, PlaySEInfo in pairs(self.PlaySEs) do
      TimeSecondInfos[PlaySEInfo.TimeSecond] = (TimeSecondInfos[PlaySEInfo.TimeSecond] or 0) + 1
      FrameCountInfos[PlaySEInfo.FrameCount] = (FrameCountInfos[PlaySEInfo.FrameCount] or 0) + 1
      SoundId = PlaySEInfo.SoundId
      PlaySENums[SoundId] = (PlaySENums[SoundId] or 0) + 1
      LEPName = PlaySEInfo.LogicEventPlayerName
      OName = PlaySEInfo.ObjectName
      LEPlaySEs[LEPName] = LEPlaySEs[LEPName] or {}
      LEPlaySEs[LEPName].TotalNum = (LEPlaySEs[LEPName].TotalNum or 0) + 1
      LEPlaySEs[LEPName].Other = LEPlaySEs[LEPName].Other or {}
      LEPlaySEs[LEPName].Other[SoundId] = LEPlaySEs[LEPName].Other[SoundId] or {}
      LEPlaySEs[LEPName].Other[SoundId][OName] = (LEPlaySEs[LEPName].Other[SoundId][OName] or 0) + 1
    end
    local MaxNum = 0
    for _, Num in pairs(TimeSecondInfos) do
      if Num > MaxNum then
        MaxNum = Num
      end
    end
    PlaySEProfileInfo["\230\156\128\233\171\152\233\159\179\230\149\136\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152\233\159\179\230\149\136\230\172\161\230\149\176"] = MaxNum
    }
    MaxNum = 0
    for _, Num in pairs(FrameCountInfos) do
      if Num > MaxNum then
        MaxNum = Num
      end
    end
    PlaySEProfileInfo["\230\156\128\233\171\152\233\159\179\230\149\136\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152\233\159\179\230\149\136\230\172\161\230\149\176"] = MaxNum
    }
    local SortPlaySENums = {}
    for SoundId, Num in pairs(PlaySENums) do
      table.insert(SortPlaySENums, {
        ["\233\159\179\230\149\136ID"] = SoundId,
        ["\233\159\179\230\149\136\230\172\161\230\149\176"] = Num,
        ["\229\141\160\233\159\179\230\149\136\230\149\176\233\135\143\231\153\190\229\136\134\230\175\148"] = tostring(math.floor(Num / TotalTime * 100)) .. "%"
      })
    end
    table.sort(SortPlaySENums, function(a, b)
      return a["\233\159\179\230\149\136\230\172\161\230\149\176"] > b["\233\159\179\230\149\136\230\172\161\230\149\176"]
    end)
    PlaySEProfileInfo["\233\159\179\230\149\136\229\136\134\229\184\131(\230\140\137\230\149\176\233\135\143\228\187\142\233\171\152\229\136\176\229\186\149)"] = SortPlaySENums
    local SortLEPlaySEs = {}
    for Name, Info in pairs(LEPlaySEs) do
      table.insert(SortLEPlaySEs, {
        ["\230\146\173\230\148\190\230\157\165\230\186\144"] = Name,
        ["\233\159\179\230\149\136\230\128\187\230\149\176\233\135\143"] = Info.TotalNum,
        ["\229\133\182\228\187\150\228\191\161\230\129\175"] = Info.Other
      })
    end
    table.sort(SortLEPlaySEs, function(a, b)
      return a["\233\159\179\230\149\136\230\128\187\230\149\176\233\135\143"] > b["\233\159\179\230\149\136\230\128\187\230\149\176\233\135\143"]
    end)
    PlaySEProfileInfo["\233\159\179\230\149\136\229\136\134\229\184\131(\230\140\137\230\146\173\230\148\190\230\157\165\230\186\144\232\167\166\229\143\145\230\149\176\233\135\143\228\187\142\233\171\152\229\136\176\228\189\142)"] = SortLEPlaySEs
  end
  return PlaySEProfileInfo
end

function BattleProfile:GetFunctionCallInfo(PassTime, PassFrameCount)
  local TotalTime = self.FunctionCallInfos:Length()
  local FunctionCallProfileInfo = {}
  if TotalTime > 0 then
    local SortedFunctionCallInfos_Lua2Cpp = {}
    local SortedFunctionCallInfos_Lua2Blueprint = {}
    local SortedFunctionCallInfos_CppOrBlueprint2Lua = {}
    for _, FunctionCallInfo in pairs(self.FunctionCallInfos) do
      local FunctionCallInfoTable = {
        ["\229\135\189\230\149\176\229\144\141"] = FunctionCallInfo.FunctionName,
        ["\231\177\187\229\158\139\229\144\141"] = FunctionCallInfo.ClassName,
        ["\232\176\131\231\148\168\230\172\161\230\149\176"] = FunctionCallInfo.Times
      }
      if FunctionCallInfo.Direction == "Lua2Cpp" then
        table.insert(SortedFunctionCallInfos_Lua2Cpp, FunctionCallInfoTable)
      elseif FunctionCallInfo.Direction == "Lua2Blueprint" then
        table.insert(SortedFunctionCallInfos_Lua2Blueprint, FunctionCallInfoTable)
      else
        table.insert(SortedFunctionCallInfos_CppOrBlueprint2Lua, FunctionCallInfoTable)
      end
    end
    table.sort(SortedFunctionCallInfos_Lua2Cpp, function(a, b)
      return a["\232\176\131\231\148\168\230\172\161\230\149\176"] > b["\232\176\131\231\148\168\230\172\161\230\149\176"]
    end)
    table.sort(SortedFunctionCallInfos_Lua2Blueprint, function(a, b)
      return a["\232\176\131\231\148\168\230\172\161\230\149\176"] > b["\232\176\131\231\148\168\230\172\161\230\149\176"]
    end)
    table.sort(SortedFunctionCallInfos_CppOrBlueprint2Lua, function(a, b)
      return a["\232\176\131\231\148\168\230\172\161\230\149\176"] > b["\232\176\131\231\148\168\230\172\161\230\149\176"]
    end)
    FunctionCallProfileInfo["C++/\232\147\157\229\155\190->Lua \229\135\189\230\149\176\232\176\131\231\148\168\230\172\161\230\149\176(\228\187\142\233\171\152\229\136\176\228\189\142)"] = SortedFunctionCallInfos_CppOrBlueprint2Lua
    FunctionCallProfileInfo["Lua->C++ \229\135\189\230\149\176\232\176\131\231\148\168\230\172\161\230\149\176(\228\187\142\233\171\152\229\136\176\228\189\142)"] = SortedFunctionCallInfos_Lua2Cpp
    FunctionCallProfileInfo["Lua->\232\147\157\229\155\190 \229\135\189\230\149\176\232\176\131\231\148\168\230\172\161\230\149\176(\228\187\142\233\171\152\229\136\176\228\189\142)"] = SortedFunctionCallInfos_Lua2Blueprint
  end
  return FunctionCallProfileInfo
end

function BattleProfile:GetUPropertyCallInfo(PassTime, PassFrameCount)
  local TotalTime = self.PropertyCallInfos:Length()
  local PropertyCallProfileInfo = {}
  if TotalTime > 0 then
    local SortedPropertyCallInfos = {}
    for _, PropertyCallInfo in pairs(self.PropertyCallInfos) do
      local PropertyCallInfoTable = {
        ["Property\229\144\141"] = PropertyCallInfo.PropertyName,
        ["Class\229\144\141"] = PropertyCallInfo.ClassName,
        ["\229\141\149\230\172\161\232\176\131\231\148\168\232\128\151\230\151\182\239\188\136\229\141\149\228\189\141\230\152\175CPU\229\145\168\230\156\159\230\149\176\239\188\137"] = PropertyCallInfo.TimeConsuming,
        ["\232\176\131\231\148\168\230\172\161\230\149\176"] = PropertyCallInfo.Times
      }
      table.insert(SortedPropertyCallInfos, PropertyCallInfoTable)
    end
    table.sort(SortedPropertyCallInfos, function(a, b)
      return a["\232\176\131\231\148\168\230\172\161\230\149\176"] > b["\232\176\131\231\148\168\230\172\161\230\149\176"]
    end)
    PropertyCallProfileInfo["Lua\229\136\176C++UProperty\232\176\131\231\148\168\230\172\161\230\149\176(\228\187\142\233\171\152\229\136\176\228\189\142)"] = SortedPropertyCallInfos
  end
  return PropertyCallProfileInfo
end

local function GetKvString(Key, Value)
  return string.format("%s: %s", tostring(Key), tostring(Value))
end

function BattleProfile:GetBuffChangedInfo(PassTime, PassFrameCount)
  local ResultTable = {}
  local TotalTime = self.BuffsChangedInfos:Length()
  local BuffChangedInfo = {}
  BuffChangedInfo["1. BuffsChanged\232\176\131\231\148\168\230\128\187\230\172\161\230\149\176"] = TotalTime
  if TotalTime > 0 then
    local TimePerSecond = TotalTime / PassTime
    BuffChangedInfo["2. \229\185\179\229\157\135BuffsChanged\232\176\131\231\148\168\230\172\161\230\149\176"] = {
      ["\230\175\143\231\167\146"] = TotalTime / PassTime,
      ["\230\175\143\229\184\167"] = TotalTime / PassFrameCount
    }
    local TimeSecondInfos = {}
    local FrameCountInfos = {}
    local TotalPropIdCount = {}
    local FrameCountToTimeSecond = {}
    for _, BuffChangedInfo in pairs(self.BuffsChangedInfos) do
      local TimeSecond = BuffChangedInfo.TimeSecond
      local FrameCount = BuffChangedInfo.FrameCount
      local CurTimeSecondInfos = TimeSecondInfos[TimeSecond] or {}
      local CurFrameCountInfos = FrameCountInfos[FrameCount] or {}
      CurTimeSecondInfos.PropIdCount = CurTimeSecondInfos.PropIdCount or {}
      CurFrameCountInfos.PropIdCount = CurFrameCountInfos.PropIdCount or {}
      CurTimeSecondInfos.TriggerCount = (CurTimeSecondInfos.TriggerCount or 0) + 1
      CurFrameCountInfos.TriggerCount = (CurFrameCountInfos.TriggerCount or 0) + 1
      FrameCountToTimeSecond[FrameCount] = TimeSecond
      for Index, Id in pairs(BuffChangedInfo.BuffPropIds) do
        CurTimeSecondInfos.PropIdCount[Id] = (CurTimeSecondInfos.PropIdCount[Id] or 0) + 1
        CurFrameCountInfos.PropIdCount[Id] = (CurFrameCountInfos.PropIdCount[Id] or 0) + 1
        TotalPropIdCount[Id] = (TotalPropIdCount[Id] or 0) + 1
      end
      TimeSecondInfos[TimeSecond] = CurTimeSecondInfos
      FrameCountInfos[FrameCount] = CurFrameCountInfos
    end
    local MaxNumPS = 0
    local AvgNumPS = 0
    local MidNumPS = 0
    local MidNumPSArr = {}
    local MaxNumPSIndex = 0
    for TimeSecond, Info in pairs(TimeSecondInfos) do
      AvgNumPS = AvgNumPS + Info.TriggerCount
      if MaxNumPS < Info.TriggerCount then
        MaxNumPS = Info.TriggerCount
        MaxNumPSIndex = TimeSecond
      end
      table.insert(MidNumPSArr, Info.TriggerCount)
    end
    AvgNumPS = AvgNumPS / #MidNumPSArr
    table.sort(MidNumPSArr, function(a, b)
      return a < b
    end)
    MidNumPS = MidNumPSArr[math.max(1, math.ceil(#MidNumPSArr / 2))]
    local MaxNumPF = 0
    local AvgNumPF = 0
    local MidNumPF = 0
    local MidNumPFArr = {}
    local MaxNumPFIndex = 0
    for FrameCount, Info in pairs(FrameCountInfos) do
      AvgNumPF = AvgNumPF + Info.TriggerCount
      if MaxNumPF < Info.TriggerCount then
        MaxNumPF = Info.TriggerCount
        MaxNumPFIndex = FrameCount
      end
      table.insert(MidNumPFArr, Info.TriggerCount)
    end
    AvgNumPF = AvgNumPF / #MidNumPFArr
    table.sort(MidNumPFArr, function(a, b)
      return a < b
    end)
    MidNumPF = MidNumPFArr[math.max(1, math.ceil(#MidNumPFArr / 2))]
    BuffChangedInfo["3. \230\156\128\233\171\152BuffsChanged\232\176\131\231\148\168\233\162\145\231\142\135(\230\175\143\231\167\146)"] = {
      ["\228\184\128\231\167\146\229\134\133\230\156\128\233\171\152BuffsChanged\232\176\131\231\148\168\230\172\161\230\149\176"] = MaxNumPS,
      ["\229\135\186\231\142\176\229\156\168\229\188\128\229\167\139Profile\231\154\132\231\167\146\230\149\176"] = MaxNumPSIndex
    }
    BuffChangedInfo["4. \230\156\128\233\171\152BuffsChanged\232\176\131\231\148\168\233\162\145\231\142\135(\230\175\143\229\184\167)"] = {
      ["\229\141\149\229\184\167\230\156\128\233\171\152BuffsChanged\232\176\131\231\148\168\230\172\161\230\149\176"] = MaxNumPF,
      ["\229\135\186\231\142\176\229\156\168\229\188\128\229\167\139Profile\231\154\132\231\167\146\230\149\176"] = FrameCountToTimeSecond[MaxNumPFIndex]
    }
    BuffChangedInfo["5. BuffsChanged\232\176\131\231\148\168\233\162\145\231\142\135\229\136\134\229\184\131"] = {
      string.format("\229\141\149\229\184\167\230\156\128\233\171\152BuffsChanged\232\176\131\231\148\168\230\172\161\230\149\176: %s", tostring(MaxNumPF)),
      string.format("\229\135\186\231\142\176\229\156\168\229\188\128\229\167\139Profile\231\154\132\231\167\146\230\149\176: %s", tostring(FrameCountToTimeSecond[MaxNumPFIndex])),
      string.format("\229\185\179\229\157\135\230\175\143\229\184\167: %s", tostring(AvgNumPF)),
      string.format("\228\184\173\228\189\141\230\175\143\229\184\167: %s", tostring(MidNumPF))
    }
    table.sort(TotalPropIdCount, function(a, b)
      return b < a
    end)
    BuffChangedInfo["6. Buff\232\161\168\229\164\180\232\176\131\231\148\168\233\162\145\231\142\135\229\136\134\229\184\131(\228\187\142\229\164\167\229\136\176\229\176\143)"] = {}
    local TotalPropIdCountOutput = {}
    for key, value in pairs(TotalPropIdCount) do
      table.insert(TotalPropIdCountOutput, {Id = key, Count = value})
    end
    table.sort(TotalPropIdCountOutput, function(a, b)
      return a.Count > b.Count
    end)
    local BuffPropNameTable = DataMgr.BuffConverts.BuffPropNameTable
    for _, Info in ipairs(TotalPropIdCountOutput) do
      table.insert(BuffChangedInfo["6. Buff\232\161\168\229\164\180\232\176\131\231\148\168\233\162\145\231\142\135\229\136\134\229\184\131(\228\187\142\229\164\167\229\136\176\229\176\143)"], BuffPropNameTable[Info.Id] .. ": " .. tostring(Info.Count) .. "\230\172\161")
    end
  end
  return BuffChangedInfo
end

return BattleProfile
