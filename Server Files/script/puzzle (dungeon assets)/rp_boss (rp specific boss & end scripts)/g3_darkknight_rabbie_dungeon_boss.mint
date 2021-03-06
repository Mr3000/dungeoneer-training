////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던바튼 : 라비던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
//					jisangs@nexon.co.kr edits at 2005. 11. 13
////////////////////////////////////////////////////////// component of Mabinogi
//레이널드 RP까지 들어있는 복잡한 던전 보상.. 주의하자 -ㅁ-
//
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
	int OriginalRewardMin = 5600;
	int OriginalRewardMax = 22500;
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
				iCumRate += 18; //이 아이템이 나올 확률
			}
			case (1)
			{
				itemDesc = `id:51102 count:1~2`;	//마나허브
				iCumRate += 18; // 
			}
			case (2)	
			{
				itemDesc = `id:51003 count:1~2`;	//생명력 50 포션
				iCumRate += 18;
			}
			case (3)
			{
				itemDesc = `id:51008 count:1~2`;	//마나 50 포션
				iCumRate += 18;
			}
			case (4)
			{
				itemDesc = `id:51013 count:1~2`;	//스태미나 50 포션
				iCumRate += 18;
			}
		        //여기까지 총 90%
			case (5)
			{
				itemDesc = `id:71006 count:1~2`;	//스켈레톤 마족 스크롤(780G)
				iCumRate += 1;  
			}
			case (6)
			{
				itemDesc = `id:71007 count:1`;	//레드스켈레톤 마족 스크롤(개당 1110G)
				iCumRate += 1;  
			}
			case (7)
			{
				itemDesc = `id:71008 count:1`;	//메탈 스켈레톤 마족 스크롤(1590G)
				iCumRate += 1;  
			}
			case (8)
			{
				itemDesc = `id:71035 count:3~5`;	//회색 도시쥐 마족 스크롤(174G)
				iCumRate += 2;  
			}
			case (9)
			{
				itemDesc = `id:63110 count:1 expire:600`;	//라비 하급 마족 통행증
				iCumRate += 4;  
			}
			case (10)
			{
				itemDesc = `id:40005 count:1 durability:0 col1:FFE760`;	//황금숏소드(-ㅁ-) 내구깨진것
				iCumRate += 1;  
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
	`single(BlackSuccubus3:1)`);

	_this.Set(`state1`,`0`);


//바뀐 보상체계
//------------------------------------------------------------------------------

	puzzle_chest TreasureChest1;
	dungeon _dungeon = _this.GetDungeon();

	TreasureChest1 = _this.NewLockedChest(1, `4corner@*!`, `treasure1`);

	TreasureChest1.AddItem(`id:2000 count:190~840`);
	TreasureChest1.AddItem(`id:2000 count:190~840`);
	TreasureChest1.AddItem(`id:2000 count:190~840`);

	object_list cMemberList = _dungeon.GetCreatorList();
	character Leader=(character)cMemberList.GetValue(0);
	
	//아이템보상 넣기

	//인챈트 옵션 뽑기
	
	int iRandom = Random(3);
	int prefixid;
	int suffixid;

	switch (iRandom) {
	case (0)     prefixid = 206 ;
	case (1)     prefixid = 305 ;
	case (2)     prefixid = 303 ;
	}

	iRandom = Random(3);

	switch (iRandom) {
	case (0)     suffixid = 10504 ;
	case (1)     suffixid = 10605 ;
	case (2)     suffixid = 11206 ;
	}
	TreasureChest1.AddItem( `id:16015 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid));	//인챈트 아이템
	TreasureChest1.AddItem(GetItemRewardDesc());
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