////////////////////////////////////////////////////////////////////////////////
server string TreasureDropItem(
	character player,
	int itemClassId)
// : ������ ����ϰ� �� ������ ���.
////////////////////////////////////////////////////////////////////////////////
{
	int itemID = itemClassId;

	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(158);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:13060`; iCumRate +=1;} //0.6329% �巡�� ������ �Ƹ�(������)
					case(1){itemString = `id:13061`; iCumRate +=1;} //0.6329% �巡�� ������ �Ƹ� (������)
					case(2){itemString = `id:13062`; iCumRate +=1;} //0.6329% �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(3){itemString = `id:13063`; iCumRate +=1;} //0.6329% �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(4){itemString = `id:16543`; iCumRate +=1;} //0.6329% �巡�� ������ ��Ʋ��
					case(5){itemString = `id:16544`; iCumRate +=1;} //0.6329% �巡�� ������ ��Ʋ��(���̾�Ʈ��)
					case(6){itemString = `id:17530`; iCumRate +=1;} //0.6329% �巡�� ������ �׸���
					case(7){itemString = `id:18577`; iCumRate +=1;} //0.6329% �巡�� ������ �︧
					case(8){itemString = `id:14011`; iCumRate +=1;} //0.6329% ������� �������� (������)
					case(9){itemString = `id:14005`; iCumRate +=1;} //0.6329% ������� �������� (������)
					case(10){itemString = `id:15352`; iCumRate +=1;} //0.6329% õ������ (������)
					case(11){itemString = `id:15353`; iCumRate +=1;} //0.6329% õ������ (������)
					case(12){itemString = `id:17139`; iCumRate +=1;} //0.6329% õ����ȭ
					case(13){itemString = `id:14040`; iCumRate +=1;} //0.6329%@���̳� �巡�� �Ƹӿ���
					case(14){itemString = `id:14041`; iCumRate +=1;} //0.6329%@���̳� �巡�� �Ƹ����̾�Ʈ
					case(15){itemString = `id:14039`; iCumRate +=1;} //0.6329%@���̳� �巡�� �Ƹ��ΰ�
					case(16){itemString = `id:18553`; iCumRate +=1;} //0.6329%@���̳� �巡�� �︧(��������)����
					case(17){itemString = `id:18552`; iCumRate +=1;} //0.6329%@���̳� �巡�� �︧�ΰ�, ���̾�Ʈ
					case(18){itemString = `id:17095`; iCumRate +=1;} //0.6329%@���̳� �巡�� ����������
					case(19){itemString = `id:16533`; iCumRate +=1;} //0.6329%@���̳� �巡�� ��Ʋ������
					case(20){itemString = `id:16535`; iCumRate +=1;} //0.6329%@���̳� �巡�� ��Ʋ�����̾�Ʈ
					case(21){itemString = `id:16532`; iCumRate +=1;} //0.6329%@���̳� �巡�� ��Ʋ���ΰ�
					case(22){itemString = `id:15267`; iCumRate +=2;} //1.2658%�׶� ��� Ǯ �巹��
					case(23){itemString = `id:15362`; iCumRate +=2;} //1.2658%�׶� ��� ��ũ ��Ʈ
					case(24){itemString = `id:15405`; iCumRate +=2;} //1.2658%�����׵� �мŴϽ�Ÿ �巹��
					case(25){itemString = `id:17039`; iCumRate +=2;} //1.2658%�ڷ��� ťƮ ���� ����
					case(26){itemString = `id:13050`; iCumRate +=2;} //1.2658%Ŭ��콺 ����Ʈ �Ƹ�
					case(27){itemString = `id:16551`; iCumRate +=2;} //1.2658%Ŭ��콺 ����Ʈ ��Ʋ��
					case(28){itemString = `id:17534`; iCumRate +=2;} //1.2658%Ŭ��콺 ����Ʈ ����
					case(29){itemString = `id:46010`; iCumRate +=2;} //1.2658% @�巡�� �ǵ�
					case(30){itemString = `id:15373`; iCumRate +=5;} //3.1646%�ý��� Ĭ���� �巹��
					case(31){itemString = `id:18218`; iCumRate +=5;} //3.1646%��Ƽ�� �ֵ�̷� ����(������)
					case(32){itemString = `id:18219`; iCumRate +=5;} //3.1646%��Ƽ�� �ֵ�̷� ����(������)
					case(33){itemString = `id:17141`; iCumRate +=5;} //3.1646%���̸� ����Ŀ ����
					case(34){itemString = `id:17154`; iCumRate +=5;} //3.1646%������ ���� �ڵ� ����
					case(35){itemString = `id:18038`; iCumRate +=5;} //3.1646%���� �跿 ����
					case(36){itemString = `id:15184`; iCumRate +=10;} //6.3291%�׶� ���̼�Ʈ ���� ����
					case(37){itemString = `id:15066`; iCumRate +=10;} //6.3291%���̽� ����Ʈ ����
					case(38){itemString = `id:15099`; iCumRate +=10;} //6.3291%���ī ��ο��� ���̾�� ��ĿƮ
					case(39){itemString = `id:19038`; iCumRate +=10;} //6.3291%��� Ĺ �κ�
					case(40){itemString = `id:17120`; iCumRate +=10;} //6.3291%����Ÿ �÷� ��Ŭ ����
					case(41){itemString = `id:16136`; iCumRate +=10;} //6.3291%���̾� �Ƕ�̵� ���
					case(42){itemString = `id:15374`; iCumRate +=10;} //6.3291%���̴� ��� ���� �巹��
					case(43){itemString = `id:15136`; iCumRate +=10;} //6.3291%��� ���̽� ��ĿƮ
					case(44){itemString = `id:14032`; iCumRate +=10;} //6.3291%��Ƽġ �� �κ� �Ƹ�
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(948);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.105485232�ڷ��� �̽��͸� �ν��� (UFO)
					case(1){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�ĳ� �ɾ� ���� ����
					case(2){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ���̽� ����
					case(3){itemString = `id:40250 `; iCumRate +=1;} //0.105485232������ ���̾� ����
					case(4){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ����Ʈ�� ����
					case(5){itemString = `id:40250 `; iCumRate +=1;} //0.105485232Į�Ǵ��� ���� ����
					case(6){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�ĸ� ���̽� ����
					case(7){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ���̾� ����
					case(8){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�̹̼� ����Ʈ�� ����
					case(9){itemString = `id:18569 `; iCumRate +=1;} //0.105485232devCAT ����
					case(10){itemString = `id:40171 `; iCumRate +=1;} //0.105485232���繫��
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �Ƹ�
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ ��극�̽�
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �׸���
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(���̾�Ʈ)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.105485232����(������)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.105485232������ ������ ����
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.105485232������ ������ ����
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �Ƹ�
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ ��극�̽�
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �׸���
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(���̾�Ʈ��)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.105485232��ó���� �������
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.105485232������ �� ���� ��ĿƮ
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.105485232�׷��̽� �� �巹��(������)
					case(33){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��ä
					case(34){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��īŸ ��
					case(35){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ÿī ��
					case(36){itemString = `id:16046 `; iCumRate +=1;} //0.105485232����� �� �尩
					case(37){itemString = `id:18187 `; iCumRate +=1;} //0.105485232Ŀ�ٶ� ����
					case(38){itemString = `id:18188 `; iCumRate +=1;} //0.105485232�ȴ�
					case(39){itemString = `id:18189 `; iCumRate +=1;} //0.105485232ī�캸�� ����
					case(40){itemString = `id:15252 `; iCumRate +=1;} //0.105485232���� �ǻ�
					case(41){itemString = `id:19005 `; iCumRate +=1;} //0.105485232���÷� �κ�
					case(42){itemString = `id:18161 `; iCumRate +=1;} //0.105485232����Ĺ �͸���
					case(43){itemString = `id:18157 `; iCumRate +=1;} //0.105485232����� �� �Ӹ���
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.105485232���� �� ����
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232�۶��콺
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.105485232����Ʈ�� ����
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232���̽�
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�巡�� ���̵�
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232Ŭ���̸��
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���� �� ����
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���� ����
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�۶��콺
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����Ʈ�� ����
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̽� ����
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̾� ����
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232Ÿ�ݿ� ����
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����Ͻ�
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̽�
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�� �ڵ�� �ҵ�
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�� ����
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���׷� ī��Ʈ �ǵ�
					case(64){itemString = `id:15267 `; iCumRate +=1;} //0.105485232�׶� ��� Ǯ �巹��
					case(65){itemString = `id:15268 `; iCumRate +=1;} //0.105485232�׶� ��� ��ũ ��Ʈ
					case(66){itemString = `id:19005 `; iCumRate +=1;} //0.105485232���÷� �κ�
					case(67){itemString = `id:15217 `; iCumRate +=1;} //0.105485232�������� ���ǽ�
					case(68){itemString = `id:18161 `; iCumRate +=1;} //0.105485232����Ĺ �͸���
					case(69){itemString = `id:18157 `; iCumRate +=1;} //0.105485232����� �� �Ӹ���
					case(70){itemString = `id:15233 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(71){itemString = `id:15234 `; iCumRate +=1;} //0.105485232������Ʈ ��� ��Ʈ
					case(72){itemString = `id:15235 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(73){itemString = `id:15233 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(74){itemString = `id:15234 `; iCumRate +=1;} //0.105485232������Ʈ ��� ��Ʈ
					case(75){itemString = `id:15235 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232�巡�� ���̵�
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232Ŭ���̸��
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���� ����
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���̽� ����
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���̾� ����
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232Ÿ�ݿ� ����
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.105485232����Ͻ�
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232����
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232�� �ڵ�� �ҵ�
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232�� ����
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.105485232����� ����
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.105485232���׷� ī��Ʈ �ǵ�
					case(88){itemString = `id:14039 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(�ΰ�)
					case(89){itemString = `id:14040 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(����)
					case(90){itemString = `id:14041 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(���̾�Ʈ)
					case(91){itemString = `id:16532 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(�ΰ�/���̾�Ʈ)
					case(92){itemString = `id:16535 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(���̾�Ʈ)
					case(93){itemString = `id:16533 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(����)
					case(94){itemString = `id:17095 `; iCumRate +=1;} //0.105485232���̳� �巡�� ����
					case(95){itemString = `id:18552 `; iCumRate +=1;} //0.105485232���̳� �巡�� �︧
					case(96){itemString = `id:40170 `; iCumRate +=1;} //0.105485232�Ϻ��� ��հ�
					case(97){itemString = `id:51007 count:10`; iCumRate +=2;} //0.210970464���� 30 ����
					case(98){itemString = `id:51013 count:10`; iCumRate +=2;} //0.210970464���¹̳� 50 ����
					case(99){itemString = `id:51001 count:10`; iCumRate +=2;} //0.210970464����� 10 ����
					case(100){itemString = `id:51002 count:10`; iCumRate +=2;} //0.210970464����� 30 ����
					case(101){itemString = `id:51022 count:10`; iCumRate +=2;} //0.210970464����°� ���� 30 ����
					case(102){itemString = `id:51027 count:10`; iCumRate +=2;} //0.210970464����°� ���¹̳� 30 ����
					case(103){itemString = `id:51028 count:10`; iCumRate +=2;} //0.210970464����°� ���¹̳� 50 ����
					case(104){itemString = `id:63000 count:10`; iCumRate +=2;} //0.210970464�Ǵн��� ����
					case(105){itemString = `id:60037 count:5`; iCumRate +=2;} //0.210970464�� ���� ����
					case(106){itemString = `id:60038 count:5`; iCumRate +=2;} //0.210970464���� ����
					case(107){itemString = `id:50012 count:5`; iCumRate +=2;} //0.210970464Ȳ�� �ް�
					case(108){itemString = `id:50013 count:5`; iCumRate +=2;} //0.210970464Ȳ�� ���
					case(109){itemString = `id:50541 quality:100`; iCumRate +=2;} //0.210970464����������
					case(110){itemString = `id:50542 quality:100`; iCumRate +=2;} //0.210970464���������� �����ƶ� 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=2;} //0.210970464īǪġ��
					case(112){itemString = `id:50544 quality:100`; iCumRate +=2;} //0.210970464�����ƶ�
					case(113){itemString = `id:50545 quality:100`; iCumRate +=2;} //0.210970464ī�� ��ī
					case(114){itemString = `id:50546 quality:100`; iCumRate +=2;} //0.210970464���̽� ī�� ��ī
					case(115){itemString = `id:50547 quality:100`; iCumRate +=2;} //0.210970464���̽� �����ƶ�
					case(116){itemString = `id:50170 quality:100`; iCumRate +=2;} //0.210970464ġ�� ����
					case(117){itemString = `id:50171 quality:100`; iCumRate +=2;} //0.210970464�̸� ���ϻ� ����
					case(118){itemString = `id:50172 quality:100`; iCumRate +=2;} //0.210970464����ġ�� ����
					case(119){itemString = `id:50173 quality:100`; iCumRate +=2;} //0.210970464���� �� ���ݶ�
					case(120){itemString = `id:50174 quality:100`; iCumRate +=2;} //0.210970464ũ��ũ ����
					case(121){itemString = `id:50175 quality:100`; iCumRate +=2;} //0.210970464�����
					case(122){itemString = `id:50176 quality:100`; iCumRate +=2;} //0.210970464���� ��Ŷ
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.316455696������
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.316455696���ڵ�
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.316455696����
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.316455696�ݼ� �ٴ�
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.316455696��糪��
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.316455696�Ѱ���
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=3;} //0.316455696���� ���ڵ�|���� ���ڵ�(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=3;} //0.316455696����Ʈ ����Ʈ|����Ʈ ����Ʈ(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=3;} //0.316455696���� ���ӳ�|���� ���ӳ�(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=3;} //0.316455696������ ��������|������ ��������(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=4;} //0.421940928�巡�� ũ����Ʈ
					case(134){itemString = `id:15113 `; iCumRate +=4;} //0.421940928������ �˻��б� ���� ��ƮŸ��
					case(135){itemString = `id:15114 `; iCumRate +=4;} //0.421940928������ �˻��б� ���� ��Ÿ��
					case(136){itemString = `id:15065 `; iCumRate +=4;} //0.421940928���� ����Ʈ ��ĿƮ
					case(137){itemString = `id:19008 `; iCumRate +=4;} //0.421940928���� �Ǵ� �κ�
					case(138){itemString = `id:15137 `; iCumRate +=4;} //0.421940928������ ���� ��Ŷ ��Ʈ
					case(139){itemString = `id:18041 `; iCumRate +=4;} //0.421940928ū ì ���� ����
					case(140){itemString = `id:19009 `; iCumRate +=4;} //0.421940928���� ���� �κ�
					case(141){itemString = `id:18112 `; iCumRate +=4;} //0.421940928�� ���� ��ǰ
					case(142){itemString = `id:18111 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(143){itemString = `id:18110 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(144){itemString = `id:18109 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(145){itemString = `id:18108 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(146){itemString = `id:40083 `; iCumRate +=4;} //0.421940928�� ĿƲ����
					case(147){itemString = `id:40032 `; iCumRate +=4;} //0.421940928������ �ҵ�
					case(148){itemString = `id:18544 `; iCumRate +=4;} //0.421940928�縮ĭ ��������
					case(149){itemString = `id:18547 `; iCumRate +=4;} //0.421940928�ĳ��� ��� ��������
					case(150){itemString = `id:18521 `; iCumRate +=4;} //0.421940928�����Ǿ� ����
					case(151){itemString = `id:18500 `; iCumRate +=4;} //0.421940928�� ���� �︧
					case(152){itemString = `id:18511 `; iCumRate +=4;} //0.421940928�÷�Ʈ Ǯ �︧
					case(153){itemString = `id:18502 `; iCumRate +=4;} //0.421940928�� �︧
					case(154){itemString = `id:19007 `; iCumRate +=4;} //0.421940928�߱� ���÷� �κ�
					case(155){itemString = `id:19017 `; iCumRate +=4;} //0.421940928���� �κ�
					case(156){itemString = `id:19016 `; iCumRate +=4;} //0.421940928�� �κ�
					case(157){itemString = `id:15112 `; iCumRate +=4;} //0.421940928������ �����̷�
					case(158){itemString = `id:18034 `; iCumRate +=4;} //0.421940928���� ������
					case(159){itemString = `id:18006 `; iCumRate +=4;} //0.421940928���������
					case(160){itemString = `id:18113 `; iCumRate +=4;} //0.421940928������ ����� ����
					case(161){itemString = `id:18114 `; iCumRate +=4;} //0.421940928�ٹ��� ����� ����
					case(162){itemString = `id:18115 `; iCumRate +=4;} //0.421940928�� ����� ����
					case(163){itemString = `id:18097 `; iCumRate +=4;} //0.421940928���̷� ���� ����
					case(164){itemString = `id:18098 `; iCumRate +=4;} //0.421940928���̷��� �Ȱ�
					case(165){itemString = `id:18099 `; iCumRate +=4;} //0.421940928���̷� ���� ���� ����
					case(166){itemString = `id:18100 `; iCumRate +=4;} //0.421940928���̷� ���� ����
					case(167){itemString = `id:18101`; iCumRate +=4;} //0.421940928���̷� ���� ���� ����
					case(168){itemString = `id:18102 `; iCumRate +=4;} //0.421940928���̷��� ����
					case(169){itemString = `id:15055 `; iCumRate +=4;} //0.421940928���̷� ����� ����
					case(170){itemString = `id:18044 `; iCumRate +=4;} //0.421940928���˿� ����
					case(171){itemString = `id:40071 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(172){itemString = `id:40072 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(173){itemString = `id:40073 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(174){itemString = `id:40074 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(175){itemString = `id:40075 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(176){itemString = `id:40076 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(177){itemString = `id:40077 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(178){itemString = `id:16517 `; iCumRate +=4;} //0.421940928�ݴ� �尩
					case(179){itemString = `id:16516 `; iCumRate +=4;} //0.421940928���� �尩
					case(180){itemString = `id:16515 `; iCumRate +=4;} //0.421940928�� �尩
					case(181){itemString = `id:16514 `; iCumRate +=4;} //0.421940928���� �尩
					case(182){itemString = `id:16513 `; iCumRate +=4;} //0.421940928���� �尩
					case(183){itemString = `id:40068 `; iCumRate +=4;} //0.421940928���� ��� ���ú�
					case(184){itemString = `id:40069 `; iCumRate +=4;} //0.421940928���� ��� ���ú�
					case(185){itemString = `id:40070 `; iCumRate +=4;} //0.421940928�� ��� ���ú�
					case(186){itemString = `id:17015 `; iCumRate +=4;} //0.421940928Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=4;} //0.421940928���� �̴� ���ǽ�
					case(188){itemString = `id:15057 `; iCumRate +=4;} //0.421940928�� ���� ��Ʈ (����)
					case(189){itemString = `id:18040 `; iCumRate +=4;} //0.421940928�ڷ��� ���� ������
					case(190){itemString = `id:80000 `; iCumRate +=4;} //0.421940928������ ���� ��
					case(191){itemString = `id:80001 `; iCumRate +=4;} //0.421940928����� ��
					case(192){itemString = `id:80002 `; iCumRate +=4;} //0.421940928��ũ�� ��Ʈ
					case(193){itemString = `id:80003 `; iCumRate +=4;} //0.421940928������ ��Ʈ
					case(194){itemString = `id:80004 `; iCumRate +=4;} //0.421940928������ ����� �� ��
					case(195){itemString = `id:80005 `; iCumRate +=4;} //0.421940928������ �Ͼ�� �� ��
					case(196){itemString = `id:80006 `; iCumRate +=4;} //0.421940928������ ��ũ�� �� ��
					case(197){itemString = `id:18056 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���1
					case(198){itemString = `id:18057 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���2
					case(199){itemString = `id:18058 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���3
					case(200){itemString = `id:18059 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���4
					case(201){itemString = `id:18060 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���5
					case(202){itemString = `id:18061 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���1
					case(203){itemString = `id:18062 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���2
					case(204){itemString = `id:18063 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���3
					case(205){itemString = `id:18064 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���4
					case(206){itemString = `id:18065 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���5
					case(207){itemString = `id:18066 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���1
					case(208){itemString = `id:18067 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���2
					case(209){itemString = `id:18068 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���3
					case(210){itemString = `id:18069 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���4
					case(211){itemString = `id:18070 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���5
					case(212){itemString = `id:14036 `; iCumRate +=4;} //0.421940928Ƽ���� �Ƹ�(������)
					case(213){itemString = `id:14037 `; iCumRate +=4;} //0.421940928Ƽ���� �Ƹ�(������)
					case(214){itemString = `id:16531 `; iCumRate +=4;} //0.421940928Ƽ���� ��Ʋ��
					case(215){itemString = `id:17523 `; iCumRate +=4;} //0.421940928Ƽ���� �׸���
					case(216){itemString = `id:15132 `; iCumRate +=4;} //0.421940928���߷� ����Ʈ ����
					case(217){itemString = `id:15070 `; iCumRate +=4;} //0.421940928���ĵ�Į�� �����긮��
					case(218){itemString = `id:15230 `; iCumRate +=4;} //0.421940928������ �۷� üũ ��ĿƮ
					case(219){itemString = `id:19034 `; iCumRate +=4;} //0.421940928������ Ŭ�ν� ������Ʈ
					case(220){itemString = `id:40033 `; iCumRate +=4;} //0.421940928Ŭ���̸��
					case(221){itemString = `id:40011 `; iCumRate +=4;} //0.421940928��ε� �ҵ�
					case(222){itemString = `id:40030 `; iCumRate +=4;} //0.421940928�� �ڵ�� �ҵ�
					case(223){itemString = `id:40012 `; iCumRate +=4;} //0.421940928�ٽ�Ÿ�� �ҵ�
					case(224){itemString = `id:40007 `; iCumRate +=4;} //0.421940928�Ѽյ���
					case(225){itemString = `id:40014 `; iCumRate +=4;} //0.421940928������ ����
					case(226){itemString = `id:40078 `; iCumRate +=4;} //0.421940928����Ͻ�
					case(227){itemString = `id:40080 `; iCumRate +=4;} //0.421940928�۶��콺
					case(228){itemString = `id:40006 `; iCumRate +=4;} //0.421940928�ܰ�
					case(229){itemString = `id:40031 `; iCumRate +=4;} //0.421940928����
					case(230){itemString = `id:40081 `; iCumRate +=4;} //0.421940928���� �� ����
					case(231){itemString = `id:40079 `; iCumRate +=4;} //0.421940928���̽�
					case(232){itemString = `id:13043 `; iCumRate +=4;} //0.421940928���̴Ͼ� ������ ����(������)
					case(233){itemString = `id:13044 `; iCumRate +=4;} //0.421940928���̴Ͼ� ������ ����(������)
					case(234){itemString = `id:13045 `; iCumRate +=4;} //0.421940928�Ƹ��� �ƽ��� �Ƹ�(������)
					case(235){itemString = `id:13046 `; iCumRate +=4;} //0.421940928�Ƹ��� �ƽ��� �Ƹ�(������)
					case(236){itemString = `id:14019 `; iCumRate +=4;} //0.421940928�׷��̽� �÷���Ʈ �Ƹ�
					case(237){itemString = `id:13031 `; iCumRate +=4;} //0.421940928������ī �ǹ� �÷���Ʈ �Ƹ�
					case(238){itemString = `id:13022 `; iCumRate +=4;} //0.421940928���� �÷���Ʈ �Ƹ� (PŸ��)
					case(239){itemString = `id:40039 `; iCumRate +=4;} //0.421940928���̽� ����
					case(240){itemString = `id:40090 `; iCumRate +=4;} //0.421940928���� ����
					case(241){itemString = `id:40040 `; iCumRate +=4;} //0.421940928���̾� ����
					case(242){itemString = `id:40038 `; iCumRate +=4;} //0.421940928����Ʈ�� ����
					case(243){itemString = `id:18542 `; iCumRate +=4;} //0.421940928�� ü�� Ǯ �︧
					case(244){itemString = `id:18506 `; iCumRate +=4;} //0.421940928�� ���� �︧
					case(245){itemString = `id:14042 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� �Ƹ�
					case(246){itemString = `id:15155 `; iCumRate +=4;} //0.421940928�̵�ī�� ������ ����(������)
					case(247){itemString = `id:15156 `; iCumRate +=4;} //0.421940928�̵�ī�� ������ ����(������)
					case(248){itemString = `id:15151 `; iCumRate +=4;} //0.421940928���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(249){itemString = `id:15152 `; iCumRate +=4;} //0.421940928���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(250){itemString = `id:15153 `; iCumRate +=4;} //0.421940928���� �������� ��Ʈ(������)
					case(251){itemString = `id:15154 `; iCumRate +=4;} //0.421940928���� �������� ��Ʈ(������)
					case(252){itemString = `id:15157 `; iCumRate +=4;} //0.421940928���� ������ �Ǻ�(������)
					case(253){itemString = `id:15158 `; iCumRate +=4;} //0.421940928���� ������ �Ǻ�(������)
					case(254){itemString = `id:15115 `; iCumRate +=4;} //0.421940928���� �̴� ��ĿƮ
					case(255){itemString = `id:15059 `; iCumRate +=4;} //0.421940928��ũ�� ��ũž �ݹ���
					case(256){itemString = `id:15070 `; iCumRate +=4;} //0.421940928���̵� ���� �巹��
					case(257){itemString = `id:15074 `; iCumRate +=4;} //0.421940928���̽� ������ ��Ʈ
					case(258){itemString = `id:15061 `; iCumRate +=4;} //0.421940928���ṫ�� ��Ʈ�� Ʃ��
					case(259){itemString = `id:18045 `; iCumRate +=4;} //0.421940928����� ������ ����
					case(260){itemString = `id:18019 `; iCumRate +=4;} //0.421940928������ ���и���
					case(261){itemString = `id:18020 `; iCumRate +=4;} //0.421940928��� ���и���
					case(262){itemString = `id:18029 `; iCumRate +=4;} //0.421940928������ �Ȱ�
					case(263){itemString = `id:18028 `; iCumRate +=4;} //0.421940928���̽� �Ȱ�
					case(264){itemString = `id:13010 `; iCumRate +=4;} //0.421940928���� ����� ü�θ���
					case(265){itemString = `id:14025 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(266){itemString = `id:14026 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(267){itemString = `id:16028 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �۷���
					case(268){itemString = `id:17064 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ ����
					case(269){itemString = `id:15131 `; iCumRate +=4;} //0.421940928�� �������� ��ĿƮ
					case(270){itemString = `id:2006 `; iCumRate +=4;} //0.421940928ū ��ȭ �ָӴ�
					case(271){itemString = `id:16534 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� ��Ʋ��
					case(272){itemString = `id:17524 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� ����
					case(273){itemString = `id:13047 `; iCumRate +=4;} //0.421940928Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(274){itemString = `id:13048 `; iCumRate +=4;} //0.421940928Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(275){itemString = `id:14013 `; iCumRate +=4;} //0.421940928�θ�ī ���׸�ŸŸ��
					case(276){itemString = `id:14035 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� �Ƹ�
					case(277){itemString = `id:14038 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(278){itemString = `id:15028 `; iCumRate +=4;} //0.421940928�ڷ��� ������Ʈ
					case(279){itemString = `id:15042 `; iCumRate +=4;} //0.421940928�ճ� ���ǽ�
					case(280){itemString = `id:15052 `; iCumRate +=4;} //0.421940928��ũ�� ���� Ʃ��
					case(281){itemString = `id:15053 `; iCumRate +=4;} //0.421940928�÷�Į�� ���ǽ�
					case(282){itemString = `id:15128 `; iCumRate +=4;} //0.421940928�� �� ���� �巹��
					case(283){itemString = `id:15136 `; iCumRate +=4;} //0.421940928���谡 ��Ʈ
					case(284){itemString = `id:16008 `; iCumRate +=4;} //0.421940928�ڷ��� ���� �۷���
					case(285){itemString = `id:16019 `; iCumRate +=4;} //0.421940928�ٹ��� �ȸ� �尩
					case(286){itemString = `id:16040 `; iCumRate +=4;} //0.421940928�ݸ� �� �۷���
					case(287){itemString = `id:16505 `; iCumRate +=4;} //0.421940928�÷�Ʈ ��Ʋ��
					case(288){itemString = `id:16520 `; iCumRate +=4;} //0.421940928�� ���� �۷���
					case(289){itemString = `id:17040 `; iCumRate +=4;} //0.421940928���� ��Ʈ�� ����
					case(290){itemString = `id:17041 `; iCumRate +=4;} //0.421940928�������� ���ú���
					case(291){itemString = `id:17045 `; iCumRate +=4;} //0.421940928���� �� ���� ���� ����
					case(292){itemString = `id:17071 `; iCumRate +=4;} //0.421940928������ ����
					case(293){itemString = `id:17087 `; iCumRate +=4;} //0.421940928�ݸ� �� ����
					case(294){itemString = `id:17506 `; iCumRate +=4;} //0.421940928�ձ׸��� ����
					case(295){itemString = `id:17522 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� ����
					case(296){itemString = `id:18008 `; iCumRate +=4;} //0.421940928��Ʈ������ ĸ
					case(297){itemString = `id:18038 `; iCumRate +=4;} //0.421940928���� �跿 ����
					case(298){itemString = `id:18047 `; iCumRate +=4;} //0.421940928�ڷ��� ��Ʈ ����
					case(299){itemString = `id:18513 `; iCumRate +=4;} //0.421940928������ũ ĸ
					case(300){itemString = `id:18515 `; iCumRate +=4;} //0.421940928Ʈ�� ȥ ĸ
					case(301){itemString = `id:18525 `; iCumRate +=4;} //0.421940928���͵�� ĸ
					case(302){itemString = `id:18543 `; iCumRate +=4;} //0.421940928���� Ǯ �︧
					case(303){itemString = `id:19020 `; iCumRate +=4;} //0.421940928��Ÿ�� ����� ��Ʈ
					case(304){itemString = `id:19029 `; iCumRate +=4;} //0.421940928���̾�Ʈ ���� �κ�
					case(305){itemString = `id:40015 `; iCumRate +=4;} //0.421940928�÷�Ʈ �� �ҵ�
					case(306){itemString = `id:40081 `; iCumRate +=4;} //0.421940928�� ����
					case(307){itemString = `id:46001 `; iCumRate +=4;} //0.421940928���� �ǵ�
					case(308){itemString = `id:46006 `; iCumRate +=4;} //0.421940928ī��Ʈ �ǵ�
					case(309){itemString = `id:40172 `; iCumRate +=4;} //0.421940928�׷���Ʈ �ҵ�
					case(310){itemString = `id:40174 `; iCumRate +=4;} //0.421940928��׽�Ÿ
					case(311){itemString = `id:40177 `; iCumRate +=4;} //0.421940928������ �׽�
					case(312){itemString = `id:40180 `; iCumRate +=4;} //0.421940928ȩ���� ��Ŭ
					case(313){itemString = `id:40041 `; iCumRate +=4;} //0.421940928Ÿ�ݿ� ����
					case(314){itemString = `id:16523 `; iCumRate +=4;} //0.421940928�׷��̽� ��Ʋ��
					case(315){itemString = `id:17515 `; iCumRate +=4;} //0.421940928�׷��̽� �׸���
					case(316){itemString = `id:18545 `; iCumRate +=4;} //0.421940928�׷��̽� ���
					case(317){itemString = `id:46007 `; iCumRate +=4;} //0.421940928���׷� ī��Ʈ �ǵ�
					case(318){itemString = `id:46008 `; iCumRate +=4;} //0.421940928����Ʈ ���׷� ī��Ʈ �ǵ�
					case(319){itemString = `id:51003 count:10`; iCumRate +=5;} //0.52742616����� 50 ����
					case(320){itemString = `id:51004 count:10`; iCumRate +=5;} //0.52742616����� 100 ����
					case(321){itemString = `id:51008 count:10`; iCumRate +=5;} //0.52742616���� 50 ����
					case(322){itemString = `id:51014 count:10`; iCumRate +=5;} //0.52742616���¹̳� 100 ����
					case(323){itemString = `id:51029 count:10`; iCumRate +=5;} //0.52742616����°� ���¹̳� 100 ����
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(256);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:13060 `; iCumRate +=1;} //0.390625 �巡�� ������ �Ƹ�(������)
					case(1){itemString = `id:13061 `; iCumRate +=1;} //0.390625 �巡�� ������ �Ƹ� (������)
					case(2){itemString = `id:13062 `; iCumRate +=1;} //0.390625 �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(3){itemString = `id:13063 `; iCumRate +=1;} //0.390625 �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(4){itemString = `id:16543 `; iCumRate +=1;} //0.390625 �巡�� ������ ��Ʋ��
					case(5){itemString = `id:16544 `; iCumRate +=1;} //0.390625 �巡�� ������ ��Ʋ��(���̾�Ʈ��)
					case(6){itemString = `id:17530 `; iCumRate +=1;} //0.390625 �巡�� ������ �׸���
					case(7){itemString = `id:18577 `; iCumRate +=1;} //0.390625 �巡�� ������ �︧
					case(8){itemString = `id:15267 `; iCumRate +=2;} //0.78125�׶� ��� Ǯ �巹��
					case(9){itemString = `id:15362 `; iCumRate +=2;} //0.78125�׶� ��� ��ũ ��Ʈ
					case(10){itemString = `id:19033 `; iCumRate +=2;} //0.78125��� �κ�
					case(11){itemString = `id:15405 `; iCumRate +=2;} //0.78125�����׵� �мŴϽ�Ÿ �巹��
					case(12){itemString = `id:17039 `; iCumRate +=2;} //0.78125�ڷ��� ťƮ ���� ����
					case(13){itemString = `id:13050 `; iCumRate +=2;} //0.78125Ŭ��콺 ����Ʈ �Ƹ�
					case(14){itemString = `id:16551 `; iCumRate +=2;} //0.78125Ŭ��콺 ����Ʈ ��Ʋ��
					case(15){itemString = `id:17534 `; iCumRate +=2;} //0.78125Ŭ��콺 ����Ʈ ����
					case(16){itemString = `id:46010 `; iCumRate +=2;} //0.78125 @�巡�� �ǵ�
					case(17){itemString = `id:18549 `; iCumRate +=5;} //1.953125 @�巡�� �縯�� �︧
					case(18){itemString = `id:15373 `; iCumRate +=5;} //1.953125�ý��� Ĭ���� �巹��
					case(19){itemString = `id:18218 `; iCumRate +=5;} //1.953125��Ƽ�� �ֵ�̷� ����(������)
					case(20){itemString = `id:18219`; iCumRate +=5;} //1.953125��Ƽ�� �ֵ�̷� ����(������)
					case(21){itemString = `id:17141`; iCumRate +=5;} //1.953125���̸� ����Ŀ ����
					case(22){itemString = `id:17154`; iCumRate +=5;} //1.953125������ ���� �ڵ� ����
					case(23){itemString = `id:18274`; iCumRate +=5;} //1.953125������ ��� ���
					case(24){itemString = `id:17153`; iCumRate +=5;} //1.953125���� ĳ�־� ����
					case(25){itemString = `id:18038`; iCumRate +=5;} //1.953125���� �跿 ����
					case(26){itemString = `id:18567`; iCumRate +=5;} //1.953125���� ����
					case(27){itemString = `id:15573 `; iCumRate +=10;} //3.90625Ŭ���� Ŀ�� ��Ʈ(������)
					case(28){itemString = `id:15184 `; iCumRate +=10;} //3.90625�׶� ���̼�Ʈ ���� ����
					case(29){itemString = `id:15066 `; iCumRate +=10;} //3.90625���̽� ����Ʈ ����
					case(30){itemString = `id:15099 `; iCumRate +=10;} //3.90625���ī ��ο��� ���̾�� ��ĿƮ
					case(31){itemString = `id:19038 `; iCumRate +=10;} //3.90625��� Ĺ �κ�
					case(32){itemString = `id:19066 `; iCumRate +=10;} //3.90625�ҷ��� ȣ�� �κ�
					case(33){itemString = `id:15113 `; iCumRate +=10;} //3.90625������ �˻��б� ���� ��ƮŸ��
					case(34){itemString = `id:17120 `; iCumRate +=10;} //3.90625����Ÿ �÷� ��Ŭ ����
					case(35){itemString = `id:16136 `; iCumRate +=10;} //3.90625���̾� �Ƕ�̵� ���
					case(36){itemString = `id:15374 `; iCumRate +=10;} //3.90625���̴� ��� ���� �巹��
					case(37){itemString = `id:15136 `; iCumRate +=10;} //3.90625��� ���̽� ��ĿƮ
					case(38){itemString = `id:14032 `; iCumRate +=10;} //3.90625��Ƽġ �� �κ� �Ƹ�
					case(39){itemString = `id:18199 `; iCumRate +=10;} //3.90625������ �Ȱ�
					case(40){itemString = `id:40095 `; iCumRate +=10;} //3.90625 @�巡�� ���̵�
					case(41){itemString = `id:91129 count:3`; iCumRate +=10;} //3.90625���� ��ų ����ġ 2�� ����
					case(42){itemString = `id:91130 count:3`; iCumRate +=10;} //3.90625���� ��ų ����ġ 2�� ����
					case(43){itemString = `id:91131 count:3`; iCumRate +=10;} //3.90625���ݼ� ��ų ����ġ 2�� ����
					case(44){itemString = `id:91070 `; iCumRate +=10;} //3.90625���� ���ݷ� ���� ���� (30��)
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3071);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.032562683������ �κ� (������)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.032562683������ �κ� (������)
					case(2){itemString = `id:16554 `; iCumRate +=2;} //0.065125366������ ��Ʋ��
					case(3){itemString = `id:17551 `; iCumRate +=2;} //0.065125366������ �÷���Ʈ ����
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=5;} //0.162813416���� ����� ü�θ���
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=5;} //0.162813416���� �÷���Ʈ �Ƹ� (PŸ��)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=5;} //0.162813416������ī �ǹ� �÷���Ʈ �Ƹ�
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=5;} //0.162813416Ƽ���� �Ƹ�(������)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=5;} //0.162813416Ƽ���� �Ƹ�(������)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �۷���
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=5;} //0.162813416�ǹ� Ƽ�� �۷���
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=5;} //0.162813416�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=5;} //0.162813416Ƽ���� ��Ʋ��
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ ����
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=5;} //0.162813416������ī �ǹ� �÷���Ʈ ����
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=5;} //0.162813416�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=5;} //0.162813416Ƽ���� �׸���
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=5;} //0.162813416�巡�� ũ����Ʈ
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=10;} //0.325626832�Ź��� �ָӴϣ������÷���
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=10;} //0.325626832���� �ǹ�ġ �ָӴϣ������÷���
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=10;} //0.325626832���� �ǹ�ġ �ָӴ� (�����÷���
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=10;} //0.325626832������ ���� �ָӴϣ������÷���
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=10;} //0.325626832�Ϲ� ���� �ָӴ� �ָӴϣ������÷���
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=10;} //0.325626832��� ���� �ָӴϣ������÷���
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=10;} //0.325626832�ְ�� ���� �ָӴϣ������÷���
					case(27){itemString = `id:80001 `; iCumRate +=20;} //0.651253663����� ��
					case(28){itemString = `id:80002 `; iCumRate +=20;} //0.651253663��ũ�� ��Ʈ
					case(29){itemString = `id:80003 `; iCumRate +=20;} //0.651253663������ ��Ʈ
					case(30){itemString = `id:80004 `; iCumRate +=20;} //0.651253663������ ����� �� ��
					case(31){itemString = `id:80005 `; iCumRate +=20;} //0.651253663������ �Ͼ�� �� ��
					case(32){itemString = `id:80006 `; iCumRate +=20;} //0.651253663������ ��ũ�� �� ��
					case(33){itemString = `id:51004 count:10`; iCumRate +=20;} //0.651253663����� 100 ����
					case(34){itemString = `id:51008 count:10`; iCumRate +=20;} //0.651253663���� 50 ����
					case(35){itemString = `id:51022 count:10`; iCumRate +=20;} //0.651253663����°� ���� 30 ����
					case(36){itemString = `id:51023 count:10`; iCumRate +=20;} //0.651253663����°� ���� 50 ����
					case(37){itemString = `id:51027 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 30 ����
					case(38){itemString = `id:51028 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 50 ����
					case(39){itemString = `id:51029 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 100 ����
					case(40){itemString = `id:60036 count:5`; iCumRate +=20;} //0.651253663���ο� ���̺� ����
					case(41){itemString = `id:60037 count:5`; iCumRate +=20;} //0.651253663�� ���� ����
					case(42){itemString = `id:60038 count:5`; iCumRate +=20;} //0.651253663���� ����
					case(43){itemString = `id:60040 count:5`; iCumRate +=20;} //0.651253663�׸� ���̺� ����
					case(44){itemString = `id:62004 count:5`; iCumRate +=20;} //0.651253663��������
					case(45){itemString = `id:63000 count:10`; iCumRate +=20;} //0.651253663�Ǵн��� ����
					case(46){itemString = `id:2041`; iCumRate +=20;} //0.651253663�Ź��� �ָӴ�
					case(47){itemString = `id:2042`; iCumRate +=20;} //0.651253663���� �ǹ�ġ �ָӴ�
					case(48){itemString = `id:2043`; iCumRate +=20;} //0.651253663���� �ǹ�ġ �ָӴ�
					case(49){itemString = `id:2044`; iCumRate +=20;} //0.651253663������ ���� �ָӴ�
					case(50){itemString = `id:2045`; iCumRate +=20;} //0.651253663�Ϲ� ���� �ָӴ� �ָӴ�
					case(51){itemString = `id:2046`; iCumRate +=20;} //0.651253663��� ���� �ָӴ�
					case(52){itemString = `id:2028`; iCumRate +=20;} //0.651253663���� �ָӴ�
					case(53){itemString = `id:51009 count:10`; iCumRate +=20;} //0.651253663���� 100 ����
					case(54){itemString = `id:2006 `; iCumRate +=30;} //0.976880495ū ��ȭ �ָӴ�
					case(55){itemString = `id:14042 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� �Ƹ�
					case(56){itemString = `id:16534 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� ��Ʋ��
					case(57){itemString = `id:17524 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� ����
					case(58){itemString = `id:13047 `; iCumRate +=30;} //0.976880495Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(59){itemString = `id:13048 `; iCumRate +=30;} //0.976880495Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(60){itemString = `id:14005 `; iCumRate +=30;} //0.976880495������� ��������
					case(61){itemString = `id:14011 `; iCumRate +=30;} //0.976880495������� ��������
					case(62){itemString = `id:14013 `; iCumRate +=30;} //0.976880495�θ�ī ���׸�ŸŸ��
					case(63){itemString = `id:14019 `; iCumRate +=30;} //0.976880495�׷��̽� �÷���Ʈ �Ƹ�
					case(64){itemString = `id:14035 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� �Ƹ�
					case(65){itemString = `id:14038 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(66){itemString = `id:15014 `; iCumRate +=30;} //0.976880495�Ĺ߲��� ��
					case(67){itemString = `id:15028 `; iCumRate +=30;} //0.976880495�ڷ��� ������Ʈ
					case(68){itemString = `id:15042 `; iCumRate +=30;} //0.976880495�ճ� ���ǽ�
					case(69){itemString = `id:15052 `; iCumRate +=30;} //0.976880495��ũ�� ���� Ʃ��
					case(70){itemString = `id:15053 `; iCumRate +=30;} //0.976880495�÷�Į�� ���ǽ�
					case(71){itemString = `id:15055 `; iCumRate +=30;} //0.976880495���� �̴� ���ǽ�
					case(72){itemString = `id:15057 `; iCumRate +=30;} //0.976880495�� ���� ��Ʈ (����)
					case(73){itemString = `id:15070 `; iCumRate +=30;} //0.976880495���ĵ�Į�� �����긮��
					case(74){itemString = `id:15128 `; iCumRate +=30;} //0.976880495�� �� ���� �巹��
					case(75){itemString = `id:15135 `; iCumRate +=30;} //0.976880495��ũ ��Ʈ
					case(76){itemString = `id:15136 `; iCumRate +=30;} //0.976880495���谡 ��Ʈ
					case(77){itemString = `id:15153 `; iCumRate +=30;} //0.976880495���� �������� ��Ʈ(������)
					case(78){itemString = `id:15154 `; iCumRate +=30;} //0.976880495���� �������� ��Ʈ(������)
					case(79){itemString = `id:15230 `; iCumRate +=30;} //0.976880495������ �۷� üũ ��ĿƮ
					case(80){itemString = `id:16008 `; iCumRate +=30;} //0.976880495�ڷ��� ���� �۷���
					case(81){itemString = `id:16019 `; iCumRate +=30;} //0.976880495�ٹ��� �ȸ� �尩
					case(82){itemString = `id:16028 `; iCumRate +=30;} //0.976880495ī�� ���Ǹ�Ʈ �۷���
					case(83){itemString = `id:16040 `; iCumRate +=30;} //0.976880495�ݸ� �� �۷���
					case(84){itemString = `id:16505 `; iCumRate +=30;} //0.976880495�÷�Ʈ ��Ʋ��
					case(85){itemString = `id:16520 `; iCumRate +=30;} //0.976880495�� ���� �۷���
					case(86){itemString = `id:17040 `; iCumRate +=30;} //0.976880495���� ��Ʈ�� ����
					case(87){itemString = `id:17041 `; iCumRate +=30;} //0.976880495�������� ���ú���
					case(88){itemString = `id:17045 `; iCumRate +=30;} //0.976880495���� �� ���� ���� ����
					case(89){itemString = `id:17071 `; iCumRate +=30;} //0.976880495������ ����
					case(90){itemString = `id:17087 `; iCumRate +=30;} //0.976880495�ݸ� �� ����
					case(91){itemString = `id:17506 `; iCumRate +=30;} //0.976880495�ձ׸��� ����
					case(92){itemString = `id:17522 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� ����
					case(93){itemString = `id:18008 `; iCumRate +=30;} //0.976880495��Ʈ������ ĸ
					case(94){itemString = `id:18023 `; iCumRate +=30;} //0.976880495��� ���� ĸ
					case(95){itemString = `id:18028 `; iCumRate +=30;} //0.976880495���̽� �Ȱ�
					case(96){itemString = `id:18029 `; iCumRate +=30;} //0.976880495������ �Ȱ�
					case(97){itemString = `id:18038 `; iCumRate +=30;} //0.976880495���� �跿 ����
					case(98){itemString = `id:18040 `; iCumRate +=30;} //0.976880495�ڷ��� ���� ������
					case(99){itemString = `id:18047 `; iCumRate +=30;} //0.976880495�ڷ��� ��Ʈ ����
					case(100){itemString = `id:18502 `; iCumRate +=30;} //0.976880495�� �︧
					case(101){itemString = `id:18506 `; iCumRate +=30;} //0.976880495�� ���� �︧
					case(102){itemString = `id:18511 `; iCumRate +=30;} //0.976880495�÷�Ʈ Ǯ �︧
					case(103){itemString = `id:18513 `; iCumRate +=30;} //0.976880495������ũ ĸ
					case(104){itemString = `id:18515 `; iCumRate +=30;} //0.976880495Ʈ�� ȥ ĸ
					case(105){itemString = `id:18525 `; iCumRate +=30;} //0.976880495���͵�� ĸ
					case(106){itemString = `id:18542 `; iCumRate +=30;} //0.976880495�� ü�� Ǯ �︧
					case(107){itemString = `id:18543 `; iCumRate +=30;} //0.976880495���� Ǯ �︧
					case(108){itemString = `id:19005 `; iCumRate +=30;} //0.976880495���÷� �κ�
					case(109){itemString = `id:19007 `; iCumRate +=30;} //0.976880495�߱� ���÷� �κ�
					case(110){itemString = `id:19020 `; iCumRate +=30;} //0.976880495��Ÿ�� ����� ��Ʈ
					case(111){itemString = `id:19029 `; iCumRate +=30;} //0.976880495���̾�Ʈ ���� �κ�
					case(112){itemString = `id:19034 `; iCumRate +=30;} //0.976880495������ Ŭ�ν� ������Ʈ
					case(113){itemString = `id:40014 `; iCumRate +=30;} //0.976880495������ ����
					case(114){itemString = `id:40015 `; iCumRate +=30;} //0.976880495�÷�Ʈ �� �ҵ�
					case(115){itemString = `id:40030 `; iCumRate +=30;} //0.976880495�� �ڵ�� �ҵ�
					case(116){itemString = `id:40031 `; iCumRate +=30;} //0.976880495����
					case(117){itemString = `id:40038 `; iCumRate +=30;} //0.976880495����Ʈ�� ����
					case(118){itemString = `id:40039 `; iCumRate +=30;} //0.976880495���̽� ����
					case(119){itemString = `id:40040 `; iCumRate +=30;} //0.976880495���̾� ����
					case(120){itemString = `id:40041 `; iCumRate +=30;} //0.976880495Ÿ�ݿ� ����
					case(121){itemString = `id:40079 `; iCumRate +=30;} //0.976880495���̽�
					case(122){itemString = `id:40081 `; iCumRate +=30;} //0.976880495���� �� ����
					case(123){itemString = `id:40090 `; iCumRate +=30;} //0.976880495���� ����
					case(124){itemString = `id:46001  `; iCumRate +=30;} //0.976880495���� �ǵ�
					case(125){itemString = `id:46006 `; iCumRate +=30;} //0.976880495ī��Ʈ �ǵ�
					case(126){itemString = `id:40172 `; iCumRate +=30;} //0.976880495�׷���Ʈ �ҵ�
					case(127){itemString = `id:40174 `; iCumRate +=30;} //0.976880495��׽�Ÿ
					case(128){itemString = `id:40177 `; iCumRate +=30;} //0.976880495������ �׽�
					case(129){itemString = `id:40180 `; iCumRate +=30;} //0.976880495ȩ���� ��Ŭ
					case(130){itemString = `id:85056`; iCumRate +=30;} //0.976880495�ְ�� ������ ũ����Ż
					case(131){itemString = `id:85055`; iCumRate +=30;} //0.976880495��� ������ ũ����Ż
					case(132){itemString = `id:85054`; iCumRate +=35;} //1.139693911������ ũ����Ż
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3071);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.032562683������ �κ� (������)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.032562683������ �κ� (������)
					case(2){itemString = `id:16554 `; iCumRate +=2;} //0.065125366������ ��Ʋ��
					case(3){itemString = `id:17551 `; iCumRate +=2;} //0.065125366������ �÷���Ʈ ����
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=5;} //0.162813416���� ����� ü�θ���
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=5;} //0.162813416���� �÷���Ʈ �Ƹ� (PŸ��)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=5;} //0.162813416������ī �ǹ� �÷���Ʈ �Ƹ�
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=5;} //0.162813416Ƽ���� �Ƹ�(������)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=5;} //0.162813416Ƽ���� �Ƹ�(������)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ �۷���
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=5;} //0.162813416�ǹ� Ƽ�� �۷���
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=5;} //0.162813416�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=5;} //0.162813416Ƽ���� ��Ʋ��
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=5;} //0.162813416ī�� ���Ǹ�Ʈ ����
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=5;} //0.162813416������ī �ǹ� �÷���Ʈ ����
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=5;} //0.162813416�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=5;} //0.162813416Ƽ���� �׸���
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=5;} //0.162813416�巡�� ũ����Ʈ
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=10;} //0.325626832�Ź��� �ָӴϣ������÷���
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=10;} //0.325626832���� �ǹ�ġ �ָӴϣ������÷���
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=10;} //0.325626832���� �ǹ�ġ �ָӴ� (�����÷���
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=10;} //0.325626832������ ���� �ָӴϣ������÷���
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=10;} //0.325626832�Ϲ� ���� �ָӴ� �ָӴϣ������÷���
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=10;} //0.325626832��� ���� �ָӴϣ������÷���
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=10;} //0.325626832�ְ�� ���� �ָӴϣ������÷���
					case(27){itemString = `id:80001 `; iCumRate +=20;} //0.651253663����� ��
					case(28){itemString = `id:80002 `; iCumRate +=20;} //0.651253663��ũ�� ��Ʈ
					case(29){itemString = `id:80003 `; iCumRate +=20;} //0.651253663������ ��Ʈ
					case(30){itemString = `id:80004 `; iCumRate +=20;} //0.651253663������ ����� �� ��
					case(31){itemString = `id:80005 `; iCumRate +=20;} //0.651253663������ �Ͼ�� �� ��
					case(32){itemString = `id:80006 `; iCumRate +=20;} //0.651253663������ ��ũ�� �� ��
					case(33){itemString = `id:51004 count:10`; iCumRate +=20;} //0.651253663����� 100 ����
					case(34){itemString = `id:51008 count:10`; iCumRate +=20;} //0.651253663���� 50 ����
					case(35){itemString = `id:51022 count:10`; iCumRate +=20;} //0.651253663����°� ���� 30 ����
					case(36){itemString = `id:51023 count:10`; iCumRate +=20;} //0.651253663����°� ���� 50 ����
					case(37){itemString = `id:51027 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 30 ����
					case(38){itemString = `id:51028 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 50 ����
					case(39){itemString = `id:51029 count:10`; iCumRate +=20;} //0.651253663����°� ���¹̳� 100 ����
					case(40){itemString = `id:60036 count:5`; iCumRate +=20;} //0.651253663���ο� ���̺� ����
					case(41){itemString = `id:60037 count:5`; iCumRate +=20;} //0.651253663�� ���� ����
					case(42){itemString = `id:60038 count:5`; iCumRate +=20;} //0.651253663���� ����
					case(43){itemString = `id:60040 count:5`; iCumRate +=20;} //0.651253663�׸� ���̺� ����
					case(44){itemString = `id:62004 count:5`; iCumRate +=20;} //0.651253663��������
					case(45){itemString = `id:63000 count:10`; iCumRate +=20;} //0.651253663�Ǵн��� ����
					case(46){itemString = `id:2041`; iCumRate +=20;} //0.651253663�Ź��� �ָӴ�
					case(47){itemString = `id:2042`; iCumRate +=20;} //0.651253663���� �ǹ�ġ �ָӴ�
					case(48){itemString = `id:2043`; iCumRate +=20;} //0.651253663���� �ǹ�ġ �ָӴ�
					case(49){itemString = `id:2044`; iCumRate +=20;} //0.651253663������ ���� �ָӴ�
					case(50){itemString = `id:2045`; iCumRate +=20;} //0.651253663�Ϲ� ���� �ָӴ� �ָӴ�
					case(51){itemString = `id:2046`; iCumRate +=20;} //0.651253663��� ���� �ָӴ�
					case(52){itemString = `id:2028`; iCumRate +=20;} //0.651253663���� �ָӴ�
					case(53){itemString = `id:51009 count:10`; iCumRate +=20;} //0.651253663���� 100 ����
					case(54){itemString = `id:2006 `; iCumRate +=30;} //0.976880495ū ��ȭ �ָӴ�
					case(55){itemString = `id:14042 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� �Ƹ�
					case(56){itemString = `id:16534 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� ��Ʋ��
					case(57){itemString = `id:17524 `; iCumRate +=30;} //0.976880495�ý�ƾ ���� ����
					case(58){itemString = `id:13047 `; iCumRate +=30;} //0.976880495Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(59){itemString = `id:13048 `; iCumRate +=30;} //0.976880495Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(60){itemString = `id:14005 `; iCumRate +=30;} //0.976880495������� ��������
					case(61){itemString = `id:14011 `; iCumRate +=30;} //0.976880495������� ��������
					case(62){itemString = `id:14013 `; iCumRate +=30;} //0.976880495�θ�ī ���׸�ŸŸ��
					case(63){itemString = `id:14019 `; iCumRate +=30;} //0.976880495�׷��̽� �÷���Ʈ �Ƹ�
					case(64){itemString = `id:14035 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� �Ƹ�
					case(65){itemString = `id:14038 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(66){itemString = `id:15014 `; iCumRate +=30;} //0.976880495�Ĺ߲��� ��
					case(67){itemString = `id:15028 `; iCumRate +=30;} //0.976880495�ڷ��� ������Ʈ
					case(68){itemString = `id:15042 `; iCumRate +=30;} //0.976880495�ճ� ���ǽ�
					case(69){itemString = `id:15052 `; iCumRate +=30;} //0.976880495��ũ�� ���� Ʃ��
					case(70){itemString = `id:15053 `; iCumRate +=30;} //0.976880495�÷�Į�� ���ǽ�
					case(71){itemString = `id:15055 `; iCumRate +=30;} //0.976880495���� �̴� ���ǽ�
					case(72){itemString = `id:15057 `; iCumRate +=30;} //0.976880495�� ���� ��Ʈ (����)
					case(73){itemString = `id:15070 `; iCumRate +=30;} //0.976880495���ĵ�Į�� �����긮��
					case(74){itemString = `id:15128 `; iCumRate +=30;} //0.976880495�� �� ���� �巹��
					case(75){itemString = `id:15135 `; iCumRate +=30;} //0.976880495��ũ ��Ʈ
					case(76){itemString = `id:15136 `; iCumRate +=30;} //0.976880495���谡 ��Ʈ
					case(77){itemString = `id:15153 `; iCumRate +=30;} //0.976880495���� �������� ��Ʈ(������)
					case(78){itemString = `id:15154 `; iCumRate +=30;} //0.976880495���� �������� ��Ʈ(������)
					case(79){itemString = `id:15230 `; iCumRate +=30;} //0.976880495������ �۷� üũ ��ĿƮ
					case(80){itemString = `id:16008 `; iCumRate +=30;} //0.976880495�ڷ��� ���� �۷���
					case(81){itemString = `id:16019 `; iCumRate +=30;} //0.976880495�ٹ��� �ȸ� �尩
					case(82){itemString = `id:16028 `; iCumRate +=30;} //0.976880495ī�� ���Ǹ�Ʈ �۷���
					case(83){itemString = `id:16040 `; iCumRate +=30;} //0.976880495�ݸ� �� �۷���
					case(84){itemString = `id:16505 `; iCumRate +=30;} //0.976880495�÷�Ʈ ��Ʋ��
					case(85){itemString = `id:16520 `; iCumRate +=30;} //0.976880495�� ���� �۷���
					case(86){itemString = `id:17040 `; iCumRate +=30;} //0.976880495���� ��Ʈ�� ����
					case(87){itemString = `id:17041 `; iCumRate +=30;} //0.976880495�������� ���ú���
					case(88){itemString = `id:17045 `; iCumRate +=30;} //0.976880495���� �� ���� ���� ����
					case(89){itemString = `id:17071 `; iCumRate +=30;} //0.976880495������ ����
					case(90){itemString = `id:17087 `; iCumRate +=30;} //0.976880495�ݸ� �� ����
					case(91){itemString = `id:17506 `; iCumRate +=30;} //0.976880495�ձ׸��� ����
					case(92){itemString = `id:17522 `; iCumRate +=30;} //0.976880495�Ǹ�Ÿ ���� ����
					case(93){itemString = `id:18008 `; iCumRate +=30;} //0.976880495��Ʈ������ ĸ
					case(94){itemString = `id:18023 `; iCumRate +=30;} //0.976880495��� ���� ĸ
					case(95){itemString = `id:18028 `; iCumRate +=30;} //0.976880495���̽� �Ȱ�
					case(96){itemString = `id:18029 `; iCumRate +=30;} //0.976880495������ �Ȱ�
					case(97){itemString = `id:18038 `; iCumRate +=30;} //0.976880495���� �跿 ����
					case(98){itemString = `id:18040 `; iCumRate +=30;} //0.976880495�ڷ��� ���� ������
					case(99){itemString = `id:18047 `; iCumRate +=30;} //0.976880495�ڷ��� ��Ʈ ����
					case(100){itemString = `id:18502 `; iCumRate +=30;} //0.976880495�� �︧
					case(101){itemString = `id:18506 `; iCumRate +=30;} //0.976880495�� ���� �︧
					case(102){itemString = `id:18511 `; iCumRate +=30;} //0.976880495�÷�Ʈ Ǯ �︧
					case(103){itemString = `id:18513 `; iCumRate +=30;} //0.976880495������ũ ĸ
					case(104){itemString = `id:18515 `; iCumRate +=30;} //0.976880495Ʈ�� ȥ ĸ
					case(105){itemString = `id:18525 `; iCumRate +=30;} //0.976880495���͵�� ĸ
					case(106){itemString = `id:18542 `; iCumRate +=30;} //0.976880495�� ü�� Ǯ �︧
					case(107){itemString = `id:18543 `; iCumRate +=30;} //0.976880495���� Ǯ �︧
					case(108){itemString = `id:19005 `; iCumRate +=30;} //0.976880495���÷� �κ�
					case(109){itemString = `id:19007 `; iCumRate +=30;} //0.976880495�߱� ���÷� �κ�
					case(110){itemString = `id:19020 `; iCumRate +=30;} //0.976880495��Ÿ�� ����� ��Ʈ
					case(111){itemString = `id:19029 `; iCumRate +=30;} //0.976880495���̾�Ʈ ���� �κ�
					case(112){itemString = `id:19034 `; iCumRate +=30;} //0.976880495������ Ŭ�ν� ������Ʈ
					case(113){itemString = `id:40014 `; iCumRate +=30;} //0.976880495������ ����
					case(114){itemString = `id:40015 `; iCumRate +=30;} //0.976880495�÷�Ʈ �� �ҵ�
					case(115){itemString = `id:40030 `; iCumRate +=30;} //0.976880495�� �ڵ�� �ҵ�
					case(116){itemString = `id:40031 `; iCumRate +=30;} //0.976880495����
					case(117){itemString = `id:40038 `; iCumRate +=30;} //0.976880495����Ʈ�� ����
					case(118){itemString = `id:40039 `; iCumRate +=30;} //0.976880495���̽� ����
					case(119){itemString = `id:40040 `; iCumRate +=30;} //0.976880495���̾� ����
					case(120){itemString = `id:40041 `; iCumRate +=30;} //0.976880495Ÿ�ݿ� ����
					case(121){itemString = `id:40079 `; iCumRate +=30;} //0.976880495���̽�
					case(122){itemString = `id:40081 `; iCumRate +=30;} //0.976880495���� �� ����
					case(123){itemString = `id:40090 `; iCumRate +=30;} //0.976880495���� ����
					case(124){itemString = `id:46001  `; iCumRate +=30;} //0.976880495���� �ǵ�
					case(125){itemString = `id:46006 `; iCumRate +=30;} //0.976880495ī��Ʈ �ǵ�
					case(126){itemString = `id:40172 `; iCumRate +=30;} //0.976880495�׷���Ʈ �ҵ�
					case(127){itemString = `id:40174 `; iCumRate +=30;} //0.976880495��׽�Ÿ
					case(128){itemString = `id:40177 `; iCumRate +=30;} //0.976880495������ �׽�
					case(129){itemString = `id:40180 `; iCumRate +=30;} //0.976880495ȩ���� ��Ŭ
					case(130){itemString = `id:85056 count:3`; iCumRate +=30;} //0.976880495�ְ�� ������ ũ����Ż
					case(131){itemString = `id:85055 count:3`; iCumRate +=30;} //0.976880495��� ������ ũ����Ż
					case(132){itemString = `id:85054 count:3`; iCumRate +=35;} //1.139693911������ ũ����Ż
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
	}

	return ``;
}




////////////////////////////////////////////////////////////////////////////////
server string TreasureFakeEffectItem(
	character player,
	int itemClassId)
// : �����鿡�� ��¥�� �����ִ� ����Ʈ ������ ���
////////////////////////////////////////////////////////////////////////////////
{
	int itemID = itemClassId;

	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(77);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:13060`; iCumRate +=1;} //1.2987% �巡�� ������ �Ƹ�(������)
					case(1){itemString = `id:13061`; iCumRate +=1;} //1.2987% �巡�� ������ �Ƹ� (������)
					case(2){itemString = `id:13062`; iCumRate +=1;} //1.2987% �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(3){itemString = `id:13063`; iCumRate +=1;} //1.2987% �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(4){itemString = `id:16543`; iCumRate +=1;} //1.2987% �巡�� ������ ��Ʋ��
					case(5){itemString = `id:16544`; iCumRate +=1;} //1.2987% �巡�� ������ ��Ʋ��(���̾�Ʈ��)
					case(6){itemString = `id:17530`; iCumRate +=1;} //1.2987% �巡�� ������ �׸���
					case(7){itemString = `id:18577`; iCumRate +=1;} //1.2987% �巡�� ������ �︧
					case(8){itemString = `id:14011`; iCumRate +=1;} //1.2987% ������� �������� (������)
					case(9){itemString = `id:14005`; iCumRate +=1;} //1.2987% ������� �������� (������)
					case(10){itemString = `id:15352`; iCumRate +=1;} //1.2987% õ������ (������)
					case(11){itemString = `id:15353`; iCumRate +=1;} //1.2987% õ������ (������)
					case(12){itemString = `id:17139`; iCumRate +=1;} //1.2987% õ����ȭ
					case(13){itemString = `id:14040`; iCumRate +=1;} //1.2987%@���̳� �巡�� �Ƹӿ���
					case(14){itemString = `id:14041`; iCumRate +=1;} //1.2987%@���̳� �巡�� �Ƹ����̾�Ʈ
					case(15){itemString = `id:14039`; iCumRate +=1;} //1.2987%@���̳� �巡�� �Ƹ��ΰ�
					case(16){itemString = `id:18553`; iCumRate +=1;} //1.2987%@���̳� �巡�� �︧(��������)����
					case(17){itemString = `id:18552`; iCumRate +=1;} //1.2987%@���̳� �巡�� �︧�ΰ�, ���̾�Ʈ
					case(18){itemString = `id:17095`; iCumRate +=1;} //1.2987%@���̳� �巡�� ����������
					case(19){itemString = `id:16533`; iCumRate +=1;} //1.2987%@���̳� �巡�� ��Ʋ������
					case(20){itemString = `id:16535`; iCumRate +=1;} //1.2987%@���̳� �巡�� ��Ʋ�����̾�Ʈ
					case(21){itemString = `id:16532`; iCumRate +=1;} //1.2987%@���̳� �巡�� ��Ʋ���ΰ�
					case(22){itemString = `id:15267`; iCumRate +=2;} //2.5974%�׶� ��� Ǯ �巹��
					case(23){itemString = `id:15362`; iCumRate +=2;} //2.5974%�׶� ��� ��ũ ��Ʈ
					case(24){itemString = `id:15405`; iCumRate +=2;} //2.5974%�����׵� �мŴϽ�Ÿ �巹��
					case(25){itemString = `id:17039`; iCumRate +=2;} //2.5974%�ڷ��� ťƮ ���� ����
					case(26){itemString = `id:13050`; iCumRate +=2;} //2.5974%Ŭ��콺 ����Ʈ �Ƹ�
					case(27){itemString = `id:16551`; iCumRate +=2;} //2.5974%Ŭ��콺 ����Ʈ ��Ʋ��
					case(28){itemString = `id:17534`; iCumRate +=2;} //2.5974%Ŭ��콺 ����Ʈ ����
					case(29){itemString = `id:46010`; iCumRate +=2;} //2.5974% @�巡�� �ǵ�
					case(30){itemString = `id:15373`; iCumRate +=2;} //2.5974%�ý��� Ĭ���� �巹��
					case(31){itemString = `id:18218`; iCumRate +=2;} //2.5974%��Ƽ�� �ֵ�̷� ����(������)
					case(32){itemString = `id:18219`; iCumRate +=2;} //2.5974%��Ƽ�� �ֵ�̷� ����(������)
					case(33){itemString = `id:17141`; iCumRate +=2;} //2.5974%���̸� ����Ŀ ����
					case(34){itemString = `id:17154`; iCumRate +=2;} //2.5974%������ ���� �ڵ� ����
					case(35){itemString = `id:18038`; iCumRate +=2;} //2.5974%���� �跿 ����
					case(36){itemString = `id:15184`; iCumRate +=3;} //3.8961%�׶� ���̼�Ʈ ���� ����
					case(37){itemString = `id:15066`; iCumRate +=3;} //3.8961%���̽� ����Ʈ ����
					case(38){itemString = `id:15099`; iCumRate +=3;} //3.8961%���ī ��ο��� ���̾�� ��ĿƮ
					case(39){itemString = `id:19038`; iCumRate +=3;} //3.8961%��� Ĺ �κ�
					case(40){itemString = `id:17120`; iCumRate +=3;} //3.8961%����Ÿ �÷� ��Ŭ ����
					case(41){itemString = `id:16136`; iCumRate +=3;} //3.8961%���̾� �Ƕ�̵� ���
					case(42){itemString = `id:15374`; iCumRate +=3;} //3.8961%���̴� ��� ���� �巹��
					case(43){itemString = `id:15136`; iCumRate +=3;} //3.8961%��� ���̽� ��ĿƮ
					case(44){itemString = `id:14032`; iCumRate +=3;} //3.8961%��Ƽġ �� �κ� �Ƹ�
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(948);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.105485232�ڷ��� �̽��͸� �ν��� (UFO)
					case(1){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�ĳ� �ɾ� ���� ����
					case(2){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ���̽� ����
					case(3){itemString = `id:40250 `; iCumRate +=1;} //0.105485232������ ���̾� ����
					case(4){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ����Ʈ�� ����
					case(5){itemString = `id:40250 `; iCumRate +=1;} //0.105485232Į�Ǵ��� ���� ����
					case(6){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�ĸ� ���̽� ����
					case(7){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ż ���̾� ����
					case(8){itemString = `id:40250 `; iCumRate +=1;} //0.105485232�̹̼� ����Ʈ�� ����
					case(9){itemString = `id:18569 `; iCumRate +=1;} //0.105485232devCAT ����
					case(10){itemString = `id:40171 `; iCumRate +=1;} //0.105485232���繫��
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �Ƹ�
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ ��극�̽�
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �׸���
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(���̾�Ʈ)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.105485232����(������)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.105485232������ ������ ����
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.105485232������ ������ ����
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �Ƹ�
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ ��극�̽�
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232����ƾ �ǹ� ����Ʈ �׸���
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(���̾�Ʈ��)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.105485232��ó���� �������
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.105485232������ �� ���� ��ĿƮ
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.105485232�׷��̽� �� �巹��(������)
					case(33){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��ä
					case(34){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��īŸ ��
					case(35){itemString = `id:40250 `; iCumRate +=1;} //0.105485232��Ÿī ��
					case(36){itemString = `id:16046 `; iCumRate +=1;} //0.105485232����� �� �尩
					case(37){itemString = `id:18187 `; iCumRate +=1;} //0.105485232Ŀ�ٶ� ����
					case(38){itemString = `id:18188 `; iCumRate +=1;} //0.105485232�ȴ�
					case(39){itemString = `id:18189 `; iCumRate +=1;} //0.105485232ī�캸�� ����
					case(40){itemString = `id:15252 `; iCumRate +=1;} //0.105485232���� �ǻ�
					case(41){itemString = `id:19005 `; iCumRate +=1;} //0.105485232���÷� �κ�
					case(42){itemString = `id:18161 `; iCumRate +=1;} //0.105485232����Ĺ �͸���
					case(43){itemString = `id:18157 `; iCumRate +=1;} //0.105485232����� �� �Ӹ���
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.105485232���� �� ����
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232�۶��콺
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.105485232����Ʈ�� ����
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232���̽�
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�巡�� ���̵�
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232Ŭ���̸��
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���� �� ����
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���� ����
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�۶��콺
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����Ʈ�� ����
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̽� ����
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̾� ����
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232Ÿ�ݿ� ����
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����Ͻ�
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���̽�
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232����
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�� �ڵ�� �ҵ�
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232�� ����
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232���׷� ī��Ʈ �ǵ�
					case(64){itemString = `id:15267 `; iCumRate +=1;} //0.105485232�׶� ��� Ǯ �巹��
					case(65){itemString = `id:15268 `; iCumRate +=1;} //0.105485232�׶� ��� ��ũ ��Ʈ
					case(66){itemString = `id:19005 `; iCumRate +=1;} //0.105485232���÷� �κ�
					case(67){itemString = `id:15217 `; iCumRate +=1;} //0.105485232�������� ���ǽ�
					case(68){itemString = `id:18161 `; iCumRate +=1;} //0.105485232����Ĺ �͸���
					case(69){itemString = `id:18157 `; iCumRate +=1;} //0.105485232����� �� �Ӹ���
					case(70){itemString = `id:15233 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(71){itemString = `id:15234 `; iCumRate +=1;} //0.105485232������Ʈ ��� ��Ʈ
					case(72){itemString = `id:15235 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(73){itemString = `id:15233 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(74){itemString = `id:15234 `; iCumRate +=1;} //0.105485232������Ʈ ��� ��Ʈ
					case(75){itemString = `id:15235 `; iCumRate +=1;} //0.105485232������Ʈ ��� �巹��
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232�巡�� ���̵�
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232Ŭ���̸��
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���� ����
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���̽� ����
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232���̾� ����
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232Ÿ�ݿ� ����
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.105485232����Ͻ�
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232����
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232�� �ڵ�� �ҵ�
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232�� ����
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.105485232����� ����
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.105485232���׷� ī��Ʈ �ǵ�
					case(88){itemString = `id:14039 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(�ΰ�)
					case(89){itemString = `id:14040 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(����)
					case(90){itemString = `id:14041 `; iCumRate +=1;} //0.105485232���̳� �巡�� �Ƹ�(���̾�Ʈ)
					case(91){itemString = `id:16532 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(�ΰ�/���̾�Ʈ)
					case(92){itemString = `id:16535 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(���̾�Ʈ)
					case(93){itemString = `id:16533 `; iCumRate +=1;} //0.105485232���̳� �巡�� ��Ʋ��(����)
					case(94){itemString = `id:17095 `; iCumRate +=1;} //0.105485232���̳� �巡�� ����
					case(95){itemString = `id:18552 `; iCumRate +=1;} //0.105485232���̳� �巡�� �︧
					case(96){itemString = `id:40170 `; iCumRate +=1;} //0.105485232�Ϻ��� ��հ�
					case(97){itemString = `id:51007 count:10`; iCumRate +=2;} //0.210970464���� 30 ����
					case(98){itemString = `id:51013 count:10`; iCumRate +=2;} //0.210970464���¹̳� 50 ����
					case(99){itemString = `id:51001 count:10`; iCumRate +=2;} //0.210970464����� 10 ����
					case(100){itemString = `id:51002 count:10`; iCumRate +=2;} //0.210970464����� 30 ����
					case(101){itemString = `id:51022 count:10`; iCumRate +=2;} //0.210970464����°� ���� 30 ����
					case(102){itemString = `id:51027 count:10`; iCumRate +=2;} //0.210970464����°� ���¹̳� 30 ����
					case(103){itemString = `id:51028 count:10`; iCumRate +=2;} //0.210970464����°� ���¹̳� 50 ����
					case(104){itemString = `id:63000 count:10`; iCumRate +=2;} //0.210970464�Ǵн��� ����
					case(105){itemString = `id:60037 count:5`; iCumRate +=2;} //0.210970464�� ���� ����
					case(106){itemString = `id:60038 count:5`; iCumRate +=2;} //0.210970464���� ����
					case(107){itemString = `id:50012 count:5`; iCumRate +=2;} //0.210970464Ȳ�� �ް�
					case(108){itemString = `id:50013 count:5`; iCumRate +=2;} //0.210970464Ȳ�� ���
					case(109){itemString = `id:50541 quality:100`; iCumRate +=2;} //0.210970464����������
					case(110){itemString = `id:50542 quality:100`; iCumRate +=2;} //0.210970464���������� �����ƶ� 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=2;} //0.210970464īǪġ��
					case(112){itemString = `id:50544 quality:100`; iCumRate +=2;} //0.210970464�����ƶ�
					case(113){itemString = `id:50545 quality:100`; iCumRate +=2;} //0.210970464ī�� ��ī
					case(114){itemString = `id:50546 quality:100`; iCumRate +=2;} //0.210970464���̽� ī�� ��ī
					case(115){itemString = `id:50547 quality:100`; iCumRate +=2;} //0.210970464���̽� �����ƶ�
					case(116){itemString = `id:50170 quality:100`; iCumRate +=2;} //0.210970464ġ�� ����
					case(117){itemString = `id:50171 quality:100`; iCumRate +=2;} //0.210970464�̸� ���ϻ� ����
					case(118){itemString = `id:50172 quality:100`; iCumRate +=2;} //0.210970464����ġ�� ����
					case(119){itemString = `id:50173 quality:100`; iCumRate +=2;} //0.210970464���� �� ���ݶ�
					case(120){itemString = `id:50174 quality:100`; iCumRate +=2;} //0.210970464ũ��ũ ����
					case(121){itemString = `id:50175 quality:100`; iCumRate +=2;} //0.210970464�����
					case(122){itemString = `id:50176 quality:100`; iCumRate +=2;} //0.210970464���� ��Ŷ
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.316455696������
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.316455696���ڵ�
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.316455696����
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.316455696�ݼ� �ٴ�
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.316455696��糪��
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.316455696�Ѱ���
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=3;} //0.316455696���� ���ڵ�|���� ���ڵ�(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=3;} //0.316455696����Ʈ ����Ʈ|����Ʈ ����Ʈ(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=3;} //0.316455696���� ���ӳ�|���� ���ӳ�(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=3;} //0.316455696������ ��������|������ ��������(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=4;} //0.421940928�巡�� ũ����Ʈ
					case(134){itemString = `id:15113 `; iCumRate +=4;} //0.421940928������ �˻��б� ���� ��ƮŸ��
					case(135){itemString = `id:15114 `; iCumRate +=4;} //0.421940928������ �˻��б� ���� ��Ÿ��
					case(136){itemString = `id:15065 `; iCumRate +=4;} //0.421940928���� ����Ʈ ��ĿƮ
					case(137){itemString = `id:19008 `; iCumRate +=4;} //0.421940928���� �Ǵ� �κ�
					case(138){itemString = `id:15137 `; iCumRate +=4;} //0.421940928������ ���� ��Ŷ ��Ʈ
					case(139){itemString = `id:18041 `; iCumRate +=4;} //0.421940928ū ì ���� ����
					case(140){itemString = `id:19009 `; iCumRate +=4;} //0.421940928���� ���� �κ�
					case(141){itemString = `id:18112 `; iCumRate +=4;} //0.421940928�� ���� ��ǰ
					case(142){itemString = `id:18111 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(143){itemString = `id:18110 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(144){itemString = `id:18109 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(145){itemString = `id:18108 `; iCumRate +=4;} //0.421940928���� ���� ��ǰ
					case(146){itemString = `id:40083 `; iCumRate +=4;} //0.421940928�� ĿƲ����
					case(147){itemString = `id:40032 `; iCumRate +=4;} //0.421940928������ �ҵ�
					case(148){itemString = `id:18544 `; iCumRate +=4;} //0.421940928�縮ĭ ��������
					case(149){itemString = `id:18547 `; iCumRate +=4;} //0.421940928�ĳ��� ��� ��������
					case(150){itemString = `id:18521 `; iCumRate +=4;} //0.421940928�����Ǿ� ����
					case(151){itemString = `id:18500 `; iCumRate +=4;} //0.421940928�� ���� �︧
					case(152){itemString = `id:18511 `; iCumRate +=4;} //0.421940928�÷�Ʈ Ǯ �︧
					case(153){itemString = `id:18502 `; iCumRate +=4;} //0.421940928�� �︧
					case(154){itemString = `id:19007 `; iCumRate +=4;} //0.421940928�߱� ���÷� �κ�
					case(155){itemString = `id:19017 `; iCumRate +=4;} //0.421940928���� �κ�
					case(156){itemString = `id:19016 `; iCumRate +=4;} //0.421940928�� �κ�
					case(157){itemString = `id:15112 `; iCumRate +=4;} //0.421940928������ �����̷�
					case(158){itemString = `id:18034 `; iCumRate +=4;} //0.421940928���� ������
					case(159){itemString = `id:18006 `; iCumRate +=4;} //0.421940928���������
					case(160){itemString = `id:18113 `; iCumRate +=4;} //0.421940928������ ����� ����
					case(161){itemString = `id:18114 `; iCumRate +=4;} //0.421940928�ٹ��� ����� ����
					case(162){itemString = `id:18115 `; iCumRate +=4;} //0.421940928�� ����� ����
					case(163){itemString = `id:18097 `; iCumRate +=4;} //0.421940928���̷� ���� ����
					case(164){itemString = `id:18098 `; iCumRate +=4;} //0.421940928���̷��� �Ȱ�
					case(165){itemString = `id:18099 `; iCumRate +=4;} //0.421940928���̷� ���� ���� ����
					case(166){itemString = `id:18100 `; iCumRate +=4;} //0.421940928���̷� ���� ����
					case(167){itemString = `id:18101`; iCumRate +=4;} //0.421940928���̷� ���� ���� ����
					case(168){itemString = `id:18102 `; iCumRate +=4;} //0.421940928���̷��� ����
					case(169){itemString = `id:15055 `; iCumRate +=4;} //0.421940928���̷� ����� ����
					case(170){itemString = `id:18044 `; iCumRate +=4;} //0.421940928���˿� ����
					case(171){itemString = `id:40071 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(172){itemString = `id:40072 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(173){itemString = `id:40073 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(174){itemString = `id:40074 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(175){itemString = `id:40075 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(176){itemString = `id:40076 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(177){itemString = `id:40077 `; iCumRate +=4;} //0.421940928'��' �� �� ��
					case(178){itemString = `id:16517 `; iCumRate +=4;} //0.421940928�ݴ� �尩
					case(179){itemString = `id:16516 `; iCumRate +=4;} //0.421940928���� �尩
					case(180){itemString = `id:16515 `; iCumRate +=4;} //0.421940928�� �尩
					case(181){itemString = `id:16514 `; iCumRate +=4;} //0.421940928���� �尩
					case(182){itemString = `id:16513 `; iCumRate +=4;} //0.421940928���� �尩
					case(183){itemString = `id:40068 `; iCumRate +=4;} //0.421940928���� ��� ���ú�
					case(184){itemString = `id:40069 `; iCumRate +=4;} //0.421940928���� ��� ���ú�
					case(185){itemString = `id:40070 `; iCumRate +=4;} //0.421940928�� ��� ���ú�
					case(186){itemString = `id:17015 `; iCumRate +=4;} //0.421940928Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=4;} //0.421940928���� �̴� ���ǽ�
					case(188){itemString = `id:15057 `; iCumRate +=4;} //0.421940928�� ���� ��Ʈ (����)
					case(189){itemString = `id:18040 `; iCumRate +=4;} //0.421940928�ڷ��� ���� ������
					case(190){itemString = `id:80000 `; iCumRate +=4;} //0.421940928������ ���� ��
					case(191){itemString = `id:80001 `; iCumRate +=4;} //0.421940928����� ��
					case(192){itemString = `id:80002 `; iCumRate +=4;} //0.421940928��ũ�� ��Ʈ
					case(193){itemString = `id:80003 `; iCumRate +=4;} //0.421940928������ ��Ʈ
					case(194){itemString = `id:80004 `; iCumRate +=4;} //0.421940928������ ����� �� ��
					case(195){itemString = `id:80005 `; iCumRate +=4;} //0.421940928������ �Ͼ�� �� ��
					case(196){itemString = `id:80006 `; iCumRate +=4;} //0.421940928������ ��ũ�� �� ��
					case(197){itemString = `id:18056 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���1
					case(198){itemString = `id:18057 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���2
					case(199){itemString = `id:18058 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���3
					case(200){itemString = `id:18059 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���4
					case(201){itemString = `id:18060 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���5
					case(202){itemString = `id:18061 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���1
					case(203){itemString = `id:18062 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���2
					case(204){itemString = `id:18063 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���3
					case(205){itemString = `id:18064 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���4
					case(206){itemString = `id:18065 `; iCumRate +=4;} //0.421940928�� �䳢 �Ӹ���5
					case(207){itemString = `id:18066 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���1
					case(208){itemString = `id:18067 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���2
					case(209){itemString = `id:18068 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���3
					case(210){itemString = `id:18069 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���4
					case(211){itemString = `id:18070 `; iCumRate +=4;} //0.421940928���� �䳢 �Ӹ���5
					case(212){itemString = `id:14036 `; iCumRate +=4;} //0.421940928Ƽ���� �Ƹ�(������)
					case(213){itemString = `id:14037 `; iCumRate +=4;} //0.421940928Ƽ���� �Ƹ�(������)
					case(214){itemString = `id:16531 `; iCumRate +=4;} //0.421940928Ƽ���� ��Ʋ��
					case(215){itemString = `id:17523 `; iCumRate +=4;} //0.421940928Ƽ���� �׸���
					case(216){itemString = `id:15132 `; iCumRate +=4;} //0.421940928���߷� ����Ʈ ����
					case(217){itemString = `id:15070 `; iCumRate +=4;} //0.421940928���ĵ�Į�� �����긮��
					case(218){itemString = `id:15230 `; iCumRate +=4;} //0.421940928������ �۷� üũ ��ĿƮ
					case(219){itemString = `id:19034 `; iCumRate +=4;} //0.421940928������ Ŭ�ν� ������Ʈ
					case(220){itemString = `id:40033 `; iCumRate +=4;} //0.421940928Ŭ���̸��
					case(221){itemString = `id:40011 `; iCumRate +=4;} //0.421940928��ε� �ҵ�
					case(222){itemString = `id:40030 `; iCumRate +=4;} //0.421940928�� �ڵ�� �ҵ�
					case(223){itemString = `id:40012 `; iCumRate +=4;} //0.421940928�ٽ�Ÿ�� �ҵ�
					case(224){itemString = `id:40007 `; iCumRate +=4;} //0.421940928�Ѽյ���
					case(225){itemString = `id:40014 `; iCumRate +=4;} //0.421940928������ ����
					case(226){itemString = `id:40078 `; iCumRate +=4;} //0.421940928����Ͻ�
					case(227){itemString = `id:40080 `; iCumRate +=4;} //0.421940928�۶��콺
					case(228){itemString = `id:40006 `; iCumRate +=4;} //0.421940928�ܰ�
					case(229){itemString = `id:40031 `; iCumRate +=4;} //0.421940928����
					case(230){itemString = `id:40081 `; iCumRate +=4;} //0.421940928���� �� ����
					case(231){itemString = `id:40079 `; iCumRate +=4;} //0.421940928���̽�
					case(232){itemString = `id:13043 `; iCumRate +=4;} //0.421940928���̴Ͼ� ������ ����(������)
					case(233){itemString = `id:13044 `; iCumRate +=4;} //0.421940928���̴Ͼ� ������ ����(������)
					case(234){itemString = `id:13045 `; iCumRate +=4;} //0.421940928�Ƹ��� �ƽ��� �Ƹ�(������)
					case(235){itemString = `id:13046 `; iCumRate +=4;} //0.421940928�Ƹ��� �ƽ��� �Ƹ�(������)
					case(236){itemString = `id:14019 `; iCumRate +=4;} //0.421940928�׷��̽� �÷���Ʈ �Ƹ�
					case(237){itemString = `id:13031 `; iCumRate +=4;} //0.421940928������ī �ǹ� �÷���Ʈ �Ƹ�
					case(238){itemString = `id:13022 `; iCumRate +=4;} //0.421940928���� �÷���Ʈ �Ƹ� (PŸ��)
					case(239){itemString = `id:40039 `; iCumRate +=4;} //0.421940928���̽� ����
					case(240){itemString = `id:40090 `; iCumRate +=4;} //0.421940928���� ����
					case(241){itemString = `id:40040 `; iCumRate +=4;} //0.421940928���̾� ����
					case(242){itemString = `id:40038 `; iCumRate +=4;} //0.421940928����Ʈ�� ����
					case(243){itemString = `id:18542 `; iCumRate +=4;} //0.421940928�� ü�� Ǯ �︧
					case(244){itemString = `id:18506 `; iCumRate +=4;} //0.421940928�� ���� �︧
					case(245){itemString = `id:14042 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� �Ƹ�
					case(246){itemString = `id:15155 `; iCumRate +=4;} //0.421940928�̵�ī�� ������ ����(������)
					case(247){itemString = `id:15156 `; iCumRate +=4;} //0.421940928�̵�ī�� ������ ����(������)
					case(248){itemString = `id:15151 `; iCumRate +=4;} //0.421940928���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(249){itemString = `id:15152 `; iCumRate +=4;} //0.421940928���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(250){itemString = `id:15153 `; iCumRate +=4;} //0.421940928���� �������� ��Ʈ(������)
					case(251){itemString = `id:15154 `; iCumRate +=4;} //0.421940928���� �������� ��Ʈ(������)
					case(252){itemString = `id:15157 `; iCumRate +=4;} //0.421940928���� ������ �Ǻ�(������)
					case(253){itemString = `id:15158 `; iCumRate +=4;} //0.421940928���� ������ �Ǻ�(������)
					case(254){itemString = `id:15115 `; iCumRate +=4;} //0.421940928���� �̴� ��ĿƮ
					case(255){itemString = `id:15059 `; iCumRate +=4;} //0.421940928��ũ�� ��ũž �ݹ���
					case(256){itemString = `id:15070 `; iCumRate +=4;} //0.421940928���̵� ���� �巹��
					case(257){itemString = `id:15074 `; iCumRate +=4;} //0.421940928���̽� ������ ��Ʈ
					case(258){itemString = `id:15061 `; iCumRate +=4;} //0.421940928���ṫ�� ��Ʈ�� Ʃ��
					case(259){itemString = `id:18045 `; iCumRate +=4;} //0.421940928����� ������ ����
					case(260){itemString = `id:18019 `; iCumRate +=4;} //0.421940928������ ���и���
					case(261){itemString = `id:18020 `; iCumRate +=4;} //0.421940928��� ���и���
					case(262){itemString = `id:18029 `; iCumRate +=4;} //0.421940928������ �Ȱ�
					case(263){itemString = `id:18028 `; iCumRate +=4;} //0.421940928���̽� �Ȱ�
					case(264){itemString = `id:13010 `; iCumRate +=4;} //0.421940928���� ����� ü�θ���
					case(265){itemString = `id:14025 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(266){itemString = `id:14026 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(267){itemString = `id:16028 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ �۷���
					case(268){itemString = `id:17064 `; iCumRate +=4;} //0.421940928ī�� ���Ǹ�Ʈ ����
					case(269){itemString = `id:15131 `; iCumRate +=4;} //0.421940928�� �������� ��ĿƮ
					case(270){itemString = `id:2006 `; iCumRate +=4;} //0.421940928ū ��ȭ �ָӴ�
					case(271){itemString = `id:16534 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� ��Ʋ��
					case(272){itemString = `id:17524 `; iCumRate +=4;} //0.421940928�ý�ƾ ���� ����
					case(273){itemString = `id:13047 `; iCumRate +=4;} //0.421940928Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(274){itemString = `id:13048 `; iCumRate +=4;} //0.421940928Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(275){itemString = `id:14013 `; iCumRate +=4;} //0.421940928�θ�ī ���׸�ŸŸ��
					case(276){itemString = `id:14035 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� �Ƹ�
					case(277){itemString = `id:14038 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(278){itemString = `id:15028 `; iCumRate +=4;} //0.421940928�ڷ��� ������Ʈ
					case(279){itemString = `id:15042 `; iCumRate +=4;} //0.421940928�ճ� ���ǽ�
					case(280){itemString = `id:15052 `; iCumRate +=4;} //0.421940928��ũ�� ���� Ʃ��
					case(281){itemString = `id:15053 `; iCumRate +=4;} //0.421940928�÷�Į�� ���ǽ�
					case(282){itemString = `id:15128 `; iCumRate +=4;} //0.421940928�� �� ���� �巹��
					case(283){itemString = `id:15136 `; iCumRate +=4;} //0.421940928���谡 ��Ʈ
					case(284){itemString = `id:16008 `; iCumRate +=4;} //0.421940928�ڷ��� ���� �۷���
					case(285){itemString = `id:16019 `; iCumRate +=4;} //0.421940928�ٹ��� �ȸ� �尩
					case(286){itemString = `id:16040 `; iCumRate +=4;} //0.421940928�ݸ� �� �۷���
					case(287){itemString = `id:16505 `; iCumRate +=4;} //0.421940928�÷�Ʈ ��Ʋ��
					case(288){itemString = `id:16520 `; iCumRate +=4;} //0.421940928�� ���� �۷���
					case(289){itemString = `id:17040 `; iCumRate +=4;} //0.421940928���� ��Ʈ�� ����
					case(290){itemString = `id:17041 `; iCumRate +=4;} //0.421940928�������� ���ú���
					case(291){itemString = `id:17045 `; iCumRate +=4;} //0.421940928���� �� ���� ���� ����
					case(292){itemString = `id:17071 `; iCumRate +=4;} //0.421940928������ ����
					case(293){itemString = `id:17087 `; iCumRate +=4;} //0.421940928�ݸ� �� ����
					case(294){itemString = `id:17506 `; iCumRate +=4;} //0.421940928�ձ׸��� ����
					case(295){itemString = `id:17522 `; iCumRate +=4;} //0.421940928�Ǹ�Ÿ ���� ����
					case(296){itemString = `id:18008 `; iCumRate +=4;} //0.421940928��Ʈ������ ĸ
					case(297){itemString = `id:18038 `; iCumRate +=4;} //0.421940928���� �跿 ����
					case(298){itemString = `id:18047 `; iCumRate +=4;} //0.421940928�ڷ��� ��Ʈ ����
					case(299){itemString = `id:18513 `; iCumRate +=4;} //0.421940928������ũ ĸ
					case(300){itemString = `id:18515 `; iCumRate +=4;} //0.421940928Ʈ�� ȥ ĸ
					case(301){itemString = `id:18525 `; iCumRate +=4;} //0.421940928���͵�� ĸ
					case(302){itemString = `id:18543 `; iCumRate +=4;} //0.421940928���� Ǯ �︧
					case(303){itemString = `id:19020 `; iCumRate +=4;} //0.421940928��Ÿ�� ����� ��Ʈ
					case(304){itemString = `id:19029 `; iCumRate +=4;} //0.421940928���̾�Ʈ ���� �κ�
					case(305){itemString = `id:40015 `; iCumRate +=4;} //0.421940928�÷�Ʈ �� �ҵ�
					case(306){itemString = `id:40081 `; iCumRate +=4;} //0.421940928�� ����
					case(307){itemString = `id:46001 `; iCumRate +=4;} //0.421940928���� �ǵ�
					case(308){itemString = `id:46006 `; iCumRate +=4;} //0.421940928ī��Ʈ �ǵ�
					case(309){itemString = `id:40172 `; iCumRate +=4;} //0.421940928�׷���Ʈ �ҵ�
					case(310){itemString = `id:40174 `; iCumRate +=4;} //0.421940928��׽�Ÿ
					case(311){itemString = `id:40177 `; iCumRate +=4;} //0.421940928������ �׽�
					case(312){itemString = `id:40180 `; iCumRate +=4;} //0.421940928ȩ���� ��Ŭ
					case(313){itemString = `id:40041 `; iCumRate +=4;} //0.421940928Ÿ�ݿ� ����
					case(314){itemString = `id:16523 `; iCumRate +=4;} //0.421940928�׷��̽� ��Ʋ��
					case(315){itemString = `id:17515 `; iCumRate +=4;} //0.421940928�׷��̽� �׸���
					case(316){itemString = `id:18545 `; iCumRate +=4;} //0.421940928�׷��̽� ���
					case(317){itemString = `id:46007 `; iCumRate +=4;} //0.421940928���׷� ī��Ʈ �ǵ�
					case(318){itemString = `id:46008 `; iCumRate +=4;} //0.421940928����Ʈ ���׷� ī��Ʈ �ǵ�
					case(319){itemString = `id:51003 count:10`; iCumRate +=5;} //0.52742616����� 50 ����
					case(320){itemString = `id:51004 count:10`; iCumRate +=5;} //0.52742616����� 100 ����
					case(321){itemString = `id:51008 count:10`; iCumRate +=5;} //0.52742616���� 50 ����
					case(322){itemString = `id:51014 count:10`; iCumRate +=5;} //0.52742616���¹̳� 100 ����
					case(323){itemString = `id:51029 count:10`; iCumRate +=5;} //0.52742616����°� ���¹̳� 100 ����
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(92);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:13060 `; iCumRate +=1;} //1.086956522 �巡�� ������ �Ƹ�(������)
					case(1){itemString = `id:13061 `; iCumRate +=1;} //1.086956522 �巡�� ������ �Ƹ� (������)
					case(2){itemString = `id:13062 `; iCumRate +=1;} //1.086956522 �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(3){itemString = `id:13063 `; iCumRate +=1;} //1.086956522 �巡�� ������ �Ƹ�(���̾�Ʈ ������)
					case(4){itemString = `id:16543 `; iCumRate +=1;} //1.086956522 �巡�� ������ ��Ʋ��
					case(5){itemString = `id:16544 col1:685156 col2:685156 col3:ff9aed`; iCumRate +=1;} //1.086956522 �巡�� ������ ��Ʋ��(���̾�Ʈ��)
					case(6){itemString = `id:17530 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522 �巡�� ������ �׸���
					case(7){itemString = `id:18577 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522 �巡�� ������ �︧
					case(8){itemString = `id:15267 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522�׶� ��� Ǯ �巹��
					case(9){itemString = `id:15362 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522�׶� ��� ��ũ ��Ʈ
					case(10){itemString = `id:19033 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522��� �κ�
					case(11){itemString = `id:15405 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522�����׵� �мŴϽ�Ÿ �巹��
					case(12){itemString = `id:17039 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522�ڷ��� ťƮ ���� ����
					case(13){itemString = `id:13050 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522Ŭ��콺 ����Ʈ �Ƹ�
					case(14){itemString = `id:16551 prefix:21202`; iCumRate +=1;} //1.086956522Ŭ��콺 ����Ʈ ��Ʋ��
					case(15){itemString = `id:17534 prefix:21008`; iCumRate +=1;} //1.086956522Ŭ��콺 ����Ʈ ����
					case(16){itemString = `id:18549 suffix:31103`; iCumRate +=2;} //2.173913043 @�巡�� �縯�� �︧
					case(17){itemString = `id:46010 prefix:20825`; iCumRate +=2;} //2.173913043 @�巡�� �ǵ�
					case(18){itemString = `id:15373 durability:17000 durability_max:17000`; iCumRate +=2;} //2.173913043�ý��� Ĭ���� �巹��
					case(19){itemString = `id:18218 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043��Ƽ�� �ֵ�̷� ����(������)
					case(20){itemString = `id:18219col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043��Ƽ�� �ֵ�̷� ����(������)
					case(21){itemString = `id:17141col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043���̸� ����Ŀ ����
					case(22){itemString = `id:17154col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043������ ���� �ڵ� ����
					case(23){itemString = `id:18274col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043������ ��� ���
					case(24){itemString = `id:17153col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043���� ĳ�־� ����
					case(25){itemString = `id:18038col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043���� �跿 ����
					case(26){itemString = `id:18567col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043���� ����
					case(27){itemString = `id:15573 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565Ŭ���� Ŀ�� ��Ʈ(������)
					case(28){itemString = `id:15184 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565�׶� ���̼�Ʈ ���� ����
					case(29){itemString = `id:15066 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565���̽� ����Ʈ ����
					case(30){itemString = `id:15099 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565���ī ��ο��� ���̾�� ��ĿƮ
					case(31){itemString = `id:19038 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565��� Ĺ �κ�
					case(32){itemString = `id:19066 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565�ҷ��� ȣ�� �κ�
					case(33){itemString = `id:15113 `; iCumRate +=3;} //3.260869565������ �˻��б� ���� ��ƮŸ��
					case(34){itemString = `id:17120 `; iCumRate +=3;} //3.260869565����Ÿ �÷� ��Ŭ ����
					case(35){itemString = `id:16136 `; iCumRate +=3;} //3.260869565���̾� �Ƕ�̵� ���
					case(36){itemString = `id:15374 `; iCumRate +=3;} //3.260869565���̴� ��� ���� �巹��
					case(37){itemString = `id:15136 `; iCumRate +=3;} //3.260869565��� ���̽� ��ĿƮ
					case(38){itemString = `id:14032 `; iCumRate +=3;} //3.260869565��Ƽġ �� �κ� �Ƹ�
					case(39){itemString = `id:18199 `; iCumRate +=3;} //3.260869565������ �Ȱ�
					case(40){itemString = `id:40095 `; iCumRate +=3;} //3.260869565 @�巡�� ���̵�
					case(41){itemString = `id:91129 `; iCumRate +=3;} //3.260869565���� ��ų ����ġ 2�� ����
					case(42){itemString = `id:91130 `; iCumRate +=3;} //3.260869565���� ��ų ����ġ 2�� ����
					case(43){itemString = `id:91131 `; iCumRate +=3;} //3.260869565���ݼ� ��ų ����ġ 2�� ����
					case(44){itemString = `id:91070 `; iCumRate +=3;} //3.260869565���� ���ݷ� ���� ���� (30��)
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(133);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.751879699������ �κ� (������)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.751879699������ �κ� (������)
					case(2){itemString = `id:16554 `; iCumRate +=1;} //0.751879699������ ��Ʋ��
					case(3){itemString = `id:17551 `; iCumRate +=1;} //0.751879699������ �÷���Ʈ ����
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=1;} //0.751879699���� ����� ü�θ���
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=1;} //0.751879699���� �÷���Ʈ �Ƹ� (PŸ��)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=1;} //0.751879699������ī �ǹ� �÷���Ʈ �Ƹ�
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=1;} //0.751879699Ƽ���� �Ƹ�(������)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=1;} //0.751879699Ƽ���� �Ƹ�(������)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �۷���
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=1;} //0.751879699�ǹ� Ƽ�� �۷���
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=1;} //0.751879699�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=1;} //0.751879699Ƽ���� ��Ʋ��
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ ����
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=1;} //0.751879699������ī �ǹ� �÷���Ʈ ����
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=1;} //0.751879699�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=1;} //0.751879699Ƽ���� �׸���
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=1;} //0.751879699�巡�� ũ����Ʈ
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=1;} //0.751879699�Ź��� �ָӴϣ������÷���
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴϣ������÷���
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ� (�����÷���
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=1;} //0.751879699������ ���� �ָӴϣ������÷���
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=1;} //0.751879699�Ϲ� ���� �ָӴ� �ָӴϣ������÷���
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=1;} //0.751879699��� ���� �ָӴϣ������÷���
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=1;} //0.751879699�ְ�� ���� �ָӴϣ������÷���
					case(27){itemString = `id:80001 `; iCumRate +=1;} //0.751879699����� ��
					case(28){itemString = `id:80002 `; iCumRate +=1;} //0.751879699��ũ�� ��Ʈ
					case(29){itemString = `id:80003 `; iCumRate +=1;} //0.751879699������ ��Ʈ
					case(30){itemString = `id:80004 `; iCumRate +=1;} //0.751879699������ ����� �� ��
					case(31){itemString = `id:80005 `; iCumRate +=1;} //0.751879699������ �Ͼ�� �� ��
					case(32){itemString = `id:80006 `; iCumRate +=1;} //0.751879699������ ��ũ�� �� ��
					case(33){itemString = `id:51004 count:10`; iCumRate +=1;} //0.751879699����� 100 ����
					case(34){itemString = `id:51008 count:10`; iCumRate +=1;} //0.751879699���� 50 ����
					case(35){itemString = `id:51022 count:10`; iCumRate +=1;} //0.751879699����°� ���� 30 ����
					case(36){itemString = `id:51023 count:10`; iCumRate +=1;} //0.751879699����°� ���� 50 ����
					case(37){itemString = `id:51027 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 30 ����
					case(38){itemString = `id:51028 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 50 ����
					case(39){itemString = `id:51029 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 100 ����
					case(40){itemString = `id:60036 count:5`; iCumRate +=1;} //0.751879699���ο� ���̺� ����
					case(41){itemString = `id:60037 count:5`; iCumRate +=1;} //0.751879699�� ���� ����
					case(42){itemString = `id:60038 count:5`; iCumRate +=1;} //0.751879699���� ����
					case(43){itemString = `id:60040 count:5`; iCumRate +=1;} //0.751879699�׸� ���̺� ����
					case(44){itemString = `id:62004 count:5`; iCumRate +=1;} //0.751879699��������
					case(45){itemString = `id:63000 count:10`; iCumRate +=1;} //0.751879699�Ǵн��� ����
					case(46){itemString = `id:2041`; iCumRate +=1;} //0.751879699�Ź��� �ָӴ�
					case(47){itemString = `id:2042`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ�
					case(48){itemString = `id:2043`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ�
					case(49){itemString = `id:2044`; iCumRate +=1;} //0.751879699������ ���� �ָӴ�
					case(50){itemString = `id:2045`; iCumRate +=1;} //0.751879699�Ϲ� ���� �ָӴ� �ָӴ�
					case(51){itemString = `id:2046`; iCumRate +=1;} //0.751879699��� ���� �ָӴ�
					case(52){itemString = `id:2028`; iCumRate +=1;} //0.751879699���� �ָӴ�
					case(53){itemString = `id:51009 count:10`; iCumRate +=1;} //0.751879699���� 100 ����
					case(54){itemString = `id:2006 `; iCumRate +=1;} //0.751879699ū ��ȭ �ָӴ�
					case(55){itemString = `id:14042 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� �Ƹ�
					case(56){itemString = `id:16534 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� ��Ʋ��
					case(57){itemString = `id:17524 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� ����
					case(58){itemString = `id:13047 `; iCumRate +=1;} //0.751879699Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(59){itemString = `id:13048 `; iCumRate +=1;} //0.751879699Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(60){itemString = `id:14005 `; iCumRate +=1;} //0.751879699������� ��������
					case(61){itemString = `id:14011 `; iCumRate +=1;} //0.751879699������� ��������
					case(62){itemString = `id:14013 `; iCumRate +=1;} //0.751879699�θ�ī ���׸�ŸŸ��
					case(63){itemString = `id:14019 `; iCumRate +=1;} //0.751879699�׷��̽� �÷���Ʈ �Ƹ�
					case(64){itemString = `id:14035 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� �Ƹ�
					case(65){itemString = `id:14038 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(66){itemString = `id:15014 `; iCumRate +=1;} //0.751879699�Ĺ߲��� ��
					case(67){itemString = `id:15028 `; iCumRate +=1;} //0.751879699�ڷ��� ������Ʈ
					case(68){itemString = `id:15042 `; iCumRate +=1;} //0.751879699�ճ� ���ǽ�
					case(69){itemString = `id:15052 `; iCumRate +=1;} //0.751879699��ũ�� ���� Ʃ��
					case(70){itemString = `id:15053 `; iCumRate +=1;} //0.751879699�÷�Į�� ���ǽ�
					case(71){itemString = `id:15055 `; iCumRate +=1;} //0.751879699���� �̴� ���ǽ�
					case(72){itemString = `id:15057 `; iCumRate +=1;} //0.751879699�� ���� ��Ʈ (����)
					case(73){itemString = `id:15070 `; iCumRate +=1;} //0.751879699���ĵ�Į�� �����긮��
					case(74){itemString = `id:15128 `; iCumRate +=1;} //0.751879699�� �� ���� �巹��
					case(75){itemString = `id:15135 `; iCumRate +=1;} //0.751879699��ũ ��Ʈ
					case(76){itemString = `id:15136 `; iCumRate +=1;} //0.751879699���谡 ��Ʈ
					case(77){itemString = `id:15153 `; iCumRate +=1;} //0.751879699���� �������� ��Ʈ(������)
					case(78){itemString = `id:15154 `; iCumRate +=1;} //0.751879699���� �������� ��Ʈ(������)
					case(79){itemString = `id:15230 `; iCumRate +=1;} //0.751879699������ �۷� üũ ��ĿƮ
					case(80){itemString = `id:16008 `; iCumRate +=1;} //0.751879699�ڷ��� ���� �۷���
					case(81){itemString = `id:16019 `; iCumRate +=1;} //0.751879699�ٹ��� �ȸ� �尩
					case(82){itemString = `id:16028 `; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �۷���
					case(83){itemString = `id:16040 `; iCumRate +=1;} //0.751879699�ݸ� �� �۷���
					case(84){itemString = `id:16505 `; iCumRate +=1;} //0.751879699�÷�Ʈ ��Ʋ��
					case(85){itemString = `id:16520 `; iCumRate +=1;} //0.751879699�� ���� �۷���
					case(86){itemString = `id:17040 `; iCumRate +=1;} //0.751879699���� ��Ʈ�� ����
					case(87){itemString = `id:17041 `; iCumRate +=1;} //0.751879699�������� ���ú���
					case(88){itemString = `id:17045 `; iCumRate +=1;} //0.751879699���� �� ���� ���� ����
					case(89){itemString = `id:17071 `; iCumRate +=1;} //0.751879699������ ����
					case(90){itemString = `id:17087 `; iCumRate +=1;} //0.751879699�ݸ� �� ����
					case(91){itemString = `id:17506 `; iCumRate +=1;} //0.751879699�ձ׸��� ����
					case(92){itemString = `id:17522 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� ����
					case(93){itemString = `id:18008 `; iCumRate +=1;} //0.751879699��Ʈ������ ĸ
					case(94){itemString = `id:18023 `; iCumRate +=1;} //0.751879699��� ���� ĸ
					case(95){itemString = `id:18028 `; iCumRate +=1;} //0.751879699���̽� �Ȱ�
					case(96){itemString = `id:18029 `; iCumRate +=1;} //0.751879699������ �Ȱ�
					case(97){itemString = `id:18038 `; iCumRate +=1;} //0.751879699���� �跿 ����
					case(98){itemString = `id:18040 `; iCumRate +=1;} //0.751879699�ڷ��� ���� ������
					case(99){itemString = `id:18047 `; iCumRate +=1;} //0.751879699�ڷ��� ��Ʈ ����
					case(100){itemString = `id:18502 `; iCumRate +=1;} //0.751879699�� �︧
					case(101){itemString = `id:18506 `; iCumRate +=1;} //0.751879699�� ���� �︧
					case(102){itemString = `id:18511 `; iCumRate +=1;} //0.751879699�÷�Ʈ Ǯ �︧
					case(103){itemString = `id:18513 `; iCumRate +=1;} //0.751879699������ũ ĸ
					case(104){itemString = `id:18515 `; iCumRate +=1;} //0.751879699Ʈ�� ȥ ĸ
					case(105){itemString = `id:18525 `; iCumRate +=1;} //0.751879699���͵�� ĸ
					case(106){itemString = `id:18542 `; iCumRate +=1;} //0.751879699�� ü�� Ǯ �︧
					case(107){itemString = `id:18543 `; iCumRate +=1;} //0.751879699���� Ǯ �︧
					case(108){itemString = `id:19005 `; iCumRate +=1;} //0.751879699���÷� �κ�
					case(109){itemString = `id:19007 `; iCumRate +=1;} //0.751879699�߱� ���÷� �κ�
					case(110){itemString = `id:19020 `; iCumRate +=1;} //0.751879699��Ÿ�� ����� ��Ʈ
					case(111){itemString = `id:19029 `; iCumRate +=1;} //0.751879699���̾�Ʈ ���� �κ�
					case(112){itemString = `id:19034 `; iCumRate +=1;} //0.751879699������ Ŭ�ν� ������Ʈ
					case(113){itemString = `id:40014 `; iCumRate +=1;} //0.751879699������ ����
					case(114){itemString = `id:40015 `; iCumRate +=1;} //0.751879699�÷�Ʈ �� �ҵ�
					case(115){itemString = `id:40030 `; iCumRate +=1;} //0.751879699�� �ڵ�� �ҵ�
					case(116){itemString = `id:40031 `; iCumRate +=1;} //0.751879699����
					case(117){itemString = `id:40038 `; iCumRate +=1;} //0.751879699����Ʈ�� ����
					case(118){itemString = `id:40039 `; iCumRate +=1;} //0.751879699���̽� ����
					case(119){itemString = `id:40040 `; iCumRate +=1;} //0.751879699���̾� ����
					case(120){itemString = `id:40041 `; iCumRate +=1;} //0.751879699Ÿ�ݿ� ����
					case(121){itemString = `id:40079 `; iCumRate +=1;} //0.751879699���̽�
					case(122){itemString = `id:40081 `; iCumRate +=1;} //0.751879699���� �� ����
					case(123){itemString = `id:40090 `; iCumRate +=1;} //0.751879699���� ����
					case(124){itemString = `id:46001  `; iCumRate +=1;} //0.751879699���� �ǵ�
					case(125){itemString = `id:46006 `; iCumRate +=1;} //0.751879699ī��Ʈ �ǵ�
					case(126){itemString = `id:40172 `; iCumRate +=1;} //0.751879699�׷���Ʈ �ҵ�
					case(127){itemString = `id:40174 `; iCumRate +=1;} //0.751879699��׽�Ÿ
					case(128){itemString = `id:40177 `; iCumRate +=1;} //0.751879699������ �׽�
					case(129){itemString = `id:40180 `; iCumRate +=1;} //0.751879699ȩ���� ��Ŭ
					case(130){itemString = `id:85056`; iCumRate +=1;} //0.751879699�ְ�� ������ ũ����Ż
					case(131){itemString = `id:85055`; iCumRate +=1;} //0.751879699��� ������ ũ����Ż
					case(132){itemString = `id:85054`; iCumRate +=1;} //0.751879699������ ũ����Ż
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(133);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.751879699������ �κ� (������)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.751879699������ �κ� (������)
					case(2){itemString = `id:16554 `; iCumRate +=1;} //0.751879699������ ��Ʋ��
					case(3){itemString = `id:17551 `; iCumRate +=1;} //0.751879699������ �÷���Ʈ ����
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=1;} //0.751879699���� ����� ü�θ���
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=1;} //0.751879699���� �÷���Ʈ �Ƹ� (PŸ��)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=1;} //0.751879699������ī �ǹ� �÷���Ʈ �Ƹ�
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=1;} //0.751879699Ƽ���� �Ƹ�(������)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=1;} //0.751879699Ƽ���� �Ƹ�(������)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �۷���
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=1;} //0.751879699�ǹ� Ƽ�� �۷���
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=1;} //0.751879699�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=1;} //0.751879699Ƽ���� ��Ʋ��
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ ����
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=1;} //0.751879699������ī �ǹ� �÷���Ʈ ����
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=1;} //0.751879699�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=1;} //0.751879699Ƽ���� �׸���
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=1;} //0.751879699�巡�� ũ����Ʈ
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=1;} //0.751879699�Ź��� �ָӴϣ������÷���
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴϣ������÷���
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ� (�����÷���
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=1;} //0.751879699������ ���� �ָӴϣ������÷���
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=1;} //0.751879699�Ϲ� ���� �ָӴ� �ָӴϣ������÷���
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=1;} //0.751879699��� ���� �ָӴϣ������÷���
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=1;} //0.751879699�ְ�� ���� �ָӴϣ������÷���
					case(27){itemString = `id:80001 `; iCumRate +=1;} //0.751879699����� ��
					case(28){itemString = `id:80002 `; iCumRate +=1;} //0.751879699��ũ�� ��Ʈ
					case(29){itemString = `id:80003 `; iCumRate +=1;} //0.751879699������ ��Ʈ
					case(30){itemString = `id:80004 `; iCumRate +=1;} //0.751879699������ ����� �� ��
					case(31){itemString = `id:80005 `; iCumRate +=1;} //0.751879699������ �Ͼ�� �� ��
					case(32){itemString = `id:80006 `; iCumRate +=1;} //0.751879699������ ��ũ�� �� ��
					case(33){itemString = `id:51004 count:10`; iCumRate +=1;} //0.751879699����� 100 ����
					case(34){itemString = `id:51008 count:10`; iCumRate +=1;} //0.751879699���� 50 ����
					case(35){itemString = `id:51022 count:10`; iCumRate +=1;} //0.751879699����°� ���� 30 ����
					case(36){itemString = `id:51023 count:10`; iCumRate +=1;} //0.751879699����°� ���� 50 ����
					case(37){itemString = `id:51027 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 30 ����
					case(38){itemString = `id:51028 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 50 ����
					case(39){itemString = `id:51029 count:10`; iCumRate +=1;} //0.751879699����°� ���¹̳� 100 ����
					case(40){itemString = `id:60036 count:5`; iCumRate +=1;} //0.751879699���ο� ���̺� ����
					case(41){itemString = `id:60037 count:5`; iCumRate +=1;} //0.751879699�� ���� ����
					case(42){itemString = `id:60038 count:5`; iCumRate +=1;} //0.751879699���� ����
					case(43){itemString = `id:60040 count:5`; iCumRate +=1;} //0.751879699�׸� ���̺� ����
					case(44){itemString = `id:62004 count:5`; iCumRate +=1;} //0.751879699��������
					case(45){itemString = `id:63000 count:10`; iCumRate +=1;} //0.751879699�Ǵн��� ����
					case(46){itemString = `id:2041`; iCumRate +=1;} //0.751879699�Ź��� �ָӴ�
					case(47){itemString = `id:2042`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ�
					case(48){itemString = `id:2043`; iCumRate +=1;} //0.751879699���� �ǹ�ġ �ָӴ�
					case(49){itemString = `id:2044`; iCumRate +=1;} //0.751879699������ ���� �ָӴ�
					case(50){itemString = `id:2045`; iCumRate +=1;} //0.751879699�Ϲ� ���� �ָӴ� �ָӴ�
					case(51){itemString = `id:2046`; iCumRate +=1;} //0.751879699��� ���� �ָӴ�
					case(52){itemString = `id:2028`; iCumRate +=1;} //0.751879699���� �ָӴ�
					case(53){itemString = `id:51009 count:10`; iCumRate +=1;} //0.751879699���� 100 ����
					case(54){itemString = `id:2006 `; iCumRate +=1;} //0.751879699ū ��ȭ �ָӴ�
					case(55){itemString = `id:14042 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� �Ƹ�
					case(56){itemString = `id:16534 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� ��Ʋ��
					case(57){itemString = `id:17524 `; iCumRate +=1;} //0.751879699�ý�ƾ ���� ����
					case(58){itemString = `id:13047 `; iCumRate +=1;} //0.751879699Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(59){itemString = `id:13048 `; iCumRate +=1;} //0.751879699Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(60){itemString = `id:14005 `; iCumRate +=1;} //0.751879699������� ��������
					case(61){itemString = `id:14011 `; iCumRate +=1;} //0.751879699������� ��������
					case(62){itemString = `id:14013 `; iCumRate +=1;} //0.751879699�θ�ī ���׸�ŸŸ��
					case(63){itemString = `id:14019 `; iCumRate +=1;} //0.751879699�׷��̽� �÷���Ʈ �Ƹ�
					case(64){itemString = `id:14035 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� �Ƹ�
					case(65){itemString = `id:14038 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(66){itemString = `id:15014 `; iCumRate +=1;} //0.751879699�Ĺ߲��� ��
					case(67){itemString = `id:15028 `; iCumRate +=1;} //0.751879699�ڷ��� ������Ʈ
					case(68){itemString = `id:15042 `; iCumRate +=1;} //0.751879699�ճ� ���ǽ�
					case(69){itemString = `id:15052 `; iCumRate +=1;} //0.751879699��ũ�� ���� Ʃ��
					case(70){itemString = `id:15053 `; iCumRate +=1;} //0.751879699�÷�Į�� ���ǽ�
					case(71){itemString = `id:15055 `; iCumRate +=1;} //0.751879699���� �̴� ���ǽ�
					case(72){itemString = `id:15057 `; iCumRate +=1;} //0.751879699�� ���� ��Ʈ (����)
					case(73){itemString = `id:15070 `; iCumRate +=1;} //0.751879699���ĵ�Į�� �����긮��
					case(74){itemString = `id:15128 `; iCumRate +=1;} //0.751879699�� �� ���� �巹��
					case(75){itemString = `id:15135 `; iCumRate +=1;} //0.751879699��ũ ��Ʈ
					case(76){itemString = `id:15136 `; iCumRate +=1;} //0.751879699���谡 ��Ʈ
					case(77){itemString = `id:15153 `; iCumRate +=1;} //0.751879699���� �������� ��Ʈ(������)
					case(78){itemString = `id:15154 `; iCumRate +=1;} //0.751879699���� �������� ��Ʈ(������)
					case(79){itemString = `id:15230 `; iCumRate +=1;} //0.751879699������ �۷� üũ ��ĿƮ
					case(80){itemString = `id:16008 `; iCumRate +=1;} //0.751879699�ڷ��� ���� �۷���
					case(81){itemString = `id:16019 `; iCumRate +=1;} //0.751879699�ٹ��� �ȸ� �尩
					case(82){itemString = `id:16028 `; iCumRate +=1;} //0.751879699ī�� ���Ǹ�Ʈ �۷���
					case(83){itemString = `id:16040 `; iCumRate +=1;} //0.751879699�ݸ� �� �۷���
					case(84){itemString = `id:16505 `; iCumRate +=1;} //0.751879699�÷�Ʈ ��Ʋ��
					case(85){itemString = `id:16520 `; iCumRate +=1;} //0.751879699�� ���� �۷���
					case(86){itemString = `id:17040 `; iCumRate +=1;} //0.751879699���� ��Ʈ�� ����
					case(87){itemString = `id:17041 `; iCumRate +=1;} //0.751879699�������� ���ú���
					case(88){itemString = `id:17045 `; iCumRate +=1;} //0.751879699���� �� ���� ���� ����
					case(89){itemString = `id:17071 `; iCumRate +=1;} //0.751879699������ ����
					case(90){itemString = `id:17087 `; iCumRate +=1;} //0.751879699�ݸ� �� ����
					case(91){itemString = `id:17506 `; iCumRate +=1;} //0.751879699�ձ׸��� ����
					case(92){itemString = `id:17522 `; iCumRate +=1;} //0.751879699�Ǹ�Ÿ ���� ����
					case(93){itemString = `id:18008 `; iCumRate +=1;} //0.751879699��Ʈ������ ĸ
					case(94){itemString = `id:18023 `; iCumRate +=1;} //0.751879699��� ���� ĸ
					case(95){itemString = `id:18028 `; iCumRate +=1;} //0.751879699���̽� �Ȱ�
					case(96){itemString = `id:18029 `; iCumRate +=1;} //0.751879699������ �Ȱ�
					case(97){itemString = `id:18038 `; iCumRate +=1;} //0.751879699���� �跿 ����
					case(98){itemString = `id:18040 `; iCumRate +=1;} //0.751879699�ڷ��� ���� ������
					case(99){itemString = `id:18047 `; iCumRate +=1;} //0.751879699�ڷ��� ��Ʈ ����
					case(100){itemString = `id:18502 `; iCumRate +=1;} //0.751879699�� �︧
					case(101){itemString = `id:18506 `; iCumRate +=1;} //0.751879699�� ���� �︧
					case(102){itemString = `id:18511 `; iCumRate +=1;} //0.751879699�÷�Ʈ Ǯ �︧
					case(103){itemString = `id:18513 `; iCumRate +=1;} //0.751879699������ũ ĸ
					case(104){itemString = `id:18515 `; iCumRate +=1;} //0.751879699Ʈ�� ȥ ĸ
					case(105){itemString = `id:18525 `; iCumRate +=1;} //0.751879699���͵�� ĸ
					case(106){itemString = `id:18542 `; iCumRate +=1;} //0.751879699�� ü�� Ǯ �︧
					case(107){itemString = `id:18543 `; iCumRate +=1;} //0.751879699���� Ǯ �︧
					case(108){itemString = `id:19005 `; iCumRate +=1;} //0.751879699���÷� �κ�
					case(109){itemString = `id:19007 `; iCumRate +=1;} //0.751879699�߱� ���÷� �κ�
					case(110){itemString = `id:19020 `; iCumRate +=1;} //0.751879699��Ÿ�� ����� ��Ʈ
					case(111){itemString = `id:19029 `; iCumRate +=1;} //0.751879699���̾�Ʈ ���� �κ�
					case(112){itemString = `id:19034 `; iCumRate +=1;} //0.751879699������ Ŭ�ν� ������Ʈ
					case(113){itemString = `id:40014 `; iCumRate +=1;} //0.751879699������ ����
					case(114){itemString = `id:40015 `; iCumRate +=1;} //0.751879699�÷�Ʈ �� �ҵ�
					case(115){itemString = `id:40030 `; iCumRate +=1;} //0.751879699�� �ڵ�� �ҵ�
					case(116){itemString = `id:40031 `; iCumRate +=1;} //0.751879699����
					case(117){itemString = `id:40038 `; iCumRate +=1;} //0.751879699����Ʈ�� ����
					case(118){itemString = `id:40039 `; iCumRate +=1;} //0.751879699���̽� ����
					case(119){itemString = `id:40040 `; iCumRate +=1;} //0.751879699���̾� ����
					case(120){itemString = `id:40041 `; iCumRate +=1;} //0.751879699Ÿ�ݿ� ����
					case(121){itemString = `id:40079 `; iCumRate +=1;} //0.751879699���̽�
					case(122){itemString = `id:40081 `; iCumRate +=1;} //0.751879699���� �� ����
					case(123){itemString = `id:40090 `; iCumRate +=1;} //0.751879699���� ����
					case(124){itemString = `id:46001  `; iCumRate +=1;} //0.751879699���� �ǵ�
					case(125){itemString = `id:46006 `; iCumRate +=1;} //0.751879699ī��Ʈ �ǵ�
					case(126){itemString = `id:40172 `; iCumRate +=1;} //0.751879699�׷���Ʈ �ҵ�
					case(127){itemString = `id:40174 `; iCumRate +=1;} //0.751879699��׽�Ÿ
					case(128){itemString = `id:40177 `; iCumRate +=1;} //0.751879699������ �׽�
					case(129){itemString = `id:40180 `; iCumRate +=1;} //0.751879699ȩ���� ��Ŭ
					case(130){itemString = `id:85056`; iCumRate +=1;} //0.751879699�ְ�� ������ ũ����Ż
					case(131){itemString = `id:85055`; iCumRate +=1;} //0.751879699��� ������ ũ����Ż
					case(132){itemString = `id:85054`; iCumRate +=1;} //0.751879699������ ũ����Ż
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
	}

	return ``;
}