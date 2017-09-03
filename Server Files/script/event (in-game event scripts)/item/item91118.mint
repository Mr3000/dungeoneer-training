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
	int iRandom = Random(6061);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:18156 `; iCumRate += 1;} //0.026659557��۸�
			case(1){itemString = `id:15055 `; iCumRate += 80;} //2.665955745���� �̴� ���ǽ�
			case(2){itemString = `id:46006 `; iCumRate += 80;} //2.665955745ī��Ʈ �ǵ�
			case(3){itemString = `id:15053 `; iCumRate += 80;} //2.665955745�÷�Į�� ���ǽ�
			case(4){itemString = `id:17045 `; iCumRate += 80;} //2.665955745���� �� ���� ���� ����
			case(5){itemString = `id:17040 `; iCumRate += 80;} //2.665955745���� ��Ʈ�� ����
			case(6){itemString = `id:15029 `; iCumRate += 50;} //2.665955745��ũ �������̿�
			case(7){itemString = `id:15151 `; iCumRate += 80;} //2.665955745���帶���� ���̽�Ʈ ���Ϸ� ��������룩
			case(8){itemString = `id:15152 `; iCumRate += 80;} //2.665955745���帶���� ���̽�Ʈ ���Ϸ� ��������룩
			case(9){itemString = `id:15045 `; iCumRate += 400;} //2.665955745���̽� �÷�Ŷ ����
			case(10){itemString = `id:15026 `; iCumRate += 400;} //2.665955745������ �ս�ĿƮ
			case(11){itemString = `id:15016 `; iCumRate += 400;} //2.665955745����� ��Ÿŷ ������
			case(12){itemString = `id:15051 `; iCumRate += 400;} //2.665955745Ÿ��Ʈ ��Ʈ ����
			case(13){itemString = `id:18011 `; iCumRate += 400;} //5.33191149��� ������ ĸ
			case(14){itemString = `id:18009 `; iCumRate += 300;} //5.33191149��� ���� ĸ
			case(15){itemString = `id:18014 `; iCumRate += 300;} //5.33191149��� ����
			case(16){itemString = `id:18000 `; iCumRate += 300;} //5.33191149��ũ ����
			case(17){itemString = `id:16013 `; iCumRate += 400;} //5.33191149�˻� �尩
			case(18){itemString = `id:16032 `; iCumRate += 200;} //5.33191149���� �۷���
			case(19){itemString = `id:51014 count:5`; iCumRate += 800;} //11.99680085���¹̳� 100 ���� 5��
			case(20){itemString = `id:51004 count:5`; iCumRate += 700;} //11.99680085����� 100���� 5��
			case(21){itemString = `id:51009 count:5`; iCumRate += 450;} //11.99680085���� 100���� 5��		
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
