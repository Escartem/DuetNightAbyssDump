require("UnLua")
local WBP_Com_PageTurner_PC = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_Com_PageTurner_PC:InitPageTurner(GuideMessageNum, UserWidget, HandleIndexFunc, BeginIndex)
  self.StartPageIndex = 1
  self.EndPageIndex = GuideMessageNum
  self.PrePageIndex = BeginIndex or 1
  self.CurrentPageIndex = BeginIndex or 1
  self.UserWidget = UserWidget
  self.Callback = HandleIndexFunc
  self:InitPagePoint()
end

function WBP_Com_PageTurner_PC:SwtichPagePointAnimation(CurrentPageIndex)
  self.PrePageIndex = self.CurrentPageIndex
  self.CurrentPageIndex = CurrentPageIndex
  local PagePoint = self.Root:GetChildAt(self.PrePageIndex - 1)
  if not PagePoint then
    Utils.ScreenPrintScreenPirnt("\231\191\187\233\161\181\229\153\168\231\180\162\229\188\149\232\142\183\229\143\150PagePoint\229\188\130\229\184\184\239\188\140\229\187\186\232\174\174\230\163\128\230\159\165\228\184\139\230\150\185\230\179\149InitPageTurner\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176GuideMessageNum\239\188\140\230\136\150\232\128\133\230\163\128\230\159\165\228\184\139\232\176\131\231\148\168\231\187\132\228\187\182\230\152\190\231\164\186\228\191\161\230\129\175\231\154\132Excel\233\133\141\231\189\174\232\161\168")
    return
  end
  PagePoint:StopAllAnimations()
  PagePoint:PlayAnimation(PagePoint.Normal)
  PagePoint = self.Root:GetChildAt(self.CurrentPageIndex - 1)
  if not PagePoint then
    Utils.ScreenPrintScreenPirnt("\231\191\187\233\161\181\229\153\168\231\180\162\229\188\149\232\142\183\229\143\150PagePoint\229\188\130\229\184\184\239\188\140\229\187\186\232\174\174\230\163\128\230\159\165\228\184\139\230\150\185\230\179\149InitPageTurner\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176GuideMessageNum\239\188\140\230\136\150\232\128\133\230\163\128\230\159\165\228\184\139\232\176\131\231\148\168\231\187\132\228\187\182\230\152\190\231\164\186\228\191\161\230\129\175\231\154\132Excel\233\133\141\231\189\174\232\161\168")
    return
  end
  PagePoint:StopAllAnimations()
  PagePoint:PlayAnimation(PagePoint.Click, 0, 1, 0, 1, true)
end

function WBP_Com_PageTurner_PC:PageLeft(IsNeedLoop)
  local CurrentPageIndex = 1
  if IsNeedLoop then
    CurrentPageIndex = (self.CurrentPageIndex - 1 > 1 or 1 == self.CurrentPageIndex - 1) and self.CurrentPageIndex - 1 or self.EndPageIndex
  else
    CurrentPageIndex = self.CurrentPageIndex - 1 > 1 and self.CurrentPageIndex - 1 or 1
  end
  self:SwtichPagePointAnimation(CurrentPageIndex)
  self.Callback(self.UserWidget, self.CurrentPageIndex, true)
end

function WBP_Com_PageTurner_PC:PageRight(IsNeedLoop)
  local CurrentPageIndex = 1
  if IsNeedLoop then
    CurrentPageIndex = (self.CurrentPageIndex + 1 < self.EndPageIndex or self.CurrentPageIndex + 1 == self.EndPageIndex) and self.CurrentPageIndex + 1 or 1
  else
    CurrentPageIndex = self.CurrentPageIndex + 1 < self.EndPageIndex and self.CurrentPageIndex + 1 or self.EndPageIndex
  end
  self:SwtichPagePointAnimation(CurrentPageIndex)
  self.Callback(self.UserWidget, self.CurrentPageIndex)
end

function WBP_Com_PageTurner_PC:PageStart()
  self:SwtichPagePointAnimation(self.StartPageIndex)
  self.Callback(self.UserWidget, self.CurrentPageIndex)
end

function WBP_Com_PageTurner_PC:PageEnd()
  self:SwtichPagePointAnimation(self.EndPageIndex)
  self.Callback(self.UserWidget, self.CurrentPageIndex)
end

function WBP_Com_PageTurner_PC:CheckCurDeviceIsPC()
  return CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
