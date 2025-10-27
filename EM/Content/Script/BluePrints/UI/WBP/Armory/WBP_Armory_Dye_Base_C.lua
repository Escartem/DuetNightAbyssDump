require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ActorController = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local EMCache = require("EMCache.EMCache")
local DyeDraftModel = Class()

function DyeDraftModel:Init(Uuid)
  local AllCache = EMCache:Get("DyeDraft", true) or {}
  local UuidStr = Uuid
  if type(Uuid) == "string" and CommonUtils.IsObjId(Uuid) then
    UuidStr = CommonUtils.ObjId2Str(Uuid)
  end
  AllCache[UuidStr] = AllCache[UuidStr] or {}
  rawset(self, "AllCache", AllCache)
  rawset(self, "Cache", AllCache[UuidStr])
  return self.Cache
end

function DyeDraftModel:GetSkinDyeDraft(SkinId)
  self.Cache[SkinId] = self.Cache[SkinId] or {}
  return self.Cache[SkinId]
end

function DyeDraftModel:SaveDyeDraft()
  if rawget(self, "AllCache") then
    EMCache:Set("DyeDraft", self.AllCache, true)
  end
end

function DyeDraftModel:DeleteDyeDraft(SkinId, PlanIndex)
  self.Cache[SkinId][PlanIndex] = nil
end

function DyeDraftModel:GetDyeDraftPlan(SkinId, PlanIndex)
  return self:GetSkinDyeDraft(SkinId)[PlanIndex]
end

local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:Construct()
  self.IsLoaded = false
  M.Super.Construct(self)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  self:UnbindAllFromAnimationFinished(self.In)
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInAnimFinished
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
  self:SetRenderOpacity(1)
  self.Image_Click.Slot:SetZOrder(-1)
  self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Default:SetText(GText("UI_Dye_Default"))
  self.Text_Default_1:SetText(GText("UI_Armory_Dye_Default"))
  self.Text_Title_R:SetText(GText("UI_Dye_Total"))
  rawset(self, "AllPlanNames", {
    "UI_Squad_Appearance_TITLE1",
    "UI_Squad_Appearance_TITLE2",
    "UI_Squad_Appearance_TITLE3"
  })
  self.Btn_Done:BindEventOnClicked(self, self.OnDoneBtnClicked)
  self.Btn_Done:BindForbidStateExecuteEvent(self, self.OnForbiddenDoneBtnClicked)
  self.Btn_Save:BindEventOnClicked(self, self.OnSaveBtnClicked)
  self.Btn_Save:BindForbidStateExecuteEvent(self, self.OnForbiddenSaveBtnClicked)
  self.Btn_Share:BindEventOnClicked(self, self.OnShareBtnClicked)
  self.Btn_PreviewSave:BindEventOnClicked(self, self.OnPreviewSaveBtnClicked)
  self.Btn_Hide:BindEvents(self, {
    OnClicked = self.OnHideUIKeyDown,
    OnAddedToFocusPath = self.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnFunctionBtnRemovedFromFocusPath
  })
  self.Btn_Hide.Text_Name:SetText(GText("UI_Dye_HideUI"))
  self.Btn_Compare:BindEvents(self, {
    OnPressed = self.OnContrastKeyDown,
    OnReleased = self.OnContrastKeyUp,
    OnAddedToFocusPath = self.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnFunctionBtnRemovedFromFocusPath
  })
  self.Btn_Compare.Text_Name:SetText(GText("UI_Dye_Compare"))
  self.Btn_Delete:BindEvents(self, {
    OnClicked = self.OnDeleteBtnClicked,
    OnAddedToFocusPath = self.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnFunctionBtnRemovedFromFocusPath
  })
  self.Btn_Delete.Text_Name:SetText(GText("UI_RegionMap_Delete"))
  self.Btn_Import:BindEvents(self, {
    OnClicked = self.OnImportBtnClicked,
    OnAddedToFocusPath = self.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnFunctionBtnRemovedFromFocusPath
  })
  self.Btn_Import.Text_Name:SetText(GText("UI_Dye_Input_Title"))
  self.List_Tab.BP_OnEntryInitialized:Clear()
  self.List_Tab.BP_OnEntryInitialized:Add(self, self.OnNormalDyeTabInitialized)
  self:AddDispatcher(EventID.OnWeaponColorsChanged, self, self.OnColorsChanged)
  self:AddDispatcher(EventID.OnCharColorsChanged, self, self.OnColorsChanged)
  self:AddDispatcher(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
  self:AddDispatcher(EventID.OnCharSkinColorPlanChanged, self, self.OnCharSkinColorPlanChanged)
  self:AddDispatcher(EventID.OnWeaponSkinColorPlanChanged, self, self.OnWeaponSkinColorPlanChanged)
  rawset(self, "NormalColorTabIdx", 1)
  rawset(self, "SpecialColorTabIdx", 2)
  rawset(self, "ColorPerRow", 3)
  rawset(self, "SpecialColorContents", {})
  rawset(self, "SpecialColorContentsMap", {})
  rawset(self, "NormalDefaultColorContents", {})
  rawset(self, "NormalCurrentContents", {})
  rawset(self, "NormalComparedContents", {})
  rawset(self, "ColorContents", {})
  rawset(self, "ColorContentsMap", {})
  rawset(self, "HighLightColor", self.WPHighLightColor.Color)
  rawset(self, "NeedRegenerateAllEntries", true)
  rawset(self, "bCanSavePlan", true)
  rawset(self, "bShowPlan", true)
  self.Tab_Dye:Init(self.TabConfig)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if self.ActorController then
    if self.UsingWeapon then
      self.UsingWeapon = self.ArmoryPlayer and self.ArmoryPlayer.UsingWeapon
      if self.SkinId then
        self.UsingWeapon:InitWeaponSkin(self.SkinId)
      end
    end
    self:OnContrastKeyUp()
  end
end

function M:Destruct()
  M.Super.Destruct(self)
  self.ActorController:StopSkinWeaponVFX()
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return self:OnPointerMove(MyGeometry, MouseEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnPointerUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnPointerMove(MyGeometry, InTouchEvent)
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnBackgroundClicked()
  if self.bSelfHidden then
    self:OnHideUIKeyDown()
  end
end

function M:OnBackKeyDown()
  if self.bSelfHidden then
    self:OnHideUIKeyDown()
  elseif self.Btn_Save:IsBtnForbidden() or self.OpenPreviewDyeFromChat then
    self:PlayOutAnim()
  else
    UIManager(self):ShowCommonPopupUI(100231, {
      LeftCallbackFunction = function()
        self:PlayOutAnim()
      end,
      RightCallbackFunction = function()
        self:SaveCurrentDraft()
        self:PlayOutAnim()
      end
    }, self)
  end
end

function M:OnDeleteBtnClicked()
  UIManager(self):ShowCommonPopupUI(100230, {
    RightCallbackFunction = function()
      self:DeleteCurrentDraft()
      self:UpdateComparedContentsByDraft()
      local CurrentTabIdx = self.CurrentTabIdx
      self.CurrentTabIdx = nil
      self.JumpToSubTabIdx = self.CurNormalDyeTab and self.CurNormalDyeTab.Idx or 1
      self:SelectDyePlan(self.CurrentPlan, CurrentTabIdx)
      self:OnContrastKeyUp()
    end
  }, self)
end

function M:ClearComparedContents()
  for key, value in pairs(self.NormalComparedContents) do
    value.IsClicked = false
    if value.Widget then
      value.Widget:SetIsClicked(false)
    end
  end
  self.NormalComparedContents = {}
  if self.SpecialComparedContent then
    self.SpecialComparedContent.IsClicked = false
    if self.SpecialComparedContent.Widget then
      self.SpecialComparedContent.Widget:SetIsClicked(false)
    end
    self.SpecialComparedContent = nil
  end
  for i, Obj in pairs(self.NormalDyeTabs) do
    local Content = self.NormalCurrentContents[i]
    Obj.Color = Content.Color
    Obj.Color = Content.ResourceId and Content.Color
    if Obj.Widget then
      Obj.Widget:SetColor(Content.ResourceId and Content.Color)
    end
    Obj.IsSelected = i == (self.CurNormalDyeTab and self.CurNormalDyeTab.Idx)
  end
end

function M:OnImportBtnClicked()
  local Params = {}
  Params.TextLenMax = 200
  Params.MultilineType = 1
  Params.HintText = GText("UI_Dye_Input_Content")
  Params.UseGenaral = true
  
  function Params.RightCallbackFunction(self2, Data)
    local shareCode = Data.ComDialogInput.Text
    if shareCode and "" ~= shareCode then
      local ModModel = ModController:GetModel()
      local dyePlanInfo = ModModel:AnalysisShareCommunityCopyCode(shareCode)
      local TargetToastText = ""
      if not dyePlanInfo then
        TargetToastText = GText("UI_Dye_Input_Invaluable")
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, TargetToastText)
        return
      end
      if dyePlanInfo.SkinId ~= self.SkinId then
        local TargetName
        if dyePlanInfo.SkinType == "Char" then
          TargetName = DataMgr.Skin[dyePlanInfo.SkinId].SkinName
        else
          TargetName = DataMgr.WeaponSkin[dyePlanInfo.SkinId] and DataMgr.WeaponSkin[dyePlanInfo.SkinId].Name or DataMgr.Weapon[dyePlanInfo.SkinId].WeaponName
        end
        TargetName = GText(TargetName)
        TargetToastText = string.format(GText("UI_Dye_Input_Other"), TargetName)
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, TargetToastText)
        return
      end
      TargetToastText = GText("UI_Dye_Input_Success")
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, TargetToastText)
      self:ApplyColorsToComparedColors(dyePlanInfo.Colors)
      self:ApplyColorsToNormalDyeTabs(dyePlanInfo.Colors)
      self:SaveCurrentDraft()
      self:UpdateItemConsume()
      self:UpdateDraftBtn()
    end
  end
  
  UIManager(self):ShowCommonPopupUI(100232, Params, self)
