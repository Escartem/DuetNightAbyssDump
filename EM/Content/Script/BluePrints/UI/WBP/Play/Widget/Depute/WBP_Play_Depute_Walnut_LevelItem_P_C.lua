require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.IsPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:Init(DungeonData, DungeonIds, WalnutTypeData, WalnutType, Parent)
  self.Parent = Parent
  if not DungeonData then
    self:PlayAnimation(self.Empty)
    self.bIsFocusable = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Btn_Click:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Btn_Click.bIsFocusable = false
    return
  else
    self:PlayAnimation(self.Normal)
    self.Btn_Click:SetVisibility(ESlateVisibility.Visible)
    self.Btn_Click.bIsFocusable = true
    self.bIsFocusable = true
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.DungeonData = DungeonData
  self.DungeonList = DungeonIds
  self.WalnutTypeData = WalnutTypeData
  self.WalnutType = WalnutType
  if self.DungeonData then
    self.Text_Title:SetText(GText(self.DungeonData.DungeonName))
    if self.DungeonData.DungeonLevel then
      self.Text_LvNum:SetVisibility(ESlateVisibility.Visible)
      self.Text_LvNum:SetText("Lv." .. self.DungeonData.DungeonLevel)
    else
      self.Text_LvNum:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnHovered()
  if not self.IsPC then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if not self.IsPC then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Click then
    local Item = UIManager(self):GetUIObj("StyleOfPlay")
    Item.IsOpenSelectLevel = false
    local SelectLevel = Item:OpenSubUI("DungeonSelect")
    SelectLevel:SetWalnutType(self.WalnutTypeData)
    SelectLevel:SetWalnutTitleMatColor(self.WalnutType)
    SelectLevel:InitLevelList(self.DungeonList, self.DungeonData.DungeonID, Const.DeputeType.WalnutDepute)
    Item:InitOtherPageTab({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {Type = "Add"},
            GamePadSubKeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "Up",
                Owner = SelectLevel
              },
              {
                Type = "Img",
                ImgShortPath = "Y",
                Owner = SelectLevel
              }
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = SelectLevel.OnReturnKeyDown,
              Owner = SelectLevel
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = SelectLevel
            }
          },
          Desc = GText("UI_BACK")
        }
      },
      OwnerPanel = SelectLevel,
      BackCallback = SelectLevel.OnReturnKeyDown,
      StyleName = "Text",
      TitleName = GText("UI_Dungeon_Tab_WalnutDungeon")
    }, nil, true)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent:UpdatKeyDisplay()
  end
end

return M
