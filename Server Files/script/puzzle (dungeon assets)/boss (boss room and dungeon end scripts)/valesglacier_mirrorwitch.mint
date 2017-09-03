////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             티르코네일 : 알비던전 보스
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
	case (5)	{	rewardRate = 0.18;	}
	case (6)	{	rewardRate = 0.18;	}
	case (7)	{	rewardRate = 0.18;	}
	case (8)	{	rewardRate = 0.18;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 16300;
	int OriginalRewardMax = 40000;
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
	if (IsEnable(`featureTaiwanWeapon`) extern (`data/script/features.mint`))
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
					iCumRate += 18; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:51102 count:1~2`;	//마나 허브
					iCumRate += 18;
				}
				case (2)
				{
					itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
					iCumRate += 20;
				}
				case (3)
				{
					itemDesc = `id:51008 count:1~2`;	//마나 50 포션
					iCumRate += 20;
				}
				case (4)
				{
					itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
					iCumRate += 20;
				}
				case (5)
				{
					itemDesc = `id:40228`;	//레미니아 성월의 검
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
		return ``; //아이템이 안나왔다... '나오던거' 안나오겐 하지말자. 욕먹음. -ㅁ-
	}
	else
	{
		int iRandom = Random(5);
		string itemDesc;

		switch (iRandom) {
			case (0)	itemDesc = `id:62004 count:1~2`;	//마법가루
			case (1)	itemDesc = `id:51102 count:1~2`;	//마나허브
			case (2)	itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
			case (3)	itemDesc = `id:51008 count:1~2`;	//마나 50 포션
			case (4)	itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
		}

		return itemDesc;
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
	// 웬디고를 배치한다
	_this.AllocateMonster(
		0,
		`boss`,
		`boss_room00`,                           // 배치 템플릿 이름
		`single(Wendigo:1)`);

	int		i;

	// state 세팅
	_this.Set(`state`, `wendigo`);
	_this.Set(`state2`, `wendigo_live`);


	// 거울 프랍 생성
	puzzle_prop mirror;

	mirror = New(_this, 0, `mirror@1`, `mirror1`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@3`, `mirror2`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@` + ToString(5+Random(2)), `mirror3`) 	extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@8`, `mirror4`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);

	mirror = New(_this, 0, `mirror@9`, `mirror5`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@` + ToString(11+Random(2)), `mirror6`) 	extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@14`, `mirror7`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	mirror = New(_this, 0, `mirror@16`, `mirror8`) 				extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);

	/*
	for (i = 1; i <= 8; ++i)
	{
		puzzle_prop mirror = New(_this, 0, `mirror@` + ToString(i*2 + Random(2) - 1), `mirror` + ToString(i))
		        extern (`data/script/puzzle/prop/glacierruin_mirror.mint`);
	}
	*/


