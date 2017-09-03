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
	// ��������
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //Ȯ���� �����س��� ����
	int i=0;
	int iRandom = Random(1000);	//Ȯ���� ������ ���´�
	meta_array emptyArray;

	while(true)
	{
		bool bBreak = false;
		meta_array items;		// ���ÿ� �������� �ֱ� ���� �迭�� �����.

		switch(i)
		//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
		{
			// ����� ��������
		case(0){
				items.Add(`id:40095 col1:333333 col2:111111 col3:111111 `);//������ �巡�� ���̵�
				items.Add(`id:18551`);//������ �︧
				items.Add(`id:16519`);//��ȣȭ �尩
				iCumRate+=8;}
		case(1){
				items.Add(`id:15108`);//���� ���̵� ��ũž
				items.Add(`id:15112`);//������ ���� ���̷�
				items.Add(`id:13045`);//�Ƹ��� �ƽ��� �Ƹ� (������)
				iCumRate+=8;}
		case(2){
				items.Add(`id:14042`);//�ý�ƾ ���� �Ƹ�
				items.Add(`id:46006 col1:eeeeee col2:660000 col3:eeeeee`);//������ ī��Ʈ �ǵ�
				items.Add(`id:40049 col1:660000`);//�÷�Ʈ
				iCumRate+=8;}
		case(3){
				items.Add(`id:40080 col1:FF99FA col2:000000`);//��ȫ �۶��콺
				items.Add(`id:40002 col1:FFAAAA`);//������ ��
				items.Add(`id:40081 col1:101010 col2:990000`);//������ ���� �� ����
				iCumRate+=8;}
		case(4){
				items.Add(`id:19013 col1:0053a6 col2:000000 col3:000000`);//�߱� ���÷� �κ�
				items.Add(`id:46004 col1:8BBED8`);//�ϴû� ����
				items.Add(`id:40044 col1:8BBED8`);//�ϴû� �ٿ뵵 ����
				iCumRate+=8;}
		case(5){
				items.Add(`id:40003`);//������
				items.Add(`id:40083`);//�� ĿƲ����
				items.Add(`id:13023`);//���� �÷���Ʈ �Ƹ�(BŸ��)
				iCumRate+=8;}
		case(6){
				items.Add(`id:40049 col1:111111`);//�÷�Ʈ
				items.Add(`id:40025 col1:000000 col2:f4f4f4`);//���
				items.Add(`id:17521`);//������ ����
				iCumRate+=73;}
		case(7){
				items.Add(`id:40024 col1:000000 col2:f4f4f4`);//����&��� �������� ��ġ
				items.Add(`id:40045`);//���˴�
				items.Add(`id:18044 col1:000000`);//���˿� ����
				iCumRate+=73;}
		case(8){
				items.Add(`id:40037`);//Ǫ��Į
				items.Add(`id:17521`);//������ ����
				items.Add(`id:18541`);//��Ӹ� ����
				iCumRate+=73;}
		case(9){
				items.Add(`id:15109`);//Ƽ�μ�Ʈ
				items.Add(`id:40045`);//���˴�
				items.Add(`id:14023 col1:000000 col2:000000`);//�������Ƹ� ������
				iCumRate+=73;}
		case(10){
				items.Add(`id:40177`);//������ �׽�
				items.Add(`id:40002`);//������ ��
				items.Add(`id:16527`);//������ ��Ʋ��
				iCumRate+=73;}
		case(11){
				items.Add(`id:40011`);//��ε� �ҵ�
				items.Add(`id:46005`);//�������̺�
				items.Add(`id:40042 col1:101010 col2:720000 `);//������ ��Į
				iCumRate+=73;}
		case(12){
				items.Add(`id:18159 col1:990000`);//���� �Ȱ�
				items.Add(`id:46004 col1:8CBD47`);//����
				items.Add(`id:40044 col1:8CBD47`);//�ٿ뵵 ����
				iCumRate+=73;}
		case(13){
				items.Add(`id:40044 col1:E5B2E2`);//������ �ٿ뵵 ����
				items.Add(`id:46004 col1:E5B2E2`);//������ ����
				items.Add(`id:40017`);//������
				iCumRate+=73;}
		case(14){
				items.Add(`id:40015`);//�÷�Ʈ �� �ҵ�
				items.Add(`id:40017 col1:101010 col2:101010 col3:ffffff`);//������&��� ������
				iCumRate+=73;}
		case(15){
				items.Add(`id:16528`);//������ ��Ʋ��
				items.Add(`id:18088 col1:8f802d39`);//ȭ��
				items.Add(`id:40002`);//��
				iCumRate+=73;}
		case(16){
				items.Add(`id:15275`);//����̿�
				items.Add(`id:40068`);//���� ��� ���ú�
				items.Add(`id:40069`);//���� ��� ���ú�
				items.Add(`id:40070`);//�� ��� ���ú�
				iCumRate+=74;}
		case(17){
				items.Add(`id:16026`);//���� �������� ��Ʈ �۷���
				items.Add(`id:40055`);//O ǥ����
				items.Add(`id:40056`);//X ǥ����
				iCumRate+=74;}
		case(18){
				items.Add(`id:40163`);//��ī����
				items.Add(`id:18111`);//���� ���� ��ǰ
				items.Add(`id:15061`);//���� ���� �� Ʈ�� Ʃ��
				items.Add(`id:46006`);//ī��Ʈ�ǵ�
				iCumRate+=74;}
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
			int j;
			for (j = 0; j < items.GetSize(); ++j)
			{
				DebugOut(`�������� `+ (string)items.Get(j) + ` �� ��`);
				GiveFashionGachaphonItem(player, (string)items.Get(j), itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
		items = emptyArray;	// Clear()�� �۵����� �ʾ� �ӽ÷� ó��
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //��ũ��Ʈ�� Ʋ�Ȱų� �ؼ� �������� ����� �ȳ����� �ϴ� �̰� ��. Ȯ������ ������ iRandom�� ���������� �ִ°� �������ÿ�	
}
