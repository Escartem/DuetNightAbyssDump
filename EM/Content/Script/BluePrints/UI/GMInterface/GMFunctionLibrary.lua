require("UnLua")
local GMCommandConfig = require("BluePrints.UI.GMInterface.GMCommandConfig")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local GMObjectUtils = require("BluePrints.UI.GMInterface.GMObjectUtils")
local EMCache = require("EMCache.EMCache")
local MiscUtils = require("Utils.MiscUtils")
local GMFunctionLibrary = {}

function GMFunctionLibrary.Exec(WorldContext, Command)
  if not Command or Command.Callback == "" then
    MiscUtils.Error("GMFunctionLibrary:\230\140\135\228\187\164\229\175\185\232\177\161\230\136\150callback\228\184\186\231\169\186")
    return
  end
  if not GMFunctionLibrary[Command.Callback] then
    MiscUtils.Error("GMFunctionLibrary:\230\156\170\229\174\158\231\142\176callback\229\135\189\230\149\176" .. Command.Callback)
    return
  end
  local args = Command.FixedParameters:ToTable()
  if args and #args > 0 then
    args = {
      table.unpack(args),
      table.unpack(Command.Parameters:ToTable())
    }
  else
    args = Command.Parameters:ToTable()
  end
  print(_G.LogTag, "callback:", Command.Callback, "args:", table.unpack(args))
  if Command.Mode == "button" then
    GMFunctionLibrary[Command.Callback](WorldContext, table.unpack(args))
  elseif Command.Mode == "switch" then
    local res = GMFunctionLibrary[Command.Callback](WorldContext, Command.IsEnable, table.unpack(args))
    if true == res or false == res then
      Command.IsEnable = res
    end
    if "" ~= Command.VarName then
      GMVariable[Command.VarName] = Command.IsEnable
    end
  elseif Command.Mode == "edit" then
    GMFunctionLibrary[Command.Callback](WorldContext, table.unpack(args))
  else
    print(_G.LogTag, "Undefined command mode:", Command.Mode)
  end
end

function GMFunctionLibrary.ExecConsoleCommand(WorldContext, CommandStr)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, CommandStr, nil)
end

function GMFunctionLibrary.ShowUIData(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "stat fps", nil)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "stat unit", nil)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Player, "stat RHI", nil)
end

function GMFunctionLibrary.SetDrawDebugSphere(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player.CapsuleComponent:SetHiddenInGame(not IsEnable, false)
  Player.GrassCollider_L:SetHiddenInGame(not IsEnable, false)
  Player.GrassCollider_R:SetHiddenInGame(not IsEnable, false)
  Player.DistanceFieldMesh_L:SetHiddenInGame(not IsEnable, false)
  Player.DistanceFieldMesh_R:SetHiddenInGame(not IsEnable, false)
end

function GMFunctionLibrary.SetDrawCallInfo(WorldContext, IsEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "stat SceneRendering")
  return IsEnable
end

function GMFunctionLibrary.ModifyRootAnimation(WorldContext, IsEnable)
  local World = WorldContext:GetWorld()
  local ModelPath = "BluePrints/Common/BP_FileModify.BP_FileModify"
  local ClassObj = UE4.UClass.Load("/Game/" .. ModelPath)
  local TargetObj = World:SpawnActor(ClassObj, UE.FTransform(), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  if TargetObj then
    print(_G.LogTag, "FileModify Loads succeded!!!")
    TargetObj:ModifyAnimRootmotion()
  else
    print(_G.LogTag, "FileModify Loads Failed!!!")
  end
  if not IsEnable then
    print(_G.LogTag, "\229\133\179\233\151\173\229\138\159\232\131\189\229\176\154\230\156\170\229\174\158\231\142\176\227\128\130")
  end
end

function GMFunctionLibrary.SetUIShowModePC(WorldContext)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:UpdateUIMode("PC")
end

function GMFunctionLibrary.SetUIShowModeMobile(WorldContext)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:UpdateUIMode("Mobile")
end

function GMFunctionLibrary.SetShowScreenMessage(WorldContext, IsEnable)
  if IsEnable then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "EnableAllScreenMessages")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "DisableAllScreenMessages")
  end
end

