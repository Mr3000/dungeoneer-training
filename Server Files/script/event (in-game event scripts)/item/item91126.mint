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
	int iRandom = Random(2054);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15258 `; iCumRate += 1;} //0.0486854917 베키 위치 드레스
			case(1){itemString = `id:15259 `; iCumRate += 1;} //0.0486854917 오델리아 위자드 슈트
			case(2){itemString = `id:15316 `; iCumRate += 1;} //0.0486854917 카리스 위자드 수트
			case(3){itemString = `id:17044 `; iCumRate += 1;} //0.0486854917 트윈 버클 부츠
			case(4){itemString = `id:17098 `; iCumRate += 1;} //0.0486854917 오델리아 위자드 부츠
			case(5){itemString = `id:17128 `; iCumRate += 1;} //0.0486854917 카리스 위자드 슈즈
			case(6){itemString = `id:18199 `; iCumRate += 1;} //0.0486854917 얇은테 안경
			case(7){itemString = `id:18159 `; iCumRate += 1;} //0.0486854917 뿔테 안경
			case(8){itemString = `id:15080 `; iCumRate += 1;} //0.0486854917 엘레노아 힐러드레스
			case(9){itemString = `id:40325 `; iCumRate += 5;} //0.2434274586 초보자 라이트닝 나무 원드
			case(10){itemString = `id:18045 `; iCumRate += 5;} //0.2434274586 별장식 마법사 모자
			case(11){itemString = `id:18048 `; iCumRate += 5;} //0.2434274586 몬거 넓은챙 마법사 모자
			case(12){itemString = `id:18041 `; iCumRate += 10;} //0.4868549172 큰 챙 깃털 모자
			case(13){itemString = `id:15060 `; iCumRate += 10;} //0.4868549172 슬림 이너로브 웨어
			case(14){itemString = `id:15116 `; iCumRate += 10;} //0.4868549172 여성용 마법사 정장
			case(15){itemString = `id:15117 `; iCumRate += 10;} //0.4868549172 남성용 마법사 정장
			case(16){itemString = `id:51010 count:5`; iCumRate += 10;} //0.4868549172 마나 300 포션
			case(17){itemString = `id:17026 `; iCumRate += 50;} //2.4342745862 퀼팅 슈즈
			case(18){itemString = `id:51009 count:5`; iCumRate += 50;} //2.4342745862 마나 100 포션
			case(19){itemString = `id:40038 `; iCumRate += 50;} //2.4342745862 라이트닝 원드
			case(20){itemString = `id:40039 `; iCumRate += 50;} //2.4342745862 아이스 원드
			case(21){itemString = `id:40040 `; iCumRate += 50;} //2.4342745862 파이어 원드
			case(22){itemString = `id:40041 `; iCumRate += 50;} //2.4342745862 타격용 원드
			case(23){itemString = `id:15156 `; iCumRate += 80;} //3.8948393379 이디카이 성직자 예복(여성용)
			case(24){itemString = `id:51008 count:10`; iCumRate += 80;} //3.8948393379 마나 50 포션
			case(25){itemString = `id:40090 `; iCumRate += 80;} //3.8948393379 힐링 원드
			case(26){itemString = `id:51102 count:10`; iCumRate += 80;} //3.8948393379 마나 허브
			case(27){itemString = `id:62004 count:5`; iCumRate += 80;} //3.8948393379 마법가루
			case(28){itemString = `id:63001 count:5`; iCumRate += 80;} //3.8948393379 여신의 날개
			case(29){itemString = `id:15025 `; iCumRate += 100;} //4.8685491723 마법학교 여자교복
			case(30){itemString = `id:15031 `; iCumRate += 100;} //4.8685491723 마법학교 교복
			case(31){itemString = `id:16511 `; iCumRate += 100;} //4.8685491723 실버 티니 글러브
			case(32){itemString = `id:17004 `; iCumRate += 100;} //4.8685491723 마법 학교 신발
			case(33){itemString = `id:17007 `; iCumRate += 100;} //4.8685491723 가죽 구두
			case(34){itemString = `id:18005 `; iCumRate += 100;} //4.8685491723 몬거 마법사 모자
			case(35){itemString = `id:18006 `; iCumRate += 100;} //4.8685491723 마법사 모자
			case(36){itemString = `id:15020 `; iCumRate += 100;} //4.8685491723 코레스 힐러드레스
			case(37){itemString = `id:15030 `; iCumRate += 100;} //4.8685491723 코레스 힐러 슈트
			case(38){itemString = `id:16011 `; iCumRate += 100;} //4.8685491723 코레스 힐러 글러브
			case(39){itemString = `id:51006 count:10`; iCumRate += 100;} //4.8685491723 마나 10 포션
			case(40){itemString = `id:51007 count:10`; iCumRate += 100;} //4.8685491723 마나 30 포션
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
