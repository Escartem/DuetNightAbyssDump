require("UnLua")
require("DataMgr")
local WBP_MapLevelSelect_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_MapLevelSelect_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_MapLevelSelect_C:Destruct()
  self.Super.Destruct(self)
  self:RemoveTrackingFromButton()
  AudioManager(self):SetEventSoundParam(self, "MapOpen", {ToEnd = 1})
  AudioManager(self):StopSound(self, "MapOpen")
end

function WBP_MapLevelSelect_C:OnLoaded(...)
  self:InitMapUI()
  self:AddDispatcher(EventID.OnMatchStateChanged, self, self.OnMatchStateChanged)
  self:OnMatchStateChanged()
  self.Btn_Close:Init("Close", self, self.BtnBackOnClick)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_open", "MapOpen", nil)
  self:SelectTrackingQuestRegion()
end

function WBP_MapLevelSelect_C:OnHoveredMainLevelItem(UIIndex)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_hover_level", nil, nil)
  self:RefreshMainLevelItem(false, UIIndex)
end

function WBP_MapLevelSelect_C:OnClickedMainMapBtnCancel()
  self.MainDetailsDungeonId = {-1, -1}
  self:SetUICollapsed(self.Prologue_Map_Level_Details)
  self:SetHardBossMapTipsClose()
  self:RefreshMainLevelItem(false, -1)
end

function WBP_MapLevelSelect_C:OnClickedMainLevelItem(UIIndex, RegionID, BornID)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_level", nil, nil)
  self:RefreshMainLevelItem(true, UIIndex)
  self:SetUIVisible(self.Prologue_Map_Level_Details)
  local ChapterData = DataMgr.Chapter[self.NowChapterId]
  local RegionNameList = (ChapterData.RegionNameList or {})[1] or {}
  local RegionDescList = (ChapterData.RegionDescList or {})[1] or {}
  local DungeonName = RegionNameList[UIIndex]
  local DungeonDescribe = RegionDescList[UIIndex]
  DungeonName = DungeonName or DataMgr.SubRegion[RegionID].SubRegionName
  DungeonDescribe = DungeonDescribe or DataMgr.SubRegion[RegionID].SubRegionDes
  self.Prologue_Map_Level_Details.Text_LevelName:SetText(GText(DungeonName))
  self.Prologue_Map_Level_Details.Text_Describe:SetText(GText(DungeonDescribe))
  self.MainDetailsDungeonId = {RegionID, BornID}
  self:ClickHardBossLevelItem(UIIndex, RegionID, BornID)
  local ItemPos = self:GetPosition(self.BtnChapterLevelList[UIIndex])
  local Pos = FVector2D(-ItemPos.X, -ItemPos.Y)
  self:SetPosition(self.Prologue_Map_Main_New, FVector2D(0, 0))
  self:SetPosition(self.Prologue_Map_Main_New.Panel_LevelsAndName, Pos)
  self:SetPosition(self.Prologue_Map_Main_New.Panel_Map, Pos)
  self:SetPosition(self.Prologue_Map_Main_New.Panel_AreaName, Pos)
end

function WBP_MapLevelSelect_C:ClickHardBossLevelItem(UIIndex, RegionID, BornID)
  if self.BtnChapterLevelList[UIIndex].IsHardBoss then
    self:SetUICollapsed(self.Prologue_Map_Level_Details)
    if self.CurHardBossUIIndex ~= UIIndex then
      self.CurHardBossUIIndex = UIIndex
      if self.HardBossMapTips == nil then
        local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
        local UIManager = GameInstance:GetGameUIManager()
        self.HardBossMapTips = UIManager:LoadUINew("HardBossMapTips")
        self.HardBossMapTips.Common_Button_Text_PC:BindEventOnClicked(self, self.MainMapDetailsEnterBtnCallback)
      end
      self.HardBossMapTips:RefreshMapTips(self.BtnChapterLevelList[self.CurHardBossUIIndex].HardBossId, RegionID, BornID)
    end
  else
    self:SetHardBossMapTipsClose()
  end
