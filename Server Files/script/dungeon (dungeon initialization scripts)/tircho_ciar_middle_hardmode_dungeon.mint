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

	//인원이 맞지 않으면 각각 쫓아내고, 종료컷신을 틀어준다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`bossroom_Hardmode_Metalskeleton_Golem4`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	if(IsCurrentEvent(`hardmode_dungeon2008_korea`)) 
	{
		object_list cCharList = _dungeon.GetPlayerList();
		character	cChar;

		int		i;

		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			if(!cChar.HaveKeyword(`g8s2_hardmode_event_basic`))
			{
				cChar.ShowCaption("하드모드 던전을 클리어하여 이벤트에 참여하였습니다.",5000);
				cChar.AddKeyword(`g8s2_hardmode_event_basic`);
			}

			if(!cChar.HaveKeyword(`g8s2_hardmode_event_ciar`))
			{
				cChar.AddKeyword(`g8s2_hardmode_event_ciar`);
			}

			if(cChar.HaveKeyword(`g8s2_hardmode_event_runda`) && cChar.HaveKeyword(`g8s2_hardmode_event_alby`) && cChar.HaveKeyword(`g8s2_hardmode_event_ciar`)  && !cChar.HaveKeyword(`g8s2_hardmode_event_perfect`))
			{
				cChar.ShowCaption("모든 지역의 하드모드 던전을 클리어하여 이벤트에 참여하였습니다.",5000);				
				cChar.AddKeyword(`g8s2_hardmode_event_perfect`);
			}
		}
	}
}
