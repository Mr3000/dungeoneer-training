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
//	string strRandom = Shuffle(`123`);
	
	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	_this.DeclarePlace(`SummonRoom`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	puzzle Monster1;


	Monster1 = _this.DeclareSubPuzzle(
        	`monster1`,
	        `data/script/puzzle/element/JG_Nekojima_PuzzleRoom_Chest6.mint`);
	Monster1.Set(`mob`,_arg1);

	Monster1.Set(`chest`, `1`);

	Monster1.AddPlaceToUse(`SummonRoom`);

}

////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplateCreate(
		puzzle_template _this)
// : 퍼즐 템플릿 생성 후에 불린다.
////////////////////////////////////////////////////////////////////////////////
{
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
		DebugOut(`Complete`);
		if (_puzzle.GetName() == `monster1`)
		{
			// 몬스터 퍼즐이 클리어되었다.
			// 열쇠 방의 문을 모두 연다
			_puzzle.GetPlace(0).OpenAllDoor();
			SetNeighborDoor(true, _puzzle);
			_puzzle.Set(`completed`, `true`);
		}
	}
	else if (_event == `reset`)
	{
		if (_puzzle.GetName() == `monster1`)
		{
			DebugOut(`Reset`);
			// 몬스터 퍼즐이 다시 리셋되었다.

			// 열쇠 방의 문을 모두 잠그고
			_this.FindPuzzle(`monster1`).GetPlace(0).CloseAllDoor();
			SetNeighborDoor(false, _this.FindPuzzle(`monster1`));

			// 리셋 플래그를 세팅하고
			_this.FindPuzzle(`monster1`).Set(`reset_flag`, `true`);

			// 몬스터를 모두 소환해제시키고
			_this.FindPuzzle(`monster1`).ReleaseMonster(0, `mob_last`, true);

			// 스위치를 원상복귀해 놓는다.
			puzzle_prop switchprop = _this.FindPuzzle(`monster1`).FindProp(`Switch1`);
			switchprop.ChangeState(`off`);
			_this.FindPuzzle(`monster1`).Set(switchprop.GetName() +`state`, `no`);
			_puzzle.Set(`completed`, `false`);
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
	puzzle_chest GemChest;
		GemChest = _this.NewChest(
		0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`4corner@*!`,     // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
		`Chest_Gem`);   // 상자의 이름
		GemChest.AddItem(`id:64061`);
		GemChest.AddItem(`id:64061`);
		GemChest.AddItem(`id:64061`);
		GemChest.AddItem(`id:64061`);
		GemChest.AddItem(`id:64061`);
		GemChest.AddItem(`id:64061`);
		DebugOut(`6개 여기까지 올까요?`);

	if(_this.GetName() == `monster1`)
	{
	// _this.LockPlace(0, `Lock1`, `switch`);
		puzzle_prop propCreated = _this.NewProp(
			41837,                  // 네코지마 던전 스위치
			`off`,					// 초기 상태
			0,                 // 배치할 장소 인덱스
			`real_center@1`,		// 위치 템플릿
			`Switch1`,                  // 이름
			`data/script/puzzle/element/JG_Nekojima_PuzzleRoom_Chest6.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
			`data/script/puzzle/element/JG_Nekojima_PuzzleRoom_Chest6.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

		_this.Set(propCreated.GetName() +`state`, `no`);
		_this.Set(`completed`, `false`);
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
		SetNeighborDoor(true, _puzzle);
		_puzzle.Set(`completed`, `true`);
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
			//_this.Complete();
			_this.GetPlace(0).OpenAllDoor();
			SetNeighborDoor(true, _this);
			_this.Set(`completed`, `true`);
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
		if (_Puzzle.Get(`reset_flag`) != `true`)
		{
			DebugOut(`OpenDoor`);
			_Puzzle.Set(`reset_flag`, `false`);
			_Puzzle.GetPlace(0).OpenAllDoor();
			SetNeighborDoor(true, _Puzzle);
			_Puzzle.Set(`completed`, `true`);
		}
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

			// 플로어 내의 모든 퍼즐 템플릿을 잡아서 처리
			int i;
			dungeon_floor floor = _this.GetDungeonFloor();
			int puzzle_template_num = floor.GetPuzzleTemplateNum();

			puzzle_template template2 = floor.GetPuzzleTemplateByCustomSectionIndex(1, 0);
			DebugOut(`template2 name = ` + template2.GetFullName() + `, ` + template2.GetName());

			for (i = 0; i < puzzle_template_num; ++i)
			{
				puzzle_template template = floor.GetPuzzleTemplateByIndex(i);
				DebugOut(`template name = ` + template.GetFullName() + `, ` + template.GetName());

				if (_template.GetFullName() == template.GetFullName())
				{
					// 현재 내가 있는 퍼즐

					// 리셋 플래그를 세팅하고
					_template.FindPuzzle(`monster1`).Set(`reset_flag`, `false`);

					// 몬스터를 할당한다.
					_this.Set(_prop.GetName() +`state`, `yes`);

					_this.GetPlace(0).CloseAllDoor();
					SetNeighborDoor(false, _this);

					_template.FindPuzzle(`monster1`).AllocateGhostMonster(0, `mob_last`, `center`, _template.FindPuzzle(`monster1`).Get(`mob`));
				}
				else
				{
					// 다른 퍼즐 - 전투중이 아닌 퍼즐은 리셋한다.
					puzzle_prop switchprop = template.FindPuzzle(`monster1`).FindProp(`Switch1`);
					if (template.FindPuzzle(`monster1`).Get(`completed`) == `true`)
					{
						template.FindPuzzle(`monster1`).Reset();
					}
				}
			}
		}
		else if(_this.Get(_prop.GetName() +`state`) == `yes`)
		{
			//이 스위치는 건드린 스위치임을 표시
			_this.Set(_prop.GetName() +`state`, `disable`);

			_template.FindPuzzle(`monster1`).ActivateGhostMonster(0, `mob_last`);
		}
	}
	else if (_prop.GetName() == `chest_gem`)
	{
		puzzle_prop switchprop = _this.FindProp(`Switch1`);
		if (_this.Get(switchprop.GetName() +`state`) == `disable` || _this.Get(switchprop.GetName() +`state`) == `no`)
		{
			_template.FindPuzzle(`monster1`).Reset();
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

////////////////////////////////////////////////////////////////////////////////
server void
    SetNeighborDoor(
	bool _bOpen,
        puzzle _puzzle)
// : 해당 퍼즐의 인접 퍼즐을 찾아서 퍼즐의 해당 문을 열거나 닫아주는 루틴
////////////////////////////////////////////////////////////////////////////////
{
	int section_id = _puzzle.GetCustomSectionId();
	if (section_id != -1)
	{
		dungeon_floor floor = _puzzle.GetDungeonFloor();
		bool bNorth = true;
		bool bSouth = true;
		bool bWest = true;
		bool bEast = true;

		if (section_id >= 20)
		{
			bNorth = false;
		}
		if (section_id <= 4)
		{
			bSouth = false;
		}
		if (section_id % 5 == 0)
		{
			bWest = false;
		}
		if (section_id % 5 == 4)
		{
			bEast = false;
		}

		if (bNorth)
		{
			// 북쪽 퍼즐을 찾아서 남쪽 문을 연다.
			puzzle_template template = floor.GetPuzzleTemplateByCustomSectionIndex(section_id + 5, 0);
			if (_bOpen)	template.FindPuzzle(`monster1`).GetPlace(0).OpenDoor(2);
			else		template.FindPuzzle(`monster1`).GetPlace(0).CloseDoor(2);
		}
		if (bSouth)
		{
			// 남쪽 퍼즐을 찾아서 북쪽 문을 연다.
			puzzle_template template = floor.GetPuzzleTemplateByCustomSectionIndex(section_id - 5, 0);
			if (_bOpen)	template.FindPuzzle(`monster1`).GetPlace(0).OpenDoor(0);
			else		template.FindPuzzle(`monster1`).GetPlace(0).CloseDoor(0);
		}
		if (bWest)
		{
			// 서쪽 퍼즐을 찾아서 동쪽 문을 연다.
			puzzle_template template = floor.GetPuzzleTemplateByCustomSectionIndex(section_id - 1, 0);
			if (_bOpen)	template.FindPuzzle(`monster1`).GetPlace(0).OpenDoor(1);
			else		template.FindPuzzle(`monster1`).GetPlace(0).CloseDoor(1);
		}
		if (bEast)
		{
			// 동쪽 퍼즐을 찾아서 서쪽 문을 연다.
			puzzle_template template = floor.GetPuzzleTemplateByCustomSectionIndex(section_id + 1, 0);
			if (_bOpen)	template.FindPuzzle(`monster1`).GetPlace(0).OpenDoor(3);
			else		template.FindPuzzle(`monster1`).GetPlace(0).CloseDoor(3);
		}
	}
}