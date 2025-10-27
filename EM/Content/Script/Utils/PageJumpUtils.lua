require("UnLua")
local PageJumpFunctionLibrary = require("Utils.PageJumpFunctionConfig")
local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")
local PageJumpUtils = {}

function PageJumpUtils:GetItemAccess(ItemWidget, ItemId, ItemType, AccessKey, UIName, ReturnCallBack)
  local AccessData = DataMgr.Access[AccessKey]
  assert(AccessData, "\230\137\190\228\184\141\229\136\176AccessData\239\188\154" .. AccessKey)
  local AccessText = GText(AccessData.AccessText)
  self.UIPageName = nil
  if UIName then
    self.UIPageName = UIName
  elseif ItemWidget.UIName then
    self.UIPageName = ItemWidget.UIName
  end
  local ShopType
  if string.sub(AccessKey, 1, 5) == "Shop_" and "Shop_Pack" ~= AccessKey then
    ShopType = AccessData.AccessParam
    AccessKey = "Shop"
  end
  local CommonParam = {}
  CommonParam.ItemWidget = ItemWidget
  CommonParam.AccessKey = AccessKey
  CommonParam.AccessText = AccessText
  CommonParam.UIName = self.UIPageName
  CommonParam.UIUnlockRuleId = AccessData.UIUnlockRuleId
  CommonParam.AccessParam = AccessData.AccessParam
  if AccessData.AccessRule == "InterfaceJump" then
    local AccessItem = self:CreateAccessItem(ItemWidget, AccessKey)
    AccessItem.Text_Method:SetText(GText(AccessText))
    AccessItem.Text_Method02:SetText(GText(AccessText))
    AccessItem.Text_Method01:SetText(GText(AccessText))
    local InterfaceJumpId = tonumber(AccessData.AccessParam)
    if not DataMgr.InterfaceJump[InterfaceJumpId] then
      return
    end
    local PlayerAvatar = GWorld:GetAvatar()
    AccessItem.IsText = false
    AccessItem.IsInteractive = true
    AccessItem.IsUnLock = false
    AccessItem.Switch_Type:SetActiveWidgetIndex(0)
    if not ConditionUtils.CheckCondition(PlayerAvatar, DataMgr.InterfaceJump[InterfaceJumpId].PortalUnlockCondition) then
      AccessItem.IsUnLock = true
      AccessItem.Switch_Type:SetActiveWidgetIndex(1)
    else
      local GameInstance = GWorld.GameInstance
      local UIManager = GameInstance:GetGameUIManager()
      local bIsCanOpen, FailedIdIndex = PlayerAvatar:CheckSystemUICanOpen(AccessData.UIUnlockRuleId)
      if bIsCanOpen then
        if self.UIPageName and DataMgr.SystemUI[self.UIPageName] and DataMgr.SystemUI[self.UIPageName].IsBanAccess then
          function AccessItem.JumpFunc()
            UIManager:ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
          end
        else
          function AccessItem.JumpFunc()
            self:JumpToTargetPageByJumpId(InterfaceJumpId)
          end
        end
      else
        local OpenConditionId = DataMgr.UIUnlockRule[AccessData.UIUnlockRuleId].OpenConditionId
        local OpenDescs = DataMgr.UIUnlockRule[AccessData.UIUnlockRuleId].OpenSystemDesc
        local ToastContent
        if #OpenConditionId == #OpenDescs then
          for _, Value in pairs(FailedIdIndex) do
            ToastContent = OpenDescs[Value]
          end
        else
          ToastContent = OpenDescs[1]
        end
        
        function AccessItem.JumpFunc()
          UIManager:ShowUITip("CommonToastMain", ToastContent)
        end
      end
    end
    ItemWidget.Method:AddChild(AccessItem)
    return
  end
  if "Dungeon" == AccessKey or "MonsterStrong" == AccessKey then
    local bFromPlay = false
    if self.UIPageName == "StyleOfPlay" then
      bFromPlay = true
    end
    self:CreateJumpToDungeonAccess(CommonParam, ItemType, ItemId, bFromPlay)
    return
  end
  if string.sub(AccessKey, 1, 14) == "Dungeon_ModTab" then
    self:CreateJumpToDungeonModAccess(CommonParam, ItemType, ItemId)
    return
  end
  local AccessItem = self:CreateAccessItem(ItemWidget, AccessKey)
  AccessItem.Btn_Click:SetVisibility(ESlateVisibility.Visible)
  if "Shop_Pack" == AccessKey then
    if not DataMgr.ShopItem2RewardPack[ItemType] or not DataMgr.ShopItem2RewardPack[ItemType][ItemId] then
      return
    end
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local ResItemData
    for _, ItemData in ipairs(DataMgr.ShopItem2RewardPack[ItemType][ItemId]) do
      local AccessItem = self:CreateAccessItem(ItemWidget, AccessKey)
      if Avatar:CheckShopItemCanPurchase(ItemData.ShopItemId) and (not ResItemData or not (ResItemData.TypeId < ItemData.TypeId)) then
        ResItemData = ItemData
      end
    end
    if not ResItemData then
      return
    end
    local res, JumpToPage = self:CreateJumpToShopAccess("Reward", ResItemData.ShopType, ResItemData.TypeId, nil, ReturnCallBack)
    if not res then
      return
    end
    self:ProcessAccessItem(AccessItem, AccessText, self.UIPageName, AccessData.UIUnlockRuleId, JumpToPage)
    ItemWidget.Method:AddChild(AccessItem)
    return
  end
  if "Shop" == AccessKey then
    CommonParam.AccessItem = AccessItem
    local res, JumpToPage = self:CreateJumpToShopAccess(ItemType, ShopType, ItemId, CommonParam, ReturnCallBack)
    if not res then
      return
    end
    ItemWidget.Method:AddChild(CommonParam.AccessItem)
    return
  end
  if "Walnut" == AccessKey then
    self:CreateJumpToWalnutBag(CommonParam, ItemType, ItemId)
    return
  end
  if "Forging" == AccessKey then
    local res, JumpToPage = self:CreateJumpToForge(AccessItem, ItemType, ItemId)
    if not res then
      return
    end
    self:ProcessAccessItem(AccessItem, AccessText, self.UIPageName, AccessData.UIUnlockRuleId, JumpToPage, nil, nil, true)
    ItemWidget.Method:AddChild(AccessItem)
    return
  end
  if "Home" == AccessKey then
    local res, JumpToPage = self:CreateJumpToHome(AccessItem)
    if not res then
      return
    end
    self:ProcessAccessItem(AccessItem, AccessText, self.UIPageName, AccessData.UIUnlockRuleId, JumpToPage)
    ItemWidget.Method:AddChild(AccessItem)
    return
  end
  self:ProcessAccessItem(AccessItem, AccessText, self.UIPageName, AccessData.UIUnlockRuleId, nil)
  AccessItem.Btn_Click:SetVisibility(ESlateVisibility.Collapsed)
  ItemWidget.Method:AddChild(AccessItem)
