////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             티르 코네일 : 키아 보스 러시 던전 보스
//
//                                     uhihiho@nexon.co.kr, edits at 2006.11.2
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
	float rewardRate = 0.14;	// 문제가 생겼을 때 가장 적은 비율로 주도록 -_-
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
	int OriginalRewardMin = 12000;
	int OriginalRewardMax = 22000; //멋대로입니다

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
				iCumRate += 17; // 15/100
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
			//여기까지 85%
			case (5)
			{
				itemDesc = `id:63129 count:1 expire:360`; //마스 상급 2인
				iCumRate += 5;  
			}
			case (6)
			{
				itemDesc = `id:63130 count:1 expire:360`;	//마스 상급 3인
				iCumRate += 5;  
			}
			case (7)
			{
				itemDesc = `id:63131 count:1 expire:360`;	//마스 상급 무제한
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
	return ``; //아이템이 안나왔다...
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
	`cyclops`,
	`center`,                           // 배치 템플릿 이름 
	`single(cyclops:1)`);

	_this.AllocateMonster(
	0, 
	`pirateskeletona`, 
	`center`,                           // 배치 템플릿 이름 
	`single(PirateSkeletonA:2)`);

	_this.AllocateMonster(
	0, 
	`pirateskeletonb`, 
	`center`,                           // 배치 템플릿 이름 
	`single(PirateSkeletonB:2)`);

	_this.AllocateMonster(
	0, 
	`flyingsword2`, 
	`center`,                           // 배치 템플릿 이름 
	`single(FlyingSword2:2)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);
	_this.Set(`state4`,`0`);

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
	int prefixid;
	string EnchantItemDesc;
	
	int iRandom2 = Random(3);
	switch (iRandom2) 
	{
		case (0)     prefixid = 20711 ; //반짝이는  ^^
		case (1)     prefixid = 20712 ; //비싸보이는 ^^
		case (2)     prefixid = 20402 ; //스트롱 orz
	}
	
	iRandom2 = Random(3);
	switch (iRandom2) 
	{
		case (0)	EnchantItemDesc = `id:62005 count:1 prefix:` + ToString(prefixid);
		case (1)	EnchantItemDesc = `id:62005 count:1 prefix:` + ToString(prefixid);
		case (2)	EnchantItemDesc = `id:62005 count:1 prefix:` + ToString(prefixid);
	}	
	TreasureChest1.AddItem(EnchantItemDesc);	
	

	// 보스 러시 던전 통행증 추가
	int iRandom3 =Random(100);	
DebugOut(`컬렉션북 테스트`);
	if (IsTestServer() || IsDevelopment())	// 테섭, 개발서버에서는
	{
DebugOut(`컬렉션북 발급중`);
		if (iRandom3 < 10)	// 10%
		{
			TreasureChest1.AddItem(`id:1540`);	//인챈트 컬렉션북 vol.2
		}
		else if (iRandom3 < 20)	// 10%
		{
			TreasureChest1.AddItem(`id:1541`);	//인챈트 컬렉션북 vol.3
		}
		else if (iRandom3 < 30)	// 10%
		{
			TreasureChest1.AddItem(`id:1542`);	//인챈트 컬렉션북 vol.4
		}
		else if (iRandom3 < 40)	// 10%
		{
			TreasureChest1.AddItem(`id:1544`);	//인챈트 컬렉션북 vol.6
		}
		else if (iRandom3 < 50)	// 10%
		{
			TreasureChest1.AddItem(`id:1545`);	//인챈트 컬렉션북 vol.7
		}
	}
	else if (GetVersion() >= 504)	// 본서버에서는
	{
DebugOut(`컬렉션북 발급중`);
DebugOut(`iRandom3 : ` + ToString(iRandom3));
		if (iRandom3 < 4)	// 4%
		{
			TreasureChest1.AddItem(`id:1540`);	//인챈트 컬렉션북 vol.2
		}
		else if (iRandom3 < 8)	// 4%
		{
			TreasureChest1.AddItem(`id:1541`);	//인챈트 컬렉션북 vol.3
		}
		else if (iRandom3 < 12)	// 4%
		{
			TreasureChest1.AddItem(`id:1542`);	//인챈트 컬렉션북 vol.4
		}
		else if (iRandom3 < 16)	// 4%
		{
			TreasureChest1.AddItem(`id:1544`);	//인챈트 컬렉션북 vol.6
		}
		else if (iRandom3 < 20)	// 4%
		{
			TreasureChest1.AddItem(`id:1545`);	//인챈트 컬렉션북 vol.7
		}
	}


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
// DebugOut(`monster name : ` + _name); 확인용
// DebugOut(`monster name : ` + ToString(_remain)); 확인용

// 룬다 일반 보스가 다 쓰러졌을 때 처리	
	if (_name == `cyclops` && _remain == 0)
	{
		_this.Set(`state1`,`1`);
	}
	if (_name == `pirateskeletona` && _remain == 0)
	{
		_this.Set(`state2`,`1`);
	}
	if (_name == `pirateskeletonb` && _remain == 0)
	{
		_this.Set(`state3`,`1`);
	}
	if (_name == `flyingsword2` && _remain == 0)
	{
		_this.Set(`state4`,`1`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) == `1111`)
	{
		_this.AllocateMonster(
		0,
		`catsith_1`,
		`GhostArmorBoss`,            // 배치 템플릿 이름 
		`single(catsith_1:1)`);

		_this.AllocateMonster(
		0, 
		`catsith_2`,
		`GhostArmorBoss`,            // 배치 템플릿 이름 
		`single(catsith_2:1)`);

		_this.AllocateMonster(
		0, 
		`catsith_3`,
		`GhostArmorBoss`,            // 배치 템플릿 이름 
		`single(catsith_3:2)`);

		_this.AllocateMonster(
		0, 
		`catsith_4`,
		`GhostArmorBoss`,            // 배치 템플릿 이름 
		`single(catsith_4:3)`);

		_this.Set(`state1`,`0`);
		_this.Set(`state2`,`0`);
		_this.Set(`state3`,`0`);
		_this.Set(`state4`,`0`);
	}

	// 룬다 하급 보스가 다 쓰러졌을 때 처리	
	if (_name == `catsith_1` && _remain == 0)
	{
		_this.Set(`state1`,`2`);
	}
	if (_name == `catsith_2` && _remain == 0)
	{
		_this.Set(`state2`,`2`);
	}
	if (_name == `catsith_3` && _remain == 0)
	{
		_this.Set(`state3`,`2`);
	}
	if (_name == `catsith_4` && _remain == 0)
	{
		_this.Set(`state4`,`2`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) == `2222`)
	{
		_this.AllocateMonster(
		0,
		`siren`,
		`boss_room01`,                 // 배치 템플릿 이름 
		`single(Siren_no_drop_pocketitem:1)`);

		_this.AllocateMonster(
		0, 
		`sahuagin1`, 
		`boss_room01`,                 // 배치 템플릿 이름 
		`single(Sahuagin1:1)`);

		_this.AllocateMonster(
		0, 
		`sahuagin2`, 
		`boss_room01`,                 // 배치 템플릿 이름 
		`single(Sahuagin2:1)`);

		_this.AllocateMonster(
		0, 
		`sahuagin3`, 
		`boss_room01`,                 // 배치 템플릿 이름 
		`single(Sahuagin3:1)`);

		_this.Set(`state1`,`0`);
		_this.Set(`state2`,`0`);
		_this.Set(`state3`,`0`);
		_this.Set(`state4`,`0`);
	}

	// 룬다 중급 보스가 다 쓰러졌을 때 처리	
	if (_name == `siren` && _remain == 0)
	{
		_this.Set(`state1`,`3`);
	}
	if (_name == `sahuagin1` && _remain == 0)
	{
		_this.Set(`state2`,`3`);
	}
	if (_name == `sahuagin2` && _remain == 0)
	{
		_this.Set(`state3`,`3`);
	}
	if (_name == `sahuagin3` && _remain == 0)
	{
		_this.Set(`state4`,`3`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) == `3333`)
	{
		_this.AllocateMonster(
		0, 
		`cyclops2`,
		`center`,						// 배치 템플릿 이름 
		`single(cyclops2:1)`);

		_this.AllocateMonster(
		0, 
		`flyingsword3`,
		`center`,						// 배치 템플릿 이름 
		`single(FlyingSword3:2)`);

		_this.AllocateMonster(
		0, 
		`captinskeleton1`,
		`center`,						// 배치 템플릿 이름 
		`single(CaptinSkeleton:2)`);

		_this.AllocateMonster(
		0, 
		`captinskeleton2`,
		`center`,						// 배치 템플릿 이름 
		`single(CaptinSkeleton:2)`);

		_this.Set(`state1`,`0`);
		_this.Set(`state2`,`0`);
		_this.Set(`state3`,`0`);
		_this.Set(`state4`,`0`);
	}

	// 룬다 상급 보스가 다 쓰러졌을 때 처리	
	if (_name == `cyclops2` && _remain == 0)
	{
		_this.Set(`state1`,`4`);
	}
	if (_name == `flyingsword3` && _remain == 0)
	{
		_this.Set(`state2`,`4`);
	}
	if (_name == `captinskeleton1` && _remain == 0)
	{
		_this.Set(`state3`,`4`);
	}
	if (_name == `captinskeleton2` && _remain == 0)
	{
		_this.Set(`state4`,`4`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) == `4444`)
	{
		_this.AllocateMonster(
		0, 
		`cyclopsbossrush`,
		`boss_room00`,						// 배치 템플릿 이름 
		`single(CyclopsBossRush:1)`);

		_this.AllocateMonster(
		0, 
		`blackshiprat1`,
		`boss_room00`,						// 배치 템플릿 이름 
		`single(BlackShipRat:1)`);

		_this.AllocateMonster(
		0, 
		`blackshiprat2`,
		`boss_room00`,						// 배치 템플릿 이름 
		`single(BlackShipRat:1)`);

		_this.AllocateMonster(
		0, 
		`blackshiprat3`,
		`boss_room00`,						// 배치 템플릿 이름 
		`single(BlackShipRat:2)`);

		_this.Set(`state1`,`0`);
		_this.Set(`state2`,`0`);
		_this.Set(`state3`,`0`);
		_this.Set(`state4`,`0`);
	}

	// 룬다 최종 보스까지 다 깼을 때 처리	
	if (_name == `cyclopsbossrush` && _remain == 0)
	{
		_this.Set(`state1`,`5`);
	}
	if (_name == `blackshiprat1` && _remain == 0)
	{
		_this.Set(`state2`,`5`);
	}
	if (_name == `blackshiprat2` && _remain == 0)
	{
		_this.Set(`state3`,`5`);
	}
	if (_name == `blackshiprat3` && _remain == 0)
	{
		_this.Set(`state4`,`5`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) == `5555`)
	{
		dungeon _dungeon = _this.GetDungeon();

		//보스룸 클리어시 접속중인 Creator 뽑기
		object_list cMemberList = _dungeon.GetCreatorList();
		int cMemberNum = cMemberList.GetSize();

		_dungeon.SetRankingScore(0);

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
