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
	//생산 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2632);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();
	meta_array itemArray;
	bool bCashGachaphonGived = false;

	while(true)
	{
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){iCumRate += 2;} //0.0754147813 최고급 옷감    * 3
			case(1){iCumRate += 2;} //0.0754147813 최고급 가죽    * 3
			case(2){iCumRate += 2;} //0.0754147813 최고급 실크    * 3
			case(3){iCumRate += 2;} //0.0754147813 굵은 실뭉치    * 20
			case(4){iCumRate += 2;} //0.0754147813 가는 실뭉치   * 20
			case(5){iCumRate += 2;} //0.0754147813 금괴   * 3
			case(6){iCumRate += 2;} //0.0754147813 은괴   * 3
			case(7){iCumRate += 2;} //0.0754147813 동괴   * 3
			case(8){iCumRate += 2;} //0.0754147813 철괴   * 3
			case(9){iCumRate += 2;} //0.0754147813 고급 가죽   * 5
			case(10){iCumRate += 2;} //0.0754147813 고급 실크   * 5
			case(11){iCumRate += 2;} //0.0754147813 고급 옷감   * 5z
			case(12){iCumRate += 2;} //0.0754147813 미스릴광석 *5
			case(13){iCumRate += 2;} //0.0754147813 금광석 *5
			case(14){iCumRate += 2;} //0.0754147813 은광석 *5
			case(15){iCumRate += 2;} //0.0754147813 철광석 *5
			case(16){iCumRate += 2;} //0.0754147813 동광석*5
			case(17){iCumRate += 2;} //0.0754147813 양털 주머니 *5
			case(18){iCumRate += 2;} //0.0754147813 한국 고딕 드레스 롱타입 (여성용)
			case(19){iCumRate += 2;} //0.0754147813 한국 고딕 드레스 쇼트타입 (여성용)
			case(20){iCumRate += 2;} //0.0754147813 한국 고딕 드레스 (남성용)
			case(21){iCumRate += 2;} //0.0754147813 일본식 양손검 (도면)
			case(22){iCumRate += 2;} //0.0754147813 일본식 한손검 (도면)
			case(23){iCumRate += 2;} //0.0754147813 일본식 단검 (도면)
			case(24){iCumRate += 10;} //0.3770739065 최고급 옷감
			case(25){iCumRate += 10;} //0.3770739065 최고급 가죽
			case(26){iCumRate += 10;} //0.3770739065 최고급 실크
			case(27){iCumRate += 10;} //0.3770739065 최고급 가죽끈
			case(28){iCumRate += 10;} //0.3770739065 최고급 마감용 실
			case(29){iCumRate += 10;} //0.3770739065 미스릴괴
			case(30){iCumRate += 10;} //0.3770739065 금괴
			case(31){iCumRate += 10;} //0.3770739065 은괴
			case(32){iCumRate += 10;} //0.3770739065 물안개 비단
			case(33){iCumRate += 10;} //0.3770739065 마법 금 실
			case(34){iCumRate += 10;} //0.3770739065 마법 은 실
			case(35){iCumRate += 4;} //0.1508295626 에이프런 원피스
			case(36){iCumRate += 4;} //0.1508295626 토크 여자 요리사옷
			case(37){iCumRate += 4;} //0.1508295626 토크 남자 요리사옷
			case(38){iCumRate += 4;} //0.1508295626 티오즈 아머(여성용)
			case(39){iCumRate += 4;} //0.1508295626 티오즈 아머(남성용)
			case(40){iCumRate += 4;} //0.1508295626 엘라 베스트 스커트
			case(41){iCumRate += 4;} //0.1508295626 양털 주머니(레어 칼라）
			case(42){iCumRate += 4;} //0.1508295626 검사학교 교복 쇼트타입(여성용)
			case(43){iCumRate += 4;} //0.1508295626 견습 요리사 모자
			case(44){iCumRate += 4;} //0.1508295626 수련 요리사 모자
			case(45){iCumRate += 4;} //0.1508295626 엘라 베스트 스커트（옷본）
			case(46){iCumRate += 4;} //0.1508295626 검사학교 교복 롱타입(남성용)
			case(47){iCumRate += 4;} //0.1508295626 더스틴 실버 나이트 아머
			case(48){iCumRate += 4;} //0.1508295626 검사학교 교복 쇼트타입 (옷본)
			case(49){iCumRate += 4;} //0.1508295626 붉은색 염색 앰플
			case(50){iCumRate += 4;} //0.1508295626 검은색 염색 앰플
			case(51){iCumRate += 10;} //0.3770739065 반지 (인첸트가 붙은)
			case(52){iCumRate += 10;} //0.3770739065 데브캣 브로치 (인챈트가 붙은)
			case(53){iCumRate += 10;} //0.3770739065 드레곤 블레이드 (레어 칼라)
			case(54){iCumRate += 20;} //0.7541478130 미스릴 광석
			case(55){iCumRate += 20;} //0.7541478130 최고급 옷감
			case(56){iCumRate += 20;} //0.7541478130 최고급 가죽
			case(57){iCumRate += 20;} //0.7541478130 최고급 실크
			case(58){iCumRate += 20;} //0.7541478130 최고급 가죽끈
			case(59){iCumRate += 20;} //0.7541478130 최고급 마감용 실
			case(60){iCumRate += 20;} //0.7541478130 물안개 비단
			case(61){iCumRate += 20;} //0.7541478130 마법 금 실
			case(62){iCumRate += 20;} //0.7541478130 마법 은 실
			case(63){iCumRate += 20;} //0.7541478130 금광석
			case(64){iCumRate += 20;} //0.7541478130 은광석
			case(65){iCumRate += 20;} //0.7541478130 고급 옷감
			case(66){iCumRate += 20;} //0.7541478130 고급 가죽
			case(67){iCumRate += 20;} //0.7541478130 고급 실크
			case(68){iCumRate += 20;} //0.7541478130 고급 가죽끈
			case(69){iCumRate += 20;} //0.7541478130 고급 마감용 실
			case(70){iCumRate += 10;} //0.3770739065 동괴
			case(71){iCumRate += 10;} //0.3770739065 철괴
			case(72){iCumRate += 10;} //0.3770739065 플루트 숏 소드 (도면)
			case(73){iCumRate += 10;} //0.3770739065 헤테로 카이트 실드 (도면)
			case(74){iCumRate += 10;} //0.3770739065 샤오롱주엔 예복정장 신발(남성용) (옷본)
			case(75){iCumRate += 10;} //0.3770739065 샤오롱주엔 예복정장 신발(여성용) (옷본)
			case(76){iCumRate += 10;} //0.3770739065 키린 겨울 천사의 장갑 (옷본)
			case(77){iCumRate += 10;} //0.3770739065 키린 겨울 천사의 모자 (옷본)
			case(78){iCumRate += 10;} //0.3770739065 키린 겨울 천사의 부츠 (옷본)
			case(79){iCumRate += 10;} //0.3770739065 본 마린 아머 (남성용)
			case(80){iCumRate += 10;} //0.3770739065 본 마린 아머 (여성용)
			case(81){iCumRate += 10;} //0.3770739065 글라디우스 (레어 칼라)
			case(82){iCumRate += 10;} //0.3770739065 샤오롱주엔 예복정장(여성용) (옷본)
			case(83){iCumRate += 10;} //0.3770739065 샤오롱주엔 예복정장(남성용) (옷본)
			case(84){iCumRate += 10;} //0.3770739065 키린 겨울 천사의 코트(남성용) (옷본)
			case(85){iCumRate += 10;} //0.3770739065 키린 겨울 천사의 코트(여성용) (옷본)
			case(86){iCumRate += 10;} //0.3770739065 투 핸디드 소드 (레어 칼라)
			case(87){iCumRate += 10;} //0.3770739065 비펜니스 (레어 칼라)
			case(88){iCumRate += 10;} //0.3770739065 메이스 (레어 칼라)
			case(89){iCumRate += 10;} //0.3770739065 엘라 스트램 부츠
			case(90){iCumRate += 10;} //0.3770739065 스완 윙즈 캡
			case(91){iCumRate += 10;} //0.3770739065 훅 커틀러스
			case(92){iCumRate += 10;} //0.3770739065 지정 색상 염색 앰플
			case(93){iCumRate += 10;} //0.3770739065 본 마린 아머 (남성용) (옷본)
			case(94){iCumRate += 10;} //0.3770739065 본 마린 아머 (여성용) (옷본)
			case(95){iCumRate += 10;} //0.3770739065 코레스 큐트 리본 슈즈
			case(96){iCumRate += 10;} //0.3770739065 드래곤 크레스트
			case(97){iCumRate += 10;} //0.3770739065 세이렌 고양이 가면
			case(98){iCumRate += 10;} //0.3770739065 세이렌 깃털 가면
			case(99){iCumRate += 10;} //0.3770739065 세이렌의 안경
			case(100){iCumRate += 10;} //0.3770739065 세이렌 작은 날개 가면
			case(101){iCumRate += 10;} //0.3770739065 세이렌 날개 가면
			case(102){iCumRate += 10;} //0.3770739065 세이렌 박쥐 날개 가면
			case(103){iCumRate += 10;} //0.3770739065 세이렌의 가면
			case(104){iCumRate += 10;} //0.3770739065 유러피안 컴프
			case(105){iCumRate += 10;} //0.3770739065 워터드롭 캡
			case(106){iCumRate += 10;} //0.3770739065 플루트 풀 헬름
			case(107){iCumRate += 10;} //0.3770739065 윙 하프 헬름
			case(108){iCumRate += 10;} //0.3770739065 플레이트 부츠
			case(109){iCumRate += 10;} //0.3770739065 플루트 건틀렛
			case(110){iCumRate += 10;} //0.3770739065 그레이스 플레이트 아머
			case(111){iCumRate += 10;} //0.3770739065 아리쉬 아슈빈 아머 (남성용)
			case(112){iCumRate += 10;} //0.3770739065 검사학교 교복 롱타입 (옷본)
			case(113){iCumRate += 10;} //0.3770739065 빅 체인 풀 헬름
			case(114){iCumRate += 10;} //0.3770739065 카멜 스피리트 부츠
			case(115){iCumRate += 10;} //0.3770739065 더스틴 실버 나이트 뱀브레이스 (도면)
			case(116){iCumRate += 10;} //0.3770739065 아리쉬 아슈빈 아머(여성용)
			case(117){iCumRate += 10;} //0.3770739065 빅 슬릿 풀 헬름
			case(118){iCumRate += 10;} //0.3770739065 빅 펠리칸 프로텍터
			case(119){iCumRate += 10;} //0.3770739065 빅 파나쉬 헤드 프로텍터
			case(120){iCumRate += 10;} //0.3770739065 그레이스 건틀렛
			case(121){iCumRate += 10;} //0.3770739065 이블 다잉 크라운 (도면)
			case(122){iCumRate += 10;} //0.3770739065 드래곤 크레스트 (도면)
			case(123){iCumRate += 10;} //0.3770739065 플레이트 건틀렛 (도면)
			case(124){iCumRate += 10;} //0.3770739065 아이언 마스킹 헤드기어 (도면)
			case(125){iCumRate += 20;} //0.7541478130 늑대 로브
			case(126){iCumRate += 20;} //0.7541478130 곰 로브
			case(127){iCumRate += 20;} //0.7541478130 본 마린 소드
			case(128){iCumRate += 20;} //0.7541478130 바스타드 소드 (레어 칼라)
			case(129){iCumRate += 20;} //0.7541478130 보급형 실크방직 장갑
			case(130){iCumRate += 20;} //0.7541478130 일반 실크방직 장갑
			case(131){iCumRate += 20;} //0.7541478130 전문가용 실크방직 장갑
			case(132){iCumRate += 20;} //0.7541478130 최고급 실크방직 장갑
			case(133){iCumRate += 20;} //0.7541478130 고급 실크방직 장갑
			case(134){iCumRate += 20;} //0.7541478130 최고급 옷감방직 장갑
			case(135){iCumRate += 20;} //0.7541478130 고급 옷감방직 장갑
			case(136){iCumRate += 20;} //0.7541478130 코코 래빗 로브
			case(137){iCumRate += 20;} //0.7541478130 나타네 설산용 코트
			case(138){iCumRate += 20;} //0.7541478130 롱 소드
			case(139){iCumRate += 20;} //0.7541478130 퀴러시어 헬름 (도면)
			case(140){iCumRate += 20;} //0.7541478130 완전 회복의 포션
			case(141){iCumRate += 20;} //0.7541478130 염색 앰플
			case(142){iCumRate += 20;} //0.7541478130 라운드 실드 (도면)
			case(143){iCumRate += 20;} //0.7541478130 채집용 도끼 (레어 칼라)
			case(144){iCumRate += 20;} //0.7541478130 채집용 단검 (레어 칼라)
			case(145){iCumRate += 20;} //0.7541478130 대장장이 망치 (레어 칼라)
			case(146){iCumRate += 20;} //0.7541478130 곡괭이 (레어 칼라)
			case(147){iCumRate += 20;} //0.7541478130 식칼 (레어 칼라)
			case(148){iCumRate += 20;} //0.7541478130 낫 (레어 칼라)
			case(149){iCumRate += 20;} //0.7541478130 호미 (레어 칼라)
			case(150){iCumRate += 20;} //0.7541478130 낚싯대 (레어 칼라)
			case(151){iCumRate += 20;} //0.7541478130 반죽용 밀대 (레어 칼라)
			case(152){iCumRate += 20;} //0.7541478130 다용도 국자 (레어 칼라)
			case(153){iCumRate += 20;} //0.7541478130 냄비 (레어 칼라)
			case(154){iCumRate += 20;} //0.7541478130 간이 테이블 (레어 칼라)
			case(155){iCumRate += 20;} //0.7541478130 롱 소드 (도면)
			case(156){iCumRate += 20;} //0.7541478130 축복의 포션
			case(157){iCumRate += 20;} //0.7541478130 원격 힐러집 이용권
			case(158){iCumRate += 20;} //0.7541478130 양털 주머니
			case(159){iCumRate += 20;} //0.7541478130 호미 (도면)
			case(160){iCumRate += 20;} //0.7541478130 캠프파이어 키트
			case(161){iCumRate += 20;} //0.7541478130 대용량 축복의 포션
			case(162){iCumRate += 20;} //0.7541478130 스태미나 50 포션
			case(163){iCumRate += 20;} //0.7541478130 단검 (도면)
			case(164){iCumRate += 20;} //0.7541478130 곡괭이 (도면)
			case(165){iCumRate += 20;} //0.7541478130 생명력과 마나 30 포션
			case(166){iCumRate += 20;} //0.7541478130 생명력과 스태미나 30 포션
			case(167){iCumRate += 20;} //0.7541478130 생명력과 스태미나 50 포션
			case(168){iCumRate += 20;} //0.7541478130 스태미나 100 포션
			case(169){iCumRate += 20;} //0.7541478130 사샤 로브 (옷본)
			case(170){iCumRate += 20;} //0.7541478130 코레스 힐러드레스 (옷본)
			case(171){iCumRate += 20;} //0.7541478130 마법학교 교복 (남성용) (옷본)
			case(172){iCumRate += 20;} //0.7541478130 마법학교 교복 (여성용) (옷본)
			case(173){iCumRate += 20;} //0.7541478130 코레스 힐러 글러브 (옷본)
			case(174){iCumRate += 20;} //0.7541478130 몬거 모자 (옷본)
			case(175){iCumRate += 50;} //1.8853695324 철광석
			case(176){iCumRate += 50;} //1.8853695324 동광석
			case(177){iCumRate += 50;} //1.8853695324 일반 실크
			case(178){iCumRate += 50;} //1.8853695324 일반 마감용 실
			case(179){iCumRate += 50;} //1.8853695324 일반 옷감
			case(180){iCumRate += 50;} //1.8853695324 일반 가죽
			case(181){iCumRate += 50;} //1.8853695324 일반 가죽끈
			case(182){iCumRate += 50;} //1.8853695324 굵은 실뭉치
			case(183){iCumRate += 50;} //1.8853695324 가는 실뭉치
			case(184){iCumRate += 20;} //0.7541478130 숏 소드 (도면)
			case(185){iCumRate += 20;} //0.7541478130 스파이크 캡 (도면)
			case(186){iCumRate += 20;} //0.7541478130 머리띠 (옷본)
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //최고급 옷감    * 3
				case(1){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //최고급 가죽    * 3
				case(2){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //최고급 실크    * 3
				case(3){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //굵은 실뭉치    * 20
				case(4){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //가는 실뭉치   * 20
				case(5){itemString = `id:64007 count:20`;itemArray.Add(itemString);} //금괴   * 3
				case(6){itemString = `id:64005 count:20`;itemArray.Add(itemString);} //은괴   * 3
				case(7){itemString = `id:64003 count:20`;itemArray.Add(itemString);} //동괴   * 3
				case(8){itemString = `id:64001 count:20`;itemArray.Add(itemString);} //철괴   * 3
				case(9){itemString = `id:60025 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 가죽   * 5
				case(10){itemString = `id:60013 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 실크   * 5
				case(11){itemString = `id:60021 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 옷감   * 5
				case(12){itemString = `id:64010 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //미스릴광석 *5
				case(13){itemString = `id:64008 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //금광석 *5
				case(14){itemString = `id:64006 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //은광석 *5
				case(15){itemString = `id:64002 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //철광석 *5
				case(16){itemString = `id:64004 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //동광석 *5
				case(17){itemString = `id:2028 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //양털 주머니 *5
				case(18){itemString = `id:15233`;itemArray.Add(itemString);} //한국 고딕 드레스 롱타입 (여성용)
				case(19){itemString = `id:15235`;itemArray.Add(itemString);} //한국 고딕 드레스 쇼트타입 (여성용)
				case(20){itemString = `id:15234`;itemArray.Add(itemString);} //한국 고딕 드레스 (남성용)
				case(21){itemString = `manual:20177`;itemArray.Add(itemString);} //일본식 양손검 (도면)
				case(22){itemString = `manual:20188`;itemArray.Add(itemString);} //일본식 한손검 (도면)
				case(23){itemString = `manual:20189`;itemArray.Add(itemString);} //일본식 단검 (도면)
				case(24){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //최고급 옷감
				case(25){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //최고급 가죽
				case(26){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //최고급 실크
				case(27){itemString = `id:60030 count:10`;itemArray.Add(itemString);} //최고급 가죽끈
				case(28){itemString = `id:60018 count:10`;itemArray.Add(itemString);} //최고급 마감용 실
				case(29){itemString = `id:64009 count:10`;itemArray.Add(itemString);} //미스릴괴
				case(30){itemString = `id:64007 count:10`;itemArray.Add(itemString);} //금괴
				case(31){itemString = `id:64005 count:10`;itemArray.Add(itemString);} //은괴
				case(32){itemString = `id:60043 count:10`;itemArray.Add(itemString);} //물안개 비단
				case(33){itemString = `id:60041 count:10`;itemArray.Add(itemString);} //마법 금 실
				case(34){itemString = `id:60042 count:10`;itemArray.Add(itemString);} //마법 은 실
				case(35){itemString = `id:15217`;itemArray.Add(itemString);} //에이프런 원피스
				case(36){itemString = `id:15076`;itemArray.Add(itemString);} //토크 여자 요리사옷
				case(37){itemString = `id:15077`;itemArray.Add(itemString);} //토크 남자 요리사옷
				case(38){itemString = `id:14037 col1:ffc0f0 col2:ffc0f0 col3:ffc0f0`;itemArray.Add(itemString);} //티오즈 아머(여성용)
				case(39){itemString = `id:14036 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //티오즈 아머(남성용)
				case(40){itemString = `id:15065`;itemArray.Add(itemString);} //엘라 베스트 스커트
				case(41){itemString = `id:2028 col1:8f50eee9`;itemArray.Add(itemString);} //양털 주머니(레어 칼라）
				case(42){itemString = `id:15113`;itemArray.Add(itemString);} //검사학교 교복 쇼트타입(여성용)
				case(43){itemString = `id:18053`;itemArray.Add(itemString);} //견습 요리사 모자
				case(44){itemString = `id:18054`;itemArray.Add(itemString);} //수련 요리사 모자
				case(45){itemString = `manual:125`;itemArray.Add(itemString);} //엘라 베스트 스커트（옷본）
				case(46){itemString = `id:15114`;itemArray.Add(itemString);} //검사학교 교복 롱타입(남성용)
				case(47){itemString = `id:13038`;itemArray.Add(itemString);} //더스틴 실버 나이트 아머
				case(48){itemString = `manual:143`;itemArray.Add(itemString);} //검사학교 교복 쇼트타입 (옷본)
				case(49){itemString = `id:63034 count:20 col1:c00000`;itemArray.Add(itemString);} //붉은색 염색 앰플
				case(50){itemString = `id:63033 col1:000000`;itemArray.Add(itemString);} //검은색 염색 앰플
				case(51){itemString = `id:12006 prefix:20610 suffix:30510`;itemArray.Add(itemString);} //반지 (인첸트가 붙은)
				case(52){itemString = `id:12007 prefix:20710 suffix:31010`;itemArray.Add(itemString);} //데브캣 브로치 (인챈트가 붙은)
				case(53){itemString = `id:40095 col1:c0c000 col2:c0c000 col3:c0c000`;itemArray.Add(itemString);} //드레곤 블레이드 (레어 칼라)
				case(54){itemString = `id:64010 count:5`;itemArray.Add(itemString);} //미스릴 광석
				case(55){itemString = `id:60022 count:5`;itemArray.Add(itemString);} //최고급 옷감
				case(56){itemString = `id:60026 count:5`;itemArray.Add(itemString);} //최고급 가죽
				case(57){itemString = `id:60014 count:5`;itemArray.Add(itemString);} //최고급 실크
				case(58){itemString = `id:60030 count:5`;itemArray.Add(itemString);} //최고급 가죽끈
				case(59){itemString = `id:60018 count:5`;itemArray.Add(itemString);} //최고급 마감용 실
				case(60){itemString = `id:60043 count:5`;itemArray.Add(itemString);} //물안개 비단
				case(61){itemString = `id:60041 count:5`;itemArray.Add(itemString);} //마법 금 실
				case(62){itemString = `id:60042 count:5`;itemArray.Add(itemString);} //마법 은 실
				case(63){itemString = `id:64008 count:10`;itemArray.Add(itemString);} //금광석
				case(64){itemString = `id:64006 count:10`;itemArray.Add(itemString);} //은광석
				case(65){itemString = `id:60021 count:10`;itemArray.Add(itemString);} //고급 옷감
				case(66){itemString = `id:60025 count:10`;itemArray.Add(itemString);} //고급 가죽
				case(67){itemString = `id:60013 count:10`;itemArray.Add(itemString);} //고급 실크
				case(68){itemString = `id:60029 count:10`;itemArray.Add(itemString);} //고급 가죽끈
				case(69){itemString = `id:60017 count:10`;itemArray.Add(itemString);} //고급 마감용 실
				case(70){itemString = `id:64003 count:10`;itemArray.Add(itemString);} //동괴
				case(71){itemString = `id:64001 count:10`;itemArray.Add(itemString);} //철괴
				case(72){itemString = `manual:20133`;itemArray.Add(itemString);} //플루트 숏 소드 (도면)
				case(73){itemString = `manual:20123`;itemArray.Add(itemString);} //헤테로 카이트 실드 (도면)
				case(74){itemString = `manual:160`;itemArray.Add(itemString);} //샤오롱주엔 예복정장 신발(남성용) (옷본)
				case(75){itemString = `manual:159`;itemArray.Add(itemString);} //샤오롱주엔 예복정장 신발(여성용) (옷본)
				case(76){itemString = `manual:157`;itemArray.Add(itemString);} //키린 겨울 천사의 장갑 (옷본)
				case(77){itemString = `manual:165`;itemArray.Add(itemString);} //키린 겨울 천사의 모자 (옷본)
				case(78){itemString = `manual:161`;itemArray.Add(itemString);} //키린 겨울 천사의 부츠 (옷본)
				case(79){itemString = `id:14023`;itemArray.Add(itemString);} //본 마린 아머 (남성용)
				case(80){itemString = `id:14024`;itemArray.Add(itemString);} //본 마린 아머 (여성용)
				case(81){itemString = `id:40080 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //글라디우스 (레어 칼라)
				case(82){itemString = `manual:145`;itemArray.Add(itemString);} //샤오롱주엔 예복정장(여성용) (옷본)
				case(83){itemString = `manual:146`;itemArray.Add(itemString);} //샤오롱주엔 예복정장(남성용) (옷본)
				case(84){itemString = `manual:147`;itemArray.Add(itemString);} //키린 겨울 천사의 코트(남성용) (옷본)
				case(85){itemString = `manual:148`;itemArray.Add(itemString);} //키린 겨울 천사의 코트(여성용) (옷본)
				case(86){itemString = `id:40030 col1:00c000 col2:00c000 col3:00c000`;itemArray.Add(itemString);} //투 핸디드 소드 (레어 칼라)
				case(87){itemString = `id:40078 col1:c000c0 col2:c000c0 col3:c000c0`;itemArray.Add(itemString);} //비펜니스 (레어 칼라)
				case(88){itemString = `id:40079 col1:0000c0 col2:0000c0 col3:0000c0`;itemArray.Add(itemString);} //메이스 (레어 칼라)
				case(89){itemString = `id:17040`;itemArray.Add(itemString);} //엘라 스트램 부츠
				case(90){itemString = `id:18523`;itemArray.Add(itemString);} //스완 윙즈 캡
				case(91){itemString = `id:40083`;itemArray.Add(itemString);} //훅 커틀러스
				case(92){itemString = `id:63030`;itemArray.Add(itemString);} //지정 색상 염색 앰플
				case(93){itemString = `manual:174`;itemArray.Add(itemString);} //본 마린 아머 (남성용) (옷본)
				case(94){itemString = `manual:175`;itemArray.Add(itemString);} //본 마린 아머 (여성용) (옷본)
				case(95){itemString = `id:17039`;itemArray.Add(itemString);} //코레스 큐트 리본 슈즈
				case(96){itemString = `id:18518`;itemArray.Add(itemString);} //드래곤 크레스트
				case(97){itemString = `id:18096`;itemArray.Add(itemString);} //세이렌 고양이 가면
				case(98){itemString = `id:18097`;itemArray.Add(itemString);} //세이렌 깃털 가면
				case(99){itemString = `id:18098`;itemArray.Add(itemString);} //세이렌의 안경
				case(100){itemString = `id:18099`;itemArray.Add(itemString);} //세이렌 작은 날개 가면
				case(101){itemString = `id:18100`;itemArray.Add(itemString);} //세이렌 날개 가면
				case(102){itemString = `id:18101`;itemArray.Add(itemString);} //세이렌 박쥐 날개 가면
				case(103){itemString = `id:18102`;itemArray.Add(itemString);} //세이렌의 가면
				case(104){itemString = `id:18521`;itemArray.Add(itemString);} //유러피안 컴프
				case(105){itemString = `id:18525`;itemArray.Add(itemString);} //워터드롭 캡
				case(106){itemString = `id:18511`;itemArray.Add(itemString);} //플루트 풀 헬름
				case(107){itemString = `id:18506`;itemArray.Add(itemString);} //윙 하프 헬름
				case(108){itemString = `id:17505`;itemArray.Add(itemString);} //플레이트 부츠
				case(109){itemString = `id:16505`;itemArray.Add(itemString);} //플루트 건틀렛
				case(110){itemString = `id:14019`;itemArray.Add(itemString);} //그레이스 플레이트 아머
				case(111){itemString = `id:13045`;itemArray.Add(itemString);} //아리쉬 아슈빈 아머 (남성용)
				case(112){itemString = `manual:142`;itemArray.Add(itemString);} //검사학교 교복 롱타입 (옷본)
				case(113){itemString = `id:18542`;itemArray.Add(itemString);} //빅 체인 풀 헬름
				case(114){itemString = `id:17064`;itemArray.Add(itemString);} //카멜 스피리트 부츠
				case(115){itemString = `manual:20158`;itemArray.Add(itemString);} //더스틴 실버 나이트 뱀브레이스 (도면)
				case(116){itemString = `id:13046`;itemArray.Add(itemString);} //아리쉬 아슈빈 아머(여성용)
				case(117){itemString = `id:18543`;itemArray.Add(itemString);} //빅 슬릿 풀 헬름
				case(118){itemString = `id:18544`;itemArray.Add(itemString);} //빅 펠리칸 프로텍터
				case(119){itemString = `id:18547`;itemArray.Add(itemString);} //빅 파나쉬 헤드 프로텍터
				case(120){itemString = `id:16523`;itemArray.Add(itemString);} //그레이스 건틀렛
				case(121){itemString = `manual:20112`;itemArray.Add(itemString);} //이블 다잉 크라운 (도면)
				case(122){itemString = `manual:20113`;itemArray.Add(itemString);} //드래곤 크레스트 (도면)
				case(123){itemString = `manual:20119`;itemArray.Add(itemString);} //플레이트 건틀렛 (도면)
				case(124){itemString = `manual:20114`;itemArray.Add(itemString);} //아이언 마스킹 헤드기어 (도면)
				case(125){itemString = `id:19017`;itemArray.Add(itemString);} //늑대 로브
				case(126){itemString = `id:19016`;itemArray.Add(itemString);} //곰 로브
				case(127){itemString = `id:40100`;itemArray.Add(itemString);} //본 마린 소드
				case(128){itemString = `id:40012 col1:c00060 col2:c00060 col3:c00060`;itemArray.Add(itemString);} //바스타드 소드 (레어 칼라)
				case(129){itemString = `id:60031`;itemArray.Add(itemString);} //보급형 실크방직 장갑
				case(130){itemString = `id:60032`;itemArray.Add(itemString);} //일반 실크방직 장갑
				case(131){itemString = `id:60033`;itemArray.Add(itemString);} //전문가용 실크방직 장갑
				case(132){itemString = `id:60046`;itemArray.Add(itemString);} //최고급 실크방직 장갑
				case(133){itemString = `id:60055`;itemArray.Add(itemString);} //고급 실크방직 장갑
				case(134){itemString = `id:60056`;itemArray.Add(itemString);} //최고급 옷감방직 장갑
				case(135){itemString = `id:60057`;itemArray.Add(itemString);} //고급 옷감방직 장갑
				case(136){itemString = `id:19009`;itemArray.Add(itemString);} //코코 래빗 로브
				case(137){itemString = `id:19020`;itemArray.Add(itemString);} //나타네 설산용 코트
				case(138){itemString = `id:40010`;itemArray.Add(itemString);} //롱 소드
				case(139){itemString = `manual:20107`;itemArray.Add(itemString);} //퀴러시어 헬름 (도면)
				case(140){itemString = `id:51031 count:5`;itemArray.Add(itemString);} //완전 회복의 포션
				case(141){itemString = `id:63024 expire:10080`;itemArray.Add(itemString);} //염색 앰플
				case(142){itemString = `manual:20103`;itemArray.Add(itemString);} //라운드 실드 (도면)
				case(143){itemString = `id:40022 col1:00c000`;itemArray.Add(itemString);} //채집용 도끼 (레어 칼라)
				case(144){itemString = `id:40023 col1:0000c0 col2:0000c0 col3:0000c0`;itemArray.Add(itemString);} //채집용 단검 (레어 칼라)
				case(145){itemString = `id:40024 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //대장장이 망치 (레어 칼라)
				case(146){itemString = `id:40025 col1:c000c0 col2:c000c0 col3:c000c0`;itemArray.Add(itemString);} //곡괭이 (레어 칼라)
				case(147){itemString = `id:40042 col1:c0c000 col2:c0c000 col3:c0c000`;itemArray.Add(itemString);} //식칼 (레어 칼라)
				case(148){itemString = `id:40026 col1:c00060 col2:c00060 col3:c00060`;itemArray.Add(itemString);} //낫 (레어 칼라)
				case(149){itemString = `id:40027 col1:c06060 col2:c06060 col3:c06060`;itemArray.Add(itemString);} //호미 (레어 칼라)
				case(150){itemString = `id:40045 col1:fff0c0 col2:fff0c0 col3:fff0c0`;itemArray.Add(itemString);} //낚싯대 (레어 칼라)
				case(151){itemString = `id:40043 col1:ffffff col2:ffffff col3:ffffff`;itemArray.Add(itemString);} //반죽용 밀대 (레어 칼라)
				case(152){itemString = `id:40044 col1:000000 col2:000000 col3:000000`;itemArray.Add(itemString);} //다용도 국자 (레어 칼라)
				case(153){itemString = `id:46004 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //냄비 (레어 칼라)
				case(154){itemString = `id:46005 col1:c00000 col2:c00000 col3:c00000`;itemArray.Add(itemString);} //간이 테이블 (레어 칼라)
				case(155){itemString = `manual:20105`;itemArray.Add(itemString);} //롱 소드 (도면)
				case(156){itemString = `id:63016 count:3`;itemArray.Add(itemString);} //축복의 포션
				case(157){itemString = `id:63047 count:5`;itemArray.Add(itemString);} //원격 힐러집 이용권
				case(158){itemString = `id:2028 count:20`;itemArray.Add(itemString);} //양털 주머니
				case(159){itemString = `manual:20101`;itemArray.Add(itemString);} //호미 (도면)
				case(160){itemString = `id:63029 count:5`;itemArray.Add(itemString);} //캠프파이어 키트
				case(161){itemString = `id:63025 count:3`;itemArray.Add(itemString);} //대용량 축복의 포션
				case(162){itemString = `id:51013 count:5`;itemArray.Add(itemString);} //스태미나 50 포션
				case(163){itemString = `manual:20102`;itemArray.Add(itemString);} //단검 (도면)
				case(164){itemString = `manual:20104`;itemArray.Add(itemString);} //곡괭이 (도면)
				case(165){itemString = `id:51022 count:5`;itemArray.Add(itemString);} //생명력과 마나 30 포션
				case(166){itemString = `id:51027 count:5`;itemArray.Add(itemString);} //생명력과 스태미나 30 포션
				case(167){itemString = `id:51028 count:3`;itemArray.Add(itemString);} //생명력과 스태미나 50 포션
				case(168){itemString = `id:51014 count:3`;itemArray.Add(itemString);} //스태미나 100 포션
				case(169){itemString = `id:19022`;itemArray.Add(itemString);} //사샤 로브
				case(170){itemString = `manual:101`;itemArray.Add(itemString);} //코레스 힐러드레스 (옷본)
				case(171){itemString = `manual:102`;itemArray.Add(itemString);} //마법학교 교복 (남성용) (옷본)
				case(172){itemString = `manual:103`;itemArray.Add(itemString);} //마법학교 교복 (여성용) (옷본)
				case(173){itemString = `manual:104`;itemArray.Add(itemString);} //코레스 힐러 글러브 (옷본)
				case(174){itemString = `manual:105`;itemArray.Add(itemString);} //몬거 모자 (옷본)
				case(175){itemString = `id:64002 count:10`;itemArray.Add(itemString);} //철광석
				case(176){itemString = `id:64004 count:10`;itemArray.Add(itemString);} //동광석
				case(177){itemString = `id:60012 count:10`;itemArray.Add(itemString);} //일반 실크
				case(178){itemString = `id:60016 count:10`;itemArray.Add(itemString);} //일반 마감용 실
				case(179){itemString = `id:60020 count:10`;itemArray.Add(itemString);} //일반 옷감
				case(180){itemString = `id:60024 count:10`;itemArray.Add(itemString);} //일반 가죽
				case(181){itemString = `id:60028 count:10`;itemArray.Add(itemString);} //일반 가죽끈
				case(182){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //굵은 실뭉치
				case(183){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //가는 실뭉치
				case(184){itemString = `manual:20131`;itemArray.Add(itemString);} //숏 소드 (도면)
				case(185){itemString = `manual:20008`;itemArray.Add(itemString);} //스파이크 캡 (도면)
				case(186){itemString = `manual:114`;itemArray.Add(itemString);} //머리띠 (옷본)
		}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
		{
				itemString = (string)itemArray.Get(j);
			DebugOut(`유저에게 `+itemString+` 를 줌`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}

			bCashGachaphonGived = true;
		}
		if (bCashGachaphonGived)
		{
			break;
		}

		++i;
	}

	// 캐시 가차폰을 못받았다.
	if (!bCashGachaphonGived)
	{
		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
	}	
}
