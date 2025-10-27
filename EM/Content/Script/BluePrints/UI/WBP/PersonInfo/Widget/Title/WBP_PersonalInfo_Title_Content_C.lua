require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()
local Handled = UE4.UWidgetBlueprintLibrary.Handled()

function M:Initialize(Initializer)
  self.SuffixTitleID = nil
  self.PrefixTitleId = nil
  self.CurrentTitleFrameID = nil
end

local StyleBPPath = "BluePrints.UI.WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Widget/Title/WBP_PersonalInfo_Title_TypeContent.WBP_PersonalInfo_Title_TypeContent'"
local ContentBPPath = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Widget/Title/WBP_PersonalInfo_Title_TitleContent.WBP_PersonalInfo_Title_TitleContent'"

function M:InitContent()
  self.CurrentTitleWidget = nil
  self.CurrentTitleFrameID = nil
  self.TitleWidgetMap = {}
  self:SetFocus()
  self:LoadData()
  self.Dialog = UIManager(self):GetUIObj("CommonDialog")
  self.Tab = self.Dialog.DialogTitle
  if self.Tab then
    self:InitTab()
  end
  self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equip"))
  self.Btn_Change.Button_Area.OnClicked:Add(self, self.OnComfirmBtnClick)
  self.Btn_Random.Button_Area.OnClicked:Add(self, self.OnRandomBtnClick)
  self.Btn_Random:TryOverrideSoundFunc(function(Widget)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end)
  self.Btn_Change:TryOverrideSoundFunc(function(Widget)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self.Key_Random:CreateGamepadKey(UIConst.GamePadImgKey.FaceButtonLeft)
  self.Text_DetailTitle:SetText(GText("UI_PersonalPage_Title_Frame"))
  self.Text_Lock:SetText(GText("UI_PersonalPage_Title_NeedEquip"))
  self:AddTimer(0.01, function()
    self:LatenInit()
  end)
  self.Text_Empty:SetText(GText("UI_PersonalPage_Title_NoEquip"))
end

function M:LoadData()
  self.Avatar = GWorld:GetAvatar()
  self.UsedFrameId = self.Avatar.TitleFrame
  self.PrefixTitleId = self.Avatar.TitleBefore
  self.SuffixTitleID = self.Avatar.TitleAfter
  local Avatar = GWorld:GetAvatar()
  local FrameId = Avatar.TitleFrame
  if FrameId then
    if DataMgr.TitleFrame and DataMgr.TitleFrame[FrameId] and DataMgr.TitleFrame[FrameId].Name then
      local FrameData = DataMgr.TitleFrame[FrameId]
      self.Text_DetailType:SetText(GText(FrameData.Name))
    else
      ScreenPrint("\230\178\161\230\156\137\230\137\190\229\136\176\228\189\169\230\136\180\231\154\132\229\164\180\229\131\143 ID\228\184\186" .. FrameId or "\231\169\186")
    end
  end
  self.TitleFrameDatas = DataMgr.TitleFrame
  self:OnTietleStyleChange(self.UsedFrameId)
end

function M:InitTitleFrame()
  self.Title:ClearChildren()
  self:OnTietleStyleChange(self.CurrentTitleWidget)
end

function M:InitTab()
  local Tabs = {}
  Tabs[1] = {
    Text = GText("UI_PersonalPage_Title_Name"),
    Idx = 1
  }
  Tabs[2] = {
    Text = GText("UI_PersonalPage_Title_Frame"),
    Idx = 2
  }
  local ConfigData = {
    Owner = self,
    LeftKey = "Q",
    RightKey = "E",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder",
    Tabs = Tabs,
    SoundFuncReceiver = self,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", "TitleClose", nil)
    end
  }
  self.Tab.Com_Tab:Init(ConfigData)
  self.Tab.Com_Tab:BindEventOnTabSelected(self, self.OnTabChange)
  local TabId = 1
  self.Tab.Com_Tab:SelectTab(TabId)
  ReddotManager.AddListenerEx("TitleTab", self, self.OnTitleTabReddotChange)
  ReddotManager.AddListenerEx("TitleFrameTab", self, self.OnTitleFrameTabReddotChange)
end

function M:OnTabChange(TabWidget)
  self.TabId = TabWidget.Idx
  local Idx = TabWidget.Idx
  if 1 == Idx then
    if self.TitleStylePage then
      self.TitleStylePage:SetVisibility(ESlateVisibility.Collapsed)
      self.TitleStylePage:ResetEquipFrame()
    end
    if self.TitleContentPage == nil then
      self.TitleContentPage = UIManager(self):CreateWidget(ContentBPPath, false)
      self.Content:AddChildToOverlay(self.TitleContentPage)
      self.TitleContentPage:InitBaseView()
      self.TitleContentPage.FatherPage = self
    else
      self.TitleContentPage:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:OnTitleContentPageSwitch()
  elseif 2 == Idx then
    if self.TitleContentPage then
      self.TitleContentPage:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.TitleStylePage == nil then
      self.TitleStylePage = UIManager(self):CreateWidget(StyleBPPath, false)
      self.Content:AddChildToOverlay(self.TitleStylePage)
      self.TitleStylePage:InitBaseView()
      self.TitleStylePage.FatherPage = self
    else
      self.TitleStylePage:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:OnTitleStylePageSwitch()
  end
end

function M:LatenInit()
  self.SwitchBtnIdx = self.Dialog:InitGamepadShortcut({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LH"}
    },
    Desc = GText("UI_Controller_Switch")
  }, 2)
  self.AdjustBtnIdx = self.Dialog:InitGamepadShortcut({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LV"}
    },
    Desc = GText("UI_CTL_Adjust")
  }, 3)
