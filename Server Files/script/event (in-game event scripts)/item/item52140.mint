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
	// 아이템을 사용하면 이미 기존 가방 아이템이 있나 체크한 후 축구공 가방으로 교환해준다.
	// 유저 인벤에 가방이 있는지 찾는다.
	object_list cBagList = player.GetItemList(`(*/bag/*) & (*/personal_shop_available/*)`);

	// 가방이 있을 경우에는 교환권이 사용되지 않는다.
	if(cBagList.GetSize() > 0)
	{
		player.ShowMessageView(["event.item.item52140.1"]);
		player.DoStript(`additemex(id:52140)`);	// 교환권을 다시 복원해준다.
		return;
	}

	if (player.RcvItemWithRewardView(player, 2040))
	{
		player.ShowMessageView(["event.item.item52140.2"]);
	}
	else
	{
		player.ShowMessageView(["event.item.item52140.3"]);
		player.DoStript(`additemex(id:52140)`);	// 교환권을 다시 복원해준다.
	}

	return;
}
