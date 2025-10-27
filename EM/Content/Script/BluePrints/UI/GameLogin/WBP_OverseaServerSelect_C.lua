require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  self:SetFocus(true)
  self.Owner = Owner
  self.ServerInfos = Params.ServerInfos or {}
  self.Avatars = Params.Avatars or {}
  local RecommandSelectHostnum = Params.RecommandSelectHostnum or nil
  local DefaultSelectHostnum = Params.DefaultSelectHostnum or nil
  local Avatars = {}
  local MaxLevel = 0
  local MaxLevelHostnum
  for _, Avatar in pairs(self.Avatars) do
    Avatars[tonumber(Avatar.Hostnum)] = Avatar
    if not RecommandSelectHostnum and MaxLevel < Avatar.AvatarInfo.Level then
      MaxLevel = Avatar.AvatarInfo.Level
      MaxLevelHostnum = Avatar.Hostnum
    end
  end
  local NewServerInfos = {}
  local ServerAreas = {}
  if RecommandSelectHostnum then
    local ServerInfo = self.ServerInfos[tonumber(RecommandSelectHostnum)]
    if ServerInfo then
      ServerAreas[ServerInfo.area] = true
      NewServerInfos[tonumber(RecommandSelectHostnum)] = ServerInfo
    end
  end
  if DefaultSelectHostnum then
    local ServerInfo = self.ServerInfos[tonumber(DefaultSelectHostnum)]
    if ServerInfo and not ServerAreas[ServerInfo.area] then
      ServerAreas[ServerInfo.area] = true
      NewServerInfos[tonumber(DefaultSelectHostnum)] = ServerInfo
    end
  end
  for k, v in pairs(self.ServerInfos) do
    if Avatars[tonumber(k)] or not ServerAreas[v.area] then
      ServerAreas[v.area] = true
      NewServerInfos[tonumber(k)] = v
    end
  end
  local Contents = {}
  for k, v in pairs(NewServerInfos) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    if Content then
      Content.Parent = self
      Content.ServerInfo = v
      if Avatars[v.hostnum] then
        Content.Avatar = Avatars[v.hostnum]
      end
      if MaxLevelHostnum then
        if v.hostnum == MaxLevelHostnum then
          Content.bRecommand = true
        end
      elseif RecommandSelectHostnum and v.hostnum == RecommandSelectHostnum then
        Content.bRecommand = true
      end
      if DefaultSelectHostnum and v.hostnum == DefaultSelectHostnum then
        Content.bSelected = true
      end
      table.insert(Contents, Content)
    else
      DebugPrint("Failed to create content for server: " .. tostring(v))
    end
  end
  table.sort(Contents, function(a, b)
    return a.ServerInfo.area < b.ServerInfo.area
  end)
  for _, Content in ipairs(Contents) do
    if Content then
      self.List_Item:AddItem(Content)
    end
  end
end

function M:OnSelected(Content)
  if self.CurrentSelectedContent and self.CurrentSelectedContent ~= Content then
    if self.CurrentSelectedContent.CurrentEntry then
      self.CurrentSelectedContent.CurrentEntry:SetSelected(false)
    end
    self.CurrentSelectedContent.bSelected = false
  end
  self.CurrentSelectedContent = Content
end

function M:PackageData()
  if self.CurrentSelectedContent then
    return self.CurrentSelectedContent.ServerInfo
  end
  return nil
end

return M
