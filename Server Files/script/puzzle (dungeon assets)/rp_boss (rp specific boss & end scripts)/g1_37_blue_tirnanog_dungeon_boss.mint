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
	case (3)	{	rewardRate = 0.165;	}
	case (4)	{	rewardRate = 0.17;	}
	case (5)	{	rewardRate = 0.17;	}
	case (6)	{	rewardRate = 0.165;	}
	case (7)	{	rewardRate = 0.16;	}
	case (8)	{	rewardRate = 0.155;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 1250;
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

// : 아이템 보상을 결정
////////////////////////////////////////////////////////////////////////////////
{
	int iRandom = Random(4);
	string itemDesc;

	switch (iRandom) {
		case (0)	itemDesc = `id:62004 count:1~2`;	//마법가루
		case (1)	itemDesc = `id:51102 count:1~2`;	//마나허브
		case (2)	itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
		case (3)	itemDesc = `id:51008 count:1~2`;	//마나 50 포션
	}

	return itemDesc;
}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다

    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`boss1`,
        `boss_room00`,                           // 배치 템플릿 이름 
        `single(Lycanthrope1:1)`);

	// 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`boss2`,
        `boss_room00`,                           // 배치 템플릿 이름 
        `single(Lycanthrope2:1)`);
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`boss3`,
        `boss_room00`,                           // 배치 템플릿 이름 
        `single(Lycanthrope3:1)`);

	_this.Set(`state`,`0`);
	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);

	puzzle_prop TreasureChest1;

	// 보물 상자를 배치한다
	TreasureChest1 = New(_this, 1, `8corner@*!`, `treasure1`) 
		extern (`data/script/puzzle/prop/black_bead.mint`);

	TreasureChest1.AddItem(`id:73030`);

	CreateGargoyleProp(_this, 0, `real_center@1`, `gargoyle`) 
		extern (`data/script/puzzle/prop/tirnanog_gargoyle_prop.mint`);

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
				TreasureChest2 = _this.NewLockedChest(1, `8corner@*!`, `treasure2`);
				
				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest2.AddItem(moneyDesc);
				}
			}
			case (2)
			{
				TreasureChest3 = _this.NewLockedChest(1, `8corner@*!`, `treasure3`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest3.AddItem(moneyDesc);
				}
			}
			case (3)
			{
				TreasureChest4 = _this.NewLockedChest(1, `8corner@*!`, `treasure4`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest4.AddItem(moneyDesc);
				}
			}
			case (4)
			{
				TreasureChest5 = _this.NewLockedChest(1, `8corner@*!`, `treasure5`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest5.AddItem(moneyDesc);
				}
			}
			case (5)
			{
				TreasureChest6 = _this.NewLockedChest(1, `8corner@*!`, `treasure6`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest6.AddItem(moneyDesc);
				}
			}
			case (6)
			{
				TreasureChest7 = _this.NewLockedChest(1, `8corner@*!`, `treasure7`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest7.AddItem(moneyDesc);
				}
			}
			case (7)
			{
				TreasureChest8 = _this.NewLockedChest(1, `8corner@*!`, `treasure8`);

				for (j = 1 ; j <= MoneybagNum; ++j)
				{
					TreasureChest8.AddItem(moneyDesc);
				}
			}
			case (8)
			{

			}
		}
	}

	//아이템보상 넣기

	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest2.AddItem(GetItemRewardDesc());
			}
			case (2)
			{
				TreasureChest3.AddItem(GetItemRewardDesc());
			}
			case (3)
			{
				TreasureChest4.AddItem(GetItemRewardDesc());
			}
			case (4)
			{
				TreasureChest5.AddItem(GetItemRewardDesc());
			}
			case (5)
			{
				TreasureChest6.AddItem(GetItemRewardDesc());
			}
			case (6)
			{
				TreasureChest7.AddItem(GetItemRewardDesc());
			}
			case (7)
			{
				TreasureChest8.AddItem(GetItemRewardDesc());
			}
			case (8)
			{
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
	if (_name == `boss2`.LowerCase() && _remain == 0)
	{
		_this.Set(`state2`,`1`);
	}
	if (_name == `boss3`.LowerCase() && _remain == 0)
	{
		_this.Set(`state3`,`1`);
	}

	//이 무식한 방법을 누가 좀 어떻게 해줘~ (더 무식해졌습니다-.-)
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) == `111`)
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

