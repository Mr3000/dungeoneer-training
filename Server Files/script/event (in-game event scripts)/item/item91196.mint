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
	//미국 연금술사 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2497);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:19084 col1:8D699C col2:5A5A83 col3:CB4ED3`; iCumRate += 1;} //0.0400480577 도렌 의상(로브)
			case(1){itemString = `id:17237 col1:643968 col2:67007F col3:5C6A88`; iCumRate += 1;} //0.0400480577 도렌 신발
			case(2){itemString = `id:15601 col1:303F5F col2:D1D1D1 col3:363636`; iCumRate += 1;} //0.0400480577 케이 의상
			case(3){itemString = `id:17235 col1:363636`; iCumRate += 1;} //0.0400480577 케이 신발
			case(4){itemString = `id:15602 col1:666D71 col2:1F2123 col3:9E9A95`; iCumRate += 1;} //0.0400480577 레이모어 의상
			case(5){itemString = `id:17236 col1:1F2123`; iCumRate += 1;} //0.0400480577 레이머어 신발
			case(6){itemString = `id:40356 `; iCumRate += 1;} //0.0400480577 롤케익 실린더
			case(7){itemString = `id:46028 `; iCumRate += 1;} //0.0400480577 쿠키 방패
			case(8){itemString = `id:18199 `; iCumRate += 1;} //0.0400480577 얇은테 안경
			case(9){itemString = `id:18159 `; iCumRate += 1;} //0.0400480577 뿔테 안경
			case(10){itemString = `id:15080 `; iCumRate += 1;} //0.0400480577 엘레노아 힐러드레스
			case(11){itemString = `id:46010 `; iCumRate += 1;} //0.0400480577 드래곤 실드
			case(12){itemString = `id:65009 `; iCumRate += 5;} //0.2002402883 라이프 드레인의 결정
			case(13){itemString = `id:15354 `; iCumRate += 5;} //0.2002402883 파이릿 캡틴 슈트
			case(14){itemString = `id:15174 `; iCumRate += 5;} //0.2002402883 코이 퀼트 웨어
			case(15){itemString = `id:40285 col1:000000 col2:b8b800`; iCumRate += 5;} //0.2002402883 어스 실린더
			case(16){itemString = `id:40286 col1:000000 col2:00e8e8`; iCumRate += 5;} //0.2002402883 윈드 실린더
			case(17){itemString = `id:40284 col1:000000 col2:e80000`; iCumRate += 5;} //0.2002402883 파이어 실린더
			case(18){itemString = `id:40287 col1:000000 col2:00e800`; iCumRate += 5;} //0.2002402883 워터 실린더
			case(19){itemString = `id:15073 `; iCumRate += 10;} //0.4004805767 용소저 무도복
			case(20){itemString = `id:15060 `; iCumRate += 10;} //0.4004805767 슬림 이너로브 웨어
			case(21){itemString = `id:15183 `; iCumRate += 10;} //0.4004805767 라이딩 수트
			case(22){itemString = `id:15220 `; iCumRate += 10;} //0.4004805767 애드미럴 코트
			case(23){itemString = `id:15221 `; iCumRate += 10;} //0.4004805767 애드미럴 코트
			case(24){itemString = `id:51015 count:5`; iCumRate += 10;} //0.4004805767 스태미나 300 포션
			case(25){itemString = `id:40285 `; iCumRate += 10;} //0.4004805767 어스 실린더
			case(26){itemString = `id:40286 `; iCumRate += 10;} //0.4004805767 윈드 실린더
			case(27){itemString = `id:40284 `; iCumRate += 10;} //0.4004805767 파이어 실린더
			case(28){itemString = `id:40287 `; iCumRate += 10;} //0.4004805767 워터 실린더
			case(29){itemString = `id:65020 count:3`; iCumRate += 30;} //1.2014417301 최고급 퀼린 스톤
			case(30){itemString = `id:65019 count:3`; iCumRate += 40;} //1.6019223068 고급 퀼린 스톤
			case(31){itemString = `id:17026 `; iCumRate += 50;} //2.0024028835 퀼팅 슈즈
			case(32){itemString = `id:51014 count:5`; iCumRate += 50;} //2.0024028835 스태미나 100 포션
			case(33){itemString = `id:65046 `; iCumRate += 50;} //2.0024028835 눈보라의 결정
			case(34){itemString = `id:65045 `; iCumRate += 50;} //2.0024028835 구름의 결정
			case(35){itemString = `id:15153 `; iCumRate += 50;} //2.0024028835 산드라 스나이퍼 수트
			case(36){itemString = `id:15154 `; iCumRate += 50;} //2.0024028835 산드라 스나이퍼 수트
			case(37){itemString = `id:65010 `; iCumRate += 50;} //2.0024028835 방호벽의 결정
			case(38){itemString = `id:65013 `; iCumRate += 50;} //2.0024028835 바위 골렘의 결정
			case(39){itemString = `id:65016 `; iCumRate += 50;} //2.0024028835 순백의 골렘의 결정
			case(40){itemString = `id:15135 `; iCumRate += 50;} //2.0024028835 시크 수트
			case(41){itemString = `id:15013 `; iCumRate += 50;} //2.0024028835 차이나 드레스
			case(42){itemString = `id:65017 count:5`; iCumRate += 50;} //2.0024028835 저급 퀼린 스톤
			case(43){itemString = `id:65018 count:5`; iCumRate += 50;} //2.0024028835 일반 퀼린 스톤
			case(44){itemString = `id:65048 `; iCumRate += 50;} //2.0024028835 마법 골렘의 결정
			case(45){itemString = `id:15156 `; iCumRate += 80;} //3.2038446135 이디카이 성직자 예복(여성용)
			case(46){itemString = `id:51013 count:10`; iCumRate += 80;} //3.2038446135 스태미나 50 포션
			case(47){itemString = `id:65002 count:10`; iCumRate += 80;} //3.2038446135 불의 결정
			case(48){itemString = `id:65003 count:10`; iCumRate += 80;} //3.2038446135 물의 결정
			case(49){itemString = `id:65004 count:10`; iCumRate += 80;} //3.2038446135 바람의 결정
			case(50){itemString = `id:65005 count:10`; iCumRate += 80;} //3.2038446135 흙의 결정
			case(51){itemString = `id:62004 count:3`; iCumRate += 100;} //4.0048057669 마법가루
			case(52){itemString = `id:63001 count:3`; iCumRate += 100;} //4.0048057669 여신의 날개
			case(53){itemString = `id:16511 `; iCumRate += 100;} //4.0048057669 실버 티니 글러브
			case(54){itemString = `id:15016 `; iCumRate += 100;} //4.0048057669 의장용 스타킹 유니폼
			case(55){itemString = `id:17007 `; iCumRate += 100;} //4.0048057669 가죽 구두
			case(56){itemString = `id:15351 `; iCumRate += 100;} //4.0048057669 견습 연금술사 정장
			case(57){itemString = `id:17138 `; iCumRate += 100;} //4.0048057669 견습 연금술사 신발
			case(58){itemString = `id:40258 `; iCumRate += 100;} //4.0048057669 실린더
			case(59){itemString = `id:16011 `; iCumRate += 100;} //4.0048057669 코레스 힐러 글러브
			case(60){itemString = `id:51011 count:10`; iCumRate += 100;} //4.0048057669 스태미나 10 포션
			case(61){itemString = `id:51012 count:10`; iCumRate += 100;} //4.0048057669 스태미나 30 포션
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
