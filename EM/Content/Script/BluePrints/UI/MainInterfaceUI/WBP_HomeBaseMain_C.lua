require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_HomeBaseMain_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_HomeBaseMain_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.Owner = nil
end

function WBP_HomeBaseMain_C:Construct()
  self.Overridden.Construct(self)
  self:AddDispatcher(EventID.OnChangeKeyBoardSet, self, self.InitBtnList)
  self:AddDispatcher(EventID.OnMainUIReddotUpdate, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnCompleteProduce, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnBlueComplete, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnReceiveNewQuest, self, self.UpdateRedDotStates)
  self:AddTimer(1.0, self.SetSignBoardNpcIdle, true, 0, "SetSignBoardNpcIdle")
end

function WBP_HomeBaseMain_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitBtnList()
  self:InitEsc()
end

function WBP_HomeBaseMain_C:InitBtnList()
  local SystemData = DataMgr.MainUI
  self.ListView:ClearListItems()
  local ClassPath = UE4.LoadClass("/Game/UI/UI_PC/Main/Main_Btnlist_Content_PC.Main_Btnlist_Content_PC_C")
  for index, Data in pairs(SystemData) do
    if Data.IsAddToList and Data.IsShowInHomeBase then
      local Content = NewObject(ClassPath)
      Content.BtnId = index
      self.ListView:AddItem(Content)
    end
  end
end

function WBP_HomeBaseMain_C:UpdateRedDotStates()
  DebugPrint("Tianyi@ UpdateRedDotStates")
  local EntryList = self.ListView:GetDisplayedEntryWidgets():ToTable()
  for _, v in ipairs(EntryList) do
    v:UpdateRedDot()
  end
end

function WBP_HomeBaseMain_C:InitQuest()
  local Avatar = GWorld:GetAvatar()
  if nil ~= Avatar then
    local QuestId = Avatar.QuestId
    if nil ~= QuestId then
      local QuestName = DataMgr.Quest[QuestId].QuestName
      if nil ~= QuestName then
        self.Text_Mission_Title:SetText(QuestName)
        return
      end
    end
  end
end

function WBP_HomeBaseMain_C:SetSignBoardNpcIdle()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    self:RemoveTimer("SetSignBoardNpcIdle")
    return
  end
  local IsLoadCompleteCount = 0
  for key, value in pairs(Avatar.SignBoardNpc) do
    if -1 == value then
      IsLoadCompleteCount = IsLoadCompleteCount + 1
    else
      local NpcInfo = DataMgr.Npc[value]
      if nil == NpcInfo or nil == NpcInfo.ShowAnimationId then
        IsLoadCompleteCount = IsLoadCompleteCount + 1
      else
        local ShowAnimation = NpcInfo.ShowAnimationId
        local ShowAnimationId = ShowAnimation[key]
        local GameInstance = GWorld.GameInstance
        local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
        local Npc = GameState.NpcCharacterMap:Find(value)
        if nil ~= Npc then
          IsLoadCompleteCount = IsLoadCompleteCount + 1
          if "Sit" == ShowAnimationId and 3 ~= key then
            Npc:SetSitPoseInteractive()
          else
            Npc:SetIdlePose(false)
          end
        end
      end
    end
  end
  if 3 == IsLoadCompleteCount then
    self:RemoveTimer("SetSignBoardNpcIdle")
  end
end

function WBP_HomeBaseMain_C:OpenArmory()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player:CharacterInTag("Idle") then
    UIManager:LoadUINew("ArmoryMain")
  end
end

function WBP_HomeBaseMain_C:OpenBag()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player:CheckCanEnterTag("Interactive") then
    UIManger:LoadUI(nil, "BagMain", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  end
end

function WBP_HomeBaseMain_C:OpenCommonSetup()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player:GetESCMenuForbiddenState() then
    return
  end
  local SystemUIConfig = DataMgr.SystemUI[UIConst.CommonSetUP]
  if SystemUIConfig and SystemUIConfig.Params.BlockedUIName then
    for _, UIName in ipairs(SystemUIConfig.Params.BlockedUIName) do
      local BlockedUI = UIManager(self):GetUIObj(UIName)
      if BlockedUI and BlockedUI:IsPlayingAnimation() then
        return
      end
    end
  end
  UIManager(self):LoadUINew(UIConst.MenuWorld, "OutBattle")
end

function WBP_HomeBaseMain_C:InitEsc()
  self.Btn_Esc.Btn_top.OnClicked:Add(self, self.OpenCommonSetup)
  self.Btn_Esc:LoadImage(11)
end

return WBP_HomeBaseMain_C
