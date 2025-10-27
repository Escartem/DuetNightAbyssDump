require("DataMgr")
local Component = {}

function Component:PrintBuff(Target)
  local Buffs = Target.BuffManager.Buffs
  local t = {
    Target = {Target},
    BuffNum = Buffs:Length()
  }
  if Buffs:Length() > 0 then
    for i = 1, Buffs:Length() do
      local Buff = Buffs:GetRef(i)
      t[i] = {
        BuffId = Buff.BuffId,
        SourceEid = Buff.SourceEid,
        StartTime = Buff.StartTime,
        Value = Buff.Value,
        Layer = Buff.Layer,
        LeftTime = Buff.LeftTime
      }
      local Layers = Buff:GetFreeLayers()
      local LayerNum = Layers:Num()
      t[i].NewFreeLayerNum = LayerNum
      t[i].NewFreeLayers = {}
      for j = 1, LayerNum do
        local NewFreeLayer = Layers:GetRef(j)
        table.insert(t[i].NewFreeLayers, {
          StartTime = NewFreeLayer.StartTime,
          LastTime = NewFreeLayer.LastTime,
          Value = NewFreeLayer.Value,
          SourceEid = NewFreeLayer.SourceEid
        })
      end
    end
  end
  PrintTable(t, 5)
end

return Component
