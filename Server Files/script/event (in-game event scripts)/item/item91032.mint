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
	// �߱� ĳ�� ��í��(������) - ��Ʈ�� ���� ����
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(100);	//Ȯ���� ������ ���´�
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		meta_array itemArray;
		string itemString;
		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// Ȯ���� ���⿡�� ���
			case(0){ iCumRate += 9;}
			case(1){ iCumRate += 9;}
			case(2){ iCumRate += 11;}
			case(3){ iCumRate += 9;}
			case(4){ iCumRate += 9;}
			case(5){ iCumRate += 11;}
			case(6){ iCumRate += 13;}
			case(7){ iCumRate += 9;}
			case(8){ iCumRate += 11;}
			case(9){ iCumRate += 4;}
			case(10){ iCumRate += 5;}

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
					itemString = `id:91002 count:9`;
					itemArray.Add(itemString);	// ���� �ν�Ʈ ���� 9��
					itemString = `id:91001 count:8`;
					itemArray.Add(itemString);	// ����� �ν�Ʈ ���� 8��
				}
				case (1)
				{
					itemString = `id:91004 count:9`;
					itemArray.Add(itemString);	// ��ȣ�� ��� �ν�Ʈ ���� 5��
					itemString = `id:91003 count:8`;
					itemArray.Add(itemString);	// ���¹̳� �ν�Ʈ ���� 5��
				}
				case (2)
				{
					itemString = `id:63064 count:5`;
					itemArray.Add(itemString);	// ��Ʈ ��� �Ҳɳ��� ŰƮ 5��
					itemString = `id:63074 count:6`;
					itemArray.Add(itemString);	// ���� �Ҳɳ��� ŰƮ 6��
					itemString = `id:63075 count:6`;
					itemArray.Add(itemString);	// ����Ĺ �Ҳɳ��� ŰƮ 6��
				}
				case (3)
				{
					itemString = `id:63026 count:4`;
					itemArray.Add(itemString);	// ���� ���� �̿�� 4��
					itemString = `id:63026 count:5`;
					itemArray.Add(itemString);	// ���� ���� �̿�� 5��
					itemString = `id:63047 count:4`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ���� ������ �̿�� 8��
				}
				case (4)
				{
					itemString = `id:63043 count:7`;
					itemArray.Add(itemString);	// ���꽺�� ���� 7��
					itemString = `id:63044 count:5`;
					itemArray.Add(itemString);	// ��Ƽ ��Ȱ�� ���� 5��
				}
				case (5)
				{
					itemString = `id:63027 expire:43200`;	// �ж� ���� 4��
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemString = `id:63029 count:5`;
					itemArray.Add(itemString);
					itemString = `id:63029 count:4`;
					itemArray.Add(itemString);							// ķ�����̾� ŰƮ 9��
				}
				case (6)
				{
					itemString = `id:91007 expire:43200 count:2`;
					itemArray.Add(itemString);	// 17���� Ű�� �Ǵ� ���� 2��
					itemString = `id:91006 expire:43200 count:3`;
					itemArray.Add(itemString);	// 10���� Ű�� �Ǵ� ���� 3��
				}
				case (7)
				{
					itemString = `id:63025 count:2`;
					itemArray.Add(itemString);	// ��뷮 �ູ�� ���� 2��
					itemString = `id:91005 expire:43200 count:4`;
					itemArray.Add(itemString);	// ������ ��ȭ ���� 4��
				}
				case (8)
				{
					itemString = `id:51031 count:5`;
					itemArray.Add(itemString);	// ���� ȸ���� ���� 5��
					itemString = `id:63024 expire:10080`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ���� ���� 2��
				}
				case (9)
				{
					itemString = `id:91066`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ���ɼ������� 1~5
					itemString = `id:91067`;
					itemArray.Add(itemString);	// ���ɼ�������6~10
				}
				case (10)
				{
					itemString = `id:91059`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ��ü��1��
					itemString = `id:91063`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// ��ü��5��
				}

			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`�������� `+itemString+` �� ��`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
	}

	// �������� ���� ����Ʈ ������
	GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
	GiveFashionGachaphonItem(player, `id:91007`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
	GiveFashionGachaphonItem(player, `id:91008`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
