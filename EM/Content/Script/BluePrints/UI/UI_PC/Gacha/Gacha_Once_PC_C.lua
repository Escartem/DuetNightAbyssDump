require("UnLua")
local G = Class("BluePrints.UI.BP_UIState_C")

function G:Construct()
  self.Btn_FullClose.OnClicked:Add(self, self.OnBtnFullCloseClicked)
  self.Text_Tip:SetText(GText("UI_GACHA_NEXT"))
  self.Btn_Skip:SetCurrentTextBlock(GText("UI_GACHA_SKIP"))
  self.Gacha_ItemTips_1.Text_ExtrasTitle:SetText(GText("GACHA_BONUS"))
  self.Gacha_ItemTips_2.Text_ExtrasTitle:SetText(GText("UI_GACHA_TRANSFORMED"))
  self.Btn_Skip:BindEventOnClicked(self, self.OnBtnSkipClicked)
  self.Btn_Share:BindEventOnClicked(self, self.OnBtnShareClicked)
  if not UIUtils.IsMobileInput() then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if IsValid(self.GameInputModeSubsystem) then
      self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
    end
    self.Key_ItemTips:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
          Type = "Img"
        }
      },
      Desc = GText("UI_Controller_Check")
    })
    self.Key_Share:CreateGamepadKey(UIConst.GamePadImgKey.FaceButtonTop)
  end
end

function G:Init(Parent, Result, IsForceSkip)
  self.Parent = Parent
  self.Parent.CantClick = true
  self.Parent.OpenUI = "GachaOnce"
  self.GamePadState = "GachaOnceMain"
  self.ResultData = Result
  self.GachaTimes = #Result
  self.VoiceEventInstance = nil
  self.IsManyResults = false
  self.IsSingleGacha = true
  self.CanShare = false
  self.NotGacha = false
  self.ThisTimeGetChar = {}
  self.IsForceSkip = IsForceSkip or false
  if self.GachaTimes == CommonConst.GachaTenResults then
    self.IsSingleGacha = false
  end
  if self.GachaTimes ~= CommonConst.GachaOneResult then
    self.IsManyResults = true
    self.Group_Skip:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not UIUtils.IsMobileInput() then
      self.Key_Tips:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
            }
          },
          Desc = GText("UI_CTL_Continue")
        },
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight
            }
          },
          Desc = GText("UI_GACHA_SKIP")
        }
      })
    end
  else
    self.Group_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if not UIUtils.IsMobileInput() then
      self.Key_Tips:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight
            }
          },
          Desc = GText("UI_BACK")
        }
      })
    end
  end
  self.CurGachaResultIndex = 0
  self:SetFocus()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self:HandleResult()
  if self.IsManyResults and self.IsForceSkip then
    self:OnBtnSkipClicked()
  else
    self:RefreshGachaOnceUI()
  end
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
  self.GamePadState = "GachaOnceMain"
  self.Key_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_ItemTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Share:SetVisibility(ESlateVisibility.Collapsed)
  if self.CanShare then
    self.Key_Share:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_Share:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Group_Skip:SetVisibility(ESlateVisibility.Collapsed)
end

