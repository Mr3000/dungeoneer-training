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
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["puzzle.boss.dunbarton_rabbie_succubus.1"]);
	_this.Set(`state`,`0`);
	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);

	if (_this.GetDungeon().GetName() == `RP_Ranald_Dunbarton_Rabbie_Dungeon`)
	{
		RanaldRP(_this);
	}
	if( _this.GetDungeon().GetPlayerList().GetSize() ==1 ) 
	{
		SinglePlay(_this);
	}
	else 
	{
		PartyPlay(_this);
	}

}
////////////////////////////////////////////////////////////////////////////////
server void PartyPlay(
	puzzle _this)
// : 파티플레이인 경우 골드고블린
////////////////////////////////////////////////////////////////////////////////
{

    // 몬스터를 배치한다

    _this.AllocateMonster(
        0, 
	`goblin`,
        `center`,                           // 배치 템플릿 이름 
        `single(Goblin:1)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);

    puzzle_chest TreasureChest1;
    puzzle_chest TreasureChest2;
    puzzle_chest TreasureChest3;
    puzzle_chest TreasureChest4;

	// 보물 상자를 배치한다
	TreasureChest1 = _this.NewChest(1, `4corner@*!`, `treasure1`);
	TreasureChest2 = _this.NewChest(1, `4corner@*!`, `treasure2`);
	TreasureChest3 = _this.NewChest(1, `4corner@*!`, `treasure3`);
	TreasureChest4 = _this.NewChest(1, `4corner@*!`, `treasure4`);

	//상금
	TreasureChest1.AddItem(`id:2000 count:250~1000`);
	TreasureChest2.AddItem(`id:2000 count:250~1000`);
	TreasureChest3.AddItem(`id:2000 count:250~1000`);
	TreasureChest4.AddItem(`id:2000 count:250~1000`);

	TreasureChest1.AddItem(`id:2000 count:250~1000`);
	TreasureChest1.AddItem(`id:2000 count:250~1000`);
	TreasureChest1.AddItem(`id:2000 count:250~1000`);

	TreasureChest2.AddItem(`id:2000 count:250~1000`);
	TreasureChest3.AddItem(`id:2000 count:250~1000`);

	TreasureChest2.AddItem(`id:51102 count:1~3`);	//마나허브
	TreasureChest3.AddItem(`id:62004 count:1~3`);	//마법가루

	int iRandom = Random(3);
	int suffixid;

	switch (iRandom) {
	case (0)     suffixid = 10504 ;
	case (1)     suffixid = 10605 ;
	case (2)     suffixid = 11205 ;
	}

	//인챈트스크롤
	TreasureChest4.AddItem(`id:16015 count:1 suffix:` + ToString(suffixid) );

	// 보상 아이템 넣기
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest1, 1) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest2, 2) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest3, 3) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest4, 4) extern (`data/script/puzzle/boss/Event_Reward.mint`);

//코인 이벤트. 2005년 2월에 삭제한다.
	/*
	if (GetYear() == 2004 && (GetDate() >=1220 || GetDate() <=125))
	{
		TreasureChest1.AddItem(`id:52033 count:3~8`);

		TreasureChest2.AddItem(`id:52033 count:3~8`);

		TreasureChest3.AddItem(`id:52033 count:3~8`);

		TreasureChest4.AddItem(`id:52033 count:3~8`);

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
	if (_this.Get(`state`) == `1`)
	{
	    if (_remain == 0)
	    {
		_this.AllocateMonster(
			0, 
			`boss`,
			`center`,                           // 배치 템플릿 이름 
			`single(goldgoblin:12)`);
		
		_this.AllocateMonster(
			0, 
			`minion`, 
			`center`,                           // 배치 템플릿 이름 
			`single(goblinarcher:6)`);
	    }
	}
	else
	if (_this.Get(`state`) == `2`)
	{
		if (_name == `boss`.LowerCase() && _remain == 0)
		{

			_this.Set(`state1`,`1`);
		}
		if (_name == `minion`.LowerCase() && _remain == 0)
		{
			_this.Set(`state2`,`1`);
		}
		if (_this.Get(`state1`) + _this.Get(`state2`) == `11`)
		{
			// 종료시킨다
			_this.Complete();
		}
	}

	if (_name == `succubus`.LowerCase() && _remain == 0)
	{
		// 종료시킨다
		_this.Complete();
	}


}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterAllocate(
	puzzle _this,
	string _name,
	bool _succeeded)
// : 몬스터 할당시마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `goblin`.LowerCase())
	{
		if (_succeeded)
		{
			// 퍼즐 시작
			_this.Set(`state`, `1`);
		
			// 드랍할 아이템 추가
			_this.FindMonster(`goblin`).AddItem(`id:2000 count:100`);
		}
	}
	else if (_name == `boss`.LowerCase())
	{
		if (_succeeded)
		{
			// 퍼즐 진행
			_this.Set(`state`, `2`);
		}
		else
		{
			// 할당 실패, 퍼즐 종료
			_this.Complete();
		}
	}
	else if (_name == `minion`.LowerCase())
	{
		if (_succeeded)
		{
			// 퍼즐 진행
			_this.Set(`state`, `2`);
		}
		else
		{
			// 할당 실패, 퍼즐 종료
			_this.Complete();
		}
	}

}



////////////////////////////////////////////////////////////////////////////////
server void SinglePlay(
	puzzle _this)
// : 혼자 들어왔을 경우 블랙 서큐버스
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`succubus`,
        `center`,                           // 배치 템플릿 이름 
        `single(BlackSuccubus:1)`);

    puzzle_chest TreasureChest1;
    puzzle_chest TreasureChest2;
    puzzle_chest TreasureChest3;
    puzzle_chest TreasureChest4;

	// 보물 상자를 배치한다
	TreasureChest1 = _this.NewChest(1, `4corner@*!`, `treasure1`);
	TreasureChest2 = _this.NewChest(1, `4corner@*!`, `treasure2`);
	TreasureChest3 = _this.NewChest(1, `4corner@*!`, `treasure3`);
	TreasureChest4 = _this.NewChest(1, `4corner@*!`, `treasure4`);

	//상금
	TreasureChest1.AddItem(`id:2000 count:200~600`);
	TreasureChest1.AddItem(`id:2000 count:200~600`);
	TreasureChest2.AddItem(`id:2000 count:200~600`);
	TreasureChest2.AddItem(`id:2000 count:200~600`);
	TreasureChest3.AddItem(`id:2000 count:200~600`);
	TreasureChest3.AddItem(`id:2000 count:200~600`);
	TreasureChest4.AddItem(`id:2000 count:200~600`);
	TreasureChest4.AddItem(`id:2000 count:200~600`);

	TreasureChest1.AddItem(`id:2000 count:50~600`);
	TreasureChest1.AddItem(`id:2000 count:50~600`);
	TreasureChest2.AddItem(`id:2000 count:50~600`);
	TreasureChest2.AddItem(`id:2000 count:50~600`);
	TreasureChest3.AddItem(`id:2000 count:50~600`);
	TreasureChest3.AddItem(`id:2000 count:50~600`);

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

	//인챈트스크롤
	TreasureChest4.AddItem(`id:16015 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid) );

	// 보상 아이템 넣기
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest1, 1) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest2, 2) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest3, 3) extern (`data/script/puzzle/boss/Event_Reward.mint`);
	AddEventReward(_this.GetDungeon().GetName(), TreasureChest4, 4) extern (`data/script/puzzle/boss/Event_Reward.mint`);
}

