local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DateFormat", {
  Date_MD = {
    FormatCN = "%m\230\156\136%d\230\151\165",
    FormatEN = "%B %e",
    FormatID = "Date_MD",
    FormatJP = "%m\230\156\136%d\230\151\165",
    FormatKR = "%m\236\155\148%d\236\157\188"
  },
  Date_MD_Raw = {
    FormatCN = "%m-%d",
    FormatEN = "%d-%m",
    FormatID = "Date_MD_Raw",
    FormatJP = "%m-%d",
    FormatKR = "%m-%d"
  },
  Date_YMD = {
    FormatCN = "%Y\229\185\180%m\230\156\136%d\230\151\165",
    FormatEN = "%B %e, %Y",
    FormatID = "Date_YMD",
    FormatJP = "%Y\229\185\180%m\230\156\136%d\230\151\165",
    FormatKR = "%Y\235\133\132%m\236\155\148%d\236\157\188"
  },
  Date_YMD_Raw = {
    FormatCN = "%y-%m-%d",
    FormatEN = "%d-%m-%y",
    FormatID = "Date_YMD_Raw",
    FormatJP = "%y-%m-%d",
    FormatKR = "%y-%m-%d"
  }
})