end

function M:OnSaveBtnClicked()
  self:SaveCurrentDraft()
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Save_Success"))
end

function M:OnShareBtnClicked()
  self:OpenOrCloseDyeShareUI()
  self:ShareCurrentDraft()
end

function M:OpenOrCloseDyeShareUI()
  if self.DyeShare and self.DyeShare:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    self.DyeShare:SetVisibility(UIConst.VisibilityOp.Visible)
    local Params = {}
    Params.Parent = self
    Params.DyeDraftModel = DyeDraftModel
    self.DyeShare:InitUIInfo(Params)
  elseif self.DyeShare and self.DyeShare:GetVisibility() == UIConst.VisibilityOp.Visible then
    self.DyeShare:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnForbiddenSaveBtnClicked()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    self.ActorController = ArmoryMain.ActorController
    self.ArmoryHelper = ArmoryMain.ActorController.ArmoryHelper
    self.ArmoryPlayer = ArmoryMain.ActorController.ArmoryPlayer
  end
  Params = Params or {}
  self.Parent = Params.Parent
  self.SkinId = Params.SkinId
  self.IsPreviewMode = Params.IsPreviewMode
  self.Type = Params.Type
  self.Target = Params.Target
  self.OnCloseCallback = Params.OnCloseCallback
  self.ContrastKeyDownCount = 0
  self.CurrentTabIdx = nil
  self.bRealCharOrWeapon = Params.bRealCharOrWeapon
  self.OpenPreviewDyeFromShopItem = Params.OpenPreviewDyeFromShopItem
  self.OpenPreviewDyeFromChat = self.Parent.OpenPreviewDyeFromChat
  self:StopAnimation(self.SwitcherState)
  local Avatar = GWorld:GetAvatar()
  self.bOwnTargetSkin = false
  if self.Target:GetSkin(self.SkinId, Avatar) then
    self.bOwnTargetSkin = true
  end
  if self.Type == CommonConst.ArmoryType.Char then
    self.DefaultColorId = DataMgr.GlobalConstant.CharDefaultColor.ConstantValue
    self.ColorPartCount = DataMgr.GlobalConstant.CharColorPart.ConstantValue
    local CommonChar = Avatar.CommonChars[self.Target.CharId]
    if CommonChar then
      self.CurrentSkin = CommonChar.OwnedSkins[self.SkinId] or self:CreateDefaultSkin(self.SkinId)
    else
      self.CurrentSkin = self:CreateDefaultSkin(self.SkinId)
    end
  else
    self.DefaultColorId = DataMgr.GlobalConstant.WeaponDefaultColor.ConstantValue
    self.ColorPartCount = DataMgr.GlobalConstant.WeaponColorPart.ConstantValue
    self.UsingWeapon = self.ArmoryPlayer and self.ArmoryPlayer.UsingWeapon
    self.WeaponEnhanceLevel = self.Target.EnhanceLevel or 0
    self.CurrentSkin = self.Target:GetSkin(self.SkinId) or self:CreateDefaultSkin(self.SkinId)
    self:CreateSpecialDefaultColorMat()
    self:CreateSpecialColorContents()
  end
  if not self.ActorController then
    self.ActorController = self.Parent.ActorController
  end
  if self.ActorController then
    self.ArmoryHelper = self.ActorController.ArmoryHelper
    self.ArmoryHelper.EnableCameraScrolling = true
    self.ArmoryPlayer = self.ActorController.ArmoryPlayer
    local WeaponActor = self.ActorController:GetWeaponActor()
    if nil == WeaponActor then
      self.WaitForCreateActor = true
      self.ActorController:GetWeaponActorAsync(self.OnActorCreated, self)
    else
      self:OnActorCreated(WeaponActor)
    end
  end
end

function M:OnActorCreated(WeaponActor)
  self.WaitForCreateActor = false
  self.UsingWeapon = WeaponActor
  self.bStandaloneWeapon = self.ActorController.bStandaloneWeapon
  if not self.bStandaloneWeapon then
    self.bStandaloneWeapon = not self.ActorController.ArmoryPlayer
  end
  self.LastCameraTags = self.ActorController.LastCameraTags
  if self.Type == CommonConst.ArmoryType.Char then
    self.ActorController:SetArmoryCameraTag("Char_Dye")
  elseif self.Type == CommonConst.ArmoryType.Weapon and self.ArmoryPlayer and not self.bStandaloneWeapon then
    self.ActorController:SetArmoryCameraTag("Weapon", "0", "Dye")
  elseif self.Type == CommonConst.ArmoryType.Weapon and (not self.ArmoryPlayer or self.bStandaloneWeapon) then
  else
    self.ActorController:SetArmoryCameraTag("Default")
  end
  self:InitUI()
end

function M:InitUI()
  self:CreateNormalDefaultColor()
  self:CreateNormalColorContents()
  
  local function IsCacheValid()
    if not self.Cache then
      return false
    elseif not self.Cache[self.SkinId] then
      return false
    elseif #self.Cache[self.SkinId] <= 0 then
      return false
    end
    return true
  end
  
  self.Cache = DyeDraftModel:Init(self.Target.Uuid)
  if not IsCacheValid() then
    self.Cache = DyeDraftModel:Init(self.SkinId)
  end
  self.CurrentPlan = self.CurrentSkin.CurrentPlanIndex or 1
  local bApplyDraft = false
  if self.OpenPreviewDyeFromShopItem then
    self.Btn_PreviewSave:SetText(GText("UI_SkinPreview_PreSave"))
    self.Btn_PreviewSave:ForbidBtn(true)
  elseif self.OpenPreviewDyeFromChat then
    self.OpenPreviewDyeFromChatColors = self.Parent.OpenPreviewDyeFromChatColors
    self.Btn_PreviewSave:SetText(GText("UI_Dye_Input_Title"))
    self.Btn_PreviewSave:ForbidBtn(false)
  end
  if self.OpenPreviewDyeFromChatColors then
    self:ApplyColorsToComparedColors(self.OpenPreviewDyeFromChatColors)
    bApplyDraft = true
  else
    bApplyDraft = self:UpdateComparedContentsByDraft()
    if bApplyDraft then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("UI_Armory_Dye_Toast"), self.CurrentPlan))
    end
  end
  self:SelectDyePlan(self.CurrentPlan, self.JumpToTabIdx)
  self:ResetPlanName()
  self:UpdateDraftBtn()
  if bApplyDraft then
    self:OnContrastKeyUp()
  end
  self:PlayInAnim()
end

function M:ApplyColorsToComparedColors(TargetColors)
  for Idx, ColorId in ipairs(TargetColors) do
    local ColorContent
    if -1 ~= tonumber(ColorId) then
      ColorContent = self.ColorContentsMap[tonumber(ColorId)]
    else
      ColorContent = self.NormalDefaultColorContents[Idx]
    end
    if ColorContent then
      self:ChangePartColor(Idx, ColorContent.Color)
      local CmpContent = self.NormalComparedContents[Idx]
      if CmpContent and CmpContent ~= ColorContent then
        CmpContent.IsClicked = false
        if CmpContent.Widget then
          CmpContent.Widget:SetIsClicked(CmpContent.IsClicked)
        end
      end
      local CurTabIdx = self.CurNormalDyeTab and self.CurNormalDyeTab.Idx or 1
      ColorContent.IsClicked = CurTabIdx == Idx
      if ColorContent.Widget then
        ColorContent.Widget:SetIsClicked(ColorContent.IsClicked)
      end
      self.NormalComparedContents[Idx] = ColorContent
    end
  end
end

