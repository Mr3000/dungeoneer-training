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
	//�Ϻ� shop �̺�Ʈ
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(187);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:19007 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //��ëޫի�?��?�� �߱� ���÷� �κ�/>
			case(1){itemString = `id:19038 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //��Ы���ëȫ�?�ֶ�� Ĺ �κ�/>
			case(2){itemString = `id:40095 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //�ɫ髴��֫쫤�� �巡�� ���̵�/>
			case(3){itemString = `id:40253 col1:ffcc66 col2:ff9966`; iCumRate +=1;} //�᫿�뫢�������ɸ�Ż ���̽� ����/>
			case(4){itemString = `id:40250 col1:ffcc66`; iCumRate +=1;} //�᫿��ի��������ɸ�Ż ���̾� ����/>
			case(5){itemString = `id:40248 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //�᫿��髤�ȫ˫󫰫��ɸ�Ż ����Ʈ�� ����/>
			case(6){itemString = `id:40251 col1:ffcc66 col2:ff9966`; iCumRate +=1;} //����ԫʫ���?��󫰫���Į�Ǵ��� ��������/>
			case(7){itemString = `id:40041 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //��?�ī��� Ÿ�ݿ� ����/>
			case(8){itemString = `id:40230 col1:ffcc66 col2:ff6600 col3:ff0000`; iCumRate +=10;} //�뫣���ի���������ʿ����� ���ڹ���/>
			case(9){itemString = `id:18552 col1:ffcc66`; iCumRate +=10;} //�?��ף���� (����,���㫤�����?��)���̳� �巡�� �︧ (�ΰ�, ���̾�Ʈ ����)/>
			case(10){itemString = `id:18553 col1:ffcc66`; iCumRate +=10;} //�?��ף���� (�����?��) ���̳� �巡�� �︧ (���� ����)/>
			case(11){itemString = `id:14039 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //�?��ף���� (����?��) ���̳� �巡�� �Ƹ� (�ΰ� ����)/>
			case(12){itemString = `id:14040 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //�?��ף���� (�����?��) ���̳� �巡�� �Ƹ� (���� ����)/>
			case(13){itemString = `id:14041 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //�?��ף���� (���㫤�����?��) ���̳� �巡�� �Ƹ� (���̾�Ʈ ����)/>
			case(14){itemString = `id:16532 col1:ffcc66`; iCumRate +=10;} //�?��ף��?� (����?��) ���̳� �巡�� ��Ʋ�� (�ΰ� ����)/>
			case(15){itemString = `id:16533 col1:ffcc66`; iCumRate +=10;} //�?��ף��?� (�����?��) ���̳� �巡�� ��Ʋ�� (���� ����)/>
			case(16){itemString = `id:16535 col1:ffcc66`; iCumRate +=10;} //�?��ף��?� (���㫤�����?��) ���̳� �巡�� ��Ʋ�� (���̾�Ʈ ����)/>
			case(17){itemString = `id:17095 col1:ffcc66`; iCumRate +=10;} //�?��ף������ (����,�����,���㫤�����?��) ���̳� �巡�� ���� (�ΰ�, ����, ���̾�Ʈ ����)/>
			case(18){itemString = `id:15232 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //��ӫë��� �䳢 ��/>
			case(19){itemString = `id:16043 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //��ӫëȫϫ�� �䳢 ��/>
			case(20){itemString = `id:17094 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //��ӫëȫիë� �䳢 ��/>
			case(21){itemString = `id:15250 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //�᫤����?����?�ȫ����׸��̵� �ǻ� ��Ʈ Ÿ��/>
			case(22){itemString = `id:15251 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //�᫤����?��󫰫����� ���̵� �ǻ� �� Ÿ��/>
			case(23){itemString = `id:46026 col1:ffcc66 col2:ff0000`; iCumRate +=1;} //�Ыë���?��Ŭ��/>
			case(24){itemString = `id:18149`; iCumRate +=10;} //������ĪҪ誳ٶ��ʺ��ڿ� ���Ƹ� ����/>
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
