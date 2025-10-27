local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DLevelDivideClass", {
  BP_FallTrigger_C = {
    DivideClass = "BP_FallTrigger_C"
  },
  BP_FallTrigger_Edge_C = {
    DivideClass = "BP_FallTrigger_Edge_C"
  },
  BP_FallingPlatform_C = {
    DivideClass = "BP_FallingPlatform_C"
  },
  BP_FallingPlatform_Icelake_C = {
    DivideClass = "BP_FallingPlatform_Icelake_C"
  },
  BP_JumpPadSunShade_C = {
    DivideClass = "BP_JumpPadSunShade_C"
  },
  BP_JumpPad_C = {
    DivideClass = "BP_JumpPad_C"
  }
})
