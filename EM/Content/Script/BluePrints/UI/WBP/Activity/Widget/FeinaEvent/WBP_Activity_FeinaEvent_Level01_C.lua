require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHover)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnHover)
end

function M:OnBtnHover()
  if self.IsActivityOpen then
    self.RootPanel:PlayHoverSpineAnim(self.Index)
    AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_chapter_select_btn_hover", nil, nil)
  end
end

function M:OnBtnUnHover()
  if self.IsActivityOpen then
    self.RootPanel:PlayUnHoverSpineAnim(self.Index)
  end
end

function M:OnBtnClicked()
  if self.IsActivityOpen then
    self.RootPanel:OpenSubUI("ActivityFeinaEventLevelDetail", self.Index)
  else
    local FeinaEventDungeonConfig = DataMgr.FeinaEventDungeon[self.DungeonId[1]]
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, FeinaEventDungeonConfig.LockToast and GText(FeinaEventDungeonConfig.LockToast) or "")
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_chapter_select_btn_click", nil, nil)
end

function M:Destruct()
  self.Btn_Click.OnClicked:Remove(self, self.OnBtnClicked)
end

function M:SettNavigationUI(PreLevel, NextLevel)
  if PreLevel then
    self:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      function()
        return PreLevel.Btn_Click
      end
    })
  end
  if NextLevel then
    self:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      function()
        return NextLevel.Btn_Click
      end
    })
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
