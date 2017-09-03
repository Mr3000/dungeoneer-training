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
	//�̱� ���ݼ��� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(2497);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:19084 col1:8D699C col2:5A5A83 col3:CB4ED3`; iCumRate += 1;} //0.0400480577 ���� �ǻ�(�κ�)
			case(1){itemString = `id:17237 col1:643968 col2:67007F col3:5C6A88`; iCumRate += 1;} //0.0400480577 ���� �Ź�
			case(2){itemString = `id:15601 col1:303F5F col2:D1D1D1 col3:363636`; iCumRate += 1;} //0.0400480577 ���� �ǻ�
			case(3){itemString = `id:17235 col1:363636`; iCumRate += 1;} //0.0400480577 ���� �Ź�
			case(4){itemString = `id:15602 col1:666D71 col2:1F2123 col3:9E9A95`; iCumRate += 1;} //0.0400480577 ���̸�� �ǻ�
			case(5){itemString = `id:17236 col1:1F2123`; iCumRate += 1;} //0.0400480577 ���̸Ӿ� �Ź�
			case(6){itemString = `id:40356 `; iCumRate += 1;} //0.0400480577 ������ �Ǹ���
			case(7){itemString = `id:46028 `; iCumRate += 1;} //0.0400480577 ��Ű ����
			case(8){itemString = `id:18199 `; iCumRate += 1;} //0.0400480577 ������ �Ȱ�
			case(9){itemString = `id:18159 `; iCumRate += 1;} //0.0400480577 ���� �Ȱ�
			case(10){itemString = `id:15080 `; iCumRate += 1;} //0.0400480577 ������� �����巹��
			case(11){itemString = `id:46010 `; iCumRate += 1;} //0.0400480577 �巡�� �ǵ�
			case(12){itemString = `id:65009 `; iCumRate += 5;} //0.2002402883 ������ �巹���� ����
			case(13){itemString = `id:15354 `; iCumRate += 5;} //0.2002402883 ���̸� ĸƾ ��Ʈ
			case(14){itemString = `id:15174 `; iCumRate += 5;} //0.2002402883 ���� ��Ʈ ����
			case(15){itemString = `id:40285 col1:000000 col2:b8b800`; iCumRate += 5;} //0.2002402883 � �Ǹ���
			case(16){itemString = `id:40286 col1:000000 col2:00e8e8`; iCumRate += 5;} //0.2002402883 ���� �Ǹ���
			case(17){itemString = `id:40284 col1:000000 col2:e80000`; iCumRate += 5;} //0.2002402883 ���̾� �Ǹ���
			case(18){itemString = `id:40287 col1:000000 col2:00e800`; iCumRate += 5;} //0.2002402883 ���� �Ǹ���
			case(19){itemString = `id:15073 `; iCumRate += 10;} //0.4004805767 ����� ������
			case(20){itemString = `id:15060 `; iCumRate += 10;} //0.4004805767 ���� �̳ʷκ� ����
			case(21){itemString = `id:15183 `; iCumRate += 10;} //0.4004805767 ���̵� ��Ʈ
			case(22){itemString = `id:15220 `; iCumRate += 10;} //0.4004805767 �ֵ�̷� ��Ʈ
			case(23){itemString = `id:15221 `; iCumRate += 10;} //0.4004805767 �ֵ�̷� ��Ʈ
			case(24){itemString = `id:51015 count:5`; iCumRate += 10;} //0.4004805767 ���¹̳� 300 ����
			case(25){itemString = `id:40285 `; iCumRate += 10;} //0.4004805767 � �Ǹ���
			case(26){itemString = `id:40286 `; iCumRate += 10;} //0.4004805767 ���� �Ǹ���
			case(27){itemString = `id:40284 `; iCumRate += 10;} //0.4004805767 ���̾� �Ǹ���
			case(28){itemString = `id:40287 `; iCumRate += 10;} //0.4004805767 ���� �Ǹ���
			case(29){itemString = `id:65020 count:3`; iCumRate += 30;} //1.2014417301 �ְ�� ���� ����
			case(30){itemString = `id:65019 count:3`; iCumRate += 40;} //1.6019223068 ��� ���� ����
			case(31){itemString = `id:17026 `; iCumRate += 50;} //2.0024028835 ���� ����
			case(32){itemString = `id:51014 count:5`; iCumRate += 50;} //2.0024028835 ���¹̳� 100 ����
			case(33){itemString = `id:65046 `; iCumRate += 50;} //2.0024028835 �������� ����
			case(34){itemString = `id:65045 `; iCumRate += 50;} //2.0024028835 ������ ����
			case(35){itemString = `id:15153 `; iCumRate += 50;} //2.0024028835 ���� �������� ��Ʈ
			case(36){itemString = `id:15154 `; iCumRate += 50;} //2.0024028835 ���� �������� ��Ʈ
			case(37){itemString = `id:65010 `; iCumRate += 50;} //2.0024028835 ��ȣ���� ����
			case(38){itemString = `id:65013 `; iCumRate += 50;} //2.0024028835 ���� ���� ����
			case(39){itemString = `id:65016 `; iCumRate += 50;} //2.0024028835 ������ ���� ����
			case(40){itemString = `id:15135 `; iCumRate += 50;} //2.0024028835 ��ũ ��Ʈ
			case(41){itemString = `id:15013 `; iCumRate += 50;} //2.0024028835 ���̳� �巹��
			case(42){itemString = `id:65017 count:5`; iCumRate += 50;} //2.0024028835 ���� ���� ����
			case(43){itemString = `id:65018 count:5`; iCumRate += 50;} //2.0024028835 �Ϲ� ���� ����
			case(44){itemString = `id:65048 `; iCumRate += 50;} //2.0024028835 ���� ���� ����
			case(45){itemString = `id:15156 `; iCumRate += 80;} //3.2038446135 �̵�ī�� ������ ����(������)
			case(46){itemString = `id:51013 count:10`; iCumRate += 80;} //3.2038446135 ���¹̳� 50 ����
			case(47){itemString = `id:65002 count:10`; iCumRate += 80;} //3.2038446135 ���� ����
			case(48){itemString = `id:65003 count:10`; iCumRate += 80;} //3.2038446135 ���� ����
			case(49){itemString = `id:65004 count:10`; iCumRate += 80;} //3.2038446135 �ٶ��� ����
			case(50){itemString = `id:65005 count:10`; iCumRate += 80;} //3.2038446135 ���� ����
			case(51){itemString = `id:62004 count:3`; iCumRate += 100;} //4.0048057669 ��������
			case(52){itemString = `id:63001 count:3`; iCumRate += 100;} //4.0048057669 ������ ����
			case(53){itemString = `id:16511 `; iCumRate += 100;} //4.0048057669 �ǹ� Ƽ�� �۷���
			case(54){itemString = `id:15016 `; iCumRate += 100;} //4.0048057669 ����� ��Ÿŷ ������
			case(55){itemString = `id:17007 `; iCumRate += 100;} //4.0048057669 ���� ����
			case(56){itemString = `id:15351 `; iCumRate += 100;} //4.0048057669 �߽� ���ݼ��� ����
			case(57){itemString = `id:17138 `; iCumRate += 100;} //4.0048057669 �߽� ���ݼ��� �Ź�
			case(58){itemString = `id:40258 `; iCumRate += 100;} //4.0048057669 �Ǹ���
			case(59){itemString = `id:16011 `; iCumRate += 100;} //4.0048057669 �ڷ��� ���� �۷���
			case(60){itemString = `id:51011 count:10`; iCumRate += 100;} //4.0048057669 ���¹̳� 10 ����
			case(61){itemString = `id:51012 count:10`; iCumRate += 100;} //4.0048057669 ���¹̳� 30 ����
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
