////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던바튼 : 라비던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
//                                     hanstone@nexon.co.kr, edits at 2004. 10. 7
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
	case (1)	{	rewardRate = 0.30;	}
	case (2)	{	rewardRate = 0.25;	}
	case (3)	{	rewardRate = 0.20;	}
	case (4)	{	rewardRate = 0.17;	}
	case (5)	{	rewardRate = 0.17;	}
	case (6)	{	rewardRate = 0.165;	}
	case (7)	{	rewardRate = 0.16;	}
	case (8)	{	rewardRate = 0.155;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 360;
	int OriginalRewardMax = 740;
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
server string GetEventItemRewardDesc(character player)
// : 아이템 보상을 결정 
////////////////////////////////////////////////////////////////////////////////
{
	if (!player.IsInDungeon()) return ``;
	
	dungeon d = player.GetCurrentDungeon();
	if (!d.IsValid()) return ``;
	
	int bundleCount = d.GetEnterItemBundleCount();
	DebugOut(`번들카운트는?` + ToString(bundleCount));
	int randomSetId = 1005;

	if (bundleCount <= 4)
	{

	}
	else if (bundleCount <= 9)
	{
		randomSetId = 1006;
	}
	else if (bundleCount <= 14)
	{
		randomSetId = 1007;
	}
	else if (bundleCount <= 19)
	{
		randomSetId = 1008;
	}
	else if (bundleCount <= 24)
	{
		randomSetId = 1009;
	}
	else if (bundleCount <= 29)
	{
		randomSetId = 1010;
	}
	else if (bundleCount <= 34)
	{
		randomSetId = 1011;
	}
	else if (bundleCount <= 39)
	{
		randomSetId = 1012;
	}
	else if (bundleCount <= 44)
	{
		randomSetId = 1013;
	}
	else if (bundleCount <= 49)
	{
		randomSetId = 1014;
	}
	else if (bundleCount <= 54)
	{
		randomSetId = 1015;
	}
	else if (bundleCount <= 59)
	{
		randomSetId = 1016;
	}
	else if (bundleCount <= 64)
	{
		randomSetId = 1017;
	}
	else if (bundleCount <= 69)
	{
		randomSetId = 1018;
	}
	else if (bundleCount <= 74)
	{
		randomSetId = 1019;
	}
	else if (bundleCount <= 79)
	{
		randomSetId = 1020;
	}
	else if (bundleCount <= 84)
	{
		randomSetId = 1021;
	}
	else if (bundleCount <= 89)
	{
		randomSetId = 1022;
	}
	else if (bundleCount <= 94)
	{
		randomSetId = 1023;
	}
	else if (bundleCount <= 99)
	{
		randomSetId = 1024;
	}
	else
	{
		randomSetId = 1025;
	}
	DebugOut(`randomSetId?` + ToString(randomSetId));
	int itemIndex = GetItemIndexFromRandomSet(randomSetId, player);
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);

	return itemString;

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
        `single(Leprechaun_Stpatricksday:1)`);

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
		}
		// 종료시킨다
		_this.Complete();
	}
}




