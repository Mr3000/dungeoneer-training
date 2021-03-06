////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던전 퍼즐 템플릿 :몬스터 체인 배치
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                        eias@nexon.co.kr, sheplany@nownuri.net
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
    puzzle _Puzzle)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _Puzzle.AllocateMonster(
        0, 
        `ChainMob1`,
        `center`,					// 배치 템플릿 이름 
         _Puzzle.Get(`mob1`));
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterAllocate(
	puzzle _this,
	string _name,
	bool _succeeded)
// : 몬스터 할당시마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `ChainMob1`.LowerCase())
	{
		if (_succeeded)
		{
			// 퍼즐 시작
			_this.Set(`state`, `1`);
			
		}
	}
	else if (_name == `ChainMob2`.LowerCase())
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
	else if (_name == `Mob_Last`.LowerCase())
	{
		if (_succeeded)
		{
	        _this.Set(`state`, `3`);
		}
		else
		{
			// 할당 실패, 퍼즐 종료
			_this.Complete();
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
    puzzle _Puzzle,
    string _name,
    int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	if (_remain == 0)
	{
	    if (_Puzzle.Get(`state`) == `1`)
	    {
		    _Puzzle.AllocateMonster(
		        0, 
		        `ChainMob2`,
		        `center`,					// 배치 템플릿 이름 
             _Puzzle.Get(`mob2`));
	    }
	    else if (_Puzzle.Get(`state`) == `2`)
	    {
		    _Puzzle.AllocateMonster(
		        0, 
		        `Mob_Last`,
		        `center`,					// 배치 템플릿 이름 
             _Puzzle.Get(`mob3`));
	    }
	    else
	    {
		    // 종료시킨다
		    _Puzzle.Complete();
	    }
	}
}




