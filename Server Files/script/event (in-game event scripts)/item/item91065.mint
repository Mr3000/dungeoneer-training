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
	//�븸 3�ֳ� ��� ��í��
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(4709);	//Ȯ���� ������ ���´�
	meta_array itemArray;

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){iCumRate += 1;}
			case(1){iCumRate += 1;}
			case(2){iCumRate += 1;}
			case(3){iCumRate += 1;}
			case(4){iCumRate += 1;}
			case(5){iCumRate += 1;}
			case(6){iCumRate += 1;}
			case(7){iCumRate += 1;}
			case(8){iCumRate += 1;}
			case(9){iCumRate += 1;}
			case(10){iCumRate += 1;}
			case(11){iCumRate += 1;}
			case(12){iCumRate += 1;}
			case(13){iCumRate += 2;}
			case(14){iCumRate += 2;}
			case(15){iCumRate += 2;}
			case(16){iCumRate += 2;}
			case(17){iCumRate += 2;}
			case(18){iCumRate += 2;}
			case(19){iCumRate += 2;}
			case(20){iCumRate += 2;}
			case(21){iCumRate += 2;}
			case(22){iCumRate += 2;}
			case(23){iCumRate += 4;}
			case(24){iCumRate += 4;}
			case(25){iCumRate += 4;}
			case(26){iCumRate += 4;}
			case(27){iCumRate += 4;}
			case(28){iCumRate += 4;}
			case(29){iCumRate += 4;}
			case(30){iCumRate += 4;}
			case(31){iCumRate += 4;}
			case(32){iCumRate += 4;}
			case(33){iCumRate += 4;}
			case(34){iCumRate += 4;}
			case(35){iCumRate += 4;}
			case(36){iCumRate += 8;}
			case(37){iCumRate += 8;}
			case(38){iCumRate += 8;}
			case(39){iCumRate += 8;}
			case(40){iCumRate += 8;}
			case(41){iCumRate += 8;}
			case(42){iCumRate += 8;}
			case(43){iCumRate += 8;}
			case(44){iCumRate += 8;}
			case(45){iCumRate += 8;}
			case(46){iCumRate += 16;}
			case(47){iCumRate += 16;}
			case(48){iCumRate += 16;}
			case(49){iCumRate += 16;}
			case(50){iCumRate += 16;}
			case(51){iCumRate += 16;}
			case(52){iCumRate += 32;}
			case(53){iCumRate += 32;}
			case(54){iCumRate += 32;}
			case(55){iCumRate += 32;}
			case(56){iCumRate += 32;}
			case(57){iCumRate += 32;}
			case(58){iCumRate += 32;}
			case(59){iCumRate += 32;}
			case(60){iCumRate += 32;}
			case(61){iCumRate += 32;}
			case(62){iCumRate += 32;}
			case(63){iCumRate += 48;}
			case(64){iCumRate += 48;}
			case(65){iCumRate += 48;}
			case(66){iCumRate += 48;}
			case(67){iCumRate += 48;}
			case(68){iCumRate += 48;}
			case(69){iCumRate += 48;}
			case(70){iCumRate += 48;}
			case(71){iCumRate += 48;}
			case(72){iCumRate += 48;}
			case(73){iCumRate += 48;}
			case(74){iCumRate += 64;}
			case(75){iCumRate += 64;}
			case(76){iCumRate += 64;}
			case(77){iCumRate += 64;}
			case(78){iCumRate += 64;}
			case(79){iCumRate += 64;}
			case(80){iCumRate += 64;}
			case(81){iCumRate += 64;}
			case(82){iCumRate += 64;}
			case(83){iCumRate += 64;}
			case(84){iCumRate += 64;}
			case(85){iCumRate += 64;}
			case(86){iCumRate += 80;}
			case(87){iCumRate += 80;}
			case(88){iCumRate += 80;}
			case(89){iCumRate += 80;}
			case(90){iCumRate += 80;}
			case(91){iCumRate += 96;}
			case(92){iCumRate += 96;}
			case(93){iCumRate += 96;}
			case(94){iCumRate += 96;}
			case(95){iCumRate += 96;}
			case(96){iCumRate += 96;}
			case(97){iCumRate += 96;}
			case(98){iCumRate += 96;}
			case(99){iCumRate += 96;}
			case(100){iCumRate += 96;}
			case(101){iCumRate += 96;}
			case(102){iCumRate += 96;}
			case(103){iCumRate += 128;}
			case(104){iCumRate += 112;}
			case(105){iCumRate += 112;}
			case(106){iCumRate += 112;}
			case(107){iCumRate += 112;}
			case(108){iCumRate += 112;}
			case(109){iCumRate += 112;}
			case(110){iCumRate += 112;}
			case(111){iCumRate += 112;}
			case(112){iCumRate += 112;}
			case(113){iCumRate += 112;}
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:14049`; itemArray.Add(itemString);} //0.021235931 �߸����� ���� ���� (������)
				case(1){itemString = `id:14050`; itemArray.Add(itemString);} //0.021235931 �߸����� ���� ���� (������)
				case(2){itemString = `id:16055`; itemArray.Add(itemString);} //0.021235931 �߸����� ���� �尩 (������)
				case(3){itemString = `id:16056`; itemArray.Add(itemString);} //0.021235931 �߸����� ���� �尩 (������)
				case(4){itemString = `id:14047`; itemArray.Add(itemString);} //0.021235931 �Ҳ� ���� ���� �Ƹ� (������)
				case(5){itemString = `id:14048`; itemArray.Add(itemString);} //0.021235931 �Ҳ� ���� ���� �Ƹ� (������)
				case(6){itemString = `id:16054`; itemArray.Add(itemString);} //0.021235931 �Ҳ� ���� ���� �۷���
				case(7){itemString = `id:17130`; itemArray.Add(itemString);} //0.021235931 �Ҳ� ���� ���� ����
				case(8){itemString = `id:18559`; itemArray.Add(itemString);} //0.021235931 �Ҳ� ���� ���� ĸ
				case(9){itemString = `id:15323`; itemArray.Add(itemString);} //0.021235931 �˶�� �ڽ�Ƭ
				case(10){itemString = `id:18562`; itemArray.Add(itemString);} //0.021235931 �˶�� ����
				case(11){itemString = `id:15324`; itemArray.Add(itemString);} //0.021235931 �ڽ��� �ڽ�Ƭ
				case(12){itemString = `id:18563`; itemArray.Add(itemString);} //0.021235931 �ڽ��� ����ũ
				case(13){itemString = `id:17130`; itemArray.Add(itemString);} //0.042471862 �˶�� ����
				case(14){itemString = `id:15234`; itemArray.Add(itemString);} //0.042471862 ������Ʈ ��� ��Ʈ
				case(15){itemString = `id:15269`; itemArray.Add(itemString);} //0.042471862 �׾��� ���� ��
				case(16){itemString = `id:15252`; itemArray.Add(itemString);} //0.042471862 ���� �ǻ�
				case(17){itemString = `id:15251`; itemArray.Add(itemString);} //0.042471862 ���̵� �ǻ� ��Ÿ��
				case(18){itemString = `id:18176`; itemArray.Add(itemString);} //0.042471862 ���̵� �Ӹ���
				case(19){itemString = `id:40227`; itemArray.Add(itemString);} //0.042471862 ��Ƽ�� ���� ����
				case(20){itemString = `id:40228`; itemArray.Add(itemString);} //0.042471862 ���̴Ͼ� ������ ��
				case(21){itemString = `id:40229`; itemArray.Add(itemString);} //0.042471862 �������� ����� Ȱ
				case(22){itemString = `id:40230`; itemArray.Add(itemString);} //0.042471862 ������ ���ڹ���
				case(23){itemString = `id:14043`; itemArray.Add(itemString);} //0.084943725 ���� ũ���� �Ƹ�
				case(24){itemString = `id:18182`; itemArray.Add(itemString);} //0.084943725 �׾��� �Ӹ� ���
				case(25){itemString = `id:18548`; itemArray.Add(itemString);} //0.084943725 @����ƾ �ǹ� ����Ʈ �︧
				case(26){itemString = `id:18549`; itemArray.Add(itemString);} //0.084943725 @�巡�� �縯�� �︧
				case(27){itemString = `id:19027`; itemArray.Add(itemString);} //0.084943725 @�ҷ��� ��Ʈ �κ�
				case(28){itemString = `id:19028`; itemArray.Add(itemString);} //0.084943725 @�ҷ��� ��ġ �κ�
				case(29){itemString = `id:40171`; itemArray.Add(itemString);} //0.084943725 ���繫��
				case(30){itemString = `id:40193`; itemArray.Add(itemString);} //0.084943725 ���󸶻�
				case(31){itemString = `id:40195`; itemArray.Add(itemString);} //0.084943725 ��ù���
				case(32){itemString = `id:46010`; itemArray.Add(itemString);} //0.084943725 @�巡�� �ǵ�
				case(33){itemString = `id:18187`; itemArray.Add(itemString);} //0.084943725 Ŀ�ٶ� ����
				case(34){itemString = `id:18188`; itemArray.Add(itemString);} //0.084943725 �ȴ�
				case(35){itemString = `id:18189`; itemArray.Add(itemString);} //0.084943725 ī�캸�� ����
				case(36){itemString = `id:15220`; itemArray.Add(itemString);} //0.16988745 @�ֵ�̷� ��Ʈ(������)
				case(37){itemString = `id:15221`; itemArray.Add(itemString);} //0.16988745 @�ֵ�̷� ��Ʈ(������)
				case(38){itemString = `id:18154`; itemArray.Add(itemString);} //0.16988745 @�ֵ�̷� ����(������)
				case(39){itemString = `id:18155`; itemArray.Add(itemString);} //0.16988745 @�ֵ�̷� ����(������)
				case(40){itemString = `id:15174`; itemArray.Add(itemString);} //0.16988745 @���� ��Ʈ ����
				case(41){itemString = `id:15258`; itemArray.Add(itemString);} //0.16988745 @��Ű ��ġ �巹��
				case(42){itemString = `id:17525`; itemArray.Add(itemString);} //0.16988745 @���� ũ���� �׸���
				case(43){itemString = `id:15112`; itemArray.Add(itemString);} //0.16988745 @������ �����̷�
				case(44){itemString = `id:15175`; itemArray.Add(itemString);} //0.16988745 ������ ��īŸ
				case(45){itemString = `id:15176`; itemArray.Add(itemString);} //0.16988745 ������ ��īŸ
				case(46){itemString = `id:17080`; itemArray.Add(itemString);} //0.339774899 �Ϻ� ���� �Ź�
				case(47){itemString = `id:40198`; itemArray.Add(itemString);} //0.339774899 ��ư�
				case(48){itemString = `id:81130`; itemArray.Add(itemString);} //0.339774899 ��ť���� ���ĵ� ���1
				case(49){itemString = `id:81131`; itemArray.Add(itemString);} //0.339774899 ��ť���� ���ĵ� ���2
				case(50){itemString = `id:81132`; itemArray.Add(itemString);} //0.339774899 ��ť���� ���ĵ� ���3
				case(51){itemString = `id:81133`; itemArray.Add(itemString);} //0.339774899 ��ť���� ���ĵ� ���4
				case(52){itemString = `id:14027`; itemArray.Add(itemString);} //0.679549798 @�귡��Ʈ ���� �Ƹ�
				case(53){itemString = `id:14028`; itemArray.Add(itemString);} //0.679549798 �����׹� ����(������)
				case(54){itemString = `id:14029`; itemArray.Add(itemString);} //0.679549798 �����׹� ����(������)
				case(55){itemString = `id:14019`; itemArray.Add(itemString);} //0.679549798 @�׷��̽� �÷���Ʈ �Ƹ�
				case(56){itemString = `id:19031`; itemArray.Add(itemString);} //0.679549798 @��Ÿ����Ʈ �κ�
				case(57){itemString = `id:18133`; itemArray.Add(itemString);} //0.679549798 @��Ŭ �̾
				case(58){itemString = `id:18134`; itemArray.Add(itemString);} //0.679549798 @���̾Ƹ�� ������ �̾
				case(59){itemString = `id:18135`; itemArray.Add(itemString);} //0.679549798 @���� �̾
				case(60){itemString = `id:13038`; itemArray.Add(itemString);} //0.679549798 @����ƾ �ǹ� ����Ʈ �Ƹ�
				case(61){itemString = `id:14036`; itemArray.Add(itemString);} //0.679549798 @Ƽ���� �Ƹ�(������)
				case(62){itemString = `id:14037`; itemArray.Add(itemString);} //0.679549798 @Ƽ���� �Ƹ�(������)
				case(63){itemString = `id:15113`; itemArray.Add(itemString);} //1.019324697 ������ �˻��б� ���� ��ƮŸ��
				case(64){itemString = `id:15114`; itemArray.Add(itemString);} //1.019324697 ������ �˻��б� ���� ��Ÿ��
				case(65){itemString = `id:15180`; itemArray.Add(itemString);} //1.019324697 @�Ƶ��� ���߷� ��ũ����(������)
				case(66){itemString = `id:15181`; itemArray.Add(itemString);} //1.019324697 @�����ö��� ��ũ ����(������)
				case(67){itemString = `id:16524`; itemArray.Add(itemString);} //1.019324697 @����ƾ �ǹ� ����Ʈ ��극�̽�
				case(68){itemString = `id:16531`; itemArray.Add(itemString);} //1.019324697 @Ƽ���� ��Ʋ��
				case(69){itemString = `id:17517`; itemArray.Add(itemString);} //1.019324697 @����ƾ �ǹ� ����Ʈ �׸���
				case(70){itemString = `id:17523`; itemArray.Add(itemString);} //1.019324697 @Ƽ���� �׸���
				case(71){itemString = `id:18131`; itemArray.Add(itemString);} //1.019324697 �����
				case(72){itemString = `id:18156`; itemArray.Add(itemString);} //1.019324697 ��� ����
				case(73){itemString = `id:18157`; itemArray.Add(itemString);} //1.019324697 ����� �� �Ӹ���
				case(74){itemString = `id:46011`; itemArray.Add(itemString);} //1.359099597 �Ͱ�����
				case(75){itemString = `id:46012`; itemArray.Add(itemString);} //1.359099597 û������
				case(76){itemString = `id:46007`; itemArray.Add(itemString);} //1.359099597 ���׷� ī��Ʈ �ǵ�
				case(77){itemString = `id:46008`; itemArray.Add(itemString);} //1.359099597 ����Ʈ ���׷� ī��Ʈ �ǵ�
				case(78){itemString = `id:40178`; itemArray.Add(itemString);} //1.359099597 ��ε� �׽�
				case(79){itemString = `id:15116`; itemArray.Add(itemString);} //1.359099597 ������ ������ ����
				case(80){itemString = `id:15117`; itemArray.Add(itemString);} //1.359099597 ������ ������ ����
				case(81){itemString = `id:15217`; itemArray.Add(itemString);} //1.359099597 �������� ���ǽ�
				case(82){itemString = `id:15260`; itemArray.Add(itemString);} //1.359099597 @�ٺ� ���� �÷��� ����(������)
				case(83){itemString = `id:15261`; itemArray.Add(itemString);} //1.359099597 @�ٺ� ���� �÷��� ����(������)
				case(84){itemString = `id:16519`; itemArray.Add(itemString);} //1.359099597 ��ȣȭ �尩
				case(85){itemString = `id:17100`; itemArray.Add(itemString);} //1.359099597 @�ٺ� ���� �÷��� ����(������)
				case(86){itemString = `id:18075`; itemArray.Add(itemString);} //1.698874496 �� �䳢 �Ӹ���5
				case(87){itemString = `id:18080`; itemArray.Add(itemString);} //1.698874496 ���� �䳢 �Ӹ���5
				case(88){itemString = `id:18085`; itemArray.Add(itemString);} //1.698874496 �� �䳢 �Ӹ���5
				case(89){itemString = `id:19032`; itemArray.Add(itemString);} //1.698874496 �� �κ�
				case(90){itemString = `id:19033`; itemArray.Add(itemString);} //1.698874496 ��� �κ�
				case(91){itemString = `id:64039 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 �ݱ��� ����
				case(92){itemString = `id:51004 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 ����� 100����
				case(93){itemString = `id:51009 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 ���� 100 ����
				case(94){itemString = `id:51014 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);}  //2.038649395 ���¹̳� 100 ����
				case(95){itemString = `id:51024 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 ����°� ���� 100 ����
				case(96){itemString = `id:51029 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 ����°� ���¹̳� 100 ����
				case(97){itemString = `id:55035`; itemArray.Add(itemString);} //2.038649395 ������ ���� ���̽��� ����
				case(98){itemString = `id:55041`; itemArray.Add(itemString);} //2.038649395 ������ ���� �Ͽ���� ����
				case(99){itemString = `id:55048`; itemArray.Add(itemString);} //2.038649395 ������ ���� ������ ����
				case(100){itemString = `id:55049`; itemArray.Add(itemString);} //2.038649395 ������ ���� ������ ����
				case(101){itemString = `id:55061`; itemArray.Add(itemString);} //2.038649395 ������ �׾Ƹ� �Ź��� ����
				case(102){itemString = `id:55068`; itemArray.Add(itemString);} //2.038649395 ������ ���� �������� ����
				case(103){itemString = `id:60025 count:10`; itemArray.Add(itemString);} //2.718199193 ��� ����
				case(104){itemString = `id:60026 count:10`; itemArray.Add(itemString);} //2.378424294 �ְ�� ����
				case(105){itemString = `id:63025 count:5`; itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 ��뷮 �ູ�� ����
				case(106){itemString = `id:63027 expire:10080`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 �ж� ����
				case(107){itemString = `id:63043 count:10`; itemArray.Add(itemString);} //2.378424294 ���꽺�� ����
				case(108){itemString = `id:64038 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 ������ ����
				case(109){itemString = `id:64036 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 ö���� ����
				case(110){itemString = `id:60041 count:5`; itemArray.Add(itemString);} //2.378424294 ���� �ݽ�
				case(111){itemString = `id:60042 count:5`; itemArray.Add(itemString);} //2.378424294 ���� ����
				case(112){itemString = `id:60043 count:5`; itemArray.Add(itemString);} //2.378424294 ���Ȱ� ���
				case(113){itemString = `id:91005`; itemArray.Add(itemString);} //2.378424294 ������ ��ȭ ����
			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`�������� `+itemString+` �� ��`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}
		++i;
	}	
}
