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
	 if(GetLocale().LowerCase()== `china`
		|| GetLocale().LowerCase()== `taiwan`)
	{
		// �߱��� ���
		// �߱� �������� ĳ�ð������� ���� �������� ���ÿ� �ش�.

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
							itemString = `id:63026 count:10`;
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

		// ���� ������
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(5730);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:15234`; iCumRate += 1;} //0.0174520070 5730������Ʈ ��� ��Ʈ
					case(1){itemString = `id:15233`; iCumRate += 1;} //0.0174520070 5730������Ʈ ��� �巹��
					case(2){itemString = `id:15235`; iCumRate += 1;} //0.0174520070 5730������Ʈ ��� �巹��
					case(3){itemString = `id:15184 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730�׶� ���̼�Ʈ ���� ����
					case(4){itemString = `id:15112 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730������ �����̷�
					case(5){itemString = `id:15065 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���� ����Ʈ ��ĿƮ
					case(6){itemString = `id:15113 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730������ �˻��б� ���� ��ƮŸ��
					case(7){itemString = `id:15114 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730������ �˻��б� ���� ��Ÿ��
					case(8){itemString = `id:15135 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730��ũ ��Ʈ
					case(9){itemString = `id:15137 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730������ ���� ��Ŷ ��Ʈ
					case(10){itemString = `id:15131 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730�� �������� ��ĿƮ
					case(11){itemString = `id:15132 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���߷� ����Ʈ ����
					case(12){itemString = `id:19007 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730�߱� ���÷� �κ�
					case(13){itemString = `id:15151 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(14){itemString = `id:15152 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(15){itemString = `id:15153 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���� �������� ��Ʈ(������)
					case(16){itemString = `id:15154 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730���� �������� ��Ʈ(������)
					case(17){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730�̵�ī�� ������ ����(������)
					case(18){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730�̵�ī�� ������ ����(������)
					case(19){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730���� ������ �Ǻ�(������)
					case(20){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730���� ������ �Ǻ�(������)
					case(21){itemString = `id:80000`; iCumRate += 5;} //0.0872600349 5730������ ���� ��
					case(22){itemString = `id:80001`; iCumRate += 5;} //0.0872600349 5730����� ��
					case(23){itemString = `id:80002`; iCumRate += 5;} //0.0872600349 5730��ũ�� ��Ʈ
					case(24){itemString = `id:80003`; iCumRate += 5;} //0.0872600349 5730������ ��Ʈ
					case(25){itemString = `id:80004`; iCumRate += 5;} //0.0872600349 5730������ ����� �� ��
					case(26){itemString = `id:80005`; iCumRate += 5;} //0.0872600349 5730������ �Ͼ�� �� ��
					case(27){itemString = `id:80006`; iCumRate += 5;} //0.0872600349 5730������ ��ũ�� �� ��
					case(28){itemString = `id:15184 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730�׶� ���̼�Ʈ ���� ����
					case(29){itemString = `id:15112 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730������ �����̷�
					case(30){itemString = `id:15065 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���� ����Ʈ ��ĿƮ
					case(31){itemString = `id:15113 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730������ �˻��б� ���� ��ƮŸ��
					case(32){itemString = `id:15114 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730������ �˻��б� ���� ��Ÿ��
					case(33){itemString = `id:15135 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730��ũ ��Ʈ
					case(34){itemString = `id:15137 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730������ ���� ��Ŷ ��Ʈ
					case(35){itemString = `id:15131 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730�� �������� ��ĿƮ
					case(36){itemString = `id:15132 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���߷� ����Ʈ ����
					case(37){itemString = `id:19007 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730�߱� ���÷� �κ�
					case(38){itemString = `id:15151 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(39){itemString = `id:15152 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(40){itemString = `id:15153 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���� �������� ��Ʈ(������)
					case(41){itemString = `id:15154 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���� �������� ��Ʈ(������)
					case(42){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730�̵�ī�� ������ ����(������)
					case(43){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730�̵�ī�� ������ ����(������)
					case(44){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���� ������ �Ǻ�(������)
					case(45){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730���� ������ �Ǻ�(������)
					case(46){itemString = `id:15184 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730�׶� ���̼�Ʈ ���� ����
					case(47){itemString = `id:15112 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730������ �����̷�
					case(48){itemString = `id:15065 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���� ����Ʈ ��ĿƮ
					case(49){itemString = `id:15113 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730������ �˻��б� ���� ��ƮŸ��
					case(50){itemString = `id:15114 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730������ �˻��б� ���� ��Ÿ��
					case(51){itemString = `id:15135 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730��ũ ��Ʈ
					case(52){itemString = `id:15137 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730������ ���� ��Ŷ ��Ʈ
					case(53){itemString = `id:15131 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730�� �������� ��ĿƮ
					case(54){itemString = `id:15132 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���߷� ����Ʈ ����
					case(55){itemString = `id:19007 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730�߱� ���÷� �κ�
					case(56){itemString = `id:15151 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(57){itemString = `id:15152 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(58){itemString = `id:15153 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���� �������� ��Ʈ(������)
					case(59){itemString = `id:15154 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���� �������� ��Ʈ(������)
					case(60){itemString = `id:15155 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730�̵�ī�� ������ ����(������)
					case(61){itemString = `id:15156 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730�̵�ī�� ������ ����(������)
					case(62){itemString = `id:15157 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���� ������ �Ǻ�(������)
					case(63){itemString = `id:15158 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730���� ������ �Ǻ�(������)
					case(64){itemString = `id:40031`; iCumRate += 30;} //0.5235602094 5730����
					case(65){itemString = `id:40081`; iCumRate += 30;} //0.5235602094 5730�� ����
					case(66){itemString = `id:40031`; iCumRate += 30;} //0.5235602094 5730����
					case(67){itemString = `id:40014`; iCumRate += 30;} //0.5235602094 5730������ ����
					case(68){itemString = `id:46006`; iCumRate += 30;} //0.5235602094 5730ī��Ʈ �ǵ�
					case(69){itemString = `id:40011`; iCumRate += 30;} //0.5235602094 5730��ε� �ҵ�
					case(70){itemString = `id:46001       `; iCumRate += 30;} //0.5235602094 5730���� �ǵ�
					case(71){itemString = `id:14013`; iCumRate += 30;} //0.5235602094 5730�θ�ī
					case(72){itemString = `id:14019`; iCumRate += 30;} //0.5235602094 5730�׷��̽� �÷���Ʈ �Ƹ�
					case(73){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730�߱� ���÷� �κ�
					case(74){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730�߱� ���÷� �κ�
					case(75){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730�߱� ���÷� �κ�
					case(76){itemString = `id:15135`; iCumRate += 30;} //0.5235602094 5730��ũ ��Ʈ
					case(77){itemString = `id:40015`; iCumRate += 30;} //0.5235602094 5730�÷�Ʈ �� �ҵ�
					case(78){itemString = `id:17071`; iCumRate += 30;} //0.5235602094 5730������ ����
					case(79){itemString = `id:15153`; iCumRate += 30;} //0.5235602094 5730���� �������� ��Ʈ(������)
					case(80){itemString = `id:13047`; iCumRate += 30;} //0.5235602094 5730Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(81){itemString = `id:17041`; iCumRate += 30;} //0.5235602094 5730�������� ���ú���
					case(82){itemString = `id:46008`; iCumRate += 30;} //0.5235602094 5730����Ʈ ���׷� ī��Ʈ �ǵ�
					case(83){itemString = `id:15055`; iCumRate += 30;} //0.5235602094 5730���� �̴� ���ǽ�
					case(84){itemString = `id:46006`; iCumRate += 30;} //0.5235602094 5730ī��Ʈ �ǵ�
					case(85){itemString = `id:15053`; iCumRate += 30;} //0.5235602094 5730�÷�Į�� ���ǽ�
					case(86){itemString = `id:40030`; iCumRate += 30;} //0.5235602094 5730�� �ڵ�� �ҵ�
					case(87){itemString = `id:17045`; iCumRate += 30;} //0.5235602094 5730���� �� ���� ���� ����
					case(88){itemString = `id:14004`; iCumRate += 30;} //0.5235602094 5730Ŭ�ν� ����
					case(89){itemString = `id:17040`; iCumRate += 30;} //0.5235602094 5730���� ��Ʈ�� ����
					case(90){itemString = `id:18516`; iCumRate += 30;} //0.5235602094 5730�̺� ���� ũ���
					case(91){itemString = `id:18521`; iCumRate += 30;} //0.5235602094 5730�����Ǿ� ����
					case(92){itemString = `id:15136`; iCumRate += 30;} //0.5235602094 5730���谡 ��Ʈ
					case(93){itemString = `id:18525`; iCumRate += 30;} //0.5235602094 5730���͵�� ĸ
					case(94){itemString = `id:18511`; iCumRate += 30;} //0.5235602094 5730�÷�Ʈ Ǯ �︧
					case(95){itemString = `id:18506`; iCumRate += 30;} //0.5235602094 5730�� ���� �︧
					case(96){itemString = `id:16505`; iCumRate += 30;} //0.5235602094 5730�÷�Ʈ ��Ʋ��
					case(97){itemString = `id:18502`; iCumRate += 30;} //0.5235602094 5730�� �︧
					case(98){itemString = `id:15014`; iCumRate += 30;} //0.5235602094 5730�Ĺ߲��� ��
					case(99){itemString = `id:18113`; iCumRate += 30;} //0.5235602094 5730������ ����� ����
					case(100){itemString = `id:18114`; iCumRate += 30;} //0.5235602094 5730�ٹ��� ����� ����
					case(101){itemString = `id:18115`; iCumRate += 30;} //0.5235602094 5730�� ����� ����
					case(102){itemString = `id:18112`; iCumRate += 30;} //0.5235602094 5730�� ���� ��ǰ
					case(103){itemString = `id:18111`; iCumRate += 30;} //0.5235602094 5730���� ���� ��ǰ
					case(104){itemString = `id:18110`; iCumRate += 30;} //0.5235602094 5730���� ���� ��ǰ
					case(105){itemString = `id:18109`; iCumRate += 30;} //0.5235602094 5730���� ���� ��ǰ
					case(106){itemString = `id:18108`; iCumRate += 30;} //0.5235602094 5730���� ���� ��ǰ
					case(107){itemString = `id:18029`; iCumRate += 30;} //0.5235602094 5730������ �Ȱ�
					case(108){itemString = `id:18028`; iCumRate += 30;} //0.5235602094 5730���̽� �Ȱ�
					case(109){itemString = `id:40038`; iCumRate += 30;} //0.5235602094 5730����Ʈ�� ����
					case(110){itemString = `id:40039`; iCumRate += 30;} //0.5235602094 5730���̽� ����
					case(111){itemString = `id:40040`; iCumRate += 30;} //0.5235602094 5730���̾� ����
					case(112){itemString = `id:40041`; iCumRate += 30;} //0.5235602094 5730Ÿ�ݿ� ����
					case(113){itemString = `id:40090`; iCumRate += 30;} //0.5235602094 5730���� ����
					case(114){itemString = `id:18542`; iCumRate += 30;} //0.5235602094 5730�� ü�� Ǯ �︧
					case(115){itemString = `id:18543`; iCumRate += 30;} //0.5235602094 5730���� Ǯ �︧
					case(116){itemString = `id:18544`; iCumRate += 30;} //0.5235602094 5730�縮ĭ ��������
					case(117){itemString = `id:18547`; iCumRate += 30;} //0.5235602094 5730�ĳ��� ��� ��������
					case(118){itemString = `id:19020`; iCumRate += 30;} //0.5235602094 5730��Ÿ�� ����� ��Ʈ
					case(119){itemString = `id:16520`; iCumRate += 30;} //0.5235602094 5730�� ���� �۷���
					case(120){itemString = `id:15128`; iCumRate += 30;} //0.5235602094 5730�� �� ���� �巹��
					case(121){itemString = `id:16019`; iCumRate += 30;} //0.5235602094 5730�ٹ��� �ȸ� �尩
					case(122){itemString = `id:18047`; iCumRate += 30;} //0.5235602094 5730�ڷ��� ��Ʈ ����
					case(123){itemString = `id:18008`; iCumRate += 30;} //0.5235602094 5730��Ʈ������ ĸ
					case(124){itemString = `id:16008`; iCumRate += 30;} //0.5235602094 5730�ڷ��� ���� �۷���
					case(125){itemString = `id:15028`; iCumRate += 30;} //0.5235602094 5730�ڷ��� ������Ʈ
					case(126){itemString = `id:17506`; iCumRate += 30;} //0.5235602094 5730�ձ׸��� ����
					case(127){itemString = `id:18026`; iCumRate += 30;} //0.5235602094 5730��� ���θ���
					case(128){itemString = `id:15052`; iCumRate += 30;} //0.5235602094 5730��ũ�� ���� Ʃ��
					case(129){itemString = `id:19005`; iCumRate += 30;} //0.5235602094 5730���÷� �κ�
					case(130){itemString = `id:18040`; iCumRate += 30;} //0.5235602094 5730�ڷ��� ���� ������
					case(131){itemString = `id:18038`; iCumRate += 30;} //0.5235602094 5730���� �跿 ����
					case(132){itemString = `id:15042`; iCumRate += 30;} //0.5235602094 5730�ճ� ���ǽ�
					case(133){itemString = `id:46001`; iCumRate += 30;} //0.5235602094 5730���� �ǵ�
					case(134){itemString = `id:40012`; iCumRate += 30;} //0.5235602094 5730�ٽ�Ÿ�� �ҵ�
					case(135){itemString = `id:2001`; iCumRate += 30;} //0.5235602094 5730��ȭ �ָӴ�
					case(136){itemString = `id:2006`; iCumRate += 30;} //0.5235602094 5730ū ��ȭ �ָӴ�
					case(137){itemString = `id:18010`; iCumRate += 30;} //0.5235602094 5730��� ����Ʈ ĸ
					case(138){itemString = `id:15131`; iCumRate += 30;} //0.5235602094 5730�� �������� ��ĿƮ
					case(139){itemString = `id:40015`; iCumRate += 30;} //0.5235602094 5730�÷�Ʈ �� �ҵ�
					case(140){itemString = `id:17016`; iCumRate += 30;} //0.5235602094 5730�ʵ� �Ĺ��
					case(141){itemString = `id:17015`; iCumRate += 30;} //0.5235602094 5730�Ĺ��
					case(142){itemString = `id:17005`; iCumRate += 30;} //0.5235602094 5730��ɲ� �Ź�
					case(143){itemString = `id:17002`; iCumRate += 30;} //0.5235602094 5730�˻� �Ź�
					case(144){itemString = `id:17022`; iCumRate += 30;} //0.5235602094 5730��������
					case(145){itemString = `id:17001`; iCumRate += 30;} //0.5235602094 5730���� ����
					case(146){itemString = `id:17007`; iCumRate += 30;} //0.5235602094 5730���� ����
					case(147){itemString = `id:16009`; iCumRate += 30;} //0.5235602094 5730��ɲ��尩
					case(148){itemString = `id:80004`; iCumRate += 30;} //0.5235602094 5730L �ε�
					case(149){itemString = `id:15031`; iCumRate += 30;} //0.5235602094 5730�����б� ����
					case(150){itemString = `id:19012`; iCumRate += 30;} //0.5235602094 5730Ʈ��� ���̾�� �κ�
					case(151){itemString = `id:18004`; iCumRate += 30;} //0.5235602094 5730��� �мǸ���
					case(152){itemString = `id:15132`; iCumRate += 30;} //0.5235602094 5730���߷� ����Ʈ ����
					case(153){itemString = `id:15043`; iCumRate += 30;} //0.5235602094 5730����Ƽ ���Ʈ
					case(154){itemString = `id:15033`; iCumRate += 30;} //0.5235602094 5730��� �����ڿ�
					case(155){itemString = `id:40081`; iCumRate += 20;} //0.3490401396 5730���� �� ����
					case(156){itemString = `id:15023`; iCumRate += 20;} //0.3490401396 5730��ũ ��ɲۿ�
					case(157){itemString = `id:40079`; iCumRate += 20;} //0.3490401396 5730���̽�
					case(158){itemString = `id:62005 prefix:20203`; iCumRate += 34;} //0.5933682373 5730��ġ����
					case(159){itemString = `id:62005 prefix:21003`; iCumRate += 34;} //0.5933682373 5730�ĸ���
					case(160){itemString = `id:62005 suffix:30201`; iCumRate += 34;} //0.5933682373 5730������
					case(161){itemString = `id:62005 suffix:30302`; iCumRate += 34;} //0.5933682373 5730�ں�Ʈ
					case(162){itemString = `id:62005 prefix:20201`; iCumRate += 34;} //0.5933682373 5730�ϵ�
					case(163){itemString = `id:62005 suffix:30304`; iCumRate += 34;} //0.5933682373 5730ȸ������
					case(164){itemString = `id:62005 suffix:30702`; iCumRate += 34;} //0.5933682373 5730���̺�
					case(165){itemString = `id:62005 suffix:30704`; iCumRate += 34;} //0.5933682373 5730���鸮
					case(166){itemString = `id:62005 suffix:30801`; iCumRate += 34;} //0.5933682373 5730������
					case(167){itemString = `id:62005 suffix:30802`; iCumRate += 34;} //0.5933682373 5730ī����
					case(168){itemString = `id:62005 suffix:30803`; iCumRate += 34;} //0.5933682373 5730�����
					case(169){itemString = `id:62005 suffix:30804`; iCumRate += 34;} //0.5933682373 5730���Ž�
					case(170){itemString = `id:62005 prefix:20405`; iCumRate += 34;} //0.5933682373 5730��ģ
					case(171){itemString = `id:62005 prefix:20501`; iCumRate += 34;} //0.5933682373 5730������
					case(172){itemString = `id:62005 prefix:20602`; iCumRate += 34;} //0.5933682373 5730�߰���
					case(173){itemString = `id:62005 prefix:20701`; iCumRate += 34;} //0.5933682373 5730�ż�
					case(174){itemString = `id:62005 suffix:30506`; iCumRate += 34;} //0.5933682373 5730�ż���
					case(175){itemString = `id:62005 suffix:30614`; iCumRate += 34;} //0.5933682373 5730�����
					case(176){itemString = `id:62005 prefix:20108`; iCumRate += 34;} //0.5933682373 5730Ű��
					case(177){itemString = `id:62005 prefix:20304`; iCumRate += 34;} //0.5933682373 5730Ÿ��
					case(178){itemString = `id:62005 prefix:20505`; iCumRate += 34;} //0.5933682373 5730���ڵ�
					case(179){itemString = `id:62005 prefix:20209`; iCumRate += 34;} //0.5933682373 5730������
					case(180){itemString = `id:62005 prefix:20409`; iCumRate += 34;} //0.5933682373 5730�縷����
					case(181){itemString = `id:62005 prefix:20615`; iCumRate += 34;} //0.5933682373 5730�縷�Ź�
					case(182){itemString = `id:62005 prefix:20508`; iCumRate += 34;} //0.5933682373 5730������
					case(183){itemString = `id:62005 prefix:20618`; iCumRate += 34;} //0.5933682373 5730�����̴�
					case(184){itemString = `id:62005 prefix:20718`; iCumRate += 34;} //0.5933682373 5730�̻���
					case(185){itemString = `id:62005 prefix:20212`; iCumRate += 34;} //0.5933682373 5730������
					case(186){itemString = `id:62005 prefix:20412`; iCumRate += 34;} //0.5933682373 5730����
					case(187){itemString = `id:62005 prefix:20619`; iCumRate += 34;} //0.5933682373 5730Ư����
					case(188){itemString = `id:62005 suffix:30616`; iCumRate += 34;} //0.5933682373 5730������
					case(189){itemString = `id:62005 suffix:30617`; iCumRate += 34;} //0.5933682373 5730������
					case(190){itemString = `id:62005 suffix:30618`; iCumRate += 34;} //0.5933682373 5730������
					case(191){itemString = `id:62005 suffix: 30726`; iCumRate += 34;} //0.5933682373 5730�ϸ��
					case(192){itemString = `id:62005 suffix: 30629`; iCumRate += 34;} //0.5933682373 5730��ε�
					case(193){itemString = `id:62005 suffix: 30727`; iCumRate += 34;} //0.5933682373 5730�ұ�
					case(194){itemString = `id:62005 suffix: 30630`; iCumRate += 34;} //0.5933682373 5730����
					case(195){itemString = `id:91034`; iCumRate += 90;} //1.5706806283 5730����ġ ���� ����
					case(196){itemString = `id:51003 count:10`; iCumRate += 30;} //0.5235602094 5730����� 50 ����
					case(197){itemString = `id:51004 count:10`; iCumRate += 30;} //0.5235602094 5730����� 100 ����
					case(198){itemString = `id:51007 count:10`; iCumRate += 30;} //0.5235602094 5730���� 30 ����
					case(199){itemString = `id:51008 count:10`; iCumRate += 30;} //0.5235602094 5730���� 50 ����
					case(200){itemString = `id:51013 count:10`; iCumRate += 30;} //0.5235602094 5730���¹̳� 50 ����
					case(201){itemString = `id:51014 count:10`; iCumRate += 30;} //0.5235602094 5730���¹̳� 100 ����
					case(202){itemString = `id:51001 count:10`; iCumRate += 30;} //0.5235602094 5730����� 10 ����
					case(203){itemString = `id:51002 count:10`; iCumRate += 30;} //0.5235602094 5730����� 30 ����
					case(204){itemString = `id:51022 count:10`; iCumRate += 30;} //0.5235602094 5730����°� ���� 30 ����
					case(205){itemString = `id:51027 count:10`; iCumRate += 30;} //0.5235602094 5730����°� ���¹̳� 30 ����
					case(206){itemString = `id:51028 count:10`; iCumRate += 30;} //0.5235602094 5730����°� ���¹̳� 50 ����
					case(207){itemString = `id:51029 count:10`; iCumRate += 30;} //0.5235602094 5730����°� ���¹̳� 100 ����
					case(208){itemString = `id:63000 count:10`; iCumRate += 30;} //0.5235602094 5730�Ǵн��� ����
					case(209){itemString = `id:60037 count:5`; iCumRate += 30;} //0.5235602094 5730�� ���� ����
					case(210){itemString = `id:60038 count:5`; iCumRate += 30;} //0.5235602094 5730���� ����
					case(211){itemString = `id:62004 count:5`; iCumRate += 30;} //0.5235602094 5730��������
					case(212){itemString = `id:50163 quality:100`; iCumRate += 30;} //0.5235602094 5730�ǽ� �� Ĩ��
					case(213){itemString = `id:50164 quality:100`; iCumRate += 30;} //0.5235602094 5730T�� ������ũ
					case(214){itemString = `id:50165 quality:100`; iCumRate += 30;} //0.5235602094 5730ġ�� �׶���
					case(215){itemString = `id:50166 quality:100`; iCumRate += 30;} //0.5235602094 5730ī�� ���̽�
					case(216){itemString = `id:50167 quality:100`; iCumRate += 30;} //0.5235602094 5730�� �� ��
					case(217){itemString = `id:50168 quality:100`; iCumRate += 30;} //0.5235602094 5730�۾���
					case(218){itemString = `id:50169 quality:100`; iCumRate += 30;} //0.5235602094 5730�ξ� ����
					case(219){itemString = `id:50170 quality:100`; iCumRate += 30;} //0.5235602094 5730ġ�� ����
					case(220){itemString = `id:50171 quality:100`; iCumRate += 30;} //0.5235602094 5730�̸� ���ϻ� ����
					case(221){itemString = `id:50172 quality:100`; iCumRate += 30;} //0.5235602094 5730����ġ�� ����
					case(222){itemString = `id:50173 quality:100`; iCumRate += 30;} //0.5235602094 5730���� �� ���ݶ�
					case(223){itemString = `id:50174 quality:100`; iCumRate += 30;} //0.5235602094 5730ũ��ũ ����
					case(224){itemString = `id:50175 quality:100`; iCumRate += 30;} //0.5235602094 5730�����
					case(225){itemString = `id:50176 quality:100`; iCumRate += 30;} //0.5235602094 5730���� ��Ŷ
					case(226){itemString = `id:50177 quality:100`; iCumRate += 30;} //0.5235602094 5730����Ĩ ��Ű
					case(227){itemString = `id:50178 quality:100`; iCumRate += 30;} //0.5235602094 5730������ �ֽ�
					case(228){itemString = `id:50179 quality:100`; iCumRate += 30;} //0.5235602094 5730���� �ֽ�
					case(229){itemString = `id:50180 quality:100`; iCumRate += 30;} //0.5235602094 5730���ݸ� ����
					case(230){itemString = `id:50181 quality:100`; iCumRate += 30;} //0.5235602094 5730���λ� ��
					case(231){itemString = `id:50182 quality:100`; iCumRate += 30;} //0.5235602094 5730�긮��� ����Ű
					case(232){itemString = `id:50199 quality:100`; iCumRate += 30;} //0.5235602094 5730��ũ�� ����̹�
					case(233){itemString = `id:50200 quality:100`; iCumRate += 30;} //0.5235602094 5730���� ����
					case(234){itemString = `id:50201 quality:100`; iCumRate += 30;} //0.5235602094 5730BnR
					case(235){itemString = `id:50202 quality:100`; iCumRate += 30;} //0.5235602094 5730Ű�� �� �� ����
					case(236){itemString = `id:50203 quality:100`; iCumRate += 30;} //0.5235602094 5730���� ��������
					case(237){itemString = `id:50183 quality:100`; iCumRate += 30;} //0.5235602094 5730����Ͻ� �����
					case(238){itemString = `id:50123 quality:100`; iCumRate += 30;} //0.5235602094 5730����������
					case(239){itemString = `id:50124 quality:100`; iCumRate += 30;} //0.5235602094 5730���� ������ũ
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

		// ���� �������� ���޾Ҵ�.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		}
	}	
}
