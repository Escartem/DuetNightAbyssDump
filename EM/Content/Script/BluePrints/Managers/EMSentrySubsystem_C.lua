require("UnLua")
local M = Class()
local TAG_EVENT_SOURCE = "event.source"
local TAG_EVENT_SOURCE_LUA = "lua"
local TAG_UID = "em.uid"
local TAG_LAST_UID = "em.last_uid"
local TAG_SCENE_ID = "em.scene_id"
local TAG_SCENE_NAME = "em.scene_name"
local TAG_PLAYER_LOCATION = "em.player_location"
local TAG_CHANNEL_ID = "em.channel_id"
local TAG_PAK_BRANCH = "em.pak_branch"

function M:InitChannelTag()
  local IsGlobalPak = UE.AHotUpdateGameMode.IsGlobalPak()
  self:SetTag(TAG_PAK_BRANCH, IsGlobalPak and "global" or "china")
  local ChannelId = Utils.HeroUSDKSubsystem():GetChannelId()
  self:SetTag(TAG_CHANNEL_ID, tostring(ChannelId))
end

function M:TryInitChannelTagOnce(IsInit)
  if not self.IsInitChannelTag then
    self:InitChannelTag()
    self.IsInitChannelTag = IsInit
  end
end

function M:BindDelegates()
  self:TryInitChannelTagOnce(false)
end

function M:OnLoginSuccess()
  self:TryInitChannelTagOnce(true)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self:SetTag(TAG_UID, tostring(Avatar.Uid))
    self.LastUid = Avatar.Uid
  end
end

function M:Logout()
  if self.LastUid then
    self:RemoveTag(TAG_UID)
    self:SetTag(TAG_LAST_UID, tostring(self.LastUid))
    self.LastUid = nil
  end
end

function M:ReportLuaTrace(ErrorMsg, Params)
  local TagMap = UE.TMap("", "")
  TagMap:Add(TAG_EVENT_SOURCE, TAG_EVENT_SOURCE_LUA)
  TagMap:Add(TAG_SCENE_ID, Params.SceneId)
  TagMap:Add(TAG_SCENE_NAME, Params.SceneName)
  TagMap:Add(TAG_PLAYER_LOCATION, Params.Location)
  self:ReportEventTrace(ErrorMsg, TagMap)
end

return M
