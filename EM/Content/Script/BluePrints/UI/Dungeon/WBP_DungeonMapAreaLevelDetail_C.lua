require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Super.Construct(self)
  self.Btn_2:SetText(GText("DUNGEONSINGLE"))
  self.Btn_1:SetText(GText("DUNGEONMATCH"))
  self.Btn_Back:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.OnClickDetailBack,
        Owner = self
      }
    },
    bLongPress = false,
    Desc = GText("UI_BACK")
  })
  self.Btn_Back:AddExecuteLogic(self, self.OnClickDetailBack)
  self.Btn_2:BindEventOnClicked(self, self.OnClickSingle)
  self.Btn_1:BindEventOnClicked(self, self.OnClickMatch)
  self.Btn_Search.OnClicked:Add(self, self.OnBtnSearchClicked)
  self:AddDispatcher(EventID.OnMatchStateChanged, self, self.OnMatchStateChanged)
end

function M:Destruct()
  self.Btn_1:UnBindEventOnClickedByObj(self)
  self.Btn_2:UnBindEventOnClickedByObj(self)
  self.Btn_Search.OnClicked:Clear()
  self.Super.Destruct(self)
end

function M:ShowAreaLevelItemDetail(DungeonId)
  if not DungeonId then
    return
  end
  self.List_Prop:ClearListItems()
  self.CurSelectedDungeonId = DungeonId
  self.Panel_Details:SetVisibility(ESlateVisibility.Visible)
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  self.Text_LevelName:SetText(GText(DungeonData.DungeonName))
  self.Text_LevelDescribe:SetText(GText(DungeonData.DungeonDes))
  self:CheckMonstersInfoButton(DungeonId)
  if not DungeonData.DungeonType then
    self.LevelType:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.LevelType:SetVisibility(ESlateVisibility.HitTestInvisible)
    local DungeonType = string.upper(DungeonData.DungeonType)
    self.Text_TypeName:SetText(GText("UI_DUNGEON_TYPE_" .. DungeonType))
    if DungeonData.DungeonTypeIcon then
      local TypeIcon = LoadObject(DungeonData.DungeonTypeIcon)
      if TypeIcon then
        self.Image_Icon:SetBrushFromTexture(TypeIcon)
      end
    end
  end
  if DungeonData.DungeonLevel then
    self.RoleLevel:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Text_RecommendedLevel:SetText(DungeonData.DungeonLevel)
  else
    self.RoleLevel:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not DungeonData.DungeonReward then
    return
  end
  self.RewardList = {}
  for RewardId in pairs(DungeonData.DungeonReward) do
    local Reward = RewardUtils:GetAllRewardByRewardId(RewardId)
    if Reward then
      local function AddReward(Rewards, TableName)
        if not Rewards then
          return
        end
        for ItemId, ItemCount in pairs(Rewards) do
          self.RewardList[ItemId] = TableName
        end
      end
      
      AddReward(Reward.Resources, "Resource")
      AddReward(Reward.Chars, "Char")
      AddReward(Reward.Weapons, "Weapon")
      AddReward(Reward.Mods, "Mod")
      AddReward(Reward.Skins, "Skin")
      AddReward(Reward.Drops, "Drop")
      AddReward(Reward.Exps, "Resource")
    end
  end
  for ItemId, TableName in pairs(self.RewardList) do
    local ItemData = DataMgr[TableName][ItemId]
    local Class = LoadClass("/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C")
    local Content = NewObject(Class)
    Content.UnitId = ItemId
    Content.UnitName = ItemUtils:GetDropName(ItemId, TableName)
    Content.Icon = ItemUtils.GetItemIcon(ItemId, TableName)
    Content.Parent = self
    Content.Type = TableName
    Content.Rarity = ItemData.Rarity or 1
    self.List_Prop:AddItem(Content)
  end
end

function M:CheckMonstersInfoButton()
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  if DungeonData.DungeonMonsters then
    self.Btn_Search:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Btn_Search:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnClickSingle()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_enter_level", nil, nil)
  if not self.CurSelectedDungeonId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:EnterDungeon(self.CurSelectedDungeonId)
  else
    WorldTravelSubsystem(self):ChangeDungeonByDungeonId(self.CurSelectedDungeonId)
  end
end

function M:OnClickMatch()
  if not self.CurSelectedDungeonId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:EnterDungeon(self.CurSelectedDungeonId, CommonConst.DungeonNetMode.DedicatedServer)
  else
    assert(false)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    UIManger:LoadUI(UIConst.DUNGEONMATCHINGFLOAT, "DungeonMatchingFloat", UIConst.ZORDER_FOR_CHANGE_SCENE, self.CurSelectedDungeonId)
  end
end

function M:OnClickDetailBack()
  self.Parent:RefreshAreaLevelItem(-1)
  self.Parent:SetFocus()
  self:Close()
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.RightMouseButton) then
    self:OnClickDetailBack()
  end
end

function M:OnBtnSearchClicked()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    local MonsterInfoPanel = UIManger:LoadUI(UIConst.MONSTERDETAILINFO, "MonsterDetailInfo", UIConst.ZORDER_FOR_COMMON_TIP)
    MonsterInfoPanel:InitPanel(self.CurSelectedDungeonId)
    MonsterInfoPanel.Parent = self
  end
end

function M:OnMatchStateChanged()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger and UIManger:GetUI("DungeonMatchingFloat") then
    self.Btn_1:SetIsEnabled(false)
    self.Btn_2:SetIsEnabled(false)
  else
    self.Btn_1:SetIsEnabled(true)
    self.Btn_2:SetIsEnabled(true)
  end
end

return M
