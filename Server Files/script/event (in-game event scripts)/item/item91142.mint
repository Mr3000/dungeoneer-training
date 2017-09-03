//////////////////////////////////////////////////////////////////////////////////
// Mabinogi Project : Use Item Script
// 아이템 사용시의 이벤트 함수
//
// nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
// nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
// isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
// 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2746);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:40255  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 파나케아
			case(1){itemString = `id:40253  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 메탈 아이스
			case(2){itemString = `id:40254  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 퀘르쿠스 파이어
			case(3){itemString = `id:40251  col1:000000 col2:0E00B0 col3:000000`; iCumRate += 3;} //0.1092498179 칼피누스
			case(4){itemString = `id:40249  col1:000000 col2:0E00B0 col3:000000`; iCumRate += 3;} //0.1092498179 파르 아이스
			case(5){itemString = `id:40250  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 메탈 파이어
			case(6){itemString = `id:40252  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 이미션 라이트닝
			case(7){itemString = `id:15298  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 아처리스 스쿨웨어
			case(8){itemString = `id:16537  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 클라우스 나이트 건틀렛
			case(9){itemString = `id:17119  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 클라우스 나이트 부츠
			case(10){itemString = `id:13051  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 바실 기믈렛 라이트아머
			case(11){itemString = `id:16538  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 바실 기믈렛 건틀렛
			case(12){itemString = `id:17527  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 바실 기믈렛 그리브
			case(13){itemString = `id:13035 prefix:21202 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 대리석 라이트 멜카 체인메일
			case(14){itemString = `id:40005 prefix:21008 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 아크리치 숏소드
			case(15){itemString = `id:40081 suffix:31103 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 스파이크 레더 롱 보우
			case(16){itemString = `id:16005 prefix:20825 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 우든 니들 우드플레이트 캐넌
			case(17){itemString = `id:40095 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 드래곤 블레이드
			case(18){itemString = `id:40172 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 그레이트 소드
			case(19){itemString = `id:40173 durability:16000 durability_max:16000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 클레버
			case(20){itemString = `id:40177 durability:19000 durability_max:19000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 워리어 액스
			case(21){itemString = `id:40176 durability:21000 durability_max:21000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 배틀 해머
			case(22){itemString = `id:40179 durability:22000 durability_max:22000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 스파이크드 너클
			case(23){itemString = `id:40180 durability:24000 durability_max:24000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 홉네일 너클
			case(24){itemString = `id:14035 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 피르타 레더 아머
			case(25){itemString = `id:14042 durability:23000 durability_max:23000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 컬스틴 레더 아머
			case(26){itemString = `id:40003 durability:11000 durability_max:11000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 숏 보우
			case(27){itemString = `id:40005 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 숏 소드
			case(28){itemString = `id:40006 durability:13000 durability_max:13000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 단검
			case(29){itemString = `id:40010 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 롱 소드
			case(30){itemString = `id:40011 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 브로드 소드
			case(31){itemString = `id:40012 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 바스타드 소드
			case(32){itemString = `id:40013 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 롱 보우
			case(33){itemString = `id:40014 durability:15000 durability_max:15000 col1:000040 col2:000000`; iCumRate += 2;} //0.0728332119 콤포짓 보우
			case(34){itemString = `id:40015 durability:18000 durability_max:18000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 플루트 숏 소드
			case(35){itemString = `id:40016 durability:19000 durability_max:19000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 해머
			case(36){itemString = `id:40030 durability:17000 durability_max:17000 col1:000000`; iCumRate += 2;} //0.0728332119 투 핸디드 소드
			case(37){itemString = `id:40031 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 석궁
			case(38){itemString = `id:40033 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 레이모어
			case(39){itemString = `id:40038 durability:15000 durability_max:15000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 라이트닝 원드
			case(40){itemString = `id:40039 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 아이스 원드
			case(41){itemString = `id:40040 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 파이어 원드
			case(42){itemString = `id:40041 durability:15000 durability_max:15000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 타격용 원드
			case(43){itemString = `id:40078 durability:17000 durability_max:17000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 비펜니스
			case(44){itemString = `id:40079 durability:19000 durability_max:19000 col1:0E00B0 col2:000000`; iCumRate += 2;} //0.0728332119 메이스
			case(45){itemString = `id:40080 durability:18000 durability_max:18000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 글라디우스
			case(46){itemString = `id:40081 durability:16000 durability_max:16000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 레더 롱 보우
			case(47){itemString = `id:40083 durability:15000 durability_max:15000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 훅 커틀러스
			case(48){itemString = `id:40090 durability:15000 durability_max:15000 col1:ff80c0 col2:ff80c0 col3:ffffff`; iCumRate += 2;} //0.0728332119 힐링 원드
			case(49){itemString = `id:46001 durability:14000 durability_max:14000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 라운드 실드
			case(50){itemString = `id:46006 durability:20000 durability_max:20000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 카이트 실드
			case(51){itemString = `id:40107 durability:23000 durability_max:23000 col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 가디언 보우
			case(52){itemString = `id:40171  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 마사무네
			case(53){itemString = `id:40193  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 무라마사
			case(54){itemString = `id:40195  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 2;} //0.0728332119 요시미츠
			case(55){itemString = `id:40170  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 일본식 양손검
			case(56){itemString = `id:40192  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 일본식 한손검
			case(57){itemString = `id:40194  col1:0E00B0 col2:370000 col3:000000`; iCumRate += 3;} //0.1092498179 일본식 단검
			case(58){itemString = `id:16524 col1:0000ff suffix:10706 `; iCumRate += 3;} //0.1092498179 윈드 더스틴 실버 나이트 뱀브레이스（레어컬러）  
			case(59){itemString = `id:13032 col1:B63A88 col2:000000 col3:000000 suffix:30901  `; iCumRate += 3;} //0.1092498179 다크니스 발렌시아 크로스 라인 플레이트 아머(女性用) 
			case(60){itemString = `id:13033 col1:B63A88 col2:000000 col3:000000 suffix:30901  `; iCumRate += 3;} //0.1092498179 다크니스 발렌시아 크로스 라인 플레이트 아머(男性用) 
			case(61){itemString = `id:40079 prefix:20701 suffix:30702 `; iCumRate += 3;} //0.1092498179 거친 레이븐 메이스
			case(62){itemString = `id:46007 col1:9999FF col2:CCCCFF col3:3333CC `; iCumRate += 5;} //0.1820830299 헤테로 카이트 실드 (레어컬러）
			case(63){itemString = `id:40006 col1:0092e8 col2:000000 col3:000000 `; iCumRate += 5;} //0.1820830299 단검(레어 컬러)    
			case(64){itemString = `id:40010 col1:ffffff col2:000000 col3:000000 `; iCumRate += 5;} //0.1820830299 롱 소드(레어 컬러)  
			case(65){itemString = `id:40011 col1:e37def col2:9c12c9 col3:9c12c9 `; iCumRate += 5;} //0.1820830299 브로드 소드（레어컬러）
			case(66){itemString = `id:40013 col1:51b5ff col2:ff5411 col3:9df0ff `; iCumRate += 5;} //0.1820830299 롱 보우（레어컬러）
			case(67){itemString = `id:40015 col1:20eaff col2:208dff col3:208dff `; iCumRate += 5;} //0.1820830299 플루트 숏 소드（레어컬러）
			case(68){itemString = `id:40031 col1:9df0ff col2:9df0ff col3:9df0ff `; iCumRate += 5;} //0.1820830299 석궁（레어컬러）
			case(69){itemString = `id:40079 col1:ff45ff col2:ffffff col3:ffffff `; iCumRate += 5;} //0.1820830299 메이스（레어컬러）
			case(70){itemString = `id:40080 col1:793ed4 col2:2e2e2f col3:2e2e2f `; iCumRate += 5;} //0.1820830299 글라디우스 (레어 컬러)
			case(71){itemString = `id:40081 col1:121110 col2:aa7dff col3:121110 `; iCumRate += 5;} //0.1820830299 레더 롱 보우（레어컬러）
			case(72){itemString = `id:40095 col1:9999FF col2:3333CC col3:FF99FF `; iCumRate += 5;} //0.1820830299 드래곤 블레이드（레어컬러）  
			case(73){itemString = `id:40107 col1:af3017 col2:af3017 col3:af3017 `; iCumRate += 5;} //0.1820830299 가디언 보우（레어컬러）
			case(74){itemString = `id:40172 col1:383938 col2:1f2122 col3:1f2122 `; iCumRate += 5;} //0.1820830299 그레이트 소드（레어컬러）
			case(75){itemString = `id:40173 col1:d40000 col2:ffd5c8 col3:000000 `; iCumRate += 5;} //0.1820830299 클레버（레어컬러）
			case(76){itemString = `id:40176 col1:ffffff col2:ffffff col3:ffffff `; iCumRate += 5;} //0.1820830299 배틀 해머（레어컬러）
			case(77){itemString = `id:40001 quality:100 col1:b2ffb1 col2:85ff7a `; iCumRate += 5;} //0.1820830299 나무 막대기（레어컬러）
			case(78){itemString = `id:13038 col1:28B7D0 col2:383838 col3:e8e8e8 `; iCumRate += 5;} //0.1820830299 더스틴 실버 나이트 아머  （레어컬러）
			case(79){itemString = `id:18518 col1:248629 `; iCumRate += 5;} //0.1820830299 드레곤 크레스트（레어컬러）  
			case(80){itemString = `id:14013 col1:ff0000 col2:000000 col3:ffffff `; iCumRate += 5;} //0.1820830299 로리카 세그먼타타에（레어컬러）
			case(81){itemString = `id:13022 col1:ff8000 col2:ffffa0 col3:000000 `; iCumRate += 5;} //0.1820830299 로즈 플레이트 아머 (P타입)（레어컬러）
			case(82){itemString = `id:13023 col1:ebbe21 col2:ebbe21 col3:000000 `; iCumRate += 5;} //0.1820830299 로즈 플레이트 아머 (B타입)（레어컬러）    
			case(83){itemString = `id:13046 col1:ffffff col2:ff80c0 col3:ffffff  `; iCumRate += 5;} //0.1820830299 아리쉬 아슈빈 아머(여성용)（레어컬러）  
			case(84){itemString = `id:14028 col1:2f8ec8 col2:2f8ec8 col3:ffffff  `; iCumRate += 5;} //0.1820830299 에스테반 메일(남성용) (레어컬러）
			case(85){itemString = `id:14029 col1:ff80c0 col2:ffffff col3:ffffff  `; iCumRate += 5;} //0.1820830299 에스테반 메일(여성용) (레어컬러）
			case(86){itemString = `id:62005 prefix:20716 `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (신중한)
			case(87){itemString = `id:62005 suffix:31002 `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (기사)
			case(88){itemString = `id:62005 suffix:31103 `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (스파이크)
			case(89){itemString = `id:62005 prefix:8 `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (울프헌터)
			case(90){itemString = `id:62005 suffix:30501  `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (자이언트) 
			case(91){itemString = `id:62005 suffix:30302  `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (코볼트) 
			case(92){itemString = `id:62005 suffix:30702  `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (레이븐) 
			case(93){itemString = `id:62005 prefix:207  `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (폭스) 
			case(94){itemString = `id:62005 prefix:7  `; iCumRate += 10;} //0.3641660597 인챈트 스크롤 (폭스헌터) 
			case(95){itemString = `id:13035   `; iCumRate += 10;} //0.3641660597 라이트 멜카 체인메일
			case(96){itemString = `id:13043   `; iCumRate += 10;} //0.3641660597 레미니아 성월의 갑옷(남성용)
			case(97){itemString = `id:13044   `; iCumRate += 10;} //0.3641660597 레미니아 성월의 갑옷(여성용)
			case(98){itemString = `id:13045   `; iCumRate += 10;} //0.3641660597 아리쉬 아슈빈 아머(남성용)
			case(99){itemString = `id:13046   `; iCumRate += 10;} //0.3641660597 아리쉬 아슈빈 아머(여성용)
			case(100){itemString = `id:13047   `; iCumRate += 10;} //0.3641660597 키리누스진 하프 플레이트 아머(남성용))
			case(101){itemString = `id:13048   `; iCumRate += 10;} //0.3641660597 키리누스진 하프 플레이트 아머(여성용)
			case(102){itemString = `id:14028  `; iCumRate += 10;} //0.3641660597 에스테반 메일(남성용)
			case(103){itemString = `id:14029  `; iCumRate += 10;} //0.3641660597 에스테반 메일(여성용)
			case(104){itemString = `id:14036  `; iCumRate += 10;} //0.3641660597 티오즈 아머(남성용)
			case(105){itemString = `id:14037  `; iCumRate += 10;} //0.3641660597 티오즈 아머（여성용）
			case(106){itemString = `id:14042  `; iCumRate += 10;} //0.3641660597 キルステンレザ?ア?マ? 
			case(107){itemString = `id:16525   `; iCumRate += 10;} //0.3641660597 アリッシュアシュビンガントレット
			case(108){itemString = `id:16531  `; iCumRate += 10;} //0.3641660597 티오즈 그리브
			case(109){itemString = `id:17518   `; iCumRate += 10;} //0.3641660597 아리쉬 아슈빈 부츠(남성용)
			case(110){itemString = `id:17519   `; iCumRate += 10;} //0.3641660597 아리쉬 아슈빈 부츠(여성용)
			case(111){itemString = `id:17523  `; iCumRate += 10;} //0.3641660597 티오즈 그리브
			case(112){itemString = `id:46006   `; iCumRate += 10;} //0.3641660597 카이트 실드
			case(113){itemString = `id:46008   `; iCumRate += 10;} //0.3641660597 라이트 헤테로 카이트 실드
			case(114){itemString = `id:91188  `; iCumRate += 10;} //0.3641660597 메탈 라이트닝 원드 수리 키트
			case(115){itemString = `id:14004   `; iCumRate += 20;} //0.7283321194 클로스 메일
			case(116){itemString = `id:14005   `; iCumRate += 20;} //0.7283321194 드란도스 레더메일
			case(117){itemString = `id:14006   `; iCumRate += 20;} //0.7283321194 리넨 퀴라스
			case(118){itemString = `id:14019   `; iCumRate += 20;} //0.7283321194 그레이스 플레이트 아머
			case(119){itemString = `id:14023   `; iCumRate += 20;} //0.7283321194 본 마린 아머(남성용)
			case(120){itemString = `id:14024   `; iCumRate += 20;} //0.7283321194 본 마린 아머(여성용)
			case(121){itemString = `id:14035  `; iCumRate += 20;} //0.7283321194 피르타 레더 아머
			case(122){itemString = `id:16000   `; iCumRate += 20;} //0.7283321194 레더 글러브
			case(123){itemString = `id:16001   `; iCumRate += 20;} //0.7283321194 퀼팅 글러브
			case(124){itemString = `id:16002   `; iCumRate += 20;} //0.7283321194 리넨 글러브
			case(125){itemString = `id:16004   `; iCumRate += 20;} //0.7283321194 스터디드 브레이슬렛
			case(126){itemString = `id:16008   `; iCumRate += 20;} //0.7283321194 코레스 씨프 글러브
			case(127){itemString = `id:16015   `; iCumRate += 20;} //0.7283321194 브레이슬렛
			case(128){itemString = `id:16029   `; iCumRate += 20;} //0.7283321194 レザ?ステッチグロ?ブ  
			case(129){itemString = `id:16500   `; iCumRate += 20;} //0.7283321194 울나 프로텍터 글러브
			case(130){itemString = `id:16502   `; iCumRate += 20;} //0.7283321194 플레이트 건틀렛
			case(131){itemString = `id:16505   `; iCumRate += 20;} //0.7283321194 플루트 건틀렛
			case(132){itemString = `id:16506   `; iCumRate += 20;} //0.7283321194 링 글러브
			case(133){itemString = `id:16520   `; iCumRate += 20;} //0.7283321194 롱 레더 글러브
			case(134){itemString = `id:16523   `; iCumRate += 20;} //0.7283321194 그레이스 건틀렛
			case(135){itemString = `id:17001   `; iCumRate += 20;} //0.7283321194 가죽 부츠
			case(136){itemString = `id:17002   `; iCumRate += 20;} //0.7283321194 검사 신발
			case(137){itemString = `id:17003   `; iCumRate += 20;} //0.7283321194 가죽 신발
			case(138){itemString = `id:17004   `; iCumRate += 20;} //0.7283321194 마법 학교 신발
			case(139){itemString = `id:17005   `; iCumRate += 20;} //0.7283321194 사냥꾼 신발
			case(140){itemString = `id:17015  `; iCumRate += 20;} //0.7283321194 필드 컴뱃슈즈
			case(141){itemString = `id:17016   `; iCumRate += 20;} //0.7283321194 필드 컴뱃슈즈
			case(142){itemString = `id:17017   `; iCumRate += 20;} //0.7283321194 레더코트 슈즈
			case(143){itemString = `id:17018   `; iCumRate += 20;} //0.7283321194 검사 신발
			case(144){itemString = `id:17019   `; iCumRate += 20;} //0.7283321194 대장장이 신발
			case(145){itemString = `id:17020   `; iCumRate += 20;} //0.7283321194 씨프 슈즈
			case(146){itemString = `id:17021   `; iCumRate += 20;} //0.7283321194 로리카 샌들
			case(147){itemString = `id:17064   `; iCumRate += 20;} //0.7283321194 카멜 스피리트 부츠
			case(148){itemString = `id:17503   `; iCumRate += 20;} //0.7283321194 그리브 부츠
			case(149){itemString = `id:17504   `; iCumRate += 20;} //0.7283321194 라운드폴린 플레이트 부츠
			case(150){itemString = `id:17505   `; iCumRate += 20;} //0.7283321194 플레이트 부츠
			case(151){itemString = `id:18500   `; iCumRate += 20;} //0.7283321194 링 메일 헬름
			case(152){itemString = `id:18501   `; iCumRate += 20;} //0.7283321194 가디언 헬름
			case(153){itemString = `id:18502   `; iCumRate += 20;} //0.7283321194 본 헬름
			case(154){itemString = `id:18503   `; iCumRate += 20;} //0.7283321194 퀴러시어 헬름
			case(155){itemString = `id:18504   `; iCumRate += 20;} //0.7283321194 크로스 풀 헬름
			case(156){itemString = `id:18505   `; iCumRate += 20;} //0.7283321194 스파이크 헬름
			case(157){itemString = `id:18506   `; iCumRate += 20;} //0.7283321194 윙 하프 헬름
			case(158){itemString = `id:18509   `; iCumRate += 20;} //0.7283321194 배서닛
			case(159){itemString = `id:18511   `; iCumRate += 20;} //0.7283321194 플루트 풀 헬름
			case(160){itemString = `id:18513   `; iCumRate += 20;} //0.7283321194 스파이크 캡
			case(161){itemString = `id:18514   `; iCumRate += 20;} //0.7283321194 버디페이스 캡
			case(162){itemString = `id:18515   `; iCumRate += 20;} //0.7283321194 트윈 혼 캡
			case(163){itemString = `id:18516   `; iCumRate += 20;} //0.7283321194 이블 다잉 크라운
			case(164){itemString = `id:18517   `; iCumRate += 20;} //0.7283321194 아이언 마스킹 헤드기어
			case(165){itemString = `id:18518   `; iCumRate += 20;} //0.7283321194 드래곤 크레스트  
			case(166){itemString = `id:18519   `; iCumRate += 20;} //0.7283321194 파나쉬 헤드 프로텍터
			case(167){itemString = `id:18520   `; iCumRate += 20;} //0.7283321194 스틸 헤드기어
			case(168){itemString = `id:18521   `; iCumRate += 20;} //0.7283321194 유러피안 컴프
			case(169){itemString = `id:18522   `; iCumRate += 20;} //0.7283321194 펠리칸 프로텍터
			case(170){itemString = `id:18523   `; iCumRate += 20;} //0.7283321194 스완 윙즈 캡
			case(171){itemString = `id:18524   `; iCumRate += 20;} //0.7283321194 포 윙즈 캡
			case(172){itemString = `id:18525   `; iCumRate += 20;} //0.7283321194 워터드롭 캡
			case(173){itemString = `id:18542   `; iCumRate += 20;} //0.7283321194 빅 체인 풀 헬름
			case(174){itemString = `id:18543   `; iCumRate += 20;} //0.7283321194 빅 슬릿 풀 헬름
			case(175){itemString = `id:18544   `; iCumRate += 20;} //0.7283321194 빅 펠리칸 프로텍터
			case(176){itemString = `id:18545   `; iCumRate += 20;} //0.7283321194 그레이스 헬멧
			case(177){itemString = `id:18546   `; iCumRate += 20;} //0.7283321194 노르만 워리어 헬멧
			case(178){itemString = `id:18547   `; iCumRate += 20;} //0.7283321194 빅 파나쉬 헤드 프로텍터
			case(179){itemString = `id:18551   `; iCumRate += 20;} //0.7283321194 본 마린 헬름
			case(180){itemString = `id:40003   `; iCumRate += 20;} //0.7283321194 숏 보우
			case(181){itemString = `id:40005   `; iCumRate += 20;} //0.7283321194 숏 소드
			case(182){itemString = `id:40006   `; iCumRate += 20;} //0.7283321194 단검
			case(183){itemString = `id:40010   `; iCumRate += 20;} //0.7283321194 롱 소드
			case(184){itemString = `id:40011   `; iCumRate += 20;} //0.7283321194 브로드 소드
			case(185){itemString = `id:40012   `; iCumRate += 20;} //0.7283321194 바스타드 소드
			case(186){itemString = `id:40013   `; iCumRate += 20;} //0.7283321194 롱 보우
			case(187){itemString = `id:40014   `; iCumRate += 20;} //0.7283321194 콤포짓 보우
			case(188){itemString = `id:40015   `; iCumRate += 20;} //0.7283321194 플루트 숏 소드
			case(189){itemString = `id:40016   `; iCumRate += 20;} //0.7283321194 해머
			case(190){itemString = `id:40030   `; iCumRate += 20;} //0.7283321194 투 핸디드 소드
			case(191){itemString = `id:40031   `; iCumRate += 20;} //0.7283321194 석궁
			case(192){itemString = `id:40033   `; iCumRate += 20;} //0.7283321194 레이모어
			case(193){itemString = `id:40038   `; iCumRate += 20;} //0.7283321194 라이트닝 원드
			case(194){itemString = `id:40039   `; iCumRate += 20;} //0.7283321194 아이스 원드
			case(195){itemString = `id:40040   `; iCumRate += 20;} //0.7283321194 파이어 원드
			case(196){itemString = `id:40041   `; iCumRate += 20;} //0.7283321194 타격용 원드
			case(197){itemString = `id:40078   `; iCumRate += 20;} //0.7283321194 비펜니스
			case(198){itemString = `id:40079   `; iCumRate += 20;} //0.7283321194 메이스
			case(199){itemString = `id:40080   `; iCumRate += 20;} //0.7283321194 글라디우스
			case(200){itemString = `id:40081   `; iCumRate += 20;} //0.7283321194 레더 롱 보우
			case(201){itemString = `id:40083   `; iCumRate += 20;} //0.7283321194 훅 커틀러스
			case(202){itemString = `id:40090   `; iCumRate += 20;} //0.7283321194 힐링 원드
			case(203){itemString = `id:40100   `; iCumRate += 20;} //0.7283321194 본 마린 소드
			case(204){itemString = `id:40172  `; iCumRate += 20;} //0.7283321194 그레이트 소드
			case(205){itemString = `id:40173  `; iCumRate += 20;} //0.7283321194 클레버
			case(206){itemString = `id:40176  `; iCumRate += 20;} //0.7283321194 배틀 해머
			case(207){itemString = `id:40177  `; iCumRate += 20;} //0.7283321194 워리어 액스
			case(208){itemString = `id:40179  `; iCumRate += 20;} //0.7283321194 스파이크드 너클
			case(209){itemString = `id:40180  `; iCumRate += 20;} //0.7283321194 홉네일 너클
			case(210){itemString = `id:46001   `; iCumRate += 20;} //0.7283321194 라운드 실드
			case(211){itemString = `id:51031  count:3 `; iCumRate += 25;} //0.9104151493 완전 회복의 포션
			case(212){itemString = `id:63027  expire:10080 `; iCumRate += 25;} //0.9104151493 밀랍 날개
			case(213){itemString = `id:51003  count:5 `; iCumRate += 25;} //0.9104151493 생명력 포션50
			case(214){itemString = `id:51004  count:3 `; iCumRate += 25;} //0.9104151493 생명력 포션100
			case(215){itemString = `id:51008  count:5 `; iCumRate += 25;} //0.9104151493 마나 포션50
			case(216){itemString = `id:51013  count:5 `; iCumRate += 25;} //0.9104151493 스태미나 포션50
			case(217){itemString = `id:51014  count:3 `; iCumRate += 25;} //0.9104151493 스태미나 포션100
			case(218){itemString = `id:51022  count:5 `; iCumRate += 25;} //0.9104151493 생명력과 마나 포션30
			case(219){itemString = `id:51027  count:5 `; iCumRate += 25;} //0.9104151493 생명력과 스태미나30
			case(220){itemString = `id:51028  count:3 `; iCumRate += 25;} //0.9104151493 생명력과 스태미나50
			case(221){itemString = `id:63025  count:3 `; iCumRate += 25;} //0.9104151493 대용량 축복의 포션
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
