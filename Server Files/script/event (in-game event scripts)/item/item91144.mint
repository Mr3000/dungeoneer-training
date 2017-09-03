//////////////////////////////////////////////////////////////////////////////////
// Mabinogi Project : Use Item Script
// 아이템 사용시의 이벤트 함수
//
// nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
// nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
// isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
// 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:19067 `; iCumRate += 15;} //순록 로브
			case(1){itemString = `id:51004 count:2` ; iCumRate += 15;} //생명력 100 포션
			case(2){itemString = `id:51009 count:2` ; iCumRate += 15;} //마나 100 포션
			case(3){itemString = `id:51014 count:2 `; iCumRate += 15;} //스태미나 100 포션
			case(4){itemString = `id:60005 count:5 `; iCumRate += 20;} //붕대
			case(5){itemString = `id:51024 count:5 `; iCumRate += 10;} //생명력과 마나 100 포션
			case(6){itemString = `id:51029 count:5 `; iCumRate += 10;} //생명력과 스태미나 100 포션
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
			GiveSkijumpEventItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveSkijumpEventItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
