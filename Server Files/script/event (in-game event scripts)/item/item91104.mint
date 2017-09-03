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
	//미국 패션 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2441);	//확률의 총합을 적는다 리뉴얼 이전 2091
	int itemID = cItem.GetClassId();

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
			case(34){itemString = `id:18176 durability:30000 durability_max:30000`; iCumRate +=3;} //0.122900451몬거 마법사모자
			case(35){itemString = `id:15079 durability:25000 durability_max:25000`; iCumRate +=3;} //0.122900451몬거 넓은챙 마법사 모자
			case(36){itemString = `id:15117 suffix:31202`; iCumRate +=3;} //0.122900451남성용 마법사 정장（자칼）
			case(37){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.122900451남성용 마법사 정장（새끼너구리）
			case(38){itemString = `id:15116 suffix:31202`; iCumRate +=3;} //0.122900451여성용 마법사 정장（자칼）
			case(39){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.122900451여성용 마법사 정장（새끼너구리）
			case(40){itemString = `id:18005 `; iCumRate +=4;} //0.163867268메이드 머리띠
			case(41){itemString = `id:18048 durability:21000 durability_max:21000`; iCumRate +=4;} //0.163867268티핑 수트
			case(42){itemString = `id:15109 `; iCumRate +=4;} //0.163867268다비 스컷 플래드 웨어(남성용)
			case(43){itemString = `id:15260 `; iCumRate +=4;} //0.163867268다비 스컷 플래드 웨어(여성용)
			case(44){itemString = `id:15261 `; iCumRate +=4;} //0.163867268볼레로 앤 점퍼 스커트
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
	}

GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
