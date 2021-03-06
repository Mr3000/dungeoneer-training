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

 // 중국 A그룹, B그룹 나눈 스크립트 잠시 보류
{
	// 아머 가챠폰
	int itemID = cItem.GetClassId();

//	string charName = player.GetDisplayName();

	string charName = player.GetProtectiveName();

	bool bCashGachaphonGived = false;	//탐험 유물
	bool bLivingGachaphonGived2 = false;	//A그룹
	bool bLivingGachaphonGived = false;	//B그룹

	bool bLivingGachaphonGivedAmple = false;	//새도우 크리스탈 그룹

	// 유물 세트
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:85063 quality:99 appraise_explore_exp:10000`; iCumRate +=40;} //40% 코끼리 조각상(12레벨)
				case(1){itemString = `id:85065 quality:99 appraise_explore_exp:19000`; iCumRate +=33;} //33% 해시계 유물(14레벨)
				case(2){itemString = `id:85064 quality:99 appraise_explore_exp:25000`; iCumRate +=27;} //27% 드래곤 조각상(15레벨)
				// 여기다 넣으세요의 끝
				default
				{
					bBreak = true;
				}
			}
			if (bBreak)
			{
				break;
			}

			if (iRandom < iCumRate)
			{
				DebugOut(`유저에게 `+itemString+` 를 줌`);
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bCashGachaphonGived = true;
			}
			if (bCashGachaphonGived)
			{
				break;
			}
				++i;
		}
	}

	// 새도우 크리스탈
	/*
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:85060`; iCumRate +=34;} //33.333 새도우 크리스탈
				case(1){itemString = `id:85061`; iCumRate +=33;} //33.333 고급 새도우 크리스탈
				case(2){itemString = `id:85062`; iCumRate +=33;} //33.333 최고급 새도우 크리스탈
				// 여기다 넣으세요의 끝
				default
				{
					bBreak = true;
				}
			}
			if (bBreak)
			{
				break;
			}

			if (iRandom < iCumRate)
			{
				DebugOut(`유저에게 `+itemString+` 를 줌`);
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bLivingGachaphonGivedAmple = true;
			}
			if (bLivingGachaphonGivedAmple)
			{
				break;
			}
				++i;
		}

	//	player.ShowCaption(" "+ToString(iRandom)+" "+ToString(iCumRate), 3000);

	}
	*/

	// 메인 보상
	int randomSetId = 1044;   // 고유 ID, RandomItemSet.xlsm에 기입
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

		// 캐시 가차폰을 못받았다.
	if (!bCashGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}