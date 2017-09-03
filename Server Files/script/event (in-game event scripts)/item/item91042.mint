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
	//�߼� ������
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(2472);	//Ȯ���� ������ ���´�
	meta_array itemArray;
	bool bCashGachaphonGived = false;

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 				case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15184 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	�׶� ���̼�Ʈ ���� ����
			case(1){itemString = `id:15112 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	������ �����̷�
			case(2){itemString = `id:15065 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	���� ����Ʈ ��ĿƮ
			case(3){itemString = `id:19007 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	�߱� ���÷� �κ�
			case(4){itemString = `id:18552`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� �︧(�ΰ�/���̾�Ʈ)
			case(5){itemString = `id:14039`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� �Ƹ�(�ΰ�)
			case(6){itemString = `id:14040`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� �Ƹ�(����)
			case(7){itemString = `id:14041`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� �Ƹ�(�ΰ�)
			case(8){itemString = `id:17095`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� ����
			case(9){itemString = `id:16532`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� ��Ʋ��(�ΰ�)
			case(10){itemString = `id:16533`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� ��Ʋ��(����)
			case(11){itemString = `id:15269`; iCumRate += 1;} //	0.04048583 	�߼� �� ������_�׾��� ������
			case(12){itemString = `id:18182`; iCumRate += 1;} //	0.04048583 	�߼� �� ������_�׾��� �Ӹ����
			case(13){itemString = `id:80000`; iCumRate += 2;} //	0.08097166 	������ ���� ��
			case(14){itemString = `id:80001`; iCumRate += 2;} //	0.08097166 	����� ��
			case(15){itemString = `id:80002`; iCumRate += 2;} //	0.08097166 	��ũ�� ��Ʈ
			case(16){itemString = `id:80003`; iCumRate += 2;} //	0.08097166 	������ ��Ʈ
			case(17){itemString = `id:80004`; iCumRate += 2;} //	0.08097166 	������ ����� �� ��
			case(18){itemString = `id:80005`; iCumRate += 2;} //	0.08097166 	������ �Ͼ�� �� ��
			case(19){itemString = `id:80006`; iCumRate += 2;} //	0.08097166 	������ ��ũ�� �� ��
			case(20){itemString = `id:15151 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���帶���� ���̽�Ʈ ���Ϸ� ����(������)
			case(21){itemString = `id:15152 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���帶���� ���̽�Ʈ ���Ϸ� ����(������)
			case(22){itemString = `id:15153 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���� �������� ��Ʈ(������)
			case(23){itemString = `id:15154 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���� �������� ��Ʈ(������)
			case(24){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	�̵�ī�� ������ ����(������)
			case(25){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	�̵�ī�� ������ ����(������)
			case(26){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���� ������ �Ǻ�(������)
			case(27){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	���� ������ �Ǻ�(������)
			case(28){itemString = `id:40033 durability:18000 durability_max:18000`; iCumRate += 2;} //	0.08097166 	ũ���̸��
			case(29){itemString = `id:40083 durability:15000 durability_max:15000`; iCumRate += 2;} //	0.08097166 	��ĿƲ����
			case(30){itemString = `id:13047 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(31){itemString = `id:13048 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(32){itemString = `id:14005`; iCumRate += 2;} //	0.08097166 	������� ��������
			case(33){itemString = `id:14006`; iCumRate += 2;} //	0.08097166 	���� ����
			case(34){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate += 2;} //	0.08097166 	���� ����
			case(35){itemString = `id:40030 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	���ڵ�ҵ�
			case(36){itemString = `id:40078 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	����Ͻ�
			case(37){itemString = `id:40017 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 8;} //	0.32388664 	������
			case(38){itemString = `id:40050 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 8;} //	0.32388664 	�����
			case(39){itemString = `id:40004 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	��Ʈ
			case(40){itemString = `id:40048 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	�ֽ�
			case(41){itemString = `id:40042 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 8;} //	0.32388664 	��Į
			case(42){itemString = `id:40043 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 8;} //	0.32388664 	���׿� �д�
			case(43){itemString = `id:40044 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	�ٿ뵵 ����
			case(44){itemString = `id:40045 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	���˴�
			case(45){itemString = `id:40081`; iCumRate += 12;} //	0.48582996 	���� �� ����
			case(46){itemString = `id:15023`; iCumRate += 12;} //	0.48582996 	��ũ ��ɲۿ�
			case(47){itemString = `id:40079`; iCumRate += 12;} //	0.48582996 	���̽�
			case(48){itemString = `id:40031`; iCumRate += 12;} //	0.48582996 	����
			case(49){itemString = `id:40013`; iCumRate += 12;} //	0.48582996 	�� ����
			case(50){itemString = `id:40014`; iCumRate += 12;} //	0.48582996 	������ ����
			case(51){itemString = `id:46006`; iCumRate += 12;} //	0.48582996 	ī��Ʈ �ǵ�
			case(52){itemString = `id:40011`; iCumRate += 12;} //	0.48582996 	��ε� �ҵ�
			case(53){itemString = `id:46001`; iCumRate += 12;} //	0.48582996 	���� �ǵ�
			case(54){itemString = `id:14013`; iCumRate += 12;} //	0.48582996 	�θ�ī
			case(55){itemString = `id:14019`; iCumRate += 12;} //	0.48582996 	�׷��̽� �÷���Ʈ �Ƹ�
			case(56){itemString = `id:19007`; iCumRate += 12;} //	0.48582996 	�߱� ���÷� �κ�
			case(57){itemString = `id:15135`; iCumRate += 12;} //	0.48582996 	��ũ ��Ʈ
			case(58){itemString = `id:40015`; iCumRate += 12;} //	0.48582996 	�÷�Ʈ �� �ҵ�
			case(59){itemString = `id:17071`; iCumRate += 12;} //	0.48582996 	������ ����
			case(60){itemString = `id:15153`; iCumRate += 12;} //	0.48582996 	���� �������� ��Ʈ(������)
			case(61){itemString = `id:13047`; iCumRate += 12;} //	0.48582996 	Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(62){itemString = `id:17041`; iCumRate += 12;} //	0.48582996 	�������� ���ú���
			case(63){itemString = `id:46008`; iCumRate += 12;} //	0.48582996 	����Ʈ ���׷� ī��Ʈ �ǵ�
			case(64){itemString = `id:15055`; iCumRate += 12;} //	0.48582996 	���� �̴� ���ǽ�
			case(65){itemString = `id:15053`; iCumRate += 12;} //	0.48582996 	�÷�Į�� ���ǽ�
			case(66){itemString = `id:40030`; iCumRate += 12;} //	0.48582996 	�� �ڵ�� �ҵ�
			case(67){itemString = `id:17045`; iCumRate += 12;} //	0.48582996 	���� �� ���� ���� ����
			case(68){itemString = `id:14004`; iCumRate += 12;} //	0.48582996 	Ŭ�ν� ����
			case(69){itemString = `id:17040`; iCumRate += 12;} //	0.48582996 	���� ��Ʈ�� ����
			case(70){itemString = `id:18516`; iCumRate += 12;} //	0.48582996 	�̺� ���� ũ���
			case(71){itemString = `id:18521`; iCumRate += 12;} //	0.48582996 	�����Ǿ� ����
			case(72){itemString = `id:15005`; iCumRate += 12;} //	0.48582996 	���谡 ��Ʈ
			case(73){itemString = `id:18525`; iCumRate += 12;} //	0.48582996 	���͵�� ĸ
			case(74){itemString = `id:18511`; iCumRate += 12;} //	0.48582996 	�÷�Ʈ Ǯ �︧
			case(75){itemString = `id:18506`; iCumRate += 12;} //	0.48582996 	�� ���� �︧
			case(76){itemString = `id:16505`; iCumRate += 12;} //	0.48582996 	�÷�Ʈ ��Ʋ��
			case(77){itemString = `id:18502`; iCumRate += 12;} //	0.48582996 	�� �︧
			case(78){itemString = `id:15014`; iCumRate += 12;} //	0.48582996 	�Ĺ߲��� ��
			case(79){itemString = `id:18115`; iCumRate += 12;} //	0.48582996 	�� ����� ����
			case(80){itemString = `id:18112`; iCumRate += 12;} //	0.48582996 	�� ���� ��ǰ
			case(81){itemString = `id:18111`; iCumRate += 12;} //	0.48582996 	���� ���� ��ǰ
			case(82){itemString = `id:18110`; iCumRate += 12;} //	0.48582996 	���� ���� ��ǰ
			case(83){itemString = `id:18109`; iCumRate += 12;} //	0.48582996 	���� ���� ��ǰ
			case(84){itemString = `id:18108`; iCumRate += 12;} //	0.48582996 	���� ���� ��ǰ
			case(85){itemString = `id:18547`; iCumRate += 12;} //	0.48582996 	�ĳ��� ��� ��������
			case(86){itemString = `id:19020`; iCumRate += 12;} //	0.48582996 	��Ÿ�� ����� ��Ʈ
			case(87){itemString = `id:16520`; iCumRate += 12;} //	0.48582996 	�� ���� �۷���
			case(88){itemString = `id:19012`; iCumRate += 12;} //	0.48582996 	Ʈ��� ���̾�� �κ�
			case(89){itemString = `id:18004`; iCumRate += 12;} //	0.48582996 	��� �мǸ���
			case(90){itemString = `id:15132`; iCumRate += 12;} //	0.48582996 	���߷� ����Ʈ ����
			case(91){itemString = `id:15043`; iCumRate += 12;} //	0.48582996 	����Ƽ ���Ʈ
			case(92){itemString = `id:15033`; iCumRate += 12;} //	0.48582996 	��� �����ڿ�
			case(93){itemString = `id:51003 count:10`; iCumRate += 12;} //	0.48582996 	����� 50 ����
			case(94){itemString = `id:51004 count:10`; iCumRate += 12;} //	0.48582996 	����� 100 ����
			case(95){itemString = `id:51007 count:10`; iCumRate += 12;} //	0.48582996 	���� 30 ����
			case(96){itemString = `id:51008 count:10`; iCumRate += 12;} //	0.48582996 	���� 50 ����
			case(97){itemString = `id:51013 count:10`; iCumRate += 12;} //	0.48582996 	���¹̳� 50 ����
			case(98){itemString = `id:51014 count:10`; iCumRate += 12;} //	0.48582996 	���¹̳� 100 ����
			case(99){itemString = `id:51001 count:10`; iCumRate += 12;} //	0.48582996 	����� 10 ����
			case(100){itemString = `id:51002 count:10`; iCumRate += 12;} //	0.48582996 	����� 30 ����
			case(101){itemString = `id:51022 count:10`; iCumRate += 12;} //	0.48582996 	����°� ���� 30 ����
			case(102){itemString = `id:51027 count:10`; iCumRate += 12;} //	0.48582996 	����°� ���¹̳� 30 ����
			case(103){itemString = `id:51028 count:10`; iCumRate += 12;} //	0.48582996 	����°� ���¹̳� 50 ����
			case(104){itemString = `id:18029`; iCumRate += 14;} //	0.56680162 	������ �Ȱ�
			case(105){itemString = `id:18028`; iCumRate += 14;} //	0.56680162 	���̽� �Ȱ�
			case(106){itemString = `id:40038`; iCumRate += 14;} //	0.56680162 	����Ʈ�� ����
			case(107){itemString = `id:40039`; iCumRate += 14;} //	0.56680162 	���̽� ����
			case(108){itemString = `id:40040`; iCumRate += 14;} //	0.56680162 	���̾� ����
			case(109){itemString = `id:40041`; iCumRate += 14;} //	0.56680162 	Ÿ�ݿ� ����
			case(110){itemString = `id:40090`; iCumRate += 14;} //	0.56680162 	���� ����
			case(111){itemString = `id:18542`; iCumRate += 14;} //	0.56680162 	�� ü�� Ǯ �︧
			case(112){itemString = `id:18543`; iCumRate += 14;} //	0.56680162 	���� Ǯ �︧
			case(113){itemString = `id:18544`; iCumRate += 14;} //	0.56680162 	�縮ĭ ��������
			case(114){itemString = `id:15128`; iCumRate += 14;} //	0.56680162 	�� �� ���� �巹��
			case(115){itemString = `id:16019`; iCumRate += 14;} //	0.56680162 	�ٹ��� �ȸ� �尩
			case(116){itemString = `id:18047`; iCumRate += 14;} //	0.56680162 	�ڷ��� ��Ʈ ����
			case(117){itemString = `id:15052`; iCumRate += 14;} //	0.56680162 	��ũ�� ���� Ʃ��
			case(118){itemString = `id:19005`; iCumRate += 14;} //	0.56680162 	���÷� �κ�
			case(119){itemString = `id:2001`; iCumRate += 14;} //	0.56680162 	��ȭ �ָӴ�
			case(120){itemString = `id:2006`; iCumRate += 14;} //	0.56680162 	ū ��ȭ �ָӴ�
			case(121){itemString = `id:18010`; iCumRate += 14;} //	0.56680162 	��� ����Ʈ ĸ
			case(122){itemString = `id:15131`; iCumRate += 14;} //	0.56680162 	�� �������� ��ĿƮ
			case(123){itemString = `id:18008`; iCumRate += 14;} //	0.56680162 	��Ʈ������ ĸ
			case(124){itemString = `id:16008`; iCumRate += 14;} //	0.56680162 	�ڷ��� ���� �۷���
			case(125){itemString = `id:15028`; iCumRate += 14;} //	0.56680162 	�ڷ��� ������Ʈ
			case(126){itemString = `id:17506`; iCumRate += 14;} //	0.56680162 	�ձ׸��� ����
			case(127){itemString = `id:18026`; iCumRate += 14;} //	0.56680162 	��� ���θ���
			case(128){itemString = `id:18040`; iCumRate += 14;} //	0.56680162 	�ڷ��� ���� ������
			case(129){itemString = `id:18038`; iCumRate += 14;} //	0.56680162 	���� �跿 ����
			case(130){itemString = `id:15042`; iCumRate += 14;} //	0.56680162 	�ճ� ���ǽ�
			case(131){itemString = `id:40012`; iCumRate += 14;} //	0.56680162 	�ٽ�Ÿ�� �ҵ�
			case(132){itemString = `id:17016`; iCumRate += 14;} //	0.56680162 	�ʵ� �Ĺ��
			case(133){itemString = `id:17015`; iCumRate += 14;} //	0.56680162 	�Ĺ��
			case(134){itemString = `id:17005`; iCumRate += 14;} //	0.56680162 	��ɲ� �Ź�
			case(135){itemString = `id:17002`; iCumRate += 14;} //	0.56680162 	�˻� �Ź�
			case(136){itemString = `id:17022`; iCumRate += 14;} //	0.56680162 	��������
			case(137){itemString = `id:17001`; iCumRate += 14;} //	0.56680162 	���� ����
			case(138){itemString = `id:17007`; iCumRate += 14;} //	0.56680162 	���� ����
			case(139){itemString = `id:16009`; iCumRate += 14;} //	0.56680162 	��ɲ��尩
			case(140){itemString = `id:40097`; iCumRate += 14;} //	0.56680162 	L �ε�
			case(141){itemString = `id:15031`; iCumRate += 14;} //	0.56680162 	�����б� ����
			case(142){itemString = `id:51029 count:10`; iCumRate += 15;} //	0.60728745 	����°� ���¹̳� 100 ����
			case(143){itemString = `id:62005 suffix:31002`; iCumRate += 16;} //	0.64777328 	��æƮ ��ũ��(���)
			case(144){itemString = `id:62005 suffix:30302`; iCumRate += 16;} //	0.64777328 	��æƮ ��ũ��(�ں�Ʈ)
			case(145){itemString = `id:62005 prefix:20615`; iCumRate += 16;} //	0.64777328 	�縷�Ź�
			case(146){itemString = `id:62005 prefix:20508`; iCumRate += 16;} //	0.64777328 	������
			case(147){itemString = `id:62005 prefix:20618`; iCumRate += 16;} //	0.64777328 	�����̴�
			case(148){itemString = `id:62005 prefix:20718`; iCumRate += 16;} //	0.64777328 	�̻���
			case(149){itemString = `id:62005 prefix:20212`; iCumRate += 16;} //	0.64777328 	������
			case(150){itemString = `id:62005 prefix:20412`; iCumRate += 16;} //	0.64777328 	����
			case(151){itemString = `id:62005 prefix:20619`; iCumRate += 16;} //	0.64777328 	Ư����
			case(152){itemString = `id:62005 suffix:30616`; iCumRate += 16;} //	0.64777328 	������
			case(153){itemString = `id:62005 suffix:30617`; iCumRate += 16;} //	0.64777328 	������
			case(154){itemString = `id:62005 suffix:30618`; iCumRate += 16;} //	0.64777328 	������
			case(155){itemString = `id:62005 suffix:30726`; iCumRate += 16;} //	0.64777328 	�ϸ��
			case(156){itemString = `id:62005 suffix:30629`; iCumRate += 16;} //	0.64777328 	��ε�
			case(157){itemString = `id:62005 suffix:30727`; iCumRate += 16;} //	0.64777328 	�ұ�
			case(158){itemString = `id:62005 suffix:30630`; iCumRate += 16;} //	0.64777328 	����
			case(159){itemString = `id:62005 prefix:20505`; iCumRate += 16;} //	0.64777328 	���ڵ�
			case(160){itemString = `id:62005 prefix:20209`; iCumRate += 16;} //	0.64777328 	������
			case(161){itemString = `id:62005 prefix:20409`; iCumRate += 16;} //	0.64777328 	�縷����
			case(162){itemString = `id:63000 count:10`; iCumRate += 16;} //	0.64777328 	�Ǵн��� ����
			case(163){itemString = `id:50164 quality:100`; iCumRate += 16;} //	0.64777328 	T�� ������ũ
			case(164){itemString = `id:50165 quality:100`; iCumRate += 16;} //	0.64777328 	ġ�� �׶���
			case(165){itemString = `id:50166 quality:100`; iCumRate += 16;} //	0.64777328 	ī�� ���̽�
			case(166){itemString = `id:50167 quality:100`; iCumRate += 16;} //	0.64777328 	�� �� ��
			case(167){itemString = `id:50168 quality:100`; iCumRate += 16;} //	0.64777328 	�۾���
			case(168){itemString = `id:50178 quality:100`; iCumRate += 16;} //	0.64777328 	������ �ֽ�
			case(169){itemString = `id:50179 quality:100`; iCumRate += 16;} //	0.64777328 	���� �ֽ�
			case(170){itemString = `id:50182 quality:100`; iCumRate += 16;} //	0.64777328 	�긮��� ����Ű
			case(171){itemString = `id:50199 quality:100`; iCumRate += 16;} //	0.64777328 	��ũ�� ����̹�
			case(172){itemString = `id:50200 quality:100`; iCumRate += 16;} //	0.64777328 	���� ����
			case(173){itemString = `id:50201 quality:100`; iCumRate += 16;} //	0.64777328 	BnR
			case(174){itemString = `id:50202 quality:100`; iCumRate += 16;} //	0.64777328 	Ű�� �� �� ����
			case(175){itemString = `id:50203 quality:100`; iCumRate += 16;} //	0.64777328 	���� ��������
			case(176){itemString = `id:50183 quality:100`; iCumRate += 16;} //	0.64777328 	����Ͻ� �����
			case(177){itemString = `id:50123 quality:100`; iCumRate += 16;} //	0.64777328 	����������
			case(178){itemString = `id:50124 quality:100`; iCumRate += 16;} //	0.64777328 	���� ������ũ
			case(179){itemString = `id:62005 prefix:20203`; iCumRate += 18;} //	0.72874494 	��ġ����
			case(180){itemString = `id:62005 prefix:21003`; iCumRate += 18;} //	0.72874494 	�ĸ���
			case(181){itemString = `id:62005 suffix:30201`; iCumRate += 18;} //	0.72874494 	������
			case(182){itemString = `id:62005 suffix:30302`; iCumRate += 18;} //	0.72874494 	�ں�Ʈ
			case(183){itemString = `id:62005 prefix:20201`; iCumRate += 18;} //	0.72874494 	�ϵ�
			case(184){itemString = `id:62005 suffix:30304`; iCumRate += 18;} //	0.72874494 	ȸ������
			case(185){itemString = `id:62005 suffix:30702`; iCumRate += 18;} //	0.72874494 	���̺�
			case(186){itemString = `id:62005 suffix:30704`; iCumRate += 18;} //	0.72874494 	���鸮
			case(187){itemString = `id:62005 suffix:30801`; iCumRate += 18;} //	0.72874494 	������
			case(188){itemString = `id:62005 suffix:30802`; iCumRate += 18;} //	0.72874494 	ī����
			case(189){itemString = `id:62005 suffix:30803`; iCumRate += 18;} //	0.72874494 	�����
			case(190){itemString = `id:62005 suffix:30804`; iCumRate += 18;} //	0.72874494 	���Ž�
			case(191){itemString = `id:62005 prefix:20405`; iCumRate += 18;} //	0.72874494 	��ģ
			case(192){itemString = `id:62005 prefix:20501`; iCumRate += 18;} //	0.72874494 	������
			case(193){itemString = `id:62005 prefix:20602`; iCumRate += 18;} //	0.72874494 	�߰���
			case(194){itemString = `id:62005 prefix:20701`; iCumRate += 18;} //	0.72874494 	�ż�
			case(195){itemString = `id:62005 suffix:30506`; iCumRate += 18;} //	0.72874494 	�ż���
			case(196){itemString = `id:62005 suffix:30614`; iCumRate += 18;} //	0.72874494 	�����
			case(197){itemString = `id:62005 prefix:20108`; iCumRate += 18;} //	0.72874494 	Ű��
			case(198){itemString = `id:62005 prefix:20304`; iCumRate += 18;} //	0.72874494 	Ÿ��
			case(199){itemString = `id:91006 expire:43200`; iCumRate += 20;} //	0.80971660 	ü����ȭ����10
			case(200){itemString = `id:91007 expire:43200`; iCumRate += 20;} //	0.80971660 	ü����ȭ����17
			case(201){itemString = `id:91034`; iCumRate += 38;} //	1.53846154 	����ġ ���� ����
			case(202){itemString = `id:50377`; iCumRate += 38;} //	1.53846154 	�߼� �� ������_�ҷ���� ���� ����
			case(203){itemString = `id:50378`; iCumRate += 38;} //	1.53846154 	�߼� �� ������_���� ����
			case(204){itemString = `id:18553`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� �︧(����)
			case(205){itemString = `id:16535`; iCumRate += 1;} //	0.04048583 	���̳� �巡�� ��Ʋ��(���̾�Ʈ)
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
			bCashGachaphonGived = true;
		}
		if (bCashGachaphonGived)
		{
			break;
		}
		++i;
	}
	// �߼� �������� ���޾Ҵ�.
	if (!bCashGachaphonGived)
	{
		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
	}	
}
