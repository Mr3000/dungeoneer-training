//////////////////////////////////////////////////////////////////////////////////
//                                                     Mabinogi Project NPC Script
//                                                           레네스 지역 제어
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnZoneCreate(zone _iz)
// : NPC가 로그인 할 때 불리는 함수다
//////////////////////////////////////////////////////////////////////////////////
{
	character creator;
	dword startDelay;		// 입장후 시작하기 까지 시간
	int playerCnt = _iz.GetPlayerCount();

	creator = _iz.GetCreator();
	startDelay = 60 * 1000;			// 60초 후에 시작

	/*
	if (playerCnt < 1)				// 이런 일은 없어야 하지만 만약을 대비해서.
	{
		_iz.ReserveDestroy(0);		
	}
	else
	{
	*/
		Initializer(creator, startDelay, _iz);		// 리전 세팅해주는 함수
//	}
}



server void OnPropAppear(zone _iz, prop _prop)
{
	character creator;
	creator = _iz.GetCreator();
}





server void OnPropStateChange(zone _iz, prop _prop, string _oldstate, string _newstate)
{
	character creator;
	creator = _iz.GetCreator();
	dword last_stage;
	dword first_stage;
	dword clear_stage_Cnt;

	_iz.GetData(`stage`, last_stage);
	_iz.GetData(`first_stage`, first_stage);
	_iz.SetData(`last_stage`, last_stage);

	clear_stage_Cnt = last_stage - first_stage + 1;		// 들어와서 깬 스테이지 갯수. 프랍을 모두 친 마지막 스테이지도 클리어로 쳐준다.

	int state01 = GetStateByValue(_iz, `spawn_control1`) ;
	int state02 = GetStateByValue(_iz, `spawn_control2`) ;
	int state03 = GetStateByValue(_iz, `spawn_control3`) ;
	int state04 = GetStateByValue(_iz, `spawn_control4`) ;

	if (state01*state02*state03*state04 == 1)			// 기둥의 불이 모두 꺼져있으면
	{
		_iz.SetData(`nextstage`, false);
		_iz.DestroyProp(`spawnProp1`);
		_iz.DestroyProp(`spawnProp2`);
		_iz.DestroyProp(`spawnProp3`);
		_iz.DestroyProp(`spawnProp4`);
		DestroyControlProp(_iz);			// 스테이지가 바뀌면 기둥 디스폰
		_iz.SetTimer(`TheEnd`, clear_stage_Cnt, 3*1000);			// 3 초 후에 남은 몬스터 잡고 끝내라는 사념파
		dword value = last_stage - first_stage + 1;
		_iz.SetData(`clear_stage`,  value);			
	}
}




server void OnPropDisappear(zone _iz, prop _prop)
{
}




// 스테이지가 늘어나면 알아서 몬스터 능력치 뻥튀기

