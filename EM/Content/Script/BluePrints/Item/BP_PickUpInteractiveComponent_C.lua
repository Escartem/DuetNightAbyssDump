require("UnLua")
local BP_PickUpInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_PickUpInteractiveComponent_C:GetInteractiveName()
  if self.CommonUIConfirmID and self.CommonUIConfirmID > 0 then
    return self.Super.GetInteractiveName(self)
  end
  local ItemId = self:GetOuter():GetItemId()
  local ItemInfo = DataMgr.Drop[ItemId]
  return GText(ItemInfo.DropName)
end

function BP_PickUpInteractiveComponent_C:GetInteractiveIcon(PlayerActor)
  if self.CommonUIConfirmID and self.CommonUIConfirmID > 0 then
    return self.Super.GetInteractiveIcon(self, PlayerActor)
  end
  local ItemId = self:GetOuter():GetItemId()
  local ItemInfo = DataMgr.Drop[ItemId]
  local ImagePath = ItemInfo.Icon
  local ImageResource
  if ImagePath and string.find(ImagePath, "/Game/") == nil then
    ImagePath = "/Game/" .. ImagePath
  end
  return ImagePath, true
end

function BP_PickUpInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  if not self:CheckInteractiveSucc(PlayerActor.Eid) then
    self:InteractiveFailed()
    return
  end
  if self:GetOuter():CanBePickedUp(PlayerActor) then
    self:GetOuter():ClearGuideIconComponent()
    self:GetOuter().ToCharacter = PlayerActor
    self:GetOuter():PickupOnTouch(PlayerActor)
  end
end

function BP_PickUpInteractiveComponent_C:GetRarity()
  if self.CommonUIConfirmID and self.CommonUIConfirmID > 0 then
    return 1
  end
  local ItemId = self:GetOuter():GetItemId()
  local ItemInfo = DataMgr.Drop[ItemId]
  return ItemInfo.Rarity
end

function BP_PickUpInteractiveComponent_C:CanPickUpWithOneClick()
  local ItemId = self:GetOuter():GetItemId()
  local ItemInfo = DataMgr.Drop[ItemId]
  local Res
  if ItemInfo.NotResDrop ~= nil then
    Res = not ItemInfo.NotResDrop
  else
    Res = true
  end
  return Res
end

function BP_PickUpInteractiveComponent_C:GetQuestID()
  local Owner = self:GetOwner()
  if Owner then
    return Owner.QuestChainId
  end
  return nil
end

function BP_PickUpInteractiveComponent_C:GetSpecialQuestID()
  local Owner = self:GetOwner()
  if Owner then
    return Owner.ExtraRegionInfo.SpecialQuestId
  end
  return nil
end

return BP_PickUpInteractiveComponent_C
