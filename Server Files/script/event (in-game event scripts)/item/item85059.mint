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

	// 새도우 크리스탈 지급
	switch(jRandom)
	{
		case(0)		// 일반
		{
			player.DoStript(`additemex(id:85060 rewardview:true)`);
		}
		case(1)			// 고급
		{
			player.DoStript(`additemex(id:85061 rewardview:true)`);
		}
		case(2)			// 최고급
		{
			player.DoStript(`additemex(id:85062 rewardview:true)`);
		}
		default
		{
			player.DoStript(`additemex(id:85062 rewardview:true)`);
		}
	}

	// 의상이나 음식 획득
	int randomSetId = 9;   // 고유 ID.. RandomItemSet.xlsm에 기입한 ID

	SetExperimentData(0, ["event.item.item85059.1"]); // 랜덤셋 자체에 대한 정보. 보상 아이템 카테고리별 갯수
	                                                 // 앞부터 희귀 레어 (누적 확률 0.5% 이내), 레어 (누적 확률 3~5%), 일반 (누적 확률 20% 이내), 기타로 구분
							 // 때문에 RandomItemSet에 넣을 때 가급적 확률이 낮은 것을 위에 넣어야 이 방식이 의미가 있다.

	SetExperimentData(1, ["event.item.item85059.2"]);    //  각 실험군에서 레어나 일반 아이템이 나오는 가챠폰 사용 횟수. 이 숫자가 의미하는 값은 news:45794.1 참조
	SetExperimentData(2, ["event.item.item85059.3"]);    // 
	SetExperimentData(3, ["event.item.item85059.4"]);
	SetExperimentData(4, ["event.item.item85059.5"]);
	SetExperimentData(5, ["event.item.item85059.6"]);

	int group = GetExperimentGroup(player);
	
	int itemIndex = GetItemIndexFromExperimentRandomSet(player, randomSetId, group);
	
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);


	bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
	bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
	bool announce_friendly = IsRandomItemNeedToAnnounceFriend(randomSetId, itemIndex);
	
	item newItem;
	newItem = player.AddItemEx(itemString, true);

	if (!newItem.IsNull())
	{
		string ItemName = newItem.GetFullLocalName();
		
		if (announce)  // 동일 채널 어나운스
		{
			Announce(2, charName + ["event.item.item85059.7"]+ ItemName + ["event.item.item85059.8"]);	
		}
		
		if (announce_all)    // 전 서버 어나운스
		{
			AnnounceAllChannel(2, charName + ["event.item.item85059.9"]+ ItemName + ["event.item.item85059.10"]);	
		}

		if (announce_friendly )  // 지인 어나운스
		{
			AnnounceFriend(2, player, charName + ["event.item.item85059.11"]+ ItemName + ["event.item.item85059.12"]);				
		}
	}
}
