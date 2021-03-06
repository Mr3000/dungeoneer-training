////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Puzzle Template
//										  던전 퍼즐 프랍 : 쿠르클레의 눈
//
//									 orcen begins at 2007. 09. 17
//										orcen@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server puzzle_prop
	New(
		puzzle _puzzle,		 // 프랍을 더할 퍼즐
		int _index,			 // 퍼즐 내의 장소 인덱스
		string _positionTemplate,   // 위치 템플릿
		string _name)		   // 생성할 프랍의 퍼즐 이름
// : 프랍을 생성한다
////////////////////////////////////////////////////////////////////////////////
{
	puzzle_prop propCreated;

	propCreated = _puzzle.NewProp(
		41132,				// 거울
		`default`,			// 초기 상태
		_index,				// 배치할 장소 인덱스
		_positionTemplate,		// 위치 템플릿
		_name,				// 이름
		``,	// 상태 변화 여부 검사 핸들러
		``);	// 상태 변화 이벤트 핸들러

	return propCreated;
}

////////////////////////////////////////////////////////////////////////////////
server bool
	QueryStateChange(
		puzzle_prop _this,	  // 프랍
		string _operation,	  // 프랍에 행해진 동작
		string _curState,	   // 프랍의 현재 상태
		string& _newState,	  // out) 프랍의 새로운 상태
		character _invoker)	 // 프랍에 동작을 수행한 캐릭터
// : 유저가 어떤 동작을 해서 상태 변화를 쿼리할 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 상태 변화가 일어나지 않았다는 뜻의 false
	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnStateChange(
		puzzle_prop _this,	  // 프랍
		string _oldState,	   // 이전 상태
		string _newState,	   // 새로운 상태
		character _invoker)	 // 프랍에 동작을 수행한 캐릭터
// : 
////////////////////////////////////////////////////////////////////////////////
{
}
