require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.TargetNodeKey = ""
  self.SourceGText = ""
  self.DiffGuideInfos = {}
end

function M:Construct()
  self.Super.Construct(self)
end

function M:Destruct()
  self.Super.Destruct(self)
end

function M:SetBranchInfo(InKey, InGText)
  self.TargetNodeKey = InKey
  self.SourceGText = InGText
end

function M:CheckIsEqualKey(InKey)
  return self.TargetNodeKey == InKey
end

function M:SetABCImg(Index)
  local Content = string.char(string.byte("A") + Index - 1)
  local RetPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. Content .. ".T_Gp_Digging_" .. Content
  UE4.UResourceLibrary.LoadObjectAsync(self, RetPath, {
    self,
    self.RealSetABCImg
  })
end

function M:RealSetABCImg(Object)
  self.Icon_Letter:SetBrushResourceObject(Object)
end

function M:SetOptional()
  self.WS_Type:SetActiveWidgetIndex(0)
end

return M
