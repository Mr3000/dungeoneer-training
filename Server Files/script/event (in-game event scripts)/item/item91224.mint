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
	//북미 초보자 가챠폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(2973);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15151 col1:9999cc col2:ffffff col3:000000`; iCumRate += 1;}	//0.033636058 웨이스트 테일러 웨어(남성용)(레어색상)
			case(1){itemString = `id:15152 col1:ff9900 col2:ffffff col3:000000`; iCumRate += 1;}	//0.033636058 웨이스트 테일러 웨어(여성용)(레어색상)
			case(2){itemString = `id:13022 col1:e1b43d col2:000000 col3:fcf2d3`; iCumRate += 1;}	//0.033636058 @로즈 플레이트 아머 (P타입)(레어색상)
			case(3){itemString = `id:40033 col1:5c703d col2:ffffff col3:718a4b`; iCumRate += 1;}	//0.033636058 클레이모어(레어색상)
			case(4){itemString = `id:40004 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 류트(반짝이 레어색상)
			case(5){itemString = `id:40018 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 우쿨렐레(반짝이 레어색상)
			case(6){itemString = `id:40017 col1:86402894 col3:86402894`; iCumRate += 1;}	//0.033636058 만돌린(반짝이 레어색상)
			case(7){itemString = `id:15153`; iCumRate += 2;}	//0.067272116 @산드라 스나이퍼 수트(남성용)
			case(8){itemString = `id:15154`; iCumRate += 2;}	//0.067272116 @산드라 스나이퍼 수트(여성용)
			case(9){itemString = `id:16026`; iCumRate += 2;}	//0.067272116 @산드라 스나이퍼 수트 글러브
			case(10){itemString = `id:17060`; iCumRate += 2;}	//0.067272116 @산드라 스나이퍼 수트 부츠(남성용)
			case(11){itemString = `id:17061`; iCumRate += 2;}	//0.067272116 @산드라 스나이퍼 수트 부츠(여성용)
			case(12){itemString = `id:40013 col1:5b88c2`; iCumRate += 2;}	//0.067272116 롱 보우(레어 색상)
			case(13){itemString = `id:40031 col1:5b88c2`; iCumRate += 2;}	//0.067272116 석궁(레어 색상)
			case(14){itemString = `id:46001 col1:5b88c2`; iCumRate += 2;}	//0.067272116 라운드 실드(레어 색상)
			case(15){itemString = `id:40004 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 류트(레어색상)
			case(16){itemString = `id:40018 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 우쿨렐레(레어색상)
			case(17){itemString = `id:40017 col1:ff6600 col2:000000 col3:ff6600`; iCumRate += 2;}	//0.067272116 만돌린(레어색상)
			case(18){itemString = `id:40027 col1:ff6600 durability:10000 durability_max:10000`; iCumRate += 2;}	//0.067272116 호미(레어색상)
			case(19){itemString = `id:40022 col1:ff6600 durability:7000 durability_max:7000`; iCumRate += 2;}	//0.067272116 채집용 도끼(레어색상)
			case(20){itemString = `id:40023 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 채집용 단검(레어색상)
			case(21){itemString = `id:40042 col1:ff6600 durability:6000 durability_max:6000`; iCumRate += 2;}	//0.067272116 식칼(레어색상)
			case(22){itemString = `id:46005 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 간이 테이블(레어색상)
			case(23){itemString = `id:40045 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 낚싯대(레어색상)
			case(24){itemString = `id:40025 col1:ff6600 durability:11000 durability_max:11000`; iCumRate += 2;}	//0.067272116 곡괭이(레어색상)
			case(25){itemString = `id:40026 col1:ff6600 durability:13000 durability_max:13000`; iCumRate += 2;}	//0.067272116 낫(레어색상)
			case(26){itemString = `id:46004 col1:ff6600 durability:31000 durability_max:31000`; iCumRate += 2;}	//0.067272116 냄비(레어색상)
			case(27){itemString = `id:40044 col1:ff6600 durability:9000 durability_max:9000`; iCumRate += 2;}	//0.067272116 다용도 국자 (레어색상)
			case(28){itemString = `id:40024 col1:ff6600 durability:13000 durability_max:13000`; iCumRate += 2;}	//0.067272116 대장장이 망치(레어색상)
			case(29){itemString = `id:40043 col1:ff6600 durability:6000 durability_max:6000`; iCumRate += 2;}	//0.067272116 반죽용 밀대(레어색상)
			case(30){itemString = `id:13010`; iCumRate += 8;}	//0.269088463 @라운드 폴드론 체인메일
			case(31){itemString = `id:13023`; iCumRate += 8;}	//0.269088463 @로즈 플레이트 아머 (B타입)
			case(32){itemString = `id:16504`; iCumRate += 8;}	//0.269088463 @카운터 건틀렛
			case(33){itemString = `id:17500`; iCumRate += 8;}	//0.269088463 @하이폴린 플레이트 부츠
			case(34){itemString = `id:18508`; iCumRate += 8;}	//0.269088463 @슬릿 풀 헬름
			case(35){itemString = `id:60014 count:10`; iCumRate += 8;}	//0.269088463 최고급 실크
			case(36){itemString = `id:60022 count:10`; iCumRate += 8;}	//0.269088463 최고급 옷감
			case(37){itemString = `id:60018 count:10`; iCumRate += 8;}	//0.269088463 최고급 마감용 실
			case(38){itemString = `id:60026 count:10`; iCumRate += 8;}	//0.269088463 최고급 가죽
			case(39){itemString = `id:64008 count:10`; iCumRate += 8;}	//0.269088463 금광석
			case(40){itemString = `id:64007 count:10`; iCumRate += 8;}	//0.269088463 금괴
			case(41){itemString = `id:51105 count:10`; iCumRate += 8;}	//0.269088463 골드 허브
			case(42){itemString = `id:63016 count:5`; iCumRate += 8;}	//0.269088463 축복의 포션
			case(43){itemString = `id:40030 col1:773333`; iCumRate += 8;}	//0.269088463 투 핸디드 소드(동 마감)
			case(44){itemString = `id:40033 col1:773333`; iCumRate += 8;}	//0.269088463 클레이모어(동 마감)
			case(45){itemString = `id:40012 col1:773333`; iCumRate += 8;}	//0.269088463 바스타드 소드(동 마감)
			case(46){itemString = `id:40030 col1:bb9955`; iCumRate += 8;}	//0.269088463 투 핸디드 소드(금 마감)
			case(47){itemString = `id:40033 col1:bb9955`; iCumRate += 8;}	//0.269088463 클레이머어(금 마감)
			case(48){itemString = `id:40012 col1:bb9955`; iCumRate += 8;}	//0.269088463 바스타드 소드(금 마감)
			case(49){itemString = `id:15012`; iCumRate += 8;}	//0.269088463 의장용 유니폼
			case(50){itemString = `id:15016`; iCumRate += 8;}	//0.269088463 의장용 스타킹 유니폼
			case(51){itemString = `id:15019`; iCumRate += 8;}	//0.269088463 @코레스 닌자슈트
			case(52){itemString = `id:15020`; iCumRate += 8;}	//0.269088463 @코레스 힐러드레스
			case(53){itemString = `id:15026`; iCumRate += 8;}	//0.269088463 @리리나 롱스커트
			case(54){itemString = `id:15027`; iCumRate += 8;}	//0.269088463 @몬거 롱스커트
			case(55){itemString = `id:15042`; iCumRate += 8;}	//0.269088463 롱넥 원피스
			case(56){itemString = `id:15051`; iCumRate += 8;}	//0.269088463 @타이트 벨트 웨어
			case(57){itemString = `id:15052`; iCumRate += 8;}	//0.269088463 @터크스 투톤 튜닉
			case(58){itemString = `id:15067`; iCumRate += 8;}	//0.269088463 동양풍 무사복
			case(59){itemString = `id:16004`; iCumRate += 8;}	//0.269088463 @스터디드 브레이슬렛
			case(60){itemString = `id:16005`; iCumRate += 8;}	//0.269088463 @우드플레이트 캐넌
			case(61){itemString = `id:16014`; iCumRate += 8;}	//0.269088463 로리카 장갑
			case(62){itemString = `id:16016`; iCumRate += 8;}	//0.269088463 @라이트 글러브
			case(63){itemString = `id:16019`; iCumRate += 8;}	//0.269088463 줄무늬 팔목 장갑
			case(64){itemString = `id:17010`; iCumRate += 8;}	//0.269088463 @코레스 부츠
			case(65){itemString = `id:17017`; iCumRate += 8;}	//0.269088463 @레더코트 슈즈
			case(66){itemString = `id:17021`; iCumRate += 8;}	//0.269088463 @로리카 샌들
			case(67){itemString = `id:17024`; iCumRate += 8;}	//0.269088463 통굽 샌달
			case(68){itemString = `id:17029`; iCumRate += 8;}	//0.269088463 @벨트 버클 부츠
			case(69){itemString = `id:18000`; iCumRate += 8;}	//0.269088463 토크 모자
			case(70){itemString = `id:18003`; iCumRate += 8;}	//0.269088463 @리리나 캡
			case(71){itemString = `id:18008`; iCumRate += 8;}	//0.269088463 @스트라이프 캡
			case(72){itemString = `id:18009`; iCumRate += 8;}	//0.269088463 @몬거 아쳐 캡
			case(73){itemString = `id:18013`; iCumRate += 8;}	//0.269088463 @코레스 캡
			case(74){itemString = `id:19001`; iCumRate += 8;}	//0.269088463 @로브
			case(75){itemString = `id:19003`; iCumRate += 8;}	//0.269088463 @트리콜로르 로브
			case(76){itemString = `id:14001`; iCumRate += 8;}	//0.269088463 @라이트 레더메일(여)
			case(77){itemString = `id:14010`; iCumRate += 8;}	//0.269088463 @라이트 레더메일(남)
			case(78){itemString = `id:14003`; iCumRate += 8;}	//0.269088463 @스터디드 퀴러시어
			case(79){itemString = `id:14005`; iCumRate += 8;}	//0.269088463 @드란도스 레더메일(여)
			case(80){itemString = `id:14011`; iCumRate += 8;}	//0.269088463 @드란도스 레더메일(남)
			case(81){itemString = `id:14007`; iCumRate += 8;}	//0.269088463 @브레스트 클로스 메일
			case(82){itemString = `id:14013`; iCumRate += 8;}	//0.269088463 @로리카 세그먼타타에
			case(83){itemString = `id:14016`; iCumRate += 8;}	//0.269088463 @크로스벨트 레더 코트
			case(84){itemString = `id:16501`; iCumRate += 8;}	//0.269088463 @레더 프로텍터
			case(85){itemString = `id:17501`; iCumRate += 8;}	//0.269088463 @실러릿 슈즈
			case(86){itemString = `id:17506`; iCumRate += 8;}	//0.269088463 @롱그리브 부츠
			case(87){itemString = `id:40006`; iCumRate += 16;}	//0.538176926 단검
			case(88){itemString = `id:40005`; iCumRate += 16;}	//0.538176926 숏 소드
			case(89){itemString = `id:40010`; iCumRate += 16;}	//0.538176926 롱 소드
			case(90){itemString = `id:40007`; iCumRate += 16;}	//0.538176926 한손 도끼
			case(91){itemString = `id:40016`; iCumRate += 16;}	//0.538176926 해머
			case(92){itemString = `id:40015`; iCumRate += 16;}	//0.538176926 플루트 숏소드
			case(93){itemString = `id:40030`; iCumRate += 16;}	//0.538176926 투 핸디드 소드
			case(94){itemString = `id:40011`; iCumRate += 16;}	//0.538176926 브로드 소드
			case(95){itemString = `id:40033`; iCumRate += 16;}	//0.538176926 클레이모어
			case(96){itemString = `id:40012`; iCumRate += 16;}	//0.538176926 바스타드 소드
			case(97){itemString = `id:40019`; iCumRate += 16;}	//0.538176926 굵은 나뭇가지
			case(98){itemString = `id:40020`; iCumRate += 16;}	//0.538176926 나무 몽둥이
			case(99){itemString = `id:40031`; iCumRate += 16;}	//0.538176926 석궁
			case(100){itemString = `id:40013`; iCumRate += 16;}	//0.538176926 롱 보우
			case(101){itemString = `id:40014`; iCumRate += 16;}	//0.538176926 콤포짓 보우
			case(102){itemString = `id:40003`; iCumRate += 16;}	//0.538176926 숏 보우
			case(103){itemString = `id:46001`; iCumRate += 16;}	//0.538176926 라운드 실드
			case(104){itemString = `manual:106`; iCumRate += 16;}	//0.538176926 옷본 - 포포스커트(여)
			case(105){itemString = `manual:112`; iCumRate += 16;}	//0.538176926 옷본 - 마법사모자
			case(106){itemString = `manual:114`; iCumRate += 16;}	//0.538176926 옷본 - 머리띠
			case(107){itemString = `manual:107`; iCumRate += 16;}	//0.538176926 옷본 - 몬거 여행자옷(여)
			case(108){itemString = `manual:108`; iCumRate += 16;}	//0.538176926 옷본 - 몬거 여행자옷(남)
			case(109){itemString = `manual:102`; iCumRate += 16;}	//0.538176926 옷본 - 마법학교 교복(남)
			case(110){itemString = `manual:115`; iCumRate += 16;}	//0.538176926 옷본 - 몬거 롱스커트(여)
			case(111){itemString = `manual:118`; iCumRate += 16;}	//0.538176926 옷본 - 코레스 닌자슈트(남)
			case(112){itemString = `manual:111`; iCumRate += 16;}	//0.538176926 옷본 - 가디언 장갑
			case(113){itemString = `manual:117`; iCumRate += 16;}	//0.538176926 옷본 - 리리나 롱스커트(여)
			case(114){itemString = `manual:105`; iCumRate += 16;}	//0.538176926 옷본 - 몬거 모자
			case(115){itemString = `manual:109`; iCumRate += 16;}	//0.538176926 옷본 - 클로스 메일
			case(116){itemString = `manual:116`; iCumRate += 16;}	//0.538176926 옷본 - 라이트 레더메일(여)
			case(117){itemString = `manual:120`; iCumRate += 16;}	//0.538176926 옷본 - 라이트 레더메일(남)
			case(118){itemString = `manual:126`; iCumRate += 16;}	//0.538176926 옷본 - 루이스 베스트 웨어(남)
			case(119){itemString = `manual:122`; iCumRate += 16;}	//0.538176926 옷본 - 전문가용 실크방직 장갑
			case(120){itemString = `manual:119`; iCumRate += 16;}	//0.538176926 옷본 - 코레스 씨프슈트(남)
			case(121){itemString = `manual:123`; iCumRate += 16;}	//0.538176926 옷본 - 레더 미니 원피스 링타입(여)
			case(122){itemString = `manual:20106`; iCumRate += 16;}	//0.538176926 도면 - 낫
			case(123){itemString = `manual:20104`; iCumRate += 16;}	//0.538176926 도면 - 곡괭이
			case(124){itemString = `manual:20131`; iCumRate += 16;}	//0.538176926 도면 - 숏 소드
			case(125){itemString = `manual:20102`; iCumRate += 16;}	//0.538176926 도면 - 단검
			case(126){itemString = `manual:20108`; iCumRate += 16;}	//0.538176926 도면 - 스파이크 캡
			case(127){itemString = `manual:20103`; iCumRate += 16;}	//0.538176926 도면 - 라운드 실드
			case(128){itemString = `manual:20105`; iCumRate += 16;}	//0.538176926 도면 - 롱 소드
			case(129){itemString = `manual:20117`; iCumRate += 16;}	//0.538176926 도면 - 그리브 부츠
			case(130){itemString = `manual:20134`; iCumRate += 16;}	//0.538176926 도면 - 해머
			case(131){itemString = `manual:20135`; iCumRate += 16;}	//0.538176926 도면 - 브로드 소드
			case(132){itemString = `manual:20137`; iCumRate += 16;}	//0.538176926 도면 - 바스타드 소드
			case(133){itemString = `id:62005 prefix:6`; iCumRate += 16;}	//0.538176926 스네이크헌터
			case(134){itemString = `id:62005 prefix:7`; iCumRate += 16;}	//0.538176926 폭스헌터
			case(135){itemString = `id:62005 prefix:107`; iCumRate += 16;}	//0.538176926 폭스테이머
			case(136){itemString = `id:62005 prefix:207`; iCumRate += 16;}	//0.538176926 폭스
			case(137){itemString = `id:62005 suffix:10604`; iCumRate += 16;}	//0.538176926 농부의
			case(138){itemString = `id:62005 suffix:11104`; iCumRate += 16;}	//0.538176926 위크니스
			case(139){itemString = `id:60009 count:5`; iCumRate += 24;}	//0.807265388 양털
			case(140){itemString = `id:60008 count:5`; iCumRate += 24;}	//0.807265388 거미줄
			case(141){itemString = `id:60004 count:5`; iCumRate += 24;}	//0.807265388 매듭끈
			case(142){itemString = `id:60028 count:10`; iCumRate += 24;}	//0.807265388 일반 가죽끈
			case(143){itemString = `id:60013 count:10`; iCumRate += 24;}	//0.807265388 고급 실크
			case(144){itemString = `id:60021 count:10`; iCumRate += 24;}	//0.807265388 고급 옷감
			case(145){itemString = `id:60017 count:10`; iCumRate += 24;}	//0.807265388 고급 마감용 실
			case(146){itemString = `id:60025 count:10`; iCumRate += 24;}	//0.807265388 고급 가죽
			case(147){itemString = `id:60012 count:10`; iCumRate += 24;}	//0.807265388 일반 실크
			case(148){itemString = `id:60016 count:10`; iCumRate += 24;}	//0.807265388 일반 마감용 실
			case(149){itemString = `id:60020 count:10`; iCumRate += 24;}	//0.807265388 일반 옷감
			case(150){itemString = `id:60024 count:10`; iCumRate += 24;}	//0.807265388 일반 가죽
			case(151){itemString = `id:64002 count:10`; iCumRate += 24;}	//0.807265388 철광석
			case(152){itemString = `id:64004 count:10`; iCumRate += 24;}	//0.807265388 동광석
			case(153){itemString = `id:64006 count:10`; iCumRate += 24;}	//0.807265388 은광석
			case(154){itemString = `id:64001 count:10`; iCumRate += 24;}	//0.807265388 철괴
			case(155){itemString = `id:64003 count:10`; iCumRate += 24;}	//0.807265388 동괴
			case(156){itemString = `id:64005 count:10`; iCumRate += 24;}	//0.807265388 은괴
			case(157){itemString = `id:51102 count:10`; iCumRate += 24;}	//0.807265388 마나 허브
			case(158){itemString = `id:51101 count:10`; iCumRate += 24;}	//0.807265388 블러디 허브
			case(159){itemString = `id:51103 count:10`; iCumRate += 24;}	//0.807265388 선라이트 허브
			case(160){itemString = `id:62003 count:5`; iCumRate += 24;}	//0.807265388 축복받은 마법가루
			case(161){itemString = `id:63029 count:5`; iCumRate += 24;}	//0.807265388 캠프파이어 키트
			case(162){itemString = `id:50006 count:5`; iCumRate += 24;}	//0.807265388 고기 조각
			case(163){itemString = `id:40025`; iCumRate += 24;}	//0.807265388 곡괭이
			case(164){itemString = `id:2001`; iCumRate += 24;}	//0.807265388 금화주머니
			case(165){itemString = `id:40026`; iCumRate += 24;}	//0.807265388 낫
			case(166){itemString = `id:40024`; iCumRate += 24;}	//0.807265388 대장장이 망치
			case(167){itemString = `id:50203`; iCumRate += 24;}	//0.807265388 레드 선라이즈
			case(168){itemString = `id:62004 count:5`; iCumRate += 24;}	//0.807265388 마법가루
			case(169){itemString = `id:63027 expire:10080`; iCumRate += 24;}	//0.807265388 밀랍 날개
			case(170){itemString = `id:45002 count:100`; iCumRate += 24;}	//0.807265388 볼트
			case(171){itemString = `id:60005 count:10`; iCumRate += 24;}	//0.807265388 붕대
			case(172){itemString = `id:50124 quality:80`; iCumRate += 24;}	//0.807265388 비프 스테이크 80퀄리티
			case(173){itemString = `id:63020`; iCumRate += 24;}	//0.807265388 빈 병
			case(174){itemString = `id:51001 count:10`; iCumRate += 24;}	//0.807265388 생명력 10 포션
			case(175){itemString = `id:51022 count:5`; iCumRate += 24;}	//0.807265388 생명력과 마나 30 포션
			case(176){itemString = `id:51027 count:5`; iCumRate += 24;}	//0.807265388 생명력과 스태미나 30 포션
			case(177){itemString = `id:51028 count:5`; iCumRate += 24;}	//0.807265388 생명력과 스태미나 50 포션
			case(178){itemString = `id:51011 count:10`; iCumRate += 24;}	//0.807265388 스태미나 10 포션
			case(179){itemString = `id:40042`; iCumRate += 24;}	//0.807265388 식칼
			case(180){itemString = `id:63019 count:50`; iCumRate += 24;}	//0.807265388 알비 배틀 아레나 코인
			case(181){itemString = `id:63043 count:3`; iCumRate += 24;}	//0.807265388 어드밴스드 깃털
			case(182){itemString = `id:63001 count:5`; iCumRate += 24;}	//0.807265388 여신의 날개
			case(183){itemString = `id:40002`; iCumRate += 24;}	//0.807265388 연습용 목도
			case(184){itemString = `id:51031 count:3`; iCumRate += 24;}	//0.807265388 완전 회복의 포션
			case(185){itemString = `id:50014`; iCumRate += 24;}	//0.807265388 왕감자
			case(186){itemString = `id:63026 count:3`; iCumRate += 24;}	//0.807265388 원격 은행 이용권
			case(187){itemString = `id:63057 count:3`; iCumRate += 24;}	//0.807265388 원격 의류 수리 이용권
			case(188){itemString = `id:63047 count:3`; iCumRate += 24;}	//0.807265388 원격 힐러집 이용권
			case(189){itemString = `id:40023`; iCumRate += 24;}	//0.807265388 채집용 단검
			case(190){itemString = `id:40022`; iCumRate += 24;}	//0.807265388 채집용 도끼
			case(191){itemString = `id:63016 count:3`; iCumRate += 24;}	//0.807265388 축복의 포션
			case(192){itemString = `id:63039 expire:10080`; iCumRate += 24;}	//0.807265388 캠프 키트
			case(193){itemString = `id:63029 count:5`; iCumRate += 24;}	//0.807265388 캠프파이어키트
			case(194){itemString = `id:50005`; iCumRate += 24;}	//0.807265388 커다란 고기덩어리
			case(195){itemString = `id:2006`; iCumRate += 24;}	//0.807265388 큰 금화주머니
			case(196){itemString = `id:50202`; iCumRate += 24;}	//0.807265388 키스 온 더 립스
			case(197){itemString = `id:63044 count:3`; iCumRate += 24;}	//0.807265388 파티 부활의 깃털
			case(198){itemString = `id:63000 count:3`; iCumRate += 24;}	//0.807265388 피닉스의 깃털
			case(199){itemString = `id:40027`; iCumRate += 24;}	//0.807265388 호미
			case(200){itemString = `id:45001 count:100`; iCumRate += 24;}	//0.807265388 화살
			case(201){itemString = `id:63058`; iCumRate += 24;}	//0.807265388 회복 속도 증가 포션
			case(202){itemString = `id:50201 quality:80`; iCumRate += 24;}	//0.807265388 BnR 80퀄리티
			case(203){itemString = `id:50164 quality:80`; iCumRate += 24;}	//0.807265388 T본 스테이크 80퀄리티
			case(204){itemString = `id:40004`; iCumRate += 24;}	//0.807265388 류트
			case(205){itemString = `id:40018`; iCumRate += 24;}	//0.807265388 우쿨렐레
			case(206){itemString = `id:40017`; iCumRate += 24;}	//0.807265388 만돌린
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
