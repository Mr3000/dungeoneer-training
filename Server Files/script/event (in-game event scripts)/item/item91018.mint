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
	//Set 2 �̴�
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(3343);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		int color;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(	0	){	color = 	0xC58D8D	; iCumRate += 	80	;} //	2.393060126
			case(	1	){	color = 	0xA85D4E	; iCumRate += 	80	;} //	2.393060126
			case(	2	){	color = 	0x815454	; iCumRate += 	80	;} //	2.393060126
			case(	3	){	color = 	0x573631	; iCumRate += 	80	;} //	2.393060126
			case(	4	){	color = 	0xEA9E71	; iCumRate += 	80	;} //	2.393060126
			case(	5	){	color = 	0xC19F8A	; iCumRate += 	80	;} //	2.393060126
			case(	6	){	color = 	0x966945	; iCumRate += 	80	;} //	2.393060126
			case(	7	){	color = 	0x67523D	; iCumRate += 	80	;} //	2.393060126
			case(	8	){	color = 	0xEE934F	; iCumRate += 	80	;} //	2.393060126
			case(	9	){	color = 	0xF2C697	; iCumRate += 	80	;} //	2.393060126
			case(	10	){	color = 	0x85715C	; iCumRate += 	80	;} //	2.393060126
			case(	11	){	color = 	0xADA796	; iCumRate += 	80	;} //	2.393060126
			case(	12	){	color = 	0xD7A621	; iCumRate += 	80	;} //	2.393060126
			case(	13	){	color = 	0xDAD58D	; iCumRate += 	80	;} //	2.393060126
			case(	14	){	color = 	0xACB91E	; iCumRate += 	80	;} //	2.393060126
			case(	15	){	color = 	0x8C9F58	; iCumRate += 	80	;} //	2.393060126
			case(	16	){	color = 	0x525C3F	; iCumRate += 	80	;} //	2.393060126
			case(	17	){	color = 	0x587D4A	; iCumRate += 	80	;} //	2.393060126
			case(	18	){	color = 	0x84C07A	; iCumRate += 	80	;} //	2.393060126
			case(	19	){	color = 	0x7E9783	; iCumRate += 	80	;} //	2.393060126
			case(	20	){	color = 	0x479A72	; iCumRate += 	80	;} //	2.393060126
			case(	21	){	color = 	0x32574A	; iCumRate += 	80	;} //	2.393060126
			case(	22	){	color = 	0x68A790	; iCumRate += 	80	;} //	2.393060126
			case(	23	){	color = 	0x77C3B7	; iCumRate += 	80	;} //	2.393060126
			case(	24	){	color = 	0xB0DDDF	; iCumRate += 	80	;} //	2.393060126
			case(	25	){	color = 	0x3A8299	; iCumRate += 	80	;} //	2.393060126
			case(	26	){	color = 	0x7F9BB9	; iCumRate += 	80	;} //	2.393060126
			case(	27	){	color = 	0x2F4778	; iCumRate += 	80	;} //	2.393060126
			case(	28	){	color = 	0x5B6078	; iCumRate += 	80	;} //	2.393060126
			case(	29	){	color = 	0x3A3A4D	; iCumRate += 	80	;} //	2.393060126
			case(	30	){	color = 	0x667CB9	; iCumRate += 	80	;} //	2.393060126
			case(	31	){	color = 	0x524782	; iCumRate += 	80	;} //	2.393060126
			case(	32	){	color = 	0xAEA2C9	; iCumRate += 	80	;} //	2.393060126
			case(	33	){	color = 	0x6A5684	; iCumRate += 	80	;} //	2.393060126
			case(	34	){	color = 	0x9960B6	; iCumRate += 	80	;} //	2.393060126
			case(	35	){	color = 	0x73356F	; iCumRate += 	80	;} //	2.393060126
			case(	36	){	color = 	0x462E46	; iCumRate += 	80	;} //	2.393060126
			case(	37	){	color = 	0xAC487E	; iCumRate += 	80	;} //	2.393060126
			case(	38	){	color = 	0x855663	; iCumRate += 	80	;} //	2.393060126
			case(	39	){	color = 	0x29141A	; iCumRate += 	80	;} //	2.393060126
			case(	40	){	color = 	0x30E9C4	; iCumRate += 	20	;} //	0.598265031
			case(	41	){	color = 	0x3678F1	; iCumRate += 	20	;} //	0.598265031
			case(	42	){	color = 	0x344ABD	; iCumRate += 	20	;} //	0.598265031
			case(	43	){	color = 	0x2E2926	; iCumRate += 	20	;} //	0.598265031
			case(	44	){	color = 	0x0	; iCumRate += 	20	;} //	0.598265031
			case(	45	){	color = 	0x4B105C	; iCumRate += 	20	;} //	0.598265031
			case(	46	){	color = 	0xFF3FA7	; iCumRate += 	20	;} //	0.598265031
			case(	47	){	color = 	0x6a2015ff	; iCumRate += 	1	;} //	0.029913252
			case(	48	){	color = 	0x864037a8	; iCumRate += 	1	;} //	0.029913252
			case(	49	){	color = 	0x6a20345f	; iCumRate += 	1	;} //	0.029913252

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
	GiveDyeingAmple(player, 0xC58D8D, itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� ������ ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
}
