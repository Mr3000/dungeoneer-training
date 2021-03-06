////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                               던전 퍼즐 템플릿 : 열쇠 담긴 상자와 몬스터 트랩
//
//                                     eias erinys fecit, begins at 2003. 11. 06
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
    OnTemplatePrepare(
        puzzle_template _this,
        string _arg1,
        string _arg2,
        string _arg3)
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
    //--------------------------------------------------------------------------
    // 이 퍼즐 템플릿에서 사용할 장소를 선언한다
    
    _this.DeclarePlace(`LockedPlace`);

    //--------------------------------------------------------------------------
    // 퍼즐을 선언한다
    
    // 스위치가 배치된 잠긴 문 퍼즐
    puzzle puzzle_1st;
    puzzle_1st = _this.DeclareSubPuzzle(
        `Locked`,         // 퍼즐 이름 (서버 내부에서 사용)
        `data/script/puzzle/test/SwitchDoorTest.mint`);

    puzzle_1st.AddPlaceToUse(`LockedPlace`); // 퍼즐의 0번 방
}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//      방번호 0 : 잠길 문이 있는 방, 문만 잠그면 되고 공간은 사용하지 않는다
//      방번호 1 : 열쇠가 배치될 방, 상자와 몬스터를 배치하므로 공간을 예약한다
//                 또, 트랩으로 문을 닫을 것이므로 문도 예약한다
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
            // 0번 방의 출구를 잠근다
		    _place.DeclareLockSelf();

            // 0번 방의 공간은 퍼즐을 배치하는 데 사용하므로 다른 퍼즐에서
            // 사용할 수 없도록 만든다
            _place.DeclareReserveSpace();
		}
    }
}

////////////////////////////////////////////////////////////////////////////////
server void
    OnPuzzleCreate(
        puzzle _this)       // in)      현재 생성 중인 퍼즐 인스턴스
// : 던전 층 생성시 불리는 핸들러,
//   필요한 퍼즐 요소를 할당하고 기본 상태를 정의한다
////////////////////////////////////////////////////////////////////////////////
{
    //--------------------------------------------------------------------------
    // 먼저 출구를 막는다
    _this.LockPlace(0, `Lock1`, `key`);

    // 막은 문을 열 수 있는 열쇠를 만든다
    puzzle_switch switch1;
    puzzle_switch switch2;
    puzzle_switch switch3;
    puzzle_switch switch4;
    
    switch1 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
        `Switch1`,		// 상자의 이름
        _this.GetLockColor(0));

    switch2 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
        `Switch2`,		// 상자의 이름
        _this.GetLockColor(0));

    switch3 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
        `Switch3`,		// 상자의 이름
        _this.GetLockColor(0));

    switch4 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
        `Switch4`,		// 상자의 이름
        _this.GetLockColor(0));
}