server void OnCharacterEnter(zone _iz, character _char)
{
	dword ElapsedTime = _iz.GetElapsedTime() ;
	dword monsterCnt = _iz.GetMonsterCount();
	string name = _char.GetRaceName();
	dword cycle;
	_iz.GetData(`cycle`, cycle);
	string indexname;
	indexname = name.Right(6);

	if (monsterCnt > 40)					// 몬스터 수가 40 마리를 넘으면 게임오버 처리한다.	지저분한데 테섭패치가 급하니까 아래처럼 구현
	{
		object_list cCharList = _iz.GetPlayerList();
		int PlayerCnt = _iz.GetPlayerCount();
		character player;
		int i;

		_iz.ReserveDestroy(30000, `too many monster`);

		for (i = 0 ; i < PlayerCnt ; i++)
		{
			player = (character)cCharList.GetValue(i);
			player.PlayCutScene(`G8S4_renes_lose`);
			player.ShowCaption(["event.renes.10"]);
		}
	}

	if (
		(_char.IsHuman() ||_char.IsElf()|| _char.IsGiant())		// 플레이어면 컷신 틀어준다.
		&& ElapsedTime < 15000
	)
	{
		_char.PlayCutScene(`G8S4_renes_enter`);
		//_iz.StartRP(_char, `#chick`);
		
		// 인연 정보를 남긴다.		
		if (_char.IsPartyMember())
		{
			object_list cCharList = _iz.GetPlayerList();
			int PlayerCnt = _iz.GetPlayerCount();
			character player;
			int i;
		
			for (i = 0 ; i < PlayerCnt ; i++)
			{
				player = (character)cCharList.GetValue(i);
				if (_char != player &&
					_char.IsPartyMember(player))
				{
					_char.AddRelationEvent(player, 16);
					player.AddRelationEvent(_char, 16);
				}
			
			}
		}		
	}

	else if (name == `dragonegg`)		// 알이면
	{
		_iz.SetData(`dragonegg`, _char);
		_char.SetDirection(0);
	}
	
	else if (cycle >=1 
		&& (indexname == `renes1` || indexname == `enes1a`))		// 몬스터 능력치 수정하는 부분. 플레이어도 여기로 넘어오므로 조심.
	{
		short AtkMin;
		short AtkMax;
		float modAtk;

		float Life;
		float Def;
		float Prot;

		Life = _char.GetLifeMax();
		Def = _char.GetDefenseBase();
		Prot = _char.GetProtectBase();

		character creator;
		creator = _iz.GetCreator();
		
		Life = Life * cycle * 0.8;			// 사이클마다  1.6배, 2.4배, 3.2 배 이런 식으로 증가.
		_char.SetLifeBase(Life);
		_char.SetWound(Life);
		_char.SetLife(Life);

		Def = Def + (cycle - 1) * 3;		// 사이클마다 방어 3씩 증가
		_char.SetDefenseBase(Def);

		Prot = Prot + (cycle - 1) * 2;			// 사이클마다 보호 2씩 증가. 보호는 80 을 넘지 않도록..
		if (Prot >80)		
		{
			Prot = 80;
		}
		_char.SetProtectBase(Prot);

		if (name == `volcanowolf_renes1` || name == `volcanowolf_renes1a`)
		{
			AtkMin = 9;
			AtkMax = 14;
		}
		else if (name ==`volcanowilddog_renes1` || name == `volcanowilddog_renes1a` )
		{
			AtkMin = 18;
			AtkMax = 27;
		}
		else if (name == `volcanolizard_renes1` || name == `volcanolizard_renes1a`)
		{
			AtkMin = 12;
			AtkMax = 18;
		}
		else if (name == `volcanohornedwildboar_renes1` || name == `volcanohornedwildboar_renes1a`)
		{
			AtkMin = 14;
			AtkMax = 22;
		}
		else if (name == `volcanorockscorpion_renes1` || name == `volcanorockscorpion_renes1a`)
		{
			AtkMin = 18;		
			AtkMax = 27;
		}
		else if (name == `blackleopard_renes1`)
		{
			AtkMin = 20;	//	base 30-45
			AtkMax = 30;
		}
		else if (name == `balrog_renes1`)
		{
			AtkMin = 30;		// base 40-60
			AtkMax = 50;
		}

		if (cycle <= 4 )
		{
			modAtk = 0.6;
		}

		else if (cycle >4 && cycle <= 8 )
		{
			modAtk = 0.5;
		}

		else if (cycle >8 && cycle <= 12)
		{
			modAtk = 0.4;			
		}
		else if (cycle > 12)
		{
			modAtk = 0.3;			
		}

		_char.ModifyAttackMin((short)AtkMin*(cycle-1)*modAtk);
		_char.ModifyAttackMax((short)AtkMax*(cycle-1)*modAtk);

		/*
		if (IsDevelopment())
		{
			MessageDisplay(_iz, name + " 몬스터 공격력" + ToString((short)AtkMin*(cycle-1)*modAtk) + " 만큼 증가", 0);
			MessageDisplay(_iz, name + " 몬스터 공격력" + ToString(cycle) + " 만큼 증가", 0);
		}
		*/
	}
}




server void OnCharacterLeave(zone _iz, character _char)
{
	//_iz.EndRP(_char);
	character creator;
	
	creator = _iz.GetCreator();
//	creator.ShowMessageView(`OnCharacterLeave called`);
}




