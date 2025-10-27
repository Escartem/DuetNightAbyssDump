local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ExamineCDNWeight", {
  ["http://pan01-1-examine-eo.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-examine-eo.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 80
  },
  ["http://pan01-1-examine-huawei.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-examine-huawei.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 30
  },
  ["http://pan01-1-examine-huoshan.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-examine-huoshan.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 25
  },
  ["http://pan01-1-examine.shyxhy.com//Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-examine.shyxhy.com//Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 100
  },
  ["http://pan01-2-examine-aws.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-2-examine-aws.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 15
  },
  ["http://pan01-2-examine-eo.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-2-examine-eo.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 50
  },
  ["http://pan01-2-examine-huoshan.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-2-examine-huoshan.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 20
  },
  ["http://pan01-2-examine.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-2-examine.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 50
  }
})
