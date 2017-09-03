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
	//�˷��ó��� ���谡 ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(2077);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15222`; iCumRate += 4;} //0.1925854598 2077�׷��̽� �� �巹��(������)
			case(1){itemString = `id:40017 col1:86402894 col2:660000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 4;} //0.1925854598 2077������-> ������ ��¦��, ������ ���ڵ�(��æƮ) ������
			case(2){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 4;} //0.1925854598 2077���� ����
			case(3){itemString = `id:40081 col2:800000`; iCumRate += 4;} //0.1925854598 2077���� ���� �� ����
			case(4){itemString = `id:40031 col1:eeeeee`; iCumRate += 4;} //0.1925854598 2077�鼮 ����
			case(5){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 4;} //0.1925854598 2077����� ������ ����
			case(6){itemString = `id:46006 col1:eeeeee col2:660000 col3:eeeeee`; iCumRate += 4;} //0.1925854598 2077��������Ʈ �ǵ�
			case(7){itemString = `id:40011 col1:FFF270 col2:ebbe21 col3:ebbe21`; iCumRate += 4;} //0.1925854598 2077�ݻ� ��ε� �ҵ�
			case(8){itemString = `id:46001`; iCumRate += 4;} //0.1925854598 2077���� ���� �� �׵θ� ���� �ǵ�
			case(9){itemString = `id:14013 prefix:20403 suffix:30515`; iCumRate += 4;} //0.1925854598 2077�¸��� ����(��æƮ) �θ�ī ���׸�ŸŸ��
			case(10){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 4;} //0.1925854598 2077������ ����(��æƮ) �׷��̽� �÷���Ʈ �Ƹ�
			case(11){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 4;} //0.1925854598 2077���� �� �߱����÷� �κ�
			case(12){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 4;} //0.1925854598 2077��� �߱� ���÷� �κ�
			case(13){itemString = `id:19007 col1:800000 col2:ffffff col3:ffffff`; iCumRate += 4;} //0.1925854598 2077���� �� �߱����÷� �κ�
			case(14){itemString = `id:15135 prefix:207 suffix:10807`; iCumRate += 4;} //0.1925854598 2077���� ���ô����̼�(��æƮ) ��ũ ��Ʈ
			case(15){itemString = `id:40015 col1:ff66ff col2:ff66cc col3:ff66cc`; iCumRate += 4;} //0.1925854598 2077�� �÷�Ʈ �� �ҵ�
			case(16){itemString = `id:80007`; iCumRate += 4;} //0.1925854598 2077������ Ž�谡 ����
			case(17){itemString = `id:17073`; iCumRate += 4;} //0.1925854598 2077Ÿ�̾� �� ����
			case(18){itemString = `id:40049 col1:66ffff col2:66ffff col3:66ffff`; iCumRate += 4;} //0.1925854598 2077�ٴٺ� �÷�Ʈ
			case(19){itemString = `id:80008`; iCumRate += 4;} //0.1925854598 2077������ �̸��� ĳ�־� ��
			case(20){itemString = `id:55000`; iCumRate += 8;} //0.3851709196 2077���� ���̽��ǻ�
			case(21){itemString = `id:55001`; iCumRate += 8;} //0.3851709196 2077���� ���̽��� �̻�
			case(22){itemString = `id:55002`; iCumRate += 8;} //0.3851709196 2077���� ���̽��� ������
			case(23){itemString = `id:55003`; iCumRate += 8;} //0.3851709196 2077���� ���̽��� �ι߱�
			case(24){itemString = `id:55005`; iCumRate += 8;} //0.3851709196 2077���� �Ͽ���� ��
			case(25){itemString = `id:55006`; iCumRate += 8;} //0.3851709196 2077���� �Ͽ���� �̻�
			case(26){itemString = `id:55007`; iCumRate += 8;} //0.3851709196 2077���� �Ͽ���� ������
			case(27){itemString = `id:55008`; iCumRate += 8;} //0.3851709196 2077���� �Ͽ���� �߸� ���
			case(28){itemString = `id:55009`; iCumRate += 8;} //0.3851709196 2077���� �Ͽ���� ����
			case(29){itemString = `id:55011`; iCumRate += 8;} //0.3851709196 2077���� ������ ��Ŭ��
			case(30){itemString = `id:55012`; iCumRate += 8;} //0.3851709196 2077���� ������ �Ӹ����
			case(31){itemString = `id:55013`; iCumRate += 8;} //0.3851709196 2077���� ������ ��
			case(32){itemString = `id:55014`; iCumRate += 8;} //0.3851709196 2077���� ������ ������
			case(33){itemString = `id:55015`; iCumRate += 8;} //0.3851709196 2077���� ������ ��Ʈ
			case(34){itemString = `id:55016`; iCumRate += 8;} //0.3851709196 2077���� ������ �ո� ���
			case(35){itemString = `id:55019`; iCumRate += 8;} //0.3851709196 2077���� ������ ����
			case(36){itemString = `id:55020`; iCumRate += 8;} //0.3851709196 2077���� ������ �������
			case(37){itemString = `id:55021`; iCumRate += 8;} //0.3851709196 2077���� ������ ����
			case(38){itemString = `id:55022`; iCumRate += 8;} //0.3851709196 2077���� ������ ��
			case(39){itemString = `id:55023`; iCumRate += 8;} //0.3851709196 2077���� ������ ��
			case(40){itemString = `id:55024`; iCumRate += 8;} //0.3851709196 2077���� ������ ����
			case(41){itemString = `id:55025`; iCumRate += 8;} //0.3851709196 2077�׾Ƹ� �Ź��� �ٸ�
			case(42){itemString = `id:55026`; iCumRate += 8;} //0.3851709196 2077�׾Ƹ� �Ź��� �׾Ƹ�
			case(43){itemString = `id:55027`; iCumRate += 8;} //0.3851709196 2077�׾Ƹ� �Ź��� ��ݴ�
			case(44){itemString = `id:55028`; iCumRate += 8;} //0.3851709196 2077�׾Ƹ� �Ź��� ���Թ�
			case(45){itemString = `id:55029`; iCumRate += 8;} //0.3851709196 2077�׾Ƹ� �Ź��� ���ָӴ�
			case(46){itemString = `id:55062`; iCumRate += 8;} //0.3851709196 2077���� �������� ������
			case(47){itemString = `id:55063`; iCumRate += 8;} //0.3851709196 2077���� �������� �۷���
			case(48){itemString = `id:55064`; iCumRate += 8;} //0.3851709196 2077���� �������� ����
			case(49){itemString = `id:55031`; iCumRate += 10;} //0.4814636495 2077������ ���� ���̽��� ��
			case(50){itemString = `id:55032`; iCumRate += 10;} //0.4814636495 2077������ ���� ���̽��� ��
			case(51){itemString = `id:55033`; iCumRate += 10;} //0.4814636495 2077������ ���� ���̽��� ����
			case(52){itemString = `id:55034`; iCumRate += 10;} //0.4814636495 2077������ ���� ���̽��� �߱�
			case(53){itemString = `id:55035`; iCumRate += 10;} //0.4814636495 2077������ ���� ���̽��� ����
			case(54){itemString = `id:55036`; iCumRate += 10;} //0.4814636495 2077������ ���� �Ͽ���� ��
			case(55){itemString = `id:55037`; iCumRate += 10;} //0.4814636495 2077������ ���� �Ͽ���� ��
			case(56){itemString = `id:55038`; iCumRate += 10;} //0.4814636495 2077������ ���� �Ͽ���� ����
			case(57){itemString = `id:55039`; iCumRate += 10;} //0.4814636495 2077������ ���� �Ͽ���� �߸����
			case(58){itemString = `id:55040`; iCumRate += 10;} //0.4814636495 2077������ ���� �Ͽ���� ����
			case(59){itemString = `id:55041`; iCumRate += 5;} //0.2407318247 2077������ ���� �Ͽ����  ����
			case(60){itemString = `id:55042`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ��Ŭ��
			case(61){itemString = `id:55043`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ �Ӹ����
			case(62){itemString = `id:55044`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ��
			case(63){itemString = `id:55045`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ������
			case(64){itemString = `id:55046`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ��Ʈ
			case(65){itemString = `id:55047`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ �����
			case(66){itemString = `id:55048`; iCumRate += 5;} //0.2407318247 2077������ ���� ������  ����
			case(67){itemString = `id:55049`; iCumRate += 5;} //0.2407318247 2077������ ���� ������ ����
			case(68){itemString = `id:55050`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ����
			case(69){itemString = `id:55051`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ���� ���
			case(70){itemString = `id:55052`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ����
			case(71){itemString = `id:55053`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ��
			case(72){itemString = `id:55054`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ��
			case(73){itemString = `id:55055`; iCumRate += 10;} //0.4814636495 2077������ ���� ������ ����
			case(74){itemString = `id:55056`; iCumRate += 10;} //0.4814636495 2077������ �׾Ƹ� �Ź��� �ٸ�
			case(75){itemString = `id:55057`; iCumRate += 10;} //0.4814636495 2077������ �׾Ƹ� �Ź��� �׾Ƹ�
			case(76){itemString = `id:55058`; iCumRate += 10;} //0.4814636495 2077������ �׾Ƹ� �Ź��� ��ݴ�
			case(77){itemString = `id:55059`; iCumRate += 10;} //0.4814636495 2077������ �׾Ƹ� �Ź��� ���Թ�
			case(78){itemString = `id:55060`; iCumRate += 10;} //0.4814636495 2077������ �׾Ƹ� �Ź��� ���ָӴ�
			case(79){itemString = `id:55061`; iCumRate += 5;} //0.2407318247 2077������ �׾Ƹ� �Ź��� ����
			case(80){itemString = `id:55065`; iCumRate += 10;} //0.4814636495 2077������ ���� �������� ������
			case(81){itemString = `id:55066`; iCumRate += 10;} //0.4814636495 2077������ ���� �������� �۷���
			case(82){itemString = `id:55067`; iCumRate += 10;} //0.4814636495 2077������ ���� �������� ����
			case(83){itemString = `id:55068`; iCumRate += 5;} //0.2407318247 2077������ ���� ������ ����
			case(84){itemString = `id:62005 suffix:30103`; iCumRate += 10;} //0.4814636495 2077�ӹ���
			case(85){itemString = `id:62005 suffix:30204`; iCumRate += 10;} //0.4814636495 2077������
			case(86){itemString = `id:62005 suffix:30314`; iCumRate += 10;} //0.4814636495 2077�����ϴ�
			case(87){itemString = `id:62005 prefix:20503`; iCumRate += 10;} //0.4814636495 2077����
			case(88){itemString = `id:62005 suffix:30615`; iCumRate += 10;} //0.4814636495 2077�����
			case(89){itemString = `id:62005 suffix:30813`; iCumRate += 10;} //0.4814636495 2077������
			case(90){itemString = `id:62005 suffix:30716`; iCumRate += 10;} //0.4814636495 2077�����
			case(91){itemString = `id:62005 suffix:30717`; iCumRate += 10;} //0.4814636495 2077����
			case(92){itemString = `id:62005 suffix:30814`; iCumRate += 10;} //0.4814636495 2077������
			case(93){itemString = `id:62005 prefix:20504`; iCumRate += 10;} //0.4814636495 2077�ݰ���
			case(94){itemString = `id:62005 prefix:20108`; iCumRate += 10;} //0.4814636495 2077Ű��
			case(95){itemString = `id:62005 prefix:20304`; iCumRate += 10;} //0.4814636495 2077Ÿ��
			case(96){itemString = `id:62005 prefix:20505`; iCumRate += 10;} //0.4814636495 2077���ڵ�
			case(97){itemString = `id:62005 prefix:20508`; iCumRate += 10;} //0.4814636495 2077������
			case(98){itemString = `id:62005 prefix:20618`; iCumRate += 10;} //0.4814636495 2077�����̴�
			case(99){itemString = `id:62005 prefix:20718`; iCumRate += 10;} //0.4814636495 2077�⹦��
			case(100){itemString = `id:62005 prefix:20209`; iCumRate += 10;} //0.4814636495 2077������
			case(101){itemString = `id:62005 prefix:20409`; iCumRate += 10;} //0.4814636495 2077�縷����
			case(102){itemString = `id:62005 prefix:20615`; iCumRate += 10;} //0.4814636495 2077�縷�Ź�
			case(103){itemString = `id:62005 prefix:20212`; iCumRate += 10;} //0.4814636495 2077������
			case(104){itemString = `id:62005 prefix:20412`; iCumRate += 10;} //0.4814636495 2077����
			case(105){itemString = `id:62005 prefix:20619`; iCumRate += 10;} //0.4814636495 2077Ư����
			case(106){itemString = `id:62005 prefix:20110`; iCumRate += 10;} //0.4814636495 2077�����
			case(107){itemString = `id:62005 prefix:20306`; iCumRate += 10;} //0.4814636495 2077�ʿ���
			case(108){itemString = `id:62005 prefix:20506`; iCumRate += 10;} //0.4814636495 2077�����
			case(109){itemString = `id:62005 prefix:20109`; iCumRate += 10;} //0.4814636495 2077�߻���
			case(110){itemString = `id:62005 prefix:20210`; iCumRate += 10;} //0.4814636495 2077�ݴް�
			case(111){itemString = `id:62005 prefix:20305`; iCumRate += 10;} //0.4814636495 2077����ũ ���
			case(112){itemString = `id:62005 prefix:20211`; iCumRate += 10;} //0.4814636495 2077������
			case(113){itemString = `id:62005 prefix:20410`; iCumRate += 10;} //0.4814636495 2077����
			case(114){itemString = `id:62005 prefix:20616`; iCumRate += 10;} //0.4814636495 2077����
			case(115){itemString = `id:62005 prefix:20411`; iCumRate += 10;} //0.4814636495 2077������
			case(116){itemString = `id:62005 prefix:20507`; iCumRate += 10;} //0.4814636495 2077������
			case(117){itemString = `id:62005 prefix:20617`; iCumRate += 10;} //0.4814636495 2077ȣ����
			case(118){itemString = `id:40026 prefix:20106`; iCumRate += 10;} //0.4814636495 2077Ȱ���� ���� ��
			case(119){itemString = `id:40026 prefix:20207`; iCumRate += 10;} //0.4814636495 2077���ؼ��� ���� ��
			case(120){itemString = `id:40026 prefix:20302`; iCumRate += 10;} //0.4814636495 2077��ȸ���� ���� ��
			case(121){itemString = `id:40026 prefix:20407`; iCumRate += 10;} //0.4814636495 2077������ ���� ��
			case(122){itemString = `id:46001 prefix:20212`; iCumRate += 10;} //0.4814636495 2077�������� ���� ���� �ǵ�
			case(123){itemString = `id:46001 prefix:20412`; iCumRate += 10;} //0.4814636495 2077������ ���� ���� �ǵ�
			case(124){itemString = `id:46001 prefix:20619`; iCumRate += 10;} //0.4814636495 2077Ư������ ���� ���� �ǵ�
			case(125){itemString = `id:40006`; iCumRate += 10;} //0.4814636495 2077�ܰ�
			case(126){itemString = `id:40005`; iCumRate += 10;} //0.4814636495 2077�� �ҵ�
			case(127){itemString = `id:40015`; iCumRate += 10;} //0.4814636495 2077�÷�Ʈ �� �ҵ�
			case(128){itemString = `id:40010`; iCumRate += 10;} //0.4814636495 2077�� �ҵ�
			case(129){itemString = `id:40011`; iCumRate += 10;} //0.4814636495 2077��ε� �ҵ�
			case(130){itemString = `id:40012`; iCumRate += 10;} //0.4814636495 2077�ٽ�Ÿ�� �ҵ�
			case(131){itemString = `id:40080`; iCumRate += 10;} //0.4814636495 2077�۶��콺
			case(132){itemString = `id:40083`; iCumRate += 10;} //0.4814636495 2077�� ĿƲ����
			case(133){itemString = `id:40030`; iCumRate += 10;} //0.4814636495 2077�� �ڵ�� �ҵ�
			case(134){itemString = `id:40033`; iCumRate += 10;} //0.4814636495 2077Ŭ���̸��
			case(135){itemString = `id:40079`; iCumRate += 10;} //0.4814636495 2077���̽�
			case(136){itemString = `id:40078`; iCumRate += 10;} //0.4814636495 2077����Ͻ�
			case(137){itemString = `id:40016`; iCumRate += 10;} //0.4814636495 2077�ظ�
			case(138){itemString = `id:40003`; iCumRate += 10;} //0.4814636495 2077�� ����
			case(139){itemString = `id:40031`; iCumRate += 10;} //0.4814636495 2077����
			case(140){itemString = `id:40014`; iCumRate += 10;} //0.4814636495 2077������ ����
			case(141){itemString = `id:40013`; iCumRate += 10;} //0.4814636495 2077�� ����
			case(142){itemString = `id:40081`; iCumRate += 10;} //0.4814636495 2077���� �� ����
			case(143){itemString = `id:40038`; iCumRate += 10;} //0.4814636495 2077����Ʈ�� �����
			case(144){itemString = `id:40040`; iCumRate += 10;} //0.4814636495 2077���̾� ����
			case(145){itemString = `id:40039`; iCumRate += 10;} //0.4814636495 2077���̽� ����
			case(146){itemString = `id:18503`; iCumRate += 10;} //0.4814636495 2077�����þ� �︧
			case(147){itemString = `id:18504`; iCumRate += 10;} //0.4814636495 2077ũ�ν� Ǯ �︧
			case(148){itemString = `id:18505`; iCumRate += 10;} //0.4814636495 2077������ũ �︧
			case(149){itemString = `id:18506`; iCumRate += 10;} //0.4814636495 2077�� ���� �︧
			case(150){itemString = `id:17506`; iCumRate += 10;} //0.4814636495 2077�ձ׸��� ����
			case(151){itemString = `id:17505`; iCumRate += 10;} //0.4814636495 2077�÷���Ʈ ����
			case(152){itemString = `id:16504`; iCumRate += 10;} //0.4814636495 2077ī���� ��Ʋ��
			case(153){itemString = `id:16505`; iCumRate += 10;} //0.4814636495 2077�÷�Ʈ ��Ʋ��
			case(154){itemString = `id:46001`; iCumRate += 10;} //0.4814636495 2077���� �ǵ�
			case(155){itemString = `id:15005`; iCumRate += 10;} //0.4814636495 2077���谡 ��Ʈ
			case(156){itemString = `id:14008`; iCumRate += 10;} //0.4814636495 2077Ǯ��Ʈ ���� ����
			case(157){itemString = `id:13035`; iCumRate += 10;} //0.4814636495 2077����Ʈ ��ī ü�θ���
			case(158){itemString = `id:13037`; iCumRate += 10;} //0.4814636495 2077����Ʈ ����Ʈ ü�θ���
			case(159){itemString = `id:13036`; iCumRate += 10;} //0.4814636495 2077����Ʈ ���� ����� ü�θ���
			case(160){itemString = `id:13043`; iCumRate += 10;} //0.4814636495 2077���̴Ͼ� ������ ����(������)
			case(161){itemString = `id:13044`; iCumRate += 10;} //0.4814636495 2077���̴Ͼ� ������ ����(������))
			case(162){itemString = `id:40071`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(163){itemString = `id:40072`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(164){itemString = `id:40073`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(165){itemString = `id:40074`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(166){itemString = `id:40075`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(167){itemString = `id:40076`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(168){itemString = `id:40077`; iCumRate += 20;} //0.9629272990 2077'��' �� �� ��
			case(169){itemString = `id:40097 col1:000000`; iCumRate += 20;} //0.9629272990 2077���� L �ε�
			case(170){itemString = `id:40097 col2:800000`; iCumRate += 20;} //0.9629272990 2077���� L �ε�
			case(171){itemString = `id:40097 col1:eeeeee`; iCumRate += 20;} //0.9629272990 2077�Ͼ� L �ε�
			case(172){itemString = `id:18542`; iCumRate += 20;} //0.9629272990 2077�� ü�� Ǯ �︧
			case(173){itemString = `id:18543`; iCumRate += 20;} //0.9629272990 2077�� ���� Ǯ �︧
			case(174){itemString = `id:18544`; iCumRate += 20;} //0.9629272990 2077�� �縮ĭ ��������
			case(175){itemString = `id:18547`; iCumRate += 20;} //0.9629272990 2077�� �ĳ��� ��� ��������
			case(176){itemString = `id:91006 expire:43200`; iCumRate += 20;} //0.9629272990 207710���� Ű�� �Ǵ� ����
			case(177){itemString = `id:91010 expire:43200`; iCumRate += 20;} //0.9629272990 207711���� Ű�� �Ǵ� ����
			case(178){itemString = `id:91011 expire:43200`; iCumRate += 20;} //0.9629272990 207712���� Ű�� �Ǵ� ����12
			case(179){itemString = `id:91012 expire:43200`; iCumRate += 20;} //0.9629272990 207713���� Ű�� �Ǵ� ����13
			case(180){itemString = `id:91013 expire:43200`; iCumRate += 20;} //0.9629272990 207714���� Ű�� �Ǵ� ����14
			case(181){itemString = `id:91014 expire:43200`; iCumRate += 20;} //0.9629272990 207715���� Ű�� �Ǵ� ����15
			case(182){itemString = `id:91015 expire:43200`; iCumRate += 20;} //0.9629272990 207716���� Ű�� �Ǵ� ����16
			case(183){itemString = `id:91007 expire:43200`; iCumRate += 20;} //0.9629272990 207717���� Ű�� �Ǵ� ����17
			case(184){itemString = `id:63025 count:3`; iCumRate += 20;} //0.9629272990 2077��뷮 �ູ�� ����
			case(185){itemString = `id:51031 count:3`; iCumRate += 20;} //0.9629272990 2077���� ȸ���� ����
			case(186){itemString = `id:63027 expire:10080`; iCumRate += 20;} //0.9629272990 2077�ж� ����
			case(187){itemString = `id:51003 count:5`; iCumRate += 20;} //0.9629272990 2077����� 50 ����
			case(188){itemString = `id:51004 count:3`; iCumRate += 20;} //0.9629272990 2077�����100 ����
			case(189){itemString = `id:51008 count:5`; iCumRate += 20;} //0.9629272990 2077���� 50 ����
			case(190){itemString = `id:51013 count:5`; iCumRate += 20;} //0.9629272990 2077���¹̳� 50 ����
			case(191){itemString = `id:51014 count:3`; iCumRate += 20;} //0.9629272990 2077���¹̳� 100 ����
			case(192){itemString = `id:51022 count:5`; iCumRate += 20;} //0.9629272990 2077����°� ���� 30 ����
			case(193){itemString = `id:51027 count:5`; iCumRate += 20;} //0.9629272990 2077����°� ���¹̳� 30 ����
			case(194){itemString = `id:51028 count:3`; iCumRate += 20;} //0.9629272990 2077����°� ���¹̳� 50 ����


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

	GiveFashionGachaphonItem(player, `id:15033`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
}