end

function M:InitBaseView()
end

function M:OnTitleContentPageSwitch()
  local Avatar = GWorld:GetAvatar()
  local PrefixTitleId = Avatar.TitleBefore
  local SuffixTitleID = Avatar.TitleAfter
  self.WS:SetActiveWidgetIndex(0)
  local PrefixTitleTable, SuffixTitleTable = UIUtils.GetSortedTitleTable(PrefixTitleId, SuffixTitleID)
  if #PrefixTitleTable > 1 and #SuffixTitleTable > 1 then
    self.Btn_Random:ForbidBtn(false)
    self.Btn_Random:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Random:ForbidBtn(true)
    self.Btn_Random:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self.TitleContentPage:SetFocus()
  if self.IsGamePad then
    self.TitleContentPage:InitGamepadView()
  else
    self.TitleContentPage:InitKeyboardView()
  end
  self.Dialog:ShowGamepadShortcut(self.AdjustBtnIdx)
  self.Dialog:ShowGamepadShortcut(self.SwitchBtnIdx)
  self:FreshBtnStatebyTitle()
  if -1 == self.PrefixTitleId and -1 == self.SuffixTitleID then
    self.WS_Detail:SetActiveWidgetIndex(1)
  else
    self.WS:SetActiveWidgetIndex(0)
  end
end

function M:OnTitleStylePageSwitch()
  self.TitleContentPage:InitSelect()
  self.Dialog:HideGamepadShortcut(self.AdjustBtnIdx)
  self.Dialog:HideGamepadShortcut(self.SwitchBtnIdx)
  self.Btn_Random:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.IsGamePad then
    self.TitleStylePage:InitGamepadView()
  else
    self.TitleStylePage:InitKeyboardView()
  end
  if -1 == self.PrefixTitleId and -1 == self.SuffixTitleID then
    self.WS:SetActiveWidgetIndex(1)
  else
    self.WS:SetActiveWidgetIndex(0)
  end
  self.WS_Detail:SetActiveWidgetIndex(0)
  self:FreshBtnStatebyFrame()
end

function M:OnRandomBtnClick()
  self.TitleContentPage:RandomSelectTitle()
end

function M:OnTietleContentChange(PrefixTitleId, SuffixTitleID)
  self.PrefixTitleId = PrefixTitleId
  self.SuffixTitleID = SuffixTitleID
  self:FreshTitleText()
  local Avatar = GWorld:GetAvatar()
  if Avatar.TitleBefore == PrefixTitleId and Avatar.TitleAfter == SuffixTitleID then
    self.Btn_Change:ForbidBtn(true)
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equipped"))
  else
    self.Btn_Change:ForbidBtn(false)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equip"))
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:FreshBtnStatebyTitle()
end

function M:FreshBtnStatebyTitle()
  local Avatar = GWorld:GetAvatar()
  if Avatar.TitleBefore == self.PrefixTitleId and Avatar.TitleAfter == self.SuffixTitleID then
    self.Btn_Change:ForbidBtn(true)
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equipped"))
  else
    self.Btn_Change:ForbidBtn(false)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equip"))
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:FreshBtnStatebyFrame()
  local Avatar = GWorld:GetAvatar()
  if Avatar.TitleFrame == self.CurrentTitleFrameID then
    self.Btn_Change:ForbidBtn(true)
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equipped"))
  else
    self.Btn_Change:ForbidBtn(false)
    self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equip"))
    self.Btn_Change:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:IsCanChangeTitle()
  return self.Btn_Change:IsBtnForbidden() == false and 0 == self.WS:GetActiveWidgetIndex()
