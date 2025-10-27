local T = {}
T.RT_1 = {
  Function = "SetParam",
  Param = "CanOpen",
  Value = true
}
T.RT_2 = {
  T.RT_1
}
T.RT_3 = {
  Type = "Interactive"
}
T.RT_4 = {Type = "Manual"}
T.RT_5 = {Function = "OpenUI"}
T.RT_6 = {
  T.RT_5
}
T.RT_7 = {
  Type = "InteractBreak"
}
T.RT_8 = {
  Type = "InteractDone"
}
T.RT_9 = {
  Function = "DeactiveGuide"
}
T.RT_10 = {Param = 0, Type = "Time"}
T.RT_11 = {
  Function = "CloseMechanism"
}
T.RT_12 = {
  DoorType = 0,
  Function = "SetConditionDoorState"
}
T.RT_13 = {
  ColorId = 0,
  Function = "ChangeColor"
}
T.RT_14 = {Type = "TriggerBox"}
T.RT_15 = {
  NextStateId = 104012,
  TypeNextState = T.RT_4
}
T.RT_16 = {
  NextStateId = 104013,
  TypeNextState = T.RT_4
}
T.RT_17 = {
  Function = "OpenMechanism"
}
T.RT_18 = {
  T.RT_17,
  T.RT_12,
  T.RT_13
}
T.RT_19 = {
  DoorType = 1,
  Function = "SetConditionDoorState"
}
T.RT_20 = {
  ColorId = 1,
  Function = "ChangeColor"
}
T.RT_21 = {
  NextStateId = 104011,
  TypeNextState = T.RT_4
}
T.RT_22 = {
  ColorId = 2,
  Function = "ChangeColor"
}
T.RT_23 = {
  T.RT_11,
  T.RT_22
}
T.RT_24 = {
  ActiveRange = 1500,
  Type = "DistanceActive"
}
T.RT_25 = {Param = 1, Type = "Time"}
T.RT_26 = {
  T.RT_22,
  T.RT_9
}
T.RT_27 = {
  NextStateId = 1060401,
  TypeNextState = T.RT_4
}
T.RT_28 = {
  NextStateId = 1060402,
  TypeNextState = T.RT_4
}
T.RT_29 = {
  T.RT_20
}
T.RT_30 = {
  NextStateId = 1060400,
  TypeNextState = T.RT_4
}
T.RT_31 = {
  T.RT_20,
  T.RT_9
}
T.RT_32 = {
  NextStateId = 1060801,
  TypeNextState = T.RT_4
}
T.RT_33 = {
  NextStateId = 1060802,
  TypeNextState = T.RT_4
}
T.RT_34 = {
  NextStateId = 1060800,
  TypeNextState = T.RT_4
}
T.RT_35 = {
  ColorId = 3,
  Function = "ChangeColor"
}
T.RT_36 = {
  T.RT_35
}
T.RT_37 = {
  NextStateId = 1061101,
  TypeNextState = T.RT_4
}
T.RT_38 = {
  NextStateId = 1061102,
  TypeNextState = T.RT_4
}
T.RT_39 = {
  NextStateId = 1061103,
  TypeNextState = T.RT_4
}
T.RT_40 = {
  NextStateId = 1061104,
  TypeNextState = T.RT_4
}
T.RT_41 = {
  NextStateId = 1061105,
  TypeNextState = T.RT_4
}
T.RT_42 = {
  NextStateId = 1061100,
  TypeNextState = T.RT_4
}
T.RT_43 = {Param = 2, Type = "Time"}
T.RT_44 = {
  T.RT_13
}
T.RT_45 = {
  NextStateId = 1061201,
  TypeNextState = T.RT_4
}
T.RT_46 = {
  InteractiveId = 918,
  Type = "Interactive"
}
T.RT_47 = {
  NextStateId = 1061200,
  TypeNextState = T.RT_4
}
T.RT_48 = {Param = 3, Type = "Time"}
T.RT_49 = {
  InteractiveId = 919,
  Type = "Interactive"
}
T.RT_50 = {
  T.RT_35,
  T.RT_9
}
T.RT_51 = {
  T.RT_22
}
T.RT_52 = {
  NextStateId = 1061231,
  TypeNextState = T.RT_4
}
T.RT_53 = {
  NextStateId = 1061232,
  TypeNextState = T.RT_4
}
T.RT_54 = {
  NextStateId = 1061230,
  TypeNextState = T.RT_4
}
T.RT_55 = {
  InteractiveId = 922,
  Type = "Interactive"
}
T.RT_56 = {
  T.RT_17,
  T.RT_20
}
T.RT_57 = {
  Function = "SetParam",
  Param = "OpenState",
  Value = false
}
T.RT_58 = {
  InteractiveId = 923,
  Type = "Interactive"
}
T.RT_59 = {
  InteractiveId = 924,
  Type = "Interactive"
}
T.RT_60 = {
  NextStateId = 1061251,
  TypeNextState = T.RT_4
}
T.RT_61 = {
  NextStateId = 1061301,
  TypeNextState = T.RT_4
}
T.RT_62 = {
  NextStateId = 1061302,
  TypeNextState = T.RT_4
}
T.RT_63 = {
  NextStateId = 1061300,
  TypeNextState = T.RT_4
}
T.RT_64 = {
  DeActiveRange = 5000,
  Type = "DistanceDeActive"
}
T.RT_65 = {
  ActiveRange = 4000,
  Type = "DistanceActive"
}
T.RT_66 = {
  NextStateId = 1061311,
  TypeNextState = T.RT_4
}
T.RT_67 = {
  NextStateId = 1061313,
  TypeNextState = T.RT_4
}
T.RT_68 = {
  NextStateId = 1061310,
  TypeNextState = T.RT_4
}
T.RT_69 = {
  NextStateId = 1061312,
  TypeNextState = T.RT_4
}
T.RT_70 = {
  NextStateId = 1061400,
  TypeNextState = T.RT_4
}
T.RT_71 = {
  DeActiveRange = 1600,
  Type = "DistanceDeActive"
}
T.RT_72 = {
  NextStateId = 1061601,
  TypeNextState = T.RT_71
}
T.RT_73 = {
  NextStateId = 1061900,
  TypeNextState = T.RT_4
}
T.RT_74 = {
  NextStateId = 1062002,
  TypeNextState = T.RT_4
}
T.RT_75 = {
  Function = "CombatPropActive"
}
T.RT_76 = {
  T.RT_75,
  T.RT_13
}
T.RT_77 = {
  DeActiveRange = 3000,
  Type = "DistanceDeActive"
}
T.RT_78 = {
  NextStateId = 1070102,
  TypeNextState = T.RT_4
}
T.RT_79 = {
  Function = "CombatPropDeActive"
}
T.RT_80 = {
  T.RT_79,
  T.RT_20
}
T.RT_81 = {
  ActiveRange = 3000,
  Type = "DistanceActive"
}
T.RT_82 = {
  T.RT_79,
  T.RT_22
}
T.RT_83 = {
  NextStateId = 1070160,
  TypeNextState = T.RT_4
}
T.RT_84 = {Param = 4, Type = "Time"}
T.RT_85 = {
  NextStateId = 1070200,
  TypeNextState = T.RT_4
}
T.RT_86 = {
  T.RT_79,
  T.RT_13
}
T.RT_87 = {
  T.RT_9
}
T.RT_88 = {
  NextStateId = 109010,
  TypeNextState = T.RT_4
}
T.RT_89 = {
  T.RT_17
}
T.RT_90 = {
  NextStateId = 111011,
  TypeNextState = T.RT_4
}
T.RT_91 = {
  NextStateId = 111010,
  TypeNextState = T.RT_4
}
T.RT_92 = {Type = "Hit"}
T.RT_93 = {
  T.RT_13,
  T.RT_9
}
T.RT_94 = {
  NextStateId = 111014,
  TypeNextState = T.RT_92
}
T.RT_95 = {NeedCountDown = true, Type = "CustomTime"}
T.RT_96 = {
  NextStateId = 111013,
  TypeNextState = T.RT_95
}
T.RT_97 = {
  NextStateId = 111012,
  TypeNextState = T.RT_4
}
T.RT_98 = {
  NextStateId = 111020,
  TypeNextState = T.RT_4
}
T.RT_99 = {
  Function = "ActiveGuide"
}
T.RT_100 = {
  NextStateId = 111030,
  TypeNextState = T.RT_4
}
T.RT_101 = {
  NeedCountDown = false,
  Param = 1,
  Type = "Time"
}
T.RT_102 = {
  NextStateId = 111040,
  TypeNextState = T.RT_4
}
T.RT_103 = {
  NextStateId = 111042,
  TypeNextState = T.RT_92
}
T.RT_104 = {
  NextStateId = 111041,
  TypeNextState = T.RT_95
}
T.RT_105 = {
  T.RT_79,
  T.RT_22,
  T.RT_9
}
T.RT_106 = {
  T.RT_75,
  T.RT_20
}
T.RT_107 = {
  NextStateId = 112010,
  TypeNextState = T.RT_4
}
T.RT_108 = {Function = "StopFX", Tag = "GearR1"}
T.RT_109 = {Function = "StopFX", Tag = "GearR2"}
T.RT_110 = {Function = "StopFX", Tag = "GearR3"}
T.RT_111 = {Function = "StopFX", Tag = "GearR4"}
T.RT_112 = {Function = "StopFX", Tag = "GearS"}
T.RT_113 = {
  NextStateId = 11301231,
  TypeNextState = T.RT_4
}
T.RT_114 = {
  NextStateId = 11301232,
  TypeNextState = T.RT_4
}
T.RT_115 = {
  NextStateId = 11301230,
  TypeNextState = T.RT_4
}
T.RT_116 = {
  Function = "SetParam",
  Param = "CanOpen",
  Value = false
}
T.RT_117 = {
  T.RT_116
}
T.RT_118 = {
  NextStateId = 1150301,
  TypeNextState = T.RT_4
}
T.RT_119 = {
  NextStateId = 1150302,
  TypeNextState = T.RT_4
}
T.RT_120 = {
  NextStateId = 1150303,
  TypeNextState = T.RT_4
}
T.RT_121 = {
  NextStateId = 1150300,
  TypeNextState = T.RT_4
}
T.RT_122 = {
  NextStateId = 116011,
  TypeNextState = T.RT_4
}
T.RT_123 = {
  NextStateId = 116012,
  TypeNextState = T.RT_4
}
T.RT_124 = {
  NextStateId = 116013,
  TypeNextState = T.RT_4
}
T.RT_125 = {
  NextStateId = 116014,
  TypeNextState = T.RT_4
}
T.RT_126 = {
  NextStateId = 116015,
  TypeNextState = T.RT_4
}
T.RT_127 = {
  NextStateId = 116010,
  TypeNextState = T.RT_4
}
T.RT_128 = {
  NextStateId = 1170102,
  TypeNextState = T.RT_4
}
T.RT_129 = {
  NextStateId = 118002,
  TypeNextState = T.RT_14
}
T.RT_130 = {
  NextStateId = 118004,
  TypeNextState = T.RT_4
}
T.RT_131 = {
  ColorId = 4,
  Function = "ChangeColor"
}
T.RT_132 = {
  T.RT_131
}
T.RT_133 = {
  NextStateId = 118001,
  TypeNextState = T.RT_4
}
T.RT_134 = {
  [1] = T.RT_133
}
T.RT_135 = {
  NextStateId = 118011,
  TypeNextState = T.RT_4
}
T.RT_136 = {
  NextStateId = 118026,
  TypeNextState = T.RT_4
}
T.RT_137 = {
  NextStateId = 118015,
  TypeNextState = T.RT_4
}
T.RT_138 = {
  T.RT_17,
  T.RT_131
}
T.RT_139 = {
  NextStateId = 118013,
  TypeNextState = T.RT_4
}
T.RT_140 = {
  [1] = T.RT_139,
  [2] = T.RT_137
}
T.RT_141 = {
  Function = "CombatPropInvincible"
}
T.RT_142 = {
  T.RT_141
}
T.RT_143 = {
  Function = "CombatPropUnInvincible"
}
T.RT_144 = {
  T.RT_143
}
T.RT_145 = {
  EffectId = 900031,
  Function = "PlayFX",
  Tag = "Bomb"
}
T.RT_146 = {
  Function = "DestroySelf"
}
T.RT_147 = {
  T.RT_146
}
T.RT_148 = {
  NextStateId = 13,
  TypeNextState = T.RT_3
}
T.RT_149 = {
  NextStateId = 1210021,
  TypeNextState = T.RT_4
}
T.RT_150 = {
  T.RT_79
}
T.RT_151 = {
  T.RT_75
}
T.RT_152 = {
  InteractiveId = 103,
  Type = "Interactive"
}
T.RT_153 = {
  NextStateId = 1210182,
  TypeNextState = T.RT_4
}
T.RT_154 = {Param = 5, Type = "Time"}
T.RT_155 = {
  NextStateId = 1210220,
  TypeNextState = T.RT_4
}
T.RT_156 = {
  NextStateId = 1210240,
  TypeNextState = T.RT_4
}
T.RT_157 = {
  T.RT_17,
  T.RT_13
}
T.RT_158 = {
  NextStateId = 15,
  TypeNextState = T.RT_4
}
T.RT_159 = {
  InteractiveId = 300,
  Type = "Interactive"
}
T.RT_160 = {
  NextStateId = 1310042,
  TypeNextState = T.RT_4
}
T.RT_161 = {
  NextStateId = 1310071,
  TypeNextState = T.RT_4
}
T.RT_162 = {
  NextStateId = 1310073,
  TypeNextState = T.RT_4
}
T.RT_163 = {
  NextStateId = 1310070,
  TypeNextState = T.RT_4
}
T.RT_164 = {
  InteractiveId = 301,
  Type = "Interactive"
}
T.RT_165 = {
  NextStateId = 1310082,
  TypeNextState = T.RT_164
}
T.RT_166 = {
  [1] = T.RT_165
}
T.RT_167 = {
  NextStateId = 1310092,
  TypeNextState = T.RT_164
}
T.RT_168 = {
  [1] = T.RT_167
}
T.RT_169 = {
  NextStateId = 1310094,
  TypeNextState = T.RT_4
}
T.RT_170 = {
  NextStateId = 1310095,
  TypeNextState = T.RT_4
}
T.RT_171 = {
  NextStateId = 1310170,
  TypeNextState = T.RT_4
}
T.RT_172 = {
  [1] = T.RT_171
}
T.RT_173 = {Param = 6, Type = "Time"}
T.RT_174 = {Param = 10, Type = "Time"}
T.RT_175 = {Function = "Rotate", IsForward = true}
T.RT_176 = {
  T.RT_175
}
T.RT_177 = {
  NextStateId = 1500110,
  TypeNextState = T.RT_4
}
T.RT_178 = {
  Function = "SetParam",
  Param = "ForceStop",
  Value = true
}
T.RT_179 = {
  T.RT_178
}
T.RT_180 = {
  NextStateId = 242,
  TypeNextState = T.RT_4
}
T.RT_181 = {
  Function = "SetParam",
  Param = "ForceStop",
  Value = false
}
T.RT_182 = {
  InteractiveId = 912,
  Type = "Interactive"
}
T.RT_183 = {
  Function = "SetParam",
  Param = "IsActive",
  Value = false
}
T.RT_184 = {
  T.RT_183,
  T.RT_20
}
T.RT_185 = {
  Function = "SetParam",
  Param = "IsActive",
  Value = true
}
T.RT_186 = {
  T.RT_185,
  T.RT_13
}
T.RT_187 = {
  NextStateId = 244,
  TypeNextState = T.RT_4
}
T.RT_188 = {Param = 0.1, Type = "Time"}
T.RT_189 = {
  Function = "SetBubbleWidget",
  Show = false
}
T.RT_190 = {
  T.RT_116,
  T.RT_189
}
T.RT_191 = {
  NextStateId = 26,
  TypeNextState = T.RT_4
}
T.RT_192 = {
  [1] = T.RT_191
}
T.RT_193 = {
  T.RT_57
}
T.RT_194 = {
  Function = "SetParam",
  Param = "OpenState",
  Value = true
}
T.RT_195 = {
  Function = "ShowToast",
  ToastText = "UI_TELEPORTPOINT_INTERACTIVE"
}
T.RT_196 = {
  InteractiveId = 909,
  StateChangeParam = true,
  Type = "Interactive"
}
T.RT_197 = {
  T.RT_79,
  T.RT_9
}
T.RT_198 = {
  ActiveRange = 1000,
  Type = "DistanceActive"
}
T.RT_199 = {
  T.RT_75,
  T.RT_99
}
T.RT_200 = {
  NextStateId = 3900130,
  TypeNextState = T.RT_4
}
T.RT_201 = {
  EffectId = 900035,
  Function = "PlayFX",
  Tag = "Lock"
}
T.RT_202 = {
  T.RT_79,
  T.RT_201
}
T.RT_203 = {
  InteractiveId = 111,
  Type = "Interactive"
}
T.RT_204 = {
  T.RT_75,
  T.RT_17
}
T.RT_205 = {
  EffectId = 900036,
  Function = "PlayFX",
  Tag = "Unlock"
}
T.RT_206 = {Function = "StopFX", Tag = "Lock"}
T.RT_207 = {
  T.RT_79,
  T.RT_205,
  T.RT_206
}
T.RT_208 = {
  NextStateId = 3900180,
  TypeNextState = T.RT_4
}
T.RT_209 = {
  [2] = T.RT_208
}
T.RT_210 = {
  T.RT_183
}
T.RT_211 = {
  T.RT_185
}
T.RT_212 = {
  Function = "ChangeTrapSkillOpen",
  Open = false
}
T.RT_213 = {
  Function = "ChangeTrapSkillOpen",
  Open = true
}
T.RT_214 = {
  NextStateId = 3901501,
  TypeNextState = T.RT_4
}
T.RT_215 = {
  NextStateId = 3901502,
  TypeNextState = T.RT_4
}
T.RT_216 = {
  NextStateId = 3901500,
  TypeNextState = T.RT_4
}
T.RT_217 = {
  NextStateId = 3901511,
  TypeNextState = T.RT_4
}
T.RT_218 = {
  NextStateId = 3901510,
  TypeNextState = T.RT_4
}
T.RT_219 = {
  T.RT_75,
  T.RT_212,
  T.RT_20
}
T.RT_220 = {
  NextStateId = 3901600,
  TypeNextState = T.RT_4
}
T.RT_221 = {
  T.RT_75,
  T.RT_213,
  T.RT_35,
  T.RT_9
}
T.RT_222 = {
  NeedCountDown = true,
  Param = 45,
  Type = "Time"
}
T.RT_223 = {
  NextStateId = 3901702,
  TypeNextState = T.RT_4
}
T.RT_224 = {
  NextStateId = 3901700,
  TypeNextState = T.RT_4
}
T.RT_225 = {
  NextStateId = 3901803,
  TypeNextState = T.RT_4
}
T.RT_226 = {
  [1] = T.RT_225
}
T.RT_227 = {
  T.RT_141,
  T.RT_79
}
T.RT_228 = {
  NextStateId = 3902000,
  TypeNextState = T.RT_4
}
T.RT_229 = {
  T.RT_143,
  T.RT_75
}
T.RT_230 = {
  DeActiveRange = 2000,
  Type = "DistanceDeActive"
}
T.RT_231 = {
  NextStateId = 3902301,
  TypeNextState = T.RT_4
}
T.RT_232 = {
  NextStateId = 3902302,
  TypeNextState = T.RT_4
}
T.RT_233 = {
  NextStateId = 3902300,
  TypeNextState = T.RT_4
}
T.RT_234 = {Param = 15, Type = "Time"}
T.RT_235 = {
  NextStateId = 3902400,
  TypeNextState = T.RT_4
}
T.RT_236 = {
  [1] = T.RT_235
}
T.RT_237 = {
  NextStateId = 3902501,
  TypeNextState = T.RT_4
}
T.RT_238 = {
  NextStateId = 3902502,
  TypeNextState = T.RT_4
}
T.RT_239 = {
  NextStateId = 3902500,
  TypeNextState = T.RT_4
}
T.RT_240 = {
  NextStateId = 3902701,
  TypeNextState = T.RT_4
}
T.RT_241 = {
  NextStateId = 3902702,
  TypeNextState = T.RT_4
}
T.RT_242 = {
  NextStateId = 3902703,
  TypeNextState = T.RT_4
}
T.RT_243 = {
  NextStateId = 3902700,
  TypeNextState = T.RT_4
}
T.RT_244 = {
  NextStateId = 3902704,
  TypeNextState = T.RT_4
}
T.RT_245 = {
  NextStateId = 3902705,
  TypeNextState = T.RT_4
}
T.RT_246 = {
  NextStateId = 3902706,
  TypeNextState = T.RT_4
}
T.RT_247 = {
  NextStateId = 3902707,
  TypeNextState = T.RT_4
}
T.RT_248 = {
  [1] = T.RT_247
}
T.RT_249 = {
  NextStateId = 3902710,
  TypeNextState = T.RT_174
}
T.RT_250 = {
  NextStateId = 3902727,
  TypeNextState = T.RT_4
}
T.RT_251 = {
  [1] = T.RT_250
}
T.RT_252 = {
  NextStateId = 3902720,
  TypeNextState = T.RT_25
}
T.RT_253 = {
  [1] = T.RT_252
}
T.RT_254 = {
  NextStateId = 3902750,
  TypeNextState = T.RT_4
}
T.RT_255 = {
  NextStateId = 3902757,
  TypeNextState = T.RT_4
}
T.RT_256 = {
  [1] = T.RT_255
}
T.RT_257 = {
  NextStateId = 3902792,
  TypeNextState = T.RT_4
}
T.RT_258 = {
  NextStateId = 3902790,
  TypeNextState = T.RT_4
}
T.RT_259 = {
  ActiveRange = 300,
  Type = "DistanceActive"
}
T.RT_260 = {
  NextStateId = 3902901,
  TypeNextState = T.RT_4
}
T.RT_261 = {
  NextStateId = 3902902,
  TypeNextState = T.RT_4
}
T.RT_262 = {
  NextStateId = 3902900,
  TypeNextState = T.RT_4
}
T.RT_263 = {
  NextStateId = 3903000,
  TypeNextState = T.RT_4
}
T.RT_264 = {
  [1] = T.RT_263
}
T.RT_265 = {
  NextStateId = 3903101,
  TypeNextState = T.RT_4
}
T.RT_266 = {
  NextStateId = 3903102,
  TypeNextState = T.RT_4
}
T.RT_267 = {
  [1] = T.RT_265,
  [2] = T.RT_266
}
T.RT_268 = {
  NextStateId = 3903201,
  TypeNextState = T.RT_4
}
T.RT_269 = {
  NextStateId = 3903202,
  TypeNextState = T.RT_4
}
T.RT_270 = {
  NextStateId = 3903203,
  TypeNextState = T.RT_4
}
T.RT_271 = {
  NextStateId = 3903206,
  TypeNextState = T.RT_4
}
T.RT_272 = {
  NextStateId = 3903204,
  TypeNextState = T.RT_4
}
T.RT_273 = {
  NextStateId = 3903200,
  TypeNextState = T.RT_4
}
T.RT_274 = {
  NextStateId = 3903205,
  TypeNextState = T.RT_4
}
T.RT_275 = {
  NextStateId = 3903603,
  TypeNextState = T.RT_4
}
T.RT_276 = {
  NextStateId = 3903604,
  TypeNextState = T.RT_4
}
T.RT_277 = {
  NextStateId = 3904401,
  TypeNextState = T.RT_4
}
T.RT_278 = {
  DeActiveRange = 1000,
  Type = "DistanceDeActive"
}
T.RT_279 = {
  InteractiveId = 910,
  StateChangeParam = true,
  Type = "Interactive"
}
T.RT_280 = {
  NextStateId = 4900103,
  TypeNextState = T.RT_4
}
T.RT_281 = {
  NextStateId = 4900102,
  TypeNextState = T.RT_4
}
T.RT_282 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage'",
  SectionName = "Loop"
}
T.RT_283 = {
  EffectId = 900024,
  Function = "PlayFX",
  Tag = "JHA"
}
T.RT_284 = {
  EffectId = 900023,
  Function = "PlayFX",
  NeedFinish = false,
  Tag = "Niagara"
}
T.RT_285 = {
  T.RT_284
}
T.RT_286 = {
  NextStateId = 4900712,
  TypeNextState = T.RT_4
}
T.RT_287 = {Function = "StopFX", Tag = "JHB"}
T.RT_288 = {
  EffectId = 900025,
  Function = "PlayFX",
  Tag = "JHB"
}
T.RT_289 = {Function = "StopFX", Tag = "JHA"}
T.RT_290 = {
  NextStateId = 4900710,
  TypeNextState = T.RT_4
}
T.RT_291 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage'",
  SectionName = "End"
}
T.RT_292 = {
  T.RT_116,
  T.RT_291,
  T.RT_289,
  T.RT_22,
  T.RT_287,
  T.RT_57
}
T.RT_293 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Loop"
}
T.RT_294 = {
  EffectId = 900021,
  Function = "PlayFX",
  Tag = "DGA"
}
T.RT_295 = {
  EffectId = 900020,
  Function = "PlayFX",
  NeedFinish = false,
  Tag = "Niagara"
}
T.RT_296 = {
  T.RT_295
}
T.RT_297 = {
  NextStateId = 4900732,
  TypeNextState = T.RT_4
}
T.RT_298 = {Function = "StopFX", Tag = "DGB"}
T.RT_299 = {
  EffectId = 900022,
  Function = "PlayFX",
  Tag = "DGB"
}
T.RT_300 = {Function = "StopFX", Tag = "DGA"}
T.RT_301 = {
  NextStateId = 4900730,
  TypeNextState = T.RT_4
}
T.RT_302 = {
  T.RT_291
}
T.RT_303 = {
  EventsNextState = T.RT_302,
  NextStateId = 4900752,
  TypeNextState = T.RT_4
}
T.RT_304 = {
  T.RT_282,
  T.RT_298,
  T.RT_288,
  T.RT_13
}
T.RT_305 = {
  NextStateId = 4920011,
  TypeNextState = T.RT_4
}
T.RT_306 = {
  T.RT_178,
  T.RT_22,
  T.RT_9
}
T.RT_307 = {
  NextStateId = 4920010,
  TypeNextState = T.RT_4
}
T.RT_308 = {
  NextStateId = 4920012,
  TypeNextState = T.RT_4
}
T.RT_309 = {
  NextStateId = 4920014,
  TypeNextState = T.RT_4
}
T.RT_310 = {
  NextStateId = 4920015,
  TypeNextState = T.RT_4
}
T.RT_311 = {
  EffectId = 900033,
  Function = "PlayFX",
  Tag = "Training"
}
T.RT_312 = {
  NextStateId = 494001,
  TypeNextState = T.RT_10
}
T.RT_313 = {
  [1] = T.RT_312
}
T.RT_314 = {
  T.RT_17,
  T.RT_9
}
T.RT_315 = {
  NextStateId = 495000,
  TypeNextState = T.RT_4
}
T.RT_316 = {
  T.RT_116,
  T.RT_9,
  T.RT_22
}
T.RT_317 = {
  NextStateId = 501,
  TypeNextState = T.RT_4
}
T.RT_318 = {
  T.RT_116,
  T.RT_57,
  T.RT_22
}
T.RT_319 = {
  NextStateId = 500,
  TypeNextState = T.RT_4
}
T.RT_320 = {
  T.RT_1,
  T.RT_57,
  T.RT_20
}
T.RT_321 = {
  NextStateId = 510,
  TypeNextState = T.RT_4
}
T.RT_322 = {Function = "StopFX", Tag = "Trap1"}
T.RT_323 = {Function = "StopFX", Tag = "Trap2"}
T.RT_324 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage'",
  SectionName = "Idle"
}
T.RT_325 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage'",
  SectionName = "Start"
}
T.RT_326 = {
  T.RT_325
}
T.RT_327 = {
  NextStateId = 581,
  TypeNextState = T.RT_4
}
T.RT_328 = {
  NextStateId = 582,
  TypeNextState = T.RT_4
}
T.RT_329 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Idle"
}
T.RT_330 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Start"
}
T.RT_331 = {
  T.RT_330
}
T.RT_332 = {
  NextStateId = 5531,
  TypeNextState = T.RT_4
}
T.RT_333 = {
  NextStateId = 5431,
  TypeNextState = T.RT_4
}
T.RT_334 = {
  T.RT_116,
  T.RT_9,
  T.RT_282,
  T.RT_288,
  T.RT_289,
  T.RT_13
}
T.RT_335 = {
  NextStateId = 541,
  TypeNextState = T.RT_4
}
T.RT_336 = {
  T.RT_116,
  T.RT_9
}
T.RT_337 = {
  NextStateId = 542,
  TypeNextState = T.RT_4
}
T.RT_338 = {
  T.RT_116,
  T.RT_9,
  T.RT_293,
  T.RT_299,
  T.RT_300,
  T.RT_13
}
T.RT_339 = {
  NextStateId = 543,
  TypeNextState = T.RT_4
}
T.RT_340 = {
  [1] = T.RT_339
}
T.RT_341 = {
  EffectId = 209,
  Function = "PlayFX",
  Tag = "Niagara"
}
T.RT_342 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "End"
}
T.RT_343 = {
  NextStateId = 591011,
  TypeNextState = T.RT_4
}
T.RT_344 = {
  NextStateId = 591012,
  TypeNextState = T.RT_4
}
T.RT_345 = {
  NextStateId = 591014,
  TypeNextState = T.RT_4
}
T.RT_346 = {
  NextStateId = 591021,
  TypeNextState = T.RT_4
}
T.RT_347 = {
  NextStateId = 591020,
  TypeNextState = T.RT_4
}
T.RT_348 = {
  NextStateId = 592011,
  TypeNextState = T.RT_4
}
T.RT_349 = {
  NextStateId = 592012,
  TypeNextState = T.RT_4
}
T.RT_350 = {
  NextStateId = 592014,
  TypeNextState = T.RT_4
}
T.RT_351 = {
  NextStateId = 595013,
  TypeNextState = T.RT_4
}
T.RT_352 = {
  NextStateId = 595014,
  TypeNextState = T.RT_4
}
T.RT_353 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/BluePrints/Item/CombatProp/LaserMontage.LaserMontage'",
  SectionName = "DeActive"
}
T.RT_354 = {
  T.RT_353
}
T.RT_355 = {
  NextStateId = 601,
  TypeNextState = T.RT_4
}
T.RT_356 = {
  NextStateId = 600,
  TypeNextState = T.RT_4
}
T.RT_357 = {
  T.RT_116,
  T.RT_9,
  T.RT_13
}
T.RT_358 = {Function = "StopFX", Tag = "Bling"}
T.RT_359 = {
  T.RT_17,
  T.RT_358,
  T.RT_146
}
T.RT_360 = {
  EffectId = 900028,
  Function = "PlayFX",
  Tag = "Bomb"
}
T.RT_361 = {
  T.RT_360
}
T.RT_362 = {
  EffectId = 900029,
  Function = "PlayFX",
  Tag = "Star"
}
T.RT_363 = {
  T.RT_362,
  T.RT_358
}
T.RT_364 = {
  InteractiveId = 91510,
  Type = "Interactive"
}
T.RT_365 = {Function = "StopFX", Tag = "Star"}
T.RT_366 = {
  T.RT_17,
  T.RT_365,
  T.RT_146
}
T.RT_367 = {
  T.RT_145,
  T.RT_358
}
T.RT_368 = {
  EffectId = 900032,
  Function = "PlayFX",
  Tag = "Star"
}
T.RT_369 = {
  T.RT_368
}
T.RT_370 = {
  InteractiveId = 91505,
  Type = "Interactive"
}
T.RT_371 = {
  NextStateId = 610023,
  TypeNextState = T.RT_370
}
T.RT_372 = {
  [1] = T.RT_371
}
T.RT_373 = {Function = "GiveReward"}
T.RT_374 = {
  Function = "CreateSpecialMonster",
  RuleId = 2
}
T.RT_375 = {
  T.RT_373,
  T.RT_374
}
T.RT_376 = {
  T.RT_358,
  T.RT_146
}
T.RT_377 = {
  CallBackName = "OnNotifyBegin",
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/BluePrints/Item/CombatProp/LaserMontage.LaserMontage'",
  SectionName = "Rise"
}
T.RT_378 = {
  T.RT_377
}
T.RT_379 = {
  EffectId = 208,
  Function = "PlayFX",
  Tag = "Lock"
}
T.RT_380 = {
  T.RT_116,
  T.RT_379
}
T.RT_381 = {
  NextStateId = 701061,
  TypeNextState = T.RT_4
}
T.RT_382 = {
  [1] = T.RT_381
}
T.RT_383 = {
  EffectId = 209,
  Function = "PlayFX",
  Tag = "Unlock"
}
T.RT_384 = {
  T.RT_1,
  T.RT_206,
  T.RT_383,
  T.RT_99
}
T.RT_385 = {
  InteractiveId = 70000,
  Type = "Interactive"
}
T.RT_386 = {
  InteractiveId = 70002,
  Type = "Interactive"
}
T.RT_387 = {
  NextStateId = 701102,
  TypeNextState = T.RT_386
}
T.RT_388 = {
  T.RT_1,
  T.RT_99
}
T.RT_389 = {
  InteractiveId = 70003,
  Type = "Interactive"
}
T.RT_390 = {
  NextStateId = 701132,
  TypeNextState = T.RT_389
}
T.RT_391 = {
  EffectId = 212,
  Function = "PlayFX",
  Tag = "Start"
}
T.RT_392 = {
  Color = "6E57FFFF",
  DeadTime = true,
  Function = "ChangeFX",
  Tag = "Niagara"
}
T.RT_393 = {
  T.RT_17,
  T.RT_391,
  T.RT_392
}
T.RT_394 = {Function = "StopFX", Tag = "Niagara"}
T.RT_395 = {Function = "StopFX", Tag = "Start"}
T.RT_396 = {
  EffectId = 214,
  Function = "PlayFX",
  NotAttached = true,
  Tag = "ok"
}
T.RT_397 = {
  T.RT_394,
  T.RT_395,
  T.RT_396,
  T.RT_194
}
T.RT_398 = {
  T.RT_394
}
T.RT_399 = {
  Function = "InteractiveEffect"
}
T.RT_400 = {
  Function = "AfterInteractiveEffect"
}
T.RT_401 = {
  NextStateId = 703012,
  TypeNextState = T.RT_4
}
T.RT_402 = {
  InteractiveId = 109,
  Type = "Interactive"
}
T.RT_403 = {Function = "Rotate", IsForward = false}
T.RT_404 = {
  T.RT_403
}
T.RT_405 = {
  InteractiveId = 108,
  Type = "Interactive"
}
T.RT_406 = {
  T.RT_379
}
T.RT_407 = {
  NextStateId = 704010,
  TypeNextState = T.RT_4
}
T.RT_408 = {
  T.RT_206,
  T.RT_341
}
T.RT_409 = {
  NextStateId = 704020,
  TypeNextState = T.RT_4
}
T.RT_410 = {
  NextStateId = 704031,
  TypeNextState = T.RT_4
}
T.RT_411 = {
  NextStateId = 704032,
  TypeNextState = T.RT_4
}
T.RT_412 = {
  NextStateId = 704033,
  TypeNextState = T.RT_4
}
T.RT_413 = {
  NextStateId = 704034,
  TypeNextState = T.RT_4
}
T.RT_414 = {
  NextStateId = 704030,
  TypeNextState = T.RT_4
}
T.RT_415 = {Function = "StopFX", Tag = "Die"}
T.RT_416 = {
  NextStateId = 705033,
  TypeNextState = T.RT_4
}
T.RT_417 = {
  [1] = T.RT_416
}
T.RT_418 = {
  Type = "LeaveTriggerBox"
}
T.RT_419 = {
  NextStateId = 708001,
  TypeNextState = T.RT_3
}
T.RT_420 = {
  [1] = T.RT_419
}
T.RT_421 = {
  EffectId = 231,
  Function = "PlayFX",
  Tag = "inter"
}
T.RT_422 = {
  T.RT_421
}
T.RT_423 = {Function = "StopFX", Tag = "Inter"}
T.RT_424 = {
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Idle"
}
T.RT_425 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Start"
}
T.RT_426 = {
  T.RT_425
}
T.RT_427 = {
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "Loop"
}
T.RT_428 = {
  T.RT_427,
  T.RT_294,
  T.RT_20
}
T.RT_429 = {
  CallBackName = "OnStart",
  Function = "PlayMontage",
  Mesh = "Mesh_0",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
  SectionName = "End"
}
T.RT_430 = {
  T.RT_429,
  T.RT_300
}
T.RT_431 = {
  T.RT_300,
  T.RT_22
}
T.RT_432 = {
  EventsNextState = T.RT_378,
  NextStateId = 780080,
  TypeNextState = T.RT_4
}
T.RT_433 = {
  [1] = T.RT_432
}
T.RT_434 = {
  Function = "PlayMontage",
  Mesh = "Mesh",
  MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/Dyn_Minigame_Tanceqi.Dyn_Minigame_Tanceqi'",
  SectionName = "Idle"
}
T.RT_435 = {
  T.RT_434
}
T.RT_436 = {
  NextStateId = 780100,
  TypeNextState = T.RT_4
}
T.RT_437 = {
  [1] = T.RT_436
}
T.RT_438 = {
  NextStateId = 780162,
  TypeNextState = T.RT_4
}
T.RT_439 = {
  [1] = T.RT_438
}
T.RT_440 = {
  NextStateId = 801130,
  TypeNextState = T.RT_4
}
T.RT_441 = {
  NextStateId = 810010,
  TypeNextState = T.RT_4
}
T.RT_442 = {
  [1] = T.RT_441
}
T.RT_443 = {ConditionID = 20021501, Type = "Condition"}
T.RT_444 = {
  NextStateId = 9020001,
  TypeNextState = T.RT_443
}
T.RT_445 = {
  [1] = T.RT_444
}
T.RT_446 = {
  NextStateId = 904,
  TypeNextState = T.RT_4
}
T.RT_447 = {
  T.RT_11
}
T.RT_448 = {
  NextStateId = 9043,
  TypeNextState = T.RT_4
}
T.RT_449 = {
  [1] = T.RT_448
}
T.RT_450 = {
  NextStateId = 90430,
  TypeNextState = T.RT_4
}
T.RT_451 = {
  NextStateId = 90432,
  TypeNextState = T.RT_4
}
T.RT_452 = {
  NextStateId = 90434,
  TypeNextState = T.RT_4
}
T.RT_453 = {
  NextStateId = 90436,
  TypeNextState = T.RT_4
}
T.RT_454 = {
  NextStateId = 90438,
  TypeNextState = T.RT_4
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MechanismState", {
  [1] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 3,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 2,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1
  },
  [2] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 1,
        TypeNextState = T.RT_4
      }
    },
    StateId = 2
  },
  [3] = {
    EventsCurrentState = T.RT_89,
    StateId = 3
  },
  [4] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 5,
        TypeNextState = T.RT_278
      }
    },
    StateId = 4
  },
  [5] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 4,
        TypeNextState = T.RT_198
      }
    },
    StateId = 5
  },
  [6] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_354,
        NextStateId = 7,
        TypeNextState = T.RT_278
      }
    },
    StateId = 6
  },
  [7] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_378,
        NextStateId = 6,
        TypeNextState = T.RT_198
      }
    },
    StateId = 7
  },
  [10] = {
    StateEvent = {
      [1] = {
        NextStateId = 11,
        TypeNextState = T.RT_3
      }
    },
    StateId = 10
  },
  [11] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 10,
        TypeNextState = T.RT_10
      }
    },
    StateId = 11
  },
  [12] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_148
    },
    StateId = 12
  },
  [13] = {
    EventsCurrentState = T.RT_157,
    StateEvent = {
      [1] = {
        NextStateId = 14,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_158
    },
    StateId = 13
  },
  [14] = {
    EventsCurrentState = {
      T.RT_11,
      T.RT_20
    },
    StateEvent = {
      [1] = T.RT_148,
      [2] = T.RT_158
    },
    StateId = 14
  },
  [15] = {
    EventsCurrentState = T.RT_23,
    StateId = 15
  },
  [25] = {
    EventsCurrentState = T.RT_190,
    StateEvent = T.RT_192,
    StateId = 25
  },
  [26] = {
    EventsCurrentState = {
      T.RT_1,
      {
        Function = "SetBubbleWidget",
        Show = true
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 27,
        TypeNextState = T.RT_3
      }
    },
    StateId = 26
  },
  [27] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = T.RT_10
      }
    },
    StateId = 27
  },
  [28] = {
    EventsCurrentState = T.RT_193,
    StateEvent = {
      [1] = {
        NextStateId = 29,
        TypeNextState = T.RT_3
      }
    },
    StateId = 28
  },
  [29] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 28,
        TypeNextState = T.RT_10
      }
    },
    StateId = 29
  },
  [30] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          {
            EffectId = 200,
            Function = "PlayFX",
            NeedFinish = true,
            Tag = "NiagaraA"
          }
        },
        NextStateId = 31,
        TypeNextState = T.RT_3
      }
    },
    StateId = 30
  },
  [31] = {
    EventsCurrentState = {
      T.RT_17,
      {
        EffectId = 201,
        Function = "PlayFX",
        Tag = "NiagaraB"
      }
    },
    StateId = 31
  },
  [32] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_195
        },
        NextStateId = 33,
        TypeNextState = T.RT_3
      }
    },
    StateId = 32
  },
  [33] = {
    EventsCurrentState = T.RT_89,
    StateId = 33
  },
  [34] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 35,
        TypeNextState = T.RT_196
      }
    },
    StateId = 34
  },
  [35] = {
    EventsCurrentState = T.RT_89,
    StateId = 35
  },
  [36] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 34,
        TypeNextState = T.RT_174
      }
    },
    StateId = 36
  },
  [37] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 39,
        TypeNextState = {
          InteractiveId = 909,
          StateChangeParam = false,
          Type = "Interactive"
        }
      }
    },
    StateId = 37
  },
  [38] = {
    EventsCurrentState = T.RT_89,
    StateId = 38
  },
  [39] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 37,
        TypeNextState = T.RT_174
      }
    },
    StateId = 39
  },
  [40] = {
    StateEvent = {
      [1] = {
        NextStateId = 41,
        TypeNextState = T.RT_196
      },
      [2] = {
        NextStateId = 42,
        TypeNextState = T.RT_279
      }
    },
    StateId = 40
  },
  [41] = {
    EventsCurrentState = T.RT_89,
    StateId = 41
  },
  [42] = {
    EventsCurrentState = T.RT_89,
    StateId = 42
  },
  [43] = {
    StateEvent = {
      [1] = {
        NextStateId = 44,
        TypeNextState = T.RT_279
      }
    },
    StateId = 43
  },
  [44] = {
    EventsCurrentState = T.RT_89,
    StateId = 44
  },
  [45] = {
    EventsCurrentState = {
      T.RT_183,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        NextStateId = 46,
        TypeNextState = T.RT_4
      }
    },
    StateId = 45
  },
  [46] = {
    EventsCurrentState = T.RT_186,
    StateId = 46
  },
  [52] = {
    EventsCurrentState = T.RT_193,
    StateEvent = {
      [1] = {
        NextStateId = 53,
        TypeNextState = T.RT_198
      }
    },
    StateId = 52
  },
  [53] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 52,
        TypeNextState = T.RT_230
      }
    },
    StateId = 53
  },
  [54] = {
    EventsCurrentState = {
      T.RT_324
    },
    StateEvent = {
      [1] = {
        NextStateId = 55,
        TypeNextState = T.RT_198
      }
    },
    StateId = 54
  },
  [55] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/JH_MiniGame_Montage.JH_MiniGame_Montage'",
        SectionName = "Start"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 56,
        TypeNextState = T.RT_3
      }
    },
    StateId = 55
  },
  [56] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_291
    },
    StateEvent = {
      [1] = {
        NextStateId = 55,
        TypeNextState = T.RT_10
      }
    },
    StateId = 56
  },
  [57] = {
    EventsCurrentState = {
      {
        EffectId = 208,
        Function = "PlayFX",
        Tag = "ABC"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 58,
        TypeNextState = T.RT_259
      }
    },
    StateId = 57
  },
  [58] = {
    EventsCurrentState = {
      {Function = "StopFX", Tag = "ABC"},
      T.RT_341
    },
    StateEvent = {
      [1] = {
        NextStateId = 59,
        TypeNextState = T.RT_3
      }
    },
    StateId = 58
  },
  [59] = {
    EventsCurrentState = T.RT_89,
    StateId = 59
  },
  [60] = {StateId = 60},
  [61] = {
    EventsCurrentState = {
      T.RT_329
    },
    StateEvent = {
      [1] = {
        NextStateId = 62,
        TypeNextState = T.RT_198
      }
    },
    StateId = 61
  },
  [62] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/DG_MiniGame_Montage.DG_MiniGame_Montage'",
        SectionName = "Start"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 63,
        TypeNextState = T.RT_3
      }
    },
    StateId = 62
  },
  [63] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_342
    },
    StateEvent = {
      [1] = {
        NextStateId = 62,
        TypeNextState = T.RT_10
      }
    },
    StateId = 63
  },
  [64] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 65,
        TypeNextState = T.RT_3
      }
    },
    StateId = 64
  },
  [65] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_22
    },
    StateId = 65
  },
  [66] = {
    StateEvent = {
      [1] = {
        NextStateId = 67,
        TypeNextState = T.RT_4
      }
    },
    StateId = 66
  },
  [67] = {
    StateEvent = {
      [1] = {
        NextStateId = 66,
        TypeNextState = T.RT_4
      }
    },
    StateId = 67
  },
  [100] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_6,
        NextStateId = 101,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 102,
        TypeNextState = T.RT_4
      }
    },
    StateId = 100
  },
  [101] = {
    StateEvent = {
      [1] = {
        NextStateId = 100,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 102,
        TypeNextState = T.RT_8
      }
    },
    StateId = 101
  },
  [102] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_9
    },
    StateEvent = {
      [1] = {
        NextStateId = 100,
        TypeNextState = T.RT_10
      }
    },
    StateId = 102
  },
  [238] = {
    StateEvent = {
      [1] = {
        NextStateId = 239,
        TypeNextState = T.RT_4
      }
    },
    StateId = 238
  },
  [239] = {
    EventsCurrentState = {
      T.RT_99,
      T.RT_75
    },
    StateId = 239
  },
  [240] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_75
    },
    StateEvent = {
      [1] = {
        NextStateId = 241,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 243,
        TypeNextState = T.RT_4
      }
    },
    StateId = 240
  },
  [241] = {
    EventsCurrentState = T.RT_179,
    StateEvent = {
      [1] = T.RT_180,
      [2] = {
        NextStateId = 240,
        TypeNextState = {
          InteractiveId = 911,
          StateChangeParam = true,
          Type = "Interactive"
        }
      }
    },
    StateId = 241
  },
  [242] = {
    EventsCurrentState = {
      T.RT_181
    },
    StateEvent = {
      [1] = {
        NextStateId = 240,
        TypeNextState = T.RT_182
      }
    },
    StateId = 242
  },
  [243] = {
    EventsCurrentState = T.RT_179,
    StateEvent = {
      [1] = T.RT_180,
      [2] = {
        NextStateId = 240,
        TypeNextState = {
          InteractiveId = 913,
          StateChangeParam = true,
          Type = "Interactive"
        }
      }
    },
    StateId = 243
  },
  [244] = {
    EventsCurrentState = T.RT_184,
    StateEvent = {
      [1] = {
        NextStateId = 245,
        TypeNextState = T.RT_4
      }
    },
    StateId = 244
  },
  [245] = {
    EventsCurrentState = T.RT_186,
    StateEvent = {
      [1] = T.RT_187
    },
    StateId = 245
  },
  [246] = {
    EventsCurrentState = T.RT_184,
    StateEvent = {
      [1] = {
        NextStateId = 245,
        TypeNextState = T.RT_188
      },
      [2] = T.RT_187
    },
    StateId = 246
  },
  [300] = {
    EventsCurrentState = {
      T.RT_1,
      {
        EffectId = 10199001,
        Function = "PlayFX",
        Tag = "Fire"
      }
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_6,
        NextStateId = 301,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 302,
        TypeNextState = T.RT_4
      }
    },
    StateId = 300
  },
  [301] = {
    StateEvent = {
      [1] = {
        NextStateId = 300,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 302,
        TypeNextState = T.RT_8
      }
    },
    StateId = 301
  },
  [302] = {
    EventsCurrentState = {
      T.RT_194,
      T.RT_9,
      {Function = "StopFX", Tag = "Fire"}
    },
    StateId = 302
  },
  [500] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = {
        NextStateId = 502,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_317
    },
    StateId = 500
  },
  [501] = {
    EventsCurrentState = T.RT_318,
    StateEvent = {
      [1] = {
        NextStateId = 502,
        TypeNextState = T.RT_24
      },
      [2] = T.RT_319
    },
    StateId = 501
  },
  [502] = {
    EventsCurrentState = T.RT_320,
    StateEvent = {
      [1] = {
        NextStateId = 503,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_319
    },
    StateId = 502
  },
  [503] = {
    EventsCurrentState = T.RT_157,
    StateEvent = {
      [1] = {
        NextStateId = 502,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 504,
        TypeNextState = T.RT_8
      }
    },
    StateId = 503
  },
  [504] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = T.RT_317,
      [2] = T.RT_319
    },
    StateId = 504
  },
  [510] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = {
        NextStateId = 512,
        TypeNextState = T.RT_4
      }
    },
    StateId = 510
  },
  [511] = {
    EventsCurrentState = T.RT_318,
    StateEvent = {
      [1] = {
        NextStateId = 512,
        TypeNextState = T.RT_24
      },
      [2] = T.RT_321
    },
    StateId = 511
  },
  [512] = {
    EventsCurrentState = T.RT_320,
    StateEvent = {
      [1] = {
        NextStateId = 513,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_321
    },
    StateId = 512
  },
  [513] = {
    EventsCurrentState = T.RT_157,
    StateEvent = {
      [1] = {
        NextStateId = 512,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 514,
        TypeNextState = T.RT_8
      }
    },
    StateId = 513
  },
  [514] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = {
        NextStateId = 511,
        TypeNextState = T.RT_173
      }
    },
    StateId = 514
  },
  [515] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = {
        NextStateId = 511,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_321
    },
    StateId = 515
  },
  [541] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_57,
      T.RT_324,
      T.RT_287,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_326,
        NextStateId = 551,
        TypeNextState = T.RT_198
      },
      [2] = T.RT_327
    },
    StateId = 541
  },
  [542] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 552,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_328
    },
    StateId = 542
  },
  [543] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_57,
      T.RT_329,
      T.RT_298,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_331,
        NextStateId = 553,
        TypeNextState = T.RT_24
      },
      [2] = {
        NextStateId = 583,
        TypeNextState = T.RT_4
      }
    },
    StateId = 543
  },
  [551] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_57,
      T.RT_282,
      T.RT_289,
      T.RT_283,
      T.RT_20
    },
    StateEvent = {
      [1] = {
        NextStateId = 561,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_327
    },
    StateId = 551
  },
  [552] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_57
    },
    StateEvent = {
      [1] = {
        NextStateId = 562,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_328
    },
    StateId = 552
  },
  [553] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_57,
      T.RT_293,
      T.RT_300,
      T.RT_294,
      T.RT_20
    },
    StateEvent = {
      [1] = {
        NextStateId = 563,
        TypeNextState = T.RT_3
      }
    },
    StateId = 553
  },
  [561] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 551,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_285,
        NextStateId = 571,
        TypeNextState = T.RT_8
      }
    },
    StateId = 561
  },
  [562] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 552,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 572,
        TypeNextState = T.RT_8
      }
    },
    StateId = 562
  },
  [563] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 553,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_296,
        NextStateId = 573,
        TypeNextState = T.RT_8
      }
    },
    StateId = 563
  },
  [571] = {
    EventsCurrentState = T.RT_334,
    StateEvent = {
      [1] = T.RT_335,
      [2] = T.RT_327
    },
    StateId = 571
  },
  [572] = {
    EventsCurrentState = T.RT_336,
    StateEvent = {
      [1] = T.RT_337,
      [2] = T.RT_328
    },
    StateId = 572
  },
  [573] = {
    EventsCurrentState = T.RT_338,
    StateEvent = T.RT_340,
    StateId = 573
  },
  [581] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_9,
      T.RT_291,
      T.RT_289,
      T.RT_287,
      T.RT_22
    },
    StateEvent = {
      [1] = T.RT_335
    },
    StateId = 581
  },
  [582] = {
    EventsCurrentState = T.RT_336,
    StateEvent = {
      [1] = T.RT_337
    },
    StateId = 582
  },
  [583] = {
    EventsCurrentState = {
      T.RT_342,
      T.RT_9,
      T.RT_300,
      T.RT_298,
      T.RT_22
    },
    StateEvent = T.RT_340,
    StateId = 583
  },
  [600] = {
    EventsCurrentState = T.RT_316,
    StateEvent = {
      [1] = {
        NextStateId = 602,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_355
    },
    StateId = 600
  },
  [601] = {
    EventsCurrentState = T.RT_318,
    StateEvent = {
      [1] = {
        NextStateId = 602,
        TypeNextState = T.RT_24
      },
      [2] = T.RT_356
    },
    StateId = 601
  },
  [602] = {
    EventsCurrentState = T.RT_320,
    StateEvent = {
      [1] = {
        NextStateId = 603,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_356
    },
    StateId = 602
  },
  [603] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 602,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 604,
        TypeNextState = T.RT_8
      }
    },
    StateId = 603
  },
  [604] = {
    EventsCurrentState = T.RT_357,
    StateEvent = {
      [1] = T.RT_355,
      [2] = T.RT_356
    },
    StateId = 604
  },
  [900] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 901,
        TypeNextState = T.RT_4
      }
    },
    StateId = 900
  },
  [901] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 900,
        TypeNextState = T.RT_4
      }
    },
    StateId = 901
  },
  [902] = {
    StateEvent = {
      [1] = {
        NextStateId = 903,
        TypeNextState = T.RT_4
      }
    },
    StateId = 902
  },
  [903] = {
    StateEvent = {
      [1] = T.RT_446
    },
    StateId = 903
  },
  [904] = {
    EventsCurrentState = T.RT_447,
    StateEvent = {
      [1] = {
        NextStateId = 905,
        TypeNextState = T.RT_14
      },
      [2] = {
        NextStateId = 907,
        TypeNextState = T.RT_4
      }
    },
    StateId = 904
  },
  [905] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 904,
        TypeNextState = T.RT_14
      },
      [2] = {
        NextStateId = 906,
        TypeNextState = T.RT_4
      }
    },
    StateId = 905
  },
  [906] = {
    EventsCurrentState = T.RT_447,
    StateEvent = {
      [1] = {
        NextStateId = 907,
        TypeNextState = T.RT_14
      },
      [2] = {
        NextStateId = 905,
        TypeNextState = T.RT_4
      }
    },
    StateId = 906
  },
  [907] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 906,
        TypeNextState = T.RT_14
      },
      [2] = T.RT_446
    },
    StateId = 907
  },
  [908] = {
    EventsCurrentState = {
      T.RT_11,
      T.RT_19
    },
    StateEvent = {
      [1] = {
        NextStateId = 909,
        TypeNextState = T.RT_4
      }
    },
    StateId = 908
  },
  [909] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_12
    },
    StateEvent = {
      [1] = {
        NextStateId = 908,
        TypeNextState = T.RT_4
      }
    },
    StateId = 909
  },
  [1801] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 1802,
        TypeNextState = T.RT_3
      }
    },
    StateId = 1801
  },
  [1802] = {
    EventsCurrentState = T.RT_89,
    StateId = 1802
  },
  [2501] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 310, Type = "Condition"}
      }
    },
    StateId = 2501
  },
  [2502] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 311, Type = "Condition"}
      }
    },
    StateId = 2502
  },
  [2503] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 312, Type = "Condition"}
      }
    },
    StateId = 2503
  },
  [2504] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 313, Type = "Condition"}
      }
    },
    StateId = 2504
  },
  [2505] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 314, Type = "Condition"}
      }
    },
    StateId = 2505
  },
  [2506] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 315, Type = "Condition"}
      }
    },
    StateId = 2506
  },
  [2507] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 316, Type = "Condition"}
      }
    },
    StateId = 2507
  },
  [2508] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 317, Type = "Condition"}
      }
    },
    StateId = 2508
  },
  [2509] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 318, Type = "Condition"}
      }
    },
    StateId = 2509
  },
  [2510] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 319, Type = "Condition"}
      }
    },
    StateId = 2510
  },
  [2511] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 320, Type = "Condition"}
      }
    },
    StateId = 2511
  },
  [2512] = {
    EventsCurrentState = T.RT_190,
    StateEvent = {
      [1] = {
        NextStateId = 26,
        TypeNextState = {ConditionID = 321, Type = "Condition"}
      }
    },
    StateId = 2512
  },
  [2513] = {
    EventsCurrentState = T.RT_190,
    StateEvent = T.RT_192,
    StateId = 2513
  },
  [5431] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_57,
      T.RT_329,
      T.RT_9,
      T.RT_22,
      T.RT_300,
      T.RT_298
    },
    StateEvent = {
      [1] = T.RT_332,
      [2] = {
        NextStateId = 5731,
        TypeNextState = T.RT_4
      }
    },
    StateId = 5431
  },
  [5531] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_57,
      T.RT_293,
      T.RT_300,
      T.RT_294,
      T.RT_298,
      T.RT_20
    },
    StateEvent = {
      [1] = {
        NextStateId = 5731,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_333
    },
    StateId = 5531
  },
  [5731] = {
    EventsCurrentState = T.RT_338,
    StateEvent = {
      [1] = T.RT_333,
      [2] = T.RT_332
    },
    StateId = 5731
  },
  [9041] = {
    StateEvent = {
      [1] = {
        NextStateId = 9042,
        TypeNextState = T.RT_4
      }
    },
    StateId = 9041
  },
  [9042] = {StateId = 9042},
  [9043] = {
    StateEvent = {
      [1] = {
        TypeNextState = T.RT_4
      }
    },
    StateId = 9043
  },
  [9044] = {
    StateEvent = {
      [1] = {
        NextStateId = 9045,
        TypeNextState = {
          InteractiveId = 118,
          Type = "Interactive"
        }
      }
    },
    StateId = 9044
  },
  [9045] = {StateId = 9045},
  [90430] = {
    StateEvent = T.RT_449,
    StateId = 90430
  },
  [90432] = {
    StateEvent = T.RT_449,
    StateId = 90432
  },
  [90434] = {
    StateEvent = T.RT_449,
    StateId = 90434
  },
  [90436] = {
    StateEvent = T.RT_449,
    StateId = 90436
  },
  [90438] = {
    StateEvent = T.RT_449,
    StateId = 90438
  },
  [104010] = {
    EventsCurrentState = {
      T.RT_11,
      T.RT_12,
      T.RT_13
    },
    StateEvent = {
      [1] = {
        NextStateId = 104011,
        TypeNextState = T.RT_14
      },
      [2] = T.RT_15,
      [3] = T.RT_16
    },
    StateId = 104010
  },
  [104011] = {
    EventsCurrentState = T.RT_18,
    StateEvent = {
      [1] = {
        NextStateId = 104010,
        TypeNextState = T.RT_14
      },
      [2] = T.RT_15,
      [3] = T.RT_16
    },
    StateId = 104011
  },
  [104012] = {
    EventsCurrentState = {
      T.RT_11,
      T.RT_19,
      T.RT_20
    },
    StateEvent = {
      [1] = T.RT_21,
      [2] = T.RT_16
    },
    StateId = 104012
  },
  [104013] = {
    EventsCurrentState = {
      T.RT_11,
      {
        DoorType = 2,
        Function = "SetConditionDoorState"
      },
      T.RT_22
    },
    StateEvent = {
      [1] = T.RT_21,
      [2] = T.RT_15
    },
    StateId = 104013
  },
  [104070] = {
    EventsCurrentState = T.RT_23,
    StateEvent = {
      [1] = {
        NextStateId = 104071,
        TypeNextState = T.RT_4
      }
    },
    StateId = 104070
  },
  [104071] = {
    EventsCurrentState = T.RT_18,
    StateEvent = {
      [1] = {
        NextStateId = 104070,
        TypeNextState = T.RT_4
      }
    },
    StateId = 104071
  },
  [105010] = {
    StateEvent = {
      [1] = {
        NextStateId = 105011,
        TypeNextState = T.RT_24
      }
    },
    StateId = 105010
  },
  [105011] = {
    StateEvent = {
      [1] = {
        NextStateId = 105012,
        TypeNextState = T.RT_25
      }
    },
    StateId = 105011
  },
  [105012] = {
    StateEvent = {
      [1] = {
        NextStateId = 105010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 105012
  },
  [106050] = {
    StateEvent = {
      [1] = {
        NextStateId = 106051,
        TypeNextState = T.RT_4
      }
    },
    StateId = 106050
  },
  [106051] = {StateId = 106051},
  [108010] = {
    StateEvent = {
      [1] = {
        NextStateId = 108011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 108010
  },
  [108011] = {
    StateEvent = {
      [1] = {
        NextStateId = 108010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 108011
  },
  [109010] = {
    EventsCurrentState = T.RT_87,
    StateEvent = {
      [1] = {
        NextStateId = 109011,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 109013,
        TypeNextState = T.RT_4
      }
    },
    StateId = 109010
  },
  [109011] = {
    StateEvent = {
      [1] = T.RT_88,
      [2] = {
        NextStateId = 109012,
        TypeNextState = T.RT_3
      }
    },
    StateId = 109011
  },
  [109012] = {
    StateEvent = {
      [1] = T.RT_88,
      [2] = {
        NextStateId = 109011,
        TypeNextState = T.RT_3
      }
    },
    StateId = 109012
  },
  [109013] = {
    StateEvent = {
      [1] = T.RT_88,
      [2] = {
        NextStateId = 109014,
        TypeNextState = T.RT_3
      }
    },
    StateId = 109013
  },
  [109014] = {
    StateEvent = {
      [1] = T.RT_88
    },
    StateId = 109014
  },
  [110080] = {
    StateEvent = {
      [1] = {
        NextStateId = 110081,
        TypeNextState = T.RT_4
      }
    },
    StateId = 110080
  },
  [110081] = {
    StateEvent = {
      [1] = {
        NextStateId = 110080,
        TypeNextState = T.RT_4
      }
    },
    StateId = 110081
  },
  [111010] = {
    EventsCurrentState = T.RT_31,
    StateEvent = {
      [1] = T.RT_90,
      [2] = {
        NextStateId = 111013,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 111015,
        TypeNextState = T.RT_4
      }
    },
    StateId = 111010
  },
  [111011] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_91,
      [2] = {
        NextStateId = 111012,
        TypeNextState = T.RT_92
      }
    },
    StateId = 111011
  },
  [111012] = {
    EventsCurrentState = T.RT_93,
    StateEvent = {
      [1] = T.RT_91,
      [2] = T.RT_90
    },
    StateId = 111012
  },
  [111013] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_91,
      [2] = T.RT_94
    },
    StateId = 111013
  },
  [111014] = {
    EventsCurrentState = T.RT_93,
    StateEvent = {
      [1] = T.RT_91,
      [2] = T.RT_96,
      [3] = {
        NextStateId = 111015,
        TypeNextState = T.RT_92
      },
      [4] = T.RT_97
    },
    StateId = 111014
  },
  [111015] = {
    EventsCurrentState = T.RT_93,
    StateEvent = {
      [1] = T.RT_91,
      [2] = T.RT_96,
      [3] = T.RT_94,
      [4] = T.RT_97
    },
    StateId = 111015
  },
  [111016] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 111017,
        TypeNextState = T.RT_92
      }
    },
    StateId = 111016
  },
  [111017] = {
    EventsCurrentState = T.RT_31,
    StateEvent = {
      [1] = {
        NextStateId = 111016,
        TypeNextState = T.RT_4
      }
    },
    StateId = 111017
  },
  [111020] = {
    EventsCurrentState = T.RT_50,
    StateEvent = {
      [1] = {
        NextStateId = 111021,
        TypeNextState = T.RT_4
      }
    },
    StateId = 111020
  },
  [111021] = {
    EventsCurrentState = T.RT_50,
    StateEvent = {
      [1] = T.RT_98,
      [2] = {
        NextStateId = 111022,
        TypeNextState = {
          NeedCountDown = true,
          Param = 30,
          Type = "Time"
        }
      }
    },
    StateId = 111021
  },
  [111022] = {
    EventsCurrentState = {
      T.RT_20,
      T.RT_99
    },
    StateEvent = {
      [1] = T.RT_98,
      [2] = {
        NextStateId = 111023,
        TypeNextState = T.RT_92
      }
    },
    StateId = 111022
  },
  [111023] = {
    EventsCurrentState = T.RT_93,
    StateEvent = {
      [1] = T.RT_98
    },
    StateId = 111023
  },
  [111030] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = {
        NextStateId = 111031,
        TypeNextState = T.RT_4
      }
    },
    StateId = 111030
  },
  [111031] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 111032,
        TypeNextState = T.RT_92
      },
      [2] = T.RT_100
    },
    StateId = 111031
  },
  [111032] = {
    EventsCurrentState = T.RT_31,
    StateEvent = {
      [1] = {
        NextStateId = 111033,
        TypeNextState = T.RT_101
      },
      [2] = T.RT_100
    },
    StateId = 111032
  },
  [111033] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 111034,
        TypeNextState = T.RT_92
      },
      [2] = T.RT_100
    },
    StateId = 111033
  },
  [111034] = {
    EventsCurrentState = T.RT_93,
    StateEvent = {
      [1] = {
        NextStateId = 111031,
        TypeNextState = T.RT_101
      },
      [2] = T.RT_100
    },
    StateId = 111034
  },
  [111040] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 111041,
        TypeNextState = T.RT_4
      }
    },
    StateId = 111040
  },
  [111041] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = T.RT_102,
      [2] = T.RT_103
    },
    StateId = 111041
  },
  [111042] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_102,
      [2] = T.RT_104,
      [3] = {
        NextStateId = 111043,
        TypeNextState = T.RT_92
      }
    },
    StateId = 111042
  },
  [111043] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_102,
      [2] = T.RT_104,
      [3] = T.RT_103
    },
    StateId = 111043
  },
  [112010] = {
    EventsCurrentState = T.RT_105,
    StateEvent = {
      [1] = {
        NextStateId = 112011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 112010
  },
  [112011] = {
    EventsCurrentState = T.RT_106,
    StateEvent = {
      [1] = T.RT_107,
      [2] = {
        NextStateId = 112012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 112011
  },
  [112012] = {
    EventsCurrentState = T.RT_105,
    StateEvent = {
      [1] = T.RT_107,
      [2] = {
        NextStateId = 112013,
        TypeNextState = T.RT_4
      }
    },
    StateId = 112012
  },
  [112013] = {
    EventsCurrentState = T.RT_105,
    StateId = 112013
  },
  [115010] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 115011,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 115012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 115010
  },
  [115011] = {StateId = 115011},
  [115012] = {StateId = 115012},
  [116010] = {
    StateEvent = {
      [1] = T.RT_122,
      [2] = T.RT_123,
      [3] = T.RT_124,
      [4] = T.RT_125,
      [5] = T.RT_126
    },
    StateId = 116010
  },
  [116011] = {
    StateEvent = {
      [1] = T.RT_127,
      [2] = T.RT_123,
      [3] = T.RT_124,
      [4] = T.RT_125,
      [5] = T.RT_126
    },
    StateId = 116011
  },
  [116012] = {
    StateEvent = {
      [1] = T.RT_127,
      [2] = T.RT_122,
      [3] = T.RT_124,
      [4] = T.RT_125,
      [5] = T.RT_126
    },
    StateId = 116012
  },
  [116013] = {
    StateEvent = {
      [1] = T.RT_127,
      [2] = T.RT_122,
      [3] = T.RT_123,
      [4] = T.RT_125,
      [5] = T.RT_126
    },
    StateId = 116013
  },
  [116014] = {
    StateEvent = {
      [1] = T.RT_127,
      [2] = T.RT_122,
      [3] = T.RT_123,
      [4] = T.RT_124,
      [5] = T.RT_126
    },
    StateId = 116014
  },
  [116015] = {
    StateEvent = {
      [1] = T.RT_127,
      [2] = T.RT_122,
      [3] = T.RT_123,
      [4] = T.RT_124,
      [5] = T.RT_125
    },
    StateId = 116015
  },
  [118001] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = T.RT_129,
      [2] = T.RT_130,
      [3] = {
        NextStateId = 118005,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118001
  },
  [118002] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 118003,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_130
    },
    StateId = 118002
  },
  [118003] = {
    EventsCurrentState = T.RT_132,
    StateEvent = {
      [1] = T.RT_133,
      [2] = T.RT_130,
      [3] = T.RT_129
    },
    StateId = 118003
  },
  [118004] = {
    EventsCurrentState = T.RT_36,
    StateEvent = T.RT_134,
    StateId = 118004
  },
  [118005] = {
    EventsCurrentState = T.RT_132,
    StateEvent = T.RT_134,
    StateId = 118005
  },
  [118010] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = T.RT_135,
      [2] = T.RT_136
    },
    StateId = 118010
  },
  [118011] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 118012,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_137,
      [3] = T.RT_136
    },
    StateId = 118011
  },
  [118012] = {
    EventsCurrentState = T.RT_138,
    StateEvent = T.RT_140,
    StateId = 118012
  },
  [118013] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 118014,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_137
    },
    StateId = 118013
  },
  [118014] = {
    EventsCurrentState = T.RT_138,
    StateEvent = T.RT_140,
    StateId = 118014
  },
  [118015] = {
    EventsCurrentState = T.RT_132,
    StateId = 118015
  },
  [118016] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 118017,
        TypeNextState = T.RT_14
      }
    },
    StateId = 118016
  },
  [118017] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = {
        NextStateId = 118016,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118017
  },
  [118018] = {
    StateEvent = {
      [1] = {
        NextStateId = 118019,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118018
  },
  [118019] = {
    StateEvent = {
      [1] = {
        NextStateId = 118018,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 118020,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118019
  },
  [118020] = {StateId = 118020},
  [118021] = {
    StateEvent = {
      [1] = {
        NextStateId = 118022,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118021
  },
  [118022] = {StateId = 118022},
  [118023] = {
    EventsCurrentState = T.RT_142,
    StateEvent = {
      [1] = {
        NextStateId = 118024,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118023
  },
  [118024] = {
    EventsCurrentState = T.RT_144,
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_145
        },
        NextStateId = 118025,
        TypeNextState = T.RT_4
      }
    },
    StateId = 118024
  },
  [118025] = {
    EventsCurrentState = T.RT_147,
    StateId = 118025
  },
  [118026] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 118010,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_135
    },
    StateId = 118026
  },
  [390011] = {
    EventsCurrentState = T.RT_151,
    StateId = 390011
  },
  [390012] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 390011,
        TypeNextState = T.RT_198
      }
    },
    StateId = 390012
  },
  [390060] = {
    EventsCurrentState = T.RT_210,
    StateEvent = {
      [1] = {
        NextStateId = 390061,
        TypeNextState = T.RT_4
      }
    },
    StateId = 390060
  },
  [390061] = {
    EventsCurrentState = T.RT_211,
    StateId = 390061
  },
  [492061] = {
    StateEvent = {
      [1] = {
        NextStateId = 492062,
        TypeNextState = T.RT_4
      }
    },
    StateId = 492061
  },
  [492062] = {
    EventsCurrentState = T.RT_147,
    StateId = 492062
  },
  [493011] = {
    EventsCurrentState = {
      T.RT_141,
      T.RT_13
    },
    StateEvent = {
      [1] = {
        NextStateId = 493012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 493011
  },
  [493012] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = {
        NextStateId = 493013,
        TypeNextState = {Param = 3.5, Type = "Time"}
      }
    },
    StateId = 493012
  },
  [493013] = {
    EventsCurrentState = {
      T.RT_143,
      T.RT_35
    },
    StateId = 493013
  },
  [494000] = {
    EventsCurrentState = {
      T.RT_311
    },
    StateEvent = T.RT_313,
    StateId = 494000
  },
  [494001] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 494002,
        TypeNextState = T.RT_3
      }
    },
    StateId = 494001
  },
  [494002] = {
    EventsCurrentState = T.RT_314,
    StateEvent = T.RT_313,
    StateId = 494002
  },
  [494003] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_311
    },
    StateEvent = {
      [1] = {
        NextStateId = 494004,
        TypeNextState = T.RT_3
      }
    },
    StateId = 494003
  },
  [494004] = {
    EventsCurrentState = T.RT_314,
    StateEvent = {
      [1] = {
        NextStateId = 494003,
        TypeNextState = T.RT_4
      }
    },
    StateId = 494004
  },
  [495000] = {
    StateEvent = {
      [1] = {
        NextStateId = 495001,
        TypeNextState = T.RT_4
      }
    },
    StateId = 495000
  },
  [495001] = {
    StateEvent = {
      [1] = {
        NextStateId = 495002,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_315
    },
    StateId = 495001
  },
  [495002] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 495003,
        TypeNextState = T.RT_8
      },
      [2] = {
        NextStateId = 495001,
        TypeNextState = T.RT_7
      }
    },
    StateId = 495002
  },
  [495003] = {
    EventsCurrentState = T.RT_87,
    StateEvent = {
      [1] = {
        NextStateId = 495004,
        TypeNextState = T.RT_48
      }
    },
    StateId = 495003
  },
  [495004] = {
    StateEvent = {
      [1] = T.RT_315
    },
    StateId = 495004
  },
  [496001] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 496002,
        TypeNextState = T.RT_198
      }
    },
    StateId = 496001
  },
  [496002] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 496003,
        TypeNextState = T.RT_4
      }
    },
    StateId = 496002
  },
  [496003] = {
    EventsCurrentState = T.RT_141,
    StateId = 496003
  },
  [496031] = {
    EventsCurrentState = T.RT_227,
    StateEvent = {
      [1] = {
        NextStateId = 496032,
        TypeNextState = {
          ActiveRange = 7000,
          Type = "DistanceActive"
        }
      }
    },
    StateId = 496031
  },
  [496032] = {
    EventsCurrentState = T.RT_229,
    StateEvent = {
      [1] = {
        NextStateId = 496031,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_228
    },
    StateId = 496032
  },
  [496033] = {
    EventsCurrentState = T.RT_227,
    StateId = 496033
  },
  [520110] = {
    StateEvent = {
      [1] = {
        NextStateId = 521011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 520110
  },
  [520111] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_322,
        NextStateId = 521012,
        TypeNextState = T.RT_14
      },
      [2] = {
        EventsNextState = T.RT_322,
        NextStateId = 521010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 520111
  },
  [520112] = {
    EventsCurrentState = {
      {
        EffectId = 212,
        Function = "PlayFX",
        Tag = "Trap2"
      }
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_323,
        NextStateId = 521011,
        TypeNextState = T.RT_154
      },
      [2] = {
        EventsNextState = T.RT_323,
        NextStateId = 521010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 520112
  },
  [591010] = {
    StateEvent = {
      [1] = T.RT_343
    },
    StateId = 591010
  },
  [591011] = {
    StateEvent = {
      [1] = T.RT_344
    },
    StateId = 591011
  },
  [591012] = {
    StateEvent = {
      [1] = {
        NextStateId = 591013,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_345
    },
    StateId = 591012
  },
  [591013] = {
    StateEvent = {
      [1] = T.RT_345
    },
    StateId = 591013
  },
  [591014] = {
    StateEvent = {
      [1] = T.RT_343,
      [2] = T.RT_344
    },
    StateId = 591014
  },
  [591020] = {
    StateEvent = {
      [1] = T.RT_346
    },
    StateId = 591020
  },
  [591021] = {
    StateEvent = {
      [1] = T.RT_347,
      [2] = {
        NextStateId = 591022,
        TypeNextState = T.RT_4
      }
    },
    StateId = 591021
  },
  [591022] = {
    StateEvent = {
      [1] = T.RT_347,
      [2] = T.RT_346
    },
    StateId = 591022
  },
  [592010] = {
    StateEvent = {
      [1] = T.RT_348
    },
    StateId = 592010
  },
  [592011] = {
    StateEvent = {
      [1] = T.RT_349
    },
    StateId = 592011
  },
  [592012] = {
    StateEvent = {
      [1] = {
        NextStateId = 592013,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_350
    },
    StateId = 592012
  },
  [592013] = {
    StateEvent = {
      [1] = T.RT_350
    },
    StateId = 592013
  },
  [592014] = {
    StateEvent = {
      [1] = T.RT_348,
      [2] = T.RT_349
    },
    StateId = 592014
  },
  [595010] = {
    StateEvent = {
      [1] = {
        NextStateId = 595011,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 595012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 595010
  },
  [595011] = {
    StateEvent = {
      [1] = T.RT_351,
      [2] = T.RT_352
    },
    StateId = 595011
  },
  [595012] = {
    StateEvent = {
      [1] = T.RT_352,
      [2] = T.RT_351
    },
    StateId = 595012
  },
  [595013] = {StateId = 595013},
  [595014] = {StateId = 595014},
  [596010] = {
    StateEvent = {
      [1] = {
        NextStateId = 596011,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 596012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 596010
  },
  [596011] = {StateId = 596011},
  [596012] = {
    StateEvent = {
      [1] = {
        NextStateId = 596013,
        TypeNextState = T.RT_4
      }
    },
    StateId = 596012
  },
  [596013] = {
    StateEvent = {
      [1] = {
        NextStateId = 596014,
        TypeNextState = T.RT_4
      }
    },
    StateId = 596013
  },
  [596014] = {StateId = 596014},
  [600110] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/Asset/Scene/common/InterProps/Animation/Tele/Ani_Tele02_Montage2.Ani_Tele02_Montage2'",
        SectionName = "Idle"
      },
      T.RT_1,
      {
        EffectId = 10199004,
        Function = "PlayFX",
        Tag = "BirdIdle"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 600111,
        TypeNextState = T.RT_3
      }
    },
    StateId = 600110
  },
  [600111] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/Asset/Scene/common/InterProps/Animation/Tele/Ani_Tele02_Montage2.Ani_Tele02_Montage2'",
        SectionName = "Open"
      },
      T.RT_17,
      {Function = "StopFX", Tag = "BirdIdle"},
      {
        EffectId = 10199005,
        Function = "PlayFX",
        Tag = "BirdFly"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 600112,
        TypeNextState = T.RT_10
      }
    },
    StateId = 600111
  },
  [600112] = {StateId = 600112},
  [610010] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          {
            Function = "CreateSpecialMonster",
            RuleId = 1
          }
        },
        NextStateId = 610011,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610010
  },
  [610011] = {
    EventsCurrentState = T.RT_359,
    StateId = 610011
  },
  [610012] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_361,
        NextStateId = 610013,
        TypeNextState = T.RT_4
      },
      [2] = {
        EventsNextState = T.RT_361,
        NextStateId = 610014,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610012
  },
  [610013] = {
    EventsCurrentState = T.RT_363,
    StateEvent = {
      [1] = {
        NextStateId = 610015,
        TypeNextState = T.RT_364
      }
    },
    StateId = 610013
  },
  [610014] = {
    EventsCurrentState = {
      {
        EffectId = 900030,
        Function = "PlayFX",
        Tag = "Star"
      },
      T.RT_358
    },
    StateEvent = {
      [1] = {
        NextStateId = 610015,
        TypeNextState = {
          InteractiveId = 91511,
          Type = "Interactive"
        }
      }
    },
    StateId = 610014
  },
  [610015] = {
    EventsCurrentState = T.RT_366,
    StateId = 610015
  },
  [610016] = {
    StateEvent = {
      [1] = {
        NextStateId = 610017,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610016
  },
  [610017] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_116,
      T.RT_358
    },
    StateId = 610017
  },
  [610018] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          {
            Function = "CreateSpecialMonster",
            RuleId = 3
          }
        },
        NextStateId = 610019,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610018
  },
  [610019] = {
    EventsCurrentState = {
      T.RT_17,
      {Function = "StopFX", Tag = "Body"},
      T.RT_146
    },
    StateId = 610019
  },
  [610020] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_367,
        NextStateId = 610021,
        TypeNextState = T.RT_4
      },
      [2] = {
        EventsNextState = T.RT_367,
        NextStateId = 610022,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610020
  },
  [610021] = {
    EventsCurrentState = T.RT_369,
    StateEvent = T.RT_372,
    StateId = 610021
  },
  [610022] = {
    EventsCurrentState = T.RT_369,
    StateEvent = T.RT_372,
    StateId = 610022
  },
  [610023] = {
    EventsCurrentState = T.RT_366,
    StateId = 610023
  },
  [610024] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_375,
        NextStateId = 610025,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610024
  },
  [610025] = {
    EventsCurrentState = T.RT_376,
    StateId = 610025
  },
  [610026] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_375,
        NextStateId = 610027,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610026
  },
  [610027] = {
    EventsCurrentState = T.RT_376,
    StateId = 610027
  },
  [610028] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_373
        },
        NextStateId = 610029,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610028
  },
  [610029] = {
    EventsCurrentState = T.RT_147,
    StateId = 610029
  },
  [610030] = {
    StateEvent = {
      [1] = {
        NextStateId = 610031,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610030
  },
  [610031] = {
    EventsCurrentState = T.RT_359,
    StateId = 610031
  },
  [610032] = {
    StateEvent = {
      [1] = {
        NextStateId = 610033,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610032
  },
  [610033] = {
    EventsCurrentState = T.RT_359,
    StateId = 610033
  },
  [610040] = {
    StateEvent = {
      [1] = {
        NextStateId = 610041,
        TypeNextState = T.RT_3
      }
    },
    StateId = 610040
  },
  [610041] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_358
    },
    StateId = 610041
  },
  [610042] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_361,
        NextStateId = 610043,
        TypeNextState = T.RT_4
      }
    },
    StateId = 610042
  },
  [610043] = {
    EventsCurrentState = T.RT_363,
    StateEvent = {
      [1] = {
        NextStateId = 610044,
        TypeNextState = T.RT_364
      }
    },
    StateId = 610043
  },
  [610044] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_365
    },
    StateId = 610044
  },
  [701000] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 701001,
        TypeNextState = T.RT_4
      }
    },
    StateId = 701000
  },
  [701001] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 701002,
        TypeNextState = T.RT_3
      }
    },
    StateId = 701001
  },
  [701002] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 701003,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701002
  },
  [701003] = {StateId = 701003},
  [701004] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 701002,
        TypeNextState = T.RT_4
      }
    },
    StateId = 701004
  },
  [701030] = {
    EventsCurrentState = T.RT_117,
    StateEvent = {
      [1] = {
        NextStateId = 701031,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 701032,
        TypeNextState = T.RT_4
      }
    },
    StateId = 701030
  },
  [701031] = {
    EventsCurrentState = {
      T.RT_1,
      {
        EffectId = 211,
        Function = "PlayFX",
        Tag = "Loop"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 701032,
        TypeNextState = T.RT_3
      }
    },
    StateId = 701031
  },
  [701032] = {
    EventsCurrentState = {
      T.RT_17,
      {Function = "StopFX", Tag = "Loop"}
    },
    StateEvent = {
      [1] = {
        NextStateId = 701033,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701032
  },
  [701033] = {StateId = 701033},
  [701060] = {
    EventsCurrentState = T.RT_380,
    StateEvent = T.RT_382,
    StateId = 701060
  },
  [701061] = {
    EventsCurrentState = T.RT_384,
    StateEvent = {
      [1] = {
        NextStateId = 701062,
        TypeNextState = T.RT_385
      }
    },
    StateId = 701061
  },
  [701062] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 701063,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701062
  },
  [701063] = {StateId = 701063},
  [701100] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 701101,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_387
    },
    StateId = 701100
  },
  [701101] = {
    EventsCurrentState = T.RT_388,
    StateEvent = {
      [1] = T.RT_387
    },
    StateId = 701101
  },
  [701102] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 701103,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701102
  },
  [701103] = {StateId = 701103},
  [701130] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        NextStateId = 701131,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_390
    },
    StateId = 701130
  },
  [701131] = {
    EventsCurrentState = T.RT_388,
    StateEvent = {
      [1] = T.RT_390
    },
    StateId = 701131
  },
  [701132] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 701133,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701132
  },
  [701133] = {StateId = 701133},
  [701300] = {
    EventsCurrentState = {
      {
        ColorLogoMul = 1.5,
        Function = "ChangeFX",
        PositionMove = 0,
        Tag = "Niagara"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 701301,
        TypeNextState = T.RT_198
      }
    },
    StateId = 701300
  },
  [701301] = {
    EventsCurrentState = {
      {
        ColorLogoMul = 10,
        Function = "ChangeFX",
        PositionMove = 1,
        Tag = "Niagara"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 701302,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 701300,
        TypeNextState = T.RT_278
      }
    },
    StateId = 701301
  },
  [701302] = {
    EventsCurrentState = T.RT_393,
    StateEvent = {
      [1] = {
        NextStateId = 701303,
        TypeNextState = T.RT_4
      }
    },
    StateId = 701302
  },
  [701303] = {
    EventsCurrentState = T.RT_397,
    StateEvent = {
      [1] = {
        NextStateId = 701304,
        TypeNextState = T.RT_43
      }
    },
    StateId = 701303
  },
  [701304] = {
    EventsCurrentState = T.RT_398,
    StateId = 701304
  },
  [701310] = {
    EventsCurrentState = {
      {
        EffectId = 201,
        Function = "PlayFX",
        Tag = "Trap"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 701311,
        TypeNextState = T.RT_259
      }
    },
    StateId = 701310
  },
  [701311] = {
    EventsCurrentState = {
      {Function = "StopFX", Tag = "Trap"},
      {
        EffectId = 202,
        Function = "PlayFX",
        NotAttached = true,
        Tag = "Die"
      },
      T.RT_9
    },
    StateEvent = {
      [1] = {
        NextStateId = 701312,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701311
  },
  [701312] = {
    EventsCurrentState = T.RT_314,
    StateId = 701312
  },
  [701400] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_399
        },
        NextStateId = 701401,
        TypeNextState = {
          ActiveRange = 220,
          Type = "DistanceActive"
        }
      }
    },
    StateId = 701400
  },
  [701401] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 701402,
        TypeNextState = T.RT_10
      }
    },
    StateId = 701401
  },
  [701402] = {
    EventsCurrentState = {
      T.RT_400
    },
    StateId = 701402
  },
  [702000] = {
    EventsCurrentState = {
      {
        ColorLogoMul = 7,
        Function = "ChangeFX",
        PositionMove = 0,
        Tag = "Niagara"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 702001,
        TypeNextState = T.RT_198
      }
    },
    StateId = 702000
  },
  [702001] = {
    EventsCurrentState = {
      {
        ColorLogoMul = 20,
        Function = "ChangeFX",
        PositionMove = 1,
        Tag = "Niagara"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 702002,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 702000,
        TypeNextState = T.RT_278
      }
    },
    StateId = 702001
  },
  [702002] = {
    EventsCurrentState = T.RT_393,
    StateEvent = {
      [1] = {
        NextStateId = 702003,
        TypeNextState = T.RT_4
      }
    },
    StateId = 702002
  },
  [702003] = {
    EventsCurrentState = T.RT_397,
    StateEvent = {
      [1] = {
        NextStateId = 702004,
        TypeNextState = T.RT_43
      }
    },
    StateId = 702003
  },
  [702004] = {
    EventsCurrentState = T.RT_398,
    StateId = 702004
  },
  [703010] = {
    StateEvent = {
      [1] = {
        NextStateId = 703011,
        TypeNextState = T.RT_152
      },
      [2] = T.RT_401
    },
    StateId = 703010
  },
  [703011] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 703010,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_401
    },
    StateId = 703011
  },
  [703012] = {StateId = 703012},
  [703020] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703021,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703027,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703020
  },
  [703021] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703022,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703020,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703021
  },
  [703022] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703023,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703021,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703022
  },
  [703023] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703024,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703022,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703023
  },
  [703024] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703025,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703023,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703024
  },
  [703025] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703026,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703024,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703025
  },
  [703026] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703027,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703025,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703026
  },
  [703027] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 703020,
        TypeNextState = T.RT_402
      },
      [2] = {
        EventsNextState = T.RT_404,
        NextStateId = 703026,
        TypeNextState = T.RT_405
      },
      [3] = T.RT_401
    },
    StateId = 703027
  },
  [703030] = {
    StateEvent = {
      [1] = {
        NextStateId = 703031,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_401
    },
    StateId = 703030
  },
  [703031] = {
    StateEvent = {
      [1] = T.RT_401
    },
    StateId = 703031
  },
  [704000] = {
    StateEvent = {
      [1] = {
        NextStateId = 704001,
        TypeNextState = T.RT_3
      }
    },
    StateId = 704000
  },
  [704001] = {
    StateEvent = {
      [1] = {
        NextStateId = 704000,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704001
  },
  [704010] = {
    StateEvent = {
      [1] = {
        NextStateId = 704011,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 704012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704010
  },
  [704011] = {
    EventsCurrentState = T.RT_406,
    StateEvent = {
      [1] = {
        NextStateId = 704012,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_407
    },
    StateId = 704011
  },
  [704012] = {
    EventsCurrentState = T.RT_408,
    StateEvent = {
      [1] = {
        NextStateId = 704011,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_407
    },
    StateId = 704012
  },
  [704020] = {
    EventsCurrentState = T.RT_408,
    StateEvent = {
      [1] = {
        NextStateId = 704021,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704020
  },
  [704021] = {
    EventsCurrentState = T.RT_406,
    StateEvent = {
      [1] = {
        NextStateId = 704022,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_409
    },
    StateId = 704021
  },
  [704022] = {
    EventsCurrentState = T.RT_408,
    StateEvent = {
      [2] = T.RT_409
    },
    StateId = 704022
  },
  [704030] = {
    StateEvent = {
      [1] = T.RT_410,
      [2] = T.RT_411,
      [3] = T.RT_412,
      [4] = T.RT_413
    },
    StateId = 704030
  },
  [704031] = {
    StateEvent = {
      [1] = T.RT_411,
      [2] = T.RT_414,
      [3] = {
        NextStateId = 7040311,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704031
  },
  [704032] = {
    StateEvent = {
      [1] = T.RT_412,
      [2] = T.RT_414,
      [3] = {
        NextStateId = 7040321,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704032
  },
  [704033] = {
    StateEvent = {
      [1] = T.RT_413,
      [2] = T.RT_414,
      [3] = {
        NextStateId = 7040331,
        TypeNextState = T.RT_4
      }
    },
    StateId = 704033
  },
  [704034] = {
    StateEvent = {
      [1] = T.RT_414,
      [2] = {
        NextStateId = 7040341,
        TypeNextState = T.RT_4
      },
      [3] = T.RT_412
    },
    StateId = 704034
  },
  [705010] = {
    EventsCurrentState = {
      T.RT_395,
      T.RT_415,
      {Function = "StopFX", Tag = "End"}
    },
    StateEvent = {
      [1] = {
        NextStateId = 705011,
        TypeNextState = T.RT_259
      }
    },
    StateId = 705010
  },
  [705011] = {
    EventsCurrentState = {
      {
        EffectId = 217,
        Function = "PlayFX",
        Tag = "Start"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 705012,
        TypeNextState = {
          ActiveRange = 100,
          Type = "DistanceActive"
        }
      },
      [2] = {
        NextStateId = 705010,
        TypeNextState = {
          DeActiveRange = 300,
          Type = "DistanceDeActive"
        }
      }
    },
    StateId = 705011
  },
  [705012] = {
    EventsCurrentState = {
      {
        DeadTime = true,
        Function = "ChangeFX",
        Tag = "Start"
      },
      {
        EffectId = 219,
        Function = "PlayFX",
        Tag = "Die"
      },
      {
        EffectId = 218,
        Function = "PlayFX",
        Tag = "End"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 705013,
        TypeNextState = T.RT_14
      },
      [2] = {
        NextStateId = 705010,
        TypeNextState = T.RT_174
      }
    },
    StateId = 705012
  },
  [705013] = {
    EventsCurrentState = {
      {
        DeadTime = true,
        Function = "ChangeFX",
        Tag = "End"
      },
      T.RT_395,
      T.RT_415
    },
    StateEvent = {
      [1] = {
        NextStateId = 705010,
        TypeNextState = T.RT_25
      }
    },
    StateId = 705013
  },
  [705030] = {
    EventsCurrentState = {
      T.RT_329,
      T.RT_298,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_331,
        NextStateId = 705031,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 705032,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705030
  },
  [705031] = {
    EventsCurrentState = {
      T.RT_9,
      T.RT_293,
      T.RT_298,
      T.RT_299,
      T.RT_300,
      T.RT_13
    },
    StateEvent = T.RT_417,
    StateId = 705031
  },
  [705032] = {
    EventsCurrentState = {
      T.RT_9,
      T.RT_293,
      T.RT_299,
      T.RT_300,
      T.RT_13
    },
    StateEvent = T.RT_417,
    StateId = 705032
  },
  [705033] = {
    EventsCurrentState = {
      T.RT_329,
      T.RT_300,
      T.RT_298,
      T.RT_22
    },
    StateId = 705033
  },
  [705040] = {
    StateEvent = {
      [1] = {
        NextStateId = 701060,
        TypeNextState = {
          InteractiveId = 100017,
          Type = "Interactive"
        }
      },
      [2] = {
        NextStateId = 705041,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705040
  },
  [705041] = {
    EventsCurrentState = T.RT_380,
    StateEvent = T.RT_382,
    StateId = 705041
  },
  [705050] = {
    StateEvent = {
      [1] = {
        NextStateId = 705051,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705050
  },
  [705051] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "SkeletalMesh",
        MontagePath = "AnimMontage'/Game/Asset/Scene/common/InterProps/Animation/Com_Hay/Ani_Com_Hay02A_Shake_Montage.Ani_Com_Hay02A_Shake_Montage'"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 705052,
        TypeNextState = T.RT_25
      }
    },
    StateId = 705051
  },
  [705052] = {
    StateEvent = {
      [1] = {
        NextStateId = 705050,
        TypeNextState = T.RT_25
      }
    },
    StateId = 705052
  },
  [705060] = {
    StateEvent = {
      [1] = {
        NextStateId = 705061,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705060
  },
  [705061] = {
    StateEvent = {
      [1] = {
        NextStateId = 705062,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705061
  },
  [705062] = {
    StateEvent = {
      [1] = {
        NextStateId = 705060,
        TypeNextState = T.RT_4
      }
    },
    StateId = 705062
  },
  [705070] = {
    StateEvent = {
      [1] = {
        NextStateId = 705071,
        TypeNextState = T.RT_3
      }
    },
    StateId = 705070
  },
  [705071] = {StateId = 705071},
  [706000] = {
    StateEvent = {
      [1] = {
        NextStateId = 706001,
        TypeNextState = T.RT_14
      }
    },
    StateId = 706000
  },
  [706001] = {
    StateEvent = {
      [1] = {
        NextStateId = 706000,
        TypeNextState = T.RT_418
      }
    },
    StateId = 706001
  },
  [706010] = {
    StateEvent = {
      [1] = {
        NextStateId = 706011,
        TypeNextState = T.RT_92
      }
    },
    StateId = 706010
  },
  [706011] = {StateId = 706011},
  [706020] = {
    StateEvent = {
      [1] = {
        NextStateId = 706021,
        TypeNextState = T.RT_14
      }
    },
    StateId = 706020
  },
  [706021] = {
    EventsCurrentState = {
      {
        Function = "RemoveTag",
        Tag = "TrafficwayPan1"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 706022,
        TypeNextState = T.RT_418
      }
    },
    StateId = 706021
  },
  [706022] = {
    EventsCurrentState = {
      {
        Function = "AddTag",
        Tag = "TrafficwayPan1",
        Time = 2
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 706020,
        TypeNextState = T.RT_188
      }
    },
    StateId = 706022
  },
  [706030] = {
    StateEvent = {
      [1] = {
        NextStateId = 706031,
        TypeNextState = T.RT_14
      }
    },
    StateId = 706030
  },
  [706031] = {StateId = 706031},
  [707030] = {
    StateEvent = {
      [1] = {
        NextStateId = 707031,
        TypeNextState = T.RT_4
      }
    },
    StateId = 707030
  },
  [707031] = {
    StateEvent = {
      [1] = {
        NextStateId = 707032,
        TypeNextState = T.RT_92
      }
    },
    StateId = 707031
  },
  [707032] = {
    StateEvent = {
      [1] = {
        NextStateId = 707033,
        TypeNextState = T.RT_48
      }
    },
    StateId = 707032
  },
  [707033] = {
    StateEvent = {
      [1] = {
        NextStateId = 707034,
        TypeNextState = T.RT_92
      }
    },
    StateId = 707033
  },
  [707034] = {
    StateEvent = {
      [1] = {
        NextStateId = 707035,
        TypeNextState = T.RT_48
      }
    },
    StateId = 707034
  },
  [707035] = {
    StateEvent = {
      [1] = {
        NextStateId = 707036,
        TypeNextState = T.RT_92
      }
    },
    StateId = 707035
  },
  [707036] = {
    StateEvent = {
      [1] = {
        NextStateId = 707037,
        TypeNextState = T.RT_43
      }
    },
    StateId = 707036
  },
  [707037] = {StateId = 707037},
  [707040] = {
    StateEvent = {
      [1] = {
        NextStateId = 707041,
        TypeNextState = T.RT_92
      }
    },
    StateId = 707040
  },
  [707041] = {
    StateEvent = {
      [1] = {
        NextStateId = 707042,
        TypeNextState = T.RT_43
      }
    },
    StateId = 707041
  },
  [707042] = {StateId = 707042},
  [707950] = {
    StateEvent = {
      [1] = {
        NextStateId = 707951,
        TypeNextState = T.RT_3
      }
    },
    StateId = 707950
  },
  [707951] = {StateId = 707951},
  [707960] = {
    StateEvent = {
      [1] = {
        NextStateId = 707961,
        TypeNextState = T.RT_3
      }
    },
    StateId = 707960
  },
  [707961] = {StateId = 707961},
  [707970] = {
    StateEvent = T.RT_420,
    StateId = 707970
  },
  [707980] = {
    EventsCurrentState = {
      {
        EffectId = 230,
        Function = "PlayFX",
        Tag = "fp"
      }
    },
    StateEvent = {
      [1] = {
        EventsNextState = {
          {
            EffectId = 232,
            Function = "PlayFX",
            Tag = "wind"
          }
        },
        NextStateId = 707981,
        TypeNextState = T.RT_3
      }
    },
    StateId = 707980
  },
  [707981] = {
    EventsCurrentState = {
      {Function = "StopFX", Tag = "fp"}
    },
    StateId = 707981
  },
  [707990] = {
    StateEvent = {
      [1] = {
        NextStateId = 707991,
        TypeNextState = T.RT_3
      }
    },
    StateId = 707990
  },
  [707991] = {
    EventsCurrentState = T.RT_422,
    StateEvent = {
      [1] = {
        NextStateId = 707992,
        TypeNextState = T.RT_43
      }
    },
    StateId = 707991
  },
  [707992] = {
    EventsCurrentState = {
      T.RT_423
    },
    StateId = 707992
  },
  [708000] = {
    StateEvent = T.RT_420,
    StateId = 708000
  },
  [708001] = {
    StateEvent = {
      [1] = {
        NextStateId = 708002,
        TypeNextState = T.RT_43
      }
    },
    StateId = 708001
  },
  [708002] = {
    StateEvent = {
      [1] = {
        NextStateId = 708000,
        TypeNextState = T.RT_4
      }
    },
    StateId = 708002
  },
  [708100] = {
    StateEvent = {
      [1] = {
        NextStateId = 708101,
        TypeNextState = T.RT_3
      }
    },
    StateId = 708100
  },
  [708101] = {
    EventsCurrentState = T.RT_422,
    StateEvent = {
      [1] = {
        NextStateId = 708102,
        TypeNextState = T.RT_43
      }
    },
    StateId = 708101
  },
  [708102] = {
    EventsCurrentState = {
      T.RT_379,
      T.RT_423
    },
    StateEvent = {
      [1] = {
        NextStateId = 708103,
        TypeNextState = T.RT_4
      }
    },
    StateId = 708102
  },
  [708103] = {
    EventsCurrentState = T.RT_384,
    StateEvent = {
      [1] = {
        NextStateId = 708104,
        TypeNextState = T.RT_3
      }
    },
    StateId = 708103
  },
  [708104] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_379,
      T.RT_423
    },
    StateEvent = {
      [1] = {
        NextStateId = 708105,
        TypeNextState = T.RT_4
      }
    },
    StateId = 708104
  },
  [708105] = {
    EventsCurrentState = T.RT_384,
    StateEvent = {
      [1] = {
        NextStateId = 708106,
        TypeNextState = T.RT_385
      }
    },
    StateId = 708105
  },
  [708106] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 708107,
        TypeNextState = T.RT_10
      }
    },
    StateId = 708106
  },
  [708107] = {StateId = 708107},
  [780020] = {
    StateEvent = {
      [1] = {
        NextStateId = 780021,
        TypeNextState = T.RT_3
      }
    },
    StateId = 780020
  },
  [780021] = {
    EventsCurrentState = T.RT_87,
    StateId = 780021
  },
  [780030] = {
    EventsCurrentState = {
      T.RT_424,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        NextStateId = 780031,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780030
  },
  [780031] = {
    EventsCurrentState = {
      T.RT_424,
      T.RT_22,
      T.RT_99
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_426,
        NextStateId = 780032,
        TypeNextState = T.RT_92
      }
    },
    StateId = 780031
  },
  [780032] = {
    EventsCurrentState = T.RT_428,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_430,
        NextStateId = 780033,
        TypeNextState = T.RT_84
      }
    },
    StateId = 780032
  },
  [780033] = {
    EventsCurrentState = T.RT_431,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_426,
        NextStateId = 780034,
        TypeNextState = T.RT_92
      }
    },
    StateId = 780033
  },
  [780034] = {
    EventsCurrentState = T.RT_428,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_430,
        NextStateId = 780035,
        TypeNextState = T.RT_84
      }
    },
    StateId = 780034
  },
  [780035] = {
    EventsCurrentState = T.RT_431,
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_425,
          T.RT_295
        },
        NextStateId = 780036,
        TypeNextState = T.RT_92
      }
    },
    StateId = 780035
  },
  [780036] = {
    EventsCurrentState = {
      T.RT_9,
      T.RT_427,
      T.RT_299,
      T.RT_13
    },
    StateId = 780036
  },
  [780040] = {
    EventsCurrentState = {
      T.RT_329,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        NextStateId = 780041,
        TypeNextState = T.RT_3
      }
    },
    StateId = 780040
  },
  [780041] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 780040,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_285,
        NextStateId = 780042,
        TypeNextState = T.RT_8
      }
    },
    StateId = 780041
  },
  [780042] = {
    EventsCurrentState = {
      T.RT_9,
      T.RT_293,
      T.RT_299,
      T.RT_13
    },
    StateId = 780042
  },
  [780050] = {
    StateEvent = {
      [1] = {
        NextStateId = 780051,
        TypeNextState = T.RT_92
      }
    },
    StateId = 780050
  },
  [780051] = {
    EventsCurrentState = T.RT_147,
    StateId = 780051
  },
  [780060] = {
    StateEvent = {
      [1] = {
        NextStateId = 780061,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780060
  },
  [780061] = {
    StateEvent = {
      [1] = {
        NextStateId = 780060,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780061
  },
  [780080] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_354,
        NextStateId = 780081,
        TypeNextState = T.RT_234
      },
      [2] = {
        EventsNextState = T.RT_354,
        NextStateId = 780082,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780080
  },
  [780081] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_433,
    StateId = 780081
  },
  [780082] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_433,
    StateId = 780082
  },
  [780090] = {
    EventsCurrentState = T.RT_435,
    StateEvent = {
      [1] = {
        NextStateId = 780091,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780090
  },
  [780091] = {
    EventsCurrentState = T.RT_435,
    StateEvent = {
      [1] = {
        NextStateId = 780092,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 780090,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780091
  },
  [780092] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 780091,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_285,
        NextStateId = 780093,
        TypeNextState = T.RT_8
      }
    },
    StateId = 780092
  },
  [780093] = {
    EventsCurrentState = {
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/AssetDesign/Item/MiniGame/Dyn_Minigame_Tanceqi.Dyn_Minigame_Tanceqi'",
        SectionName = "Loop"
      }
    },
    StateId = 780093
  },
  [780100] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 780101,
        TypeNextState = T.RT_234
      },
      [2] = {
        NextStateId = 780102,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780100
  },
  [780101] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_437,
    StateId = 780101
  },
  [780102] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_437,
    StateId = 780102
  },
  [780110] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_324,
      T.RT_287,
      T.RT_22,
      T.RT_9
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_326,
        NextStateId = 780111,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780110
  },
  [780111] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_282,
      T.RT_289,
      T.RT_283,
      T.RT_20,
      T.RT_99
    },
    StateEvent = {
      [1] = {
        NextStateId = 780112,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 780110,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780111
  },
  [780112] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 780111,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_285,
        NextStateId = 780113,
        TypeNextState = T.RT_8
      }
    },
    StateId = 780112
  },
  [780113] = {
    EventsCurrentState = T.RT_334,
    StateId = 780113
  },
  [780130] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_22,
      T.RT_9
    },
    StateEvent = {
      [1] = {
        NextStateId = 780131,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780130
  },
  [780131] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_20,
      T.RT_99
    },
    StateEvent = {
      [1] = {
        NextStateId = 780132,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 780130,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780131
  },
  [780132] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 780131,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 780133,
        TypeNextState = T.RT_8
      }
    },
    StateId = 780132
  },
  [780133] = {
    EventsCurrentState = T.RT_357,
    StateId = 780133
  },
  [780140] = {
    EventsCurrentState = T.RT_210,
    StateEvent = {
      [1] = {
        NextStateId = 780141,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780140
  },
  [780141] = {
    EventsCurrentState = T.RT_211,
    StateId = 780141
  },
  [780150] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 780151,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780150
  },
  [780151] = {
    EventsCurrentState = T.RT_204,
    StateEvent = {
      [1] = {
        NextStateId = 780152,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780151
  },
  [780152] = {
    EventsCurrentState = {
      T.RT_79,
      T.RT_11
    },
    StateId = 780152
  },
  [780160] = {
    EventsCurrentState = T.RT_202,
    StateEvent = {
      [1] = {
        NextStateId = 780161,
        TypeNextState = T.RT_203
      },
      [2] = {
        NextStateId = 780163,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780160
  },
  [780161] = {
    EventsCurrentState = T.RT_204,
    StateEvent = T.RT_439,
    StateId = 780161
  },
  [780162] = {
    EventsCurrentState = T.RT_207,
    StateId = 780162
  },
  [780163] = {
    EventsCurrentState = T.RT_204,
    StateEvent = T.RT_439,
    StateId = 780163
  },
  [780210] = {
    StateEvent = {
      [1] = {
        NextStateId = 780211,
        TypeNextState = T.RT_3
      }
    },
    StateId = 780210
  },
  [780211] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 780210,
        TypeNextState = T.RT_7
      },
      [2] = {
        EventsNextState = T.RT_285,
        NextStateId = 780212,
        TypeNextState = T.RT_8
      }
    },
    StateId = 780211
  },
  [780212] = {
    EventsCurrentState = T.RT_87,
    StateId = 780212
  },
  [780230] = {
    StateEvent = {
      [1] = {
        NextStateId = 780231,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780230
  },
  [780231] = {
    StateEvent = {
      [1] = {
        NextStateId = 780230,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780231
  },
  [780240] = {
    StateEvent = {
      [1] = {
        NextStateId = 780241,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780240
  },
  [780241] = {
    StateEvent = {
      [1] = {
        NextStateId = 780240,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780241
  },
  [780250] = {
    StateEvent = {
      [1] = {
        NextStateId = 780251,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780250
  },
  [780251] = {
    StateEvent = {
      [1] = {
        NextStateId = 780250,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780251
  },
  [780340] = {
    EventsCurrentState = T.RT_406,
    StateEvent = {
      [1] = {
        NextStateId = 780341,
        TypeNextState = T.RT_4
      }
    },
    StateId = 780340
  },
  [780341] = {
    EventsCurrentState = T.RT_408,
    StateEvent = {
      [1] = {
        NextStateId = 780342,
        TypeNextState = T.RT_10
      }
    },
    StateId = 780341
  },
  [780342] = {StateId = 780342},
  [780420] = {
    StateEvent = {
      [1] = {
        NextStateId = 780421,
        TypeNextState = T.RT_3
      }
    },
    StateId = 780420
  },
  [780421] = {
    EventsCurrentState = T.RT_87,
    StateEvent = {
      [1] = {
        NextStateId = 780420,
        TypeNextState = T.RT_10
      }
    },
    StateId = 780421
  },
  [801130] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 801131,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 801132,
        TypeNextState = T.RT_4
      }
    },
    StateId = 801130
  },
  [801131] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_440
    },
    StateId = 801131
  },
  [801132] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_440,
      [2] = {
        NextStateId = 801131,
        TypeNextState = {
          InteractiveId = 402,
          Type = "Interactive"
        }
      }
    },
    StateId = 801132
  },
  [809010] = {
    StateEvent = {
      [1] = {
        NextStateId = 809011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 809010
  },
  [809011] = {
    StateEvent = {
      [1] = {
        NextStateId = 809010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 809011
  },
  [810010] = {
    StateEvent = {
      [1] = {
        NextStateId = 810011,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 810012,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 810013,
        TypeNextState = T.RT_4
      }
    },
    StateId = 810010
  },
  [810011] = {
    StateEvent = T.RT_442,
    StateId = 810011
  },
  [810012] = {
    StateEvent = T.RT_442,
    StateId = 810012
  },
  [810013] = {
    StateEvent = T.RT_442,
    StateId = 810013
  },
  [900000] = {
    EventsCurrentState = T.RT_193,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_6,
        NextStateId = 900001,
        TypeNextState = T.RT_3
      }
    },
    StateId = 900000
  },
  [900001] = {
    StateEvent = {
      [1] = {
        NextStateId = 900000,
        TypeNextState = T.RT_8
      }
    },
    StateId = 900001
  },
  [901000] = {
    StateEvent = {
      [1] = {
        EventsNextState = {
          T.RT_195,
          T.RT_399,
          {
            EffectId = 220,
            Function = "PlayFX",
            NeedFinish = false,
            Tag = "Niagara1"
          },
          {
            EffectId = 221,
            Function = "PlayFX",
            NeedFinish = false,
            Tag = "Niagara2"
          }
        },
        NextStateId = 901001,
        TypeNextState = T.RT_24
      }
    },
    StateId = 901000
  },
  [901001] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 901002,
        TypeNextState = T.RT_10
      }
    },
    StateId = 901001
  },
  [901002] = {
    EventsCurrentState = {
      T.RT_116,
      {
        EffectId = 222,
        Function = "PlayFX",
        Tag = "A"
      },
      {
        EffectId = 223,
        Function = "PlayFX",
        Tag = "B"
      },
      T.RT_400
    },
    StateId = 901002
  },
  [904312] = {
    StateEvent = {
      [1] = T.RT_450,
      [2] = T.RT_450
    },
    StateId = 904312
  },
  [904332] = {
    StateEvent = {
      [1] = T.RT_451,
      [2] = T.RT_451
    },
    StateId = 904332
  },
  [904352] = {
    StateEvent = {
      [1] = T.RT_452,
      [2] = T.RT_452
    },
    StateId = 904352
  },
  [904372] = {
    StateEvent = {
      [1] = T.RT_453,
      [2] = T.RT_453
    },
    StateId = 904372
  },
  [904392] = {
    StateEvent = {
      [1] = T.RT_454,
      [2] = T.RT_454
    },
    StateId = 904392
  },
  [1060400] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = T.RT_27,
      [2] = T.RT_28
    },
    StateId = 1060400
  },
  [1060401] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_30,
      [2] = T.RT_28
    },
    StateId = 1060401
  },
  [1060402] = {
    EventsCurrentState = T.RT_31,
    StateEvent = {
      [1] = T.RT_30,
      [2] = T.RT_27
    },
    StateId = 1060402
  },
  [1060800] = {
    StateEvent = {
      [1] = T.RT_32,
      [2] = T.RT_33
    },
    StateId = 1060800
  },
  [1060801] = {
    StateEvent = {
      [1] = T.RT_34,
      [2] = T.RT_33
    },
    StateId = 1060801
  },
  [1060802] = {
    StateEvent = {
      [1] = T.RT_34,
      [2] = T.RT_32
    },
    StateId = 1060802
  },
  [1061000] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061001,
        TypeNextState = T.RT_24
      }
    },
    StateId = 1061000
  },
  [1061001] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061002,
        TypeNextState = {Param = 8, Type = "Time"}
      }
    },
    StateId = 1061001
  },
  [1061002] = {StateId = 1061002},
  [1061100] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = T.RT_37,
      [2] = T.RT_38,
      [3] = T.RT_39,
      [4] = T.RT_40,
      [5] = T.RT_41
    },
    StateId = 1061100
  },
  [1061101] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = T.RT_42,
      [2] = T.RT_38,
      [3] = T.RT_39,
      [4] = T.RT_40,
      [5] = T.RT_41
    },
    StateId = 1061101
  },
  [1061102] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = T.RT_42,
      [2] = T.RT_37,
      [3] = T.RT_39,
      [4] = T.RT_40,
      [5] = T.RT_41
    },
    StateId = 1061102
  },
  [1061103] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = T.RT_42,
      [2] = T.RT_37,
      [3] = T.RT_38,
      [4] = T.RT_40,
      [5] = T.RT_41
    },
    StateId = 1061103
  },
  [1061104] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = T.RT_42,
      [2] = T.RT_37,
      [3] = T.RT_38,
      [4] = T.RT_39,
      [5] = T.RT_41
    },
    StateId = 1061104
  },
  [1061105] = {
    EventsCurrentState = T.RT_36,
    StateEvent = {
      [1] = {
        NextStateId = 1061106,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061105
  },
  [1061106] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = T.RT_42
    },
    StateId = 1061106
  },
  [1061200] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = T.RT_45
    },
    StateId = 1061200
  },
  [1061201] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061202,
        TypeNextState = T.RT_46
      },
      [2] = T.RT_47
    },
    StateId = 1061201
  },
  [1061202] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061203,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_47
    },
    StateId = 1061202
  },
  [1061203] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061204,
        TypeNextState = T.RT_49
      },
      [2] = T.RT_47,
      [3] = T.RT_47
    },
    StateId = 1061203
  },
  [1061204] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061205,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_47
    },
    StateId = 1061204
  },
  [1061205] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061206,
        TypeNextState = {
          InteractiveId = 920,
          Type = "Interactive"
        }
      },
      [2] = T.RT_47
    },
    StateId = 1061205
  },
  [1061206] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061207,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_47
    },
    StateId = 1061206
  },
  [1061207] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = T.RT_47,
      [2] = T.RT_45,
      [3] = {
        NextStateId = 1061203,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061207
  },
  [1061210] = {
    EventsCurrentState = T.RT_50,
    StateId = 1061210
  },
  [1061211] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061212,
        TypeNextState = T.RT_46
      }
    },
    StateId = 1061211
  },
  [1061212] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061210,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1061212
  },
  [1061220] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = {
        NextStateId = 1061221,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061220
  },
  [1061221] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061210,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1061222,
        TypeNextState = T.RT_46
      }
    },
    StateId = 1061221
  },
  [1061222] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061223,
        TypeNextState = T.RT_48
      },
      [2] = {
        NextStateId = 1061220,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061222
  },
  [1061223] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061224,
        TypeNextState = T.RT_49
      }
    },
    StateId = 1061223
  },
  [1061224] = {
    EventsCurrentState = T.RT_51,
    StateId = 1061224
  },
  [1061230] = {
    EventsCurrentState = T.RT_26,
    StateEvent = {
      [1] = T.RT_52,
      [2] = T.RT_53
    },
    StateId = 1061230
  },
  [1061231] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_53,
      [2] = T.RT_54
    },
    StateId = 1061231
  },
  [1061232] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = T.RT_54,
      [2] = T.RT_52
    },
    StateId = 1061232
  },
  [1061240] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061241,
        TypeNextState = T.RT_55
      }
    },
    StateId = 1061240
  },
  [1061241] = {
    EventsCurrentState = T.RT_56,
    StateEvent = {
      [1] = {
        NextStateId = 1061240,
        TypeNextState = T.RT_7
      },
      [2] = {
        NextStateId = 1061242,
        TypeNextState = T.RT_8
      }
    },
    StateId = 1061241
  },
  [1061242] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061243,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1061242
  },
  [1061243] = {
    EventsCurrentState = {
      T.RT_13,
      T.RT_57
    },
    StateEvent = {
      [1] = {
        NextStateId = 1061244,
        TypeNextState = T.RT_58
      }
    },
    StateId = 1061243
  },
  [1061244] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061245,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061244
  },
  [1061245] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061246,
        TypeNextState = T.RT_59
      }
    },
    StateId = 1061245
  },
  [1061246] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061243,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061246
  },
  [1061250] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = T.RT_60
    },
    StateId = 1061250
  },
  [1061251] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061252,
        TypeNextState = T.RT_55
      }
    },
    StateId = 1061251
  },
  [1061252] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061253,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_60
    },
    StateId = 1061252
  },
  [1061253] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061254,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1061253
  },
  [1061254] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061255,
        TypeNextState = T.RT_58
      }
    },
    StateId = 1061254
  },
  [1061255] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061256,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061255
  },
  [1061256] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061257,
        TypeNextState = T.RT_59
      }
    },
    StateId = 1061256
  },
  [1061257] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061254,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061257
  },
  [1061260] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061261,
        TypeNextState = T.RT_55
      }
    },
    StateId = 1061260
  },
  [1061261] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061262,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061261
  },
  [1061262] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061263,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1061262
  },
  [1061263] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061264,
        TypeNextState = T.RT_58
      }
    },
    StateId = 1061263
  },
  [1061264] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061265,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061264
  },
  [1061265] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061266,
        TypeNextState = T.RT_59
      }
    },
    StateId = 1061265
  },
  [1061266] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061263,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1061266
  },
  [1061300] = {
    StateEvent = {
      [1] = T.RT_61,
      [2] = T.RT_62
    },
    StateId = 1061300
  },
  [1061301] = {
    StateEvent = {
      [1] = T.RT_63,
      [2] = T.RT_62,
      [3] = {
        NextStateId = 10613011,
        TypeNextState = T.RT_64
      }
    },
    StateId = 1061301
  },
  [1061302] = {
    StateEvent = {
      [1] = T.RT_63,
      [2] = T.RT_61,
      [3] = {
        NextStateId = 10613021,
        TypeNextState = T.RT_64
      }
    },
    StateId = 1061302
  },
  [1061310] = {
    EventsCurrentState = {
      {Function = "StopFX", Tag = "Light"}
    },
    StateEvent = {
      [1] = T.RT_66,
      [2] = T.RT_67
    },
    StateId = 1061310
  },
  [1061311] = {
    StateEvent = {
      [1] = T.RT_68,
      [2] = T.RT_69,
      [3] = T.RT_67
    },
    StateId = 1061311
  },
  [1061312] = {
    StateEvent = {
      [1] = T.RT_68,
      [2] = T.RT_66,
      [3] = T.RT_67
    },
    StateId = 1061312
  },
  [1061313] = {
    StateEvent = {
      [1] = T.RT_68,
      [2] = T.RT_66,
      [3] = T.RT_69
    },
    StateId = 1061313
  },
  [1061400] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061401,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061400
  },
  [1061401] = {
    StateEvent = {
      [1] = T.RT_70,
      [2] = {
        NextStateId = 1061402,
        TypeNextState = {
          ActiveRange = 10000,
          Type = "DistanceActive"
        }
      }
    },
    StateId = 1061401
  },
  [1061402] = {
    StateEvent = {
      [1] = T.RT_70,
      [2] = {
        NextStateId = 1061401,
        TypeNextState = {
          DeActiveRange = 10000,
          Type = "DistanceDeActive"
        }
      }
    },
    StateId = 1061402
  },
  [1061500] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061501,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061500
  },
  [1061501] = {
    StateEvent = {
      [1] = {
        NextStateId = 1061500,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061501
  },
  [1061600] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 1061601,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061600
  },
  [1061601] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061602,
        TypeNextState = {
          ActiveRange = 1200,
          Type = "DistanceActive"
        }
      }
    },
    StateId = 1061601
  },
  [1061602] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = T.RT_72,
      [2] = {
        NextStateId = 1061603,
        TypeNextState = {
          NeedCountDown = true,
          Param = 6,
          Type = "Time"
        }
      }
    },
    StateId = 1061602
  },
  [1061603] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = T.RT_72,
      [2] = {
        NextStateId = 1061602,
        TypeNextState = T.RT_25
      }
    },
    StateId = 1061603
  },
  [1061900] = {
    EventsCurrentState = T.RT_51,
    StateEvent = {
      [1] = {
        NextStateId = 1061901,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1061900
  },
  [1061901] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061902,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_73
    },
    StateId = 1061901
  },
  [1061902] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061903,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_73
    },
    StateId = 1061902
  },
  [1061903] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = {
        NextStateId = 1061904,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_73
    },
    StateId = 1061903
  },
  [1061904] = {
    EventsCurrentState = T.RT_44,
    StateEvent = {
      [1] = {
        NextStateId = 1061901,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_73
    },
    StateId = 1061904
  },
  [1062000] = {
    StateEvent = {
      [1] = {
        NextStateId = 1062001,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_74
    },
    StateId = 1062000
  },
  [1062001] = {
    StateEvent = {
      [1] = T.RT_74
    },
    StateId = 1062001
  },
  [1062002] = {
    StateEvent = {
      [1] = {
        NextStateId = 1062000,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1062002
  },
  [1062100] = {
    StateEvent = {
      [1] = {
        NextStateId = 1062101,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1062100
  },
  [1062101] = {
    StateEvent = {
      [1] = {
        NextStateId = 1062102,
        TypeNextState = T.RT_3
      }
    },
    StateId = 1062101
  },
  [1062102] = {
    StateEvent = {
      [1] = {
        NextStateId = 1062100,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1062102
  },
  [1070100] = {
    EventsCurrentState = T.RT_76,
    StateEvent = {
      [1] = {
        NextStateId = 1070101,
        TypeNextState = T.RT_77
      },
      [2] = T.RT_78
    },
    StateId = 1070100
  },
  [1070101] = {
    EventsCurrentState = T.RT_80,
    StateEvent = {
      [1] = {
        NextStateId = 1070100,
        TypeNextState = T.RT_81
      },
      [2] = T.RT_78
    },
    StateId = 1070101
  },
  [1070102] = {
    EventsCurrentState = T.RT_82,
    StateEvent = {
      [1] = {
        NextStateId = 1070100,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1070101,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1070102
  },
  [1070160] = {
    EventsCurrentState = T.RT_82,
    StateEvent = {
      [1] = {
        NextStateId = 1070161,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1070160
  },
  [1070161] = {
    EventsCurrentState = T.RT_80,
    StateEvent = {
      [1] = T.RT_83,
      [2] = {
        NextStateId = 1070162,
        TypeNextState = T.RT_81
      }
    },
    StateId = 1070161
  },
  [1070162] = {
    EventsCurrentState = T.RT_80,
    StateEvent = {
      [1] = T.RT_83,
      [2] = {
        NextStateId = 1070161,
        TypeNextState = T.RT_77
      },
      [3] = {
        NextStateId = 1070163,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1070162
  },
  [1070163] = {
    EventsCurrentState = T.RT_76,
    StateEvent = {
      [1] = T.RT_83,
      [2] = {
        NextStateId = 1070162,
        TypeNextState = T.RT_84
      }
    },
    StateId = 1070163
  },
  [1070200] = {
    EventsCurrentState = T.RT_82,
    StateEvent = {
      [1] = {
        NextStateId = 1070201,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1070200
  },
  [1070201] = {
    EventsCurrentState = T.RT_80,
    StateEvent = {
      [1] = {
        NextStateId = 1070202,
        TypeNextState = {
          ActiveRange = 5000,
          Type = "DistanceActive"
        }
      },
      [2] = T.RT_85
    },
    StateId = 1070201
  },
  [1070202] = {
    EventsCurrentState = T.RT_80,
    StateEvent = {
      [1] = {
        NextStateId = 1070201,
        TypeNextState = T.RT_64
      },
      [2] = {
        NextStateId = 1070203,
        TypeNextState = T.RT_48
      }
    },
    StateId = 1070202
  },
  [1070203] = {
    EventsCurrentState = T.RT_86,
    StateEvent = {
      [1] = {
        NextStateId = 1070204,
        TypeNextState = T.RT_25
      },
      [2] = T.RT_85
    },
    StateId = 1070203
  },
  [1070204] = {
    EventsCurrentState = T.RT_76,
    StateEvent = {
      [1] = {
        NextStateId = 1070205,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_85
    },
    StateId = 1070204
  },
  [1070205] = {
    EventsCurrentState = T.RT_86,
    StateEvent = {
      [1] = {
        NextStateId = 1070202,
        TypeNextState = T.RT_25
      },
      [2] = T.RT_85
    },
    StateId = 1070205
  },
  [1150300] = {
    StateEvent = {
      [1] = T.RT_118,
      [2] = T.RT_119,
      [3] = T.RT_120
    },
    StateId = 1150300
  },
  [1150301] = {
    StateEvent = {
      [1] = T.RT_121,
      [2] = T.RT_119,
      [3] = T.RT_120
    },
    StateId = 1150301
  },
  [1150302] = {
    StateEvent = {
      [1] = T.RT_121,
      [2] = T.RT_118,
      [3] = T.RT_120
    },
    StateId = 1150302
  },
  [1150303] = {
    StateEvent = {
      [1] = T.RT_121,
      [2] = T.RT_118,
      [3] = T.RT_119
    },
    StateId = 1150303
  },
  [1170100] = {
    EventsCurrentState = T.RT_87,
    StateEvent = {
      [1] = {
        NextStateId = 1170101,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_128
    },
    StateId = 1170100
  },
  [1170101] = {
    StateEvent = {
      [1] = {
        NextStateId = 1170100,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_128
    },
    StateId = 1170101
  },
  [1170102] = {
    EventsCurrentState = T.RT_87,
    StateId = 1170102
  },
  [1210021] = {StateId = 1210021},
  [1210022] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210023,
        TypeNextState = T.RT_92
      },
      [2] = T.RT_149
    },
    StateId = 1210022
  },
  [1210023] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210022,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_149
    },
    StateId = 1210023
  },
  [1210130] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210131,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1210130
  },
  [1210131] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210130,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210131
  },
  [1210140] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210141,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210140
  },
  [1210141] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210142,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1210140,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210141
  },
  [1210142] = {
    EventsCurrentState = T.RT_150,
    StateId = 1210142
  },
  [1210150] = {
    EventsCurrentState = {
      T.RT_75,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        NextStateId = 1210151,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210150
  },
  [1210151] = {
    EventsCurrentState = {
      T.RT_79,
      T.RT_131
    },
    StateId = 1210151
  },
  [1210170] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210171,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1210172,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210170
  },
  [1210171] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210170,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210171
  },
  [1210172] = {
    EventsCurrentState = T.RT_150,
    StateId = 1210172
  },
  [1210180] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210181,
        TypeNextState = T.RT_152
      },
      [2] = T.RT_153
    },
    StateId = 1210180
  },
  [1210181] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210180,
        TypeNextState = T.RT_48
      },
      [2] = T.RT_153
    },
    StateId = 1210181
  },
  [1210182] = {
    EventsCurrentState = T.RT_150,
    StateId = 1210182
  },
  [1210183] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210184,
        TypeNextState = T.RT_152
      }
    },
    StateId = 1210183
  },
  [1210184] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210185,
        TypeNextState = T.RT_154
      }
    },
    StateId = 1210184
  },
  [1210185] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210186,
        TypeNextState = T.RT_152
      }
    },
    StateId = 1210185
  },
  [1210186] = {
    StateEvent = {
      [1] = {
        NextStateId = 1210183,
        TypeNextState = T.RT_154
      }
    },
    StateId = 1210186
  },
  [1210200] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210201,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1210202,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210200
  },
  [1210201] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210200,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210201
  },
  [1210202] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210200,
        TypeNextState = T.RT_154
      }
    },
    StateId = 1210202
  },
  [1210220] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210221,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210220
  },
  [1210221] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210222,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_155
    },
    StateId = 1210221
  },
  [1210222] = {
    StateEvent = {
      [1] = T.RT_155
    },
    StateId = 1210222
  },
  [1210230] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1210231,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210230
  },
  [1210231] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210230,
        TypeNextState = T.RT_154
      }
    },
    StateId = 1210231
  },
  [1210240] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1210241,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210240
  },
  [1210241] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_156,
      [2] = {
        NextStateId = 1210242,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210241
  },
  [1210242] = {
    StateEvent = {
      [1] = T.RT_156
    },
    StateId = 1210242
  },
  [1210250] = {
    EventsCurrentState = T.RT_144,
    StateEvent = {
      [1] = {
        NextStateId = 1210251,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210250
  },
  [1210251] = {
    EventsCurrentState = T.RT_142,
    StateEvent = {
      [1] = {
        NextStateId = 1210250,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1210251
  },
  [1210252] = {
    EventsCurrentState = T.RT_147,
    StateId = 1210252
  },
  [1310010] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1310011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310010
  },
  [1310011] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310010,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310011
  },
  [1310014] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310015,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310014
  },
  [1310015] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310014,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310015
  },
  [1310030] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1310031,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310030
  },
  [1310031] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310030,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310031
  },
  [1310040] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310041,
        TypeNextState = T.RT_159
      }
    },
    StateId = 1310040
  },
  [1310041] = {
    StateEvent = {
      [1] = T.RT_160
    },
    StateId = 1310041
  },
  [1310042] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310043,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310042
  },
  [1310043] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310044,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310043
  },
  [1310044] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310043,
        TypeNextState = T.RT_159
      }
    },
    StateId = 1310044
  },
  [1310045] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310040,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_160
    },
    StateId = 1310045
  },
  [1310070] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_161,
      [2] = T.RT_162
    },
    StateId = 1310070
  },
  [1310071] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_163,
      [2] = {
        NextStateId = 1310072,
        TypeNextState = T.RT_4
      },
      [3] = T.RT_162
    },
    StateId = 1310071
  },
  [1310072] = {
    StateEvent = {
      [1] = T.RT_163,
      [2] = T.RT_161
    },
    StateId = 1310072
  },
  [1310073] = {
    StateEvent = {
      [1] = T.RT_161
    },
    StateId = 1310073
  },
  [1310080] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1310081,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310080
  },
  [1310081] = {
    EventsCurrentState = T.RT_151,
    StateEvent = T.RT_166,
    StateId = 1310081
  },
  [1310082] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310083,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310082
  },
  [1310083] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310084,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1310085,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310083
  },
  [1310084] = {
    StateEvent = T.RT_166,
    StateId = 1310084
  },
  [1310085] = {StateId = 1310085},
  [1310090] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1310091,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310090
  },
  [1310091] = {
    EventsCurrentState = T.RT_151,
    StateEvent = T.RT_168,
    StateId = 1310091
  },
  [1310092] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310093,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_169
    },
    StateId = 1310092
  },
  [1310093] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310092,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_169,
      [3] = {
        NextStateId = 1310096,
        TypeNextState = T.RT_4
      },
      [4] = T.RT_170
    },
    StateId = 1310093
  },
  [1310094] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_170
    },
    StateId = 1310094
  },
  [1310095] = {
    EventsCurrentState = T.RT_151,
    StateEvent = T.RT_168,
    StateId = 1310095
  },
  [1310096] = {StateId = 1310096},
  [1310150] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310151,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310150
  },
  [1310151] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310150,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310151
  },
  [1310170] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310172,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310170
  },
  [1310171] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_172,
    StateId = 1310171
  },
  [1310172] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310173,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 1310171,
        TypeNextState = T.RT_173
      },
      [3] = T.RT_171
    },
    StateId = 1310172
  },
  [1310173] = {
    EventsCurrentState = T.RT_147,
    StateEvent = T.RT_172,
    StateId = 1310173
  },
  [1310180] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310181,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310180
  },
  [1310181] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310182,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310181
  },
  [1310182] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310183,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310182
  },
  [1310183] = {StateId = 1310183},
  [1310190] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310191,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310190
  },
  [1310191] = {
    EventsCurrentState = T.RT_151,
    StateId = 1310191
  },
  [1310200] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 1310201,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310200
  },
  [1310201] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 1310200,
        TypeNextState = T.RT_174
      },
      [2] = {
        NextStateId = 1310202,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310201
  },
  [1310202] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310200,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310202
  },
  [1310211] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310212,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310211
  },
  [1310212] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310213,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310212
  },
  [1310213] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310214,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310213
  },
  [1310214] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310211,
        TypeNextState = T.RT_92
      }
    },
    StateId = 1310214
  },
  [1310230] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310231,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310230
  },
  [1310231] = {
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_176,
        NextStateId = 1310230,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310231
  },
  [1310250] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310251,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310250
  },
  [1310251] = {
    EventsCurrentState = T.RT_147,
    StateId = 1310251
  },
  [1310260] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310261,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310260
  },
  [1310261] = {StateId = 1310261},
  [1310290] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310291,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310290
  },
  [1310291] = {
    EventsCurrentState = T.RT_147,
    StateId = 1310291
  },
  [1310310] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310311,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310310
  },
  [1310311] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310310,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310311
  },
  [1310320] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310321,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310320
  },
  [1310321] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310320,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310321
  },
  [1310330] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310331,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310330
  },
  [1310331] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310330,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310331
  },
  [1310340] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310341,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310340
  },
  [1310341] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310340,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310341
  },
  [1310350] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310351,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310350
  },
  [1310351] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310350,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310351
  },
  [1310360] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310361,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310360
  },
  [1310361] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310360,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310361
  },
  [1310370] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310371,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310370
  },
  [1310371] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310370,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310371
  },
  [1310380] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310381,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310380
  },
  [1310381] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310380,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310381
  },
  [1310390] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310391,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310390
  },
  [1310391] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310390,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310391
  },
  [1310450] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310451,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310450
  },
  [1310451] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310450,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310451
  },
  [1310460] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310461,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310460
  },
  [1310461] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310460,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310461
  },
  [1310470] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310471,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310470
  },
  [1310471] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310470,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310471
  },
  [1310480] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310481,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310480
  },
  [1310481] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310480,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310481
  },
  [1310490] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310491,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310490
  },
  [1310491] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310490,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310491
  },
  [1310500] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310501,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310500
  },
  [1310501] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310500,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310501
  },
  [1310510] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310511,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310510
  },
  [1310511] = {
    StateEvent = {
      [1] = {
        NextStateId = 1310510,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1310511
  },
  [1500110] = {
    StateEvent = {
      [1] = {
        NextStateId = 1500111,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1500110
  },
  [1500111] = {
    StateEvent = {
      [1] = T.RT_177,
      [2] = {
        NextStateId = 1500112,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1500111
  },
  [1500112] = {
    StateEvent = {
      [1] = T.RT_177,
      [2] = {
        NextStateId = 1500113,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1500112
  },
  [1500113] = {
    StateEvent = {
      [1] = {
        NextStateId = 1500110,
        TypeNextState = T.RT_43
      }
    },
    StateId = 1500113
  },
  [1610011] = {
    StateEvent = {
      [1] = {
        NextStateId = 1610012,
        TypeNextState = T.RT_92
      },
      [2] = {
        NextStateId = 1610012,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1610011
  },
  [1610012] = {
    StateEvent = {
      [1] = {
        NextStateId = 1610011,
        TypeNextState = T.RT_4
      }
    },
    StateId = 1610012
  },
  [3900111] = {
    EventsCurrentState = {
      T.RT_75,
      T.RT_99,
      {
        Function = "PlayMontage",
        Mesh = "Mesh",
        MontagePath = "AnimMontage'/Game/Asset/Scene/EN002_Haiboliya/Common/Prop/Animation/Shouwei_Maer_Montage.Shouwei_Maer_Montage'",
        SectionName = "Start"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 3900112,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900111
  },
  [3900112] = {
    EventsCurrentState = T.RT_197,
    StateEvent = {
      [1] = {
        NextStateId = 3900111,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900112
  },
  [3900113] = {
    EventsCurrentState = T.RT_197,
    StateEvent = {
      [1] = {
        NextStateId = 3900111,
        TypeNextState = T.RT_25
      }
    },
    StateId = 3900113
  },
  [3900121] = {
    EventsCurrentState = T.RT_199,
    StateEvent = {
      [1] = {
        NextStateId = 3900122,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900121
  },
  [3900122] = {
    EventsCurrentState = T.RT_197,
    StateEvent = {
      [1] = {
        NextStateId = 3900121,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900122
  },
  [3900123] = {
    EventsCurrentState = T.RT_197,
    StateEvent = {
      [1] = {
        NextStateId = 3900121,
        TypeNextState = T.RT_25
      }
    },
    StateId = 3900123
  },
  [3900130] = {
    EventsCurrentState = {
      T.RT_79,
      T.RT_9,
      T.RT_22
    },
    StateEvent = {
      [1] = {
        NextStateId = 3900131,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900130
  },
  [3900131] = {
    EventsCurrentState = {
      T.RT_75,
      T.RT_99,
      T.RT_20
    },
    StateEvent = {
      [1] = T.RT_200,
      [2] = {
        NextStateId = 3900132,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900131
  },
  [3900132] = {
    EventsCurrentState = T.RT_106,
    StateEvent = {
      [1] = T.RT_200,
      [2] = {
        NextStateId = 3900133,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900132
  },
  [3900133] = {
    EventsCurrentState = T.RT_76,
    StateEvent = {
      [1] = T.RT_200
    },
    StateId = 3900133
  },
  [3900141] = {
    EventsCurrentState = T.RT_202,
    StateEvent = {
      [1] = {
        NextStateId = 3900142,
        TypeNextState = T.RT_203
      }
    },
    StateId = 3900141
  },
  [3900142] = {
    EventsCurrentState = T.RT_204,
    StateEvent = {
      [1] = {
        NextStateId = 3900143,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900142
  },
  [3900143] = {
    EventsCurrentState = T.RT_207,
    StateId = 3900143
  },
  [3900151] = {
    EventsCurrentState = T.RT_151,
    StateId = 3900151
  },
  [3900152] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 3900151,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900152
  },
  [3900180] = {
    EventsCurrentState = T.RT_197,
    StateEvent = {
      [1] = {
        NextStateId = 3900181,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900180
  },
  [3900181] = {
    EventsCurrentState = T.RT_199,
    StateEvent = {
      [1] = {
        NextStateId = 3900182,
        TypeNextState = {Param = 60, Type = "Time"}
      },
      [2] = T.RT_208
    },
    StateId = 3900181
  },
  [3900182] = {
    EventsCurrentState = T.RT_199,
    StateEvent = T.RT_209,
    StateId = 3900182
  },
  [3900183] = {
    EventsCurrentState = T.RT_197,
    StateEvent = T.RT_209,
    StateId = 3900183
  },
  [3900200] = {
    EventsCurrentState = T.RT_82,
    StateEvent = {
      [1] = {
        NextStateId = 3900131,
        TypeNextState = T.RT_198
      }
    },
    StateId = 3900200
  },
  [3900700] = {
    EventsCurrentState = {
      T.RT_79,
      T.RT_212
    },
    StateEvent = {
      [1] = {
        NextStateId = 3900701,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900700
  },
  [3900701] = {
    EventsCurrentState = {
      T.RT_75,
      T.RT_213
    },
    StateEvent = {
      [1] = {
        NextStateId = 3900700,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3900701
  },
  [3901500] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_214,
      [2] = T.RT_215
    },
    StateId = 3901500
  },
  [3901501] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_216,
      [2] = T.RT_215
    },
    StateId = 3901501
  },
  [3901502] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_216,
      [2] = T.RT_214
    },
    StateId = 3901502
  },
  [3901510] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_217
    },
    StateId = 3901510
  },
  [3901511] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_218,
      [2] = {
        NextStateId = 3901512,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3901511
  },
  [3901512] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = T.RT_218,
      [2] = T.RT_217
    },
    StateId = 3901512
  },
  [3901600] = {
    EventsCurrentState = {
      T.RT_79,
      T.RT_212,
      T.RT_22,
      T.RT_9
    },
    StateEvent = {
      [1] = {
        NextStateId = 3901601,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3901603,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 3901605,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3901600
  },
  [3901601] = {
    EventsCurrentState = T.RT_219,
    StateEvent = {
      [1] = T.RT_220,
      [2] = {
        NextStateId = 3901602,
        TypeNextState = T.RT_92
      }
    },
    StateId = 3901601
  },
  [3901602] = {
    EventsCurrentState = T.RT_221,
    StateEvent = {
      [1] = T.RT_220
    },
    StateId = 3901602
  },
  [3901603] = {
    EventsCurrentState = T.RT_219,
    StateEvent = {
      [1] = T.RT_220,
      [2] = {
        NextStateId = 3901604,
        TypeNextState = T.RT_92
      }
    },
    StateId = 3901603
  },
  [3901604] = {
    EventsCurrentState = T.RT_221,
    StateEvent = {
      [1] = {
        NextStateId = 3901603,
        TypeNextState = T.RT_222
      }
    },
    StateId = 3901604
  },
  [3901605] = {
    EventsCurrentState = T.RT_219,
    StateEvent = {
      [1] = T.RT_220,
      [2] = {
        NextStateId = 3901606,
        TypeNextState = T.RT_92
      }
    },
    StateId = 3901605
  },
  [3901606] = {
    EventsCurrentState = T.RT_221,
    StateEvent = {
      [1] = {
        NextStateId = 3901600,
        TypeNextState = T.RT_222
      }
    },
    StateId = 3901606
  },
  [3901700] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 3901701,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_223
    },
    StateId = 3901700
  },
  [3901701] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_223,
      [2] = T.RT_224
    },
    StateId = 3901701
  },
  [3901702] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_224
    },
    StateId = 3901702
  },
  [3901800] = {
    EventsCurrentState = T.RT_210,
    StateEvent = {
      [1] = {
        NextStateId = 3901801,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3901802,
        TypeNextState = T.RT_92
      }
    },
    StateId = 3901800
  },
  [3901801] = {
    EventsCurrentState = T.RT_211,
    StateEvent = T.RT_226,
    StateId = 3901801
  },
  [3901802] = {
    EventsCurrentState = T.RT_211,
    StateEvent = T.RT_226,
    StateId = 3901802
  },
  [3901803] = {StateId = 3901803},
  [3902000] = {
    EventsCurrentState = T.RT_227,
    StateEvent = {
      [1] = {
        NextStateId = 3902001,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902000
  },
  [3902001] = {
    EventsCurrentState = {
      T.RT_143,
      T.RT_79
    },
    StateEvent = {
      [1] = {
        NextStateId = 3902002,
        TypeNextState = {
          ActiveRange = 2000,
          Type = "DistanceActive"
        }
      },
      [2] = T.RT_228
    },
    StateId = 3902001
  },
  [3902002] = {
    EventsCurrentState = T.RT_229,
    StateEvent = {
      [1] = {
        NextStateId = 3902001,
        TypeNextState = T.RT_230
      },
      [2] = T.RT_228
    },
    StateId = 3902002
  },
  [3902100] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 3902101,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902100
  },
  [3902101] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 3902100,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902101
  },
  [3902300] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_231,
      [2] = T.RT_232
    },
    StateId = 3902300
  },
  [3902301] = {
    StateEvent = {
      [1] = T.RT_232,
      [2] = T.RT_233
    },
    StateId = 3902301
  },
  [3902302] = {
    StateEvent = {
      [1] = T.RT_231,
      [2] = T.RT_233
    },
    StateId = 3902302
  },
  [3902400] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = {
        NextStateId = 3902401,
        TypeNextState = T.RT_234
      },
      [2] = {
        NextStateId = 3902402,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902400
  },
  [3902401] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_236,
    StateId = 3902401
  },
  [3902402] = {
    EventsCurrentState = T.RT_150,
    StateEvent = T.RT_236,
    StateId = 3902402
  },
  [3902500] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_237,
      [2] = T.RT_238
    },
    StateId = 3902500
  },
  [3902501] = {
    StateEvent = {
      [1] = T.RT_238,
      [2] = T.RT_239
    },
    StateId = 3902501
  },
  [3902502] = {
    StateEvent = {
      [1] = T.RT_237,
      [2] = T.RT_239
    },
    StateId = 3902502
  },
  [3902700] = {
    StateEvent = {
      [1] = T.RT_240,
      [2] = T.RT_241,
      [3] = T.RT_242,
      [4] = {
        NextStateId = 3902708,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902700
  },
  [3902701] = {
    StateEvent = {
      [1] = T.RT_243,
      [2] = T.RT_241,
      [3] = T.RT_242,
      [4] = T.RT_244,
      [5] = T.RT_245,
      [6] = T.RT_246
    },
    StateId = 3902701
  },
  [3902702] = {
    StateEvent = {
      [1] = T.RT_240,
      [2] = T.RT_243,
      [3] = T.RT_242,
      [4] = T.RT_244,
      [5] = T.RT_245,
      [6] = T.RT_246
    },
    StateId = 3902702
  },
  [3902703] = {
    StateEvent = {
      [1] = T.RT_240,
      [2] = T.RT_241,
      [3] = T.RT_243,
      [4] = T.RT_244,
      [5] = T.RT_245,
      [6] = T.RT_246
    },
    StateId = 3902703
  },
  [3902704] = {
    StateEvent = T.RT_248,
    StateId = 3902704
  },
  [3902705] = {
    StateEvent = T.RT_248,
    StateId = 3902705
  },
  [3902706] = {
    StateEvent = T.RT_248,
    StateId = 3902706
  },
  [3902707] = {StateId = 3902707},
  [3902708] = {
    StateEvent = {
      [1] = T.RT_243
    },
    StateId = 3902708
  },
  [3902710] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902711,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3902712,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 3902713,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902710
  },
  [3902711] = {
    StateEvent = {
      [1] = T.RT_249,
      [2] = {
        NextStateId = 3902714,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902711
  },
  [3902712] = {
    StateEvent = {
      [1] = T.RT_249,
      [2] = {
        NextStateId = 3902715,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902712
  },
  [3902713] = {
    StateEvent = {
      [1] = T.RT_249,
      [2] = {
        NextStateId = 3902716,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902713
  },
  [3902714] = {StateId = 3902714},
  [3902715] = {StateId = 3902715},
  [3902716] = {StateId = 3902716},
  [3902720] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902721,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3902722,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 3902723,
        TypeNextState = T.RT_4
      },
      [4] = {
        NextStateId = 3902724,
        TypeNextState = T.RT_4
      },
      [5] = {
        NextStateId = 3902725,
        TypeNextState = T.RT_4
      },
      [6] = {
        NextStateId = 3902726,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902720
  },
  [3902721] = {
    StateEvent = T.RT_251,
    StateId = 3902721
  },
  [3902722] = {
    StateEvent = T.RT_251,
    StateId = 3902722
  },
  [3902723] = {
    StateEvent = T.RT_251,
    StateId = 3902723
  },
  [3902724] = {
    StateEvent = T.RT_253,
    StateId = 3902724
  },
  [3902725] = {
    StateEvent = T.RT_253,
    StateId = 3902725
  },
  [3902726] = {
    StateEvent = T.RT_253,
    StateId = 3902726
  },
  [3902727] = {StateId = 3902727},
  [3902750] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902751,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3902752,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 3902753,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902750
  },
  [3902751] = {
    StateEvent = {
      [1] = T.RT_254,
      [2] = {
        NextStateId = 3902754,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902751
  },
  [3902752] = {
    StateEvent = {
      [1] = T.RT_254,
      [2] = {
        NextStateId = 3902755,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902752
  },
  [3902753] = {
    StateEvent = {
      [1] = T.RT_254,
      [2] = {
        NextStateId = 3902756,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902753
  },
  [3902754] = {
    StateEvent = T.RT_256,
    StateId = 3902754
  },
  [3902755] = {
    StateEvent = T.RT_256,
    StateId = 3902755
  },
  [3902756] = {
    StateEvent = T.RT_256,
    StateId = 3902756
  },
  [3902757] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902758,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902757
  },
  [3902758] = {StateId = 3902758},
  [3902790] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902791,
        TypeNextState = T.RT_4
      },
      [2] = {
        NextStateId = 3902794,
        TypeNextState = T.RT_4
      },
      [3] = {
        NextStateId = 3902797,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902790
  },
  [3902791] = {
    StateEvent = {
      [1] = T.RT_257,
      [2] = T.RT_258
    },
    StateId = 3902791
  },
  [3902792] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902793,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902792
  },
  [3902793] = {StateId = 3902793},
  [3902794] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902795,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_258,
      [3] = T.RT_257
    },
    StateId = 3902794
  },
  [3902795] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902796,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902795
  },
  [3902796] = {StateId = 3902796},
  [3902797] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902798,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_258,
      [3] = T.RT_257
    },
    StateId = 3902797
  },
  [3902798] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902799,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902798
  },
  [3902799] = {StateId = 3902799},
  [3902800] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902801,
        TypeNextState = T.RT_259
      }
    },
    StateId = 3902800
  },
  [3902801] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902802,
        TypeNextState = T.RT_10
      }
    },
    StateId = 3902801
  },
  [3902802] = {StateId = 3902802},
  [3902803] = {
    StateEvent = {
      [1] = {
        NextStateId = 3902800,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3902803
  },
  [3902900] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_260,
      [2] = T.RT_261,
      [3] = {
        NextStateId = 3902903,
        TypeNextState = T.RT_3
      }
    },
    StateId = 3902900
  },
  [3902901] = {
    StateEvent = {
      [1] = T.RT_261,
      [2] = T.RT_262
    },
    StateId = 3902901
  },
  [3902902] = {
    StateEvent = {
      [1] = T.RT_260,
      [2] = T.RT_262
    },
    StateId = 3902902
  },
  [3902903] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 3902900,
        TypeNextState = T.RT_174
      }
    },
    StateId = 3902903
  },
  [3903000] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903001,
        TypeNextState = T.RT_3
      }
    },
    StateId = 3903000
  },
  [3903001] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903002,
        TypeNextState = T.RT_10
      }
    },
    StateId = 3903001
  },
  [3903002] = {
    StateEvent = T.RT_264,
    StateId = 3903002
  },
  [3903003] = {
    StateEvent = T.RT_264,
    StateId = 3903003
  },
  [3903100] = {
    StateEvent = T.RT_267,
    StateId = 3903100
  },
  [3903101] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903103,
        TypeNextState = {
          ActiveRange = 500,
          Type = "DistanceActive"
        }
      }
    },
    StateId = 3903101
  },
  [3903102] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903103,
        TypeNextState = T.RT_3
      }
    },
    StateId = 3903102
  },
  [3903103] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903104,
        TypeNextState = T.RT_10
      }
    },
    StateId = 3903103
  },
  [3903104] = {
    StateEvent = T.RT_267,
    StateId = 3903104
  },
  [3903200] = {
    StateEvent = {
      [1] = T.RT_268,
      [2] = T.RT_269,
      [3] = T.RT_270,
      [4] = {
        NextStateId = 3903208,
        TypeNextState = T.RT_4
      },
      [5] = T.RT_271,
      [6] = T.RT_272
    },
    StateId = 3903200
  },
  [3903201] = {
    StateEvent = {
      [1] = T.RT_273,
      [2] = T.RT_269,
      [3] = T.RT_270,
      [4] = T.RT_272,
      [5] = T.RT_274,
      [6] = T.RT_271
    },
    StateId = 3903201
  },
  [3903202] = {
    StateEvent = {
      [1] = T.RT_268,
      [2] = T.RT_273,
      [3] = T.RT_270,
      [4] = T.RT_272,
      [5] = T.RT_274,
      [6] = T.RT_271
    },
    StateId = 3903202
  },
  [3903203] = {
    StateEvent = {
      [1] = T.RT_268,
      [2] = T.RT_269,
      [3] = T.RT_273,
      [4] = T.RT_272,
      [5] = T.RT_274,
      [6] = T.RT_271
    },
    StateId = 3903203
  },
  [3903204] = {StateId = 3903204},
  [3903205] = {StateId = 3903205},
  [3903206] = {StateId = 3903206},
  [3903208] = {
    StateEvent = {
      [1] = T.RT_273
    },
    StateId = 3903208
  },
  [3903600] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903601,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_275,
      [3] = T.RT_276
    },
    StateId = 3903600
  },
  [3903601] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903602,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_275
    },
    StateId = 3903601
  },
  [3903602] = {
    StateEvent = {
      [1] = T.RT_275
    },
    StateId = 3903602
  },
  [3903603] = {
    StateEvent = {
      [1] = T.RT_276
    },
    StateId = 3903603
  },
  [3903604] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903605,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3903604
  },
  [3903605] = {
    StateEvent = {
      [1] = {
        NextStateId = 3903600,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_275
    },
    StateId = 3903605
  },
  [3904200] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904201,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904200
  },
  [3904201] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904202,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904201
  },
  [3904202] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904203,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904202
  },
  [3904203] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904204,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904203
  },
  [3904204] = {StateId = 3904204},
  [3904300] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904301,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904300
  },
  [3904301] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904302,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904301
  },
  [3904302] = {StateId = 3904302},
  [3904400] = {
    StateEvent = {
      [1] = T.RT_277
    },
    StateId = 3904400
  },
  [3904401] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904402,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904401
  },
  [3904402] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904403,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904402
  },
  [3904403] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904404,
        TypeNextState = T.RT_25
      }
    },
    StateId = 3904403
  },
  [3904404] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904405,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904404
  },
  [3904405] = {
    StateEvent = {
      [1] = {NextStateId = 3904406}
    },
    StateId = 3904405
  },
  [3904500] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904501,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904500
  },
  [3904501] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904502,
        TypeNextState = T.RT_3
      }
    },
    StateId = 3904501
  },
  [3904502] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904500,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_277
    },
    StateId = 3904502
  },
  [3904601] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904602,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904601
  },
  [3904602] = {
    StateEvent = {
      [1] = {
        NextStateId = 3904601,
        TypeNextState = T.RT_4
      }
    },
    StateId = 3904602
  },
  [4900101] = {
    EventsCurrentState = T.RT_151,
    StateEvent = {
      [1] = T.RT_280,
      [2] = T.RT_281
    },
    StateId = 4900101
  },
  [4900102] = {
    StateEvent = {
      [1] = T.RT_280
    },
    StateId = 4900102
  },
  [4900103] = {
    StateEvent = {
      [1] = T.RT_281
    },
    StateId = 4900103
  },
  [4900104] = {
    EventsCurrentState = T.RT_150,
    StateEvent = {
      [1] = {
        NextStateId = 4900101,
        TypeNextState = T.RT_198
      }
    },
    StateId = 4900104
  },
  [4900710] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_282,
      T.RT_283,
      T.RT_20,
      T.RT_57
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_285,
        NextStateId = 4900711,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_286
    },
    StateId = 4900710
  },
  [4900711] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_282,
      T.RT_287,
      T.RT_288,
      T.RT_289,
      T.RT_13
    },
    StateEvent = {
      [1] = T.RT_290,
      [2] = T.RT_286
    },
    StateId = 4900711
  },
  [4900712] = {
    EventsCurrentState = T.RT_292,
    StateEvent = {
      [1] = T.RT_290
    },
    StateId = 4900712
  },
  [4900730] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_293,
      T.RT_294,
      T.RT_20,
      T.RT_57
    },
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_296,
        NextStateId = 4900731,
        TypeNextState = T.RT_3
      },
      [2] = T.RT_297
    },
    StateId = 4900730
  },
  [4900731] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_293,
      T.RT_298,
      T.RT_299,
      T.RT_300,
      T.RT_13
    },
    StateEvent = {
      [1] = T.RT_301,
      [2] = T.RT_297
    },
    StateId = 4900731
  },
  [4900732] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_291,
      T.RT_300,
      T.RT_22,
      T.RT_298,
      T.RT_57
    },
    StateEvent = {
      [1] = T.RT_301
    },
    StateId = 4900732
  },
  [4900750] = {
    EventsCurrentState = {
      T.RT_17,
      T.RT_282,
      T.RT_288,
      T.RT_289,
      T.RT_13
    },
    StateEvent = {
      [1] = {
        EventsNextState = {
          {
            EffectId = 900023,
            Function = "PlayFX",
            NeedFinish = false,
            Tag = "Niagara1"
          }
        },
        NextStateId = 4900751,
        TypeNextState = T.RT_4
      },
      [2] = T.RT_303
    },
    StateId = 4900750
  },
  [4900751] = {
    EventsCurrentState = {
      T.RT_1,
      T.RT_282,
      T.RT_283,
      T.RT_287,
      T.RT_20,
      T.RT_57
    },
    StateEvent = {
      [1] = T.RT_303,
      [2] = {
        EventsNextState = {
          {
            EffectId = 900023,
            Function = "PlayFX",
            NeedFinish = false,
            Tag = "Niagara2"
          }
        },
        NextStateId = 4900750,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900751
  },
  [4900752] = {
    EventsCurrentState = T.RT_292,
    StateId = 4900752
  },
  [4900761] = {
    EventsCurrentState = T.RT_304,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_302,
        NextStateId = 4900762,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900761
  },
  [4900762] = {
    EventsCurrentState = T.RT_304,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_302,
        NextStateId = 4900763,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900762
  },
  [4900763] = {
    EventsCurrentState = T.RT_304,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_302,
        NextStateId = 4900764,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900763
  },
  [4900764] = {
    EventsCurrentState = T.RT_304,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_302,
        NextStateId = 4900761,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900764
  },
  [4900801] = {
    StateEvent = {
      [1] = {
        NextStateId = 4900802,
        TypeNextState = T.RT_3
      }
    },
    StateId = 4900801
  },
  [4900802] = {
    EventsCurrentState = T.RT_89,
    StateEvent = {
      [1] = {
        NextStateId = 4900801,
        TypeNextState = T.RT_8
      }
    },
    StateId = 4900802
  },
  [4920010] = {
    EventsCurrentState = {
      T.RT_181,
      T.RT_17,
      T.RT_75,
      T.RT_13,
      T.RT_99
    },
    StateEvent = {
      [1] = T.RT_305,
      [2] = {
        NextStateId = 4920013,
        TypeNextState = T.RT_4
      }
    },
    StateId = 4920010
  },
  [4920011] = {
    EventsCurrentState = T.RT_306,
    StateEvent = {
      [1] = T.RT_307,
      [2] = T.RT_308,
      [3] = T.RT_309,
      [4] = T.RT_310
    },
    StateId = 4920011
  },
  [4920012] = {
    EventsCurrentState = {
      T.RT_181,
      T.RT_20,
      T.RT_99
    },
    StateEvent = {
      [1] = {
        NextStateId = 4920010,
        TypeNextState = T.RT_182
      },
      [2] = T.RT_305
    },
    StateId = 4920012
  },
  [4920013] = {
    EventsCurrentState = T.RT_306,
    StateEvent = {
      [1] = T.RT_308,
      [2] = T.RT_307
    },
    StateId = 4920013
  },
  [4920014] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_305,
      [2] = T.RT_310
    },
    StateId = 4920014
  },
  [4920015] = {
    EventsCurrentState = T.RT_29,
    StateEvent = {
      [1] = T.RT_305,
      [2] = T.RT_309
    },
    StateId = 4920015
  },
  [6100171] = {
    EventsCurrentState = {
      T.RT_116,
      T.RT_358
    },
    StateId = 6100171
  },
  [7040311] = {
    StateEvent = {
      [1] = T.RT_411,
      [2] = T.RT_414,
      [3] = T.RT_412,
      [4] = T.RT_413
    },
    StateId = 7040311
  },
  [7040321] = {
    StateEvent = {
      [1] = T.RT_412,
      [2] = T.RT_414,
      [3] = T.RT_410,
      [4] = T.RT_413
    },
    StateId = 7040321
  },
  [7040331] = {
    StateEvent = {
      [1] = T.RT_413,
      [2] = T.RT_414,
      [3] = T.RT_410,
      [4] = T.RT_411
    },
    StateId = 7040331
  },
  [7040341] = {
    StateEvent = {
      [1] = T.RT_414,
      [2] = T.RT_410,
      [3] = T.RT_411,
      [4] = T.RT_412
    },
    StateId = 7040341
  },
  [9020001] = {
    EventsCurrentState = T.RT_2,
    StateEvent = {
      [1] = {
        EventsNextState = T.RT_6,
        NextStateId = 9020002,
        TypeNextState = T.RT_3
      }
    },
    StateId = 9020001
  },
  [9020002] = {
    StateEvent = {
      [1] = {
        NextStateId = 9020001,
        TypeNextState = T.RT_10
      }
    },
    StateId = 9020002
  },
  [9020003] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020003
  },
  [9020004] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020004
  },
  [9020005] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020005
  },
  [9020006] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020006
  },
  [9020007] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020007
  },
  [9020008] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020008
  },
  [9020009] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020009
  },
  [9020010] = {
    EventsCurrentState = T.RT_117,
    StateEvent = T.RT_445,
    StateId = 9020010
  },
  [10613011] = {
    StateEvent = {
      [1] = T.RT_63,
      [2] = T.RT_62,
      [3] = {
        NextStateId = 1061301,
        TypeNextState = T.RT_65
      }
    },
    StateId = 10613011
  },
  [10613021] = {
    StateEvent = {
      [1] = T.RT_63,
      [2] = T.RT_61,
      [3] = {
        NextStateId = 1061302,
        TypeNextState = T.RT_65
      }
    },
    StateId = 10613021
  },
  [11301170] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301171,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301170
  },
  [11301171] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301170,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301171
  },
  [11301180] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301181,
        TypeNextState = T.RT_3
      }
    },
    StateId = 11301180
  },
  [11301181] = {StateId = 11301181},
  [11301190] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301191,
        TypeNextState = T.RT_3
      }
    },
    StateId = 11301190
  },
  [11301191] = {StateId = 11301191},
  [11301200] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301201,
        TypeNextState = T.RT_3
      },
      [2] = {
        NextStateId = 11301202,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301200
  },
  [11301201] = {StateId = 11301201},
  [11301202] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301200,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301202
  },
  [11301210] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301211,
        TypeNextState = T.RT_3
      }
    },
    StateId = 11301210
  },
  [11301211] = {StateId = 11301211},
  [11301220] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301221,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301220
  },
  [11301221] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301222,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301221
  },
  [11301222] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301223,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301222
  },
  [11301223] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301224,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301223
  },
  [11301224] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301225,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301224
  },
  [11301225] = {StateId = 11301225},
  [11301230] = {
    EventsCurrentState = {
      T.RT_108,
      T.RT_109,
      T.RT_110,
      T.RT_111,
      T.RT_112
    },
    StateEvent = {
      [1] = T.RT_113,
      [2] = T.RT_114
    },
    StateId = 11301230
  },
  [11301231] = {
    EventsCurrentState = {
      T.RT_108,
      T.RT_109,
      T.RT_110,
      T.RT_111,
      {
        EffectId = 900071,
        Function = "PlayFX",
        Tag = "GearS"
      }
    },
    StateEvent = {
      [1] = T.RT_115,
      [2] = T.RT_114
    },
    StateId = 11301231
  },
  [11301232] = {
    EventsCurrentState = {
      T.RT_112,
      {
        EffectId = 900067,
        Function = "PlayFX",
        Tag = "GearR1"
      },
      {
        EffectId = 900068,
        Function = "PlayFX",
        Tag = "GearR2"
      },
      {
        EffectId = 900069,
        Function = "PlayFX",
        Tag = "GearR3"
      },
      {
        EffectId = 900070,
        Function = "PlayFX",
        Tag = "GearR4"
      }
    },
    StateEvent = {
      [1] = T.RT_115,
      [2] = T.RT_113
    },
    StateId = 11301232
  },
  [11301250] = {
    EventsCurrentState = {
      {
        EffectId = 900065,
        Function = "PlayFX",
        Tag = "Boss"
      }
    },
    StateEvent = {
      [1] = {
        NextStateId = 11301251,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301250
  },
  [11301260] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301261,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301260
  },
  [11301261] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301260,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301261
  },
  [11301270] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301271,
        TypeNextState = T.RT_3
      }
    },
    StateId = 11301270
  },
  [11301271] = {StateId = 11301271},
  [11301280] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301281,
        TypeNextState = T.RT_3
      }
    },
    StateId = 11301280
  },
  [11301281] = {
    StateEvent = {
      [1] = {
        NextStateId = 11301280,
        TypeNextState = T.RT_4
      }
    },
    StateId = 11301281
  }
})
