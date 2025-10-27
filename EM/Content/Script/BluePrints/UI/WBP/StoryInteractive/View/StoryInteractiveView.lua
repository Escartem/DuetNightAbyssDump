local Common = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveCommon")
local Controller = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveController")
local Model = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveModel")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:InitBaseView(NpcId, EndCallback)
  self.NpcId = NpcId
  self.EndCallback = EndCallback
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  self.TalkCameraManager = TalkContext.TalkCameraManager
  self.TypingText:SetTypingSpeed(0.5)
  self:TryPlayContent()
  self:SetGameInputActionBlocking(true)
  self:SetInputModeEnabled(true)
  self:RefreshView()
end

function M:RefreshView()
  self:PlayAnimation(self.In)
  self:RefreshInteractiveItem()
  self:RefreshNpcName()
  self:TryPlayContent()
  self:BindDelegate(false)
  local BlendInTime = DataMgr.GlobalConstant.StoryInteractiveBlendInTime
  BlendInTime = BlendInTime and BlendInTime.ConstantValue
  Controller:BlendInCamera(BlendInTime or 0.5, function()
    self:BindDelegate(true)
  end)
end

function M:OnUpdateUIStyleByInputTypeChange(InputType, DeviceName)
  self:UpdateKeyImg(InputType == ECommonInputType.Gamepad, DeviceName)
end

function M:RefreshNpcName()
  local NpcData = DataMgr.Npc[self.NpcId]
  local NpcName
  if NpcData then
    NpcName = NpcData.UnitName
  end
  self.NpcNameText:SetText(GText(NpcName))
end

function M:TryPlayContent()
  self.TypingText:Typing("...")
end

function M:RefreshInteractiveItem()
  self.SelectItem = nil
  self.ScrollBox_Interactive:ClearChildren()
  self.InteractiveInfos = Model:GetNpcTalkInteractives(self.NpcId)
  self.InteractiveItems = {}
  local NpcData = DataMgr.Npc[self.NpcId]
  local NpcName
  if NpcData then
    NpcName = NpcData.UnitName
  end
  for Index, InteractiveInfo in ipairs(self.InteractiveInfos) do
    local InteractiveItem = UIManager(self):_CreateWidgetNew("StoryInteractiveItem")
    local ShowName = InteractiveInfo.NpcNodeInteractiveName
    if not ShowName then
      if InteractiveInfo.Type == "TalkNode" then
        local QuestChainId = InteractiveInfo.QuestChainId
        if 0 == QuestChainId or not QuestChainId then
          local SpecialQuest = DataMgr.SpecialQuestConfig[InteractiveInfo.SpecialQuestId]
          QuestChainId = SpecialQuest and SpecialQuest.QuestChainId
        end
        local Quest = DataMgr.QuestChain[QuestChainId]
        ShowName = Quest and ShowName.QuestChainName
        if string.isempty(ShowName) then
          ShowName = Common.TextMap_Gossip
        end
      else
        ShowName = Common.TextMap_Gossip
      end
    end
    local Icon = tostring(self.TalkIcon)
    local QuestChainId = InteractiveInfo.QuestChainId
    local SpecialQuestId = InteractiveInfo.SpecialQuestId
    local DynQuestId = InteractiveInfo.DynQuestId
    if not InteractiveInfo.GuideUIEnable then
      QuestChainId = nil
      SpecialQuestId = nil
    end
    InteractiveItem:InitInteractiveInfo(ShowName, Icon, QuestChainId, SpecialQuestId, DynQuestId, InteractiveInfo.bForbidden, InteractiveInfo.ForbiddenMsg)
    InteractiveItem:BindOnItemSelected(function(Item)
      self:OnItemSelected(Item)
    end)
    local Slot = self.ScrollBox_Interactive:AddChild(InteractiveItem)
    Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
    self.InteractiveItems[InteractiveItem] = Index
    DebugPrint("StoryInteractiveView ShowItem Type ", InteractiveInfo.Type, "ShowName: ", GText(ShowName), "OtherInfo", InteractiveInfo.QuestChainId, InteractiveInfo.SpecialQuestId, InteractiveInfo.TalkTriggerId)
  end
  local InteractiveItem = UIManager(self):_CreateWidgetNew("StoryInteractiveItem")
  InteractiveItem:InitInteractiveInfo(Common.TextMap_Btn_Close, tostring(self.ExitIcon), nil, nil)
  local Slot = self.ScrollBox_Interactive:AddChild(InteractiveItem)
  Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
  self.ExitIteractiveItem = InteractiveItem
  self.ScrollBox_Interactive:ScrollWidgetIntoView(self.ScrollBox_Interactive:GetChildAt(0), true)
  InteractiveItem:BindOnItemSelected(function(Item)
    self:OnItemSelected(Item)
  end)
