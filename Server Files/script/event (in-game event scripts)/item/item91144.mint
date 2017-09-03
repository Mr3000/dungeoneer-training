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

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:19067 `; iCumRate += 15;} //���� �κ�
			case(1){itemString = `id:51004 count:2` ; iCumRate += 15;} //����� 100 ����
			case(2){itemString = `id:51009 count:2` ; iCumRate += 15;} //���� 100 ����
			case(3){itemString = `id:51014 count:2 `; iCumRate += 15;} //���¹̳� 100 ����
			case(4){itemString = `id:60005 count:5 `; iCumRate += 20;} //�ش�
			case(5){itemString = `id:51024 count:5 `; iCumRate += 10;} //����°� ���� 100 ����
			case(6){itemString = `id:51029 count:5 `; iCumRate += 10;} //����°� ���¹̳� 100 ����
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
