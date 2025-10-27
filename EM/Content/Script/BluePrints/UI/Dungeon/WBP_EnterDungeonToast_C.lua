require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local DURATION_TIME = 2.0

function M:Initialize(Initializer)
end

function M:OnLoaded(Player, bIsIn)
  DebugPrint("gmy@WBP_EnterDungeonToast_C", Player, bIsIn)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.Panel_Toast)
    local Padding = Slot.Padding
    Padding.Top = Padding.Top + self.Offset_M
    Slot:SetPadding(Padding)
  end
  self:PlayAnimation(self.In)
  if Player then
    self.Text_Name:SetText(Player.PlayerName)
  else
    DebugPrint("gmy@M:OnLoaded Player is nil")
  end
  if bIsIn then
    self.Text_Toast:SetText(GText("UI_JoinMatch"))
  else
    self.Text_Toast:SetText(GText("UI_ExitMatch"))
  end
  self:AddTimer(DURATION_TIME, function()
    self:Close()
  end, false)
end

function M:Close()
  self.IsBeginToClose = true
  self:BindToAnimationFinished(self.Out, {
    self,
    self.RealClose
  })
  self:PlayAnimationForward(self.Out)
end

function M:SetHeadIconByRoleId(RoleId)
  local IconName = DataMgr.BattleChar[RoleId].GuideIconImg
  local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
  local NormalIconName = "T_Normal_" .. IconName
  local HeadIcon = LoadObject(MiniIconPath .. NormalIconName .. "." .. NormalIconName)
  if not IsValid(HeadIcon) then
    return
  end
  self.Img_Head:SetBrushResourceObject(HeadIcon)
end

return M
