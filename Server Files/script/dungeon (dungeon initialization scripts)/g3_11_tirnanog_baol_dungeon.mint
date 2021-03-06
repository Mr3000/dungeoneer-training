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
}
////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		if(_player.HaveKeyword(`g3_09`) && !_player.IsPet())
		{
			_player.PlayCutScene(`g3_10_a_RuairiTriona`);
			_player.RemoveKeyword(`g3_09`);
			_player.AddKeyword(`g3_11`);
		}
	_player.DisableSkill(40001); // 팔라딘 스킬 사용못하도록 막음
	_player.DisableSkill(41001); // 다크나이트 스킬 사용못하도록 막음

	_player.DisableSkill(30302);
	_player.DisableSkill(30202);
	_player.DisableSkill(30102);

	_player.DisableSkill(30101);
	_player.DisableSkill(30201);
	_player.DisableSkill(30301);
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
	if (CheckValidate(_dungeon))
	{
		object_list cCharList = _dungeon.GetCreatorList();
		character cLeader=(character)cCharList.GetValue(0);
		
		cLeader.Move(14,34981,42696);	//어짜피 솔플..
		cLeader.RemoveKeyword(`g3_11`);
		cLeader.RemoveKeyword(`g3_08_LiaFail`);
		cLeader.RemoveKeyword(`g3_09_GiveTarbook_To_Aodhan`);
		cLeader.RemoveKeyword(`g3_09_GiveTarbook_To_Eavan`);
		cLeader.RemoveKeyword(`g3_11_DungeonPass`);
		cLeader.AddKeyword(`g3_12_CrommCruaich`);
		cLeader.AddKeyword(`g3_13`);
		cLeader.RemoveItemCls(19011);
		cLeader.PlayCutScene(`g3_12_a_DiscoverTheDragon`,0);
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
server void OnDieInDungeon(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	/*
	OnCharacterLeaved에서도 이미 불리기 때문에 여기서 또 인에이블 해주면 골아푸다캄다
	player.EnableSkill(40001); // 팔라딘 스킬 사용하도록 풀어줌
	player.EnableSkill(41001); // 다크나이트 스킬 사용하도록 풀어줌

	player.EnableSkill(30202);
	player.EnableSkill(30102);

	player.EnableSkill(30101);
	player.EnableSkill(30201);
	player.EnableSkill(30301);*/ 

	if(!player.IsPet())
	{
		player.DoStript(`additemex(id:75006 timelimit:600)`);
		player.PlayCutScene(`g3_11_a_fail`,0);	
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

	player.EnableSkill(30302);
	player.EnableSkill(30202);
	player.EnableSkill(30102);

	player.EnableSkill(30101);
	player.EnableSkill(30201);
	player.EnableSkill(30301);
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