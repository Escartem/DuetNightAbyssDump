local Component = {}
local NewGuideNoteName = DataMgr.ReddotNode.NewGuideNote.Name

function Component:EnterWorld()
  self:InitGuideBookReddotNode()
end

function Component:InitGuideBookReddotNode()
  ReddotManager.AddNode(NewGuideNoteName)
  ReddotManager.GetTreeNode(NewGuideNoteName).Count = 0
  for Id, Content in pairs(self.GuideBook) do
    self:AddGuideBookReddotCount(Id, Content)
  end
end

function Component:AddGuideBookReddotCount(Id, GuideBookData)
  if 0 == GuideBookData.Reward then
    return
  end
  if ReddotManager.GetTreeNode(NewGuideNoteName) then
    ReddotManager.IncreaseLeafNodeCount(NewGuideNoteName)
  end
end

function Component:SubGuideBookReddotCount(Id)
  if ReddotManager.GetTreeNode(NewGuideNoteName) and ReddotManager.GetTreeNode(NewGuideNoteName).Count > 0 then
    ReddotManager.DecreaseLeafNodeCount(NewGuideNoteName)
  end
end

function Component:GuideBookFinishSomething(Type, Id)
  if type(Id) == "string" then
    self:CallServerMethod("GuideBookFinishSomethingStr", Type, Id)
  end
  if type(Id) == "number" then
    self:CallServerMethod("GuideBookFinishSomethingInt", Type, Id)
  end
end

function Component:ClearGuideBookReddotCount()
  local NewGuideBookNode = ReddotManager.GetTreeNode(NewGuideNoteName)
  if not NewGuideBookNode then
    return
  end
  NewGuideBookNode.Count = 1
  ReddotManager.DecreaseLeafNodeCount(NewGuideNoteName)
end

function Component:EchoGuideBook()
  PrintTable(self.GuideBook:all_dump(self.GuideBook), 10, "GuideBook")
end

function Component:GMUnlockGuideBook(num)
  if not num then
    for key in pairs(DataMgr.GuideBook) do
      self:CallServerMethod("GMUnlockGuideBook", key)
    end
    return
  end
  self:CallServerMethod("GMUnlockGuideBook", num)
end

function Component:NotifyGuideBookUnlock(GuideNoteId)
  DebugPrint("\232\167\163\233\148\129\228\186\134" .. GuideNoteId .. "\229\143\183\230\149\153\229\173\166")
  self:InitGuideBookReddotNode()
  self:ShowGuideBookTips(GuideNoteId)
end

function Component:UpdateFirstMechanismTags(Tag)
  self:CallServerMethod("UpdateFirstMechanismTags", Tag)
end

function Component:TestUpdateFirstMechanismTags()
  self:CallServerMethod("UpdateFirstMechanismTags", "GameLine")
end

function Component:GuideBookGetReward(Id)
  local function callback(ErrCode)
    if ErrorCode:Check(ErrCode) then
      DebugPrint("\230\156\141\229\138\161\229\153\168\229\155\158\232\176\131:\229\165\150\229\138\177\233\162\134\229\143\150\230\136\144\229\138\159\239\188\129\239\188\129")
      
      EventManager:FireEvent(EventID.OnGetGuideBookReward, Id)
      self:SubGuideBookReddotCount(Id)
      self.GuideBook[Id].IsGettingReward = 0
    else
      DebugPrint("\230\156\141\229\138\161\229\153\168\229\155\158\232\176\131:\229\165\150\229\138\177\233\162\134\229\143\150\229\164\177\232\180\165\239\188\129\239\188\129")
    end
  end
  
  self:CallServer("GuideBookGetReward", callback, Id)
end

function Component:ShowGuideBookTips(GuideNoteId)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  if UIManager:GetUI("BattleMain") then
    UIManager:LoadUINew("GuideBook_Tips", GuideNoteId)
  end
end

return Component
