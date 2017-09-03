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
	//�ѱ� 2009 ���ָӴ�
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
			case(0){itemString = `id:60028 count:10`; iCumRate +=10;} //�Ϲ� ���ײ� 10��
			case(1){itemString = `id:60029 count:5`; iCumRate +=10;} //��� ���ײ� 5��
			case(2){itemString = `id:60030 count:5`; iCumRate +=5;} //�ְ�� ���ײ� 5��
			case(3){itemString = `id:60025 count:5`; iCumRate +=10;} //��� ���� 5��
			case(4){itemString = `id:60026 count:5`; iCumRate +=5;} //�ְ�� ���� 5��
			case(5){itemString = `id:60021 count:5`; iCumRate +=10;} //��� �ʰ� 5��
			case(6){itemString = `id:60022 count:5`; iCumRate +=5;} //�ְ�� �ʰ� 5��
			case(7){itemString = `id:60013 count:3`; iCumRate +=10;} //��� ��ũ 3��
			case(8){itemString = `id:60014 count:5`; iCumRate +=5;} //�ְ�� ��ũ 5��
			case(9){itemString = `id:60018 count:5`; iCumRate +=15;} //�ְ�� ������ �� 5��
			case(10){itemString = `id:60041 count:5`; iCumRate +=5;} //���� �ݽ� 5��
			case(11){itemString = `id:60042 count:3`; iCumRate +=5;} //���� ���� 3��
			case(12){itemString = `id:60043 count:1`; iCumRate +=5;} //���Ȱ� ��� 1��

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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}
		++i;
	}
}
