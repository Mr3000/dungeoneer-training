////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//											capella@nexon.co.kr
//					jisangs@nexon.co.kr edits at 2005. 11. 13
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : 던전이 생성되었을 때 캐릭터들의 진입 처리 등을 해준다.
////////////////////////////////////////////////////////////////////////////////
{
	// 이 던전은 반드시 1명이 와야 한다.
	if (_char_list.GetSize() == 1)
	{
		character Leader = (character)_char_list.GetValue(0);
		DebugOut(`던전 입장` + `, 이 캐릭터의 이름은 : ` + Leader.GetDisplayName());
/*
		Leader.AddKeyword(`G3_DarkKnight_RuariRP_hidden`); // 루에리RP 수행중임을 확인하는 키워드 입수 - 운영팀 요청으로 추가

		// 다크나이트의 갑옷 조각 모으기 퀘스트 제거
		if (Leader.IsQuestCompleted(230102))
		{
			DebugOut(`230102 퀘스트 이미 완료되어 있음`);
		}
		else if(Leader.IsQuestTried(230102))
		{
			DebugOut(`230102 퀘스트 종료시키기`);
			Leader.CleanQuestHistory(230102); // 다크나이트의 갑옷 조각 모으기 퀘스트를 삭제
			Leader.ForceCompleteQuest(230102); // 다크나이트의 갑옷 조각 모으기 퀘스트를 한 것으로 처리
		}

		// 다크나이트 갑옷 제거 퀘스트 제거
		if (Leader.IsQuestCompleted(230104))
		{
			DebugOut(`230102 퀘스트 이미 완료되어 있음`);
		}
		else if(Leader.IsQuestTried(230104))
		{
			DebugOut(`230102 퀘스트 종료시키기`);
			Leader.CleanQuestHistory(230104); // 다크나이트 갑옷 제거 퀘스트를 삭제
			Leader.ForceCompleteQuest(230104); // 다크나이트 갑옷 제거 퀘스트를 한 것으로 처리
			Leader.RemoveItemCls(75110); // 여명의 포션
		}
*/
		// 각각의 Role을 입력한다. (object_list의 첫번째 놈이 파티장이다.)
		_dungeon.SetPlayerRole((character)_char_list.GetValue(0), `#Lugh4`, true);  // rp-leader로 등록하는 것
	}

}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	_player.TransformToPaladin();
	_player.StopTransformTimer();
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
	object_list cMemberList = _dungeon.GetCreatorList();
	character Leader=(character)cMemberList.GetValue(0);
/*
	DebugOut(ToString(_iNewFloor) + `층입니다`);
	if(_iNewFloor == 1)
	{
		_player.TransformToDarkKnight();
		_player.PlayCutScene(`dark_knight_change_2`);
		// 키홀? 모르간트? 의 사념파
		_player.ShowCaption(["dungeon.g3rp_darkknight_bari_dungeon.1"]);
	}
	if(_iNewFloor == 2)
	{
		// 키홀? 모르간트? 의 사념파
		_player.ShowCaption(["dungeon.g3rp_darkknight_bari_dungeon.2"]);
	}
	if(_iNewFloor == 3)
	{
		// 키홀? 모르간트? 의 사념파
		_player.ShowCaption(["dungeon.g3rp_darkknight_bari_dungeon.3"]);
	}
*/
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
	CheckValidate(_dungeon);
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	object_list cMemberList = _dungeon.GetCreatorList();
	character Leader=(character)cMemberList.GetValue(0);

	// 키홀? 모르간트? 의 사념파
//	Leader.ShowCaption(["dungeon.g3rp_darkknight_bari_dungeon.4"]);
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);

	object_list cCharList = _dungeon.GetPlayerList();
	character Leader = (character)cCharList.GetValue(0);

	// 컷신을 호출한다.
//	Leader.PlayCutScene(`cutscene_get_darkknight_skill_02_Ruairy`, 4000, cCharList);

	DebugOut(`던전 보스 종료`);
}
////////////////////////////////////////////////////////////////////////////////
server bool GetRespawnList(
	dungeon _dungeon,
	character _player,
	string& _list)
// : 이 던전에서 가능한 리스폰 리스트를 리턴한다.
// : 현재 `town;here;stay;nao;dungeon_lobby;dungeon_statue;arena_lobby;arena_side` 가능
////////////////////////////////////////////////////////////////////////////////
{
//	_list += `;town`;
	_list += `;dungeon_lobby`;
	_list += `;dungeon_statue`;	
//	_list += `;nao`;	
	_list += `;stay`;

	// 오버라이드 했다는 의미로 return true;
	return true;
}
////////////////////////////////////////////////////////////////////////////////
server bool CheckValidate(
	dungeon _dungeon) 
// : 이 던전에 필요한 인원이 유지되고 있는지 체크하여 리턴한다.
////////////////////////////////////////////////////////////////////////////////
{
	object_list cMemberList = _dungeon.GetRPMemberList();

	// 이 던전은 반드시 1명이 와야 한다.
	if (cMemberList.GetSize() == 1)
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
//		cChar.PlayCutScene(`G1_LeaveDungeon`);
	}

	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	if (!player.HaveKeyword(`paladin_RP_G2_overseas`))
	{
			character orgChar = player.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
			orgChar.RcvItem(orgChar, 91147);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnDieInDungeon(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	player.LeaveDungeon();
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G3RP_DarkKnight_Ruari(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G3 루에리 컷신 보고 난 후
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`컷신 보고 난 후, 이 캐릭터의 이름은 : ` + me.GetDisplayName());
	// 키워드 입수
	me.LeaveDungeon();

	// 아래 Move를 실행하면, 루에리RP 던전 밖으로 나가는 것으로 처리된다.
	// Leader.Move(`Ula_Crossroad/_Ula_Crossroad/Cross_from_BanWarpdoor`); // 저세상으로 워프시켜줘야 함
}