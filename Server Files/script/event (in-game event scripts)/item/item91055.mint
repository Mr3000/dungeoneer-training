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
	//�븸 �̺�Ʈ�� ���谡 ��í�� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(2066);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:18189`; iCumRate += 2;} //0.0987166831 2026ī�캸�� ����
			case(1){itemString = `id:18187`; iCumRate += 2;} //0.0987166831 2026ū ����
			case(2){itemString = `id:16046`; iCumRate += 3;} //0.1480750247 2026����� �� �尩
			case(3){itemString = `id:18188`; iCumRate += 3;} //0.1480750247 2026�ȴ�
			case(4){itemString = `id:40049 col1:0000c0`; iCumRate += 4;} //0.1974333662 2026�÷�Ʈ�������÷���
			case(5){itemString = `id:40048 col1:f3f33a`; iCumRate += 4;} //0.1974333662 2026�ֽ��������÷���
			case(6){itemString = `id:40018 col1:c00000 col2:000000`; iCumRate += 4;} //0.1974333662 2026���𷼷��������÷���
			case(7){itemString = `id:40004 col1:45c4fa`; iCumRate += 4;} //0.1974333662 2026��Ʈ�������÷���
			case(8){itemString = `id:46007 col1:ffffff col2:ffffff col3:0020c0`; iCumRate += 4;} //0.1974333662 2026���׷� ī��Ʈ �ǵ壨�����÷���
			case(9){itemString = `id:46007  col1:181818 col2:181818 col3:c00000`; iCumRate += 4;} //0.1974333662 2026���׷� ī��Ʈ �ǵ壨�����÷���
			case(10){itemString = `id:40204`; iCumRate += 4;} //0.1974333662 2026����� ���� ������
			case(11){itemString = `id:40205`; iCumRate += 4;} //0.1974333662 2026Ƽī ���� ���� ������
			case(12){itemString = `id:55000`; iCumRate += 4;} //0.1974333662 2026���� ���̽��� ��
			case(13){itemString = `id:55001`; iCumRate += 4;} //0.1974333662 2026���� ���̽��� �̻�
			case(14){itemString = `id:55002`; iCumRate += 4;} //0.1974333662 2026���� ���̽��� ����
			case(15){itemString = `id:55003`; iCumRate += 4;} //0.1974333662 2026���� ���̽��� �߱�
			case(16){itemString = `id:55005`; iCumRate += 4;} //0.1974333662 2026���� �Ͽ���� ��
			case(17){itemString = `id:55006`; iCumRate += 4;} //0.1974333662 2026���� �Ͽ���� �̻�
			case(18){itemString = `id:55007`; iCumRate += 4;} //0.1974333662 2026���� �Ͽ���� ����
			case(19){itemString = `id:55008`; iCumRate += 4;} //0.1974333662 2026���� �Ͽ���� �߸� ���
			case(20){itemString = `id:55009`; iCumRate += 4;} //0.1974333662 2026���� �Ͽ���� ����
			case(21){itemString = `id:55011`; iCumRate += 4;} //0.1974333662 2026���� ������ ��Ŭ��
			case(22){itemString = `id:55012`; iCumRate += 4;} //0.1974333662 2026���� ������ �Ӹ����
			case(23){itemString = `id:55013`; iCumRate += 4;} //0.1974333662 2026���� ������ ��
			case(24){itemString = `id:55014`; iCumRate += 4;} //0.1974333662 2026���� ������ ��� ���
			case(25){itemString = `id:55015`; iCumRate += 4;} //0.1974333662 2026���� ������ ��Ʈ
			case(26){itemString = `id:55016`; iCumRate += 4;} //0.1974333662 2026���� ������ �ո� ���
			case(27){itemString = `id:55019`; iCumRate += 4;} //0.1974333662 2026���� ������ ����
			case(28){itemString = `id:55020`; iCumRate += 4;} //0.1974333662 2026���� ������ �������
			case(29){itemString = `id:55021`; iCumRate += 4;} //0.1974333662 2026���� ������ ����
			case(30){itemString = `id:55022`; iCumRate += 4;} //0.1974333662 2026���� ������ ��
			case(31){itemString = `id:55023`; iCumRate += 4;} //0.1974333662 2026���� ������ ��
			case(32){itemString = `id:55024`; iCumRate += 4;} //0.1974333662 2026���� ������ ����
			case(33){itemString = `id:55025`; iCumRate += 4;} //0.1974333662 2026�׾Ƹ� �Ź��� �ٸ�
			case(34){itemString = `id:55026`; iCumRate += 4;} //0.1974333662 2026�׾Ƹ� �Ź��� �׾Ƹ�
			case(35){itemString = `id:55027`; iCumRate += 4;} //0.1974333662 2026�׾Ƹ� �Ź��� ��ݴ�
			case(36){itemString = `id:55028`; iCumRate += 4;} //0.1974333662 2026�׾Ƹ� �Ź��� ���Թ�
			case(37){itemString = `id:55029`; iCumRate += 4;} //0.1974333662 2026�׾Ƹ� �Ź��� �� �ָӴ�
			case(38){itemString = `id:55062`; iCumRate += 4;} //0.1974333662 2026���� �������� ��� ���
			case(39){itemString = `id:55063`; iCumRate += 4;} //0.1974333662 2026���� �������� �۷κ�
			case(40){itemString = `id:55064`; iCumRate += 4;} //0.1974333662 2026���� �������� ����
			case(41){itemString = `id:55031`; iCumRate += 4;} //0.1974333662 2026������ ���� ���̽��� ��
			case(42){itemString = `id:55032`; iCumRate += 4;} //0.1974333662 2026������ ���� ���̽��� �̻�
			case(43){itemString = `id:55033`; iCumRate += 4;} //0.1974333662 2026������ ���� ���̽��� ����
			case(44){itemString = `id:55034`; iCumRate += 4;} //0.1974333662 2026������ ���� ���̽��� �߱�
			case(45){itemString = `id:55035`; iCumRate += 4;} //0.1974333662 2026������ ���� ���̽��� ����
			case(46){itemString = `id:55036`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� ��
			case(47){itemString = `id:55037`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� �̻�
			case(48){itemString = `id:55038`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� ����
			case(49){itemString = `id:55039`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� �߸� ���
			case(50){itemString = `id:55040`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� ����
			case(51){itemString = `id:55041`; iCumRate += 4;} //0.1974333662 2026������ ���� �Ͽ���� ����
			case(52){itemString = `id:55042`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��Ŭ��
			case(53){itemString = `id:55043`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ �Ӹ����
			case(54){itemString = `id:55044`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��
			case(55){itemString = `id:55045`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��� ���
			case(56){itemString = `id:55046`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��Ʈ
			case(57){itemString = `id:55047`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ �ո� ���
			case(58){itemString = `id:55048`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ����
			case(59){itemString = `id:55049`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ����
			case(60){itemString = `id:55050`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ����
			case(61){itemString = `id:55051`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ �������
			case(62){itemString = `id:55052`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ����
			case(63){itemString = `id:55053`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��
			case(64){itemString = `id:55054`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ��
			case(65){itemString = `id:55055`; iCumRate += 4;} //0.1974333662 2026������ ���� ������ ����
			case(66){itemString = `id:55056`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� �ٸ�
			case(67){itemString = `id:55057`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� �׾Ƹ�
			case(68){itemString = `id:55058`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� ��ݴ�
			case(69){itemString = `id:55059`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� ���Թ�
			case(70){itemString = `id:55060`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� �� �ָӴ�
			case(71){itemString = `id:55061`; iCumRate += 4;} //0.1974333662 2026������ �׾Ƹ� �Ź��� ����
			case(72){itemString = `id:55065`; iCumRate += 4;} //0.1974333662 2026������ ���� �������� ��� ���
			case(73){itemString = `id:55066`; iCumRate += 4;} //0.1974333662 2026������ ���� �������� �۷κ�
			case(74){itemString = `id:55067`; iCumRate += 4;} //0.1974333662 2026������ ���� �������� ����
			case(75){itemString = `id:55068`; iCumRate += 4;} //0.1974333662 2026������ ���� �������� ����
			case(76){itemString = `id:62005 prefix:20625`; iCumRate += 6;} //0.2961500494 2026�ݼ� �ٴã�metal needle)
			case(77){itemString = `id:62005 prefix:20825`; iCumRate += 6;} //0.2961500494 2026���� �ٴã�wooden needle��
			case(78){itemString = `id:62005 prefix:20915`; iCumRate += 6;} //0.2961500494 2026������������cypress��
			case(79){itemString = `id:62005 prefix:20621`; iCumRate += 6;} //0.2961500494 2026�̾��£�Dauntless��
			case(80){itemString = `id:15222`; iCumRate += 6;} //0.2961500494 2026�׷��̽� �� �巹��
			case(81){itemString = `id:40017 col1:86402894 col2:660000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 6;} //0.2961500494 2026������ �������� ��¦�Ÿ��� �ٷ�� ���� ���ڵ� ������
			case(82){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 6;} //0.2961500494 2026������ ����
			case(83){itemString = `id:40081 col1:800000 col2:ffffff`; iCumRate += 6;} //0.2961500494 2026������ ����� ���� �� ����
			case(84){itemString = `id:40031 col1:eeeeee`; iCumRate += 6;} //0.2961500494 2026��� ����
			case(85){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 6;} //0.2961500494 2026����� ������ ����
			case(86){itemString = `id:46006 col1:eeeeee col2:660000 col3:eeeeee`; iCumRate += 6;} //0.2961500494 2026������ ī��Ʈ �ǵ�
			case(87){itemString = `id:40011 col1:FFF270 col2:ebbe21 col3:ebbe21`; iCumRate += 6;} //0.2961500494 2026�ݻ� ��ε� �ҵ�
			case(88){itemString = `id:14013 prefix:20403 suffix:30515`; iCumRate += 6;} //0.2961500494 2026�¸��� ����(��æƮ) �θ�ī ���׸�ŸŸ��
			case(89){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 6;} //0.2961500494 2026������ ����(��æƮ) �׷��̽� �÷���Ʈ �Ƹ�
			case(90){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 6;} //0.2961500494 2026������ ������ �߱� ���÷� �κ�
			case(91){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 6;} //0.2961500494 2026��� �߱� ���÷� �κ�
			case(92){itemString = `id:19007 col1:800000 col2:ffffff col3:ffffff`; iCumRate += 6;} //0.2961500494 2026������ ����� �߱� ���÷� �κ�
			case(93){itemString = `id:15135 prefix:207 suffix:10807`; iCumRate += 6;} //0.2961500494 2026���� ���ô����̼� ��ũ ��Ʈ
			case(94){itemString = `id:40015 col1:ff66ff col2:ff66cc col3:ff66cc`; iCumRate += 6;} //0.2961500494 2026��ũ �÷�Ʈ �� �ҵ�
			case(95){itemString = `id:80007`; iCumRate += 6;} //0.2961500494 2026������ Ž�谡 ����
			case(96){itemString = `id:17073`; iCumRate += 6;} //0.2961500494 2026Ÿ�̾� �� ����
			case(97){itemString = `id:40049 col1:66ffff col2:66ffff col3:66ffff`; iCumRate += 6;} //0.2961500494 2026�ٴٻ� �÷�Ʈ
			case(98){itemString = `id:80008`; iCumRate += 6;} //0.2961500494 2026������ �̸��� ĳ�־� ��
			case(99){itemString = `id:63072 expire:10080`; iCumRate += 10;} //0.4935834156 2026���� �ж� ����
			case(100){itemString = `id:63086 expire:43200`; iCumRate += 10;} //0.4935834156 2026������� ������
			case(101){itemString = `id:63087 expire:43200`; iCumRate += 10;} //0.4935834156 2026������ ������
			case(102){itemString = `id:63088 expire:43200`; iCumRate += 10;} //0.4935834156 2026���¹̳��� ������
			case(103){itemString = `id:63058 expire:43200`; iCumRate += 10;} //0.4935834156 2026ȸ�� �ӵ� ���� ����
			case(104){itemString = `id:62005 prefix:20822`; iCumRate += 10;} //0.4935834156 2026�����ӣ�snow drop��
			case(105){itemString = `id:62005 prefix:20622`; iCumRate += 10;} //0.4935834156 2026��ȣ�ѣ�determined��
			case(106){itemString = `id:62005 prefix:20213`; iCumRate += 10;} //0.4935834156 2026��Ȱ�ѣ�cheerful��
			case(107){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.4935834156 2026������fox��
			case(108){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.4935834156 2026���̾�Ʈ��of giant��
			case(109){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.4935834156 2026���̺죨of raven��
			case(110){itemString = `id:62005 suffix:30626`; iCumRate += 10;} //0.4935834156 2026�밨�ѣ�of brave��
			case(111){itemString = `id:62005 suffix:10604`; iCumRate += 10;} //0.4935834156 2026����ǣ�of Farmer��
			case(112){itemString = `id:62005 suffix:11104`; iCumRate += 10;} //0.4935834156 2026��ũ�Ͻ���weakness��
			case(113){itemString = `id:62005 suffix:30624`; iCumRate += 10;} //0.4935834156 2026��糪����of hawthorn��
			case(114){itemString = `id:62005 suffix:30103`; iCumRate += 10;} //0.4935834156 2026�ӹ���
			case(115){itemString = `id:62005 suffix:30204`; iCumRate += 10;} //0.4935834156 2026������
			case(116){itemString = `id:62005 suffix:30314`; iCumRate += 10;} //0.4935834156 2026�����ϴ�
			case(117){itemString = `id:62005 prefix:20503`; iCumRate += 10;} //0.4935834156 2026����
			case(118){itemString = `id:62005 suffix:30615`; iCumRate += 10;} //0.4935834156 2026�����
			case(119){itemString = `id:62005 suffix:30813`; iCumRate += 10;} //0.4935834156 2026������
			case(120){itemString = `id:62005 suffix:30716`; iCumRate += 10;} //0.4935834156 2026�����
			case(121){itemString = `id:62005 suffix:30717`; iCumRate += 10;} //0.4935834156 2026����
			case(122){itemString = `id:62005 suffix:30814`; iCumRate += 10;} //0.4935834156 2026������
			case(123){itemString = `id:62005 prefix:20504`; iCumRate += 10;} //0.4935834156 2026�ݰ���
			case(124){itemString = `id:62005 prefix:20108`; iCumRate += 10;} //0.4935834156 2026Ű��
			case(125){itemString = `id:62005 prefix:20304`; iCumRate += 10;} //0.4935834156 2026Ÿ��
			case(126){itemString = `id:62005 prefix:20505`; iCumRate += 10;} //0.4935834156 2026���ڵ�
			case(127){itemString = `id:62005 prefix:20508`; iCumRate += 10;} //0.4935834156 2026������
			case(128){itemString = `id:62005 prefix:20618`; iCumRate += 10;} //0.4935834156 2026�����̴�
			case(129){itemString = `id:62005 prefix:20718`; iCumRate += 10;} //0.4935834156 2026�̻���
			case(130){itemString = `id:62005 prefix:20209`; iCumRate += 10;} //0.4935834156 2026������
			case(131){itemString = `id:62005 prefix:20409`; iCumRate += 10;} //0.4935834156 2026�縷����
			case(132){itemString = `id:62005 prefix:20615`; iCumRate += 10;} //0.4935834156 2026�縷�Ź�
			case(133){itemString = `id:62005 prefix:20212`; iCumRate += 10;} //0.4935834156 2026������
			case(134){itemString = `id:62005 prefix:20412`; iCumRate += 10;} //0.4935834156 2026����
			case(135){itemString = `id:62005 prefix:20619`; iCumRate += 10;} //0.4935834156 2026Ư����
			case(136){itemString = `id:62005 prefix:20110`; iCumRate += 10;} //0.4935834156 2026�����
			case(137){itemString = `id:62005 prefix:20306`; iCumRate += 10;} //0.4935834156 2026�ʿ���
			case(138){itemString = `id:62005 prefix:20506`; iCumRate += 10;} //0.4935834156 2026�����
			case(139){itemString = `id:62005 prefix:20109`; iCumRate += 10;} //0.4935834156 2026�߻���
			case(140){itemString = `id:62005 prefix:20210`; iCumRate += 10;} //0.4935834156 2026�ݴް�
			case(141){itemString = `id:62005 prefix:20305`; iCumRate += 10;} //0.4935834156 2026����ũ ���
			case(142){itemString = `id:62005 prefix:20211`; iCumRate += 10;} //0.4935834156 2026������
			case(143){itemString = `id:62005 prefix:20410`; iCumRate += 10;} //0.4935834156 2026����
			case(144){itemString = `id:62005 prefix:20616`; iCumRate += 10;} //0.4935834156 2026����
			case(145){itemString = `id:62005 prefix:20411`; iCumRate += 10;} //0.4935834156 2026��������
			case(146){itemString = `id:62005 prefix:20507`; iCumRate += 10;} //0.4935834156 2026������
			case(147){itemString = `id:62005 prefix:20617`; iCumRate += 10;} //0.4935834156 2026ȣ����
			case(148){itemString = `id:40026 prefix:20106`; iCumRate += 10;} //0.4935834156 2026Ȱ���� ��
			case(149){itemString = `id:40026 prefix:20207`; iCumRate += 10;} //0.4935834156 2026���ؼ��� ��
			case(150){itemString = `id:40026 prefix:20302`; iCumRate += 10;} //0.4935834156 2026��ȸ���� ��
			case(151){itemString = `id:40026 prefix:20407`; iCumRate += 10;} //0.4935834156 2026������ ��
			case(152){itemString = `id:46001 prefix:20212`; iCumRate += 10;} //0.4935834156 2026������  ���� �ǵ�
			case(153){itemString = `id:46001 prefix:20412`; iCumRate += 10;} //0.4935834156 2026����  ���� �ǵ�
			case(154){itemString = `id:46001 prefix:20619`; iCumRate += 10;} //0.4935834156 2026Ư����  ���� �ǵ�
			case(155){itemString = `id:40006`; iCumRate += 10;} //0.4935834156 2026�ܰ�
			case(156){itemString = `id:40005 `; iCumRate += 10;} //0.4935834156 2026�� �ҵ�
			case(157){itemString = `id:40015 `; iCumRate += 10;} //0.4935834156 2026�÷�Ʈ �� �ҵ�
			case(158){itemString = `id:40010 `; iCumRate += 10;} //0.4935834156 2026�� �ҵ�
			case(159){itemString = `id:40011 `; iCumRate += 10;} //0.4935834156 2026��ε� �ҵ�
			case(160){itemString = `id:40012 `; iCumRate += 10;} //0.4935834156 2026�ٽ�Ÿ�� �ҵ�
			case(161){itemString = `id:40080 `; iCumRate += 10;} //0.4935834156 2026�۶��콺
			case(162){itemString = `id:40083 `; iCumRate += 10;} //0.4935834156 2026�� ĿƲ����
			case(163){itemString = `id:40030 `; iCumRate += 10;} //0.4935834156 2026�� �ڵ�� �ҵ�
			case(164){itemString = `id:40033 `; iCumRate += 10;} //0.4935834156 2026Ŭ���̸��
			case(165){itemString = `id:40079 `; iCumRate += 10;} //0.4935834156 2026���̽�
			case(166){itemString = `id:40078 `; iCumRate += 10;} //0.4935834156 2026����Ͻ�
			case(167){itemString = `id:40016 `; iCumRate += 10;} //0.4935834156 2026�ظ�
			case(168){itemString = `id:40003 `; iCumRate += 10;} //0.4935834156 2026�� ����
			case(169){itemString = `id:40031 `; iCumRate += 10;} //0.4935834156 2026����
			case(170){itemString = `id:40014 `; iCumRate += 10;} //0.4935834156 2026������ ����
			case(171){itemString = `id:40013 `; iCumRate += 10;} //0.4935834156 2026�� ����
			case(172){itemString = `id:40081 `; iCumRate += 10;} //0.4935834156 2026���� �� ����
			case(173){itemString = `id:40038 `; iCumRate += 10;} //0.4935834156 2026����Ʈ�� ����
			case(174){itemString = `id:40040 `; iCumRate += 10;} //0.4935834156 2026���̾� ����
			case(175){itemString = `id:40039 `; iCumRate += 10;} //0.4935834156 2026���̽� ����
			case(176){itemString = `id:18503 `; iCumRate += 10;} //0.4935834156 2026�����þ� �︧
			case(177){itemString = `id:18504 `; iCumRate += 10;} //0.4935834156 2026ũ�ν� Ǯ �︧
			case(178){itemString = `id:18505 `; iCumRate += 10;} //0.4935834156 2026������ũ �︧
			case(179){itemString = `id:18506 `; iCumRate += 10;} //0.4935834156 2026�� ���� �︧
			case(180){itemString = `id:17506 `; iCumRate += 10;} //0.4935834156 2026�ձ׸��� ����
			case(181){itemString = `id:17505 `; iCumRate += 10;} //0.4935834156 2026�÷���Ʈ ����
			case(182){itemString = `id:16504 `; iCumRate += 10;} //0.4935834156 2026ī���� ��Ʋ��
			case(183){itemString = `id:16505 `; iCumRate += 10;} //0.4935834156 2026�÷�Ʈ ��Ʋ��
			case(184){itemString = `id:46001 `; iCumRate += 10;} //0.4935834156 2026���� �ǵ�
			case(185){itemString = `id:15005 `; iCumRate += 10;} //0.4935834156 2026���谡 ��Ʈ
			case(186){itemString = `id:14008 `; iCumRate += 10;} //0.4935834156 2026Ǯ��Ʈ ���� ����
			case(187){itemString = `id:13035 `; iCumRate += 10;} //0.4935834156 2026����Ʈ ��ī ü�θ���
			case(188){itemString = `id:13037 `; iCumRate += 10;} //0.4935834156 2026����Ʈ ����Ʈ ü�θ���
			case(189){itemString = `id:13036 `; iCumRate += 10;} //0.4935834156 2026����Ʈ ���� ����� ü�θ���
			case(190){itemString = `id:13043 `; iCumRate += 10;} //0.4935834156 2026���̴Ͼ� ������ ����(������)
			case(191){itemString = `id:13044 `; iCumRate += 10;} //0.4935834156 2026���̴Ͼ� ������ ����(������)
			case(192){itemString = `id:40071`; iCumRate += 20;} //0.9871668312 2026''��' �� �� ��
			case(193){itemString = `id:40072`; iCumRate += 20;} //0.9871668312 2026''��' �� �� ��
			case(194){itemString = `id:40073`; iCumRate += 20;} //0.9871668312 2026''��' �� �� ��
			case(195){itemString = `id:40074`; iCumRate += 20;} //0.9871668312 2026'��' �� �� ��
			case(196){itemString = `id:40075`; iCumRate += 20;} //0.9871668312 2026'��' �� �� ��
			case(197){itemString = `id:40076`; iCumRate += 20;} //0.9871668312 2026'��' �� �� ��
			case(198){itemString = `id:40077`; iCumRate += 20;} //0.9871668312 2026'��' �� �� ��
			case(199){itemString = `id:40097  col1:000000`; iCumRate += 20;} //0.9871668312 2026������ L �ε�
			case(200){itemString = `id:40097  col1:800000`; iCumRate += 20;} //0.9871668312 2026������ L �ε�
			case(201){itemString = `id:40097  col1:eeeeee`; iCumRate += 20;} //0.9871668312 2026��� L �ε�
			case(202){itemString = `id:18542`; iCumRate += 20;} //0.9871668312 2026�� ü�� Ǯ �︧
			case(203){itemString = `id:18543`; iCumRate += 20;} //0.9871668312 2026�� ���� Ǯ �︧
			case(204){itemString = `id:18544`; iCumRate += 20;} //0.9871668312 2026�� �縮ĭ ��������
			case(205){itemString = `id:18547`; iCumRate += 20;} //0.9871668312 2026�� �ĳ��� ��� ��������
			case(206){itemString = `id:91006  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����10
			case(207){itemString = `id:91010  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����11
			case(208){itemString = `id:91011  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����12
			case(209){itemString = `id:91012  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����13
			case(210){itemString = `id:91013  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����14
			case(211){itemString = `id:91014  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����15
			case(212){itemString = `id:91015  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����16
			case(213){itemString = `id:91007  expire:43200`; iCumRate += 20;} //0.9871668312 2026ü����ȭ����17
			case(214){itemString = `id:63025  count:3`; iCumRate += 20;} //0.9871668312 2026��뷮 �ູ�� ����
			case(215){itemString = `id:51031  count:3`; iCumRate += 20;} //0.9871668312 2026���� ȸ���� ����
			case(216){itemString = `id:63027  expire:10080`; iCumRate += 20;} //0.9871668312 2026�ж� ����
			case(217){itemString = `id:51003  count:5`; iCumRate += 20;} //0.9871668312 2026�����50
			case(218){itemString = `id:51004  count:3`; iCumRate += 20;} //0.9871668312 2026�����100
			case(219){itemString = `id:51008  count:5`; iCumRate += 20;} //0.9871668312 2026��������50
			case(220){itemString = `id:51013  count:5`; iCumRate += 20;} //0.9871668312 2026���׹̳�����50
			case(221){itemString = `id:51014  count:3`; iCumRate += 20;} //0.9871668312 2026���׹̳�����100
			case(222){itemString = `id:51022  count:5`; iCumRate += 20;} //0.9871668312 2026����°� ���� 30
			case(223){itemString = `id:51027  count:5`; iCumRate += 20;} //0.9871668312 2026����°� ���¹̳�30
			case(224){itemString = `id:51028  count:3`; iCumRate += 20;} //0.9871668312 2026����°� ���¹̳�50
			case(225){itemString = `id:15112`; iCumRate += 2;} //������ �����̷�
			case(226){itemString = `id:15184`; iCumRate += 2;} //�׶� ���̼�Ʈ ���� ����
			case(227){itemString = `id:15108`; iCumRate += 2;} //���� ���̵� ��ũž
			case(228){itemString = `id:19027`; iCumRate += 2;} //�ҷ��� ��Ʈ �κ�
			case(229){itemString = `id:19028`; iCumRate += 2;} //�ҷ��� ��ġ �κ�
			case(230){itemString = `id:15096`; iCumRate += 6;} //������ ���� �����
			case(231){itemString = `id:15110`; iCumRate += 6;} //��ũ�� ����
			case(232){itemString = `id:15099`; iCumRate += 6;} //���ī ��ο��� ���̾�� ��ĿƮ
			case(233){itemString = `id:15075`; iCumRate += 6;} //������ ���̵� �巹��
			case(234){itemString = `id:17029`; iCumRate += 6;} //���̺�  ��Ʈ ��Ŭ ����
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
