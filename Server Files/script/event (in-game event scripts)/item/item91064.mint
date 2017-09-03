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
	// �̱� ���� ��í�� (2010.11.08 �Ǹ�)
	int itemID = cItem.GetClassId();
	string charName = player.GetDisplayName();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	string DefItemString;
	int appraise_explore_exp;
	int appraise_gold;

	// �ǻ��̳� ���� ȹ��
	int randomSetId = 1042;   // ���� ID.. RandomItemSet.xlsm�� ����
	int itemIndex = GetItemIndexFromRandomSet(randomSetId);
	
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
	bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
	bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
	
	item newItem;
	newItem = player.AddItemEx(itemString, true);

	int jRandom = Random(3);		
	if (!player.IsRiding())
	{
		switch(jRandom)
		// ��í�� ��� ��� ���
		{
			case(0)
			{
				player.SetMotionType(14, 15, false); // mcStand, motionStandFriendly01, not loop
			}
			case(1)
			{
				player.SetMotionType(14, 16, false); // mcStand, motionStandFriendly01, not loop
			}
			case(2)
			{
				player.SetMotionType(14, 17, false); // mcStand, motionStandFriendly01, not loop
			}
		}
	}

	if (!newItem.IsNull())
	{
		string ItemName = newItem.GetFullLocalName();
		
		if (announce)
		{
			Announce(2, charName + ["event.item.item85053.1"]+ ItemName + ["event.item.item85053.2"]);	
		}
		
		if (announce_all)
		{
			AnnounceAllChannel(2, charName + ["event.item.item85053.3"]+ ItemName + ["event.item.item85053.4"]);	
		}
	}
}