//바뀐 보상체계
//------------------------------------------------------------------------------


	//던전 생성한 사람중, 보스방 문을 여는 순간 접속중인 사람의 수
	dungeon _dungeon = _this.GetDungeon();

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

	int j;
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

	//개조석, 신규 무기, 신규 방어구 보상 지급 by eljjoo 2010-06-25\n	//개조석은 12883, 12884 두 종류 (푸른/붉은)
	if (IsEnable(`featureItemEnhance`) extern (`data/script/features.mint`)) //한국 G13S1 이후 아이템 강화 투입
	{
		int iEnhanceItemId = 0; //G13 신규 무기 ID, 0이면 안 나오는 것.
		int iEnhanceItemRate = 20; //G13 신규 무기 나올 확률. /10이 실제 확률
		int iEnhanceStonRate = 50; //개조석 나올 확률. /10이 실제 확률
		int iRandomEnhance; //확률 랜덤값 뽑아서 넣을 곳.
		//
		for (i=0 ; i<cMemberNum;i++)
		{
			iRandomEnhance = Random(1000);
			DebugOut(`상자`+ToString(i+1)+` 강화 무기 확률 :`+ToString(iRandomEnhance)+` - `+ToString(iEnhanceItemRate));
			if (iRandomEnhance <= iEnhanceItemRate && iEnhanceItemId != 0) //G13 신규 무기 나올 확률
			{
				switch (i)
				{
					case (0)
					{
						TreasureChest1.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (1)
					{
						TreasureChest2.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (2)
					{
						TreasureChest3.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (3)
					{
						TreasureChest4.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (4)
					{
						TreasureChest5.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (5)
					{
						TreasureChest6.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (6)
					{
						TreasureChest7.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
					case (7)
					{
						TreasureChest8.AddItem(`id:`+ToString(iEnhanceItemId)+` count:1`);
					}
				}
			}
			iRandomEnhance = Random(1000);
			DebugOut(`상자`+ToString(i+1)+` 강화석 확률 :`+ToString(iRandomEnhance)+` - `+ToString(iEnhanceStonRate));
			if (iRandomEnhance <= iEnhanceStonRate) //개조석 나올 확률
			{
				switch (i)
				{
					case (0)
					{
						TreasureChest1.AddItem(`id:12284 count:1`);
					}
					case (1)
					{
						TreasureChest2.AddItem(`id:12284 count:1`);
					}
					case (2)
					{
						TreasureChest3.AddItem(`id:12284 count:1`);
					}
					case (3)
					{
						TreasureChest4.AddItem(`id:12284 count:1`);
					}
					case (4)
					{
						TreasureChest5.AddItem(`id:12284 count:1`);
					}
					case (5)
					{
						TreasureChest6.AddItem(`id:12284 count:1`);
					}
					case (6)
					{
						TreasureChest7.AddItem(`id:12284 count:1`);
					}
					case (7)
					{
						TreasureChest8.AddItem(`id:12284 count:1`);
					}
				}
			}
		}
	}

	//인챈트 아이템 보상넣기
	if(IsEnable(`featurePersonalizeEnchant`) extern (`data/script/features.mint`)) //G11S2ex 이후 (전용화 인챈트 투입)
	{

		int iRandom = Random(100);

		if(iRandom<8)
		{
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11104`); //몽구스 위크니스 한손도끼
		}
		else if(iRandom<16)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20409  suffix:11104`); //사막여우 위크니스 한손도끼
		}
		else if(iRandom<24)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20615  suffix:11104`); //사막거미 위크니스 한손도끼
		}
		else if(iRandom<32)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11105`); //몽구스 헬스 한손도끼
		}
		else if(iRandom<40)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20409  suffix:11105`); //사막여우 헬스 한손도끼
		}
		else if(iRandom<48)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20615  suffix:11105`); //사막거미 헬스 한손도끼
		}
		else if(iRandom<56)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11106`); //몽구스 블러드 한손도끼
		}
		else if(iRandom<64)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20409 suffix:11106`); //사막여우 블러드 한손도끼
		}
		else if(iRandom<72)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20615 suffix:11106`); //사막거미 블러드 한손도끼
		}
		else if(iRandom<80)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:30820`); //몽구스 근육의 한손도끼
		}
		else if(iRandom<88)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20409 suffix:30820`); //사막여우 근육의 한손도끼
		}
		else if(iRandom<97)
		{ 
			TreasureChest1.AddItem(`id:40007 count:1 prefix:20615 suffix:30820`); //사막거미 근육의 한손도끼
		}
		else
		{
			TreasureChest1.AddItem(`id:62059 count:1 prefix:21013`); //개념의 인챈트 스크롤
		}
		
	}
	else
	{
		int iRandom = Random(12);
		switch(iRandom)
		{
			case (0)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11104`); //몽구스 위크니스 한손도끼
			}
			case (1)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20409  suffix:11104`); //사막여우 위크니스 한손도끼
			}
			case (2)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20615  suffix:11104`); //사막거미 위크니스 한손도끼
			}
			case (3)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11105`); //몽구스 헬스 한손도끼
			}
			case (4)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20409  suffix:11105`); //사막여우 헬스 한손도끼
			}
			case (5)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20615  suffix:11105`); //사막거미 헬스 한손도끼
			}
			case (6)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:11106`); //몽구스 블러드 한손도끼
			}
			case (7)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20409 suffix:11106`); //사막여우 블러드 한손도끼
			}
			case (8)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20615 suffix:11106`); //사막거미 블러드 한손도끼
			}
			case (9)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20209 suffix:30820`); //몽구스 근육의 한손도끼
			}
			case (10)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20409 suffix:30820`); //사막여우 근육의 한손도끼
			}
			case (11)
			{
				TreasureChest1.AddItem(`id:40007 count:1 prefix:20615 suffix:30820`); //사막거미 근육의 한손도끼
			}
		}
	}

	//아이템보상 넣기
	for (i = 1; i <= cMemberNum; ++i)
	{
		switch (i) {
			case (1)
			{
				TreasureChest1.AddItem(GetItemRewardDesc());	// 인챈트 아이템
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
	int _remain,
	character _killer,
	int _skillid)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `boss`.LowerCase())
	{
		// 웬디고에서 이펙트를 떼어줌
		{
			monster wendigo = _this.FindMonster(`boss`);
			object_list cMonsterList = wendigo.GetCharacterList();
			int monsternum = cMonsterList.GetSize();

			character	cChar;
			int		i;

			for (i = 0; i < monsternum;  i++)
			{
				cChar = (character)cMonsterList.GetValue(i);
				if (cChar.IsValid())
				{
					cChar.ShowEffect(`<effect type='wendigo_spirit' visible='0' />`);
				}
			}
		}


		if (_this.Get(`state`) == `wendigo`)
		{
			// 자이언트가 얼음 고드름 들고 죽였을 경우
			if (_killer.IsValid() && _killer.IsGiant())
			{
				int activepocket = 10;
				if (_killer.GetActiveWeaponSet() == 2)
				{
					activepocket = 11;
				}

				if (_killer.GetItemListInPocket(activepocket).GetSize()!=0 &&
					((item)_killer.GetItemListInPocket(activepocket).GetValue(0)).GetClassId() == 40189 &&	// 얼음 기둥
					(_skillid == 0 || _skillid == 20002 || _skillid == 20003 || _skillid == 22001))			// 평타, 스매시, 카운터, 윈드밀
				{
					// 거울 마녀 등장 루틴
					MirrorWitch_Appear(_this, _killer);
					_this.Set(`state`, `mirrorwitch`);
					_this.Set(`state2`, `wendigo_dead`);

					return;
				}
			}

			// 웬디고가 처음 죽었으나 얼음 고드름으로 죽이지 않은 경우
			{
				// 웬디고를 10초 후에 사라지게 처리
				monster wendigo = _this.FindMonster(`boss`);
				wendigo.ReserveRelease(10000);

				// 보상 처리 하고 complete
				AddFinalTreasureKeyToMember(_this);
				_this.Complete();
			}
			return;
		}
		else if (_this.Get(`state`) == `mirrorwitch`)
		{
			// 거울 마녀가
			// 웬디고가 죽었다는 표시만 하고 return
			_this.Set(`state2`, `wendigo_dead`);
			return;
		}
		else if (_this.Get(`state`) == `mirrorwitch_dead`)
		{
			// 거울 마녀가 죽은 상태에서 웬디고가 죽었다.
			{
				// 웬디고를 10초 후에 사라지게 처리
				monster wendigo = _this.FindMonster(`boss`);
				wendigo.ReserveRelease(10000);

				// 보상 및 complete 처리
				if (IsEnable(`featureBossCollectionBook`) extern (`data/script/features.mint`))	//일본은 보스몬스터의 증거를 추가한다
				{
					AddZinFinalTreasureKeyToMember(_this);
					_this.Complete();
				}
				else
				{
					AddFinalTreasureKeyToMember(_this);
					_this.Complete();
				}
			}
			return;
		}
	}
	else if ((_name == `zin_boss`.LowerCase() || _name == `real_zin_boss`.LowerCase()) && _remain == 0)
	{
		// 일단 거울 마녀가 죽었다는 표시를 한다.
		_this.Set(`state`, `mirrorwitch_dead`);

		// 만약 웬디고가 죽어 있으면
		// 보상 처리하고 complete 처리
		if (_this.Get(`state2`) == `wendigo_dead`)
		{
			// 웬디고를 10초 후에 사라지게 처리
			monster wendigo = _this.FindMonster(`boss`);
			wendigo.ReserveRelease(10000);

			if (IsEnable(`featureBossCollectionBook`) extern (`data/script/features.mint`))	//일본은 보스몬스터의 증거를 추가한다
			{
				AddZinFinalTreasureKeyToMember(_this);
				_this.Complete();
			}
			else
			{
				AddFinalTreasureKeyToMember(_this);
				_this.Complete();
			}

			return;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterRevived(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐 몬스터가 부활한 경우
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `boss`.LowerCase())
	{
		_this.Set(`state2`, `wendigo_live`);
	}
}


////////////////////////////////////////////////////////////////////////////////
server void AddFinalTreasureKeyToMember(
	puzzle _this)
// : 던전 멤버에게 보상방 키를 넣어줌
////////////////////////////////////////////////////////////////////////////////
{
	// 보상 처리
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

			// 클리어 저널 추가
			if (IsEnable(`featureDungeonAchievement`) extern (`data/script/features.mint`))
			{
				int default_achi = 2201;
				int dungeon_achi = 2202;
				int low_achi = default_achi+1;
				int com_achi = default_achi+4;
			
				if(!cChar.AchievementHas(dungeon_achi) && !cChar.AchievementHas(com_achi))
				{
					cChar.AchievementAdd(dungeon_achi);
				}

				if(cChar.AchievementHas(default_achi) && cChar.AchievementHas(low_achi))
				{
					cChar.AchievementRemove(default_achi);
					cChar.AchievementRemove(low_achi);
					cChar.AchievementAdd(com_achi);
				}
			}
		
		}
	}
}