function M:ApplyColorsToNormalDyeTabs(TargetColors)
  local AllDyeTabItems = self.List_Tab:GetListItems()
  for Idx, DyeTabItem in pairs(AllDyeTabItems) do
    if not TargetColors[Idx] then
    else
      local ColorContent
      if -1 ~= tonumber(TargetColors[Idx]) then
        ColorContent = self.ColorContentsMap[tonumber(TargetColors[Idx])]
        DyeTabItem.Color = ColorContent.Color
      else
        ColorContent = self.NormalDefaultColorContents[Idx]
        DyeTabItem.Color = nil
      end
      if not ColorContent then
      elseif DyeTabItem.Widget then
        DyeTabItem.Widget:SetColor(DyeTabItem.Color)
      end
    end
  end
end

function M:SelectDyePlan(PlanIndex, TabIdx)
  self.CurrentPlan = PlanIndex
  TabIdx = TabIdx or 1
  self:OnDyeingTypeTabClicked({Idx = TabIdx})
  if self.Type == CommonConst.ArmoryType.Char then
    self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateItemConsume()
end

function M:ResetPlanName()
  if self.bShowPlan then
    self.Plan_Dye:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Plan_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local PlanNames = self:GetPlanNames()
  local Params = {
    Owner = self,
    OnPlanChanged = self.SwitchColorPlan,
    PlanNames = PlanNames,
    SelectedItemIndex = self.CurrentPlan
  }
  self:OnModifyPlanParams(Params)
  self.Plan_Dye:Init(Params)
end

function M:OnModifyPlanParams(Params)
end

function M:GetPlanNames()
  return self.AllPlanNames
end

function M:SwitchColorPlan(NewPlanIndex)
  if NewPlanIndex == self.CurrentPlan then
    return
  end
  
  local function CallServerSwitchPlan()
    self:BlockAllUIInput(true)
    local Avatar = GWorld:GetAvatar()
    if self.Type == CommonConst.ArmoryType.Char then
      Avatar:SwitchCurrentCharSkinColorPlan(self.CurrentSkin.SkinId, NewPlanIndex)
    else
      Avatar:SwitchCurrentWeaponSkinColorPlan(self.Target.Uuid, self.CurrentSkin.SkinId, NewPlanIndex)
    end
  end
  
  if self.Btn_Save:IsBtnForbidden() or self.OpenPreviewDyeFromChat then
    CallServerSwitchPlan()
  else
    UIManager(self):ShowCommonPopupUI(100231, {
      OnCloseCallbackFunction = function()
        self:ResetPlanName()
      end,
      LeftCallbackFunction = function()
        CallServerSwitchPlan()
      end,
      RightCallbackFunction = function()
        self:SaveCurrentDraft()
        CallServerSwitchPlan()
      end
    }, self)
  end
end

function M:UpdateComparedContentsByDraft()
  local CurrentPlanDraft = DyeDraftModel:GetDyeDraftPlan(self.CurrentSkin.SkinId, self.CurrentPlan) or {}
  local bApplyDraft = false
  if self.SpecialComparedContent then
    self.SpecialComparedContent.IsClicked = false
    self.SpecialComparedContent = nil
  end
  if self.NormalComparedContents then
    for key, value in pairs(self.NormalComparedContents) do
      value.IsClicked = false
    end
    self.NormalComparedContents = {}
  end
  if CurrentPlanDraft.SpecialColor then
    self.SpecialComparedContent = self.SpecialColorContentsMap[CurrentPlanDraft.SpecialColor]
    if self.SpecialComparedContent then
      self.JumpToTabIdx = self.SpecialColorTabIdx
      local CurrentSpecialColor = self.CurrentSkin:GetSpecialColor(self.CurrentPlan)
      bApplyDraft = CurrentSpecialColor ~= CurrentPlanDraft.SpecialColor
    end
  else
    self.JumpToTabIdx = self.NormalColorTabIdx
    local bHasDraftColor = false
    for key, value in pairs(CurrentPlanDraft) do
      if self.ColorContentsMap[value] then
        self.NormalComparedContents[key] = self.ColorContentsMap[value]
        bHasDraftColor = true
      end
    end
    if bHasDraftColor then
      local Colors = self.CurrentSkin:GetColors(self.CurrentPlan)
      for PartIdx, DraftColorId in pairs(CurrentPlanDraft) do
        local CurrentColorId = Colors[PartIdx] or self.DefaultColorId
        if CurrentColorId ~= DraftColorId then
          bApplyDraft = true
          break
        end
      end
    end
  end
  return bApplyDraft
end

function M:UpdateDraftBtn()
  if DyeDraftModel:GetDyeDraftPlan(self.CurrentSkin.SkinId, self.CurrentPlan) then
    self.Btn_Delete:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Delete:SetForbidden(false)
  else
    self.Btn_Delete:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Delete:SetForbidden(true)
  end
  if self.Btn_Compare.IsForbidden or self:IsSameDyeDraft() then
    self.Btn_Save:ForbidBtn(true)
  else
    self.Btn_Save:ForbidBtn(false)
  end
  self:UpdatePreviewOrNotUI()
end

function M:SaveCurrentDraft()
  local SkinDraft = DyeDraftModel:GetSkinDyeDraft(self.CurrentSkin.SkinId)
  local DyePlanDraft = SkinDraft[self.CurrentPlan] or {}
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    for PartIdx, value in pairs(self.NormalComparedContents) do
      DyePlanDraft[PartIdx] = value.ColorId
    end
  else
    DyePlanDraft.SpecialColor = self.SpecialComparedContent and self.SpecialComparedContent.ColorId
  end
  SkinDraft[self.CurrentPlan] = DyePlanDraft
  DyeDraftModel:SaveDyeDraft()
  self:UpdateCurrentDyeTabSaveOrSelect()
  self:UpdateDraftBtn()
end

function M:UpdatePreviewOrNotUI()
  local TargetVisiblity = UIConst.VisibilityOp.Collapsed
  if not self.IsPreviewMode then
    TargetVisiblity = UIConst.VisibilityOp.Visible
    self.WidgetSwitcher_Preview:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_Preview:SetActiveWidgetIndex(1)
  end
  
  local function ProcessUIVisibility(Target, InTargetVisiblity)
    if Target and Target:GetVisibility() ~= InTargetVisiblity then
      Target:SetVisibility(InTargetVisiblity)
    end
  end
  
  ProcessUIVisibility(self.Btn_Share, TargetVisiblity)
  ProcessUIVisibility(self.Btn_Import, TargetVisiblity)
  ProcessUIVisibility(self.Btn_Save, TargetVisiblity)
  if self.IsPreviewMode then
    ProcessUIVisibility(self.Btn_Delete, TargetVisiblity)
    ProcessUIVisibility(self.Panel_Cost, TargetVisiblity)
  end
  ProcessUIVisibility(self.DyeSharePanel, TargetVisiblity)
  if not self.IsPreviewMode or self.OpenPreviewDyeFromShopItem then
    ProcessUIVisibility(self.Panel_Plan, TargetVisiblity)
  elseif self.OpenPreviewDyeFromChat then
    ProcessUIVisibility(self.Panel_Plan, UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:DeleteCurrentDraft()
  DyeDraftModel:DeleteDyeDraft(self.CurrentSkin.SkinId, self.CurrentPlan)
  self:UpdateDraftBtn()
end

function M:ShareCurrentDraft()
end

function M:ImportDraft(DraftInfo)
  if self.IsPreviewMode and self.OpenPreviewDyeFromChat then
    if not self:HasRealTargetAndSkin() then
      return
    end
    local CommonDialogParams = {}
    CommonDialogParams.ShortText = GText("UI_Dye_Save_Content")
    
    function CommonDialogParams.RightCallbackFunction()
      self:SaveCurrentDraft()
      self:UpdatePreviewOrNotUI()
    end
    
    CommonDialogParams.Title = GText("UI_Dye_Save_Title")
    UIManager(self):ShowCommonPopupUI(100231, CommonDialogParams, self)
  elseif not self.IsPreviewMode then
    self:SaveCurrentDraft()
    self:UpdatePreviewOrNotUI()
  end
end

function M:HasRealTargetAndSkin()
  local TargetToastText = ""
  if self.bRealCharOrWeapon then
    if self.bOwnTargetSkin then
      return true
    else
      TargetToastText = "UI_Dye_Input_NoSkin"
    end
  elseif self.Type == CommonConst.ArmoryType.Char then
    TargetToastText = "UI_Dye_Input_NoChar"
  elseif self.Type == CommonConst.ArmoryType.Weapon then
    TargetToastText = "UI_Dye_Input_NoWeapon"
  end
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(TargetToastText))
  return false
end

