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
	int iRandom = Random(13);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:40095 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692�巡�� ���̵�
			case(1){itemString = `id:40033 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692Ŭ���̸��
			case(2){itemString = `id:40242 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692��Ʋ �ҵ�
			case(3){itemString = `id:46006 col1:c7dc68 col2:ffffff`; iCumRate +=1;} //7.692307692ī��Ʈ �ǵ�
			case(4){itemString = `id:40193 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692���󸶻�
			case(5){itemString = `id:40171 col1:ffffff col2:00a968 col3:d8e698`; iCumRate +=1;} //7.692307692���繫��
			case(6){itemString = `id:40195 col1:d8e698 col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692��ù���
			case(7){itemString = `id:40192 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692�Ϻ��� �Ѽհ�
			case(8){itemString = `id:40170 col1:ffffff col2:00a968 col3:d8e698`; iCumRate +=1;} //7.692307692�Ϻ��� ��հ�
			case(9){itemString = `id:40194 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692�Ϻ��� �ܰ�
			case(10){itemString = `id:40078 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692����Ͻ�
			case(11){itemString = `id:40081 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692���� �� ����
			case(12){itemString = `id:40049 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692�÷�Ʈ
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
