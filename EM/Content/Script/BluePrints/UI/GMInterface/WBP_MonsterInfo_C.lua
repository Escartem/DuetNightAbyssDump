require("UnLua")
local WBP_MonsterInfo_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_MonsterInfo_C:OnLoaded(...)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local UIManager = GameInstance:GetGameUIManager()
  if GameState and UIManager then
    local TargetEid
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if BattleMain then
      local TakeAimIndicator = BattleMain:GetTakeAimIndicator()
      if TakeAimIndicator then
        TargetEid = TakeAimIndicator.CurTraceTargetEid
      end
    end
    if TargetEid and TargetEid > 0 then
      GameState.DebugMonster = Battle(self):GetEntity(TargetEid)
    end
  end
  self.ShowAll = false
  self.ButtonText:SetText("ShowAll")
  self.RepeatTimer = self:AddTimer(0.05, self.RefreshOneMonsterInfo, true, 0, "RefreshMonsterInfo")
end

function WBP_MonsterInfo_C:Destruct()
  self.Super.Destruct(self)
  self:CloseAllHeadPanel()
  if self.ent then
    self.ent.EQSTestingComponent:Reset()
    self.ent.EQSTestingComponent:RunEQSQuery()
    self.ent.EQSTestingComponent.bEnableEQSTest = false
    self.ent.EQSTestingComponent.bShouldBeVisibleInGame = false
    self.ent.EQSTestingComponent.bTickDuringGame = false
    self.ent.EQSTestingComponent.bDrawOnlyWhenSelected = true
    if self.ent.EQSTestingComponent.bDrawOnlyWhenSelectedChanged then
      self.ent.EQSTestingComponent:bDrawOnlyWhenSelectedChanged()
    end
  end
end

function WBP_MonsterInfo_C:CloseAllHeadPanel()
  local ents = Battle(self):GetAllEntities()
  for _, ent in pairs(ents) do
    if ent and ent.IsMonster and ent:IsMonster() then
      local Comp = ent:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
      if Comp then
        Comp:SetHiddenInGame(true)
        Comp:K2_DetachFromComponent()
      end
    end
  end
end

function WBP_MonsterInfo_C:SwitchButtonClick()
  self.ShowAll = not self.ShowAll
  self:RemoveTimer("RefreshMonsterInfo")
  if self.ShowAll then
    self.ButtonText:SetText("ShowOne")
    self.RepeatTimer = self:AddTimer(0.05, self.RefreshAllMonsterInfo, true, 0, "RefreshMonsterInfo")
  else
    self.ButtonText:SetText("ShowAll")
    self:CloseAllHeadPanel()
    self.RepeatTimer = self:AddTimer(0.05, self.RefreshOneMonsterInfo, true, 0, "RefreshMonsterInfo")
  end
end

function WBP_MonsterInfo_C:RefreshAllMonsterInfo()
  local ents = Battle(self):GetAllEntities()
  local str = ""
  for _, ent in pairs(ents) do
    if ent and ent.IsMonster and ent:IsMonster() then
      self:RefreshOneMonsterHeadInfo(ent)
      str = str .. self:RefreshOneMonsterPanelInfo(ent)
      str = str .. "\r\n"
    end
  end
  self.TextInfo:SetText(str)
end

function WBP_MonsterInfo_C:RefreshOneMonsterInfo()
  self:CloseAllHeadPanel()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState and GameState.DebugMonster and Battle(self):GetEntity(GameState.DebugMonster.Eid) then
    self:RefreshOneMonsterHeadInfo(GameState.DebugMonster)
    local str = self:RefreshOneMonsterPanelInfo(GameState.DebugMonster)
    self.TextInfo:SetText(str)
  else
    GameState.DebugMonster = nil
    self.TextInfo:SetText("\231\148\168\229\135\134\229\191\131\231\158\132\229\135\134\228\184\128\229\143\170\230\128\170\229\134\141\230\140\1379\239\188\140\230\136\150\231\148\168GM GetMonster\232\142\183\229\143\150\228\184\128\229\143\170\230\156\128\232\191\145\231\154\132\230\128\170")
  end
end

function WBP_MonsterInfo_C:RefreshOneMonsterHeadInfo(ent)
  local Comp = ent:GetComponentByClass(UCharDebugWidgetComponent:StaticClass())
  if Comp then
    if Comp.bHiddenInGame then
      Comp:SetHiddenInGame(false)
      Comp:K2_AttachTo(ent:K2_GetRootComponent(), "None", EAttachLocation.SnapToTargetIncludingScale, false)
    end
    Comp:AddDebugTEXT("Eid", "Eid:" .. tostring(ent.Eid))
    Comp:AddDebugTEXT("HP", "HP:" .. ent:GetAttr("Hp"))
    Comp:AddDebugTEXT("CharacterTag", "CT:" .. ent.AutoSyncProp.CharacterTag)
  end
end

function WBP_MonsterInfo_C:RefreshOneMonsterPanelInfo(ent)
  if self.ent ~= ent then
    self.ent = ent
  end
  local str = ""
  str = str .. ent:GetName()
  str = str .. "   "
  str = str .. "Eid: " .. tostring(ent.Eid)
  str = str .. "   "
  str = str .. "ModelId: " .. tostring(ent.ModelId)
  str = str .. "   "
  str = str .. "CurPos: " .. tostring(ent:K2_GetActorLocation())
  str = str .. "   "
  str = str .. "BornPos: " .. tostring(ent.BornPos)
  str = str .. "   "
  local MoveActorName = ""
  local MoveLocation = FVector(0, 0, 0)
  local MoveActorName, MoveLocation, bMove = ent:GetCurNavMoveData()
  if bMove then
    str = str .. "MoveTo "
    if "" ~= MoveActorName then
      str = str .. MoveActorName
      str = str .. "   "
    end
    str = str .. "Loc: " .. tostring(MoveLocation)
  else
    str = str .. "MoveTo: nil"
  end
  str = str .. "  "
  str = str .. "CurSkillID: " .. tostring(ent.CurrentSkillId)
  str = str .. "   "
  str = str .. " Toughness: " .. tostring(ent:GetAttr("TN")) .. " "
  str = str .. " TNRecoverState: " .. ent.CurrentTNRecoverState .. " "
  if self.ent.EQSTestingComponent and self.ent.EQSTestingComponent.QueryTemplate then
    self.ent.EQSTestingComponent.bDrawOnlyWhenSelected = false
    if self.ent.EQSTestingComponent.bDrawOnlyWhenSelectedChanged then
      self.ent.EQSTestingComponent:bDrawOnlyWhenSelectedChanged()
    end
    self.ent.EQSTestingComponent:RunEQSQuery()
    self.ent.EQSTestingComponent.bShouldBeVisibleInGame = true
    self.ent.EQSTestingComponent.bTickDuringGame = true
    self.ent.EQSTestingComponent.bEnableEQSTest = true
  end
  return str
end

return WBP_MonsterInfo_C
