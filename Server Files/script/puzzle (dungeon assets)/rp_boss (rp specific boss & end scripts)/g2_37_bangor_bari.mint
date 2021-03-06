////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             반호르 : G2_37 황금 골렘
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
//                                     capella@nexon.co.kr, edits at 2004 11.
//                                     hanstone@nexon.co.kr, edits at 2004. 11.
//
//                                     뭔일있을땐 맨 윗줄에 있는 사람 순으로 물어보세요 와하하 by HanStone
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
	puzzle_chest TreasureChest1;
	puzzle_chest TreasureChest2;
	puzzle_chest TreasureChest3;
	puzzle_chest TreasureChest4;

	// 보물 상자를 배치한다?
	TreasureChest1 = _this.NewChest(1, `4corner@*!`, `treasure1`);
	TreasureChest2 = _this.NewChest(1, `4corner@*!`, `treasure2`);
	TreasureChest3 = _this.NewChest(1, `4corner@*!`, `treasure3`);
	TreasureChest4 = _this.NewChest(1, `4corner@*!`, `treasure4`);

}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `Redire`.LowerCase() && _remain == 0)
	{
		OnRedireCleared(_this.GetDungeon())
		extern(`data/script/dungeon/G2_37_Bangor_Barri_Dungeon.mint`);
		
		DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.1"]);
		
		monster pinky =  _this.FindMonster(`GoldGolem`);
		pinky.Release();				// 왜 핑키냐고 묻지마소오
		
		DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.2"]);
		
		_this.AllocateMonster(
		0, 
		`GoldGolem2`,
		`center`,						// 배치 템플릿 이름 
		`single(GoldenGolemWeak:1)`);		//황금골렘 약한넘
	}
	
	if (_name == `GoldGolem2`.LowerCase() && _remain == 0)
	{
		OnGoldGolemCleared(_this.GetDungeon())
		extern(`data/script/dungeon/G2_37_Bangor_Barri_Dungeon.mint`);
		
		DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.3"]);
		
		// 몬스터를 배치한다
		_this.AllocateMonster(
		0, 
		`Esras`,
		`center`,				// 배치 템플릿 이름 
		`single(Esras:1)`);		//에스라스
	}

	if (_name == `Esras`.LowerCase() && _remain == 0) //에스라스 쓰러지면 마지막 컷신
	{
		_this.Complete();
	}
}
////////////////////////////////////////////////////////////////////////////////
server void RedireAlloc(
	character me,
	object_list _cMemberList
	)
// : 활성화 요청을 받았다 
////////////////////////////////////////////////////////////////////////////////
{ 
	DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.4"]);
	puzzle _this;

	//컷신이 이 함수를 불러 저 멀리 별나라에서 던전을 다시 찾아온다
	// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
	_this = me.GetCurrentDungeon().GetFloor(me.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();
	
	_this.AllocateMonster(
	0, 
	`Redire`,
	`boss_room00`,				//배치 템플릿 이름
	`single(Redire:1)`);		//리다이어
	DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.5"]);

	DebugOut(["puzzle.rp_boss.g2_37_bangor_bari.6"]);
	// 몬스터를 배치한다
	_this.AllocateMonster(
	0, 
	`GoldGolem`,
	`boss_room00`,					// 배치 템플릿 이름 
	`single(GoldenGolem:1)`);			//황금골렘

	
}