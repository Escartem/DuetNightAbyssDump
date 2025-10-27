require("UnLua")
local WBP_MiniGame_Mima_Num_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_MiniGame_Mima_Num_C:InitInfo(Owner, Index)
  self.Owner = Owner
  self.Index = Index
  self.Text_Num:SetText("")
  self:BindToAnimationFinished(self.RedFlash, {
    self,
    self.HandleErrorPassword
  })
  self:BindToAnimationFinished(self.Click, {
    self,
    self.PlayCursorFlash
  })
end

function WBP_MiniGame_Mima_Num_C:StartInputState()
  self.Line_1:SetVisibility(ESlateVisibility.Visibility)
end

function WBP_MiniGame_Mima_Num_C:CloseInputState()
  self.Line_1:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_MiniGame_Mima_Num_C:SetNum(Num)
  Num = Num or ""
  self.Text_Num:SetText(Num)
  self:PlayCursorFlash()
end

function WBP_MiniGame_Mima_Num_C:PlayCursorFlash()
  self:PlayAnimation(self.CursorFlash, 0, 0)
end

function WBP_MiniGame_Mima_Num_C:UnLock()
  self.Owner.IsLock = false
end

function WBP_MiniGame_Mima_Num_C:HandleErrorPassword()
  self:SetNum()
  self:PlayAnimation(self.Click)
  self:UnLock()
end

function WBP_MiniGame_Mima_Num_C:PlayErrorInputAnimation()
  self:PlayAnimation(self.RedFlash)
end

return WBP_MiniGame_Mima_Num_C
