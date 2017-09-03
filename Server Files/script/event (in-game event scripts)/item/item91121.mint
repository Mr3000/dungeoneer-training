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
	//�̱� ���� ������
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(200000);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:17128 `; iCumRate +=2;} //0.001ī���� ���ڵ� ����
			case(1){itemString = `id:15316 `; iCumRate +=2;} //0.001ī���� ���ڵ� ��Ʈ
			case(2){itemString = `id:40968 `; iCumRate +=2;} //0.001�� ����
			case(3){itemString = `id:40969 `; iCumRate +=2;} //0.001���
			case(4){itemString = `id:40970 `; iCumRate +=2;} //0.001��������
			case(5){itemString = `id:18233 `; iCumRate +=100;} //0.05���̸��� ���巹��
			case(6){itemString = `id:18234 `; iCumRate +=100;} //0.05���� ���
			case(7){itemString = `id:18235 `; iCumRate +=100;} //0.05���̸��� ����Ʈĸ
			case(8){itemString = `id:18236 `; iCumRate +=100;} //0.05�÷��� �����
			case(9){itemString = `id:18237 `; iCumRate +=100;} //0.05�� ��Ƽġ ����ũ
			case(10){itemString = `id:18238 `; iCumRate +=100;} //0.05�� ���� ���
			case(11){itemString = `id:18149 `; iCumRate +=100;} //0.05�ʺ��ڿ� ���Ƹ� ����
			case(12){itemString = `id:63064 count:10 `; iCumRate +=6000;} //3��Ʈ ��� �Ҳɳ���ŰƮ
			case(13){itemString = `id:63074 count:10 `; iCumRate +=6000;} //3���� �Ҳɳ��� ŰƮ
			case(14){itemString = `id:63075 count:10`; iCumRate +=6000;} //3����Ĺ �Ҳɳ��� ŰƮ
			case(15){itemString = `id:63076 count:10 `; iCumRate +=6000;} //3���̽� ���� ŰƮ
			case(16){itemString = `id:91066 `; iCumRate +=6000;} //3���ɹ���������� (1~5)
			case(17){itemString = `id:91017 `; iCumRate +=6000;} //3�Ϻ����� set 1
			case(18){itemString = `id:91018 `; iCumRate +=6000;} //3�Ϻ����� set 2
			case(19){itemString = `id:85043 count:2`; iCumRate +=7000;} //3.5���� ����(*2)
			case(20){itemString = `id:85044 count:2 `; iCumRate +=7000;} //3.5���� ����(*2)
			case(21){itemString = `id:85042 count:2 `; iCumRate +=7000;} //3.5��� ����(*2)
			case(22){itemString = `id:85040 count:2 `; iCumRate +=7000;} //3.5ü�� ����(*2)
			case(23){itemString = `id:85041 count:2 `; iCumRate +=7000;} //3.5�ؾ� ����(*2)
			case(24){itemString = `id:65048 `; iCumRate +=7000;} //3.5���� ���� ����
			case(25){itemString = `id:40276 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(26){itemString = `id:40277 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(27){itemString = `id:40278 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(28){itemString = `id:40279 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(29){itemString = `id:40280 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(30){itemString = `id:40281 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(31){itemString = `id:40282 `; iCumRate +=8000;} //4'��' �� �ڵ座
			case(32){itemString = `id:40283 `; iCumRate +=8000;} //4���� '��' �� �ڵ座
			case(33){itemString = `id:40018 `; iCumRate +=8000;} //4���𷼷�
			case(34){itemString = `id:40049 `; iCumRate +=8000;} //4�÷�Ʈ
			case(35){itemString = `id:40050 `; iCumRate +=8000;} //4�����
			case(36){itemString = `id:40214 `; iCumRate +=9000;} //4.5ū ��
			case(37){itemString = `id:40215 `; iCumRate +=9000;} //4.5���� ��
			case(38){itemString = `id:40216 `; iCumRate +=9290;} //4.645�ɹ���
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
