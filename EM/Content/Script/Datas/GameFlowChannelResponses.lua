local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GameFlowChannelResponses", {
  AfterEntertainment = {
    AfterEntertainment = "Ignore",
    Channel = "AfterEntertainment",
    GetItemPage = "Ignore",
    GuideMain = "Block",
    ImmersiveStory = "Block",
    OpenSystemUI = "Ignore",
    SkillFeature = "Ignore",
    SystemGuideWithUI = "Block",
    SystemGuideWithoutUI = "Block"
  },
  GetItemPage = {
    AfterEntertainment = "Ignore",
    Channel = "GetItemPage",
    GetItemPage = "Block",
    GuideMain = "Block",
    ImmersiveStory = "Block",
    OpenSystemUI = "Ignore",
    SkillFeature = "Block",
    SystemGuideWithUI = "Block",
    SystemGuideWithoutUI = "Block"
  },
  GuideMain = {
    AfterEntertainment = "Block",
    Channel = "GuideMain",
    GetItemPage = "Block",
    GuideMain = "Ignore",
    ImmersiveStory = "Block",
    OpenSystemUI = "Ignore",
    SkillFeature = "Block",
    SystemGuideWithUI = "Ignore",
    SystemGuideWithoutUI = "Ignore"
  },
  ImmersiveStory = {
    AfterEntertainment = "Block",
    Channel = "ImmersiveStory",
    GetItemPage = "Block",
    GuideMain = "Block",
    ImmersiveStory = "Block",
    OpenSystemUI = "Block",
    SkillFeature = "Block",
    SystemGuideWithUI = "Ignore",
    SystemGuideWithoutUI = "Block"
  },
  OpenSystemUI = {
    AfterEntertainment = "Ignore",
    Channel = "OpenSystemUI",
    GetItemPage = "Ignore",
    GuideMain = "Ignore",
    ImmersiveStory = "Block",
    OpenSystemUI = "Ignore",
    SkillFeature = "Ignore",
    SystemGuideWithUI = "Ignore",
    SystemGuideWithoutUI = "Ignore"
  },
  SkillFeature = {
    AfterEntertainment = "Ignore",
    Channel = "SkillFeature",
    GetItemPage = "Block",
    GuideMain = "Block",
    ImmersiveStory = "Block",
    OpenSystemUI = "Ignore",
    SkillFeature = "Block",
    SystemGuideWithUI = "Block",
    SystemGuideWithoutUI = "Block"
  },
  SystemGuideWithUI = {
    AfterEntertainment = "Block",
    Channel = "SystemGuideWithUI",
    GetItemPage = "Block",
    GuideMain = "Ignore",
    ImmersiveStory = "Ignore",
    OpenSystemUI = "Ignore",
    SkillFeature = "Block",
    SystemGuideWithUI = "Block",
    SystemGuideWithoutUI = "Block"
  },
  SystemGuideWithoutUI = {
    AfterEntertainment = "Block",
    Channel = "SystemGuideWithoutUI",
    GetItemPage = "Block",
    GuideMain = "Ignore",
    ImmersiveStory = "Block",
    OpenSystemUI = "Block",
    SkillFeature = "Block",
    SystemGuideWithUI = "Block",
    SystemGuideWithoutUI = "Block"
  }
})
