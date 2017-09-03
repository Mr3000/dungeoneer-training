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
	// �븸 ȫ���� �ų� Ȳ�� �� �� ��
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int itemID = cItem.GetClassId();
	int i=0;
	int iRandom = Random(100);	//Ȯ���� ������ ���´�

	while(true)
	{
		bool bBreak = false;
		meta_array itemArray;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// Ȯ���� ���⿡�� ���
			case(0){ iCumRate += 40;}
			case(1){ iCumRate += 30;}
			case(2){ iCumRate += 15;}
			case(3){ iCumRate += 12;}
			case(4){ iCumRate += 3;}

			// ����� ���������� ��
			default
			{
				bBreak = true;
			}
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			{
				// �ִ� �������� ���⿡�� ���
				case (0)
				{
					itemString = `id:2000 count:100`;
					itemArray.Add(itemString);	// ��ȭ 100
				}
				case (1)
				{
					itemString = `id:2000 count:500`;
					itemArray.Add(itemString);	// ��ȭ 500
				}
				case (2)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);	// ��ȭ 1000
				}
				case (3)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ��ȭ 5000
				}
				case (4)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ��ȭ 10000
				}
			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`�������� `+itemString+` �� ��`);
				GiveHongBaoItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
	}

	// �������� ���� ����Ʈ ������
	GiveHongBaoItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
