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
		int iRandom = Random(411);	//Ȯ���� ������ ���´�
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
				case(0){itemString = `id:40379`; iCumRate +=2;} //0.694444444@Ʈ����Ƽ ������
				case(1){itemString = `id:40377`; iCumRate +=1;} //0.231481481@�۷θ� �ҵ�
				case(2){itemString = `id:40378`; iCumRate +=1;} //0.231481481@�巡�� ����
				case(3){itemString = `id:40380`; iCumRate +=1;} //0.231481481@�����̳� �Ǹ���
				case(4){itemString = `id:40381`; iCumRate +=1;} //0.231481481@�����ũ �Ǹ���
				case(5){itemString = `id:40382`; iCumRate +=1;} //0.231481481@�㸮���� �Ǹ���
				case(6){itemString = `id:40383`; iCumRate +=1;} //0.231481481@Ÿ�̴޿��̺� �Ǹ���
				case(7){itemString = `id:13164`; iCumRate +=1;} //0.231481481���� �÷���Ʈ �Ƹ�
				case(8){itemString = `id:16631`; iCumRate +=1;} //0.231481481���� �÷���Ʈ ��Ʋ��
				case(9){itemString = `id:17623`; iCumRate +=1;} //0.231481481���� �÷���Ʈ ����
				case(10){itemString = `id:18660`; iCumRate +=1;} //0.231481481���� �÷���Ʈ ���
				case(11){itemString = `id:16142`; iCumRate +=1;} //0.231481481�캸�� �尩
				case(12){itemString = `id:17238`; iCumRate +=1;} //0.231481481�캸�� ����
				case(13){itemString = `id:18317`; iCumRate +=1;} //0.231481481�캸�� ��Ŭ��
				case(14){itemString = `id:19126`; iCumRate +=1;} //0.231481481�캸�� �κ�
				case(15){itemString = `id:15614`; iCumRate +=1;} //0.231481481ũ���ô� ����
				case(16){itemString = `id:16145`; iCumRate +=1;} //0.231481481ũ���ô� �۷���
				case(17){itemString = `id:17240`; iCumRate +=1;} //0.231481481ũ���ô� ����
				case(18){itemString = `id:15490`; iCumRate +=1;} //0.231481481����Ʈ�� ����
				case(19){itemString = `id:16150`; iCumRate +=1;} //0.231481481����Ʈ�� �尩
				case(20){itemString = `id:17244`; iCumRate +=1;} //0.231481481����Ʈ�� ����
				case(21){itemString = `id:18330`; iCumRate +=1;} //0.231481481����Ʈ�� ����
				case(22){itemString = `id:15489`; iCumRate +=1;} //0.231481481Ʈ����Ƽ ���� (������)
				case(23){itemString = `id:15495`; iCumRate +=1;} //0.231481481Ʈ����Ƽ ���� (������)
				case(24){itemString = `id:18327`; iCumRate +=1;} //0.231481481Ʈ����Ƽ ��Ŭ��
				case(25){itemString = `id:17241`; iCumRate +=1;} //0.231481481Ʈ����Ƽ ����
				case(26){itemString = `id:16147`; iCumRate +=1;} //0.231481481Ʈ����Ƽ �尩
				case(27){itemString = `id:15492`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(28){itemString = `id:15496`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(29){itemString = `id:18328`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(30){itemString = `id:18332`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(31){itemString = `id:17242`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(32){itemString = `id:17247`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� ���� (������)
				case(33){itemString = `id:16148`; iCumRate +=1;} //0.231481481�Ƶ��Ͻ� �극�̽��� (������)
				case(34){itemString = `id:18279`; iCumRate +=4;} //0.925925926�񵵸�
				case(35){itemString = `id:18278`; iCumRate +=4;} //0.925925926�ƾ�
				case(36){itemString = `id:15277`; iCumRate +=8;} //1.851851852������ �Ѻ�
				case(37){itemString = `id:15276`; iCumRate +=8;} //1.851851852������ �Ѻ�
				case(38){itemString = `id:15279`; iCumRate +=4;} //0.925925926���� ���̾�Ʈ�� �Ѻ�
				case(39){itemString = `id:15278`; iCumRate +=4;} //0.925925926���� ���̾�Ʈ�� �Ѻ�
				case(40){itemString = `id:17106`; iCumRate +=8;} //1.851851852������ �Ѻ� �Ź�
				case(41){itemString = `id:17107`; iCumRate +=8;} //1.851851852������ �Ѻ� �Ź�
				case(42){itemString = `id:17109`; iCumRate +=4;} //0.925925926���� ���̾�Ʈ�� �Ѻ� �Ź�
				case(43){itemString = `id:17108`; iCumRate +=4;} //0.925925926���� ���̾�Ʈ�� �Ѻ� �Ź�
				case(44){itemString = `id:12283`; iCumRate +=10;} //4.62962963Ǫ�� ������
				case(45){itemString = `id:12284`; iCumRate +=10;} //4.62962963���� ������
				case(46){itemString = `id:51003 count:3`; iCumRate +=50;} //11.57407407����� 50 ����
				case(47){itemString = `id:51008 count:3`; iCumRate +=50;} //11.57407407���� 50 ����
				case(48){itemString = `id:51013 count:3`; iCumRate +=50;} //11.57407407���¹̳� 50 ����
				case(49){itemString = `id:51004 count:2`; iCumRate +=50;} //11.57407407����� 100 ����
				case(50){itemString = `id:51009 count:2`; iCumRate +=50;} //11.57407407���� 100 ����
				case(51){itemString = `id:51014 count:2`; iCumRate +=50;} //11.57407407���¹̳� 100 ����


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
