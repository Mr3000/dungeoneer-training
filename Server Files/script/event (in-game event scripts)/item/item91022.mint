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
	int itemID = cItem.GetClassId();
	/*국가별설정
	혹시라도 있을 오타를 줄이기 위해서 국가명은 Feature.xml에 써있는 국가명을 소문자로 씁니다.
	*/
	 if(GetLocale().LowerCase()== `china`)
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(2937);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15555 `; iCumRate +=1;} //0.034048349바날렌 여성용 예복
				case(1){itemString = `id:15556 `; iCumRate +=1;} //0.034048349바날렌 남성용 예복
				case(2){itemString = `id:16065 `; iCumRate +=1;} //0.034048349바날렌 더블 브레이슬렛
				case(3){itemString = `id:17212 `; iCumRate +=1;} //0.034048349바날렌 리본 부츠
				case(4){itemString = `id:17213 `; iCumRate +=1;} //0.034048349바날렌 꽃문양 샌들
				case(5){itemString = `id:15406 `; iCumRate +=1;} //0.034048349캐주얼 정장 A타입
				case(6){itemString = `id:15407 `; iCumRate +=1;} //0.034048349캐주얼 정장 B타입
				case(7){itemString = `id:15408 `; iCumRate +=1;} //0.034048349네글리제
				case(8){itemString = `id:17158 `; iCumRate +=1;} //0.034048349슬리퍼
				case(9){itemString = `id:18582 `; iCumRate +=1;} //0.034048349헤드 드레서
				case(10){itemString = `id:18235 `; iCumRate +=2;} //0.068096697아이리스 나이트캡
				case(11){itemString = `id:15338 `; iCumRate +=1;} //0.034048349로맨틱 이브닝 드레스
				case(12){itemString = `id:15339 `; iCumRate +=1;} //0.034048349로맨틱 테일 코트
				case(13){itemString = `id:17135 `; iCumRate +=2;} //0.068096697에나멜 펌프스
				case(14){itemString = `id:17136 `; iCumRate +=2;} //0.068096697클래식 슈즈
				case(15){itemString = `id:15325 `; iCumRate +=1;} //0.034048349박쥐 자켓 (남성용)
				case(16){itemString = `id:15326 `; iCumRate +=1;} //0.034048349박쥐 드레스 (여성용)
				case(17){itemString = `id:14047 `; iCumRate +=1;} //0.034048349불꽃 문양 레더 아머 (남성용)
				case(18){itemString = `id:14048 `; iCumRate +=1;} //0.034048349불꽃 문양 레더 아머 (여성용)
				case(19){itemString = `id:14049 `; iCumRate +=1;} //0.034048349야만적인 여우 갑옷 (남성용)
				case(20){itemString = `id:14050 `; iCumRate +=1;} //0.034048349야만적인 여우 갑옷 (여성용)
				case(21){itemString = `id:15315 `; iCumRate +=1;} //0.034048349아스틴 댄디 수트
				case(22){itemString = `id:15314 `; iCumRate +=1;} //0.034048349비앙카 윙 볼레로
				case(23){itemString = `id:17132 `; iCumRate +=2;} //0.068096697박쥐 부츠
				case(24){itemString = `id:18566 `; iCumRate +=2;} //0.068096697박쥐 모자
				case(25){itemString = `id:18559 `; iCumRate +=2;} //0.068096697불꽃 문양 레더 캡
				case(26){itemString = `id:18227 `; iCumRate +=2;} //0.068096697아스틴 캡
				case(27){itemString = `id:18226 `; iCumRate +=2;} //0.068096697비앙카 캡
				case(28){itemString = `id:15079 `; iCumRate +=2;} //0.068096697볼레로 앤 점퍼 스커트
				case(29){itemString = `id:15222 `; iCumRate +=2;} //0.068096697그레이스 숄 드레스(여성용)
				case(30){itemString = `id:15250 `; iCumRate +=2;} //0.068096697메이드 의상 쇼트 타입
				case(31){itemString = `id:15251 `; iCumRate +=2;} //0.068096697메이드 의상 롱 타입
				case(32){itemString = `id:15252 `; iCumRate +=2;} //0.068096697집사 의상
				case(33){itemString = `id:16046 `; iCumRate +=2;} //0.068096697고양이 손 장갑
				case(34){itemString = `id:16054 `; iCumRate +=3;} //0.102145046불꽃 문양 레더 글러브
				case(35){itemString = `id:16053 `; iCumRate +=3;} //0.102145046아스틴 글러브
				case(36){itemString = `id:16052 `; iCumRate +=3;} //0.102145046비앙카 롱 글러브
				case(37){itemString = `id:15292 `; iCumRate +=3;} //0.102145046남성용 수영복
				case(38){itemString = `id:15293 `; iCumRate +=3;} //0.102145046여성용 수영복
				case(39){itemString = `id:15294 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349남성용 수영복
				case(40){itemString = `id:15295 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349여성용 수영복
				case(41){itemString = `id:18176 `; iCumRate +=3;} //0.102145046메이드 머리띠
				case(42){itemString = `id:15203 `; iCumRate +=3;} //0.102145046여성용 유카타
				case(43){itemString = `id:15204 `; iCumRate +=3;} //0.102145046남성용 유카타
				case(44){itemString = `id:15233 `; iCumRate +=3;} //0.102145046엘레건트 고딕 드레스
				case(45){itemString = `id:15234 `; iCumRate +=3;} //0.102145046엘레건트 고딕 슈트
				case(46){itemString = `id:15235 `; iCumRate +=3;} //0.102145046엘레건트 고딕 드레스
				case(47){itemString = `id:18187 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349커다란 리본
				case(48){itemString = `id:18188 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349안대
				case(49){itemString = `id:18189 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=1;} //0.034048349카우보이 모자
				case(50){itemString = `id:15065 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697엘라 베스트 스커트
				case(51){itemString = `id:15112 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697셀리나 스쿨보이룩
				case(52){itemString = `id:15113 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697여성용 검사학교 교복 쇼트타입
				case(53){itemString = `id:15114 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697남성용 검사학교 교복 롱타입
				case(54){itemString = `id:15131 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697핀 에이프런 스커트
				case(55){itemString = `id:15132 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697내추럴 베스트 웨어
				case(56){itemString = `id:15135 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697시크 수트
				case(57){itemString = `id:15137 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697셀리나 하프 재킷 코트
				case(58){itemString = `id:15151 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697뉴욕마리오 웨이스트 테일러 웨어(남성용)
				case(59){itemString = `id:15152 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697뉴욕마리오 웨이스트 테일러 웨어(여성용)
				case(60){itemString = `id:15153 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697산드라 스나이퍼 수트(남성용)
				case(61){itemString = `id:15154 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697산드라 스나이퍼 수트(여성용)
				case(62){itemString = `id:15155 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697이디카이 성직자 예복(남성용)
				case(63){itemString = `id:15156 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697이디카이 성직자 예복(여성용)
				case(64){itemString = `id:15157 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697위스 보위군 의복(남성용)
				case(65){itemString = `id:15158 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697위스 보위군 의복(여성용)
				case(66){itemString = `id:15184 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697테라 에이션트 패턴 웨어
				case(67){itemString = `id:19007 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=2;} //0.068096697야광 머플러 로브
				case(68){itemString = `id:17130 `; iCumRate +=4;} //0.136193395불꽃 문양 레더 부츠
				case(69){itemString = `id:16055 `; iCumRate +=4;} //0.136193395야만적인 여우 장갑 (남성용)
				case(70){itemString = `id:16056 `; iCumRate +=4;} //0.136193395야만적인 여우 장갑 (여성용)
				case(71){itemString = `id:17126 `; iCumRate +=4;} //0.136193395아스틴 슈즈
				case(72){itemString = `id:17125 `; iCumRate +=4;} //0.136193395비앙카 리본 부츠
				case(73){itemString = `id:15298 `; iCumRate +=4;} //0.136193395아처리스 스쿨웨어
				case(74){itemString = `id:15267 `; iCumRate +=4;} //0.136193395테라 고딕 풀 드레스
				case(75){itemString = `id:15268 `; iCumRate +=4;} //0.136193395테라 고딕 펑크 수트
				case(76){itemString = `id:15296 `; iCumRate +=4;} //0.136193395남성용 수영복
				case(77){itemString = `id:15297 `; iCumRate +=4;} //0.136193395여성용 수영복
				case(78){itemString = `id:15224 `; iCumRate +=4;} //0.136193395남성용 유카타
				case(79){itemString = `id:15225 `; iCumRate +=4;} //0.136193395여성용 유카타
				case(80){itemString = `id:13010 suffix:30613`; iCumRate +=4;} //0.136193395라운드 폴드론 체인메일
				case(81){itemString = `id:13022 suffix:30613`; iCumRate +=4;} //0.136193395로즈 플레이트 아머 (P타입)
				case(82){itemString = `id:13031 suffix:30613`; iCumRate +=4;} //0.136193395스파이카 실버 플레이트 아머
				case(83){itemString = `id:13032 suffix:31401`; iCumRate +=4;} //0.136193395발렌시아 크로스 라인 플레이트 아머(여성용)
				case(84){itemString = `id:13033 suffix:31401`; iCumRate +=4;} //0.136193395발렌시아 크로스 라인 플레이트 아머(남성용)
				case(85){itemString = `id:14025 suffix:30515`; iCumRate +=4;} //0.136193395카멜 스피리트 아머(남성용)
				case(86){itemString = `id:14026 suffix:30515`; iCumRate +=4;} //0.136193395카멜 스피리트 아머(여성용)
				case(87){itemString = `id:14036 suffix:30613`; iCumRate +=4;} //0.136193395티오즈 아머(남성용)
				case(88){itemString = `id:14037 suffix:30613`; iCumRate +=4;} //0.136193395티오즈 아머(여성용)
				case(89){itemString = `id:16028 suffix:30601`; iCumRate +=4;} //0.136193395카멜 스피리트 글러브
				case(90){itemString = `id:16511 suffix:30601`; iCumRate +=4;} //0.136193395실버 티니 글러브
				case(91){itemString = `id:16521 suffix:30902`; iCumRate +=4;} //0.136193395발렌시아 크로스 라인 플레이트 건틀렛
				case(92){itemString = `id:16531 suffix:30601`; iCumRate +=4;} //0.136193395티오즈 건틀렛
				case(93){itemString = `id:17064 suffix:30601`; iCumRate +=4;} //0.136193395카멜 스피리트 부츠
				case(94){itemString = `id:17510 suffix:30601`; iCumRate +=4;} //0.136193395스파이카 실버 플레이트 부츠
				case(95){itemString = `id:17514 suffix:30902`; iCumRate +=4;} //0.136193395발렌시아 크로스 라인 플레이트 부츠
				case(96){itemString = `id:17523 suffix:30601`; iCumRate +=4;} //0.136193395티오즈 그리브
				case(97){itemString = `id:18518 suffix:30601`; iCumRate +=4;} //0.136193395드래곤 크레스트
				case(98){itemString = `id:18161 `; iCumRate +=5;} //0.170241743데브캣 귀마개
				case(99){itemString = `id:18157 `; iCumRate +=5;} //0.170241743고양이 귀 머리띠
				case(100){itemString = `id:15065 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046엘라 베스트 스커트
				case(101){itemString = `id:15112 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046셀리나 스쿨보이룩
				case(102){itemString = `id:15113 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046여성용 검사학교 교복 쇼트타입
				case(103){itemString = `id:15114 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046남성용 검사학교 교복 롱타입
				case(104){itemString = `id:15131 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046핀 에이프런 스커트
				case(105){itemString = `id:15132 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046내추럴 베스트 웨어
				case(106){itemString = `id:15135 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046시크 수트
				case(107){itemString = `id:15137 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046셀리나 하프 재킷 코트
				case(108){itemString = `id:15151 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046뉴욕마리오 웨이스트 테일러 웨어(남성용)
				case(109){itemString = `id:15152 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046뉴욕마리오 웨이스트 테일러 웨어(여성용)
				case(110){itemString = `id:15153 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046산드라 스나이퍼 수트(남성용)
				case(111){itemString = `id:15154 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046산드라 스나이퍼 수트(여성용)
				case(112){itemString = `id:15155 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046이디카이 성직자 예복(남성용)
				case(113){itemString = `id:15156 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046이디카이 성직자 예복(여성용)
				case(114){itemString = `id:15157 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046위스 보위군 의복(남성용)
				case(115){itemString = `id:15158 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046위스 보위군 의복(여성용)
				case(116){itemString = `id:15184 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046테라 에이션트 패턴 웨어
				case(117){itemString = `id:19007 C1:83317370 C2:83317370 C3:83317370`; iCumRate +=3;} //0.102145046야광 머플러 로브
				case(118){itemString = `id:80000 `; iCumRate +=8;} //0.272386789나오의 검은 옷
				case(119){itemString = `id:80001 `; iCumRate +=8;} //0.272386789루아의 옷
				case(120){itemString = `id:80002 `; iCumRate +=8;} //0.272386789핑크색 코트
				case(121){itemString = `id:80003 `; iCumRate +=8;} //0.272386789검은색 코트
				case(122){itemString = `id:80004 `; iCumRate +=8;} //0.272386789나오의 노란색 봄 옷
				case(123){itemString = `id:80005 `; iCumRate +=8;} //0.272386789나오의 하얀색 봄 옷
				case(124){itemString = `id:80006 `; iCumRate +=8;} //0.272386789나오의 핑크색 봄 옷
				case(125){itemString = `id:62005 suffix:30515`; iCumRate +=15;} //0.51072523해적의
				case(126){itemString = `id:62005 prefix:20505`; iCumRate +=15;} //0.51072523리자드
				case(127){itemString = `id:62005 prefix:21007`; iCumRate +=15;} //0.51072523히스
				case(128){itemString = `id:62005 prefix:20625`; iCumRate +=15;} //0.51072523금속 바늘
				case(129){itemString = `id:62005 suffix:30624`; iCumRate +=15;} //0.51072523산사나무
				case(130){itemString = `id:62005 prefix:20721`; iCumRate +=15;} //0.51072523한가한
				case(131){itemString = `id:51003 count:10`; iCumRate +=18;} //0.612870276생명력 50 포션
				case(132){itemString = `id:51004 count:10`; iCumRate +=18;} //0.612870276생명력 100 포션
				case(133){itemString = `id:51007 count:10`; iCumRate +=18;} //0.612870276마나 30 포션
				case(134){itemString = `id:51008 count:10`; iCumRate +=18;} //0.612870276마나 50 포션
				case(135){itemString = `id:51009 count:10`; iCumRate +=18;} //0.612870276마나 100 포션
				case(136){itemString = `id:51013 count:10`; iCumRate +=18;} //0.612870276스태미나 50 포션
				case(137){itemString = `id:51014 count:10`; iCumRate +=18;} //0.612870276스태미나 100 포션
				case(138){itemString = `id:51022 count:10`; iCumRate +=18;} //0.612870276생명력과 마나 30 포션
				case(139){itemString = `id:51023 count:10`; iCumRate +=18;} //0.612870276생명력과 마나 50 포션
				case(140){itemString = `id:51027 count:10`; iCumRate +=18;} //0.612870276생명력과 스태미나 30 포션
				case(141){itemString = `id:51028 count:10`; iCumRate +=18;} //0.612870276생명력과 스태미나 50 포션
				case(142){itemString = `id:51029 count:10`; iCumRate +=18;} //0.612870276생명력과 스태미나 100 포션
				case(143){itemString = `id:60036 count:5`; iCumRate +=18;} //0.612870276옐로우 베이비 포션
				case(144){itemString = `id:60037 count:5`; iCumRate +=18;} //0.612870276블랙 유스 포션
				case(145){itemString = `id:60038 count:5`; iCumRate +=18;} //0.612870276레드 포션
				case(146){itemString = `id:60040 count:5`; iCumRate +=18;} //0.612870276그린 베이비 포션
				case(147){itemString = `id:62004 count:5`; iCumRate +=18;} //0.612870276마법가루
				case(148){itemString = `id:63000 count:10`; iCumRate +=18;} //0.612870276피닉스의 깃털
				case(149){itemString = `id:2006 `; iCumRate +=20;} //0.680966973큰 금화 주머니
				case(150){itemString = `id:17015 `; iCumRate +=20;} //0.680966973컴뱃슈즈
				case(151){itemString = `id:14042 `; iCumRate +=20;} //0.680966973컬스틴 레더 아머
				case(152){itemString = `id:16534 `; iCumRate +=20;} //0.680966973컬스틴 레더 건틀렛
				case(153){itemString = `id:17524 `; iCumRate +=20;} //0.680966973컬스틴 레더 부츠
				case(154){itemString = `id:13047 `; iCumRate +=20;} //0.680966973키리누스진 하프 플레이트 아머(남성용)
				case(155){itemString = `id:13048 `; iCumRate +=20;} //0.680966973키리누스진 하프 플레이트 아머(여성용)
				case(156){itemString = `id:14005 `; iCumRate +=20;} //0.680966973드란도스 레더메일
				case(157){itemString = `id:14011 `; iCumRate +=20;} //0.680966973드란도스 레더메일
				case(158){itemString = `id:14013 `; iCumRate +=20;} //0.680966973로리카 세그먼타타에
				case(159){itemString = `id:14019 `; iCumRate +=20;} //0.680966973그레이스 플레이트 아머
				case(160){itemString = `id:14035 `; iCumRate +=20;} //0.680966973피르타 레더 아머
				case(161){itemString = `id:14038 `; iCumRate +=20;} //0.680966973피르타 레더 아머 B타입(여성용)
				case(162){itemString = `id:15014 `; iCumRate +=20;} //0.680966973파발꾼의 옷
				case(163){itemString = `id:15028 `; iCumRate +=20;} //0.680966973코레스 씨프슈트
				case(164){itemString = `id:15042 `; iCumRate +=20;} //0.680966973롱넥 원피스
				case(165){itemString = `id:15052 `; iCumRate +=20;} //0.680966973터크스 투톤 튜닉
				case(166){itemString = `id:15053 `; iCumRate +=20;} //0.680966973플랫칼라 원피스
				case(167){itemString = `id:15055 `; iCumRate +=20;} //0.680966973레더 미니 원피스
				case(168){itemString = `id:15057 `; iCumRate +=20;} //0.680966973롱 레더 코트 (무광)
				case(169){itemString = `id:15070 `; iCumRate +=20;} //0.680966973스탠드칼라 슬리브리스
				case(170){itemString = `id:15128 `; iCumRate +=20;} //0.680966973투 톤 비조 드레스
				case(171){itemString = `id:15135 `; iCumRate +=20;} //0.680966973시크 수트
				case(172){itemString = `id:15136 `; iCumRate +=20;} //0.680966973모험가 슈트
				case(173){itemString = `id:15153 `; iCumRate +=20;} //0.680966973산드라 스나이퍼 수트(남성용)
				case(174){itemString = `id:15154 `; iCumRate +=20;} //0.680966973산드라 스나이퍼 수트(여성용)
				case(175){itemString = `id:15230 `; iCumRate +=20;} //0.680966973가르텐 글렌 체크 스커트
				case(176){itemString = `id:16008 `; iCumRate +=20;} //0.680966973코레스 씨프 글러브
				case(177){itemString = `id:16019 `; iCumRate +=20;} //0.680966973줄무늬 팔목 장갑
				case(178){itemString = `id:16028 `; iCumRate +=20;} //0.680966973카멜 스피리트 글러브
				case(179){itemString = `id:16040 `; iCumRate +=20;} //0.680966973콜린 빅센 글러브
				case(180){itemString = `id:16505 `; iCumRate +=20;} //0.680966973플루트 건틀렛
				case(181){itemString = `id:16520 `; iCumRate +=20;} //0.680966973롱 레더 글러브
				case(182){itemString = `id:17040 `; iCumRate +=20;} //0.680966973엘라 스트랩 부츠
				case(183){itemString = `id:17041 `; iCumRate +=20;} //0.680966973덩굴무늬 헌팅부츠
				case(184){itemString = `id:17045 `; iCumRate +=20;} //0.680966973브이 넥 라인 레더 부츠
				case(185){itemString = `id:17071 `; iCumRate +=20;} //0.680966973니하이 부츠
				case(186){itemString = `id:17087 `; iCumRate +=20;} //0.680966973콜린 빅센 부츠
				case(187){itemString = `id:17506 `; iCumRate +=20;} //0.680966973롱그리브 부츠
				case(188){itemString = `id:17522 `; iCumRate +=20;} //0.680966973피르타 레더 부츠
				case(189){itemString = `id:18008 `; iCumRate +=20;} //0.680966973스트라이프 캡
				case(190){itemString = `id:18023 `; iCumRate +=20;} //0.680966973몬거 씨프 캡
				case(191){itemString = `id:18028 `; iCumRate +=20;} //0.680966973접이식 안경
				case(192){itemString = `id:18029 `; iCumRate +=20;} //0.680966973나무테 안경
				case(193){itemString = `id:18038 `; iCumRate +=20;} //0.680966973깃털 배렛 모자
				case(194){itemString = `id:18040 `; iCumRate +=20;} //0.680966973코레스 꼭지 베레모
				case(195){itemString = `id:18047 `; iCumRate +=20;} //0.680966973코레스 펠트 모자
				case(196){itemString = `id:18108 `; iCumRate +=20;} //0.680966973바위 분장 소품
				case(197){itemString = `id:18109 `; iCumRate +=20;} //0.680966973나오 분장 소품
				case(198){itemString = `id:18110 `; iCumRate +=20;} //0.680966973덤불 분장 소품
				case(199){itemString = `id:18112 `; iCumRate +=20;} //0.680966973해 분장 소품
				case(200){itemString = `id:18113 `; iCumRate +=20;} //0.680966973뾰족귀 고양이 모자
				case(201){itemString = `id:18114 `; iCumRate +=20;} //0.680966973줄무늬 고양이 모자
				case(202){itemString = `id:18115 `; iCumRate +=20;} //0.680966973핀 고양이 모자
				case(203){itemString = `id:18502 `; iCumRate +=20;} //0.680966973본 헬름
				case(204){itemString = `id:18506 `; iCumRate +=20;} //0.680966973윙 하프 헬름
				case(205){itemString = `id:18511 `; iCumRate +=20;} //0.680966973플루트 풀 헬름
				case(206){itemString = `id:18513 `; iCumRate +=20;} //0.680966973스파이크 캡
				case(207){itemString = `id:18515 `; iCumRate +=20;} //0.680966973트윈 혼 캡
				case(208){itemString = `id:18525 `; iCumRate +=20;} //0.680966973워터드롭 캡
				case(209){itemString = `id:18542 `; iCumRate +=20;} //0.680966973빅 체인 풀 헬름
				case(210){itemString = `id:18543 `; iCumRate +=20;} //0.680966973슬릿 풀 헬름
				case(211){itemString = `id:19005 `; iCumRate +=20;} //0.680966973머플러 로브
				case(212){itemString = `id:19007 `; iCumRate +=20;} //0.680966973야광 머플러 로브
				case(213){itemString = `id:19020 `; iCumRate +=20;} //0.680966973나타네 설산용 코트
				case(214){itemString = `id:19029 `; iCumRate +=20;} //0.680966973자이언트 베어 로브
				case(215){itemString = `id:19034 `; iCumRate +=20;} //0.680966973가르텐 클로스 오버코트
				case(216){itemString = `id:40011 `; iCumRate +=20;} //0.680966973브로드 소드
				case(217){itemString = `id:40012 `; iCumRate +=20;} //0.680966973바스타드 소드
				case(218){itemString = `id:40014 `; iCumRate +=20;} //0.680966973콤포짓 보우
				case(219){itemString = `id:40015 `; iCumRate +=20;} //0.680966973플루트 숏 소드
				case(220){itemString = `id:40030 `; iCumRate +=20;} //0.680966973투 핸디드 소드
				case(221){itemString = `id:40031 `; iCumRate +=20;} //0.680966973석궁
				case(222){itemString = `id:40038 `; iCumRate +=20;} //0.680966973라이트닝 원드
				case(223){itemString = `id:40039 `; iCumRate +=20;} //0.680966973아이스 원드
				case(224){itemString = `id:40040 `; iCumRate +=20;} //0.680966973파이어 원드
				case(225){itemString = `id:40041 `; iCumRate +=20;} //0.680966973타격용 원드
				case(226){itemString = `id:40079 `; iCumRate +=20;} //0.680966973메이스
				case(227){itemString = `id:40081 `; iCumRate +=20;} //0.680966973롱 보우
				case(228){itemString = `id:40081 `; iCumRate +=20;} //0.680966973레더 롱 보우
				case(229){itemString = `id:40090 `; iCumRate +=20;} //0.680966973힐링 원드
				case(230){itemString = `id:46001  `; iCumRate +=20;} //0.680966973라운드 실드
				case(231){itemString = `id:46006 `; iCumRate +=20;} //0.680966973카이트 실드
				case(232){itemString = `id:40172 `; iCumRate +=20;} //0.680966973그레이트 소드
				case(233){itemString = `id:40174 `; iCumRate +=20;} //0.680966973모닝스타
				case(234){itemString = `id:40177 `; iCumRate +=20;} //0.680966973워리어 액스
				case(235){itemString = `id:40180 `; iCumRate +=20;} //0.680966973홉네일 너클
				case(236){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.817160368거친
				case(237){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.817160368수상한
				case(238){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.817160368견고한
				case(239){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.817160368사막거미
				case(240){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.817160368특이한
				case(241){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.817160368거센
				case(242){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.817160368파멸의
				case(243){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.817160368매서운
				case(244){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.817160368기운찬
				case(245){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.817160368매정한
				case(246){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.817160368무정한
				case(247){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.817160368비참한
				case(248){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.817160368데들리
				case(249){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.817160368네이쳐
				case(250){itemString = `id:91034 `; iCumRate +=85;} //2.894109636경험치 증가 포션
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
/*
		// 의상이나 음식 획득
		int randomSetId = 1001;   // 고유 ID.. RandomItemSet.xlsm에 기입
		int itemIndex = GetItemIndexFromRandomSet(randomSetId, player);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
		bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);
*/

	}
	else if (GetLocale().LowerCase() == `usa`)
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(3240);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15079`; iCumRate += 1;}	//0.030864198 볼레로 앤 점퍼 스커트
				case(1){itemString = `id:15112`; iCumRate += 1;}	//0.030864198 셀리나 스쿨보이룩
				case(2){itemString = `id:15108`; iCumRate += 1;}	//0.030864198 섹시 레이디스 탱크탑
				case(3){itemString = `id:17042`; iCumRate += 1;}	//0.030864198 코레스 오리엔탈 롱 부츠
				case(4){itemString = `id:15064 col1:ff6699 col2:990000 col3:990000`; iCumRate += 1;}	//0.030864198 분홍 아이돌 리본 드레스
				case(5){itemString = `id:15060 col1:e8e8e8 col2:e8e8e8 col3:e8e8e8`; iCumRate += 1;}	//0.030864198 흰색 슬림 이너로브 웨어
				case(6){itemString = `id:17041 col1:101010 col2:101010 col3:101010`; iCumRate += 1;}	//0.030864198 검은색 덩굴무늬 헌팅부츠
				case(7){itemString = `id:15063`; iCumRate += 1;}	//0.030864198 레이어드 프릴 원피스
				case(8){itemString = `id:15113`; iCumRate += 1;}	//0.030864198 여성용 검사학교 교복 쇼트타입
				case(9){itemString = `id:15061`; iCumRate += 1;}	//0.030864198 물결무늬 옆트임 튜닉
				case(10){itemString = `id:15059`; iCumRate += 1;}	//0.030864198 터크스 탱크탑 반바지
				case(11){itemString = `id:15124 col1:ceeeff col2:002c76 col3:ff4419`; iCumRate += 1;}	//0.030864198 하늘색 클래식 슬리브 웨어
				case(12){itemString = `id:15065`; iCumRate += 1;}	//0.030864198 엘라 베스트 스커트
				case(13){itemString = `id:15074`; iCumRate += 1;}	//0.030864198 루이스 성직자 코트
				case(14){itemString = `id:18044 col1:101010`; iCumRate += 1;}	//0.030864198 검은색 범죄용 복면
				case(15){itemString = `id:63034 col1:c00000`; iCumRate += 1;}	//0.030864198 붉은색 염색 앰플
				case(16){itemString = `id:63033 col1:000000`; iCumRate += 1;}	//0.030864198 검은색 염색 앰플
				case(17){itemString = `id:15115`; iCumRate += 3;}	//0.092592593 재기드 미니 스커트
				case(18){itemString = `id:15017`; iCumRate += 3;}	//0.092592593 차이나드레스
				case(19){itemString = `id:18044`; iCumRate += 3;}	//0.092592593 범죄용 복면
				case(20){itemString = `id:16519`; iCumRate += 3;}	//0.092592593 초호화 장갑
				case(21){itemString = `id:18046`; iCumRate += 3;}	//0.092592593 왕관형 머리장식
				case(22){itemString = `id:15124`; iCumRate += 3;}	//0.092592593 클래식 슬리브 웨어
				case(23){itemString = `id:15060`; iCumRate += 3;}	//0.092592593 클래식 슬리브 웨어
				case(24){itemString = `id:17041`; iCumRate += 3;}	//0.092592593 덩굴무늬 헌팅부츠
				case(25){itemString = `id:15064`; iCumRate += 3;}	//0.092592593 아이돌 리본 드레스
				case(26){itemString = `id:15070`; iCumRate += 3;}	//0.092592593 아이돌 리본 드레스
				case(27){itemString = `id:40095`; iCumRate += 3;}	//0.092592593 드래곤 블레이드
				case(28){itemString = `id:19007`; iCumRate += 3;}	//0.092592593 야광 머플러 로브
				case(29){itemString = `id:18056`; iCumRate += 3;}	//0.092592593 털 토끼 머리띠1 (수리불가)
				case(30){itemString = `id:18057`; iCumRate += 3;}	//0.092592593 털 토끼 머리띠2  (수리불가)
				case(31){itemString = `id:18058`; iCumRate += 3;}	//0.092592593 털 토끼 머리띠3  (수리불가)
				case(32){itemString = `id:18059`; iCumRate += 3;}	//0.092592593 털 토끼 머리띠4  (수리불가)
				case(33){itemString = `id:18060`; iCumRate += 3;}	//0.092592593 털 토끼 머리띠5  (수리불가)
				case(34){itemString = `id:18061`; iCumRate += 3;}	//0.092592593 가죽 토끼 머리띠1  (수리불가)
				case(35){itemString = `id:18062`; iCumRate += 3;}	//0.092592593 가죽 토끼 머리띠2  (수리불가)
				case(36){itemString = `id:18063`; iCumRate += 3;}	//0.092592593 가죽 토끼 머리띠3  (수리불가)
				case(37){itemString = `id:18064`; iCumRate += 3;}	//0.092592593 가죽 토끼 머리띠4  (수리불가)
				case(38){itemString = `id:18065`; iCumRate += 3;}	//0.092592593 가죽 토끼 머리띠5  (수리불가)
				case(39){itemString = `id:18066`; iCumRate += 3;}	//0.092592593 별 토끼 머리띠1  (수리불가)
				case(40){itemString = `id:18067`; iCumRate += 3;}	//0.092592593 별 토끼 머리띠2  (수리불가)
				case(41){itemString = `id:18068`; iCumRate += 3;}	//0.092592593 별 토끼 머리띠3  (수리불가)
				case(42){itemString = `id:18069`; iCumRate += 3;}	//0.092592593 별 토끼 머리띠4  (수리불가)
				case(43){itemString = `id:18070`; iCumRate += 3;}	//0.092592593 별 토끼 머리띠5 (수리불가)
				case(44){itemString = `id:18096`; iCumRate += 3;}	//0.092592593 세이렌 고양이 가면
				case(45){itemString = `id:18097`; iCumRate += 3;}	//0.092592593 세이렌 깃털 가면
				case(46){itemString = `id:18098`; iCumRate += 3;}	//0.092592593 세이렌의 안경
				case(47){itemString = `id:18099`; iCumRate += 3;}	//0.092592593 세이렌 작은 날개 가면
				case(48){itemString = `id:18100`; iCumRate += 3;}	//0.092592593 세이렌 날개 가면
				case(49){itemString = `id:18101`; iCumRate += 3;}	//0.092592593 세이렌 박쥐 날개 가면
				case(50){itemString = `id:18102`; iCumRate += 3;}	//0.092592593 세이렌의 가면
				case(51){itemString = `id:15055`; iCumRate += 3;}	//0.092592593 레더 미니 원피스
				case(52){itemString = `id:62005 suffix:30501 expire:960`; iCumRate += 3;}	//0.092592593 인챈트 스크롤 (자이언트)
				case(53){itemString = `id:46006 suffix:30302 expire:960`; iCumRate += 3;}	//0.092592593 인챈트 스크롤 (코볼트)
				case(54){itemString = `id:15053`; iCumRate += 3;}	//0.092592593 카이트 실드
				case(55){itemString = `id:40030`; iCumRate += 3;}	//0.092592593 플랫칼라 원피스
				case(56){itemString = `id:17045`; iCumRate += 3;}	//0.092592593 투 핸디드 소드
				case(57){itemString = `id:14004`; iCumRate += 3;}	//0.092592593 브이 넥 라인 레더 부츠
				case(58){itemString = `id:17040`; iCumRate += 3;}	//0.092592593 클로스 메일
				case(59){itemString = `id:14004`; iCumRate += 3;}	//0.092592593 엘라 스트랩 부츠
				case(60){itemString = `id:17040`; iCumRate += 3;}	//0.092592593 이블 다잉 크라운
				case(61){itemString = `id:18521`; iCumRate += 3;}	//0.092592593 유러피안 컴프
				case(62){itemString = `id:15136`; iCumRate += 3;}	//0.092592593 고딕 레이스 스커트
				case(63){itemString = `id:18525`; iCumRate += 3;}	//0.092592593 워터드롭 캡
				case(64){itemString = `id:18511`; iCumRate += 3;}	//0.092592593 플루트 풀 헬름
				case(65){itemString = `id:18506`; iCumRate += 3;}	//0.092592593 윙 하프 헬름
				case(66){itemString = `id:17505`; iCumRate += 3;}	//0.092592593 플레이트 부츠
				case(67){itemString = `id:16505`; iCumRate += 3;}	//0.092592593 플레이트 부츠
				case(68){itemString = `id:18502`; iCumRate += 3;}	//0.092592593 본 헬름
				case(69){itemString = `id:15014`; iCumRate += 3;}	//0.092592593 파발꾼의 옷
				case(70){itemString = `id:18113`; iCumRate += 3;}	//0.092592593 뾰족귀 고양이 모자
				case(71){itemString = `id:18114`; iCumRate += 3;}	//0.092592593 줄무늬 고양이 모자
				case(72){itemString = `id:18115`; iCumRate += 3;}	//0.092592593 핀 고양이 모자
				case(73){itemString = `id:62005 suffix:30702 expire:960`; iCumRate += 3;}	//0.092592593 인챈트 스크롤 (레이븐)
				case(74){itemString = `id:62005 prefix:207 expire:960`; iCumRate += 3;}	//0.092592593 인챈트 스크롤 (폭스
				case(75){itemString = `id:16517`; iCumRate += 24;}	//0.740740741 반대 장갑
				case(76){itemString = `id:16516`; iCumRate += 24;}	//0.740740741 찬성 장갑
				case(77){itemString = `id:16515`; iCumRate += 24;}	//0.740740741 보 장갑
				case(78){itemString = `id:16514`; iCumRate += 24;}	//0.740740741 바위 장갑
				case(79){itemString = `id:16513`; iCumRate += 24;}	//0.740740741 가위 장갑
				case(80){itemString = `id:40068`; iCumRate += 24;}	//0.740740741 가위 모양 지시봉
				case(81){itemString = `id:40069`; iCumRate += 24;}	//0.740740741 바위 모양 지시봉
				case(82){itemString = `id:40070`; iCumRate += 24;}	//0.740740741 보 모양 지시봉
				case(83){itemString = `id:18112`; iCumRate += 24;}	//0.740740741 태양 분장
				case(84){itemString = `id:18111`; iCumRate += 24;}	//0.740740741 나무 분장
				case(85){itemString = `id:18110`; iCumRate += 24;}	//0.740740741 덤불 분장
				case(86){itemString = `id:18109`; iCumRate += 24;}	//0.740740741 나오 얼굴 분장
				case(87){itemString = `id:18108`; iCumRate += 24;}	//0.740740741 바위 분장
				case(88){itemString = `id:18029`; iCumRate += 24;}	//0.740740741 나무테 안경
				case(89){itemString = `id:18028`; iCumRate += 24;}	//0.740740741 접이식 안경
				case(90){itemString = `id:19008`; iCumRate += 24;}	//0.740740741 코코 판다 로브
				case(91){itemString = `id:19009`; iCumRate += 24;}	//0.740740741 코코 래빗 로브
				case(92){itemString = `id:19017`; iCumRate += 24;}	//0.740740741 코코 래빗 로브
				case(93){itemString = `id:19016`; iCumRate += 24;}	//0.740740741 곰 로브
				case(94){itemString = `id:40038`; iCumRate += 24;}	//0.740740741 라이트닝 원드
				case(95){itemString = `id:40039`; iCumRate += 24;}	//0.740740741 아이스 원드
				case(96){itemString = `id:40040`; iCumRate += 24;}	//0.740740741 파이어 원드
				case(97){itemString = `id:40041`; iCumRate += 24;}	//0.740740741 타격용 원드
				case(98){itemString = `id:40090`; iCumRate += 24;}	//0.740740741 힐링 원드
				case(99){itemString = `id:40053`; iCumRate += 24;}	//0.740740741 보라빛 장미 꽃다발
				case(100){itemString = `id:40051`; iCumRate += 24;}	//0.740740741 보라빛 장미 한송이
				case(101){itemString = `id:18089`; iCumRate += 24;}	//0.740740741 보라빛 장미 장식
				case(102){itemString = `id:40054`; iCumRate += 24;}	//0.740740741 파란 장미 꽃다발
				case(103){itemString = `id:40052`; iCumRate += 24;}	//0.740740741 파란 장미 한송이
				case(104){itemString = `id:16500`; iCumRate += 24;}	//0.740740741 울나 프로텍터 글러브
				case(105){itemString = `id:40056`; iCumRate += 24;}	//0.740740741 X 표시판
				case(106){itemString = `id:18542`; iCumRate += 24;}	//0.740740741 빅 체인 풀 헬름
				case(107){itemString = `id:18543`; iCumRate += 24;}	//0.740740741 슬릿 풀 헬름
				case(108){itemString = `id:18544`; iCumRate += 24;}	//0.740740741 펠리칸 프로텍터
				case(109){itemString = `id:18547`; iCumRate += 24;}	//0.740740741 파나쉬 헤드 프로텍터
				case(110){itemString = `id:19020`; iCumRate += 24;}	//0.740740741 나타네 설산용 코트
				case(111){itemString = `id:62005`; iCumRate += 24;}	//0.740740741 인챈트 스크롤 (폭스 헌터）
				case(112){itemString = `id:16520`; iCumRate += 24;}	//0.740740741 롱 레더 글러브
				case(113){itemString = `id:15128`; iCumRate += 24;}	//0.740740741 투 톤 비조 드레스
				case(114){itemString = `id:16019`; iCumRate += 24;}	//0.740740741 줄무늬 팔목 장갑
				case(115){itemString = `id:18047`; iCumRate += 24;}	//0.740740741 코레스 펠트 모자
				case(116){itemString = `id:18008`; iCumRate += 24;}	//0.740740741 스트라이프 캡
				case(117){itemString = `id:15025`; iCumRate += 24;}	//0.740740741 마법학교 여자교복
				case(118){itemString = `id:18500`; iCumRate += 24;}	//0.740740741 링 메일 헬름
				case(119){itemString = `id:17504`; iCumRate += 24;}	//0.740740741 라운드폴린 플레이트 부츠
				case(120){itemString = `id:18043`; iCumRate += 24;}	//0.740740741 코레스 니트 모자
				case(121){itemString = `id:17506`; iCumRate += 24;}	//0.740740741 롱그리브 부츠
				case(122){itemString = `id:18026`; iCumRate += 24;}	//0.740740741 몬거 상인모자
				case(123){itemString = `id:15052`; iCumRate += 24;}	//0.740740741 터크스 투톤 튜닉
				case(124){itemString = `id:19005`; iCumRate += 24;}	//0.740740741 머플러 로브
				case(125){itemString = `id:18040`; iCumRate += 24;}	//0.740740741 코레스 꼭지 베레모
				case(126){itemString = `id:18038`; iCumRate += 24;}	//0.740740741 깃털 배렛 모자
				case(127){itemString = `id:15042`; iCumRate += 24;}	//0.740740741 롱넥 원피스
				case(128){itemString = `id:46001`; iCumRate += 24;}	//0.740740741 라운드 실드
				case(129){itemString = `id:40012`; iCumRate += 24;}	//0.740740741 바스타드 소드
				case(130){itemString = `id:91006 expire:43200`; iCumRate += 22;}	//0.679012346 10살의 키가 되는 포션
				case(131){itemString = `id:91010 expire:43200`; iCumRate += 22;}	//0.679012346 11살의 키가 되는 포션
				case(132){itemString = `id:91011 expire:43200`; iCumRate += 22;}	//0.679012346 12살의 키가 되는 포션
				case(133){itemString = `id:91012 expire:43200`; iCumRate += 22;}	//0.679012346 13살의 키가 되는 포션
				case(134){itemString = `id:91013 expire:43200`; iCumRate += 22;}	//0.679012346 14살의 키가 되는 포션
				case(135){itemString = `id:91014 expire:43200`; iCumRate += 22;}	//0.679012346 15살의 키가 되는 포션
				case(136){itemString = `id:91015 expire:43200`; iCumRate += 22;}	//0.679012346 16살의 키가 되는 포션
				case(137){itemString = `id:91007 expire:43200`; iCumRate += 22;}	//0.679012346 17살의 키가 되는 포션
				case(138){itemString = `id:63025 count:3`; iCumRate += 22;}	//0.679012346 대용량 축복의 포션
				case(139){itemString = `id:51031 count:3`; iCumRate += 22;}	//0.679012346 완전 회복의 포션
				case(140){itemString = `id:63026`; iCumRate += 22;}	//0.679012346 원격 은행 이용권
				case(141){itemString = `id:63047`; iCumRate += 22;}	//0.679012346 원격 힐러집 이용권
				case(142){itemString = `id:63043`; iCumRate += 22;}	//0.679012346 어드밴스드 깃털
				case(143){itemString = `id:63043 count:3`; iCumRate += 22;}	//0.679012346 어드밴스드 깃털
				case(144){itemString = `id:63027 expire:10080`; iCumRate += 22;}	//0.679012346 밀랍 날개
				case(145){itemString = `id:63029 count:5`; iCumRate += 22;}	//0.679012346 캠프파이어키트
				case(146){itemString = `id:63044 count:3`; iCumRate += 22;}	//0.679012346 파티 부활의 깃털
				case(147){itemString = `id:63039 expire:10080`; iCumRate += 22;}	//0.679012346 캠프 키트
				case(148){itemString = `id:51003 count:5`; iCumRate += 22;}	//0.679012346 생명력 50 포션
				case(149){itemString = `id:51004 count:3`; iCumRate += 22;}	//0.679012346 생명력 100 포션
				case(150){itemString = `id:51007`; iCumRate += 22;}	//0.679012346 마나 30 포션
				case(151){itemString = `id:51008 count:5`; iCumRate += 22;}	//0.679012346 마나 50 포션
				case(152){itemString = `id:51013 count:5`; iCumRate += 22;}	//0.679012346 스태미나 50 포션
				case(153){itemString = `id:51014 count:3`; iCumRate += 22;}	//0.679012346 스태미나 100 포션
				case(154){itemString = `id:51001 count:5`; iCumRate += 22;}	//0.679012346 생명력 10 포션
				case(155){itemString = `id:51002 count:3`; iCumRate += 22;}	//0.679012346 생명력 30 포션
				case(156){itemString = `id:51022 count:5`; iCumRate += 22;}	//0.679012346 생명력과 마나 30 포션
				case(157){itemString = `id:51027 count:5`; iCumRate += 22;}	//0.679012346 생명력과 스태미나 30 포션
				case(158){itemString = `id:51028 count:3`; iCumRate += 22;}	//0.679012346 생명력과 스태미나 50 포션
				case(159){itemString = `id:51029`; iCumRate += 22;}	//0.679012346 생명력과 스태미나 100 포션
				case(160){itemString = `id:63000`; iCumRate += 22;}	//0.679012346 피닉스의 깃털
				case(161){itemString = `id:51036`; iCumRate += 22;}	//0.679012346 다이어트 포션 U
				case(162){itemString = `id:51038`; iCumRate += 22;}	//0.679012346 다이어트 포션 L
				case(163){itemString = `id:51039`; iCumRate += 22;}	//0.679012346 다이어트 포션 F
				case(164){itemString = `id:17006`; iCumRate += 22;}	//0.679012346 천신발
				case(165){itemString = `id:18086`; iCumRate += 22;}	//0.679012346 데이지 꽃 장식
				case(166){itemString = `id:18087`; iCumRate += 22;}	//0.679012346 장미 꽃 장식
				case(167){itemString = `id:18088`; iCumRate += 22;}	//0.679012346 화관
				case(168){itemString = `id:18090`; iCumRate += 22;}	//0.679012346 파란 장미 장식
				case(169){itemString = `id:40046`; iCumRate += 22;}	//0.679012346 장미 한송이
				case(170){itemString = `id:40047`; iCumRate += 22;}	//0.679012346 장미 꽃다발
				case(171){itemString = `id:18541`; iCumRate += 22;}	//0.679012346 대머리 가발
				case(172){itemString = `id:18103`; iCumRate += 22;}	//0.679012346 종이 모자
				case(173){itemString = `id:40071`; iCumRate += 5;}	//0.154320988 '라' 음 빈 병
				case(174){itemString = `id:40072`; iCumRate += 5;}	//0.154320988 '시' 음 빈 병
				case(175){itemString = `id:40073`; iCumRate += 5;}	//0.154320988 '도' 음 빈 병
				case(176){itemString = `id:40074`; iCumRate += 5;}	//0.154320988 '레' 음 빈 병
				case(177){itemString = `id:40075`; iCumRate += 5;}	//0.154320988 '미' 음 빈 병
				case(178){itemString = `id:40076`; iCumRate += 5;}	//0.154320988 '파' 음 빈 병
				case(179){itemString = `id:40077`; iCumRate += 5;}	//0.154320988 '솔' 음 빈 병
				case(180){itemString = `id:60037 count:5`; iCumRate += 22;}	//0.679012346 블랙 유스 포션
				case(181){itemString = `id:60038 count:5`; iCumRate += 22;}	//0.679012346 레드 포션
				case(182){itemString = `id:62004 count:5`; iCumRate += 22;}	//0.679012346 마법가루
				case(183){itemString = `id:50012`; iCumRate += 22;}	//0.679012346 황금 달걀
				case(184){itemString = `id:50013`; iCumRate += 22;}	//0.679012346 황금 사과
				case(185){itemString = `id:50164 quality:100`; iCumRate += 22;}	//0.679012346 T본 스테이크 100퀄리티
				case(186){itemString = `id:50201 quality:100`; iCumRate += 22;}	//0.679012346 BnR 100퀄리티
				case(187){itemString = `id:50123 quality:100`; iCumRate += 22;}	//0.679012346 베이컨구이 100퀄리티
				case(188){itemString = `id:50124 quality:100`; iCumRate += 22;}	//0.679012346 비프 스테이크 100퀄리티
				case(189){itemString = `id:50202`; iCumRate += 22;}	//0.679012346 키스 온 더 립스
				case(190){itemString = `id:50203`; iCumRate += 22;}	//0.679012346 레드 선라이즈
				case(191){itemString = `id:2001`; iCumRate += 22;}	//0.679012346 금화주머니
				case(192){itemString = `id:2006`; iCumRate += 22;}	//0.679012346 큰 금화주머니
				case(193){itemString = `id:18010`; iCumRate += 22;}	//0.679012346 몬거 스마트 캡
				case(194){itemString = `id:15131`; iCumRate += 22;}	//0.679012346 핀 에이프런 스커트
				case(195){itemString = `id:40015`; iCumRate += 22;}	//0.679012346 플루트 숏 소드
				case(196){itemString = `id:17016`; iCumRate += 22;}	//0.679012346 필드 컴뱃슈즈
				case(197){itemString = `id:17015`; iCumRate += 22;}	//0.679012346 컴뱃슈즈
				case(198){itemString = `id:17005`; iCumRate += 22;}	//0.679012346 사냥꾼 신발
				case(199){itemString = `id:17002`; iCumRate += 22;}	//0.679012346 검사 신발
				case(200){itemString = `id:17022`; iCumRate += 22;}	//0.679012346 레더부츠
				case(201){itemString = `id:17001`; iCumRate += 22;}	//0.679012346 가죽 부츠
				case(202){itemString = `id:17007`; iCumRate += 22;}	//0.679012346 가죽 구두
				case(203){itemString = `id:16009`; iCumRate += 22;}	//0.679012346 사냥꾼장갑
				case(204){itemString = `id:40005`; iCumRate += 22;}	//0.679012346 숏 소드
				case(205){itemString = `id:15031`; iCumRate += 22;}	//0.679012346 마법학교 교복
				case(206){itemString = `id:19012`; iCumRate += 22;}	//0.679012346 트루디 레이어드 로브
				case(207){itemString = `id:18004`; iCumRate += 22;}	//0.679012346 몬거 패션모자
				case(208){itemString = `id:15132`; iCumRate += 22;}	//0.679012346 내추럴 베스트 웨어
				case(209){itemString = `id:15043`; iCumRate += 22;}	//0.679012346 스포티 웨어세트
				case(210){itemString = `id:40010`; iCumRate += 22;}	//0.679012346 @롱 소드
				case(211){itemString = `id:40081`; iCumRate += 22;}	//0.679012346 @레더 롱 보우
				case(212){itemString = `id:40078`; iCumRate += 22;}	//0.679012346 @비펜니스
				case(213){itemString = `id:40079`; iCumRate += 22;}	//0.679012346 @메이스
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
	else //if(GetLocale().LowerCase()== `japan`) //일본의 경우만을 특화하려면 여따 또 써야하는데.. 현재는 중국 아닌 다른 곳에는 이걸 줘야하니까 걍 else절에 몰아 넣습니다. 나중에 일본을 추가하더래도 else에 나머지국가들에 뭐 줄지는 적어야 합니다.
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(2091);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15251`; iCumRate += 1;} //0.0478240077 2091메이드 의상 롱 타입
				case(1){itemString = `id:15250`; iCumRate += 1;} //0.0478240077 2091메이드 의상 쇼트 타입
				case(2){itemString = `id:15252`; iCumRate += 1;} //0.0478240077 2091집사 의상
				case(3){itemString = `id:18005 durability:30000 durability_max:30000`; iCumRate += 1;} //0.0478240077 2091몬거 마법사모자
				case(4){itemString = `id:18048 durability:25000 durability_max:25000`; iCumRate += 1;} //0.0478240077 2091몬거 넓은챙 마법사 모자
				case(5){itemString = `id:15117 suffix:31202`; iCumRate += 2;} //0.0956480153 2091남성용 마법사 정장（자칼）
				case(6){itemString = `id:15117 suffix:31301`; iCumRate += 2;} //0.0956480153 2091남성용 마법사 정장（새끼너구리）
				case(7){itemString = `id:15116 suffix:31202`; iCumRate += 2;} //0.0956480153 2091여성용 마법사 정장（자칼）
				case(8){itemString = `id:15116 suffix:31301`; iCumRate += 2;} //0.0956480153 2091여성용 마법사 정장（새끼너구리）
				case(9){itemString = `id:18176`; iCumRate += 2;} //0.0956480153 2091메이드 머리띠
				case(10){itemString = `id:15079`; iCumRate += 4;} //0.1912960306 2091볼레로 앤 점퍼 스커트
				case(11){itemString = `id:15112 durability:19000 durability_max:19000`; iCumRate += 4;} //0.1912960306 2091셀리나 스쿨보이룩
				case(12){itemString = `id:15108 durability:19000 durability_max:19000`; iCumRate += 4;} //0.1912960306 2091섹시 레이디스 탱크탑
				case(13){itemString = `id:17042 durability:17000 durability_max:17000`; iCumRate += 4;} //0.1912960306 2091코레스 오리엔탈 롱 부츠
				case(14){itemString = `id:15063 durability:10000 durability_max:10000`; iCumRate += 4;} //0.1912960306 2091레이어드 프릴 원피스
				case(15){itemString = `id:15113`; iCumRate += 4;} //0.1912960306 2091여성용 검사학교 교복 쇼트타입
				case(16){itemString = `id:15061 durability:20000 durability_max:20000`; iCumRate += 4;} //0.1912960306 2091물결무늬 옆트임 튜닉
				case(17){itemString = `id:15059 durability:30000 durability_max:30000`; iCumRate += 4;} //0.1912960306 2091터크스 탱크탑 반바지
				case(18){itemString = `id:15065`; iCumRate += 4;} //0.1912960306 2091엘라 베스트 스커트
				case(19){itemString = `id:15074 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091루이스 성직자 코트
				case(20){itemString = `id:63034 col1:c00000`; iCumRate += 4;} //0.1912960306 2091붉은색 염색 앰플(색 지정)
				case(21){itemString = `id:63033 col1:000000`; iCumRate += 4;} //0.1912960306 2091검은색 염색 앰플(색 지정)
				case(22){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091재기드 미니 스커트
				case(23){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 4;} //0.1912960306 2091차이나드레스
				case(24){itemString = `id:18044`; iCumRate += 4;} //0.1912960306 2091범죄용 복면
				case(25){itemString = `id:16519`; iCumRate += 4;} //0.1912960306 2091초호화 장갑
				case(26){itemString = `id:18046`; iCumRate += 4;} //0.1912960306 2091왕관형 머리장식
				case(27){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 4;} //0.1912960306 2091클래식 슬리브 웨어
				case(28){itemString = `id:15060`; iCumRate += 4;} //0.1912960306 2091슬림 이너로브 웨어
				case(29){itemString = `id:17041`; iCumRate += 4;} //0.1912960306 2091덩굴무늬 헌팅부츠
				case(30){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091아이돌 리본 드레스
				case(31){itemString = `id:15070 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091스탠드칼라 슬리브리스
				case(32){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 4;} //0.1912960306 2091야광 머플러 로브
				case(33){itemString = `id:18060`; iCumRate += 4;} //0.1912960306 2091털 토끼 머리띠5
				case(34){itemString = `id:18065`; iCumRate += 4;} //0.1912960306 2091가죽 토끼 머리띠5
				case(35){itemString = `id:18070`; iCumRate += 4;} //0.1912960306 2091별 토끼 머리띠5
				case(36){itemString = `id:18051`; iCumRate += 4;} //0.1912960306 2091코레스 리본 모자
				case(37){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate += 4;} //0.1912960306 2091코레스 닌자슈트
				case(38){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 4;} //0.1912960306 2091동양풍 무사복
				case(39){itemString = `id:15055`; iCumRate += 10;} //0.4782400765 2091레더 미니 원피스
				case(40){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.4782400765 2091인챈트（자이언트）
				case(41){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.4782400765 2091인챈트（코볼트）
				case(42){itemString = `id:46006`; iCumRate += 10;} //0.4782400765 2091카이트 실드
				case(43){itemString = `id:15053`; iCumRate += 10;} //0.4782400765 2091플랫칼라 원피스
				case(44){itemString = `id:17045`; iCumRate += 10;} //0.4782400765 2091브이 넥 라인 레더 부츠
				case(45){itemString = `id:17040`; iCumRate += 10;} //0.4782400765 2091엘라 스트랩 부츠
				case(46){itemString = `id:15136`; iCumRate += 10;} //0.4782400765 2091고딕 레이스 스커트
				case(47){itemString = `id:18525`; iCumRate += 10;} //0.4782400765 2091워터드롭 캡
				case(48){itemString = `id:15014`; iCumRate += 10;} //0.4782400765 2091파발꾼의 옷
				case(49){itemString = `id:18113`; iCumRate += 10;} //0.4782400765 2091뾰족귀 고양이 모자
				case(50){itemString = `id:18114`; iCumRate += 10;} //0.4782400765 2091줄무늬 고양이 모자
				case(51){itemString = `id:18115`; iCumRate += 10;} //0.4782400765 2091핀 고양이 모자
				case(52){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.4782400765 2091인챈트（레이븐）
				case(53){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.4782400765 2091인챈트（폭스）
				case(54){itemString = `id:63030 col1:ffffff`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(55){itemString = `id:63030 col1:00c000`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(56){itemString = `id:63030 col1:0000c0`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(57){itemString = `id:63030 col1:c0c000`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(58){itemString = `id:63030 col1:c000c0`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(59){itemString = `id:63030 col1:00c0c0`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플（색 지정）
				case(60){itemString = `id:15029`; iCumRate += 10;} //0.4782400765 2091토크 대장장이옷
				case(61){itemString = `id:15151`; iCumRate += 10;} //0.4782400765 2091뉴욕마리오 웨이스트 테일러 웨어（남성용）
				case(62){itemString = `id:15152`; iCumRate += 10;} //0.4782400765 2091뉴욕마리오 웨이스트 테일러 웨어（여성용）
				case(63){itemString = `id:15153`; iCumRate += 10;} //0.4782400765 2091산드라 스나이퍼 수트（남성용）
				case(64){itemString = `id:15154`; iCumRate += 10;} //0.4782400765 2091산드라 스나이퍼 수트（여성용）
				case(65){itemString = `id:15032`; iCumRate += 10;} //0.4782400765 2091리리나 반바지
				case(66){itemString = `id:15045`; iCumRate += 10;} //0.4782400765 2091레이스 플래킷 예복
				case(67){itemString = `id:15026`; iCumRate += 10;} //0.4782400765 2091리리나 롱스커트
				case(68){itemString = `id:15016`; iCumRate += 10;} //0.4782400765 2091의장용 스타킹 유니폼
				case(69){itemString = `id:15051`; iCumRate += 10;} //0.4782400765 2091타이트 벨트 웨어
				case(70){itemString = `id:19031`; iCumRate += 10;} //0.4782400765 2091스타라이트 로브
				case(71){itemString = `id:18011`; iCumRate += 10;} //0.4782400765 2091몬거 제스터 캡
				case(72){itemString = `id:18124`; iCumRate += 10;} //0.4782400765 2091산드라 스나이퍼 수트 캡
				case(73){itemString = `id:18009`; iCumRate += 10;} //0.4782400765 2091몬거 아쳐 캡
				case(74){itemString = `id:18014`; iCumRate += 10;} //0.4782400765 2091몬거 모자
				case(75){itemString = `id:18000`; iCumRate += 10;} //0.4782400765 2091토크 모자
				case(76){itemString = `id:16013`; iCumRate += 10;} //0.4782400765 2091검사 장갑
				case(77){itemString = `id:16032`; iCumRate += 10;} //0.4782400765 2091엘빈 글러브
				case(78){itemString = `id:63030`; iCumRate += 10;} //0.4782400765 2091지정 색상 염색 앰플
				case(79){itemString = `id:18112`; iCumRate += 15;} //0.7173601148 2091해 분장 소품
				case(80){itemString = `id:18111`; iCumRate += 15;} //0.7173601148 2091나무 분장 소품
				case(81){itemString = `id:18110`; iCumRate += 15;} //0.7173601148 2091덤불 분장 소품
				case(82){itemString = `id:18109`; iCumRate += 15;} //0.7173601148 2091나오 분장 소품
				case(83){itemString = `id:18108`; iCumRate += 15;} //0.7173601148 2091바위 분장 소품
				case(84){itemString = `id:18029`; iCumRate += 15;} //0.7173601148 2091나무테 안경
				case(85){itemString = `id:18028`; iCumRate += 15;} //0.7173601148 2091접이식 안경
				case(86){itemString = `id:19008`; iCumRate += 15;} //0.7173601148 2091코코 판다 로브
				case(87){itemString = `id:19009`; iCumRate += 15;} //0.7173601148 2091코코 래빗 로브
				case(88){itemString = `id:19017`; iCumRate += 15;} //0.7173601148 2091늑대 로브
				case(89){itemString = `id:19016`; iCumRate += 15;} //0.7173601148 2091곰 로브
				case(90){itemString = `id:40053`; iCumRate += 15;} //0.7173601148 2091보라빛 장미 꽃다발
				case(91){itemString = `id:40051`; iCumRate += 15;} //0.7173601148 2091보라빛 장미 한송이
				case(92){itemString = `id:18089`; iCumRate += 15;} //0.7173601148 2091보라빛 장미 장식
				case(93){itemString = `id:40054`; iCumRate += 15;} //0.7173601148 2091파란 장미 꽃다발
				case(94){itemString = `id:40052`; iCumRate += 15;} //0.7173601148 2091파란 장미 한송이
				case(95){itemString = `id:16500`; iCumRate += 15;} //0.7173601148 2091울나 프로텍터 글러브
				case(96){itemString = `id:19020`; iCumRate += 15;} //0.7173601148 2091나타네 설산용 코트
				case(97){itemString = `id:62005 prefix:7`; iCumRate += 15;} //0.7173601148 2091인챈트（폭스헌터）
				case(98){itemString = `id:16520`; iCumRate += 15;} //0.7173601148 2091롱 레더 글러브
				case(99){itemString = `id:15128`; iCumRate += 15;} //0.7173601148 2091투 톤 비조 드레스
				case(100){itemString = `id:16019`; iCumRate += 15;} //0.7173601148 2091줄무늬 팔목 장갑
				case(101){itemString = `id:18047`; iCumRate += 15;} //0.7173601148 2091코레스 펠트 모자
				case(102){itemString = `id:18008`; iCumRate += 15;} //0.7173601148 2091스트라이프 캡
				case(103){itemString = `id:15025`; iCumRate += 15;} //0.7173601148 2091마법학교 여자교복
				case(104){itemString = `id:18043`; iCumRate += 15;} //0.7173601148 2091코레스 니트 모자
				case(105){itemString = `id:18026`; iCumRate += 15;} //0.7173601148 2091몬거 상인모자
				case(106){itemString = `id:15052`; iCumRate += 15;} //0.7173601148 2091터크스 투톤 튜닉
				case(107){itemString = `id:19005`; iCumRate += 15;} //0.7173601148 2091머플러 로브
				case(108){itemString = `id:18040`; iCumRate += 15;} //0.7173601148 2091코레스 꼭지 베레모
				case(109){itemString = `id:18038`; iCumRate += 15;} //0.7173601148 2091깃털 배렛 모자
				case(110){itemString = `id:15042`; iCumRate += 15;} //0.7173601148 2091롱넥 원피스
				case(111){itemString = `id:91006 expire:43200`; iCumRate += 15;} //0.7173601148 209110살의 키가 되는 포션
				case(112){itemString = `id:91010 expire:43200`; iCumRate += 15;} //0.7173601148 209111살의 키가 되는 포션
				case(113){itemString = `id:91011 expire:43200`; iCumRate += 15;} //0.7173601148 209112살의 키가 되는 포션
				case(114){itemString = `id:91012 expire:43200`; iCumRate += 15;} //0.7173601148 209113살의 키가 되는 포션
				case(115){itemString = `id:91013 expire:43200`; iCumRate += 15;} //0.7173601148 209114살의 키가 되는 포션
				case(116){itemString = `id:91014 expire:43200`; iCumRate += 15;} //0.7173601148 209115살의 키가 되는 포션
				case(117){itemString = `id:91015 expire:43200`; iCumRate += 15;} //0.7173601148 209116살의 키가 되는 포션
				case(118){itemString = `id:91007 expire:43200`; iCumRate += 15;} //0.7173601148 209117살의 키가 되는 포션
				case(119){itemString = `id:63025 count:3`; iCumRate += 15;} //0.7173601148 2091대용량 축복의 포션
				case(120){itemString = `id:51031 count:3`; iCumRate += 15;} //0.7173601148 2091완전 회복의 포션
				case(121){itemString = `id:51036`; iCumRate += 15;} //0.7173601148 2091다이어트 포션 U
				case(122){itemString = `id:51038`; iCumRate += 15;} //0.7173601148 2091다이어트 포션 L
				case(123){itemString = `id:51039`; iCumRate += 15;} //0.7173601148 2091다이어트 포션 F
				case(124){itemString = `id:17006`; iCumRate += 15;} //0.7173601148 2091천신발
				case(125){itemString = `id:18086`; iCumRate += 15;} //0.7173601148 2091데이지 꽃 장식
				case(126){itemString = `id:18087`; iCumRate += 15;} //0.7173601148 2091장미 꽃 장식
				case(127){itemString = `id:18088`; iCumRate += 15;} //0.7173601148 2091화관
				case(128){itemString = `id:18090`; iCumRate += 15;} //0.7173601148 2091파란 장미 장식
				case(129){itemString = `id:40046`; iCumRate += 15;} //0.7173601148 2091장미 한송이
				case(130){itemString = `id:40047`; iCumRate += 15;} //0.7173601148 2091장미 꽃다발
				case(131){itemString = `id:18541`; iCumRate += 15;} //0.7173601148 2091대머리 가발
				case(132){itemString = `id:18103`; iCumRate += 15;} //0.7173601148 2091종이 모자
				case(133){itemString = `id:60037 count:5`; iCumRate += 15;} //0.7173601148 2091블랙 유스 포션
				case(134){itemString = `id:60038 count:5`; iCumRate += 15;} //0.7173601148 2091레드 포션
				case(135){itemString = `id:18010`; iCumRate += 15;} //0.7173601148 2091몬거 스마트 캡
				case(136){itemString = `id:15131`; iCumRate += 15;} //0.7173601148 2091핀 에이프런 스커트
				case(137){itemString = `id:17016`; iCumRate += 15;} //0.7173601148 2091필드 컴뱃슈즈
				case(138){itemString = `id:17015`; iCumRate += 15;} //0.7173601148 2091컴뱃슈즈
				case(139){itemString = `id:17005`; iCumRate += 15;} //0.7173601148 2091사냥꾼 신발
				case(140){itemString = `id:17002`; iCumRate += 15;} //0.7173601148 2091검사 신발
				case(141){itemString = `id:17022`; iCumRate += 15;} //0.7173601148 2091레더부츠
				case(142){itemString = `id:17001`; iCumRate += 15;} //0.7173601148 2091가죽 부츠
				case(143){itemString = `id:17007`; iCumRate += 15;} //0.7173601148 2091가죽 구두
				case(144){itemString = `id:16009`; iCumRate += 15;} //0.7173601148 2091사냥꾼장갑
				case(145){itemString = `id:15031`; iCumRate += 15;} //0.7173601148 2091마법학교의 남자 교복
				case(146){itemString = `id:19012`; iCumRate += 15;} //0.7173601148 2091트루디 레이어드 로브
				case(147){itemString = `id:18004`; iCumRate += 15;} //0.7173601148 2091몬거 패션모자
				case(148){itemString = `id:15132`; iCumRate += 15;} //0.7173601148 2091내추럴 베스트 웨어
				case(149){itemString = `id:15043`; iCumRate += 15;} //0.7173601148 2091스포티 웨어세트
				case(150){itemString = `id:17017`; iCumRate += 15;} //0.7173601148 2091레더코트 슈즈
				case(151){itemString = `id:16006`; iCumRate += 15;} //0.7173601148 2091가디언 장갑
				case(152){itemString = `id:16017`; iCumRate += 15;} //0.7173601148 2091스탠다드 글러브
				case(153){itemString = `id:17060`; iCumRate += 15;} //0.7173601148 2091산드라 스나이퍼 수트 부츠(남성용)
				case(154){itemString = `id:17061`; iCumRate += 15;} //0.7173601148 2091산드라 스나이퍼 수트 부츠(여성용)
				case(155){itemString = `id:17019`; iCumRate += 15;} //0.7173601148 2091대장장이 신발
				case(156){itemString = `id:17067`; iCumRate += 15;} //0.7173601148 2091엑스 타이 업 슈즈
				case(157){itemString = `id:17008`; iCumRate += 15;} //0.7173601148 2091코레스 부츠（여성용）
				case(158){itemString = `id:17010`; iCumRate += 15;} //0.7173601148 2091코레스 부츠（남성용）
				case(159){itemString = `id:17023`; iCumRate += 15;} //0.7173601148 2091에나멜 신발
				case(160){itemString = `id:16031`; iCumRate += 15;} //0.7173601148 2091쓰리라인 타이트 글러브
				case(161){itemString = `id:16026`; iCumRate += 15;} //0.7173601148 2091산드라 스나이퍼 수트 글러브
				case(162){itemString = `id:16016`; iCumRate += 15;} //0.7173601148 2091라이트 글러브
				case(163){itemString = `id:17003`; iCumRate += 15;} //0.7173601148 2091가죽 신발（남성용）
				case(164){itemString = `id:17024`; iCumRate += 15;} //0.7173601148 2091통굽 샌달
				case(165){itemString = `id:17013`; iCumRate += 15;} //0.7173601148 2091두꺼운 샌달
				case(166){itemString = `id:17069`; iCumRate += 15;} //0.7173601148 2091레오 슈즈
				case(167){itemString = `id:15020`; iCumRate += 15;} //0.7173601148 2091코레스 힐러드레스
				case(168){itemString = `id:15044`; iCumRate += 15;} //0.7173601148 2091목수용 작업복
				case(169){itemString = `id:15041`; iCumRate += 15;} //0.7173601148 2091사무직 여성용 슈트
				case(170){itemString = `id:15027`; iCumRate += 15;} //0.7173601148 2091몬거 롱스커트
				case(171){itemString = `id:15018`; iCumRate += 15;} //0.7173601148 2091몬거 여행자옷（여성용）
				case(172){itemString = `id:15033`; iCumRate += 15;} //0.7173601148 2091몬거 여행자옷(남성용）
				case(173){itemString = `id:15023`; iCumRate += 15;} //0.7173601148 2091토크 사냥꾼옷（여성용）
				case(174){itemString = `id:15035`; iCumRate += 15;} //0.7173601148 2091토크 사냥꾼옷（남성용）
				case(175){itemString = `id:19003`; iCumRate += 15;} //0.7173601148 2091트리콜로르 로브
				case(176){itemString = `id:63024 expire:10080`; iCumRate += 15;} //0.7173601148 2091염색 앰플
				case(177){itemString = `id:18002`; iCumRate += 15;} //0.7173601148 2091몬거 캡
				case(178){itemString = `id:18007`; iCumRate += 15;} //0.7173601148 2091포포 캡
				case(179){itemString = `id:18013`; iCumRate += 15;} //0.7173601148 2091코레스 캡
				case(180){itemString = `id:18156`; iCumRate += 15;} //0.7173601148 2091고글 모자
				case(181){itemString = `id:18042`; iCumRate += 15;} //0.7173601148 2091코레스 동양식 모자
				case(182){itemString = `id:18003`; iCumRate += 15;} //0.7173601148 2091리리나 캡
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
}