function G:InitKeyboardView()
  if UIUtils.IsMobileInput() then
    return
  end
  self.Key_Tips:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_ItemTips:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Share:SetVisibility(ESlateVisibility.Collapsed)
  if self.GachaTimes ~= CommonConst.GachaOneResult and not self.NotGacha then
    self.Group_Skip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function G:OnKeyDown(MyGeometry, InKeyEvent)
  if self.CantClick == true then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.GamePadState ~= "GachaOnceMain" then
      self:SetFocus()
      self.GamePadState = "GachaOnceMain"
    elseif self.GachaTimes == CommonConst.GachaOneResult then
      self:OnBtnFullCloseClicked()
    else
      self:OnBtnSkipClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.CanShare then
      self:OnBtnShareClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    if self.GamePadState == "GachaOnceMain" then
      self:OnBtnFullCloseClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.GamePadState == "GachaOnceMain" and self.VB_Tips:IsVisible() then
      self.Gacha_ItemTips_1.Item:SetFocus()
      self.GamePadState = "ShowItem"
    end
  elseif "Escape" == InKeyName then
    if not self.IsManyResults then
      self:PlayOutAnim()
    else
      self:OnBtnSkipClicked()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function G:HandleResult()
  for key, GachaResult in pairs(self.ResultData) do
    if GachaResult.Sign == CommonConst.GachaCharType then
      if self.Parent.OwnedChar[GachaResult.ResultId] == true then
        self.ResultData[key].IsNew = false
      else
        self.Parent.OwnedChar[GachaResult.ResultId] = true
        self.ResultData[key].IsNew = true
      end
      self.ResultData[key].Rarity = DataMgr.Char[GachaResult.ResultId].CharRarity
    elseif GachaResult.Sign == CommonConst.GachaWeaponType then
      if true == self.Parent.OwnedWeapon[GachaResult.ResultId] then
        self.ResultData[key].IsNew = false
      else
        self.Parent.OwnedWeapon[GachaResult.ResultId] = true
        self.ResultData[key].IsNew = true
      end
      self.ResultData[key].Rarity = DataMgr.Weapon[GachaResult.ResultId].WeaponRarity
    end
    self.ResultData[key].Index = key
  end
end

function G:CheckCharGradeCanMax(CharId)
  if not CharId then
    return false
  end
  local OldGradeCount = self.Parent.OwnedCharGrade[CharId] or 0
  local MaxNum = DataMgr.GlobalConstant.CharMaxCardLevelNeedNum.ConstantValue or 7
  local AlreadyGetCount = self.ThisTimeGetChar[CharId]
  if MaxNum < OldGradeCount + AlreadyGetCount then
    return true
  end
  return false
end

function G:RefreshGachaOnceUI()
  self:SetFocus()
  self.GamePadState = "GachaOnceMain"
  self.CurGachaResultIndex = self.CurGachaResultIndex + 1
  if self.ResultData[self.CurGachaResultIndex] == nil then
    return
  end
  local GachaResult = self.ResultData[self.CurGachaResultIndex]
  local TargetName
  local IsNew = self.ResultData[self.CurGachaResultIndex].IsNew
  self:SetTargetNew(IsNew)
  self.IsSpineAnimation = false
  self.CanShare = false
  if GachaResult.Rarity == CommonConst.GachaRarityMax then
    self.CanShare = true
  end
  self.IsNeedChange = false
  local TargetId = GachaResult.ResultId
  if GachaResult.Sign == CommonConst.GachaCharType then
    TargetName = DataMgr.Char[TargetId].CharName
    local CharInfo = DataMgr.Char[TargetId]
    if CharInfo and CharInfo.SpineBp then
      self:GetGachaOnceSpineUI(TargetId, CharInfo.SpineBp)
    else
      self:GetGachaOnceSpineUI(TargetId, "WBP_Gacha_Pool_WidgetMaer")
      DebugPrint(ErrorTag, "----jzn---\230\138\189\229\141\161\229\189\147\229\137\141\232\167\146\232\137\178\230\151\160Spine\232\147\157\229\155\190\232\181\132\230\186\144----", TargetId)
    end
    self.IsSpineAnimation = true
    self:SetCharImgRole(TargetId)
    if self.ThisTimeGetChar[TargetId] then
      self.ThisTimeGetChar[TargetId] = self.ThisTimeGetChar[TargetId] + 1
    else
      self.ThisTimeGetChar[TargetId] = 1
    end
    self.IsNeedChange = self:CheckCharGradeCanMax(TargetId)
    self:PlayInAnim(GachaResult.Rarity, TargetId)
  elseif GachaResult.Sign == CommonConst.GachaWeaponType then
    TargetName = DataMgr.Weapon[TargetId].WeaponName
    self:SetWeaponImgRole(TargetId)
    self.Text_VoiceText:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:PlayInAnim(GachaResult.Rarity)
  end
  self.Text_WeaponName:SetText(GText(TargetName))
end

