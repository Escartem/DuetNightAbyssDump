require("UnLua")
local EMCache = require("EMCache.EMCache")
local MiscUtils = require("Utils.MiscUtils")
local WBP_Abyss_Settle_P_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Abyss_Settle_P_C:Destruct()
  WBP_Abyss_Settle_P_C.Super.Destruct(self)
  for i = 1, 5 do
    self:RemoveTimer("AddItemInListView" .. i)
  end
end

function WBP_Abyss_Settle_P_C:InitAllAbyssInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("thy      AbyssSettlement can not get Avatar!!!")
    return
  end
  self.AbyssName = GText(DataMgr.AbyssSeason[self.AbyssId].AbyssIdName)
  self.AbyssInfo = Avatar.Abysses[self.AbyssId]
  if not self.AbyssInfo then
    DebugPrint("thy     self.AbyssInfo is nil")
    return
  end
  self.AbyssLevelInfo = self.AbyssInfo.AbyssLevelList[self.AbyssLevelId]
  if not self.AbyssLevelInfo then
    DebugPrint("thy      self.AbyssLevelInfo is nil")
    return
  end
  self.AbyssLevelType = self.AbyssLevelInfo.AbyssType
  self.AbyssProgress = self.AbyssLevelInfo.AbyssLevelProgress
  self.PassARoomNum = self.AbyssProgress[1] or 0
  self.PassBRoomNum = self.AbyssProgress[2] or 0
  DebugPrint("thy    self.PassARoomNum", self.PassARoomNum)
  DebugPrint("thy    self.PassBRoomNum", self.PassBRoomNum)
  self.PreAbyssLevelProgress = GWorld.GameInstance.PreAbyssLevelProgress or 0
  self.MaxAbyssLevelProgress = self.AbyssLevelInfo.MaxAbyssLevelProgress
  DebugPrint("thy    self.MaxAbyssLevelProgress", self.MaxAbyssLevelProgress)
  self.MaxLockedTeamProgress = self.AbyssLevelInfo.MaxLockedTeamProgress
  self.MaxPassARoomNumInCurLocked = self.MaxLockedTeamProgress[1] or 0
  self.MaxPassBRoomNumInCurLocked = self.MaxLockedTeamProgress[2] or 0
  self.ARoomNum = self.AbyssLevelInfo.DungeonReward1 or 5
  self.BRoomNum = self.AbyssLevelInfo.DungeonReward2 or 5
  self.AbyssTeamInfo = self.AbyssLevelInfo.AbyssLockedTeamList
  self.ATeamInfo = self.AbyssTeamInfo[1] or nil
  self.BTeamInfo = self.AbyssTeamInfo[2] or nil
end

function WBP_Abyss_Settle_P_C:InitTimeText()
  local Minute = math.floor(self.PassTime / 60)
  local Second = math.floor(self.PassTime % 60)
  self.TimeDict = {}
  table.insert(self.TimeDict, 1, {TimeType = "Min", TimeValue = Minute})
  table.insert(self.TimeDict, 2, {TimeType = "Sec", TimeValue = Second})
end

function WBP_Abyss_Settle_P_C:InitRoomStarList()
  if 3 == self.AbyssLevelType then
    self.WS_Num:SetActiveWidgetIndex(1)
    local Name = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonA") or GText("Abyss_DungeonB")
    self.Text_Title_M:SetText(Name)
  else
    self.WS_Num:SetActiveWidgetIndex(0)
    if 1 == self.AbyssDungeonIndex then
      self.Icon_Fight_L:SetVisibility(ESlateVisibility.Visible)
      self:InitRoomRightStarList()
    else
      self.Icon_Fight_R:SetVisibility(ESlateVisibility.Visible)
      self:InitRoomLeftStarList()
    end
  end
end

function WBP_Abyss_Settle_P_C:InitRoomLeftStarList()
  local CountDown = self.MaxPassARoomNumInCurLocked
  for i = 1, self.ARoomNum do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.RoomIndex = i
    Content.CountDown = CountDown
    Content.ItemIndex = i
    self.List_Progress_L:AddItem(Content)
    CountDown = CountDown - 1
  end
end

function WBP_Abyss_Settle_P_C:InitRoomRightStarList()
  local CountDown = self.MaxPassBRoomNumInCurLocked
  for i = 1, self.BRoomNum do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.RoomIndex = i
    Content.CountDown = CountDown
    Content.ItemIndex = i
    self.List_Progress_R:AddItem(Content)
    CountDown = CountDown - 1
  end
end

