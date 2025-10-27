require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self:SetCharacterImg()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
end

function M:SetCharacterImg()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Error: WBP_Reasoning_Ani_C SetCharacterImg \230\137\190\228\184\141\229\136\176Avatar")
  end
  local RegionId = Avatar:GetCurrentRegionId()
  if not RegionId or DataMgr.SubRegion[RegionId] == nil then
    DebugPrint("Error: WBP_Reasoning_Ani_C SetCharacterImg \230\137\190\228\184\141\229\136\176\229\140\186\229\159\159\230\136\150\229\140\186\229\159\159\229\175\185\229\186\148Player\230\149\176\230\141\174 RegionId: ", RegionId)
    return
  end
  local PlayerIdentity = DataMgr.SubRegion[RegionId].SwitchPlayer
  if not PlayerIdentity then
    DebugPrint("Error: WBP_Reasoning_Ani_C SetCharacterImg \229\189\147\229\137\141\229\140\186\229\159\159\230\178\161\230\156\137\229\143\175\229\136\135\230\141\162\232\167\146\232\137\178")
    return
  end
  if "Player" == PlayerIdentity then
    if 1 == Avatar.Sex then
      self.CharaImg = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Reasoning/T_Reasoning_Female.T_Reasoning_Female'")
    else
      self.CharaImg = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Reasoning/T_Reasoning_Male.T_Reasoning_Male'")
    end
  elseif 1 == Avatar.WeitaSex then
    self.CharaImg = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Reasoning/T_Reasoning_EXFemale.T_Reasoning_EXFemale'")
  else
    self.CharaImg = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Reasoning/T_Reasoning_EXFemale.T_Reasoning_EXMale'")
  end
  self.Image_Avatar:SetBrushResourceObject(self.CharaImg)
end

function M:OnLoaded(...)
  M.Super:OnLoaded(...)
  self.Answers, self.AnswerId = ...
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.In)
      self.AssociateWidget = UIManager(self):LoadUINew("DetectiveAssociate", 2, self.Answers, self.AnswerId)
      self:PlayAnimation(self.Out)
    end
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.Out)
      self.AssociateWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.AssociateWidget:StopAllAnimations()
      self.AssociateWidget:StartPlayInAnimation()
      self:Close()
    end
  })
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_think_inspiration", nil, nil)
  self:SetFocus()
end

return M
