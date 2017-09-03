////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//											capella@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : 던전이 생성되었을 때 캐릭터들의 진입 처리 등을 해준다.
////////////////////////////////////////////////////////////////////////////////
{
	// 이 던전은 반드시 2명이 와야 한다.
	if (_char_list.GetSize() == 2)
	{
		// 각각의 Role을 입력한다. (object_list의 첫번째 놈이 파티장이다.)
		_dungeon.SetPlayerRole((character)_char_list.GetValue(0), `#ilsa_rp`, true);	// rp-leader로 등록하는 것
		_dungeon.SetPlayerRole((character)_char_list.GetValue(1), `#voight_rp`);  
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{

	_player.DisableSkill(40001); // 팔라딘 스킬 사용못하도록 막음
	_player.DisableSkill(41001); // 다크나이트 스킬 사용못하도록 막음

}

////////////////////////////////////////////////////////////////////////////////
server void OnRPLeaderEntered(
	dungeon _dungeon,
	character _leader)
// : 이 던전에 RP leader가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetRPMemberList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
		// 컷신을 호출한다.
		leader.PlayCutScene(`C3G10_S#10_3_voight_loveaffair_intro`, 0, cMemberList);
	}
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
	CheckValidate(_dungeon);
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
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetRPMemberList();
		int MemberCnt = cMemberList.GetSize();
		character partymember = (character)cMemberList.GetValue(1);
		if (partymember.HaveKeyword(`g10_14`))
		{
			partymember.AddKeyword(`g10_15`);
			partymember.RemoveKeyword(`g10_14`);
		}
		character	leader = (character)cMemberList.GetValue(0);
		if (leader.HaveKeyword(`g10_14`))
		{
			leader.AddKeyword(`g10_15`);
			leader.RemoveKeyword(`g10_14`);
		}
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`C3G10_S#10_4_voight_loveaffair_outro`, 0, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
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

	// 이 던전은 반드시 2명이 와야 한다.
	if (cMemberList.GetSize() == 2)
	{
		return true;
	}
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	//인원이 맞지 않으면 각각 쫓아낸다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		
		cChar = (character)cCharList.GetValue(i);
		cChar.LeaveDungeon();
	}

	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	player.EnableSkill(40001); // 팔라딘 스킬 사용하도록 풀어줌
	player.EnableSkill(41001); // 다크나이트 스킬 사용하도록 풀어줌
}