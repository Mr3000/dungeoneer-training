////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//													marlin22@nexon.co.kr
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
		leader.PlayCutScene(`G1_40_a_Cichol`, 1500, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDarkLordDie(
    dungeon _dungeon)
// : 다크 로드가 죽은 순간
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.Resurrect();
		leader.PlayCutScene(`G1_40_b_Cichol`, 2000, cMemberList);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);

		if (leader.HaveKeyword(`g1_revive_of_glasgavelen`) && leader.HaveKeyword(`g1_38`))
		{
			//G1 클리어의 키워드 정리
			leader.Resurrect();
			leader.RemoveKeyword(`g1_revive_of_glasgavelen`);	//글라스 기브넨의 부활
			leader.AddKeyword(`g1_KnightOfTheLight`);		//빛의 기사 키워드
			leader.AddKeyword(`g1_ending_cutscene`);		//이 키워드가 있으면, 엔딩컷신을 다 안본것이다
			leader.AddKeyword(`g1_complete`);
			leader.RemoveKeyword(`g1_38`);
			leader.RemoveKeyword(`g1`);
			leader.DoStript(`addtitle(11001)`);			//여신을 구출한 타이틀

			if (leader.GetItemNoInPocket(20)==20)
			{
				//스택포켓까지 차있을 경우에는 아이템을 주지 않고 키워드를 준다
				leader.AddKeyword(`g1_ending_enchant`);	//이 키워드가 있으면, 보상인챈트를 못받은 것이다
			}
			else
			{
				leader.DoStript(`additemex(id:62005 prefix:30310 timelimit:3600)`);	//여신의 인챈트 스크롤. 임시포켓에 들어갔을 경우 시간제한이 1시간이 된다.
			}

		}
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G1_41_b_Glas`, 2000, cMemberList);
	}
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
	// task[2265]
	// 바인드 이후
	if (	(_player.IsQuestCompleted(210011) ||  _player.IsQuestCompleted(211011) || _player.IsQuestCompleted(211111))
		&& _player.HaveKeyword(`g1_bind`)	)
	{
		_list = `;tirnanog`;
	}
	// 바인드 이전
	else
	{
		_list = `town`;
	}		
	// 오버라이드 했다는 의미로 return true;
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
	object_list cMemberList = _dungeon.GetCreatorList();

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
		cChar.PlayCutScene(`G1_LeaveDungeon`);
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