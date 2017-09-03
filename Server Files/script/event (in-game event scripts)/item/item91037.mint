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
	// 복장 가챠폰
	int itemID = cItem.GetClassId();
	 if(GetLocale().LowerCase()== `china`
		|| GetLocale().LowerCase()== `taiwan`)
	{
		// 중국의 경우
		// 중국 가차폰은 캐시가차폰과 복장 가차폰을 동시에 준다.

		bool bCashGachaphonGived = false;
		bool bLivingGachaphonGived = false;

		// 캐시 가차폰
		if(GetLocale().LowerCase()== `china`)
		{
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
					case(0) {	iCumRate +=	6;}
					case(1)	{	iCumRate += 6;}
					case(2)	{	iCumRate += 7;}
					case(3) {	iCumRate +=	7;}
					case(4) {	iCumRate +=	7;}
					case(5) {	iCumRate +=	7;}
					case(6) {	iCumRate +=	7;}
					case(7) {	iCumRate +=	7;}
					case(8) {	iCumRate += 4;}
					case(9) {	iCumRate +=	4;}
					case(10) {	iCumRate += 4;}
					case(11) {	iCumRate += 4;}
					case(12) {	iCumRate +=	4;}
					case(13) {	iCumRate +=	4;}
					case(14) {	iCumRate +=	5;}
					case(15) {	iCumRate += 15;}
					case(16) {	iCumRate += 2;}
				}

				if (iRandom < iCumRate)
				{
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case(0)	//	6.0000000000 	100	마나 부스트 포션
						{
							itemString = `id:91002 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(1) //	6.0000000000 	100	스태미나 부스트 포션
						{
							itemString = `id:91003 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(2) //	7.0000000000 	100	캠프파이어 키트
						{
							itemString = `id:63029 count:5`;
							itemArray.Add(itemString);
							itemString = `id:63029`;
							itemArray.Add(itemString);
						}
						case(3) //	7.0000000000 	100	원격 은행 이용권
						{
							itemString = `id:63026 count:10`;
							itemArray.Add(itemString);
						}
						case(4) //	7.0000000000 	100	원격 힐러집 이용권
						{
							itemString = `id:63047 count:5`;
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(5) //	7.0000000000 	100	보호와 방어 부스트 포션
						{
							itemString = `id:91004 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(6) //	7.0000000000 	100	생명력 부스트 포션
						{
							itemString = `id:91001 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(7) //	7.0000000000 	100	17살의 키가 되는 포션
						{
							itemString = `id:91007 expire:43200`;
							// 번들이 아니기 때문에 따로 3개 지급
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(8) //	4.0000000000 	100	어드밴스드 깃털
						{
							itemString = `id:63043 count:6`;
							itemArray.Add(itemString);
						}
						case(9) //	4.0000000000 	100	파티 부활의 깃털
						{
							itemString = `id:63044 count:10`;
							itemArray.Add(itemString);
						}
						case(10) //	4.0000000000 	100	완전 회복의 포션
						{
							itemString = `id:51031 count:8`;
							itemArray.Add(itemString);
						}
						case(11) //	4.0000000000 	100	하트 모양 불꽃놀이키트
						{
							itemString = `id:63064 expire:43200 count:10`;
							itemArray.Add(itemString);
						}
						case(12) //	4.0000000000 	100	밀랍 날개
						{
							itemString = `id:63027 expire:10080`;
							// 번들이 아니기 때문에 따로 5개 지급
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(13) //	4.0000000000 	100	대용량 축복의 포션
						{
							itemString = `id:63025 count:5`;
							itemArray.Add(itemString);
						}
						case(14) //	5.0000000000 	100	전투력 약화 포션
						{
							itemString = `id:91005 expire:43200`;
							// 번들이 아니기 때문에 따로 3개 지급
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(15) //	15.0000000000 	100	10살의 키가 되는 포션
						{
							itemString = `id:91006 expire:43200`;
							// 번들이 아니기 때문에 따로 3개 지급
							itemArray.Add(itemString);
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
						case(16) //	2.0000000000 	100	염색 앰플
						{
							itemString = `id:63024 expire:10080`;
							// 번들이 아니기 때문에 따로 2개 지급
							itemArray.Add(itemString);
							itemArray.Add(itemString);
						}
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
		}

		// 복장 가차폰
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(5730);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:15234`; iCumRate += 1;} //0.0174520070 5730엘레건트 고딕 슈트
					case(1){itemString = `id:15233`; iCumRate += 1;} //0.0174520070 5730엘레건트 고딕 드레스
					case(2){itemString = `id:15235`; iCumRate += 1;} //0.0174520070 5730엘레건트 고딕 드레스
					case(3){itemString = `id:15184 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730테라 에이션트 패턴 웨어
					case(4){itemString = `id:15112 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730셀리나 스쿨보이룩
					case(5){itemString = `id:15065 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730엘라 베스트 스커트
					case(6){itemString = `id:15113 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730여성용 검사학교 교복 쇼트타입
					case(7){itemString = `id:15114 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730남성용 검사학교 교복 롱타입
					case(8){itemString = `id:15135 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730시크 수트
					case(9){itemString = `id:15137 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730셀리나 하프 재킷 코트
					case(10){itemString = `id:15131 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730핀 에이프런 스커트
					case(11){itemString = `id:15132 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730내추럴 베스트 웨어
					case(12){itemString = `id:19007 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730야광 머플러 로브
					case(13){itemString = `id:15151 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(14){itemString = `id:15152 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(15){itemString = `id:15153 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730산드라 스나이퍼 수트(남성용)
					case(16){itemString = `id:15154 col1:00ff33 col2:00ff33 col3:00ff33`; iCumRate += 3;} //0.0523560209 5730산드라 스나이퍼 수트(여성용)
					case(17){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730이디카이 성직자 예복(남성용)
					case(18){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730이디카이 성직자 예복(여성용)
					case(19){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730위스 보위군 의복(남성용)
					case(20){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 3;} //0.0523560209 5730위스 보위군 의복(여성용)
					case(21){itemString = `id:80000`; iCumRate += 5;} //0.0872600349 5730나오의 검은 옷
					case(22){itemString = `id:80001`; iCumRate += 5;} //0.0872600349 5730루아의 옷
					case(23){itemString = `id:80002`; iCumRate += 5;} //0.0872600349 5730핑크색 코트
					case(24){itemString = `id:80003`; iCumRate += 5;} //0.0872600349 5730검은색 코트
					case(25){itemString = `id:80004`; iCumRate += 5;} //0.0872600349 5730나오의 노란색 봄 옷
					case(26){itemString = `id:80005`; iCumRate += 5;} //0.0872600349 5730나오의 하얀색 봄 옷
					case(27){itemString = `id:80006`; iCumRate += 5;} //0.0872600349 5730나오의 핑크색 봄 옷
					case(28){itemString = `id:15184 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730테라 에이션트 패턴 웨어
					case(29){itemString = `id:15112 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730셀리나 스쿨보이룩
					case(30){itemString = `id:15065 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730엘라 베스트 스커트
					case(31){itemString = `id:15113 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730여성용 검사학교 교복 쇼트타입
					case(32){itemString = `id:15114 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730남성용 검사학교 교복 롱타입
					case(33){itemString = `id:15135 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730시크 수트
					case(34){itemString = `id:15137 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730셀리나 하프 재킷 코트
					case(35){itemString = `id:15131 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730핀 에이프런 스커트
					case(36){itemString = `id:15132 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730내추럴 베스트 웨어
					case(37){itemString = `id:19007 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730야광 머플러 로브
					case(38){itemString = `id:15151 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(39){itemString = `id:15152 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(40){itemString = `id:15153 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730산드라 스나이퍼 수트(남성용)
					case(41){itemString = `id:15154 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730산드라 스나이퍼 수트(여성용)
					case(42){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730이디카이 성직자 예복(남성용)
					case(43){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730이디카이 성직자 예복(여성용)
					case(44){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730위스 보위군 의복(남성용)
					case(45){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.0872600349 5730위스 보위군 의복(여성용)
					case(46){itemString = `id:15184 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730테라 에이션트 패턴 웨어
					case(47){itemString = `id:15112 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730셀리나 스쿨보이룩
					case(48){itemString = `id:15065 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730엘라 베스트 스커트
					case(49){itemString = `id:15113 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730여성용 검사학교 교복 쇼트타입
					case(50){itemString = `id:15114 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730남성용 검사학교 교복 롱타입
					case(51){itemString = `id:15135 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730시크 수트
					case(52){itemString = `id:15137 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730셀리나 하프 재킷 코트
					case(53){itemString = `id:15131 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730핀 에이프런 스커트
					case(54){itemString = `id:15132 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730내추럴 베스트 웨어
					case(55){itemString = `id:19007 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730야광 머플러 로브
					case(56){itemString = `id:15151 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(57){itemString = `id:15152 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(58){itemString = `id:15153 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730산드라 스나이퍼 수트(남성용)
					case(59){itemString = `id:15154 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730산드라 스나이퍼 수트(여성용)
					case(60){itemString = `id:15155 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730이디카이 성직자 예복(남성용)
					case(61){itemString = `id:15156 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730이디카이 성직자 예복(여성용)
					case(62){itemString = `id:15157 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730위스 보위군 의복(남성용)
					case(63){itemString = `id:15158 col1:61000f22 col2:61000f22 col3:61000f22`; iCumRate += 5;} //0.0872600349 5730위스 보위군 의복(여성용)
					case(64){itemString = `id:40031`; iCumRate += 30;} //0.5235602094 5730석궁
					case(65){itemString = `id:40081`; iCumRate += 30;} //0.5235602094 5730롱 보우
					case(66){itemString = `id:40031`; iCumRate += 30;} //0.5235602094 5730석궁
					case(67){itemString = `id:40014`; iCumRate += 30;} //0.5235602094 5730콤포짓 보우
					case(68){itemString = `id:46006`; iCumRate += 30;} //0.5235602094 5730카이트 실드
					case(69){itemString = `id:40011`; iCumRate += 30;} //0.5235602094 5730브로드 소드
					case(70){itemString = `id:46001       `; iCumRate += 30;} //0.5235602094 5730라운드 실드
					case(71){itemString = `id:14013`; iCumRate += 30;} //0.5235602094 5730로리카
					case(72){itemString = `id:14019`; iCumRate += 30;} //0.5235602094 5730그레이스 플레이트 아머
					case(73){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730야광 머플러 로브
					case(74){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730야광 머플러 로브
					case(75){itemString = `id:19007`; iCumRate += 30;} //0.5235602094 5730야광 머플러 로브
					case(76){itemString = `id:15135`; iCumRate += 30;} //0.5235602094 5730시크 수트
					case(77){itemString = `id:40015`; iCumRate += 30;} //0.5235602094 5730플루트 숏 소드
					case(78){itemString = `id:17071`; iCumRate += 30;} //0.5235602094 5730니하이 부츠
					case(79){itemString = `id:15153`; iCumRate += 30;} //0.5235602094 5730산드라 스나이퍼 수트(남성용)
					case(80){itemString = `id:13047`; iCumRate += 30;} //0.5235602094 5730키리누스진 하프 플레이트 아머(남성용)
					case(81){itemString = `id:17041`; iCumRate += 30;} //0.5235602094 5730덩굴무늬 헌팅부츠
					case(82){itemString = `id:46008`; iCumRate += 30;} //0.5235602094 5730라이트 헤테로 카이트 실드
					case(83){itemString = `id:15055`; iCumRate += 30;} //0.5235602094 5730레더 미니 원피스
					case(84){itemString = `id:46006`; iCumRate += 30;} //0.5235602094 5730카이트 실드
					case(85){itemString = `id:15053`; iCumRate += 30;} //0.5235602094 5730플랫칼라 원피스
					case(86){itemString = `id:40030`; iCumRate += 30;} //0.5235602094 5730투 핸디드 소드
					case(87){itemString = `id:17045`; iCumRate += 30;} //0.5235602094 5730브이 넥 라인 레더 부츠
					case(88){itemString = `id:14004`; iCumRate += 30;} //0.5235602094 5730클로스 메일
					case(89){itemString = `id:17040`; iCumRate += 30;} //0.5235602094 5730엘라 스트랩 부츠
					case(90){itemString = `id:18516`; iCumRate += 30;} //0.5235602094 5730이블 다잉 크라운
					case(91){itemString = `id:18521`; iCumRate += 30;} //0.5235602094 5730유러피안 컴프
					case(92){itemString = `id:15136`; iCumRate += 30;} //0.5235602094 5730모험가 슈트
					case(93){itemString = `id:18525`; iCumRate += 30;} //0.5235602094 5730워터드롭 캡
					case(94){itemString = `id:18511`; iCumRate += 30;} //0.5235602094 5730플루트 풀 헬름
					case(95){itemString = `id:18506`; iCumRate += 30;} //0.5235602094 5730윙 하프 헬름
					case(96){itemString = `id:16505`; iCumRate += 30;} //0.5235602094 5730플루트 건틀렛
					case(97){itemString = `id:18502`; iCumRate += 30;} //0.5235602094 5730본 헬름
					case(98){itemString = `id:15014`; iCumRate += 30;} //0.5235602094 5730파발꾼의 옷
					case(99){itemString = `id:18113`; iCumRate += 30;} //0.5235602094 5730뾰족귀 고양이 모자
					case(100){itemString = `id:18114`; iCumRate += 30;} //0.5235602094 5730줄무늬 고양이 모자
					case(101){itemString = `id:18115`; iCumRate += 30;} //0.5235602094 5730핀 고양이 모자
					case(102){itemString = `id:18112`; iCumRate += 30;} //0.5235602094 5730해 분장 소품
					case(103){itemString = `id:18111`; iCumRate += 30;} //0.5235602094 5730나무 분장 소품
					case(104){itemString = `id:18110`; iCumRate += 30;} //0.5235602094 5730덤불 분장 소품
					case(105){itemString = `id:18109`; iCumRate += 30;} //0.5235602094 5730나오 분장 소품
					case(106){itemString = `id:18108`; iCumRate += 30;} //0.5235602094 5730바위 분장 소품
					case(107){itemString = `id:18029`; iCumRate += 30;} //0.5235602094 5730나무테 안경
					case(108){itemString = `id:18028`; iCumRate += 30;} //0.5235602094 5730접이식 안경
					case(109){itemString = `id:40038`; iCumRate += 30;} //0.5235602094 5730라이트닝 원드
					case(110){itemString = `id:40039`; iCumRate += 30;} //0.5235602094 5730아이스 원드
					case(111){itemString = `id:40040`; iCumRate += 30;} //0.5235602094 5730파이어 원드
					case(112){itemString = `id:40041`; iCumRate += 30;} //0.5235602094 5730타격용 원드
					case(113){itemString = `id:40090`; iCumRate += 30;} //0.5235602094 5730힐링 원드
					case(114){itemString = `id:18542`; iCumRate += 30;} //0.5235602094 5730빅 체인 풀 헬름
					case(115){itemString = `id:18543`; iCumRate += 30;} //0.5235602094 5730슬릿 풀 헬름
					case(116){itemString = `id:18544`; iCumRate += 30;} //0.5235602094 5730펠리칸 프로텍터
					case(117){itemString = `id:18547`; iCumRate += 30;} //0.5235602094 5730파나쉬 헤드 프로텍터
					case(118){itemString = `id:19020`; iCumRate += 30;} //0.5235602094 5730나타네 설산용 코트
					case(119){itemString = `id:16520`; iCumRate += 30;} //0.5235602094 5730롱 레더 글러브
					case(120){itemString = `id:15128`; iCumRate += 30;} //0.5235602094 5730투 톤 비조 드레스
					case(121){itemString = `id:16019`; iCumRate += 30;} //0.5235602094 5730줄무늬 팔목 장갑
					case(122){itemString = `id:18047`; iCumRate += 30;} //0.5235602094 5730코레스 펠트 모자
					case(123){itemString = `id:18008`; iCumRate += 30;} //0.5235602094 5730스트라이프 캡
					case(124){itemString = `id:16008`; iCumRate += 30;} //0.5235602094 5730코레스 씨프 글러브
					case(125){itemString = `id:15028`; iCumRate += 30;} //0.5235602094 5730코레스 씨프슈트
					case(126){itemString = `id:17506`; iCumRate += 30;} //0.5235602094 5730롱그리브 부츠
					case(127){itemString = `id:18026`; iCumRate += 30;} //0.5235602094 5730몬거 상인모자
					case(128){itemString = `id:15052`; iCumRate += 30;} //0.5235602094 5730터크스 투톤 튜닉
					case(129){itemString = `id:19005`; iCumRate += 30;} //0.5235602094 5730머플러 로브
					case(130){itemString = `id:18040`; iCumRate += 30;} //0.5235602094 5730코레스 꼭지 베레모
					case(131){itemString = `id:18038`; iCumRate += 30;} //0.5235602094 5730깃털 배렛 모자
					case(132){itemString = `id:15042`; iCumRate += 30;} //0.5235602094 5730롱넥 원피스
					case(133){itemString = `id:46001`; iCumRate += 30;} //0.5235602094 5730라운드 실드
					case(134){itemString = `id:40012`; iCumRate += 30;} //0.5235602094 5730바스타드 소드
					case(135){itemString = `id:2001`; iCumRate += 30;} //0.5235602094 5730금화 주머니
					case(136){itemString = `id:2006`; iCumRate += 30;} //0.5235602094 5730큰 금화 주머니
					case(137){itemString = `id:18010`; iCumRate += 30;} //0.5235602094 5730몬거 스마트 캡
					case(138){itemString = `id:15131`; iCumRate += 30;} //0.5235602094 5730핀 에이프런 스커트
					case(139){itemString = `id:40015`; iCumRate += 30;} //0.5235602094 5730플루트 숏 소드
					case(140){itemString = `id:17016`; iCumRate += 30;} //0.5235602094 5730필드 컴뱃슈즈
					case(141){itemString = `id:17015`; iCumRate += 30;} //0.5235602094 5730컴뱃슈즈
					case(142){itemString = `id:17005`; iCumRate += 30;} //0.5235602094 5730사냥꾼 신발
					case(143){itemString = `id:17002`; iCumRate += 30;} //0.5235602094 5730검사 신발
					case(144){itemString = `id:17022`; iCumRate += 30;} //0.5235602094 5730레더부츠
					case(145){itemString = `id:17001`; iCumRate += 30;} //0.5235602094 5730가죽 부츠
					case(146){itemString = `id:17007`; iCumRate += 30;} //0.5235602094 5730가죽 구두
					case(147){itemString = `id:16009`; iCumRate += 30;} //0.5235602094 5730사냥꾼장갑
					case(148){itemString = `id:80004`; iCumRate += 30;} //0.5235602094 5730L 로드
					case(149){itemString = `id:15031`; iCumRate += 30;} //0.5235602094 5730마법학교 교복
					case(150){itemString = `id:19012`; iCumRate += 30;} //0.5235602094 5730트루디 레이어드 로브
					case(151){itemString = `id:18004`; iCumRate += 30;} //0.5235602094 5730몬거 패션모자
					case(152){itemString = `id:15132`; iCumRate += 30;} //0.5235602094 5730내추럴 베스트 웨어
					case(153){itemString = `id:15043`; iCumRate += 30;} //0.5235602094 5730스포티 웨어세트
					case(154){itemString = `id:15033`; iCumRate += 30;} //0.5235602094 5730몬거 여행자옷
					case(155){itemString = `id:40081`; iCumRate += 20;} //0.3490401396 5730레더 롱 보우
					case(156){itemString = `id:15023`; iCumRate += 20;} //0.3490401396 5730토크 사냥꾼옷
					case(157){itemString = `id:40079`; iCumRate += 20;} //0.3490401396 5730메이스
					case(158){itemString = `id:62005 prefix:20203`; iCumRate += 34;} //0.5933682373 5730양치기의
					case(159){itemString = `id:62005 prefix:21003`; iCumRate += 34;} //0.5933682373 5730파멸의
					case(160){itemString = `id:62005 suffix:30201`; iCumRate += 34;} //0.5933682373 5730갈색곰
					case(161){itemString = `id:62005 suffix:30302`; iCumRate += 34;} //0.5933682373 5730코볼트
					case(162){itemString = `id:62005 prefix:20201`; iCumRate += 34;} //0.5933682373 5730하드
					case(163){itemString = `id:62005 suffix:30304`; iCumRate += 34;} //0.5933682373 5730회색늑대
					case(164){itemString = `id:62005 suffix:30702`; iCumRate += 34;} //0.5933682373 5730레이븐
					case(165){itemString = `id:62005 suffix:30704`; iCumRate += 34;} //0.5933682373 5730데들리
					case(166){itemString = `id:62005 suffix:30801`; iCumRate += 34;} //0.5933682373 5730네이쳐
					case(167){itemString = `id:62005 suffix:30802`; iCumRate += 34;} //0.5933682373 5730카운터
					case(168){itemString = `id:62005 suffix:30803`; iCumRate += 34;} //0.5933682373 5730윈드밀
					case(169){itemString = `id:62005 suffix:30804`; iCumRate += 34;} //0.5933682373 5730스매시
					case(170){itemString = `id:62005 prefix:20405`; iCumRate += 34;} //0.5933682373 5730거친
					case(171){itemString = `id:62005 prefix:20501`; iCumRate += 34;} //0.5933682373 5730간편한
					case(172){itemString = `id:62005 prefix:20602`; iCumRate += 34;} //0.5933682373 5730견고한
					case(173){itemString = `id:62005 prefix:20701`; iCumRate += 34;} //0.5933682373 5730거센
					case(174){itemString = `id:62005 suffix:30506`; iCumRate += 34;} //0.5933682373 5730매서운
					case(175){itemString = `id:62005 suffix:30614`; iCumRate += 34;} //0.5933682373 5730기운찬
					case(176){itemString = `id:62005 prefix:20108`; iCumRate += 34;} //0.5933682373 5730키위
					case(177){itemString = `id:62005 prefix:20304`; iCumRate += 34;} //0.5933682373 5730타조
					case(178){itemString = `id:62005 prefix:20505`; iCumRate += 34;} //0.5933682373 5730리자드
					case(179){itemString = `id:62005 prefix:20209`; iCumRate += 34;} //0.5933682373 5730몽구스
					case(180){itemString = `id:62005 prefix:20409`; iCumRate += 34;} //0.5933682373 5730사막여우
					case(181){itemString = `id:62005 prefix:20615`; iCumRate += 34;} //0.5933682373 5730사막거미
					case(182){itemString = `id:62005 prefix:20508`; iCumRate += 34;} //0.5933682373 5730수상한
					case(183){itemString = `id:62005 prefix:20618`; iCumRate += 34;} //0.5933682373 5730망설이는
					case(184){itemString = `id:62005 prefix:20718`; iCumRate += 34;} //0.5933682373 5730이상한
					case(185){itemString = `id:62005 prefix:20212`; iCumRate += 34;} //0.5933682373 5730괴상한
					case(186){itemString = `id:62005 prefix:20412`; iCumRate += 34;} //0.5933682373 5730별난
					case(187){itemString = `id:62005 prefix:20619`; iCumRate += 34;} //0.5933682373 5730특이한
					case(188){itemString = `id:62005 suffix:30616`; iCumRate += 34;} //0.5933682373 5730매정한
					case(189){itemString = `id:62005 suffix:30617`; iCumRate += 34;} //0.5933682373 5730무정한
					case(190){itemString = `id:62005 suffix:30618`; iCumRate += 34;} //0.5933682373 5730비참한
					case(191){itemString = `id:62005 suffix: 30726`; iCumRate += 34;} //0.5933682373 5730하모니
					case(192){itemString = `id:62005 suffix: 30629`; iCumRate += 34;} //0.5933682373 5730멜로디
					case(193){itemString = `id:62005 suffix: 30727`; iCumRate += 34;} //0.5933682373 5730소금
					case(194){itemString = `id:62005 suffix: 30630`; iCumRate += 34;} //0.5933682373 5730설탕
					case(195){itemString = `id:91034`; iCumRate += 90;} //1.5706806283 5730경험치 증가 포션
					case(196){itemString = `id:51003 count:10`; iCumRate += 30;} //0.5235602094 5730생명력 50 포션
					case(197){itemString = `id:51004 count:10`; iCumRate += 30;} //0.5235602094 5730생명력 100 포션
					case(198){itemString = `id:51007 count:10`; iCumRate += 30;} //0.5235602094 5730마나 30 포션
					case(199){itemString = `id:51008 count:10`; iCumRate += 30;} //0.5235602094 5730마나 50 포션
					case(200){itemString = `id:51013 count:10`; iCumRate += 30;} //0.5235602094 5730스태미나 50 포션
					case(201){itemString = `id:51014 count:10`; iCumRate += 30;} //0.5235602094 5730스태미나 100 포션
					case(202){itemString = `id:51001 count:10`; iCumRate += 30;} //0.5235602094 5730생명력 10 포션
					case(203){itemString = `id:51002 count:10`; iCumRate += 30;} //0.5235602094 5730생명력 30 포션
					case(204){itemString = `id:51022 count:10`; iCumRate += 30;} //0.5235602094 5730생명력과 마나 30 포션
					case(205){itemString = `id:51027 count:10`; iCumRate += 30;} //0.5235602094 5730생명력과 스태미나 30 포션
					case(206){itemString = `id:51028 count:10`; iCumRate += 30;} //0.5235602094 5730생명력과 스태미나 50 포션
					case(207){itemString = `id:51029 count:10`; iCumRate += 30;} //0.5235602094 5730생명력과 스태미나 100 포션
					case(208){itemString = `id:63000 count:10`; iCumRate += 30;} //0.5235602094 5730피닉스의 깃털
					case(209){itemString = `id:60037 count:5`; iCumRate += 30;} //0.5235602094 5730블랙 유스 포션
					case(210){itemString = `id:60038 count:5`; iCumRate += 30;} //0.5235602094 5730레드 포션
					case(211){itemString = `id:62004 count:5`; iCumRate += 30;} //0.5235602094 5730마법가루
					case(212){itemString = `id:50163 quality:100`; iCumRate += 30;} //0.5235602094 5730피쉬 앤 칩스
					case(213){itemString = `id:50164 quality:100`; iCumRate += 30;} //0.5235602094 5730T본 스테이크
					case(214){itemString = `id:50165 quality:100`; iCumRate += 30;} //0.5235602094 5730치즈 그라탕
					case(215){itemString = `id:50166 quality:100`; iCumRate += 30;} //0.5235602094 5730카레 라이스
					case(216){itemString = `id:50167 quality:100`; iCumRate += 30;} //0.5235602094 5730코 코 뱅
					case(217){itemString = `id:50168 quality:100`; iCumRate += 30;} //0.5235602094 5730송어찜
					case(218){itemString = `id:50169 quality:100`; iCumRate += 30;} //0.5235602094 5730부야 베스
					case(219){itemString = `id:50170 quality:100`; iCumRate += 30;} //0.5235602094 5730치즈 퐁듀
					case(220){itemString = `id:50171 quality:100`; iCumRate += 30;} //0.5235602094 5730이멘 마하산 와인
					case(221){itemString = `id:50172 quality:100`; iCumRate += 30;} //0.5235602094 5730레어치즈 케익
					case(222){itemString = `id:50173 quality:100`; iCumRate += 30;} //0.5235602094 5730가토 오 쇼콜라
					case(223){itemString = `id:50174 quality:100`; iCumRate += 30;} //0.5235602094 5730크로크 무슈
					case(224){itemString = `id:50175 quality:100`; iCumRate += 30;} //0.5235602094 5730브라우니
					case(225){itemString = `id:50176 quality:100`; iCumRate += 30;} //0.5235602094 5730버터 비스킷
					case(226){itemString = `id:50177 quality:100`; iCumRate += 30;} //0.5235602094 5730초코칩 쿠키
					case(227){itemString = `id:50178 quality:100`; iCumRate += 30;} //0.5235602094 5730오렌지 주스
					case(228){itemString = `id:50179 quality:100`; iCumRate += 30;} //0.5235602094 5730레몬 주스
					case(229){itemString = `id:50180 quality:100`; iCumRate += 30;} //0.5235602094 5730초콜릿 우유
					case(230){itemString = `id:50181 quality:100`; iCumRate += 30;} //0.5235602094 5730라인산 진
					case(231){itemString = `id:50182 quality:100`; iCumRate += 30;} //0.5235602094 5730브리흐네 위스키
					case(232){itemString = `id:50199 quality:100`; iCumRate += 30;} //0.5235602094 5730스크류 드라이버
					case(233){itemString = `id:50200 quality:100`; iCumRate += 30;} //0.5235602094 5730라인 슬링
					case(234){itemString = `id:50201 quality:100`; iCumRate += 30;} //0.5235602094 5730BnR
					case(235){itemString = `id:50202 quality:100`; iCumRate += 30;} //0.5235602094 5730키스 온 더 립스
					case(236){itemString = `id:50203 quality:100`; iCumRate += 30;} //0.5235602094 5730레드 선라이즈
					case(237){itemString = `id:50183 quality:100`; iCumRate += 30;} //0.5235602094 5730데브니쉬 흑맥주
					case(238){itemString = `id:50123 quality:100`; iCumRate += 30;} //0.5235602094 5730베이컨구이
					case(239){itemString = `id:50124 quality:100`; iCumRate += 30;} //0.5235602094 5730비프 스테이크
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
		if (GetLocale().LowerCase()== `china` && !bCashGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}

		// 복장 가차폰을 못받았다.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}
	}	
}
