////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             카루숲 항아리 거미 다리 유적 보스
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
// : 돈보상을 줄 양과 돈더미의 수
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc;

	//기본보상값에 Creator 인원에 따라 곱해지는 비율
	float rewardRate = 0.16;	// 문제가 생겼을 때 가장 적은 비율로 주도록 -_-
	switch (_partyCount)
	{
	case (1)	{	rewardRate = 0.24;	}
	case (2)	{	rewardRate = 0.26;	}
	case (3)	{	rewardRate = 0.28;	}
	case (4)	{	rewardRate = 0.30;	}
	case (5)	{	rewardRate = 0.26;	}
	case (6)	{	rewardRate = 0.22;	}
	case (7)	{	rewardRate = 0.18;	}
	case (8)	{	rewardRate = 0.14;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 20000;
	int OriginalRewardMax = 28000;
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

	if (IsEnable(`featureTaiwanWeapon`) extern (`data/script/features.mint`))
	{
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
					itemDesc = `id:62004 count:3~5`;	//마법가루
					iCumRate += 18; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:51101 count:3~5`;	//블러디 허브
					iCumRate += 18;
				}
				case (2)
				{
					itemDesc = `id:51102 count:3~5`;	//마나 허브
					iCumRate += 18;
				}
				case (3)
				{
					itemDesc = `id:51103 count:3~5`;	//선라이트 허브
					iCumRate += 18;
				}
				case (4)
				{
					itemDesc = `id:51104 count:3~5`;	//베이스 허브
					iCumRate += 10;
				}
				case (5)
				{
					itemDesc = `id:51105 count:3~5`;	//골드 허브
					iCumRate += 10;
				}
				case (6)
				{
					itemDesc = `id:40229`;	//샤오란엔 기사의 활
					iCumRate += 8;
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
	}
	else
	{
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
					itemDesc = `id:62004 count:3~5`;	//마법가루
					iCumRate += 20; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:51101 count:3~5`;	//블러디 허브
					iCumRate += 20;
				}
				case (2)
				{
					itemDesc = `id:51102 count:3~5`;	//마나 허브
					iCumRate += 20;
				}
				case (3)
				{
					itemDesc = `id:51103 count:3~5`;	//선라이트 허브
					iCumRate += 20;
				}
				case (4)
				{
					itemDesc = `id:51104 count:3~5`;	//베이스 허브
					iCumRate += 10;
				}
				case (5)
				{
					itemDesc = `id:51105 count:3~5`;	//골드 허브
					iCumRate += 10;
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
	`boss1`,
	`boss_room00`,						// 배치 템플릿 이름
	`single(RuinGuardian:1)`);

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
	//인챈트 아이템 보상넣기
	if(IsEnable(`featurePersonalizeEnchant`) extern (`data/script/features.mint`)) //G11S2ex 이후 (전용화 인챈트 투입)
	{
		int iRandom = Random(100);
		if(iRandom<20)
		{
			TreasureChest1.AddItem(`id:40024 count:1 prefix:20201`); //단단한 대장장이 망치
		}
		else if(iRandom<40)
		{ 
			TreasureChest1.AddItem(`id:40024 count:1 prefix:20611`); //정밀한 대장장이 망치
		}
		else if(iRandom<60)
		{ 
			TreasureChest1.AddItem(`id:40024 count:1 prefix:20501`); //간편한 대장장이 망치
		}
		else if(iRandom<80)
		{ 
			TreasureChest1.AddItem(`id:40024 count:1 prefix:20701`); //거센 대장장이 망치
		}
		else if(iRandom<98)
		{ 
			TreasureChest1.AddItem(`id:40024 count:1 suffix:30818`); //동백나무 대장장이 망치
		}
		else
		{ 
			TreasureChest1.AddItem(`id:62059 count:1 prefix:20919`); // 존귀한 인챈트 스크롤
		}

	}
	else if(GetVersion() >= 502)
	{
		int iRandom = Random(5);
		switch(iRandom)
		{
			case (0)
			{
				TreasureChest1.AddItem(`id:40024 count:1 prefix:20201`); //단단한 대장장이 망치
			}
			case (1)
			{
				TreasureChest1.AddItem(`id:40024 count:1 prefix:20611`); //정밀한 대장장이 망치
			}
			case (2)
			{
				TreasureChest1.AddItem(`id:40024 count:1 prefix:20501`); //간편한 대장장이 망치
			}
			case (3)
			{
				TreasureChest1.AddItem(`id:40024 count:1 prefix:20701`); //거센 대장장이 망치
			}
			case (4)
			{
				TreasureChest1.AddItem(`id:40024 count:1 suffix:30818`); //동백나무 대장장이 망치
			}
		}
	}
	else
	{
		int iRandom2 = Random(4);
		int prefixid;
		int suffixid;
		switch (iRandom2)
		{
			case (0)	prefixid = 1704 ; //가짜
			case (1)	prefixid = 1705 ; //값싼
			case (2)	prefixid = 1706 ; //좋은
			case (3)	prefixid = 305 ; //정교한
		}
		string EnchantItemDesc = `id:40016 count:1 prefix:` + ToString(prefixid); //해머
		TreasureChest1.AddItem(EnchantItemDesc);
	}

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
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `boss1`.LowerCase() && _remain == 0)
	{
		_this.Set(`state1`,`1`);
	}
	//이 무식한 방법을 누가 좀 어떻게 해줘~
	if (_this.Get(`state1`) == `1`)
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
				int default_achi = 2196;
				int dungeon_achi = 2198;
				int low_achi = default_achi+1;
				int mid_achi = default_achi+2;
				int com_achi = default_achi+4;
			
				if(!cChar.AchievementHas(dungeon_achi) && !cChar.AchievementHas(com_achi))
				{
					cChar.AchievementAdd(dungeon_achi);
				}

				if(cChar.AchievementHas(default_achi) && cChar.AchievementHas(low_achi) && cChar.AchievementHas(mid_achi) )
				{
					cChar.AchievementRemove(default_achi);
					cChar.AchievementRemove(low_achi);
					cChar.AchievementRemove(mid_achi);
					cChar.AchievementAdd(com_achi);
				}
			}
		}
		// 종료시킨다
		_this.Complete();
	}
}



