local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Channel", {
  [1] = {
    ChannelType = 1,
    Des = "UI_Channel_Notice_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Recruit",
    IsNotice = false,
    JoinOption = 1,
    MessageCD = 3,
    MessageMax = 100,
    Name = "UI_Channel_Name_1",
    PlayerMax = 3000,
    Remark = "\231\187\132\233\152\159\233\162\145\233\129\147",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_Chat_ChannelRecruit_B"
  },
  [2] = {
    ChannelType = 2,
    Des = "UI_Channel_Notice_2",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Question",
    IsNotice = false,
    JoinOption = 1,
    MessageCD = 3,
    MessageMax = 100,
    Name = "UI_Channel_Name_2",
    PlayerMax = 3000,
    Remark = "\231\150\145\233\154\190\232\167\163\231\173\148\233\162\145\233\129\147",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Question_B"
  },
  [3] = {
    ChannelType = 3,
    Des = "UI_Channel_Notice_4",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Team",
    IsNotice = true,
    JoinOption = 0,
    MessageCD = 0,
    MessageMax = 100,
    Name = "UI_Channel_Name_4",
    PlayerMax = 4,
    Remark = "\229\176\143\233\152\159\233\162\145\233\129\147",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_Chat_ChannelTeam_B"
  },
  [4] = {
    ChannelType = 4,
    Des = "UI_Channel_Notice_5",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Friend",
    IsNotice = true,
    JoinOption = 1,
    MessageCD = 0,
    MessageMax = 50,
    Name = "UI_Channel_Name_5",
    PlayerMax = 2,
    Remark = "\229\165\189\229\143\139\233\162\145\233\129\147",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_Chat_ChannelFriend_B"
  },
  [5] = {
    ChannelType = 5,
    Des = "UI_Channel_Notice_6",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Area",
    IsNotice = false,
    JoinOption = 1,
    MessageCD = 3,
    MessageMax = 100,
    Name = "UI_Channel_Name_6",
    PlayerMax = 3000,
    Remark = "\229\140\186\229\159\159\232\129\148\230\156\186",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_ChatChannel_Area_B"
  },
  [6] = {
    ChannelType = 6,
    Des = "UI_Channel_Notice_5",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_Chatchannel_Result",
    IsNotice = true,
    JoinOption = 1,
    MessageCD = 0,
    MessageMax = 100,
    Name = "UI_Channel_Name_7",
    PlayerMax = 4,
    Remark = "\228\184\180\230\151\182\229\176\143\233\152\159\233\162\145\233\129\147",
    SIcon = "/Game/UI/Texture/Dynamic/Atlas/Chat/T_Chatchannel_Result_B"
  }
})
