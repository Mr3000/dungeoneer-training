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
	 //Set 3 �̴�
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(891);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		int color;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(	0	){	color = 	0xC57E70	; iCumRate += 	200	;} //	22.44668911
			case(	1	){	color = 	0x842E2E	; iCumRate += 	200	;} //	22.44668911
			case(	2	){	color = 	0x573631	; iCumRate += 	200	;} //	22.44668911
			case(	3	){	color = 	0x85715C	; iCumRate += 	200	;} //	22.44668911
			case(	4	){	color = 	0xD11414	; iCumRate += 	30	;} //	3.367003367
			case(	5	){	color = 	0x0	; iCumRate += 	30	;} //	3.367003367
			case(	6	){	color = 	0xffffff	; iCumRate += 	30	;} //	3.367003367
			case(	7	){	color = 	0x8370e726	; iCumRate += 	1	;} //	0.112233446
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