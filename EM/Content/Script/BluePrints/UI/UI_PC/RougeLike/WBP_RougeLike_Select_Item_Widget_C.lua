local WBP_RougeLike_Select_Item_Widget_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_RougeLike_Select_Item_Widget_C:Construct()
  self.BtnCD = 0.5
end

function WBP_RougeLike_Select_Item_Widget_C:OnLoaded()
  self.Btn_Select:BindEventOnClicked(self, self.OnBtn_SelectClicked)
end

function WBP_RougeLike_Select_Item_Widget_C:SetInfo(Parent, InfoId, InfoData, AwardType)
  self.Parent = Parent
  self.InfoId = InfoId
  local Name = InfoData.Name
  self.Text_Name:SetText(GText(Name))
  local Desc = InfoData.Desc
  self.Text_Describe:SetText(GText(Desc))
  self.AwardType = AwardType
  self.Btn_Select:SetText(GText("UI_CONFIRM_SELECTION"))
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
end

function WBP_RougeLike_Select_Item_Widget_C:OnBtn_SelectClicked()
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  DebugPrint("\230\163\128\230\181\139\229\136\176\230\140\137\233\148\174\230\140\137\228\184\139")
  if self.CurrentTime - self.StartTime < self.BtnCD then
    return
  end
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.Parent:ChooseItem(self.InfoId, self)
end

function WBP_RougeLike_Select_Item_Widget_C:Close()
  self.Super.Close(self)
end

return WBP_RougeLike_Select_Item_Widget_C
