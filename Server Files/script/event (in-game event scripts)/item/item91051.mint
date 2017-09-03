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
	// �븸 ȫ����
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)	// �븸�� ���
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
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
				case(0){itemString = `id:40095 col1:008080`; iCumRate +=1;}//�巹�� ���̵�
				case(1){itemString = `id:40081 col1:008080 col2:008080`; iCumRate +=1;}//���� �� ����
				case(2){itemString = `id:18228`; iCumRate +=1;}//������ �޸� ���� ����
				case(3){itemString = `id:40103`; iCumRate +=1;}//�ȷɵ�
				case(4){itemString = `id:15215`; iCumRate +=5;}//�߱� �ų� ������(������)
				case(5){itemString = `id:15216`; iCumRate +=5;}//�߱� �ų� ������(������)
				case(6){itemString = `id:18151`; iCumRate +=5;}//�߱� �ų� �� ����(������)
				case(7){itemString = `id:18152`; iCumRate +=5;}//�߱� �ų� �Ӹ� ���(������)
				case(8){itemString = `id:40011 col1:008080`; iCumRate +=5;}//��ε� �ҵ�
				case(9){itemString = `id:40012 col1:008080`; iCumRate +=5;}//�ٽ�Ÿ�� �ҵ�
				case(10){itemString = `id:40031 col1:008080`; iCumRate +=5;}//����
				case(11){itemString = `id:40080 col1:008080`; iCumRate +=5;}//�۶��콺
				case(12){itemString = `id:51004 count:10`; iCumRate +=5;}//����� 100 ����
				case(13){itemString = `id:51009 count:10`; iCumRate +=5;}//���� 100 ����
				case(14){itemString = `id:51014 count:10`; iCumRate +=5;}//���¹̳� 100 ����
				case(15){itemString = `id:81142`; iCumRate +=6;}//���� ���� ȭ��
				case(16){itemString = `id:81136`; iCumRate +=7;}//���� ��� ����
				case(17){itemString = `id:81137`; iCumRate +=7;}//���� ��� ���̺�
				case(18){itemString = `id:81139`; iCumRate +=7;}//���� ��� �׾Ƹ�
				case(19){itemString = `id:81140`; iCumRate +=7;}//���� ��� ȭ��
				case(20){itemString = `id:81141`; iCumRate +=7;}//���ξ��� ȭ��
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
				GiveHongBaoItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
	}
	else // if(IsCurrentEvent(`lunar_newyear_2009_china`))
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
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
				case(0){ iCumRate += 15;}
				case(1){ iCumRate += 20;}
				case(2){ iCumRate += 55;}
				case(3){ iCumRate += 5;}
				case(4){ iCumRate += 5;}
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
						itemString = `id:2000 count:8`;
						itemArray.Add(itemString);	// ��ȭ 8
					}
					case (1)
					{
						itemString = `id:2000 count:88`;
						itemArray.Add(itemString);	// ��ȭ 88
					}
					case (2)
					{
						itemString = `id:2000 count:888`;
						itemArray.Add(itemString);	// ��ȭ 888
					}
					case (3)
					{
						itemString = `id:2000 count:8888`;
						itemArray.Add(itemString);	// ��ȭ 8888
					}
					case (4)
					{
						itemString = `id:46021`;
						itemArray.Add(itemString);	// ���� ����
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
	}
/*
	else
	{
		int iCumRate = 0; //Ȯ���� �����س��� ����
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
				case(0){ iCumRate += 5;}
				case(1){ iCumRate += 15;}
				case(2){ iCumRate += 50;}
				case(3){ iCumRate += 15;}
				case(4){ iCumRate += 5;}
				case(5){ iCumRate += 10;}

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
						itemString = `id:2000 count:10`;
						itemArray.Add(itemString);	// ��ȭ 10
					}
					case (1)
					{
						itemString = `id:2000 count:100`;
						itemArray.Add(itemString);	// ��ȭ 100
					}
					case (2)
					{
						itemString = `id:2000 count:500`;
						itemArray.Add(itemString);	// ��ȭ 500
					}
					case (3)
					{
						itemString = `id:2000 count:1000`;
						itemArray.Add(itemString);	// ��ȭ 1000
					}
					case (4)
					{
						itemString = `id:2000 count:1000`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);	// ��ȭ 5000
					}
					case (5)
					{
						if (player.IsGiant())
						{
							if (player.IsFemale())
							{
								itemString = `id:18212`;
							}
							else
							{
								itemString = `id:18211`;
							}
						}
						else
						{
							itemString = `id:18210`;
						}
						itemArray.Add(itemString);
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
	}
*/

	// �������� ���� ����Ʈ ������
	GiveHongBaoItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
