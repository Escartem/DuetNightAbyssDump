require("UnLua")
local MaxTeammate = TeamCommon.MaxTeamMembers - 1
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_Main_Base"
})

function M:Construct()
  M.Super.Construct(self)
  self.Key_GamePad:CreateCommonKey({
    bLongPress = true,
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = CommonUtils:GetKeyText(UIConst.GamePadKey.SpecialRight)
      }
    }
  })
  self.Key_GamePad:AddExecuteLogic(self, self.FocusToMyHead)
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange)
  self:OnInputDeviceChange()
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  if self.bBattle then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnInputDeviceChange()
  if TeamController:IsGamepad() then
    if not self.bBattle then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    if self:HasAnyUserFocus() then
      self.bIsFocusable = true
    end
  elseif not TeamController:IsMobile() then
    self.bIsFocusable = false
    if not self.bBattle then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:Destruct()
  self.Key_GamePad:RemoveExecuteLogic()
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange)
  M.Super.Destruct(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.bOpenBtnList then
      self:FocusUIByUid(self.OpenedUid)
      return UIUtils.Handled
    else
      return UIUtils.Unhandled
    end
  end
  return UIUtils.Handled
end

function M:DoGamepadBtnPress()
  self.Key_Gamepad:OnShortCutPressed()
end

function M:DoGamepadBtnRelease()
  self.Key_Gamepad:OnShortCutReleased()
end

function M:AppendToParent(ParentWidget)
  self.IsAddingToParent = true
  local ParentNode = ParentWidget.UWidget
  if ParentNode then
    ParentNode:AddChild(self)
    local SelfSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self)
    local Anchor = SelfSlot:GetAnchors()
    Anchor.Maximum.X, Anchor.Maximum.Y, Anchor.Minimum.X, Anchor.Minimum.Y = 1, 1, 0, 0
    SelfSlot:SetAnchors(Anchor)
    local Offset = SelfSlot:GetOffsets()
    Offset.Top, Offset.Left, Offset.Bottom, Offset.Right = 0, 0, 0, 0
    SelfSlot:SetOffsets(Offset)
  else
    ParentWidget:AddChild(self)
  end
  self.IsAddingToParent = false
end

function M:AddTeammateUI(Member, bAnim, HeadUI, Index)
  if not HeadUI then
    if self.WB_Player:GetChildrenCount() < MaxTeammate then
      HeadUI = self:CreateWidgetNew(DataMgr.WidgetUI.TeamHead.UIName)
      self.WB_Player:AddChild(HeadUI)
    else
      HeadUI = self.WB_Player:GetChildAt(self.TeammateCount)
      HeadUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.Teammate2UI[Member.Uid] = HeadUI
    self.TeammateCount = self.TeammateCount + 1
    self:HideAddBtn(self.TeammateCount)
  end
  HeadUI:Init(TeamCommon.HeadUser.Team, self, Member, Index, bAnim)
  if self.bBattle then
    HeadUI:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  local Slot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(self.WB_Player)
  if self.TeammateCount < MaxTeammate then
    Rule.SizeRule = UE.ESlateSizeRule.Automatic
    Slot:SetSize(Rule)
    if bAnim then
      self:PlayMove(true)
    end
  elseif self.TeammateCount >= MaxTeammate then
    Rule.SizeRule = UE.ESlateSizeRule.Fill
    Slot:SetSize(Rule)
  end
  return
end

function M:DelTeammateUI(Uid)
  if not self.Teammate2UI then
    return
  end
  if not self.Teammate2UI[Uid] then
    return
  end
  local DelIndex = self.Teammate2UI[Uid].Index
  if self.TeammateCount >= MaxTeammate then
    local Slot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(self.WB_Player)
    Rule.SizeRule = UE.ESlateSizeRule.Automatic
    Slot:SetSize(Rule)
    self:PlayMove()
  end
  for _, HeadUI in pairs(self.Teammate2UI) do
    if DelIndex < HeadUI.Index then
      HeadUI:PlayMove()
    end
  end
  if not self.bBattle and DelIndex < self.Head_My.Index then
    self.Head_My.Index = self.Head_My.Index - 1
    self.Head_My:UpdateTag()
  end
  self.Teammate2UI[Uid]:OnTeammateDelete()
  self.Teammate2UI[Uid] = nil
  self:ShowAddBtn(self.TeammateCount)
  self.TeammateCount = self.TeammateCount - 1
