////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//					    marlin fecit, begins at 2004. 06. 10
//							capella@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 모든 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(_dungeon.GetName() + ` 클리어!`);
	// 중국 2009 춘절 이벤트일때 상자에 '홍빠오'를 10% 확률로 넣어준다.
	if(IsCurrentEvent(`lunar_newyear_2009_china`))
	{

		character	cChar;
		object_list cMemberList = _dungeon.GetCreatorList();
		DebugOut(`t1`);

		int cMemberNum = cMemberList.GetSize();
		int	i;

		for (i = 0; i < cMemberNum;  i++)
		{
			cChar = (character)cMemberList.GetValue(i);
			DebugOut(`t2`);
			if (cChar.IsValid())
			{
				DebugOut(`t3`);
				int iRandomHong;
				iRandomHong = Random(100);
				if (iRandomHong < 11)
				{
					DebugOut(["dungeon.dungeon_common.1"]+ cChar.GetGeneralName());
					cChar.DoStript(`additemex(id:91051)`);	//홍빠오
					DebugOut(["dungeon.dungeon_common.2"]);
				}
			}
		}

	}
}
