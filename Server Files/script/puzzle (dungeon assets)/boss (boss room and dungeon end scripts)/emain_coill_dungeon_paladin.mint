////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           이멘마하: 코일던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 
// 방배치
//
//      방번호 0 : 이 트랩이 설치된 방을 의미한다
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server string GetMoneyBagDesc(
	int _partyCount,
	int& _moneyBagCount)
// :
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc;

	//기본보상값에 Creator 인원에 따라 곱해지는 비율
	float rewardRate = 0.16;	// 문제가 생겼을 때 가장 적은 비율로 주도록 -_-
	switch (_partyCount)
	{
	case (1)	{	rewardRate = 0.3;	}
	case (2)	{	rewardRate = 0.2;	}
	case (3)	{	rewardRate = 0.17;	}
	case (4)	{	rewardRate = 0.165;	}
	case (5)	{	rewardRate = 0.16;	}
	case (6)	{	rewardRate = 0.155;	}
	case (7)	{	rewardRate = 0.15;	}
	case (8)	{	rewardRate = 0.14;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 2400;
	int OriginalRewardMax = 5000;
	int RewardMin = OriginalRewardMin * rewardRate;
	int RewardMax = OriginalRewardMax * rewardRate;

	// 돈주머니 수를 센다
	_moneyBagCount = RewardMax / 1000;
	if (RewardMax % 1000 != 0)
	{
		// eg. 5500원이면 돈 덩어리는 6개
		++_moneyBagCount;
	}

	if (_moneyBagCount != 0)
	{
		RewardMin = RewardMin / _moneyBagCount;
		RewardMax = RewardMax / _moneyBagCount;

		itemDesc = `id:2000 count:` + ToString(RewardMin) + `~` + ToString(RewardMax);
	}
	else
	{
		// _moneyBagCount가 0이 되면 진짜로 0원만 주겠다는 건데,
		// 예외 상황
	}

	return itemDesc;
}
////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);
	//  확률의 총합은 100이라고 가정. 늘리고 싶음 늘림되긴함..iRandom값이 먼저 정해지는게 포인트다..
	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
			//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
			case (0) 
			{
				itemDesc = `id:62004 count:1~2`;	//마법가루
				iCumRate += 17; //이 아이템이 나올 확률
			}
			case (1)
			{
				itemDesc = `id:51102 count:1~2`;	//마나허브
				iCumRate += 17; 
			}
			case (2)	
			{
				itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
				iCumRate += 17;
			}
			case (3)
			{
				itemDesc = `id:51008 count:1~2`;	//마나 50 포션
				iCumRate += 17;
			}
			case (4)
			{
				itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
				iCumRate += 17;
			}
		        //여기까지 총 85%
			case (5)
			{
				itemDesc = `id:71049 count:2~5`;	//뱀 마족 스크롤(220G)
				iCumRate +=5;  
			}
			case (6)
			{
				itemDesc = `id:71018 count:3~5`;	//검은 거미 마족 스크롤(190G)
				iCumRate += 5;  
			}
			case (7)
			{
				itemDesc = `id:71018 count:3~5`;	//붉은 거미 마족 스크롤(300G)
				iCumRate += 1;  
			}
			case (8)
			{
				itemDesc = `id:71052 count:5`;	//자칼 마족 (210G)
				iCumRate += 4;  
			}
			
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
			return itemDesc;
		}
		
		++i;
	}
	return ``; //아이템Z:\mabinogi\dev\release\asset\data\script\Puzzle\boss\TirCho_Alby_Middle4_Dungeon.mint이 안나왔다... '나오던거' 안나오겐 하지말자. 욕먹음. -ㅁ-
} 
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _this.AllocateMonster(
	0, 
	`boss`,
	`center`,                           // 배치 템플릿 이름 
	`single(NightmareHumanoid:1)`);

	_this.Set(`state1`,`0`);

