require("UnLua")
local Component = {}
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local PlayerNameUtils = require("Utils.PlayerNameUtils")

function Component:Initialize(Initializer)
  self.Super.Initialize(self)
end

function Component:Construct(...)
  self.SpaceIndex = {}
end

function Component:GetCDKRewards(Items)
  local Rewards = {}
  for key, value in pairs(Items) do
    if Rewards[value.ItemType .. "s"] then
      if Rewards[value.ItemType .. "s"][value.ItemID] then
        Rewards[value.ItemType .. "s"][value.ItemID] = Rewards[value.ItemType .. "s"][value.ItemID] + value.ItemNum
      else
        Rewards[value.ItemType .. "s"][value.ItemID] = value.ItemNum
      end
    else
      Rewards[value.ItemType .. "s"] = {}
      Rewards[value.ItemType .. "s"][value.ItemID] = value.ItemNum
    end
  end
  return Rewards
end

function Component:OnClickExchangeCode()
  local CDK = self.Text_Input:GetText()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:UseCDK(CDK, function(Ret, Items)
      if Ret == ErrorCode.RET_SUCCESS then
        self.Owner:OnClose()
        local Rewards = self:GetCDKRewards(Items)
        UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, Rewards)
      elseif Ret == ErrorCode.RET_CDK_CODE_INVALID then
        self:ShowTips(GText("UI_Exchange_Incorrect"), self.RedTip)
        AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", "", nil)
        return
      else
        self:ShowTips(GText("UI_Exchange_Invalidity"), self.RedTip)
        AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", "", nil)
        return
      end
    end)
  end
end

function Component:OnClickButtonContinue()
  local Nickname = self.Text_Input:GetText()
  if self.IsChangeName and PlayerNameUtils.CheckIsAllSpace(Nickname) then
    self:ShowTips(GText("UI_REGISTER_EMPTY"), self.YellowTip)
    self.Owner.DontCloseWhenRightBtnClicked = true
    return
  end
  HeroUSDKUtils.CheckStringSensitive(self, Nickname, self.OnNameSensitive, self.OnNameNotSensitive)
end

function Component:OnNameSensitive(ReplaceName, Name, Words)
  AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  self:ShowTips(GText("UI_REGISTER_BANNEDINPUT"), self.RedTip)
  self.Owner.DontCloseWhenRightBtnClicked = true
end

function Component:OnNameNotSensitive(Name)
  local NameLength, RealName, IllegalRange, ErrorType = PlayerNameUtils.CheckNameLegal(Name, self.MaxNum)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_Change_Success"))
  local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
  RealName = PlayerNameUtils.DeleteHeadAndTailSpace(RealName)
  if self.IsChangeName then
    Avatar:SetAvatarNickname(RealName, function()
      MenuWorld:SetPlayerInfo()
    end)
  else
    Avatar:SetAvatarSignature(RealName, function()
      MenuWorld:SetPlayerInfo()
    end)
  end
  if self.OnNotSensitiveCallbackFunction then
    self.OnNotSensitiveCallbackFunction(self, RealName)
  end
  self.Owner:OnClose()
end

function Component:OnNameChanged(NewName)
  if "" == NewName then
    self.IsEmpty = true
    self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(true)
    self.PreInputInvalid = false
    return ""
  end
  if not self.NowInputInvalid and UE4.UKismetSystemLibrary.IsValid(self.Owner) and self.Owner and self.Owner:GetButtonBar().Btn_Yes then
    self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(false)
  end
  self.PreInputInvalid = self.NowInputInvalid
  return NewName
end

function Component:OnCodeChanged(NewCode)
  if "" == NewCode then
    self.Common_EditText:SetTextCount(0)
    self.Common_EditText:SetRichText(NewCode)
    self.IsEmpty = true
    self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(true)
    return ""
  end
  if UE4.UKismetSystemLibrary.IsValid(self.Owner) and self.Owner and self.Owner:GetButtonBar().Btn_Yes then
    self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(false)
  end
end

function Component:Tick(MyGeometry, InDeltaTime)
  local CurrentFocus = self.Text_Input:HasAnyUserFocus()
  if CurrentFocus == self.TextFocus then
    return
  end
  self.TextFocus = CurrentFocus
  if self.TextFocus then
    self.Common_EditText:SetHintText("")
  else
  end
end

function Component:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  Params.EditTextConfig = Params.EditTextConfig or {}
  if Params.ChangeName then
    Params.EditTextConfig.bLimitSpaces = true
  end
  Params.OwnerDialog = Owner
  Params.EditTextConfig.Owner = self
  Params.EditTextConfig.Events = {
    OnTextChanged = self.OnNameChanged
  }
  if not Params.ChangeName and not Params.IsExchangeCode then
    Params.EditTextConfig.bLimitBr = true
    self.WS_Input:SetActiveWidgetIndex(0)
    self.CurrentInputWidget = self.Input_Multiline
    self.Input_Multiline:Init(Params.EditTextConfig, Params)
  else
    self.WS_Input:SetActiveWidgetIndex(1)
    self.CurrentInputWidget = self.Input
    self.Input:Init(Params.EditTextConfig, Params)
  end
  self.BlackTip = 3
  self.YellowTip = 2
  self.RedTip = 1
  if not Params.FirstInit then
    return
  end
  self.IsChangeName = Params.ChangeName
  if self.IsChangeName then
    self:SetResidentTips(string.format(GText("UI_COMMONPOP_TEXT_100054_2"), DataMgr.GlobalConstant.PlayerNicknameCD.ConstantValue))
  end
  self.IsExchangeCode = Params.IsExchangeCode
  local Index = self.IsChangeName and 1 or 0
  if Params.IsExchangeCode then
    Index = 1
  end
  self.Common_EditText = self.CurrentInputWidget
  self.Text_Input = self.Common_EditText
  self.Limit_Count = self.Common_EditText.LimitCount
  if Params.ChangeName then
    self.MaxNum = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue
    self.Common_EditText:SetHintText(GText("UI_COMMONPOP_TEXT_100054_1"))
  elseif Params.IsExchangeCode then
    self.Common_EditText:SetHintText(GText("UI_Exchange_Input"))
  else
    self.MaxNum = DataMgr.GlobalConstant.SignatureMaxLen.ConstantValue
    self.Common_EditText:SetHintText(GText("UI_COMMONPOP_TEXT_100055"))
  end
  if Params.IsExchangeCode then
    self.Common_EditText:SetTextLimit(CommonConst.MailMaxDueTime)
  else
    self.Common_EditText:SetTextLimit(self.MaxNum)
  end
  if not self.IsChangeName and Params.Signature then
    self.Common_EditText:SetText(Params.Signature)
  end
  if self.IsExchangeCode then
    self:BindDialogEvent(DialogEvent.OnRightBtnClicked, function()
      self.Owner.DontCloseWhenRightBtnClicked = true
      if not self.Owner:GetButtonBar().Btn_Yes.IsForbidden then
        self:OnClickExchangeCode()
      end
    end)
  else
    self:BindDialogEvent(DialogEvent.OnRightBtnClicked, function()
      self.Owner.DontCloseWhenRightBtnClicked = true
      if not self.Owner:GetButtonBar().Btn_Yes.IsForbidden then
        self:OnClickButtonContinue()
      end
    end)
  end
  self.Owner.DontCloseWhenRightBtnClicked = true
  self.Text_Input.ClearKeyboardFocusOnCommit = true
  self.OnNotSensitiveCallbackFunction = Params.OnNotSensitiveCallbackFunction
end

return Component
