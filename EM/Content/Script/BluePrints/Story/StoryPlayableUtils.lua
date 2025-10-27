local StoryPlayableUtils = {}

function StoryPlayableUtils:ExecuteStoryDelegate(StoryDelegate, ...)
  if StoryDelegate then
    if StoryDelegate.Execute then
      StoryDelegate:Execute(...)
    elseif StoryDelegate[1] and StoryDelegate[2] then
      StoryDelegate[2](StoryDelegate[1], ...)
    end
  end
end

return {StoryPlayableUtils = StoryPlayableUtils}
