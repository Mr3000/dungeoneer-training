


//////////////////////////////////////////////////////////////////////////////////
server void OnZoneCreate(zone _iz)
//////////////////////////////////////////////////////////////////////////////////
{
	character creator;
	creator = _iz.GetCreator();

	_iz.SetTimer(`init`, 0, 1000);		// 리전 생성 1초후에 몬스터와 프랍 스폰
}

//////////////////////////////////////////////////////////////////////////////////
server void OnZoneClosed(zone _iz)
//////////////////////////////////////////////////////////////////////////////////
{
	stdapi api;
	character npc = api.FindCharacterByName(`gatekeeper_imp02`);
	npc.Move(1011, 22815, 3146);
}

server void OnPropAppear(zone _iz, prop _prop)
{
	character creator;
	creator = _iz.GetCreator();
}

server void OnPropStateChange(zone _iz, prop _prop, string _oldstate, string _newstate)
{
}

server void OnPropDisappear(zone _iz, prop _prop)
{
}

server void OnCharacterEnter(zone _iz, character _char)
{
	string name = _char.GetRaceName();
	if (name == `imprp`)
	{
		_char.KnowTitle(11007);
	}
}

server void OnCharacterLeave(zone _iz, character _char)
{
	character creator;
	creator = _iz.GetCreator();

	string name = _char.GetRaceName();

	_char.RemoveKeyword(`impdream_nostar`);

	if (name == `giantimp_dream`)		// 나간 애가 거대임프면
	{
		int iRandom = Random(100);
		_iz.SetTimer(`mushroom`, 1, iRandom*1000);		// 0~5 분 사이에 다음 버섯이 드랍
	}
}

server void OnCharacterDie(zone _iz, character _char, character _killer)
{	
	string name = _char.GetRaceName();

	if (name == `giantimp_dream`)		// 거대임프가 죽으면
	{
		int iRandom = Random(100);
		_iz.SetTimer(`mushroom`, 1, iRandom*1000);		// 0~5 분 사이에 다음 버섯이 드랍
		_char.PlayCutScene(`event_impdream_lose`);
	}
	if (name == `imprp`)
	{
		_char.PlayCutScene(`event_impdream_lose`);
	}
	if (_char.IsElf() || _char.IsGiant() || _char.IsHuman())		// 이런 일은 없겠지만 만약을 대비해.
	{
		_char.PlayCutScene(`event_impdream_lose`);
	}

	if (name == `gremlin_dream` )
	{
		bool mushroom;
		_iz.GetData(`mushroom`, mushroom);
		if (mushroom)				// 버섯 떨궈야 되는 상황이면
		{
			_char.GenerateAndDropItem(`id:50390`);	
			_iz.SetData(`mushroom`, false);		// 한동안 버섯을 안 떨어뜨림
			int iRandom = Random(100)+300;
			_iz.SetTimer(`mushroom`, 1, iRandom*1000);		// 5~7.5 분 사이에 다음 버섯이 드랍
		}
		_iz.SetTimer(`alloc_gremlin`, 0, 10*1000);			// 10초 후에 그렘린 스폰
	}

	if (name == `ogrebros_event` )
	{
		_iz.SetTimer(`alloc_ogre1`, 0, 180*1000);		// 오거 스폰 주기는 90초
	}
	if (name == `ogrebros_event2` )
	{
		_iz.SetTimer(`alloc_ogre2`, 0, 180*1000);		// 오거 스폰 주기는 90초
	}
	if (name == `ogrebros_event3` )
	{
		_iz.SetTimer(`alloc_ogre3`, 0, 180*1000);		// 오거 스폰 주기는 90초
	}
	if (name == `ogrebros_event4` )
	{
		_iz.SetTimer(`alloc_ogre4`, 0, 180*1000);		// 오거 스폰 주기는 90초
	}
	if (name == `ogrebros_event5` )
	{
		_iz.SetTimer(`alloc_ogre5`, 0, 180*1000);		// 오거 스폰 주기는 90초
	}

	if (name.Left(8) == `ogrebros`)				// 오거 죽으면 점수 올려주자.
	{
		int i;
		object_list MemberList = _iz.GetPlayerList();
		int playerCnt = _iz.GetPlayerCount();
		
		int rank1 = 0;
		int rank2 = 0;
		int rank3 = 0;
		
		string strRanker1;
		string strRanker2;
		string strRanker3;
		
		for (i = 0 ; i < playerCnt ; i++)
		{
			character player = (character)MemberList.GetValue(i);
			int eventpoint = player.GetPVPPoint();
			if (!player.HaveKeyword(`impdream_nostar`))
			{
				if (eventpoint > rank3)
				{
					if (eventpoint > rank1)
					{
						rank3 = rank2;
						strRanker3 = strRanker2;
						
						rank2 = rank1;
						strRanker2 = strRanker1;
						
						rank1 = eventpoint;
						strRanker1 = player.GetOriginalName();
					}
					else if (eventpoint > rank2)
					{
						rank3 = rank2;
						strRanker3 = strRanker2;
						
						rank2 = eventpoint;
						strRanker2 = player.GetOriginalName();
					}
					else
					{
						rank3 = eventpoint;
						strRanker3 = player.GetOriginalName();
					}
				}
			}
		}
		
		stdapi api;
		string strMsg = ["event.impdream.1"]<< _killer.GetOriginalName()<< _char.GetDisplayName();
		if (rank1 != 0)
		{
			strMsg += ["event.impdream.2"]<< strRanker1<<rank1;
		}
		
		if (rank2 != 0)
		{
			strMsg += ["event.impdream.3"]<< strRanker2<<rank2;
		}
		
		if (rank3 != 0)
		{
			strMsg += ["event.impdream.4"]<< strRanker3<<rank3;
		}
		api.AnnounceRegion(_killer.GetRegionGroupId(), strMsg);
	}
}

