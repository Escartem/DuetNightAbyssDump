local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GameFlow", {
  AfterEntertainment = {
    Channel = "AfterEntertainment",
    GameFlow = "AfterEntertainment",
    Priority = 100
  },
  GetItemPage = {
    Channel = "GetItemPage",
    GameFlow = "GetItemPage",
    Priority = 100
  },
  GuideMain = {
    Channel = "GuideMain",
    GameFlow = "GuideMain",
    Priority = 100
  },
  ImmersiveStory = {
    Channel = "ImmersiveStory",
    GameFlow = "ImmersiveStory",
    Priority = 100
  },
  OpenSystemUI = {
    Channel = "OpenSystemUI",
    GameFlow = "OpenSystemUI",
    Priority = 100
  },
  SkillFeature = {
    Channel = "SkillFeature",
    GameFlow = "SkillFeature",
    Priority = 100
  },
  SystemGuideWithUI = {
    Channel = "SystemGuideWithUI",
    GameFlow = "SystemGuideWithUI",
    Priority = 100
  },
  SystemGuideWithoutUI = {
    Channel = "SystemGuideWithoutUI",
    GameFlow = "SystemGuideWithoutUI",
    Priority = 100
  }
})
