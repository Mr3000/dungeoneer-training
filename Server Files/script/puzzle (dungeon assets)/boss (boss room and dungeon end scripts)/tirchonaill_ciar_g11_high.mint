////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             티르코네일 : 키아던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                        eias@nexon.co.kr, sheplany@nownuri.net
//			qwerty@nexon.co.kr, edits at 2003. 11. 15
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
// : 돈보상을 줄 양과 돈더미의 수
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc;

	//기본보상값에 Creator 인원에 따라 곱해지는 비율
	float rewardRate = 0.16;	// 문제가 생겼을 때 가장 적은 비율로 주도록 -_-
	switch (_partyCount)
	{
	case (1)	{	rewardRate = 0.16;	}
	case (2)	{	rewardRate = 0.16;	}
	case (3)	{	rewardRate = 0.16;	}
	case (4)	{	rewardRate = 0.16;	}
	case (5)	{	rewardRate = 0.16;	}
	case (6)	{	rewardRate = 0.16;	}
	case (7)	{	rewardRate = 0.16;	}
	case (8)	{	rewardRate = 0.16;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 10200;
	int OriginalRewardMax = 25000;
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
				iCumRate += 10; //이 아이템이 나올 확률
			}
			case (1)
			{
				itemDesc = `id:51102 count:1~2`;	//마나허브
				iCumRate += 10; // 15/100
			}
			case (2)
			{
				itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
				iCumRate += 10;
			}
			case (3)
			{
				itemDesc = `id:51008 count:1~2`;	//마나 50 포션
				iCumRate += 10;
			}
			case (4)
			{
				itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
				iCumRate += 10;
			}
			//여기까지 총 50%
			case (5)
			{
				itemDesc = `id:71049  count:2~4`;	//뱀 마족 스크롤
				iCumRate +=5;
			}
			case (6)
			{
				itemDesc = `id:63123 expire:480`;	//키아 중급 1인
				iCumRate += 10;
			}
			case (7)
			{
				itemDesc = `id:63124 expire:480`;	//키아 중급 2인
				iCumRate += 10;
			}
			case (8)
			{
				itemDesc = `id:63125 expire:480`;	//키아 중급 4인
				iCumRate += 10;
			}
			case (9)
			{
				itemDesc = `id:63136 count:1 expire:360`;	//키아 상급 2인 마족 통행증
				iCumRate += 5;
			}
			case (10)
			{
				itemDesc = `id:63137 count:1 expire:360`;	//키아 상급 3인 마족 통행증
				iCumRate += 5;
			}
			case (11)
			{
				itemDesc = `id:63138 count:1 expire:360`;	//키아 상급 무제한 마족 통행증
				iCumRate += 5;
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


	return ``; //아이템이 안나왔다... '나오던거' 안나오겐 하지말자. 욕먹음. -ㅁ-
}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
	_this.AllocateMonster(0, `mob1`,	`center`, `single(buchanan:1)`);

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
	//인챈트 아이템
	//인챈트 옵션 뽑기
	int iRandom = Random(5);
	switch(iRandom)
	{
		case (0)
		{
			TreasureChest1.AddItem(`id:40007 count:1 suffix:30801`); //네이쳐 한손도끼
		}
		case (1)
		{
			TreasureChest1.AddItem(`id:40007 count:1 suffix:30802`); //카운터 한손도끼
		}
		case (2)
		{
			TreasureChest1.AddItem(`id:40007 count:1 suffix:30803`); //윈드밀 한손도끼
		}
		case (3)
		{
			TreasureChest1.AddItem(`id:40007 count:1 suffix:30804`); //스매시 한손도끼
		}
		case (4)
		{
			TreasureChest1.AddItem(`id:62005 count:1 suffix:31302`); //리볼버 인챈트 스크롤
		}

	}

	//아이템보상 넣기
	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest1.AddItem(GetItemRewardDesc());
			}
			case (2)
			{
				TreasureChest2.AddItem(GetItemRewardDesc());
			}
			case (3)
			{
				TreasureChest3.AddItem(GetItemRewardDesc());
			}
			case (4)
			{
				TreasureChest4.AddItem(GetItemRewardDesc());
			}
			case (5)
			{
				TreasureChest5.AddItem(GetItemRewardDesc());
			}
			case (6)
			{
				TreasureChest6.AddItem(GetItemRewardDesc());
			}
			case (7)
			{
				TreasureChest7.AddItem(GetItemRewardDesc());
			}
			case (8)
			{
				TreasureChest8.AddItem(GetItemRewardDesc());
			}
		}
	}

	character	cChar;
	int		k;

	//접속중인 Creator에게 열쇠를 넣어준다
	for (k = 0; k < cMemberNum;  k++)
	{
		cChar = (character)cMemberList.GetValue(k);

		if (cChar.IsValid())
		{
			cChar.AddItemWithEffect(`id:70028 lock:chest`);
		}
	}
	// 종료시킨다
	_this.Complete();
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
}