end

function PageJumpUtils:CreateAccessItem(ItemWidget, AccessKey)
  local AccessItem = ItemWidget:CreateWidgetNew("ItemDetailAccess")
  AccessItem.Parent = ItemWidget
  AccessItem.Access = AccessKey
  AccessItem.IsUnLock = true
  if string.sub(AccessKey, 1, 5) == "Text_" then
    AccessItem.IsText = true
  end
  return AccessItem
end

function PageJumpUtils:ProcessAccessItem(AccessItem, AccessText, UIName, UIUnlockRuleId, JumpPageFunc, CustomCheckUnlock, CustomCheckUnlockParma, bNotCheck)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  AccessItem.Text_Method:SetText(GText(AccessText))
  AccessItem.Text_Method02:SetText(GText(AccessText))
  AccessItem.Text_Method01:SetText(GText(AccessText))
  if not UIName then
    DebugPrint("ZDX UIName is nil")
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not UIUnlockRuleId then
    AccessItem.Switch_Type:SetActiveWidgetIndex(2)
    return
  end
  local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
  if not bUnlocked then
    AccessItem.Text_Method:SetText(GText("UI_Npc_Name_Wenhao"))
    AccessItem.Text_Method02:SetText(GText("UI_Npc_Name_Wenhao"))
    AccessItem.Text_Method01:SetText(GText("UI_Npc_Name_Wenhao"))
    AccessItem.IsText = true
    AccessItem.IsUnLock = true
    AccessItem.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  if JumpPageFunc then
    AccessItem.IsInteractive = true
    AccessItem.Switch_Type:SetActiveWidgetIndex(0)
    local bIsCanOpen, FailedIdIndex = Avatar:CheckSystemUICanOpen(UIUnlockRuleId)
    if bIsCanOpen or bNotCheck then
      if not DataMgr.SystemUI[UIName] then
        DebugPrint("\228\188\160\229\133\165\231\154\132UIName\230\156\170\229\156\168SystemUI\228\184\173\230\137\190\229\136\176\239\188\154", UIName)
      elseif DataMgr.SystemUI[UIName].IsBanAccess then
        function JumpPageFunc()
          UIManager:ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
        end
      end
    else
      local OpenConditionId = DataMgr.UIUnlockRule[UIUnlockRuleId].OpenConditionId
      local OpenDescs = DataMgr.UIUnlockRule[UIUnlockRuleId].OpenSystemDesc
      local ToastContent
      if #OpenConditionId == #OpenDescs then
        for _, Value in pairs(FailedIdIndex) do
          ToastContent = OpenDescs[Value]
        end
      else
        ToastContent = OpenDescs[1]
      end
      
      function JumpPageFunc()
        UIManager:ShowUITip("CommonToastMain", ToastContent)
      end
    end
    AccessItem.JumpFunc = JumpPageFunc
  else
    AccessItem.IsText = true
    AccessItem.IsInteractive = false
    AccessItem.Switch_Type:SetActiveWidgetIndex(2)
  end
  if CustomCheckUnlock then
    CustomCheckUnlock(AccessItem, UIName)
  end
end

function PageJumpUtils:CloseFrontDialog()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local CommonDialog = UIManager:GetUI("CommonDialog")
  if CommonDialog then
    if CommonDialog.CloseBtnCallbackFunction then
      local Data = CommonDialog:PackageResult()
      CommonDialog.CloseBtnCallbackFunction(CommonDialog.CloseBtnCallbackObj, Data)
    end
    CommonDialog:Close()
  end
  local WalnutRewardDialog = UIManager:GetUI("WalnutRewardDialog")
  if WalnutRewardDialog then
    WalnutRewardDialog:Close()
  end
  local PurchasePackageDialog = UIManager:GetUI("PayGiftPopup_Yellow") or UIManager:GetUI("PayGiftPopup_Purple")
  if PurchasePackageDialog then
    PurchasePackageDialog:Close()
  end
  local ForgePathDialog = UIManager:GetUI("ForgePathView")
  if ForgePathDialog then
    ForgePathDialog:Close()
  end
  local FeinaRewardPage = UIManager:GetUI("FeinaEventReward")
  if FeinaRewardPage then
    FeinaRewardPage:Close()
  end
end