server void OnCharacterDie(zone _iz, character _char, character _killer)
{
	string name = _char.GetRaceName();
	dword monsterCnt = _iz.GetMonsterCount() ;
	bool nextstage;
	dword last_stage;
	dword first_stage;
	dword clear_stage_Cnt;


	_iz.GetData(`stage`, last_stage);
	_iz.GetData(`first_stage`, first_stage);
	_iz.SetData(`last_stage`, last_stage);
	_iz.GetData(`nextstage`, nextstage);		// 다음 스테이지로 갈 수 있는가
	
	clear_stage_Cnt = last_stage - first_stage + 1;		// 들어와서 깬 스테이지 갯수. 마지막 스테이지도 클리어로 간주.

	if (name == `dragonegg`)
	{
		object_list cCharList = _iz.GetPlayerList();
		int PlayerCnt = _iz.GetPlayerCount();
		character player;
		int i;

		_iz.ReserveDestroy(30000, `egg is dead`);
		for (i = 0 ; i < PlayerCnt ; i++)
		{
			player = (character)cCharList.GetValue(i);
			player.PlayCutScene(`G8S4_renes_lose`);
			player.ShowCaption(["event.renes.11"]);
		}
	}

	else if (!nextstage && monsterCnt <= 1)
	{
		_iz.SetTimer(`TheEnd`, clear_stage_Cnt, 1*1000);			// 기둥 불 다 끄고 몬스터 다 죽이면 1초 후 끝
	}
}





