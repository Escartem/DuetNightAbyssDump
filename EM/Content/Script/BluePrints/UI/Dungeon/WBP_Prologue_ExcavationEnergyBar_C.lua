require("UnLua")
local WBP_Prologue_ExcavationEnergyBar_C = Class("BluePrints.UI.BP_EMDungeonWidget_C")

function WBP_Prologue_ExcavationEnergyBar_C:Construct()
  self.Overridden.Construct(self)
  self.Eid = nil
  self.TickTime = 0.1
  self.AnimTime = 0.5
  self.FixTime = 0.5
  self.UsingEnergy = false
end

function WBP_Prologue_ExcavationEnergyBar_C:UpdateInfo()
  local Ent = Battle(self):GetEntity(self.Eid)
  self:SetDataFromEntity(Ent)
end

function WBP_Prologue_ExcavationEnergyBar_C:SetDataFromEntity(Ent)
  if nil == Ent or nil == Ent.NowEnergy or nil == Ent.Progress then
    return
  end
  self.NowTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  self.LastHp = self.HpBar:GetProgressBarPercentInner(self.HpBar.Bar_Blood, "ProgressBar")
  local Hp = Ent:GetAttr("Hp") / self.Hp
  Hp = math.min(1, math.max(0, Hp))
  local Energy = Ent.NowEnergy
  Energy = math.min(100, math.max(0, Energy))
  local IsAttacking = false
  if self.LastHp - Hp > 1.0E-5 then
    self.HpBar:SetBarPercent(Hp)
    IsAttacking = true
    self.HpBar:PlayDeduct(IsAttacking)
  end
  self.HpBar:CheckAndPlayLowHealth(self.HpBar:CheckIsLowPercent(0.5))
  if not self.MechEnergyFull then
    if Energy < 1 then
      self.NextState = "Lack"
    elseif Energy > 99 then
      self.NextState = "Full"
    else
      self.NextState = "Normal"
    end
    if Ent.Progress + Energy >= 100 then
      self.NextState = "Full"
    end
    if self.CurrentState ~= self.NextState then
      if self.NextState == "Lack" then
        self.Text_Progress_Digging:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DE6B77FF"))
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Warning, 0, true)
        local Index = math.max(1, math.min(5, math.floor(Ent.Progress / 20) + 1))
        local Material = self.Img_VX_Warning:GetDynamicMaterial()
        if Material then
          Material:SetScalarParameterValue("Opacity" .. tostring(Index), 1)
        end
      else
        self.Text_Progress_Digging:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
        EMUIAnimationSubsystem:EMStopAnimation(self, self.Warning)
        local Material = self.Img_VX_Warning:GetDynamicMaterial()
        if Material then
          for i = 1, 5 do
            Material:SetScalarParameterValue("Opacity" .. tostring(i), 0)
          end
        end
        if self.NextState == "Full" then
          self.MechEnergyFull = true
        end
      end
      self.CurrentState = self.NextState
    end
  end
  if Energy > 0 then
    local Offset = 0.07 - 1.0 * (Ent.Progress / 100)
    self.VX_LightLine:GetDynamicMaterial():SetScalarParameterValue("Main_U_Offset", Offset)
    if self.UsingEnergy == false then
      self.VX_LightLine:SetVisibility(UE4.ESlateVisibility.Visible)
      self.UsingEnergy = true
    end
  elseif true == self.UsingEnergy then
    self.VX_LightLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.UsingEnergy = false
  end
  self.Text_Progress_Digging:SetText(Ent.Progress .. "%")
  self:SetProgressBar((Ent.Progress + Energy) / 100, Ent.Progress / 100)
end

function WBP_Prologue_ExcavationEnergyBar_C:OnFinish()
  self.Text_Progress_Digging:SetText("100%")
  UIManager(self):ShowUITip(UIConst.Tip_ExcavationToast, GText("DUNGEON_EXCAVATION_101"), 5, false, {
    OrderText = self.Order_Text,
    Level = self.Level_str
  })
end

function WBP_Prologue_ExcavationEnergyBar_C:RealPlayFinishAnim()
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Warning)
  self:PlayAnimation(self.Complete)
  AudioManager(self):PlayUISound(self, "event:/ui/common/excavation_complete", nil, nil)
  self:AddTimer(self.Complete:GetEndTime() * UE4.UGameplayStatics.GetGlobalTimeDilation(self), function()
    self.DataObject.Owner:RemoveItemFromListViewCallback(self.DataObject)
  end)
end

function WBP_Prologue_ExcavationEnergyBar_C:RealPlayOutAnim()
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Warning)
  self:PlayAnimation(self.Widget_Out)
  self:AddTimer(self.Widget_Out:GetEndTime() * UE4.UGameplayStatics.GetGlobalTimeDilation(self), function()
    self.DataObject.Owner:RemoveItemFromListViewCallback(self.DataObject)
  end)
