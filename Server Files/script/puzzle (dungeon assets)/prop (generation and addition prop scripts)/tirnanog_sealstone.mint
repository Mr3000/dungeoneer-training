////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Puzzle Template
//										  던전 퍼즐 프랍 : 티르나노이의 봉인석
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
		23038,				// 다른 세계로의 봉인
		`closed`,				// 초기 상태
		_index,				// 배치할 장소 인덱스
		_positionTemplate,		// 위치 템플릿
		_name,				// 이름
		`data/script/puzzle/prop/tirnanog_sealstone.mint::QueryStateChange`,	// 상태 변화 여부 검사 핸들러
		`data/script/puzzle/prop/tirnanog_sealstone.mint::OnStateChange`);	// 상태 변화 이벤트 핸들러
	
	propCreated.SetColor(1, 0xffffffff);

	puzzle_prop portal;
	
	portal = _puzzle.NewProp(
		23039,			// 다른 세계로의 포탈
		`closed`,			// 초기 상태
		_index,			// 배치할 장소 인덱스
		_positionTemplate,	// 위치 템플릿
		_name + `_portal`,	// 이름
		``,				// 상태 변화 여부 검사 핸들러
		``);				// 상태 변화 이벤트 핸들러

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
	if (_operation == `touch`)
	{
		DebugOut(["puzzle.prop.tirnanog_sealstone.1"]);
		
		if (_curState == `closed`)
		{
			// 프랍을 건드린 캐릭터가 들어있는 던전을 찾는다
			dungeon currentDungeon = _invoker.GetCurrentDungeon();
			
			do
			{
				// 키워드나 타이틀을 갖고 있나 검사
				if (!_invoker.HaveKeyword(`g1_35`)&&!_invoker.IsSelectableTitle(10007)&&!_invoker.HaveKeyword(`g1_complete`))	//g1 스킵 유저를 위해 g1_complete 체크를 추가
				{
					// 키워드가 없어서 열 수 없음
					_invoker.ShowCaption(["puzzle.prop.tirnanog_sealstone.2"]);
					
					// do-while 루프 밖으로 나간다
					break;
				}

				if (!GetDay()== 6) //삼하인:토요일에만 오픈 가능
				{
					// 삼하인에만 열 수 있다
					_invoker.ShowCaption(["puzzle.prop.tirnanog_sealstone.3"]);
					
					// do-while 루프 밖으로 나간다
					break;
				}
				if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
				{
				}
				else
				{
					bool levelOk = true;  // 레벨 제한 조건이 만족되었나
					object_list playerList;
					int i;
					
					// 따라 들어온 캐릭터를 포함해서 모든 유저의 레벨을 본다
					playerList = currentDungeon.GetPlayerList();
					
					for (i = 0; i < playerList.GetSize(); ++i)
					{
						character player = (character) playerList.GetValue(i);
						if (player.GetLevel() < 25)
						{
							// 레벨이 낮은 캐릭터가 있어서 열 수 없다
							levelOk = false;

							// 혹시라도 너 때문에 못 들어오는 거야, 
							// 라고 알려주고 싶으면 이렇게
							player.ShowCaption(["puzzle.prop.tirnanog_sealstone.4"]);
						}
					}

					if (!levelOk)
					{
						//여러명이 왔을때
						if (playerList.GetSize() > 1)
						{
							_invoker.ShowCaption(["puzzle.prop.tirnanog_sealstone.9"]);
						}
						else
						{
							_invoker.ShowCaption(["puzzle.prop.tirnanog_sealstone.10"]);
						}


						// do-while 루프 밖으로 나간다
						break;
					}
				}

				if (!(currentDungeon.GetPlayerLeader() == _invoker))
				{
					// 리더가 아니면 열 수 없음
					_invoker.ShowCaption(["puzzle.prop.tirnanog_sealstone.7"]);
					
					// do-while 루프 밖으로 나간다
					break;
				}
				
				// 전원의 레벨에 문제가 없다
				// 조건이 모두 만족되었으므로 문을 연다
				_newState = `open`;
				
				// 타이틀을 부여한
				if(!_invoker.HaveKeyword(`g1_complete`))
				{
					_invoker.DoStript(`addtitle(10007)`);
				}
				// 상태 변화가 일어났다는 의미의 true
				return true;
			}
			while (false);
		}
	}
	
	// 상태 변화가 일어나지 않았다는 의미의 false
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
	// 바리 레어 던전에서 티르 나 노이로 가는 이벤트 박스는
	// Ula_Crossroad/_Ula_Crossroad/Cross_from_BanWarpdoor
	// 반대로 티르 나 노이에서 나오는 쪽 이벤트 박스는
	// Ula_Crossroad/_Ula_Crossroad/Cross_from_TirnaNPC
	_this.GetParent().FindProp(_this.GetName() + `_portal`).SetPortal(
		`Ula_Crossroad/_Ula_Crossroad/Cross_from_BanWarpdoor`,  // 포탈 이름
		["puzzle.prop.tirnanog_sealstone.8"]);					// 메시지
}




