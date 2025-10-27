require("UnLua")
local TeamModel = TeamController:GetModel()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Img_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Img_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_LevelName:SetText(GText("BATTLE_UI_BLOOD_LV"))
  self.VB_Phantom:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.PhantomUIs = {}
  self.PhantomUICount = 0
  if GWorld:IsStandAlone() then
    self.MaxPhantomCount = 2
  else
    local PlayerArray = GameState(self).PlayerArray
    if PlayerArray:Num() > 1 then
      self.MaxPhantomCount = 1
    else
      self.MaxPhantomCount = 2
    end
  end
  self.Button_Area.OnCheckStateChanged:Add(self, self.OnCheckStateChanged)
  self.Head_Anchor.OnGetMenuContentEvent:Bind(self, self.OnGetMenuContent)
  self.Head_Anchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.Button_Area:SetChecked(false)
  EventManager:AddEvent(EventID.ShowTeammateBloodUI, self, self.AddPhantomUI)
  EventManager:AddEvent(EventID.CloseTeammateBloodUI, self, self.DelPhantomUI)
end

function M:Init(Owner, Member, Index, bAnim)
  for _, ItemUI in pairs(self.VB_Phantom:GetAllChildren()) do
    ItemUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.VB_Phantom:SetVisibility(UIConst.VisibilityOp.Collapsed)
  DebugPrint(DebugTag, LXYTag, "Team_PlayerItem:: Init", Index)
  self.Pos = Index
  self.Member = Member
  self.Owner = Owner
  local CharId = 0
  local CharLevel
  local MeleeWId = 0
  local RangedWId = 0
  local MeleeWLevel, RangedWLevel, Eid
  if not GWorld:IsStandAlone() then
    local GameState = GameState(self)
    local EntityState = GameState.PlayerArray:GetRef(Index)
    Eid = EntityState.Eid
    CharId = EntityState.CharId
    CharLevel = EntityState.CharLevel
    MeleeWId = EntityState.MeleeWeaponId
    RangedWId = EntityState.RangedWeaponId
    MeleeWLevel = EntityState.MeleeWeaponLevel
    RangedWLevel = EntityState.RangedWeaponLevel
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  elseif Member.Char then
    CharId = Member.Char.CharId
    CharLevel = Member.Char.Level
    if Member.MeleeWeapon then
      MeleeWId = Member.MeleeWeapon.WeaponId
      MeleeWLevel = Member.MeleeWeapon.Level
    end
    if Member.RangedWeapon then
      RangedWId = Member.RangedWeapon.WeaponId
      RangedWLevel = Member.RangedWeapon.Level
    end
  end
  if TeamModel:IsYourself(Member.Uid) then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    Eid = Eid and Eid or Player.Eid
    CharId = 0 ~= CharId and CharId or Player.CurrentRoleId
    CharLevel = CharLevel and CharLevel or Player:GetAttr("Level")
  end
  for _, WeaponUI in pairs(self.VB_PlayerInfo:GetAllChildren()) do
    WeaponUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if 0 ~= MeleeWId then
    local WeaponUI = self.VB_PlayerInfo:GetChildAt(0)
    if not IsValid(WeaponUI) then
      WeaponUI = self.Owner:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleInfoWeapon.UIName)
      self.VB_PlayerInfo:AddChild(WeaponUI)
    end
    WeaponUI:Init(MeleeWId, MeleeWLevel, CommonConst.WeaponType.MeleeWeapon)
  end
  if 0 ~= RangedWId then
    local WeaponUI = self.VB_PlayerInfo:GetChildAt(1)
    if not IsValid(WeaponUI) then
      WeaponUI = self.Owner:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleInfoWeapon.UIName)
      self.VB_PlayerInfo:AddChild(WeaponUI)
    end
    DebugPrint(DebugTag, LXYTag, "Team_PlayerItem:: Init RangedWId", RangedWId)
    WeaponUI:Init(RangedWId, RangedWLevel, CommonConst.WeaponType.RangedWeapon)
  end
  if Eid then
    self.Eid = Eid
    self.PhantomUIs = {}
    self.PhantomUICount = 0
    for _, PhantomState in pairs(GameState(self).PhantomArray) do
      if PhantomState.OwnerEid == Eid then
        self:AddPhantomUI(PhantomState.Eid)
      end
    end
  end
  if CharLevel then
    self.Text_Level:SetText(CharLevel)
  end
  if 0 ~= CharId then
    local HeadPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
    local HeadImg = DataMgr.BattleChar[CharId].GuideIconImg
    HeadImg = TeamCommon.Normal .. HeadImg
    UE.UResourceLibrary.LoadObjectAsync(self, HeadPath .. HeadImg .. "." .. HeadImg .. "'", {
      self,
      M.OnIconLoadFinish
    })
  end
  self:UpdateTag()
  if bAnim and self.In then
    self:PlayAnimation(self.In)
  else
    self:PlayAnimation(self.Normal)
  end
  if not GWorld:IsStandAlone() then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnIconLoadFinish(Object)
  if IsValid(self) and self.Img_Head then
    self.Img_Head:SetBrushResourceObject(Object)
  end
end