function G:SetTargetNew(IsNew)
  if IsNew then
    self.Gacha_New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Gacha_New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:PlayCharVoiceAndText()
  self.Text_VoiceText:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not self.VoiceCharId then
    return
  end
  if self.NotGacha then
    return
  end
  local CharId = self.VoiceCharId
  local VoiceInfo = DataMgr.CharVoice2Gacha[CharId]
  if not VoiceInfo then
    return
  end
  local GachaVoicePart = 0
  for PartId, Data in pairs(VoiceInfo) do
    for key, value in pairs(Data) do
      if value.GachaVoiceCondition then
        local Avatar = GWorld:GetAvatar()
        local ConditionSucc = ConditionUtils.CheckCondition(Avatar, value.GachaVoiceCondition)
        if ConditionSucc then
          GachaVoicePart = math.max(GachaVoicePart, PartId)
        end
      else
        GachaVoicePart = math.max(GachaVoicePart, PartId)
      end
    end
  end
  local NeedPlayVoiceInfo = VoiceInfo[GachaVoicePart]
  if not NeedPlayVoiceInfo then
    return
  end
  local CharInfo = DataMgr.BattleChar[CharId]
  local PlayerInfo = DataMgr.Model[CharInfo.ModelId].MontagePrefix
  local CharName = self:SplitPlayerInfo(PlayerInfo)
  local GuideGachaId = DataMgr.GlobalConstant.GuideGachaId.ConstantValue
  if GuideGachaId and self.Parent.NowGachaId == GuideGachaId then
    self.Text_VoiceText:SetText(GText("UI_ChapterIntro_GaChaDialogue"))
  else
    self.Parent:PlayCharVoice(CharName, NeedPlayVoiceInfo[1].VoiceRes[1], "GachaVoice")
    self.Text_VoiceText:SetText(GText(NeedPlayVoiceInfo[1].VoiceText[1]))
  end
  self.Text_VoiceText:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function G:SplitPlayerInfo(PlayerInfo)
  if not PlayerInfo then
    return ""
  end
  if string.sub(PlayerInfo, -1) == "_" then
    return string.sub(PlayerInfo, 1, -2)
  end
  return PlayerInfo
end

function G:SetCharImgRole(TargetId)
  local CharInfo = DataMgr.Char[TargetId]
  local IconPath = CharInfo.BigIcon
  local Icon = LoadObject(IconPath)
  self.Image_Avatar:SetBrushResourceObject(Icon)
  local Attribute = DataMgr.BattleChar[TargetId].Attribute
  local IconName = "Armory_" .. Attribute
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  self.WS_DetailIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if AttributeIcon then
    self.Image_AvatarIcon:SetBrushResourceObject(AttributeIcon)
    self.WS_DetailIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.IsCampAnimation = false
  if CharInfo.Camp then
    local CampInfo = DataMgr.CharCamp[CharInfo.Camp]
    if CampInfo and CampInfo.CampSpineBp then
      self:GetGachaCampUI(CampInfo.CampSpineBp)
    else
      self.Group_Camp:ClearChildren()
    end
  else
    self.Group_Camp:ClearChildren()
  end
  self.WS_DetailIcon:SetActiveWidgetIndex(0)
  self.WS_Icon:SetActiveWidgetIndex(1)
end

function G:SetWeaponImgRole(TargetId)
  local IconPath = DataMgr.Weapon[TargetId].BigIcon
  local Icon = LoadObject(IconPath)
  self.Image_Weapon:SetBrushResourceObject(Icon)
  self.WS_Icon:SetActiveWidgetIndex(0)
  self.WS_DetailIcon:SetActiveWidgetIndex(1)
  self.WS_DetailIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local WeaponInfo = DataMgr.BattleWeapon[TargetId]
  if not WeaponInfo then
    return
  end
  local ReverseMap = {
    [0] = self.Long,
    [1] = self.Medium,
    [2] = self.Short
  }
  self.IsCampAnimation = false
  for _, Tag in pairs(WeaponInfo.WeaponTag) do
    local TagInfo = DataMgr.WeaponTag[Tag]
    if TagInfo and TagInfo.WeaponTagfilter then
      local AttributeIcon = LoadObject(TagInfo.Icon)
      if AttributeIcon then
        local RoleMaterial = self.Image_WeaponIcon:GetDynamicMaterial()
        RoleMaterial:SetTextureParameterValue("MainTex", AttributeIcon)
        self.WS_DetailIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
      if TagInfo.GachaSpine then
        self:GetGachaCampUI(TagInfo.GachaSpine)
      else
        self.Group_Camp:ClearChildren()
      end
      local ImageType = TagInfo.ImageType
      if nil ~= ImageType and ReverseMap[ImageType] then
        local ReverseMat = ReverseMap[ImageType]
        self.Image_WeaponReverse:SetBrushResourceObject(ReverseMat)
        local WeaponMaterial = self.Image_WeaponReverse:GetDynamicMaterial()
        WeaponMaterial:SetTextureParameterValue("MainTex", Icon)
      end
      break
    end
  end
