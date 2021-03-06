//////////////////////////////////////////////////////////////////////////////////
//                       Mabinogi Project : Use Item Script
//                           아이템 사용시의 이벤트 함수
//
//                      nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                               nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//  isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//  불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//오슬라 전사 가차폰 리뉴얼
	int iCumRate = 0; //확률을 누적해놓는 변수
	int itemID = cItem.GetClassId();
	int i=0;
	if (GetLocale().LowerCase()== `taiwan`) //대만 가챠폰 리뉴얼(한국 사용 시 수정 필요)
	{
		int totalRate = 3436;
		int tempRate = 0;
		int itemRate = 0;
		int iRandom = Random(totalRate);	//확률의 총합을 적는다

		while(true)
		{
			tempRate = iCumRate;
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:91165 `; iCumRate += 10;} //0.291036088물결무늬 도넛
				case(1){itemString = `id:91166 `; iCumRate += 10;} //0.291036088무지개 도넛
				case(2){itemString = `id:40352 `; iCumRate += 1;} //0.029103609소프트 아이스 크림 숏소드
				case(3){itemString = `id:40353 `; iCumRate += 1;} //0.029103609폭죽형 활
				case(4){itemString = `id:40354 `; iCumRate += 1;} //0.029103609경단 소드
				case(5){itemString = `id:40355 `; iCumRate += 1;} //0.029103609별사탕 메이스
				case(6){itemString = `id:40356 `; iCumRate += 1;} //0.029103609롤케익 실린더
				case(7){itemString = `id:46028 `; iCumRate += 1;} //0.029103609쿠키 방패
				case(8){itemString = `id:18305 `; iCumRate += 1;} //0.029103609도넛 안경 
				case(9){itemString = `id:40968 col1:ffc5ea col2:60400f0d col3:ffc5ea`; iCumRate += 1;} //0.029103609곰의 봉제인형
				case(10){itemString = `id:40969 col1:ffc5ea col2:60400f0d col3:ffc5ea`; iCumRate += 1;} //0.029103609양산
				case(11){itemString = `id:40970 col1:60400f0d col2:ffc5ea col3:60400f0d`; iCumRate += 1;} //0.029103609먼지떨이
				case(12){itemString = `id:40291 col1:60401e07 col2:141413`; iCumRate += 1;} //0.029103609아이언 크로
				case(13){itemString = `id:40292 col1:60401e07 col2:141413`; iCumRate += 1;} //0.029103609크리스탈 소도
				case(14){itemString = `id:40283 col1:505050 col2:60401e07 col3:d0cdce`; iCumRate += 1;} //0.029103609윙헤룸
				case(15){itemString = `id:14059 `; iCumRate += 2;} //0.058207218명사수의 레더 아모(남성용)
				case(16){itemString = `id:14060 `; iCumRate += 2;} //0.058207218명사수의 레더 아모(여성용)
				case(17){itemString = `id:16064 `; iCumRate += 2;} //0.058207218명사수의 레자간트렛트
				case(18){itemString = `id:17207 `; iCumRate += 2;} //0.058207218명사수의 레더 부츠
				case(19){itemString = `id:18273 `; iCumRate += 2;} //0.058207218명사수의 레더 헬멧
				case(20){itemString = `id:40313 `; iCumRate += 2;} //0.058207218참용검
				case(21){itemString = `id:40981 `; iCumRate += 2;} //0.058207218토끼의 봉제인형
				case(22){itemString = `id:40968 `; iCumRate += 2;} //0.058207218곰의 봉제인형
				case(23){itemString = `id:40969 `; iCumRate += 2;} //0.058207218양산
				case(24){itemString = `id:40970 `; iCumRate += 2;} //0.058207218먼지떨이
				case(25){itemString = `id:40291 `; iCumRate += 2;} //0.058207218아이언 크로
				case(26){itemString = `id:40292 `; iCumRate += 2;} //0.058207218크리스탈 소도
				case(27){itemString = `id:40283 `; iCumRate += 2;} //0.058207218윙헤룸
				case(28){itemString = `id:40248 `; iCumRate += 3;} //0.087310827메타르라이트닝원드
				case(29){itemString = `id:40253 `; iCumRate += 3;} //0.087310827메탈 아이스 wand
				case(30){itemString = `id:40254 `; iCumRate += 3;} //0.087310827쿠에르크스파이아원드
				case(31){itemString = `id:40255 `; iCumRate += 3;} //0.087310827파나시아히르원드
				case(32){itemString = `id:40249 `; iCumRate += 3;} //0.087310827펄-아이스 wand
				case(33){itemString = `id:40250 `; iCumRate += 3;} //0.087310827메탈 파이어 wand
				case(34){itemString = `id:40251 `; iCumRate += 3;} //0.087310827카르피나스히링원드
				case(35){itemString = `id:40252 `; iCumRate += 3;} //0.087310827에미션 파이어 wand
				case(36){itemString = `id:15298 `; iCumRate += 3;} //0.087310827메리 의상(옷)
				case(37){itemString = `id:13050 `; iCumRate += 3;} //0.087310827아이딘 의상(요로이)
				case(38){itemString = `id:16537 `; iCumRate += 3;} //0.087310827아이딘 의상(손)
				case(39){itemString = `id:17119 `; iCumRate += 3;} //0.087310827아이딘 의상(다리)
				case(40){itemString = `id:13051 `; iCumRate += 3;} //0.087310827자이언트 의상(요로이)
				case(41){itemString = `id:16538 `; iCumRate += 3;} //0.087310827자이언트 의상(손)
				case(42){itemString = `id:17527 `; iCumRate += 3;} //0.087310827자이언트 의상(다리)
				case(43){itemString = `id:40171  `; iCumRate += 3;} //0.087310827마사무네
				case(44){itemString = `id:40193  `; iCumRate += 3;} //0.087310827무라마사
				case(45){itemString = `id:40195  `; iCumRate += 3;} //0.087310827요시미츠
				case(46){itemString = `id:40170  `; iCumRate += 3;} //0.087310827장도
				case(47){itemString = `id:40192  `; iCumRate += 3;} //0.087310827치는 것 칼
				case(48){itemString = `id:40194  `; iCumRate += 3;} //0.087310827호신용 단도
				case(49){itemString = `id:13035 prefix:21202`; iCumRate += 3;} //0.087310827"대리석"라이트메르카체메일
				case(50){itemString = `id:40005 prefix:21008`; iCumRate += 3;} //0.087310827"아크 리치"쇼트 소도
				case(51){itemString = `id:40081 suffix:31103`; iCumRate += 3;} //0.087310827"스파이크"레자롱보우
				case(52){itemString = `id:16005 prefix:20825`; iCumRate += 3;} //0.087310827"우드 니들"우드 플레이트 캐논
				case(53){itemString = `id:40095  durability:17000 durability_max:17000`; iCumRate += 3;} //0.087310827드라곤브레이드
				case(54){itemString = `id:40172  durability:18000 durability_max:18000`; iCumRate += 3;} //0.087310827그레이트 소도
				case(55){itemString = `id:40173  durability:16000 durability_max:16000`; iCumRate += 3;} //0.087310827구리-바
				case(56){itemString = `id:40177  durability:19000 durability_max:19000`; iCumRate += 3;} //0.087310827워리아악스
				case(57){itemString = `id:40176  durability:21000 durability_max:21000`; iCumRate += 3;} //0.087310827배틀 해머
				case(58){itemString = `id:40179  durability:22000 durability_max:22000`; iCumRate += 3;} //0.087310827스파이크드낙크루
				case(59){itemString = `id:40180  durability:24000 durability_max:24000`; iCumRate += 3;} //0.087310827호프 네일 너클
				case(60){itemString = `id:14035  durability:17000 durability_max:17000`; iCumRate += 3;} //0.087310827필 소스더-아모
				case(61){itemString = `id:14042  durability:23000 durability_max:23000`; iCumRate += 3;} //0.087310827킬스텐 레더 아모
				case(62){itemString = `id:40003  durability:11000 durability_max:11000`; iCumRate += 3;} //0.087310827쇼트보우
				case(63){itemString = `id:40005  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827쇼트 소도
				case(64){itemString = `id:40006  durability:13000 durability_max:13000`; iCumRate += 3;} //0.087310827단검
				case(65){itemString = `id:40010  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827롱 소도
				case(66){itemString = `id:40011  durability:17000 durability_max:17000`; iCumRate += 3;} //0.087310827브로드 소도
				case(67){itemString = `id:40012  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827사생아 소도
				case(68){itemString = `id:40013  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827롱보우
				case(69){itemString = `id:40014  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827콘포짓트보우
				case(70){itemString = `id:40015  durability:18000 durability_max:18000`; iCumRate += 3;} //0.087310827플룻 쇼트 소도
				case(71){itemString = `id:40016  durability:19000 durability_max:19000`; iCumRate += 3;} //0.087310827해머
				case(72){itemString = `id:40030  durability:17000 durability_max:17000`; iCumRate += 3;} //0.087310827투 핸드 소도
				case(73){itemString = `id:40031  durability:18000 durability_max:18000`; iCumRate += 3;} //0.087310827크로스보우
				case(74){itemString = `id:40033  durability:18000 durability_max:18000`; iCumRate += 3;} //0.087310827클레이 모어
				case(75){itemString = `id:40038  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827라이트닝원드
				case(76){itemString = `id:40039  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827아이스 wand
				case(77){itemString = `id:40040  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827파이어 wand
				case(78){itemString = `id:40041  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827타격용 wand
				case(79){itemString = `id:40078  durability:17000 durability_max:17000`; iCumRate += 3;} //0.087310827비펜니스
				case(80){itemString = `id:40079  durability:19000 durability_max:19000`; iCumRate += 3;} //0.087310827메이스
				case(81){itemString = `id:40080  durability:18000 durability_max:18000`; iCumRate += 3;} //0.087310827그라디우스
				case(82){itemString = `id:40081  durability:16000 durability_max:16000`; iCumRate += 3;} //0.087310827레자롱보우
				case(83){itemString = `id:40083  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827훅 집토끼 라스
				case(84){itemString = `id:40090  durability:15000 durability_max:15000`; iCumRate += 3;} //0.087310827힐링 wand
				case(85){itemString = `id:46001  durability:14000 durability_max:14000`; iCumRate += 3;} //0.087310827라운드 쉴드
				case(86){itemString = `id:46006  durability:20000 durability_max:20000`; iCumRate += 3;} //0.087310827가이토 쉴드
				case(87){itemString = `id:40107  durability:23000 durability_max:23000`; iCumRate += 3;} //0.087310827가디안보우
				case(88){itemString = `id:16524 col1:0000ff suffix:10706`; iCumRate += 3;} //0.087310827"윈도우" 더스틴 실버 나이트 뱀 치우침 의자(레어 칼라)
				case(89){itemString = `id:13032 col1:B63A88 col2:000000 col3:000000 suffix:30901 `; iCumRate += 3;} //0.087310827"다크네스"발렌시아 크로스 라인 플레이트 아모(여성용)
				case(90){itemString = `id:13033 col1:B63A88 col2:000000 col3:000000 suffix:30901 `; iCumRate += 3;} //0.087310827"다크네스"발렌시아 크로스 라인 플레이트 아모(남성용)
				case(91){itemString = `id:40079 prefix:20701 suffix:30702`; iCumRate += 3;} //0.087310827"난폭한 레이브"메이스
				case(92){itemString = `id:46007 col1:685156 col2:685156 col3:ff9aed`; iCumRate += 5;} //0.145518044이질 가이토 쉴드(레어 칼라)
				case(93){itemString = `id:40006 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044단검(레어 칼라)
				case(94){itemString = `id:40010 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044롱 소도(레어 칼라)
				case(95){itemString = `id:40011 col1:ff99e5 col2:ff99e5 col3:ff99e5`; iCumRate += 5;} //0.145518044브로드 소도(레어 칼라)
				case(96){itemString = `id:40013 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044롱보우(레어 칼라)
				case(97){itemString = `id:40015 col1:ff99e5 col2:ff99e5 col3:ff99e5`; iCumRate += 5;} //0.145518044플룻 쇼트 소도(레어 칼라)
				case(98){itemString = `id:40031 col1:ff99e5 col2:ff99e5 col3:ff99e5`; iCumRate += 5;} //0.145518044크로스보우(레어 칼라)
				case(99){itemString = `id:40079 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044메이스(레어 칼라)
				case(100){itemString = `id:40080 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044그라디우스(레어 칼라)
				case(101){itemString = `id:40081 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044레자롱보우(레어 칼라)
				case(102){itemString = `id:40095 col1:beddff col2:8aa1d5 col3:5974ff`; iCumRate += 5;} //0.145518044드라곤브레이드(레어 칼라)
				case(103){itemString = `id:40107 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044가디안보우(레어 칼라)
				case(104){itemString = `id:40172 col1:ff99e5 col2:ff99e5 col3:ff99e5`; iCumRate += 5;} //0.145518044그레이트 소도(레어 칼라)
				case(105){itemString = `id:40173 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044구리-바(레어 칼라)
				case(106){itemString = `id:40176 col1:8aa1d5 col2:8aa1d5 col3:8aa1d5`; iCumRate += 5;} //0.145518044배틀 해머(레어 칼라)
				case(107){itemString = `id:40001 quality:100 col1:b2ffb1 col2:85ff7a`; iCumRate += 5;} //0.145518044나무의 봉(레어 칼라)
				case(108){itemString = `id:13038 col1:28B7D0 col2:383838 col3:e8e8e8`; iCumRate += 5;} //0.145518044더스틴 실버 나이트 아모  (레어 칼라)
				case(109){itemString = `id:18518 col1:248629`; iCumRate += 5;} //0.145518044드래곤 크레 파업(레어 칼라)
				case(110){itemString = `id:14013 col1:ff0000 col2:000000 col3:ffffff`; iCumRate += 5;} //0.145518044로리카세그멘타타에(레어 칼라)
				case(111){itemString = `id:13022 col1:ff8000 col2:ffffa0 col3:000000`; iCumRate += 5;} //0.145518044로즈 플레이트 아모 P타입 (레어 칼라)
				case(112){itemString = `id:13023 col1:ebbe21 col2:ebbe21 col3:000000`; iCumRate += 5;} //0.145518044로즈 플레이트 아모(B타입)(레어 칼라)
				case(113){itemString = `id:13046 col1:ffffff col2:ff80c0 col3:ffffff `; iCumRate += 5;} //0.145518044아릿슈아슈빈아마(여성용)(레어 칼라)
				case(114){itemString = `id:14028 col1:2f8ec8 col2:2f8ec8 col3:ffffff `; iCumRate += 5;} //0.145518044에스테반 메일(남성용)(레어 칼라)
				case(115){itemString = `id:14029 col1:ff80c0 col2:ffffff col3:ffffff `; iCumRate += 5;} //0.145518044에스테반 메일(여성용)(레어 칼라)
				case(116){itemString = `id:62005 prefix:20716`; iCumRate += 10;} //0.291036088엔챤트 스크롤 (주의 깊다)
				case(117){itemString = `id:62005 suffix:31002`; iCumRate += 10;} //0.291036088엔챤트 스크롤 (기사)
				case(118){itemString = `id:62005 suffix:31103`; iCumRate += 10;} //0.291036088엔챤트 스크롤 (스파이크)
				case(119){itemString = `id:62005 prefix:8`; iCumRate += 10;} //0.291036088엔챤트 스크롤 (울프 헌터)
				case(120){itemString = `id:62005 suffix:30501 `; iCumRate += 10;} //0.291036088엔챤트 스크롤 (자이언트)
				case(121){itemString = `id:62005 suffix:30302 `; iCumRate += 10;} //0.291036088엔챤트 스크롤 (코보르트)
				case(122){itemString = `id:62005 suffix:30702 `; iCumRate += 10;} //0.291036088엔챤트 스크롤 (레이분)
				case(123){itemString = `id:62005 prefix:207 `; iCumRate += 10;} //0.291036088엔챤트 스크롤 (폭스)
				case(124){itemString = `id:62005 prefix:7 `; iCumRate += 10;} //0.291036088엔챤트 스크롤 (폭스 헌터)
				case(125){itemString = `id:13035  `; iCumRate += 10;} //0.291036088라이트메르카체메일
				case(126){itemString = `id:13043  `; iCumRate += 10;} //0.291036088레미니아성월의 요로이 (남성용)
				case(127){itemString = `id:13044  `; iCumRate += 10;} //0.291036088레미니아성월의 요로이 (여성용)
				case(128){itemString = `id:13045  `; iCumRate += 10;} //0.291036088아릿슈아슈빈아마(남성용)
				case(129){itemString = `id:13046  `; iCumRate += 10;} //0.291036088아릿슈아슈빈아마(여성용)
				case(130){itemString = `id:13047  `; iCumRate += 10;} //0.291036088키리누스진하후프레이트아마 (남성용)
				case(131){itemString = `id:13048  `; iCumRate += 10;} //0.291036088키리누스진하후프레이트아마 (여성용)
				case(132){itemString = `id:14028 `; iCumRate += 10;} //0.291036088에스테반 메일(남성용)
				case(133){itemString = `id:14029 `; iCumRate += 10;} //0.291036088에스테반 메일(여성용)
				case(134){itemString = `id:14036 `; iCumRate += 10;} //0.291036088티오즈아마(남성용)
				case(135){itemString = `id:14037 `; iCumRate += 10;} //0.291036088티오즈아마(여성용)
				case(136){itemString = `id:14042 `; iCumRate += 10;} //0.291036088킬스텐 레더 아모
				case(137){itemString = `id:16525  `; iCumRate += 10;} //0.291036088아릿슈아슈빈간트렛트
				case(138){itemString = `id:16531 `; iCumRate += 10;} //0.291036088티오즈간트렛트
				case(139){itemString = `id:17518  `; iCumRate += 10;} //0.291036088아릿슈아슈빈브트(남성용)
				case(140){itemString = `id:17519  `; iCumRate += 10;} //0.291036088아릿슈아슈빈브트(여성용)
				case(141){itemString = `id:17523 `; iCumRate += 10;} //0.291036088티오즈그리브
				case(142){itemString = `id:46006  `; iCumRate += 10;} //0.291036088가이토 쉴드
				case(143){itemString = `id:46008  `; iCumRate += 10;} //0.291036088라이트 이질 가이토 쉴드
				case(144){itemString = `id:14004  `; iCumRate += 25;} //0.727590221크로스 메일
				case(145){itemString = `id:14005  `; iCumRate += 25;} //0.727590221드란드스레자메일
				case(146){itemString = `id:14006  `; iCumRate += 25;} //0.727590221리넨크라스
				case(147){itemString = `id:14019  `; iCumRate += 25;} //0.727590221그레이스 플레이트 아모
				case(148){itemString = `id:14023  `; iCumRate += 25;} //0.727590221뼈 해양 아모(남성용)
				case(149){itemString = `id:14024  `; iCumRate += 25;} //0.727590221뼈 해양 아모(여성용)
				case(150){itemString = `id:14035 `; iCumRate += 25;} //0.727590221필 소스더-아모
				case(151){itemString = `id:16000  `; iCumRate += 25;} //0.727590221레더 글로브
				case(152){itemString = `id:16001  `; iCumRate += 25;} //0.727590221퀼팅 글로브
				case(153){itemString = `id:16002  `; iCumRate += 25;} //0.727590221린넨 글로브
				case(154){itemString = `id:16004  `; iCumRate += 25;} //0.727590221스타디드브레스렛트
				case(155){itemString = `id:16008  `; iCumRate += 25;} //0.727590221코레스시후그로브
				case(156){itemString = `id:16015  `; iCumRate += 25;} //0.727590221브레이슬릿
				case(157){itemString = `id:16029  `; iCumRate += 25;} //0.727590221레더 스티치 글로브
				case(158){itemString = `id:16500  `; iCumRate += 25;} //0.727590221우르나프로테크타그로브
				case(159){itemString = `id:16502  `; iCumRate += 25;} //0.727590221프레이트간트렛트
				case(160){itemString = `id:16505  `; iCumRate += 25;} //0.727590221후르트간트렛트
				case(161){itemString = `id:16506  `; iCumRate += 25;} //0.727590221링 글로브
				case(162){itemString = `id:16520  `; iCumRate += 25;} //0.727590221롱 레더 글로브
				case(163){itemString = `id:16523  `; iCumRate += 25;} //0.727590221그레이스간트렛트
				case(164){itemString = `id:17001  `; iCumRate += 25;} //0.727590221가죽의 부츠
				case(165){itemString = `id:17002  `; iCumRate += 25;} //0.727590221검사의 구두
				case(166){itemString = `id:17003  `; iCumRate += 25;} //0.727590221가죽 슈즈
				case(167){itemString = `id:17004  `; iCumRate += 25;} //0.727590221마법 학교의 구두
				case(168){itemString = `id:17005  `; iCumRate += 25;} //0.727590221헌터 부츠
				case(169){itemString = `id:17015 `; iCumRate += 25;} //0.727590221컴배트 슈즈
				case(170){itemString = `id:17016  `; iCumRate += 25;} //0.727590221필드 컴배트 슈즈
				case(171){itemString = `id:17017  `; iCumRate += 25;} //0.727590221피혁제 코트 슈즈
				case(172){itemString = `id:17018  `; iCumRate += 25;} //0.727590221검사의 구두
				case(173){itemString = `id:17019  `; iCumRate += 25;} //0.727590221대장간의 구두
				case(174){itemString = `id:17020  `; iCumRate += 25;} //0.727590221코레스시후슈즈
				case(175){itemString = `id:17021  `; iCumRate += 25;} //0.727590221로리카의 샌들
				case(176){itemString = `id:17064  `; iCumRate += 25;} //0.727590221카메르스피릿트브트
				case(177){itemString = `id:17503  `; iCumRate += 25;} //0.727590221그리브브트
				case(178){itemString = `id:17504  `; iCumRate += 25;} //0.727590221라운드포르린프레이트브트
				case(179){itemString = `id:17505  `; iCumRate += 25;} //0.727590221플레이트 부츠
				case(180){itemString = `id:18500  `; iCumRate += 25;} //0.727590221링헤룸
				case(181){itemString = `id:18501  `; iCumRate += 25;} //0.727590221가디안헤룸
				case(182){itemString = `id:18502  `; iCumRate += 25;} //0.727590221본헤룸
				case(183){itemString = `id:18503  `; iCumRate += 25;} //0.727590221쿠라시아헤룸
				case(184){itemString = `id:18504  `; iCumRate += 25;} //0.727590221크로스후르헤룸
				case(185){itemString = `id:18505  `; iCumRate += 25;} //0.727590221스파이크헤룸
				case(186){itemString = `id:18506  `; iCumRate += 25;} //0.727590221윙하후헤룸
				case(187){itemString = `id:18509  `; iCumRate += 25;} //0.727590221버스 넷
				case(188){itemString = `id:18511  `; iCumRate += 25;} //0.727590221후르트후르헤룸
				case(189){itemString = `id:18513  `; iCumRate += 25;} //0.727590221스파이크 캡
				case(190){itemString = `id:18514  `; iCumRate += 25;} //0.727590221바드페이스캐프
				case(191){itemString = `id:18515  `; iCumRate += 25;} //0.727590221트윈 뼈 캡
				case(192){itemString = `id:18516  `; iCumRate += 25;} //0.727590221이비르다이잉크라운
				case(193){itemString = `id:18517  `; iCumRate += 25;} //0.727590221아이언 마스킹 헤드기어
				case(194){itemString = `id:18518  `; iCumRate += 25;} //0.727590221드래곤 크레 파업
				case(195){itemString = `id:18519  `; iCumRate += 25;} //0.727590221파낫슈프로테크타
				case(196){itemString = `id:18520  `; iCumRate += 25;} //0.727590221스틸 헤드기어
				case(197){itemString = `id:18521  `; iCumRate += 25;} //0.727590221유럽인 무료 초대권
				case(198){itemString = `id:18522  `; iCumRate += 25;} //0.727590221펠리칸 프로텍터
				case(199){itemString = `id:18523  `; iCumRate += 25;} //0.727590221스원윙즈캐프
				case(200){itemString = `id:18524  `; iCumRate += 25;} //0.727590221포윙즈캐프
				case(201){itemString = `id:18525  `; iCumRate += 25;} //0.727590221워터 드롭 캡
				case(202){itemString = `id:18542  `; iCumRate += 25;} //0.727590221빗그체후르헤룸
				case(203){itemString = `id:18543  `; iCumRate += 25;} //0.727590221빗그스릿트후르헤룸
				case(204){itemString = `id:18544  `; iCumRate += 25;} //0.727590221빅 펠리칸 프로텍터
				case(205){itemString = `id:18545  `; iCumRate += 25;} //0.727590221그레이스 헬멧
				case(206){itemString = `id:18546  `; iCumRate += 25;} //0.727590221노르만워리아헤르멧트
				case(207){itemString = `id:18547  `; iCumRate += 25;} //0.727590221빗그파낫슈프로테크타
				case(208){itemString = `id:18551  `; iCumRate += 25;} //0.727590221본마린헤룸
				case(209){itemString = `id:40003  `; iCumRate += 25;} //0.727590221쇼트보우
				case(210){itemString = `id:40005  `; iCumRate += 25;} //0.727590221쇼트 소도
				case(211){itemString = `id:40006  `; iCumRate += 25;} //0.727590221단검
				case(212){itemString = `id:40010  `; iCumRate += 25;} //0.727590221롱 소도
				case(213){itemString = `id:40011  `; iCumRate += 25;} //0.727590221브로드 소도
				case(214){itemString = `id:40012  `; iCumRate += 25;} //0.727590221사생아 소도
				case(215){itemString = `id:40013  `; iCumRate += 25;} //0.727590221롱보우
				case(216){itemString = `id:40014  `; iCumRate += 25;} //0.727590221콘포짓트보우
				case(217){itemString = `id:40015  `; iCumRate += 25;} //0.727590221플룻 쇼트 소도
				case(218){itemString = `id:40016  `; iCumRate += 25;} //0.727590221해머
				case(219){itemString = `id:40030  `; iCumRate += 25;} //0.727590221투 핸드 소도
				case(220){itemString = `id:40031  `; iCumRate += 25;} //0.727590221크로스보우
				case(221){itemString = `id:40033  `; iCumRate += 25;} //0.727590221클레이 모어
				case(222){itemString = `id:40038  `; iCumRate += 25;} //0.727590221라이트닝원드
				case(223){itemString = `id:40039  `; iCumRate += 25;} //0.727590221아이스 wand
				case(224){itemString = `id:40040  `; iCumRate += 25;} //0.727590221파이어 wand
				case(225){itemString = `id:40041  `; iCumRate += 25;} //0.727590221타격용 wand
				case(226){itemString = `id:40078  `; iCumRate += 25;} //0.727590221비펜니스
				case(227){itemString = `id:40079  `; iCumRate += 25;} //0.727590221메이스
				case(228){itemString = `id:40080  `; iCumRate += 25;} //0.727590221그라디우스
				case(229){itemString = `id:40081  `; iCumRate += 25;} //0.727590221레자롱보우
				case(230){itemString = `id:40083  `; iCumRate += 25;} //0.727590221훅 집토끼 라스
				case(231){itemString = `id:40090  `; iCumRate += 25;} //0.727590221힐링 wand
				case(232){itemString = `id:40100  `; iCumRate += 25;} //0.727590221뼈 해양 소도
				case(233){itemString = `id:40172 `; iCumRate += 25;} //0.727590221그레이트 소도
				case(234){itemString = `id:40173 `; iCumRate += 25;} //0.727590221구리-바
				case(235){itemString = `id:40176 `; iCumRate += 25;} //0.727590221배틀 해머
				case(236){itemString = `id:40177 `; iCumRate += 25;} //0.727590221워리아악스
				case(237){itemString = `id:40179 `; iCumRate += 25;} //0.727590221스파이크드낙크루
				case(238){itemString = `id:40180 `; iCumRate += 25;} //0.727590221호프 네일 너클
				case(239){itemString = `id:46001  `; iCumRate += 25;} //0.727590221라운드 쉴드
				case(240){itemString = `id:51031  count:3`; iCumRate += 35;} //1.01862631완전 회복 일부
				case(241){itemString = `id:63027  expire:10080`; iCumRate += 35;} //1.01862631밀랍의 날개
				case(242){itemString = `id:51003  count:5`; iCumRate += 35;} //1.01862631라이프 일부 50
				case(243){itemString = `id:51004  count:3`; iCumRate += 35;} //1.01862631라이프 일부 100
				case(244){itemString = `id:51008  count:5`; iCumRate += 35;} //1.01862631마나포션 50
				case(245){itemString = `id:51013  count:5`; iCumRate += 35;} //1.01862631스태미너 일부 50
				case(246){itemString = `id:51014  count:3`; iCumRate += 35;} //1.01862631스태미너 일부 100
				case(247){itemString = `id:51022  count:5`; iCumRate += 35;} //1.01862631마나라이후 30
				case(248){itemString = `id:51027  count:5`; iCumRate += 35;} //1.01862631스태미너 라이프 30
				case(249){itemString = `id:51028  count:3`; iCumRate += 35;} //1.01862631스태미너 라이프 50
				case(250){itemString = `id:63025  count:3`; iCumRate += 35;} //1.01862631대용량 축복 일부
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
//				if (IsCurrentEvent(`GachaphonSecretShop2008_taiwan`) || (IsEnable(`featureSecretShopTaiwan`) extern (`data/script/features.mint`)))
//				{
//					itemRate = ((iCumRate - tempRate)*10000) / totalRate;
//					DebugOut(`Item Rate : ` + ToString(itemRate));
//					GiveGachaphonCoupon2(player,itemRate) extern (`data/script/event/useitem_event.mint`);
//				}
				return;
			}
			++i;
		}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
	}

	else if (GetLocale().LowerCase()== `japan` || GetLocale().LowerCase()== `korea` && IsDevelopment()) //일본 샤나 아이템 추가 (한국 사용 시 수정 필요)
	{

		// 의상이나 음식 획득
		int randomSetId = 1026;  // 고유 ID.. RandomItemSet.xlsm에 기입
		int itemIndex = GetItemIndexFromRandomSet(randomSetId);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);
	}
	else //그 외 국가
	{
		int iRandom = Random(2760);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:40171 col1:60400f0d col2:ffb5e8 col3:ffc5ea`; iCumRate += 1;} //0.036231884마사무네（레어 컬러）
				case(1){itemString = `id:40193 col1:141413 col2:60401d1f col3:141413`; iCumRate += 1;} //0.036231884무라마사（레어 컬러）
				case(2){itemString = `id:40195 col1:60400f0d col2:ff98dd col3:ffb5e8`; iCumRate += 1;} //0.036231884요시미츠（레어 컬러）
				case(3){itemString = `id:40170 col1:60401e07 col2:141413 col3:e2e0e1`; iCumRate += 1;} //0.036231884일본식 양손검（레어 컬러）
				case(4){itemString = `id:40192 col1:141413 col2:60401e07 col3:e2e0e1`; iCumRate += 1;} //0.036231884일본식 한손검（레어 컬러）
				case(5){itemString = `id:40194 col1:e2e0e1 col2:60401e07 col3:60401e07`; iCumRate += 1;} //0.036231884일본식 단검（레어 컬러）
				case(6){itemString = `id:40968 `; iCumRate += 2;} //0.072463768인형
				case(7){itemString = `id:40969 `; iCumRate += 2;} //0.072463768양산
				case(8){itemString = `id:40291 `; iCumRate += 2;} //0.072463768파일 뱅커
				case(9){itemString = `id:40292 `; iCumRate += 2;} //0.072463768크리스탈 소드
				case(10){itemString = `id:40970 `; iCumRate += 2;} //0.072463768먼지떨이
				case(11){itemString = `id:18580 `; iCumRate += 2;} //0.072463768투구
				case(12){itemString = `id:40255 `; iCumRate += 3;} //0.108695652파나케아
				case(13){itemString = `id:40253 `; iCumRate += 3;} //0.108695652메탈 아이스
				case(14){itemString = `id:40254 `; iCumRate += 3;} //0.108695652퀘르쿠스 파이어
				case(15){itemString = `id:40248 `; iCumRate += 3;} //0.108695652메탈 라이트닝
				case(16){itemString = `id:40251 `; iCumRate += 3;} //0.108695652칼피누스
				case(17){itemString = `id:40249 `; iCumRate += 3;} //0.108695652파르 아이스
				case(18){itemString = `id:40250 `; iCumRate += 3;} //0.108695652메탈 파이어
				case(19){itemString = `id:40252 `; iCumRate += 3;} //0.108695652이미션 라이트닝
				case(20){itemString = `id:15298 `; iCumRate += 3;} //0.108695652아처리스 스쿨웨어
				case(21){itemString = `id:13050 `; iCumRate += 3;} //0.108695652클라우스 나이트 아머
				case(22){itemString = `id:16537 `; iCumRate += 3;} //0.108695652클라우스 나이트 건틀렛
				case(23){itemString = `id:17119 `; iCumRate += 3;} //0.108695652클라우스 나이트 부츠
				case(24){itemString = `id:13051 `; iCumRate += 3;} //0.108695652바실 기믈렛 라이트아머
				case(25){itemString = `id:16538 `; iCumRate += 3;} //0.108695652바실 기믈렛 건틀렛
				case(26){itemString = `id:17527 `; iCumRate += 3;} //0.108695652바실 기믈렛 그리브
				case(27){itemString = `id:13035 prefix:21202`; iCumRate += 2;} //0.072463768대리석 라이트 멜카 체인메일
				case(28){itemString = `id:40005 prefix:21008`; iCumRate += 2;} //0.072463768아크리치 숏소드
				case(29){itemString = `id:40081 suffix:31103`; iCumRate += 2;} //0.072463768스파이크 레더 롱 보우
				case(30){itemString = `id:16005 prefix:20825`; iCumRate += 2;} //0.072463768우든 니들 우드플레이트 캐넌
				case(31){itemString = `id:40095 durability:17000 durability_max:17000`; iCumRate += 2;} //0.072463768드래곤 블레이드
				case(32){itemString = `id:40172 durability:18000 durability_max:18000`; iCumRate += 2;} //0.072463768그레이트 소드
				case(33){itemString = `id:40173 durability:16000 durability_max:16000`; iCumRate += 2;} //0.072463768클레버
				case(34){itemString = `id:40177 durability:19000 durability_max:19000`; iCumRate += 2;} //0.072463768워리어 액스
				case(35){itemString = `id:40176 durability:21000 durability_max:21000`; iCumRate += 2;} //0.072463768배틀 해머
				case(36){itemString = `id:40179 durability:22000 durability_max:22000`; iCumRate += 2;} //0.072463768스파이크드 너클
				case(37){itemString = `id:40180 durability:24000 durability_max:24000`; iCumRate += 2;} //0.072463768홉네일 너클
				case(38){itemString = `id:14035 durability:17000 durability_max:17000`; iCumRate += 2;} //0.072463768피르타 레더 아머
				case(39){itemString = `id:14042 durability:23000 durability_max:23000`; iCumRate += 2;} //0.072463768컬스틴 레더 아머
				case(40){itemString = `id:40003 durability:11000 durability_max:11000`; iCumRate += 2;} //0.072463768숏 보우
				case(41){itemString = `id:40005 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768숏 소드
				case(42){itemString = `id:40006 durability:13000 durability_max:13000`; iCumRate += 2;} //0.072463768단검
				case(43){itemString = `id:40010 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768롱 소드
				case(44){itemString = `id:40011 durability:17000 durability_max:17000`; iCumRate += 2;} //0.072463768브로드 소드
				case(45){itemString = `id:40012 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768바스타드 소드
				case(46){itemString = `id:40013 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768롱 보우
				case(47){itemString = `id:40014 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768콤포짓 보우
				case(48){itemString = `id:40015 durability:18000 durability_max:18000`; iCumRate += 2;} //0.072463768플루트 숏 소드
				case(49){itemString = `id:40016 durability:19000 durability_max:19000`; iCumRate += 2;} //0.072463768해머
				case(50){itemString = `id:40030 durability:17000 durability_max:17000`; iCumRate += 2;} //0.072463768투 핸디드 소드
				case(51){itemString = `id:40031 durability:18000 durability_max:18000`; iCumRate += 2;} //0.072463768석궁
				case(52){itemString = `id:40033 durability:18000 durability_max:18000`; iCumRate += 2;} //0.072463768레이모어
				case(53){itemString = `id:40038 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768라이트닝 원드
				case(54){itemString = `id:40039 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768아이스 원드
				case(55){itemString = `id:40040 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768파이어 원드
				case(56){itemString = `id:40041 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768타격용 원드
				case(57){itemString = `id:40078 durability:17000 durability_max:17000`; iCumRate += 2;} //0.072463768비펜니스
				case(58){itemString = `id:40079 durability:19000 durability_max:19000`; iCumRate += 2;} //0.072463768메이스
				case(59){itemString = `id:40080 durability:18000 durability_max:18000`; iCumRate += 2;} //0.072463768글라디우스
				case(60){itemString = `id:40081 durability:16000 durability_max:16000`; iCumRate += 2;} //0.072463768레더 롱 보우
				case(61){itemString = `id:40083 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768훅 커틀러스
				case(62){itemString = `id:40090 durability:15000 durability_max:15000`; iCumRate += 2;} //0.072463768힐링 원드
				case(63){itemString = `id:46001 durability:14000 durability_max:14000`; iCumRate += 2;} //0.072463768라운드 실드
				case(64){itemString = `id:46006 durability:20000 durability_max:20000`; iCumRate += 2;} //0.072463768카이트 실드
				case(65){itemString = `id:40107 durability:23000 durability_max:23000`; iCumRate += 2;} //0.072463768가디언 보우
				case(66){itemString = `id:40171 `; iCumRate += 2;} //0.072463768마사무네
				case(67){itemString = `id:40193 `; iCumRate += 2;} //0.072463768무라마사
				case(68){itemString = `id:40195 `; iCumRate += 2;} //0.072463768요시미츠
				case(69){itemString = `id:40170 `; iCumRate += 2;} //0.072463768일본식 양손검
				case(70){itemString = `id:40192 `; iCumRate += 2;} //0.072463768일본식 한손검
				case(71){itemString = `id:40194 `; iCumRate += 2;} //0.072463768일본식 단검
				case(72){itemString = `id:16524 col1:0000ff suffix:10706`; iCumRate += 3;} //0.108695652윈드 더스틴 실버 나이트 뱀브레이스（레어컬러） 
				case(73){itemString = `id:13032 col1:B63A88 col2:000000 col3:000000 suffix:30901 `; iCumRate += 3;} //0.108695652다크니스 발렌시아 크로스 라인 플레이트 아머(女性用) 
				case(74){itemString = `id:13033 col1:B63A88 col2:000000 col3:000000 suffix:30901 `; iCumRate += 3;} //0.108695652다크니스 발렌시아 크로스 라인 플레이트 아머(男性用) 
				case(75){itemString = `id:40079 id:40079 prefix:20701 suffix:30702`; iCumRate += 3;} //0.108695652거친 레이븐 메이스
				case(76){itemString = `id:46007 col1:ffffff col2:ffffff col3:1bc3ff`; iCumRate += 5;} //0.18115942헤테로 카이트 실드 (레어컬러）
				case(77){itemString = `id:40006 col1:0092e8 col2:000000 col3:000000`; iCumRate += 5;} //0.18115942단검(레어 컬러)  
				case(78){itemString = `id:40010 col1:ffffff col2:000000 col3:000000`; iCumRate += 5;} //0.18115942롱 소드(레어 컬러) 
				case(79){itemString = `id:40011 col1:a0d5ff col2:6ec3fd col3:45a3d2`; iCumRate += 5;} //0.18115942브로드 소드（레어컬러）
				case(80){itemString = `id:40013 col1:51b5ff col2:ff5411 col3:9df0ff`; iCumRate += 5;} //0.18115942롱 보우（레어컬러）
				case(81){itemString = `id:40015 col1:20eaff col2:208dff col3:208dff`; iCumRate += 5;} //0.18115942플루트 숏 소드（레어컬러）
				case(82){itemString = `id:40031 col1:9df0ff col2:9df0ff col3:9df0ff`; iCumRate += 5;} //0.18115942석궁（레어컬러）
				case(83){itemString = `id:40079 col1:ff45ff col2:ffffff col3:ffffff`; iCumRate += 5;} //0.18115942메이스（레어컬러）
				case(84){itemString = `id:40080 col1:ff6824 col2:11105f col3:11105f`; iCumRate += 5;} //0.18115942글라디우스 (레어 컬러)
				case(85){itemString = `id:40081 col1:a71f20 col2:18456b col3:a71f20`; iCumRate += 5;} //0.18115942레더 롱 보우（레어컬러）
				case(86){itemString = `id:40095 col1:f4f4f5 col2:751212 col3:144312`; iCumRate += 5;} //0.18115942드래곤 블레이드（레어컬러） 
				case(87){itemString = `id:40107 col1:af3017 col2:af3017 col3:af3017`; iCumRate += 5;} //0.18115942가디언 보우（레어컬러）
				case(88){itemString = `id:40172 col1:383938 col2:1f2122 col3:1f2122`; iCumRate += 5;} //0.18115942그레이트 소드（레어컬러）
				case(89){itemString = `id:40173 col1:d40000 col2:ffd5c8 col3:000000`; iCumRate += 5;} //0.18115942클레버（레어컬러）
				case(90){itemString = `id:40176 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 5;} //0.18115942배틀 해머（레어컬러）
				case(91){itemString = `id:40001 quality:100 col1:b2ffb1 col2:85ff7a`; iCumRate += 5;} //0.18115942나무 막대기（레어컬러）
				case(92){itemString = `id:13038 col1:28B7D0 col2:383838 col3:e8e8e8`; iCumRate += 5;} //0.18115942더스틴 실버 나이트 아머 （레어컬러）
				case(93){itemString = `id:18518 col1:248629`; iCumRate += 5;} //0.18115942드레곤 크레스트（레어컬러） 
				case(94){itemString = `id:14013 col1:ff0000 col2:000000 col3:ffffff`; iCumRate += 5;} //0.18115942로리카 세그먼타타에（레어컬러）
				case(95){itemString = `id:13022 col1:ff8000 col2:ffffa0 col3:000000`; iCumRate += 5;} //0.18115942로즈 플레이트 아머 (P타입)（레어컬러）
				case(96){itemString = `id:13023 col1:ebbe21 col2:ebbe21 col3:000000`; iCumRate += 5;} //0.18115942로즈 플레이트 아머 (B타입)（레어컬러）  
				case(97){itemString = `id:13046 col1:ffffff col2:ff80c0 col3:ffffff `; iCumRate += 5;} //0.18115942아리쉬 아슈빈 아머(여성용)（레어컬러） 
				case(98){itemString = `id:14028 col1:2f8ec8 col2:2f8ec8 col3:ffffff `; iCumRate += 5;} //0.18115942에스테반 메일(남성용) (레어컬러）
				case(99){itemString = `id:14029 col1:ff80c0 col2:ffffff col3:ffffff `; iCumRate += 5;} //0.18115942에스테반 메일(여성용) (레어컬러）
				case(100){itemString = `id:62005 prefix:20716`; iCumRate += 10;} //0.362318841인챈트 스크롤 (신중한)
				case(101){itemString = `id:62005 suffix:31002`; iCumRate += 10;} //0.362318841인챈트 스크롤 (기사)
				case(102){itemString = `id:62005 suffix:31103`; iCumRate += 10;} //0.362318841인챈트 스크롤 (스파이크)
				case(103){itemString = `id:62005 prefix:8`; iCumRate += 10;} //0.362318841인챈트 스크롤 (울프헌터)
				case(104){itemString = `id:62005 suffix:30501 `; iCumRate += 10;} //0.362318841인챈트 스크롤 (자이언트) 
				case(105){itemString = `id:62005 suffix:30302 `; iCumRate += 10;} //0.362318841인챈트 스크롤 (코볼트) 
				case(106){itemString = `id:62005 suffix:30702 `; iCumRate += 10;} //0.362318841인챈트 스크롤 (레이븐) 
				case(107){itemString = `id:62005 prefix:207 `; iCumRate += 10;} //0.362318841인챈트 스크롤 (폭스) 
				case(108){itemString = `id:62005 prefix:7 `; iCumRate += 10;} //0.362318841인챈트 스크롤 (폭스헌터) 
				case(109){itemString = `id:13035 `; iCumRate += 10;} //0.362318841라이트 멜카 체인메일
				case(110){itemString = `id:13043 `; iCumRate += 10;} //0.362318841레미니아 성월의 갑옷(남성용)
				case(111){itemString = `id:13044 `; iCumRate += 10;} //0.362318841레미니아 성월의 갑옷(여성용)
				case(112){itemString = `id:13045 `; iCumRate += 10;} //0.362318841아리쉬 아슈빈 아머(남성용)
				case(113){itemString = `id:13046 `; iCumRate += 10;} //0.362318841아리쉬 아슈빈 아머(여성용)
				case(114){itemString = `id:13047 `; iCumRate += 10;} //0.362318841키리누스진 하프 플레이트 아머(남성용))
				case(115){itemString = `id:13048 `; iCumRate += 10;} //0.362318841키리누스진 하프 플레이트 아머(여성용)
				case(116){itemString = `id:14028 `; iCumRate += 10;} //0.362318841에스테반 메일(남성용)
				case(117){itemString = `id:14029 `; iCumRate += 10;} //0.362318841에스테반 메일(여성용)
				case(118){itemString = `id:14036 `; iCumRate += 10;} //0.362318841티오즈 아머(남성용)
				case(119){itemString = `id:14037 `; iCumRate += 10;} //0.362318841티오즈 아머（여성용）
				case(120){itemString = `id:14042 `; iCumRate += 10;} //0.362318841キルステンレザーアーマー 
				case(121){itemString = `id:16525 `; iCumRate += 10;} //0.362318841アリッシュアシュビンガントレット
				case(122){itemString = `id:16531 `; iCumRate += 10;} //0.362318841티오즈 그리브
				case(123){itemString = `id:17518 `; iCumRate += 10;} //0.362318841아리쉬 아슈빈 부츠(남성용)
				case(124){itemString = `id:17519 `; iCumRate += 10;} //0.362318841아리쉬 아슈빈 부츠(여성용)
				case(125){itemString = `id:17523 `; iCumRate += 10;} //0.362318841티오즈 그리브
				case(126){itemString = `id:46006 `; iCumRate += 10;} //0.362318841카이트 실드
				case(127){itemString = `id:46008 `; iCumRate += 10;} //0.362318841라이트 헤테로 카이트 실드
				case(128){itemString = `id:14004 `; iCumRate += 20;} //0.724637681클로스 메일
				case(129){itemString = `id:14005 `; iCumRate += 20;} //0.724637681드란도스 레더메일
				case(130){itemString = `id:14006 `; iCumRate += 20;} //0.724637681리넨 퀴라스
				case(131){itemString = `id:14019 `; iCumRate += 20;} //0.724637681그레이스 플레이트 아머
				case(132){itemString = `id:14023 `; iCumRate += 20;} //0.724637681본 마린 아머(남성용)
				case(133){itemString = `id:14024 `; iCumRate += 20;} //0.724637681본 마린 아머(여성용)
				case(134){itemString = `id:14035 `; iCumRate += 20;} //0.724637681피르타 레더 아머
				case(135){itemString = `id:16000 `; iCumRate += 20;} //0.724637681레더 글러브
				case(136){itemString = `id:16001 `; iCumRate += 20;} //0.724637681퀼팅 글러브
				case(137){itemString = `id:16002 `; iCumRate += 20;} //0.724637681리넨 글러브
				case(138){itemString = `id:16004 `; iCumRate += 20;} //0.724637681스터디드 브레이슬렛
				case(139){itemString = `id:16008 `; iCumRate += 20;} //0.724637681코레스 씨프 글러브
				case(140){itemString = `id:16015 `; iCumRate += 20;} //0.724637681브레이슬렛
				case(141){itemString = `id:16029 `; iCumRate += 20;} //0.724637681レザーステッチグローブ 
				case(142){itemString = `id:16500 `; iCumRate += 20;} //0.724637681울나 프로텍터 글러브
				case(143){itemString = `id:16502 `; iCumRate += 20;} //0.724637681플레이트 건틀렛
				case(144){itemString = `id:16505 `; iCumRate += 20;} //0.724637681플루트 건틀렛
				case(145){itemString = `id:16506 `; iCumRate += 20;} //0.724637681링 글러브
				case(146){itemString = `id:16520 `; iCumRate += 20;} //0.724637681롱 레더 글러브
				case(147){itemString = `id:16523 `; iCumRate += 20;} //0.724637681그레이스 건틀렛
				case(148){itemString = `id:17001 `; iCumRate += 20;} //0.724637681가죽 부츠
				case(149){itemString = `id:17002 `; iCumRate += 20;} //0.724637681검사 신발
				case(150){itemString = `id:17003 `; iCumRate += 20;} //0.724637681가죽 신발
				case(151){itemString = `id:17004 `; iCumRate += 20;} //0.724637681마법 학교 신발
				case(152){itemString = `id:17005 `; iCumRate += 20;} //0.724637681사냥꾼 신발
				case(153){itemString = `id:17015 `; iCumRate += 20;} //0.724637681필드 컴뱃슈즈
				case(154){itemString = `id:17016 `; iCumRate += 20;} //0.724637681필드 컴뱃슈즈
				case(155){itemString = `id:17017 `; iCumRate += 20;} //0.724637681레더코트 슈즈
				case(156){itemString = `id:17018 `; iCumRate += 20;} //0.724637681검사 신발
				case(157){itemString = `id:17019 `; iCumRate += 20;} //0.724637681대장장이 신발
				case(158){itemString = `id:17020 `; iCumRate += 20;} //0.724637681씨프 슈즈
				case(159){itemString = `id:17021 `; iCumRate += 20;} //0.724637681로리카 샌들
				case(160){itemString = `id:17064 `; iCumRate += 20;} //0.724637681카멜 스피리트 부츠
				case(161){itemString = `id:17503 `; iCumRate += 20;} //0.724637681그리브 부츠
				case(162){itemString = `id:17504 `; iCumRate += 20;} //0.724637681라운드폴린 플레이트 부츠
				case(163){itemString = `id:17505 `; iCumRate += 20;} //0.724637681플레이트 부츠
				case(164){itemString = `id:18500 `; iCumRate += 20;} //0.724637681링 메일 헬름
				case(165){itemString = `id:18501 `; iCumRate += 20;} //0.724637681가디언 헬름
				case(166){itemString = `id:18502 `; iCumRate += 20;} //0.724637681본 헬름
				case(167){itemString = `id:18503 `; iCumRate += 20;} //0.724637681퀴러시어 헬름
				case(168){itemString = `id:18504 `; iCumRate += 20;} //0.724637681크로스 풀 헬름
				case(169){itemString = `id:18505 `; iCumRate += 20;} //0.724637681스파이크 헬름
				case(170){itemString = `id:18506 `; iCumRate += 20;} //0.724637681윙 하프 헬름
				case(171){itemString = `id:18509 `; iCumRate += 20;} //0.724637681배서닛
				case(172){itemString = `id:18511 `; iCumRate += 20;} //0.724637681플루트 풀 헬름
				case(173){itemString = `id:18513 `; iCumRate += 20;} //0.724637681스파이크 캡
				case(174){itemString = `id:18514 `; iCumRate += 20;} //0.724637681버디페이스 캡
				case(175){itemString = `id:18515 `; iCumRate += 20;} //0.724637681트윈 혼 캡
				case(176){itemString = `id:18516 `; iCumRate += 20;} //0.724637681이블 다잉 크라운
				case(177){itemString = `id:18517 `; iCumRate += 20;} //0.724637681아이언 마스킹 헤드기어
				case(178){itemString = `id:18518 `; iCumRate += 20;} //0.724637681드래곤 크레스트 
				case(179){itemString = `id:18519 `; iCumRate += 20;} //0.724637681파나쉬 헤드 프로텍터
				case(180){itemString = `id:18520 `; iCumRate += 20;} //0.724637681스틸 헤드기어
				case(181){itemString = `id:18521 `; iCumRate += 20;} //0.724637681유러피안 컴프
				case(182){itemString = `id:18522 `; iCumRate += 20;} //0.724637681펠리칸 프로텍터
				case(183){itemString = `id:18523 `; iCumRate += 20;} //0.724637681스완 윙즈 캡
				case(184){itemString = `id:18524 `; iCumRate += 20;} //0.724637681포 윙즈 캡
				case(185){itemString = `id:18525 `; iCumRate += 20;} //0.724637681워터드롭 캡
				case(186){itemString = `id:18542 `; iCumRate += 20;} //0.724637681빅 체인 풀 헬름
				case(187){itemString = `id:18543 `; iCumRate += 20;} //0.724637681빅 슬릿 풀 헬름
				case(188){itemString = `id:18544 `; iCumRate += 20;} //0.724637681빅 펠리칸 프로텍터
				case(189){itemString = `id:18545 `; iCumRate += 20;} //0.724637681그레이스 헬멧
				case(190){itemString = `id:18546 `; iCumRate += 20;} //0.724637681노르만 워리어 헬멧
				case(191){itemString = `id:18547 `; iCumRate += 20;} //0.724637681빅 파나쉬 헤드 프로텍터
				case(192){itemString = `id:18551 `; iCumRate += 20;} //0.724637681본 마린 헬름
				case(193){itemString = `id:40003 `; iCumRate += 20;} //0.724637681숏 보우
				case(194){itemString = `id:40005 `; iCumRate += 20;} //0.724637681숏 소드
				case(195){itemString = `id:40006 `; iCumRate += 20;} //0.724637681단검
				case(196){itemString = `id:40010 `; iCumRate += 20;} //0.724637681롱 소드
				case(197){itemString = `id:40011 `; iCumRate += 20;} //0.724637681브로드 소드
				case(198){itemString = `id:40012 `; iCumRate += 20;} //0.724637681바스타드 소드
				case(199){itemString = `id:40013 `; iCumRate += 20;} //0.724637681롱 보우
				case(200){itemString = `id:40014 `; iCumRate += 20;} //0.724637681콤포짓 보우
				case(201){itemString = `id:40015 `; iCumRate += 20;} //0.724637681플루트 숏 소드
				case(202){itemString = `id:40016 `; iCumRate += 20;} //0.724637681해머
				case(203){itemString = `id:40030 `; iCumRate += 20;} //0.724637681투 핸디드 소드
				case(204){itemString = `id:40031 `; iCumRate += 20;} //0.724637681석궁
				case(205){itemString = `id:40033 `; iCumRate += 20;} //0.724637681레이모어
				case(206){itemString = `id:40038 `; iCumRate += 20;} //0.724637681라이트닝 원드
				case(207){itemString = `id:40039 `; iCumRate += 20;} //0.724637681아이스 원드
				case(208){itemString = `id:40040 `; iCumRate += 20;} //0.724637681파이어 원드
				case(209){itemString = `id:40041 `; iCumRate += 20;} //0.724637681타격용 원드
				case(210){itemString = `id:40078 `; iCumRate += 20;} //0.724637681비펜니스
				case(211){itemString = `id:40079 `; iCumRate += 20;} //0.724637681메이스
				case(212){itemString = `id:40080 `; iCumRate += 20;} //0.724637681글라디우스
				case(213){itemString = `id:40081 `; iCumRate += 20;} //0.724637681레더 롱 보우
				case(214){itemString = `id:40083 `; iCumRate += 20;} //0.724637681훅 커틀러스
				case(215){itemString = `id:40090 `; iCumRate += 20;} //0.724637681힐링 원드
				case(216){itemString = `id:40100 `; iCumRate += 20;} //0.724637681본 마린 소드
				case(217){itemString = `id:40172 `; iCumRate += 20;} //0.724637681그레이트 소드
				case(218){itemString = `id:40173 `; iCumRate += 20;} //0.724637681클레버
				case(219){itemString = `id:40176 `; iCumRate += 20;} //0.724637681배틀 해머
				case(220){itemString = `id:40177 `; iCumRate += 20;} //0.724637681워리어 액스
				case(221){itemString = `id:40179 `; iCumRate += 20;} //0.724637681스파이크드 너클
				case(222){itemString = `id:40180 `; iCumRate += 20;} //0.724637681홉네일 너클
				case(223){itemString = `id:46001 `; iCumRate += 20;} //0.724637681라운드 실드
				case(224){itemString = `id:51031 count:3`; iCumRate += 25;} //0.905797101완전 회복의 포션
				case(225){itemString = `id:63027 expire:10080`; iCumRate += 25;} //0.905797101밀랍 날개
				case(226){itemString = `id:51003 count:5`; iCumRate += 25;} //0.905797101생명력 포션50
				case(227){itemString = `id:51004 count:3`; iCumRate += 25;} //0.905797101생명력 포션100
				case(228){itemString = `id:51008 count:5`; iCumRate += 25;} //0.905797101마나 포션50
				case(229){itemString = `id:51013 count:5`; iCumRate += 25;} //0.905797101스태미나 포션50
				case(230){itemString = `id:51014 count:3`; iCumRate += 25;} //0.905797101스태미나 포션100
				case(231){itemString = `id:51022 count:5`; iCumRate += 25;} //0.905797101생명력과 마나 포션30
				case(232){itemString = `id:51027 count:5`; iCumRate += 25;} //0.905797101생명력과 스태미나30
				case(233){itemString = `id:51028 count:3`; iCumRate += 25;} //0.905797101생명력과 스태미나50
				case(234){itemString = `id:63025 count:3`; iCumRate += 25;} //0.905797101대용량 축복의 포션
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
}
