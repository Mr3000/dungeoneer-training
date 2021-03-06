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
	//미국 생산 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(5285);	//확률의 총합을 적는다
	meta_array itemArray;
	bool bCashGachaphonGived = false;
	int itemID = cItem.GetClassId();

	int jRandom = Random(3);		

	if (!player.IsRiding())
	{
		switch(jRandom)
		// 가챠폰 까는 모션 출력
		{
			case(0)
			{
				player.SetMotionType(14, 15, false); // mcStand, motionStandFriendly01, not loop
			}
			case(1)
			{
				player.SetMotionType(14, 16, false); // mcStand, motionStandFriendly01, not loop
			}
			case(2)
			{
				player.SetMotionType(14, 17, false); // mcStand, motionStandFriendly01, not loop
			}
		}
	}

	while(true)
	{
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){iCumRate += 1;} //0.018921476볼레로 앤 점퍼 스커트  (옷본)
			case(1){iCumRate += 1;} //0.018921476마사무네  (도면)
			case(2){iCumRate += 1;} //0.018921476에이프런 원피스  (옷본)
			case(3){iCumRate += 1;} //0.018921476그레이스 숄 드레스(여성용)  (옷본)
			case(4){iCumRate += 1;} //0.018921476무라마사  (도면)
			case(5){iCumRate += 1;} //0.018921476요시미츠  (도면)
			case(6){iCumRate += 1;} //0.018921476엘레건트 고딕 드레스 (롱)  (옷본)
			case(7){iCumRate += 1;} //0.018921476엘레건트 고딕 드레스 (숏) (옷본)
			case(8){iCumRate += 1;} //0.018921476엘레건트 고딕 슈트  (옷본)
			case(9){iCumRate += 1;} //0.018921476메이드 의상 (숏) (옷본)
			case(10){iCumRate += 1;} //0.018921476메이드 의상 (롱)  (옷본)
			case(11){iCumRate += 1;} //0.018921476집사 의상  (옷본)
			case(12){iCumRate += 1;} //0.018921476메이드 머리띠  (옷본)
			case(13){iCumRate += 1;} //0.018921476테라 고딕 풀 드레스  (옷본)
			case(14){iCumRate += 1;} //0.018921476테라 고딕 펑크 수트  (옷본)
			case(15){iCumRate += 1;} //0.018921476고양이 손 장갑  (옷본)
			case(16){iCumRate += 1;} //0.018921476커다란 리본  (옷본)
			case(17){iCumRate += 1;} //0.018921476안대  (옷본)
			case(18){iCumRate += 1;} //0.018921476카우보이 모자  (옷본)
			case(19){iCumRate += 1;} //0.018921476클라우스 나이트 아머  (도면)
			case(20){iCumRate += 1;} //0.018921476바실 기믈렛 아머  (도면)
			case(21){iCumRate += 1;} //0.018921476아처리스 스쿨웨어  (옷본)
			case(22){iCumRate += 1;} //0.018921476클라우스 나이트 건틀렛  (도면)
			case(23){iCumRate += 1;} //0.018921476바실 기믈렛 건틀렛  (도면)
			case(24){iCumRate += 1;} //0.018921476클라우스 나이트 부츠  (도면)
			case(25){iCumRate += 1;} //0.018921476바실 기믈렛 그리브  (도면)
			case(26){iCumRate += 1;} //0.018921476보니타 실키 드레스  (옷본)
			case(27){iCumRate += 1;} //0.018921476트루디 빈티지 웨어  (옷본)
			case(28){iCumRate += 1;} //0.018921476보니타 실키 글러브  (옷본)
			case(29){iCumRate += 1;} //0.018921476트루디 포버튼 글러브  (옷본)
			case(30){iCumRate += 1;} //0.018921476보니타 플룸 앵클 부츠  (옷본)
			case(31){iCumRate += 1;} //0.018921476트루디 슈즈  (옷본)
			case(32){iCumRate += 1;} //0.018921476보니타 트윈 리본  (옷본)
			case(33){iCumRate += 1;} //0.018921476트루디 빈티지 터번  (옷본)
			case(34){iCumRate += 1;} //0.018921476비앙카 윙 볼레로  (옷본)
			case(35){iCumRate += 1;} //0.018921476아스틴 댄디 수트  (옷본)
			case(36){iCumRate += 1;} //0.018921476비앙카 롱 글러브  (옷본)
			case(37){iCumRate += 1;} //0.018921476아스틴 글러브 (옷본)
			case(38){iCumRate += 1;} //0.018921476비앙카 리본 부츠  (옷본)
			case(39){iCumRate += 1;} //0.018921476아스틴 슈즈  (옷본)
			case(40){iCumRate += 1;} //0.018921476비앙카 캡  (옷본)
			case(41){iCumRate += 1;} //0.018921476아스틴 캡 (옷본)
			case(42){iCumRate += 2;} //0.037842952일본식 양손검（도면）
			case(43){iCumRate += 2;} //0.037842952일본식 한손검（도면）
			case(44){iCumRate += 3;} //0.056764428스켈레톤 호루라기
			case(45){iCumRate += 3;} //0.056764428티오즈 아머(남성용) (레어컬러)
			case(46){iCumRate += 3;} //0.056764428티오즈 아머(여성용) (레어컬러)
			case(47){iCumRate += 3;} //0.056764428티오즈 아머(남성용) (레어컬러)
			case(48){iCumRate += 3;} //0.056764428티오즈 아머(여성용) (레어컬러)
			case(49){iCumRate += 4;} //0.075685904최고급 옷감
			case(50){iCumRate += 4;} //0.075685904최고급 가죽
			case(51){iCumRate += 4;} //0.075685904최고급 실크
			case(52){iCumRate += 4;} //0.075685904굵은 실뭉치
			case(53){iCumRate += 4;} //0.075685904가는 실뭉치
			case(54){iCumRate += 4;} //0.075685904금괴
			case(55){iCumRate += 4;} //0.075685904은괴
			case(56){iCumRate += 4;} //0.075685904동괴
			case(57){iCumRate += 4;} //0.075685904철괴
			case(58){iCumRate += 4;} //0.075685904최고급 가죽
			case(59){iCumRate += 4;} //0.075685904최고급 실크
			case(60){iCumRate += 4;} //0.075685904최고급 옷감
			case(61){iCumRate += 4;} //0.075685904미스릴괴
			case(62){iCumRate += 4;} //0.075685904금광석
			case(63){iCumRate += 4;} //0.075685904은광석
			case(64){iCumRate += 4;} //0.075685904철광석
			case(65){iCumRate += 4;} //0.075685904동광석
			case(66){iCumRate += 4;} //0.075685904양털 주머니（양털 20개 ）
			case(67){iCumRate += 8;} //0.151371807토크 여자 요리사옷
			case(68){iCumRate += 8;} //0.151371807토크 남자 요리사옷
			case(69){iCumRate += 8;} //0.151371807엘라 베스트 스커트
			case(70){iCumRate += 8;} //0.151371807양털주머니（레어컬러）
			case(71){iCumRate += 8;} //0.151371807여성용 검사학교 교복 쇼트타입
			case(72){iCumRate += 8;} //0.151371807견습 요리사 모자
			case(73){iCumRate += 8;} //0.151371807수련 요리사 모자
			case(74){iCumRate += 8;} //0.151371807엘라 베스트 스커트（옷본）
			case(75){iCumRate += 8;} //0.151371807검사학교 교복 롱타입
			case(76){iCumRate += 8;} //0.151371807더스틴 실버 나이트 아머
			case(77){iCumRate += 8;} //0.151371807검사학교 교복 쇼트타입 (옷본)
			case(78){iCumRate += 8;} //0.151371807붉은색 염색 앰플
			case(79){iCumRate += 8;} //0.151371807검은색 염색 앰플
			case(80){iCumRate += 8;} //0.151371807브로드 소드（레어컬러）
			case(81){iCumRate += 20;} //0.378429518최고급 옷감
			case(82){iCumRate += 20;} //0.378429518최고급 가죽
			case(83){iCumRate += 20;} //0.378429518최고급 실크
			case(84){iCumRate += 20;} //0.378429518최고급 가죽끈
			case(85){iCumRate += 20;} //0.378429518최고급 마감용 실
			case(86){iCumRate += 20;} //0.378429518미스릴괴
			case(87){iCumRate += 20;} //0.378429518금괴
			case(88){iCumRate += 20;} //0.378429518은괴
			case(89){iCumRate += 20;} //0.378429518물안개 비단
			case(90){iCumRate += 20;} //0.378429518마법 금 실
			case(91){iCumRate += 20;} //0.378429518마법 은 실
			case(92){iCumRate += 20;} //0.378429518반지(인챈트가 붙은）
			case(93){iCumRate += 20;} //0.378429518데브캣 브로치(인챈트가 붙은）
			case(94){iCumRate += 20;} //0.378429518드래곤 블레이드（레어 컬러）
			case(95){iCumRate += 20;} //0.378429518동괴
			case(96){iCumRate += 20;} //0.378429518철괴
			case(97){iCumRate += 20;} //0.378429518나타네 설산용 코트（옷본）
			case(98){iCumRate += 20;} //0.378429518위스 보위군 부츠(남성용) (옷본)
			case(99){iCumRate += 20;} //0.378429518위스 보위군 모자 (옷본)
			case(100){iCumRate += 20;} //0.378429518위스 보위군 의복(남성용) (옷본)
			case(101){iCumRate += 20;} //0.378429518위스 보위군 의복(여성용) (옷본)
			case(102){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트 글러브（옷본）
			case(103){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트 캡（옷본）
			case(104){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트(남성용)（옷본）
			case(105){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트(여성용)（옷본）
			case(106){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트 부츠(남성용)（옷본）
			case(107){iCumRate += 20;} //0.378429518산드라 스나이퍼 수트 부츠(여성용)）（옷본）
			case(108){iCumRate += 20;} //0.378429518헤테로 카이트 실드 (도면)
			case(109){iCumRate += 20;} //0.378429518샤오롱주엔 예복정장(남성용) (옷본)
			case(110){iCumRate += 20;} //0.378429518샤오롱주엔 예복정장(여성용) (옷본)
			case(111){iCumRate += 20;} //0.378429518키린 겨울 천사의 장갑 (옷본)
			case(112){iCumRate += 20;} //0.378429518키린 겨울 천사의 모자 (옷본)
			case(113){iCumRate += 20;} //0.378429518키린 겨울 천사의 부츠 (옷본)
			case(114){iCumRate += 20;} //0.378429518본 마린 아머(남성용)
			case(115){iCumRate += 20;} //0.378429518본 마린 아머(여성용)
			case(116){iCumRate += 20;} //0.378429518글라디우스(레어컬러)
			case(117){iCumRate += 20;} //0.378429518샤오롱주엔 예복정장(여성용) (옷본)
			case(118){iCumRate += 20;} //0.378429518샤오롱주엔 예복정장(남성용) (옷본)
			case(119){iCumRate += 20;} //0.378429518키린 겨울 천사의 코트(남성용) (옷본)
			case(120){iCumRate += 20;} //0.378429518키린 겨울 천사의 코트(여성용) (옷본)
			case(121){iCumRate += 20;} //0.378429518투 핸디드 소드(레어컬러)
			case(122){iCumRate += 20;} //0.378429518메이스(레어컬러)
			case(123){iCumRate += 20;} //0.378429518엘라 스트랩 부츠
			case(124){iCumRate += 20;} //0.378429518스완 윙즈 캡
			case(125){iCumRate += 20;} //0.378429518훅 커틀러스
			case(126){iCumRate += 20;} //0.378429518지정 색상 염색 앰플
			case(127){iCumRate += 20;} //0.378429518본 마린 아머(남성용) (옷본)
			case(128){iCumRate += 20;} //0.378429518본 마린 아머(여성용) (옷본)
			case(129){iCumRate += 20;} //0.378429518코레스 큐트 리본 슈즈
			case(130){iCumRate += 20;} //0.378429518드래곤 크레스트
			case(131){iCumRate += 20;} //0.378429518세이렌 고양이 가면
			case(132){iCumRate += 20;} //0.378429518세이렌 깃털 가면
			case(133){iCumRate += 20;} //0.378429518세이렌의 안경
			case(134){iCumRate += 20;} //0.378429518세이렌 작은 날개 가면
			case(135){iCumRate += 20;} //0.378429518세이렌 날개 가면
			case(136){iCumRate += 20;} //0.378429518세이렌 박쥐 날개 가면
			case(137){iCumRate += 20;} //0.378429518세이렌의 가면
			case(138){iCumRate += 20;} //0.378429518유러피안 컴프
			case(139){iCumRate += 20;} //0.378429518워터드롭 캡
			case(140){iCumRate += 20;} //0.378429518플루트 풀 헬름
			case(141){iCumRate += 20;} //0.378429518윙 하프 헬름
			case(142){iCumRate += 20;} //0.378429518플레이트 부츠
			case(143){iCumRate += 20;} //0.378429518플루트 건틀렛
			case(144){iCumRate += 20;} //0.378429518그레이스 플레이트 아머
			case(145){iCumRate += 20;} //0.378429518아리쉬 아슈빈 아머(남성용)
			case(146){iCumRate += 20;} //0.378429518검사학교 교복 롱타입(옷본)
			case(147){iCumRate += 20;} //0.378429518빅 체인 풀 헬름
			case(148){iCumRate += 20;} //0.378429518카멜 스피리트 부츠
			case(149){iCumRate += 20;} //0.378429518더스틴 실버 나이트 뱀브레이스(도면)
			case(150){iCumRate += 20;} //0.378429518아리쉬 아슈빈 아머(여성용)
			case(151){iCumRate += 20;} //0.378429518빅 슬릿 풀 헬름
			case(152){iCumRate += 20;} //0.378429518빅 펠리칸 프로텍터
			case(153){iCumRate += 20;} //0.378429518빅 파나쉬 헤드 프로텍터
			case(154){iCumRate += 20;} //0.378429518그레이스 건틀렛
			case(155){iCumRate += 20;} //0.378429518레미니아 성월의 갑옷(남성용)（도면）
			case(156){iCumRate += 20;} //0.378429518레미니아 성월의 갑옷(여성용)（도면）
			case(157){iCumRate += 20;} //0.378429518셀리나 섹시 베어룩（옷본）
			case(158){iCumRate += 20;} //0.378429518셀리나 레이디 드레스（옷본）
			case(159){iCumRate += 40;} //0.756859035미스릴광석
			case(160){iCumRate += 40;} //0.756859035최고급 옷감
			case(161){iCumRate += 40;} //0.756859035최고급 가죽
			case(162){iCumRate += 40;} //0.756859035최고급 실크
			case(163){iCumRate += 40;} //0.756859035최고급 가죽끈
			case(164){iCumRate += 40;} //0.756859035최고급 마감용 실
			case(165){iCumRate += 40;} //0.756859035물안개 비단
			case(166){iCumRate += 40;} //0.756859035마법 금 실
			case(167){iCumRate += 40;} //0.756859035마법 은 실
			case(168){iCumRate += 40;} //0.756859035금광석
			case(169){iCumRate += 40;} //0.756859035은광석
			case(170){iCumRate += 40;} //0.756859035고급 옷감
			case(171){iCumRate += 40;} //0.756859035고급 가죽
			case(172){iCumRate += 40;} //0.756859035고급 실크
			case(173){iCumRate += 40;} //0.756859035고급 가죽끈
			case(174){iCumRate += 40;} //0.756859035고급 마감용 실
			case(175){iCumRate += 40;} //0.756859035늑대 로브
			case(176){iCumRate += 40;} //0.756859035곰 로브
			case(177){iCumRate += 40;} //0.756859035본 마린 소드
			case(178){iCumRate += 40;} //0.756859035바스타드 소드(레어컬러)
			case(179){iCumRate += 40;} //0.756859035보급형 실크방직 장갑
			case(180){iCumRate += 40;} //0.756859035일반 실크방직 장갑
			case(181){iCumRate += 40;} //0.756859035전문가용 실크방직 장갑
			case(182){iCumRate += 40;} //0.756859035최고급 실크방직 장갑
			case(183){iCumRate += 40;} //0.756859035고급 실크방직 장갑
			case(184){iCumRate += 40;} //0.756859035최고급 옷감방직 장갑
			case(185){iCumRate += 40;} //0.756859035고급 옷감방직 장갑
			case(186){iCumRate += 40;} //0.756859035코코 래빗 로브
			case(187){iCumRate += 40;} //0.756859035나타네 설산용 코트
			case(188){iCumRate += 40;} //0.756859035롱 소드
			case(189){iCumRate += 40;} //0.756859035퀴러시어 헬름(도면)
			case(190){iCumRate += 40;} //0.756859035완전 회복의 포션
			case(191){iCumRate += 40;} //0.756859035염색 앰플
			case(192){iCumRate += 40;} //0.756859035라운드 실드(도면)
			case(193){iCumRate += 40;} //0.756859035채집용 도끼(레어컬러)
			case(194){iCumRate += 40;} //0.756859035채집용 단검(레어컬러)
			case(195){iCumRate += 40;} //0.756859035대장장이 망치(레어컬러)
			case(196){iCumRate += 40;} //0.756859035곡괭이(레어컬러)
			case(197){iCumRate += 40;} //0.756859035식칼(레어컬러)
			case(198){iCumRate += 40;} //0.756859035낫(레어컬러)
			case(199){iCumRate += 40;} //0.756859035호미(레어컬러)
			case(200){iCumRate += 40;} //0.756859035낚싯대(레어컬러)
			case(201){iCumRate += 40;} //0.756859035반죽용 밀대(레어컬러)
			case(202){iCumRate += 40;} //0.756859035다용도 국자 (레어컬러)
			case(203){iCumRate += 40;} //0.756859035냄비(레어컬러)
			case(204){iCumRate += 40;} //0.756859035간이 테이블(레어컬러)
			case(205){iCumRate += 40;} //0.756859035롱 소드(도면)
			case(206){iCumRate += 40;} //0.756859035축복포션
			case(207){iCumRate += 40;} //0.756859035원격 힐러집 이용권
			case(208){iCumRate += 40;} //0.756859035양털 주머니
			case(209){iCumRate += 40;} //0.756859035호미(도면)
			case(210){iCumRate += 40;} //0.756859035캠프파이어 키트
			case(211){iCumRate += 40;} //0.756859035대용량 축복의 포션
			case(212){iCumRate += 40;} //0.756859035스태미나 50 포션
			case(213){iCumRate += 40;} //0.756859035단검(도면)
			case(214){iCumRate += 40;} //0.756859035곡괭이(도면)
			case(215){iCumRate += 40;} //0.756859035생명력과 마나 30 포션
			case(216){iCumRate += 40;} //0.756859035생명력과 스태미나 30 포션
			case(217){iCumRate += 40;} //0.756859035생명력과 스태미나 50 포션
			case(218){iCumRate += 40;} //0.756859035생명력과 스태미나 100 포션
			case(219){iCumRate += 40;} //0.756859035사샤 로브(옷본)
			case(220){iCumRate += 40;} //0.756859035코레스 힐러드레스(옷본)
			case(221){iCumRate += 40;} //0.756859035마법학교 교복(남성용)(옷본)
			case(222){iCumRate += 40;} //0.756859035마법학교 교복(여성용)(옷본)
			case(223){iCumRate += 40;} //0.756859035코레스 힐러 글러브(옷본)
			case(224){iCumRate += 40;} //0.756859035몬거 모자(옷본)
			case(225){iCumRate += 40;} //0.756859035숏 소드(도면)
			case(226){iCumRate += 40;} //0.756859035스파이크 캡(도면)
			case(227){iCumRate += 40;} //0.756859035머리띠(옷본)
			case(228){iCumRate += 80;} //1.51371807철광석
			case(229){iCumRate += 80;} //1.51371807동광석
			case(230){iCumRate += 80;} //1.51371807일반 실크
			case(231){iCumRate += 80;} //1.51371807일반 마감용 실
			case(232){iCumRate += 80;} //1.51371807일반 옷감
			case(233){iCumRate += 80;} //1.51371807일반 가죽
			case(234){iCumRate += 80;} //1.51371807일반 가죽끈
			case(235){iCumRate += 80;} //1.51371807굵은 실뭉치
			case(236){iCumRate += 80;} //1.51371807가는 실뭉치

		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `manual:225 `;itemArray.Add(itemString);} //볼레로 앤 점퍼 스커트  (옷본)
				case(1){itemString = `manual:20205 `;itemArray.Add(itemString);} //마사무네  (도면)
				case(2){itemString = `manual:226 `;itemArray.Add(itemString);} //에이프런 원피스  (옷본)
				case(3){itemString = `manual:227 `;itemArray.Add(itemString);} //그레이스 숄 드레스(여성용)  (옷본)
				case(4){itemString = `manual:20206 `;itemArray.Add(itemString);} //무라마사  (도면)
				case(5){itemString = `manual:20207 `;itemArray.Add(itemString);} //요시미츠  (도면)
				case(6){itemString = `manual:228 `;itemArray.Add(itemString);} //엘레건트 고딕 드레스 (롱)  (옷본)
				case(7){itemString = `manual:229 `;itemArray.Add(itemString);} //엘레건트 고딕 드레스 (숏) (옷본)
				case(8){itemString = `manual:230 `;itemArray.Add(itemString);} //엘레건트 고딕 슈트  (옷본)
				case(9){itemString = `manual:231 `;itemArray.Add(itemString);} //메이드 의상 (숏) (옷본)
				case(10){itemString = `manual:232 `;itemArray.Add(itemString);} //메이드 의상 (롱)  (옷본)
				case(11){itemString = `manual:233 `;itemArray.Add(itemString);} //집사 의상  (옷본)
				case(12){itemString = `manual:234 `;itemArray.Add(itemString);} //메이드 머리띠  (옷본)
				case(13){itemString = `manual:235 `;itemArray.Add(itemString);} //테라 고딕 풀 드레스  (옷본)
				case(14){itemString = `manual:236 `;itemArray.Add(itemString);} //테라 고딕 펑크 수트  (옷본)
				case(15){itemString = `manual:237 `;itemArray.Add(itemString);} //고양이 손 장갑  (옷본)
				case(16){itemString = `manual:238 `;itemArray.Add(itemString);} //커다란 리본  (옷본)
				case(17){itemString = `manual:239 `;itemArray.Add(itemString);} //안대  (옷본)
				case(18){itemString = `manual:240 `;itemArray.Add(itemString);} //카우보이 모자  (옷본)
				case(19){itemString = `manual:20208 `;itemArray.Add(itemString);} //클라우스 나이트 아머  (도면)
				case(20){itemString = `manual:20209 `;itemArray.Add(itemString);} //바실 기믈렛 아머  (도면)
				case(21){itemString = `manual:241 `;itemArray.Add(itemString);} //아처리스 스쿨웨어  (옷본)
				case(22){itemString = `manual:20210 `;itemArray.Add(itemString);} //클라우스 나이트 건틀렛  (도면)
				case(23){itemString = `manual:20211 `;itemArray.Add(itemString);} //바실 기믈렛 건틀렛  (도면)
				case(24){itemString = `manual:20212 `;itemArray.Add(itemString);} //클라우스 나이트 부츠  (도면)
				case(25){itemString = `manual:20213 `;itemArray.Add(itemString);} //바실 기믈렛 그리브  (도면)
				case(26){itemString = `manual:242 `;itemArray.Add(itemString);} //보니타 실키 드레스  (옷본)
				case(27){itemString = `manual:243 `;itemArray.Add(itemString);} //트루디 빈티지 웨어  (옷본)
				case(28){itemString = `manual:244 `;itemArray.Add(itemString);} //보니타 실키 글러브  (옷본)
				case(29){itemString = `manual:245 `;itemArray.Add(itemString);} //트루디 포버튼 글러브  (옷본)
				case(30){itemString = `manual:246 `;itemArray.Add(itemString);} //보니타 플룸 앵클 부츠  (옷본)
				case(31){itemString = `manual:247 `;itemArray.Add(itemString);} //트루디 슈즈  (옷본)
				case(32){itemString = `manual:248 `;itemArray.Add(itemString);} //보니타 트윈 리본  (옷본)
				case(33){itemString = `manual:249 `;itemArray.Add(itemString);} //트루디 빈티지 터번  (옷본)
				case(34){itemString = `manual:250 `;itemArray.Add(itemString);} //비앙카 윙 볼레로  (옷본)
				case(35){itemString = `manual:251 `;itemArray.Add(itemString);} //아스틴 댄디 수트  (옷본)
				case(36){itemString = `manual:252 `;itemArray.Add(itemString);} //비앙카 롱 글러브  (옷본)
				case(37){itemString = `manual:253 `;itemArray.Add(itemString);} //아스틴 글러브 (옷본)
				case(38){itemString = `manual:254 `;itemArray.Add(itemString);} //비앙카 리본 부츠  (옷본)
				case(39){itemString = `manual:255`;itemArray.Add(itemString);} //아스틴 슈즈  (옷본)
				case(40){itemString = `manual:256 `;itemArray.Add(itemString);} //비앙카 캡  (옷본)
				case(41){itemString = `manual:257 `;itemArray.Add(itemString);} //아스틴 캡 (옷본)
				case(42){itemString = `manual:20177 `;itemArray.Add(itemString);} //일본식 양손검（도면）
				case(43){itemString = `manual:20188 `;itemArray.Add(itemString);} //일본식 한손검（도면）
				case(44){itemString = `id:91193 `;itemArray.Add(itemString);} //스켈레톤 호루라기
				case(45){itemString = `id:14036 col1:004400 col2:009900`;itemArray.Add(itemString);} //티오즈 아머(남성용) (레어컬러)
				case(46){itemString = `id:14037 col1:004400 col2:009900`;itemArray.Add(itemString);} //티오즈 아머(여성용) (레어컬러)
				case(47){itemString = `id:14036 col1:ffffff col2:990000`;itemArray.Add(itemString);} //티오즈 아머(남성용) (레어컬러)
				case(48){itemString = `id:14037 col1:ffffff col2:990000`;itemArray.Add(itemString);} //티오즈 아머(여성용) (레어컬러)
				case(49){itemString = `id:60022 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 옷감
				case(50){itemString = `id:60026 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 가죽
				case(51){itemString = `id:60014 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 실크
				case(52){itemString = `id:60006 count:5`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //굵은 실뭉치
				case(53){itemString = `id:60007 count:5`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //가는 실뭉치
				case(54){itemString = `id:64007 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //금괴
				case(55){itemString = `id:64005 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //은괴
				case(56){itemString = `id:64003 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //동괴
				case(57){itemString = `id:64001 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //철괴
				case(58){itemString = `id:60025 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 가죽
				case(59){itemString = `id:60013 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 실크
				case(60){itemString = `id:60021 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 옷감
				case(61){itemString = `id:64010 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //미스릴괴
				case(62){itemString = `id:64008 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //금광석
				case(63){itemString = `id:64006 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //은광석
				case(64){itemString = `id:64002 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //철광석
				case(65){itemString = `id:64004 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //동광석
				case(66){itemString = `id:2028 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //양털 주머니（양털 20개 ）
				case(67){itemString = `id:15076 `;itemArray.Add(itemString);} //토크 여자 요리사옷
				case(68){itemString = `id:15077 `;itemArray.Add(itemString);} //토크 남자 요리사옷
				case(69){itemString = `id:15065 `;itemArray.Add(itemString);} //엘라 베스트 스커트
				case(70){itemString = `id:2028 col1:8f50eee9`;itemArray.Add(itemString);} //양털주머니（레어컬러）
				case(71){itemString = `id:15113 `;itemArray.Add(itemString);} //여성용 검사학교 교복 쇼트타입
				case(72){itemString = `id:18053 `;itemArray.Add(itemString);} //견습 요리사 모자
				case(73){itemString = `id:18054 `;itemArray.Add(itemString);} //수련 요리사 모자
				case(74){itemString = `manual:125 `;itemArray.Add(itemString);} //엘라 베스트 스커트（옷본）
				case(75){itemString = `id:15114 `;itemArray.Add(itemString);} //검사학교 교복 롱타입
				case(76){itemString = `id:13038 `;itemArray.Add(itemString);} //더스틴 실버 나이트 아머
				case(77){itemString = `manual:143 `;itemArray.Add(itemString);} //검사학교 교복 쇼트타입 (옷본)
				case(78){itemString = `id:63034 col1:c00000`;itemArray.Add(itemString);} //붉은색 염색 앰플
				case(79){itemString = `id:63033 col1:000000`;itemArray.Add(itemString);} //검은색 염색 앰플
				case(80){itemString = `id:40011 col1:61002c57`;itemArray.Add(itemString);} //브로드 소드（레어컬러）
				case(81){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //최고급 옷감
				case(82){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //최고급 가죽
				case(83){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //최고급 실크
				case(84){itemString = `id:60030 count:10`;itemArray.Add(itemString);} //최고급 가죽끈
				case(85){itemString = `id:60018 count:10`;itemArray.Add(itemString);} //최고급 마감용 실
				case(86){itemString = `id:64009 count:10`;itemArray.Add(itemString);} //미스릴괴
				case(87){itemString = `id:64007 count:10`;itemArray.Add(itemString);} //금괴
				case(88){itemString = `id:64005 count:10`;itemArray.Add(itemString);} //은괴
				case(89){itemString = `id:60041 count:10`;itemArray.Add(itemString);} //물안개 비단
				case(90){itemString = `id:60042 count:10`;itemArray.Add(itemString);} //마법 금 실
				case(91){itemString = `id:60043 count:10`;itemArray.Add(itemString);} //마법 은 실
				case(92){itemString = `id:12006 prefix:20610 suffix:30510`;itemArray.Add(itemString);} //반지(인챈트가 붙은）
				case(93){itemString = `id:12007 prefix:20710 suffix:31010`;itemArray.Add(itemString);} //데브캣 브로치(인챈트가 붙은）
				case(94){itemString = `id:40095 col1:E24159 col2:E24159`;itemArray.Add(itemString);} //드래곤 블레이드（레어 컬러）
				case(95){itemString = `id:64003 count:10`;itemArray.Add(itemString);} //동괴
				case(96){itemString = `id:64001 count:10`;itemArray.Add(itemString);} //철괴
				case(97){itemString = `manual:170 `;itemArray.Add(itemString);} //나타네 설산용 코트（옷본）
				case(98){itemString = `manual:164 `;itemArray.Add(itemString);} //위스 보위군 부츠(남성용) (옷본)
				case(99){itemString = `manual:167 `;itemArray.Add(itemString);} //위스 보위군 모자 (옷본)
				case(100){itemString = `manual:155 `;itemArray.Add(itemString);} //위스 보위군 의복(남성용) (옷본)
				case(101){itemString = `manual:156 `;itemArray.Add(itemString);} //위스 보위군 의복(여성용) (옷본)
				case(102){itemString = `manual:158 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 글러브（옷본）
				case(103){itemString = `manual:166 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 캡（옷본）
				case(104){itemString = `manual:151 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트(남성용)（옷본）
				case(105){itemString = `manual:152 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트(여성용)（옷본）
				case(106){itemString = `manual:162 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 부츠(남성용)（옷본）
				case(107){itemString = `manual:163 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 부츠(여성용)）（옷본）
				case(108){itemString = `manual:20123 `;itemArray.Add(itemString);} //헤테로 카이트 실드 (도면)
				case(109){itemString = `manual:160 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(남성용) (옷본)
				case(110){itemString = `manual:159 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(여성용) (옷본)
				case(111){itemString = `manual:157 `;itemArray.Add(itemString);} //키린 겨울 천사의 장갑 (옷본)
				case(112){itemString = `manual:165 `;itemArray.Add(itemString);} //키린 겨울 천사의 모자 (옷본)
				case(113){itemString = `manual:161 `;itemArray.Add(itemString);} //키린 겨울 천사의 부츠 (옷본)
				case(114){itemString = `id:14023 `;itemArray.Add(itemString);} //본 마린 아머(남성용)
				case(115){itemString = `id:14024 `;itemArray.Add(itemString);} //본 마린 아머(여성용)
				case(116){itemString = `id:40080 col1:000000 col2:ffff00`;itemArray.Add(itemString);} //글라디우스(레어컬러)
				case(117){itemString = `manual:145 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(여성용) (옷본)
				case(118){itemString = `manual:146 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(남성용) (옷본)
				case(119){itemString = `manual:147 `;itemArray.Add(itemString);} //키린 겨울 천사의 코트(남성용) (옷본)
				case(120){itemString = `manual:148 `;itemArray.Add(itemString);} //키린 겨울 천사의 코트(여성용) (옷본)
				case(121){itemString = `id:40030 col1:0000ec col2:000000`;itemArray.Add(itemString);} //투 핸디드 소드(레어컬러)
				case(122){itemString = `id:40079 col1:c00060`;itemArray.Add(itemString);} //메이스(레어컬러)
				case(123){itemString = `id:17040 `;itemArray.Add(itemString);} //엘라 스트랩 부츠
				case(124){itemString = `id:18523 `;itemArray.Add(itemString);} //스완 윙즈 캡
				case(125){itemString = `id:40083 `;itemArray.Add(itemString);} //훅 커틀러스
				case(126){itemString = `id:63030 `;itemArray.Add(itemString);} //지정 색상 염색 앰플
				case(127){itemString = `manual:174 `;itemArray.Add(itemString);} //본 마린 아머(남성용) (옷본)
				case(128){itemString = `manual:175 `;itemArray.Add(itemString);} //본 마린 아머(여성용) (옷본)
				case(129){itemString = `id:17039 `;itemArray.Add(itemString);} //코레스 큐트 리본 슈즈
				case(130){itemString = `id:18518 `;itemArray.Add(itemString);} //드래곤 크레스트
				case(131){itemString = `id:18096 `;itemArray.Add(itemString);} //세이렌 고양이 가면
				case(132){itemString = `id:18097 `;itemArray.Add(itemString);} //세이렌 깃털 가면
				case(133){itemString = `id:18098 `;itemArray.Add(itemString);} //세이렌의 안경
				case(134){itemString = `id:18099 `;itemArray.Add(itemString);} //세이렌 작은 날개 가면
				case(135){itemString = `id:18100 `;itemArray.Add(itemString);} //세이렌 날개 가면
				case(136){itemString = `id:18101 `;itemArray.Add(itemString);} //세이렌 박쥐 날개 가면
				case(137){itemString = `id:18102 `;itemArray.Add(itemString);} //세이렌의 가면
				case(138){itemString = `id:18521 `;itemArray.Add(itemString);} //유러피안 컴프
				case(139){itemString = `id:18525 `;itemArray.Add(itemString);} //워터드롭 캡
				case(140){itemString = `id:18511 `;itemArray.Add(itemString);} //플루트 풀 헬름
				case(141){itemString = `id:18506 `;itemArray.Add(itemString);} //윙 하프 헬름
				case(142){itemString = `id:17505 `;itemArray.Add(itemString);} //플레이트 부츠
				case(143){itemString = `id:16505 `;itemArray.Add(itemString);} //플루트 건틀렛
				case(144){itemString = `id:14019 `;itemArray.Add(itemString);} //그레이스 플레이트 아머
				case(145){itemString = `id:13045 `;itemArray.Add(itemString);} //아리쉬 아슈빈 아머(남성용)
				case(146){itemString = `manual:142 `;itemArray.Add(itemString);} //검사학교 교복 롱타입(옷본)
				case(147){itemString = `id:18542 `;itemArray.Add(itemString);} //빅 체인 풀 헬름
				case(148){itemString = `id:17064 `;itemArray.Add(itemString);} //카멜 스피리트 부츠
				case(149){itemString = `manual:20158 `;itemArray.Add(itemString);} //더스틴 실버 나이트 뱀브레이스(도면)
				case(150){itemString = `id:13046 `;itemArray.Add(itemString);} //아리쉬 아슈빈 아머(여성용)
				case(151){itemString = `id:18543 `;itemArray.Add(itemString);} //빅 슬릿 풀 헬름
				case(152){itemString = `id:18544 `;itemArray.Add(itemString);} //빅 펠리칸 프로텍터
				case(153){itemString = `id:18547 `;itemArray.Add(itemString);} //빅 파나쉬 헤드 프로텍터
				case(154){itemString = `id:16523 `;itemArray.Add(itemString);} //그레이스 건틀렛
				case(155){itemString = `manual:20166 `;itemArray.Add(itemString);} //레미니아 성월의 갑옷(남성용)（도면）
				case(156){itemString = `manual:20167 `;itemArray.Add(itemString);} //레미니아 성월의 갑옷(여성용)（도면）
				case(157){itemString = `manual:139 `;itemArray.Add(itemString);} //셀리나 섹시 베어룩（옷본）
				case(158){itemString = `manual:141 `;itemArray.Add(itemString);} //셀리나 레이디 드레스（옷본）
				case(159){itemString = `id:64010 count:5`;itemArray.Add(itemString);} //미스릴광석
				case(160){itemString = `id:60022 count:5`;itemArray.Add(itemString);} //최고급 옷감
				case(161){itemString = `id:60026 count:5`;itemArray.Add(itemString);} //최고급 가죽
				case(162){itemString = `id:60014 count:5`;itemArray.Add(itemString);} //최고급 실크
				case(163){itemString = `id:60030 count:5`;itemArray.Add(itemString);} //최고급 가죽끈
				case(164){itemString = `id:60018 count:5`;itemArray.Add(itemString);} //최고급 마감용 실
				case(165){itemString = `id:60041 count:5`;itemArray.Add(itemString);} //물안개 비단
				case(166){itemString = `id:60042 count:5`;itemArray.Add(itemString);} //마법 금 실
				case(167){itemString = `id:60043 count:5`;itemArray.Add(itemString);} //마법 은 실
				case(168){itemString = `id:64008 count:10`;itemArray.Add(itemString);} //금광석
				case(169){itemString = `id:64006 count:10`;itemArray.Add(itemString);} //은광석
				case(170){itemString = `id:60021 count:10`;itemArray.Add(itemString);} //고급 옷감
				case(171){itemString = `id:60025 count:10`;itemArray.Add(itemString);} //고급 가죽
				case(172){itemString = `id:60013 count:10`;itemArray.Add(itemString);} //고급 실크
				case(173){itemString = `id:60029 count:10`;itemArray.Add(itemString);} //고급 가죽끈
				case(174){itemString = `id:60017 count:10`;itemArray.Add(itemString);} //고급 마감용 실
				case(175){itemString = `id:19017 `;itemArray.Add(itemString);} //늑대 로브
				case(176){itemString = `id:19016 `;itemArray.Add(itemString);} //곰 로브
				case(177){itemString = `id:40100 `;itemArray.Add(itemString);} //본 마린 소드
				case(178){itemString = `id:40012 col1:008080`;itemArray.Add(itemString);} //바스타드 소드(레어컬러)
				case(179){itemString = `id:60031 `;itemArray.Add(itemString);} //보급형 실크방직 장갑
				case(180){itemString = `id:60032 `;itemArray.Add(itemString);} //일반 실크방직 장갑
				case(181){itemString = `id:60033 `;itemArray.Add(itemString);} //전문가용 실크방직 장갑
				case(182){itemString = `id:60046 `;itemArray.Add(itemString);} //최고급 실크방직 장갑
				case(183){itemString = `id:60055 `;itemArray.Add(itemString);} //고급 실크방직 장갑
				case(184){itemString = `id:60056 `;itemArray.Add(itemString);} //최고급 옷감방직 장갑
				case(185){itemString = `id:60057 `;itemArray.Add(itemString);} //고급 옷감방직 장갑
				case(186){itemString = `id:19009 `;itemArray.Add(itemString);} //코코 래빗 로브
				case(187){itemString = `id:19020 `;itemArray.Add(itemString);} //나타네 설산용 코트
				case(188){itemString = `id:40010 `;itemArray.Add(itemString);} //롱 소드
				case(189){itemString = `manual:20107 `;itemArray.Add(itemString);} //퀴러시어 헬름(도면)
				case(190){itemString = `id:51031 count:5`;itemArray.Add(itemString);} //완전 회복의 포션
				case(191){itemString = `id:63024 expire:10080`;itemArray.Add(itemString);} //염색 앰플
				case(192){itemString = `manual:20103 `;itemArray.Add(itemString);} //라운드 실드(도면)
				case(193){itemString = `id:40022 col1:c00000`;itemArray.Add(itemString);} //채집용 도끼(레어컬러)
				case(194){itemString = `id:40023 col1:0000c0`;itemArray.Add(itemString);} //채집용 단검(레어컬러)
				case(195){itemString = `id:40024 col1:c000c0`;itemArray.Add(itemString);} //대장장이 망치(레어컬러)
				case(196){itemString = `id:40025 col1:c0c000 col2:00c000`;itemArray.Add(itemString);} //곡괭이(레어컬러)
				case(197){itemString = `id:40042 col1:000000`;itemArray.Add(itemString);} //식칼(레어컬러)
				case(198){itemString = `id:40026 col1:e8664a col2:000000`;itemArray.Add(itemString);} //낫(레어컬러)
				case(199){itemString = `id:40027 col1:e0adf3`;itemArray.Add(itemString);} //호미(레어컬러)
				case(200){itemString = `id:40045 col1:ffffff col2:c00000`;itemArray.Add(itemString);} //낚싯대(레어컬러)
				case(201){itemString = `id:40043 col1:00c000`;itemArray.Add(itemString);} //반죽용 밀대(레어컬러)
				case(202){itemString = `id:40044 col1:83c270`;itemArray.Add(itemString);} //다용도 국자 (레어컬러)
				case(203){itemString = `id:46004 col1:0000c0`;itemArray.Add(itemString);} //냄비(레어컬러)
				case(204){itemString = `id:46005 col1:0000ec col2:000000`;itemArray.Add(itemString);} //간이 테이블(레어컬러)
				case(205){itemString = `manual:20105 `;itemArray.Add(itemString);} //롱 소드(도면)
				case(206){itemString = `id:63016 count:3`;itemArray.Add(itemString);} //축복포션
				case(207){itemString = `id:63047 count:5`;itemArray.Add(itemString);} //원격 힐러집 이용권
				case(208){itemString = `id:2028 count:20`;itemArray.Add(itemString);} //양털 주머니
				case(209){itemString = `manual:20101 `;itemArray.Add(itemString);} //호미(도면)
				case(210){itemString = `id:63029 count:5`;itemArray.Add(itemString);} //캠프파이어 키트
				case(211){itemString = `id:63025 count:3`;itemArray.Add(itemString);} //대용량 축복의 포션
				case(212){itemString = `id:51013 count:5`;itemArray.Add(itemString);} //스태미나 50 포션
				case(213){itemString = `manual:20102 `;itemArray.Add(itemString);} //단검(도면)
				case(214){itemString = `manual:20104 `;itemArray.Add(itemString);} //곡괭이(도면)
				case(215){itemString = `id:51022 count:5`;itemArray.Add(itemString);} //생명력과 마나 30 포션
				case(216){itemString = `id:51027 count:5`;itemArray.Add(itemString);} //생명력과 스태미나 30 포션
				case(217){itemString = `id:51028 count:3`;itemArray.Add(itemString);} //생명력과 스태미나 50 포션
				case(218){itemString = `id:51014 count:3`;itemArray.Add(itemString);} //생명력과 스태미나 100 포션
				case(219){itemString = `id:19022 `;itemArray.Add(itemString);} //사샤 로브(옷본)
				case(220){itemString = `manual:101 `;itemArray.Add(itemString);} //코레스 힐러드레스(옷본)
				case(221){itemString = `manual:102 `;itemArray.Add(itemString);} //마법학교 교복(남성용)(옷본)
				case(222){itemString = `manual:103 `;itemArray.Add(itemString);} //마법학교 교복(여성용)(옷본)
				case(223){itemString = `manual:104 `;itemArray.Add(itemString);} //코레스 힐러 글러브(옷본)
				case(224){itemString = `manual:105 `;itemArray.Add(itemString);} //몬거 모자(옷본)
				case(225){itemString = `manual:20131 `;itemArray.Add(itemString);} //숏 소드(도면)
				case(226){itemString = `manual:20008 `;itemArray.Add(itemString);} //스파이크 캡(도면)
				case(227){itemString = `manual:114 `;itemArray.Add(itemString);} //머리띠(옷본)
				case(228){itemString = `id:64002 count:10`;itemArray.Add(itemString);} //철광석
				case(229){itemString = `id:64004 count:10`;itemArray.Add(itemString);} //동광석
				case(230){itemString = `id:60012 count:10`;itemArray.Add(itemString);} //일반 실크
				case(231){itemString = `id:60016 count:10`;itemArray.Add(itemString);} //일반 마감용 실
				case(232){itemString = `id:60020 count:10`;itemArray.Add(itemString);} //일반 옷감
				case(233){itemString = `id:60024 count:10`;itemArray.Add(itemString);} //일반 가죽
				case(234){itemString = `id:60028 count:10`;itemArray.Add(itemString);} //일반 가죽끈
				case(235){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //굵은 실뭉치
				case(236){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //가는 실뭉치

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