end

function G:ShowExtraItem()
  local GachaResult = self.ResultData[self.CurGachaResultIndex]
  local TargetId
  if self.NotGacha then
    TargetId = GachaResult.TargetId
  else
    TargetId = GachaResult.ResultId
  end
  local Rarity = GachaResult.Rarity
  local Type = "Weapon"
  local IsNew = GachaResult.IsNew
  if GachaResult.Sign == CommonConst.GachaCharType then
    Type = "Char"
  end
  local GachaRebateInfo = DataMgr.GachaRebate[Type][Rarity]
  if "Char" == Type and IsNew then
    self.VB_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.VB_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Gacha_ItemTips_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Gacha_ItemTips_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if GachaRebateInfo then
    local ResourceId, Count
    if self.IsNeedChange then
      ResourceId = GachaRebateInfo.RebateResIdUp
      Count = GachaRebateInfo.RebateNumUp
    else
      ResourceId = GachaRebateInfo.RebateResId
      Count = GachaRebateInfo.RebateNum
    end
    if ResourceId and Count then
      local Content = {}
      Content.Id = ResourceId
      local ResourceInfo = DataMgr.Resource[ResourceId]
      local Icon = LoadObject(ResourceInfo.Icon)
      Content.Icon = Icon
      Content.ItemType = "Resource"
      Content.Rarity = ResourceInfo.Rarity
      Content.NotInteractive = false
      Content.IsShowDetails = true
      Content.MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
      self.Gacha_ItemTips_1.Item:Init(Content)
      self.Gacha_ItemTips_1.Text_Num:SetText("x" .. Count)
      self.Gacha_ItemTips_1.WS_ColorLine:SetActiveWidgetIndex(5 - ResourceInfo.Rarity)
      self.Gacha_ItemTips_1.VX_Glow:SetColorAndOpacity(self.Gacha_ItemTips_1["Quality" .. ResourceInfo.Rarity])
      self.Gacha_ItemTips_1:PlayAnimation(self.Gacha_ItemTips_1.In)
      self.Gacha_ItemTips_1:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
  if not self.IsNeedChange and "Char" == Type then
    local CharInfo = DataMgr.Char[TargetId]
    if CharInfo and CharInfo.RegainCharItemId then
      local ResourceId = CharInfo.RegainCharItemId
      local Count = CharInfo.RegainCharItemNum
      local Content = {}
      Content.Id = ResourceId
      local ResourceInfo = DataMgr.Resource[ResourceId]
      local Icon = LoadObject(ResourceInfo.Icon)
      Content.Icon = Icon
      Content.ItemType = "Resource"
      Content.Rarity = ResourceInfo.Rarity
      Content.NotInteractive = false
      Content.IsShowDetails = true
      Content.MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
      self.Gacha_ItemTips_2.Item:Init(Content)
      self.Gacha_ItemTips_2.Text_Num:SetText("x" .. Count)
      self.Gacha_ItemTips_2.WS_ColorLine:SetActiveWidgetIndex(5 - ResourceInfo.Rarity)
      self.Gacha_ItemTips_2.VX_Glow:SetColorAndOpacity(self.Gacha_ItemTips_2["Quality" .. ResourceInfo.Rarity])
      self:AddTimer(0.1, function()
        self.Gacha_ItemTips_2:SetVisibility(UE4.ESlateVisibility.Visible)
        self.Gacha_ItemTips_2:PlayAnimation(self.Gacha_ItemTips_2.In)
      end)
    end
  end
end

