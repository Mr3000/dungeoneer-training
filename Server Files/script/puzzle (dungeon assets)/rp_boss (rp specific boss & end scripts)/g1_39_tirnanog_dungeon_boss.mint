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
	    `darklord`,
        `DarkLord_Final@1!`,
        `single(darklord2:1)`);

    _this.AllocateMonster(
        0, 
	    `ghostarmor`,
        `DarkLord_Final@*!`,
        `single(ghostarmor:2)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);

    // 글라스 기브넨 배치
	puzzle_prop glasGavelen = New(_this, 0, `real_center@1`, `glasgavelen99`)
        extern (`data/script/puzzle/prop/glasgavelen99.mint`);

    puzzle_chest TreasureChest1;
    puzzle_chest TreasureChest2;
    puzzle_chest TreasureChest3;
    puzzle_chest TreasureChest4;

	// 보물 상자를 배치한다?
	TreasureChest1 = _this.NewChest(1, `4corner@*!`, `treasure1`);
	TreasureChest2 = _this.NewChest(1, `4corner@*!`, `treasure2`);
	TreasureChest3 = _this.NewChest(1, `4corner@*!`, `treasure3`);
	TreasureChest4 = _this.NewChest(1, `4corner@*!`, `treasure4`);

	CreateGargoyleProp(_this, 0, `real_center@1`, `gargoyle`) 
		extern (`data/script/puzzle/prop/tirnanog_gargoyle_prop.mint`);

}

////////////////////////////////////////////////////////////////////////////////
server void SpawnGlasGavelen(
    puzzle _this)
// : 글라스 기브넨을 스폰한다
//   g1_event.mint::OnCutSceneEnded_G1_40_b_Chichol()에서 부른다
////////////////////////////////////////////////////////////////////////////////
{
    dungeon currentDungeon = _this.GetDungeon();

    // 묶여있는 글라스 기브넨을 풀려난 상태로 바꾼다
    puzzle_prop glasGavelen = _this.FindProp(`glasgavelen99`);
    glasGavelen.ChangeState(
        `released`,
        currentDungeon.GetPlayerLeader());  // 던전 생성자가 건드린 셈 친다

    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	    `boss`,
        `center`,                           // 배치 템플릿 이름 
        `single(GlasGhaibhleann:1)`);
		DebugOut(`진짜기브넨 소환`);
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `boss` && _remain == 0)
	{
		// 종료시킨다
		// G1_39_Tirnanog_Dungeon.mint에서 컷신을 틀어준다
		_this.Complete();
		return;
	}

	if (_name == `darklord`.LowerCase() && _remain == 0)
	{
		_this.Set(`state1`,`1`);
	}
	if (_name == `ghostarmor`.LowerCase() && _remain == 0)
	{
		_this.Set(`state2`,`1`);
	}
	if (_this.Get(`state1`) + _this.Get(`state2`) == `11`)
	{
	    // 다크로드를 잡았다, 컷신을 틀자
	    OnDarkLordDie(_this.GetDungeon()) 
	        extern (`data/script/dungeon/G1_39_Tirnanog_Dungeon.mint`);
	}

}




