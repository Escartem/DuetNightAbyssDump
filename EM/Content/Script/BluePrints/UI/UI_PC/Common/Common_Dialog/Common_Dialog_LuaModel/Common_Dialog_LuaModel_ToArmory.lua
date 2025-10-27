require("UnLua")
local Common_Dialog_LuaModel_ToArmory = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_LuaModel.Common_Dialog_LuaModel_Base")

function Common_Dialog_LuaModel_ToArmory:Initialize()
  self.DialogWidget = UIManager(self):GetUIObj("CommonDialog")
  
  local function OpenArmoryFromPopup(Obj, Data, DialogWidget)
    DebugPrint("yklua OpenArmoryFromPopup")
    DialogWidget.ClickResult = true
  end
  
  local function OnDialogClosedCallback(Obj, Data, DialogWidget)
    DebugPrint("yklua OnDialogClosedCallback")
    if DialogWidget.ClickResult == true then
      PageJumpUtils:JumpToTargetPageByJumpId(52)
      local ArmoryMain = UIManager(self):GetUIObj("ArmoryMain")
      if ArmoryMain then
        UIManager(self):GetUIObj("ArmoryMain").OnCloseDelegate = {
          nil,
          function()
            UIUtils:OpenPopupToArmory()
          end,
          self
        }
      else
        DebugPrint("\230\178\161\230\156\137\230\137\190\229\136\176\229\134\155\230\162\176\229\186\147\231\149\140\233\157\162\239\188\140\229\133\179\233\151\173\231\149\140\233\157\162\229\144\142\228\184\141\228\188\154\230\137\147\229\188\128\229\188\185\231\170\151\227\128\130")
      end
    end
  end
  
  if self.OnCloseCallbackFunction then
    local OriginFunc = self.OnCloseCallbackFunction
    
    local function NewFunc(Obj, Data, DialogWidget)
      OnDialogClosedCallback(Obj, Data, DialogWidget)
      OriginFunc(Obj, Data, DialogWidget)
    end
    
    self.DialogWidget.OnCloseCallbackFunction = NewFunc
  else
    self.OnCloseCallbackFunction = OnDialogClosedCallback
  end
  self.OnCloseCallbackObj = self
  self.RightBtnCallbackObj = self
  if self.DialogWidget.RightBtnClickedCallback then
    local OriginFunc = self.DialogWidget.RightBtnClickedCallback
    
    local function NewFunc(Obj, Data, DialogWidget)
      OpenArmoryFromPopup(Obj, Data, DialogWidget)
      OriginFunc(Obj, Data, DialogWidget)
      self.OriginFunc = nil
      self.RightBtnClickedCallback = nil
      self.DialogWidget.RightBtnClickedCallback = nil
    end
    
    self.DialogWidget.RightBtnClickedCallback = NewFunc
  else
    self.RightBtnClickedCallback = OpenArmoryFromPopup
  end
end

return Common_Dialog_LuaModel_ToArmory
