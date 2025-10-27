require("UnLua")
local M = Class({
  "Blueprints.UI.BP_UIState_C"
})

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "MailMain", nil)
  if self.Platform == "PC" then
    local BottomKeyInfo = {}
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    })
    self.Common_Tab:Init({
      DynamicNode = {"Back", "BottomKey"},
      LeftKey = "NotShow",
      RightKey = "NotShow",
      TitleName = GText("MAIN_UI_MAIL"),
      BottomKeyInfo = BottomKeyInfo,
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnPressESC
    })
  else
    self.Common_Tab:Init({
      DynamicNode = {"Back"},
      TitleName = GText("MAIN_UI_MAIL"),
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnPressESC
    })
  end
  self.WBP_Mail_Root:Init(self)
  self:PlayInAnim()
end

function M:RefreshTabBottomKey()
  if UIUtils.IsMobileInput() then
    return
  end
  if self.Common_Tab and self.Common_Tab.UpdateBottomKeyInfo then
    local BottomKeyInfo = {}
    if self.WBP_Mail_Root:CheckHaveRewardToReceiveAll() then
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.OnPressSPACE,
            Owner = self
          }
        },
        Desc = GText("UI_Mail_Recieveall")
      })
    end
    if UIUtils.CheckScrollBoxCanScroll(self.WBP_Mail_Root.ScrollBox_TaskDetail) then
      table.insert(BottomKeyInfo, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Slide"),
        bLongPress = false
      })
    end
    if self.WBP_Mail_Root.GamePadState == "Hyperlink" then
      BottomKeyInfo = {}
      table.insert(BottomKeyInfo, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Go"),
        bLongPress = false
      })
    end
    if self.WBP_Mail_Root.GamePadState == "ListReward" then
      BottomKeyInfo = {}
      table.insert(BottomKeyInfo, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Select"),
        bLongPress = false
      })
    end
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    })
    self.Common_Tab:UpdateBottomKeyInfo(BottomKeyInfo)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  self.WBP_Mail_Root:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  self.WBP_Mail_Root:OnMailRootPreviewKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  self.WBP_Mail_Root:OnMailRootKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnPressESC()
  self:PlayOutAnim()
end

function M:OnPressSPACE()
  self.WBP_Mail_Root:OnPressSPACE()
end

function M:PlayInAnim()
  self:BlockAllUIInput(true)
  self:PlayAnimation(self.In)
  
  local function PlayAnimFinished()
    self:BlockAllUIInput(false)
    self.WBP_Mail_Root:UpdateFocusState("ListMail")
  end
  
  self:BindToAnimationFinished(self.In, {self, PlayAnimFinished})
end

function M:PlayOutAnim()
  self:PlayAnimation(self.Out)
  self:BlockAllUIInput(true)
  self.WBP_Mail_Root:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, "MailMain", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.CloseSelf
  })
end

function M:CloseSelf()
  self:BlockAllUIInput(false)
  self.WBP_Mail_Root:RemoveReddotListen()
  self:Close()
end

return M
