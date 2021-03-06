////////////////////////////////////////////////////////////////////////////////
//						  Mabinogi Project Dungeon Puzzle Template
//									   던전 퍼즐 템플릿 : 분수 퍼즐
//
//									 capella begins at 2004. 12. 17
//									 capella@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplatePrepare(
		puzzle_template _this,
		string _arg1,	//체인몹1번
		string _arg2,	//체인몹2번
		string _arg3)	//체인몹3번 또는 싱글몹. 열쇠포함.
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	_this.DeclarePlace(`PropPlace`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	
	// 그냥 채집 가능 프랍만 있는 방을 추가한다
	puzzle Collect;
	Collect = _this.DeclareSubPuzzle(
		`Collect`,		 // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/element/C2_Relic_In_Dungeon.mint`);

	Collect.AddPlaceToUse(`PropPlace`); // 퍼즐의 0번 방
	Collect.Set(`propid`, _arg1);
	Collect.Set(`propstate`, _arg2);
}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//	  방번호 0 : 채집 프랍이 배치된 방
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
	OnPuzzlePlaceAdded(
		puzzle _this,
		int _index,
		puzzle_place _place)
// : 이 퍼즐에서 필요로 하는 장소가 추가되었다
//   해당 장소에 필요한 속성을 설정한다
////////////////////////////////////////////////////////////////////////////////
{
	switch (_index) {
	case (0)
		{
			// 0번 방의 공간은 퍼즐을 배치하는 데 사용하므로 다른 퍼즐에서
			// 사용할 수 없도록 만든다
			_place.DeclareReserveSpace();
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnPuzzleCreate(
		puzzle _this)	   // in)	  현재 생성 중인 퍼즐 인스턴스
// : 던전 층 생성시 불리는 핸들러,
//   필요한 퍼즐 요소를 할당하고 기본 상태를 정의한다
////////////////////////////////////////////////////////////////////////////////
{
	string propid = _this.Get(`propid`);
	int iPropId = propid.GetInteger();

	string propstate = _this.Get(`propstate`);
	puzzle_prop propCreated = _this.NewProp(
		iPropId,                  // 유적 이리아 스위치
		propstate,					// 초기 상태
		0,                 // 배치할 장소 인덱스
		`real_center`,      // 위치 템플릿
		`Switch1`,                  // 이름
		`data/script/puzzle/element/C2_Relic_In_Dungeon.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
		`data/script/puzzle/element/C2_Relic_In_Dungeon.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
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
