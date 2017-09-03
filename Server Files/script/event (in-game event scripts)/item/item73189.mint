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
	//한국 4주년 타임 캡슐
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(11);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:1571`; iCumRate += 1;}
			case(1){itemString = `id:73182`; iCumRate += 2;}
			case(2){itemString = `id:73184`; iCumRate += 2;}
			case(3){itemString = `id:73185`; iCumRate += 2;}
			case(4){itemString = `id:73186`; iCumRate += 2;}
			case(5){itemString = `id:73187`; iCumRate += 2;}

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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}
		++i;
	}
}