end

function WBP_MapLevelSelect_C:SetHardBossLevelItem()
  local HardBossMain = {}
  for i, data in pairs(DataMgr.HardBossMain) do
    table.insert(HardBossMain, data)
  end
  table.sort(HardBossMain, function(a, b)
    return a.HardBossId < b.HardBossId
  end)
  for i = 1, #self.BtnHardBossLevelList do
    if HardBossMain[i] then
      self.BtnHardBossLevelList[i].HardBossId = HardBossMain[i].HardBossId
      self.BtnHardBossLevelList[i].RegionID = HardBossMain[i].SubRegionId
      if HardBossMain[i].BornID then
        self.BtnHardBossLevelList[i].BornID = HardBossMain[i].BornID
      end
      local BossIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Boss.T_Gp_Boss")
      self.BtnHardBossLevelList[i].Img_Mark:SetBrushResourceObject(BossIcon)
      self.BtnHardBossLevelList[i].Img_Mark_Light:SetVisibility(UE4.ESlateVisibility.Collapsed)
      local Avatar = GWorld:GetAvatar()
      if Avatar and Avatar:CheckHardBossUnlockCondition(self.BtnHardBossLevelList[i].HardBossId) then
        self:SetUIVisible(self.BtnHardBossLevelList[i])
        self:SetUIVisible(self.BtnHardBossNameList[i])
      else
        self:SetUICollapsed(self.BtnHardBossLevelList[i])
        self:SetUICollapsed(self.BtnHardBossNameList[i])
      end
    else
      self:SetUICollapsed(self.BtnHardBossLevelList[i])
      self:SetUICollapsed(self.BtnHardBossNameList[i])
    end
  end
end

function WBP_MapLevelSelect_C:SetHardBossMapTipsClose()
  if self.HardBossMapTips then
    self.HardBossMapTips:PlayOutAnim()
    self.HardBossMapTips = nil
    self.CurHardBossUIIndex = -1
  end
end

function WBP_MapLevelSelect_C:SelectHardBossBtn(HardBossId)
  for i, BtnHardBossLeve in ipairs(self.BtnHardBossLevelList) do
    if BtnHardBossLeve.HardBossId == HardBossId then
      self:OnClickedMainLevelItem(BtnHardBossLeve.UIIndex, BtnHardBossLeve.RegionID, BtnHardBossLeve.BornID)
      break
    end
  end
end

function WBP_MapLevelSelect_C:OnClickedAreaLevelItem(UIIndex, DungeonId)
  if DungeonId > 0 then
    self:RefreshAreaLevelItem(UIIndex)
  else
    self:RefreshAreaLevelItem(-1)
  end
  self:ClickToSelectLevel(DungeonId)
end

function WBP_MapLevelSelect_C:OnMainMapBgPress()
  self.MouseLoc = UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  self:AddTimer(0.01, self.OnTimerDragMainMapBg, true, 0, "OnTimerDragMainMapBg")
end

function WBP_MapLevelSelect_C:OnTimerDragMainMapBg()
  local TmpMouseLoc = UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  local OriginLoc = self:GetPosition(self.Prologue_Map_Main_New.Panel_Map)
  local SubLoc = self.MouseLoc - TmpMouseLoc
  self.MouseLoc = TmpMouseLoc
  if (OriginLoc - SubLoc).X < -self.MainMapBgMaxX then
    return
  elseif (OriginLoc - SubLoc).X > -self.MainMapBgMinX then
    return
  elseif (OriginLoc - SubLoc).Y > -self.MainMapBgMaxY then
    return
  elseif (OriginLoc - SubLoc).Y < -self.MainMapBgMinY then
    return
  end
  self:SetPosition(self.Prologue_Map_Main_New.Panel_Map, OriginLoc - SubLoc)
  self:SetPosition(self.Prologue_Map_Main_New.Panel_LevelsAndName, OriginLoc - SubLoc)
  self:SetPosition(self.Prologue_Map_Main_New.Panel_AreaName, OriginLoc - SubLoc)
