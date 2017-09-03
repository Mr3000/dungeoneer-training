//////////////////////////////////////////////////////////////////////////////////
// Mabinogi Project : Use Item Script
// ������ ������ �̺�Ʈ �Լ�
//
// nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
// nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : �����ۿ� �ƹ� ����� ������
// isusable�̰� stringid�� '/script/'�� �����ϰ� �ִ� �������� ������� ��
// �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	//�̱� ���� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(2746);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:40255  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 �ĳ��ɾ�
			case(1){itemString = `id:40253  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ��Ż ���̽�
			case(2){itemString = `id:40254  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ������ ���̾�
			case(3){itemString = `id:40251  col1:000000 col2:0E00B0 col3:000000`; iCumRate += 3;} //0.1092498179 Į�Ǵ���
			case(4){itemString = `id:40249  col1:000000 col2:0E00B0 col3:000000`; iCumRate += 3;} //0.1092498179 �ĸ� ���̽�
			case(5){itemString = `id:40250  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 ��Ż ���̾�
			case(6){itemString = `id:40252  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �̹̼� ����Ʈ��
			case(7){itemString = `id:15298  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 ��ó���� �������
			case(8){itemString = `id:16537  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 Ŭ��콺 ����Ʈ ��Ʋ��
			case(9){itemString = `id:17119  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 Ŭ��콺 ����Ʈ ����
			case(10){itemString = `id:13051  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �ٽ� ��ɷ� ����Ʈ�Ƹ�
			case(11){itemString = `id:16538  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �ٽ� ��ɷ� ��Ʋ��
			case(12){itemString = `id:17527  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �ٽ� ��ɷ� �׸���
			case(13){itemString = `id:13035 prefix:21202 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �븮�� ����Ʈ ��ī ü�θ���
			case(14){itemString = `id:40005 prefix:21008 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ��ũ��ġ ���ҵ�
			case(15){itemString = `id:40081 suffix:31103 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ������ũ ���� �� ����
			case(16){itemString = `id:16005 prefix:20825 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ��� �ϵ� ����÷���Ʈ ĳ��
			case(17){itemString = `id:40095 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �巡�� ���̵�
			case(18){itemString = `id:40172 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 �׷���Ʈ �ҵ�
			case(19){itemString = `id:40173 durability:16000 durability_max:16000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 Ŭ����
			case(20){itemString = `id:40177 durability:19000 durability_max:19000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 ������ �׽�
			case(21){itemString = `id:40176 durability:21000 durability_max:21000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 ��Ʋ �ظ�
			case(22){itemString = `id:40179 durability:22000 durability_max:22000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 ������ũ�� ��Ŭ
			case(23){itemString = `id:40180 durability:24000 durability_max:24000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ȩ���� ��Ŭ
			case(24){itemString = `id:14035 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �Ǹ�Ÿ ���� �Ƹ�
			case(25){itemString = `id:14042 durability:23000 durability_max:23000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �ý�ƾ ���� �Ƹ�
			case(26){itemString = `id:40003 durability:11000 durability_max:11000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 �� ����
			case(27){itemString = `id:40005 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �� �ҵ�
			case(28){itemString = `id:40006 durability:13000 durability_max:13000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 �ܰ�
			case(29){itemString = `id:40010 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �� �ҵ�
			case(30){itemString = `id:40011 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ��ε� �ҵ�
			case(31){itemString = `id:40012 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �ٽ�Ÿ�� �ҵ�
			case(32){itemString = `id:40013 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �� ����
			case(33){itemString = `id:40014 durability:15000 durability_max:15000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 ������ ����
			case(34){itemString = `id:40015 durability:18000 durability_max:18000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �÷�Ʈ �� �ҵ�
			case(35){itemString = `id:40016 durability:19000 durability_max:19000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 �ظ�
			case(36){itemString = `id:40030 durability:17000 durability_max:17000 col1:000000`; iCumRate += 2;} //0.0728332119 �� �ڵ�� �ҵ�
			case(37){itemString = `id:40031 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ����
			case(38){itemString = `id:40033 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ���̸��
			case(39){itemString = `id:40038 durability:15000 durability_max:15000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ����Ʈ�� ����
			case(40){itemString = `id:40039 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ���̽� ����
			case(41){itemString = `id:40040 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ���̾� ����
			case(42){itemString = `id:40041 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 Ÿ�ݿ� ����
			case(43){itemString = `id:40078 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ����Ͻ�
			case(44){itemString = `id:40079 durability:19000 durability_max:19000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 ���̽�
			case(45){itemString = `id:40080 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 �۶��콺
			case(46){itemString = `id:40081 durability:16000 durability_max:16000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 ���� �� ����
			case(47){itemString = `id:40083 durability:15000 durability_max:15000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 �� ĿƲ����
			case(48){itemString = `id:40090 durability:15000 durability_max:15000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 ���� ����
			case(49){itemString = `id:46001 durability:14000 durability_max:14000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ���� �ǵ�
			case(50){itemString = `id:46006 durability:20000 durability_max:20000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ī��Ʈ �ǵ�
			case(51){itemString = `id:40107 durability:23000 durability_max:23000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ����� ����
			case(52){itemString = `id:40171  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ���繫��
			case(53){itemString = `id:40193  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ���󸶻�
			case(54){itemString = `id:40195  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 ��ù���
			case(55){itemString = `id:40170  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �Ϻ��� ��հ�
			case(56){itemString = `id:40192  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �Ϻ��� �Ѽհ�
			case(57){itemString = `id:40194  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 �Ϻ��� �ܰ�
			case(58){itemString = `id:16524 col1:0000ff suffix:10706 `; iCumRate += 3;} //0.1092498179 ���� ����ƾ �ǹ� ����Ʈ ��극�̽��������÷���  
			case(59){itemString = `id:13032 col1:B63A88 col2:000000 col3:000000 suffix:30901  `; iCumRate += 3;} //0.1092498179 ��ũ�Ͻ� �߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(ҳ����) 
			case(60){itemString = `id:13033 col1:B63A88 col2:000000 col3:000000 suffix:30901  `; iCumRate += 3;} //0.1092498179 ��ũ�Ͻ� �߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������) 
			case(61){itemString = `id:40079 prefix:20701 suffix:30702 `; iCumRate += 3;} //0.1092498179 ��ģ ���̺� ���̽�
			case(62){itemString = `id:46007 col1:9999FF col2:CCCCFF col3:3333CC `; iCumRate += 5;} //0.1820830299 ���׷� ī��Ʈ �ǵ� (�����÷���
			case(63){itemString = `id:40006 col1:0092e8 col2:000000 col3:000000 `; iCumRate += 5;} //0.1820830299 �ܰ�(���� �÷�)    
			case(64){itemString = `id:40010 col1:ffffff col2:000000 col3:000000 `; iCumRate += 5;} //0.1820830299 �� �ҵ�(���� �÷�)  
			case(65){itemString = `id:40011 col1:e37def col2:9c12c9 col3:9c12c9 `; iCumRate += 5;} //0.1820830299 ��ε� �ҵ壨�����÷���
			case(66){itemString = `id:40013 col1:51b5ff col2:ff5411 col3:9df0ff `; iCumRate += 5;} //0.1820830299 �� ���죨�����÷���
			case(67){itemString = `id:40015 col1:20eaff col2:208dff col3:208dff `; iCumRate += 5;} //0.1820830299 �÷�Ʈ �� �ҵ壨�����÷���
			case(68){itemString = `id:40031 col1:9df0ff col2:9df0ff col3:9df0ff `; iCumRate += 5;} //0.1820830299 ���ã������÷���
			case(69){itemString = `id:40079 col1:ff45ff col2:ffffff col3:ffffff `; iCumRate += 5;} //0.1820830299 ���̽��������÷���
			case(70){itemString = `id:40080 col1:793ed4 col2:2e2e2f col3:2e2e2f `; iCumRate += 5;} //0.1820830299 �۶��콺 (���� �÷�)
			case(71){itemString = `id:40081 col1:121110 col2:aa7dff col3:121110 `; iCumRate += 5;} //0.1820830299 ���� �� ���죨�����÷���
			case(72){itemString = `id:40095 col1:9999FF col2:3333CC col3:FF99FF `; iCumRate += 5;} //0.1820830299 �巡�� ���̵壨�����÷���  
			case(73){itemString = `id:40107 col1:af3017 col2:af3017 col3:af3017 `; iCumRate += 5;} //0.1820830299 ����� ���죨�����÷���
			case(74){itemString = `id:40172 col1:383938 col2:1f2122 col3:1f2122 `; iCumRate += 5;} //0.1820830299 �׷���Ʈ �ҵ壨�����÷���
			case(75){itemString = `id:40173 col1:d40000 col2:ffd5c8 col3:000000 `; iCumRate += 5;} //0.1820830299 Ŭ�����������÷���
			case(76){itemString = `id:40176 col1:ffffff col2:ffffff col3:ffffff `; iCumRate += 5;} //0.1820830299 ��Ʋ �ظӣ������÷���
			case(77){itemString = `id:40001 quality:100 col1:b2ffb1 col2:85ff7a `; iCumRate += 5;} //0.1820830299 ���� ����⣨�����÷���
			case(78){itemString = `id:13038 col1:28B7D0 col2:383838 col3:e8e8e8 `; iCumRate += 5;} //0.1820830299 ����ƾ �ǹ� ����Ʈ �Ƹ�  �������÷���
			case(79){itemString = `id:18518 col1:248629 `; iCumRate += 5;} //0.1820830299 �巹�� ũ����Ʈ�������÷���  
			case(80){itemString = `id:14013 col1:ff0000 col2:000000 col3:ffffff `; iCumRate += 5;} //0.1820830299 �θ�ī ���׸�ŸŸ���������÷���
			case(81){itemString = `id:13022 col1:ff8000 col2:ffffa0 col3:000000 `; iCumRate += 5;} //0.1820830299 ���� �÷���Ʈ �Ƹ� (PŸ��)�������÷���
			case(82){itemString = `id:13023 col1:ebbe21 col2:ebbe21 col3:000000 `; iCumRate += 5;} //0.1820830299 ���� �÷���Ʈ �Ƹ� (BŸ��)�������÷���    
			case(83){itemString = `id:13046 col1:ffffff col2:ff80c0 col3:ffffff  `; iCumRate += 5;} //0.1820830299 �Ƹ��� �ƽ��� �Ƹ�(������)�������÷���  
			case(84){itemString = `id:14028 col1:2f8ec8 col2:2f8ec8 col3:ffffff  `; iCumRate += 5;} //0.1820830299 �����׹� ����(������) (�����÷���
			case(85){itemString = `id:14029 col1:ff80c0 col2:ffffff col3:ffffff  `; iCumRate += 5;} //0.1820830299 �����׹� ����(������) (�����÷���
			case(86){itemString = `id:62005 prefix:20716 `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (������)
			case(87){itemString = `id:62005 suffix:31002 `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (���)
			case(88){itemString = `id:62005 suffix:31103 `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (������ũ)
			case(89){itemString = `id:62005 prefix:8 `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (��������)
			case(90){itemString = `id:62005 suffix:30501  `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (���̾�Ʈ) 
			case(91){itemString = `id:62005 suffix:30302  `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (�ں�Ʈ) 
			case(92){itemString = `id:62005 suffix:30702  `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (���̺�) 
			case(93){itemString = `id:62005 prefix:207  `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (����) 
			case(94){itemString = `id:62005 prefix:7  `; iCumRate += 10;} //0.3641660597 ��æƮ ��ũ�� (��������) 
			case(95){itemString = `id:13035   `; iCumRate += 10;} //0.3641660597 ����Ʈ ��ī ü�θ���
			case(96){itemString = `id:13043   `; iCumRate += 10;} //0.3641660597 ���̴Ͼ� ������ ����(������)
			case(97){itemString = `id:13044   `; iCumRate += 10;} //0.3641660597 ���̴Ͼ� ������ ����(������)
			case(98){itemString = `id:13045   `; iCumRate += 10;} //0.3641660597 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(99){itemString = `id:13046   `; iCumRate += 10;} //0.3641660597 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(100){itemString = `id:13047   `; iCumRate += 10;} //0.3641660597 Ű�������� ���� �÷���Ʈ �Ƹ�(������))
			case(101){itemString = `id:13048   `; iCumRate += 10;} //0.3641660597 Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(102){itemString = `id:14028  `; iCumRate += 10;} //0.3641660597 �����׹� ����(������)
			case(103){itemString = `id:14029  `; iCumRate += 10;} //0.3641660597 �����׹� ����(������)
			case(104){itemString = `id:14036  `; iCumRate += 10;} //0.3641660597 Ƽ���� �Ƹ�(������)
			case(105){itemString = `id:14037  `; iCumRate += 10;} //0.3641660597 Ƽ���� �Ƹӣ������룩
			case(106){itemString = `id:14042  `; iCumRate += 10;} //0.3641660597 ���뫹�ƫ�쫶?��?��? 
			case(107){itemString = `id:16525   `; iCumRate += 10;} //0.3641660597 ����ë��嫢����ӫ󫬫�ȫ�ë�
			case(108){itemString = `id:16531  `; iCumRate += 10;} //0.3641660597 Ƽ���� �׸���
			case(109){itemString = `id:17518   `; iCumRate += 10;} //0.3641660597 �Ƹ��� �ƽ��� ����(������)
			case(110){itemString = `id:17519   `; iCumRate += 10;} //0.3641660597 �Ƹ��� �ƽ��� ����(������)
			case(111){itemString = `id:17523  `; iCumRate += 10;} //0.3641660597 Ƽ���� �׸���
			case(112){itemString = `id:46006   `; iCumRate += 10;} //0.3641660597 ī��Ʈ �ǵ�
			case(113){itemString = `id:46008   `; iCumRate += 10;} //0.3641660597 ����Ʈ ���׷� ī��Ʈ �ǵ�
			case(114){itemString = `id:91188  `; iCumRate += 10;} //0.3641660597 ��Ż ����Ʈ�� ���� ���� ŰƮ
			case(115){itemString = `id:14004   `; iCumRate += 20;} //0.7283321194 Ŭ�ν� ����
			case(116){itemString = `id:14005   `; iCumRate += 20;} //0.7283321194 ������� ��������
			case(117){itemString = `id:14006   `; iCumRate += 20;} //0.7283321194 ���� ����
			case(118){itemString = `id:14019   `; iCumRate += 20;} //0.7283321194 �׷��̽� �÷���Ʈ �Ƹ�
			case(119){itemString = `id:14023   `; iCumRate += 20;} //0.7283321194 �� ���� �Ƹ�(������)
			case(120){itemString = `id:14024   `; iCumRate += 20;} //0.7283321194 �� ���� �Ƹ�(������)
			case(121){itemString = `id:14035  `; iCumRate += 20;} //0.7283321194 �Ǹ�Ÿ ���� �Ƹ�
			case(122){itemString = `id:16000   `; iCumRate += 20;} //0.7283321194 ���� �۷���
			case(123){itemString = `id:16001   `; iCumRate += 20;} //0.7283321194 ���� �۷���
			case(124){itemString = `id:16002   `; iCumRate += 20;} //0.7283321194 ���� �۷���
			case(125){itemString = `id:16004   `; iCumRate += 20;} //0.7283321194 ���͵�� �극�̽���
			case(126){itemString = `id:16008   `; iCumRate += 20;} //0.7283321194 �ڷ��� ���� �۷���
			case(127){itemString = `id:16015   `; iCumRate += 20;} //0.7283321194 �극�̽���
			case(128){itemString = `id:16029   `; iCumRate += 20;} //0.7283321194 �쫶?���ƫë�����?��  
			case(129){itemString = `id:16500   `; iCumRate += 20;} //0.7283321194 �ﳪ �������� �۷���
			case(130){itemString = `id:16502   `; iCumRate += 20;} //0.7283321194 �÷���Ʈ ��Ʋ��
			case(131){itemString = `id:16505   `; iCumRate += 20;} //0.7283321194 �÷�Ʈ ��Ʋ��
			case(132){itemString = `id:16506   `; iCumRate += 20;} //0.7283321194 �� �۷���
			case(133){itemString = `id:16520   `; iCumRate += 20;} //0.7283321194 �� ���� �۷���
			case(134){itemString = `id:16523   `; iCumRate += 20;} //0.7283321194 �׷��̽� ��Ʋ��
			case(135){itemString = `id:17001   `; iCumRate += 20;} //0.7283321194 ���� ����
			case(136){itemString = `id:17002   `; iCumRate += 20;} //0.7283321194 �˻� �Ź�
			case(137){itemString = `id:17003   `; iCumRate += 20;} //0.7283321194 ���� �Ź�
			case(138){itemString = `id:17004   `; iCumRate += 20;} //0.7283321194 ���� �б� �Ź�
			case(139){itemString = `id:17005   `; iCumRate += 20;} //0.7283321194 ��ɲ� �Ź�
			case(140){itemString = `id:17015  `; iCumRate += 20;} //0.7283321194 �ʵ� �Ĺ��
			case(141){itemString = `id:17016   `; iCumRate += 20;} //0.7283321194 �ʵ� �Ĺ��
			case(142){itemString = `id:17017   `; iCumRate += 20;} //0.7283321194 ������Ʈ ����
			case(143){itemString = `id:17018   `; iCumRate += 20;} //0.7283321194 �˻� �Ź�
			case(144){itemString = `id:17019   `; iCumRate += 20;} //0.7283321194 �������� �Ź�
			case(145){itemString = `id:17020   `; iCumRate += 20;} //0.7283321194 ���� ����
			case(146){itemString = `id:17021   `; iCumRate += 20;} //0.7283321194 �θ�ī ����
			case(147){itemString = `id:17064   `; iCumRate += 20;} //0.7283321194 ī�� ���Ǹ�Ʈ ����
			case(148){itemString = `id:17503   `; iCumRate += 20;} //0.7283321194 �׸��� ����
			case(149){itemString = `id:17504   `; iCumRate += 20;} //0.7283321194 �������� �÷���Ʈ ����
			case(150){itemString = `id:17505   `; iCumRate += 20;} //0.7283321194 �÷���Ʈ ����
			case(151){itemString = `id:18500   `; iCumRate += 20;} //0.7283321194 �� ���� �︧
			case(152){itemString = `id:18501   `; iCumRate += 20;} //0.7283321194 ����� �︧
			case(153){itemString = `id:18502   `; iCumRate += 20;} //0.7283321194 �� �︧
			case(154){itemString = `id:18503   `; iCumRate += 20;} //0.7283321194 �����þ� �︧
			case(155){itemString = `id:18504   `; iCumRate += 20;} //0.7283321194 ũ�ν� Ǯ �︧
			case(156){itemString = `id:18505   `; iCumRate += 20;} //0.7283321194 ������ũ �︧
			case(157){itemString = `id:18506   `; iCumRate += 20;} //0.7283321194 �� ���� �︧
			case(158){itemString = `id:18509   `; iCumRate += 20;} //0.7283321194 �輭��
			case(159){itemString = `id:18511   `; iCumRate += 20;} //0.7283321194 �÷�Ʈ Ǯ �︧
			case(160){itemString = `id:18513   `; iCumRate += 20;} //0.7283321194 ������ũ ĸ
			case(161){itemString = `id:18514   `; iCumRate += 20;} //0.7283321194 �������̽� ĸ
			case(162){itemString = `id:18515   `; iCumRate += 20;} //0.7283321194 Ʈ�� ȥ ĸ
			case(163){itemString = `id:18516   `; iCumRate += 20;} //0.7283321194 �̺� ���� ũ���
			case(164){itemString = `id:18517   `; iCumRate += 20;} //0.7283321194 ���̾� ����ŷ �����
			case(165){itemString = `id:18518   `; iCumRate += 20;} //0.7283321194 �巡�� ũ����Ʈ  
			case(166){itemString = `id:18519   `; iCumRate += 20;} //0.7283321194 �ĳ��� ��� ��������
			case(167){itemString = `id:18520   `; iCumRate += 20;} //0.7283321194 ��ƿ �����
			case(168){itemString = `id:18521   `; iCumRate += 20;} //0.7283321194 �����Ǿ� ����
			case(169){itemString = `id:18522   `; iCumRate += 20;} //0.7283321194 �縮ĭ ��������
			case(170){itemString = `id:18523   `; iCumRate += 20;} //0.7283321194 ���� ���� ĸ
			case(171){itemString = `id:18524   `; iCumRate += 20;} //0.7283321194 �� ���� ĸ
			case(172){itemString = `id:18525   `; iCumRate += 20;} //0.7283321194 ���͵�� ĸ
			case(173){itemString = `id:18542   `; iCumRate += 20;} //0.7283321194 �� ü�� Ǯ �︧
			case(174){itemString = `id:18543   `; iCumRate += 20;} //0.7283321194 �� ���� Ǯ �︧
			case(175){itemString = `id:18544   `; iCumRate += 20;} //0.7283321194 �� �縮ĭ ��������
			case(176){itemString = `id:18545   `; iCumRate += 20;} //0.7283321194 �׷��̽� ���
			case(177){itemString = `id:18546   `; iCumRate += 20;} //0.7283321194 �븣�� ������ ���
			case(178){itemString = `id:18547   `; iCumRate += 20;} //0.7283321194 �� �ĳ��� ��� ��������
			case(179){itemString = `id:18551   `; iCumRate += 20;} //0.7283321194 �� ���� �︧
			case(180){itemString = `id:40003   `; iCumRate += 20;} //0.7283321194 �� ����
			case(181){itemString = `id:40005   `; iCumRate += 20;} //0.7283321194 �� �ҵ�
			case(182){itemString = `id:40006   `; iCumRate += 20;} //0.7283321194 �ܰ�
			case(183){itemString = `id:40010   `; iCumRate += 20;} //0.7283321194 �� �ҵ�
			case(184){itemString = `id:40011   `; iCumRate += 20;} //0.7283321194 ��ε� �ҵ�
			case(185){itemString = `id:40012   `; iCumRate += 20;} //0.7283321194 �ٽ�Ÿ�� �ҵ�
			case(186){itemString = `id:40013   `; iCumRate += 20;} //0.7283321194 �� ����
			case(187){itemString = `id:40014   `; iCumRate += 20;} //0.7283321194 ������ ����
			case(188){itemString = `id:40015   `; iCumRate += 20;} //0.7283321194 �÷�Ʈ �� �ҵ�
			case(189){itemString = `id:40016   `; iCumRate += 20;} //0.7283321194 �ظ�
			case(190){itemString = `id:40030   `; iCumRate += 20;} //0.7283321194 �� �ڵ�� �ҵ�
			case(191){itemString = `id:40031   `; iCumRate += 20;} //0.7283321194 ����
			case(192){itemString = `id:40033   `; iCumRate += 20;} //0.7283321194 ���̸��
			case(193){itemString = `id:40038   `; iCumRate += 20;} //0.7283321194 ����Ʈ�� ����
			case(194){itemString = `id:40039   `; iCumRate += 20;} //0.7283321194 ���̽� ����
			case(195){itemString = `id:40040   `; iCumRate += 20;} //0.7283321194 ���̾� ����
			case(196){itemString = `id:40041   `; iCumRate += 20;} //0.7283321194 Ÿ�ݿ� ����
			case(197){itemString = `id:40078   `; iCumRate += 20;} //0.7283321194 ����Ͻ�
			case(198){itemString = `id:40079   `; iCumRate += 20;} //0.7283321194 ���̽�
			case(199){itemString = `id:40080   `; iCumRate += 20;} //0.7283321194 �۶��콺
			case(200){itemString = `id:40081   `; iCumRate += 20;} //0.7283321194 ���� �� ����
			case(201){itemString = `id:40083   `; iCumRate += 20;} //0.7283321194 �� ĿƲ����
			case(202){itemString = `id:40090   `; iCumRate += 20;} //0.7283321194 ���� ����
			case(203){itemString = `id:40100   `; iCumRate += 20;} //0.7283321194 �� ���� �ҵ�
			case(204){itemString = `id:40172  `; iCumRate += 20;} //0.7283321194 �׷���Ʈ �ҵ�
			case(205){itemString = `id:40173  `; iCumRate += 20;} //0.7283321194 Ŭ����
			case(206){itemString = `id:40176  `; iCumRate += 20;} //0.7283321194 ��Ʋ �ظ�
			case(207){itemString = `id:40177  `; iCumRate += 20;} //0.7283321194 ������ �׽�
			case(208){itemString = `id:40179  `; iCumRate += 20;} //0.7283321194 ������ũ�� ��Ŭ
			case(209){itemString = `id:40180  `; iCumRate += 20;} //0.7283321194 ȩ���� ��Ŭ
			case(210){itemString = `id:46001   `; iCumRate += 20;} //0.7283321194 ���� �ǵ�
			case(211){itemString = `id:51031  count:3 `; iCumRate += 25;} //0.9104151493 ���� ȸ���� ����
			case(212){itemString = `id:63027  expire:10080 `; iCumRate += 25;} //0.9104151493 �ж� ����
			case(213){itemString = `id:51003  count:5 `; iCumRate += 25;} //0.9104151493 ����� ����50
			case(214){itemString = `id:51004  count:3 `; iCumRate += 25;} //0.9104151493 ����� ����100
			case(215){itemString = `id:51008  count:5 `; iCumRate += 25;} //0.9104151493 ���� ����50
			case(216){itemString = `id:51013  count:5 `; iCumRate += 25;} //0.9104151493 ���¹̳� ����50
			case(217){itemString = `id:51014  count:3 `; iCumRate += 25;} //0.9104151493 ���¹̳� ����100
			case(218){itemString = `id:51022  count:5 `; iCumRate += 25;} //0.9104151493 ����°� ���� ����30
			case(219){itemString = `id:51027  count:5 `; iCumRate += 25;} //0.9104151493 ����°� ���¹̳�30
			case(220){itemString = `id:51028  count:3 `; iCumRate += 25;} //0.9104151493 ����°� ���¹̳�50
			case(221){itemString = `id:63025  count:3 `; iCumRate += 25;} //0.9104151493 ��뷮 �ູ�� ����
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
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
