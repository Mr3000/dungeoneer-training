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
	// 중급
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
			case(0){itemString = `id:60025 count:3`; iCumRate +=10;} //고급 가죽 3개
			case(1){itemString = `id:60026 count:3`; iCumRate +=5;} //최고급 가죽 3개
			case(2){itemString = `id:60028 count:5`; iCumRate +=5;} //일반 가죽끈 5개
			case(3){itemString = `id:60019 count:5`; iCumRate +=5;} //저가형 옷감 5개
			case(4){itemString = `id:60011 count:5`; iCumRate +=5;} //저가형 실크 5개
			case(5){itemString = `id:60020 count:5`; iCumRate +=5;} //일반 옷감 5개
			case(6){itemString = `id:60012 count:5`; iCumRate +=5;} //일반 실크 5개
			case(7){itemString = `id:60017 count:5`; iCumRate +=5;} //고급 마감용 실 5개
			case(8){itemString = `id:64001 count:10`; iCumRate +=15;} //철괴 5개
			case(9){itemString = `id:64003 count:10`; iCumRate +=10;} //동괴 5개
			case(10){itemString = `id:64005 count:5`; iCumRate +=10;} //은괴 5개
			case(11){itemString = `id:64007 count:5`; iCumRate +=10;} //금괴 3개
			case(12){itemString = `id:64009 count:5`; iCumRate +=10;} //미스릴괴 1개

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
