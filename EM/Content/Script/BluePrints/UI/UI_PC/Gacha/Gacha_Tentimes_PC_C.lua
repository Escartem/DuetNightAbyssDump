require("UnLua")
local G = Class("BluePrints.UI.BP_UIState_C")

function G:Construct()
  self.Btn_Back:SetText(GText("UI_BACK"))
  self.Btn_Back:BindEventOnClicked(self, self.PlayOutAnim)
  
  function self.Btn_Back.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  end
  
  self.Btn_Again:SetText(GText("UI_GACHA_AGAIN"))
  self.Btn_Again:BindEventOnClicked(self, self.OnClickGachaAgain)
  
  function self.Btn_Again.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end
  
  self.Text_ExtrasTitle:SetText(GText("GACHA_BONUS"))
  if not UIUtils.IsMobileInput() then
    self.KeyImg_GamePad:CreateGamepadKey(UIConst.GamePadImgKey.RightThumb)
    self.Key_GamePad01:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.LeftThumb,
          Type = "Img"
        }
      },
      Desc = GText("UI_CTL_Shop_Converted")
    })
    self.Key_GamePad02:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
          Type = "Img"
        }
      },
      Desc = GText("UI_Controller_Check")
    })
    self.Btn_Again:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
    self.Key_GamePad03:CreateGamepadKey(UIConst.GamePadImgKey.FaceButtonTop)
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if IsValid(self.GameInputModeSubsystem) then
      self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
    end
  end
  self.Btn_Share:BindEventOnClicked(self, self.OnBtnShareClicked)
end

function G:Init(Parent, Result, IsSingleGacha)
  self.Parent = Parent
  self.Parent.CantClick = true
  self.Parent.OpenUI = "GachaTen"
  self.IsSingleGacha = IsSingleGacha
  self.IsGachaPoolValid = true
  self.CanShare = false
  self.Text_TenTimesCostNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  for i = 1, CommonConst.GachaTenResults do
    self["DrawItem_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.GachaTimes = #Result
  self.ThisTimeGetChar = {}
  self.CanFocusChangeItem = false
  self.Btn_Back:SetDefaultGamePadImg("B")
  self.ResultData = Result
  self.ResourceReturn = {}
  self:PlayInAnim()
  self:SetFocus()
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self.GamePadState = "TenTimesMain"
  self:RefreshGachaTentimesBtn()
  self:RefreshGachaTentimesUI()
end

function G:RefreshInfoByInputTypeChange(CurInputType, CurGamepadName)
  if UIUtils.IsMobileInput() then
    return
  end
  if self.Parent and self.Parent:CheckScreenShotWidget() then
    return
  end
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function G:InitGamepadView()
  self:SetFocus()
  if self.CanFocusChangeItem then
    self.Key_GamePad01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.CanShare then
    self.Key_GamePad03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_GamePad03:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.KeyImg_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_GamePad02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Again.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function G:InitKeyboardView()
  if UIUtils.IsMobileInput() then
    return
  end
  self.KeyImg_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_GamePad01:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_GamePad02:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Again.Img_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_GamePad03:SetVisibility(ESlateVisibility.Collapsed)
end

function G:OnKeyDown(MyGeometry, InKeyEvent)
  if self.CantClick == true then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.GamePadState == "TenTimesMain" and InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:OnClickGachaAgain()
  elseif self.GamePadState == "TenTimesMain" and InKeyName == UIConst.GamePadKey.LeftThumb then
    self:GamePadFocusChangeItem()
  elseif self.GamePadState == "TenTimesMain" and InKeyName == UIConst.GamePadKey.RightThumb then
    self.GamePadState = "ResourceItem"
    local WidgetToFocus = self.HB_ResourceBar:GetChildAt(0)
    if WidgetToFocus then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), WidgetToFocus)
    end
    self:RefreshAllGamePad(false)
  elseif self.GamePadState == "TenTimesMain" and InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self.GamePadState = "ExtraItem"
    self.Item1:SetFocus()
    self:RefreshAllGamePad(false)
  elseif self.GamePadState == "TenTimesMain" and InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.CanShare then
      self:OnBtnShareClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.GamePadState ~= "TenTimesMain" then
      self:SetFocus()
      self.GamePadState = "TenTimesMain"
      self:RefreshAllGamePad(true)
    else
      self:PlayOutAnim()
      self.Parent:RefreshResourceConsume()
    end
  elseif "Escape" == InKeyName then
    self:PlayOutAnim()
    self.Parent:RefreshResourceConsume()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function G:GamePadFocusChangeItem()
  if self.CanFocusChangeItem then
    for Index = 1, CommonConst.GachaTenResults do
      local Item = self["DrawItem_" .. Index]
      if Item.IsConvert then
        self.CurrentChangeItemIndex = Index
        Item.Item:SetFocus()
        self.GamePadState = "ChangeItem"
        self:RefreshAllGamePad(false)
        break
      end
    end
  end
end

