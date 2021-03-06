////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             반호르 : 바리던전 보스
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
	case (1)	{	rewardRate = 0.3;	}
	case (2)	{	rewardRate = 0.32;	}
	case (3)	{	rewardRate = 0.35;	}
	case (4)	{	rewardRate = 0.3;	}
	case (5)	{	rewardRate = 0.25;	}
	case (6)	{	rewardRate = 0.20;	}
	case (7)	{	rewardRate = 0.15;	}
	case (8)	{	rewardRate = 0.1;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 4300;
	int OriginalRewardMax = 10800;
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
				iCumRate += 14; //이 아이템이 나올 확률
			}
			case (1)
			{
				itemDesc = `id:51102 count:1~2`;	//마나허브
				iCumRate += 15;
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
			//여기까지 59%
			case (5)
			{
				itemDesc = `id:71044 count:2~5`;	//임프 마족 스크롤(개당 270G)    //마족스크롤보상은 총 5~10%정도로(비싼마족은 쪼금주자)
				iCumRate += 5;
			}
			case (6)
			{
				itemDesc = `id:71044 count:2~4`;	//고블린 마족 스크롤(개당 310G)
				iCumRate += 5;
			}
			case (7)
			{
				itemDesc = `id:40025 count:1 durability:0 col1:c00010`;	//곡굉이(750G) //
				iCumRate += 1;
			}
			case (8)
			{
				itemDesc = `id:63113 count:1 expire:600`;	//바리 하급 마족 통행증
				iCumRate += 5;
			}
			case (9)
			{
				itemDesc = `id:60039 count:3~5`;	//마족의 문장
				iCumRate += 10;
			}
			case (10)
			{
				itemDesc = `id:63133 count:1 expire:360`;	//바리 상급 2인 마족 통행증
				iCumRate += 5;
			}
			case (11)
			{
				itemDesc = `id:63134 count:1 expire:360`;	//바리 상급 3인 마족 통행증
				iCumRate += 5;
			}
			case (12)
			{
				itemDesc = `id:63135 count:1 expire:360`;	//바리 상급 무제한 마족 통행증
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
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss1`,
	`center`,						// 배치 템플릿 이름
	`single(ShadowWarrior:1)`);

	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss2`,
	`center`,						// 배치 템플릿 이름
	`single(ShadowFighter2:1)`);
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss3`,
	`center`,						// 배치 템플릿 이름
	`single(ShadowLancer3:1)`);
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss4`,
	`center`,						// 배치 템플릿 이름
	`single(ShadowArcher3:1)`);
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0,
	`boss5`,
	`center`,						// 배치 템플릿 이름
	`single(ShadowAlchemist:1)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);
	_this.Set(`state4`,`0`);
	_this.Set(`state5`,`0`);


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

	int i, j;
	int MoneybagNum;
	string moneyDesc = GetMoneyBagDesc(cMemberNum, MoneybagNum);

	TreasureChest1 = _this.NewLockedChest(1, `8corner@*!`, `treasure1`);

	for (j = 1 ; j <= MoneybagNum; ++j)
	{
		TreasureChest1.AddItem(moneyDesc);
	}

//	TreasureChest1.AddItem(`id:75223`);		// 그림자 거울

	//인챈트 아이템 보상넣기


	TreasureChest1.AddItem(GetItemRewardDesc());
	// 보상 아이템 넣기
	AddEventReward(_dungeon.GetName(), TreasureChest1, i) extern (`data/script/puzzle/boss/Event_Reward.mint`);
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
	if (_name == `boss4`.LowerCase() && _remain == 0)
	{
		_this.Set(`state4`,`1`);
	}
	if (_name == `boss5`.LowerCase() && _remain == 0)
	{
		_this.Set(`state5`,`1`);
	}
	//이 무식한 방법을 누가 좀 어떻게 해줘~
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) + _this.Get(`state5`) == `11111`)
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
				cChar.AddItemWithEffect(`id:70028 lock:chest`);
			}
		}
		// 종료시킨다
		_this.Complete();
	}
}



