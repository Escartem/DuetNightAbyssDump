local WBP_Rouge_EnterToast_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_EnterToast_C:Construct()
  self.ToastExistTime = 3
  self.NeedClose = false
end

function WBP_Rouge_EnterToast_C:InitEnterToast(RoomIndex, RoomId, SeasonId)
  DebugPrint("RougeEnterToast: InitEnterToast", RoomIndex, RoomId, "self.NeedClose ==", self.NeedClose)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local RoomInfo = DataMgr.RougeLikeRoom[RoomId]
  local TypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
  local RougeLikeManager = GWorld.RougeLikeManager
  local DifficultyInfo = DataMgr.RougeLikeDifficulty[RougeLikeManager.DifficultyId]
  local ImageResource = LoadObject(TypeInfo.Icon)
  local MatInstance = LoadObject("/Game/UI/WBP/Common/VX/RougeLike/Material/MI_WBP_Rouge_EnterToast_01.MI_WBP_Rouge_EnterToast_01")
  self.IconMatInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, MatInstance, "None")
  self.IconMatInstance:SetTextureParameterValue("MainTex", ImageResource)
  self.Icon:SetBrushFromMaterial(self.IconMatInstance)
  self.Text_Wave:SetText(RoomIndex)
  self.Text_Total:SetText(DifficultyInfo.RoomTotal)
  self.Text_Name:SetText(GText(RoomInfo.Name))
  self.Text_Type:SetText(GText(TypeInfo.Name))
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/show_level_info", nil, nil)
  self:AddTimer(self.ToastExistTime, function()
    self:Close()
  end)
end

function WBP_Rouge_EnterToast_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  if self.NeedClose then
    DebugPrint("RougeEnterToast: OnLoaded\230\151\182\229\155\160\228\184\186 self.NeedClose == true \229\133\179\233\151\173")
    self:Close()
  end
end

function WBP_Rouge_EnterToast_C:Close()
  self.Super.Close(self)
  self.NeedClose = true
end

return WBP_Rouge_EnterToast_C
