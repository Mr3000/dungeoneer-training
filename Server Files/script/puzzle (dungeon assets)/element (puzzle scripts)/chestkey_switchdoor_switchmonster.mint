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
        string _arg1,   //스위치를 잘못 건드렸을때 나올 몬스터
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

    // 열쇠가 담긴 상자와 잠긴 문을 배치하는 퍼즐
    puzzle puzzle_1st;
    puzzle_1st = _this.DeclareSubPuzzle(
        `Locked`,         // 퍼즐 이름 (서버 내부에서 사용)
        `data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint`);

    puzzle_1st.AddPlaceToUse(`LockedPlace`); // 퍼즐의 0번 방

    puzzle_1st.Set(`mob1`, _arg1);

	puzzle_1st.Set(`activated`, `no`);
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

            // 0번 방의 공간은 스위치를 배치하는 데 사용하므로 다른 퍼즐에서
            // 사용할 수 없도록 만든다
            _place.DeclareReserveSpace();
        }
	}


}
////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplateMonsterAllocate(
		puzzle_template _this,
		puzzle _puzzle,
		string _name,
		bool _bSucceeded)
// : 퍼즐에서 몬스터 할당 이벤트가 발생했다
////////////////////////////////////////////////////////////////////////////////
{
	if (_bSucceeded)
	{
		// 몬스터에 열쇠를 추가한다
		_puzzle.FindMonster(_name).AddChestKey();

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
    _this.LockPlace(0, `Lock1`, `switch`);

    // 문을 열 수 있는 스위치를 만든다
    // 네개중 한개가 문을 연다
    puzzle_switch switch0;
    puzzle_switch switch1;
    puzzle_switch switch2;
    puzzle_switch switch3;


    switch0 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
        `Switch0`,		// 상자의 이름
	_this.GetLockColor(0),		// 스위치의 색깔
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

	_this.Set(switch0.GetName() +`state`, `no`);

    switch1 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
        `Switch1`,		// 상자의 이름
	_this.GetLockColor(0),		// 스위치의 색깔
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

	_this.Set(switch1.GetName() +`state`, `no`);

    switch2 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
        `Switch2`,		// 상자의 이름
	_this.GetLockColor(0),		// 스위치의 색깔
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

	_this.Set(switch2.GetName() +`state`, `no`);

    switch3 = _this.NewSwitch(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `4corner@*!`,   // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가
        `Switch3`,		// 상자의 이름
	_this.GetLockColor(0),		// 스위치의 색깔
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
	`data/script/puzzle/element/Chestkey_SwitchDoor_SwitchMonster.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

	_this.Set(switch3.GetName() +`state`, `no`);

	_this.Set(`open`,`Switch`+ ToString(Random(4)));
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnPuzzlePropEvent(
		puzzle _this,
		puzzle_prop _prop,
		string _event,
		string _arg1,
		string _arg2,
		string _arg3)
// : 스위치에 이벤트가 생길 경우 호출되는 함수
////////////////////////////////////////////////////////////////////////////////
{
    if (_prop.GetTypeName() == `puzzle_switch`)
    {
	    puzzle_switch _switch;
	    _switch = (puzzle_switch) _prop;

		if (_this.Get(`activated`) != `yes` )
		{
			//문을 열지 않은 상황에서만 아래의 처리를 한다.

			if (_switch.IsTurnedOn() && _this.Get(_switch.GetName() +`state`) != `yes`)
			{
				//건드린적이 없는 스위치를 켰을 경우

				if (_switch.GetName() == _this.Get(`open`).LowerCase())
				{
					//건드린 스위치의 이름이 'open'과 같은 경우

					_this.OpenPlace(0);
					_this.Set(`activated`, `yes`);

					// 대만 퍼즐 이벤트가 진행중인 경우
					if (IsCurrentEvent(`puzzle2008_taiwan`))
					{
						SwitchCounter(_this, (_this.GetDungeon()).GetCreatorList()) extern (`data/script/puzzle/Puzzle_Event_Taiwan.mint`);
						DebugOut(`스위치 체크_문 열렸다.`);
					}
				}
				else
				{
					//잘못된 스위치를 켰을때

					_this.AllocateMonster(
					0,
					_switch.GetName() + `Mob`, 		// 몬스터 이름
					`center@*!`,
					_this.Get(`mob1`));

					//이 스위치는 건드린 스위치임을 표시
					_this.Set(_switch.GetName() +`state`, `yes`);

					// 대만 퍼즐 이벤트가 진행중인 경우
					if (IsCurrentEvent(`puzzle2008_taiwan`))
					{
						SwitchCounter(_this, (_this.GetDungeon()).GetCreatorList()) extern (`data/script/puzzle/Puzzle_Event_Taiwan.mint`);
						DebugOut(`스위치 체크_몬스터 나왔다.`);
					}
				}
			}
		}
	}
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

	if(_curState == `off`)
	{
		_newState = `on`;
		return true;
	}
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

