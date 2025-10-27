require("UnLua")
require("DataMgr")
local DevServerList = require("BluePrints/UI/GameLogin/DevServerList")
local WBP_ServerSelect_C = Class("BluePrints.UI.BP_UIState_C")
local AllServers, ServerList, CurrentServerList
local CurrentArea = 0

function WBP_ServerSelect_C:Construct()
  self.Super.Construct(self)
end

function WBP_ServerSelect_C:CloseUI()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:Show(UIConst.VisibilityOp.Collapsed)
  self:Close()
end

function WBP_ServerSelect_C:Show(VisibilityOp)
  self:SetVisibility(VisibilityOp)
  if VisibilityOp == UIConst.VisibilityOp.Visible then
    self:PlayAnim("HideOrShow_Panel_Server")
    if nil == ServerList then
      self:RefreshSeverList()
    else
      self:VerifyListViewCallBack()
      self.ListView_Area:SetSelectedIndex(CurrentArea)
    end
  end
end

function WBP_ServerSelect_C:RefreshSeverList()
  self.CircularThrobber_1:SetVisibility(UIConst.VisibilityOp.Visible)
  self:TryToGetServerList()
end

function WBP_ServerSelect_C:TryToGetServerList()
  self:AddTimer(0.5, self.VerifyListViewCallBack, false, 0, "VerifyListView")
  AllServers = DevServerList
end

function WBP_ServerSelect_C:VerifyListViewCallBack()
  if AllServers then
    self.ListView_Area:ClearListItems()
    local obj = self:NewAreaItemContent(nil)
    CurrentArea = 0
    obj.Area = CurrentArea
    obj.Name = "\230\142\168\232\141\144"
    self.ListView_Area:AddItem(obj)
    ServerList = {
      {
        area = 1,
        name = "\229\188\128\229\143\145",
        servers = nil
      },
      {
        area = 2,
        name = "\229\188\128\229\143\1452",
        servers = nil
      },
      {
        area = 3,
        name = "QA",
        servers = nil
      },
      {
        area = 4,
        name = "\231\173\150\229\136\146",
        servers = nil
      },
      {
        area = 5,
        name = "\229\133\182\228\187\150",
        servers = nil
      }
    }
    for k, v in pairs(AllServers) do
      if ServerList[v.area] == nil then
        ServerList[v.area] = {
          area = v.area,
          name = "Area " .. v.area,
          servers = nil
        }
      end
      if ServerList[v.area].servers == nil then
        ServerList[v.area].servers = {}
      end
      ServerList[v.area].servers[k] = v
    end
    for k, v in pairs(ServerList) do
      if v.servers then
        local AreaContent = {
          area = v.area,
          name = v.name
        }
        self.ListView_Area:AddItem(self:NewAreaItemContent(AreaContent))
      end
    end
    self.ListView_Area:BP_SetSelectedItem(obj)
    self:RemoveTimer("VerifyListView")
    self.CircularThrobber_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    print(_G.LogTag, "Failed to get server list, error code:")
  end
end

function WBP_ServerSelect_C:NewAreaItemContent(content)
  if nil == content then
    return NewObject(self.AreaItemContentClass, self.ListView_Area)
  end
  local obj = NewObject(self.AreaItemContentClass, self.ListView_Area)
  obj.Area = content.area
  obj.Name = content.name
  obj.IsSelected = false
  return obj
end

function WBP_ServerSelect_C:NewServerItemContent(content)
  if nil == content then
    return NewObject(self.ServerItemContentClass, self.List)
  end
  local obj = NewObject(self.ServerItemContentClass, self.List)
  obj.HostId = content.hostnum
  obj.Area = content.area
  obj.Name = content.name
  obj.IP = content.ip
  obj.Port = content.port
  obj.IsSelected = false
  return obj
end

function WBP_ServerSelect_C:SwitchArea(area)
  if not GWorld.IsDev then
    return
  end
  if area ~= CurrentArea then
    UIUtils.PlayCommonBtnSe(self)
  end
  if nil ~= ServerList then
    CurrentArea = area
    self.SelectedArea = self.ListView_Area:BP_GetSelectedItem()
    self.List:ClearListItems()
    CurrentServerList = {}
    if 0 == area then
      for k, v in pairs(AllServers) do
        table.insert(CurrentServerList, v)
      end
    else
      for k, v in pairs(ServerList) do
        if v.area == area and v.servers then
          for k, v in pairs(v.servers) do
            if v.area == area then
              table.insert(CurrentServerList, v)
            end
          end
          break
        end
      end
    end
    table.sort(CurrentServerList, function(a, b)
      return a.hostnum < b.hostnum
    end)
    self:SearchServer(self.Input_Search_Server:GetText())
  end
end

function WBP_ServerSelect_C:SearchServer(text)
  if nil ~= CurrentServerList then
    self.List:ClearListItems()
    if nil ~= text then
      for k, v in pairs(CurrentServerList) do
        if nil ~= string.find(v.name, text) or nil ~= string.find(v.hostnum, text) then
          self.List:AddItem(self:NewServerItemContent(v))
        end
      end
    else
      for k, v in pairs(CurrentServerList) do
        self.List:AddItem(self:NewServerItemContent(v))
      end
    end
  end
end

function WBP_ServerSelect_C:Confirm()
  local item = self.List:BP_GetSelectedItem()
  if nil ~= item and self.SelectedServer ~= item then
    self.SelectedServer = item
    self.IsSelectionChanged = true
  else
    self.IsSelectionChanged = false
  end
end

function WBP_ServerSelect_C:PlayUISound(EventPath)
  AudioManager(self):PlayUISound(self, EventPath, nil, nil)
end

return WBP_ServerSelect_C