function WBP_Abyss_Settle_P_C:InitRoomStartListInAnimation()
  AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_challenge_finish_goal_list_expand", nil, nil)
  if 3 == self.AbyssLevelType then
    self.List_Progress_M:SetScrollBarVisibility(ESlateVisibility.Collapsed)
    self.List_Progress_M:ClearListItems()
    local CountDown = self.PassARoomNum
    for i = 1, self.ARoomNum do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.RoomIndex = i
      Content.CountDown = CountDown
      Content.ItemIndex = i
      self:AddTimer(self.StarAnimationTickTime * i, self.AddItemInListView, false, 0, "AddItemInListView" .. i, true, Content)
      CountDown = CountDown - 1
    end
    return
  end
  if 1 == self.AbyssDungeonIndex then
    self.List_Progress_L:SetScrollBarVisibility(ESlateVisibility.Collapsed)
    self.List_Progress_L:ClearListItems()
    local CountDown = self.PassARoomNum
    for i = 1, self.ARoomNum do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.RoomIndex = i
      Content.CountDown = CountDown
      Content.ItemIndex = i
      self:AddTimer(self.StarAnimationTickTime * i, self.AddItemInListView, false, 0, "AddItemInListView" .. i, true, Content)
      CountDown = CountDown - 1
    end
  else
    self.List_Progress_R:SetScrollBarVisibility(ESlateVisibility.Collapsed)
    self.List_Progress_R:ClearListItems()
    local CountDown = self.PassBRoomNum
    for i = 1, self.BRoomNum do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.RoomIndex = i
      Content.CountDown = CountDown
      Content.ItemIndex = i
      self:AddTimer(self.StarAnimationTickTime * i, self.AddItemInListView, false, 0, "AddItemInListView" .. i, true, Content)
      CountDown = CountDown - 1
    end
  end
end

function WBP_Abyss_Settle_P_C:AddItemInListView(Content)
  AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_challenge_finish_star_add_start", nil, nil)
  if 3 == self.AbyssLevelType then
    self.List_Progress_M:AddItem(Content)
  elseif 1 == self.AbyssDungeonIndex then
    self.List_Progress_L:AddItem(Content)
  else
    self.List_Progress_R:AddItem(Content)
  end
  DebugPrint("thy   AddItemInListView : ", Content.ItemIndex)
end

function WBP_Abyss_Settle_P_C:InitTeamListView(TeamMemberIconPath, ListViewWidget, IsPlayerInfo)
  if not TeamMemberIconPath then
    return
  end
  for Index, IconPath in pairs(TeamMemberIconPath) do
    local Icon = LoadObject(IconPath)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Icon = Icon
    Content.Index = Index
    Content = self:AddContentInfo(Content, IsPlayerInfo)
    ListViewWidget:AddItem(Content)
  end
  if #TeamMemberIconPath < 4 then
    for i = 1, 4 - #TeamMemberIconPath do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Index = #TeamMemberIconPath + i
      ListViewWidget:AddItem(Content)
    end
  end
end

function WBP_Abyss_Settle_P_C:AddContentInfo(Content, IsPlayerInfo)
  if IsPlayerInfo then
    if 1 == Content.Index then
      Content.Type = "Role"
    elseif 4 == Content.Index then
      Content.Type = "Pet"
    else
      Content.Type = "Weapon"
    end
  elseif 1 == Content.Index or 3 == Content.Index then
    Content.Type = "Role"
  else
    Content.Type = "Weapon"
  end
  return Content
end

function WBP_Abyss_Settle_P_C:InitTeamListInfo(TeamInfo)
  if not TeamInfo then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CharInfo = DataMgr.Char
  local WeaponInfo = DataMgr.Weapon
  local PetInfo = DataMgr.Pet
  if not (CharInfo and WeaponInfo) or not PetInfo then
    DebugPrint("thy   CharInfo or WeaponInfo or PetInfo is nil")
    return
  end
  local PlayerIconPathArr = {}
  local Char = Avatar.Chars[TeamInfo.Char]
  local MeleeWeapon = Avatar.Weapons[TeamInfo.MeleeWeapon]
  local RangedWeapon = Avatar.Weapons[TeamInfo.RangedWeapon]
  local Pet = Avatar.Pets[TeamInfo.Pet]
  table.insert(PlayerIconPathArr, CharInfo[Char.CharId].Icon)
  table.insert(PlayerIconPathArr, MeleeWeapon and WeaponInfo[MeleeWeapon.WeaponId].Icon or "")
  table.insert(PlayerIconPathArr, RangedWeapon and WeaponInfo[RangedWeapon.WeaponId].Icon or "")
  table.insert(PlayerIconPathArr, Pet and PetInfo[Pet.PetId].Icon or "")
  local PhantomIconPathArr = {}
  local Phantom1 = Avatar.Chars[TeamInfo.Phantom1]
  local PhantomWeapon1 = Phantom1 and Avatar.Weapons[TeamInfo.PhantomWeapon1]
  local Phantom2 = Avatar.Chars[TeamInfo.Phantom2]
  local PhantomWeapon2 = Phantom2 and Avatar.Weapons[TeamInfo.PhantomWeapon2]
  if Phantom1 then
    table.insert(PhantomIconPathArr, CharInfo[Phantom1.CharId].Icon)
    if PhantomWeapon1 and PhantomWeapon1.WeaponId then
      table.insert(PhantomIconPathArr, WeaponInfo[PhantomWeapon1.WeaponId].Icon)
    else
      table.insert(PhantomIconPathArr, "")
    end
  end
  if Phantom2 then
    table.insert(PhantomIconPathArr, CharInfo[Phantom2.CharId].Icon)
    if PhantomWeapon2 and PhantomWeapon2.WeaponId then
      table.insert(PhantomIconPathArr, WeaponInfo[PhantomWeapon2.WeaponId].Icon)
    else
      table.insert(PhantomIconPathArr, "")
    end
  end
  if #PhantomIconPathArr < 4 then
  end
  self:InitTeamListView(PlayerIconPathArr, self.List_Item_L, true)
  self:InitTeamListView(PhantomIconPathArr, self.List_Item_R)
