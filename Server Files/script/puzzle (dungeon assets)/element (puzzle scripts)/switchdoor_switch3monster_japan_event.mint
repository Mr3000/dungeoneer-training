////////////////////////////////////////////////////////////////////////////////
//							Mabinogi Project Dungeon Puzzle Template
//							던전 퍼즐 템플릿 : 세 스위치와 세 종류의 몬스터 트랩
//
//							eias erinys fecit, begins at 2003. 11. 06
//							eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////
server string
	Shuffle(string _strFrom)
{
	string strTo;

	int i;
	while (_strFrom.GetLength() > 0)
	{
		int iPosition = Random(1024) % _strFrom.GetLength();
		strTo += _strFrom.Mid(iPosition, 1);
		_strFrom = _strFrom.Left(iPosition) + _strFrom.Mid(iPosition + 1);
	}
	return strTo;
}
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
	string strRandom = Shuffle(`0123`);

	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	_this.DeclarePlace(`LockedPlace`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	
	// 열쇠가 담긴 상자와 잠긴 문을 배치하는 퍼즐
	puzzle puzzle_1st;
	puzzle_1st = _this.DeclareSubPuzzle(
		`Locked`,		 // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint`);

	puzzle_1st.AddPlaceToUse(`LockedPlace`); // 퍼즐의 0번 방

	//랜덤으로 몬스터외 열리는 스위치를 겹치지 않게 배치.
	puzzle_1st.Set(`mob`+strRandom.Mid(0,1), _arg1);
	puzzle_1st.Set(`mob`+strRandom.Mid(1,1), _arg2);
	puzzle_1st.Set(`mob`+strRandom.Mid(2,1), _arg3);
	puzzle_1st.Set(`open`,`Switch`+ strRandom.Mid(3,1));
	puzzle_1st.Set(`activated`, `no`);
}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//	  방번호 0 : 잠길 문이 있는 방, 문만 잠그면 되고 공간은 사용하지 않는다
//	  방번호 1 : 열쇠가 배치될 방, 상자와 몬스터를 배치하므로 공간을 예약한다
//				 또, 트랩으로 문을 닫을 것이므로 문도 예약한다
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
	OnPuzzleCreate(
		puzzle _this)	   // in)	  현재 생성 중인 퍼즐 인스턴스
// : 던전 층 생성시 불리는 핸들러,
//   필요한 퍼즐 요소를 할당하고 기본 상태를 정의한다
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 먼저 출구를 막는다
	_this.LockPlace(0, `Lock1`, `switch`);

	// 문을 열 수 있는 스위치를 만든다
	// 네개중 한개가 문을 연다

	puzzle_prop switch0 = _this.NewProp(
		10202,                  // 유적 이리아 스위치
		`off`,					// 초기 상태
		0,                 // 배치할 장소 인덱스
		`4corner@*!`,      // 위치 템플릿
		`switch0`,                  // 이름
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
	switch0.SetColor(1, _this.GetLockColor(0));
	_this.Set(switch0.GetName() +`state`, `no`);
	
	puzzle_prop switch1 = _this.NewProp(
		10202,                  // 유적 이리아 스위치
		`off`,					// 초기 상태
		0,                 // 배치할 장소 인덱스
		`4corner@*!`,      // 위치 템플릿
		`switch1`,                  // 이름
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
	switch1.SetColor(1, _this.GetLockColor(0));
	_this.Set(switch1.GetName() +`state`, `no`);
	
	puzzle_prop switch2 = _this.NewProp(
		10202,                  // 유적 이리아 스위치
		`off`,					// 초기 상태
		0,                 // 배치할 장소 인덱스
		`4corner@*!`,      // 위치 템플릿
		`switch2`,                  // 이름
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
	switch2.SetColor(1, _this.GetLockColor(0));
	_this.Set(switch2.GetName() +`state`, `no`);
	
	puzzle_prop switch3 = _this.NewProp(
		10202,                  // 유적 이리아 스위치
		`off`,					// 초기 상태
		0,                 // 배치할 장소 인덱스
		`4corner@*!`,      // 위치 템플릿
		`switch3`,                  // 이름
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
		`data/script/puzzle/element/SwitchDoor_Switch3Monster_Japan_Event.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러
	switch3.SetColor(1, _this.GetLockColor(0));
	_this.Set(switch3.GetName() +`state`, `no`);

}

////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplatePropEvent(
		puzzle_template _template,
		puzzle _this,
		puzzle_prop _prop,
		string _event,
		string _arg1,
		string _arg2,
		string _arg3)
// : 스위치에 이벤트가 생길 경우 호출되는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_prop.GetTypeName() == `puzzle_prop`)
	{
		puzzle_prop _switch;
		_switch = _prop;
	
		if (_this.Get(`activated`) != `yes` )
		{	
			//문을 열지 않은 상황에서만 아래의 처리를 한다.

			if (_this.Get(_switch.GetName() +`state`) != `yes`)
			{
				//건드린적이 없는 스위치를 켰을 경우

				if (_switch.GetName() == _this.Get(`open`).LowerCase())
				{
					//건드린 스위치의 이름이 'open'과 같은 경우

					_this.OpenPlace(0);
					_this.Set(`activated`, `yes`);
				}
				else
				{
					//잘못된 스위치를 켰을때

					_this.AllocateMonster(
					0, 
					_switch.GetName() + `Mob`, 		// 몬스터 이름
					`center@*!`,  
					_this.Get(`mob`+_switch.GetName().Right(1)));
	
					//이 스위치는 건드린 스위치임을 표시
					_this.Set(_switch.GetName() +`state`, `yes`);
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
	// 계란을 가지고 있는지 검사한다.
	object_list cItemList;
	cItemList = _invoker.GetItemList(75155);
	if (cItemList.GetSize() == 0)
	{
		_invoker.ShowCaption(["puzzle.element.switchdoor_switch3monster_japan_event.1"]);
		return false;
	}

	if(_curState == `off`)
	{
		_newState = `on`;
		return true;
	}
	if(_curState == `on`)
	{
		_newState = `off`;
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
