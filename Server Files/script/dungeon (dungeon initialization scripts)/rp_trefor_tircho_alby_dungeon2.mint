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
	// 이 던전은 반드시 1명이 와야 한다.
	if (_char_list.GetSize() == 1)
	{
		// 각각의 Role을 입력한다. (object_list의 첫번째 놈이 파티장이다.)
		_dungeon.SetPlayerRole((character)_char_list.GetValue(0), `#trefor`, true);  // rp-leader로 등록하는 것
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
		leader.PlayCutScene(`RP_Trefor_00_a`, 0, cMemberList);
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
	object_list cMemberList = _dungeon.GetRPMemberList();

	character	leader = (character)cMemberList.GetValue(0);
	cMemberList.RemoveValue(0);

	if(_iOldFloor==0 && _iNewFloor ==1 )
	{
		if(_player.HaveKeyword(`RP_Trefor_Failed_3`))
			leader.PlayCutScene(`RP_Trefor_00_g`, 0, cMemberList);
		else if (_player.HaveKeyword(`RP_Trefor_Failed_2`))
			leader.PlayCutScene(`RP_Trefor_00_g`, 0, cMemberList);
		else if (_player.HaveKeyword(`RP_Trefor_Failed_1`))
			leader.PlayCutScene(`RP_Trefor_00_f`, 0, cMemberList);
		else
			leader.PlayCutScene(`RP_Trefor_00_e`, 0, cMemberList);
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
	CheckValidate(_dungeon);
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
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
		cChar.PlayCutScene(`G1_LeaveDungeon`);
	}

	return false;
}
//////////////////////////////////////////////////////////////////////////////////
server void RP_Failed_Trefor(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 0  여신의 메시지 컷신이 끝날 때.
//////////////////////////////////////////////////////////////////////////////////
{
//	me.AddKeyword(`RP_Tracy_Completed`);
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		member.LeaveDungeon();
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTravelerDied(
	dungeon _dungeon)
// : 행인이 죽어서 구출 실패
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetRPMemberList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`RP_Trefor_00_b`, 1500, cMemberList);
		if(leader.HaveKeyword(`RP_Trefor_Failed_1`))
		{
			leader.AddKeyword(`RP_Trefor_Failed_2`);
			leader.RemoveKeyword(`RP_Trefor_Failed_1`);
		}
		else 
		if(leader.HaveKeyword(`RP_Trefor_Failed_2`))
		{
			leader.AddKeyword(`RP_Trefor_Failed_3`);
			leader.RemoveKeyword(`RP_Trefor_Failed_2`);
		}
		else
		if(!leader.HaveKeyword(`RP_Trefor_Failed_1`) && !leader.HaveKeyword(`RP_Trefor_Failed_2`) && !leader.HaveKeyword(`RP_Trefor_Failed_3`))
		{
			leader.AddKeyword(`RP_Trefor_Failed_1`);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnGoblinCleared(
	dungeon _dungeon)
// : 거미 잡아서 구출 성공
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetRPMemberList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`RP_Trefor_00_d`, 1500, cMemberList); //코믹 엔딩 컷신

		leader.AddKeyword(`RP_Trefor_Complete`);
		// leader.AddKeyword(`RP_Trefor_LifeGuard`); //2회 이상 실패한 사람은 코믹 엔딩 & 보상 없음

		leader.RemoveKeyword(`RP_Trefor_Failed_1`);
		leader.RemoveKeyword(`RP_Trefor_Failed_2`);
		leader.RemoveKeyword(`RP_Trefor_Failed_3`);
	}
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