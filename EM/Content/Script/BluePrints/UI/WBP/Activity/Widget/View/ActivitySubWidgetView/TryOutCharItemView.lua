require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(Info, ParentWidget)
  self.CurIndex = Info.Index
  self.ActivityId = Info.ActivityId
  self.CharId = Info.CharId
  self.SkinId = Info.SkinId
  self.ClickCallback = Info.ClickCallback
  self.ParentWidget = ParentWidget
  local IconPath
  if self.SkinId then
    IconPath = DataMgr.Skin[self.SkinId].Icon or "/Game/UI/Texture/Dynamic/Image/Head/Avatar/T_Head_Heitao"
  else
    IconPath = DataMgr.Char[self.CharId].Icon or "/Game/UI/Texture/Dynamic/Image/Head/Avatar/T_Head_Heitao"
  end
  if IconPath then
    local Image = LoadObject(IconPath)
    if Image then
      local DynamicMaterial = self.Image_Head:GetDynamicMaterial()
      DynamicMaterial:SetTextureParameterValue("IconMap", Image)
    end
  end
  self:SetIsSelected(Info.bIsSelected)
  self:SetIsPlayed(Info.bIsHavePlayed)
  ActivityReddotHelper.RemoveReddotListenByEventId(self.ActivityId, self)
  ActivityReddotHelper.AddReddotListenByEventId(self.ActivityId, {
    Obj = self,
    Func = function(self, Count)
      local NodeName = ActivityReddotHelper.GetEventMainNodeName(self.ActivityId)
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
      self:SetReddot(CacheDetail.Red and CacheDetail.Red > 0)
      self:SetReddotNew(CacheDetail.New and CacheDetail.New > 0)
    end
  })
  self.Btn_Click.OnCheckStateChanged:Clear()
  self.Btn_Click.OnCheckStateChanged:Add(self, self.OnBtnStateChange)
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHover)
  self.Btn_Click.OnUnHovered:Clear()
  self.Btn_Click.OnUnHovered:Add(self, self.OnBtnUnHover)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClick)
end

function M:OnBtnClick()
  if self.bIsSelected then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/sub_btn_click", nil, nil)
end

function M:SetReddotNew(bShow)
  if not bShow then
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:SetIsSelected(bIsSelected)
  self.bIsSelected = bIsSelected
  self.Btn_Click:SetChecked(bIsSelected)
  if bIsSelected then
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    ActivityReddotHelper.TrySubReddotCount(ActivityUtils, self.ActivityId, "New")
  else
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
    self:PlayAnimation(self.Normal)
  end
end

function M:SetIsPlayed(bIsHavePlayed)
  if bIsHavePlayed then
    self.Image_Check:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("34bc8dFF"))
  else
    self.Image_Check:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("676767FF"))
  end
end

function M:SetReddot(bShowRed)
  if bShowRed then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnBtnStateChange(IsChecked)
  if IsChecked and self.ClickCallback then
    self.ClickCallback(self.ParentWidget, self.ActivityId, self.CurIndex, self.CharId)
  end
end

function M:OnBtnHover()
  if self.bIsSelected then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnBtnUnHover()
  if self.bIsSelected then
    return
  end
  self:PlayAnimationForward(self.UnHover)
end

function M:Destruct()
  if self.ActivityId then
    ActivityReddotHelper.RemoveReddotListenByEventId(self.ActivityId, self)
  end
end

return M
