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
	int iRandom = Random(2054);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15258 `; iCumRate += 1;} //0.0486854917 ��Ű ��ġ �巹��
			case(1){itemString = `id:15259 `; iCumRate += 1;} //0.0486854917 �������� ���ڵ� ��Ʈ
			case(2){itemString = `id:15316 `; iCumRate += 1;} //0.0486854917 ī���� ���ڵ� ��Ʈ
			case(3){itemString = `id:17044 `; iCumRate += 1;} //0.0486854917 Ʈ�� ��Ŭ ����
			case(4){itemString = `id:17098 `; iCumRate += 1;} //0.0486854917 �������� ���ڵ� ����
			case(5){itemString = `id:17128 `; iCumRate += 1;} //0.0486854917 ī���� ���ڵ� ����
			case(6){itemString = `id:18199 `; iCumRate += 1;} //0.0486854917 ������ �Ȱ�
			case(7){itemString = `id:18159 `; iCumRate += 1;} //0.0486854917 ���� �Ȱ�
			case(8){itemString = `id:15080 `; iCumRate += 1;} //0.0486854917 ������� �����巹��
			case(9){itemString = `id:40325 `; iCumRate += 5;} //0.2434274586 �ʺ��� ����Ʈ�� ���� ����
			case(10){itemString = `id:18045 `; iCumRate += 5;} //0.2434274586 ����� ������ ����
			case(11){itemString = `id:18048 `; iCumRate += 5;} //0.2434274586 ��� ����ì ������ ����
			case(12){itemString = `id:18041 `; iCumRate += 10;} //0.4868549172 ū ì ���� ����
			case(13){itemString = `id:15060 `; iCumRate += 10;} //0.4868549172 ���� �̳ʷκ� ����
			case(14){itemString = `id:15116 `; iCumRate += 10;} //0.4868549172 ������ ������ ����
			case(15){itemString = `id:15117 `; iCumRate += 10;} //0.4868549172 ������ ������ ����
			case(16){itemString = `id:51010 count:5`; iCumRate += 10;} //0.4868549172 ���� 300 ����
			case(17){itemString = `id:17026 `; iCumRate += 50;} //2.4342745862 ���� ����
			case(18){itemString = `id:51009 count:5`; iCumRate += 50;} //2.4342745862 ���� 100 ����
			case(19){itemString = `id:40038 `; iCumRate += 50;} //2.4342745862 ����Ʈ�� ����
			case(20){itemString = `id:40039 `; iCumRate += 50;} //2.4342745862 ���̽� ����
			case(21){itemString = `id:40040 `; iCumRate += 50;} //2.4342745862 ���̾� ����
			case(22){itemString = `id:40041 `; iCumRate += 50;} //2.4342745862 Ÿ�ݿ� ����
			case(23){itemString = `id:15156 `; iCumRate += 80;} //3.8948393379 �̵�ī�� ������ ����(������)
			case(24){itemString = `id:51008 count:10`; iCumRate += 80;} //3.8948393379 ���� 50 ����
			case(25){itemString = `id:40090 `; iCumRate += 80;} //3.8948393379 ���� ����
			case(26){itemString = `id:51102 count:10`; iCumRate += 80;} //3.8948393379 ���� ���
			case(27){itemString = `id:62004 count:5`; iCumRate += 80;} //3.8948393379 ��������
			case(28){itemString = `id:63001 count:5`; iCumRate += 80;} //3.8948393379 ������ ����
			case(29){itemString = `id:15025 `; iCumRate += 100;} //4.8685491723 �����б� ���ڱ���
			case(30){itemString = `id:15031 `; iCumRate += 100;} //4.8685491723 �����б� ����
			case(31){itemString = `id:16511 `; iCumRate += 100;} //4.8685491723 �ǹ� Ƽ�� �۷���
			case(32){itemString = `id:17004 `; iCumRate += 100;} //4.8685491723 ���� �б� �Ź�
			case(33){itemString = `id:17007 `; iCumRate += 100;} //4.8685491723 ���� ����
			case(34){itemString = `id:18005 `; iCumRate += 100;} //4.8685491723 ��� ������ ����
			case(35){itemString = `id:18006 `; iCumRate += 100;} //4.8685491723 ������ ����
			case(36){itemString = `id:15020 `; iCumRate += 100;} //4.8685491723 �ڷ��� �����巹��
			case(37){itemString = `id:15030 `; iCumRate += 100;} //4.8685491723 �ڷ��� ���� ��Ʈ
			case(38){itemString = `id:16011 `; iCumRate += 100;} //4.8685491723 �ڷ��� ���� �۷���
			case(39){itemString = `id:51006 count:10`; iCumRate += 100;} //4.8685491723 ���� 10 ����
			case(40){itemString = `id:51007 count:10`; iCumRate += 100;} //4.8685491723 ���� 30 ����
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
