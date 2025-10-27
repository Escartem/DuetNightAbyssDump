local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeRoomType", {
  [1] = {
    DeliveryUnitId = 60001,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room01.T_Rouge_Room01",
    EnableAwardDelay = 1,
    FailText = "RougeLike_Room_B_Fail",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room01.T_Rouge_Room01",
    IsShowBattlePanel = 1,
    Name = "RougeLike_RoomType_Name_1",
    RoomTypeId = 1,
    SuccessText = "RougeLike_Room_B_Success"
  },
  [2] = {
    DeliveryUnitId = 60002,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room04.T_Rouge_Room04",
    EnableAwardDelay = 1,
    FailText = "RougeLike_Room_EB_Fail",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room04.T_Rouge_Room04",
    IsShowBattlePanel = 1,
    Name = "RougeLike_RoomType_Name_2",
    RoomTypeId = 2,
    SuccessText = "RougeLike_Room_EB_Success"
  },
  [3] = {
    DeliveryUnitId = 60003,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingRoom_Event.T_Rouge_BlessingRoom_Event",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingRoom_Event.T_Rouge_BlessingRoom_Event",
    Name = "RougeLike_RoomType_Name_3",
    RoomTypeId = 3
  },
  [4] = {
    DeliveryUnitId = 60004,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingRoom_Shop.T_Rouge_BlessingRoom_Shop",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingRoom_Shop.T_Rouge_BlessingRoom_Shop",
    Name = "RougeLike_RoomType_Name_4",
    RoomTypeId = 4
  },
  [5] = {
    DeliveryUnitId = 60005,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room03.T_Rouge_Room03",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room03.T_Rouge_Room03",
    Name = "RougeLike_RoomType_Name_5",
    RoomTypeId = 5
  },
  [6] = {
    DeliveryUnitId = 60010,
    ESCIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room01.T_Rouge_Room01",
    EnableAwardDelay = 1,
    FailText = "RougeLike_Room_B_Fail",
    Icon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Room01.T_Rouge_Room01",
    IsShowBattlePanel = 1,
    Name = "RougeLike_RoomType_Name_6",
    RoomTypeId = 6,
    SuccessText = "RougeLike_Room_B_Success"
  }
})
