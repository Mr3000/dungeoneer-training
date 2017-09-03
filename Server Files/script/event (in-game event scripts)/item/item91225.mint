//////////////////////////////////////////////////////////////////////////////////
//                       Mabinogi Project : Use Item Script
//                           ������ ������ �̺�Ʈ �Լ�
//
//                      nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                               nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : �����ۿ� �ƹ� ����� ������
//  isusable�̰� stringid�� '/script/'�� �����ϰ� �ִ� �������� ������� ��
//  �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	//�̱� ���谡 ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;

	int iRandom = Random(3233);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:15079`; iCumRate += 1;} //0.030931024//0.030864198 ������ �� ���� ��ĿƮ
			case(1){itemString = `id:15112`; iCumRate += 1;} //0.030931024//0.030864198 ������ �����̷�
			case(2){itemString = `id:15108`; iCumRate += 1;} //0.030931024//0.030864198 ���� ���̵� ��ũž
			case(3){itemString = `id:17042`; iCumRate += 1;} //0.030931024//0.030864198 �ڷ��� ������Ż �� ����
			case(4){itemString = `id:15064col1:ff6699 col2:990000 col3:990000`; iCumRate += 1;} //0.030931024//0.030864198 ��ȫ ���̵� ���� �巹��
			case(5){itemString = `id:15060col1:e8e8e8 col2:e8e8e8 col3:e8e8e8`; iCumRate += 1;} //0.030931024//0.030864198 ��� ���� �̳ʷκ� ����
			case(6){itemString = `id:17041col1:101010 col2:101010 col3:101010`; iCumRate += 1;} //0.030931024//0.030864198 ������ �������� ���ú���
			case(7){itemString = `id:15063`; iCumRate += 1;} //0.030931024//0.030864198 ���̾�� ���� ���ǽ�
			case(8){itemString = `id:15113`; iCumRate += 1;} //0.030931024//0.030864198 ������ �˻��б� ���� ��ƮŸ��
			case(9){itemString = `id:15061`; iCumRate += 1;} //0.030931024//0.030864198 ���ṫ�� ��Ʈ�� Ʃ��
			case(10){itemString = `id:15059`; iCumRate += 1;} //0.030931024//0.030864198 ��ũ�� ��ũž �ݹ���
			case(11){itemString = `id:15124col1:ceeeff col2:002c76 col3:ff4419`; iCumRate += 1;} //0.030931024//0.030864198 �ϴû� Ŭ���� ������ ����
			case(12){itemString = `id:15065`; iCumRate += 1;} //0.030931024//0.030864198 ���� ����Ʈ ��ĿƮ
			case(13){itemString = `id:15074`; iCumRate += 1;} //0.030931024//0.030864198 ���̽� ������ ��Ʈ
			case(14){itemString = `id:18044col1:101010`; iCumRate += 1;} //0.030931024//0.030864198 ������ ���˿� ����
			case(15){itemString = `id:63034col1:c00000`; iCumRate += 1;} //0.030931024//0.030864198 ������ ���� ����
			case(16){itemString = `id:63033col1:000000`; iCumRate += 1;} //0.030931024//0.030864198 ������ ���� ����
			case(17){itemString = `id:15115`; iCumRate += 3;} //0.092793071//0.092592593 ���� �̴� ��ĿƮ
			case(18){itemString = `id:15017`; iCumRate += 3;} //0.092793071//0.092592593 ���̳��巹��
			case(19){itemString = `id:18044`; iCumRate += 3;} //0.092793071//0.092592593 ���˿� ����
			case(20){itemString = `id:16519`; iCumRate += 3;} //0.092793071//0.092592593 ��ȣȭ �尩
			case(21){itemString = `id:18046`; iCumRate += 3;} //0.092793071//0.092592593 �հ��� �Ӹ����
			case(22){itemString = `id:15124`; iCumRate += 3;} //0.092793071//0.092592593 Ŭ���� ������ ����
			case(23){itemString = `id:15060`; iCumRate += 3;} //0.092793071//0.092592593 Ŭ���� ������ ����
			case(24){itemString = `id:17041`; iCumRate += 3;} //0.092793071//0.092592593 �������� ���ú���
			case(25){itemString = `id:15064`; iCumRate += 3;} //0.092793071//0.092592593 ���̵� ���� �巹��
			case(26){itemString = `id:15070`; iCumRate += 3;} //0.092793071//0.092592593 ���̵� ���� �巹��
			case(27){itemString = `id:40095`; iCumRate += 3;} //0.092793071//0.092592593 �巡�� ���̵�
			case(28){itemString = `id:19007`; iCumRate += 3;} //0.092793071//0.092592593 �߱� ���÷� �κ�
			case(29){itemString = `id:18056`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���1 (�����Ұ�)
			case(30){itemString = `id:18057`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���2  (�����Ұ�)
			case(31){itemString = `id:18058`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���3  (�����Ұ�)
			case(32){itemString = `id:18059`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���4  (�����Ұ�)
			case(33){itemString = `id:18060`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���5  (�����Ұ�)
			case(34){itemString = `id:18061`; iCumRate += 3;} //0.092793071//0.092592593 ���� �䳢 �Ӹ���1  (�����Ұ�)
			case(35){itemString = `id:18062`; iCumRate += 3;} //0.092793071//0.092592593 ���� �䳢 �Ӹ���2  (�����Ұ�)
			case(36){itemString = `id:18063`; iCumRate += 3;} //0.092793071//0.092592593 ���� �䳢 �Ӹ���3  (�����Ұ�)
			case(37){itemString = `id:18064`; iCumRate += 3;} //0.092793071//0.092592593 ���� �䳢 �Ӹ���4  (�����Ұ�)
			case(38){itemString = `id:18065`; iCumRate += 3;} //0.092793071//0.092592593 ���� �䳢 �Ӹ���5  (�����Ұ�)
			case(39){itemString = `id:18066`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���1  (�����Ұ�)
			case(40){itemString = `id:18067`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���2  (�����Ұ�)
			case(41){itemString = `id:18068`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���3  (�����Ұ�)
			case(42){itemString = `id:18069`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���4  (�����Ұ�)
			case(43){itemString = `id:18070`; iCumRate += 3;} //0.092793071//0.092592593 �� �䳢 �Ӹ���5 (�����Ұ�)
			case(44){itemString = `id:18096`; iCumRate += 3;} //0.092793071//0.092592593 ���̷� ����� ����
			case(45){itemString = `id:18097`; iCumRate += 3;} //0.092793071//0.092592593 ���̷� ���� ����
			case(46){itemString = `id:18098`; iCumRate += 3;} //0.092793071//0.092592593 ���̷��� �Ȱ�
			case(47){itemString = `id:18099`; iCumRate += 3;} //0.092793071//0.092592593 ���̷� ���� ���� ����
			case(48){itemString = `id:18100`; iCumRate += 3;} //0.092793071//0.092592593 ���̷� ���� ����
			case(49){itemString = `id:18101`; iCumRate += 3;} //0.092793071//0.092592593 ���̷� ���� ���� ����
			case(50){itemString = `id:18102`; iCumRate += 3;} //0.092793071//0.092592593 ���̷��� ����
			case(51){itemString = `id:15055`; iCumRate += 3;} //0.092793071//0.092592593 ���� �̴� ���ǽ�
			case(52){itemString = `id:62005suffix:30501 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 ��æƮ ��ũ�� (���̾�Ʈ)
			case(53){itemString = `id:62005suffix:30302 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 ��æƮ ��ũ�� (�ں�Ʈ)
			case(54){itemString = `id:46006`; iCumRate += 3;} //0.092793071//0.092592593 ī��Ʈ �ǵ�
			case(55){itemString = `id:15053`; iCumRate += 3;} //0.092793071//0.092592593 �÷�Į�� ���ǽ�
			case(56){itemString = `id:40030`; iCumRate += 3;} //0.092793071//0.092592593 �� �ڵ�� �ҵ�
			case(57){itemString = `id:17045`; iCumRate += 3;} //0.092793071//0.092592593 ���� �� ���� ���� ����
			case(58){itemString = `id:14004`; iCumRate += 3;} //0.092793071//0.092592593 Ŭ�ν� ����
			case(59){itemString = `id:17040`; iCumRate += 3;} //0.092793071//0.092592593 ���� ��Ʈ�� ����
			case(60){itemString = `id:18516`; iCumRate += 3;} //0.092793071//0.092592593 �̺� ���� ũ���
			case(61){itemString = `id:18521`; iCumRate += 3;} //0.092793071//0.092592593 �����Ǿ� ����
			case(62){itemString = `id:15136`; iCumRate += 3;} //0.092793071//0.092592593 ��� ���̽� ��ĿƮ
			case(63){itemString = `id:18525`; iCumRate += 3;} //0.092793071//0.092592593 ���͵�� ĸ
			case(64){itemString = `id:18511`; iCumRate += 3;} //0.092793071//0.092592593 �÷�Ʈ Ǯ �︧
			case(65){itemString = `id:18506`; iCumRate += 3;} //0.092793071//0.092592593 �� ���� �︧
			case(66){itemString = `id:17505`; iCumRate += 3;} //0.092793071//0.092592593 �÷���Ʈ ����
			case(67){itemString = `id:16505`; iCumRate += 3;} //0.092793071//0.092592593 �÷���Ʈ ����
			case(68){itemString = `id:18502`; iCumRate += 3;} //0.092793071//0.092592593 �� �︧
			case(69){itemString = `id:15014`; iCumRate += 3;} //0.092793071//0.092592593 �Ĺ߲��� ��
			case(70){itemString = `id:18113`; iCumRate += 3;} //0.092793071//0.092592593 ������ ����� ����
			case(71){itemString = `id:18114`; iCumRate += 3;} //0.092793071//0.092592593 �ٹ��� ����� ����
			case(72){itemString = `id:18115`; iCumRate += 3;} //0.092793071//0.092592593 �� ����� ����
			case(73){itemString = `id:62005suffix:30702 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 ��æƮ ��ũ�� (���̺�)
			case(74){itemString = `id:62005prefix:207 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 ��æƮ ��ũ�� (����
			case(75){itemString = `id:16517`; iCumRate += 24;} //0.742344572//0.740740741 �ݴ� �尩
			case(76){itemString = `id:16516`; iCumRate += 24;} //0.742344572//0.740740741 ���� �尩
			case(77){itemString = `id:16515`; iCumRate += 24;} //0.742344572//0.740740741 �� �尩
			case(78){itemString = `id:16514`; iCumRate += 24;} //0.742344572//0.740740741 ���� �尩
			case(79){itemString = `id:16513`; iCumRate += 24;} //0.742344572//0.740740741 ���� �尩
			case(80){itemString = `id:40068`; iCumRate += 24;} //0.742344572//0.740740741 ���� ��� ���ú�
			case(81){itemString = `id:40069`; iCumRate += 24;} //0.742344572//0.740740741 ���� ��� ���ú�
			case(82){itemString = `id:40070`; iCumRate += 24;} //0.742344572//0.740740741 �� ��� ���ú�
			case(83){itemString = `id:18112`; iCumRate += 24;} //0.742344572//0.740740741 �¾� ����
			case(84){itemString = `id:18111`; iCumRate += 24;} //0.742344572//0.740740741 ���� ����
			case(85){itemString = `id:18110`; iCumRate += 24;} //0.742344572//0.740740741 ���� ����
			case(86){itemString = `id:18109`; iCumRate += 24;} //0.742344572//0.740740741 ���� �� ����
			case(87){itemString = `id:18108`; iCumRate += 24;} //0.742344572//0.740740741 ���� ����
			case(88){itemString = `id:18029`; iCumRate += 24;} //0.742344572//0.740740741 ������ �Ȱ�
			case(89){itemString = `id:18028`; iCumRate += 24;} //0.742344572//0.740740741 ���̽� �Ȱ�
			case(90){itemString = `id:19008`; iCumRate += 24;} //0.742344572//0.740740741 ���� �Ǵ� �κ�
			case(91){itemString = `id:19009`; iCumRate += 24;} //0.742344572//0.740740741 ���� ���� �κ�
			case(92){itemString = `id:19017`; iCumRate += 24;} //0.742344572//0.740740741 ���� ���� �κ�
			case(93){itemString = `id:19016`; iCumRate += 24;} //0.742344572//0.740740741 �� �κ�
			case(94){itemString = `id:40038`; iCumRate += 24;} //0.742344572//0.740740741 ����Ʈ�� ����
			case(95){itemString = `id:40039`; iCumRate += 24;} //0.742344572//0.740740741 ���̽� ����
			case(96){itemString = `id:40040`; iCumRate += 24;} //0.742344572//0.740740741 ���̾� ����
			case(97){itemString = `id:40041`; iCumRate += 24;} //0.742344572//0.740740741 Ÿ�ݿ� ����
			case(98){itemString = `id:40090`; iCumRate += 24;} //0.742344572//0.740740741 ���� ����
			case(99){itemString = `id:40053`; iCumRate += 24;} //0.742344572//0.740740741 ����� ��� �ɴٹ�
			case(100){itemString = `id:40051`; iCumRate += 24;} //0.742344572//0.740740741 ����� ��� �Ѽ���
			case(101){itemString = `id:18089`; iCumRate += 24;} //0.742344572//0.740740741 ����� ��� ���
			case(102){itemString = `id:40054`; iCumRate += 24;} //0.742344572//0.740740741 �Ķ� ��� �ɴٹ�
			case(103){itemString = `id:40052`; iCumRate += 24;} //0.742344572//0.740740741 �Ķ� ��� �Ѽ���
			case(104){itemString = `manual:16500`; iCumRate += 24;} //0.742344572//0.740740741 �ﳪ �������� �۷���
			case(105){itemString = `manual:40056`; iCumRate += 24;} //0.742344572//0.740740741 X ǥ����
			case(106){itemString = `manual:18542`; iCumRate += 24;} //0.742344572//0.740740741 �� ü�� Ǯ �︧
			case(107){itemString = `manual:18543`; iCumRate += 24;} //0.742344572//0.740740741 ���� Ǯ �︧
			case(108){itemString = `manual:18544`; iCumRate += 24;} //0.742344572//0.740740741 �縮ĭ ��������
			case(109){itemString = `manual:18547`; iCumRate += 24;} //0.742344572//0.740740741 �ĳ��� ��� ��������
			case(110){itemString = `manual:19020`; iCumRate += 24;} //0.742344572//0.740740741 ��Ÿ�� ����� ��Ʈ
			case(111){itemString = `manual:62005prefix:7 expire:960`; iCumRate += 24;} //0.742344572//0.740740741 ��æƮ ��ũ�� (���� ���ͣ�
			case(112){itemString = `manual:16520`; iCumRate += 24;} //0.742344572//0.740740741 �� ���� �۷���
			case(113){itemString = `manual:15128`; iCumRate += 24;} //0.742344572//0.740740741 �� �� ���� �巹��
			case(114){itemString = `manual:16019`; iCumRate += 24;} //0.742344572//0.740740741 �ٹ��� �ȸ� �尩
			case(115){itemString = `manual:18047`; iCumRate += 24;} //0.742344572//0.740740741 �ڷ��� ��Ʈ ����
			case(116){itemString = `manual:18008`; iCumRate += 24;} //0.742344572//0.740740741 ��Ʈ������ ĸ
			case(117){itemString = `manual:15025`; iCumRate += 24;} //0.742344572//0.740740741 �����б� ���ڱ���
			case(118){itemString = `manual:18500`; iCumRate += 24;} //0.742344572//0.740740741 �� ���� �︧
			case(119){itemString = `manual:17504`; iCumRate += 24;} //0.742344572//0.740740741 �������� �÷���Ʈ ����
			case(120){itemString = `manual:18043`; iCumRate += 24;} //0.742344572//0.740740741 �ڷ��� ��Ʈ ����
			case(121){itemString = `manual:17506`; iCumRate += 24;} //0.742344572//0.740740741 �ձ׸��� ����
			case(122){itemString = `manual:18026`; iCumRate += 24;} //0.742344572//0.740740741 ��� ���θ���
			case(123){itemString = `manual:15052`; iCumRate += 24;} //0.742344572//0.740740741 ��ũ�� ���� Ʃ��
			case(124){itemString = `manual:19005`; iCumRate += 24;} //0.742344572//0.740740741 ���÷� �κ�
			case(125){itemString = `manual:18040`; iCumRate += 24;} //0.742344572//0.740740741 �ڷ��� ���� ������
			case(126){itemString = `manual:18038`; iCumRate += 24;} //0.742344572//0.740740741 ���� �跿 ����
			case(127){itemString = `manual:15042`; iCumRate += 24;} //0.742344572//0.740740741 �ճ� ���ǽ�
			case(128){itemString = `manual:46001`; iCumRate += 24;} //0.742344572//0.740740741 ���� �ǵ�
			case(129){itemString = `manual:40012`; iCumRate += 24;} //0.742344572//0.740740741 �ٽ�Ÿ�� �ҵ�
			case(130){itemString = `manual:91006expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 10���� Ű�� �Ǵ� ����
			case(131){itemString = `manual:91010expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 11���� Ű�� �Ǵ� ����
			case(132){itemString = `manual:91011expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 12���� Ű�� �Ǵ� ����
			case(133){itemString = `id:91012expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 13���� Ű�� �Ǵ� ����
			case(134){itemString = `id:91013expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 14���� Ű�� �Ǵ� ����
			case(135){itemString = `id:91014expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 15���� Ű�� �Ǵ� ����
			case(136){itemString = `id:91015expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 16���� Ű�� �Ǵ� ����
			case(137){itemString = `id:91007expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 17���� Ű�� �Ǵ� ����
			case(138){itemString = `id:63025count:3`; iCumRate += 22;} //0.680482524//0.679012346 ��뷮 �ູ�� ����
			case(139){itemString = `id:51031count:3`; iCumRate += 22;} //0.680482524//0.679012346 ���� ȸ���� ����
			case(140){itemString = `id:63026`; iCumRate += 22;} //0.680482524//0.679012346 ���� ���� �̿��
			case(141){itemString = `id:63047`; iCumRate += 22;} //0.680482524//0.679012346 ���� ������ �̿��
			case(142){itemString = `id:63043`; iCumRate += 22;} //0.680482524//0.679012346 ���꽺�� ����
			case(143){itemString = `id:63043count:3`; iCumRate += 22;} //0.680482524//0.679012346 ���꽺�� ����
			case(144){itemString = `id:63027expire:10080`; iCumRate += 22;} //0.680482524//0.679012346 �ж� ����
			case(145){itemString = `id:63029count:5`; iCumRate += 22;} //0.680482524//0.679012346 ķ�����̾�ŰƮ
			case(146){itemString = `id:63044count:3`; iCumRate += 22;} //0.680482524//0.679012346 ��Ƽ ��Ȱ�� ����
			case(147){itemString = `id:63039expire:10080`; iCumRate += 22;} //0.680482524//0.679012346 ķ�� ŰƮ
			case(148){itemString = `id:51003count:5`; iCumRate += 22;} //0.680482524//0.679012346 ����� 50 ����
			case(149){itemString = `id:51004count:3`; iCumRate += 22;} //0.680482524//0.679012346 ����� 100 ����
			case(150){itemString = `id:51007`; iCumRate += 22;} //0.680482524//0.679012346 ���� 30 ����
			case(151){itemString = `id:51008count:5`; iCumRate += 22;} //0.680482524//0.679012346 ���� 50 ����
			case(152){itemString = `id:51013count:5`; iCumRate += 22;} //0.680482524//0.679012346 ���¹̳� 50 ����
			case(153){itemString = `id:51014count:3`; iCumRate += 22;} //0.680482524//0.679012346 ���¹̳� 100 ����
			case(154){itemString = `id:51001count:5`; iCumRate += 22;} //0.680482524//0.679012346 ����� 10 ����
			case(155){itemString = `id:51002count:3`; iCumRate += 22;} //0.680482524//0.679012346 ����� 30 ����
			case(156){itemString = `id:51022count:5`; iCumRate += 22;} //0.680482524//0.679012346 ����°� ���� 30 ����
			case(157){itemString = `id:51027count:5`; iCumRate += 22;} //0.680482524//0.679012346 ����°� ���¹̳� 30 ����
			case(158){itemString = `id:51028count:3`; iCumRate += 22;} //0.680482524//0.679012346 ����°� ���¹̳� 50 ����
			case(159){itemString = `id:51029`; iCumRate += 22;} //0.680482524//0.679012346 ����°� ���¹̳� 100 ����
			case(160){itemString = `id:63000`; iCumRate += 22;} //0.680482524//0.679012346 �Ǵн��� ����
			case(161){itemString = `id:51036`; iCumRate += 22;} //0.680482524//0.679012346 ���̾�Ʈ ���� U
			case(162){itemString = `id:51038`; iCumRate += 22;} //0.680482524//0.679012346 ���̾�Ʈ ���� L
			case(163){itemString = `id:51039`; iCumRate += 22;} //0.680482524//0.679012346 ���̾�Ʈ ���� F
			case(164){itemString = `id:17006`; iCumRate += 22;} //0.680482524//0.679012346 õ�Ź�
			case(165){itemString = `id:18086`; iCumRate += 22;} //0.680482524//0.679012346 ������ �� ���
			case(166){itemString = `id:18087`; iCumRate += 22;} //0.680482524//0.679012346 ��� �� ���
			case(167){itemString = `id:18088`; iCumRate += 22;} //0.680482524//0.679012346 ȭ��
			case(168){itemString = `id:18090`; iCumRate += 22;} //0.680482524//0.679012346 �Ķ� ��� ���
			case(169){itemString = `id:40046`; iCumRate += 22;} //0.680482524//0.679012346 ��� �Ѽ���
			case(170){itemString = `id:40047`; iCumRate += 22;} //0.680482524//0.679012346 ��� �ɴٹ�
			case(171){itemString = `id:18541`; iCumRate += 22;} //0.680482524//0.679012346 ��Ӹ� ����
			case(172){itemString = `id:18103`; iCumRate += 22;} //0.680482524//0.679012346 ���� ����
			case(173){itemString = `id:40071`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(174){itemString = `id:40072`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(175){itemString = `id:40073`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(176){itemString = `id:40074`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(177){itemString = `id:40075`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(178){itemString = `id:40076`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(179){itemString = `id:40077`; iCumRate += 5;} //0.154655119//0.154320988 '��' �� �� ��
			case(180){itemString = `id:60037count:5`; iCumRate += 22;} //0.680482524//0.679012346 �� ���� ����
			case(181){itemString = `id:60038count:5`; iCumRate += 22;} //0.680482524//0.679012346 ���� ����
			case(182){itemString = `id:62004count:5`; iCumRate += 22;} //0.680482524//0.679012346 ��������
			case(183){itemString = `id:50012`; iCumRate += 22;} //0.680482524//0.679012346 Ȳ�� �ް�
			case(184){itemString = `id:50013`; iCumRate += 22;} //0.680482524//0.679012346 Ȳ�� ���
			case(185){itemString = `id:50164quality:100`; iCumRate += 22;} //0.680482524//0.679012346 T�� ������ũ 100����Ƽ
			case(186){itemString = `id:50201quality:100`; iCumRate += 22;} //0.680482524//0.679012346 BnR 100����Ƽ
			case(187){itemString = `id:50123quality:100`; iCumRate += 22;} //0.680482524//0.679012346 ���������� 100����Ƽ
			case(188){itemString = `id:50124quality:100`; iCumRate += 22;} //0.680482524//0.679012346 ���� ������ũ 100����Ƽ
			case(189){itemString = `id:50202`; iCumRate += 22;} //0.680482524//0.679012346 Ű�� �� �� ����
			case(190){itemString = `id:50203`; iCumRate += 22;} //0.680482524//0.679012346 ���� ��������
			case(191){itemString = `id:2001`; iCumRate += 22;} //0.680482524//0.679012346 ��ȭ�ָӴ�
			case(192){itemString = `id:2006`; iCumRate += 22;} //0.680482524//0.679012346 ū ��ȭ�ָӴ�
			case(193){itemString = `id:18010`; iCumRate += 22;} //0.680482524//0.679012346 ��� ����Ʈ ĸ
			case(194){itemString = `id:15131`; iCumRate += 22;} //0.680482524//0.679012346 �� �������� ��ĿƮ
			case(195){itemString = `id:40015`; iCumRate += 22;} //0.680482524//0.679012346 �÷�Ʈ �� �ҵ�
			case(196){itemString = `id:17016`; iCumRate += 22;} //0.680482524//0.679012346 �ʵ� �Ĺ��
			case(197){itemString = `id:17015`; iCumRate += 22;} //0.680482524//0.679012346 �Ĺ��
			case(198){itemString = `id:17005`; iCumRate += 22;} //0.680482524//0.679012346 ��ɲ� �Ź�
			case(199){itemString = `id:17002`; iCumRate += 22;} //0.680482524//0.679012346 �˻� �Ź�
			case(200){itemString = `id:17022`; iCumRate += 22;} //0.680482524//0.679012346 ��������
			case(201){itemString = `id:17001`; iCumRate += 22;} //0.680482524//0.679012346 ���� ����
			case(202){itemString = `id:17007`; iCumRate += 22;} //0.680482524//0.679012346 ���� ����
			case(203){itemString = `id:16009`; iCumRate += 22;} //0.680482524//0.679012346 ��ɲ��尩
			case(204){itemString = `id:40005`; iCumRate += 22;} //0.680482524//0.679012346 �� �ҵ�
			case(205){itemString = `id:15031`; iCumRate += 22;} //0.680482524//0.679012346 �����б� ����
			case(206){itemString = `id:19012`; iCumRate += 22;} //0.680482524//0.679012346 Ʈ��� ���̾�� �κ�
			case(207){itemString = `id:18004`; iCumRate += 22;} //0.680482524//0.679012346 ��� �мǸ���
			case(208){itemString = `id:15132`; iCumRate += 22;} //0.680482524//0.679012346 ���߷� ����Ʈ ����
			case(209){itemString = `id:15043`; iCumRate += 22;} //0.680482524//0.679012346 ����Ƽ ���Ʈ
			case(210){itemString = `id:40010`; iCumRate += 22;} //0.680482524//0.679012346 @�� �ҵ�
			case(211){itemString = `id:40081`; iCumRate += 22;} //0.680482524//0.679012346 @���� �� ����
			case(212){itemString = `id:40078`; iCumRate += 22;} //0.680482524//0.679012346 @����Ͻ�
			case(213){itemString = `id:40079`; iCumRate += 22;} //0.680482524//0.679012346 @���̽�
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
