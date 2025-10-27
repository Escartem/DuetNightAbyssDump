require("UnLua")
local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local ActorController = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local PersonInfoModel = PersonInfoController:GetModel()
local M = Class({})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.PersonInfoEditListCompoment",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:Initialize()
  self.IsPersonInfoPage = true
  self.SelectCharIndex = -1
  self.SelectWeaponIndex = -1
  self.Events_BeforeClose = {}
end

function M:InitBaseView(Personid)
  self.isfirst = true
  local PersonalBaseInfo = PersonInfoModel:GetPersonalBaseInfo()
  local PlayerName = PersonalBaseInfo.PlayerName
  local PlayerSignature = PersonalBaseInfo.PlayerSignature
  local CurrentLevel = PersonalBaseInfo.CurrentLevel
  local HeadIconId = PersonalBaseInfo.HeadIconId
  local HeadFrameId = PersonalBaseInfo.HeadFrameId
  local Uid = PersonalBaseInfo.Uid
  local TitleBefore = PersonalBaseInfo.TitleBefore or -1
  local TitleAfter = PersonalBaseInfo.TitleAfter or -1
  local TitleFrame = PersonalBaseInfo.TitleFrame or -1
  self.Text_LevelName:SetText(GText("UI_Player_Level"))
  self.Text_UIDTitle:SetText(GText("UI_UID"))
  self.Text_BrithdayTitle:SetText(GText("UI_Chardata_Char_Brithday"))
  local Avatar = GWorld:GetAvatar()
  local Month, Day = Avatar:GetAvatarBirthday()
  self.Text_Birth:SetText(GDate("Date_MD", {Month = Month, Day = Day}))
  if PlayerName then
    self.Text_PlayerName:SetText(GText(PlayerName))
  end
  if Uid then
    self.Text_UID:SetText(tostring(Uid))
  end
  if CurrentLevel then
    self.Text_Level:SetText(CurrentLevel)
  end
  self.Text_Empty:SetText(GText("UI_Menu_Sign_None"))
  self.Com_ItemHead:SetHeadIconById(HeadIconId, false)
  self.Com_ItemHead:SetHeadFrame(HeadFrameId)
  if "" ~= PlayerSignature then
    self.Switcher_Input:SetActiveWidgetIndex(1)
    self.Text_Input:SetText(PlayerSignature)
  else
    self.Switcher_Input:SetActiveWidgetIndex(0)
  end
  self.Text_EmptyDesc:SetText(GText("UI_PersonInfo_NoChar"))
  self.TitleSetting:Init(PersonInfoModel:IsOwener())
  self.TitleSetting:Freshtitle(TitleBefore, TitleAfter, TitleFrame)
  self.Btn_UID.OnClicked:Add(self, function()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
    self:StopPress()
    self:OnCopyUID()
  end)
  self.Btn_EditShow:SetGamePadImg("X")
  self.Btn_Data:SetGamePadImg("Menu")
  if PersonInfoModel:IsOwener() then
    self.Com_ItemHead.Button_Area.OnClicked:Add(self, self.OnClickChangePortrait)
    if self.OnClickChangeSignature then
      self.Btn_EditSign.OnClicked:Add(self, self.OnClickChangeSignature)
    end
    self.Btn_EditShow:SetText(GText("UI_PersonInfo_ShowCase_Edit"))
    self.Btn_EditShow.Button_Area.OnClicked:Add(self, self.OnClickOpenEditPage)
    self.Com_ItemHead:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Com_ItemHead:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_EditSign:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Button_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_EditShow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_EmptyDesc:SetText(GText("UI_PersonInfo_NoChar"))
  self:InitDisplayBoxView()
  self.Group_AvatarInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_AvatarTitle:SetText(GText("UI_PersonInfo_ShowCase_Char"))
  self.Text_WeaponTitle:SetText(GText("UI_PersonInfo_ShowCase_Weapon"))
  self.Btn_Data.Button_Area.OnClicked:Add(self, self.OnClickOpenDataPage)
  if PersonInfoModel:IsOwener() then
  else
    local Visible = PersonInfoModel:GetDataPageVisibility()
    if Visible then
    else
      self.Btn_Data:ForbidBtn(true)
    end
  end
  self.Btn_Data:SetText(GText("UI_PersonalPage_Recount_Name"))
  self:AddReddotListener("EditBtn", self.OnPortraitReddotChange)
