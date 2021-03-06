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
// jisangs begin
	if((_dungeon.GetPlayerLeader()==_player) && !_player.IsPet())
	{
		object_list cCharList = _dungeon.GetPlayerList();
		cCharList.RemoveValue(0);
		_player.PlayCutScene(`cutscene_get_skill_paladin_01`,0,cCharList);
	}
// jisangs end
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
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`cutscene_get_skill_paladin_02`);
	}

}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
// jisangs begin
	if (CheckValidate(_dungeon))
	{
		object_list cCharList = _dungeon.GetCreatorList();
		character Leader= (character)cCharList.GetValue(0);

		Leader.AddSkill(40013, 1); //팔라딘 마나 리프랙터
		Leader.AddSkill(40012, 1); //팔라딘 헤비 스탠더
		Leader.AddSkill(40011, 1); //팔라딘 내츄럴 실드

		Leader.ShowCaption(["dungeon.emain_coill_dungeon_paladin.1"]);

		Leader.RemoveKeyword(`Book_of_Paladin_hidden`);
		Leader.RemoveKeyword(`Book_of_Paladin_complete`);
		Leader.RemoveKeyword(`Book_of_Paladin_G2_complete`);
		Leader.RemoveKeyword(`Book_of_Paladin_G2_jump`);

		Leader.RemoveKeyword(`Book_of_Paladin_page1`);
		Leader.RemoveKeyword(`Book_of_Paladin_page2`);
		Leader.RemoveKeyword(`Book_of_Paladin_page3`);
		Leader.RemoveKeyword(`Book_of_Paladin_page4`);
		Leader.RemoveKeyword(`Book_of_Paladin_page5`);
		Leader.RemoveKeyword(`Book_of_Paladin_page6`);
		Leader.RemoveKeyword(`Book_of_Paladin_page7`);

		Leader.RemoveKeyword(`Book_of_Paladin_Shena`);
		Leader.RemoveKeyword(`Book_of_Paladin_Shena_1`);
		Leader.RemoveKeyword(`Book_of_Paladin_Shena_2`);
		Leader.RemoveKeyword(`Book_of_Paladin_Beggar_1`);
		Leader.RemoveKeyword(`Book_of_Paladin_Beggar_2`);

		Leader.RemoveKeyword(`Book_of_Paladin_Craig_hidden`);

		Leader.RemoveItemCls(74201); // 팔라딘의 서 - 5페이지
		Leader.RemoveItemCls(74202); // 팔라딘의 서 - 7페이지
		Leader.RemoveItemCls(74203); // 각성의 부적

		Leader.RemoveItemCls(74204); //팔라딘의 서 - 1페이지
		Leader.RemoveItemCls(74205); //팔라딘의 서 - 2페이지
		Leader.RemoveItemCls(74206); //팔라딘의 서 - 3페이지
		Leader.RemoveItemCls(74207); //팔라딘의 서 - 4페이지
		Leader.RemoveItemCls(74208); //팔라딘의 서 - 5페이지
		Leader.RemoveItemCls(74209); //팔라딘의 서 - 6페이지
		Leader.RemoveItemCls(74210); //팔라딘의 서 - 7페이지

		Leader.RemoveItemCls(74211); // 팔라딘의 서 - 훼손된 페이지
		Leader.RemoveItemCls(74212); // 바리 던전 통행증
		Leader.RemoveItemCls(73061); // 보존의 마법가루

		Leader.RemoveItemCls(70078); //진행중이던 모든 페이지 수집 퀘스트 삭제

		cCharList.RemoveValue(0);
		if(Leader.IsFemale())
		{
			Leader.PlayCutScene(`cutscene_get_skill_paladin_03_female`,0, cCharList);
		}
		else
		{
			Leader.PlayCutScene(`cutscene_get_skill_paladin_03_male`,0, cCharList);
		}
	}
// jisangs end
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