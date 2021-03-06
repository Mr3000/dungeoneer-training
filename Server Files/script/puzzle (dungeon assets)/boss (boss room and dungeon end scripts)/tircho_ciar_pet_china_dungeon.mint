////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             티르코네일 : 키아 초급 던전 보스
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
	case (1)	{	rewardRate = 0.2;	}
	case (2)	{	rewardRate = 0.19;	}
	case (3)	{	rewardRate = 0.18;	}
	case (4)	{	rewardRate = 0.17;	}
	case (5)	{	rewardRate = 0.16;	}
	case (6)	{	rewardRate = 0.16;	}
	case (7)	{	rewardRate = 0.16;	}
	case (8)	{	rewardRate = 0.16;	}
	}

	// 줘야 할 돈 액수 범위를 구한다
	int OriginalRewardMin = 4000;
	int OriginalRewardMax = 6000;
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
	if (GetLocale().LowerCase() == `china`)
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
					itemDesc = `id:12007  suffix:31011`;	//사자자리 데브캣 브로치
					iCumRate += 2; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:63075 count:5`;	//데브캣 불꽃 놀이
					iCumRate += 15; // 15/100
				}
				case (2)	
				{
					itemDesc = `id:18340`;	//데브캣 귀마개
					iCumRate += 5;
				}
				case (3)
				{
					itemDesc = `id:18341`;	//데브캣 모자
					iCumRate += 2;
				}
				case (4)
				{
					itemDesc = `id:16022`;	//고양이 손
					iCumRate += 4;
				}
				//여기까지 총 79%
				case (5)
				{
					itemDesc = `id:46018`;	//고양이 손 몽둥이
					iCumRate += 5;  
				}
				case (6)
				{
					itemDesc = `id:18113`;	//뾰족귀 고양이 모자
					iCumRate += 10;  
				}
				case (7)
				{
					itemDesc = `id:19038`;	//라바 캣 로브
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
	else if (GetLocale().LowerCase() == `korea`)
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(10000);
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
					itemDesc = `id:62005  suffix:30922 prefix:20109 `;	//인챈트(화이트호스+야생마)
					iCumRate += 1; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:18287`;	//원숭이탈
					iCumRate += 1; // 15/100
				}
				case (2)	
				{
					itemDesc = `id:18262`;	//클로버 돼지 모자
					iCumRate += 1;
				}
				case (3)
				{
					itemDesc = `id:18301`;	//호랑이 모자
					iCumRate += 5;
				}
				case (4)
				{
					itemDesc = `id:18581`;	//소의해 기념 모자
					iCumRate += 10;
				}
				case (5)
				{
					itemDesc = `id:18601`;	//빅 드래곤 크레스트
					iCumRate += 10;  
				}
				case (6)
				{
					itemDesc = `id:40002 col1:0000ee`;	//연습용 목도(파랑)
					iCumRate += 10;  
				}
				case (7)
				{
					itemDesc = `id:40002 col1:ee0000`;	//연습용 목도(빨강)
					iCumRate += 10;  
				}
				case (8)
				{
					itemDesc = `id:16526 col1:0000ff col2:ffffff`;	//뱀 건틀렛 (파랑+흰)
					iCumRate += 10;  
				}
				case (9)
				{
					itemDesc = `id:18342`;	//쥐 모자
					iCumRate += 50;  
				}
				case (10)
				{
					itemDesc = `id:18343`;	//쥐 모자
					iCumRate += 50;  
				}
				case (11)
				{
					itemDesc = `id:18344`;	//쥐 모자
					iCumRate += 50;  
				}
				case (12)
				{
					itemDesc = `id:18131`;	//양 모자
					iCumRate += 100;  
				}
				case (13)
				{
					itemDesc = `id:18060`;	//털 토끼 머리띠5
					iCumRate += 100;  
				}
				case (14)
				{
					itemDesc = `id:50233`;	//치킨 누들 콘소메
					iCumRate += 800;  
				}
				case (15)
				{
					itemDesc = `id:50215`;	//새우 개밥
					iCumRate += 800;  
				}
				case (16)
				{
					itemDesc = `id:63000`;	//피닉스의 깃털
					iCumRate += 1000;  
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
	else if (GetLocale().LowerCase() == `taiwan`)
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(10000);
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
					itemDesc = `id:62005  suffix:30922 prefix:20109 `;	//인챈트(화이트호스+야생마)
					iCumRate += 1; //이 아이템이 나올 확률
				}
				case (1)
				{
					itemDesc = `id:18287`;	//원숭이탈
					iCumRate += 1; // 15/100
				}
				case (2)	
				{
					itemDesc = `id:18262`;	//클로버 돼지 모자
					iCumRate += 1;
				}
				case (3)
				{
					itemDesc = `id:18301`;	//호랑이 모자
					iCumRate += 5;
				}
				case (4)
				{
					itemDesc = `id:18581`;	//소의해 기념 모자
					iCumRate += 10;
				}
				case (5)
				{
					itemDesc = `id:18601`;	//빅 드래곤 크레스트
					iCumRate += 10;  
				}
				case (6)
				{
					itemDesc = `id:40002 col1:0000ee`;	//연습용 목도(파랑)
					iCumRate += 10;  
				}
				case (7)
				{
					itemDesc = `id:40002 col1:ee0000`;	//연습용 목도(빨강)
					iCumRate += 10;  
				}
				case (8)
				{
					itemDesc = `id:16526 col1:0000ff col2:ffffff`;	//뱀 건틀렛 (파랑+흰)
					iCumRate += 10;  
				}
				case (9)
				{
					itemDesc = `id:18342`;	//쥐 모자
					iCumRate += 50;  
				}
				case (10)
				{
					itemDesc = `id:18343`;	//쥐 모자
					iCumRate += 50;  
				}
				case (11)
				{
					itemDesc = `id:18344`;	//쥐 모자
					iCumRate += 50;  
				}
				case (12)
				{
					itemDesc = `id:18131`;	//양 모자
					iCumRate += 100;  
				}
				case (13)
				{
					itemDesc = `id:18060`;	//털 토끼 머리띠5
					iCumRate += 100;  
				}
				case (14)
				{
					itemDesc = `id:50233`;	//치킨 누들 콘소메
					iCumRate += 800;  
				}
				case (15)
				{
					itemDesc = `id:50215`;	//새우 개밥
					iCumRate += 800;  
				}
				case (16)
				{
					itemDesc = `id:63000`;	//피닉스의 깃털
					iCumRate += 1000;  
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
	`boss`,
	`center`,                           // 배치 템플릿 이름 
	`single(SmallGolem3:1)`);

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

	//인챈트 아이템
	//인챈트 옵션 랜담선택
	int iRandom2 = Random(6);
	int suffixid;
	switch (iRandom2)  
	{
		case (0)     suffixid = 11105 ; //헬스
		case (1)     suffixid = 11106 ; //블러드
		case (2)     suffixid = 11205 ; //워터
		case (3)     suffixid = 11206 ; //파운테인
		case (4)     suffixid = 11304 ; //인내의
		case (5)     suffixid = 11305 ; //서스테이너
	}
	
	string EnchantitemDesc = `id:62005 count:1 suffix:` + ToString(suffixid);
	
	TreasureChest1.AddItem(EnchantitemDesc);
	
	
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




