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
}
