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
	// 1층의 0번 퍼즐, 2층의 0번 퍼즐, 3층의 0번 퍼즐에 변수를 세팅해 놓는다.
	int rand = Random(8);
	DebugOut(`neko random seed = ` + ToString(rand));

	dungeon_floor floor1 = _dungeon.GetFloor(0);
	puzzle_template template1 = floor1.GetPuzzleTemplateByCustomSectionIndex(0, 0);
	if (rand == 0 || rand == 1 || rand == 2 || rand == 3)
	{
		template1.FindPuzzle(`monster1`).Set(`warp_seed`, `0`);
	}
	else
	{
		template1.FindPuzzle(`monster1`).Set(`warp_seed`, `1`);
	}

	dungeon_floor floor2 = _dungeon.GetFloor(1);
	puzzle_template template2 = floor2.GetPuzzleTemplateByCustomSectionIndex(0, 0);
	if (rand == 0 || rand == 1 || rand == 4 || rand == 5)
	{
		template2.FindPuzzle(`monster1`).Set(`warp_seed`, `0`);
	}
	else
	{
		template2.FindPuzzle(`monster1`).Set(`warp_seed`, `1`);
	}

	dungeon_floor floor3 = _dungeon.GetFloor(2);
	puzzle_template template3 = floor3.GetPuzzleTemplateByCustomSectionIndex(0, 0);
	if (rand == 0 || rand == 2 || rand == 4 || rand == 6)
	{
		template3.FindPuzzle(`monster1`).Set(`warp_seed`, `0`);
	}
	else
	{
		template3.FindPuzzle(`monster1`).Set(`warp_seed`, `1`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	_player.PlayCutScene(`JG_dungeon_enter`);
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
		cChar.PlayCutScene(`JG_dungeon_boss`);
	}

}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
}
