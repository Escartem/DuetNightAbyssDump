require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.ItemUIPathName = "/Game/UI/UI_PC/Story/BP_TalkSelectItemUI.BP_TalkSelectItemUI"
  self.ItemClickedInfo = nil
  self.DelayDestoryCount = 0
  self.MouseWheelTime = 0
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.MouseWheelTime > 0 then
    self.MouseWheelTime = self.MouseWheelTime - InDeltaTime
  end
end

function M:BindItemClicked(InObj, InFunc)
  self.ItemClickedInfo = {}
  self.ItemClickedInfo.Obj = InObj
  self.ItemClickedInfo.Func = InFunc
end

function M:UnBindItemClicked()
  self.ItemClickedInfo = nil
end

function M:OnItemClicked(InItem)
  if self.ItemClickedInfo then
    self.ItemClickedInfo.Func(self.ItemClickedInfo.Obj, InItem)
  end
end

function M:AddItem(InItem)
  local UIManager = UIManager(self)
  local ItemUI = UIManager:CreateWidget(self.ItemUIPathName)
  self.ScrollBox_TalkOptions:AddChild(ItemUI)
  ItemUI:Init(self, InItem)
  self:PostChangeItemNum()
end

function M:SetItemsVisibility(InVisibility)
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    Child:SetVisibility(InVisibility)
  end
end

function M:ClearListItems()
  self.ScrollBox_TalkOptions:ClearChildren()
end

function M:PostChangeItemNum()
  local TalkOptionNum = self.ScrollBox_TalkOptions:GetChildrenCount()
  self:SetKeyMap(0 ~= TalkOptionNum)
  self:UpdateImgMouse()
end

function M:SetKeyMap(IsSet)
  if IsSet then
    self.CurrentSelectItemIdx = 0
    self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx):OnSelectItem()
    self:ListenForInputAction("TalkUpSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.UpSelectAction
    })
    self:ListenForInputAction("TalkDownSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.DownSelectAction
    })
  else
    self.CurrentSelectItemIdx = nil
  end
end

function M:UpdateImgMouse()
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "Mobile" then
    return
  end
  local TalkOptionNum = self.ScrollBox_TalkOptions:GetChildrenCount()
  if TalkOptionNum < 2 then
    self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local SizeY = TalkOptionNum / 2 * 45
    if TalkOptionNum > 6 then
      SizeY = 135
    end
    local CurPosition = self.Img_Mouse.Slot:GetPosition()
    self.Img_Mouse.Slot:SetPosition(FVector2D(CurPosition.X, SizeY))
  end
end

function M:UpSelectAction()
  if self.MouseWheelTime > 0 then
    return
  end
  if self.ScrollBox_TalkOptions:GetChildrenCount() <= 0 then
    return
  end
  DebugPrint("UpSelectAction", self.CurrentSelectItemIdx)
  self.MouseWheelTime = 0.1
  local NewSelectItemIdx = 0
  if self.CurrentSelectItemIdx > 0 then
    NewSelectItemIdx = self.CurrentSelectItemIdx - 1
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
  end
  self:SelectNewItem(NewSelectItemIdx)
end

function M:SelectNewItem(NewItemIdx)
  if self.CurrentSelectItemIdx == NewItemIdx then
    return
  end
  self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx):OnUnselectItem()
  self.ScrollBox_TalkOptions:GetChildAt(NewItemIdx):OnSelectItem()
  self.CurrentSelectItemIdx = NewItemIdx
  self.ScrollBox_TalkOptions:ScrollWidgetIntoView(self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx), true)
end

function M:GetItemIndex(Item)
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    if Child == Item then
      return i
    end
  end
  return -1
end

function M:DownSelectAction()
  if self.MouseWheelTime > 0 then
    return
  end
  if self.ScrollBox_TalkOptions:GetChildrenCount() <= 0 then
    return
  end
  DebugPrint("DownSelectAction", self.CurrentSelectItemIdx)
  self.MouseWheelTime = 0.1
  local NewSelectItemIdx = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  if self.CurrentSelectItemIdx < self.ScrollBox_TalkOptions:GetChildrenCount() - 1 then
    NewSelectItemIdx = self.CurrentSelectItemIdx + 1
  end
  if NewSelectItemIdx ~= self.CurrentSelectItemIdx then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
    self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx):OnUnselectItem()
    self.ScrollBox_TalkOptions:GetChildAt(NewSelectItemIdx):OnSelectItem()
    self.CurrentSelectItemIdx = NewSelectItemIdx
  end
  self.ScrollBox_TalkOptions:ScrollWidgetIntoView(self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx), true)
end

return M
