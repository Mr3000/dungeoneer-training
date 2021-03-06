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
	        `data/script/puzzle/element/TimeOut_Chest_1Monster.mint`);
	Monster1.Set(`mob`, GetMonster(_arg1, _arg2, _arg3, strRandom.Mid(0, 1)));

	Monster2 = _this.DeclareSubPuzzle(
        	`monster2`,
	        `data/script/puzzle/element/TimeOut_Chest_1Monster.mint`);
	Monster2.Set(`mob`, GetMonster(_arg1, _arg2, _arg3, strRandom.Mid(1, 1)));

	Monster3 = _this.DeclareSubPuzzle(
        	`monster3`,
	        `data/script/puzzle/element/TimeOut_Chest_1Monster.mint`);
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
		puzzle monster1 = _this.FindPuzzle(`monster1`);
		if(monster1.Get(`monstercount`) == `0`)
		{
			// never happen
			monster1.GetPlace(0).OpenAllDoor();
		}
		else if(monster1.Get(`monstercount`) == `1`)
		{
			monster1.Set(`monstercount`, `0`);
			monster1.GetPlace(0).OpenAllDoor();
		}
		else if(monster1.Get(`monstercount`) == `2`)
		{
			monster1.Set(`monstercount`, `1`);
		}
		else if(monster1.Get(`monstercount`) == `3`)
		{
			monster1.Set(`monstercount`, `2`);
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

		// 막은 문을 열 수 있는 열쇠를 만든다
		puzzle_chest KeyChest;     // 열쇠가 담긴 상자
	    
		KeyChest = _this.NewChest(
			0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
			`center@*`,     // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
			`Chest_Key`);   // 상자의 이름
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
		_this.FindPuzzle(`Monster1`).DropKey(0, `Lock1`);
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
	if (_remain == 0)
	{
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
    puzzle_chest chest;
    chest = (puzzle_chest) _prop;
    if (chest.GetName() == `chest_key` &&
	    _event == `statechange` &&
	    _arg1 == `open`)
	{
		_this.GetPlace(0).CloseAllDoor();

		_template.FindPuzzle(`monster1`).Set(`monstercount`, `1`);

		_template.FindPuzzle(`monster1`).AllocateGhostMonster(0, `mob_last`, `center`, _template.FindPuzzle(`monster1`).Get(`mob`));
		_template.FindPuzzle(`monster1`).ReserveChangeGhost(0, `mob_last`, 12000, 8000, 60, true);
	}
}
