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
	//�߱� Ư���� ���� ��í��
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom;

	iRandom = Random(305);	//�븸 Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
			case(0){itemString=`id:40004 col1:FF0080 col2:FF0080 col3:FF0080`;iCumRate+=1;}//0.3278688525 305��Ʈ
			case(1){itemString=`id:40017 col1:FF0080 col2:FF0080 col3:FF0080`;iCumRate+=1;}//0.3278688525 305������
			case(2){itemString=`id:40048 col1:00FFFF col2:00FFFF col3:00FFFF`;iCumRate+=1;}//0.3278688525 305�ֽ�
			case(3){itemString=`id:40049 col1:00FFFF col2:00FFFF col3:00FFFF`;iCumRate+=1;}//0.3278688525 305�÷�Ʈ
			case(4){itemString=`id:40050 col1:00FFFF col2:00FFFF col3:01FFFF`;iCumRate+=1;}//0.3278688525 305�����
			case(5){itemString=`id:40095 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=1;}//0.3278688525 305�巡�� ���̵�
			case(6){itemString=`id:40033 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305Ŭ���̸��
			case(7){itemString=`id:40081 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305���� �� ����
			case(8){itemString=`id:40090 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305���� ����
			case(9){itemString=`id:40080 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305�۶��콺
			case(10){itemString=`id:40038 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305����Ʈ�� ����
			case(11){itemString=`id:40039 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305���̽� ����
			case(12){itemString=`id:40040 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305���̾� ����
			case(13){itemString=`id:40041 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305Ÿ�ݿ� ����
			case(14){itemString=`id:40078 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305����Ͻ�
			case(15){itemString=`id:40079 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305���̽�
			case(16){itemString=`id:40031 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305����
			case(17){itemString=`id:40030 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305�� �ڵ�� �ҵ�
			case(18){itemString=`id:40013 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305�� ����
			case(19){itemString=`id:40014 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305������ ����
			case(20){itemString=`id:40016 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305�ظ�
			case(21){itemString=`id:40010 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305�� �ҵ�
			case(22){itemString=`id:40011 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305��ε� �ҵ�
			case(23){itemString=`id:40012 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305�ٽ�Ÿ�� �ҵ�
			case(24){itemString=`id:40015 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305�÷�Ʈ �� �ҵ�
			case(25){itemString=`id:40003 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305�� ����
			case(26){itemString=`id:40005 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305�� �ҵ�
			case(27){itemString=`id:40006 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305�ܰ�
			case(28){itemString=`id:40002 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305������ ��
			case(29){itemString=`id:40033`;iCumRate+=10;}//3.2786885246 305Ŭ���̸��
			case(30){itemString=`id:40081`;iCumRate+=10;}//3.2786885246 305���� �� ����
			case(31){itemString=`id:40090`;iCumRate+=10;}//3.2786885246 305���� ����
			case(32){itemString=`id:40080`;iCumRate+=10;}//3.2786885246 305�۶��콺
			case(33){itemString=`id:40038`;iCumRate+=10;}//3.2786885246 305����Ʈ�� ����
			case(34){itemString=`id:40039`;iCumRate+=10;}//3.2786885246 305���̽� ����
			case(35){itemString=`id:40040`;iCumRate+=10;}//3.2786885246 305���̾� ����
			case(36){itemString=`id:40041`;iCumRate+=10;}//3.2786885246 305Ÿ�ݿ� ����
			case(37){itemString=`id:40078`;iCumRate+=10;}//3.2786885246 305����Ͻ�
			case(38){itemString=`id:40079`;iCumRate+=10;}//3.2786885246 305���̽�
			case(39){itemString=`id:40031`;iCumRate+=10;}//3.2786885246 305����
			case(40){itemString=`id:40030`;iCumRate+=10;}//3.2786885246 305�� �ڵ�� �ҵ�
			case(41){itemString=`id:40013`;iCumRate+=10;}//3.2786885246 305�� ����
			case(42){itemString=`id:40014`;iCumRate+=10;}//3.2786885246 305������ ����
			case(43){itemString=`id:40016`;iCumRate+=10;}//3.2786885246 305�ظ�
			case(44){itemString=`id:40010`;iCumRate+=10;}//3.2786885246 305�� �ҵ�
			case(45){itemString=`id:40011`;iCumRate+=10;}//3.2786885246 305��ε� �ҵ�
			case(46){itemString=`id:40012`;iCumRate+=10;}//3.2786885246 305�ٽ�Ÿ�� �ҵ�
			case(47){itemString=`id:40015`;iCumRate+=10;}//3.2786885246 305�÷�Ʈ �� �ҵ�
			case(48){itemString=`id:40003`;iCumRate+=10;}//3.2786885246 305�� ����
			case(49){itemString=`id:40005`;iCumRate+=10;}//3.2786885246 305�� �ҵ�
			case(50){itemString=`id:40006`;iCumRate+=10;}//3.2786885246 305�ܰ�
			case(51){itemString=`id:40002`;iCumRate+=10;}//3.2786885246 305������ ��
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
