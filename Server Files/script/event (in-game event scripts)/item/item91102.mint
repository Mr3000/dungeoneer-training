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
	// 대만용 모험가 가챠폰 리뉴얼(일본 모험가 가챠폰 리뉴얼 사용)
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(2000);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0) {itemString = `id:13060 `; iCumRate +=2;}//0.1드래곤 스케일 아머(여성용)
			case(1) {itemString = `id:13061 `; iCumRate +=2;}//0.1드래곤 스케일 아머 (남성용)
			case(2) {itemString = `id:13062 `; iCumRate +=2;}//0.1드래곤 스케일 아머(자이언트 여성용)
			case(3) {itemString = `id:13063 `; iCumRate +=2;}//0.1드래곤 스케일 아머(자이언트 남성용)
			case(4) {itemString = `id:16543 `; iCumRate +=4;}//0.2드래곤 스케일 건틀렛
			case(5) {itemString = `id:16544 `; iCumRate +=4;}//0.2드래곤 스케일 건틀렛(자이언트용)
			case(6) {itemString = `id:17530 `; iCumRate +=4;}//0.2드래곤 스케일 그리브
			case(7) {itemString = `id:18577 `; iCumRate +=4;}//0.2드래곤 스케일 헬름
			case(8) {itemString = `id:17029 suffix:30702`; iCumRate +=4;}//0.2벨트 버클 부츠(레이븐)
			case(9) {itemString = `id:15323 `; iCumRate +=4;}//0.2알라딘 코스튬
			case(10) {itemString = `id:18562 `; iCumRate +=4;}//0.2알라딘 모자
			case(11) {itemString = `id:17131 `; iCumRate +=4;}//0.2알라딘 슈즈
			case(12) {itemString = `id:15324 `; iCumRate +=4;}//0.2자스민 코스튬
			case(13) {itemString = `id:18563 `; iCumRate +=4;}//0.2자스민 마스크
			case(14) {itemString = `id:15233  `; iCumRate +=4;}//0.2엘레건트 고딕 드레스(롱타입)
			case(15) {itemString = `id:15234  `; iCumRate +=4;}//0.2엘레건트 고딕 슈트
			case(16) {itemString = `id:15235  `; iCumRate +=4;}//0.2엘레건트 고딕 드레스(숏타입)
			case(17) {itemString = `id:15220  `; iCumRate +=4;}//0.2애드미럴 코트(남성용)
			case(18) {itemString = `id:15221  `; iCumRate +=4;}//0.2애드미럴 코트(여성용)
			case(19) {itemString = `id:15222  `; iCumRate +=4;}//0.2그레이스 숄 드레스
			case(20) {itemString = `id:18154  `; iCumRate +=4;}//0.2애드미럴 모자(남성용)
			case(21) {itemString = `id:18155  `; iCumRate +=4;}//0.2애드미럴 모자(여성용)
			case(22) {itemString = `id:15250 `; iCumRate +=4;}//0.2메이드 의상 롱 타입
			case(23) {itemString = `id:15251 `; iCumRate +=4;}//0.2메이드 의상 쇼트 타입
			case(24) {itemString = `id:15252 `; iCumRate +=4;}//0.2집사 의상
			case(25) {itemString = `id:15117 suffix:31202`; iCumRate +=4;}//0.2남성용 마법사 정장（자칼）
			case(26) {itemString = `id:15117 suffix:31301`; iCumRate +=4;}//0.2남성용 마법사 정장（새끼너구리）
			case(27) {itemString = `id:15116 suffix:31202`; iCumRate +=4;}//0.2남성용 마법사 정장（자칼）
			case(28) {itemString = `id:15116 suffix:31301`; iCumRate +=4;}//0.2남성용 마법사 정장（새끼너구리）
			case(29) {itemString = `id:18176 `; iCumRate +=4;}//0.2메이드 머리띠
			case(30) {itemString = `id:15260 `; iCumRate +=8;}//0.4다비 스컷 플래드 웨어(남성용)
			case(31) {itemString = `id:15261 `; iCumRate +=8;}//0.4다비 스컷 플래드 웨어(여성용)
			case(32) {itemString = `id:15079 `; iCumRate +=8;}//0.4볼레로 앤 점퍼 스커트
			case(33) {itemString = `id:15045 `; iCumRate +=8;}//0.4레이스 플래킷 예복
			case(34) {itemString = `id:15131 `; iCumRate +=8;}//0.4핀 에이프런 스커트
			case(35) {itemString = `id:15259 `; iCumRate +=8;}//0.4오델리아 위자드 슈트
			case(36) {itemString = `id:15180 `; iCumRate +=8;}//0.4아도라 네추럴 네크라인
			case(37) {itemString = `id:15113 `; iCumRate +=8;}//0.4여성용 검사학교 교복 쇼트타입
			case(38) {itemString = `id:15119 `; iCumRate +=8;}//0.4여성용 검사학교 교복 롱타입
			case(39) {itemString = `id:15118 `; iCumRate +=8;}//0.4남성용 검사학교 교복 쇼트타입
			case(40) {itemString = `id:17055 `; iCumRate +=8;}//0.4트루디 모카신 부츠
			case(41) {itemString = `id:17066 `; iCumRate +=8;}//0.4원 버튼 앵글 슈즈
			case(42) {itemString = `id:15065 `; iCumRate +=8;}//0.4엘라 베스트 스커트
			case(43) {itemString = `id:63034 col1:c00000`; iCumRate +=8;}//0.4붉은색 염색 앰플
			case(44) {itemString = `id:63033 col1:000000`; iCumRate +=8;}//0.4검은색 염색 앰플
			case(45) {itemString = `id:15115 `; iCumRate +=8;}//0.4재기드 미니 스커트
			case(46) {itemString = `id:15017 `; iCumRate +=8;}//0.4차이나드레스
			case(47) {itemString = `id:18044 `; iCumRate +=8;}//0.4범죄용 복면
			case(48) {itemString = `id:16519 `; iCumRate +=8;}//0.4초호화 장갑
			case(49) {itemString = `id:18046 `; iCumRate +=8;}//0.4왕관형 머리장식
			case(50) {itemString = `id:15124 `; iCumRate +=8;}//0.4클래식 슬리브 웨어
			case(51) {itemString = `id:15060 `; iCumRate +=8;}//0.4슬림 이너로브 웨어
			case(52) {itemString = `id:17041 `; iCumRate +=8;}//0.4덩굴무늬 헌팅부츠
			case(53) {itemString = `id:15064 `; iCumRate +=8;}//0.4아이돌 리본 드레스
			case(54) {itemString = `id:15070 `; iCumRate +=8;}//0.4스탠드칼라 슬리브리스
			case(55) {itemString = `id:19007 `; iCumRate +=8;}//0.4야광 머플러 로브
			case(56) {itemString = `id:18060 `; iCumRate +=8;}//0.4털 토끼 머리띠5
			case(57) {itemString = `id:18065 `; iCumRate +=8;}//0.4가죽 토끼 머리띠5
			case(58) {itemString = `id:18070 `; iCumRate +=8;}//0.4별 토끼 머리띠5
			case(59) {itemString = `id:18051 `; iCumRate +=8;}//0.4코레스 리본 모자
			case(60) {itemString = `id:15019 `; iCumRate +=8;}//0.4코레스 닌자슈트(남)
			case(61) {itemString = `id:15067 `; iCumRate +=8;}//0.4동양풍 무사복
			case(62) {itemString = `id:63069 `; iCumRate +=8;}//0.4금속 염색 앰플
			case(63) {itemString = `id:15055 `; iCumRate +=8;}//0.4레더 미니 원피스
			case(64) {itemString = `id:62005 suffix:30501`; iCumRate +=8;}//0.4인챈트 스크롤（자이언트）
			case(65) {itemString = `id:62005 suffix:30302`; iCumRate +=8;}//0.4인챈트 스크롤（코볼트）
			case(66) {itemString = `id:46006 `; iCumRate +=8;}//0.4카이트 실드 2
			case(67) {itemString = `id:15053 `; iCumRate +=8;}//0.4플랫칼라 원피스
			case(68) {itemString = `id:15134 `; iCumRate +=8;}//0.4고딕 베이직 수트
			case(69) {itemString = `id:15136 `; iCumRate +=10;}//0.5고딕 레이스 스커트
			case(70) {itemString = `id:15063 `; iCumRate +=10;}//0.5레이어드 프릴 원피스
			case(71) {itemString = `id:15108 `; iCumRate +=10;}//0.5섹시 레이디스 탱크탑
			case(72) {itemString = `id:15059 `; iCumRate +=10;}//0.5터크스 탱크탑 반바지
			case(73) {itemString = `id:15112 `; iCumRate +=10;}//0.5셀리나 스쿨보이룩
			case(74) {itemString = `id:17042 `; iCumRate +=10;}//0.5빈티지 코레스 오리엔탈 롱 부츠
			case(75) {itemString = `id:15074 `; iCumRate +=10;}//0.5루이스 성직자 코트
			case(76) {itemString = `id:15061 `; iCumRate +=10;}//0.5물결무늬 옆트임 튜닉
			case(77) {itemString = `id:17040 `; iCumRate +=10;}//0.5엘라 스트랩 부츠
			case(78) {itemString = `id:18525 `; iCumRate +=10;}//0.5워터드롭 캡
			case(79) {itemString = `id:15014 `; iCumRate +=10;}//0.5파발꾼의 옷
			case(80) {itemString = `id:18113 `; iCumRate +=10;}//0.5뾰족귀 고양이 모자
			case(81) {itemString = `id:18114 `; iCumRate +=10;}//0.5줄무늬 고양이 모자
			case(82) {itemString = `id:18115 `; iCumRate +=10;}//0.5핀 고양이 모자
			case(83) {itemString = `id:62005 suffix:30702`; iCumRate +=10;}//0.5인챈트 스크롤（까마귀）
			case(84) {itemString = `id:62005 prefix:207`; iCumRate +=10;}//0.5인챈트 스크롤（여우）
			case(85) {itemString = `id:63030 col1:ffffff`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(86) {itemString = `id:63030 col1:00c000`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(87) {itemString = `id:63030 col1:0000c0`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(88) {itemString = `id:63030 col1:c0c000`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(89) {itemString = `id:63030 col1:c000c0`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(90) {itemString = `id:63030 col1:00c0c0`; iCumRate +=10;}//0.5지정 염색 앰플（지정 색상）
			case(91) {itemString = `id:15029 `; iCumRate +=10;}//0.5토크 대장장이옷
			case(92) {itemString = `id:15151 `; iCumRate +=10;}//0.5뉴욕마리오 웨이스트 테일러 웨어(남성용)
			case(93) {itemString = `id:15152 `; iCumRate +=10;}//0.5뉴욕마리오 웨이스트 테일러 웨어(여성용)
			case(94) {itemString = `id:15153 `; iCumRate +=10;}//0.5산드라 스나이퍼 수트(남성용)
			case(95) {itemString = `id:15154 `; iCumRate +=10;}//0.5산드라 스나이퍼 수트(여성용)
			case(96) {itemString = `id:15032 `; iCumRate +=10;}//0.5리리나 반바지
			case(97) {itemString = `id:15026 `; iCumRate +=10;}//0.5리리나 롱스커트
			case(98) {itemString = `id:15016 `; iCumRate +=10;}//0.5의장용 스타킹 유니폼
			case(99) {itemString = `id:15051 `; iCumRate +=10;}//0.5타이트 벨트 웨어
			case(100) {itemString = `id:15008 `; iCumRate +=10;}//0.5검사학교 교복
			case(101) {itemString = `id:15212 `; iCumRate +=10;}//0.5콜린 하저 웨어
			case(102) {itemString = `id:15137 `; iCumRate +=10;}//0.5셀리나 하프 재킷 코트
			case(103) {itemString = `id:15127 `; iCumRate +=10;}//0.5셀리나 트래디셔널 코트
			case(104) {itemString = `id:19031 `; iCumRate +=10;}//0.5스타라이트 로브
			case(105) {itemString = `id:18011 `; iCumRate +=10;}//0.5몬거 제스터 캡
			case(106) {itemString = `id:18124 `; iCumRate +=10;}//0.5산드라 스나이퍼 수트 캡
			case(107) {itemString = `id:18009 `; iCumRate +=10;}//0.5몬거 아쳐 캡
			case(108) {itemString = `id:18014 `; iCumRate +=10;}//0.5몬거 모자
			case(109) {itemString = `id:18000 `; iCumRate +=12;}//0.6토크 모자
			case(110) {itemString = `id:16013 `; iCumRate +=12;}//0.6검사 장갑
			case(111) {itemString = `id:16032 `; iCumRate +=12;}//0.6엘빈 글러브
			case(112) {itemString = `id:63030 `; iCumRate +=12;}//0.6지정 염색 앰플
			case(113) {itemString = `id:18112 `; iCumRate +=12;}//0.6해 분장 소품
			case(114) {itemString = `id:18111 `; iCumRate +=12;}//0.6나무 분장 소품
			case(115) {itemString = `id:18110 `; iCumRate +=12;}//0.6덤불 분장 소품
			case(116) {itemString = `id:18109 `; iCumRate +=12;}//0.6나오 분장 소품
			case(117) {itemString = `id:18108 `; iCumRate +=12;}//0.6바위 분장 소품
			case(118) {itemString = `id:18029 `; iCumRate +=12;}//0.6나무테 안경
			case(119) {itemString = `id:18028 `; iCumRate +=12;}//0.6접이식 안경
			case(120) {itemString = `id:19008 `; iCumRate +=12;}//0.6코코 판다 로브
			case(121) {itemString = `id:19009 `; iCumRate +=12;}//0.6코코 래빗 로브
			case(122) {itemString = `id:19017 `; iCumRate +=12;}//0.6늑대 로브
			case(123) {itemString = `id:19016 `; iCumRate +=12;}//0.6곰 로브
			case(124) {itemString = `id:40053 `; iCumRate +=12;}//0.6보라빛 장미 꽃다발
			case(125) {itemString = `id:40051 `; iCumRate +=12;}//0.6보라빛 장미 한송이
			case(126) {itemString = `id:18089 `; iCumRate +=12;}//0.6보라빛 장미 장식
			case(127) {itemString = `id:40054 `; iCumRate +=12;}//0.6파란 장미 한송이
			case(128) {itemString = `id:40052 `; iCumRate +=12;}//0.6파란 장미 한송이
			case(129) {itemString = `id:16500 `; iCumRate +=12;}//0.6울나 프로텍터 글러브
			case(130) {itemString = `id:19020 `; iCumRate +=12;}//0.6나타네 설산용 코트
			case(131) {itemString = `id:62005 prefix:7 `; iCumRate +=12;}//0.6인챈트 스크롤（폭스헌터）
			case(132) {itemString = `id:16520 `; iCumRate +=12;}//0.6레더 글러브
			case(133) {itemString = `id:15128 `; iCumRate +=12;}//0.6투 톤 비조 드레스
			case(134) {itemString = `id:16019 `; iCumRate +=12;}//0.6줄무늬 팔목 장갑
			case(135) {itemString = `id:18047 `; iCumRate +=12;}//0.6코레스 펠트 모자
			case(136) {itemString = `id:18008 `; iCumRate +=12;}//0.6스트라이프 캡
			case(137) {itemString = `id:15025 `; iCumRate +=12;}//0.6마법학교 여자교복
			case(138) {itemString = `id:18043 `; iCumRate +=12;}//0.6코레스 니트 모자
			case(139) {itemString = `id:18026 `; iCumRate +=12;}//0.6몬거 상인모자
			case(140) {itemString = `id:15052 `; iCumRate +=12;}//0.6터크스 투톤 튜닉
			case(141) {itemString = `id:19005 `; iCumRate +=12;}//0.6머플러 로브
			case(142) {itemString = `id:18040 `; iCumRate +=12;}//0.6코레스 꼭지 베레모
			case(143) {itemString = `id:18038 `; iCumRate +=12;}//0.6깃털 배렛 모자
			case(144) {itemString = `id:15042 `; iCumRate +=12;}//0.6롱넥 원피스
			case(145) {itemString = `id:63025 count:3`; iCumRate +=12;}//0.6대용량 축복의 포션
			case(146) {itemString = `id:51031 count:3`; iCumRate +=12;}//0.6완전 회복의 포션
			case(147) {itemString = `id:51036 `; iCumRate +=12;}//0.6다이어트 포션 U
			case(148) {itemString = `id:51038 `; iCumRate +=12;}//0.6다이어트 포션 L
			case(149) {itemString = `id:51039 `; iCumRate +=12;}//0.6다이어트 포션 F
			case(150) {itemString = `id:17006 `; iCumRate +=12;}//0.6천신발
			case(151) {itemString = `id:18005 `; iCumRate +=12;}//0.6몬거 마법사모자
			case(152) {itemString = `id:18048 `; iCumRate +=12;}//0.6몬거 넓은챙 마법사 모자
			case(153) {itemString = `id:15109 `; iCumRate +=12;}//0.6티핑 수트
			case(154) {itemString = `id:18087 `; iCumRate +=12;}//0.6장미 꽃 장식
			case(155) {itemString = `id:18088 `; iCumRate +=12;}//0.6화관
			case(156) {itemString = `id:18090 `; iCumRate +=12;}//0.6파란 장미 장식
			case(157) {itemString = `id:40046 `; iCumRate +=12;}//0.6장미 꽃 장식
			case(158) {itemString = `id:40047 `; iCumRate +=12;}//0.6장미 한송이
			case(159) {itemString = `id:18541 `; iCumRate +=12;}//0.6대머리 가발
			case(160) {itemString = `id:18103 `; iCumRate +=12;}//0.6종이 모자
			case(161) {itemString = `id:18010 `; iCumRate +=12;}//0.6몬거 스마트 캡
			case(162) {itemString = `id:17016 `; iCumRate +=12;}//0.6필드 컴뱃슈즈
			case(163) {itemString = `id:17015 `; iCumRate +=12;}//0.6컴뱃슈즈
			case(164) {itemString = `id:17005 `; iCumRate +=12;}//0.6사냥꾼 신발
			case(165) {itemString = `id:17002 `; iCumRate +=12;}//0.6검사 신발
			case(166) {itemString = `id:17022 `; iCumRate +=12;}//0.6레더부츠
			case(167) {itemString = `id:17001 `; iCumRate +=12;}//0.6가죽 부츠
			case(168) {itemString = `id:17007 `; iCumRate +=12;}//0.6가죽 구두
			case(169) {itemString = `id:16009 `; iCumRate +=12;}//0.6사냥꾼장갑
			case(170) {itemString = `id:15031 `; iCumRate +=12;}//0.6마법학교의 남자 교복
			case(171) {itemString = `id:19012 `; iCumRate +=12;}//0.6트루디 레이어드 로브
			case(172) {itemString = `id:18004 `; iCumRate +=12;}//0.6몬거 패션모자
			case(173) {itemString = `id:15132 `; iCumRate +=12;}//0.6내추럴 베스트 웨어
			case(174) {itemString = `id:15043 `; iCumRate +=12;}//0.6스포티 웨어세트
			case(175) {itemString = `id:17017 `; iCumRate +=12;}//0.6레더코트 슈즈
			case(176) {itemString = `id:16006 `; iCumRate +=12;}//0.6가디언 장갑
			case(177) {itemString = `id:16017 `; iCumRate +=12;}//0.6스탠다드 글러브
			case(178) {itemString = `id:17060 `; iCumRate +=12;}//0.6산드라 스나이퍼 수트 부츠(남성용)
			case(179) {itemString = `id:17061 `; iCumRate +=12;}//0.6산드라 스나이퍼 수트 부츠(여성용)
			case(180) {itemString = `id:17019 `; iCumRate +=12;}//0.6대장장이 신발
			case(181) {itemString = `id:17067 `; iCumRate +=12;}//0.6엑스 타이 업 슈즈
			case(182) {itemString = `id:17008 `; iCumRate +=12;}//0.6코레스 부츠(여성용)
			case(183) {itemString = `id:17010 `; iCumRate +=12;}//0.6코레스 부츠(남성용)
			case(184) {itemString = `id:17023 `; iCumRate +=12;}//0.6에나멜 신발
			case(185) {itemString = `id:16031 `; iCumRate +=12;}//0.6쓰리라인 타이트 글러브
			case(186) {itemString = `id:16026 `; iCumRate +=12;}//0.6산드라 스나이퍼 수트 글러브
			case(187) {itemString = `id:16016 `; iCumRate +=12;}//0.6라이트 글러브
			case(188) {itemString = `id:17003 `; iCumRate +=12;}//0.6가죽 신발(남성용)
			case(189) {itemString = `id:17024 `; iCumRate +=12;}//0.6통굽 샌달
			case(190) {itemString = `id:17013 `; iCumRate +=12;}//0.6두꺼운 샌달
			case(191) {itemString = `id:17069 `; iCumRate +=12;}//0.6레오 슈즈
			case(192) {itemString = `id:15020 `; iCumRate +=12;}//0.6코레스 힐러드레스
			case(193) {itemString = `id:15044 `; iCumRate +=12;}//0.6목수용 작업복
			case(194) {itemString = `id:15041 `; iCumRate +=12;}//0.6사무직 여성용 슈트
			case(195) {itemString = `id:15027 `; iCumRate +=12;}//0.6몬거 롱스커트
			case(196) {itemString = `id:15018 `; iCumRate +=12;}//0.6몬거 여행자옷(여성용)
			case(197) {itemString = `id:15033 `; iCumRate +=12;}//0.6몬거 여행자옷(남성용)
			case(198) {itemString = `id:15023 `; iCumRate +=12;}//0.6토크 사냥꾼옷(여성용)
			case(199) {itemString = `id:15035 `; iCumRate +=12;}//0.6토크 사냥꾼옷(남성용)
			case(200) {itemString = `id:19003 `; iCumRate +=12;}//0.6트리콜로르 로브
			case(201) {itemString = `id:18002 `; iCumRate +=12;}//0.6몬거 캡
			case(202) {itemString = `id:18007 `; iCumRate +=12;}//0.6포포 캡
			case(203) {itemString = `id:18013 `; iCumRate +=12;}//0.6코레스 캡
			case(204) {itemString = `id:18156 `; iCumRate +=12;}//0.6고글 모자
			case(205) {itemString = `id:18042 `; iCumRate +=12;}//0.6코레스 동양식 모자
			case(206) {itemString = `id:18003 `; iCumRate +=12;}//0.6리리나 캡
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
