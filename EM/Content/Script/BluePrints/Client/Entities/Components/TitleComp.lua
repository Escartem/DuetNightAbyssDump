local Component = {}

function Component:EnterWorld()
  self:InitReddots()
end

function Component:LeaveWorld()
  self:ClearEvent()
end

function Component:ChangeTitleBefore(TargetTitleId)
  local function Callback(Ret)
    ScreenPrint(" Ret\228\184\186" .. Ret .. "\230\156\141\229\138\161\231\171\175\230\155\180\230\148\185\229\137\141\231\188\128\231\167\176\229\143\183" .. "  \228\191\174\230\148\185\229\144\142\231\154\132\231\167\176\229\143\183ID\228\184\186  " .. (TargetTitleId or " kong "))
    
    EventManager:FireEvent(EventID.OnChangeTitle, self.TitleBefore, self.TitleAfter, self.TitleFrame)
  end
  
  self:CallServer("ChangeTitleBefore", Callback, self.TitleBefore, TargetTitleId)
end

function Component:ChangeTitleAfter(TargetTitleId)
  local function Callback(Ret)
    ScreenPrint("\230\156\141\229\138\161\231\171\175\230\155\180\230\148\185\229\144\142\231\188\128\231\167\176\229\143\183" .. " kong " .. "  \229\143\152\230\136\144\228\186\134  " .. (TargetTitleId or " kong "))
    
    EventManager:FireEvent(EventID.OnChangeTitle, self.TitleBefore, self.TitleAfter, self.TitleFrame)
  end
  
  self:CallServer("ChangeTitleAfter", Callback, self.TitleAfter, TargetTitleId)
end

function Component:ChangeTitleFrame(TitleFrameId)
  local function Callback(Ret)
    ScreenPrint("\230\156\141\229\138\161\231\171\175\230\155\180\230\148\185\231\167\176\229\143\183\230\161\134" .. (OldTitleFrameId or " kong ") .. "  \229\143\152\230\136\144\228\186\134  " .. (TitleFrameId or " kong "))
    
    EventManager:FireEvent(EventID.OnChangeTitle, self.TitleBefore, self.TitleAfter, self.TitleFrame)
  end
  
  self:CallServer("ChangeTitleFrame", Callback, self.TitleFrame, TitleFrameId)
end

function Component:GmGetAllTitle()
  self:CallServerMethod("GmGetAllTitle")
end

function Component:GmGetAllTitleFrame()
  self:CallServerMethod("GmGetAllTitleFrame")
end

function Component:_OnPropChangeTitles(Keys)
  EventManager:FireEvent(EventID.OnGetTitle, self.Titles)
end

function Component:_OnPropChangeTitleFrames(Keys)
  EventManager:FireEvent(EventID.OnGetTitleFrame, self.TitleFrames)
end

function Component:OnGetTitleFrame(TitleFrames)
  DebugPrint("yklua OnGetTitle")
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for FrameID, GetTime in pairs(TitleFrames) do
      local CacheKey = FrameID
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("TitleFrame")
      if nil == CacheDetail[CacheKey] and "-1" ~= CacheKey and 10001 ~= FrameID then
        UIUtils.TryAddReddotCacheDetailNumber(CacheKey, "TitleFrame")
      end
    end
  end
  ReddotManager.IncreaseLeafNodeCount("TitleBtn", 1)
end

function Component:OnGetTitle(Titles)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for FrameID, GetTime in pairs(Titles) do
      local CacheKey = FrameID
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Title")
      if nil == CacheDetail[CacheKey] and "-1" ~= CacheKey then
        UIUtils.TryAddReddotCacheDetailNumber(CacheKey, "Title")
      end
    end
  end
  ReddotManager.IncreaseLeafNodeCount("TitleBtn", 1)
end

function Component:InitReddots()
  EventManager:AddEvent(EventID.OnGetTitle, self, self.OnGetTitle)
  EventManager:AddEvent(EventID.OnGetTitleFrame, self, self.OnGetTitleFrame)
  local Node = ReddotManager.GetTreeNode("TitleBtn")
  Node = Node or ReddotManager.AddNodeEx("TitleBtn", nil, 1)
  Node = ReddotManager.GetTreeNode("TitleTab")
  Node = Node or ReddotManager.AddNodeEx("TitleTab", nil, 1)
  Node = ReddotManager.GetTreeNode("TitleFrameTab")
  Node = Node or ReddotManager.AddNodeEx("TitleFrameTab", nil, 1)
end

function Component:ClearEvent()
  EventManager:RemoveEvent(EventID.OnGetTitle, self)
  EventManager:RemoveEvent(EventID.OnGetTitleFrame, self)
end

return Component
