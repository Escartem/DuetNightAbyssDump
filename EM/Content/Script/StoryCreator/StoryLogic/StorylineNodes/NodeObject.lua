local NodeObject = {}
setmetatable(NodeObject, {
  __call = function(NodeObjectClass, ...)
    local RealNodeObject = {}
    setmetatable(RealNodeObject, {
      __index = function(t, k)
        local v = NodeObjectClass[k]
        if v then
          rawset(t, k, v)
        end
        return v
      end,
      __newindex = function(t, k, v)
        rawset(t, k, v)
      end
    })
    local InitFunction = RealNodeObject.InitFunction or RealNodeObject.Init
    InitFunction(RealNodeObject, ...)
    return RealNodeObject
  end
})
return NodeObject