end

function WBP_Abyss_Settle_P_C:InitNextLevelInfo()
  local Text = ""
  if 3 == self.AbyssLevelType then
    local NextLevelInfo = self.AbyssInfo.AbyssLevelList[self.AbyssLevelId + 1]
    if NextLevelInfo then
      Text = string.format(GText("Abyss_LevelName"), self.AbyssLevelId + 1)
      self.DungeonName = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonA") or GText("Abyss_DungeonB")
      Text = Text .. self.DungeonName
      self.Text_NextFloor:SetText(Text)
    else
      self.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
      self:AdjustWSTypeSize()
    end
  elseif self.MaxAbyssLevelProgress == self.ARoomNum + self.BRoomNum then
    local NextLevelInfo = self.AbyssInfo.AbyssLevelList[self.AbyssLevelId + 1]
    if NextLevelInfo then
      Text = string.format(GText("Abyss_LevelName"), self.AbyssLevelId + 1)
      self.DungeonName = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonA") or GText("Abyss_DungeonB")
      Text = Text .. self.DungeonName
      self.Text_NextFloor:SetText(Text)
    else
      self.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
      self:AdjustWSTypeSize()
    end
  elseif 1 == self.AbyssDungeonIndex and 5 == self.PassBRoomNum or 2 == self.AbyssDungeonIndex and 5 == self.PassARoomNum then
    self.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
    self:AdjustWSTypeSize()
  else
    Text = string.format(GText("Abyss_LevelName"), self.AbyssLevelId)
    self.DungeonName = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonB") or GText("Abyss_DungeonA")
    Text = Text .. self.DungeonName
    self.Text_NextFloor:SetText(Text)
  end
end

function WBP_Abyss_Settle_P_C:AdjustWSTypeSize()
  local Rule = FSlateChildSize()
  Rule.SizeRule = UE.ESlateSizeRule.Fill
  self.WS_Type:SetActiveWidgetIndex(1)
  local Slot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(self.WS_Type)
  Slot:SetSize(Rule)
end

function WBP_Abyss_Settle_P_C:OnReplay()
  self.NextLevelIndex = self.AbyssLevelId
  self.BeginDungeonId = self.AbyssDungeonIndex
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  self:EnterDungeon()
end

function WBP_Abyss_Settle_P_C:OnNextLevel()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  GWorld.GameInstance.PreAbyssLevelProgress = self.MaxAbyssLevelProgress
  if 3 == self.AbyssLevelType then
    self.NextLevelIndex = self.AbyssLevelId + 1
    self.BeginDungeonId = 1
  elseif 1 == self.AbyssDungeonIndex then
    if self.PassBRoomNum < 5 then
      self.NextLevelIndex = self.AbyssLevelId
      self.BeginDungeonId = 2
    else
      self.NextLevelIndex = self.AbyssLevelId + 1
      self.BeginDungeonId = 1
    end
  elseif self.PassARoomNum < 5 then
    self.NextLevelIndex = self.AbyssLevelId
    self.BeginDungeonId = 1
  else
    self.NextLevelIndex = self.AbyssLevelId + 1
    self.BeginDungeonId = 2
  end
  self:EnterDungeon()
end

local TeamErrorCodes = {
  [ErrorCode.RET_ABYSS_TEAM_NO_CHAR] = true,
  [ErrorCode.RET_ABYSS_TEAM_NO_MELEEWEAPON] = true,
  [ErrorCode.RET_ABYSS_TEAM_NO_RANGEDWEAPON] = true,
  [ErrorCode.RET_ABYSS_TEAM_PHANTOM_NO_WEAPON] = true,
  [ErrorCode.RET_ABYSS_TEAM_PET_NOT_OWNED] = true
}

