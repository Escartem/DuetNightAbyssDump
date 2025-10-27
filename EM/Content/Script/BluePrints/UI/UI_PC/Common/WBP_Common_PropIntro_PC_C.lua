require("UnLua")
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.UITopTipsList = Deque.New()
  self.ItemDataInfoDict = {}
  self:BindToAnimationFinished(self.In, {
    self,
    self.PlayOutAnim
  })
  self:AddInputMethodChangedListen()
  self.Btn.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn.OnReleased:Add(self, self.OnBtnReleased)
  self.Text_Hint:SetText(GText("UI_Read_Click"))
  self:SetVisibility(ESlateVisibility.Collapsed)
end

function M:Destruct()
  self.bShowing = false
  self.ItemType = nil
  self.ItemId = nil
  self.ItemDataInfoDict = {}
  M.Super.Destruct(self)
end

function M:ShowPickupItem(PickUpItemInfo)
  if PickUpItemInfo then
    self.ItemType = PickUpItemInfo.ItemType
    self.ItemId = PickUpItemInfo.ItemId
    self.ItemCount = PickUpItemInfo.ItemCount
    assert(DataMgr[self.ItemType][self.ItemId], "\228\188\160\229\133\165\230\142\137\232\144\189\231\137\169\231\154\132\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168\239\188\154Type:" .. self.ItemType .. " Id:" .. self.ItemId)
    self.bShowing = true
    self.bHover = false
    if PickUpItemInfo.IsNew then
      self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.New:SetVisibility(ESlateVisibility.Collapsed)
    end
    local IconPath = ItemUtils.GetItemIconPath(self.ItemId, self.ItemType)
    local CurrentId = self.ItemId
    UE.UResourceLibrary.LoadObjectAsync(self, IconPath, {
      self,
      function(self, IconObj)
        if IconObj and CurrentId == self.ItemId then
          self.Icon_Prop:SetBrushResourceObject(IconObj)
        end
      end
    })
    self.Text_Num:SetText(self.ItemCount)
    self.Panel_Num:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    local ItemData = DataMgr[self.ItemType][self.ItemId]
    local ItemName = ItemUtils:GetDropName(self.ItemId, self.ItemType)
    self.Text_Name:SetText(GText(ItemName))
    self.SizeBox_ItemType:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.PetFX:SetVisibility(ESlateVisibility.Collapsed)
    if self.ItemType == "Pet" then
      self.PetFX:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      if 1 == DataMgr.Pet[self.ItemId].PetType then
        self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
        self:SetPetStar(DataMgr.Pet[self.ItemId].Rarity)
      else
        self.WidgetSwitcher_State:SetActiveWidgetIndex(3)
        self.WB_PetEntry:ClearChildren()
        for _, v in pairs(PickUpItemInfo.AdditionalParam.AffixList) do
          if DataMgr.PetEntry[v] then
            local Widget = UIManager(self):_CreateWidgetNew("PetEntryItemDetails")
            assert(DataMgr.PetEntry[v].IconS, "\230\156\170\233\133\141\231\189\174\229\174\160\231\137\169\229\164\169\232\181\139Icons", v)
            Widget.Icon_Entry:SetBrushResourceObject(LoadObject(DataMgr.PetEntry[v].IconS))
            Widget.Text_Entry:SetText(GText(DataMgr.PetEntry[v].PetEntryName))
            if 3 == DataMgr.PetEntry[v].Rarity then
              Widget.Icon_Entry:SetColorAndOpacity(Widget.Blue)
            elseif 4 == DataMgr.PetEntry[v].Rarity then
              Widget.Icon_Entry:SetColorAndOpacity(Widget.Purple)
            elseif 5 == DataMgr.PetEntry[v].Rarity then
              Widget.Icon_Entry:SetColorAndOpacity(Widget.Yellow)
            end
            self.WB_PetEntry:AddChild(Widget)
          end
        end
      end
      local Rarity = ItemUtils.GetItemRarity(self.ItemId, self.ItemType)
      self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self:PlayInAnim(Rarity, PickUpItemInfo.AdditionalParam.IsPremium)
      AudioManager(self):PlayUISound(self, "event:/ui/common/pick_up_item_add_important", nil, nil)
      return
    end
    if PickUpItemInfo.IsNew and ItemData.FunctionDes then
      self.Text_ItemType:SetText(GText(ItemData.FunctionDes))
    else
      self.SizeBox_ItemType:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.IsRead = ItemData and ItemData.Type == "Read"
    if self.IsRead then
      self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
      self.Panel_Num:SetVisibility(ESlateVisibility.Collapsed)
      self.SizeBox_ItemType:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_Hint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Panel_Num:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_Hint:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.IsRead and (UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad or CommonUtils.GetDeviceTypeByPlatformName(self) == "PC") then
      self:ListenForInputAction("ItemDetail", UE4.EInputEvent.IE_Pressed, true, {
        self,
        self.TryToViewItemDetail
      })
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self:InitGamepadView()
      else
        self:InitPCView()
      end
      self.Text_Hint:SetVisibility(ESlateVisibility.Collapsed)
      self.Panel_Check:SetVisibility(ESlateVisibility.Visible)
    else
      self:StopListeningForAllInputActions()
      self.Panel_Check:SetVisibility(ESlateVisibility.Collapsed)
    end
    local Rarity = ItemUtils.GetItemRarity(self.ItemId, self.ItemType)
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayInAnim(Rarity)
    AudioManager(self):PlayUISound(self, "event:/ui/common/pick_up_item_add_important", nil, nil)
  end
end

