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
		if (iRandom < 11)
		{
			player.DoStript(`additemex(id:85048 quality:99 appraise_explore_exp:9000 rewardview:true)`);
		}
		else if (iRandom < 22)
		{
			player.DoStript(`additemex(id:85049 quality:99 appraise_explore_exp:11000 rewardview:true)`);
		}
		else if (iRandom <33)
		{
			player.DoStript(`additemex(id:85050 quality:99 appraise_explore_exp:13000 rewardview:true)`);
		}
		bLivingGachaphonGived2 = true;
	}
		// �Ƹ� ������
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(27742);	//Ȯ���� ������ ���´�
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15568 col1:000000 col2:000000 col3:000000`; iCumRate += 2;} //0.007209286�� ��ť������ ��
				case(1){itemString = `id:15569 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 2;} //0.007209286���� ��ť������ ��
				case(2){itemString = `id:18293 col1:000000 col2:000000 col3:000000`; iCumRate += 9;} //0.032441785�� ��ť���� ����
				case(3){itemString = `id:18294 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 9;} //0.032441785���� ��ť���� ����
				case(4){itemString = `id:17216 col1:000000 col2:000000 col3:000000`; iCumRate += 3;} //0.010813928�� ��ť������ ����
				case(5){itemString = `id:17217 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 3;} //0.010813928���� ��ť������ ����
				case(6){itemString = `id:15486 col1:FF90FF`; iCumRate += 3;} //0.010813928��ť���� ������ ��
				case(7){itemString = `id:18300 col1:FF90FF`; iCumRate += 9;} //0.032441785��ť���� ������ ����
				case(8){itemString = `id:17222 col1:FF90FF`; iCumRate += 3;} //0.010813928��ť���� ������ ����
				case(9){itemString = `id:16067 col1:FF90FF`; iCumRate += 9;} //0.032441785��ť���� ������ �尩
				case(10){itemString = `id:15550 `; iCumRate += 10;} //0.036046428������ �ǻ�
				case(11){itemString = `id:18316 `; iCumRate += 10;} //0.036046428������ ��
				case(12){itemString = `id:17552 `; iCumRate += 10;} //0.036046428�������� ����
				case(13){itemString = `id:40171  `; iCumRate += 40;} //0.144185711���繫��
				case(14){itemString = `id:40193  `; iCumRate += 40;} //0.144185711���󸶻�
				case(15){itemString = `id:40195  `; iCumRate += 40;} //0.144185711��ù���
				case(16){itemString = `id:40170  `; iCumRate += 40;} //0.144185711�嵵
				case(17){itemString = `id:40192  `; iCumRate += 40;} //0.144185711ġ�� �� Į
				case(18){itemString = `id:40194  `; iCumRate += 40;} //0.144185711ȣ�ſ� �ܵ�
				case(19){itemString = `id:15602 `; iCumRate += 40;} //0.144185711���̸�� �ǻ�
				case(20){itemString = `id:19084 `; iCumRate += 40;} //0.144185711���� �κ�
				case(21){itemString = `id:15601 `; iCumRate += 40;} //0.144185711���� �ǻ�
				case(22){itemString = `id:46021 `; iCumRate += 500;} //1.80232139���� ����
				case(23){itemString = `id:19125 `; iCumRate += 500;} //1.80232139����Ĺ ����� ����
				case(24){itemString = `id:18178 `; iCumRate += 500;} //1.80232139����Ĺ �͸���
				case(25){itemString = `id:17237 `; iCumRate += 500;} //1.80232139���� �Ź�
				case(26){itemString = `id:17236 `; iCumRate += 500;} //1.80232139���̸�� �Ź�
				case(27){itemString = `id:17235 `; iCumRate += 500;} //1.80232139���� �Ź�
				case(28){itemString = `id:14045 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(29){itemString = `id:14046 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(30){itemString = `id:14127 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(31){itemString = `id:14128 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(32){itemString = `id:14129 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(33){itemString = `id:14130 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(34){itemString = `id:46024 `; iCumRate += 500;} //1.80232139������ �ǵ�
				case(35){itemString = `id:46011 `; iCumRate += 500;} //1.80232139�Ͱ� ����
				case(36){itemString = `id:46012`; iCumRate += 500;} //1.80232139û�� ����
				case(37){itemString = `id:14023  `; iCumRate += 500;} //1.80232139�� �ؾ� �Ƹ�(������)
				case(38){itemString = `id:14024  `; iCumRate += 500;} //1.80232139�� �ؾ� �Ƹ�(������)
				case(39){itemString = `id:18556 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(40){itemString = `id:18558 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(41){itemString = `id:16540 `; iCumRate += 500;} //1.80232139�Ҷ� ��Ʋ��
				case(42){itemString = `id:17127 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(43){itemString = `id:17129 `; iCumRate += 500;} //1.80232139�Ҷ� ����(������)
				case(44){itemString = `id:18653 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(45){itemString = `id:18654 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(46){itemString = `id:18655 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(47){itemString = `id:18656 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(48){itemString = `id:16138 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� �۷��� (������)
				case(49){itemString = `id:16139 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� �۷��� (������)
				case(50){itemString = `id:16140 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� �۷��� (���̾�Ʈ ������)
				case(51){itemString = `id:16141 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� �۷��� (���̾�Ʈ ������)
				case(52){itemString = `id:17208 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(53){itemString = `id:17209 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (������)
				case(54){itemString = `id:17210 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(55){itemString = `id:17211 `; iCumRate += 500;} //1.80232139Ÿ�� ���� ���� ���� (���̾�Ʈ ������)
				case(56){itemString = `id:63218 `; iCumRate += 500;} //1.802321395�ֳ� ��� ����(�ѱ�)
				case(57){itemString = `id:50389 `; iCumRate += 500;} //1.802321393�ֳ� ��� ����ũ
				case(58){itemString = `id:63095 `; iCumRate += 500;} //1.802321393�ֳ� ��� �Ҳɳ��� ŰƮ
				case(59){itemString = `id:18105 `; iCumRate += 800;} //2.8837142241�ֳ� ��� �� ��� �̴� ����
				case(60){itemString = `id:19045 `; iCumRate += 800;} //2.883714224��̳� ��� �κ�(������)
				case(61){itemString = `id:19046 `; iCumRate += 800;} //2.883714224��̳� ��� �κ�(������)
				case(62){itemString = `id:18561 `; iCumRate += 800;} //2.8837142243�ֳ� ��� ��� ����
				case(63){itemString = `id:15440 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(�ΰ� ��)
				case(64){itemString = `id:15441 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(�ΰ���)
				case(65){itemString = `id:15442 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(���̾�Ʈ ��)
				case(66){itemString = `id:15443 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(���̾�Ʈ ��)
				case(67){itemString = `id:17195 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(����)
				case(68){itemString = `id:17196 `; iCumRate += 800;} //2.8837142244�ֳ� �����̾� �������(����)
				case(69){itemString = `id:19052 `; iCumRate += 800;} //2.8837142244�ֳ� ��� �κ�(�ѱ�)
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