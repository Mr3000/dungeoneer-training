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
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(827);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:64018 count:5 `; iCumRate +=300;} //종이
			case(1){itemString = `id:62005 prefix:7 `; iCumRate +=100;} //폭스헌터
			case(2){itemString = `id:62005 prefix:7 `; iCumRate +=50;} //폭스
			case(3){itemString = `id:64051 count:5 `; iCumRate +=50;} //빤짝이 종이
			case(4){itemString = `id:62005 prefix:21410 `; iCumRate +=5;} // 기울어진
			case(5){itemString = `id:64521 suffix:40021`; iCumRate +=40;} //파이어볼 1페이지
			case(6){itemString = `id:64522 suffix:40022`; iCumRate +=40;} //파이어볼 2페이지
			case(7){itemString = `id:64523 suffix:40023`; iCumRate +=40;} //파이어볼 3페이지
			case(8){itemString = `id:64524 suffix:40024`; iCumRate +=30;} //파이어볼 4페이지
			case(9){itemString = `id:64525 suffix:40025`; iCumRate +=30;} //파이어볼 5페이지
			case(10){itemString = `id:64526 suffix:40026`; iCumRate +=30;} //파이어볼 6페이지
			case(11){itemString = `id:64527 suffix:40027`; iCumRate +=30;} //파이어볼 7페이지
			case(12){itemString = `id:64528 suffix:40028`; iCumRate +=20;} //파이어볼 8페이지
			case(13){itemString = `id:64529 suffix:40029`; iCumRate +=10;} //파이어볼 9페이지
			case(14){itemString = `id:64530 suffix:40030`; iCumRate +=2;} //파이어볼 10 페이지
			case(15){itemString = `id:62005 prefix:21412`; iCumRate +=30;} //칼라
			case(16){itemString = `id:62005 suffix:30634`; iCumRate +=20;} // 물방울

			// 여기다 넣으세요의 끝

			default
			{
				itemString = `id:64018`; iCumRate +=1000;
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
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}

		++i;
	}
}
