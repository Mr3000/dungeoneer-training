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
	// ���� ��í��
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
			int iRandom = Random(4570);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:40170`; iCumRate += 2;} //0.0437636761 4570�Ϻ��� ��հ�
					case(1){itemString = `id:40171`; iCumRate += 2;} //0.0437636761 4570���繫��
					case(2){itemString = `id:40095 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�巡�� ���̵�
					case(3){itemString = `id:40033 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570Ŭ���̸��
					case(4){itemString = `id:40081 prefix:20701 suffix:30702`; iCumRate += 3;} //0.0656455142 4570���� �� ����
					case(5){itemString = `id:40090 prefix:207 suffix:31003`; iCumRate += 3;} //0.0656455142 4570���� ����
					case(6){itemString = `id:40080 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�۶��콺
					case(7){itemString = `id:40038 prefix:207 suffix:31003`; iCumRate += 3;} //0.0656455142 4570����Ʈ�� ����
					case(8){itemString = `id:40039 prefix:207 suffix:31003`; iCumRate += 3;} //0.0656455142 4570���̽� ����
					case(9){itemString = `id:40040 prefix:207 suffix:31003`; iCumRate += 3;} //0.0656455142 4570���̾� ����
					case(10){itemString = `id:40041 prefix:207 suffix:31003`; iCumRate += 3;} //0.0656455142 4570Ÿ�ݿ� ����
					case(11){itemString = `id:40078 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570����Ͻ�
					case(12){itemString = `id:40079 prefix:20701 suffix:30506`; iCumRate += 3;} //0.0656455142 4570���̽�
					case(13){itemString = `id:40031 prefix:20701 suffix:30702`; iCumRate += 3;} //0.0656455142 4570����
					case(14){itemString = `id:40030 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�� �ڵ�� �ҵ�
					case(15){itemString = `id:40013 prefix:20701 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�� ����
					case(16){itemString = `id:40014 prefix:20701 suffix:30702`; iCumRate += 3;} //0.0656455142 4570������ ����
					case(17){itemString = `id:40016 prefix:20701 suffix:30506`; iCumRate += 3;} //0.0656455142 4570�ظ�
					case(18){itemString = `id:40010 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�� �ҵ�
					case(19){itemString = `id:40011 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570��ε� �ҵ�
					case(20){itemString = `id:40012 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�ٽ�Ÿ�� �ҵ�
					case(21){itemString = `id:40015 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�÷�Ʈ �� �ҵ�
					case(22){itemString = `id:40003 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�� ����
					case(23){itemString = `id:40005 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�� �ҵ�
					case(24){itemString = `id:40006 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570�ܰ�
					case(25){itemString = `id:40002 prefix:207 suffix:30702`; iCumRate += 3;} //0.0656455142 4570������ ��
					case(26){itemString = `id:40095 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�巡�� ���̵�
					case(27){itemString = `id:40033 suffix:30702`; iCumRate += 6;} //0.1312910284 4570Ŭ���̸��
					case(28){itemString = `id:40081 suffix:30702`; iCumRate += 6;} //0.1312910284 4570���� �� ����
					case(29){itemString = `id:40090 suffix:31003`; iCumRate += 6;} //0.1312910284 4570���� ����
					case(30){itemString = `id:40080 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�۶��콺
					case(31){itemString = `id:40038 suffix:31003`; iCumRate += 6;} //0.1312910284 4570����Ʈ�� ����
					case(32){itemString = `id:40039 suffix:31003`; iCumRate += 6;} //0.1312910284 4570���̽� ����
					case(33){itemString = `id:40040 suffix:31003`; iCumRate += 6;} //0.1312910284 4570���̾� ����
					case(34){itemString = `id:40041 suffix:31003`; iCumRate += 6;} //0.1312910284 4570Ÿ�ݿ� ����
					case(35){itemString = `id:40078 suffix:30702`; iCumRate += 6;} //0.1312910284 4570����Ͻ�
					case(36){itemString = `id:40079 prefix:20701`; iCumRate += 6;} //0.1312910284 4570���̽�
					case(37){itemString = `id:40031 prefix:20701`; iCumRate += 6;} //0.1312910284 4570����
					case(38){itemString = `id:40030 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�� �ڵ�� �ҵ�
					case(39){itemString = `id:40013 prefix:20701`; iCumRate += 6;} //0.1312910284 4570�� ����
					case(40){itemString = `id:40014 prefix:20701`; iCumRate += 6;} //0.1312910284 4570������ ����
					case(41){itemString = `id:40016 prefix:20701`; iCumRate += 6;} //0.1312910284 4570�ظ�
					case(42){itemString = `id:40010 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�� �ҵ�
					case(43){itemString = `id:40011 suffix:30702`; iCumRate += 6;} //0.1312910284 4570��ε� �ҵ�
					case(44){itemString = `id:40012 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�ٽ�Ÿ�� �ҵ�
					case(45){itemString = `id:40015 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�÷�Ʈ �� �ҵ�
					case(46){itemString = `id:40003 prefix:20701`; iCumRate += 6;} //0.1312910284 4570�� ����
					case(47){itemString = `id:40005 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�� �ҵ�
					case(48){itemString = `id:40006 suffix:30702`; iCumRate += 6;} //0.1312910284 4570�ܰ�
					case(49){itemString = `id:40002 suffix:30702`; iCumRate += 6;} //0.1312910284 4570������ ��
					case(50){itemString = `id:40031`; iCumRate += 29;} //0.6345733042 4570����
					case(51){itemString = `id:40081`; iCumRate += 29;} //0.6345733042 4570�� ����
					case(52){itemString = `id:40031`; iCumRate += 29;} //0.6345733042 4570����
					case(53){itemString = `id:40014`; iCumRate += 29;} //0.6345733042 4570������ ����
					case(54){itemString = `id:46006`; iCumRate += 29;} //0.6345733042 4570ī��Ʈ �ǵ�
					case(55){itemString = `id:40011`; iCumRate += 29;} //0.6345733042 4570��ε� �ҵ�
					case(56){itemString = `id:46001`; iCumRate += 29;} //0.6345733042 4570���� �ǵ�
					case(57){itemString = `id:14013`; iCumRate += 29;} //0.6345733042 4570�θ�ī
					case(58){itemString = `id:14019`; iCumRate += 29;} //0.6345733042 4570�׷��̽� �÷���Ʈ �Ƹ�
					case(59){itemString = `id:19007`; iCumRate += 29;} //0.6345733042 4570�߱� ���÷� �κ�
					case(60){itemString = `id:15135`; iCumRate += 29;} //0.6345733042 4570��ũ ��Ʈ
					case(61){itemString = `id:40015`; iCumRate += 29;} //0.6345733042 4570�÷�Ʈ �� �ҵ�
					case(62){itemString = `id:17071`; iCumRate += 29;} //0.6345733042 4570������ ����
					case(63){itemString = `id:15153`; iCumRate += 29;} //0.6345733042 4570���� �������� ��Ʈ(������)
					case(64){itemString = `id:13047`; iCumRate += 29;} //0.6345733042 4570Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(65){itemString = `id:17041`; iCumRate += 29;} //0.6345733042 4570�������� ���ú���
					case(66){itemString = `id:46008`; iCumRate += 29;} //0.6345733042 4570����Ʈ ���׷� ī��Ʈ �ǵ�
					case(67){itemString = `id:15055`; iCumRate += 29;} //0.6345733042 4570���� �̴� ���ǽ�
					case(68){itemString = `id:46006`; iCumRate += 29;} //0.6345733042 4570ī��Ʈ �ǵ�
					case(69){itemString = `id:15053`; iCumRate += 29;} //0.6345733042 4570�÷�Į�� ���ǽ�
					case(70){itemString = `id:40030`; iCumRate += 29;} //0.6345733042 4570�� �ڵ�� �ҵ�
					case(71){itemString = `id:17045`; iCumRate += 29;} //0.6345733042 4570���� �� ���� ���� ����
					case(72){itemString = `id:14004`; iCumRate += 29;} //0.6345733042 4570Ŭ�ν� ����
					case(73){itemString = `id:17040`; iCumRate += 29;} //0.6345733042 4570���� ��Ʈ�� ����
					case(74){itemString = `id:18516`; iCumRate += 29;} //0.6345733042 4570�̺� ���� ũ���
					case(75){itemString = `id:18521`; iCumRate += 29;} //0.6345733042 4570�����Ǿ� ����
					case(76){itemString = `id:15136`; iCumRate += 29;} //0.6345733042 4570���谡 ��Ʈ
					case(77){itemString = `id:18525`; iCumRate += 29;} //0.6345733042 4570���͵�� ĸ
					case(78){itemString = `id:18511`; iCumRate += 29;} //0.6345733042 4570�÷�Ʈ Ǯ �︧
					case(79){itemString = `id:18506`; iCumRate += 29;} //0.6345733042 4570�� ���� �︧
					case(80){itemString = `id:16505`; iCumRate += 29;} //0.6345733042 4570�÷�Ʈ ��Ʋ��
					case(81){itemString = `id:18502`; iCumRate += 29;} //0.6345733042 4570�� �︧
					case(82){itemString = `id:15014`; iCumRate += 29;} //0.6345733042 4570�Ĺ߲��� ��
					case(83){itemString = `id:18113`; iCumRate += 29;} //0.6345733042 4570������ ����� ����
					case(84){itemString = `id:18114`; iCumRate += 29;} //0.6345733042 4570�ٹ��� ����� ����
					case(85){itemString = `id:18115`; iCumRate += 29;} //0.6345733042 4570�� ����� ����
					case(86){itemString = `id:18112`; iCumRate += 33;} //0.7221006565 4570�� ���� ��ǰ
					case(87){itemString = `id:18111`; iCumRate += 33;} //0.7221006565 4570���� ���� ��ǰ
					case(88){itemString = `id:18110`; iCumRate += 33;} //0.7221006565 4570���� ���� ��ǰ
					case(89){itemString = `id:18109`; iCumRate += 33;} //0.7221006565 4570���� ���� ��ǰ
					case(90){itemString = `id:18108`; iCumRate += 33;} //0.7221006565 4570���� ���� ��ǰ
					case(91){itemString = `id:18029`; iCumRate += 33;} //0.7221006565 4570������ �Ȱ�
					case(92){itemString = `id:18028`; iCumRate += 33;} //0.7221006565 4570���̽� �Ȱ�
					case(93){itemString = `id:40038`; iCumRate += 33;} //0.7221006565 4570����Ʈ�� ����
					case(94){itemString = `id:40039`; iCumRate += 33;} //0.7221006565 4570���̽� ����
					case(95){itemString = `id:40040`; iCumRate += 33;} //0.7221006565 4570���̾� ����
					case(96){itemString = `id:40041`; iCumRate += 33;} //0.7221006565 4570Ÿ�ݿ� ����
					case(97){itemString = `id:40090`; iCumRate += 33;} //0.7221006565 4570���� ����
					case(98){itemString = `id:18542`; iCumRate += 33;} //0.7221006565 4570�� ü�� Ǯ �︧
					case(99){itemString = `id:18543`; iCumRate += 33;} //0.7221006565 4570���� Ǯ �︧
					case(100){itemString = `id:18544`; iCumRate += 33;} //0.7221006565 4570�縮ĭ ��������
					case(101){itemString = `id:18547`; iCumRate += 33;} //0.7221006565 4570�ĳ��� ��� ��������
					case(102){itemString = `id:19020`; iCumRate += 33;} //0.7221006565 4570��Ÿ�� ����� ��Ʈ
					case(103){itemString = `id:16520`; iCumRate += 33;} //0.7221006565 4570�� ���� �۷���
					case(104){itemString = `id:15128`; iCumRate += 33;} //0.7221006565 4570�� �� ���� �巹��
					case(105){itemString = `id:16019`; iCumRate += 33;} //0.7221006565 4570�ٹ��� �ȸ� �尩
					case(106){itemString = `id:18047`; iCumRate += 33;} //0.7221006565 4570�ڷ��� ��Ʈ ����
					case(107){itemString = `id:18008`; iCumRate += 33;} //0.7221006565 4570��Ʈ������ ĸ
					case(108){itemString = `id:16008`; iCumRate += 33;} //0.7221006565 4570�ڷ��� ���� �۷���
					case(109){itemString = `id:15028`; iCumRate += 33;} //0.7221006565 4570�ڷ��� ������Ʈ
					case(110){itemString = `id:17506`; iCumRate += 33;} //0.7221006565 4570�ձ׸��� ����
					case(111){itemString = `id:18026`; iCumRate += 33;} //0.7221006565 4570��� ���θ���
					case(112){itemString = `id:15052`; iCumRate += 33;} //0.7221006565 4570��ũ�� ���� Ʃ��
					case(113){itemString = `id:19005`; iCumRate += 33;} //0.7221006565 4570���÷� �κ�
					case(114){itemString = `id:18040`; iCumRate += 33;} //0.7221006565 4570�ڷ��� ���� ������
					case(115){itemString = `id:18038`; iCumRate += 33;} //0.7221006565 4570���� �跿 ����
					case(116){itemString = `id:15042`; iCumRate += 33;} //0.7221006565 4570�ճ� ���ǽ�
					case(117){itemString = `id:46001`; iCumRate += 33;} //0.7221006565 4570���� �ǵ�
					case(118){itemString = `id:40012`; iCumRate += 35;} //0.7658643326 4570�ٽ�Ÿ�� �ҵ�
					case(119){itemString = `id:2001`; iCumRate += 35;} //0.7658643326 4570��ȭ �ָӴ�
					case(120){itemString = `id:2006`; iCumRate += 35;} //0.7658643326 4570ū ��ȭ �ָӴ�
					case(121){itemString = `id:18010`; iCumRate += 35;} //0.7658643326 4570��� ����Ʈ ĸ
					case(122){itemString = `id:15131`; iCumRate += 35;} //0.7658643326 4570�� �������� ��ĿƮ
					case(123){itemString = `id:40015`; iCumRate += 35;} //0.7658643326 4570�÷�Ʈ �� �ҵ�
					case(124){itemString = `id:17016`; iCumRate += 35;} //0.7658643326 4570�ʵ� �Ĺ��
					case(125){itemString = `id:17015`; iCumRate += 35;} //0.7658643326 4570�Ĺ��
					case(126){itemString = `id:17005`; iCumRate += 35;} //0.7658643326 4570��ɲ� �Ź�
					case(127){itemString = `id:17002`; iCumRate += 35;} //0.7658643326 4570�˻� �Ź�
					case(128){itemString = `id:17022`; iCumRate += 35;} //0.7658643326 4570��������
					case(129){itemString = `id:17001`; iCumRate += 35;} //0.7658643326 4570���� ����
					case(130){itemString = `id:17007`; iCumRate += 35;} //0.7658643326 4570���� ����
					case(131){itemString = `id:16009`; iCumRate += 35;} //0.7658643326 4570��ɲ��尩
					case(132){itemString = `id:80004`; iCumRate += 35;} //0.7658643326 4570L �ε�
					case(133){itemString = `id:15031`; iCumRate += 35;} //0.7658643326 4570�����б� ����
					case(134){itemString = `id:19012`; iCumRate += 35;} //0.7658643326 4570Ʈ��� ���̾�� �κ�
					case(135){itemString = `id:18004`; iCumRate += 35;} //0.7658643326 4570��� �мǸ���
					case(136){itemString = `id:15132`; iCumRate += 35;} //0.7658643326 4570���߷� ����Ʈ ����
					case(137){itemString = `id:15043`; iCumRate += 35;} //0.7658643326 4570����Ƽ ���Ʈ
					case(138){itemString = `id:15033`; iCumRate += 35;} //0.7658643326 4570��� �����ڿ�
					case(139){itemString = `id:40081`; iCumRate += 35;} //0.7658643326 4570���� �� ����
					case(140){itemString = `id:15023`; iCumRate += 35;} //0.7658643326 4570��ũ ��ɲۿ�
					case(141){itemString = `id:40079`; iCumRate += 35;} //0.7658643326 4570���̽�
					case(142){itemString = `id:62005 prefix:20203`; iCumRate += 15;} //0.3282275711 4570��ġ����
					case(143){itemString = `id:62005 prefix:21003`; iCumRate += 20;} //0.4376367615 4570�ĸ���
					case(144){itemString = `id:62005 suffix:30201`; iCumRate += 15;} //0.3282275711 4570������
					case(145){itemString = `id:62005 suffix:30302`; iCumRate += 15;} //0.3282275711 4570�ں�Ʈ
					case(146){itemString = `id:62005 prefix:20201`; iCumRate += 15;} //0.3282275711 4570�ϵ�
					case(147){itemString = `id:62005 suffix:30304`; iCumRate += 15;} //0.3282275711 4570ȸ������
					case(148){itemString = `id:62005 suffix:30702`; iCumRate += 15;} //0.3282275711 4570���̺�
					case(149){itemString = `id:62005 suffix:30704`; iCumRate += 15;} //0.3282275711 4570���鸮
					case(150){itemString = `id:62005 suffix:30801`; iCumRate += 20;} //0.4376367615 4570������
					case(151){itemString = `id:62005 suffix:30802`; iCumRate += 20;} //0.4376367615 4570ī����
					case(152){itemString = `id:62005 suffix:30803`; iCumRate += 20;} //0.4376367615 4570�����
					case(153){itemString = `id:62005 suffix:30804`; iCumRate += 20;} //0.4376367615 4570���Ž�
					case(154){itemString = `id:62005 prefix:20405`; iCumRate += 20;} //0.4376367615 4570��ģ
					case(155){itemString = `id:62005 prefix:20501`; iCumRate += 20;} //0.4376367615 4570������
					case(156){itemString = `id:62005 prefix:20602`; iCumRate += 20;} //0.4376367615 4570�߰���
					case(157){itemString = `id:62005 prefix:20701`; iCumRate += 15;} //0.3282275711 4570�ż�
					case(158){itemString = `id:62005 suffix:30506`; iCumRate += 20;} //0.4376367615 4570�ż���
					case(159){itemString = `id:62005 suffix:30614`; iCumRate += 20;} //0.4376367615 4570�����
					case(160){itemString = `id:62005 prefix:20108`; iCumRate += 20;} //0.4376367615 4570Ű��
					case(161){itemString = `id:62005 prefix:20304`; iCumRate += 20;} //0.4376367615 4570Ÿ��
					case(162){itemString = `id:62005 prefix:20505`; iCumRate += 20;} //0.4376367615 4570���ڵ�
					case(163){itemString = `id:62005 prefix:20209`; iCumRate += 20;} //0.4376367615 4570������
					case(164){itemString = `id:62005 prefix:20409`; iCumRate += 20;} //0.4376367615 4570�縷����
					case(165){itemString = `id:62005 prefix:20615`; iCumRate += 20;} //0.4376367615 4570�縷�Ź�
					case(166){itemString = `id:62005 prefix:20508`; iCumRate += 20;} //0.4376367615 4570������
					case(167){itemString = `id:62005 prefix:20618`; iCumRate += 20;} //0.4376367615 4570�����̴�
					case(168){itemString = `id:62005 prefix:20718`; iCumRate += 20;} //0.4376367615 4570�̻���
					case(169){itemString = `id:62005 prefix:20212`; iCumRate += 20;} //0.4376367615 4570������
					case(170){itemString = `id:62005 prefix:20412`; iCumRate += 20;} //0.4376367615 4570����
					case(171){itemString = `id:62005 prefix:20619`; iCumRate += 20;} //0.4376367615 4570Ư����
					case(172){itemString = `id:62005 suffix:30616`; iCumRate += 20;} //0.4376367615 4570������
					case(173){itemString = `id:62005 suffix:30617`; iCumRate += 20;} //0.4376367615 4570������
					case(174){itemString = `id:62005 suffix:30618`; iCumRate += 20;} //0.4376367615 4570������
					case(175){itemString = `id:62005 suffix: 30726`; iCumRate += 20;} //0.4376367615 4570�ϸ��
					case(176){itemString = `id:62005 suffix: 30629`; iCumRate += 20;} //0.4376367615 4570��ε�
					case(177){itemString = `id:62005 suffix: 30727`; iCumRate += 20;} //0.4376367615 4570�ұ�
					case(178){itemString = `id:62005 suffix: 30630`; iCumRate += 20;} //0.4376367615 4570����
					case(179){itemString = `id:`; iCumRate += 50;} //1.0940919037 4570����ġ ���� ����
					case(180){itemString = `id:51003 count:10`; iCumRate += 15;} //0.3282275711 4570����� 50 ����
					case(181){itemString = `id:51004 count:10`; iCumRate += 15;} //0.3282275711 4570����� 100 ����
					case(182){itemString = `id:51007 count:10`; iCumRate += 15;} //0.3282275711 4570���� 30 ����
					case(183){itemString = `id:51008 count:10`; iCumRate += 15;} //0.3282275711 4570���� 50 ����
					case(184){itemString = `id:51013 count:10`; iCumRate += 15;} //0.3282275711 4570���¹̳� 50 ����
					case(185){itemString = `id:51014 count:10`; iCumRate += 15;} //0.3282275711 4570���¹̳� 100 ����
					case(186){itemString = `id:51001 count:10`; iCumRate += 15;} //0.3282275711 4570����� 10 ����
					case(187){itemString = `id:51002 count:10`; iCumRate += 15;} //0.3282275711 4570����� 30 ����
					case(188){itemString = `id:51022 count:10`; iCumRate += 15;} //0.3282275711 4570����°� ���� 30 ����
					case(189){itemString = `id:51027 count:10`; iCumRate += 15;} //0.3282275711 4570����°� ���¹̳� 30 ����
					case(190){itemString = `id:51028 count:10`; iCumRate += 15;} //0.3282275711 4570����°� ���¹̳� 50 ����
					case(191){itemString = `id:51029 count:10`; iCumRate += 15;} //0.3282275711 4570����°� ���¹̳� 100 ����
					case(192){itemString = `id:63000 count:10`; iCumRate += 15;} //0.3282275711 4570�Ǵн��� ����
					case(193){itemString = `id:60037 count:5`; iCumRate += 15;} //0.3282275711 4570�� ���� ����
					case(194){itemString = `id:60038 count:5`; iCumRate += 15;} //0.3282275711 4570���� ����
					case(195){itemString = `id:62004 count:5`; iCumRate += 15;} //0.3282275711 4570��������
					case(196){itemString = `id:50012`; iCumRate += 15;} //0.3282275711 4570Ȳ�� �ް�
					case(197){itemString = `id:50013`; iCumRate += 15;} //0.3282275711 4570Ȳ�� ���
					case(198){itemString = `id:50163 quality:100`; iCumRate += 15;} //0.3282275711 4570�ǽ� �� Ĩ��
					case(199){itemString = `id:50164 quality:100`; iCumRate += 15;} //0.3282275711 4570T�� ������ũ
					case(200){itemString = `id:50165 quality:100`; iCumRate += 15;} //0.3282275711 4570ġ�� �׶���
					case(201){itemString = `id:50166 quality:100`; iCumRate += 15;} //0.3282275711 4570ī�� ���̽�
					case(202){itemString = `id:50167 quality:100`; iCumRate += 15;} //0.3282275711 4570�� �� ��
					case(203){itemString = `id:50168 quality:100`; iCumRate += 15;} //0.3282275711 4570�۾���
					case(204){itemString = `id:50169 quality:100`; iCumRate += 15;} //0.3282275711 4570�ξ� ����
					case(205){itemString = `id:50170 quality:100`; iCumRate += 15;} //0.3282275711 4570ġ�� ����
					case(206){itemString = `id:50171 quality:100`; iCumRate += 15;} //0.3282275711 4570�̸� ���ϻ� ����
					case(207){itemString = `id:50172 quality:100`; iCumRate += 15;} //0.3282275711 4570����ġ�� ����
					case(208){itemString = `id:50173 quality:100`; iCumRate += 15;} //0.3282275711 4570���� �� ���ݶ�
					case(209){itemString = `id:50174 quality:100`; iCumRate += 15;} //0.3282275711 4570ũ��ũ ����
					case(210){itemString = `id:50175 quality:100`; iCumRate += 15;} //0.3282275711 4570�����
					case(211){itemString = `id:50176 quality:100`; iCumRate += 15;} //0.3282275711 4570���� ��Ŷ
					case(212){itemString = `id:40007`; iCumRate += 15;} //0.3282275711 4570�Ѽյ���
					case(213){itemString = `id:40016`; iCumRate += 15;} //0.3282275711 4570�ظ�
					case(214){itemString = `id:40010`; iCumRate += 15;} //0.3282275711 4570�� �ҵ�
					case(215){itemString = `id:40011`; iCumRate += 15;} //0.3282275711 4570��ε� �ҵ�
					case(216){itemString = `id:40012`; iCumRate += 15;} //0.3282275711 4570�ٽ�Ÿ�� �ҵ�
					case(217){itemString = `id:40015`; iCumRate += 15;} //0.3282275711 4570�÷�Ʈ �� �ҵ�
					case(218){itemString = `id:40003`; iCumRate += 15;} //0.3282275711 4570�� ����
					case(219){itemString = `id:40005`; iCumRate += 15;} //0.3282275711 4570�� �ҵ�
					case(220){itemString = `id:40006`; iCumRate += 15;} //0.3282275711 4570�ܰ�
					case(221){itemString = `id:40002`; iCumRate += 15;} //0.3282275711 4570������ ��
					case(222){itemString = `id:50123 quality:100`; iCumRate += 15;} //0.3282275711 4570����������
					case(223){itemString = `id:50124 quality:100`; iCumRate += 15;} //0.3282275711 4570���� ������ũ

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