function WBP_Abyss_Settle_P_C:EnterDungeon()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("thy     \229\133\179\229\141\161\232\175\166\230\131\133\231\149\140\233\157\162\232\191\155\229\133\165\229\133\179\229\141\161\229\164\177\232\180\165\239\188\140Avatar\232\142\183\229\143\150\229\164\177\232\180\165")
    return
  end
  
  local function Callback(RetCode)
    if RetCode == ErrorCode.RET_SUCCESS then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, "\230\136\144\229\138\159\232\191\155\229\133\165" .. self.DungeonName)
    elseif DataMgr.ErrorCode[RetCode] then
      local ErrorContent = DataMgr.ErrorCode[RetCode].ErrorCodeContent
      if TeamErrorCodes[RetCode] then
        UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("Abyss_PartySetup_ConditionsAreNot"))
      else
        UIManager(self):ShowUITip(UIConst.Tip_CommonTop, ErrorContent .. "(Debug\231\148\168)")
      end
    end
  end
  
  Avatar:TriggerEnterAbyss(Callback, self.AbyssId, self.NextLevelIndex, self.BeginDungeonId)
  self:SetCharDirLight(false)
end

function WBP_Abyss_Settle_P_C:HideNextStageBtn()
  self.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
  self:AdjustWSTypeSize()
end

function WBP_Abyss_Settle_P_C:UpdateNextStageBtnVisble()
  if not self.IsWin then
    self:HideNextStageBtn()
    return
  end
  if self.PassARoomNum + self.PassBRoomNum ~= self.ARoomNum + self.BRoomNum then
    return
  end
  local NextLevelInfo = self.AbyssInfo.AbyssLevelList[self.AbyssLevelId + 1]
  if not NextLevelInfo then
    self:HideNextStageBtn()
    return
  end
  local ARoomNum = self.AbyssLevelInfo.DungeonReward1
  local BRoomNum = self.AbyssLevelInfo.DungeonReward2
  local PassARoomNum = NextLevelInfo.AbyssLevelProgress[1]
  local PassBRoomNum = NextLevelInfo.AbyssLevelProgress[2]
  if PassARoomNum + PassBRoomNum == ARoomNum + BRoomNum then
    self:HideNextStageBtn()
  end
end

function WBP_Abyss_Settle_P_C:HideRestartBtn()
  self.WS_Type:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Abyss_Settle_P_C:UpdateBtnVisbleOnSeasonEnd()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not DataMgr.AbyssSeason[self.AbyssId] then
    return
  end
  local AbyssSeasonId = DataMgr.AbyssSeason[self.AbyssId].AbyssSeasonId
  if not AbyssSeasonId then
    return
  end
  if AbyssSeasonId == Avatar.CurrentAbyssSeasonId then
    return
  end
  self.IsAbyssSeasonEnd = true
  self:HideNextStageBtn()
  self:HideRestartBtn()
end

function WBP_Abyss_Settle_P_C:AddStarNum()
  DebugPrint("thy    self.PreAbyssLevelProgress", self.PreAbyssLevelProgress)
  self.PreAbyssLevelProgress = self.PreAbyssLevelProgress + 1
  if not (self.PreAbyssLevelProgress > self.MaxAbyssLevelProgress) then
    AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_challenge_finish_star_add", nil, nil)
    self.Text_Now:SetText(self.PreAbyssLevelProgress)
  else
    self:RemoveTimer("AddStarNum")
  end
end

function WBP_Abyss_Settle_P_C:IncreasingStarNum()
  self:AddTimer(0.2, self.AddStarNum, true, 0, "AddStarNum")
end

function WBP_Abyss_Settle_P_C:CheckPlayBreakAnimationCondition()
  DebugPrint("thy    CheckPlayBreakAnimationCondition", self.IsNeedPlayBreak)
  if self.IsNeedPlayBreak then
    self:PlayAnimation(self.Break)
  end
end

