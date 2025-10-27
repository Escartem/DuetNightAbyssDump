require("UnLua")
local WBP_CommonGetWay_C = Class()

function WBP_CommonGetWay_C:Initialize(Initializer)
  self.AllGetWay = {}
end

function WBP_CommonGetWay_C:ClickToGetWay()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  UIManger:LoadUI(UIConst.COMMONSCREENTOAST, "CommonScreenToast", UIConst.ZORDER_FOR_COMMON_TIP, "\233\128\148\229\190\132\229\190\133\229\188\128\233\128\154", 1.0)
end

return WBP_CommonGetWay_C