server void OnTimer(zone _iz, string name, dword userdata)
{
	if(_iz.IsValid())
	{
		int spawnCnt;			 
		dword spawnTime;
		dword stage;		// 지금 몇번째 스테이지인가
		dword cycle;		// 지금 몇번째 사이클인가
		bool nextstage = true;
		character egg;		// 드래곤 알
		int eggLife;			// 드래곤 알의 생명력 퍼센티지
		dword bonus_stage = 0;

		_iz.GetData(`cycle`, cycle);
		_iz.GetData(`bonus_stage`, bonus_stage);
		_iz.GetData(`stage`, stage);
		_iz.GetData(`nextstage`, nextstage);		// 다음 스테이지로 갈 수 있는가
		_iz.GetData(`dragonegg`, egg);		// 다음 스테이지로 갈 수 있는가

		eggLife = egg.GetLife()/egg.GetLifeMax()*100;

		if (eggLife < 20)			// 알 HP 체크해서 경보. 서버 부담되니까 따로 타이머 돌리지 말고 아무 타이머나 돌아올 때마다 체크
		{
			MessageDisplay(_iz, ["event.renes.1"], 0);
		}
		
		//////////////////////////////////////////////
		//
		//		 몬스터 스폰

		if ((name == `allocmonster`) && nextstage)
		{
			int playerCnt = _iz.GetPlayerCount();
			if (playerCnt > 8)
			{
				object_list cCharList = _iz.GetPlayerList();
				character player;
				int i;
				int IsGM =0;
				for (i = 0 ; i < playerCnt ; i++)
				{
					player = (character)cCharList.GetValue(i);
					if (player.GetTitle() == 60000)
					{
						IsGM = 1;		// 던전에 지엠이 있다.
					}
				}

				if (IsGM == 0)		// 지엠이 있으면 던전 소멸 시키면 안된다. 
				{
					MessageDisplay(_iz, ["event.renes.9"], 0);
					_iz.ReserveDestroy(3000, ``);
				}
			}
			if (bonus_stage == 1)
			{
				dword value = 0;
				_iz.SetData(`bonus_stage`, value);
				_iz.DeallocateMonsterRace(`calderagoral_renes`, -1);
			}

			spawnCnt = GetSpawnCnt(stage);					// 현재 스테이지의 스폰 횟수 얻어오기
			spawnTime = GetSpawnTime(stage);					// 현재 스테이지의 스폰 시간 얻어오기

			if (userdata < spawnCnt)		// 해당 스테이지의 몬스터 스폰회수를 다 못채웠으면 같은 종류 계속 스폰
			{
				monsterspawn(_iz, stage);
				_iz.SetTimer(`allocmonster`, userdata + 1, spawnTime);
			}
			else						// 한 스테이지의 몬스터를 모두 스폰시켰으면 다음 스테이지 몬스터 스폰시킨다.
			{
				_iz.SetData(`stage`, (dword)(stage+1));		// 스테이지 증가
				_iz.GetData(`stage`, stage);

				spawnCnt = GetSpawnCnt(stage);					// 현재 스테이지의 스폰 횟수 얻어오기
				spawnTime = GetSpawnTime(stage);					// 현재 스테이지의 스폰 시간 얻어오기

				if (stage%7 == 1)				// 첫번째 몬스터가 다시 나오면 한바퀴 돈 거다.
				{
					_iz.SetData(`cycle`, (dword)(cycle+1));
					_iz.GetData(`cycle`, cycle);
				}

				if (IsDevelopment())
				{
					MessageDisplay(_iz,  ["event.renes.2"]+ ToString(cycle) + ["event.renes.3"]+ ToString(stage), 0);
				}

				monsterspawn(_iz, stage);

				DestroyControlProp(_iz);			// 스테이지가 바뀌면 기둥 디스폰

				_iz.SetTimer(`allocmonster`, 1, spawnTime);						// 앞에서 한번 스폰시켰으니까 1을 넣는다.
				_iz.SetTimer(`spawnControlProp`, 0, spawnCnt*spawnTime/2);		// 스테이지의 절반쯤 왔을 때 기둥 다시 스폰
			}
		}

		if (name == `spawnControlProp` && nextstage)
		{
			CreateControlProp(_iz);
		}

		if (name == `TheEnd`)				// userdata 로 클리어한 스테이지 수가 넘어온다.
		{
			dword monsterCnt = _iz.GetMonsterCount() ;
			dword clear_stage_Cnt = userdata;

			if (monsterCnt <= 1)
			{
				if (clear_stage_Cnt >= 7 )		// 7개 이상 스테이지 클리어하면
				{
					object_list cCharList = _iz.GetPlayerList();
					int PlayerCnt = _iz.GetPlayerCount();
					character player;
					int i;

					if (IsDevelopment())
					{
						MessageDisplay(_iz, ["event.renes.4"]+ ToString(clear_stage_Cnt) + ["event.renes.5"], 1);
					}

					GiveReward(_iz);		// 보상 준다.

					_iz.ReserveDestroy(50000, `cleared`);

					for (i = 0 ; i < PlayerCnt ; i++)
					{
						player = (character)cCharList.GetValue(i);
						player.PlayCutScene(`G8S4_renes_win`);
					}

					if (IsCurrentEvent(`securetherenes2008_korea`))		// 이벤트 기간이면 이벤트용 키워드 추가
					{
						for (i = 0 ; i < PlayerCnt ; i++)
						{
							player = (character)cCharList.GetValue(i);
							player.AddKeyword(`g8s4_event_renes`);
							player.ShowCaption(["event.renes.8"]);
						}
					}
				}
				else
				{
					MessageDisplay(_iz, ["event.renes.6"], 0);
					_iz.ReserveDestroy(0, `cleared less 7`);	
				}
			}
			else
			{
				MessageDisplay(_iz, ["event.renes.7"], 0);			
				_iz.SetTimer(`TheEnd`, clear_stage_Cnt, 20*1000);			// 20 초 후에 다시 체크.
			}
		}
	}
}







///////////////////////////////////////////////////////
//
//		 여기서 부터는 사용자 정의 함수
//
///////////////////////////////////////////////////////


///////////////////////////////////////////////////////
//										
//				리젼 초기화					
//										
///////////////////////////////////////////////////////


