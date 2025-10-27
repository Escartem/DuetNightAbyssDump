require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Buff_Item_3 = self.Buff_Weapon
  self.Avatar = GWorld:GetAvatar()
end

function M:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.Parent = Params.Parent
  local FirstSelectedIndex = Params.Index
  self:Init(FirstSelectedIndex)
end

function M:InitBuffItem()
  self.Buffs = {}
  for i = 1, 3 do
    local ClickEvent = {
      Obj = self,
      Func = self.SelectBuffItem,
      Params = {
        self["Buff_Item_" .. i]
      }
    }
    if 3 == i then
      self["Buff_Item_" .. i]:Init(ClickEvent, false, "Weapon", true, i)
    else
      self["Buff_Item_" .. i]:Init(ClickEvent, false, "Normal", true, i)
    end
    if self.Avatar.PaotaiBuffs then
      self.Buffs[i] = self.Avatar.PaotaiBuffs[i]
    end
  end
  self:RefreshBuffItem()
end

function M:RefreshBuffItem()
  if self.Buffs then
    for i = 1, 3 do
      self["Buff_Item_" .. i]:InitBuffInfo(self.Buffs[i])
    end
  end
end

function M:Init(FirstSelectedIndex)
  self:InitBuffItem()
  self["Buff_Item_" .. FirstSelectedIndex]:OnBtnClicked()
  self.Btn_Save:UnBindEventOnClickedByObj(self)
  self.Btn_Save:BindEventOnClicked(self, self.SaveBuffs)
  self.Btn_Save:SetText(GText("UI_RegionMap_Save"))
end

function M:SelectBuffItem(Item)
  if Item then
    if Item.IsUnlock then
      self.LastBuffType = self.CurBuffType
      if IsValid(self.CurSelectItem) then
        self.CurSelectItem:SetSelected(false)
      end
      self.CurSelectItem = Item
      self.CurBuffType = self.CurSelectItem.Type
      self.CurSelectItem:SetSelected(true)
      if self.LastBuffType ~= self.CurBuffType then
        self:RefreshListInfo()
      else
        self:SetListItemCanCancelSelection()
        self:SetCurSelectContent()
      end
    elseif Item.Type == "Weapon" then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("PaotaiGame_PropLock_2"))
    elseif Item.Type == "Normal" then
    end
  end
end

function M:RefreshListInfo()
  self.CurSelectContent = nil
  self.List_Buff:ClearListItems()
  local BuffInfo
  if self.CurBuffType == "Weapon" then
    BuffInfo = DataMgr.PaotaiGameWeapon
  else
    BuffInfo = DataMgr.PaotaiGameProp
  end
  if BuffInfo then
    local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
    for _, Info in pairs(BuffInfo) do
      local Content = NewObject(UE4.LoadClass(ClassPath))
      Content.ClickEvent = {
        Obj = self,
        Func = self.ClickBuffListItem,
        Params = {Content}
      }
      Content.Id = Info.Id
      Content.BuffId = Info.BuffId
      Content.Parent = self
      Content.Icon = Info.PropIcon or Info.WeaponIcon
      Content.Name = Info.PropName or Info.WeaponName
      Content.Des = Info.PropDes or Info.WeaponDes
      Content.LockDes = Info.PropLockDes or Info.DungeonLockDes
      Content.Type = self.CurBuffType
      Content.CanCancelSelection = self:CheckCanCancelSelection(Content.BuffId)
      Content.IsSelect = self:CheckIsSelected(Content.BuffId)
      self.List_Buff:AddItem(Content)
      if Content.BuffId == self.CurSelectItem.BuffId then
        self.CurSelectContent = Content
      end
    end
  end
end

function M:CheckIsSelected(BuffId)
  for Index, Id in pairs(self.Buffs) do
    if BuffId == Id then
      return Index
    end
  end
  return false
end

function M:ClickBuffListItem(Content)
  if Content then
    if not Content.IsUnlock then
      return
    end
    if Content.IsSelect then
      self:RemoveBuff(Content.BuffId)
      self.CurSelectContent = nil
      Content.Entry:SetSelectedByClick(false)
    else
      self:AddBuff(Content.BuffId)
      if IsValid(self.CurSelectContent) then
        if self.CurSelectContent.Entry then
          self.CurSelectContent.Entry:SetSelected(false)
        else
          self.CurSelectContent.IsSelect = false
        end
      end
      self.CurSelectContent = Content
      self.CurSelectContent.Entry:SetSelectedByClick(true)
    end
  end
end

function M:RemoveBuff(BuffId)
  local Index = self.CurSelectItem.Index
  self.Buffs[Index] = nil
  self.CurSelectItem:InitBuffInfo()
end

function M:AddBuff(BuffId)
  local Index = self.CurSelectItem.Index
  self.Buffs[Index] = BuffId
  self.CurSelectItem:InitBuffInfo(BuffId)
end

function M:SetListItemCanCancelSelection()
  local Contents = self.List_Buff:GetListItems()
  for _, Content in pairs(Contents) do
    Content.CanCancelSelection = self:CheckCanCancelSelection(Content.BuffId)
  end
  local AllDisplayWidget = self.List_Buff:GetDisplayedEntryWidgets()
  for _, Widget in pairs(AllDisplayWidget) do
    Widget:SetCanCancelSelection(Widget.Content.CanCancelSelection)
  end
end

function M:CheckCanCancelSelection(Id)
  if self.CurSelectItem.BuffId == Id then
    return true
  elseif self:CheckIsSelected(Id) then
    return false
  else
    return true
  end
end

function M:SetCurSelectContent()
  self.CurSelectContent = nil
  local Contents = self.List_Buff:GetListItems()
  for _, Content in pairs(Contents) do
    if Content.BuffId == self.CurSelectItem.BuffId then
      self.CurSelectContent = Content
    end
  end
end

function M:SaveBuffs()
  local function Callback()
    if self.Parent and self.Parent.RefreshBuffItem then
      self.Parent:RefreshBuffItem()
    end
    if IsValid(self.Owner) then
      self.Owner:OnCloseBtnClicked()
    end
  end
  
  local Buffs = CommonUtils.DeepCopy(self.Buffs)
  if not Buffs[1] and Buffs[2] then
    Buffs[1] = Buffs[2]
    Buffs[2] = nil
  end
  self.Avatar:PaotaiUpdateBuffs(Buffs, Callback)
end

return M