function G:RefreshAllGamePad(IsShow)
  if IsShow then
    if self.CanFocusChangeItem then
      self.Key_GamePad01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.Key_GamePad02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CanShare then
      self.Key_GamePad03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.KeyImg_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Back:SetGamepadIconVisibility(true)
    self.Btn_Again.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_GamePad02:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_GamePad03:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_Back:SetGamepadIconVisibility(false)
    self.Btn_Again.Img_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:RefreshGachaTentimesBtn()
  if self.Parent == nil then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Gacha = Avatar.GachaPool[self.Parent.NowGachaId]
  if 1 == Gacha.Usable then
    self.IsGachaPoolValid = true
    self.Group_TenTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.IsGachaPoolValid = false
    self.Group_TenTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:AddResourceReturn(Type, Rarity, IsUp, IsNew)
  local GachaRebateInfo = DataMgr.GachaRebate[Type][Rarity]
  if "Char" == Type and IsNew then
    return
  end
  if GachaRebateInfo then
    local ResourceId, Count
    if IsUp then
      ResourceId = GachaRebateInfo.RebateResIdUp
      Count = GachaRebateInfo.RebateNumUp
    else
      ResourceId = GachaRebateInfo.RebateResId
      Count = GachaRebateInfo.RebateNum
    end
    if ResourceId and Count then
      if self.ResourceReturn[ResourceId] then
        self.ResourceReturn[ResourceId] = {
          ResourceId = ResourceId,
          Count = self.ResourceReturn[ResourceId].Count + Count
        }
      else
        self.ResourceReturn[ResourceId] = {ResourceId = ResourceId, Count = Count}
      end
    end
  end
end

function G:RefreshResourceBar(GachaResourceId)
  local ResourceData = {
    CommonConst.Coins.Coin4,
    CommonConst.Coins.Coin1,
    GachaResourceId
  }
  self.HB_ResourceBar:ClearChildren()
  for i, CoinId in ipairs(ResourceData) do
    local ResourceBarWidget = self:CreateWidgetNew("ResourceBar", false)
    local CoinIcon = LoadObject(DataMgr.Resource[CoinId].Icon)
    ResourceBarWidget.Common_Item_Icon:Init({
      UIName = "GachaMain",
      IsShowDetails = true,
      IsCantItemSelection = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Id = CoinId,
      Icon = CoinIcon,
      ItemType = "Resource",
      HandleMouseDown = true
    })
    ResourceBarWidget:SetResourceId(CoinId)
    self.HB_ResourceBar:AddChild(ResourceBarWidget)
  end
end

function G:RefreshGachaTentimesUI()
  table.sort(self.ResultData, function(a, b)
    if a.Rarity ~= b.Rarity then
      return a.Rarity > b.Rarity
    else
      return a.Index < b.Index
    end
  end)
  if self:IsExistTimer("ShowRes") then
    self:RemoveTimer("ShowRes")
  end
  self.HB_Item1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.HB_Item2:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Index = 0
  self.CanFocusChangeItem = false
  
  local function ShowRes()
    Index = Index + 1
    local Info = self.ResultData[Index]
    if Info and Info.Rarity == CommonConst.GachaRarityMax then
      self.CanShare = true
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Key_GamePad03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
    if self["DrawItem_" .. Index] then
      local num1, num2 = math.modf(Index / 2)
      local IsOdd = true
      if 0 == num2 then
        IsOdd = false
      end
      self["DrawItem_" .. Index]:Init(self, Info.Sign, Info.ResultId, Info.IsNew, IsOdd, Index)
      self["DrawItem_" .. Index]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      local Index = 0
      table.sort(self.ResourceReturn, function(a, b)
        return a.ResourceId > b.ResourceId
      end)
      for ResourceId, Data in pairs(self.ResourceReturn) do
        Index = Index + 1
        if self["Text_ItemNum" .. Index] then
          self["Text_ItemNum" .. Index]:SetText(Data.Count)
        end
        if self["HB_Item" .. Index] then
          self["HB_Item" .. Index]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        if self["Item" .. Index] then
          local Content = {}
          Content.Id = ResourceId
          local ResourceInfo = DataMgr.Resource[ResourceId]
          local Icon = LoadObject(ResourceInfo.Icon)
          Content.Icon = Icon
          Content.ItemType = "Resource"
          Content.Rarity = ResourceInfo.Rarity
          Content.NotInteractive = false
          Content.IsShowDetails = true
          Content.MenuPlacement = EMenuPlacement.MenuPlacement_AboveAnchor
          self["Item" .. Index]:Init(Content)
        end
      end
      self:RemoveTimer("ShowRes")
    end
  end
  
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_ten_times_show", nil, nil)
  self:AddTimer(self.FrameLoadTime, ShowRes, true, 0, "ShowRes", true)
end

function G:OnClickGachaAgain()
  self.Parent.OpenUI = "GachaTen"
  self.Parent:TryGacha(self.IsSingleGacha)
end

function G:OnBtnShareClicked()
  self.HB_Btn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.Key_GamePad01 then
    self.Key_GamePad01:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Panel_Others:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.HB_Extras:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Parent:TakeGachaScreenShot(self, self.OnShareCallback)
  self.CantClick = true
end

function G:OnShareCallback()
  self:SetFocus()
  self.CantClick = false
  self.HB_Btn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Others:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.HB_Extras:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.CanFocusChangeItem then
    self.Key_GamePad01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end

function G:OnClickBtnClose()
  self.Parent.CantClick = false
  self.Parent.OpenUI = "GachaMain"
  self.Parent:SetFocus()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  AudioManager(self):SetEventSoundParam(self.Parent, "GachaAnime", {state = 2})
  AudioManager(self):SetEventSoundParam(self.Parent, "GachaAmb", {ToEnd = 1})
end

function G:PlayInAnim()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
  self.CantClick = true
  self.Group_Share:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:BindToAnimationFinished(self.In, {
    self,
    self.PlayInAnimFinished
  })
end

function G:PlayInAnimFinished()
  self.CantClick = false
  self:SetFocus()
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if self.CanShare then
    self.Group_Share:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function G:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
  if not self.IsGachaPoolValid then
    self.Parent:InitValidGachaPool()
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnClickBtnClose
  })
end

function G:Destruct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshInfoByInputTypeChange)
  end
end

return G