end

function WBP_MapLevelSelect_C:OnMainMapBgRelease()
  self:RemoveTimer("OnTimerDragMainMapBg")
end

function WBP_MapLevelSelect_C:ClickToSelectLevel(DungeonId)
  if DungeonId < 0 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:LoadUI(UIConst.COMMONSCREENTOAST, "CommonScreenToast", UIConst.ZORDER_FOR_COMMON_TIP, DataMgr.ErrorCode[102].ErrorCodeContent, 1.5)
    return
  end
  if self.bInExploreMap and not self.bInMainMap then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    if not UIManger then
      goto lbl_39
    end
  else
  end
  ::lbl_39::
end

function WBP_MapLevelSelect_C:ClickToSelectRegion(RegionID, BornID)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_enter_level", nil, nil)
  if RegionID < 0 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:LoadUI(UIConst.COMMONSCREENTOAST, "CommonScreenToast", UIConst.ZORDER_FOR_COMMON_TIP, DataMgr.ErrorCode[102].ErrorCodeContent, 1.5)
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Avatar = GWorld:GetAvatar()
  if Avatar and GameMode then
    local Res = GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, RegionID, BornID)
    if Res then
      self:CloseUI()
    end
  else
    WorldTravelSubsystem(self):ChangeRegionByRegionId(RegionID)
  end
end

function WBP_MapLevelSelect_C:CloseUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil ~= UIManger then
    local UIObj = UIManger:GetUIObj("InteractiveUI")
    if nil ~= UIObj then
      UIObj:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  self:SetHardBossMapTipsClose()
  self:PlayAnimation(self.Page_out)
  self:Close()
  return true
end

function WBP_MapLevelSelect_C:InitMapUI()
  self:PlayAnimation(self.Page_in)
  self:SetUICollapsed(self.Prologue_Map_Level_Details)
  self.MainDetailsDungeonId = {-1, -1}
  self:SetUICollapsed(self.Prologue_Map_Area_Level_Dialog)
  self:SetUICollapsed(self.Prologue_Map_Area)
  self:SetUICollapsed(self.Prologue_Map_Area_Level)
  self.BtnChapterLevelList = {
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_1,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_2,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_3,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_4,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_5,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_6,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_7,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_8,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_9,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_10,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_11,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_12
  }
  self.BtnChapterNameList = {
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_1,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_2,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_3,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_4,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_5,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_6,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_7,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_8,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_9,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_10,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_11,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_12
  }
  self.BtnAreaList = {
    self.Prologue_Map_Area.Prologue_Map_Level_Area,
    self.Prologue_Map_Area.Prologue_Map_Level_Area_1,
    self.Prologue_Map_Area.Prologue_Map_Level_Area_2,
    self.Prologue_Map_Area.Prologue_Map_Level_Area_3
  }
  self.BtnExploreLevelList = {
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_1,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_2,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_3,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_4,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_5,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_6,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_7,
    self.Prologue_Map_Area_Level.Prologue_Map_Area_Level_Item_8
  }
  self.BtnHardBossLevelList = {
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_3,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Btn_11
  }
  self.BtnHardBossNameList = {
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_3,
    self.Prologue_Map_Main_New.Prologue_Map_Level_Name_11
  }
  for i = 1, #self.BtnHardBossLevelList do
    self.BtnHardBossLevelList[i].IsHardBoss = true
  end
  self.CurHardBossUIIndex = -1
  self.MainMapBgMaxX = self:GetPosition(self.BtnChapterLevelList[6]).X
  self.MainMapBgMinX = self:GetPosition(self.BtnChapterLevelList[10]).X
  self.MainMapBgMaxY = self:GetPosition(self.BtnChapterLevelList[5]).Y
  self.MainMapBgMinY = self:GetPosition(self.BtnChapterLevelList[8]).Y
  self:InitMainMap()
  self:InitPanelTips()
  self:InitChangeMapTip()
  self.Prologue_Map_Main_New.Parent = self
  self.Prologue_Map_Level_Details.Btn_Go:BindEventOnClicked(self, self.MainMapDetailsEnterBtnCallback)
  self:SetUICollapsed(self.Panel_Back)
