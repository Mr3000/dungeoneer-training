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
	_this.DeclarePlace(`SummonRoom`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	puzzle Monster1;


	Monster1 = _this.DeclareSubPuzzle(
        	`monster1`,
	        `data/script/puzzle/element/JG_Nekojima_DownTo2ndFloor.mint`);
	Monster1.Set(`mob`,_arg1);

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
		puzzle_prop propCreated = _this.NewProp(
			41834,                  // 네코지마 던전 스위치
			`on`,					// 초기 상태
			0,                 // 배치할 장소 인덱스
			`real_center@1`,		// 위치 템플릿
			`Switch1`,                  // 이름
			`data/script/puzzle/element/JG_Nekojima_DownTo2ndFloor.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
			`data/script/puzzle/element/JG_Nekojima_DownTo2ndFloor.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

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
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterAllocate(
	puzzle _this,
	string _name,
	bool _succeeded)
// : 몬스터 할당시마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
    puzzle _Puzzle,
    string _name,
    int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
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
	DebugOut(`hit2?`);
	if (_prop.GetName() == `switch1`)
	{
		DebugOut(`hit2.`);
		if(_this.Get(_prop.GetName() +`state`) == `no`)
		{

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
	DebugOut(`hit?`);
	if(_curState == `on`)
	{
		// 아래층으로 내려간다.
		puzzle _puzzle = _this.GetParent();
		dungeon_floor floor = _puzzle.GetDungeonFloor(1);

		puzzle_template template_seed = floor.GetPuzzleTemplateByCustomSectionIndex(0, 0);
		string warp_seed = template_seed.FindPuzzle(`monster1`).Get(`warp_seed`);

		int warp_section;
		if (warp_seed == `0`)
		{
			warp_section = 4;

			puzzle_template template_warproom = floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
			string chest_here = template_warproom.FindPuzzle(`monster1`).Get(`chest`);
			if (chest_here == `1`)
			{
				// 상자방이므로 다른 곳에 워프한다.
				warp_section = 0;
			}
		}
		else
		{
			warp_section = 20;
			puzzle_template template_warproom = floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
			string chest_here = template_warproom.FindPuzzle(`monster1`).Get(`chest`);
			if (chest_here == `1`)
			{
				// 상자방이므로 다른 곳에 워프한다.
				warp_section = 24;
			}
		}

		puzzle_template template = floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
		template.FindPuzzle(`monster1`).GetPlace(0).WarpCharacter(_invoker);
		_invoker.ShowCaption(["puzzle.element.jg_nekojima_downto2ndfloor.2"]);

		//_newState = `on`;
		return false;
	}
	if(_curState == `on`)
	{
		//_newState = `none`;
		return false;
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
