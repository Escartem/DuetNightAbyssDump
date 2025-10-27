require("UnLua")
local WBP_DungeonExcavationToast_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DungeonExcavationToast_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local LastTime, Content, Level, OrderText = ...
  self:InitInfo(Content, Level, OrderText)
  if LastTime > 0 then
    self:AddTimer(LastTime, self.PlayOutAnim)
  end
  self:PlayAnimation(self.In)
end

function WBP_DungeonExcavationToast_C:InitInfo(Content, Level, OrderText)
  self.Text_Dig:SetText(Content)
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
  local ImageResource = LoadObject(SceneManager:GetExcavationABCIconPath(OrderText))
  self.Img_Letter:SetBrushResourceObject(ImageResource)
  local Material = self.Img_Level:GetDynamicMaterial()
  if Material then
    Material:SetScalarParameterValue("LevelNum", Level)
  end
end

function WBP_DungeonExcavationToast_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
end

function WBP_DungeonExcavationToast_C:Close()
  local UITipList = UIManager(self):GetUI("CommonTopToastList")
  if nil ~= UITipList then
    UITipList.VerticalBox_Toast:RemoveChild(self)
  end
  self.Super.Close(self)
end

return WBP_DungeonExcavationToast_C
