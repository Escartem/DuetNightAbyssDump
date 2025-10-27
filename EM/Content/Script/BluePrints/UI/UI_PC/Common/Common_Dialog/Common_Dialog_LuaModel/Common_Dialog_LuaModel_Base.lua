require("UnLua")
local Common_Dialog_LuaModel_Base = setmetatable({}, {
  __index = function(t, k)
    local DialogWidget = rawget(t, "DialogWidget")
    local Result
    if DialogWidget then
      if DialogWidget[k] then
        Result = DialogWidget[k]
      end
      local ContentWidget = DialogWidget:GetContentWidgetByName(k)
      if ContentWidget then
        Result = ContentWidget
      end
      rawset(t, k, Result)
      return Result
    end
  end,
  __newindex = function(t, k, v)
    local DialogWidget = rawget(t, "DialogWidget")
    if DialogWidget then
      DialogWidget[k] = v
    else
      rawset(t, k, v)
    end
  end
})

function Common_Dialog_LuaModel_Base:PackageData()
  return nil
end

function Common_Dialog_LuaModel_Base:BindDialogWidget(PopupId, DialogWidget)
  self.DialogWidget = DialogWidget
  self.PopupId = PopupId
end

function Common_Dialog_LuaModel_Base:Initialize()
  DebugPrint("Tianyi@ \229\188\185\231\170\151 " .. tostring(self.PopupId) .. " \230\156\170\229\174\154\228\185\137\229\136\157\229\167\139\229\140\150\230\150\185\230\179\149!")
end

return Common_Dialog_LuaModel_Base
