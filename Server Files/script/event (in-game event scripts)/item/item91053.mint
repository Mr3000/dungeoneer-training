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
	// ����Ʈ�� ��í��
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int itemID = cItem.GetClassId();
	int i=0;
	int iRandom = Random(2198);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15175`; iCumRate += 2;}	//0.090991811	������ ��īŸ
			case(1){itemString = `id:15176`; iCumRate += 5;}	//0.227479527	������ ��īŸ
			case(2){itemString = `id:18129`; iCumRate += 5;}	//0.227479527	���� ����
			case(3){itemString = `id:18130`; iCumRate += 5;}	//0.227479527	��¤ ����
			case(4){itemString = `id:18131`; iCumRate += 5;}	//0.227479527	�����
			case(5){itemString = `id:15063`; iCumRate += 50;}	//2.274795268	���̾�� ���� ���ǽ�
			case(6){itemString = `id:15070`; iCumRate += 50;}	//2.274795268	���ĵ�Į�� �����긮��
			case(7){itemString = `id:19014`; iCumRate += 50;}	//2.274795268	Ʈ��� ���� �κ�
			case(8){itemString = `id:18158`; iCumRate += 50;}	//2.274795268	���ֺ� �Ȱ�
			case(9){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 55;}	//2.502274795	������ ����
			case(10){itemString = `id:40081 col1:800000 col2:ffffff`; iCumRate += 55;}	//2.502274795	������ ���� �� ����
			case(11){itemString = `id:40031 col1:eeeeee`; iCumRate += 55;}	//2.502274795	��� ����
			case(12){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 55;}	//2.502274795	����� �޺��� ����
			case(13){itemString = `id:40097 col1:000000`; iCumRate += 110;}	//5.004549591	������ L�ε�
			case(14){itemString = `id:40097 col1:800000`; iCumRate += 110;}	//5.004549591	������ L�ε�
			case(15){itemString = `id:40097 col1:eeeeee`; iCumRate += 110;}	//5.004549591	��� L�ε�
			case(16){itemString = `id:16519`; iCumRate += 182;}	//8.280254777	��ȣȭ�尩
			case(17){itemString = `id:16503`; iCumRate += 182;}	//8.280254777	�÷�Ʈ �÷���Ʈ ��Ʋ��
			case(18){itemString = `id:15056`; iCumRate += 182;}	//8.280254777	���� �̴� ���ǽ� ��Ÿ��
			case(19){itemString = `id:18542`; iCumRate += 220;}	//10.00909918	�� ü�� Ǯ �︧
			case(20){itemString = `id:18543`; iCumRate += 220;}	//10.00909918	�� ���� Ǯ �︧
			case(21){itemString = `id:18544`; iCumRate += 220;}	//10.00909918	�� �縮ĭ ��������
			case(22){itemString = `id:18547`; iCumRate += 220;}	//10.00909918	�� �ĳ��� ��� ��������
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
