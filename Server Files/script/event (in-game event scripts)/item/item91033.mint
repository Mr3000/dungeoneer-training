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
	// �Ϻ� �Ҵ� ������
	string itemString;
	int iRandom = Random(10);	//���� �ϳ����� �̷���
	int itemID = cItem.GetClassId();
	if (iRandom < 5)
	{
		itemString = `id:16042`;	// �Ҵ� �尩
	}
	else
	{
		itemString = `id:18150`;	// �Ҵ� �Ӹ���
	}

	DebugOut(`�������� `+itemString+` �� ��`);
	GivePandaGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);	
}