function M:AddPhantomUI(PhantomEid)
  if not PhantomEid then
    DebugPrint(LXYTag, WarningTag, "WBP_Team_PlayerItem_Base::AddPhantomUI\230\151\160\230\149\136\231\154\132PhantomEid", PhantomEid)
    return
  end
  local PhantomState = GameState(self):GetPhantomState(PhantomEid)
  if not PhantomState then
    DebugPrint(LXYTag, WarningTag, "WBP_Team_PlayerItem_Base::AddPhantomUI\230\151\160\230\149\136\231\154\132PhantomEid", PhantomEid)
    return
  end
  local PhantomCharConf = DataMgr.Phantom[PhantomState.CharId]
  if PhantomCharConf and PhantomCharConf.IsHostage then
    DebugPrint(LXYTag, WarningTag, "\228\186\186\232\180\168\231\137\185\230\174\138\229\164\132\231\144\134\239\188\140\228\184\141\229\186\148\232\175\165\232\162\171\229\189\147\228\189\156\233\173\133\229\189\177")
    return
  end
  if PhantomState.OwnerEid ~= self.Eid then
    return
  end
  if TeamModel:GetAvatar():IsInBigWorld() then
    return
  end
  local PhantomUI
  if not next(self.PhantomUIs) then
    self.VB_Phantom:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Img_Up:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Img_Down:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.VB_Phantom:GetChildrenCount() < self.MaxPhantomCount then
    PhantomUI = self.Owner:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleInfoPhantom.UIName)
    self.VB_Phantom:AddChild(PhantomUI)
  else
    PhantomUI = self.VB_Phantom:GetChildAt(self.PhantomUICount)
    PhantomUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.PhantomUIs[PhantomEid] = PhantomUI
  self.PhantomUICount = self.PhantomUICount + 1
  PhantomUI:Init(PhantomState)
end

function M:DelPhantomUI(Eid)
  local PhantomUI = self.PhantomUIs[Eid]
  if not IsValid(PhantomUI) then
    return
  end
  self.VB_Phantom:RemoveChild(PhantomUI)
  self.VB_Phantom:AddChild(PhantomUI)
  PhantomUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.PhantomUIs[Eid] = nil
  self.PhantomUICount = self.PhantomUICount - 1
  if not next(self.PhantomUIs) then
    self.PhantomUICount = 0
    self.VB_Phantom:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Img_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Img_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnCheckStateChanged(IsChecked)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  if IsChecked then
    self.Head_Anchor:Open(true)
  else
    self.bOpenMenu = false
  end
end

function M:PlayMove(bReverse)
  self:UpdateTag()
  if bReverse then
  else
  end
end

function M:OnGetMenuContent(Anchor)
  if not self.Button_Area:IsChecked() then
    return
  end
  
  local function InitTeamKickBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Team_Kick")
    
    function Content.Callback()
      TeamController:OpenKickMemberDialog(AvatarInfo, nil)
      self.Head_Anchor:Close()
      self.Owner:Close()
    end
  end
  
  local function InitTeamLeaderTransBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Team_Transfer")
    
    function Content.Callback()
      TeamController:SendTeamChangeLeader(AvatarInfo.Uid)
      self.Head_Anchor:Close()
    end
  end
  
  local function InitShowRecordBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Chat_ShowRecord")
    
    function Content.Callback()
      if TeamModel:IsYourself(AvatarInfo.Uid) then
        PersonInfoController:OpenView()
      else
        TeamController:GetAvatar():CheckOtherPlayerPersonallInfo(AvatarInfo.Uid)
      end
      self.Head_Anchor:Close()
      self.Owner:Close()
    end
  end
  
  local function InitAddFriendBtn(Content, AvatarInfo)
    Content.Text = GText("UI_Friend_AddFriend")
    
    function Content.Callback()
      FriendController:OpenAddFriendDialog(self, AvatarInfo)
      self.Head_Anchor:Close()
      self.Owner:Close()
    end
  end
  
  local Switch = {}
  if TeamModel:IsYourself(self.Member.Uid) then
    Switch = {InitShowRecordBtn}
  else
    if TeamModel:IsTeamLeader(TeamModel:GetAvatar().Uid) then
      Switch = {
        InitTeamKickBtn,
        InitTeamLeaderTransBtn,
        InitShowRecordBtn
      }
    else
      Switch = {InitShowRecordBtn}
    end
    if not FriendController:GetModel():GetFriendDict()[self.Member.Uid] then
      table.insert(Switch, InitAddFriendBtn)
    end
  end
  if IsEmptyTable(Switch) then
    self.bOpenMenu = false
    return nil
  end
  self.bOpenMenu = true
  local Widget = ChatController:OpenPlayerBtnList(self, self.Member, Switch)
  Widget:DontShowBottom()
  return Widget
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.Out then
    self:RemoveFromParent()
    self.Owner.WB_Player:AddChild(self)
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Close()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:PlayAnimation(self.Out)
end

function M:UpdateTag()
  local Uid = self.Member.Uid
  self.Tag_Player:Init(TeamModel:IsTeamLeader(Uid), self.Member.Index, Uid)
end

function M:Destruct()
  self.Head_Anchor.OnGetMenuContentEvent:Unbind()
  self.Head_Anchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.Button_Area.OnCheckStateChanged:Remove(self, self.OnCheckStateChanged)
  EventManager:RemoveEvent(EventID.ShowTeammateBloodUI, self)
  EventManager:RemoveEvent(EventID.CloseTeammateBloodUI, self)
end

return M
