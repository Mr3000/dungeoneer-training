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
	// 이벤트 계란이 있어서는 안된다. 리더를 제외하고 혹시나 있으면 모두 파괴한다.
	
	// 이벤트 계란 리스트를 얻어온다.
	object_list cItemList;
	cItemList = _player.GetItemList(75155);
	
	// 혹시 계란이 있었다면 모두 파괴한다.
	int i;
	item cItem;
	for (i = 0; i < cItemList.GetSize();  i++)
	{
		cItem = (item)cItemList.GetValue(i);
		if (cItem.IsValid())
		{
			_player.DestroyItem(cItem);
		}
	}
	
	// 리더인 경우에만 계란을 넣어준다.
	character cLeader = (character)_dungeon.GetPlayerLeader();
	if (cLeader.IsValid() && (cLeader == _player))
	{
		_player.DoStript(`additemex(id:75155)`);
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
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int			i;
		
	// 컷신을 틀어준다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`bossroom_Metalskeleton_Golem`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	// 리더인 경우에 계란을 없애고 키워드를 넣어준다.
	character cLeader = (character)_dungeon.GetPlayerLeader();
	if (cLeader.IsValid())
	{
		object_list cItemList;
		item		cItem;
		int			i;
	
		// 계란을 모두 파괴한다.		
		cItemList = cLeader.GetItemList(75155);
		for (i = 0; i < cItemList.GetSize();  i++)
		{
			cItem = (item)cItemList.GetValue(i);
			if (cItem.IsValid())
			{
				cLeader.DestroyItem(cItem);
			}
		}
		
		// 클리어했다는 키워드를 부여한다.
		cLeader.AddKeyword(`Clear_Ciar_Japan_Event_Dungeon`);
	}
}
