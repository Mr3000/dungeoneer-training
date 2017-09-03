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
	if (GetLocale().LowerCase() == `korea`)
	{
		//�̱� ���� ������
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(1245);	//Ȯ���� ������ ���´�
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0) {itemString = ` id:15469 `; iCumRate += 1 ;}// 0.080321285 ���� �ǻ� 
				case(1) {itemString = ` id:18518   col1:800000 col2:800000 col3:800000 `; iCumRate += 1 ;}// 0.080321285 ���� �巡�� ũ����Ʈ 
				case(2) {itemString = ` id:40225�� `; iCumRate += 1 ;}// 0.080321285 �� ���졡 
				case(3) {itemString = ` id:15499�� `; iCumRate += 1 ;}// 0.080321285 �ȵ�� ��� 
				case(4) {itemString = ` id:40350�� `; iCumRate += 1 ;}// 0.080321285 �ȵ�� ���͡� 
				case(5) {itemString = ` id:46006 `; iCumRate += 10 ;}// 0.803212851 ī��Ʈ �ǵ� 
				case(6) {itemString = ` id:13035   `; iCumRate += 20 ;}// 1.606425703 ����Ʈ ��ī ü�� ���� 
				case(7) {itemString = ` id:18040  `; iCumRate += 20 ;}// 1.606425703 �ڷ��� ���� ������ 
				case(8) {itemString = ` id:63030   `; iCumRate += 30 ;}// 2.409638554 ���� ���� ���� ���� 
				case(9) {itemString = ` id:62005  prefix:7 `; iCumRate += 50 ;}// 4.016064257 ��æƮ ��ũ�� (���� ����) 
				case(10) {itemString = ` id:16520   `; iCumRate += 50 ;}// 4.016064257 �� ���� �۷��� 
				case(11) {itemString = ` id:14006   `; iCumRate += 50 ;}// 4.016064257 ���� ���� 
				case(12) {itemString = ` id:14004   `; iCumRate += 50 ;}// 4.016064257 Ŭ�ν� ���� 
				case(13) {itemString = ` id:18500   `; iCumRate += 50 ;}// 4.016064257 �� ���� �︧ 
				case(14) {itemString = ` id:18501   `; iCumRate += 50 ;}// 4.016064257 ����� �︧ 
				case(15) {itemString = ` id:18502   `; iCumRate += 50 ;}// 4.016064257 �� �︧ 
				case(16) {itemString = ` id:18503   `; iCumRate += 50 ;}// 4.016064257 �����þ� �︧ 
				case(17) {itemString = ` id:18504   `; iCumRate += 50 ;}// 4.016064257 ũ�ν� Ǯ �︧ 
				case(18) {itemString = ` id:18505   `; iCumRate += 50 ;}// 4.016064257 ������ũ �︧ 
				case(19) {itemString = ` id:18542   `; iCumRate += 50 ;}// 4.016064257 �� ü�� Ǯ �︧ 
				case(20) {itemString = ` id:18543   `; iCumRate += 50 ;}// 4.016064257 �� ���� Ǯ �︧ 
				case(21) {itemString = ` id:18544   `; iCumRate += 50 ;}// 4.016064257 �� �縮ĭ �������� 
				case(22) {itemString = ` id:18547   `; iCumRate += 50 ;}// 4.016064257 �� �ĳ��� ��� �������� 
				case(23) {itemString = ` id:51007   count:10 `; iCumRate += 60 ;}// 4.819277108 ���� 30 ���� 
				case(24) {itemString = ` id:51003   count:5 `; iCumRate += 100 ;}// 8.032128514 ����� 50 ���� 
				case(25) {itemString = ` id:51004   count:3 `; iCumRate += 100 ;}// 8.032128514 ����� 100 ���� 
				case(26) {itemString = ` id:51013   count:5 `; iCumRate += 100 ;}// 8.032128514 ���¹̳� 50 ���� 
				case(27) {itemString = ` id:51014   count:3 `; iCumRate += 100 ;}// 8.032128514 ���¹̳� 100 ���� 
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
				GiveZombieGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}

			++i;
		}
		GiveZombieGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
	}
	else
	{
		//�̱� ���� ������
		int iCumRate = 0; //Ȯ���� �����س��� ����
		int i=0;
		int iRandom = Random(1278);	//Ȯ���� ������ ���´�
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
			{
				// ����� ��������
				case(0){itemString = `id:15469`  ; iCumRate += 5 ;} //0.0784929356 ���� �ǻ�
				case(1){itemString = `id:18518   col1:800000 col2:800000 col3:800000`; iCumRate += 1 ;} //0.0784929356 ���� �巡�� ũ����Ʈ
				case(2){itemString = `id:40171  `; iCumRate += 1 ;} //0.0784929356 ���繫��
				case(3){itemString = `id:40170  `; iCumRate += 1 ;} //0.0784929356 �Ϻ��� ��հ�
				case(4){itemString = `id:14023  `; iCumRate += 10;} //0.7849293564 �� ���� �Ƹ�(������)
				case(5){itemString = `id:14024  `; iCumRate += 10;} //0.7849293564 �� ���� �Ƹ�(������)
				case(6){itemString = `id:18551  `; iCumRate += 10;} //0.7849293564 �� ���� �︧
				case(7){itemString = `id:46008  `; iCumRate += 10;} //0.7849293564 ����Ʈ ���׷� ī��Ʈ �ǵ�
				case(8){itemString = `id:13035  `; iCumRate += 10;} //0.7849293564 ����Ʈ ��ī ü�� ����
				case(9){itemString = `id:18040 `; iCumRate += 10;} //0.7849293564 �ڷ��� ���� ������
				case(10){itemString = `id:63030  `; iCumRate += 30 ;} //2.3547880691 ���� ���� ���� ����
				case(11){itemString = `id:62005  prefix:7`; iCumRate += 50 ;} //3.9246467818 ��æƮ ��ũ�� (���� ����)
				case(12){itemString = `id:16520  `; iCumRate += 50 ;} //3.9246467818 �� ���� �۷���
				case(13){itemString = `id:14006  `; iCumRate += 50 ;} //3.9246467818 ���� ����
				case(14){itemString = `id:14004  `; iCumRate += 50 ;} //3.9246467818 Ŭ�ν� ����
				case(15){itemString = `id:18500  `; iCumRate += 50 ;} //3.9246467818 �� ���� �︧
				case(16){itemString = `id:18501  `; iCumRate += 50 ;} //3.9246467818 ����� �︧
				case(17){itemString = `id:18502  `; iCumRate += 50 ;} //3.9246467818 �� �︧
				case(18){itemString = `id:18503  `; iCumRate += 50 ;} //3.9246467818 �����þ� �︧
				case(19){itemString = `id:18504  `; iCumRate += 50 ;} //3.9246467818 ũ�ν� Ǯ �︧
				case(20){itemString = `id:18505  `; iCumRate += 50 ;} //3.9246467818 ������ũ �︧
				case(21){itemString = `id:18542  `; iCumRate += 50 ;} //3.9246467818 �� ü�� Ǯ �︧
				case(22){itemString = `id:18543  `; iCumRate += 50 ;} //3.9246467818 �� ���� Ǯ �︧
				case(23){itemString = `id:18544  `; iCumRate += 50 ;} //3.9246467818 �� �縮ĭ ��������
				case(24){itemString = `id:18547  `; iCumRate += 50 ;} //3.9246467818 �� �ĳ��� ��� ��������
				case(25){itemString = `id:51007   count:10`; iCumRate += 80 ;} //6.2794348509 ���� 30 ����
				case(26){itemString = `id:51003   count:5`; iCumRate += 100 ;} //7.8492935636 ����� 50 ����
				case(27){itemString = `id:51004   count:3`; iCumRate += 100 ;} //7.8492935636 ����� 100 ����
				case(28){itemString = `id:51013   count:5`; iCumRate += 100 ;} //7.8492935636 ���¹̳� 50 ����
				case(29){itemString = `id:51014   count:3`; iCumRate += 100 ;} //7.8492935636 ���¹̳� 100 ����
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
				GiveZombieGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}

			++i;
		}
		GiveZombieGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�
	}
}
