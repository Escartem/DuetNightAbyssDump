require("UnLua")
local MonsterUtils = require("Utils.MonsterUtils")
local RewardModel = require("BluePrints.UI.WBP.Activity.Widget.Fort.WBP_Activity_Fort_Reward_Model")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Super.Construct(self)
  self.Avatar = GWorld:GetAvatar()
  self.MonsterIdToItem = {}
  self.Buff_Item_3 = self.Buff_Weapon
  self.LIst_Tab.BP_OnEntryInitialized:Clear()
  self.LIst_Tab.BP_OnEntryInitialized:Add(self, self.OnObjectSetFinished)
end

function M:Destruct()
  self.Super.Destruct(self)
  self.LIst_Tab.BP_OnEntryInitialized:Remove(self, self.OnObjectSetFinished)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitNormalInfo()
  self:InitBuffItem()
  self:HideWhenNoSelece()
  self:InitLevelList()
  self:InitTab()
  self:InitBtn()
  self:PlayInAnimation()
end

function M:OpenReward()
  RewardModel:OpenReward(self, self.CurSelectContent.DungeonId)
end

function M:InitBtn()
  self.Btn_Start:SetText(GText("UI_HardBoss_Track"))
  self.Btn_Start:BindEventOnClicked(self, self.EnterPaotaiGame)
  self.Fort_TaskProgress:SetText(GText("Event_RewardTitle_103007"))
  self.Fort_TaskProgress:BindEventOnClicked(self, self.OpenReward)
end

function M:InitNormalInfo()
  self.CurEventId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
  self.Text_EnemyPre:SetText(GText("UI_DUNGEON_MonsterType"))
  self.Text_Buff:SetText(GText("\230\136\152\230\150\151\229\162\158\231\155\138\239\188\136\229\190\133\233\133\141\232\161\168\239\188\137"))
  self.Btn_More.Btn_Click.OnClicked:Add(self, self.SelectFirstMonsterInfoItem)
end

function M:InitBuffItem()
  for i = 1, 3 do
    local ClickEvent = {
      Obj = self,
      Func = self.ClickBuffItem,
      Params = {
        self["Buff_Item_" .. i],
        i
      }
    }
    if 3 == i then
      self["Buff_Item_" .. i]:Init(ClickEvent, false, "Weapon", true, i)
    else
      self["Buff_Item_" .. i]:Init(ClickEvent, false, "Normal", true, i)
    end
  end
  self:RefreshBuffItem()
end

function M:RefreshBuffItem()
  if self.Avatar.PaotaiBuffs then
    for i = 1, 3 do
      self["Buff_Item_" .. i]:InitBuffInfo(self.Avatar.PaotaiBuffs[i])
    end
  end
end

function M:HideWhenNoSelece()
  self.SizeBox_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Buff:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Start:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ShowWhenSelece()
  self.SizeBox_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_Buff:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Start:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:InitLevelList()
  local PaotaiMiniGameInfo = DataMgr.PaotaiMiniGame
  self.LevelsInfo = {}
  for _, Info in pairs(PaotaiMiniGameInfo) do
    if self.CurEventId == Info.EventId then
      table.insert(self.LevelsInfo, Info)
    end
  end
  table.sort(self.LevelsInfo, function(A, B)
    return A.Id < B.Id
  end)
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.LIst_Tab:ClearListItems()
  for Index, Info in ipairs(self.LevelsInfo) do
    local Content = NewObject(UE4.LoadClass(ClassPath))
    Content.ClickEvent = {
      Obj = self,
      Func = self.ClickListItem,
      Params = {Content}
    }
    Content.Index = Index
    Content.Id = Info.Id
    Content.DungeonId = Info.DungeonId
    Content.PreDungeon = Info.PreDungeon
    Content.DungeonName = Info.DungeonName
    Content.StartTime = Info.StartTime
    Content.Level = Info.Level
    Content.Reward = Info.Reward
    Content.IsSelect = false
    Content.EventId = Info.EventId
    self.LIst_Tab:AddItem(Content)
  end
