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
	// 무기 가챠폰2
	int itemID = cItem.GetClassId();
	if(GetLocale().LowerCase()== `china`)
	{
		// 중국의 경우
		// 중국 생활 가차폰은 캐시가차폰과 생활 가차폰을 동시에 준다.

		bool bCashGachaphonGived = false;
		bool bLivingGachaphonGived = false;

		// 캐시 가차폰
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
							itemString = `id:63026 count:5`;
							itemArray.Add(itemString);
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
						case(12) //	4.0000000000 	100	밀랍날개
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

		// 무기 가차폰
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3096);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString= `id:40011 durability:18000 durability_max:18000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096브로드소드
					case(1){itemString= `id:40033 durability:19000 durability_max:19000 prefix:20817 suffix:30815`;iCumRate+=1;}//0.0322997416 3096클레이모어
					case(2){itemString= `id:40078 durability:18000 durability_max:18000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096비펜니스
					case(3){itemString= `id:40174 durability:20000 durability_max:20000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096모닝스타
					case(4){itemString= `id:40080 durability:19000 durability_max:19000 prefix:20719 suffix:31103`;iCumRate+=1;}//0.0322997416 3096글라디우스
					case(5){itemString= `id:40081 durability:15000 durability_max:15000 prefix:20720 suffix:30815`;iCumRate+=1;}//0.0322997416 3096레더롱보우
					case(6){itemString= `id:40107 durability:22000 durability_max:22000 prefix:20720 suffix:31105`;iCumRate+=1;}//0.0322997416 3096가디언보우
					case(7){itemString= `id:40031 durability:17000 durability_max:17000 prefix:20720 suffix:31105`;iCumRate+=1;}//0.0322997416 3096석궁
					case(8){itemString= `id:40090 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096힐링원드
					case(9){itemString= `id:40038 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096라이트닝원드
					case(10){itemString= `id:40039 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096아이스원드
					case(11){itemString= `id:40040 durability:14000 durability_max:14000 prefix:20701 suffix:31003`;iCumRate+=1;}//0.0322997416 3096파이어원드
					case(12){itemString= `id:40011 prefix:20505`;iCumRate+=1;}//0.0322997416 3096브로드소드
					case(13){itemString= `id:40033 prefix:20505`;iCumRate+=1;}//0.0322997416 3096클레이모어
					case(14){itemString= `id:40078 suffix:10608`;iCumRate+=1;}//0.0322997416 3096비펜니스
					case(15){itemString= `id:40174 suffix:10608`;iCumRate+=1;}//0.0322997416 3096모닝스타
					case(16){itemString= `id:40080 suffix:10608`;iCumRate+=1;}//0.0322997416 3096글라디우스
					case(17){itemString= `id:40081 prefix:20505`;iCumRate+=1;}//0.0322997416 3096레더롱보우
					case(18){itemString= `id:40107 suffix:31105`;iCumRate+=1;}//0.0322997416 3096가디언보우
					case(19){itemString= `id:40031 suffix:31105`;iCumRate+=1;}//0.0322997416 3096석궁
					case(20){itemString= `id:40090 suffix:30807`;iCumRate+=1;}//0.0322997416 3096힐링원드
					case(21){itemString= `id:40038 suffix:30807`;iCumRate+=1;}//0.0322997416 3096라이트닝원드
					case(22){itemString= `id:40039 suffix:30807`;iCumRate+=1;}//0.0322997416 3096아이스원드
					case(23){itemString= `id:40040 suffix:30807`;iCumRate+=1;}//0.0322997416 3096파이어원드
					case(24){itemString= `id:40170`;iCumRate+=2;}//0.0645994832 3096일본식양손검
					case(25){itemString= `id:40171`;iCumRate+=2;}//0.0645994832 3096마사무네
					case(26){itemString= `id:40095 prefix:207 suffix:30702`;iCumRate+=2;}//0.0645994832 3096드래곤블레이드
					case(27){itemString= `id:40033 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096클레이모어
					case(28){itemString= `id:40081 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096레더롱보우
					case(29){itemString= `id:40090 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096힐링원드
					case(30){itemString= `id:40080 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096글라디우스
					case(31){itemString= `id:40038 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096라이트닝원드
					case(32){itemString= `id:40039 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096아이스원드
					case(33){itemString= `id:40040 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096파이어원드
					case(34){itemString= `id:40041 prefix:207 suffix:31003`;iCumRate+=5;}//0.1614987080 3096타격용원드
					case(35){itemString= `id:40078 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096비펜니스
					case(36){itemString= `id:40079 prefix:20701 suffix:30506`;iCumRate+=5;}//0.1614987080 3096메이스
					case(37){itemString= `id:40031 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096석궁
					case(38){itemString= `id:40030 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096투핸디드소드
					case(39){itemString= `id:40013 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096롱보우
					case(40){itemString= `id:40014 prefix:20701 suffix:30702`;iCumRate+=5;}//0.1614987080 3096콤포짓보우
					case(41){itemString= `id:40016 prefix:20701 suffix:30506`;iCumRate+=5;}//0.1614987080 3096해머
					case(42){itemString= `id:40010 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096롱소드
					case(43){itemString= `id:40011 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096브로드소드
					case(44){itemString= `id:40012 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096바스타드소드
					case(45){itemString= `id:40015 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096플루트숏소드
					case(46){itemString= `id:40003 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096숏보우
					case(47){itemString= `id:40005 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096숏소드
					case(48){itemString= `id:40006 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096단검
					case(49){itemString= `id:40002 prefix:207 suffix:30702`;iCumRate+=5;}//0.1614987080 3096연습용목도
					case(50){itemString= `id:40033 prefix:207`;iCumRate+=7;}//0.2260981912 3096클레이모어
					case(51){itemString= `id:40081 prefix:20701`;iCumRate+=7;}//0.2260981912 3096레더롱보우
					case(52){itemString= `id:40090 prefix:207`;iCumRate+=7;}//0.2260981912 3096힐링원드
					case(53){itemString= `id:40080 prefix:207`;iCumRate+=7;}//0.2260981912 3096글라디우스
					case(54){itemString= `id:40038 prefix:207`;iCumRate+=7;}//0.2260981912 3096라이트닝원드
					case(55){itemString= `id:40039 prefix:207`;iCumRate+=7;}//0.2260981912 3096아이스원드
					case(56){itemString= `id:40040 prefix:207`;iCumRate+=7;}//0.2260981912 3096파이어원드
					case(57){itemString= `id:40041 prefix:207`;iCumRate+=7;}//0.2260981912 3096타격용원드
					case(58){itemString= `id:40078 prefix:207`;iCumRate+=7;}//0.2260981912 3096비펜니스
					case(59){itemString= `id:40079 prefix:20701`;iCumRate+=7;}//0.2260981912 3096메이스
					case(60){itemString= `id:40031 prefix:20701`;iCumRate+=7;}//0.2260981912 3096석궁
					case(61){itemString= `id:40030 prefix:207`;iCumRate+=7;}//0.2260981912 3096투핸디드소드
					case(62){itemString= `id:40013 prefix:20701`;iCumRate+=7;}//0.2260981912 3096롱보우
					case(63){itemString= `id:40014 prefix:20701`;iCumRate+=7;}//0.2260981912 3096콤포짓보우
					case(64){itemString= `id:40016 prefix:20701`;iCumRate+=7;}//0.2260981912 3096해머
					case(65){itemString= `id:40010 prefix:207`;iCumRate+=7;}//0.2260981912 3096롱소드
					case(66){itemString= `id:40011 prefix:207`;iCumRate+=7;}//0.2260981912 3096브로드소드
					case(67){itemString= `id:40012 prefix:207`;iCumRate+=7;}//0.2260981912 3096바스타드소드
					case(68){itemString= `id:40015 prefix:207`;iCumRate+=7;}//0.2260981912 3096플루트숏소드
					case(69){itemString= `id:40003 prefix:207`;iCumRate+=7;}//0.2260981912 3096숏보우
					case(70){itemString= `id:40005 prefix:207`;iCumRate+=7;}//0.2260981912 3096숏소드
					case(71){itemString= `id:40006 prefix:207`;iCumRate+=7;}//0.2260981912 3096단검
					case(72){itemString= `id:40002 prefix:207`;iCumRate+=7;}//0.2260981912 3096연습용목도
					case(73){itemString= `id:62005 prefix:20505`;iCumRate+=9;}//0.2906976744 3096리자드
					case(74){itemString= `id:62005 prefix:21007`;iCumRate+=9;}//0.2906976744 3096히스
					case(75){itemString= `id:62005 suffix:30515`;iCumRate+=9;}//0.2906976744 3096해적의
					case(76){itemString= `id:62005 prefix:20625`;iCumRate+=9;}//0.2906976744 3096금속바늘
					case(77){itemString= `id:62005 suffix:30624`;iCumRate+=9;}//0.2906976744 3096산사나무
					case(78){itemString= `id:62005 prefix:20721`;iCumRate+=9;}//0.2906976744 3096한가한
					case(79){itemString= `id:51004 count:10`;iCumRate+=11;}//0.3552971576 3096생명력100포션
					case(80){itemString= `id:51014 count:10`;iCumRate+=11;}//0.3552971576 3096스태미나100포션
					case(81){itemString= `id:51029 count:10`;iCumRate+=11;}//0.3552971576 3096생명력과스태미나100포션
					case(82){itemString= `id:63000 count:10`;iCumRate+=11;}//0.3552971576 3096피닉스의깃털
					case(83){itemString= `id:60037 count:5`;iCumRate+=11;}//0.3552971576 3096블랙유스포션
					case(84){itemString= `id:60038 count:5`;iCumRate+=11;}//0.3552971576 3096레드포션
					case(85){itemString= `id:50012 count:5`;iCumRate+=11;}//0.3552971576 3096황금달걀
					case(86){itemString= `id:50013 count:5`;iCumRate+=11;}//0.3552971576 3096황금사과
					case(87){itemString= `id:50541 `;iCumRate+=11;}//0.3552971576 3096에스프레소
					case(88){itemString= `id:50542 `;iCumRate+=11;}//0.3552971576 3096에스프레소마끼아또
					case(89){itemString= `id:50543 `;iCumRate+=11;}//0.3552971576 3096카푸치노
					case(90){itemString= `id:50544 `;iCumRate+=11;}//0.3552971576 3096마끼아또
					case(91){itemString= `id:50545 `;iCumRate+=11;}//0.3552971576 3096카페모카
					case(92){itemString= `id:50546 `;iCumRate+=11;}//0.3552971576 3096아이스카페모카
					case(93){itemString= `id:50547 `;iCumRate+=11;}//0.3552971576 3096아이스마끼아또
					case(94){itemString= `id:50163 quality:100`;iCumRate+=11;}//0.3552971576 3096피쉬앤칩스
					case(95){itemString= `id:50170 quality:100`;iCumRate+=11;}//0.3552971576 3096치즈퐁듀
					case(96){itemString= `id:50171 quality:100`;iCumRate+=11;}//0.3552971576 3096이멘마하산와인
					case(97){itemString= `id:40007`;iCumRate+=11;}//0.3552971576 3096한손도끼
					case(98){itemString= `id:40016`;iCumRate+=11;}//0.3552971576 3096해머
					case(99){itemString= `id:40010`;iCumRate+=11;}//0.3552971576 3096롱소드
					case(100){itemString= `id:40011`;iCumRate+=11;}//0.3552971576 3096브로드소드
					case(101){itemString= `id:40012`;iCumRate+=11;}//0.3552971576 3096바스타드소드
					case(102){itemString= `id:40015`;iCumRate+=11;}//0.3552971576 3096플루트숏소드
					case(103){itemString= `id:40003`;iCumRate+=11;}//0.3552971576 3096숏보우
					case(104){itemString= `id:40005`;iCumRate+=11;}//0.3552971576 3096숏소드
					case(105){itemString= `id:40006`;iCumRate+=11;}//0.3552971576 3096단검
					case(106){itemString= `id:40002`;iCumRate+=11;}//0.3552971576 3096연습용목도
					case(107){itemString= `id:50123 quality:100`;iCumRate+=11;}//0.3552971576 3096베이컨구이
					case(108){itemString= `id:50124 quality:100`;iCumRate+=11;}//0.3552971576 3096비프스테이크
					case(109){itemString= `id:40107`;iCumRate+=20;}//0.6459948320 3096가디언보우
					case(110){itemString= `id:14042`;iCumRate+=20;}//0.6459948320 3096컬스틴레더아머
					case(111){itemString= `id:16534`;iCumRate+=20;}//0.6459948320 3096컬스틴레더건틀렛
					case(112){itemString= `id:17524`;iCumRate+=20;}//0.6459948320 3096컬스틴레더부츠
					case(113){itemString= `id:40031`;iCumRate+=20;}//0.6459948320 3096석궁
					case(114){itemString= `id:40081`;iCumRate+=20;}//0.6459948320 3096@레더 롱 보우
					case(115){itemString = `id:40031`; iCumRate +=20;} //0.6459948320 3096석궁
					case(116){itemString = `id:40014`; iCumRate +=20;} //0.6459948320 3096콤포짓 보우
					case(117){itemString = `id:46006`; iCumRate +=20;} //0.6459948320 3096카이트 실드
					case(118){itemString = `id:40011`; iCumRate +=20;} //0.6459948320 3096브로드 소드
					case(119){itemString = `id:46001`; iCumRate +=20;} //0.6459948320 3096라운드 실드
					case(120){itemString = `id:14013`; iCumRate +=20;} //0.6459948320 3096@로리카 세그먼타타에
					case(121){itemString = `id:14019`; iCumRate +=20;} //0.6459948320 3096그레이스 플레이트 아머
					case(122){itemString = `id:19007`; iCumRate +=20;} //0.6459948320 3096야광 머플러 로브
					case(123){itemString = `id:15135`; iCumRate +=20;} //0.6459948320 3096시크 수트
					case(124){itemString = `id:40015`; iCumRate +=20;} //0.6459948320 3096플루트 숏 소드
					case(125){itemString = `id:17071`; iCumRate +=20;} //0.6459948320 3096니하이 부츠
					case(126){itemString = `id:15153`; iCumRate +=20;} //0.6459948320 3096산드라 스나이퍼 수트(남성용)
					case(127){itemString = `id:13047`; iCumRate +=20;} //0.6459948320 3096키리누스진 하프 플레이트 아머(남성용)
					case(128){itemString = `id:17041`; iCumRate +=20;} //0.6459948320 3096덩굴무늬 헌팅부츠
					case(129){itemString = `id:46008`; iCumRate +=20;} //0.6459948320 3096라이트 헤테로 카이트 실드
					case(130){itemString = `id:15055`; iCumRate +=20;} //0.6459948320 3096레더 미니 원피스
					case(131){itemString = `id:46006`; iCumRate +=20;} //0.6459948320 3096카이트 실드
					case(132){itemString = `id:15053`; iCumRate +=20;} //0.6459948320 3096플랫칼라 원피스
					case(133){itemString = `id:40030`; iCumRate +=20;} //0.6459948320 3096투 핸디드 소드
					case(134){itemString = `id:17045`; iCumRate +=20;} //0.6459948320 3096브이 넥 라인 레더 부츠
					case(135){itemString = `id:14004`; iCumRate +=20;} //0.6459948320 3096클로스 메일
					case(136){itemString = `id:17040`; iCumRate +=20;} //0.6459948320 3096엘라 스트랩 부츠
					case(137){itemString = `id:18525`; iCumRate +=20;} //0.6459948320 3096워터드롭 캡
					case(138){itemString = `id:18511`; iCumRate +=20;} //0.6459948320 3096플루트 풀 헬름
					case(139){itemString = `id:18506`; iCumRate +=20;} //0.6459948320 3096윙 하프 헬름
					case(140){itemString = `id:16505`; iCumRate +=20;} //0.6459948320 3096플루트 건틀렛
					case(141){itemString = `id:18502`; iCumRate +=20;} //0.6459948320 3096본 헬름
					case(142){itemString = `id:15014`; iCumRate +=20;} //0.6459948320 3096파발꾼의 옷
					case(143){itemString = `id:18113`; iCumRate +=22;} //0.7105943152 3096뾰족귀 고양이 모자
					case(144){itemString = `id:18114`; iCumRate +=22;} //0.7105943152 3096줄무늬 고양이 모자
					case(145){itemString = `id:18115`; iCumRate +=22;} //0.7105943152 3096핀 고양이 모자
					case(146){itemString = `id:18112`; iCumRate +=22;} //0.7105943152 3096해 분장 소품
					case(147){itemString = `id:18111`; iCumRate +=22;} //0.7105943152 3096나무 분장 소품
					case(148){itemString = `id:18110`; iCumRate +=22;} //0.7105943152 3096덤불 분장 소품
					case(149){itemString = `id:18109`; iCumRate +=22;} //0.7105943152 3096나오 분장 소품
					case(150){itemString = `id:18108`; iCumRate +=22;} //0.7105943152 3096바위 분장 소품
					case(151){itemString = `id:18029`; iCumRate +=22;} //0.7105943152 3096나무테 안경
					case(152){itemString = `id:18028`; iCumRate +=22;} //0.7105943152 3096접이식 안경
					case(153){itemString = `id:40038`; iCumRate +=22;} //0.7105943152 3096라이트닝 원드
					case(154){itemString = `id:40039`; iCumRate +=22;} //0.7105943152 3096아이스 원드
					case(155){itemString = `id:40040`; iCumRate +=22;} //0.7105943152 3096파이어 원드
					case(156){itemString = `id:40041`; iCumRate +=22;} //0.7105943152 3096타격용 원드
					case(157){itemString = `id:40090`; iCumRate +=22;} //0.7105943152 3096힐링 원드
					case(158){itemString = `id:18542`; iCumRate +=22;} //0.7105943152 3096빅 체인 풀 헬름
					case(159){itemString = `id:18543`; iCumRate +=22;} //0.7105943152 3096@빅 슬릿 풀 헬름
					case(160){itemString = `id:18544`; iCumRate +=22;} //0.7105943152 3096@빅 펠리칸 프로텍터
					case(161){itemString = `id:18547`; iCumRate +=22;} //0.7105943152 3096@빅 파나쉬 헤드 프로텍터
					case(162){itemString = `id:19020`; iCumRate +=22;} //0.7105943152 3096나타네 설산용 코트
					case(163){itemString = `id:16520`; iCumRate +=22;} //0.7105943152 3096롱 레더 글러브
					case(164){itemString = `id:15128`; iCumRate +=22;} //0.7105943152 3096투 톤 비조 드레스
					case(165){itemString = `id:16019`; iCumRate +=22;} //0.7105943152 3096줄무늬 팔목 장갑
					case(166){itemString = `id:18047`; iCumRate +=22;} //0.7105943152 3096코레스 펠트 모자
					case(167){itemString = `id:18008`; iCumRate +=22;} //0.7105943152 3096스트라이프 캡
					case(168){itemString = `id:16008`; iCumRate +=22;} //0.7105943152 3096코레스 씨프 글러브
					case(169){itemString = `id:15028`; iCumRate +=22;} //0.7105943152 3096코레스 씨프슈트
					case(170){itemString = `id:17506`; iCumRate +=22;} //0.7105943152 3096롱그리브 부츠
					case(171){itemString = `id:18026`; iCumRate +=22;} //0.7105943152 3096몬거 상인모자
					case(172){itemString = `id:15052`; iCumRate +=22;} //0.7105943152 3096터크스 투톤 튜닉
					case(173){itemString = `id:19005`; iCumRate +=22;} //0.7105943152 3096머플러 로브
					case(174){itemString = `id:18040`; iCumRate +=22;} //0.7105943152 3096코레스 꼭지 베레모
					case(175){itemString = `id:18038`; iCumRate +=22;} //0.7105943152 3096깃털 배렛 모자
					case(176){itemString = `id:15042`; iCumRate +=22;} //0.7105943152 3096롱넥 원피스
					case(177){itemString = `id:40012`; iCumRate +=22;} //0.7105943152 3096바스타드 소드
					case(178){itemString = `id:2001`; iCumRate +=22;} //0.7105943152 3096금화 주머니
					case(179){itemString = `id:2006`; iCumRate +=22;} //0.7105943152 3096큰 금화 주머니
					case(180){itemString = `id:40015`; iCumRate +=22;} //0.7105943152 3096플루트 숏 소드
					case(181){itemString = `id:17016`; iCumRate +=22;} //0.7105943152 3096필드 컴뱃슈즈
					case(182){itemString = `id:17015`; iCumRate +=22;} //0.7105943152 3096컴뱃슈즈
					case(183){itemString = `id:17005`; iCumRate +=22;} //0.7105943152 3096사냥꾼 신발
					case(184){itemString = `id:17002`; iCumRate +=22;} //0.7105943152 3096검사 신발
					case(185){itemString = `id:17022`; iCumRate +=22;} //0.7105943152 3096레더부츠
					case(186){itemString = `id:17001`; iCumRate +=22;} //0.7105943152 3096가죽 부츠
					case(187){itemString = `id:17007`; iCumRate +=22;} //0.7105943152 3096가죽 구두
					case(188){itemString = `id:15031`; iCumRate +=22;} //0.7105943152 3096마법학교 교복
					case(189){itemString = `id:19012`; iCumRate +=22;} //0.7105943152 3096트루디 레이어드 로브
					case(190){itemString = `id:18004`; iCumRate +=22;} //0.7105943152 3096몬거 패션모자
					case(191){itemString = `id:15132`; iCumRate +=22;} //0.7105943152 3096내추럴 베스트 웨어
					case(192){itemString = `id:15043`; iCumRate +=22;} //0.7105943152 3096스포티 웨어세트
					case(193){itemString = `id:40081`; iCumRate +=22;} //0.7105943152 3096레더 롱 보우
					case(194){itemString = `id:15023`; iCumRate +=22;} //0.7105943152 3096토크 사냥꾼옷
					case(195){itemString = `id:40079`; iCumRate +=22;} //0.7105943152 3096메이스
					case(196){itemString = `id:62005 prefix:20108`; iCumRate +=24;} //0.7751937984 3096키위
					case(197){itemString = `id:62005 prefix:20203`; iCumRate +=24;} //0.7751937984 3096양치기의
					case(198){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.7751937984 3096거친
					case(199){itemString = `id:62005 prefix:20501`; iCumRate +=24;} //0.7751937984 3096간편한
					case(200){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.7751937984 3096수상한
					case(201){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.7751937984 3096견고한
					case(202){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.7751937984 3096사막거미
					case(203){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.7751937984 3096특이한
					case(204){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.7751937984 3096거센
					case(205){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.7751937984 3096파멸의
					case(206){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.7751937984 3096매서운
					case(207){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.7751937984 3096기운찬
					case(208){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.7751937984 3096매정한
					case(209){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.7751937984 3096무정한
					case(210){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.7751937984 3096비참한
					case(211){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.7751937984 3096데들리
					case(212){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.7751937984 3096네이쳐
					case(213){itemString = `id:62005 suffix:30802`; iCumRate +=24;} //0.7751937984 3096카운터
					case(214){itemString = `id:62005 suffix:30803`; iCumRate +=24;} //0.7751937984 3096윈드밀
					case(215){itemString = `id:62005 suffix:30804`; iCumRate +=24;} //0.7751937984 3096스매시
					case(216){itemString = `id:91034`; iCumRate +=80;} //2.5839793282 3096전투 경험치 포션
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
		if (!bCashGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}

		// 생활 가차폰을 못받았다.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}
	}	
}