function PageJumpUtils:SortAccessItem(ItemsContainer)
  local AccessItems = ItemsContainer:GetAllChildren():ToTable()
  for i = 1, #AccessItems do
    AccessItems[i].Index = i
  end
  ItemsContainer:ClearChildren()
  table.sort(AccessItems, function(A, B)
    if A.IsUnLock and B.IsUnLock then
      if A.IsText and B.IsText then
        return A.Index < B.Index
      end
      if A.IsText or B.IsText then
        return not A.IsText
      end
      return A.Index < B.Index
    end
    if A.IsUnLock or B.IsUnLock then
      return not A.IsUnLock
    end
    if A.IsText and B.IsText then
      return A.Index < B.Index
    end
    if A.IsText or B.IsText then
      return not A.IsText
    end
    return A.Index < B.Index
  end)
  for _, Item in pairs(AccessItems) do
    ItemsContainer:AddChild(Item)
  end
end

function PageJumpUtils:CreateJumpToDungeonAccess(CommonParam, ItemType, ItemId, bFromPlay)
  local DungeonAccess
  local DungeonList = {}
  local DeputeType = 1
  if CommonParam.AccessKey == "Dungeon" then
    DungeonAccess = DataMgr.Resource2Dungeon[ItemType][ItemId]
    if not DungeonAccess then
      return
    end
    local DungeonId = self:GetAccessDungeon(DungeonAccess)
    table.insert(DungeonList, DungeonId)
  else
    DeputeType = 2
    DungeonAccess = DataMgr.Reward2MonsterDungeon[ItemType][ItemId]
    if not DungeonAccess then
      return
    end
    for _, v in pairs(DungeonAccess) do
      table.insert(DungeonList, v)
    end
    table.sort(DungeonList, function(a, b)
      return a.DungeonId < b.DungeonId
    end)
  end
  for _, Value in ipairs(DungeonList) do
    local AccessItem = self:CreateAccessItem(CommonParam.ItemWidget, CommonParam.AccessKey)
    local DungeonInfo = DataMgr.Dungeon
    local DungeonId, MonsterId, DungeonAccessText
    if CommonParam.AccessKey == "Dungeon" then
      DungeonId = Value
      assert(DungeonInfo[DungeonId], "\230\137\190\228\184\141\229\136\176DungeonInfo[" .. DungeonId .. "]")
      DungeonAccessText = CommonParam.AccessText .. GText(DungeonInfo[DungeonId].DungeonName)
    elseif CommonParam.AccessKey == "MonsterStrong" then
      DungeonId = Value.DungeonId
      MonsterId = Value.MonsterId
      assert(DungeonInfo[DungeonId], "\230\137\190\228\184\141\229\136\176DungeonInfo[" .. DungeonId .. "]")
      DungeonAccessText = GText(DataMgr.Monster[DataMgr.ModDungeonMonReward[MonsterId].MonsterUnitId].UnitName) .. " Lv." .. DataMgr.Dungeon[DungeonId].DungeonLevel
    end
    
    local function JumpToPage()
      self:JumpToDungeonPage(DungeonId, DeputeType, MonsterId, bFromPlay)
    end
    
    local function CustomCheckUnlock(AccessItem, UIName)
      if AccessItem.IsInteractive == true and (self:CheckDungeonCondition(DungeonInfo[DungeonId].Condition) == false or DataMgr.Dungeon2Select[DungeonId] and false == self:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DungeonId]].Condition) or DataMgr.Dungeon2SubDungeon[DungeonId] and DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[DungeonId]] and false == self:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[DungeonId]]].Condition)) then
        AccessItem.IsInteractive = false
        AccessItem.IsUnLock = true
        AccessItem.Switch_Type:SetActiveWidgetIndex(1)
        
        local function CheckDungeon()
          if DataMgr.Dungeon2Select[DungeonId] then
            if self:CheckDungeonCondition(DungeonInfo[DungeonId].Condition, true) then
              self:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DungeonId]].Condition, true)
            end
          elseif DataMgr.Dungeon2SubDungeon[DungeonId] and self:CheckDungeonCondition(DungeonInfo[DungeonId].Condition, true) then
            self:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[DungeonId]]].Condition, true)
          end
        end
        
        AccessItem.JumpFunc = CheckDungeon
        if DataMgr.SystemUI[UIName] and not DataMgr.SystemUI[UIName].IsBanAccess then
          AccessItem.JumpFunc = CheckDungeon
        end
      end
    end
    
    self:ProcessAccessItem(AccessItem, DungeonAccessText, CommonParam.UIName, CommonParam.UIUnlockRuleId, JumpToPage, CustomCheckUnlock)
    CommonParam.ItemWidget.Method:AddChild(AccessItem)
  end
end

