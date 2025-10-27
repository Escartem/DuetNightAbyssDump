require("UnLua")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local StringUtils = require("Utils.StringUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  if not GWorld.NetworkMgr:CheckIsConnected(true) then
    return
  end
  self.Content = Content
  self.Content.UI = self
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:Open(Content.MsgWrap, Content.bSound)
end

function M:BP_OnEntryReleased()
  self:ResetTranslation()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Content.UI = nil
end

function M:Open(MsgWrap, bSound)
  local Spacker, RawSpacker = ChatController:ParseSpeakerHeader(MsgWrap)
  local Content = ChatController:ParseEmojiToText(MsgWrap)
  Content = ChatController:ParseModSuitText(MsgWrap)
  Content = ChatController:ParseDyePlanText(MsgWrap)
  local RawContent = RawSpacker .. Content
  local RawContentTable = StringUtils.Utf8ToTable(RawContent)
  local HalfLength = #RawContentTable
  local LeftHalf, RightHalf = nil, RawContentTable
  self.SizeBox_Dialog:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_DialogSingle:SetVisibility(UIConst.VisibilityOp.Visible)
  self:SetRenderOpacity(0)
  local Padding = UWidgetLayoutLibrary.SlotAsOverlaySlot(self.SizeBox_Dialog).Padding
  local TargetLineWidth = self.SizeBox_Root.WidthOverride - Padding.Left - Padding.Right
  self.Text_DialogSingle:SetText(RawContent)
  local _, Key = self:AddTimer(0.01, function()
    self.Text_DialogSingle:ForceLayoutPrepass()
    local NowLineWidth = self.Text_DialogSingle:GetDesiredSize().X
    HalfLength = math.floor(#RightHalf / 2)
    if 0 == HalfLength then
      local Splited = StringUtils.Utf8ToTable(table.concat(RawContent:split(ChatCommon.Spliter), "", 2))
      if NowLineWidth > TargetLineWidth then
        Splited = table.slice(Splited, 1, #Splited - 1)
      end
      local InsertPos = string.len(table.concat(Splited))
      Content = Content:insert(InsertPos, "\n")
      self.Text_DialogSingle:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if not self.Text_Dialog.DefaultTextStyleOverride.OverflowPolicy then
        local SpackerRawTable = StringUtils.Utf8ToTable(RawSpacker)
        local ContentRawTable = StringUtils.Utf8ToTable(Content)
        if #SpackerRawTable + #ContentRawTable > self.MaxTextCount then
          Content = table.concat(ContentRawTable, "", 1, self.MaxTextCount - #SpackerRawTable) .. "..."
        end
      else
        self.Text_Dialog.bOverrideAccessibleDefaults = true
        self.Text_Dialog.DefaultTextStyleOverride.OverflowPolicy = ETextOverflowPolicy.Ellipsis
        self.Text_Dialog:SetDefaultTextStyle(self.Text_Dialog.DefaultTextStyleOverride)
      end
      self.Text_Dialog:SetText(Spacker .. Content)
      self:RemoveTicker()
      return
    end
    if NowLineWidth > TargetLineWidth then
      LeftHalf = table.slice(RawContentTable, 1, #RawContentTable - HalfLength)
      RightHalf = table.slice(RawContentTable, #RawContentTable - HalfLength + 1)
      RawContentTable = LeftHalf
    elseif NowLineWidth < TargetLineWidth and HalfLength > 0 then
      if not RightHalf or not LeftHalf then
        self.SizeBox_Dialog:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self.Text_DialogSingle:SetText(Spacker .. Content)
        self:RemoveTicker()
        return
      else
        for i, Val in ipairs(table.slice(RightHalf, 1, HalfLength)) do
          table.insert(LeftHalf, Val)
        end
        RightHalf = table.slice(RightHalf, HalfLength + 1)
        RawContentTable = LeftHalf
      end
    end
    RawContent = table.concat(RawContentTable)
    self.Text_DialogSingle:SetText(RawContent)
  end, true, 0, nil, true)
  self._TickForTextSize = Key
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  local _, Key = self:AddTimer(self.AutoCloseCd, self.Close, false, 0, nil, true)
  self._TimerForAutoClose = Key
  if bSound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/team_simple_msg_show", nil, nil)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
end

function M:ResetTranslation()
  self.RenderSizeCache = nil
  self.TranslateCache.Y = 0
  self:SetRenderTranslation(self.TranslateCache)
end

function M:DoMove(ProgressTime)
  local Curve = ChatController:GetModel().SimpleChatOutAnimCurve
  if not Curve then
    return
  end
  if not self.RenderSizeCache then
    self.RenderSizeCache = UIManager(self):GetWidgetRenderSize(self)
  end
  local MovePos = self.RenderSizeCache.Y * Curve:GetFloatValue(ProgressTime)
  self.TranslateCache.Y = -MovePos
  self:SetRenderTranslation(self.TranslateCache)
end

function M:Close()
  self:RemoveTicker()
  self:RemoveCloseTimer()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
  local BattleUI = UIManager(self):GetUIObj("BattleMain")
  if BattleUI then
    BattleUI:OnSimpleChatClose(self)
  end
end

function M:RemoveTicker()
  if not self:IsExistTimer(self._TickForTextSize) then
    return
  end
  self:RemoveTimer(self._TickForTextSize, true)
  self:SetRenderOpacity(1)
  self._TickForTextSize = nil
end

function M:RemoveCloseTimer()
  if not self:IsExistTimer(self._TimerForAutoClose) then
    return
  end
  self:RemoveTimer(self._TimerForAutoClose, true)
  self._TimerForAutoClose = nil
end

function M:Construct()
  self._TickForTextSize = nil
  self._TimerForAutoClose = nil
  self.TranslateCache = FVector2D(0, 0)
end

function M:Destruct()
  self:StopAllAnimations()
  self:RemoveTicker()
  self:RemoveCloseTimer()
  self:ResetTranslation()
end

return M
