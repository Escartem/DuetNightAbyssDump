require("UnLua")
local M = {}

function M.JumpToTaskPanelByQuestChainId(QuestChainId)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local PlayerAvatar = GWorld:GetAvatar()
  local SystemUI = DataMgr.SystemUI.TaskPanel
  if SystemUI and SystemUI.System then
    local UIUnlockRuleInfo = DataMgr.UIUnlockRule[SystemUI.System]
    if UIUnlockRuleInfo and UIUnlockRuleInfo.OpenConditionId then
      local IsCanOpen, FailedIdIndex = PlayerAvatar:CheckSystemUICanOpen(UIUnlockRuleInfo.UIUnlockRuleId)
      if not IsCanOpen then
        local OpenConditionId = UIUnlockRuleInfo.OpenConditionId
        local OpenDescs = UIUnlockRuleInfo.OpenSystemDesc
        if #OpenConditionId == #OpenDescs then
          for _, Value in pairs(FailedIdIndex) do
            UIManager:ShowUITip(UIConst.Tip_CommonToast, OpenDescs[Value])
          end
        else
          UIManager:ShowUITip(UIConst.Tip_CommonToast, OpenDescs[1])
        end
        return
      end
    end
  end
  local JumpToPageUIName = "TaskPanel"
  local TargetUIPage = UIManager:GetUIObj(JumpToPageUIName)
  if not TargetUIPage then
    TargetUIPage = UIManager:LoadUINew(JumpToPageUIName, QuestChainId)
    UIManager:AddToJumpPageDeque(TargetUIPage)
  else
    UIManager:PlaceJumpUIToTop(TargetUIPage, JumpToPageUIName)
  end
end

function M.JumpToRegionMapByTeleportId(_TeleportId)
  local TeleportId = tonumber(_TeleportId)
  DebugPrint("JumpToRegionMapByTeleportId, TeleportId", TeleportId)
  if not TeleportId then
    return
  end
  local SubRegionId = DataMgr.TeleportPoint[TeleportId].TeleportPointSubRegion
  local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
  if RegionId then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:LoadUINew("LevelMapMain", false, RegionId, "TeleportPoint", TeleportId)
  end
end

function M.JumpToRegionMapByRegionPointId(_RegionPointId)
  local RegionPointId = tonumber(_RegionPointId)
  DebugPrint("JumpToRegionMapByRegionPointId, RegionPointId", RegionPointId)
  if not RegionPointId then
    return
  end
  local SubRegionId = DataMgr.RegionPoint[RegionPointId].SubRegion
  local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
  if RegionId then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:LoadUINew("LevelMapMain", false, RegionId, "RegionPoint", RegionPointId)
  end
end

function M.JumpToArmory(MainTab, SubTab, Id)
  local Params = {}
  local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  if "Character" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Char
  elseif "MeeleWeapon" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Melee
  elseif "RangedWeapon" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Ranged
  elseif "UWeapon" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.UWeapon
  elseif "Pet" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Pet
  elseif "BattleWheel" == MainTab then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.BattleWheel
  end
  if "Attr" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Attribute
  elseif "Skill" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Skill
  elseif "CardLevelUp" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Grade
  elseif "Accessory" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Appearance
  elseif "Info" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Files
  elseif "Mod" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Attribute
    Params.SubPageName = ArmoryUtils.ArmorySubPageName.Mod
  elseif "Entry" == SubTab then
    Params.SubTabName = ArmoryUtils.ArmorySubTabNames.Entry
  elseif "Wheel1" == SubTab then
    Params.BattleWheelIndex = 1
  elseif "Wheel2" == SubTab then
    Params.BattleWheelIndex = 2
  elseif "Wheel3" == SubTab then
    Params.BattleWheelIndex = 3
  end
  Params.SelectedTargetId = tonumber(Id)
  local UIName = "ArmoryMain"
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("OpenSystemUI")
  Flow.OnBegin:Add(Flow, function()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local TargetUIPage = UIManager:GetUIObj(UIName)
    if not TargetUIPage then
      TargetUIPage = UIManager:LoadUINew(UIName, Params)
      UIManager:AddToJumpPageDeque(TargetUIPage)
      UIManager:AddFlow(UIName, Flow)
    else
      UIManager:PlaceJumpUIToTop(TargetUIPage, UIName)
      FlowManager:RemoveFlow(Flow)
    end
  end)
  FlowManager:AddFlow(Flow)
end

return M
