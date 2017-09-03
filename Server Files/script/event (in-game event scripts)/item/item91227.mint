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
	int iRandom = Random(3139);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:40171  `; iCumRate += 1;} //0.0318572794 ���繫��
			case(1){itemString = `id:40170  `; iCumRate += 2;} //0.0637145588 �Ϻ��� ��հ�
			case(2){itemString = `id:40193  `; iCumRate += 1;} //0.0318572794 ���󸶻�
			case(3){itemString = `id:40192  `; iCumRate += 2;} //0.0637145588 �Ϻ��� �Ѽհ�
			case(4){itemString = `id:40195  `; iCumRate += 1;} //0.0318572794 ��ù���
			case(5){itemString = `id:40194  `; iCumRate += 2;} //0.0637145588 ��Ű�ڽ�(�Ϻ��� �ܰ�)
			case(6){itemString = `id:46007  col1:000000 col2:660000 col3:ffff00 `; iCumRate += 3;} //0.0955718382 ����, ����, ��� ���׷� ī��Ʈ �ǵ�
			case(7){itemString = `id:18518  col1:800000 col2:800000 col3:800000 `; iCumRate += 3;} //0.0955718382 ���� �巡�� ũ����Ʈ
			case(8){itemString = `id:40010  col1:88bbff col2:404040 col3:202020 `; iCumRate += 3;} //0.0955718382 û�� �ռҵ�
			case(9){itemString = `id:40006  col1:800010 col2:1111111 col3:1111111 `; iCumRate += 3;} //0.0955718382 ���� �ܰ�
			case(10){itemString = `id:40080  col1:800010 col2:1111111 col3:222222 `; iCumRate += 3;} //0.0955718382 ���� ��, ���� �������� �۶��콺
			case(11){itemString = `id:13038  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 ��ο� ȸ�� ����ƾ �ǹ� ����Ʈ �Ƹ�
			case(12){itemString = `id:40080  col1:ff66ff col2:404040 col3:202020 suffix:30702`; iCumRate += 3;} //0.0955718382 �����ƻ� ���̺� �۶��콺
			case(13){itemString = `id:40010  col1:290010 col2:1111111 col3:1111111 `; iCumRate += 3;} //0.0955718382 ��ο� ���� �ռҵ�
			case(14){itemString = `id:14013  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 ��ο� ȸ�� �θ�ī ���׸�ŸŸ��
			case(15){itemString = `id:13022  col1:113010 col2:113011 col3:1130111 `; iCumRate += 3;} //0.0955718382 ��� ���� �÷���Ʈ �Ƹ� (PŸ��)
			case(16){itemString = `id:16524  col1:666666 col2:222222 col3:222222 suffix:10706`; iCumRate += 3;} //0.0955718382 ��ο� ȸ�� ����ƾ �ǹ� ����Ʈ ��극�̽�
			case(17){itemString = `id:13033  suffix:30901 `; iCumRate += 3;} //0.0955718382 ������ �߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
			case(18){itemString = `id:13023  col1:ebbe21 col2:111111 col3:ebbe21 `; iCumRate += 3;} //0.0955718382 �ݻ�&������ ���� �÷���Ʈ �Ƹ� (B Ÿ��)
			case(19){itemString = `id:40095  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 ��ο� ȸ���� �巡�� �ǵ�
			case(20){itemString = `id:13046  col1:111111 col2:ebbe21  col3:111111 `; iCumRate += 3;} //0.0955718382 �ݻ�&������ �Ƹ��� �ƽ��� �Ƹ�(������)
			case(21){itemString = `id:40003  durability:11000 durability_max:11000`; iCumRate += 2;} //0.0637145588 ������
			case(22){itemString = `id:40005  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 ���ҵ�
			case(23){itemString = `id:40006  durability:13000 durability_max:13000`; iCumRate += 2;} //0.0637145588 �ܰ�
			case(24){itemString = `id:40010  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 �ռҵ�
			case(25){itemString = `id:40011  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 ��ε�ҵ�
			case(26){itemString = `id:40012  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 �ٽ�Ÿ��ҵ�
			case(27){itemString = `id:40013  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 �պ���
			case(28){itemString = `id:40014  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 ������ ����
			case(29){itemString = `id:40015  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 �÷�Ʈ ���ҵ�
			case(30){itemString = `id:40016  durability:19000 durability_max:19000`; iCumRate += 2;} //0.0637145588 �ظ�
			case(31){itemString = `id:40030  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 ���ڵ�ҵ�
			case(32){itemString = `id:40031  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 ũ�ν�����(����)
			case(33){itemString = `id:40033  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 ũ���̸��
			case(34){itemString = `id:40038  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 ����Ʈ�� ����
			case(35){itemString = `id:40039  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 ���̽� ����
			case(36){itemString = `id:40040  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 ���̾� ����
			case(37){itemString = `id:40041  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 Ÿ�ݿ� ����
			case(38){itemString = `id:40078  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 ����Ͻ�
			case(39){itemString = `id:40079  durability:19000 durability_max:19000`; iCumRate += 2;} //0.0637145588 ���̽�
			case(40){itemString = `id:40080  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 �۶��콺
			case(41){itemString = `id:40081  durability:16000 durability_max:16000`; iCumRate += 2;} //0.0637145588 ���� �� ����
			case(42){itemString = `id:40083  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 ��ĿƲ����
			case(43){itemString = `id:40090  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 ���� ����
			case(44){itemString = `id:46001  durability:14000 durability_max:14000`; iCumRate += 2;} //0.0637145588 ���� �ǵ�
			case(45){itemString = `id:46006  durability:20000 durability_max:20000`; iCumRate += 2;} //0.0637145588 ī��Ʈ�ǵ�
			case(46){itemString = `id:46008  durability:13000 durability_max:13000`; iCumRate += 2;} //0.0637145588 ����Ʈ ���׷� ī��Ʈ �ǵ�
			case(47){itemString = `id:13043  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 ���̴Ͼ� ������ ����(������)
			case(48){itemString = `id:13044  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 ���̴Ͼ� ������ ����(������)
			case(49){itemString = `id:13045  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(50){itemString = `id:13046  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(51){itemString = `id:13047  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(52){itemString = `id:13048  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(53){itemString = `id:16525  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 �Ƹ��� �ƽ��� ��Ʋ��
			case(54){itemString = `id:17518  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 �Ƹ��� �ƽ��� ����(������)
			case(55){itemString = `id:17519  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 �Ƹ��� �ƽ��� ����(������)
			case(56){itemString = `id:13035  `; iCumRate += 15;} //0.4778591908 ����Ʈ ��ī ü�θ���
			case(57){itemString = `id:13043  `; iCumRate += 15;} //0.4778591908 ���̴Ͼ� ������ ����(������)
			case(58){itemString = `id:13044  `; iCumRate += 15;} //0.4778591908 ���̴Ͼ� ������ ����(������)
			case(59){itemString = `id:13045  `; iCumRate += 15;} //0.4778591908 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(60){itemString = `id:13046  `; iCumRate += 15;} //0.4778591908 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(61){itemString = `id:13047  `; iCumRate += 15;} //0.4778591908 Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(62){itemString = `id:13048  `; iCumRate += 15;} //0.4778591908 Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(63){itemString = `id:62005  prefix:20714`; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(������)
			case(64){itemString = `id:62005  suffix:31002`; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(���)
			case(65){itemString = `id:62005  suffix:31103`; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(������ũ)
			case(66){itemString = `id:62005  prefix:8`; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(��������)
			case(67){itemString = `id:62005  suffix:30501 `; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(���̾�Ʈ)
			case(68){itemString = `id:62005  suffix:30302 `; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(�ں�Ʈ)
			case(69){itemString = `id:62005  suffix:30702 `; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(���̺�)
			case(70){itemString = `id:62005  prefix:207 `; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(����)
			case(71){itemString = `id:62005  prefix:7 `; iCumRate += 15;} //0.4778591908 ��æƮ ��ũ��(��������)
			case(72){itemString = `id:14004  `; iCumRate += 20;} //0.6371455878 ũ�ν�����
			case(73){itemString = `id:14005  `; iCumRate += 25;} //0.7964319847 ������� ��������
			case(74){itemString = `id:14006  `; iCumRate += 25;} //0.7964319847 ���� ����
			case(75){itemString = `id:14019  `; iCumRate += 25;} //0.7964319847 �׷��̽� �÷���Ʈ �Ƹ�
			case(76){itemString = `id:14023  `; iCumRate += 25;} //0.7964319847 �� ���� �Ƹ�(������)
			case(77){itemString = `id:14024  `; iCumRate += 25;} //0.7964319847 �� ���� �Ƹ�(������)
			case(78){itemString = `id:16000  `; iCumRate += 25;} //0.7964319847 ���� �۷���
			case(79){itemString = `id:16001  `; iCumRate += 25;} //0.7964319847 ���� �۷���
			case(80){itemString = `id:16002  `; iCumRate += 25;} //0.7964319847 ���� �۷���
			case(81){itemString = `id:16004  `; iCumRate += 25;} //0.7964319847 ���͵�� �극�̽���
			case(82){itemString = `id:16008  `; iCumRate += 25;} //0.7964319847 �ڷ��� ���� �۷���
			case(83){itemString = `id:16015  `; iCumRate += 25;} //0.7964319847 �극�̽���
			case(84){itemString = `id:16029  `; iCumRate += 25;} //0.7964319847 ���� ��Ƽġ �۷���
			case(85){itemString = `id:16500  `; iCumRate += 25;} //0.7964319847 �ﳪ �������� �۷���
			case(86){itemString = `id:16502  `; iCumRate += 25;} //0.7964319847 �÷���Ʈ ��Ʋ��
			case(87){itemString = `id:16505  `; iCumRate += 25;} //0.7964319847 �÷�Ʈ ��Ʋ��
			case(88){itemString = `id:16506  `; iCumRate += 25;} //0.7964319847 �� �۷���
			case(89){itemString = `id:16520  `; iCumRate += 25;} //0.7964319847 �� ���� �۷���
			case(90){itemString = `id:16523  `; iCumRate += 25;} //0.7964319847 �׷��̽� ��Ʋ��
			case(91){itemString = `id:16525  `; iCumRate += 25;} //0.7964319847 �Ƹ��� �ƽ��� ��Ʋ��
			case(92){itemString = `id:17001  `; iCumRate += 25;} //0.7964319847 ���� ����
			case(93){itemString = `id:17002  `; iCumRate += 25;} //0.7964319847 �˻� �Ź�
			case(94){itemString = `id:17003  `; iCumRate += 25;} //0.7964319847 ���� �Ź�
			case(95){itemString = `id:17004  `; iCumRate += 25;} //0.7964319847 ���� �б� �Ź�
			case(96){itemString = `id:17005  `; iCumRate += 25;} //0.7964319847 ��ɲ� �Ź�
			case(97){itemString = `id:17016  `; iCumRate += 25;} //0.7964319847 �ʵ� �Ĺ��
			case(98){itemString = `id:17017  `; iCumRate += 25;} //0.7964319847 ������Ʈ ����
			case(99){itemString = `id:17018  `; iCumRate += 25;} //0.7964319847 �˻� �Ź�
			case(100){itemString = `id:17019  `; iCumRate += 25;} //0.7964319847 �������� �Ź�
			case(101){itemString = `id:17020  `; iCumRate += 25;} //0.7964319847 ���� ����
			case(102){itemString = `id:17021  `; iCumRate += 25;} //0.7964319847 �θ�ī ����
			case(103){itemString = `id:17064  `; iCumRate += 25;} //0.7964319847 ī�� ���Ǹ�Ʈ ����
			case(104){itemString = `id:17503  `; iCumRate += 25;} //0.7964319847 �׸��� ����
			case(105){itemString = `id:17504  `; iCumRate += 25;} //0.7964319847 �������� �÷���Ʈ ����
			case(106){itemString = `id:17505  `; iCumRate += 25;} //0.7964319847 �÷���Ʈ ����
			case(107){itemString = `id:17518  `; iCumRate += 25;} //0.7964319847 �Ƹ��� �ƽ��� ����(������)
			case(108){itemString = `id:17519  `; iCumRate += 25;} //0.7964319847 �Ƹ��� �ƽ��� ����(������)
			case(109){itemString = `id:18500  `; iCumRate += 25;} //0.7964319847 �� ���� �︧
			case(110){itemString = `id:18501  `; iCumRate += 25;} //0.7964319847 ����� �︧
			case(111){itemString = `id:18502  `; iCumRate += 25;} //0.7964319847 �� �︧
			case(112){itemString = `id:18503  `; iCumRate += 25;} //0.7964319847 �����þ� �︧
			case(113){itemString = `id:18504  `; iCumRate += 25;} //0.7964319847 ũ�ν� Ǯ �︧
			case(114){itemString = `id:18505  `; iCumRate += 25;} //0.7964319847 ������ũ �︧
			case(115){itemString = `id:18506  `; iCumRate += 25;} //0.7964319847 �� ���� �︧
			case(116){itemString = `id:18509  `; iCumRate += 25;} //0.7964319847 �輭��
			case(117){itemString = `id:18511  `; iCumRate += 25;} //0.7964319847 �÷�Ʈ Ǯ �︧
			case(118){itemString = `id:18513  `; iCumRate += 25;} //0.7964319847 ������ũ ĸ
			case(119){itemString = `id:18514  `; iCumRate += 25;} //0.7964319847 �������̽� ĸ
			case(120){itemString = `id:18515  `; iCumRate += 25;} //0.7964319847 Ʈ�� ȥ ĸ
			case(121){itemString = `id:18516  `; iCumRate += 25;} //0.7964319847 �̺� ���� ũ���
			case(122){itemString = `id:18517  `; iCumRate += 25;} //0.7964319847 ���̾� ����ŷ �����
			case(123){itemString = `id:18518  `; iCumRate += 25;} //0.7964319847 �巡�� ũ����Ʈ
			case(124){itemString = `id:18519  `; iCumRate += 25;} //0.7964319847 �ĳ��� ��� ��������
			case(125){itemString = `id:18520  `; iCumRate += 25;} //0.7964319847 ��ƿ �����
			case(126){itemString = `id:18521  `; iCumRate += 25;} //0.7964319847 �����Ǿ� ����
			case(127){itemString = `id:18522  `; iCumRate += 25;} //0.7964319847 �縮ĭ ��������
			case(128){itemString = `id:18523  `; iCumRate += 25;} //0.7964319847 ���� ���� ĸ
			case(129){itemString = `id:18524  `; iCumRate += 25;} //0.7964319847 �� ���� ĸ
			case(130){itemString = `id:18525  `; iCumRate += 25;} //0.7964319847 ���͵�� ĸ
			case(131){itemString = `id:18542  `; iCumRate += 25;} //0.7964319847 �� ü�� Ǯ �︧
			case(132){itemString = `id:18543  `; iCumRate += 25;} //0.7964319847 �� ���� Ǯ �︧
			case(133){itemString = `id:18544  `; iCumRate += 25;} //0.7964319847 �� �縮ĭ ��������
			case(134){itemString = `id:18545  `; iCumRate += 25;} //0.7964319847 �׷��̽� ���
			case(135){itemString = `id:18546  `; iCumRate += 25;} //0.7964319847 �븣�� ������ ���
			case(136){itemString = `id:18547  `; iCumRate += 25;} //0.7964319847 �� �ĳ��� ��� ��������
			case(137){itemString = `id:18551  `; iCumRate += 25;} //0.7964319847 �� ���� �︧
			case(138){itemString = `id:40003  `; iCumRate += 25;} //0.7964319847 �� ����
			case(139){itemString = `id:40005  `; iCumRate += 25;} //0.7964319847 �� �ҵ�
			case(140){itemString = `id:40006  `; iCumRate += 25;} //0.7964319847 �ܰ�
			case(141){itemString = `id:40010  `; iCumRate += 25;} //0.7964319847 �� �ҵ�
			case(142){itemString = `id:40011  `; iCumRate += 25;} //0.7964319847 ��ε� �ҵ�
			case(143){itemString = `id:40012  `; iCumRate += 25;} //0.7964319847 �ٽ�Ÿ�� �ҵ�
			case(144){itemString = `id:40013  `; iCumRate += 25;} //0.7964319847 �� ����
			case(145){itemString = `id:40014  `; iCumRate += 25;} //0.7964319847 ������ ����
			case(146){itemString = `id:40015  `; iCumRate += 25;} //0.7964319847 �÷�Ʈ �� �ҵ�
			case(147){itemString = `id:40016  `; iCumRate += 25;} //0.7964319847 �ظ�
			case(148){itemString = `id:40030  `; iCumRate += 25;} //0.7964319847 �� �ڵ�� �ҵ�
			case(149){itemString = `id:40031  `; iCumRate += 25;} //0.7964319847 ����
			case(150){itemString = `id:40033  `; iCumRate += 25;} //0.7964319847 ����
			case(151){itemString = `id:40038  `; iCumRate += 25;} //0.7964319847 ����Ʈ�� ����
			case(152){itemString = `id:40039  `; iCumRate += 25;} //0.7964319847 ���̽� ����
			case(153){itemString = `id:40040  `; iCumRate += 25;} //0.7964319847 ���̾� ����
			case(154){itemString = `id:40041  `; iCumRate += 25;} //0.7964319847 Ÿ�ݿ� ����
			case(155){itemString = `id:40078  `; iCumRate += 25;} //0.7964319847 ����Ͻ�
			case(156){itemString = `id:40079  `; iCumRate += 25;} //0.7964319847 ���̽�
			case(157){itemString = `id:40080  `; iCumRate += 25;} //0.7964319847 �۶��콺
			case(158){itemString = `id:40081  `; iCumRate += 25;} //0.7964319847 ���� �� ����
			case(159){itemString = `id:40083  `; iCumRate += 25;} //0.7964319847 �� ĿƲ����
			case(160){itemString = `id:40090  `; iCumRate += 25;} //0.7964319847 ���� ����
			case(161){itemString = `id:40100  `; iCumRate += 25;} //0.7964319847 �� ���� �ҵ�
			case(162){itemString = `id:46001  `; iCumRate += 25;} //0.7964319847 ���� �ǵ�
			case(163){itemString = `id:46006  `; iCumRate += 25;} //0.7964319847 ī��Ʈ �ǵ�
			case(164){itemString = `id:46008  `; iCumRate += 25;} //0.7964319847 ����Ʈ ���׷� ī��Ʈ �ǵ�
			case(165){itemString = `id:91006  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����10
			case(166){itemString = `id:91010  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����11
			case(167){itemString = `id:91011  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����12
			case(168){itemString = `id:91012  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����13
			case(169){itemString = `id:91013  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����14
			case(170){itemString = `id:91014  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����15
			case(171){itemString = `id:91015  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����16
			case(172){itemString = `id:91007  expire:43200`; iCumRate += 20;} //0.6371455878 ü����ȭ����17
			case(173){itemString = `id:63025  count:3`; iCumRate += 45;} //1.4335775725 ��뷮 ����
			case(174){itemString = `id:51031  count:3`; iCumRate += 25;} //0.7964319847 ����ȣ������
			case(175){itemString = `id:63027  expire:10080`; iCumRate += 25;} //0.7964319847 �г� ����
			case(176){itemString = `id:51003  count:5`; iCumRate += 25;} //0.7964319847 ����� ���� 50
			case(177){itemString = `id:51004  count:3`; iCumRate += 25;} //0.7964319847 ����� ���� 100
			case(178){itemString = `id:51008  count:5`; iCumRate += 25;} //0.7964319847 ���� ���� 50
			case(179){itemString = `id:51013  count:5`; iCumRate += 25;} //0.7964319847 ���¹̳� ���� 50
			case(180){itemString = `id:51014  count:3`; iCumRate += 25;} //0.7964319847 ���¹̳� ���� 100
			case(181){itemString = `id:51022  count:5`; iCumRate += 25;} //0.7964319847 ����°� ���� 30 ����
			case(182){itemString = `id:51027  count:5`; iCumRate += 25;} //0.7964319847 ����°� ���¹̳� 30 ����
			case(183){itemString = `id:51028  count:3`; iCumRate += 25;} //0.7964319847 ����°� ���¹̳� 50 ����
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
