require("UnLua")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Button_Remarks:SetText(GText("UI_Friend_Remark"))
  self.Button_BlackList:SetText(GText("UI_Friend_AddBlackList"))
  self.Button_Remove:SetText(GText("UI_Friend_Remove"))
  FriendController:OverrideButtonSound(self.Button_Star, "event:/ui/common/click_mid", nil)
  self.Button_Star:BindEventOnReleased(self, self.OnBtnStarReleased)
  FriendController:OverrideButtonSound(self.Button_Remarks, "event:/ui/common/click_mid", nil)
  self.Button_Remarks:BindEventOnReleased(self, self.OnBtnRemarksReleased)
  FriendController:OverrideButtonSound(self.Button_BlackList, "event:/ui/common/click_mid", nil)
  self.Button_BlackList:BindEventOnReleased(self, self.OnBtnBlackListReleased)
  FriendController:OverrideButtonSound(self.Button_Remove, "event:/ui/common/click_mid", nil)
  self.Button_Remove:BindEventOnReleased(self, self.OnBtnRemoveReleased)
  self.FriendMainView = FriendController:GetView(self)
  self:PlayAnimation(self.Auto_In)
  self.Button_Remarks:SetGamepadIconVisibility(false)
  self.Button_BlackList:SetGamepadIconVisibility(false)
  self.Button_Remove:SetGamepadIconVisibility(false)
  self.Button_Star:SetGamepadIconVisibility(false)
end

function M:SetFriendData(Data)
  self.FriendData = Data
  self:SetStarText()
end

function M:SetStarText()
  if not self.FriendData.Star then
    self.Button_Star:SetText(GText("UI_Friend_AddStar"))
  else
    self.Button_Star:SetText(GText("UI_Friend_RemoveStar"))
  end
end

function M:OnBtnStarReleased()
  self:SetStarText()
  FriendController:SendRequest(FriendCommon.EventId.SetStar, self.FriendData.Uid, not self.FriendData.Star)
  self.Parent:Close()
end

function M:OnBtnRemarksReleased()
  if not IsValid(self.FriendMainView) then
    return
  end
  local Params = {
    UseGenaral = true,
    MultilineType = 1,
    TextLenMax = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue,
    HintText = GText("UI_Friend_RemarkInputHint"),
    OnSDKChecked = function(bRes, InputWidget, ...)
      if not bRes then
        return
      end
      FriendController:SendRequest(FriendCommon.EventId.SetRemark, self.FriendData.Uid, ...)
    end
  }
  UIManager(self):ShowCommonPopupUI(FriendCommon.RemarkDialogNotInput, Params, self.FriendMainView)
  self.Parent:Close()
end

function M:OnBtnBlackListReleased()
  if not IsValid(self.FriendMainView) then
    return
  end
  FriendController:OpenAddBlacklistDialog(self, self.FriendData.Info)
  self.Parent:Close()
end

function M:OnBtnRemoveReleased()
  if not IsValid(self.FriendMainView) then
    return
  end
  local Params = {
    RightCallbackFunction = function()
      FriendController:SendRequest(FriendCommon.EventId.DeleteFriend, self.FriendData.Uid)
    end
  }
  UIManager(self):ShowCommonPopupUI(FriendCommon.DeleteDialog, Params, self.FriendMainView)
  self.Parent:Close()
end

function M:Destruct()
  self.Button_Star:UnBindEventOnReleased(self, self.OnBtnStarReleased)
  self.Button_Remarks:UnBindEventOnReleased(self, self.OnBtnRemarksReleased)
  self.Button_BlackList:UnBindEventOnReleased(self, self.OnBtnBlackListReleased)
  self.Button_Remove:UnBindEventOnReleased(self, self.OnBtnRemoveReleased)
end

function M:BP_GetDesiredFocusTarget()
  return self.MyListView
end

return M
