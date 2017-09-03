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
	//�븸 ���� ������� ����
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(100);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:63030 col1:6e10fdf4`; iCumRate += 4;} // ��/Ȳ
			case(1){itemString = `id:63030 col1:86402894`; iCumRate += 4;} // ������/������
			case(2){itemString = `id:63030 col1:82f2558d`; iCumRate += 5;} // �Ķ���/���
			case(3){itemString = `id:63030 col1:660000ff`; iCumRate += 5;} // ������/���
			case(4){itemString = `id:63030 col1:83317370`; iCumRate += 5;} // �ڻ�/������
			case(5){itemString = `id:63030 col1:63001021`; iCumRate += 6;} // ȸ��/���
			case(6){itemString = `id:63030 col1:6240001b`; iCumRate += 6;} // £�� ����/���� ����
			case(7){itemString = `id:63030 col1:FF0000`; iCumRate += 5;} // ������
			case(8){itemString = `id:63030 col1:0033FF`; iCumRate += 8;} // �Ķ���
			case(9){itemString = `id:63030 col1:FFFFFF`; iCumRate += 8;} // ���
			case(10){itemString = `id:63030 col1:000000`; iCumRate += 8;} // ������
			case(11){itemString = `id:63030 col1:FFCC00`; iCumRate += 12;} // Ȳ�ݻ�
			case(12){itemString = `id:63030 col1:0033FF`; iCumRate += 12;} // �ϴû�
			case(13){itemString = `id:63030 col1:FF66FF`; iCumRate += 12;} // ���� ��̻�
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
			for (i = 0; i < 2; i++)
			{
				DebugOut(`�������� ���������� ��`);
				GiveLittleBoarGachaphonItem(player,`id:63024 expire:10080`,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			DebugOut(`�������� `+itemString+` �� ��`);
			GiveLittleBoarGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}
		++i;
	}
	GiveLittleBoarGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