function M:CreateDefaultSkin(SkinId)
  local Skin = {
    SkinId = SkinId,
    Colors = {},
    SpecialColor = self.DefaultColorId,
    GetColors = function(self, CurrentPlan)
      return self.Colors
    end,
    GetWeaponSpecialColor = function(self, CurrentPlan)
      return self.SpecialColor
    end
  }
  for i = 1, self.ColorPartCount do
    Skin.Colors[i] = self.DefaultColorId
  end
  return Skin
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.IsLoaded = true
end

function M:OnDyeingTypeTabClicked(TabWidget)
  if TabWidget.Idx == self.CurrentTabIdx then
    return
  end
  if TabWidget.Idx == self.NormalColorTabIdx then
    if self:IsAnimationPlaying(self.SwitcherState) then
      self:PlayAnimationReverse(self.SwitcherState)
    else
      self:PlayAnimation(self.SwitcherState, 0, 1, 1)
    end
  elseif self:IsAnimationPlaying(self.SwitcherState) then
    self:PlayAnimationForward(self.SwitcherState)
  else
    self:PlayAnimation(self.SwitcherState)
  end
  self:SelectDyeingTypeTab(TabWidget.Idx)
end

function M:SelectDyeingTypeTab(TabIdx)
  self:RecoverActorColor()
  self.CurrentTabIdx = TabIdx
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    self:ClearSpecialColorStates()
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:InitNormalDyeing(self.JumpToSubTabIdx)
    self.JumpToSubTabIdx = nil
  else
    self:ClearNormalColorStates()
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:InitSpecialDyeing()
  end
end

function M:OnColorListItemClicked(Content)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_color", nil, nil)
  if self.Parent and self.OpenPreviewDyeFromChat then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Previewing"))
    if Content.Widget then
      Content.Widget.OpenPreviewDyeFromChat = true
    end
    return
  end
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    if not self.NormalColorHoveredContent then
      self:OnNormalColorListItemHovered(Content)
    end
    self:OnNormalColorListItemClicked(Content)
    self.NormalColorHoveredContent = nil
  else
    if not self.SpecialColorHoveredContent then
      self:OnSpecialColorListItemHovered(Content)
    end
    self:OnSpecialColorListItemClicked(Content)
    self.SpecialColorHoveredContent = nil
  end
  if self.OpenPreviewDyeFromShopItem then
    self.Btn_PreviewSave:ForbidBtn(false)
  end
end

function M:OnColorListItemHovered(Content)
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    self:OnNormalColorListItemHovered(Content)
  else
    self:OnSpecialColorListItemHovered(Content)
  end
end

function M:OnColorListItemUnhovered(Content)
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    self:OnNormalColorListItemUnhovered(Content)
  else
    self:OnSpecialColorListItemUnhovered(Content)
  end
end

function M:CreateNormalColorContents()
  self.BP_NormalColorContents:Clear()
  local SwatchData = DataMgr.Swatch
  rawset(self, "ColorContents", {})
  rawset(self, "ColorContentsMap", {})
  rawset(self, "NormalColorHoveredContent", nil)
  for key, value in pairs(SwatchData) do
    local Obj = {}
    Obj.ColorId = key
    Obj.Fresnel = value.Fresnel
    local Color = value.ColorNumber or {}
    Obj.Color = FLinearColor()
    UKismetMathLibrary.LinearColor_SetFromSRGB(Obj.Color, FColor(Color[1] or 0, Color[2] or 0, Color[3] or 0))
    if value.ActualR and value.ActualG and value.ActualB then
      Obj.ActualColor = FLinearColor(value.ActualR, value.ActualG, value.ActualB)
    else
      Obj.ActualColor = Obj.Color
    end
    Obj.ResourceId = value.ResourceID
    Obj.Event_OnClicked = self.OnColorListItemClicked
    Obj.Event_OnHovered = self.OnColorListItemHovered
    Obj.Event_OnUnhovered = self.OnColorListItemUnhovered
    Obj.Owner = self
    table.insert(self.ColorContents, Obj)
    self.ColorContentsMap[Obj.ColorId] = Obj
  end
  table.sort(self.ColorContents, function(a, b)
    return a.ColorId < b.ColorId
  end)
  local Obj
  rawset(self, "ListContents", {})
  for index, value in ipairs(self.ColorContents) do
    if 1 == index % self.ColorPerRow then
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Owner = self
      Obj.ColorContents = {}
      self.BP_NormalColorContents:Add(Obj)
      table.insert(self.ListContents, Obj)
      self:OnNormalColorListContentCreated(Obj)
    end
    value.ListContent = Obj
    value.Idx = index
    table.insert(Obj.ColorContents, value)
  end
  for index, value in ipairs(self.ColorContents) do
    self:OnNormalColorContentCreated(value)
  end
  rawset(self, "NormalDefaultColorContents", {})
  rawset(self, "NormalCurrentContents", {})
  rawset(self, "NormalComparedContents", {})
  local Colors = self.CurrentSkin:GetColors(self.CurrentPlan)
  for i = 1, self.ColorPartCount do
    local ColorId = Colors[i] or self.DefaultColorId
    local Color, Fresnel = self:GetDefaultColor(i)
    local Content = {
      ColorId = self.DefaultColorId,
      Owner = self,
      Color = Color,
      ActualColor = Color,
      Fresnel = Fresnel,
      Event_OnClicked = self.OnColorListItemClicked,
      Event_OnHovered = self.OnColorListItemHovered,
      Event_OnUnhovered = self.OnColorListItemUnhovered
    }
    if ColorId == self.DefaultColorId then
      self.NormalCurrentContents[i] = self.NormalDefaultColorContents[i]
    else
      self.NormalCurrentContents[i] = self.ColorContentsMap[ColorId]
    end
    table.insert(self.NormalDefaultColorContents, Content)
    self:OnNormalColorContentCreated(Content)
  end
end

function M:InitNormalDyeing(JumpToTabIdx)
  self:ResetNormalCurrentContens()
  self:InitNormalDyeTabs(JumpToTabIdx)
  self.CurNormalDyeTab = nil
  local Tab = self.NormalDyeTabs[JumpToTabIdx] or self.NormalDyeTabs[1]
  self:OnNormalDyeTabInit(Tab)
  self:UpdateItemConsume()
end

function M:ClearNormalColorStates()
  self.NormalComparedContents = {}
  for _, value in ipairs(self.NormalDefaultColorContents) do
    value.IsSelected = false
    value.IsClicked = false
  end
  for _, value in ipairs(self.ColorContents) do
    value.IsSelected = false
    value.IsClicked = false
  end
end

function M:ResetNormalCurrentContens()
  self.NormalCurrentContents = {}
  local Colors = self.CurrentSkin:GetColors(self.CurrentPlan)
  for Idx = 1, self.ColorPartCount do
    local ColorId = Colors[Idx] or self.DefaultColorId
    if ColorId == self.DefaultColorId then
      self.NormalCurrentContents[Idx] = self.NormalDefaultColorContents[Idx]
    else
      self.NormalCurrentContents[Idx] = self.ColorContentsMap[ColorId] or self.NormalDefaultColorContents[Idx]
    end
  end
end

