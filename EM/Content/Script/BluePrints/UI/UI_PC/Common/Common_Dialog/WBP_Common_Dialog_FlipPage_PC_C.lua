require("UnLua")
local WBP_Common_Dialog_FlipPage_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_FlipPage_PC_C:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.Btn_Flip_Page_Left:BindEventOnClicked(self, self.OnLeftBtnClicked)
  self.Btn_Flip_Page_Right:BindEventOnClicked(self, self.OnRightBtnClicked)
  self.Btn_Flip_Page_Left:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Flip_Page_Right:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.PageNumber = 3
  self.CurrentPage = 1
  self:BindDialogEvent("ChangeFlipVisible", self.ChangeFlipVisible)
  if Params and Params.PageFlipInfo then
    local PageInfo = Params.PageFlipInfo or {}
    if 1 == PageInfo.PageNumber then
      self.Btn_Flip_Page_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Btn_Flip_Page_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if PageInfo.ClickSound then
      function self.Btn_Flip_Page_Left.SoundFunc()
        AudioManager(self):PlayUISound(self, PageInfo.ClickSound, nil, nil)
      end
      
      function self.Btn_Flip_Page_Right.SoundFunc()
        AudioManager(self):PlayUISound(self, PageInfo.ClickSound, nil, nil)
      end
    end
    self.PageNumber = PageInfo.PageNumber or 3
    self.CurrentPage = PageInfo.CurrentPage or 1
  end
  if Params and Params.IsGacha then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:OnPageSelected(self.CurrentPage, self.CurrentPage)
end

function WBP_Common_Dialog_FlipPage_PC_C:ChangeFlipVisible(Params, IsVisible)
  if Params and Params.NoRecord then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if IsVisible then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Common_Dialog_FlipPage_PC_C:OnLeftBtnClicked()
  if self.CurrentPage <= 1 then
    return
  end
  self:OnPageSelected(self.CurrentPage, self.CurrentPage - 1)
end

function WBP_Common_Dialog_FlipPage_PC_C:OnRightBtnClicked()
  if self.CurrentPage >= self.PageNumber then
    return
  end
  self:OnPageSelected(self.CurrentPage, self.CurrentPage + 1)
end

function WBP_Common_Dialog_FlipPage_PC_C:OnPageSelected(CurrentPage, NewPage)
  self.CurrentPage = NewPage
  self.Btn_Flip_Page_Left:ForbidBtn(self.CurrentPage <= 1)
  self.Btn_Flip_Page_Right:ForbidBtn(self.CurrentPage >= self.PageNumber)
  if 1 == self.PageNumber then
    self.Page:SetText(self.CurrentPage)
  else
    self.Page:SetText(self.CurrentPage .. "/" .. self.PageNumber)
  end
  self:BroadcastDialogEvent("FlipPageChanged", NewPage)
end

return WBP_Common_Dialog_FlipPage_PC_C