server void Initializer(character creator, dword startDelay, zone _iz)
{
	int iRandom;
	int party_cumlevel;

	_iz.SetData(`nextstage`, true);
	dword value  = 1;
	dword value2 = 0;
	
	_iz.SetData(`cycle`, value);		// 7개 스테이지가 1 사이클
	_iz.SetData(`stage`, value);		// 기본적으로 1스테이지 시작
	_iz.SetData(`first_stage`, value);		// 유저가 처음 시작한 스테이지
	_iz.SetData(`last_stage`, value);		// 유저가 마지막으로 종료한 스테이지
	_iz.SetData(`clear_stage`, value2);		// 유저가 클리어한 스테이지 개수
	_iz.SetData(`rewardCnt`, value);		// 유저 레벨에 따른 아이템 보상 개수 차등
	_iz.SetData(`bonus_stage`, value2);		// 이번 판이 보너스 스테이지였는가?   1. 양털 깎기



	//  누적레벨 합
	party_cumlevel = PartyCumLevel(_iz);

	
//	MessageDisplay(_iz, "플레이어 누적레벨 합은 " + ToString(party_cumlevel), 0);
	
	///////////////////////////////////////////////////////
	//										
	//		누적 레벨에 따른 시작스테이지 설정
	//										
	///////////////////////////////////////////////////////

	if (party_cumlevel>500 && party_cumlevel <= 1500)		// 파티 누렙합이 500 에서 1500 사이면 8스테이부터 시작
	{
		value = 8;
		value2 = 2;
		_iz.SetData(`stage`, value);
		_iz.SetData(`first_stage`, value);
		_iz.SetData(`cycle`, value2);
		_iz.SetData(`rewardCnt`, value2);		// 유저 레벨에 따른 아이템 보상 개수 차등
	}
	else if (party_cumlevel>1500 && party_cumlevel <= 3000)	// 파티 누렙합이 1500 에서 3000 사이면 15스테이부터 시작
	{
		value = 15;
		value2 = 3;

		_iz.SetData(`stage`, value);
		_iz.SetData(`first_stage`, value);
		_iz.SetData(`cycle`, value2);
		_iz.SetData(`rewardCnt`, value2);		// 유저 레벨에 따른 아이템 보상 개수 차등
	}
	else if (party_cumlevel>3000)			// 파티 누렙합이 3000 넘으면 22스테이지부터
	{
		value = 22;
		value2 = 4;
		
		_iz.SetData(`stage`, value);
		_iz.SetData(`first_stage`, value);
		_iz.SetData(`cycle`, value2);
		_iz.SetData(`rewardCnt`, value2);		// 유저 레벨에 따른 아이템 보상 개수 차등
	}

	
	_iz.SetTimer(`allocmonster`, 0 , startDelay);			// 입장 후 startDelay 지나면 게임 시작



	_iz.SetTimer(`info1`, 0, 5*1000);				// 게임 안내 사념파 5초 후 부터
	_iz.SetTimer(`info2`, 0, 10*1000);				// 게임 안내 사념파 5초 후 부터
	_iz.SetTimer(`info3`, 0, 15*1000);				// 게임 안내 사념파 5초 후 부터
	_iz.SetTimer(`info4`, 0, 20*1000);				// 게임 안내 사념파 5초 후 부터

	////////////////////////////////////////////
	//
	//	시작시 스폰되어야할 프랍들 리스트
	//
	////////////////////////////////////////////

	_iz.AllocateMonster(`single(DragonEgg:1)`, 140500, 144920);	// 드래곤 알 스폰
	prop collisionbox = _iz.CreateProp(`collisionbox`, 41289, 140500, 144920, `single`);			// 알 충돌박스용 프랍
	collisionbox.SetCollisionAction(`melee/range/magic`);

	// 몬스터 스폰 조절 프랍 - 몬스터가 알로 이동하는 경로에 두지 않는다. 걸치기 방지. (하지만 뒤엉켜서 싸우다보면 걸치기 될껄)
	CreateControlProp(_iz);


	// 몬스터 스폰위치 알려주는 검은 연기
	_iz.CreateProp(`spawnProp1`, 41286, `_Iria_NN_dragoncave01_04`, `mon_Renes1`, -1, `single`);		
	_iz.CreateProp(`spawnProp2`, 41286, `_Iria_NN_dragoncave01_04`, `mon_Renes2`, -1, `single`);
	_iz.CreateProp(`spawnProp3`, 41286, `_Iria_NN_dragoncave01_04`, `mon_Renes3`, -1, `single`);
	_iz.CreateProp(`spawnProp4`, 41286, `_Iria_NN_dragoncave01_04`, `mon_Renes4`, -1, `single`);
}





