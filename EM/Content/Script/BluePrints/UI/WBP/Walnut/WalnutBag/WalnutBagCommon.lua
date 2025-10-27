local WalnutBagCommon = {
  ReddotName = "WalnutBag",
  WalnutItemType = {
    "ChaosWalnut",
    "NeutralWalnut",
    "OrderWalnut"
  },
  WalnutItemTypeToTabId = {
    AllWalnut = 1,
    ChaosWalnut = 2,
    NeutralWalnut = 3,
    OrderWalnut = 4
  },
  WalnutSearchMaxLen = 20,
  DefaultSelectTabId = 1,
  UIName = "WalnutBagMain",
  WalnutTypeName = "Walnut",
  NpcId = 900005,
  MaxRewardCount = 6,
  ReddotName = "WalnutBagItems",
  AllOptionName = {
    TabClick = "TabClick",
    SearchClick = "SearchClick",
    ShowNotHaveClick = "ShowNotHaveClick"
  },
  WalnutSelectUIName = "WalnutSelectToList",
  WalnutBagSellPageZOrder = 56
}
return WalnutBagCommon
