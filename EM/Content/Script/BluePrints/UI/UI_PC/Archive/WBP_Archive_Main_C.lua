require("UnLua")
local WBP_Archive_Main_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Archive_Main_C:Construct()
  self.Super.Construct(self)
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:PlayAnimation(self.Loop)
    end
  })
  self:BindToAnimationFinished(self.Loop, {
    self,
    function()
      self:PlayAnimation(self.Loop)
    end
  })
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.EntryList = {
    self.Entry_Character,
    self.Entry_Ranged,
    self.Entry_Melee,
    self.Entry_Book,
    self.Entry_Item,
    self.Entry_Enemy
  }
  self.Name2ArchiveType = {
    Character = 1001,
    Melee = 1002,
    Ranged = 1003,
    Resource = 1004,
    Read = 1005,
    Enemy = 1006
  }
  self:Init()
  self:PlayInAnim()
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ArchiveMain")
  end
end

function WBP_Archive_Main_C:Destruct()
  self.Super.Destruct(self)
  self:ClearListenEvent()
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(true, "ArchiveMain")
  end
end

function WBP_Archive_Main_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function WBP_Archive_Main_C:Init()
  self:InitTable()
  self:InitBtn()
  self.Collect:Init(self)
  self.Text_Explain:SetText(GText("UI_Archive_SpecialItemDes"))
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_Main_C:InitTable()
  self.TabConfigData = {
    TitleName = GText("UI_MainTitle_Archive"),
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnClickBack,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClickBack,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Com_Tab:Init(self.TabConfigData)
end

function WBP_Archive_Main_C:InitBtn()
  self.Entry_Character:Init("Character", self.Name2ArchiveType.Character)
  self.Entry_Ranged:Init("Ranged", self.Name2ArchiveType.Ranged)
  self.Entry_Melee:Init("Melee", self.Name2ArchiveType.Melee)
  self.Entry_Book:Init("Read", self.Name2ArchiveType.Read)
  self.Entry_Item:Init("Resource", self.Name2ArchiveType.Resource)
  self.Entry_Enemy:Init("Enemy", self.Name2ArchiveType.Enemy)
end

function WBP_Archive_Main_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonTop then
      IsEventHandled = true
      self:ClickRewardBtn()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_Main_C:OnReturnKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:OnClickBack()
end

function WBP_Archive_Main_C:OnClickBack()
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

function WBP_Archive_Main_C:Close()
  self.Super.Close(self)
end

function WBP_Archive_Main_C:ClickRewardBtn()
  self.Collect:ClickRewardBtn()
end

function WBP_Archive_Main_C:Tick(MyGeometry, InDeltaTime)
  if self:HasUserFocus(self:GetOwningPlayer()) or self:HasUserFocusedDescendants(self:GetOwningPlayer()) then
    self.Overridden.Tick(self, MyGeometry, InDeltaTime)
    self:GetMouseLocal()
    self:GetSelectImage()
  end
end

function WBP_Archive_Main_C:GetMouseLocal()
  if self.DeviceInPc then
    self.RealMousePos = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  end
end

function WBP_Archive_Main_C:GetSelectImage()
  if self.RealMousePos == false then
    return
  end
  for i, Entry in pairs(self.EntryList) do
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Entry.Btn_Click)
    local BtnSize = Slot:GetSize()
    local Pos = FVector2D(0, 0)
    UE4.USlateBlueprintLibrary.LocalToViewport(self, Entry.Btn_Click:GetCachedGeometry(), FVector2D(0, 0), nil, Pos)
    local Rate = (self.RealMousePos - Pos) / BtnSize
    local Alpha = Entry.Btn_Click:GetMousePosAlpha(Rate)
    if Alpha > 0 then
      self:OnHoveredEntry(i)
      return
    end
  end
  self:HideHover()
end

function WBP_Archive_Main_C:HideHover()
  if self.SelectBtnIdx then
    self.EntryList[self.SelectBtnIdx]:HideHover()
    self.SelectBtnIdx = nil
  end
end

function WBP_Archive_Main_C:OnHoveredEntry(Index)
  if self.SelectBtnIdx == Index then
    return
  end
  self:HideHover()
  self.EntryList[Index]:OnHoveredEntry()
  self.SelectBtnIdx = Index
end

function WBP_Archive_Main_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_Main_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_Main_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_Main_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_Main_C:InitGamepadView()
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Collect:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if UIUtils.HasAnyFocus(self) then
    self.Entry_Character.Btn_Click:SetFocus()
  end
end

function WBP_Archive_Main_C:InitKeyboardView()
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Collect:SetVisibility(UIConst.VisibilityOp.Visible)
end

function WBP_Archive_Main_C:InitWidgetInfoInGamePad()
  if self.Key_Reward then
    self.Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      }
    })
  end
end

function WBP_Archive_Main_C:BP_GetDesiredFocusTarget()
  return self.Entry_Character.Btn_Click
end

function WBP_Archive_Main_C:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ArchiveMainOpenSound", nil)
  self:PlayAnimationForward(self.In)
end

function WBP_Archive_Main_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "ArchiveMainOpenSound", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_Archive_Main_C:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

return WBP_Archive_Main_C
