require("UnLua")
local WBP_DungeoneMatchingFloat_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DungeoneMatchingFloat_C:Tick(MyGeometry, InDeltaTime)
  self.Overridden.Tick(self, MyGeometry, InDeltaTime)
  if self.Duration <= 0 then
    return
  end
  self.Duration = self.Duration - InDeltaTime
  self.Text_Countdown:SetText(string.format("%.f", self.Duration >= 0 and self.Duration or 0))
end

function WBP_DungeoneMatchingFloat_C:OnLoaded(DungeonId, ...)
  self.Super.OnLoaded(self, DungeonId, ...)
  self.DungeonId = DungeonId
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  assert(DungeonData, "\229\137\175\230\156\172ID\233\148\153\232\175\175" .. tostring(self.DungeonId))
  self.Btn_Confirm.OnClicked:Add(self, self.OnClick_Confirm)
  self.Btn_Cancel.OnClicked:Add(self, self.OnClick_Cancel)
  self.Text_Name:SetText(GText(DungeonData.DungeonName))
  self.Btn_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Info:SetVisibility(ESlateVisibility.Collapsed)
  self.Duration = 10
  self.Text_Countdown:SetText(string.format("%d", self.Duration))
  EventManager:FireEvent(EventID.OnMatchStateChanged)
end

function WBP_DungeoneMatchingFloat_C:OnClick_Confirm()
end

function WBP_DungeoneMatchingFloat_C:OnClick_Cancel()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:CancelEnterDungeon(CommonConst.DungeonNetMode.DedicatedServer)
  end
  self:Close()
  EventManager:FireEvent(EventID.OnMatchStateChanged)
  UIManager(self):ShowUITip("CommonToastMain", GText("DUNGEONMATCH_CANCEL"), 1.5)
end

return WBP_DungeoneMatchingFloat_C
