////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                                던전 퍼즐 프랍 : 글라스 기브넨
//
//                                     eias erinys fecit, begins at 2004. 06. 21
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 글라스 기브넨의 상태는
//
//      default     : 스키닝 처리를 위한 기본 포즈
//      bound       : 벽에 매달린 상태
//      awakening   : 깨어나는 동작
//      released    : 깨어난 뒤에 남은 철골
//
////////////////////////////////////////////////////////////////////////////////

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
        26054,                  // 글라스 기브넨 99%
        `bound`,		    	// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        _name,                  // 이름
        `data/script/puzzle/prop/glasgavelen99.mint::QueryStateChange`,     // 상태 변화 여부 검사 핸들러
        `data/script/puzzle/prop/glasgavelen99.mint::OnStateChange`);       // 상태 변화 이벤트 핸들러
        
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
    // 유저가 여기다 대고 뭘 하겠나...
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
}




