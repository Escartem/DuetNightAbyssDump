local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GenderToRoleId", {
  [1] = {
    Gender = 1,
    GenderToRoleId = 1,
    RoleId = 111,
    SwitchPlayer = "Player"
  },
  [2] = {
    Gender = 0,
    GenderToRoleId = 2,
    RoleId = 112,
    SwitchPlayer = "Player"
  },
  [3] = {
    Gender = 1,
    GenderToRoleId = 3,
    RoleId = 113,
    SwitchPlayer = "EXPlayer"
  },
  [4] = {
    Gender = 0,
    GenderToRoleId = 4,
    RoleId = 114,
    SwitchPlayer = "EXPlayer"
  }
})
