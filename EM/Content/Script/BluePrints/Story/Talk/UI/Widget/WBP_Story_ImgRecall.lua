require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Bg_Black:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Recall:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.bShowingImg = false
end

function M:Destruct()
  self:Clear()
end

function M:InitGraph(GraphPath, bNotRecall)
  self.Bg_Black:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Img_Recall:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local DialogueImage = UStoryFunctionLibrary.LoadResourceWithGender(self, GraphPath, self)
  if not DialogueImage then
    local Message = "\229\155\190\231\137\135\232\181\132\230\186\144\231\188\186\229\164\177" .. "\n\232\183\175\229\190\132:" .. GraphPath
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\181\132\230\186\144\231\188\186\229\164\177", Message)
    return
  end
  DebugPrint("WBP_Story_ImgRecall@InitGraph", GraphPath, bNotRecall)
  if not bNotRecall then
    local MatPath = "MaterialInstanceConstant'/Game/UI/WBP/Common/VX/Story/MI_FadeIn.MI_FadeIn'"
    local Mat = LoadObject(MatPath)
    if Mat then
      local MaterialInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, Mat, "None")
      if MaterialInstance then
        MaterialInstance:SetTextureParameterValue("MainTex", DialogueImage)
        self.Img_Recall:SetBrushFromMaterial(MaterialInstance)
      end
    else
      local Message = "\230\157\144\232\180\168\232\181\132\230\186\144\231\188\186\229\164\177" .. "\n\232\183\175\229\190\132:" .. MatPath
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\181\132\230\186\144\231\188\186\229\164\177", Message)
    end
  else
    self.Img_Recall:SetBrushResourceObject(DialogueImage)
  end
  self.bPlaySound = not bNotRecall
end

function M:PlayRecallAnim(bInAnim)
  self.bInAnim = bInAnim
  if self.RecallTimer then
    return
  end
  self.RecallTimer = self:AddTimer(0.01, function()
    if self.bInAnim then
      if not self.bShowingImg then
        self:StopAnimation(self.Recall_Out)
        self:PlayAnimation(self.Recall_In)
      end
      if self.bPlaySound then
      end
    else
      self.Bg_Black:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if self.bShowingImg then
        self:StopAnimation(self.Recall_In)
        self:PlayAnimation(self.Recall_Out)
      end
    end
    self.bShowingImg = self.bInAnim
    DebugPrint("WBP_Story_ImgRecall@PlayRecallAnim", self.bInAnim)
    self.RecallTimer = nil
  end, nil, nil, nil, true)
end

function M:Clear()
  if self.RecallTimer then
    self:RemoveTimer(self.RecallTimer)
    self.RecallTimer = nil
  end
end

function M:Close()
  DebugPrint("WBP_Story_ImgRecall:Close")
  self:RemoveFromParent()
  self.Bg_Black:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Img_Recall:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:Clear()
end

return M
