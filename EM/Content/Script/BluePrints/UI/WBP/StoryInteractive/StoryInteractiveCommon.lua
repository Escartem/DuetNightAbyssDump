local MiscUtils = require("Utils.MiscUtils")
local M = {}
M.Scroll_Mouse = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_MouseScroll.T_Key_MouseScroll")
M.Scroll_Xbox = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_LV.T_Key_LV")
M.Scroll_PS = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PS5/T_Key_LV.T_Key_LV")
M.TextMap_Btn_Close = "UI_CTL_Quit"
M.TextMap_Gossip = "UI_TextMap_Talk_levelTwo"
return M
