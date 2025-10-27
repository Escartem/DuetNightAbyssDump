require("UnLua")
local EMCache = require("EMCache.EMCache")
local Common_Key_Hud_PC = Class()

function Common_Key_Hud_PC:Construct()
  self.bBattleShortCutKey = true
end

function Common_Key_Hud_PC:Destruct()
  if self.bBattleShortCutKey then
    UIManager(self):UnRegisterBattleShortCutHudKey(self)
  end
end

function Common_Key_Hud_PC:SetTextInfo(Key, KeyText, bBattleShortCutKey)
  bBattleShortCutKey = bBattleShortCutKey or false
  self.bBattleShortCutKey = bBattleShortCutKey
  local Style = "Single"
  if not self:UseSinglePanel(Key) then
    Style = "Multi"
  end
  if "Single" == Style then
    self.Text_Key_Single:SetText(Key)
  else
    self.Text_Key:SetText(Key)
  end
  if bBattleShortCutKey then
    UIManager(self):RegisterBattleShortCutHudKey(self)
    self:SetBattleShortCutKeyHidden()
  end
  self:SetUpInfo(Style)
  self:SetUpVisible(Style)
  self:SetKeyText(KeyText)
end

function Common_Key_Hud_PC:SetImgInfo(ShortPath, KeyText, bBattleShortCutKey)
  bBattleShortCutKey = bBattleShortCutKey or false
  self.bBattleShortCutKey = bBattleShortCutKey
  local FixPath = "Texture2D'/Game/UI/UI_PNG/Common/Key/Icon_%s.Icon_%s'"
  local ReplaceKey = string.gsub(ShortPath, " ", "_")
  local ReplacePath = string.format(FixPath, ReplaceKey, ReplaceKey)
  local Style = "Img"
  if bBattleShortCutKey then
    UIManager(self):RegisterBattleShortCutHudKey(self)
    self:SetBattleShortCutKeyHidden()
  end
  self:SetUpInfo(Style, false)
  self:SetUpVisible(Style)
  self:SetUpImage(ReplacePath)
  self:SetKeyText(KeyText)
  return true
end

function Common_Key_Hud_PC:SetImgByFullPath(FullPath, KeyText, bBattleShortCutKey)
  bBattleShortCutKey = bBattleShortCutKey or false
  self.bBattleShortCutKey = bBattleShortCutKey
  local Style = "Img"
  if bBattleShortCutKey then
    UIManager(self):RegisterBattleShortCutHudKey(self)
    self:SetBattleShortCutKeyHidden()
  end
  self:SetUpInfo(Style, false)
  self:SetUpVisible(Style)
  self:SetUpImage(FullPath)
  self:SetKeyText(KeyText)
  return true
end

function Common_Key_Hud_PC:SetBattleShortCutKeyHidden()
  local CurrentHidden = EMCache:Get("BattleShortcutHudKeysHidden", true)
  if CurrentHidden then
    self:SetVisibility(ESlateVisibility.Hidden)
  end
end

function Common_Key_Hud_PC:SetKeyText(KeyText)
  if KeyText then
    self.Split:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Key_Text:SetText(GText(KeyText))
    self.Key_Text:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Split:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_Text:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Common_Key_Hud_PC:SetUpInfo(Style)
  self.bEnable = true
  self.Style = nil
end

function Common_Key_Hud_PC:SetUpImage(Path)
  local Img
  Img = LoadObject(Path)
  assert(Img, "\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144")
  self.Img_Key:SetBrushFromTexture(Img)
  self.Img_Key:SetVisibility(UE4.ESlateVisibility.Visible)
end

function Common_Key_Hud_PC:SetUpVisible(Style)
  self.Style = Style
  if "Img" == Style then
    self.Panel_Img:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Key_Single:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Key_Multi:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif "Single" == Style then
    self.Panel_Key_Single:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Img:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Key_Multi:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Key_Multi:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Img:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Key_Single:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Common_Key_Hud_PC:UseSinglePanel(str)
  if 1 == #str then
    return true
  end
  if string.match(str, "(F%d+)") then
    return true
  end
  return false
end

function Common_Key_Hud_PC:AddExecuteLogic(Object, ObjectFunc)
  self.ExecuteLogicObject = Object
  self.ExecuteLogicObjectFunc = ObjectFunc
end

function Common_Key_Hud_PC:RemoveExecuteLogic()
  self.ExecuteLogicObject = nil
  self.ExecuteLogicObjectFunc = nil
end

function Common_Key_Hud_PC:ExecuteLogic()
  if self.ExecuteLogicObject and self.ExecuteLogicObjectFunc then
    self.ExecuteLogicObjectFunc(self.ExecuteLogicObject)
  end
end

function Common_Key_Hud_PC:OnMouseButtonDown(MyGeometry, InKeyEvent)
  self:ExecuteLogic()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return Common_Key_Hud_PC
