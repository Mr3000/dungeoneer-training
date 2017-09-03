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

	if((GetLocale().LowerCase()== `taiwan`) || (GetLocale().LowerCase()== `china`))
	{
		//�븸 2009 ���ָӴ�
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
				case(0){itemString = `id:18568 `; iCumRate += 25;} //25.0000000000 ���� ����
				case(1){itemString = `id:64001 count:3`; iCumRate += 5;} //5.0000000000 ö��
				case(2){itemString = `id:64003 count:3`; iCumRate += 5;} //5.0000000000 ����
				case(3){itemString = `id:64005 count:2`; iCumRate += 2;} //2.0000000000 ����
				case(4){itemString = `id:64007 count:2`; iCumRate += 2;} //2.0000000000 �ݱ�
				case(5){itemString = `id:64009 count:2`; iCumRate += 2;} //2.0000000000 �̽�����
				case(6){itemString = `id:51101 count:5`; iCumRate += 8;} //8.0000000000 ���� ��� 
				case(7){itemString = `id:51102 count:5`; iCumRate += 8;} //8.0000000000 ���� ���
				case(8){itemString = `id:51103 count:5`; iCumRate += 7;} //7.0000000000 ������Ʈ ���
				case(9){itemString = `id:51104 count:10`; iCumRate += 20;} //20.0000000000 ���̽� ���
				case(10){itemString = `id:51105 count:3`; iCumRate += 5;} //5.0000000000 ��� ���
				case(11){itemString = `id:51107 count:3`; iCumRate += 5;} //5.0000000000 ȭ��Ʈ ��� 
				case(12){itemString = `id:51108 count:2`; iCumRate += 2;} //2.0000000000 �ص��� 
				case(13){itemString = `id:51109 count:2`; iCumRate += 2;} //2.0000000000 ������ ���
				case(14){itemString = `id:51110 count:2`; iCumRate += 2;} //2.0000000000 ���巹��ũ
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
	else
	{
		//�ѱ� 2009 ���ָӴ�
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(1880);	//Ȯ���� ������ ���´�
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:51011 count:5`; iCumRate +=100;} //���¹̳� 10 ���� 5��
				case(1){itemString = `id:51001 count:5`; iCumRate +=100;} //����� 10���� 5��
				case(2){itemString = `id:51006 count:5`; iCumRate +=100;} //���� 10���� 5��
				case(3){itemString = `id:51012 count:5`; iCumRate +=60;} //���¹̳� 30 ���� 5��
				case(4){itemString = `id:51002 count:5`; iCumRate +=60;} //����� 30���� 5��
				case(5){itemString = `id:51007 count:5`; iCumRate +=60;} //���� 30���� 5��
				case(6){itemString = `id:51013 count:5`; iCumRate +=30;} //���¹̳� 100 ���� 5��
				case(7){itemString = `id:51003 count:5`; iCumRate +=30;} //����� 100���� 5��
				case(8){itemString = `id:51008 count:5`; iCumRate +=30;} //���� 100���� 5��
				case(9){itemString = `id:51014 count:3`; iCumRate +=20;} //���¹̳� 100 ���� 5��
				case(10){itemString = `id:51004 count:3`; iCumRate +=20;} //����� 100���� 5��
				case(11){itemString = `id:51009 count:3`; iCumRate +=20;} //���� 100���� 5��
				case(12){itemString = `id:51101 count:1`; iCumRate +=100;} //���� ���
				case(13){itemString = `id:51102 count:1`; iCumRate +=100;} //���� ���
				case(14){itemString = `id:51103 count:1`; iCumRate +=100;} //�����Ʈ ���
				case(15){itemString = `id:51104 count:1`; iCumRate +=100;} //���̽� ���
				case(16){itemString = `id:51105 count:1`; iCumRate +=100;} //��� ���
				case(17){itemString = `id:51106 count:1`; iCumRate +=100;} //�� ���Ե� ���
				case(18){itemString = `id:51107 count:1`; iCumRate +=100;} //ȭ��Ʈ ���
				case(19){itemString = `id:51108 count:1`; iCumRate +=100;} //�ص���
				case(20){itemString = `id:51109 count:1`; iCumRate +=100;} //������ ���
				case(21){itemString = `id:51110 count:1`; iCumRate +=100;} //���巹��ũ
				case(22){itemString = `id:64001 count:1`; iCumRate +=50;} //ö��
				case(23){itemString = `id:64003 count:1`; iCumRate +=50;} //����
				case(24){itemString = `id:64005 count:1`; iCumRate +=50;} //����
				case(25){itemString = `id:64007 count:1`; iCumRate +=50;} //�ݱ�
				case(26){itemString = `id:64009 count:1`; iCumRate +=50;} //�̽�����

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
}
