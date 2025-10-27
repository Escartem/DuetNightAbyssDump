local Common_NewMonster_PC_C = Class("BluePrints.UI.BP_UIState_C")
local MonsterUtils = require("Utils.MonsterUtils")

function Common_NewMonster_PC_C:Initialize(Initializer)
  Common_NewMonster_PC_C.Super.Initialize(self)
end

function Common_NewMonster_PC_C:Construct()
  Common_NewMonster_PC_C.Super.Construct(self)
end

function Common_NewMonster_PC_C:Destruct()
  Common_NewMonster_PC_C.Super.Destruct(self)
  self:RemoveFromParent()
end

function Common_NewMonster_PC_C:OnLoaded(...)
  Common_NewMonster_PC_C.Super:OnLoaded(...)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI then
    return
  end
  if BattleMainUI then
    BattleMainUI.Pos_NewMonster:AddChildToOverlay(self)
    BattleMainUI:SetSubSystemVisibility("Pos_NewMonster", ESlateVisibility.SelfHitTestInvisible)
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    UIManager(self):ChangeUserWidgetToNewParent(self.WidgetName)
    self.IsInit = true
  end
  self:AddTimer(3, self.TryToClose, false, 0, "TryToCloseMonster")
  AudioManager(self):PlayUISound(self, "event:/ui/common/enemy_info", nil, nil)
  local UnitId = (...)
  local Monster = DataMgr.Monster[UnitId]
  if not Monster then
    return
  end
  local MonsterName = GText(Monster.UnitName)
  self.Text_NewMonster:SetText(GText("Mon_FirstSeen_Label"))
  if MonsterName then
    self.Text_Name:SetText(MonsterName)
  end
  local MonsterIcon = Monster.Icon
  if MonsterIcon then
    UE.UResourceLibrary.LoadObjectAsync(self, MonsterIcon, {
      self,
      Common_NewMonster_PC_C.OnIconLoadFinished
    })
  end
  self:PlayAnimation(self.In)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function Common_NewMonster_PC_C:OnIconLoadFinished(Object)
  if IsValid(self) and self.Img_Monster then
    self.Img_Monster:GetDynamicMaterial():SetTextureParameterValue("MainTex", Object)
  end
end

function Common_NewMonster_PC_C:Hide(HideTag)
  Common_NewMonster_PC_C.Super.Hide(self, HideTag)
  self:PauseTimer("TryToCloseMonster")
end

function Common_NewMonster_PC_C:Show(ShowTag)
  Common_NewMonster_PC_C.Super.Show(self, ShowTag)
  local IsHide = not IsEmptyTable(self.HideTags)
  if not IsHide then
    self:UnPauseTimer("TryToCloseMonster")
  end
end

function Common_NewMonster_PC_C:TryToClose()
  self:PlayAnimation(self.Out)
end

function Common_NewMonster_PC_C:Close()
  Common_NewMonster_PC_C.Super.Close(self)
  UIManager(self):RemoveUserWidgetFromParent(self.WidgetName)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:ShowNextMonsterPanel()
  end
end

function Common_NewMonster_PC_C:Refresh()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:ShowNextMonsterPanel()
  end
end

return Common_NewMonster_PC_C
