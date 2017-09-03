////////////////////////////////////////////////////////////////////////////////
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

 // 중국 A그룹, B그룹 나눈 스크립트 잠시 보류
{
	// 아머 가챠폰
	int itemID = cItem.GetClassId();
	// 중국의 경우
	bool bCashGachaphonGived = false;	//캐시
	bool bLivingGachaphonGived2 = false;	//A그룹
	bool bLivingGachaphonGived = false;	//B그룹
	{
	// 중국의 경우
	// 중국 생활 가차폰은 캐시가차폰과 생활 가차폰을 동시에 준다.
	// 캐시 가차폰
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		meta_array itemArray;
		while(true)
		{
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0) {iCumRate +=	9;}
				case(1) {iCumRate += 9;}
				case(2) {iCumRate += 11;}
				case(3) {iCumRate +=	9;}
				case(4) {iCumRate +=	9;}
				case(5) {iCumRate +=	11;}
				case(6) {iCumRate +=	13;}
				case(7) {iCumRate +=	9;}
				case(8) {iCumRate += 11;}
				case(9) {iCumRate +=	4;}
				case(10) {	iCumRate += 5;}
			}
			if (iRandom < iCumRate)
			{
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0)	// 	
					{
						itemString = `id:91002 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91001 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(1) //	 
					{
						itemString = `id:91004 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91003 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(2) //
					{
						itemString = `id:63064 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63074 count:6`;
						itemArray.Add(itemString);
						itemString = `id:63075 count:6`;
						itemArray.Add(itemString);
					}
					case(3) //
					{
						itemString = `id:63026 count:9`;
						itemArray.Add(itemString);
						itemString = `id:63047 count:8`;
						itemArray.Add(itemString);
					}
					case(4) //
					{
						itemString = `id:63043 count:7`;
						itemArray.Add(itemString);
						itemString = `id:63044 count:5`;
						itemArray.Add(itemString);
					}
					case(5) //
					{
						itemString = `id:63027 expire:10080`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:63029 count:9`;
						itemArray.Add(itemString);
					}
					case(6) //
					{
						itemString = `id:91007 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91006 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(7) //
					{
						itemString = `id:63025 count:2`;
						itemArray.Add(itemString);
						itemString = `id:91005 expire:43200`;
						// 번들이 아니기 때문에 따로 3개 지급
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(8) //
					{
						itemString = `id:51031 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63024 expire:10080`;
						// 번들이 아니기 때문에 따로 2개 지급
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(9) //
					{
						itemString = `id:91066`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91067`;
						itemArray.Add(itemString);
					}
					case(10) //	4.0000000000 	100	완전 회복의 포션
					{
						itemString = `id:91059`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91063`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
				}
				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemString = (string)itemArray.Get(j);
					DebugOut(`유저에게 `+itemString+` 를 줌`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			}
				bCashGachaphonGived = true;
			}
			if (bCashGachaphonGived)
			{
				break;
			}
			++i;
		}
	}
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:91193 `; iCumRate +=7;} //5스켈레톤 호루라기
				case(1){itemString = `id:91194 `; iCumRate +=14;} //5스켈레톤 호루라기
				case(2){itemString = `id:91195 `; iCumRate +=4;} //5스켈레톤 호루라기
				case(3){itemString = `id:91159 `; iCumRate +=30;} //15홍빠오경험치 2배 포션 (30분)
				case(4){itemString = `id:63024 expire:10080`; iCumRate +=30;} //25염색 앰플
				case(5){itemString = `id:91066 `; iCumRate +=15;} //55정령 무기 수리 포션
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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bLivingGachaphonGived2 = true;
			}
			if (bLivingGachaphonGived2)
			{
				break;
			}
				++i;
		}
	}
		// 아머 가차폰
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(3468);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:19084 `; iCumRate +=1;} //0.028835063도렌로브
				case(1){itemString = `id:17237 `; iCumRate +=1;} //0.028835063도렌신발
				case(2){itemString = `id:15601 `; iCumRate +=1;} //0.028835063케이 의상
				case(3){itemString = `id:17325 `; iCumRate +=1;} //0.028835063케이 신발
				case(4){itemString = `id:15602 `; iCumRate +=1;} //0.028835063레이모어 의상 
				case(5){itemString = `id:17236 `; iCumRate +=1;} //0.028835063레이모어 신발 
				case(6){itemString = `id:15325 `; iCumRate +=3;} //0.08650519박쥐 자켓 (남성용)
				case(7){itemString = `id:15326 `; iCumRate +=3;} //0.08650519박쥐 드레스 (여성용)
				case(8){itemString = `id:14047 `; iCumRate +=3;} //0.08650519불꽃 문양 레더 아머 (남성용)
				case(9){itemString = `id:14048 `; iCumRate +=3;} //0.08650519불꽃 문양 레더 아머 (여성용)
				case(10){itemString = `id:14049 `; iCumRate +=3;} //0.08650519야만적인 여우 갑옷 (남성용)
				case(11){itemString = `id:14050 `; iCumRate +=3;} //0.08650519야만적인 여우 갑옷 (여성용)
				case(12){itemString = `id:15315 `; iCumRate +=3;} //0.08650519아스틴 댄디 수트
				case(13){itemString = `id:15314 `; iCumRate +=3;} //0.08650519비앙카 윙 볼레로
				case(14){itemString = `id:15294 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519남성용 수영복
				case(15){itemString = `id:15295 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519여성용 수영복
				case(16){itemString = `id:18187 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519커다란 리본
				case(17){itemString = `id:18188 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519안대
				case(18){itemString = `id:18189 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519카우보이 모자
				case(19){itemString = `id:17132 `; iCumRate +=3;} //0.08650519박쥐 부츠
				case(20){itemString = `id:18566 `; iCumRate +=3;} //0.08650519박쥐 모자
				case(21){itemString = `id:18559 `; iCumRate +=3;} //0.08650519불꽃 문양 레더 캡
				case(22){itemString = `id:18227 `; iCumRate +=3;} //0.08650519아스틴 캡
				case(23){itemString = `id:18226 `; iCumRate +=3;} //0.08650519비앙카 캡
				case(24){itemString = `id:15079 `; iCumRate +=3;} //0.08650519볼레로 앤 점퍼 스커트
				case(25){itemString = `id:15222 `; iCumRate +=3;} //0.08650519그레이스 숄 드레스(여성용)
				case(26){itemString = `id:15250 `; iCumRate +=3;} //0.08650519메이드 의상 쇼트 타입
				case(27){itemString = `id:15251 `; iCumRate +=3;} //0.08650519메이드 의상 롱 타입
				case(28){itemString = `id:15252 `; iCumRate +=3;} //0.08650519집사 의상
				case(29){itemString = `id:16046 `; iCumRate +=3;} //0.08650519고양이 손 장갑
				case(30){itemString = `id:15065 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519엘라 베스트 스커트
				case(31){itemString = `id:15112 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519셀리나 스쿨보이룩
				case(32){itemString = `id:15113 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519여성용 검사학교 교복 쇼트타입
				case(33){itemString = `id:15114 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519남성용 검사학교 교복 롱타입
				case(34){itemString = `id:15131 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519핀 에이프런 스커트
				case(35){itemString = `id:15132 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519내추럴 베스트 웨어
				case(36){itemString = `id:15135 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519시크 수트
				case(37){itemString = `id:15137 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519셀리나 하프 재킷 코트
				case(38){itemString = `id:15151 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519뉴욕마리오 웨이스트 테일러 웨어(남성용)
				case(39){itemString = `id:15152 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519뉴욕마리오 웨이스트 테일러 웨어(여성용)
				case(40){itemString = `id:15153 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519산드라 스나이퍼 수트(남성용)
				case(41){itemString = `id:15154 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519산드라 스나이퍼 수트(여성용)
				case(42){itemString = `id:15155 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519이디카이 성직자 예복(남성용)
				case(43){itemString = `id:15156 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519이디카이 성직자 예복(여성용)
				case(44){itemString = `id:15157 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519위스 보위군 의복(남성용)
				case(45){itemString = `id:15158 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519위스 보위군 의복(여성용)
				case(46){itemString = `id:15184 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519테라 에이션트 패턴 웨어
				case(47){itemString = `id:19007 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.08650519야광 머플러 로브
				case(48){itemString = `id:16054 `; iCumRate +=5;} //0.144175317불꽃 문양 레더 글러브
				case(49){itemString = `id:16053 `; iCumRate +=5;} //0.144175317아스틴 글러브
				case(50){itemString = `id:16052 `; iCumRate +=5;} //0.144175317비앙카 롱 글러브
				case(51){itemString = `id:15292 `; iCumRate +=5;} //0.144175317남성용 수영복
				case(52){itemString = `id:15293 `; iCumRate +=5;} //0.144175317여성용 수영복
				case(53){itemString = `id:18176 `; iCumRate +=5;} //0.144175317메이드 머리띠
				case(54){itemString = `id:15233 `; iCumRate +=5;} //0.144175317엘레건트 고딕 드레스
				case(55){itemString = `id:15234 `; iCumRate +=5;} //0.144175317엘레건트 고딕 슈트
				case(56){itemString = `id:15235 `; iCumRate +=5;} //0.144175317엘레건트 고딕 드레스
				case(57){itemString = `id:15419 `; iCumRate +=7;} //0.201845444에메랄드 켈틱 패턴 수트(남성용)
				case(58){itemString = `id:15420 `; iCumRate +=7;} //0.201845444에메랄드 켈틱 패턴 수트(여성용)
				case(59){itemString = `id:17106 `; iCumRate +=7;} //0.201845444인간/엘프 남성용 한복 신발
				case(60){itemString = `id:17107 `; iCumRate +=7;} //0.201845444인간/엘프 여성용 한복 신발
				case(61){itemString = `id:17108 `; iCumRate +=7;} //0.201845444자이언트 남성용 한복 신발
				case(62){itemString = `id:17109 `; iCumRate +=7;} //0.201845444자이언트 여성용 한복 신발
				case(63){itemString = `id:15179 `; iCumRate +=7;} //0.201845444대만 전통 무술 복장
				case(64){itemString = `id:17075 `; iCumRate +=7;} //0.201845444대만 무술 전통 신발
				case(65){itemString = `id:13010  suffix:30613`; iCumRate +=7;} //0.201845444라운드 폴드론 체인메일
				case(66){itemString = `id:13022 suffix:30613`; iCumRate +=7;} //0.201845444로즈 플레이트 아머 (P타입)
				case(67){itemString = `id:13031 suffix:30613`; iCumRate +=7;} //0.201845444스파이카 실버 플레이트 아머
				case(68){itemString = `id:13032 suffix:31401`; iCumRate +=7;} //0.201845444발렌시아 크로스 라인 플레이트 아머(여성용)
				case(69){itemString = `id:13033 suffix:31401`; iCumRate +=7;} //0.201845444발렌시아 크로스 라인 플레이트 아머(남성용)
				case(70){itemString = `id:14025 suffix:30515`; iCumRate +=7;} //0.201845444카멜 스피리트 아머(남성용)
				case(71){itemString = `id:14026 suffix:30515`; iCumRate +=7;} //0.201845444카멜 스피리트 아머(여성용)
				case(72){itemString = `id:14036 suffix:30613`; iCumRate +=7;} //0.201845444티오즈 아머(남성용)
				case(73){itemString = `id:14037 suffix:30613`; iCumRate +=7;} //0.201845444티오즈 아머(여성용)
				case(74){itemString = `id:16028  suffix:30601`; iCumRate +=7;} //0.201845444카멜 스피리트 글러브
				case(75){itemString = `id:16511  suffix:30601`; iCumRate +=7;} //0.201845444실버 티니 글러브
				case(76){itemString = `id:16521  suffix:30902`; iCumRate +=7;} //0.201845444발렌시아 크로스 라인 플레이트 건틀렛
				case(77){itemString = `id:16531 suffix:30601`; iCumRate +=7;} //0.201845444티오즈 건틀렛
				case(78){itemString = `id:17064  suffix:30601`; iCumRate +=7;} //0.201845444카멜 스피리트 부츠
				case(79){itemString = `id:17510  suffix:30601`; iCumRate +=7;} //0.201845444스파이카 실버 플레이트 부츠
				case(80){itemString = `id:17514  suffix:30902`; iCumRate +=7;} //0.201845444발렌시아 크로스 라인 플레이트 부츠
				case(81){itemString = `id:17523 suffix:30601`; iCumRate +=7;} //0.201845444티오즈 그리브
				case(82){itemString = `id:18518  suffix:30601`; iCumRate +=7;} //0.201845444드래곤 크레스트
				case(83){itemString = `id:18248 `; iCumRate +=10;} //0.288350634에메랄드 켈틱 패턴 모자
				case(84){itemString = `id:18249 `; iCumRate +=10;} //0.288350634에메랄드 켈틱 패턴 헤어밴드
				case(85){itemString = `id:17162 `; iCumRate +=10;} //0.288350634에메랄드 켈틱 패턴 신발
				case(86){itemString = `id:17163 `; iCumRate +=10;} //0.288350634에메랄드 켈틱 패턴 부츠
				case(87){itemString = `id:15189 `; iCumRate +=10;} //0.288350634고대 동양식 전통의복(남성용)
				case(88){itemString = `id:15190 `; iCumRate +=10;} //0.288350634동양식 전통의복(여성용)
				case(89){itemString = `id:18161 `; iCumRate +=13;} //0.374855825데브캣 귀마개
				case(90){itemString = `id:18157 `; iCumRate +=13;} //0.374855825고양이 귀 머리띠
				case(91){itemString = `id:80000 `; iCumRate +=13;} //0.374855825나오의 검은 옷
				case(92){itemString = `id:80001 `; iCumRate +=13;} //0.374855825루아의 옷
				case(93){itemString = `id:80002 `; iCumRate +=13;} //0.374855825핑크색 코트
				case(94){itemString = `id:80003 `; iCumRate +=13;} //0.374855825검은색 코트
				case(95){itemString = `id:80004 `; iCumRate +=13;} //0.374855825나오의 노란색 봄 옷
				case(96){itemString = `id:80005 `; iCumRate +=13;} //0.374855825나오의 하얀색 봄 옷
				case(97){itemString = `id:80006 `; iCumRate +=13;} //0.374855825나오의 핑크색 봄 옷
				case(98){itemString = `id:62005 suffix:30515`; iCumRate +=18;} //0.519031142해적의
				case(99){itemString = `id:62005 prefix:20505`; iCumRate +=18;} //0.519031142리자드
				case(100){itemString = `id:62005 prefix:21007`; iCumRate +=18;} //0.519031142히스
				case(101){itemString = `id:62005 prefix:20625`; iCumRate +=18;} //0.519031142금속 바늘
				case(102){itemString = `id:62005 suffix:30624`; iCumRate +=18;} //0.519031142산사나무
				case(103){itemString = `id:62005 prefix:20721`; iCumRate +=18;} //0.519031142한가한
				case(104){itemString = `id:51003 count:10`; iCumRate +=20;} //0.576701269생명력 50 포션
				case(105){itemString = `id:51004 count:10`; iCumRate +=20;} //0.576701269생명력 100 포션
				case(106){itemString = `id:51007 count:10`; iCumRate +=20;} //0.576701269마나 30 포션
				case(107){itemString = `id:51008 count:10`; iCumRate +=20;} //0.576701269마나 50 포션
				case(108){itemString = `id:51009 count:10`; iCumRate +=20;} //0.576701269마나 100 포션
				case(109){itemString = `id:51013 count:10`; iCumRate +=20;} //0.576701269스태미나 50 포션
				case(110){itemString = `id:51014 count:10`; iCumRate +=20;} //0.576701269스태미나 100 포션
				case(111){itemString = `id:51022 count:10`; iCumRate +=20;} //0.576701269생명력과 마나 30 포션
				case(112){itemString = `id:51023 count:10`; iCumRate +=20;} //0.576701269생명력과 마나 50 포션
				case(113){itemString = `id:51027 count:10`; iCumRate +=20;} //0.576701269생명력과 스태미나 30 포션
				case(114){itemString = `id:51028 count:10`; iCumRate +=20;} //0.576701269생명력과 스태미나 50 포션
				case(115){itemString = `id:51029 count:10`; iCumRate +=20;} //0.576701269생명력과 스태미나 100 포션
				case(116){itemString = `id:60036 count:5`; iCumRate +=20;} //0.576701269옐로우 베이비 포션
				case(117){itemString = `id:60037 count:5`; iCumRate +=20;} //0.576701269블랙 유스 포션
				case(118){itemString = `id:60038 count:5`; iCumRate +=20;} //0.576701269레드 포션
				case(119){itemString = `id:60040 count:5`; iCumRate +=20;} //0.576701269그린 베이비 포션
				case(120){itemString = `id:62004 count:5`; iCumRate +=20;} //0.576701269마법가루
				case(121){itemString = `id:63000 count:10`; iCumRate +=20;} //0.576701269피닉스의 깃털
				case(122){itemString = `id:2006 `; iCumRate +=23;} //0.663206459큰 금화 주머니
				case(123){itemString = `id:17015 `; iCumRate +=23;} //0.663206459컴뱃슈즈
				case(124){itemString = `id:14042 `; iCumRate +=23;} //0.663206459컬스틴 레더 아머
				case(125){itemString = `id:16534 `; iCumRate +=23;} //0.663206459컬스틴 레더 건틀렛
				case(126){itemString = `id:17524 `; iCumRate +=23;} //0.663206459컬스틴 레더 부츠
				case(127){itemString = `id:13047 `; iCumRate +=23;} //0.663206459키리누스진 하프 플레이트 아머(남성용)
				case(128){itemString = `id:13048 `; iCumRate +=23;} //0.663206459키리누스진 하프 플레이트 아머(여성용)
				case(129){itemString = `id:14005 `; iCumRate +=23;} //0.663206459드란도스 레더메일
				case(130){itemString = `id:14011 `; iCumRate +=23;} //0.663206459드란도스 레더메일
				case(131){itemString = `id:14013 `; iCumRate +=23;} //0.663206459로리카 세그먼타타에
				case(132){itemString = `id:14019 `; iCumRate +=23;} //0.663206459그레이스 플레이트 아머
				case(133){itemString = `id:14035 `; iCumRate +=23;} //0.663206459피르타 레더 아머
				case(134){itemString = `id:14038 `; iCumRate +=23;} //0.663206459피르타 레더 아머 B타입(여성용)
				case(135){itemString = `id:15014 `; iCumRate +=23;} //0.663206459파발꾼의 옷
				case(136){itemString = `id:15028 `; iCumRate +=23;} //0.663206459코레스 씨프슈트
				case(137){itemString = `id:15042 `; iCumRate +=23;} //0.663206459롱넥 원피스
				case(138){itemString = `id:15052 `; iCumRate +=23;} //0.663206459터크스 투톤 튜닉
				case(139){itemString = `id:15053 `; iCumRate +=23;} //0.663206459플랫칼라 원피스
				case(140){itemString = `id:15055 `; iCumRate +=23;} //0.663206459레더 미니 원피스
				case(141){itemString = `id:15057 `; iCumRate +=23;} //0.663206459롱 레더 코트 (무광)
				case(142){itemString = `id:15070 `; iCumRate +=23;} //0.663206459스탠드칼라 슬리브리스
				case(143){itemString = `id:15128 `; iCumRate +=23;} //0.663206459투 톤 비조 드레스
				case(144){itemString = `id:15135 `; iCumRate +=23;} //0.663206459시크 수트
				case(145){itemString = `id:15136 `; iCumRate +=23;} //0.663206459모험가 슈트
				case(146){itemString = `id:15153 `; iCumRate +=23;} //0.663206459산드라 스나이퍼 수트(남성용)
				case(147){itemString = `id:15154 `; iCumRate +=23;} //0.663206459산드라 스나이퍼 수트(여성용)
				case(148){itemString = `id:15230 `; iCumRate +=23;} //0.663206459가르텐 글렌 체크 스커트
				case(149){itemString = `id:16008 `; iCumRate +=23;} //0.663206459코레스 씨프 글러브
				case(150){itemString = `id:16019 `; iCumRate +=23;} //0.663206459줄무늬 팔목 장갑
				case(151){itemString = `id:16028 `; iCumRate +=23;} //0.663206459카멜 스피리트 글러브
				case(152){itemString = `id:16040 `; iCumRate +=23;} //0.663206459콜린 빅센 글러브
				case(153){itemString = `id:16505 `; iCumRate +=23;} //0.663206459플루트 건틀렛
				case(154){itemString = `id:16520 `; iCumRate +=23;} //0.663206459롱 레더 글러브
				case(155){itemString = `id:17040 `; iCumRate +=23;} //0.663206459엘라 스트랩 부츠
				case(156){itemString = `id:17041 `; iCumRate +=23;} //0.663206459덩굴무늬 헌팅부츠
				case(157){itemString = `id:17045 `; iCumRate +=23;} //0.663206459브이 넥 라인 레더 부츠
				case(158){itemString = `id:17071 `; iCumRate +=23;} //0.663206459니하이 부츠
				case(159){itemString = `id:17087 `; iCumRate +=23;} //0.663206459콜린 빅센 부츠
				case(160){itemString = `id:17506 `; iCumRate +=23;} //0.663206459롱그리브 부츠
				case(161){itemString = `id:17522 `; iCumRate +=23;} //0.663206459피르타 레더 부츠
				case(162){itemString = `id:18008 `; iCumRate +=23;} //0.663206459스트라이프 캡
				case(163){itemString = `id:18023 `; iCumRate +=23;} //0.663206459몬거 씨프 캡
				case(164){itemString = `id:18028 `; iCumRate +=23;} //0.663206459접이식 안경
				case(165){itemString = `id:18029 `; iCumRate +=23;} //0.663206459나무테 안경
				case(166){itemString = `id:18038 `; iCumRate +=23;} //0.663206459깃털 배렛 모자
				case(167){itemString = `id:18040 `; iCumRate +=23;} //0.663206459코레스 꼭지 베레모
				case(168){itemString = `id:18047 `; iCumRate +=23;} //0.663206459코레스 펠트 모자
				case(169){itemString = `id:18108 `; iCumRate +=23;} //0.663206459바위 분장 소품
				case(170){itemString = `id:18109 `; iCumRate +=23;} //0.663206459나오 분장 소품
				case(171){itemString = `id:18110 `; iCumRate +=23;} //0.663206459덤불 분장 소품
				case(172){itemString = `id:18112 `; iCumRate +=23;} //0.663206459해 분장 소품
				case(173){itemString = `id:18113 `; iCumRate +=23;} //0.663206459뾰족귀 고양이 모자
				case(174){itemString = `id:18114 `; iCumRate +=23;} //0.663206459줄무늬 고양이 모자
				case(175){itemString = `id:18115 `; iCumRate +=23;} //0.663206459핀 고양이 모자
				case(176){itemString = `id:18502 `; iCumRate +=23;} //0.663206459본 헬름
				case(177){itemString = `id:18506 `; iCumRate +=23;} //0.663206459윙 하프 헬름
				case(178){itemString = `id:18511 `; iCumRate +=23;} //0.663206459플루트 풀 헬름
				case(179){itemString = `id:18513 `; iCumRate +=23;} //0.663206459스파이크 캡
				case(180){itemString = `id:18515 `; iCumRate +=23;} //0.663206459트윈 혼 캡
				case(181){itemString = `id:18525 `; iCumRate +=23;} //0.663206459워터드롭 캡
				case(182){itemString = `id:18542 `; iCumRate +=23;} //0.663206459빅 체인 풀 헬름
				case(183){itemString = `id:18543 `; iCumRate +=23;} //0.663206459슬릿 풀 헬름
				case(184){itemString = `id:19005 `; iCumRate +=23;} //0.663206459머플러 로브
				case(185){itemString = `id:19007 `; iCumRate +=23;} //0.663206459야광 머플러 로브
				case(186){itemString = `id:19020 `; iCumRate +=23;} //0.663206459나타네 설산용 코트
				case(187){itemString = `id:19029 `; iCumRate +=23;} //0.663206459자이언트 베어 로브
				case(188){itemString = `id:19034 `; iCumRate +=23;} //0.663206459가르텐 클로스 오버코트
				case(189){itemString = `id:40011 `; iCumRate +=23;} //0.663206459브로드 소드
				case(190){itemString = `id:40012 `; iCumRate +=23;} //0.663206459바스타드 소드
				case(191){itemString = `id:40014 `; iCumRate +=23;} //0.663206459콤포짓 보우
				case(192){itemString = `id:40015 `; iCumRate +=23;} //0.663206459플루트 숏 소드
				case(193){itemString = `id:40030 `; iCumRate +=23;} //0.663206459투 핸디드 소드
				case(194){itemString = `id:40031 `; iCumRate +=23;} //0.663206459석궁
				case(195){itemString = `id:40038 `; iCumRate +=23;} //0.663206459라이트닝 원드
				case(196){itemString = `id:40039 `; iCumRate +=23;} //0.663206459아이스 원드
				case(197){itemString = `id:40040 `; iCumRate +=23;} //0.663206459파이어 원드
				case(198){itemString = `id:40041 `; iCumRate +=23;} //0.663206459타격용 원드
				case(199){itemString = `id:40079 `; iCumRate +=23;} //0.663206459메이스
				case(200){itemString = `id:40081 `; iCumRate +=23;} //0.663206459롱 보우
				case(201){itemString = `id:40081 `; iCumRate +=23;} //0.663206459레더 롱 보우
				case(202){itemString = `id:40090 `; iCumRate +=23;} //0.663206459힐링 원드
				case(203){itemString = `id:46001  `; iCumRate +=23;} //0.663206459라운드 실드
				case(204){itemString = `id:46006 `; iCumRate +=23;} //0.663206459카이트 실드
				case(205){itemString = `id:40172 `; iCumRate +=23;} //0.663206459그레이트 소드
				case(206){itemString = `id:40174 `; iCumRate +=23;} //0.663206459모닝스타
				case(207){itemString = `id:40177  `; iCumRate +=23;} //0.663206459워리어 액스
				case(208){itemString = `id:40180  `; iCumRate +=23;} //0.663206459홉네일 너클
				case(209){itemString = `id:62005 prefix:20405`; iCumRate +=27;} //0.778546713거친
				case(210){itemString = `id:62005 prefix:20508`; iCumRate +=27;} //0.778546713수상한
				case(211){itemString = `id:62005 prefix:20602`; iCumRate +=27;} //0.778546713견고한
				case(212){itemString = `id:62005 prefix:20615`; iCumRate +=27;} //0.778546713사막거미
				case(213){itemString = `id:62005 prefix:20619`; iCumRate +=27;} //0.778546713특이한
				case(214){itemString = `id:62005 prefix:20701`; iCumRate +=27;} //0.778546713거센
				case(215){itemString = `id:62005 prefix:21003`; iCumRate +=27;} //0.778546713파멸의
				case(216){itemString = `id:62005 suffix:30506`; iCumRate +=27;} //0.778546713매서운
				case(217){itemString = `id:62005 suffix:30614`; iCumRate +=27;} //0.778546713기운찬
				case(218){itemString = `id:62005 suffix:30616`; iCumRate +=27;} //0.778546713매정한
				case(219){itemString = `id:62005 suffix:30617`; iCumRate +=27;} //0.778546713무정한
				case(220){itemString = `id:62005 suffix:30618`; iCumRate +=27;} //0.778546713비참한
				case(221){itemString = `id:62005 suffix:30704`; iCumRate +=27;} //0.778546713데들리
				case(222){itemString = `id:62005 suffix:30801`; iCumRate +=27;} //0.778546713네이쳐
				case(223){itemString = `id:91034 `; iCumRate +=85;} //2.450980392경험치 증가 포션
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
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bLivingGachaphonGived = true;
			}
			if (bLivingGachaphonGived)
			{
				break;
			}
				++i;
		}
	}
		// 캐시 가차폰을 못받았다.
	if (!bCashGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived2)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}