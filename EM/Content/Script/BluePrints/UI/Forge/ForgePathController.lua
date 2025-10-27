require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local CommonConst = require("CommonConst")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local UIUtils = require("Utils.UIUtils")
local ForgePathModel = require("BluePrints.UI.Forge.ForgePathModel")
local MaxRowNum = 4
local MaxColNum = 4
local ForgePathController = Class()
ForgePathController._components = {
  "BluePrints.UI.Forge.ForgePathView"
}

function ForgePathController:PreInit(ForgeModel)
  self.ForgeModel = ForgeModel
end

function ForgePathController:Init(DraftId, Owner, ForgeModel)
  if not self.HasPreInit then
    self:PreInit(ForgeModel)
    self.HasPreInit = true
  end
  self.Owner = Owner
  self.PathModel = ForgePathModel:GetModel(DraftId)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  local PathMaxLen = self.PathModel:GetPathMaxLen(DraftId)
  self:InitView(DraftId, PathMaxLen)
  self:OnItemSelected(1, 1)
  self:RefreshOpInfoByInputDevice()
  if self.IsInCompendiumMode then
    self:InitCompendiumView()
  end
end

function ForgePathController:InitCallbacks()
  self.OnClosedCallback = nil
  self.OnDetailsViewBtnCancelClickedCallback = nil
  self.OnDetailsViewBtnStartClickedCallback = nil
  self.OnFocusToDetailsView = nil
  self.OnFocusToPathView = nil
end

function ForgePathController:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function ForgePathController:HandleTipShowDetails(bIsShow)
  if bIsShow then
    local IsSucceed = self.ItemDetails:TryGoToFirstItem()
    if IsSucceed then
      self.IsShowTipDetails = true
      self.ItemDetails.Forging:SetGamepadButtonKeyVisible(false)
      if self.OnFocusToDetailsView then
        local Obj, Func = table.unpack(self.OnFocusToDetailsView)
        if Obj and Func then
          Func(Obj)
        end
      end
    end
    return IsSucceed
  else
    self:RefocusToPathView()
    self.IsShowTipDetails = false
    if self.OnFocusToPathView then
      local Obj, Func = table.unpack(self.OnFocusToPathView)
      if Obj and Func then
        Func(Obj)
      end
    end
    return true
  end
end

function ForgePathController:HandleTipPreviewDetails(InKeyName)
  local IsSucceed = self.ItemDetails:OnGamePadDown(InKeyName)
  return IsSucceed
end

