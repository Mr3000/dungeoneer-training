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
	//패션 가차폰(번들)
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)
	{

		int iCumRate = 0; //확률을 누적해놓는 변수
		int totalRate = 2992;
		int tempRate = 0;
		int itemRate = 0;
		int i=0;
		int iRandom = Random(totalRate);	//확률의 총합을 적는다

		while(true)
		{
			tempRate = iCumRate;
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				case(0){itemString = `id:19083 `; iCumRate += 2;} //0.06684492개구리의 레인코트
				case(1){itemString = `id:15595 `; iCumRate += 2;} //0.06684492스위스의 민족 의상 (남성용)
				case(2){itemString = `id:15594 `; iCumRate += 2;} //0.06684492스위스의 민족 의상 (여성용)
				case(3){itemString = `id:18312 `; iCumRate += 2;} //0.06684492스위스의 민족 모자 (남성용)
				case(4){itemString = `id:18313 `; iCumRate += 2;} //0.06684492스위스의 민족 모자 (여성용)
				case(5){itemString = `id:17231 `; iCumRate += 2;} //0.06684492스위스의 민족구두  (남성용)
				case(6){itemString = `id:17232 `; iCumRate += 2;} //0.06684492스위스의 민족구두  (여성용)
				case(7){itemString = `id:15555 `; iCumRate += 2;} //0.06684492바나렌오리엔타르고식크드레스
				case(8){itemString = `id:15556 `; iCumRate += 2;} //0.06684492바나렌오리엔타르고식크웨아
				case(9){itemString = `id:16065 `; iCumRate += 2;} //0.06684492바나렌다브르브레스렛트
				case(10){itemString = `id:17212 `; iCumRate += 2;} //0.06684492바나렌리본브트
				case(11){itemString = `id:17213 `; iCumRate += 2;} //0.06684492바나렌밤나막신
				case(12){itemString = `id:18582 `; iCumRate += 3;} //0.10026738앤티크 레이스 헤드 드레스
				case(13){itemString = `id:15408 `; iCumRate += 3;} //0.10026738앤티크 프릴 네글리제
				case(14){itemString = `id:17158 `; iCumRate += 3;} //0.10026738앤티크 레이스 슬리퍼
				case(15){itemString = `id:15406 `; iCumRate += 3;} //0.10026738캐쥬얼 슈트 A타입
				case(16){itemString = `id:15407 `; iCumRate += 3;} //0.10026738캐쥬얼 슈트 B타입
				case(17){itemString = `id:15267 `; iCumRate += 3;} //0.10026738테라고식크후르드레스
				case(18){itemString = `id:15268 `; iCumRate += 3;} //0.10026738테라고식크판크스트
				case(19){itemString = `id:15233 `; iCumRate += 3;} //0.10026738엘레강트 고딕 드레스(롱)
				case(20){itemString = `id:15235 `; iCumRate += 3;} //0.10026738엘레강트 고딕 드레스(쇼트)
				case(21){itemString = `id:15234 `; iCumRate += 3;} //0.10026738엘레강트 고딕 슈트
				case(22){itemString = `id:15217 `; iCumRate += 3;} //0.10026738에이프런 원피스
				case(23){itemString = `id:15315 `; iCumRate += 3;} //0.10026738아스틴단디스트
				case(24){itemString = `id:18227 `; iCumRate += 3;} //0.10026738아스틴캐프
				case(25){itemString = `id:16053 `; iCumRate += 3;} //0.10026738아스팅로브
				case(26){itemString = `id:17126 `; iCumRate += 3;} //0.10026738아스틴슈즈
				case(27){itemString = `id:15314 `; iCumRate += 3;} //0.10026738비안카윙보레로
				case(28){itemString = `id:18226 `; iCumRate += 3;} //0.10026738비안카캐프
				case(29){itemString = `id:16052 `; iCumRate += 3;} //0.10026738비안카롱그로브
				case(30){itemString = `id:17125 `; iCumRate += 3;} //0.10026738비안카리본브트
				case(31){itemString = `id:15338 `; iCumRate += 3;} //0.10026738로맨틱 이브닝 드레스
				case(32){itemString = `id:15339 `; iCumRate += 3;} //0.10026738로만틱테이르코트
				case(33){itemString = `id:17135 `; iCumRate += 3;} //0.10026738에나멜 펌프스
				case(34){itemString = `id:17136 `; iCumRate += 3;} //0.10026738클래식 슈즈
				case(35){itemString = `id:15305 `; iCumRate += 3;} //0.10026738보니타시르키드레스
				case(36){itemString = `id:15306 `; iCumRate += 3;} //0.10026738트르디빈테이지웨아
				case(37){itemString = `id:16047 `; iCumRate += 3;} //0.10026738보니타시르키그로브
				case(38){itemString = `id:16050 `; iCumRate += 3;} //0.10026738트르디 4 버튼 글로브
				case(39){itemString = `id:17120 `; iCumRate += 3;} //0.10026738보니타프룸안크루브트
				case(40){itemString = `id:17121 `; iCumRate += 3;} //0.10026738트르디슈즈
				case(41){itemString = `id:18213 `; iCumRate += 3;} //0.10026738보니타트인리본
				case(42){itemString = `id:18214 `; iCumRate += 3;} //0.10026738트르디빈테이지타반
				case(43){itemString = `id:15250 `; iCumRate += 3;} //0.10026738메이드옷(롱)
				case(44){itemString = `id:15251 `; iCumRate += 3;} //0.10026738메이드옷(쇼트)
				case(45){itemString = `id:15252 `; iCumRate += 3;} //0.10026738집사옷
				case(46){itemString = `id:18176 `; iCumRate += 3;} //0.10026738헤드 드레스(메이드의 머리의 머리 치장)
				case(47){itemString = `id:15079 `; iCumRate += 3;} //0.10026738볼레로 앤드 점퍼스커트
				case(48){itemString = `id:15117 suffix:31202`; iCumRate += 3;} //0.10026738마도 슈트 남성용(쟈칼)
				case(49){itemString = `id:15117 suffix:31301`; iCumRate += 3;} //0.10026738마도 슈트 남성용(어린 너구리)
				case(50){itemString = `id:15116 suffix:31202`; iCumRate += 3;} //0.10026738마도 슈트 여성용(쟈칼)
				case(51){itemString = `id:15116 suffix:31301`; iCumRate += 3;} //0.10026738마도 슈트 여성용(어린 너구리)
				case(52){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate += 4;} //0.13368984몬고 마도사의 모자
				case(53){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984몬고라지 마도사의 모자
				case(54){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate += 4;} //0.13368984티핑 슈트
				case(55){itemString = `id:15260 `; iCumRate += 4;} //0.13368984더비 스콧 스프레드 웨어(남성용)
				case(56){itemString = `id:15261 `; iCumRate += 4;} //0.13368984더비 스콧 스프레드 웨어(여성용)
				case(57){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate += 4;} //0.13368984레이스 플라스틱 모포 슈트
				case(58){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984핀 에이프런 스커트
				case(59){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984오데리아위자드스트
				case(60){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984아드라나츄라르넥크라인
				case(61){itemString = `id:15113 `; iCumRate += 4;} //0.13368984검사 학교의 제복 쇼트 타입
				case(62){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984검사 학교의 제복 롱 타입(여성용)
				case(63){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984검사 학교의 제복 쇼트 타입(남성용)
				case(64){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate += 4;} //0.13368984트르디모카신브트
				case(65){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate += 4;} //0.13368984원 버튼 엉클 슈즈
				case(66){itemString = `id:15065 `; iCumRate += 4;} //0.13368984에러 베스트 스커트
				case(67){itemString = `id:63034 col1:c00000`; iCumRate += 4;} //0.13368984붉은 염색 앰플(칼라 지정)
				case(68){itemString = `id:63033 col1:000000`; iCumRate += 4;} //0.13368984검은 염색 앰플(칼라 지정)
				case(69){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984트르디쟈그드미니스카트
				case(70){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 4;} //0.13368984차이나 드레스
				case(71){itemString = `id:18044 `; iCumRate += 4;} //0.13368984복면
				case(72){itemString = `id:16519 `; iCumRate += 4;} //0.13368984초호화인 장갑
				case(73){itemString = `id:18046 `; iCumRate += 4;} //0.13368984크라운 악세사리
				case(74){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 4;} //0.13368984클래식 슬리브 웨어
				case(75){itemString = `id:15060 `; iCumRate += 4;} //0.13368984슬림 이너 로브 웨어
				case(76){itemString = `id:17041 `; iCumRate += 4;} //0.13368984헌팅 슈즈
				case(77){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984아이돌 리본 드레스
				case(78){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984스탠드 칼라 슬리브리스
				case(79){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 4;} //0.13368984야광 머플러 로브
				case(80){itemString = `id:18060 `; iCumRate += 4;} //0.13368984래빗 밴드 5
				case(81){itemString = `id:18065 `; iCumRate += 4;} //0.13368984가죽의 래빗 밴드 5
				case(82){itemString = `id:18070 `; iCumRate += 4;} //0.13368984별의 래빗 밴드 5
				case(83){itemString = `id:18051 `; iCumRate += 4;} //0.13368984코레스리본 모자
				case(84){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate += 4;} //0.13368984코레스 닌자 슈트
				case(85){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 4;} //0.13368984동양식 BUSHI 웨어
				case(86){itemString = `id:15396 `; iCumRate += 4;} //0.13368984에리네드티아드스트
				case(87){itemString = `id:15397 `; iCumRate += 4;} //0.13368984에리네드마타니티스트
				case(88){itemString = `id:15398 `; iCumRate += 4;} //0.13368984에리네드메디바르쟈켓트
				case(89){itemString = `id:15399 `; iCumRate += 4;} //0.13368984에리네드카바리에스트
				case(90){itemString = `id:15401 `; iCumRate += 4;} //0.13368984에리네드레이야드드레스
				case(91){itemString = `id:15402 `; iCumRate += 4;} //0.13368984에리네드마타니티드레스
				case(92){itemString = `id:15403 `; iCumRate += 4;} //0.13368984에리네드몬크트피스
				case(93){itemString = `id:15404 `; iCumRate += 4;} //0.13368984에리네드소우바드레스
				case(94){itemString = `id:60001 suffix:10702`; iCumRate += 10;} //0.334224599재봉 킷(허수아비)
				case(95){itemString = `id:18016 suffix:10702`; iCumRate += 10;} //0.334224599모자(허수아비)
				case(96){itemString = `id:16001 suffix:10702`; iCumRate += 10;} //0.334224599퀼팅 글로브(허수아비)
				case(97){itemString = `id:16019 suffix:10702`; iCumRate += 10;} //0.334224599스트라이프 글로브(허수아비)
				case(98){itemString = `id:17003 suffix:10702`; iCumRate += 10;} //0.334224599가죽 슈즈 남성용(허수아비)
				case(99){itemString = `id:17007 suffix:10702`; iCumRate += 10;} //0.334224599가죽 슈즈 여성용(허수아비)
				case(100){itemString = `id:15000 suffix:10702`; iCumRate += 10;} //0.334224599포포샤트와 바지(허수아비)
				case(101){itemString = `id:15022 suffix:10702`; iCumRate += 10;} //0.334224599포포스카트(허수아비)
				case(102){itemString = `id:63069 `; iCumRate += 10;} //0.334224599금속 염색 앰플
				case(103){itemString = `id:15055 `; iCumRate += 10;} //0.334224599레더 미니 원피스
				case(104){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.334224599엔챤트(자이언트)
				case(105){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.334224599엔챤트(코보르드)
				case(106){itemString = `id:46006 `; iCumRate += 10;} //0.334224599가이토 쉴드
				case(107){itemString = `id:15053 `; iCumRate += 10;} //0.334224599플랫 칼라 원피스
				case(108){itemString = `id:15134 `; iCumRate += 10;} //0.334224599고딕 베이직 슈트
				case(109){itemString = `id:15136 `; iCumRate += 10;} //0.334224599고딕 레이스 스커트
				case(110){itemString = `id:15063 `; iCumRate += 10;} //0.334224599층 프릴 원피스
				case(111){itemString = `id:15108 `; iCumRate += 10;} //0.334224599섹시 레이디스 탱크 톱
				case(112){itemString = `id:15059 `; iCumRate += 10;} //0.334224599타크스탄크툽반바지
				case(113){itemString = `id:15112 `; iCumRate += 10;} //0.334224599세리나스크르보이룩크
				case(114){itemString = `id:17042 `; iCumRate += 10;} //0.334224599코레스오리엔타르롱브트
				case(115){itemString = `id:15074 `; iCumRate += 10;} //0.334224599루이스 성직자 코트
				case(116){itemString = `id:15061 `; iCumRate += 10;} //0.334224599물결 모양의 클래식 최 닉
				case(117){itemString = `id:17040 `; iCumRate += 10;} //0.334224599에러 스트랩 부츠
				case(118){itemString = `id:18525 `; iCumRate += 10;} //0.334224599워터 드롭 캡
				case(119){itemString = `id:15014 `; iCumRate += 10;} //0.334224599파발꾼 웨어
				case(120){itemString = `id:18113 `; iCumRate += 10;} //0.334224599령고양이 모자
				case(121){itemString = `id:18114 `; iCumRate += 10;} //0.334224599호랑이 고양이 모자
				case(122){itemString = `id:18115 `; iCumRate += 10;} //0.334224599핀 고양이 모자
				case(123){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.334224599엔챤트(레이브)
				case(124){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.334224599엔챤트(폭스)
				case(125){itemString = `id:63030 col1:ffffff`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(126){itemString = `id:63030 col1:00c000`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(127){itemString = `id:63030 col1:0000c0`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(128){itemString = `id:63030 col1:c0c000`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(129){itemString = `id:63030 col1:c000c0`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(130){itemString = `id:63030 col1:00c0c0`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(131){itemString = `id:63030 col1:8673c4`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(132){itemString = `id:63030 col1:f9a6fc`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(133){itemString = `id:63030 col1:5dabf0`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(134){itemString = `id:63030 col1:1da597`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(135){itemString = `id:63030 col1:ff8600`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(136){itemString = `id:63030 col1:60400f0d`; iCumRate += 10;} //0.334224599색지정 염색 앰플(특수 칼라 지정)
				case(137){itemString = `id:63030 col1:60401d1f`; iCumRate += 10;} //0.334224599색지정 염색 앰플(특수 칼라 지정)
				case(138){itemString = `id:63030 col1:2cfbb6`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(139){itemString = `id:63030 col1:74fbff`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(140){itemString = `id:63030 col1:ff27a8`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(141){itemString = `id:63030 col1:ffff00`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(142){itemString = `id:63030 col1:bd00c0`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(143){itemString = `id:63030 col1:ffffd4`; iCumRate += 10;} //0.334224599색지정 염색 앰플(칼라 지정)
				case(144){itemString = `id:15029 `; iCumRate += 10;} //0.334224599토크 대장간 슈트
				case(145){itemString = `id:15151 `; iCumRate += 10;} //0.334224599뉴욕 마리오 웨스트 테일러 웨어(남성용)
				case(146){itemString = `id:15152 `; iCumRate += 10;} //0.334224599뉴욕 마리오 웨스트 테일러 웨어(여성용)
				case(147){itemString = `id:15153 `; iCumRate += 10;} //0.334224599산드라스나이파스트(남성용)
				case(148){itemString = `id:15154 `; iCumRate += 10;} //0.334224599산드라스나이파스트(여성용)
				case(149){itemString = `id:15032 `; iCumRate += 10;} //0.334224599리리나쇼트판트
				case(150){itemString = `id:15026 `; iCumRate += 10;} //0.334224599리리나롱스카트
				case(151){itemString = `id:15016 `; iCumRate += 10;} //0.334224599스타킹 유니폼
				case(152){itemString = `id:15051 `; iCumRate += 10;} //0.334224599타이트 벨트 웨어
				case(153){itemString = `id:15008 `; iCumRate += 10;} //0.334224599검사 학교의 제복
				case(154){itemString = `id:15212 `; iCumRate += 10;} //0.334224599코린 호-더-웨어
				case(155){itemString = `id:15137 `; iCumRate += 10;} //0.334224599세리나하후쟈켓트코트
				case(156){itemString = `id:15127 `; iCumRate += 10;} //0.334224599세리나트라디쇼나르코트
				case(157){itemString = `id:19031 `; iCumRate += 10;} //0.334224599알 칼레이도 스타 라이트 로브
				case(158){itemString = `id:18011 `; iCumRate += 10;} //0.334224599몬고제스타캐프
				case(159){itemString = `id:18124 `; iCumRate += 10;} //0.334224599산드라스나이파캐프
				case(160){itemString = `id:18009 `; iCumRate += 10;} //0.334224599몬고아챠캐프
				case(161){itemString = `id:18014 `; iCumRate += 10;} //0.334224599몬고 모자
				case(162){itemString = `id:18000 `; iCumRate += 10;} //0.334224599토크 모자
				case(163){itemString = `id:16013 `; iCumRate += 10;} //0.334224599검사의 글로브
				case(164){itemString = `id:16032 `; iCumRate += 10;} //0.334224599에르빙로브
				case(165){itemString = `id:63030 `; iCumRate += 10;} //0.334224599색지정 염색 앰플
				case(166){itemString = `id:85060 count:3`; iCumRate += 20;} //0.668449198새도우 크리스탈
				case(167){itemString = `id:85061 count:3`; iCumRate += 20;} //0.668449198고급 새도우 크리스탈
				case(168){itemString = `id:85062 count:3`; iCumRate += 20;} //0.668449198최고급 새도우 크리스탈
				case(169){itemString = `id:18112 `; iCumRate += 20;} //0.668449198태양의 출석 간판
				case(170){itemString = `id:18111 `; iCumRate += 20;} //0.668449198나무의 출석 간판
				case(171){itemString = `id:18110 `; iCumRate += 20;} //0.668449198풀의 출석 간판
				case(172){itemString = `id:18109 `; iCumRate += 20;} //0.668449198나오의 출석 간판
				case(173){itemString = `id:18108 `; iCumRate += 20;} //0.668449198바위의 출석 간판
				case(174){itemString = `id:18029 `; iCumRate += 20;} //0.668449198나무의 안경
				case(175){itemString = `id:18028 `; iCumRate += 20;} //0.668449198접이식 안경
				case(176){itemString = `id:19008 `; iCumRate += 20;} //0.668449198코코 팬더 로브
				case(177){itemString = `id:19009 `; iCumRate += 20;} //0.668449198코코 래빗 로브
				case(178){itemString = `id:19017 `; iCumRate += 20;} //0.668449198늑대 로브
				case(179){itemString = `id:19016 `; iCumRate += 20;} //0.668449198쿠마로브
				case(180){itemString = `id:40053 `; iCumRate += 20;} //0.668449198보라색의 장미의 꽃다발
				case(181){itemString = `id:40051 `; iCumRate += 20;} //0.668449198보라색의 장미 1개
				case(182){itemString = `id:18089 `; iCumRate += 20;} //0.668449198보라색의 장미의 장식
				case(183){itemString = `id:40054 `; iCumRate += 20;} //0.668449198푸른 장미의 꽃다발
				case(184){itemString = `id:40052 `; iCumRate += 20;} //0.668449198푸른 장미 1개
				case(185){itemString = `id:16500 `; iCumRate += 20;} //0.668449198우르나프로테크타그로브
				case(186){itemString = `id:19020 `; iCumRate += 20;} //0.668449198나타네모후모후파코트
				case(187){itemString = `id:62005 prefix:7 `; iCumRate += 20;} //0.668449198엔챤트(폭스 헌터)
				case(188){itemString = `id:16520 `; iCumRate += 20;} //0.668449198롱 레더 글로브
				case(189){itemString = `id:15128 `; iCumRate += 20;} //0.668449198투톤 옥석 드레스
				case(190){itemString = `id:16019 `; iCumRate += 20;} //0.668449198스트라이프 글로브
				case(191){itemString = `id:18047 `; iCumRate += 20;} //0.668449198코레스페르트 모자
				case(192){itemString = `id:18008 `; iCumRate += 20;} //0.668449198스트라이프 캡
				case(193){itemString = `id:15025 `; iCumRate += 20;} //0.668449198마법 학교 여학생옷
				case(194){itemString = `id:18043 `; iCumRate += 20;} //0.668449198코레스닛트 모자
				case(195){itemString = `id:18026 `; iCumRate += 20;} //0.668449198몬고 상인 모자
				case(196){itemString = `id:15052 `; iCumRate += 20;} //0.668449198타크스트톤체닉크
				case(197){itemString = `id:19005 `; iCumRate += 20;} //0.668449198머플러 로브
				case(198){itemString = `id:18040 `; iCumRate += 20;} //0.668449198코레스베레이모
				case(199){itemString = `id:18038 `; iCumRate += 20;} //0.668449198날개 다해 베레모
				case(200){itemString = `id:15042 `; iCumRate += 20;} //0.668449198롱 넥 원피스
				case(201){itemString = `id:63025 count:3`; iCumRate += 20;} //0.668449198대용량 축복 일부
				case(202){itemString = `id:51031 count:3`; iCumRate += 20;} //0.668449198완전 회복 일부
				case(203){itemString = `id:51036 `; iCumRate += 20;} //0.668449198다이어트 일부 U
				case(204){itemString = `id:51038 `; iCumRate += 20;} //0.668449198다이어트 일부 L
				case(205){itemString = `id:51039 `; iCumRate += 20;} //0.668449198다이어트 일부 F
				case(206){itemString = `id:17006 `; iCumRate += 20;} //0.668449198옷감의 구두
				case(207){itemString = `id:18086 `; iCumRate += 20;} //0.668449198데이지의 장식
				case(208){itemString = `id:18087 `; iCumRate += 20;} //0.668449198장미의 장식
				case(209){itemString = `id:18088 `; iCumRate += 20;} //0.668449198꽃의 관
				case(210){itemString = `id:18090 `; iCumRate += 20;} //0.668449198푸른 장미의 장식
				case(211){itemString = `id:40046 `; iCumRate += 20;} //0.668449198장미
				case(212){itemString = `id:40047 `; iCumRate += 20;} //0.668449198장미의 꽃다발
				case(213){itemString = `id:18541 `; iCumRate += 20;} //0.668449198하게즈라
				case(214){itemString = `id:18103 `; iCumRate += 20;} //0.668449198종이 모자
				case(215){itemString = `id:60037 count:5`; iCumRate += 20;} //0.668449198블랙 유스 일부
				case(216){itemString = `id:60038 count:5`; iCumRate += 20;} //0.668449198레드 유스 일부
				case(217){itemString = `id:18010 `; iCumRate += 20;} //0.668449198몬고스마트캐프
				case(218){itemString = `id:17016 `; iCumRate += 20;} //0.668449198필드 컴배트 슈즈
				case(219){itemString = `id:17015 `; iCumRate += 20;} //0.668449198컴배트 슈즈
				case(220){itemString = `id:17005 `; iCumRate += 20;} //0.668449198헌터 부츠
				case(221){itemString = `id:17002 `; iCumRate += 20;} //0.668449198검사의 구두
				case(222){itemString = `id:17022 `; iCumRate += 20;} //0.668449198레더 부츠
				case(223){itemString = `id:17001 `; iCumRate += 20;} //0.668449198가죽의 부츠
				case(224){itemString = `id:17007 `; iCumRate += 20;} //0.668449198가죽 슈즈
				case(225){itemString = `id:16009 `; iCumRate += 20;} //0.668449198토크 헌터 글로브
				case(226){itemString = `id:15031 `; iCumRate += 20;} //0.668449198마법 학교 남학생옷
				case(227){itemString = `id:19012 `; iCumRate += 20;} //0.668449198트르디레이야드로브
				case(228){itemString = `id:18004 `; iCumRate += 20;} //0.668449198몬고팟션 모자
				case(229){itemString = `id:15132 `; iCumRate += 20;} //0.668449198내츄럴 베스트 웨어
				case(230){itemString = `id:15043 `; iCumRate += 20;} //0.668449198스포츠웨어 세트
				case(231){itemString = `id:17017 `; iCumRate += 20;} //0.668449198피혁제 코트 슈즈
				case(232){itemString = `id:16006 `; iCumRate += 20;} //0.668449198가디안 글로브
				case(233){itemString = `id:16017 `; iCumRate += 20;} //0.668449198스탠다드 글로브
				case(234){itemString = `id:17060 `; iCumRate += 20;} //0.668449198산드라스나이파브트(남성용)
				case(235){itemString = `id:17061 `; iCumRate += 20;} //0.668449198산드라스나이파브트(여성용)
				case(236){itemString = `id:17019 `; iCumRate += 20;} //0.668449198대장간의 구두
				case(237){itemString = `id:17067 `; iCumRate += 20;} //0.668449198X정체 슈즈
				case(238){itemString = `id:17008 `; iCumRate += 20;} //0.668449198코레스브트(여성용)
				case(239){itemString = `id:17010 `; iCumRate += 20;} //0.668449198코레스브트(남성용)
				case(240){itemString = `id:17023 `; iCumRate += 20;} //0.668449198에나멜구두
				case(241){itemString = `id:16031 `; iCumRate += 20;} //0.668449198쓰리 라인 타이트 글로브
				case(242){itemString = `id:16026 `; iCumRate += 20;} //0.668449198산드라스나이파그로브
				case(243){itemString = `id:16016 `; iCumRate += 20;} //0.668449198라이트 글로브
				case(244){itemString = `id:17003 `; iCumRate += 20;} //0.668449198가죽 슈즈(남성용)
				case(245){itemString = `id:17024 `; iCumRate += 20;} //0.668449198하이 힐 샌들
				case(246){itemString = `id:17013 `; iCumRate += 20;} //0.668449198후저샌들
				case(247){itemString = `id:17069 `; iCumRate += 20;} //0.668449198레오 슈즈
				case(248){itemString = `id:15020 `; iCumRate += 20;} //0.668449198코레스히라드레스
				case(249){itemString = `id:15044 `; iCumRate += 20;} //0.668449198목수 요우사쿠업복
				case(250){itemString = `id:15041 `; iCumRate += 20;} //0.668449198사무직용 슈트
				case(251){itemString = `id:15027 `; iCumRate += 20;} //0.668449198몬고롱스카트
				case(252){itemString = `id:15018 `; iCumRate += 20;} //0.668449198몬고 여행옷(여성용)
				case(253){itemString = `id:15033 `; iCumRate += 20;} //0.668449198몬고 여행옷(남성용)
				case(254){itemString = `id:15023 `; iCumRate += 20;} //0.668449198토크 헌터 슈트(여성용)
				case(255){itemString = `id:15035 `; iCumRate += 20;} //0.668449198토크 헌터 슈트(남성용)
				case(256){itemString = `id:19003 `; iCumRate += 20;} //0.668449198트리코롤 로브
				case(257){itemString = `id:63024 `; iCumRate += 20;} //0.668449198염색 앰플
				case(258){itemString = `id:18002 `; iCumRate += 20;} //0.668449198몬고캐프
				case(259){itemString = `id:18007 `; iCumRate += 20;} //0.668449198포포캐프
				case(260){itemString = `id:18013 `; iCumRate += 20;} //0.668449198코레 strikebreaker
				case(261){itemString = `id:18156 `; iCumRate += 20;} //0.668449198큐아레스고굴  카스 모포
				case(262){itemString = `id:18042 `; iCumRate += 20;} //0.668449198코레스오리엔타르핫트
				case(263){itemString = `id:18003 `; iCumRate += 20;} //0.668449198리리나캐프
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
//					GiveGachaphonCoupon1(player,itemRate) extern (`data/script/event/useitem_event.mint`);
//				}
				return;
			}
			++i;
		}
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
	}
	else if (GetLocale().LowerCase() == `japan` || GetLocale().LowerCase() == `korea` && IsDevelopment())	// 샤나 아이템 추가
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int totalRate = 2932;
		int tempRate = 0;
		int itemRate = 0;
		int i=0;
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
				case(0){itemString = `id:19083 `; iCumRate +=2;} //0.068212824개구리의 레인코트
				case(1){itemString = `id:15595 `; iCumRate +=2;} //0.068212824스위스의 민족 의상 (남성용)
				case(2){itemString = `id:15594 `; iCumRate +=2;} //0.068212824스위스의 민족 의상 (여성용)
				case(3){itemString = `id:18312 `; iCumRate +=2;} //0.068212824스위스의 민족 모자 (남성용)
				case(4){itemString = `id:18313 `; iCumRate +=2;} //0.068212824스위스의 민족 모자 (여성용)
				case(5){itemString = `id:17231 `; iCumRate +=2;} //0.068212824스위스의 민족구두  (남성용)
				case(6){itemString = `id:17232 `; iCumRate +=2;} //0.068212824스위스의 민족구두  (여성용)
				case(7){itemString = `id:15555 `; iCumRate +=2;} //0.068212824바날렌 여성용 예복
				case(8){itemString = `id:15556 `; iCumRate +=2;} //0.068212824바날렌 남성용 예복
				case(9){itemString = `id:16065 `; iCumRate +=2;} //0.068212824바날렌 더블 브레이슬렛
				case(10){itemString = `id:17212 `; iCumRate +=2;} //0.068212824바날렌 리본 부츠
				case(11){itemString = `id:17213 `; iCumRate +=2;} //0.068212824바날렌 꽃문양 샌들
				case(12){itemString = `id:18582 `; iCumRate +=3;} //0.102319236헤드 드레서
				case(13){itemString = `id:15408 `; iCumRate +=3;} //0.102319236네글리제
				case(14){itemString = `id:17158 `; iCumRate +=3;} //0.102319236슬리퍼
				case(15){itemString = `id:15406 `; iCumRate +=3;} //0.102319236캐주얼 정장 A
				case(16){itemString = `id:15407 `; iCumRate +=3;} //0.102319236캐주얼 정장 B
				case(17){itemString = `id:15267 `; iCumRate +=3;} //0.102319236테라 고딕 풀 드레스
				case(18){itemString = `id:15268 `; iCumRate +=3;} //0.102319236테라 고딕 펑크 수트
				case(19){itemString = `id:15233 `; iCumRate +=3;} //0.102319236엘레건트 고딕 드레스(롱타입)
				case(20){itemString = `id:15235 `; iCumRate +=3;} //0.102319236엘레건트 고딕 드레스(숏타입)
				case(21){itemString = `id:15234 `; iCumRate +=3;} //0.102319236엘레건트 고딕 슈트
				case(22){itemString = `id:15217 `; iCumRate +=3;} //0.102319236에이프런 원피스
				case(23){itemString = `id:15315 `; iCumRate +=3;} //0.102319236아스틴 댄디 수트
				case(24){itemString = `id:18227 `; iCumRate +=3;} //0.102319236아스틴 캡
				case(25){itemString = `id:16053 `; iCumRate +=3;} //0.102319236아스틴 글로브
				case(26){itemString = `id:17126 `; iCumRate +=3;} //0.102319236아스틴 슈즈
				case(27){itemString = `id:15314 `; iCumRate +=3;} //0.102319236비앙카 윙 볼레로
				case(28){itemString = `id:18226 `; iCumRate +=3;} //0.102319236비앙카 캡
				case(29){itemString = `id:16052 `; iCumRate +=3;} //0.102319236비앙카 롱 글러브
				case(30){itemString = `id:17125 `; iCumRate +=3;} //0.102319236비앙카 리본 부츠
				case(31){itemString = `id:15338 `; iCumRate +=3;} //0.102319236로맨틱 이브닝 드레스
				case(32){itemString = `id:15339 `; iCumRate +=3;} //0.102319236로맨틱 테일 코트
				case(33){itemString = `id:17135 `; iCumRate +=3;} //0.102319236에나멜 펌프스
				case(34){itemString = `id:17136 `; iCumRate +=3;} //0.102319236클래식 슈즈
				case(35){itemString = `id:15305 `; iCumRate +=3;} //0.102319236보니타 실키 드레스
				case(36){itemString = `id:15306 `; iCumRate +=3;} //0.102319236트루디 빈티지 웨어
				case(37){itemString = `id:16047 `; iCumRate +=3;} //0.102319236보니타 실키 글러브
				case(38){itemString = `id:16050 `; iCumRate +=3;} //0.102319236트루디 포버튼 글러브
				case(39){itemString = `id:17120 `; iCumRate +=3;} //0.102319236보니타 플룸 앵클 부츠
				case(40){itemString = `id:17121 `; iCumRate +=3;} //0.102319236트루디 슈즈
				case(41){itemString = `id:18213 `; iCumRate +=3;} //0.102319236보니타 트윈 리본
				case(42){itemString = `id:18214 `; iCumRate +=3;} //0.102319236트루디 빈티지 터번
				case(43){itemString = `id:15250 `; iCumRate +=3;} //0.102319236메이드 의상 롱 타입
				case(44){itemString = `id:15251 `; iCumRate +=3;} //0.102319236메이드 의상 쇼트 타입
				case(45){itemString = `id:15252 `; iCumRate +=3;} //0.102319236집사 의상
				case(46){itemString = `id:18176 `; iCumRate +=3;} //0.102319236메이드 머리띠
				case(47){itemString = `id:15079 `; iCumRate +=3;} //0.102319236볼레로 앤 점퍼 스커트
				case(48){itemString = `id:15117 suffix:31202`; iCumRate +=3;} //0.102319236남성용 마법사 정장（자칼）
				case(49){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.102319236남성용 마법사 정장（새끼너구리）
				case(50){itemString = `id:15116 suffix:31202`; iCumRate +=3;} //0.102319236여성용 마법사 정장（자칼）
				case(51){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.102319236여성용 마법사 정장（새끼너구리）
				case(52){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate +=4;} //0.136425648몬거 마법사모자
				case(53){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648몬거 넓은챙 마법사 모자
				case(54){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate +=4;} //0.136425648티핑 수트
				case(55){itemString = `id:15260 `; iCumRate +=4;} //0.136425648다비 스컷 플래드 웨어(남성용)
				case(56){itemString = `id:15261 `; iCumRate +=4;} //0.136425648다비 스컷 플래드 웨어(여성용)
				case(57){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate +=4;} //0.136425648레이스 플래킷 예복
				case(58){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648핀 에이프런 스커트
				case(59){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648오델리아 위자드 슈트
				case(60){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648아도라 네추럴 네크라인
				case(61){itemString = `id:15113 `; iCumRate +=4;} //0.136425648여성용 검사학교 교복 쇼트타입
				case(62){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648여성용 검사학교 교복 롱타입
				case(63){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648남성용 검사학교 교복 쇼트타입
				case(64){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate +=4;} //0.136425648트루디 모카신 부츠
				case(65){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate +=4;} //0.136425648원 버튼 앵글 슈즈
				case(66){itemString = `id:15065 `; iCumRate +=4;} //0.136425648엘라 베스트 스커트
				case(67){itemString = `id:63034 col1:c00000`; iCumRate +=4;} //0.136425648붉은색 염색 앰플(색 지정)
				case(68){itemString = `id:63033 col1:000000`; iCumRate +=4;} //0.136425648검은색 염색 앰플(색 지정)
				case(69){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648재기드 미니 스커트
				case(70){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=4;} //0.136425648차이나드레스
				case(71){itemString = `id:18044 `; iCumRate +=4;} //0.136425648범죄용 복면
				case(72){itemString = `id:16519 `; iCumRate +=4;} //0.136425648초호화 장갑
				case(73){itemString = `id:18046 `; iCumRate +=4;} //0.136425648왕관형 머리장식
				case(74){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=4;} //0.136425648클래식 슬리브 웨어
				case(75){itemString = `id:15060 `; iCumRate +=4;} //0.136425648슬림 이너로브 웨어
				case(76){itemString = `id:17041 `; iCumRate +=4;} //0.136425648덩굴무늬 헌팅부츠
				case(77){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648아이돌 리본 드레스
				case(78){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648스탠드칼라 슬리브리스
				case(79){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=4;} //0.136425648야광 머플러 로브
				case(80){itemString = `id:18060 `; iCumRate +=4;} //0.136425648털 토끼 머리띠5
				case(81){itemString = `id:18065 `; iCumRate +=4;} //0.136425648가죽 토끼 머리띠5
				case(82){itemString = `id:18070 `; iCumRate +=4;} //0.136425648별 토끼 머리띠5
				case(83){itemString = `id:18051 `; iCumRate +=4;} //0.136425648코레스 리본 모자
				case(84){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate +=4;} //0.136425648코레스 닌자슈트
				case(85){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=4;} //0.136425648동양풍 무사복
				case(86){itemString = `id:15396 `; iCumRate +=4;} //0.136425648엘리네드 티어드 수트
				case(87){itemString = `id:15397 `; iCumRate +=4;} //0.136425648엘리네드 머터니티 수트
				case(88){itemString = `id:15398 `; iCumRate +=4;} //0.136425648엘리네드 미디벌 자켓
				case(89){itemString = `id:15399 `; iCumRate +=4;} //0.136425648엘리네드 카발리에 수트
				case(90){itemString = `id:15401 `; iCumRate +=4;} //0.136425648엘리네드 레이어드 드레스
				case(91){itemString = `id:15402 `; iCumRate +=4;} //0.136425648엘리네드 머터니티 드레스
				case(92){itemString = `id:15403 `; iCumRate +=4;} //0.136425648엘리네드 멍크 투피스
				case(93){itemString = `id:15404 `; iCumRate +=4;} //0.136425648엘리네드 소버 드레스
				case(94){itemString = `id:60001 suffix:10702`; iCumRate +=10;} //0.34106412재봉키트（허수아비）
				case(95){itemString = `id:18016 suffix:10702`; iCumRate +=10;} //0.34106412모자（허수아비）
				case(96){itemString = `id:16001 suffix:10702`; iCumRate +=10;} //0.34106412퀼팅 글러브（허수아비）
				case(97){itemString = `id:16019 suffix:10702`; iCumRate +=10;} //0.34106412줄무늬 팔목 장갑（허수아비）
				case(98){itemString = `id:17003 suffix:10702`; iCumRate +=10;} //0.34106412가죽 신발 남자용（허수아비）
				case(99){itemString = `id:17007 suffix:10702`; iCumRate +=10;} //0.34106412가죽 신발 여자용（허수아비）
				case(100){itemString = `id:15000 suffix:10702`; iCumRate +=10;} //0.34106412포포 셔츠와 바지（허수아비）
				case(101){itemString = `id:15022 suffix:10702`; iCumRate +=10;} //0.34106412포포 스커트（허수아비）
				case(102){itemString = `id:63069 `; iCumRate +=10;} //0.34106412금속 염색 앰플
				case(103){itemString = `id:15055 `; iCumRate +=10;} //0.34106412레더 미니 원피스
				case(104){itemString = `id:62005 suffix:30501`; iCumRate +=10;} //0.34106412인챈트（자이언트）
				case(105){itemString = `id:62005 suffix:30302`; iCumRate +=10;} //0.34106412인챈트（코볼트）
				case(106){itemString = `id:46006 `; iCumRate +=10;} //0.34106412카이트 실드
				case(107){itemString = `id:15053 `; iCumRate +=10;} //0.34106412플랫칼라 원피스
				case(108){itemString = `id:15134 `; iCumRate +=10;} //0.34106412고딕 베이직 수트
				case(109){itemString = `id:15136 `; iCumRate +=10;} //0.34106412고딕 레이스 스커트
				case(110){itemString = `id:15063 `; iCumRate +=10;} //0.34106412레이어드 프릴 원피스
				case(111){itemString = `id:15108 `; iCumRate +=10;} //0.34106412섹시 레이디스 탱크탑
				case(112){itemString = `id:15059 `; iCumRate +=10;} //0.34106412터크스 탱크탑 반바지
				case(113){itemString = `id:15112 `; iCumRate +=10;} //0.34106412셀리나 스쿨보이룩
				case(114){itemString = `id:17042 `; iCumRate +=10;} //0.34106412코레스 오리엔탈 롱 부츠
				case(115){itemString = `id:15074 `; iCumRate +=10;} //0.34106412루이스 성직자 코트
				case(116){itemString = `id:15061 `; iCumRate +=10;} //0.34106412물결무늬 옆트임 튜닉
				case(117){itemString = `id:17040 `; iCumRate +=10;} //0.34106412엘라 스트랩 부츠
				case(118){itemString = `id:18525 `; iCumRate +=10;} //0.34106412워터드롭 캡
				case(119){itemString = `id:15014 `; iCumRate +=10;} //0.34106412파발꾼의 옷
				case(120){itemString = `id:18113 `; iCumRate +=10;} //0.34106412뾰족귀 고양이 모자
				case(121){itemString = `id:18114 `; iCumRate +=10;} //0.34106412줄무늬 고양이 모자
				case(122){itemString = `id:18115 `; iCumRate +=10;} //0.34106412핀 고양이 모자
				case(123){itemString = `id:62005 suffix:30702`; iCumRate +=10;} //0.34106412인챈트（레이븐）
				case(124){itemString = `id:62005 prefix:207`; iCumRate +=10;} //0.34106412인챈트（폭스）
				case(125){itemString = `id:63030 col1:ffffff`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(126){itemString = `id:63030 col1:00c000`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(127){itemString = `id:63030 col1:0000c0`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(128){itemString = `id:63030 col1:c0c000`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(129){itemString = `id:63030 col1:c000c0`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(130){itemString = `id:63030 col1:00c0c0`; iCumRate +=10;} //0.34106412지정 색상 염색 앰플（색 지정）
				case(131){itemString = `id:63030 col1:8673c4`; iCumRate +=10;} //0.34106412지정염색앰플
				case(132){itemString = `id:63030 col1:f9a6fc`; iCumRate +=10;} //0.34106412지정염색앰플
				case(133){itemString = `id:63030 col1:5dabf0`; iCumRate +=10;} //0.34106412지정염색앰플
				case(134){itemString = `id:63030 col1:1da597`; iCumRate +=10;} //0.34106412지정염색앰플
				case(135){itemString = `id:63030 col1:ff8600`; iCumRate +=10;} //0.34106412지정염색앰플
				case(136){itemString = `id:63030 col1:60400f0d`; iCumRate +=10;} //0.34106412지정염색앰플
				case(137){itemString = `id:63030 col1:60401d1f`; iCumRate +=10;} //0.34106412지정염색앰플
				case(138){itemString = `id:63030 col1:2cfbb6`; iCumRate +=10;} //0.34106412지정염색앰플
				case(139){itemString = `id:63030 col1:74fbff`; iCumRate +=10;} //0.34106412지정염색앰플
				case(140){itemString = `id:63030 col1:ff27a8`; iCumRate +=10;} //0.34106412지정염색앰플
				case(141){itemString = `id:63030 col1:ffff00`; iCumRate +=10;} //0.34106412지정염색앰플
				case(142){itemString = `id:63030 col1:bd00c0`; iCumRate +=10;} //0.34106412지정염색앰플
				case(143){itemString = `id:63030 col1:ffffd4`; iCumRate +=10;} //0.34106412지정염색앰플
				case(144){itemString = `id:15029 `; iCumRate +=10;} //0.34106412토크 대장장이옷
				case(145){itemString = `id:15151 `; iCumRate +=10;} //0.34106412뉴욕마리오 웨이스트 테일러 웨어（남성용）
				case(146){itemString = `id:15152 `; iCumRate +=10;} //0.34106412뉴욕마리오 웨이스트 테일러 웨어（여성용）
				case(147){itemString = `id:15153 `; iCumRate +=10;} //0.34106412산드라 스나이퍼 수트（남성용）
				case(148){itemString = `id:15154 `; iCumRate +=10;} //0.34106412산드라 스나이퍼 수트（여성용）
				case(149){itemString = `id:15032 `; iCumRate +=10;} //0.34106412리리나 반바지
				case(150){itemString = `id:15026 `; iCumRate +=10;} //0.34106412리리나 롱스커트
				case(151){itemString = `id:15016 `; iCumRate +=10;} //0.34106412의장용 스타킹 유니폼
				case(152){itemString = `id:15051 `; iCumRate +=10;} //0.34106412타이트 벨트 웨어
				case(153){itemString = `id:15008 `; iCumRate +=10;} //0.34106412검사학교 교복
				case(154){itemString = `id:15212 `; iCumRate +=10;} //0.34106412콜린 하저 웨어
				case(155){itemString = `id:15137 `; iCumRate +=10;} //0.34106412셀리나 하프 재킷 코트
				case(156){itemString = `id:15127 `; iCumRate +=10;} //0.34106412셀리나 트래디셔널 코트
				case(157){itemString = `id:19031 `; iCumRate +=10;} //0.34106412스타 라이트 로브
				case(158){itemString = `id:18011 `; iCumRate +=10;} //0.34106412몬거 제스터 캡
				case(159){itemString = `id:18124 `; iCumRate +=10;} //0.34106412산드라 스나이퍼 수트 캡
				case(160){itemString = `id:18009 `; iCumRate +=10;} //0.34106412몬거 아쳐 캡
				case(161){itemString = `id:18014 `; iCumRate +=10;} //0.34106412몬거 모자
				case(162){itemString = `id:18000 `; iCumRate +=10;} //0.34106412토크 모자
				case(163){itemString = `id:16013 `; iCumRate +=10;} //0.34106412검사 장갑
				case(164){itemString = `id:16032 `; iCumRate +=10;} //0.34106412엘빈 글러브
				case(165){itemString = `id:63030 `; iCumRate +=10;} //0.34106412지정 색상 염색 앰플
				case(166){itemString = `id:18112 `; iCumRate +=20;} //0.68212824해 분장 소품
				case(167){itemString = `id:18111 `; iCumRate +=20;} //0.68212824나무 분장 소품
				case(168){itemString = `id:18110 `; iCumRate +=20;} //0.68212824덤불 분장 소품
				case(169){itemString = `id:18109 `; iCumRate +=20;} //0.68212824나오 분장 소품
				case(170){itemString = `id:18108 `; iCumRate +=20;} //0.68212824바위 분장 소품
				case(171){itemString = `id:18029 `; iCumRate +=20;} //0.68212824나무테 안경
				case(172){itemString = `id:18028 `; iCumRate +=20;} //0.68212824접이식 안경
				case(173){itemString = `id:19008 `; iCumRate +=20;} //0.68212824코코 판다 로브
				case(174){itemString = `id:19009 `; iCumRate +=20;} //0.68212824코코 래빗 로브
				case(175){itemString = `id:19017 `; iCumRate +=20;} //0.68212824늑대 로브
				case(176){itemString = `id:19016 `; iCumRate +=20;} //0.68212824곰 로브
				case(177){itemString = `id:40053 `; iCumRate +=20;} //0.68212824보라빛 장미 꽃다발
				case(178){itemString = `id:40051 `; iCumRate +=20;} //0.68212824보라빛 장미 한송이
				case(179){itemString = `id:18089 `; iCumRate +=20;} //0.68212824보라빛 장미 장식
				case(180){itemString = `id:40054 `; iCumRate +=20;} //0.68212824파란 장미 꽃다발
				case(181){itemString = `id:40052 `; iCumRate +=20;} //0.68212824파란 장미 한송이
				case(182){itemString = `id:16500 `; iCumRate +=20;} //0.68212824울나 프로텍터 글러브
				case(183){itemString = `id:19020 `; iCumRate +=20;} //0.68212824나타네 설산용 코트
				case(184){itemString = `id:62005 prefix:7 `; iCumRate +=20;} //0.68212824인챈트（폭스헌터）
				case(185){itemString = `id:16520 `; iCumRate +=20;} //0.68212824롱 레더 글러브
				case(186){itemString = `id:15128 `; iCumRate +=20;} //0.68212824투 톤 비조 드레스
				case(187){itemString = `id:16019 `; iCumRate +=20;} //0.68212824줄무늬 팔목 장갑
				case(188){itemString = `id:18047 `; iCumRate +=20;} //0.68212824코레스 펠트 모자
				case(189){itemString = `id:18008 `; iCumRate +=20;} //0.68212824스트라이프 캡
				case(190){itemString = `id:15025 `; iCumRate +=20;} //0.68212824마법학교 여자교복
				case(191){itemString = `id:18043 `; iCumRate +=20;} //0.68212824코레스 니트 모자
				case(192){itemString = `id:18026 `; iCumRate +=20;} //0.68212824몬거 상인모자
				case(193){itemString = `id:15052 `; iCumRate +=20;} //0.68212824터크스 투톤 튜닉
				case(194){itemString = `id:19005 `; iCumRate +=20;} //0.68212824머플러 로브
				case(195){itemString = `id:18040 `; iCumRate +=20;} //0.68212824코레스 꼭지 베레모
				case(196){itemString = `id:18038 `; iCumRate +=20;} //0.68212824깃털 배렛 모자
				case(197){itemString = `id:15042 `; iCumRate +=20;} //0.68212824롱넥 원피스
				case(198){itemString = `id:63025 count:3`; iCumRate +=20;} //0.68212824대용량 축복의 포션
				case(199){itemString = `id:51031 count:3`; iCumRate +=20;} //0.68212824완전 회복의 포션
				case(200){itemString = `id:51036 `; iCumRate +=20;} //0.68212824다이어트 포션 U
				case(201){itemString = `id:51038 `; iCumRate +=20;} //0.68212824다이어트 포션 L
				case(202){itemString = `id:51039 `; iCumRate +=20;} //0.68212824다이어트 포션 F
				case(203){itemString = `id:17006 `; iCumRate +=20;} //0.68212824천신발
				case(204){itemString = `id:18086 `; iCumRate +=20;} //0.68212824데이지 꽃 장식
				case(205){itemString = `id:18087 `; iCumRate +=20;} //0.68212824장미 꽃 장식
				case(206){itemString = `id:18088 `; iCumRate +=20;} //0.68212824화관
				case(207){itemString = `id:18090 `; iCumRate +=20;} //0.68212824파란 장미 장식
				case(208){itemString = `id:40046 `; iCumRate +=20;} //0.68212824장미 한송이
				case(209){itemString = `id:40047 `; iCumRate +=20;} //0.68212824장미 꽃다발
				case(210){itemString = `id:18541 `; iCumRate +=20;} //0.68212824대머리 가발
				case(211){itemString = `id:18103 `; iCumRate +=20;} //0.68212824종이 모자
				case(212){itemString = `id:60037 count:5`; iCumRate +=20;} //0.68212824블랙 유스 포션
				case(213){itemString = `id:60038 count:5`; iCumRate +=20;} //0.68212824레드 포션
				case(214){itemString = `id:18010 `; iCumRate +=20;} //0.68212824몬거 스마트 캡
				case(215){itemString = `id:17016 `; iCumRate +=20;} //0.68212824필드 컴뱃슈즈
				case(216){itemString = `id:17015 `; iCumRate +=20;} //0.68212824컴뱃슈즈
				case(217){itemString = `id:17005 `; iCumRate +=20;} //0.68212824사냥꾼 신발
				case(218){itemString = `id:17002 `; iCumRate +=20;} //0.68212824검사 신발
				case(219){itemString = `id:17022 `; iCumRate +=20;} //0.68212824레더부츠
				case(220){itemString = `id:17001 `; iCumRate +=20;} //0.68212824가죽 부츠
				case(221){itemString = `id:17007 `; iCumRate +=20;} //0.68212824가죽 구두
				case(222){itemString = `id:16009 `; iCumRate +=20;} //0.68212824사냥꾼장갑
				case(223){itemString = `id:15031 `; iCumRate +=20;} //0.68212824마법학교의 남자 교복
				case(224){itemString = `id:19012 `; iCumRate +=20;} //0.68212824트루디 레이어드 로브
				case(225){itemString = `id:18004 `; iCumRate +=20;} //0.68212824몬거 패션모자
				case(226){itemString = `id:15132 `; iCumRate +=20;} //0.68212824내추럴 베스트 웨어
				case(227){itemString = `id:15043 `; iCumRate +=20;} //0.68212824스포티 웨어세트
				case(228){itemString = `id:17017 `; iCumRate +=20;} //0.68212824레더코트 슈즈
				case(229){itemString = `id:16006 `; iCumRate +=20;} //0.68212824가디언 장갑
				case(230){itemString = `id:16017 `; iCumRate +=20;} //0.68212824스탠다드 글러브
				case(231){itemString = `id:17060 `; iCumRate +=20;} //0.68212824산드라 스나이퍼 수트 부츠(남성용)
				case(232){itemString = `id:17061 `; iCumRate +=20;} //0.68212824산드라 스나이퍼 수트 부츠(여성용)
				case(233){itemString = `id:17019 `; iCumRate +=20;} //0.68212824대장장이 신발
				case(234){itemString = `id:17067 `; iCumRate +=20;} //0.68212824엑스 타이 업 슈즈
				case(235){itemString = `id:17008 `; iCumRate +=20;} //0.68212824코레스 부츠（여성용）
				case(236){itemString = `id:17010 `; iCumRate +=20;} //0.68212824코레스 부츠（남성용）
				case(237){itemString = `id:17023 `; iCumRate +=20;} //0.68212824에나멜 신발
				case(238){itemString = `id:16031 `; iCumRate +=20;} //0.68212824쓰리라인 타이트 글러브
				case(239){itemString = `id:16026 `; iCumRate +=20;} //0.68212824산드라 스나이퍼 수트 글러브
				case(240){itemString = `id:16016 `; iCumRate +=20;} //0.68212824라이트 글러브
				case(241){itemString = `id:17003 `; iCumRate +=20;} //0.68212824가죽 신발（남성용）
				case(242){itemString = `id:17024 `; iCumRate +=20;} //0.68212824통굽 샌달
				case(243){itemString = `id:17013 `; iCumRate +=20;} //0.68212824두꺼운 샌달
				case(244){itemString = `id:17069 `; iCumRate +=20;} //0.68212824레오 슈즈
				case(245){itemString = `id:15020 `; iCumRate +=20;} //0.68212824코레스 힐러드레스
				case(246){itemString = `id:15044 `; iCumRate +=20;} //0.68212824목수용 작업복
				case(247){itemString = `id:15041 `; iCumRate +=20;} //0.68212824사무직 여성용 슈트
				case(248){itemString = `id:15027 `; iCumRate +=20;} //0.68212824몬거 롱스커트
				case(249){itemString = `id:15018 `; iCumRate +=20;} //0.68212824몬거 여행자옷（여성용）
				case(250){itemString = `id:15033 `; iCumRate +=20;} //0.68212824몬거 여행자옷(남성용）
				case(251){itemString = `id:15023 `; iCumRate +=20;} //0.68212824토크 사냥꾼옷（여성용）
				case(252){itemString = `id:15035 `; iCumRate +=20;} //0.68212824토크 사냥꾼옷（남성용）
				case(253){itemString = `id:19003 `; iCumRate +=20;} //0.68212824트리콜로르 로브
				case(254){itemString = `id:63024 `; iCumRate +=20;} //0.68212824염색 앰플
				case(255){itemString = `id:18002 `; iCumRate +=20;} //0.68212824몬거 캡
				case(256){itemString = `id:18007 `; iCumRate +=20;} //0.68212824포포 캡
				case(257){itemString = `id:18013 `; iCumRate +=20;} //0.68212824코레스 캡
				case(258){itemString = `id:18156 `; iCumRate +=20;} //0.68212824고글 모자
				case(259){itemString = `id:18042 `; iCumRate +=20;} //0.68212824코레스 동양식 모자
				case(260){itemString = `id:18003 `; iCumRate +=20;} //0.68212824리리나 캡
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
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
	}

	else // 일본 시몬 패션 가챠폰에서 사용중인 리뉴얼 리스트 타국가에서 사용할 때는 따로 작성해 주어야 함
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(2441);	//확률의 총합을 적는다 리뉴얼 이전 2091

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:18582 `; iCumRate +=2;} //0.081933634헤드 드레서
				case(1){itemString = `id:15408 `; iCumRate +=2;} //0.081933634네글리제
				case(2){itemString = `id:17158 `; iCumRate +=2;} //0.081933634슬리퍼
				case(3){itemString = `id:15406 `; iCumRate +=2;} //0.081933634캐주얼 정장 A
				case(4){itemString = `id:15407 `; iCumRate +=2;} //0.081933634캐주얼 정장 B
				case(5){itemString = `id:15267 `; iCumRate +=3;} //0.122900451테라 고딕 풀 드레스
				case(6){itemString = `id:15268 `; iCumRate +=3;} //0.122900451테라 고딕 펑크 수트
				case(7){itemString = `id:15233 `; iCumRate +=3;} //0.122900451엘레건트 고딕 드레스(롱타입)
				case(8){itemString = `id:15235 `; iCumRate +=3;} //0.122900451엘레건트 고딕 드레스(숏타입)
				case(9){itemString = `id:15234 `; iCumRate +=3;} //0.122900451엘레건트 고딕 슈트
				case(10){itemString = `id:15217 `; iCumRate +=3;} //0.122900451에이프런 원피스
				case(11){itemString = `id:15315 `; iCumRate +=3;} //0.122900451아스틴 댄디 수트
				case(12){itemString = `id:18227 `; iCumRate +=3;} //0.122900451아스틴 캡
				case(13){itemString = `id:16053 `; iCumRate +=3;} //0.122900451아스틴 글로브
				case(14){itemString = `id:17126 `; iCumRate +=3;} //0.122900451아스틴 슈즈
				case(15){itemString = `id:15314 `; iCumRate +=3;} //0.122900451비앙카 윙 볼레로
				case(16){itemString = `id:18226 `; iCumRate +=3;} //0.122900451비앙카 캡
				case(17){itemString = `id:16052 `; iCumRate +=3;} //0.122900451비앙카 롱 글러브
				case(18){itemString = `id:17125 `; iCumRate +=3;} //0.122900451비앙카 리본 부츠
				case(19){itemString = `id:15338 `; iCumRate +=3;} //0.122900451로맨틱 이브닝 드레스
				case(20){itemString = `id:15339 `; iCumRate +=3;} //0.122900451로맨틱 테일 코트
				case(21){itemString = `id:17135 `; iCumRate +=3;} //0.122900451에나멜 펌프스
				case(22){itemString = `id:17136 `; iCumRate +=3;} //0.122900451클래식 슈즈
				case(23){itemString = `id:15305 `; iCumRate +=3;} //0.122900451보니타 실키 드레스
				case(24){itemString = `id:15306 `; iCumRate +=3;} //0.122900451트루디 빈티지 웨어
				case(25){itemString = `id:16047 `; iCumRate +=3;} //0.122900451보니타 실키 글러브
				case(26){itemString = `id:16050 `; iCumRate +=3;} //0.122900451트루디 포버튼 글러브
				case(27){itemString = `id:17120 `; iCumRate +=3;} //0.122900451보니타 플룸 앵클 부츠
				case(28){itemString = `id:17121 `; iCumRate +=3;} //0.122900451트루디 슈즈
				case(29){itemString = `id:18213 `; iCumRate +=3;} //0.122900451보니타 트윈 리본
				case(30){itemString = `id:18214 `; iCumRate +=3;} //0.122900451트루디 빈티지 터번
				case(31){itemString = `id:15250 `; iCumRate +=3;} //0.122900451메이드 의상 롱 타입
				case(32){itemString = `id:15251 `; iCumRate +=3;} //0.122900451메이드 의상 쇼트 타입
				case(33){itemString = `id:15252 `; iCumRate +=3;} //0.122900451집사 의상
				case(34){itemString = `id:18176 `; iCumRate +=3;} //0.122900451메이드 머리띠
				case(35){itemString = `id:15079 `; iCumRate +=3;} //0.122900451볼레로 앤 점퍼 스커트
				case(36){itemString = `id:15117 suffix:31202`; iCumRate +=3;} //0.122900451남성용 마법사 정장（자칼）
				case(37){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.122900451남성용 마법사 정장（새끼너구리）
				case(38){itemString = `id:15116 suffix:31202`; iCumRate +=3;} //0.122900451여성용 마법사 정장（자칼）
				case(39){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.122900451여성용 마법사 정장（새끼너구리）
				case(40){itemString = `id:18005 `; iCumRate +=4;} //0.163867268몬거 마법사 모자
				case(41){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268몬거 넓은 챙 마법사 모자
				case(42){itemString = `id:15109 durability:21000 durability_max:21000`; iCumRate +=4;} //0.163867268티핑 수트
				case(43){itemString = `id:15260 `; iCumRate +=4;} //0.163867268다비 스컷 플래드 웨어(남성용)
				case(44){itemString = `id:15261 `; iCumRate +=4;} //0.163867268다비 스컷 플래드 웨어(여성용)
				case(45){itemString = `id:15045 durability:24000 durability_max:24000`; iCumRate +=4;} //0.163867268레이스 플래킷 예복
				case(46){itemString = `id:15131 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268핀 에이프런 스커트
				case(47){itemString = `id:15259 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268오델리아 위자드 슈트
				case(48){itemString = `id:15180 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268아도라 네추럴 네크라인
				case(49){itemString = `id:15113 `; iCumRate +=4;} //0.163867268여성용 검사학교 교복 쇼트타입
				case(50){itemString = `id:15119 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268여성용 검사학교 교복 롱타입
				case(51){itemString = `id:15118 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268남성용 검사학교 교복 쇼트타입
				case(52){itemString = `id:17055 durability:14000 durability_max:14000`; iCumRate +=4;} //0.163867268트루디 모카신 부츠
				case(53){itemString = `id:17066 durability:13000 durability_max:13000`; iCumRate +=4;} //0.163867268원 버튼 앵글 슈즈
				case(54){itemString = `id:15065 `; iCumRate +=4;} //0.163867268엘라 베스트 스커트
				case(55){itemString = `id:63034 col1:c00000`; iCumRate +=4;} //0.163867268붉은색 염색 앰플(색 지정)
				case(56){itemString = `id:63033 col1:000000`; iCumRate +=4;} //0.163867268검은색 염색 앰플(색 지정)
				case(57){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268재기드 미니 스커트
				case(58){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=4;} //0.163867268차이나드레스
				case(59){itemString = `id:18044 `; iCumRate +=4;} //0.163867268범죄용 복면
				case(60){itemString = `id:16519 `; iCumRate +=4;} //0.163867268초호화 장갑
				case(61){itemString = `id:18046 `; iCumRate +=4;} //0.163867268왕관형 머리장식
				case(62){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=4;} //0.163867268클래식 슬리브 웨어
				case(63){itemString = `id:15060 `; iCumRate +=4;} //0.163867268슬림 이너로브 웨어
				case(64){itemString = `id:17041 `; iCumRate +=4;} //0.163867268덩굴무늬 헌팅부츠
				case(65){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268아이돌 리본 드레스
				case(66){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268스탠드칼라 슬리브리스
				case(67){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=4;} //0.163867268야광 머플러 로브
				case(68){itemString = `id:18060 `; iCumRate +=4;} //0.163867268털 토끼 머리띠5
				case(69){itemString = `id:18065 `; iCumRate +=4;} //0.163867268가죽 토끼 머리띠5
				case(70){itemString = `id:18070 `; iCumRate +=4;} //0.163867268별 토끼 머리띠5
				case(71){itemString = `id:18051 `; iCumRate +=4;} //0.163867268코레스 리본 모자
				case(72){itemString = `id:15019 durability:19000 durability_max:19000`; iCumRate +=4;} //0.163867268코레스 닌자슈트
				case(73){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=4;} //0.163867268동양풍 무사복
				case(74){itemString = `id:60001 suffix:10702`; iCumRate +=10;} //0.409668169재봉키트（허수아비）
				case(75){itemString = `id:18016 suffix:10702`; iCumRate +=10;} //0.409668169모자（허수아비）
				case(76){itemString = `id:16001 suffix:10702`; iCumRate +=10;} //0.409668169퀼팅 글러브（허수아비）
				case(77){itemString = `id:16019 suffix:10702`; iCumRate +=10;} //0.409668169줄무늬 팔목 장갑（허수아비）
				case(78){itemString = `id:17003 suffix:10702`; iCumRate +=10;} //0.409668169가죽 신발 남자용（허수아비）
				case(79){itemString = `id:17007 suffix:10702`; iCumRate +=10;} //0.409668169가죽 신발 여자용（허수아비）
				case(80){itemString = `id:15000 suffix:10702`; iCumRate +=10;} //0.409668169포포 셔츠와 바지（허수아비）
				case(81){itemString = `id:15022 suffix:10702`; iCumRate +=10;} //0.409668169포포 스커트（허수아비）
				case(82){itemString = `id:63069 `; iCumRate +=10;} //0.409668169금속 염색 앰플
				case(83){itemString = `id:15055 `; iCumRate +=10;} //0.409668169레더 미니 원피스
				case(84){itemString = `id:62005 suffix:30501`; iCumRate +=10;} //0.409668169인챈트（자이언트）
				case(85){itemString = `id:62005 suffix:30302`; iCumRate +=10;} //0.409668169인챈트（코볼트）
				case(86){itemString = `id:46006 `; iCumRate +=10;} //0.409668169카이트 실드
				case(87){itemString = `id:15053 `; iCumRate +=10;} //0.409668169플랫칼라 원피스
				case(88){itemString = `id:15134 `; iCumRate +=10;} //0.409668169고딕 베이직 수트
				case(89){itemString = `id:15136 `; iCumRate +=10;} //0.409668169고딕 레이스 스커트
				case(90){itemString = `id:15063 `; iCumRate +=10;} //0.409668169레이어드 프릴 원피스
				case(91){itemString = `id:15108 `; iCumRate +=10;} //0.409668169섹시 레이디스 탱크탑
				case(92){itemString = `id:15059 `; iCumRate +=10;} //0.409668169터크스 탱크탑 반바지
				case(93){itemString = `id:15112 `; iCumRate +=10;} //0.409668169셀리나 스쿨보이룩
				case(94){itemString = `id:17042 `; iCumRate +=10;} //0.409668169코레스 오리엔탈 롱 부츠
				case(95){itemString = `id:15074 `; iCumRate +=10;} //0.409668169루이스 성직자 코트
				case(96){itemString = `id:15061 `; iCumRate +=10;} //0.409668169물결무늬 옆트임 튜닉
				case(97){itemString = `id:17040 `; iCumRate +=10;} //0.409668169엘라 스트랩 부츠
				case(98){itemString = `id:18525 `; iCumRate +=10;} //0.409668169워터드롭 캡
				case(99){itemString = `id:15014 `; iCumRate +=10;} //0.409668169파발꾼의 옷
				case(100){itemString = `id:18113 `; iCumRate +=10;} //0.409668169뾰족귀 고양이 모자
				case(101){itemString = `id:18114 `; iCumRate +=10;} //0.409668169줄무늬 고양이 모자
				case(102){itemString = `id:18115 `; iCumRate +=10;} //0.409668169핀 고양이 모자
				case(103){itemString = `id:62005 suffix:30702`; iCumRate +=10;} //0.409668169인챈트（레이븐）
				case(104){itemString = `id:62005 prefix:207`; iCumRate +=10;} //0.409668169인챈트（폭스）
				case(105){itemString = `id:63030 col1:ffffff`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(106){itemString = `id:63030 col1:00c000`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(107){itemString = `id:63030 col1:0000c0`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(108){itemString = `id:63030 col1:c0c000`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(109){itemString = `id:63030 col1:c000c0`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(110){itemString = `id:63030 col1:00c0c0`; iCumRate +=10;} //0.409668169지정 색상 염색 앰플（색 지정）
				case(111){itemString = `id:15029 `; iCumRate +=10;} //0.409668169토크 대장장이옷
				case(112){itemString = `id:15151 `; iCumRate +=10;} //0.409668169뉴욕마리오 웨이스트 테일러 웨어（남성용）
				case(113){itemString = `id:15152 `; iCumRate +=10;} //0.409668169뉴욕마리오 웨이스트 테일러 웨어（여성용）
				case(114){itemString = `id:15153 `; iCumRate +=10;} //0.409668169산드라 스나이퍼 수트（남성용）
				case(115){itemString = `id:15154 `; iCumRate +=10;} //0.409668169산드라 스나이퍼 수트（여성용）
				case(116){itemString = `id:15032 `; iCumRate +=10;} //0.409668169리리나 반바지
				case(117){itemString = `id:15026 `; iCumRate +=10;} //0.409668169리리나 롱스커트
				case(118){itemString = `id:15016 `; iCumRate +=10;} //0.409668169의장용 스타킹 유니폼
				case(119){itemString = `id:15051 `; iCumRate +=10;} //0.409668169타이트 벨트 웨어
				case(120){itemString = `id:15008 `; iCumRate +=10;} //0.409668169검사학교 교복
				case(121){itemString = `id:15212 `; iCumRate +=10;} //0.409668169콜린 하저 웨어
				case(122){itemString = `id:15137 `; iCumRate +=10;} //0.409668169셀리나 하프 재킷 코트
				case(123){itemString = `id:15127 `; iCumRate +=10;} //0.409668169셀리나 트래디셔널 코트
				case(124){itemString = `id:19031 `; iCumRate +=10;} //0.409668169스타 라이트 로브
				case(125){itemString = `id:18011 `; iCumRate +=10;} //0.409668169몬거 제스터 캡
				case(126){itemString = `id:18124 `; iCumRate +=10;} //0.409668169산드라 스나이퍼 수트 캡
				case(127){itemString = `id:18009 `; iCumRate +=10;} //0.409668169몬거 아쳐 캡
				case(128){itemString = `id:18014 `; iCumRate +=10;} //0.409668169몬거 모자
				case(129){itemString = `id:18000 `; iCumRate +=10;} //0.409668169토크 모자
				case(130){itemString = `id:16013 `; iCumRate +=10;} //0.409668169검사 장갑
				case(131){itemString = `id:16032 `; iCumRate +=10;} //0.409668169엘빈 글러브
				case(132){itemString = `id:63030 `; iCumRate +=10;} //0.409668169지정 색상 염색 앰플
				case(133){itemString = `id:91006 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션10
				case(134){itemString = `id:91010 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션11
				case(135){itemString = `id:91011 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션12
				case(136){itemString = `id:91012 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션13
				case(137){itemString = `id:91013 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션14
				case(138){itemString = `id:91014 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션15
				case(139){itemString = `id:91015 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션16
				case(140){itemString = `id:91007 expire:43200`; iCumRate +=10;} //0.409668169체형변화포션17
				case(141){itemString = `id:18112 `; iCumRate +=16;} //0.65546907해 분장 소품
				case(142){itemString = `id:18111 `; iCumRate +=16;} //0.65546907나무 분장 소품
				case(143){itemString = `id:18110 `; iCumRate +=16;} //0.65546907덤불 분장 소품
				case(144){itemString = `id:18109 `; iCumRate +=16;} //0.65546907나오 분장 소품
				case(145){itemString = `id:18108 `; iCumRate +=16;} //0.65546907바위 분장 소품
				case(146){itemString = `id:18029 `; iCumRate +=16;} //0.65546907나무테 안경
				case(147){itemString = `id:18028 `; iCumRate +=16;} //0.65546907접이식 안경
				case(148){itemString = `id:19008 `; iCumRate +=16;} //0.65546907코코 판다 로브
				case(149){itemString = `id:19009 `; iCumRate +=16;} //0.65546907코코 래빗 로브
				case(150){itemString = `id:19017 `; iCumRate +=16;} //0.65546907늑대 로브
				case(151){itemString = `id:19016 `; iCumRate +=16;} //0.65546907곰 로브
				case(152){itemString = `id:40053 `; iCumRate +=16;} //0.65546907보라빛 장미 꽃다발
				case(153){itemString = `id:40051 `; iCumRate +=16;} //0.65546907보라빛 장미 한송이
				case(154){itemString = `id:18089 `; iCumRate +=16;} //0.65546907보라빛 장미 장식
				case(155){itemString = `id:40054 `; iCumRate +=16;} //0.65546907파란 장미 꽃다발
				case(156){itemString = `id:40052 `; iCumRate +=16;} //0.65546907파란 장미 한송이
				case(157){itemString = `id:16500 `; iCumRate +=16;} //0.65546907울나 프로텍터 글러브
				case(158){itemString = `id:19020 `; iCumRate +=16;} //0.65546907나타네 설산용 코트
				case(159){itemString = `id:62005 prefix:7 `; iCumRate +=16;} //0.65546907인챈트（폭스헌터）
				case(160){itemString = `id:16520 `; iCumRate +=16;} //0.65546907롱 레더 글러브
				case(161){itemString = `id:15128 `; iCumRate +=16;} //0.65546907투 톤 비조 드레스
				case(162){itemString = `id:16019 `; iCumRate +=16;} //0.65546907줄무늬 팔목 장갑
				case(163){itemString = `id:18047 `; iCumRate +=16;} //0.65546907코레스 펠트 모자
				case(164){itemString = `id:18008 `; iCumRate +=16;} //0.65546907스트라이프 캡
				case(165){itemString = `id:15025 `; iCumRate +=16;} //0.65546907마법학교 여자교복
				case(166){itemString = `id:18043 `; iCumRate +=16;} //0.65546907코레스 니트 모자
				case(167){itemString = `id:18026 `; iCumRate +=16;} //0.65546907몬거 상인모자
				case(168){itemString = `id:15052 `; iCumRate +=16;} //0.65546907터크스 투톤 튜닉
				case(169){itemString = `id:19005 `; iCumRate +=16;} //0.65546907머플러 로브
				case(170){itemString = `id:18040 `; iCumRate +=16;} //0.65546907코레스 꼭지 베레모
				case(171){itemString = `id:18038 `; iCumRate +=16;} //0.65546907깃털 배렛 모자
				case(172){itemString = `id:15042 `; iCumRate +=16;} //0.65546907롱넥 원피스
				case(173){itemString = `id:63025 count:3`; iCumRate +=16;} //0.65546907대용량 축복의 포션
				case(174){itemString = `id:51031 count:3`; iCumRate +=16;} //0.65546907완전 회복의 포션
				case(175){itemString = `id:51036 `; iCumRate +=16;} //0.65546907다이어트 포션 U
				case(176){itemString = `id:51038 `; iCumRate +=16;} //0.65546907다이어트 포션 L
				case(177){itemString = `id:51039 `; iCumRate +=16;} //0.65546907다이어트 포션 F
				case(178){itemString = `id:17006 `; iCumRate +=16;} //0.65546907천신발
				case(179){itemString = `id:18086 `; iCumRate +=16;} //0.65546907데이지 꽃 장식
				case(180){itemString = `id:18087 `; iCumRate +=16;} //0.65546907장미 꽃 장식
				case(181){itemString = `id:18088 `; iCumRate +=16;} //0.65546907화관
				case(182){itemString = `id:18090 `; iCumRate +=16;} //0.65546907파란 장미 장식
				case(183){itemString = `id:40046 `; iCumRate +=16;} //0.65546907장미 한송이
				case(184){itemString = `id:40047 `; iCumRate +=16;} //0.65546907장미 꽃다발
				case(185){itemString = `id:18541 `; iCumRate +=16;} //0.65546907대머리 가발
				case(186){itemString = `id:18103 `; iCumRate +=16;} //0.65546907종이 모자
				case(187){itemString = `id:60037 count:5`; iCumRate +=16;} //0.65546907블랙 유스 포션
				case(188){itemString = `id:60038 count:5`; iCumRate +=16;} //0.65546907레드 포션
				case(189){itemString = `id:18010 `; iCumRate +=16;} //0.65546907몬거 스마트 캡
				case(190){itemString = `id:17016 `; iCumRate +=16;} //0.65546907필드 컴뱃슈즈
				case(191){itemString = `id:17015 `; iCumRate +=16;} //0.65546907컴뱃슈즈
				case(192){itemString = `id:17005 `; iCumRate +=16;} //0.65546907사냥꾼 신발
				case(193){itemString = `id:17002 `; iCumRate +=16;} //0.65546907검사 신발
				case(194){itemString = `id:17022 `; iCumRate +=16;} //0.65546907레더부츠
				case(195){itemString = `id:17001 `; iCumRate +=16;} //0.65546907가죽 부츠
				case(196){itemString = `id:17007 `; iCumRate +=16;} //0.65546907가죽 구두
				case(197){itemString = `id:16009 `; iCumRate +=16;} //0.65546907사냥꾼장갑
				case(198){itemString = `id:15031 `; iCumRate +=16;} //0.65546907마법학교의 남자 교복
				case(199){itemString = `id:19012 `; iCumRate +=16;} //0.65546907트루디 레이어드 로브
				case(200){itemString = `id:18004 `; iCumRate +=16;} //0.65546907몬거 패션모자
				case(201){itemString = `id:15132 `; iCumRate +=16;} //0.65546907내추럴 베스트 웨어
				case(202){itemString = `id:15043 `; iCumRate +=16;} //0.65546907스포티 웨어세트
				case(203){itemString = `id:17017 `; iCumRate +=16;} //0.65546907레더코트 슈즈
				case(204){itemString = `id:16006 `; iCumRate +=16;} //0.65546907가디언 장갑
				case(205){itemString = `id:16017 `; iCumRate +=16;} //0.65546907스탠다드 글러브
				case(206){itemString = `id:17060 `; iCumRate +=16;} //0.65546907산드라 스나이퍼 수트 부츠(남성용)
				case(207){itemString = `id:17061 `; iCumRate +=16;} //0.65546907산드라 스나이퍼 수트 부츠(여성용)
				case(208){itemString = `id:17019 `; iCumRate +=16;} //0.65546907대장장이 신발
				case(209){itemString = `id:17067 `; iCumRate +=16;} //0.65546907엑스 타이 업 슈즈
				case(210){itemString = `id:17008 `; iCumRate +=16;} //0.65546907코레스 부츠（여성용）
				case(211){itemString = `id:17010 `; iCumRate +=16;} //0.65546907코레스 부츠（남성용）
				case(212){itemString = `id:17023 `; iCumRate +=16;} //0.65546907에나멜 신발
				case(213){itemString = `id:16031 `; iCumRate +=16;} //0.65546907쓰리라인 타이트 글러브
				case(214){itemString = `id:16026 `; iCumRate +=16;} //0.65546907산드라 스나이퍼 수트 글러브
				case(215){itemString = `id:16016 `; iCumRate +=16;} //0.65546907라이트 글러브
				case(216){itemString = `id:17003 `; iCumRate +=16;} //0.65546907가죽 신발（남성용）
				case(217){itemString = `id:17024 `; iCumRate +=16;} //0.65546907통굽 샌달
				case(218){itemString = `id:17013 `; iCumRate +=16;} //0.65546907두꺼운 샌달
				case(219){itemString = `id:17069 `; iCumRate +=16;} //0.65546907레오 슈즈
				case(220){itemString = `id:15020 `; iCumRate +=16;} //0.65546907코레스 힐러드레스
				case(221){itemString = `id:15044 `; iCumRate +=16;} //0.65546907목수용 작업복
				case(222){itemString = `id:15041 `; iCumRate +=16;} //0.65546907사무직 여성용 슈트
				case(223){itemString = `id:15027 `; iCumRate +=16;} //0.65546907몬거 롱스커트
				case(224){itemString = `id:15018 `; iCumRate +=16;} //0.65546907몬거 여행자옷（여성용）
				case(225){itemString = `id:15033 `; iCumRate +=16;} //0.65546907몬거 여행자옷(남성용）
				case(226){itemString = `id:15023 `; iCumRate +=16;} //0.65546907토크 사냥꾼옷（여성용）
				case(227){itemString = `id:15035 `; iCumRate +=16;} //0.65546907토크 사냥꾼옷（남성용）
				case(228){itemString = `id:19003 `; iCumRate +=16;} //0.65546907트리콜로르 로브
				case(229){itemString = `id:63024 `; iCumRate +=16;} //0.65546907염색 앰플
				case(230){itemString = `id:18002 `; iCumRate +=16;} //0.65546907몬거 캡
				case(231){itemString = `id:18007 `; iCumRate +=16;} //0.65546907포포 캡
				case(232){itemString = `id:18013 `; iCumRate +=16;} //0.65546907코레스 캡
				case(233){itemString = `id:18156 `; iCumRate +=16;} //0.65546907고글 모자
				case(234){itemString = `id:18042 `; iCumRate +=16;} //0.65546907코레스 동양식 모자
				case(235){itemString = `id:18003 `; iCumRate +=16;} //0.65546907리리나 캡
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
		GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
		}
	}
}
