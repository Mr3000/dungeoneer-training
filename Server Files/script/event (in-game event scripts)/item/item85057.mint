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
	int itemID = cItem.GetClassId();
	string charName = player.GetDisplayName();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;

	int jRandom = Random(3);		// 새도우 크리스탈 (100% 획득)
	int kRandom = Random(10);		//염색 앰플 확률의 총합을 적는다
	string DefItemString;
	int appraise_explore_exp;
	int appraise_gold;


	// 새도우 크리스탈: 그림자 미션 보상 (경험치&골드) 증가
	switch(jRandom)
	{
		case(0)	{	DefItemString = `id:85054`;	}		// 새도우 크리스탈
		case(1)	{	DefItemString = `id:85055`;	}		// 고급 새도우 크리스탈
		case(2)	{	DefItemString = `id:85056`;	}		// 최고급 새도우 크리스탈
		default	{	DefItemString = `id:85054`;	}		// 기본: 새도우 크리스탈
	}

	// DebugOut(`유저에게 `+DefItemString+` 를 줌`);
	player.DoStript(`additemex(`+DefItemString+` rewardview:true)`);

	// 염약 획득
	if(kRandom==0)
	{
		// DebugOut(`유저에게 염색 앰플을 줌`);
		player.DoStript(`additemex(id:63024 rewardview:true)`);
	}

	// 의상이나 음식 획득
	int randomSetId = 8;   // 고유 ID, RandomItemSet.xlsm에 기입
	int itemIndex = GetItemIndexFromRandomSet(randomSetId);
	
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
	bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
	bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
	
	item newItem;
	newItem = player.AddItemEx(itemString, true);

	if (!newItem.IsNull())
	{
		string ItemName = newItem.GetFullLocalName();
		
		if (announce)
		{
			Announce(2, charName + ["event.item.item85057.1"]+ ItemName + ["event.item.item85057.2"]);	
		}
		
		if (announce_all)
		{
			AnnounceAllChannel(2, charName + ["event.item.item85057.3"]+ ItemName + ["event.item.item85057.4"]);	
		}
	}
}
