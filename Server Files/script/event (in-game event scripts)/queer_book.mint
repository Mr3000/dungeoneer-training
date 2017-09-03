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
server void QueerBook(character player)
// : �����ۿ� �ƹ� ����� ������
//  �̻��� å�� ������ �������� �� �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(253);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:64530 suffix:40030`; iCumRate +=1;} //0.395256917���̾ 10������
			case(1){itemString = `id:62005 suffix:30732`; iCumRate +=4;} //1.581027668���� ��æƮ
			case(2){itemString = `id:62005 prefix:20735`; iCumRate +=4;} //1.581027668�߰ſ� ��æƮ
			case(3){itemString = `id:62005 prefix:7`; iCumRate +=4;} //1.581027668�������� ��æƮ
			case(4){itemString = `id:62005 prefix:207`; iCumRate +=4;} //1.581027668���� ��æƮ
			case(5){itemString = `id:62005 prefix:21410 `; iCumRate +=4;} //1.581027668������ ��æƮ
			case(6){itemString = `id:62005 suffix:30634`; iCumRate +=5;} //1.976284585����� ��æƮ
			case(7){itemString = `id:62005 prefix:21412`; iCumRate +=5;} //1.976284585Į�� ��æƮ
			case(8){itemString = `id:64521 suffix:40021`; iCumRate +=10;} //3.95256917���̾ 1������
			case(9){itemString = `id:64522 suffix:40022`; iCumRate +=10;} //3.95256917���̾ 2������
			case(10){itemString = `id:64523 suffix:40023`; iCumRate +=10;} //3.95256917���̾ 3������
			case(11){itemString = `id:64524 suffix:40024`; iCumRate +=10;} //3.95256917���̾ 4������
			case(12){itemString = `id:64525 suffix:40025`; iCumRate +=10;} //3.95256917���̾ 5������
			case(13){itemString = `id:64526 suffix:40026`; iCumRate +=8;} //3.162055336���̾ 6������
			case(14){itemString = `id:64527 suffix:40027`; iCumRate +=8;} //3.162055336���̾ 7������
			case(15){itemString = `id:64528 suffix:40028`; iCumRate +=8;} //3.162055336���̾ 8������
			case(16){itemString = `id:64529 suffix:40029`; iCumRate +=8;} //3.162055336���̾ 9������
			case(17){itemString = `id:62005 suffix:30506`; iCumRate +=10;} //3.95256917�ż��� ��æƮ
			case(18){itemString = `id:62005 prefix:201`; iCumRate +=10;} //3.95256917�ܽ��� ��æƮ
			case(19){itemString = `id:62005 prefix:1`; iCumRate +=10;} //3.95256917�ܽ������� ��æƮ
			case(20){itemString = `id:62005 suffix:10605`; iCumRate +=10;} //3.95256917���� ��æƮ
			case(21){itemString = `id:62005 prefix:305`; iCumRate +=10;} //3.95256917���� ��æƮ
			case(22){itemString = `id:62005 prefix:20501`; iCumRate +=10;} //3.95256917������ ��æƮ
			case(23){itemString = `id:64018 count:5`; iCumRate +=50;} //19.76284585����
			case(24){itemString = `id:64051 count:5`; iCumRate +=30;} //11.85770751��¦�� ����

			// ����� ���������� ��

			default
			{
				itemString = `id:64051`; iCumRate +=1000;
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
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}

		++i;
	}
}
