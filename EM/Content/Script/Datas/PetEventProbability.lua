local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PetEventProbability", {
  [1] = {
    GroupID = 1,
    Pets = {
      4911,
      4912,
      4913,
      4921,
      4922,
      4923,
      4931,
      4932,
      4933,
      4941
    },
    Probability = 700
  },
  [2] = {
    GroupID = 2,
    Pets = {
      4011,
      4012,
      4021,
      4022,
      4031,
      4032,
      4041,
      4042,
      4051,
      4052,
      4061,
      4062
    },
    Probability = 160
  },
  [3] = {
    GroupID = 3,
    Pets = {
      4013,
      4023,
      4033,
      4043,
      4053,
      4063
    },
    Probability = 40
  },
  [4] = {
    GroupID = 4,
    Pets = {
      4111,
      4112,
      4121,
      4122,
      4131,
      4132,
      4141,
      4142,
      4151,
      4152,
      4161,
      4162
    },
    Probability = 64
  },
  [5] = {
    GroupID = 5,
    Pets = {
      4113,
      4123,
      4133,
      4143,
      4153,
      4163
    },
    Probability = 16
  },
  [6] = {
    GroupID = 6,
    Pets = {
      4071,
      4072,
      4081,
      4082,
      4091,
      4092
    },
    Probability = 16
  },
  [7] = {
    GroupID = 7,
    Pets = {
      4073,
      4083,
      4093
    },
    Probability = 4
  }
})
