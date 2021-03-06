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
	int jRandom = Random(3);		//유물 확률의 총합을 적는다
	int kRandom = Random(10);	//염색 앰플 확률의 총합을 적는다
	string DefItemString;
	int appraise_explore_exp;
	int appraise_gold;


	// 유물 획득
	switch(jRandom)
	{
		case(0)		// 코끼리
		{
			appraise_explore_exp = 8000 + Random(2000);		// 평균 9000
			DefItemString = `id:85048 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
		}
		case(1)			// 해시계
		{
			appraise_explore_exp = 10000 + Random(2000);		// 평균 11000
			DefItemString = `id:85050 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
		}
		case(2)			// 드래곤
		{
			appraise_explore_exp = 12000 + Random(2000);		// 평균 13000
			DefItemString = `id:85049 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
		}
		default
		{
			DefItemString = `id:85048 quality:99 appraise_gold:3000 appraise_explore_exp:12000`;
		}
	}

	DebugOut(`유저에게 `+DefItemString+` 를 줌`);
	player.DoStript(`additemex(`+DefItemString+` rewardview:true)`);

	// 염약 획득
	if(kRandom==0)
	{
		DebugOut(`유저에게 염색 앰플을 줌`);
		player.DoStript(`additemex(id:63024 rewardview:true)`);
	}

	// 의상이나 음식 획득
	int randomSetId = 7;   // 고유 ID.. RandomItemSet.xlsm에 기입
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
			Announce(2, charName + ["event.item.item85053.1"]+ ItemName + ["event.item.item85053.2"]);	
		}
		
		if (announce_all)
		{
			AnnounceAllChannel(2, charName + ["event.item.item85053.3"]+ ItemName + ["event.item.item85053.4"]);	
		}
	}
}
