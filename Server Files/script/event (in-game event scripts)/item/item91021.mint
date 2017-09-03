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
	 //Set 5�̴�
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(892);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		int color;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(	0	){	color = 	0x8795D4	; iCumRate += 	200	;} //	22.42152466
			case(	1	){	color = 	0x4960B9	; iCumRate += 	200	;} //	22.42152466
			case(	2	){	color = 	0x7D6B9E	; iCumRate += 	200	;} //	22.42152466
			case(	3	){	color = 	0xEE934F	; iCumRate += 	200	;} //	22.42152466
			case(	4	){	color = 	0x43D530	; iCumRate += 	30	;} //	3.3632287
			case(	5	){	color = 	0x0	; iCumRate += 	30	;} //	3.3632287
			case(	6	){	color = 	0xffffff	; iCumRate += 	30	;} //	3.3632287
			case(	7	){	color = 	0x8370f6ff	; iCumRate += 	1	;} //	0.112107623
			case(	8	){	color = 	0x692035af	; iCumRate += 	1	;} //	0.112107623
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
			DebugOut(`�������� `+ToString(color)+` �� ��`);
			GiveDyeingAmple(player,color,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveDyeingAmple(player, 0xC58D8D,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� ������ ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
