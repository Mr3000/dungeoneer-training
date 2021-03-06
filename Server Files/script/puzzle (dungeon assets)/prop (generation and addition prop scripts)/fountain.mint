////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                           던전 퍼즐 프랍 : 분수다 분수
//
//                                     capella begins at 2004. 12. 16
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
	DebugOut(`fountain.mint`);
	int prob;
	puzzle_prop propCreated;

	string dungeon_name = GetDungeonTemplateName(_puzzle.GetFullName()).LowerCase();
	

	if (dungeon_name.Find(`_low_`)>=0)
	{
		prob = 20;
	}
	else
	if (dungeon_name.Find(`_middle_`)>=0)
	{
		prob = 30;
	}
	else
	if (dungeon_name.Find(`_high_`)>=0)
	{
		prob = 50;
	}
	else
	{
		prob = 10;
	}
	if (prob>Random(100))
	{
		propCreated = _puzzle.NewProp(
			311,                  // 분수!!!!!!!
			`on`,					// 초기 상태
			_index,                 // 배치할 장소 인덱스
			_positionTemplate,      // 위치 템플릿
			_name,                  // 이름
			`data/script/puzzle/prop/fountain.mint::QueryStateChange`,    // 상태 변화 여부 검사 핸들러
			`data/script/puzzle/prop/fountain.mint::OnStateChange`);      // 상태 변화 이벤트 핸들러

		propCreated.SetColor(0,0xE4DFCB);
		propCreated.SetColor(1,0x8EFCFF);

		DebugOut(`분수 생성`);

		
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
				if (_invoker.GetTitle() != 60001 && _invoker.GetTitle() != 60000) //일반인이 건드리면 건든사람이름을 저장
				{	
					DebugOut(`QueryStateChange() 이름 저장 : `+ _invoker.GetDisplayName());
					_this.GetParent().Set(_invoker.GetDisplayName(),`true`); 
				}
				if (_invoker.GetTitle() != 60001 && _invoker.GetTitle() != 60000)//일반인이 건드렸을때만 사용회수를 올림
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
	int i = Random(14);

	DebugOut(`fountain.mint::OnTouchProp() 첫부분.`);

	if (_this.GetParent().HasValue(_invoker.GetDisplayName()))
	{
		DebugOut(`fountain.mint::OnTouchProp() 함 했자나 버럭`);
		return false;
	}

	if (i==0)
	{
		//라이프 100%
		_invoker.SetLife(_invoker.GetLifeMax());
		_invoker.ShowCaption(["puzzle.prop.fountain.6"]);
		return true;
	}
	else
	if (i==1)
	{
		//운드 0
		int wound = _invoker.GetWound();
		_invoker.SetWound(_invoker.GetLifeMax());
		_invoker.ModifyLife(wound);
		_invoker.ShowCaption(["puzzle.prop.fountain.7"]);
		return true;
	}
	else
	if (i==2)
	{
		//스태미나 100%
		_invoker.SetStamina(_invoker.GetStaminaMax());
		_invoker.ShowCaption(["puzzle.prop.fountain.8"]);
		return true;
	}
	else
	if (i==3)
	{
		//마나 100%
		_invoker.SetMana(_invoker.GetManaMax());
		_invoker.ShowCaption(["puzzle.prop.fountain.9"]);
		return true;
	}
	else
	if (i==4)
	{
		//푸드 100%
		_invoker.SetFood(_invoker.GetStaminaMax());
		_invoker.ShowCaption(["puzzle.prop.fountain.10"]);
		return true;
	}
	else
	if (i==5)
	{
		_this.AddItem(`id:2000 count:100~200`);
		_this.DropItem(_invoker);
		_invoker.ShowCaption(["puzzle.prop.fountain.11"]);
		return true;
	}
	else
	if (i==6)
	{
		//경험치 1000
		_invoker.GainExp(1000);
		_invoker.ShowCaption(["puzzle.prop.fountain.12"]);
		return true;
	}
	else
	if (i==7)
	{
		_invoker.SetHolyAll(true);
		_invoker.ShowCaption(["puzzle.prop.fountain.13"]);
		return true;
	}
	else
	if (i==8)
	{
		//장비품중 아무거나 하나에 축복
		object_list cItemList;
		object_list	cTotalList;
		if (_invoker.GetItemListInPocket(5).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(5).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(5));
		}
		if (_invoker.GetItemListInPocket(6).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(6).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(6));
		}
		if (_invoker.GetItemListInPocket(7).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(7).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(7));
		}
		if (_invoker.GetItemListInPocket(8).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(8).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(8));
		}
		if (_invoker.GetItemListInPocket(9).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(9).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(9));
		}
		if (_invoker.GetItemListInPocket(10).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(10).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(10));
		}
		if (_invoker.GetItemListInPocket(11).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(11).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(11));
		}
		if (_invoker.GetItemListInPocket(12).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(12).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(12));
		}
		if (_invoker.GetItemListInPocket(13).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(13).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(13));
		}
		if (_invoker.GetItemListInPocket(16).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(16).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(16));
		}
		if (_invoker.GetItemListInPocket(17).GetSize()!=0 && !((item)_invoker.GetItemListInPocket(17).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(17));
		}

		if (cTotalList.GetSize()!=0)
		{
			item cItem = (item)cTotalList.GetValue(Random(cTotalList.GetSize()));
			cItem.SetHoly(true);
			
			DebugOut(["puzzle.prop.fountain.14"]+ToString(cTotalList.GetSize()) + ["puzzle.prop.fountain.15"]+ cItem.GetLocalName());
			
			if (cItem.GetHoly())
			{
				_invoker.ShowCaption(["puzzle.prop.fountain.23"]<< cItem.GetLocalName());
				return true;
			}
		}
		DebugOut(`fountain.mint::OnTouchProp() 축복걸데가 없소`);
		return false;
	}
	else
	if (i==9)
	{
		//장비하나의 내구도를 100%로
		object_list cItemList;
		object_list	cTotalList;
		if (_invoker.GetItemListInPocket(5).GetSize()==0 && 
		((item)_invoker.GetItemListInPocket(5).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(5).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(5));
		}
		if (_invoker.GetItemListInPocket(6).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(6).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(6).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(6));
		}
		if (_invoker.GetItemListInPocket(7).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(7).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(7).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(7));
		}
		if (_invoker.GetItemListInPocket(8).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(8).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(8).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(8));
		}
		if (_invoker.GetItemListInPocket(9).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(9).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(9).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(9));
		}
		if (_invoker.GetItemListInPocket(10).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(10).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(10).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(10));
		}
		if (_invoker.GetItemListInPocket(11).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(11).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(11).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(11));
		}
		if (_invoker.GetItemListInPocket(12).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(12).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(12).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(12));
		}
		if (_invoker.GetItemListInPocket(13).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(13).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(13).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(13));
		}
		if (_invoker.GetItemListInPocket(16).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(16).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(16).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(16));
		}
		if (_invoker.GetItemListInPocket(17).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(17).GetValue(0)).GetDurability() !=((item)_invoker.GetItemListInPocket(17).GetValue(0)).GetDurabilityMax())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(17));
		}

		if (cTotalList.GetSize()!=0)
		{
			item cItem =(item)cTotalList.GetValue(Random(cTotalList.GetSize()));
			cItem.SetDurability(cItem.GetDurabilityMax());
			DebugOut(cItem.GetLocalName());
			_invoker.ShowCaption(["puzzle.prop.fountain.24"]<< cItem.GetLocalName());
			return true;
		}
		DebugOut(`fountain.mint::OnTouchProp() 내구도가 만땅이야`);
		return false;
	}
	else
	if (i == 10)
	{
		//푸드0
		_invoker.SetFood(0);
		_invoker.SetStamina(0);
		_invoker.ShowCaption(["puzzle.prop.fountain.18"]);
		return true;
	}
	else
	if (i==11)
	{
		//축복 사라짐
		object_list cItemList;
		object_list	cTotalList;
		if (_invoker.GetItemListInPocket(5).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(5).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(5));
		}
		if (_invoker.GetItemListInPocket(6).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(6).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(6));
		}
		if (_invoker.GetItemListInPocket(7).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(7).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(7));
		}
		if (_invoker.GetItemListInPocket(8).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(8).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(8));
		}
		if (_invoker.GetItemListInPocket(9).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(9).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(9));
		}
		if (_invoker.GetItemListInPocket(10).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(10).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(10));
		}
		if (_invoker.GetItemListInPocket(11).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(11).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(11));
		}
		if (_invoker.GetItemListInPocket(12).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(12).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(12));
		}
		if (_invoker.GetItemListInPocket(13).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(13).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(13));
		}
		if (_invoker.GetItemListInPocket(16).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(16).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(16));
		}
		if (_invoker.GetItemListInPocket(17).GetSize()!=0 && ((item)_invoker.GetItemListInPocket(17).GetValue(0)).GetHoly())
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(17));
		}

		if (cTotalList.GetSize()!=0)
		{
			item cItem = (item)cTotalList.GetValue(Random(cTotalList.GetSize()));
			cItem.SetHoly(false);
			DebugOut(cItem.GetLocalName());
			_invoker.ShowCaption(["puzzle.prop.fountain.25"]<< cItem.GetLocalName());
			return true;
		}
		DebugOut(`fountain.mint::OnTouchProp() 축복걸린게 없어`);
		return false;
	}
	else
	if (i==12)
	{
		//스태미나 0%
		_invoker.ModifyStamina(-_invoker.GetStamina());
		_invoker.ShowCaption(["puzzle.prop.fountain.20"]);
		return true;
	}
	else
	if (i ==13)
	{
		float curLife = _invoker.GetLife() * 0.9;
		_invoker.SetWound(Random((int)curLife));
		_invoker.ShowCaption(["puzzle.prop.fountain.21"]);
		return true;
	}
	else
	if (i==14)
	{
		//장비하나의 내구도를 -1로
		object_list cItemList;
		object_list	cTotalList;
		if (_invoker.GetItemListInPocket(5).GetSize()==0 && 
		((item)_invoker.GetItemListInPocket(5).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(5));
		}
		if (_invoker.GetItemListInPocket(6).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(6).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(6));
		}
		if (_invoker.GetItemListInPocket(7).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(7).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(7));
		}
		if (_invoker.GetItemListInPocket(8).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(8).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(8));
		}
		if (_invoker.GetItemListInPocket(9).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(9).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(9));
		}
		if (_invoker.GetItemListInPocket(10).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(10).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(10));
		}
		if (_invoker.GetItemListInPocket(11).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(11).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(11));
		}
		if (_invoker.GetItemListInPocket(12).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(12).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(12));
		}
		if (_invoker.GetItemListInPocket(13).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(13).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(13));
		}
		if (_invoker.GetItemListInPocket(16).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(16).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(16));
		}
		if (_invoker.GetItemListInPocket(17).GetSize()==0 &&
		((item)_invoker.GetItemListInPocket(17).GetValue(0)).GetDurability()>=1000)
		{
			cTotalList.Merge(_invoker.GetItemListInPocket(17));
		}

		if (cTotalList.GetSize()!=0)
		{
			item cItem =(item)cTotalList.GetValue(Random(cTotalList.GetSize()));
			cItem.ModifyDurability(-1000);
			DebugOut(cItem.GetLocalName());
			_invoker.ShowCaption(["puzzle.prop.fountain.26"]<< cItem.GetLocalName());
			return true;
		}
		DebugOut(`fountain.mint::OnTouchProp() 내구도 깎을게 없어`);
		return false;
	}
	DebugOut(`fountain.mint::OnTouchProp() 이건 뭐셈`);
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