end

function M:OnInitAddBtn()
  if self.bBattle then
    return
  end
  if self.EmptyHeadeAnchor:GetChildrenCount() > 0 then
    for i = 1, MaxTeammate do
      self:ShowAddBtn(i)
    end
    return
  end
  for i = 1, MaxTeammate do
    local TeamHead = self:CreateWidgetNew(TeamCommon.CommonHead)
    TeamHead:SetGamepadCursor()
    TeamHead.Panel_Img:SetActiveWidgetIndex(1)
    TeamHead:BindOnClickEvent(function()
      if IsValid(FriendController:GetView(self)) then
        TeamController:ShowToast(GText("UI_Team_InFriend"))
      else
        FriendController:OpenView(self, FriendCommon.FriendTabType.MyFriend)
      end
    end)
    self.EmptyHeadeAnchor:AddChild(TeamHead)
    local TeamHeadSlot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(TeamHead)
    TeamHeadSlot.Padding.Right = self.WB_Player.InnerSlotPadding.X
    TeamHeadSlot:SetPadding(TeamHeadSlot.Padding)
    TeamHeadSlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    TeamHeadSlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    Rule.SizeRule = UE.ESlateSizeRule.Fill
    TeamHeadSlot:SetSize(Rule)
  end
end

function M:HideAddBtn(i)
  if self.bBattle then
    return
  end
  local AddBtn = self.EmptyHeadeAnchor:GetChildAt(i - 1)
  if not AddBtn:IsVisible() then
    return
  end
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Head_My.Head_Team)
  local BtnSizeX = CanvasSlot:GetSize().X
  local PaddingX = self.WB_Player.InnerSlotPadding.X
  AddBtn:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Add:SetWidthOverride(self.Panel_Add.WidthOverride - BtnSizeX - PaddingX)
end

function M:ShowAddBtn(i)
  if self.bBattle then
    return
  end
  local AddBtn = self.EmptyHeadeAnchor:GetChildAt(i - 1)
  if AddBtn:IsVisible() then
    return
  end
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Head_My.Head_Team)
  local BtnSizeX = CanvasSlot:GetSize().X
  local PaddingX = self.WB_Player.InnerSlotPadding.X
  AddBtn:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Panel_Add:SetWidthOverride(self.Panel_Add.WidthOverride + BtnSizeX + PaddingX)
end

function M:Close()
  M.Super.Close(self)
  self.bIsFocusable = false
  self.EmptyHeadeAnchor:ClearChildren()
end

function M:FocusToMyHead()
  self:FocusUIByUid(TeamController:GetAvatar().Uid)
end

function M:OnFocusLost(InFocusEvent)
  self.bIsFocusable = false
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.bIsFocusable = false
  if self.OnTeamMainFocusChanged and TeamController:IsGamepad() then
    self.OnTeamMainFocusChanged(false)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  DebugPrint("TeamMain  OnAddedToFocusPath")
  if self.OnTeamMainFocusChanged and TeamController:IsGamepad() then
    self.OnTeamMainFocusChanged(true)
  end
end

function M:FocusUIByUid(Uid)
  if not (not self.bIsFocusable or self.bOpenBtnList) or not self:IsVisible() then
    return
  end
  DebugPrint("WBP_Team_Main_P_C :: FocusUIByUid , ")
  self.bIsFocusable = true
  local TeamModel = TeamController:GetModel()
  if TeamModel:IsYourself(Uid) then
    self.Head_My.Head_Team:SetGamepadCursor()
    self.Head_My.Head_Team.Button_Area:SetFocus()
  elseif self.Teammate2UI[Uid] then
    self.Teammate2UI[Uid].Head_Team:SetGamepadCursor()
    self.Teammate2UI[Uid].Head_Team.Button_Area:SetFocus()
  end
  self.bOpenBtnList = false
  self.OpenedUid = nil
end

return M
