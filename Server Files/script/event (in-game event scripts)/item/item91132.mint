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
			case(0){itemString = `id:50546  `; iCumRate += 22 ;} //���̽� ī�� ��ī
			case(1){itemString = `id:50513  `; iCumRate += 20 ;} //���� ��Ű
			case(2){itemString = `id:63075 count:10 `; iCumRate += 20 ;} //����Ĺ �Ҳɳ��� ŰƮ
			case(3){itemString = `id:18029  `; iCumRate += 15 ;} //������ �Ȱ�
			case(4){itemString = `id:18541  `; iCumRate += 10;} //��Ӹ� ����
			case(5){itemString = `id:40089  `; iCumRate += 8;} //�Ϻ� ��ä
			case(6){itemString = `id:15129  `; iCumRate += 5;} //������ ��īŸ
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
			GiveZombieGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveZombieGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
