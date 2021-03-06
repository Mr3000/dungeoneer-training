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
	// 파티퀘스트 이벤트 보상용 아이템(고급 보물함)
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `usa`)
	{
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
				case(0){itemString = `id:18156`; iCumRate += 30;} // 3% 고글 모자	傳統護目鏡帽子
				case(1){itemString = `id:19031`; iCumRate += 30;} // 3% 스타라이트 로브	傳統星紋長袍
				case(2){itemString = `id:40081 col1:663399 col2:663399 col3:663399`; iCumRate += 100;} // 10% 레더 롱 보우	覆皮長弓
				case(3){itemString = `id:40033 col1:663399 col2:663399 col3:663399`; iCumRate += 100;} // 10% 클레이모어	神之刃雙手劍
				case(4){itemString = `id:40214 col1:ff0000 col2:000000 col3:000000`; iCumRate += 215;} // 21.5% 큰 북	大鼓
				case(5){itemString = `id:40215 col1:ff0000 col2:000000 col3:000000`; iCumRate += 215;} // 21.5% 작은 북	小鼓
				case(6){itemString = `id:40216 col1:ff0000 col2:000000 col3:000000`; iCumRate += 310;} // 31% 심벌즈	鈸
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
				GivePartyQuestEventItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}
		else //대만
		{
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
					case(0){itemString = `id:15224`; iCumRate += 5;} // 0.50% 남성용 유카타	男性用日本傳統服裝
					case(1){itemString = `id:15225`; iCumRate += 5;} // 0.50% 여성용 유카타	女性用日本傳統服裝
					case(2){itemString = `id:17054`; iCumRate += 10;} // 1% 일본 전통 신발	日本傳統鞋子
					case(3){itemString = `id:18221`; iCumRate += 30;} // 3% 빈티지 고글 모자	傳統護目鏡帽子
					case(4){itemString = `id:19041`; iCumRate += 30;} // 3% 빈티지 스타라이트 로브	傳統星紋長袍
					case(5){itemString = `id:40081 col1:663399 col2:663399 col3:663399`; iCumRate += 100;} // 10% 레더 롱 보우	覆皮長弓
					case(6){itemString = `id:40033 col1:663399 col2:663399 col3:663399`; iCumRate += 100;} // 10% 클레이모어	神之刃雙手劍
					case(7){itemString = `id:40214 col1:ff0000 col2:000000 col3:000000`; iCumRate += 210;} // 21% 큰 북	大鼓
					case(8){itemString = `id:40215 col1:ff0000 col2:000000 col3:000000`; iCumRate += 210;} // 21% 작은 북	小鼓
					case(9){itemString = `id:40216 col1:ff0000 col2:000000 col3:000000`; iCumRate += 300;} // 30% 심벌즈	鈸
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
					GivePartyQuestEventItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					return;
				}
				++i;
			}
			GivePartyQuestEventItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}	
}