function PageJumpUtils:CreateJumpToDungeonModAccess(CommonParam, ItemType, ItemId)
  assert(DataMgr.ModSelectDungeon[CommonParam.AccessParam], "Mod\229\167\148\230\137\152\230\156\172\233\133\141\231\189\174\229\143\130\230\149\176\233\148\153\232\175\175, ", CommonParam.AccessKey)
  local AccessItem = self:CreateAccessItem(CommonParam.ItemWidget, CommonParam.AccessKey)
  local DungeonAccessText = GText(CommonParam.AccessText) .. " Lv." .. GText(CommonParam.AccessParam)
  local JumpToPage
  
  function JumpToPage()
    self:CloseFrontDialog()
    if CommonParam.UIName == "DeputeDetail" then
      local GameInstance = GWorld.GameInstance
      local UIManager = GameInstance:GetGameUIManager()
      local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
      if StyleOfPlay.CurTabId == "DungeonSelect" then
        StyleOfPlay.CurSubUI.IsFromJump = false
      end
    end
    self:JumpToStyleOfPlaySubUI("NewDeputeRoot", "NightBook", CommonParam.AccessParam)
  end
  
  local function CustomCheckUnlock(AccessItem, UIName)
    if AccessItem.IsInteractive == true and not self:CheckDungeonCondition(DataMgr.ModSelectDungeon[CommonParam.AccessParam].Condition) then
      AccessItem.IsInteractive = false
      AccessItem.IsUnLock = false
      AccessItem.Switch_Type:SetActiveWidgetIndex(1)
      
      local function CheckDungeon()
        PageJumpUtils:CheckDungeonCondition(DataMgr.ModSelectDungeon[CommonParam.AccessParam].Condition, true)
      end
      
      AccessItem.JumpFunc = CheckDungeon
      if DataMgr.SystemUI[UIName] and not DataMgr.SystemUI[UIName].IsBanAccess then
        AccessItem.JumpFunc = CheckDungeon
      end
    end
  end
  
  self:ProcessAccessItem(AccessItem, DungeonAccessText, CommonParam.UIName, CommonParam.UIUnlockRuleId, JumpToPage, CustomCheckUnlock)
  CommonParam.ItemWidget.Method:AddChild(AccessItem)
end

function PageJumpUtils:GetAccessDungeon(DungeonAccess)
  local IsDungeonUnlocked = false
  local MaxLevelDungeonId, MinLevelDungeonId
  local MaxLevel, MinLevel = 0, 999
  local DungeonData = DataMgr.Dungeon
  for _, DungeonId in pairs(DungeonAccess) do
    if DataMgr.Dungeon2Select[DungeonId] or DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[DungeonId]] then
      if self:CheckDungeonCondition(DungeonData[DungeonId].Condition) and (not MaxLevelDungeonId or MaxLevel < DataMgr.Dungeon[DungeonId].DungeonLevel or MaxLevel == DataMgr.Dungeon[DungeonId].DungeonLevel and DungeonId > MaxLevelDungeonId) then
        IsDungeonUnlocked = true
        MaxLevel = DataMgr.Dungeon[DungeonId].DungeonLevel
        MaxLevelDungeonId = DungeonId
      end
      if not MinLevelDungeonId or MinLevel > DataMgr.Dungeon[DungeonId].DungeonLevel or MinLevel == DataMgr.Dungeon[DungeonId].DungeonLevel and DungeonId < MinLevelDungeonId then
        MinLevel = DataMgr.Dungeon[DungeonId].DungeonLevel
        MinLevelDungeonId = DungeonId
      end
    end
  end
  return IsDungeonUnlocked and MaxLevelDungeonId or MinLevelDungeonId
end

function PageJumpUtils:CheckDungeonCondition(Conditions, bShowFailed)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if not Conditions then
    return true
  end
  for _, ConditionId in pairs(Conditions) do
    if ConditionUtils.CheckCondition(Avatar, ConditionId, bShowFailed) == false then
      return false
    end
  end
  return true
end

function PageJumpUtils:CreateJumpToShopAccess(ItemType, ShopType, ItemId, CommonParam, ReturnCallBack)
  if not DataMgr.ShopItem2ShopSubId[ItemType][ShopType][ItemId] then
    return
  end
  local ShopDatas = setmetatable({}, {
    __index = DataMgr.ShopItem2ShopSubId[ItemType][ShopType][ItemId]
  })
  if not ShopDatas or next(ShopDatas) then
    return
  end
  table.sort(ShopDatas, function(a, b)
    return a.AccessOrder or b.AccessOrder < 0 or 0
  end)
  local ShopData
  for _, Data in ipairs(ShopDatas) do
    if ShopUtils:GetShopItemCanShow(Data.ShopItemId) and 0 ~= ShopUtils:GetShopItemPurchaseLimit(Data.ShopItemId) then
      ShopData = Data
      break
    end
  end
  if not ShopData then
    return false
  end
  local ShopItemId = ShopData.ShopItemId
  local SubTabId = ShopData.SubTabId
  local MainTabId = DataMgr.ShopTabSub[SubTabId].MainTabId
  ReturnCallBack = ReturnCallBack or {}
  
  local function JumpToPage()
    self:CloseFrontDialog()
    self:JumpToShopPage(MainTabId, SubTabId, ShopItemId, ShopType, ReturnCallBack.CallBack, ReturnCallBack.CallBackObj)
  end
  
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function CustomCheckUnlock(AccessItem, UIName)
    if AccessItem.IsInteractive == true then
      local ShopMainTabData = DataMgr.ShopTabMain[MainTabId]
      local SubShopTabData = DataMgr.ShopTabSub[SubTabId]
      local bDone = false
      if ShopMainTabData.ConditionId and not Avatar.CheckUIUnlocked(Avatar, ShopMainTabData.ConditionId) then
        if SubShopTabData.UnlockHide then
          return false
        end
        AccessItem.IsInteractive = false
        AccessItem.IsUnLock = false
        AccessItem.Switch_Type:SetActiveWidgetIndex(1)
        
        local function CheckShopTab()
          Avatar.CheckUIUnlocked(Avatar, ShopMainTabData.ConditionId, true)
        end
        
        AccessItem.JumpFunc = CheckShopTab
        bDone = true
      end
      if not bDone and SubShopTabData.ConditionId and not Avatar.CheckUIUnlocked(Avatar, SubShopTabData.ConditionId) then
        if SubShopTabData.UnlockHide then
          return false
        end
        AccessItem.IsInteractive = false
        AccessItem.IsUnLock = false
        AccessItem.Switch_Type:SetActiveWidgetIndex(1)
        
        local function CheckShopTab()
          Avatar.CheckUIUnlocked(Avatar, SubShopTabData.ConditionId, true)
        end
        
        AccessItem.JumpFunc = CheckShopTab
        bDone = true
      end
    end
  end
  
  local ShopMainTabData = DataMgr.ShopTabMain[MainTabId]
  local SubShopTabData = DataMgr.ShopTabSub[SubTabId]
  if ShopMainTabData.ConditionId and not Avatar.CheckUIUnlocked(Avatar, ShopMainTabData.ConditionId) and SubShopTabData.UnlockHide then
    return false
  end
  if SubShopTabData.ConditionId and not Avatar.CheckUIUnlocked(Avatar, SubShopTabData.ConditionId) and SubShopTabData.UnlockHide then
    return false
  end
  if CommonParam then
    self:ProcessAccessItem(CommonParam.AccessItem, CommonParam.AccessText, CommonParam.UIName, CommonParam.UIUnlockRuleId, JumpToPage, CustomCheckUnlock)
  end
  return true, JumpToPage
