require("UnLua")
local WBP_NPC_Name_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_NPC_Name_C:Initialize(Initializer)
  self.ParentHeadWidget = nil
  self.bIsEnabled_Name = false
  self.PosInitialized = false
  self.Style = nil
  self.PlayerNumber = nil
end

function WBP_NPC_Name_C:Init(ParentHeadWidget)
  self:SetRenderOpacity(0)
  if not self.PosInitialized then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.PosInitialized = true
  end
  self.ParentHeadWidget = ParentHeadWidget
end

function WBP_NPC_Name_C:OnEnabled(Name, Style, PlayerNumber)
  if self.bIsEnabled_Name then
    return
  end
  Style = Style or "Default"
  self:SwitchStyle(Style)
  self:SetPlayerNumber(PlayerNumber)
  self.bIsEnabled_Name = true
  self.NameTxt:SetText(Name)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.ParentHeadWidget:StopAllAnimations()
  self.ParentHeadWidget:PlayAnimation(self.ParentHeadWidget.Name_In)
end

function WBP_NPC_Name_C:SwitchStyle(Style)
  self.Style = Style
  local LoadMaterial
  if "Phantom" == Style then
    LoadMaterial = self.PlayerMaterial
  elseif "Player" == Style then
    LoadMaterial = self.DefaultMaterial
  else
    local Font = self.NameTxt.Font
    Font.FontMaterial = nil
    self.NameTxt:SetFont(Font)
    return
  end
  UResourceLibrary.LoadObjectAsync(self, tostring(LoadMaterial), {
    self,
    function(obj, Material)
      if not IsValid(obj) then
        return
      end
      if Style ~= self.Style then
        return
      end
      local Font = self.NameTxt.Font
      Font.FontMaterial = Material
      self.NameTxt:SetFont(Font)
    end
  })
end

function WBP_NPC_Name_C:SetPlayerNumber(PlayerNumber)
  if 0 == PlayerNumber then
    PlayerNumber = nil
  end
  self.PlayerNumber = PlayerNumber
  if not PlayerNumber then
    self.Group_TeamSign:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.Group_TeamSign:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  
  local function UpdateTeamTag(TeamTag)
    if not IsValid(TeamTag) then
      return
    end
    if not self.PlayerNumber then
      return
    end
    local Number = self.PlayerNumber
    TeamTag:Init(false, Number, nil)
  end
  
  if self.Group_TeamSign:HasAnyChildren() then
    local TeamTag = self.Group_TeamSign:GetChildAt(0)
    if IsValid(TeamTag) then
      UpdateTeamTag(TeamTag)
      return
    end
    self.Group_TeamSign:ClearChildren()
  end
  UIManager(self):CreateWidgetAsync("WBP_NPC_Name_Tag", function(TeamTag)
    if not IsValid(self) then
      return
    end
    if TeamTag then
      self.Group_TeamSign:AddChild(TeamTag)
      UpdateTeamTag(TeamTag)
    end
  end, tostring(self.NameTagReference))
end

function WBP_NPC_Name_C:OnDisabled()
  if not self.bIsEnabled_Name then
    return
  end
  self.bIsEnabled_Name = false
  self.ParentHeadWidget:StopAllAnimations()
  self.ParentHeadWidget:PlayAnimation(self.ParentHeadWidget.Name_Out)
end

return WBP_NPC_Name_C
