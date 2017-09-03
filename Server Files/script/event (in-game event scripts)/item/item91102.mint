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
	// �븸�� ���谡 ��í�� ������(�Ϻ� ���谡 ��í�� ������ ���)
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(2000);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0) {itemString = `id:13060 `; iCumRate +=2;}//0.1�巡�� ������ �Ƹ�(������)
			case(1) {itemString = `id:13061 `; iCumRate +=2;}//0.1�巡�� ������ �Ƹ� (������)
			case(2) {itemString = `id:13062 `; iCumRate +=2;}//0.1�巡�� ������ �Ƹ�(���̾�Ʈ ������)
			case(3) {itemString = `id:13063 `; iCumRate +=2;}//0.1�巡�� ������ �Ƹ�(���̾�Ʈ ������)
			case(4) {itemString = `id:16543 `; iCumRate +=4;}//0.2�巡�� ������ ��Ʋ��
			case(5) {itemString = `id:16544 `; iCumRate +=4;}//0.2�巡�� ������ ��Ʋ��(���̾�Ʈ��)
			case(6) {itemString = `id:17530 `; iCumRate +=4;}//0.2�巡�� ������ �׸���
			case(7) {itemString = `id:18577 `; iCumRate +=4;}//0.2�巡�� ������ �︧
			case(8) {itemString = `id:17029 suffix:30702`; iCumRate +=4;}//0.2��Ʈ ��Ŭ ����(���̺�)
			case(9) {itemString = `id:15323 `; iCumRate +=4;}//0.2�˶�� �ڽ�Ƭ
			case(10) {itemString = `id:18562 `; iCumRate +=4;}//0.2�˶�� ����
			case(11) {itemString = `id:17131 `; iCumRate +=4;}//0.2�˶�� ����
			case(12) {itemString = `id:15324 `; iCumRate +=4;}//0.2�ڽ��� �ڽ�Ƭ
			case(13) {itemString = `id:18563 `; iCumRate +=4;}//0.2�ڽ��� ����ũ
			case(14) {itemString = `id:15233  `; iCumRate +=4;}//0.2������Ʈ ��� �巹��(��Ÿ��)
			case(15) {itemString = `id:15234  `; iCumRate +=4;}//0.2������Ʈ ��� ��Ʈ
			case(16) {itemString = `id:15235  `; iCumRate +=4;}//0.2������Ʈ ��� �巹��(��Ÿ��)
			case(17) {itemString = `id:15220  `; iCumRate +=4;}//0.2�ֵ�̷� ��Ʈ(������)
			case(18) {itemString = `id:15221  `; iCumRate +=4;}//0.2�ֵ�̷� ��Ʈ(������)
			case(19) {itemString = `id:15222  `; iCumRate +=4;}//0.2�׷��̽� �� �巹��
			case(20) {itemString = `id:18154  `; iCumRate +=4;}//0.2�ֵ�̷� ����(������)
			case(21) {itemString = `id:18155  `; iCumRate +=4;}//0.2�ֵ�̷� ����(������)
			case(22) {itemString = `id:15250 `; iCumRate +=4;}//0.2���̵� �ǻ� �� Ÿ��
			case(23) {itemString = `id:15251 `; iCumRate +=4;}//0.2���̵� �ǻ� ��Ʈ Ÿ��
			case(24) {itemString = `id:15252 `; iCumRate +=4;}//0.2���� �ǻ�
			case(25) {itemString = `id:15117 suffix:31202`; iCumRate +=4;}//0.2������ ������ ���壨��Į��
			case(26) {itemString = `id:15117 suffix:31301`; iCumRate +=4;}//0.2������ ������ ���壨�����ʱ�����
			case(27) {itemString = `id:15116 suffix:31202`; iCumRate +=4;}//0.2������ ������ ���壨��Į��
			case(28) {itemString = `id:15116 suffix:31301`; iCumRate +=4;}//0.2������ ������ ���壨�����ʱ�����
			case(29) {itemString = `id:18176 `; iCumRate +=4;}//0.2���̵� �Ӹ���
			case(30) {itemString = `id:15260 `; iCumRate +=8;}//0.4�ٺ� ���� �÷��� ����(������)
			case(31) {itemString = `id:15261 `; iCumRate +=8;}//0.4�ٺ� ���� �÷��� ����(������)
			case(32) {itemString = `id:15079 `; iCumRate +=8;}//0.4������ �� ���� ��ĿƮ
			case(33) {itemString = `id:15045 `; iCumRate +=8;}//0.4���̽� �÷�Ŷ ����
			case(34) {itemString = `id:15131 `; iCumRate +=8;}//0.4�� �������� ��ĿƮ
			case(35) {itemString = `id:15259 `; iCumRate +=8;}//0.4�������� ���ڵ� ��Ʈ
			case(36) {itemString = `id:15180 `; iCumRate +=8;}//0.4�Ƶ��� ���߷� ��ũ����
			case(37) {itemString = `id:15113 `; iCumRate +=8;}//0.4������ �˻��б� ���� ��ƮŸ��
			case(38) {itemString = `id:15119 `; iCumRate +=8;}//0.4������ �˻��б� ���� ��Ÿ��
			case(39) {itemString = `id:15118 `; iCumRate +=8;}//0.4������ �˻��б� ���� ��ƮŸ��
			case(40) {itemString = `id:17055 `; iCumRate +=8;}//0.4Ʈ��� ��ī�� ����
			case(41) {itemString = `id:17066 `; iCumRate +=8;}//0.4�� ��ư �ޱ� ����
			case(42) {itemString = `id:15065 `; iCumRate +=8;}//0.4���� ����Ʈ ��ĿƮ
			case(43) {itemString = `id:63034 col1:c00000`; iCumRate +=8;}//0.4������ ���� ����
			case(44) {itemString = `id:63033 col1:000000`; iCumRate +=8;}//0.4������ ���� ����
			case(45) {itemString = `id:15115 `; iCumRate +=8;}//0.4���� �̴� ��ĿƮ
			case(46) {itemString = `id:15017 `; iCumRate +=8;}//0.4���̳��巹��
			case(47) {itemString = `id:18044 `; iCumRate +=8;}//0.4���˿� ����
			case(48) {itemString = `id:16519 `; iCumRate +=8;}//0.4��ȣȭ �尩
			case(49) {itemString = `id:18046 `; iCumRate +=8;}//0.4�հ��� �Ӹ����
			case(50) {itemString = `id:15124 `; iCumRate +=8;}//0.4Ŭ���� ������ ����
			case(51) {itemString = `id:15060 `; iCumRate +=8;}//0.4���� �̳ʷκ� ����
			case(52) {itemString = `id:17041 `; iCumRate +=8;}//0.4�������� ���ú���
			case(53) {itemString = `id:15064 `; iCumRate +=8;}//0.4���̵� ���� �巹��
			case(54) {itemString = `id:15070 `; iCumRate +=8;}//0.4���ĵ�Į�� �����긮��
			case(55) {itemString = `id:19007 `; iCumRate +=8;}//0.4�߱� ���÷� �κ�
			case(56) {itemString = `id:18060 `; iCumRate +=8;}//0.4�� �䳢 �Ӹ���5
			case(57) {itemString = `id:18065 `; iCumRate +=8;}//0.4���� �䳢 �Ӹ���5
			case(58) {itemString = `id:18070 `; iCumRate +=8;}//0.4�� �䳢 �Ӹ���5
			case(59) {itemString = `id:18051 `; iCumRate +=8;}//0.4�ڷ��� ���� ����
			case(60) {itemString = `id:15019 `; iCumRate +=8;}//0.4�ڷ��� ���ڽ�Ʈ(��)
			case(61) {itemString = `id:15067 `; iCumRate +=8;}//0.4����ǳ ���纹
			case(62) {itemString = `id:63069 `; iCumRate +=8;}//0.4�ݼ� ���� ����
			case(63) {itemString = `id:15055 `; iCumRate +=8;}//0.4���� �̴� ���ǽ�
			case(64) {itemString = `id:62005 suffix:30501`; iCumRate +=8;}//0.4��æƮ ��ũ�ѣ����̾�Ʈ��
			case(65) {itemString = `id:62005 suffix:30302`; iCumRate +=8;}//0.4��æƮ ��ũ�ѣ��ں�Ʈ��
			case(66) {itemString = `id:46006 `; iCumRate +=8;}//0.4ī��Ʈ �ǵ� 2
			case(67) {itemString = `id:15053 `; iCumRate +=8;}//0.4�÷�Į�� ���ǽ�
			case(68) {itemString = `id:15134 `; iCumRate +=8;}//0.4��� ������ ��Ʈ
			case(69) {itemString = `id:15136 `; iCumRate +=10;}//0.5��� ���̽� ��ĿƮ
			case(70) {itemString = `id:15063 `; iCumRate +=10;}//0.5���̾�� ���� ���ǽ�
			case(71) {itemString = `id:15108 `; iCumRate +=10;}//0.5���� ���̵� ��ũž
			case(72) {itemString = `id:15059 `; iCumRate +=10;}//0.5��ũ�� ��ũž �ݹ���
			case(73) {itemString = `id:15112 `; iCumRate +=10;}//0.5������ �����̷�
			case(74) {itemString = `id:17042 `; iCumRate +=10;}//0.5��Ƽ�� �ڷ��� ������Ż �� ����
			case(75) {itemString = `id:15074 `; iCumRate +=10;}//0.5���̽� ������ ��Ʈ
			case(76) {itemString = `id:15061 `; iCumRate +=10;}//0.5���ṫ�� ��Ʈ�� Ʃ��
			case(77) {itemString = `id:17040 `; iCumRate +=10;}//0.5���� ��Ʈ�� ����
			case(78) {itemString = `id:18525 `; iCumRate +=10;}//0.5���͵�� ĸ
			case(79) {itemString = `id:15014 `; iCumRate +=10;}//0.5�Ĺ߲��� ��
			case(80) {itemString = `id:18113 `; iCumRate +=10;}//0.5������ ����� ����
			case(81) {itemString = `id:18114 `; iCumRate +=10;}//0.5�ٹ��� ����� ����
			case(82) {itemString = `id:18115 `; iCumRate +=10;}//0.5�� ����� ����
			case(83) {itemString = `id:62005 suffix:30702`; iCumRate +=10;}//0.5��æƮ ��ũ�ѣ���ͣ�
			case(84) {itemString = `id:62005 prefix:207`; iCumRate +=10;}//0.5��æƮ ��ũ�ѣ����죩
			case(85) {itemString = `id:63030 col1:ffffff`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(86) {itemString = `id:63030 col1:00c000`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(87) {itemString = `id:63030 col1:0000c0`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(88) {itemString = `id:63030 col1:c0c000`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(89) {itemString = `id:63030 col1:c000c0`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(90) {itemString = `id:63030 col1:00c0c0`; iCumRate +=10;}//0.5���� ���� ���ã����� ����
			case(91) {itemString = `id:15029 `; iCumRate +=10;}//0.5��ũ �������̿�
			case(92) {itemString = `id:15151 `; iCumRate +=10;}//0.5���帶���� ���̽�Ʈ ���Ϸ� ����(������)
			case(93) {itemString = `id:15152 `; iCumRate +=10;}//0.5���帶���� ���̽�Ʈ ���Ϸ� ����(������)
			case(94) {itemString = `id:15153 `; iCumRate +=10;}//0.5���� �������� ��Ʈ(������)
			case(95) {itemString = `id:15154 `; iCumRate +=10;}//0.5���� �������� ��Ʈ(������)
			case(96) {itemString = `id:15032 `; iCumRate +=10;}//0.5������ �ݹ���
			case(97) {itemString = `id:15026 `; iCumRate +=10;}//0.5������ �ս�ĿƮ
			case(98) {itemString = `id:15016 `; iCumRate +=10;}//0.5����� ��Ÿŷ ������
			case(99) {itemString = `id:15051 `; iCumRate +=10;}//0.5Ÿ��Ʈ ��Ʈ ����
			case(100) {itemString = `id:15008 `; iCumRate +=10;}//0.5�˻��б� ����
			case(101) {itemString = `id:15212 `; iCumRate +=10;}//0.5�ݸ� ���� ����
			case(102) {itemString = `id:15137 `; iCumRate +=10;}//0.5������ ���� ��Ŷ ��Ʈ
			case(103) {itemString = `id:15127 `; iCumRate +=10;}//0.5������ Ʈ����ų� ��Ʈ
			case(104) {itemString = `id:19031 `; iCumRate +=10;}//0.5��Ÿ����Ʈ �κ�
			case(105) {itemString = `id:18011 `; iCumRate +=10;}//0.5��� ������ ĸ
			case(106) {itemString = `id:18124 `; iCumRate +=10;}//0.5���� �������� ��Ʈ ĸ
			case(107) {itemString = `id:18009 `; iCumRate +=10;}//0.5��� ���� ĸ
			case(108) {itemString = `id:18014 `; iCumRate +=10;}//0.5��� ����
			case(109) {itemString = `id:18000 `; iCumRate +=12;}//0.6��ũ ����
			case(110) {itemString = `id:16013 `; iCumRate +=12;}//0.6�˻� �尩
			case(111) {itemString = `id:16032 `; iCumRate +=12;}//0.6���� �۷���
			case(112) {itemString = `id:63030 `; iCumRate +=12;}//0.6���� ���� ����
			case(113) {itemString = `id:18112 `; iCumRate +=12;}//0.6�� ���� ��ǰ
			case(114) {itemString = `id:18111 `; iCumRate +=12;}//0.6���� ���� ��ǰ
			case(115) {itemString = `id:18110 `; iCumRate +=12;}//0.6���� ���� ��ǰ
			case(116) {itemString = `id:18109 `; iCumRate +=12;}//0.6���� ���� ��ǰ
			case(117) {itemString = `id:18108 `; iCumRate +=12;}//0.6���� ���� ��ǰ
			case(118) {itemString = `id:18029 `; iCumRate +=12;}//0.6������ �Ȱ�
			case(119) {itemString = `id:18028 `; iCumRate +=12;}//0.6���̽� �Ȱ�
			case(120) {itemString = `id:19008 `; iCumRate +=12;}//0.6���� �Ǵ� �κ�
			case(121) {itemString = `id:19009 `; iCumRate +=12;}//0.6���� ���� �κ�
			case(122) {itemString = `id:19017 `; iCumRate +=12;}//0.6���� �κ�
			case(123) {itemString = `id:19016 `; iCumRate +=12;}//0.6�� �κ�
			case(124) {itemString = `id:40053 `; iCumRate +=12;}//0.6����� ��� �ɴٹ�
			case(125) {itemString = `id:40051 `; iCumRate +=12;}//0.6����� ��� �Ѽ���
			case(126) {itemString = `id:18089 `; iCumRate +=12;}//0.6����� ��� ���
			case(127) {itemString = `id:40054 `; iCumRate +=12;}//0.6�Ķ� ��� �Ѽ���
			case(128) {itemString = `id:40052 `; iCumRate +=12;}//0.6�Ķ� ��� �Ѽ���
			case(129) {itemString = `id:16500 `; iCumRate +=12;}//0.6�ﳪ �������� �۷���
			case(130) {itemString = `id:19020 `; iCumRate +=12;}//0.6��Ÿ�� ����� ��Ʈ
			case(131) {itemString = `id:62005 prefix:7 `; iCumRate +=12;}//0.6��æƮ ��ũ�ѣ��������ͣ�
			case(132) {itemString = `id:16520 `; iCumRate +=12;}//0.6���� �۷���
			case(133) {itemString = `id:15128 `; iCumRate +=12;}//0.6�� �� ���� �巹��
			case(134) {itemString = `id:16019 `; iCumRate +=12;}//0.6�ٹ��� �ȸ� �尩
			case(135) {itemString = `id:18047 `; iCumRate +=12;}//0.6�ڷ��� ��Ʈ ����
			case(136) {itemString = `id:18008 `; iCumRate +=12;}//0.6��Ʈ������ ĸ
			case(137) {itemString = `id:15025 `; iCumRate +=12;}//0.6�����б� ���ڱ���
			case(138) {itemString = `id:18043 `; iCumRate +=12;}//0.6�ڷ��� ��Ʈ ����
			case(139) {itemString = `id:18026 `; iCumRate +=12;}//0.6��� ���θ���
			case(140) {itemString = `id:15052 `; iCumRate +=12;}//0.6��ũ�� ���� Ʃ��
			case(141) {itemString = `id:19005 `; iCumRate +=12;}//0.6���÷� �κ�
			case(142) {itemString = `id:18040 `; iCumRate +=12;}//0.6�ڷ��� ���� ������
			case(143) {itemString = `id:18038 `; iCumRate +=12;}//0.6���� �跿 ����
			case(144) {itemString = `id:15042 `; iCumRate +=12;}//0.6�ճ� ���ǽ�
			case(145) {itemString = `id:63025 count:3`; iCumRate +=12;}//0.6��뷮 �ູ�� ����
			case(146) {itemString = `id:51031 count:3`; iCumRate +=12;}//0.6���� ȸ���� ����
			case(147) {itemString = `id:51036 `; iCumRate +=12;}//0.6���̾�Ʈ ���� U
			case(148) {itemString = `id:51038 `; iCumRate +=12;}//0.6���̾�Ʈ ���� L
			case(149) {itemString = `id:51039 `; iCumRate +=12;}//0.6���̾�Ʈ ���� F
			case(150) {itemString = `id:17006 `; iCumRate +=12;}//0.6õ�Ź�
			case(151) {itemString = `id:18005 `; iCumRate +=12;}//0.6��� ���������
			case(152) {itemString = `id:18048 `; iCumRate +=12;}//0.6��� ����ì ������ ����
			case(153) {itemString = `id:15109 `; iCumRate +=12;}//0.6Ƽ�� ��Ʈ
			case(154) {itemString = `id:18087 `; iCumRate +=12;}//0.6��� �� ���
			case(155) {itemString = `id:18088 `; iCumRate +=12;}//0.6ȭ��
			case(156) {itemString = `id:18090 `; iCumRate +=12;}//0.6�Ķ� ��� ���
			case(157) {itemString = `id:40046 `; iCumRate +=12;}//0.6��� �� ���
			case(158) {itemString = `id:40047 `; iCumRate +=12;}//0.6��� �Ѽ���
			case(159) {itemString = `id:18541 `; iCumRate +=12;}//0.6��Ӹ� ����
			case(160) {itemString = `id:18103 `; iCumRate +=12;}//0.6���� ����
			case(161) {itemString = `id:18010 `; iCumRate +=12;}//0.6��� ����Ʈ ĸ
			case(162) {itemString = `id:17016 `; iCumRate +=12;}//0.6�ʵ� �Ĺ��
			case(163) {itemString = `id:17015 `; iCumRate +=12;}//0.6�Ĺ��
			case(164) {itemString = `id:17005 `; iCumRate +=12;}//0.6��ɲ� �Ź�
			case(165) {itemString = `id:17002 `; iCumRate +=12;}//0.6�˻� �Ź�
			case(166) {itemString = `id:17022 `; iCumRate +=12;}//0.6��������
			case(167) {itemString = `id:17001 `; iCumRate +=12;}//0.6���� ����
			case(168) {itemString = `id:17007 `; iCumRate +=12;}//0.6���� ����
			case(169) {itemString = `id:16009 `; iCumRate +=12;}//0.6��ɲ��尩
			case(170) {itemString = `id:15031 `; iCumRate +=12;}//0.6�����б��� ���� ����
			case(171) {itemString = `id:19012 `; iCumRate +=12;}//0.6Ʈ��� ���̾�� �κ�
			case(172) {itemString = `id:18004 `; iCumRate +=12;}//0.6��� �мǸ���
			case(173) {itemString = `id:15132 `; iCumRate +=12;}//0.6���߷� ����Ʈ ����
			case(174) {itemString = `id:15043 `; iCumRate +=12;}//0.6����Ƽ ���Ʈ
			case(175) {itemString = `id:17017 `; iCumRate +=12;}//0.6������Ʈ ����
			case(176) {itemString = `id:16006 `; iCumRate +=12;}//0.6����� �尩
			case(177) {itemString = `id:16017 `; iCumRate +=12;}//0.6���Ĵٵ� �۷���
			case(178) {itemString = `id:17060 `; iCumRate +=12;}//0.6���� �������� ��Ʈ ����(������)
			case(179) {itemString = `id:17061 `; iCumRate +=12;}//0.6���� �������� ��Ʈ ����(������)
			case(180) {itemString = `id:17019 `; iCumRate +=12;}//0.6�������� �Ź�
			case(181) {itemString = `id:17067 `; iCumRate +=12;}//0.6���� Ÿ�� �� ����
			case(182) {itemString = `id:17008 `; iCumRate +=12;}//0.6�ڷ��� ����(������)
			case(183) {itemString = `id:17010 `; iCumRate +=12;}//0.6�ڷ��� ����(������)
			case(184) {itemString = `id:17023 `; iCumRate +=12;}//0.6������ �Ź�
			case(185) {itemString = `id:16031 `; iCumRate +=12;}//0.6�������� Ÿ��Ʈ �۷���
			case(186) {itemString = `id:16026 `; iCumRate +=12;}//0.6���� �������� ��Ʈ �۷���
			case(187) {itemString = `id:16016 `; iCumRate +=12;}//0.6����Ʈ �۷���
			case(188) {itemString = `id:17003 `; iCumRate +=12;}//0.6���� �Ź�(������)
			case(189) {itemString = `id:17024 `; iCumRate +=12;}//0.6��� ����
			case(190) {itemString = `id:17013 `; iCumRate +=12;}//0.6�β��� ����
			case(191) {itemString = `id:17069 `; iCumRate +=12;}//0.6���� ����
			case(192) {itemString = `id:15020 `; iCumRate +=12;}//0.6�ڷ��� �����巹��
			case(193) {itemString = `id:15044 `; iCumRate +=12;}//0.6����� �۾���
			case(194) {itemString = `id:15041 `; iCumRate +=12;}//0.6�繫�� ������ ��Ʈ
			case(195) {itemString = `id:15027 `; iCumRate +=12;}//0.6��� �ս�ĿƮ
			case(196) {itemString = `id:15018 `; iCumRate +=12;}//0.6��� �����ڿ�(������)
			case(197) {itemString = `id:15033 `; iCumRate +=12;}//0.6��� �����ڿ�(������)
			case(198) {itemString = `id:15023 `; iCumRate +=12;}//0.6��ũ ��ɲۿ�(������)
			case(199) {itemString = `id:15035 `; iCumRate +=12;}//0.6��ũ ��ɲۿ�(������)
			case(200) {itemString = `id:19003 `; iCumRate +=12;}//0.6Ʈ���ݷθ� �κ�
			case(201) {itemString = `id:18002 `; iCumRate +=12;}//0.6��� ĸ
			case(202) {itemString = `id:18007 `; iCumRate +=12;}//0.6���� ĸ
			case(203) {itemString = `id:18013 `; iCumRate +=12;}//0.6�ڷ��� ĸ
			case(204) {itemString = `id:18156 `; iCumRate +=12;}//0.6��� ����
			case(205) {itemString = `id:18042 `; iCumRate +=12;}//0.6�ڷ��� ����� ����
			case(206) {itemString = `id:18003 `; iCumRate +=12;}//0.6������ ĸ
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
