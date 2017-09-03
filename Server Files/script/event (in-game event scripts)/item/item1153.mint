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
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(827);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:64018 count:5 `; iCumRate +=300;} //����
			case(1){itemString = `id:62005 prefix:7 `; iCumRate +=100;} //��������
			case(2){itemString = `id:62005 prefix:7 `; iCumRate +=50;} //����
			case(3){itemString = `id:64051 count:5 `; iCumRate +=50;} //��¦�� ����
			case(4){itemString = `id:62005 prefix:21410 `; iCumRate +=5;} // ������
			case(5){itemString = `id:64521 suffix:40021`; iCumRate +=40;} //���̾ 1������
			case(6){itemString = `id:64522 suffix:40022`; iCumRate +=40;} //���̾ 2������
			case(7){itemString = `id:64523 suffix:40023`; iCumRate +=40;} //���̾ 3������
			case(8){itemString = `id:64524 suffix:40024`; iCumRate +=30;} //���̾ 4������
			case(9){itemString = `id:64525 suffix:40025`; iCumRate +=30;} //���̾ 5������
			case(10){itemString = `id:64526 suffix:40026`; iCumRate +=30;} //���̾ 6������
			case(11){itemString = `id:64527 suffix:40027`; iCumRate +=30;} //���̾ 7������
			case(12){itemString = `id:64528 suffix:40028`; iCumRate +=20;} //���̾ 8������
			case(13){itemString = `id:64529 suffix:40029`; iCumRate +=10;} //���̾ 9������
			case(14){itemString = `id:64530 suffix:40030`; iCumRate +=2;} //���̾ 10 ������
			case(15){itemString = `id:62005 prefix:21412`; iCumRate +=30;} //Į��
			case(16){itemString = `id:62005 suffix:30634`; iCumRate +=20;} // �����

			// ����� ���������� ��

			default
			{
				itemString = `id:64018`; iCumRate +=1000;
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
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}

		++i;
	}
}
