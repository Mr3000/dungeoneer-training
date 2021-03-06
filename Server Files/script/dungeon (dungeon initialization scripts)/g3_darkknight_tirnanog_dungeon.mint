////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//											capella@nexon.co.kr
//					jisangs@nexon.co.kr edits at 2005. 11. 13
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
	object_list cMemberList = _dungeon.GetCreatorList();
	character Leader=(character)cMemberList.GetValue(0);

	DebugOut(_dungeon.GetName());
	DebugOut(`다크나이트 입수 : 알베이 던전에 입장`);
	G3_DarkKnight_Dungeon_ShowCaption(Leader, _dungeon.GetName(), 0) extern (`data/script/korea/npc/g3_darkknight.mint`);
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
	object_list cMemberList = _dungeon.GetCreatorList();
	character Leader=(character)cMemberList.GetValue(0);

	DebugOut(ToString(_iNewFloor) + `층입니다`);
	G3_DarkKnight_Dungeon_ShowCaption(Leader, _dungeon.GetName(), _iNewFloor) extern (`data/script/korea/npc/g3_darkknight.mint`);
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
	object_list cMemberList = _dungeon.GetPlayerList();
	character Leader=(character)cMemberList.GetValue(0);
	DebugOut(`다크나이트 입수 : 보스룸 입장`);

	G3_DarkKnight_Dungeon_ShowCaption(Leader, _dungeon.GetName(), 5) extern (`data/script/korea/npc/g3_darkknight.mint`);
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	object_list cMemberList = _dungeon.GetPlayerList();
	character Leader=(character)cMemberList.GetValue(0);
	cMemberList.RemoveValue(0);

	// 블랙 위자드 컷신 직전에 모든 내용 처리
	// 키워드, 아이템 얻는 사념파 안보이는것이 안타까움 <- 나중에 보완책 찾아보기
	Leader.RemoveKeyword(`G3_DarkKnight_Armor_Last`); // 알베이 던전 통행증 발급 제거
	Leader.AddKeyword(`G3_DarkKnight_Armor4_hidden`); // 갑옷조각4 수집 완료
	Leader.AddKeyword(`G3_DarkKnight_Temptation`); // 다크나이트 RP 던전 통행증 입수용
	Leader.AddKeyword(`G3_DarkKnight_Temptation_hidden`); // 다크나이트 RP 던전, 알베이 던전2 입장용

	Leader.RemoveItemCls(75100); // 다크나이트의 갑옷조각0 제거
	Leader.RemoveItemCls(75101); // 다크나이트의 갑옷조각1 제거
	Leader.RemoveItemCls(75102); // 다크나이트의 갑옷조각2 제거
	Leader.RemoveItemCls(75103); // 다크나이트의 갑옷조각3 제거
	Leader.DoStript(`additemex(id:75106)`); // 강제 지급 - 갑옷조각0 자리에 100% 들어가기 때문에 예외처리 없음

	// 컷신을 호출한다.
	cMemberList.RemoveValue(0);
	// 보스 다 잡고 보상방 가는 타이밍에 컷신 play
	Leader.PlayCutScene(`cutscene_get_darkknight_skill_01_BlackWizard`, 3000, cMemberList);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_BlackWizard_Temptation(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 알베이던전1 - 블랙위자드의 유혹 컷신이 끝난 후 처리
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(`Uladh_main/town_TirChonaill/TirChonaill_Spawn_A`); // 티르 코네일로 강제이동

	me.DoStript(`additemex(id:75112 rewardview:true)`); // 다크나이트의 호신부 (키워드로 다시 받을 수 있기 때문에 예외처리 없음
//	me.Move(1,15200+Random(100),38400+Random(100)); // 티르코네일로 간다.
}