end

function WBP_Com_PageTurner_PC:HandleClickPointIndex(PagePoint)
  local index = self.Root:GetChildIndex(PagePoint)
  self:SwtichPagePointAnimation(index + 1)
  self.Callback(self.UserWidget, self.CurrentPageIndex)
end

function WBP_Com_PageTurner_PC:CheckIsCurrentPage(PagePoint)
  return self.Root:GetChildIndex(PagePoint) + 1 == self.CurrentPageIndex
end

function WBP_Com_PageTurner_PC:OnPagePointClicked(PagePoint)
  if not self:CheckCurDeviceIsPC() then
    return
  end
  if not self:CheckIsCurrentPage(PagePoint) then
    self:HandleClickPointIndex(PagePoint)
  end
end

function WBP_Com_PageTurner_PC:OnPagePointPressed(PagePoint)
  if not self:CheckCurDeviceIsPC() then
    return
  end
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  if not self:CheckIsCurrentPage(PagePoint) then
    PagePoint:PlayAnimation(PagePoint.Press)
  end
end

function WBP_Com_PageTurner_PC:OnPagePointHovered(PagePoint)
  if not self:CheckCurDeviceIsPC() then
    return
  end
  if not self:CheckIsCurrentPage(PagePoint) then
    PagePoint:PlayAnimation(PagePoint.Hover)
  end
end

function WBP_Com_PageTurner_PC:OnPagePointUnhovered(PagePoint)
  if not self:CheckCurDeviceIsPC() then
    return
  end
  if not self:CheckIsCurrentPage(PagePoint) then
    PagePoint:PlayAnimation(PagePoint.UnHover)
  end
end

function WBP_Com_PageTurner_PC:InitPagePoint()
  self.Root:ClearChildren()
  for i = 1, self.EndPageIndex do
    local NowPoint = UIManager(self):_CreateWidgetNew("PagePoint")
    if not NowPoint then
      Utils.ScreenPrintScreenPirnt("\231\191\187\233\161\181\231\130\185\229\136\155\229\187\186\229\188\130\229\184\184\239\188\140\232\175\183\230\163\128\230\159\165WidgetUI\233\133\141\231\189\174\232\161\168\228\184\173\231\154\132PagePoint\231\154\132\233\133\141\231\189\174\228\191\161\230\129\175\230\152\175\229\144\166\230\173\163\231\161\174")
      return
    end
    NowPoint.Button_Area.OnClicked:Add(self, function()
      self:OnPagePointClicked(NowPoint)
    end)
    NowPoint.Button_Area.OnPressed:Add(self, function()
      self:OnPagePointPressed(NowPoint)
    end)
    NowPoint.Button_Area.OnHovered:Add(self, function()
      self:OnPagePointHovered(NowPoint)
    end)
    NowPoint.Button_Area.OnUnhovered:Add(self, function()
      self:OnPagePointUnhovered(NowPoint)
    end)
    self.Root:AddChildToWrapBox(NowPoint)
    NowPoint:PlayAnimation(NowPoint.Normal)
  end
  local CurPoint = self.Root:GetChildAt(self.CurrentPageIndex - 1)
  if not CurPoint then
    Utils.ScreenPrint("\231\191\187\233\161\181\229\153\168\231\180\162\229\188\149\232\142\183\229\143\150PagePoint\229\188\130\229\184\184\239\188\140\229\187\186\232\174\174\230\163\128\230\159\165\228\184\139\230\150\185\230\179\149InitPageTurner\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176GuideMessageNum\239\188\140\230\136\150\232\128\133\230\163\128\230\159\165\228\184\139\232\176\131\231\148\168\231\187\132\228\187\182\230\152\190\231\164\186\228\191\161\230\129\175\231\154\132Excel\233\133\141\231\189\174\232\161\168")
    return
  end
  self:AddDelayFrameFunc(function()
    CurPoint:PlayAnimation(CurPoint.Click)
  end, 3, "DelayClick")
end

function WBP_Com_PageTurner_PC:ReBindClickEvent(PageIndex, Func)
  if not Func then
    return
  end
  local Point = self.Root:GetChildAt(PageIndex - 1)
  if not Point then
    return
  end
  Point.Button_Area.OnClicked:Clear()
  Point.Button_Area.OnClicked:Add(self, Func)
end

return WBP_Com_PageTurner_PC
