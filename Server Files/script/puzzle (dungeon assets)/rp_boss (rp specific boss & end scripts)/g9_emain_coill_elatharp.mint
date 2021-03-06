////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             두갈드 : 두갈드 성 던전 보스
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     eias@nexon.co.kr, sheplany@nownuri.net
//                                     qwerty@nexon.co.kr, edits at 2003. 11. 15
//                                     jisangs@nexon.co.kr, edits at 2006. 03. 28
//                                     skyun40@nexon.co.kr, edits at 2006. 03. 28
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
	DebugOut(`두갈드 성 던전 보스룸 입장`);
	DebugOut(_this.GetDungeon().GetName());

	_this.Set(`state`,`0`);
	_this.Set(`state1`,`0`);
	_this.Set(`state2`,`0`);
	_this.Set(`state3`,`0`);
	_this.Set(`state4`,`0`);

	object_list	cCharList = _this.GetDungeon().GetPlayerList();
	character	leader = (character)cCharList.GetValue(0);
	if(_this.GetDungeon().GetPlayerList().GetSize() == 1)	// 리더가 혼자 입장했으면
	{
		MaleBoss_Incubus(_this);
		_this.Set(`state`,`0`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void MaleBoss_Incubus(
	puzzle _this)
// : 변신 후 인큐버스
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0,
	`Incubus`,
        `center`,                           // 배치 템플릿 이름
        `single(Incubus_ElathaRP:1)`);
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{

	if (_name == `Incubus`.LowerCase() && _remain == 0)
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

		//접속중인 Creator에게 키워드를 넣어준다
		for (i = 0; i < cMemberNum;  i++)
		{
			cChar = (character)cMemberList.GetValue(i);

			if (cChar.IsValid())
			{
				cChar.AddKeyword(`elatha_rp_clear`);	// rp 클리어 키워드 지급
			}
		}
		// 종료시킨다
		_this.Complete();
	}
}

