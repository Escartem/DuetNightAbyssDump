return function(mainTable, ...)
  for _, file in ipairs({
    ...
  }) do
    local moduleFunctions, err = require(file)
    if moduleFunctions then
      for key, value in pairs(moduleFunctions) do
        if mainTable[key] and type(mainTable[key]) ~= "function" then
          error("Warning: Member " .. key .. " in file " .. file .. " is not a function.")
        end
        if not mainTable[key] then
          mainTable[key] = value
        elseif type(mainTable[key]) == "function" then
          if not mainTable["__" .. key] then
            print(_G.LogTag, "[merge] function ", key)
            mainTable["__" .. key] = {
              mainTable[key]
            }
            mainTable[key] = function(...)
              print(_G.LogTag, "call [merge] function ", key)
              for _, v in ipairs(mainTable["__" .. key]) do
                v(...)
              end
            end
          end
          table.insert(mainTable["__" .. key], value)
        end
      end
    else
      error("Error loading module from file ", file, err)
    end
  end
end
