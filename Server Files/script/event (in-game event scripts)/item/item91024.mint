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
	//���� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(2632);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();
	meta_array itemArray;
	bool bCashGachaphonGived = false;

	while(true)
	{
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){iCumRate += 2;} //0.0754147813 �ְ�� �ʰ�    * 3
			case(1){iCumRate += 2;} //0.0754147813 �ְ�� ����    * 3
			case(2){iCumRate += 2;} //0.0754147813 �ְ�� ��ũ    * 3
			case(3){iCumRate += 2;} //0.0754147813 ���� �ǹ�ġ    * 20
			case(4){iCumRate += 2;} //0.0754147813 ���� �ǹ�ġ   * 20
			case(5){iCumRate += 2;} //0.0754147813 �ݱ�   * 3
			case(6){iCumRate += 2;} //0.0754147813 ����   * 3
			case(7){iCumRate += 2;} //0.0754147813 ����   * 3
			case(8){iCumRate += 2;} //0.0754147813 ö��   * 3
			case(9){iCumRate += 2;} //0.0754147813 ��� ����   * 5
			case(10){iCumRate += 2;} //0.0754147813 ��� ��ũ   * 5
			case(11){iCumRate += 2;} //0.0754147813 ��� �ʰ�   * 5z
			case(12){iCumRate += 2;} //0.0754147813 �̽������� *5
			case(13){iCumRate += 2;} //0.0754147813 �ݱ��� *5
			case(14){iCumRate += 2;} //0.0754147813 ������ *5
			case(15){iCumRate += 2;} //0.0754147813 ö���� *5
			case(16){iCumRate += 2;} //0.0754147813 ������*5
			case(17){iCumRate += 2;} //0.0754147813 ���� �ָӴ� *5
			case(18){iCumRate += 2;} //0.0754147813 �ѱ� ��� �巹�� ��Ÿ�� (������)
			case(19){iCumRate += 2;} //0.0754147813 �ѱ� ��� �巹�� ��ƮŸ�� (������)
			case(20){iCumRate += 2;} //0.0754147813 �ѱ� ��� �巹�� (������)
			case(21){iCumRate += 2;} //0.0754147813 �Ϻ��� ��հ� (����)
			case(22){iCumRate += 2;} //0.0754147813 �Ϻ��� �Ѽհ� (����)
			case(23){iCumRate += 2;} //0.0754147813 �Ϻ��� �ܰ� (����)
			case(24){iCumRate += 10;} //0.3770739065 �ְ�� �ʰ�
			case(25){iCumRate += 10;} //0.3770739065 �ְ�� ����
			case(26){iCumRate += 10;} //0.3770739065 �ְ�� ��ũ
			case(27){iCumRate += 10;} //0.3770739065 �ְ�� ���ײ�
			case(28){iCumRate += 10;} //0.3770739065 �ְ�� ������ ��
			case(29){iCumRate += 10;} //0.3770739065 �̽�����
			case(30){iCumRate += 10;} //0.3770739065 �ݱ�
			case(31){iCumRate += 10;} //0.3770739065 ����
			case(32){iCumRate += 10;} //0.3770739065 ���Ȱ� ���
			case(33){iCumRate += 10;} //0.3770739065 ���� �� ��
			case(34){iCumRate += 10;} //0.3770739065 ���� �� ��
			case(35){iCumRate += 4;} //0.1508295626 �������� ���ǽ�
			case(36){iCumRate += 4;} //0.1508295626 ��ũ ���� �丮���
			case(37){iCumRate += 4;} //0.1508295626 ��ũ ���� �丮���
			case(38){iCumRate += 4;} //0.1508295626 Ƽ���� �Ƹ�(������)
			case(39){iCumRate += 4;} //0.1508295626 Ƽ���� �Ƹ�(������)
			case(40){iCumRate += 4;} //0.1508295626 ���� ����Ʈ ��ĿƮ
			case(41){iCumRate += 4;} //0.1508295626 ���� �ָӴ�(���� Į��
			case(42){iCumRate += 4;} //0.1508295626 �˻��б� ���� ��ƮŸ��(������)
			case(43){iCumRate += 4;} //0.1508295626 �߽� �丮�� ����
			case(44){iCumRate += 4;} //0.1508295626 ���� �丮�� ����
			case(45){iCumRate += 4;} //0.1508295626 ���� ����Ʈ ��ĿƮ���ʺ���
			case(46){iCumRate += 4;} //0.1508295626 �˻��б� ���� ��Ÿ��(������)
			case(47){iCumRate += 4;} //0.1508295626 ����ƾ �ǹ� ����Ʈ �Ƹ�
			case(48){iCumRate += 4;} //0.1508295626 �˻��б� ���� ��ƮŸ�� (�ʺ�)
			case(49){iCumRate += 4;} //0.1508295626 ������ ���� ����
			case(50){iCumRate += 4;} //0.1508295626 ������ ���� ����
			case(51){iCumRate += 10;} //0.3770739065 ���� (��þƮ�� ����)
			case(52){iCumRate += 10;} //0.3770739065 ����Ĺ ���ġ (��æƮ�� ����)
			case(53){iCumRate += 10;} //0.3770739065 �巹�� ���̵� (���� Į��)
			case(54){iCumRate += 20;} //0.7541478130 �̽��� ����
			case(55){iCumRate += 20;} //0.7541478130 �ְ�� �ʰ�
			case(56){iCumRate += 20;} //0.7541478130 �ְ�� ����
			case(57){iCumRate += 20;} //0.7541478130 �ְ�� ��ũ
			case(58){iCumRate += 20;} //0.7541478130 �ְ�� ���ײ�
			case(59){iCumRate += 20;} //0.7541478130 �ְ�� ������ ��
			case(60){iCumRate += 20;} //0.7541478130 ���Ȱ� ���
			case(61){iCumRate += 20;} //0.7541478130 ���� �� ��
			case(62){iCumRate += 20;} //0.7541478130 ���� �� ��
			case(63){iCumRate += 20;} //0.7541478130 �ݱ���
			case(64){iCumRate += 20;} //0.7541478130 ������
			case(65){iCumRate += 20;} //0.7541478130 ��� �ʰ�
			case(66){iCumRate += 20;} //0.7541478130 ��� ����
			case(67){iCumRate += 20;} //0.7541478130 ��� ��ũ
			case(68){iCumRate += 20;} //0.7541478130 ��� ���ײ�
			case(69){iCumRate += 20;} //0.7541478130 ��� ������ ��
			case(70){iCumRate += 10;} //0.3770739065 ����
			case(71){iCumRate += 10;} //0.3770739065 ö��
			case(72){iCumRate += 10;} //0.3770739065 �÷�Ʈ �� �ҵ� (����)
			case(73){iCumRate += 10;} //0.3770739065 ���׷� ī��Ʈ �ǵ� (����)
			case(74){iCumRate += 10;} //0.3770739065 �������ֿ� �������� �Ź�(������) (�ʺ�)
			case(75){iCumRate += 10;} //0.3770739065 �������ֿ� �������� �Ź�(������) (�ʺ�)
			case(76){iCumRate += 10;} //0.3770739065 Ű�� �ܿ� õ���� �尩 (�ʺ�)
			case(77){iCumRate += 10;} //0.3770739065 Ű�� �ܿ� õ���� ���� (�ʺ�)
			case(78){iCumRate += 10;} //0.3770739065 Ű�� �ܿ� õ���� ���� (�ʺ�)
			case(79){iCumRate += 10;} //0.3770739065 �� ���� �Ƹ� (������)
			case(80){iCumRate += 10;} //0.3770739065 �� ���� �Ƹ� (������)
			case(81){iCumRate += 10;} //0.3770739065 �۶��콺 (���� Į��)
			case(82){iCumRate += 10;} //0.3770739065 �������ֿ� ��������(������) (�ʺ�)
			case(83){iCumRate += 10;} //0.3770739065 �������ֿ� ��������(������) (�ʺ�)
			case(84){iCumRate += 10;} //0.3770739065 Ű�� �ܿ� õ���� ��Ʈ(������) (�ʺ�)
			case(85){iCumRate += 10;} //0.3770739065 Ű�� �ܿ� õ���� ��Ʈ(������) (�ʺ�)
			case(86){iCumRate += 10;} //0.3770739065 �� �ڵ�� �ҵ� (���� Į��)
			case(87){iCumRate += 10;} //0.3770739065 ����Ͻ� (���� Į��)
			case(88){iCumRate += 10;} //0.3770739065 ���̽� (���� Į��)
			case(89){iCumRate += 10;} //0.3770739065 ���� ��Ʈ�� ����
			case(90){iCumRate += 10;} //0.3770739065 ���� ���� ĸ
			case(91){iCumRate += 10;} //0.3770739065 �� ĿƲ����
			case(92){iCumRate += 10;} //0.3770739065 ���� ���� ���� ����
			case(93){iCumRate += 10;} //0.3770739065 �� ���� �Ƹ� (������) (�ʺ�)
			case(94){iCumRate += 10;} //0.3770739065 �� ���� �Ƹ� (������) (�ʺ�)
			case(95){iCumRate += 10;} //0.3770739065 �ڷ��� ťƮ ���� ����
			case(96){iCumRate += 10;} //0.3770739065 �巡�� ũ����Ʈ
			case(97){iCumRate += 10;} //0.3770739065 ���̷� ����� ����
			case(98){iCumRate += 10;} //0.3770739065 ���̷� ���� ����
			case(99){iCumRate += 10;} //0.3770739065 ���̷��� �Ȱ�
			case(100){iCumRate += 10;} //0.3770739065 ���̷� ���� ���� ����
			case(101){iCumRate += 10;} //0.3770739065 ���̷� ���� ����
			case(102){iCumRate += 10;} //0.3770739065 ���̷� ���� ���� ����
			case(103){iCumRate += 10;} //0.3770739065 ���̷��� ����
			case(104){iCumRate += 10;} //0.3770739065 �����Ǿ� ����
			case(105){iCumRate += 10;} //0.3770739065 ���͵�� ĸ
			case(106){iCumRate += 10;} //0.3770739065 �÷�Ʈ Ǯ �︧
			case(107){iCumRate += 10;} //0.3770739065 �� ���� �︧
			case(108){iCumRate += 10;} //0.3770739065 �÷���Ʈ ����
			case(109){iCumRate += 10;} //0.3770739065 �÷�Ʈ ��Ʋ��
			case(110){iCumRate += 10;} //0.3770739065 �׷��̽� �÷���Ʈ �Ƹ�
			case(111){iCumRate += 10;} //0.3770739065 �Ƹ��� �ƽ��� �Ƹ� (������)
			case(112){iCumRate += 10;} //0.3770739065 �˻��б� ���� ��Ÿ�� (�ʺ�)
			case(113){iCumRate += 10;} //0.3770739065 �� ü�� Ǯ �︧
			case(114){iCumRate += 10;} //0.3770739065 ī�� ���Ǹ�Ʈ ����
			case(115){iCumRate += 10;} //0.3770739065 ����ƾ �ǹ� ����Ʈ ��극�̽� (����)
			case(116){iCumRate += 10;} //0.3770739065 �Ƹ��� �ƽ��� �Ƹ�(������)
			case(117){iCumRate += 10;} //0.3770739065 �� ���� Ǯ �︧
			case(118){iCumRate += 10;} //0.3770739065 �� �縮ĭ ��������
			case(119){iCumRate += 10;} //0.3770739065 �� �ĳ��� ��� ��������
			case(120){iCumRate += 10;} //0.3770739065 �׷��̽� ��Ʋ��
			case(121){iCumRate += 10;} //0.3770739065 �̺� ���� ũ��� (����)
			case(122){iCumRate += 10;} //0.3770739065 �巡�� ũ����Ʈ (����)
			case(123){iCumRate += 10;} //0.3770739065 �÷���Ʈ ��Ʋ�� (����)
			case(124){iCumRate += 10;} //0.3770739065 ���̾� ����ŷ ����� (����)
			case(125){iCumRate += 20;} //0.7541478130 ���� �κ�
			case(126){iCumRate += 20;} //0.7541478130 �� �κ�
			case(127){iCumRate += 20;} //0.7541478130 �� ���� �ҵ�
			case(128){iCumRate += 20;} //0.7541478130 �ٽ�Ÿ�� �ҵ� (���� Į��)
			case(129){iCumRate += 20;} //0.7541478130 ������ ��ũ���� �尩
			case(130){iCumRate += 20;} //0.7541478130 �Ϲ� ��ũ���� �尩
			case(131){iCumRate += 20;} //0.7541478130 �������� ��ũ���� �尩
			case(132){iCumRate += 20;} //0.7541478130 �ְ�� ��ũ���� �尩
			case(133){iCumRate += 20;} //0.7541478130 ��� ��ũ���� �尩
			case(134){iCumRate += 20;} //0.7541478130 �ְ�� �ʰ����� �尩
			case(135){iCumRate += 20;} //0.7541478130 ��� �ʰ����� �尩
			case(136){iCumRate += 20;} //0.7541478130 ���� ���� �κ�
			case(137){iCumRate += 20;} //0.7541478130 ��Ÿ�� ����� ��Ʈ
			case(138){iCumRate += 20;} //0.7541478130 �� �ҵ�
			case(139){iCumRate += 20;} //0.7541478130 �����þ� �︧ (����)
			case(140){iCumRate += 20;} //0.7541478130 ���� ȸ���� ����
			case(141){iCumRate += 20;} //0.7541478130 ���� ����
			case(142){iCumRate += 20;} //0.7541478130 ���� �ǵ� (����)
			case(143){iCumRate += 20;} //0.7541478130 ä���� ���� (���� Į��)
			case(144){iCumRate += 20;} //0.7541478130 ä���� �ܰ� (���� Į��)
			case(145){iCumRate += 20;} //0.7541478130 �������� ��ġ (���� Į��)
			case(146){iCumRate += 20;} //0.7541478130 ��� (���� Į��)
			case(147){iCumRate += 20;} //0.7541478130 ��Į (���� Į��)
			case(148){iCumRate += 20;} //0.7541478130 �� (���� Į��)
			case(149){iCumRate += 20;} //0.7541478130 ȣ�� (���� Į��)
			case(150){iCumRate += 20;} //0.7541478130 ���˴� (���� Į��)
			case(151){iCumRate += 20;} //0.7541478130 ���׿� �д� (���� Į��)
			case(152){iCumRate += 20;} //0.7541478130 �ٿ뵵 ���� (���� Į��)
			case(153){iCumRate += 20;} //0.7541478130 ���� (���� Į��)
			case(154){iCumRate += 20;} //0.7541478130 ���� ���̺� (���� Į��)
			case(155){iCumRate += 20;} //0.7541478130 �� �ҵ� (����)
			case(156){iCumRate += 20;} //0.7541478130 �ູ�� ����
			case(157){iCumRate += 20;} //0.7541478130 ���� ������ �̿��
			case(158){iCumRate += 20;} //0.7541478130 ���� �ָӴ�
			case(159){iCumRate += 20;} //0.7541478130 ȣ�� (����)
			case(160){iCumRate += 20;} //0.7541478130 ķ�����̾� ŰƮ
			case(161){iCumRate += 20;} //0.7541478130 ��뷮 �ູ�� ����
			case(162){iCumRate += 20;} //0.7541478130 ���¹̳� 50 ����
			case(163){iCumRate += 20;} //0.7541478130 �ܰ� (����)
			case(164){iCumRate += 20;} //0.7541478130 ��� (����)
			case(165){iCumRate += 20;} //0.7541478130 ����°� ���� 30 ����
			case(166){iCumRate += 20;} //0.7541478130 ����°� ���¹̳� 30 ����
			case(167){iCumRate += 20;} //0.7541478130 ����°� ���¹̳� 50 ����
			case(168){iCumRate += 20;} //0.7541478130 ���¹̳� 100 ����
			case(169){iCumRate += 20;} //0.7541478130 ��� �κ� (�ʺ�)
			case(170){iCumRate += 20;} //0.7541478130 �ڷ��� �����巹�� (�ʺ�)
			case(171){iCumRate += 20;} //0.7541478130 �����б� ���� (������) (�ʺ�)
			case(172){iCumRate += 20;} //0.7541478130 �����б� ���� (������) (�ʺ�)
			case(173){iCumRate += 20;} //0.7541478130 �ڷ��� ���� �۷��� (�ʺ�)
			case(174){iCumRate += 20;} //0.7541478130 ��� ���� (�ʺ�)
			case(175){iCumRate += 50;} //1.8853695324 ö����
			case(176){iCumRate += 50;} //1.8853695324 ������
			case(177){iCumRate += 50;} //1.8853695324 �Ϲ� ��ũ
			case(178){iCumRate += 50;} //1.8853695324 �Ϲ� ������ ��
			case(179){iCumRate += 50;} //1.8853695324 �Ϲ� �ʰ�
			case(180){iCumRate += 50;} //1.8853695324 �Ϲ� ����
			case(181){iCumRate += 50;} //1.8853695324 �Ϲ� ���ײ�
			case(182){iCumRate += 50;} //1.8853695324 ���� �ǹ�ġ
			case(183){iCumRate += 50;} //1.8853695324 ���� �ǹ�ġ
			case(184){iCumRate += 20;} //0.7541478130 �� �ҵ� (����)
			case(185){iCumRate += 20;} //0.7541478130 ������ũ ĸ (����)
			case(186){iCumRate += 20;} //0.7541478130 �Ӹ��� (�ʺ�)
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //�ְ�� �ʰ�    * 3
				case(1){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //�ְ�� ����    * 3
				case(2){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //�ְ�� ��ũ    * 3
				case(3){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //���� �ǹ�ġ    * 20
				case(4){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //���� �ǹ�ġ   * 20
				case(5){itemString = `id:64007 count:20`;itemArray.Add(itemString);} //�ݱ�   * 3
				case(6){itemString = `id:64005 count:20`;itemArray.Add(itemString);} //����   * 3
				case(7){itemString = `id:64003 count:20`;itemArray.Add(itemString);} //����   * 3
				case(8){itemString = `id:64001 count:20`;itemArray.Add(itemString);} //ö��   * 3
				case(9){itemString = `id:60025 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //��� ����   * 5
				case(10){itemString = `id:60013 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //��� ��ũ   * 5
				case(11){itemString = `id:60021 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //��� �ʰ�   * 5
				case(12){itemString = `id:64010 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //�̽������� *5
				case(13){itemString = `id:64008 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //�ݱ��� *5
				case(14){itemString = `id:64006 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //������ *5
				case(15){itemString = `id:64002 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //ö���� *5
				case(16){itemString = `id:64004 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //������ *5
				case(17){itemString = `id:2028 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //���� �ָӴ� *5
				case(18){itemString = `id:15233`;itemArray.Add(itemString);} //�ѱ� ��� �巹�� ��Ÿ�� (������)
				case(19){itemString = `id:15235`;itemArray.Add(itemString);} //�ѱ� ��� �巹�� ��ƮŸ�� (������)
				case(20){itemString = `id:15234`;itemArray.Add(itemString);} //�ѱ� ��� �巹�� (������)
				case(21){itemString = `manual:20177`;itemArray.Add(itemString);} //�Ϻ��� ��հ� (����)
				case(22){itemString = `manual:20188`;itemArray.Add(itemString);} //�Ϻ��� �Ѽհ� (����)
				case(23){itemString = `manual:20189`;itemArray.Add(itemString);} //�Ϻ��� �ܰ� (����)
				case(24){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //�ְ�� �ʰ�
				case(25){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //�ְ�� ����
				case(26){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //�ְ�� ��ũ
				case(27){itemString = `id:60030 count:10`;itemArray.Add(itemString);} //�ְ�� ���ײ�
				case(28){itemString = `id:60018 count:10`;itemArray.Add(itemString);} //�ְ�� ������ ��
				case(29){itemString = `id:64009 count:10`;itemArray.Add(itemString);} //�̽�����
				case(30){itemString = `id:64007 count:10`;itemArray.Add(itemString);} //�ݱ�
				case(31){itemString = `id:64005 count:10`;itemArray.Add(itemString);} //����
				case(32){itemString = `id:60043 count:10`;itemArray.Add(itemString);} //���Ȱ� ���
				case(33){itemString = `id:60041 count:10`;itemArray.Add(itemString);} //���� �� ��
				case(34){itemString = `id:60042 count:10`;itemArray.Add(itemString);} //���� �� ��
				case(35){itemString = `id:15217`;itemArray.Add(itemString);} //�������� ���ǽ�
				case(36){itemString = `id:15076`;itemArray.Add(itemString);} //��ũ ���� �丮���
				case(37){itemString = `id:15077`;itemArray.Add(itemString);} //��ũ ���� �丮���
				case(38){itemString = `id:14037 col1:ffc0f0 col2:ffc0f0 col3:ffc0f0`;itemArray.Add(itemString);} //Ƽ���� �Ƹ�(������)
				case(39){itemString = `id:14036 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //Ƽ���� �Ƹ�(������)
				case(40){itemString = `id:15065`;itemArray.Add(itemString);} //���� ����Ʈ ��ĿƮ
				case(41){itemString = `id:2028 col1:8f50eee9`;itemArray.Add(itemString);} //���� �ָӴ�(���� Į��
				case(42){itemString = `id:15113`;itemArray.Add(itemString);} //�˻��б� ���� ��ƮŸ��(������)
				case(43){itemString = `id:18053`;itemArray.Add(itemString);} //�߽� �丮�� ����
				case(44){itemString = `id:18054`;itemArray.Add(itemString);} //���� �丮�� ����
				case(45){itemString = `manual:125`;itemArray.Add(itemString);} //���� ����Ʈ ��ĿƮ���ʺ���
				case(46){itemString = `id:15114`;itemArray.Add(itemString);} //�˻��б� ���� ��Ÿ��(������)
				case(47){itemString = `id:13038`;itemArray.Add(itemString);} //����ƾ �ǹ� ����Ʈ �Ƹ�
				case(48){itemString = `manual:143`;itemArray.Add(itemString);} //�˻��б� ���� ��ƮŸ�� (�ʺ�)
				case(49){itemString = `id:63034 count:20 col1:c00000`;itemArray.Add(itemString);} //������ ���� ����
				case(50){itemString = `id:63033 col1:000000`;itemArray.Add(itemString);} //������ ���� ����
				case(51){itemString = `id:12006 prefix:20610 suffix:30510`;itemArray.Add(itemString);} //���� (��þƮ�� ����)
				case(52){itemString = `id:12007 prefix:20710 suffix:31010`;itemArray.Add(itemString);} //����Ĺ ���ġ (��æƮ�� ����)
				case(53){itemString = `id:40095 col1:c0c000 col2:c0c000 col3:c0c000`;itemArray.Add(itemString);} //�巹�� ���̵� (���� Į��)
				case(54){itemString = `id:64010 count:5`;itemArray.Add(itemString);} //�̽��� ����
				case(55){itemString = `id:60022 count:5`;itemArray.Add(itemString);} //�ְ�� �ʰ�
				case(56){itemString = `id:60026 count:5`;itemArray.Add(itemString);} //�ְ�� ����
				case(57){itemString = `id:60014 count:5`;itemArray.Add(itemString);} //�ְ�� ��ũ
				case(58){itemString = `id:60030 count:5`;itemArray.Add(itemString);} //�ְ�� ���ײ�
				case(59){itemString = `id:60018 count:5`;itemArray.Add(itemString);} //�ְ�� ������ ��
				case(60){itemString = `id:60043 count:5`;itemArray.Add(itemString);} //���Ȱ� ���
				case(61){itemString = `id:60041 count:5`;itemArray.Add(itemString);} //���� �� ��
				case(62){itemString = `id:60042 count:5`;itemArray.Add(itemString);} //���� �� ��
				case(63){itemString = `id:64008 count:10`;itemArray.Add(itemString);} //�ݱ���
				case(64){itemString = `id:64006 count:10`;itemArray.Add(itemString);} //������
				case(65){itemString = `id:60021 count:10`;itemArray.Add(itemString);} //��� �ʰ�
				case(66){itemString = `id:60025 count:10`;itemArray.Add(itemString);} //��� ����
				case(67){itemString = `id:60013 count:10`;itemArray.Add(itemString);} //��� ��ũ
				case(68){itemString = `id:60029 count:10`;itemArray.Add(itemString);} //��� ���ײ�
				case(69){itemString = `id:60017 count:10`;itemArray.Add(itemString);} //��� ������ ��
				case(70){itemString = `id:64003 count:10`;itemArray.Add(itemString);} //����
				case(71){itemString = `id:64001 count:10`;itemArray.Add(itemString);} //ö��
				case(72){itemString = `manual:20133`;itemArray.Add(itemString);} //�÷�Ʈ �� �ҵ� (����)
				case(73){itemString = `manual:20123`;itemArray.Add(itemString);} //���׷� ī��Ʈ �ǵ� (����)
				case(74){itemString = `manual:160`;itemArray.Add(itemString);} //�������ֿ� �������� �Ź�(������) (�ʺ�)
				case(75){itemString = `manual:159`;itemArray.Add(itemString);} //�������ֿ� �������� �Ź�(������) (�ʺ�)
				case(76){itemString = `manual:157`;itemArray.Add(itemString);} //Ű�� �ܿ� õ���� �尩 (�ʺ�)
				case(77){itemString = `manual:165`;itemArray.Add(itemString);} //Ű�� �ܿ� õ���� ���� (�ʺ�)
				case(78){itemString = `manual:161`;itemArray.Add(itemString);} //Ű�� �ܿ� õ���� ���� (�ʺ�)
				case(79){itemString = `id:14023`;itemArray.Add(itemString);} //�� ���� �Ƹ� (������)
				case(80){itemString = `id:14024`;itemArray.Add(itemString);} //�� ���� �Ƹ� (������)
				case(81){itemString = `id:40080 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //�۶��콺 (���� Į��)
				case(82){itemString = `manual:145`;itemArray.Add(itemString);} //�������ֿ� ��������(������) (�ʺ�)
				case(83){itemString = `manual:146`;itemArray.Add(itemString);} //�������ֿ� ��������(������) (�ʺ�)
				case(84){itemString = `manual:147`;itemArray.Add(itemString);} //Ű�� �ܿ� õ���� ��Ʈ(������) (�ʺ�)
				case(85){itemString = `manual:148`;itemArray.Add(itemString);} //Ű�� �ܿ� õ���� ��Ʈ(������) (�ʺ�)
				case(86){itemString = `id:40030 col1:00c000 col2:00c000 col3:00c000`;itemArray.Add(itemString);} //�� �ڵ�� �ҵ� (���� Į��)
				case(87){itemString = `id:40078 col1:c000c0 col2:c000c0 col3:c000c0`;itemArray.Add(itemString);} //����Ͻ� (���� Į��)
				case(88){itemString = `id:40079 col1:0000c0 col2:0000c0 col3:0000c0`;itemArray.Add(itemString);} //���̽� (���� Į��)
				case(89){itemString = `id:17040`;itemArray.Add(itemString);} //���� ��Ʈ�� ����
				case(90){itemString = `id:18523`;itemArray.Add(itemString);} //���� ���� ĸ
				case(91){itemString = `id:40083`;itemArray.Add(itemString);} //�� ĿƲ����
				case(92){itemString = `id:63030`;itemArray.Add(itemString);} //���� ���� ���� ����
				case(93){itemString = `manual:174`;itemArray.Add(itemString);} //�� ���� �Ƹ� (������) (�ʺ�)
				case(94){itemString = `manual:175`;itemArray.Add(itemString);} //�� ���� �Ƹ� (������) (�ʺ�)
				case(95){itemString = `id:17039`;itemArray.Add(itemString);} //�ڷ��� ťƮ ���� ����
				case(96){itemString = `id:18518`;itemArray.Add(itemString);} //�巡�� ũ����Ʈ
				case(97){itemString = `id:18096`;itemArray.Add(itemString);} //���̷� ����� ����
				case(98){itemString = `id:18097`;itemArray.Add(itemString);} //���̷� ���� ����
				case(99){itemString = `id:18098`;itemArray.Add(itemString);} //���̷��� �Ȱ�
				case(100){itemString = `id:18099`;itemArray.Add(itemString);} //���̷� ���� ���� ����
				case(101){itemString = `id:18100`;itemArray.Add(itemString);} //���̷� ���� ����
				case(102){itemString = `id:18101`;itemArray.Add(itemString);} //���̷� ���� ���� ����
				case(103){itemString = `id:18102`;itemArray.Add(itemString);} //���̷��� ����
				case(104){itemString = `id:18521`;itemArray.Add(itemString);} //�����Ǿ� ����
				case(105){itemString = `id:18525`;itemArray.Add(itemString);} //���͵�� ĸ
				case(106){itemString = `id:18511`;itemArray.Add(itemString);} //�÷�Ʈ Ǯ �︧
				case(107){itemString = `id:18506`;itemArray.Add(itemString);} //�� ���� �︧
				case(108){itemString = `id:17505`;itemArray.Add(itemString);} //�÷���Ʈ ����
				case(109){itemString = `id:16505`;itemArray.Add(itemString);} //�÷�Ʈ ��Ʋ��
				case(110){itemString = `id:14019`;itemArray.Add(itemString);} //�׷��̽� �÷���Ʈ �Ƹ�
				case(111){itemString = `id:13045`;itemArray.Add(itemString);} //�Ƹ��� �ƽ��� �Ƹ� (������)
				case(112){itemString = `manual:142`;itemArray.Add(itemString);} //�˻��б� ���� ��Ÿ�� (�ʺ�)
				case(113){itemString = `id:18542`;itemArray.Add(itemString);} //�� ü�� Ǯ �︧
				case(114){itemString = `id:17064`;itemArray.Add(itemString);} //ī�� ���Ǹ�Ʈ ����
				case(115){itemString = `manual:20158`;itemArray.Add(itemString);} //����ƾ �ǹ� ����Ʈ ��극�̽� (����)
				case(116){itemString = `id:13046`;itemArray.Add(itemString);} //�Ƹ��� �ƽ��� �Ƹ�(������)
				case(117){itemString = `id:18543`;itemArray.Add(itemString);} //�� ���� Ǯ �︧
				case(118){itemString = `id:18544`;itemArray.Add(itemString);} //�� �縮ĭ ��������
				case(119){itemString = `id:18547`;itemArray.Add(itemString);} //�� �ĳ��� ��� ��������
				case(120){itemString = `id:16523`;itemArray.Add(itemString);} //�׷��̽� ��Ʋ��
				case(121){itemString = `manual:20112`;itemArray.Add(itemString);} //�̺� ���� ũ��� (����)
				case(122){itemString = `manual:20113`;itemArray.Add(itemString);} //�巡�� ũ����Ʈ (����)
				case(123){itemString = `manual:20119`;itemArray.Add(itemString);} //�÷���Ʈ ��Ʋ�� (����)
				case(124){itemString = `manual:20114`;itemArray.Add(itemString);} //���̾� ����ŷ ����� (����)
				case(125){itemString = `id:19017`;itemArray.Add(itemString);} //���� �κ�
				case(126){itemString = `id:19016`;itemArray.Add(itemString);} //�� �κ�
				case(127){itemString = `id:40100`;itemArray.Add(itemString);} //�� ���� �ҵ�
				case(128){itemString = `id:40012 col1:c00060 col2:c00060 col3:c00060`;itemArray.Add(itemString);} //�ٽ�Ÿ�� �ҵ� (���� Į��)
				case(129){itemString = `id:60031`;itemArray.Add(itemString);} //������ ��ũ���� �尩
				case(130){itemString = `id:60032`;itemArray.Add(itemString);} //�Ϲ� ��ũ���� �尩
				case(131){itemString = `id:60033`;itemArray.Add(itemString);} //�������� ��ũ���� �尩
				case(132){itemString = `id:60046`;itemArray.Add(itemString);} //�ְ�� ��ũ���� �尩
				case(133){itemString = `id:60055`;itemArray.Add(itemString);} //��� ��ũ���� �尩
				case(134){itemString = `id:60056`;itemArray.Add(itemString);} //�ְ�� �ʰ����� �尩
				case(135){itemString = `id:60057`;itemArray.Add(itemString);} //��� �ʰ����� �尩
				case(136){itemString = `id:19009`;itemArray.Add(itemString);} //���� ���� �κ�
				case(137){itemString = `id:19020`;itemArray.Add(itemString);} //��Ÿ�� ����� ��Ʈ
				case(138){itemString = `id:40010`;itemArray.Add(itemString);} //�� �ҵ�
				case(139){itemString = `manual:20107`;itemArray.Add(itemString);} //�����þ� �︧ (����)
				case(140){itemString = `id:51031 count:5`;itemArray.Add(itemString);} //���� ȸ���� ����
				case(141){itemString = `id:63024 expire:10080`;itemArray.Add(itemString);} //���� ����
				case(142){itemString = `manual:20103`;itemArray.Add(itemString);} //���� �ǵ� (����)
				case(143){itemString = `id:40022 col1:00c000`;itemArray.Add(itemString);} //ä���� ���� (���� Į��)
				case(144){itemString = `id:40023 col1:0000c0 col2:0000c0 col3:0000c0`;itemArray.Add(itemString);} //ä���� �ܰ� (���� Į��)
				case(145){itemString = `id:40024 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //�������� ��ġ (���� Į��)
				case(146){itemString = `id:40025 col1:c000c0 col2:c000c0 col3:c000c0`;itemArray.Add(itemString);} //��� (���� Į��)
				case(147){itemString = `id:40042 col1:c0c000 col2:c0c000 col3:c0c000`;itemArray.Add(itemString);} //��Į (���� Į��)
				case(148){itemString = `id:40026 col1:c00060 col2:c00060 col3:c00060`;itemArray.Add(itemString);} //�� (���� Į��)
				case(149){itemString = `id:40027 col1:c06060 col2:c06060 col3:c06060`;itemArray.Add(itemString);} //ȣ�� (���� Į��)
				case(150){itemString = `id:40045 col1:fff0c0 col2:fff0c0 col3:fff0c0`;itemArray.Add(itemString);} //���˴� (���� Į��)
				case(151){itemString = `id:40043 col1:ffffff col2:ffffff col3:ffffff`;itemArray.Add(itemString);} //���׿� �д� (���� Į��)
				case(152){itemString = `id:40044 col1:000000 col2:000000 col3:000000`;itemArray.Add(itemString);} //�ٿ뵵 ���� (���� Į��)
				case(153){itemString = `id:46004 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //���� (���� Į��)
				case(154){itemString = `id:46005 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //���� ���̺� (���� Į��)
				case(155){itemString = `manual:20105`;itemArray.Add(itemString);} //�� �ҵ� (����)
				case(156){itemString = `id:63016 count:3`;itemArray.Add(itemString);} //�ູ�� ����
				case(157){itemString = `id:63047 count:5`;itemArray.Add(itemString);} //���� ������ �̿��
				case(158){itemString = `id:2028 count:20`;itemArray.Add(itemString);} //���� �ָӴ�
				case(159){itemString = `manual:20101`;itemArray.Add(itemString);} //ȣ�� (����)
				case(160){itemString = `id:63029 count:5`;itemArray.Add(itemString);} //ķ�����̾� ŰƮ
				case(161){itemString = `id:63025 count:3`;itemArray.Add(itemString);} //��뷮 �ູ�� ����
				case(162){itemString = `id:51013 count:5`;itemArray.Add(itemString);} //���¹̳� 50 ����
				case(163){itemString = `manual:20102`;itemArray.Add(itemString);} //�ܰ� (����)
				case(164){itemString = `manual:20104`;itemArray.Add(itemString);} //��� (����)
				case(165){itemString = `id:51022 count:5`;itemArray.Add(itemString);} //����°� ���� 30 ����
				case(166){itemString = `id:51027 count:5`;itemArray.Add(itemString);} //����°� ���¹̳� 30 ����
				case(167){itemString = `id:51028 count:3`;itemArray.Add(itemString);} //����°� ���¹̳� 50 ����
				case(168){itemString = `id:51014 count:3`;itemArray.Add(itemString);} //���¹̳� 100 ����
				case(169){itemString = `id:19022`;itemArray.Add(itemString);} //��� �κ�
				case(170){itemString = `manual:101`;itemArray.Add(itemString);} //�ڷ��� �����巹�� (�ʺ�)
				case(171){itemString = `manual:102`;itemArray.Add(itemString);} //�����б� ���� (������) (�ʺ�)
				case(172){itemString = `manual:103`;itemArray.Add(itemString);} //�����б� ���� (������) (�ʺ�)
				case(173){itemString = `manual:104`;itemArray.Add(itemString);} //�ڷ��� ���� �۷��� (�ʺ�)
				case(174){itemString = `manual:105`;itemArray.Add(itemString);} //��� ���� (�ʺ�)
				case(175){itemString = `id:64002 count:10`;itemArray.Add(itemString);} //ö����
				case(176){itemString = `id:64004 count:10`;itemArray.Add(itemString);} //������
				case(177){itemString = `id:60012 count:10`;itemArray.Add(itemString);} //�Ϲ� ��ũ
				case(178){itemString = `id:60016 count:10`;itemArray.Add(itemString);} //�Ϲ� ������ ��
				case(179){itemString = `id:60020 count:10`;itemArray.Add(itemString);} //�Ϲ� �ʰ�
				case(180){itemString = `id:60024 count:10`;itemArray.Add(itemString);} //�Ϲ� ����
				case(181){itemString = `id:60028 count:10`;itemArray.Add(itemString);} //�Ϲ� ���ײ�
				case(182){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //���� �ǹ�ġ
				case(183){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //���� �ǹ�ġ
				case(184){itemString = `manual:20131`;itemArray.Add(itemString);} //�� �ҵ� (����)
				case(185){itemString = `manual:20008`;itemArray.Add(itemString);} //������ũ ĸ (����)
				case(186){itemString = `manual:114`;itemArray.Add(itemString);} //�Ӹ��� (�ʺ�)
		}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
		{
				itemString = (string)itemArray.Get(j);
			DebugOut(`�������� `+itemString+` �� ��`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}

			bCashGachaphonGived = true;
		}
		if (bCashGachaphonGived)
		{
			break;
		}

		++i;
	}

	// ĳ�� �������� ���޾Ҵ�.
	if (!bCashGachaphonGived)
	{
		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
	}	
}
