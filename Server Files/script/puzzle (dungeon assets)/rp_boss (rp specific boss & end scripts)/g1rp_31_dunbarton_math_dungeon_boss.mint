////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던바튼 : 라비던전 보스
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
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`boss`,
        `center`,                           // 배치 템플릿 이름 
        `single(GhostArmor:6)`);


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
	TreasureChest1.AddItem(`id:2000 count:200~1000`);
	TreasureChest2.AddItem(`id:2000 count:200~1000`);
	TreasureChest3.AddItem(`id:2000 count:200~1000`);
	TreasureChest4.AddItem(`id:2000 count:200~1000`);

	TreasureChest1.AddItem(`id:2000 count:200~1000`);
	TreasureChest1.AddItem(`id:2000 count:200~1000`);
	TreasureChest1.AddItem(`id:2000 count:200~1000`);

	TreasureChest2.AddItem(`id:2000 count:200~1000`);
	TreasureChest3.AddItem(`id:2000 count:200~1000`);

	TreasureChest2.AddItem(`id:51102 count:1~3`);	//마나허브
	TreasureChest3.AddItem(`id:62004 count:1~3`);	//마법가루

	int iRandom = Random(3);
	int prefixid;
	int suffixid;

	switch (iRandom) {
	case (0)     prefixid = 4 ;
	case (1)     prefixid = 1506 ;
	case (2)     prefixid = 1707 ;
	}

	iRandom = Random(3);

	switch (iRandom) {
	case (0)     suffixid = 10806 ;
	case (1)     suffixid = 10504 ;
	case (2)     suffixid = 10706 ;
	}

	iRandom = Random(3);

	//인챈트스크롤 또는 옵션 달린 류트를 준다.

	switch (iRandom) {
	case (0)	TreasureChest4.AddItem(`id:40004 count:1 prefix:` + ToString(prefixid) + ` suffix:` + ToString(suffixid) );
	case (1)	TreasureChest4.AddItem(`id:40004 count:1 prefix:` + ToString(prefixid) );
	case (2)	TreasureChest4.AddItem(`id:40004 count:1 suffix:` + ToString(suffixid) );
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
	if (_name == `boss`.LowerCase() && _remain == 3)
	{
		// 종료시킨다
		_this.Complete();
	}

}