end

function PageJumpUtils:CreateJumpToHome(AccessItem)
  local function JumpToPage()
    local Avatar = GWorld:GetAvatar()
    
    if not Avatar then
      return
    end
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    if Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
      UIManager:ShowUITip("CommonToastMain", GText("UI_TOAST_FORGING_WARNING"))
    end
    self:CloseFrontDialog()
    UIManager:ShowCommonPopupUI(100037, {
      RightCallbackObj = self,
      RightCallbackFunction = function(Obj, PackageData)
        local GameMode = UE.UGameplayStatics.GetGameMode(AccessItem)
        GameMode:HandleLevelDeliver(1, 210101, 1)
      end,
      ForbiddenRightCallbackObj = self
    }, AccessItem)
  end
  
  return true, JumpToPage
end

function PageJumpUtils:CreateJumpToWalnutBag(CommonParam, ItemType, ItemId)
  local WalnutAccess = DataMgr.Item2WalnutIdMap[ItemType][ItemId]
  if not WalnutAccess then
    DebugPrint("ZDX: ItemId:" .. ItemId .. " not found in Item2WalnutIdMap Config")
    return
  end
  local WalnutList = {}
  for _, v in pairs(WalnutAccess) do
    table.insert(WalnutList, v)
  end
  table.sort(WalnutList, function(a, b)
    return a < b
  end)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  for _, Value in ipairs(WalnutList) do
    local AccessItem = self:CreateAccessItem(CommonParam.ItemWidget, CommonParam.AccessKey)
    local WalnutConfigData = DataMgr.Walnut[Value]
    local WalnutCount = 0
    if Avatar.Walnuts.WalnutBag[Value] then
      WalnutCount = Avatar.Walnuts.WalnutBag[Value]
    end
    local WalnutAccessText = string.format("%s %s%d", GText(WalnutConfigData.Name), GText("UI_Bag_Sellconfirm_Hold"), WalnutCount)
    
    local function JumpToPage()
      self:CloseFrontDialog()
      self:JumpToWalnutBagPage(WalnutConfigData.WalnutType + 1, WalnutConfigData.WalnutId)
    end
    
    if 0 ~= WalnutCount then
      function JumpToPage()
        self:CloseFrontDialog()
        
        self:JumpToWalnutDungeonPage(WalnutConfigData.WalnutType, Value)
      end
    end
    self:ProcessAccessItem(AccessItem, WalnutAccessText, CommonParam.UIName, CommonParam.UIUnlockRuleId, JumpToPage)
    CommonParam.ItemWidget.Method:AddChild(AccessItem)
  end
end

function PageJumpUtils:CreateJumpToForge(AccessItem, ItemType, ItemId)
  if not (DataMgr.Item2DraftIdMap[ItemType] and DataMgr.Item2DraftIdMap[ItemType][ItemId]) or not DataMgr.Item2DraftIdMap[ItemType][ItemId].DraftIds then
    return false
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local DraftId = DataMgr.Item2DraftIdMap[ItemType][ItemId].DraftIds[1]
  
  local function JumpToPage()
    local PlayerAvatar = GWorld:GetAvatar()
    local AvatarDrafts = PlayerAvatar.Drafts
    if not AvatarDrafts or not AvatarDrafts[DraftId] then
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("Forge_InterfaceJump_Locked"))
      return
    end
    self:CloseFrontDialog()
    local CompendiumPage = UIManager:GetUI("ForgeCompenduim")
    if CompendiumPage then
      CompendiumPage:Close()
    end
    self:JumpToForgePageDraftId(DraftId)
  end
  
  return true, JumpToPage
end

