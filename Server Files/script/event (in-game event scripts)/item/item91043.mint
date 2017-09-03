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
	//�м� ������(����)
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)
	{

		int iCumRate = 0; //Ȯ���� �����س��� ����
		int totalRate = 2992;
		int tempRate = 0;
		int itemRate = 0;
		int i=0;
		int iRandom = Random(totalRate);	//Ȯ���� ������ ���´�

		while(true)
		{
			tempRate = iCumRate;
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				case(0){itemString = `id:19083 `; iCumRate += 2;} //0.06684492�������� ������Ʈ
				case(1){itemString = `id:15595 `; iCumRate += 2;} //0.06684492�������� ���� �ǻ� (������)
				case(2){itemString = `id:15594 `; iCumRate += 2;} //0.06684492�������� ���� �ǻ� (������)
				case(3){itemString = `id:18312 `; iCumRate += 2;} //0.06684492�������� ���� ���� (������)
				case(4){itemString = `id:18313 `; iCumRate += 2;} //0.06684492�������� ���� ���� (������)
				case(5){itemString = `id:17231 `; iCumRate += 2;} //0.06684492�������� ��������  (������)
				case(6){itemString = `id:17232 `; iCumRate += 2;} //0.06684492�������� ��������  (������)
				case(7){itemString = `id:15555 `; iCumRate += 2;} //0.06684492�ٳ���������Ÿ�����ũ�巹��
				case(8){itemString = `id:15556 `; iCumRate += 2;} //0.06684492�ٳ���������Ÿ�����ũ����
				case(9){itemString = `id:16065 `; iCumRate += 2;} //0.06684492�ٳ����ٺ긣�극����Ʈ
				case(10){itemString = `id:17212 `; iCumRate += 2;} //0.06684492�ٳ���������Ʈ
				case(11){itemString = `id:17213 `; iCumRate += 2;} //0.06684492�ٳ����㳪����
				case(12){itemString = `id:18582 `; iCumRate += 3;} //0.10026738��Ƽũ ���̽� ��� �巹��
				case(13){itemString = `id:15408 `; iCumRate += 3;} //0.10026738��Ƽũ ���� �ױ۸���
				case(14){itemString = `id:17158 `; iCumRate += 3;} //0.10026738��Ƽũ ���̽� ������
				case(15){itemString = `id:15406 `; iCumRate += 3;} //0.10026738ĳ��� ��Ʈ AŸ��
				case(16){itemString = `id:15407 `; iCumRate += 3;} //0.10026738ĳ��� ��Ʈ BŸ��
				case(17){itemString = `id:15267 `; iCumRate += 3;} //0.10026738�׶���ũ�ĸ��巹��
				case(18){itemString = `id:15268 `; iCumRate += 3;} //0.10026738�׶���ũ��ũ��Ʈ
				case(19){itemString = `id:15233 `; iCumRate += 3;} //0.10026738������Ʈ ��� �巹��(��)
				case(20){itemString = `id:15235 `; iCumRate += 3;} //0.10026738������Ʈ ��� �巹��(��Ʈ)
				case(21){itemString = `id:15234 `; iCumRate += 3;} //0.10026738������Ʈ ��� ��Ʈ
				case(22){itemString = `id:15217 `; iCumRate += 3;} //0.10026738�������� ���ǽ�
				case(23){itemString = `id:15315 `; iCumRate += 3;} //0.10026738�ƽ�ƾ�ܵ�Ʈ
				case(24){itemString = `id:18227 `; iCumRate += 3;} //0.10026738�ƽ�ƾĳ��
				case(25){itemString = `id:16053 `; iCumRate += 3;} //0.10026738�ƽ��÷κ�
				case(26){itemString = `id:17126 `; iCumRate += 3;} //0.10026738�ƽ�ƾ����
				case(27){itemString = `id:15314 `; iCumRate += 3;} //0.10026738���ī��������
				case(28){itemString = `id:18226 `; iCumRate += 3;} //0.10026738���īĳ��
				case(29){itemString = `id:16052 `; iCumRate += 3;} //0.10026738���ī�ձ׷κ�
				case(30){itemString = `id:17125 `; iCumRate += 3;} //0.10026738���ī������Ʈ
				case(31){itemString = `id:15338 `; iCumRate += 3;} //0.10026738�θ�ƽ �̺�� �巹��
				case(32){itemString = `id:15339 `; iCumRate += 3;} //0.10026738�θ�ƽ���̸���Ʈ
				case(33){itemString = `id:17135 `; iCumRate += 3;} //0.10026738������ ������
				case(34){itemString = `id:17136 `; iCumRate += 3;} //0.10026738Ŭ���� ����
				case(35){itemString = `id:15305 `; iCumRate += 3;} //0.10026738����Ÿ�ø�Ű�巹��
				case(36){itemString = `id:15306 `; iCumRate += 3;} //0.10026738Ʈ���������������
				case(37){itemString = `id:16047 `; iCumRate += 3;} //0.10026738����Ÿ�ø�Ű�׷κ�
				case(38){itemString = `id:16050 `; iCumRate += 3;} //0.10026738Ʈ���� 4 ��ư �۷κ�
				case(39){itemString = `id:17120 `; iCumRate += 3;} //0.10026738����Ÿ�����ũ���Ʈ
				case(40){itemString = `id:17121 `; iCumRate += 3;} //0.10026738Ʈ������
				case(41){itemString = `id:18213 `; iCumRate += 3;} //0.10026738����ŸƮ�θ���
				case(42){itemString = `id:18214 `; iCumRate += 3;} //0.10026738Ʈ�����������Ÿ��
				case(43){itemString = `id:15250 `; iCumRate += 3;} //0.10026738���̵��(��)
				case(44){itemString = `id:15251 `; iCumRate += 3;} //0.10026738���̵��(��Ʈ)
				case(45){itemString = `id:15252 `; iCumRate += 3;} //0.10026738�����
				case(46){itemString = `id:18176 `; iCumRate += 3;} //0.10026738��� �巹��(���̵��� �Ӹ��� �Ӹ� ġ��)
				case(47){itemString = `id:15079 `; iCumRate += 3;} //0.10026738������ �ص� ���۽�ĿƮ
				case(48){itemString = `id:15117 suffix:31202`; iCumRate += 3;} //0.10026738���� ��Ʈ ������(��Į)
				case(49){itemString = `id:15117 suffix:31301`; iCumRate += 3;} //0.10026738���� ��Ʈ ������(� �ʱ���)
				case(50){itemString = `id:15116 suffix:31202`; iCumRate += 3;} //0.10026738���� ��Ʈ ������(��Į)
				case(51){itemString = `id:15116 suffix:31301`; iCumRate += 3;} //0.10026738���� ��Ʈ ������(� �ʱ���)
				case(52){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate += 4;} //0.13368984��� �������� ����
				case(53){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984������ �������� ����
				case(54){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate += 4;} //0.13368984Ƽ�� ��Ʈ
				case(55){itemString = `id:15260 `; iCumRate += 4;} //0.13368984���� ���� �������� ����(������)
				case(56){itemString = `id:15261 `; iCumRate += 4;} //0.13368984���� ���� �������� ����(������)
				case(57){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate += 4;} //0.13368984���̽� �ö�ƽ ���� ��Ʈ
				case(58){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984�� �������� ��ĿƮ
				case(59){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984�����������ڵ彺Ʈ
				case(60){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984�Ƶ����󸣳�ũ����
				case(61){itemString = `id:15113 `; iCumRate += 4;} //0.13368984�˻� �б��� ���� ��Ʈ Ÿ��
				case(62){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984�˻� �б��� ���� �� Ÿ��(������)
				case(63){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984�˻� �б��� ���� ��Ʈ Ÿ��(������)
				case(64){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate += 4;} //0.13368984Ʈ�����ī�ź�Ʈ
				case(65){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate += 4;} //0.13368984�� ��ư ��Ŭ ����
				case(66){itemString = `id:15065 `; iCumRate += 4;} //0.13368984���� ����Ʈ ��ĿƮ
				case(67){itemString = `id:63034 col1:c00000`; iCumRate += 4;} //0.13368984���� ���� ����(Į�� ����)
				case(68){itemString = `id:63033 col1:000000`; iCumRate += 4;} //0.13368984���� ���� ����(Į�� ����)
				case(69){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984Ʈ������׵�̴Ͻ�īƮ
				case(70){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984���̳� �巹��
				case(71){itemString = `id:18044 `; iCumRate += 4;} //0.13368984����
				case(72){itemString = `id:16519 `; iCumRate += 4;} //0.13368984��ȣȭ�� �尩
				case(73){itemString = `id:18046 `; iCumRate += 4;} //0.13368984ũ��� �Ǽ��縮
				case(74){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984Ŭ���� ������ ����
				case(75){itemString = `id:15060 `; iCumRate += 4;} //0.13368984���� �̳� �κ� ����
				case(76){itemString = `id:17041 `; iCumRate += 4;} //0.13368984���� ����
				case(77){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984���̵� ���� �巹��
				case(78){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984���ĵ� Į�� �����긮��
				case(79){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984�߱� ���÷� �κ�
				case(80){itemString = `id:18060 `; iCumRate += 4;} //0.13368984���� ��� 5
				case(81){itemString = `id:18065 `; iCumRate += 4;} //0.13368984������ ���� ��� 5
				case(82){itemString = `id:18070 `; iCumRate += 4;} //0.13368984���� ���� ��� 5
				case(83){itemString = `id:18051 `; iCumRate += 4;} //0.13368984�ڷ������� ����
				case(84){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate += 4;} //0.13368984�ڷ��� ���� ��Ʈ
				case(85){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984����� BUSHI ����
				case(86){itemString = `id:15396 `; iCumRate += 4;} //0.13368984�����׵�Ƽ�Ƶ彺Ʈ
				case(87){itemString = `id:15397 `; iCumRate += 4;} //0.13368984�����׵帶Ÿ��Ƽ��Ʈ
				case(88){itemString = `id:15398 `; iCumRate += 4;} //0.13368984�����׵�޵�ٸ�����Ʈ
				case(89){itemString = `id:15399 `; iCumRate += 4;} //0.13368984�����׵�ī�ٸ�����Ʈ
				case(90){itemString = `id:15401 `; iCumRate += 4;} //0.13368984�����׵巹�̾ߵ�巹��
				case(91){itemString = `id:15402 `; iCumRate += 4;} //0.13368984�����׵帶Ÿ��Ƽ�巹��
				case(92){itemString = `id:15403 `; iCumRate += 4;} //0.13368984�����׵��ũƮ�ǽ�
				case(93){itemString = `id:15404 `; iCumRate += 4;} //0.13368984�����׵�ҿ�ٵ巹��
				case(94){itemString = `id:60001 suffix:10702`; iCumRate += 10;} //0.334224599��� Ŷ(����ƺ�)
				case(95){itemString = `id:18016 suffix:10702`; iCumRate += 10;} //0.334224599����(����ƺ�)
				case(96){itemString = `id:16001 suffix:10702`; iCumRate += 10;} //0.334224599���� �۷κ�(����ƺ�)
				case(97){itemString = `id:16019 suffix:10702`; iCumRate += 10;} //0.334224599��Ʈ������ �۷κ�(����ƺ�)
				case(98){itemString = `id:17003 suffix:10702`; iCumRate += 10;} //0.334224599���� ���� ������(����ƺ�)
				case(99){itemString = `id:17007 suffix:10702`; iCumRate += 10;} //0.334224599���� ���� ������(����ƺ�)
				case(100){itemString = `id:15000 suffix:10702`; iCumRate += 10;} //0.334224599������Ʈ�� ����(����ƺ�)
				case(101){itemString = `id:15022 suffix:10702`; iCumRate += 10;} //0.334224599������īƮ(����ƺ�)
				case(102){itemString = `id:63069 `; iCumRate += 10;} //0.334224599�ݼ� ���� ����
				case(103){itemString = `id:15055 `; iCumRate += 10;} //0.334224599���� �̴� ���ǽ�
				case(104){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.334224599��îƮ(���̾�Ʈ)
				case(105){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.334224599��îƮ(�ں�����)
				case(106){itemString = `id:46006 `; iCumRate += 10;} //0.334224599������ ����
				case(107){itemString = `id:15053 `; iCumRate += 10;} //0.334224599�÷� Į�� ���ǽ�
				case(108){itemString = `id:15134 `; iCumRate += 10;} //0.334224599��� ������ ��Ʈ
				case(109){itemString = `id:15136 `; iCumRate += 10;} //0.334224599��� ���̽� ��ĿƮ
				case(110){itemString = `id:15063 `; iCumRate += 10;} //0.334224599�� ���� ���ǽ�
				case(111){itemString = `id:15108 `; iCumRate += 10;} //0.334224599���� ���̵� ��ũ ��
				case(112){itemString = `id:15059 `; iCumRate += 10;} //0.334224599Ÿũ��źũ���ݹ���
				case(113){itemString = `id:15112 `; iCumRate += 10;} //0.334224599��������ũ�����̷�ũ
				case(114){itemString = `id:17042 `; iCumRate += 10;} //0.334224599�ڷ���������Ÿ���պ�Ʈ
				case(115){itemString = `id:15074 `; iCumRate += 10;} //0.334224599���̽� ������ ��Ʈ
				case(116){itemString = `id:15061 `; iCumRate += 10;} //0.334224599���� ����� Ŭ���� �� ��
				case(117){itemString = `id:17040 `; iCumRate += 10;} //0.334224599���� ��Ʈ�� ����
				case(118){itemString = `id:18525 `; iCumRate += 10;} //0.334224599���� ��� ĸ
				case(119){itemString = `id:15014 `; iCumRate += 10;} //0.334224599�Ĺ߲� ����
				case(120){itemString = `id:18113 `; iCumRate += 10;} //0.334224599�ɰ���� ����
				case(121){itemString = `id:18114 `; iCumRate += 10;} //0.334224599ȣ���� ����� ����
				case(122){itemString = `id:18115 `; iCumRate += 10;} //0.334224599�� ����� ����
				case(123){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.334224599��îƮ(���̺�)
				case(124){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.334224599��îƮ(����)
				case(125){itemString = `id:63030 col1:ffffff`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(126){itemString = `id:63030 col1:00c000`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(127){itemString = `id:63030 col1:0000c0`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(128){itemString = `id:63030 col1:c0c000`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(129){itemString = `id:63030 col1:c000c0`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(130){itemString = `id:63030 col1:00c0c0`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(131){itemString = `id:63030 col1:8673c4`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(132){itemString = `id:63030 col1:f9a6fc`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(133){itemString = `id:63030 col1:5dabf0`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(134){itemString = `id:63030 col1:1da597`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(135){itemString = `id:63030 col1:ff8600`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(136){itemString = `id:63030 col1:60400f0d`; iCumRate += 10;} //0.334224599������ ���� ����(Ư�� Į�� ����)
				case(137){itemString = `id:63030 col1:60401d1f`; iCumRate += 10;} //0.334224599������ ���� ����(Ư�� Į�� ����)
				case(138){itemString = `id:63030 col1:2cfbb6`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(139){itemString = `id:63030 col1:74fbff`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(140){itemString = `id:63030 col1:ff27a8`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(141){itemString = `id:63030 col1:ffff00`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(142){itemString = `id:63030 col1:bd00c0`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(143){itemString = `id:63030 col1:ffffd4`; iCumRate += 10;} //0.334224599������ ���� ����(Į�� ����)
				case(144){itemString = `id:15029 `; iCumRate += 10;} //0.334224599��ũ ���尣 ��Ʈ
				case(145){itemString = `id:15151 `; iCumRate += 10;} //0.334224599���� ������ ����Ʈ ���Ϸ� ����(������)
				case(146){itemString = `id:15152 `; iCumRate += 10;} //0.334224599���� ������ ����Ʈ ���Ϸ� ����(������)
				case(147){itemString = `id:15153 `; iCumRate += 10;} //0.334224599���󽺳����Ľ�Ʈ(������)
				case(148){itemString = `id:15154 `; iCumRate += 10;} //0.334224599���󽺳����Ľ�Ʈ(������)
				case(149){itemString = `id:15032 `; iCumRate += 10;} //0.334224599��������Ʈ��Ʈ
				case(150){itemString = `id:15026 `; iCumRate += 10;} //0.334224599�������ս�īƮ
				case(151){itemString = `id:15016 `; iCumRate += 10;} //0.334224599��Ÿŷ ������
				case(152){itemString = `id:15051 `; iCumRate += 10;} //0.334224599Ÿ��Ʈ ��Ʈ ����
				case(153){itemString = `id:15008 `; iCumRate += 10;} //0.334224599�˻� �б��� ����
				case(154){itemString = `id:15212 `; iCumRate += 10;} //0.334224599�ڸ� ȣ-��-����
				case(155){itemString = `id:15137 `; iCumRate += 10;} //0.334224599��������������Ʈ��Ʈ
				case(156){itemString = `id:15127 `; iCumRate += 10;} //0.334224599������Ʈ�������Ʈ
				case(157){itemString = `id:19031 `; iCumRate += 10;} //0.334224599�� Į���̵� ��Ÿ ����Ʈ �κ�
				case(158){itemString = `id:18011 `; iCumRate += 10;} //0.334224599�������Ÿĳ��
				case(159){itemString = `id:18124 `; iCumRate += 10;} //0.334224599���󽺳�����ĳ��
				case(160){itemString = `id:18009 `; iCumRate += 10;} //0.334224599����íĳ��
				case(161){itemString = `id:18014 `; iCumRate += 10;} //0.334224599��� ����
				case(162){itemString = `id:18000 `; iCumRate += 10;} //0.334224599��ũ ����
				case(163){itemString = `id:16013 `; iCumRate += 10;} //0.334224599�˻��� �۷κ�
				case(164){itemString = `id:16032 `; iCumRate += 10;} //0.334224599�������κ�
				case(165){itemString = `id:63030 `; iCumRate += 10;} //0.334224599������ ���� ����
				case(166){itemString = `id:85060 count:3`; iCumRate += 20;} //0.668449198������ ũ����Ż
				case(167){itemString = `id:85061 count:3`; iCumRate += 20;} //0.668449198��� ������ ũ����Ż
				case(168){itemString = `id:85062 count:3`; iCumRate += 20;} //0.668449198�ְ�� ������ ũ����Ż
				case(169){itemString = `id:18112 `; iCumRate += 20;} //0.668449198�¾��� �⼮ ����
				case(170){itemString = `id:18111 `; iCumRate += 20;} //0.668449198������ �⼮ ����
				case(171){itemString = `id:18110 `; iCumRate += 20;} //0.668449198Ǯ�� �⼮ ����
				case(172){itemString = `id:18109 `; iCumRate += 20;} //0.668449198������ �⼮ ����
				case(173){itemString = `id:18108 `; iCumRate += 20;} //0.668449198������ �⼮ ����
				case(174){itemString = `id:18029 `; iCumRate += 20;} //0.668449198������ �Ȱ�
				case(175){itemString = `id:18028 `; iCumRate += 20;} //0.668449198���̽� �Ȱ�
				case(176){itemString = `id:19008 `; iCumRate += 20;} //0.668449198���� �Ҵ� �κ�
				case(177){itemString = `id:19009 `; iCumRate += 20;} //0.668449198���� ���� �κ�
				case(178){itemString = `id:19017 `; iCumRate += 20;} //0.668449198���� �κ�
				case(179){itemString = `id:19016 `; iCumRate += 20;} //0.668449198���κ�
				case(180){itemString = `id:40053 `; iCumRate += 20;} //0.668449198������� ����� �ɴٹ�
				case(181){itemString = `id:40051 `; iCumRate += 20;} //0.668449198������� ��� 1��
				case(182){itemString = `id:18089 `; iCumRate += 20;} //0.668449198������� ����� ���
				case(183){itemString = `id:40054 `; iCumRate += 20;} //0.668449198Ǫ�� ����� �ɴٹ�
				case(184){itemString = `id:40052 `; iCumRate += 20;} //0.668449198Ǫ�� ��� 1��
				case(185){itemString = `id:16500 `; iCumRate += 20;} //0.668449198�츣��������ũŸ�׷κ�
				case(186){itemString = `id:19020 `; iCumRate += 20;} //0.668449198��Ÿ�׸��ĸ�������Ʈ
				case(187){itemString = `id:62005 prefix:7 `; iCumRate += 20;} //0.668449198��îƮ(���� ����)
				case(188){itemString = `id:16520 `; iCumRate += 20;} //0.668449198�� ���� �۷κ�
				case(189){itemString = `id:15128 `; iCumRate += 20;} //0.668449198���� ���� �巹��
				case(190){itemString = `id:16019 `; iCumRate += 20;} //0.668449198��Ʈ������ �۷κ�
				case(191){itemString = `id:18047 `; iCumRate += 20;} //0.668449198�ڷ����丣Ʈ ����
				case(192){itemString = `id:18008 `; iCumRate += 20;} //0.668449198��Ʈ������ ĸ
				case(193){itemString = `id:15025 `; iCumRate += 20;} //0.668449198���� �б� ���л���
				case(194){itemString = `id:18043 `; iCumRate += 20;} //0.668449198�ڷ�����Ʈ ����
				case(195){itemString = `id:18026 `; iCumRate += 20;} //0.668449198��� ���� ����
				case(196){itemString = `id:15052 `; iCumRate += 20;} //0.668449198Ÿũ��Ʈ��ü��ũ
				case(197){itemString = `id:19005 `; iCumRate += 20;} //0.668449198���÷� �κ�
				case(198){itemString = `id:18040 `; iCumRate += 20;} //0.668449198�ڷ��������̸�
				case(199){itemString = `id:18038 `; iCumRate += 20;} //0.668449198���� ���� ������
				case(200){itemString = `id:15042 `; iCumRate += 20;} //0.668449198�� �� ���ǽ�
				case(201){itemString = `id:63025 count:3`; iCumRate += 20;} //0.668449198��뷮 �ູ �Ϻ�
				case(202){itemString = `id:51031 count:3`; iCumRate += 20;} //0.668449198���� ȸ�� �Ϻ�
				case(203){itemString = `id:51036 `; iCumRate += 20;} //0.668449198���̾�Ʈ �Ϻ� U
				case(204){itemString = `id:51038 `; iCumRate += 20;} //0.668449198���̾�Ʈ �Ϻ� L
				case(205){itemString = `id:51039 `; iCumRate += 20;} //0.668449198���̾�Ʈ �Ϻ� F
				case(206){itemString = `id:17006 `; iCumRate += 20;} //0.668449198�ʰ��� ����
				case(207){itemString = `id:18086 `; iCumRate += 20;} //0.668449198�������� ���
				case(208){itemString = `id:18087 `; iCumRate += 20;} //0.668449198����� ���
				case(209){itemString = `id:18088 `; iCumRate += 20;} //0.668449198���� ��
				case(210){itemString = `id:18090 `; iCumRate += 20;} //0.668449198Ǫ�� ����� ���
				case(211){itemString = `id:40046 `; iCumRate += 20;} //0.668449198���
				case(212){itemString = `id:40047 `; iCumRate += 20;} //0.668449198����� �ɴٹ�
				case(213){itemString = `id:18541 `; iCumRate += 20;} //0.668449198�ϰ����
				case(214){itemString = `id:18103 `; iCumRate += 20;} //0.668449198���� ����
				case(215){itemString = `id:60037 count:5`; iCumRate += 20;} //0.668449198�� ���� �Ϻ�
				case(216){itemString = `id:60038 count:5`; iCumRate += 20;} //0.668449198���� ���� �Ϻ�
				case(217){itemString = `id:18010 `; iCumRate += 20;} //0.668449198�����Ʈĳ��
				case(218){itemString = `id:17016 `; iCumRate += 20;} //0.668449198�ʵ� �Ĺ�Ʈ ����
				case(219){itemString = `id:17015 `; iCumRate += 20;} //0.668449198�Ĺ�Ʈ ����
				case(220){itemString = `id:17005 `; iCumRate += 20;} //0.668449198���� ����
				case(221){itemString = `id:17002 `; iCumRate += 20;} //0.668449198�˻��� ����
				case(222){itemString = `id:17022 `; iCumRate += 20;} //0.668449198���� ����
				case(223){itemString = `id:17001 `; iCumRate += 20;} //0.668449198������ ����
				case(224){itemString = `id:17007 `; iCumRate += 20;} //0.668449198���� ����
				case(225){itemString = `id:16009 `; iCumRate += 20;} //0.668449198��ũ ���� �۷κ�
				case(226){itemString = `id:15031 `; iCumRate += 20;} //0.668449198���� �б� ���л���
				case(227){itemString = `id:19012 `; iCumRate += 20;} //0.668449198Ʈ�����̾ߵ�κ�
				case(228){itemString = `id:18004 `; iCumRate += 20;} //0.668449198����̼� ����
				case(229){itemString = `id:15132 `; iCumRate += 20;} //0.668449198���� ����Ʈ ����
				case(230){itemString = `id:15043 `; iCumRate += 20;} //0.668449198���������� ��Ʈ
				case(231){itemString = `id:17017 `; iCumRate += 20;} //0.668449198������ ��Ʈ ����
				case(232){itemString = `id:16006 `; iCumRate += 20;} //0.668449198����� �۷κ�
				case(233){itemString = `id:16017 `; iCumRate += 20;} //0.668449198���Ĵٵ� �۷κ�
				case(234){itemString = `id:17060 `; iCumRate += 20;} //0.668449198���󽺳����ĺ�Ʈ(������)
				case(235){itemString = `id:17061 `; iCumRate += 20;} //0.668449198���󽺳����ĺ�Ʈ(������)
				case(236){itemString = `id:17019 `; iCumRate += 20;} //0.668449198���尣�� ����
				case(237){itemString = `id:17067 `; iCumRate += 20;} //0.668449198X��ü ����
				case(238){itemString = `id:17008 `; iCumRate += 20;} //0.668449198�ڷ�����Ʈ(������)
				case(239){itemString = `id:17010 `; iCumRate += 20;} //0.668449198�ڷ�����Ʈ(������)
				case(240){itemString = `id:17023 `; iCumRate += 20;} //0.668449198�����ᱸ��
				case(241){itemString = `id:16031 `; iCumRate += 20;} //0.668449198���� ���� Ÿ��Ʈ �۷κ�
				case(242){itemString = `id:16026 `; iCumRate += 20;} //0.668449198���󽺳����ı׷κ�
				case(243){itemString = `id:16016 `; iCumRate += 20;} //0.668449198����Ʈ �۷κ�
				case(244){itemString = `id:17003 `; iCumRate += 20;} //0.668449198���� ����(������)
				case(245){itemString = `id:17024 `; iCumRate += 20;} //0.668449198���� �� ����
				case(246){itemString = `id:17013 `; iCumRate += 20;} //0.668449198��������
				case(247){itemString = `id:17069 `; iCumRate += 20;} //0.668449198���� ����
				case(248){itemString = `id:15020 `; iCumRate += 20;} //0.668449198�ڷ�������巹��
				case(249){itemString = `id:15044 `; iCumRate += 20;} //0.668449198��� ���������
				case(250){itemString = `id:15041 `; iCumRate += 20;} //0.668449198�繫���� ��Ʈ
				case(251){itemString = `id:15027 `; iCumRate += 20;} //0.668449198���ս�īƮ
				case(252){itemString = `id:15018 `; iCumRate += 20;} //0.668449198��� �����(������)
				case(253){itemString = `id:15033 `; iCumRate += 20;} //0.668449198��� �����(������)
				case(254){itemString = `id:15023 `; iCumRate += 20;} //0.668449198��ũ ���� ��Ʈ(������)
				case(255){itemString = `id:15035 `; iCumRate += 20;} //0.668449198��ũ ���� ��Ʈ(������)
				case(256){itemString = `id:19003 `; iCumRate += 20;} //0.668449198Ʈ���ڷ� �κ�
				case(257){itemString = `id:63024 `; iCumRate += 20;} //0.668449198���� ����
				case(258){itemString = `id:18002 `; iCumRate += 20;} //0.668449198���ĳ��
				case(259){itemString = `id:18007 `; iCumRate += 20;} //0.668449198����ĳ��
				case(260){itemString = `id:18013 `; iCumRate += 20;} //0.668449198�ڷ� strikebreaker
				case(261){itemString = `id:18156 `; iCumRate += 20;} //0.668449198ť�Ʒ�����  ī�� ����
				case(262){itemString = `id:18042 `; iCumRate += 20;} //0.668449198�ڷ���������Ÿ����Ʈ
				case(263){itemString = `id:18003 `; iCumRate += 20;} //0.668449198������ĳ��
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
//				if (IsCurrentEvent(`GachaphonSecretShop2008_taiwan`) || (IsEnable(`featureSecretShopTaiwan`) extern (`data/script/features.mint`)))
//				{
//					itemRate = ((iCumRate - tempRate)*10000) / totalRate;
//					DebugOut(`Item Rate : ` + ToString(itemRate));
//					GiveGachaphonCoupon1(player,itemRate) extern (`data/script/event/useitem_event.mint`);
//				}
				return;
			}
			++i;
		}
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
	}
	else if (GetLocale().LowerCase() == `japan` || GetLocale().LowerCase() == `korea` && IsDevelopment())	// ���� ������ �߰�
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int totalRate = 2932;
		int tempRate = 0;
		int itemRate = 0;
		int i=0;
		int iRandom = Random(totalRate);	//Ȯ���� ������ ���´�

		while(true)
		{
			tempRate = iCumRate;
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:19083 `; iCumRate +=2;} //0.068212824�������� ������Ʈ
				case(1){itemString = `id:15595 `; iCumRate +=2;} //0.068212824�������� ���� �ǻ� (������)
				case(2){itemString = `id:15594 `; iCumRate +=2;} //0.068212824�������� ���� �ǻ� (������)
				case(3){itemString = `id:18312 `; iCumRate +=2;} //0.068212824�������� ���� ���� (������)
				case(4){itemString = `id:18313 `; iCumRate +=2;} //0.068212824�������� ���� ���� (������)
				case(5){itemString = `id:17231 `; iCumRate +=2;} //0.068212824�������� ��������  (������)
				case(6){itemString = `id:17232 `; iCumRate +=2;} //0.068212824�������� ��������  (������)
				case(7){itemString = `id:15555 `; iCumRate +=2;} //0.068212824�ٳ��� ������ ����
				case(8){itemString = `id:15556 `; iCumRate +=2;} //0.068212824�ٳ��� ������ ����
				case(9){itemString = `id:16065 `; iCumRate +=2;} //0.068212824�ٳ��� ���� �극�̽���
				case(10){itemString = `id:17212 `; iCumRate +=2;} //0.068212824�ٳ��� ���� ����
				case(11){itemString = `id:17213 `; iCumRate +=2;} //0.068212824�ٳ��� �ɹ��� ����
				case(12){itemString = `id:18582 `; iCumRate +=3;} //0.102319236��� �巹��
				case(13){itemString = `id:15408 `; iCumRate +=3;} //0.102319236�ױ۸���
				case(14){itemString = `id:17158 `; iCumRate +=3;} //0.102319236������
				case(15){itemString = `id:15406 `; iCumRate +=3;} //0.102319236ĳ�־� ���� A
				case(16){itemString = `id:15407 `; iCumRate +=3;} //0.102319236ĳ�־� ���� B
				case(17){itemString = `id:15267 `; iCumRate +=3;} //0.102319236�׶� ��� Ǯ �巹��
				case(18){itemString = `id:15268 `; iCumRate +=3;} //0.102319236�׶� ��� ��ũ ��Ʈ
				case(19){itemString = `id:15233 `; iCumRate +=3;} //0.102319236������Ʈ ��� �巹��(��Ÿ��)
				case(20){itemString = `id:15235 `; iCumRate +=3;} //0.102319236������Ʈ ��� �巹��(��Ÿ��)
				case(21){itemString = `id:15234 `; iCumRate +=3;} //0.102319236������Ʈ ��� ��Ʈ
				case(22){itemString = `id:15217 `; iCumRate +=3;} //0.102319236�������� ���ǽ�
				case(23){itemString = `id:15315 `; iCumRate +=3;} //0.102319236�ƽ�ƾ ��� ��Ʈ
				case(24){itemString = `id:18227 `; iCumRate +=3;} //0.102319236�ƽ�ƾ ĸ
				case(25){itemString = `id:16053 `; iCumRate +=3;} //0.102319236�ƽ�ƾ �۷κ�
				case(26){itemString = `id:17126 `; iCumRate +=3;} //0.102319236�ƽ�ƾ ����
				case(27){itemString = `id:15314 `; iCumRate +=3;} //0.102319236���ī �� ������
				case(28){itemString = `id:18226 `; iCumRate +=3;} //0.102319236���ī ĸ
				case(29){itemString = `id:16052 `; iCumRate +=3;} //0.102319236���ī �� �۷���
				case(30){itemString = `id:17125 `; iCumRate +=3;} //0.102319236���ī ���� ����
				case(31){itemString = `id:15338 `; iCumRate +=3;} //0.102319236�θ�ƽ �̺�� �巹��
				case(32){itemString = `id:15339 `; iCumRate +=3;} //0.102319236�θ�ƽ ���� ��Ʈ
				case(33){itemString = `id:17135 `; iCumRate +=3;} //0.102319236������ ������
				case(34){itemString = `id:17136 `; iCumRate +=3;} //0.102319236Ŭ���� ����
				case(35){itemString = `id:15305 `; iCumRate +=3;} //0.102319236����Ÿ ��Ű �巹��
				case(36){itemString = `id:15306 `; iCumRate +=3;} //0.102319236Ʈ��� ��Ƽ�� ����
				case(37){itemString = `id:16047 `; iCumRate +=3;} //0.102319236����Ÿ ��Ű �۷���
				case(38){itemString = `id:16050 `; iCumRate +=3;} //0.102319236Ʈ��� ����ư �۷���
				case(39){itemString = `id:17120 `; iCumRate +=3;} //0.102319236����Ÿ �÷� ��Ŭ ����
				case(40){itemString = `id:17121 `; iCumRate +=3;} //0.102319236Ʈ��� ����
				case(41){itemString = `id:18213 `; iCumRate +=3;} //0.102319236����Ÿ Ʈ�� ����
				case(42){itemString = `id:18214 `; iCumRate +=3;} //0.102319236Ʈ��� ��Ƽ�� �͹�
				case(43){itemString = `id:15250 `; iCumRate +=3;} //0.102319236���̵� �ǻ� �� Ÿ��
				case(44){itemString = `id:15251 `; iCumRate +=3;} //0.102319236���̵� �ǻ� ��Ʈ Ÿ��
				case(45){itemString = `id:15252 `; iCumRate +=3;} //0.102319236���� �ǻ�
				case(46){itemString = `id:18176 `; iCumRate +=3;} //0.102319236���̵� �Ӹ���
				case(47){itemString = `id:15079 `; iCumRate +=3;} //0.102319236������ �� ���� ��ĿƮ
				case(48){itemString = `id:15117 suffix:31202`; iCumRate +=3;} //0.102319236������ ������ ���壨��Į��
				case(49){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.102319236������ ������ ���壨�����ʱ�����
				case(50){itemString = `id:15116 suffix:31202`; iCumRate +=3;} //0.102319236������ ������ ���壨��Į��
				case(51){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.102319236������ ������ ���壨�����ʱ�����
				case(52){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate +=4;} //0.136425648��� ���������
				case(53){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648��� ����ì ������ ����
				case(54){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate +=4;} //0.136425648Ƽ�� ��Ʈ
				case(55){itemString = `id:15260 `; iCumRate +=4;} //0.136425648�ٺ� ���� �÷��� ����(������)
				case(56){itemString = `id:15261 `; iCumRate +=4;} //0.136425648�ٺ� ���� �÷��� ����(������)
				case(57){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate +=4;} //0.136425648���̽� �÷�Ŷ ����
				case(58){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648�� �������� ��ĿƮ
				case(59){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648�������� ���ڵ� ��Ʈ
				case(60){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648�Ƶ��� ���߷� ��ũ����
				case(61){itemString = `id:15113 `; iCumRate +=4;} //0.136425648������ �˻��б� ���� ��ƮŸ��
				case(62){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648������ �˻��б� ���� ��Ÿ��
				case(63){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648������ �˻��б� ���� ��ƮŸ��
				case(64){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate +=4;} //0.136425648Ʈ��� ��ī�� ����
				case(65){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate +=4;} //0.136425648�� ��ư �ޱ� ����
				case(66){itemString = `id:15065 `; iCumRate +=4;} //0.136425648���� ����Ʈ ��ĿƮ
				case(67){itemString = `id:63034 col1:c00000`; iCumRate +=4;} //0.136425648������ ���� ����(�� ����)
				case(68){itemString = `id:63033 col1:000000`; iCumRate +=4;} //0.136425648������ ���� ����(�� ����)
				case(69){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648���� �̴� ��ĿƮ
				case(70){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648���̳��巹��
				case(71){itemString = `id:18044 `; iCumRate +=4;} //0.136425648���˿� ����
				case(72){itemString = `id:16519 `; iCumRate +=4;} //0.136425648��ȣȭ �尩
				case(73){itemString = `id:18046 `; iCumRate +=4;} //0.136425648�հ��� �Ӹ����
				case(74){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648Ŭ���� ������ ����
				case(75){itemString = `id:15060 `; iCumRate +=4;} //0.136425648���� �̳ʷκ� ����
				case(76){itemString = `id:17041 `; iCumRate +=4;} //0.136425648�������� ���ú���
				case(77){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648���̵� ���� �巹��
				case(78){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648���ĵ�Į�� �����긮��
				case(79){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648�߱� ���÷� �κ�
				case(80){itemString = `id:18060 `; iCumRate +=4;} //0.136425648�� �䳢 �Ӹ���5
				case(81){itemString = `id:18065 `; iCumRate +=4;} //0.136425648���� �䳢 �Ӹ���5
				case(82){itemString = `id:18070 `; iCumRate +=4;} //0.136425648�� �䳢 �Ӹ���5
				case(83){itemString = `id:18051 `; iCumRate +=4;} //0.136425648�ڷ��� ���� ����
				case(84){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate +=4;} //0.136425648�ڷ��� ���ڽ�Ʈ
				case(85){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648����ǳ ���纹
				case(86){itemString = `id:15396 `; iCumRate +=4;} //0.136425648�����׵� Ƽ��� ��Ʈ
				case(87){itemString = `id:15397 `; iCumRate +=4;} //0.136425648�����׵� ���ʹ�Ƽ ��Ʈ
				case(88){itemString = `id:15398 `; iCumRate +=4;} //0.136425648�����׵� �̵�� ����
				case(89){itemString = `id:15399 `; iCumRate +=4;} //0.136425648�����׵� ī�߸��� ��Ʈ
				case(90){itemString = `id:15401 `; iCumRate +=4;} //0.136425648�����׵� ���̾�� �巹��
				case(91){itemString = `id:15402 `; iCumRate +=4;} //0.136425648�����׵� ���ʹ�Ƽ �巹��
				case(92){itemString = `id:15403 `; iCumRate +=4;} //0.136425648�����׵� ��ũ ���ǽ�
				case(93){itemString = `id:15404 `; iCumRate +=4;} //0.136425648�����׵� �ҹ� �巹��
				case(94){itemString = `id:60001 suffix:10702`; iCumRate +=10;} //0.34106412���ŰƮ������ƺ�
				case(95){itemString = `id:18016 suffix:10702`; iCumRate +=10;} //0.34106412���ڣ�����ƺ�
				case(96){itemString = `id:16001 suffix:10702`; iCumRate +=10;} //0.34106412���� �۷��꣨����ƺ�
				case(97){itemString = `id:16019 suffix:10702`; iCumRate +=10;} //0.34106412�ٹ��� �ȸ� �尩������ƺ�
				case(98){itemString = `id:17003 suffix:10702`; iCumRate +=10;} //0.34106412���� �Ź� ���ڿ루����ƺ�
				case(99){itemString = `id:17007 suffix:10702`; iCumRate +=10;} //0.34106412���� �Ź� ���ڿ루����ƺ�
				case(100){itemString = `id:15000 suffix:10702`; iCumRate +=10;} //0.34106412���� ������ ����������ƺ�
				case(101){itemString = `id:15022 suffix:10702`; iCumRate +=10;} //0.34106412���� ��ĿƮ������ƺ�
				case(102){itemString = `id:63069 `; iCumRate +=10;} //0.34106412�ݼ� ���� ����
				case(103){itemString = `id:15055 `; iCumRate +=10;} //0.34106412���� �̴� ���ǽ�
				case(104){itemString = `id:62005 suffix:30501`; iCumRate +=10;} //0.34106412��æƮ�����̾�Ʈ��
				case(105){itemString = `id:62005 suffix:30302`; iCumRate +=10;} //0.34106412��æƮ���ں�Ʈ��
				case(106){itemString = `id:46006 `; iCumRate +=10;} //0.34106412ī��Ʈ �ǵ�
				case(107){itemString = `id:15053 `; iCumRate +=10;} //0.34106412�÷�Į�� ���ǽ�
				case(108){itemString = `id:15134 `; iCumRate +=10;} //0.34106412��� ������ ��Ʈ
				case(109){itemString = `id:15136 `; iCumRate +=10;} //0.34106412��� ���̽� ��ĿƮ
				case(110){itemString = `id:15063 `; iCumRate +=10;} //0.34106412���̾�� ���� ���ǽ�
				case(111){itemString = `id:15108 `; iCumRate +=10;} //0.34106412���� ���̵� ��ũž
				case(112){itemString = `id:15059 `; iCumRate +=10;} //0.34106412��ũ�� ��ũž �ݹ���
				case(113){itemString = `id:15112 `; iCumRate +=10;} //0.34106412������ �����̷�
				case(114){itemString = `id:17042 `; iCumRate +=10;} //0.34106412�ڷ��� ������Ż �� ����
				case(115){itemString = `id:15074 `; iCumRate +=10;} //0.34106412���̽� ������ ��Ʈ
				case(116){itemString = `id:15061 `; iCumRate +=10;} //0.34106412���ṫ�� ��Ʈ�� Ʃ��
				case(117){itemString = `id:17040 `; iCumRate +=10;} //0.34106412���� ��Ʈ�� ����
				case(118){itemString = `id:18525 `; iCumRate +=10;} //0.34106412���͵�� ĸ
				case(119){itemString = `id:15014 `; iCumRate +=10;} //0.34106412�Ĺ߲��� ��
				case(120){itemString = `id:18113 `; iCumRate +=10;} //0.34106412������ ����� ����
				case(121){itemString = `id:18114 `; iCumRate +=10;} //0.34106412�ٹ��� ����� ����
				case(122){itemString = `id:18115 `; iCumRate +=10;} //0.34106412�� ����� ����
				case(123){itemString = `id:62005 suffix:30702`; iCumRate +=10;} //0.34106412��æƮ�����̺죩
				case(124){itemString = `id:62005 prefix:207`; iCumRate +=10;} //0.34106412��æƮ��������
				case(125){itemString = `id:63030 col1:ffffff`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(126){itemString = `id:63030 col1:00c000`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(127){itemString = `id:63030 col1:0000c0`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(128){itemString = `id:63030 col1:c0c000`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(129){itemString = `id:63030 col1:c000c0`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(130){itemString = `id:63030 col1:00c0c0`; iCumRate +=10;} //0.34106412���� ���� ���� ���ã��� ������
				case(131){itemString = `id:63030 col1:8673c4`; iCumRate +=10;} //0.34106412������������
				case(132){itemString = `id:63030 col1:f9a6fc`; iCumRate +=10;} //0.34106412������������
				case(133){itemString = `id:63030 col1:5dabf0`; iCumRate +=10;} //0.34106412������������
				case(134){itemString = `id:63030 col1:1da597`; iCumRate +=10;} //0.34106412������������
				case(135){itemString = `id:63030 col1:ff8600`; iCumRate +=10;} //0.34106412������������
				case(136){itemString = `id:63030 col1:60400f0d`; iCumRate +=10;} //0.34106412������������
				case(137){itemString = `id:63030 col1:60401d1f`; iCumRate +=10;} //0.34106412������������
				case(138){itemString = `id:63030 col1:2cfbb6`; iCumRate +=10;} //0.34106412������������
				case(139){itemString = `id:63030 col1:74fbff`; iCumRate +=10;} //0.34106412������������
				case(140){itemString = `id:63030 col1:ff27a8`; iCumRate +=10;} //0.34106412������������
				case(141){itemString = `id:63030 col1:ffff00`; iCumRate +=10;} //0.34106412������������
				case(142){itemString = `id:63030 col1:bd00c0`; iCumRate +=10;} //0.34106412������������
				case(143){itemString = `id:63030 col1:ffffd4`; iCumRate +=10;} //0.34106412������������
				case(144){itemString = `id:15029 `; iCumRate +=10;} //0.34106412��ũ �������̿�
				case(145){itemString = `id:15151 `; iCumRate +=10;} //0.34106412���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(146){itemString = `id:15152 `; iCumRate +=10;} //0.34106412���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(147){itemString = `id:15153 `; iCumRate +=10;} //0.34106412���� �������� ��Ʈ�������룩
				case(148){itemString = `id:15154 `; iCumRate +=10;} //0.34106412���� �������� ��Ʈ�������룩
				case(149){itemString = `id:15032 `; iCumRate +=10;} //0.34106412������ �ݹ���
				case(150){itemString = `id:15026 `; iCumRate +=10;} //0.34106412������ �ս�ĿƮ
				case(151){itemString = `id:15016 `; iCumRate +=10;} //0.34106412����� ��Ÿŷ ������
				case(152){itemString = `id:15051 `; iCumRate +=10;} //0.34106412Ÿ��Ʈ ��Ʈ ����
				case(153){itemString = `id:15008 `; iCumRate +=10;} //0.34106412�˻��б� ����
				case(154){itemString = `id:15212 `; iCumRate +=10;} //0.34106412�ݸ� ���� ����
				case(155){itemString = `id:15137 `; iCumRate +=10;} //0.34106412������ ���� ��Ŷ ��Ʈ
				case(156){itemString = `id:15127 `; iCumRate +=10;} //0.34106412������ Ʈ����ų� ��Ʈ
				case(157){itemString = `id:19031 `; iCumRate +=10;} //0.34106412��Ÿ ����Ʈ �κ�
				case(158){itemString = `id:18011 `; iCumRate +=10;} //0.34106412��� ������ ĸ
				case(159){itemString = `id:18124 `; iCumRate +=10;} //0.34106412���� �������� ��Ʈ ĸ
				case(160){itemString = `id:18009 `; iCumRate +=10;} //0.34106412��� ���� ĸ
				case(161){itemString = `id:18014 `; iCumRate +=10;} //0.34106412��� ����
				case(162){itemString = `id:18000 `; iCumRate +=10;} //0.34106412��ũ ����
				case(163){itemString = `id:16013 `; iCumRate +=10;} //0.34106412�˻� �尩
				case(164){itemString = `id:16032 `; iCumRate +=10;} //0.34106412���� �۷���
				case(165){itemString = `id:63030 `; iCumRate +=10;} //0.34106412���� ���� ���� ����
				case(166){itemString = `id:18112 `; iCumRate +=20;} //0.68212824�� ���� ��ǰ
				case(167){itemString = `id:18111 `; iCumRate +=20;} //0.68212824���� ���� ��ǰ
				case(168){itemString = `id:18110 `; iCumRate +=20;} //0.68212824���� ���� ��ǰ
				case(169){itemString = `id:18109 `; iCumRate +=20;} //0.68212824���� ���� ��ǰ
				case(170){itemString = `id:18108 `; iCumRate +=20;} //0.68212824���� ���� ��ǰ
				case(171){itemString = `id:18029 `; iCumRate +=20;} //0.68212824������ �Ȱ�
				case(172){itemString = `id:18028 `; iCumRate +=20;} //0.68212824���̽� �Ȱ�
				case(173){itemString = `id:19008 `; iCumRate +=20;} //0.68212824���� �Ǵ� �κ�
				case(174){itemString = `id:19009 `; iCumRate +=20;} //0.68212824���� ���� �κ�
				case(175){itemString = `id:19017 `; iCumRate +=20;} //0.68212824���� �κ�
				case(176){itemString = `id:19016 `; iCumRate +=20;} //0.68212824�� �κ�
				case(177){itemString = `id:40053 `; iCumRate +=20;} //0.68212824����� ��� �ɴٹ�
				case(178){itemString = `id:40051 `; iCumRate +=20;} //0.68212824����� ��� �Ѽ���
				case(179){itemString = `id:18089 `; iCumRate +=20;} //0.68212824����� ��� ���
				case(180){itemString = `id:40054 `; iCumRate +=20;} //0.68212824�Ķ� ��� �ɴٹ�
				case(181){itemString = `id:40052 `; iCumRate +=20;} //0.68212824�Ķ� ��� �Ѽ���
				case(182){itemString = `id:16500 `; iCumRate +=20;} //0.68212824�ﳪ �������� �۷���
				case(183){itemString = `id:19020 `; iCumRate +=20;} //0.68212824��Ÿ�� ����� ��Ʈ
				case(184){itemString = `id:62005 prefix:7 `; iCumRate +=20;} //0.68212824��æƮ���������ͣ�
				case(185){itemString = `id:16520 `; iCumRate +=20;} //0.68212824�� ���� �۷���
				case(186){itemString = `id:15128 `; iCumRate +=20;} //0.68212824�� �� ���� �巹��
				case(187){itemString = `id:16019 `; iCumRate +=20;} //0.68212824�ٹ��� �ȸ� �尩
				case(188){itemString = `id:18047 `; iCumRate +=20;} //0.68212824�ڷ��� ��Ʈ ����
				case(189){itemString = `id:18008 `; iCumRate +=20;} //0.68212824��Ʈ������ ĸ
				case(190){itemString = `id:15025 `; iCumRate +=20;} //0.68212824�����б� ���ڱ���
				case(191){itemString = `id:18043 `; iCumRate +=20;} //0.68212824�ڷ��� ��Ʈ ����
				case(192){itemString = `id:18026 `; iCumRate +=20;} //0.68212824��� ���θ���
				case(193){itemString = `id:15052 `; iCumRate +=20;} //0.68212824��ũ�� ���� Ʃ��
				case(194){itemString = `id:19005 `; iCumRate +=20;} //0.68212824���÷� �κ�
				case(195){itemString = `id:18040 `; iCumRate +=20;} //0.68212824�ڷ��� ���� ������
				case(196){itemString = `id:18038 `; iCumRate +=20;} //0.68212824���� �跿 ����
				case(197){itemString = `id:15042 `; iCumRate +=20;} //0.68212824�ճ� ���ǽ�
				case(198){itemString = `id:63025 count:3`; iCumRate +=20;} //0.68212824��뷮 �ູ�� ����
				case(199){itemString = `id:51031 count:3`; iCumRate +=20;} //0.68212824���� ȸ���� ����
				case(200){itemString = `id:51036 `; iCumRate +=20;} //0.68212824���̾�Ʈ ���� U
				case(201){itemString = `id:51038 `; iCumRate +=20;} //0.68212824���̾�Ʈ ���� L
				case(202){itemString = `id:51039 `; iCumRate +=20;} //0.68212824���̾�Ʈ ���� F
				case(203){itemString = `id:17006 `; iCumRate +=20;} //0.68212824õ�Ź�
				case(204){itemString = `id:18086 `; iCumRate +=20;} //0.68212824������ �� ���
				case(205){itemString = `id:18087 `; iCumRate +=20;} //0.68212824��� �� ���
				case(206){itemString = `id:18088 `; iCumRate +=20;} //0.68212824ȭ��
				case(207){itemString = `id:18090 `; iCumRate +=20;} //0.68212824�Ķ� ��� ���
				case(208){itemString = `id:40046 `; iCumRate +=20;} //0.68212824��� �Ѽ���
				case(209){itemString = `id:40047 `; iCumRate +=20;} //0.68212824��� �ɴٹ�
				case(210){itemString = `id:18541 `; iCumRate +=20;} //0.68212824��Ӹ� ����
				case(211){itemString = `id:18103 `; iCumRate +=20;} //0.68212824���� ����
				case(212){itemString = `id:60037 count:5`; iCumRate +=20;} //0.68212824�� ���� ����
				case(213){itemString = `id:60038 count:5`; iCumRate +=20;} //0.68212824���� ����
				case(214){itemString = `id:18010 `; iCumRate +=20;} //0.68212824��� ����Ʈ ĸ
				case(215){itemString = `id:17016 `; iCumRate +=20;} //0.68212824�ʵ� �Ĺ��
				case(216){itemString = `id:17015 `; iCumRate +=20;} //0.68212824�Ĺ��
				case(217){itemString = `id:17005 `; iCumRate +=20;} //0.68212824��ɲ� �Ź�
				case(218){itemString = `id:17002 `; iCumRate +=20;} //0.68212824�˻� �Ź�
				case(219){itemString = `id:17022 `; iCumRate +=20;} //0.68212824��������
				case(220){itemString = `id:17001 `; iCumRate +=20;} //0.68212824���� ����
				case(221){itemString = `id:17007 `; iCumRate +=20;} //0.68212824���� ����
				case(222){itemString = `id:16009 `; iCumRate +=20;} //0.68212824��ɲ��尩
				case(223){itemString = `id:15031 `; iCumRate +=20;} //0.68212824�����б��� ���� ����
				case(224){itemString = `id:19012 `; iCumRate +=20;} //0.68212824Ʈ��� ���̾�� �κ�
				case(225){itemString = `id:18004 `; iCumRate +=20;} //0.68212824��� �мǸ���
				case(226){itemString = `id:15132 `; iCumRate +=20;} //0.68212824���߷� ����Ʈ ����
				case(227){itemString = `id:15043 `; iCumRate +=20;} //0.68212824����Ƽ ���Ʈ
				case(228){itemString = `id:17017 `; iCumRate +=20;} //0.68212824������Ʈ ����
				case(229){itemString = `id:16006 `; iCumRate +=20;} //0.68212824����� �尩
				case(230){itemString = `id:16017 `; iCumRate +=20;} //0.68212824���Ĵٵ� �۷���
				case(231){itemString = `id:17060 `; iCumRate +=20;} //0.68212824���� �������� ��Ʈ ����(������)
				case(232){itemString = `id:17061 `; iCumRate +=20;} //0.68212824���� �������� ��Ʈ ����(������)
				case(233){itemString = `id:17019 `; iCumRate +=20;} //0.68212824�������� �Ź�
				case(234){itemString = `id:17067 `; iCumRate +=20;} //0.68212824���� Ÿ�� �� ����
				case(235){itemString = `id:17008 `; iCumRate +=20;} //0.68212824�ڷ��� �����������룩
				case(236){itemString = `id:17010 `; iCumRate +=20;} //0.68212824�ڷ��� �����������룩
				case(237){itemString = `id:17023 `; iCumRate +=20;} //0.68212824������ �Ź�
				case(238){itemString = `id:16031 `; iCumRate +=20;} //0.68212824�������� Ÿ��Ʈ �۷���
				case(239){itemString = `id:16026 `; iCumRate +=20;} //0.68212824���� �������� ��Ʈ �۷���
				case(240){itemString = `id:16016 `; iCumRate +=20;} //0.68212824����Ʈ �۷���
				case(241){itemString = `id:17003 `; iCumRate +=20;} //0.68212824���� �Źߣ������룩
				case(242){itemString = `id:17024 `; iCumRate +=20;} //0.68212824��� ����
				case(243){itemString = `id:17013 `; iCumRate +=20;} //0.68212824�β��� ����
				case(244){itemString = `id:17069 `; iCumRate +=20;} //0.68212824���� ����
				case(245){itemString = `id:15020 `; iCumRate +=20;} //0.68212824�ڷ��� �����巹��
				case(246){itemString = `id:15044 `; iCumRate +=20;} //0.68212824����� �۾���
				case(247){itemString = `id:15041 `; iCumRate +=20;} //0.68212824�繫�� ������ ��Ʈ
				case(248){itemString = `id:15027 `; iCumRate +=20;} //0.68212824��� �ս�ĿƮ
				case(249){itemString = `id:15018 `; iCumRate +=20;} //0.68212824��� �����ڿʣ������룩
				case(250){itemString = `id:15033 `; iCumRate +=20;} //0.68212824��� �����ڿ�(�����룩
				case(251){itemString = `id:15023 `; iCumRate +=20;} //0.68212824��ũ ��ɲۿʣ������룩
				case(252){itemString = `id:15035 `; iCumRate +=20;} //0.68212824��ũ ��ɲۿʣ������룩
				case(253){itemString = `id:19003 `; iCumRate +=20;} //0.68212824Ʈ���ݷθ� �κ�
				case(254){itemString = `id:63024 `; iCumRate +=20;} //0.68212824���� ����
				case(255){itemString = `id:18002 `; iCumRate +=20;} //0.68212824��� ĸ
				case(256){itemString = `id:18007 `; iCumRate +=20;} //0.68212824���� ĸ
				case(257){itemString = `id:18013 `; iCumRate +=20;} //0.68212824�ڷ��� ĸ
				case(258){itemString = `id:18156 `; iCumRate +=20;} //0.68212824��� ����
				case(259){itemString = `id:18042 `; iCumRate +=20;} //0.68212824�ڷ��� ����� ����
				case(260){itemString = `id:18003 `; iCumRate +=20;} //0.68212824������ ĸ
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
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
	}

	else // �Ϻ� �ø� �м� ��í������ ������� ������ ����Ʈ Ÿ�������� ����� ���� ���� �ۼ��� �־�� ��
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(2441);	//Ȯ���� ������ ���´� ������ ���� 2091

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:18582 `; iCumRate +=2;} //0.081933634��� �巹��
				case(1){itemString = `id:15408 `; iCumRate +=2;} //0.081933634�ױ۸���
				case(2){itemString = `id:17158 `; iCumRate +=2;} //0.081933634������
				case(3){itemString = `id:15406 `; iCumRate +=2;} //0.081933634ĳ�־� ���� A
				case(4){itemString = `id:15407 `; iCumRate +=2;} //0.081933634ĳ�־� ���� B
				case(5){itemString = `id:15267 `; iCumRate +=3;} //0.122900451�׶� ��� Ǯ �巹��
				case(6){itemString = `id:15268 `; iCumRate +=3;} //0.122900451�׶� ��� ��ũ ��Ʈ
				case(7){itemString = `id:15233 `; iCumRate +=3;} //0.122900451������Ʈ ��� �巹��(��Ÿ��)
				case(8){itemString = `id:15235 `; iCumRate +=3;} //0.122900451������Ʈ ��� �巹��(��Ÿ��)
				case(9){itemString = `id:15234 `; iCumRate +=3;} //0.122900451������Ʈ ��� ��Ʈ
				case(10){itemString = `id:15217 `; iCumRate +=3;} //0.122900451�������� ���ǽ�
				case(11){itemString = `id:15315 `; iCumRate +=3;} //0.122900451�ƽ�ƾ ��� ��Ʈ
				case(12){itemString = `id:18227 `; iCumRate +=3;} //0.122900451�ƽ�ƾ ĸ
				case(13){itemString = `id:16053 `; iCumRate +=3;} //0.122900451�ƽ�ƾ �۷κ�
				case(14){itemString = `id:17126 `; iCumRate +=3;} //0.122900451�ƽ�ƾ ����
				case(15){itemString = `id:15314 `; iCumRate +=3;} //0.122900451���ī �� ������
				case(16){itemString = `id:18226 `; iCumRate +=3;} //0.122900451���ī ĸ
				case(17){itemString = `id:16052 `; iCumRate +=3;} //0.122900451���ī �� �۷���
				case(18){itemString = `id:17125 `; iCumRate +=3;} //0.122900451���ī ���� ����
				case(19){itemString = `id:15338 `; iCumRate +=3;} //0.122900451�θ�ƽ �̺�� �巹��
				case(20){itemString = `id:15339 `; iCumRate +=3;} //0.122900451�θ�ƽ ���� ��Ʈ
				case(21){itemString = `id:17135 `; iCumRate +=3;} //0.122900451������ ������
				case(22){itemString = `id:17136 `; iCumRate +=3;} //0.122900451Ŭ���� ����
				case(23){itemString = `id:15305 `; iCumRate +=3;} //0.122900451����Ÿ ��Ű �巹��
				case(24){itemString = `id:15306 `; iCumRate +=3;} //0.122900451Ʈ��� ��Ƽ�� ����
				case(25){itemString = `id:16047 `; iCumRate +=3;} //0.122900451����Ÿ ��Ű �۷���
				case(26){itemString = `id:16050 `; iCumRate +=3;} //0.122900451Ʈ��� ����ư �۷���
				case(27){itemString = `id:17120 `; iCumRate +=3;} //0.122900451����Ÿ �÷� ��Ŭ ����
				case(28){itemString = `id:17121 `; iCumRate +=3;} //0.122900451Ʈ��� ����
				case(29){itemString = `id:18213 `; iCumRate +=3;} //0.122900451����Ÿ Ʈ�� ����
				case(30){itemString = `id:18214 `; iCumRate +=3;} //0.122900451Ʈ��� ��Ƽ�� �͹�
				case(31){itemString = `id:15250 `; iCumRate +=3;} //0.122900451���̵� �ǻ� �� Ÿ��
				case(32){itemString = `id:15251 `; iCumRate +=3;} //0.122900451���̵� �ǻ� ��Ʈ Ÿ��
				case(33){itemString = `id:15252 `; iCumRate +=3;} //0.122900451���� �ǻ�
				case(34){itemString = `id:18176 `; iCumRate +=3;} //0.122900451���̵� �Ӹ���
				case(35){itemString = `id:15079 `; iCumRate +=3;} //0.122900451������ �� ���� ��ĿƮ
				case(36){itemString = `id:15117 suffix:31202`; iCumRate +=3;} //0.122900451������ ������ ���壨��Į��
				case(37){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.122900451������ ������ ���壨�����ʱ�����
				case(38){itemString = `id:15116 suffix:31202`; iCumRate +=3;} //0.122900451������ ������ ���壨��Į��
				case(39){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.122900451������ ������ ���壨�����ʱ�����
				case(40){itemString = `id:18005 `; iCumRate +=4;} //0.163867268��� ������ ����
				case(41){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268��� ���� ì ������ ����
				case(42){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate +=4;} //0.163867268Ƽ�� ��Ʈ
				case(43){itemString = `id:15260 `; iCumRate +=4;} //0.163867268�ٺ� ���� �÷��� ����(������)
				case(44){itemString = `id:15261 `; iCumRate +=4;} //0.163867268�ٺ� ���� �÷��� ����(������)
				case(45){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate +=4;} //0.163867268���̽� �÷�Ŷ ����
				case(46){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268�� �������� ��ĿƮ
				case(47){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268�������� ���ڵ� ��Ʈ
				case(48){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268�Ƶ��� ���߷� ��ũ����
				case(49){itemString = `id:15113 `; iCumRate +=4;} //0.163867268������ �˻��б� ���� ��ƮŸ��
				case(50){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268������ �˻��б� ���� ��Ÿ��
				case(51){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268������ �˻��б� ���� ��ƮŸ��
				case(52){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate +=4;} //0.163867268Ʈ��� ��ī�� ����
				case(53){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate +=4;} //0.163867268�� ��ư �ޱ� ����
				case(54){itemString = `id:15065 `; iCumRate +=4;} //0.163867268���� ����Ʈ ��ĿƮ
				case(55){itemString = `id:63034 col1:c00000`; iCumRate +=4;} //0.163867268������ ���� ����(�� ����)
				case(56){itemString = `id:63033 col1:000000`; iCumRate +=4;} //0.163867268������ ���� ����(�� ����)
				case(57){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268���� �̴� ��ĿƮ
				case(58){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268���̳��巹��
				case(59){itemString = `id:18044 `; iCumRate +=4;} //0.163867268���˿� ����
				case(60){itemString = `id:16519 `; iCumRate +=4;} //0.163867268��ȣȭ �尩
				case(61){itemString = `id:18046 `; iCumRate +=4;} //0.163867268�հ��� �Ӹ����
				case(62){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268Ŭ���� ������ ����
				case(63){itemString = `id:15060 `; iCumRate +=4;} //0.163867268���� �̳ʷκ� ����
				case(64){itemString = `id:17041 `; iCumRate +=4;} //0.163867268�������� ���ú���
				case(65){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268���̵� ���� �巹��
				case(66){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268���ĵ�Į�� �����긮��
				case(67){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268�߱� ���÷� �κ�
				case(68){itemString = `id:18060 `; iCumRate +=4;} //0.163867268�� �䳢 �Ӹ���5
				case(69){itemString = `id:18065 `; iCumRate +=4;} //0.163867268���� �䳢 �Ӹ���5
				case(70){itemString = `id:18070 `; iCumRate +=4;} //0.163867268�� �䳢 �Ӹ���5
				case(71){itemString = `id:18051 `; iCumRate +=4;} //0.163867268�ڷ��� ���� ����
				case(72){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate +=4;} //0.163867268�ڷ��� ���ڽ�Ʈ
				case(73){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268����ǳ ���纹
				case(74){itemString = `id:60001 suffix:10702`; iCumRate +=10;} //0.409668169���ŰƮ������ƺ�
				case(75){itemString = `id:18016 suffix:10702`; iCumRate +=10;} //0.409668169���ڣ�����ƺ�
				case(76){itemString = `id:16001 suffix:10702`; iCumRate +=10;} //0.409668169���� �۷��꣨����ƺ�
				case(77){itemString = `id:16019 suffix:10702`; iCumRate +=10;} //0.409668169�ٹ��� �ȸ� �尩������ƺ�
				case(78){itemString = `id:17003 suffix:10702`; iCumRate +=10;} //0.409668169���� �Ź� ���ڿ루����ƺ�
				case(79){itemString = `id:17007 suffix:10702`; iCumRate +=10;} //0.409668169���� �Ź� ���ڿ루����ƺ�
				case(80){itemString = `id:15000 suffix:10702`; iCumRate +=10;} //0.409668169���� ������ ����������ƺ�
				case(81){itemString = `id:15022 suffix:10702`; iCumRate +=10;} //0.409668169���� ��ĿƮ������ƺ�
				case(82){itemString = `id:63069 `; iCumRate +=10;} //0.409668169�ݼ� ���� ����
				case(83){itemString = `id:15055 `; iCumRate +=10;} //0.409668169���� �̴� ���ǽ�
				case(84){itemString = `id:62005 suffix:30501`; iCumRate +=10;} //0.409668169��æƮ�����̾�Ʈ��
				case(85){itemString = `id:62005 suffix:30302`; iCumRate +=10;} //0.409668169��æƮ���ں�Ʈ��
				case(86){itemString = `id:46006 `; iCumRate +=10;} //0.409668169ī��Ʈ �ǵ�
				case(87){itemString = `id:15053 `; iCumRate +=10;} //0.409668169�÷�Į�� ���ǽ�
				case(88){itemString = `id:15134 `; iCumRate +=10;} //0.409668169��� ������ ��Ʈ
				case(89){itemString = `id:15136 `; iCumRate +=10;} //0.409668169��� ���̽� ��ĿƮ
				case(90){itemString = `id:15063 `; iCumRate +=10;} //0.409668169���̾�� ���� ���ǽ�
				case(91){itemString = `id:15108 `; iCumRate +=10;} //0.409668169���� ���̵� ��ũž
				case(92){itemString = `id:15059 `; iCumRate +=10;} //0.409668169��ũ�� ��ũž �ݹ���
				case(93){itemString = `id:15112 `; iCumRate +=10;} //0.409668169������ �����̷�
				case(94){itemString = `id:17042 `; iCumRate +=10;} //0.409668169�ڷ��� ������Ż �� ����
				case(95){itemString = `id:15074 `; iCumRate +=10;} //0.409668169���̽� ������ ��Ʈ
				case(96){itemString = `id:15061 `; iCumRate +=10;} //0.409668169���ṫ�� ��Ʈ�� Ʃ��
				case(97){itemString = `id:17040 `; iCumRate +=10;} //0.409668169���� ��Ʈ�� ����
				case(98){itemString = `id:18525 `; iCumRate +=10;} //0.409668169���͵�� ĸ
				case(99){itemString = `id:15014 `; iCumRate +=10;} //0.409668169�Ĺ߲��� ��
				case(100){itemString = `id:18113 `; iCumRate +=10;} //0.409668169������ ����� ����
				case(101){itemString = `id:18114 `; iCumRate +=10;} //0.409668169�ٹ��� ����� ����
				case(102){itemString = `id:18115 `; iCumRate +=10;} //0.409668169�� ����� ����
				case(103){itemString = `id:62005 suffix:30702`; iCumRate +=10;} //0.409668169��æƮ�����̺죩
				case(104){itemString = `id:62005 prefix:207`; iCumRate +=10;} //0.409668169��æƮ��������
				case(105){itemString = `id:63030 col1:ffffff`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(106){itemString = `id:63030 col1:00c000`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(107){itemString = `id:63030 col1:0000c0`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(108){itemString = `id:63030 col1:c0c000`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(109){itemString = `id:63030 col1:c000c0`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(110){itemString = `id:63030 col1:00c0c0`; iCumRate +=10;} //0.409668169���� ���� ���� ���ã��� ������
				case(111){itemString = `id:15029 `; iCumRate +=10;} //0.409668169��ũ �������̿�
				case(112){itemString = `id:15151 `; iCumRate +=10;} //0.409668169���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(113){itemString = `id:15152 `; iCumRate +=10;} //0.409668169���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(114){itemString = `id:15153 `; iCumRate +=10;} //0.409668169���� �������� ��Ʈ�������룩
				case(115){itemString = `id:15154 `; iCumRate +=10;} //0.409668169���� �������� ��Ʈ�������룩
				case(116){itemString = `id:15032 `; iCumRate +=10;} //0.409668169������ �ݹ���
				case(117){itemString = `id:15026 `; iCumRate +=10;} //0.409668169������ �ս�ĿƮ
				case(118){itemString = `id:15016 `; iCumRate +=10;} //0.409668169����� ��Ÿŷ ������
				case(119){itemString = `id:15051 `; iCumRate +=10;} //0.409668169Ÿ��Ʈ ��Ʈ ����
				case(120){itemString = `id:15008 `; iCumRate +=10;} //0.409668169�˻��б� ����
				case(121){itemString = `id:15212 `; iCumRate +=10;} //0.409668169�ݸ� ���� ����
				case(122){itemString = `id:15137 `; iCumRate +=10;} //0.409668169������ ���� ��Ŷ ��Ʈ
				case(123){itemString = `id:15127 `; iCumRate +=10;} //0.409668169������ Ʈ����ų� ��Ʈ
				case(124){itemString = `id:19031 `; iCumRate +=10;} //0.409668169��Ÿ ����Ʈ �κ�
				case(125){itemString = `id:18011 `; iCumRate +=10;} //0.409668169��� ������ ĸ
				case(126){itemString = `id:18124 `; iCumRate +=10;} //0.409668169���� �������� ��Ʈ ĸ
				case(127){itemString = `id:18009 `; iCumRate +=10;} //0.409668169��� ���� ĸ
				case(128){itemString = `id:18014 `; iCumRate +=10;} //0.409668169��� ����
				case(129){itemString = `id:18000 `; iCumRate +=10;} //0.409668169��ũ ����
				case(130){itemString = `id:16013 `; iCumRate +=10;} //0.409668169�˻� �尩
				case(131){itemString = `id:16032 `; iCumRate +=10;} //0.409668169���� �۷���
				case(132){itemString = `id:63030 `; iCumRate +=10;} //0.409668169���� ���� ���� ����
				case(133){itemString = `id:91006 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����10
				case(134){itemString = `id:91010 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����11
				case(135){itemString = `id:91011 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����12
				case(136){itemString = `id:91012 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����13
				case(137){itemString = `id:91013 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����14
				case(138){itemString = `id:91014 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����15
				case(139){itemString = `id:91015 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����16
				case(140){itemString = `id:91007 expire:43200`; iCumRate +=10;} //0.409668169ü����ȭ����17
				case(141){itemString = `id:18112 `; iCumRate +=16;} //0.65546907�� ���� ��ǰ
				case(142){itemString = `id:18111 `; iCumRate +=16;} //0.65546907���� ���� ��ǰ
				case(143){itemString = `id:18110 `; iCumRate +=16;} //0.65546907���� ���� ��ǰ
				case(144){itemString = `id:18109 `; iCumRate +=16;} //0.65546907���� ���� ��ǰ
				case(145){itemString = `id:18108 `; iCumRate +=16;} //0.65546907���� ���� ��ǰ
				case(146){itemString = `id:18029 `; iCumRate +=16;} //0.65546907������ �Ȱ�
				case(147){itemString = `id:18028 `; iCumRate +=16;} //0.65546907���̽� �Ȱ�
				case(148){itemString = `id:19008 `; iCumRate +=16;} //0.65546907���� �Ǵ� �κ�
				case(149){itemString = `id:19009 `; iCumRate +=16;} //0.65546907���� ���� �κ�
				case(150){itemString = `id:19017 `; iCumRate +=16;} //0.65546907���� �κ�
				case(151){itemString = `id:19016 `; iCumRate +=16;} //0.65546907�� �κ�
				case(152){itemString = `id:40053 `; iCumRate +=16;} //0.65546907����� ��� �ɴٹ�
				case(153){itemString = `id:40051 `; iCumRate +=16;} //0.65546907����� ��� �Ѽ���
				case(154){itemString = `id:18089 `; iCumRate +=16;} //0.65546907����� ��� ���
				case(155){itemString = `id:40054 `; iCumRate +=16;} //0.65546907�Ķ� ��� �ɴٹ�
				case(156){itemString = `id:40052 `; iCumRate +=16;} //0.65546907�Ķ� ��� �Ѽ���
				case(157){itemString = `id:16500 `; iCumRate +=16;} //0.65546907�ﳪ �������� �۷���
				case(158){itemString = `id:19020 `; iCumRate +=16;} //0.65546907��Ÿ�� ����� ��Ʈ
				case(159){itemString = `id:62005 prefix:7 `; iCumRate +=16;} //0.65546907��æƮ���������ͣ�
				case(160){itemString = `id:16520 `; iCumRate +=16;} //0.65546907�� ���� �۷���
				case(161){itemString = `id:15128 `; iCumRate +=16;} //0.65546907�� �� ���� �巹��
				case(162){itemString = `id:16019 `; iCumRate +=16;} //0.65546907�ٹ��� �ȸ� �尩
				case(163){itemString = `id:18047 `; iCumRate +=16;} //0.65546907�ڷ��� ��Ʈ ����
				case(164){itemString = `id:18008 `; iCumRate +=16;} //0.65546907��Ʈ������ ĸ
				case(165){itemString = `id:15025 `; iCumRate +=16;} //0.65546907�����б� ���ڱ���
				case(166){itemString = `id:18043 `; iCumRate +=16;} //0.65546907�ڷ��� ��Ʈ ����
				case(167){itemString = `id:18026 `; iCumRate +=16;} //0.65546907��� ���θ���
				case(168){itemString = `id:15052 `; iCumRate +=16;} //0.65546907��ũ�� ���� Ʃ��
				case(169){itemString = `id:19005 `; iCumRate +=16;} //0.65546907���÷� �κ�
				case(170){itemString = `id:18040 `; iCumRate +=16;} //0.65546907�ڷ��� ���� ������
				case(171){itemString = `id:18038 `; iCumRate +=16;} //0.65546907���� �跿 ����
				case(172){itemString = `id:15042 `; iCumRate +=16;} //0.65546907�ճ� ���ǽ�
				case(173){itemString = `id:63025 count:3`; iCumRate +=16;} //0.65546907��뷮 �ູ�� ����
				case(174){itemString = `id:51031 count:3`; iCumRate +=16;} //0.65546907���� ȸ���� ����
				case(175){itemString = `id:51036 `; iCumRate +=16;} //0.65546907���̾�Ʈ ���� U
				case(176){itemString = `id:51038 `; iCumRate +=16;} //0.65546907���̾�Ʈ ���� L
				case(177){itemString = `id:51039 `; iCumRate +=16;} //0.65546907���̾�Ʈ ���� F
				case(178){itemString = `id:17006 `; iCumRate +=16;} //0.65546907õ�Ź�
				case(179){itemString = `id:18086 `; iCumRate +=16;} //0.65546907������ �� ���
				case(180){itemString = `id:18087 `; iCumRate +=16;} //0.65546907��� �� ���
				case(181){itemString = `id:18088 `; iCumRate +=16;} //0.65546907ȭ��
				case(182){itemString = `id:18090 `; iCumRate +=16;} //0.65546907�Ķ� ��� ���
				case(183){itemString = `id:40046 `; iCumRate +=16;} //0.65546907��� �Ѽ���
				case(184){itemString = `id:40047 `; iCumRate +=16;} //0.65546907��� �ɴٹ�
				case(185){itemString = `id:18541 `; iCumRate +=16;} //0.65546907��Ӹ� ����
				case(186){itemString = `id:18103 `; iCumRate +=16;} //0.65546907���� ����
				case(187){itemString = `id:60037 count:5`; iCumRate +=16;} //0.65546907�� ���� ����
				case(188){itemString = `id:60038 count:5`; iCumRate +=16;} //0.65546907���� ����
				case(189){itemString = `id:18010 `; iCumRate +=16;} //0.65546907��� ����Ʈ ĸ
				case(190){itemString = `id:17016 `; iCumRate +=16;} //0.65546907�ʵ� �Ĺ��
				case(191){itemString = `id:17015 `; iCumRate +=16;} //0.65546907�Ĺ��
				case(192){itemString = `id:17005 `; iCumRate +=16;} //0.65546907��ɲ� �Ź�
				case(193){itemString = `id:17002 `; iCumRate +=16;} //0.65546907�˻� �Ź�
				case(194){itemString = `id:17022 `; iCumRate +=16;} //0.65546907��������
				case(195){itemString = `id:17001 `; iCumRate +=16;} //0.65546907���� ����
				case(196){itemString = `id:17007 `; iCumRate +=16;} //0.65546907���� ����
				case(197){itemString = `id:16009 `; iCumRate +=16;} //0.65546907��ɲ��尩
				case(198){itemString = `id:15031 `; iCumRate +=16;} //0.65546907�����б��� ���� ����
				case(199){itemString = `id:19012 `; iCumRate +=16;} //0.65546907Ʈ��� ���̾�� �κ�
				case(200){itemString = `id:18004 `; iCumRate +=16;} //0.65546907��� �мǸ���
				case(201){itemString = `id:15132 `; iCumRate +=16;} //0.65546907���߷� ����Ʈ ����
				case(202){itemString = `id:15043 `; iCumRate +=16;} //0.65546907����Ƽ ���Ʈ
				case(203){itemString = `id:17017 `; iCumRate +=16;} //0.65546907������Ʈ ����
				case(204){itemString = `id:16006 `; iCumRate +=16;} //0.65546907����� �尩
				case(205){itemString = `id:16017 `; iCumRate +=16;} //0.65546907���Ĵٵ� �۷���
				case(206){itemString = `id:17060 `; iCumRate +=16;} //0.65546907���� �������� ��Ʈ ����(������)
				case(207){itemString = `id:17061 `; iCumRate +=16;} //0.65546907���� �������� ��Ʈ ����(������)
				case(208){itemString = `id:17019 `; iCumRate +=16;} //0.65546907�������� �Ź�
				case(209){itemString = `id:17067 `; iCumRate +=16;} //0.65546907���� Ÿ�� �� ����
				case(210){itemString = `id:17008 `; iCumRate +=16;} //0.65546907�ڷ��� �����������룩
				case(211){itemString = `id:17010 `; iCumRate +=16;} //0.65546907�ڷ��� �����������룩
				case(212){itemString = `id:17023 `; iCumRate +=16;} //0.65546907������ �Ź�
				case(213){itemString = `id:16031 `; iCumRate +=16;} //0.65546907�������� Ÿ��Ʈ �۷���
				case(214){itemString = `id:16026 `; iCumRate +=16;} //0.65546907���� �������� ��Ʈ �۷���
				case(215){itemString = `id:16016 `; iCumRate +=16;} //0.65546907����Ʈ �۷���
				case(216){itemString = `id:17003 `; iCumRate +=16;} //0.65546907���� �Źߣ������룩
				case(217){itemString = `id:17024 `; iCumRate +=16;} //0.65546907��� ����
				case(218){itemString = `id:17013 `; iCumRate +=16;} //0.65546907�β��� ����
				case(219){itemString = `id:17069 `; iCumRate +=16;} //0.65546907���� ����
				case(220){itemString = `id:15020 `; iCumRate +=16;} //0.65546907�ڷ��� �����巹��
				case(221){itemString = `id:15044 `; iCumRate +=16;} //0.65546907����� �۾���
				case(222){itemString = `id:15041 `; iCumRate +=16;} //0.65546907�繫�� ������ ��Ʈ
				case(223){itemString = `id:15027 `; iCumRate +=16;} //0.65546907��� �ս�ĿƮ
				case(224){itemString = `id:15018 `; iCumRate +=16;} //0.65546907��� �����ڿʣ������룩
				case(225){itemString = `id:15033 `; iCumRate +=16;} //0.65546907��� �����ڿ�(�����룩
				case(226){itemString = `id:15023 `; iCumRate +=16;} //0.65546907��ũ ��ɲۿʣ������룩
				case(227){itemString = `id:15035 `; iCumRate +=16;} //0.65546907��ũ ��ɲۿʣ������룩
				case(228){itemString = `id:19003 `; iCumRate +=16;} //0.65546907Ʈ���ݷθ� �κ�
				case(229){itemString = `id:63024 `; iCumRate +=16;} //0.65546907���� ����
				case(230){itemString = `id:18002 `; iCumRate +=16;} //0.65546907��� ĸ
				case(231){itemString = `id:18007 `; iCumRate +=16;} //0.65546907���� ĸ
				case(232){itemString = `id:18013 `; iCumRate +=16;} //0.65546907�ڷ��� ĸ
				case(233){itemString = `id:18156 `; iCumRate +=16;} //0.65546907��� ����
				case(234){itemString = `id:18042 `; iCumRate +=16;} //0.65546907�ڷ��� ����� ����
				case(235){itemString = `id:18003 `; iCumRate +=16;} //0.65546907������ ĸ
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
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
		}
	}
}
