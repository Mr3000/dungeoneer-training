//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//
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
	player.DoStript(`additemex(id:75435)`);

	dungeon2 _dungeon = player.FindDungeon2();
	if (player.FindShadowMission() == 0 && _dungeon.IsNull())
	{
		player.AddShadowMission(793006, true);		// 누아자 다시 만날 수 있는 미션 주자.
	}
	else
	{
		player.ShowMessageView(["event.item.item75435.1"]);
	}
}
