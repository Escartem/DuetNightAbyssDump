local UID_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function UID_C:Construct()
  self:SetUid()
end

function UID_C:SetUid(InUid)
  if InUid then
    self.Num_UID:SetText(tostring(InUid))
  else
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      self.Num_UID:SetText("")
      return
    end
    self.Num_UID:SetText(tostring(Avatar.Uid))
  end
end

function UID_C:HideUid()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function UID_C:ShowUid()
  self:SetVisibility(UE4.ESlateVisibility.Visible)
end

return UID_C
