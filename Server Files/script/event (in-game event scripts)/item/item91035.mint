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
	// 생활 가챠폰
	int itemID = cItem.GetClassId();
	 if(GetLocale().LowerCase()== `china`
		|| GetLocale().LowerCase()== `taiwan`)
	{
		// 중국의 경우
		// 중국 생활 가차폰은 캐시가차폰과 생활 가차폰을 동시에 준다.

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

		// 생활 가차폰
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3374);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	){	itemString = `id:40018 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	우쿨렐레
					case(	1	){	itemString = `id:40017 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	만돌린
					case(	2	){	itemString = `id:40004 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	류트
					case(	3	){	itemString = `id:40050 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	샬루모
					case(	4	){	itemString = `id:40048 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	휘슬
					case(	5	){	itemString = `id:40049 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	플루트
					case(	6	){	itemString = `id:40071 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'라' 음 빈 병
					case(	7	){	itemString = `id:40072 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'시' 음 빈 병
					case(	8	){	itemString = `id:40073 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'도' 음 빈 병
					case(	9	){	itemString = `id:40074 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'레' 음 빈 병
					case(	10	){	itemString = `id:40075 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'미' 음 빈 병
					case(	11	){	itemString = `id:40076 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'파' 음 빈 병
					case(	12	){	itemString = `id:40077 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	'솔' 음 빈 병
					case(	13	){	itemString = `id:40163 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	론카도라
					case(	14	){	itemString = `id:40042 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	식칼
					case(	15	){	itemString = `id:40043 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	반죽용 밀대
					case(	16	){	itemString = `id:40044 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	다용도 국자
					case(	17	){	itemString = `id:46004 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	냄비
					case(	18	){	itemString = `id:46005 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	간이 테이블
					case(	19	){	itemString = `id:40045 col1:6100f4fa col2:6100f4fa col3:6100f4fa`	; iCumRate += 	1	;} //	0.0296384114 	3374	낚싯대
					case(	20	){	itemString = `id:40018 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	우쿨렐레
					case(	21	){	itemString = `id:40017 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	만돌린
					case(	22	){	itemString = `id:40004 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	류트
					case(	23	){	itemString = `id:40050 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	샬루모
					case(	24	){	itemString = `id:40048 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	휘슬
					case(	25	){	itemString = `id:40049 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	플루트
					case(	26	){	itemString = `id:40071 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'라' 음 빈 병
					case(	27	){	itemString = `id:40072 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'시' 음 빈 병
					case(	28	){	itemString = `id:40073 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'도' 음 빈 병
					case(	29	){	itemString = `id:40074 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'레' 음 빈 병
					case(	30	){	itemString = `id:40075 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'미' 음 빈 병
					case(	31	){	itemString = `id:40076 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'파' 음 빈 병
					case(	32	){	itemString = `id:40077 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	'솔' 음 빈 병
					case(	33	){	itemString = `id:40163 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	론카도라
					case(	34	){	itemString = `id:40042 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	식칼
					case(	35	){	itemString = `id:40043 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	반죽용 밀대
					case(	36	){	itemString = `id:40044 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	다용도 국자
					case(	37	){	itemString = `id:46004 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	냄비
					case(	38	){	itemString = `id:46005 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	간이 테이블
					case(	39	){	itemString = `id:40045 col1:00ff00 col2:00ff00 col3:00ff00`	; iCumRate += 	3	;} //	0.0889152341 	3374	낚싯대
					case(	40	){	itemString = `id:40018 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	우쿨렐레
					case(	41	){	itemString = `id:40017 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	만돌린
					case(	42	){	itemString = `id:40004 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	류트
					case(	43	){	itemString = `id:40050 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	샬루모
					case(	44	){	itemString = `id:40048 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	휘슬
					case(	45	){	itemString = `id:40049 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	플루트
					case(	46	){	itemString = `id:40071 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'라' 음 빈 병
					case(	47	){	itemString = `id:40072 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'시' 음 빈 병
					case(	48	){	itemString = `id:40073 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'도' 음 빈 병
					case(	49	){	itemString = `id:40074 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'레' 음 빈 병
					case(	50	){	itemString = `id:40075 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'미' 음 빈 병
					case(	51	){	itemString = `id:40076 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'파' 음 빈 병
					case(	52	){	itemString = `id:40077 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	'솔' 음 빈 병
					case(	53	){	itemString = `id:40163 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	론카도라
					case(	54	){	itemString = `id:40042 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	식칼
					case(	55	){	itemString = `id:40043 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	반죽용 밀대
					case(	56	){	itemString = `id:40044 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	다용도 국자
					case(	57	){	itemString = `id:46004 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	냄비
					case(	58	){	itemString = `id:46005 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	간이 테이블
					case(	59	){	itemString = `id:40045 col1:ffffff col2:ffffff col3:ffffff`	; iCumRate += 	3	;} //	0.0889152341 	3374	낚싯대
					case(	60	){	itemString = `id:40031 `	; iCumRate += 	17	;} //	0.5038529935 	3374	석궁
					case(	61	){	itemString = `id:40081 `	; iCumRate += 	17	;} //	0.5038529935 	3374	롱 보우
					case(	62	){	itemString = `id:40014 `	; iCumRate += 	17	;} //	0.5038529935 	3374	콤포짓 보우
					case(	63	){	itemString = `id:46006 `	; iCumRate += 	17	;} //	0.5038529935 	3374	카이트 실드
					case(	64	){	itemString = `id:40011 `	; iCumRate += 	17	;} //	0.5038529935 	3374	브로드 소드
					case(	65	){	itemString = `id:46001 `    ; iCumRate += 	17	;} //	0.5038529935 	3374	라운드 실드
					case(	66	){	itemString = `id:14013 `	; iCumRate += 	17	;} //	0.5038529935 	3374	로리카
					case(	67	){	itemString = `id:14019 `	; iCumRate += 	17	;} //	0.5038529935 	3374	그레이스 플레이트 아머
					case(	68	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	야광 머플러 로브
					case(	69	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	야광 머플러 로브
					case(	70	){	itemString = `id:19007 `	; iCumRate += 	17	;} //	0.5038529935 	3374	야광 머플러 로브
					case(	71	){	itemString = `id:40015 `	; iCumRate += 	17	;} //	0.5038529935 	3374	플루트 숏 소드
					case(	72	){	itemString = `id:17071 `	; iCumRate += 	17	;} //	0.5038529935 	3374	니하이 부츠
					case(	73	){	itemString = `id:15153 `	; iCumRate += 	17	;} //	0.5038529935 	3374	산드라 스나이퍼 수트(남성용)
					case(	74	){	itemString = `id:13047 `	; iCumRate += 	17	;} //	0.5038529935 	3374	키리누스진 하프 플레이트 아머(남성용)
					case(	75	){	itemString = `id:17041 `	; iCumRate += 	17	;} //	0.5038529935 	3374	덩굴무늬 헌팅부츠
					case(	76	){	itemString = `id:46008 `	; iCumRate += 	17	;} //	0.5038529935 	3374	라이트 헤테로 카이트 실드
					case(	77	){	itemString = `id:15055 `	; iCumRate += 	17	;} //	0.5038529935 	3374	레더 미니 원피스
					case(	78	){	itemString = `id:46006 `	; iCumRate += 	17	;} //	0.5038529935 	3374	카이트 실드
					case(	79	){	itemString = `id:15053 `	; iCumRate += 	17	;} //	0.5038529935 	3374	플랫칼라 원피스
					case(	80	){	itemString = `id:40030 `	; iCumRate += 	17	;} //	0.5038529935 	3374	투 핸디드 소드
					case(	81	){	itemString = `id:17045 `	; iCumRate += 	17	;} //	0.5038529935 	3374	브이 넥 라인 레더 부츠
					case(	82	){	itemString = `id:14004 `	; iCumRate += 	17	;} //	0.5038529935 	3374	클로스 메일
					case(	83	){	itemString = `id:17040 `	; iCumRate += 	17	;} //	0.5038529935 	3374	엘라 스트랩 부츠
					case(	84	){	itemString = `id:18516 `	; iCumRate += 	17	;} //	0.5038529935 	3374	이블 다잉 크라운
					case(	85	){	itemString = `id:18521 `	; iCumRate += 	17	;} //	0.5038529935 	3374	유러피안 컴프
					case(	86	){	itemString = `id:15136 `	; iCumRate += 	17	;} //	0.5038529935 	3374	모험가 슈트
					case(	87	){	itemString = `id:18525 `	; iCumRate += 	17	;} //	0.5038529935 	3374	워터드롭 캡
					case(	88	){	itemString = `id:18511 `	; iCumRate += 	17	;} //	0.5038529935 	3374	플루트 풀 헬름
					case(	89	){	itemString = `id:18506 `	; iCumRate += 	17	;} //	0.5038529935 	3374	윙 하프 헬름
					case(	90	){	itemString = `id:16505 `	; iCumRate += 	17	;} //	0.5038529935 	3374	플루트 건틀렛
					case(	91	){	itemString = `id:18502 `	; iCumRate += 	17	;} //	0.5038529935 	3374	본 헬름
					case(	92	){	itemString = `id:15014 `	; iCumRate += 	17	;} //	0.5038529935 	3374	파발꾼의 옷
					case(	93	){	itemString = `id:18113 `	; iCumRate += 	17	;} //	0.5038529935 	3374	뾰족귀 고양이 모자
					case(	94	){	itemString = `id:18114 `	; iCumRate += 	17	;} //	0.5038529935 	3374	줄무늬 고양이 모자
					case(	95	){	itemString = `id:18115 `	; iCumRate += 	17	;} //	0.5038529935 	3374	핀 고양이 모자
					case(	96	){	itemString = `id:18112 `	; iCumRate += 	20	;} //	0.5927682276 	3374	해 분장 소품
					case(	97	){	itemString = `id:18111 `	; iCumRate += 	20	;} //	0.5927682276 	3374	나무 분장 소품
					case(	98	){	itemString = `id:18110 `	; iCumRate += 	20	;} //	0.5927682276 	3374	덤불 분장 소품
					case(	99	){	itemString = `id:18109 `	; iCumRate += 	20	;} //	0.5927682276 	3374	나오 분장 소품
					case(	100	){	itemString = `id:18108 `	; iCumRate += 	20	;} //	0.5927682276 	3374	바위 분장 소품
					case(	101	){	itemString = `id:18029 `	; iCumRate += 	20	;} //	0.5927682276 	3374	나무테 안경
					case(	102	){	itemString = `id:18028 `	; iCumRate += 	20	;} //	0.5927682276 	3374	접이식 안경
					case(	103	){	itemString = `id:40038 `	; iCumRate += 	20	;} //	0.5927682276 	3374	라이트닝 원드
					case(	104	){	itemString = `id:40039 `	; iCumRate += 	20	;} //	0.5927682276 	3374	아이스 원드
					case(	105	){	itemString = `id:40040 `	; iCumRate += 	20	;} //	0.5927682276 	3374	파이어 원드
					case(	106	){	itemString = `id:40041 `	; iCumRate += 	20	;} //	0.5927682276 	3374	타격용 원드
					case(	107	){	itemString = `id:40090 `	; iCumRate += 	20	;} //	0.5927682276 	3374	힐링 원드
					case(	108	){	itemString = `id:18542 `	; iCumRate += 	20	;} //	0.5927682276 	3374	빅 체인 풀 헬름
					case(	109	){	itemString = `id:18543 `	; iCumRate += 	20	;} //	0.5927682276 	3374	슬릿 풀 헬름
					case(	110	){	itemString = `id:18544 `	; iCumRate += 	20	;} //	0.5927682276 	3374	펠리칸 프로텍터
					case(	111	){	itemString = `id:18547 `	; iCumRate += 	20	;} //	0.5927682276 	3374	파나쉬 헤드 프로텍터
					case(	112	){	itemString = `id:19020 `	; iCumRate += 	20	;} //	0.5927682276 	3374	나타네 설산용 코트
					case(	113	){	itemString = `id:16520 `	; iCumRate += 	20	;} //	0.5927682276 	3374	롱 레더 글러브
					case(	114	){	itemString = `id:15128 `	; iCumRate += 	20	;} //	0.5927682276 	3374	투 톤 비조 드레스
					case(	115	){	itemString = `id:16019 `	; iCumRate += 	20	;} //	0.5927682276 	3374	줄무늬 팔목 장갑
					case(	116	){	itemString = `id:18047 `	; iCumRate += 	20	;} //	0.5927682276 	3374	코레스 펠트 모자
					case(	117	){	itemString = `id:18008 `	; iCumRate += 	20	;} //	0.5927682276 	3374	스트라이프 캡
					case(	118	){	itemString = `id:16008 `	; iCumRate += 	20	;} //	0.5927682276 	3374	코레스 씨프 글러브
					case(	119	){	itemString = `id:15028 `	; iCumRate += 	20	;} //	0.5927682276 	3374	코레스 씨프슈트
					case(	120	){	itemString = `id:17506 `	; iCumRate += 	20	;} //	0.5927682276 	3374	롱그리브 부츠
					case(	121	){	itemString = `id:18026 `	; iCumRate += 	20	;} //	0.5927682276 	3374	몬거 상인모자
					case(	122	){	itemString = `id:15052 `	; iCumRate += 	20	;} //	0.5927682276 	3374	터크스 투톤 튜닉
					case(	123	){	itemString = `id:19005 `	; iCumRate += 	20	;} //	0.5927682276 	3374	머플러 로브
					case(	124	){	itemString = `id:18040 `	; iCumRate += 	20	;} //	0.5927682276 	3374	코레스 꼭지 베레모
					case(	125	){	itemString = `id:18038 `	; iCumRate += 	20	;} //	0.5927682276 	3374	깃털 배렛 모자
					case(	126	){	itemString = `id:15042 `	; iCumRate += 	20	;} //	0.5927682276 	3374	롱넥 원피스
					case(	127	){	itemString = `id:46001 `	; iCumRate += 	20	;} //	0.5927682276 	3374	라운드 실드
					case(	128	){	itemString = `id:40012 `	; iCumRate += 	24	;} //	0.7113218731 	3374	바스타드 소드
					case(	129	){	itemString = `id:2001` 		; iCumRate += 	24	;} //	0.7113218731 	3374	금화 주머니
					case(	130	){	itemString = `id:2006` 		; iCumRate += 	24	;} //	0.7113218731 	3374	큰 금화 주머니
					case(	131	){	itemString = `id:18010 `	; iCumRate += 	24	;} //	0.7113218731 	3374	몬거 스마트 캡
					case(	132	){	itemString = `id:15131 `	; iCumRate += 	24	;} //	0.7113218731 	3374	핀 에이프런 스커트
					case(	133	){	itemString = `id:40015 `	; iCumRate += 	24	;} //	0.7113218731 	3374	플루트 숏 소드
					case(	134	){	itemString = `id:17016 `	; iCumRate += 	24	;} //	0.7113218731 	3374	필드 컴뱃슈즈
					case(	135	){	itemString = `id:17015 `	; iCumRate += 	24	;} //	0.7113218731 	3374	컴뱃슈즈
					case(	136	){	itemString = `id:17005 `	; iCumRate += 	24	;} //	0.7113218731 	3374	사냥꾼 신발
					case(	137	){	itemString = `id:17002 `	; iCumRate += 	24	;} //	0.7113218731 	3374	검사 신발
					case(	138	){	itemString = `id:17022 `	; iCumRate += 	24	;} //	0.7113218731 	3374	레더부츠
					case(	139	){	itemString = `id:17001 `	; iCumRate += 	24	;} //	0.7113218731 	3374	가죽 부츠
					case(	140	){	itemString = `id:17007 `	; iCumRate += 	24	;} //	0.7113218731 	3374	가죽 구두
					case(	141	){	itemString = `id:16009 `	; iCumRate += 	24	;} //	0.7113218731 	3374	사냥꾼장갑
					case(	142	){	itemString = `id:80004 `	; iCumRate += 	24	;} //	0.7113218731 	3374	L 로드
					case(	143	){	itemString = `id:15031 `	; iCumRate += 	24	;} //	0.7113218731 	3374	마법학교 교복
					case(	144	){	itemString = `id:19012 `	; iCumRate += 	24	;} //	0.7113218731 	3374	트루디 레이어드 로브
					case(	145	){	itemString = `id:18004 `	; iCumRate += 	24	;} //	0.7113218731 	3374	몬거 패션모자
					case(	146	){	itemString = `id:15132 `	; iCumRate += 	24	;} //	0.7113218731 	3374	내추럴 베스트 웨어
					case(	147	){	itemString = `id:15043 `	; iCumRate += 	24	;} //	0.7113218731 	3374	스포티 웨어세트
					case(	148	){	itemString = `id:15033 `	; iCumRate += 	24	;} //	0.7113218731 	3374	몬거 여행자옷
					case(	149	){	itemString = `id:40081 `	; iCumRate += 	24	;} //	0.7113218731 	3374	레더 롱 보우
					case(	150	){	itemString = `id:15023 `	; iCumRate += 	24	;} //	0.7113218731 	3374	토크 사냥꾼옷
					case(	151	){	itemString = `id:40079 `	; iCumRate += 	24	;} //	0.7113218731 	3374	메이스
					case(	152	){	itemString = `id:62005 prefix:20203`	; iCumRate += 	16	;} //	0.4742145821 	3374	양치기의
					case(	153	){	itemString = `id:62005 prefix:21003`	; iCumRate += 	16	;} //	0.4742145821 	3374	파멸의
					case(	154	){	itemString = `id:62005 suffix:30201`	; iCumRate += 	16	;} //	0.4742145821 	3374	갈색곰
					case(	155	){	itemString = `id:62005 suffix:30302`	; iCumRate += 	16	;} //	0.4742145821 	3374	코볼트
					case(	156	){	itemString = `id:62005 prefix:20201`	; iCumRate += 	16	;} //	0.4742145821 	3374	하드
					case(	157	){	itemString = `id:62005 suffix:30304`	; iCumRate += 	16	;} //	0.4742145821 	3374	회색늑대
					case(	158	){	itemString = `id:62005 suffix:30702`	; iCumRate += 	16	;} //	0.4742145821 	3374	레이븐
					case(	159	){	itemString = `id:62005 suffix:30704`	; iCumRate += 	16	;} //	0.4742145821 	3374	데들리
					case(	160	){	itemString = `id:62005 suffix:30801`	; iCumRate += 	16	;} //	0.4742145821 	3374	네이쳐
					case(	161	){	itemString = `id:62005 suffix:30802`	; iCumRate += 	16	;} //	0.4742145821 	3374	카운터
					case(	162	){	itemString = `id:62005 suffix:30803`	; iCumRate += 	16	;} //	0.4742145821 	3374	윈드밀
					case(	163	){	itemString = `id:62005 suffix:30804`	; iCumRate += 	16	;} //	0.4742145821 	3374	스매시
					case(	164	){	itemString = `id:62005 prefix:20405`	; iCumRate += 	16	;} //	0.4742145821 	3374	거친
					case(	165	){	itemString = `id:62005 prefix:20501`	; iCumRate += 	16	;} //	0.4742145821 	3374	간편한
					case(	166	){	itemString = `id:62005 prefix:20602`	; iCumRate += 	16	;} //	0.4742145821 	3374	견고한
					case(	167	){	itemString = `id:62005 prefix:20701`	; iCumRate += 	16	;} //	0.4742145821 	3374	거센
					case(	168	){	itemString = `id:62005 suffix:30506`	; iCumRate += 	16	;} //	0.4742145821 	3374	매서운
					case(	169	){	itemString = `id:62005 suffix:30614`	; iCumRate += 	16	;} //	0.4742145821 	3374	기운찬
					case(	170	){	itemString = `id:62005 prefix:20108`	; iCumRate += 	16	;} //	0.4742145821 	3374	키위
					case(	171	){	itemString = `id:62005 prefix:20304`	; iCumRate += 	16	;} //	0.4742145821 	3374	타조
					case(	172	){	itemString = `id:62005 prefix:20505`	; iCumRate += 	16	;} //	0.4742145821 	3374	리자드
					case(	173	){	itemString = `id:62005 prefix:20209`	; iCumRate += 	16	;} //	0.4742145821 	3374	몽구스
					case(	174	){	itemString = `id:62005 prefix:20409`	; iCumRate += 	16	;} //	0.4742145821 	3374	사막여우
					case(	175	){	itemString = `id:62005 prefix:20615`	; iCumRate += 	16	;} //	0.4742145821 	3374	사막거미
					case(	176	){	itemString = `id:62005 prefix:20508`	; iCumRate += 	16	;} //	0.4742145821 	3374	수상한
					case(	177	){	itemString = `id:62005 prefix:20618`	; iCumRate += 	16	;} //	0.4742145821 	3374	망설이는
					case(	178	){	itemString = `id:62005 prefix:20718`	; iCumRate += 	16	;} //	0.4742145821 	3374	이상한
					case(	179	){	itemString = `id:62005 prefix:20212`	; iCumRate += 	16	;} //	0.4742145821 	3374	괴상한
					case(	180	){	itemString = `id:62005 prefix:20412`	; iCumRate += 	16	;} //	0.4742145821 	3374	별난
					case(	181	){	itemString = `id:62005 prefix:20619`	; iCumRate += 	16	;} //	0.4742145821 	3374	특이한
					case(	182	){	itemString = `id:62005 suffix:30616`	; iCumRate += 	16	;} //	0.4742145821 	3374	매정한
					case(	183	){	itemString = `id:62005 suffix:30617`	; iCumRate += 	16	;} //	0.4742145821 	3374	무정한
					case(	184	){	itemString = `id:62005 suffix:30618`	; iCumRate += 	16	;} //	0.4742145821 	3374	비참한
					case(	185	){	itemString = `id:62005 suffix:30726`	; iCumRate += 	16	;} //	0.4742145821 	3374	하모니
					case(	186	){	itemString = `id:62005 suffix:30629`	; iCumRate += 	16	;} //	0.4742145821 	3374	멜로디
					case(	187	){	itemString = `id:62005 suffix:30727`	; iCumRate += 	16	;} //	0.4742145821 	3374	소금
					case(	188	){	itemString = `id:62005 suffix:30630`	; iCumRate += 	16	;} //	0.4742145821 	3374	설탕
					case(	189	){	itemString = `id:91034 `	; iCumRate += 	32	;} //	0.9484291642 	3374	경험치 증가 포션
					case(	190	){	itemString = `id:51003 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력 50 포션
					case(	191	){	itemString = `id:51004 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력 100 포션
					case(	192	){	itemString = `id:51007 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	마나 30 포션
					case(	193	){	itemString = `id:51008 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	마나 50 포션
					case(	194	){	itemString = `id:51013 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	스태미나 50 포션
					case(	195	){	itemString = `id:51014 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	스태미나 100 포션
					case(	196	){	itemString = `id:51001 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력 10 포션
					case(	197	){	itemString = `id:51002 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력 30 포션
					case(	198	){	itemString = `id:51022 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력과 마나 30 포션
					case(	199	){	itemString = `id:51027 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력과 스태미나 30 포션
					case(	200	){	itemString = `id:51028 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력과 스태미나 50 포션
					case(	201	){	itemString = `id:51029 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	생명력과 스태미나 100 포션
					case(	202	){	itemString = `id:63000 count:10`	; iCumRate += 	17	;} //	0.5038529935 	3374	피닉스의 깃털
					case(	203	){	itemString = `id:60037 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	블랙 유스 포션
					case(	204	){	itemString = `id:60038 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	레드 포션
					case(	205	){	itemString = `id:62004 count:5`	; iCumRate += 	17	;} //	0.5038529935 	3374	마법가루
					case(	206	){	itemString = `id:50012`	; iCumRate += 	17	;} //	0.5038529935 	3374	황금 달걀
					case(	207	){	itemString = `id:50013`	; iCumRate += 	17	;} //	0.5038529935 	3374	황금 사과
					case(	208	){	itemString = `id:50163 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	피쉬 앤 칩스
					case(	209	){	itemString = `id:50164 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	T본 스테이크
					case(	210	){	itemString = `id:50165 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	치즈 그라탕
					case(	211	){	itemString = `id:50166 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	카레 라이스
					case(	212	){	itemString = `id:50167 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	코 코 뱅
					case(	213	){	itemString = `id:50168 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	송어찜
					case(	214	){	itemString = `id:50169 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	부야 베스
					case(	215	){	itemString = `id:50170 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	치즈 퐁듀
					case(	216	){	itemString = `id:50171 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	이멘 마하산 와인
					case(	217	){	itemString = `id:50172 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	레어치즈 케익
					case(	218	){	itemString = `id:50173 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	가토 오 쇼콜라
					case(	219	){	itemString = `id:50174 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	크로크 무슈
					case(	220	){	itemString = `id:50175 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	브라우니
					case(	221	){	itemString = `id:50176 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	버터 비스킷
					case(	222	){	itemString = `id:50177 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	초코칩 쿠키
					case(	223	){	itemString = `id:50178 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	오렌지 주스
					case(	224	){	itemString = `id:50179 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	레몬 주스
					case(	225	){	itemString = `id:50180 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	초콜릿 우유
					case(	226	){	itemString = `id:50181 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	라인산 진
					case(	227	){	itemString = `id:50182 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	브리흐네 위스키
					case(	228	){	itemString = `id:50199 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	스크류 드라이버
					case(	229	){	itemString = `id:50200 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	라인 슬링
					case(	230	){	itemString = `id:50201 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	BnR
					case(	231	){	itemString = `id:50202 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	키스 온 더 립스
					case(	232	){	itemString = `id:50203 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	레드 선라이즈
					case(	233	){	itemString = `id:50183 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	데브니쉬 흑맥주
					case(	234	){	itemString = `id:50123 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	베이컨구이
					case(	235	){	itemString = `id:50124 quality:100`	; iCumRate += 	17	;} //	0.5038529935 	3374	비프 스테이크
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

		// 생활 가차폰을 못받았다.
		if (!bLivingGachaphonGived)
		{
			GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		}
	}	
}
