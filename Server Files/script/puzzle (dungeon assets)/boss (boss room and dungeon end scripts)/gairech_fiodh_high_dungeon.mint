////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             가이레흐 피오드 중급던전 4인 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                        eias@nexon.co.kr, sheplany@nownuri.net
//					hanstone@nexon.co.kr, edits at 2004. 9. 9
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
	case (1)	{	rewardRate = 0.2;	}
	case (2)	{	rewardRate = 0.19;	}
	case (3)	{	rewardRate = 0.18;	}
	case (4)	{	rewardRate = 0.17;	}
	case (5)	{	rewardRate = 0.17;	}
	case (6)	{	rewardRate = 0.17;	}
	case (7)	{	rewardRate = 0.17;	}
	case (8)	{	rewardRate = 0.17;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 49000;
	int OriginalRewardMax = 61000;
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

// : 아이템 보상을 결정
////////////////////////////////////////////////////////////////////////////////
{
	int iRandom = Random(43);
	string itemDesc;

	switch (iRandom) {
		case (0)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (1)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (2)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (3)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (4)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (5)	itemDesc = `id:62004 count:2~4`;	//마법가루
		case (6)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (7)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (8)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (9)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (10)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (11)	itemDesc = `id:51102 count:2~4`;	//마나허브
		case (12)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (13)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (14)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (15)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (16)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (17)	itemDesc = `id:51014 count:2~4`;	//스태미나 50 포션
		case (18)	itemDesc = `id:51013 count:2~4`;	//스태미나 50 포션
		case (19)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (20)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (21)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (22)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (23)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (24)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (25)	itemDesc = `id:51009 count:2~4`;	//마나 50 포션
		case (26)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (27)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (28)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (29)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (30)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (31)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (32)	itemDesc = `id:51004 count:2~4`;	//생명력 50 포션
		case (33)	itemDesc = `id:63119 count:1 expire:480`;		//중급피오드 1인 통행증
		case (34)	itemDesc = `id:63119 count:1 expire:480`;		//중급피오드 1인 통행증
		case (35)	itemDesc = `id:63119 count:1 expire:480`;		//중급피오드 1인 통행증
		case (36)	itemDesc = `id:63120 count:1 expire:480`;		//중급피오드 2인 통행증
		case (37)	itemDesc = `id:63120 count:1 expire:480`;		//중급피오드 2인 통행증
		case (38)	itemDesc = `id:63121 count:1 expire:480`;		//중급피오드 4인 통행증
		case (39)	itemDesc = `id:63121 count:1 expire:480`;		//중급피오드 4인 통행증
		case (40)	itemDesc = `id:63253 count:1 expire:480`;		//상급피오드 통행증
		case (41)	itemDesc = `id:63253 count:1 expire:480`;		//상급피오드 통행증
		case (42)	itemDesc = `id:63253 count:1 expire:480`;		//상급피오드 통행증				
	}

	return itemDesc;
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
////
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss`,
	`center`,						// 배치 템플릿 이름
	`single(ArmorBear:1)`);

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
	for (i = 1; i <= cMemberNum; ++i)
	//사람수에 따라 아이템 보상 넣기. 4인던전이니까 네번만 돌리면 되겠지만 수정하지 않습니다. 그냥 둡시다. 네.네.네. T_T
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

	//인챈트 아이템 보상넣기

	int iRandom = Random(1000);
	if(iRandom<20)
	{
		TreasureChest1.AddItem(`id:40377`); //글로리 소드
	}
	else if(iRandom<430)
	{ 
		TreasureChest1.AddItem(`id:62005 count:1 suffix:10808`); //지식의 인챈트 스크롤
	}
	else if(iRandom<850)
	{ 
		TreasureChest1.AddItem(`id:62005 count:1 suffix:11008`); //기쁨의 인챈트 스크롤
	}
	else
	{ 
		TreasureChest1.AddItem(`id:62005 count:1 suffix:30632`); //버스트 나이트  인챈트 스크롤
	}

	if (IsCurrentEvent(`dungeonevent2009_taiwan`))
	{
		int iRandom3 = Random(100);

		if (iRandom3 >= 93)
		{
			for (i = 1; i <= cMemberNum; ++i)
			{
				switch (i)
				{
					case (1)
					{
						TreasureChest1.AddItem(`id:75337 count:1`);
					}
					case (2)
					{
						TreasureChest2.AddItem(`id:75337 count:1`);
					}
					case (3)
					{
						TreasureChest3.AddItem(`id:75337 count:1`);
					}
					case (4)
					{
						TreasureChest4.AddItem(`id:75337 count:1`);
					}
					case (5)
					{
						TreasureChest5.AddItem(`id:75337 count:1`);
					}
					case (6)
					{
						TreasureChest6.AddItem(`id:75337 count:1`);
					}
					case (7)
					{
						TreasureChest7.AddItem(`id:75337 count:1`);
					}
					case (8)
					{
						TreasureChest8.AddItem(`id:75337 count:1`);
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

	if (_this.Get(`state1`)== `1`) //아햏햏
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

			// 클리어 저널 추가
			if (IsEnable(`featureDungeonAchievement`) extern (`data/script/features.mint`))
			{
				int default_achi = 2166;
				int dungeon_achi = 2169;
				int low_achi = default_achi+1;
				int mid_achi = default_achi+2;
				int high_achi = default_achi+3;
				int com_achi = default_achi+4;
			
				if(!cChar.AchievementHas(dungeon_achi))
				{
					cChar.AchievementAdd(dungeon_achi);
				}

				if(cChar.AchievementHas(default_achi) && cChar.AchievementHas(low_achi) && cChar.AchievementHas(mid_achi) && cChar.AchievementHas(high_achi))
				{
					cChar.AchievementRemove(default_achi);
					cChar.AchievementRemove(low_achi);
					cChar.AchievementRemove(mid_achi);
					cChar.AchievementRemove(high_achi);
					cChar.AchievementAdd(com_achi);
				}
			}
		}


		// 종료시킨다
		_this.Complete();
	}
}