end

function M:InitDisplayBoxView(IsChanegeModel)
  if PersonInfoModel:IsOwener() == false then
    self.Btn_EditShow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local DisplayContent = PersonInfoModel:GetDisplayContent()
  local Birthday = DisplayContent.Birthday
  if Birthday then
    self.Text_Birth:SetText(GDate("Date_MD", {
      Month = Birthday[1],
      Day = Birthday[2]
    }))
  end
  local strings = {"Char", "Weapon"}
  local ItemNames = {
    "AvatarItem_",
    "WeaponItem_"
  }
  local Contents = {
    DisplayContent.CharContent,
    DisplayContent.WeaponContent
  }
  local indexes = {
    "SelectCharIndex",
    "SelectWeaponIndex"
  }
  local funcnames = {
    "OpenCharEditPage",
    "OpenWeaponEditPage"
  }
  local ChangeSelectfuncnames = {
    "OnClickChangeSelectChar",
    "OnClickChangeSelectWeapon"
  }
  if -1 ~= self.SelectCharIndex then
    self["AvatarItem_" .. self.SelectCharIndex]:Playanimation(self["AvatarItem_" .. self.SelectCharIndex].Hover)
    self:CancelSelectChar(self.SelectCharIndex)
  end
  if -1 ~= self.SelectWeaponIndex then
    self:CancelSelectWeapon(self.SelectWeaponIndex)
  end
  self.SelectCharIndex = -1
  self.SelectWeaponIndex = -1
  for j = 1, 2 do
    local string = strings[j]
    local ItemName = ItemNames[j]
    local Content = Contents[j]
    local index = indexes[j]
    local functionname = funcnames[j]
    local ChangeSelectfuncname = ChangeSelectfuncnames[j]
    if -1 ~= self[index] then
      self["CancelSelect" .. string](self, self[index])
    end
    for i = 1, 3 do
      self[ItemName .. i].Com_Item:SetVisibility(UIConst.VisibilityOp.Visible)
      Content[i].OnAddedToFocusPathEvent = {
        Obj = self[ItemName .. i].Com_Item,
        Callback = self.OnItemFocusForGamePad,
        Params = self[ItemName .. i].Com_Item
      }
      if -1 == Content[i].Id then
        Content[i].Id = 0
      end
      Content[i].HandleMouseDown = true
      self[ItemName .. i].Com_Item:OnListItemObjectSet(Content[i])
      if 0 ~= Content[i].Id then
        if -1 == self[index] then
          self[index] = i
        end
        if PersonInfoModel:IsOwener() then
        end
        self[ItemName .. i]:PlayAnimation(self[ItemName .. i].Normal)
        self[ItemName .. i].Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
        self[ItemName .. i].Com_Item:SetAdd(false)
      else
        self[ItemName .. i].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        self[ItemName .. i]:PlayAnimation(self[ItemName .. i].Forbidden)
        self[ItemName .. i]:StopAllAnimations()
      end
    end
    if -1 ~= self.SelectCharIndex and -1 ~= self[index] then
      self[ItemName .. self[index]].Button_Area:SetChecked(true)
      self[ItemName .. self[index]]:PlayAnimation(self[ItemName .. self[index]].Click)
      self[ItemName .. self[index]].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    for i = 1, 3 do
      local Item = self[ItemName .. i]
      Item.Button_Area.OnClicked:Clear()
      Item.Button_Area.OnClicked:Add(self, function()
        self[ChangeSelectfuncname](self, i)
      end)
      if true == self.IsPC then
        Item.Button_Area.OnHovered:Add(self, function()
          PersonInfoController.MainPage:OnCheckBoxFocus()
        end)
      end
      local OnMouseButtonDownEvent
      if 0 ~= Content[i].Id and -1 ~= Content[i].Id then
        local bIsWeapon = 2 == j
        OnMouseButtonDownEvent = self:GetDetialPageClickFunc(Item, i, string, bIsWeapon)
      else
        OnMouseButtonDownEvent = self:GetEditPageClickFunc(ItemName, i, string)
      end
      Item.Com_Item.OnMouseButtonDownEvent = OnMouseButtonDownEvent
    end
  end
  if true == IsChanegeModel then
    self:ModelViewIni()
  end
