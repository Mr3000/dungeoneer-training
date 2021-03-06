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
	int iRandom = Random(2755);	//확률의 총합을 적는다
	meta_array itemArray;
	bool bCashGachaphonGived = false;
	int itemID = cItem.GetClassId();

	while(true)
	{
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){iCumRate += 2;} //0.072595281아스틴 댄디 수트
			case(1){iCumRate += 2;} //0.072595281아스틴 캡
			case(2){iCumRate += 2;} //0.072595281아스틴 글러브
			case(3){iCumRate += 2;} //0.072595281아스틴 슈즈
			case(4){iCumRate += 2;} //0.072595281비앙카 윙 볼레로
			case(5){iCumRate += 2;} //0.072595281비앙카 캡
			case(6){iCumRate += 2;} //0.072595281비앙카 롱 글러브
			case(7){iCumRate += 2;} //0.072595281비앙카 리본 부츠
			case(8){iCumRate += 2;} //0.072595281최고급 옷감
			case(9){iCumRate += 2;} //0.072595281최고급 가죽
			case(10){iCumRate += 2;} //0.072595281최고급 실크
			case(11){iCumRate += 2;} //0.072595281굵은 실뭉치
			case(12){iCumRate += 2;} //0.072595281가는 실뭉치
			case(13){iCumRate += 2;} //0.072595281금괴
			case(14){iCumRate += 2;} //0.072595281은괴
			case(15){iCumRate += 2;} //0.072595281동괴
			case(16){iCumRate += 2;} //0.072595281철괴
			case(17){iCumRate += 2;} //0.072595281고급 가죽
			case(18){iCumRate += 2;} //0.072595281고급 실크
			case(19){iCumRate += 2;} //0.072595281고급 옷감
			case(20){iCumRate += 2;} //0.072595281미스릴광석
			case(21){iCumRate += 2;} //0.072595281금광석
			case(22){iCumRate += 2;} //0.072595281은광석
			case(23){iCumRate += 2;} //0.072595281철광석
			case(24){iCumRate += 2;} //0.072595281동광석
			case(25){iCumRate += 2;} //0.072595281양털 주머니
			case(26){iCumRate += 2;} //0.072595281일본식 양손검（도면）
			case(27){iCumRate += 2;} //0.072595281일본식 한손검（도면）
			case(28){iCumRate += 2;} //0.072595281일본식 단검（도면）
			case(29){iCumRate += 2;} //0.072595281티오즈 아머(남성용) (레어컬러)
			case(30){iCumRate += 2;} //0.072595281티오즈 아머(여성용) (레어컬러)
			case(31){iCumRate += 2;} //0.072595281티오즈 아머(남성용) (레어컬러)
			case(32){iCumRate += 2;} //0.072595281티오즈 아머(여성용) (레어컬러)
			case(33){iCumRate += 3;} //0.108892922테라 고딕 풀 드레스
			case(34){iCumRate += 3;} //0.108892922테라 고딕 펑크 수트
			case(35){iCumRate += 3;} //0.108892922엘레건트 고딕 드레스
			case(36){iCumRate += 3;} //0.108892922엘레건트 고딕 드레스
			case(37){iCumRate += 3;} //0.108892922엘레건트 고딕 슈트
			case(38){iCumRate += 4;} //0.145190563영구 미니펫 호루라기
			case(39){iCumRate += 4;} //0.145190563에이프런 원피스
			case(40){iCumRate += 4;} //0.145190563토크 여자 요리사옷
			case(41){iCumRate += 4;} //0.145190563토크 남자 요리사옷
			case(42){iCumRate += 4;} //0.145190563엘라 베스트 스커트
			case(43){iCumRate += 4;} //0.145190563양털주머니（레어컬러）
			case(44){iCumRate += 4;} //0.145190563여성용 검사학교 교복 쇼트타입
			case(45){iCumRate += 4;} //0.145190563견습 요리사 모자
			case(46){iCumRate += 4;} //0.145190563수련 요리사 모자
			case(47){iCumRate += 4;} //0.145190563엘라 베스트 스커트（옷본）
			case(48){iCumRate += 4;} //0.145190563검사학교 교복 롱타입
			case(49){iCumRate += 4;} //0.145190563더스틴 실버 나이트 아머
			case(50){iCumRate += 4;} //0.145190563검사학교 교복 쇼트타입 (옷본)
			case(51){iCumRate += 4;} //0.145190563붉은색 염색 앰플
			case(52){iCumRate += 4;} //0.145190563검은색 염색 앰플
			case(53){iCumRate += 4;} //0.145190563브로드 소드（레어컬러）
			case(54){iCumRate += 10;} //0.362976407최고급 옷감
			case(55){iCumRate += 10;} //0.362976407최고급 가죽
			case(56){iCumRate += 10;} //0.362976407최고급 실크
			case(57){iCumRate += 10;} //0.362976407최고급 가죽끈
			case(58){iCumRate += 10;} //0.362976407최고급 마감용 실
			case(59){iCumRate += 10;} //0.362976407미스릴괴
			case(60){iCumRate += 10;} //0.362976407금괴
			case(61){iCumRate += 10;} //0.362976407은괴
			case(62){iCumRate += 10;} //0.362976407물안개 비단
			case(63){iCumRate += 10;} //0.362976407마법 금 실
			case(64){iCumRate += 10;} //0.362976407마법 은 실
			case(65){iCumRate += 10;} //0.362976407반지(인챈트가 붙은）
			case(66){iCumRate += 10;} //0.362976407데브캣 브로치(인챈트가 붙은）
			case(67){iCumRate += 10;} //0.362976407드래곤 블레이드（레어 컬러）
			case(68){iCumRate += 10;} //0.362976407동괴
			case(69){iCumRate += 10;} //0.362976407철괴
			case(70){iCumRate += 10;} //0.362976407나타네 설산용 코트（옷본）
			case(71){iCumRate += 10;} //0.362976407위스 보위군 부츠(남성용) (옷본)
			case(72){iCumRate += 10;} //0.362976407위스 보위군 모자 (옷본)
			case(73){iCumRate += 10;} //0.362976407위스 보위군 의복(남성용) (옷본)
			case(74){iCumRate += 10;} //0.362976407위스 보위군 의복(여성용) (옷본)
			case(75){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트 글러브（옷본）
			case(76){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트 캡（옷본）
			case(77){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트(남성용)（옷본）
			case(78){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트(여성용)（옷본）
			case(79){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트 부츠(남성용)（옷본）
			case(80){iCumRate += 10;} //0.362976407산드라 스나이퍼 수트 부츠(여성용)）（옷본）
			case(81){iCumRate += 10;} //0.362976407헤테로 카이트 실드 (도면)
			case(82){iCumRate += 10;} //0.362976407샤오롱주엔 예복정장(남성용) (옷본)
			case(83){iCumRate += 10;} //0.362976407샤오롱주엔 예복정장(여성용) (옷본)
			case(84){iCumRate += 10;} //0.362976407키린 겨울 천사의 장갑 (옷본)
			case(85){iCumRate += 10;} //0.362976407키린 겨울 천사의 모자 (옷본)
			case(86){iCumRate += 10;} //0.362976407키린 겨울 천사의 부츠 (옷본)
			case(87){iCumRate += 10;} //0.362976407본 마린 아머(남성용)
			case(88){iCumRate += 10;} //0.362976407본 마린 아머(여성용)
			case(89){iCumRate += 10;} //0.362976407글라디우스(레어컬러)
			case(90){iCumRate += 10;} //0.362976407샤오롱주엔 예복정장(여성용) (옷본)
			case(91){iCumRate += 10;} //0.362976407샤오롱주엔 예복정장(남성용) (옷본)
			case(92){iCumRate += 10;} //0.362976407키린 겨울 천사의 코트(남성용) (옷본)
			case(93){iCumRate += 10;} //0.362976407키린 겨울 천사의 코트(여성용) (옷본)
			case(94){iCumRate += 10;} //0.362976407투 핸디드 소드(레어컬러)
			case(95){iCumRate += 10;} //0.362976407메이스(레어컬러)
			case(96){iCumRate += 10;} //0.362976407엘라 스트랩 부츠
			case(97){iCumRate += 10;} //0.362976407스완 윙즈 캡
			case(98){iCumRate += 10;} //0.362976407훅 커틀러스
			case(99){iCumRate += 10;} //0.362976407지정 색상 염색 앰플
			case(100){iCumRate += 10;} //0.362976407본 마린 아머(남성용) (옷본)
			case(101){iCumRate += 10;} //0.362976407본 마린 아머(여성용) (옷본)
			case(102){iCumRate += 10;} //0.362976407코레스 큐트 리본 슈즈
			case(103){iCumRate += 10;} //0.362976407드래곤 크레스트
			case(104){iCumRate += 10;} //0.362976407세이렌 고양이 가면
			case(105){iCumRate += 10;} //0.362976407세이렌 깃털 가면
			case(106){iCumRate += 10;} //0.362976407세이렌의 안경
			case(107){iCumRate += 10;} //0.362976407세이렌 작은 날개 가면
			case(108){iCumRate += 10;} //0.362976407세이렌 날개 가면
			case(109){iCumRate += 10;} //0.362976407세이렌 박쥐 날개 가면
			case(110){iCumRate += 10;} //0.362976407세이렌의 가면
			case(111){iCumRate += 10;} //0.362976407유러피안 컴프
			case(112){iCumRate += 10;} //0.362976407워터드롭 캡
			case(113){iCumRate += 10;} //0.362976407플루트 풀 헬름
			case(114){iCumRate += 10;} //0.362976407윙 하프 헬름
			case(115){iCumRate += 10;} //0.362976407플레이트 부츠
			case(116){iCumRate += 10;} //0.362976407플루트 건틀렛
			case(117){iCumRate += 10;} //0.362976407그레이스 플레이트 아머
			case(118){iCumRate += 10;} //0.362976407아리쉬 아슈빈 아머(남성용)
			case(119){iCumRate += 10;} //0.362976407검사학교 교복 롱타입(옷본)
			case(120){iCumRate += 10;} //0.362976407빅 체인 풀 헬름
			case(121){iCumRate += 10;} //0.362976407카멜 스피리트 부츠
			case(122){iCumRate += 10;} //0.362976407더스틴 실버 나이트 뱀브레이스(도면)
			case(123){iCumRate += 10;} //0.362976407아리쉬 아슈빈 아머(여성용)
			case(124){iCumRate += 10;} //0.362976407빅 슬릿 풀 헬름
			case(125){iCumRate += 10;} //0.362976407빅 펠리칸 프로텍터
			case(126){iCumRate += 10;} //0.362976407빅 파나쉬 헤드 프로텍터
			case(127){iCumRate += 10;} //0.362976407그레이스 건틀렛
			case(128){iCumRate += 10;} //0.362976407레미니아 성월의 갑옷(남성용)（도면）
			case(129){iCumRate += 10;} //0.362976407레미니아 성월의 갑옷(여성용)（도면）
			case(130){iCumRate += 10;} //0.362976407셀리나 섹시 베어룩（옷본）
			case(131){iCumRate += 10;} //0.362976407셀리나 레이디 드레스（옷본）
			case(132){iCumRate += 20;} //0.725952813미스릴광석
			case(133){iCumRate += 20;} //0.725952813최고급 옷감
			case(134){iCumRate += 20;} //0.725952813최고급 가죽
			case(135){iCumRate += 20;} //0.725952813최고급 실크
			case(136){iCumRate += 20;} //0.725952813최고급 가죽끈
			case(137){iCumRate += 20;} //0.725952813최고급 마감용 실
			case(138){iCumRate += 20;} //0.725952813물안개 비단
			case(139){iCumRate += 20;} //0.725952813마법 금 실
			case(140){iCumRate += 20;} //0.725952813마법 은 실
			case(141){iCumRate += 20;} //0.725952813금광석
			case(142){iCumRate += 20;} //0.725952813은광석
			case(143){iCumRate += 20;} //0.725952813고급 옷감
			case(144){iCumRate += 20;} //0.725952813고급 가죽
			case(145){iCumRate += 20;} //0.725952813고급 실크
			case(146){iCumRate += 20;} //0.725952813고급 가죽끈
			case(147){iCumRate += 20;} //0.725952813고급 마감용 실
			case(148){iCumRate += 20;} //0.725952813늑대 로브
			case(149){iCumRate += 20;} //0.725952813곰 로브
			case(150){iCumRate += 20;} //0.725952813본 마린 소드
			case(151){iCumRate += 20;} //0.725952813바스타드 소드(레어컬러)
			case(152){iCumRate += 20;} //0.725952813보급형 실크방직 장갑
			case(153){iCumRate += 20;} //0.725952813일반 실크방직 장갑
			case(154){iCumRate += 20;} //0.725952813전문가용 실크방직 장갑
			case(155){iCumRate += 20;} //0.725952813최고급 실크방직 장갑
			case(156){iCumRate += 20;} //0.725952813고급 실크방직 장갑
			case(157){iCumRate += 20;} //0.725952813최고급 옷감방직 장갑
			case(158){iCumRate += 20;} //0.725952813고급 옷감방직 장갑
			case(159){iCumRate += 20;} //0.725952813코코 래빗 로브
			case(160){iCumRate += 20;} //0.725952813나타네 설산용 코트
			case(161){iCumRate += 20;} //0.725952813롱 소드
			case(162){iCumRate += 20;} //0.725952813퀴러시어 헬름(도면)
			case(163){iCumRate += 20;} //0.725952813완전 회복의 포션
			case(164){iCumRate += 20;} //0.725952813염색 앰플
			case(165){iCumRate += 20;} //0.725952813라운드 실드(도면)
			case(166){iCumRate += 20;} //0.725952813채집용 도끼(레어컬러)
			case(167){iCumRate += 20;} //0.725952813채집용 단검(레어컬러)
			case(168){iCumRate += 20;} //0.725952813대장장이 망치(레어컬러)
			case(169){iCumRate += 20;} //0.725952813곡괭이(레어컬러)
			case(170){iCumRate += 20;} //0.725952813식칼(레어컬러)
			case(171){iCumRate += 20;} //0.725952813낫(레어컬러)
			case(172){iCumRate += 20;} //0.725952813호미(레어컬러)
			case(173){iCumRate += 20;} //0.725952813낚싯대(레어컬러)
			case(174){iCumRate += 20;} //0.725952813반죽용 밀대(레어컬러)
			case(175){iCumRate += 20;} //0.725952813다용도 국자 (레어컬러)
			case(176){iCumRate += 20;} //0.725952813냄비(레어컬러)
			case(177){iCumRate += 20;} //0.725952813간이 테이블(레어컬러)
			case(178){iCumRate += 20;} //0.725952813롱 소드(도면)
			case(179){iCumRate += 20;} //0.725952813축복포션
			case(180){iCumRate += 20;} //0.725952813원격 힐러집 이용권
			case(181){iCumRate += 20;} //0.725952813양털 주머니
			case(182){iCumRate += 20;} //0.725952813호미(도면)
			case(183){iCumRate += 20;} //0.725952813캠프파이어 키트
			case(184){iCumRate += 20;} //0.725952813대용량 축복의 포션
			case(185){iCumRate += 20;} //0.725952813스태미나 50 포션
			case(186){iCumRate += 20;} //0.725952813단검(도면)
			case(187){iCumRate += 20;} //0.725952813곡괭이(도면)
			case(188){iCumRate += 20;} //0.725952813생명력과 마나 30 포션
			case(189){iCumRate += 20;} //0.725952813생명력과 스태미나 30 포션
			case(190){iCumRate += 20;} //0.725952813생명력과 스태미나 50 포션
			case(191){iCumRate += 20;} //0.725952813생명력과 스태미나 100 포션
			case(192){iCumRate += 20;} //0.725952813사샤 로브(옷본)
			case(193){iCumRate += 20;} //0.725952813코레스 힐러드레스(옷본)
			case(194){iCumRate += 20;} //0.725952813마법학교 교복(남성용)(옷본)
			case(195){iCumRate += 20;} //0.725952813마법학교 교복(여성용)(옷본)
			case(196){iCumRate += 20;} //0.725952813코레스 힐러 글러브(옷본)
			case(197){iCumRate += 20;} //0.725952813몬거 모자(옷본)
			case(198){iCumRate += 20;} //0.725952813숏 소드(도면)
			case(199){iCumRate += 20;} //0.725952813스파이크 캡(도면)
			case(200){iCumRate += 20;} //0.725952813머리띠(옷본)
			case(201){iCumRate += 50;} //1.814882033철광석
			case(202){iCumRate += 50;} //1.814882033동광석
			case(203){iCumRate += 50;} //1.814882033일반 실크
			case(204){iCumRate += 50;} //1.814882033일반 마감용 실
			case(205){iCumRate += 50;} //1.814882033일반 옷감
			case(206){iCumRate += 50;} //1.814882033일반 가죽
			case(207){iCumRate += 50;} //1.814882033일반 가죽끈
			case(208){iCumRate += 50;} //1.814882033굵은 실뭉치
			case(209){iCumRate += 50;} //1.814882033가는 실뭉치
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15315 `;itemArray.Add(itemString);} //아스틴 댄디 수트
				case(1){itemString = `id:18227 `;itemArray.Add(itemString);} //아스틴 캡
				case(2){itemString = `id:16053 `;itemArray.Add(itemString);} //아스틴 글러브
				case(3){itemString = `id:17126 `;itemArray.Add(itemString);} //아스틴 슈즈
				case(4){itemString = `id:15314 `;itemArray.Add(itemString);} //비앙카 윙 볼레로
				case(5){itemString = `id:18226 `;itemArray.Add(itemString);} //비앙카 캡
				case(6){itemString = `id:16052 `;itemArray.Add(itemString);} //비앙카 롱 글러브
				case(7){itemString = `id:17125 `;itemArray.Add(itemString);} //비앙카 리본 부츠
				case(8){itemString = `id:60022 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 옷감
				case(9){itemString = `id:60026 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 가죽
				case(10){itemString = `id:60014 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //최고급 실크
				case(11){itemString = `id:60006 count:5`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //굵은 실뭉치
				case(12){itemString = `id:60007 count:5`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //가는 실뭉치
				case(13){itemString = `id:64007 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //금괴
				case(14){itemString = `id:64005 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //은괴
				case(15){itemString = `id:64003 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //동괴
				case(16){itemString = `id:64001 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //철괴
				case(17){itemString = `id:60025 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 가죽
				case(18){itemString = `id:60013 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 실크
				case(19){itemString = `id:60021 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //고급 옷감
				case(20){itemString = `id:64010 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //미스릴광석
				case(21){itemString = `id:64008 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //금광석
				case(22){itemString = `id:64006 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //은광석
				case(23){itemString = `id:64002 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //철광석
				case(24){itemString = `id:64004 count:10`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //동광석
				case(25){itemString = `id:2028 count:20`;itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);itemArray.Add(itemString);} //양털 주머니
				case(26){itemString = `manual:20177 `;itemArray.Add(itemString);} //일본식 양손검（도면）
				case(27){itemString = `manual:20188 `;itemArray.Add(itemString);} //일본식 한손검（도면）
				case(28){itemString = `manual:20189 `;itemArray.Add(itemString);} //일본식 단검（도면）
				case(29){itemString = `id:14036 col1:004400 col2:009900`;itemArray.Add(itemString);} //티오즈 아머(남성용) (레어컬러)
				case(30){itemString = `id:14037 col1:004400 col2:009900`;itemArray.Add(itemString);} //티오즈 아머(여성용) (레어컬러)
				case(31){itemString = `id:14036 col1:ffffff col2:990000`;itemArray.Add(itemString);} //티오즈 아머(남성용) (레어컬러)
				case(32){itemString = `id:14037 col1:ffffff col2:990000`;itemArray.Add(itemString);} //티오즈 아머(여성용) (레어컬러)
				case(33){itemString = `id:15267 `;itemArray.Add(itemString);} //테라 고딕 풀 드레스
				case(34){itemString = `id:15268 `;itemArray.Add(itemString);} //테라 고딕 펑크 수트
				case(35){itemString = `id:15233 `;itemArray.Add(itemString);} //엘레건트 고딕 드레스
				case(36){itemString = `id:15235 `;itemArray.Add(itemString);} //엘레건트 고딕 드레스
				case(37){itemString = `id:15234 `;itemArray.Add(itemString);} //엘레건트 고딕 슈트
				case(38){itemString = `id:91193 `;itemArray.Add(itemString);} //에이프런 원피스
				case(39){itemString = `id:15217 `;itemArray.Add(itemString);} //에이프런 원피스
				case(40){itemString = `id:15076`;itemArray.Add(itemString);} //토크 여자 요리사옷
				case(41){itemString = `id:15077 `;itemArray.Add(itemString);} //토크 남자 요리사옷
				case(42){itemString = `id:15065 `;itemArray.Add(itemString);} //엘라 베스트 스커트
				case(43){itemString = `id:2028 col1:8f50eee9`;itemArray.Add(itemString);} //양털주머니（레어컬러）
				case(44){itemString = `id:15113 `;itemArray.Add(itemString);} //여성용 검사학교 교복 쇼트타입
				case(45){itemString = `id:18053 `;itemArray.Add(itemString);} //견습 요리사 모자
				case(46){itemString = `id:18054 `;itemArray.Add(itemString);} //수련 요리사 모자
				case(47){itemString = `manual:125 `;itemArray.Add(itemString);} //엘라 베스트 스커트（옷본）
				case(48){itemString = `id:15114 `;itemArray.Add(itemString);} //검사학교 교복 롱타입
				case(49){itemString = `id:13038 `;itemArray.Add(itemString);} //더스틴 실버 나이트 아머
				case(50){itemString = `manual:143 `;itemArray.Add(itemString);} //검사학교 교복 쇼트타입 (옷본)
				case(51){itemString = `id:63034 col1:c00000`;itemArray.Add(itemString);} //붉은색 염색 앰플
				case(52){itemString = `id:63033 col1:000000`;itemArray.Add(itemString);} //검은색 염색 앰플
				case(53){itemString = `id:40011 col1:5500452d`;itemArray.Add(itemString);} //브로드 소드（레어컬러）
				case(54){itemString = `id:60022 count:10`;itemArray.Add(itemString);} //최고급 옷감
				case(55){itemString = `id:60026 count:10`;itemArray.Add(itemString);} //최고급 가죽
				case(56){itemString = `id:60014 count:10`;itemArray.Add(itemString);} //최고급 실크
				case(57){itemString = `id:60030 count:10`;itemArray.Add(itemString);} //최고급 가죽끈
				case(58){itemString = `id:60018 count:10`;itemArray.Add(itemString);} //최고급 마감용 실
				case(59){itemString = `id:64009 count:10`;itemArray.Add(itemString);} //미스릴괴
				case(60){itemString = `id:64007 count:10`;itemArray.Add(itemString);} //금괴
				case(61){itemString = `id:64005 count:10`;itemArray.Add(itemString);} //은괴
				case(62){itemString = `id:60041 count:10`;itemArray.Add(itemString);} //물안개 비단
				case(63){itemString = `id:60042 count:10`;itemArray.Add(itemString);} //마법 금 실
				case(64){itemString = `id:60043 count:10`;itemArray.Add(itemString);} //마법 은 실
				case(65){itemString = `id:12006 prefix:20610 suffix:30510`;itemArray.Add(itemString);} //반지(인챈트가 붙은）
				case(66){itemString = `id:12007 prefix:20710 suffix:31010`;itemArray.Add(itemString);} //데브캣 브로치(인챈트가 붙은）
				case(67){itemString = `id:40095 col1:E24159 col2:E24159`;itemArray.Add(itemString);} //드래곤 블레이드（레어 컬러）
				case(68){itemString = `id:64003 count:10`;itemArray.Add(itemString);} //동괴
				case(69){itemString = `id:64001 count:10`;itemArray.Add(itemString);} //철괴
				case(70){itemString = `manual:170 `;itemArray.Add(itemString);} //나타네 설산용 코트（옷본）
				case(71){itemString = `manual:164 `;itemArray.Add(itemString);} //위스 보위군 부츠(남성용) (옷본)
				case(72){itemString = `manual:167 `;itemArray.Add(itemString);} //위스 보위군 모자 (옷본)
				case(73){itemString = `manual:155 `;itemArray.Add(itemString);} //위스 보위군 의복(남성용) (옷본)
				case(74){itemString = `manual:156 `;itemArray.Add(itemString);} //위스 보위군 의복(여성용) (옷본)
				case(75){itemString = `manual:158 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 글러브（옷본）
				case(76){itemString = `manual:166 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 캡（옷본）
				case(77){itemString = `manual:151 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트(남성용)（옷본）
				case(78){itemString = `manual:152 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트(여성용)（옷본）
				case(79){itemString = `manual:162 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 부츠(남성용)（옷본）
				case(80){itemString = `manual:163 `;itemArray.Add(itemString);} //산드라 스나이퍼 수트 부츠(여성용)）（옷본）
				case(81){itemString = `manual:20123 `;itemArray.Add(itemString);} //헤테로 카이트 실드 (도면)
				case(82){itemString = `manual:160 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(남성용) (옷본)
				case(83){itemString = `manual:159 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(여성용) (옷본)
				case(84){itemString = `manual:157 `;itemArray.Add(itemString);} //키린 겨울 천사의 장갑 (옷본)
				case(85){itemString = `manual:165 `;itemArray.Add(itemString);} //키린 겨울 천사의 모자 (옷본)
				case(86){itemString = `manual:161 `;itemArray.Add(itemString);} //키린 겨울 천사의 부츠 (옷본)
				case(87){itemString = `id:14023 `;itemArray.Add(itemString);} //본 마린 아머(남성용)
				case(88){itemString = `id:14024 `;itemArray.Add(itemString);} //본 마린 아머(여성용)
				case(89){itemString = `id:40080 col1:000000 col2:ffff00`;itemArray.Add(itemString);} //글라디우스(레어컬러)
				case(90){itemString = `manual:145 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(여성용) (옷본)
				case(91){itemString = `manual:146 `;itemArray.Add(itemString);} //샤오롱주엔 예복정장(남성용) (옷본)
				case(92){itemString = `manual:147 `;itemArray.Add(itemString);} //키린 겨울 천사의 코트(남성용) (옷본)
				case(93){itemString = `manual:148 `;itemArray.Add(itemString);} //키린 겨울 천사의 코트(여성용) (옷본)
				case(94){itemString = `id:40030 col1:0000ec col2:000000`;itemArray.Add(itemString);} //투 핸디드 소드(레어컬러)
				case(95){itemString = `id:40079 `;itemArray.Add(itemString);} //메이스(레어컬러)
				case(96){itemString = `id:17040 `;itemArray.Add(itemString);} //엘라 스트랩 부츠
				case(97){itemString = `id:18523 `;itemArray.Add(itemString);} //스완 윙즈 캡
				case(98){itemString = `id:40083 `;itemArray.Add(itemString);} //훅 커틀러스
				case(99){itemString = `id:63030 `;itemArray.Add(itemString);} //지정 색상 염색 앰플
				case(100){itemString = `manual:174 `;itemArray.Add(itemString);} //본 마린 아머(남성용) (옷본)
				case(101){itemString = `manual:175 `;itemArray.Add(itemString);} //본 마린 아머(여성용) (옷본)
				case(102){itemString = `id:17039 `;itemArray.Add(itemString);} //코레스 큐트 리본 슈즈
				case(103){itemString = `id:18518 `;itemArray.Add(itemString);} //드래곤 크레스트
				case(104){itemString = `id:18096 `;itemArray.Add(itemString);} //세이렌 고양이 가면
				case(105){itemString = `id:18097 `;itemArray.Add(itemString);} //세이렌 깃털 가면
				case(106){itemString = `id:18098 `;itemArray.Add(itemString);} //세이렌의 안경
				case(107){itemString = `id:18099 `;itemArray.Add(itemString);} //세이렌 작은 날개 가면
				case(108){itemString = `id:18100 `;itemArray.Add(itemString);} //세이렌 날개 가면
				case(109){itemString = `id:18101 `;itemArray.Add(itemString);} //세이렌 박쥐 날개 가면
				case(110){itemString = `id:18102 `;itemArray.Add(itemString);} //세이렌의 가면
				case(111){itemString = `id:18521 `;itemArray.Add(itemString);} //유러피안 컴프
				case(112){itemString = `id:18525 `;itemArray.Add(itemString);} //워터드롭 캡
				case(113){itemString = `id:18511 `;itemArray.Add(itemString);} //플루트 풀 헬름
				case(114){itemString = `id:18506 `;itemArray.Add(itemString);} //윙 하프 헬름
				case(115){itemString = `id:17505 `;itemArray.Add(itemString);} //플레이트 부츠
				case(116){itemString = `id:16505 `;itemArray.Add(itemString);} //플루트 건틀렛
				case(117){itemString = `id:14019 `;itemArray.Add(itemString);} //그레이스 플레이트 아머
				case(118){itemString = `id:13045 `;itemArray.Add(itemString);} //아리쉬 아슈빈 아머(남성용)
				case(119){itemString = `manual:142 `;itemArray.Add(itemString);} //검사학교 교복 롱타입(옷본)
				case(120){itemString = `id:18542 `;itemArray.Add(itemString);} //빅 체인 풀 헬름
				case(121){itemString = `id:17064 `;itemArray.Add(itemString);} //카멜 스피리트 부츠
				case(122){itemString = `manual:20158 `;itemArray.Add(itemString);} //더스틴 실버 나이트 뱀브레이스(도면)
				case(123){itemString = `id:13046 `;itemArray.Add(itemString);} //아리쉬 아슈빈 아머(여성용)
				case(124){itemString = `id:18543 `;itemArray.Add(itemString);} //빅 슬릿 풀 헬름
				case(125){itemString = `id:18544 `;itemArray.Add(itemString);} //빅 펠리칸 프로텍터
				case(126){itemString = `id:18547 `;itemArray.Add(itemString);} //빅 파나쉬 헤드 프로텍터
				case(127){itemString = `id:16523 `;itemArray.Add(itemString);} //그레이스 건틀렛
				case(128){itemString = `manual:20166 `;itemArray.Add(itemString);} //레미니아 성월의 갑옷(남성용)（도면）
				case(129){itemString = `manual:20167 `;itemArray.Add(itemString);} //레미니아 성월의 갑옷(여성용)（도면）
				case(130){itemString = `manual:139 `;itemArray.Add(itemString);} //셀리나 섹시 베어룩（옷본）
				case(131){itemString = `manual:141 `;itemArray.Add(itemString);} //셀리나 레이디 드레스（옷본）
				case(132){itemString = `id:64010 count:5`;itemArray.Add(itemString);} //미스릴광석
				case(133){itemString = `id:60022 count:5`;itemArray.Add(itemString);} //최고급 옷감
				case(134){itemString = `id:60026 count:5`;itemArray.Add(itemString);} //최고급 가죽
				case(135){itemString = `id:60014 count:5`;itemArray.Add(itemString);} //최고급 실크
				case(136){itemString = `id:60030 count:5`;itemArray.Add(itemString);} //최고급 가죽끈
				case(137){itemString = `id:60018 count:5`;itemArray.Add(itemString);} //최고급 마감용 실
				case(138){itemString = `id:60041 count:5`;itemArray.Add(itemString);} //물안개 비단
				case(139){itemString = `id:60042 count:5`;itemArray.Add(itemString);} //마법 금 실
				case(140){itemString = `id:60043 count:5`;itemArray.Add(itemString);} //마법 은 실
				case(141){itemString = `id:64008 count:10`;itemArray.Add(itemString);} //금광석
				case(142){itemString = `id:64006 count:10`;itemArray.Add(itemString);} //은광석
				case(143){itemString = `id:60021 count:10`;itemArray.Add(itemString);} //고급 옷감
				case(144){itemString = `id:60025 count:10`;itemArray.Add(itemString);} //고급 가죽
				case(145){itemString = `id:60013 count:10`;itemArray.Add(itemString);} //고급 실크
				case(146){itemString = `id:60029 count:10`;itemArray.Add(itemString);} //고급 가죽끈
				case(147){itemString = `id:60017 count:10`;itemArray.Add(itemString);} //고급 마감용 실
				case(148){itemString = `id:19017 `;itemArray.Add(itemString);} //늑대 로브
				case(149){itemString = `id:19016 `;itemArray.Add(itemString);} //곰 로브
				case(150){itemString = `id:40100 `;itemArray.Add(itemString);} //본 마린 소드
				case(151){itemString = `id:40012 col1:008080`;itemArray.Add(itemString);} //바스타드 소드(레어컬러)
				case(152){itemString = `id:60031 `;itemArray.Add(itemString);} //보급형 실크방직 장갑
				case(153){itemString = `id:60032 `;itemArray.Add(itemString);} //일반 실크방직 장갑
				case(154){itemString = `id:60033 `;itemArray.Add(itemString);} //전문가용 실크방직 장갑
				case(155){itemString = `id:60046 `;itemArray.Add(itemString);} //최고급 실크방직 장갑
				case(156){itemString = `id:60055 `;itemArray.Add(itemString);} //고급 실크방직 장갑
				case(157){itemString = `id:60056 `;itemArray.Add(itemString);} //최고급 옷감방직 장갑
				case(158){itemString = `id:60057 `;itemArray.Add(itemString);} //고급 옷감방직 장갑
				case(159){itemString = `id:19009 `;itemArray.Add(itemString);} //코코 래빗 로브
				case(160){itemString = `id:19020 `;itemArray.Add(itemString);} //나타네 설산용 코트
				case(161){itemString = `id:40010 `;itemArray.Add(itemString);} //롱 소드
				case(162){itemString = `manual:20107 `;itemArray.Add(itemString);} //퀴러시어 헬름(도면)
				case(163){itemString = `id:51031 count:5`;itemArray.Add(itemString);} //완전 회복의 포션
				case(164){itemString = `id:63024 expire:10080`;itemArray.Add(itemString);} //염색 앰플
				case(165){itemString = `manual:20103 `;itemArray.Add(itemString);} //라운드 실드(도면)
				case(166){itemString = `id:40022 col1:c00000`;itemArray.Add(itemString);} //채집용 도끼(레어컬러)
				case(167){itemString = `id:40023 col1:0000c0`;itemArray.Add(itemString);} //채집용 단검(레어컬러)
				case(168){itemString = `id:40024 col1:c000c0`;itemArray.Add(itemString);} //대장장이 망치(레어컬러)
				case(169){itemString = `id:40025 col1:c0c000 col2:00c000`;itemArray.Add(itemString);} //곡괭이(레어컬러)
				case(170){itemString = `id:40042 col1:000000`;itemArray.Add(itemString);} //식칼(레어컬러)
				case(171){itemString = `id:40026 col1:e8664a col2:000000`;itemArray.Add(itemString);} //낫(레어컬러)
				case(172){itemString = `id:40027 col1:e0adf3`;itemArray.Add(itemString);} //호미(레어컬러)
				case(173){itemString = `id:40045 col1:ffffff col2:c00000`;itemArray.Add(itemString);} //낚싯대(레어컬러)
				case(174){itemString = `id:40043 col1:00c000`;itemArray.Add(itemString);} //반죽용 밀대(레어컬러)
				case(175){itemString = `id:40044 col1:83c270`;itemArray.Add(itemString);} //다용도 국자 (레어컬러)
				case(176){itemString = `id:46004 col1:0000c0`;itemArray.Add(itemString);} //냄비(레어컬러)
				case(177){itemString = `id:46005 col1:0000ec col2:000000`;itemArray.Add(itemString);} //간이 테이블(레어컬러)
				case(178){itemString = `manual:20105 `;itemArray.Add(itemString);} //롱 소드(도면)
				case(179){itemString = `id:63016 count:3`;itemArray.Add(itemString);} //축복포션
				case(180){itemString = `id:63047 count:5`;itemArray.Add(itemString);} //원격 힐러집 이용권
				case(181){itemString = `id:2028 count:20`;itemArray.Add(itemString);} //양털 주머니
				case(182){itemString = `manual:20101 `;itemArray.Add(itemString);} //호미(도면)
				case(183){itemString = `id:63029 count:5`;itemArray.Add(itemString);} //캠프파이어 키트
				case(184){itemString = `id:63025 count:3`;itemArray.Add(itemString);} //대용량 축복의 포션
				case(185){itemString = `id:51013 count:5`;itemArray.Add(itemString);} //스태미나 50 포션
				case(186){itemString = `manual:20102 `;itemArray.Add(itemString);} //단검(도면)
				case(187){itemString = `manual:20104 `;itemArray.Add(itemString);} //곡괭이(도면)
				case(188){itemString = `id:51022 count:5`;itemArray.Add(itemString);} //생명력과 마나 30 포션
				case(189){itemString = `id:51027 count:5`;itemArray.Add(itemString);} //생명력과 스태미나 30 포션
				case(190){itemString = `id:51028 count:3`;itemArray.Add(itemString);} //생명력과 스태미나 50 포션
				case(191){itemString = `id:51014 count:3`;itemArray.Add(itemString);} //생명력과 스태미나 100 포션
				case(192){itemString = `id:19022 `;itemArray.Add(itemString);} //사샤 로브(옷본)
				case(193){itemString = `manual:101 `;itemArray.Add(itemString);} //코레스 힐러드레스(옷본)
				case(194){itemString = `manual:102 `;itemArray.Add(itemString);} //마법학교 교복(남성용)(옷본)
				case(195){itemString = `manual:103 `;itemArray.Add(itemString);} //마법학교 교복(여성용)(옷본)
				case(196){itemString = `manual:104 `;itemArray.Add(itemString);} //코레스 힐러 글러브(옷본)
				case(197){itemString = `manual:105 `;itemArray.Add(itemString);} //몬거 모자(옷본)
				case(198){itemString = `manual:20131 `;itemArray.Add(itemString);} //숏 소드(도면)
				case(199){itemString = `manual:20008 `;itemArray.Add(itemString);} //스파이크 캡(도면)
				case(200){itemString = `manual:114 `;itemArray.Add(itemString);} //머리띠(옷본)
				case(201){itemString = `id:64002 count:10`;itemArray.Add(itemString);} //철광석
				case(202){itemString = `id:64004 count:10`;itemArray.Add(itemString);} //동광석
				case(203){itemString = `id:60012 count:10`;itemArray.Add(itemString);} //일반 실크
				case(204){itemString = `id:60016 count:10`;itemArray.Add(itemString);} //일반 마감용 실
				case(205){itemString = `id:60020 count:10`;itemArray.Add(itemString);} //일반 옷감
				case(206){itemString = `id:60024 count:10`;itemArray.Add(itemString);} //일반 가죽
				case(207){itemString = `id:60028 count:10`;itemArray.Add(itemString);} //일반 가죽끈
				case(208){itemString = `id:60006 count:5`;itemArray.Add(itemString);} //굵은 실뭉치
				case(209){itemString = `id:60007 count:5`;itemArray.Add(itemString);} //가는 실뭉치
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