server void OnTimer(zone _iz, string name, dword userdata)
{
	character creator;

	creator = _iz.GetCreator();
	creator.ShowMessageView(`OnTimer called`);

	if (name == `init`)
	{
		_iz.SetData(`mushroom`, false);		// 버섯을 떨어뜨릴까?

		dword iRandom = (dword)(Random(30));		// 처음은 30 초 안에 드랍 시작
		_iz.SetTimer(`mushroom`, 1, iRandom*1000);	

		_iz.AllocateMonster(`single(OgreBros_Event:1)`, `_Event_impdream`, `ogre01`);
		_iz.AllocateMonster(`single(OgreBros_Event2:1)`, `_Event_impdream`, `ogre01`);
		_iz.AllocateMonster(`single(Gremlin_Dream:12)`, `_Event_impdream`, `ogre01`);

		_iz.AllocateMonster(`single(OgreBros_Event3:1)`, `_Event_impdream`, `ogre02`);
		_iz.AllocateMonster(`single(Gremlin_Dream:6)`, `_Event_impdream`, `ogre02`);

		_iz.AllocateMonster(`single(OgreBros_Event4:1)`, `_Event_impdream`, `ogre03`);
		_iz.AllocateMonster(`single(Gremlin_Dream:6)`, `_Event_impdream`, `ogre03`);

		_iz.AllocateMonster(`single(OgreBros_Event5:1)`, `_Event_impdream`, `ogre04`);
		_iz.AllocateMonster(`single(Gremlin_Dream:6)`, `_Event_impdream`, `ogre04`);
		
		character npc = CreateDynamicNPC(`gatekeeper_imp02`);
		if (!npc.IsValid())
		{			
			// 실패하면 다시 시도한다.
			_iz.SetTimer(`createfail_gatekeeper`, 0, 10000);		// 워프 실패시 10초후에 다시 시도한다.
		}
		
		if(!_iz.WarpCharacterTo(npc, `_Event_impdream`, `npc_point`))
		{
			// 실패하면 다시 시도한다.
			_iz.SetTimer(`warpfail_gatekeeper`, 0, 10000);		// 워프 실패시 10초후에 다시 시도한다.			
		}		

		return;
	}
	else if (name == `createfail_gatekeeper`)
	{
		character npc = CreateDynamicNPC(`gatekeeper_imp02`);
		if (!npc.IsValid())
		{			
			// 실패하면 다시 시도한다.
			_iz.SetTimer(`createfail_gatekeeper`, 0, 10000);		// 워프 실패시 10초후에 다시 시도한다.
		}
		
		if(!_iz.WarpCharacterTo(npc, `_Event_impdream`, `npc_point`))
		{
			// 실패하면 다시 시도한다.
			_iz.SetTimer(`warpfail_gatekeeper`, 0, 10000);		// 워프 실패시 10초후에 다시 시도한다.			
		}
	}
	else if (name == `warpfail_gatekeeper`)
	{
		stdapi api;

		character npc = api.FindCharacterByName(`gatekeeper_imp02`);
		if(!_iz.WarpCharacterTo(npc, `_Event_impdream`, `npc_point`))
		{
			// 실패하면 다시 시도한다.
			_iz.SetTimer(`warp_gatekeeper`, 0, 10000);		// 워프 실패시 10초후에 다시 시도한다.
		}
	}
	else if (name == `reserved_destroy_time`)
	{
		// 종료 시간 설정되면 이곳에서 처리
		qword qwReserved;
		if (_iz.GetData(name, qwReserved))
		{
			stdapi api;
			qword qwCurr = api.GetGlobalTime();
			if (qwReserved >= qwCurr)
			{
				dword dwRemain = qwReserved - qwCurr;
				string strMsg = ["event.impdream.5"]<<(dwRemain/1000);
				api.AnnounceRegion(_iz.GetRegionGroupId(), 6, strMsg); 			// 6은 이벤트용 어나운스 캡션을 의미
				
				_iz.SetTimer(name, 1, 10000);		// 다음 어나운스 예약
			}
		}		
	}
	else if (name == `mushroom`)
	{
		_iz.SetData(`mushroom`, true);		// 버섯을 떨어뜨릴까?		
	}
	else if (name == `alloc_gremlin`)
	{
		int iRandom = Random(5);
		dword monsterCnt = _iz.GetMonsterCount();	

		if (monsterCnt < 35)
		{
			dword spawnCnt = 35 - monsterCnt;
			string spawnString = `single(Gremlin_Dream:` + ToString(spawnCnt) + `)`;

			if (iRandom <= 1) 
			{
				_iz.AllocateMonster(spawnString, `_Event_impdream`, `ogre01`);
			}
			else if (iRandom == 2)
			{
				_iz.AllocateMonster(spawnString, `_Event_impdream`, `ogre02`);
			}
			else if (iRandom == 3)
			{
				_iz.AllocateMonster(spawnString, `_Event_impdream`, `ogre03`);
			}
			else
			{
				_iz.AllocateMonster(spawnString, `_Event_impdream`, `ogre04`);
			}
		}
		return;
	}

	else if (name == `alloc_ogre1`)
	{
		_iz.AllocateMonster(`single(OgreBros_Event:1)`, `_Event_impdream`, `ogre01`);
		return;
	}
	else if (name == `alloc_ogre2`)
	{
		_iz.AllocateMonster(`single(OgreBros_Event2:1)`, `_Event_impdream`, `ogre01`);
		return;
	}
	else if (name == `alloc_ogre3`)
	{
		_iz.AllocateMonster(`single(OgreBros_Event3:1)`, `_Event_impdream`, `ogre01`);
		return;
	}
	else if (name == `alloc_ogre4`)
	{
		_iz.AllocateMonster(`single(OgreBros_Event4:1)`, `_Event_impdream`, `ogre01`);
		return;
	}
	else if (name == `alloc_ogre5`)
	{
		_iz.AllocateMonster(`single(OgreBros_Event5:1)`, `_Event_impdream`, `ogre01`);
		return;
	}
}