function G:OnBtnFullCloseClicked()
  if self.CantClick then
    return
  end
  if self.NotGacha then
    if self.CurGachaResultIndex == #self.ResultData then
      self:PlayOutAnim()
    else
      self:RefreshCommonOnceUI()
    end
    return
  end
  self.Parent:StopCharVoice("GachaVoice")
  if self.IsManyResults and self.IsForceSkip then
    self:OnBtnSkipClicked()
    return
  end
  if self.GachaTimes == CommonConst.GachaOneResult then
    self:PlayOutAnim()
  elseif self.CurGachaResultIndex == self.GachaTimes then
    self:PlayOutAnim()
    self.Parent:ShowGachaTentimesResult(self.ResultData, self.IsSingleGacha)
  else
    self:RefreshGachaOnceUI()
  end
end

function G:OnBtnSkipClicked()
  if self.NotGacha then
    return
  end
  if self.GachaTimes == CommonConst.GachaOneResult then
    return
  end
  if self.CurGachaResultIndex ~= self.GachaTimes and self:CheckHaveShowResult() then
    self.IsForceSkip = true
    self:RefreshGachaOnceUI()
    return
  end
  self:OnClickBtnClose()
  self.Parent:StopCharVoice("GachaVoice")
  AudioManager(self):StopSound(self, "GachaLevel")
  AudioManager(self):StopSound(self, "GachaShow")
  AudioManager(self):StopSound(self, "GachaFiveStar")
  AudioManager(self):StopSound(self, "GachaWeapon")
  self.Parent:ShowGachaTentimesResult(self.ResultData, self.IsSingleGacha)
end

function G:CheckHaveShowResult()
  for i = self.CurGachaResultIndex + 1, self.GachaTimes do
    local GachaResult = self.ResultData[i]
    local Rarity
    if GachaResult.Sign == CommonConst.GachaCharType then
      Rarity = DataMgr.Char[GachaResult.ResultId].CharRarity
      if GachaResult.IsNew then
        self.CurGachaResultIndex = i - 1
        return true
      end
    elseif GachaResult.Sign == CommonConst.GachaWeaponType then
      Rarity = DataMgr.Weapon[GachaResult.ResultId].WeaponRarity
    end
    if Rarity == CommonConst.GachaRarityMax then
      self.CurGachaResultIndex = i - 1
      return true
    end
  end
  return false
end

function G:OnClickBtnClose()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.NotGacha then
    self:OnCloseCallback()
    return
  end
  self.Parent.CantClick = false
  self.Parent.List_Pool:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Parent.OpenUI = "GachaMain"
  self.Parent:SetFocus()
  if not self.IsManyResults then
    AudioManager(self):SetEventSoundParam(self.Parent, "GachaAnime", {state = 2})
    AudioManager(self):SetEventSoundParam(self.Parent, "GachaAmb", {ToEnd = 1})
  end
  if self.Parent.IsAutoClose then
    self.Parent:OnClickBtnClose()
  end
end

function G:OnBtnShareClicked()
  self.Group_Share:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.VB_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.Key_Share then
      self.Key_Share:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.Key_Tips then
      self.Key_Tips:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self.Parent:TakeGachaScreenShot(self, self.OnShareCallback)
  self.CantClick = true
end

function G:OnShareCallback()
  self:SetFocus()
  self.GamePadState = "GachaOnceMain"
  self.CantClick = false
  self.Group_Share:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Skip:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.VB_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Share:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end

