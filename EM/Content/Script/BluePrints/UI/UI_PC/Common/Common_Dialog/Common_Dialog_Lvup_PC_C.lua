require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self.Btn_Reduce:BindEventOnPressed(self, self.OnReduceLvKeyDown)
  self.Btn_Reduce:BindEventOnReleased(self, self.OnReduceLvKeyUp)
  self.Btn_Add:BindEventOnPressed(self, self.OnAddLvKeyDown)
  self.Btn_Add:BindEventOnReleased(self, self.OnAddLvKeyUp)
  self.Btn_Reduce:BindForbidStateExecuteEvent(self, function(self)
    self:OnSubBtnForbid()
  end)
  self.Btn_Add:BindForbidStateExecuteEvent(self, function(self)
    self:OnAddBtnForbid()
  end)
  self.Btn_Add_Max:BindEventOnClicked(self, function(self)
    self:OnBtnAddMaxClicked()
  end)
  self.Btn_Reduce_Max:BindEventOnClicked(self, function(self)
    self:OnBtnReduceMaxClicked()
  end)
  self.Btn_Reduce_Max:BindForbidStateExecuteEvent(self, function(self)
    self:OnSubMaxBtnForbid()
  end)
  self.Btn_Add_Max:BindForbidStateExecuteEvent(self, function(self)
    self:OnAddMaxBtnForbid()
  end)
  local ForbidSoundEvent = "event:/ui/common/click_btn_disable"
  
  function self.Btn_Add.SoundFunc(Btn)
    if Btn.IsForbidden then
      AudioManager(self):PlayUISound(self.Btn_Add, ForbidSoundEvent, nil, nil)
    else
      AudioManager(self):PlayUISound(self.Btn_Add, "event:/ui/common/click_btn_add", nil, nil)
    end
  end
  
  function self.Btn_Reduce.SoundFunc(Btn)
    if Btn.IsForbidden then
      AudioManager(self):PlayUISound(self.Btn_Reduce, ForbidSoundEvent, nil, nil)
    else
      AudioManager(self):PlayUISound(self.Btn_Reduce, "event:/ui/common/click_btn_minus", nil, nil)
    end
  end
  
  function self.Btn_Add_Max.SoundFunc(Btn)
    if Btn.IsForbidden then
      AudioManager(self):PlayUISound(self.Btn_Add_Max, ForbidSoundEvent, nil, nil)
    else
      AudioManager(self):PlayUISound(self.Btn_Add_Max, "event:/ui/common/click_btn_addMulti", nil, nil)
    end
  end
  
  function self.Btn_Reduce_Max.SoundFunc(Btn)
    if Btn.IsForbidden then
      AudioManager(self):PlayUISound(self.Btn_Reduce_Max, ForbidSoundEvent, nil, nil)
    else
      AudioManager(self):PlayUISound(self.Btn_Reduce_Max, "event:/ui/common/click_btn_minusMulti", nil, nil)
    end
  end
  
  AudioManager(self):PlayUISound(self, "event:/ui/armory/strength_panel_show", "CommonLevelUpOpen", nil)
  self:InitKeySetting()
end

function M:Destruct()
  AudioManager(self):SetEventSoundParam(self, "CommonLevelUpOpen", {ToEnd = 1})
  M.Super.Destruct(self)
end

function M:InitKeySetting()
  self.AddLv = "Add"
  self.ReduceLv = "Subtract"
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.AddLv] = self.OnAddLvKeyDown
  self.KeyDownEvent[self.ReduceLv] = self.OnReduceLvKeyDown
  self.IsKeyDown = {}
  self.KeyUpEvent = {}
  self.KeyUpEvent[self.AddLv] = self.OnAddLvKeyUp
  self.KeyUpEvent[self.ReduceLv] = self.OnReduceLvKeyUp
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = true
    if self.KeyDownEvent[InKeyName] then
      UIUtils.PlayCommonBtnSe(self)
      self.KeyDownEvent[InKeyName](self)
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = false
    if self.KeyUpEvent[InKeyName] then
      self.KeyUpEvent[InKeyName](self)
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnOwnerKeyDown(InKeyName)
  if not self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = true
    if self.KeyDownEvent[InKeyName] then
      UIUtils.PlayCommonBtnSe(self)
      self.KeyDownEvent[InKeyName](self)
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnOwnerKeyUp(InKeyName)
  if self.IsKeyDown[InKeyName] then
    self.IsKeyDown[InKeyName] = false
    if self.KeyUpEvent[InKeyName] then
      self.KeyUpEvent[InKeyName](self)
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAddLvKeyDown()
  self:OnReduceLvKeyUp()
  self:NextLevel()
  
  local function NextLevelLoop()
    self:AddTimer(0.1, self.NextLevel, true, 0, "NextLevelLoop", true)
  end
  
  self:AddTimer(0.5, NextLevelLoop, false, 0, "StartNextLevelLoop", true)
end

function M:OnAddLvKeyUp()
  self:RemoveTimer("StartNextLevelLoop", true)
  self:RemoveTimer("NextLevelLoop", true)
end

function M:OnReduceLvKeyDown()
  self:OnAddLvKeyUp()
  self:PreLevel()
  
  local function PreLevelLoop()
    self:AddTimer(0.1, self.PreLevel, true, 0, "PreLevelLoop", true)
  end
  
  self:AddTimer(0.5, PreLevelLoop, false, 0, "StartPreLevelLoop", true)
end

function M:OnReduceLvKeyUp()
  self:RemoveTimer("StartPreLevelLoop", true)
  self:RemoveTimer("PreLevelLoop", true)
end

function M:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  Owner.OnKeyDownCallbackObj = self
  Owner.OnKeyDownCallbackFunction = self.OnOwnerKeyDown
  Owner.OnKeyUpCallbackObj = self
  Owner.OnKeyUpCallbackFunction = self.OnOwnerKeyUp
  if Params then
    if Params.BehaviourType == "LevelUp" then
      self._components = {
        "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponLvup_Component"
      }
      AssembleComponents(self)
    elseif Params.BehaviourType == "SkillLevelUp" then
      self._components = {
        "BluePrints.UI.WBP.Armory.Armory_SkillLvup_Component"
      }
      AssembleComponents(self)
    end
  end
end

function M:OnBtnAddMaxClicked()
end

function M:OnBtnReduceMaxClicked()
end

function M:OnAddMaxBtnForbid()
end

function M:OnSubMaxBtnForbid()
end

function M:PreLevel()
end

function M:NextLevel()
end

function M:OnAddBtnForbid()
end

function M:OnSubBtnForbid()
end

return M
