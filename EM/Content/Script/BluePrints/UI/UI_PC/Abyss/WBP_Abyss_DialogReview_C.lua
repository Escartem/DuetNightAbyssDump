require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  self.ListKeyToWidget = {
    CharId = "Character",
    MeleeWeaponId = "Melee",
    RangedWeaponId = "Range",
    PetId = "Pet",
    PhantomId1 = "Phantom01",
    PhantomWeaponId1 = "Phantom_Weapon01",
    PhantomId2 = "Phantom02",
    PhantomWeaponId2 = "Phantom_Weapon02"
  }
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.Text_TimeTitle:SetText(GText("Abyss_SeasonReview_SeasonTime"))
  self.Text_StarTitle:SetText(GText("Abyss_SeasonReview_RewardProgress"))
  self.Text_LevelTitle:SetText(GText("Abyss_SeasonReview_BestLevel"))
  self.Text_TeamTitle:SetText(GText("Abyss_SeasonReview_BestParty"))
  local Avatar = GWorld:GetAvatar()
  self.SeasonId = Params.SeasonId
  self.AbyssId = Params.AbyssId
  local StartTime = DataMgr.AbyssSeasonList[self.SeasonId].AbyssStartTime
  local EndTime = DataMgr.AbyssSeasonList[self.SeasonId].AbyssEndTime
  self.Time01:SetTimeText(StartTime, UIConst.EnumTimeStyleType.YMD)
  self.Time02:SetTimeText(EndTime, UIConst.EnumTimeStyleType.YMD)
  local SeasonName = DataMgr.AbyssSeasonList[self.SeasonId].AbyssSeasonName
  self.Text_Season:SetText(GText(SeasonName))
  local RotateAbyss = DataMgr.AbyssSeasonList[self.SeasonId].Abyss.Rotate
  local InfiniteAbyss = DataMgr.AbyssSeasonList[self.SeasonId].Abyss.Infinite
  local StarNum = Avatar.Abysses[RotateAbyss]:GetAllPassRoomCount() + Avatar.Abysses[InfiniteAbyss]:GetAllPassRoomCount()
  self.Text_Star:SetText(StarNum)
  local MaxLevel = Avatar.Abysses[self.AbyssId].MaxAbyssProgress[1]
  local MaxLevelText = string.format(GText("Abyss_LevelName"), MaxLevel)
  local AbyssName = GText(DataMgr.AbyssSeason[self.AbyssId].AbyssIdName)
  self.Text_Level:SetText(AbyssName .. "/" .. MaxLevelText)
  self.Text_Level01:SetText(GText("Abyss_DungeonA"))
  self.Text_Level02:SetText(GText("Abyss_DungeonB"))
  local FastestTeamList = Avatar.Abysses[self.AbyssId].FastestTeamList
  for i = 1, 2 do
    if not FastestTeamList[i] then
      self["Team0" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self["Text_Level0" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      local TeamData = FastestTeamList[i].UnitIdList
      for Id, Widget in pairs(self.ListKeyToWidget) do
        if not TeamData[Id] or -1 == TeamData[Id] then
          self["Team0" .. i][Widget]:SetVisibility(UIConst.VisibilityOp.Collapsed)
        else
          local Icon
          if string.match(Id, "Char") or string.match(Id, "PhantomId") then
            Icon = DataMgr.Char[TeamData[Id]].Icon
          elseif string.match(Id, "Weapon") then
            Icon = DataMgr.Weapon[TeamData[Id]].Icon
          elseif string.match(Id, "Pet") then
            Icon = DataMgr.Pet[TeamData[Id]].Icon
          end
          self["Team0" .. i][Widget]:SetIcon(Icon)
          self["Team0" .. i][Widget].Icon_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
          self["Team0" .. i][Widget]:UnBindButtonPerformances()
        end
      end
    end
  end
  self:AddTimer(0.01, function()
    if UIUtils.CheckScrollBoxCanScroll(self.ScrollBox_Review) then
      self:ShowGamepadScrollBtn(true)
    else
      self:ShowGamepadScrollBtn(false)
    end
  end)
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.ScrollBox_Review:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset + AddOffset, 0, self.ScrollBox_Review:GetScrollOffsetOfEnd())
    self.ScrollBox_Review:SetScrollOffset(ScrollOffset)
  end
end

function M:BP_GetDesiredFocusTarget()
  return self.Owner:SetFocus()
end

return M
