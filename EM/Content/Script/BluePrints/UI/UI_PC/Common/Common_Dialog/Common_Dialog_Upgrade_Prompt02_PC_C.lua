require("UnLua")
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.UIComponent.StarsUIComponent"
}

function M:Construct()
  self.Button_Close.OnClicked:Clear()
  self.Button_Close.OnClicked:Add(self, self.OnCloseBtnClicked)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInAnimationFinished
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
  AudioManager(self):PlayUISound(self, "event:/ui/armory/strength_success", nil, nil)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UE4.EKeys.Escape.KeyName then
    self:OnCloseBtnClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.BehaviorType, self.TargetType, self.Level, self.NewLevel, self.Attrs, self.ComparedAttrs, self.OnClosedCallbackObj, self.OnClosedCallbackFunc = ...
  self:UpdateUpgradeInfo()
  self:UpdataAttrListView(self.Attrs, self.ComparedAttrs)
  self:PlayInAnim()
  self:SetFocus()
end

function M:UpdateUpgradeInfo()
  if self.BehaviorType == "LevelUp" then
    self.Text_Num:SetText(self.NewLevel)
    if self.TargetType == "Char" then
      self.Text_Description:SetText(GText("Char_LevelUp_Success"))
      self.Text_Decorate:SetText(EnText("Char_LevelUp_Success"))
    elseif self.TargetType == "Weapon" then
      self.Text_Description:SetText(GText("Weapon_LevelUp_Success"))
      self.Text_Decorate:SetText(EnText("Weapon_LevelUp_Success"))
    elseif self.TargetType == "Skill" then
      self.Text_Description:SetText(GText("CharSkill_LevelUp_Success"))
      self.Text_Decorate:SetText(EnText("CharSkill_LevelUp_Success"))
    else
      self.Text_Description:SetText("")
      self.Text_Decorate:SetText("")
    end
    self.Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_LevelUp:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self:SetStars(self.Level, self.NewLevel)
    self:PlayStarsInAnim()
    
    local function func()
      self:PlayStarGoldenInAnim(self.Level + 1)
    end
    
    self:AddTimer(self.NewLevel * 0.1 + 0.1, func)
    if self.TargetType == "Char" then
      self.Text_Description:SetText(GText("Char_BreakLevelUp_Success"))
      self.Text_Decorate:SetText(EnText("Char_BreakLevelUp_Success"))
    elseif self.TargetType == "Weapon" then
      self.Text_Description:SetText(GText("Weapon_BreakLevelUp_Success"))
      self.Text_Decorate:SetText(EnText("Weapon_BreakLevelUp_Success"))
    else
      self.Text_Description:SetText("")
      self.Text_Decorate:SetText("")
    end
    self.Star:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_LevelUp:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Mod_lvup:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.SW:SetActiveWidgetIndex(1)
end

function M:UpdataAttrListView(Attrs, ComparedAttrs)
  self.NowListView = self.ListView
  self.Attrs = Attrs
  self.ComparedAttrs = ComparedAttrs
  self.NowListView:ClearListItems()
  local Obj
  local Class = UIUtils.GetCommonItemContentClass()
  for i, Attr in ipairs(self.Attrs) do
    Obj = NewObject(Class)
    Obj.AttrName = Attr.AttrName
    Obj.AttrValue = Attr.AttrValue or 0
    Obj.CmpValue = self.ComparedAttrs[i].AttrValue or 0
    Obj.AttrDesc = Attr.AttrDesc
    Obj.Idx = i
    Obj.Delta = self.ComparedAttrs[i].Delta
    Obj.Nagative = self.ComparedAttrs[i].Nagative
    self.NowListView:AddItem(Obj)
  end
  self.NowListView:RequestRefresh()
end

function M:PlayInAnim()
  self.CannotClose = true
  self.Button_Close:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:PlayAnimation(self.In)
end

function M:SequenceEvent_PlayAttrAnim()
  self.SW:SetActiveWidgetIndex(0)
  self.Text_Details:SetVisibility(UIConst.VisibilityOp.Collapsed)
  UIUtils.StopListViewFramingInAnimation(self.NowListView, {
    TimerKeys = self.FramingInTimers,
    UIState = self
  })
  self:AddTimer(0.01, function()
    self.FramingInTimers = UIUtils.PlayListViewFramingInAnimation(self, self.NowListView, {
      Visibility = UIConst.VisibilityOp.HitTestInvisible,
      Callback = function()
        self.Text_Details:SetVisibility(UIConst.VisibilityOp.Visible)
      end
    })
  end)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/strength_success_next_page", nil, nil)
end

function M:OnInAnimationFinished()
  self.CannotClose = false
  self.Button_Close:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnCloseBtnClicked()
  if self.CannotClose then
    return
  end
  self:PlayOutAnim()
end

function M:PlayOutAnim()
  self.CannotClose = true
  self:PlayAnimation(self.Out)
end

function M:OnOutAnimationFinished()
  self:Close()
  if self.OnClosedCallbackFunc then
    self.OnClosedCallbackFunc(self.OnClosedCallbackObj)
  end
  UIUtils.StopListViewFramingInAnimation(self.NowListView, {
    TimerKeys = self.FramingInTimers,
    UIState = self
  })
end

AssembleComponents(M)
return M