function WBP_Abyss_Settle_P_C:InitUIConcent()
  self.VX_Text_Title:SetText(GText("Abyss_Battle_Win"))
  self.VX_Text_Title_Mid:SetText(GText("Abyss_Battle_Win"))
  local LevelIndex = string.format(GText("Abyss_LevelName"), tostring(self.AbyssLevelId))
  self.DungeonName = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonA") or GText("Abyss_DungeonB")
  local TextTips = self.AbyssName .. "/" .. LevelIndex .. "/" .. self.DungeonName
  self.Text_Tips:SetText(TextTips)
  self:InitTimeText()
  self.Com_Time:SetTimeText("", self.TimeDict)
  self.Text_Battle_Progress:SetText(GText("Abyss_FightProgress"))
  self.Img_Data:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_PanelData:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Title_L:SetText(GText("Abyss_DungeonA"))
  self.Text_Title_R:SetText(GText("Abyss_DungeonB"))
  self:InitRoomStarList()
  self.Text_Reward_Progress:SetText(GText("Abyss_RewardProgress"))
  self.IsNeedPlayBreak = false
  if self.PreAbyssLevelProgress < self.MaxAbyssLevelProgress then
    self.Text_Now:SetText(self.PreAbyssLevelProgress)
    self.IsNeedPlayBreak = true
  else
    self.Text_Now:SetText(self.MaxAbyssLevelProgress)
  end
  if 3 == self.AbyssLevelType then
    self.Text_All:SetText(tostring(self.ARoomNum))
  else
    self.Text_All:SetText(tostring(self.ARoomNum + self.BRoomNum))
  end
  self.Text_lineup:SetText(GText("Abyss_PartySetup"))
  if 1 == self.AbyssDungeonIndex then
    self:InitTeamListInfo(self.ATeamInfo)
  else
    self:InitTeamListInfo(self.BTeamInfo)
  end
  self:InitNextLevelInfo()
  self.Btn_Anew.Button_Area.OnClicked:Add(self, self.OnReplay)
  self.Btn_Anew_L:SetText(GText("Abyss_Battle_Again"))
  self.Btn_Anew_L.Button_Area.OnClicked:Add(self, self.OnReplay)
  self.Btn_Anew_L:SetGamePadImg("X")
  self.Btn_CombatData.OnClicked:Add(self, self.OnBtnChangePanelClicked)
  self.Img_Data:SetVisibility(ESlateVisibility.Visible)
  self.Text_PanelData:SetText(GText("UI_BATTLE_DATA"))
  self.Text_PanelData:SetVisibility(ESlateVisibility.Visible)
  self.Btn_NextStage:SetText(string.format(GText("Abyss_GoNextDungeon"), GText("Abyss_NextDungeon")))
  self.Btn_NextStage:SetDefaultGamePadImg("Y")
  self.Btn_NextStage.Button_Area.OnClicked:Add(self, self.OnNextLevel)
  self:UpdateNextStageBtnVisble()
  self:UpdateBtnVisbleOnSeasonEnd()
  self.Btn_Quit:SetDefaultGamePadImg("B")
  self.Btn_Quit:SetText(GText("UI_BACK"))
  self.Btn_Quit.Button_Area.OnClicked:Add(self, self.ReturnLevelInfoUI)
  self:InitJumpUI()
end

function WBP_Abyss_Settle_P_C:InitJumpUI()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.Panel_UnlockNode:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.CanJump = Avatar:CheckAbyssCanJump(self.AbyssId, self.AbyssLevelId)
  if self.CanJump then
    self.Key_Controller_Node:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
    self.Text_Next_Stage:SetText(GText("Abyss_InfiniteNode_UNLOCKED"))
    local InfiniteNodeList = DataMgr.AbyssSeason[self.AbyssId].InfiniteNode
    local AddLevel = InfiniteNodeList and InfiniteNodeList[1] or 1
    local JumpAbyssId = self.AbyssLevelId + AddLevel
    self.Text_Tier:SetText(string.format(GText("Abyss_LevelName"), JumpAbyssId))
    local Name = 1 == self.AbyssDungeonIndex and GText("Abyss_DungeonA") or GText("Abyss_DungeonB")
    self.Text_Tier_Name:SetText(Name)
    self.Panel_UnlockNode:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Unlock)
    self.Btn_Node.OnClicked:Add(self, self.JumpToDungeon)
  else
    self.Panel_UnlockNode:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Abyss_Settle_P_C:JumpToDungeon()
  local InfiniteNodeList = DataMgr.AbyssSeason[self.AbyssId].InfiniteNode
  local AddLevel = InfiniteNodeList and InfiniteNodeList[1] or 1
  self.NextLevelIndex = self.AbyssLevelId + AddLevel
  self.BeginDungeonId = 1
  self.NameEditDialog = UIManager(self):ShowCommonPopupUI(100189, {
    RightCallbackObj = self,
    RightCallbackFunction = self.EnterDungeon,
    LeftCallbackObj = self,
    LeftCallbackFunction = function()
      self:PlayAnimation(self.Normal_Cancel)
      self.NameEditDialog = nil
    end
  }, self)
end

function WBP_Abyss_Settle_P_C:OnLoaded(...)
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    DebugPrint("thy    show")
    PlayerController.bShowMouseCursor = true
  else
    DebugPrint("thy    hide")
    PlayerController.bShowMouseCursor = false
  end
  self:InitDeviceInfo()
  self:InitListenEvent()
  local LogicServerInfo = (...)
  self.IsWin, self.AbyssId, self.AbyssLevelId, self.AbyssDungeonIndex, self.PassTime = table.unpack(LogicServerInfo)
  DebugPrint("thy    OnLoaded AbyssSettlement", self.IsWin, self.AbyssId, self.AbyssLevelId, self.AbyssDungeonIndex, self.PassTime)
  self:InitAllAbyssInfo()
  self:BindToAnimationFinished(self.Break, {
    self,
    self.IncreasingStarNum
  })
  self:InitUIConcent()
  self:UpdateDungeonProgress()
  if self.IsWin then
    self:PlayAnimation(self.Victory_In)
    AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_challenge_finish_fx", nil, nil)
  else
    self:PlayAnimation(self.Defeat_In)
    AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_challenge_unfinish_fx", nil, nil)
  end
  self:SetCharDirLight(true)
  self:InitListenEventMgr()
