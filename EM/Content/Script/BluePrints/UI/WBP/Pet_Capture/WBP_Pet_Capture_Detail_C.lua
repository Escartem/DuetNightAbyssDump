require("UnLua")
local WBP_Pet_Capture_Detail_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Pet_Capture_Detail_C:Initialize(Initializer)
end

function WBP_Pet_Capture_Detail_C:Construct()
  self.Text_Color:SetText(GText("UI_Pet_CaptureSucRateColor"))
  self.Text_Probability:SetText(GText("UI_Pet_CaptureSucRate"))
  self.DetailItem = {
    {
      0.947307,
      0.165132,
      0.144128,
      100
    },
    {
      0.947307,
      0.401978,
      0.174647,
      80
    },
    {
      0.982251,
      0.947307,
      0.238398,
      60
    },
    {
      0.341915,
      0.775822,
      0.287441,
      40
    },
    {
      0.274677,
      0.571125,
      0.887923,
      20
    },
    {
      0.187821,
      0.318547,
      0.715694,
      1
    }
  }
  self:InitCaptureDetailItem()
end

function WBP_Pet_Capture_Detail_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:PlayAnimation(self.In)
  self:SetFocus()
end

function WBP_Pet_Capture_Detail_C:InitCaptureDetailItem()
  local ClassPath = "/Game/UI/WBP/Pet_Capture/Widget/Pet_Capture_DetailItemContent.Pet_Capture_DetailItemContent_C"
  local CaptureItemClass = UE4.LoadClass(ClassPath)
  for i = 1, #self.DetailItem do
    local ItemContent = self.DetailItem[i]
    local Obj = NewObject(CaptureItemClass)
    Obj.Color = {
      ItemContent[1],
      ItemContent[2],
      ItemContent[3]
    }
    Obj.Percent = ItemContent[4]
    self.List_Item:AddItem(Obj)
  end
end

function WBP_Pet_Capture_Detail_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_Pet_Capture_Detail_C:Close()
  self.List_Item:ClearListItems()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local PetCapture = UIManager:GetUIObj("PetCapture")
  if PetCapture then
    PetCapture:SetFocus()
  end
  self.Super.Close(self)
end

function WBP_Pet_Capture_Detail_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:PlayOutAnim()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return WBP_Pet_Capture_Detail_C