function M:CreateNormalDefaultColor()
  if self.Type == CommonConst.ArmoryType.Char then
    self.DefaultColors = {
      self:GetCharDefaultColorsFromDataTable(self.ArmoryPlayer)
    }
    self.DefaultFresnel = {
      [8] = self.DefaultColors[#self.DefaultColors]
    }
    local ArmoryPlayer = self.ArmoryPlayer
    self.DefaultColors[9] = ArmoryPlayer.CharacterFashion:GetEffectColor()
  else
    self.DefaultColors = {
      self:GetWeaponDefaultColorsFromDataTable(self.UsingWeapon)
    }
    self.DefaultFresnel = {}
  end
end

function M:GetDefaultColor(PartIdx)
  if self.DefaultColors[PartIdx] then
    return self.DefaultColors[PartIdx], self.DefaultFresnel[PartIdx]
  else
    return FLinearColor()
  end
end

function M:InitNormalDyeTabs(JumpToTabIdx)
  self.NormalDyeTabs = {}
  local SwatchData = DataMgr.Swatch
  self.List_Tab:ClearListItems()
  local Colors
  if self.NormalComparedContents and next(self.NormalComparedContents) then
    Colors = {}
    for key, value in pairs(self.NormalComparedContents) do
      Colors[key] = value.ColorId
    end
  else
    Colors = self.CurrentSkin:GetColors(self.CurrentPlan)
  end
  for i = 1, self.ColorPartCount do
    local ColorId = Colors[i]
    local ColorData = SwatchData[ColorId]
    ColorData = ColorData and ColorData.ColorNumber
    local Color
    if ColorData then
      Color = FLinearColor()
      UKismetMathLibrary.LinearColor_SetFromSRGB(Color, FColor(ColorData[1] or 0, ColorData[2] or 0, ColorData[3] or 0))
    end
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Owner = self
    Obj.Text = i
    Obj.Color = Color
    Obj.Idx = i
    Obj.IsSelected = i == (JumpToTabIdx or 1)
    table.insert(self.NormalDyeTabs, Obj)
    self:OnNoramlDyeTabContentCreated(Obj)
    self.List_Tab:AddItem(Obj)
  end
end

function M:OnNoramlDyeTabContentCreated(Content)
end

function M:OnNormalDyeTabInitialized(Content, Widget)
  if IsValid(Widget) then
    Widget:BindEventOnClicked(self, self.OnNormalDyeTabClicked)
  end
end

function M:OnNormalColorListItemClicked(Content)
  self:NormalColorClickLogic(Content)
end

function M:NormalColorClickLogic(Content)
  local CurTabIdx = self.CurNormalDyeTab.Idx
  local CurTabComparedContent = self.NormalComparedContents[CurTabIdx]
  if Content and Content == CurTabComparedContent then
    return
  end
  if CurTabComparedContent then
    CurTabComparedContent.IsClicked = false
    if CurTabComparedContent.Widget then
      CurTabComparedContent.Widget:SetIsClicked(false)
    end
  end
  self.NormalComparedContents[CurTabIdx] = Content
  self:UpdateItemConsume()
  self.CurNormalDyeTab.Color = Content.ResourceId and Content.Color
  if self.CurNormalDyeTab.Widget then
    self.CurNormalDyeTab.Widget:SetColor(Content.ResourceId and Content.Color)
  end
  if 9 == CurTabIdx then
    self.ActorController:ChangeSkinWeaponVFXColor(Content.Color)
  end
end

function M:OnNormalColorListItemHovered(Content)
  self.NormalColorHoveredContent = Content
  if self.bContrastKeyDown then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/color_change", nil, nil)
  self:NormalColorHoverLogic(Content)
end

function M:NormalColorHoverLogic(Content)
  if self.WaitForCreateActor then
    return
  end
  if self.CurrentSkin:GetWeaponSpecialColor(self.CurrentPlan) ~= self.DefaultColorId and not next(self.NormalComparedContents) and self.SpecialDefaultContent then
    self:ChangeSpecialColor(self.SpecialDefaultContent)
  end
  self:ChangePartColor(self.CurNormalDyeTab.Idx, Content.ActualColor, Content.Fresnel)
  if 9 == self.CurNormalDyeTab.Idx then
    self.ActorController:ChangeSkinWeaponVFXColor(Content.Color)
  end
end

function M:OnNormalColorListItemUnhovered()
  if self.WaitForCreateActor then
    return
  end
  self.NormalColorHoveredContent = nil
  if self.bContrastKeyDown then
    return
  end
  local CurNormalDyeTabIdx = self.CurNormalDyeTab.Idx
  local Content = self.NormalComparedContents[CurNormalDyeTabIdx] or self.NormalCurrentContents[CurNormalDyeTabIdx]
  if 9 == self.CurNormalDyeTab.Idx then
    self.ActorController:ChangeSkinWeaponVFXColor(Content.Color)
  end
  if not next(self.NormalComparedContents) and self.CurrentSkin:GetWeaponSpecialColor(self.CurrentPlan) ~= self.DefaultColorId and self.SpecialCurrentContent then
    self:ChangeSpecialColor(self.SpecialCurrentContent)
  else
    self:ChangePartColor(CurNormalDyeTabIdx, Content.ActualColor, Content.Fresnel)
  end
end

function M:OnNormalDyeTabClicked(TabContent)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:OnNormalDyeTabInit(TabContent)
end

function M:OnNormalDyeTabInit(TabContent)
  if TabContent and TabContent == self.CurNormalDyeTab then
    return
  end
  if 9 == TabContent.Idx then
    self.ActorController:SkinWeaponVFX(TabContent.Color or self.DefaultColors[9])
  else
    self.ActorController:StopSkinWeaponVFX()
  end
  self.NormalDefaultContent = self.NormalDefaultColorContents[TabContent.Idx]
  if self.CurNormalDyeTab then
    self.CurNormalDyeTab.IsSelected = false
    if self.CurNormalDyeTab.Widget then
      self.CurNormalDyeTab.Widget:OnUnclicked()
    end
  end
  TabContent.IsSelected = true
  self.EMList_Normal:ScrollToTop()
  self.CurNormalDyeTab = TabContent
  local CurPartTabIdx = TabContent.Idx
  local CurTabSelectedColorContent = self.NormalCurrentContents[CurPartTabIdx]
  local CurTabComparedColorContent = self.NormalComparedContents[CurPartTabIdx]
  local DyePlanDraft = DyeDraftModel:GetDyeDraftPlan(self.CurrentSkin.SkinId, self.CurrentPlan) or {}
  for _, Content in ipairs(self.ColorContents) do
    Content.IsSelected = CurTabSelectedColorContent == Content
    Content.IsClicked = CurTabComparedColorContent == Content
    Content.IsSaveInDraft = DyePlanDraft[CurPartTabIdx] == Content.ColorId
    if Content.IsSaveInDraft then
      self.CurrentDyeTabDraftContent = Content
    end
  end
  self.NormalDefaultContent.IsSelected = self.NormalDefaultContent == CurTabSelectedColorContent
  self.NormalDefaultContent.IsClicked = self.NormalDefaultContent == CurTabComparedColorContent
  self.ColorLump_Default:OnListItemObjectSet(self.NormalDefaultContent)
  local PartColorIds
  if self.Type == CommonConst.ArmoryType.Char then
    local DyePartData = DataMgr.DyePart[CurPartTabIdx] or {}
    PartColorIds = DyePartData.ColorID
  else
    local HighLightPartColorContent = CurTabComparedColorContent or CurTabSelectedColorContent
    self:ChangePartColor(CurPartTabIdx, HighLightPartColorContent.ActualColor, HighLightPartColorContent.Fresnel)
    self:StartWeaponPartHighLight(HighLightPartColorContent.ActualColor, CurPartTabIdx)
  end
  self.EMList_Normal:ClearListItems()
  local AddedContents = {}
  if PartColorIds then
    for index, value in ipairs(PartColorIds) do
      local Obj = self.ColorContentsMap[value]
      if Obj and not AddedContents[Obj.ListContent] then
        Obj.ListContent.bPreviewMode = self.IsPreviewMode
        self.EMList_Normal:AddItem(Obj.ListContent)
        AddedContents[Obj.ListContent] = true
        Obj.ListContent.OnlyShowColor = {}
      end
      table.insert(Obj.ListContent.OnlyShowColor, Obj)
    end
  else
    for _, Obj in ipairs(self.ColorContents) do
      if Obj and not AddedContents[Obj.ListContent] then
        Obj.ListContent.bPreviewMode = self.IsPreviewMode
        self.EMList_Normal:AddItem(Obj.ListContent)
        AddedContents[Obj.ListContent] = true
        Obj.ListContent.OnlyShowColor = nil
      end
    end
  end
  if self.IsPreviewMode then
    self.TabConfig = {
      TitleName = GText("UI_Dye_Name"),
      DynamicNode = {"Back", "BottomKey"},
      BottomKeyInfo = {},
      OverridenTopResouces = {
        DataMgr.GlobalConstant.AdvanceColorId.ConstantValue
      },
      StyleName = "Text",
      BackCallback = self.OnBackKeyDown,
      OwnerPanel = self,
      GetReplyOnBack = self.OnResourceGetReply
    }
    self.Tab_Dye:Init(self.TabConfig)
  end
  self.EMList_Normal:RegenerateAllEntries()
end

function M:StartWeaponPartHighLight(LastColor, PartIdx)
  self.ActorController:StartWeaponPartHighLight(LastColor, PartIdx, self.HighLightColor, self.Curve_WPHighLight)
end

function M:StopWeaponPartHighLight(PartIdx)
  self.ActorController:StopWeaponPartHighLight(PartIdx)
end

function M:ChangePartColor(PartIdx, Color, Fresnel)
  if self.Type == CommonConst.ArmoryType.Char then
    self:ChangeCharPartColor(PartIdx, Color, Fresnel)
  else
    self:StopWeaponPartHighLight(PartIdx)
    self:ChangeWeaponPartColor(PartIdx, Color)
  end
end

function M:ChangeWeaponPartColor(PartIdx, Color)
  self.ActorController:ChangeWeaponPartColor(PartIdx, Color)
end

function M:ChangeToNormalCurrentColors()
  for Idx, Content in pairs(self.NormalCurrentContents) do
    self:ChangePartColor(Idx, Content.ActualColor, Content.Fresnel)
  end
end

function M:ChangeCharPartColor(PartIdx, Color, Fresnel)
  self.ActorController:ChangeCharPartColor(PartIdx, Color, Fresnel)
end

function M:CreateSpecialColorContents()
  self.EMList_Special:ClearListItems()
  local SpecialSwatchData = DataMgr.SpecialSwatch
  self.SpecialColorContents = {}
  self.SpecialColorContentsMap = {}
  for key, value in pairs(SpecialSwatchData) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.ColorId = key
    Obj.MaterialName = value.LinkedMaterial
    Obj.ResourceId = value.ResourceID
    Obj.Event_OnClicked = self.OnColorListItemClicked
    Obj.Event_OnHovered = self.OnColorListItemHovered
    Obj.Event_OnUnhovered = self.OnColorListItemUnhovered
    Obj.Owner = self
    table.insert(self.SpecialColorContents, Obj)
    self:OnSpecialColorContentCreated(Obj)
    self.SpecialColorContentsMap[Obj.ColorId] = Obj
  end
  table.sort(self.SpecialColorContents, function(a, b)
    return a.ColorId < b.ColorId
  end)
  for _, value in ipairs(self.SpecialColorContents) do
    self.EMList_Special:AddItem(value)
  end
  self.SpecialDefaultContent = {
    ColorId = self.DefaultColorId,
    MaterialSoftRef = self.SpecialDefaultColorMat,
    Event_OnClicked = self.OnColorListItemClicked,
    Event_OnHovered = self.OnColorListItemHovered,
    Event_OnUnhovered = self.OnColorListItemUnhovered,
    Owner = self
  }
  self:OnSpecialColorContentCreated(self.SpecialDefaultContent)
  self.SpecialComparedContent = nil
  self.SpecialCurrentContent = self.SpecialColorContentsMap[self.CurrentSkin:GetWeaponSpecialColor(self.CurrentPlan)] or self.SpecialDefaultContent
end

function M:InitSpecialDyeing()
  self:ResetSpecialCurrentContent()
  self.ColorLump_Default_Sp:OnListItemObjectSet(self.SpecialDefaultContent)
  self.EMList_Special:RegenerateAllEntries()
  self:UpdateItemConsume()
end

function M:ClearSpecialColorStates()
  self.SpecialComparedContent = nil
  if self.Type == CommonConst.ArmoryType.Char then
    return
  end
  self.SpecialDefaultContent.IsSelected = self.SpecialCurrentContent == self.SpecialDefaultContent
  self.SpecialDefaultContent.IsClicked = false
  for _, Content in ipairs(self.SpecialColorContents) do
    Content.IsSelected = Content == self.SpecialCurrentContent
    Content.IsClicked = false
  end
end

function M:ResetSpecialCurrentContent()
  self.SpecialCurrentContent = self.SpecialColorContentsMap[self.CurrentSkin:GetWeaponSpecialColor(self.CurrentPlan)] or self.SpecialDefaultContent
end

function M:CreateSpecialDefaultColorMat()
  self.SpecialDefaultColorMat = self:GetWeaponSpecialDefaultMatFromDataTable(self.UsingWeapon)
end

function M:OnSpecialColorListItemClicked(Content)
  if self.SpecialComparedContent == Content then
    return
  end
  if self.SpecialComparedContent then
    self.SpecialComparedContent.IsClicked = false
    if self.SpecialComparedContent.Widget then
      self.SpecialComparedContent.Widget:SetIsClicked(false)
    end
  end
  self.SpecialComparedContent = Content
  self:ChangeSpecialColor(Content)
  self:UpdateItemConsume()
end

function M:ChangeSpecialColor(Content)
  if self.SpecialDefaultContent == Content and self.UsingWeapon then
    local Material = UKismetSystemLibrary.LoadAsset_Blocking(self.SpecialDefaultContent.MaterialSoftRef)
    self.UsingWeapon.WeaponFashion:OverrideMaterial(Material)
    if self.UsingWeapon.ChildWeapon then
      self.UsingWeapon.ChildWeapon.WeaponFashion:OverrideMaterial(Material)
    end
    local LastDefaultContent = self.NormalDefaultColorContents[self.ColorPartCount]
    self:ChangePartColor(self.ColorPartCount, LastDefaultContent.ActualColor, LastDefaultContent.Fresnel)
    self.UsingWeapon:InitWeaponBreakMI()
  elseif self.UsingWeapon then
    self.UsingWeapon:InitWeaponBreakMI()
    self.UsingWeapon:ChangeWPMaterial(Content.MaterialName)
    if self.UsingWeapon.ChildWeapon then
      self.UsingWeapon.ChildWeapon:ChangeWPMaterial(Content.MaterialName)
    end
  end
end

function M:OnSpecialColorListItemHovered(Content)
  self.SpecialColorHoveredContent = Content
  if self.bContrastKeyDown then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/color_change", nil, nil)
  self:ChangeSpecialColor(Content)
end

function M:OnSpecialColorListItemUnhovered()
  self.SpecialColorHoveredContent = nil
  if self.bContrastKeyDown then
    return
  end
  local Content = self.SpecialComparedContent or self.SpecialCurrentContent
  self:ChangeSpecialColor(Content)
  if Content == self.SpecialCurrentContent and Content == self.SpecialDefaultContent then
    self:ChangeToNormalCurrentColors()
  end
end

function M:UpdateItemConsume()
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    self:UpdateItemConsumeManual(self.NormalCurrentContents, self.NormalComparedContents)
  else
    self:UpdateItemConsumeManual({
      self.SpecialCurrentContent
    }, {
      self.SpecialComparedContent
    })
  end
end

function M:UpdateItemConsumeManual(CurrentContents, ComparedContents)
  self:PlayAnimation(self.In_2)
  local HasAnyComparedContent = false
  local CanApplyColors = true
  local UseItems_Map = {}
  local UseItems_Array = {}
  local Avatar = GWorld:GetAvatar()
  for Idx, Content in pairs(ComparedContents) do
    if Content and Content ~= CurrentContents[Idx] then
      HasAnyComparedContent = true
      local ResourceId = Content.ResourceId
      local Data = DataMgr.Resource[ResourceId]
      if Data then
        if not UseItems_Map[ResourceId] then
          local ResourceServerData = Avatar.Resources[ResourceId] or {Count = 0}
          local Obj = {}
          Obj.Count = ResourceServerData.Count
          Obj.NeedCount = 1
          Obj.NotEnoughCount = 0
          if Obj.NeedCount > Obj.Count then
            CanApplyColors = false
            Obj.NotEnoughCount = 1
          end
          Obj.Id = ResourceId
          Obj.Rarity = Data.Rarity
          Obj.Icon = Data.Icon
          Obj.ItemType = CommonConst.ItemType.Resource
          Obj.IsShowDetails = true
          UseItems_Map[ResourceId] = Obj
          table.insert(UseItems_Array, Obj)
        else
          local Obj = UseItems_Map[ResourceId]
          Obj.NeedCount = Obj.NeedCount + 1
          if Obj.NeedCount > Obj.Count then
            CanApplyColors = false
            Obj.NotEnoughCount = Obj.NotEnoughCount + 1
          end
        end
      end
    end
  end
  rawset(self, "bNeedCommonDye", false)
  rawset(self, "NotEnoughResource", {})
  rawset(self, "CommonDyeResource", {})
  if not CanApplyColors then
    local TotalNotEnoughResourceCount = 0
    local NotEnoughResourceMap = {}
    for ResourceId, value in pairs(UseItems_Map) do
      if value.NotEnoughCount > 0 then
        local Obj = {
          ItemId = ResourceId,
          Count = value.NotEnoughCount,
          ItemType = CommonConst.ItemType.Resource
        }
        table.insert(self.NotEnoughResource, Obj)
        NotEnoughResourceMap[ResourceId] = Obj
        TotalNotEnoughResourceCount = TotalNotEnoughResourceCount + value.NotEnoughCount
      end
    end
    if not rawget(self, "ResourceId2CommonDyeIds") then
      self:CreateResourceId2CommonDyeIds()
    end
    local NewUseItems_Array = {}
    local NewUseItems_Map = {}
    for index, NotEnoughResource in ipairs(self.NotEnoughResource) do
      if self.ResourceId2CommonDyeIds[NotEnoughResource.ItemId] then
        for CommonDyeId, _ in pairs(self.ResourceId2CommonDyeIds[NotEnoughResource.ItemId]) do
          local CommonDyeResource = Avatar.Resources[CommonDyeId] or {Count = 0}
          local CommonDyeObj = NewUseItems_Map[CommonDyeId]
          if not CommonDyeObj then
            local Data = DataMgr.Resource[CommonDyeId]
            CommonDyeObj = {
              Count = CommonDyeResource.Count,
              NeedCount = 0,
              Icon = Data.Icon,
              Id = CommonDyeId,
              Rarity = Data.Rarity,
              ItemType = CommonConst.ItemType.Resource,
              IsShowDetails = true
            }
            table.insert(NewUseItems_Array, CommonDyeObj)
            NewUseItems_Map[CommonDyeId] = CommonDyeObj
          end
          if CommonDyeResource.Count >= CommonDyeObj.NeedCount + NotEnoughResource.Count then
            CommonDyeObj.NeedCount = CommonDyeObj.NeedCount + NotEnoughResource.Count
            TotalNotEnoughResourceCount = TotalNotEnoughResourceCount - NotEnoughResource.Count
          else
            local AddCount = CommonDyeResource.Count - CommonDyeObj.NeedCount
            CommonDyeObj.NeedCount = CommonDyeObj.NeedCount + AddCount
            TotalNotEnoughResourceCount = TotalNotEnoughResourceCount - AddCount
          end
        end
      end
    end
    if 0 == TotalNotEnoughResourceCount then
      for index, value in ipairs(NewUseItems_Array) do
        table.insert(self.CommonDyeResource, {
          ItemId = value.Id,
          Count = value.NeedCount,
          ItemType = CommonConst.ItemType.Resource
        })
      end
      for key, value in pairs(UseItems_Map) do
        if value.Count >= value.NeedCount then
          NewUseItems_Map[key] = value
          table.insert(NewUseItems_Array, value)
        elseif value.Count > 0 then
          NewUseItems_Map[key] = value
          value.NeedCount = value.Count
          table.insert(NewUseItems_Array, value)
        end
      end
      UseItems_Array = NewUseItems_Array
      UseItems_Map = NewUseItems_Map
      CanApplyColors = true
      self.bNeedCommonDye = true
    end
  end
  for index, value in ipairs(UseItems_Array) do
    self:OnConsumItemContentCreated(value)
  end
  self.ItemConsume = UseItems_Map
  self:UpdateConsumItemWidgets(UseItems_Array, UseItems_Map)
  if HasAnyComparedContent then
    self.Btn_Compare:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Compare:SetForbidden(false)
  else
    self.Btn_Compare:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Compare:SetForbidden(true)
  end
  if HasAnyComparedContent and not self:IsSameDyeDraft() then
    self.Btn_Save:ForbidBtn(false)
  else
    self.Btn_Save:ForbidBtn(true)
  end
  if CanApplyColors and HasAnyComparedContent then
    self.Btn_Done:SetText(GText("UI_Dye_Apply"))
    self.Btn_Done:ForbidBtn(false)
  else
    self.Btn_Done:ForbidBtn(true)
    if not CanApplyColors then
      self.Btn_Done:SetText(GText("UI_Dye_Apply"))
    else
      self.Btn_Done:SetText(GText("UI_Dye_Done"))
    end
  end
  if self.IsPreviewMode then
    self:UpdatePreviewOrNotUI()
  end
end

function M:CreateResourceId2CommonDyeIds()
  rawset(self, "ResourceId2CommonDyeIds", {})
  for CommonDyeId, v in pairs(DataMgr.CommonDye) do
    for index, ResourceId in ipairs(v.DyeID or {}) do
      self.ResourceId2CommonDyeIds[ResourceId] = self.ResourceId2CommonDyeIds[ResourceId] or {}
      self.ResourceId2CommonDyeIds[ResourceId][CommonDyeId] = true
    end
  end
end

function M:IsSameDyeDraft()
  local DyePlanDraft = DyeDraftModel:GetDyeDraftPlan(self.CurrentSkin.SkinId, self.CurrentPlan) or {}
  for PartIdx, value in pairs(self.NormalComparedContents or {}) do
    if value.ColorId ~= DyePlanDraft[PartIdx] then
      return false
    end
  end
  return true
end

function M:UpdateConsumItemWidgets(Contents)
  if 0 == #Contents then
    if self.Panel_Cost:GetVisibility() == UIConst.VisibilityOp.Visible then
      self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self:StopAnimation(self.In_2)
      self:PlayAnimation(self.Out_2)
    else
      self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
    self:StopAnimation(self.Out_2)
    self:PlayAnimation(self.In_2)
    local AllChildren = self.WB_Consume:GetAllChildren():ToTable()
    local ChildrenNum = #AllChildren
    local ContentNum = #Contents
    local ItemPerRow = 3
    local WidgetClass = UGameplayStatics.GetObjectClass(AllChildren[2])
    local UIManager = UIManager(self)
    if ContentNum < ChildrenNum - 1 then
      local ShouldKeepCount = ContentNum + 1
      if 0 ~= ShouldKeepCount % ItemPerRow then
        ShouldKeepCount = ShouldKeepCount + ItemPerRow - ShouldKeepCount % ItemPerRow
      end
      if 3 == ShouldKeepCount and 1 == ContentNum then
        ShouldKeepCount = 2
      end
      if ChildrenNum > ShouldKeepCount then
        for i = ChildrenNum, ShouldKeepCount + 1, -1 do
          AllChildren[i]:RemoveFromParent()
        end
      elseif ChildrenNum < ShouldKeepCount then
        for i = ChildrenNum, ShouldKeepCount do
          self.WB_Consume:AddChild(UIManager:CreateWidget(WidgetClass, false))
        end
      end
    elseif ContentNum > ChildrenNum - 1 then
      for i = ChildrenNum, ContentNum do
        self.WB_Consume:AddChild(UIManager:CreateWidget(WidgetClass, false))
      end
      if 0 ~= (ContentNum + 1) % ItemPerRow then
        for i = 1, ItemPerRow - (ContentNum + 1) % ItemPerRow do
          self.WB_Consume:AddChild(UIManager:CreateWidget(WidgetClass, false))
        end
      end
    end
    AllChildren = self.WB_Consume:GetAllChildren():ToTable()
    for i = 2, #AllChildren do
      if Contents[i - 1] then
        AllChildren[i]:OnListItemObjectSet(Contents[i - 1])
        AllChildren[i]:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        AllChildren[i]:OnListItemObjectSet({})
        AllChildren[i]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      end
    end
  end
end

function M:OnConsumItemContentCreated(Content)
end

function M:OnContrastKeyDown()
  if self.bContrastKeyDown then
    return
  end
  self.bContrastKeyDown = true
  self:RecoverActorColor()
end

function M:OnContrastKeyUp()
  self.bContrastKeyDown = false
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    if self.SpecialDefaultContent and (next(self.NormalComparedContents) or self.NormalColorHoveredContent) then
      self:ChangeSpecialColor(self.SpecialDefaultContent)
    end
    for Idx, Content in pairs(self.NormalCurrentContents) do
      if self.NormalComparedContents[Idx] then
        self:ChangePartColor(Idx, self.NormalComparedContents[Idx].ActualColor, self.NormalComparedContents[Idx].Fresnel)
      else
        self:ChangePartColor(Idx, Content.ActualColor, Content.Fresnel)
      end
    end
    if self.NormalColorHoveredContent then
      self:ChangePartColor(self.CurNormalDyeTab.Idx, self.NormalColorHoveredContent.ActualColor, self.NormalColorHoveredContent.Fresnel)
    else
      local Content = self.SpecialCurrentContent
      if self.SpecialCurrentContent ~= self.SpecialDefaultContent and next(self.NormalComparedContents) == nil then
        self:ChangeSpecialColor(Content)
      end
    end
  else
    local Content = self.SpecialColorHoveredContent or self.SpecialComparedContent or self.SpecialCurrentContent
    if Content then
      self:ChangeSpecialColor(Content)
    end
  end
end

function M:OnHideUIKeyDown()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    self:SetRenderOpacity(0)
    self.Image_Click.Slot:SetZOrder(10)
  else
    self:SetRenderOpacity(1)
    self.Image_Click.Slot:SetZOrder(-1)
  end
end

function M:UpdateCurrentDyeTabSaveOrSelect()
  if self.CurrentDyeTabDraftContent then
    self.CurrentDyeTabDraftContent.IsSaveInDraft = false
    self.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(false)
    self.CurrentDyeTabDraftContent.Widget:SetIsSelected(self.CurrentDyeTabDraftContent.IsSelected)
  end
  self.CurrentDyeTabDraftContent = self.NormalComparedContents[self.CurNormalDyeTab.Idx]
  if self.CurrentDyeTabDraftContent then
    self.CurrentDyeTabDraftContent.IsSaveInDraft = true
    self.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(true)
    self.CurrentDyeTabDraftContent.Widget:SetIsSelected(self.CurrentDyeTabDraftContent.IsSelected)
  end
end

function M:OnDoneBtnClicked()
  local Avatar = GWorld:GetAvatar()
  
  local function Confirm()
    if self.CurrentTabIdx == self.NormalColorTabIdx then
      local t = {}
      for Idx, Content in pairs(self.NormalComparedContents) do
        if Content ~= self.NormalCurrentContents[Idx] then
          t[Idx] = Content.ColorId
        end
      end
      self:BlockAllUIInput(true)
      if self.Type == CommonConst.ArmoryType.Char then
        Avatar:ChangeCharSkinColors(self.CurrentSkin.SkinId, t, self.CurrentPlan)
      else
        Avatar:ChangeWeaponSkinColors(self.Target.Uuid, self.CurrentSkin.SkinId, self.CurrentPlan, t)
      end
    else
      local NewColor = self.SpecialComparedContent.ColorId
      if NewColor then
        self:BlockAllUIInput(true)
        Avatar:ChangeWeaponSkinSpecialColor(self.Target.Uuid, self.CurrentSkin.SkinId, self.CurrentPlan, NewColor)
      end
    end
  end
  
  local ItemList = {}
  local UseItems = self.ItemConsume
  for _, Item in pairs(UseItems) do
    if Item.Id then
      table.insert(ItemList, {
        ItemId = Item.Id,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Item.Count or 0,
        ItemNeed = Item.NeedCount
      })
    end
  end
  local Params = {RightCallbackFunction = Confirm, ItemList = ItemList}
  if #ItemList > 0 then
    if self.bNeedCommonDye then
      Params.LeftItems = self.CommonDyeResource
      Params.RightItems = self.NotEnoughResource
      Params.ShortTextParams = {
        ItemList[1].ItemNeed
      }
      UIManager(self):ShowCommonPopupUI(100228, Params, self)
    else
      UIManager(self):ShowCommonPopupUI(100100, Params, self)
    end
  else
    UIManager(self):ShowCommonPopupUI(100135, Params, self)
  end
end

function M:OnPreviewSaveBtnClicked()
  if not self.IsPreviewMode then
    return
  end
  if self.OpenPreviewDyeFromShopItem then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_SkinPreview_DyeDraft"))
    self:SaveCurrentDraft()
    self:UpdatePreviewOrNotUI()
    self.Btn_PreviewSave:ForbidBtn(true)
  elseif self.OpenPreviewDyeFromChat then
    self:ImportDraft()
  end
end

function M:OnForbiddenDoneBtnClicked()
  local bHasComparedContent = false
  for Idx, Content in pairs(self.NormalComparedContents) do
    if Content ~= self.NormalCurrentContents[Idx] then
      bHasComparedContent = true
    end
  end
  if bHasComparedContent then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Insufficient"), 1.5)
  end
end

function M:OnColorsChanged(Ret)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/color_change_confirm", nil, nil)
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Success"), 1.5)
  self:ResetTargetData()
  self:ResetSkinData()
  if self.RecoverColorWhenSeverCallback then
    self.RecoverColorWhenSeverCallback = false
    self:ResetNormalCurrentContens()
    self:SelectDyeingTypeTab(self.CurrentTabIdx)
    return
  end
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    local CurrentTabIdx = self.CurNormalDyeTab.Idx
    local CurrentContent = self.NormalCurrentContents[CurrentTabIdx]
    local ComparedContent = self.NormalComparedContents[CurrentTabIdx]
    if ComparedContent and ComparedContent ~= CurrentContent then
      CurrentContent.IsSelected = false
      if CurrentContent.Widget then
        CurrentContent.Widget:SetIsSelected(false)
      end
      ComparedContent.IsSelected = true
      if ComparedContent.Widget then
        ComparedContent.Widget:SetIsSelected(true)
      end
    end
    self:ResetNormalCurrentContens()
    self:ResetSpecialCurrentContent()
    self:UpdateItemConsume()
  else
    self.SpecialCurrentContent.IsSelected = false
    if self.SpecialCurrentContent.Widget then
      self.SpecialCurrentContent.Widget:SetIsSelected(false)
    end
    self.SpecialComparedContent.IsSelected = true
    if self.SpecialComparedContent.Widget then
      self.SpecialComparedContent.Widget:SetIsSelected(true)
    end
    self:ResetNormalCurrentContens()
    self:ResetSpecialCurrentContent()
    self:UpdateItemConsume()
  end
  self:UpdateCurrentDyeTabSaveOrSelect()
  self:DeleteCurrentDraft()
  self.Btn_Compare:SetForbidden(true)
  self.Btn_Save:ForbidBtn(true)
end

function M:OnCharSkinColorPlanChanged(Ret, SkinId, NewPlanIndex)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTargetData()
  self:ResetSkinData()
  self.CurrentPlan = self.CurrentSkin.CurrentPlanIndex
  self:ResetPlanName()
  self:ResetNormalCurrentContens()
  self:UpdateComparedContentsByDraft()
  local CurrentTabIdx = self.CurrentTabIdx
  self.CurrentTabIdx = nil
  self:SelectDyePlan(NewPlanIndex, CurrentTabIdx)
  self:UpdateDraftBtn()
  if self.Parent and self.OpenPreviewDyeFromChat then
    self:ApplyColorsToComparedColors(self.OpenPreviewDyeFromChatColors)
    self:ApplyColorsToNormalDyeTabs(self.OpenPreviewDyeFromChatColors)
  end
  self:OnContrastKeyUp()
end

function M:OnWeaponSkinColorPlanChanged(Ret, WeaponUuid, SkinId, NewPlanIndex)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTargetData()
  self:ResetSkinData()
  self.CurrentPlan = self.CurrentSkin.CurrentPlanIndex
  self:ResetPlanName()
  self:ResetNormalCurrentContens()
  self:ResetSpecialCurrentContent()
  self:UpdateComparedContentsByDraft()
  local CurrentTabIdx = self.CurrentTabIdx
  self.CurrentTabIdx = nil
  self:SelectDyePlan(NewPlanIndex, CurrentTabIdx)
  self:UpdateDraftBtn()
  if self.Parent and self.OpenPreviewDyeFromChat then
    self:ApplyColorsToComparedColors(self.OpenPreviewDyeFromChatColors)
    self:ApplyColorsToNormalDyeTabs(self.OpenPreviewDyeFromChatColors)
  end
  self:OnContrastKeyUp()
  if self.SpecialCurrentContent == self.SpecialDefaultContent then
    self:ChangeToNormalCurrentColors()
  end
end

function M:OnResourcesChanged(ResourceId)
  if self.CurrentTabIdx == self.NormalColorTabIdx then
    if self.NormalComparedContents then
      if DataMgr.CommonDye[ResourceId] then
        self:UpdateItemConsume()
      else
        for key, value in pairs(self.NormalComparedContents) do
          if value.ResourceId == ResourceId then
            self:UpdateItemConsume()
            break
          end
        end
      end
    end
  elseif self.SpecialComparedContent and self.SpecialComparedContent.ResourceId == ResourceId then
    self:UpdateItemConsume()
  end
end

function M:PlayInAnim()
  self:BlockAllUIInput(true)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:RecoverActorColor()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  self:BlockAllUIInput(true)
  if self.LastCameraTags and self.ActorController and not self.bStandaloneWeapon then
    self.ActorController:SetArmoryCameraTag(table.unpack(self.LastCameraTags))
  end
end

function M:OnInAnimFinished()
  self:BlockAllUIInput(false)
end

function M:OnOutAnimFinished()
  self:Close()
  if self.Parent and self.OpenPreviewDyeFromChat then
    self.Parent:OnBackKeyDown()
  end
end

function M:Close()
  M.Super.Close(self)
  if self.OnCloseCallback then
    self.OnCloseCallback(self.ParentWidget)
  end
end

function M:RecoverActorColor()
  if not self.CurrentSkin then
    return
  end
  if self.Type == CommonConst.ArmoryType.Char then
    self:ChangeToNormalCurrentColors()
  elseif self.CurrentSkin:GetWeaponSpecialColor(self.CurrentPlan) == self.DefaultColorId then
    self:ChangeSpecialColor(self.SpecialCurrentContent)
    self:ChangeToNormalCurrentColors()
  else
    self:ChangeToNormalCurrentColors()
    self:ChangeSpecialColor(self.SpecialCurrentContent)
  end
end

function M:ResetTargetData()
  local Avatar = GWorld:GetAvatar()
  if self.Type == CommonConst.ArmoryType.Char then
    self.Target = Avatar.Chars[self.Target.Uuid]
  else
    self.Target = Avatar.Weapons[self.Target.Uuid]
  end
end

function M:ResetSkinData()
  local Avatar = GWorld:GetAvatar()
  if self.Type == CommonConst.ArmoryType.Char then
    local CommonChar = Avatar.CommonChars[self.Target.CharId]
    self.CurrentSkin = CommonChar.OwnedSkins[self.SkinId] or self:CreateDefaultSkin(self.SkinId)
  else
    self.CurrentSkin = self.Target:GetSkin(self.SkinId)
  end
end

function M:OnNormalColorContentCreated(Content)
end

function M:OnNormalColorListContentCreated(Content)
end

function M:OnSpecialColorContentCreated(Content)
end

function M:OnFunctionBtnAddedToFocusPath()
end

function M:OnFunctionBtnRemovedFromFocusPath()
end

AssembleComponents(M)
return M
