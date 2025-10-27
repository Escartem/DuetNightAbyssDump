require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  if self.bShowing then
    return
  end
  self:CleanUp()
end

function M:Destruct()
  self:StopAllAnimations()
  self:CleanTimer()
  self:CleanUp()
end

function M:CleanUp()
  self.ItemId = nil
  self.ItemCount = nil
  self.Duration = -1
  self.bShowing = false
  self:StopListeningForAllInputActions()
  if self.Parent and self.Parent.ListView_Box then
    self.Parent.ListView_Box:RemoveItem(self.Content)
    self.Parent.ListView_Box:RequestRefresh()
  else
    DebugPrint("ZDX_\230\142\137\232\144\189\231\137\169UI\230\156\170\233\148\128\230\175\129\230\136\144\229\138\159")
  end
end

function M:OnListItemObjectSet(Content)
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.Content = Content
  self.ItemId = Content.ItemId
  self.ItemCount = Content.ItemCount
  self.Duration = Content.Duration
  self.TableName = Content.TableName
  self.Content.SelfWidget = self
  self.Parent = self.Content.Parent
  self.Content.Parent.UsingItemList[self] = 1
  self.Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.SizeBox_0)
  self.Slot:SetPadding(FMargin(0))
  self:UpdateTips(self.ItemId, self.ItemCount, self.Duration, self.TableName)
end

function M:UpdateTips(ItemId, ItemCount, Duration, TableName)
  self.bShowing = true
  self.OrdinaryMoveTime = -1
  Duration = Duration or 2.5
  ItemCount = ItemCount or 1
  self.bNotCallAnimationDel = true
  self:StopAllAnimations()
  self.bNotCallAnimationDel = false
  local ItemInfo = DataMgr[TableName][ItemId]
  assert(ItemInfo, "\230\142\137\232\144\189\231\137\169\228\184\141\229\173\152\229\156\168\239\188\154" .. TableName .. ItemId)
  self.ICON:SetVisibility(ESlateVisibility.Collapsed)
  local DisName = ItemUtils:GetDropName(ItemId, TableName) .. string.format(" \195\151%d", ItemCount)
  self.Text_Reward:SetText(DisName)
  local ImagePath = ItemInfo.Icon
  if string.find(ImagePath, "/Game/") == nil then
    ImagePath = "/Game/" .. ImagePath
  end
  self.CurrentIconPath = ImagePath
  self.LoadResourceID = nil
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, ImagePath, {
    self,
    M.OnIconLoadFinish
  })
  if Handle then
    self.LoadResourceID = Handle.ResourceID
  end
  self.Duration = Duration
end

function M:AddItemCount(AddItemCount, Duration)
  Duration = Duration or 2.5
  AddItemCount = AddItemCount or 1
  self.Content.ItemCount = self.Content.ItemCount + AddItemCount
  local DisName = ItemUtils:GetDropName(self.Content.ItemId, self.Content.TableName) .. string.format(" \195\151%d", self.Content.ItemCount)
  self.Text_Reward:SetText(DisName)
  self.Content.Duration = Duration
  self:AddTimer(self.Content.Duration, function()
    self:PlayOutAnimation()
  end, false, 0, "PlayOutAnim", true)
end

function M:OnIconLoadFinish(Object, ResourceID)
  if not (Object and IsValid(self)) or self.LoadResourceID ~= ResourceID then
    DebugPrint("ZDX_\230\142\137\232\144\189\231\137\169UIIcon\229\138\160\232\189\189\229\164\177\232\180\165")
    self:CloseSelf()
    return
  end
  if self.ICON then
    self.ICON:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ICON:SetBrushResourceObject(Object)
    self:PlayAnimation(self["in"])
    AudioManager(self):PlayItemSound(self, self.ItemId, "Pick", self.TableName)
  end
end

function M:PlayOutAnimation()
  self:PlayAnimation(self.out, 0, 1, 0, 1, true)
  self.OrdinaryMoveTime = 0
  self:AddTimer(0.23, function()
    self.OrdinaryMoveTime = -1
    self:CloseSelf()
  end, false, 0, "CloseSelf", true)
end

function M:OnAnimationFinished(InAnimation)
  if self.bNotCallAnimationDel then
    return
  end
  if InAnimation == self["in"] then
    self:AddTimer(self.Duration, function()
      self:PlayOutAnimation()
    end, false, 0, "PlayOutAnim", true)
  end
end

function M:CloseSelf()
  self:CleanUp()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  local DropItemsUI
  if BattleMain and BattleMain.Pos_Drops then
    DropItemsUI = BattleMain.Pos_Drops:GetChildAt(0)
  end
  if DropItemsUI and DropItemsUI.OnTipsItemClose then
    DropItemsUI:OnTipsItemClose(self.Content)
  end
end

return M