end

function WBP_Abyss_Settle_P_C:InitListenEventMgr()
  self:AddDispatcher(EventID.OnAbyssSeasonEnd, self, self.OnAbyssSeasonEnd)
end

function WBP_Abyss_Settle_P_C:Exit()
  DebugPrint("DungeonSettlement: ClickExitButton")
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDungeonSettlement()
  EventManager:AddEvent(EventID.OnExitDungeon, self, self.DefaultExit)
end

function WBP_Abyss_Settle_P_C:DefaultExit()
  DebugPrint("DungeonSettlement: ExitCallBack")
  EventManager:RemoveEvent(EventID.OnExitDungeon, self)
  self:BlockAllUIInput(false)
  self:Close()
end

function WBP_Abyss_Settle_P_C:ReturnLevelInfoUI()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  self:Exit()
end

function WBP_Abyss_Settle_P_C:UpdateDungeonProgress()
  if self.IsAbyssSeasonEnd then
    GWorld.GameInstance:ClearExitDungeonData()
  else
    local ExitDungeonInfo = GWorld.GameInstance:GetExitDungeonData()
    if ExitDungeonInfo then
      ExitDungeonInfo.AbyssId = self.AbyssId
      ExitDungeonInfo.AbyssLevelId = self.AbyssLevelId
      ExitDungeonInfo.AbyssDungeonIndex = self.AbyssDungeonIndex
      GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
    end
  end
end

function WBP_Abyss_Settle_P_C:OnBtnChangePanelClicked()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    local Params = {
      OnCloseCallbackObj = self,
      OnCloseCallbackFunction = self.OnCombatDataClosed
    }
    self.Popup_CombatData = UIManger:ShowCommonPopupUI(Const.Popup_CombatData, Params, self)
    self.Popup_CombatData:SetVisibility(ESlateVisibility.Collapsed)
    self.Popup_CombatData:ShowGamepadScrollBtn(true)
    self:CreateCombatData()
  end
end

function WBP_Abyss_Settle_P_C:CreateCombatData()
  for i = 0, self.Popup_CombatData.VB_Node:GetChildrenCount() - 1 do
    local Child = self.Popup_CombatData.VB_Node:GetChildAt(i)
    if Child.EMScrollBox_31 ~= nil then
      self.Panel_CombatData = Child
      break
    end
  end
  self:SetDetailsContent()
  self.Popup_CombatData:SetVisibility(ESlateVisibility.Visible)
  self.Panel_CombatData.EMScrollBox_31:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  self.Panel_CombatData.EMScrollBox_31:SetControlScrollbarInside(true)
  self.Panel_CombatData:SetFocus()
end

function WBP_Abyss_Settle_P_C:SetDetailsContent()
  self.Widget_DetailsTime = self:InitDataContent(GText("UI_STAT_Time"), self:GetTimeStr(self.PassTime))
  self.CombatData = GWorld.GameInstance.CombatData
  self:SetDamageDetails()
  self:SetTakedDamageDetails()
  self:SetPhantomAttrsDetails()
end

function WBP_Abyss_Settle_P_C:SetDamageDetails()
  local TotalDamagePercent = self.CombatData.DamagePercentage or 0
  local TotalDamage = self.CombatData.TotalDamage or 0
  local MeleeDamage = self.CombatData.MeleeDamage or 0
  local RangedDamage = self.CombatData.RangedDamage or 0
  local SkillDamage = self.CombatData.SkillDamage or 0
  local SupportDamage = self.CombatData.SupportDamage or 0
  local TotalDamageText = tostring(MiscUtils.Round(TotalDamage))
  if not IsStandAlone(self) then
    TotalDamageText = TotalDamageText .. "(" .. MiscUtils.Round(TotalDamagePercent * 100) .. "%)"
  end
  self.Widget_DamageDetail = self:InitDataContent(GText("UI_STAT_DAMAGE_TITLE"), TotalDamageText)
  local DamageDetails = {
    {
      Name = GText("UI_STAT_DAMAGE_MELEE"),
      Value = MeleeDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_RANGE"),
      Value = RangedDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_CHAR"),
      Value = SkillDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_Pet"),
      Value = SupportDamage
    }
  }
  self:WrapedInitChildDetailContentFunc(self.Widget_DamageDetail, DamageDetails, 4)
end

