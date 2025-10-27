require("UnLua")
local EMCache = require("EMCache.EMCache")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.NoticeCloseTime = 0.5
  self.Button_Area.OnHovered:Add(self, self.OnBtnAreaHover)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnAreaUnHover)
  self.Bg_Set.Button_Base.OnClicked:Add(self, self.OnMainBtnClicked)
end

function S:Init(Parent, CacheName, CacheInfo, Content)
  rawset(self, "Parent", Parent)
  rawset(self, "CacheName", CacheName)
  rawset(self, "CacheInfo", CacheInfo)
  rawset(self, "IsOther", false)
  rawset(self, "CurOptionContent", Content)
  Content.ClickWidget = self
  self.Button_Area:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Text_Fixed:SetRenderOpacity(1.0)
  if self.CacheInfo then
    self.DefaultValue = self.CacheInfo.DefaultValue
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and self.CacheInfo.DefaultValueM then
      self.DefaultValue = self.CacheInfo.DefaultValueM
    end
  end
  if CacheInfo then
    self.IsOther = true
    self:InitOtherKeyText()
  else
    self:InitKeyText()
  end
  self:SetHoverVisibility()
end

function S:Gamepad_SetHovered(bIsHovered)
  if bIsHovered then
    self:OnBtnAreaHover()
  else
    self:OnBtnAreaUnHover()
  end
end

function S:GetBottomKeyInfos()
  return {
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  }
end

function S:Handle_KeyDownOnGamePad(InKeyName)
  if InKeyName == Const.GamepadFaceButtonDown then
    self:OnBtnClicked()
    return true
  end
  return false
end

function S:Handle_KeyUpOnGamePad(InKeyName)
end

function S:GetFirstWidgetToNavigate()
  return self
end

function S:GetLastWidgetToNavigate()
  return self
end

function S:OnBtnDragClicked()
  self.Parent:OnClickBlankArea()
end

function S:OnBtnClicked()
  UIUtils.PlayCommonBtnSe(self)
  if self.IsOther then
    if self["On" .. self.CacheName .. "Clicked"] then
      self["On" .. self.CacheName .. "Clicked"](self)
    end
  else
    self.CurOptionContent.ParentWidget:OnClickListOption(self.CurOptionContent)
  end
end

function S:OnMainBtnClicked()
  if UIUtils.IsGamepadInput() then
    self:OnBtnClicked()
  end
end

function S:SetHoverVisibility()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Bg_Set:PlayAnimation(self.Bg_Set.Normal)
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Bg_Set.Bg_Hover:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Bg_Set.Bg_Outline:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function S:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:AddHoverContent(self)
  self:OnBtnAreaHover()
end

function S:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Parent.Content.ParentWidget.Parent:RemoveHoverContent(self)
  self:OnBtnAreaUnHover()
end

function S:OnBtnAreaHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.UnHover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.Hover)
end

function S:OnBtnAreaUnHover()
  self.Bg_Set:StopAnimation(self.Bg_Set.Hover)
  self.Bg_Set:PlayAnimation(self.Bg_Set.UnHover)
end

function S:InitOtherKeyText()
  self.Text_Option:SetText(GText(self.CacheInfo.CacheText))
  if self["Set" .. self.CacheName .. "KeyText"] then
    self["Set" .. self.CacheName .. "KeyText"](self)
  else
    local KeyText = self.DefaultValue
    self.Text_Fixed:SetText(GText(KeyText))
    self.Key_Modified:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = GText(KeyText)
        }
      }
    })
    self.Key_State:SetActiveWidgetIndex(0)
  end
end

function S:InitKeyText()
  if self.CurOptionContent == nil then
    return
  end
  self.Text_Option:SetText(self.CurOptionContent.ActionNameText)
  self.Key_Modified:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.CurOptionContent.Key
      }
    }
  })
end

function S:ChangeKeyText(NewKey)
  self:PlayAnimation(self.Enter)
  self.CurOptionContent.Key = NewKey
  local NewKeyText = CommonUtils:GetKeyText(NewKey)
  self.CurOptionContent.KeyText = NewKeyText
  self.Text_Fixed:SetText(NewKeyText)
  self.Key_Modified:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = NewKey}
    }
  })
end

function S:SetReleaseStuckKeyText()
  local KeyText = self.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  if self:HasValidPortal() then
    KeyText = GText("UI_OPTION_ReleaseStuck_Unable")
    self.Button_Area:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Fixed:SetRenderOpacity(0.4)
  end
  self.Text_Fixed:SetText(GText(KeyText))
  self.Key_Modified:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = GText(KeyText)
      }
    }
  })
end

