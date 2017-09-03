////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Puzzle Template
//												   던전 퍼즐 템플릿 : 입구퍼즐
//
//									 eias erinys fecit, begins at 2004. 03. 19
//										eias@nexon.co.kr, sheplany@nownuri.net
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
		`data/script/puzzle/element/CollectProp_Mythril.mint`);

	Collect.AddPlaceToUse(`PropPlace`); // 퍼즐의 0번 방
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

			// 복도에 나오지 않게 하기 위해 방에 만든다.
			// - 2005/06/27 - yooari
			_place.DeclareRoom(); 
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
	//--------------------------------------------------------------------------
	// 채집 가능 프랍을 만든다
	puzzle_collect steel;	 // 철광석
	
	_this.NewCollectProp(
		304,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Ore@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
		`mythril1`);	  // 프랍의 이름
	_this.NewCollectProp(
		304,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Ore@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
		`mythril2`);	  // 프랍의 이름
	_this.NewCollectProp(
		304,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Ore@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
		`mythril3`);	  // 프랍의 이름
	_this.NewCollectProp(
		304,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Ore@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
		`mythril4`);	  // 프랍의 이름
}





