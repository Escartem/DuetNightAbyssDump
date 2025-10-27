local FSwitchToMasterComponent = {}
local ClassPath = "/Game/BluePrints/Common/EMNiagaraFunctionLibrary"

function FSwitchToMasterComponent:New(MasterType, TalkTaskData)
  DebugPrint("FSwitchToMasterComponent@ New")
  local SwitchToMasterComponent = setmetatable({}, {__index = FSwitchToMasterComponent})
  SwitchToMasterComponent.TalkTaskData = TalkTaskData
  SwitchToMasterComponent.MasterType = MasterType
  return SwitchToMasterComponent
end

function FSwitchToMasterComponent:Execute()
  DebugPrint("FSwitchToMasterComponent@ \229\136\135\230\141\162\228\184\186\228\184\187\232\167\146")
  local Player = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(Player) then
    local Message = "FSwitchToMasterComponent:Execute(), \229\175\185\232\175\157\232\138\130\231\130\185\229\136\135\230\141\162\228\184\187\232\167\146\230\151\182\239\188\140\231\142\169\229\174\182PlayerCharacter\230\151\160\230\149\136\n"
    local Title = "PlayerCharacter\230\151\160\230\149\136"
    UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    DebugPrint("lhr@\231\142\169\229\174\182PlayerCharacter\230\151\160\230\149\136\n")
    return
  end
  if Player.ChangeRoleTimer then
    Player:RemoveTimer(Player.ChangeRoleTimer)
    Player.ChangeRoleTimer = nil
  end
  if -1 == self.TalkTaskData.BlendInTime then
    return
  end
  if self.MasterType == "None" then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    GWorld.logger.error("FSwitchToMasterComponent@\230\178\161\230\156\137\230\173\163\229\184\184\231\153\187\229\189\149")
    Avatar = {Sex = 0, WeitaSex = 1}
  end
  local MasterGender, MasterRoleId
  if self.MasterType == "Player" then
    MasterGender = Avatar.Sex
  else
    MasterGender = Avatar.WeitaSex
  end
  local MasterInfo = DataMgr.Player2RoleId[self.MasterType]
  if not MasterInfo then
    GWorld.logger.error("FSwitchToMasterComponent@\230\178\161\230\156\137\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\228\184\187\232\167\146\228\191\161\230\129\175\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\232\161\168" .. self.MasterType)
    return
  end
  local GenderInfo = MasterInfo[MasterGender]
  if not GenderInfo then
    GWorld.logger.error("FSwitchToMasterComponent@\229\175\185\229\186\148\230\128\167\229\136\171\230\178\161\230\156\137\232\167\146\232\137\178\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\232\161\168")
    return
  end
  MasterRoleId = GenderInfo
  local ExtractInfo = {UseMasterRole = 1}
  print(_G.LogTag, "FSwitchToMasterComponent@ChangeToMaster", MasterRoleId, ExtractInfo.UseMasterRole, MasterGender)
  Player.HeroTempInfo = {
    RoleInfo = {
      PlayerHp = Player:GetAttr("Hp"),
      PlayerSp = Player:GetAttr("Sp"),
      PlayerES = Player:GetAttr("ES")
    },
    RangedWeapon = {
      BulletNum = Player.RangedWeapon and Player.RangedWeapon:GetAttr("BulletNum") or 0,
      MagazineBulletNum = Player.RangedWeapon and Player.RangedWeapon:GetAttr("MagazineBulletNum") or 0
    }
  }
  Avatar.HeroTempInfo = Player.HeroTempInfo
  if Player:GetController():GetClass():GetName() == "TalkAIController" then
    self.TalkAIController = Player:GetController()
    self.PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    self.TalkPawn = self.PlayerController.Pawn
    self.TalkAIController:UnPossess(Player)
    self.PlayerController:Possess(Player)
  end
  Player:ChangeRole(MasterRoleId)
  Player:RealChangeUsingWeapon(nil)
  Player:ClearAllSuitItem()
  Player:BanSkills()
  Player:ChangeRoleEffect()
  local BodyType = Player:GetBattleCharBodyType()
  Player.FXComponent:PlayEffectByIDParams(401, {
    NotAttached = true,
    scale = Const.BattleCharTagVXScaleTable[BodyType]
  })
  if self.TalkAIController then
    self.PlayerController:Possess(self.TalkPawn)
    self.TalkAIController:Possess(Player)
    self.TalkAIController, self.PlayerController, self.TalkPawn = nil, nil, nil
  end
end

function FSwitchToMasterComponent:Resume()
  DebugPrint("FSwitchToMasterComponent@FSwitchToMasterComponent \232\167\163\233\153\164\229\136\135\230\141\162\228\184\187\232\167\146")
  if -1 == self.TalkTaskData.BlendOutTime then
    return
  end
  local Player = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player.HeroTempInfo then
    return
  end
  if not IsValid(Player) then
    local Message = "FSwitchToMasterComponent:Resume(), \229\175\185\232\175\157\232\138\130\231\130\185\229\136\135\230\141\162\228\184\187\232\167\146\230\151\182\239\188\140\231\142\169\229\174\182PlayerCharacter\230\151\160\230\149\136\n"
    local Title = "PlayerCharacter\230\151\160\230\149\136"
    UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    DebugPrint("lhr@\231\142\169\229\174\182PlayerCharacter\230\151\160\230\149\136\n")
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("FSwitchToMasterComponent:Resume(), Avatar\230\151\160\230\149\136\n")
    return
  end
  if Player:GetController():GetClass():GetName() == "TalkAIController" and not self.SeamlessBlendOut then
    self.TalkAIController = Player:GetController()
    self.PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    self.TalkPawn = self.PlayerController.Pawn
    self.TalkAIController:UnPossess(Player)
    self.PlayerController:Possess(Player)
  end
  Player:UnBanSkills()
  Player:RecoverHeroInfo()
  Player:ChangeRole(nil, AvatarUtils:GetDefaultBattleInfo(GWorld:GetAvatar()))
  if Player.RangedWeapon and 0 == Player.RangedWeapon:GetAttr("MagazineBulletNum") then
    Player.RangedWeapon:SetWeaponState("NoBullet", true)
  end
  Player.ChangeRoleTimer = Player:AddTimer(0.1, function()
    Player:ChangeRoleEffect()
    local BodyType = Player:GetBattleCharBodyType()
    Player.FXComponent:PlayEffectByIDParams(401, {
      NotAttached = true,
      scale = Const.BattleCharTagVXScaleTable[BodyType]
    })
    Player.ChangeRoleTimer = nil
  end)
  if self.TalkAIController then
    self.PlayerController:Possess(self.TalkPawn)
    self.TalkAIController:Possess(Player)
    self.TalkAIController, self.PlayerController, self.TalkPawn = nil, nil, nil
  end
end

return FSwitchToMasterComponent
