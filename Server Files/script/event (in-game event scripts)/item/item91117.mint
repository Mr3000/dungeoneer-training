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
	int iRandom = Random(1090);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:64061`; iCumRate += 1;} //Ĺ������
			case(1){itemString = `id:14039`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(2){itemString = `id:14040`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(3){itemString = `id:14041`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(4){itemString = `id:16532`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(5){itemString = `id:16533`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(6){itemString = `id:16535`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(7){itemString = `id:17095`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(8){itemString = `id:18552`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(9){itemString = `id:18553`; iCumRate += 1;} //���̳� �巡�� ��Ʈ
			case(10){itemString = `id:53030`; iCumRate += 2;} //�縷 �巡���� ��
			case(11){itemString = `id:18518 col1:111111 col2:111111 col3:111111`; iCumRate += 8;} //���� �巡�� ũ����Ʈ
			case(12){itemString = `id:65015`; iCumRate += 20;} //��Ȳ ��
			case(13){itemString = `id:65014`; iCumRate += 50;} //�� ��
			case(14){itemString = `id:63099`; iCumRate += 50;} //���ɳ��� ŰƮ
			case(15){itemString = `id:46021`; iCumRate += 150;} //���� ����
			case(16){itemString = `id:63700`; iCumRate += 200;} //�Ҳɳ��� ŰƮ
			case(17){itemString = `id:63701`; iCumRate += 200;} //�Ҳɳ��� ŰƮ
			case(18){itemString = `id:63702`; iCumRate += 200;} //�Ҳɳ��� ŰƮ
			case(19){itemString = `id:91109`; iCumRate += 200;} //Ǫ�� ������ ����


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