server void OnCutSceneEnded_impdream(
	character me,
	object_list character_list,
	meta_map _name)					// 워프 시켜주는 npc 의 네임이 스트링으로 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	stdapi api;
	string npcname =  (string)_name.Get(`npcname`);		//cutscene param 메터에서 npc 이름을 받는다.
	character npc = api.FindCharacterByName(npcname);
	zone iz = api.FindEnterableInstantZone(npc);

	if (!iz.IsNull())
	{
		if (iz.WarpRPTo(me, `_Event_impdream`, `npc_point`, `#imp_RP`))
		{
			me.RemoveItemCls(52004,1);
		}
	}
}

server void OnCutSceneEnded_impdream_win(
	character me,
	object_list character_list,
	meta_map _name)					// 줘야할 아이템이 스트링으로 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	string rewarditem = (string)_name.Get(`rewarditem`);
	me.DoStript(rewarditem);
}



server void OnCutSceneEnded_impdream_lose(
	character me,
	object_list character_list)
//////////////////////////////////////////////////////////////////////////////////
{
	me.EndRolePlaying();
}

//////////////////////////////////////////////////////////////////////////////////
server void EndRP(
	character me,
	object_list character_list,
	meta_map _name)	
//////////////////////////////////////////////////////////////////////////////////
{
	me.EndRolePlaying();
}
	
