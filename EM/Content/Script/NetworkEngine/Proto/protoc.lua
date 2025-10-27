local string = _ENV.string
local tonumber = _ENV.tonumber
local setmetatable = _ENV.setmetatable
local error = _ENV.error
local ipairs = _ENV.ipairs
local io = _ENV.io
local table = _ENV.table
local math = _ENV.math
local assert = _ENV.assert
local tostring = _ENV.tostring
local type = _ENV.type
local insert_tab = table.insert
local str_gmatch = string.gmatch

local function meta(name, t)
  t = t or {}
  t.__name = name
  t.__index = t
  return t
end

local function default(t, k, def)
  local v = t[k]
  if not v then
    v = def or {}
    t[k] = v
  end
  return v
end

local Lexer = meta("Lexer")
do
  local escape = {
    a = "\a",
    b = "\b",
    f = "\f",
    n = "\n",
    r = "\r",
    t = "\t",
    v = "\v"
  }
  
  local function tohex(x)
    return string.byte(tonumber(x, 16))
  end
  
  local function todec(x)
    return string.byte(tonumber(x, 10))
  end
  
  local function toesc(x)
    return escape[x] or x
  end
  
  function Lexer.new(name, src)
    local self = {
      name = name,
      src = src,
      pos = 1
    }
    return setmetatable(self, Lexer)
  end
  
  function Lexer:__call(patt, pos)
    return self.src:match(patt, pos or self.pos)
  end
  
  function Lexer:test(patt)
    self:whitespace()
    local pos = self("^" .. patt .. "%s*()")
    if not pos then
      return false
    end
    self.pos = pos
    return true
  end
  
  function Lexer:expected(patt, name)
    if not self:test(patt) then
      return self:error((name or "'" .. patt .. "'") .. " expected")
    end
    return self
  end
  
  function Lexer:pos2loc(pos)
    local linenr = 1
    pos = pos or self.pos
    for start, stop in self.src:gmatch([[
()[^
]*()
?]]) do
      if start <= pos and stop >= pos then
        return linenr, pos - start + 1
      end
      linenr = linenr + 1
    end
  end
  
  function Lexer:error(fmt, ...)
    local ln, co = self:pos2loc()
    return error(("%s:%d:%d: " .. fmt):format(self.name, ln, co, ...))
  end
  
  function Lexer:opterror(opt, msg)
    if not opt then
      return self:error(msg)
    end
    return nil
  end
  
  function Lexer:whitespace()
    local pos, c = self("^%s*()(%/?)")
    self.pos = pos
    if "" == c then
      return self
    end
    return self:comment()
  end
  
  function Lexer:comment()
    local pos = self([[
^%/%/[^
]*
?()]])
    if not pos and self("^%/%*") then
      pos = self("^%/%*.-%*%/()")
      if not pos then
        self:error("unfinished comment")
      end
    end
    if not pos then
      return self
    end
    self.pos = pos
    return self:whitespace()
  end
  
  function Lexer:line_end(opt)
    self:whitespace()
    local pos = self("^[%s;]*%s*()")
    if not pos then
      return self:opterror(opt, "';' expected")
    end
    self.pos = pos
    return pos
  end
  
  function Lexer:eof()
    self:whitespace()
    return self.pos > #self.src
  end
  
  function Lexer:keyword(kw, opt)
    self:whitespace()
    local ident, pos = self("^([%a_][%w_]*)%s*()")
    if not ident or ident ~= kw then
      return self:opterror(opt, "''" .. kw .. "\" expected")
    end
    self.pos = pos
    return kw
  end
  
  function Lexer:ident(name, opt)
    self:whitespace()
    local b, ident, pos = self("^()([%a_][%w_]*)%s*()")
    if not ident then
      return self:opterror(opt, (name or "name") .. " expected")
    end
    self.pos = pos
    return ident, b
  end
  
  function Lexer:full_ident(name, opt)
    self:whitespace()
    local b, ident, pos = self("^()([%a_.][%w_.]*)%s*()")
    if not ident or ident:match("%.%.+") then
      return self:opterror(opt, (name or "name") .. " expected")
    end
    self.pos = pos
    return ident, b
  end
  
  function Lexer:integer(opt)
    self:whitespace()
    local ns, oct, hex, s, pos = self("^([+-]?)(0?)([xX]?)([0-9a-fA-F]+)%s*()")
    local n
    if "0" == oct and "" == hex then
      n = tonumber(s, 8)
    elseif "" == oct and "" == hex then
      n = tonumber(s, 10)
    elseif "0" == oct and "" ~= hex then
      n = tonumber(s, 16)
    end
    if not n then
      return self:opterror(opt, "integer expected")
    end
    self.pos = pos
    return "-" == ns and -n or n
  end
  
  function Lexer:number(opt)
    self:whitespace()
    if self:test("nan%f[%A]") then
      return 0.0 / 0.0
    elseif self:test("inf%f[%A]") then
      return 1.0 / 0.0
    end
    local ns, d1, s, d2, s2, pos = self("^([+-]?)(%.?)([0-9]+)(%.?)([0-9]*)()")
    if not ns then
      return self:opterror(opt, "floating-point number expected")
    end
    local es, pos2 = self("(^[eE][+-]?[0-9]+)%s*()", pos)
    if "." == d1 and "." == d2 then
      return self:error("malformed floating-point number")
    end
    self.pos = pos2 or pos
    local n = tonumber(d1 .. s .. d2 .. s2 .. (es or ""))
    return "-" == ns and -n or n
  end
  
  function Lexer:quote(opt)
    self:whitespace()
    local q, start = self("^([\"'])()")
    if not start then
      return self:opterror(opt, "string expected")
    end
    self.pos = start
    local patt = "()(\\?" .. q .. ")%s*()"
    while true do
      local stop, s, pos = self(patt)
      if not stop then
        self.pos = start - 1
        return self:error("unfinished string")
      end
      self.pos = pos
      if s == q then
        return self.src:sub(start, stop - 1):gsub("\\x(%x+)", tohex):gsub("\\(%d+)", todec):gsub("\\(.)", toesc)
      end
    end
  end
  
  function Lexer:structure(opt)
    self:whitespace()
    if not self:test("{") then
      return self:opterror(opt, "opening curly brace expected")
    end
    local t = {}
    while not self:test("}") do
      local pos, name, npos = self("^%s*()(%b[])()")
      if not pos then
        name = self:full_ident("field name")
      else
        self.pos = npos
      end
      self:test(":")
      local value = self:constant()
      self:test(",")
      self:line_end("opt")
      t[name] = value
    end
    return t
  end
  
  function Lexer:array(opt)
    self:whitespace()
    if not self:test("%[") then
      return self:opterror(opt, "opening square bracket expected")
    end
    local t = {}
    while not self:test("]") do
      local value = self:constant()
      self:test(",")
      t[#t + 1] = value
    end
    return t
  end
  
  function Lexer:constant(opt)
    local c = self:full_ident("constant", "opt")
    if "true" == c then
      return true
    end
    if "false" == c then
      return false
    end
    if "none" == c then
      return nil
    end
    if c then
      return c
    end
    c = self:number("opt") or self:quote("opt") or self:structure("opt") or self:array("opt")
    if nil == c and not opt then
      return self:error("constant expected")
    end
    return c
  end
  
  function Lexer:option_name()
    local ident
    if self:test("%(") then
      ident = self:full_ident("option name")
      self:expected("%)")
    else
      ident = self:ident("option name")
    end
    while self:test("%.") do
      ident = ident .. "." .. self:ident()
    end
    return ident
  end
  
  function Lexer:type_name()
    if self:test("%.") then
      local id, pos = self:full_ident("type name")
      return "." .. id, pos
    else
      return self:full_ident("type name")
    end
  end
end
local Parser = meta("Parser")
Parser.typemap = {}
Parser.loaded = {}
Parser.paths = {"", "."}

function Parser.new()
  local self = {}
  self.typemap = {}
  self.loaded = {}
  self.paths = {"", "."}
  return setmetatable(self, Parser)
end

function Parser:reset()
  self.typemap = {}
  self.loaded = {}
  return self
end

function Parser:error(msg)
  return self.lex:error(msg)
end

function Parser:addpath(path)
  insert_tab(self.paths, path)
end

function Parser:parsefile(name)
  local info = self.loaded[name]
  if info then
    return info
  end
  local errors = {}
  for _, path in ipairs(self.paths) do
    local fn = "" ~= path and path .. "/" .. name or name
    local fh, err = io.open(fn)
    if fh then
      local content = fh:read("*a")
      info = self:parse(content, name)
      fh:close()
      return info
    end
    insert_tab(errors, err or fn .. ": " .. "unknown error")
  end
  local import_fallback = self.unknown_import
  if true == import_fallback then
    info = import_fallback
  elseif import_fallback then
    info = import_fallback(self, name)
  end
  if not info then
    error("module load error: " .. name .. [[

	]] .. table.concat(errors, [[

	]]))
  end
  return info
end

do
  local labels = {
    optional = 1,
    required = 2,
    repeated = 3
  }
  local key_types = {
    int32 = 5,
    int64 = 3,
    uint32 = 13,
    uint64 = 4,
    sint32 = 17,
    sint64 = 18,
    fixed32 = 7,
    fixed64 = 6,
    sfixed32 = 15,
    sfixed64 = 16,
    bool = 8,
    string = 9
  }
  local com_types = {
    group = 10,
    message = 11,
    enum = 14
  }
  local types = {
    double = 1,
    float = 2,
    int32 = 5,
    int64 = 3,
    uint32 = 13,
    uint64 = 4,
    sint32 = 17,
    sint64 = 18,
    fixed32 = 7,
    fixed64 = 6,
    sfixed32 = 15,
    sfixed64 = 16,
    bool = 8,
    string = 9,
    bytes = 12,
    group = 10,
    message = 11,
    enum = 14
  }
  
  local function register_type(self, lex, tname, typ)
    if not tname:match("%.") then
      tname = self.prefix .. tname
    end
    if self.typemap[tname] then
      return lex:error("type %s already defined", tname)
    end
    self.typemap[tname] = typ
  end
  
  local function type_info(lex, tname)
    local tenum = types[tname]
    if com_types[tname] then
      return lex:error("invalid type name: " .. tname)
    elseif tenum then
      tname = nil
    end
    return tenum, tname
  end
  
  local function map_info(lex)
    local keyt = lex:ident("key type")
    if not key_types[keyt] then
      return lex:error("invalid key type: " .. keyt)
    end
    local valt = lex:expected(","):type_name()
    local name = lex:expected(">"):ident()
    local ident = name:gsub("^%a", string.upper):gsub("_(%a)", string.upper) .. "Entry"
    local kt, ktn = type_info(lex, keyt)
    local vt, vtn = type_info(lex, valt)
    return name, types.message, ident, {
      name = ident,
      field = {
        {
          name = "key",
          number = 1,
          label = labels.optional,
          type = kt,
          type_name = ktn
        },
        {
          name = "value",
          number = 2,
          label = labels.optional,
          type = vt,
          type_name = vtn
        }
      },
      options = {map_entry = true}
    }
  end
  
  local function inline_option(lex, info)
    if lex:test("%[") then
      info = info or {}
      while true do
        local name = lex:option_name()
        local value = lex:expected("="):constant()
        info[name] = value
        if lex:test("%]") then
          return info
        end
        lex:expected(",")
      end
    end
  end
  
  local function field(self, lex, ident)
    local name, typ, type_name, map_entry
    if "map" == ident and lex:test("%<") then
      name, typ, type_name, map_entry = map_info(lex)
      self.locmap[map_entry.field[1]] = lex.pos
      self.locmap[map_entry.field[2]] = lex.pos
      register_type(self, lex, type_name, types.message)
    else
      typ, type_name = type_info(lex, ident)
      name = lex:ident()
    end
    local info = {
      name = name,
      number = lex:expected("="):integer(),
      label = "map" == ident and labels.repeated or labels.optional,
      type = typ,
      type_name = type_name
    }
    local options = inline_option(lex)
    if options then
      info.default_value, options.default = tostring(options.default), nil
      info.json_name, options.json_name = options.json_name, nil
      info.options = options
    end
    if info.number <= 0 then
      lex:error("invalid tag number: " .. info.number)
    end
    return info, map_entry
  end
  
  local function label_field(self, lex, ident, parent)
    local label = labels[ident]
    local info, map_entry
    if not label then
      if self.syntax == "proto2" and "map" ~= ident then
        return lex:error("proto2 disallow missing label")
      end
      return field(self, lex, ident)
    end
    local proto3_optional = label == labels.optional and self.syntax == "proto3"
    if proto3_optional and (not self.proto3_optional or not parent) then
      return lex:error("proto3 disallow 'optional' label")
    end
    info, map_entry = field(self, lex, lex:type_name())
    if proto3_optional then
      local ot = default(parent, "oneof_decl")
      info.oneof_index = #ot
      ot[#ot + 1] = {
        name = "_" .. info.name
      }
    else
      info.label = label
    end
    return info, map_entry
  end
  
  local toplevel = {}
  
  function toplevel:package(lex, info)
    local package = lex:full_ident("package name")
    lex:line_end()
    info.package = package
    self.prefix = "." .. package .. "."
    return self
  end
  
  function toplevel:import(lex, info)
    local mode = lex:ident("\"weak\" or \"public\"", "opt") or "public"
    if "weak" ~= mode and "public" ~= mode then
      return lex:error("\"weak or \"public\" expected")
    end
    local name = lex:quote()
    lex:line_end()
    local result = self:parsefile(name)
    if self.on_import then
      self.on_import(result)
    end
    local dep = default(info, "dependency")
    local index = #dep
    dep[index + 1] = name
    if "public" == mode then
      local it = default(info, "public_dependency")
      insert_tab(it, index)
    else
      local it = default(info, "weak_dependency")
      insert_tab(it, index)
    end
  end
  
  do
    local msgbody = {}
    
    function msgbody:message(lex, info)
      local nested_type = default(info, "nested_type")
      insert_tab(nested_type, toplevel.message(self, lex))
      return self
    end
    
    function msgbody:enum(lex, info)
      local nested_type = default(info, "enum_type")
      insert_tab(nested_type, toplevel.enum(self, lex))
      return self
    end
    
    function msgbody:extend(lex, info)
      local extension = default(info, "extension")
      local nested_type = default(info, "nested_type")
      local ft, mt = toplevel.extend(self, lex, {})
      for _, v in ipairs(ft) do
        insert_tab(extension, v)
      end
      for _, v in ipairs(mt) do
        insert_tab(nested_type, v)
      end
      return self
    end
    
    function msgbody:extensions(lex, info)
      local rt = default(info, "extension_range")
      local idx = #rt
      repeat
        local start = lex:integer("field number range")
        local stop = math.floor(5.36870912E8)
        if lex:keyword("to", "opt") then
          if not lex:keyword("max", "opt") then
            stop = lex:integer("field number range end or 'max'")
          end
          insert_tab(rt, {
            start = start,
            ["end"] = stop
          })
        else
          insert_tab(rt, {
            start = start,
            ["end"] = start
          })
        end
      until not lex:test(",")
      rt[idx + 1].options = inline_option(lex)
      lex:line_end()
      return self
    end
    
    function msgbody:reserved(lex, info)
      lex:whitespace()
      if not lex("^%d") then
        local rt = default(info, "reserved_name")
        repeat
          insert_tab(rt, (lex:quote()))
        until not lex:test(",")
      else
        local rt = default(info, "reserved_range")
        local first = true
        repeat
          local start = lex:integer(first and "field name or number range" or "field number range")
          if lex:keyword("to", "opt") then
            if lex:keyword("max", "opt") then
              insert_tab(rt, {
                start = start,
                ["end"] = 5.36870911E8
              })
            else
              local stop = lex:integer("field number range end")
              insert_tab(rt, {
                start = start,
                ["end"] = stop
              })
            end
          else
            insert_tab(rt, {
              start = start,
              ["end"] = start
            })
          end
          first = false
        until not lex:test(",")
      end
      lex:line_end()
      return self
    end
    
    function msgbody:oneof(lex, info)
      local fs = default(info, "field")
      local ts = default(info, "nested_type")
      local ot = default(info, "oneof_decl")
      local index = #ot + 1
      local oneof = {
        name = lex:ident()
      }
      lex:expected("{")
      while not lex:test("}") do
        local ident = lex:type_name()
        if "option" == ident then
          toplevel.option(self, lex, oneof)
        else
          local f, t = field(self, lex, ident)
          self.locmap[f] = lex.pos
          if t then
            insert_tab(ts, t)
          end
          f.oneof_index = index - 1
          insert_tab(fs, f)
        end
        lex:line_end("opt")
      end
      ot[index] = oneof
    end
    
    function msgbody:option(lex, info)
      toplevel.option(self, lex, info)
    end
    
    function toplevel:message(lex, info)
      local name = lex:ident("message name")
      local typ = {name = name}
      register_type(self, lex, name, types.message)
      local prefix = self.prefix
      self.prefix = prefix .. name .. "."
      lex:expected("{")
      while not lex:test("}") do
        local ident, pos = lex:type_name()
        local body_parser = msgbody[ident]
        if body_parser then
          body_parser(self, lex, typ)
        else
          local fs = default(typ, "field")
          local f, t = label_field(self, lex, ident, typ)
          self.locmap[f] = pos
          insert_tab(fs, f)
          if t then
            local ts = default(typ, "nested_type")
            insert_tab(ts, t)
          end
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "message_type")
        insert_tab(info, typ)
      end
      self.prefix = prefix
      return typ
    end
    
    function toplevel:enum(lex, info)
      local name, pos = lex:ident("enum name")
      local enum = {name = name}
      self.locmap[enum] = pos
      register_type(self, lex, name, types.enum)
      lex:expected("{")
      while not lex:test("}") do
        local ident, pos = lex:ident("enum constant name")
        if "option" == ident then
          toplevel.option(self, lex, enum)
        elseif "reserved" == ident then
          msgbody.reserved(self, lex, enum)
        else
          local values = default(enum, "value")
          local number = lex:expected("="):integer()
          local value = {
            name = ident,
            number = number,
            options = inline_option(lex)
          }
          self.locmap[value] = pos
          insert_tab(values, value)
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "enum_type")
        insert_tab(info, enum)
      end
      return enum
    end
    
    function toplevel:option(lex, info)
      local ident = lex:option_name()
      lex:expected("=")
      local value = lex:constant()
      lex:line_end()
      local options = info and default(info, "options") or {}
      options[ident] = value
      return options, self
    end
    
    function toplevel:extend(lex, info)
      local name = lex:type_name()
      local ft = info and default(info, "extension") or {}
      local mt = info and default(info, "message_type") or {}
      lex:expected("{")
      while not lex:test("}") do
        local ident, pos = lex:type_name()
        local f, t = label_field(self, lex, ident)
        self.locmap[f] = pos
        f.extendee = name
        insert_tab(ft, f)
        insert_tab(mt, t)
        lex:line_end("opt")
      end
      return ft, mt
    end
    
    local svr_body = {}
    
    function svr_body:rpc(lex, info)
      local name, pos = lex:ident("rpc name")
      local rpc = {name = name}
      self.locmap[rpc] = pos
      local _, tn
      lex:expected("%(")
      rpc.client_streaming = lex:keyword("stream", "opt")
      _, tn = type_info(lex, lex:type_name())
      if not tn then
        return lex:error("rpc input type must by message")
      end
      rpc.input_type = tn
      lex:expected("%)"):expected("returns"):expected("%(")
      rpc.server_streaming = lex:keyword("stream", "opt")
      _, tn = type_info(lex, lex:type_name())
      if not tn then
        return lex:error("rpc output type must by message")
      end
      rpc.output_type = tn
      lex:expected("%)")
      if lex:test("{") then
        while not lex:test("}") do
          lex:line_end("opt")
          lex:keyword("option")
          toplevel.option(self, lex, rpc)
        end
      end
      lex:line_end("opt")
      local t = default(info, "method")
      insert_tab(t, rpc)
    end
    
    function svr_body:option(lex, info)
      return toplevel.option(self, lex, info)
    end
    
    function svr_body.stream(_, lex)
      lex:error("stream not implement yet")
    end
    
    function toplevel:service(lex, info)
      local name, pos = lex:ident("service name")
      local svr = {name = name}
      self.locmap[svr] = pos
      lex:expected("{")
      while not lex:test("}") do
        local ident = lex:type_name()
        local body_parser = svr_body[ident]
        if body_parser then
          body_parser(self, lex, svr)
        else
          return lex:error("expected 'rpc' or 'option' in service body")
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "service")
        insert_tab(info, svr)
      end
      return svr
    end
  end
  
  local function make_context(self, lex)
    local ctx = {
      syntax = "proto2",
      locmap = {},
      prefix = ".",
      lex = lex
    }
    ctx.loaded = self.loaded
    ctx.typemap = self.typemap
    ctx.paths = self.paths
    ctx.proto3_optional = self.proto3_optional or self.experimental_allow_proto3_optional
    ctx.unknown_type = self.unknown_type
    ctx.unknown_import = self.unknown_import
    ctx.on_import = self.on_import
    return setmetatable(ctx, Parser)
  end
  
  function Parser:parse(src, name)
    local loaded = self.loaded[name]
    if loaded then
      if true == loaded then
        error("loop loaded: " .. name)
      end
      return loaded
    end
    name = name or "<input>"
    self.loaded[name] = true
    local lex = Lexer.new(name, src)
    local ctx = make_context(self, lex)
    local info = {
      name = lex.name,
      syntax = ctx.syntax
    }
    local syntax = lex:keyword("syntax", "opt")
    if syntax then
      info.syntax = lex:expected("="):quote()
      ctx.syntax = info.syntax
      lex:line_end()
    end
    while not lex:eof() do
      local ident = lex:ident()
      local top_parser = toplevel[ident]
      if top_parser then
        top_parser(ctx, lex, info)
      else
        lex:error("unknown keyword '" .. ident .. "'")
      end
      lex:line_end("opt")
    end
    self.loaded[name] = "<input>" ~= name and info or nil
    return ctx:resolve(lex, info)
  end
  
  local function empty()
  end
  
  local function iter(t, k)
    local v = t[k]
    if v then
      return ipairs(v)
    end
    return empty
  end
  
  local function check_dup(self, lex, typ, map, k, v)
    local old = map[v[k]]
    if old then
      local ln, co = lex:pos2loc(self.locmap[old])
      lex:error("%s '%s' exists, previous at %d:%d", typ, v[k], ln, co)
    end
    map[v[k]] = v
  end
  
  local function check_type(self, lex, tname)
    if tname:match("^%.") then
      local t = self.typemap[tname]
      if not t then
        return lex:error("unknown type '%s'", tname)
      end
      return t, tname
    end
    local prefix = self.prefix
    for i = #prefix + 1, 1, -1 do
      local op = prefix[i]
      prefix[i] = tname
      local tn = table.concat(prefix, ".", 1, i)
      prefix[i] = op
      local t = self.typemap[tn]
      if t then
        return t, tn
      end
    end
    local tn, t
    local type_fallback = self.unknown_type
    if type_fallback then
      if true == type_fallback then
        tn = true
      elseif "string" == type(type_fallback) then
        tn = tname:match(type_fallback) and true
      else
        tn = type_fallback(self, tname)
      end
    end
    if tn then
      t = types[t or "message"]
      if true == tn then
        tn = "." .. tname
      end
      return t, tn
    end
    return lex:error("unknown type '%s'", tname)
  end
  
  local function check_field(self, lex, info)
    if info.extendee then
      local t, tn = check_type(self, lex, info.extendee)
      if t ~= types.message then
        lex:error("message type expected in extension")
      end
      info.extendee = tn
    end
    if info.type_name then
      local t, tn = check_type(self, lex, info.type_name)
      info.type = t
      info.type_name = tn
    end
  end
  
  local function check_enum(self, lex, info)
    local names, numbers = {}, {}
    for _, v in iter(info, "value") do
      lex.pos = assert(self.locmap[v])
      check_dup(self, lex, "enum name", names, "name", v)
      if not info.options or not info.options.allow_alias then
        check_dup(self, lex, "enum number", numbers, "number", v)
      end
    end
  end
  
  local function check_message(self, lex, info)
    insert_tab(self.prefix, info.name)
    local names, numbers = {}, {}
    for _, v in iter(info, "field") do
      lex.pos = assert(self.locmap[v])
      check_dup(self, lex, "field name", names, "name", v)
      check_dup(self, lex, "field number", numbers, "number", v)
      check_field(self, lex, v)
    end
    for _, v in iter(info, "nested_type") do
      check_message(self, lex, v)
    end
    for _, v in iter(info, "extension") do
      lex.pos = assert(self.locmap[v])
      check_field(self, lex, v)
    end
    self.prefix[#self.prefix] = nil
  end
  
  local function check_service(self, lex, info)
    local names = {}
    for _, v in iter(info, "method") do
      lex.pos = self.locmap[v]
      check_dup(self, lex, "rpc name", names, "name", v)
      local t, tn = check_type(self, lex, v.input_type)
      v.input_type = tn
      if t ~= types.message then
        lex:error("message type expected in parameter")
      end
      t, tn = check_type(self, lex, v.output_type)
      v.output_type = tn
      if t ~= types.message then
        lex:error("message type expected in return")
      end
    end
  end
  
  function Parser:resolve(lex, info)
    self.prefix = {""}
    for token in str_gmatch(info.package or "", "[^.]+") do
      insert_tab(self.prefix, token)
    end
    for _, v in iter(info, "message_type") do
      check_message(self, lex, v)
    end
    for _, v in iter(info, "enum_type") do
      check_enum(self, lex, v)
    end
    for _, v in iter(info, "service") do
      check_service(self, lex, v)
    end
    for _, v in iter(info, "extension") do
      lex.pos = assert(self.locmap[v])
      check_field(self, lex, v)
    end
    self.prefix = nil
    return info
  end
end
local has_pb, pb = pcall(require, "pb")
if has_pb then
  local descriptor_pb = "\n\179;\n\016descriptor.proto\018\015google.protobuf\"M\n\017FileDescrip" .. "torSet\0188\n\004file\024\001 \003(\v2$.google.protobuf.FileDescriptorProto" .. "R\004file\"\228\004\n\019FileDescriptorProto\018\018\n\004name\024\001 \001(\tR\004na" .. "me\018\024\n\apackage\024\002 \001(\tR\apackage\018\030\n\ndependency\024\003 \003" .. "(\tR\ndependency\018+\n\017public_dependency\024\n \003(\005R\016publicDepen" .. "dency\018'\n\015weak_dependency\024\v \003(\005R\014weakDependency\018C\n\fm" .. "essage_type\024\004 \003(\v2 .google.protobuf.DescriptorProtoR\vmessageTy" .. "pe\018A\n\tenum_type\024\005 \003(\v2$.google.protobuf.EnumDescriptorProto" .. "R\benumType\018A\n\aservice\024\006 \003(\v2'.google.protobuf.ServiceDescr" .. "iptorProtoR\aservice\018C\n\textension\024\a \003(\v2%.google.protobuf.F" .. "ieldDescriptorProtoR\textension\0186\n\aoptions\024\b \001(\v2\028.googl" .. "e.protobuf.FileOptionsR\aoptions\018I\n\016source_code_info\024\t \001(\v" .. "2\031.google.protobuf.SourceCodeInfoR\014sourceCodeInfo\018\022\n\006syntax" .. "\024\f \001(\tR\006syntax\"\185\006\n\015DescriptorProto\018\018\n\004name\024\001 " .. "\001(\tR\004name\018;\n\005field\024\002 \003(\v2%.google.protobuf.FieldDescript" .. "orProtoR\005field\018C\n\textension\024\006 \003(\v2%.google.protobuf.FieldD" .. "escriptorProtoR\textension\018A\n\vnested_type\024\003 \003(\v2 .google.p" .. "rotobuf.DescriptorProtoR\nnestedType\018A\n\tenum_type\024\004 \003(\v2$." .. "google.protobuf.EnumDescriptorProtoR\benumType\018X\n\015extension_range" .. "\024\005 \003(\v2/.google.protobuf.DescriptorProto.ExtensionRangeR\014exten" .. "sionRange\018D\n\noneof_decl\024\b \003(\v2%.google.protobuf.OneofDescr" .. "iptorProtoR\toneofDecl\0189\n\aoptions\024\a \001(\v2\031.google.protobu" .. "f.MessageOptionsR\aoptions\018U\n\014reserved_range\024\t \003(\v2..googl" .. "e.protobuf.DescriptorProto.ReservedRangeR\rreservedRange\018#\n\rrese" .. "rved_name\024\n \003(\tR\freservedName\026z\n\014ExtensionRange\018\020\n" .. "\005start\024\001 \001(\005R\005start\018\016\n\003end\024\002 \001(\005R\003end\018@\n\aoptio" .. "ns\024\003 \001(\v2&.google.protobuf.ExtensionRangeOptionsR\aoptions\0267" .. "\n\rReservedRange\018\020\n\005start\024\001 \001(\005R\005start\018\016\n\003end\024" .. "\002 \001(\005R\003end\"|\n\021ExtensionRangeOptions\018X\n\020uninterpreted_opt" .. "ion\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019uninterpr" .. "etedOption*\t\b\232\a\016\128\128\128\128\002\"\193\006\n\020FieldDescriptor" .. "Proto\018\018\n\004name\024\001 \001(\tR\004name\018\022\n\006number\024\003 \001(\005R\006nu" .. "mber\018A\n\005label\024\004 \001(\0142+.google.protobuf.FieldDescriptorProto." .. "LabelR\005label\018>\n\004type\024\005 \001(\0142*.google.protobuf.FieldDescript" .. "orProto.TypeR\004type\018\027\n\ttype_name\024\006 \001(\tR\btypeName\018\026\n" .. "\bextendee\024\002 \001(\tR\bextendee\018#\n\rdefault_value\024\a \001(\tR\fd" .. "efaultValue\018\031\n\voneof_index\024\t \001(\005R\noneofIndex\018\027\n\tj" .. "son_name\024\n \001(\tR\bjsonName\0187\n\aoptions\024\b \001(\v2\029.googl" .. "e.protobuf.FieldOptionsR\aoptions\018'\n\015proto3_optional\024\017 \001(\bR" .. "\014proto3Optional\"\182\002\n\004Type\018\015\n\vTYPE_DOUBLE\016\001\018\014\n" .. "\nTYPE_FLOAT\016\002\018\014\n\nTYPE_INT64\016\003\018\015\n\vTYPE_UINT64\016" .. "\004\018\014\n\nTYPE_INT32\016\005\018\016\n\fTYPE_FIXED64\016\006\018\016\n\fT" .. "YPE_FIXED32\016\a\018\r\n\tTYPE_BOOL\016\b\018\015\n\vTYPE_STRING\016\t" .. "\018\014\n\nTYPE_GROUP\016\n\018\016\n\fTYPE_MESSAGE\016\v\018\014\n\nT" .. "YPE_BYTES\016\f\018\015\n\vTYPE_UINT32\016\r\018\r\n\tTYPE_ENUM\016\014" .. "\018\017\n\rTYPE_SFIXED32\016\015\018\017\n\rTYPE_SFIXED64\016\016\018\015\n" .. "\vTYPE_SINT32\016\017\018\015\n\vTYPE_SINT64\016\018\"C\n\005Label\018\018\n" .. "\014LABEL_OPTIONAL\016\001\018\018\n\014LABEL_REQUIRED\016\002\018\018\n\014LABEL_" .. "REPEATED\016\003\"c\n\020OneofDescriptorProto\018\018\n\004name\024\001 \001(\tR\004" .. "name\0187\n\aoptions\024\002 \001(\v2\029.google.protobuf.OneofOptionsR\ao" .. "ptions\"\227\002\n\019EnumDescriptorProto\018\018\n\004name\024\001 \001(\tR\004nam" .. "e\018?\n\005value\024\002 \003(\v2).google.protobuf.EnumValueDescriptorProto" .. "R\005value\0186\n\aoptions\024\003 \001(\v2\028.google.protobuf.EnumOptionsR" .. "\aoptions\018]\n\014reserved_range\024\004 \003(\v26.google.protobuf.EnumDe" .. "scriptorProto.EnumReservedRangeR\rreservedRange\018#\n\rreserved_name" .. "\024\005 \003(\tR\freservedName\026;\n\017EnumReservedRange\018\020\n\005start" .. "\024\001 \001(\005R\005start\018\016\n\003end\024\002 \001(\005R\003end\"\131\001\n\024EnumVal" .. "ueDescriptorProto\018\018\n\004name\024\001 \001(\tR\004name\018\022\n\006number\024" .. "\002 \001(\005R\006number\018;\n\aoptions\024\003 \001(\v2!.google.protobuf.EnumVa" .. "lueOptionsR\aoptions\"\167\001\n\022ServiceDescriptorProto\018\018\n\004name" .. "\024\001 \001(\tR\004name\018>\n\006method\024\002 \003(\v2&.google.protobuf.Method" .. "DescriptorProtoR\006method\0189\n\aoptions\024\003 \001(\v2\031.google.proto" .. "buf.ServiceOptionsR\aoptions\"\137\002\n\021MethodDescriptorProto\018\018" .. "\n\004name\024\001 \001(\tR\004name\018\029\n\ninput_type\024\002 \001(\tR\tinputTyp" .. "e\018\031\n\voutput_type\024\003 \001(\tR\noutputType\0188\n\aoptions\024\004" .. " \001(\v2\030.google.protobuf.MethodOptionsR\aoptions\0180\n\016client_s" .. "treaming\024\005 \001(\b:\005falseR\015clientStreaming\0180\n\016server_streami" .. "ng\024\006 \001(\b:\005falseR\015serverStreaming\"\145\t\n\vFileOptions\018!" .. "\n\fjava_package\024\001 \001(\tR\vjavaPackage\0180\n\020java_outer_class" .. "name\024\b \001(\tR\018javaOuterClassname\0185\n\019java_multiple_files\024" .. "\n \001(\b:\005falseR\017javaMultipleFiles\018D\n\029java_generate_equals_an" .. "d_hash\024\020 \001(\bB\002\024\001R\025javaGenerateEqualsAndHash\018:\n\022java_s" .. "tring_check_utf8\024\027 \001(\b:\005falseR\019javaStringCheckUtf8\018S\n\fop" .. "timize_for\024\t \001(\0142).google.protobuf.FileOptions.OptimizeMode:\005SP" .. "EEDR\voptimizeFor\018\029\n\ngo_package\024\v \001(\tR\tgoPackage\0185" .. "\n\019cc_generic_services\024\016 \001(\b:\005falseR\017ccGenericServices\0189" .. "\n\021java_generic_services\024\017 \001(\b:\005falseR\019javaGenericServices" .. "\0185\n\019py_generic_services\024\018 \001(\b:\005falseR\017pyGenericServices" .. "\0187\n\020php_generic_services\024* \001(\b:\005falseR\018phpGenericServices" .. "\018%\n\ndeprecated\024\023 \001(\b:\005falseR\ndeprecated\018.\n\016cc_enab" .. "le_arenas\024\031 \001(\b:\004trueR\014ccEnableArenas\018*\n\017objc_class_pref" .. "ix\024$ \001(\tR\015objcClassPrefix\018)\n\016csharp_namespace\024% \001(\tR\015" .. "csharpNamespace\018!\n\fswift_prefix\024' \001(\tR\vswiftPrefix\018(\n" .. "\016php_class_prefix\024( \001(\tR\014phpClassPrefix\018#\n\rphp_namespace" .. "\024) \001(\tR\fphpNamespace\0184\n\022php_metadata_namespace\024, \001(\tR" .. "\020phpMetadataNamespace\018!\n\fruby_package\024- \001(\tR\vrubyPackage" .. "\018X\n\020uninterpreted_option\024\231\a \003(\v2$.google.protobuf.Unint" .. "erpretedOptionR\019uninterpretedOption\":\n\fOptimizeMode\018\t\n\005SPE" .. "ED\016\001\018\r\n\tCODE_SIZE\016\002\018\016\n\fLITE_RUNTIME\016\003*\t\b\232" .. "\a\016\128\128\128\128\002J\004\b&\016'\"\227\002\n\014MessageOptions\018<\n\023" .. "message_set_wire_format\024\001 \001(\b:\005falseR\020messageSetWireFormat\018L" .. "\n\031no_standard_descriptor_accessor\024\002 \001(\b:\005falseR\028noStandardD" .. "escriptorAccessor\018%\n\ndeprecated\024\003 \001(\b:\005falseR\ndeprecated" .. "\018\027\n\tmap_entry\024\a \001(\bR\bmapEntry\018X\n\020uninterpreted_optio" .. "n\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019uninterpret" .. "edOption*\t\b\232\a\016\128\128\128\128\002J\004\b\004\016\005J\004\b\005\016\006J\004\b\006" .. "\016\aJ\004\b\b\016\tJ\004\b\t\016\n\"\226\003\n\fFieldOptions\018A\n\005ctype" .. "\024\001 \001(\0142#.google.protobuf.FieldOptions.CType:\006STRINGR\005ctype\018" .. "\022\n\006packed\024\002 \001(\bR\006packed\018G\n\006jstype\024\006 \001(\0142$.google" .. ".protobuf.FieldOptions.JSType:\tJS_NORMALR\006jstype\018\025\n\004lazy\024\005 " .. "\001(\b:\005falseR\004lazy\018%\n\ndeprecated\024\003 \001(\b:\005falseR\ndeprecat" .. "ed\018\025\n\004weak\024\n \001(\b:\005falseR\004weak\018X\n\020uninterpreted_opt" .. "ion\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019uninterpr" .. "etedOption\"/\n\005CType\018\n\n\006STRING\016\000\018\b\n\004CORD\016\001\018\016" .. "\n\fSTRING_PIECE\016\002\"5\n\006JSType\018\r\n\tJS_NORMAL\016\000\018\r\n" .. "\tJS_STRING\016\001\018\r\n\tJS_NUMBER\016\002*\t\b\232\a\016\128\128\128\128" .. "\002J\004\b\004\016\005\"s\n\fOneofOptions\018X\n\020uninterpreted_option\024" .. "\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019uninterpretedOp" .. "tion*\t\b\232\a\016\128\128\128\128\002\"\192\001\n\vEnumOptions\018\031\n" .. "\vallow_alias\024\002 \001(\bR\nallowAlias\018%\n\ndeprecated\024\003 \001(\b:" .. "\005falseR\ndeprecated\018X\n\020uninterpreted_option\024\231\a \003(\v2$." .. "google.protobuf.UninterpretedOptionR\019uninterpretedOption*\t\b\232\a" .. "\016\128\128\128\128\002J\004\b\005\016\006\"\158\001\n\016EnumValueOptions\018%\n" .. "\ndeprecated\024\001 \001(\b:\005falseR\ndeprecated\018X\n\020uninterpreted_o" .. "ption\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019uninter" .. "pretedOption*\t\b\232\a\016\128\128\128\128\002\"\156\001\n\014ServiceOption" .. "s\018%\n\ndeprecated\024! \001(\b:\005falseR\ndeprecated\018X\n\020uninterp" .. "reted_option\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019" .. "uninterpretedOption*\t\b\232\a\016\128\128\128\128\002\"\224\002\n\rMethod" .. "Options\018%\n\ndeprecated\024! \001(\b:\005falseR\ndeprecated\018q\n\017id" .. "empotency_level\024\" \001(\0142/.google.protobuf.MethodOptions.Idempotenc" .. "yLevel:\019IDEMPOTENCY_UNKNOWNR\016idempotencyLevel\018X\n\020uninterprete" .. "d_option\024\231\a \003(\v2$.google.protobuf.UninterpretedOptionR\019unin" .. "terpretedOption\"P\n\016IdempotencyLevel\018\023\n\019IDEMPOTENCY_UNKNOWN" .. "\016\000\018\019\n\015NO_SIDE_EFFECTS\016\001\018\014\n\nIDEMPOTENT\016\002*\t\b" .. "\232\a\016\128\128\128\128\002\"\154\003\n\019UninterpretedOption\018A\n\004na" .. "me\024\002 \003(\v2-.google.protobuf.UninterpretedOption.NamePartR\004name" .. "\018)\n\016identifier_value\024\003 \001(\tR\015identifierValue\018,\n\018posit" .. "ive_int_value\024\004 \001(\004R\016positiveIntValue\018,\n\018negative_int_valu" .. "e\024\005 \001(\003R\016negativeIntValue\018!\n\fdouble_value\024\006 \001(\001R\vdo" .. "ubleValue\018!\n\fstring_value\024\a \001(\fR\vstringValue\018'\n\015agg" .. "regate_value\024\b \001(\tR\014aggregateValue\026J\n\bNamePart\018\027\n\tna" .. "me_part\024\001 \002(\tR\bnamePart\018!\n\fis_extension\024\002 \002(\bR\visExt" .. "ension\"\167\002\n\014SourceCodeInfo\018D\n\blocation\024\001 \003(\v2(.goog" .. "le.protobuf.SourceCodeInfo.LocationR\blocation\026\206\001\n\bLocation\018" .. "\022\n\004path\024\001 \003(\005B\002\016\001R\004path\018\022\n\004span\024\002 \003(\005B\002\016" .. "\001R\004span\018)\n\016leading_comments\024\003 \001(\tR\015leadingComments\018+" .. "\n\017trailing_comments\024\004 \001(\tR\016trailingComments\018:\n\025leading" .. "_detached_comments\024\006 \003(\tR\023leadingDetachedComments\"\209\001\n\017G" .. "eneratedCodeInfo\018M\n\nannotation\024\001 \003(\v2-.google.protobuf.Gen" .. "eratedCodeInfo.AnnotationR\nannotation\026m\n\nAnnotation\018\022\n\004p" .. "ath\024\001 \003(\005B\002\016\001R\004path\018\031\n\vsource_file\024\002 \001(\tR\nsour" .. "ceFile\018\020\n\005begin\024\003 \001(\005R\005begin\018\016\n\003end\024\004 \001(\005R\003en" .. "dB~\n\019com.google.protobufB\016DescriptorProtosH\001Z-google.golang.org/" .. "protobuf/types/descriptorpb\248\001\001\162\002\003GPB\170\002\026Google.Protobuf." .. "Reflection"
  
  function Parser.reload()
    assert(pb.load(descriptor_pb), "load descriptor msg failed")
  end
  
  local function do_compile(self, f, ...)
    if self.include_imports then
      local old = self.on_import
      local infos = {}
      
      function self.on_import(info)
        insert_tab(infos, info)
      end
      
      local r = f(...)
      insert_tab(infos, r)
      self.on_import = old
      return {file = infos}
    end
    return {
      file = {
        f(...)
      }
    }
  end
  
  function Parser:compile(s, name)
    if self == Parser then
      self = Parser.new()
    end
    local set = do_compile(self, self.parse, self, s, name)
    return pb.encode(".google.protobuf.FileDescriptorSet", set)
  end
  
  function Parser:compilefile(fn)
    if self == Parser then
      self = Parser.new()
    end
    local set = do_compile(self, self.parsefile, self, fn)
    return pb.encode(".google.protobuf.FileDescriptorSet", set)
  end
  
  function Parser:load(s, name)
    if self == Parser then
      self = Parser.new()
    end
    local ret, pos = pb.load(self:compile(s, name))
    if ret then
      return ret, pos
    end
    error("load failed at offset " .. pos)
  end
  
  function Parser:loadfile(fn)
    if self == Parser then
      self = Parser.new()
    end
    local ret, pos = pb.load(self:compilefile(fn))
    if ret then
      return ret, pos
    end
    error("load failed at offset " .. pos)
  end
  
  Parser.reload()
end
return Parser
