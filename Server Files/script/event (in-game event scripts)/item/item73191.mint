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

	if((GetLocale().LowerCase()== `taiwan`) || (GetLocale().LowerCase()== `china`))
	{
		//대만 2009 복주머니
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
				case(0){itemString = `id:18568 `; iCumRate += 25;} //25.0000000000 유자 모자
				case(1){itemString = `id:64001 count:3`; iCumRate += 5;} //5.0000000000 철괴
				case(2){itemString = `id:64003 count:3`; iCumRate += 5;} //5.0000000000 동괴
				case(3){itemString = `id:64005 count:2`; iCumRate += 2;} //2.0000000000 은괴
				case(4){itemString = `id:64007 count:2`; iCumRate += 2;} //2.0000000000 금괴
				case(5){itemString = `id:64009 count:2`; iCumRate += 2;} //2.0000000000 미스릴괴
				case(6){itemString = `id:51101 count:5`; iCumRate += 8;} //8.0000000000 블러디 허브 
				case(7){itemString = `id:51102 count:5`; iCumRate += 8;} //8.0000000000 마나 허브
				case(8){itemString = `id:51103 count:5`; iCumRate += 7;} //7.0000000000 선라이트 허브
				case(9){itemString = `id:51104 count:10`; iCumRate += 20;} //20.0000000000 베이스 허브
				case(10){itemString = `id:51105 count:3`; iCumRate += 5;} //5.0000000000 골드 허브
				case(11){itemString = `id:51107 count:3`; iCumRate += 5;} //5.0000000000 화이트 허브 
				case(12){itemString = `id:51108 count:2`; iCumRate += 2;} //2.0000000000 해독초 
				case(13){itemString = `id:51109 count:2`; iCumRate += 2;} //2.0000000000 포이즌 허브
				case(14){itemString = `id:51110 count:2`; iCumRate += 2;} //2.0000000000 만드레이크
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
	else
	{
		//한국 2009 복주머니
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(1880);	//확률의 총합을 적는다
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:51011 count:5`; iCumRate +=100;} //스태미나 10 포션 5개
				case(1){itemString = `id:51001 count:5`; iCumRate +=100;} //생명력 10포션 5개
				case(2){itemString = `id:51006 count:5`; iCumRate +=100;} //마나 10포션 5개
				case(3){itemString = `id:51012 count:5`; iCumRate +=60;} //스태미나 30 포션 5개
				case(4){itemString = `id:51002 count:5`; iCumRate +=60;} //생명력 30포션 5개
				case(5){itemString = `id:51007 count:5`; iCumRate +=60;} //마나 30포션 5개
				case(6){itemString = `id:51013 count:5`; iCumRate +=30;} //스태미나 100 포션 5개
				case(7){itemString = `id:51003 count:5`; iCumRate +=30;} //생명력 100포션 5개
				case(8){itemString = `id:51008 count:5`; iCumRate +=30;} //마나 100포션 5개
				case(9){itemString = `id:51014 count:3`; iCumRate +=20;} //스태미나 100 포션 5개
				case(10){itemString = `id:51004 count:3`; iCumRate +=20;} //생명력 100포션 5개
				case(11){itemString = `id:51009 count:3`; iCumRate +=20;} //마나 100포션 5개
				case(12){itemString = `id:51101 count:1`; iCumRate +=100;} //블러디 허브
				case(13){itemString = `id:51102 count:1`; iCumRate +=100;} //마나 허브
				case(14){itemString = `id:51103 count:1`; iCumRate +=100;} //썬라이트 허브
				case(15){itemString = `id:51104 count:1`; iCumRate +=100;} //베이스 허브
				case(16){itemString = `id:51105 count:1`; iCumRate +=100;} //골드 허브
				case(17){itemString = `id:51106 count:1`; iCumRate +=100;} //못 쓰게된 허브
				case(18){itemString = `id:51107 count:1`; iCumRate +=100;} //화이트 허브
				case(19){itemString = `id:51108 count:1`; iCumRate +=100;} //해독초
				case(20){itemString = `id:51109 count:1`; iCumRate +=100;} //포이즌 허브
				case(21){itemString = `id:51110 count:1`; iCumRate +=100;} //만드레이크
				case(22){itemString = `id:64001 count:1`; iCumRate +=50;} //철괴
				case(23){itemString = `id:64003 count:1`; iCumRate +=50;} //동괴
				case(24){itemString = `id:64005 count:1`; iCumRate +=50;} //은괴
				case(25){itemString = `id:64007 count:1`; iCumRate +=50;} //금괴
				case(26){itemString = `id:64009 count:1`; iCumRate +=50;} //미스릴괴

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
}
