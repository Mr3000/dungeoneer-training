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
	// �Ƹ� ��í��
	int itemID = cItem.GetClassId();
	 if(GetLocale().LowerCase()== `china`)
	{
		// �߱��� ���
		// �߱� �������� ĳ�ð������� �Ƹ� �������� ���ÿ� �ش�.

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
						case(12) //	4.0000000000 	100	�ж� ����
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

		// �Ƹ� ������
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3066);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:17119`; iCumRate +=1;} //0.032615786klaus knight boots
					case(1){itemString = `id:13050`; iCumRate +=1;} //0.032615786klaus knight armor
					case(2){itemString = `id:16537`; iCumRate +=1;} //0.032615786klaus knight Gauntlet
					case(3){itemString = `id:17527`; iCumRate +=1;} //0.032615786basil gimlet Greave
					case(4){itemString = `id:13051`; iCumRate +=1;} //0.032615786basil gimlet armor
					case(5){itemString = `id:16538`; iCumRate +=1;} //0.032615786basil gimlet Gauntlet
					case(6){itemString = `id:14039 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(�ΰ�)
					case(7){itemString = `id:14040 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(����)
					case(8){itemString = `id:14041 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(���̾�Ʈ)
					case(9){itemString = `id:16532 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786���̳� �巡�� ��Ʋ��(�ΰ�/���̾�Ʈ)
					case(10){itemString = `id:16533 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786���̳� �巡�� ��Ʋ��(����)
					case(11){itemString = `id:17095 prefix:20721 suffix:30624`; iCumRate +=1;} //0.032615786���̳� �巡�� ����
					case(12){itemString = `id:18552 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786���̳� �巡�� �︧
					case(13){itemString = `id:14039 prefix:21007`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(�ΰ�)
					case(14){itemString = `id:14040 prefix:21007`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(����)
					case(15){itemString = `id:14041 prefix:21007`; iCumRate +=1;} //0.032615786���̳� �巡�� �Ƹ�(���̾�Ʈ)
					case(16){itemString = `id:16532 prefix:20625`; iCumRate +=1;} //0.032615786���̳� �巡�� ��Ʋ��(�ΰ�/���̾�Ʈ)
					case(17){itemString = `id:16533 prefix:20625`; iCumRate +=1;} //0.032615786���̳� �巡�� ��Ʋ��(����)
					case(18){itemString = `id:17095 prefix:20721`; iCumRate +=1;} //0.032615786���̳� �巡�� ����
					case(19){itemString = `id:18552 prefix:20625`; iCumRate +=1;} //0.032615786���̳� �巡�� �︧
					case(20){itemString = `id:13038  prefix:20403 suffix:30613`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ �Ƹ�
					case(21){itemString = `id:16524  prefix:20404 suffix:30601`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ ��극�̽�
					case(22){itemString = `id:17517  prefix:20404 suffix:30601`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ �׸���
					case(23){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(24){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(25){itemString = `id:16521  prefix:20404 suffix:30902`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(26){itemString = `id:17514  prefix:20404 suffix:30902`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(27){itemString = `id:14036 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144Ƽ���� �Ƹ�(������)
					case(28){itemString = `id:14037 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144Ƽ���� �Ƹ�(������)
					case(29){itemString = `id:16531 prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144Ƽ���� ��Ʋ��
					case(30){itemString = `id:17523 prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144Ƽ���� �׸���
					case(31){itemString = `id:18518  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144�巡�� ũ����Ʈ
					case(32){itemString = `id:13022 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144���� �÷���Ʈ �Ƹ� (PŸ��)
					case(33){itemString = `id:13010  prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144���� ����� ü�θ���
					case(34){itemString = `id:13031 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144������ī �ǹ� �÷���Ʈ �Ƹ�
					case(35){itemString = `id:16511  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144�ǹ� Ƽ�� �۷���
					case(36){itemString = `id:17510  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144������ī �ǹ� �÷���Ʈ ����
					case(37){itemString = `id:13043 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144���̴Ͼ� ������ ����(������)
					case(38){itemString = `id:13044 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144���̴Ͼ� ������ ����(������)
					case(39){itemString = `id:13047 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(40){itemString = `id:13048 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(41){itemString = `id:14025 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(42){itemString = `id:14026 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(43){itemString = `id:16028  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144ī�� ���Ǹ�Ʈ �۷���
					case(44){itemString = `id:17064  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144ī�� ���Ǹ�Ʈ ����
					case(45){itemString = `id:14018  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144�븣�� ������ �Ƹ�
					case(46){itemString = `id:18546  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144�븣�� ������ ���
					case(47){itemString = `id:14019 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144�׷��̽� �÷���Ʈ �Ƹ�
					case(48){itemString = `id:16523  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144�׷��̽� ��Ʋ��
					case(49){itemString = `id:17515  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144�׷��̽� �׸���
					case(50){itemString = `id:18545  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144�׷��̽� ���
					case(51){itemString = `id:14016  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144ũ�ν���Ʈ ���� ��Ʈ
					case(52){itemString = `id:14008 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144Ǯ��Ʈ ���� ����
					case(53){itemString = `id:14017  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144������Ʈ ���� ����
					case(54){itemString = `id:14007 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144�극��Ʈ Ŭ�ν� ����
					case(55){itemString = `id:13038  prefix:20403`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ �Ƹ�
					case(56){itemString = `id:16524  prefix:20404`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ ��극�̽�
					case(57){itemString = `id:17517  prefix:20404`; iCumRate +=2;} //0.065231572����ƾ �ǹ� ����Ʈ �׸���
					case(58){itemString = `id:13032 prefix:21006`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(59){itemString = `id:13033 prefix:21006`; iCumRate +=2;} //0.065231572�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(60){itemString = `id:14036 prefix:20403`; iCumRate +=5;} //0.16307893Ƽ���� �Ƹ�(������)
					case(61){itemString = `id:14037 prefix:20403`; iCumRate +=5;} //0.16307893Ƽ���� �Ƹ�(������)
					case(62){itemString = `id:16531 prefix:20404`; iCumRate +=5;} //0.16307893Ƽ���� ��Ʋ��
					case(63){itemString = `id:17523 prefix:20404`; iCumRate +=5;} //0.16307893Ƽ���� �׸���
					case(64){itemString = `id:18518  prefix:207`; iCumRate +=5;} //0.16307893�巡�� ũ����Ʈ
					case(65){itemString = `id:13022 prefix:20403`; iCumRate +=5;} //0.16307893���� �÷���Ʈ �Ƹ� (PŸ��)
					case(66){itemString = `id:13010  prefix:20403`; iCumRate +=5;} //0.16307893���� ����� ü�θ���
					case(67){itemString = `id:13031 prefix:20403`; iCumRate +=5;} //0.16307893������ī �ǹ� �÷���Ʈ �Ƹ�
					case(68){itemString = `id:16511  prefix:20404`; iCumRate +=5;} //0.16307893�ǹ� Ƽ�� �۷���
					case(69){itemString = `id:17510  prefix:20404`; iCumRate +=5;} //0.16307893������ī �ǹ� �÷���Ʈ ����
					case(70){itemString = `id:13043 prefix:20403`; iCumRate +=5;} //0.16307893���̴Ͼ� ������ ����(������)
					case(71){itemString = `id:13044 prefix:20403`; iCumRate +=5;} //0.16307893���̴Ͼ� ������ ����(������)
					case(72){itemString = `id:13047 prefix:20403`; iCumRate +=5;} //0.16307893Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(73){itemString = `id:13048 prefix:20403`; iCumRate +=5;} //0.16307893Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(74){itemString = `id:14025 prefix:20712`; iCumRate +=5;} //0.16307893ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(75){itemString = `id:14026 prefix:20712`; iCumRate +=5;} //0.16307893ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(76){itemString = `id:16028  prefix:20404`; iCumRate +=5;} //0.16307893ī�� ���Ǹ�Ʈ �۷���
					case(77){itemString = `id:17064  prefix:20404`; iCumRate +=5;} //0.16307893ī�� ���Ǹ�Ʈ ����
					case(78){itemString = `id:14018  prefix:20712`; iCumRate +=5;} //0.16307893�븣�� ������ �Ƹ�
					case(79){itemString = `id:18546  prefix:207`; iCumRate +=5;} //0.16307893�븣�� ������ ���
					case(80){itemString = `id:14019 prefix:20712`; iCumRate +=5;} //0.16307893�׷��̽� �÷���Ʈ �Ƹ�
					case(81){itemString = `id:16523  prefix:20404`; iCumRate +=5;} //0.16307893�׷��̽� ��Ʋ��
					case(82){itemString = `id:17515  prefix:20404`; iCumRate +=5;} //0.16307893�׷��̽� �׸���
					case(83){itemString = `id:18545  prefix:207`; iCumRate +=5;} //0.16307893�׷��̽� ���
					case(84){itemString = `id:14016  prefix:20712`; iCumRate +=5;} //0.16307893ũ�ν���Ʈ ���� ��Ʈ
					case(85){itemString = `id:14008 prefix:20712`; iCumRate +=5;} //0.16307893Ǯ��Ʈ ���� ����
					case(86){itemString = `id:14017  prefix:20712`; iCumRate +=5;} //0.16307893������Ʈ ���� ����
					case(87){itemString = `id:14007 prefix:20712`; iCumRate +=5;} //0.16307893�극��Ʈ Ŭ�ν� ����
					case(88){itemString = `id:14042`; iCumRate +=20;} //0.652315721�ý�ƾ ���� �Ƹ�
					case(89){itemString = `id:16534`; iCumRate +=20;} //0.652315721�ý�ƾ ���� ��Ʋ��
					case(90){itemString = `id:17524`; iCumRate +=20;} //0.652315721�ý�ƾ ���� ����
					case(91){itemString = `id:40031`; iCumRate +=20;} //0.652315721����
					case(92){itemString = `id:40081`; iCumRate +=20;} //0.652315721@���� �� ����
					case(93){itemString = `id:40031`; iCumRate +=20;} //0.652315721����
					case(94){itemString = `id:40014`; iCumRate +=20;} //0.652315721������ ����
					case(95){itemString = `id:46006`; iCumRate +=20;} //0.652315721ī��Ʈ �ǵ�
					case(96){itemString = `id:40011`; iCumRate +=20;} //0.652315721��ε� �ҵ�
					case(97){itemString = `id:46001`; iCumRate +=20;} //0.652315721���� �ǵ�
					case(98){itemString = `id:14013`; iCumRate +=20;} //0.652315721@�θ�ī ���׸�ŸŸ��
					case(99){itemString = `id:14019`; iCumRate +=20;} //0.652315721�׷��̽� �÷���Ʈ �Ƹ�
					case(100){itemString = `id:19007`; iCumRate +=20;} //0.652315721�߱� ���÷� �κ�
					case(101){itemString = `id:15135`; iCumRate +=20;} //0.652315721��ũ ��Ʈ
					case(102){itemString = `id:40015`; iCumRate +=20;} //0.652315721�÷�Ʈ �� �ҵ�
					case(103){itemString = `id:17071`; iCumRate +=20;} //0.652315721������ ����
					case(104){itemString = `id:15153`; iCumRate +=20;} //0.652315721���� �������� ��Ʈ(������)
					case(105){itemString = `id:13047`; iCumRate +=20;} //0.652315721Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(106){itemString = `id:17041`; iCumRate +=20;} //0.652315721�������� ���ú���
					case(107){itemString = `id:46008`; iCumRate +=20;} //0.652315721����Ʈ ���׷� ī��Ʈ �ǵ�
					case(108){itemString = `id:15055`; iCumRate +=20;} //0.652315721���� �̴� ���ǽ�
					case(109){itemString = `id:46006`; iCumRate +=20;} //0.652315721ī��Ʈ �ǵ�
					case(110){itemString = `id:15053`; iCumRate +=20;} //0.652315721�÷�Į�� ���ǽ�
					case(111){itemString = `id:40030`; iCumRate +=20;} //0.652315721�� �ڵ�� �ҵ�
					case(112){itemString = `id:17045`; iCumRate +=20;} //0.652315721���� �� ���� ���� ����
					case(113){itemString = `id:14004`; iCumRate +=20;} //0.652315721Ŭ�ν� ����
					case(114){itemString = `id:17040`; iCumRate +=20;} //0.652315721���� ��Ʈ�� ����
					case(115){itemString = `id:18525`; iCumRate +=20;} //0.652315721���͵�� ĸ
					case(116){itemString = `id:18511`; iCumRate +=20;} //0.652315721�÷�Ʈ Ǯ �︧
					case(117){itemString = `id:18506`; iCumRate +=20;} //0.652315721�� ���� �︧
					case(118){itemString = `id:16505`; iCumRate +=20;} //0.652315721�÷�Ʈ ��Ʋ��
					case(119){itemString = `id:18502`; iCumRate +=20;} //0.652315721�� �︧
					case(120){itemString = `id:15014`; iCumRate +=20;} //0.652315721�Ĺ߲��� ��
					case(121){itemString = `id:18113`; iCumRate +=22;} //0.717547293������ ����� ����
					case(122){itemString = `id:18114`; iCumRate +=22;} //0.717547293�ٹ��� ����� ����
					case(123){itemString = `id:18115`; iCumRate +=22;} //0.717547293�� ����� ����
					case(124){itemString = `id:18112`; iCumRate +=22;} //0.717547293�� ���� ��ǰ
					case(125){itemString = `id:18111`; iCumRate +=22;} //0.717547293���� ���� ��ǰ
					case(126){itemString = `id:18110`; iCumRate +=22;} //0.717547293���� ���� ��ǰ
					case(127){itemString = `id:18109`; iCumRate +=22;} //0.717547293���� ���� ��ǰ
					case(128){itemString = `id:18108`; iCumRate +=22;} //0.717547293���� ���� ��ǰ
					case(129){itemString = `id:18029`; iCumRate +=22;} //0.717547293������ �Ȱ�
					case(130){itemString = `id:18028`; iCumRate +=22;} //0.717547293���̽� �Ȱ�
					case(131){itemString = `id:40038`; iCumRate +=22;} //0.717547293����Ʈ�� ����
					case(132){itemString = `id:40039`; iCumRate +=22;} //0.717547293���̽� ����
					case(133){itemString = `id:40040`; iCumRate +=22;} //0.717547293���̾� ����
					case(134){itemString = `id:40041`; iCumRate +=22;} //0.717547293Ÿ�ݿ� ����
					case(135){itemString = `id:40090`; iCumRate +=22;} //0.717547293���� ����
					case(136){itemString = `id:18542`; iCumRate +=22;} //0.717547293�� ü�� Ǯ �︧
					case(137){itemString = `id:18543`; iCumRate +=22;} //0.717547293@�� ���� Ǯ �︧
					case(138){itemString = `id:18544`; iCumRate +=22;} //0.717547293@�� �縮ĭ ��������
					case(139){itemString = `id:18547`; iCumRate +=22;} //0.717547293@�� �ĳ��� ��� ��������
					case(140){itemString = `id:19020`; iCumRate +=22;} //0.717547293��Ÿ�� ����� ��Ʈ
					case(141){itemString = `id:16520`; iCumRate +=22;} //0.717547293�� ���� �۷���
					case(142){itemString = `id:15128`; iCumRate +=22;} //0.717547293�� �� ���� �巹��
					case(143){itemString = `id:16019`; iCumRate +=22;} //0.717547293�ٹ��� �ȸ� �尩
					case(144){itemString = `id:18047`; iCumRate +=22;} //0.717547293�ڷ��� ��Ʈ ����
					case(145){itemString = `id:18008`; iCumRate +=22;} //0.717547293��Ʈ������ ĸ
					case(146){itemString = `id:16008`; iCumRate +=22;} //0.717547293�ڷ��� ���� �۷���
					case(147){itemString = `id:15028`; iCumRate +=22;} //0.717547293�ڷ��� ������Ʈ
					case(148){itemString = `id:17506`; iCumRate +=22;} //0.717547293�ձ׸��� ����
					case(149){itemString = `id:18026`; iCumRate +=22;} //0.717547293��� ���θ���
					case(150){itemString = `id:15052`; iCumRate +=22;} //0.717547293��ũ�� ���� Ʃ��
					case(151){itemString = `id:19005`; iCumRate +=22;} //0.717547293���÷� �κ�
					case(152){itemString = `id:18040`; iCumRate +=22;} //0.717547293�ڷ��� ���� ������
					case(153){itemString = `id:18038`; iCumRate +=22;} //0.717547293���� �跿 ����
					case(154){itemString = `id:15042`; iCumRate +=22;} //0.717547293�ճ� ���ǽ�
					case(155){itemString = `id:40012`; iCumRate +=22;} //0.717547293�ٽ�Ÿ�� �ҵ�
					case(156){itemString = `id:2001`; iCumRate +=22;} //0.717547293��ȭ �ָӴ�
					case(157){itemString = `id:2006`; iCumRate +=22;} //0.717547293ū ��ȭ �ָӴ�
					case(158){itemString = `id:40015`; iCumRate +=22;} //0.717547293�÷�Ʈ �� �ҵ�
					case(159){itemString = `id:17016`; iCumRate +=22;} //0.717547293�ʵ� �Ĺ��
					case(160){itemString = `id:17015`; iCumRate +=22;} //0.717547293�Ĺ��
					case(161){itemString = `id:17005`; iCumRate +=22;} //0.717547293��ɲ� �Ź�
					case(162){itemString = `id:17002`; iCumRate +=22;} //0.717547293�˻� �Ź�
					case(163){itemString = `id:17022`; iCumRate +=22;} //0.717547293��������
					case(164){itemString = `id:17001`; iCumRate +=22;} //0.717547293���� ����
					case(165){itemString = `id:17007`; iCumRate +=22;} //0.717547293���� ����
					case(166){itemString = `id:15031`; iCumRate +=22;} //0.717547293�����б� ����
					case(167){itemString = `id:19012`; iCumRate +=22;} //0.717547293Ʈ��� ���̾�� �κ�
					case(168){itemString = `id:18004`; iCumRate +=22;} //0.717547293��� �мǸ���
					case(169){itemString = `id:15132`; iCumRate +=22;} //0.717547293���߷� ����Ʈ ����
					case(170){itemString = `id:15043`; iCumRate +=22;} //0.717547293����Ƽ ���Ʈ
					case(171){itemString = `id:40081`; iCumRate +=22;} //0.717547293���� �� ����
					case(172){itemString = `id:15023`; iCumRate +=22;} //0.717547293��ũ ��ɲۿ�
					case(173){itemString = `id:40079`; iCumRate +=22;} //0.717547293���̽�
					case(174){itemString = `id:62005 prefix:20108`; iCumRate +=24;} //0.782778865Ű��
					case(175){itemString = `id:62005 prefix:20203`; iCumRate +=24;} //0.782778865��ġ����
					case(176){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.782778865��ģ
					case(177){itemString = `id:62005 prefix:20501`; iCumRate +=24;} //0.782778865������
					case(178){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.782778865������
					case(179){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.782778865�߰���
					case(180){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.782778865�縷�Ź�
					case(181){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.782778865Ư����
					case(182){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.782778865�ż�
					case(183){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.782778865�ĸ���
					case(184){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.782778865�ż���
					case(185){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.782778865�����
					case(186){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.782778865������
					case(187){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.782778865������
					case(188){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.782778865������
					case(189){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.782778865���鸮
					case(190){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.782778865������
					case(191){itemString = `id:62005 suffix:30802`; iCumRate +=24;} //0.782778865ī����
					case(192){itemString = `id:62005 suffix:30803`; iCumRate +=24;} //0.782778865�����
					case(193){itemString = `id:62005 suffix:30804`; iCumRate +=24;} //0.782778865���Ž�
					case(194){itemString = `id:62005 prefix:20505`; iCumRate +=9;} //0.293542074���ڵ�
					case(195){itemString = `id:62005 prefix:21007`; iCumRate +=9;} //0.293542074����
					case(196){itemString = `id:62005 suffix:30515`; iCumRate +=9;} //0.293542074������
					case(197){itemString = `id:62005 prefix:20625`; iCumRate +=9;} //0.293542074�ݼ� �ٴ�
					case(198){itemString = `id:62005 suffix:30624`; iCumRate +=9;} //0.293542074��糪��
					case(199){itemString = `id:62005 prefix:20721`; iCumRate +=9;} //0.293542074�Ѱ���
					case(200){itemString = `id:91034`; iCumRate +=80;} //2.609262883���� ����ġ ����
					case(201){itemString = `id:51004`; iCumRate +=11;} //0.358773646����� 100 ����
					case(202){itemString = `id:51014`; iCumRate +=11;} //0.358773646���¹̳� 100 ����
					case(203){itemString = `id:51029`; iCumRate +=11;} //0.358773646����°� ���¹̳� 100 ����
					case(204){itemString = `id:63000`; iCumRate +=11;} //0.358773646�Ǵн��� ����
					case(205){itemString = `id:60037`; iCumRate +=11;} //0.358773646�� ���� ����
					case(206){itemString = `id:60038`; iCumRate +=11;} //0.358773646���� ����
					case(207){itemString = `id:50012`; iCumRate +=11;} //0.358773646Ȳ�� �ް�
					case(208){itemString = `id:50013`; iCumRate +=11;} //0.358773646Ȳ�� ���
					case(209){itemString = `id:50541 `; iCumRate +=11;} //0.358773646����������
					case(210){itemString = `id:50542 `; iCumRate +=11;} //0.358773646���������� �����ƶ�
					case(211){itemString = `id:50543 `; iCumRate +=11;} //0.358773646īǪġ��
					case(212){itemString = `id:50544 `; iCumRate +=11;} //0.358773646�����ƶ�
					case(213){itemString = `id:50545 `; iCumRate +=11;} //0.358773646ī�� ��ī
					case(214){itemString = `id:50546 `; iCumRate +=11;} //0.358773646���̽� ī�� ��ī
					case(215){itemString = `id:50547 `; iCumRate +=11;} //0.358773646���̽� �����ƶ�
					case(216){itemString = `id:50163`; iCumRate +=11;} //0.358773646�ǽ� �� Ĩ��
					case(217){itemString = `id:50170`; iCumRate +=11;} //0.358773646ġ�� ����
					case(218){itemString = `id:50171`; iCumRate +=11;} //0.358773646�̸� ���ϻ� ����
					case(219){itemString = `id:40007`; iCumRate +=11;} //0.358773646�Ѽյ���
					case(220){itemString = `id:40016`; iCumRate +=11;} //0.358773646�ظ�
					case(221){itemString = `id:40010`; iCumRate +=11;} //0.358773646�� �ҵ�
					case(222){itemString = `id:40011`; iCumRate +=11;} //0.358773646��ε� �ҵ�
					case(223){itemString = `id:40012`; iCumRate +=11;} //0.358773646�ٽ�Ÿ�� �ҵ�
					case(224){itemString = `id:40015`; iCumRate +=11;} //0.358773646�÷�Ʈ �� �ҵ�
					case(225){itemString = `id:40003`; iCumRate +=11;} //0.358773646�� ����
					case(226){itemString = `id:40005`; iCumRate +=11;} //0.358773646�� �ҵ�
					case(227){itemString = `id:40006`; iCumRate +=11;} //0.358773646�ܰ�
					case(228){itemString = `id:40002`; iCumRate +=11;} //0.358773646������ ��
					case(229){itemString = `id:50123`; iCumRate +=11;} //0.358773646����������
					case(230){itemString = `id:50124`; iCumRate +=11;} //0.358773646���� ������ũ
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

		// �Ƹ� �������� ���޾Ҵ�.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		}
	}	
}