function ForgePathController:GetNavigateUpWidget(RowIndex, ColIndex)
  if 1 == RowIndex then
    return nil
  end
  local PrevRowInfo = self.PathModel.RowInfos[RowIndex - 1]
  local WidgetRow = RowIndex - 1
  local WidgetCol = math.min(#PrevRowInfo, ColIndex)
  return self.ItemMap[WidgetRow][WidgetCol]
end

function ForgePathController:GetNavigateDownWidget(RowIndex, ColIndex)
  if RowIndex >= MaxRowNum then
    return nil
  end
  local NextRowInfo = self.PathModel.RowInfos[RowIndex + 1]
  local WidgetRow = RowIndex + 1
  local WidgetCol = math.min(#NextRowInfo, ColIndex)
  return self.ItemMap[WidgetRow][WidgetCol]
end

function ForgePathController:ShowSelectedDraftDetails(ItemInfo)
  local ItemDetailParam = {}
  local DraftInfo = DataMgr.Draft[ItemInfo.DraftId]
  ItemDetailParam.ItemType = DraftInfo.ProductType
  ItemDetailParam.ItemId = DraftInfo.ProductId
  ItemDetailParam.bHideGamePad = true
  ItemDetailParam.HandleKeyDown = false
  self:RealShowForgeDetails(ItemDetailParam, ItemInfo.DraftId)
end

function ForgePathController:ShowSelectedResourceDetails(ItemInfo)
  local ItemDetailParam = {}
  ItemDetailParam.ItemId = ItemInfo.ResourceId
  ItemDetailParam.ItemType = ItemInfo.ResourceType
  ItemDetailParam.bHideGamePad = true
  ItemDetailParam.HandleKeyDown = false
  self:RealShowForgeDetails(ItemDetailParam, ItemInfo.DraftId)
end

function ForgePathController:RealShowForgeDetails(ItemDetailParam, DraftId)
  self.ItemDetails:RefreshItemInfo(ItemDetailParam, true)
  if not DraftId then
    self.ItemDetails.Forging:SetCantForge()
    self.ItemDetails.Draft:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.CurrentDraftId = nil
  else
    local DraftInfo = self.ForgeModel:CheckState(DraftId)
    if DraftInfo then
      self.ItemDetails.Forging:InitView(DraftInfo, self, self.OnDetailsViewBtnStartClicked, self.OnDetailsViewBtnCancelClicked)
      if DraftInfo.IsInfinity then
        self.ItemDetails.Text_DraftNum:SetText("<Img id=\"Infinity\" height=\"18\" width=\"36\"/>")
      else
        self.ItemDetails.Text_DraftNum:SetText(DraftInfo.Count)
      end
    else
      self.ItemDetails.Forging:SetDraftNotEnough()
      self.ItemDetails.Text_DraftNum:SetText("0")
    end
    self.ItemDetails.Draft:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.CurrentDraftId = DraftId
    DebugPrint("Tianyi@ CurrentDraftId = " .. DraftId)
  end
end

function ForgePathController:Refresh()
  for RowIndex, RowInfo in pairs(self.PathModel.RowInfos) do
    if RowIndex > 1 then
      for ColIndex, RowItem in ipairs(RowInfo) do
        self:RefreshSingleItemView(RowIndex, ColIndex, RowItem)
      end
    end
  end
  if not self.CurrentDraftId then
    DebugPrint("Tianyi@ Current DraftId is null")
    return
  end
  local DraftInfo = self.ForgeModel:CheckState(self.CurrentDraftId)
  local HeadNode = self.PathModel:GetNode(1, 1)
  if HeadNode.DraftId == self.CurrentDraftId and DraftInfo.State == ForgeConst.DraftState.InProgress then
    self:OnBtnCloseClicked()
    return
  end
  self:RefreshView(DraftInfo)
  self:RefreshDetails(DraftInfo)
end

function ForgePathController:RefreshDetails(DraftInfo)
  if not self.CurrentDraftId then
    DebugPrint("Tianyi@ Current DraftId is null")
    return
  end
  DraftInfo = DraftInfo or self.ForgeModel:CheckState(self.CurrentDraftId)
  if DraftInfo then
    self:TickRefreshView(DraftInfo)
  end
end

function ForgePathController:TickRefreshDetails(DraftInfo)
  if not self.CurrentDraftId then
    return
  end
  DraftInfo = DraftInfo or self.ForgeModel:CheckState(self.CurrentDraftId)
  if DraftInfo and DraftInfo.State == ForgeConst.DraftState.InProgress then
    self:TickRefreshView(DraftInfo)
  end
end

function ForgePathController:OnDetailsViewBtnStartClicked()
  DebugPrint("Tianyi@ OnBtnStartClicked")
  if not self.CurrentDraftId then
    DebugPrint("Tianyi@ CurrentDraftId is null")
    return
  end
  DebugPrint("Tianyi@ OnDetailsViewBtnStartClicked, Id = " .. self.CurrentDraftId)
  if self.OnDetailsViewBtnStartClickedCallback then
    local Obj, Func = table.unpack(self.OnDetailsViewBtnStartClickedCallback)
    if Obj and Func then
      Func(Obj, self.CurrentDraftId)
      return
    end
  end
end

function ForgePathController:OnDetailsViewBtnCancelClicked()
  DebugPrint("TianyI@ OnBtnCancelClicked")
  if not self.CurrentDraftId then
    DebugPrint("Tianyi@ CurrentDraftId is null")
    return
  end
  if self.OnDetailsViewBtnCancelClickedCallback then
    local Obj, Func = table.unpack(self.OnDetailsViewBtnCancelClickedCallback)
    if Obj and Func then
      Func(Obj, self.CurrentDraftId)
      return
    end
  end
end

function ForgePathController:ControllerOnItemSelected(RowIndex, ColIndex)
  self:OnDetailsViewBtnStartClicked()
end

function ForgePathController:OnItemSelected(RowIndex, ColIndex, bSelectedByGamepadClick)
  if bSelectedByGamepadClick then
    self:ControllerOnItemSelected(RowIndex, ColIndex)
    return
  end
  local ForgeNodeData = self.PathModel:GetNode(RowIndex, ColIndex)
  local CurRowSelectedIndex = self.PathModel.RowSelectedIndex[RowIndex]
  if not ForgeNodeData then
    DebugPrint("Tianyi@ Node data not found! ", RowIndex, ColIndex)
    return
  end
  if CurRowSelectedIndex == ColIndex and not self.PathModel.RowSelectedIndex[RowIndex + 1] then
    DebugPrint("Tianyi@ \229\183\178\231\187\143\233\128\137\228\184\173\228\186\134\232\191\153\228\184\170\232\138\130\231\130\185\228\186\134", RowIndex, ColIndex)
    return
  end
  if 1 == RowIndex then
    self:ShowSelectedDraftDetails(ForgeNodeData)
  else
    self:ShowSelectedResourceDetails(ForgeNodeData)
  end
  for i = RowIndex + 2, MaxRowNum do
    self.PathModel.RowInfos[i] = nil
    self.PathModel.RowSelectedIndex[i] = nil
    self:ClearRowView(i)
  end
  if self.IsInCompendiumMode then
    self:ClearItemCountWidget()
  end
  local ProductDraftId = ForgeNodeData.DraftId
  if ProductDraftId then
    local DraftInfo = DataMgr.Draft[ProductDraftId]
    if DraftInfo.Resource and #DraftInfo.Resource > 0 then
      if RowIndex == MaxRowNum then
        DebugPrint("Tianyi@ \229\189\147\229\137\141\233\147\184\233\128\160\233\147\190\230\157\161\233\149\191\229\186\166\229\164\167\228\186\1424,\231\156\139\231\156\139\230\156\137\228\187\128\228\185\136\233\151\174\233\162\152", RowIndex, ColIndex)
        return
      end
      local NextRowInfo = {}
      for Index, ResInfo in ipairs(DraftInfo.Resource) do
        local NewNode = self.PathModel:ConstructNodeFromResourceId(ResInfo, RowIndex + 1, Index)
        table.insert(NextRowInfo, NewNode)
      end
      self.PathModel.RowInfos[RowIndex + 1] = NextRowInfo
      self.PathModel.RowSelectedIndex[RowIndex + 1] = nil
    end
  else
    self.PathModel.RowInfos[RowIndex + 1] = {}
    self.PathModel.RowSelectedIndex[RowIndex + 1] = nil
  end
  if RowIndex + 1 <= MaxRowNum then
    self:UpdateRowItemsView(RowIndex + 1, self.PathModel.RowInfos[RowIndex + 1])
  end
  if RowIndex + 1 <= MaxRowNum and RowIndex + 1 > 1 then
    local NextLineItemNum = #self.PathModel.RowInfos[RowIndex + 1]
    if NextLineItemNum <= 0 then
      self:UpdateRowLinesView(RowIndex + 1, 0)
    else
      local RightmostPos = math.max(ForgeNodeData.Pos, self.PathModel.RowInfos[RowIndex + 1][NextLineItemNum].Pos)
      self:UpdateRowLinesView(RowIndex + 1, RightmostPos)
    end
  end
  if CurRowSelectedIndex then
    self:UnselectNode(RowIndex, CurRowSelectedIndex)
  end
  self:SelectNode(RowIndex, ColIndex)
end

function ForgePathController:UnselectNode(RowIndex, ColIndex)
  local LastSelectedRowNode = self.PathModel.RowInfos[RowIndex][ColIndex]
  self.PathModel.RowSelectedIndex[RowIndex] = nil
  self:UnSelectNodeView(RowIndex, LastSelectedRowNode.ColIndex)
end

function ForgePathController:SelectNode(RowIndex, ColIndex)
  self.PathModel.RowSelectedIndex[RowIndex] = ColIndex
  local HasNextRowItems = self.PathModel:GetRowNum(RowIndex + 1) > 0
  self:SelectNodeView(RowIndex, ColIndex, HasNextRowItems)
end

function ForgePathController:OnClose()
  self:CloseView()
end

function ForgePathController:SetCompendiumMode()
  self.IsInCompendiumMode = true
end

AssembleComponents(ForgePathController)
return ForgePathController
