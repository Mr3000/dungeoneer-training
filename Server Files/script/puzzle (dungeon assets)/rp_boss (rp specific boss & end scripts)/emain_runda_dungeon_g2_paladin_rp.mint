////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           이멘마하: 룬다던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
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
	`single(cyclops:1)`);

	_this.Set(`state1`,`0`);
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
		// 종료시킨다
		_this.Complete();
	}
}