function WBP_Abyss_Settle_P_C:SetKillDetails()
  local TotalKill = self.CombatData.TotalKill or 0
  local MeleeKill = self.CombatData.MeleeKill or 0
  local RangedKill = self.CombatData.RangedKill or 0
  local SkillKill = self.CombatData.SkillKill or 0
  local SupportKill = self.CombatData.SupportKill or 0
  self.Widget_KillDetail = self:InitDataContent(GText("UI_STAT_KILL_TITLE"), tostring(MiscUtils.Round(TotalKill)))
  local KillDetails = {
    {
      Name = GText("UI_STAT_KILL_MELEE"),
      Value = MeleeKill
    },
    {
      Name = GText("UI_STAT_KILL_RANGE"),
      Value = RangedKill
    },
    {
      Name = GText("UI_STAT_KILL_CHAR"),
      Value = SkillKill
    },
    {
      Name = GText("UI_STAT_KILL_Pet"),
      Value = SupportKill
    }
  }
  table.sort(KillDetails, function(a, b)
    return a.Value > b.Value
  end)
  self:WrapedInitChildDetailContentFunc(self.Widget_KillDetail, KillDetails, 4)
end

function WBP_Abyss_Settle_P_C:SetTakedDamageDetails()
  local TakeDamagePercent = self.CombatData.TakeDamagePercentage
  local TakedDamage = MiscUtils.Round(self.CombatData.TakedDamage)
  local TakedShieldDamage = self.CombatData.TakedShieldDamage
  local TakedHeal = self.CombatData.TakedHeal
  local TakeDamageText = tostring(MiscUtils.Round(TakedDamage))
  if not IsStandAlone(self) then
    TakeDamageText = TakeDamageText .. "(" .. MiscUtils.Round(TakeDamagePercent * 100) .. "%)"
  end
  self.Widget_TotalDamage = self:InitDataContent(GText("UI_STAT_SUFFER"), TakeDamageText)
  local TakedDamageDetails = {
    {
      Name = GText("UI_STAT_Shield"),
      Value = TakedShieldDamage
    },
    {
      Name = GText("UI_STAT_Healing"),
      Value = TakedHeal
    }
  }
  self:WrapedInitChildDetailContentFunc(self.Widget_TotalDamage, TakedDamageDetails, 2)
end

function WBP_Abyss_Settle_P_C:SetPhantomAttrsDetails()
  local PhantomAttrInfos = self.CombatData.PhantomAttrInfos
  local PhantomNum = self.CombatData.PhantomNum
  local Battle = GWorld.Battle
  if not Battle then
    DebugPrint("[THY]  Battle\228\184\186nil")
    return
  end
  if 0 == PhantomNum then
    DebugPrint("[THY]  \230\178\161\230\156\137\233\173\133\229\189\177")
    return
  end
  local PhantomDetails = {}
  for PhantomNumber, PhantomAttrInfo in pairs(PhantomAttrInfos) do
    if PhantomAttrInfo and PhantomAttrInfo.PhantomRoleId and PhantomAttrInfo.PhantomRoleId > 999 then
      local PhantomName = DataMgr.Char[PhantomAttrInfo.PhantomRoleId].CharName
      self["Widget_PhantomDetails" .. PhantomNumber] = self:InitDataContent(GText("UI_STAT_Sigil"), GText(PhantomName))
      PhantomDetails = {
        {
          Name = GText("UI_STAT_Sigil_DAMAGE"),
          Value = PhantomAttrInfo.FinalDamage
        },
        {
          Name = GText("UI_STAT_Sigil_SUFFER"),
          Value = PhantomAttrInfo.TakedDamage
        }
      }
      self:WrapedInitChildDetailContentFunc(self["Widget_PhantomDetails" .. PhantomNumber], PhantomDetails, #PhantomDetails)
    end
  end
end

function WBP_Abyss_Settle_P_C:SetOtherDetails()
  local SpConsume = self.CombatData.SpConsume
  local BulletConsume = self.CombatData.BulletConsume
  local ChestOpenedCount = self.CombatData.ChestOpenedCount
  local BreakableItemCount = self.CombatData.BreakableItemCount
  local MaxComboCount = self.CombatData.MaxComboCount
  local MaxDamage = self.CombatData.MaxDamage
  self.Widget_Other = self:InitDataContent(GText("UI_STAT_Other"))
  local OtherDetails = {
    {
      Name = GText("UI_STAT_ActionPoint_Cost"),
      Value = SpConsume
    },
    {
      Name = GText("UI_STAT_Bullets_Cost"),
      Value = BulletConsume
    },
    {
      Name = GText("UI_STAT_Chest"),
      Value = ChestOpenedCount
    },
    {
      Name = GText("UI_STAT_Destructible"),
      Value = BreakableItemCount
    },
    {
      Name = GText("UI_STAT_Combo_Max"),
      Value = MaxComboCount
    },
    {
      Name = GText("UI_STAT_Damage_Max"),
      Value = MaxDamage
    }
  }
  self:WrapedInitChildDetailContentFunc(self.Widget_Other, OtherDetails, 6)
end

function WBP_Abyss_Settle_P_C:InitDataContent(TextTarget, TextNumber)
  local Data_Widget = self:CreateWidgetNew("DungeonSettlementData")
  self:SetTitleContent(Data_Widget.Title, TextTarget, TextNumber)
  self.Panel_CombatData.EMScrollBox_31:AddChild(Data_Widget)
  return Data_Widget
end

function WBP_Abyss_Settle_P_C:SetTitleContent(Title, TextTarget, TextNumber)
  Title.Text_Main:SetText(TextTarget)
  Title.Text_Number:SetText(TextNumber)
end

function WBP_Abyss_Settle_P_C:WrapedInitChildDetailContentFunc(FatherWidget, ChildInfos, ChildInfoLength)
  local IsIntervalBg = true
  local ChildTargets = self:InitTargetContents(FatherWidget, ChildInfoLength)
  for i = 1, #ChildTargets do
    local ChildInfo = ChildInfos[i]
    self:SetTargetContent(ChildTargets[i], ChildInfo.Name, ChildInfo.Value, IsIntervalBg)
    IsIntervalBg = not IsIntervalBg
  end
end

function WBP_Abyss_Settle_P_C:InitTargetContents(Data_Widget, LenNum)
  local Targets = {}
  for i = 1, LenNum do
    local Target_Widget = self:CreateWidgetNew("DungeonSettlementTarget")
    Data_Widget.SubTitle:AddChildToVerticalBox(Target_Widget)
    Targets[i] = Target_Widget
  end
  return Targets
end

function WBP_Abyss_Settle_P_C:SetTargetContent(Target, TextMain, TextNumber, IsHideBg)
  Target.Text_Main:SetText(TextMain)
  if TextNumber then
    Target.Text_Number:SetText(MiscUtils.Round(TextNumber))
  end
  if IsHideBg then
    Target.Bg:SetVisibility(ESlateVisibility.Collapsed)
  else
    Target.Bg:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function WBP_Abyss_Settle_P_C:OnAbyssSeasonEnd(AbyssSeasonId)
  GWorld.GameInstance:ClearExitDungeonData()
  local Params = {}
  
  function Params.RightCallbackFunction()
    self:Exit()
  end
  
  UIManager(self):ShowCommonPopupUI(100225, Params)
end

function WBP_Abyss_Settle_P_C:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Abyss_Settle_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Settle_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("thy     CurGamepadName", CurGamepadName)
  DebugPrint("thy     CurInputDevice", CurInputDevice)
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateBtnUI()
end

function WBP_Abyss_Settle_P_C:UpdateBtnUI()
  self:InitBtnUI()
  self:UpdateQuitIcon()
  self:UpdateBattleDataIcon()
  self:SetFocus()
end

function WBP_Abyss_Settle_P_C:UpdateBattleDataIcon()
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or self.CurInputDeviceType == ECommonInputType.Touch then
    self.Controller_CombatData:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Controller_CombatData:SetVisibility(ESlateVisibility.Visibility)
    self.QuitKeyInfo = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    }
    self.Controller_CombatData:CreateCommonKey(self.QuitKeyInfo)
  end
