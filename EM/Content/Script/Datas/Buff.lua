local T = {}
T.RT_1 = {AttrName = "ATK", Rate = 0.4}
T.RT_2 = {
  [1] = T.RT_1
}
T.RT_3 = {11}
T.RT_4 = {800201}
T.RT_5 = {800202}
T.RT_6 = {"Dot"}
T.RT_7 = {ParamType = "Dark"}
T.RT_8 = {
  AttrName = "DamagedRate",
  RateZone = "Rouge",
  Value = 0.025
}
T.RT_9 = {
  [1] = T.RT_8
}
T.RT_10 = {21}
T.RT_11 = {10101101}
T.RT_12 = {"Dot", "RouB101"}
T.RT_13 = {
  DamageTag = T.RT_12,
  EnableIcon = 1,
  Immediately = 1,
  Interval = 1,
  Rate = 0.35,
  Stackable = 1,
  Type = "Dot"
}
T.RT_14 = {
  [1] = T.RT_13
}
T.RT_15 = {AttrName = "ATK", Rate = "#1"}
T.RT_16 = {
  [1] = T.RT_15
}
T.RT_17 = {1025}
T.RT_18 = {10}
T.RT_19 = {
  AttrName = "DamageRate",
  RateZone = "Rouge",
  Value = "#1"
}
T.RT_20 = {
  [1] = T.RT_19
}
T.RT_21 = {10199002}
T.RT_22 = {Value = "#1"}
T.RT_23 = {10199003}
T.RT_24 = {11, 63}
T.RT_25 = {40, 42}
T.RT_26 = {"Hit"}
T.RT_27 = {11, 10101101}
T.RT_28 = {AttrName = "ATK", Rate = 0.3}
T.RT_29 = {
  [1] = T.RT_28
}
T.RT_30 = {10103101}
T.RT_31 = {
  AttrName = "SkillIntensity",
  Rate = "#1",
  Stackable = 1
}
T.RT_32 = {
  [1] = T.RT_31
}
T.RT_33 = {
  AttrName = "ATK",
  Rate = "#1",
  Stackable = 1
}
T.RT_34 = {
  [1] = T.RT_33
}
T.RT_35 = {
  AttrName = "WeaponCRIModifierRate",
  Value = "#1"
}
T.RT_36 = {
  [1] = T.RT_35
}
T.RT_37 = {
  AttrName = "WeaponCRIModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_38 = {
  [1] = T.RT_37
}
T.RT_39 = {
  AttrName = "WeaponCRDModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_40 = {
  [1] = T.RT_39
}
T.RT_41 = {
  AttrName = "TriggerProbModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_42 = {
  [1] = T.RT_41
}
T.RT_43 = {
  AttrName = "MultiShootModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_44 = {
  [1] = T.RT_43
}
T.RT_45 = {
  AttrName = "DamageRate",
  RateZone = "Almighty",
  Value = "#1"
}
T.RT_46 = {
  [1] = T.RT_45
}
T.RT_47 = {
  AttrName = "StrongValue",
  Value = "#1"
}
T.RT_48 = {
  [1] = T.RT_47
}
T.RT_49 = {2012}
T.RT_50 = {
  Interval = 3,
  Type = "SpChange",
  Value = "#1"
}
T.RT_51 = {
  [1] = T.RT_50
}
T.RT_52 = {
  AttrName = "TriggerProbModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_53 = {
  [1] = T.RT_52
}
T.RT_54 = {
  AttrName = "SkillIntensity",
  Rate = "#1"
}
T.RT_55 = {
  [1] = T.RT_54
}
T.RT_56 = {
  AttrName = "WeaponCRIModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_57 = {
  [1] = T.RT_56
}
T.RT_58 = {
  AttrName = "WeaponCRDModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_59 = {
  [1] = T.RT_58
}
T.RT_60 = {"Hot"}
T.RT_61 = {
  BaseAttr = "MaxHp",
  DamageTag = T.RT_60,
  Interval = 1,
  Rate = "#1",
  Type = "Hot"
}
T.RT_62 = {
  [1] = T.RT_61
}
T.RT_63 = {600000502}
T.RT_64 = {
  AttrName = "AttackSpeedModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_65 = {
  [1] = T.RT_64
}
T.RT_66 = {
  AttrName = "EnmityValue",
  Value = "#1"
}
T.RT_67 = {
  [1] = T.RT_66
}
T.RT_68 = {10109102, 10109104}
T.RT_69 = {ParamType = "Water"}
T.RT_70 = {
  AttrName = "AttackSpeedModifierRate",
  Stackable = 1,
  Value = "#1"
}
T.RT_71 = {
  [1] = T.RT_70
}
T.RT_72 = {104}
T.RT_73 = {1021}
T.RT_74 = {
  "FallAttack",
  "HeavyAttack",
  "SlideAttack"
}
T.RT_75 = {
  AttrName = "DamageRate",
  DamageTag = "Skill",
  RateZone = "Normal",
  Value = "#1"
}
T.RT_76 = {
  [1] = T.RT_75
}
T.RT_77 = {1002}
T.RT_78 = {
  AttrName = "AttackSpeedModifierRate",
  Value = "#1"
}
T.RT_79 = {
  AttrName = "EnmityValue",
  Value = "#2"
}
T.RT_80 = {
  [1] = T.RT_78,
  [2] = T.RT_79
}
T.RT_81 = {1008}
T.RT_82 = {ParamType = "Fire"}
T.RT_83 = {
  AttrName = "MoveSpeedAddRate",
  Value = -0.4
}
T.RT_84 = {
  [1] = T.RT_83
}
T.RT_85 = {
  21,
  41,
  49,
  44
}
T.RT_86 = {
  AttrName = "MoveSpeedAddRate",
  Value = 1
}
T.RT_87 = {
  [1] = T.RT_86
}
T.RT_88 = {1003}
T.RT_89 = {ParamType = "Thunder"}
T.RT_90 = {ParamType = "Wind"}
T.RT_91 = {AttrName = "MaxHp", Rate = "#1"}
T.RT_92 = {
  [1] = T.RT_91
}
T.RT_93 = {
  AttrName = "AttackRangeModifierValue",
  Value = "#1"
}
T.RT_94 = {
  [1] = T.RT_93
}
T.RT_95 = {10503}
T.RT_96 = {10503001}
T.RT_97 = {
  AttrName = "TriggerProbModifierRate",
  Value = "#1"
}
T.RT_98 = {
  [1] = T.RT_97
}
T.RT_99 = {
  [1] = T.RT_78
}
T.RT_100 = {
  AttrName = "WeaponCRDModifierRate",
  Value = "#1"
}
T.RT_101 = {
  [1] = T.RT_100
}
T.RT_102 = {10, 12}
T.RT_103 = {AttrName = "ATK", Rate = 0.5}
T.RT_104 = {
  [1] = T.RT_103
}
T.RT_105 = {70}
T.RT_106 = {"FallAttack"}
T.RT_107 = {
  1,
  0,
  0,
  0
}
T.RT_108 = {Default = 0.5}
T.RT_109 = {
  AttrName = "SkillEfficiency",
  Value = 0.08
}
T.RT_110 = {
  [1] = T.RT_109
}
T.RT_111 = {
  AttrName = "ATK",
  Rate = 0.2,
  Stackable = 1
}
T.RT_112 = {
  [1] = T.RT_111
}
T.RT_113 = {201}
T.RT_114 = {110302}
T.RT_115 = {41}
T.RT_116 = {
  "TuosiSkill02",
  "0.8",
  "50"
}
T.RT_117 = {
  "EBulletJump"
}
T.RT_118 = {
  AttrName = "ATK",
  BaseUseValue = 1,
  Rate = "#1",
  SupLimitValue = 315
}
T.RT_119 = {
  AttrName = "WalkSpeedModifier",
  Value = 0.5
}
T.RT_120 = {
  AttrName = "JumpVelocityModifier",
  Value = 0.1
}
T.RT_121 = {Value = -0.25}
T.RT_122 = {AttrName = "SkillRange", Value = 0.3}
T.RT_123 = {1005}
T.RT_124 = {AttrName = "SkillSpeed", Rate = 0.3}
T.RT_125 = {
  AttrName = "DarkDamagedRate",
  Value = 0.5
}
T.RT_126 = {
  [1] = T.RT_125
}
T.RT_127 = {
  AttrName = "SkillIntensity",
  Stackable = 1,
  Value = 0.33
}
T.RT_128 = {
  [1] = T.RT_127
}
T.RT_129 = {AttrName = "Def", Rate = "#1"}
T.RT_130 = {
  [1] = T.RT_129
}
T.RT_131 = {
  [1] = T.RT_119
}
T.RT_132 = {
  "ESecondJump",
  "EWallJump",
  "EBulletJump",
  "Eclimb",
  "EFlipEaves"
}
T.RT_133 = {"Invincible"}
T.RT_134 = {
  AttrName = "DamageRate",
  RateZone = "Normal",
  Value = "#1"
}
T.RT_135 = {
  [1] = T.RT_134
}
T.RT_136 = {6000206}
T.RT_137 = {
  AttrName = "SkillSustain",
  Rate = "#1"
}
T.RT_138 = {
  [1] = T.RT_137
}
T.RT_139 = {Value = -0.3}
T.RT_140 = {206}
T.RT_141 = {Default = 50}
T.RT_142 = {
  AttrName = "MoveSpeedAddRate",
  Value = -0.3
}
T.RT_143 = {
  [1] = T.RT_142
}
T.RT_144 = {20, 42}
T.RT_145 = {20}
T.RT_146 = {
  AttrName = "DamageRate",
  DamageTag = "Melee",
  RateZone = "Normal",
  Stackable = 1,
  Value = "#1"
}
T.RT_147 = {
  AttrName = "TriggerProbModifierRate",
  Stackable = 1,
  Type = "Melee",
  Value = "#2"
}
T.RT_148 = {
  [1] = T.RT_146,
  [2] = T.RT_147
}
T.RT_149 = {
  [150302] = T.RT_139
}
T.RT_150 = {
  [100] = 150305
}
T.RT_151 = {
  AttrName = "DamageRate",
  DamageTag = "Ranged",
  RateZone = "Normal",
  Stackable = 1,
  Value = "#1"
}
T.RT_152 = {
  AttrName = "TriggerProbModifierRate",
  Stackable = 1,
  Type = "Ranged",
  Value = "#2"
}
T.RT_153 = {
  [1] = T.RT_151,
  [2] = T.RT_152
}
T.RT_154 = {
  [150321] = T.RT_139
}
T.RT_155 = {
  [100] = 150306
}
T.RT_156 = {Value = -20}
T.RT_157 = {
  AttrName = "AttackSpeedModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_158 = {
  [1] = T.RT_157
}
T.RT_159 = {150311}
T.RT_160 = {150312}
T.RT_161 = {
  150327,
  150328,
  150329
}
T.RT_162 = {1000}
T.RT_163 = {
  "IncrementDefault",
  "0.5",
  "50"
}
T.RT_164 = {
  "LandHeavy",
  "Crouch",
  "Slide",
  "Interactive",
  "Seating"
}
T.RT_165 = {150409}
T.RT_166 = {"Move", "Hit"}
T.RT_167 = {Value = 1}
T.RT_168 = {
  AttrName = "DamageRate",
  DamageTag = "Weapon",
  RateZone = "Normal",
  Value = "#1"
}
T.RT_169 = {
  [1] = T.RT_168
}
T.RT_170 = {160121}
T.RT_171 = {160122}
T.RT_172 = {
  AttrName = "MoveSpeedAddRate",
  Value = -0.5
}
T.RT_173 = {
  [1] = T.RT_172
}
T.RT_174 = {160101}
T.RT_175 = {
  AllowSkillIntensity = 1,
  AttrName = "BonusDamage",
  Stackable = 1,
  Type = "Light",
  Value = "#1"
}
T.RT_176 = {
  [1] = T.RT_175
}
T.RT_177 = {180102}
T.RT_178 = {11, 180101}
T.RT_179 = {
  0.0068,
  0.0492,
  0.2,
  0
}
T.RT_180 = {Default = 0.4}
T.RT_181 = {Default = 130}
T.RT_182 = {
  FresnelColor = T.RT_179,
  FresnelColorRange = T.RT_180,
  FresnelColorStrength = T.RT_181
}
T.RT_183 = {180101}
T.RT_184 = {2031}
T.RT_185 = {180120}
T.RT_186 = {21, 180121}
T.RT_187 = {"Dot", "Skill"}
T.RT_188 = {
  AllowSkillIntensity = 1,
  DamageTag = T.RT_187,
  DamageType = "Fire",
  Immediately = 1,
  Interval = 2,
  Rate = "#1",
  Type = "Dot"
}
T.RT_189 = {
  [1] = T.RT_188
}
T.RT_190 = {
  AllowSkillIntensity = 1,
  DamageTag = T.RT_187,
  DamageType = "Thunder",
  Immediately = 1,
  Interval = 2,
  Rate = "#1",
  Type = "Dot"
}
T.RT_191 = {
  [1] = T.RT_190
}
T.RT_192 = {
  AllowSkillIntensity = 1,
  DamageTag = T.RT_187,
  DamageType = "Wind",
  Immediately = 1,
  Interval = 2,
  Rate = "#1",
  Type = "Dot"
}
T.RT_193 = {
  [1] = T.RT_192
}
T.RT_194 = {
  AttrName = "BonusDamage",
  Type = "Water",
  Value = "#1"
}
T.RT_195 = {202}
T.RT_196 = {1041}
T.RT_197 = {
  AttrName = "BonusDamage",
  Type = "Fire",
  Value = "#1"
}
T.RT_198 = {203}
T.RT_199 = {1042}
T.RT_200 = {
  AttrName = "BonusDamage",
  Type = "Thunder",
  Value = "#1"
}
T.RT_201 = {204}
T.RT_202 = {1044}
T.RT_203 = {
  AttrName = "BonusDamage",
  Type = "Wind",
  Value = "#1"
}
T.RT_204 = {
  [1] = T.RT_203
}
T.RT_205 = {205}
T.RT_206 = {1043}
T.RT_207 = {
  AttrName = "DamageRate",
  RateZone = "Almighty",
  Stackable = 1,
  Value = 0.06
}
T.RT_208 = {10, 180130}
T.RT_209 = {180131}
T.RT_210 = {180132}
T.RT_211 = {180133}
T.RT_212 = {180134}
T.RT_213 = {
  20,
  41,
  49
}
T.RT_214 = {Rate = 0.5}
T.RT_215 = {
  1,
  0.2,
  0,
  0
}
T.RT_216 = {Default = 0.65}
T.RT_217 = {Default = 20, FresnelColor = 20}
T.RT_218 = {
  FresnelColor = T.RT_215,
  FresnelColorRange = T.RT_216,
  FresnelColorStrength = T.RT_217
}
T.RT_219 = {
  "InvincibleUI"
}
T.RT_220 = {2002}
T.RT_221 = {AttrName = "ATK", Rate = 0.12}
T.RT_222 = {
  [1] = T.RT_221
}
T.RT_223 = {
  AttrName = "FireDamagedRate",
  Value = 4
}
T.RT_224 = {
  AttrName = "WindDamagedRate",
  Value = 4
}
T.RT_225 = {999}
T.RT_226 = {
  AttrName = "DarkDamagedRate",
  Value = 4
}
T.RT_227 = {
  AuraRange = 2000,
  BuffId = 2010102,
  Camp = "OtherFriend"
}
T.RT_228 = {
  [1] = T.RT_227
}
T.RT_229 = {Value = -0.01}
T.RT_230 = {Value = -0.02}
T.RT_231 = {
  AttrName = "SkillIntensity",
  Rate = 0.1
}
T.RT_232 = {
  [1] = T.RT_231
}
T.RT_233 = {
  AttrName = "SkillIntensity",
  Rate = 0.2
}
T.RT_234 = {
  [1] = T.RT_233
}
T.RT_235 = {AttrName = "DEF", Rate = 0.5}
T.RT_236 = {AttrName = "DEF", Rate = -0.1}
T.RT_237 = {
  [1] = T.RT_236
}
T.RT_238 = {
  AttrName = "MaxDamagedValue",
  BaseAttr = "MaxHp",
  Rate = 0.1
}
T.RT_239 = {AttrName = "ATK", Rate = 0.1}
T.RT_240 = {
  [1] = T.RT_239
}
T.RT_241 = {
  AttrName = "DamageRate",
  RateZone = "Rouge",
  Value = 0.75
}
T.RT_242 = {
  [1] = T.RT_241
}
T.RT_243 = {
  AttrName = "MultiShootModifierRate",
  Stackable = 1,
  Value = "#1"
}
T.RT_244 = {
  [1] = T.RT_243
}
T.RT_245 = {1023}
T.RT_246 = {600012}
T.RT_247 = {1001}
T.RT_248 = {1004}
T.RT_249 = {20, 41}
T.RT_250 = {20, 22}
T.RT_251 = {210102}
T.RT_252 = {20, 210101}
T.RT_253 = {
  AllowSkillIntensity = 1,
  DamageTag = T.RT_187,
  DamageType = "Water",
  Immediately = 1,
  Interval = 2,
  PlaySe = 152,
  Rate = "#1",
  Stackable = 1,
  Type = "Dot"
}
T.RT_254 = {
  [1] = T.RT_253
}
T.RT_255 = {ParamType = "ShuimuDot"}
T.RT_256 = {1024}
T.RT_257 = {Default = 30, FresnelColor = 30}
T.RT_258 = {1022}
T.RT_259 = {
  AttrName = "SkillIntensity",
  RateUseValue = 1,
  SupLimitRate = 1.2
}
T.RT_260 = {
  [1] = T.RT_259
}
T.RT_261 = {240121}
T.RT_262 = {
  0.108477,
  0.9003,
  1,
  0
}
T.RT_263 = {Default = 3, FresnelColor = 3}
T.RT_264 = {
  FresnelColor = T.RT_262,
  FresnelColorRange = T.RT_108,
  FresnelColorStrength = T.RT_263
}
T.RT_265 = {
  3001,
  240122,
  240123
}
T.RT_266 = {
  AttrName = "SkillSpeed",
  Rate = "#1",
  Stackable = 1
}
T.RT_267 = {
  [1] = T.RT_266
}
T.RT_268 = {11, 60}
T.RT_269 = {11, 61}
T.RT_270 = {11, 62}
T.RT_271 = {30, 30401}
T.RT_272 = {30402, 30407}
T.RT_273 = {304000001}
T.RT_274 = {30, 30402}
T.RT_275 = {30401, 30407}
T.RT_276 = {304000002}
T.RT_277 = {
  "BossMapSkill",
  "1",
  "999"
}
T.RT_278 = {30, 30407}
T.RT_279 = {30401, 30402}
T.RT_280 = {304000004}
T.RT_281 = {30}
T.RT_282 = {Rate = 0.2}
T.RT_283 = {
  [1010101] = 1019801
}
T.RT_284 = {310111}
T.RT_285 = {21, 310111}
T.RT_286 = {310101}
T.RT_287 = {
  [310101] = 310111,
  [310102] = 310121
}
T.RT_288 = {
  "Attack",
  "FallAttack",
  "HeavyAttack",
  "SlideAttack"
}
T.RT_289 = {
  DotDelay = 1.5,
  Interval = 1,
  Type = "SpChange",
  Value = -20
}
T.RT_290 = {
  [1] = T.RT_289
}
T.RT_291 = {1007}
T.RT_292 = {
  DotDelay = 0.5,
  Interval = 1,
  Type = "SpChange",
  Value = -15
}
T.RT_293 = {
  [1] = T.RT_292
}
T.RT_294 = {
  AttrName = "AlmightyDamageRate",
  Value = 0.55
}
T.RT_295 = {
  [1] = T.RT_294
}
T.RT_296 = {
  AttrName = "MaxAvoidExecuteTimes",
  Value = 2
}
T.RT_297 = {Default = 1.5, FresnelColor = 1.5}
T.RT_298 = {
  AttrName = "MoveSpeedAddRate",
  Value = -0.6
}
T.RT_299 = {
  [1] = T.RT_298
}
T.RT_300 = {21, 42}
T.RT_301 = {310321}
T.RT_302 = {"HotUI"}
T.RT_303 = {320102}
T.RT_304 = {
  AttrName = "MultiShootModifierRate",
  Value = "#1"
}
T.RT_305 = {
  [1] = T.RT_304
}
T.RT_306 = {AttrName = "ATK", Rate = 1}
T.RT_307 = {
  [1] = T.RT_306
}
T.RT_308 = {
  AttrName = "DamagedRate",
  RateZone = "Level",
  Value = 0.5
}
T.RT_309 = {
  [1] = T.RT_308
}
T.RT_310 = {600000901}
T.RT_311 = {
  AttrName = "WalkSpeedModifier",
  Value = 0.25
}
T.RT_312 = {
  AttrName = "SlideVelocityModifier",
  Value = 0.25
}
T.RT_313 = {
  AttrName = "BulletJumpVelocityModifier",
  Value = 0.25
}
T.RT_314 = {
  AttrName = "JumpVelocityModifier",
  Value = 0.25
}
T.RT_315 = {
  [1] = T.RT_311,
  [2] = T.RT_312,
  [3] = T.RT_313,
  [4] = T.RT_314
}
T.RT_316 = {
  Interval = 1,
  Type = "SpChange",
  Value = -6
}
T.RT_317 = {
  [1] = T.RT_316
}
T.RT_318 = {AttrName = "DEF", Rate = "#1"}
T.RT_319 = {
  [1] = T.RT_318
}
T.RT_320 = {
  Interval = 3,
  Type = "SpChange",
  Value = 1
}
T.RT_321 = {
  [1] = T.RT_320
}
T.RT_322 = {2000}
T.RT_323 = {5000010}
T.RT_324 = {Rate = 1}
T.RT_325 = {2105}
T.RT_326 = {"Controlled"}
T.RT_327 = {
  "Dot",
  "PhantomAvoid"
}
T.RT_328 = {
  DamageTag = T.RT_327,
  Interval = 1,
  Rate = 0.8,
  Type = "Dot"
}
T.RT_329 = {
  [1] = T.RT_328
}
T.RT_330 = {600503}
T.RT_331 = {
  AttrName = "SlideVelocityModifier",
  Value = 0.5
}
T.RT_332 = {
  AttrName = "BulletJumpVelocityModifier",
  Value = 0.5
}
T.RT_333 = {
  AttrName = "JumpVelocityModifier",
  Value = 0.5
}
T.RT_334 = {
  [1] = T.RT_119,
  [2] = T.RT_331,
  [3] = T.RT_332,
  [4] = T.RT_333
}
T.RT_335 = {6000}
T.RT_336 = {
  AttrName = "BulletJumpVelocityModifier",
  Value = 1.5
}
T.RT_337 = {
  [1] = T.RT_119,
  [2] = T.RT_331,
  [3] = T.RT_336,
  [4] = T.RT_333
}
T.RT_338 = {Value = "#2"}
T.RT_339 = {10, 510103}
T.RT_340 = {
  10.88886,
  2.91666,
  20,
  0
}
T.RT_341 = {
  FresnelColor = T.RT_340,
  FresnelColorRange = T.RT_180,
  FresnelColorStrength = T.RT_297
}
T.RT_342 = {
  510106,
  510108,
  510109,
  510110,
  510111,
  510112
}
T.RT_343 = {
  "Stealth",
  "Translucency"
}
T.RT_344 = {10, 510221}
T.RT_345 = {510201}
T.RT_346 = {
  "FallAttack",
  "HeavyAttack",
  "SlideAttack",
  "Attack"
}
T.RT_347 = {530121}
T.RT_348 = {530102}
T.RT_349 = {11, 540101}
T.RT_350 = {
  EffectId = 540112,
  Immediately = 1,
  Interval = 1,
  Type = "SkillEffect"
}
T.RT_351 = {
  [1] = T.RT_350
}
T.RT_352 = {
  AllowSkillRange = 1,
  AuraRange = 600,
  BuffId = 540112,
  Camp = "Enemy"
}
T.RT_353 = {540111}
T.RT_354 = {
  AllowSkillIntensity = 1,
  Condition = 2,
  DamageTag = T.RT_60,
  DefaultHealFX = 1,
  Immediately = 1,
  Interval = 1,
  Rate = "#1",
  Type = "Hot",
  Value = 3
}
T.RT_355 = {
  [1] = T.RT_354
}
T.RT_356 = {540121}
T.RT_357 = {540123}
T.RT_358 = {
  DamageTag = T.RT_60,
  DefaultHealFX = 0,
  Interval = 1,
  Rate = 0.025,
  Type = "Hot"
}
T.RT_359 = {
  [1] = T.RT_358
}
T.RT_360 = {600000103}
T.RT_361 = {600010}
T.RT_362 = {AttrName = "SkillSpeed", Rate = 0.4}
T.RT_363 = {
  Char = "Mon_Strong_Single"
}
T.RT_364 = {
  Char = "Mon_Strong_Double"
}
T.RT_365 = {
  Char = "Mon_Strong_Tripple"
}
T.RT_366 = {
  41,
  42,
  43,
  44
}
T.RT_367 = {2102}
T.RT_368 = {11, 1000}
T.RT_369 = {
  AttrName = "WeaponCRIModifierRate",
  Value = 1
}
T.RT_370 = {
  [1] = T.RT_369
}
T.RT_371 = {
  AttrName = "SkillIntensity",
  Rate = 1
}
T.RT_372 = {
  [1] = T.RT_371
}
T.RT_373 = {
  AttrName = "EnmityValue",
  Value = 1
}
T.RT_374 = {
  [1] = T.RT_373
}
T.RT_375 = {
  AttrName = "MoveSpeedAddRate",
  Value = 0.5
}
T.RT_376 = {
  50,
  7.0434,
  2.06,
  1
}
T.RT_377 = {
  DMMIColor = T.RT_376,
  DMMILineWidth = 0.5
}
T.RT_378 = {
  ParamType = "Invisibility",
  Priority = 1
}
T.RT_379 = {AttrName = "MaxES", Rate = "#1"}
T.RT_380 = {AttrName = "DEF", Rate = "#2"}
T.RT_381 = {AttrName = "MaxHp", Rate = "#3"}
T.RT_382 = {40, 41}
T.RT_383 = {Rate = 0.01}
T.RT_384 = {
  "BossMapSkill",
  "0.5",
  "999"
}
T.RT_385 = {
  41,
  42,
  43
}
T.RT_386 = {
  "BossLinenDefault",
  "0.5",
  "5"
}
T.RT_387 = {
  "BossMapSkill",
  "2",
  "999"
}
T.RT_388 = {
  "FallAttack",
  "HeavyAttack",
  "SlideAttack",
  "Skill1",
  "Skill2",
  "Reload"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Buff", {
  [1] = {
    BuffId = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Phantom",
        Value = -0.5
      }
    },
    BuffId = 2,
    DeadNotRemove = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [3] = {
    BuffId = 3,
    FresnelParams = {
      FresnelColor = {
        1,
        0.84682,
        0.359142,
        0
      },
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = T.RT_141
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_133
  },
  [4] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_CommonBulletJump.BP_Buff_CommonBulletJump",
    BuffId = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [5] = {
    AddAttrs = T.RT_131,
    AddPassiveEffect = {1},
    BuffAnimInstance = "Ride",
    BuffId = 5,
    DisableEmoIdle = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {
      "LandHeavy",
      "Hit",
      "Crouch",
      "Avoid",
      "Interactive",
      "Seating",
      "Shooting",
      "Skill"
    }
  },
  [11] = {
    AddAttrs = T.RT_16,
    BuffId = 11,
    BuffType = T.RT_102,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [12] = {
    AddAttrs = T.RT_130,
    BuffId = 12,
    BuffType = T.RT_102,
    BuffTypeImgPath = "Def_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [13] = {
    AddAttrs = T.RT_55,
    BuffId = 13,
    BuffType = T.RT_102,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [14] = {
    AddAttrs = T.RT_138,
    BuffId = 14,
    BuffType = T.RT_102,
    BuffTypeImgPath = "Skill_Sustain_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [21] = {
    AddAttrs = T.RT_16,
    BuffId = 21,
    BuffType = T.RT_250,
    BuffTypeImgPath = "Atk_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [22] = {
    AddAttrs = T.RT_130,
    BuffId = 22,
    BuffType = T.RT_250,
    BuffTypeImgPath = "Def_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [23] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = "#1"
      }
    },
    BuffId = 23,
    BuffType = T.RT_250,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [41] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        ValueUseValue = 1
      }
    },
    BuffId = 41,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [50] = {
    BuffId = 50,
    DeadNotRemove = true,
    EffectCreatureID = 1,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [51] = {
    BuffId = 51,
    DeadNotRemove = true,
    EffectCreatureID = 2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [52] = {
    BuffId = 52,
    BuffType = T.RT_250,
    BuffTypeImgPath = "Def_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [90] = {
    ActivateSkills = {
      Attack = 4010100,
      HeavyShooting = 4010101,
      Shooting = 4010101
    },
    BuffId = 90,
    BuffType = T.RT_105,
    DisableSkills = T.RT_388,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [91] = {
    ActivateSkills = {
      Attack = 90,
      HeavyShooting = 91,
      Shooting = 91
    },
    BuffId = 91,
    BuffType = T.RT_105,
    DisableSkills = T.RT_388,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [92] = {
    ActivateSkills = {
      Attack = 4010200,
      HeavyShooting = 4010201,
      Shooting = 4010201
    },
    BuffId = 92,
    BuffType = T.RT_105,
    DisableSkills = T.RT_388,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [96] = {
    AddAttrs = T.RT_29,
    BuffDamagedRate = T.RT_139,
    BuffId = 96,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {114}
  },
  [97] = {
    BuffId = 97,
    DeadNotRemove = true,
    ExpRate = -0.9999,
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [98] = {
    BuffId = 98,
    DisableSkills = {"Skill2"},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [99] = {
    BuffId = 99,
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        Interval = 0.5,
        Type = "SpChange",
        Value = 5
      }
    },
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [101] = {
    AddAttrs = {
      [1] = {
        AttrName = "BossTNToZeroRecoverSpeed",
        Rate = -0.01,
        Stackable = 1
      }
    },
    BuffId = 101,
    BuffType = {
      20,
      100,
      101
    },
    BuffTypeImgPath = "Dot_Dark",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Dark",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = T.RT_7,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [102] = {
    BuffId = 102,
    BuffType = {
      20,
      100,
      102
    },
    BuffTypeImgPath = "Dot_Water",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Water",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = T.RT_69,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [103] = {
    BuffId = 103,
    BuffType = {
      20,
      100,
      103
    },
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Fire",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = T.RT_82,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [104] = {
    BuffId = 104,
    BuffType = {
      20,
      100,
      104
    },
    BuffTypeImgPath = "Dot_Thunder",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Thunder",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = T.RT_89,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [105] = {
    BuffId = 105,
    BuffType = {
      20,
      100,
      105
    },
    BuffTypeImgPath = "Dot_Wind",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Wind",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = T.RT_90,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [106] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Element_Light.BP_Buff_Element_Light",
    BuffId = 106,
    BuffType = {
      20,
      100,
      106
    },
    BuffTypeImgPath = "Dot_Light",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Light",
        EnableIcon = 1,
        Immediately = 1,
        Interval = 2,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    DotDeathSe = 152,
    FXMID = {ParamType = "Light"},
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    Priority = 10
  },
  [201] = {
    BuffId = 201,
    BuffType = T.RT_213,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetCharacterTag = "Stun",
    StunType = "StunBlind"
  },
  [202] = {
    BuffId = 202,
    BuffType = T.RT_213,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunBound"
  },
  [203] = {
    BuffId = 203,
    BuffType = {
      20,
      41,
      203,
      49
    },
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunParalysis",
    VisualEffects = T.RT_246
  },
  [204] = {
    BuffId = 204,
    BuffType = T.RT_213,
    BuffTypeImgPath = "Stun",
    EnterFloating = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [205] = {
    BuffId = 205,
    BuffType = {20, 43},
    BuffTypeImgPath = "Taunt",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = {"Taunt"},
    VisualEffects = {600013}
  },
  [206] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.8
      }
    },
    BuffEffects = T.RT_184,
    BuffId = 206,
    BuffType = T.RT_144,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [207] = {
    BuffId = 207,
    BuffType = T.RT_249,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetCharacterTag = "Stun",
    StunType = "StunCommon"
  },
  [301] = {
    BuffId = 301,
    BuffType = T.RT_268,
    BuffTypeImgPath = "Invincible",
    ForbidBuffType = T.RT_115,
    FresnelParams = T.RT_218,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    Priority = 1000,
    SpecialEffect = T.RT_133,
    UISpecialEffect = T.RT_219
  },
  [302] = {
    BuffId = 302,
    BuffType = T.RT_269,
    BuffTypeImgPath = "Common_Buff",
    DMMIParams = {
      DMMIColor = {
        10,
        10,
        10,
        0
      },
      DMMILineWidth = 0.5
    },
    FXMID = {
      ParamType = "Invisibility"
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [303] = {
    AddAttrs = T.RT_87,
    BuffEffects = T.RT_162,
    BuffId = 303,
    BuffType = T.RT_270,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [304] = {
    BuffId = 304,
    DeadNotRemove = true,
    IsAvatarBuff = true,
    LockHp = T.RT_167,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [305] = {
    BuffId = 305,
    BuffType = T.RT_24,
    BuffTypeImgPath = "Endure",
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [306] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        IndividualRateZone = 1,
        Value = 0
      }
    },
    BuffId = 306,
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [307] = {
    BuffId = 307,
    BuffType = T.RT_268,
    ForbidBuffType = T.RT_115,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    SpecialEffect = T.RT_133
  },
  [308] = {
    BuffId = 308,
    BuffType = {
      20,
      60,
      61
    },
    ForbidBuffType = T.RT_115,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    SpecialEffect = {"Invincible", "Stealth"}
  },
  [309] = {
    ActivateSkills = T.RT_283,
    BuffId = 309,
    DeadNotRemove = true,
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310] = {
    ActivateSkills = T.RT_283,
    BuffId = 310,
    DeadNotRemove = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [402] = {
    AddAttrs = T.RT_16,
    BuffEffects = {4022},
    BuffId = 402,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [406] = {
    BuffDamageRate = T.RT_22,
    BuffId = 406,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damage_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [408] = {
    BuffDamagedRate = T.RT_22,
    BuffEffects = {4081},
    BuffId = 408,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [409] = {
    BuffEffects = {4091},
    BuffId = 409,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = T.RT_62,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [411] = {
    AddAttrs = T.RT_319,
    BuffId = 411,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Def_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [412] = {
    AddAttrs = T.RT_16,
    BuffEffects = {4122},
    BuffId = 412,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [413] = {
    AddAttrs = T.RT_138,
    BuffId = 413,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Sustain_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [415] = {
    AddAttrs = T.RT_319,
    BuffEffects = {4152},
    BuffId = 415,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Def_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [416] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = "#1"
      }
    },
    BuffId = 416,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Def_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [421] = {
    AddAttrs = T.RT_48,
    BuffEffects = {4212},
    BuffId = 421,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Morale",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [422] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Stackable = 1,
        Value = "#1"
      }
    },
    BuffEffects = {4222},
    BuffId = 422,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [423] = {
    AddAttrs = T.RT_305,
    BuffEffects = {4232},
    BuffId = 423,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Multishoot_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [424] = {
    AddAttrs = T.RT_76,
    BuffEffects = {4242},
    BuffId = 424,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [425] = {
    AddAttrs = T.RT_67,
    BuffEffects = {4252},
    BuffId = 425,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Berserk",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [426] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Light",
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_140,
    BuffEffects = {4262},
    BuffId = 426,
    BuffType = T.RT_18,
    BuffTypeImgPath = "BonusDmg_Light",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [801] = {
    AddAttrs = {
      [1] = T.RT_379
    },
    BuffId = 801,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [802] = {
    AddAttrs = {
      [1] = T.RT_380,
      [2] = T.RT_379
    },
    BuffId = 802,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [803] = {
    AddAttrs = {
      [1] = T.RT_381,
      [2] = T.RT_380,
      [3] = T.RT_379
    },
    BuffId = 803,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [804] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = "#4"},
      [2] = T.RT_381,
      [3] = T.RT_380,
      [4] = T.RT_379
    },
    BuffId = 804,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [901] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_901.BP_Buff_901",
    BuffId = 901,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [902] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_901.BP_Buff_901",
    BuffId = 902,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [903] = {
    AllowSkillSustainModify = true,
    BuffId = 903,
    DeadNotRemove = true,
    LockHp = T.RT_167,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [904] = {
    BuffId = 904,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SetCharacterTag = "Interactive"
  },
  [1311] = {
    AddAttrs = T.RT_34,
    BuffId = 1311,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 15,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1312] = {
    AddAttrs = T.RT_55,
    BuffId = 1312,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1313] = {
    AddAttrs = T.RT_135,
    BuffId = 1313,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1314] = {
    AddAttrs = T.RT_135,
    BuffId = 1314,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1315] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "BossDown",
        Value = "#1"
      }
    },
    BuffId = 1315,
    BuffType = T.RT_136,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1316] = {
    AddAttrs = T.RT_34,
    BuffId = 1316,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1430] = {
    BuffId = 1430,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1430001,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1440] = {
    BuffId = 1440,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1440001,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1523] = {
    BuffId = 1523,
    LockHp = T.RT_167,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1526] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        IndividualRateZone = 1,
        Value = -0.15
      }
    },
    BuffId = 1526,
    ForbidCatch = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [1800] = {
    AddAttrs = T.RT_135,
    BuffId = 1800,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1911] = {
    AddAttrs = T.RT_36,
    BuffId = 1911,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MaxLayer = 15,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1922] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        BaseUseValue = 1,
        Rate = "#1",
        SupLimitValue = 275
      }
    },
    BuffId = 1922,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1931] = {
    AddAttrs = T.RT_16,
    BuffId = 1931,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 120,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1941] = {
    AddAttrs = T.RT_76,
    BuffId = 1941,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 8,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1951] = {
    AddAttrs = T.RT_55,
    BuffId = 1951,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1952] = {
    AddAttrs = T.RT_67,
    BuffId = 1952,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Berserk",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1961] = {
    BuffId = 1961,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1961001,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1962] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        RateUseValue = 1,
        SupLimitRate = "#1"
      }
    },
    BuffId = 1962,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2301] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_256,
    BuffId = 2301,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2302] = {
    AddAttrs = {
      [1] = {
        AttrName = "TriggerProbModifierRate",
        Stackable = 1,
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_258,
    BuffId = 2302,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Trigger_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2311] = {
    AddAttrs = T.RT_99,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_73,
    BuffId = 2311,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 2,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [2312] = {
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = "#1"
      }
    },
    BuffId = 2312,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2321] = {
    AddAttrs = T.RT_101,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_17,
    BuffId = 2321,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Crd_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [2322] = {
    AddAttrs = T.RT_94,
    AddPassiveEffect = T.RT_72,
    BuffEffects = {1026},
    BuffId = 2322,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Range_Up",
    IsShowInBillboard = true,
    MaxLayer = 2,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [3301] = {
    AddAttrs = T.RT_99,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_73,
    BuffId = 3301,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [3311] = {
    AddAttrs = T.RT_101,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_17,
    BuffId = 3311,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Crd_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [3321] = {
    AddAttrs = T.RT_98,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_258,
    BuffId = 3321,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Trigger_Up",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [3331] = {
    AddAttrs = T.RT_305,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_245,
    BuffId = 3331,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Multishoot_Up",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [6111] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Dark",
        Value = 1
      }
    },
    AddPassiveEffect = T.RT_113,
    BuffId = 6111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6113] = {
    BuffId = 6113,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6114,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6114] = {
    AddAttrs = T.RT_370,
    BuffId = 6114,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6121] = {
    AddAttrs = T.RT_307,
    BuffId = 6121,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6123] = {
    BuffId = 6123,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6124,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6124] = {
    AddAttrs = T.RT_372,
    BuffId = 6124,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6131] = {
    AddAttrs = T.RT_307,
    BuffId = 6131,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6133] = {
    BuffId = 6133,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6134,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6134] = {
    AddAttrs = T.RT_372,
    BuffId = 6134,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6141] = {
    AddAttrs = T.RT_372,
    BuffId = 6141,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6143] = {
    BuffId = 6143,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6144,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6144] = {
    AddAttrs = T.RT_374,
    BuffId = 6144,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6151] = {
    AddAttrs = T.RT_372,
    BuffId = 6151,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6153] = {
    BuffId = 6153,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6154,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6154] = {
    AddAttrs = T.RT_374,
    BuffId = 6154,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6161] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Light",
        Value = 1
      }
    },
    AddPassiveEffect = T.RT_140,
    BuffId = 6161,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6163] = {
    BuffId = 6163,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6164,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6164] = {
    AddAttrs = T.RT_370,
    BuffId = 6164,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102] = {
    AddAttrs = T.RT_16,
    BuffEffects = T.RT_17,
    BuffId = 10102,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10201] = {
    AddAttrs = T.RT_71,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_73,
    BuffId = 10201,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 12,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10203] = {
    AddAttrs = T.RT_76,
    BuffEffects = T.RT_77,
    BuffId = 10203,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10204] = {
    AddAttrs = T.RT_80,
    BuffEffects = T.RT_81,
    BuffId = 10204,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Berserk",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [10301] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillSustain",
        Stackable = 1,
        Value = "#1"
      }
    },
    BuffEffects = {1006},
    BuffId = 10301,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Sustain_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10304] = {
    AddAttrs = T.RT_55,
    BuffId = 10304,
    BuffInitEffects = T.RT_88,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10501] = {
    AddAttrs = T.RT_92,
    BuffId = 10501,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Hp_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10502] = {
    AddAttrs = T.RT_76,
    BuffEffects = T.RT_77,
    BuffId = 10502,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [10503] = {
    AddAttrs = T.RT_94,
    AddPassiveEffect = T.RT_72,
    BuffId = 10503,
    BuffType = T.RT_95,
    DisperseBuffType = T.RT_96,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [10504] = {
    AddAttrs = T.RT_99,
    AddPassiveEffect = T.RT_72,
    BuffId = 10504,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [10602] = {
    AddAttrs = T.RT_16,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_17,
    BuffId = 10602,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [10603] = {
    AddAttrs = T.RT_101,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_17,
    BuffId = 10603,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Crd_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20103] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Melee",
        RateZone = "Normal",
        Value = "#1"
      }
    },
    BuffEffects = T.RT_77,
    BuffId = 20103,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20201] = {
    AddAttrs = T.RT_71,
    AddPassiveEffect = T.RT_72,
    BuffId = 20201,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20203] = {
    BuffId = 20203,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20205] = {
    AddAttrs = T.RT_244,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_245,
    BuffId = 20205,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Multishoot_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20301] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRDModifierRate",
        Stackable = 1,
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_17,
    BuffId = 20301,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Crd_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20302] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Stackable = 1,
        Value = "#1"
      },
      [2] = T.RT_151
    },
    BuffId = 20302,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20303] = {
    AddAttrs = T.RT_34,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_247,
    BuffId = 20303,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20304] = {
    AddAttrs = T.RT_244,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_245,
    BuffId = 20304,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Multishoot_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20305] = {
    AddAttrs = T.RT_71,
    AddPassiveEffect = T.RT_72,
    BuffEffects = T.RT_73,
    BuffId = 20305,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20405] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillEfficiency",
        Value = "#1"
      }
    },
    BuffEffects = T.RT_248,
    BuffId = 20405,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Effi_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20502] = {
    AddAttrs = T.RT_169,
    BuffEffects = T.RT_77,
    BuffId = 20502,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20509] = {
    AddAttrs = T.RT_34,
    BuffEffects = T.RT_247,
    BuffId = 20509,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [20510] = {
    AddAttrs = T.RT_34,
    BuffEffects = T.RT_247,
    BuffId = 20510,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [20603] = {
    AddAttrs = T.RT_76,
    BuffEffects = T.RT_77,
    BuffId = 20603,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100001] = {
    BuffId = 100001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100002] = {
    AddAttrs = T.RT_2,
    BuffId = 100002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100003] = {
    BuffId = 100003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100004] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 0.08
      }
    },
    BuffId = 100004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100005] = {
    BuffId = 100005,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100006,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100006] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Weapon",
        RateZone = "Normal",
        Value = 0.08
      }
    },
    BuffId = 100006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100007] = {
    BuffId = 100007,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100008,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100008] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", Rate = 0.4}
    },
    BuffId = 100008,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100009] = {
    BuffId = 100009,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100010,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100010] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Value = 0.4
      }
    },
    BuffId = 100010,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110001] = {
    BuffId = 110001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 110002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110002] = {
    AddAttrs = T.RT_2,
    BuffId = 110002,
    CombatConditionId = 1001,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110003] = {
    BuffId = 110003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 110004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110004] = {
    AddAttrs = T.RT_104,
    BuffId = 110004,
    CombatConditionId = 1001,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110101] = {
    ActivateSkills = {
      [110102] = 110121
    },
    AllowSkillSustainModify = true,
    BuffId = 110101,
    BuffType = T.RT_105,
    DisableSkills = T.RT_106,
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 1,
        Type = "SpChange",
        Value = -30
      }
    },
    EmissiveIntensity = {Hair = 150},
    EyeStrength = 1500,
    FresnelParams = {
      FresnelColor = T.RT_107,
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = {Default = 10, FresnelColor = 10}
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    RemoveWhenSpZero = true,
    UseSummonWeapon = 1,
    VisualEffects = {110129}
  },
  [110102] = {
    ActivateSkills = {
      [110101] = 110111
    },
    BuffId = 110102,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110111] = {
    AddAttrs = T.RT_110,
    BuffId = 110111,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Effi_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [110112] = {
    AddAttrs = T.RT_112,
    BuffId = 110112,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110201] = {
    BuffId = 110201,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff",
    IconPriority = 1,
    IsShowInBillboard = true,
    LayerExtraBuff = {
      [6] = 110222
    },
    MaxLayer = 12,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110202] = {
    ActivateSkills = {
      [110201] = 110211,
      [110202] = 110221
    },
    AddAttrs = {
      [1] = {
        AttrName = "StrongValue",
        Value = 0.38
      }
    },
    AddPassiveEffect = T.RT_113,
    AllowSkillSustainModify = true,
    BuffId = 110202,
    BuffType = T.RT_3,
    BuffTypeImgPath = "BonusDmg_Dark",
    CameraParam = {
      "FuluoSkill02",
      "0.5",
      "50"
    },
    DotDatas = {
      [1] = {
        Condition = 110201,
        DotDelay = 2,
        Interval = 1,
        Type = "SpChange",
        Value = -20
      }
    },
    ForbidCatch = true,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 110223,
        Camp = "Enemy"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [110203] = {
    AddPassiveEffect = {110203},
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_110203.BP_Buff_110203",
    BuffEffects = T.RT_114,
    BuffId = 110203,
    BuffType = T.RT_115,
    HitReplace = {HitFly = "HeavyHit"},
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SetCharacterTag = "StunFloat"
  },
  [110204] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRDModifierRate",
        DamageTag = "Melee",
        Value = 0.5
      }
    },
    BuffId = 110204,
    BuffType = T.RT_18,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110222] = {
    ActivateSkills = {HeavyAttack = 110222},
    BuffId = 110222,
    BuffType = T.RT_105,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110223] = {
    BuffId = 110223,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110231] = {
    AllowSkillSustainModify = true,
    BuffId = 110231,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Elite_Threefold",
    IsShowInBillboard = true,
    MaxLayer = 99,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110232] = {
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_110232.BP_Buff_110232",
    BuffId = 110232,
    BuffSpModify = {
      [110202] = {Value = -10}
    },
    BuffType = T.RT_3,
    MaxLayer = 99,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110301] = {
    AllowSkillSustainModify = true,
    BuffId = 110301,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Common_Debuff",
    IsShowInBillboard = true,
    LayerExtraBuff = {
      [10] = 110312
    },
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110302] = {
    ActivateSkills = {
      [110301] = 110311,
      [110302] = 110321
    },
    AllowSkillSustainModify = true,
    BuffId = 110302,
    BuffType = T.RT_105,
    CameraParam = T.RT_116,
    ChangeModel = 110301,
    DisableEmoIdle = true,
    DisableSkills = {
      "HeavyAttack",
      "SlideAttack"
    },
    DotDatas = {
      [1] = {
        Condition = 110312,
        DotDelay = 3.5,
        Interval = 1,
        Type = "SpChange",
        Value = -30
      },
      [2] = {
        DotDelay = 3.5,
        EffectId = 110323,
        Interval = 1,
        Type = "SkillEffect"
      }
    },
    ForbidenJumpState = T.RT_117,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {
      "Crouch",
      "Slide",
      "Interactive",
      "Seating"
    },
    UseSummonWeapon = 1,
    VisualEffects = {110324}
  },
  [110303] = {
    AddAttrs = {
      [1] = T.RT_118,
      [2] = T.RT_119,
      [3] = T.RT_120
    },
    BuffId = 110303,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110304] = {
    BuffDamagedRate = T.RT_121,
    BuffId = 110304,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110311] = {
    AddAttrs = {
      [1] = T.RT_122
    },
    AllowSkillSustainModify = true,
    BuffId = 110311,
    BuffInitEffects = T.RT_123,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Range_Up",
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [110312] = {
    BuffId = 110312,
    FXMID = T.RT_7,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {110303}
  },
  [110331] = {
    AddAttrs = {
      [1] = T.RT_118,
      [2] = T.RT_124
    },
    BuffEffects = T.RT_114,
    BuffId = 110331,
    EnableRimLightModel = true,
    FresnelParams = {
      FresnelColor = {
        1,
        0.009047,
        0.058806,
        0
      },
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = {Default = 5}
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetSeParam = {isTuosi02 = 1},
    VisualEffects = {
      110321,
      110322,
      110323
    }
  },
  [110341] = {
    AddAttrs = {
      [1] = T.RT_122,
      [2] = {
        AttrName = "StrongValue",
        Value = 0.9
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 110341,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Range_Up",
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [110399] = {
    AddAttrs = {
      [1] = T.RT_119,
      [2] = T.RT_120
    },
    BuffId = 110399,
    BuffType = T.RT_105,
    CameraParam = T.RT_116,
    DisableEmoIdle = true,
    DisableSkills = {
      "HeavyAttack",
      "SlideAttack",
      "Skill2"
    },
    ForbidenJumpState = T.RT_117,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {
      "Crouch",
      "Slide",
      "Seating"
    },
    UseSummonWeapon = 1
  },
  [110401] = {
    BuffId = 110401,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110421] = {
    ActivateSkills = {
      [110401] = 110412
    },
    BuffId = 110421,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110422] = {
    ActivateSkills = {
      [110401] = 110413
    },
    BuffId = 110422,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110423] = {
    ActivateSkills = {
      [110401] = 110414
    },
    BuffId = 110423,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110431] = {
    AddAttrs = T.RT_126,
    BuffId = 110431,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Dark"
  },
  [110441] = {
    AddAttrs = T.RT_128,
    BuffId = 110441,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [120101] = {
    BuffId = 120101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    EffectCreatureID = 121,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [120102] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Dark",
        Value = 0.5
      }
    },
    AddPassiveEffect = T.RT_113,
    BuffId = 120102,
    BuffType = T.RT_18,
    BuffTypeImgPath = "BonusDmg_Dark",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [120211] = {
    ActivateSkills = {
      [120201] = 120211,
      [120202] = 120221,
      Attack = "SlideAttack"
    },
    AddAttrs = T.RT_131,
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_120211.BP_Buff_120211",
    BuffId = 120211,
    BuffType = {11, 70},
    BuffTypeImgPath = "Common_Buff",
    DisableSkills = {
      "Attack",
      "FallAttack",
      "HeavyAttack",
      "Shooting",
      "HeavyShooting",
      "Reload"
    },
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 1,
        Type = "SpChange",
        Value = -10
      }
    },
    EnableFreeRun = true,
    ForbidenJumpState = T.RT_132,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {
      "LandHeavy",
      "Hit",
      "Crouch",
      "Slide",
      "Interactive",
      "Seating"
    },
    RemoveWhenSpZero = true,
    SpecialEffect = T.RT_133
  },
  [120231] = {
    BuffId = 120231,
    BuffType = T.RT_3,
    ChangeWeaponNotClearCombo = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [120232] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "HeavyAttack",
        RateZone = "Normal",
        Stackable = 1,
        Value = 0.1
      }
    },
    AddPassiveEffect = {120202},
    BuffEffects = T.RT_77,
    BuffId = 120232,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 240,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150001] = {
    BuffId = 150001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 150002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150002] = {
    AddAttrs = T.RT_2,
    BuffId = 150002,
    CombatConditionId = 1006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [150003] = {
    BuffId = 150003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 150004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150004] = {
    AddAttrs = T.RT_104,
    BuffId = 150004,
    CombatConditionId = 1006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [150101] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackRangeModifierValue",
        Stackable = 1,
        Type = "Ultra",
        Value = 120
      },
      [2] = {
        AttrName = "TriggerProbModifierRate",
        Stackable = 1,
        Type = "Ultra",
        Value = "#1"
      }
    },
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_150101.BP_Buff_150101",
    BuffId = 150101,
    LayerExtraBuff = {
      [3] = 150111
    },
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150102] = {
    ActivateSkills = {
      [150102] = 150121
    },
    AllowSkillSustainModify = true,
    BuffId = 150102,
    BuffType = T.RT_105,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 1
  },
  [150103] = {
    AllowSkillSustainModify = true,
    BuffDamagedRate = T.RT_139,
    BuffId = 150103,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Baonu",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [150104] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Light",
        Value = 0.3
      }
    },
    AddPassiveEffect = T.RT_140,
    BuffId = 150104,
    BuffType = T.RT_3,
    BuffTypeImgPath = "BonusDmg_Light",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150111] = {
    BuffId = 150111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetSeParam = {BaonuState = 1},
    VisualEffects = {150103}
  },
  [150121] = {
    BuffId = 150121,
    EnableRimLightModel = true,
    FresnelParams = {
      FresnelColor = {
        1,
        0.2,
        0.11,
        1
      },
      FresnelColorRange = {Default = 0.6},
      FresnelColorStrength = T.RT_141
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150141] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.35}
    },
    BuffId = 150141,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150201] = {
    ActivateSkills = {
      [150201] = 150211
    },
    BuffId = 150201,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150203] = {
    ActivateSkills = {
      [150201] = 150213
    },
    BuffId = 150203,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150211] = {
    BuffId = 150211,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [150212] = {
    BuffId = 150212,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [150214] = {
    AddAttrs = T.RT_143,
    BuffId = 150214,
    BuffType = T.RT_144,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [150215] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = -0.25}
    },
    BuffId = 150215,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Atk_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [150221] = {
    ActivateSkills = {
      [150201] = 150212
    },
    AddAttrs = {
      [1] = {
        AttrName = "TriggerProbModifierRate",
        Value = 0.6
      },
      [2] = {
        AttrName = "SkillIntensity",
        RateUseValue = 1
      }
    },
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_150221.BP_Buff_150221",
    BuffId = 150221,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    EnableRimLightModel = true,
    FresnelParams = {
      FresnelColor = {
        0.031026,
        1,
        0.980104,
        0
      },
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = {Default = 15}
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {3001}
  },
  [150222] = {
    AddAttrs = {
      [1] = {AttrName = "SkillRange", ValueUseValue = 1}
    },
    AllowSkillSustainModify = true,
    BuffId = 150222,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150223] = {
    AllowSkillSustainModify = true,
    BuffId = 150223,
    BuffType = T.RT_3,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150231] = {
    AddAttrs = {
      [1] = {AttrName = "SpRate", Value = 0.25}
    },
    BuffId = 150231,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150301] = {
    AddAttrs = T.RT_148,
    BuffId = 150301,
    BuffSpModify = T.RT_149,
    LayerExtraBuff = T.RT_150,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150302] = {
    AddAttrs = T.RT_153,
    BuffId = 150302,
    BuffSpModify = T.RT_154,
    LayerExtraBuff = T.RT_155,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150305] = {
    BuffId = 150305,
    BuffSpModify = {
      [150302] = T.RT_156
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150306] = {
    BuffId = 150306,
    BuffSpModify = {
      [150321] = T.RT_156
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150307] = {
    AddAttrs = T.RT_148,
    BuffId = 150307,
    BuffSpModify = T.RT_149,
    LayerExtraBuff = T.RT_150,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150308] = {
    AddAttrs = T.RT_153,
    BuffId = 150308,
    BuffSpModify = T.RT_154,
    LayerExtraBuff = T.RT_155,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150311] = {
    AddAttrs = T.RT_158,
    BuffId = 150311,
    BuffType = T.RT_159,
    DisperseBuffType = T.RT_160,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150312] = {
    AddAttrs = T.RT_65,
    BuffId = 150312,
    BuffType = T.RT_160,
    DisperseBuffType = T.RT_159,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150313] = {
    AllowSkillSustainModify = true,
    BuffId = 150313,
    BuffType = {150313, 11},
    BuffTypeImgPath = "Weapon_Spd_Up",
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [150320] = {
    ActivateSkills = {Attack = 1503101},
    BuffId = 150320,
    BuffType = {150320},
    DisperseBuffType = {
      150321,
      150322,
      150323,
      150324
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 1
  },
  [150321] = {
    ActivateSkills = {Attack = 1503121},
    BuffId = 150321,
    BuffType = {150321},
    DisperseBuffType = {
      150320,
      150322,
      150323,
      150324
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 2
  },
  [150322] = {
    ActivateSkills = {Attack = 1503141},
    BuffId = 150322,
    BuffType = {150322},
    DisperseBuffType = {
      150320,
      150321,
      150323,
      150324
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 3
  },
  [150323] = {
    ActivateSkills = {Attack = 1503161},
    BuffId = 150323,
    BuffType = {150323},
    DisperseBuffType = {
      150320,
      150321,
      150322,
      150324
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 4
  },
  [150325] = {
    ActivateSkills = {
      [150302] = 150321
    },
    AddAttrs = {
      [1] = {
        AttrName = "AttackRangeModifierValue",
        Value = 100
      }
    },
    BuffId = 150325,
    BuffType = {150325},
    CameraParam = {
      "KezhouSkill02",
      "0.5",
      "6"
    },
    EnableRimLightModel = true,
    FresnelParams = {
      FresnelColor = {
        0,
        0.123,
        1,
        0
      },
      FresnelColorRange = {Default = 0.45},
      FresnelColorStrength = {Default = 45}
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_161
  },
  [150326] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 0.6
      }
    },
    BuffEffects = T.RT_77,
    BuffId = 150326,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150327] = {
    BuffDamagedRate = T.RT_121,
    BuffId = 150327,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    ForbidCatch = true,
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [150328] = {
    AddAttrs = {
      [1] = {
        AttrName = "AlmightyDamageRate",
        Stackable = 1,
        Value = 0.09
      }
    },
    BuffId = 150328,
    BuffInitEffects = T.RT_162,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Ignore",
    IconPriority = 99,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150329] = {
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_150301.BP_Buff_150301",
    BuffId = 150329,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150331] = {
    BuffId = 150331,
    BuffType = {150331},
    DisperseBuffType = {
      150332,
      150333,
      150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503202
    }
  },
  [150332] = {
    BuffId = 150332,
    BuffType = {150332},
    DisperseBuffType = {
      150331,
      150333,
      150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503203
    }
  },
  [150333] = {
    BuffId = 150333,
    BuffType = {150333},
    DisperseBuffType = {
      150331,
      150332,
      150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503204
    }
  },
  [150341] = {
    BuffId = 150341,
    BuffType = {150341},
    DisperseBuffType = {
      150342,
      150343,
      150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503201
    }
  },
  [150342] = {
    BuffId = 150342,
    BuffType = {150342},
    DisperseBuffType = {
      150341,
      150343,
      150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503203
    }
  },
  [150343] = {
    BuffId = 150343,
    BuffType = {150343},
    DisperseBuffType = {
      150341,
      150342,
      150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503204
    }
  },
  [150351] = {
    BuffId = 150351,
    BuffType = {150351},
    DisperseBuffType = {
      150352,
      150353,
      150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503201
    }
  },
  [150352] = {
    BuffId = 150352,
    BuffType = {150352},
    DisperseBuffType = {
      150351,
      150353,
      150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503202
    }
  },
  [150353] = {
    BuffId = 150353,
    BuffType = {150353},
    DisperseBuffType = {
      150351,
      150352,
      150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503204
    }
  },
  [150361] = {
    BuffId = 150361,
    BuffType = {150361},
    DisperseBuffType = {
      150362,
      150363,
      150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503201
    }
  },
  [150362] = {
    BuffId = 150362,
    BuffType = {150362},
    DisperseBuffType = {
      150361,
      150363,
      150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503202
    }
  },
  [150363] = {
    BuffId = 150363,
    BuffType = {150363},
    DisperseBuffType = {
      150361,
      150362,
      150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503203
    }
  },
  [150371] = {
    AddAttrs = T.RT_148,
    BuffId = 150371,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150372] = {
    AddAttrs = T.RT_153,
    BuffId = 150372,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150373] = {
    AddAttrs = T.RT_148,
    BuffId = 150373,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150374] = {
    AddAttrs = T.RT_153,
    BuffId = 150374,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150401] = {
    ActivateSkills = {
      [150402] = 150421,
      [150423] = 150421
    },
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = 0.3
      }
    },
    BuffId = 150401,
    CameraParam = T.RT_163,
    EnableAnimFly = true,
    ForbidenJumpState = T.RT_132,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    NotEnterCharacterTagType = T.RT_164,
    VisualEffects = T.RT_161
  },
  [150402] = {
    BuffId = 150402,
    DisableSkills = T.RT_106,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150403] = {
    BuffId = 150403,
    DisableSkills = T.RT_106,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150404] = {
    BuffId = 150404,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    UseSummonWeapon = 1
  },
  [150405] = {
    ActivateSkills = {
      [150402] = 150423
    },
    BuffId = 150405,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150407] = {
    ActivateSkills = {
      [150401] = 150411
    },
    BuffId = 150407,
    DisperseBuffType = T.RT_165,
    DotDatas = {
      [1] = {
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = -3
      }
    },
    ForbidBuffType = T.RT_165,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = {
      510103,
      510104,
      240121
    }
  },
  [150408] = {
    BuffId = 150408,
    DisperseBuffType = T.RT_165,
    DotDatas = {
      [1] = {
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = -1
      }
    },
    ForbidBuffType = T.RT_165,
    ForbidenJumpState = T.RT_132,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    NotEnterCharacterTagType = T.RT_164,
    VisualEffects = {
      510103,
      510104,
      410124
    }
  },
  [150409] = {
    BuffId = 150409,
    BuffType = T.RT_165,
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = 1
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150410] = {
    BuffId = 150410,
    BuffType = T.RT_165,
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = 2
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150421] = {
    BuffId = 150421,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150501] = {
    AllowSkillSustainModify = true,
    BuffId = 150501,
    BuffType = T.RT_105,
    CameraParam = T.RT_163,
    DisableSkills = {
      "FallAttack",
      "SlideAttack"
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_166,
    SetIdleTag = "SkillIdle",
    UseSummonWeapon = 1
  },
  [160101] = {
    AddAttrs = T.RT_169,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_170,
    BuffId = 160101,
    BuffType = {10, 160101},
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_171
  },
  [160102] = {
    AddAttrs = T.RT_173,
    AllowSkillSustainModify = true,
    BuffId = 160102,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [160103] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeedModifierRate",
        Stackable = 1,
        Value = 0.09
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 160103,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [160104] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Value = 0.54
      },
      [2] = T.RT_168
    },
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_170,
    BuffId = 160104,
    BuffType = {10, 160104},
    BuffTypeImgPath = "Damage_Up",
    DisperseBuffType = T.RT_174,
    ForbidBuffType = T.RT_174,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_171
  },
  [160105] = {
    AddAttrs = {
      [1] = {
        AttrName = "TriggerProbModifierRate",
        Value = 1
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 160105,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Trigger_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180101] = {
    AddAttrs = {
      [1] = {
        AllowSkillIntensity = 1,
        AttrName = "BonusDamage",
        Type = "Light",
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_140,
    BuffId = 180101,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180102] = {
    ActivateSkills = {
      [180101] = 180111,
      [180102] = 180121
    },
    AllowSkillSustainModify = true,
    BuffId = 180102,
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "SpChange",
        Value = -12
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [180111] = {
    AddAttrs = T.RT_176,
    AllowSkillSustainModify = true,
    BuffId = 180111,
    BuffInitEffects = T.RT_177,
    BuffType = T.RT_178,
    BuffTypeImgPath = "BonusDmg_Light",
    EnableRimLightModel = true,
    FresnelParams = T.RT_182,
    IconPriority = 8,
    IsShowInBillboard = true,
    MaxLayer = 30,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_183
  },
  [180112] = {
    AddAttrs = T.RT_176,
    AllowSkillSustainModify = true,
    BuffId = 180112,
    BuffInitEffects = T.RT_177,
    BuffType = T.RT_178,
    BuffTypeImgPath = "BonusDmg_Light",
    EnableRimLightModel = true,
    FresnelParams = T.RT_182,
    IconPriority = 8,
    IsShowInBillboard = true,
    MaxLayer = 45,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_183
  },
  [180113] = {
    AddAttrs = T.RT_84,
    AllowSkillSustainModify = true,
    BuffId = 180113,
    BuffInitEffects = T.RT_184,
    BuffType = T.RT_144,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180114] = {
    AddAttrs = {
      [1] = T.RT_175,
      [2] = {
        AttrName = "SkillIntensity",
        Stackable = 1,
        Value = 0.02
      },
      [3] = {
        AttrName = "SkillRange",
        Stackable = 1,
        Value = 0.01
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 180114,
    BuffInitEffects = T.RT_177,
    BuffType = T.RT_178,
    BuffTypeImgPath = "BonusDmg_Light",
    EnableRimLightModel = true,
    FresnelParams = T.RT_182,
    IconPriority = 8,
    IsShowInBillboard = true,
    MaxLayer = 45,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_183
  },
  [180121] = {
    BuffId = 180121,
    BuffType = T.RT_185,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180122,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180122] = {
    BuffId = 180122,
    BuffType = T.RT_186,
    BuffTypeImgPath = "Dot_Water",
    DotDatas = {
      [1] = {
        AllowSkillIntensity = 1,
        DamageTag = T.RT_187,
        DamageType = "Water",
        Immediately = 1,
        Interval = 2,
        Rate = "#1",
        Type = "Dot"
      }
    },
    FXMID = T.RT_69,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180123] = {
    BuffId = 180123,
    BuffType = T.RT_185,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180124,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180124] = {
    BuffId = 180124,
    BuffType = T.RT_186,
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = T.RT_189,
    FXMID = T.RT_82,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180125] = {
    BuffId = 180125,
    BuffType = T.RT_185,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180126,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180126] = {
    BuffId = 180126,
    BuffType = T.RT_186,
    BuffTypeImgPath = "Dot_Thunder",
    DotDatas = T.RT_191,
    FXMID = T.RT_89,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180127] = {
    BuffId = 180127,
    BuffType = T.RT_185,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180128,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180128] = {
    BuffId = 180128,
    BuffType = T.RT_186,
    BuffTypeImgPath = "Dot_Wind",
    DotDatas = T.RT_193,
    FXMID = T.RT_90,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180131] = {
    AddAttrs = {
      [1] = T.RT_194
    },
    AddPassiveEffect = T.RT_195,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_196,
    BuffId = 180131,
    BuffType = {
      10,
      180130,
      180131
    },
    BuffTypeImgPath = "BonusDmg_Water",
    IconPriority = 23,
    IsShowInBillboard = true,
    MaxLayer = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180132] = {
    AddAttrs = {
      [1] = T.RT_197
    },
    AddPassiveEffect = T.RT_198,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_199,
    BuffId = 180132,
    BuffType = {
      10,
      180130,
      180132
    },
    BuffTypeImgPath = "BonusDmg_Fire",
    IconPriority = 22,
    IsShowInBillboard = true,
    MaxLayer = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180133] = {
    AddAttrs = {
      [1] = T.RT_200
    },
    AddPassiveEffect = T.RT_201,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_202,
    BuffId = 180133,
    BuffType = {
      10,
      180130,
      180133
    },
    BuffTypeImgPath = "BonusDmg_Thunder",
    IconPriority = 21,
    IsShowInBillboard = true,
    MaxLayer = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180134] = {
    AddAttrs = T.RT_204,
    AddPassiveEffect = T.RT_205,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_206,
    BuffId = 180134,
    BuffType = {
      10,
      180130,
      180134
    },
    BuffTypeImgPath = "BonusDmg_Wind",
    IconPriority = 20,
    IsShowInBillboard = true,
    MaxLayer = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180135] = {
    AddAttrs = {
      [1] = T.RT_194,
      [2] = T.RT_207
    },
    AddPassiveEffect = T.RT_195,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_196,
    BuffId = 180135,
    BuffType = T.RT_208,
    BuffTypeImgPath = "BonusDmg_Water",
    DisperseBuffType = T.RT_209,
    ForbidBuffType = T.RT_209,
    IconPriority = 23,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180136] = {
    AddAttrs = {
      [1] = T.RT_197,
      [2] = T.RT_207
    },
    AddPassiveEffect = T.RT_198,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_199,
    BuffId = 180136,
    BuffType = T.RT_208,
    BuffTypeImgPath = "BonusDmg_Fire",
    DisperseBuffType = T.RT_210,
    ForbidBuffType = T.RT_210,
    IconPriority = 22,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180137] = {
    AddAttrs = {
      [1] = T.RT_200,
      [2] = T.RT_207
    },
    AddPassiveEffect = T.RT_201,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_202,
    BuffId = 180137,
    BuffType = T.RT_208,
    BuffTypeImgPath = "BonusDmg_Thunder",
    DisperseBuffType = T.RT_211,
    ForbidBuffType = T.RT_211,
    IconPriority = 21,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180138] = {
    AddAttrs = {
      [1] = T.RT_203,
      [2] = T.RT_207
    },
    AddPassiveEffect = T.RT_205,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_206,
    BuffId = 180138,
    BuffType = T.RT_208,
    BuffTypeImgPath = "BonusDmg_Wind",
    DisperseBuffType = T.RT_212,
    ForbidBuffType = T.RT_212,
    IconPriority = 20,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180141] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Stackable = 1,
        Value = 0.01
      }
    },
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_77,
    BuffId = 180141,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IconPriority = 10,
    IsShowInBillboard = true,
    MaxLayer = 45,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [180191] = {
    BuffId = 180191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 180192,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180192] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Weapon",
        RateZone = "Normal",
        Value = 0.1
      }
    },
    BuffId = 180192,
    CombatConditionId = 1031,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [201001] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", Rate = -0.5}
    },
    BuffEffects = T.RT_220,
    BuffId = 201001,
    BuffType = T.RT_145,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [201002] = {
    BuffId = 201002,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Common_Buff_Aura",
    HaloDatas = {
      [1] = {
        AuraRange = 1000,
        BuffId = 201021,
        Camp = "Friend"
      },
      [2] = {
        AuraRange = 1000,
        BuffId = 201022,
        Camp = "Enemy"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {20103}
  },
  [201021] = {
    AddAttrs = T.RT_29,
    BuffId = 201021,
    BuffType = T.RT_18,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        DefaultHealFX = 1,
        Interval = 1,
        Rate = 0.5,
        Type = "Hot"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [201022] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Normal",
        Value = 0.3
      }
    },
    BuffId = 201022,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Fire",
        Immediately = 1,
        Interval = 1,
        Rate = 2,
        Type = "Dot"
      }
    },
    FXMID = T.RT_82,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210001] = {
    BuffId = 210001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210002] = {
    AddAttrs = T.RT_2,
    BuffId = 210002,
    CombatConditionId = 1002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [210003] = {
    BuffId = 210003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210004] = {
    AddAttrs = T.RT_104,
    BuffId = 210004,
    CombatConditionId = 1002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [210101] = {
    AddPassiveEffect = T.RT_251,
    AllowSkillSustainModify = true,
    BuffId = 210101,
    BuffType = T.RT_252,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = T.RT_254,
    FXMID = T.RT_255,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    Priority = 999,
    VisualEffects = T.RT_251
  },
  [210103] = {
    AddPassiveEffect = T.RT_251,
    AllowSkillSustainModify = true,
    BuffId = 210103,
    BuffType = T.RT_252,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = T.RT_254,
    FXMID = T.RT_255,
    IsShowInBillboard = true,
    MaxLayer = 8,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    Priority = 999,
    VisualEffects = T.RT_251
  },
  [210121] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        Rate = 0.03,
        Stackable = 1
      }
    },
    BuffId = 210121,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 50,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210201] = {
    BuffEffects = {210222},
    BuffId = 210201,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {210221}
  },
  [210202] = {
    ActivateSkills = {
      [210202] = 210221
    },
    BuffId = 210202,
    BuffType = T.RT_3,
    DotDatas = {
      [1] = {
        DotDelay = 1.5,
        Interval = 1,
        Type = "SpChange",
        Value = -5
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [210203] = {
    BuffId = 210203,
    BuffType = T.RT_3,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210204,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210204] = {
    AddPassiveEffect = {210212},
    BuffId = 210204,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {240122}
  },
  [230100] = {
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_230100.BP_Buff_230100",
    BuffId = 230100,
    BuffType = T.RT_85,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RagdollEnable = 1,
    SetCharacterTag = "HitFly",
    VisualEffects = {230104}
  },
  [230101] = {
    AddAttrs = T.RT_76,
    AddPassiveEffect = T.RT_195,
    AllowSkillSustainModify = true,
    BuffId = 230101,
    BuffType = T.RT_18,
    BuffTypeImgPath = "BonusDmg_Water",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {230101}
  },
  [230102] = {
    AllowSkillSustainModify = true,
    BuffId = 230102,
    FresnelParams = {
      FresnelColor = {
        0.291667,
        0,
        0,
        1
      },
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = T.RT_257
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [230103] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Value = 0.08
      }
    },
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_256,
    BuffId = 230103,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [230110] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_230110.BP_Buff_230110",
    BuffId = 230110,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [230121] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Value = 0.02
      }
    },
    BuffEffects = T.RT_256,
    BuffId = 230121,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MaxLayer = 24,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [230122] = {
    BuffId = 230122,
    BuffType = {21, 41},
    DotDatas = {
      [1] = {
        DamageTag = T.RT_187,
        DamageType = "Water",
        Immediately = 1,
        Interval = 2,
        Rate = 2.8,
        Type = "Dot"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240121] = {
    AddAttrs = T.RT_260,
    AllowSkillSustainModify = true,
    BuffId = 240121,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    EffectCreatureID = 240108,
    IconPriority = 15,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SpawnECOnlyPlayer = true,
    VisualEffects = T.RT_261
  },
  [240122] = {
    AddAttrs = T.RT_260,
    AddPassiveEffect = {240104},
    AllowSkillSustainModify = true,
    BuffId = 240122,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    EffectCreatureID = 240108,
    IconPriority = 15,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SpawnECOnlyPlayer = true,
    VisualEffects = T.RT_261
  },
  [240123] = {
    AddAttrs = T.RT_99,
    AllowSkillSustainModify = true,
    BuffId = 240123,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    EnableRimLightModel = true,
    FresnelParams = T.RT_264,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_265
  },
  [240124] = {
    AddAttrs = {
      [1] = T.RT_78,
      [2] = {
        AttrName = "BonusDamage",
        Type = "Water",
        Value = 2.2
      }
    },
    AddPassiveEffect = T.RT_195,
    AllowSkillSustainModify = true,
    BuffId = 240124,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Weapon_Spd_Up",
    FresnelParams = T.RT_264,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_265
  },
  [240131] = {
    BuffId = 240131,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 240132,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240132] = {
    AddPassiveEffect = {240103},
    BuffId = 240132,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [240133] = {
    AddAttrs = T.RT_267,
    AllowSkillSustainModify = true,
    BuffId = 240133,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [240134] = {
    AddAttrs = T.RT_267,
    AllowSkillSustainModify = true,
    BuffId = 240134,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [240141] = {
    AddAttrs = T.RT_128,
    BuffId = 240141,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240151] = {
    AddPassiveEffect = {240111},
    BuffId = 240151,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Dot_Common",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {240151}
  },
  [240152] = {
    BuffId = 240152,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240153] = {
    BuffId = 240153,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240191] = {
    BuffId = 240191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 240192,
        Camp = "Friend",
        Condition = 1007
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240192] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 0.1
      }
    },
    BuffId = 240192,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310001] = {
    BuffId = 310001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 310002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310002] = {
    AddAttrs = T.RT_2,
    BuffId = 310002,
    CombatConditionId = 1003,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310003] = {
    BuffId = 310003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 310004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310004] = {
    AddAttrs = T.RT_104,
    BuffId = 310004,
    CombatConditionId = 1003,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310111] = {
    AddPassiveEffect = T.RT_284,
    BuffId = 310111,
    BuffType = T.RT_285,
    BuffTypeImgPath = "Char_Linen_02",
    ForbidBuffType = T.RT_284,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_286
  },
  [310112] = {
    AddPassiveEffect = {310112},
    BuffId = 310112,
    BuffType = T.RT_285,
    BuffTypeImgPath = "Char_Linen_02",
    ForbidBuffType = T.RT_284,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_286
  },
  [310120] = {
    ActivateSkills = T.RT_287,
    AllowSkillSustainModify = true,
    AttackToFire = 1,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_310120.BP_Buff_310120",
    BuffId = 310120,
    BuffType = T.RT_105,
    CameraParam = T.RT_163,
    DisableSkills = T.RT_288,
    DotDatas = T.RT_290,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_166,
    SetIdleTag = "SkillIdle",
    UseSummonWeapon = 1
  },
  [310121] = {
    ActivateSkills = T.RT_287,
    AllowSkillSustainModify = true,
    AttackToFire = 1,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_310120.BP_Buff_310120",
    BuffDamagedRate = T.RT_139,
    BuffId = 310121,
    BuffType = T.RT_105,
    CameraParam = T.RT_163,
    DisableSkills = T.RT_288,
    DotDatas = T.RT_290,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_166,
    SetIdleTag = "SkillIdle",
    UseSummonWeapon = 1
  },
  [310122] = {
    BuffId = 310122,
    FresnelParams = {
      FresnelColor = T.RT_107,
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = T.RT_257
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true,
    VisualEffects = {
      310121,
      310122,
      310123,
      310124,
      310125,
      310126,
      310127
    }
  },
  [310123] = {
    BuffId = 310123,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310124] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeedModifierRate",
        Stackable = 1,
        Value = 0.03
      }
    },
    BuffId = 310124,
    MaxLayer = 35,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310131] = {
    BuffId = 310131,
    BuffType = {11, 310131},
    BuffTypeImgPath = "Char_Linen_01",
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310132] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        ValueUseValue = 1
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 310132,
    BuffType = {10, 310131},
    BuffTypeImgPath = "Char_Linen_02",
    ForbidBuffType = {310131},
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310141] = {
    AddAttrs = {
      [1] = {
        AttrName = "StrongValue",
        Value = 0.35
      }
    },
    BuffEffects = T.RT_291,
    BuffId = 310141,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Morale",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310203] = {
    BuffId = 310203,
    BuffInitEffects = T.RT_49,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310204] = {
    ActivateSkills = {
      [310201] = 310211
    },
    AllowSkillSustainModify = true,
    BuffId = 310204,
    DotDatas = T.RT_293,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310205] = {
    BuffDamageRate = T.RT_121,
    BuffId = 310205,
    BuffInitEffects = T.RT_220,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damage_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [310206] = {
    AddAttrs = T.RT_295,
    AllowSkillSustainModify = true,
    BuffId = 310206,
    DotDatas = T.RT_293,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310211] = {
    AddAttrs = {
      [1] = T.RT_296
    },
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_310201.BP_Buff_310201",
    BuffId = 310211,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310212] = {
    AddAttrs = T.RT_158,
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_310201.BP_Buff_310201",
    BuffId = 310212,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Xier",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310213] = {
    AddAttrs = T.RT_158,
    AllowSkillSustainModify = true,
    BuffId = 310213,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Xier",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310301] = {
    ActivateSkills = {
      [310302] = 310321
    },
    BuffId = 310301,
    EmissiveIntensity = {Body = 30},
    EyeColor = 2,
    FresnelParams = {
      FresnelColor = {
        15,
        0,
        0,
        0
      },
      FresnelColorRange = T.RT_180,
      FresnelColorStrength = T.RT_297
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetSeParam = {isYeer02 = 1}
  },
  [310302] = {
    BuffId = 310302,
    HaloDatas = {
      [1] = {
        AuraRange = 1500,
        BuffId = 310321,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310303] = {
    ActivateSkills = {
      [310301] = 310311
    },
    BuffId = 310303,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310304] = {
    AddAttrs = T.RT_110,
    AllowSkillSustainModify = true,
    BuffId = 310304,
    BuffInitEffects = T.RT_248,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Effi_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [310311] = {
    BuffId = 310311,
    ForbidBuffType = {
      10,
      11,
      12,
      20,
      21,
      22,
      30,
      40,
      41,
      42,
      43,
      44,
      49,
      60,
      61,
      62,
      63
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310321] = {
    AddAttrs = T.RT_84,
    BuffId = 310321,
    BuffInitEffects = T.RT_184,
    BuffType = {
      21,
      42,
      310321
    },
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [310323] = {
    AddAttrs = T.RT_299,
    BuffId = 310323,
    BuffInitEffects = T.RT_184,
    BuffType = T.RT_300,
    BuffTypeImgPath = "Slowdown",
    DisperseBuffType = T.RT_301,
    ForbidBuffType = T.RT_301,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [320100] = {
    AddAttrs = T.RT_92,
    BuffId = 320100,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        Condition = 2,
        DamageTag = T.RT_60,
        DefaultHealFX = 0,
        Interval = 1,
        Rate = 0.004,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UISpecialEffect = T.RT_302
  },
  [320101] = {
    AddAttrs = T.RT_92,
    BuffId = 320101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        Condition = 2,
        DamageTag = T.RT_60,
        DefaultHealFX = 0,
        Interval = 1,
        Rate = 0.003,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UISpecialEffect = T.RT_302
  },
  [320102] = {
    BuffId = 320102,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 320103,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320103] = {
    AddPassiveEffect = {320103},
    BuffId = 320103,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320111] = {
    AddPassiveEffect = T.RT_303,
    AllowSkillSustainModify = true,
    BuffId = 320111,
    BuffTypeImgPath = "Common_Debuff_Aura",
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 320112,
        Camp = "Enemy"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {
      320103,
      320104,
      320105,
      320106,
      320107,
      320108
    }
  },
  [320112] = {
    BuffId = 320112,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = T.RT_189,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_303
  },
  [320122] = {
    BuffId = 320122,
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320201] = {
    AddPassiveEffect = {320202},
    BuffId = 320201,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Kami_Enemy",
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320203] = {
    ActivateSkills = {Attack = 320211},
    AddAttrs = {
      [1] = {
        AttrName = "SkillSpeed",
        Rate = 0.06,
        Stackable = 1
      }
    },
    AddPassiveEffect = {320205},
    BuffId = 320203,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Spd_Up",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320204] = {
    BuffDamagedRate = {Value = -0.03},
    BuffId = 320204,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320205] = {
    BuffId = 320205,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Kami_Friend",
    IsShowInBillboard = true,
    LayerExtraBuff = {
      [20] = 320206
    },
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320206] = {
    AddPassiveEffect = {320204},
    BuffId = 320206,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330101] = {
    AddAttrs = T.RT_32,
    BuffId = 330101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    EffectCreatureID = 330111,
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330121] = {
    BuffId = 330121,
    BuffInitEffects = T.RT_49,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330131] = {
    BuffId = 330131,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 330132,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330132] = {
    AddPassiveEffect = {330103},
    BuffId = 330132,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330141] = {
    BuffId = 330141,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 330142,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330142] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.45}
    },
    BuffId = 330142,
    BuffInitEffects = T.RT_247,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [410001] = {
    BuffId = 410001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410002] = {
    AddAttrs = T.RT_2,
    BuffId = 410002,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [410003] = {
    BuffId = 410003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410004] = {
    AddAttrs = T.RT_104,
    BuffId = 410004,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [410101] = {
    BuffId = 410101,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410102] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 0.9
      }
    },
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_77,
    BuffId = 410102,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410111] = {
    ActivateSkills = {
      [410102] = 410121
    },
    AddPassiveEffect = {410103},
    AllowSkillSustainModify = true,
    BuffId = 410111,
    DotDatas = {
      [1] = {
        DotDelay = 2,
        Interval = 1,
        Type = "SpChange",
        Value = -20
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [410112] = {
    BuffId = 410112,
    CameraParam = {
      "IncrementDefault",
      "1.1",
      "50"
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410121] = {
    AddPassiveEffect = {410104},
    AllowSkillSustainModify = true,
    BuffId = 410121,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Common_Debuff",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {410101}
  },
  [410122] = {
    AddPassiveEffect = {410105},
    AllowSkillSustainModify = true,
    BuffId = 410122,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Common_Debuff",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {410102}
  },
  [410123] = {
    AddAttrs = T.RT_315,
    BuffId = 410123,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    EnableRimLightModel = true,
    FresnelParams = {
      FresnelColor = {
        0,
        0.01,
        0.1,
        0
      },
      FresnelColorRange = {Default = 0.7},
      FresnelColorStrength = {Default = 100, FresnelColor = 100}
    },
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410124,
        Camp = "OtherFriend"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true,
    VisualEffects = {410124, 410129}
  },
  [410124] = {
    AddAttrs = T.RT_315,
    BuffId = 410124,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {410130}
  },
  [410125] = {
    BuffId = 410125,
    BuffType = T.RT_115,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunParalysis"
  },
  [410201] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_410200.BP_Buff_410200",
    BuffId = 410201,
    BuffType = {410201, 410200},
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [410202] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_410200.BP_Buff_410200",
    BuffId = 410202,
    BuffType = {410202, 410200},
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [410211] = {
    BuffId = 410211,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410212,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410212] = {
    AddPassiveEffect = {410212},
    BuffId = 410212,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410214] = {
    AddAttrs = {
      [1] = {
        AttrName = "StrongValue",
        Value = 0.04
      }
    },
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_291,
    BuffId = 410214,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Morale",
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [410221] = {
    ActivateSkills = {
      [410202] = 410221
    },
    BuffId = 410221,
    BuffType = {410221},
    DisperseBuffType = {410222, 410223},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410222] = {
    ActivateSkills = {
      [410202] = 410222
    },
    BuffId = 410222,
    BuffType = {410222},
    DisperseBuffType = {410221, 410223},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410223] = {
    ActivateSkills = {
      [410202] = 410223
    },
    BuffId = 410223,
    BuffType = {410223},
    DisperseBuffType = {410222, 410221},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410231] = {
    AddAttrs = T.RT_76,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_77,
    BuffId = 410231,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410241] = {
    AddAttrs = T.RT_29,
    BuffEffects = T.RT_247,
    BuffId = 410241,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [410242] = {
    AddAttrs = T.RT_295,
    BuffId = 410242,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410243] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_410243.BP_Buff_410243",
    BuffId = 410243,
    DotDatas = T.RT_317,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [410251] = {
    BuffId = 410251,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {410203}
  },
  [410252] = {
    AddAttrs = T.RT_299,
    BuffId = 410252,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [420104] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        SupLimitValue = 0.36,
        Type = "FallAttack",
        ValueUseValue = 1
      }
    },
    AddPassiveEffect = {214},
    BuffId = 420104,
    BuffType = T.RT_3,
    BuffTypeImgPath = "BonusDmg_Common",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420111] = {
    ActivateSkills = {FallAttack = 420111},
    BuffId = 420111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {420102}
  },
  [420112] = {
    AddAttrs = T.RT_135,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_88,
    BuffId = 420112,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [420113] = {
    AddAttrs = {
      [1] = {AttrName = "SkillRange", Rate = 0.3},
      [2] = {
        AttrName = "AttackRangeModifierValue",
        Value = 60
      }
    },
    BuffEffects = T.RT_123,
    BuffId = 420113,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Range_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [420114] = {
    BuffId = 420114,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420115] = {
    ActivateSkills = {Attack = 420101},
    BuffId = 420115,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420121] = {
    BuffId = 420121,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Char_Yuming_01",
    EmissiveIntensity = {Body = 12.782403},
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    HpLink = 1,
    IconPriority = 99,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [420122] = {
    BuffId = 420122,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420123] = {
    BuffId = 420123,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 420124,
        Camp = "Friend"
      },
      [2] = {
        AuraRange = -1,
        BuffId = 420131,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420124] = {
    AddPassiveEffect = {420103},
    BuffId = 420124,
    BuffTypeImgPath = "Damage_Thunder_Up",
    CombatConditionId = 1004,
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [420131] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = "#1"
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 420131,
    BuffInitEffects = T.RT_49,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damaged_Thunder_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [420191] = {
    BuffId = 420191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 420192,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420192] = {
    AddAttrs = {
      [1] = {
        AttrName = "StrongValue",
        Value = 0.15
      }
    },
    BuffId = 420192,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [420200] = {
    AddAttrs = {
      [1] = {
        AttrName = "OverShieldLevelGrow",
        Value = 50
      }
    },
    BuffId = 420200,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420201] = {
    AddAttrs = {
      [1] = {
        AttrName = "DEF",
        Stackable = 1,
        SupLimitValue = 20,
        ValueUseValue = 1
      }
    },
    AllowSkillSustainModify = true,
    BuffId = 420201,
    BuffInitEffects = {1011},
    BuffType = T.RT_18,
    BuffTypeImgPath = "Def_Up",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [420211] = {
    ActivateSkills = {
      [420201] = 420211
    },
    AllowSkillSustainModify = true,
    BuffId = 420211,
    BuffType = T.RT_105,
    DisableSkills = T.RT_288,
    DotDatas = {
      [1] = {
        DotDelay = 2,
        Interval = 1,
        Type = "SpChange",
        Value = -5
      }
    },
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 420213,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420213] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        Rate = -0.15,
        Stackable = 1
      }
    },
    BuffId = 420213,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Dot_Thunder",
    DotDatas = T.RT_191,
    IsShowInBillboard = true,
    MaxLayer = 2,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [430112] = {
    BuffId = 430112,
    BuffType = T.RT_10,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        Condition = 2,
        DamageTag = T.RT_60,
        DefaultHealFX = 0,
        Interval = 1,
        Rate = 0.1,
        Type = "Hot"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [430122] = {
    AddPassiveEffect = {430103},
    BuffId = 430122,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {430156}
  },
  [430123] = {
    BuffId = 430123,
    ForbidBuffType = {
      10,
      11,
      12,
      20,
      21,
      22,
      30,
      40,
      41,
      42,
      43,
      44,
      49,
      60,
      61,
      62,
      63,
      999
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510001] = {
    BuffId = 510001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510002] = {
    AddAttrs = T.RT_2,
    BuffId = 510002,
    CombatConditionId = 1005,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [510003] = {
    BuffId = 510003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510004] = {
    AddAttrs = T.RT_104,
    BuffId = 510004,
    CombatConditionId = 1005,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [510101] = {
    AddAttrs = T.RT_135,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_77,
    BuffId = 510101,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [510102] = {
    BuffAnimInstance = "Ride",
    BuffId = 510102,
    BuffType = T.RT_105,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510103] = {
    AddAttrs = T.RT_135,
    AllowSkillSustainModify = true,
    BuffDamagedRate = T.RT_338,
    BuffId = 510103,
    BuffType = T.RT_339,
    BuffTypeImgPath = "Songlu",
    EnableRimLightModel = true,
    FresnelParams = T.RT_341,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_342
  },
  [510104] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        SupLimitValue = 300,
        ValueUseValue = 1
      }
    },
    BuffId = 510104,
    BuffInitEffects = T.RT_247,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [510105] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillIntensity",
        Rate = 0.45
      }
    },
    BuffEffects = T.RT_77,
    BuffId = 510105,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [510121] = {
    ActivateSkills = {
      [30] = 510107,
      [510101] = 510111,
      [510102] = 510121
    },
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = 0.6
      },
      [2] = {
        AttrName = "JumpVelocityModifier",
        Value = 0.3
      }
    },
    AddPassiveEffect = {510102},
    BuffId = 510121,
    BuffType = T.RT_105,
    CameraParam = {
      "SongluSkill02",
      "0.2",
      "50"
    },
    DisableSkills = {
      "HeavyAttack",
      "SlideAttack",
      "Shooting",
      "HeavyShooting",
      "Reload"
    },
    ForbidenJumpState = T.RT_132,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {
      "LandHeavy",
      "Hit",
      "Crouch",
      "Slide",
      "Avoid",
      "Interactive",
      "Seating"
    },
    UseSummonWeapon = 1
  },
  [510122] = {
    BuffId = 510122,
    BuffType = T.RT_105,
    DisableSkills = {"Attack", "FallAttack"},
    DotDatas = T.RT_317,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {
      510102,
      510104,
      510103
    }
  },
  [510131] = {
    AddAttrs = T.RT_135,
    AllowSkillSustainModify = true,
    BuffDamagedRate = T.RT_338,
    BuffId = 510131,
    BuffType = T.RT_339,
    BuffTypeImgPath = "Songlu",
    EnableRimLightModel = true,
    FresnelParams = T.RT_341,
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_342
  },
  [510191] = {
    BuffId = 510191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510192,
        Camp = "Friend",
        Condition = 1007
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510192] = {
    AddAttrs = {
      [1] = {
        AttrName = "EnmityValue",
        Value = 0.05
      }
    },
    BuffId = 510192,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [510211] = {
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_510201.BP_Buff_510201",
    BuffId = 510211,
    BuffType = {
      11,
      61,
      510211
    },
    BuffTypeImgPath = "Common_Buff",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_343
  },
  [510212] = {
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = 0.35
      },
      [2] = {
        AttrName = "SlideVelocityModifier",
        Value = 0.35
      },
      [3] = {
        AttrName = "BulletJumpVelocityModifier",
        Value = 0.35
      },
      [4] = {
        AttrName = "JumpVelocityModifier",
        Value = 0.35
      }
    },
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_510201.BP_Buff_510201",
    BuffId = 510212,
    BuffType = {11, 510211},
    BuffTypeImgPath = "Common_Buff",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_343
  },
  [510213] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Value = 0.6
      }
    },
    BuffId = 510213,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510221] = {
    AddAttrs = T.RT_80,
    AllowSkillSustainModify = true,
    BuffId = 510221,
    BuffType = T.RT_344,
    BuffTypeImgPath = "Weapon_Spd_Up",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    VisualEffects = T.RT_345
  },
  [510222] = {
    AddAttrs = {
      [1] = T.RT_78,
      [2] = T.RT_79,
      [3] = {
        AttrName = "BonusDamage",
        Type = "Wind",
        Value = 0.2
      }
    },
    AddPassiveEffect = T.RT_205,
    AllowSkillSustainModify = true,
    BuffId = 510222,
    BuffType = T.RT_344,
    BuffTypeImgPath = "Weapon_Spd_Up",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    VisualEffects = T.RT_345
  },
  [510231] = {
    AllowSkillSustainModify = true,
    BuffId = 510231,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530100] = {
    ActivateSkills = {
      [30] = 530105,
      [530101] = 530111,
      [530102] = 530121
    },
    AllowSkillSustainModify = true,
    AttackToFire = 1,
    BuffId = 530100,
    BuffType = {70, 530102},
    CameraParam = T.RT_163,
    DisableSkills = T.RT_346,
    DotDatas = {
      [1] = {
        Condition = 530122,
        DotDelay = 2.7,
        Interval = 1,
        Type = "SpChange",
        Value = -30
      },
      [2] = {
        Condition = 530121,
        DotDelay = 2.7,
        EffectId = 530128,
        Interval = 1,
        Type = "SkillEffect"
      }
    },
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 1
  },
  [530101] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_530101.BP_Buff_530101",
    BuffId = 530101,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_347
  },
  [530102] = {
    AllowSkillSustainModify = true,
    BuffId = 530102,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Common_Debuff",
    IsShowInBillboard = true,
    MaxLayer = 12,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree",
    VisualEffects = {530101}
  },
  [530110] = {
    AllowSkillSustainModify = true,
    BuffId = 530110,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hp_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    OverrideAttrs = {AttrName = "FakeHpRate", Value = 0.01}
  },
  [530111] = {
    BuffId = 530111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530112] = {
    AddAttrs = {
      [1] = {
        AttrName = "DropDistance",
        Value = 1500
      }
    },
    BuffDamagedRate = T.RT_121,
    BuffId = 530112,
    BuffType = {11, 530102},
    BuffTypeImgPath = "Damaged_Down",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [530113] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Almighty",
        Value = 0.5
      }
    },
    BuffId = 530113,
    BuffType = T.RT_348,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530121] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 0.35
      }
    },
    BuffId = 530121,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530122] = {
    BuffId = 530122,
    BuffType = T.RT_348,
    DotDatas = {
      [1] = {
        DotDelay = 2.7,
        EffectId = 530142,
        Interval = 5,
        Type = "SkillEffect"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530131] = {
    AddAttrs = T.RT_67,
    AllowSkillSustainModify = true,
    BuffId = 530131,
    BuffInitEffects = T.RT_81,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Berserk",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530132] = {
    AddAttrs = T.RT_16,
    AllowSkillSustainModify = true,
    BuffId = 530132,
    BuffInitEffects = T.RT_247,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530133] = {
    AddAttrs = T.RT_55,
    AllowSkillSustainModify = true,
    BuffId = 530133,
    BuffInitEffects = T.RT_88,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530141] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.2
      }
    },
    BuffId = 530141,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540101] = {
    AllowSkillSustainModify = true,
    BuffId = 540101,
    BuffType = T.RT_349,
    BuffTypeImgPath = "Common_Buff_Aura",
    DotDatas = T.RT_351,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540111,
        Camp = "Friend"
      },
      [2] = T.RT_352
    },
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_353
  },
  [540102] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = -0.15}
    },
    AllowSkillSustainModify = true,
    BuffId = 540102,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Atk_Down",
    DotDatas = T.RT_193,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {540124}
  },
  [540103] = {
    AddAttrs = T.RT_42,
    BuffId = 540103,
    BuffInitEffects = T.RT_258,
    BuffTypeImgPath = "Weapon_Trigger_Up",
    IconPriority = 99,
    IsShowInBillboard = true,
    MaxLayer = 30,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    WeaponFresnelParams = {
      FresnelColor = {
        0.314,
        1,
        0.02,
        1
      },
      FresnelColorRange = T.RT_108,
      FresnelColorStrength = {Default = 0, Ranged = 8}
    }
  },
  [540111] = {
    BuffId = 540111,
    BuffType = {11, 540111},
    BuffTypeImgPath = "Hot_Up",
    DotDatas = T.RT_355,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540112] = {
    AddAttrs = T.RT_143,
    BuffId = 540112,
    BuffInitEffects = T.RT_184,
    BuffType = T.RT_300,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {540112}
  },
  [540113] = {
    AllowSkillSustainModify = true,
    BuffId = 540113,
    BuffType = T.RT_349,
    BuffTypeImgPath = "Common_Buff_Aura",
    DotDatas = T.RT_351,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540114,
        Camp = "Friend"
      },
      [2] = T.RT_352
    },
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_353
  },
  [540114] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 0.1
      }
    },
    BuffId = 540114,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DisperseBuffType = T.RT_353,
    DotDatas = T.RT_355,
    ForbidBuffType = T.RT_353,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540121] = {
    AddAttrs = T.RT_204,
    AddPassiveEffect = T.RT_205,
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_356,
    BuffId = 540121,
    BuffType = {10, 540121},
    BuffTypeImgPath = "BonusDmg_Wind",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_357
  },
  [540122] = {
    AddAttrs = T.RT_204,
    AddPassiveEffect = {205, 540102},
    AllowSkillSustainModify = true,
    BuffEffects = T.RT_356,
    BuffId = 540122,
    BuffType = T.RT_18,
    BuffTypeImgPath = "BonusDmg_Wind",
    DisperseBuffType = T.RT_356,
    ForbidBuffType = T.RT_356,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_357
  },
  [540123] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 0.07
      }
    },
    BuffId = 540123,
    BuffInitEffects = T.RT_77,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [540124] = {
    AllowSkillSustainModify = true,
    BuffId = 540124,
    BuffType = T.RT_213,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunBound",
    VisualEffects = {540122}
  },
  [540200] = {
    BuffId = 540200,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540201] = {
    BuffId = 540201,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540202] = {
    BuffId = 540202,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540203] = {
    BuffId = 540203,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540204] = {
    BuffEffects = T.RT_162,
    BuffId = 540204,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540205] = {
    ActivateSkills = {Attack = 540223, Shooting = 540223},
    BuffId = 540205,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540206] = {
    BuffId = 540206,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540211] = {
    BuffId = 540211,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540212] = {
    BuffId = 540212,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540221] = {
    ActivateSkills = {
      [540231] = 540232
    },
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_540221.BP_Buff_540221",
    BuffId = 540221,
    DisableSkills = T.RT_74,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 1
  },
  [540231] = {
    BuffId = 540231,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540232,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540232] = {
    AddPassiveEffect = {540211},
    BuffId = 540232,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [540241] = {
    BuffId = 540241,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540242,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540242] = {
    BuffId = 540242,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = T.RT_359,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [600101] = {
    BuffId = 600101,
    BuffType = T.RT_300,
    BuffTypeImgPath = "Weapon_Spd_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {600100}
  },
  [600501] = {
    BuffId = 600501,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = T.RT_329,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_330
  },
  [600502] = {
    BuffId = 600502,
    BuffType = {
      11,
      60,
      600502
    },
    ForbidBuffType = T.RT_115,
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_133,
    VisualEffects = {600505}
  },
  [700221] = {
    BuffId = 700221,
    ForbidBuffType = {41, 43},
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [700401] = {
    BuffId = 700401,
    BuffType = T.RT_18,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SeHitedMat = "Shield"
  },
  [700501] = {
    AddAttrs = {
      [1] = T.RT_375,
      [2] = T.RT_103,
      [3] = {
        AttrName = "DamagedRate",
        IndividualRateZone = 1,
        Value = -0.5
      }
    },
    BuffId = 700501,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Team_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {700502}
  },
  [700502] = {
    BuffId = 700502,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Team_Caster",
    HaloDatas = {
      [1] = {
        AuraRange = 1500,
        BuffId = 700501,
        Camp = "OtherFriend"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {700501}
  },
  [700601] = {
    BuffId = 700601,
    BuffType = T.RT_3,
    DotDatas = {
      [1] = {
        EffectId = 700623,
        Interval = 0.4,
        Type = "SkillEffect"
      }
    },
    EmissiveParams = {
      EmissiveColor = {
        0.349,
        2,
        1.189,
        1
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [700602] = {
    AddAttrs = {
      [1] = T.RT_375,
      [2] = T.RT_103
    },
    BuffId = 700602,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 0.2,
        Rate = 0.02,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {700602}
  },
  [700701] = {
    AllowSkillSustainModify = true,
    BuffId = 700701,
    BuffType = {20, 203},
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunParalysis",
    VisualEffects = T.RT_246
  },
  [700801] = {
    BuffId = 700801,
    BuffType = T.RT_3,
    DMMIParams = T.RT_377,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = {700806}
  },
  [701101] = {
    AllowSkillSustainModify = true,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_701101.BP_Buff_701101",
    BuffId = 701101,
    BuffType = {11, 302},
    BuffTypeImgPath = "Common_Buff",
    FXMID = T.RT_378,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [701201] = {
    BuffId = 701201,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    TimeDilation = 1.5,
    VisualEffects = {701201}
  },
  [701501] = {
    BuffId = 701501,
    BuffType = T.RT_3,
    DMMIParams = T.RT_377,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = T.RT_4
  },
  [701601] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff.BP_Buff",
    BuffId = 701601,
    BuffType = T.RT_3,
    EmissiveParams = {
      EmissiveColor = {
        0.29,
        1,
        0.97,
        1
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100
  },
  [800201] = {
    BuffId = 800201,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        46.4,
        16.4,
        3.6,
        1
      },
      DMMILineWidth = 0.5
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = T.RT_4
  },
  [800202] = {
    BuffId = 800202,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        51,
        6,
        0,
        1
      },
      DMMILineWidth = 0.5
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = T.RT_5
  },
  [800301] = {
    BuffId = 800301,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = T.RT_359,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850001] = {
    BuffId = 850001,
    LockHp = T.RT_214,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850002] = {
    BuffId = 850002,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_382,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_133
  },
  [850201] = {
    BuffId = 850201,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850202] = {
    AddPassiveEffect = {850202},
    BuffId = 850202,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850203] = {
    BuffId = 850203,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850204] = {
    AddAttrs = T.RT_173,
    BuffEffects = T.RT_184,
    BuffId = 850204,
    BuffType = {42},
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850205] = {
    BuffDamagedRate = {Value = -0.5},
    BuffId = 850205,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850206] = {
    BuffId = 850206,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850210}
  },
  [850207] = {
    BuffId = 850207,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850211}
  },
  [850208] = {
    BuffId = 850208,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850209}
  },
  [850209] = {
    BuffId = 850209,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850212}
  },
  [850210] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        IndividualRateZone = 1,
        Value = 0.2
      }
    },
    BuffId = 850210,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850301] = {
    BuffId = 850301,
    InitialEffect = {850324},
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850302] = {
    BuffId = 850302,
    ForbidBuffType = {40},
    LockHp = T.RT_324,
    LockHpUI = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850303] = {
    BuffId = 850303,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850304] = {
    BuffId = 850304,
    LockHp = {Rate = 0.1},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850305] = {
    BuffId = 850305,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850306}
  },
  [850306] = {
    BuffId = 850306,
    LockHp = T.RT_324,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850307] = {
    AddAttrs = T.RT_112,
    BuffId = 850307,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 100,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850308] = {
    BuffId = 850308,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850309] = {
    BuffId = 850309,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_382,
    LockHp = T.RT_324,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_133
  },
  [850310] = {
    BuffId = 850310,
    BuffType = T.RT_3,
    CameraParam = {
      "BossShijingzheSkill15",
      "0.5",
      "999"
    },
    DeadNotRemove = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850311] = {
    BuffId = 850311,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    LockHp = T.RT_383,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850312] = {
    BuffId = 850312,
    BuffTypeImgPath = "Invincible",
    CannotBeCutTN = true,
    ForbidBuffType = T.RT_115,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_133
  },
  [850313] = {
    BuffId = 850313,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850322}
  },
  [850401] = {
    BuffId = 850401,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850402] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_850402.BP_Buff_850402",
    BuffId = 850402,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850403] = {
    BuffId = 850403,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850404] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        IndividualRateZone = 1,
        Value = 1
      }
    },
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_850404.BP_Buff_850404",
    BuffId = 850404,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    TimeDilation = 0.1
  },
  [850405] = {
    ActivateSkills = {
      [530101] = 530111,
      [530102] = 530121
    },
    AttackToFire = 1,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_530101.BP_Buff_530101",
    BuffId = 850405,
    CameraParam = T.RT_163,
    DisableSkills = T.RT_346,
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "SpChange",
        Value = 5
      }
    },
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    UseSummonWeapon = 1,
    VisualEffects = T.RT_347
  },
  [850406] = {
    BuffId = 850406,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_327,
        Interval = 0.5,
        Rate = 0.3,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_361
  },
  [850501] = {
    AddPassiveEffect = {850501},
    BuffId = 850501,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff",
    MaxLayer = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {850502}
  },
  [850502] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_BossLianhuoCamera.BP_Buff_BossLianhuoCamera",
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 1500,
      BasePitch = 25,
      PitchRate = 0.01,
      UseSaveLoc = "BossMapSkill"
    },
    BuffId = 850502,
    BuffType = T.RT_3,
    CameraParam = T.RT_384,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850503] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        IndividualRateZone = 1,
        Value = 0.05
      }
    },
    BuffId = 850503,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 99,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850504] = {
    BuffId = 850504,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {850512}
  },
  [850505] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_850505.BP_Buff_850505",
    BuffId = 850505,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850901] = {
    BuffId = 850901,
    LockHp = T.RT_214,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850902] = {
    BuffId = 850902,
    LockHp = {Rate = 0.8},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851001] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_851001.BP_Buff_851001",
    BuffId = 851001,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0.3,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_367
  },
  [851002] = {
    AllowSkillSustainModify = true,
    BuffId = 851002,
    DeadNotRemove = true,
    LockHp = T.RT_167,
    LockHpUI = 0,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851003] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_BossLianhuoCamera.BP_Buff_BossLianhuoCamera",
    BossSpCamera = {
      ArmRate = 0,
      BaseArmLength = 1200,
      BasePitch = 35,
      PitchRate = 0,
      UseSaveLoc = "BossMapSkill"
    },
    BuffId = 851003,
    BuffType = T.RT_3,
    CameraParam = T.RT_384,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851004] = {
    BossRecoverUI = {
      DelayTime = 3,
      ExecuteTime = 30,
      RecoverPercent = 0.5
    },
    BuffId = 851004,
    BuffType = T.RT_3,
    LockHpUI = 1
  },
  [851005] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_530101.BP_Buff_530101",
    BuffId = 851005,
    CameraParam = {
      "BossHeilongDefault",
      "0.5",
      "5"
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_347
  },
  [851101] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_851101.BP_Buff_851101",
    BuffId = 851101,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.9,
    VisualEffects = T.RT_360
  },
  [851201] = {
    BuffId = 851201,
    BuffType = T.RT_3,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851202] = {
    BuffId = 851202,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_385,
    ForbidCatch = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [851203] = {
    BuffId = 851203,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_382,
    LockHp = {Rate = 0.61},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851204] = {
    BuffId = 851204,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851205] = {
    BuffId = 851205,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {851202}
  },
  [851206] = {
    BuffId = 851206,
    BuffType = T.RT_3,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851207] = {
    BuffId = 851207,
    BuffType = T.RT_3,
    CameraParam = T.RT_386,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851208] = {
    BuffId = 851208,
    BuffType = T.RT_3,
    CameraParam = T.RT_386,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851209] = {
    BuffId = 851209,
    LockHp = {Rate = 0.49},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851210] = {
    BuffId = 851210,
    LockHp = T.RT_282,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851211] = {
    BuffDamagedRate = {Value = -0.99},
    BuffId = 851211,
    LockHp = {Rate = 0.48},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851212] = {
    BuffId = 851212,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851213] = {
    BuffId = 851213,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_382,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851214] = {
    BuffId = 851214,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_382,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_133
  },
  [851501] = {
    BuffId = 851501,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        Interval = 0.2,
        Rate = 0.01,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [851502] = {
    BuffId = 851502,
    LockHp = {Rate = 0.35},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851901] = {
    BuffId = 851901,
    LockHp = T.RT_383,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851902] = {
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 1500,
      BasePitch = 60,
      PitchRate = 0.01,
      UseSaveLoc = "LiecheCoreLoc"
    },
    BuffId = 851902,
    BuffType = T.RT_3,
    CameraParam = T.RT_384,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851903] = {
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 1800,
      BasePitch = 0,
      PitchRate = -0.01,
      UseSaveLoc = "LiecheCoreLoc"
    },
    BuffId = 851903,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851904] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1600,
      BasePitch = 0,
      PitchRate = -0.002,
      UseSaveLoc = "Lmid"
    },
    BuffId = 851904,
    BuffType = T.RT_3,
    CameraParam = T.RT_387,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851905] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1500,
      BasePitch = 0,
      PitchRate = -0.001,
      UseSaveLoc = "Skill05M"
    },
    BuffId = 851905,
    BuffType = T.RT_3,
    CameraParam = T.RT_387,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851906] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1500,
      BasePitch = 0,
      PitchRate = -0.001,
      UseSaveLoc = "Skill05L"
    },
    BuffId = 851906,
    BuffType = T.RT_3,
    CameraParam = T.RT_387,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851907] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1500,
      BasePitch = 0,
      PitchRate = -0.001,
      UseSaveLoc = "Skill07Center"
    },
    BuffId = 851907,
    BuffType = T.RT_3,
    CameraParam = T.RT_387,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [852001] = {
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 3000,
      BasePitch = 60,
      PitchRate = 0.01,
      UseSaveLoc = "CenterLoc"
    },
    BuffId = 852001,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [852003] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1200,
      BasePitch = -20,
      PitchRate = -0.002,
      UseSaveLoc = "Skill0501"
    },
    BuffId = 852003,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [852004] = {
    BossSpCamera = {
      ArmRate = -0.1,
      BaseArmLength = 1200,
      BasePitch = -20,
      PitchRate = -0.002,
      UseSaveLoc = "Skill0801"
    },
    BuffId = 852004,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [852005] = {
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 2000,
      BasePitch = 30,
      PitchRate = 0.01,
      UseSaveLoc = "CenterLoc"
    },
    BuffId = 852005,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [900003] = {
    BuffEffects = T.RT_322,
    BuffId = 900003,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0.2,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [900301] = {
    BuffId = 900301,
    BuffType = T.RT_3,
    HaloDatas = {
      [1] = {
        AuraRange = 1500,
        BuffId = 900302,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {900301}
  },
  [900302] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = 0.3
      },
      [2] = T.RT_124
    },
    BuffId = 900302,
    BuffType = T.RT_270,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {900302}
  },
  [900303] = {
    BuffId = 900303,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {900303}
  },
  [900401] = {
    BuffId = 900401,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {900401}
  },
  [900601] = {
    BuffId = 900601,
    BuffType = T.RT_269,
    EffectCreatureID = 900601,
    FXMID = T.RT_378,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [900602] = {
    BuffId = 900602,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1001,
    SpecialEffect = {"Invisible"}
  },
  [900603] = {
    BuffId = 900603,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        1,
        0.2,
        0,
        1
      },
      DMMILineWidth = 0.3
    },
    FXMID = T.RT_378,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [950001] = {
    AddAttrs = {
      [1] = T.RT_375
    },
    BuffId = 950001,
    BuffType = T.RT_270,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [950101] = {
    AddAttrs = {
      [1] = T.RT_362
    },
    BuffId = 950101,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [950401] = {
    BuffId = 950401,
    ForbidBuffType = T.RT_385,
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [950402] = {
    BuffId = 950402,
    BuffType = {21, 950401},
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SetCharacterTag = "Stun",
    StunType = "StunParalysis"
  },
  [950403] = {
    BuffId = 950403,
    LockHp = T.RT_383,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [980501] = {
    BuffId = 980501,
    DeadNotRemove = true,
    EnableFlight = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1000101] = {
    BuffId = 1000101,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        232,
        82,
        18,
        1
      },
      DMMILineWidth = 1
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = T.RT_4
  },
  [1000102] = {
    BuffId = 1000102,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        204,
        24,
        0,
        1
      },
      DMMILineWidth = 1
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    VisualEffects = T.RT_5
  },
  [1000301] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        IndividualRateZone = 1,
        Value = 0.5
      }
    },
    BuffId = 1000301,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {1000407}
  },
  [1020121] = {
    ActivateSkills = {
      Attack = 1020105,
      SkillOwner = "MeleeWeapon"
    },
    BuffId = 1020121,
    BuffType = {70, 71},
    DisableSkills = T.RT_74,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1030111] = {
    AddAttrs = T.RT_84,
    BuffId = 1030111,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1030221] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_1030221.BP_Buff_1030221",
    BuffId = 1030221,
    BuffType = T.RT_85,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RagdollEnable = 1,
    SetCharacterTag = "HitFly"
  },
  [1030222] = {
    AddAttrs = T.RT_87,
    BuffId = 1030222,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1040141] = {
    AddAttrs = T.RT_87,
    BuffId = 1040141,
    BuffType = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1050121] = {
    ActivateSkills = {
      Attack = 1019901,
      HeavyAttack = 1010102,
      SkillOwner = "MeleeWeapon"
    },
    BuffId = 1050121,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1060202] = {
    BuffId = 1060202,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1311001] = {
    BuffDamagedRate = T.RT_22,
    BuffId = 1311001,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1430001] = {
    AddAttrs = {
      [1] = {
        AttrName = "SpRecoverValue",
        Value = "#1"
      }
    },
    BuffId = 1430001,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1440001] = {
    AddAttrs = T.RT_135,
    BuffId = 1440001,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1961001] = {
    AddPassiveEffect = {1961001},
    BuffId = 1961001,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010001] = {
    BuffId = 2010001,
    BuffType = T.RT_3,
    LockHp = T.RT_214,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010002] = {
    BuffId = 2010002,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    FresnelParams = T.RT_218,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    Priority = 1000,
    SpecialEffect = T.RT_133,
    UISpecialEffect = T.RT_219
  },
  [2010003] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Abyss",
        Stackable = 1,
        Value = 0.01
      }
    },
    BuffId = 2010003,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IconPriority = 100,
    IsShowInBillboard = true,
    MaxLayer = 50,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010004] = {
    BuffId = 2010004,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Endure",
    CannotBeHitted = true,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [2010011] = {
    AddAttrs = T.RT_222,
    BuffId = 2010011,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IconPriority = 1,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2010035] = {
    AddAttrs = {
      [1] = T.RT_223,
      [2] = T.RT_224
    },
    BuffId = 2010035,
    BuffType = T.RT_225,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010051] = {
    AddAttrs = {
      [1] = T.RT_224,
      [2] = T.RT_226
    },
    BuffId = 2010051,
    BuffType = T.RT_225,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010101] = {
    BuffId = 2010101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff_Aura",
    HaloDatas = T.RT_228,
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010102] = {
    BuffDamagedRate = T.RT_121,
    BuffId = 2010102,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010201] = {
    BuffDamagedRate = T.RT_229,
    BuffId = 2010201,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MaxLayer = 80,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010202] = {
    BuffDamagedRate = T.RT_230,
    BuffId = 2010202,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MaxLayer = 40,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010203] = {
    BuffDamagedRate = T.RT_230,
    BuffId = 2010203,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MaxLayer = 40,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010211] = {
    BuffId = 2010211,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Es",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxES",
        Condition = 2010211,
        DamageTag = T.RT_60,
        Interval = 3,
        Rate = 0.3,
        Type = "AddShield"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010301] = {
    AddAttrs = T.RT_232,
    BuffId = 2010301,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    IconPriority = 1,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2010302] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Ranged",
        RateZone = "Normal",
        Value = 0.5
      }
    },
    BuffId = 2010302,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010304] = {
    AddAttrs = T.RT_234,
    BuffId = 2010304,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    LayerExtraBuff = {
      [5] = 2010004
    },
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2010402] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        DamageTag = "Melee",
        IndividualRateZone = 1,
        Value = -0.5
      }
    },
    BuffId = 2010402,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010512] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRDModifierRate",
        Value = -0.5
      }
    },
    BuffId = 2010512,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Crd_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011111] = {
    AddAttrs = {
      [1] = T.RT_235
    },
    BuffId = 2011111,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Def_Up",
    HaloDatas = T.RT_228,
    IconPriority = 201,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011112] = {
    AddAttrs = T.RT_237,
    BuffDamagedRate = T.RT_121,
    BuffId = 2011112,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Def_Down",
    IconPriority = 200,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011114] = {
    BuffId = 2011114,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    OverrideAttrs = T.RT_238
  },
  [2011121] = {
    BuffDamagedRate = T.RT_229,
    BuffId = 2011121,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 80,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011122] = {
    AddAttrs = T.RT_222,
    BuffId = 2011122,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Weapon_Multishoot_Up",
    IconPriority = 200,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2011212] = {
    AddAttrs = T.RT_240,
    BuffDamagedRate = T.RT_121,
    BuffId = 2011212,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011213] = {
    BuffDamagedRate = T.RT_230,
    BuffId = 2011213,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 40,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    OverrideAttrs = T.RT_238
  },
  [2011221] = {
    AddAttrs = {
      [1] = {AttrName = "SkillSpeed", Rate = 0.05}
    },
    BuffId = 2011221,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Spd_Up",
    IconPriority = 1,
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2011222] = {
    BuffDamagedRate = T.RT_229,
    BuffId = 2011222,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 80,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011223] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        DamageTag = "Ranged",
        IndividualRateZone = 1,
        Value = 0.3
      }
    },
    BuffId = 2011223,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Es",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011311] = {
    BuffId = 2011311,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff_Aura",
    HaloDatas = T.RT_228,
    IconPriority = 1,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011312] = {
    AddAttrs = T.RT_240,
    BuffDamagedRate = T.RT_121,
    BuffId = 2011312,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011313] = {
    BuffDamagedRate = T.RT_230,
    BuffId = 2011313,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 40,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011321] = {
    AddAttrs = T.RT_222,
    BuffId = 2011321,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IconPriority = 1,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [2011322] = {
    BuffDamagedRate = T.RT_229,
    BuffId = 2011322,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 80,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2011323] = {
    BuffId = 2011323,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Es",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2050501] = {
    BuffId = 2050501,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2060301] = {
    BuffId = 2060301,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = {2060301}
  },
  [4010001] = {
    AddAttrs = T.RT_232,
    BuffId = 4010001,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010002] = {
    AddAttrs = T.RT_234,
    BuffId = 4010002,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010003] = {
    AddAttrs = {
      [1] = {
        AttrName = "EnmityValue",
        Value = 0.1
      }
    },
    BuffId = 4010003,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Berserk",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010004] = {
    AddAttrs = {
      [1] = {
        AttrName = "EnmityValue",
        Value = 0.2
      }
    },
    BuffId = 4010004,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Berserk",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010005] = {
    AddAttrs = T.RT_307,
    BuffId = 4010005,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010006] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 2}
    },
    BuffId = 4010006,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010007] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 1
      }
    },
    BuffId = 4010007,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010008] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 2
      }
    },
    BuffId = 4010008,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010009] = {
    AddAttrs = {
      [1] = {
        AttrName = "SupportSkillCD",
        Rate = -0.5
      }
    },
    BuffId = 4010009,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010010] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillSpeed",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 4010010,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Spd_Up",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010011] = {
    AddAttrs = {
      [1] = {
        AttrName = "EnmityValue",
        Value = 0.5
      }
    },
    BuffId = 4010011,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Berserk",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010012] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "HeavyAttack",
        RateZone = "Normal",
        Value = 1
      }
    },
    BuffId = 4010012,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010013] = {
    AddAttrs = T.RT_307,
    BuffId = 4010013,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [4010014] = {
    BuffId = 4010014,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Energy",
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "SpChange",
        Value = 20
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = {6012}
  },
  [4010015] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeedModifierRate",
        Type = "Melee",
        Value = 1
      }
    },
    BuffId = 4010015,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Weapon_Spd_Up",
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "AddComboCount",
        Value = 20
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = {6032}
  },
  [4010016] = {
    AddAttrs = T.RT_307,
    BuffEffects = {6042},
    BuffId = 4010016,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000001] = {
    BuffEffects = T.RT_184,
    BuffId = 5000001,
    BuffTypeImgPath = "Weapon_Spd_Down",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.5
  },
  [5000002] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierValue",
        Stackable = 1,
        Value = 0.2
      }
    },
    BuffEffects = T.RT_256,
    BuffId = 5000002,
    BuffTypeImgPath = "Cri_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000003] = {
    BuffEffects = T.RT_162,
    BuffId = 5000003,
    BuffTypeImgPath = "Hot_Energy",
    DeadNotRemove = true,
    DotDatas = T.RT_321,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000004] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeed",
        Stackable = 1,
        Value = 0.5
      }
    },
    BuffEffects = T.RT_73,
    BuffId = 5000004,
    BuffTypeImgPath = "Weapon_Spd_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000005] = {
    AddAttrs = {
      [1] = {
        AttrName = "MaxHp",
        Rate = 0.3,
        Stackable = 1
      }
    },
    BuffEffects = T.RT_162,
    BuffId = 5000005,
    BuffTypeImgPath = "Hot_Up",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 1,
        Rate = 0.03,
        Stackable = 1,
        Type = "Hot"
      }
    },
    InitialEffect = {500000001},
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    UISpecialEffect = T.RT_302
  },
  [5000006] = {
    BuffId = 5000006,
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        AllowSkillIntensity = 1,
        DamageTag = T.RT_6,
        Interval = 0.2,
        Rate = 1,
        Type = "Dot"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000007] = {
    BuffEffects = T.RT_322,
    BuffId = 5000007,
    BuffTypeImgPath = "Dot_Common",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        AllowSkillIntensity = 1,
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 1,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000008] = {
    BuffEffects = T.RT_322,
    BuffId = 5000008,
    BuffTypeImgPath = "Dot_Common",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        AllowSkillIntensity = 1,
        DamageTag = T.RT_6,
        Interval = 0.2,
        Rate = 2,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000011] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierValue",
        Value = 0.2
      }
    },
    BuffEffects = T.RT_256,
    BuffId = 5000011,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Cri_Up",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000012] = {
    BuffId = 5000012,
    BuffType = T.RT_323,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000011,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000013] = {
    BuffEffects = T.RT_162,
    BuffId = 5000013,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Energy",
    DotDatas = T.RT_321,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000014] = {
    BuffId = 5000014,
    BuffType = T.RT_323,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000013,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000015] = {
    BuffEffects = T.RT_162,
    BuffId = 5000015,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Common_Buff",
    ExpRate = 1,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000016] = {
    BuffId = 5000016,
    BuffType = T.RT_323,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000015,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000017] = {
    BuffId = 5000017,
    LockHp = T.RT_324,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [5000018] = {
    BuffId = 5000018,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0.05,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_325
  },
  [5000019] = {
    BuffId = 5000019,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0.01,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_325
  },
  [5000020] = {
    BuffId = 5000020,
    BuffType = T.RT_3,
    CannotBeHitted = true,
    ForbidBuffType = {
      41,
      43,
      11
    },
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326,
    VisualEffects = {900064}
  },
  [5000021] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.95
      }
    },
    BuffId = 5000021,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {900044}
  },
  [5000022] = {
    BuffId = 5000022,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = T.RT_329,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_330
  },
  [5000100] = {
    AddAttrs = T.RT_334,
    BuffId = 5000100,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_335
  },
  [5000101] = {
    AddAttrs = T.RT_337,
    BuffId = 5000101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_335
  },
  [5000102] = {
    AddAttrs = T.RT_337,
    BuffEffects = {10301004},
    BuffId = 5000102,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000103] = {
    BuffId = 5000103,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Dot_Fire",
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0,
        Type = "Dot",
        Value = 5
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_325
  },
  [5000201] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_5000201.BP_Buff_5000201",
    BuffId = 5000201,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000202] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000202,
    BuffType = T.RT_249,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunCommon"
  },
  [5000203] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_5000203.BP_Buff_5000203",
    BuffId = 5000203,
    BuffType = T.RT_105,
    DisableSkills = {
      "FallAttack",
      "HeavyAttack",
      "SlideAttack",
      "Attack",
      "Skill2",
      "Skill1",
      "Shooting",
      "HeavyShooting",
      "Reload"
    },
    DotDatas = {
      [1] = {
        EffectId = 104,
        Immediately = 1,
        Interval = -1,
        Type = "SkillEffect"
      }
    },
    EnableFlight = 1,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000204] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000204,
    BuffType = T.RT_3,
    DotDatas = {
      [1] = {
        EffectId = 103,
        Interval = 3,
        Type = "SkillEffect"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {241}
  },
  [5000205] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000205,
    BuffType = T.RT_249,
    BuffTypeImgPath = "Stun",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 100,
    SetCharacterTag = "Stun",
    StunType = "StunCommon"
  },
  [5000206] = {
    AddAttrs = T.RT_334,
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000206,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {244}
  },
  [5000207] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000207,
    BuffType = T.RT_268,
    BuffTypeImgPath = "Invincible",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = {"Hit", "Controlled"},
    Priority = 1000,
    SpecialEffect = T.RT_133,
    UISpecialEffect = T.RT_219,
    VisualEffects = {245}
  },
  [5000208] = {
    AddAttrs = {
      [1] = T.RT_296,
      [2] = {
        AttrName = "AvoidChargeCd",
        Rate = -0.5
      }
    },
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000208,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {246}
  },
  [5000209] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_Paoku_Common.BP_Buff_Paoku_Common",
    BuffId = 5000209,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000301] = {
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = 0.2
      },
      [2] = T.RT_331,
      [3] = T.RT_332,
      [4] = T.RT_333
    },
    BuffId = 5000301,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000302] = {
    BuffId = 5000302,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Energy",
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "SpChange",
        Value = 50
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000303] = {
    AddPassiveEffect = {5000303},
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_5000303.BP_Buff_5000303",
    BuffId = 5000303,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000304] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 2
      }
    },
    AddPassiveEffect = {5000304},
    BuffId = 5000304,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000305] = {
    BuffId = 5000305,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_6,
        DamageType = "TrueDamage",
        Interval = 1,
        Rate = 0.03,
        Type = "Dot",
        Value = 5
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000002] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = -0.5
      }
    },
    BuffId = 6000002,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000003] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = -0.25
      }
    },
    BuffId = 6000003,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000004] = {
    AddAttrs = T.RT_309,
    BuffId = 6000004,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000005] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = 0.75
      }
    },
    BuffId = 6000005,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000006] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = 1
      }
    },
    BuffId = 6000006,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000007] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = 1.5
      }
    },
    BuffId = 6000007,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000008] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = 2
      }
    },
    BuffId = 6000008,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000011] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000011,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000012] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000012,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Water_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000013] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000013,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Water"
  },
  [6000014] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000014,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Water"
  },
  [6000021] = {
    AddAttrs = {
      [1] = {
        AttrName = "FireDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000021,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000022] = {
    AddAttrs = {
      [1] = {
        AttrName = "FireDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000022,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Fire_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000023] = {
    AddAttrs = {
      [1] = {
        AttrName = "FireDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000023,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Fire"
  },
  [6000024] = {
    AddAttrs = {
      [1] = T.RT_223
    },
    BuffId = 6000024,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Fire"
  },
  [6000031] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000031,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000032] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000032,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Thunder_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000033] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000033,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Thunder"
  },
  [6000034] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000034,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Thunder"
  },
  [6000041] = {
    AddAttrs = {
      [1] = {
        AttrName = "WindDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000041,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000042] = {
    AddAttrs = {
      [1] = {
        AttrName = "WindDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000042,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Wind_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000043] = {
    AddAttrs = {
      [1] = {
        AttrName = "WindDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000043,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Wind"
  },
  [6000044] = {
    AddAttrs = {
      [1] = T.RT_224
    },
    BuffId = 6000044,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Wind"
  },
  [6000051] = {
    AddAttrs = {
      [1] = {
        AttrName = "DarkDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000051,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000052] = {
    AddAttrs = {
      [1] = {
        AttrName = "DarkDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000052,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000053] = {
    AddAttrs = T.RT_126,
    BuffId = 6000053,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Dark"
  },
  [6000054] = {
    AddAttrs = {
      [1] = T.RT_226
    },
    BuffId = 6000054,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Dark"
  },
  [6000061] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000061,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000062] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000062,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000063] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000063,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Light"
  },
  [6000064] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000064,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Light"
  },
  [6000071] = {
    BuffId = 6000071,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000072] = {
    BuffId = 6000072,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000073] = {
    BuffId = 6000073,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000074] = {
    BuffId = 6000074,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000075] = {
    BuffId = 6000075,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000076] = {
    BuffId = 6000076,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000077] = {
    BuffId = 6000077,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000078] = {
    BuffId = 6000078,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000079] = {
    BuffId = 6000079,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000080] = {
    BuffId = 6000080,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000081] = {
    BuffId = 6000081,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000082] = {
    BuffId = 6000082,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000102] = {
    BuffId = 6000102,
    BuffType = T.RT_300,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.96,
    VisualEffects = T.RT_360
  },
  [6000103] = {
    BuffId = 6000103,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        Interval = 0.2,
        Rate = 0.1,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000107] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", Rate = -0.9}
    },
    BuffId = 6000107,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Def_Down",
    DotDatas = {
      [1] = {
        DamageTag = {
          "Dot",
          "PhantomAvoid",
          "Poison"
        },
        Interval = 2,
        Rate = 0.1,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {600000302}
  },
  [6000109] = {
    BuffId = 6000109,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Dot_Common",
    DotDatas = {
      [1] = {
        DamageTag = {
          "Dot",
          "PhantomAvoid",
          "Blood"
        },
        Interval = 2,
        Rate = 0.3,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_361
  },
  [6000111] = {
    BuffId = 6000111,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        Interval = 2,
        Rate = 0.02,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [6000112] = {
    AddAttrs = {
      [1] = T.RT_235,
      [2] = T.RT_103,
      [3] = T.RT_362,
      [4] = {
        AttrName = "MoveSpeedAddRate",
        Value = 0.4
      }
    },
    BuffId = 6000112,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {600000802}
  },
  [6000113] = {
    BuffId = 6000113,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.7,
    VisualEffects = {700308}
  },
  [6000114] = {
    BuffId = 6000114,
    BuffType = T.RT_145,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.7,
    VisualEffects = T.RT_246
  },
  [6000115] = {
    BuffId = 6000115,
    BuffType = T.RT_144,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.5,
    VisualEffects = T.RT_310
  },
  [6000116] = {
    BuffId = 6000116,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Mon_Roused",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {600001001, 600001011}
  },
  [6000117] = {
    BuffId = 6000117,
    BuffType = T.RT_3,
    DMMIParams = {
      DMMIColor = {
        50,
        50,
        50,
        1
      },
      DMMILineWidth = 0.5
    },
    FXMID = {
      ParamType = "Invisibility",
      Priority = 1000
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [6000118] = {
    BuffId = 6000118,
    BuffType = T.RT_3,
    FresnelParams = T.RT_218,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000119] = {
    BuffId = 6000119,
    BuffType = T.RT_3,
    FresnelParams = T.RT_218,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000120] = {
    BuffId = 6000120,
    BuffType = T.RT_3,
    FresnelParams = T.RT_218,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000200] = {
    BuffId = 6000200,
    ForbidBuffType = T.RT_366,
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [6000201] = {
    BuffId = 6000201,
    BuffTypeImgPath = "Common_Buff",
    ForbidBuffType = T.RT_366,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [6000202] = {
    BuffId = 6000202,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [6000203] = {
    BuffId = 6000203,
    BuffTypeImgPath = "Common_Buff",
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [6000204] = {
    BuffId = 6000204,
    CannotBeCutTN = true,
    ForbidBuffType = T.RT_115,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_133
  },
  [6000205] = {
    BuffId = 6000205,
    BuffTypeImgPath = "Invincible",
    CannotBeCutTN = true,
    ForbidBuffType = T.RT_115,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_133
  },
  [6000206] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "BossDown",
        Value = 0.5
      }
    },
    BuffId = 6000206,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000207] = {
    BuffId = 6000207,
    BuffType = T.RT_3,
    CannotBeCutTN = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000208] = {
    BuffId = 6000208,
    BuffType = T.RT_3,
    ForbidBuffType = {44},
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000209] = {
    BuffId = 6000209,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterTarget = true
  },
  [6000210] = {
    BuffId = 6000210,
    CannotBeHitted = true,
    ForbidBuffType = {
      40,
      41,
      42,
      43,
      44
    },
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_326
  },
  [6000301] = {
    BuffId = 6000301,
    BuffType = {20, 103},
    BuffTypeImgPath = "Dot_Fire",
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        DamageType = "Fire",
        EnableIcon = 1,
        Interval = 1,
        Rate = 0.1,
        Type = "Dot"
      }
    },
    IsShowInBillboard = true,
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_367
  },
  [6000401] = {
    AddPassiveEffect = {6000101},
    BuffId = 6000401,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Frozen",
    FresnelParams = T.RT_218,
    IconPriority = 99915,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000402] = {
    AddPassiveEffect = {6000102},
    BuffId = 6000402,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Burst",
    FresnelParams = T.RT_218,
    IconPriority = 99929,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000403] = {
    AddPassiveEffect = {6000103},
    BuffId = 6000403,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Poison",
    FresnelParams = T.RT_218,
    IconPriority = 99949,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000404] = {
    AddPassiveEffect = {6000104},
    BuffId = 6000404,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Thunder",
    FresnelParams = T.RT_218,
    IconPriority = 99958,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000405] = {
    AddPassiveEffect = {6000105},
    BuffId = 6000405,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Blood",
    FresnelParams = T.RT_218,
    IconPriority = 99939,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000406] = {
    AddPassiveEffect = {6000106},
    BuffId = 6000406,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Fade",
    FresnelParams = T.RT_218,
    IconPriority = 99938,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000407] = {
    AddPassiveEffect = {6000107},
    BuffId = 6000407,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Shield",
    FresnelParams = T.RT_218,
    IconPriority = 99914,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000408] = {
    AddPassiveEffect = {6000108},
    BuffId = 6000408,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Revenge",
    FresnelParams = T.RT_218,
    IconPriority = 99935,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000409] = {
    AddPassiveEffect = {6000109},
    BuffId = 6000409,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_IceOrb",
    FresnelParams = T.RT_218,
    IconPriority = 99919,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000410] = {
    AddPassiveEffect = {6000110},
    BuffId = 6000410,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Reflect",
    FresnelParams = T.RT_218,
    IconPriority = 99925,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000411] = {
    AddPassiveEffect = {6000111},
    BuffId = 6000411,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Kamikaze",
    FresnelParams = T.RT_218,
    IconPriority = 99945,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000412] = {
    AddPassiveEffect = {6000112},
    BuffId = 6000412,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_ThunderLaser",
    FresnelParams = T.RT_218,
    IconPriority = 99959,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000413] = {
    AddPassiveEffect = {6000113},
    BuffId = 6000413,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Vampire",
    FresnelParams = T.RT_218,
    IconPriority = 99969,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_363,
    Priority = 1000
  },
  [6000414] = {
    AddPassiveEffect = {6000114},
    BuffId = 6000414,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Threefold",
    IconPriority = 99968,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [6000501] = {
    AddPassiveEffect = {6000201},
    BuffId = 6000501,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Frozen",
    FresnelParams = T.RT_218,
    IconPriority = 99915,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000502] = {
    AddPassiveEffect = {6000202},
    BuffId = 6000502,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Burst",
    FresnelParams = T.RT_218,
    IconPriority = 99929,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000503] = {
    AddPassiveEffect = {6000203},
    BuffId = 6000503,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Poison",
    FresnelParams = T.RT_218,
    IconPriority = 99949,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000504] = {
    AddPassiveEffect = {6000204},
    BuffId = 6000504,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Thunder",
    FresnelParams = T.RT_218,
    IconPriority = 99958,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000505] = {
    AddPassiveEffect = {6000205},
    BuffId = 6000505,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Blood",
    FresnelParams = T.RT_218,
    IconPriority = 99939,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000506] = {
    AddPassiveEffect = T.RT_136,
    BuffId = 6000506,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Fade",
    FresnelParams = T.RT_218,
    IconPriority = 99938,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000507] = {
    AddPassiveEffect = {6000207},
    BuffId = 6000507,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Shield",
    FresnelParams = T.RT_218,
    IconPriority = 99914,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000508] = {
    AddPassiveEffect = {6000208},
    BuffId = 6000508,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Revenge",
    FresnelParams = T.RT_218,
    IconPriority = 99935,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000509] = {
    AddPassiveEffect = {6000209},
    BuffId = 6000509,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_IceOrb",
    FresnelParams = T.RT_218,
    IconPriority = 99919,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000510] = {
    AddPassiveEffect = {6000210},
    BuffId = 6000510,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Reflect",
    FresnelParams = T.RT_218,
    IconPriority = 99925,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000511] = {
    AddPassiveEffect = {6000211},
    BuffId = 6000511,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Kamikaze",
    FresnelParams = T.RT_218,
    IconPriority = 99945,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000512] = {
    AddPassiveEffect = {6000212},
    BuffId = 6000512,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_ThunderLaser",
    FresnelParams = T.RT_218,
    IconPriority = 99959,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000513] = {
    AddPassiveEffect = {6000213},
    BuffId = 6000513,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Vampire",
    FresnelParams = T.RT_218,
    IconPriority = 99969,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_364,
    Priority = 1000
  },
  [6000514] = {
    AddPassiveEffect = {6000214},
    BuffId = 6000514,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Threefold",
    IconPriority = 99968,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [6000601] = {
    AddPassiveEffect = {6000301},
    BuffId = 6000601,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Frozen",
    FresnelParams = T.RT_218,
    IconPriority = 99915,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000602] = {
    AddPassiveEffect = {6000302},
    BuffId = 6000602,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Burst",
    FresnelParams = T.RT_218,
    IconPriority = 99929,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000603] = {
    AddPassiveEffect = {6000303},
    BuffId = 6000603,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Poison",
    FresnelParams = T.RT_218,
    IconPriority = 99949,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000604] = {
    AddPassiveEffect = {6000304},
    BuffId = 6000604,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Thunder",
    FresnelParams = T.RT_218,
    IconPriority = 99958,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000605] = {
    AddPassiveEffect = {6000305},
    BuffId = 6000605,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Blood",
    FresnelParams = T.RT_218,
    IconPriority = 99939,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000606] = {
    AddPassiveEffect = {6000306},
    BuffId = 6000606,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Fade",
    FresnelParams = T.RT_218,
    IconPriority = 99938,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000607] = {
    AddPassiveEffect = {6000307},
    BuffId = 6000607,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Shield",
    FresnelParams = T.RT_218,
    IconPriority = 99914,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000608] = {
    AddPassiveEffect = {6000308},
    BuffId = 6000608,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Revenge",
    FresnelParams = T.RT_218,
    IconPriority = 99935,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000609] = {
    AddPassiveEffect = {6000309},
    BuffId = 6000609,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_IceOrb",
    FresnelParams = T.RT_218,
    IconPriority = 99919,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000610] = {
    AddPassiveEffect = {6000310},
    BuffId = 6000610,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Reflect",
    FresnelParams = T.RT_218,
    IconPriority = 99925,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000611] = {
    AddPassiveEffect = {6000311},
    BuffId = 6000611,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Kamikaze",
    FresnelParams = T.RT_218,
    IconPriority = 99945,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000612] = {
    AddPassiveEffect = {6000312},
    BuffId = 6000612,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_ThunderLaser",
    FresnelParams = T.RT_218,
    IconPriority = 99959,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000613] = {
    AddPassiveEffect = {6000313},
    BuffId = 6000613,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Vampire",
    FresnelParams = T.RT_218,
    IconPriority = 99969,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NextPassParams = T.RT_365,
    Priority = 1000
  },
  [6000614] = {
    AddPassiveEffect = {6000314},
    BuffId = 6000614,
    BuffType = T.RT_368,
    BuffTypeImgPath = "Elite_Threefold",
    IconPriority = 99968,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [9999999] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        Rate = 0.1,
        Value = 100
      }
    },
    BuffId = 9999999,
    DotDatas = {
      [1] = {
        DamageTag = T.RT_6,
        Interval = 1,
        Rate = 0.01,
        Type = "Dot"
      }
    },
    MaxLayer = 2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SeHitedMat = "Glass"
  },
  [10101101] = {
    AddAttrs = T.RT_9,
    BuffId = 10101101,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Rou_BG01_01",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_11
  },
  [10101102] = {
    AddAttrs = T.RT_9,
    BuffId = 10101102,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Rou_BG01_01",
    DotDatas = T.RT_14,
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_11
  },
  [10101103] = {
    AddAttrs = T.RT_9,
    AddPassiveEffect = {10101902},
    BuffId = 10101103,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Rou_BG01_01",
    DotDatas = T.RT_14,
    IsShowInBillboard = true,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_11
  },
  [10101202] = {
    BuffId = 10101202,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10101991] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Type = "Melee",
        Value = 0.15
      },
      [2] = {
        AttrName = "WeaponCRDModifierRate",
        Stackable = 1,
        Type = "Melee",
        Value = 0.1
      }
    },
    BuffId = 10101991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102101] = {
    AddAttrs = T.RT_20,
    BuffId = 10102101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_21
  },
  [10102102] = {
    BuffDamagedRate = T.RT_22,
    BuffId = 10102102,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_23
  },
  [10102103] = {
    BuffId = 10102103,
    BuffType = T.RT_24,
    BuffTypeImgPath = "Endure",
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [10102104] = {
    AddAttrs = {
      [1] = {
        AttrName = "DropDistance",
        Value = 750
      }
    },
    BuffId = 10102104,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102105] = {
    BuffId = 10102105,
    BuffType = T.RT_3,
    EffectCreatureID = 10102101,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [10102106] = {
    BuffId = 10102106,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Rou_BG02_01",
    IsShowInBillboard = true,
    MaxLayer = 10,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = {10102991}
  },
  [10102107] = {
    BattlePetCdRate = -0.3,
    BuffId = 10102107,
    BuffType = T.RT_27,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102108] = {
    BattlePetCdRate = -0.5,
    BuffId = 10102108,
    BuffType = T.RT_27,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102109] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.15}
    },
    BuffId = 10102109,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102110] = {
    AddAttrs = T.RT_29,
    BuffId = 10102110,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102991] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Type = "Ranged",
        Value = 0.15
      },
      [2] = {
        AttrName = "WeaponCRDModifierRate",
        Stackable = 1,
        Type = "Ranged",
        Value = 0.1
      }
    },
    BuffId = 10102991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103106] = {
    AddAttrs = {
      [1] = {AttrName = "SkillSpeed", Rate = "#1"}
    },
    BuffId = 10103106,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103203] = {
    BuffId = 10103203,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Energy",
    DotDatas = {
      [1] = {
        Interval = 1,
        Type = "SpChange",
        Value = "#1"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103205] = {
    BuffId = 10103205,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Energy",
    DotDatas = {
      [1] = {
        Interval = 2,
        Type = "SpChange",
        Value = "#1"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103901] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Rouge",
        Value = 0.25
      }
    },
    BuffId = 10103901,
    BuffType = T.RT_27,
    BuffTypeImgPath = "Damage_Up",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103902] = {
    BuffId = 10103902,
    BuffType = T.RT_27,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MaxLayer = 60,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103903] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Rouge",
        Value = 0.75
      }
    },
    BuffId = 10103903,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_30
  },
  [10103904] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Rouge",
        Value = "#1"
      }
    },
    BuffId = 10103904,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_30
  },
  [10103991] = {
    AddAttrs = {
      [1] = {
        AttrName = "MaxES",
        Rate = 0.15,
        Stackable = 1
      }
    },
    BuffId = 10103991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10104102] = {
    AddAttrs = T.RT_32,
    BuffId = 10104102,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Skill_Inten_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10104103] = {
    AddAttrs = T.RT_34,
    BuffId = 10104103,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MaxLayer = 3,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10104204] = {
    AddAttrs = T.RT_20,
    BuffId = 10104204,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10104302] = {
    AddAttrs = T.RT_16,
    BuffId = 10104302,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10104901] = {
    BuffId = 10104901,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {10104102}
  },
  [10104991] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Stackable = 1,
        Value = 0.15
      }
    },
    BuffId = 10104991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105101] = {
    AddAttrs = T.RT_16,
    BuffId = 10105101,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105103] = {
    BuffDamagedRate = T.RT_22,
    BuffId = 10105103,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Endure",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105301] = {
    AddAttrs = {
      [1] = {AttrName = "MaxSp", RateUseValue = 1}
    },
    BuffId = 10105301,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105303] = {
    AddAttrs = T.RT_36,
    BuffId = 10105303,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105304] = {
    AddAttrs = T.RT_16,
    BuffId = 10105304,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Atk_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105900] = {
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Stackable = 1,
        Value = 0.01
      },
      [2] = {
        AttrName = "SlideVelocityModifier",
        Stackable = 1,
        Value = 0.01
      },
      [3] = {
        AttrName = "BulletJumpVelocityModifier",
        Stackable = 1,
        Value = 0.01
      },
      [4] = {
        AttrName = "JumpVelocityModifier",
        Stackable = 1,
        Value = 0.01
      }
    },
    BuffId = 10105900,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Boost",
    IsShowInBillboard = true,
    MaxLayer = 60,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105901] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.01}
    },
    BuffId = 10105901,
    BuffType = T.RT_3,
    MaxLayer = 60,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105903] = {
    BuffId = 10105903,
    BuffType = T.RT_3,
    DotDatas = {
      [1] = {
        Immediately = 1,
        Interval = 1,
        Type = "SpChange",
        Value = 2
      }
    },
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105991] = {
    AddAttrs = {
      [1] = {
        AttrName = "MaxSp",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10105991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106101] = {
    AddAttrs = T.RT_38,
    BuffId = 10106101,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106102] = {
    AddAttrs = T.RT_38,
    BuffId = 10106102,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106103] = {
    AddAttrs = T.RT_40,
    BuffId = 10106103,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106104] = {
    AddAttrs = T.RT_40,
    BuffId = 10106104,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106105] = {
    AddAttrs = T.RT_42,
    BuffId = 10106105,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106106] = {
    AddAttrs = T.RT_42,
    BuffId = 10106106,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106107] = {
    AddAttrs = T.RT_44,
    BuffId = 10106107,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106108] = {
    AddAttrs = T.RT_44,
    BuffId = 10106108,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106109] = {
    BuffDamagedRate = T.RT_22,
    BuffId = 10106109,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_23
  },
  [10106110] = {
    AddAttrs = T.RT_46,
    BuffId = 10106110,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106111] = {
    AddAttrs = T.RT_46,
    BuffId = 10106111,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106112] = {
    AddAttrs = T.RT_48,
    BuffId = 10106112,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106113] = {
    AddAttrs = T.RT_48,
    BuffId = 10106113,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106114] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Rouge",
        Value = 0.12
      }
    },
    BuffId = 10106114,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Rou_BG06_01",
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree",
    VisualEffects = T.RT_49
  },
  [10106991] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillRange",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10106991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107101] = {
    BuffId = 10107101,
    BuffType = T.RT_3,
    DotDatas = T.RT_51,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107102] = {
    BuffId = 10107102,
    BuffType = T.RT_3,
    DotDatas = T.RT_51,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107103] = {
    AddAttrs = T.RT_53,
    BuffId = 10107103,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107104] = {
    AddAttrs = T.RT_53,
    BuffId = 10107104,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107105] = {
    AddAttrs = T.RT_20,
    BuffId = 10107105,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_21
  },
  [10107106] = {
    AddAttrs = T.RT_55,
    BuffId = 10107106,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107107] = {
    AddAttrs = T.RT_55,
    BuffId = 10107107,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107108] = {
    AddAttrs = T.RT_57,
    BuffId = 10107108,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107109] = {
    AddAttrs = T.RT_57,
    BuffId = 10107109,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107110] = {
    AddAttrs = T.RT_59,
    BuffId = 10107110,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107111] = {
    AddAttrs = T.RT_59,
    BuffId = 10107111,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107112] = {
    BuffId = 10107112,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = T.RT_62,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [10107113] = {
    AddAttrs = T.RT_65,
    BuffId = 10107113,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107114] = {
    AddAttrs = T.RT_65,
    BuffId = 10107114,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107115] = {
    AddAttrs = T.RT_67,
    BuffId = 10107115,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107116] = {
    AddAttrs = T.RT_67,
    BuffId = 10107116,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107117] = {
    AddAttrs = {
      [1] = {AttrName = "MaxHp", Rate = 0.005}
    },
    BuffId = 10107117,
    BuffType = T.RT_27,
    BuffTypeImgPath = "Rou_BG07_01",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MaxLayer = 100,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10107118] = {
    BuffId = 10107118,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 1,
        Rate = 0.01,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [10107119] = {
    BuffId = 10107119,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 1,
        Rate = 0.0134,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [10107120] = {
    BuffId = 10107120,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 1,
        Rate = 0.0167,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [10107121] = {
    BuffId = 10107121,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Hot_Up",
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_60,
        Interval = 1,
        Rate = 0.02,
        Type = "Hot"
      }
    },
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_63
  },
  [10107122] = {
    AddAttrs = {
      [1] = {AttrName = "MaxHp", Rate = 1}
    },
    BuffId = 10107122,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Rou_BG07_02",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_68
  },
  [10107123] = {
    BuffId = 10107123,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {10109103}
  },
  [10107124] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", ValueUseValue = 1}
    },
    BuffId = 10107124,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Rou_BG07_02",
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26,
    VisualEffects = T.RT_68
  },
  [10107125] = {
    BuffId = 10107125,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    OverrideAttrs = {AttrName = "FakeHpRate", Value = 0.4}
  },
  [10107126] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", ValueUseValue = 1}
    },
    BuffId = 10107126,
    BuffType = T.RT_3,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107991] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillSustain",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10107991,
    BuffType = T.RT_3,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10503001] = {
    AddAttrs = T.RT_98,
    AddPassiveEffect = T.RT_72,
    BuffId = 10503001,
    BuffType = T.RT_96,
    DisperseBuffType = T.RT_95,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20101001] = {
    BuffDamagedRate = {Value = -1},
    BuffId = 20101001,
    BuffType = T.RT_24,
    BuffTypeImgPath = "Endure",
    CannotBeHitted = true,
    ForbidBuffType = T.RT_25,
    ForbidCatch = true,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterCharacterTagType = T.RT_26
  },
  [20116001] = {
    BuffDamagedRate = T.RT_139,
    BuffId = 20116001,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20119001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Almighty",
        Value = 0.1
      }
    },
    BuffId = 20119001,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MaxLayer = 7,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [20120001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Value = 0.3
      }
    },
    BuffId = 20120001,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = T.RT_21
  },
  [20151001] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillEfficiency",
        Rate = -0.5
      },
      [2] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Value = 0.5
      }
    },
    BuffId = 20151001,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20152001] = {
    AddAttrs = T.RT_242,
    BuffId = 20152001,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20153001] = {
    AddAttrs = T.RT_242,
    BuffId = 20153001,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20154001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Normal",
        Value = 0.5
      },
      [2] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Value = 1
      }
    },
    BuffId = 20154001,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20156001] = {
    AddAttrs = {
      [1] = {
        AttrName = "CutTNModify",
        Value = 1
      }
    },
    BuffId = 20156001,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20156002] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "BossDown",
        Value = 1
      }
    },
    BuffId = 20156002,
    BuffType = T.RT_10,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20161001] = {
    BuffDamagedRate = T.RT_139,
    BuffId = 20161001,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Down",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30100001] = {
    AddPassiveEffect = {20130001},
    BuffId = 30100001,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30100002] = {
    AddPassiveEffect = {20131001},
    BuffId = 30100002,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30100003] = {
    AddPassiveEffect = {20132001},
    BuffId = 30100003,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30100004] = {
    AddPassiveEffect = {20133001},
    BuffId = 30100004,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30100005] = {
    AddPassiveEffect = {20134001},
    BuffId = 30100005,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30100006] = {
    AddPassiveEffect = {20135001},
    BuffId = 30100006,
    BuffType = T.RT_18,
    BuffTypeImgPath = "Damage_Up",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [30101002] = {
    AddAttrs = T.RT_16,
    BuffId = 30101002,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30102001] = {
    AddAttrs = T.RT_92,
    BuffId = 30102001,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30102002] = {
    AddAttrs = T.RT_16,
    BuffId = 30102002,
    BuffType = T.RT_27,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30400001] = {
    AddPassiveEffect = {30424},
    BuffId = 30400001,
    BuffType = T.RT_271,
    BuffTypeImgPath = "Elite_Threefold",
    DisperseBuffType = T.RT_272,
    EmissiveParams = {
      EmissiveColor = {
        0,
        3,
        10,
        1
      },
      EmissiveIntensity = 10
    },
    IconPriority = 99915,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_273
  },
  [30400002] = {
    AddPassiveEffect = {30425},
    BuffId = 30400002,
    BuffType = T.RT_274,
    BuffTypeImgPath = "Elite_Vampire",
    DisperseBuffType = T.RT_275,
    EmissiveParams = {
      EmissiveColor = {
        9.8,
        10,
        0,
        1
      },
      EmissiveIntensity = 10
    },
    IconPriority = 99929,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_276
  },
  [30400003] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = -0.5},
      [2] = {AttrName = "DEF", Rate = 2}
    },
    BuffId = 30400003,
    BuffType = {30, 30403},
    BuffTypeImgPath = "Def_Up",
    EffectCreatureID = 304000001,
    IsShowInBillboard = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [30400004] = {
    BossSpCamera = {
      ArmRate = -0.5,
      BaseArmLength = 2500,
      BasePitch = 50,
      PitchRate = 0.01,
      UseSaveLoc = "CenterLoc"
    },
    BuffId = 30400004,
    BuffType = T.RT_3,
    CameraParam = T.RT_277,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [30400005] = {
    AddAttrs = T.RT_237,
    BuffId = 30400005,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Def_Down",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30400006] = {
    BuffId = 30400006,
    LockHp = {Rate = 0.3},
    LockHpUI = 0,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30400007] = {
    AddPassiveEffect = {30426},
    BuffId = 30400007,
    BuffType = T.RT_278,
    BuffTypeImgPath = "Elite_Vampire",
    DisperseBuffType = T.RT_279,
    EmissiveParams = {
      EmissiveColor = {
        10,
        0,
        7.7,
        1
      },
      EmissiveIntensity = 10
    },
    IconPriority = 99914,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_280
  },
  [30400008] = {
    BuffId = 30400008,
    BuffType = T.RT_271,
    BuffTypeImgPath = "Elite_Threefold",
    DeadNotRemove = true,
    DisperseBuffType = T.RT_272,
    IconPriority = 99935,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_273
  },
  [30400009] = {
    BuffId = 30400009,
    BuffType = T.RT_274,
    BuffTypeImgPath = "Elite_Vampire",
    DeadNotRemove = true,
    DisperseBuffType = T.RT_275,
    IconPriority = 99919,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_276
  },
  [30400010] = {
    BuffId = 30400010,
    BuffType = T.RT_278,
    BuffTypeImgPath = "Elite_Vampire",
    DeadNotRemove = true,
    DisperseBuffType = T.RT_279,
    IconPriority = 99925,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000,
    VisualEffects = T.RT_280
  },
  [30400011] = {
    BuffId = 30400011,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Elite_Vampire",
    EmissiveParams = {
      EmissiveColor = {
        0.1,
        0.1,
        0.1,
        1
      },
      EmissiveIntensity = 10
    },
    IconPriority = 99945,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    Priority = 1000
  },
  [30400012] = {
    BuffId = 30400012,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Elite_Vampire",
    IconPriority = 99959,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {304000005}
  },
  [30400013] = {
    BuffId = 30400013,
    LockHp = T.RT_282,
    LockHpUI = 0,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30400014] = {
    BuffId = 30400014,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Elite_Vampire",
    IconPriority = 99968,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {304000006}
  },
  [30400015] = {
    BuffId = 30400015,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Elite_Vampire",
    IconPriority = 99915,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {304000007}
  },
  [30400016] = {
    BuffId = 30400016,
    BuffType = T.RT_281,
    BuffTypeImgPath = "Elite_Vampire",
    IconPriority = 99929,
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    VisualEffects = {304000008}
  },
  [30400017] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", Rate = -0.15}
    },
    BuffId = 30400017,
    BuffType = T.RT_10,
    BuffTypeImgPath = "Def_Down",
    DeadNotRemove = true,
    IsShowInBillboard = true,
    MaxLayer = 5,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101001] = {
    BuffId = 40101001,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101002] = {
    BuffId = 40101002,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101003] = {
    BuffId = 40101003,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101004] = {
    BuffId = 40101004,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101005] = {
    BuffId = 40101005,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101006] = {
    AddAttrs = T.RT_309,
    BuffId = 40101006,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101007] = {
    BPPath = "/Game/BluePrints/Combat/Buff/BPBuffs/BP_Buff_40101007.BP_Buff_40101007",
    BuffId = 40101007,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101008] = {
    BuffId = 40101008,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101009] = {
    BuffId = 40101009,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101010] = {
    BuffId = 40101010,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101011] = {
    BuffId = 40101011,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101012] = {
    BuffId = 40101012,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101013] = {
    BuffId = 40101013,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101014] = {
    BuffId = 40101014,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101015] = {
    BuffId = 40101015,
    BuffType = T.RT_3,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101016] = {
    BuffId = 40101016,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Slowdown",
    IsShowInBillboard = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    TimeDilation = 0.3,
    VisualEffects = T.RT_310
  },
  [40101017] = {
    BuffDamagedRate = {Value = 0.15},
    BuffId = 40101017,
    BuffType = T.RT_3,
    BuffTypeImgPath = "Damaged_Up",
    IsShowInBillboard = true,
    MaxLayer = 4,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [99999999] = {
    AddAttrs = T.RT_173,
    BuffId = 99999999,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [999999999] = {
    BuffId = 999999999,
    HitReplace = {HitFly = "HeavyHIt"},
    LayerExtraBuff = {
      [2] = 104
    },
    MaxLayer = 4,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  }
})
