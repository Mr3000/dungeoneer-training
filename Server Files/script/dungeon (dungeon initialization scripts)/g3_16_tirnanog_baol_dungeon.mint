////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//								    marlin fecit, begins at 2004. 06. 10
//							HanStone@nexon.co.kr, edits at 2005. 06. 1
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : 던전이 생성되었을 때 캐릭터들의 진입 처리 등을 해준다.
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if((_dungeon.GetPlayerLeader()==_player) && !_player.IsPet())
	{
		DebugOut(`G3_16 최종던전에 들어온 파티의 리더 이름:`+_player.GetGeneralName());
		_player.AddKeyword(`g3_16`);
		_player.RemoveKeyword(`g3_15`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnRPLeaderEntered(
	dungeon _dungeon,
	character _leader)
// : 이 던전에 RP leader가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnAllRPMemberEntered(
	dungeon _dungeon)
// : 이 던전에 예약된 모든 RP 캐릭터들이 입장 완료했을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterWarped(
	dungeon _dungeon,
	character _player,
	int _iOldFloor,
	int _iNewFloor)
// : 캐릭터가 층을 옮길 때 (0층은 로비를 뜻한다.)
////////////////////////////////////////////////////////////////////////////////
{
	if (_iOldFloor != 0)		//로비에서 이동은, 파티원이 아직 안들어왔을 수 있으므로 체크를 생략.
	{
		CheckValidate(_dungeon);
	}

}
////////////////////////////////////////////////////////////////////////////////
server void OnSectionComplete(
	dungeon _dungeon,
	int floor,
	int section,
	int region,
	int x,
	int y)
// : 캐릭터가 섹션 끝의 문을 열었을때
////////////////////////////////////////////////////////////////////////////////
{
}
////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cCharList = _dungeon.GetCreatorList();
		character Leader= (character)cCharList.GetValue(0);

		character cChar;
		int i;

		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			cChar.LeaveDungeon();
		}
		DebugOut(`G3_16 최종던전을 클리어한  파티의 리더 이름:`+Leader.GetGeneralName());

		if(Leader.IsQuestTried(230029) && !Leader.IsQuestCompleted(230029))	//미완한 감사인사 퀘스트가 있다면 지운다
		{
			Leader.CleanQuestHistory(230029);
			Leader.AddKeyword(`g3_erase_ThankQuest`);
		}
		if(Leader.IsQuestTried(230030) && !Leader.IsQuestCompleted(230030))
		{
			Leader.CleanQuestHistory(230030);
			Leader.AddKeyword(`g3_erase_ThankQuest`);
		}

		if(Leader.IsQuestTried(230031) && !Leader.IsQuestCompleted(230031))	//미완한 수호부적 퀘스트가 있다면 지운다
		{
			Leader.CleanQuestHistory(230031);
			Leader.AddKeyword(`g3_erase_AmuletQuest`);
		}
		if(Leader.IsQuestTried(230032) && !Leader.IsQuestCompleted(230032))
		{
			Leader.CleanQuestHistory(230032);
			Leader.AddKeyword(`g3_erase_AmuletQuest`);
		}
		if(Leader.IsQuestTried(230052) && !Leader.IsQuestCompleted(230052))	// G3 난이도 하향 미완한 수호부적 퀘스트가 있다면 지운다
		{
			Leader.CleanQuestHistory(230052);
			Leader.AddKeyword(`g3_erase_AmuletQuest`);
		}
		if(Leader.IsQuestTried(230053) && !Leader.IsQuestCompleted(230053))
		{
			Leader.CleanQuestHistory(230053);
			Leader.AddKeyword(`g3_erase_AmuletQuest`);
		}
		//수호부적 회수
		//진행도 키워드 정리
		Leader.RemoveKeyword(`g3`);
		Leader.RemoveKeyword(`g3_18`);
		Leader.RemoveKeyword(`g3_02_dungeonpass`);
		Leader.AddKeyword(`g3_complete`);
		Leader.RemoveKeyword(`g3_14_PreventionOfResurrection`);
		Leader.RemoveKeyword(`g3_CheckTransGenderStart`);
		Leader.AddKeyword(`g3_DarkKnight`);
		cCharList.RemoveValue(0);

		//에린의 수호자 타이틀
		Leader.DoStript(`addtitle(11002)`);

		//보상 인챈트 주기
		if (Leader.GetItemNoInPocket(23)==20)
		{
			//스택포켓까지 차있을 경우에는 아이템을 주지 않고 키워드를 준다
			Leader.AddKeyword(`g3_Reward`);		//이 키워드가 있으면, 보상인챈트를 못받은 것이다
		}
		else
		{
			Leader.DoStript(`additemex(id:62005 suffix:30312 timelimit:3600)`);	//흑요석 인챈트 스크롤. 임시포켓에 들어갔을 경우 시간제한이 1시간이 된다.
		}
		//수호부적이 있다면 수호부적 회수
		Leader.RemoveItemCls(75010);
		Leader.RemoveItemCls(75013);

		if(!Leader.HaveKeyword(`g3_LoveStory_TransGender`) && Leader.HaveKeyword(`g3_15_HiddenB`))
		{
			if(Leader.IsFemale())
			{
				Leader.DoStript(`additemex(id:75012 timelimit:3600)`);
			}
			else
			{
				Leader.DoStript(`additemex(id:75011 timelimit:3600)`);
			}
		}
		//엔딩컷신
		Leader.PlayCutScene(`g3_19_a_EndingDragon`,0, cCharList);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnDieByDungeonBoss(
	dungeon _dungeon,
	character player)
