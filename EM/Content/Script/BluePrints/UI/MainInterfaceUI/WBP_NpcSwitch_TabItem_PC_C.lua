require("UnLua")
local WBP_NpcSwitch_TabItem_PC_C = Class()

function WBP_NpcSwitch_TabItem_PC_C:UpdateTabItem(TabContent)
  self.TabName = {
    GText("UI_SHOWNPC_NAME_SCENE1"),
    GText("UI_SHOWNPC_NAME_SCENE2"),
    GText("UI_SHOWNPC_NAME_SCENE3")
  }
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    self.SignBoardNpcState = {
      -1,
      -1,
      -1
    }
  else
    self.SignBoardNpcState = Avatar.SignBoardNpc
  end
  if -1 == self.SignBoardNpcState[TabContent.TabId] then
    if TabContent.TabId == TabContent.NowTabId then
      self.Panel_Sel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Panel_Nor:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Place_Btn:SetText(self.TabName[TabContent.TabId])
      self.Img_Npc:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Img_Empty_2:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Image_Item_Bg_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Panel_Sel:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Panel_Nor:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Text_Place_Btn_1:SetText(self.TabName[TabContent.TabId])
      self.Img_Npc_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Img_Empty_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    local ShowNpc = DataMgr.Npc[self.SignBoardNpcState[TabContent.TabId]]
    local CharModel = DataMgr.Model[ShowNpc.CharId]
    local ResId = ""
    local NpcIcon = ""
    if nil ~= CharModel and nil ~= CharModel.StandId then
      ResId = "Char" .. CharModel.StandId
      NpcIcon = LoadObject("/Game/UI/UI_Phone/01Image/Avatar_Head/" .. ResId .. "." .. ResId)
    end
    if nil == NpcIcon then
      NpcIcon = LoadObject("/Game/UI/UI_Phone/01Image/Avatar_Head/Char001.Char001")
    end
    if TabContent.TabId == TabContent.NowTabId then
      self.Panel_Sel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Panel_Nor:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Place_Btn:SetText(self.TabName[TabContent.TabId])
      local ImgMat = self.Img_Npc:GetDynamicMaterial()
      ImgMat:SetTextureParameterValue("IconMap", NpcIcon)
      self.Img_Npc:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Img_Empty_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Image_Item_Bg_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Panel_Sel:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Panel_Nor:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Text_Place_Btn_1:SetText(self.TabName[TabContent.TabId])
      local ImgMat = self.Img_Npc_1:GetDynamicMaterial()
      ImgMat:SetTextureParameterValue("IconMap", NpcIcon)
      self.Img_Npc_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Img_Empty_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

return WBP_NpcSwitch_TabItem_PC_C
