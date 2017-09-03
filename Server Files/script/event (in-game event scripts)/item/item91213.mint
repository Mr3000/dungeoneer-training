////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     ������ ������ �̺�Ʈ �Լ�
//
//                                           nicolas fecit, begins at 2006. 03. 14
//jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//	jooddang@nexon.co.kr
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
	int itemID = cItem.GetClassId();
	bool bLivingGachaphonGived = false;	//B�׷�
	{
		if ((GetLocale().LowerCase() == `japan`) || (GetLocale().LowerCase() == `usa`) || (GetLocale().LowerCase() == `taiwan`))
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3311);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:40170 `; iCumRate +=1;} //0.030202356�Ϻ��� ��հ�
					case(1){itemString = `id:14039 `; iCumRate +=1;} //0.030202356���̳� �巡�� �Ƹ�(�ΰ�)
					case(2){itemString = `id:14040 `; iCumRate +=1;} //0.030202356���̳� �巡�� �Ƹ�(����)
					case(3){itemString = `id:14041 `; iCumRate +=1;} //0.030202356���̳� �巡�� �Ƹ�(���̾�Ʈ)
					case(4){itemString = `id:16532 `; iCumRate +=1;} //0.030202356���̳� �巡�� ��Ʋ��(�ΰ�/���̾�Ʈ)
					case(5){itemString = `id:16533 `; iCumRate +=1;} //0.030202356���̳� �巡�� ��Ʋ��(����)
					case(6){itemString = `id:17095 `; iCumRate +=1;} //0.030202356���̳� �巡�� ����
					case(7){itemString = `id:18552 `; iCumRate +=1;} //0.030202356���̳� �巡�� �︧
					case(8){itemString = `id:13032 `; iCumRate +=2;} //0.060404712�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(9){itemString = `id:13033 `; iCumRate +=2;} //0.060404712�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(10){itemString = `id:16521 `; iCumRate +=2;} //0.060404712�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(11){itemString = `id:17514 `; iCumRate +=2;} //0.060404712�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(12){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712Ŭ���̸��
					case(13){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=2;} //0.060404712���� �� ����
					case(14){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712���� ����
					case(15){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712�۶��콺
					case(16){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712����Ʈ�� ����
					case(17){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712���̽� ����
					case(18){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712���̾� ����
					case(19){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712Ÿ�ݿ� ����
					case(20){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=2;} //0.060404712����Ͻ�
					case(21){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=2;} //0.060404712���̽�
					case(22){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712����
					case(23){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=2;} //0.060404712�� �ڵ�� �ҵ�
					case(24){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712�� ����
					case(25){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=2;} //0.060404712guardian bow
					case(26){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=2;} //0.060404712���׷� ī��Ʈ �ǵ�
					case(27){itemString = `id:18518 `; iCumRate +=5;} //0.151011779�巡�� ũ����Ʈ
					case(28){itemString = `id:15113 `; iCumRate +=5;} //0.151011779������ �˻��б� ���� ��ƮŸ��
					case(29){itemString = `id:15114 `; iCumRate +=5;} //0.151011779������ �˻��б� ���� ��Ÿ��
					case(30){itemString = `id:15065 `; iCumRate +=5;} //0.151011779���� ����Ʈ ��ĿƮ
					case(31){itemString = `id:19008 `; iCumRate +=5;} //0.151011779���� �Ǵ� �κ�
					case(32){itemString = `id:15137 `; iCumRate +=5;} //0.151011779������ ���� ��Ŷ ��Ʈ
					case(33){itemString = `id:18041 `; iCumRate +=5;} //0.151011779ū ì ���� ����
					case(34){itemString = `id:19009 `; iCumRate +=5;} //0.151011779���� ���� �κ�
					case(35){itemString = `id:18112 `; iCumRate +=5;} //0.151011779�� ���� ��ǰ
					case(36){itemString = `id:17015 `; iCumRate +=5;} //0.151011779Combat Shoes
					case(37){itemString = `id:15055 `; iCumRate +=5;} //0.151011779���� �̴� ���ǽ�
					case(38){itemString = `id:15057 `; iCumRate +=5;} //0.151011779�� ���� ��Ʈ (����)
					case(39){itemString = `id:14036 `; iCumRate +=5;} //0.151011779Ƽ���� �Ƹ�(������)
					case(40){itemString = `id:14037 `; iCumRate +=5;} //0.151011779Ƽ���� �Ƹ�(������)
					case(41){itemString = `id:16531 `; iCumRate +=5;} //0.151011779Ƽ���� ��Ʋ��
					case(42){itemString = `id:17523 `; iCumRate +=5;} //0.151011779Ƽ���� �׸���
					case(43){itemString = `id:15132 `; iCumRate +=5;} //0.151011779���߷� ����Ʈ ����
					case(44){itemString = `id:15070 `; iCumRate +=5;} //0.151011779���ĵ�Į�� �����긮��
					case(45){itemString = `id:15230 `; iCumRate +=5;} //0.151011779������ �۷� üũ ��ĿƮ
					case(46){itemString = `id:19034 `; iCumRate +=5;} //0.151011779������ Ŭ�ν� ������Ʈ
					case(47){itemString = `id:40033 `; iCumRate +=5;} //0.151011779Ŭ���̸��
					case(48){itemString = `id:13043 `; iCumRate +=5;} //0.151011779���̴Ͼ� ������ ����(������)
					case(49){itemString = `id:13044 `; iCumRate +=5;} //0.151011779���̴Ͼ� ������ ����(������)
					case(50){itemString = `id:13045 `; iCumRate +=5;} //0.151011779�Ƹ��� �ƽ��� �Ƹ�(������)
					case(51){itemString = `id:13046 `; iCumRate +=5;} //0.151011779�Ƹ��� �ƽ��� �Ƹ�(������)
					case(52){itemString = `id:14019 `; iCumRate +=5;} //0.151011779�׷��̽� �÷���Ʈ �Ƹ�
					case(53){itemString = `id:13031 `; iCumRate +=5;} //0.151011779������ī �ǹ� �÷���Ʈ �Ƹ�
					case(54){itemString = `id:13022 `; iCumRate +=5;} //0.151011779���� �÷���Ʈ �Ƹ� (PŸ��)
					case(55){itemString = `id:18542 `; iCumRate +=5;} //0.151011779�� ü�� Ǯ �︧
					case(56){itemString = `id:18506 `; iCumRate +=5;} //0.151011779�� ���� �︧
					case(57){itemString = `id:14042 `; iCumRate +=5;} //0.151011779�ý�ƾ ���� �Ƹ�
					case(58){itemString = `id:18045 `; iCumRate +=5;} //0.151011779����� ������ ����
					case(59){itemString = `id:13010 `; iCumRate +=5;} //0.151011779���� ����� ü�θ���
					case(60){itemString = `id:14025 `; iCumRate +=5;} //0.151011779ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(61){itemString = `id:14026 `; iCumRate +=5;} //0.151011779ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(62){itemString = `id:16028 `; iCumRate +=5;} //0.151011779ī�� ���Ǹ�Ʈ �۷���
					case(63){itemString = `id:16511 `; iCumRate +=5;} //0.151011779�ǹ� Ƽ�� �۷���
					case(64){itemString = `id:17064 `; iCumRate +=5;} //0.151011779ī�� ���Ǹ�Ʈ ����
					case(65){itemString = `id:16534 `; iCumRate +=5;} //0.151011779�ý�ƾ ���� ��Ʋ��
					case(66){itemString = `id:17524 `; iCumRate +=5;} //0.151011779�ý�ƾ ���� ����
					case(67){itemString = `id:13047 `; iCumRate +=5;} //0.151011779Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(68){itemString = `id:13048 `; iCumRate +=5;} //0.151011779Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(69){itemString = `id:14038 `; iCumRate +=5;} //0.151011779�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(70){itemString = `id:46012 `; iCumRate +=5;} //0.151011779û�� ����
					case(71){itemString = `id:18111 `; iCumRate +=5;} //0.151011779���� ���� ��ǰ
					case(72){itemString = `id:18110 `; iCumRate +=5;} //0.151011779���� ���� ��ǰ
					case(73){itemString = `id:18109 `; iCumRate +=5;} //0.151011779���� ���� ��ǰ
					case(74){itemString = `id:18108 `; iCumRate +=5;} //0.151011779���� ���� ��ǰ
					case(75){itemString = `id:40083 `; iCumRate +=5;} //0.151011779�� ĿƲ����
					case(76){itemString = `id:40032 `; iCumRate +=5;} //0.151011779������ �ҵ�
					case(77){itemString = `id:18544 `; iCumRate +=5;} //0.151011779�縮ĭ ��������
					case(78){itemString = `id:18547 `; iCumRate +=5;} //0.151011779�ĳ��� ��� ��������
					case(79){itemString = `id:18521 `; iCumRate +=5;} //0.151011779�����Ǿ� ����
					case(80){itemString = `id:18500 `; iCumRate +=5;} //0.151011779�� ���� �︧
					case(81){itemString = `id:18511 `; iCumRate +=5;} //0.151011779�÷�Ʈ Ǯ �︧
					case(82){itemString = `id:18502 `; iCumRate +=5;} //0.151011779�� �︧
					case(83){itemString = `id:19007 `; iCumRate +=5;} //0.151011779�߱� ���÷� �κ�
					case(84){itemString = `id:19017 `; iCumRate +=5;} //0.151011779���� �κ�
					case(85){itemString = `id:19016 `; iCumRate +=5;} //0.151011779�� �κ�
					case(86){itemString = `id:15112 `; iCumRate +=5;} //0.151011779������ �����̷�
					case(87){itemString = `id:18034 `; iCumRate +=5;} //0.151011779���� ������
					case(88){itemString = `id:18006 `; iCumRate +=5;} //0.151011779���������
					case(89){itemString = `id:18113 `; iCumRate +=5;} //0.151011779������ ����� ����
					case(90){itemString = `id:18114 `; iCumRate +=5;} //0.151011779�ٹ��� ����� ����
					case(91){itemString = `id:18115 `; iCumRate +=5;} //0.151011779�� ����� ����
					case(92){itemString = `id:18097 `; iCumRate +=5;} //0.151011779���̷� ���� ����
					case(93){itemString = `id:18098 `; iCumRate +=5;} //0.151011779���̷��� �Ȱ�
					case(94){itemString = `id:18099 `; iCumRate +=5;} //0.151011779���̷� ���� ���� ����
					case(95){itemString = `id:18100 `; iCumRate +=5;} //0.151011779���̷� ���� ����
					case(96){itemString = `id:18101 `; iCumRate +=5;} //0.151011779���̷� ���� ���� ����
					case(97){itemString = `id:18102 `; iCumRate +=5;} //0.151011779���̷��� ����
					case(98){itemString = `id:15055 `; iCumRate +=5;} //0.151011779���̷� ����� ����
					case(99){itemString = `id:18044 `; iCumRate +=5;} //0.151011779���˿� ����
					case(100){itemString = `id:40071 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(101){itemString = `id:40072 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(102){itemString = `id:40073 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(103){itemString = `id:40074 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(104){itemString = `id:40075 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(105){itemString = `id:40076 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(106){itemString = `id:40077 `; iCumRate +=10;} //0.302023558'��' �� �� ��
					case(107){itemString = `id:16517 `; iCumRate +=10;} //0.302023558�ݴ� �尩
					case(108){itemString = `id:16516 `; iCumRate +=10;} //0.302023558���� �尩
					case(109){itemString = `id:16515 `; iCumRate +=10;} //0.302023558�� �尩
					case(110){itemString = `id:16514 `; iCumRate +=10;} //0.302023558���� �尩
					case(111){itemString = `id:16513 `; iCumRate +=10;} //0.302023558���� �尩
					case(112){itemString = `id:40068 `; iCumRate +=10;} //0.302023558���� ��� ���ú�
					case(113){itemString = `id:40069 `; iCumRate +=10;} //0.302023558���� ��� ���ú�
					case(114){itemString = `id:40070 `; iCumRate +=10;} //0.302023558�� ��� ���ú�
					case(115){itemString = `id:14013 `; iCumRate +=10;} //0.302023558�θ�ī ���׸�ŸŸ��
					case(116){itemString = `id:14035 `; iCumRate +=10;} //0.302023558�Ǹ�Ÿ ���� �Ƹ�
					case(117){itemString = `id:40011 `; iCumRate +=15;} //0.453035337��ε� �ҵ�
					case(118){itemString = `id:40030 `; iCumRate +=15;} //0.453035337�� �ڵ�� �ҵ�
					case(119){itemString = `id:40012 `; iCumRate +=15;} //0.453035337�ٽ�Ÿ�� �ҵ�
					case(120){itemString = `id:40007 `; iCumRate +=15;} //0.453035337�Ѽյ���
					case(121){itemString = `id:40014 `; iCumRate +=15;} //0.453035337������ ����
					case(122){itemString = `id:40078 `; iCumRate +=15;} //0.453035337����Ͻ�
					case(123){itemString = `id:40080 `; iCumRate +=15;} //0.453035337�۶��콺
					case(124){itemString = `id:40006 `; iCumRate +=15;} //0.453035337�ܰ�
					case(125){itemString = `id:40031 `; iCumRate +=15;} //0.453035337����
					case(126){itemString = `id:40081 `; iCumRate +=15;} //0.453035337���� �� ����
					case(127){itemString = `id:40079 `; iCumRate +=15;} //0.453035337���̽�
					case(128){itemString = `id:40039 `; iCumRate +=15;} //0.453035337���̽� ����
					case(129){itemString = `id:40090 `; iCumRate +=15;} //0.453035337���� ����
					case(130){itemString = `id:40040 `; iCumRate +=15;} //0.453035337���̾� ����
					case(131){itemString = `id:40038 `; iCumRate +=15;} //0.453035337����Ʈ�� ����
					case(132){itemString = `id:15155 `; iCumRate +=15;} //0.453035337�̵�ī�� ������ ����(������)
					case(133){itemString = `id:15156 `; iCumRate +=15;} //0.453035337�̵�ī�� ������ ����(������)
					case(134){itemString = `id:15151 `; iCumRate +=15;} //0.453035337���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(135){itemString = `id:15152 `; iCumRate +=15;} //0.453035337���帶���� ���̽�Ʈ ���Ϸ� ����(������)
					case(136){itemString = `id:15153 `; iCumRate +=15;} //0.453035337���� �������� ��Ʈ(������)
					case(137){itemString = `id:15154 `; iCumRate +=15;} //0.453035337���� �������� ��Ʈ(������)
					case(138){itemString = `id:15157 `; iCumRate +=15;} //0.453035337���� ������ �Ǻ�(������)
					case(139){itemString = `id:15158 `; iCumRate +=15;} //0.453035337���� ������ �Ǻ�(������)
					case(140){itemString = `id:15115 `; iCumRate +=15;} //0.453035337���� �̴� ��ĿƮ
					case(141){itemString = `id:15059 `; iCumRate +=15;} //0.453035337��ũ�� ��ũž �ݹ���
					case(142){itemString = `id:15070 `; iCumRate +=15;} //0.453035337���̵� ���� �巹��
					case(143){itemString = `id:15074 `; iCumRate +=15;} //0.453035337���̽� ������ ��Ʈ
					case(144){itemString = `id:15061 `; iCumRate +=15;} //0.453035337���ṫ�� ��Ʈ�� Ʃ��
					case(145){itemString = `id:18019 `; iCumRate +=15;} //0.453035337������ ���и���
					case(146){itemString = `id:18020 `; iCumRate +=15;} //0.453035337��� ���и���
					case(147){itemString = `id:18029 `; iCumRate +=15;} //0.453035337������ �Ȱ�
					case(148){itemString = `id:18028 `; iCumRate +=15;} //0.453035337���̽� �Ȱ�
					case(149){itemString = `id:16500 `; iCumRate +=15;} //0.453035337�ﳪ �������� �۷���
					case(150){itemString = `id:40053 `; iCumRate +=15;} //0.453035337����� ��� �ɴٹ�
					case(151){itemString = `id:40054 `; iCumRate +=15;} //0.453035337����� ��� �Ѽ���
					case(152){itemString = `id:18089 `; iCumRate +=15;} //0.453035337����� ��� ���
					case(153){itemString = `id:40052 `; iCumRate +=15;} //0.453035337�Ķ� ��� �Ѽ���
					case(154){itemString = `id:18090 `; iCumRate +=15;} //0.453035337�Ķ� ��� ���
					case(155){itemString = `id:18086 `; iCumRate +=15;} //0.453035337������ �� ���
					case(156){itemString = `id:18087 `; iCumRate +=15;} //0.453035337��� �� ���
					case(157){itemString = `id:15131 `; iCumRate +=15;} //0.453035337�� �������� ��ĿƮ
					case(158){itemString = `id:2006 `; iCumRate +=15;} //0.453035337ū ��ȭ �ָӴ�
					case(159){itemString = `id:15014 `; iCumRate +=15;} //0.453035337�Ĺ߲��� ��
					case(160){itemString = `id:15028 `; iCumRate +=15;} //0.453035337�ڷ��� ������Ʈ
					case(161){itemString = `id:15042 `; iCumRate +=15;} //0.453035337�ճ� ���ǽ�
					case(162){itemString = `id:15052 `; iCumRate +=15;} //0.453035337��ũ�� ���� Ʃ��
					case(163){itemString = `id:15053 `; iCumRate +=15;} //0.453035337�÷�Į�� ���ǽ�
					case(164){itemString = `id:15128 `; iCumRate +=15;} //0.453035337�� �� ���� �巹��
					case(165){itemString = `id:15136 `; iCumRate +=15;} //0.453035337���谡 ��Ʈ
					case(166){itemString = `id:16008 `; iCumRate +=15;} //0.453035337�ڷ��� ���� �۷���
					case(167){itemString = `id:16019`; iCumRate +=15;} //0.453035337�ٹ��� �ȸ� �尩
					case(168){itemString = `id:16040 `; iCumRate +=15;} //0.453035337�ݸ� �� �۷���
					case(169){itemString = `id:16505 `; iCumRate +=15;} //0.453035337�÷�Ʈ ��Ʋ��
					case(170){itemString = `id:16520 `; iCumRate +=15;} //0.453035337�� ���� �۷���
					case(171){itemString = `id:17040 `; iCumRate +=15;} //0.453035337���� ��Ʈ�� ����
					case(172){itemString = `id:17041 `; iCumRate +=15;} //0.453035337�������� ���ú���
					case(173){itemString = `id:17045 `; iCumRate +=15;} //0.453035337���� �� ���� ���� ����
					case(174){itemString = `id:17071 `; iCumRate +=15;} //0.453035337������ ����
					case(175){itemString = `id:17087 `; iCumRate +=15;} //0.453035337�ݸ� �� ����
					case(176){itemString = `id:17506 `; iCumRate +=15;} //0.453035337�ձ׸��� ����
					case(177){itemString = `id:17522 `; iCumRate +=15;} //0.453035337�Ǹ�Ÿ ���� ����
					case(178){itemString = `id:18008 `; iCumRate +=15;} //0.453035337��Ʈ������ ĸ
					case(179){itemString = `id:18023 `; iCumRate +=15;} //0.453035337��� ���� ĸ
					case(180){itemString = `id:18038 `; iCumRate +=15;} //0.453035337���� �跿 ����
					case(181){itemString = `id:18047 `; iCumRate +=15;} //0.453035337�ڷ��� ��Ʈ ����
					case(182){itemString = `id:18513 `; iCumRate +=15;} //0.453035337������ũ ĸ
					case(183){itemString = `id:18515 `; iCumRate +=15;} //0.453035337Ʈ�� ȥ ĸ
					case(184){itemString = `id:18525 `; iCumRate +=15;} //0.453035337���͵�� ĸ
					case(185){itemString = `id:18543 `; iCumRate +=15;} //0.453035337���� Ǯ �︧
					case(186){itemString = `id:19020 `; iCumRate +=15;} //0.453035337��Ÿ�� ����� ��Ʈ
					case(187){itemString = `id:19029 `; iCumRate +=15;} //0.453035337���̾�Ʈ ���� �κ�
					case(188){itemString = `id:40081 `; iCumRate +=15;} //0.453035337�� ����
					case(189){itemString = `id:46001 `; iCumRate +=15;} //0.453035337���� �ǵ�
					case(190){itemString = `id:46006 `; iCumRate +=15;} //0.453035337ī��Ʈ �ǵ�
					case(191){itemString = `id:40172 `; iCumRate +=15;} //0.453035337�׷���Ʈ �ҵ�
					case(192){itemString = `id:40174 `; iCumRate +=15;} //0.453035337��׽�Ÿ
					case(193){itemString = `id:40177 `; iCumRate +=15;} //0.453035337������ �׽�
					case(194){itemString = `id:40180 `; iCumRate +=15;} //0.453035337ȩ���� ��Ŭ
					case(195){itemString = `id:40041 `; iCumRate +=15;} //0.453035337Ÿ�ݿ� ����
					case(196){itemString = `id:40010 `; iCumRate +=15;} //0.453035337�� �ҵ�
					case(197){itemString = `id:16523 `; iCumRate +=15;} //0.453035337�׷��̽� ��Ʋ��
					case(198){itemString = `id:17515 `; iCumRate +=15;} //0.453035337�׷��̽� �׸���
					case(199){itemString = `id:18545 `; iCumRate +=15;} //0.453035337�׷��̽� ���
					case(200){itemString = `id:46008 `; iCumRate +=15;} //0.453035337����Ʈ ���׷� ī��Ʈ �ǵ�
					case(201){itemString = `id:51007 count:5`; iCumRate +=20;} //0.604047116���� 30 ����
					case(202){itemString = `id:51001 count:5`; iCumRate +=20;} //0.604047116����� 10 ����
					case(203){itemString = `id:51002 count:5`; iCumRate +=20;} //0.604047116����� 30 ����
					case(204){itemString = `id:51022 count:5`; iCumRate +=20;} //0.604047116����°� ���� 30 ����
					case(205){itemString = `id:51027 count:5`; iCumRate +=20;} //0.604047116����°� ���¹̳� 30 ����
					case(206){itemString = `id:63000 count:5`; iCumRate +=30;} //0.906070674�Ǵн��� ����
					case(207){itemString = `id:60037 count:5`; iCumRate +=30;} //0.906070674�� ���� ����
					case(208){itemString = `id:60038 count:5`; iCumRate +=30;} //0.906070674���� ����
					case(209){itemString = `id:50012 count:5`; iCumRate +=30;} //0.906070674Ȳ�� �ް�
					case(210){itemString = `id:50013 count:5`; iCumRate +=30;} //0.906070674Ȳ�� ���
					case(211){itemString = `id:50541 quality:81`; iCumRate +=30;} //0.906070674����������
					case(212){itemString = `id:50542 quality:81`; iCumRate +=30;} //0.906070674���������� �����ƶ� 
					case(213){itemString = `id:50543 quality:81`; iCumRate +=30;} //0.906070674īǪġ��
					case(214){itemString = `id:50544 quality:81`; iCumRate +=30;} //0.906070674�����ƶ�
					case(215){itemString = `id:50545 quality:81`; iCumRate +=30;} //0.906070674ī�� ��ī
					case(216){itemString = `id:50546 quality:81`; iCumRate +=30;} //0.906070674���̽� ī�� ��ī
					case(217){itemString = `id:50547 quality:81`; iCumRate +=30;} //0.906070674���̽� �����ƶ�
					case(218){itemString = `id:50170 quality:81`; iCumRate +=30;} //0.906070674ġ�� ����
					case(219){itemString = `id:50171 quality:81`; iCumRate +=30;} //0.906070674�̸� ���ϻ� ����
					case(220){itemString = `id:50172 quality:81`; iCumRate +=30;} //0.906070674����ġ�� ����
					case(221){itemString = `id:50173 quality:81`; iCumRate +=30;} //0.906070674���� �� ���ݶ�
					case(222){itemString = `id:50174 quality:81`; iCumRate +=30;} //0.906070674ũ��ũ ����
					case(223){itemString = `id:50175 quality:81`; iCumRate +=30;} //0.906070674�����
					case(224){itemString = `id:50176 quality:81`; iCumRate +=30;} //0.906070674���� ��Ŷ
					case(225){itemString = `id:51003 count:5`; iCumRate +=200;} //6.040471157����� 50 ����
					case(226){itemString = `id:51008 count:5`; iCumRate +=200;} //6.040471157���� 50 ����
					case(227){itemString = `id:51013 count:5`; iCumRate +=200;} //6.040471157���¹̳� 50 ����
					case(228){itemString = `id:51028 count:5`; iCumRate +=200;} //6.040471157����°� ���¹̳� 50 ����
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
				//	GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
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
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(3767);	//Ȯ���� ������ ���´�
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					case(0){itemString = `id:13066 `; iCumRate +=1;} //0.026546323���̴Ͼ� ������ ���� (������ ������)
					case(1){itemString = `id:13067`; iCumRate +=1;} //0.026546323���̴Ͼ� ������ ���� (������ ������)
					case(2){itemString = `id:18287`; iCumRate +=1;} //0.026546323������ Ż
					case(3){itemString = `id:13038 `; iCumRate +=1;} //0.026546323����ƾ �ǹ� ����Ʈ �Ƹ�
					case(4){itemString = `id:16524 `; iCumRate +=1;} //0.026546323����ƾ �ǹ� ����Ʈ ��극�̽�
					case(5){itemString = `id:17517 `; iCumRate +=1;} //0.026546323����ƾ �ǹ� ����Ʈ �׸���
					case(6){itemString = `id:18548 `; iCumRate +=1;} //0.026546323����ƾ �ǹ� ����Ʈ �︧
					case(7){itemString = `id:15316 `; iCumRate +=1;} //0.026546323ī���� ���ڵ� ��Ʈ
					case(8){itemString = `id:17128 `; iCumRate +=1;} //0.026546323ī���� ���ڵ� ����
					case(9){itemString = `id:13032 `; iCumRate +=2;} //0.053092647�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(10){itemString = `id:13033 `; iCumRate +=2;} //0.053092647�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
					case(11){itemString = `id:16521 `; iCumRate +=2;} //0.053092647�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
					case(12){itemString = `id:17514 `; iCumRate +=2;} //0.053092647�߷��þ� ũ�ν� ���� �÷���Ʈ ����
					case(13){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647Ŭ���̸��
					case(14){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=2;} //0.053092647���� �� ����
					case(15){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647���� ����
					case(16){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647�۶��콺
					case(17){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647����Ʈ�� ����
					case(18){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647���̽� ����
					case(19){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647���̾� ����
					case(20){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647Ÿ�ݿ� ����
					case(21){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=2;} //0.053092647����Ͻ�
					case(22){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=2;} //0.053092647���̽�
					case(23){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647����
					case(24){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=2;} //0.053092647�� �ڵ�� �ҵ�
					case(25){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647�� ����
					case(26){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=2;} //0.053092647����� ����
					case(27){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=2;} //0.053092647���׷� ī��Ʈ �ǵ�
					case(28){itemString = `id:18518 `; iCumRate +=15;} //0.39819485�巡�� ũ����Ʈ
					case(29){itemString = `id:15113 `; iCumRate +=15;} //0.39819485������ �˻��б� ���� ��ƮŸ��
					case(30){itemString = `id:15114 `; iCumRate +=15;} //0.39819485������ �˻��б� ���� ��Ÿ��
					case(31){itemString = `id:15065 `; iCumRate +=15;} //0.39819485���� ����Ʈ ��ĿƮ
					case(32){itemString = `id:19008 `; iCumRate +=15;} //0.39819485���� �Ǵ� �κ�
					case(33){itemString = `id:15137 `; iCumRate +=15;} //0.39819485������ ���� ��Ŷ ��Ʈ
					case(34){itemString = `id:18041 `; iCumRate +=15;} //0.39819485ū ì ���� ����
					case(35){itemString = `id:19009 `; iCumRate +=15;} //0.39819485���� ���� �κ�
					case(36){itemString = `id:18112 `; iCumRate +=15;} //0.39819485�� ���� ��ǰ
					case(37){itemString = `id:15055 `; iCumRate +=15;} //0.39819485���� �̴� ���ǽ�
					case(38){itemString = `id:15057 `; iCumRate +=15;} //0.39819485�� ���� ��Ʈ (����)
					case(39){itemString = `id:16531 `; iCumRate +=15;} //0.39819485Ƽ���� ��Ʋ��
					case(40){itemString = `id:17523 `; iCumRate +=15;} //0.39819485Ƽ���� �׸���
					case(41){itemString = `id:15070 `; iCumRate +=15;} //0.39819485���ĵ�Į�� �����긮��
					case(42){itemString = `id:15230 `; iCumRate +=15;} //0.39819485������ �۷� üũ ��ĿƮ
					case(43){itemString = `id:19034 `; iCumRate +=15;} //0.39819485������ Ŭ�ν� ������Ʈ
					case(44){itemString = `id:40033 `; iCumRate +=15;} //0.39819485Ŭ���̸��
					case(45){itemString = `id:13043 `; iCumRate +=15;} //0.39819485���̴Ͼ� ������ ����(������)
					case(46){itemString = `id:13044 `; iCumRate +=15;} //0.39819485���̴Ͼ� ������ ����(������)
					case(47){itemString = `id:13045 `; iCumRate +=15;} //0.39819485�Ƹ��� �ƽ��� �Ƹ�(������)
					case(48){itemString = `id:13046 `; iCumRate +=15;} //0.39819485�Ƹ��� �ƽ��� �Ƹ�(������)
					case(49){itemString = `id:14019 `; iCumRate +=15;} //0.39819485�׷��̽� �÷���Ʈ �Ƹ�
					case(50){itemString = `id:13031 `; iCumRate +=15;} //0.39819485������ī �ǹ� �÷���Ʈ �Ƹ�
					case(51){itemString = `id:13022 `; iCumRate +=15;} //0.39819485���� �÷���Ʈ �Ƹ� (PŸ��)
					case(52){itemString = `id:18542 `; iCumRate +=15;} //0.39819485�� ü�� Ǯ �︧
					case(53){itemString = `id:18506 `; iCumRate +=15;} //0.39819485�� ���� �︧
					case(54){itemString = `id:14042 `; iCumRate +=15;} //0.39819485�ý�ƾ ���� �Ƹ�
					case(55){itemString = `id:18045 `; iCumRate +=15;} //0.39819485����� ������ ����
					case(56){itemString = `id:13010 `; iCumRate +=15;} //0.39819485���� ����� ü�θ���
					case(57){itemString = `id:14025 `; iCumRate +=15;} //0.39819485ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(58){itemString = `id:14026 `; iCumRate +=15;} //0.39819485ī�� ���Ǹ�Ʈ �Ƹ�(������)
					case(59){itemString = `id:16028 `; iCumRate +=15;} //0.39819485ī�� ���Ǹ�Ʈ �۷���
					case(60){itemString = `id:16511 `; iCumRate +=15;} //0.39819485�ǹ� Ƽ�� �۷���
					case(61){itemString = `id:17064 `; iCumRate +=15;} //0.39819485ī�� ���Ǹ�Ʈ ����
					case(62){itemString = `id:16534 `; iCumRate +=15;} //0.39819485�ý�ƾ ���� ��Ʋ��
					case(63){itemString = `id:17524 `; iCumRate +=15;} //0.39819485�ý�ƾ ���� ����
					case(64){itemString = `id:13047 `; iCumRate +=15;} //0.39819485Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(65){itemString = `id:13048 `; iCumRate +=15;} //0.39819485Ű�������� ���� �÷���Ʈ �Ƹ�(������)
					case(66){itemString = `id:14038 `; iCumRate +=15;} //0.39819485�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
					case(67){itemString = `id:18111 `; iCumRate +=15;} //0.39819485���� ���� ��ǰ
					case(68){itemString = `id:18110 `; iCumRate +=15;} //0.39819485���� ���� ��ǰ
					case(69){itemString = `id:18109 `; iCumRate +=15;} //0.39819485���� ���� ��ǰ
					case(70){itemString = `id:18108 `; iCumRate +=15;} //0.39819485���� ���� ��ǰ
					case(71){itemString = `id:40083 `; iCumRate +=15;} //0.39819485�� ĿƲ����
					case(72){itemString = `id:40032 `; iCumRate +=15;} //0.39819485������ �ҵ�
					case(73){itemString = `id:18544 `; iCumRate +=15;} //0.39819485�縮ĭ ��������
					case(74){itemString = `id:18547 `; iCumRate +=15;} //0.39819485�ĳ��� ��� ��������
					case(75){itemString = `id:18521 `; iCumRate +=15;} //0.39819485�����Ǿ� ����
					case(76){itemString = `id:18500 `; iCumRate +=15;} //0.39819485�� ���� �︧
					case(77){itemString = `id:18511 `; iCumRate +=15;} //0.39819485�÷�Ʈ Ǯ �︧
					case(78){itemString = `id:18502 `; iCumRate +=15;} //0.39819485�� �︧
					case(79){itemString = `id:19007 `; iCumRate +=15;} //0.39819485�߱� ���÷� �κ�
					case(80){itemString = `id:19017 `; iCumRate +=15;} //0.39819485���� �κ�
					case(81){itemString = `id:19016 `; iCumRate +=15;} //0.39819485�� �κ�
					case(82){itemString = `id:15112 `; iCumRate +=15;} //0.39819485������ �����̷�
					case(83){itemString = `id:18034 `; iCumRate +=15;} //0.39819485���� ������
					case(84){itemString = `id:18006 `; iCumRate +=15;} //0.39819485���������
					case(85){itemString = `id:18113 `; iCumRate +=15;} //0.39819485������ ����� ����
					case(86){itemString = `id:18114 `; iCumRate +=15;} //0.39819485�ٹ��� ����� ����
					case(87){itemString = `id:18115 `; iCumRate +=15;} //0.39819485�� ����� ����
					case(88){itemString = `id:18097 `; iCumRate +=15;} //0.39819485���̷� ���� ����
					case(89){itemString = `id:18098 `; iCumRate +=15;} //0.39819485���̷��� �Ȱ�
					case(90){itemString = `id:18099 `; iCumRate +=15;} //0.39819485���̷� ���� ���� ����
					case(91){itemString = `id:18100 `; iCumRate +=15;} //0.39819485���̷� ���� ����
					case(92){itemString = `id:18101 `; iCumRate +=15;} //0.39819485���̷� ���� ���� ����
					case(93){itemString = `id:18102 `; iCumRate +=15;} //0.39819485���̷��� ����
					case(94){itemString = `id:18096 `; iCumRate +=15;} //0.39819485���̷� ����� ����
					case(95){itemString = `id:18044 `; iCumRate +=15;} //0.39819485���˿� ����
					case(96){itemString = `id:51002 count:5`; iCumRate +=100;} //2.654632333����� 30 ����
					case(97){itemString = `id:51007 count:5`; iCumRate +=100;} //2.654632333���� 30 ����
					case(98){itemString = `id:51012 count:5`; iCumRate +=100;} //2.654632333���¹̳� 30 ����
					case(99){itemString = `id:51003 count:5`; iCumRate +=100;} //2.654632333����� 50 ����
					case(100){itemString = `id:51008 count:5`; iCumRate +=100;} //2.654632333���� 50 ����
					case(101){itemString = `id:51013 count:5`; iCumRate +=100;} //2.654632333���¹̳� 50 ����
					case(102){itemString = `id:51004 count:3`; iCumRate +=100;} //2.654632333����� 100 ����
					case(103){itemString = `id:51009 count:3`; iCumRate +=100;} //2.654632333���� 100 ����
					case(104){itemString = `id:51014 count:3`; iCumRate +=100;} //2.654632333���¹̳� 100 ����
					case(105){itemString = `id:51005 `; iCumRate +=100;} //2.654632333����� 300 ����
					case(106){itemString = `id:51010 `; iCumRate +=100;} //2.654632333���� 300 ����
					case(107){itemString = `id:51015 `; iCumRate +=100;} //2.654632333���¹̳� 300 ����
					case(108){itemString = `id:51022 count:5`; iCumRate +=100;} //2.654632333����°� ���� 30 ����
					case(109){itemString = `id:51023 count:5`; iCumRate +=100;} //2.654632333����°� ���� 50 ����
					case(110){itemString = `id:51024 count:3`; iCumRate +=100;} //2.654632333����°� ���� 100 ����
					case(111){itemString = `id:51025 `; iCumRate +=100;} //2.654632333����°� ���� 300 ����
					case(112){itemString = `id:51027 count:5`; iCumRate +=100;} //2.654632333����°� ���¹̳� 30 ����
					case(113){itemString = `id:51028 count:5`; iCumRate +=100;} //2.654632333����°� ���¹̳� 50 ����
					case(114){itemString = `id:51029 count:3`; iCumRate +=100;} //2.654632333����°� ���¹̳� 100 ����
					case(115){itemString = `id:51030 `; iCumRate +=100;} //2.654632333����°� ���¹̳� 300 ����
					case(116){itemString = `id:63016 count:5`; iCumRate +=100;} //2.654632333�ູ�� ����
					case(117){itemString = `id:63225 count:3`; iCumRate +=100;} //2.654632333��ȭ
					case(118){itemString = `id:51046 `; iCumRate +=100;} //2.654632333ȣ���� ����
					case(119){itemString = `id:51101 count:10`; iCumRate +=100;} //2.654632333���� ���
					case(120){itemString = `id:51102 count:10`; iCumRate +=100;} //2.654632333���� ���
					case(121){itemString = `id:51103 count:10`; iCumRate +=100;} //2.654632333������Ʈ ���
					case(122){itemString = `id:51107 count:10`; iCumRate +=100;} //2.654632333ȭ��Ʈ ���


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
				//	GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
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
	}
		// ĳ�� �������� ���޾Ҵ�.
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}