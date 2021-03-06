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
	// 자녀 입양에 실패하면 아이템은 사라진다. 다시 줘야 한다.
	int itemID = cItem.GetClassId();
	int familyCount = player.GetFamilyLockedSlotCount();

	//player.ShowMessageView(ToString(familyCount));

	if (player.IsFamilyHead())
	{
		if(familyCount > 0)		// 잠긴 슬롯이 1개 이상이면 진행
		{
			if (player.OpenNextFamilySlot())		// 자식 추가 성공
			{
				player.ShowCaption(["event.item.item12281.1"]);
			}
			else										// 자식 추가 실패
			{
				player.ShowCaption(["event.item.item12281.2"]);
				player.AddItem(itemID);
			}
		}
		else							// 이미 자식 6명일 때
		{
			player.ShowCaption(["event.item.item12281.3"]);
			player.AddItem(itemID);
		}
	}
	else			// 가장 아니면 안 돼.
	{
		player.ShowCaption(["event.item.item12281.4"]);
		player.DoStript(`additemex(id:12281)`); // 아이템 itemex로 넣어줍니다.
	}
}
