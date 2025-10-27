local HighlightButtonNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function HighlightButtonNode:Init()
  self.ShowEnable = false
  self.SkillType = ""
end

function HighlightButtonNode:Start(Context)
  self.Context = Context
  self:ShowMessage(self.Context)
end

function HighlightButtonNode:ShowMessage(Context)
  DebugPrint("------------ HighlightButtonNode ------------------")
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    self:Finish()
    return
  end
  local BattleMain = UIManager:GetUIObj("BattleMain")
  local Platform = CommonUtils:GetDeviceTypeByPlatformName(BattleMain)
  if self.ShowEnable then
    if "PC" == Platform then
      BattleMain.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
      if nil == Instruction then
        Instruction = BattleMain:GetOrAddWidget("InstructionPC", BattleMain.Pos_Instruction)
        if Instruction then
          Instruction:Init(self.SkillType, true)
          Instruction:HideAllText()
        end
      end
      if Instruction then
        Instruction:Init(self.SkillType, true)
        DebugPrint(self.SkillType, "===HighlightButton=Show=PC===========================", Instruction.Key.Main:GetRenderOpacity())
        if 1 ~= Instruction.Key.Main:GetRenderOpacity() then
          self.RealStart = true
        end
        Instruction.Key:UnbindAllFromAnimationFinished(Instruction.Key.In)
        
        local function LoopAnim()
          Instruction.Key:PlayAnimation(Instruction.Key.Loop, 0, 0)
        end
        
        if self.SkillType == "MoveCamera" then
          function LoopAnim()
            EMUIAnimationSubsystem:EMPlayAnimation(Instruction.Key, Instruction.Key.ArrowUp, 0, true)
          end
        end
        Instruction.Key:BindToAnimationFinished(Instruction.Key.In, {
          Instruction.Key,
          LoopAnim
        })
        Instruction.Key:StopAnimation(Instruction.Key.Out)
        if self.SkillType == "Skill1" then
          local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
          if Player then
            local CanUseSkill1 = Player:CheckCanUseSkillWithoutToast(UE.ESkillType.Skill1)
            if CanUseSkill1 then
              Instruction.Key:StopAllAnimations()
              Instruction.Key:PlayAnimation(Instruction.Key.In)
            else
              Instruction.Key:StopAllAnimations()
              Instruction.Key:UnbindAllFromAnimationFinished(Instruction.Key.In)
              
              local function CloseLoopAnim()
                Instruction.Key:PlayAnimation(Instruction.Key.CloseLoop, 0, 0)
              end
              
              Instruction.Key:PlayAnimation(Instruction.Key.In)
            end
            Instruction.CanUseSkill1 = CanUseSkill1
          end
        else
          Instruction.Key:PlayAnimation(Instruction.Key.In)
        end
        if self.SkillType == "Attack" or self.SkillType == "MoveCamera" then
        else
          Instruction.Key.VX_guide_Sq1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          Instruction.Key.VX_guide_Sq2:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        if self.SkillType == "Attack" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Attack"))
        elseif self.SkillType == "MoveCamera" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_MoveCamera"))
        elseif self.SkillType == "Skill1" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Skill1"))
          local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
          if Player then
            Instruction:AddTimer(0.1, function()
              local CanUseSkill1 = Player:CheckCanUseSkillWithoutToast(UE.ESkillType.Skill1)
              if CanUseSkill1 and Instruction.CanUseSkill1 == false then
                if Instruction.UsingGamepad then
                  Instruction.key.VX_guide_Cirle1:SetVisibility(ESlateVisibility.Visible)
                  Instruction.key.VX_guide_Cirle2:SetVisibility(ESlateVisibility.Visible)
                else
                  Instruction.Key.VX_guide_Sq1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
                  Instruction.Key.VX_guide_Sq2:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
                end
                Instruction.Key:StopAllAnimations()
                Instruction.Key:PlayAnimation(Instruction.Key.Loop, 0, 0)
                DebugPrint("========================HighlightButton=======CheckCanUseSkill=========PlayAnimation==========")
              elseif false == CanUseSkill1 and Instruction.CanUseSkill1 then
                Instruction.Key:StopAnimation(Instruction.Key.Loop)
                Instruction.Key:PlayAnimation(Instruction.Key.CloseLoop)
                DebugPrint("========================HighlightButton=======CheckCanUseSkill=========StopAnimation==========")
              end
              Instruction.CanUseSkill1 = CanUseSkill1
            end, true, 0, "InstructionKeyAnim", true)
          end
        elseif self.SkillType == "Skill2" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Skill2"))
        elseif self.SkillType == "Interactive" then
          Instruction.Key.Text_Describe:SetText(GText("MESSAGE_TITLE_LOADING_21_PC"))
        end
      end
    else
      DebugPrint(self.SkillType, "===HighlightButton=Show=Mobile===========================")
      if self.SkillType == "Attack" then
        BattleMain.Char_Skill.AtkMelee:PlayAnimation(BattleMain.Char_Skill.AtkMelee.Loop, 0, 0)
      elseif self.SkillType == "Skill1" then
        BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_1_Loop, 0, 0)
      elseif self.SkillType == "Skill2" then
        BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_2_Loop, 0, 0)
      elseif self.SkillType == "MoveCamera" then
        UE4.UUIStateAsyncActionBase.ShowGuideToastFingerNode(GameInstance, 200012, -1, self.SkillType, "Up", FVector2D(0, 0))
      end
    end
  elseif "PC" == Platform then
    local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
    if nil == Instruction then
      self:Finish()
      return
    end
    DebugPrint(self.SkillType, "===HighlightButton=Hide=PC===========================", Instruction.Key.Main:GetRenderOpacity())
    if 0 ~= Instruction.Key.Main:GetRenderOpacity() then
      self.RealStart = true
    end
    if self.SkillType == "MoveCamera" then
      EMUIAnimationSubsystem:EMPlayAnimation(Instruction.Key, Instruction.Key.ArrowUp)
    else
      Instruction.Key:StopAnimation(Instruction.Key.Loop)
      if self.SkillType == "Skill1" then
        Instruction:RemoveTimer("InstructionKeyAnim")
      end
    end
    Instruction.Key:PlayAnimation(Instruction.Key.Out)
  else
    DebugPrint(self.SkillType, "===HighlightButton=Hide=Mobile===========================")
    if self.SkillType == "Attack" then
      BattleMain.Char_Skill.AtkMelee:StopAnimation(BattleMain.Char_Skill.AtkMelee.Loop)
      BattleMain.Char_Skill.AtkMelee:PlayAnimation(BattleMain.Char_Skill.AtkMelee.LoopEnd)
    elseif self.SkillType == "Skill1" then
      BattleMain.Char_Skill.Skill:StopAnimation(BattleMain.Char_Skill.Skill.Skill_1_Loop)
      BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_1_LoopEnd)
    elseif self.SkillType == "Skill2" then
      BattleMain.Char_Skill.Skill:StopAnimation(BattleMain.Char_Skill.Skill.Skill_2_Loop)
      BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_2_LoopEnd)
    elseif self.SkillType == "MoveCamera" then
      local GuideGesture = UIManager:GetUIObj("GuideGesture")
      if GuideGesture then
        GuideGesture:PlayOutAnimation()
      end
    end
  end
  self:Finish()
