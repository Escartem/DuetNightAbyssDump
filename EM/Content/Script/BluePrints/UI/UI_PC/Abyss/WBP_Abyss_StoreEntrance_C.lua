require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
end

function M:SetText(Text)
  self.Text_Store:SetText(Text)
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  if self.Obj and self.Func then
    if self.Params then
      self.Func(self.Obj, table.unpack(self.Params))
    else
      self.Func(self.Obj)
    end
  end
end

return M
