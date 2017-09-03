////////////////////////////////////////////////////////////////////////////////
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

 // �߱� A�׷�, B�׷� ���� ��ũ��Ʈ ��� ����
{
	// �Ƹ� ��í��
	int itemID = cItem.GetClassId();
	// �߱��� ���
	bool bCashGachaphonGived = false;	//ĳ��
	bool bLivingGachaphonGived2 = false;	//A�׷�
	bool bLivingGachaphonGived = false;	//B�׷�
	{
	// �߱��� ���
	// �߱� ��Ȱ �������� ĳ�ð������� ��Ȱ �������� ���ÿ� �ش�.
	// ĳ�� ������
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
				case(0) {iCumRate +=	9;}
				case(1) {iCumRate += 9;}
				case(2) {iCumRate += 11;}
				case(3) {iCumRate +=	9;}
				case(4) {iCumRate +=	9;}
				case(5) {iCumRate +=	11;}
				case(6) {iCumRate +=	13;}
				case(7) {iCumRate +=	9;}
				case(8) {iCumRate += 11;}
				case(9) {iCumRate +=	4;}
				case(10) {	iCumRate += 5;}
			}
			if (iRandom < iCumRate)
			{
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0)	// 	
					{
						itemString = `id:91002 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91001 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(1) //	 
					{
						itemString = `id:91004 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91003 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(2) //
					{
						itemString = `id:63064 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63074 count:6`;
						itemArray.Add(itemString);
						itemString = `id:63075 count:6`;
						itemArray.Add(itemString);
					}
					case(3) //
					{
						itemString = `id:63026 count:9`;
						itemArray.Add(itemString);
						itemString = `id:63047 count:8`;
						itemArray.Add(itemString);
					}
					case(4) //
					{
						itemString = `id:63043 count:7`;
						itemArray.Add(itemString);
						itemString = `id:63044 count:5`;
						itemArray.Add(itemString);
					}
					case(5) //
					{
						itemString = `id:63027 expire:10080`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:63029 count:9`;
						itemArray.Add(itemString);
					}
					case(6) //
					{
						itemString = `id:91007 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91006 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(7) //
					{
						itemString = `id:63025 count:2`;
						itemArray.Add(itemString);
						itemString = `id:91005 expire:43200`;
						// ������ �ƴϱ� ������ ���� 3�� ����
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(8) //
					{
						itemString = `id:51031 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63024 expire:10080`;
						// ������ �ƴϱ� ������ ���� 2�� ����
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(9) //
					{
						itemString = `id:91066`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91067`;
						itemArray.Add(itemString);
					}
					case(10) //	4.0000000000 	100	���� ȸ���� ����
					{
						itemString = `id:91059`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91063`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
				}
				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemString = (string)itemArray.Get(j);
					DebugOut(`�������� `+itemString+` �� ��`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
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
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(100);	//Ȯ���� ������ ���´�
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:91193 `; iCumRate +=7;} //5���̷��� ȣ����
				case(1){itemString = `id:91194 `; iCumRate +=14;} //5���̷��� ȣ����
				case(2){itemString = `id:91195 `; iCumRate +=4;} //5���̷��� ȣ����
				case(3){itemString = `id:91159 `; iCumRate +=30;} //15ȫ��������ġ 2�� ���� (30��)
				case(4){itemString = `id:63024 expire:10080`; iCumRate +=30;} //25���� ����
				case(5){itemString = `id:91066 `; iCumRate +=15;} //55���� ���� ���� ����
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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bLivingGachaphonGived2 = true;
			}
			if (bLivingGachaphonGived2)
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
		int iRandom = Random(3468);	//Ȯ���� ������ ���´�
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:19084 `; iCumRate +=1;} //0.028835063�����κ�
				case(1){itemString = `id:17237 `; iCumRate +=1;} //0.028835063�����Ź�
				case(2){itemString = `id:15601 `; iCumRate +=1;} //0.028835063���� �ǻ�
				case(3){itemString = `id:17325 `; iCumRate +=1;} //0.028835063���� �Ź�
				case(4){itemString = `id:15602 `; iCumRate +=1;} //0.028835063���̸�� �ǻ� 
				case(5){itemString = `id:17236 `; iCumRate +=1;} //0.028835063���̸�� �Ź� 
				case(6){itemString = `id:15325 `; iCumRate +=3;} //0.08650519���� ���� (������)
				case(7){itemString = `id:15326 `; iCumRate +=3;} //0.08650519���� �巹�� (������)
				case(8){itemString = `id:14047 `; iCumRate +=3;} //0.08650519�Ҳ� ���� ���� �Ƹ� (������)
				case(9){itemString = `id:14048 `; iCumRate +=3;} //0.08650519�Ҳ� ���� ���� �Ƹ� (������)
				case(10){itemString = `id:14049 `; iCumRate +=3;} //0.08650519�߸����� ���� ���� (������)
				case(11){itemString = `id:14050 `; iCumRate +=3;} //0.08650519�߸����� ���� ���� (������)
				case(12){itemString = `id:15315 `; iCumRate +=3;} //0.08650519�ƽ�ƾ ��� ��Ʈ
				case(13){itemString = `id:15314 `; iCumRate +=3;} //0.08650519���ī �� ������
				case(14){itemString = `id:15294 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ ������
				case(15){itemString = `id:15295 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ ������
				case(16){itemString = `id:18187 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519Ŀ�ٶ� ����
				case(17){itemString = `id:18188 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�ȴ�
				case(18){itemString = `id:18189 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519ī�캸�� ����
				case(19){itemString = `id:17132 `; iCumRate +=3;} //0.08650519���� ����
				case(20){itemString = `id:18566 `; iCumRate +=3;} //0.08650519���� ����
				case(21){itemString = `id:18559 `; iCumRate +=3;} //0.08650519�Ҳ� ���� ���� ĸ
				case(22){itemString = `id:18227 `; iCumRate +=3;} //0.08650519�ƽ�ƾ ĸ
				case(23){itemString = `id:18226 `; iCumRate +=3;} //0.08650519���ī ĸ
				case(24){itemString = `id:15079 `; iCumRate +=3;} //0.08650519������ �� ���� ��ĿƮ
				case(25){itemString = `id:15222 `; iCumRate +=3;} //0.08650519�׷��̽� �� �巹��(������)
				case(26){itemString = `id:15250 `; iCumRate +=3;} //0.08650519���̵� �ǻ� ��Ʈ Ÿ��
				case(27){itemString = `id:15251 `; iCumRate +=3;} //0.08650519���̵� �ǻ� �� Ÿ��
				case(28){itemString = `id:15252 `; iCumRate +=3;} //0.08650519���� �ǻ�
				case(29){itemString = `id:16046 `; iCumRate +=3;} //0.08650519����� �� �尩
				case(30){itemString = `id:15065 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���� ����Ʈ ��ĿƮ
				case(31){itemString = `id:15112 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ �����̷�
				case(32){itemString = `id:15113 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ �˻��б� ���� ��ƮŸ��
				case(33){itemString = `id:15114 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ �˻��б� ���� ��Ÿ��
				case(34){itemString = `id:15131 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�� �������� ��ĿƮ
				case(35){itemString = `id:15132 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���߷� ����Ʈ ����
				case(36){itemString = `id:15135 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519��ũ ��Ʈ
				case(37){itemString = `id:15137 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519������ ���� ��Ŷ ��Ʈ
				case(38){itemString = `id:15151 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(39){itemString = `id:15152 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(40){itemString = `id:15153 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���� �������� ��Ʈ(������)
				case(41){itemString = `id:15154 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���� �������� ��Ʈ(������)
				case(42){itemString = `id:15155 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�̵�ī�� ������ ����(������)
				case(43){itemString = `id:15156 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�̵�ī�� ������ ����(������)
				case(44){itemString = `id:15157 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���� ������ �Ǻ�(������)
				case(45){itemString = `id:15158 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519���� ������ �Ǻ�(������)
				case(46){itemString = `id:15184 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�׶� ���̼�Ʈ ���� ����
				case(47){itemString = `id:19007 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519�߱� ���÷� �κ�
				case(48){itemString = `id:16054 `; iCumRate +=5;} //0.144175317�Ҳ� ���� ���� �۷���
				case(49){itemString = `id:16053 `; iCumRate +=5;} //0.144175317�ƽ�ƾ �۷���
				case(50){itemString = `id:16052 `; iCumRate +=5;} //0.144175317���ī �� �۷���
				case(51){itemString = `id:15292 `; iCumRate +=5;} //0.144175317������ ������
				case(52){itemString = `id:15293 `; iCumRate +=5;} //0.144175317������ ������
				case(53){itemString = `id:18176 `; iCumRate +=5;} //0.144175317���̵� �Ӹ���
				case(54){itemString = `id:15233 `; iCumRate +=5;} //0.144175317������Ʈ ��� �巹��
				case(55){itemString = `id:15234 `; iCumRate +=5;} //0.144175317������Ʈ ��� ��Ʈ
				case(56){itemString = `id:15235 `; iCumRate +=5;} //0.144175317������Ʈ ��� �巹��
				case(57){itemString = `id:15419 `; iCumRate +=7;} //0.201845444���޶��� ��ƽ ���� ��Ʈ(������)
				case(58){itemString = `id:15420 `; iCumRate +=7;} //0.201845444���޶��� ��ƽ ���� ��Ʈ(������)
				case(59){itemString = `id:17106 `; iCumRate +=7;} //0.201845444�ΰ�/���� ������ �Ѻ� �Ź�
				case(60){itemString = `id:17107 `; iCumRate +=7;} //0.201845444�ΰ�/���� ������ �Ѻ� �Ź�
				case(61){itemString = `id:17108 `; iCumRate +=7;} //0.201845444���̾�Ʈ ������ �Ѻ� �Ź�
				case(62){itemString = `id:17109 `; iCumRate +=7;} //0.201845444���̾�Ʈ ������ �Ѻ� �Ź�
				case(63){itemString = `id:15179 `; iCumRate +=7;} //0.201845444�븸 ���� ���� ����
				case(64){itemString = `id:17075 `; iCumRate +=7;} //0.201845444�븸 ���� ���� �Ź�
				case(65){itemString = `id:13010  suffix:30613`; iCumRate +=7;} //0.201845444���� ����� ü�θ���
				case(66){itemString = `id:13022 suffix:30613`; iCumRate +=7;} //0.201845444���� �÷���Ʈ �Ƹ� (PŸ��)
				case(67){itemString = `id:13031 suffix:30613`; iCumRate +=7;} //0.201845444������ī �ǹ� �÷���Ʈ �Ƹ�
				case(68){itemString = `id:13032 suffix:31401`; iCumRate +=7;} //0.201845444�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(69){itemString = `id:13033 suffix:31401`; iCumRate +=7;} //0.201845444�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(70){itemString = `id:14025 suffix:30515`; iCumRate +=7;} //0.201845444ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(71){itemString = `id:14026 suffix:30515`; iCumRate +=7;} //0.201845444ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(72){itemString = `id:14036 suffix:30613`; iCumRate +=7;} //0.201845444Ƽ���� �Ƹ�(������)
				case(73){itemString = `id:14037 suffix:30613`; iCumRate +=7;} //0.201845444Ƽ���� �Ƹ�(������)
				case(74){itemString = `id:16028  suffix:30601`; iCumRate +=7;} //0.201845444ī�� ���Ǹ�Ʈ �۷���
				case(75){itemString = `id:16511  suffix:30601`; iCumRate +=7;} //0.201845444�ǹ� Ƽ�� �۷���
				case(76){itemString = `id:16521  suffix:30902`; iCumRate +=7;} //0.201845444�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
				case(77){itemString = `id:16531 suffix:30601`; iCumRate +=7;} //0.201845444Ƽ���� ��Ʋ��
				case(78){itemString = `id:17064  suffix:30601`; iCumRate +=7;} //0.201845444ī�� ���Ǹ�Ʈ ����
				case(79){itemString = `id:17510  suffix:30601`; iCumRate +=7;} //0.201845444������ī �ǹ� �÷���Ʈ ����
				case(80){itemString = `id:17514  suffix:30902`; iCumRate +=7;} //0.201845444�߷��þ� ũ�ν� ���� �÷���Ʈ ����
				case(81){itemString = `id:17523 suffix:30601`; iCumRate +=7;} //0.201845444Ƽ���� �׸���
				case(82){itemString = `id:18518  suffix:30601`; iCumRate +=7;} //0.201845444�巡�� ũ����Ʈ
				case(83){itemString = `id:18248 `; iCumRate +=10;} //0.288350634���޶��� ��ƽ ���� ����
				case(84){itemString = `id:18249 `; iCumRate +=10;} //0.288350634���޶��� ��ƽ ���� �����
				case(85){itemString = `id:17162 `; iCumRate +=10;} //0.288350634���޶��� ��ƽ ���� �Ź�
				case(86){itemString = `id:17163 `; iCumRate +=10;} //0.288350634���޶��� ��ƽ ���� ����
				case(87){itemString = `id:15189 `; iCumRate +=10;} //0.288350634��� ����� �����Ǻ�(������)
				case(88){itemString = `id:15190 `; iCumRate +=10;} //0.288350634����� �����Ǻ�(������)
				case(89){itemString = `id:18161 `; iCumRate +=13;} //0.374855825����Ĺ �͸���
				case(90){itemString = `id:18157 `; iCumRate +=13;} //0.374855825����� �� �Ӹ���
				case(91){itemString = `id:80000 `; iCumRate +=13;} //0.374855825������ ���� ��
				case(92){itemString = `id:80001 `; iCumRate +=13;} //0.374855825����� ��
				case(93){itemString = `id:80002 `; iCumRate +=13;} //0.374855825��ũ�� ��Ʈ
				case(94){itemString = `id:80003 `; iCumRate +=13;} //0.374855825������ ��Ʈ
				case(95){itemString = `id:80004 `; iCumRate +=13;} //0.374855825������ ����� �� ��
				case(96){itemString = `id:80005 `; iCumRate +=13;} //0.374855825������ �Ͼ�� �� ��
				case(97){itemString = `id:80006 `; iCumRate +=13;} //0.374855825������ ��ũ�� �� ��
				case(98){itemString = `id:62005 suffix:30515`; iCumRate +=18;} //0.519031142������
				case(99){itemString = `id:62005 prefix:20505`; iCumRate +=18;} //0.519031142���ڵ�
				case(100){itemString = `id:62005 prefix:21007`; iCumRate +=18;} //0.519031142����
				case(101){itemString = `id:62005 prefix:20625`; iCumRate +=18;} //0.519031142�ݼ� �ٴ�
				case(102){itemString = `id:62005 suffix:30624`; iCumRate +=18;} //0.519031142��糪��
				case(103){itemString = `id:62005 prefix:20721`; iCumRate +=18;} //0.519031142�Ѱ���
				case(104){itemString = `id:51003 count:10`; iCumRate +=20;} //0.576701269����� 50 ����
				case(105){itemString = `id:51004 count:10`; iCumRate +=20;} //0.576701269����� 100 ����
				case(106){itemString = `id:51007 count:10`; iCumRate +=20;} //0.576701269���� 30 ����
				case(107){itemString = `id:51008 count:10`; iCumRate +=20;} //0.576701269���� 50 ����
				case(108){itemString = `id:51009 count:10`; iCumRate +=20;} //0.576701269���� 100 ����
				case(109){itemString = `id:51013 count:10`; iCumRate +=20;} //0.576701269���¹̳� 50 ����
				case(110){itemString = `id:51014 count:10`; iCumRate +=20;} //0.576701269���¹̳� 100 ����
				case(111){itemString = `id:51022 count:10`; iCumRate +=20;} //0.576701269����°� ���� 30 ����
				case(112){itemString = `id:51023 count:10`; iCumRate +=20;} //0.576701269����°� ���� 50 ����
				case(113){itemString = `id:51027 count:10`; iCumRate +=20;} //0.576701269����°� ���¹̳� 30 ����
				case(114){itemString = `id:51028 count:10`; iCumRate +=20;} //0.576701269����°� ���¹̳� 50 ����
				case(115){itemString = `id:51029 count:10`; iCumRate +=20;} //0.576701269����°� ���¹̳� 100 ����
				case(116){itemString = `id:60036 count:5`; iCumRate +=20;} //0.576701269���ο� ���̺� ����
				case(117){itemString = `id:60037 count:5`; iCumRate +=20;} //0.576701269�� ���� ����
				case(118){itemString = `id:60038 count:5`; iCumRate +=20;} //0.576701269���� ����
				case(119){itemString = `id:60040 count:5`; iCumRate +=20;} //0.576701269�׸� ���̺� ����
				case(120){itemString = `id:62004 count:5`; iCumRate +=20;} //0.576701269��������
				case(121){itemString = `id:63000 count:10`; iCumRate +=20;} //0.576701269�Ǵн��� ����
				case(122){itemString = `id:2006 `; iCumRate +=23;} //0.663206459ū ��ȭ �ָӴ�
				case(123){itemString = `id:17015 `; iCumRate +=23;} //0.663206459�Ĺ��
				case(124){itemString = `id:14042 `; iCumRate +=23;} //0.663206459�ý�ƾ ���� �Ƹ�
				case(125){itemString = `id:16534 `; iCumRate +=23;} //0.663206459�ý�ƾ ���� ��Ʋ��
				case(126){itemString = `id:17524 `; iCumRate +=23;} //0.663206459�ý�ƾ ���� ����
				case(127){itemString = `id:13047 `; iCumRate +=23;} //0.663206459Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(128){itemString = `id:13048 `; iCumRate +=23;} //0.663206459Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(129){itemString = `id:14005 `; iCumRate +=23;} //0.663206459������� ��������
				case(130){itemString = `id:14011 `; iCumRate +=23;} //0.663206459������� ��������
				case(131){itemString = `id:14013 `; iCumRate +=23;} //0.663206459�θ�ī ���׸�ŸŸ��
				case(132){itemString = `id:14019 `; iCumRate +=23;} //0.663206459�׷��̽� �÷���Ʈ �Ƹ�
				case(133){itemString = `id:14035 `; iCumRate +=23;} //0.663206459�Ǹ�Ÿ ���� �Ƹ�
				case(134){itemString = `id:14038 `; iCumRate +=23;} //0.663206459�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
				case(135){itemString = `id:15014 `; iCumRate +=23;} //0.663206459�Ĺ߲��� ��
				case(136){itemString = `id:15028 `; iCumRate +=23;} //0.663206459�ڷ��� ������Ʈ
				case(137){itemString = `id:15042 `; iCumRate +=23;} //0.663206459�ճ� ���ǽ�
				case(138){itemString = `id:15052 `; iCumRate +=23;} //0.663206459��ũ�� ���� Ʃ��
				case(139){itemString = `id:15053 `; iCumRate +=23;} //0.663206459�÷�Į�� ���ǽ�
				case(140){itemString = `id:15055 `; iCumRate +=23;} //0.663206459���� �̴� ���ǽ�
				case(141){itemString = `id:15057 `; iCumRate +=23;} //0.663206459�� ���� ��Ʈ (����)
				case(142){itemString = `id:15070 `; iCumRate +=23;} //0.663206459���ĵ�Į�� �����긮��
				case(143){itemString = `id:15128 `; iCumRate +=23;} //0.663206459�� �� ���� �巹��
				case(144){itemString = `id:15135 `; iCumRate +=23;} //0.663206459��ũ ��Ʈ
				case(145){itemString = `id:15136 `; iCumRate +=23;} //0.663206459���谡 ��Ʈ
				case(146){itemString = `id:15153 `; iCumRate +=23;} //0.663206459���� �������� ��Ʈ(������)
				case(147){itemString = `id:15154 `; iCumRate +=23;} //0.663206459���� �������� ��Ʈ(������)
				case(148){itemString = `id:15230 `; iCumRate +=23;} //0.663206459������ �۷� üũ ��ĿƮ
				case(149){itemString = `id:16008 `; iCumRate +=23;} //0.663206459�ڷ��� ���� �۷���
				case(150){itemString = `id:16019 `; iCumRate +=23;} //0.663206459�ٹ��� �ȸ� �尩
				case(151){itemString = `id:16028 `; iCumRate +=23;} //0.663206459ī�� ���Ǹ�Ʈ �۷���
				case(152){itemString = `id:16040 `; iCumRate +=23;} //0.663206459�ݸ� �� �۷���
				case(153){itemString = `id:16505 `; iCumRate +=23;} //0.663206459�÷�Ʈ ��Ʋ��
				case(154){itemString = `id:16520 `; iCumRate +=23;} //0.663206459�� ���� �۷���
				case(155){itemString = `id:17040 `; iCumRate +=23;} //0.663206459���� ��Ʈ�� ����
				case(156){itemString = `id:17041 `; iCumRate +=23;} //0.663206459�������� ���ú���
				case(157){itemString = `id:17045 `; iCumRate +=23;} //0.663206459���� �� ���� ���� ����
				case(158){itemString = `id:17071 `; iCumRate +=23;} //0.663206459������ ����
				case(159){itemString = `id:17087 `; iCumRate +=23;} //0.663206459�ݸ� �� ����
				case(160){itemString = `id:17506 `; iCumRate +=23;} //0.663206459�ձ׸��� ����
				case(161){itemString = `id:17522 `; iCumRate +=23;} //0.663206459�Ǹ�Ÿ ���� ����
				case(162){itemString = `id:18008 `; iCumRate +=23;} //0.663206459��Ʈ������ ĸ
				case(163){itemString = `id:18023 `; iCumRate +=23;} //0.663206459��� ���� ĸ
				case(164){itemString = `id:18028 `; iCumRate +=23;} //0.663206459���̽� �Ȱ�
				case(165){itemString = `id:18029 `; iCumRate +=23;} //0.663206459������ �Ȱ�
				case(166){itemString = `id:18038 `; iCumRate +=23;} //0.663206459���� �跿 ����
				case(167){itemString = `id:18040 `; iCumRate +=23;} //0.663206459�ڷ��� ���� ������
				case(168){itemString = `id:18047 `; iCumRate +=23;} //0.663206459�ڷ��� ��Ʈ ����
				case(169){itemString = `id:18108 `; iCumRate +=23;} //0.663206459���� ���� ��ǰ
				case(170){itemString = `id:18109 `; iCumRate +=23;} //0.663206459���� ���� ��ǰ
				case(171){itemString = `id:18110 `; iCumRate +=23;} //0.663206459���� ���� ��ǰ
				case(172){itemString = `id:18112 `; iCumRate +=23;} //0.663206459�� ���� ��ǰ
				case(173){itemString = `id:18113 `; iCumRate +=23;} //0.663206459������ ����� ����
				case(174){itemString = `id:18114 `; iCumRate +=23;} //0.663206459�ٹ��� ����� ����
				case(175){itemString = `id:18115 `; iCumRate +=23;} //0.663206459�� ����� ����
				case(176){itemString = `id:18502 `; iCumRate +=23;} //0.663206459�� �︧
				case(177){itemString = `id:18506 `; iCumRate +=23;} //0.663206459�� ���� �︧
				case(178){itemString = `id:18511 `; iCumRate +=23;} //0.663206459�÷�Ʈ Ǯ �︧
				case(179){itemString = `id:18513 `; iCumRate +=23;} //0.663206459������ũ ĸ
				case(180){itemString = `id:18515 `; iCumRate +=23;} //0.663206459Ʈ�� ȥ ĸ
				case(181){itemString = `id:18525 `; iCumRate +=23;} //0.663206459���͵�� ĸ
				case(182){itemString = `id:18542 `; iCumRate +=23;} //0.663206459�� ü�� Ǯ �︧
				case(183){itemString = `id:18543 `; iCumRate +=23;} //0.663206459���� Ǯ �︧
				case(184){itemString = `id:19005 `; iCumRate +=23;} //0.663206459���÷� �κ�
				case(185){itemString = `id:19007 `; iCumRate +=23;} //0.663206459�߱� ���÷� �κ�
				case(186){itemString = `id:19020 `; iCumRate +=23;} //0.663206459��Ÿ�� ����� ��Ʈ
				case(187){itemString = `id:19029 `; iCumRate +=23;} //0.663206459���̾�Ʈ ���� �κ�
				case(188){itemString = `id:19034 `; iCumRate +=23;} //0.663206459������ Ŭ�ν� ������Ʈ
				case(189){itemString = `id:40011 `; iCumRate +=23;} //0.663206459��ε� �ҵ�
				case(190){itemString = `id:40012 `; iCumRate +=23;} //0.663206459�ٽ�Ÿ�� �ҵ�
				case(191){itemString = `id:40014 `; iCumRate +=23;} //0.663206459������ ����
				case(192){itemString = `id:40015 `; iCumRate +=23;} //0.663206459�÷�Ʈ �� �ҵ�
				case(193){itemString = `id:40030 `; iCumRate +=23;} //0.663206459�� �ڵ�� �ҵ�
				case(194){itemString = `id:40031 `; iCumRate +=23;} //0.663206459����
				case(195){itemString = `id:40038 `; iCumRate +=23;} //0.663206459����Ʈ�� ����
				case(196){itemString = `id:40039 `; iCumRate +=23;} //0.663206459���̽� ����
				case(197){itemString = `id:40040 `; iCumRate +=23;} //0.663206459���̾� ����
				case(198){itemString = `id:40041 `; iCumRate +=23;} //0.663206459Ÿ�ݿ� ����
				case(199){itemString = `id:40079 `; iCumRate +=23;} //0.663206459���̽�
				case(200){itemString = `id:40081 `; iCumRate +=23;} //0.663206459�� ����
				case(201){itemString = `id:40081 `; iCumRate +=23;} //0.663206459���� �� ����
				case(202){itemString = `id:40090 `; iCumRate +=23;} //0.663206459���� ����
				case(203){itemString = `id:46001  `; iCumRate +=23;} //0.663206459���� �ǵ�
				case(204){itemString = `id:46006 `; iCumRate +=23;} //0.663206459ī��Ʈ �ǵ�
				case(205){itemString = `id:40172 `; iCumRate +=23;} //0.663206459�׷���Ʈ �ҵ�
				case(206){itemString = `id:40174 `; iCumRate +=23;} //0.663206459��׽�Ÿ
				case(207){itemString = `id:40177  `; iCumRate +=23;} //0.663206459������ �׽�
				case(208){itemString = `id:40180  `; iCumRate +=23;} //0.663206459ȩ���� ��Ŭ
				case(209){itemString = `id:62005 prefix:20405`; iCumRate +=27;} //0.778546713��ģ
				case(210){itemString = `id:62005 prefix:20508`; iCumRate +=27;} //0.778546713������
				case(211){itemString = `id:62005 prefix:20602`; iCumRate +=27;} //0.778546713�߰���
				case(212){itemString = `id:62005 prefix:20615`; iCumRate +=27;} //0.778546713�縷�Ź�
				case(213){itemString = `id:62005 prefix:20619`; iCumRate +=27;} //0.778546713Ư����
				case(214){itemString = `id:62005 prefix:20701`; iCumRate +=27;} //0.778546713�ż�
				case(215){itemString = `id:62005 prefix:21003`; iCumRate +=27;} //0.778546713�ĸ���
				case(216){itemString = `id:62005 suffix:30506`; iCumRate +=27;} //0.778546713�ż���
				case(217){itemString = `id:62005 suffix:30614`; iCumRate +=27;} //0.778546713�����
				case(218){itemString = `id:62005 suffix:30616`; iCumRate +=27;} //0.778546713������
				case(219){itemString = `id:62005 suffix:30617`; iCumRate +=27;} //0.778546713������
				case(220){itemString = `id:62005 suffix:30618`; iCumRate +=27;} //0.778546713������
				case(221){itemString = `id:62005 suffix:30704`; iCumRate +=27;} //0.778546713���鸮
				case(222){itemString = `id:62005 suffix:30801`; iCumRate +=27;} //0.778546713������
				case(223){itemString = `id:91034 `; iCumRate +=85;} //2.450980392����ġ ���� ����
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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
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
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived2)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}