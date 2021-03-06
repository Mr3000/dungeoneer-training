////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           던전 퍼즐 프랍 : 붉은 분수
//
//                                     capella begins at 2005. 1. 31
//                                        capella@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server puzzle_prop
    New(
	    puzzle _puzzle,         // 프랍을 더할 퍼즐
	    int _index,             // 퍼즐 내의 장소 인덱스
	    string _positionTemplate,   // 위치 템플릿
	    string _name)           // 생성할 프랍의 퍼즐 이름
// : 프랍을 생성한다
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`red_fountain.mint`);
	int prob;
	puzzle_prop propCreated;

	string dungeon_name = GetDungeonTemplateName(_puzzle.GetFullName()).LowerCase();
	

	if (dungeon_name.Find(`_low_`)>=0)
	{
		prob = 10;
	}
	else
	if (dungeon_name.Find(`_middle_`)>=0)
	{
		prob = 15;
	}
	else
	if (dungeon_name.Find(`_high_`)>=0)
	{
		prob = 30;
	}
	else
	if (dungeon_name.Find(`test`)>=0)
	{
		prob= 100;
	}
	else
	{
		prob = 0;
	}
	if (prob>Random(100))
	{
		propCreated = _puzzle.NewProp(
			311,                  // 분수!!!!!!!
			`on`,					// 초기 상태
			_index,                 // 배치할 장소 인덱스
			_positionTemplate,      // 위치 템플릿
			_name,                  // 이름
			`data/script/puzzle/prop/red_fountain.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
			`data/script/puzzle/prop/red_fountain.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

		propCreated.SetColor(0,0xE4DFCB);
		propCreated.SetColor(1,0xA21515);

		DebugOut(`빨간 분수 생성`);

		
		_puzzle.Set(`count`,`0`);
	}
	return propCreated;
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
	DebugOut(`fountain.mint::QueryStateChange(` + _operation + `)`);

	if (_operation == `touch`)
	{
		if (_curState == `on`)
		{
			DebugOut(`fountain.mint::QueryStateChange() OnTouchProp 콜`);
			if (OnTouchProp(_this, _operation, _curState, _newState, _invoker))
			{
				DebugOut(`fountain.mint::QueryStateChange() OnTouchProp 콜 성공`);
				if (_invoker.GetTitle() != 60001 && _invoker.GetTitle() != 60000)
				{	
					DebugOut(`QueryStateChange() 이름 저장 : `+ _invoker.GetDisplayName());
					_this.GetParent().Set(_invoker.GetDisplayName(),`true`);
				}
				if (_invoker.GetTitle() != 60001)
				{
					_this.GetParent().Set(`count`, ToString(_this.GetParent().Get(`count`).GetInteger()+1));
					DebugOut(`QueryStateChange() 현재회수 : `+ ToString(_this.GetParent().Get(`count`).GetInteger()));
				}
			}
			
			if (_this.GetParent().Get(`count`).GetInteger() >=8 )
			{
				DebugOut(`QueryStateChange() 8명 이상이라서 off 시킴`);
				_newState = `off`;
				return true;
			}
		}
		else
		{
			DebugOut(`QueryStateChange() state가 on이 아님`);
		}
	}

	// 상태 변화가 일어나지 않았다는 의미의 false
	return false;
}
////////////////////////////////////////////////////////////////////////////////
server bool OnTouchProp(
        puzzle_prop _this,      // 프랍
        string _operation,      // 프랍에 행해진 동작
        string _curState,       // 프랍의 현재 상태
        string& _newState,      // out) 프랍의 새로운 상태
        character _invoker)     // 프랍에 동작을 수행한 캐릭터
// : 유저가 어떤 동작을 해서 상태 변화를 쿼리할 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	int i = Random(100);

	DebugOut(`fountain.mint::OnTouchProp() 첫부분.`);

	if (_this.GetParent().HasValue(_invoker.GetDisplayName()))
	{
		DebugOut(`fountain.mint::OnTouchProp() 함 했자나 버럭`);
		return false;
	}

	if (i<60)
	{
		return BuffPlus(_invoker);
	}
	else
	{
		return BuffMinus(_invoker);
	}
	return false;
}
////////////////////////////////////////////////////////////////////////////////
server bool BuffPlus(
        character _invoker)     // 프랍에 동작을 수행한 캐릭터