///////////////////////////////////////////////////////
//
//	스폰 조절 프랍 생성
//
///////////////////////////////////////////////////////

server void CreateControlProp(zone _iz)
{
	_iz.CreateProp(`spawn_control1`, 41287, `_Iria_NN_dragoncave01_04`, `prop_control_01`, -1, `completed`);						// 스폰 속도 조절기			
	_iz.CreateProp(`spawn_control2`, 41287, `_Iria_NN_dragoncave01_04`, `prop_control_02`, -1, `completed`);						// 스폰 속도 조절기			
	_iz.CreateProp(`spawn_control3`, 41287, `_Iria_NN_dragoncave01_04`, `prop_control_03`, -1, `completed`);						// 스폰 속도 조절기			
	_iz.CreateProp(`spawn_control4`, 41287, `_Iria_NN_dragoncave01_04`, `prop_control_04`, -1, `completed`);						// 스폰 속도 조절기			
}




///////////////////////////////////////////////////////
//
//	스폰 조절 프랍 소멸
//
///////////////////////////////////////////////////////

server void DestroyControlProp(zone _iz)
{
	_iz.DestroyProp(`spawn_control1`);
	_iz.DestroyProp(`spawn_control2`);
	_iz.DestroyProp(`spawn_control3`);
	_iz.DestroyProp(`spawn_control4`);
}




///////////////////////////////////////////////////////
//										//
//			message 출력 함수				//		
//										//
//		0 - 사념파		1 - 메시지박스			//
//										//
///////////////////////////////////////////////////////


// type 0 이면 사념파, 1이면 메시지 박스
// 일단 보상도 여기서.

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





///////////////////////////////////////////////////////
//										//
//		리전에 있는 모든 사람에게 컷신			//		
//										//
///////////////////////////////////////////////////////


// type 0 이면 사념파, 1이면 메시지 박스
// 일단 보상도 여기서.

server void ShowCutScene(zone _iz, string _name)
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
		player.PlayCutScene(_name);
	}
}




///////////////////////////////////////////////////////
//
//	Zone 에 속한 캐릭터들의 누적레벨 합 구하기
//
///////////////////////////////////////////////////////

server int PartyCumLevel(zone _iz)
{
	character creator;		// 생성자
	party	pt;				// 파티
	object_list cCharList;
	int isize;
	character player;
	int i;
	int party_cumlevel;

	creator = _iz.GetCreator();
	pt = creator.GetParty();
	cCharList = pt.GetMemberList();
	isize = pt.GetMemberNo();

	if (pt.IsValid())
	{
		for (i = 0 ; i < isize ; i++)
		{
			player = (character)cCharList.GetValue(i);
			party_cumlevel = party_cumlevel + (player.GetCumLevel() + player.GetLevel());
		}
	}
	else
	{
		party_cumlevel = creator.GetCumLevel() + creator.GetLevel();
	}
	return party_cumlevel;
}

///////////////////////////////////////////////////////
//										//
//		프랍 스테이트를 숫자로 변경
//										//
///////////////////////////////////////////////////////

server int GetStateByValue(zone _iz, string propname)
{
	prop _prop;
	int iPropState;
	string sPropState;

	_prop = _iz.FindProp(propname);
	sPropState = _prop.GetState();

	if(propname.Left(13) == `spawn_control`)
	{
		if (sPropState == `default`)	// 이게 불 꺼진 상태
		{
			iPropState = 1;
		}
		else					// 이게 불 켜진 상태
		{
			iPropState = 0;
		}
	}

	return iPropState;
}




////////////////////////////////////////////////////////
//										//
//		이 아래로는 데이타에 관련된 함수			//
//										//
///////////////////////////////////////////////////////


////////////////////////////////////////////////////////
//										//
//		스테이지의 몬스터 리스폰타임을			//
//			프랍 스테이트에 따라 리턴			//
//										//
///////////////////////////////////////////////////////

// 해당 스테이지의 몬스터 리스폰 타임을 스테이트에 따라 리턴.  

