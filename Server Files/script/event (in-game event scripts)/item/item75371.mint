//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi




////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////

{
	player.DoStript(`additemex(id:75371)`);

	dungeon2 _dungeon = player.FindDungeon2();
	if (player.FindShadowMission() == 0 && _dungeon.IsNull())
	{
		player.AddShadowMission(792012, true);		// 파이톤 나이트 무찌르기 퀘스트를 준다.
	}
	else
	{
		player.ShowMessageView(["event.item.item75371.1"]);
	}
}
