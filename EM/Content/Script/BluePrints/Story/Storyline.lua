local Class = require("StoryCreator.StoryFramework.Class")
local json = require("json")
local M = {}
local WrappedStoryline = Class.Class("Storyline")
M.Storyline = WrappedStoryline

function WrappedStoryline:__init__(StoryInst, FileName, ShortName)
  self.Ins = StoryInst
  self.ShortName = ShortName
  if FileName then
    local function ToSubFilePath(Str)
      Str = string.gsub(Str, "[/\\]", ".")
      
      if string.sub(Str, -6) == ".story" then
        Str = string.sub(Str, 1, string.len(Str) - 6)
      end
      return Str
    end
    
    local res = require("StoryCreator.StoryFiles." .. ToSubFilePath(FileName))
    self:LoadFromDict(res)
  end
end

function WrappedStoryline:GetStoryItem()
  return self.Ins
end

function WrappedStoryline:LoadFromDict(Data)
  self.Ins:LoadFromDict(Data)
end

function WrappedStoryline:Run(EndCallback)
  self.Ins.GraphBuffer = {}
  self.EndCallback = EndCallback
  
  local function Callback(Inst, Output, GraphNodeFailed)
    self:OnEnd()
  end
  
  self.Ins:Run(Callback, self.OnException)
end

function WrappedStoryline:OnEnd()
  self:Destroy()
  local _ = type(self.EndCallback) == "function" and self.EndCallback()
  self.EndCallback = nil
end

function WrappedStoryline:OnException()
  self:Destroy()
  local _ = type(self.EndCallback) == "function" and self.EndCallback()
  self.EndCallback = nil
end

function WrappedStoryline:Destroy()
  self.Ins:Destroy()
  self.Ins = nil
end

return M
