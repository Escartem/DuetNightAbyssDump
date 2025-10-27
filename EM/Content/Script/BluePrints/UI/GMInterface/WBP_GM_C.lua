require("UnLua")
local GMCommandConfig = require("BluePrints.UI.GMInterface.GMCommandConfig")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
local GMObjectUtils = require("BluePrints.UI.GMInterface.GMObjectUtils")
local WBP_GM_C = Class("BluePrints.UI.BP_UIState_C")
local LastGMTabIndex = 0
local GMTabTotalNum = 0

function WBP_GM_C:Initialize(Initializer)
  self.Super.Initialize(self)
  local GMKeys = UE4.TArray(UE4.FInputActionKeyMapping)
  UE4.UInputSettings.GetInputSettings():GetActionMappingByName("OpenGM", GMKeys)
  self.GMKeys = GMKeys:ToTable()
end

function WBP_GM_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self.AllCommands = GameInstance.GMPanelObj
  if not IsValid(self.AllCommands) then
    self:TryToGetCommandList()
    assert(self.AllCommands, "GM\230\140\135\228\187\164\229\136\151\232\161\168\232\175\187\229\143\150\229\164\177\232\180\165,\232\175\183\230\163\128\230\159\165\230\160\188\229\188\143\230\136\150\232\183\175\229\190\132\239\188\129")
    self.List_Tab_Top:ClearListItems()
    for k, v in pairs(self.AllCommands.Commands) do
      self.List_Tab_Top:AddItem(v)
    end
    self.List_Tab_Top:SetSelectedIndex(0)
  else
    self.List_Tab_Top:SetSelectedIndex(LastGMTabIndex)
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    local str = "\230\178\137\230\181\184\230\168\161\229\188\143"
    if Player.IsImmersionModel then
      str = str .. "\239\188\154\229\188\128"
    else
      str = str .. "\239\188\154\229\133\179"
    end
    self.Text_Immerse:SetText(str)
  end
  local str = "\231\149\140\233\157\162\230\149\176\230\141\174"
  if GMVariable.EnableUIData then
    str = str .. "\239\188\154\229\188\128"
  else
    str = str .. "\239\188\154\229\133\179"
  end
  self.Text_Data:SetText(str)
  self.Key_L:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = UE4.EKeys.Q.KeyName
      }
    }
  })
  self.Key_R:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = UE4.EKeys.E.KeyName
      }
    }
  })
  GMTabTotalNum = self.List_Tab_Top:GetNumItems()
end

function WBP_GM_C:TryToGetCommandList()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance.GMPanelObj = GMObjectUtils.NewCommandObject(GMCommandConfig, self.CommandContentClass)
  self.AllCommands = GameInstance.GMPanelObj
  if IsValid(self.AllCommands) then
    local len1 = self.AllCommands.Commands:Length()
    for i = 1, len1 do
      self.AllCommands.Commands[i].ParentWidget = self
      local len2 = self.AllCommands.Commands[i].Commands:Length()
      for j = 1, len2 do
        self.AllCommands.Commands[i].Commands[j].ParentWidget = self
      end
    end
  end
  GMVariable.AllCommands = self.AllCommands
end

function WBP_GM_C:SearchCommandByName(text, Command)
  if nil == text or not IsValid(Command) then
    return
  end
  UE4.UWidgetBlueprintLibrary.DismissAllMenus()
  local commands = Command.Commands
  self.List:ClearListItems()
  for _, v in pairs(commands) do
    if nil ~= v.Text and nil ~= string.find(v.Text, text) then
      self.List:AddItem(v)
      self.List:BP_SetItemSelection(v, v.IsEnable)
    end
  end
end

function WBP_GM_C:ExecuteGMCommand()
  GMFunctionLibrary.ExecConsoleCommand(self, self.Input_GM:GetText())
end

function WBP_GM_C:UIData()
  UIUtils.PlayCommonBtnSe(self)
  GMVariable.EnableUIData = not GMVariable.EnableUIData
  GMFunctionLibrary.ShowUIData(GMVariable.EnableUIData)
  local str = "\231\149\140\233\157\162\230\149\176\230\141\174"
  if GMVariable.EnableUIData then
    str = str .. "\239\188\154\229\188\128"
  else
    str = str .. "\239\188\154\229\133\179"
  end
  self.Text_Data:SetText(str)
end

function WBP_GM_C:Immerse()
  UIUtils.PlayCommonBtnSe(self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player and Player.ImmersionModel then
    Player:ImmersionModel()
    local str = "\230\178\137\230\181\184\230\168\161\229\188\143"
    if Player.IsImmersionModel then
      str = str .. "\239\188\154\229\188\128"
      self:Close()
    else
      str = str .. "\239\188\154\229\133\179"
    end
    self.Text_Immerse:SetText(str)
  end
end

function WBP_GM_C:TabClicked(Item)
  LastGMTabIndex = self.List_Tab_Top:GetIndexForItem(Item)
  self:SearchCommandByName(self.Input_GM:GetText(), Item)
  self.List_Tab_Top:NavigateToIndex(LastGMTabIndex)
end

function WBP_GM_C:CloseAllMenus()
  UE4.UWidgetBlueprintLibrary.DismissAllMenus()
  if IsValid(self.AllCommands) then
    local len1 = self.AllCommands.Commands:Length()
    for i = 1, len1 do
      local len2 = self.AllCommands.Commands[i].Commands:Length()
      for j = 1, len2 do
        local len3 = self.AllCommands.Commands[i].Commands[j].Commands:Length()
        for k = 1, len3 do
          self:CloseAllMenusDfs(self.AllCommands.Commands[i].Commands[j].Commands[k])
        end
      end
    end
  end
end

function WBP_GM_C:CloseAllMenusDfs(Command)
  local len = Command.Commands:Length()
  for i = 1, len do
    self:CloseAllMenusDfs(Command.Commands[i])
  end
  if Command.ParentWidget then
    Command.ParentWidget:Close()
  end
end

function WBP_GM_C:Close()
  UIUtils.PlayCommonBtnSe(self)
  self.Super.Close(self)
end

function WBP_GM_C:GMTabToLeft()
  local CurGMTabIndex = LastGMTabIndex - 1
  if CurGMTabIndex < 0 then
    return
  end
  self.List_Tab_Top:SetSelectedIndex(CurGMTabIndex)
end

function WBP_GM_C:GMTabToRight()
  local CurGMTabIndex = LastGMTabIndex + 1
  if CurGMTabIndex >= GMTabTotalNum then
    return
  end
  self.List_Tab_Top:SetSelectedIndex(CurGMTabIndex)
end

function WBP_GM_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:Close()
  elseif "Q" == InKeyName then
    self:GMTabToLeft()
  elseif "E" == InKeyName then
    self:GMTabToRight()
  end
  for _, Mapping in pairs(self.GMKeys) do
    if InKeyName == Mapping.Key.KeyName then
      self:Close()
      break
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return WBP_GM_C