function G:PlayInAnim(Rarity, CharId)
  self.CantClick = true
  local AnimTime
  if self.CurGachaResultIndex == CommonConst.GachaOneResult or self.NotGacha then
    self:PlayAnimation(self.In_First)
  else
    self:PlayAnimation(self.In_Normal)
  end
  
  local function SetClick()
    self.CantClick = false
    if self.CanShare then
      self.Group_Share:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Key_Share:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
  
  if 3 == Rarity then
    self:PlayAnimation(self.In_Blue)
    self.WS_Color:SetActiveWidgetIndex(0)
    AnimTime = self.In_Blue:GetEndTime()
  elseif 4 == Rarity then
    if CharId then
      self:PlayAnimation(self.Character_Purple)
      AnimTime = self.Character_Purple:GetEndTime()
    else
      self:PlayAnimation(self.In_Purple)
      AnimTime = self.In_Purple:GetEndTime()
    end
    self.WS_Color:SetActiveWidgetIndex(0)
  elseif 5 == Rarity then
    local function FiveStarFinish()
      if CharId then
        self:PlayAnimation(self.Character_Yellow)
        
        self:PlayCharUISound(CharId)
        AnimTime = self.Character_Yellow:GetEndTime()
      else
        AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_five_star_weapon", "GachaWeapon", nil)
        self:PlayAnimation(self.Weapon_Yellow)
        AnimTime = self.Weapon_Yellow:GetEndTime()
      end
      if self:IsExistTimer("SetClick") then
        self:RemoveTimer("SetClick")
      end
      if AnimTime then
        self:AddTimer(AnimTime, SetClick, false, 0, "SetClick")
      end
    end
    
    self:UnbindAllFromAnimationFinished(self.Icon_In)
    self:PlayAnimation(self.Icon_In)
    self:BindToAnimationFinished(self.Icon_In, {self, FiveStarFinish})
    self.WS_Color:SetActiveWidgetIndex(1)
  end
  if CharId then
    self.VoiceCharId = CharId
  else
    self.VoiceCharId = nil
  end
  self.Group_Share:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.VB_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Share:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self:IsExistTimer("SetClick") then
    self:RemoveTimer("SetClick")
  end
  if AnimTime then
    self:AddTimer(AnimTime, SetClick, false, 0, "SetClick")
  end
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function G:PlayCharUISound(CharId)
  local CharInfo = DataMgr.Char[CharId]
  local CharName = CharInfo.GUIPathVariable
  local SoundPath = "event:/ui/char/gacha_show_" .. CharName
  AudioManager(self):PlayUISound(self, SoundPath, "GachaShow", nil)
end

function G:PlayFiveStarSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_five_star_on_card", "GachaFiveStar", nil)
end

function G:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
  if self.IsSingleGacha and not self.IsManyResults and not self.NotGacha then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local Gacha = Avatar.GachaPool[self.Parent.NowGachaId]
    if 1 ~= Gacha.Usable then
      self.Parent:InitValidGachaPool()
    end
  end
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnClickBtnClose
  })
end

function G:PlayCampIn()
  if self.IsCampAnimation and self.GachaCampUI then
    self.GachaCampUI:PlayAnimation(self.GachaCampUI.In)
  end
end

function G:GetGachaCampUI(BpPath)
  self.IsCampAnimation = true
  self.Group_Camp:ClearChildren()
  local GachaCampUI = UIManager(self):CreateWidget(BpPath, false)
  if not GachaCampUI then
    self.IsCampAnimation = false
    DebugPrint(ErrorTag, "---jzn---Gacha---Camp---error---", BpPath)
    return
  end
  self.Group_Camp:AddChild(GachaCampUI)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(GachaCampUI)
  OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.GachaCampUI = GachaCampUI
  return self.GachaCampUI
end

function G:PlayCharSpineSpecialIn()
  if self.IsSpineAnimation and self.GachaOnceSpineUI then
    self.GachaOnceSpineUI:PlayAnimation(self.GachaOnceSpineUI.Special_In)
  end
end

function G:PlayCharSpine()
  self.Image_Avatar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.IsSpineAnimation and self.GachaOnceSpineUI then
    self.Image_Avatar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.GachaOnceSpineUI.Spine_Char then
      self.GachaOnceSpineUI.Spine_Char:SetAnimation(0, "In_Gacha", false)
      self.GachaOnceSpineUI.Spine_Char:AddAnimation(0, "Loop", true, 0)
    end
    if self.GachaOnceSpineUI.CharTitle then
      self.GachaOnceSpineUI.CharTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function G:GetGachaOnceSpineUI(CharId, SpineName)
  self.SpineContent:ClearChildren()
  local BgPath
  local IsPCPlatform = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  if IsPCPlatform then
    BgPath = CommonConst.GachaBackgroundAddrPC .. SpineName .. "." .. SpineName
  else
    BgPath = CommonConst.GachaBackgroundAddrMobile .. SpineName .. "." .. SpineName
  end
  local GachaOnceSpineUI = UIManager(self):CreateWidget(BgPath, false)
  if not GachaOnceSpineUI then
    self.IsSpineAnimation = false
    DebugPrint(ErrorTag, "---jzn---Gacha---Spine---error---", CharId, SpineName)
    return
  end
  self.SpineContent:AddChild(GachaOnceSpineUI)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(GachaOnceSpineUI)
  OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
  OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.GachaOnceSpineUI = GachaOnceSpineUI
  return self.GachaOnceSpineUI
