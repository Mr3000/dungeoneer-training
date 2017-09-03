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
		int iRandom = Random(2221);	//Ȯ���� ������ ���´�

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������

				case(0){itemString = `id:15338 `; iCumRate +=3;} //0.135074291�θ�ƽ �̺�� �巹��0.135074291
				case(1){itemString = `id:15339 `; iCumRate +=3;} //0.135074291�θ�ƽ ���� ��Ʈ0.270148582
				case(2){itemString = `id:15306 `; iCumRate +=3;} //0.135074291Ʈ��� ��Ƽ�� ����0.405222873
				case(3){itemString = `id:15112 `; iCumRate +=3;} //0.135074291������ �����̷�0.540297163
				case(4){itemString = `id:15079 `; iCumRate +=3;} //0.135074291������ �� ���� ��ĿƮ0.675371454
				case(5){itemString = `id:15233 `; iCumRate +=3;} //0.135074291�ٷ���Ʈ ��� �巹��0.810445745
				case(6){itemString = `id:15234 `; iCumRate +=3;} //0.135074291�ٷ���Ʈ ��� ��Ʈ0.945520036
				case(7){itemString = `id:16047 `; iCumRate +=20;} //0.900495272����Ÿ ��Ű �۷���1.846015308
				case(8){itemString = `id:16050 `; iCumRate +=20;} //0.900495272Ʈ��� ����ư �۷���2.746510581
				case(9){itemString = `id:17120 `; iCumRate +=20;} //0.900495272����Ÿ �÷� ��Ŭ ����3.647005853
				case(10){itemString = `id:17121 `; iCumRate +=20;} //0.900495272Ʈ��� ����4.547501126
				case(11){itemString = `id:18213 `; iCumRate +=20;} //0.900495272����Ÿ Ʈ�� ����5.447996398
				case(12){itemString = `id:18214 `; iCumRate +=20;} //0.900495272Ʈ��� ��Ƽ�� �͹�6.34849167
				case(13){itemString = `id:17135 `; iCumRate +=20;} //0.900495272������ ������7.248986943
				case(14){itemString = `id:17136 `; iCumRate +=20;} //0.900495272Ŭ���� ����8.149482215
				case(15){itemString = `id:16137 `; iCumRate +=20;} //0.900495272�� ���� �극�̽���9.049977488
				case(16){itemString = `id:16136 `; iCumRate +=20;} //0.900495272���̾� �Ƕ�̵� ���9.95047276
				case(17){itemString = `id:65048 count:2 `; iCumRate +=500;} //22.51238181���� ���� ����32.46285457
				case(18){itemString = `id:85040 count:3`; iCumRate +=300;} //13.50742909ü�� ����45.97028366
				case(19){itemString = `id:85041 count:3`; iCumRate +=300;} //13.50742909�ؾ� ����59.47771274
				case(20){itemString = `id:85042 count:3`; iCumRate +=300;} //13.50742909��� ����72.98514183
				case(21){itemString = `id:85043 count:3`; iCumRate +=300;} //13.50742909���� ����86.49257091
				case(22){itemString = `id:85044 count:3`; iCumRate +=300;} //13.50742909���� ����100

				// ����� ���������� ��

				default
				{
					itemString = `id:65048`; iCumRate +=1000;
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
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				return;
			}

			++i;
		}
}
