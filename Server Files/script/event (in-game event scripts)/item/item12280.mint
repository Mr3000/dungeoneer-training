//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
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
	DebugOut(`팔리아스의 이슬 사용`);
	// G12S1 이후 사용이 가능하다.
	if(GetVersion() >= 1201)
	{
		// 첫번째 슬롯이 열려있어야 사용이 가능하다.
		if(player.HaveKeyword(`treasure_slot1`))
		{
			// 2번째 슬롯이 미개봉이다.
			if(!player.HaveKeyword(`treasure_slot3`))
			{
				player.OpenTreasureSlot(2, cItem);		// 3번 슬롯을 연다. treasure_slot3
				player.ShowCaption(["event.item.item12280.1"]);
			}
			// 이미 슬롯이 개방되어 사용할 필요가 없다.
			else
			{
				player.ShowCaption(["event.item.item12280.2"]);
				player.AddItemEx(`id:12280`, false);
			}
		}
		// 사용할 수 없다.
		else
		{
			player.ShowCaption(["event.item.item12280.3"]);
			player.AddItemEx(`id:12280`, false);
		}
	}
	// 사용할 수 없다.
	else
	{
		player.ShowCaption(["event.item.item12280.4"]);
		player.AddItemEx(`id:12280`, false);
	}
}
