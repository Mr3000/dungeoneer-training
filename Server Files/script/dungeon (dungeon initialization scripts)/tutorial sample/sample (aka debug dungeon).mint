////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Extra Description
//																  던전 추가 정보
//
//													henjeon, began at 2005.09.21
//															 henjeon@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 던전 추가 정보 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
	OnExtraDesc(
		dungeon_floor _floor,		// 처리중인 던전 층
		string _arg1,
		string _arg2,
		string _arg3)
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`OnExtraDesc()에 진입했습니다.`);
	
	int i;
	
	// 막다른 방의 개수를 얻는다.
	int iDeadEndNodesNo = _floor.GetDeadEndNodesNo();
	DebugOut(`막다른 방의 개수는 `+ToString(iDeadEndNodesNo)+`개 입니다.`);
	
	// 각 방마다...
	for (i = 0 ; i < iDeadEndNodesNo ; ++i)
	{
		dungeon_node room = _floor.GetDeadEndNode(i);
		
		// 방 가운데에 상자를 배치한다.
		dungeon_extrachest chest = room.CreateExtraChest();
		if (chest.IsValid())
		{
			DebugOut(`방 `+ToString(i)+`에 상자를 배치했습니다.`);			
			
			chest.AddItem(`id:74026`);
			chest.AddItemForLeader(`id:74026`);
			chest.AddItemForAll(`id:74026`);
		}
		
		// 방 가운데에 몬스터를 배치한다.
		character npc = room.CreateMonster(`Skeleton`);
		if (npc.IsValid())
		{
			DebugOut(`방 `+ToString(i)+`에 몬스터를 배치했습니다.`);	
		}		
	}	
}