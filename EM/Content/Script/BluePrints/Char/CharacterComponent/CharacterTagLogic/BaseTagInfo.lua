local BaseInfo = {
  ForbidTags = {},
  StateLimitInfo = {}
}
BaseInfo.__index = BaseInfo

function BaseInfo.OnEnterTag(Owner)
end

function BaseInfo.OnLeaveTag(Owner)
end

function BaseInfo.CanLeaveTag(Owner)
  return true
end

return BaseInfo
