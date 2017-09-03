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
	// ���� ��í��2
	int itemID = cItem.GetClassId();
	if(GetLocale().LowerCase()== `china`)
	{
		// �߱��� ���
		// �߱� ��Ȱ �������� ĳ�ð������� ��Ȱ �������� ���ÿ� �ش�.

		bool bCashGachaphonGived = false;
		bool bLivingGachaphonGived = false;

		// ĳ�� ������
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

		// ���� ������
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3096);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString= `id:40011 durability:18000 durability_max:18000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096��ε�ҵ�
					case(1){itemString= `id:40033 durability:19000 durability_max:19000 prefix:20817 suffix:30815`;iCumRate+=1;}//0.0322997416 3096Ŭ���̸��
					case(2){itemString= `id:40078 durability:18000 durability_max:18000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096����Ͻ�
					case(3){itemString= `id:40174 durability:20000 durability_max:20000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096��׽�Ÿ
					case(4){itemString= `id:40080 durability:19000 durability_max:19000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096�۶��콺
					case(5){itemString= `id:40081 durability:15000 durability_max:15000 prefix:20720 suffix:30815`;iCumRate+=1;}//0.0322997416 3096�����պ���
					case(6){itemString= `id:40107 durability:22000 durability_max:22000 prefix:20720 suffix:31105`;iCumRate+=1;}//0.0322997416 3096����𺸿�
					case(7){itemString= `id:40031 durability:17000 durability_max:17000 prefix:20720 suffix:31105`;iCumRate+=1;}//0.0322997416 3096����
					case(8){itemString= `id:40090 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096��������
					case(9){itemString= `id:40038 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096����Ʈ�׿���
					case(10){itemString= `id:40039 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096���̽�����
					case(11){itemString= `id:40040 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096���̾����
					case(12){itemString= `id:40011 prefix:20505`;iCumRate+=1;}//0.0322997416 3096��ε�ҵ�
					case(13){itemString= `id:40033 prefix:20505`;iCumRate+=1;}//0.0322997416 3096Ŭ���̸��
					case(14){itemString= `id:40078 suffix:10608`;iCumRate+=1;}//0.0322997416 3096����Ͻ�
					case(15){itemString= `id:40174 suffix:10608`;iCumRate+=1;}//0.0322997416 3096��׽�Ÿ
					case(16){itemString= `id:40080 suffix:10608`;iCumRate+=1;}//0.0322997416 3096�۶��콺
					case(17){itemString= `id:40081 prefix:20505`;iCumRate+=1;}//0.0322997416 3096�����պ���
					case(18){itemString= `id:40107 suffix:31105`;iCumRate+=1;}//0.0322997416 3096����𺸿�
					case(19){itemString= `id:40031 suffix:31105`;iCumRate+=1;}//0.0322997416 3096����
					case(20){itemString= `id:40090 suffix:30807`;iCumRate+=1;}//0.0322997416 3096��������
					case(21){itemString= `id:40038 suffix:30807`;iCumRate+=1;}//0.0322997416 3096����Ʈ�׿���
					case(22){itemString= `id:40039 suffix:30807`;iCumRate+=1;}//0.0322997416 3096���̽�����
					case(23){itemString= `id:40040 suffix:30807`;iCumRate+=1;}//0.0322997416 3096���̾����
					case(24){itemString= `id:40170`;iCumRate+=2;}//0.0645994832 3096�Ϻ��ľ�հ�
					case(25){itemString= `id:40171`;iCumRate+=2;}//0.0645994832 3096���繫��
					case(26){itemString= `id:40095 prefix:207 suffix:30702`;iCumRate+=2;}//0.0645994832 3096�巡����̵�
					case(27){itemString= `id:40033 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096Ŭ���̸��
					case(28){itemString= `id:40081 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�����պ���
					case(29){itemString= `id:40090 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096��������
					case(30){itemString= `id:40080 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�۶��콺
					case(31){itemString= `id:40038 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096����Ʈ�׿���
					case(32){itemString= `id:40039 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096���̽�����
					case(33){itemString= `id:40040 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096���̾����
					case(34){itemString= `id:40041 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096Ÿ�ݿ����
					case(35){itemString= `id:40078 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096����Ͻ�
					case(36){itemString= `id:40079 prefix:20701 suffix:30506`;iCumRate+=5;}//0.1614987080 3096���̽�
					case(37){itemString= `id:40031 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096����
					case(38){itemString= `id:40030 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096���ڵ��ҵ�
					case(39){itemString= `id:40013 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�պ���
					case(40){itemString= `id:40014 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096����������
					case(41){itemString= `id:40016 prefix:20701 suffix:30506`;iCumRate+=5;}//0.1614987080 3096�ظ�
					case(42){itemString= `id:40010 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�ռҵ�
					case(43){itemString= `id:40011 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096��ε�ҵ�
					case(44){itemString= `id:40012 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�ٽ�Ÿ��ҵ�
					case(45){itemString= `id:40015 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�÷�Ʈ���ҵ�
					case(46){itemString= `id:40003 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096������
					case(47){itemString= `id:40005 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096���ҵ�
					case(48){itemString= `id:40006 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�ܰ�
					case(49){itemString= `id:40002 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096�������
					case(50){itemString= `id:40033 prefix:207`;iCumRate+=7;}//0.2260981912 3096Ŭ���̸��
					case(51){itemString= `id:40081 prefix:20701`;iCumRate+=7;}//0.2260981912 3096�����պ���
					case(52){itemString= `id:40090 prefix:207`;iCumRate+=7;}//0.2260981912 3096��������
					case(53){itemString= `id:40080 prefix:207`;iCumRate+=7;}//0.2260981912 3096�۶��콺
					case(54){itemString= `id:40038 prefix:207`;iCumRate+=7;}//0.2260981912 3096����Ʈ�׿���
					case(55){itemString= `id:40039 prefix:207`;iCumRate+=7;}//0.2260981912 3096���̽�����
					case(56){itemString= `id:40040 prefix:207`;iCumRate+=7;}//0.2260981912 3096���̾����
					case(57){itemString= `id:40041 prefix:207`;iCumRate+=7;}//0.2260981912 3096Ÿ�ݿ����
					case(58){itemString= `id:40078 prefix:207`;iCumRate+=7;}//0.2260981912 3096����Ͻ�
					case(59){itemString= `id:40079 prefix:20701`;iCumRate+=7;}//0.2260981912 3096���̽�
					case(60){itemString= `id:40031 prefix:20701`;iCumRate+=7;}//0.2260981912 3096����
					case(61){itemString= `id:40030 prefix:207`;iCumRate+=7;}//0.2260981912 3096���ڵ��ҵ�
					case(62){itemString= `id:40013 prefix:20701`;iCumRate+=7;}//0.2260981912 3096�պ���
					case(63){itemString= `id:40014 prefix:20701`;iCumRate+=7;}//0.2260981912 3096����������
					case(64){itemString= `id:40016 prefix:20701`;iCumRate+=7;}//0.2260981912 3096�ظ�
					case(65){itemString= `id:40010 prefix:207`;iCumRate+=7;}//0.2260981912 3096�ռҵ�
					case(66){itemString= `id:40011 prefix:207`;iCumRate+=7;}//0.2260981912 3096��ε�ҵ�
					case(67){itemString= `id:40012 prefix:207`;iCumRate+=7;}//0.2260981912 3096�ٽ�Ÿ��ҵ�
					case(68){itemString= `id:40015 prefix:207`;iCumRate+=7;}//0.2260981912 3096�÷�Ʈ���ҵ�
					case(69){itemString= `id:40003 prefix:207`;iCumRate+=7;}//0.2260981912 3096������
					case(70){itemString= `id:40005 prefix:207`;iCumRate+=7;}//0.2260981912 3096���ҵ�
					case(71){itemString= `id:40006 prefix:207`;iCumRate+=7;}//0.2260981912 3096�ܰ�
					case(72){itemString= `id:40002 prefix:207`;iCumRate+=7;}//0.2260981912 3096�������
					case(73){itemString= `id:62005 prefix:20505`;iCumRate+=9;}//0.2906976744 3096���ڵ�
					case(74){itemString= `id:62005 prefix:21007`;iCumRate+=9;}//0.2906976744 3096����
					case(75){itemString= `id:62005 suffix:30515`;iCumRate+=9;}//0.2906976744 3096������
					case(76){itemString= `id:62005 prefix:20625`;iCumRate+=9;}//0.2906976744 3096�ݼӹٴ�
					case(77){itemString= `id:62005 suffix:30624`;iCumRate+=9;}//0.2906976744 3096��糪��
					case(78){itemString= `id:62005 prefix:20721`;iCumRate+=9;}//0.2906976744 3096�Ѱ���
					case(79){itemString= `id:51004 count:10`;iCumRate+=11;}//0.3552971576 3096�����100����
					case(80){itemString= `id:51014 count:10`;iCumRate+=11;}//0.3552971576 3096���¹̳�100����
					case(81){itemString= `id:51029 count:10`;iCumRate+=11;}//0.3552971576 3096����°����¹̳�100����
					case(82){itemString= `id:63000 count:10`;iCumRate+=11;}//0.3552971576 3096�Ǵн��Ǳ���
					case(83){itemString= `id:60037 count:5`;iCumRate+=11;}//0.3552971576 3096����������
					case(84){itemString= `id:60038 count:5`;iCumRate+=11;}//0.3552971576 3096��������
					case(85){itemString= `id:50012 count:5`;iCumRate+=11;}//0.3552971576 3096Ȳ�ݴް�
					case(86){itemString= `id:50013 count:5`;iCumRate+=11;}//0.3552971576 3096Ȳ�ݻ��
					case(87){itemString= `id:50541 `;iCumRate+=11;}//0.3552971576 3096����������
					case(88){itemString= `id:50542 `;iCumRate+=11;}//0.3552971576 3096���������Ҹ����ƶ�
					case(89){itemString= `id:50543 `;iCumRate+=11;}//0.3552971576 3096īǪġ��
					case(90){itemString= `id:50544 `;iCumRate+=11;}//0.3552971576 3096�����ƶ�
					case(91){itemString= `id:50545 `;iCumRate+=11;}//0.3552971576 3096ī���ī
					case(92){itemString= `id:50546 `;iCumRate+=11;}//0.3552971576 3096���̽�ī���ī
					case(93){itemString= `id:50547 `;iCumRate+=11;}//0.3552971576 3096���̽������ƶ�
					case(94){itemString= `id:50163 quality:100`;iCumRate+=11;}//0.3552971576 3096�ǽ���Ĩ��
					case(95){itemString= `id:50170 quality:100`;iCumRate+=11;}//0.3552971576 3096ġ������
					case(96){itemString= `id:50171 quality:100`;iCumRate+=11;}//0.3552971576 3096�̸ึ�ϻ����
					case(97){itemString= `id:40007`;iCumRate+=11;}//0.3552971576 3096�Ѽյ���
					case(98){itemString= `id:40016`;iCumRate+=11;}//0.3552971576 3096�ظ�
					case(99){itemString= `id:40010`;iCumRate+=11;}//0.3552971576 3096�ռҵ�
					case(100){itemString= `id:40011`;iCumRate+=11;}//0.3552971576 3096��ε�ҵ�
					case(101){itemString= `id:40012`;iCumRate+=11;}//0.3552971576 3096�ٽ�Ÿ��ҵ�
					case(102){itemString= `id:40015`;iCumRate+=11;}//0.3552971576 3096�÷�Ʈ���ҵ�
					case(103){itemString= `id:40003`;iCumRate+=11;}//0.3552971576 3096������
					case(104){itemString= `id:40005`;iCumRate+=11;}//0.3552971576 3096���ҵ�
					case(105){itemString= `id:40006`;iCumRate+=11;}//0.3552971576 3096�ܰ�
					case(106){itemString= `id:40002`;iCumRate+=11;}//0.3552971576 3096�������
					case(107){itemString= `id:50123 quality:100`;iCumRate+=11;}//0.3552971576 3096����������
					case(108){itemString= `id:50124 quality:100`;iCumRate+=11;}//0.3552971576 3096����������ũ
					case(109){itemString= `id:40107`;iCumRate+=20;}//0.6459948320 3096����𺸿�
					case(110){itemString= `id:14042`;iCumRate+=20;}//0.6459948320 3096�ý�ƾ�����Ƹ�
					case(111){itemString= `id:16534`;iCumRate+=20;}//0.6459948320 3096�ý�ƾ������Ʋ��
					case(112){itemString= `id:17524`;iCumRate+=20;}//0.6459948320 3096�ý�ƾ��������
					case(113){itemString= `id:40031`;iCumRate+=20;}//0.6459948320 3096����
					case(114){itemString= `id:40081`;iCumRate+=20;}//0.6459948320 3096@���� �� ����
					case(115){itemString = `id:40031`; iCumRate +=20;} //0.6459948320 3096����
					case(116){itemString = `id:40014`; iCumRate +=20;} //0.6459948320 3096������ ����
					case(117){itemString = `id:46006`; iCumRate +=20;} //0.6459948320 3096ī��Ʈ �ǵ�
					case(118){itemString = `id:40011`; iCumRate +=20;} //0.6459948320 3096��ε� �ҵ�
					case(119){itemString = `id:46001`; iCumRate +=20;} //0.6459948320 3096���� �ǵ�
					case(120){itemString = `id:14013`; iCumRate +=20;} //0.6459948320 3096@�θ�ī ���׸�ŸŸ��
					case(121){itemString = `id:14019`; iCumRate +=20;} //0.6459948320 3096�׷��̽� �÷���Ʈ �Ƹ�
					case(122){itemString = `id:19007`; iCumRate +=20;} //0.6459948320 3096�߱� ���÷� �κ�
					case(123){itemString = `id:15135`; iCumRate +=20;} //0.6459948320 3096��ũ ��Ʈ
					case(124){itemString = `id:40015`; iCumRate +=20;} //0.6459948320 3096�÷�Ʈ �� �ҵ�
					case(125){itemString = `id:17071`; iCumRate +=20;} //0.6459948320 3096������ ����
					case(126){itemString = `id:15153`; iCumRate +=20;} //0.6459948320 3096���� �������� ��Ʈ(������)
					case(127){itemString = `id:13047`; iCumRate +=20;} //0.6459948320 3096Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(128){itemString = `id:17041`; iCumRate +=20;} //0.6459948320 3096�������� ���ú���
					case(129){itemString = `id:46008`; iCumRate +=20;} //0.6459948320 3096����Ʈ ���׷� ī��Ʈ �ǵ�
					case(130){itemString = `id:15055`; iCumRate +=20;} //0.6459948320 3096���� �̴� ���ǽ�
					case(131){itemString = `id:46006`; iCumRate +=20;} //0.6459948320 3096ī��Ʈ �ǵ�
					case(132){itemString = `id:15053`; iCumRate +=20;} //0.6459948320 3096�÷�Į�� ���ǽ�
					case(133){itemString = `id:40030`; iCumRate +=20;} //0.6459948320 3096�� �ڵ�� �ҵ�
					case(134){itemString = `id:17045`; iCumRate +=20;} //0.6459948320 3096���� �� ���� ���� ����
					case(135){itemString = `id:14004`; iCumRate +=20;} //0.6459948320 3096Ŭ�ν� ����
					case(136){itemString = `id:17040`; iCumRate +=20;} //0.6459948320 3096���� ��Ʈ�� ����
					case(137){itemString = `id:18525`; iCumRate +=20;} //0.6459948320 3096���͵�� ĸ
					case(138){itemString = `id:18511`; iCumRate +=20;} //0.6459948320 3096�÷�Ʈ Ǯ �︧
					case(139){itemString = `id:18506`; iCumRate +=20;} //0.6459948320 3096�� ���� �︧
					case(140){itemString = `id:16505`; iCumRate +=20;} //0.6459948320 3096�÷�Ʈ ��Ʋ��
					case(141){itemString = `id:18502`; iCumRate +=20;} //0.6459948320 3096�� �︧
					case(142){itemString = `id:15014`; iCumRate +=20;} //0.6459948320 3096�Ĺ߲��� ��
					case(143){itemString = `id:18113`; iCumRate +=22;} //0.7105943152 3096������ ����� ����
					case(144){itemString = `id:18114`; iCumRate +=22;} //0.7105943152 3096�ٹ��� ����� ����
					case(145){itemString = `id:18115`; iCumRate +=22;} //0.7105943152 3096�� ����� ����
					case(146){itemString = `id:18112`; iCumRate +=22;} //0.7105943152 3096�� ���� ��ǰ
					case(147){itemString = `id:18111`; iCumRate +=22;} //0.7105943152 3096���� ���� ��ǰ
					case(148){itemString = `id:18110`; iCumRate +=22;} //0.7105943152 3096���� ���� ��ǰ
					case(149){itemString = `id:18109`; iCumRate +=22;} //0.7105943152 3096���� ���� ��ǰ
					case(150){itemString = `id:18108`; iCumRate +=22;} //0.7105943152 3096���� ���� ��ǰ
					case(151){itemString = `id:18029`; iCumRate +=22;} //0.7105943152 3096������ �Ȱ�
					case(152){itemString = `id:18028`; iCumRate +=22;} //0.7105943152 3096���̽� �Ȱ�
					case(153){itemString = `id:40038`; iCumRate +=22;} //0.7105943152 3096����Ʈ�� ����
					case(154){itemString = `id:40039`; iCumRate +=22;} //0.7105943152 3096���̽� ����
					case(155){itemString = `id:40040`; iCumRate +=22;} //0.7105943152 3096���̾� ����
					case(156){itemString = `id:40041`; iCumRate +=22;} //0.7105943152 3096Ÿ�ݿ� ����
					case(157){itemString = `id:40090`; iCumRate +=22;} //0.7105943152 3096���� ����
					case(158){itemString = `id:18542`; iCumRate +=22;} //0.7105943152 3096�� ü�� Ǯ �︧
					case(159){itemString = `id:18543`; iCumRate +=22;} //0.7105943152 3096@�� ���� Ǯ �︧
					case(160){itemString = `id:18544`; iCumRate +=22;} //0.7105943152 3096@�� �縮ĭ ��������
					case(161){itemString = `id:18547`; iCumRate +=22;} //0.7105943152 3096@�� �ĳ��� ��� ��������
					case(162){itemString = `id:19020`; iCumRate +=22;} //0.7105943152 3096��Ÿ�� ����� ��Ʈ
					case(163){itemString = `id:16520`; iCumRate +=22;} //0.7105943152 3096�� ���� �۷���
					case(164){itemString = `id:15128`; iCumRate +=22;} //0.7105943152 3096�� �� ���� �巹��
					case(165){itemString = `id:16019`; iCumRate +=22;} //0.7105943152 3096�ٹ��� �ȸ� �尩
					case(166){itemString = `id:18047`; iCumRate +=22;} //0.7105943152 3096�ڷ��� ��Ʈ ����
					case(167){itemString = `id:18008`; iCumRate +=22;} //0.7105943152 3096��Ʈ������ ĸ
					case(168){itemString = `id:16008`; iCumRate +=22;} //0.7105943152 3096�ڷ��� ���� �۷���
					case(169){itemString = `id:15028`; iCumRate +=22;} //0.7105943152 3096�ڷ��� ������Ʈ
					case(170){itemString = `id:17506`; iCumRate +=22;} //0.7105943152 3096�ձ׸��� ����
					case(171){itemString = `id:18026`; iCumRate +=22;} //0.7105943152 3096��� ���θ���
					case(172){itemString = `id:15052`; iCumRate +=22;} //0.7105943152 3096��ũ�� ���� Ʃ��
					case(173){itemString = `id:19005`; iCumRate +=22;} //0.7105943152 3096���÷� �κ�
					case(174){itemString = `id:18040`; iCumRate +=22;} //0.7105943152 3096�ڷ��� ���� ������
					case(175){itemString = `id:18038`; iCumRate +=22;} //0.7105943152 3096���� �跿 ����
					case(176){itemString = `id:15042`; iCumRate +=22;} //0.7105943152 3096�ճ� ���ǽ�
					case(177){itemString = `id:40012`; iCumRate +=22;} //0.7105943152 3096�ٽ�Ÿ�� �ҵ�
					case(178){itemString = `id:2001`; iCumRate +=22;} //0.7105943152 3096��ȭ �ָӴ�
					case(179){itemString = `id:2006`; iCumRate +=22;} //0.7105943152 3096ū ��ȭ �ָӴ�
					case(180){itemString = `id:40015`; iCumRate +=22;} //0.7105943152 3096�÷�Ʈ �� �ҵ�
					case(181){itemString = `id:17016`; iCumRate +=22;} //0.7105943152 3096�ʵ� �Ĺ��
					case(182){itemString = `id:17015`; iCumRate +=22;} //0.7105943152 3096�Ĺ��
					case(183){itemString = `id:17005`; iCumRate +=22;} //0.7105943152 3096��ɲ� �Ź�
					case(184){itemString = `id:17002`; iCumRate +=22;} //0.7105943152 3096�˻� �Ź�
					case(185){itemString = `id:17022`; iCumRate +=22;} //0.7105943152 3096��������
					case(186){itemString = `id:17001`; iCumRate +=22;} //0.7105943152 3096���� ����
					case(187){itemString = `id:17007`; iCumRate +=22;} //0.7105943152 3096���� ����
					case(188){itemString = `id:15031`; iCumRate +=22;} //0.7105943152 3096�����б� ����
					case(189){itemString = `id:19012`; iCumRate +=22;} //0.7105943152 3096Ʈ��� ���̾�� �κ�
					case(190){itemString = `id:18004`; iCumRate +=22;} //0.7105943152 3096��� �мǸ���
					case(191){itemString = `id:15132`; iCumRate +=22;} //0.7105943152 3096���߷� ����Ʈ ����
					case(192){itemString = `id:15043`; iCumRate +=22;} //0.7105943152 3096����Ƽ ���Ʈ
					case(193){itemString = `id:40081`; iCumRate +=22;} //0.7105943152 3096���� �� ����
					case(194){itemString = `id:15023`; iCumRate +=22;} //0.7105943152 3096��ũ ��ɲۿ�
					case(195){itemString = `id:40079`; iCumRate +=22;} //0.7105943152 3096���̽�
					case(196){itemString = `id:62005 prefix:20108`; iCumRate +=24;} //0.7751937984 3096Ű��
					case(197){itemString = `id:62005 prefix:20203`; iCumRate +=24;} //0.7751937984 3096��ġ����
					case(198){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.7751937984 3096��ģ
					case(199){itemString = `id:62005 prefix:20501`; iCumRate +=24;} //0.7751937984 3096������
					case(200){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.7751937984 3096������
					case(201){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.7751937984 3096�߰���
					case(202){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.7751937984 3096�縷�Ź�
					case(203){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.7751937984 3096Ư����
					case(204){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.7751937984 3096�ż�
					case(205){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.7751937984 3096�ĸ���
					case(206){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.7751937984 3096�ż���
					case(207){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.7751937984 3096�����
					case(208){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.7751937984 3096������
					case(209){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.7751937984 3096������
					case(210){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.7751937984 3096������
					case(211){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.7751937984 3096���鸮
					case(212){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.7751937984 3096������
					case(213){itemString = `id:62005 suffix:30802`; iCumRate +=24;} //0.7751937984 3096ī����
					case(214){itemString = `id:62005 suffix:30803`; iCumRate +=24;} //0.7751937984 3096�����
					case(215){itemString = `id:62005 suffix:30804`; iCumRate +=24;} //0.7751937984 3096���Ž�
					case(216){itemString = `id:91034`; iCumRate +=80;} //2.5839793282 3096���� ����ġ ����
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
		if (!bCashGachaphonGived)
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
