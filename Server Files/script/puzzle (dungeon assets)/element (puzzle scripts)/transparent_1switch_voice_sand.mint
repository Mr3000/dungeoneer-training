////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

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

server string GetMonster(string _arg1, string _arg2, string _arg3, string strRandom)
{
	if(strRandom == `1`)
		return _arg1;
	else if(strRandom == `2`)
		return _arg2;
	else if(strRandom == `3`)
		return _arg3;
}

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
	string strRandom = Shuffle(`123`);
	
	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	_this.DeclarePlace(`SummonRoom`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	puzzle Monster1;
	puzzle Monster2;
	puzzle Monster3;

	Monster1 = _this.DeclareSubPuzzle(
        	`monster1`,
	        `data/script/puzzle/element/Transparent_1Switch_Voice_Sand.mint`);
	Monster1.Set(`mob`, GetMonster(_arg1, _arg2, _arg3, strRandom.Mid(0, 1)));

	Monster2 = _this.DeclareSubPuzzle(
        	`monster2`,
	        `data/script/puzzle/element/Transparent_1Switch_Voice_Sand.mint`);
	Monster2.Set(`mob`, GetMonster(_arg1, _arg2, _arg3, strRandom.Mid(1, 1)));

	Monster3 = _this.DeclareSubPuzzle(
        	`monster3`,
	        `data/script/puzzle/element/Transparent_1Switch_Voice_Sand.mint`);
	Monster3.Set(`mob`, GetMonster(_arg1, _arg2, _arg3, strRandom.Mid(2, 1)));

	Monster1.AddPlaceToUse(`SummonRoom`);
	Monster2.AddPlaceToUse(`SummonRoom`);
	Monster3.AddPlaceToUse(`SummonRoom`);
}

////////////////////////////////////////////////////////////////////////////////
server void
    OnTemplatePuzzleEvent(
        puzzle_template _this,
        puzzle _puzzle,
        string _event)
// : 퍼즐에서 이벤트가 발생했다
////////////////////////////////////////////////////////////////////////////////
{
	if(_event == `complete`)
	{
		if (_puzzle.GetName() == `monster1` && _event == `complete`)
		{
			// 몬스터 퍼즐이 클리어되었다.
			// 열쇠 방의 문을 모두 연다
			_puzzle.GetPlace(0).OpenAllDoor();
		}
	}
}

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
	if(_this.GetName() == `monster1`)
	{
		switch (_index) {
		case (0)
			{
				_place.DeclareReserveSpace();
				_place.DeclareRoom();
				_place.DeclareLockSelf();
			}
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
	if(_this.GetName() == `monster1`)
	{
		_this.LockPlace(0, `Lock1`, `switch`);

		puzzle_prop propCreated = _this.NewProp(
			24949,                  // 유적 이리아 스위치
			`off`,					// 초기 상태
			0,                 // 배치할 장소 인덱스
			`real_center`,      // 위치 템플릿
			`Switch1`,                  // 이름
			`data/script/puzzle/element/Transparent_1Switch_Voice.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
			`data/script/puzzle/element/Transparent_1Switch_Voice.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

		_this.Set(propCreated.GetName() +`state`, `no`);
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
	if(_bSucceeded)
	{
	}
	else
	{
		_puzzle.GetPlace(0).OpenAllDoor();
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterAllocate(
	puzzle _this,
	string _name,
	bool _succeeded)
// : 몬스터 할당시마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `Mob_Last`.LowerCase())
	{
		if (!_succeeded)
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
	if (_Puzzle.GetName() == `monster1` && _remain == 0)
	{
	    // 종료시킨다
	    _Puzzle.Complete();
	}
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
	if (_prop.GetName() == `switch1`)
	{
		if(_this.Get(_prop.GetName() +`state`) == `no`)
		{
			//이 스위치는 건드린 스위치임을 표시
			_this.Set(_prop.GetName() +`state`, `yes`);

			_this.GetPlace(0).CloseAllDoor();

			_template.FindPuzzle(`monster1`).AllocateGhostMonster(0, `mob_last`, `excenter`, _template.FindPuzzle(`monster1`).Get(`mob`));
			_template.FindPuzzle(`monster2`).AllocateGhostMonster(0, `mob_last`, `excenter`, _template.FindPuzzle(`monster2`).Get(`mob`));
			_template.FindPuzzle(`monster3`).AllocateGhostMonster(0, `mob_last`, `excenter`, _template.FindPuzzle(`monster3`).Get(`mob`));
		}
		else if(_this.Get(_prop.GetName() +`state`) == `yes`)
		{
			//이 스위치는 건드린 스위치임을 표시
			_this.Set(_prop.GetName() +`state`, `disable`);

			_template.FindPuzzle(`monster2`).ReleaseMonster(0, `mob_last`);
			_template.FindPuzzle(`monster3`).ReleaseMonster(0, `mob_last`);
			_template.FindPuzzle(`monster1`).ActivateGhostMonster(0, `mob_last`);
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
	if(_curState == `on`)
	{
		_newState = `none`;
		return true;
	}
	if(_curState == `none`)
	{
		return false;
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
    if (_newState == `on`)
    {
	_this.ShowCaptionToNear(["puzzle.element.transparent_1switch_voice.1"]);
    }
}
