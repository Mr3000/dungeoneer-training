


//////////////////////////////////////////////////////////////////////////////////
server void OnZoneCreate(zone _iz)
//////////////////////////////////////////////////////////////////////////////////
{
	character creator;
	creator = _iz.GetCreator();

	// 타이머 사용 가능 상태다.
	_iz.SetData(`timer0`, true);		
	_iz.SetData(`timer1`, true);		
	_iz.SetData(`timer2`, true);		
	_iz.SetData(`timer3`, true);		
	_iz.SetData(`timer4`, true);		
	_iz.SetData(`timer5`, true);		
	_iz.SetData(`timer6`, true);		
	_iz.SetData(`timer7`, true);		
	_iz.SetData(`timer8`, true);		
	_iz.SetData(`timer9`, true);		
	_iz.SetData(`timer10`, true);		
	_iz.SetData(`timer11`, true);		
	_iz.SetData(`timer12`, true);		


	_iz.SetTimer(`init`, 0, 1000);		// 리전 생성 1초후에 몬스터와 프랍 스폰
}

server void OnPropAppear(zone _iz, prop _prop)
{
	character creator;
	creator = _iz.GetCreator();
}

server void OnPropStateChange(zone _iz, prop _prop, string _oldstate, string _newstate)
{
	/*
	int i;
	string _timer;
	string _usableTimer;
	bool _IsUsable;
	dword timerNo;

	// 타이머 슬롯중 비어있는 녀석을 찾는다.
	for (i = 0 ; i<13 ; i++)
	{
		_timer = `timer` + ToString(i);
		_iz.GetData(_timer, _IsUsable);
		if(_IsUsable)
		{
			_usableTimer = _timer;
			timerNo = i;
			break;
		}
	}

	if (_newstate == `empty`)
	{
		if (	_oldstate == `orange`
			|| _oldstate == `red`
			|| _oldstate == `pink`
			|| _oldstate == `green`
			|| _oldstate == `violet`	)
		{
			if (IsDevelopment())
			{
				_iz.SetTimer(_usableTimer, 0, 7*1000);
			}
			else
			{
				_iz.SetTimer(_usableTimer, 0, 120*1000);
			}
		}
	}
	*/
}

server void OnPropDisappear(zone _iz, prop _prop)
{
}

server void OnCharacterEnter(zone _iz, character _char)
{
}

server void OnCharacterLeave(zone _iz, character _char)
{
}

server void OnCharacterDie(zone _iz, character _char, character _killer)
{
	string name = _char.GetRaceName();

	if (name == `Golem_Cuilin`)		// 보스가 죽었으면
	{
		if(IsDevelopment())
		{
			_iz.SetTimer(`bosskilled`, 0, 10*1000);		// 개발 서버는 10초 후  리스폰
		}
		else
		{
			_iz.SetTimer(`bosskilled`, 0, 10*60*1000);		// 10 분 후 리스폰
		}

	}
}

