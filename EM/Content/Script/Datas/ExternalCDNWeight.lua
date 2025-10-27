local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ExternalCDNWeight", {
  ["http://pan01-1-eo.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-eo.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 40
  },
  ["http://pan01-1-hs.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-1-hs.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 50
  },
  ["http://pan01-cdn-ali-jp.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-ali-jp.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 50
  },
  ["http://pan01-cdn-aws-jp.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-aws-jp.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 40
  },
  ["http://pan01-cdn-dna-ali.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-dna-ali.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 50
  },
  ["http://pan01-cdn-dna-huawei.shyxhy.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-dna-huawei.shyxhy.com/Patches/FinalPatch/",
    IsGlobal = false,
    Weight = 15
  },
  ["http://pan01-cdn-eo-jp.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-eo-jp.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 50
  },
  ["http://pan01-cdn-hs-jp.dna-panstudio.com/Patches/FinalPatch/"] = {
    CDNPath = "http://pan01-cdn-hs-jp.dna-panstudio.com/Patches/FinalPatch/",
    IsGlobal = true,
    Weight = 40
  }
})