end

function WBP_MapLevelSelect_C:InitChangeMapTip()
  self.Btn_Select_01.Key_Left:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Q"}
    }
  })
  self.Btn_Select_01.Key_Right:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "E"}
    }
  })
  self.Btn_Select_01.Tab_1:BindEventOnSwitchOn(self, self.MainMapBtnCallback)
  self.Btn_Select_01.Tab_1.Switcher_Tab:SetActiveWidgetIndex(0)
  self.Btn_Select_01.Tab_2:BindEventOnSwitchOn(self, self.ExploreMapBtnCallback)
  self.Btn_Select_01.Tab_2.Switcher_Tab:SetActiveWidgetIndex(1)
  self:SetUICollapsed(self.Btn_Select_01.Tab_3)
  self:SetUICollapsed(self.Btn_Select_01.Tab_4)
  self:SetUICollapsed(self.Btn_Select_01.Tab_5)
  self:SetUICollapsed(self.Btn_Select_02)
end

function WBP_MapLevelSelect_C:MainMapBtnCallback(_, _)
  if self.bInExploreMap then
    self.Prologue_Map_Area_Level:PlayAnimation(self.Prologue_Map_Area_Level.Level_out)
  else
    self.Prologue_Map_Area:PlayAnimation(self.Prologue_Map_Area.Area_out)
  end
  self:SetUICollapsed(self.Prologue_Map_Area)
  self:SetUICollapsed(self.Prologue_Map_Area_Level)
  self:InitMainMap()
end

function WBP_MapLevelSelect_C:ExploreMapBtnCallback(_, _)
  if self.bInExploreMap then
    self:SetUIVisible(self.Prologue_Map_Area_Level)
    self:SetUIVisible(self.VerticalBox_1)
    self:SetUICollapsed(self.Prologue_Map_Area)
    self.Prologue_Map_Area_Level:PlayAnimation(self.Prologue_Map_Area_Level.Level_in)
  else
    self:SetUICollapsed(self.VerticalBox_1)
  end
  self:SetUICollapsed(self.Prologue_Map_Main_New)
  self:SetUICollapsed(self.Prologue_Map_Level_Details)
  self:SetHardBossMapTipsClose()
  self.MainDetailsDungeonId = {-1, -1}
  self:InitExploreMap()
end

function WBP_MapLevelSelect_C:MainMapDetailsEnterBtnCallback(_, _)
  self:ClickToSelectRegion(self.MainDetailsDungeonId[1], self.MainDetailsDungeonId[2])
end

function WBP_MapLevelSelect_C:InitPanelTips()
  self:SetUICollapsed(self.Btn_BacktoLocation)
  self.Btn_BacktoLocation:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Tab"}
    },
    bLongPress = false,
    Desc = "\229\155\158\229\136\176\229\189\147\229\137\141\228\189\141\231\189\174"
  })
  self.Btn_Back:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Esc"}
    },
    bLongPress = false,
    Desc = GText("UI_BACK")
  })
  self.Btn_Back:AddExecuteLogic(self, self.BtnBackOnClick)
end

function WBP_MapLevelSelect_C:BtnBackOnClick(_)
  if self.bInExploreMap and not self.bInMainMap then
    self:BackToAreaMap()
    return
  end
  if self.bInMainMap and self.MainDetailsDungeonId[1] > 0 then
    self:OnClickedMainMapBtnCancel()
    return
  end
  self:CloseUI()
end

