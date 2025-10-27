require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitKey(CommonKeyDatas)
  self.List_KeyDesc:ClearListItems()
  if not CommonKeyDatas then
    return
  end
  self.List_KeyDesc:SetVisibility(UE4.ESlateVisibility.Visible)
  self.CommonKeyDatas = CommonKeyDatas
  for Index, Data in ipairs(CommonKeyDatas) do
    local RightKeyTextDescData = NewObject(UE4.LoadClass(UIConst.DUNGEONCOMRIGHTKEYTEXTDESCDATA))
    RightKeyTextDescData.Owner = self
    RightKeyTextDescData.Index = Index
    self.List_KeyDesc:AddItem(RightKeyTextDescData)
  end
end

function M:InitCommonKey(CommonKey, Index)
  local CommonKeyData = self.CommonKeyDatas[Index]
  if not CommonKeyData then
    return
  end
  local IsAddType = false
  local KeyInfoList = {}
  if CommonKeyData.ImgShortPath and #CommonKeyData.ImgShortPath > 1 then
    for i, v in ipairs(CommonKeyData.ImgShortPath) do
      table.insert(KeyInfoList, {Type = "Img", ImgShortPath = v})
    end
    IsAddType = true
  elseif CommonKeyData.ImgShortPath and 1 == #CommonKeyData.ImgShortPath then
    KeyInfoList = {
      {
        Type = CommonKeyData.Type,
        Text = CommonKeyData.Text,
        ImgShortPath = CommonKeyData.ImgShortPath[1]
      }
    }
  else
    KeyInfoList = {
      {
        Type = CommonKeyData.Type,
        Text = CommonKeyData.Text
      }
    }
  end
  local KeyData = {
    KeyInfoList = KeyInfoList,
    bLongPress = CommonKeyData.bLongPress,
    Desc = CommonKeyData.DescText
  }
  if IsAddType then
    KeyData.Type = "Add"
    CommonKey:CreateSubKeyDesc(KeyData)
  else
    CommonKey:CreateCommonKey(KeyData)
  end
  if CommonKeyData.GamemodeType and CommonKeyData.GamemodeType == "Temple" then
    CommonKey:ShowBanImg()
    CommonKey:DisableKey()
    if CommonKeyData.UIModePlatform == "Mobile" then
      CommonKey:MobileBanTextImg()
    end
  else
    CommonKey:AddExecuteLogic(CommonKeyData.CallbackObj, CommonKeyData.CallbackFunc)
  end
end

return M
