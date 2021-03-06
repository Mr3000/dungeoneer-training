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
	if (CheckValidate(_dungeon) && !_player.IsPet())
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_37_a`,1000, cMemberList);
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
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_37_b`,1000, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(_this.Complete()가 이걸 부른다)
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.Resurrect();
		leader.PlayCutScene(`G2_37_e`,0, cMemberList);
		leader.AddKeyword(`g2_complete`);
		leader.RemoveKeyword(`g2_37`);
		leader.RemoveKeyword(`g2`);
		leader.AddSkill(40002,1);
		leader.AddSkill(40003,1);
		leader.AddSkill(40004,1);
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
server void OnGoldGolemCleared(
	dungeon _dungeon)
// 황금 골렘이 쓰러졌다
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.Resurrect();
		leader.PlayCutScene(`G2_37_d`,0, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnRedireCleared(
	dungeon _dungeon)
// 리다이어 쓰러졌다
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.Resurrect();
		leader.PlayCutScene(`G2_37_c`,0, cMemberList);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	if (player.HaveKeyword(`g2_37`))
	{
		player.ForgetSkill(40001);
		player.KnowSkill(40001);
	}

}