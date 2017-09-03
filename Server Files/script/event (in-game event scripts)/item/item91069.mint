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
	//대만 용선 이벤트 보상
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;

	iRandom = Random(100);	//대만 확률의 총합을 적는다

	while(true)
	{
		if(GetLocale().LowerCase()== `taiwan`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:46024 col1:000000 col2:FFFFFF col3:000000`; iCumRate += 5;}	// 콤포짓 실드
				case(1){itemString = `id:40265 col1:6600FF col2:000000 col3:000000`; iCumRate += 5;}	// 익스큐셔너스 소드
				case(2){itemString = `id:40229 col1:8B008B col2:FFFFFF`; iCumRate += 5;}	// 샤오란엔 기사의 활
				case(3){itemString = `id:40243 col1:8B008B col2:FFFFFF col3:FFFFFF`; iCumRate += 5;}	// 배틀 숏 소드
				case(4){itemString = `id:15096`; iCumRate += 10;}	// 셀리나 섹시 베어룩
				case(5){itemString = `id:15070`; iCumRate += 10;}	// 스탠드칼라 슬리브리스
				case(6){itemString = `id:15135`; iCumRate += 10;}	// 시크 수트
				case(7){itemString = `id:15137`; iCumRate += 10;}	// 셀리나 하프 재킷 코트
				case(8){itemString = `id:15067`; iCumRate += 20;}	// 동양풍 무사복
				case(9){itemString = `id:15040`; iCumRate += 20;}	// 코레스 시프슈트
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if(GetLocale().LowerCase()== `usa`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 2;}	// 카이트 실드
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 2;}	// 드래곤 블레이드
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 2;}	// 레더 롱 보우
				case(3){itemString = `id:40011 col1:87CEEB col2:FFFFFF`; iCumRate += 4;}	// 브로드 소드
				case(4){itemString = `id:15118`; iCumRate += 10;}	// 남성용 검사학교 교복 쇼트타입
				case(5){itemString = `id:15075`; iCumRate += 10;}	// 셀리나 레이디 드레스
				case(6){itemString = `id:15099`; iCumRate += 10;}	// 비앙카 드로워즈 레이어드 스커트
				case(7){itemString = `id:15119`; iCumRate += 10;}	// 여성용 검사학교 교복 롱타입
				case(8){itemString = `id:15063`; iCumRate += 25;}	// 레이어드 프릴 원피스
				case(9){itemString = `id:15055`; iCumRate += 25;}	// 레더 미니 원피스
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if(GetLocale().LowerCase()== `japan`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 5;}	// 카이트 실드
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 5;}	// 드래곤 블레이드
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 5;}	// 레더 롱 보우
				case(3){itemString = `id:40243 col1:8B008B col2:FFFFFF col3:FFFFFF`; iCumRate += 5;}	// 배틀 숏 소드
				case(4){itemString = `id:15096`; iCumRate += 10;}	// 셀리나 섹시 베어룩
				case(5){itemString = `id:15070`; iCumRate += 10;}	// 스탠드칼라 슬리브리스
				case(6){itemString = `id:15135`; iCumRate += 10;}	// 시크 수트
				case(7){itemString = `id:15137`; iCumRate += 10;}	// 셀리나 하프 재킷 코트
				case(8){itemString = `id:15067`; iCumRate += 20;}	// 동양풍 무사복
				case(9){itemString = `id:15040`; iCumRate += 20;}	// 코레스 시프슈트
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:46006 col1:FFFFFF col2:000000`; iCumRate += 2;}	// 카이트 실드
				case(1){itemString = `id:40095 col1:FF0000 col2:000000 col3:000000`; iCumRate += 2;}	// 드래곤 블레이드
				case(2){itemString = `id:40081 col1:FFFFFF col2:FFC0CB`; iCumRate += 2;}	// 레더 롱 보우
				case(3){itemString = `id:40011 col1:87CEEB col2:FFFFFF`; iCumRate += 4;}	// 브로드 소드
				case(4){itemString = `id:15118`; iCumRate += 10;}	// 남성용 검사학교 교복 쇼트타입
				case(5){itemString = `id:15075`; iCumRate += 10;}	// 셀리나 레이디 드레스
				case(6){itemString = `id:15099`; iCumRate += 10;}	// 비앙카 드로워즈 레이어드 스커트
				case(7){itemString = `id:15119`; iCumRate += 10;}	// 여성용 검사학교 교복 롱타입
				case(8){itemString = `id:15063`; iCumRate += 25;}	// 레이어드 프릴 원피스
				case(9){itemString = `id:15055`; iCumRate += 25;}	// 레더 미니 원피스
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
				GiveDragonShipGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}

	}
	GiveDragonShipGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
