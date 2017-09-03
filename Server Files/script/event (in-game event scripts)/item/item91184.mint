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
	//패션 가차폰(번들)
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)
	{

		// 의상이나 음식 획득
		int randomSetId = 1035;  // 고유 ID.. RandomItemSet.xlsm에 기입
		int itemIndex = GetItemIndexFromRandomSet(randomSetId);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);
		player.ShowCaption(["event.useitem_event.47"]);
		int itemID2 = newItem.GetClassId();
		string charName = player.GetDisplayName();
		string ItemName;
		if (itemID2 == 15555 ||itemID2 == 15556 ||itemID2 == 16065 ||itemID2 == 17212 ||itemID2 == 17213 ||itemID2 == 15396 ||itemID2 == 15397 ||itemID2 == 15398 ||itemID2 == 15399 ||itemID2 == 15401 ||itemID2 == 15402 ||itemID2 == 15403 ||itemID2 == 15404)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
		{
			ItemName = newItem.GetFullLocalName();
			AnnounceAllChannel(2, charName + ["event.useitem_event.50"]+ ["event.useitem_event.51"]+ ItemName );
		}
	}
}
