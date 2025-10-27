require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Update(Idx, Info, PlatformDeviceName)
  self.Info = Info
  Info.UI = self
  self.Idx = Idx
  self.IsLocked = Info.IsLocked
  self.PlatformDeviceName = PlatformDeviceName
  if Info.IconPath and self.Img_Icon then
    self.Img_Icon:GetDynamicMaterial():SetTextureParameterValue("Mask", LoadObject(Info.IconPath))
  end
  if self.IsLocked then
    self:PlayAnimation(self.Lock)
  end
  self.Text_SubTab:SetText(Info.Text)
  if self.Reddot then
    self:SetReddot(Info.IsNew, Info.ShowRedDot)
  end
  if self.Reddot_Num then
    self:SetReddotNum(Info.ShowRedDotNum)
    if Info.RedDotTreeName then
      self:AddReddotListener(Info.RedDotTreeName)
    end
  end
  if self.Info and self.Info.TipsData then
    local TipsData = self.Info.TipsData
    if TipsData.TipsName then
      self.Text_DontCost:SetText(TipsData.TipsName)
    end
    if TipsData.Icon then
      self.Common_Item_Icon.Img_Icon:SetBrushResourceObject(LoadObject(TipsData.Icon))
    end
    if self.DontCost_In then
      self:PlayAnimation(self.DontCost_In)
    end
  end
end

function M:AddReddotListener(ReddotTreeName)
  ReddotManager.AddListener(ReddotTreeName, self, function(self, Count)
    local ReddotType = DataMgr.ReddotNode[ReddotTreeName].Type
    local IsNew = 1 == ReddotType and Count > 0
    local Upgradeable = 0 == ReddotType and Count > 0
    self:SetReddot(IsNew, Upgradeable)
  end)
end

function M:RemoveReddotListener(ReddotTreeName)
  if nil == ReddotTreeName then
    return
  end
  ReddotManager.RemoveListener(ReddotTreeName, self)
end

function M:SetFitSize(NewSize)
  if self.Root then
    self.Root:SetWidthOverride(NewSize.X)
    self.Root:SetHeightOverride(NewSize.Y)
  end
end

function M:GetTabId()
  return self.Info.TabId
end

function M:GetTabIndex()
  return self.Idx
end

function M:Btn_Clicked()
  if self.SoundFunc then
    self.SoundFunc(self.SoundFuncReceiver)
  end
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:Btn_Press()
  if self.IsOn or self.IsLocked then
    return
  end
  if self:IsAnimationPlaying(self.Press) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Press)
  self:PlayAnimation(self.Press)
end

function M:Btn_Hover()
  if self.PlatformDeviceName == "Mobile" then
    return
  end
  if self.IsOn or self.IsLocked then
    return
  end
  if self.HoverSoundFunc then
    self.HoverSoundFunc(self.SoundFuncReceiver, self.Idx)
  end
  self:PlayAnimation(self.Hover)
end

function M:Btn_UnHover()
  if self.PlatformDeviceName == "Mobile" then
    return
  end
  if self.IsOn or self.IsLocked then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimation(self.UnHover)
end

function M:SetSwitchOn(IsOn, IsNeedPressAnim)
  if self.IsLocked then
    local ShowTextContent = self.Info.LockReasonText or "Not Define!!!!"
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, ShowTextContent)
    return
  end
  self.IsOn = IsOn
  if IsOn then
    if self:IsAnimationPlaying(self.UnHover) then
      self:StopAnimation(self.UnHover)
    end
    if IsNeedPressAnim then
      local function PlayPressAnimFinished()
        self:PlayAnimation(self.Click)
      end
      
      self:UnbindAllFromAnimationFinished(self.Press)
      self:BindToAnimationFinished(self.Press, {self, PlayPressAnimFinished})
      self:PlayAnimation(self.Press)
    else
      self:PlayAnimation(self.Click)
    end
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
  end
end

function M:BindEventOnSwitchOn(Obj, Event)
  self.ObjSwitchOn = Obj
  self.EventSwitchOn = Event
end

function M:UnbindEventOnSwitchOn()
  self.ObjSwitchOn = nil
  self.EventSwitchOn = nil
end

function M:BindEventOnSwitchOff(Obj, Event)
  self.ObjSwitchOff = Obj
  self.EventSwitchOff = Event
end

function M:UnbindEventOnSwitchOff()
  self.ObjSwitchOff = nil
  self.EventSwitchOff = nil
end

function M:BindSoundFunc(func, Receiver)
  self.SoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:BindHoverSoundFunc(func, Receiver)
  self.HoverSoundFunc = func
  self.SoundFuncReceiver = Receiver
end

function M:SetLockInfo(bUnLock)
  self.IsLocked = bUnLock
  if bUnLock then
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Lock)
  end
end

function M:SetReddot(IsNew, Upgradeable, OtherReddot)
  self.IsNew = IsNew
  self.Upgradeable = Upgradeable
  self.OtherReddot = OtherReddot
  if IsNew then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Reddot then
    if OtherReddot then
      self.Reddot:SetReddotStyle(1)
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif Upgradeable then
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:SetReddotNum(RedNum)
  if nil ~= RedNum and RedNum > 0 then
    self.Reddot_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Reddot_Num:SetNum(RedNum)
  else
    self.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:Destruct()
  if self.Info then
    self:RemoveReddotListener(self.Info.RedDotTreeName)
    self.Info.UI = nil
  end
end

return M
