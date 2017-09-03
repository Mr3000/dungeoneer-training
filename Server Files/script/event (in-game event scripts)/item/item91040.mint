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
	// 아머 가챠폰
	int itemID = cItem.GetClassId();
	 if(GetLocale().LowerCase()== `china`)
	{
		// 중국의 경우
		// 중국 가차폰은 캐시가차폰과 아머 가차폰을 동시에 준다.

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

		// 아머 가차폰
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3066);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:17119`; iCumRate +=1;} //0.032615786klaus knight boots
					case(1){itemString = `id:13050`; iCumRate +=1;} //0.032615786klaus knight armor
					case(2){itemString = `id:16537`; iCumRate +=1;} //0.032615786klaus knight Gauntlet
					case(3){itemString = `id:17527`; iCumRate +=1;} //0.032615786basil gimlet Greave
					case(4){itemString = `id:13051`; iCumRate +=1;} //0.032615786basil gimlet armor
					case(5){itemString = `id:16538`; iCumRate +=1;} //0.032615786basil gimlet Gauntlet
					case(6){itemString = `id:14039 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(인간)
					case(7){itemString = `id:14040 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(엘프)
					case(8){itemString = `id:14041 prefix:21007 suffix:30515`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(자이언트)
					case(9){itemString = `id:16532 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786차이나 드래곤 건틀렛(인간/자이언트)
					case(10){itemString = `id:16533 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786차이나 드래곤 건틀렛(엘프)
					case(11){itemString = `id:17095 prefix:20721 suffix:30624`; iCumRate +=1;} //0.032615786차이나 드래곤 부츠
					case(12){itemString = `id:18552 prefix:20625 suffix:30624`; iCumRate +=1;} //0.032615786차이나 드래곤 헬름
					case(13){itemString = `id:14039 prefix:21007`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(인간)
					case(14){itemString = `id:14040 prefix:21007`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(엘프)
					case(15){itemString = `id:14041 prefix:21007`; iCumRate +=1;} //0.032615786차이나 드래곤 아머(자이언트)
					case(16){itemString = `id:16532 prefix:20625`; iCumRate +=1;} //0.032615786차이나 드래곤 건틀렛(인간/자이언트)
					case(17){itemString = `id:16533 prefix:20625`; iCumRate +=1;} //0.032615786차이나 드래곤 건틀렛(엘프)
					case(18){itemString = `id:17095 prefix:20721`; iCumRate +=1;} //0.032615786차이나 드래곤 부츠
					case(19){itemString = `id:18552 prefix:20625`; iCumRate +=1;} //0.032615786차이나 드래곤 헬름
					case(20){itemString = `id:13038  prefix:20403 suffix:30613`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 아머
					case(21){itemString = `id:16524  prefix:20404 suffix:30601`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 뱀브레이스
					case(22){itemString = `id:17517  prefix:20404 suffix:30601`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 그리브
					case(23){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 아머(여성용)
					case(24){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 아머(남성용)
					case(25){itemString = `id:16521  prefix:20404 suffix:30902`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 건틀렛
					case(26){itemString = `id:17514  prefix:20404 suffix:30902`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 부츠
					case(27){itemString = `id:14036 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144티오즈 아머(남성용)
					case(28){itemString = `id:14037 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144티오즈 아머(여성용)
					case(29){itemString = `id:16531 prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144티오즈 건틀렛
					case(30){itemString = `id:17523 prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144티오즈 그리브
					case(31){itemString = `id:18518  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144드래곤 크레스트
					case(32){itemString = `id:13022 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144로즈 플레이트 아머 (P타입)
					case(33){itemString = `id:13010  prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144라운드 폴드론 체인메일
					case(34){itemString = `id:13031 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144스파이카 실버 플레이트 아머
					case(35){itemString = `id:16511  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144실버 티니 글러브
					case(36){itemString = `id:17510  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144스파이카 실버 플레이트 부츠
					case(37){itemString = `id:13043 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144레미니아 성월의 갑옷(남성용)
					case(38){itemString = `id:13044 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144레미니아 성월의 갑옷(여성용)
					case(39){itemString = `id:13047 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144키리누스진 하프 플레이트 아머(남성용)
					case(40){itemString = `id:13048 prefix:20403 suffix:30613`; iCumRate +=4;} //0.130463144키리누스진 하프 플레이트 아머(여성용)
					case(41){itemString = `id:14025 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144카멜 스피리트 아머(남성용)
					case(42){itemString = `id:14026 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144카멜 스피리트 아머(여성용)
					case(43){itemString = `id:16028  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144카멜 스피리트 글러브
					case(44){itemString = `id:17064  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144카멜 스피리트 부츠
					case(45){itemString = `id:14018  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144노르만 워리어 아머
					case(46){itemString = `id:18546  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144노르만 워리어 헬멧
					case(47){itemString = `id:14019 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144그레이스 플레이트 아머
					case(48){itemString = `id:16523  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144그레이스 건틀렛
					case(49){itemString = `id:17515  prefix:20404 suffix:30601`; iCumRate +=4;} //0.130463144그레이스 그리브
					case(50){itemString = `id:18545  prefix:207 suffix:30601`; iCumRate +=4;} //0.130463144그레이스 헬멧
					case(51){itemString = `id:14016  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144크로스벨트 레더 코트
					case(52){itemString = `id:14008 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144풀세트 가죽 갑옷
					case(53){itemString = `id:14017  prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144쓰리벨트 레더 메일
					case(54){itemString = `id:14007 prefix:20712 suffix:30515`; iCumRate +=4;} //0.130463144브레스트 클로스 메일
					case(55){itemString = `id:13038  prefix:20403`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 아머
					case(56){itemString = `id:16524  prefix:20404`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 뱀브레이스
					case(57){itemString = `id:17517  prefix:20404`; iCumRate +=2;} //0.065231572더스틴 실버 나이트 그리브
					case(58){itemString = `id:13032 prefix:21006`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 아머(여성용)
					case(59){itemString = `id:13033 prefix:21006`; iCumRate +=2;} //0.065231572발렌시아 크로스 라인 플레이트 아머(남성용)
					case(60){itemString = `id:14036 prefix:20403`; iCumRate +=5;} //0.16307893티오즈 아머(남성용)
					case(61){itemString = `id:14037 prefix:20403`; iCumRate +=5;} //0.16307893티오즈 아머(여성용)
					case(62){itemString = `id:16531 prefix:20404`; iCumRate +=5;} //0.16307893티오즈 건틀렛
					case(63){itemString = `id:17523 prefix:20404`; iCumRate +=5;} //0.16307893티오즈 그리브
					case(64){itemString = `id:18518  prefix:207`; iCumRate +=5;} //0.16307893드래곤 크레스트
					case(65){itemString = `id:13022 prefix:20403`; iCumRate +=5;} //0.16307893로즈 플레이트 아머 (P타입)
					case(66){itemString = `id:13010  prefix:20403`; iCumRate +=5;} //0.16307893라운드 폴드론 체인메일
					case(67){itemString = `id:13031 prefix:20403`; iCumRate +=5;} //0.16307893스파이카 실버 플레이트 아머
					case(68){itemString = `id:16511  prefix:20404`; iCumRate +=5;} //0.16307893실버 티니 글러브
					case(69){itemString = `id:17510  prefix:20404`; iCumRate +=5;} //0.16307893스파이카 실버 플레이트 부츠
					case(70){itemString = `id:13043 prefix:20403`; iCumRate +=5;} //0.16307893레미니아 성월의 갑옷(남성용)
					case(71){itemString = `id:13044 prefix:20403`; iCumRate +=5;} //0.16307893레미니아 성월의 갑옷(여성용)
					case(72){itemString = `id:13047 prefix:20403`; iCumRate +=5;} //0.16307893키리누스진 하프 플레이트 아머(남성용)
					case(73){itemString = `id:13048 prefix:20403`; iCumRate +=5;} //0.16307893키리누스진 하프 플레이트 아머(여성용)
					case(74){itemString = `id:14025 prefix:20712`; iCumRate +=5;} //0.16307893카멜 스피리트 아머(남성용)
					case(75){itemString = `id:14026 prefix:20712`; iCumRate +=5;} //0.16307893카멜 스피리트 아머(여성용)
					case(76){itemString = `id:16028  prefix:20404`; iCumRate +=5;} //0.16307893카멜 스피리트 글러브
					case(77){itemString = `id:17064  prefix:20404`; iCumRate +=5;} //0.16307893카멜 스피리트 부츠
					case(78){itemString = `id:14018  prefix:20712`; iCumRate +=5;} //0.16307893노르만 워리어 아머
					case(79){itemString = `id:18546  prefix:207`; iCumRate +=5;} //0.16307893노르만 워리어 헬멧
					case(80){itemString = `id:14019 prefix:20712`; iCumRate +=5;} //0.16307893그레이스 플레이트 아머
					case(81){itemString = `id:16523  prefix:20404`; iCumRate +=5;} //0.16307893그레이스 건틀렛
					case(82){itemString = `id:17515  prefix:20404`; iCumRate +=5;} //0.16307893그레이스 그리브
					case(83){itemString = `id:18545  prefix:207`; iCumRate +=5;} //0.16307893그레이스 헬멧
					case(84){itemString = `id:14016  prefix:20712`; iCumRate +=5;} //0.16307893크로스벨트 레더 코트
					case(85){itemString = `id:14008 prefix:20712`; iCumRate +=5;} //0.16307893풀세트 가죽 갑옷
					case(86){itemString = `id:14017  prefix:20712`; iCumRate +=5;} //0.16307893쓰리벨트 레더 메일
					case(87){itemString = `id:14007 prefix:20712`; iCumRate +=5;} //0.16307893브레스트 클로스 메일
					case(88){itemString = `id:14042`; iCumRate +=20;} //0.652315721컬스틴 레더 아머
					case(89){itemString = `id:16534`; iCumRate +=20;} //0.652315721컬스틴 레더 건틀렛
					case(90){itemString = `id:17524`; iCumRate +=20;} //0.652315721컬스틴 레더 부츠
					case(91){itemString = `id:40031`; iCumRate +=20;} //0.652315721석궁
					case(92){itemString = `id:40081`; iCumRate +=20;} //0.652315721@레더 롱 보우
					case(93){itemString = `id:40031`; iCumRate +=20;} //0.652315721석궁
					case(94){itemString = `id:40014`; iCumRate +=20;} //0.652315721콤포짓 보우
					case(95){itemString = `id:46006`; iCumRate +=20;} //0.652315721카이트 실드
					case(96){itemString = `id:40011`; iCumRate +=20;} //0.652315721브로드 소드
					case(97){itemString = `id:46001`; iCumRate +=20;} //0.652315721라운드 실드
					case(98){itemString = `id:14013`; iCumRate +=20;} //0.652315721@로리카 세그먼타타에
					case(99){itemString = `id:14019`; iCumRate +=20;} //0.652315721그레이스 플레이트 아머
					case(100){itemString = `id:19007`; iCumRate +=20;} //0.652315721야광 머플러 로브
					case(101){itemString = `id:15135`; iCumRate +=20;} //0.652315721시크 수트
					case(102){itemString = `id:40015`; iCumRate +=20;} //0.652315721플루트 숏 소드
					case(103){itemString = `id:17071`; iCumRate +=20;} //0.652315721니하이 부츠
					case(104){itemString = `id:15153`; iCumRate +=20;} //0.652315721산드라 스나이퍼 수트(남성용)
					case(105){itemString = `id:13047`; iCumRate +=20;} //0.652315721키리누스진 하프 플레이트 아머(남성용)
					case(106){itemString = `id:17041`; iCumRate +=20;} //0.652315721덩굴무늬 헌팅부츠
					case(107){itemString = `id:46008`; iCumRate +=20;} //0.652315721라이트 헤테로 카이트 실드
					case(108){itemString = `id:15055`; iCumRate +=20;} //0.652315721레더 미니 원피스
					case(109){itemString = `id:46006`; iCumRate +=20;} //0.652315721카이트 실드
					case(110){itemString = `id:15053`; iCumRate +=20;} //0.652315721플랫칼라 원피스
					case(111){itemString = `id:40030`; iCumRate +=20;} //0.652315721투 핸디드 소드
					case(112){itemString = `id:17045`; iCumRate +=20;} //0.652315721브이 넥 라인 레더 부츠
					case(113){itemString = `id:14004`; iCumRate +=20;} //0.652315721클로스 메일
					case(114){itemString = `id:17040`; iCumRate +=20;} //0.652315721엘라 스트랩 부츠
					case(115){itemString = `id:18525`; iCumRate +=20;} //0.652315721워터드롭 캡
					case(116){itemString = `id:18511`; iCumRate +=20;} //0.652315721플루트 풀 헬름
					case(117){itemString = `id:18506`; iCumRate +=20;} //0.652315721윙 하프 헬름
					case(118){itemString = `id:16505`; iCumRate +=20;} //0.652315721플루트 건틀렛
					case(119){itemString = `id:18502`; iCumRate +=20;} //0.652315721본 헬름
					case(120){itemString = `id:15014`; iCumRate +=20;} //0.652315721파발꾼의 옷
					case(121){itemString = `id:18113`; iCumRate +=22;} //0.717547293뾰족귀 고양이 모자
					case(122){itemString = `id:18114`; iCumRate +=22;} //0.717547293줄무늬 고양이 모자
					case(123){itemString = `id:18115`; iCumRate +=22;} //0.717547293핀 고양이 모자
					case(124){itemString = `id:18112`; iCumRate +=22;} //0.717547293해 분장 소품
					case(125){itemString = `id:18111`; iCumRate +=22;} //0.717547293나무 분장 소품
					case(126){itemString = `id:18110`; iCumRate +=22;} //0.717547293덤불 분장 소품
					case(127){itemString = `id:18109`; iCumRate +=22;} //0.717547293나오 분장 소품
					case(128){itemString = `id:18108`; iCumRate +=22;} //0.717547293바위 분장 소품
					case(129){itemString = `id:18029`; iCumRate +=22;} //0.717547293나무테 안경
					case(130){itemString = `id:18028`; iCumRate +=22;} //0.717547293접이식 안경
					case(131){itemString = `id:40038`; iCumRate +=22;} //0.717547293라이트닝 원드
					case(132){itemString = `id:40039`; iCumRate +=22;} //0.717547293아이스 원드
					case(133){itemString = `id:40040`; iCumRate +=22;} //0.717547293파이어 원드
					case(134){itemString = `id:40041`; iCumRate +=22;} //0.717547293타격용 원드
					case(135){itemString = `id:40090`; iCumRate +=22;} //0.717547293힐링 원드
					case(136){itemString = `id:18542`; iCumRate +=22;} //0.717547293빅 체인 풀 헬름
					case(137){itemString = `id:18543`; iCumRate +=22;} //0.717547293@빅 슬릿 풀 헬름
					case(138){itemString = `id:18544`; iCumRate +=22;} //0.717547293@빅 펠리칸 프로텍터
					case(139){itemString = `id:18547`; iCumRate +=22;} //0.717547293@빅 파나쉬 헤드 프로텍터
					case(140){itemString = `id:19020`; iCumRate +=22;} //0.717547293나타네 설산용 코트
					case(141){itemString = `id:16520`; iCumRate +=22;} //0.717547293롱 레더 글러브
					case(142){itemString = `id:15128`; iCumRate +=22;} //0.717547293투 톤 비조 드레스
					case(143){itemString = `id:16019`; iCumRate +=22;} //0.717547293줄무늬 팔목 장갑
					case(144){itemString = `id:18047`; iCumRate +=22;} //0.717547293코레스 펠트 모자
					case(145){itemString = `id:18008`; iCumRate +=22;} //0.717547293스트라이프 캡
					case(146){itemString = `id:16008`; iCumRate +=22;} //0.717547293코레스 씨프 글러브
					case(147){itemString = `id:15028`; iCumRate +=22;} //0.717547293코레스 씨프슈트
					case(148){itemString = `id:17506`; iCumRate +=22;} //0.717547293롱그리브 부츠
					case(149){itemString = `id:18026`; iCumRate +=22;} //0.717547293몬거 상인모자
					case(150){itemString = `id:15052`; iCumRate +=22;} //0.717547293터크스 투톤 튜닉
					case(151){itemString = `id:19005`; iCumRate +=22;} //0.717547293머플러 로브
					case(152){itemString = `id:18040`; iCumRate +=22;} //0.717547293코레스 꼭지 베레모
					case(153){itemString = `id:18038`; iCumRate +=22;} //0.717547293깃털 배렛 모자
					case(154){itemString = `id:15042`; iCumRate +=22;} //0.717547293롱넥 원피스
					case(155){itemString = `id:40012`; iCumRate +=22;} //0.717547293바스타드 소드
					case(156){itemString = `id:2001`; iCumRate +=22;} //0.717547293금화 주머니
					case(157){itemString = `id:2006`; iCumRate +=22;} //0.717547293큰 금화 주머니
					case(158){itemString = `id:40015`; iCumRate +=22;} //0.717547293플루트 숏 소드
					case(159){itemString = `id:17016`; iCumRate +=22;} //0.717547293필드 컴뱃슈즈
					case(160){itemString = `id:17015`; iCumRate +=22;} //0.717547293컴뱃슈즈
					case(161){itemString = `id:17005`; iCumRate +=22;} //0.717547293사냥꾼 신발
					case(162){itemString = `id:17002`; iCumRate +=22;} //0.717547293검사 신발
					case(163){itemString = `id:17022`; iCumRate +=22;} //0.717547293레더부츠
					case(164){itemString = `id:17001`; iCumRate +=22;} //0.717547293가죽 부츠
					case(165){itemString = `id:17007`; iCumRate +=22;} //0.717547293가죽 구두
					case(166){itemString = `id:15031`; iCumRate +=22;} //0.717547293마법학교 교복
					case(167){itemString = `id:19012`; iCumRate +=22;} //0.717547293트루디 레이어드 로브
					case(168){itemString = `id:18004`; iCumRate +=22;} //0.717547293몬거 패션모자
					case(169){itemString = `id:15132`; iCumRate +=22;} //0.717547293내추럴 베스트 웨어
					case(170){itemString = `id:15043`; iCumRate +=22;} //0.717547293스포티 웨어세트
					case(171){itemString = `id:40081`; iCumRate +=22;} //0.717547293레더 롱 보우
					case(172){itemString = `id:15023`; iCumRate +=22;} //0.717547293토크 사냥꾼옷
					case(173){itemString = `id:40079`; iCumRate +=22;} //0.717547293메이스
					case(174){itemString = `id:62005 prefix:20108`; iCumRate +=24;} //0.782778865키위
					case(175){itemString = `id:62005 prefix:20203`; iCumRate +=24;} //0.782778865양치기의
					case(176){itemString = `id:62005 prefix:20405`; iCumRate +=24;} //0.782778865거친
					case(177){itemString = `id:62005 prefix:20501`; iCumRate +=24;} //0.782778865간편한
					case(178){itemString = `id:62005 prefix:20508`; iCumRate +=24;} //0.782778865수상한
					case(179){itemString = `id:62005 prefix:20602`; iCumRate +=24;} //0.782778865견고한
					case(180){itemString = `id:62005 prefix:20615`; iCumRate +=24;} //0.782778865사막거미
					case(181){itemString = `id:62005 prefix:20619`; iCumRate +=24;} //0.782778865특이한
					case(182){itemString = `id:62005 prefix:20701`; iCumRate +=24;} //0.782778865거센
					case(183){itemString = `id:62005 prefix:21003`; iCumRate +=24;} //0.782778865파멸의
					case(184){itemString = `id:62005 suffix:30506`; iCumRate +=24;} //0.782778865매서운
					case(185){itemString = `id:62005 suffix:30614`; iCumRate +=24;} //0.782778865기운찬
					case(186){itemString = `id:62005 suffix:30616`; iCumRate +=24;} //0.782778865매정한
					case(187){itemString = `id:62005 suffix:30617`; iCumRate +=24;} //0.782778865무정한
					case(188){itemString = `id:62005 suffix:30618`; iCumRate +=24;} //0.782778865비참한
					case(189){itemString = `id:62005 suffix:30704`; iCumRate +=24;} //0.782778865데들리
					case(190){itemString = `id:62005 suffix:30801`; iCumRate +=24;} //0.782778865네이쳐
					case(191){itemString = `id:62005 suffix:30802`; iCumRate +=24;} //0.782778865카운터
					case(192){itemString = `id:62005 suffix:30803`; iCumRate +=24;} //0.782778865윈드밀
					case(193){itemString = `id:62005 suffix:30804`; iCumRate +=24;} //0.782778865스매시
					case(194){itemString = `id:62005 prefix:20505`; iCumRate +=9;} //0.293542074리자드
					case(195){itemString = `id:62005 prefix:21007`; iCumRate +=9;} //0.293542074히스
					case(196){itemString = `id:62005 suffix:30515`; iCumRate +=9;} //0.293542074해적의
					case(197){itemString = `id:62005 prefix:20625`; iCumRate +=9;} //0.293542074금속 바늘
					case(198){itemString = `id:62005 suffix:30624`; iCumRate +=9;} //0.293542074산사나무
					case(199){itemString = `id:62005 prefix:20721`; iCumRate +=9;} //0.293542074한가한
					case(200){itemString = `id:91034`; iCumRate +=80;} //2.609262883전투 경험치 포션
					case(201){itemString = `id:51004`; iCumRate +=11;} //0.358773646생명력 100 포션
					case(202){itemString = `id:51014`; iCumRate +=11;} //0.358773646스태미나 100 포션
					case(203){itemString = `id:51029`; iCumRate +=11;} //0.358773646생명력과 스태미나 100 포션
					case(204){itemString = `id:63000`; iCumRate +=11;} //0.358773646피닉스의 깃털
					case(205){itemString = `id:60037`; iCumRate +=11;} //0.358773646블랙 유스 포션
					case(206){itemString = `id:60038`; iCumRate +=11;} //0.358773646레드 포션
					case(207){itemString = `id:50012`; iCumRate +=11;} //0.358773646황금 달걀
					case(208){itemString = `id:50013`; iCumRate +=11;} //0.358773646황금 사과
					case(209){itemString = `id:50541 `; iCumRate +=11;} //0.358773646에스프레소
					case(210){itemString = `id:50542 `; iCumRate +=11;} //0.358773646에스프레소 마끼아또
					case(211){itemString = `id:50543 `; iCumRate +=11;} //0.358773646카푸치노
					case(212){itemString = `id:50544 `; iCumRate +=11;} //0.358773646마끼아또
					case(213){itemString = `id:50545 `; iCumRate +=11;} //0.358773646카페 모카
					case(214){itemString = `id:50546 `; iCumRate +=11;} //0.358773646아이스 카페 모카
					case(215){itemString = `id:50547 `; iCumRate +=11;} //0.358773646아이스 마끼아또
					case(216){itemString = `id:50163`; iCumRate +=11;} //0.358773646피쉬 앤 칩스
					case(217){itemString = `id:50170`; iCumRate +=11;} //0.358773646치즈 퐁듀
					case(218){itemString = `id:50171`; iCumRate +=11;} //0.358773646이멘 마하산 와인
					case(219){itemString = `id:40007`; iCumRate +=11;} //0.358773646한손도끼
					case(220){itemString = `id:40016`; iCumRate +=11;} //0.358773646해머
					case(221){itemString = `id:40010`; iCumRate +=11;} //0.358773646롱 소드
					case(222){itemString = `id:40011`; iCumRate +=11;} //0.358773646브로드 소드
					case(223){itemString = `id:40012`; iCumRate +=11;} //0.358773646바스타드 소드
					case(224){itemString = `id:40015`; iCumRate +=11;} //0.358773646플루트 숏 소드
					case(225){itemString = `id:40003`; iCumRate +=11;} //0.358773646숏 보우
					case(226){itemString = `id:40005`; iCumRate +=11;} //0.358773646숏 소드
					case(227){itemString = `id:40006`; iCumRate +=11;} //0.358773646단검
					case(228){itemString = `id:40002`; iCumRate +=11;} //0.358773646연습용 목도
					case(229){itemString = `id:50123`; iCumRate +=11;} //0.358773646베이컨구이
					case(230){itemString = `id:50124`; iCumRate +=11;} //0.358773646비프 스테이크
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

		// 아머 가차폰을 못받았다.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}
	}	
}
