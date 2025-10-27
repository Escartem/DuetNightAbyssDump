local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BehaviorMontage", {
  [115001] = {
    MontageGroupId = 115,
    MontageId = 115001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_Montage.JT_Pizhuo_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 115101
  },
  [115002] = {
    MontageGroupId = 115,
    MontageId = 115002,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle02_Montage.JT_Pizhuo_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 115100
  },
  [115100] = {
    MontageGroupId = 115,
    MontageId = 115100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialAlert_Montage.JT_Pizhuo_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [115101] = {
    MontageGroupId = 115,
    MontageId = 115101,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_End_Montage.JT_Pizhuo_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [6001001] = {
    MontageGroupId = 6001,
    MontageId = 6001001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/SpecialIdle/GR_Jichong_SpecialIdle01_Montage.GR_Jichong_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6001100
  },
  [6001002] = {
    MontageGroupId = 6001,
    MontageId = 6001002,
    MontagePath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/SpecialIdle/GR_Jichong_SpecialIdle02_Montage.GR_Jichong_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6001100
  },
  [6001100] = {
    MontageGroupId = 6001,
    MontageId = 6001100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Jichong/Animation/Montage/SpecialIdle/GR_Jichong_SpecialAlert_Montage.GR_Jichong_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6002001] = {
    MontageGroupId = 6002,
    MontageId = 6002001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/SpecialIdle/GR_Youji_SpecialIdle01_Montage.GR_Youji_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6002100
  },
  [6002100] = {
    MontageGroupId = 6002,
    MontageId = 6002100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Youji/Animation/Montage/SpecialIdle/GR_Youji_SpecialAlert_Montage.GR_Youji_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6003001] = {
    MontageGroupId = 6003,
    MontageId = 6003001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/SpecialIdle/GR_Piaofu_SpecialIdle01_Montage.GR_Piaofu_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6003101
  },
  [6003002] = {
    MontageGroupId = 6003,
    MontageId = 6003002,
    MontagePath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/SpecialIdle/GR_Piaofu_SpecialIdle02_Montage.GR_Piaofu_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior"
  },
  [6003100] = {
    MontageGroupId = 6003,
    MontageId = 6003100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/SpecialIdle/GR_Piaofu_SpecialAlert_Montage.GR_Piaofu_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6003101] = {
    MontageGroupId = 6003,
    MontageId = 6003101,
    MontagePath = "/Game/Asset/Char/Monster/GR_Piaofu/Animation/Montage/SpecialIdle/GR_Piaofu_SpecialIdle01_End_Montage.GR_Piaofu_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [6004001] = {
    MontageGroupId = 6004,
    MontageId = 6004001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/SpecialIdle/GR_Baotu_SpecialIdle01_Montage.GR_Baotu_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6004101
  },
  [6004100] = {
    MontageGroupId = 6004,
    MontageId = 6004100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/SpecialIdle/GR_Baotu_SpecialAlert_Montage.GR_Baotu_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6004101] = {
    MontageGroupId = 6004,
    MontageId = 6004101,
    MontagePath = "/Game/Asset/Char/Monster/GR_Baotu/Animation/Montage/SpecialIdle/GR_Baotu_SpecialIdle01_End_Montage.GR_Baotu_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [6005001] = {
    MontageGroupId = 6005,
    MontageId = 6005001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Locomotion/GR_Longcao_SpecialIdle01_Montage.GR_Longcao_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6005100
  },
  [6005100] = {
    MontageGroupId = 6005,
    MontageId = 6005100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Longcao/Animation/Montage/Locomotion/GR_Longcao_SpecialAlert_Montage.GR_Longcao_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6006001] = {
    MontageGroupId = 6006,
    MontageId = 6006001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/SpecialIdle/GR_Banyun_SpecialIdle01_Montage.GR_Banyun_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6006100
  },
  [6006100] = {
    MontageGroupId = 6006,
    MontageId = 6006100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Banyun/Animation/Montage/SpecialIdle/GR_Banyun_SpecialAlert_Montage.GR_Banyun_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6007001] = {
    MontageGroupId = 6007,
    MontageId = 6007001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/SpecialIdle/GR_Zhuoxin_SpecialIdle01_Montage.GR_Zhuoxin_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6007100
  },
  [6007100] = {
    MontageGroupId = 6007,
    MontageId = 6007100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Zhuoxin/Animation/Montage/SpecialIdle/GR_Zhuoxin_SpecialAlert_Montage.GR_Zhuoxin_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6015001] = {
    MontageGroupId = 6015,
    MontageId = 6015001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/SpecialIdle/GR_Fangjin_SpecialIdle01_Montage.GR_Fangjin_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6015100
  },
  [6015100] = {
    MontageGroupId = 6015,
    MontageId = 6015100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Fangjin/Animation/Montage/SpecialIdle/GR_Fangjin_SpecialAlert_Montage.GR_Fangjin_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6016001] = {
    MontageGroupId = 6016,
    MontageId = 6016001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/SpecialIdle/GR_Eshi_SpecialIdle01_Montage.GR_Eshi_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6016100
  },
  [6016100] = {
    MontageGroupId = 6016,
    MontageId = 6016100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Eshi/Animation/Montage/SpecialIdle/GR_Eshi_SpecialAlert_Montage.GR_Eshi_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [6017001] = {
    MontageGroupId = 6017,
    MontageId = 6017001,
    MontagePath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/SpecialIdle/GR_Kuirui_SpecialIdle01_Montage.GR_Kuirui_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6017100
  },
  [6017002] = {
    MontageGroupId = 6017,
    MontageId = 6017002,
    MontagePath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/SpecialIdle/GR_Kuirui_SpecialIdle02_Montage.GR_Kuirui_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 6017100
  },
  [6017100] = {
    MontageGroupId = 6017,
    MontageId = 6017100,
    MontagePath = "/Game/Asset/Char/Monster/GR_Kuirui/Animation/Montage/SpecialIdle/GR_Kuirui_SpecialAlert_Montage.GR_Kuirui_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7001001] = {
    MontageGroupId = 7001,
    MontageId = 7001001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/SpecialIdle/JT_Juji_SpecialIdle01_Montage.JT_Juji_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7001100
  },
  [7001100] = {
    MontageGroupId = 7001,
    MontageId = 7001100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Juji/Animation/Montage/SpecialIdle/JT_Juji_SpecialAlert_Montage.JT_Juji_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7002001] = {
    MontageGroupId = 7002,
    MontageId = 7002001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_Montage.JT_Pizhuo_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7002101
  },
  [7002002] = {
    MontageGroupId = 7002,
    MontageId = 7002002,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle02_Montage.JT_Pizhuo_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7002100
  },
  [7002100] = {
    MontageGroupId = 7002,
    MontageId = 7002100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialAlert_Montage.JT_Pizhuo_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7002101] = {
    MontageGroupId = 7002,
    MontageId = 7002101,
    MontagePath = "/Game/Asset/Char/Monster/JT_Pizhuo/Animation/Montage/SpecialIdle/JT_Pizhuo_SpecialIdle01_End_Montage.JT_Pizhuo_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [7003001] = {
    MontageGroupId = 7003,
    MontageId = 7003001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/SpecialIdle/JT_Ranger_SpecialIdle01_Montage.JT_Ranger_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7003101
  },
  [7003100] = {
    MontageGroupId = 7003,
    MontageId = 7003100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/SpecialIdle/JT_Ranger_SpecialAlert_Montage.JT_Ranger_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7003101] = {
    MontageGroupId = 7003,
    MontageId = 7003101,
    MontagePath = "/Game/Asset/Char/Monster/JT_Ranger/Animation/Montage/SpecialIdle/JT_Ranger_SpecialIdle01_End_Montage.JT_Ranger_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [7004001] = {
    MontageGroupId = 7004,
    MontageId = 7004001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/SpecialIdle/JT_Tuji_SpecialIdle01_Montage.JT_Tuji_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7004100
  },
  [7004100] = {
    MontageGroupId = 7004,
    MontageId = 7004100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Tuji/Animation/Montage/SpecialIdle/JT_Tuji_SpecialAlert_Montage.JT_Tuji_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7008001] = {
    MontageGroupId = 7008,
    MontageId = 7008001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/SpecialIdle/JT_Zhihui_SpecialIdle01_Montage.JT_Zhihui_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7008100
  },
  [7008100] = {
    MontageGroupId = 7008,
    MontageId = 7008100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhihui/Animation/Montage/SpecialIdle/JT_Zhihui_SpecialAlert_Montage.JT_Zhihui_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7009001] = {
    MontageGroupId = 7009,
    MontageId = 7009001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/SpecialIdle/JT_Zhiren_SpecialIdle01_Montage.JT_Zhiren_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7009101
  },
  [7009100] = {
    MontageGroupId = 7009,
    MontageId = 7009100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/SpecialIdle/JT_Zhiren_SpecialAlert_Montage.JT_Zhiren_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7009101] = {
    MontageGroupId = 7009,
    MontageId = 7009101,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhiren/Animation/Montage/SpecialIdle/JT_Zhiren_SpecialIdle01_End_Montage.JT_Zhiren_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [7010001] = {
    MontageGroupId = 7010,
    MontageId = 7010001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/SpecialIdle/JT_Zhijian_SpecialIdle01_Montage.JT_Zhijian_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7010100
  },
  [7010100] = {
    MontageGroupId = 7010,
    MontageId = 7010100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Zhijian/Animation/Montage/SpecialIdle/JT_Zhijian_SpecialAlert_Montage.JT_Zhijian_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [7015001] = {
    MontageGroupId = 7015,
    MontageId = 7015001,
    MontagePath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/SpecialIdle/JT_Jingjie_SpecialIdle01_Montage.JT_Jingjie_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 7015100
  },
  [7015100] = {
    MontageGroupId = 7015,
    MontageId = 7015100,
    MontagePath = "/Game/Asset/Char/Monster/JT_Jingjie/Animation/Montage/SpecialIdle/JT_Jingjie_SpecialAlert_Montage.JT_Jingjie_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [8001001] = {
    MontageGroupId = 8001,
    MontageId = 8001001,
    MontagePath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/SpecialIdle/JH_Zhishi_SpecialIdle01_Montage.JH_Zhishi_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 8001101
  },
  [8001100] = {
    MontageGroupId = 8001,
    MontageId = 8001100,
    MontagePath = "/Game/Asset/Char/Monster/JH_Zhishi/Animation/Montage/SpecialIdle/JH_Zhishi_SpecialAlert_Montage.JH_Zhishi_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [8001101] = {
    MontageGroupId = 8001,
    MontageId = 8001101,
    MontagePath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/SpecialIdle/JH_Xianfeng_SpecialIdle01_End_Montage.JH_Xianfeng_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [8002001] = {
    MontageGroupId = 8002,
    MontageId = 8002001,
    MontagePath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/SpecialIdle/JH_Xianfeng_SpecialIdle01_Montage.JH_Xianfeng_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 8002101
  },
  [8002100] = {
    MontageGroupId = 8002,
    MontageId = 8002100,
    MontagePath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/SpecialIdle/JH_Xianfeng_SpecialAlert_Montage.JH_Xianfeng_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [8002101] = {
    MontageGroupId = 8002,
    MontageId = 8002101,
    MontagePath = "/Game/Asset/Char/Monster/JH_Xianfeng/Animation/Montage/SpecialIdle/JH_Xianfeng_SpecialIdle01_End_Montage.JH_Xianfeng_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [8003001] = {
    MontageGroupId = 8003,
    MontageId = 8003001,
    MontagePath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/SpeicalIdle/JH_Shenfu_SpecialIdle01_Montage.JH_Shenfu_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 8003100
  },
  [8003100] = {
    MontageGroupId = 8003,
    MontageId = 8003100,
    MontagePath = "/Game/Asset/Char/Monster/JH_Shenfu/Animation/Montage/SpeicalIdle/JH_Shenfu_SpecialAlert_Montage.JH_Shenfu_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9001001] = {
    MontageGroupId = 9001,
    MontageId = 9001001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/SpecialIdle/SQ_Yinxie_SpecialIdle01_Montage.SQ_Yinxie_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9001100
  },
  [9001100] = {
    MontageGroupId = 9001,
    MontageId = 9001100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Yinxie/Animation/Montage/SpecialIdle/SQ_Yinxie_SpecialAlert_Montage.SQ_Yinxie_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9002001] = {
    MontageGroupId = 9002,
    MontageId = 9002001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/SpecialIdle/SQ_Dufeng_SpecialIdle01_Montage.SQ_Dufeng_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9002100
  },
  [9002100] = {
    MontageGroupId = 9002,
    MontageId = 9002100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Dufeng/Animation/Montage/SpecialIdle/SQ_Dufeng_SpecialAlert_Montage.SQ_Dufeng_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9003001] = {
    MontageGroupId = 9003,
    MontageId = 9003001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/SpecialIdle/SQ_Wanju_SpecialIdle01_Montage.SQ_Wanju_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9003100
  },
  [9003100] = {
    MontageGroupId = 9003,
    MontageId = 9003100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Wanju/Animation/Montage/SpecialIdle/SQ_Wanju_SpecialAlert_Montage.SQ_Wanju_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9005001] = {
    MontageGroupId = 9005,
    MontageId = 9005001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/SpecialIdle/SQ_Baozha_SpecialIdle01_Montage.SQ_Baozha_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9005100
  },
  [9005100] = {
    MontageGroupId = 9005,
    MontageId = 9005100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Baozha/Animation/Montage/SpecialIdle/SQ_Baozha_SpecialAlert_Montage.SQ_Baozha_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9006001] = {
    MontageGroupId = 9006,
    MontageId = 9006001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/SpecialIdle/SQ_Qizha_SpecialIdle01_Montage.SQ_Qizha_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9006100
  },
  [9006100] = {
    MontageGroupId = 9006,
    MontageId = 9006100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Qizha/Animation/Montage/SpecialIdle/SQ_Qizha_SpecialAlert_Montage.SQ_Qizha_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9007001] = {
    MontageGroupId = 9007,
    MontageId = 9007001,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/SpecialIdle/SQ_Niaopao_SpecialIdle01_Montage.SQ_Niaopao_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9007100
  },
  [9007100] = {
    MontageGroupId = 9007,
    MontageId = 9007100,
    MontagePath = "/Game/Asset/Char/Monster/SQ_Niaopao/Animation/Montage/SpecialIdle/SQ_Niaopao_SpecialAlert_Montage.SQ_Niaopao_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9501001] = {
    MontageGroupId = 9501,
    MontageId = 9501001,
    MontagePath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/NE_Villiger_SpecialIdle01_Montage.NE_Villiger_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9501100
  },
  [9501100] = {
    MontageGroupId = 9501,
    MontageId = 9501100,
    MontagePath = "/Game/Asset/Char/Monster/NE_Villiger/Animation/Montage/Combat/Skill/NE_Villiger_SpecialAlert_Montage.NE_Villiger_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [9801001] = {
    MontageGroupId = 9801,
    MontageId = 9801001,
    MontagePath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/SpecialIdle/Mon_Xuelang_SpecialIdle01_Montage.Mon_Xuelang_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9801002
  },
  [9801002] = {
    MontageGroupId = 9801,
    MontageId = 9801002,
    MontagePath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/SpecialIdle/Mon_Xuelang_SpecialIdle01_End_Montage.Mon_Xuelang_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [9801003] = {
    MontageGroupId = 9801,
    MontageId = 9801003,
    MontagePath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/SpecialIdle/Mon_Xuelang_SpecialIdle02_Montage.Mon_Xuelang_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 9801004
  },
  [9801004] = {
    MontageGroupId = 9801,
    MontageId = 9801004,
    MontagePath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/SpecialIdle/Mon_Xuelang_SpecialIdle02_Montage.Mon_Xuelang_SpecialIdle02_Montage",
    MontageType = "EnterAlert"
  },
  [9801100] = {
    MontageGroupId = 9801,
    MontageId = 9801100,
    MontagePath = "/Game/Asset/Char/Monster/Animal01_Xuelang/Animation/Montage/Combat/SpecialIdle/Mon_Xuelang_SpecialAlarm_Montage.Mon_Xuelang_SpecialAlarm_Montage",
    MontageType = "EnterAlert"
  },
  [10001001] = {
    MontageGroupId = 10001,
    MontageId = 10001001,
    MontagePath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/SpecialIdle/HX_Tianshi_SpecialIdle01_Montage.HX_Tianshi_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 10001100
  },
  [10001100] = {
    MontageGroupId = 10001,
    MontageId = 10001100,
    MontagePath = "/Game/Asset/Char/Monster/HX_Tianshi/Animation/Montage/SpecialIdle/HX_Tianshi_SpecialAlert_Montage.HX_Tianshi_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [10002001] = {
    MontageGroupId = 10002,
    MontageId = 10002001,
    MontagePath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/SpecialIdle/HX_Tianwei_SpecialIdle01_Montage.HX_Tianwei_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 10002100
  },
  [10002100] = {
    MontageGroupId = 10002,
    MontageId = 10002100,
    MontagePath = "/Game/Asset/Char/Monster/HX_Tianwei/Animation/Montage/SpecialIdle/HX_Tianwei_SpecialAlert_Montage.HX_Tianwei_SpecialAlert_Montage",
    MontageType = "EnterAlert"
  },
  [10003001] = {
    MontageGroupId = 10003,
    MontageId = 10003001,
    MontagePath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/SpecialIdle/HX_Bian_SpecialIdle01_Montage.HX_Bian_SpecialIdle01_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 10003002
  },
  [10003002] = {
    MontageGroupId = 10003,
    MontageId = 10003002,
    MontagePath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/SpecialIdle/HX_Bian_SpecialIdle01_End_Montage.HX_Bian_SpecialIdle01_End_Montage",
    MontageType = "EnterAlert"
  },
  [10003003] = {
    MontageGroupId = 10003,
    MontageId = 10003003,
    MontagePath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/SpecialIdle/HX_Bian_SpecialIdle02_Montage.HX_Bian_SpecialIdle02_Montage",
    MontageType = "OutBattleBehavior",
    NextMontage = 10003004
  },
  [10003004] = {
    MontageGroupId = 10003,
    MontageId = 10003004,
    MontagePath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/SpecialIdle/HX_Bian_SpecialIdle02_End_Montage.HX_Bian_SpecialIdle02_End_Montage",
    MontageType = "EnterAlert"
  },
  [10003100] = {
    MontageGroupId = 10003,
    MontageId = 10003100,
    MontagePath = "/Game/Asset/Char/Monster/HX_Bian/Animation/Montage/SpecialIdle/HX_Bian_SpecialAlarm_Montage.HX_Bian_SpecialAlarm_Montage",
    MontageType = "EnterAlert"
  }
})
