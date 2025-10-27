local GetMeleeWeaponNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function GetMeleeWeaponNode:Execute(Callback)
  if self.Context.CurrentRole then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "GetMeleeWeaponNode\233\133\141\231\189\174\233\148\153\232\175\175", "\232\175\165\232\138\130\231\130\185\228\190\157\232\181\150\232\167\146\232\137\178\230\152\175\229\134\155\230\162\176\229\186\147\232\167\146\232\137\178")
  end
  local GameInstance = GWorld.GameInstance
  self.ListenTarget = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if self.ListenTarget and self.ListenTarget.MeleeWeapon then
    Callback()
    return
  else
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    
    local function RefreshWeapon(Ret)
      if 0 ~= Ret then
        return
      end
      local InfoForInit = AvatarUtils:GetDefaultBattleInfo(Avatar)
      self.ListenTarget:InitCharacterInfo(InfoForInit)
      Callback()
    end
    
    Avatar:AddDefaultMeleeWeapon(RefreshWeapon)
  end
end

return GetMeleeWeaponNode
