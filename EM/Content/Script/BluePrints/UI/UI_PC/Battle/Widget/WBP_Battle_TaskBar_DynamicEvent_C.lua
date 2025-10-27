local WBP_Battle_TaskBar_DynamicEvent_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_TaskBar_DynamicEvent_C:Construct()
end

function WBP_Battle_TaskBar_DynamicEvent_C:OnLoaded(InfoData)
  self.Super.OnLoaded(self, InfoData)
end

function WBP_Battle_TaskBar_DynamicEvent_C:SetEventInfo(EventName, EventDescribe)
  if EventName then
    self.Text_Name:SetText(GText(EventName))
  end
  if EventDescribe then
    self.Text_Describe:SetText(GText(EventDescribe))
  end
end

function WBP_Battle_TaskBar_DynamicEvent_C:CloseSelf()
  if self:IsPlayingAnimation(self.In) then
    return
  end
  local AnimObj = self:GetAnimationByName("Out")
  
  local function PlayAnimFinished()
    self:Close()
  end
  
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(AnimObj, {self, PlayAnimFinished})
  self:PlayAnimation(AnimObj)
end

function WBP_Battle_TaskBar_DynamicEvent_C:UpdateTaskInfo(TaskInfo, OpType)
  if nil == TaskInfo then
    return
  end
  if "Add" == OpType then
    self:PlayAnimation(self.Get_In)
    self:SetEventInfo(nil, TaskInfo.TaskDescription)
  end
end

function WBP_Battle_TaskBar_DynamicEvent_C:PlayExploreInAnim()
  self:PlayAnimation(self.Explore)
end

function WBP_Battle_TaskBar_DynamicEvent_C:SetExplorationInfo(Title, Content)
  self.ExplorationChallenge:SetInfo(Title, Content)
end

function WBP_Battle_TaskBar_DynamicEvent_C:ChangeGuidePointIcon(IsRhombic)
  if IsRhombic then
    local DynQuest = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DynQuest.T_Gp_DynQuest"
    local ImageResource = LoadObject(DynQuest)
    self.GuidePoint:SetBrushResourceObject(ImageResource)
  else
    local Phombic = "/Game/UI/Texture/Static/Atlas/Common/T_Com_Rhombic.T_Com_Rhombic"
    local ImageResource = LoadObject(Phombic)
    self.GuidePoint:SetBrushResourceObject(ImageResource)
    self.GuidePoint:SetColorAndOpacity(FLinearColor(0.351533, 0.391573, 1.0, 1.0))
  end
end

function WBP_Battle_TaskBar_DynamicEvent_C:PlaySuccessAnim(Content, CallBack)
  AudioManager(self):PlayUISound(self, "event:/ui/common/task_dynamic_success", nil, nil)
  self:UnbindAllFromAnimationFinished(self.MissonComplete_Out)
  if Content then
    self.Text_Complete:SetText(GText(Content))
  end
  if CallBack then
    local function PlayAnimFinished()
      CallBack()
      
      self:UnbindAllFromAnimationFinished(self.MissonComplete_Out)
    end
    
    self:BindToAnimationFinished(self.MissonComplete_Out, {self, PlayAnimFinished})
  end
  self:PlayAnimation(self.MissonComplete_Out)
end

function WBP_Battle_TaskBar_DynamicEvent_C:PlayFailAnim(Content, CallBack)
  self:StopAllAnimations()
  self:UnbindAllFromAnimationFinished(self.MissonFailed_Out)
  AudioManager(self):PlayUISound(self, "event:/ui/common/task_dynamic_fail", nil, nil)
  if Content then
    self.Text_Fail:SetText(GText(Content))
  end
  if CallBack then
    local function PlayAnimFinished()
      CallBack()
      
      self:UnbindAllFromAnimationFinished(self.MissonFailed_Out)
    end
    
    self:BindToAnimationFinished(self.MissonFailed_Out, {self, PlayAnimFinished})
  end
  self:PlayAnimation(self.MissonFailed_Out)
end

function WBP_Battle_TaskBar_DynamicEvent_C:PlayFirstInAnim(Content)
  self:StopAllAnimations()
  AudioManager(self):PlayUISound(self, "event:/ui/common/task_dynamic_start", nil, nil)
  if Content then
    self.Text_NewTask:SetText(GText(Content))
  end
  self:PlayAnimation(self.Get_In)
  self:PlayAnimation(self.NewTask_In)
end

function WBP_Battle_TaskBar_DynamicEvent_C:PlayInAnim(Content)
  self:StopAllAnimations()
  AudioManager(self):PlayUISound(self, "event:/ui/common/task_dynamic_start", nil, nil)
  if Content then
    self.Text_NewTask:SetText(GText(Content))
  end
  self:PlayAnimation(self.Get_In)
end

function WBP_Battle_TaskBar_DynamicEvent_C:PetPlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/task_dynamic_start", nil, nil)
  self:PlayAnimation(self.Get_In)
end

function WBP_Battle_TaskBar_DynamicEvent_C:ShowPetProgress()
  self.Pos_PetDefense:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local Widget = self.Pos_PetDefense:GetChildAt(0)
  if nil == Widget then
    Widget = self:CreateWidgetNew("PetCaptureDefenseProgress")
    if nil == Widget then
      Utils.ScreenPrint("CreateWidgetNew Error WBP_Pet_Capture_DefenseProgress")
    end
  end
  if Widget then
    self.Pos_PetDefense:AddChild(Widget)
    self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:UpdatePetProgress()
  end
end

function WBP_Battle_TaskBar_DynamicEvent_C:HidePetProgress(PetEventSuccess, PetEventFail, PetSuccess)
  self.Pos_PetDefense:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if PetSuccess then
    self:PlaySuccessAnim(PetEventSuccess)
  else
    self:PlayFailAnim(PetEventFail)
  end
end

function WBP_Battle_TaskBar_DynamicEvent_C:HidePetProgressRoot()
  self.Pos_PetDefense:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Battle_TaskBar_DynamicEvent_C:UpdatePetProgress()
  local Widget = self.Pos_PetDefense:GetChildAt(0)
  if nil ~= Widget then
    local TotalVal = DataMgr.GlobalConstant.PetDefenceMonsterNum.ConstantValue
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local Rate = GameState.PetDefenceKilledNum / TotalVal
    Rate = math.min(Rate, 1)
    Widget.Text_Process:SetText(math.floor(Rate * 100))
    Widget.ProgressBar_Defense:SetPercent(Rate)
  end
end

return WBP_Battle_TaskBar_DynamicEvent_C