// : 플러스 효과
////////////////////////////////////////////////////////////////////////////////
{
	
	int i = Random(12);

	int amount_variation = Random(5)-2;
	int duration_variation = Random(59)-29;

	DebugOut(`red_fountain.mint::BuffPlus(`+ ToString(i) + `)`);

	string str_temp;
	switch(i)
	{
	case (0)	str_temp = _invoker.AddBuffer(`lifemax`, 8 + amount_variation);
	case (1)	str_temp = _invoker.AddBuffer(`manamax`, 8 + amount_variation);
	case (2)	str_temp = _invoker.AddBuffer(`staminamax`, 8 + amount_variation);
	case (3)	str_temp = _invoker.AddBuffer(`str`, 5 + amount_variation);
	case (4)	str_temp = _invoker.AddBuffer(`dex`, 5 + amount_variation);
	case (5)	str_temp = _invoker.AddBuffer(`int`, 5 + amount_variation);
	case (6)	str_temp = _invoker.AddBuffer(`will`, 3 + amount_variation);
	case (7)	str_temp = _invoker.AddBuffer(`luck`, 3 + amount_variation);
	case (8)	str_temp = _invoker.AddBuffer(`attackmax`, 5 + amount_variation);
	case (9)	str_temp = _invoker.AddBuffer(`attackmin`, 2 + amount_variation);
	case (10)	str_temp = _invoker.AddBuffer(`critical`, 5 + amount_variation);
	case (11)	str_temp = _invoker.AddBuffer(`rate`, 5 + amount_variation);
	}

	if (str_temp.GetLength() > 0)
	{
		_invoker.StartBuffer(
			300 + duration_variation,
			["puzzle.prop.red_fountain.57"]<< str_temp,
			["puzzle.prop.red_fountain.58"],
			["puzzle.prop.red_fountain.59"]);
		return true;
	}
	return false;
}

////////////////////////////////////////////////////////////////////////////////
server bool BuffMinus(
        character _invoker)     // 프랍에 동작을 수행한 캐릭터
// : 마이너스 효과
////////////////////////////////////////////////////////////////////////////////
{
	int i = Random(12);

	int amount_variation = Random(3)-1;
	int duration_variation = Random(29)-14;

	DebugOut(`red_fountain.mint::BuffMinus(`+ ToString(i) + `)`);

	string str_temp;
	switch(i)
	{
	case (0)	str_temp = _invoker.AddBuffer(`lifemax`, -3+amount_variation);
	case (1)	str_temp = _invoker.AddBuffer(`manamax`, -3+amount_variation);
	case (2)	str_temp = _invoker.AddBuffer(`staminamax`, -3+amount_variation);
	case (3)	str_temp = _invoker.AddBuffer(`str`, -2+amount_variation);
	case (4)	str_temp = _invoker.AddBuffer(`dex`, -2+amount_variation);
	case (5)	str_temp = _invoker.AddBuffer(`int`, -2+amount_variation);
	case (6)	str_temp = _invoker.AddBuffer(`will`, -2+amount_variation);
	case (7)	str_temp = _invoker.AddBuffer(`luck`, -2+amount_variation);
	case (8)	str_temp = _invoker.AddBuffer(`attackmax`, -1+amount_variation);
	case (9)	str_temp = _invoker.AddBuffer(`attackmin`, -3+amount_variation);
	case (10)	str_temp = _invoker.AddBuffer(`critical`, -2+amount_variation);
	case (11)	str_temp = _invoker.AddBuffer(`rate`, -2+amount_variation);
	}

	if (str_temp.GetLength() > 0)
	{
		_invoker.StartBuffer(
			300 + duration_variation,
			["puzzle.prop.red_fountain.60"]<< str_temp,
			["puzzle.prop.red_fountain.61"],
			["puzzle.prop.red_fountain.62"]);
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