function GMFunctionLibrary.SetPlayerInvincible(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:SetInvincible(IsEnable, "GM")
end

function GMFunctionLibrary.MaxTriggerProbability(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm MaxTriggerProbability")
end

function GMFunctionLibrary.ShowDamageDetails(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ShowDamageDetails")
end

function GMFunctionLibrary.ClearToughness(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  if IsEnable then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ctn")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ctn 0")
  end
end

function GMFunctionLibrary.ForbidDamage(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ForbidDamage")
end

function GMFunctionLibrary.ForbidPlay(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ForbidPlay")
end

function GMFunctionLibrary.SetDPIScale(WorldContext, ScaleNum)
  UE.UUIFunctionLibrary.SetGameDPI(ScaleNum)
end

function GMFunctionLibrary.DoHideUI(WorldContext, UIName)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local UINameTable = Split(UIName, ".")
  local UIWidget
  if 1 == #UINameTable then
    UIWidget = UIManager(Player):GetUIObj(UIName)
  elseif 2 == #UINameTable then
    local TempUIWidget = UIManager(Player):GetUIObj(UINameTable[1])
    UIWidget = TempUIWidget[UINameTable[2]]
  end
  if nil == UIWidget then
    return
  end
  if type(UIWidget.Hide) == "function" then
    UIWidget:Hide()
  else
    UIWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function GMFunctionLibrary.DoShowUI(WorldContext, UIName)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local UINameTable = Split(UIName, ".")
  local UIWidget
  if 1 == #UINameTable then
    UIWidget = UIManager(Player):GetUIObj(UIName)
  elseif 2 == #UINameTable then
    local TempUIWidget = UIManager(Player):GetUIObj(UINameTable[1])
    UIWidget = TempUIWidget[UINameTable[2]]
  end
  if nil == UIWidget then
    return
  end
  if type(UIWidget.Show) == "function" then
    UIWidget:Show()
  else
    UIWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function GMFunctionLibrary.DoShowUIOnly(WorldContext, UIName)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:ImmersionModel()
  UIManager(Player):HideAllUI(true, Const.ShowUIOnlyTag)
  UIManager(Player):HideAllComponentUI(true, Const.ShowUIOnlyTag)
  UIManager(Player).GMShowUIOnly = UIName
  GMVariable.EnableShowBillboard = false
  local UIWidget = UIManager(Player):GetUIObj(UIName)
  if UIWidget then
    UIWidget:Show(Const.ShowUIOnlyTag)
  end
end

function GMFunctionLibrary.SetPlayerSuperArmor(WorldContext, IsEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:SetSuperArmor(IsEnable, "GM")
end

function GMFunctionLibrary.SetTakeRecorderCapture(WorldContext, IsEnable)
  local GameInstance = UGameplayStatics.GetGameInstance(WorldContext)
  GameInstance.IsTakeRecorderCapturing = IsEnable
  GameInstance.ImmersionModel = IsEnable
  local str = "fx.Niagara.ForceAutoPooling "
  if IsEnable then
    str = str .. "0"
  else
    str = str .. "1"
  end
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, str)
  UGameplayStatics.GetGameState(GameInstance:GetGameUIManager()).Battle.RecycleDelay = 0
  local player = UGameplayStatics.GetPlayerCharacter(GameInstance:GetGameUIManager(), 0)
  player.CapsuleComponent:SetHiddenInGame(IsEnable)
  player:HideMonsterCapsule(IsEnable)
  local FXPriorityManager = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GameInstance, UE4.UFXPriorityManager)
  if IsEnable then
    FXPriorityManager.bEnableFXPool = false
    FXPriorityManager.bEnableFXScalabilityOpt = false
  else
    FXPriorityManager.bEnableFXPool = true
    FXPriorityManager.bEnableFXScalabilityOpt = true
  end
  local NiagaraActor = UGameplayStatics.GetActorOfClass(WorldContext, ATakeRecorderNiagaraActor.StaticClass())
  if not NiagaraActor then
    WorldContext:GetWorld():SpawnActor(ATakeRecorderNiagaraActor:StaticClass())
  end
end

function GMFunctionLibrary.SetLogMaskIsOpen(WorldContext, IsEnable)
  if IsEnable then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask nil")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask LogInfo")
  end
end

function GMFunctionLibrary.UpdateLogMaskInfo(WorldContext, MaskName)
  if not MaskName then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask nil")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask " .. MaskName)
  end
end

function GMFunctionLibrary.ModifyPlayerWorldPos(WorldContext, PosX, PosY, PosZ)
  local FinalPos = UE4.FVector(PosX, PosY, PosZ)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player:K2_SetActorLocation(FinalPos, false, nil, false)
end

function GMFunctionLibrary.SavePlayerWorldPos(WorldContext)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  GMVariable.SavedPlayerWorldPos = Player:K2_GetActorLocation()
end

function GMFunctionLibrary.PrintEnvironment(WorldContext)
  local Config = GMCommandConfig.commands[1].commands
  if Config then
    for index, value in ipairs(Config) do
      if value.text == "\230\137\147\229\141\176\229\189\147\229\137\141\231\142\175\229\162\131" then
        for __, Commands in ipairs(value.commands) do
          if Commands.text ~= "\230\137\147\229\141\176\230\137\128\230\156\137\228\191\161\230\129\175" then
            GMFunctionLibrary[Commands.callback](WorldContext)
          end
        end
        return
      end
    end
  end
end

function GMFunctionLibrary.ForceStartDynQuest(WorldContext, DynQuestId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ForceStartDynQuest " .. tostring(DynQuestId))
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ResetDynQuestProbability " .. "1 " .. "1")
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ForceStartDynQuest " .. tostring(DynQuestId))
end

function GMFunctionLibrary.PrintPlayerInfo(WorldContext)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm PrintPlayerInfoOnScreen")
end

function GMFunctionLibrary.PrintLevelInfo(WorldContext)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm PrintGameModeInfoOnScreen")
end

function GMFunctionLibrary.PrintDynamicEventInfo(WorldContext, Id)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm PrintDynamicEventInfo " .. tostring(Id))
end

function GMFunctionLibrary.FillInPlayerWorldPos(WorldContext, CommandName)
  local Command = GMObjectUtils.FindCommandObjByName(CommandName)
  if Command and GMVariable.SavedPlayerWorldPos then
    local Pos = {}
    table.insert(Pos, GMVariable.SavedPlayerWorldPos.X)
    table.insert(Pos, GMVariable.SavedPlayerWorldPos.Y)
    table.insert(Pos, GMVariable.SavedPlayerWorldPos.Z)
    local Commands = Command.Commands
    local len = Commands:Length()
    local j = 1
    for i = 1, len do
      if Commands[i].Mode == "edit" then
        local PrmtLen = Commands[i].Parameters:Length()
        if PrmtLen > 0 then
          Commands[i].Parameters[1] = Pos[j]
          j = j + 1
        end
      end
    end
    if IsValid(Command.Commands[len].ParentWidget) then
      Command.Commands[len].ParentWidget:RefreshItems()
    end
  end
end

function GMFunctionLibrary.ChangeRole(WorldContext, RoId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ChangeToNewModel " .. RoId)
end

function GMFunctionLibrary.ChangeWeapon(WorldContext, WeaponId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ChangeWeapon " .. WeaponId)
end

function GMFunctionLibrary.ShowOrHideBillboard(WorldContext, IsEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "EM.EnableShowBillboard " .. tostring(IsEnable))
end

function GMFunctionLibrary.GetLogMask()
  return _G.LogTag
end

function GMFunctionLibrary.PrintPlayerBuff(WorldContext)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local buff_count = Player:GetBuffNum()
  local buff_manager = Player.BuffManager
  local buffs = buff_manager.Buffs
  local result = ""
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask nil")
  if buff_count > 0 then
    result = result .. "\229\189\147\229\137\141\231\142\169\229\174\182\232\186\171\228\184\138buff\230\149\176\233\135\143\228\184\186: " .. buff_count .. "\n"
    for i = 1, buffs:Length() do
      local buff = buffs:GetRef(i)
      local buff_id = buff.BuffId
      local buff_lastTime = buff.LastTime
      local buff_Forever = buff.bForever
      result = result .. "\231\138\182\230\128\129\231\188\150\229\143\183: " .. buff_id .. ", \230\140\129\231\187\173\230\151\182\233\151\180: " .. buff_lastTime .. ", \230\152\175\229\144\166\230\176\184\228\185\133: " .. tostring(buff_Forever) .. "\n"
    end
  else
    result = result .. "\229\189\147\229\137\141\231\142\169\229\174\182\232\186\171\228\184\138\230\154\130\230\151\160buff"
  end
  print(result)
end

function GMFunctionLibrary.SetOutlineEnabled(WorldContext, bEnabled)
  UProfiles.SetOutlineEnabled(bEnabled)
end

function GMFunctionLibrary.SetHairOutlineEnabled(WorldContext, bEnabled)
  UProfiles.SetHairOutlineEnabled(bEnabled)
end

function GMFunctionLibrary.SetMaterialCharacterRimEnabled(WorldContext, bEnabled)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player.CharacterFashion:EnableDrawMaterialCharacterRim(bEnabled)
end

function GMFunctionLibrary.SetPostProcessCharacterRimEnabled(WorldContext, bEnabled)
  UProfiles.SetPostProcessCharacterRimEnabled(bEnabled)
end

function GMFunctionLibrary.SetCharacterDitherEnabled(WorldContext, bEnabled)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  Player.DitherDisabled = not bEnabled
end

function GMFunctionLibrary.PrintPlayerAttr(WorldContext, attr_name)
  attr_name = string.upper(attr_name)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local result = ""
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "logmask nil")
  print(_G.LogTag, attr_name)
  if "" ~= attr_name then
    local player_attr_value = Player:GetAttr(attr_name)
    print("player " .. attr_name .. ": " .. player_attr_value)
    local weapons = Player.Weapons
    for weapon_id, weapon in pairs(weapons) do
      local weapon_attr_value = weapon:GetAttr(attr_name)
      print(weapon_id, weapon_attr_value)
    end
  end
  print(result)
end

function GMFunctionLibrary.PrintBattleHistory_Normal(WorldContext, Str)
  local Tags = Str and "" ~= Str and Split(Str, " ") or nil
  local Filter = UE4.FBattleHistoryFilter()
  Filter.Verbosity = UE4.EBattleRecordVerbosity.Normal
  if Tags then
    for _, Tag in ipairs(Tags) do
      Filter.TargetTags:Add(Tag)
    end
  end
  Battle(WorldContext):BP_PrintBattleHistory(Filter)
end

function GMFunctionLibrary.PrintBattleHistory_Verbose(WorldContext, Str)
  local Tags = Str and "" ~= Str and Split(Str, " ") or nil
  local Filter = UE4.FBattleHistoryFilter()
  Filter.Verbosity = UE4.EBattleRecordVerbosity.Verbose
  if Tags then
    for _, Tag in ipairs(Tags) do
      Filter.TargetTags:Add(Tag)
    end
  end
  Battle(WorldContext):BP_PrintBattleHistory(Filter)
end

function GMFunctionLibrary.CreateMonster(WorldContext, Id, Num, CM_Type)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM " .. (CM_Type or "CM") .. " " .. Id .. " " .. Num)
end

function GMFunctionLibrary.SetPlayerGhost(WorldContext, IsEnable)
  local Controller = UE4.UGameplayStatics.GetPlayerController(WorldContext, 0)
  if IsEnable then
    Controller.CheatManager:Ghost()
  else
    Controller.CheatManager:Walk()
  end
end

function GMFunctionLibrary.Teleport(WorldContext)
  local Controller = UE4.UGameplayStatics.GetPlayerController(WorldContext, 0)
  Controller.CheatManager:Teleport()
end

function GMFunctionLibrary.SetCritRate(WorldContext, CritRate)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "ClientGM CritRateTest" .. CritRate)
end

function GMFunctionLibrary.ChangeTAAQuality(WorldContext, Quality)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.NGX.DLSS.Enable = 0")
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.NGX.DLAA.Enable = 0")
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.PostProcessAAQuality " .. 4)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.ScreenPercentage " .. Quality)
end

function GMFunctionLibrary.ChangeDLSSQuality(WorldContext, Quality)
  if UDLSSLibrary == nil then
    return
  end
  local QualityValueList = {
    [0] = UDLSSMode.Off,
    [1] = UDLSSMode.Auto,
    [2] = UDLSSMode.UltraQuality,
    [3] = UDLSSMode.Balanced,
    [4] = UDLSSMode.Performance,
    [5] = UDLSSMode.UltraPerformance,
    [6] = UDLSSMode.DLAA
  }
  print("ChangeDLSSQuality", tonumber(Quality))
  UDLSSLibrary.SetDLSSMode(QualityValueList[tonumber(Quality)])
end

function GMFunctionLibrary.ChangeDLSSFGQuality(WorldContext, Quality)
  if UStreamlineLibraryDLSSG == nil then
    return
  end
  local QualityValueList = {
    [0] = EStreamlineDLSSGMode.Off,
    [1] = EStreamlineDLSSGMode.Auto,
    [2] = EStreamlineDLSSGMode.On2X,
    [3] = EStreamlineDLSSGMode.On3X,
    [4] = EStreamlineDLSSGMode.On4X
  }
  UStreamlineLibraryDLSSG.SetDLSSGMode(QualityValueList[tonumber(Quality)])
end

function GMFunctionLibrary.SwitchSimpleRuntimeTexture(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.SimpleRuntimeTextures " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchMobileSoftwareOcclusion(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.Mobile.AllowSoftwareOcclusion " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchAllowSoftwareOcclusionForMask(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.AllowSoftwareOcclusionForMask " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchSoftwareOcclusionVisualizeBuffer(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.so.VisualizeBuffer " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchMobilePostProcessFog(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.MobilePostProcessFogOrVertexFog " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchHardwareOcclusion(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.AllowOcclusionQueries " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SwitchHZBOcclusion(WorldContext, bEnable)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "r.HZBOcclusion " .. (bEnable and 1 or 0))
end

function GMFunctionLibrary.SetShowMemoryInfo(WorldContext)
  GMFunctionLibrary.EnableShowMemoryInfo = not GMFunctionLibrary.EnableShowMemoryInfo
  if GMFunctionLibrary.EnableShowMemoryInfo then
    GMFunctionLibrary.ShowMemoryInfo(WorldContext)
  else
    GMFunctionLibrary.CloseMemoryInfo(WorldContext)
  end
  if EMCache then
    local GMInfo = EMCache:Get("GMInfo") or {}
    GMInfo.EnableShowMemoryInfo = GMFunctionLibrary.EnableShowMemoryInfo
    EMCache:Set("GMInfo", GMInfo)
  end
end

function GMFunctionLibrary.ShowMemoryInfo(WorldContext)
  if GMFunctionLibrary.EnableShowMemoryInfo == nil then
    GMFunctionLibrary.EnableShowMemoryInfo = false
    if EMCache then
      local GMInfo = EMCache:Get("GMInfo")
      if GMInfo then
        GMFunctionLibrary.EnableShowMemoryInfo = GMInfo.EnableShowMemoryInfo
      end
    end
  end
  if not GMFunctionLibrary.EnableShowMemoryInfo then
    return
  end
  if not IsValid(GMFunctionLibrary.MemoryInfoWidget) then
    GMFunctionLibrary.MemoryInfoWidget = UIManager(WorldContext):CreateWidget(UIConst.TEXTMEMORYINFOFLOAT, true, 1000)
  end
  local MemoryInfoWidget = GMFunctionLibrary.MemoryInfoWidget
  if MemoryInfoWidget then
    function MemoryInfoWidget.UpdateTextInfo()
      local MemoryInfo = URuntimeCommonFunctionLibrary.GetMemoryInfo(UE4.UGameplayStatics.GetRealTimeSeconds(self))
      
      MemoryInfoWidget.MemoryInfoText:SetText(MemoryInfo)
    end
    
    MemoryInfoWidget:UpdateTextInfo()
    MemoryInfoWidget:AddTimer(1, MemoryInfoWidget.UpdateTextInfo, true, 0, "MemoryInfoWidget", nil)
  end
end

function GMFunctionLibrary.CloseMemoryInfo(WorldContext)
  if IsValid(GMFunctionLibrary.MemoryInfoWidget) then
    GMFunctionLibrary.MemoryInfoWidget:RemoveFromParent()
    GMFunctionLibrary.MemoryInfoWidget = nil
  end
end

function GMFunctionLibrary.SetBGMEnabled(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetBGMVolume " .. 1)
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetBGMVolume " .. 0)
  end
end

function GMFunctionLibrary.SetEMPreviewSoundEnabled(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetEMPreviewMute false")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetEMPreviewMute true")
  end
end

function GMFunctionLibrary.SetAudioListenerDebugEnabled(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetAudioListenerOpenDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetAudioListenerOpenDebug false")
  end
end

function GMFunctionLibrary.SetBGMDebugEnabled(WorldContext, bEnable)
  if bEnable then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetBGMOpenDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetBGMOpenDebug false")
  end
end

function GMFunctionLibrary.SetDrawDebugEnabled(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetDrawDebugEnabled true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetDrawDebugEnabled false")
  end
end

function GMFunctionLibrary.SetSoundPointCompDebugEnabled(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetSoundPointCompDebugEnabled true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetSoundPointCompDebugEnabled false")
  end
end

function GMFunctionLibrary.SetSoundSplineDrawDebug(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetSoundSplineDrawDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetSoundSplineDrawDebug false")
  end
end

function GMFunctionLibrary.SetReverbLogicDebug(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetReverbDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetReverbDebug false")
  end
end

function GMFunctionLibrary.SetLineSoundDebug(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetLineSoundDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SetLineSoundDebug false")
  end
end

function GMFunctionLibrary.SetSectorSoundDebug(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SectorSoundDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM SectorSoundDebug false")
  end
end

function GMFunctionLibrary.SetCircularSoundDebug(WorldContext, bEnabled)
  if bEnabled then
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM CircularSoundDebug true")
  else
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "GM CircularSoundDebug false")
  end
end

function GMFunctionLibrary.SetPhantomForceUseRegionRule(WorldContext, bUse)
  local player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local Phantoms = player:GetPhantomTeammates():ToTable()
  for _, phantom in pairs(Phantoms) do
    local controller = phantom:GetController()
    if controller:Cast(AMonFlyAIController) then
      controller.EMSVONNavigation.ForceUseRegionRule = bUse
    end
  end
end

function GMFunctionLibrary.GetLevelUpResources(WorldContext, Num)
  local Resources = {}
  for key, value in pairs(DataMgr.WeaponBreak) do
    for k, v in pairs(value) do
      for key, id in pairs(v.ItemId) do
        Resources[id] = true
      end
    end
  end
  for key, value in pairs(DataMgr.CharBreak) do
    for k, v in pairs(value) do
      for key, id in pairs(v.ItemId) do
        Resources[id] = true
      end
    end
  end
  for id, v in pairs(Resources) do
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ar " .. id .. " " .. (Num or 1))
  end
  for i = 7, 14 do
    local id = 2000 + i
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ar " .. id .. " " .. (Num or 1))
  end
end

function GMFunctionLibrary.GetModLevelUpResources(WorldContext, Num)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ar 102 " .. (Num or 1))
end

function GMFunctionLibrary.ChangeSysLanguage(WorldContext, Language)
  CommonConst.SystemLanguage = Language
end

function GMFunctionLibrary.SetAutoResetCameraPitch(WorldContext, Condition)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  if Player then
    if Condition then
      Player:EnableAutoResetCameraPitch("Enable")
    else
      Player:EnableAutoResetCameraPitch("Forbidden")
    end
    return Condition
  end
  return false
end

function GMFunctionLibrary.SetAutoResetSpringArm(WorldContext, Condition)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  if Player then
    Player.AutoResetSpringArm = Condition
    return Player.AutoResetSpringArm
  end
  return false
end

function GMFunctionLibrary.SetCurrentCharGrade(WorldContext, GradeLevel)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm sccg " .. GradeLevel)
end

function GMFunctionLibrary.ChangeQualityLevel(WorldContext, Level)
  UEMGameInstance.SetOverallScalabilityLevel(Level and tonumber(Level) or -1)
end

function GMFunctionLibrary.ReuseSkill(WorldContext, Id, Index)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm ReuseSkill" .. " " .. Id .. " " .. Index)
end

function GMFunctionLibrary.AddOneChar(WorldContext, CharId, level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm aoc " .. CharId .. " " .. level)
end

function GMFunctionLibrary.DeleteOneChar(WorldContext, CharId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm doc " .. CharId)
end

function GMFunctionLibrary.SetCharLevel(WorldContext, Level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm scl " .. Level)
end

function GMFunctionLibrary.AddResource(WorldContext, Id, Num)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm ar " .. Id .. " " .. (Num or ""))
end

function GMFunctionLibrary.GetDrop(WorldContext, Id, Num)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm GetDrop " .. Id .. " " .. (Num or ""))
end

function GMFunctionLibrary.SwitchSurvivalValueChange(WorldContext, Switch)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm SwitchSurvivalValueChange")
end

function GMFunctionLibrary.ChangeTouchPitchSpeed(WorldContext, speed)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm TouchSpeedPitch " .. speed)
end

function GMFunctionLibrary.ChangeTouchYawSpeed(WorldContext, speed)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm TouchSpeedYaw " .. speed)
end

function GMFunctionLibrary.ChangeTouchPitchLimit(WorldContext, TurnLimit)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm TouchLimitPitch " .. TurnLimit)
end

function GMFunctionLibrary.ChangeTouchYawLimit(WorldContext, TurnLimit)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm TouchLimitYaw " .. TurnLimit)
end

function GMFunctionLibrary.ChangeTouchConfig(WorldContext, speedPitch, speedYaw, TurnLimitPitch, TurnLimitYaw)
  if "" ~= speedPitch then
    GMFunctionLibrary.ChangeTouchPitchSpeed(WorldContext, speedPitch)
  end
  if "" ~= speedYaw then
    GMFunctionLibrary.ChangeTouchYawSpeed(WorldContext, speedYaw)
  end
  if "" ~= TurnLimitPitch then
    GMFunctionLibrary.ChangeTouchPitchLimit(WorldContext, TurnLimitPitch)
  end
  if "" ~= TurnLimitYaw then
    GMFunctionLibrary.ChangeTouchYawLimit(WorldContext, TurnLimitYaw)
  end
end

function GMFunctionLibrary.SwitchSkillFeatureCD(WorldContext, bEnabled)
  Const.bEnableSkillFeatureCD = not bEnabled
end

function GMFunctionLibrary.UnlockRegionTeleport(WorldContext, bEnabled)
  Const.UnlockRegionTeleport = bEnabled
end

function GMFunctionLibrary.CompleteCondition(WorldContext, ConditionId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm CompleteCondition " .. ConditionId)
end

function GMFunctionLibrary.MockSystemCondition(WorldContext, SystemId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm MockSystemCondition " .. SystemId)
end

function GMFunctionLibrary.SetConstrainAspect(WorldContext, bEnable)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  if Player then
    Player.CharCameraComponent.bConstrainAspectRatio = bEnable
  end
end

function GMFunctionLibrary.SwitchFXPaused(WorldContext, bEnable)
  if bEnable then
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "tick.AllowFXTickEvenWhenPaused 0", nil)
  else
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "tick.AllowFXTickEvenWhenPaused 1", nil)
  end
end

function GMFunctionLibrary.ShowFlags(WorldContext, bEnable, Name)
  local GameInstance = WorldContext:GetGameInstance()
  assert(GameInstance, "\230\137\190\228\184\141\229\136\176GameInstance")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local Controller = Player:GetController()
  if bEnable then
    Controller:ShowFlags(Name, true)
  else
    Controller:ShowFlags(Name, false)
  end
end

function GMFunctionLibrary.SetTimeOfDay(WorldContext, timeofday)
  local EnvCreat = UGameplayStatics.GetAllActorsOfClass(WorldContext, LoadClass("/Game/Asset/Scene/common/EnvirSystem/EnvirCreat.EnvirCreat_C")):GetRef(1)
  if "day" == timeofday then
    EnvCreat.bUseGameTime = true
    EnvCreat.TimeOfDay = 12.0
  elseif "night" == timeofday then
    EnvCreat.bUseGameTime = true
    EnvCreat.TimeOfDay = 1.0
  end
end

function GMFunctionLibrary.HideOrShowMiniMap(WorldContext)
  local battleMap
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local battleMain = UIManager(Player):GetUI("BattleMain") or UIManager:GetUI("HomeBaseMain")
  if battleMain then
    battleMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
  end
  if battleMap then
    if battleMap:IsVisible() then
      battleMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      battleMap:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function GMFunctionLibrary.HideGMBtnInHUD(WorldContext)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local BattleMainPage = UIManager(Player):GetUI("BattleMain")
  if BattleMainPage then
    BattleMainPage.Btn_GM:SetVisibility(UE4.ESlateVisibility.Collapsed)
    BattleMainPage.Btn_GM:SetRenderOpacity(0)
  end
end

function GMFunctionLibrary.RecordePlayerRoute(WorldContext, bEnabled)
  local player = UE4.UGameplayStatics.GetPlayerCharacter(WorldContext, 0)
  local class = LoadClass("/Game/BluePrints/Scene/BP_GMRecordPlayerRoute.BP_GMRecordPlayerRoute_C")
  if bEnabled then
    player:AddComponentByClass(class, false, FTransform(), false)
  else
    local components = TArray(USceneComponent)
    components = player:K2_GetComponentsByClass(class)
    for _, component in pairs(components:ToTable()) do
      component:K2_DestroyComponent(component)
    end
    UKismetSystemLibrary.FlushPersistentDebugLines(WorldContext)
  end
end

function GMFunctionLibrary.ChangeToSpecialQuestScene(WorldContext)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm SkipRegion 1 999801 1")
end

function GMFunctionLibrary.StartSpecialQuest_10000(WorldContext)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm StartSpecialQuest 10000")
end

function GMFunctionLibrary.GuideBookGetReward(WorldContext, GuideId)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm GuideBookGetReward " .. GuideId)
end

function GMFunctionLibrary.CreatePhantom(WorldContext, ID, Str)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm CP " .. ID .. " " .. Str)
end

function GMFunctionLibrary.CreateMechanismSummon(WorldContext, ID, Number)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm CMS " .. ID .. " " .. Number)
end

function GMFunctionLibrary.SpeedUp(WorldContext, Rate)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "gm SpeedUp " .. Rate)
end

function GMFunctionLibrary.sl(WorldContext, Level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm sl " .. Level)
end

function GMFunctionLibrary.sawg(WorldContext, Level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm sawg " .. Level)
end

function GMFunctionLibrary.scwg(WorldContext, Level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm scwg " .. Level)
end

function GMFunctionLibrary.sawl(WorldContext, Level)
  GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm sawl " .. Level)
end

function GMFunctionLibrary.GetAllPet(WorldContext)
  local Avatar = GWorld:GetAvatar()
  for PetId, value in pairs(DataMgr.Pet) do
    GMFunctionLibrary.ExecConsoleCommand(WorldContext, "sgm PetAdd " .. PetId)
  end
end

function GMFunctionLibrary.OpenPreviewArmory(WorldContext)
  local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  UIManager(self):LoadUINew("ArmoryMain", {
    MainTabName = ArmoryUtils.ArmoryMainTabNames.BattleWheel
  })
end

function GMFunctionLibrary.ShowRegionmapPane(WorldContext, bEnabled)
  _G.ShowRegionmapPane = bEnabled
end

function GMFunctionLibrary.ShowAchievement(WorldContext, bEnabled)
  _G.ShowAchievement = bEnabled
end

function GMFunctionLibrary.HideJumpWord()
  if require("EMLuaConst").IsHideJumpWord == false then
    require("EMLuaConst").IsHideJumpWord = true
  else
    require("EMLuaConst").IsHideJumpWord = false
  end
end

function GMFunctionLibrary.NetDelay(WorldContext, Delay)
  DebugPrint("gmy@GMFunctionLibrary GMFunctionLibrary.NetDelay", WorldContext, Delay)
  local Cmd = string.format("Net pktLag=%s", Delay)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.NetPktLagVariance(WorldContext, Var)
  DebugPrint("gmy@GMFunctionLibrary GMFunctionLibrary.NetPktLagVariance", WorldContext, Var)
  local Cmd = string.format("Net PktLagVariance=%s", Var)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.NetPktLoss(WorldContext, Var)
  DebugPrint("gmy@GMFunctionLibrary GMFunctionLibrary.PktLoss", WorldContext, Var)
  local Cmd = string.format("Net PktLoss=%s", Var)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.NetPktOrder(WorldContext, Var)
  DebugPrint("gmy@GMFunctionLibrary GMFunctionLibrary.PktOrder", WorldContext, Var)
  local Cmd = string.format("Net PktOrder=1")
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.NetPktDup(WorldContext, Var)
  DebugPrint("gmy@GMFunctionLibrary GMFunctionLibrary.PktDup", WorldContext, Var)
  local Cmd = string.format("Net PktDup=%s", Var)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.SetUseMapPhoneInPC(WorldContext, bEnabled)
  if bEnabled then
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "stats.UseMapPhoneInPC true", nil)
  else
    UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "stats.UseMapPhoneInPC false", nil)
  end
end

function GMFunctionLibrary.PrintPickupTriggerTick(WorldContext, bEnabled)
  local Cmd = string.format("EM.Pickup.PrintTriggerTick %s", bEnabled and "1" or "0")
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, Cmd, nil)
end

function GMFunctionLibrary.FindDungeonForArtMap(WorldContext, MapName)
  UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "GM UnLockAllDungeonLevels", nil)
  local MinPath
  local MinLevelId = 1000
  local json = require("rapidjson")
  MapName = string.gsub(MapName, "_Art", "")
  local FilePath, JsonStr = UEditorCommonFunctionLibrary.GetAllDungeonJson()
  FilePath = FilePath:ToTable()
  JsonStr = JsonStr:ToTable()
  for i = 1, #JsonStr do
    DebugPrint("thy111   ", JsonStr[i], FilePath[i])
    local JsonFile = json.decode(JsonStr[i])
    for _, Level in pairs(JsonFile.points) do
      local Path = Level.art_path and "" ~= Level.art_path and Level.art_path or Level.struct
      if Path and string.find(Path, MapName) and MinLevelId >= Level.id then
        MinLevelId = Level.id
        MinPath = FilePath[i]
      end
    end
  end
  if MinPath then
    local ShortPath = string.sub(MinPath, 1, string.match(MinPath, ".*/()") - 2)
    for DungeonId, DungeonData in pairs(DataMgr.Dungeon) do
      if DungeonData.DungeonJsonFile == ShortPath and not DungeonData.IsWalnutDungeon then
        local LevelLoaderShortName = string.gsub(MinPath, "/Game/Script/Datas/Houdini_data/", "")
        GMVariable.LevelLoaderShortName = LevelLoaderShortName
        DebugPrint("FindDungeonForArtMap", DungeonId, MinLevelId, LevelLoaderShortName)
        if DungeonData.DungeonType == "Abyss" then
          UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "GM EnterAbyss " .. DungeonId .. " " .. "10", nil)
        else
          UKismetSystemLibrary.ExecuteConsoleCommand(WorldContext, "GM EnterDungeon " .. DungeonId, nil)
        end
        return
      end
    end
  end
end

if UE and UE.URuntimeCommonFunctionLibrary.IsDistribution() then
  for k, v in pairs(GMFunctionLibrary) do
    if type(v) == "function" then
      GMFunctionLibrary[k] = function()
      end
    end
  end
end
return GMFunctionLibrary
