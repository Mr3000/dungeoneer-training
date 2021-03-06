///////////////////////////////////////////////////////////////////////////////
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
	if (CheckValidate(_dungeon) && !_player.IsPet())
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_08_a_Paladin_exercises`,1000, cMemberList);
	}
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
	//임시로 1층 첫번째 섹션 끝 방 문이 열렸을 때 트리아나 컷신 나오게 되어있음. 나중에 빼야함.
	CheckValidate(_dungeon);
	/*if(floor==1 && section==1)
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_08_b_Paladin_exercises`,0, cMemberList);
	}

	*/
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
/*///////////////////////////////////////////////////////////////////////////////
server void OnTrionaRoomOpened(
	dungeon _dungeon)
//  : 트리아나 방문이 열렸을 때
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_08_b_Paladin_exercises`,0, cMemberList);
	}
}
*/
/*///////////////////////////////////////////////////////////////////////////////
server void OnTrionaCleared(
	dungeon _dungeon)
//  : 트리아나가 쓰러졌을 때
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut("트리아나가 쓰러져서 컷신 트는 함수가 불렸다");
	if (CheckValidate(_dungeon))
	{
		meta_map cutscene_param;
		cutscene_param.Set(`puzzle_name`,_this.GetFullName()); //컷신에 인자를 넘겨줄 준비!!!!!!!
		
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_08_c_Paladin_exercises`,0, cMemberList , cutscene_param);
	}
}
*/
////////////////////////////////////////////////////////////////////////////////
server void OnFellowNPCCleared(
	dungeon _dungeon)
//  : 동료 NPC가 쓰러졌을 때
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.Resurrect();
		leader.PlayCutScene(`G2_08_d_Paladin_exercises`,1000, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool CheckValidate(
	dungeon _dungeon) 
// : 이 던전에 필요한 인원이 유지되고 있는지 체크하여 리턴한다.
////////////////////////////////////////////////////////////////////////////////
{
	object_list cMemberList = _dungeon.GetCreatorList();

	// 이 던전은 반드시 1명이 와야 한다.
	if (cMemberList.GetSize() == 1)
	{
		character leader = _dungeon.GetPlayerLeader();
		
		//리더가 아직 던전에 있어야한다
		if (leader.IsValid())
		{
			return true;
		}
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
////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	player.EnableSkill(40001); // 팔라딘 스킬 사용하도록 풀어줌
	player.EnableSkill(41001); // 다크나이트 스킬 사용하도록 풀어줌
}