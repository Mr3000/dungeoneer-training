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
	int iRandom = Random(1000);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:18601 `; iCumRate += 25;} //빅 드래곤 크레스트
			case(1){itemString = `id:18602 `; iCumRate += 25;} //빅 번개 전사의 투구
			case(2){itemString = `id:18105 `; iCumRate += 50;} //별 장식 미니 모자
			case(3){itemString = `id:40241 col1:000000 col2:000000 col3:ffffff `; iCumRate += 100;} //드래곤 블레이드
			case(4){itemString = `id:40237 col1:000000 col2:000000 col3:ffffff `; iCumRate += 100;} //레더 롱 보우
			case(5){itemString = `id:40238 col1:000000 col2:0fffff col3:ffffff `; iCumRate += 100;} //그레이트 소드
			case(6){itemString = `id:50537 quality:90 `; iCumRate += 200;} //두근두근 가토 오 쇼콜라
			case(7){itemString = `id:50536 quality:90 `; iCumRate += 200;} //잘난체 스테이크
			case(8){itemString = `id:50535 quality:90 `; iCumRate += 200;} //크레이지 초코볼
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
