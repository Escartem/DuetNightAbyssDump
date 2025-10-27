local Component = {}

function Component:ExecuteFireDanmaku(Source, DanmakuId, Duration, BoneName)
  assert(IsValid(Source), "ExecuteFireDanmaku\228\188\160\229\133\165\231\154\132Source\228\184\141\230\152\175\230\156\137\230\149\136\231\154\132")
  Source:FireDanmaku(DanmakuId, Duration, BoneName, 0, false, FTransform())
end

function Component:GetDanmakuCreatureByName(DanmakuTemplate, CollisionCompName)
  return DanmakuTemplate:GetDanmakuCreatureByName(CollisionCompName)
end

function Component:IsDanmakuCreatureEid(Eid)
  return self.DanmakuCreatureMap and self.DanmakuCreatureMap[Eid] ~= nil
end

function Component:HideAllDanmaku(bHide)
  local AllDanmakus = self.DanmakuTemplates
  if AllDanmakus then
    for DanmakuTemplate, _ in pairs(AllDanmakus) do
      if IsValid(DanmakuTemplate) then
        DanmakuTemplate:SetActorHiddenInGame(bHide)
      end
    end
  end
end

return Component
