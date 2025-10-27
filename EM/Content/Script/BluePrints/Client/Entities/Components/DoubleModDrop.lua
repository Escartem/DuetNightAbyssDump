local Component = {}

function Component:SetDoubleModDropFirst()
  self.logger.info("SetDoubleModDropFirst")
  
  local function Cb(ErrCode, Ret)
    DebugPrint("SetDoubleModDropFirst", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode, Ret)
    end
  end
  
  self:CallServer("SetDoubleModDropFirst", Cb)
end

return Component
