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
//	_dungeon.SetData(`IsJenna`, false);
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

	if (_iOldFloor == 0 && _iNewFloor ==1)
	{
		bool isJennaSpawn = false;
		_dungeon.GetData(`IsJenna`, isJennaSpawn);
		if (!isJennaSpawn)
		{

			int posX = _player.GetPositionX();
			int posY = _player.GetPositionY();
			int regionID = _player.GetRegionId();

			_dungeon.AllocAINPC(`_jenna_renewal_fight`, regionID, posX+50, posY+50, 0, true);
			_dungeon.SetData(`IsJenna`, true);
		}

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
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	// 1인 던전이지만 혹시 여럿이 왔을지도 모른다.
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);

	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		if (cChar.GetCompletedQuestObjectiveCount(293009) == 5 )
		{

			cChar.AddKeyword(`g12_10`);
			cChar.RemoveKeyword(`g12_09`);			// 키워드 교체

//			cChar.DoStript(`additemex(id:75422 rewardview:true)`);				//  모이투라 전쟁사 아이템
		}
	}
}
