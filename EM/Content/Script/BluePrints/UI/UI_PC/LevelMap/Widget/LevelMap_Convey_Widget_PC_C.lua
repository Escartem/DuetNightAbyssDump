require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UGameplayStatics.GetPlayerController(self, 0))
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
end

function M:Destruct()
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
end

function M:InitialTempleAndPartyInfo(Temples, TelepointIcon, RegionIcon)
  if #Temples >= 4 then
    error("WBP_Map_Convey\228\184\173\232\166\129\229\138\160\232\189\189\231\154\132\231\165\158\229\186\153/\230\180\190\229\175\185\230\149\176\233\135\143\232\182\133\232\191\135\233\162\132\232\174\190\232\147\157\229\155\190\230\149\176")
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  for i = 1, #Temples do
    self["WBP_LevelMap_TempleConveyItem_" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    
    local function Callback()
      self.WildMap:ClosePanel()
    end
    
    local TempleInfo = {
      Name = "",
      PassInfo = "",
      TempleId = Temples[i],
      Star = 0,
      ConditionId = 0,
      CloseFunc = Callback
    }
    local DungeonInfo = DataMgr.Dungeon[Temples[i]]
    if not DungeonInfo then
      self.Group_Temple:SetVisibility(ESlateVisibility.Collapsed)
      error("Region\232\161\168\228\184\173\233\133\141\231\189\174\228\186\134\228\184\141\229\173\152\229\156\168\231\154\132\231\165\158\229\186\153ID\239\188\140\233\148\153\232\175\175\231\154\132\231\165\158\229\186\153ID\239\188\154" .. Temples[i])
    end
    local Conditions = DungeonInfo.Condition
    local CompleteCondition = true
    if Conditions and #Conditions > 0 then
      CompleteCondition = ConditionUtils.CheckCondition(Avatar, Conditions[1])
      TempleInfo.ConditionId = Conditions[1]
    end
    local Name = GText(DungeonInfo.DungeonName)
    TempleInfo.Name = Name
    TempleInfo.IsStarLevel = false
    local Temple = DataMgr.Temple[Temples[i]] or DataMgr.Party[Temples[i]]
    if #Temple.RewardId > 1 then
      TempleInfo.IsStarLevel = true
    end
    if not Temple.RewardId then
      TempleInfo.PassInfo = "NoConfigReward"
    elseif not Avatar.Dungeons[Temples[i]] then
      TempleInfo.PassInfo = self:CheckStatus(i, Temples)
    elseif not Avatar.Dungeons[Temples[i]].IsPass then
      TempleInfo.PassInfo = "NoPass"
    elseif 1 == #Temple.RewardId then
      TempleInfo.PassInfo = "PassNoStar"
    else
      TempleInfo.PassInfo = "PassStar"
      TempleInfo.Star = Avatar.Dungeons[Temples[i]].MaxStar
    end
    if Avatar.InSpecialQuest and TempleInfo.PassInfo ~= "Lock" then
      TempleInfo.PassInfo = "InSpecialQuest"
    end
    if not CompleteCondition and TempleInfo.PassInfo ~= "Lock" then
      TempleInfo.PassInfo = "NoCompleteCondition"
    end
    self["WBP_LevelMap_TempleConveyItem_" .. i]:ShowTempleInfo(TempleInfo)
    self["WBP_LevelMap_TempleConveyItem_" .. i]:SetNavigationRuleBase(EUINavigation.Down, i == #Temples and EUINavigationRule.Stop or EUINavigationRule.Escape)
  end
  for i = #Temples + 1, 3 do
    self["WBP_LevelMap_TempleConveyItem_" .. i]:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Img_GuidePoint_Icon:SetBrushFromTexture(TelepointIcon)
  if RegionIcon then
    local Icon = LoadObject(RegionIcon)
    if Icon then
      self.Icon_Camp:SetBrushFromTexture(Icon)
    end
  end
  if #Temples > 0 then
    table.insert(self.WildMap.MainMap.BackGamePadKey, 1, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("UI_RegionMap_SeeTemple")
    })
    self.WildMap.MainMap:UpdateWildMapKeys()
  end
end

function M:InitWildMap(WildMap)
  self.WildMap = WildMap
end

function M:CheckStatus(i, Temples)
  local PassInfo
  if 1 == i then
    PassInfo = "NoEnterInfo"
  else
    local Avatar = GWorld:GetAvatar()
    if not Avatar.Dungeons[Temples[i - 1]] then
      PassInfo = "Lock"
    elseif not Avatar.Dungeons[Temples[i - 1]].IsPass then
      PassInfo = "Lock"
    else
      PassInfo = "NoEnterInfo"
    end
  end
  return PassInfo
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self.Switch_Button:GetActiveWidget():OnBtnClicked()
  elseif "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.Focused then
      self:RemoveKey()
      self.WildMap:ClosePanel()
    else
      self.Group_Temple:SetVisibility(ESlateVisibility.HitTestInvisible)
      self:SetFocus()
    end
  elseif InKeyName == UIConst.GamePadKey.RightThumb and (self.Group_Temple:GetVisibility() == ESlateVisibility.SelfHitTestInvisible or self.Group_Temple:GetVisibility() == ESlateVisibility.HitTestInvisible) then
    self.Group_Temple:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WBP_LevelMap_TempleConveyItem_1:SetFocus()
    self.Focused = false
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Focused = true
  return UWidgetBlueprintLibrary.Handled()
end

function M:RemoveKey()
  if self.WildMap.MainMap.BackGamePadKey[1].KeyInfoList[1].ImgShortPath == "RS" then
    table.remove(self.WildMap.MainMap.BackGamePadKey, 1)
    self.WildMap.MainMap:UpdateWildMapKeys()
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self.Group_Temple:GetVisibility() == ESlateVisibility.Collapsed then
    return
  end
  self.Group_Temple:SetVisibility(CurInputDevice == ECommonInputType.Gamepad and ESlateVisibility.HitTestInvisible or ESlateVisibility.SelfHitTestInvisible)
  self:SetFocus()
end

return M
