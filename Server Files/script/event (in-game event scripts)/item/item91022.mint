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
	int itemID = cItem.GetClassId();
	/*����������
	Ȥ�ö� ���� ��Ÿ�� ���̱� ���ؼ� �������� Feature.xml�� ���ִ� �������� �ҹ��ڷ� ���ϴ�.
	*/
	 if(GetLocale().LowerCase()== `china`)
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(2937);	//Ȯ���� ������ ���´�

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15555 `; iCumRate +=1;} //0.034048349�ٳ��� ������ ����
				case(1){itemString = `id:15556 `; iCumRate +=1;} //0.034048349�ٳ��� ������ ����
				case(2){itemString = `id:16065 `; iCumRate +=1;} //0.034048349�ٳ��� ���� �극�̽���
				case(3){itemString = `id:17212 `; iCumRate +=1;} //0.034048349�ٳ��� ���� ����
				case(4){itemString = `id:17213 `; iCumRate +=1;} //0.034048349�ٳ��� �ɹ��� ����
				case(5){itemString = `id:15406 `; iCumRate +=1;} //0.034048349ĳ�־� ���� AŸ��
				case(6){itemString = `id:15407 `; iCumRate +=1;} //0.034048349ĳ�־� ���� BŸ��
				case(7){itemString = `id:15408 `; iCumRate +=1;} //0.034048349�ױ۸���
				case(8){itemString = `id:17158 `; iCumRate +=1;} //0.034048349������
				case(9){itemString = `id:18582 `; iCumRate +=1;} //0.034048349��� �巹��
				case(10){itemString = `id:18235 `; iCumRate +=2;} //0.068096697���̸��� ����Ʈĸ
				case(11){itemString = `id:15338 `; iCumRate +=1;} //0.034048349�θ�ƽ �̺�� �巹��
				case(12){itemString = `id:15339 `; iCumRate +=1;} //0.034048349�θ�ƽ ���� ��Ʈ
				case(13){itemString = `id:17135 `; iCumRate +=2;} //0.068096697������ ������
				case(14){itemString = `id:17136 `; iCumRate +=2;} //0.068096697Ŭ���� ����
				case(15){itemString = `id:15325 `; iCumRate +=1;} //0.034048349���� ���� (������)
				case(16){itemString = `id:15326 `; iCumRate +=1;} //0.034048349���� �巹�� (������)
				case(17){itemString = `id:14047 `; iCumRate +=1;} //0.034048349�Ҳ� ���� ���� �Ƹ� (������)
				case(18){itemString = `id:14048 `; iCumRate +=1;} //0.034048349�Ҳ� ���� ���� �Ƹ� (������)
				case(19){itemString = `id:14049 `; iCumRate +=1;} //0.034048349�߸����� ���� ���� (������)
				case(20){itemString = `id:14050 `; iCumRate +=1;} //0.034048349�߸����� ���� ���� (������)
				case(21){itemString = `id:15315 `; iCumRate +=1;} //0.034048349�ƽ�ƾ ��� ��Ʈ
				case(22){itemString = `id:15314 `; iCumRate +=1;} //0.034048349���ī �� ������
				case(23){itemString = `id:17132 `; iCumRate +=2;} //0.068096697���� ����
				case(24){itemString = `id:18566 `; iCumRate +=2;} //0.068096697���� ����
				case(25){itemString = `id:18559 `; iCumRate +=2;} //0.068096697�Ҳ� ���� ���� ĸ
				case(26){itemString = `id:18227 `; iCumRate +=2;} //0.068096697�ƽ�ƾ ĸ
				case(27){itemString = `id:18226 `; iCumRate +=2;} //0.068096697���ī ĸ
				case(28){itemString = `id:15079 `; iCumRate +=2;} //0.068096697������ �� ���� ��ĿƮ
				case(29){itemString = `id:15222 `; iCumRate +=2;} //0.068096697�׷��̽� �� �巹��(������)
				case(30){itemString = `id:15250 `; iCumRate +=2;} //0.068096697���̵� �ǻ� ��Ʈ Ÿ��
				case(31){itemString = `id:15251 `; iCumRate +=2;} //0.068096697���̵� �ǻ� �� Ÿ��
				case(32){itemString = `id:15252 `; iCumRate +=2;} //0.068096697���� �ǻ�
				case(33){itemString = `id:16046 `; iCumRate +=2;} //0.068096697����� �� �尩
				case(34){itemString = `id:16054 `; iCumRate +=3;} //0.102145046�Ҳ� ���� ���� �۷���
				case(35){itemString = `id:16053 `; iCumRate +=3;} //0.102145046�ƽ�ƾ �۷���
				case(36){itemString = `id:16052 `; iCumRate +=3;} //0.102145046���ī �� �۷���
				case(37){itemString = `id:15292 `; iCumRate +=3;} //0.102145046������ ������
				case(38){itemString = `id:15293 `; iCumRate +=3;} //0.102145046������ ������
				case(39){itemString = `id:15294 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349������ ������
				case(40){itemString = `id:15295 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349������ ������
				case(41){itemString = `id:18176 `; iCumRate +=3;} //0.102145046���̵� �Ӹ���
				case(42){itemString = `id:15203 `; iCumRate +=3;} //0.102145046������ ��īŸ
				case(43){itemString = `id:15204 `; iCumRate +=3;} //0.102145046������ ��īŸ
				case(44){itemString = `id:15233 `; iCumRate +=3;} //0.102145046������Ʈ ��� �巹��
				case(45){itemString = `id:15234 `; iCumRate +=3;} //0.102145046������Ʈ ��� ��Ʈ
				case(46){itemString = `id:15235 `; iCumRate +=3;} //0.102145046������Ʈ ��� �巹��
				case(47){itemString = `id:18187 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349Ŀ�ٶ� ����
				case(48){itemString = `id:18188 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349�ȴ�
				case(49){itemString = `id:18189 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349ī�캸�� ����
				case(50){itemString = `id:15065 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���� ����Ʈ ��ĿƮ
				case(51){itemString = `id:15112 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697������ �����̷�
				case(52){itemString = `id:15113 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697������ �˻��б� ���� ��ƮŸ��
				case(53){itemString = `id:15114 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697������ �˻��б� ���� ��Ÿ��
				case(54){itemString = `id:15131 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697�� �������� ��ĿƮ
				case(55){itemString = `id:15132 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���߷� ����Ʈ ����
				case(56){itemString = `id:15135 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697��ũ ��Ʈ
				case(57){itemString = `id:15137 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697������ ���� ��Ŷ ��Ʈ
				case(58){itemString = `id:15151 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(59){itemString = `id:15152 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(60){itemString = `id:15153 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���� �������� ��Ʈ(������)
				case(61){itemString = `id:15154 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���� �������� ��Ʈ(������)
				case(62){itemString = `id:15155 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697�̵�ī�� ������ ����(������)
				case(63){itemString = `id:15156 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697�̵�ī�� ������ ����(������)
				case(64){itemString = `id:15157 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���� ������ �Ǻ�(������)
				case(65){itemString = `id:15158 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697���� ������ �Ǻ�(������)
				case(66){itemString = `id:15184 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697�׶� ���̼�Ʈ ���� ����
				case(67){itemString = `id:19007 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697�߱� ���÷� �κ�
				case(68){itemString = `id:17130 `; iCumRate +=4;} //0.136193395�Ҳ� ���� ���� ����
				case(69){itemString = `id:16055 `; iCumRate +=4;} //0.136193395�߸����� ���� �尩 (������)
				case(70){itemString = `id:16056 `; iCumRate +=4;} //0.136193395�߸����� ���� �尩 (������)
				case(71){itemString = `id:17126 `; iCumRate +=4;} //0.136193395�ƽ�ƾ ����
				case(72){itemString = `id:17125 `; iCumRate +=4;} //0.136193395���ī ���� ����
				case(73){itemString = `id:15298 `; iCumRate +=4;} //0.136193395��ó���� �������
				case(74){itemString = `id:15267 `; iCumRate +=4;} //0.136193395�׶� ��� Ǯ �巹��
				case(75){itemString = `id:15268 `; iCumRate +=4;} //0.136193395�׶� ��� ��ũ ��Ʈ
				case(76){itemString = `id:15296 `; iCumRate +=4;} //0.136193395������ ������
				case(77){itemString = `id:15297 `; iCumRate +=4;} //0.136193395������ ������
				case(78){itemString = `id:15224 `; iCumRate +=4;} //0.136193395������ ��īŸ
				case(79){itemString = `id:15225 `; iCumRate +=4;} //0.136193395������ ��īŸ
				case(80){itemString = `id:13010 suffix:30613`; iCumRate +=4;} //0.136193395���� ����� ü�θ���
				case(81){itemString = `id:13022 suffix:30613`; iCumRate +=4;} //0.136193395���� �÷���Ʈ �Ƹ� (PŸ��)
				case(82){itemString = `id:13031 suffix:30613`; iCumRate +=4;} //0.136193395������ī �ǹ� �÷���Ʈ �Ƹ�
				case(83){itemString = `id:13032 suffix:31401`; iCumRate +=4;} //0.136193395�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(84){itemString = `id:13033 suffix:31401`; iCumRate +=4;} //0.136193395�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
				case(85){itemString = `id:14025 suffix:30515`; iCumRate +=4;} //0.136193395ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(86){itemString = `id:14026 suffix:30515`; iCumRate +=4;} //0.136193395ī�� ���Ǹ�Ʈ �Ƹ�(������)
				case(87){itemString = `id:14036 suffix:30613`; iCumRate +=4;} //0.136193395Ƽ���� �Ƹ�(������)
				case(88){itemString = `id:14037 suffix:30613`; iCumRate +=4;} //0.136193395Ƽ���� �Ƹ�(������)
				case(89){itemString = `id:16028 suffix:30601`; iCumRate +=4;} //0.136193395ī�� ���Ǹ�Ʈ �۷���
				case(90){itemString = `id:16511 suffix:30601`; iCumRate +=4;} //0.136193395�ǹ� Ƽ�� �۷���
				case(91){itemString = `id:16521 suffix:30902`; iCumRate +=4;} //0.136193395�߷��þ� ũ�ν� ���� �÷���Ʈ ��Ʋ��
				case(92){itemString = `id:16531 suffix:30601`; iCumRate +=4;} //0.136193395Ƽ���� ��Ʋ��
				case(93){itemString = `id:17064 suffix:30601`; iCumRate +=4;} //0.136193395ī�� ���Ǹ�Ʈ ����
				case(94){itemString = `id:17510 suffix:30601`; iCumRate +=4;} //0.136193395������ī �ǹ� �÷���Ʈ ����
				case(95){itemString = `id:17514 suffix:30902`; iCumRate +=4;} //0.136193395�߷��þ� ũ�ν� ���� �÷���Ʈ ����
				case(96){itemString = `id:17523 suffix:30601`; iCumRate +=4;} //0.136193395Ƽ���� �׸���
				case(97){itemString = `id:18518 suffix:30601`; iCumRate +=4;} //0.136193395�巡�� ũ����Ʈ
				case(98){itemString = `id:18161 `; iCumRate +=5;} //0.170241743����Ĺ �͸���
				case(99){itemString = `id:18157 `; iCumRate +=5;} //0.170241743����� �� �Ӹ���
				case(100){itemString = `id:15065 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���� ����Ʈ ��ĿƮ
				case(101){itemString = `id:15112 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046������ �����̷�
				case(102){itemString = `id:15113 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046������ �˻��б� ���� ��ƮŸ��
				case(103){itemString = `id:15114 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046������ �˻��б� ���� ��Ÿ��
				case(104){itemString = `id:15131 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046�� �������� ��ĿƮ
				case(105){itemString = `id:15132 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���߷� ����Ʈ ����
				case(106){itemString = `id:15135 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046��ũ ��Ʈ
				case(107){itemString = `id:15137 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046������ ���� ��Ŷ ��Ʈ
				case(108){itemString = `id:15151 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(109){itemString = `id:15152 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���帶���� ���̽�Ʈ ���Ϸ� ����(������)
				case(110){itemString = `id:15153 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���� �������� ��Ʈ(������)
				case(111){itemString = `id:15154 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���� �������� ��Ʈ(������)
				case(112){itemString = `id:15155 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046�̵�ī�� ������ ����(������)
				case(113){itemString = `id:15156 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046�̵�ī�� ������ ����(������)
				case(114){itemString = `id:15157 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���� ������ �Ǻ�(������)
				case(115){itemString = `id:15158 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046���� ������ �Ǻ�(������)
				case(116){itemString = `id:15184 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046�׶� ���̼�Ʈ ���� ����
				case(117){itemString = `id:19007 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046�߱� ���÷� �κ�
				case(118){itemString = `id:80000 `; iCumRate +=8;} //0.272386789������ ���� ��
				case(119){itemString = `id:80001 `; iCumRate +=8;} //0.272386789����� ��
				case(120){itemString = `id:80002 `; iCumRate +=8;} //0.272386789��ũ�� ��Ʈ
				case(121){itemString = `id:80003 `; iCumRate +=8;} //0.272386789������ ��Ʈ
				case(122){itemString = `id:80004 `; iCumRate +=8;} //0.272386789������ ����� �� ��
				case(123){itemString = `id:80005 `; iCumRate +=8;} //0.272386789������ �Ͼ�� �� ��
				case(124){itemString = `id:80006 `; iCumRate +=8;} //0.272386789������ ��ũ�� �� ��
				case(125){itemString = `id:62005 suffix:30515`; iCumRate +=15;} //0.51072523������
				case(126){itemString = `id:62005 prefix:20505`; iCumRate +=15;} //0.51072523���ڵ�
				case(127){itemString = `id:62005 prefix:21007`; iCumRate +=15;} //0.51072523����
				case(128){itemString = `id:62005 prefix:20625`; iCumRate +=15;} //0.51072523�ݼ� �ٴ�
				case(129){itemString = `id:62005 suffix:30624`; iCumRate +=15;} //0.51072523��糪��
				case(130){itemString = `id:62005 prefix:20721`; iCumRate +=15;} //0.51072523�Ѱ���
				case(131){itemString = `id:51003 count:10`; iCumRate +=18;} //0.612870276����� 50 ����
				case(132){itemString = `id:51004 count:10`; iCumRate +=18;} //0.612870276����� 100 ����
				case(133){itemString = `id:51007 count:10`; iCumRate +=18;} //0.612870276���� 30 ����
				case(134){itemString = `id:51008 count:10`; iCumRate +=18;} //0.612870276���� 50 ����
				case(135){itemString = `id:51009 count:10`; iCumRate +=18;} //0.612870276���� 100 ����
				case(136){itemString = `id:51013 count:10`; iCumRate +=18;} //0.612870276���¹̳� 50 ����
				case(137){itemString = `id:51014 count:10`; iCumRate +=18;} //0.612870276���¹̳� 100 ����
				case(138){itemString = `id:51022 count:10`; iCumRate +=18;} //0.612870276����°� ���� 30 ����
				case(139){itemString = `id:51023 count:10`; iCumRate +=18;} //0.612870276����°� ���� 50 ����
				case(140){itemString = `id:51027 count:10`; iCumRate +=18;} //0.612870276����°� ���¹̳� 30 ����
				case(141){itemString = `id:51028 count:10`; iCumRate +=18;} //0.612870276����°� ���¹̳� 50 ����
				case(142){itemString = `id:51029 count:10`; iCumRate +=18;} //0.612870276����°� ���¹̳� 100 ����
				case(143){itemString = `id:60036 count:5`; iCumRate +=18;} //0.612870276���ο� ���̺� ����
				case(144){itemString = `id:60037 count:5`; iCumRate +=18;} //0.612870276�� ���� ����
				case(145){itemString = `id:60038 count:5`; iCumRate +=18;} //0.612870276���� ����
				case(146){itemString = `id:60040 count:5`; iCumRate +=18;} //0.612870276�׸� ���̺� ����
				case(147){itemString = `id:62004 count:5`; iCumRate +=18;} //0.612870276��������
				case(148){itemString = `id:63000 count:10`; iCumRate +=18;} //0.612870276�Ǵн��� ����
				case(149){itemString = `id:2006 `; iCumRate +=20;} //0.680966973ū ��ȭ �ָӴ�
				case(150){itemString = `id:17015 `; iCumRate +=20;} //0.680966973�Ĺ��
				case(151){itemString = `id:14042 `; iCumRate +=20;} //0.680966973�ý�ƾ ���� �Ƹ�
				case(152){itemString = `id:16534 `; iCumRate +=20;} //0.680966973�ý�ƾ ���� ��Ʋ��
				case(153){itemString = `id:17524 `; iCumRate +=20;} //0.680966973�ý�ƾ ���� ����
				case(154){itemString = `id:13047 `; iCumRate +=20;} //0.680966973Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(155){itemString = `id:13048 `; iCumRate +=20;} //0.680966973Ű�������� ���� �÷���Ʈ �Ƹ�(������)
				case(156){itemString = `id:14005 `; iCumRate +=20;} //0.680966973������� ��������
				case(157){itemString = `id:14011 `; iCumRate +=20;} //0.680966973������� ��������
				case(158){itemString = `id:14013 `; iCumRate +=20;} //0.680966973�θ�ī ���׸�ŸŸ��
				case(159){itemString = `id:14019 `; iCumRate +=20;} //0.680966973�׷��̽� �÷���Ʈ �Ƹ�
				case(160){itemString = `id:14035 `; iCumRate +=20;} //0.680966973�Ǹ�Ÿ ���� �Ƹ�
				case(161){itemString = `id:14038 `; iCumRate +=20;} //0.680966973�Ǹ�Ÿ ���� �Ƹ� BŸ��(������)
				case(162){itemString = `id:15014 `; iCumRate +=20;} //0.680966973�Ĺ߲��� ��
				case(163){itemString = `id:15028 `; iCumRate +=20;} //0.680966973�ڷ��� ������Ʈ
				case(164){itemString = `id:15042 `; iCumRate +=20;} //0.680966973�ճ� ���ǽ�
				case(165){itemString = `id:15052 `; iCumRate +=20;} //0.680966973��ũ�� ���� Ʃ��
				case(166){itemString = `id:15053 `; iCumRate +=20;} //0.680966973�÷�Į�� ���ǽ�
				case(167){itemString = `id:15055 `; iCumRate +=20;} //0.680966973���� �̴� ���ǽ�
				case(168){itemString = `id:15057 `; iCumRate +=20;} //0.680966973�� ���� ��Ʈ (����)
				case(169){itemString = `id:15070 `; iCumRate +=20;} //0.680966973���ĵ�Į�� �����긮��
				case(170){itemString = `id:15128 `; iCumRate +=20;} //0.680966973�� �� ���� �巹��
				case(171){itemString = `id:15135 `; iCumRate +=20;} //0.680966973��ũ ��Ʈ
				case(172){itemString = `id:15136 `; iCumRate +=20;} //0.680966973���谡 ��Ʈ
				case(173){itemString = `id:15153 `; iCumRate +=20;} //0.680966973���� �������� ��Ʈ(������)
				case(174){itemString = `id:15154 `; iCumRate +=20;} //0.680966973���� �������� ��Ʈ(������)
				case(175){itemString = `id:15230 `; iCumRate +=20;} //0.680966973������ �۷� üũ ��ĿƮ
				case(176){itemString = `id:16008 `; iCumRate +=20;} //0.680966973�ڷ��� ���� �۷���
				case(177){itemString = `id:16019 `; iCumRate +=20;} //0.680966973�ٹ��� �ȸ� �尩
				case(178){itemString = `id:16028 `; iCumRate +=20;} //0.680966973ī�� ���Ǹ�Ʈ �۷���
				case(179){itemString = `id:16040 `; iCumRate +=20;} //0.680966973�ݸ� �� �۷���
				case(180){itemString = `id:16505 `; iCumRate +=20;} //0.680966973�÷�Ʈ ��Ʋ��
				case(181){itemString = `id:16520 `; iCumRate +=20;} //0.680966973�� ���� �۷���
				case(182){itemString = `id:17040 `; iCumRate +=20;} //0.680966973���� ��Ʈ�� ����
				case(183){itemString = `id:17041 `; iCumRate +=20;} //0.680966973�������� ���ú���
				case(184){itemString = `id:17045 `; iCumRate +=20;} //0.680966973���� �� ���� ���� ����
				case(185){itemString = `id:17071 `; iCumRate +=20;} //0.680966973������ ����
				case(186){itemString = `id:17087 `; iCumRate +=20;} //0.680966973�ݸ� �� ����
				case(187){itemString = `id:17506 `; iCumRate +=20;} //0.680966973�ձ׸��� ����
				case(188){itemString = `id:17522 `; iCumRate +=20;} //0.680966973�Ǹ�Ÿ ���� ����
				case(189){itemString = `id:18008 `; iCumRate +=20;} //0.680966973��Ʈ������ ĸ
				case(190){itemString = `id:18023 `; iCumRate +=20;} //0.680966973��� ���� ĸ
				case(191){itemString = `id:18028 `; iCumRate +=20;} //0.680966973���̽� �Ȱ�
				case(192){itemString = `id:18029 `; iCumRate +=20;} //0.680966973������ �Ȱ�
				case(193){itemString = `id:18038 `; iCumRate +=20;} //0.680966973���� �跿 ����
				case(194){itemString = `id:18040 `; iCumRate +=20;} //0.680966973�ڷ��� ���� ������
				case(195){itemString = `id:18047 `; iCumRate +=20;} //0.680966973�ڷ��� ��Ʈ ����
				case(196){itemString = `id:18108 `; iCumRate +=20;} //0.680966973���� ���� ��ǰ
				case(197){itemString = `id:18109 `; iCumRate +=20;} //0.680966973���� ���� ��ǰ
				case(198){itemString = `id:18110 `; iCumRate +=20;} //0.680966973���� ���� ��ǰ
				case(199){itemString = `id:18112 `; iCumRate +=20;} //0.680966973�� ���� ��ǰ
				case(200){itemString = `id:18113 `; iCumRate +=20;} //0.680966973������ ����� ����
				case(201){itemString = `id:18114 `; iCumRate +=20;} //0.680966973�ٹ��� ����� ����
				case(202){itemString = `id:18115 `; iCumRate +=20;} //0.680966973�� ����� ����
				case(203){itemString = `id:18502 `; iCumRate +=20;} //0.680966973�� �︧
				case(204){itemString = `id:18506 `; iCumRate +=20;} //0.680966973�� ���� �︧
				case(205){itemString = `id:18511 `; iCumRate +=20;} //0.680966973�÷�Ʈ Ǯ �︧
				case(206){itemString = `id:18513 `; iCumRate +=20;} //0.680966973������ũ ĸ
				case(207){itemString = `id:18515 `; iCumRate +=20;} //0.680966973Ʈ�� ȥ ĸ
				case(208){itemString = `id:18525 `; iCumRate +=20;} //0.680966973���͵�� ĸ
				case(209){itemString = `id:18542 `; iCumRate +=20;} //0.680966973�� ü�� Ǯ �︧
				case(210){itemString = `id:18543 `; iCumRate +=20;} //0.680966973���� Ǯ �︧
				case(211){itemString = `id:19005 `; iCumRate +=20;} //0.680966973���÷� �κ�
				case(212){itemString = `id:19007 `; iCumRate +=20;} //0.680966973�߱� ���÷� �κ�
				case(213){itemString = `id:19020 `; iCumRate +=20;} //0.680966973��Ÿ�� ����� ��Ʈ
				case(214){itemString = `id:19029 `; iCumRate +=20;} //0.680966973���̾�Ʈ ���� �κ�
				case(215){itemString = `id:19034 `; iCumRate +=20;} //0.680966973������ Ŭ�ν� ������Ʈ
				case(216){itemString = `id:40011 `; iCumRate +=20;} //0.680966973��ε� �ҵ�
				case(217){itemString = `id:40012 `; iCumRate +=20;} //0.680966973�ٽ�Ÿ�� �ҵ�
				case(218){itemString = `id:40014 `; iCumRate +=20;} //0.680966973������ ����
				case(219){itemString = `id:40015 `; iCumRate +=20;} //0.680966973�÷�Ʈ �� �ҵ�
				case(220){itemString = `id:40030 `; iCumRate +=20;} //0.680966973�� �ڵ�� �ҵ�
				case(221){itemString = `id:40031 `; iCumRate +=20;} //0.680966973����
				case(222){itemString = `id:40038 `; iCumRate +=20;} //0.680966973����Ʈ�� ����
				case(223){itemString = `id:40039 `; iCumRate +=20;} //0.680966973���̽� ����
				case(224){itemString = `id:40040 `; iCumRate +=20;} //0.680966973���̾� ����
				case(225){itemString = `id:40041 `; iCumRate +=20;} //0.680966973Ÿ�ݿ� ����
				case(226){itemString = `id:40079 `; iCumRate +=20;} //0.680966973���̽�
				case(227){itemString = `id:40081 `; iCumRate +=20;} //0.680966973�� ����
				case(228){itemString = `id:40081 `; iCumRate +=20;} //0.680966973���� �� ����
				case(229){itemString = `id:40090 `; iCumRate +=20;} //0.680966973���� ����
				case(230){itemString = `id:46001  `; iCumRate +=20;} //0.680966973���� �ǵ�
				case(231){itemString = `id:46006 `; iCumRate +=20;} //0.680966973ī��Ʈ �ǵ�
				case(232){itemString = `id:40172 `; iCumRate +=20;} //0.680966973�׷���Ʈ �ҵ�
				case(233){itemString = `id:40174 `; iCumRate +=20;} //0.680966973��׽�Ÿ
				case(234){itemString = `id:40177 `; iCumRate +=20;} //0.680966973������ �׽�
				case(235){itemString = `id:40180 `; iCumRate +=20;} //0.680966973ȩ���� ��Ŭ
				case(236){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.817160368��ģ
				case(237){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.817160368������
				case(238){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.817160368�߰���
				case(239){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.817160368�縷�Ź�
				case(240){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.817160368Ư����
				case(241){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.817160368�ż�
				case(242){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.817160368�ĸ���
				case(243){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.817160368�ż���
				case(244){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.817160368�����
				case(245){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.817160368������
				case(246){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.817160368������
				case(247){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.817160368������
				case(248){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.817160368���鸮
				case(249){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.817160368������
				case(250){itemString = `id:91034 `; iCumRate +=85;} //2.894109636����ġ ���� ����
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
/*
		// �ǻ��̳� ���� ȹ��
		int randomSetId = 1001;   // ���� ID.. RandomItemSet.xlsm�� ����
		int itemIndex = GetItemIndexFromRandomSet(randomSetId, player);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);
*/

	}
	else if (GetLocale().LowerCase() == `usa`)
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(3240);	//Ȯ���� ������ ���´�

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15079`; iCumRate += 1;}	//0.030864198 ������ �� ���� ��ĿƮ
				case(1){itemString = `id:15112`; iCumRate += 1;}	//0.030864198 ������ �����̷�
				case(2){itemString = `id:15108`; iCumRate += 1;}	//0.030864198 ���� ���̵� ��ũž
				case(3){itemString = `id:17042`; iCumRate += 1;}	//0.030864198 �ڷ��� ������Ż �� ����
				case(4){itemString = `id:15064 col1:ff6699 col2:990000 col3:990000`; iCumRate += 1;}	//0.030864198 ��ȫ ���̵� ���� �巹��
				case(5){itemString = `id:15060 col1:e8e8e8 col2:e8e8e8 col3:e8e8e8`; iCumRate += 1;}	//0.030864198 ��� ���� �̳ʷκ� ����
				case(6){itemString = `id:17041 col1:101010 col2:101010 col3:101010`; iCumRate += 1;}	//0.030864198 ������ �������� ���ú���
				case(7){itemString = `id:15063`; iCumRate += 1;}	//0.030864198 ���̾�� ���� ���ǽ�
				case(8){itemString = `id:15113`; iCumRate += 1;}	//0.030864198 ������ �˻��б� ���� ��ƮŸ��
				case(9){itemString = `id:15061`; iCumRate += 1;}	//0.030864198 ���ṫ�� ��Ʈ�� Ʃ��
				case(10){itemString = `id:15059`; iCumRate += 1;}	//0.030864198 ��ũ�� ��ũž �ݹ���
				case(11){itemString = `id:15124 col1:ceeeff col2:002c76 col3:ff4419`; iCumRate += 1;}	//0.030864198 �ϴû� Ŭ���� ������ ����
				case(12){itemString = `id:15065`; iCumRate += 1;}	//0.030864198 ���� ����Ʈ ��ĿƮ
				case(13){itemString = `id:15074`; iCumRate += 1;}	//0.030864198 ���̽� ������ ��Ʈ
				case(14){itemString = `id:18044 col1:101010`; iCumRate += 1;}	//0.030864198 ������ ���˿� ����
				case(15){itemString = `id:63034 col1:c00000`; iCumRate += 1;}	//0.030864198 ������ ���� ����
				case(16){itemString = `id:63033 col1:000000`; iCumRate += 1;}	//0.030864198 ������ ���� ����
				case(17){itemString = `id:15115`; iCumRate += 3;}	//0.092592593 ���� �̴� ��ĿƮ
				case(18){itemString = `id:15017`; iCumRate += 3;}	//0.092592593 ���̳��巹��
				case(19){itemString = `id:18044`; iCumRate += 3;}	//0.092592593 ���˿� ����
				case(20){itemString = `id:16519`; iCumRate += 3;}	//0.092592593 ��ȣȭ �尩
				case(21){itemString = `id:18046`; iCumRate += 3;}	//0.092592593 �հ��� �Ӹ����
				case(22){itemString = `id:15124`; iCumRate += 3;}	//0.092592593 Ŭ���� ������ ����
				case(23){itemString = `id:15060`; iCumRate += 3;}	//0.092592593 Ŭ���� ������ ����
				case(24){itemString = `id:17041`; iCumRate += 3;}	//0.092592593 �������� ���ú���
				case(25){itemString = `id:15064`; iCumRate += 3;}	//0.092592593 ���̵� ���� �巹��
				case(26){itemString = `id:15070`; iCumRate += 3;}	//0.092592593 ���̵� ���� �巹��
				case(27){itemString = `id:40095`; iCumRate += 3;}	//0.092592593 �巡�� ���̵�
				case(28){itemString = `id:19007`; iCumRate += 3;}	//0.092592593 �߱� ���÷� �κ�
				case(29){itemString = `id:18056`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���1 (�����Ұ�)
				case(30){itemString = `id:18057`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���2  (�����Ұ�)
				case(31){itemString = `id:18058`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���3  (�����Ұ�)
				case(32){itemString = `id:18059`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���4  (�����Ұ�)
				case(33){itemString = `id:18060`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���5  (�����Ұ�)
				case(34){itemString = `id:18061`; iCumRate += 3;}	//0.092592593 ���� �䳢 �Ӹ���1  (�����Ұ�)
				case(35){itemString = `id:18062`; iCumRate += 3;}	//0.092592593 ���� �䳢 �Ӹ���2  (�����Ұ�)
				case(36){itemString = `id:18063`; iCumRate += 3;}	//0.092592593 ���� �䳢 �Ӹ���3  (�����Ұ�)
				case(37){itemString = `id:18064`; iCumRate += 3;}	//0.092592593 ���� �䳢 �Ӹ���4  (�����Ұ�)
				case(38){itemString = `id:18065`; iCumRate += 3;}	//0.092592593 ���� �䳢 �Ӹ���5  (�����Ұ�)
				case(39){itemString = `id:18066`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���1  (�����Ұ�)
				case(40){itemString = `id:18067`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���2  (�����Ұ�)
				case(41){itemString = `id:18068`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���3  (�����Ұ�)
				case(42){itemString = `id:18069`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���4  (�����Ұ�)
				case(43){itemString = `id:18070`; iCumRate += 3;}	//0.092592593 �� �䳢 �Ӹ���5 (�����Ұ�)
				case(44){itemString = `id:18096`; iCumRate += 3;}	//0.092592593 ���̷� ����� ����
				case(45){itemString = `id:18097`; iCumRate += 3;}	//0.092592593 ���̷� ���� ����
				case(46){itemString = `id:18098`; iCumRate += 3;}	//0.092592593 ���̷��� �Ȱ�
				case(47){itemString = `id:18099`; iCumRate += 3;}	//0.092592593 ���̷� ���� ���� ����
				case(48){itemString = `id:18100`; iCumRate += 3;}	//0.092592593 ���̷� ���� ����
				case(49){itemString = `id:18101`; iCumRate += 3;}	//0.092592593 ���̷� ���� ���� ����
				case(50){itemString = `id:18102`; iCumRate += 3;}	//0.092592593 ���̷��� ����
				case(51){itemString = `id:15055`; iCumRate += 3;}	//0.092592593 ���� �̴� ���ǽ�
				case(52){itemString = `id:62005 suffix:30501 expire:960`; iCumRate += 3;}	//0.092592593 ��æƮ ��ũ�� (���̾�Ʈ)
				case(53){itemString = `id:46006 suffix:30302 expire:960`; iCumRate += 3;}	//0.092592593 ��æƮ ��ũ�� (�ں�Ʈ)
				case(54){itemString = `id:15053`; iCumRate += 3;}	//0.092592593 ī��Ʈ �ǵ�
				case(55){itemString = `id:40030`; iCumRate += 3;}	//0.092592593 �÷�Į�� ���ǽ�
				case(56){itemString = `id:17045`; iCumRate += 3;}	//0.092592593 �� �ڵ�� �ҵ�
				case(57){itemString = `id:14004`; iCumRate += 3;}	//0.092592593 ���� �� ���� ���� ����
				case(58){itemString = `id:17040`; iCumRate += 3;}	//0.092592593 Ŭ�ν� ����
				case(59){itemString = `id:14004`; iCumRate += 3;}	//0.092592593 ���� ��Ʈ�� ����
				case(60){itemString = `id:17040`; iCumRate += 3;}	//0.092592593 �̺� ���� ũ���
				case(61){itemString = `id:18521`; iCumRate += 3;}	//0.092592593 �����Ǿ� ����
				case(62){itemString = `id:15136`; iCumRate += 3;}	//0.092592593 ��� ���̽� ��ĿƮ
				case(63){itemString = `id:18525`; iCumRate += 3;}	//0.092592593 ���͵�� ĸ
				case(64){itemString = `id:18511`; iCumRate += 3;}	//0.092592593 �÷�Ʈ Ǯ �︧
				case(65){itemString = `id:18506`; iCumRate += 3;}	//0.092592593 �� ���� �︧
				case(66){itemString = `id:17505`; iCumRate += 3;}	//0.092592593 �÷���Ʈ ����
				case(67){itemString = `id:16505`; iCumRate += 3;}	//0.092592593 �÷���Ʈ ����
				case(68){itemString = `id:18502`; iCumRate += 3;}	//0.092592593 �� �︧
				case(69){itemString = `id:15014`; iCumRate += 3;}	//0.092592593 �Ĺ߲��� ��
				case(70){itemString = `id:18113`; iCumRate += 3;}	//0.092592593 ������ ����� ����
				case(71){itemString = `id:18114`; iCumRate += 3;}	//0.092592593 �ٹ��� ����� ����
				case(72){itemString = `id:18115`; iCumRate += 3;}	//0.092592593 �� ����� ����
				case(73){itemString = `id:62005 suffix:30702 expire:960`; iCumRate += 3;}	//0.092592593 ��æƮ ��ũ�� (���̺�)
				case(74){itemString = `id:62005 prefix:207 expire:960`; iCumRate += 3;}	//0.092592593 ��æƮ ��ũ�� (����
				case(75){itemString = `id:16517`; iCumRate += 24;}	//0.740740741 �ݴ� �尩
				case(76){itemString = `id:16516`; iCumRate += 24;}	//0.740740741 ���� �尩
				case(77){itemString = `id:16515`; iCumRate += 24;}	//0.740740741 �� �尩
				case(78){itemString = `id:16514`; iCumRate += 24;}	//0.740740741 ���� �尩
				case(79){itemString = `id:16513`; iCumRate += 24;}	//0.740740741 ���� �尩
				case(80){itemString = `id:40068`; iCumRate += 24;}	//0.740740741 ���� ��� ���ú�
				case(81){itemString = `id:40069`; iCumRate += 24;}	//0.740740741 ���� ��� ���ú�
				case(82){itemString = `id:40070`; iCumRate += 24;}	//0.740740741 �� ��� ���ú�
				case(83){itemString = `id:18112`; iCumRate += 24;}	//0.740740741 �¾� ����
				case(84){itemString = `id:18111`; iCumRate += 24;}	//0.740740741 ���� ����
				case(85){itemString = `id:18110`; iCumRate += 24;}	//0.740740741 ���� ����
				case(86){itemString = `id:18109`; iCumRate += 24;}	//0.740740741 ���� �� ����
				case(87){itemString = `id:18108`; iCumRate += 24;}	//0.740740741 ���� ����
				case(88){itemString = `id:18029`; iCumRate += 24;}	//0.740740741 ������ �Ȱ�
				case(89){itemString = `id:18028`; iCumRate += 24;}	//0.740740741 ���̽� �Ȱ�
				case(90){itemString = `id:19008`; iCumRate += 24;}	//0.740740741 ���� �Ǵ� �κ�
				case(91){itemString = `id:19009`; iCumRate += 24;}	//0.740740741 ���� ���� �κ�
				case(92){itemString = `id:19017`; iCumRate += 24;}	//0.740740741 ���� ���� �κ�
				case(93){itemString = `id:19016`; iCumRate += 24;}	//0.740740741 �� �κ�
				case(94){itemString = `id:40038`; iCumRate += 24;}	//0.740740741 ����Ʈ�� ����
				case(95){itemString = `id:40039`; iCumRate += 24;}	//0.740740741 ���̽� ����
				case(96){itemString = `id:40040`; iCumRate += 24;}	//0.740740741 ���̾� ����
				case(97){itemString = `id:40041`; iCumRate += 24;}	//0.740740741 Ÿ�ݿ� ����
				case(98){itemString = `id:40090`; iCumRate += 24;}	//0.740740741 ���� ����
				case(99){itemString = `id:40053`; iCumRate += 24;}	//0.740740741 ����� ��� �ɴٹ�
				case(100){itemString = `id:40051`; iCumRate += 24;}	//0.740740741 ����� ��� �Ѽ���
				case(101){itemString = `id:18089`; iCumRate += 24;}	//0.740740741 ����� ��� ���
				case(102){itemString = `id:40054`; iCumRate += 24;}	//0.740740741 �Ķ� ��� �ɴٹ�
				case(103){itemString = `id:40052`; iCumRate += 24;}	//0.740740741 �Ķ� ��� �Ѽ���
				case(104){itemString = `id:16500`; iCumRate += 24;}	//0.740740741 �ﳪ �������� �۷���
				case(105){itemString = `id:40056`; iCumRate += 24;}	//0.740740741 X ǥ����
				case(106){itemString = `id:18542`; iCumRate += 24;}	//0.740740741 �� ü�� Ǯ �︧
				case(107){itemString = `id:18543`; iCumRate += 24;}	//0.740740741 ���� Ǯ �︧
				case(108){itemString = `id:18544`; iCumRate += 24;}	//0.740740741 �縮ĭ ��������
				case(109){itemString = `id:18547`; iCumRate += 24;}	//0.740740741 �ĳ��� ��� ��������
				case(110){itemString = `id:19020`; iCumRate += 24;}	//0.740740741 ��Ÿ�� ����� ��Ʈ
				case(111){itemString = `id:62005`; iCumRate += 24;}	//0.740740741 ��æƮ ��ũ�� (���� ���ͣ�
				case(112){itemString = `id:16520`; iCumRate += 24;}	//0.740740741 �� ���� �۷���
				case(113){itemString = `id:15128`; iCumRate += 24;}	//0.740740741 �� �� ���� �巹��
				case(114){itemString = `id:16019`; iCumRate += 24;}	//0.740740741 �ٹ��� �ȸ� �尩
				case(115){itemString = `id:18047`; iCumRate += 24;}	//0.740740741 �ڷ��� ��Ʈ ����
				case(116){itemString = `id:18008`; iCumRate += 24;}	//0.740740741 ��Ʈ������ ĸ
				case(117){itemString = `id:15025`; iCumRate += 24;}	//0.740740741 �����б� ���ڱ���
				case(118){itemString = `id:18500`; iCumRate += 24;}	//0.740740741 �� ���� �︧
				case(119){itemString = `id:17504`; iCumRate += 24;}	//0.740740741 �������� �÷���Ʈ ����
				case(120){itemString = `id:18043`; iCumRate += 24;}	//0.740740741 �ڷ��� ��Ʈ ����
				case(121){itemString = `id:17506`; iCumRate += 24;}	//0.740740741 �ձ׸��� ����
				case(122){itemString = `id:18026`; iCumRate += 24;}	//0.740740741 ��� ���θ���
				case(123){itemString = `id:15052`; iCumRate += 24;}	//0.740740741 ��ũ�� ���� Ʃ��
				case(124){itemString = `id:19005`; iCumRate += 24;}	//0.740740741 ���÷� �κ�
				case(125){itemString = `id:18040`; iCumRate += 24;}	//0.740740741 �ڷ��� ���� ������
				case(126){itemString = `id:18038`; iCumRate += 24;}	//0.740740741 ���� �跿 ����
				case(127){itemString = `id:15042`; iCumRate += 24;}	//0.740740741 �ճ� ���ǽ�
				case(128){itemString = `id:46001`; iCumRate += 24;}	//0.740740741 ���� �ǵ�
				case(129){itemString = `id:40012`; iCumRate += 24;}	//0.740740741 �ٽ�Ÿ�� �ҵ�
				case(130){itemString = `id:91006 expire:43200`; iCumRate += 22;}	//0.679012346 10���� Ű�� �Ǵ� ����
				case(131){itemString = `id:91010 expire:43200`; iCumRate += 22;}	//0.679012346 11���� Ű�� �Ǵ� ����
				case(132){itemString = `id:91011 expire:43200`; iCumRate += 22;}	//0.679012346 12���� Ű�� �Ǵ� ����
				case(133){itemString = `id:91012 expire:43200`; iCumRate += 22;}	//0.679012346 13���� Ű�� �Ǵ� ����
				case(134){itemString = `id:91013 expire:43200`; iCumRate += 22;}	//0.679012346 14���� Ű�� �Ǵ� ����
				case(135){itemString = `id:91014 expire:43200`; iCumRate += 22;}	//0.679012346 15���� Ű�� �Ǵ� ����
				case(136){itemString = `id:91015 expire:43200`; iCumRate += 22;}	//0.679012346 16���� Ű�� �Ǵ� ����
				case(137){itemString = `id:91007 expire:43200`; iCumRate += 22;}	//0.679012346 17���� Ű�� �Ǵ� ����
				case(138){itemString = `id:63025 count:3`; iCumRate += 22;}	//0.679012346 ��뷮 �ູ�� ����
				case(139){itemString = `id:51031 count:3`; iCumRate += 22;}	//0.679012346 ���� ȸ���� ����
				case(140){itemString = `id:63026`; iCumRate += 22;}	//0.679012346 ���� ���� �̿��
				case(141){itemString = `id:63047`; iCumRate += 22;}	//0.679012346 ���� ������ �̿��
				case(142){itemString = `id:63043`; iCumRate += 22;}	//0.679012346 ���꽺�� ����
				case(143){itemString = `id:63043 count:3`; iCumRate += 22;}	//0.679012346 ���꽺�� ����
				case(144){itemString = `id:63027 expire:10080`; iCumRate += 22;}	//0.679012346 �ж� ����
				case(145){itemString = `id:63029 count:5`; iCumRate += 22;}	//0.679012346 ķ�����̾�ŰƮ
				case(146){itemString = `id:63044 count:3`; iCumRate += 22;}	//0.679012346 ��Ƽ ��Ȱ�� ����
				case(147){itemString = `id:63039 expire:10080`; iCumRate += 22;}	//0.679012346 ķ�� ŰƮ
				case(148){itemString = `id:51003 count:5`; iCumRate += 22;}	//0.679012346 ����� 50 ����
				case(149){itemString = `id:51004 count:3`; iCumRate += 22;}	//0.679012346 ����� 100 ����
				case(150){itemString = `id:51007`; iCumRate += 22;}	//0.679012346 ���� 30 ����
				case(151){itemString = `id:51008 count:5`; iCumRate += 22;}	//0.679012346 ���� 50 ����
				case(152){itemString = `id:51013 count:5`; iCumRate += 22;}	//0.679012346 ���¹̳� 50 ����
				case(153){itemString = `id:51014 count:3`; iCumRate += 22;}	//0.679012346 ���¹̳� 100 ����
				case(154){itemString = `id:51001 count:5`; iCumRate += 22;}	//0.679012346 ����� 10 ����
				case(155){itemString = `id:51002 count:3`; iCumRate += 22;}	//0.679012346 ����� 30 ����
				case(156){itemString = `id:51022 count:5`; iCumRate += 22;}	//0.679012346 ����°� ���� 30 ����
				case(157){itemString = `id:51027 count:5`; iCumRate += 22;}	//0.679012346 ����°� ���¹̳� 30 ����
				case(158){itemString = `id:51028 count:3`; iCumRate += 22;}	//0.679012346 ����°� ���¹̳� 50 ����
				case(159){itemString = `id:51029`; iCumRate += 22;}	//0.679012346 ����°� ���¹̳� 100 ����
				case(160){itemString = `id:63000`; iCumRate += 22;}	//0.679012346 �Ǵн��� ����
				case(161){itemString = `id:51036`; iCumRate += 22;}	//0.679012346 ���̾�Ʈ ���� U
				case(162){itemString = `id:51038`; iCumRate += 22;}	//0.679012346 ���̾�Ʈ ���� L
				case(163){itemString = `id:51039`; iCumRate += 22;}	//0.679012346 ���̾�Ʈ ���� F
				case(164){itemString = `id:17006`; iCumRate += 22;}	//0.679012346 õ�Ź�
				case(165){itemString = `id:18086`; iCumRate += 22;}	//0.679012346 ������ �� ���
				case(166){itemString = `id:18087`; iCumRate += 22;}	//0.679012346 ��� �� ���
				case(167){itemString = `id:18088`; iCumRate += 22;}	//0.679012346 ȭ��
				case(168){itemString = `id:18090`; iCumRate += 22;}	//0.679012346 �Ķ� ��� ���
				case(169){itemString = `id:40046`; iCumRate += 22;}	//0.679012346 ��� �Ѽ���
				case(170){itemString = `id:40047`; iCumRate += 22;}	//0.679012346 ��� �ɴٹ�
				case(171){itemString = `id:18541`; iCumRate += 22;}	//0.679012346 ��Ӹ� ����
				case(172){itemString = `id:18103`; iCumRate += 22;}	//0.679012346 ���� ����
				case(173){itemString = `id:40071`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(174){itemString = `id:40072`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(175){itemString = `id:40073`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(176){itemString = `id:40074`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(177){itemString = `id:40075`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(178){itemString = `id:40076`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(179){itemString = `id:40077`; iCumRate += 5;}	//0.154320988 '��' �� �� ��
				case(180){itemString = `id:60037 count:5`; iCumRate += 22;}	//0.679012346 �� ���� ����
				case(181){itemString = `id:60038 count:5`; iCumRate += 22;}	//0.679012346 ���� ����
				case(182){itemString = `id:62004 count:5`; iCumRate += 22;}	//0.679012346 ��������
				case(183){itemString = `id:50012`; iCumRate += 22;}	//0.679012346 Ȳ�� �ް�
				case(184){itemString = `id:50013`; iCumRate += 22;}	//0.679012346 Ȳ�� ���
				case(185){itemString = `id:50164 quality:100`; iCumRate += 22;}	//0.679012346 T�� ������ũ 100����Ƽ
				case(186){itemString = `id:50201 quality:100`; iCumRate += 22;}	//0.679012346 BnR 100����Ƽ
				case(187){itemString = `id:50123 quality:100`; iCumRate += 22;}	//0.679012346 ���������� 100����Ƽ
				case(188){itemString = `id:50124 quality:100`; iCumRate += 22;}	//0.679012346 ���� ������ũ 100����Ƽ
				case(189){itemString = `id:50202`; iCumRate += 22;}	//0.679012346 Ű�� �� �� ����
				case(190){itemString = `id:50203`; iCumRate += 22;}	//0.679012346 ���� ��������
				case(191){itemString = `id:2001`; iCumRate += 22;}	//0.679012346 ��ȭ�ָӴ�
				case(192){itemString = `id:2006`; iCumRate += 22;}	//0.679012346 ū ��ȭ�ָӴ�
				case(193){itemString = `id:18010`; iCumRate += 22;}	//0.679012346 ��� ����Ʈ ĸ
				case(194){itemString = `id:15131`; iCumRate += 22;}	//0.679012346 �� �������� ��ĿƮ
				case(195){itemString = `id:40015`; iCumRate += 22;}	//0.679012346 �÷�Ʈ �� �ҵ�
				case(196){itemString = `id:17016`; iCumRate += 22;}	//0.679012346 �ʵ� �Ĺ��
				case(197){itemString = `id:17015`; iCumRate += 22;}	//0.679012346 �Ĺ��
				case(198){itemString = `id:17005`; iCumRate += 22;}	//0.679012346 ��ɲ� �Ź�
				case(199){itemString = `id:17002`; iCumRate += 22;}	//0.679012346 �˻� �Ź�
				case(200){itemString = `id:17022`; iCumRate += 22;}	//0.679012346 ��������
				case(201){itemString = `id:17001`; iCumRate += 22;}	//0.679012346 ���� ����
				case(202){itemString = `id:17007`; iCumRate += 22;}	//0.679012346 ���� ����
				case(203){itemString = `id:16009`; iCumRate += 22;}	//0.679012346 ��ɲ��尩
				case(204){itemString = `id:40005`; iCumRate += 22;}	//0.679012346 �� �ҵ�
				case(205){itemString = `id:15031`; iCumRate += 22;}	//0.679012346 �����б� ����
				case(206){itemString = `id:19012`; iCumRate += 22;}	//0.679012346 Ʈ��� ���̾�� �κ�
				case(207){itemString = `id:18004`; iCumRate += 22;}	//0.679012346 ��� �мǸ���
				case(208){itemString = `id:15132`; iCumRate += 22;}	//0.679012346 ���߷� ����Ʈ ����
				case(209){itemString = `id:15043`; iCumRate += 22;}	//0.679012346 ����Ƽ ���Ʈ
				case(210){itemString = `id:40010`; iCumRate += 22;}	//0.679012346 @�� �ҵ�
				case(211){itemString = `id:40081`; iCumRate += 22;}	//0.679012346 @���� �� ����
				case(212){itemString = `id:40078`; iCumRate += 22;}	//0.679012346 @����Ͻ�
				case(213){itemString = `id:40079`; iCumRate += 22;}	//0.679012346 @���̽�
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
	else //if(GetLocale().LowerCase()== `japan`) //�Ϻ��� ��츸�� Ưȭ�Ϸ��� ���� �� ����ϴµ�.. ����� �߱� �ƴ� �ٸ� ������ �̰� ����ϴϱ� �� else���� ���� �ֽ��ϴ�. ���߿� �Ϻ��� �߰��ϴ����� else�� �����������鿡 �� ������ ����� �մϴ�.
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(2091);	//Ȯ���� ������ ���´�

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15251`; iCumRate += 1;} //0.0478240077 2091���̵� �ǻ� �� Ÿ��
				case(1){itemString = `id:15250`; iCumRate += 1;} //0.0478240077 2091���̵� �ǻ� ��Ʈ Ÿ��
				case(2){itemString = `id:15252`; iCumRate += 1;} //0.0478240077 2091���� �ǻ�
				case(3){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate += 1;} //0.0478240077 2091��� ���������
				case(4){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate += 1;} //0.0478240077 2091��� ����ì ������ ����
				case(5){itemString = `id:15117 suffix:31202`; iCumRate += 2;} //0.0956480153 2091������ ������ ���壨��Į��
				case(6){itemString = `id:15117 suffix:31301`; iCumRate += 2;} //0.0956480153 2091������ ������ ���壨�����ʱ�����
				case(7){itemString = `id:15116 suffix:31202`; iCumRate += 2;} //0.0956480153 2091������ ������ ���壨��Į��
				case(8){itemString = `id:15116 suffix:31301`; iCumRate += 2;} //0.0956480153 2091������ ������ ���壨�����ʱ�����
				case(9){itemString = `id:18176`; iCumRate += 2;} //0.0956480153 2091���̵� �Ӹ���
				case(10){itemString = `id:15079`; iCumRate += 4;} //0.1912960306 2091������ �� ���� ��ĿƮ
				case(11){itemString = `id:15112 durability:19000 durability_max:19000`; iCumRate += 4;} //0.1912960306 2091������ �����̷�
				case(12){itemString = `id:15108 durability:19000 durability_max:19000`; iCumRate += 4;} //0.1912960306 2091���� ���̵� ��ũž
				case(13){itemString = `id:17042 durability:17000 durability_max:17000`; iCumRate += 4;} //0.1912960306 2091�ڷ��� ������Ż �� ����
				case(14){itemString = `id:15063 durability:10000 durability_max:10000`; iCumRate += 4;} //0.1912960306 2091���̾�� ���� ���ǽ�
				case(15){itemString = `id:15113`; iCumRate += 4;} //0.1912960306 2091������ �˻��б� ���� ��ƮŸ��
				case(16){itemString = `id:15061 durability:20000 durability_max:20000`; iCumRate += 4;} //0.1912960306 2091���ṫ�� ��Ʈ�� Ʃ��
				case(17){itemString = `id:15059 durability:30000 durability_max:30000`; iCumRate += 4;} //0.1912960306 2091��ũ�� ��ũž �ݹ���
				case(18){itemString = `id:15065`; iCumRate += 4;} //0.1912960306 2091���� ����Ʈ ��ĿƮ
				case(19){itemString = `id:15074 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091���̽� ������ ��Ʈ
				case(20){itemString = `id:63034 col1:c00000`; iCumRate += 4;} //0.1912960306 2091������ ���� ����(�� ����)
				case(21){itemString = `id:63033 col1:000000`; iCumRate += 4;} //0.1912960306 2091������ ���� ����(�� ����)
				case(22){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091���� �̴� ��ĿƮ
				case(23){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 4;} //0.1912960306 2091���̳��巹��
				case(24){itemString = `id:18044`; iCumRate += 4;} //0.1912960306 2091���˿� ����
				case(25){itemString = `id:16519`; iCumRate += 4;} //0.1912960306 2091��ȣȭ �尩
				case(26){itemString = `id:18046`; iCumRate += 4;} //0.1912960306 2091�հ��� �Ӹ����
				case(27){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 4;} //0.1912960306 2091Ŭ���� ������ ����
				case(28){itemString = `id:15060`; iCumRate += 4;} //0.1912960306 2091���� �̳ʷκ� ����
				case(29){itemString = `id:17041`; iCumRate += 4;} //0.1912960306 2091�������� ���ú���
				case(30){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091���̵� ���� �巹��
				case(31){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091���ĵ�Į�� �����긮��
				case(32){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091�߱� ���÷� �κ�
				case(33){itemString = `id:18060`; iCumRate += 4;} //0.1912960306 2091�� �䳢 �Ӹ���5
				case(34){itemString = `id:18065`; iCumRate += 4;} //0.1912960306 2091���� �䳢 �Ӹ���5
				case(35){itemString = `id:18070`; iCumRate += 4;} //0.1912960306 2091�� �䳢 �Ӹ���5
				case(36){itemString = `id:18051`; iCumRate += 4;} //0.1912960306 2091�ڷ��� ���� ����
				case(37){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate += 4;} //0.1912960306 2091�ڷ��� ���ڽ�Ʈ
				case(38){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091����ǳ ���纹
				case(39){itemString = `id:15055`; iCumRate += 10;} //0.4782400765 2091���� �̴� ���ǽ�
				case(40){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.4782400765 2091��æƮ�����̾�Ʈ��
				case(41){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.4782400765 2091��æƮ���ں�Ʈ��
				case(42){itemString = `id:46006`; iCumRate += 10;} //0.4782400765 2091ī��Ʈ �ǵ�
				case(43){itemString = `id:15053`; iCumRate += 10;} //0.4782400765 2091�÷�Į�� ���ǽ�
				case(44){itemString = `id:17045`; iCumRate += 10;} //0.4782400765 2091���� �� ���� ���� ����
				case(45){itemString = `id:17040`; iCumRate += 10;} //0.4782400765 2091���� ��Ʈ�� ����
				case(46){itemString = `id:15136`; iCumRate += 10;} //0.4782400765 2091��� ���̽� ��ĿƮ
				case(47){itemString = `id:18525`; iCumRate += 10;} //0.4782400765 2091���͵�� ĸ
				case(48){itemString = `id:15014`; iCumRate += 10;} //0.4782400765 2091�Ĺ߲��� ��
				case(49){itemString = `id:18113`; iCumRate += 10;} //0.4782400765 2091������ ����� ����
				case(50){itemString = `id:18114`; iCumRate += 10;} //0.4782400765 2091�ٹ��� ����� ����
				case(51){itemString = `id:18115`; iCumRate += 10;} //0.4782400765 2091�� ����� ����
				case(52){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.4782400765 2091��æƮ�����̺죩
				case(53){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.4782400765 2091��æƮ��������
				case(54){itemString = `id:63030 col1:ffffff`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(55){itemString = `id:63030 col1:00c000`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(56){itemString = `id:63030 col1:0000c0`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(57){itemString = `id:63030 col1:c0c000`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(58){itemString = `id:63030 col1:c000c0`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(59){itemString = `id:63030 col1:00c0c0`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ���ã��� ������
				case(60){itemString = `id:15029`; iCumRate += 10;} //0.4782400765 2091��ũ �������̿�
				case(61){itemString = `id:15151`; iCumRate += 10;} //0.4782400765 2091���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(62){itemString = `id:15152`; iCumRate += 10;} //0.4782400765 2091���帶���� ���̽�Ʈ ���Ϸ� ��������룩
				case(63){itemString = `id:15153`; iCumRate += 10;} //0.4782400765 2091���� �������� ��Ʈ�������룩
				case(64){itemString = `id:15154`; iCumRate += 10;} //0.4782400765 2091���� �������� ��Ʈ�������룩
				case(65){itemString = `id:15032`; iCumRate += 10;} //0.4782400765 2091������ �ݹ���
				case(66){itemString = `id:15045`; iCumRate += 10;} //0.4782400765 2091���̽� �÷�Ŷ ����
				case(67){itemString = `id:15026`; iCumRate += 10;} //0.4782400765 2091������ �ս�ĿƮ
				case(68){itemString = `id:15016`; iCumRate += 10;} //0.4782400765 2091����� ��Ÿŷ ������
				case(69){itemString = `id:15051`; iCumRate += 10;} //0.4782400765 2091Ÿ��Ʈ ��Ʈ ����
				case(70){itemString = `id:19031`; iCumRate += 10;} //0.4782400765 2091��Ÿ����Ʈ �κ�
				case(71){itemString = `id:18011`; iCumRate += 10;} //0.4782400765 2091��� ������ ĸ
				case(72){itemString = `id:18124`; iCumRate += 10;} //0.4782400765 2091���� �������� ��Ʈ ĸ
				case(73){itemString = `id:18009`; iCumRate += 10;} //0.4782400765 2091��� ���� ĸ
				case(74){itemString = `id:18014`; iCumRate += 10;} //0.4782400765 2091��� ����
				case(75){itemString = `id:18000`; iCumRate += 10;} //0.4782400765 2091��ũ ����
				case(76){itemString = `id:16013`; iCumRate += 10;} //0.4782400765 2091�˻� �尩
				case(77){itemString = `id:16032`; iCumRate += 10;} //0.4782400765 2091���� �۷���
				case(78){itemString = `id:63030`; iCumRate += 10;} //0.4782400765 2091���� ���� ���� ����
				case(79){itemString = `id:18112`; iCumRate += 15;} //0.7173601148 2091�� ���� ��ǰ
				case(80){itemString = `id:18111`; iCumRate += 15;} //0.7173601148 2091���� ���� ��ǰ
				case(81){itemString = `id:18110`; iCumRate += 15;} //0.7173601148 2091���� ���� ��ǰ
				case(82){itemString = `id:18109`; iCumRate += 15;} //0.7173601148 2091���� ���� ��ǰ
				case(83){itemString = `id:18108`; iCumRate += 15;} //0.7173601148 2091���� ���� ��ǰ
				case(84){itemString = `id:18029`; iCumRate += 15;} //0.7173601148 2091������ �Ȱ�
				case(85){itemString = `id:18028`; iCumRate += 15;} //0.7173601148 2091���̽� �Ȱ�
				case(86){itemString = `id:19008`; iCumRate += 15;} //0.7173601148 2091���� �Ǵ� �κ�
				case(87){itemString = `id:19009`; iCumRate += 15;} //0.7173601148 2091���� ���� �κ�
				case(88){itemString = `id:19017`; iCumRate += 15;} //0.7173601148 2091���� �κ�
				case(89){itemString = `id:19016`; iCumRate += 15;} //0.7173601148 2091�� �κ�
				case(90){itemString = `id:40053`; iCumRate += 15;} //0.7173601148 2091����� ��� �ɴٹ�
				case(91){itemString = `id:40051`; iCumRate += 15;} //0.7173601148 2091����� ��� �Ѽ���
				case(92){itemString = `id:18089`; iCumRate += 15;} //0.7173601148 2091����� ��� ���
				case(93){itemString = `id:40054`; iCumRate += 15;} //0.7173601148 2091�Ķ� ��� �ɴٹ�
				case(94){itemString = `id:40052`; iCumRate += 15;} //0.7173601148 2091�Ķ� ��� �Ѽ���
				case(95){itemString = `id:16500`; iCumRate += 15;} //0.7173601148 2091�ﳪ �������� �۷���
				case(96){itemString = `id:19020`; iCumRate += 15;} //0.7173601148 2091��Ÿ�� ����� ��Ʈ
				case(97){itemString = `id:62005 prefix:7`; iCumRate += 15;} //0.7173601148 2091��æƮ���������ͣ�
				case(98){itemString = `id:16520`; iCumRate += 15;} //0.7173601148 2091�� ���� �۷���
				case(99){itemString = `id:15128`; iCumRate += 15;} //0.7173601148 2091�� �� ���� �巹��
				case(100){itemString = `id:16019`; iCumRate += 15;} //0.7173601148 2091�ٹ��� �ȸ� �尩
				case(101){itemString = `id:18047`; iCumRate += 15;} //0.7173601148 2091�ڷ��� ��Ʈ ����
				case(102){itemString = `id:18008`; iCumRate += 15;} //0.7173601148 2091��Ʈ������ ĸ
				case(103){itemString = `id:15025`; iCumRate += 15;} //0.7173601148 2091�����б� ���ڱ���
				case(104){itemString = `id:18043`; iCumRate += 15;} //0.7173601148 2091�ڷ��� ��Ʈ ����
				case(105){itemString = `id:18026`; iCumRate += 15;} //0.7173601148 2091��� ���θ���
				case(106){itemString = `id:15052`; iCumRate += 15;} //0.7173601148 2091��ũ�� ���� Ʃ��
				case(107){itemString = `id:19005`; iCumRate += 15;} //0.7173601148 2091���÷� �κ�
				case(108){itemString = `id:18040`; iCumRate += 15;} //0.7173601148 2091�ڷ��� ���� ������
				case(109){itemString = `id:18038`; iCumRate += 15;} //0.7173601148 2091���� �跿 ����
				case(110){itemString = `id:15042`; iCumRate += 15;} //0.7173601148 2091�ճ� ���ǽ�
				case(111){itemString = `id:91006 expire:43200`; iCumRate += 15;} //0.7173601148 209110���� Ű�� �Ǵ� ����
				case(112){itemString = `id:91010 expire:43200`; iCumRate += 15;} //0.7173601148 209111���� Ű�� �Ǵ� ����
				case(113){itemString = `id:91011 expire:43200`; iCumRate += 15;} //0.7173601148 209112���� Ű�� �Ǵ� ����
				case(114){itemString = `id:91012 expire:43200`; iCumRate += 15;} //0.7173601148 209113���� Ű�� �Ǵ� ����
				case(115){itemString = `id:91013 expire:43200`; iCumRate += 15;} //0.7173601148 209114���� Ű�� �Ǵ� ����
				case(116){itemString = `id:91014 expire:43200`; iCumRate += 15;} //0.7173601148 209115���� Ű�� �Ǵ� ����
				case(117){itemString = `id:91015 expire:43200`; iCumRate += 15;} //0.7173601148 209116���� Ű�� �Ǵ� ����
				case(118){itemString = `id:91007 expire:43200`; iCumRate += 15;} //0.7173601148 209117���� Ű�� �Ǵ� ����
				case(119){itemString = `id:63025 count:3`; iCumRate += 15;} //0.7173601148 2091��뷮 �ູ�� ����
				case(120){itemString = `id:51031 count:3`; iCumRate += 15;} //0.7173601148 2091���� ȸ���� ����
				case(121){itemString = `id:51036`; iCumRate += 15;} //0.7173601148 2091���̾�Ʈ ���� U
				case(122){itemString = `id:51038`; iCumRate += 15;} //0.7173601148 2091���̾�Ʈ ���� L
				case(123){itemString = `id:51039`; iCumRate += 15;} //0.7173601148 2091���̾�Ʈ ���� F
				case(124){itemString = `id:17006`; iCumRate += 15;} //0.7173601148 2091õ�Ź�
				case(125){itemString = `id:18086`; iCumRate += 15;} //0.7173601148 2091������ �� ���
				case(126){itemString = `id:18087`; iCumRate += 15;} //0.7173601148 2091��� �� ���
				case(127){itemString = `id:18088`; iCumRate += 15;} //0.7173601148 2091ȭ��
				case(128){itemString = `id:18090`; iCumRate += 15;} //0.7173601148 2091�Ķ� ��� ���
				case(129){itemString = `id:40046`; iCumRate += 15;} //0.7173601148 2091��� �Ѽ���
				case(130){itemString = `id:40047`; iCumRate += 15;} //0.7173601148 2091��� �ɴٹ�
				case(131){itemString = `id:18541`; iCumRate += 15;} //0.7173601148 2091��Ӹ� ����
				case(132){itemString = `id:18103`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(133){itemString = `id:60037 count:5`; iCumRate += 15;} //0.7173601148 2091�� ���� ����
				case(134){itemString = `id:60038 count:5`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(135){itemString = `id:18010`; iCumRate += 15;} //0.7173601148 2091��� ����Ʈ ĸ
				case(136){itemString = `id:15131`; iCumRate += 15;} //0.7173601148 2091�� �������� ��ĿƮ
				case(137){itemString = `id:17016`; iCumRate += 15;} //0.7173601148 2091�ʵ� �Ĺ��
				case(138){itemString = `id:17015`; iCumRate += 15;} //0.7173601148 2091�Ĺ��
				case(139){itemString = `id:17005`; iCumRate += 15;} //0.7173601148 2091��ɲ� �Ź�
				case(140){itemString = `id:17002`; iCumRate += 15;} //0.7173601148 2091�˻� �Ź�
				case(141){itemString = `id:17022`; iCumRate += 15;} //0.7173601148 2091��������
				case(142){itemString = `id:17001`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(143){itemString = `id:17007`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(144){itemString = `id:16009`; iCumRate += 15;} //0.7173601148 2091��ɲ��尩
				case(145){itemString = `id:15031`; iCumRate += 15;} //0.7173601148 2091�����б��� ���� ����
				case(146){itemString = `id:19012`; iCumRate += 15;} //0.7173601148 2091Ʈ��� ���̾�� �κ�
				case(147){itemString = `id:18004`; iCumRate += 15;} //0.7173601148 2091��� �мǸ���
				case(148){itemString = `id:15132`; iCumRate += 15;} //0.7173601148 2091���߷� ����Ʈ ����
				case(149){itemString = `id:15043`; iCumRate += 15;} //0.7173601148 2091����Ƽ ���Ʈ
				case(150){itemString = `id:17017`; iCumRate += 15;} //0.7173601148 2091������Ʈ ����
				case(151){itemString = `id:16006`; iCumRate += 15;} //0.7173601148 2091����� �尩
				case(152){itemString = `id:16017`; iCumRate += 15;} //0.7173601148 2091���Ĵٵ� �۷���
				case(153){itemString = `id:17060`; iCumRate += 15;} //0.7173601148 2091���� �������� ��Ʈ ����(������)
				case(154){itemString = `id:17061`; iCumRate += 15;} //0.7173601148 2091���� �������� ��Ʈ ����(������)
				case(155){itemString = `id:17019`; iCumRate += 15;} //0.7173601148 2091�������� �Ź�
				case(156){itemString = `id:17067`; iCumRate += 15;} //0.7173601148 2091���� Ÿ�� �� ����
				case(157){itemString = `id:17008`; iCumRate += 15;} //0.7173601148 2091�ڷ��� �����������룩
				case(158){itemString = `id:17010`; iCumRate += 15;} //0.7173601148 2091�ڷ��� �����������룩
				case(159){itemString = `id:17023`; iCumRate += 15;} //0.7173601148 2091������ �Ź�
				case(160){itemString = `id:16031`; iCumRate += 15;} //0.7173601148 2091�������� Ÿ��Ʈ �۷���
				case(161){itemString = `id:16026`; iCumRate += 15;} //0.7173601148 2091���� �������� ��Ʈ �۷���
				case(162){itemString = `id:16016`; iCumRate += 15;} //0.7173601148 2091����Ʈ �۷���
				case(163){itemString = `id:17003`; iCumRate += 15;} //0.7173601148 2091���� �Źߣ������룩
				case(164){itemString = `id:17024`; iCumRate += 15;} //0.7173601148 2091��� ����
				case(165){itemString = `id:17013`; iCumRate += 15;} //0.7173601148 2091�β��� ����
				case(166){itemString = `id:17069`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(167){itemString = `id:15020`; iCumRate += 15;} //0.7173601148 2091�ڷ��� �����巹��
				case(168){itemString = `id:15044`; iCumRate += 15;} //0.7173601148 2091����� �۾���
				case(169){itemString = `id:15041`; iCumRate += 15;} //0.7173601148 2091�繫�� ������ ��Ʈ
				case(170){itemString = `id:15027`; iCumRate += 15;} //0.7173601148 2091��� �ս�ĿƮ
				case(171){itemString = `id:15018`; iCumRate += 15;} //0.7173601148 2091��� �����ڿʣ������룩
				case(172){itemString = `id:15033`; iCumRate += 15;} //0.7173601148 2091��� �����ڿ�(�����룩
				case(173){itemString = `id:15023`; iCumRate += 15;} //0.7173601148 2091��ũ ��ɲۿʣ������룩
				case(174){itemString = `id:15035`; iCumRate += 15;} //0.7173601148 2091��ũ ��ɲۿʣ������룩
				case(175){itemString = `id:19003`; iCumRate += 15;} //0.7173601148 2091Ʈ���ݷθ� �κ�
				case(176){itemString = `id:63024 expire:10080`; iCumRate += 15;} //0.7173601148 2091���� ����
				case(177){itemString = `id:18002`; iCumRate += 15;} //0.7173601148 2091��� ĸ
				case(178){itemString = `id:18007`; iCumRate += 15;} //0.7173601148 2091���� ĸ
				case(179){itemString = `id:18013`; iCumRate += 15;} //0.7173601148 2091�ڷ��� ĸ
				case(180){itemString = `id:18156`; iCumRate += 15;} //0.7173601148 2091��� ����
				case(181){itemString = `id:18042`; iCumRate += 15;} //0.7173601148 2091�ڷ��� ����� ����
				case(182){itemString = `id:18003`; iCumRate += 15;} //0.7173601148 2091������ ĸ
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
}
