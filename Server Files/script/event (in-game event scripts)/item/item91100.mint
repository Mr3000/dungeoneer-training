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
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(1000);	//Ȯ���� ������ ���´�
	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString = `id:51004 count:10`; iCumRate +=75;}	//����� 100 ����  8.474576271
			case(1){itemString = `id:51009 count:10`; iCumRate +=75;}	//���� 100 ����  8.474576271
			case(2){itemString = `id:51014 count:10`; iCumRate +=75;}	//���¹̳� 100 ����  8.474576271
			case(3){itemString = `id:64022 count:10`; iCumRate +=75;}	//������  8.474576271
			case(4){itemString = `id:60026 count:5`; iCumRate +=68;}		//�ְ�� ����  6.779661017
			case(5){itemString = `id:60054 count:10`; iCumRate +=68;}	//������  6.779661017
			case(6){itemString = `id:45003 count:100`; iCumRate +=75;}	//����ȭ��  8.474576271
			case(7){itemString = `id:64007 count:10`; iCumRate +=75;}	//�ݱ�  8.474576271
			case(8){itemString = `id:46006 col1:880000 col2:ffffff col3:ffffff`; iCumRate +=34;} //��ȭ+���� ī��Ʈ�ǵ�  3.389830508
			case(9){itemString = `id:40010 col1:880000`; iCumRate +=17;} //�� ���� �ռҵ�  1.694915254
			case(10){itemString = `id:40079 col2:990099`; iCumRate +=34;} //������ ����� ���̽�  3.389830508
			case(11){itemString = `id:40081 col2:ff99ff`; iCumRate +=17;} //��ȫ�� ���� �� ����  1.694915254
			case(12){itemString = `id:50247 quality:100`; iCumRate +=84;} //�ع� ���İ�Ƽ  8.474576271
			case(13){itemString = `id:50239 quality:100`; iCumRate +=84;} //���� Ƣ��   8.474576271
			case(14){itemString = `id:50163 quality:100`; iCumRate +=84;} // �ǽ� �� Ĩ��  8.474576271
			case(15){itemString = `id:18238 `; iCumRate +=15;} //�� ���� ���
			case(16){itemString = `id:16058 `; iCumRate +=15;} //�� ���� �극�̽���ID
			case(17){itemString = `id:16057 `; iCumRate +=30;} //���̾� �Ƕ�� ���
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
//			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}
		++i;
	}
}