end

function G:CommonInit(Params)
  self:SetFocus()
  self:UISetGamePaused(self.WidgetName or self.ConfigName, true)
  self.GamePadState = "GachaOnceMain"
  self.Params = Params
  if Params.TargetInfo then
    self.ResultData = Params.TargetInfo
  else
    self.ResultData = {}
    table.insert(self.ResultData, {
      TargetId = Params.TargetId,
      Sign = Params.Sign,
      Rarity = Params.Rarity
    })
  end
  self.NotGacha = true
  self.IsSpineAnimation = false
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self.CurGachaResultIndex = 0
  self.Text_VoiceText:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:RefreshCommonOnceUI()
end

function G:RefreshCommonOnceUI()
  self:SetFocus()
  self:SetInputUIOnly(true)
  self.GamePadState = "GachaOnceMain"
  self.CurGachaResultIndex = self.CurGachaResultIndex + 1
  if self.ResultData[self.CurGachaResultIndex] == nil then
    return
  end
  self:HandleShowResult(self.ResultData[self.CurGachaResultIndex])
  local ShowResult = self.ResultData[self.CurGachaResultIndex]
  self:SetTargetNew(ShowResult.IsNew)
  local TargetName
  if ShowResult.Sign == CommonConst.GachaCharType then
    TargetName = DataMgr.Char[ShowResult.TargetId].CharName
    local CharInfo = DataMgr.Char[ShowResult.TargetId]
    if CharInfo and CharInfo.SpineBp then
      self.IsSpineAnimation = true
      self:GetGachaOnceSpineUI(ShowResult.TargetId, CharInfo.SpineBp)
    else
      self:GetGachaOnceSpineUI(ShowResult.TargetId, "WBP_Gacha_Pool_WidgetMaer")
      self.IsSpineAnimation = true
      DebugPrint(ErrorTag, "----jzn---\230\138\189\229\141\161\229\189\147\229\137\141\232\167\146\232\137\178\230\151\160Spine\232\147\157\229\155\190\232\181\132\230\186\144----", ShowResult.TargetId)
    end
    self:SetCharImgRole(ShowResult.TargetId)
    self:PlayInAnim(ShowResult.Rarity, ShowResult.TargetId)
  elseif ShowResult.Sign == CommonConst.GachaWeaponType then
    TargetName = DataMgr.Weapon[ShowResult.TargetId].WeaponName
    self:SetWeaponImgRole(ShowResult.TargetId)
    self.Text_VoiceText:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:PlayInAnim(ShowResult.Rarity)
  end
  self.Text_WeaponName:SetText(GText(TargetName))
end

function G:HandleShowResult(ShowResult)
  self.IsNeedChange = false
  ShowResult.IsNew = false
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local TargetId = ShowResult.TargetId
  if ShowResult.Sign == CommonConst.GachaCharType then
    local NowGradeCount = 1
    for _, Char in pairs(Avatar.Chars) do
      if Char.CharId == TargetId then
        NowGradeCount = Char.GradeLevel
      end
    end
    if NowGradeCount == CommonConst.GachaOneResult then
      ShowResult.IsNew = true
    end
    local MaxNum = DataMgr.GlobalConstant.CharMaxCardLevelNeedNum.ConstantValue or 7
    local CommonChar = Avatar.CommonChars[TargetId]
    if CommonChar and NowGradeCount == MaxNum and NowGradeCount < CommonChar.Count then
      self.IsNeedChange = true
    end
  elseif ShowResult.Sign == CommonConst.GachaWeaponType and not Avatar:CheckWeaponEnough({
    [TargetId] = 2
  }) then
    ShowResult.IsNew = true
  end
end

function G:OnCloseCallback()
  self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
  self:SetInputUIOnly(false)
  if self.Params.CallbackFunc then
    self.Params.CallbackFunc(self.Params.CallbackObj)
  end
  self:Close()
end

function G:Destruct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshInfoByInputTypeChange)
  end
end

return G
