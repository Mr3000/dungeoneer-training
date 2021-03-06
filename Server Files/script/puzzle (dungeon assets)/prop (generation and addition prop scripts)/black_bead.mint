////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           던전 퍼즐 프랍 : 상자용의 검은 구슬
//
//                                     eias erinys fecit, begins at 2004. 06. 18
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server puzzle_prop
    New(
	    puzzle _puzzle,         // 프랍을 더할 퍼즐
	    int _index,             // 퍼즐 내의 장소 인덱스
	    string _positionTemplate,   // 위치 템플릿
	    string _name)           // 생성할 프랍의 퍼즐 이름
// : 프랍을 생성한다
////////////////////////////////////////////////////////////////////////////////
{
    puzzle_prop propCreated;
    
    propCreated = _puzzle.NewProp(
        25032,                  // 티르나노이_던전_검은구슬스위치
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        _name,                  // 이름
        `data/script/puzzle/prop/black_bead.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
        `data/script/puzzle/prop/black_bead.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
        
    propCreated.Set(`hit_left`, 5);
    
    return propCreated;
}

////////////////////////////////////////////////////////////////////////////////
server bool
    QueryStateChange(
        puzzle_prop _this,      // 프랍
        string _operation,      // 프랍에 행해진 동작
        string _curState,       // 프랍의 현재 상태
        string& _newState,      // out) 프랍의 새로운 상태
        character _invoker)     // 프랍에 동작을 수행한 캐릭터
// : 유저가 어떤 동작을 해서 상태 변화를 쿼리할 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_operation == `hit`)
	{
		int leftCount = (int) _this.Get(`hit_left`);
		--leftCount;
		_this.Set(`hit_left`, leftCount);

		DebugOut(["puzzle.prop.black_bead.1"]);

		if (_curState == `off`)
		{
			if (leftCount == 0)
			{
				DebugOut(["puzzle.prop.black_bead.2"]);
				_newState = `on`;

				//G1 진행상 이곳에 왔을 경우 메시지를 쏴준다.
				if (_invoker.HaveKeyword(`g1_36`))
				{
					_invoker.ShowCaption(["puzzle.prop.black_bead.3"]);
				}

				// 상태 변화가 일어났다는 의미의 true
				return true;
			}
			else
			{
			    DebugOut(["puzzle.prop.black_bead.4"]+ ToString(leftCount) + ["puzzle.prop.black_bead.5"]);
			}
		}
	}

	// 상태 변화가 일어나지 않았다는 의미의 false
	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void
    OnStateChange(
        puzzle_prop _this,      // 프랍
        string _oldState,       // 이전 상태
        string _newState,       // 새로운 상태
        character _invoker)     // 프랍에 동작을 수행한 캐릭터
// : 
////////////////////////////////////////////////////////////////////////////////
{
    if (_newState == `on`)
    {
        // 구슬이 부서졌다
        // 붙어있는 아이템을 떨어뜨려주자
        _this.DropItem(_invoker);
    }
}




