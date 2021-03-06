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
	//할로윈 보상 상자
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(190);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	bool bBreak = false;
	string itemString;

	if (GetLocale().LowerCase() == `korea`)
	{
		// 한국 2009 할로윈 이벤트는 다른 아이템을 준다.
		iRandom = Random(1000);

		while(true)
		{
			bBreak = false;			
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:19066 `; iCumRate += 4;} //호박 로브
				case(1){itemString = `id:40079`; iCumRate += 42;} // 메이스
				case(2){itemString = `id:40031`; iCumRate += 40;} //  석궁
				case(3){itemString = `id:40013`; iCumRate += 42;} //  롱 보우
				case(4){itemString = `id:40011`; iCumRate += 40;} //  브로드 소드
				case(5){itemString = `id:40007`; iCumRate += 42;} //  한손도끼
				case(6){itemString = `id:46001`; iCumRate += 40;} //  라운드 실드
				case(7){itemString = `id:51003 `; iCumRate += 150;} // 생명력50
				case(8){itemString = `id:51004 `; iCumRate += 150;} // 생명력100
				case(9){itemString = `id:51008 `; iCumRate += 150;} // 마나포션50
				case(10){itemString = `id:51013 `; iCumRate += 150;} // 스테미너포션50
				case(11){itemString = `id:51014 `; iCumRate += 150;} // 스테미너포션100
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

				player.AddItemEx(itemString, true);
				player.ShowCaption(["event.item.item91136.1"]);
				return;
			}

			++i;
		}
		// GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		// 확률이 이상해서 아무것도 안 걸렸을 때 그냥 생명력 50 포션을 준다.
		itemString = `id:51003 `;
		player.AddItemEx(itemString, true);
		player.ShowCaption(["event.item.item91136.2"]);
		return;
	}
	else
	{
		while(true)
		{
			bBreak = false;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:19066 `; iCumRate += 5;} //호박 로브
				case(1){itemString = `id:40079`; iCumRate += 5;} // 메이스
				case(2){itemString = `id:40031`; iCumRate += 5;} //  석궁
				case(3){itemString = `id:40013`; iCumRate += 5;} //  롱 보우
				case(4){itemString = `id:40011`; iCumRate += 5;} //  브로드 소드
				case(5){itemString = `id:46001`; iCumRate += 5;} //  라운드 실드
				case(6){itemString = `id:51003 `; iCumRate += 20;} // 생명력50
				case(7){itemString = `id:51004 `; iCumRate += 20;} // 생명력100
				case(8){itemString = `id:51008 `; iCumRate += 15;} // 마나포션50
				case(9){itemString = `id:51013 `; iCumRate += 25;} // 스테미너포션50
				case(10){itemString = `id:51014 `; iCumRate += 20;} // 스테미너포션100
				case(11){itemString = `id:51022 `; iCumRate += 20;} // 생명력과 마나 30
				case(12){itemString = `id:51027 `; iCumRate += 20;} // 생명력과 스태미나30
				case(13){itemString = `id:51028 `; iCumRate += 20;} // 생명력과 스태미나50
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
}
