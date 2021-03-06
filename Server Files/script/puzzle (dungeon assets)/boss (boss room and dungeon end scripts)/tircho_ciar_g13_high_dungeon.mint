////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던바튼 : 라비던전 보스
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
	case (2)	{	rewardRate = 0.17;	}
	case (3)	{	rewardRate = 0.175;	}
	case (4)	{	rewardRate = 0.18;	}
	case (5)	{	rewardRate = 0.182;	}
	case (6)	{	rewardRate = 0.184;	}
	case (7)	{	rewardRate = 0.184;	}
	case (8)	{	rewardRate = 0.184;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 7700;
	int OriginalRewardMax = 25400;
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
				iCumRate += 15; //이 아이템이 나올 확률
			}
			case (1)
			{
				itemDesc = `id:51102 count:1~2`;	//마나허브
				iCumRate += 15;
			}
			case (2)
			{
				itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
				iCumRate += 15;
			}
			case (3)
			{
				itemDesc = `id:51008 count:1~2`;	//마나 50 포션
				iCumRate += 15;
			}
			case (4)
			{
				itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
				iCumRate += 15;
			}
			//여기까지 총 75%
			case (5)
			{
				itemDesc = `id:71049 count:2~5`;	//뱀 마족 스크롤(220G)
				iCumRate += 5;
			}
			case (6)
			{
				itemDesc = `id:63104 count:1 expire:600`;	//키아 하급 마족 통행증
				iCumRate += 4;
			}
			case (7)
			{
				itemDesc = `id:40015 col1:FFEA78 durability:0`;	//황금 플루트 숏소드 -ㅁ-
				iCumRate += 1;
			}
			case (8)
			{
				itemDesc = `id:63123 count:1 expire:480`;	//키아 중급 1 마족 통행증
				iCumRate += 3;
			}
			case (9)
			{
				itemDesc = `id:63124 count:1 expire:480`;	//키아 중급 2 마족 통행증
				iCumRate += 3;
			}
			case (10)
			{
				itemDesc = `id:63125 count:1 expire:480`;	//키아 중급 4 마족 통행증
				iCumRate += 3;
			}
			case (11)
			{
				itemDesc = `id:63136 count:1 expire:360`;	//키아 상급 2인 마족 통행증
				iCumRate += 2;
			}
			case (12)
			{
				itemDesc = `id:63137 count:1 expire:360`;	//키아 상급 3인 마족 통행증
				iCumRate += 2;
			}
			case (13)
			{
				itemDesc = `id:63138 count:1 expire:360`;	//키아 상급 무제한 마족 통행증
				iCumRate += 2;
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
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0,
	`boss`,
        `center`,                           // 배치 템플릿 이름
        `single(golem2:1)`);

    _this.AllocateMonster(
        0,
	`minion`,
        `center`,                           // 배치 템플릿 이름
        `single(metalskeletonarmora:6)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);


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
	int iRandom2 = Random(3);
	int prefixid;
	int suffixid;
	switch (iRandom2)
	{
		case (0)     prefixid = 207 ;
		case (1)     prefixid = 306 ;
		case (2)     prefixid = 303 ;
	}
	iRandom2 = Random(3);
	switch (iRandom2)
	{
		case (0)     suffixid = 11106 ;
		case (1)     suffixid = 10806 ;
		case (2)     suffixid = 10704 ;
	}
	string EnchantitemDesc = `id:40019 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid);
	TreasureChest1.AddItem(EnchantitemDesc);


	// 보스 러시 던전 통행증 추가
	int iRandom3;
	int iDropRate = 0;

	if (IsTestServer() || IsDevelopment())
	{
		iDropRate = 50;	// 테섭은 50% 드랍
	}
	else if (IsEnable(`featureBossRush`) extern (`data/script/features.mint`))
	{
		iDropRate = 10;	// 하급은 10% 드랍
	}