server dword GetSpawnTime(int stage)
{
	dword spawn_time;

	switch (stage%7)
	{
		case (0)			// 발록
		{
			 spawn_time = 120;
		}
		case (6)			// 흑표범
		{
			 spawn_time = 60;
		}
		default
		{
			 spawn_time = 30;		// 자코
		}
	}

	spawn_time = spawn_time * 1000;	// sec 를 msec 단위로

	return spawn_time;
}




/////////////////////////////////
//
//   스테이지당 몇 회 스폰해야 하나
//
/////////////////////////////////

server int GetSpawnCnt(int stage)
{
	int cnt;
	
	switch (stage%7)
	{
		case (1)
		{
			cnt = 3;
		}
		case (2)
		{
			cnt = 3;
		}
		case (3)
		{
			cnt = 3;
		}
		case (4)
		{
			cnt = 3;
		}
		case (5)
		{
			cnt = 3;
		}
		case (6)
		{
			cnt = 2;
		}
		case (0)
		{
			cnt = 1;
		}
	}

	return cnt;
}


/////////////////////////////////
//
//   스테이지에 맞는 몬스터 스폰
//
/////////////////////////////////

server bool monsterspawn(zone _iz, int stage)
{
	string monsterName;
	dword _cycle;
	dword clear_stage;
	dword first_stage;
	dword present_stage;
	int monsterKnd = stage%7;
	int iRan = Random(10000);

	_iz.GetData(`stage`, present_stage);
	_iz.GetData(`first_stage`, first_stage);
	clear_stage = present_stage - first_stage;
	

	if (IsDevelopment() && iRan < 3000)			// 개발 서버는 깜짝 스테이지 확률이 30프로
	{
		dword value = 1;
		_iz.SetData(`bonus_stage`, value);		// 이번 판이 보너스 스테이지였는가?   1. 양털 깎기
		monsterName =`single(SheepWolf_Renes:3)`;
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes1`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes2`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes3`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes4`);
		_iz.AllocateMonster(`single(CalderaGoral_Renes:4)`, `_Iria_NN_dragoncave01_04`, `player_point`);

		return true;
	}
	else if (iRan < 40 && monsterKnd <= 5 && monsterKnd >0 && clear_stage > 6 )		// 7 개 이상 스테이지 클리어했을 때 보스 스테이지가 아니면 매 스폰시 0.4% 확률로 깜짝 스테이지 등장
	{
		dword value = 1;
		_iz.SetData(`bonus_stage`, value);		// 이번 판이 보너스 스테이지였는가?   1. 양털 깎기
		monsterName =`single(SheepWolf_Renes:3)`;
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes1`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes2`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes3`);
		_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes4`);
		_iz.AllocateMonster(`single(CalderaGoral_Renes:6)`, `_Iria_NN_dragoncave01_04`, `player_point`);

		return true;
	}
	else
	{
		switch (monsterKnd)
		{
			case (1)
			{
				int iRandom = Random(100);
				if (iRandom < 30)
				{
					monsterName = `single(VolcanoWolf_Renes1:1, VolcanoWolf_Renes1a:2, DesertHunterSpecter_Renes1:1)`;
				}
				else
				{
					monsterName = `single(VolcanoWolf_Renes1:2, VolcanoWolf_Renes1a:2)`;
				}
			}
			case (2)
			{
				int iRandom = Random(100);
				if (iRandom < 50)
				{
					monsterName = `single(VolcanoWildDog_Renes1:2, VolcanoWildDog_Renes1a:2)`;
				}
				else
				{
					monsterName = `single(VolcanoWildDog_Renes1:1, VolcanoWildDog_Renes1a:2, DesertHunterSpecter_Renes1:1)`;
				}
			}
			case (3)
			{
				int iRandom = Random(100);
				if (iRandom < 20)
				{
					monsterName = `single(VolcanoLizard_Renes1:2, VolcanoLizard_Renes1a:2)`;
				}
				if (iRandom < 60)
				{
					monsterName = `single(VolcanoLizard_Renes1a:4)`;
				}
				else if (iRandom  < 80)
				{
					monsterName = `single(VolcanoLizard_Renes1:1, VolcanoLizard_Renes1a:1, DesertHunterSpecter_Renes1:2)`;
				}
				else
				{
					monsterName = `single(VolcanoLizard_Renes1:1, VolcanoLizard_Renes1a:2, DesertHunterSpecter_Renes1:1)`;
				}
			}
			case (4)
			{
				int iRandom = Random(100);
				if (iRandom < 60)
				{
					monsterName = `single(VolcanoHornedWildBoar_Renes1:2, VolcanoHornedWildBoar_Renes1a:2)`;
				}
				else
				{
					monsterName = `single(VolcanoHornedWildBoar_Renes1:1, VolcanoHornedWildBoar_Renes1a:2, DesertHunterSpecter_Renes1:1)`;
				}

			}
			case (5)
			{
				monsterName = `single(VolcanoRockScorpion_Renes1:2, VolcanoRockScorpion_Renes1a:2)`;
			}
			case (6)
			{
				monsterName = `single(BlackLeopard_Renes1:1)`;
			}
			case (0)		
			{
				int iRandom = Random(100);
				if (IsDevelopment() && iRandom < 50)
				{
					monsterName = `single(Small_Balrog:1)`;				
				}
				else if (iRandom <= 2 && clear_stage > 7 )			// 7 개 이상 스테이지 클리어했을 때 3% 확률로 발록 대신 미니 발록 등장
				{
					monsterName = `single(Small_Balrog:1)`;				
				}
				else
				{
					monsterName = `single(Balrog_Renes1:1)`;
				}
			}
		}
	}
	_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes1`);
	_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes2`);
	_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes3`);
	_iz.AllocateMonster(monsterName, `_Iria_NN_dragoncave01_04`, `mon_Renes4`);

	return true;
}


//////////////////////////////////////////////////////////////////////////////////
server void GiveReward(zone _iz)

//	정상적으로 클리어했을 경우의 보상 처리
//////////////////////////////////////////////////////////////////////////////////
{
	dword clear_stage;
	object_list MemberList;
	int playerCnt;
	string reward;
	dword rewardCnt;
	character player;
	int rewardQty;
	int i;

	MemberList = _iz.GetPlayerList();
	playerCnt = _iz.GetPlayerCount();
	_iz.GetData(`clear_stage`, clear_stage);
	_iz.GetData(`rewardCnt`, rewardCnt);

	switch (rewardCnt)			// 시작조건에 따라 보상수준도 다르다. 고레벨은 1스테이지당 1점, 저렙은 3스테이당 1점
	{
		case (1)
		{
			rewardQty = (int) (clear_stage / 3);
		}
		case (2)
		{
			rewardQty = (int) (clear_stage / 2);
		}
		case (3)
		{
			rewardQty = (int) (clear_stage * 2 / 3);
		}
		case (4)
		{
			rewardQty = (int) (clear_stage);
		}
	}

	reward = `additemex(id:73171 quality:` + ToString(rewardQty) +  ` rewardview:true)`;

	for (i = 0 ; i < playerCnt ; i++)
	{
		player = (character)MemberList.GetValue(i);
		player.DoStript(reward);
		if (clear_stage >= 7)
		{
			player.AddKeyword(`clear_Renes`);
		}
		if (rewardQty >= 14 
			&& rewardQty*rewardQty > Random(20000) )	// 저렙은 얻기 힘들다. 2사이클 이상 돌았을 때 스테이지 수에 비례해서 준다. 인챈트 보상
		{
			player.DoStript(`additemex(id:73173rewardview:true)`);
		}
		if (clear_stage >= 21 && Random(100) == 0 )	// 저렙이나 고렙이나 같은 확률로 나온다. else 가 아니기 때문에 위에꺼랑 같이 나올 수 있다. 3사이클 이상에서 1 퍼센트 확률. 무기 보상.
		{
			player.DoStript(`additemex(id:73174 rewardview:true)`);
		}
		
		// 인연 정보를 남긴다.
		if (player.IsStaticPC() &&
			player.IsPartyMember())
		{					
			character other;
			int j;
		
			for (j = 0 ; j < playerCnt ; j++)
			{				
				other = (character)MemberList.GetValue(j);				
				if (player != other &&
					other.IsStaticPC() &&
					player.IsPartyMember(other))
				{
					player.AddRelationEvent(other, 17);
				}
			
			}			
		}		
	}
}