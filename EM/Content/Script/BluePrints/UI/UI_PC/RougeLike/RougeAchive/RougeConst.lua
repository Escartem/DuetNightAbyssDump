local RougeConst = {}
RougeConst.ArchiveType = {
  Treasure = 100001,
  Blessing = 100002,
  Event = 100003,
  Story = 100004
}
RougeConst.RLArchiveType = {Event = 1, Story = 2}
RougeConst.RougeReddotTreeNode = {
  [RougeConst.ArchiveType.Treasure] = "RougeArchiveTreasure",
  [RougeConst.ArchiveType.Blessing] = "RougeArchiveBlessing",
  [RougeConst.ArchiveType.Event] = "RougeArchiveEvent",
  [RougeConst.ArchiveType.Story] = "RougeArchiveStory"
}
RougeConst.RoomType = {
  Battle = 1,
  EliteBattle = 2,
  Event = 3,
  Shop = 4,
  Boss = 5
}
return RougeConst
