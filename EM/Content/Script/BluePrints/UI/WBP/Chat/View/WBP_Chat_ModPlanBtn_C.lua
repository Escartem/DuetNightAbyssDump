require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnBtnClickInMod()
  local ChatView = ChatController:GetView()
  if ChatView.IsBeginToClose then
    return
  end
  local Tag
  if self.TargetType == "Weapon" then
    local BattleConf = DataMgr.BattleWeapon[self.TargetId]
    if BattleConf.WeaponTag then
      if table.findValue(BattleConf.WeaponTag, "Melee") then
        Tag = "Melee"
      elseif table.findValue(BattleConf.WeaponTag, "Ranged") then
        Tag = "Ranged"
      end
    end
  else
    Tag = self.TargetType
  end
  local bBattle = ChatView.bBattle
  ChatView:Close()
  local UIMode
  if self.bSelfMsg then
    UIMode = ModCommon.MainUICase.Preview
  else
    UIMode = ModCommon.MainUICase.CopyMode
  end
  ModModel:CreateDummyAvatarForCopyMode(self.ModSuitInfo)
  ModController:OpenView(ModCommon.ArmoryMod, self.TargetType, Tag, {1}, nil, {
    Func = function()
      ChatController:OpenView(nil, bBattle)
    end
  }, UIMode, nil)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mod_suit_preset", nil, nil)
end

function M:OnBtnClickInSkin()
  local ChatView = ChatController:GetView()
  if ChatView.IsBeginToClose then
    return
  end
  ChatView:Close()
  UIManager(self):LoadUINew("ArmorySkin", {
    Type = self.SkinType,
    SkinId = self.SkinId,
    OpenPreviewDyeFromChat = true,
    Colors = self.DyePlanInfo.Colors
  })
end

function M:Destruct()
  self.Button_Area.OnClicked:Remove(self, self.OnBtnClickInMod)
  self.Button_Area.OnClicked:Remove(self, self.OnBtnClickInSkin)
end

function M:InitMod(ModSuitInfo, bSelfMsg)
  self.ModSuitInfo = ModSuitInfo
  local ModSuitName = ModSuitInfo.TargetInfo[6]
  local TargetType = ModSuitInfo.TargetInfo[1]
  local TargetId = ModSuitInfo.TargetInfo[2]
  self.TargetType = TargetType
  self.TargetId = TargetId
  self.Text_Plan:SetText(GText(ModSuitName))
  local Conf, Name = nil, "\232\167\146\232\137\178\230\136\150\230\173\166\229\153\168\232\162\171\229\136\160\233\153\164\228\186\134!!!!"
  if "Char" == TargetType then
    Conf = DataMgr.Char[TargetId]
    Name = Conf.CharName
  elseif "Weapon" == TargetType then
    Conf = DataMgr.Weapon[TargetId]
    Name = Conf.WeaponName
  elseif "UWeapon" == TargetType then
    Conf = DataMgr.UWeapon[TargetId]
    Name = Conf.WeaponName
  end
  if Conf.Icon then
    UResourceLibrary.LoadObjectAsync(self, Conf.Icon, {
      self,
      function(_, Icon)
        local Mat = self.Img_Avatar:GetDynamicMaterial()
        Mat:SetTextureParameterValue("IconMap", Icon)
      end
    })
  end
  self.Text_Avatar:SetText(GText(Name))
  self.bSelfMsg = bSelfMsg
  self.Button_Area.OnClicked:Add(self, self.OnBtnClickInMod)
end

function M:InitDye(DyePlanInfo, bSelfMsg)
  self.DyePlanInfo = DyePlanInfo
  local DyePlanName = DyePlanInfo.PlanName
  local SkinType = DyePlanInfo.SkinType
  local SkinId = DyePlanInfo.SkinId
  local SkinName = DyePlanInfo.TargetName
  self.SkinType = SkinType
  self.SkinId = SkinId
  self.Text_Plan:SetText(GText(DyePlanName))
  local Conf
  if "Char" == SkinType then
    Conf = DataMgr.Skin[SkinId]
  elseif "Weapon" == SkinType then
    Conf = DataMgr.WeaponSkin[SkinId] or DataMgr.Weapon[SkinId]
  end
  if Conf and Conf.Icon then
    UResourceLibrary.LoadObjectAsync(self, Conf.Icon, {
      self,
      function(_, Icon)
        local Mat = self.Img_Avatar:GetDynamicMaterial()
        Mat:SetTextureParameterValue("IconMap", Icon)
      end
    })
  end
  self.Text_Avatar:SetText(GText(SkinName))
  self.bSelfMsg = bSelfMsg
  self.Button_Area.OnClicked:Add(self, self.OnBtnClickInSkin)
end

return M