function WBP_MapLevelSelect_C:InitMainMap()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_chapter", nil, nil)
  self.LastSelectMainMapItemIndex = -1
  self:SetPosition(self.Prologue_Map_Main_New, FVector2D(0, 0))
  self:SetPosition(self.Prologue_Map_Main_New.Panel_LevelsAndName, FVector2D(0, 0))
  self:SetPosition(self.Prologue_Map_Main_New.Panel_Map, FVector2D(0, 0))
  self:SetPosition(self.Prologue_Map_Main_New.Panel_AreaName, FVector2D(0, 0))
  self.Btn_Select_01.Tab_2:SetSwitchOn(false)
  self:SetUIVisible(self.Prologue_Map_Main_New)
  self.Prologue_Map_Main_New:PlayAnimation(self.Prologue_Map_Main_New.Main_in)
  self.bInMainMap = true
  self.bInExploreMap = false
  local ChapterID = 1001
  local ChapterData = DataMgr.Chapter[ChapterID]
  local DungeonListData = ChapterData.DungeonList
  local RegionNameList = (ChapterData.RegionNameList or {})[1] or {}
  self.NowChapterId = ChapterID
  for i = 1, #self.BtnChapterNameList do
    self:SetUICollapsed(self.BtnChapterNameList[i])
    self:SetUICollapsed(self.BtnChapterLevelList[i])
  end
  for i = 1, #DungeonListData do
    local RegionName = RegionNameList[i] or DataMgr.SubRegion[DungeonListData[i][1]].SubRegionName
    self.BtnChapterNameList[i].Text_LevelName:SetText(GText(RegionName))
    self.BtnChapterLevelList[i].Parent = self
    self.BtnChapterLevelList[i].RegionID = DungeonListData[i][1]
    self.BtnChapterLevelList[i].BornID = DungeonListData[i][2]
    self.BtnChapterLevelList[i].UIIndex = i
    self:SetUIVisible(self.BtnChapterNameList[i])
    self:SetUIVisible(self.BtnChapterLevelList[i])
    self:SetUIVisible(self.BtnChapterLevelList[i].Btn_Level)
    self:SetUICollapsed(self.BtnChapterLevelList[i].Selected)
    self:SetUICollapsed(self.BtnChapterLevelList[i].Panel_Line)
    self:SetUICollapsed(self.BtnChapterLevelList[i].Panel_Line)
    self:SetUICollapsed(self.BtnChapterNameList[i].Text_Location)
    self:SetUICollapsed(self.BtnChapterNameList[i].Prologue_Map_Location_Role)
  end
  self:SetHardBossLevelItem()
end

function WBP_MapLevelSelect_C:RefreshMainLevelItem(bMoveCenter, MoveUIIndex)
  if MoveUIIndex > 0 then
    self:SetUIVisible(self.BtnChapterLevelList[MoveUIIndex].Selected)
    if bMoveCenter then
      self.BtnChapterLevelList[MoveUIIndex].KeepSelected = true
      self:SetUIVisible(self.BtnChapterLevelList[MoveUIIndex].Panel_Line)
    else
      self:SetUICollapsed(self.BtnChapterLevelList[MoveUIIndex].Panel_Line)
    end
  end
  if self.LastSelectMainMapItemIndex > 0 and self.LastSelectMainMapItemIndex ~= MoveUIIndex then
    self:SetUICollapsed(self.BtnChapterLevelList[self.LastSelectMainMapItemIndex].Selected)
    self:SetUICollapsed(self.BtnChapterLevelList[self.LastSelectMainMapItemIndex].Panel_Line)
    self.BtnChapterLevelList[self.LastSelectMainMapItemIndex].KeepSelected = false
  end
  self.LastSelectMainMapItemIndex = MoveUIIndex
end