function M:PlayInAnim(Rarity, bSpecialColor)
  local RarityWidget = self.VX_Bg_glowline
  self.VX_Bg_glowline:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.VX_Bg_Colorful:SetVisibility(ESlateVisibility.Collapsed)
  if bSpecialColor then
    self.VX_Bg_Colorful:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.VX_Bg_glowline:SetVisibility(ESlateVisibility.Collapsed)
  end
  local FontMaterial = self.Text_Name:GetDynamicFontMaterial()
  local QualityMaterial = self.Bg_Quality:GetDynamicMaterial()
  if FontMaterial then
    if 5 == Rarity then
      QualityMaterial:SetTextureParameterValue("MainTex", self.Yellow)
      RarityWidget:SetColorAndOpacity(self.Glow_Yellow)
      self.VX_Bg_glow:SetColorAndOpacity(self.Glow_Yellow)
      FontMaterial:SetVectorParameterValue("MainColor", self.Font_Yellow)
    elseif 4 == Rarity then
      QualityMaterial:SetTextureParameterValue("MainTex", self.Purple)
      RarityWidget:SetColorAndOpacity(self.Glow_Purple)
      self.VX_Bg_glow:SetColorAndOpacity(self.Glow_Purple)
      FontMaterial:SetVectorParameterValue("MainColor", self.Font_Purple)
    elseif 3 == Rarity then
      QualityMaterial:SetTextureParameterValue("MainTex", self.Blue)
      RarityWidget:SetColorAndOpacity(self.Glow_Blue)
      self.VX_Bg_glow:SetColorAndOpacity(self.Glow_Blue)
      FontMaterial:SetVectorParameterValue("MainColor", self.Font_Blue)
    elseif 2 == Rarity then
      QualityMaterial:SetTextureParameterValue("MainTex", self.Green)
      RarityWidget:SetColorAndOpacity(self.Glow_Green)
      self.VX_Bg_glow:SetColorAndOpacity(self.Glow_Green)
      FontMaterial:SetVectorParameterValue("MainColor", self.Font_Green)
    else
      QualityMaterial:SetTextureParameterValue("MainTex", self.White)
      RarityWidget:SetColorAndOpacity(self.Glow_White)
      self.VX_Bg_glow:SetColorAndOpacity(self.Glow_White)
      FontMaterial:SetVectorParameterValue("MainColor", self.Font_White)
    end
  end
  self:PlayAnimation(self.In)
end

function M:SetPetStar(StarNum)
  if not StarNum then
    return
  end
  for i = 1, 6 do
    local str = "Star_" .. i
    local StarWidget = self[str]
    if StarWidget then
      if i <= StarNum then
        StarWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        StarWidget:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end

function M:PopSpecialDropQueue()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if not BattleMain or not BattleMain.Pos_SpecialDrops then
    DebugPrint("ZDX_\230\137\190\228\184\141\229\136\176BattleMain\230\136\150\231\137\185\230\174\138\230\142\137\232\144\189\231\137\169UI")
    return
  end
  if self.UITopTipsList:IsEmpty() then
    BattleMain:SetSubSystemVisibility("Pos_SpecialDrops", ESlateVisibility.Collapsed)
    return
  end
  BattleMain:SetSubSystemVisibility("Pos_SpecialDrops", ESlateVisibility.SelfHitTestInvisible)
  local TopTipsInfo = self.UITopTipsList:Get(1)
  local TopItemInfo = self.ItemDataInfoDict[TopTipsInfo.ItemType][TopTipsInfo.ItemId]
  if self.bShowing then
    return
  end
  self:ShowPickupItem(TopItemInfo)
  self.UITopTipsList:PopFront()
  self.ItemDataInfoDict[TopTipsInfo.ItemType][TopTipsInfo.ItemId] = nil
end

function M:TryToViewItemDetail()
  if not self.IsRead then
    return
  end
  UIManager(self):LoadUINew("ItemInformation", self.ItemId, "Read")
end

function M:OnBtnHovered()
  if not self.IsRead then
    return
  end
  self.bHover = true
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Hover)
end

function M:OnBtnUnhovered()
  if not self.IsRead then
    return
  end
  self.bHover = false
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.UnHover)
end

function M:OnBtnPressed()
  if not self.IsRead then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

function M:OnBtnReleased()
  if not self.IsRead then
    return
  end
  if self.bHover and self.bShowing then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
end

function M:PlayOutAnim()
  local function func()
    self.bShowing = false
    
    self:StopListeningForAllInputActions()
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
  end
  
  self:AddTimer(3, func, false, nil, "PlayOutAnim")
end

function M:OnAnimationFinished(Anim)
  if Anim == self.Click then
    self:TryToViewItemDetail()
  elseif Anim == self.UnHover then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  elseif Anim == self.Out then
    self.bShowing = false
    self:PopSpecialDropQueue()
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView(CurGamepadName)
  elseif CurInputDevice == UE4.ECommonInputType.MouseAndKeyboard then
    self:InitPCView(CurGamepadName)
  end
end

function M:InitGamepadView(CurGamepadName)
  if self.IsRead then
    local IconList = UIUtils.GetIconListByActionName("ItemDetail")
    local KeyInfos = {}
    for _, v in ipairs(IconList) do
      table.insert(KeyInfos, {
        Type = "Img",
        ImgShortPath = v,
        Owner = self
      })
    end
    self.Key_Check:CreateSubKeyDesc({
      KeyInfoList = KeyInfos,
      Desc = GText("UI_CTL_Read"),
      Type = "Add"
    })
  end
end

function M:InitPCView()
  if self.IsRead then
    self.Key_Check:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = GText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("ItemDetail")))
        }
      },
      Desc = GText("UI_CTL_Read")
    })
  end
end

return M
