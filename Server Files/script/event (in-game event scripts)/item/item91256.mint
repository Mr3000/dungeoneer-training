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
		string charName = player.GetDisplayName();
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(260);	//Ȯ���� ������ ���´�
		string DefItemString;
		int appraise_explore_exp;
		int appraise_gold;

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15215`; iCumRate +=4;} //1.242236025�߱� �ų� ������(������)
				case(1){itemString = `id:15216`; iCumRate +=4;} //1.242236025�߱� �ų� ������(������)
				case(2){itemString = `id:18151`; iCumRate +=4;} //1.242236025�߱� �ų� �� ����(������)
				case(3){itemString = `id:18152`; iCumRate +=4;} //1.242236025�߱� �ų� �Ӹ� ���(������)
				case(4){itemString = `id:15280`; iCumRate +=4;} //1.242236025������ ��� �ǻ�
				case(5){itemString = `id:15281`; iCumRate +=4;} //1.242236025������ ��� �ǻ�
				case(6){itemString = `id:17110`; iCumRate +=4;} //1.242236025��� �Ź�
				case(7){itemString = `id:18194`; iCumRate +=4;} //1.242236025������ ��� �Ӹ����
				case(8){itemString = `id:18195`; iCumRate +=4;} //1.242236025������ ��� �Ӹ����
				case(9){itemString = `id:12283`; iCumRate +=5;} //3.105590062Ǫ�� ������
				case(10){itemString = `id:12284`; iCumRate +=5;} //3.105590062���� ������
				case(11){itemString = `id:64042 size:3`; iCumRate +=4;} //3.105590062������
				case(12){itemString = `id:64043 size:3`; iCumRate +=4;} //3.105590062��Ÿ �����̾�
				case(13){itemString = `id:64044 size:3`; iCumRate +=4;} //3.105590062���޶���
				case(14){itemString = `id:64045 size:3`; iCumRate +=4;} //3.105590062����Ƹ���
				case(15){itemString = `id:64046 size:3`; iCumRate +=4;} //3.105590062����
				case(16){itemString = `id:64047 size:3`; iCumRate +=4;} //3.105590062�罺��
				case(17){itemString = `id:64048 size:3`; iCumRate +=4;} //3.105590062���
				case(18){itemString = `id:64049 size:3`; iCumRate +=4;} //3.105590062���ǳ�
				case(19){itemString = `id:64050 size:3`; iCumRate +=2;} //1.863354037���̾Ƹ��
				case(20){itemString = `id:51003 count:3`; iCumRate +=30;} //9.316770186����� 50 ����
				case(21){itemString = `id:51008 count:3`; iCumRate +=30;} //9.316770186���� 50 ����
				case(22){itemString = `id:51013 count:3`; iCumRate +=30;} //9.316770186���¹̳� 50 ����
				case(23){itemString = `id:51004`; iCumRate +=30;} //9.316770186����� 100 ����
				case(24){itemString = `id:51009`; iCumRate +=30;} //9.316770186���� 100 ����
				case(25){itemString = `id:51014`; iCumRate +=30;} //9.316770186���¹̳� 100 ����

				// ����� ���������� ��

				default
				{
					itemString = `id:65040`; iCumRate +=1000;
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
				item newItem;
				string ItemName;
//				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);

			//	newItem = player.AddItemEx(itemString, true);

				return;
			}
			++i;
		}
}
