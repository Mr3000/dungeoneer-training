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
	//추석 가차폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2472);	//확률의 총합을 적는다
	meta_array itemArray;
	bool bCashGachaphonGived = false;

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 				case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15184 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	테라 에이션트 패턴 웨어
			case(1){itemString = `id:15112 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	셀리나 스쿨보이룩
			case(2){itemString = `id:15065 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	엘라 베스트 스커트
			case(3){itemString = `id:19007 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 1;} //	0.04048583 	야광 머플러 로브
			case(4){itemString = `id:18552`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 헬름(인간/자이언트)
			case(5){itemString = `id:14039`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 아머(인간)
			case(6){itemString = `id:14040`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 아머(엘프)
			case(7){itemString = `id:14041`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 아머(인간)
			case(8){itemString = `id:17095`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 부츠
			case(9){itemString = `id:16532`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 건틀렛(인간)
			case(10){itemString = `id:16533`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 건틀렛(엘프)
			case(11){itemString = `id:15269`; iCumRate += 1;} //	0.04048583 	추석 새 아이템_항아의 날개옷
			case(12){itemString = `id:18182`; iCumRate += 1;} //	0.04048583 	추석 새 아이템_항아의 머리장식
			case(13){itemString = `id:80000`; iCumRate += 2;} //	0.08097166 	나오의 검은 옷
			case(14){itemString = `id:80001`; iCumRate += 2;} //	0.08097166 	루아의 옷
			case(15){itemString = `id:80002`; iCumRate += 2;} //	0.08097166 	핑크색 코트
			case(16){itemString = `id:80003`; iCumRate += 2;} //	0.08097166 	검은색 코트
			case(17){itemString = `id:80004`; iCumRate += 2;} //	0.08097166 	나오의 노란색 봄 옷
			case(18){itemString = `id:80005`; iCumRate += 2;} //	0.08097166 	나오의 하얀색 봄 옷
			case(19){itemString = `id:80006`; iCumRate += 2;} //	0.08097166 	나오의 핑크색 봄 옷
			case(20){itemString = `id:15151 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	뉴욕마리오 웨이스트 테일러 웨어(남성용)
			case(21){itemString = `id:15152 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	뉴욕마리오 웨이스트 테일러 웨어(여성용)
			case(22){itemString = `id:15153 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	산드라 스나이퍼 수트(남성용)
			case(23){itemString = `id:15154 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	산드라 스나이퍼 수트(여성용)
			case(24){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	이디카이 성직자 예복(남성용)
			case(25){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	이디카이 성직자 예복(여성용)
			case(26){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	위스 보위군 의복(남성용)
			case(27){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 2;} //	0.08097166 	위스 보위군 의복(여성용)
			case(28){itemString = `id:40033 durability:18000 durability_max:18000`; iCumRate += 2;} //	0.08097166 	크레이모어
			case(29){itemString = `id:40083 durability:15000 durability_max:15000`; iCumRate += 2;} //	0.08097166 	훅커틀러스
			case(30){itemString = `id:13047 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	키리누스진 하프 플레이트 아머(남성용)
			case(31){itemString = `id:13048 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	키리누스진 하프 플레이트 아머(여성용)
			case(32){itemString = `id:14005`; iCumRate += 2;} //	0.08097166 	드란도스 레더메일
			case(33){itemString = `id:14006`; iCumRate += 2;} //	0.08097166 	리넨 퀴라스
			case(34){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate += 2;} //	0.08097166 	힐링 원드
			case(35){itemString = `id:40030 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	투핸드소드
			case(36){itemString = `id:40078 durability:17000 durability_max:17000`; iCumRate += 2;} //	0.08097166 	비펜니스
			case(37){itemString = `id:40017 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 8;} //	0.32388664 	만돌린
			case(38){itemString = `id:40050 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 8;} //	0.32388664 	샬루모
			case(39){itemString = `id:40004 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	류트
			case(40){itemString = `id:40048 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	휘슬
			case(41){itemString = `id:40042 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 8;} //	0.32388664 	식칼
			case(42){itemString = `id:40043 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 8;} //	0.32388664 	반죽용 밀대
			case(43){itemString = `id:40044 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	다용도 국자
			case(44){itemString = `id:40045 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 8;} //	0.32388664 	낚싯대
			case(45){itemString = `id:40081`; iCumRate += 12;} //	0.48582996 	레더 롱 보우
			case(46){itemString = `id:15023`; iCumRate += 12;} //	0.48582996 	토크 사냥꾼옷
			case(47){itemString = `id:40079`; iCumRate += 12;} //	0.48582996 	메이스
			case(48){itemString = `id:40031`; iCumRate += 12;} //	0.48582996 	석궁
			case(49){itemString = `id:40013`; iCumRate += 12;} //	0.48582996 	롱 보우
			case(50){itemString = `id:40014`; iCumRate += 12;} //	0.48582996 	콤포짓 보우
			case(51){itemString = `id:46006`; iCumRate += 12;} //	0.48582996 	카이트 실드
			case(52){itemString = `id:40011`; iCumRate += 12;} //	0.48582996 	브로드 소드
			case(53){itemString = `id:46001`; iCumRate += 12;} //	0.48582996 	라운드 실드
			case(54){itemString = `id:14013`; iCumRate += 12;} //	0.48582996 	로리카
			case(55){itemString = `id:14019`; iCumRate += 12;} //	0.48582996 	그레이스 플레이트 아머
			case(56){itemString = `id:19007`; iCumRate += 12;} //	0.48582996 	야광 머플러 로브
			case(57){itemString = `id:15135`; iCumRate += 12;} //	0.48582996 	시크 수트
			case(58){itemString = `id:40015`; iCumRate += 12;} //	0.48582996 	플루트 숏 소드
			case(59){itemString = `id:17071`; iCumRate += 12;} //	0.48582996 	니하이 부츠
			case(60){itemString = `id:15153`; iCumRate += 12;} //	0.48582996 	산드라 스나이퍼 수트(남성용)
			case(61){itemString = `id:13047`; iCumRate += 12;} //	0.48582996 	키리누스진 하프 플레이트 아머(남성용)
			case(62){itemString = `id:17041`; iCumRate += 12;} //	0.48582996 	덩굴무늬 헌팅부츠
			case(63){itemString = `id:46008`; iCumRate += 12;} //	0.48582996 	라이트 헤테로 카이트 실드
			case(64){itemString = `id:15055`; iCumRate += 12;} //	0.48582996 	레더 미니 원피스
			case(65){itemString = `id:15053`; iCumRate += 12;} //	0.48582996 	플랫칼라 원피스
			case(66){itemString = `id:40030`; iCumRate += 12;} //	0.48582996 	투 핸디드 소드
			case(67){itemString = `id:17045`; iCumRate += 12;} //	0.48582996 	브이 넥 라인 레더 부츠
			case(68){itemString = `id:14004`; iCumRate += 12;} //	0.48582996 	클로스 메일
			case(69){itemString = `id:17040`; iCumRate += 12;} //	0.48582996 	엘라 스트랩 부츠
			case(70){itemString = `id:18516`; iCumRate += 12;} //	0.48582996 	이블 다잉 크라운
			case(71){itemString = `id:18521`; iCumRate += 12;} //	0.48582996 	유러피안 컴프
			case(72){itemString = `id:15005`; iCumRate += 12;} //	0.48582996 	모험가 슈트
			case(73){itemString = `id:18525`; iCumRate += 12;} //	0.48582996 	워터드롭 캡
			case(74){itemString = `id:18511`; iCumRate += 12;} //	0.48582996 	플루트 풀 헬름
			case(75){itemString = `id:18506`; iCumRate += 12;} //	0.48582996 	윙 하프 헬름
			case(76){itemString = `id:16505`; iCumRate += 12;} //	0.48582996 	플루트 건틀렛
			case(77){itemString = `id:18502`; iCumRate += 12;} //	0.48582996 	본 헬름
			case(78){itemString = `id:15014`; iCumRate += 12;} //	0.48582996 	파발꾼의 옷
			case(79){itemString = `id:18115`; iCumRate += 12;} //	0.48582996 	핀 고양이 모자
			case(80){itemString = `id:18112`; iCumRate += 12;} //	0.48582996 	해 분장 소품
			case(81){itemString = `id:18111`; iCumRate += 12;} //	0.48582996 	나무 분장 소품
			case(82){itemString = `id:18110`; iCumRate += 12;} //	0.48582996 	덤불 분장 소품
			case(83){itemString = `id:18109`; iCumRate += 12;} //	0.48582996 	나오 분장 소품
			case(84){itemString = `id:18108`; iCumRate += 12;} //	0.48582996 	바위 분장 소품
			case(85){itemString = `id:18547`; iCumRate += 12;} //	0.48582996 	파나쉬 헤드 프로텍터
			case(86){itemString = `id:19020`; iCumRate += 12;} //	0.48582996 	나타네 설산용 코트
			case(87){itemString = `id:16520`; iCumRate += 12;} //	0.48582996 	롱 레더 글러브
			case(88){itemString = `id:19012`; iCumRate += 12;} //	0.48582996 	트루디 레이어드 로브
			case(89){itemString = `id:18004`; iCumRate += 12;} //	0.48582996 	몬거 패션모자
			case(90){itemString = `id:15132`; iCumRate += 12;} //	0.48582996 	내추럴 베스트 웨어
			case(91){itemString = `id:15043`; iCumRate += 12;} //	0.48582996 	스포티 웨어세트
			case(92){itemString = `id:15033`; iCumRate += 12;} //	0.48582996 	몬거 여행자옷
			case(93){itemString = `id:51003 count:10`; iCumRate += 12;} //	0.48582996 	생명력 50 포션
			case(94){itemString = `id:51004 count:10`; iCumRate += 12;} //	0.48582996 	생명력 100 포션
			case(95){itemString = `id:51007 count:10`; iCumRate += 12;} //	0.48582996 	마나 30 포션
			case(96){itemString = `id:51008 count:10`; iCumRate += 12;} //	0.48582996 	마나 50 포션
			case(97){itemString = `id:51013 count:10`; iCumRate += 12;} //	0.48582996 	스태미나 50 포션
			case(98){itemString = `id:51014 count:10`; iCumRate += 12;} //	0.48582996 	스태미나 100 포션
			case(99){itemString = `id:51001 count:10`; iCumRate += 12;} //	0.48582996 	생명력 10 포션
			case(100){itemString = `id:51002 count:10`; iCumRate += 12;} //	0.48582996 	생명력 30 포션
			case(101){itemString = `id:51022 count:10`; iCumRate += 12;} //	0.48582996 	생명력과 마나 30 포션
			case(102){itemString = `id:51027 count:10`; iCumRate += 12;} //	0.48582996 	생명력과 스태미나 30 포션
			case(103){itemString = `id:51028 count:10`; iCumRate += 12;} //	0.48582996 	생명력과 스태미나 50 포션
			case(104){itemString = `id:18029`; iCumRate += 14;} //	0.56680162 	나무테 안경
			case(105){itemString = `id:18028`; iCumRate += 14;} //	0.56680162 	접이식 안경
			case(106){itemString = `id:40038`; iCumRate += 14;} //	0.56680162 	라이트닝 원드
			case(107){itemString = `id:40039`; iCumRate += 14;} //	0.56680162 	아이스 원드
			case(108){itemString = `id:40040`; iCumRate += 14;} //	0.56680162 	파이어 원드
			case(109){itemString = `id:40041`; iCumRate += 14;} //	0.56680162 	타격용 원드
			case(110){itemString = `id:40090`; iCumRate += 14;} //	0.56680162 	힐링 원드
			case(111){itemString = `id:18542`; iCumRate += 14;} //	0.56680162 	빅 체인 풀 헬름
			case(112){itemString = `id:18543`; iCumRate += 14;} //	0.56680162 	슬릿 풀 헬름
			case(113){itemString = `id:18544`; iCumRate += 14;} //	0.56680162 	펠리칸 프로텍터
			case(114){itemString = `id:15128`; iCumRate += 14;} //	0.56680162 	투 톤 비조 드레스
			case(115){itemString = `id:16019`; iCumRate += 14;} //	0.56680162 	줄무늬 팔목 장갑
			case(116){itemString = `id:18047`; iCumRate += 14;} //	0.56680162 	코레스 펠트 모자
			case(117){itemString = `id:15052`; iCumRate += 14;} //	0.56680162 	터크스 투톤 튜닉
			case(118){itemString = `id:19005`; iCumRate += 14;} //	0.56680162 	머플러 로브
			case(119){itemString = `id:2001`; iCumRate += 14;} //	0.56680162 	금화 주머니
			case(120){itemString = `id:2006`; iCumRate += 14;} //	0.56680162 	큰 금화 주머니
			case(121){itemString = `id:18010`; iCumRate += 14;} //	0.56680162 	몬거 스마트 캡
			case(122){itemString = `id:15131`; iCumRate += 14;} //	0.56680162 	핀 에이프런 스커트
			case(123){itemString = `id:18008`; iCumRate += 14;} //	0.56680162 	스트라이프 캡
			case(124){itemString = `id:16008`; iCumRate += 14;} //	0.56680162 	코레스 씨프 글러브
			case(125){itemString = `id:15028`; iCumRate += 14;} //	0.56680162 	코레스 씨프슈트
			case(126){itemString = `id:17506`; iCumRate += 14;} //	0.56680162 	롱그리브 부츠
			case(127){itemString = `id:18026`; iCumRate += 14;} //	0.56680162 	몬거 상인모자
			case(128){itemString = `id:18040`; iCumRate += 14;} //	0.56680162 	코레스 꼭지 베레모
			case(129){itemString = `id:18038`; iCumRate += 14;} //	0.56680162 	깃털 배렛 모자
			case(130){itemString = `id:15042`; iCumRate += 14;} //	0.56680162 	롱넥 원피스
			case(131){itemString = `id:40012`; iCumRate += 14;} //	0.56680162 	바스타드 소드
			case(132){itemString = `id:17016`; iCumRate += 14;} //	0.56680162 	필드 컴뱃슈즈
			case(133){itemString = `id:17015`; iCumRate += 14;} //	0.56680162 	컴뱃슈즈
			case(134){itemString = `id:17005`; iCumRate += 14;} //	0.56680162 	사냥꾼 신발
			case(135){itemString = `id:17002`; iCumRate += 14;} //	0.56680162 	검사 신발
			case(136){itemString = `id:17022`; iCumRate += 14;} //	0.56680162 	레더부츠
			case(137){itemString = `id:17001`; iCumRate += 14;} //	0.56680162 	가죽 부츠
			case(138){itemString = `id:17007`; iCumRate += 14;} //	0.56680162 	가죽 구두
			case(139){itemString = `id:16009`; iCumRate += 14;} //	0.56680162 	사냥꾼장갑
			case(140){itemString = `id:40097`; iCumRate += 14;} //	0.56680162 	L 로드
			case(141){itemString = `id:15031`; iCumRate += 14;} //	0.56680162 	마법학교 교복
			case(142){itemString = `id:51029 count:10`; iCumRate += 15;} //	0.60728745 	생명력과 스태미나 100 포션
			case(143){itemString = `id:62005 suffix:31002`; iCumRate += 16;} //	0.64777328 	인챈트 스크롤(기사)
			case(144){itemString = `id:62005 suffix:30302`; iCumRate += 16;} //	0.64777328 	인챈트 스크롤(코볼트)
			case(145){itemString = `id:62005 prefix:20615`; iCumRate += 16;} //	0.64777328 	사막거미
			case(146){itemString = `id:62005 prefix:20508`; iCumRate += 16;} //	0.64777328 	수상한
			case(147){itemString = `id:62005 prefix:20618`; iCumRate += 16;} //	0.64777328 	망설이는
			case(148){itemString = `id:62005 prefix:20718`; iCumRate += 16;} //	0.64777328 	이상한
			case(149){itemString = `id:62005 prefix:20212`; iCumRate += 16;} //	0.64777328 	괴상한
			case(150){itemString = `id:62005 prefix:20412`; iCumRate += 16;} //	0.64777328 	별난
			case(151){itemString = `id:62005 prefix:20619`; iCumRate += 16;} //	0.64777328 	특이한
			case(152){itemString = `id:62005 suffix:30616`; iCumRate += 16;} //	0.64777328 	매정한
			case(153){itemString = `id:62005 suffix:30617`; iCumRate += 16;} //	0.64777328 	무정한
			case(154){itemString = `id:62005 suffix:30618`; iCumRate += 16;} //	0.64777328 	비참한
			case(155){itemString = `id:62005 suffix:30726`; iCumRate += 16;} //	0.64777328 	하모니
			case(156){itemString = `id:62005 suffix:30629`; iCumRate += 16;} //	0.64777328 	멜로디
			case(157){itemString = `id:62005 suffix:30727`; iCumRate += 16;} //	0.64777328 	소금
			case(158){itemString = `id:62005 suffix:30630`; iCumRate += 16;} //	0.64777328 	설탕
			case(159){itemString = `id:62005 prefix:20505`; iCumRate += 16;} //	0.64777328 	리자드
			case(160){itemString = `id:62005 prefix:20209`; iCumRate += 16;} //	0.64777328 	몽구스
			case(161){itemString = `id:62005 prefix:20409`; iCumRate += 16;} //	0.64777328 	사막여우
			case(162){itemString = `id:63000 count:10`; iCumRate += 16;} //	0.64777328 	피닉스의 깃털
			case(163){itemString = `id:50164 quality:100`; iCumRate += 16;} //	0.64777328 	T본 스테이크
			case(164){itemString = `id:50165 quality:100`; iCumRate += 16;} //	0.64777328 	치즈 그라탕
			case(165){itemString = `id:50166 quality:100`; iCumRate += 16;} //	0.64777328 	카레 라이스
			case(166){itemString = `id:50167 quality:100`; iCumRate += 16;} //	0.64777328 	코 코 뱅
			case(167){itemString = `id:50168 quality:100`; iCumRate += 16;} //	0.64777328 	송어찜
			case(168){itemString = `id:50178 quality:100`; iCumRate += 16;} //	0.64777328 	오렌지 주스
			case(169){itemString = `id:50179 quality:100`; iCumRate += 16;} //	0.64777328 	레몬 주스
			case(170){itemString = `id:50182 quality:100`; iCumRate += 16;} //	0.64777328 	브리흐네 위스키
			case(171){itemString = `id:50199 quality:100`; iCumRate += 16;} //	0.64777328 	스크류 드라이버
			case(172){itemString = `id:50200 quality:100`; iCumRate += 16;} //	0.64777328 	라인 슬링
			case(173){itemString = `id:50201 quality:100`; iCumRate += 16;} //	0.64777328 	BnR
			case(174){itemString = `id:50202 quality:100`; iCumRate += 16;} //	0.64777328 	키스 온 더 립스
			case(175){itemString = `id:50203 quality:100`; iCumRate += 16;} //	0.64777328 	레드 선라이즈
			case(176){itemString = `id:50183 quality:100`; iCumRate += 16;} //	0.64777328 	데브니쉬 흑맥주
			case(177){itemString = `id:50123 quality:100`; iCumRate += 16;} //	0.64777328 	베이컨구이
			case(178){itemString = `id:50124 quality:100`; iCumRate += 16;} //	0.64777328 	비프 스테이크
			case(179){itemString = `id:62005 prefix:20203`; iCumRate += 18;} //	0.72874494 	양치기의
			case(180){itemString = `id:62005 prefix:21003`; iCumRate += 18;} //	0.72874494 	파멸의
			case(181){itemString = `id:62005 suffix:30201`; iCumRate += 18;} //	0.72874494 	갈색곰
			case(182){itemString = `id:62005 suffix:30302`; iCumRate += 18;} //	0.72874494 	코볼트
			case(183){itemString = `id:62005 prefix:20201`; iCumRate += 18;} //	0.72874494 	하드
			case(184){itemString = `id:62005 suffix:30304`; iCumRate += 18;} //	0.72874494 	회색늑대
			case(185){itemString = `id:62005 suffix:30702`; iCumRate += 18;} //	0.72874494 	레이븐
			case(186){itemString = `id:62005 suffix:30704`; iCumRate += 18;} //	0.72874494 	데들리
			case(187){itemString = `id:62005 suffix:30801`; iCumRate += 18;} //	0.72874494 	네이쳐
			case(188){itemString = `id:62005 suffix:30802`; iCumRate += 18;} //	0.72874494 	카운터
			case(189){itemString = `id:62005 suffix:30803`; iCumRate += 18;} //	0.72874494 	윈드밀
			case(190){itemString = `id:62005 suffix:30804`; iCumRate += 18;} //	0.72874494 	스매시
			case(191){itemString = `id:62005 prefix:20405`; iCumRate += 18;} //	0.72874494 	거친
			case(192){itemString = `id:62005 prefix:20501`; iCumRate += 18;} //	0.72874494 	간편한
			case(193){itemString = `id:62005 prefix:20602`; iCumRate += 18;} //	0.72874494 	견고한
			case(194){itemString = `id:62005 prefix:20701`; iCumRate += 18;} //	0.72874494 	거센
			case(195){itemString = `id:62005 suffix:30506`; iCumRate += 18;} //	0.72874494 	매서운
			case(196){itemString = `id:62005 suffix:30614`; iCumRate += 18;} //	0.72874494 	기운찬
			case(197){itemString = `id:62005 prefix:20108`; iCumRate += 18;} //	0.72874494 	키위
			case(198){itemString = `id:62005 prefix:20304`; iCumRate += 18;} //	0.72874494 	타조
			case(199){itemString = `id:91006 expire:43200`; iCumRate += 20;} //	0.80971660 	체형변화포션10
			case(200){itemString = `id:91007 expire:43200`; iCumRate += 20;} //	0.80971660 	체형변화포션17
			case(201){itemString = `id:91034`; iCumRate += 38;} //	1.53846154 	경험치 증가 포션
			case(202){itemString = `id:50377`; iCumRate += 38;} //	1.53846154 	추석 새 아이템_불로장생 월병 월병
			case(203){itemString = `id:50378`; iCumRate += 38;} //	1.53846154 	추석 새 아이템_마법 찰떡
			case(204){itemString = `id:18553`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 헬름(엘프)
			case(205){itemString = `id:16535`; iCumRate += 1;} //	0.04048583 	차이나 드래곤 건틀렛(자이언트)
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
			bCashGachaphonGived = true;
		}
		if (bCashGachaphonGived)
		{
			break;
		}
		++i;
	}
	// 추석 가차폰을 못받았다.
	if (!bCashGachaphonGived)
	{
		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
	}	
}
