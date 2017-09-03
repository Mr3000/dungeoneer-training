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
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int totalRate = 2102;
	int tempRate = 0;
	int itemRate = 0;
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
			case(0){itemString = `id:18233 col1:6040FF13 col2:604011FF col3:60404503`; iCumRate += 1;} //0.0475737393 20���̸��� ���巹���������÷���
			case(1){itemString = `id:18234 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0475737393 20���� ��ۣ������÷���
			case(2){itemString = `id:16058 col1:6040FF4b col2:604013FF`; iCumRate += 1;} //0.0475737393 20�� ���� �극�̽����������÷���
			case(3){itemString = `id:18238 col1:6040FF4b`; iCumRate += 1;} //0.0475737393 20�� ���� ��ӣ������÷���
			case(4){itemString = `id:18235 col1:6040FF13 col2:604011FF col3:60404503`; iCumRate += 1;} //0.0475737393 20���̸��� ����Ʈĸ�������÷���
			case(5){itemString = `id:16057 col1:60404503 col2:604013FF`; iCumRate += 1;} //0.0475737393 20���̾� �Ƕ�� ��壨�����÷���
			case(6){itemString = `id:18237 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0475737393 20�� ��Ƽġ ����ũ�������÷���
			case(7){itemString = `id:18189 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0475737393 20ī�캸�� ���ڣ������÷���
			case(8){itemString = `id:18187 col1:6040FF13 col2:604013FF`; iCumRate += 1;} //0.0475737393 20ū �����������÷���
			case(9){itemString = `id:16046 col1:60404503`; iCumRate += 1;} //0.0475737393 20����� �� �尩�������÷���
			case(10){itemString = `id:18188 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0475737393 20�ȴ루�����÷���
			case(11){itemString = `id:18570 `; iCumRate += 2;} //0.0951474786 20��������� �Ͱ���
			case(12){itemString = `id:18571 `; iCumRate += 2;} //0.0951474786 20�� 3���� �Ͱ���type1
			case(13){itemString = `id:18572 `; iCumRate += 2;} //0.0951474786 20�� 3���� �Ͱ���type��
			case(14){itemString = `id:18573 `; iCumRate += 2;} //0.0951474786 20�� 3���� �Ͱ���type��
			case(15){itemString = `id:16059 `; iCumRate += 2;} //0.0951474786 20���
			case(16){itemString = `id:16060 `; iCumRate += 2;} //0.0951474786 20����2
			case(17){itemString = `id:46026 `; iCumRate += 2;} //0.0951474786 20�ȿ� �����ϴ� ���� ����
			case(18){itemString = `id:18574 `; iCumRate += 2;} //0.0951474786 20�հ�
			case(19){itemString = `id:18575 `; iCumRate += 2;} //0.0951474786 20���� ��Ƽ����� �ڻ���
			case(20){itemString = `id:18576 `; iCumRate += 2;} //0.0951474786 20������ ����� Ƽ�ƶ�
			case(21){itemString = `id:18233 `; iCumRate += 3;} //0.1427212179 20���̸��� ���巹��
			case(22){itemString = `id:18234 `; iCumRate += 3;} //0.1427212179 20���� ���
			case(23){itemString = `id:16058 `; iCumRate += 3;} //0.1427212179 20�� ���� �극�̽���
			case(24){itemString = `id:18238 `; iCumRate += 3;} //0.1427212179 20�� ���� ���
			case(25){itemString = `id:18235 `; iCumRate += 3;} //0.1427212179 20���̸��� ����Ʈĸ
			case(26){itemString = `id:16057 `; iCumRate += 3;} //0.1427212179 20���̾� �Ƕ�� ���
			case(27){itemString = `id:18237 `; iCumRate += 3;} //0.1427212179 20�� ��Ƽġ ����ũ
			case(28){itemString = `id:18189 `; iCumRate += 3;} //0.1427212179 20ī�캸�� ����
			case(29){itemString = `id:18187 `; iCumRate += 3;} //0.1427212179 20ū ����
			case(30){itemString = `id:16046 `; iCumRate += 3;} //0.1427212179 20����� �� �尩
			case(31){itemString = `id:18188 `; iCumRate += 3;} //0.1427212179 20�ȴ�
			case(32){itemString = `id:55000 `; iCumRate += 4;} //0.1902949572 20���� ���̽��� ��
			case(33){itemString = `id:55001 `; iCumRate += 4;} //0.1902949572 20���� ���̽��� �̻�
			case(34){itemString = `id:55002 `; iCumRate += 4;} //0.1902949572 20���� ���̽��� ����
			case(35){itemString = `id:55003 `; iCumRate += 4;} //0.1902949572 20���� ���̽��� �߱�
			case(36){itemString = `id:55005 `; iCumRate += 4;} //0.1902949572 20���� �Ͽ���� ��
			case(37){itemString = `id:55006 `; iCumRate += 4;} //0.1902949572 20���� �Ͽ���� �̻�
			case(38){itemString = `id:55007 `; iCumRate += 4;} //0.1902949572 20���� �Ͽ���� ����
			case(39){itemString = `id:55008 `; iCumRate += 4;} //0.1902949572 20���� �Ͽ���� �߸� ���
			case(40){itemString = `id:55009 `; iCumRate += 4;} //0.1902949572 20���� �Ͽ���� ����
			case(41){itemString = `id:55011 `; iCumRate += 4;} //0.1902949572 20���� ������ ��Ŭ��
			case(42){itemString = `id:55012 `; iCumRate += 4;} //0.1902949572 20���� ������ �Ӹ����
			case(43){itemString = `id:55013 `; iCumRate += 4;} //0.1902949572 20���� ������ ��
			case(44){itemString = `id:55014 `; iCumRate += 4;} //0.1902949572 20���� ������ ��� ���
			case(45){itemString = `id:55015 `; iCumRate += 4;} //0.1902949572 20���� ������ ��Ʈ
			case(46){itemString = `id:55016 `; iCumRate += 4;} //0.1902949572 20���� ������ �ո� ���
			case(47){itemString = `id:55019 `; iCumRate += 4;} //0.1902949572 20���� ������ ����
			case(48){itemString = `id:55020 `; iCumRate += 4;} //0.1902949572 20���� ������ �������
			case(49){itemString = `id:55021 `; iCumRate += 4;} //0.1902949572 20���� ������ ����
			case(50){itemString = `id:55022 `; iCumRate += 4;} //0.1902949572 20���� ������ ��
			case(51){itemString = `id:55023 `; iCumRate += 4;} //0.1902949572 20���� ������ ��
			case(52){itemString = `id:55024 `; iCumRate += 4;} //0.1902949572 20���� ������ ����
			case(53){itemString = `id:55025 `; iCumRate += 4;} //0.1902949572 20�׾Ƹ� �Ź��� �ٸ�
			case(54){itemString = `id:55026 `; iCumRate += 4;} //0.1902949572 20�׾Ƹ� �Ź��� �׾Ƹ�
			case(55){itemString = `id:55027 `; iCumRate += 4;} //0.1902949572 20�׾Ƹ� �Ź��� ��ݴ�
			case(56){itemString = `id:55028 `; iCumRate += 4;} //0.1902949572 20�׾Ƹ� �Ź��� ���Թ�
			case(57){itemString = `id:55029 `; iCumRate += 4;} //0.1902949572 20�׾Ƹ� �Ź��� �� �ָӴ�
			case(58){itemString = `id:55062 `; iCumRate += 4;} //0.1902949572 20���� �������� ��� ���
			case(59){itemString = `id:55063 `; iCumRate += 4;} //0.1902949572 20���� �������� �۷κ�
			case(60){itemString = `id:55064 `; iCumRate += 4;} //0.1902949572 20���� �������� ����
			case(61){itemString = `id:55031 `; iCumRate += 4;} //0.1902949572 20������ ���� ���̽��� ��
			case(62){itemString = `id:55032 `; iCumRate += 4;} //0.1902949572 20������ ���� ���̽��� �̻�
			case(63){itemString = `id:55033 `; iCumRate += 4;} //0.1902949572 20������ ���� ���̽��� ����
			case(64){itemString = `id:55034 `; iCumRate += 4;} //0.1902949572 20������ ���� ���̽��� �߱�
			case(65){itemString = `id:55035 `; iCumRate += 4;} //0.1902949572 20������ ���� ���̽��� ����
			case(66){itemString = `id:55036 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� ��
			case(67){itemString = `id:55037 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� �̻�
			case(68){itemString = `id:55038 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� ����
			case(69){itemString = `id:55039 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� �߸� ���
			case(70){itemString = `id:55040 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� ����
			case(71){itemString = `id:55041 `; iCumRate += 4;} //0.1902949572 20������ ���� �Ͽ���� ����
			case(72){itemString = `id:55042 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��Ŭ��
			case(73){itemString = `id:55043 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ �Ӹ����
			case(74){itemString = `id:55044 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��
			case(75){itemString = `id:55045 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��� ���
			case(76){itemString = `id:55046 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��Ʈ
			case(77){itemString = `id:55047 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ �ո� ���
			case(78){itemString = `id:55048 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ����
			case(79){itemString = `id:55049 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ����
			case(80){itemString = `id:55050 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ����
			case(81){itemString = `id:55051 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ �������
			case(82){itemString = `id:55052 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ����
			case(83){itemString = `id:55053 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��
			case(84){itemString = `id:55054 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ��
			case(85){itemString = `id:55055 `; iCumRate += 4;} //0.1902949572 20������ ���� ������ ����
			case(86){itemString = `id:55056 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� �ٸ�
			case(87){itemString = `id:55057 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� �׾Ƹ�
			case(88){itemString = `id:55058 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� ��ݴ�
			case(89){itemString = `id:55059 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� ���Թ�
			case(90){itemString = `id:55060 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� �� �ָӴ�
			case(91){itemString = `id:55061 `; iCumRate += 4;} //0.1902949572 20������ �׾Ƹ� �Ź��� ����
			case(92){itemString = `id:55065 `; iCumRate += 4;} //0.1902949572 20������ ���� �������� ��� ���
			case(93){itemString = `id:55066 `; iCumRate += 4;} //0.1902949572 20������ ���� �������� �۷κ�
			case(94){itemString = `id:55067 `; iCumRate += 4;} //0.1902949572 20������ ���� �������� ����
			case(95){itemString = `id:55068 `; iCumRate += 4;} //0.1902949572 20������ ���� �������� ����
			case(96){itemString = `id:40049 col1:0000c0`; iCumRate += 6;} //0.2854424358 20�÷�Ʈ�������÷���
			case(97){itemString = `id:40048 col1:f3f33a`; iCumRate += 6;} //0.2854424358 20�ֽ��������÷���
			case(98){itemString = `id:40018 col1:c00000 col2:000000`; iCumRate += 6;} //0.2854424358 20���𷼷��������÷���
			case(99){itemString = `id:40004 col1:45c4fa`; iCumRate += 6;} //0.2854424358 20��Ʈ�������÷���
			case(100){itemString = `id:40017  col1:000000 col2:000000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 6;} //0.2854424358 20�������������÷���
			case(101){itemString = `id:46007 col1:ffffff col2:ffffff col3:31d960`; iCumRate += 6;} //0.2854424358 20���׷� ī��Ʈ �ǵ壨�����÷���
			case(102){itemString = `id:46007  col1:181818 col2:181818 col3:583c90`; iCumRate += 6;} //0.2854424358 20���׷� ī��Ʈ �ǵ壨�����÷���
			case(103){itemString = `id:40204 `; iCumRate += 6;} //0.2854424358 20����� ���� ������
			case(104){itemString = `id:40205 `; iCumRate += 6;} //0.2854424358 20Ƽī ���� ���� ������
			case(105){itemString = `id:62005 prefix:20625`; iCumRate += 6;} //0.2854424358 20�ݼ� �ٴã�metal needle)
			case(106){itemString = `id:62005 prefix:20825`; iCumRate += 6;} //0.2854424358 20���� �ٴã�wooden needle��
			case(107){itemString = `id:62005 prefix:20915`; iCumRate += 6;} //0.2854424358 20������������cypress��
			case(108){itemString = `id:62005 prefix:20621`; iCumRate += 6;} //0.2854424358 20�̾��£�Dauntless��
			case(109){itemString = `id:15222 `; iCumRate += 6;} //0.2854424358 20�׷��̽� �� �巹��
			case(110){itemString = `id:40017 col1:86402894 col2:660000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 6;} //0.2854424358 20������ �������� ��¦�Ÿ��� �ٷ�� ���� ���ڵ� ������
			case(111){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 6;} //0.2854424358 20������ ����
			case(112){itemString = `id:40081 col1:800000 col2:ffffff`; iCumRate += 6;} //0.2854424358 20������ ����� ���� �� ����
			case(113){itemString = `id:40031 col1:eeeeee`; iCumRate += 6;} //0.2854424358 20��� ����
			case(114){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 6;} //0.2854424358 20����� ������ ����
			case(115){itemString = `id:46006 col1:eeeeee col2:660000 col3:eeeeee`; iCumRate += 6;} //0.2854424358 20������ ī��Ʈ �ǵ�
			case(116){itemString = `id:40242 col1:650000 col2:523226 col3:523226`; iCumRate += 6;} //0.2854424358 20��Ʋ�ҵ�
			case(117){itemString = `id:40011 col1:be0000 col2:101010 col3:101010`; iCumRate += 6;} //0.2854424358 20��ε�ҵ�
			case(118){itemString = `id:14013 prefix:20403 suffix:30515`; iCumRate += 6;} //0.2854424358 20�¸��� ����(��æƮ) �θ�ī ���׸�ŸŸ��
			case(119){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 6;} //0.2854424358 20������ ����(��æƮ) �׷��̽� �÷���Ʈ �Ƹ�
			case(120){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 6;} //0.2854424358 20������ ������ �߱� ���÷� �κ�
			case(121){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 6;} //0.2854424358 20��� �߱� ���÷� �κ�
			case(122){itemString = `id:19007 col1:800000 col2:ffffff col3:ffffff`; iCumRate += 6;} //0.2854424358 20������ ����� �߱� ���÷� �κ�
			case(123){itemString = `id:15135 prefix:207 suffix:10807`; iCumRate += 6;} //0.2854424358 20���� ���ô����̼� ��ũ ��Ʈ
			case(124){itemString = `id:40015 col1:3caeff col2:eeeeee col3:eeeeee`; iCumRate += 6;} //0.2854424358 20�÷�Ʈ �� �ҵ�
			case(125){itemString = `id:80007 `; iCumRate += 6;} //0.2854424358 20������ Ž�谡 ����
			case(126){itemString = `id:17073 `; iCumRate += 6;} //0.2854424358 20Ÿ�̾� �� ����
			case(127){itemString = `id:40049 col1:66ffff col2:66ffff col3:66ffff`; iCumRate += 6;} //0.2854424358 20�ٴٻ� �÷�Ʈ
			case(128){itemString = `id:80008 `; iCumRate += 6;} //0.2854424358 20������ �̸��� ĳ�־� ��
			case(129){itemString = `id:40231 `; iCumRate += 6;} //0.2854424358 20ũ����Ż ����Ʈ�� ����
			case(130){itemString = `id:40232 `; iCumRate += 6;} //0.2854424358 20ũ��� ���̽� ����
			case(131){itemString = `id:40233 `; iCumRate += 6;} //0.2854424358 20�Ǵн� ���̾� ����
			case(132){itemString = `id:40234 `; iCumRate += 6;} //0.2854424358 20Ƽī ���� ���� ����
			case(133){itemString = `id:45010 count:20`; iCumRate += 10;} //0.4757373930 20������ ȭ��
			case(134){itemString = `id:45011 count:20`; iCumRate += 10;} //0.4757373930 20���޶��� ȭ��
			case(135){itemString = `id:45012 count:20`; iCumRate += 10;} //0.4757373930 20�ڼ��� ȭ��
			case(136){itemString = `id:63072 expire:10080`; iCumRate += 10;} //0.4757373930 20���� �ж� ����
			case(137){itemString = `id:63086 expire:43200`; iCumRate += 10;} //0.4757373930 20������� ������
			case(138){itemString = `id:63087 expire:43200`; iCumRate += 10;} //0.4757373930 20������ ������
			case(139){itemString = `id:63088 expire:43200`; iCumRate += 10;} //0.4757373930 20���¹̳��� ������
			case(140){itemString = `id:63058 expire:43200`; iCumRate += 10;} //0.4757373930 20ȸ�� �ӵ� ���� ����
			case(141){itemString = `id:62005 prefix:6`; iCumRate += 10;} //0.4757373930 20������ũ����
			case(142){itemString = `id:62005 prefix:7`; iCumRate += 10;} //0.4757373930 20��������
			case(143){itemString = `id:62005 prefix:107`; iCumRate += 10;} //0.4757373930 20�������̸�
			case(144){itemString = `id:62005 prefix:20822`; iCumRate += 10;} //0.4757373930 20�����ӣ�snow drop��
			case(145){itemString = `id:62005 prefix:20622`; iCumRate += 10;} //0.4757373930 20��ȣ�ѣ�determined��
			case(146){itemString = `id:62005 prefix:20213`; iCumRate += 10;} //0.4757373930 20��Ȱ�ѣ�cheerful��
			case(147){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.4757373930 20������fox��
			case(148){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.4757373930 20���̾�Ʈ��of giant��
			case(149){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.4757373930 20���̺죨of raven��
			case(150){itemString = `id:62005 suffix:30626`; iCumRate += 10;} //0.4757373930 20�밨�ѣ�of brave��
			case(151){itemString = `id:62005 suffix:10604`; iCumRate += 10;} //0.4757373930 20����ǣ�of Farmer��
			case(152){itemString = `id:62005 suffix:11104`; iCumRate += 10;} //0.4757373930 20��ũ�Ͻ���weakness��
			case(153){itemString = `id:62005 suffix:30624`; iCumRate += 10;} //0.4757373930 20��糪����of hawthorn��
			case(154){itemString = `id:62005 suffix:30103`; iCumRate += 10;} //0.4757373930 20�ӹ���
			case(155){itemString = `id:62005 suffix:30204`; iCumRate += 10;} //0.4757373930 20������
			case(156){itemString = `id:62005 suffix:30314`; iCumRate += 10;} //0.4757373930 20�����ϴ�
			case(157){itemString = `id:62005 prefix:20503`; iCumRate += 10;} //0.4757373930 20����
			case(158){itemString = `id:62005 suffix:30615`; iCumRate += 10;} //0.4757373930 20�����
			case(159){itemString = `id:62005 suffix:30813`; iCumRate += 10;} //0.4757373930 20������
			case(160){itemString = `id:62005 suffix:30716`; iCumRate += 10;} //0.4757373930 20�����
			case(161){itemString = `id:62005 suffix:30717`; iCumRate += 10;} //0.4757373930 20����
			case(162){itemString = `id:62005 suffix:30814`; iCumRate += 10;} //0.4757373930 20������
			case(163){itemString = `id:62005 prefix:20504`; iCumRate += 10;} //0.4757373930 20�ݰ���
			case(164){itemString = `id:62005 prefix:20108`; iCumRate += 10;} //0.4757373930 20Ű��
			case(165){itemString = `id:62005 prefix:20304`; iCumRate += 10;} //0.4757373930 20Ÿ��
			case(166){itemString = `id:62005 prefix:20505`; iCumRate += 10;} //0.4757373930 20���ڵ�
			case(167){itemString = `id:62005 prefix:20508`; iCumRate += 10;} //0.4757373930 20������
			case(168){itemString = `id:62005 prefix:20618`; iCumRate += 10;} //0.4757373930 20�����̴�
			case(169){itemString = `id:62005 prefix:20718`; iCumRate += 10;} //0.4757373930 20�̻���
			case(170){itemString = `id:62005 prefix:20209`; iCumRate += 10;} //0.4757373930 20������
			case(171){itemString = `id:62005 prefix:20409`; iCumRate += 10;} //0.4757373930 20�縷����
			case(172){itemString = `id:62005 prefix:20615`; iCumRate += 10;} //0.4757373930 20�縷�Ź�
			case(173){itemString = `id:62005 prefix:20212`; iCumRate += 10;} //0.4757373930 20������
			case(174){itemString = `id:62005 prefix:20412`; iCumRate += 10;} //0.4757373930 20����
			case(175){itemString = `id:62005 prefix:20619`; iCumRate += 10;} //0.4757373930 20Ư����
			case(176){itemString = `id:62005 prefix:20110`; iCumRate += 10;} //0.4757373930 20�����
			case(177){itemString = `id:62005 prefix:20306`; iCumRate += 10;} //0.4757373930 20�ʿ���
			case(178){itemString = `id:62005 prefix:20506`; iCumRate += 10;} //0.4757373930 20�����
			case(179){itemString = `id:62005 prefix:20109`; iCumRate += 10;} //0.4757373930 20�߻���
			case(180){itemString = `id:62005 prefix:20210`; iCumRate += 10;} //0.4757373930 20�ݴް�
			case(181){itemString = `id:62005 prefix:20305`; iCumRate += 10;} //0.4757373930 20����ũ ���
			case(182){itemString = `id:62005 prefix:20211`; iCumRate += 10;} //0.4757373930 20������
			case(183){itemString = `id:62005 prefix:20410`; iCumRate += 10;} //0.4757373930 20����
			case(184){itemString = `id:62005 prefix:20616`; iCumRate += 10;} //0.4757373930 20����
			case(185){itemString = `id:62005 prefix:20411`; iCumRate += 10;} //0.4757373930 20��������
			case(186){itemString = `id:62005 prefix:20507`; iCumRate += 10;} //0.4757373930 20������
			case(187){itemString = `id:62005 prefix:20617`; iCumRate += 10;} //0.4757373930 20ȣ����
			case(188){itemString = `id:40026 prefix:20106`; iCumRate += 10;} //0.4757373930 20Ȱ���� ��
			case(189){itemString = `id:40026 prefix:20207`; iCumRate += 10;} //0.4757373930 20���ؼ��� ��
			case(190){itemString = `id:40026 prefix:20302`; iCumRate += 10;} //0.4757373930 20��ȸ���� ��
			case(191){itemString = `id:40026 prefix:20407`; iCumRate += 10;} //0.4757373930 20������ ��
			case(192){itemString = `id:46001 prefix:20212`; iCumRate += 10;} //0.4757373930 20������  ���� �ǵ�
			case(193){itemString = `id:46001 prefix:20412`; iCumRate += 10;} //0.4757373930 20����  ���� �ǵ�
			case(194){itemString = `id:46001 prefix:20619`; iCumRate += 10;} //0.4757373930 20Ư����  ���� �ǵ�
			case(195){itemString = `id:40242 `; iCumRate += 10;} //0.4757373930 20��Ʋ
			case(196){itemString = `id:40243 `; iCumRate += 10;} //0.4757373930 20��Ʋ �� �ҵ�
			case(197){itemString = `id:40235 `; iCumRate += 10;} //0.4757373930 20�ù���
			case(198){itemString = `id:40006 `; iCumRate += 10;} //0.4757373930 20�ܰ�
			case(199){itemString = `id:40005  `; iCumRate += 10;} //0.4757373930 20�� �ҵ�
			case(200){itemString = `id:40015  `; iCumRate += 10;} //0.4757373930 20�÷�Ʈ �� �ҵ�
			case(201){itemString = `id:40010  `; iCumRate += 10;} //0.4757373930 20�� �ҵ�
			case(202){itemString = `id:40011  `; iCumRate += 10;} //0.4757373930 20��ε� �ҵ�
			case(203){itemString = `id:40012  `; iCumRate += 10;} //0.4757373930 20�ٽ�Ÿ�� �ҵ�
			case(204){itemString = `id:40080  `; iCumRate += 10;} //0.4757373930 20�۶��콺
			case(205){itemString = `id:40083  `; iCumRate += 10;} //0.4757373930 20�� ĿƲ����
			case(206){itemString = `id:40030  `; iCumRate += 10;} //0.4757373930 20�� �ڵ�� �ҵ�
			case(207){itemString = `id:40033  `; iCumRate += 10;} //0.4757373930 20Ŭ���̸��
			case(208){itemString = `id:40079  `; iCumRate += 10;} //0.4757373930 20���̽�
			case(209){itemString = `id:40078  `; iCumRate += 10;} //0.4757373930 20����Ͻ�
			case(210){itemString = `id:40016  `; iCumRate += 10;} //0.4757373930 20�ظ�
			case(211){itemString = `id:40003  `; iCumRate += 10;} //0.4757373930 20�� ����
			case(212){itemString = `id:40031  `; iCumRate += 10;} //0.4757373930 20����
			case(213){itemString = `id:40014  `; iCumRate += 10;} //0.4757373930 20������ ����
			case(214){itemString = `id:40013  `; iCumRate += 10;} //0.4757373930 20�� ����
			case(215){itemString = `id:40081  `; iCumRate += 10;} //0.4757373930 20���� �� ����
			case(216){itemString = `id:40237  `; iCumRate += 10;} //0.4757373930 20���� �� ����
			case(217){itemString = `id:40236  `; iCumRate += 10;} //0.4757373930 20���� �� ����
			case(218){itemString = `id:40038  `; iCumRate += 10;} //0.4757373930 20����Ʈ�� ����
			case(219){itemString = `id:40040  `; iCumRate += 10;} //0.4757373930 20���̾� ����
			case(220){itemString = `id:40039  `; iCumRate += 10;} //0.4757373930 20���̽� ����
			case(221){itemString = `id:18503  `; iCumRate += 10;} //0.4757373930 20�����þ� �︧
			case(222){itemString = `id:18504  `; iCumRate += 10;} //0.4757373930 20ũ�ν� Ǯ �︧
			case(223){itemString = `id:18505  `; iCumRate += 10;} //0.4757373930 20������ũ �︧
			case(224){itemString = `id:18506  `; iCumRate += 10;} //0.4757373930 20�� ���� �︧
			case(225){itemString = `id:17506  `; iCumRate += 10;} //0.4757373930 20�ձ׸��� ����
			case(226){itemString = `id:17505  `; iCumRate += 10;} //0.4757373930 20�÷���Ʈ ����
			case(227){itemString = `id:16504  `; iCumRate += 10;} //0.4757373930 20ī���� ��Ʋ��
			case(228){itemString = `id:16505  `; iCumRate += 10;} //0.4757373930 20�÷�Ʈ ��Ʋ��
			case(229){itemString = `id:46001  `; iCumRate += 10;} //0.4757373930 20���� �ǵ�
			case(230){itemString = `id:15005  `; iCumRate += 10;} //0.4757373930 20���谡 ��Ʈ
			case(231){itemString = `id:14008  `; iCumRate += 10;} //0.4757373930 20Ǯ��Ʈ ���� ����
			case(232){itemString = `id:13035  `; iCumRate += 10;} //0.4757373930 20����Ʈ ��ī ü�θ���
			case(233){itemString = `id:13037  `; iCumRate += 10;} //0.4757373930 20����Ʈ ����Ʈ ü�θ���
			case(234){itemString = `id:13036  `; iCumRate += 10;} //0.4757373930 20����Ʈ ���� ����� ü�θ���
			case(235){itemString = `id:13043  `; iCumRate += 10;} //0.4757373930 20���̴Ͼ� ������ ����(������)
			case(236){itemString = `id:13044  `; iCumRate += 10;} //0.4757373930 20���̴Ͼ� ������ ����(������)
			case(237){itemString = `id:40071 `; iCumRate += 20;} //0.9514747859 20''��' �� �� ��
			case(238){itemString = `id:40072 `; iCumRate += 20;} //0.9514747859 20''��' �� �� ��
			case(239){itemString = `id:40073 `; iCumRate += 20;} //0.9514747859 20''��' �� �� ��
			case(240){itemString = `id:40074 `; iCumRate += 20;} //0.9514747859 20'��' �� �� ��
			case(241){itemString = `id:40075 `; iCumRate += 20;} //0.9514747859 20'��' �� �� ��
			case(242){itemString = `id:40076 `; iCumRate += 20;} //0.9514747859 20'��' �� �� ��
			case(243){itemString = `id:40077 `; iCumRate += 20;} //0.9514747859 20'��' �� �� ��
			case(244){itemString = `id:40097 col1:000000 col2:000000`; iCumRate += 20;} //0.9514747859 20������ L �ε�
			case(245){itemString = `id:40097 col1:800000 col2:800000`; iCumRate += 20;} //0.9514747859 20������ L �ε�
			case(246){itemString = `id:40097 col1:eeeeee col2:eeeeee`; iCumRate += 20;} //0.9514747859 20��� L �ε�
			case(247){itemString = `id:40097 col1:583c90��col2:583c90`; iCumRate += 20;} //0.9514747859 20����� L �ε�
			case(248){itemString = `id:18542 `; iCumRate += 20;} //0.9514747859 20�� ü�� Ǯ �︧
			case(249){itemString = `id:18543 `; iCumRate += 20;} //0.9514747859 20�� ���� Ǯ �︧
			case(250){itemString = `id:18544 `; iCumRate += 20;} //0.9514747859 20�� �縮ĭ ��������
			case(251){itemString = `id:18547 `; iCumRate += 20;} //0.9514747859 20�� �ĳ��� ��� ��������
			case(252){itemString = `id:63025 count:3`; iCumRate += 20;} //0.9514747859 20��뷮 �ູ�� ����
			case(253){itemString = `id:51031 count:3`; iCumRate += 20;} //0.9514747859 20���� ȸ���� ����
			case(254){itemString = `id:63027 expire:10080`; iCumRate += 20;} //0.9514747859 20�ж� ����
			case(255){itemString = `id:51003 count:5`; iCumRate += 20;} //0.9514747859 20�����50
			case(256){itemString = `id:51004 count:3`; iCumRate += 20;} //0.9514747859 20�����100
			case(257){itemString = `id:51008 count:5`; iCumRate += 20;} //0.9514747859 20��������50
			case(258){itemString = `id:51013 count:5`; iCumRate += 20;} //0.9514747859 20���׹̳�����50
			case(259){itemString = `id:51014 count:3`; iCumRate += 20;} //0.9514747859 20���׹̳�����100
			case(260){itemString = `id:51022 count:5`; iCumRate += 20;} //0.9514747859 20����°� ���� 30
			case(261){itemString = `id:51027 count:5`; iCumRate += 20;} //0.9514747859 20����°� ���¹̳�30
			case(262){itemString = `id:51028 count:3`; iCumRate += 20;} //0.9514747859 20����°� ���¹̳�50
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
//			if (IsCurrentEvent(`GachaphonSecretShop2008_taiwan`) || (IsEnable(`featureSecretShopTaiwan`) extern (`data/script/features.mint`)))
//			{
//				itemRate = ((iCumRate - tempRate)*10000) / totalRate;
//				DebugOut(`Item Rate : ` + ToString(itemRate));
//				GiveGachaphonCoupon3(player,itemRate) extern (`data/script/event/useitem_event.mint`);
//			}
			return;
		}
		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
