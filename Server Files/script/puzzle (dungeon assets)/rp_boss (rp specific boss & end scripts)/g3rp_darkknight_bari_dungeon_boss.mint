////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             반호르 : 바리던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
//					jisangs@nexon.co.kr edits at 2005. 11. 13
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
	`center`,						// 배치 템플릿 이름 
	`single(ogrebros1:1)`);

	// 몬스터를 배치한다
	_this.AllocateMonster(
	0, 
	`boss2`,
	`center`,						// 배치 템플릿 이름 
	`single(ogrebrostaming:4)`);

	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
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
	//이 무식한 방법을 누가 좀 어떻게 해줘~
	if (_this.Get(`state1`) + _this.Get(`state2`) == `11`)
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

		// 종료시킨다
		_this.Complete();
	}
}



