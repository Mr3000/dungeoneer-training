////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             두갈드 : 두갈드 성 던전 인큐버스변신 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//											capella@nexon.co.kr
//                                     jisangs@nexon.co.kr, edits at 2006. 03. 28
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : 던전이 생성되었을 때 캐릭터들의 진입 처리 등을 해준다.
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`아브 네아성 던전 입장`);
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
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
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	character	leader = (character)cCharList.GetValue(0);
	int		i;

	if(_dungeon.GetPlayerList().GetSize() == 1)	// 리더가 혼자 입장했으면
	{
		if(leader.IsFemale())	// 여자이면
		{
			DebugOut(`보스룸 입장시 여자 혼자 입장`);
			// 인큐버스 컷신
			for (i = 0; i < cCharList.GetSize();  i++)
			{
				cChar = (character)cCharList.GetValue(i);
				cChar.PlayCutScene(`bossroom_incubus_abb`);
			}
		}
		else	// 남자이면
		{
			DebugOut(`보스룸 입장시 남자 혼자 입장`);
			// 인큐버스 컷신
			for (i = 0; i < cCharList.GetSize();  i++)
			{
				cChar = (character)cCharList.GetValue(i);
				cChar.PlayCutScene(`bossroom_incubus_abb_transform`);
			}
		}
	}
	else	// 둘 이상이 입장했으면
	{
		DebugOut(`보스룸 입장시 2인 이상 입장`);
		// 해골 병사 컷신
		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			cChar.PlayCutScene(`bossroom_ghostarmy`);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
}