////////////////////////////////////////////////////////////////////////////////
server void RanaldRP(
	puzzle _this)
// : 혼자 들어왔을 경우 블랙 서큐버스
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`succubus`,
        `center`,                           // 배치 템플릿 이름 
        `single(BlackSuccubus2:1)`);

    puzzle_chest TreasureChest1;
    puzzle_chest TreasureChest2;
    puzzle_chest TreasureChest3;
    puzzle_chest TreasureChest4;

	// 보물 상자를 배치한다
	TreasureChest1 = _this.NewChest(1, `4corner@*!`, `treasure1`);
	TreasureChest2 = _this.NewChest(1, `4corner@*!`, `treasure2`);
	TreasureChest3 = _this.NewChest(1, `4corner@*!`, `treasure3`);
	TreasureChest4 = _this.NewChest(1, `4corner@*!`, `treasure4`);

	//상금
	TreasureChest1.AddItem(`id:2000 count:200~600`);
	TreasureChest1.AddItem(`id:2000 count:200~600`);
	TreasureChest2.AddItem(`id:2000 count:200~600`);
	TreasureChest2.AddItem(`id:2000 count:200~600`);
	TreasureChest3.AddItem(`id:2000 count:200~600`);
	TreasureChest3.AddItem(`id:2000 count:200~600`);
	TreasureChest4.AddItem(`id:2000 count:200~600`);
	TreasureChest4.AddItem(`id:2000 count:200~600`);

	TreasureChest1.AddItem(`id:2000 count:50~600`);
	TreasureChest1.AddItem(`id:2000 count:50~600`);
	TreasureChest2.AddItem(`id:2000 count:50~600`);
	TreasureChest2.AddItem(`id:2000 count:50~600`);
	TreasureChest3.AddItem(`id:2000 count:50~600`);
	TreasureChest3.AddItem(`id:2000 count:50~600`);

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

	//인챈트스크롤
	TreasureChest4.AddItem(`id:16015 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid) );

}