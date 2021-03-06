////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//2NE1 아이템
	int itemID = cItem.GetClassId();
	string charName = player.GetDisplayName();
	bool bLivingGachaphonGived2 = false;	//A그룹
	bool bLivingGachaphonGived = false;	//B그룹
	{
		int randomSetId = 1038;   // 고유 ID, RandomItemSet.xlsm에 기입
		int itemIndex = GetItemIndexFromRandomSet(randomSetId);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		bool announce_friendly = IsRandomItemNeedToAnnounceFriend(randomSetId, itemIndex);

		item newItem;
		newItem = player.AddItemEx(itemString, true);

		if (!newItem.IsNull())
		{
			string ItemName = newItem.GetFullLocalName();
			
			if (announce)
			{
				Announce(2, charName + ["event.item.item91252.1"]+ ItemName + ["event.item.item91252.2"]);	
			}
			
			if (announce_all)
			{
				AnnounceAllChannel(2, charName + ["event.item.item91252.3"]+ ItemName + ["event.item.item91252.4"]);	
			}
			if (announce_friendly)  // 지인 어나운스
			{
				AnnounceFriend(2, player, charName + ["event.item.item91252.5"]+ ItemName + ["event.item.item91252.6"]);				
			}
			bLivingGachaphonGived2 = true;
		}
	}
		// 인게임 리스트
	{
		int randomSetId = 1039;   // 고유 ID, RandomItemSet.xlsm에 기입
		int itemIndex = GetItemIndexFromRandomSet(randomSetId);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		bool announce_friendly = IsRandomItemNeedToAnnounceFriend(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);

		if (!newItem.IsNull())
		{
			string ItemName = newItem.GetFullLocalName();
			
			if (announce)
			{
				Announce(2, charName + ["event.item.item91252.7"]+ ItemName + ["event.item.item91252.8"]);	
			}
			
			if (announce_all)
			{
				AnnounceAllChannel(2, charName + ["event.item.item91252.9"]+ ItemName + ["event.item.item91252.10"]);	
			}
			if (announce_friendly)  // 지인 어나운스
			{
				AnnounceFriend(2, player, charName + ["event.item.item91252.11"]+ ItemName + ["event.item.item91252.12"]);				
			}
			bLivingGachaphonGived = true;
		}
	}
		// 캐시 가차폰을 못받았다.
	if (!bLivingGachaphonGived2)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}