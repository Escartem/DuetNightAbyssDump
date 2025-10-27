require("UnLua")
local WBP_RankPanel_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_RankPanel_C:OnLoaded(...)
  self.ScrollBox_RankInfo:ClearChildren()
  self.RankInfoList = (...)
  self.wbp_rankinfo_class = UE4.UClass.Load("/Game/BluePrints/UI/Rank/WBP_RankInfo.WBP_RankInfo")
  self:ChaneInputMode(true)
  self:InitButtons()
  self.ScrollBox_RankInfo:ClearChildren()
  self:InitTitle()
  self:ShowRankInfo()
end

function WBP_RankPanel_C:ChaneInputMode(bIsUI)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if bIsUI then
    UE4.UWidgetBlueprintLibrary.SetInputMode_UIOnly(PlayerController, self)
    PlayerController.bShowMouseCursor = true
  else
    UE4.UWidgetBlueprintLibrary.SetInputMode_GameOnly(PlayerController)
    PlayerController.bShowMouseCursor = false
  end
end

function WBP_RankPanel_C:InitButtons()
  self.Btn_Close:Init("Close", self, self.Close)
end

function WBP_RankPanel_C:InitTitle()
  self.WBP_RankInfo_Title = UE4.UWidgetBlueprintLibrary.Create(self, self.wbp_rankinfo_class)
  self.ScrollBox_RankInfo:AddChild(self.WBP_RankInfo_Title)
  self.WBP_RankInfo_Title:SetTextByTable({
    "\230\142\146\229\144\141",
    "\231\142\169\229\174\182\229\144\141\231\167\176",
    "\230\142\146\229\186\143\228\190\157\230\141\174",
    "\232\167\146\232\137\178",
    "\232\191\145\230\136\152\230\173\166\229\153\168",
    "\232\191\156\231\168\139\230\173\166\229\153\168",
    "\228\188\164\229\174\179"
  })
end

function WBP_RankPanel_C:ShowRankInfo()
  for i, v in pairs(self.RankInfoList) do
    local wbp_rankinfo = UE4.UWidgetBlueprintLibrary.Create(self, self.wbp_rankinfo_class)
    self.ScrollBox_RankInfo:AddChild(wbp_rankinfo)
    wbp_rankinfo:SetTextByInfo(i, v)
  end
end

function WBP_RankPanel_C:Close()
  self:ChaneInputMode(false)
  self.Btn_Close.btn_close.OnClicked:Clear()
  self.Super.Close(self)
end

return WBP_RankPanel_C