end

function M:InitTab()
  self.TabConfigData = {
    TitleName = GText("Event_Title_103007"),
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnClickBack,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClickBack,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Tab_Fort:Init(self.TabConfigData)
end

function M:PlayInAnimation()
  self:PlayAnimation(self.In)
  self.Fort_BG:PlayAnimation(self.Fort_BG.In)
end

function M:PlayOutAnimation()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
end

function M:OnReturnKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:OnClickBack()
end

function M:OnClickBack()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayOutAnimation()
end

function M:Close()
  self.Super.Close(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
    if not IsEventHandled then
      IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:ClickListItem(Content)
  if Content then
    self:ShowWhenSelece()
    if IsValid(self.CurSelectContent) then
      if self.CurSelectContent.Entry then
        self.CurSelectContent.Entry:SetSelected(false)
      else
        self.CurSelectContent.IsSelect = false
      end
    end
    self.CurSelectContent = Content
    self.CurSelectContent.Entry:SetSelected(true)
    self.LIst_Tab:BP_NavigateToItem(self.CurSelectContent)
    self:RefreshDetail()
  end
end

function M:RefreshDetail()
  self.Text_Num:SetText(self.CurSelectContent.Id)
  self.Text_FortTitle:SetText(GText(self.CurSelectContent.DungeonName))
  self:RefreshMonsterInfoList(self.CurSelectContent.DungeonId)
end

function M:OnObjectSetFinished(Content, Widget)
  if 1 == Content.Index and not self.CurSelectContent and Content.Entry then
    Content.Entry:OnCellClickedWithoutSound()
  end
end

function M:RefreshMonsterInfoList(DungeonId)
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  if not (DungeonInfo and DungeonInfo.DungeonMonsters) or 0 == #DungeonInfo.DungeonMonsters then
    DebugPrint("DungeonMonster is nil", DungeonId)
    return
  end
  local DisplayMonsters = CommonUtils.DeepCopy(DungeonInfo.DungeonMonsters)
  table.sort(DisplayMonsters, MonsterUtils.CompareMonsters)
  self.List_Monster:ClearListItems()
  for _, MonsterId in ipairs(DisplayMonsters) do
    local MonsterData = DataMgr.Monster[MonsterId]
    if MonsterData and not MonsterData.IsNotRelease then
      local Content = NewObject(self.MonsterItemContentClass)
      Content.ParentWidget = self
      Content.MonsterId = MonsterId
      Content.DisableSelect = true
      Content.SoundEvent = "event:/ui/common/click_mid"
      self.List_Monster:AddItem(Content)
    end
  end
end

function M:SelectMonsterInfoItem(MonsterId)
  UIManager(self):LoadUINew("MonsterDetailInfo", self.CurSelectContent.DungeonId, self, MonsterId)
end

function M:SelectFirstMonsterInfoItem()
  local Contents = self.List_Monster:GetListItems()
  if Contents:Length() > 0 then
    local MonsterId = Contents[1].MonsterId
    self:SelectMonsterInfoItem(MonsterId)
  end
end

function M:ClickBuffItem(Item, Index)
  if Item.IsUnlock then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local Params = {Index = Index, Parent = self}
    UIManager:ShowCommonPopupUI(100218, Params, self)
  elseif Item.Type == "Weapon" then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("PaotaiGame_PropLock_2"))
  elseif Item.Type == "Normal" then
  end
end

function M:EnterPaotaiGame()
  local CustomParams = {
    PaotaiId = self.CurSelectContent.Id
  }
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  local CurTabIndex = 1
  if ActivityMain then
    CurTabIndex = ActivityMain.CurTabIndex
  end
  local ExitDungeonInfo = {Type = "Paotai", CurTabIndex = CurTabIndex}
  GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
  self.Avatar:EnterEventDungeon(nil, self.CurSelectContent.DungeonId, nil, self.CurEventId, CustomParams)
end

return M