end

function M:GetEditPageClickFunc(ItemName, i, string)
  if PersonInfoModel:IsOwener() then
    self[ItemName .. i].Com_Item:SetAdd(true)
    local OnMouseButtonDownEvent = {
      Obj = self,
      Callback = function()
        AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
        PersonInfoController:OpenEditView(string, i)
      end,
      Params = nil
    }
    return OnMouseButtonDownEvent
  end
end

function M:GetDetialPageClickFunc(Item, i, string, bIsWeapon)
  if nil == bIsWeapon then
    bIsWeapon = false
  end
  local OnMouseButtonDownEvent = {
    Obj = self,
    Callback = function()
      local CharInfos = {}
      local WeaponInfos = {}
      local SelectedTargetIndex = i
      if false == bIsWeapon then
        CharInfos = PersonInfoModel:GetDisplayCharInfos()
      else
        WeaponInfos = PersonInfoModel:GetDisplayWeaponInfos()
      end
      if nil == CharInfos and nil == WeaponInfos then
        return
      end
      if not bIsWeapon then
        AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_role", nil, nil)
      else
        AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_weapon", nil, nil)
      end
      local AppearanceIndex, ModSuitIndex = PersonInfoModel:GetAppearanceAndModPlan(bIsWeapon, i)
      UIManager(self):LoadUINew("ArmoryDetail", {
        PreviewCharInfos = CharInfos,
        PreviewWeaponInfos = WeaponInfos,
        EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
        bHideCharFiles = true,
        bHideBoxBtn = true,
        bHideUltraTab = true,
        Title = GText("UI_PersonInfo_Detail_" .. string),
        SelectedTargetIndex = SelectedTargetIndex,
        DoNotSort = true,
        bNoEndCamera = true,
        bFormPersonalPage = true,
        AppearanceIndex = AppearanceIndex,
        OnCloseDelegate = {
          self,
          self.SetOriginFocus
        },
        SmoothLoad = true
      })
    end
  }
  return OnMouseButtonDownEvent
end

function M:ModelViewIni()
  if -1 == self.SelectCharIndex then
    local Avatar = GWorld:GetAvatar()
    self:OnPersonalInfoOpened(Avatar.Chars[Avatar.CurrentChar])
  end
  if -1 ~= self.SelectCharIndex then
    local CharBaseInfo = PersonInfoModel:GetShowCharBaseInfo(self.SelectCharIndex)
    self:ChanegeCharInfo(CharBaseInfo, nil, false)
    self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.Collapsed)
    PersonInfoController.MainPage.bHideCharTab = false
    PersonInfoController.MainPage:InitTabInfo()
    self.Group_AvatarInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if PersonInfoModel:IsOwener() then
      local CharData = PersonInfoModel:GetShowCharData(self.SelectCharIndex)
      if self.ActorController == nil then
        self:OnPersonalInfoOpened(CharData)
      else
        self.ActorController:ChangeCharModel(CharData)
      end
      local uuid, AppearanceSuit = PersonInfoModel:GetCharSuitIndex(self.SelectCharIndex)
      if self.ActorController and self.ActorController.ArmoryPlayer then
        self.ActorController.ArmoryPlayer.CharacterFashion:InitAppearanceSuit(PersonInfoModel._Avatar.Chars[uuid]:DumpAppearanceSuit(PersonInfoModel._Avatar, AppearanceSuit))
      end
      self:AddTimer(0.01, function()
        if -1 ~= self.SelectWeaponIndex then
          self:ChangeWeaponView()
        else
          self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
        end
      end, nil, nil, nil, true)
    else
      local FakeAvatar = PersonInfoModel:GetFakeAvatar()
      self:OnPersonalInfoOpened(FakeAvatar.Chars[self.SelectCharIndex])
      if -1 ~= self.SelectWeaponIndex then
        self:ChangeWeaponView()
      else
        self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
      end
    end
    self.ActorController:HidePlayerActor("PersonInfo", false)
  else
    self:ForbidenWeaponBox()
    PersonInfoController.MainPage.bHideCharTab = true
    PersonInfoController.MainPage:InitTabInfo()
    self.Group_AvatarInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if true == PersonInfoController.bReturnMain then
    else
      self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
      PersonInfoController.bReturnMain = false
    end
    self.ActorController:HidePlayerActor("PersonInfo", true)
  end
