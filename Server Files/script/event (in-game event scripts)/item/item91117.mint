//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
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
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(1090);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:64061`; iCumRate += 1;} //캣츠아이
			case(1){itemString = `id:14039`; iCumRate += 1;} //차이나 드래곤 셋트
			case(2){itemString = `id:14040`; iCumRate += 1;} //차이나 드래곤 셋트
			case(3){itemString = `id:14041`; iCumRate += 1;} //차이나 드래곤 셋트
			case(4){itemString = `id:16532`; iCumRate += 1;} //차이나 드래곤 셋트
			case(5){itemString = `id:16533`; iCumRate += 1;} //차이나 드래곤 셋트
			case(6){itemString = `id:16535`; iCumRate += 1;} //차이나 드래곤 셋트
			case(7){itemString = `id:17095`; iCumRate += 1;} //차이나 드래곤 셋트
			case(8){itemString = `id:18552`; iCumRate += 1;} //차이나 드래곤 셋트
			case(9){itemString = `id:18553`; iCumRate += 1;} //차이나 드래곤 셋트
			case(10){itemString = `id:53030`; iCumRate += 2;} //사막 드래곤의 눈
			case(11){itemString = `id:18518 col1:111111 col2:111111 col3:111111`; iCumRate += 8;} //진묵 드래곤 크래스트
			case(12){itemString = `id:65015`; iCumRate += 20;} //유황 골렘
			case(13){itemString = `id:65014`; iCumRate += 50;} //숲 골렘
			case(14){itemString = `id:63099`; iCumRate += 50;} //벚꽃놀이 키트
			case(15){itemString = `id:46021`; iCumRate += 150;} //판의 방패
			case(16){itemString = `id:63700`; iCumRate += 200;} //불꽃놀이 키트
			case(17){itemString = `id:63701`; iCumRate += 200;} //불꽃놀이 키트
			case(18){itemString = `id:63702`; iCumRate += 200;} //불꽃놀이 키트
			case(19){itemString = `id:91109`; iCumRate += 200;} //푸른 여신의 날개


			// 여기다 넣으세요의 끝
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
			DebugOut(`유저에게 `+itemString+` 를 줌`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
