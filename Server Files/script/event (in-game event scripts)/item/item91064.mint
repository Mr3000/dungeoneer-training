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
	// 미국 무기 가챠폰 (2010.11.08 판매)
	int itemID = cItem.GetClassId();
	string charName = player.GetDisplayName();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	string DefItemString;
	int appraise_explore_exp;
	int appraise_gold;

	// 의상이나 음식 획득
	int randomSetId = 1042;   // 고유 ID.. RandomItemSet.xlsm에 기입
	int itemIndex = GetItemIndexFromRandomSet(randomSetId);
	
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
	bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
	bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
	
	item newItem;
	newItem = player.AddItemEx(itemString, true);

	int jRandom = Random(3);		
	if (!player.IsRiding())
	{
		switch(jRandom)
		// 가챠폰 까는 모션 출력
		{
			case(0)
			{
				player.SetMotionType(14, 15, false); // mcStand, motionStandFriendly01, not loop
			}
			case(1)
			{
				player.SetMotionType(14, 16, false); // mcStand, motionStandFriendly01, not loop
			}
			case(2)
			{
				player.SetMotionType(14, 17, false); // mcStand, motionStandFriendly01, not loop
			}
		}
	}

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