end

function M:FreshCamera()
  if not self.ActorController then
    return
  end
  self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
  if self.SelectWeaponIndex > 0 then
    local WeaponData = PersonInfoModel:GetShowWeaponData(self.SelectWeaponIndex)
    if WeaponData then
      if WeaponData:HasTag("Melee") then
        self.ActorController:SetMontageAndCamera("Weapon", "Melee", "Melee", nil)
      else
        self.ActorController:SetMontageAndCamera("Weapon", "Ranged", "Ranged", nil)
      end
    end
  else
    self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
  end
end

function M:ForbidenWeaponBox()
  for i = 1, 3 do
    self["WeaponItem_" .. i].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self["WeaponItem_" .. i]:StopAllAnimations()
    self["WeaponItem_" .. i]:PlayAnimation(self["WeaponItem_" .. i].Forbidden)
  end
end

function M:OnPersonalInfoOpened(CharData)
  if self.ActorController == nil then
    self.ActorController = ActorController:New({
      ViewUI = PersonInfoController.MainPage,
      IsPreviewMode = true,
      Char = CharData,
      SmoothLoad = true,
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
      bNeedEndCamera = true,
      bPlayRoleChangedSound = nil ~= CharData
    })
    self.ActorController:OnOpened()
  end
end

function M:OnPersonalInfoClosed()
end

function M:Destruct()
  self:RemoveReddotListener("EscPortrait", self.OnPortraitFrameReddotChange)
  self.ActorController:OnClosed()
  self.ActorController:OnDestruct()
  self.ActorController = nil
end

function M:ChangeWeaponView()
  if self.ActorController == nil then
    return
  end
  self["WeaponItem_" .. self.SelectWeaponIndex].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local WeaponData = PersonInfoModel:GetShowWeaponData(self.SelectWeaponIndex)
  if WeaponData then
    if WeaponData:HasTag("Melee") then
      self.ActorController:ChangeWeaponModel(WeaponData)
      self.ActorController:SetMontageAndCamera("Weapon", "Melee", "Melee", nil)
    else
      self.ActorController:ChangeWeaponModel(WeaponData)
      self.ActorController:SetMontageAndCamera("Weapon", "Ranged", "Ranged", nil)
    end
  end
end

function M:OnClickChangeSelectChar(index)
  ScreenPrint("OnClickChangeSelectChar")
  self["AvatarItem_" .. self.SelectCharIndex].Button_Area:SetForbidden(false)
  self:CancelSelectChar(self.SelectCharIndex)
  self.SelectCharIndex = index
  self["AvatarItem_" .. self.SelectCharIndex].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local CharData
  CharData = PersonInfoModel:GetShowCharData(self.SelectCharIndex)
  self.ActorController:ChangeCharModel(CharData)
  if self.SelectWeaponIndex > 0 then
    self:ChangeWeaponView()
  else
    self.ActorController:SetMontageAndCamera("Char", "Char", "Char", nil)
  end
  if PersonInfoModel:IsOwener() then
    local uuid, AppearanceSuit = PersonInfoModel:GetCharSuitIndex(self.SelectCharIndex)
    self.ActorController.ArmoryPlayer.CharacterFashion:InitAppearanceSuit(PersonInfoModel._Avatar.Chars[uuid]:DumpAppearanceSuit(PersonInfoModel._Avatar, AppearanceSuit))
  end
  local CharBaseInfo = PersonInfoModel:GetShowCharBaseInfo(self.SelectCharIndex)
  self:ChanegeCharInfo(CharBaseInfo)
end

