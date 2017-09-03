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
	int iRandom = Random(1000);	//확률의 총합을 적는다
	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:51004 count:10`; iCumRate +=75;}	//생명력 100 포션  8.474576271
			case(1){itemString = `id:51009 count:10`; iCumRate +=75;}	//마나 100 포션  8.474576271
			case(2){itemString = `id:51014 count:10`; iCumRate +=75;}	//스태미나 100 포션  8.474576271
			case(3){itemString = `id:64022 count:10`; iCumRate +=75;}	//은광석  8.474576271
			case(4){itemString = `id:60026 count:5`; iCumRate +=68;}		//최고급 가죽  6.779661017
			case(5){itemString = `id:60054 count:10`; iCumRate +=68;}	//나무판  6.779661017
			case(6){itemString = `id:45003 count:100`; iCumRate +=75;}	//수제화살  8.474576271
			case(7){itemString = `id:64007 count:10`; iCumRate +=75;}	//금괴  8.474576271
			case(8){itemString = `id:46006 col1:880000 col2:ffffff col3:ffffff`; iCumRate +=34;} //리화+리레 카이트실드  3.389830508
			case(9){itemString = `id:40010 col1:880000`; iCumRate +=17;} //날 리레 롱소드  1.694915254
			case(10){itemString = `id:40079 col2:990099`; iCumRate +=34;} //손잡이 보라색 메이스  3.389830508
			case(11){itemString = `id:40081 col2:ff99ff`; iCumRate +=17;} //분홍색 레더 롱 보우  1.694915254
			case(12){itemString = `id:50247 quality:100`; iCumRate +=84;} //해물 스파게티  8.474576271
			case(13){itemString = `id:50239 quality:100`; iCumRate +=84;} //양파 튀김   8.474576271
			case(14){itemString = `id:50163 quality:100`; iCumRate +=84;} // 피쉬 앤 칩스  8.474576271
			case(15){itemString = `id:18238 `; iCumRate +=15;} //펄 샤인 드롭
			case(16){itemString = `id:16058 `; iCumRate +=15;} //펄 샤인 브레이슬렛ID
			case(17){itemString = `id:16057 `; iCumRate +=30;} //아이언 피라밋 밴드
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
//			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			return;
		}
		++i;
	}
}