function PageJumpUtils:JumpToDungeonPage(DungeonId, DeputeType, MonsterId, bFromPlay)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  DungeonId = tonumber(DungeonId)
  DeputeType = tonumber(DeputeType)
  self:CloseFrontDialog()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("OpenSystemUI")
  Flow.OnBegin:Add(Flow, function()
    local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
    if not StyleOfPlay then
      StyleOfPlay = UIManager:LoadUINew("StyleOfPlay")
      UIManager:AddToJumpPageDeque(StyleOfPlay)
      UIManager:AddFlow("StyleOfPlay", Flow)
    else
      UIManager:PlaceJumpUIToTop(StyleOfPlay, "StyleOfPlay")
      FlowManager:RemoveFlow(Flow)
    end
    StyleOfPlay.IsOpenSelectLevel = false
    local SelectLevel = StyleOfPlay:OpenSubUI("DungeonSelect")
    local Dungeon2Select = DataMgr.Dungeon2Select
    if SelectLevel.CurSelectedDungeonId == DungeonId then
      return
    end
    local ChapterId = not Dungeon2Select[DungeonId] and DataMgr.Dungeon2SubDungeon[DungeonId] and Dungeon2Select[DataMgr.Dungeon2SubDungeon[DungeonId]]
    SelectLevel.PlayEntry = StyleOfPlay
    if not bFromPlay then
      SelectLevel.IsFromJump = true
    end
    local DungeonList, DungeonTabName
    if DeputeType == Const.DeputeType.NightFlightManualDepute then
      DungeonList = DataMgr.ModDungeonMonReward[MonsterId].DungeonList
      DungeonTabName = DataMgr.PlaySubTab.DeputeNightBook.SubTabName
      SelectLevel:SetNightFlightManualRewardView(DataMgr.ModDungeonMonReward[MonsterId].DungeonRewardView)
    else
      DungeonList = DataMgr.SelectDungeon[ChapterId].DungeonList
      DungeonTabName = DataMgr.PlaySubTab.NewDeputeRoot.SubTabName
    end
    SelectLevel:InitLevelList(DungeonList, DungeonId, DeputeType)
    StyleOfPlay:InitOtherPageTab({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = SelectLevel.OnReturnKeyDown,
              Owner = SelectLevel
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      },
      OwnerPanel = SelectLevel,
      BackCallback = SelectLevel.OnReturnKeyDown,
      StyleName = "Text",
      TitleName = GText(DungeonTabName),
      InfoCallback = SelectLevel.ShowIntro
    }, nil, true)
  end)
  FlowManager:AddFlow(Flow)
end

function PageJumpUtils:JumpToWalnutDungeonPage(WalnutType, WalnutId)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  local DungeonIds
  self.ValidWalnutDungeons = PlayerAvatar.Walnuts.ValidWalnutDungeons
  for Type, Ids in pairs(self.ValidWalnutDungeons) do
    if Type == WalnutType then
      DungeonIds = Ids
      break
    end
  end
  if not DungeonIds then
    return
  end
  table.sort(DungeonIds, function(a, b)
    local DataA = DataMgr.Dungeon[a]
    local DataB = DataMgr.Dungeon[b]
    if not DataA or not DataB then
      return false
    end
    return DataA.DungeonLevel < DataB.DungeonLevel
  end)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    StyleOfPlay = UIManager:LoadUINew("StyleOfPlay")
    UIManager:AddToJumpPageDeque(StyleOfPlay)
  else
    UIManager:PlaceJumpUIToTop(StyleOfPlay, "StyleOfPlay")
  end
  StyleOfPlay.IsOpenSelectLevel = false
  local SelectLevel = StyleOfPlay:OpenSubUI("DungeonSelect")
  SelectLevel.PlayEntry = StyleOfPlay
  local WalnutTypeData = DataMgr.WalnutType[WalnutType]
  local Data = DataMgr.Dungeon[DungeonIds[1]]
  SelectLevel:SetWalnutType(WalnutTypeData)
  SelectLevel:SetWalnutTitleMatColor(WalnutType)
  SelectLevel:InitLevelList(DungeonIds, Data.DungeonID, Const.DeputeType.WalnutDepute, WalnutId)
  StyleOfPlay:InitOtherPageTab({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Add"},
          GamePadSubKeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Up",
              Owner = SelectLevel
            },
            {
              Type = "Img",
              ImgShortPath = "Y",
              Owner = SelectLevel
            }
          }
        },
        Desc = GText("UI_CTL_DeputeInfo"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = SelectLevel.OnReturnKeyDown,
            Owner = SelectLevel
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = SelectLevel
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    OwnerPanel = SelectLevel,
    BackCallback = SelectLevel.OnReturnKeyDown,
    StyleName = "Text",
    TitleName = GText("UI_Dungeon_Tab_WalnutDungeon")
  }, nil, true)
end

function PageJumpUtils:JumpToStyleOfPlaySubUI(SubUIName, ...)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  self:CloseFrontDialog()
  local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    StyleOfPlay = UIManager:LoadUINew("StyleOfPlay")
    UIManager:AddToJumpPageDeque(StyleOfPlay)
  else
    UIManager:PlaceJumpUIToTop(StyleOfPlay, "StyleOfPlay")
  end
  local WidgetUI = StyleOfPlay:OpenSubUI(SubUIName)
  if WidgetUI.SubUIJumpFunc then
    WidgetUI.SubUIJumpFunc(...)
  end
end

function PageJumpUtils:JumpToRougeMain(JumpType)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  self:CloseFrontDialog()
  JumpType = JumpType or "NormalJump"
  local StyleOfPlay = UIManager:GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    StyleOfPlay = UIManager:LoadUINew("StyleOfPlay")
    if "NormalJump" == JumpType then
      UIManager:AddToJumpPageDeque(StyleOfPlay)
    end
  else
    UIManager:PlaceJumpUIToTop(StyleOfPlay, "StyleOfPlay")
  end
  StyleOfPlay.IsOpenSelectLevel = false
  local WidgetUI = StyleOfPlay:OpenSubUI("RougeMain")
  WidgetUI:InitTable(JumpType)
end

function PageJumpUtils:JumpToAbyssLevelInfoPage(AbyssId, AbyssLevelId, AbyssDungeonIndex)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local AbyssMain = UIManager:LoadUINew("AbyssMain", AbyssId, true)
  UIManager:AddToJumpPageDeque(AbyssMain)
  AbyssMain:OpenSubUI({
    Idx = "AbyssSelect"
  }, false, AbyssId, AbyssLevelId, AbyssDungeonIndex)
end