DebugOut(`보스 러시 통행증 테스트`);
	if (IsEnable(`featureBossRush`) extern (`data/script/features.mint`))
	{
DebugOut(`보스 러시 통행증 발급중`);
		iRandom3 = Random(100);
DebugOut(`iRandom3 : ` + ToString(iRandom3));
DebugOut(`cMemberNum : ` + ToString(cMemberNum));
		if (iRandom3 < 50 && 0 < cMemberNum)
		{
DebugOut(`보스 러시 통행증 발급 수행`);
			TreasureChest1.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 1 < cMemberNum)
		{
			TreasureChest2.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 2 < cMemberNum)
		{
			TreasureChest3.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 3 < cMemberNum)
		{
			TreasureChest4.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 4 < cMemberNum)
		{
			TreasureChest5.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 5 < cMemberNum)
		{
			TreasureChest6.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 6 < cMemberNum)
		{
			TreasureChest7.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);
		if (iRandom3 < iDropRate && 7 < cMemberNum)
		{
			TreasureChest8.AddItem(`id:63156 expire:360`);	//키아 보스 러시 던전 통행증
		}
	}

	//아이템보상 넣기
	object_list	cCharList = _dungeon.GetPlayerList();
	character	leader = (character)cCharList.GetValue(0);

	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest1.AddItem(GetItemRewardDesc());

				// 고로 퀘스트 진행중인 녀석이 있으면 고로 반지가 상자에서 나옴
				if(cCharList.GetSize() ==1 && leader.HaveKeyword(`g1_13`))
				{
					TreasureChest1.AddItemForLeader(`id:73060 count:1`);	//고로의 반지
				}
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
	if (IsCurrentEvent(`dungeonevent2009_taiwan`))
	{
		int iRandom4 = Random(100);

		if (iRandom4 >= 95)
		{
			for (i = 1; i <= cMemberNum; ++i)
			{
				switch (i)
				{
					case (1)
					{
						TreasureChest1.AddItem(`id:75334 count:1`);
					}
					case (2)
					{
						TreasureChest2.AddItem(`id:75334 count:1`);
					}
					case (3)
					{
						TreasureChest3.AddItem(`id:75334 count:1`);
					}
					case (4)
					{
						TreasureChest4.AddItem(`id:75334 count:1`);
					}
					case (5)
					{
						TreasureChest5.AddItem(`id:75334 count:1`);
					}
					case (6)
					{
						TreasureChest6.AddItem(`id:75334 count:1`);
					}
					case (7)
					{
						TreasureChest7.AddItem(`id:75334 count:1`);
					}
					case (8)
					{
						TreasureChest8.AddItem(`id:75334 count:1`);
					}
				}
			}
		}
	}

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
	if (_name == `minion`.LowerCase() && _remain == 0)
	{
		_this.Set(`state2`,`1`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) == `11`)
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

			// 대만 퍼즐 이벤트가 진행중인 경우
			if (IsCurrentEvent(`puzzle2008_taiwan`))
			{
				AddEventReward(_this, cChar, i) extern (`data/script/puzzle/Puzzle_Event_Taiwan.mint`);
			}

			if (cChar.IsValid())
			{
				//cChar.DoStript(`additemex(id:70028 lock:chest)`);
				//윗줄과 같은 명령이지만, 머리위에 받은 아이템을 보여준다
				//브로드캐스팅은 안함
				cChar.AddItemWithEffect(`id:70028 lock:chest`);

				if(cChar.GetCompletedQuestObjectiveCount(294204) == 2)
				{
					cChar.AddKeyword(`g13_06_01`);
					cChar.RemoveKeyword(`g13_05_02`);
					cChar.DoStript(`additemex(id:75467 rewardview:true)`);		// 대장장이 망치 준다
					cChar.ShowCaption(["puzzle.boss.tircho_ciar_g13_high_dungeon.1"]);															
				}
			}

		}
		// 종료시킨다
		_this.Complete();
	}
}




