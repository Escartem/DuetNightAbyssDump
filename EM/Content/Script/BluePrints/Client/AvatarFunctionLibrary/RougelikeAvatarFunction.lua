local M = {}

function M:RougeLikeTryRecover(Character, Handler)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:RougeLikeTryRecover(function(bCanRecover, RecoverInfo)
      DebugPrint("RougeLikeTryRecover callback was called")
      if Handler then
        Handler.OnTryRougeRecovery:Execute(bCanRecover, Character)
      end
    end)
  end
  return false
end

return M
