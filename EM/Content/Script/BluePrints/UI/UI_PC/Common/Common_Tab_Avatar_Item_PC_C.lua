require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Update(Idx, Info)
  local TextMapId = "UI_SHOWNPC_NAME_SCENE" .. Idx
  self.Idx = Idx
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    self.SignBoardNpcState = {
      -1,
      -1,
      -1
    }
  else
    self.SignBoardNpcState = Avatar.SignBoardNpc
  end
  self.Text_Name_Off:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Name_Off:SetText(GText(TextMapId))
  if -1 == self.SignBoardNpcState[self.Idx] then
    self.AvatarSwitch:SetActiveWidgetIndex(1)
  else
    local ShowNpc = DataMgr.Npc[self.SignBoardNpcState[self.Idx]]
    local Icon = DataMgr.Char[ShowNpc.CharId].Icon
    local NpcIcon = LoadObject(Icon)
    local Material = self.Img_Avatar_Off:GetDynamicMaterial()
    Material:SetTextureParameterValue("IconMap", NpcIcon)
    self.AvatarSwitch:SetActiveWidgetIndex(0)
  end
  self:PlayAnimation(self.Normal)
end

function M:Btn_Click()
  UIUtils.PlayCommonBtnSe(self)
  if not self.IsOn then
    self:SetSwitchOn(true)
  end
end

function M:SetSwitchOn(IsOn)
  self.IsOn = IsOn
  if IsOn then
    self:PlayAnimation(self.Selected)
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
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

return M