//보스방에서 플레이어 중 누군가 행동불능이 되었다.
////////////////////////////////////////////////////////////////////////////////
{
	/*if (CheckValidate(_dungeon))
	{
		object_list cCharList = _dungeon.GetCreatorList();
		character leader = _dungeon.GetPlayerLeader();
		
		//죽은게 리더라면
		if(leader == player)
		{
			DebugOut(`리더가 죽었다`);
			puzzle _this;
			// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
			_this = leader.GetCurrentDungeon().GetFloor(leader.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();

			if(_this.Get(`bossmonstername`).LowerCase()==`ruari`)	//이방의 보스가 루에리였다
			{
				DebugOut(`보스는 루에리였다`);

				_this.Set(`bossmonstername`,`dragon`);	//보스 이름을 드래곤으로 바꾼다

				DebugOut(`G3최종던전에서 루에리한테 누군가 쓰러져서, 컷신으로 넘어간다`);
				// 일단 타이머 해제
				_dungeon.RemoveAlarm();
				int i; /////////////왜 이 부분이 있으면 루에리만 사라지냐고!!!!
				character cChar;
				//쓰러진 놈이 누군진 모르지만 일단 다 살리고
				for (i = 0; i < cCharList.GetSize();  i++)
				{
					cChar = (character)cCharList.GetValue(i);
					cChar.Resurrect();
				}
				//루에리를 찾아 제거한다.
				monster pinky =  _this.FindMonster(`ruari`);
				pinky.Release();		// 왜 핑키냐고 묻지마소오
				pinky =  _this.FindMonster(`morgant`);
				pinky.Release();	
			}
		}
	}*/
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		DebugOut(`G3최종던전에서 던전 보스방 문이 열렸다, 컷신을 틀자`);
		object_list cCharList = _dungeon.GetCreatorList();
		character cLeader=(character)cCharList.GetValue(0);
		DebugOut(`G3최종던전 루에리 모르간트 컷신을 틀어줄 리더으 이름:`+ cLeader.GetGeneralName());

		puzzle _this;
		// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
		_this = cLeader.GetCurrentDungeon().GetFloor(cLeader.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();

		DebugOut(`루에리-모르간트 컷신에 인자를 넘겨줄 준비!!!!!!`);
		meta_map cutscene_param;
		cutscene_param.Set(`puzzle_name`,_this.GetFullName());

		cCharList.RemoveValue(0);
		cLeader.AddKeyword(`g3_17`);
		cLeader.RemoveKeyword(`g3_16`);
		cLeader.PlayCutScene(`g3_17_a_Ruairi_VS_Morgant`,0,cCharList,cutscene_param);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_17_a_Ruairi_VS_Morgant(
	character me,				// 컷신을 본 나.
	object_list _cMemberList,
	meta_map cutscene_param
)	
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`G3최종던전에서 루에리 모르간트 등장컷신을 보고, 타이머를 세팅한다`);

	string puzzle_name;
	puzzle _this;
	puzzle_name =  (string)cutscene_param.Get(`puzzle_name`); //cutscene param 메터에서 퍼즐네임을 받고
	_this = FindPuzzle(puzzle_name); //그 이름에서 이 퍼즐을 찾아낸다!!!
	dungeon _dungeon = _this.GetDungeon();	//그 퍼즐에서 이 던전의 이름을 찾는다

	if (CheckValidate(_dungeon))
	{
		_dungeon.ScheduleAlarm(30); //이 던전에 타이머 세팅 1분 있다 OnAlarm(dungeon _dungeon)을 불러라
		DebugOut(`타이머 세팅 완료`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_17_b_AllStarShow(
	character me,				// 컷신을 본 나.
	object_list _cMemberList,
	meta_map cutscene_param
)	
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`G3최종던전에서 올스타 컷신을 보고, 드래곤을 세팅한다.`);
	me.Resurrect();
	string puzzle_name;
	puzzle _this;
	puzzle_name =  (string)cutscene_param.Get(`puzzle_name`); //cutscene param 메터에서 퍼즐네임을 받고
	_this = FindPuzzle(puzzle_name); //그 이름에서 이 퍼즐을 찾아낸다!!!
	
	_this.AllocateMonster(
		0, 
		`dragon`,
		`center`,						// 배치 템플릿 이름 
		`single(CrommCruaich_stone:1)`);	//석화된 크로우 크로아흐
}
////////////////////////////////////////////////////////////////////////////////
server void OnAlarm(dungeon _dungeon)
// : 알람이 울렸다.
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`G3최종던전에서 1분을 버텨서, 루에리를 제거하고 컷신으로 넘어간다`);

	if (CheckValidate(_dungeon))
	{
		//리더가 아직 던전에 있어야 한다
		object_list cCharList = _dungeon.GetCreatorList();
		character leader = (character)cCharList.GetValue(0);

		// 일단 타이머 해제
		_dungeon.RemoveAlarm();
		DebugOut(`타이머 해제`);

		puzzle _this;
		// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
		_this = leader.GetCurrentDungeon().GetFloor(leader.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();

		//보스 이름을 드래곤으로 바꾼다
		_this.Set(`bossmonstername`,`dragon`);

		monster pinky =  _this.FindMonster(`ruari`);
		pinky.Release();
		pinky =  _this.FindMonster(`morgant`);
		pinky.Release();	
		DebugOut(`시간이 다되어 루에리 제거`);

	}
}
////////////////////////////////////////////////////////////////////////////////
server bool CheckValidate(
	dungeon _dungeon) 
// : 이 던전에 필요한 인원이 유지되고 있는지 체크하여 리턴한다.
////////////////////////////////////////////////////////////////////////////////
{
	character leader = _dungeon.GetPlayerLeader();
		
	//리더가 아직 던전에 있어야한다
	if (leader.IsValid())
	{
		return true;
	}

	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	//인원이 맞지 않으면 각각 쫓아내고, 종료컷신을 틀어준다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.LeaveDungeon();
		cChar.PlayCutScene(`G2_LeaveDungeon`);
	}

	return false;
}
///////////////////////////////////////////////////////////////////////////////
server bool GetRespawnList(
	dungeon _dungeon,
	character _player,
	string& _list)
// : 이 던전에서 가능한 리스폰 리스트를 리턴한다.
// : 현재 `town;here;stay;nao;dungeon_lobby;dungeon_statue;arena_lobby;arena_side` 가능
////////////////////////////////////////////////////////////////////////////////
{
	_list = `town`;
	_list += `;dungeon_lobby`;
	_list += `;stay`;

	return true;
}
