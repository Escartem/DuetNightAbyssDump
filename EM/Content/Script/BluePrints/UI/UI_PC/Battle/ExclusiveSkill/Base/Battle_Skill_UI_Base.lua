local M = Class("BluePrints.UI.BP_UIState_C")
local MOBILE_SCALE = 0.8
local PC_SCALE = 1

function M:OnLoaded()
  self.IsInit = true
end

function M:RemoveSelf()
  self:Close()
end

function M:IsMainPlayerSummon(Summoner, UIOwner, UISummonId)
  if Summoner and UIOwner and Summoner.UnitId == UISummonId and Summoner:GetRootSourceEid() == UIOwner.Eid then
    return true
  end
  return false
end

function M:InitBattleCharUI(CharUIId, GradeLevel)
  local CharUIInfo = DataMgr.BattleCharUI[CharUIId][GradeLevel]
  if CharUIInfo then
    if CharUIInfo.ScaleNode then
      self:InitQuantityScale(CharUIInfo.ScaleNode)
    end
    local MainNode = self.Main
    local Offset = self.Offset_M
    if MainNode and Offset and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      DebugPrint("gmy@M:InitBattleCharUI Offset", Offset)
      local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(MainNode)
      local Padding = Slot.Padding
      Padding.Bottom = Offset
      Slot:SetPadding(Padding)
    end
  end
  self.FrameCount = 0
end

function M:Tick(MyGeometry, InDeltaTime)
  self.FrameCount = self.FrameCount or 0
  self.FrameCount = self.FrameCount + 1
end

function M:InitQuantityScale(ScaleNode)
  local bIsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  local Scale = bIsMobile and MOBILE_SCALE or PC_SCALE
  if self[ScaleNode] then
    self[ScaleNode]:SetRenderScale(FVector2D(Scale, Scale))
  end
end

function M:TrySetSummon(SummonId, bIsSummonMonster)
  if nil == self.Summoner then
    local Player = GWorld:GetMainPlayer()
    if Player then
      local Summons = Player:GetSummonsList(SummonId, bIsSummonMonster, not bIsSummonMonster)
      for _, Eid in pairs(Summons) do
        local Summoner = Battle(self):GetEntity(Eid)
        if IsValid(Summoner) and Summoner.UnitId == SummonId then
          DebugPrint("gmy@Battle_Skill_UI_Base M:TrySetSummon", Summoner)
          self.Summoner = Summoner
          if self.OnSummonerAdd then
            self:OnSummonerAdd(Summoner)
          end
          return
        end
      end
    end
  end
end

return M
