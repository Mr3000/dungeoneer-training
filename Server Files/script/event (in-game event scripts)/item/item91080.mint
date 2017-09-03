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
	//�߱� Ư���� �Ƹ� ��í��
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;

	iRandom = Random(366);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString=`id:13032 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=1;}//0.2732240437 366�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
			case(1){itemString=`id:13033 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=1;}//0.2732240437 366�߷��þ� ũ�ν� ���� �÷���Ʈ �Ƹ�(������)
			case(2){itemString=`id:14036 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366Ƽ���� �Ƹ�(������)
			case(3){itemString=`id:14037 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366Ƽ���� �Ƹ�(������)
			case(4){itemString=`id:16531 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366Ƽ���� ��Ʋ��
			case(5){itemString=`id:17523 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366Ƽ���� �׸���
			case(6){itemString=`id:18518  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366�巡�� ũ����Ʈ
			case(7){itemString=`id:13022 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366���� �÷���Ʈ �Ƹ� (PŸ��)
			case(8){itemString=`id:13010  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366���� ����� ü�θ���
			case(9){itemString=`id:13031 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366������ī �ǹ� �÷���Ʈ �Ƹ�
			case(10){itemString=`id:16511  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366�ǹ� Ƽ�� �۷���
			case(11){itemString=`id:17510  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366������ī �ǹ� �÷���Ʈ ����
			case(12){itemString=`id:13043 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366���̴Ͼ� ������ ����(������)
			case(13){itemString=`id:13044 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366���̴Ͼ� ������ ����(������)
			case(14){itemString=`id:13047 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(15){itemString=`id:13048 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(16){itemString=`id:14025 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366ī�� ���Ǹ�Ʈ �Ƹ�(������)
			case(17){itemString=`id:14026 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366ī�� ���Ǹ�Ʈ �Ƹ�(������)
			case(18){itemString=`id:16028  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366ī�� ���Ǹ�Ʈ �۷���
			case(19){itemString=`id:17064  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366ī�� ���Ǹ�Ʈ ����
			case(20){itemString=`id:14018  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366�븣�� ������ �Ƹ�
			case(21){itemString=`id:18546  col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366�븣�� ������ ���
			case(22){itemString=`id:14019 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366�׷��̽� �÷���Ʈ �Ƹ�
			case(23){itemString=`id:16523  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366�׷��̽� ��Ʋ��
			case(24){itemString=`id:17515  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366�׷��̽� �׸���
			case(25){itemString=`id:18545  col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366�׷��̽� ���
			case(26){itemString=`id:14016  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366ũ�ν���Ʈ ���� ��Ʈ
			case(27){itemString=`id:14008 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366Ǯ��Ʈ ���� ����
			case(28){itemString=`id:14017  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366������Ʈ ���� ����
			case(29){itemString=`id:14007 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366�극��Ʈ Ŭ�ν� ����
			case(30){itemString=`id:14036`;iCumRate+=10;}//2.7322404372 366Ƽ���� �Ƹ�(������)
			case(31){itemString=`id:14037`;iCumRate+=10;}//2.7322404372 366Ƽ���� �Ƹ�(������)
			case(32){itemString=`id:16531`;iCumRate+=10;}//2.7322404372 366Ƽ���� ��Ʋ��
			case(33){itemString=`id:17523`;iCumRate+=10;}//2.7322404372 366Ƽ���� �׸���
			case(34){itemString=`id:18518 `;iCumRate+=10;}//2.7322404372 366�巡�� ũ����Ʈ
			case(35){itemString=`id:13022`;iCumRate+=10;}//2.7322404372 366���� �÷���Ʈ �Ƹ� (PŸ��)
			case(36){itemString=`id:13010 `;iCumRate+=10;}//2.7322404372 366���� ����� ü�θ���
			case(37){itemString=`id:13031`;iCumRate+=10;}//2.7322404372 366������ī �ǹ� �÷���Ʈ �Ƹ�
			case(38){itemString=`id:16511 `;iCumRate+=10;}//2.7322404372 366�ǹ� Ƽ�� �۷���
			case(39){itemString=`id:17510 `;iCumRate+=10;}//2.7322404372 366������ī �ǹ� �÷���Ʈ ����
			case(40){itemString=`id:13043`;iCumRate+=10;}//2.7322404372 366���̴Ͼ� ������ ����(������)
			case(41){itemString=`id:13044`;iCumRate+=10;}//2.7322404372 366���̴Ͼ� ������ ����(������)
			case(42){itemString=`id:13047`;iCumRate+=10;}//2.7322404372 366Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(43){itemString=`id:13048`;iCumRate+=10;}//2.7322404372 366Ű�������� ���� �÷���Ʈ �Ƹ�(������)
			case(44){itemString=`id:14025`;iCumRate+=10;}//2.7322404372 366ī�� ���Ǹ�Ʈ �Ƹ�(������)
			case(45){itemString=`id:14026`;iCumRate+=10;}//2.7322404372 366ī�� ���Ǹ�Ʈ �Ƹ�(������)
			case(46){itemString=`id:16028 `;iCumRate+=10;}//2.7322404372 366ī�� ���Ǹ�Ʈ �۷���
			case(47){itemString=`id:17064 `;iCumRate+=10;}//2.7322404372 366ī�� ���Ǹ�Ʈ ����
			case(48){itemString=`id:14018 `;iCumRate+=10;}//2.7322404372 366�븣�� ������ �Ƹ�
			case(49){itemString=`id:18546 `;iCumRate+=10;}//2.7322404372 366�븣�� ������ ���
			case(50){itemString=`id:14019`;iCumRate+=10;}//2.7322404372 366�׷��̽� �÷���Ʈ �Ƹ�
			case(51){itemString=`id:16523 `;iCumRate+=10;}//2.7322404372 366�׷��̽� ��Ʋ��
			case(52){itemString=`id:17515 `;iCumRate+=10;}//2.7322404372 366�׷��̽� �׸���
			case(53){itemString=`id:18545 `;iCumRate+=10;}//2.7322404372 366�׷��̽� ���
			case(54){itemString=`id:14016 `;iCumRate+=10;}//2.7322404372 366ũ�ν���Ʈ ���� ��Ʈ
			case(55){itemString=`id:14008`;iCumRate+=10;}//2.7322404372 366Ǯ��Ʈ ���� ����
			case(56){itemString=`id:14017 `;iCumRate+=10;}//2.7322404372 366������Ʈ ���� ����
			case(57){itemString=`id:14007`;iCumRate+=10;}//2.7322404372 366�극��Ʈ Ŭ�ν� ����
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