function M:OnClickChangeSelectWeapon(index)
  self:CancelSelectWeapon(self.SelectWeaponIndex)
  self.SelectWeaponIndex = index
  self:ChangeWeaponView()
end

function M:ChanegeCharInfo(CharData)
  self.Image_CharType:SetBrushResourceObject(CharData.AttributeIcon)
  self.Text_CharName:SetText(GText(CharData.Name))
  if 5 == CharData.Rarity then
    self.Gacha_Star_5:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Gacha_Star_5:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:CancelSelectChar(index)
  self["AvatarItem_" .. self.SelectCharIndex].Button_Area:SetChecked(false)
  self["AvatarItem_" .. self.SelectCharIndex].Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:CancelSelectWeapon(index)
  self["WeaponItem_" .. self.SelectWeaponIndex].Button_Area:SetChecked(false)
  self["WeaponItem_" .. self.SelectWeaponIndex].Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:FreshHeadAndFrames(IsFrame, HeadOrFrameId)
  if true == IsFrame then
    self.Com_ItemHead:SetHeadFrame(HeadOrFrameId)
  else
    self.Com_ItemHead:SetHeadIconById(HeadOrFrameId, false)
  end
end

function M:OnClose()
  PersonInfoModel:DeleteFakeAvatar()
  for _, Events in pairs(self.Events_BeforeClose) do
    if Events then
      Events(self)
    end
  end
  self:OnPersonalInfoClosed()
end

function M:OnClickOpenEditPage()
  PersonInfoController:OpenEditView("Char", nil)
end

function M:OnClickOpenDataPage()
  if PersonInfoModel:IsOwener() then
    PersonInfoController:OpenDataView()
  else
    local Visible = PersonInfoModel:GetDataPageVisibility()
    if Visible then
      PersonInfoController:OpenDataView()
    else
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_PersonalPage_Recount_Hidden"))
    end
  end
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  if self.IsEditOpen then
    self.IsEditOpen = false
    self:PlayAnimation(self.Edit_List_Out)
  end
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

function M:SetOriginFocus()
  DebugPrint("\232\129\154\231\132\166\229\136\176\232\181\183\231\130\185")
  if not PersonInfoModel:IsOwener() then
    PersonInfoController.MainPage:SetFocus()
    if 1 ~= self.AvatarItem_1.Com_Item.Id then
      self.AvatarItem_1.Com_Item:SetFocus()
    end
    return
  end
  if self.IsEditOpen then
    self:GetFisrtEditItem():SetFocus()
  else
    if self.FreshFocusLeaveEditListView then
      self:FreshFocusLeaveEditListView()
    end
    self.AvatarItem_1.Com_Item:SetFocus()
  end
end

function M:RotateActorForGamePad(MoveDeltaX)
  local CursorDelta = {X = 5, Y = 0}
  CursorDelta.X = MoveDeltaX * CursorDelta.X
  self.ActorController:OnDragging(CursorDelta)
end

function M:ZoomCamare(Dalta)
  self.ActorController:OnScrolling(Dalta)
end

function M:OnItemFocusForGamePad(ItemObj)
  if PersonInfoController.MainPage.CurInputDeviceType == ECommonInputType.Gamepad then
    if 0 ~= ItemObj.Content.Id then
      PersonInfoController.MainPage:UpdataGamePadBottomAInfo(2)
    elseif PersonInfoModel:IsOwener() then
      PersonInfoController.MainPage:UpdataGamePadBottomAInfo(1)
    else
      PersonInfoController.MainPage:UpdataGamePadBottomAInfo()
    end
  end
end

function M:OnPortraitReddotChange(Count)
  self.Button_Edit.New:SetEnable(Count > 0)
end

function M:AddReddotListener(ReddotNodeName, func)
  self:RemoveReddotListener(ReddotNodeName)
  ReddotManager.AddListenerEx(ReddotNodeName, self, func)
  self.ListenedReddot = true
end

function M:RemoveReddotListener(ReddotNodeName)
  if self.ListenedReddot then
    ReddotManager.RemoveListener(ReddotNodeName, self)
    self.ListenedReddot = false
  end
end

AssembleComponents(M)
return M
