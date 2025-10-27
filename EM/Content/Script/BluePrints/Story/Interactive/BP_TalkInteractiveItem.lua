local BP_TalkInteractiveItem = Class({
  "BluePrints.Item.SceneItemBase"
})

function BP_TalkInteractiveItem:ReceiveBeginPlay()
  BP_TalkInteractiveItem.Super.ReceiveBeginPlay(self)
  self:SetGuideInfo()
  self:SetInteractiveInfo()
end

function BP_TalkInteractiveItem:AuthorityInitInfo(Info)
  BP_TalkInteractiveItem.Super.AuthorityInitInfo(self, Info)
  if Info.Creator then
    self.TalkTriggerId = Info.Creator.TalkTriggerId
    self.InteractiveId = Info.Creator.TalkInteractiveId
  end
  if DataMgr.CommonUIConfirm[self.InteractiveId] then
    local Data = DataMgr.CommonUIConfirm[self.InteractiveId]
    self.InteractiveDistance = Data.InteractiveRadius
    self.PlayerFaceAngle = Data.PlayerFaceAngle
    self.TalkItemFaceAngle = Data.InteractiveAngle
    self.IconPath = Data.Icon
  end
  self:SetGuideInfo()
  self:SetInteractiveInfo()
end

function BP_TalkInteractiveItem:CreateRegionData()
  self.RegionData = {
    TalkTriggerId = self.TalkTriggerId,
    InteractiveId = self.InteractiveId
  }
end

function BP_TalkInteractiveItem:SetGuideInfo()
  if IsValid(self.GuideIconComponent) and self.InteractiveId > 0 and self.TalkTriggerId > 0 then
    local ActivePlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local GuideIconPath = UE4.UKismetSystemLibrary.Conv_SoftClassReferenceToString(self.IconPath)
    self.GuideIconComponent:InitGuide(self, nil, ActivePlayer, GuideIconPath, UE4.FVector2D(0.45, 0.45), nil, "TalkMechanism", "Guide", nil, self.TalkTriggerId)
    self.GuideIconComponent:InitAccessibility()
    self.GuideIconComponent:SetWidgetHiddenByTag(true, "TalkMechanism")
  end
end

function BP_TalkInteractiveItem:SetInteractiveInfo()
  if IsValid(self.TalkItemInteractiveComponent) and self.InteractiveId > 0 and self.TalkTriggerId > 0 then
    local Info = {}
    Info.InteractiveId = self.InteractiveId
    Info.InteractiveDistance = self.InteractiveDistance
    Info.TalkItemFaceAngle = self.TalkItemFaceAngle
    Info.PlayerFaceAngle = self.PlayerFaceAngle
    
    function Info.StartInteractiveCallback(PlayerActor)
      local TalkContext = GWorld.GameInstance:GetTalkContext()
      TalkContext:RegisterInteractiveActor(self)
      TalkContext:StartTalk(self.TalkTriggerId, nil, nil, PlayerActor, self, {
        Func = function()
          TalkContext:UnregisterInteractiveActor()
          if IsValid(self.GuideIconComponent) then
            self.GuideIconComponent:SetAccessibility(true)
          end
        end,
        Obj = self
      })
    end
    
    self.TalkItemInteractiveComponent:SetInteractiveInfo(Info)
  end
end

function BP_TalkInteractiveItem:HandleOnGuideVisibilityChanged(bVisible)
  self.GuideIconComponent:SetWidgetHiddenByTag(not bVisible, "TalkMechanism")
end

return BP_TalkInteractiveItem