function WBP_MapLevelSelect_C:InitExploreMap()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_chapter", nil, nil)
  self.bInMainMap = false
  self.LastSelectAreaItemIndex = -1
  self.LastSelectAreaLevelItemIndex = -1
  self.Btn_Select_01.Tab_1:SetSwitchOn(false)
  self:SetUICollapsed(self.Btn_BacktoLocation)
  if self.bInExploreMap then
    self:EnterArea(self.CurAreaID, false)
    self:PlayExploreAnim(false)
  else
    self:PlayExploreAnim(true)
    for i = 1, #self.BtnAreaList do
      if i <= #DataMgr.Area then
        local AreaData = DataMgr.Area[i]
        self.BtnAreaList[i].Parent = self
        self.BtnAreaList[i].AreaID = i
        self.BtnAreaList[i].Text_Name:SetText(GText(AreaData.ChapterName))
        self:SetUICollapsed(self.BtnAreaList[i].Img_Lock)
      else
        self.BtnAreaList[i].Parent = self
        self.BtnAreaList[i].AreaID = -1
        self:SetUIVisible(self.BtnAreaList[i].Img_Lock)
      end
      self:SetUICollapsed(self.BtnAreaList[i].Img_Hover)
      self:SetUICollapsed(self.BtnAreaList[i].Panel_InnerCircle)
      self:SetUICollapsed(self.BtnAreaList[i].Panel_OuterCircle)
    end
  end
end

function WBP_MapLevelSelect_C:RefreshAreaMap(UIIndex)
end

function WBP_MapLevelSelect_C:RefreshAreaLevelItem(UIIndex)
  if UIIndex > 0 then
    self.BtnExploreLevelList[UIIndex].KeepSelected = true
    self:SetUIVisible(self.BtnExploreLevelList[UIIndex].Img_Box)
    self:SetUIVisible(self.BtnExploreLevelList[UIIndex].Panel_Circle)
  end
  if self.LastSelectAreaLevelItemIndex > 0 and self.LastSelectAreaLevelItemIndex ~= UIIndex then
    self.BtnExploreLevelList[self.LastSelectAreaLevelItemIndex].KeepSelected = false
    self:SetUICollapsed(self.BtnExploreLevelList[self.LastSelectAreaLevelItemIndex].Img_Box)
    self:SetUICollapsed(self.BtnExploreLevelList[self.LastSelectAreaLevelItemIndex].Panel_Circle)
  end
  self.LastSelectAreaLevelItemIndex = UIIndex
end

function WBP_MapLevelSelect_C:SetUICollapsed(Item)
  Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_MapLevelSelect_C:SetUIVisible(Item)
  Item:SetVisibility(UIConst.VisibilityOp.Visible)
end

function WBP_MapLevelSelect_C:PlayExploreAnim(bOpenArea)
  if bOpenArea then
    self.Prologue_Map_Area:StopAnimation(self.Prologue_Map_Area.Area_out)
    self.Prologue_Map_Area:PlayAnimation(self.Prologue_Map_Area.Area_in)
    self.Prologue_Map_Area_Level:StopAnimation(self.Prologue_Map_Area_Level.Level_in)
    self.Prologue_Map_Area_Level:PlayAnimation(self.Prologue_Map_Area_Level.Level_out)
  else
    self.Prologue_Map_Area:StopAnimation(self.Prologue_Map_Area.Area_in)
    self.Prologue_Map_Area:PlayAnimation(self.Prologue_Map_Area.Area_out)
    self.Prologue_Map_Area_Level:StopAnimation(self.Prologue_Map_Area_Level.Level_out)
    self.Prologue_Map_Area_Level:PlayAnimation(self.Prologue_Map_Area_Level.Level_in)
  end
end

