////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           던전 퍼즐 프랍 : 상자용의 검은 구슬
//
//                                     eias erinys fecit, begins at 2004. 06. 18
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
Server void
    CreateGargoyleProp(
	    puzzle _puzzle,         // 프랍을 더할 퍼즐
	    int _index,             // 퍼즐 내의 장소 인덱스
	    string _positionTemplate,   // 위치 템플릿
	    string _name)           // 생성할 프랍의 퍼즐 이름
// : 프랍을 생성한다
////////////////////////////////////////////////////////////////////////////////
{
    puzzle_prop gargoyleProp1;
	puzzle_prop gargoyleProp2;
	puzzle_prop gargoyleProp3;
	puzzle_prop gargoyleProp4;
	puzzle_prop gargoyleProp5;
	puzzle_prop gargoyleProp6;
    
    gargoyleProp1 = _puzzle.NewProp(
        29001,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle1`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
    gargoyleProp2 = _puzzle.NewProp(
        29002,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle2`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
    gargoyleProp3 = _puzzle.NewProp(
        29003,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle3`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
    gargoyleProp4 = _puzzle.NewProp(
        29004,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle4`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
    gargoyleProp5 = _puzzle.NewProp(
        29005,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle5`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
    gargoyleProp6 = _puzzle.NewProp(
        29006,                  // 티르나노이_던전_보스방_가고일
        `off`,					// 초기 상태
        _index,                 // 배치할 장소 인덱스
        _positionTemplate,      // 위치 템플릿
        `gargoyle6`,                  // 이름
        ``,    // 상태 변화 여부 검사 핸들러
        ``);      // 상태 변화 이벤트 핸들러
        
}

