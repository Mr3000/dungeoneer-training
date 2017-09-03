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
				case(0){itemString = `id:18301 `; iCumRate +=5;} //5ȣ���� ����
				case(1){itemString = `id:91159 `; iCumRate +=15;} //15ȫ��������ġ 2�� ���� (30��)
				case(2){itemString = `id:63024 expire:10080`; iCumRate +=25;} //25���� ����
				case(3){itemString = `id:91134 `; iCumRate +=55;} //55�̸� ���� ���� ����
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
		int iRandom = Random(3505);	//Ȯ���� ������ ���´�
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15347 `; iCumRate +=5;} //0.142653352������ ��īŸ
				case(1){itemString = `id:15346 `; iCumRate +=5;} //0.142653352������ ��īŸ 
				case(2){itemString = `id:15269 `; iCumRate +=5;} //0.142653352�׾��� ���� �� 
				case(3){itemString = `id:15129 `; iCumRate +=5;} //0.142653352������ ��īŸ
				case(4){itemString = `id:15197 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(5){itemString = `id:15198 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(6){itemString = `id:15100 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(7){itemString = `id:15098 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(8){itemString = `id:15200 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(9){itemString = `id:15276 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(10){itemString = `id:15199 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(11){itemString = `id:15277 `; iCumRate +=5;} //0.142653352������ �Ѻ�
				case(12){itemString = `id:15279 `; iCumRate +=5;} //0.142653352���̾�Ʈ ������ �Ѻ�
				case(13){itemString = `id:15278 `; iCumRate +=5;} //0.142653352���̾�Ʈ ������ �Ѻ�
				case(14){itemString = `id:19069 `; iCumRate +=7;} //0.199714693ȣ���� �κ�
				case(15){itemString = `id:15325 `; iCumRate +=3;} //0.085592011���� ���� (������)
				case(16){itemString = `id:15326 `; iCumRate +=3;} //0.085592011���� �巹�� (������)
				case(17){itemString = `id:14047 `; iCumRate +=3;} //0.085592011�Ҳ� ���� ���� �Ƹ� (������)
				case(18){itemString = `id:14048 `; iCumRate +=3;} //0.085592011�Ҳ� ���� ���� �Ƹ� (������)
				case(19){itemString = `id:14049 `; iCumRate +=3;} //0.085592011�߸����� ���� ���� (������)
				case(20){itemString = `id:14050 `; iCumRate +=3;} //0.085592011�߸����� ���� ���� (������)
				case(21){itemString = `id:15315 `; iCumRate +=3;} //0.085592011�ƽ�ƾ ��� ��Ʈ
				case(22){itemString = `id:15314 `; iCumRate +=3;} //0.085592011���ī �� ������
				case(23){itemString = `id:15294 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ ������
				case(24){itemString = `id:15295 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ ������
				case(25){itemString = `id:18187 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011Ŀ�ٶ� ����
				case(26){itemString = `id:18188 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�ȴ�
				case(27){itemString = `id:18189 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011ī�캸�� ����
				case(28){itemString = `id:17132 `; iCumRate +=3;} //0.085592011���� ����
				case(29){itemString = `id:18566 `; iCumRate +=3;} //0.085592011���� ����
				case(30){itemString = `id:18559 `; iCumRate +=3;} //0.085592011�Ҳ� ���� ���� ĸ
				case(31){itemString = `id:18227 `; iCumRate +=3;} //0.085592011�ƽ�ƾ ĸ
				case(32){itemString = `id:18226 `; iCumRate +=3;} //0.085592011���ī ĸ
				case(33){itemString = `id:15079 `; iCumRate +=3;} //0.085592011������ �� ���� ��ĿƮ
				case(34){itemString = `id:15222 `; iCumRate +=3;} //0.085592011�׷��̽� �� �巹��(������)
				case(35){itemString = `id:15250 `; iCumRate +=3;} //0.085592011���̵� �ǻ� ��Ʈ Ÿ��
				case(36){itemString = `id:15251 `; iCumRate +=3;} //0.085592011���̵� �ǻ� �� Ÿ��
				case(37){itemString = `id:15252 `; iCumRate +=3;} //0.085592011���� �ǻ�
				case(38){itemString = `id:16046 `; iCumRate +=3;} //0.085592011����� �� �尩
				case(39){itemString = `id:15065 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���� ����Ʈ ��ĿƮ
				case(40){itemString = `id:15112 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ �����̷�
				case(41){itemString = `id:15113 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ �˻��б� ���� ��ƮŸ��
				case(42){itemString = `id:15114 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ �˻��б� ���� ��Ÿ��
				case(43){itemString = `id:15131 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�� �������� ��ĿƮ
				case(44){itemString = `id:15132 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���߷� ����Ʈ ����
				case(45){itemString = `id:15135 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011��ũ ��Ʈ
				case(46){itemString = `id:15137 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011������ ���� ��Ŷ ��Ʈ
				case(47){itemString = `id:15151 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(48){itemString = `id:15152 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(49){itemString = `id:15153 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���� �������� ��Ʈ(������)
				case(50){itemString = `id:15154 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���� �������� ��Ʈ(������)
				case(51){itemString = `id:15155 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�̵�ī�� ������ ����(������)
				case(52){itemString = `id:15156 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�̵�ī�� ������ ����(������)
				case(53){itemString = `id:15157 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���� ������ �Ǻ�(������)
				case(54){itemString = `id:15158 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011���� ������ �Ǻ�(������)
				case(55){itemString = `id:15184 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�׶� ���̼�Ʈ ���� ����
				case(56){itemString = `id:19007 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011�߱� ���÷� �κ�
				case(57){itemString = `id:17106 `; iCumRate +=7;} //0.199714693�ΰ�/���� ������ �Ѻ� �Ź�
				case(58){itemString = `id:17107 `; iCumRate +=7;} //0.199714693�ΰ�/���� ������ �Ѻ� �Ź�
				case(59){itemString = `id:17108 `; iCumRate +=7;} //0.199714693���̾�Ʈ ������ �Ѻ� �Ź�
				case(60){itemString = `id:17109 `; iCumRate +=7;} //0.199714693���̾�Ʈ ������ �Ѻ� �Ź�
				case(61){itemString = `id:15179 `; iCumRate +=7;} //0.199714693�븸 ���� ���� ����
				case(62){itemString = `id:17075 `; iCumRate +=7;} //0.199714693�븸 ���� ���� �Ź�
				case(63){itemString = `id:15189 `; iCumRate +=10;} //0.285306705��� ����� �����Ǻ�(������)
				case(64){itemString = `id:15190 `; iCumRate +=10;} //0.285306705����� �����Ǻ�(������)
				case(65){itemString = `id:16054 `; iCumRate +=5;} //0.142653352�Ҳ� ���� ���� �۷���
				case(66){itemString = `id:16053 `; iCumRate +=5;} //0.142653352�ƽ�ƾ �۷���
				case(67){itemString = `id:16052 `; iCumRate +=5;} //0.142653352���ī �� �۷���
				case(68){itemString = `id:15292 `; iCumRate +=5;} //0.142653352������ ������
				case(69){itemString = `id:15293 `; iCumRate +=5;} //0.142653352������ ������
				case(70){itemString = `id:18176 `; iCumRate +=5;} //0.142653352���̵� �Ӹ���
				case(71){itemString = `id:15233 `; iCumRate +=5;} //0.142653352������Ʈ ��� �巹��
				case(72){itemString = `id:15234 `; iCumRate +=5;} //0.142653352������Ʈ ��� ��Ʈ
				case(73){itemString = `id:15235 `; iCumRate +=5;} //0.142653352������Ʈ ��� �巹��
				case(74){itemString = `id:13010  suffix:30613`; iCumRate +=7;} //0.199714693���� ����� ü�θ���
				case(75){itemString = `id:13022 suffix:30613`; iCumRate +=7;} //0.199714693���� �÷���Ʈ �Ƹ� (PŸ��)
				case(76){itemString = `id:13031 suffix:30613`; iCumRate +=7;} //0.199714693������ī �ǹ� �÷���Ʈ �Ƹ�
				case(77){itemString = `id:13032 suffix:31401`; iCumRate +=7;} //0.199714693�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(78){itemString = `id:13033 suffix:31401`; iCumRate +=7;} //0.199714693�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(79){itemString = `id:14025 suffix:30515`; iCumRate +=7;} //0.199714693ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(80){itemString = `id:14026 suffix:30515`; iCumRate +=7;} //0.199714693ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(81){itemString = `id:14036 suffix:30613`; iCumRate +=7;} //0.199714693Ƽ���� �Ƹ�(������)
				case(82){itemString = `id:14037 suffix:30613`; iCumRate +=7;} //0.199714693Ƽ���� �Ƹ�(������)
				case(83){itemString = `id:16028  suffix:30601`; iCumRate +=7;} //0.199714693ī�� ���Ǹ�Ʈ �۷���
				case(84){itemString = `id:16511  suffix:30601`; iCumRate +=7;} //0.199714693�ǹ� Ƽ�� �۷���
				case(85){itemString = `id:16521  suffix:30902`; iCumRate +=7;} //0.199714693�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
				case(86){itemString = `id:16531 suffix:30601`; iCumRate +=7;} //0.199714693Ƽ���� ��Ʋ��
				case(87){itemString = `id:17064  suffix:30601`; iCumRate +=7;} //0.199714693ī�� ���Ǹ�Ʈ ����
				case(88){itemString = `id:17510  suffix:30601`; iCumRate +=7;} //0.199714693������ī �ǹ� �÷���Ʈ ����
				case(89){itemString = `id:17514  suffix:30902`; iCumRate +=7;} //0.199714693�߷��þ� ũ�ν� ���� �÷���Ʈ ����
				case(90){itemString = `id:17523 suffix:30601`; iCumRate +=7;} //0.199714693Ƽ���� �׸���
				case(91){itemString = `id:18518  suffix:30601`; iCumRate +=7;} //0.199714693�巡�� ũ����Ʈ
				case(92){itemString = `id:18144 `; iCumRate +=10;} //0.285306705��� ����� �������(������)
				case(93){itemString = `id:18145 `; iCumRate +=10;} //0.285306705��� ������ ����Ӹ����(������)
				case(94){itemString = `id:18161 `; iCumRate +=13;} //0.370898716����Ĺ �͸���
				case(95){itemString = `id:18157 `; iCumRate +=13;} //0.370898716����� �� �Ӹ���
				case(96){itemString = `id:80000 `; iCumRate +=13;} //0.370898716������ ���� ��
				case(97){itemString = `id:80001 `; iCumRate +=13;} //0.370898716����� ��
				case(98){itemString = `id:80002 `; iCumRate +=13;} //0.370898716��ũ�� ��Ʈ
				case(99){itemString = `id:80003 `; iCumRate +=13;} //0.370898716������ ��Ʈ
				case(100){itemString = `id:80004 `; iCumRate +=13;} //0.370898716������ ����� �� ��
				case(101){itemString = `id:80005 `; iCumRate +=13;} //0.370898716������ �Ͼ�� �� ��
				case(102){itemString = `id:80006 `; iCumRate +=13;} //0.370898716������ ��ũ�� �� ��
				case(103){itemString = `id:62005 suffix:30515`; iCumRate +=18;} //0.513552068������
				case(104){itemString = `id:62005 prefix:20505`; iCumRate +=18;} //0.513552068���ڵ�
				case(105){itemString = `id:62005 prefix:21007`; iCumRate +=18;} //0.513552068����
				case(106){itemString = `id:62005 prefix:20625`; iCumRate +=18;} //0.513552068�ݼ� �ٴ�
				case(107){itemString = `id:62005 suffix:30624`; iCumRate +=18;} //0.513552068��糪��
				case(108){itemString = `id:62005 prefix:20721`; iCumRate +=18;} //0.513552068�Ѱ���
				case(109){itemString = `id:51003 count:10`; iCumRate +=20;} //0.570613409����� 50 ����
				case(110){itemString = `id:51004 count:10`; iCumRate +=20;} //0.570613409����� 100 ����
				case(111){itemString = `id:51007 count:10`; iCumRate +=20;} //0.570613409���� 30 ����
				case(112){itemString = `id:51008 count:10`; iCumRate +=20;} //0.570613409���� 50 ����
				case(113){itemString = `id:51009 count:10`; iCumRate +=20;} //0.570613409���� 100 ����
				case(114){itemString = `id:51013 count:10`; iCumRate +=20;} //0.570613409���¹̳� 50 ����
				case(115){itemString = `id:51014 count:10`; iCumRate +=20;} //0.570613409���¹̳� 100 ����
				case(116){itemString = `id:51022 count:10`; iCumRate +=20;} //0.570613409����°� ���� 30 ����
				case(117){itemString = `id:51023 count:10`; iCumRate +=20;} //0.570613409����°� ���� 50 ����
				case(118){itemString = `id:51027 count:10`; iCumRate +=20;} //0.570613409����°� ���¹̳� 30 ����
				case(119){itemString = `id:51028 count:10`; iCumRate +=20;} //0.570613409����°� ���¹̳� 50 ����
				case(120){itemString = `id:51029 count:10`; iCumRate +=20;} //0.570613409����°� ���¹̳� 100 ����
				case(121){itemString = `id:60036 count:5`; iCumRate +=20;} //0.570613409���ο� ���̺� ����
				case(122){itemString = `id:60037 count:5`; iCumRate +=20;} //0.570613409�� ���� ����
				case(123){itemString = `id:60038 count:5`; iCumRate +=20;} //0.570613409���� ����
				case(124){itemString = `id:60040 count:5`; iCumRate +=20;} //0.570613409�׸� ���̺� ����
				case(125){itemString = `id:62004 count:5`; iCumRate +=20;} //0.570613409��������
				case(126){itemString = `id:63000 count:10`; iCumRate +=20;} //0.570613409�Ǵн��� ����
				case(127){itemString = `id:2006 `; iCumRate +=23;} //0.656205421ū ��ȭ �ָӴ�
				case(128){itemString = `id:17015 `; iCumRate +=23;} //0.656205421�Ĺ��
				case(129){itemString = `id:14042 `; iCumRate +=23;} //0.656205421�ý�ƾ ���� �Ƹ�
				case(130){itemString = `id:16534 `; iCumRate +=23;} //0.656205421�ý�ƾ ���� ��Ʋ��
				case(131){itemString = `id:17524 `; iCumRate +=23;} //0.656205421�ý�ƾ ���� ����
				case(132){itemString = `id:13047 `; iCumRate +=23;} //0.656205421Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(133){itemString = `id:13048 `; iCumRate +=23;} //0.656205421Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(134){itemString = `id:14005 `; iCumRate +=23;} //0.656205421������� ��������
				case(135){itemString = `id:14011 `; iCumRate +=23;} //0.656205421������� ��������
				case(136){itemString = `id:14013 `; iCumRate +=23;} //0.656205421�θ�ī ���׸�ŸŸ��
				case(137){itemString = `id:14019 `; iCumRate +=23;} //0.656205421�׷��̽� �÷���Ʈ �Ƹ�
				case(138){itemString = `id:14035 `; iCumRate +=23;} //0.656205421�Ǹ�Ÿ ���� �Ƹ�
				case(139){itemString = `id:14038 `; iCumRate +=23;} //0.656205421�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
				case(140){itemString = `id:15014 `; iCumRate +=23;} //0.656205421�Ĺ߲��� ��
				case(141){itemString = `id:15028 `; iCumRate +=23;} //0.656205421�ڷ��� ������Ʈ
				case(142){itemString = `id:15042 `; iCumRate +=23;} //0.656205421�ճ� ���ǽ�
				case(143){itemString = `id:15052 `; iCumRate +=23;} //0.656205421��ũ�� ���� Ʃ��
				case(144){itemString = `id:15053 `; iCumRate +=23;} //0.656205421�÷�Į�� ���ǽ�
				case(145){itemString = `id:15055 `; iCumRate +=23;} //0.656205421���� �̴� ���ǽ�
				case(146){itemString = `id:15057 `; iCumRate +=23;} //0.656205421�� ���� ��Ʈ (����)
				case(147){itemString = `id:15070 `; iCumRate +=23;} //0.656205421���ĵ�Į�� �����긮��
				case(148){itemString = `id:15128 `; iCumRate +=23;} //0.656205421�� �� ���� �巹��
				case(149){itemString = `id:15135 `; iCumRate +=23;} //0.656205421��ũ ��Ʈ
				case(150){itemString = `id:15136 `; iCumRate +=23;} //0.656205421���谡 ��Ʈ
				case(151){itemString = `id:15153 `; iCumRate +=23;} //0.656205421���� �������� ��Ʈ(������)
				case(152){itemString = `id:15154 `; iCumRate +=23;} //0.656205421���� �������� ��Ʈ(������)
				case(153){itemString = `id:15230 `; iCumRate +=23;} //0.656205421������ �۷� üũ ��ĿƮ
				case(154){itemString = `id:16008 `; iCumRate +=23;} //0.656205421�ڷ��� ���� �۷���
				case(155){itemString = `id:16019 `; iCumRate +=23;} //0.656205421�ٹ��� �ȸ� �尩
				case(156){itemString = `id:16028 `; iCumRate +=23;} //0.656205421ī�� ���Ǹ�Ʈ �۷���
				case(157){itemString = `id:16040 `; iCumRate +=23;} //0.656205421�ݸ� �� �۷���
				case(158){itemString = `id:16505 `; iCumRate +=23;} //0.656205421�÷�Ʈ ��Ʋ��
				case(159){itemString = `id:16520 `; iCumRate +=23;} //0.656205421�� ���� �۷���
				case(160){itemString = `id:17040 `; iCumRate +=23;} //0.656205421���� ��Ʈ�� ����
				case(161){itemString = `id:17041 `; iCumRate +=23;} //0.656205421�������� ���ú���
				case(162){itemString = `id:17045 `; iCumRate +=23;} //0.656205421���� �� ���� ���� ����
				case(163){itemString = `id:17071 `; iCumRate +=23;} //0.656205421������ ����
				case(164){itemString = `id:17087 `; iCumRate +=23;} //0.656205421�ݸ� �� ����
				case(165){itemString = `id:17506 `; iCumRate +=23;} //0.656205421�ձ׸��� ����
				case(166){itemString = `id:17522 `; iCumRate +=23;} //0.656205421�Ǹ�Ÿ ���� ����
				case(167){itemString = `id:18008 `; iCumRate +=23;} //0.656205421��Ʈ������ ĸ
				case(168){itemString = `id:18023 `; iCumRate +=23;} //0.656205421��� ���� ĸ
				case(169){itemString = `id:18028 `; iCumRate +=23;} //0.656205421���̽� �Ȱ�
				case(170){itemString = `id:18029 `; iCumRate +=23;} //0.656205421������ �Ȱ�
				case(171){itemString = `id:18038 `; iCumRate +=23;} //0.656205421���� �跿 ����
				case(172){itemString = `id:18040 `; iCumRate +=23;} //0.656205421�ڷ��� ���� ������
				case(173){itemString = `id:18047 `; iCumRate +=23;} //0.656205421�ڷ��� ��Ʈ ����
				case(174){itemString = `id:18108 `; iCumRate +=23;} //0.656205421���� ���� ��ǰ
				case(175){itemString = `id:18109 `; iCumRate +=23;} //0.656205421���� ���� ��ǰ
				case(176){itemString = `id:18110 `; iCumRate +=23;} //0.656205421���� ���� ��ǰ
				case(177){itemString = `id:18112 `; iCumRate +=23;} //0.656205421�� ���� ��ǰ
				case(178){itemString = `id:18113 `; iCumRate +=23;} //0.656205421������ ����� ����
				case(179){itemString = `id:18114 `; iCumRate +=23;} //0.656205421�ٹ��� ����� ����
				case(180){itemString = `id:18115 `; iCumRate +=23;} //0.656205421�� ����� ����
				case(181){itemString = `id:18502 `; iCumRate +=23;} //0.656205421�� �︧
				case(182){itemString = `id:18506 `; iCumRate +=23;} //0.656205421�� ���� �︧
				case(183){itemString = `id:18511 `; iCumRate +=23;} //0.656205421�÷�Ʈ Ǯ �︧
				case(184){itemString = `id:18513 `; iCumRate +=23;} //0.656205421������ũ ĸ
				case(185){itemString = `id:18515 `; iCumRate +=23;} //0.656205421Ʈ�� ȥ ĸ
				case(186){itemString = `id:18525 `; iCumRate +=23;} //0.656205421���͵�� ĸ
				case(187){itemString = `id:18542 `; iCumRate +=23;} //0.656205421�� ü�� Ǯ �︧
				case(188){itemString = `id:18543 `; iCumRate +=23;} //0.656205421���� Ǯ �︧
				case(189){itemString = `id:19005 `; iCumRate +=23;} //0.656205421���÷� �κ�
				case(190){itemString = `id:19007 `; iCumRate +=23;} //0.656205421�߱� ���÷� �κ�
				case(191){itemString = `id:19020 `; iCumRate +=23;} //0.656205421��Ÿ�� ����� ��Ʈ
				case(192){itemString = `id:19029 `; iCumRate +=23;} //0.656205421���̾�Ʈ ���� �κ�
				case(193){itemString = `id:19034 `; iCumRate +=23;} //0.656205421������ Ŭ�ν� ������Ʈ
				case(194){itemString = `id:40011 `; iCumRate +=23;} //0.656205421��ε� �ҵ�
				case(195){itemString = `id:40012 `; iCumRate +=23;} //0.656205421�ٽ�Ÿ�� �ҵ�
				case(196){itemString = `id:40014 `; iCumRate +=23;} //0.656205421������ ����
				case(197){itemString = `id:40015 `; iCumRate +=23;} //0.656205421�÷�Ʈ �� �ҵ�
				case(198){itemString = `id:40030 `; iCumRate +=23;} //0.656205421�� �ڵ�� �ҵ�
				case(199){itemString = `id:40031 `; iCumRate +=23;} //0.656205421����
				case(200){itemString = `id:40038 `; iCumRate +=23;} //0.656205421����Ʈ�� ����
				case(201){itemString = `id:40039 `; iCumRate +=23;} //0.656205421���̽� ����
				case(202){itemString = `id:40040 `; iCumRate +=23;} //0.656205421���̾� ����
				case(203){itemString = `id:40041 `; iCumRate +=23;} //0.656205421Ÿ�ݿ� ����
				case(204){itemString = `id:40079 `; iCumRate +=23;} //0.656205421���̽�
				case(205){itemString = `id:40081 `; iCumRate +=23;} //0.656205421�� ����
				case(206){itemString = `id:40081 `; iCumRate +=23;} //0.656205421���� �� ����
				case(207){itemString = `id:40090 `; iCumRate +=23;} //0.656205421���� ����
				case(208){itemString = `id:46001  `; iCumRate +=23;} //0.656205421���� �ǵ�
				case(209){itemString = `id:46006 `; iCumRate +=23;} //0.656205421ī��Ʈ �ǵ�
				case(210){itemString = `id:40172 `; iCumRate +=23;} //0.656205421�׷���Ʈ �ҵ�
				case(211){itemString = `id:40174 `; iCumRate +=23;} //0.656205421��׽�Ÿ
				case(212){itemString = `id:40177  `; iCumRate +=23;} //0.656205421������ �׽�
				case(213){itemString = `id:40180  `; iCumRate +=23;} //0.656205421ȩ���� ��Ŭ
				case(214){itemString = `id:62005 prefix:20405`; iCumRate +=27;} //0.770328103��ģ
				case(215){itemString = `id:62005 prefix:20508`; iCumRate +=27;} //0.770328103������
				case(216){itemString = `id:62005 prefix:20602`; iCumRate +=27;} //0.770328103�߰���
				case(217){itemString = `id:62005 prefix:20615`; iCumRate +=27;} //0.770328103�縷�Ź�
				case(218){itemString = `id:62005 prefix:20619`; iCumRate +=27;} //0.770328103Ư����
				case(219){itemString = `id:62005 prefix:20701`; iCumRate +=27;} //0.770328103�ż�
				case(220){itemString = `id:62005 prefix:21003`; iCumRate +=27;} //0.770328103�ĸ���
				case(221){itemString = `id:62005 suffix:30506`; iCumRate +=27;} //0.770328103�ż���
				case(222){itemString = `id:62005 suffix:30614`; iCumRate +=27;} //0.770328103�����
				case(223){itemString = `id:62005 suffix:30616`; iCumRate +=27;} //0.770328103������
				case(224){itemString = `id:62005 suffix:30617`; iCumRate +=27;} //0.770328103������
				case(225){itemString = `id:62005 suffix:30618`; iCumRate +=27;} //0.770328103������
				case(226){itemString = `id:62005 suffix:30704`; iCumRate +=27;} //0.770328103���鸮
				case(227){itemString = `id:62005 suffix:30801`; iCumRate +=27;} //0.770328103������
				case(228){itemString = `id:91034 `; iCumRate +=85;} //2.42510699����ġ ���� ����
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