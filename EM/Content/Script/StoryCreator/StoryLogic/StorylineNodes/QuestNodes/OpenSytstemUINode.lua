local OpenSytstemUINode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function OpenSytstemUINode:Init()
  self.Delay = 0.5
  self.UIName = ""
end

function OpenSytstemUINode:Execute(Callback)
  EventManager:AddEvent(EventID.UnLoadUI, self, self.OnUIClose)
  self:OpenUI(self.UIName)
  self.Callback = Callback
end

function OpenSytstemUINode:Clear()
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
end

function OpenSytstemUINode:OnUIClose(UIName)
  if UIName == self.UIName then
    self:ExecuteNext()
  end
end

function OpenSytstemUINode:ExecuteNext()
  EventManager:RemoveEvent(EventID.UnLoadUI, self)
  self.Callback()
end

function OpenSytstemUINode:OpenUI(UIName, ...)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  if nil ~= SystemUIConfig then
    return UIManager:LoadUINew(UIName, ...)
  end
  local UIConfig = UIConst.AllUIConfig[UIName]
  if nil == UIConfig then
    ScreenPrint(string.format("OpenSytstemUINode\239\188\154\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185\229\135\186\233\148\153\239\188\140\230\178\161\230\156\137\230\137\190\229\136\176\231\155\184\229\133\179UI\228\191\161\230\129\175,\232\175\183\230\163\128\230\159\165\232\138\130\231\130\185\229\161\171\229\133\165\231\154\132UIName,UI\229\144\141\229\173\151\228\184\186%s", UIName))
    DebugPrint("========================================================================OpenSytstemUINode: Not Find UIName In SystemUI or AllUIConfig, UIName Is : %s ", UIName)
    local Message = "OpenSytstemUINode\239\188\154\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185\229\135\186\233\148\153\239\188\140\230\178\161\230\156\137\230\137\190\229\136\176\231\155\184\229\133\179UI\228\191\161\230\129\175,\232\175\183\230\163\128\230\159\165\232\138\130\231\130\185\229\161\171\229\133\165\231\154\132UIName,UI\229\144\141\229\173\151\228\184\186" .. UIName
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "OpenSytstemUINode\232\138\130\231\130\185\229\135\186\233\148\153\239\188\140\230\178\161\230\156\137\230\137\190\229\136\176\231\155\184\229\133\179UI\228\191\161\230\129\175", Message)
    EventManager:RemoveEvent(EventID.UnLoadUI, self)
    return
  end
  return UIManager:LoadUI(UIConfig.resource, UIName, UIConfig.zorder)
end

return OpenSytstemUINode
