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
				case(0){itemString = `id:18301 `; iCumRate +=5;} //5호랑이 모자
				case(1){itemString = `id:91159 `; iCumRate +=15;} //15홍빠오경험치 2배 포션 (30분)
				case(2){itemString = `id:63024 expire:10080`; iCumRate +=25;} //25염색 앰플
				case(3){itemString = `id:91134 `; iCumRate +=55;} //55이름 색상 변션 포션
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
		int iRandom = Random(3505);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15347 `; iCumRate +=5;} //0.142653352여성용 유카타
				case(1){itemString = `id:15346 `; iCumRate +=5;} //0.142653352남성용 유카타 
				case(2){itemString = `id:15269 `; iCumRate +=5;} //0.142653352항아의 날개 옷 
				case(3){itemString = `id:15129 `; iCumRate +=5;} //0.142653352여성용 유카타
				case(4){itemString = `id:15197 `; iCumRate +=5;} //0.142653352여성용 한복
				case(5){itemString = `id:15198 `; iCumRate +=5;} //0.142653352남성용 한복
				case(6){itemString = `id:15100 `; iCumRate +=5;} //0.142653352남성용 한복
				case(7){itemString = `id:15098 `; iCumRate +=5;} //0.142653352여성용 한복
				case(8){itemString = `id:15200 `; iCumRate +=5;} //0.142653352남성용 한복
				case(9){itemString = `id:15276 `; iCumRate +=5;} //0.142653352남성용 한복
				case(10){itemString = `id:15199 `; iCumRate +=5;} //0.142653352여성용 한복
				case(11){itemString = `id:15277 `; iCumRate +=5;} //0.142653352여성용 한복
				case(12){itemString = `id:15279 `; iCumRate +=5;} //0.142653352자이언트 여성용 한복
				case(13){itemString = `id:15278 `; iCumRate +=5;} //0.142653352자이언트 남성용 한복
				case(14){itemString = `id:19069 `; iCumRate +=7;} //0.199714693호랑이 로브
				case(15){itemString = `id:15325 `; iCumRate +=3;} //0.085592011박쥐 자켓 (남성용)
				case(16){itemString = `id:15326 `; iCumRate +=3;} //0.085592011박쥐 드레스 (여성용)
				case(17){itemString = `id:14047 `; iCumRate +=3;} //0.085592011불꽃 문양 레더 아머 (남성용)
				case(18){itemString = `id:14048 `; iCumRate +=3;} //0.085592011불꽃 문양 레더 아머 (여성용)
				case(19){itemString = `id:14049 `; iCumRate +=3;} //0.085592011야만적인 여우 갑옷 (남성용)
				case(20){itemString = `id:14050 `; iCumRate +=3;} //0.085592011야만적인 여우 갑옷 (여성용)
				case(21){itemString = `id:15315 `; iCumRate +=3;} //0.085592011아스틴 댄디 수트
				case(22){itemString = `id:15314 `; iCumRate +=3;} //0.085592011비앙카 윙 볼레로
				case(23){itemString = `id:15294 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011남성용 수영복
				case(24){itemString = `id:15295 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011여성용 수영복
				case(25){itemString = `id:18187 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011커다란 리본
				case(26){itemString = `id:18188 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011안대
				case(27){itemString = `id:18189 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011카우보이 모자
				case(28){itemString = `id:17132 `; iCumRate +=3;} //0.085592011박쥐 부츠
				case(29){itemString = `id:18566 `; iCumRate +=3;} //0.085592011박쥐 모자
				case(30){itemString = `id:18559 `; iCumRate +=3;} //0.085592011불꽃 문양 레더 캡
				case(31){itemString = `id:18227 `; iCumRate +=3;} //0.085592011아스틴 캡
				case(32){itemString = `id:18226 `; iCumRate +=3;} //0.085592011비앙카 캡
				case(33){itemString = `id:15079 `; iCumRate +=3;} //0.085592011볼레로 앤 점퍼 스커트
				case(34){itemString = `id:15222 `; iCumRate +=3;} //0.085592011그레이스 숄 드레스(여성용)
				case(35){itemString = `id:15250 `; iCumRate +=3;} //0.085592011메이드 의상 쇼트 타입
				case(36){itemString = `id:15251 `; iCumRate +=3;} //0.085592011메이드 의상 롱 타입
				case(37){itemString = `id:15252 `; iCumRate +=3;} //0.085592011집사 의상
				case(38){itemString = `id:16046 `; iCumRate +=3;} //0.085592011고양이 손 장갑
				case(39){itemString = `id:15065 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011엘라 베스트 스커트
				case(40){itemString = `id:15112 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011셀리나 스쿨보이룩
				case(41){itemString = `id:15113 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011여성용 검사학교 교복 쇼트타입
				case(42){itemString = `id:15114 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011남성용 검사학교 교복 롱타입
				case(43){itemString = `id:15131 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011핀 에이프런 스커트
				case(44){itemString = `id:15132 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011내추럴 베스트 웨어
				case(45){itemString = `id:15135 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011시크 수트
				case(46){itemString = `id:15137 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011셀리나 하프 재킷 코트
				case(47){itemString = `id:15151 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011뉴욕마리오 웨이스트 테일러 웨어(남성용)
				case(48){itemString = `id:15152 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011뉴욕마리오 웨이스트 테일러 웨어(여성용)
				case(49){itemString = `id:15153 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011산드라 스나이퍼 수트(남성용)
				case(50){itemString = `id:15154 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011산드라 스나이퍼 수트(여성용)
				case(51){itemString = `id:15155 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011이디카이 성직자 예복(남성용)
				case(52){itemString = `id:15156 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011이디카이 성직자 예복(여성용)
				case(53){itemString = `id:15157 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011위스 보위군 의복(남성용)
				case(54){itemString = `id:15158 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011위스 보위군 의복(여성용)
				case(55){itemString = `id:15184 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011테라 에이션트 패턴 웨어
				case(56){itemString = `id:19007 C1:FF0000 C2:FF0000 C3:FF0000`; iCumRate +=3;} //0.085592011야광 머플러 로브
				case(57){itemString = `id:17106 `; iCumRate +=7;} //0.199714693인간/엘프 남성용 한복 신발
				case(58){itemString = `id:17107 `; iCumRate +=7;} //0.199714693인간/엘프 여성용 한복 신발
				case(59){itemString = `id:17108 `; iCumRate +=7;} //0.199714693자이언트 남성용 한복 신발
				case(60){itemString = `id:17109 `; iCumRate +=7;} //0.199714693자이언트 여성용 한복 신발
				case(61){itemString = `id:15179 `; iCumRate +=7;} //0.199714693대만 전통 무술 복장
				case(62){itemString = `id:17075 `; iCumRate +=7;} //0.199714693대만 무술 전통 신발
				case(63){itemString = `id:15189 `; iCumRate +=10;} //0.285306705고대 동양식 전통의복(남성용)
				case(64){itemString = `id:15190 `; iCumRate +=10;} //0.285306705동양식 전통의복(여성용)
				case(65){itemString = `id:16054 `; iCumRate +=5;} //0.142653352불꽃 문양 레더 글러브
				case(66){itemString = `id:16053 `; iCumRate +=5;} //0.142653352아스틴 글러브
				case(67){itemString = `id:16052 `; iCumRate +=5;} //0.142653352비앙카 롱 글러브
				case(68){itemString = `id:15292 `; iCumRate +=5;} //0.142653352남성용 수영복
				case(69){itemString = `id:15293 `; iCumRate +=5;} //0.142653352여성용 수영복
				case(70){itemString = `id:18176 `; iCumRate +=5;} //0.142653352메이드 머리띠
				case(71){itemString = `id:15233 `; iCumRate +=5;} //0.142653352엘레건트 고딕 드레스
				case(72){itemString = `id:15234 `; iCumRate +=5;} //0.142653352엘레건트 고딕 슈트
				case(73){itemString = `id:15235 `; iCumRate +=5;} //0.142653352엘레건트 고딕 드레스
				case(74){itemString = `id:13010  suffix:30613`; iCumRate +=7;} //0.199714693라운드 폴드론 체인메일
				case(75){itemString = `id:13022 suffix:30613`; iCumRate +=7;} //0.199714693로즈 플레이트 아머 (P타입)
				case(76){itemString = `id:13031 suffix:30613`; iCumRate +=7;} //0.199714693스파이카 실버 플레이트 아머
				case(77){itemString = `id:13032 suffix:31401`; iCumRate +=7;} //0.199714693발렌시아 크로스 라인 플레이트 아머(여성용)
				case(78){itemString = `id:13033 suffix:31401`; iCumRate +=7;} //0.199714693발렌시아 크로스 라인 플레이트 아머(남성용)
				case(79){itemString = `id:14025 suffix:30515`; iCumRate +=7;} //0.199714693카멜 스피리트 아머(남성용)
				case(80){itemString = `id:14026 suffix:30515`; iCumRate +=7;} //0.199714693카멜 스피리트 아머(여성용)
				case(81){itemString = `id:14036 suffix:30613`; iCumRate +=7;} //0.199714693티오즈 아머(남성용)
				case(82){itemString = `id:14037 suffix:30613`; iCumRate +=7;} //0.199714693티오즈 아머(여성용)
				case(83){itemString = `id:16028  suffix:30601`; iCumRate +=7;} //0.199714693카멜 스피리트 글러브
				case(84){itemString = `id:16511  suffix:30601`; iCumRate +=7;} //0.199714693실버 티니 글러브
				case(85){itemString = `id:16521  suffix:30902`; iCumRate +=7;} //0.199714693발렌시아 크로스 라인 플레이트 건틀렛
				case(86){itemString = `id:16531 suffix:30601`; iCumRate +=7;} //0.199714693티오즈 건틀렛
				case(87){itemString = `id:17064  suffix:30601`; iCumRate +=7;} //0.199714693카멜 스피리트 부츠
				case(88){itemString = `id:17510  suffix:30601`; iCumRate +=7;} //0.199714693스파이카 실버 플레이트 부츠
				case(89){itemString = `id:17514  suffix:30902`; iCumRate +=7;} //0.199714693발렌시아 크로스 라인 플레이트 부츠
				case(90){itemString = `id:17523 suffix:30601`; iCumRate +=7;} //0.199714693티오즈 그리브
				case(91){itemString = `id:18518  suffix:30601`; iCumRate +=7;} //0.199714693드래곤 크레스트
				case(92){itemString = `id:18144 `; iCumRate +=10;} //0.285306705고대 동양식 전통모자(남성용)
				case(93){itemString = `id:18145 `; iCumRate +=10;} //0.285306705고대 동영식 전통머리장식(여성용)
				case(94){itemString = `id:18161 `; iCumRate +=13;} //0.370898716데브캣 귀마개
				case(95){itemString = `id:18157 `; iCumRate +=13;} //0.370898716고양이 귀 머리띠
				case(96){itemString = `id:80000 `; iCumRate +=13;} //0.370898716나오의 검은 옷
				case(97){itemString = `id:80001 `; iCumRate +=13;} //0.370898716루아의 옷
				case(98){itemString = `id:80002 `; iCumRate +=13;} //0.370898716핑크색 코트
				case(99){itemString = `id:80003 `; iCumRate +=13;} //0.370898716검은색 코트
				case(100){itemString = `id:80004 `; iCumRate +=13;} //0.370898716나오의 노란색 봄 옷
				case(101){itemString = `id:80005 `; iCumRate +=13;} //0.370898716나오의 하얀색 봄 옷
				case(102){itemString = `id:80006 `; iCumRate +=13;} //0.370898716나오의 핑크색 봄 옷
				case(103){itemString = `id:62005 suffix:30515`; iCumRate +=18;} //0.513552068해적의
				case(104){itemString = `id:62005 prefix:20505`; iCumRate +=18;} //0.513552068리자드
				case(105){itemString = `id:62005 prefix:21007`; iCumRate +=18;} //0.513552068히스
				case(106){itemString = `id:62005 prefix:20625`; iCumRate +=18;} //0.513552068금속 바늘
				case(107){itemString = `id:62005 suffix:30624`; iCumRate +=18;} //0.513552068산사나무
				case(108){itemString = `id:62005 prefix:20721`; iCumRate +=18;} //0.513552068한가한
				case(109){itemString = `id:51003 count:10`; iCumRate +=20;} //0.570613409생명력 50 포션
				case(110){itemString = `id:51004 count:10`; iCumRate +=20;} //0.570613409생명력 100 포션
				case(111){itemString = `id:51007 count:10`; iCumRate +=20;} //0.570613409마나 30 포션
				case(112){itemString = `id:51008 count:10`; iCumRate +=20;} //0.570613409마나 50 포션
				case(113){itemString = `id:51009 count:10`; iCumRate +=20;} //0.570613409마나 100 포션
				case(114){itemString = `id:51013 count:10`; iCumRate +=20;} //0.570613409스태미나 50 포션
				case(115){itemString = `id:51014 count:10`; iCumRate +=20;} //0.570613409스태미나 100 포션
				case(116){itemString = `id:51022 count:10`; iCumRate +=20;} //0.570613409생명력과 마나 30 포션
				case(117){itemString = `id:51023 count:10`; iCumRate +=20;} //0.570613409생명력과 마나 50 포션
				case(118){itemString = `id:51027 count:10`; iCumRate +=20;} //0.570613409생명력과 스태미나 30 포션
				case(119){itemString = `id:51028 count:10`; iCumRate +=20;} //0.570613409생명력과 스태미나 50 포션
				case(120){itemString = `id:51029 count:10`; iCumRate +=20;} //0.570613409생명력과 스태미나 100 포션
				case(121){itemString = `id:60036 count:5`; iCumRate +=20;} //0.570613409옐로우 베이비 포션
				case(122){itemString = `id:60037 count:5`; iCumRate +=20;} //0.570613409블랙 유스 포션
				case(123){itemString = `id:60038 count:5`; iCumRate +=20;} //0.570613409레드 포션
				case(124){itemString = `id:60040 count:5`; iCumRate +=20;} //0.570613409그린 베이비 포션
				case(125){itemString = `id:62004 count:5`; iCumRate +=20;} //0.570613409마법가루
				case(126){itemString = `id:63000 count:10`; iCumRate +=20;} //0.570613409피닉스의 깃털
				case(127){itemString = `id:2006 `; iCumRate +=23;} //0.656205421큰 금화 주머니
				case(128){itemString = `id:17015 `; iCumRate +=23;} //0.656205421컴뱃슈즈
				case(129){itemString = `id:14042 `; iCumRate +=23;} //0.656205421컬스틴 레더 아머
				case(130){itemString = `id:16534 `; iCumRate +=23;} //0.656205421컬스틴 레더 건틀렛
				case(131){itemString = `id:17524 `; iCumRate +=23;} //0.656205421컬스틴 레더 부츠
				case(132){itemString = `id:13047 `; iCumRate +=23;} //0.656205421키리누스진 하프 플레이트 아머(남성용)
				case(133){itemString = `id:13048 `; iCumRate +=23;} //0.656205421키리누스진 하프 플레이트 아머(여성용)
				case(134){itemString = `id:14005 `; iCumRate +=23;} //0.656205421드란도스 레더메일
				case(135){itemString = `id:14011 `; iCumRate +=23;} //0.656205421드란도스 레더메일
				case(136){itemString = `id:14013 `; iCumRate +=23;} //0.656205421로리카 세그먼타타에
				case(137){itemString = `id:14019 `; iCumRate +=23;} //0.656205421그레이스 플레이트 아머
				case(138){itemString = `id:14035 `; iCumRate +=23;} //0.656205421피르타 레더 아머
				case(139){itemString = `id:14038 `; iCumRate +=23;} //0.656205421피르타 레더 아머 B타입(여성용)
				case(140){itemString = `id:15014 `; iCumRate +=23;} //0.656205421파발꾼의 옷
				case(141){itemString = `id:15028 `; iCumRate +=23;} //0.656205421코레스 씨프슈트
				case(142){itemString = `id:15042 `; iCumRate +=23;} //0.656205421롱넥 원피스
				case(143){itemString = `id:15052 `; iCumRate +=23;} //0.656205421터크스 투톤 튜닉
				case(144){itemString = `id:15053 `; iCumRate +=23;} //0.656205421플랫칼라 원피스
				case(145){itemString = `id:15055 `; iCumRate +=23;} //0.656205421레더 미니 원피스
				case(146){itemString = `id:15057 `; iCumRate +=23;} //0.656205421롱 레더 코트 (무광)
				case(147){itemString = `id:15070 `; iCumRate +=23;} //0.656205421스탠드칼라 슬리브리스
				case(148){itemString = `id:15128 `; iCumRate +=23;} //0.656205421투 톤 비조 드레스
				case(149){itemString = `id:15135 `; iCumRate +=23;} //0.656205421시크 수트
				case(150){itemString = `id:15136 `; iCumRate +=23;} //0.656205421모험가 슈트
				case(151){itemString = `id:15153 `; iCumRate +=23;} //0.656205421산드라 스나이퍼 수트(남성용)
				case(152){itemString = `id:15154 `; iCumRate +=23;} //0.656205421산드라 스나이퍼 수트(여성용)
				case(153){itemString = `id:15230 `; iCumRate +=23;} //0.656205421가르텐 글렌 체크 스커트
				case(154){itemString = `id:16008 `; iCumRate +=23;} //0.656205421코레스 씨프 글러브
				case(155){itemString = `id:16019 `; iCumRate +=23;} //0.656205421줄무늬 팔목 장갑
				case(156){itemString = `id:16028 `; iCumRate +=23;} //0.656205421카멜 스피리트 글러브
				case(157){itemString = `id:16040 `; iCumRate +=23;} //0.656205421콜린 빅센 글러브
				case(158){itemString = `id:16505 `; iCumRate +=23;} //0.656205421플루트 건틀렛
				case(159){itemString = `id:16520 `; iCumRate +=23;} //0.656205421롱 레더 글러브
				case(160){itemString = `id:17040 `; iCumRate +=23;} //0.656205421엘라 스트랩 부츠
				case(161){itemString = `id:17041 `; iCumRate +=23;} //0.656205421덩굴무늬 헌팅부츠
				case(162){itemString = `id:17045 `; iCumRate +=23;} //0.656205421브이 넥 라인 레더 부츠
				case(163){itemString = `id:17071 `; iCumRate +=23;} //0.656205421니하이 부츠
				case(164){itemString = `id:17087 `; iCumRate +=23;} //0.656205421콜린 빅센 부츠
				case(165){itemString = `id:17506 `; iCumRate +=23;} //0.656205421롱그리브 부츠
				case(166){itemString = `id:17522 `; iCumRate +=23;} //0.656205421피르타 레더 부츠
				case(167){itemString = `id:18008 `; iCumRate +=23;} //0.656205421스트라이프 캡
				case(168){itemString = `id:18023 `; iCumRate +=23;} //0.656205421몬거 씨프 캡
				case(169){itemString = `id:18028 `; iCumRate +=23;} //0.656205421접이식 안경
				case(170){itemString = `id:18029 `; iCumRate +=23;} //0.656205421나무테 안경
				case(171){itemString = `id:18038 `; iCumRate +=23;} //0.656205421깃털 배렛 모자
				case(172){itemString = `id:18040 `; iCumRate +=23;} //0.656205421코레스 꼭지 베레모
				case(173){itemString = `id:18047 `; iCumRate +=23;} //0.656205421코레스 펠트 모자
				case(174){itemString = `id:18108 `; iCumRate +=23;} //0.656205421바위 분장 소품
				case(175){itemString = `id:18109 `; iCumRate +=23;} //0.656205421나오 분장 소품
				case(176){itemString = `id:18110 `; iCumRate +=23;} //0.656205421덤불 분장 소품
				case(177){itemString = `id:18112 `; iCumRate +=23;} //0.656205421해 분장 소품
				case(178){itemString = `id:18113 `; iCumRate +=23;} //0.656205421뾰족귀 고양이 모자
				case(179){itemString = `id:18114 `; iCumRate +=23;} //0.656205421줄무늬 고양이 모자
				case(180){itemString = `id:18115 `; iCumRate +=23;} //0.656205421핀 고양이 모자
				case(181){itemString = `id:18502 `; iCumRate +=23;} //0.656205421본 헬름
				case(182){itemString = `id:18506 `; iCumRate +=23;} //0.656205421윙 하프 헬름
				case(183){itemString = `id:18511 `; iCumRate +=23;} //0.656205421플루트 풀 헬름
				case(184){itemString = `id:18513 `; iCumRate +=23;} //0.656205421스파이크 캡
				case(185){itemString = `id:18515 `; iCumRate +=23;} //0.656205421트윈 혼 캡
				case(186){itemString = `id:18525 `; iCumRate +=23;} //0.656205421워터드롭 캡
				case(187){itemString = `id:18542 `; iCumRate +=23;} //0.656205421빅 체인 풀 헬름
				case(188){itemString = `id:18543 `; iCumRate +=23;} //0.656205421슬릿 풀 헬름
				case(189){itemString = `id:19005 `; iCumRate +=23;} //0.656205421머플러 로브
				case(190){itemString = `id:19007 `; iCumRate +=23;} //0.656205421야광 머플러 로브
				case(191){itemString = `id:19020 `; iCumRate +=23;} //0.656205421나타네 설산용 코트
				case(192){itemString = `id:19029 `; iCumRate +=23;} //0.656205421자이언트 베어 로브
				case(193){itemString = `id:19034 `; iCumRate +=23;} //0.656205421가르텐 클로스 오버코트
				case(194){itemString = `id:40011 `; iCumRate +=23;} //0.656205421브로드 소드
				case(195){itemString = `id:40012 `; iCumRate +=23;} //0.656205421바스타드 소드
				case(196){itemString = `id:40014 `; iCumRate +=23;} //0.656205421콤포짓 보우
				case(197){itemString = `id:40015 `; iCumRate +=23;} //0.656205421플루트 숏 소드
				case(198){itemString = `id:40030 `; iCumRate +=23;} //0.656205421투 핸디드 소드
				case(199){itemString = `id:40031 `; iCumRate +=23;} //0.656205421석궁
				case(200){itemString = `id:40038 `; iCumRate +=23;} //0.656205421라이트닝 원드
				case(201){itemString = `id:40039 `; iCumRate +=23;} //0.656205421아이스 원드
				case(202){itemString = `id:40040 `; iCumRate +=23;} //0.656205421파이어 원드
				case(203){itemString = `id:40041 `; iCumRate +=23;} //0.656205421타격용 원드
				case(204){itemString = `id:40079 `; iCumRate +=23;} //0.656205421메이스
				case(205){itemString = `id:40081 `; iCumRate +=23;} //0.656205421롱 보우
				case(206){itemString = `id:40081 `; iCumRate +=23;} //0.656205421레더 롱 보우
				case(207){itemString = `id:40090 `; iCumRate +=23;} //0.656205421힐링 원드
				case(208){itemString = `id:46001  `; iCumRate +=23;} //0.656205421라운드 실드
				case(209){itemString = `id:46006 `; iCumRate +=23;} //0.656205421카이트 실드
				case(210){itemString = `id:40172 `; iCumRate +=23;} //0.656205421그레이트 소드
				case(211){itemString = `id:40174 `; iCumRate +=23;} //0.656205421모닝스타
				case(212){itemString = `id:40177  `; iCumRate +=23;} //0.656205421워리어 액스
				case(213){itemString = `id:40180  `; iCumRate +=23;} //0.656205421홉네일 너클
				case(214){itemString = `id:62005 prefix:20405`; iCumRate +=27;} //0.770328103거친
				case(215){itemString = `id:62005 prefix:20508`; iCumRate +=27;} //0.770328103수상한
				case(216){itemString = `id:62005 prefix:20602`; iCumRate +=27;} //0.770328103견고한
				case(217){itemString = `id:62005 prefix:20615`; iCumRate +=27;} //0.770328103사막거미
				case(218){itemString = `id:62005 prefix:20619`; iCumRate +=27;} //0.770328103특이한
				case(219){itemString = `id:62005 prefix:20701`; iCumRate +=27;} //0.770328103거센
				case(220){itemString = `id:62005 prefix:21003`; iCumRate +=27;} //0.770328103파멸의
				case(221){itemString = `id:62005 suffix:30506`; iCumRate +=27;} //0.770328103매서운
				case(222){itemString = `id:62005 suffix:30614`; iCumRate +=27;} //0.770328103기운찬
				case(223){itemString = `id:62005 suffix:30616`; iCumRate +=27;} //0.770328103매정한
				case(224){itemString = `id:62005 suffix:30617`; iCumRate +=27;} //0.770328103무정한
				case(225){itemString = `id:62005 suffix:30618`; iCumRate +=27;} //0.770328103비참한
				case(226){itemString = `id:62005 suffix:30704`; iCumRate +=27;} //0.770328103데들리
				case(227){itemString = `id:62005 suffix:30801`; iCumRate +=27;} //0.770328103네이쳐
				case(228){itemString = `id:91034 `; iCumRate +=85;} //2.42510699경험치 증가 포션
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