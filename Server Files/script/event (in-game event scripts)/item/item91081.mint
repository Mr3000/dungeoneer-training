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
	//�߱� Ư���� �Ƹ� ��í��
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;

	iRandom = Random(201);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString=`id:15233 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=5;}//2.4875621891 201������Ʈ ��� �巹��
			case(1){itemString=`id:15234 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=5;}//2.4875621891 201������Ʈ ��� ��Ʈ
			case(2){itemString=`id:15235 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=5;}//2.4875621891 201������Ʈ ��� �巹��
			case(3){itemString=`id:15112 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201������ �����̷�
			case(4){itemString=`id:15113 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201������ �˻��б� ���� ��ƮŸ��
			case(5){itemString=`id:15114 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201������ �˻��б� ���� ��Ÿ��
			case(6){itemString=`id:15131 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201�� �������� ��ĿƮ
			case(7){itemString=`id:15132 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201���߷� ����Ʈ ����
			case(8){itemString=`id:15135 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201��ũ ��Ʈ
			case(9){itemString=`id:15233`;iCumRate+=10;}//4.9751243781 201������Ʈ ��� �巹��
			case(10){itemString=`id:15234`;iCumRate+=10;}//4.9751243781 201������Ʈ ��� ��Ʈ
			case(11){itemString=`id:15235`;iCumRate+=10;}//4.9751243781 201������Ʈ ��� �巹��
			case(12){itemString=`id:15112`;iCumRate+=20;}//9.9502487562 201������ �����̷�
			case(13){itemString=`id:15113`;iCumRate+=20;}//9.9502487562 201������ �˻��б� ���� ��ƮŸ��
			case(14){itemString=`id:15114`;iCumRate+=20;}//9.9502487562 201������ �˻��б� ���� ��Ÿ��
			case(15){itemString=`id:15131`;iCumRate+=20;}//9.9502487562 201�� �������� ��ĿƮ
			case(16){itemString=`id:15132`;iCumRate+=20;}//9.9502487562 201���߷� ����Ʈ ����
			case(17){itemString=`id:15135`;iCumRate+=20;}//9.9502487562 201��ũ ��Ʈ
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
