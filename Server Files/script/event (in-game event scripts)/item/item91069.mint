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
	//�븸 �뼱 �̺�Ʈ ����
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;

	iRandom = Random(100);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		if(GetLocale().LowerCase()== `taiwan`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:46024 col1:000000 col2:FFFFFF col3:000000`; iCumRate += 5;}	// ������ �ǵ�
				case(1){itemString = `id:40265 col1:6600FF col2:000000 col3:000000`; iCumRate += 5;}	// �ͽ�ť�ųʽ� �ҵ�
				case(2){itemString = `id:40229 col1:8B008B col2:FFFFFF`; iCumRate += 5;}	// �������� ����� Ȱ
				case(3){itemString = `id:40243 col1:8B008B col2:FFFFFF col3:FFFFFF`; iCumRate += 5;}	// ��Ʋ �� �ҵ�
				case(4){itemString = `id:15096`; iCumRate += 10;}	// ������ ���� �����
				case(5){itemString = `id:15070`; iCumRate += 10;}	// ���ĵ�Į�� �����긮��
				case(6){itemString = `id:15135`; iCumRate += 10;}	// ��ũ ��Ʈ
				case(7){itemString = `id:15137`; iCumRate += 10;}	// ������ ���� ��Ŷ ��Ʈ
				case(8){itemString = `id:15067`; iCumRate += 20;}	// ����ǳ ���纹
				case(9){itemString = `id:15040`; iCumRate += 20;}	// �ڷ��� ������Ʈ
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if(GetLocale().LowerCase()== `usa`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 2;}	// ī��Ʈ �ǵ�
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 2;}	// �巡�� ���̵�
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 2;}	// ���� �� ����
				case(3){itemString = `id:40011 col1:87CEEB col2:FFFFFF`; iCumRate += 4;}	// ��ε� �ҵ�
				case(4){itemString = `id:15118`; iCumRate += 10;}	// ������ �˻��б� ���� ��ƮŸ��
				case(5){itemString = `id:15075`; iCumRate += 10;}	// ������ ���̵� �巹��
				case(6){itemString = `id:15099`; iCumRate += 10;}	// ���ī ��ο��� ���̾�� ��ĿƮ
				case(7){itemString = `id:15119`; iCumRate += 10;}	// ������ �˻��б� ���� ��Ÿ��
				case(8){itemString = `id:15063`; iCumRate += 25;}	// ���̾�� ���� ���ǽ�
				case(9){itemString = `id:15055`; iCumRate += 25;}	// ���� �̴� ���ǽ�
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if(GetLocale().LowerCase()== `japan`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 5;}	// ī��Ʈ �ǵ�
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 5;}	// �巡�� ���̵�
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 5;}	// ���� �� ����
				case(3){itemString = `id:40243 col1:8B008B col2:FFFFFF col3:FFFFFF`; iCumRate += 5;}	// ��Ʋ �� �ҵ�
				case(4){itemString = `id:15096`; iCumRate += 10;}	// ������ ���� �����
				case(5){itemString = `id:15070`; iCumRate += 10;}	// ���ĵ�Į�� �����긮��
				case(6){itemString = `id:15135`; iCumRate += 10;}	// ��ũ ��Ʈ
				case(7){itemString = `id:15137`; iCumRate += 10;}	// ������ ���� ��Ŷ ��Ʈ
				case(8){itemString = `id:15067`; iCumRate += 20;}	// ����ǳ ���纹
				case(9){itemString = `id:15040`; iCumRate += 20;}	// �ڷ��� ������Ʈ
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 2;}	// ī��Ʈ �ǵ�
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 2;}	// �巡�� ���̵�
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 2;}	// ���� �� ����
				case(3){itemString = `id:40011 col1:87CEEB col2:FFFFFF`; iCumRate += 4;}	// ��ε� �ҵ�
				case(4){itemString = `id:15118`; iCumRate += 10;}	// ������ �˻��б� ���� ��ƮŸ��
				case(5){itemString = `id:15075`; iCumRate += 10;}	// ������ ���̵� �巹��
				case(6){itemString = `id:15099`; iCumRate += 10;}	// ���ī ��ο��� ���̾�� ��ĿƮ
				case(7){itemString = `id:15119`; iCumRate += 10;}	// ������ �˻��б� ���� ��Ÿ��
				case(8){itemString = `id:15063`; iCumRate += 25;}	// ���̾�� ���� ���ǽ�
				case(9){itemString = `id:15055`; iCumRate += 25;}	// ���� �̴� ���ǽ�
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}

	}
	GiveDragonShipGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
