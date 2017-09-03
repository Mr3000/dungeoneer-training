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
		if(GetLocale().LowerCase()== `japan`)
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(5053);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:40031 col1:eeeeee`; iCumRate +=1;} //0.019790224��� ���� ������ UP
					case(1){itemString = `id:50256 `; iCumRate +=1;} //0.019790224ŷ ũ��
					case(2){itemString = `id:50259 `; iCumRate +=1;} //0.019790224����ġ
					case(3){itemString = `id:18547 col2:5B000c54`; iCumRate +=1;} //0.019790224�� �ĳ��� ��� ��������
					case(4){itemString = `id:18156 col1:eeeeee`; iCumRate +=1;} //0.019790224��� ��۸�
					case(5){itemString = `id:40226 col1:333333 col2:333333 quality:80`; iCumRate +=1;} //0.019790224��� �ֽ����� �� ���
					case(6){itemString = `id:40095 prefix:21402 suffix:31017 quality:85`; iCumRate +=1;} //0.019790224��� �����ӵ� ��Ʈ���� �巹�� ���̵�
					case(7){itemString = `id:46006 suffix:31014`; iCumRate +=1;} //0.019790224������ ī��Ʈ�ǵ�
					case(8){itemString = `id:46001 col1:111111 col2:eeeeee`; iCumRate +=1;} //0.019790224�Ͼ� ���� ���� �ǵ�
					case(9){itemString = `id:13032 quality:90`; iCumRate +=1;} //0.019790224����Ƽ 90 �߷��þ� �Ƹ� (7/4)
					case(10){itemString = `id:18549 prefix:20713`; iCumRate +=1;} //0.019790224����ú� �巡�� �縯�� ��� (�߰���)
					case(11){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.019790224����ú� �巡�� �縯�� ��� (�߰���)
					case(12){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate +=4;} //0.079160895������ ������ ���壨�����ʱ�����
					case(13){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate +=4;} //0.079160895������ �߱� ���÷� �κ�
					case(14){itemString = `id:19031 `; iCumRate +=4;} //0.079160895��Ÿ����Ʈ �κ�
					case(15){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate +=4;} //0.079160895��� �߱� ���÷� �κ�
					case(16){itemString = `id:40231 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895ũ����Ż ����Ʈ�� ���� ������
					case(17){itemString = `id:40232 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895ũ��� ���̽� ���� ������
					case(18){itemString = `id:40233 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895�Ǵн� ���̾� ���� ������
					case(19){itemString = `id:62005 suffix:30714`; iCumRate +=4;} //0.079160895��æƮ��������ī)
					case(20){itemString = `id:62005 suffix:31105`; iCumRate +=4;} //0.079160895��æƮ����������)
					case(21){itemString = `id:62005 suffix:30913`; iCumRate +=4;} //0.079160895��æƮ����������)
					case(22){itemString = `id:62005 prefix:21006`; iCumRate +=4;} //0.079160895��æƮ��������)
					case(23){itemString = `id:63030 col1:000000`; iCumRate +=4;} //0.079160895������ ���� ���� ���� ����
					case(24){itemString = `id:63030 col1:c00000`; iCumRate +=4;} //0.079160895���� ���� ���� ���� ����
					case(25){itemString = `id:63030 col1:f0f0f0`; iCumRate +=4;} //0.079160895�Ͼ� ���� ���� ���� ����
					case(26){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354���� �̴� ��ĿƮ
					case(27){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=15;} //0.296853354���̳��巹��
					case(28){itemString = `id:18044 `; iCumRate +=15;} //0.296853354���˿� ����
					case(29){itemString = `id:16519 `; iCumRate +=15;} //0.296853354��ȣȭ �尩
					case(30){itemString = `id:18046 `; iCumRate +=15;} //0.296853354�հ��� �Ӹ����
					case(31){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=15;} //0.296853354Ŭ���� ������ ����
					case(32){itemString = `id:15060 `; iCumRate +=15;} //0.296853354���� �̳ʷκ� ����
					case(33){itemString = `id:17041 `; iCumRate +=15;} //0.296853354�������� ���ú���
					case(34){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354���̵� ���� �巹��
					case(35){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354�߱� ���÷� �κ�
					case(36){itemString = `id:18060 `; iCumRate +=15;} //0.296853354�� �䳢 �Ӹ���5
					case(37){itemString = `id:18065 `; iCumRate +=15;} //0.296853354���� �䳢 �Ӹ���5
					case(38){itemString = `id:18070 `; iCumRate +=15;} //0.296853354�� �䳢 �Ӹ���5
					case(39){itemString = `id:62005 suffix:30702`; iCumRate +=15;} //0.296853354��æƮ�����̺죩
					case(40){itemString = `id:62005 suffix:30501`; iCumRate +=15;} //0.296853354��æƮ�����̾�Ʈ��
					case(41){itemString = `id:62005 suffix:30302`; iCumRate +=15;} //0.296853354��æƮ���ں�Ʈ��
					case(42){itemString = `id:18051 `; iCumRate +=15;} //0.296853354�ڷ��� ���� ����
					case(43){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate +=15;} //0.296853354�ڷ��� ���ڽ�Ʈ
					case(44){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=15;} //0.296853354����ǳ ���纹
					case(45){itemString = `id:15055 `; iCumRate +=20;} //0.395804473���� �̴� ���ǽ�
					case(46){itemString = `id:46006 `; iCumRate +=20;} //0.395804473ī��Ʈ �ǵ�
					case(47){itemString = `id:15053 `; iCumRate +=20;} //0.395804473�÷�Į�� ���ǽ�
					case(48){itemString = `id:17045 `; iCumRate +=20;} //0.395804473���� �� ���� ���� ����
					case(49){itemString = `id:17040 `; iCumRate +=20;} //0.395804473���� ��Ʈ�� ����
					case(50){itemString = `id:18113 `; iCumRate +=20;} //0.395804473������ ����� ����
					case(51){itemString = `id:18114 `; iCumRate +=20;} //0.395804473�ٹ��� ����� ����
					case(52){itemString = `id:18115 `; iCumRate +=20;} //0.395804473�� ����� ����
					case(53){itemString = `id:62005 prefix:207`; iCumRate +=20;} //0.395804473��æƮ��������
					case(54){itemString = `id:15029 `; iCumRate +=20;} //0.395804473��ũ �������̿�
					case(55){itemString = `id:15151 `; iCumRate +=20;} //0.395804473���帶���� ���̽�Ʈ ���Ϸ� ��������룩
					case(56){itemString = `id:15152 `; iCumRate +=20;} //0.395804473���帶���� ���̽�Ʈ ���Ϸ� ��������룩
					case(57){itemString = `id:15153 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ�������룩
					case(58){itemString = `id:15154 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ�������룩
					case(59){itemString = `id:15045 `; iCumRate +=20;} //0.395804473���̽� �÷�Ŷ ����
					case(60){itemString = `id:15026 `; iCumRate +=20;} //0.395804473������ �ս�ĿƮ
					case(61){itemString = `id:15016 `; iCumRate +=20;} //0.395804473����� ��Ÿŷ ������
					case(62){itemString = `id:15051 `; iCumRate +=20;} //0.395804473Ÿ��Ʈ ��Ʈ ����
					case(63){itemString = `id:18011 `; iCumRate +=20;} //0.395804473��� ������ ĸ
					case(64){itemString = `id:18124 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ ĸ
					case(65){itemString = `id:18009 `; iCumRate +=20;} //0.395804473��� ���� ĸ
					case(66){itemString = `id:18014 `; iCumRate +=20;} //0.395804473��� ����
					case(67){itemString = `id:18000 `; iCumRate +=20;} //0.395804473��ũ ����
					case(68){itemString = `id:16013 `; iCumRate +=20;} //0.395804473�˻� �尩
					case(69){itemString = `id:16032 `; iCumRate +=20;} //0.395804473���� �۷���
					case(70){itemString = `id:63030 `; iCumRate +=20;} //0.395804473���� ���� ���� ����
					case(71){itemString = `id:18112 `; iCumRate +=20;} //0.395804473�� ���� ��ǰ
					case(72){itemString = `id:18111 `; iCumRate +=20;} //0.395804473���� ���� ��ǰ
					case(73){itemString = `id:18110 `; iCumRate +=20;} //0.395804473���� ���� ��ǰ
					case(74){itemString = `id:18109 `; iCumRate +=20;} //0.395804473���� ���� ��ǰ
					case(75){itemString = `id:18108 `; iCumRate +=20;} //0.395804473���� ���� ��ǰ
					case(76){itemString = `id:18029 `; iCumRate +=20;} //0.395804473������ �Ȱ�
					case(77){itemString = `id:18028 `; iCumRate +=20;} //0.395804473���̽� �Ȱ�
					case(78){itemString = `id:19008 `; iCumRate +=20;} //0.395804473���� �Ǵ� �κ�
					case(79){itemString = `id:19009 `; iCumRate +=20;} //0.395804473���� ���� �κ�
					case(80){itemString = `id:19017 `; iCumRate +=20;} //0.395804473���� �κ�
					case(81){itemString = `id:19016 `; iCumRate +=20;} //0.395804473�� �κ�
					case(82){itemString = `id:40053 `; iCumRate +=20;} //0.395804473����� ��� �ɴٹ�
					case(83){itemString = `id:40051 `; iCumRate +=20;} //0.395804473����� ��� �Ѽ���
					case(84){itemString = `id:18089 `; iCumRate +=20;} //0.395804473����� ��� ���
					case(85){itemString = `id:40054 `; iCumRate +=20;} //0.395804473�Ķ� ��� �ɴٹ�
					case(86){itemString = `id:40052 `; iCumRate +=20;} //0.395804473�Ķ� ��� �Ѽ���
					case(87){itemString = `id:16500 `; iCumRate +=20;} //0.395804473�ﳪ �������� �۷���
					case(88){itemString = `id:19020 `; iCumRate +=20;} //0.395804473��Ÿ�� ����� ��Ʈ
					case(89){itemString = `id:62005 prefix:7 `; iCumRate +=20;} //0.395804473��æƮ���������ͣ�
					case(90){itemString = `id:16520 `; iCumRate +=20;} //0.395804473�� ���� �۷���
					case(91){itemString = `id:15128 `; iCumRate +=20;} //0.395804473�� �� ���� �巹��
					case(92){itemString = `id:16019 `; iCumRate +=20;} //0.395804473�ٹ��� �ȸ� �尩
					case(93){itemString = `id:18047 `; iCumRate +=20;} //0.395804473�ڷ��� ��Ʈ ����
					case(94){itemString = `id:18008 `; iCumRate +=20;} //0.395804473��Ʈ������ ĸ
					case(95){itemString = `id:15025 `; iCumRate +=20;} //0.395804473�����б� ���ڱ���
					case(96){itemString = `id:18043 `; iCumRate +=20;} //0.395804473�ڷ��� ��Ʈ ����
					case(97){itemString = `id:18026 `; iCumRate +=20;} //0.395804473��� ���θ���
					case(98){itemString = `id:15052 `; iCumRate +=20;} //0.395804473��ũ�� ���� Ʃ��
					case(99){itemString = `id:19005 `; iCumRate +=20;} //0.395804473���÷� �κ�
					case(100){itemString = `id:18040 `; iCumRate +=20;} //0.395804473�ڷ��� ���� ������
					case(101){itemString = `id:18038 `; iCumRate +=20;} //0.395804473���� �跿 ����
					case(102){itemString = `id:15042 `; iCumRate +=20;} //0.395804473�ճ� ���ǽ�
					case(103){itemString = `id:63025 count:3`; iCumRate +=20;} //0.395804473��뷮 �ູ�� ����
					case(104){itemString = `id:17006 `; iCumRate +=20;} //0.395804473õ�Ź�
					case(105){itemString = `id:18086 `; iCumRate +=20;} //0.395804473������ �� ���
					case(106){itemString = `id:18087 `; iCumRate +=20;} //0.395804473��� �� ���
					case(107){itemString = `id:18088 `; iCumRate +=20;} //0.395804473ȭ��
					case(108){itemString = `id:18090 `; iCumRate +=20;} //0.395804473�Ķ� ��� ���
					case(109){itemString = `id:40046 `; iCumRate +=20;} //0.395804473��� �Ѽ���
					case(110){itemString = `id:40047 `; iCumRate +=20;} //0.395804473��� �ɴٹ�
					case(111){itemString = `id:18541 `; iCumRate +=20;} //0.395804473��Ӹ� ����
					case(112){itemString = `id:18103 `; iCumRate +=20;} //0.395804473���� ����
					case(113){itemString = `id:18010 `; iCumRate +=20;} //0.395804473��� ����Ʈ ĸ
					case(114){itemString = `id:15131 `; iCumRate +=20;} //0.395804473�� �������� ��ĿƮ
					case(115){itemString = `id:17005 `; iCumRate +=20;} //0.395804473��ɲ� �Ź�
					case(116){itemString = `id:17002 `; iCumRate +=20;} //0.395804473�˻� �Ź�
					case(117){itemString = `id:17022 `; iCumRate +=20;} //0.395804473��������
					case(118){itemString = `id:17007 `; iCumRate +=20;} //0.395804473���� ����
					case(119){itemString = `id:16009 `; iCumRate +=20;} //0.395804473��ɲ��尩
					case(120){itemString = `id:15031 `; iCumRate +=20;} //0.395804473�����б��� ���� ����
					case(121){itemString = `id:19012 `; iCumRate +=20;} //0.395804473Ʈ��� ���̾�� �κ�
					case(122){itemString = `id:18004 `; iCumRate +=20;} //0.395804473��� �мǸ���
					case(123){itemString = `id:15132 `; iCumRate +=20;} //0.395804473���߷� ����Ʈ ����
					case(124){itemString = `id:15043 `; iCumRate +=20;} //0.395804473����Ƽ ���Ʈ
					case(125){itemString = `id:17017 `; iCumRate +=20;} //0.395804473������Ʈ ����
					case(126){itemString = `id:16006 `; iCumRate +=20;} //0.395804473����� �尩
					case(127){itemString = `id:17060 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ ����(������)
					case(128){itemString = `id:17061 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ ����(������)
					case(129){itemString = `id:17019 `; iCumRate +=20;} //0.395804473�������� �Ź�
					case(130){itemString = `id:17067 `; iCumRate +=20;} //0.395804473���� Ÿ�� �� ����
					case(131){itemString = `id:17008 `; iCumRate +=20;} //0.395804473�ڷ��� �����������룩
					case(132){itemString = `id:17010 `; iCumRate +=20;} //0.395804473�ڷ��� �����������룩
					case(133){itemString = `id:17023 `; iCumRate +=20;} //0.395804473������ �Ź�
					case(134){itemString = `id:16031 `; iCumRate +=20;} //0.395804473�������� Ÿ��Ʈ �۷���
					case(135){itemString = `id:16026 `; iCumRate +=20;} //0.395804473���� �������� ��Ʈ �۷���
					case(136){itemString = `id:16016 `; iCumRate +=20;} //0.395804473����Ʈ �۷���
					case(137){itemString = `id:17003 `; iCumRate +=20;} //0.395804473���� �Źߣ������룩
					case(138){itemString = `id:17024 `; iCumRate +=20;} //0.395804473��� ����
					case(139){itemString = `id:17013 `; iCumRate +=20;} //0.395804473�β��� ����
					case(140){itemString = `id:17069 `; iCumRate +=20;} //0.395804473���� ����
					case(141){itemString = `id:15020 `; iCumRate +=20;} //0.395804473�ڷ��� �����巹��
					case(142){itemString = `id:15044 `; iCumRate +=20;} //0.395804473����� �۾���
					case(143){itemString = `id:15041 `; iCumRate +=20;} //0.395804473�繫�� ������ ��Ʈ
					case(144){itemString = `id:15027 `; iCumRate +=20;} //0.395804473��� �ս�ĿƮ
					case(145){itemString = `id:15018 `; iCumRate +=20;} //0.395804473��� �����ڿʣ������룩
					case(146){itemString = `id:15033 `; iCumRate +=20;} //0.395804473��� �����ڿ�(�����룩
					case(147){itemString = `id:15023 `; iCumRate +=20;} //0.395804473��ũ ��ɲۿʣ������룩
					case(148){itemString = `id:15035 `; iCumRate +=20;} //0.395804473��ũ ��ɲۿʣ������룩
					case(149){itemString = `id:19003 `; iCumRate +=20;} //0.395804473Ʈ���ݷθ� �κ�
					case(150){itemString = `id:63024 expire:10080 `; iCumRate +=20;} //0.395804473���� ����
					case(151){itemString = `id:18002 `; iCumRate +=20;} //0.395804473��� ĸ
					case(152){itemString = `id:51014 count:5`; iCumRate +=20;} //0.395804473���¹̳� 100 ���� 5��
					case(153){itemString = `id:51004 count:5`; iCumRate +=20;} //0.395804473����� 100���� 5��
					case(154){itemString = `id:51009 count:5`; iCumRate +=20;} //0.395804473���� 100���� 5��
					case(155){itemString = `id:51101 count:1`; iCumRate +=50;} //0.989511181���� ���
					case(156){itemString = `id:51102 count:1`; iCumRate +=50;} //0.989511181���� ���
					case(157){itemString = `id:51103 count:1`; iCumRate +=50;} //0.989511181�����Ʈ ���
					case(158){itemString = `id:51104 count:1`; iCumRate +=50;} //0.989511181���̽� ���
					case(159){itemString = `id:51105 count:1`; iCumRate +=50;} //0.989511181��� ���
					case(160){itemString = `id:51106 count:1`; iCumRate +=50;} //0.989511181�� ���Ե� ���
					case(161){itemString = `id:51107 count:1`; iCumRate +=50;} //0.989511181ȭ��Ʈ ���
					case(162){itemString = `id:51108 count:1`; iCumRate +=50;} //0.989511181�ص���
					case(163){itemString = `id:51109 count:1`; iCumRate +=50;} //0.989511181������ ���
					case(164){itemString = `id:51110 count:1`; iCumRate +=50;} //0.989511181���巹��ũ
					case(165){itemString = `id:15284 `; iCumRate +=500;} //9.895111815������ ��Ʈ
					case(166){itemString = `id:15285 `; iCumRate +=500;} //9.895111815������ �巹��
					case(167){itemString = `id:18568 `; iCumRate +=1000;} //19.79022363���ڸ���
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
	//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
					return;
				}

				++i;
			}
		}


		else
		{
			int iCumRate = 0; //Ȯ���� �����س��� ����
			int i=0;
			int iRandom = Random(1890);	//Ȯ���� ������ ���´�

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i���� �ϳ��� �÷����鼭 case�� ������ ����Ʈ�� �������� Ȯ���� ���Ѵ�
				{
					// ����� ��������
					case(0){itemString = `id:40031 col1:eeeeee`; iCumRate += 1;} //0.0529100529 1890��� ����
					case(1){itemString = `id:18156 col1:eeeeee`; iCumRate += 1;} //0.0529100529 1890��� ��۸�
					case(2){itemString = `id:40226 col1:333333 col2:333333 quality:80`; iCumRate += 1;} //0.0529100529 1890��� �ֽ����� �� ���
					case(3){itemString = `id:40095 prefix:21402 suffix:31017 quality:85`; iCumRate += 1;} //0.0529100529 1890��� �����ӵ� ��Ʈ���� �巹�� ���̵�
					case(4){itemString = `id:46006 suffix:31014`; iCumRate += 1;} //0.0529100529 1890������ ī��Ʈ�ǵ� (���ؼ�)
					case(5){itemString = `id:46001 col1:111111 col2:eeeeee`; iCumRate += 1;} //0.0529100529 1890�Ͼ� ���� ���� �ǵ�
					case(6){itemString = `id:13032 quality:90`; iCumRate += 1;} //0.0529100529 1890����Ƽ 90 �߷��þ� �Ƹ� (7/4)
					case(7){itemString = `id:18549 prefix:20713`; iCumRate += 1;} //0.0529100529 1890����ú� �巡�� �縯�� ��� (�߰���)
					case(8){itemString = `id:15116 suffix:31301`; iCumRate += 1;} //0.0529100529 1890������ ������ ���壨�����ʱ�����
					case(9){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 4;} //0.2116402116 1890������ ���� �׷��̽� �÷���Ʈ �Ƹ�
					case(10){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 4;} //0.2116402116 1890������ �߱� ���÷� �κ�
					case(11){itemString = `id:19031`; iCumRate += 4;} //0.2116402116 1890��Ÿ����Ʈ �κ�
					case(12){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 4;} //0.2116402116 1890��� �߱� ���÷� �κ�
					case(13){itemString = `id:40231 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890ũ����Ż ����Ʈ�� ���� ������
					case(14){itemString = `id:40232 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890ũ��� ���̽� ���� ������
					case(15){itemString = `id:40233 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890�Ǵн� ���̾� ���� ������
					case(16){itemString = `id:62005 suffix:30714`; iCumRate += 4;} //0.2116402116 1890��æƮ��������ī)
					case(17){itemString = `id:62005 suffix:31105`; iCumRate += 4;} //0.2116402116 1890��æƮ����������)
					case(18){itemString = `id:62005 suffix:30913`; iCumRate += 4;} //0.2116402116 1890��æƮ����������)
					case(19){itemString = `id:62005 prefix:21006`; iCumRate += 4;} //0.2116402116 1890��æƮ��������)
					case(20){itemString = `id:63030 col1:000000`; iCumRate += 4;} //0.2116402116 1890������ ���� ���� ���� ����
					case(21){itemString = `id:63030 col1:c00000`; iCumRate += 4;} //0.2116402116 1890���� ���� ���� ���� ����
					case(22){itemString = `id:63030 col1:f0f0f0`; iCumRate += 4;} //0.2116402116 1890�Ͼ� ���� ���� ���� ����
					case(23){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890���� �̴� ��ĿƮ
					case(24){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 10;} //0.5291005291 1890���̳��巹��
					case(25){itemString = `id:18044`; iCumRate += 10;} //0.5291005291 1890���˿� ����
					case(26){itemString = `id:16519`; iCumRate += 10;} //0.5291005291 1890��ȣȭ �尩
					case(27){itemString = `id:18046`; iCumRate += 10;} //0.5291005291 1890�հ��� �Ӹ����
					case(28){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 10;} //0.5291005291 1890Ŭ���� ������ ����
					case(29){itemString = `id:15060`; iCumRate += 10;} //0.5291005291 1890���� �̳ʷκ� ����
					case(30){itemString = `id:17041`; iCumRate += 10;} //0.5291005291 1890�������� ���ú���
					case(31){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890���̵� ���� �巹��
					case(32){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890�߱� ���÷� �κ�
					case(33){itemString = `id:18060`; iCumRate += 10;} //0.5291005291 1890�� �䳢 �Ӹ���5
					case(34){itemString = `id:18065`; iCumRate += 10;} //0.5291005291 1890���� �䳢 �Ӹ���5
					case(35){itemString = `id:18070`; iCumRate += 10;} //0.5291005291 1890�� �䳢 �Ӹ���5
					case(36){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.5291005291 1890��æƮ�����̺죩
					case(37){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.5291005291 1890��æƮ�����̾�Ʈ��
					case(38){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.5291005291 1890��æƮ���ں�Ʈ��
					case(39){itemString = `id:18051`; iCumRate += 10;} //0.5291005291 1890�ڷ��� ���� ����
					case(40){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate += 10;} //0.5291005291 1890�ڷ��� ���ڽ�Ʈ
					case(41){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 10;} //0.5291005291 1890����ǳ ���纹
					case(42){itemString = `id:15055`; iCumRate += 15;} //0.7936507937 1890���� �̴� ���ǽ�
					case(43){itemString = `id:46006`; iCumRate += 15;} //0.7936507937 1890ī��Ʈ �ǵ�
					case(44){itemString = `id:15053`; iCumRate += 15;} //0.7936507937 1890�÷�Į�� ���ǽ�
					case(45){itemString = `id:17045`; iCumRate += 15;} //0.7936507937 1890���� �� ���� ���� ����
					case(46){itemString = `id:17040`; iCumRate += 15;} //0.7936507937 1890���� ��Ʈ�� ����
					case(47){itemString = `id:18113`; iCumRate += 15;} //0.7936507937 1890������ ����� ����
					case(48){itemString = `id:18114`; iCumRate += 15;} //0.7936507937 1890�ٹ��� ����� ����
					case(49){itemString = `id:18115`; iCumRate += 15;} //0.7936507937 1890�� ����� ����
					case(50){itemString = `id:62005 prefix:207`; iCumRate += 15;} //0.7936507937 1890��æƮ��������
					case(51){itemString = `id:15029`; iCumRate += 15;} //0.7936507937 1890��ũ �������̿�
					case(52){itemString = `id:15151`; iCumRate += 15;} //0.7936507937 1890���帶���� ���̽�Ʈ ���Ϸ� ��������룩
					case(53){itemString = `id:15152`; iCumRate += 15;} //0.7936507937 1890���帶���� ���̽�Ʈ ���Ϸ� ��������룩
					case(54){itemString = `id:15153`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ�������룩
					case(55){itemString = `id:15154`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ�������룩
					case(56){itemString = `id:15045`; iCumRate += 15;} //0.7936507937 1890���̽� �÷�Ŷ ����
					case(57){itemString = `id:15026`; iCumRate += 15;} //0.7936507937 1890������ �ս�ĿƮ
					case(58){itemString = `id:15016`; iCumRate += 15;} //0.7936507937 1890����� ��Ÿŷ ������
					case(59){itemString = `id:15051`; iCumRate += 15;} //0.7936507937 1890Ÿ��Ʈ ��Ʈ ����
					case(60){itemString = `id:18011`; iCumRate += 15;} //0.7936507937 1890��� ������ ĸ
					case(61){itemString = `id:18124`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ ĸ
					case(62){itemString = `id:18009`; iCumRate += 15;} //0.7936507937 1890��� ���� ĸ
					case(63){itemString = `id:18014`; iCumRate += 15;} //0.7936507937 1890��� ����
					case(64){itemString = `id:18000`; iCumRate += 15;} //0.7936507937 1890��ũ ����
					case(65){itemString = `id:16013`; iCumRate += 15;} //0.7936507937 1890�˻� �尩
					case(66){itemString = `id:16032`; iCumRate += 15;} //0.7936507937 1890���� �۷���
					case(67){itemString = `id:63030`; iCumRate += 15;} //0.7936507937 1890���� ���� ���� ����
					case(68){itemString = `id:18112`; iCumRate += 15;} //0.7936507937 1890�� ���� ��ǰ
					case(69){itemString = `id:18111`; iCumRate += 15;} //0.7936507937 1890���� ���� ��ǰ
					case(70){itemString = `id:18110`; iCumRate += 15;} //0.7936507937 1890���� ���� ��ǰ
					case(71){itemString = `id:18109`; iCumRate += 15;} //0.7936507937 1890���� ���� ��ǰ
					case(72){itemString = `id:18108`; iCumRate += 15;} //0.7936507937 1890���� ���� ��ǰ
					case(73){itemString = `id:18029`; iCumRate += 15;} //0.7936507937 1890������ �Ȱ�
					case(74){itemString = `id:18028`; iCumRate += 15;} //0.7936507937 1890���̽� �Ȱ�
					case(75){itemString = `id:19008`; iCumRate += 15;} //0.7936507937 1890���� �Ǵ� �κ�
					case(76){itemString = `id:19009`; iCumRate += 15;} //0.7936507937 1890���� ���� �κ�
					case(77){itemString = `id:19017`; iCumRate += 15;} //0.7936507937 1890���� �κ�
					case(78){itemString = `id:19016`; iCumRate += 15;} //0.7936507937 1890�� �κ�
					case(79){itemString = `id:40053`; iCumRate += 15;} //0.7936507937 1890����� ��� �ɴٹ�
					case(80){itemString = `id:40051`; iCumRate += 15;} //0.7936507937 1890����� ��� �Ѽ���
					case(81){itemString = `id:18089`; iCumRate += 15;} //0.7936507937 1890����� ��� ���
					case(82){itemString = `id:40054`; iCumRate += 15;} //0.7936507937 1890�Ķ� ��� �ɴٹ�
					case(83){itemString = `id:40052`; iCumRate += 15;} //0.7936507937 1890�Ķ� ��� �Ѽ���
					case(84){itemString = `id:16500`; iCumRate += 15;} //0.7936507937 1890�ﳪ �������� �۷���
					case(85){itemString = `id:19020`; iCumRate += 15;} //0.7936507937 1890��Ÿ�� ����� ��Ʈ
					case(86){itemString = `id:62005 prefix:7`; iCumRate += 15;} //0.7936507937 1890��æƮ���������ͣ�
					case(87){itemString = `id:16520`; iCumRate += 15;} //0.7936507937 1890�� ���� �۷���
					case(88){itemString = `id:15128`; iCumRate += 15;} //0.7936507937 1890�� �� ���� �巹��
					case(89){itemString = `id:16019`; iCumRate += 15;} //0.7936507937 1890�ٹ��� �ȸ� �尩
					case(90){itemString = `id:18047`; iCumRate += 15;} //0.7936507937 1890�ڷ��� ��Ʈ ����
					case(91){itemString = `id:18008`; iCumRate += 15;} //0.7936507937 1890��Ʈ������ ĸ
					case(92){itemString = `id:15025`; iCumRate += 15;} //0.7936507937 1890�����б� ���ڱ���
					case(93){itemString = `id:18043`; iCumRate += 15;} //0.7936507937 1890�ڷ��� ��Ʈ ����
					case(94){itemString = `id:18026`; iCumRate += 15;} //0.7936507937 1890��� ���θ���
					case(95){itemString = `id:15052`; iCumRate += 15;} //0.7936507937 1890��ũ�� ���� Ʃ��
					case(96){itemString = `id:19005`; iCumRate += 15;} //0.7936507937 1890���÷� �κ�
					case(97){itemString = `id:18040`; iCumRate += 15;} //0.7936507937 1890�ڷ��� ���� ������
					case(98){itemString = `id:18038`; iCumRate += 15;} //0.7936507937 1890���� �跿 ����
					case(99){itemString = `id:15042`; iCumRate += 15;} //0.7936507937 1890�ճ� ���ǽ�
					case(100){itemString = `id:63025 count:3`; iCumRate += 15;} //0.7936507937 1890��뷮 �ູ�� ����
					case(101){itemString = `id:17006`; iCumRate += 15;} //0.7936507937 1890õ�Ź�
					case(102){itemString = `id:18086`; iCumRate += 15;} //0.7936507937 1890������ �� ���
					case(103){itemString = `id:18087`; iCumRate += 15;} //0.7936507937 1890��� �� ���
					case(104){itemString = `id:18088`; iCumRate += 15;} //0.7936507937 1890ȭ��
					case(105){itemString = `id:18090`; iCumRate += 15;} //0.7936507937 1890�Ķ� ��� ���
					case(106){itemString = `id:40046`; iCumRate += 15;} //0.7936507937 1890��� �Ѽ���
					case(107){itemString = `id:40047`; iCumRate += 15;} //0.7936507937 1890��� �ɴٹ�
					case(108){itemString = `id:18541`; iCumRate += 15;} //0.7936507937 1890��Ӹ� ����
					case(109){itemString = `id:18103`; iCumRate += 15;} //0.7936507937 1890���� ����
					case(110){itemString = `id:18010`; iCumRate += 15;} //0.7936507937 1890��� ����Ʈ ĸ
					case(111){itemString = `id:15131`; iCumRate += 15;} //0.7936507937 1890�� �������� ��ĿƮ
					case(112){itemString = `id:17005`; iCumRate += 15;} //0.7936507937 1890��ɲ� �Ź�
					case(113){itemString = `id:17002`; iCumRate += 15;} //0.7936507937 1890�˻� �Ź�
					case(114){itemString = `id:17022`; iCumRate += 15;} //0.7936507937 1890��������
					case(115){itemString = `id:17007`; iCumRate += 15;} //0.7936507937 1890���� ����
					case(116){itemString = `id:16009`; iCumRate += 15;} //0.7936507937 1890��ɲ��尩
					case(117){itemString = `id:15031`; iCumRate += 15;} //0.7936507937 1890�����б��� ���� ����
					case(118){itemString = `id:19012`; iCumRate += 15;} //0.7936507937 1890Ʈ��� ���̾�� �κ�
					case(119){itemString = `id:18004`; iCumRate += 15;} //0.7936507937 1890��� �мǸ���
					case(120){itemString = `id:15132`; iCumRate += 15;} //0.7936507937 1890���߷� ����Ʈ ����
					case(121){itemString = `id:15043`; iCumRate += 15;} //0.7936507937 1890����Ƽ ���Ʈ
					case(122){itemString = `id:17017`; iCumRate += 15;} //0.7936507937 1890������Ʈ ����
					case(123){itemString = `id:16006`; iCumRate += 15;} //0.7936507937 1890����� �尩
					case(124){itemString = `id:17060`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ ����(������)
					case(125){itemString = `id:17061`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ ����(������)
					case(126){itemString = `id:17019`; iCumRate += 15;} //0.7936507937 1890�������� �Ź�
					case(127){itemString = `id:17067`; iCumRate += 15;} //0.7936507937 1890���� Ÿ�� �� ����
					case(128){itemString = `id:17008`; iCumRate += 15;} //0.7936507937 1890�ڷ��� �����������룩
					case(129){itemString = `id:17010`; iCumRate += 15;} //0.7936507937 1890�ڷ��� �����������룩
					case(130){itemString = `id:17023`; iCumRate += 15;} //0.7936507937 1890������ �Ź�
					case(131){itemString = `id:16031`; iCumRate += 15;} //0.7936507937 1890�������� Ÿ��Ʈ �۷���
					case(132){itemString = `id:16026`; iCumRate += 15;} //0.7936507937 1890���� �������� ��Ʈ �۷���
					case(133){itemString = `id:16016`; iCumRate += 15;} //0.7936507937 1890����Ʈ �۷���
					case(134){itemString = `id:17003`; iCumRate += 15;} //0.7936507937 1890���� �Źߣ������룩
					case(135){itemString = `id:17024`; iCumRate += 15;} //0.7936507937 1890��� ����
					case(136){itemString = `id:17013`; iCumRate += 15;} //0.7936507937 1890�β��� ����
					case(137){itemString = `id:17069`; iCumRate += 15;} //0.7936507937 1890���� ����
					case(138){itemString = `id:15020`; iCumRate += 15;} //0.7936507937 1890�ڷ��� �����巹��
					case(139){itemString = `id:15044`; iCumRate += 15;} //0.7936507937 1890����� �۾���
					case(140){itemString = `id:15041`; iCumRate += 15;} //0.7936507937 1890�繫�� ������ ��Ʈ
					case(141){itemString = `id:15027`; iCumRate += 15;} //0.7936507937 1890��� �ս�ĿƮ
					case(142){itemString = `id:15018`; iCumRate += 15;} //0.7936507937 1890��� �����ڿʣ������룩
					case(143){itemString = `id:15033`; iCumRate += 15;} //0.7936507937 1890��� �����ڿ�(�����룩
					case(144){itemString = `id:15023`; iCumRate += 15;} //0.7936507937 1890��ũ ��ɲۿʣ������룩
					case(145){itemString = `id:15035`; iCumRate += 15;} //0.7936507937 1890��ũ ��ɲۿʣ������룩
					case(146){itemString = `id:19003`; iCumRate += 15;} //0.7936507937 1890Ʈ���ݷθ� �κ�
					case(147){itemString = `id:18002`; iCumRate += 15;} //0.7936507937 1890��� ĸ
					case(148){itemString = `id:51014 count:5`; iCumRate += 15;} //0.7936507937 1890���¹̳� 100 ���� 5��
					case(149){itemString = `id:51004 count:5`; iCumRate += 15;} //0.7936507937 1890����� 100���� 5��
					case(150){itemString = `id:51009 count:5`; iCumRate += 15;} //0.7936507937 1890���� 100���� 5��

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
	//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
					return;
				}

				++i;
			}
		}
}