function PageJumpUtils:JumpToTryOut(CurTabIndex, ActivityId, CurSelectIndex)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("OpenSystemUI")
  Flow.OnBegin:Add(Flow, function()
    local ActivityMain = UIManager:LoadUINew("ActivityMain", nil, CurTabIndex, ActivityId, CurSelectIndex)
    UIManager:AddToJumpPageDeque(ActivityMain)
    UIManager:AddFlow("ActivityMain", Flow)
  end)
  FlowManager:AddFlow(Flow)
end

function PageJumpUtils:JumpToPaotai(CurTabIndex)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("OpenSystemUI")
  Flow.OnBegin:Add(Flow, function()
    local ActivityMain = UIManager:LoadUINew("ActivityMain", nil, CurTabIndex)
    UIManager:AddToJumpPageDeque(ActivityMain)
    local ActivityId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
    local PageConfigData = DataMgr.EventPortal[ActivityId]
    if PageConfigData.JumpUIId then
      PageJumpUtils:JumpToTargetPageByJumpId(PageConfigData.JumpUIId)
    end
    UIManager:AddFlow("ActivityMain", Flow)
  end)
  FlowManager:AddFlow(Flow)
end

function PageJumpUtils:JumpToFeinaEvent(CurTabIndex)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("OpenSystemUI")
  Flow.OnBegin:Add(Flow, function()
    local ActivityMain = UIManager:LoadUINew("ActivityMain", nil, CurTabIndex)
    UIManager:AddToJumpPageDeque(ActivityMain)
    local ActivityId = DataMgr.EventConstant.FeinaEventId.ConstantValue
    local PageConfigData = DataMgr.EventPortal[ActivityId]
    if PageConfigData.JumpUIId then
      PageJumpUtils:JumpToTargetPageByJumpId(PageConfigData.JumpUIId)
    end
    UIManager:AddFlow("ActivityMain", Flow)
  end)
  FlowManager:AddFlow(Flow)
end

function PageJumpUtils:JumpToShopPage(MainTabIdx, SubTabIdx, ShopItemId, ShopType, Callback, CallbackObj)
  assert(DataMgr.Shop[ShopType], "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\177\187\229\158\139\231\154\132\229\149\134\229\186\151\239\188\140", ShopType)
  local UIName = DataMgr.Shop[ShopType].ShopUIName
  if not UIName then
    DebugPrint("ZDX_\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\232\183\179\232\189\172\229\149\134\229\186\151\231\154\132UIName", ShopType)
    return
  end
  MainTabIdx = tonumber(MainTabIdx)
  SubTabIdx = tonumber(SubTabIdx)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local ShopMainPage = UIManager:GetUIObj(UIName)
  if not ShopMainPage then
    ShopMainPage = UIManager:LoadUINew(UIName, MainTabIdx, SubTabIdx, ShopItemId, ShopType, Callback, CallbackObj)
    UIManager:AddToJumpPageDeque(ShopMainPage)
  else
    UIManager:PlaceJumpUIToTop(ShopMainPage, UIName)
    ShopMainPage:InitShop(MainTabIdx, SubTabIdx, ShopItemId, ShopType, Callback, CallbackObj)
  end
end

function PageJumpUtils:JumpToWalnutBagPage(ItemType, ItemId)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local WalnutBagMain = UIManager:GetUIObj("WalnutBagMain")
  if nil == ItemType then
    local WalnutConfigData = DataMgr.Walnut[ItemId]
    ItemType = WalnutConfigData.WalnutType
  end
  if not WalnutBagMain then
    WalnutBagMain = UIManager:LoadUINew("WalnutBagMain", ItemType, ItemId)
    UIManager:AddToJumpPageDeque(WalnutBagMain)
  else
    UIManager:PlaceJumpUIToTop(WalnutBagMain, "WalnutBagMain")
    WalnutBagMain:InitJumpParams(ItemType, ItemId)
  end
end

function PageJumpUtils:JumpToForgePageDraftId(DraftId)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local PlayerAvatar = GWorld:GetAvatar()
  local AvatarDrafts = PlayerAvatar.Drafts
  if not AvatarDrafts or not AvatarDrafts[DraftId] then
    UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("Forge_InterfaceJump_Locked"))
    return
  end
  local ForgePage = UIManager:GetUIObj("ForgeMain")
  if ForgePage then
    ForgePage:NavigateToTargetDraft(DraftId)
    UIManager:PlaceJumpUIToTop(ForgePage, "ForgeMain")
  else
    ForgePage = UIManager:LoadUINew("ForgeMain", {NotDelayAddListItem = true})
    UIManager:AddToJumpPageDeque(ForgePage)
    ForgePage:NavigateToTargetDraft(DraftId)
  end
end

function PageJumpUtils:JumpToAnglingMap(Param)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local AnglingMap = UIManager:GetUIObj("AnglingMap")
  if AnglingMap then
  else
    AnglingMap = UIManager:LoadUINew("AnglingMap", Param)
    UIManager:AddToJumpPageDeque(AnglingMap)
  end
end

function PageJumpUtils:JumpToTargetPointWithConfirm(TargetSubRegionId, StartIndex, PopupUIId)
  local function CancelDeliverTo()
  end
  
  local function DoDeliverTo()
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if IsValid(GameMode) then
      GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, math.tointeger(TargetSubRegionId), math.tointeger(StartIndex), false)
    end
  end
  
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local Params = {
    LeftCallbackObj = self,
    LeftCallbackFunction = CancelDeliverTo,
    RightCallbackObj = self,
    RightCallbackFunction = DoDeliverTo,
    CloseBtnCallbackObj = self,
    CloseBtnCallbackFunction = CancelDeliverTo
  }
  UIManager:ShowCommonPopupUI(math.tointeger(PopupUIId), Params)