server void OnTimer(zone _iz, string name, dword userdata)
{
	if (name == `bosskilled`)
	{
		_iz.AllocateMonster(`single(Golem_Cuilin:1)`, `_Taillteann_E_field_0004`, `mon1703`, true);
	}

	if (name == `check`)
	{
		int i;
		string treeName;
		prop _prop;
		string _state;
		for (i = 1 ; i <= 10; i++)
		{
			treeName = `arattree` + ToString(i);
			_prop = _iz.FindProp(treeName);
			_state = _prop.GetState();
			if (_state == `empty`)
			{
				int _random = Random(100);
				if (_random < 40)
				{
					_prop.ChangeState(`pink`);
				}
				else if (_random < 70)
				{
					_prop.ChangeState(`orange`);
				}
				else if (_random < 90)
				{
					_prop.ChangeState(`red`);
				}
				else 
				{
					_prop.ChangeState(`violet`);
				}
			}
		}
		/*
		for (i = 1 ; i <= 10; i++)
		{
			treeName = `stone` + ToString(i);
			_prop = _iz.FindProp(treeName);
			_state = _prop.GetState();
			if (_state == `empty`)
			{
				_prop.ChangeState(`invisible`);
			}
		}
		*/
		if (IsDevelopment())
		{
			_iz.SetTimer(`check`, 0, 60*1000);		// 개발 서버는 30초마다 프랍 리필
		}
		else
		{
			_iz.SetTimer(`check`, 0, 5*60*1000);		// 5 분마다 프랍 스테이트 체크해서 리필해준다. 이러고 싶지 않았는데 방법이 없네...
		}
	}

	// 리전 생성 1초후에 몬스터와 프랍 스폰
	if (name == `init`)
	{
		if (IsDevelopment())
		{
			_iz.SetTimer(`check`, 0, 60*1000);		// 개발 서버는 30초마다 프랍 리필
		}
		else
		{
			_iz.SetTimer(`check`, 0, 5*60*1000);		// 5 분마다 프랍 스테이트 체크해서 리필해준다. 이러고 싶지 않았는데 방법이 없네...
		}

		// 몬스터
		_iz.AllocateMonster(`single(ShadowFighter1:6)`, `_Taillteann_E_field_0007`, `mon1708`, false);
		_iz.AllocateMonster(`single(ShadowFighter1:9)`, `_Taillteann_E_field_0004`, `mon1707`, false);
		_iz.AllocateMonster(`single(ShadowFighter1:5)`, `_Taillteann_E_field_0004`, `mon1706`, false);

		_iz.AllocateMonster(`single(ShadowArcher1:8)`, `_Taillteann_E_field_0004`, `mon1705`, false);
		_iz.AllocateMonster(`single(ShadowArcher1:10)`, `_Taillteann_E_field_0004`, `mon1704`, false);

		_iz.AllocateMonster(`single(ShadowLancer1:9)`, `_Taillteann_E_field_0004`, `mon1702`, false);
		_iz.AllocateMonster(`single(ShadowLancer1:6)`, `_Taillteann_E_field_0001`, `mon1701`, false);
		_iz.AllocateMonster(`single(ShadowLancer1:5)`, `_Taillteann_E_field_0001`, `mon1700`, false);

		// 보스
		_iz.AllocateMonster(`single(Golem_Cuilin:1)`, `_Taillteann_E_field_0004`, `mon1703`, true);

		// 나무
		prop _prop1 = _iz.CreateProp(`arattree1`, 41396, 105895, 92632, `pink`);
		prop _prop2 = _iz.CreateProp(`arattree2`, 41396, 96381, 95856, `pink`);
		prop _prop3 = _iz.CreateProp(`arattree3`, 41396, 102117, 87895, `orange`);
		prop _prop4 = _iz.CreateProp(`arattree4`, 41396, 98064, 88822, `orange`);
		prop _prop5 = _iz.CreateProp(`arattree5`, 41396, 89951, 87398, `red`);
		prop _prop6 = _iz.CreateProp(`arattree6`, 41396, 87873, 96063, `red`);
		prop _prop7 = _iz.CreateProp(`arattree7`, 41396, 81411, 99749, `red`);
//		prop _prop8 = _iz.CreateProp(`arattree8`, 41396, 82252, 91312, `violet`);
		prop _prop9 = _iz.CreateProp(`arattree9`, 41396, 76514, 88758, `violet`);
		prop _prop10 = _iz.CreateProp(`arattree10`, 41396, 70326, 96159, `violet`);



		// 퀼린 스톤
		_iz.CreateProp(`stone1`, 41444, 83188, 83509, ``);
		_iz.CreateProp(`stone2`, 41445, 76817, 88309, ``);
		_iz.CreateProp(`stone3`, 41444, 71658, 90237, ``);
		_iz.CreateProp(`stone4`, 41445, 66585, 92790, ``);
		_iz.CreateProp(`stone5`, 41444, 69565, 97887, ``);
		_iz.CreateProp(`stone6`, 41445, 76404, 100132, ``);
		_iz.CreateProp(`stone7`, 41444, 83469, 96995, ``);
		_iz.CreateProp(`stone8`, 41445, 96345, 94217, ``);
		_iz.CreateProp(`stone9`, 41444, 98526, 88528, ``);
		_iz.CreateProp(`stone10`, 41445, 91674, 83288, ``);
	}


}




server void MessageDisplay(zone _iz, string message, int type)
{
	object_list cCharList;
	int playerCnt;
	character player;
	int i;

	cCharList = _iz.GetPlayerList();
	playerCnt = _iz.GetPlayerCount();

	for (i = 0 ; i < playerCnt ; i++)
	{
		player = (character)cCharList.GetValue(i);
		if (type == 0)
		{
			player.ShowCaption(message);
		}
		else
		{
			player.ShowMessageView(message);
		}
	}
}