end

function WBP_Abyss_Settle_P_C:UpdateQuitIcon()
  if not self.Key_Controller_Quit then
    return
  end
  self.QuitKeyInfo = {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  }
  self.Key_Controller_Quit:CreateCommonKey(self.QuitKeyInfo)
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or self.CurInputDeviceType == ECommonInputType.Touch then
    self.Key_Controller_Quit:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Key_Controller_Quit:SetVisibility(ESlateVisibility.Visibility)
  end
end

function WBP_Abyss_Settle_P_C:InitBtnUI()
  if self.CurInputDeviceType == ECommonInputType.Touch or self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.Key_Controller_Node:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Key_Controller_Node:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_Abyss_Settle_P_C:Handle_OnPCDown(InKeyName)
  DebugPrint("thy   Handle_OnPCDown", InKeyName)
  if "Escape" == InKeyName then
    return true
  end
  return false
end

function WBP_Abyss_Settle_P_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Top" == InKeyName then
    if self.Btn_NextStage:IsVisible() then
      self.Btn_NextStage:OnBtnClicked()
      self:OnNextLevel()
    end
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self.Btn_Anew_L:OnBtnClicked()
    self.Btn_Anew:OnBtnClicked()
    self:OnReplay()
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self.Btn_Quit:OnBtnClicked()
    self:ReturnLevelInfoUI()
    return true
  elseif "Gamepad_Special_Right" == InKeyName then
    if self.CanJump then
      if not self.NameEditDialog then
        self.Btn_Node:SlateHandleClicked()
        self:JumpToDungeon()
      elseif self.NameEditDialog.IsClosing then
        self.Btn_Node:SlateHandleClicked()
        self:JumpToDungeon()
      end
    end
    return true
  elseif "Gamepad_Special_Left" == InKeyName then
    self:OnBtnChangePanelClicked()
  end
  return false
end

function WBP_Abyss_Settle_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("thy    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

return WBP_Abyss_Settle_P_C