function S:OnReleaseStuckClicked()
  self:PlayAnimation("Enter")
  if not self:HasValidPortal() then
    local Params = {}
    Params.RightCallbackFunction = self.ResetLocation
    Params.LeftCallbackObj = self
    Params.RightCallbackObj = self
    Params.CloseBtnCallbackObj = self
    UIManager(self):ShowCommonPopupUI(100048, Params, self)
  end
end

function S:HasValidPortal()
  local Avatar = GWorld:GetAvatar()
  return Avatar and not Avatar:IsInDungeon()
end

function S:ResetLocation()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  Player.RPCComponent:RequestSetPlayerSafeLoction(Player.Eid)
  self.CurOptionContent.ParentWidget:CloseAllParent()
end

function S:SetCustomerServiceKeyText()
  local KeyText = self.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnCustomerServiceClicked()
  HeroUSDKSubsystem(self):OpenService()
end

function S:SetExchangeCodeKeyText()
  local KeyText = self.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnExchangeCodeClicked()
  local Params = {}
  Params.IsExchangeCode = true
  Params.FirstInit = true
  Params.UseReName = true
  Params.Title = GText("UI_COMMONPOP_TITLE_100127")
  UIManager(self):ShowCommonPopupUI(100133, Params, self.Parent.Content.ParentWidget.Parent)
end

function S:SetTermsOfServiceKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  local LinkInfo = DataMgr.PolicyLink[self.CacheName]
  if IsGlobalPak then
    local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
    if LinkInfo then
      self.Link = LinkInfo["Abroad" .. SystemLanguage] or LinkInfo.ChinaCN
    end
  elseif LinkInfo then
    self.Link = LinkInfo.ChinaCN
  end
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnTermsOfServiceClicked()
  UE4.UKismetSystemLibrary.LaunchURL(self.Link)
end

function S:SetPrivacyPolicyKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  local LinkInfo = DataMgr.PolicyLink[self.CacheName]
  if IsGlobalPak then
    local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
    if LinkInfo then
      self.Link = LinkInfo["Abroad" .. SystemLanguage] or LinkInfo.ChinaCN
    end
  elseif LinkInfo then
    self.Link = LinkInfo.ChinaCN
  end
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnPrivacyPolicyClicked()
  UE4.UKismetSystemLibrary.LaunchURL(self.Link)
end

function S:SetChildPrivacyKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  local LinkInfo = DataMgr.PolicyLink[self.CacheName]
  if IsGlobalPak then
    local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
    if LinkInfo then
      self.Link = LinkInfo["Abroad" .. SystemLanguage] or LinkInfo.ChinaCN
    end
  elseif LinkInfo then
    self.Link = LinkInfo.ChinaCN
  end
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnChildPrivacyClicked()
  UE4.UKismetSystemLibrary.LaunchURL(self.Link)
end

function S:SetThirdPartySDKKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  local LinkInfo = DataMgr.PolicyLink[self.CacheName]
  if IsGlobalPak then
    local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
    if LinkInfo then
      self.Link = LinkInfo["Abroad" .. SystemLanguage] or LinkInfo.ChinaCN
    end
  elseif LinkInfo then
    self.Link = LinkInfo.ChinaCN
  end
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnThirdPartySDKClicked()
  UE4.UKismetSystemLibrary.LaunchURL(self.Link)
end

function S:SetLogOffAccountKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnLogOffAccountClicked()
  HeroUSDKSubsystem(self):AccountCancellation()
end

function S:SetUserCentreKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnUserCentreClicked()
  HeroUSDKSubsystem(self):ShowAccountCenter()
end

function S:SetUserPolicyKeyText()
  local KeyText = self.CacheInfo.DefaultValue
  self.Key_State:SetActiveWidgetIndex(1)
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  local LinkInfo = DataMgr.PolicyLink[self.CacheName]
  if IsGlobalPak then
    local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
    if LinkInfo then
      self.Link = LinkInfo["Abroad" .. SystemLanguage] or LinkInfo.ChinaCN
    end
  elseif LinkInfo then
    self.Link = LinkInfo.ChinaCN
  end
  self.Text_Fixed:SetText(GText(KeyText))
end

function S:OnUserPolicyClicked()
  UE4.UKismetSystemLibrary.LaunchURL(self.Link)
end

function S:OnVoiceResourceClicked()
  if self.Parent and self.Parent.Content and self.Parent.Content.ParentWidget then
    self.Parent.Content.ParentWidget:ShowVoiceResourcePopup()
  end
end

function S:SetVoiceResourceKeyText()
  self.Key_State:SetActiveWidgetIndex(1)
  local KeyText = self.CacheInfo.DefaultValue
  self.Text_Fixed:SetText(GText(KeyText))
end

return S
