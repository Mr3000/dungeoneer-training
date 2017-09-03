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
	// ��Ȱ ��í��
	int itemID = cItem.GetClassId();
	 if(GetLocale().LowerCase()== `china`
		|| GetLocale().LowerCase()== `taiwan`)
	{
		// �߱��� ���
		// �߱� ��Ȱ �������� ĳ�ð������� ��Ȱ �������� ���ÿ� �ش�.

		bool bCashGachaphonGived = false;
		bool bLivingGachaphonGived = false;

		// ĳ�� ������
		if(GetLocale().LowerCase()== `china`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(100);	//Ȯ���� ������ ���´�
			meta_array itemArray;

			while(true)
			{
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0) {	iCumRate +=	6;}
					case(1)	{	iCumRate += 6;}
					case(2)	{	iCumRate += 7;}
					case(3) {	iCumRate +=	7;}
					case(4) {	iCumRate +=	7;}
					case(5) {	iCumRate +=	7;}
					case(6) {	iCumRate +=	7;}
					case(7) {	iCumRate +=	7;}
					case(8) {	iCumRate += 4;}
					case(9) {	iCumRate +=	4;}
					case(10) {	iCumRate += 4;}
					case(11) {	iCumRate += 4;}
					case(12) {	iCumRate +=	4;}
					case(13) {	iCumRate +=	4;}
					case(14) {	iCumRate +=	5;}
					case(15) {	iCumRate += 15;}
					case(16) {	iCumRate += 2;}
				}

				if (iRandom < iCumRate)
				{
					switch(i)
					//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
					{
						// ����� ��������
						case(0)	//	6.0000000000 	100	���� �ν�Ʈ ����
						{
							itemString = `id:91002 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(1) //	6.0000000000 	100	���¹̳� �ν�Ʈ ����
						{
							itemString = `id:91003 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(2) //	7.0000000000 	100	ķ�����̾� ŰƮ
						{
							itemString = `id:63029 count:5`;
							itemArray.Add(itemString);
							itemString = `id:63029`;
							itemArray.Add(itemString);
						}
						case(3) //	7.0000000000 	100	���� ���� �̿��
						{
							itemString = `id:63026 count:5`;
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(4) //	7.0000000000 	100	���� ������ �̿��
						{
							itemString = `id:63047 count:5`;
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(5) //	7.0000000000 	100	��ȣ�� ��� �ν�Ʈ ����
						{
							itemString = `id:91004 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(6) //	7.0000000000 	100	����� �ν�Ʈ ����
						{
							itemString = `id:91001 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(7) //	7.0000000000 	100	17���� Ű�� �Ǵ� ����
						{
							itemString = `id:91007 expire:43200`;
							// ������ �ƴϱ� ������ ���� 3�� ����
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(8) //	4.0000000000 	100	���꽺�� ����
						{
							itemString = `id:63043 count:6`;
							itemArray.Add(itemString);
						}
						case(9) //	4.0000000000 	100	��Ƽ ��Ȱ�� ����
						{
							itemString = `id:63044 count:10`;
							itemArray.Add(itemString);
						}
						case(10) //	4.0000000000 	100	���� ȸ���� ����
						{
							itemString = `id:51031 count:8`;
							itemArray.Add(itemString);
						}
						case(11) //	4.0000000000 	100	��Ʈ ��� �Ҳɳ���ŰƮ
						{
							itemString = `id:63064 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(12) //	4.0000000000 	100	�ж�����
						{
							itemString = `id:63027 expire:10080`;
							// ������ �ƴϱ� ������ ���� 5�� ����
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(13) //	4.0000000000 	100	��뷮 �ູ�� ����
						{
							itemString = `id:63025 count:5`;
							itemArray.Add(itemString);
						}
						case(14) //	5.0000000000 	100	������ ��ȭ ����
						{
							itemString = `id:91005 expire:43200`;
							// ������ �ƴϱ� ������ ���� 3�� ����
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(15) //	15.0000000000 	100	10���� Ű�� �Ǵ� ����
						{
							itemString = `id:91006 expire:43200`;
							// ������ �ƴϱ� ������ ���� 3�� ����
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(16) //	2.0000000000 	100	���� ����
						{
							itemString = `id:63024 expire:10080`;
							// ������ �ƴϱ� ������ ���� 2�� ����
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
					}

					int j = 0;
					for (j = 0; j < itemArray.GetSize(); ++j)
					{
						itemString = (string)itemArray.Get(j);
						DebugOut(`�������� `+itemString+` �� ��`);
						GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					}

					bCashGachaphonGived = true;
				}
				if (bCashGachaphonGived)
				{
					break;
				}

				++i;
			}
		}

		// ��Ȱ ������
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3374);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(	0	){	itemString = `id:40018 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	���𷼷�
					case(	1	){	itemString = `id:40017 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	������
					case(	2	){	itemString = `id:40004 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	��Ʈ
					case(	3	){	itemString = `id:40050 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	�����
					case(	4	){	itemString = `id:40048 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	�ֽ�
					case(	5	){	itemString = `id:40049 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	�÷�Ʈ
					case(	6	){	itemString = `id:40071 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	7	){	itemString = `id:40072 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	8	){	itemString = `id:40073 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	9	){	itemString = `id:40074 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	10	){	itemString = `id:40075 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	11	){	itemString = `id:40076 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	12	){	itemString = `id:40077 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'��' �� �� ��
					case(	13	){	itemString = `id:40163 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	��ī����
					case(	14	){	itemString = `id:40042 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	��Į
					case(	15	){	itemString = `id:40043 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	���׿� �д�
					case(	16	){	itemString = `id:40044 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	�ٿ뵵 ����
					case(	17	){	itemString = `id:46004 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	����
					case(	18	){	itemString = `id:46005 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	���� ���̺�
					case(	19	){	itemString = `id:40045 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	���˴�
					case(	20	){	itemString = `id:40018 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	���𷼷�
					case(	21	){	itemString = `id:40017 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	������
					case(	22	){	itemString = `id:40004 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	��Ʈ
					case(	23	){	itemString = `id:40050 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	�����
					case(	24	){	itemString = `id:40048 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	�ֽ�
					case(	25	){	itemString = `id:40049 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	�÷�Ʈ
					case(	26	){	itemString = `id:40071 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	27	){	itemString = `id:40072 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	28	){	itemString = `id:40073 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	29	){	itemString = `id:40074 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	30	){	itemString = `id:40075 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	31	){	itemString = `id:40076 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	32	){	itemString = `id:40077 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	33	){	itemString = `id:40163 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	��ī����
					case(	34	){	itemString = `id:40042 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	��Į
					case(	35	){	itemString = `id:40043 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	���׿� �д�
					case(	36	){	itemString = `id:40044 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	�ٿ뵵 ����
					case(	37	){	itemString = `id:46004 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	����
					case(	38	){	itemString = `id:46005 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	���� ���̺�
					case(	39	){	itemString = `id:40045 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	���˴�
					case(	40	){	itemString = `id:40018 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	���𷼷�
					case(	41	){	itemString = `id:40017 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	������
					case(	42	){	itemString = `id:40004 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	��Ʈ
					case(	43	){	itemString = `id:40050 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	�����
					case(	44	){	itemString = `id:40048 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	�ֽ�
					case(	45	){	itemString = `id:40049 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	�÷�Ʈ
					case(	46	){	itemString = `id:40071 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	47	){	itemString = `id:40072 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	48	){	itemString = `id:40073 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	49	){	itemString = `id:40074 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	50	){	itemString = `id:40075 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	51	){	itemString = `id:40076 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	52	){	itemString = `id:40077 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'��' �� �� ��
					case(	53	){	itemString = `id:40163 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	��ī����
					case(	54	){	itemString = `id:40042 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	��Į
					case(	55	){	itemString = `id:40043 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	���׿� �д�
					case(	56	){	itemString = `id:40044 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	�ٿ뵵 ����
					case(	57	){	itemString = `id:46004 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	����
					case(	58	){	itemString = `id:46005 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	���� ���̺�
					case(	59	){	itemString = `id:40045 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	���˴�
					case(	60	){	itemString = `id:40031 `	; iCumRate += 	17	;} //	0.5038529935 	3374	����
					case(	61	){	itemString = `id:40081 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�� ����
					case(	62	){	itemString = `id:40014 `	; iCumRate += 	17	;} //	0.5038529935 	3374	������ ����
					case(	63	){	itemString = `id:46006 `	; iCumRate += 	17	;} //	0.5038529935 	3374	ī��Ʈ �ǵ�
					case(	64	){	itemString = `id:40011 `	; iCumRate += 	17	;} //	0.5038529935 	3374	��ε� �ҵ�
					case(	65	){	itemString = `id:46001 `    ; iCumRate += 	17	;} //	0.5038529935 	3374	���� �ǵ�
					case(	66	){	itemString = `id:14013 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�θ�ī
					case(	67	){	itemString = `id:14019 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�׷��̽� �÷���Ʈ �Ƹ�
					case(	68	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�߱� ���÷� �κ�
					case(	69	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�߱� ���÷� �κ�
					case(	70	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�߱� ���÷� �κ�
					case(	71	){	itemString = `id:40015 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�÷�Ʈ �� �ҵ�
					case(	72	){	itemString = `id:17071 `	; iCumRate += 	17	;} //	0.5038529935 	3374	������ ����
					case(	73	){	itemString = `id:15153 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���� �������� ��Ʈ(������)
					case(	74	){	itemString = `id:13047 `	; iCumRate += 	17	;} //	0.5038529935 	3374	Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(	75	){	itemString = `id:17041 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�������� ���ú���
					case(	76	){	itemString = `id:46008 `	; iCumRate += 	17	;} //	0.5038529935 	3374	����Ʈ ���׷� ī��Ʈ �ǵ�
					case(	77	){	itemString = `id:15055 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���� �̴� ���ǽ�
					case(	78	){	itemString = `id:46006 `	; iCumRate += 	17	;} //	0.5038529935 	3374	ī��Ʈ �ǵ�
					case(	79	){	itemString = `id:15053 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�÷�Į�� ���ǽ�
					case(	80	){	itemString = `id:40030 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�� �ڵ�� �ҵ�
					case(	81	){	itemString = `id:17045 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���� �� ���� ���� ����
					case(	82	){	itemString = `id:14004 `	; iCumRate += 	17	;} //	0.5038529935 	3374	Ŭ�ν� ����
					case(	83	){	itemString = `id:17040 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ��Ʈ�� ����
					case(	84	){	itemString = `id:18516 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�̺� ���� ũ���
					case(	85	){	itemString = `id:18521 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�����Ǿ� ����
					case(	86	){	itemString = `id:15136 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���谡 ��Ʈ
					case(	87	){	itemString = `id:18525 `	; iCumRate += 	17	;} //	0.5038529935 	3374	���͵�� ĸ
					case(	88	){	itemString = `id:18511 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�÷�Ʈ Ǯ �︧
					case(	89	){	itemString = `id:18506 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�� ���� �︧
					case(	90	){	itemString = `id:16505 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�÷�Ʈ ��Ʋ��
					case(	91	){	itemString = `id:18502 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�� �︧
					case(	92	){	itemString = `id:15014 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�Ĺ߲��� ��
					case(	93	){	itemString = `id:18113 `	; iCumRate += 	17	;} //	0.5038529935 	3374	������ ����� ����
					case(	94	){	itemString = `id:18114 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�ٹ��� ����� ����
					case(	95	){	itemString = `id:18115 `	; iCumRate += 	17	;} //	0.5038529935 	3374	�� ����� ����
					case(	96	){	itemString = `id:18112 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�� ���� ��ǰ
					case(	97	){	itemString = `id:18111 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� ���� ��ǰ
					case(	98	){	itemString = `id:18110 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� ���� ��ǰ
					case(	99	){	itemString = `id:18109 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� ���� ��ǰ
					case(	100	){	itemString = `id:18108 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� ���� ��ǰ
					case(	101	){	itemString = `id:18029 `	; iCumRate += 	20	;} //	0.5927682276 	3374	������ �Ȱ�
					case(	102	){	itemString = `id:18028 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���̽� �Ȱ�
					case(	103	){	itemString = `id:40038 `	; iCumRate += 	20	;} //	0.5927682276 	3374	����Ʈ�� ����
					case(	104	){	itemString = `id:40039 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���̽� ����
					case(	105	){	itemString = `id:40040 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���̾� ����
					case(	106	){	itemString = `id:40041 `	; iCumRate += 	20	;} //	0.5927682276 	3374	Ÿ�ݿ� ����
					case(	107	){	itemString = `id:40090 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� ����
					case(	108	){	itemString = `id:18542 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�� ü�� Ǯ �︧
					case(	109	){	itemString = `id:18543 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� Ǯ �︧
					case(	110	){	itemString = `id:18544 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�縮ĭ ��������
					case(	111	){	itemString = `id:18547 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ĳ��� ��� ��������
					case(	112	){	itemString = `id:19020 `	; iCumRate += 	20	;} //	0.5927682276 	3374	��Ÿ�� ����� ��Ʈ
					case(	113	){	itemString = `id:16520 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�� ���� �۷���
					case(	114	){	itemString = `id:15128 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�� �� ���� �巹��
					case(	115	){	itemString = `id:16019 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ٹ��� �ȸ� �尩
					case(	116	){	itemString = `id:18047 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ڷ��� ��Ʈ ����
					case(	117	){	itemString = `id:18008 `	; iCumRate += 	20	;} //	0.5927682276 	3374	��Ʈ������ ĸ
					case(	118	){	itemString = `id:16008 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ڷ��� ���� �۷���
					case(	119	){	itemString = `id:15028 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ڷ��� ������Ʈ
					case(	120	){	itemString = `id:17506 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ձ׸��� ����
					case(	121	){	itemString = `id:18026 `	; iCumRate += 	20	;} //	0.5927682276 	3374	��� ���θ���
					case(	122	){	itemString = `id:15052 `	; iCumRate += 	20	;} //	0.5927682276 	3374	��ũ�� ���� Ʃ��
					case(	123	){	itemString = `id:19005 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���÷� �κ�
					case(	124	){	itemString = `id:18040 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ڷ��� ���� ������
					case(	125	){	itemString = `id:18038 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� �跿 ����
					case(	126	){	itemString = `id:15042 `	; iCumRate += 	20	;} //	0.5927682276 	3374	�ճ� ���ǽ�
					case(	127	){	itemString = `id:46001 `	; iCumRate += 	20	;} //	0.5927682276 	3374	���� �ǵ�
					case(	128	){	itemString = `id:40012 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�ٽ�Ÿ�� �ҵ�
					case(	129	){	itemString = `id:2001` 		; iCumRate += 	24	;} //	0.7113218731 	3374	��ȭ �ָӴ�
					case(	130	){	itemString = `id:2006` 		; iCumRate += 	24	;} //	0.7113218731 	3374	ū ��ȭ �ָӴ�
					case(	131	){	itemString = `id:18010 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��� ����Ʈ ĸ
					case(	132	){	itemString = `id:15131 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�� �������� ��ĿƮ
					case(	133	){	itemString = `id:40015 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�÷�Ʈ �� �ҵ�
					case(	134	){	itemString = `id:17016 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�ʵ� �Ĺ��
					case(	135	){	itemString = `id:17015 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�Ĺ��
					case(	136	){	itemString = `id:17005 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��ɲ� �Ź�
					case(	137	){	itemString = `id:17002 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�˻� �Ź�
					case(	138	){	itemString = `id:17022 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��������
					case(	139	){	itemString = `id:17001 `	; iCumRate += 	24	;} //	0.7113218731 	3374	���� ����
					case(	140	){	itemString = `id:17007 `	; iCumRate += 	24	;} //	0.7113218731 	3374	���� ����
					case(	141	){	itemString = `id:16009 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��ɲ��尩
					case(	142	){	itemString = `id:80004 `	; iCumRate += 	24	;} //	0.7113218731 	3374	L �ε�
					case(	143	){	itemString = `id:15031 `	; iCumRate += 	24	;} //	0.7113218731 	3374	�����б� ����
					case(	144	){	itemString = `id:19012 `	; iCumRate += 	24	;} //	0.7113218731 	3374	Ʈ��� ���̾�� �κ�
					case(	145	){	itemString = `id:18004 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��� �мǸ���
					case(	146	){	itemString = `id:15132 `	; iCumRate += 	24	;} //	0.7113218731 	3374	���߷� ����Ʈ ����
					case(	147	){	itemString = `id:15043 `	; iCumRate += 	24	;} //	0.7113218731 	3374	����Ƽ ���Ʈ
					case(	148	){	itemString = `id:15033 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��� �����ڿ�
					case(	149	){	itemString = `id:40081 `	; iCumRate += 	24	;} //	0.7113218731 	3374	���� �� ����
					case(	150	){	itemString = `id:15023 `	; iCumRate += 	24	;} //	0.7113218731 	3374	��ũ ��ɲۿ�
					case(	151	){	itemString = `id:40079 `	; iCumRate += 	24	;} //	0.7113218731 	3374	���̽�
					case(	152	){	itemString = `id:62005 prefix:20203`	; iCumRate += 	16	;} //	0.4742145821 	3374	��ġ����
					case(	153	){	itemString = `id:62005 prefix:21003`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ĸ���
					case(	154	){	itemString = `id:62005 suffix:30201`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	155	){	itemString = `id:62005 suffix:30302`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ں�Ʈ
					case(	156	){	itemString = `id:62005 prefix:20201`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ϵ�
					case(	157	){	itemString = `id:62005 suffix:30304`	; iCumRate += 	16	;} //	0.4742145821 	3374	ȸ������
					case(	158	){	itemString = `id:62005 suffix:30702`	; iCumRate += 	16	;} //	0.4742145821 	3374	���̺�
					case(	159	){	itemString = `id:62005 suffix:30704`	; iCumRate += 	16	;} //	0.4742145821 	3374	���鸮
					case(	160	){	itemString = `id:62005 suffix:30801`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	161	){	itemString = `id:62005 suffix:30802`	; iCumRate += 	16	;} //	0.4742145821 	3374	ī����
					case(	162	){	itemString = `id:62005 suffix:30803`	; iCumRate += 	16	;} //	0.4742145821 	3374	�����
					case(	163	){	itemString = `id:62005 suffix:30804`	; iCumRate += 	16	;} //	0.4742145821 	3374	���Ž�
					case(	164	){	itemString = `id:62005 prefix:20405`	; iCumRate += 	16	;} //	0.4742145821 	3374	��ģ
					case(	165	){	itemString = `id:62005 prefix:20501`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	166	){	itemString = `id:62005 prefix:20602`	; iCumRate += 	16	;} //	0.4742145821 	3374	�߰���
					case(	167	){	itemString = `id:62005 prefix:20701`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ż�
					case(	168	){	itemString = `id:62005 suffix:30506`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ż���
					case(	169	){	itemString = `id:62005 suffix:30614`	; iCumRate += 	16	;} //	0.4742145821 	3374	�����
					case(	170	){	itemString = `id:62005 prefix:20108`	; iCumRate += 	16	;} //	0.4742145821 	3374	Ű��
					case(	171	){	itemString = `id:62005 prefix:20304`	; iCumRate += 	16	;} //	0.4742145821 	3374	Ÿ��
					case(	172	){	itemString = `id:62005 prefix:20505`	; iCumRate += 	16	;} //	0.4742145821 	3374	���ڵ�
					case(	173	){	itemString = `id:62005 prefix:20209`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	174	){	itemString = `id:62005 prefix:20409`	; iCumRate += 	16	;} //	0.4742145821 	3374	�縷����
					case(	175	){	itemString = `id:62005 prefix:20615`	; iCumRate += 	16	;} //	0.4742145821 	3374	�縷�Ź�
					case(	176	){	itemString = `id:62005 prefix:20508`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	177	){	itemString = `id:62005 prefix:20618`	; iCumRate += 	16	;} //	0.4742145821 	3374	�����̴�
					case(	178	){	itemString = `id:62005 prefix:20718`	; iCumRate += 	16	;} //	0.4742145821 	3374	�̻���
					case(	179	){	itemString = `id:62005 prefix:20212`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	180	){	itemString = `id:62005 prefix:20412`	; iCumRate += 	16	;} //	0.4742145821 	3374	����
					case(	181	){	itemString = `id:62005 prefix:20619`	; iCumRate += 	16	;} //	0.4742145821 	3374	Ư����
					case(	182	){	itemString = `id:62005 suffix:30616`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	183	){	itemString = `id:62005 suffix:30617`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	184	){	itemString = `id:62005 suffix:30618`	; iCumRate += 	16	;} //	0.4742145821 	3374	������
					case(	185	){	itemString = `id:62005 suffix:30726`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ϸ��
					case(	186	){	itemString = `id:62005 suffix:30629`	; iCumRate += 	16	;} //	0.4742145821 	3374	��ε�
					case(	187	){	itemString = `id:62005 suffix:30727`	; iCumRate += 	16	;} //	0.4742145821 	3374	�ұ�
					case(	188	){	itemString = `id:62005 suffix:30630`	; iCumRate += 	16	;} //	0.4742145821 	3374	����
					case(	189	){	itemString = `id:91034 `	; iCumRate += 	32	;} //	0.9484291642 	3374	����ġ ���� ����
					case(	190	){	itemString = `id:51003 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����� 50 ����
					case(	191	){	itemString = `id:51004 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����� 100 ����
					case(	192	){	itemString = `id:51007 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� 30 ����
					case(	193	){	itemString = `id:51008 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� 50 ����
					case(	194	){	itemString = `id:51013 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	���¹̳� 50 ����
					case(	195	){	itemString = `id:51014 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	���¹̳� 100 ����
					case(	196	){	itemString = `id:51001 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����� 10 ����
					case(	197	){	itemString = `id:51002 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����� 30 ����
					case(	198	){	itemString = `id:51022 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����°� ���� 30 ����
					case(	199	){	itemString = `id:51027 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����°� ���¹̳� 30 ����
					case(	200	){	itemString = `id:51028 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����°� ���¹̳� 50 ����
					case(	201	){	itemString = `id:51029 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	����°� ���¹̳� 100 ����
					case(	202	){	itemString = `id:63000 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	�Ǵн��� ����
					case(	203	){	itemString = `id:60037 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	�� ���� ����
					case(	204	){	itemString = `id:60038 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ����
					case(	205	){	itemString = `id:62004 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	��������
					case(	206	){	itemString = `id:50012`	; iCumRate += 	17	;} //	0.5038529935 	3374	Ȳ�� �ް�
					case(	207	){	itemString = `id:50013`	; iCumRate += 	17	;} //	0.5038529935 	3374	Ȳ�� ���
					case(	208	){	itemString = `id:50163 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�ǽ� �� Ĩ��
					case(	209	){	itemString = `id:50164 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	T�� ������ũ
					case(	210	){	itemString = `id:50165 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	ġ�� �׶���
					case(	211	){	itemString = `id:50166 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	ī�� ���̽�
					case(	212	){	itemString = `id:50167 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�� �� ��
					case(	213	){	itemString = `id:50168 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�۾���
					case(	214	){	itemString = `id:50169 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�ξ� ����
					case(	215	){	itemString = `id:50170 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	ġ�� ����
					case(	216	){	itemString = `id:50171 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�̸� ���ϻ� ����
					case(	217	){	itemString = `id:50172 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	����ġ�� ����
					case(	218	){	itemString = `id:50173 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� �� ���ݶ�
					case(	219	){	itemString = `id:50174 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	ũ��ũ ����
					case(	220	){	itemString = `id:50175 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�����
					case(	221	){	itemString = `id:50176 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ��Ŷ
					case(	222	){	itemString = `id:50177 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	����Ĩ ��Ű
					case(	223	){	itemString = `id:50178 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	������ �ֽ�
					case(	224	){	itemString = `id:50179 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� �ֽ�
					case(	225	){	itemString = `id:50180 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���ݸ� ����
					case(	226	){	itemString = `id:50181 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���λ� ��
					case(	227	){	itemString = `id:50182 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	�긮��� ����Ű
					case(	228	){	itemString = `id:50199 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	��ũ�� ����̹�
					case(	229	){	itemString = `id:50200 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ����
					case(	230	){	itemString = `id:50201 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	BnR
					case(	231	){	itemString = `id:50202 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	Ű�� �� �� ����
					case(	232	){	itemString = `id:50203 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ��������
					case(	233	){	itemString = `id:50183 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	����Ͻ� �����
					case(	234	){	itemString = `id:50123 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	����������
					case(	235	){	itemString = `id:50124 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	���� ������ũ
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
					bLivingGachaphonGived = true;
				}
				if (bLivingGachaphonGived)
				{
					break;
				}

				++i;
			}
		}

		// ĳ�� �������� ���޾Ҵ�.
		if (GetLocale().LowerCase()== `china` && !bCashGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		}

		// ��Ȱ �������� ���޾Ҵ�.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		}
	}	
}