end

function M:TrySelectItemAt(Index)
  local Item = self.ScrollBox_Interactive:GetChildAt(Index)
  if Item then
    self:OnItemSelected(Item)
  end
end

function M:BindDelegate(bBind)
  self:BindClickItem(bBind)
  self:BindCloseDelegate(bBind)
  self:BindClickDelegate(bBind)
  self:BindUpDownKey(bBind)
end

function M:BindClickDelegate(bBind)
  self:StopListeningForInputAction("StoryInteractiveClick", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("StoryInteractiveClick", EInputEvent.IE_Released)
  if bBind then
    self:ListenForInputAction("StoryInteractiveClick", EInputEvent.IE_Pressed, false, {
      self,
      self.OnTalkClickPressed
    })
    self:ListenForInputAction("StoryInteractiveClick", EInputEvent.IE_Released, false, {
      self,
      self.OnTalkClickReleased
    })
  end
end

function M:BindCloseDelegate(bBind)
  if bBind then
    self.ExitIteractiveItem:BindOnItemClicked(function(ExcludeItem)
      self:OnNormalExit(ExcludeItem)
    end)
  else
    self.ExitIteractiveItem:BindOnItemClicked(nil)
  end
end

function M:BindClickItem(bBind)
  for Item, Index in pairs(self.InteractiveItems) do
    if bBind then
      Item:BindOnItemClicked(function(InteractiveItem)
        self:OnItemClicked(Index, InteractiveItem)
      end)
    else
      Item:BindOnItemClicked(nil)
    end
  end
  self:StopListeningForInputAction("StoryInteractive", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("StoryInteractive", EInputEvent.IE_Released)
  if bBind then
    self:ListenForInputAction("StoryInteractive", EInputEvent.IE_Pressed, true, {
      self,
      self.PressedSelectAction
    })
    self:ListenForInputAction("StoryInteractive", EInputEvent.IE_Released, true, {
      self,
      self.ReleasedSelectAction
    })
  end
end

function M:UpdateKeyImg(IsGamePad, GamepadName)
  local ChildMaxIndex = self.ScrollBox_Interactive:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_Interactive:GetChildAt(i)
    if Child then
      Child:UseGamePadStyle(IsGamePad)
    end
  end
  if IsGamePad then
    if "XBOX" == GamepadName then
      self.Img_Mouse:SetBrushResourceObject(Common.Scroll_Xbox:get())
    else
      self.Img_Mouse:SetBrushResourceObject(Common.Scroll_PS:get())
    end
  else
    self.Img_Mouse:SetBrushResourceObject(Common.Scroll_Mouse:get())
  end
end

function M:BindUpDownKey(bBind)
  self:StopListeningForInputAction("UpSelect", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("DownSelect", EInputEvent.IE_Pressed)
  if not bBind then
    return
  end
  self:ListenForInputAction("UpSelect", EInputEvent.IE_Pressed, true, {
    self,
    self.UpSelectAction
  })
  self:ListenForInputAction("DownSelect", EInputEvent.IE_Pressed, true, {
    self,
    self.DownSelectAction
  })
end

function M:OnUIPanelClicked()
  self.TypingText:ToPageEnd()
end

function M:OnTalkClickPressed()
  self.bClickPressed = true
end

function M:OnTalkClickReleased()
  if self.bClickPressed then
    self:OnUIPanelClicked()
  end
  self.bClickPressed = false
end

function M:OnNormalExit(ExcludeItem)
  if self.EndCallback then
    local EndCallback = self.EndCallback
    self.EndCallback = nil
    EndCallback.Func(EndCallback.Obj)
  end
  self:BindDelegate(false)
  self:PlayAnimation(self.Out)
  self:PlayOptionOut(ExcludeItem)
  local Duration = self.Out:GetEndTime() - self.Out:GetStartTime()
  local BlendOutTime = DataMgr.GlobalConstant.StoryInteractiveBlendOutTime
  BlendOutTime = BlendOutTime and BlendOutTime.ConstantValue or 1
  Duration = math.max(Duration, BlendOutTime)
  Controller:BlendOutCamera(BlendOutTime, function()
  end)
  self:AddTimer(Duration, function()
    self:OnOutFinished()
  end)
end

function M:OnOutFinished()
  self:Close()
end

function M:PlayOptionOut(ExcludeItem)
  local ChildMaxIndex = self.ScrollBox_Interactive:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_Interactive:GetChildAt(i)
    if Child ~= ExcludeItem then
      Child:PlayAnimation(Child.Out)
    end
  end
end

function M:OnItemClicked(Index, Item)
  local InteractiveInfo = self.InteractiveInfos[Index]
  if InteractiveInfo then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    Controller:BlendOutToTalk(0, function()
    end)
    self:Close()
    self:RealClose()
    Controller:DirectStartInteractive(InteractiveInfo, ANpcCharacter.GetNpc(self, self.NpcId), Player, self.EndCallback)
  end
  self:PlayOptionOut(Item)
end

function M:OnItemSelected(Item)
  self.SelectItem = Item
  local bUseGamePad = self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  if bUseGamePad then
    self.ScrollBox_Interactive:ScrollWidgetIntoView(Item, true)
  end
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local CurItem = self.ScrollBox_Interactive:GetChildAt(i)
    if CurItem ~= Item then
      CurItem:SelectEntryItem(false, bUseGamePad)
    end
  end
  Item:SelectEntryItem(true, bUseGamePad)
end

function M:PressedSelectAction()
  self.bPressSelectAction = true
  if self.bPressSelectAction then
    return
  end
  if self.SelectItem then
    self.SelectItem:OnInteractiveItemPressed()
  end
end

function M:ReleasedSelectAction()
  if self.bPressSelectAction and IsValid(self.SelectItem) then
    self.SelectItem:OnInteractiveItemClicked()
  end
  self.bPressSelectAction = false
end

function M:UpSelectAction()
  if 0 == self.ScrollBox_Interactive:GetChildrenCount() then
    return
  end
  if self.MouseWheelTime and self.MouseWheelTime > 0 then
    return
  end
  self.MouseWheelTime = 0.2
  local CurSelect = self.SelectItem
  local Index = self.InteractiveItems[CurSelect]
  if not Index then
    if CurSelect == self.ExitIteractiveItem then
      Index = self.ScrollBox_Interactive:GetChildrenCount() - 1
    else
      Index = 0
    end
  else
    Index = Index - 1
  end
  Index = Index - 1
  Index = math.clamp(Index, 0, self.ScrollBox_Interactive:GetChildrenCount() - 1)
  self.ScrollBox_Interactive:ScrollWidgetIntoView(self.ScrollBox_Interactive:GetChildAt(Index), true)
  self:TrySelectItemAt(Index)
end

function M:DownSelectAction()
  if 0 == self.ScrollBox_Interactive:GetChildrenCount() then
    return
  end
  if self.MouseWheelTime and self.MouseWheelTime > 0 then
    return
  end
  self.MouseWheelTime = 0.2
  local CurSelect = self.SelectItem
  local Index = self.InteractiveItems[CurSelect]
  if not Index then
    if CurSelect == self.ExitIteractiveItem then
      Index = self.ScrollBox_Interactive:GetChildrenCount() - 1
    else
      Index = 0
    end
  else
    Index = Index - 1
  end
  Index = Index + 1
  Index = math.clamp(Index, 0, self.ScrollBox_Interactive:GetChildrenCount() - 1)
  self.ScrollBox_Interactive:ScrollWidgetIntoView(self.ScrollBox_Interactive:GetChildAt(Index), true)
  self:TrySelectItemAt(Index)
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.MouseWheelTime and self.MouseWheelTime > 0 then
    self.MouseWheelTime = self.MouseWheelTime - InDeltaTime
  end
end

function M:SetInputModeEnabled(bIsEnable)
  if self.bInputModeEnabled ~= bIsEnable then
    self.bInputModeEnabled = bIsEnable
    local Subsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if bIsEnable then
      local Params = FGameInputModeParams()
      Params.WidgetToFocus = self
      Params.MouseLockMode = EMouseLockMode.LockOnCapture
      Params.bHideCursorDuringCapture = true
      Params.bShowMouseCursor = true
      Subsystem:EnableInputMode("StoryInteractive", EGameInputMode.GameAndUI, Params)
    else
      Subsystem:DisableInputMode("StoryInteractive")
    end
  end
end

function M:SetGameInputActionBlocking(bShouldBlock)
  UIManager(self):SetUIInputEnable(not bShouldBlock, "StoryInteractive")
end

function M:OnConsumeInputAction()
end

function M:Close()
  self:SetInputModeEnabled(false)
  self:SetGameInputActionBlocking(false)
  Controller:ClearController()
  M.Super.Close(self)
end

return M
