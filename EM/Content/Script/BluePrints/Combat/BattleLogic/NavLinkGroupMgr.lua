local Component = {}

function Component:Initialize(Initializer)
  self.NavLinkToLinkGroupIndex = {}
  self.NavLinkGroupList = {}
end

function Component:RegisterLink(LinkToRegister, LinkToFollow)
  local Index = self.NavLinkToLinkGroupIndex[LinkToFollow]
  local NavLinkList
  if not Index then
    Index = #self.NavLinkGroupList + 1
    self.NavLinkGroupList[Index] = {}
    self.NavLinkToLinkGroupIndex[LinkToFollow] = Index
  end
  NavLinkList = self.NavLinkGroupList[Index]
  NavLinkList[#NavLinkList + 1] = LinkToRegister
end

function Component:FindAndOccupyLink(LinkGroupLeader)
  local Index = self.NavLinkToLinkGroupIndex[LinkGroupLeader]
  if not Index then
    return nil
  end
  local NavLinkList = self.NavLinkGroupList[Index]
  if not NavLinkList then
    return nil
  end
  for _, Link in ipairs(NavLinkList) do
    if not Link:IsLinkOccupied() then
      return Link
    end
  end
  return nil
end

function Component:UnregisterLink(LinkToUnregister)
  local Index = self.NavLinkToLinkGroupIndex[LinkToUnregister]
  local NavLinkList
  if not Index then
    return
  end
  self.NavLinkToLinkGroupIndex[LinkToUnregister] = nil
  self.NavLinkGroupList[Index] = nil
end

function Component:SetNavLinkState(GroupId, Enable)
  for _, Link in ipairs(self.NavLinkGroupList) do
    local NavLink = Link[#Link]
    for i, v in pairs(GroupId) do
      if NavLink.GroupId == v then
        NavLink:ChangeLinkEnabledState(Enable)
      end
    end
  end
end

return Component
