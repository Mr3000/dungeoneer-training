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
	//�Ϲ� �ʺ��� ��í��
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(2973);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15151 col1:9999cc col2:ffffff col3:000000`; iCumRate += 1;}	//0.033636058 ���̽�Ʈ ���Ϸ� ����(������)(�������)
			case(1){itemString = `id:15152 col1:ff9900 col2:ffffff col3:000000`; iCumRate += 1;}	//0.033636058 ���̽�Ʈ ���Ϸ� ����(������)(�������)
			case(2){itemString = `id:13022 col1:e1b43d col2:000000 col3:fcf2d3`; iCumRate += 1;}	//0.033636058 @���� �÷���Ʈ �Ƹ� (PŸ��)(�������)
			case(3){itemString = `id:40033 col1:5c703d col2:ffffff col3:718a4b`; iCumRate += 1;}	//0.033636058 Ŭ���̸��(�������)
			case(4){itemString = `id:40004 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 ��Ʈ(��¦�� �������)
			case(5){itemString = `id:40018 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 ���𷼷�(��¦�� �������)
			case(6){itemString = `id:40017 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 ������(��¦�� �������)
			case(7){itemString = `id:15153`; iCumRate += 2;}	//0.067272116 @���� �������� ��Ʈ(������)
			case(8){itemString = `id:15154`; iCumRate += 2;}	//0.067272116 @���� �������� ��Ʈ(������)
			case(9){itemString = `id:16026`; iCumRate += 2;}	//0.067272116 @���� �������� ��Ʈ �۷���
			case(10){itemString = `id:17060`; iCumRate += 2;}	//0.067272116 @���� �������� ��Ʈ ����(������)
			case(11){itemString = `id:17061`; iCumRate += 2;}	//0.067272116 @���� �������� ��Ʈ ����(������)
			case(12){itemString = `id:40013 col1:5b88c2`; iCumRate += 2;}	//0.067272116 �� ����(���� ����)
			case(13){itemString = `id:40031 col1:5b88c2`; iCumRate += 2;}	//0.067272116 ����(���� ����)
			case(14){itemString = `id:46001 col1:5b88c2`; iCumRate += 2;}	//0.067272116 ���� �ǵ�(���� ����)
			case(15){itemString = `id:40004 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 ��Ʈ(�������)
			case(16){itemString = `id:40018 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 ���𷼷�(�������)
			case(17){itemString = `id:40017 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 ������(�������)
			case(18){itemString = `id:40027 col1:ff6600 durability:10000 durability_max:10000`; iCumRate += 2;}	//0.067272116 ȣ��(�������)
			case(19){itemString = `id:40022 col1:ff6600 durability:7000 durability_max:7000`; iCumRate += 2;}	//0.067272116 ä���� ����(�������)
			case(20){itemString = `id:40023 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 ä���� �ܰ�(�������)
			case(21){itemString = `id:40042 col1:ff6600 durability:6000 durability_max:6000`; iCumRate += 2;}	//0.067272116 ��Į(�������)
			case(22){itemString = `id:46005 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 ���� ���̺�(�������)
			case(23){itemString = `id:40045 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 ���˴�(�������)
			case(24){itemString = `id:40025 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 ���(�������)
			case(25){itemString = `id:40026 col1:ff6600 durability:13000 durability_max:13000`; iCumRate += 2;}	//0.067272116 ��(�������)
			case(26){itemString = `id:46004 col1:ff6600 durability:31000 durability_max:31000`; iCumRate += 2;}	//0.067272116 ����(�������)
			case(27){itemString = `id:40044 col1:ff6600 durability:9000 durability_max:9000`; iCumRate += 2;}	//0.067272116 �ٿ뵵 ���� (�������)
			case(28){itemString = `id:40024 col1:ff6600 durability:13000 durability_max:13000`; iCumRate += 2;}	//0.067272116 �������� ��ġ(�������)
			case(29){itemString = `id:40043 col1:ff6600 durability:6000 durability_max:6000`; iCumRate += 2;}	//0.067272116 ���׿� �д�(�������)
			case(30){itemString = `id:13010`; iCumRate += 8;}	//0.269088463 @���� ����� ü�θ���
			case(31){itemString = `id:13023`; iCumRate += 8;}	//0.269088463 @���� �÷���Ʈ �Ƹ� (BŸ��)
			case(32){itemString = `id:16504`; iCumRate += 8;}	//0.269088463 @ī���� ��Ʋ��
			case(33){itemString = `id:17500`; iCumRate += 8;}	//0.269088463 @�������� �÷���Ʈ ����
			case(34){itemString = `id:18508`; iCumRate += 8;}	//0.269088463 @���� Ǯ �︧
			case(35){itemString = `id:60014 count:10`; iCumRate += 8;}	//0.269088463 �ְ�� ��ũ
			case(36){itemString = `id:60022 count:10`; iCumRate += 8;}	//0.269088463 �ְ�� �ʰ�
			case(37){itemString = `id:60018 count:10`; iCumRate += 8;}	//0.269088463 �ְ�� ������ ��
			case(38){itemString = `id:60026 count:10`; iCumRate += 8;}	//0.269088463 �ְ�� ����
			case(39){itemString = `id:64008 count:10`; iCumRate += 8;}	//0.269088463 �ݱ���
			case(40){itemString = `id:64007 count:10`; iCumRate += 8;}	//0.269088463 �ݱ�
			case(41){itemString = `id:51105 count:10`; iCumRate += 8;}	//0.269088463 ��� ���
			case(42){itemString = `id:63016 count:5`; iCumRate += 8;}	//0.269088463 �ູ�� ����
			case(43){itemString = `id:40030 col1:773333`; iCumRate += 8;}	//0.269088463 �� �ڵ�� �ҵ�(�� ����)
			case(44){itemString = `id:40033 col1:773333`; iCumRate += 8;}	//0.269088463 Ŭ���̸��(�� ����)
			case(45){itemString = `id:40012 col1:773333`; iCumRate += 8;}	//0.269088463 �ٽ�Ÿ�� �ҵ�(�� ����)
			case(46){itemString = `id:40030 col1:bb9955`; iCumRate += 8;}	//0.269088463 �� �ڵ�� �ҵ�(�� ����)
			case(47){itemString = `id:40033 col1:bb9955`; iCumRate += 8;}	//0.269088463 Ŭ���̸Ӿ�(�� ����)
			case(48){itemString = `id:40012 col1:bb9955`; iCumRate += 8;}	//0.269088463 �ٽ�Ÿ�� �ҵ�(�� ����)
			case(49){itemString = `id:15012`; iCumRate += 8;}	//0.269088463 ����� ������
			case(50){itemString = `id:15016`; iCumRate += 8;}	//0.269088463 ����� ��Ÿŷ ������
			case(51){itemString = `id:15019`; iCumRate += 8;}	//0.269088463 @�ڷ��� ���ڽ�Ʈ
			case(52){itemString = `id:15020`; iCumRate += 8;}	//0.269088463 @�ڷ��� �����巹��
			case(53){itemString = `id:15026`; iCumRate += 8;}	//0.269088463 @������ �ս�ĿƮ
			case(54){itemString = `id:15027`; iCumRate += 8;}	//0.269088463 @��� �ս�ĿƮ
			case(55){itemString = `id:15042`; iCumRate += 8;}	//0.269088463 �ճ� ���ǽ�
			case(56){itemString = `id:15051`; iCumRate += 8;}	//0.269088463 @Ÿ��Ʈ ��Ʈ ����
			case(57){itemString = `id:15052`; iCumRate += 8;}	//0.269088463 @��ũ�� ���� Ʃ��
			case(58){itemString = `id:15067`; iCumRate += 8;}	//0.269088463 ����ǳ ���纹
			case(59){itemString = `id:16004`; iCumRate += 8;}	//0.269088463 @���͵�� �극�̽���
			case(60){itemString = `id:16005`; iCumRate += 8;}	//0.269088463 @����÷���Ʈ ĳ��
			case(61){itemString = `id:16014`; iCumRate += 8;}	//0.269088463 �θ�ī �尩
			case(62){itemString = `id:16016`; iCumRate += 8;}	//0.269088463 @����Ʈ �۷���
			case(63){itemString = `id:16019`; iCumRate += 8;}	//0.269088463 �ٹ��� �ȸ� �尩
			case(64){itemString = `id:17010`; iCumRate += 8;}	//0.269088463 @�ڷ��� ����
			case(65){itemString = `id:17017`; iCumRate += 8;}	//0.269088463 @������Ʈ ����
			case(66){itemString = `id:17021`; iCumRate += 8;}	//0.269088463 @�θ�ī ����
			case(67){itemString = `id:17024`; iCumRate += 8;}	//0.269088463 ��� ����
			case(68){itemString = `id:17029`; iCumRate += 8;}	//0.269088463 @��Ʈ ��Ŭ ����
			case(69){itemString = `id:18000`; iCumRate += 8;}	//0.269088463 ��ũ ����
			case(70){itemString = `id:18003`; iCumRate += 8;}	//0.269088463 @������ ĸ
			case(71){itemString = `id:18008`; iCumRate += 8;}	//0.269088463 @��Ʈ������ ĸ
			case(72){itemString = `id:18009`; iCumRate += 8;}	//0.269088463 @��� ���� ĸ
			case(73){itemString = `id:18013`; iCumRate += 8;}	//0.269088463 @�ڷ��� ĸ
			case(74){itemString = `id:19001`; iCumRate += 8;}	//0.269088463 @�κ�
			case(75){itemString = `id:19003`; iCumRate += 8;}	//0.269088463 @Ʈ���ݷθ� �κ�
			case(76){itemString = `id:14001`; iCumRate += 8;}	//0.269088463 @����Ʈ ��������(��)
			case(77){itemString = `id:14010`; iCumRate += 8;}	//0.269088463 @����Ʈ ��������(��)
			case(78){itemString = `id:14003`; iCumRate += 8;}	//0.269088463 @���͵�� �����þ�
			case(79){itemString = `id:14005`; iCumRate += 8;}	//0.269088463 @������� ��������(��)
			case(80){itemString = `id:14011`; iCumRate += 8;}	//0.269088463 @������� ��������(��)
			case(81){itemString = `id:14007`; iCumRate += 8;}	//0.269088463 @�극��Ʈ Ŭ�ν� ����
			case(82){itemString = `id:14013`; iCumRate += 8;}	//0.269088463 @�θ�ī ���׸�ŸŸ��
			case(83){itemString = `id:14016`; iCumRate += 8;}	//0.269088463 @ũ�ν���Ʈ ���� ��Ʈ
			case(84){itemString = `id:16501`; iCumRate += 8;}	//0.269088463 @���� ��������
			case(85){itemString = `id:17501`; iCumRate += 8;}	//0.269088463 @�Ƿ��� ����
			case(86){itemString = `id:17506`; iCumRate += 8;}	//0.269088463 @�ձ׸��� ����
			case(87){itemString = `id:40006`; iCumRate += 16;}	//0.538176926 �ܰ�
			case(88){itemString = `id:40005`; iCumRate += 16;}	//0.538176926 �� �ҵ�
			case(89){itemString = `id:40010`; iCumRate += 16;}	//0.538176926 �� �ҵ�
			case(90){itemString = `id:40007`; iCumRate += 16;}	//0.538176926 �Ѽ� ����
			case(91){itemString = `id:40016`; iCumRate += 16;}	//0.538176926 �ظ�
			case(92){itemString = `id:40015`; iCumRate += 16;}	//0.538176926 �÷�Ʈ ���ҵ�
			case(93){itemString = `id:40030`; iCumRate += 16;}	//0.538176926 �� �ڵ�� �ҵ�
			case(94){itemString = `id:40011`; iCumRate += 16;}	//0.538176926 ��ε� �ҵ�
			case(95){itemString = `id:40033`; iCumRate += 16;}	//0.538176926 Ŭ���̸��
			case(96){itemString = `id:40012`; iCumRate += 16;}	//0.538176926 �ٽ�Ÿ�� �ҵ�
			case(97){itemString = `id:40019`; iCumRate += 16;}	//0.538176926 ���� ��������
			case(98){itemString = `id:40020`; iCumRate += 16;}	//0.538176926 ���� ������
			case(99){itemString = `id:40031`; iCumRate += 16;}	//0.538176926 ����
			case(100){itemString = `id:40013`; iCumRate += 16;}	//0.538176926 �� ����
			case(101){itemString = `id:40014`; iCumRate += 16;}	//0.538176926 ������ ����
			case(102){itemString = `id:40003`; iCumRate += 16;}	//0.538176926 �� ����
			case(103){itemString = `id:46001`; iCumRate += 16;}	//0.538176926 ���� �ǵ�
			case(104){itemString = `manual:106`; iCumRate += 16;}	//0.538176926 �ʺ� - ������ĿƮ(��)
			case(105){itemString = `manual:112`; iCumRate += 16;}	//0.538176926 �ʺ� - ���������
			case(106){itemString = `manual:114`; iCumRate += 16;}	//0.538176926 �ʺ� - �Ӹ���
			case(107){itemString = `manual:107`; iCumRate += 16;}	//0.538176926 �ʺ� - ��� �����ڿ�(��)
			case(108){itemString = `manual:108`; iCumRate += 16;}	//0.538176926 �ʺ� - ��� �����ڿ�(��)
			case(109){itemString = `manual:102`; iCumRate += 16;}	//0.538176926 �ʺ� - �����б� ����(��)
			case(110){itemString = `manual:115`; iCumRate += 16;}	//0.538176926 �ʺ� - ��� �ս�ĿƮ(��)
			case(111){itemString = `manual:118`; iCumRate += 16;}	//0.538176926 �ʺ� - �ڷ��� ���ڽ�Ʈ(��)
			case(112){itemString = `manual:111`; iCumRate += 16;}	//0.538176926 �ʺ� - ����� �尩
			case(113){itemString = `manual:117`; iCumRate += 16;}	//0.538176926 �ʺ� - ������ �ս�ĿƮ(��)
			case(114){itemString = `manual:105`; iCumRate += 16;}	//0.538176926 �ʺ� - ��� ����
			case(115){itemString = `manual:109`; iCumRate += 16;}	//0.538176926 �ʺ� - Ŭ�ν� ����
			case(116){itemString = `manual:116`; iCumRate += 16;}	//0.538176926 �ʺ� - ����Ʈ ��������(��)
			case(117){itemString = `manual:120`; iCumRate += 16;}	//0.538176926 �ʺ� - ����Ʈ ��������(��)
			case(118){itemString = `manual:126`; iCumRate += 16;}	//0.538176926 �ʺ� - ���̽� ����Ʈ ����(��)
			case(119){itemString = `manual:122`; iCumRate += 16;}	//0.538176926 �ʺ� - �������� ��ũ���� �尩
			case(120){itemString = `manual:119`; iCumRate += 16;}	//0.538176926 �ʺ� - �ڷ��� ������Ʈ(��)
			case(121){itemString = `manual:123`; iCumRate += 16;}	//0.538176926 �ʺ� - ���� �̴� ���ǽ� ��Ÿ��(��)
			case(122){itemString = `manual:20106`; iCumRate += 16;}	//0.538176926 ���� - ��
			case(123){itemString = `manual:20104`; iCumRate += 16;}	//0.538176926 ���� - ���
			case(124){itemString = `manual:20131`; iCumRate += 16;}	//0.538176926 ���� - �� �ҵ�
			case(125){itemString = `manual:20102`; iCumRate += 16;}	//0.538176926 ���� - �ܰ�
			case(126){itemString = `manual:20108`; iCumRate += 16;}	//0.538176926 ���� - ������ũ ĸ
			case(127){itemString = `manual:20103`; iCumRate += 16;}	//0.538176926 ���� - ���� �ǵ�
			case(128){itemString = `manual:20105`; iCumRate += 16;}	//0.538176926 ���� - �� �ҵ�
			case(129){itemString = `manual:20117`; iCumRate += 16;}	//0.538176926 ���� - �׸��� ����
			case(130){itemString = `manual:20134`; iCumRate += 16;}	//0.538176926 ���� - �ظ�
			case(131){itemString = `manual:20135`; iCumRate += 16;}	//0.538176926 ���� - ��ε� �ҵ�
			case(132){itemString = `manual:20137`; iCumRate += 16;}	//0.538176926 ���� - �ٽ�Ÿ�� �ҵ�
			case(133){itemString = `id:62005 prefix:6`; iCumRate += 16;}	//0.538176926 ������ũ����
			case(134){itemString = `id:62005 prefix:7`; iCumRate += 16;}	//0.538176926 ��������
			case(135){itemString = `id:62005 prefix:107`; iCumRate += 16;}	//0.538176926 �������̸�
			case(136){itemString = `id:62005 prefix:207`; iCumRate += 16;}	//0.538176926 ����
			case(137){itemString = `id:62005 suffix:10604`; iCumRate += 16;}	//0.538176926 �����
			case(138){itemString = `id:62005 suffix:11104`; iCumRate += 16;}	//0.538176926 ��ũ�Ͻ�
			case(139){itemString = `id:60009 count:5`; iCumRate += 24;}	//0.807265388 ����
			case(140){itemString = `id:60008 count:5`; iCumRate += 24;}	//0.807265388 �Ź���
			case(141){itemString = `id:60004 count:5`; iCumRate += 24;}	//0.807265388 �ŵ��
			case(142){itemString = `id:60028 count:10`; iCumRate += 24;}	//0.807265388 �Ϲ� ���ײ�
			case(143){itemString = `id:60013 count:10`; iCumRate += 24;}	//0.807265388 ��� ��ũ
			case(144){itemString = `id:60021 count:10`; iCumRate += 24;}	//0.807265388 ��� �ʰ�
			case(145){itemString = `id:60017 count:10`; iCumRate += 24;}	//0.807265388 ��� ������ ��
			case(146){itemString = `id:60025 count:10`; iCumRate += 24;}	//0.807265388 ��� ����
			case(147){itemString = `id:60012 count:10`; iCumRate += 24;}	//0.807265388 �Ϲ� ��ũ
			case(148){itemString = `id:60016 count:10`; iCumRate += 24;}	//0.807265388 �Ϲ� ������ ��
			case(149){itemString = `id:60020 count:10`; iCumRate += 24;}	//0.807265388 �Ϲ� �ʰ�
			case(150){itemString = `id:60024 count:10`; iCumRate += 24;}	//0.807265388 �Ϲ� ����
			case(151){itemString = `id:64002 count:10`; iCumRate += 24;}	//0.807265388 ö����
			case(152){itemString = `id:64004 count:10`; iCumRate += 24;}	//0.807265388 ������
			case(153){itemString = `id:64006 count:10`; iCumRate += 24;}	//0.807265388 ������
			case(154){itemString = `id:64001 count:10`; iCumRate += 24;}	//0.807265388 ö��
			case(155){itemString = `id:64003 count:10`; iCumRate += 24;}	//0.807265388 ����
			case(156){itemString = `id:64005 count:10`; iCumRate += 24;}	//0.807265388 ����
			case(157){itemString = `id:51102 count:10`; iCumRate += 24;}	//0.807265388 ���� ���
			case(158){itemString = `id:51101 count:10`; iCumRate += 24;}	//0.807265388 ���� ���
			case(159){itemString = `id:51103 count:10`; iCumRate += 24;}	//0.807265388 ������Ʈ ���
			case(160){itemString = `id:62003 count:5`; iCumRate += 24;}	//0.807265388 �ູ���� ��������
			case(161){itemString = `id:63029 count:5`; iCumRate += 24;}	//0.807265388 ķ�����̾� ŰƮ
			case(162){itemString = `id:50006 count:5`; iCumRate += 24;}	//0.807265388 ��� ����
			case(163){itemString = `id:40025`; iCumRate += 24;}	//0.807265388 ���
			case(164){itemString = `id:2001`; iCumRate += 24;}	//0.807265388 ��ȭ�ָӴ�
			case(165){itemString = `id:40026`; iCumRate += 24;}	//0.807265388 ��
			case(166){itemString = `id:40024`; iCumRate += 24;}	//0.807265388 �������� ��ġ
			case(167){itemString = `id:50203`; iCumRate += 24;}	//0.807265388 ���� ��������
			case(168){itemString = `id:62004 count:5`; iCumRate += 24;}	//0.807265388 ��������
			case(169){itemString = `id:63027 expire:10080`; iCumRate += 24;}	//0.807265388 �ж� ����
			case(170){itemString = `id:45002 count:100`; iCumRate += 24;}	//0.807265388 ��Ʈ
			case(171){itemString = `id:60005 count:10`; iCumRate += 24;}	//0.807265388 �ش�
			case(172){itemString = `id:50124 quality:80`; iCumRate += 24;}	//0.807265388 ���� ������ũ 80����Ƽ
			case(173){itemString = `id:63020`; iCumRate += 24;}	//0.807265388 �� ��
			case(174){itemString = `id:51001 count:10`; iCumRate += 24;}	//0.807265388 ����� 10 ����
			case(175){itemString = `id:51022 count:5`; iCumRate += 24;}	//0.807265388 ����°� ���� 30 ����
			case(176){itemString = `id:51027 count:5`; iCumRate += 24;}	//0.807265388 ����°� ���¹̳� 30 ����
			case(177){itemString = `id:51028 count:5`; iCumRate += 24;}	//0.807265388 ����°� ���¹̳� 50 ����
			case(178){itemString = `id:51011 count:10`; iCumRate += 24;}	//0.807265388 ���¹̳� 10 ����
			case(179){itemString = `id:40042`; iCumRate += 24;}	//0.807265388 ��Į
			case(180){itemString = `id:63019 count:50`; iCumRate += 24;}	//0.807265388 �˺� ��Ʋ �Ʒ��� ����
			case(181){itemString = `id:63043 count:3`; iCumRate += 24;}	//0.807265388 ���꽺�� ����
			case(182){itemString = `id:63001 count:5`; iCumRate += 24;}	//0.807265388 ������ ����
			case(183){itemString = `id:40002`; iCumRate += 24;}	//0.807265388 ������ ��
			case(184){itemString = `id:51031 count:3`; iCumRate += 24;}	//0.807265388 ���� ȸ���� ����
			case(185){itemString = `id:50014`; iCumRate += 24;}	//0.807265388 �հ���
			case(186){itemString = `id:63026 count:3`; iCumRate += 24;}	//0.807265388 ���� ���� �̿��
			case(187){itemString = `id:63057 count:3`; iCumRate += 24;}	//0.807265388 ���� �Ƿ� ���� �̿��
			case(188){itemString = `id:63047 count:3`; iCumRate += 24;}	//0.807265388 ���� ������ �̿��
			case(189){itemString = `id:40023`; iCumRate += 24;}	//0.807265388 ä���� �ܰ�
			case(190){itemString = `id:40022`; iCumRate += 24;}	//0.807265388 ä���� ����
			case(191){itemString = `id:63016 count:3`; iCumRate += 24;}	//0.807265388 �ູ�� ����
			case(192){itemString = `id:63039 expire:10080`; iCumRate += 24;}	//0.807265388 ķ�� ŰƮ
			case(193){itemString = `id:63029 count:5`; iCumRate += 24;}	//0.807265388 ķ�����̾�ŰƮ
			case(194){itemString = `id:50005`; iCumRate += 24;}	//0.807265388 Ŀ�ٶ� ��ⵢ�
			case(195){itemString = `id:2006`; iCumRate += 24;}	//0.807265388 ū ��ȭ�ָӴ�
			case(196){itemString = `id:50202`; iCumRate += 24;}	//0.807265388 Ű�� �� �� ����
			case(197){itemString = `id:63044 count:3`; iCumRate += 24;}	//0.807265388 ��Ƽ ��Ȱ�� ����
			case(198){itemString = `id:63000 count:3`; iCumRate += 24;}	//0.807265388 �Ǵн��� ����
			case(199){itemString = `id:40027`; iCumRate += 24;}	//0.807265388 ȣ��
			case(200){itemString = `id:45001 count:100`; iCumRate += 24;}	//0.807265388 ȭ��
			case(201){itemString = `id:63058`; iCumRate += 24;}	//0.807265388 ȸ�� �ӵ� ���� ����
			case(202){itemString = `id:50201 quality:80`; iCumRate += 24;}	//0.807265388 BnR 80����Ƽ
			case(203){itemString = `id:50164 quality:80`; iCumRate += 24;}	//0.807265388 T�� ������ũ 80����Ƽ
			case(204){itemString = `id:40004`; iCumRate += 24;}	//0.807265388 ��Ʈ
			case(205){itemString = `id:40018`; iCumRate += 24;}	//0.807265388 ���𷼷�
			case(206){itemString = `id:40017`; iCumRate += 24;}	//0.807265388 ������
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
