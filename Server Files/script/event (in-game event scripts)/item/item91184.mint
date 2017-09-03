//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     ������ ������ �̺�Ʈ �Լ�
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
// : �����ۿ� �ƹ� ����� ������
//   isusable�̰� stringid�� '/script/'�� �����ϰ� �ִ� �������� ������� ��
//   �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	//�м� ������(����)
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)
	{

		// �ǻ��̳� ���� ȹ��
		int randomSetId = 1035;  // ���� ID.. RandomItemSet.xlsm�� ����
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
		if (itemID2 == 15555 ||itemID2 == 15556 ||itemID2 == 16065 ||itemID2 == 17212 ||itemID2 == 17213 ||itemID2 == 15396 ||itemID2 == 15397 ||itemID2 == 15398 ||itemID2 == 15399 ||itemID2 == 15401 ||itemID2 == 15402 ||itemID2 == 15403 ||itemID2 == 15404)		// ���� �������� ȹ���ϸ� ���� ���ش�.
		{
			ItemName = newItem.GetFullLocalName();
			AnnounceAllChannel(2, charName + ["event.useitem_event.50"]+ ["event.useitem_event.51"]+ ItemName );
		}
	}
}
