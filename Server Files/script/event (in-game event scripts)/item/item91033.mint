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
	// 일본 팬더 가차폰
	string itemString;
	int iRandom = Random(10);	//둘중 하나여서 이렇게
	int itemID = cItem.GetClassId();
	if (iRandom < 5)
	{
		itemString = `id:16042`;	// 팬더 장갑
	}
	else
	{
		itemString = `id:18150`;	// 팬더 머리띠
	}

	DebugOut(`유저에게 `+itemString+` 를 줌`);
	GivePandaGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);	
}