end

function WBP_Prologue_ExcavationEnergyBar_C:OnBarsHide()
  EMUIAnimationSubsystem:EMStopAnimation(self, self.Warning)
  self:RemoveTimer("EnergyBarTick")
end

function WBP_Prologue_ExcavationEnergyBar_C:OnBarsShow()
  if self.CurrentState == "Lack" then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Warning)
  else
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Warning)
  end
  self:AddTimer(self.TickTime, self.UpdateInfo, true, 0, "EnergyBarTick")
end

function WBP_Prologue_ExcavationEnergyBar_C:OnAttractBattery(BatteryEnergy)
  AudioManager(self):PlayUISound(self, "event:/ui/common/excavation_acquire_module", nil, nil)
  UIManager(self):ShowUITip(UIConst.Tip_ExcavationToast, GText("DUNGEON_EXCAVATION_104") .. " +" .. BatteryEnergy, 5, false, {
    OrderText = self.Order_Text,
    Level = self.Level_str
  })
  self.AttractBatteryToastNum = self.AttractBatteryToastNum + 1
end

function WBP_Prologue_ExcavationEnergyBar_C:OnListItemObjectSet(ListItemObject)
  self.DataObject = ListItemObject
  self.Eid = ListItemObject.TargetMachineEid
  local Ent = Battle(self):GetEntity(self.Eid)
  if nil == Ent then
    DebugPrint("Error: eid not found excavation machine", self.Eid)
    return
  end
  self.Hp = Ent:GetAttr("Hp")
  self.LastHp = self.Hp
  self.SizeBox_HP:ClearChildren()
  self:LoadHpBar()
  self.CurrentState = "Normal"
  self.NextState = nil
  self.MechEnergyFull = false
  self.AttractBatteryToastNum = 0
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if nil == GameInstance then
    DebugPrint("OnExcavationItemChange: GameInstance \228\184\141\229\173\152\229\156\168")
    return
  end
  local SceneManager = GameInstance:GetSceneManager()
  if nil == SceneManager then
    DebugPrint("OnExcavationItemChange: SceneManager \228\184\141\229\173\152\229\156\168")
    return
  end
  local Order = (Ent.GuideOrderIndex - 1) % 6
  self.Order_Text = string.char(string.byte("A") + Order)
  local ImageResource = LoadObject(SceneManager:GetExcavationABCIconPath(self.Order_Text))
  self.Img_Letter:SetBrushResourceObject(ImageResource)
  self.Level_str = Ent.Efficiency
  local Material = self.Img_Level:GetDynamicMaterial()
  if Material then
    Material:SetScalarParameterValue("LevelNum", self.Level_str)
  end
  local MaterialWarning = self.Img_VX_Warning:GetDynamicMaterial()
  if MaterialWarning then
    for i = 1, 5 do
      MaterialWarning:SetScalarParameterValue("Opacity" .. tostring(i), 0)
    end
  end
  ListItemObject.OnDiggingFinish:Add(self, self.OnFinish)
  ListItemObject.OnAttractBattery:Add(self, self.OnAttractBattery)
  ListItemObject.PlayFinishAnim:Add(self, self.RealPlayFinishAnim)
  ListItemObject.PlayOutAnim:Add(self, self.RealPlayOutAnim)
  ListItemObject.OnBarsHide:Add(self, self.OnBarsHide)
  ListItemObject.OnBarsShow:Add(self, self.OnBarsShow)
  self.HelpBloodPercent = 1.0
  self.Text_Progress_Digging:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
  self:SetProgressBar(0, 0)
  self:SetDataFromEntity(Ent)
  self:PlayAnimation(self.Widget_In)
  self:AddTimer(self.TickTime, self.UpdateInfo, true, 0, "EnergyBarTick")
end

function WBP_Prologue_ExcavationEnergyBar_C:SetProgressBar(CanChargeValue, MainValue)
  local Material = self.Img_Charge:GetDynamicMaterial()
  if Material then
    Material:SetScalarParameterValue("HPValue2", CanChargeValue)
    Material:SetScalarParameterValue("HPValue3", MainValue)
  end
end

function WBP_Prologue_ExcavationEnergyBar_C:LoadHpBar()
  self.HpBar = self:LoadSubWidget(self.SizeBox_HP, "HPBar", false, self.SizeBox_HP.WidthOverride)
end

function WBP_Prologue_ExcavationEnergyBar_C:LoadSubWidget(Container, WidgetName, ...)
  if not Container then
    return
  end
  local SubWidget = UIManager(self):_CreateWidgetNew(WidgetName)
  Container:AddChild(SubWidget)
  SubWidget:Init(...)
  return Container:GetChildAt(0)
end

return WBP_Prologue_ExcavationEnergyBar_C
