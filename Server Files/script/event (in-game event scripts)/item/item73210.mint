//////////////////////////////////////////////////////////////////////////////////
// Mabinogi Project : Use Item Script
// ������ ������ �̺�Ʈ �Լ�
//
// nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
// nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : �����ۿ� �ƹ� ����� ������
// isusable�̰� stringid�� '/script/'�� �����ϰ� �ִ� �������� ������� ��
// �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(100);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	string customSuit;
	// ������ ���� �ʱ� �������� �ٸ��� ����
	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:19074`; iCumRate += 40;} //������ �´� ��ȣ �κ�
			case(1){itemString = `id:16069` ; iCumRate += 30;} //��ȣ �尩
			case(2){itemString = `id:17224` ; iCumRate += 30;} //��ȣ ����
			// ����� ���������� ��
			default
			{
				bBreak = true;
			}
		}
		if (bBreak)
		{
			break;
		}

		if (iRandom < iCumRate)
		{
			DebugOut(`�������� `+itemString+` �� ��`);
			GiveSkijumpEventItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveSkijumpEventItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
