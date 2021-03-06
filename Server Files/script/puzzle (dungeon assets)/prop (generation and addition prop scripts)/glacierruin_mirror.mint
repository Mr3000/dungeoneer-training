////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Puzzle Template
//										  던전 퍼즐 프랍 : 빙하 던전의 거울
//
//									 eias erinys fecit, begins at 2004. 06. 21
//										eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server puzzle_prop
	New(
		puzzle _puzzle,		 // 프랍을 더할 퍼즐
		int _index,			 // 퍼즐 내의 장소 인덱스
		string _positionTemplate,   // 위치 템플릿
		string _name)		   // 생성할 프랍의 퍼즐 이름
// : 프랍을 생성한다
////////////////////////////////////////////////////////////////////////////////
{
	puzzle_prop propCreated;

	propCreated = _puzzle.NewProp(
		35115,				// 거울
		`sealed`,			// 초기 상태
		_index,				// 배치할 장소 인덱스
		_positionTemplate,		// 위치 템플릿
		_name,				// 이름
		`data/script/puzzle/prop/glacierruin_mirror.mint::QueryStateChange`,	// 상태 변화 여부 검사 핸들러
		`data/script/puzzle/prop/glacierruin_mirror.mint::OnStateChange`);	// 상태 변화 이벤트 핸들러

	((puzzle_prop) propCreated).SetColor(0, 0xffffff);
	((puzzle_prop) propCreated).Set(`damage`, 0);

	return propCreated;
}

////////////////////////////////////////////////////////////////////////////////
server bool
	QueryStateChange(
		puzzle_prop _this,	  // 프랍
		string _operation,	  // 프랍에 행해진 동작
		string _curState,	   // 프랍의 현재 상태
		string& _newState,	  // out) 프랍의 새로운 상태
		character _invoker)	 // 프랍에 동작을 수행한 캐릭터
// : 유저가 어떤 동작을 해서 상태 변화를 쿼리할 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_operation == `hit`)
	{
		if (_curState == `sealed`)
		{
			_invoker.ShowCaption(["puzzle.prop.glacierruin_mirror.1"].SelectRandom());
		}
		else if (_curState == `revealed`)
		{
			_invoker.ShowCaption(["puzzle.prop.glacierruin_mirror.2"].SelectRandom());
		}
		else if (_curState == `halfbroken`)
		{

			// 10번 때리면 깨진다.
			_this.Set(`damage`, (int)(_this.Get(`damage`)) + 1);
			if ((int)(_this.Get(`damage`)) >= 10)
			{
				_newState = `broken`;
				// 상태 변화가 일어났다는 뜻의 true
				return true;
			}
			else 
			{
				_invoker.ShowCaption(["puzzle.prop.glacierruin_mirror.3"].SelectRandom());
			}
		}
	}
	// 상태 변화가 일어나지 않았다는 뜻의 false
	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnStateChange(
		puzzle_prop _this,	  // 프랍
		string _oldState,	   // 이전 상태
		string _newState,	   // 새로운 상태
		character _invoker)	 // 프랍에 동작을 수행한 캐릭터
// : 
////////////////////////////////////////////////////////////////////////////////
{
	if (_newState == `broken`)
	{
		// 남은 거울 개수 계산
		int mirror_remain = _this.GetParent().Get(`mirror_count`).GetInteger() - 1;
		DebugOut(`남은 거울 개수 : ` + ToString(mirror_remain));
		_this.GetParent().Set(`mirror_count`, ToString(mirror_remain));

		if (mirror_remain == 0 && _this.GetParent().Get(`state`) == `mirrorwitch`)
		{
			// 이전 거울 마녀 없애고 강한 거울 마녀 투입
			monster witch = _this.GetParent().FindMonster(`zin_boss`);
			witch.Release();

			// 강한 거울 마녀를 배치한다
			_this.GetParent().AllocateMonster(
				0, 
				`real_zin_boss`,
				`center`,
				`single(MirrorWitch_Angry:1)`);

			// 컷신 틀어줌
			dungeon _dungeon = _this.GetParent().GetDungeon();

			object_list	cCharList = _dungeon.GetPlayerList();
			character	cChar;
			int		i;

			for (i = 0; i < cCharList.GetSize();  i++)
			{
				cChar = (character)cCharList.GetValue(i);
				cChar.PlayCutScene(`iria_bossroom_mirrorwitch_angry`);
			}
		}
	}
}
