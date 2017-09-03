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
	//�̱� ���� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(1000);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:18601 `; iCumRate += 25;} //�� �巡�� ũ����Ʈ
			case(1){itemString = `id:18602 `; iCumRate += 25;} //�� ���� ������ ����
			case(2){itemString = `id:18105 `; iCumRate += 50;} //�� ��� �̴� ����
			case(3){itemString = `id:40241 col1:000000 col2:000000 col3:ffffff `; iCumRate += 100;} //�巡�� ���̵�
			case(4){itemString = `id:40237 col1:000000 col2:000000 col3:ffffff `; iCumRate += 100;} //���� �� ����
			case(5){itemString = `id:40238 col1:000000 col2:0fffff col3:ffffff `; iCumRate += 100;} //�׷���Ʈ �ҵ�
			case(6){itemString = `id:50537 quality:90 `; iCumRate += 200;} //�αٵα� ���� �� ���ݶ�
			case(7){itemString = `id:50536 quality:90 `; iCumRate += 200;} //�߳�ü ������ũ
			case(8){itemString = `id:50535 quality:90 `; iCumRate += 200;} //ũ������ ���ں�
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
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