end

function HighlightButtonNode:OnQuestlineFail()
  DebugPrint("HighlightButtonNode: OnQuestlineFail", self.ShowEnable, self.SkillType, self.RealStart)
  if self.RealStart ~= true then
    return
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local BattleMain = UIManager:GetUIObj("BattleMain")
  local Platform = CommonUtils:GetDeviceTypeByPlatformName(BattleMain)
  if self.ShowEnable == false then
    if "PC" == Platform then
      local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
      if nil == Instruction then
        return
      end
      if Instruction then
        DebugPrint(self.SkillType, "===HighlightButton=Show=PC===========================")
        Instruction.Key.Main:SetRenderOpacity(1)
        Instruction.Key:PlayAnimation(Instruction.Key.Loop, 0, 0)
        if self.SkillType == "Attack" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Attack"))
        elseif self.SkillType == "Skill1" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Skill1"))
        elseif self.SkillType == "Skill2" then
          Instruction.Key.Text_Describe:SetText(GText("Guide_HighlightButton_Skill2"))
        elseif self.SkillType == "Interactive" then
          Instruction.Key.Text_Describe:SetText(GText("MESSAGE_TITLE_LOADING_21_PC"))
        end
      end
    else
      DebugPrint(self.SkillType, "===HighlightButton=Show=Mobile===========================")
      if self.SkillType == "Attack" then
        BattleMain.Char_Skill.AtkMelee:PlayAnimation(BattleMain.Char_Skill.AtkMelee.Loop, 0, 0)
      elseif self.SkillType == "Skill1" then
        BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_1_Loop, 0, 0)
      elseif self.SkillType == "Skill2" then
        BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_2_Loop, 0, 0)
      end
    end
  elseif "PC" == Platform then
    local Instruction = BattleMain.Pos_Instruction:GetChildAt(0)
    if nil == Instruction then
      return
    end
    DebugPrint(self.SkillType, "===HighlightButton=Hide=PC===========================")
    Instruction.Key:StopAnimation(Instruction.Key.Loop)
    Instruction.Key:PlayAnimation(Instruction.Key.Out)
  else
    DebugPrint(self.SkillType, "===HighlightButton=Hide=Mobile===========================")
    if self.SkillType == "Attack" then
      BattleMain.Char_Skill.AtkMelee:StopAnimation(BattleMain.Char_Skill.AtkMelee.Loop)
      BattleMain.Char_Skill.AtkMelee:PlayAnimation(BattleMain.Char_Skill.AtkMelee.LoopEnd)
    elseif self.SkillType == "Skill1" then
      BattleMain.Char_Skill.Skill:StopAnimation(BattleMain.Char_Skill.Skill.Skill_1_Loop)
      BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_1_LoopEnd)
    elseif self.SkillType == "Skill2" then
      BattleMain.Char_Skill.Skill:StopAnimation(BattleMain.Char_Skill.Skill.Skill_2_Loop)
      BattleMain.Char_Skill.Skill:PlayAnimation(BattleMain.Char_Skill.Skill.Skill_2_LoopEnd)
    end
  end
end

return HighlightButtonNode
