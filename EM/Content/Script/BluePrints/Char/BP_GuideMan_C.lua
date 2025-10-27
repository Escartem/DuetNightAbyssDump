local BP_GuideMan_C = Class("BluePrints.Char.BP_NPC_C")

function BP_GuideMan_C:InitCharacterInfo(Info)
  BP_GuideMan_C.Super.InitCharacterInfo(self, Info)
  if Info.LoadFinishCallback then
    Info.LoadFinishCallback(self)
  end
end

return BP_GuideMan_C
