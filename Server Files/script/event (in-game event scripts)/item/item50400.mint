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
	// 2007 ��̳� �̺�Ʈ��. ��Ű Ʈ������ ������ ���� ��Ű�̴�  , 2008�� 5�� �̺�Ʈ������ ��� (50401)
	int itemID = cItem.GetClassId();
	int iRandom = Random(34);

	switch(iRandom)
	{
		case (0)
		{
			player.ShowCaption(["event.useitem_event.4"]);
		}
		case (1)
		{
			player.ShowCaption(["event.useitem_event.5"]);
		}
		case (2)
		{
			player.ShowCaption(["event.useitem_event.6"]);
		}
		case (3)
		{
			player.ShowCaption(["event.useitem_event.7"]);
		}
		case (4)
		{
			player.ShowCaption(["event.useitem_event.8"]);
		}
		case (5)
		{
			player.ShowCaption(["event.useitem_event.9"]);
		}
		case (6)
		{
			player.ShowCaption(["event.useitem_event.10"]);
		}
		case (7)
		{
			player.ShowCaption(["event.useitem_event.11"]);
		}
		case (8)
		{
			player.ShowCaption(["event.useitem_event.12"]);
		}
		case (9)
		{
			player.ShowCaption(["event.useitem_event.13"]);
		}
		case (10)
		{
			player.ShowCaption(["event.useitem_event.14"]);
		}
		case (11)
		{
			player.ShowCaption(["event.useitem_event.15"]);
		}
		case (12)
		{
			player.ShowCaption(["event.useitem_event.16"]);
		}
		case (13)
		{
			player.ShowCaption(["event.useitem_event.17"]);
		}
		case (14)
		{
			player.ShowCaption(["event.useitem_event.18"]);
		}
		case (15)
		{
			player.ShowCaption(["event.useitem_event.19"]);
		}
		case (16)
		{
			player.ShowCaption(["event.useitem_event.20"]);
		}
		case (17)
		{
			player.ShowCaption(["event.useitem_event.21"]);
		}
		case (18)
		{
			player.ShowCaption(["event.useitem_event.22"]);
		}
		case (19)
		{
			player.ShowCaption(["event.useitem_event.23"]);
		}
		case (20)
		{
			player.ShowCaption(["event.useitem_event.24"]);
		}
		case (21)
		{
			player.ShowCaption(["event.useitem_event.25"]);
		}
		case (22)
		{
			player.ShowCaption(["event.useitem_event.26"]);
		}
		case (23)
		{
			player.ShowCaption(["event.useitem_event.27"]);
		}
		case (24)
		{
			player.ShowCaption(["event.useitem_event.28"]);
		}
		case (25)
		{
			player.ShowCaption(["event.useitem_event.29"]);
		}
		case (26)
		{
			player.ShowCaption(["event.useitem_event.30"]);
		}
		case (27)
		{
			player.ShowCaption(["event.useitem_event.31"]);
		}
		case (28)
		{
			player.ShowCaption(["event.useitem_event.32"]);
		}
		case (29)
		{
			player.ShowCaption(["event.useitem_event.33"]);
		}
		case (30)
		{
			player.ShowCaption(["event.useitem_event.34"]);
		}
		case (31)
		{
			player.ShowCaption(["event.useitem_event.35"]);
		}
		case (32)
		{
			player.ShowCaption(["event.useitem_event.36"]);
		}
		case (33)
		{
			player.ShowCaption(["event.useitem_event.37"]);
		}
	}
}