end

local function JumpToPageCheck(JumpToPageUIName)
  local SystemUI = DataMgr.SystemUI[JumpToPageUIName]
  if SystemUI and SystemUI.System then
    local UIUnlockRuleInfo = DataMgr.UIUnlockRule[SystemUI.System]
    if UIUnlockRuleInfo and UIUnlockRuleInfo.OpenConditionId then
      local PlayerAvatar = GWorld:GetAvatar()
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
        return false
      end
    end
  end
  return true
end

function PageJumpUtils:JumpToTargetPageByJumpId(JumpId, ...)
  local JumpSuccess = false
  local JumpConfig = DataMgr.InterfaceJump[JumpId]
  if not JumpConfig then
    DebugPrint("JumpToTargetPageByJumpId Error, Data not find in InterfaceJump, JumpId is", JumpId)
    return JumpSuccess
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local PlayerAvatar = GWorld:GetAvatar()
  if not ConditionUtils.CheckCondition(PlayerAvatar, JumpConfig.PortalUnlockCondition) then
    UIManager:ShowUITip(UIConst.Tip_CommonToast, JumpConfig.PortalUnlockTips)
    return JumpSuccess
  end
  local JumpToPageUIName = JumpConfig.JumpParameter1
  if not JumpToPageCheck(JumpToPageUIName) then
    return JumpSuccess
  end
  local Params = {}
  for i = 2, 10 do
    local ParamVar = JumpConfig["JumpParameter" .. i]
    if nil ~= ParamVar then
      table.insert(Params, ParamVar)
    end
  end
  local ExtraParams = {
    ...
  }
  for _, value in ipairs(ExtraParams) do
    table.insert(Params, value)
  end
  if JumpConfig.JumpType == "SelfDefinedJump" then
    if type(PageJumpFunctionLibrary[JumpToPageUIName]) == "function" then
      PageJumpFunctionLibrary[JumpToPageUIName](table.unpack(Params))
      JumpSuccess = true
    elseif type(self[JumpToPageUIName]) == "function" then
      self[JumpToPageUIName](self, table.unpack(Params))
      JumpSuccess = true
    else
      DebugPrint("JumpToTargetPageByJumpId Error, SelfDefined funtion not find, Function Name is", JumpToPageUIName)
      return JumpSuccess
    end
  else
    local TargetUIPage = UIManager:GetUIObj(JumpToPageUIName)
    if not TargetUIPage then
      TargetUIPage = UIManager:LoadUINew(JumpToPageUIName, table.unpack(Params))
      UIManager:AddToJumpPageDeque(TargetUIPage)
    else
      UIManager:PlaceJumpUIToTop(TargetUIPage, JumpToPageUIName)
    end
    JumpSuccess = true
  end
  return JumpSuccess
end

function PageJumpUtils:JumpToTargetPage(TargetUIName, ...)
  if not TargetUIName then
    DebugPrint("JumpToTargetPage Error, TargetUIName is nil")
    return
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local TargetUIPage = UIManager:GetUIObj(TargetUIName)
  if not TargetUIPage then
    TargetUIPage = UIManager:LoadUINew(TargetUIName, ...)
    UIManager:AddToJumpPageDeque(TargetUIPage)
  else
    UIManager:PlaceJumpUIToTop(TargetUIPage, TargetUIName)
  end
end

function PageJumpUtils:JumpToGachaPage(GachaTabId)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local GachaMainPage = UIManager:GetUIObj("GachaMain")
  local Avatar = GWorld:GetAvatar()
  GachaTabId = tonumber(GachaTabId)
  local GachaTabInfo = GachaModel:GetEffectiveGachaInfo()
  if not (Avatar and GachaTabInfo and GachaTabInfo[GachaTabId]) or not next(GachaTabInfo[GachaTabId]) then
    UIManager:ShowUITip("CommonToastMain", GText("UI_CharTrial_GachaLocked"), 1.5)
    return
  end
  local GachaValid = false
  local GachaUnlock = false
  for key, value in pairs(GachaTabInfo[GachaTabId]) do
    local GachaPool = Avatar.SkinGachaPool[value]
    if GachaPool and 1 == GachaPool.Usable then
      GachaValid = true
    end
    local GachaInfo = DataMgr.SkinGacha[value]
    if GachaInfo then
      local ConditionId = GachaInfo.ConditionId
      local ConditionSucc = true
      if ConditionId then
        ConditionSucc = ConditionUtils.CheckCondition(Avatar, ConditionId)
      end
      if ConditionSucc then
        GachaUnlock = true
      end
    end
  end
  if not GachaValid then
    UIManager:ShowUITip("CommonToastMain", GText("UI_CharTrial_NotInGachaPeriod"), 1.5)
    return
  end
  if not GachaUnlock then
    UIManager:ShowUITip("CommonToastMain", GText("UI_CharTrial_GachaLocked"), 1.5)
    return
  end
  if not GachaMainPage then
    local Params = {InitGachaTabId = GachaTabId}
    UIUtils.OpenSystem(CommonConst.GachaEnterId, false, Params)
    local GachaMainPage = UIManager:GetUI("GachaMain")
    UIManager:AddToJumpPageDeque(GachaMainPage)
  else
    UIManager:PlaceJumpUIToTop(GachaMainPage, "GachaMain")
    GachaMainPage:InitGachaUI(GachaTabId)
  end
end

function PageJumpUtils:JumpToArmory(Params)
  local UIName = "ArmoryMain"
  if not JumpToPageCheck(UIName) then
    return
  end
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

return PageJumpUtils