function WBP_MapLevelSelect_C:EnterArea(AreaID, bPlayAnim)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_chapter", nil, nil)
  if AreaID < 0 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:LoadUI(UIConst.COMMONSCREENTOAST, "CommonScreenToast", UIConst.ZORDER_FOR_COMMON_TIP, DataMgr.ErrorCode[101].ErrorCodeContent, 1.5)
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_level", nil, nil)
  self:PlayExploreAnim(false)
  self.CurAreaID = AreaID
  self.bInExploreMap = true
  self:SetUIVisible(self.Prologue_Map_Area_Level)
  if DataMgr.Area[AreaID] == nil then
    return
  end
  local DungeonListData = DataMgr.Area[AreaID].DungeonList
  for i = 1, #self.BtnExploreLevelList do
    if i <= #DungeonListData then
      self:SetUIVisible(self.BtnExploreLevelList[i])
      local DungeonID = DungeonListData[i]
      local DungeonName = DataMgr.Dungeon[DungeonID].DungeonName
      self.BtnExploreLevelList[i].Text_LevelName:SetText(GText(DungeonName))
      self.BtnExploreLevelList[i]:SetDungeonInfo(self, DungeonID, i)
      self.BtnExploreLevelList[i]:PlayAnimation(self.BtnExploreLevelList[i].UnLock)
    else
      self.BtnExploreLevelList[i]:SetDungeonInfo(self, -1, i)
      self.BtnExploreLevelList[i]:PlayAnimation(self.BtnExploreLevelList[i].Locked)
    end
    self.BtnExploreLevelList[i].KeepSelected = false
    self:SetUICollapsed(self.BtnExploreLevelList[i].Img_Box)
    self:SetUICollapsed(self.BtnExploreLevelList[i].Panel_Circle)
  end
end

function WBP_MapLevelSelect_C:BackToAreaMap()
  self.bInExploreMap = false
  self.CurAreaID = -1
  self:ClickToChangeMapTab(1)
  self:PlayExploreAnim(true)
  self:SetUICollapsed(self.Prologue_Map_Area_Level)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_chapter", nil, nil)
end

function WBP_MapLevelSelect_C:OnMatchStateChanged()
end

function WBP_MapLevelSelect_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    if UIManager(self):GetUI("DungeonDetail") then
      UIManager(self):UnLoadUI("DungeonDetail")
    end
    self:BtnBackOnClick()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_MapLevelSelect_C:SelectTrackingQuestRegion()
  local BtnChapterLevel = self:GetTrackingQuestRegionButton()
  if BtnChapterLevel then
    self:OnClickedMainLevelItem(BtnChapterLevel.UIIndex, BtnChapterLevel.RegionID, BtnChapterLevel.BornID)
    local Path = "/Game/UI/UI_PC/Common/Common_GuidePoint_PC.Common_GuidePoint_PC_C"
    local GuidePointWidget = UE4.UWidgetBlueprintLibrary.Create(self, LoadClass(Path))
    BtnChapterLevel.Level_Btn:AddChildToCanvas(GuidePointWidget)
    BtnChapterLevel.CommonGuidePoint = GuidePointWidget
    GuidePointWidget.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    GuidePointWidget.vx_Light:SetVisibility(UE4.ESlateVisibility.Collapsed)
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GuidePointWidget)
    CanvasSlot:SetPosition(FVector2D(30, 80))
    GuidePointWidget:PlayAnimation(GuidePointWidget.Loop, 0, 0)
  end
end

function WBP_MapLevelSelect_C:GetTrackingQuestRegionButton()
  local EMCache = require("EMCache.EMCache")
  local RegionID = EMCache:Get("TrackingQuestRegionId", true)
  if not RegionID or RegionID <= 0 then
    return
  end
  for _, BtnChapterLevel in ipairs(self.BtnChapterLevelList) do
    if BtnChapterLevel.RegionID == RegionID then
      return BtnChapterLevel
    end
  end
end

function WBP_MapLevelSelect_C:RemoveTrackingFromButton()
  local BtnChapterLevel = self:GetTrackingQuestRegionButton()
  if BtnChapterLevel then
    BtnChapterLevel.Level_Btn:RemoveChild(BtnChapterLevel.CommonGuidePoint)
  end
end

function WBP_MapLevelSelect_C:CloseSelf()
  UIManager(self):UnLoadUI("DungeonDetail")
  self:Close()
end

return WBP_MapLevelSelect_C
