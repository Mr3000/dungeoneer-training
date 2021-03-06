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
	`boss1`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);
    _this.AllocateMonster(
        0, 
	`boss2`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);
    _this.AllocateMonster(
        0, 
	`boss3`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);
    _this.AllocateMonster(
        0, 
	`boss4`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);
    _this.AllocateMonster(
        0, 
	`boss5`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);
    _this.AllocateMonster(
        0, 
	`boss6`,
        `GhostArmorBoss@*!`,                           // 배치 템플릿 이름 
        `single(GhostArmor:1)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);
	_this.Set(`state4`,`0`);
	_this.Set(`state5`,`0`);
	_this.Set(`state6`,`0`);

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

	TreasureChest4.AddItem(`id:2000 count:250~1000`);
	TreasureChest4.AddItem(`id:2000 count:250~1000`);
	TreasureChest4.AddItem(`id:2000 count:250~1000`);

	TreasureChest2.AddItem(`id:2000 count:250~1000`);
	TreasureChest3.AddItem(`id:2000 count:250~1000`);

	CreateGargoyleProp(_this, 0, `real_center@1`, `gargoyle`) 
		extern (`data/script/puzzle/prop/tirnanog_gargoyle_prop.mint`);

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
	if (_name == `boss6`.LowerCase() && _remain == 0)
	{
		_this.Set(`state6`,`1`);
	}
	//이 무식한 방법을 누가 좀 어떻게 해줘~
	if (_this.Get(`state1`) + _this.Get(`state2`) + _this.Get(`state3`) + _this.Get(`state4`) + _this.Get(`state5`) + _this.Get(`state6`) == `111111`)
	{
		// 종료시킨다
		_this.Complete();
	}
}
