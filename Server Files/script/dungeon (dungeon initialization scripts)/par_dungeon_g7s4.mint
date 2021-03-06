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
	object_list cMemberList = _dungeon.GetCreatorList();

	character leader = (character)cMemberList.GetValue(0);
	cMemberList.RemoveValue(0);

	leader.PlayCutScene(`iria_bossroom_mirrorwitch_intro`,10, cMemberList);

	if (leader.IsValid())
	{
	puzzle _this;
	// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
	_this = leader.GetCurrentDungeon().GetFloor(leader.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();

	// 이펙트를 여기에서 틀어줘보자
	monster wendigo = _this.FindMonster(`boss`);
	object_list cMonsterList = wendigo.GetCharacterList();
	int monsternum = cMonsterList.GetSize();	

	character	cChar;
	int		i;

	for (i = 0; i < monsternum;  i++)
	{
		cChar = (character)cMonsterList.GetValue(i);
		{
			cChar.ShowEffect(`<effect type='wendigo_spirit' visible='1' />`);
		}
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
