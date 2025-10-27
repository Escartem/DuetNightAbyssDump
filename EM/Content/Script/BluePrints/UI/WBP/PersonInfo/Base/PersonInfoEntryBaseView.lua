require("UnLua")
local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local PersonInfoModel = PersonInfoController:GetModel()
local M = {}
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:Construct()
  self:RefreshBaseInfo()
  local co = coroutine.create(function()
    self.PersonInfoMainPage:ModelViewIni()
  end)
  if self.HideBegin and not self:IsAnimationPlaying(self.Bg_In) then
    self:SetRenderOpacity(0)
  end
  self:AddTimer(self.delta1 or 0.05, function()
    ScreenPrint("\229\188\128\229\167\139\229\138\160\232\189\189\232\167\146\232\137\178")
    if PersonInfoController.CurPage == nil then
      return
    end
    local success, err = coroutine.resume(co)
    if not success then
      local trace = debug.traceback(co, tostring(err), 2)
      ScreenPrint("[LUA_ERROR] Coroutine (model):\n" .. trace)
    end
    self:AddTimer(self.delta2 or 0.1, function()
      ScreenPrint("\229\188\128\229\167\139\229\138\160\232\189\189\229\156\186\230\153\175")
      if PersonInfoController.CurPage == nil then
        return
      end
      local success, err = coroutine.resume(co)
      if not success then
        local trace = debug.traceback(co, tostring(err), 2)
        ScreenPrint("[LUA_ERROR] Coroutine (scene):\n" .. trace)
      end
      self:AddTimer(self.delta3 or 0.1, function()
        if PersonInfoController.CurPage == nil then
          return
        end
        local success, err = coroutine.resume(co)
        if not success then
          local trace = debug.traceback(co, tostring(err), 2)
          ScreenPrint("[LUA_ERROR] Coroutine (camera):\n" .. trace)
        end
      end)
    end)
  end)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "MailMain", nil)
  self:AddTimer(self.StartDelay or 0, function()
    if self.HideBegin then
      self:SetRenderOpacity(1)
    end
    ScreenPrint("\229\188\128\229\167\139\230\146\173\229\138\168\231\148\187")
    self.WBP_Com_BgSwitch:PlayAnimationForward(self.WBP_Com_BgSwitch.In, self.AniSpeed or 1)
    self:PlayInAnim()
  end)
end

function M:Close()
  ScreenPrint("\229\188\128\229\167\139\229\133\179\233\151\173")
  self.Content:ClearChildren()
  self.PersonInfoMainPage:OnClose()
  PersonInfoController:OnClose()
end

function M:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "PersonInfoPageMain", nil)
  self:PlayAnimationForward(self.In)
end

function M:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, "PersonInfoPageMain", {ToEnd = 1})
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self.PersonInfoMainPage:PlayAnimationForward(self.PersonInfoMainPage.Out)
  self:PlayAnimationForward(self.Out)
end

function M:CheckIsCanCloseSelf()
  if self.PersonInfoMainPage.IsEditOpen then
    self.PersonInfoMainPage.IsEditOpen = false
    self.PersonInfoMainPage:PlayAnimation(self.PersonInfoMainPage.Edit_List_Out)
    return false
  end
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function M:CreatePersonInfoMainPage(ConfigData)
  PersonInfoController.MainPage = self
  local PageMain
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    PageMain = UIManager(self):CreateWidget(ConfigData.PCBluePrint)
  else
    PageMain = UIManager(self):CreateWidget(ConfigData.MobileBluePrint or ConfigData.PCBluePrint)
  end
  if nil == PageMain then
    return
  end
  self.Content:AddChildToOverlay(PageMain)
  local ContentOverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(PageMain)
  ContentOverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  ContentOverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  return PageMain
end

return M