//바뀐 보상체계
//------------------------------------------------------------------------------

	dungeon _dungeon = _this.GetDungeon();

	//던전 생성한 사람중, 보스방 문을 여는 순간 접속중인 사람의 수
	object_list cMemberList = _dungeon.GetCreatorList();
	int cMemberNum = cMemberList.GetSize();

	if (cMemberNum  > 8)
	{
		//Creator가 8명 이상인 비정상 상황에서는 8명으로 맞춤
		cMemberNum = 8;
	}
	else
	if (cMemberNum < 1)
	{
		//Creator가 0명 이하인 비정상 상황
		cMemberNum = 1;
	}

	puzzle_chest TreasureChest1;
	puzzle_chest TreasureChest2;
	puzzle_chest TreasureChest3;
	puzzle_chest TreasureChest4;
	puzzle_chest TreasureChest5;
	puzzle_chest TreasureChest6;
	puzzle_chest TreasureChest7;
	puzzle_chest TreasureChest8;

	int i, j;
	int MoneybagNum;
	string moneyDesc = GetMoneyBagDesc(cMemberNum, MoneybagNum);

	//사람수에 따라 돈보상 넣기
	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest1 = _this.NewLockedChest(1, `8corner@*!`, `treasure1`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest1.AddItem(moneyDesc);
				}
			}
			case (2)
			{
				TreasureChest2 = _this.NewLockedChest(1, `8corner@*!`, `treasure2`);
				
				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest2.AddItem(moneyDesc);
				}
			}
			case (3)
			{
				TreasureChest3 = _this.NewLockedChest(1, `8corner@*!`, `treasure3`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest3.AddItem(moneyDesc);
				}
			}
			case (4)
			{
				TreasureChest4 = _this.NewLockedChest(1, `8corner@*!`, `treasure4`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest4.AddItem(moneyDesc);
				}
			}
			case (5)
			{
				TreasureChest5 = _this.NewLockedChest(1, `8corner@*!`, `treasure5`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest5.AddItem(moneyDesc);
				}
			}
			case (6)
			{
				TreasureChest6 = _this.NewLockedChest(1, `8corner@*!`, `treasure6`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest6.AddItem(moneyDesc);
				}
			}
			case (7)
			{
				TreasureChest7 = _this.NewLockedChest(1, `8corner@*!`, `treasure7`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest7.AddItem(moneyDesc);
				}
			}
			case (8)
			{
				TreasureChest8 = _this.NewLockedChest(1, `8corner@*!`, `treasure8`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest8.AddItem(moneyDesc);
				}
			}
		}
	}

	/*
	//인챈트 아이템
	//인챈트 옵션 랜담선택
	int iRandom2 = Random(3);
	int prefixid;
	int suffixid;
	switch (iRandom2) 
	{
		case (0)     prefixid = 20802 ;
		case (1)     prefixid = 20601 ;
		case (2)     prefixid = 20202 ;
	}
	
	iRandom2 = Random(3);
	switch (iRandom2) 
	{
		case (0)     suffixid = 30805 ;
		case (1)     suffixid = 30307 ;
		case (2)     suffixid = 30503 ;
	}
	string EnchantitemDesc = `id:18006 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid);
	TreasureChest1.AddItem(EnchantitemDesc);	
	*/


	//아이템보상 넣기
	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest1.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest1, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (2)
			{
				TreasureChest2.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest2, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (3)
			{
				TreasureChest3.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest3, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (4)
			{
				TreasureChest4.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest4, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (5)
			{
				TreasureChest5.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest5, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (6)
			{
				TreasureChest6.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest6, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (7)
			{
				TreasureChest7.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest7, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
			case (8)
			{
				TreasureChest8.AddItem(GetItemRewardDesc());
				// 보상 아이템 넣기
				AddEventReward(_dungeon.GetName(), TreasureChest8, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
			}
		}
	}

	character cChar;

	//코인 이벤트. 2005년 2월에 삭제한다.
	/*
	if (GetYear() == 2004 && (GetDate() >=1220 || GetDate() <=125))
	{
		for (i = 1; i <= cMemberNum; ++i)
		{
			switch (i) {
				case (1)
				{
					TreasureChest1.AddItem(`id:52033 count:3~8`);
				}
				case (2)
				{
					TreasureChest2.AddItem(`id:52033 count:3~8`);
				}
				case (3)
				{
					TreasureChest3.AddItem(`id:52033 count:3~8`);
				}
				case (4)
				{
					TreasureChest4.AddItem(`id:52033 count:3~8`);
				}
				case (5)
				{
					TreasureChest5.AddItem(`id:52033 count:3~8`);
				}
				case (6)
				{
					TreasureChest6.AddItem(`id:52033 count:3~8`);
				}
				case (7)
				{
					TreasureChest7.AddItem(`id:52033 count:3~8`);
				}
				case (8)
				{
					TreasureChest8.AddItem(`id:52033 count:3~8`);
				}
			}
		}
	}
	*/

}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `boss`.LowerCase() && _remain == 0)
	{

		_this.Set(`state1`,`1`);
	}

	if (_this.Get(`state1`)  == `1`)
	{

		dungeon _dungeon = _this.GetDungeon();

		//보스룸 클리어시 접속중인 Creator 뽑기
		object_list cMemberList = _dungeon.GetCreatorList();
		int cMemberNum = cMemberList.GetSize();

		//멤버수가 틀리면 보정한다.
		if (cMemberNum  > 8) 
		{
			cMemberNum = 8;
		}
		else
		if (cMemberNum < 0)
		{
			cMemberNum = 0;
		}

		character	cChar;
		int		i;

		//접속중인 Creator에게 열쇠를 넣어준다
		for (i = 0; i < cMemberNum;  i++)
		{
			cChar = (character)cMemberList.GetValue(i);

			if (cChar.IsValid())
			{
				//cChar.DoStript(`additemex(id:70028 lock:chest)`);
				//윗줄과 같은 명령이지만, 머리위에 받은 아이템을 보여준다
				//브로드캐스팅은 안함
				cChar.AddItemWithEffect(`id:70028 lock:chest`);
			}
		}


		// 종료시킨다
		_this.Complete();
	}
}