////////////////////////////////////////////////////////////////////////////////
server void MirrorWitch_Appear(
	puzzle _this,
	character _killer)
// : 거울 마녀 등장 루틴
////////////////////////////////////////////////////////////////////////////////
{
	// 거울 마녀를 배치한다
	_this.AllocateMonster(
		0,
		`zin_boss`,
		`center`,                           // 배치 템플릿 이름
		`single(MirrorWitch:1)`);

	// 컷신 틀어줌
	dungeon _dungeon = _this.GetDungeon();

	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`iria_bossroom_mirrorwitch`);
	}


	// 프랍 중 랜덤하게 몇 개의 state를 바꿈
	_this.Set(`mirror_count`, `0`);
	for (i = 0; i <= 3; ++i)
	{
		puzzle_prop mirror = _this.FindProp(`mirror` + ToString(1 + (2 * i) + Random(2)));
		mirror.ChangeState(`revealed`, _killer);

		int mirrorcount = _this.Get(`mirror_count`).GetInteger() + 1;
		_this.Set(`mirror_count`, ToString(mirrorcount));
	}
}

////////////////////////////////////////////////////////////////////////////////
server void AddZinFinalTreasureKeyToMember(
	puzzle _this)
// : 던전 멤버에게 보상방 키를 넣어줌
////////////////////////////////////////////////////////////////////////////////
{
	// 보상 처리
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

	if (IsEnable(`featureBossCollectionBook`) extern (`data/script/features.mint`))	//일본은 보스몬스터의 증거를 추가한다
	{
		int iRandom;

		for (i = 1; i < cMemberNum + 1;  i++)	// 보물상자에 랜덤하게 아이템을 추가
		{
			puzzle_chest _treasureChest = (puzzle_chest)(_this.FindProp(`treasure` + ToString(i)));
			iRandom = Random(100);
	
			if (i == 1)
			{
				_treasureChest.AddItem(`id:75233`);	// 보스 몬스터의 증거
			}
		}
	}

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
			int default_achi = 2201;
			int dungeon_achi = 2202;
			int low_achi = default_achi+1;
			int com_achi = default_achi+4;
		
			if(!cChar.AchievementHas(dungeon_achi) && !cChar.AchievementHas(com_achi))
			{
				cChar.AchievementAdd(dungeon_achi);
			}

			if(cChar.AchievementHas(default_achi) && cChar.AchievementHas(low_achi))
			{
				cChar.AchievementRemove(default_achi);
				cChar.AchievementRemove(low_achi);
				cChar.AchievementAdd(com_achi);
			}
		}
	}
}

