local Component = {}

function Component:OpenWalnut()
  if self.bClientEntity then
    self:CallServerMethod("OpenWalnut")
  else
    self:ServerMulticast("OpenWalnut")
  end
end

function Component:OnSelectWalnut(AvatarEidStr, WalnutId)
  print(_G.LogTag, "OnSelectWalnut", AvatarEidStr, WalnutId)
  EventManager:FireEvent(EventID.OnSelectWalnut, AvatarEidStr, WalnutId)
end

function Component:OnSelectWalnutReward(AvatarEidStr)
  print(_G.LogTag, "OnSelectWalnutReward", AvatarEidStr)
  EventManager:FireEvent(EventID.OnSelectWalnutReward, AvatarEidStr)
end

function Component:SelectWalnutReward(Callback, WalnutIndex)
  if self.bClientEntity then
    local function cb(ret)
      if not ErrorCode:Check(ret) then
        return
      end
      if Callback then
        Callback(ret)
      end
    end
    
    self:CallServer("SelectWalnutReward", cb, WalnutIndex)
  else
    for i = 1, #Callback do
      local AvatarEid = CommonUtils.Str2ObjId(Callback[i])
      self:SendAvatar(AvatarEid, "ServerSelectWalnutReward", WalnutIndex)
    end
  end
end

return Component
