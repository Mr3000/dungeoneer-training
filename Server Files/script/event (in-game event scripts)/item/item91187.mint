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
}
