require("UnLua")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local GMObjectUtils = {}

function GMObjectUtils.NewCommandObject(content, class)
  if nil == content then
    return
  end
  if nil == class then
    class = UE4.LoadClass("/Game/UI/UI_PC/GM/GM_Command_Content_PC.GM_Command_Content_PC_C")
  end
  local obj = NewObject(class)
  obj.Text = content.text
  obj.Mode = content.mode
  obj.VarName = content.var_name
  obj.Callback = content.callback
  if content.mode == "switch" and content.var_name then
    obj.IsEnable = GMVariable[content.var_name]
  else
    obj.IsEnable = false
  end
  if content.widget_path then
    obj.MenuClass = UE4.LoadClass(content.widget_path)
  end
  if nil ~= content.commands then
    obj.Commands = {}
    for _, value in pairs(content.commands) do
      obj.Commands:Add(GMObjectUtils.NewCommandObject(value, class))
    end
  end
  if content.parameters then
    for _, value in ipairs(content.parameters) do
      obj.Parameters:Add(value)
    end
  end
  obj.CloseGM = content.close_gm or false
  obj.DataFunc = content.data_func
  return obj
end

function GMObjectUtils.FindCommandObjByName(Name)
  if IsValid(GMVariable.AllCommands) then
    return GMObjectUtils.FindCommandObjByNameDfs(GMVariable.AllCommands, Name)
  end
end

function GMObjectUtils.FindCommandObjByNameDfs(Command, Name)
  if IsValid(Command) then
    if Command.Text == Name then
      return Command
    else
      local len = Command.Commands:Length()
      for i = 1, len do
        local res = GMObjectUtils.FindCommandObjByNameDfs(Command.Commands[i], Name)
        if res then
          return res
        end
      end
    end
  end
end

function GMObjectUtils.GetCharCmdObjs()
  local Array = {}
  local Data = DataMgr.BattleChar
  for k, v in pairs(Data) do
    table.insert(Array, v.RoleId)
  end
  table.sort(Array)
  local content = {
    mode = "button",
    callback = "ChangeRole",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. GText(Data[id].CharName)
    obj.Parameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetDynCmdObjs()
  local Array = {}
  local Data = DataMgr.DynQuest
  for k, v in pairs(Data) do
    table.insert(Array, v.DynQuestId)
  end
  table.sort(Array)
  local content = {
    mode = "button",
    callback = "ForceStartDynQuest",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. GText(Data[id].DynName)
    obj.Parameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetWeaponCmdObjs()
  local Array = {}
  local Data = DataMgr.Weapon
  for _, v in pairs(Data) do
    table.insert(Array, v.WeaponId)
  end
  table.sort(Array)
  local content = {
    mode = "button",
    callback = "ChangeWeapon",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    local Weapon_Text_ID = Data[id].WeaponName
    obj.Text = id .. " " .. (GText(Weapon_Text_ID) or "")
    obj.Parameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetResourceCmdObjs()
  local Array = {}
  local Data = DataMgr.Resource
  for _, v in pairs(Data) do
    table.insert(Array, v.ResourceId)
  end
  table.sort(Array)
  local content = {
    mode = "edit",
    callback = "AddResource"
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. (GText(Data[id].ResourceName) or "")
    obj.FixedParameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetDropCmdObjs()
  local Array = {}
  local Data = DataMgr.Drop
  for _, v in pairs(Data) do
    table.insert(Array, v.DropId)
  end
  table.sort(Array)
  local content = {mode = "edit", callback = "GetDrop"}
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. (GText(Data[id].DropName) or "")
    obj.FixedParameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetHotKeyCmdObjs()
  local KeyboardConfig = DataMgr.KeyboardMap
  local Result = {}
  for key, value in pairs(KeyboardConfig) do
    local content = {
      mode = "text",
      parameters = {
        GText(value.ActionNameText or ""),
        value.Key
      }
    }
    local obj = GMObjectUtils.NewCommandObject(content)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetMonsterCmdObjs()
  local Array = {}
  local Data = DataMgr.Monster
  for k, v in pairs(Data) do
    table.insert(Array, v.UnitId)
  end
  table.sort(Array)
  local content = {
    mode = "edit",
    callback = "CreateMonster",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. GText(Data[id].UnitName or "")
    obj.Parameters:Add(id)
    obj.Parameters:Add("")
    obj.Parameters:Add("CM")
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetCMSCmdObjs()
  local Array = {}
  local Data = DataMgr.MechanismSummon
  for k, v in pairs(Data) do
    table.insert(Array, v.UnitId)
  end
  table.sort(Array)
  local content = {
    mode = "edit",
    callback = "CreateMechanismSummon",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. GText(Data[id].UnitName or "")
    obj.FixedParameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

function GMObjectUtils.GetCPCmdObjs()
  local Array = {}
  local Data = DataMgr.Phantom
  for k, v in pairs(Data) do
    table.insert(Array, v.UnitId)
  end
  table.sort(Array)
  local content = {
    mode = "edit",
    callback = "CreatePhantom",
    close_gm = true
  }
  local Result = {}
  for _, id in ipairs(Array) do
    local obj = GMObjectUtils.NewCommandObject(content)
    obj.Text = id .. " " .. GText(Data[id].UnitName or "")
    obj.FixedParameters:Add(id)
    table.insert(Result, obj)
  end
  return Result
end

return GMObjectUtils