end

function M:IsRandomBtnCanClick()
  return self.Btn_Random:IsBtnForbidden() == false
end

function M:OnTietleStyleChange(FrameId)
  if self.CurrentTitleFrameID == FrameId then
    return
  end
  if self.CurrentTitleWidget then
    self.CurrentTitleWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local FrameData = self.TitleFrameDatas[FrameId]
  if self.TitleWidgetMap[FrameId] then
    self.TitleWidgetMap[FrameId]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.CurrentTitleWidget = self.TitleWidgetMap[FrameId]
    self.CurrentTitleFrameID = FrameId
    self:FreshTitleText()
  elseif FrameData then
    if not self.TitleWidgetMap[FrameId] then
      local FramePath = FrameData.FramePath
      local Widget = UIManager(self):LoadTitleFrameWidget(FrameId)
      if Widget then
        self.Title:AddChildToOverlay(Widget)
        self.CurrentTitleWidget = Widget
        self.CurrentTitleFrameID = FrameId
        self:FreshTitleText()
        self.TitleWidgetMap[FrameId] = Widget
      else
        ScreenPrint("WBP_PersonalInfo_Title_Content_C:OnTietleStyleChange FramePath is Worng")
      end
    end
  else
    ScreenPrint("WBP_PersonalInfo_Title_Content_C:OnTietleStyleChange FrameData is nil")
  end
  if FrameId then
    if DataMgr.TitleFrame and DataMgr.TitleFrame[FrameId] and DataMgr.TitleFrame[FrameId].Name then
      local FrameData = DataMgr.TitleFrame[FrameId]
      self.Text_DetailType:SetText(GText(FrameData.Name))
    else
      ScreenPrint("\230\178\161\230\156\137\230\137\190\229\136\176\228\189\169\230\136\180\231\154\132\229\164\180\229\131\143 ID\228\184\186" .. FrameId or "\231\169\186")
    end
  end
  self:FreshBtnStatebyFrame()
end

function M:FreshTitleText()
  if -1 == self.PrefixTitleId and -1 == self.SuffixTitleID then
    if 1 == self.TabId then
      self.WS_Detail:SetActiveWidgetIndex(1)
    else
      self.CurrentTitleWidget:SetTitleContent("\226\128\148\226\128\148", "\226\128\148\226\128\148")
    end
    self.CurrentTitleWidget:SetEmpty()
  else
    self.WS_Detail:SetActiveWidgetIndex(0)
    self.CurrentTitleWidget:SetTitleContent(self.PrefixTitleId, self.SuffixTitleID)
  end
end

function M:OnComfirmBtnClick()
  if self.Avatar == nil then
    self.Avatar = GWorld:GetAvatar()
  end
  if 1 == self.TabId then
    local NowTitleBefor = self.Avatar.TitleBefore
    local NowTitleAfter = self.Avatar.TitleAfter
    local NewTitleBefor, NewTitleAfter = self.TitleContentPage:GetCurrentSelectTitle()
    self.Avatar:ChangeTitleBefore(NewTitleBefor)
    self.Avatar:ChangeTitleAfter(NewTitleAfter)
  else
    local NewTitleFrame = self.CurrentTitleFrameID
    self.Avatar:ChangeTitleFrame(NewTitleFrame)
    self.TitleStylePage:EquipSelectedTitleFrame()
  end
  self.Btn_Change:ForbidBtn(true)
  self.Btn_Change:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Change.Text_Button:SetText(GText("UI_PersonalPage_Title_Equipped"))
  UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Change_Success"))
end

function M:Destruct()
  ReddotManager.RemoveListener("TitleTab", self)
  ReddotManager.RemoveListener("TitleFrameTab", self)
end

function M:OnContentPreviewKeyDown(MyGeometry, InKeyEvent)
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
end

function M:InitGamepadView()
  self.IsGamePad = true
  if 1 == self.TabId then
    self.TitleContentPage:InitGamepadView()
  else
    self.TitleStylePage:InitGamepadView()
  end
  self.Key_Random:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:InitKeyboardView()
  self.IsGamePad = false
  if 1 == self.TabId then
    self.TitleContentPage:InitKeyboardView()
  else
    self.TitleStylePage:InitKeyboardView()
  end
  self.Key_Random:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    self.IsGamePad = false
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
end

function M:OnTitleTabReddotChange(Count, RdType, RdName)
  self.Tab.Com_Tab:ShowTabRedDot(1, Count > 0)
end

function M:OnTitleFrameTabReddotChange(Count, RdType, RdName)
  self.Tab.Com_Tab:ShowTabRedDot(2, Count > 0)
end

return M
