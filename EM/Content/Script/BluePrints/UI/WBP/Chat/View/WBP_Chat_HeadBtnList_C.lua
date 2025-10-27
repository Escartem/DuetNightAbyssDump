require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Key_Back:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = CommonUtils:GetKeyText(UIConst.GamePadKey.FaceButtonRight)
      }
    },
    Desc = GText("UI_BACK")
  })
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange)
  self:OnInputDeviceChange()
  ChatController:NotifyEvent(ChatCommon.EventID.OnChatBtnListOpen, true)
end

function M:OnInputDeviceChange()
  if TeamController:IsGamepad() then
    if not self.bDontShowBottom then
      self.Group_Bottom:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    self.bIsFocusable = true
  elseif not TeamController:IsMobile() then
    self.Group_Bottom:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.bIsFocusable = false
  end
end

function M:DontShowBottom()
  self.bDontShowBottom = true
  self.Group_Bottom:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange)
  ChatController:NotifyEvent(ChatCommon.EventID.OnChatBtnListOpen, false)
end

function M:Init(AvatarInfo, FuncList)
  self.Text_PlayerName:SetText(AvatarInfo.Nickname)
  for i, Func in ipairs(FuncList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Owner = self
    Func(Content, AvatarInfo)
    self.List_Btn:AddItem(Content)
  end
end

return M
