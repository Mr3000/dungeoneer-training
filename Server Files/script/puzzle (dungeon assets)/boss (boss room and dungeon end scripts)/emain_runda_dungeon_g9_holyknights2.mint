////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           이멘마하: 룬다던전 보스
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
	int OriginalRewardMin = 8400;
	int OriginalRewardMax = 16800;
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
	int iRandom = Random(200);
	//  확률의 총합은 100이라고 가정. 늘리고 싶음 늘림되긴함..iRandom값이 먼저 정해지는게 포인트다..

	if(GetLocale().LowerCase() == `japan` && GetVersion() >= 504)
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
					itemDesc = `id:62004 count:1~2`;	//마법가루
					iCumRate += 30; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:51102 count:1~2`;	//마나허브
					iCumRate += 30; 
				}
				case (2)	
				{
					itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
					iCumRate += 29;
				}
				case (3)
				{
					itemDesc = `id:51008 count:1~2`;	//마나 50 포션
					iCumRate += 29;
				}
				case (4)
				{
					itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
					iCumRate += 25;
				}
				case (5)
				{
					itemDesc = `id:71032 count:2~5`;	//미믹 마족 스크롤(220G)
					iCumRate +=11;  
				}
				case (6)
				{
					itemDesc = `id:71018 count:3~5`;	//검은 거미 마족 스크롤(190G)
					iCumRate += 15;
				}
				case (7)
				{
					itemDesc = `id:71018 count:3~5`;	//붉은 거미 마족 스크롤(300G)
					iCumRate += 15;
				}
				case (8)
				{
					itemDesc = `id:63126 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (9)
				{
					itemDesc = `id:63127 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (10)
				{
					itemDesc = `id:63128 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (11)
				{
					itemDesc = `id:63105 count:1 expire:600`;	//룬다 하급
					iCumRate += 5;
				}
				case (12)
				{
					itemDesc = `id:63103`;	//룬다 세이렌 던전용 수상한 마족 통행증
					iCumRate += 3;  
				}			
				case (13)
				{
					itemDesc = `id:40195`;	//요시미츠. 일본만 드랍
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
					itemDesc = `id:62004 count:1~2`;	//마법가루
					iCumRate += 30; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:51102 count:1~2`;	//마나허브
					iCumRate += 30; 
				}
				case (2)	
				{
					itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
					iCumRate += 30;
				}
				case (3)
				{
					itemDesc = `id:51008 count:1~2`;	//마나 50 포션
					iCumRate += 30;
				}
				case (4)
				{
					itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
					iCumRate += 25;
				}
				case (5)
				{
					itemDesc = `id:71032 count:2~5`;	//미믹 마족 스크롤(220G)
					iCumRate +=11;  
				}
				case (6)
				{
					itemDesc = `id:71018 count:3~5`;	//검은 거미 마족 스크롤(190G)
					iCumRate += 15;  
				}
				case (7)
				{
					itemDesc = `id:71018 count:3~5`;	//붉은 거미 마족 스크롤(300G)
					iCumRate += 15;  
				}
				case (8)
				{
					itemDesc = `id:63126 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (9)
				{
					itemDesc = `id:63127 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (10)
				{
					itemDesc = `id:63128 count:1 expire:360`;	//룬다 상급 마족통행증
					iCumRate += 2;
				}
				case (11)
				{
					itemDesc = `id:63105 count:1 expire:600`;	//룬다 하급
					iCumRate += 5;
				}
				case (12)
				{
					itemDesc = `id:63103`;	//룬다 세이렌 던전용 수상한 마족 통행증
					iCumRate += 3;  
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
	puzzle_prop prison;
	puzzle_prop prison1;
	puzzle_prop prison2;
	puzzle_prop prison3;
	puzzle_prop prison4;
	puzzle_prop jenna;

	prison = New(_this, 0, `real_center@2`, `prison`) extern (`data/script/puzzle/prop/jenna_prison.mint`);

	prison1 = _this.NewProp(
		41483,				
		``,			// 초기 상태
		0,				// 배치할 장소 인덱스
		`real_center@2`,		// 위치 템플릿
		`prison1`,				// 이름
		``,	// 상태 변화 여부 검사 핸들러
		``);	// 상태 변화 이벤트 핸들러

	prison2 = _this.NewProp(
		41484,				
		``,			// 초기 상태
		0,				// 배치할 장소 인덱스
		`real_center@2`,		// 위치 템플릿
		`prison2`,				// 이름
		``,	// 상태 변화 여부 검사 핸들러
		``);	// 상태 변화 이벤트 핸들러

	prison3 = _this.NewProp(
		41485,				
		``,			// 초기 상태
		0,				// 배치할 장소 인덱스
		`real_center@2`,		// 위치 템플릿
		`prison3`,				// 이름
		``,	// 상태 변화 여부 검사 핸들러
		``);	// 상태 변화 이벤트 핸들러

	prison4 = _this.NewProp(
		41486,				
		``,			// 초기 상태
		0,				// 배치할 장소 인덱스
		`real_center@2`,		// 위치 템플릿
		`prison4`,				// 이름
		``,	// 상태 변화 여부 검사 핸들러
		``);	// 상태 변화 이벤트 핸들러



     _this.AllocateMonster(
	0, 
	`jenna`,
	`jenna`,                           // 배치 템플릿 이름 
	`single(Jenna_prision:1)`);

     _this.AllocateMonster(
	0, 
	`boss1`,
	`boss_room01`,                           // 배치 템플릿 이름 
	`single(ShrineKnightsB_fighter1:3)`);

     _this.AllocateMonster(
	0, 
	`boss2`,
	`boss_room01`,                           // 배치 템플릿 이름 
	`single(ShrineKnightsB_fighter2:4)`);

   _this.AllocateMonster(
	0, 
	`boss3`,
	`boss_room00`,                           // 배치 템플릿 이름 
	`single(ShrineKnightsB_archer:3)`);


	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);




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
	//인챈트 옵션 랜담선택
	int iRandom2 = Random(3);
	int prefixid;

	switch (iRandom2) 
	{
		case (0)     prefixid = 20701 ; //거친
		case (1)     prefixid = 20406 ; //편리한
		case (2)     prefixid = 20104 ; //초록의 orz
	}
	
	string EnchantitemDesc = `id:18017 count:1 prefix:` + ToString(prefixid);
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
		iDropRate = 5;	// 일반은 5% 드랍
	}

DebugOut(`보스 러시 통행증 테스트`);
	if (IsEnable(`featureBossRush`) extern (`data/script/features.mint`))
	{
DebugOut(`보스 러시 통행증 발급중`);
		iRandom3 = Random(100);	
DebugOut(`iRandom3 : ` + ToString(iRandom3));
		if (iRandom3 < iDropRate && 0 < cMemberNum)
		{
			TreasureChest1.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 1 < cMemberNum)
		{
			TreasureChest2.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 2 < cMemberNum)
		{
			TreasureChest3.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 3 < cMemberNum)
		{
			TreasureChest4.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 4 < cMemberNum)
		{
			TreasureChest5.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 5 < cMemberNum)
		{
			TreasureChest6.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 6 < cMemberNum)
		{
			TreasureChest7.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
		iRandom3 = Random(100);	
		if (iRandom3 < iDropRate && 7 < cMemberNum)
		{
			TreasureChest8.AddItem(`id:63157 expire:360`);	//룬다 보스 러시 던전 통행증
		}
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
	if (_name == `boss1`.LowerCase() && _remain == 0)
	{

		_this.Set(`state1`,`1`);
	}

	if (_name == `boss2`.LowerCase() && _remain == 0)
	{

		_this.Set(`state2`,`1`);
	}

	if (_name == `boss3`.LowerCase() && _remain == 0)
	{

		_this.Set(`state3`,`1`);
	}

	if (_this.Get(`state1`)  == `1` && _this.Get(`state2`)  == `1` && _this.Get(`state3`)  == `1`)
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
			}
		}


		// 종료시킨다
		_this.Complete();
	}
}