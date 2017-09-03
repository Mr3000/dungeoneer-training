////////////////////////////////////////////////////////////////////////////////
server string TreasureDropItem(
	character player,
	int itemClassId)
// : 실제로 드랍하게 될 아이템 목록.
////////////////////////////////////////////////////////////////////////////////
{
	int itemID = itemClassId;

	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(158);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13060`; iCumRate +=1;} //0.6329% 드래곤 스케일 아머(여성용)
					case(1){itemString = `id:13061`; iCumRate +=1;} //0.6329% 드래곤 스케일 아머 (남성용)
					case(2){itemString = `id:13062`; iCumRate +=1;} //0.6329% 드래곤 스케일 아머(자이언트 여성용)
					case(3){itemString = `id:13063`; iCumRate +=1;} //0.6329% 드래곤 스케일 아머(자이언트 남성용)
					case(4){itemString = `id:16543`; iCumRate +=1;} //0.6329% 드래곤 스케일 건틀렛
					case(5){itemString = `id:16544`; iCumRate +=1;} //0.6329% 드래곤 스케일 건틀렛(자이언트용)
					case(6){itemString = `id:17530`; iCumRate +=1;} //0.6329% 드래곤 스케일 그리브
					case(7){itemString = `id:18577`; iCumRate +=1;} //0.6329% 드래곤 스케일 헬름
					case(8){itemString = `id:14011`; iCumRate +=1;} //0.6329% 드란도스 레더메일 (남성용)
					case(9){itemString = `id:14005`; iCumRate +=1;} //0.6329% 드란도스 레더메일 (여성용)
					case(10){itemString = `id:15352`; iCumRate +=1;} //0.6329% 천룡지의 (남성용)
					case(11){itemString = `id:15353`; iCumRate +=1;} //0.6329% 천룡지의 (여성용)
					case(12){itemString = `id:17139`; iCumRate +=1;} //0.6329% 천룡지화
					case(13){itemString = `id:14040`; iCumRate +=1;} //0.6329%@차이나 드래곤 아머엘프
					case(14){itemString = `id:14041`; iCumRate +=1;} //0.6329%@차이나 드래곤 아머자이언트
					case(15){itemString = `id:14039`; iCumRate +=1;} //0.6329%@차이나 드래곤 아머인간
					case(16){itemString = `id:18553`; iCumRate +=1;} //0.6329%@차이나 드래곤 헬름(엘프전용)엘프
					case(17){itemString = `id:18552`; iCumRate +=1;} //0.6329%@차이나 드래곤 헬름인간, 자이언트
					case(18){itemString = `id:17095`; iCumRate +=1;} //0.6329%@차이나 드래곤 부츠전종족
					case(19){itemString = `id:16533`; iCumRate +=1;} //0.6329%@차이나 드래곤 건틀렛엘프
					case(20){itemString = `id:16535`; iCumRate +=1;} //0.6329%@차이나 드래곤 건틀렛자이언트
					case(21){itemString = `id:16532`; iCumRate +=1;} //0.6329%@차이나 드래곤 건틀렛인간
					case(22){itemString = `id:15267`; iCumRate +=2;} //1.2658%테라 고딕 풀 드레스
					case(23){itemString = `id:15362`; iCumRate +=2;} //1.2658%테라 고딕 펑크 수트
					case(24){itemString = `id:15405`; iCumRate +=2;} //1.2658%엘리네드 패셔니스타 드레스
					case(25){itemString = `id:17039`; iCumRate +=2;} //1.2658%코레스 큐트 리본 슈즈
					case(26){itemString = `id:13050`; iCumRate +=2;} //1.2658%클라우스 나이트 아머
					case(27){itemString = `id:16551`; iCumRate +=2;} //1.2658%클라우스 나이트 건틀렛
					case(28){itemString = `id:17534`; iCumRate +=2;} //1.2658%클라우스 나이트 부츠
					case(29){itemString = `id:46010`; iCumRate +=2;} //1.2658% @드래곤 실드
					case(30){itemString = `id:15373`; iCumRate +=5;} //3.1646%시스루 칵테일 드레스
					case(31){itemString = `id:18218`; iCumRate +=5;} //3.1646%빈티지 애드미럴 모자(남성용)
					case(32){itemString = `id:18219`; iCumRate +=5;} //3.1646%빈티지 애드미럴 모자(여성용)
					case(33){itemString = `id:17141`; iCumRate +=5;} //3.1646%파이릿 우드워커 부츠
					case(34){itemString = `id:17154`; iCumRate +=5;} //3.1646%프로퍼 스몰 코드 슈즈
					case(35){itemString = `id:18038`; iCumRate +=5;} //3.1646%깃털 배렛 모자
					case(36){itemString = `id:15184`; iCumRate +=10;} //6.3291%테라 에이션트 패턴 웨어
					case(37){itemString = `id:15066`; iCumRate +=10;} //6.3291%루이스 베스트 웨어
					case(38){itemString = `id:15099`; iCumRate +=10;} //6.3291%비앙카 드로워즈 레이어드 스커트
					case(39){itemString = `id:19038`; iCumRate +=10;} //6.3291%라바 캣 로브
					case(40){itemString = `id:17120`; iCumRate +=10;} //6.3291%보니타 플룸 앵클 부츠
					case(41){itemString = `id:16136`; iCumRate +=10;} //6.3291%아이언 피라미드 밴드
					case(42){itemString = `id:15374`; iCumRate +=10;} //6.3291%샤이니 고딕 프릴 드레스
					case(43){itemString = `id:15136`; iCumRate +=10;} //6.3291%고딕 레이스 스커트
					case(44){itemString = `id:14032`; iCumRate +=10;} //6.3291%스티치 롱 로브 아머
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(948);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.105485232코레스 미스터리 로스웰 (UFO)
					case(1){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파나 케아 힐링 원드
					case(2){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 아이스 원드
					case(3){itemString = `id:40250 `; iCumRate +=1;} //0.105485232퀘르쿠스 파이어 원드
					case(4){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 라이트닝 원드
					case(5){itemString = `id:40250 `; iCumRate +=1;} //0.105485232칼피누스 힐링 원드
					case(6){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파르 아이스 원드
					case(7){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 파이어 원드
					case(8){itemString = `id:40250 `; iCumRate +=1;} //0.105485232이미션 라이트닝 원드
					case(9){itemString = `id:18569 `; iCumRate +=1;} //0.105485232devCAT 모자
					case(10){itemString = `id:40171 `; iCumRate +=1;} //0.105485232마사무네
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.105485232냄비(심해의)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.105485232남성용 마법사 정장
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.105485232여성용 마법사 정장
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.105485232아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.105485232볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.105485232그레이스 숄 드레스(여성용)
					case(33){itemString = `id:40250 `; iCumRate +=1;} //0.105485232부채
					case(34){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유카타 남
					case(35){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유타카 여
					case(36){itemString = `id:16046 `; iCumRate +=1;} //0.105485232고양이 손 장갑
					case(37){itemString = `id:18187 `; iCumRate +=1;} //0.105485232커다란 리본
					case(38){itemString = `id:18188 `; iCumRate +=1;} //0.105485232안대
					case(39){itemString = `id:18189 `; iCumRate +=1;} //0.105485232카우보이 모자
					case(40){itemString = `id:15252 `; iCumRate +=1;} //0.105485232집사 의상
					case(41){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(42){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(43){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232글라디우스
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232메이스
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232클레이모어
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232힐링 원드
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232글라디우스
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232아이스 원드
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232파이어 원드
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232타격용 원드
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232비펜니스
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232메이스
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232석궁
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232롱 보우
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(64){itemString = `id:15267 `; iCumRate +=1;} //0.105485232테라 고딕 풀 드레스
					case(65){itemString = `id:15268 `; iCumRate +=1;} //0.105485232테라 고딕 펑크 수트
					case(66){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(67){itemString = `id:15217 `; iCumRate +=1;} //0.105485232에이프런 원피스
					case(68){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(69){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(70){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(71){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(72){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(73){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(74){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(75){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232클레이모어
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232힐링 원드
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232아이스 원드
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232파이어 원드
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232타격용 원드
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.105485232비펜니스
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232석궁
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232롱 보우
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.105485232가디언 보우
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(88){itemString = `id:14039 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(인간)
					case(89){itemString = `id:14040 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(엘프)
					case(90){itemString = `id:14041 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(자이언트)
					case(91){itemString = `id:16532 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(인간/자이언트)
					case(92){itemString = `id:16535 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(자이언트)
					case(93){itemString = `id:16533 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(엘프)
					case(94){itemString = `id:17095 `; iCumRate +=1;} //0.105485232차이나 드래곤 부츠
					case(95){itemString = `id:18552 `; iCumRate +=1;} //0.105485232차이나 드래곤 헬름
					case(96){itemString = `id:40170 `; iCumRate +=1;} //0.105485232일본식 양손검
					case(97){itemString = `id:51007 count:10`; iCumRate +=2;} //0.210970464마나 30 포션
					case(98){itemString = `id:51013 count:10`; iCumRate +=2;} //0.210970464스태미나 50 포션
					case(99){itemString = `id:51001 count:10`; iCumRate +=2;} //0.210970464생명력 10 포션
					case(100){itemString = `id:51002 count:10`; iCumRate +=2;} //0.210970464생명력 30 포션
					case(101){itemString = `id:51022 count:10`; iCumRate +=2;} //0.210970464생명력과 마나 30 포션
					case(102){itemString = `id:51027 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 30 포션
					case(103){itemString = `id:51028 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 50 포션
					case(104){itemString = `id:63000 count:10`; iCumRate +=2;} //0.210970464피닉스의 깃털
					case(105){itemString = `id:60037 count:5`; iCumRate +=2;} //0.210970464블랙 유스 포션
					case(106){itemString = `id:60038 count:5`; iCumRate +=2;} //0.210970464레드 포션
					case(107){itemString = `id:50012 count:5`; iCumRate +=2;} //0.210970464황금 달걀
					case(108){itemString = `id:50013 count:5`; iCumRate +=2;} //0.210970464황금 사과
					case(109){itemString = `id:50541 quality:100`; iCumRate +=2;} //0.210970464에스프레소
					case(110){itemString = `id:50542 quality:100`; iCumRate +=2;} //0.210970464에스프레소 마끼아또 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=2;} //0.210970464카푸치노
					case(112){itemString = `id:50544 quality:100`; iCumRate +=2;} //0.210970464마끼아또
					case(113){itemString = `id:50545 quality:100`; iCumRate +=2;} //0.210970464카페 모카
					case(114){itemString = `id:50546 quality:100`; iCumRate +=2;} //0.210970464아이스 카페 모카
					case(115){itemString = `id:50547 quality:100`; iCumRate +=2;} //0.210970464아이스 마끼아또
					case(116){itemString = `id:50170 quality:100`; iCumRate +=2;} //0.210970464치즈 퐁듀
					case(117){itemString = `id:50171 quality:100`; iCumRate +=2;} //0.210970464이멘 마하산 와인
					case(118){itemString = `id:50172 quality:100`; iCumRate +=2;} //0.210970464레어치즈 케익
					case(119){itemString = `id:50173 quality:100`; iCumRate +=2;} //0.210970464가토 오 쇼콜라
					case(120){itemString = `id:50174 quality:100`; iCumRate +=2;} //0.210970464크로크 무슈
					case(121){itemString = `id:50175 quality:100`; iCumRate +=2;} //0.210970464브라우니
					case(122){itemString = `id:50176 quality:100`; iCumRate +=2;} //0.210970464버터 비스킷
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.316455696해적의
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.316455696리자드
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.316455696히스
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.316455696금속 바늘
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.316455696산사나무
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.316455696한가한
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=3;} //0.316455696마나 위자드|마나 위자드(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=3;} //0.316455696버스트 나이트|버스트 나이트(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=3;} //0.316455696마나 서머너|마나 서머너(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=3;} //0.316455696포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=4;} //0.421940928드래곤 크레스트
					case(134){itemString = `id:15113 `; iCumRate +=4;} //0.421940928여성용 검사학교 교복 쇼트타입
					case(135){itemString = `id:15114 `; iCumRate +=4;} //0.421940928남성용 검사학교 교복 롱타입
					case(136){itemString = `id:15065 `; iCumRate +=4;} //0.421940928엘라 베스트 스커트
					case(137){itemString = `id:19008 `; iCumRate +=4;} //0.421940928코코 판다 로브
					case(138){itemString = `id:15137 `; iCumRate +=4;} //0.421940928셀리나 하프 재킷 코트
					case(139){itemString = `id:18041 `; iCumRate +=4;} //0.421940928큰 챙 깃털 모자
					case(140){itemString = `id:19009 `; iCumRate +=4;} //0.421940928코코 래빗 로브
					case(141){itemString = `id:18112 `; iCumRate +=4;} //0.421940928해 분장 소품
					case(142){itemString = `id:18111 `; iCumRate +=4;} //0.421940928나무 분장 소품
					case(143){itemString = `id:18110 `; iCumRate +=4;} //0.421940928덤불 분장 소품
					case(144){itemString = `id:18109 `; iCumRate +=4;} //0.421940928나오 분장 소품
					case(145){itemString = `id:18108 `; iCumRate +=4;} //0.421940928바위 분장 소품
					case(146){itemString = `id:40083 `; iCumRate +=4;} //0.421940928훅 커틀러스
					case(147){itemString = `id:40032 `; iCumRate +=4;} //0.421940928가고일 소드
					case(148){itemString = `id:18544 `; iCumRate +=4;} //0.421940928펠리칸 프로텍터
					case(149){itemString = `id:18547 `; iCumRate +=4;} //0.421940928파나쉬 헤드 프로텍터
					case(150){itemString = `id:18521 `; iCumRate +=4;} //0.421940928유러피안 컴프
					case(151){itemString = `id:18500 `; iCumRate +=4;} //0.421940928링 메일 헬름
					case(152){itemString = `id:18511 `; iCumRate +=4;} //0.421940928플루트 풀 헬름
					case(153){itemString = `id:18502 `; iCumRate +=4;} //0.421940928본 헬름
					case(154){itemString = `id:19007 `; iCumRate +=4;} //0.421940928야광 머플러 로브
					case(155){itemString = `id:19017 `; iCumRate +=4;} //0.421940928늑대 로브
					case(156){itemString = `id:19016 `; iCumRate +=4;} //0.421940928곰 로브
					case(157){itemString = `id:15112 `; iCumRate +=4;} //0.421940928셀리나 스쿨보이룩
					case(158){itemString = `id:18034 `; iCumRate +=4;} //0.421940928볼륨 베레모
					case(159){itemString = `id:18006 `; iCumRate +=4;} //0.421940928마법사모자
					case(160){itemString = `id:18113 `; iCumRate +=4;} //0.421940928뾰족귀 고양이 모자
					case(161){itemString = `id:18114 `; iCumRate +=4;} //0.421940928줄무늬 고양이 모자
					case(162){itemString = `id:18115 `; iCumRate +=4;} //0.421940928핀 고양이 모자
					case(163){itemString = `id:18097 `; iCumRate +=4;} //0.421940928세이렌 깃털 가면
					case(164){itemString = `id:18098 `; iCumRate +=4;} //0.421940928세이렌의 안경
					case(165){itemString = `id:18099 `; iCumRate +=4;} //0.421940928세이렌 작은 날개 가면
					case(166){itemString = `id:18100 `; iCumRate +=4;} //0.421940928세이렌 날개 가면
					case(167){itemString = `id:18101`; iCumRate +=4;} //0.421940928세이렌 박쥐 날개 가면
					case(168){itemString = `id:18102 `; iCumRate +=4;} //0.421940928세이렌의 가면
					case(169){itemString = `id:15055 `; iCumRate +=4;} //0.421940928세이렌 고양이 가면
					case(170){itemString = `id:18044 `; iCumRate +=4;} //0.421940928범죄용 복면
					case(171){itemString = `id:40071 `; iCumRate +=4;} //0.421940928'라' 음 빈 병
					case(172){itemString = `id:40072 `; iCumRate +=4;} //0.421940928'시' 음 빈 병
					case(173){itemString = `id:40073 `; iCumRate +=4;} //0.421940928'도' 음 빈 병
					case(174){itemString = `id:40074 `; iCumRate +=4;} //0.421940928'레' 음 빈 병
					case(175){itemString = `id:40075 `; iCumRate +=4;} //0.421940928'미' 음 빈 병
					case(176){itemString = `id:40076 `; iCumRate +=4;} //0.421940928'파' 음 빈 병
					case(177){itemString = `id:40077 `; iCumRate +=4;} //0.421940928'솔' 음 빈 병
					case(178){itemString = `id:16517 `; iCumRate +=4;} //0.421940928반대 장갑
					case(179){itemString = `id:16516 `; iCumRate +=4;} //0.421940928찬성 장갑
					case(180){itemString = `id:16515 `; iCumRate +=4;} //0.421940928보 장갑
					case(181){itemString = `id:16514 `; iCumRate +=4;} //0.421940928바위 장갑
					case(182){itemString = `id:16513 `; iCumRate +=4;} //0.421940928가위 장갑
					case(183){itemString = `id:40068 `; iCumRate +=4;} //0.421940928가위 모양 지시봉
					case(184){itemString = `id:40069 `; iCumRate +=4;} //0.421940928바위 모양 지시봉
					case(185){itemString = `id:40070 `; iCumRate +=4;} //0.421940928보 모양 지시봉
					case(186){itemString = `id:17015 `; iCumRate +=4;} //0.421940928Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=4;} //0.421940928레더 미니 원피스
					case(188){itemString = `id:15057 `; iCumRate +=4;} //0.421940928롱 레더 코트 (무광)
					case(189){itemString = `id:18040 `; iCumRate +=4;} //0.421940928코레스 꼭지 베레모
					case(190){itemString = `id:80000 `; iCumRate +=4;} //0.421940928나오의 검은 옷
					case(191){itemString = `id:80001 `; iCumRate +=4;} //0.421940928루아의 옷
					case(192){itemString = `id:80002 `; iCumRate +=4;} //0.421940928핑크색 코트
					case(193){itemString = `id:80003 `; iCumRate +=4;} //0.421940928검은색 코트
					case(194){itemString = `id:80004 `; iCumRate +=4;} //0.421940928나오의 노란색 봄 옷
					case(195){itemString = `id:80005 `; iCumRate +=4;} //0.421940928나오의 하얀색 봄 옷
					case(196){itemString = `id:80006 `; iCumRate +=4;} //0.421940928나오의 핑크색 봄 옷
					case(197){itemString = `id:18056 `; iCumRate +=4;} //0.421940928별 토끼 머리띠1
					case(198){itemString = `id:18057 `; iCumRate +=4;} //0.421940928별 토끼 머리띠2
					case(199){itemString = `id:18058 `; iCumRate +=4;} //0.421940928별 토끼 머리띠3
					case(200){itemString = `id:18059 `; iCumRate +=4;} //0.421940928별 토끼 머리띠4
					case(201){itemString = `id:18060 `; iCumRate +=4;} //0.421940928별 토끼 머리띠5
					case(202){itemString = `id:18061 `; iCumRate +=4;} //0.421940928털 토끼 머리띠1
					case(203){itemString = `id:18062 `; iCumRate +=4;} //0.421940928털 토끼 머리띠2
					case(204){itemString = `id:18063 `; iCumRate +=4;} //0.421940928털 토끼 머리띠3
					case(205){itemString = `id:18064 `; iCumRate +=4;} //0.421940928털 토끼 머리띠4
					case(206){itemString = `id:18065 `; iCumRate +=4;} //0.421940928털 토끼 머리띠5
					case(207){itemString = `id:18066 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠1
					case(208){itemString = `id:18067 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠2
					case(209){itemString = `id:18068 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠3
					case(210){itemString = `id:18069 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠4
					case(211){itemString = `id:18070 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠5
					case(212){itemString = `id:14036 `; iCumRate +=4;} //0.421940928티오즈 아머(남성용)
					case(213){itemString = `id:14037 `; iCumRate +=4;} //0.421940928티오즈 아머(여성용)
					case(214){itemString = `id:16531 `; iCumRate +=4;} //0.421940928티오즈 건틀렛
					case(215){itemString = `id:17523 `; iCumRate +=4;} //0.421940928티오즈 그리브
					case(216){itemString = `id:15132 `; iCumRate +=4;} //0.421940928내추럴 베스트 웨어
					case(217){itemString = `id:15070 `; iCumRate +=4;} //0.421940928스탠드칼라 슬리브리스
					case(218){itemString = `id:15230 `; iCumRate +=4;} //0.421940928가르텐 글렌 체크 스커트
					case(219){itemString = `id:19034 `; iCumRate +=4;} //0.421940928가르텐 클로스 오버코트
					case(220){itemString = `id:40033 `; iCumRate +=4;} //0.421940928클레이모어
					case(221){itemString = `id:40011 `; iCumRate +=4;} //0.421940928브로드 소드
					case(222){itemString = `id:40030 `; iCumRate +=4;} //0.421940928투 핸디드 소드
					case(223){itemString = `id:40012 `; iCumRate +=4;} //0.421940928바스타드 소드
					case(224){itemString = `id:40007 `; iCumRate +=4;} //0.421940928한손도끼
					case(225){itemString = `id:40014 `; iCumRate +=4;} //0.421940928콤포짓 보우
					case(226){itemString = `id:40078 `; iCumRate +=4;} //0.421940928비펜니스
					case(227){itemString = `id:40080 `; iCumRate +=4;} //0.421940928글라디우스
					case(228){itemString = `id:40006 `; iCumRate +=4;} //0.421940928단검
					case(229){itemString = `id:40031 `; iCumRate +=4;} //0.421940928석궁
					case(230){itemString = `id:40081 `; iCumRate +=4;} //0.421940928레더 롱 보우
					case(231){itemString = `id:40079 `; iCumRate +=4;} //0.421940928메이스
					case(232){itemString = `id:13043 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(남성용)
					case(233){itemString = `id:13044 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(여성용)
					case(234){itemString = `id:13045 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(남성용)
					case(235){itemString = `id:13046 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(여성용)
					case(236){itemString = `id:14019 `; iCumRate +=4;} //0.421940928그레이스 플레이트 아머
					case(237){itemString = `id:13031 `; iCumRate +=4;} //0.421940928스파이카 실버 플레이트 아머
					case(238){itemString = `id:13022 `; iCumRate +=4;} //0.421940928로즈 플레이트 아머 (P타입)
					case(239){itemString = `id:40039 `; iCumRate +=4;} //0.421940928아이스 원드
					case(240){itemString = `id:40090 `; iCumRate +=4;} //0.421940928힐링 원드
					case(241){itemString = `id:40040 `; iCumRate +=4;} //0.421940928파이어 원드
					case(242){itemString = `id:40038 `; iCumRate +=4;} //0.421940928라이트닝 원드
					case(243){itemString = `id:18542 `; iCumRate +=4;} //0.421940928빅 체인 풀 헬름
					case(244){itemString = `id:18506 `; iCumRate +=4;} //0.421940928윙 하프 헬름
					case(245){itemString = `id:14042 `; iCumRate +=4;} //0.421940928컬스틴 레더 아머
					case(246){itemString = `id:15155 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(남성용)
					case(247){itemString = `id:15156 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(여성용)
					case(248){itemString = `id:15151 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(249){itemString = `id:15152 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(250){itemString = `id:15153 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(남성용)
					case(251){itemString = `id:15154 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(여성용)
					case(252){itemString = `id:15157 `; iCumRate +=4;} //0.421940928위스 보위군 의복(남성용)
					case(253){itemString = `id:15158 `; iCumRate +=4;} //0.421940928위스 보위군 의복(여성용)
					case(254){itemString = `id:15115 `; iCumRate +=4;} //0.421940928재기드 미니 스커트
					case(255){itemString = `id:15059 `; iCumRate +=4;} //0.421940928터크스 탱크탑 반바지
					case(256){itemString = `id:15070 `; iCumRate +=4;} //0.421940928아이돌 리본 드레스
					case(257){itemString = `id:15074 `; iCumRate +=4;} //0.421940928루이스 성직자 코트
					case(258){itemString = `id:15061 `; iCumRate +=4;} //0.421940928물결무늬 옆트임 튜닉
					case(259){itemString = `id:18045 `; iCumRate +=4;} //0.421940928별장식 마법사 모자
					case(260){itemString = `id:18019 `; iCumRate +=4;} //0.421940928리리나 깃털모자
					case(261){itemString = `id:18020 `; iCumRate +=4;} //0.421940928몬거 깃털모자
					case(262){itemString = `id:18029 `; iCumRate +=4;} //0.421940928나무테 안경
					case(263){itemString = `id:18028 `; iCumRate +=4;} //0.421940928접이식 안경
					case(264){itemString = `id:13010 `; iCumRate +=4;} //0.421940928라운드 폴드론 체인메일
					case(265){itemString = `id:14025 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(남성용)
					case(266){itemString = `id:14026 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(여성용)
					case(267){itemString = `id:16028 `; iCumRate +=4;} //0.421940928카멜 스피리트 글러브
					case(268){itemString = `id:17064 `; iCumRate +=4;} //0.421940928카멜 스피리트 부츠
					case(269){itemString = `id:15131 `; iCumRate +=4;} //0.421940928핀 에이프런 스커트
					case(270){itemString = `id:2006 `; iCumRate +=4;} //0.421940928큰 금화 주머니
					case(271){itemString = `id:16534 `; iCumRate +=4;} //0.421940928컬스틴 레더 건틀렛
					case(272){itemString = `id:17524 `; iCumRate +=4;} //0.421940928컬스틴 레더 부츠
					case(273){itemString = `id:13047 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(남성용)
					case(274){itemString = `id:13048 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(여성용)
					case(275){itemString = `id:14013 `; iCumRate +=4;} //0.421940928로리카 세그먼타타에
					case(276){itemString = `id:14035 `; iCumRate +=4;} //0.421940928피르타 레더 아머
					case(277){itemString = `id:14038 `; iCumRate +=4;} //0.421940928피르타 레더 아머 B타입(여성용)
					case(278){itemString = `id:15028 `; iCumRate +=4;} //0.421940928코레스 씨프슈트
					case(279){itemString = `id:15042 `; iCumRate +=4;} //0.421940928롱넥 원피스
					case(280){itemString = `id:15052 `; iCumRate +=4;} //0.421940928터크스 투톤 튜닉
					case(281){itemString = `id:15053 `; iCumRate +=4;} //0.421940928플랫칼라 원피스
					case(282){itemString = `id:15128 `; iCumRate +=4;} //0.421940928투 톤 비조 드레스
					case(283){itemString = `id:15136 `; iCumRate +=4;} //0.421940928모험가 슈트
					case(284){itemString = `id:16008 `; iCumRate +=4;} //0.421940928코레스 씨프 글러브
					case(285){itemString = `id:16019 `; iCumRate +=4;} //0.421940928줄무늬 팔목 장갑
					case(286){itemString = `id:16040 `; iCumRate +=4;} //0.421940928콜린 빅센 글러브
					case(287){itemString = `id:16505 `; iCumRate +=4;} //0.421940928플루트 건틀렛
					case(288){itemString = `id:16520 `; iCumRate +=4;} //0.421940928롱 레더 글러브
					case(289){itemString = `id:17040 `; iCumRate +=4;} //0.421940928엘라 스트랩 부츠
					case(290){itemString = `id:17041 `; iCumRate +=4;} //0.421940928덩굴무늬 헌팅부츠
					case(291){itemString = `id:17045 `; iCumRate +=4;} //0.421940928브이 넥 라인 레더 부츠
					case(292){itemString = `id:17071 `; iCumRate +=4;} //0.421940928니하이 부츠
					case(293){itemString = `id:17087 `; iCumRate +=4;} //0.421940928콜린 빅센 부츠
					case(294){itemString = `id:17506 `; iCumRate +=4;} //0.421940928롱그리브 부츠
					case(295){itemString = `id:17522 `; iCumRate +=4;} //0.421940928피르타 레더 부츠
					case(296){itemString = `id:18008 `; iCumRate +=4;} //0.421940928스트라이프 캡
					case(297){itemString = `id:18038 `; iCumRate +=4;} //0.421940928깃털 배렛 모자
					case(298){itemString = `id:18047 `; iCumRate +=4;} //0.421940928코레스 펠트 모자
					case(299){itemString = `id:18513 `; iCumRate +=4;} //0.421940928스파이크 캡
					case(300){itemString = `id:18515 `; iCumRate +=4;} //0.421940928트윈 혼 캡
					case(301){itemString = `id:18525 `; iCumRate +=4;} //0.421940928워터드롭 캡
					case(302){itemString = `id:18543 `; iCumRate +=4;} //0.421940928슬릿 풀 헬름
					case(303){itemString = `id:19020 `; iCumRate +=4;} //0.421940928나타네 설산용 코트
					case(304){itemString = `id:19029 `; iCumRate +=4;} //0.421940928자이언트 베어 로브
					case(305){itemString = `id:40015 `; iCumRate +=4;} //0.421940928플루트 숏 소드
					case(306){itemString = `id:40081 `; iCumRate +=4;} //0.421940928롱 보우
					case(307){itemString = `id:46001 `; iCumRate +=4;} //0.421940928라운드 실드
					case(308){itemString = `id:46006 `; iCumRate +=4;} //0.421940928카이트 실드
					case(309){itemString = `id:40172 `; iCumRate +=4;} //0.421940928그레이트 소드
					case(310){itemString = `id:40174 `; iCumRate +=4;} //0.421940928모닝스타
					case(311){itemString = `id:40177 `; iCumRate +=4;} //0.421940928워리어 액스
					case(312){itemString = `id:40180 `; iCumRate +=4;} //0.421940928홉네일 너클
					case(313){itemString = `id:40041 `; iCumRate +=4;} //0.421940928타격용 원드
					case(314){itemString = `id:16523 `; iCumRate +=4;} //0.421940928그레이스 건틀렛
					case(315){itemString = `id:17515 `; iCumRate +=4;} //0.421940928그레이스 그리브
					case(316){itemString = `id:18545 `; iCumRate +=4;} //0.421940928그레이스 헬멧
					case(317){itemString = `id:46007 `; iCumRate +=4;} //0.421940928헤테로 카이트 실드
					case(318){itemString = `id:46008 `; iCumRate +=4;} //0.421940928라이트 헤테로 카이트 실드
					case(319){itemString = `id:51003 count:10`; iCumRate +=5;} //0.52742616생명력 50 포션
					case(320){itemString = `id:51004 count:10`; iCumRate +=5;} //0.52742616생명력 100 포션
					case(321){itemString = `id:51008 count:10`; iCumRate +=5;} //0.52742616마나 50 포션
					case(322){itemString = `id:51014 count:10`; iCumRate +=5;} //0.52742616스태미나 100 포션
					case(323){itemString = `id:51029 count:10`; iCumRate +=5;} //0.52742616생명력과 스태미나 100 포션
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(256);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13060 `; iCumRate +=1;} //0.390625 드래곤 스케일 아머(여성용)
					case(1){itemString = `id:13061 `; iCumRate +=1;} //0.390625 드래곤 스케일 아머 (남성용)
					case(2){itemString = `id:13062 `; iCumRate +=1;} //0.390625 드래곤 스케일 아머(자이언트 여성용)
					case(3){itemString = `id:13063 `; iCumRate +=1;} //0.390625 드래곤 스케일 아머(자이언트 남성용)
					case(4){itemString = `id:16543 `; iCumRate +=1;} //0.390625 드래곤 스케일 건틀렛
					case(5){itemString = `id:16544 `; iCumRate +=1;} //0.390625 드래곤 스케일 건틀렛(자이언트용)
					case(6){itemString = `id:17530 `; iCumRate +=1;} //0.390625 드래곤 스케일 그리브
					case(7){itemString = `id:18577 `; iCumRate +=1;} //0.390625 드래곤 스케일 헬름
					case(8){itemString = `id:15267 `; iCumRate +=2;} //0.78125테라 고딕 풀 드레스
					case(9){itemString = `id:15362 `; iCumRate +=2;} //0.78125테라 고딕 펑크 수트
					case(10){itemString = `id:19033 `; iCumRate +=2;} //0.78125상어 로브
					case(11){itemString = `id:15405 `; iCumRate +=2;} //0.78125엘리네드 패셔니스타 드레스
					case(12){itemString = `id:17039 `; iCumRate +=2;} //0.78125코레스 큐트 리본 슈즈
					case(13){itemString = `id:13050 `; iCumRate +=2;} //0.78125클라우스 나이트 아머
					case(14){itemString = `id:16551 `; iCumRate +=2;} //0.78125클라우스 나이트 건틀렛
					case(15){itemString = `id:17534 `; iCumRate +=2;} //0.78125클라우스 나이트 부츠
					case(16){itemString = `id:46010 `; iCumRate +=2;} //0.78125 @드래곤 실드
					case(17){itemString = `id:18549 `; iCumRate +=5;} //1.953125 @드래곤 펠릭스 헬름
					case(18){itemString = `id:15373 `; iCumRate +=5;} //1.953125시스루 칵테일 드레스
					case(19){itemString = `id:18218 `; iCumRate +=5;} //1.953125빈티지 애드미럴 모자(남성용)
					case(20){itemString = `id:18219`; iCumRate +=5;} //1.953125빈티지 애드미럴 모자(여성용)
					case(21){itemString = `id:17141`; iCumRate +=5;} //1.953125파이릿 우드워커 부츠
					case(22){itemString = `id:17154`; iCumRate +=5;} //1.953125프로퍼 스몰 코드 슈즈
					case(23){itemString = `id:18274`; iCumRate +=5;} //1.953125베이직 헤어 밴드
					case(24){itemString = `id:17153`; iCumRate +=5;} //1.953125비비드 캐주얼 슈즈
					case(25){itemString = `id:18038`; iCumRate +=5;} //1.953125깃털 배렛 모자
					case(26){itemString = `id:18567`; iCumRate +=5;} //1.953125박쥐 모자
					case(27){itemString = `id:15573 `; iCumRate +=10;} //3.90625클래식 커플 수트(여성용)
					case(28){itemString = `id:15184 `; iCumRate +=10;} //3.90625테라 에이션트 패턴 웨어
					case(29){itemString = `id:15066 `; iCumRate +=10;} //3.90625루이스 베스트 웨어
					case(30){itemString = `id:15099 `; iCumRate +=10;} //3.90625비앙카 드로워즈 레이어드 스커트
					case(31){itemString = `id:19038 `; iCumRate +=10;} //3.90625라바 캣 로브
					case(32){itemString = `id:19066 `; iCumRate +=10;} //3.90625할로윈 호박 로브
					case(33){itemString = `id:15113 `; iCumRate +=10;} //3.90625여성용 검사학교 교복 쇼트타입
					case(34){itemString = `id:17120 `; iCumRate +=10;} //3.90625보니타 플룸 앵클 부츠
					case(35){itemString = `id:16136 `; iCumRate +=10;} //3.90625아이언 피라미드 밴드
					case(36){itemString = `id:15374 `; iCumRate +=10;} //3.90625샤이니 고딕 프릴 드레스
					case(37){itemString = `id:15136 `; iCumRate +=10;} //3.90625고딕 레이스 스커트
					case(38){itemString = `id:14032 `; iCumRate +=10;} //3.90625스티치 롱 로브 아머
					case(39){itemString = `id:18199 `; iCumRate +=10;} //3.90625얇은테 안경
					case(40){itemString = `id:40095 `; iCumRate +=10;} //3.90625 @드래곤 블레이드
					case(41){itemString = `id:91129 count:3`; iCumRate +=10;} //3.90625전투 스킬 수련치 2배 포션
					case(42){itemString = `id:91130 count:3`; iCumRate +=10;} //3.90625마법 스킬 수련치 2배 포션
					case(43){itemString = `id:91131 count:3`; iCumRate +=10;} //3.90625연금술 스킬 수련치 2배 포션
					case(44){itemString = `id:91070 `; iCumRate +=10;} //3.90625물리 공격력 증가 포션 (30분)
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3071);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.032562683누아자 로브 (남성용)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.032562683누아자 로브 (여성용)
					case(2){itemString = `id:16554 `; iCumRate +=2;} //0.065125366누아자 건틀렛
					case(3){itemString = `id:17551 `; iCumRate +=2;} //0.065125366누아자 플레이트 부츠
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=5;} //0.162813416라운드 폴드론 체인메일
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=5;} //0.162813416로즈 플레이트 아머 (P타입)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=5;} //0.162813416스파이카 실버 플레이트 아머
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=5;} //0.162813416카멜 스피리트 아머(남성용)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=5;} //0.162813416카멜 스피리트 아머(여성용)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=5;} //0.162813416티오즈 아머(남성용)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=5;} //0.162813416티오즈 아머(여성용)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=5;} //0.162813416카멜 스피리트 글러브
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=5;} //0.162813416실버 티니 글러브
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=5;} //0.162813416발렌시아 크로스 라인 플레이트 건틀렛
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=5;} //0.162813416티오즈 건틀렛
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=5;} //0.162813416카멜 스피리트 부츠
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=5;} //0.162813416스파이카 실버 플레이트 부츠
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=5;} //0.162813416발렌시아 크로스 라인 플레이트 부츠
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=5;} //0.162813416티오즈 그리브
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=5;} //0.162813416드래곤 크레스트
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=10;} //0.325626832거미줄 주머니（레어컬러）
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=10;} //0.325626832가는 실뭉치 주머니（레어컬러）
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=10;} //0.325626832굵은 실뭉치 주머니 (레어컬러）
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=10;} //0.325626832저가형 가죽 주머니（레어컬러）
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=10;} //0.325626832일반 가죽 주머니 주머니（레어컬러）
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=10;} //0.325626832고급 가죽 주머니（레어컬러）
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=10;} //0.325626832최고급 가죽 주머니（레어컬러）
					case(27){itemString = `id:80001 `; iCumRate +=20;} //0.651253663루아의 옷
					case(28){itemString = `id:80002 `; iCumRate +=20;} //0.651253663핑크색 코트
					case(29){itemString = `id:80003 `; iCumRate +=20;} //0.651253663검은색 코트
					case(30){itemString = `id:80004 `; iCumRate +=20;} //0.651253663나오의 노란색 봄 옷
					case(31){itemString = `id:80005 `; iCumRate +=20;} //0.651253663나오의 하얀색 봄 옷
					case(32){itemString = `id:80006 `; iCumRate +=20;} //0.651253663나오의 핑크색 봄 옷
					case(33){itemString = `id:51004 count:10`; iCumRate +=20;} //0.651253663생명력 100 포션
					case(34){itemString = `id:51008 count:10`; iCumRate +=20;} //0.651253663마나 50 포션
					case(35){itemString = `id:51022 count:10`; iCumRate +=20;} //0.651253663생명력과 마나 30 포션
					case(36){itemString = `id:51023 count:10`; iCumRate +=20;} //0.651253663생명력과 마나 50 포션
					case(37){itemString = `id:51027 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 30 포션
					case(38){itemString = `id:51028 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 50 포션
					case(39){itemString = `id:51029 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 100 포션
					case(40){itemString = `id:60036 count:5`; iCumRate +=20;} //0.651253663옐로우 베이비 포션
					case(41){itemString = `id:60037 count:5`; iCumRate +=20;} //0.651253663블랙 유스 포션
					case(42){itemString = `id:60038 count:5`; iCumRate +=20;} //0.651253663레드 포션
					case(43){itemString = `id:60040 count:5`; iCumRate +=20;} //0.651253663그린 베이비 포션
					case(44){itemString = `id:62004 count:5`; iCumRate +=20;} //0.651253663마법가루
					case(45){itemString = `id:63000 count:10`; iCumRate +=20;} //0.651253663피닉스의 깃털
					case(46){itemString = `id:2041`; iCumRate +=20;} //0.651253663거미줄 주머니
					case(47){itemString = `id:2042`; iCumRate +=20;} //0.651253663가는 실뭉치 주머니
					case(48){itemString = `id:2043`; iCumRate +=20;} //0.651253663굵은 실뭉치 주머니
					case(49){itemString = `id:2044`; iCumRate +=20;} //0.651253663저가형 가죽 주머니
					case(50){itemString = `id:2045`; iCumRate +=20;} //0.651253663일반 가죽 주머니 주머니
					case(51){itemString = `id:2046`; iCumRate +=20;} //0.651253663고급 가죽 주머니
					case(52){itemString = `id:2028`; iCumRate +=20;} //0.651253663양털 주머니
					case(53){itemString = `id:51009 count:10`; iCumRate +=20;} //0.651253663마나 100 포션
					case(54){itemString = `id:2006 `; iCumRate +=30;} //0.976880495큰 금화 주머니
					case(55){itemString = `id:14042 `; iCumRate +=30;} //0.976880495컬스틴 레더 아머
					case(56){itemString = `id:16534 `; iCumRate +=30;} //0.976880495컬스틴 레더 건틀렛
					case(57){itemString = `id:17524 `; iCumRate +=30;} //0.976880495컬스틴 레더 부츠
					case(58){itemString = `id:13047 `; iCumRate +=30;} //0.976880495키리누스진 하프 플레이트 아머(남성용)
					case(59){itemString = `id:13048 `; iCumRate +=30;} //0.976880495키리누스진 하프 플레이트 아머(여성용)
					case(60){itemString = `id:14005 `; iCumRate +=30;} //0.976880495드란도스 레더메일
					case(61){itemString = `id:14011 `; iCumRate +=30;} //0.976880495드란도스 레더메일
					case(62){itemString = `id:14013 `; iCumRate +=30;} //0.976880495로리카 세그먼타타에
					case(63){itemString = `id:14019 `; iCumRate +=30;} //0.976880495그레이스 플레이트 아머
					case(64){itemString = `id:14035 `; iCumRate +=30;} //0.976880495피르타 레더 아머
					case(65){itemString = `id:14038 `; iCumRate +=30;} //0.976880495피르타 레더 아머 B타입(여성용)
					case(66){itemString = `id:15014 `; iCumRate +=30;} //0.976880495파발꾼의 옷
					case(67){itemString = `id:15028 `; iCumRate +=30;} //0.976880495코레스 씨프슈트
					case(68){itemString = `id:15042 `; iCumRate +=30;} //0.976880495롱넥 원피스
					case(69){itemString = `id:15052 `; iCumRate +=30;} //0.976880495터크스 투톤 튜닉
					case(70){itemString = `id:15053 `; iCumRate +=30;} //0.976880495플랫칼라 원피스
					case(71){itemString = `id:15055 `; iCumRate +=30;} //0.976880495레더 미니 원피스
					case(72){itemString = `id:15057 `; iCumRate +=30;} //0.976880495롱 레더 코트 (무광)
					case(73){itemString = `id:15070 `; iCumRate +=30;} //0.976880495스탠드칼라 슬리브리스
					case(74){itemString = `id:15128 `; iCumRate +=30;} //0.976880495투 톤 비조 드레스
					case(75){itemString = `id:15135 `; iCumRate +=30;} //0.976880495시크 수트
					case(76){itemString = `id:15136 `; iCumRate +=30;} //0.976880495모험가 슈트
					case(77){itemString = `id:15153 `; iCumRate +=30;} //0.976880495산드라 스나이퍼 수트(남성용)
					case(78){itemString = `id:15154 `; iCumRate +=30;} //0.976880495산드라 스나이퍼 수트(여성용)
					case(79){itemString = `id:15230 `; iCumRate +=30;} //0.976880495가르텐 글렌 체크 스커트
					case(80){itemString = `id:16008 `; iCumRate +=30;} //0.976880495코레스 씨프 글러브
					case(81){itemString = `id:16019 `; iCumRate +=30;} //0.976880495줄무늬 팔목 장갑
					case(82){itemString = `id:16028 `; iCumRate +=30;} //0.976880495카멜 스피리트 글러브
					case(83){itemString = `id:16040 `; iCumRate +=30;} //0.976880495콜린 빅센 글러브
					case(84){itemString = `id:16505 `; iCumRate +=30;} //0.976880495플루트 건틀렛
					case(85){itemString = `id:16520 `; iCumRate +=30;} //0.976880495롱 레더 글러브
					case(86){itemString = `id:17040 `; iCumRate +=30;} //0.976880495엘라 스트랩 부츠
					case(87){itemString = `id:17041 `; iCumRate +=30;} //0.976880495덩굴무늬 헌팅부츠
					case(88){itemString = `id:17045 `; iCumRate +=30;} //0.976880495브이 넥 라인 레더 부츠
					case(89){itemString = `id:17071 `; iCumRate +=30;} //0.976880495니하이 부츠
					case(90){itemString = `id:17087 `; iCumRate +=30;} //0.976880495콜린 빅센 부츠
					case(91){itemString = `id:17506 `; iCumRate +=30;} //0.976880495롱그리브 부츠
					case(92){itemString = `id:17522 `; iCumRate +=30;} //0.976880495피르타 레더 부츠
					case(93){itemString = `id:18008 `; iCumRate +=30;} //0.976880495스트라이프 캡
					case(94){itemString = `id:18023 `; iCumRate +=30;} //0.976880495몬거 씨프 캡
					case(95){itemString = `id:18028 `; iCumRate +=30;} //0.976880495접이식 안경
					case(96){itemString = `id:18029 `; iCumRate +=30;} //0.976880495나무테 안경
					case(97){itemString = `id:18038 `; iCumRate +=30;} //0.976880495깃털 배렛 모자
					case(98){itemString = `id:18040 `; iCumRate +=30;} //0.976880495코레스 꼭지 베레모
					case(99){itemString = `id:18047 `; iCumRate +=30;} //0.976880495코레스 펠트 모자
					case(100){itemString = `id:18502 `; iCumRate +=30;} //0.976880495본 헬름
					case(101){itemString = `id:18506 `; iCumRate +=30;} //0.976880495윙 하프 헬름
					case(102){itemString = `id:18511 `; iCumRate +=30;} //0.976880495플루트 풀 헬름
					case(103){itemString = `id:18513 `; iCumRate +=30;} //0.976880495스파이크 캡
					case(104){itemString = `id:18515 `; iCumRate +=30;} //0.976880495트윈 혼 캡
					case(105){itemString = `id:18525 `; iCumRate +=30;} //0.976880495워터드롭 캡
					case(106){itemString = `id:18542 `; iCumRate +=30;} //0.976880495빅 체인 풀 헬름
					case(107){itemString = `id:18543 `; iCumRate +=30;} //0.976880495슬릿 풀 헬름
					case(108){itemString = `id:19005 `; iCumRate +=30;} //0.976880495머플러 로브
					case(109){itemString = `id:19007 `; iCumRate +=30;} //0.976880495야광 머플러 로브
					case(110){itemString = `id:19020 `; iCumRate +=30;} //0.976880495나타네 설산용 코트
					case(111){itemString = `id:19029 `; iCumRate +=30;} //0.976880495자이언트 베어 로브
					case(112){itemString = `id:19034 `; iCumRate +=30;} //0.976880495가르텐 클로스 오버코트
					case(113){itemString = `id:40014 `; iCumRate +=30;} //0.976880495콤포짓 보우
					case(114){itemString = `id:40015 `; iCumRate +=30;} //0.976880495플루트 숏 소드
					case(115){itemString = `id:40030 `; iCumRate +=30;} //0.976880495투 핸디드 소드
					case(116){itemString = `id:40031 `; iCumRate +=30;} //0.976880495석궁
					case(117){itemString = `id:40038 `; iCumRate +=30;} //0.976880495라이트닝 원드
					case(118){itemString = `id:40039 `; iCumRate +=30;} //0.976880495아이스 원드
					case(119){itemString = `id:40040 `; iCumRate +=30;} //0.976880495파이어 원드
					case(120){itemString = `id:40041 `; iCumRate +=30;} //0.976880495타격용 원드
					case(121){itemString = `id:40079 `; iCumRate +=30;} //0.976880495메이스
					case(122){itemString = `id:40081 `; iCumRate +=30;} //0.976880495레더 롱 보우
					case(123){itemString = `id:40090 `; iCumRate +=30;} //0.976880495힐링 원드
					case(124){itemString = `id:46001  `; iCumRate +=30;} //0.976880495라운드 실드
					case(125){itemString = `id:46006 `; iCumRate +=30;} //0.976880495카이트 실드
					case(126){itemString = `id:40172 `; iCumRate +=30;} //0.976880495그레이트 소드
					case(127){itemString = `id:40174 `; iCumRate +=30;} //0.976880495모닝스타
					case(128){itemString = `id:40177 `; iCumRate +=30;} //0.976880495워리어 액스
					case(129){itemString = `id:40180 `; iCumRate +=30;} //0.976880495홉네일 너클
					case(130){itemString = `id:85056`; iCumRate +=30;} //0.976880495최고급 새도우 크리스탈
					case(131){itemString = `id:85055`; iCumRate +=30;} //0.976880495고급 새도우 크리스탈
					case(132){itemString = `id:85054`; iCumRate +=35;} //1.139693911새도우 크리스탈
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3071);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.032562683누아자 로브 (남성용)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.032562683누아자 로브 (여성용)
					case(2){itemString = `id:16554 `; iCumRate +=2;} //0.065125366누아자 건틀렛
					case(3){itemString = `id:17551 `; iCumRate +=2;} //0.065125366누아자 플레이트 부츠
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=5;} //0.162813416라운드 폴드론 체인메일
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=5;} //0.162813416로즈 플레이트 아머 (P타입)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=5;} //0.162813416스파이카 실버 플레이트 아머
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=5;} //0.162813416카멜 스피리트 아머(남성용)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=5;} //0.162813416카멜 스피리트 아머(여성용)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=5;} //0.162813416티오즈 아머(남성용)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=5;} //0.162813416티오즈 아머(여성용)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=5;} //0.162813416카멜 스피리트 글러브
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=5;} //0.162813416실버 티니 글러브
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=5;} //0.162813416발렌시아 크로스 라인 플레이트 건틀렛
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=5;} //0.162813416티오즈 건틀렛
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=5;} //0.162813416카멜 스피리트 부츠
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=5;} //0.162813416스파이카 실버 플레이트 부츠
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=5;} //0.162813416발렌시아 크로스 라인 플레이트 부츠
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=5;} //0.162813416티오즈 그리브
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=5;} //0.162813416드래곤 크레스트
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=10;} //0.325626832거미줄 주머니（레어컬러）
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=10;} //0.325626832가는 실뭉치 주머니（레어컬러）
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=10;} //0.325626832굵은 실뭉치 주머니 (레어컬러）
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=10;} //0.325626832저가형 가죽 주머니（레어컬러）
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=10;} //0.325626832일반 가죽 주머니 주머니（레어컬러）
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=10;} //0.325626832고급 가죽 주머니（레어컬러）
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=10;} //0.325626832최고급 가죽 주머니（레어컬러）
					case(27){itemString = `id:80001 `; iCumRate +=20;} //0.651253663루아의 옷
					case(28){itemString = `id:80002 `; iCumRate +=20;} //0.651253663핑크색 코트
					case(29){itemString = `id:80003 `; iCumRate +=20;} //0.651253663검은색 코트
					case(30){itemString = `id:80004 `; iCumRate +=20;} //0.651253663나오의 노란색 봄 옷
					case(31){itemString = `id:80005 `; iCumRate +=20;} //0.651253663나오의 하얀색 봄 옷
					case(32){itemString = `id:80006 `; iCumRate +=20;} //0.651253663나오의 핑크색 봄 옷
					case(33){itemString = `id:51004 count:10`; iCumRate +=20;} //0.651253663생명력 100 포션
					case(34){itemString = `id:51008 count:10`; iCumRate +=20;} //0.651253663마나 50 포션
					case(35){itemString = `id:51022 count:10`; iCumRate +=20;} //0.651253663생명력과 마나 30 포션
					case(36){itemString = `id:51023 count:10`; iCumRate +=20;} //0.651253663생명력과 마나 50 포션
					case(37){itemString = `id:51027 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 30 포션
					case(38){itemString = `id:51028 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 50 포션
					case(39){itemString = `id:51029 count:10`; iCumRate +=20;} //0.651253663생명력과 스태미나 100 포션
					case(40){itemString = `id:60036 count:5`; iCumRate +=20;} //0.651253663옐로우 베이비 포션
					case(41){itemString = `id:60037 count:5`; iCumRate +=20;} //0.651253663블랙 유스 포션
					case(42){itemString = `id:60038 count:5`; iCumRate +=20;} //0.651253663레드 포션
					case(43){itemString = `id:60040 count:5`; iCumRate +=20;} //0.651253663그린 베이비 포션
					case(44){itemString = `id:62004 count:5`; iCumRate +=20;} //0.651253663마법가루
					case(45){itemString = `id:63000 count:10`; iCumRate +=20;} //0.651253663피닉스의 깃털
					case(46){itemString = `id:2041`; iCumRate +=20;} //0.651253663거미줄 주머니
					case(47){itemString = `id:2042`; iCumRate +=20;} //0.651253663가는 실뭉치 주머니
					case(48){itemString = `id:2043`; iCumRate +=20;} //0.651253663굵은 실뭉치 주머니
					case(49){itemString = `id:2044`; iCumRate +=20;} //0.651253663저가형 가죽 주머니
					case(50){itemString = `id:2045`; iCumRate +=20;} //0.651253663일반 가죽 주머니 주머니
					case(51){itemString = `id:2046`; iCumRate +=20;} //0.651253663고급 가죽 주머니
					case(52){itemString = `id:2028`; iCumRate +=20;} //0.651253663양털 주머니
					case(53){itemString = `id:51009 count:10`; iCumRate +=20;} //0.651253663마나 100 포션
					case(54){itemString = `id:2006 `; iCumRate +=30;} //0.976880495큰 금화 주머니
					case(55){itemString = `id:14042 `; iCumRate +=30;} //0.976880495컬스틴 레더 아머
					case(56){itemString = `id:16534 `; iCumRate +=30;} //0.976880495컬스틴 레더 건틀렛
					case(57){itemString = `id:17524 `; iCumRate +=30;} //0.976880495컬스틴 레더 부츠
					case(58){itemString = `id:13047 `; iCumRate +=30;} //0.976880495키리누스진 하프 플레이트 아머(남성용)
					case(59){itemString = `id:13048 `; iCumRate +=30;} //0.976880495키리누스진 하프 플레이트 아머(여성용)
					case(60){itemString = `id:14005 `; iCumRate +=30;} //0.976880495드란도스 레더메일
					case(61){itemString = `id:14011 `; iCumRate +=30;} //0.976880495드란도스 레더메일
					case(62){itemString = `id:14013 `; iCumRate +=30;} //0.976880495로리카 세그먼타타에
					case(63){itemString = `id:14019 `; iCumRate +=30;} //0.976880495그레이스 플레이트 아머
					case(64){itemString = `id:14035 `; iCumRate +=30;} //0.976880495피르타 레더 아머
					case(65){itemString = `id:14038 `; iCumRate +=30;} //0.976880495피르타 레더 아머 B타입(여성용)
					case(66){itemString = `id:15014 `; iCumRate +=30;} //0.976880495파발꾼의 옷
					case(67){itemString = `id:15028 `; iCumRate +=30;} //0.976880495코레스 씨프슈트
					case(68){itemString = `id:15042 `; iCumRate +=30;} //0.976880495롱넥 원피스
					case(69){itemString = `id:15052 `; iCumRate +=30;} //0.976880495터크스 투톤 튜닉
					case(70){itemString = `id:15053 `; iCumRate +=30;} //0.976880495플랫칼라 원피스
					case(71){itemString = `id:15055 `; iCumRate +=30;} //0.976880495레더 미니 원피스
					case(72){itemString = `id:15057 `; iCumRate +=30;} //0.976880495롱 레더 코트 (무광)
					case(73){itemString = `id:15070 `; iCumRate +=30;} //0.976880495스탠드칼라 슬리브리스
					case(74){itemString = `id:15128 `; iCumRate +=30;} //0.976880495투 톤 비조 드레스
					case(75){itemString = `id:15135 `; iCumRate +=30;} //0.976880495시크 수트
					case(76){itemString = `id:15136 `; iCumRate +=30;} //0.976880495모험가 슈트
					case(77){itemString = `id:15153 `; iCumRate +=30;} //0.976880495산드라 스나이퍼 수트(남성용)
					case(78){itemString = `id:15154 `; iCumRate +=30;} //0.976880495산드라 스나이퍼 수트(여성용)
					case(79){itemString = `id:15230 `; iCumRate +=30;} //0.976880495가르텐 글렌 체크 스커트
					case(80){itemString = `id:16008 `; iCumRate +=30;} //0.976880495코레스 씨프 글러브
					case(81){itemString = `id:16019 `; iCumRate +=30;} //0.976880495줄무늬 팔목 장갑
					case(82){itemString = `id:16028 `; iCumRate +=30;} //0.976880495카멜 스피리트 글러브
					case(83){itemString = `id:16040 `; iCumRate +=30;} //0.976880495콜린 빅센 글러브
					case(84){itemString = `id:16505 `; iCumRate +=30;} //0.976880495플루트 건틀렛
					case(85){itemString = `id:16520 `; iCumRate +=30;} //0.976880495롱 레더 글러브
					case(86){itemString = `id:17040 `; iCumRate +=30;} //0.976880495엘라 스트랩 부츠
					case(87){itemString = `id:17041 `; iCumRate +=30;} //0.976880495덩굴무늬 헌팅부츠
					case(88){itemString = `id:17045 `; iCumRate +=30;} //0.976880495브이 넥 라인 레더 부츠
					case(89){itemString = `id:17071 `; iCumRate +=30;} //0.976880495니하이 부츠
					case(90){itemString = `id:17087 `; iCumRate +=30;} //0.976880495콜린 빅센 부츠
					case(91){itemString = `id:17506 `; iCumRate +=30;} //0.976880495롱그리브 부츠
					case(92){itemString = `id:17522 `; iCumRate +=30;} //0.976880495피르타 레더 부츠
					case(93){itemString = `id:18008 `; iCumRate +=30;} //0.976880495스트라이프 캡
					case(94){itemString = `id:18023 `; iCumRate +=30;} //0.976880495몬거 씨프 캡
					case(95){itemString = `id:18028 `; iCumRate +=30;} //0.976880495접이식 안경
					case(96){itemString = `id:18029 `; iCumRate +=30;} //0.976880495나무테 안경
					case(97){itemString = `id:18038 `; iCumRate +=30;} //0.976880495깃털 배렛 모자
					case(98){itemString = `id:18040 `; iCumRate +=30;} //0.976880495코레스 꼭지 베레모
					case(99){itemString = `id:18047 `; iCumRate +=30;} //0.976880495코레스 펠트 모자
					case(100){itemString = `id:18502 `; iCumRate +=30;} //0.976880495본 헬름
					case(101){itemString = `id:18506 `; iCumRate +=30;} //0.976880495윙 하프 헬름
					case(102){itemString = `id:18511 `; iCumRate +=30;} //0.976880495플루트 풀 헬름
					case(103){itemString = `id:18513 `; iCumRate +=30;} //0.976880495스파이크 캡
					case(104){itemString = `id:18515 `; iCumRate +=30;} //0.976880495트윈 혼 캡
					case(105){itemString = `id:18525 `; iCumRate +=30;} //0.976880495워터드롭 캡
					case(106){itemString = `id:18542 `; iCumRate +=30;} //0.976880495빅 체인 풀 헬름
					case(107){itemString = `id:18543 `; iCumRate +=30;} //0.976880495슬릿 풀 헬름
					case(108){itemString = `id:19005 `; iCumRate +=30;} //0.976880495머플러 로브
					case(109){itemString = `id:19007 `; iCumRate +=30;} //0.976880495야광 머플러 로브
					case(110){itemString = `id:19020 `; iCumRate +=30;} //0.976880495나타네 설산용 코트
					case(111){itemString = `id:19029 `; iCumRate +=30;} //0.976880495자이언트 베어 로브
					case(112){itemString = `id:19034 `; iCumRate +=30;} //0.976880495가르텐 클로스 오버코트
					case(113){itemString = `id:40014 `; iCumRate +=30;} //0.976880495콤포짓 보우
					case(114){itemString = `id:40015 `; iCumRate +=30;} //0.976880495플루트 숏 소드
					case(115){itemString = `id:40030 `; iCumRate +=30;} //0.976880495투 핸디드 소드
					case(116){itemString = `id:40031 `; iCumRate +=30;} //0.976880495석궁
					case(117){itemString = `id:40038 `; iCumRate +=30;} //0.976880495라이트닝 원드
					case(118){itemString = `id:40039 `; iCumRate +=30;} //0.976880495아이스 원드
					case(119){itemString = `id:40040 `; iCumRate +=30;} //0.976880495파이어 원드
					case(120){itemString = `id:40041 `; iCumRate +=30;} //0.976880495타격용 원드
					case(121){itemString = `id:40079 `; iCumRate +=30;} //0.976880495메이스
					case(122){itemString = `id:40081 `; iCumRate +=30;} //0.976880495레더 롱 보우
					case(123){itemString = `id:40090 `; iCumRate +=30;} //0.976880495힐링 원드
					case(124){itemString = `id:46001  `; iCumRate +=30;} //0.976880495라운드 실드
					case(125){itemString = `id:46006 `; iCumRate +=30;} //0.976880495카이트 실드
					case(126){itemString = `id:40172 `; iCumRate +=30;} //0.976880495그레이트 소드
					case(127){itemString = `id:40174 `; iCumRate +=30;} //0.976880495모닝스타
					case(128){itemString = `id:40177 `; iCumRate +=30;} //0.976880495워리어 액스
					case(129){itemString = `id:40180 `; iCumRate +=30;} //0.976880495홉네일 너클
					case(130){itemString = `id:85056 count:3`; iCumRate +=30;} //0.976880495최고급 새도우 크리스탈
					case(131){itemString = `id:85055 count:3`; iCumRate +=30;} //0.976880495고급 새도우 크리스탈
					case(132){itemString = `id:85054 count:3`; iCumRate +=35;} //1.139693911새도우 크리스탈
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
	}

	return ``;
}




////////////////////////////////////////////////////////////////////////////////
server string TreasureFakeEffectItem(
	character player,
	int itemClassId)
// : 유저들에게 가짜로 보여주는 이펙트 아이템 목록
////////////////////////////////////////////////////////////////////////////////
{
	int itemID = itemClassId;

	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(77);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13060`; iCumRate +=1;} //1.2987% 드래곤 스케일 아머(여성용)
					case(1){itemString = `id:13061`; iCumRate +=1;} //1.2987% 드래곤 스케일 아머 (남성용)
					case(2){itemString = `id:13062`; iCumRate +=1;} //1.2987% 드래곤 스케일 아머(자이언트 여성용)
					case(3){itemString = `id:13063`; iCumRate +=1;} //1.2987% 드래곤 스케일 아머(자이언트 남성용)
					case(4){itemString = `id:16543`; iCumRate +=1;} //1.2987% 드래곤 스케일 건틀렛
					case(5){itemString = `id:16544`; iCumRate +=1;} //1.2987% 드래곤 스케일 건틀렛(자이언트용)
					case(6){itemString = `id:17530`; iCumRate +=1;} //1.2987% 드래곤 스케일 그리브
					case(7){itemString = `id:18577`; iCumRate +=1;} //1.2987% 드래곤 스케일 헬름
					case(8){itemString = `id:14011`; iCumRate +=1;} //1.2987% 드란도스 레더메일 (남성용)
					case(9){itemString = `id:14005`; iCumRate +=1;} //1.2987% 드란도스 레더메일 (여성용)
					case(10){itemString = `id:15352`; iCumRate +=1;} //1.2987% 천룡지의 (남성용)
					case(11){itemString = `id:15353`; iCumRate +=1;} //1.2987% 천룡지의 (여성용)
					case(12){itemString = `id:17139`; iCumRate +=1;} //1.2987% 천룡지화
					case(13){itemString = `id:14040`; iCumRate +=1;} //1.2987%@차이나 드래곤 아머엘프
					case(14){itemString = `id:14041`; iCumRate +=1;} //1.2987%@차이나 드래곤 아머자이언트
					case(15){itemString = `id:14039`; iCumRate +=1;} //1.2987%@차이나 드래곤 아머인간
					case(16){itemString = `id:18553`; iCumRate +=1;} //1.2987%@차이나 드래곤 헬름(엘프전용)엘프
					case(17){itemString = `id:18552`; iCumRate +=1;} //1.2987%@차이나 드래곤 헬름인간, 자이언트
					case(18){itemString = `id:17095`; iCumRate +=1;} //1.2987%@차이나 드래곤 부츠전종족
					case(19){itemString = `id:16533`; iCumRate +=1;} //1.2987%@차이나 드래곤 건틀렛엘프
					case(20){itemString = `id:16535`; iCumRate +=1;} //1.2987%@차이나 드래곤 건틀렛자이언트
					case(21){itemString = `id:16532`; iCumRate +=1;} //1.2987%@차이나 드래곤 건틀렛인간
					case(22){itemString = `id:15267`; iCumRate +=2;} //2.5974%테라 고딕 풀 드레스
					case(23){itemString = `id:15362`; iCumRate +=2;} //2.5974%테라 고딕 펑크 수트
					case(24){itemString = `id:15405`; iCumRate +=2;} //2.5974%엘리네드 패셔니스타 드레스
					case(25){itemString = `id:17039`; iCumRate +=2;} //2.5974%코레스 큐트 리본 슈즈
					case(26){itemString = `id:13050`; iCumRate +=2;} //2.5974%클라우스 나이트 아머
					case(27){itemString = `id:16551`; iCumRate +=2;} //2.5974%클라우스 나이트 건틀렛
					case(28){itemString = `id:17534`; iCumRate +=2;} //2.5974%클라우스 나이트 부츠
					case(29){itemString = `id:46010`; iCumRate +=2;} //2.5974% @드래곤 실드
					case(30){itemString = `id:15373`; iCumRate +=2;} //2.5974%시스루 칵테일 드레스
					case(31){itemString = `id:18218`; iCumRate +=2;} //2.5974%빈티지 애드미럴 모자(남성용)
					case(32){itemString = `id:18219`; iCumRate +=2;} //2.5974%빈티지 애드미럴 모자(여성용)
					case(33){itemString = `id:17141`; iCumRate +=2;} //2.5974%파이릿 우드워커 부츠
					case(34){itemString = `id:17154`; iCumRate +=2;} //2.5974%프로퍼 스몰 코드 슈즈
					case(35){itemString = `id:18038`; iCumRate +=2;} //2.5974%깃털 배렛 모자
					case(36){itemString = `id:15184`; iCumRate +=3;} //3.8961%테라 에이션트 패턴 웨어
					case(37){itemString = `id:15066`; iCumRate +=3;} //3.8961%루이스 베스트 웨어
					case(38){itemString = `id:15099`; iCumRate +=3;} //3.8961%비앙카 드로워즈 레이어드 스커트
					case(39){itemString = `id:19038`; iCumRate +=3;} //3.8961%라바 캣 로브
					case(40){itemString = `id:17120`; iCumRate +=3;} //3.8961%보니타 플룸 앵클 부츠
					case(41){itemString = `id:16136`; iCumRate +=3;} //3.8961%아이언 피라미드 밴드
					case(42){itemString = `id:15374`; iCumRate +=3;} //3.8961%샤이니 고딕 프릴 드레스
					case(43){itemString = `id:15136`; iCumRate +=3;} //3.8961%고딕 레이스 스커트
					case(44){itemString = `id:14032`; iCumRate +=3;} //3.8961%스티치 롱 로브 아머
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(948);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.105485232코레스 미스터리 로스웰 (UFO)
					case(1){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파나 케아 힐링 원드
					case(2){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 아이스 원드
					case(3){itemString = `id:40250 `; iCumRate +=1;} //0.105485232퀘르쿠스 파이어 원드
					case(4){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 라이트닝 원드
					case(5){itemString = `id:40250 `; iCumRate +=1;} //0.105485232칼피누스 힐링 원드
					case(6){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파르 아이스 원드
					case(7){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 파이어 원드
					case(8){itemString = `id:40250 `; iCumRate +=1;} //0.105485232이미션 라이트닝 원드
					case(9){itemString = `id:18569 `; iCumRate +=1;} //0.105485232devCAT 모자
					case(10){itemString = `id:40171 `; iCumRate +=1;} //0.105485232마사무네
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.105485232냄비(심해의)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.105485232남성용 마법사 정장
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.105485232여성용 마법사 정장
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.105485232아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.105485232볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.105485232그레이스 숄 드레스(여성용)
					case(33){itemString = `id:40250 `; iCumRate +=1;} //0.105485232부채
					case(34){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유카타 남
					case(35){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유타카 여
					case(36){itemString = `id:16046 `; iCumRate +=1;} //0.105485232고양이 손 장갑
					case(37){itemString = `id:18187 `; iCumRate +=1;} //0.105485232커다란 리본
					case(38){itemString = `id:18188 `; iCumRate +=1;} //0.105485232안대
					case(39){itemString = `id:18189 `; iCumRate +=1;} //0.105485232카우보이 모자
					case(40){itemString = `id:15252 `; iCumRate +=1;} //0.105485232집사 의상
					case(41){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(42){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(43){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232글라디우스
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232메이스
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232클레이모어
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232힐링 원드
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232글라디우스
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232아이스 원드
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232파이어 원드
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232타격용 원드
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232비펜니스
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232메이스
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232석궁
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232롱 보우
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(64){itemString = `id:15267 `; iCumRate +=1;} //0.105485232테라 고딕 풀 드레스
					case(65){itemString = `id:15268 `; iCumRate +=1;} //0.105485232테라 고딕 펑크 수트
					case(66){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(67){itemString = `id:15217 `; iCumRate +=1;} //0.105485232에이프런 원피스
					case(68){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(69){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(70){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(71){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(72){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(73){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(74){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(75){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232클레이모어
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232힐링 원드
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232아이스 원드
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232파이어 원드
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232타격용 원드
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.105485232비펜니스
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232석궁
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232롱 보우
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.105485232가디언 보우
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(88){itemString = `id:14039 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(인간)
					case(89){itemString = `id:14040 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(엘프)
					case(90){itemString = `id:14041 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(자이언트)
					case(91){itemString = `id:16532 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(인간/자이언트)
					case(92){itemString = `id:16535 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(자이언트)
					case(93){itemString = `id:16533 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(엘프)
					case(94){itemString = `id:17095 `; iCumRate +=1;} //0.105485232차이나 드래곤 부츠
					case(95){itemString = `id:18552 `; iCumRate +=1;} //0.105485232차이나 드래곤 헬름
					case(96){itemString = `id:40170 `; iCumRate +=1;} //0.105485232일본식 양손검
					case(97){itemString = `id:51007 count:10`; iCumRate +=2;} //0.210970464마나 30 포션
					case(98){itemString = `id:51013 count:10`; iCumRate +=2;} //0.210970464스태미나 50 포션
					case(99){itemString = `id:51001 count:10`; iCumRate +=2;} //0.210970464생명력 10 포션
					case(100){itemString = `id:51002 count:10`; iCumRate +=2;} //0.210970464생명력 30 포션
					case(101){itemString = `id:51022 count:10`; iCumRate +=2;} //0.210970464생명력과 마나 30 포션
					case(102){itemString = `id:51027 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 30 포션
					case(103){itemString = `id:51028 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 50 포션
					case(104){itemString = `id:63000 count:10`; iCumRate +=2;} //0.210970464피닉스의 깃털
					case(105){itemString = `id:60037 count:5`; iCumRate +=2;} //0.210970464블랙 유스 포션
					case(106){itemString = `id:60038 count:5`; iCumRate +=2;} //0.210970464레드 포션
					case(107){itemString = `id:50012 count:5`; iCumRate +=2;} //0.210970464황금 달걀
					case(108){itemString = `id:50013 count:5`; iCumRate +=2;} //0.210970464황금 사과
					case(109){itemString = `id:50541 quality:100`; iCumRate +=2;} //0.210970464에스프레소
					case(110){itemString = `id:50542 quality:100`; iCumRate +=2;} //0.210970464에스프레소 마끼아또 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=2;} //0.210970464카푸치노
					case(112){itemString = `id:50544 quality:100`; iCumRate +=2;} //0.210970464마끼아또
					case(113){itemString = `id:50545 quality:100`; iCumRate +=2;} //0.210970464카페 모카
					case(114){itemString = `id:50546 quality:100`; iCumRate +=2;} //0.210970464아이스 카페 모카
					case(115){itemString = `id:50547 quality:100`; iCumRate +=2;} //0.210970464아이스 마끼아또
					case(116){itemString = `id:50170 quality:100`; iCumRate +=2;} //0.210970464치즈 퐁듀
					case(117){itemString = `id:50171 quality:100`; iCumRate +=2;} //0.210970464이멘 마하산 와인
					case(118){itemString = `id:50172 quality:100`; iCumRate +=2;} //0.210970464레어치즈 케익
					case(119){itemString = `id:50173 quality:100`; iCumRate +=2;} //0.210970464가토 오 쇼콜라
					case(120){itemString = `id:50174 quality:100`; iCumRate +=2;} //0.210970464크로크 무슈
					case(121){itemString = `id:50175 quality:100`; iCumRate +=2;} //0.210970464브라우니
					case(122){itemString = `id:50176 quality:100`; iCumRate +=2;} //0.210970464버터 비스킷
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.316455696해적의
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.316455696리자드
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.316455696히스
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.316455696금속 바늘
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.316455696산사나무
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.316455696한가한
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=3;} //0.316455696마나 위자드|마나 위자드(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=3;} //0.316455696버스트 나이트|버스트 나이트(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=3;} //0.316455696마나 서머너|마나 서머너(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=3;} //0.316455696포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=4;} //0.421940928드래곤 크레스트
					case(134){itemString = `id:15113 `; iCumRate +=4;} //0.421940928여성용 검사학교 교복 쇼트타입
					case(135){itemString = `id:15114 `; iCumRate +=4;} //0.421940928남성용 검사학교 교복 롱타입
					case(136){itemString = `id:15065 `; iCumRate +=4;} //0.421940928엘라 베스트 스커트
					case(137){itemString = `id:19008 `; iCumRate +=4;} //0.421940928코코 판다 로브
					case(138){itemString = `id:15137 `; iCumRate +=4;} //0.421940928셀리나 하프 재킷 코트
					case(139){itemString = `id:18041 `; iCumRate +=4;} //0.421940928큰 챙 깃털 모자
					case(140){itemString = `id:19009 `; iCumRate +=4;} //0.421940928코코 래빗 로브
					case(141){itemString = `id:18112 `; iCumRate +=4;} //0.421940928해 분장 소품
					case(142){itemString = `id:18111 `; iCumRate +=4;} //0.421940928나무 분장 소품
					case(143){itemString = `id:18110 `; iCumRate +=4;} //0.421940928덤불 분장 소품
					case(144){itemString = `id:18109 `; iCumRate +=4;} //0.421940928나오 분장 소품
					case(145){itemString = `id:18108 `; iCumRate +=4;} //0.421940928바위 분장 소품
					case(146){itemString = `id:40083 `; iCumRate +=4;} //0.421940928훅 커틀러스
					case(147){itemString = `id:40032 `; iCumRate +=4;} //0.421940928가고일 소드
					case(148){itemString = `id:18544 `; iCumRate +=4;} //0.421940928펠리칸 프로텍터
					case(149){itemString = `id:18547 `; iCumRate +=4;} //0.421940928파나쉬 헤드 프로텍터
					case(150){itemString = `id:18521 `; iCumRate +=4;} //0.421940928유러피안 컴프
					case(151){itemString = `id:18500 `; iCumRate +=4;} //0.421940928링 메일 헬름
					case(152){itemString = `id:18511 `; iCumRate +=4;} //0.421940928플루트 풀 헬름
					case(153){itemString = `id:18502 `; iCumRate +=4;} //0.421940928본 헬름
					case(154){itemString = `id:19007 `; iCumRate +=4;} //0.421940928야광 머플러 로브
					case(155){itemString = `id:19017 `; iCumRate +=4;} //0.421940928늑대 로브
					case(156){itemString = `id:19016 `; iCumRate +=4;} //0.421940928곰 로브
					case(157){itemString = `id:15112 `; iCumRate +=4;} //0.421940928셀리나 스쿨보이룩
					case(158){itemString = `id:18034 `; iCumRate +=4;} //0.421940928볼륨 베레모
					case(159){itemString = `id:18006 `; iCumRate +=4;} //0.421940928마법사모자
					case(160){itemString = `id:18113 `; iCumRate +=4;} //0.421940928뾰족귀 고양이 모자
					case(161){itemString = `id:18114 `; iCumRate +=4;} //0.421940928줄무늬 고양이 모자
					case(162){itemString = `id:18115 `; iCumRate +=4;} //0.421940928핀 고양이 모자
					case(163){itemString = `id:18097 `; iCumRate +=4;} //0.421940928세이렌 깃털 가면
					case(164){itemString = `id:18098 `; iCumRate +=4;} //0.421940928세이렌의 안경
					case(165){itemString = `id:18099 `; iCumRate +=4;} //0.421940928세이렌 작은 날개 가면
					case(166){itemString = `id:18100 `; iCumRate +=4;} //0.421940928세이렌 날개 가면
					case(167){itemString = `id:18101`; iCumRate +=4;} //0.421940928세이렌 박쥐 날개 가면
					case(168){itemString = `id:18102 `; iCumRate +=4;} //0.421940928세이렌의 가면
					case(169){itemString = `id:15055 `; iCumRate +=4;} //0.421940928세이렌 고양이 가면
					case(170){itemString = `id:18044 `; iCumRate +=4;} //0.421940928범죄용 복면
					case(171){itemString = `id:40071 `; iCumRate +=4;} //0.421940928'라' 음 빈 병
					case(172){itemString = `id:40072 `; iCumRate +=4;} //0.421940928'시' 음 빈 병
					case(173){itemString = `id:40073 `; iCumRate +=4;} //0.421940928'도' 음 빈 병
					case(174){itemString = `id:40074 `; iCumRate +=4;} //0.421940928'레' 음 빈 병
					case(175){itemString = `id:40075 `; iCumRate +=4;} //0.421940928'미' 음 빈 병
					case(176){itemString = `id:40076 `; iCumRate +=4;} //0.421940928'파' 음 빈 병
					case(177){itemString = `id:40077 `; iCumRate +=4;} //0.421940928'솔' 음 빈 병
					case(178){itemString = `id:16517 `; iCumRate +=4;} //0.421940928반대 장갑
					case(179){itemString = `id:16516 `; iCumRate +=4;} //0.421940928찬성 장갑
					case(180){itemString = `id:16515 `; iCumRate +=4;} //0.421940928보 장갑
					case(181){itemString = `id:16514 `; iCumRate +=4;} //0.421940928바위 장갑
					case(182){itemString = `id:16513 `; iCumRate +=4;} //0.421940928가위 장갑
					case(183){itemString = `id:40068 `; iCumRate +=4;} //0.421940928가위 모양 지시봉
					case(184){itemString = `id:40069 `; iCumRate +=4;} //0.421940928바위 모양 지시봉
					case(185){itemString = `id:40070 `; iCumRate +=4;} //0.421940928보 모양 지시봉
					case(186){itemString = `id:17015 `; iCumRate +=4;} //0.421940928Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=4;} //0.421940928레더 미니 원피스
					case(188){itemString = `id:15057 `; iCumRate +=4;} //0.421940928롱 레더 코트 (무광)
					case(189){itemString = `id:18040 `; iCumRate +=4;} //0.421940928코레스 꼭지 베레모
					case(190){itemString = `id:80000 `; iCumRate +=4;} //0.421940928나오의 검은 옷
					case(191){itemString = `id:80001 `; iCumRate +=4;} //0.421940928루아의 옷
					case(192){itemString = `id:80002 `; iCumRate +=4;} //0.421940928핑크색 코트
					case(193){itemString = `id:80003 `; iCumRate +=4;} //0.421940928검은색 코트
					case(194){itemString = `id:80004 `; iCumRate +=4;} //0.421940928나오의 노란색 봄 옷
					case(195){itemString = `id:80005 `; iCumRate +=4;} //0.421940928나오의 하얀색 봄 옷
					case(196){itemString = `id:80006 `; iCumRate +=4;} //0.421940928나오의 핑크색 봄 옷
					case(197){itemString = `id:18056 `; iCumRate +=4;} //0.421940928별 토끼 머리띠1
					case(198){itemString = `id:18057 `; iCumRate +=4;} //0.421940928별 토끼 머리띠2
					case(199){itemString = `id:18058 `; iCumRate +=4;} //0.421940928별 토끼 머리띠3
					case(200){itemString = `id:18059 `; iCumRate +=4;} //0.421940928별 토끼 머리띠4
					case(201){itemString = `id:18060 `; iCumRate +=4;} //0.421940928별 토끼 머리띠5
					case(202){itemString = `id:18061 `; iCumRate +=4;} //0.421940928털 토끼 머리띠1
					case(203){itemString = `id:18062 `; iCumRate +=4;} //0.421940928털 토끼 머리띠2
					case(204){itemString = `id:18063 `; iCumRate +=4;} //0.421940928털 토끼 머리띠3
					case(205){itemString = `id:18064 `; iCumRate +=4;} //0.421940928털 토끼 머리띠4
					case(206){itemString = `id:18065 `; iCumRate +=4;} //0.421940928털 토끼 머리띠5
					case(207){itemString = `id:18066 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠1
					case(208){itemString = `id:18067 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠2
					case(209){itemString = `id:18068 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠3
					case(210){itemString = `id:18069 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠4
					case(211){itemString = `id:18070 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠5
					case(212){itemString = `id:14036 `; iCumRate +=4;} //0.421940928티오즈 아머(남성용)
					case(213){itemString = `id:14037 `; iCumRate +=4;} //0.421940928티오즈 아머(여성용)
					case(214){itemString = `id:16531 `; iCumRate +=4;} //0.421940928티오즈 건틀렛
					case(215){itemString = `id:17523 `; iCumRate +=4;} //0.421940928티오즈 그리브
					case(216){itemString = `id:15132 `; iCumRate +=4;} //0.421940928내추럴 베스트 웨어
					case(217){itemString = `id:15070 `; iCumRate +=4;} //0.421940928스탠드칼라 슬리브리스
					case(218){itemString = `id:15230 `; iCumRate +=4;} //0.421940928가르텐 글렌 체크 스커트
					case(219){itemString = `id:19034 `; iCumRate +=4;} //0.421940928가르텐 클로스 오버코트
					case(220){itemString = `id:40033 `; iCumRate +=4;} //0.421940928클레이모어
					case(221){itemString = `id:40011 `; iCumRate +=4;} //0.421940928브로드 소드
					case(222){itemString = `id:40030 `; iCumRate +=4;} //0.421940928투 핸디드 소드
					case(223){itemString = `id:40012 `; iCumRate +=4;} //0.421940928바스타드 소드
					case(224){itemString = `id:40007 `; iCumRate +=4;} //0.421940928한손도끼
					case(225){itemString = `id:40014 `; iCumRate +=4;} //0.421940928콤포짓 보우
					case(226){itemString = `id:40078 `; iCumRate +=4;} //0.421940928비펜니스
					case(227){itemString = `id:40080 `; iCumRate +=4;} //0.421940928글라디우스
					case(228){itemString = `id:40006 `; iCumRate +=4;} //0.421940928단검
					case(229){itemString = `id:40031 `; iCumRate +=4;} //0.421940928석궁
					case(230){itemString = `id:40081 `; iCumRate +=4;} //0.421940928레더 롱 보우
					case(231){itemString = `id:40079 `; iCumRate +=4;} //0.421940928메이스
					case(232){itemString = `id:13043 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(남성용)
					case(233){itemString = `id:13044 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(여성용)
					case(234){itemString = `id:13045 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(남성용)
					case(235){itemString = `id:13046 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(여성용)
					case(236){itemString = `id:14019 `; iCumRate +=4;} //0.421940928그레이스 플레이트 아머
					case(237){itemString = `id:13031 `; iCumRate +=4;} //0.421940928스파이카 실버 플레이트 아머
					case(238){itemString = `id:13022 `; iCumRate +=4;} //0.421940928로즈 플레이트 아머 (P타입)
					case(239){itemString = `id:40039 `; iCumRate +=4;} //0.421940928아이스 원드
					case(240){itemString = `id:40090 `; iCumRate +=4;} //0.421940928힐링 원드
					case(241){itemString = `id:40040 `; iCumRate +=4;} //0.421940928파이어 원드
					case(242){itemString = `id:40038 `; iCumRate +=4;} //0.421940928라이트닝 원드
					case(243){itemString = `id:18542 `; iCumRate +=4;} //0.421940928빅 체인 풀 헬름
					case(244){itemString = `id:18506 `; iCumRate +=4;} //0.421940928윙 하프 헬름
					case(245){itemString = `id:14042 `; iCumRate +=4;} //0.421940928컬스틴 레더 아머
					case(246){itemString = `id:15155 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(남성용)
					case(247){itemString = `id:15156 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(여성용)
					case(248){itemString = `id:15151 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(249){itemString = `id:15152 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(250){itemString = `id:15153 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(남성용)
					case(251){itemString = `id:15154 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(여성용)
					case(252){itemString = `id:15157 `; iCumRate +=4;} //0.421940928위스 보위군 의복(남성용)
					case(253){itemString = `id:15158 `; iCumRate +=4;} //0.421940928위스 보위군 의복(여성용)
					case(254){itemString = `id:15115 `; iCumRate +=4;} //0.421940928재기드 미니 스커트
					case(255){itemString = `id:15059 `; iCumRate +=4;} //0.421940928터크스 탱크탑 반바지
					case(256){itemString = `id:15070 `; iCumRate +=4;} //0.421940928아이돌 리본 드레스
					case(257){itemString = `id:15074 `; iCumRate +=4;} //0.421940928루이스 성직자 코트
					case(258){itemString = `id:15061 `; iCumRate +=4;} //0.421940928물결무늬 옆트임 튜닉
					case(259){itemString = `id:18045 `; iCumRate +=4;} //0.421940928별장식 마법사 모자
					case(260){itemString = `id:18019 `; iCumRate +=4;} //0.421940928리리나 깃털모자
					case(261){itemString = `id:18020 `; iCumRate +=4;} //0.421940928몬거 깃털모자
					case(262){itemString = `id:18029 `; iCumRate +=4;} //0.421940928나무테 안경
					case(263){itemString = `id:18028 `; iCumRate +=4;} //0.421940928접이식 안경
					case(264){itemString = `id:13010 `; iCumRate +=4;} //0.421940928라운드 폴드론 체인메일
					case(265){itemString = `id:14025 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(남성용)
					case(266){itemString = `id:14026 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(여성용)
					case(267){itemString = `id:16028 `; iCumRate +=4;} //0.421940928카멜 스피리트 글러브
					case(268){itemString = `id:17064 `; iCumRate +=4;} //0.421940928카멜 스피리트 부츠
					case(269){itemString = `id:15131 `; iCumRate +=4;} //0.421940928핀 에이프런 스커트
					case(270){itemString = `id:2006 `; iCumRate +=4;} //0.421940928큰 금화 주머니
					case(271){itemString = `id:16534 `; iCumRate +=4;} //0.421940928컬스틴 레더 건틀렛
					case(272){itemString = `id:17524 `; iCumRate +=4;} //0.421940928컬스틴 레더 부츠
					case(273){itemString = `id:13047 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(남성용)
					case(274){itemString = `id:13048 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(여성용)
					case(275){itemString = `id:14013 `; iCumRate +=4;} //0.421940928로리카 세그먼타타에
					case(276){itemString = `id:14035 `; iCumRate +=4;} //0.421940928피르타 레더 아머
					case(277){itemString = `id:14038 `; iCumRate +=4;} //0.421940928피르타 레더 아머 B타입(여성용)
					case(278){itemString = `id:15028 `; iCumRate +=4;} //0.421940928코레스 씨프슈트
					case(279){itemString = `id:15042 `; iCumRate +=4;} //0.421940928롱넥 원피스
					case(280){itemString = `id:15052 `; iCumRate +=4;} //0.421940928터크스 투톤 튜닉
					case(281){itemString = `id:15053 `; iCumRate +=4;} //0.421940928플랫칼라 원피스
					case(282){itemString = `id:15128 `; iCumRate +=4;} //0.421940928투 톤 비조 드레스
					case(283){itemString = `id:15136 `; iCumRate +=4;} //0.421940928모험가 슈트
					case(284){itemString = `id:16008 `; iCumRate +=4;} //0.421940928코레스 씨프 글러브
					case(285){itemString = `id:16019 `; iCumRate +=4;} //0.421940928줄무늬 팔목 장갑
					case(286){itemString = `id:16040 `; iCumRate +=4;} //0.421940928콜린 빅센 글러브
					case(287){itemString = `id:16505 `; iCumRate +=4;} //0.421940928플루트 건틀렛
					case(288){itemString = `id:16520 `; iCumRate +=4;} //0.421940928롱 레더 글러브
					case(289){itemString = `id:17040 `; iCumRate +=4;} //0.421940928엘라 스트랩 부츠
					case(290){itemString = `id:17041 `; iCumRate +=4;} //0.421940928덩굴무늬 헌팅부츠
					case(291){itemString = `id:17045 `; iCumRate +=4;} //0.421940928브이 넥 라인 레더 부츠
					case(292){itemString = `id:17071 `; iCumRate +=4;} //0.421940928니하이 부츠
					case(293){itemString = `id:17087 `; iCumRate +=4;} //0.421940928콜린 빅센 부츠
					case(294){itemString = `id:17506 `; iCumRate +=4;} //0.421940928롱그리브 부츠
					case(295){itemString = `id:17522 `; iCumRate +=4;} //0.421940928피르타 레더 부츠
					case(296){itemString = `id:18008 `; iCumRate +=4;} //0.421940928스트라이프 캡
					case(297){itemString = `id:18038 `; iCumRate +=4;} //0.421940928깃털 배렛 모자
					case(298){itemString = `id:18047 `; iCumRate +=4;} //0.421940928코레스 펠트 모자
					case(299){itemString = `id:18513 `; iCumRate +=4;} //0.421940928스파이크 캡
					case(300){itemString = `id:18515 `; iCumRate +=4;} //0.421940928트윈 혼 캡
					case(301){itemString = `id:18525 `; iCumRate +=4;} //0.421940928워터드롭 캡
					case(302){itemString = `id:18543 `; iCumRate +=4;} //0.421940928슬릿 풀 헬름
					case(303){itemString = `id:19020 `; iCumRate +=4;} //0.421940928나타네 설산용 코트
					case(304){itemString = `id:19029 `; iCumRate +=4;} //0.421940928자이언트 베어 로브
					case(305){itemString = `id:40015 `; iCumRate +=4;} //0.421940928플루트 숏 소드
					case(306){itemString = `id:40081 `; iCumRate +=4;} //0.421940928롱 보우
					case(307){itemString = `id:46001 `; iCumRate +=4;} //0.421940928라운드 실드
					case(308){itemString = `id:46006 `; iCumRate +=4;} //0.421940928카이트 실드
					case(309){itemString = `id:40172 `; iCumRate +=4;} //0.421940928그레이트 소드
					case(310){itemString = `id:40174 `; iCumRate +=4;} //0.421940928모닝스타
					case(311){itemString = `id:40177 `; iCumRate +=4;} //0.421940928워리어 액스
					case(312){itemString = `id:40180 `; iCumRate +=4;} //0.421940928홉네일 너클
					case(313){itemString = `id:40041 `; iCumRate +=4;} //0.421940928타격용 원드
					case(314){itemString = `id:16523 `; iCumRate +=4;} //0.421940928그레이스 건틀렛
					case(315){itemString = `id:17515 `; iCumRate +=4;} //0.421940928그레이스 그리브
					case(316){itemString = `id:18545 `; iCumRate +=4;} //0.421940928그레이스 헬멧
					case(317){itemString = `id:46007 `; iCumRate +=4;} //0.421940928헤테로 카이트 실드
					case(318){itemString = `id:46008 `; iCumRate +=4;} //0.421940928라이트 헤테로 카이트 실드
					case(319){itemString = `id:51003 count:10`; iCumRate +=5;} //0.52742616생명력 50 포션
					case(320){itemString = `id:51004 count:10`; iCumRate +=5;} //0.52742616생명력 100 포션
					case(321){itemString = `id:51008 count:10`; iCumRate +=5;} //0.52742616마나 50 포션
					case(322){itemString = `id:51014 count:10`; iCumRate +=5;} //0.52742616스태미나 100 포션
					case(323){itemString = `id:51029 count:10`; iCumRate +=5;} //0.52742616생명력과 스태미나 100 포션
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(92);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13060 `; iCumRate +=1;} //1.086956522 드래곤 스케일 아머(여성용)
					case(1){itemString = `id:13061 `; iCumRate +=1;} //1.086956522 드래곤 스케일 아머 (남성용)
					case(2){itemString = `id:13062 `; iCumRate +=1;} //1.086956522 드래곤 스케일 아머(자이언트 여성용)
					case(3){itemString = `id:13063 `; iCumRate +=1;} //1.086956522 드래곤 스케일 아머(자이언트 남성용)
					case(4){itemString = `id:16543 `; iCumRate +=1;} //1.086956522 드래곤 스케일 건틀렛
					case(5){itemString = `id:16544 col1:685156 col2:685156 col3:ff9aed`; iCumRate +=1;} //1.086956522 드래곤 스케일 건틀렛(자이언트용)
					case(6){itemString = `id:17530 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522 드래곤 스케일 그리브
					case(7){itemString = `id:18577 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522 드래곤 스케일 헬름
					case(8){itemString = `id:15267 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522테라 고딕 풀 드레스
					case(9){itemString = `id:15362 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522테라 고딕 펑크 수트
					case(10){itemString = `id:19033 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522상어 로브
					case(11){itemString = `id:15405 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522엘리네드 패셔니스타 드레스
					case(12){itemString = `id:17039 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522코레스 큐트 리본 슈즈
					case(13){itemString = `id:13050 col1:9933FF col2:9933FF col3:9933FF`; iCumRate +=1;} //1.086956522클라우스 나이트 아머
					case(14){itemString = `id:16551 prefix:21202`; iCumRate +=1;} //1.086956522클라우스 나이트 건틀렛
					case(15){itemString = `id:17534 prefix:21008`; iCumRate +=1;} //1.086956522클라우스 나이트 부츠
					case(16){itemString = `id:18549 suffix:31103`; iCumRate +=2;} //2.173913043 @드래곤 펠릭스 헬름
					case(17){itemString = `id:46010 prefix:20825`; iCumRate +=2;} //2.173913043 @드래곤 실드
					case(18){itemString = `id:15373 durability:17000 durability_max:17000`; iCumRate +=2;} //2.173913043시스루 칵테일 드레스
					case(19){itemString = `id:18218 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043빈티지 애드미럴 모자(남성용)
					case(20){itemString = `id:18219col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043빈티지 애드미럴 모자(여성용)
					case(21){itemString = `id:17141col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043파이릿 우드워커 부츠
					case(22){itemString = `id:17154col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043프로퍼 스몰 코드 슈즈
					case(23){itemString = `id:18274col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043베이직 헤어 밴드
					case(24){itemString = `id:17153col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043비비드 캐주얼 슈즈
					case(25){itemString = `id:18038col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043깃털 배렛 모자
					case(26){itemString = `id:18567col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=2;} //2.173913043박쥐 모자
					case(27){itemString = `id:15573 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565클래식 커플 수트(여성용)
					case(28){itemString = `id:15184 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565테라 에이션트 패턴 웨어
					case(29){itemString = `id:15066 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565루이스 베스트 웨어
					case(30){itemString = `id:15099 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565비앙카 드로워즈 레이어드 스커트
					case(31){itemString = `id:19038 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565라바 캣 로브
					case(32){itemString = `id:19066 col1:CCFFCC col2:CCFFCC col3:CCFFCC`; iCumRate +=3;} //3.260869565할로윈 호박 로브
					case(33){itemString = `id:15113 `; iCumRate +=3;} //3.260869565여성용 검사학교 교복 쇼트타입
					case(34){itemString = `id:17120 `; iCumRate +=3;} //3.260869565보니타 플룸 앵클 부츠
					case(35){itemString = `id:16136 `; iCumRate +=3;} //3.260869565아이언 피라미드 밴드
					case(36){itemString = `id:15374 `; iCumRate +=3;} //3.260869565샤이니 고딕 프릴 드레스
					case(37){itemString = `id:15136 `; iCumRate +=3;} //3.260869565고딕 레이스 스커트
					case(38){itemString = `id:14032 `; iCumRate +=3;} //3.260869565스티치 롱 로브 아머
					case(39){itemString = `id:18199 `; iCumRate +=3;} //3.260869565얇은테 안경
					case(40){itemString = `id:40095 `; iCumRate +=3;} //3.260869565 @드래곤 블레이드
					case(41){itemString = `id:91129 `; iCumRate +=3;} //3.260869565전투 스킬 수련치 2배 포션
					case(42){itemString = `id:91130 `; iCumRate +=3;} //3.260869565마법 스킬 수련치 2배 포션
					case(43){itemString = `id:91131 `; iCumRate +=3;} //3.260869565연금술 스킬 수련치 2배 포션
					case(44){itemString = `id:91070 `; iCumRate +=3;} //3.260869565물리 공격력 증가 포션 (30분)
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(133);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.751879699누아자 로브 (남성용)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.751879699누아자 로브 (여성용)
					case(2){itemString = `id:16554 `; iCumRate +=1;} //0.751879699누아자 건틀렛
					case(3){itemString = `id:17551 `; iCumRate +=1;} //0.751879699누아자 플레이트 부츠
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=1;} //0.751879699라운드 폴드론 체인메일
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=1;} //0.751879699로즈 플레이트 아머 (P타입)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=1;} //0.751879699스파이카 실버 플레이트 아머
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=1;} //0.751879699카멜 스피리트 아머(남성용)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=1;} //0.751879699카멜 스피리트 아머(여성용)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=1;} //0.751879699티오즈 아머(남성용)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=1;} //0.751879699티오즈 아머(여성용)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=1;} //0.751879699카멜 스피리트 글러브
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=1;} //0.751879699실버 티니 글러브
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=1;} //0.751879699발렌시아 크로스 라인 플레이트 건틀렛
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=1;} //0.751879699티오즈 건틀렛
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=1;} //0.751879699카멜 스피리트 부츠
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=1;} //0.751879699스파이카 실버 플레이트 부츠
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=1;} //0.751879699발렌시아 크로스 라인 플레이트 부츠
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=1;} //0.751879699티오즈 그리브
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=1;} //0.751879699드래곤 크레스트
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=1;} //0.751879699거미줄 주머니（레어컬러）
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=1;} //0.751879699가는 실뭉치 주머니（레어컬러）
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=1;} //0.751879699굵은 실뭉치 주머니 (레어컬러）
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=1;} //0.751879699저가형 가죽 주머니（레어컬러）
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=1;} //0.751879699일반 가죽 주머니 주머니（레어컬러）
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=1;} //0.751879699고급 가죽 주머니（레어컬러）
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=1;} //0.751879699최고급 가죽 주머니（레어컬러）
					case(27){itemString = `id:80001 `; iCumRate +=1;} //0.751879699루아의 옷
					case(28){itemString = `id:80002 `; iCumRate +=1;} //0.751879699핑크색 코트
					case(29){itemString = `id:80003 `; iCumRate +=1;} //0.751879699검은색 코트
					case(30){itemString = `id:80004 `; iCumRate +=1;} //0.751879699나오의 노란색 봄 옷
					case(31){itemString = `id:80005 `; iCumRate +=1;} //0.751879699나오의 하얀색 봄 옷
					case(32){itemString = `id:80006 `; iCumRate +=1;} //0.751879699나오의 핑크색 봄 옷
					case(33){itemString = `id:51004 count:10`; iCumRate +=1;} //0.751879699생명력 100 포션
					case(34){itemString = `id:51008 count:10`; iCumRate +=1;} //0.751879699마나 50 포션
					case(35){itemString = `id:51022 count:10`; iCumRate +=1;} //0.751879699생명력과 마나 30 포션
					case(36){itemString = `id:51023 count:10`; iCumRate +=1;} //0.751879699생명력과 마나 50 포션
					case(37){itemString = `id:51027 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 30 포션
					case(38){itemString = `id:51028 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 50 포션
					case(39){itemString = `id:51029 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 100 포션
					case(40){itemString = `id:60036 count:5`; iCumRate +=1;} //0.751879699옐로우 베이비 포션
					case(41){itemString = `id:60037 count:5`; iCumRate +=1;} //0.751879699블랙 유스 포션
					case(42){itemString = `id:60038 count:5`; iCumRate +=1;} //0.751879699레드 포션
					case(43){itemString = `id:60040 count:5`; iCumRate +=1;} //0.751879699그린 베이비 포션
					case(44){itemString = `id:62004 count:5`; iCumRate +=1;} //0.751879699마법가루
					case(45){itemString = `id:63000 count:10`; iCumRate +=1;} //0.751879699피닉스의 깃털
					case(46){itemString = `id:2041`; iCumRate +=1;} //0.751879699거미줄 주머니
					case(47){itemString = `id:2042`; iCumRate +=1;} //0.751879699가는 실뭉치 주머니
					case(48){itemString = `id:2043`; iCumRate +=1;} //0.751879699굵은 실뭉치 주머니
					case(49){itemString = `id:2044`; iCumRate +=1;} //0.751879699저가형 가죽 주머니
					case(50){itemString = `id:2045`; iCumRate +=1;} //0.751879699일반 가죽 주머니 주머니
					case(51){itemString = `id:2046`; iCumRate +=1;} //0.751879699고급 가죽 주머니
					case(52){itemString = `id:2028`; iCumRate +=1;} //0.751879699양털 주머니
					case(53){itemString = `id:51009 count:10`; iCumRate +=1;} //0.751879699마나 100 포션
					case(54){itemString = `id:2006 `; iCumRate +=1;} //0.751879699큰 금화 주머니
					case(55){itemString = `id:14042 `; iCumRate +=1;} //0.751879699컬스틴 레더 아머
					case(56){itemString = `id:16534 `; iCumRate +=1;} //0.751879699컬스틴 레더 건틀렛
					case(57){itemString = `id:17524 `; iCumRate +=1;} //0.751879699컬스틴 레더 부츠
					case(58){itemString = `id:13047 `; iCumRate +=1;} //0.751879699키리누스진 하프 플레이트 아머(남성용)
					case(59){itemString = `id:13048 `; iCumRate +=1;} //0.751879699키리누스진 하프 플레이트 아머(여성용)
					case(60){itemString = `id:14005 `; iCumRate +=1;} //0.751879699드란도스 레더메일
					case(61){itemString = `id:14011 `; iCumRate +=1;} //0.751879699드란도스 레더메일
					case(62){itemString = `id:14013 `; iCumRate +=1;} //0.751879699로리카 세그먼타타에
					case(63){itemString = `id:14019 `; iCumRate +=1;} //0.751879699그레이스 플레이트 아머
					case(64){itemString = `id:14035 `; iCumRate +=1;} //0.751879699피르타 레더 아머
					case(65){itemString = `id:14038 `; iCumRate +=1;} //0.751879699피르타 레더 아머 B타입(여성용)
					case(66){itemString = `id:15014 `; iCumRate +=1;} //0.751879699파발꾼의 옷
					case(67){itemString = `id:15028 `; iCumRate +=1;} //0.751879699코레스 씨프슈트
					case(68){itemString = `id:15042 `; iCumRate +=1;} //0.751879699롱넥 원피스
					case(69){itemString = `id:15052 `; iCumRate +=1;} //0.751879699터크스 투톤 튜닉
					case(70){itemString = `id:15053 `; iCumRate +=1;} //0.751879699플랫칼라 원피스
					case(71){itemString = `id:15055 `; iCumRate +=1;} //0.751879699레더 미니 원피스
					case(72){itemString = `id:15057 `; iCumRate +=1;} //0.751879699롱 레더 코트 (무광)
					case(73){itemString = `id:15070 `; iCumRate +=1;} //0.751879699스탠드칼라 슬리브리스
					case(74){itemString = `id:15128 `; iCumRate +=1;} //0.751879699투 톤 비조 드레스
					case(75){itemString = `id:15135 `; iCumRate +=1;} //0.751879699시크 수트
					case(76){itemString = `id:15136 `; iCumRate +=1;} //0.751879699모험가 슈트
					case(77){itemString = `id:15153 `; iCumRate +=1;} //0.751879699산드라 스나이퍼 수트(남성용)
					case(78){itemString = `id:15154 `; iCumRate +=1;} //0.751879699산드라 스나이퍼 수트(여성용)
					case(79){itemString = `id:15230 `; iCumRate +=1;} //0.751879699가르텐 글렌 체크 스커트
					case(80){itemString = `id:16008 `; iCumRate +=1;} //0.751879699코레스 씨프 글러브
					case(81){itemString = `id:16019 `; iCumRate +=1;} //0.751879699줄무늬 팔목 장갑
					case(82){itemString = `id:16028 `; iCumRate +=1;} //0.751879699카멜 스피리트 글러브
					case(83){itemString = `id:16040 `; iCumRate +=1;} //0.751879699콜린 빅센 글러브
					case(84){itemString = `id:16505 `; iCumRate +=1;} //0.751879699플루트 건틀렛
					case(85){itemString = `id:16520 `; iCumRate +=1;} //0.751879699롱 레더 글러브
					case(86){itemString = `id:17040 `; iCumRate +=1;} //0.751879699엘라 스트랩 부츠
					case(87){itemString = `id:17041 `; iCumRate +=1;} //0.751879699덩굴무늬 헌팅부츠
					case(88){itemString = `id:17045 `; iCumRate +=1;} //0.751879699브이 넥 라인 레더 부츠
					case(89){itemString = `id:17071 `; iCumRate +=1;} //0.751879699니하이 부츠
					case(90){itemString = `id:17087 `; iCumRate +=1;} //0.751879699콜린 빅센 부츠
					case(91){itemString = `id:17506 `; iCumRate +=1;} //0.751879699롱그리브 부츠
					case(92){itemString = `id:17522 `; iCumRate +=1;} //0.751879699피르타 레더 부츠
					case(93){itemString = `id:18008 `; iCumRate +=1;} //0.751879699스트라이프 캡
					case(94){itemString = `id:18023 `; iCumRate +=1;} //0.751879699몬거 씨프 캡
					case(95){itemString = `id:18028 `; iCumRate +=1;} //0.751879699접이식 안경
					case(96){itemString = `id:18029 `; iCumRate +=1;} //0.751879699나무테 안경
					case(97){itemString = `id:18038 `; iCumRate +=1;} //0.751879699깃털 배렛 모자
					case(98){itemString = `id:18040 `; iCumRate +=1;} //0.751879699코레스 꼭지 베레모
					case(99){itemString = `id:18047 `; iCumRate +=1;} //0.751879699코레스 펠트 모자
					case(100){itemString = `id:18502 `; iCumRate +=1;} //0.751879699본 헬름
					case(101){itemString = `id:18506 `; iCumRate +=1;} //0.751879699윙 하프 헬름
					case(102){itemString = `id:18511 `; iCumRate +=1;} //0.751879699플루트 풀 헬름
					case(103){itemString = `id:18513 `; iCumRate +=1;} //0.751879699스파이크 캡
					case(104){itemString = `id:18515 `; iCumRate +=1;} //0.751879699트윈 혼 캡
					case(105){itemString = `id:18525 `; iCumRate +=1;} //0.751879699워터드롭 캡
					case(106){itemString = `id:18542 `; iCumRate +=1;} //0.751879699빅 체인 풀 헬름
					case(107){itemString = `id:18543 `; iCumRate +=1;} //0.751879699슬릿 풀 헬름
					case(108){itemString = `id:19005 `; iCumRate +=1;} //0.751879699머플러 로브
					case(109){itemString = `id:19007 `; iCumRate +=1;} //0.751879699야광 머플러 로브
					case(110){itemString = `id:19020 `; iCumRate +=1;} //0.751879699나타네 설산용 코트
					case(111){itemString = `id:19029 `; iCumRate +=1;} //0.751879699자이언트 베어 로브
					case(112){itemString = `id:19034 `; iCumRate +=1;} //0.751879699가르텐 클로스 오버코트
					case(113){itemString = `id:40014 `; iCumRate +=1;} //0.751879699콤포짓 보우
					case(114){itemString = `id:40015 `; iCumRate +=1;} //0.751879699플루트 숏 소드
					case(115){itemString = `id:40030 `; iCumRate +=1;} //0.751879699투 핸디드 소드
					case(116){itemString = `id:40031 `; iCumRate +=1;} //0.751879699석궁
					case(117){itemString = `id:40038 `; iCumRate +=1;} //0.751879699라이트닝 원드
					case(118){itemString = `id:40039 `; iCumRate +=1;} //0.751879699아이스 원드
					case(119){itemString = `id:40040 `; iCumRate +=1;} //0.751879699파이어 원드
					case(120){itemString = `id:40041 `; iCumRate +=1;} //0.751879699타격용 원드
					case(121){itemString = `id:40079 `; iCumRate +=1;} //0.751879699메이스
					case(122){itemString = `id:40081 `; iCumRate +=1;} //0.751879699레더 롱 보우
					case(123){itemString = `id:40090 `; iCumRate +=1;} //0.751879699힐링 원드
					case(124){itemString = `id:46001  `; iCumRate +=1;} //0.751879699라운드 실드
					case(125){itemString = `id:46006 `; iCumRate +=1;} //0.751879699카이트 실드
					case(126){itemString = `id:40172 `; iCumRate +=1;} //0.751879699그레이트 소드
					case(127){itemString = `id:40174 `; iCumRate +=1;} //0.751879699모닝스타
					case(128){itemString = `id:40177 `; iCumRate +=1;} //0.751879699워리어 액스
					case(129){itemString = `id:40180 `; iCumRate +=1;} //0.751879699홉네일 너클
					case(130){itemString = `id:85056`; iCumRate +=1;} //0.751879699최고급 새도우 크리스탈
					case(131){itemString = `id:85055`; iCumRate +=1;} //0.751879699고급 새도우 크리스탈
					case(132){itemString = `id:85054`; iCumRate +=1;} //0.751879699새도우 크리스탈
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(133);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19081 `; iCumRate +=1;} //0.751879699누아자 로브 (남성용)
					case(1){itemString = `id:19082 `; iCumRate +=1;} //0.751879699누아자 로브 (여성용)
					case(2){itemString = `id:16554 `; iCumRate +=1;} //0.751879699누아자 건틀렛
					case(3){itemString = `id:17551 `; iCumRate +=1;} //0.751879699누아자 플레이트 부츠
					case(4){itemString = `id:13010 suffix:30613`; iCumRate +=1;} //0.751879699라운드 폴드론 체인메일
					case(5){itemString = `id:13022 suffix:30613`; iCumRate +=1;} //0.751879699로즈 플레이트 아머 (P타입)
					case(6){itemString = `id:13031 suffix:30613`; iCumRate +=1;} //0.751879699스파이카 실버 플레이트 아머
					case(7){itemString = `id:14025 suffix:30515`; iCumRate +=1;} //0.751879699카멜 스피리트 아머(남성용)
					case(8){itemString = `id:14026 suffix:30515`; iCumRate +=1;} //0.751879699카멜 스피리트 아머(여성용)
					case(9){itemString = `id:14036 suffix:30613`; iCumRate +=1;} //0.751879699티오즈 아머(남성용)
					case(10){itemString = `id:14037 suffix:30613`; iCumRate +=1;} //0.751879699티오즈 아머(여성용)
					case(11){itemString = `id:16028 suffix:30601`; iCumRate +=1;} //0.751879699카멜 스피리트 글러브
					case(12){itemString = `id:16511 suffix:30601`; iCumRate +=1;} //0.751879699실버 티니 글러브
					case(13){itemString = `id:16521 suffix:30902`; iCumRate +=1;} //0.751879699발렌시아 크로스 라인 플레이트 건틀렛
					case(14){itemString = `id:16531 suffix:30601`; iCumRate +=1;} //0.751879699티오즈 건틀렛
					case(15){itemString = `id:17064 suffix:30601`; iCumRate +=1;} //0.751879699카멜 스피리트 부츠
					case(16){itemString = `id:17510 suffix:30601`; iCumRate +=1;} //0.751879699스파이카 실버 플레이트 부츠
					case(17){itemString = `id:17514 suffix:30902`; iCumRate +=1;} //0.751879699발렌시아 크로스 라인 플레이트 부츠
					case(18){itemString = `id:17523 suffix:30601`; iCumRate +=1;} //0.751879699티오즈 그리브
					case(19){itemString = `id:18518 suffix:30601`; iCumRate +=1;} //0.751879699드래곤 크레스트
					case(20){itemString = `id:2041col1:4020FF0d`; iCumRate +=1;} //0.751879699거미줄 주머니（레어컬러）
					case(21){itemString = `id:2042col1:4020FF0d`; iCumRate +=1;} //0.751879699가는 실뭉치 주머니（레어컬러）
					case(22){itemString = `id:2043col1:4020FF0d`; iCumRate +=1;} //0.751879699굵은 실뭉치 주머니 (레어컬러）
					case(23){itemString = `id:2044col1:4020FF0d`; iCumRate +=1;} //0.751879699저가형 가죽 주머니（레어컬러）
					case(24){itemString = `id:2045col1:4020FF0d`; iCumRate +=1;} //0.751879699일반 가죽 주머니 주머니（레어컬러）
					case(25){itemString = `id:2046col1:4020FF0d`; iCumRate +=1;} //0.751879699고급 가죽 주머니（레어컬러）
					case(26){itemString = `id:2047col1:4020FF0d`; iCumRate +=1;} //0.751879699최고급 가죽 주머니（레어컬러）
					case(27){itemString = `id:80001 `; iCumRate +=1;} //0.751879699루아의 옷
					case(28){itemString = `id:80002 `; iCumRate +=1;} //0.751879699핑크색 코트
					case(29){itemString = `id:80003 `; iCumRate +=1;} //0.751879699검은색 코트
					case(30){itemString = `id:80004 `; iCumRate +=1;} //0.751879699나오의 노란색 봄 옷
					case(31){itemString = `id:80005 `; iCumRate +=1;} //0.751879699나오의 하얀색 봄 옷
					case(32){itemString = `id:80006 `; iCumRate +=1;} //0.751879699나오의 핑크색 봄 옷
					case(33){itemString = `id:51004 count:10`; iCumRate +=1;} //0.751879699생명력 100 포션
					case(34){itemString = `id:51008 count:10`; iCumRate +=1;} //0.751879699마나 50 포션
					case(35){itemString = `id:51022 count:10`; iCumRate +=1;} //0.751879699생명력과 마나 30 포션
					case(36){itemString = `id:51023 count:10`; iCumRate +=1;} //0.751879699생명력과 마나 50 포션
					case(37){itemString = `id:51027 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 30 포션
					case(38){itemString = `id:51028 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 50 포션
					case(39){itemString = `id:51029 count:10`; iCumRate +=1;} //0.751879699생명력과 스태미나 100 포션
					case(40){itemString = `id:60036 count:5`; iCumRate +=1;} //0.751879699옐로우 베이비 포션
					case(41){itemString = `id:60037 count:5`; iCumRate +=1;} //0.751879699블랙 유스 포션
					case(42){itemString = `id:60038 count:5`; iCumRate +=1;} //0.751879699레드 포션
					case(43){itemString = `id:60040 count:5`; iCumRate +=1;} //0.751879699그린 베이비 포션
					case(44){itemString = `id:62004 count:5`; iCumRate +=1;} //0.751879699마법가루
					case(45){itemString = `id:63000 count:10`; iCumRate +=1;} //0.751879699피닉스의 깃털
					case(46){itemString = `id:2041`; iCumRate +=1;} //0.751879699거미줄 주머니
					case(47){itemString = `id:2042`; iCumRate +=1;} //0.751879699가는 실뭉치 주머니
					case(48){itemString = `id:2043`; iCumRate +=1;} //0.751879699굵은 실뭉치 주머니
					case(49){itemString = `id:2044`; iCumRate +=1;} //0.751879699저가형 가죽 주머니
					case(50){itemString = `id:2045`; iCumRate +=1;} //0.751879699일반 가죽 주머니 주머니
					case(51){itemString = `id:2046`; iCumRate +=1;} //0.751879699고급 가죽 주머니
					case(52){itemString = `id:2028`; iCumRate +=1;} //0.751879699양털 주머니
					case(53){itemString = `id:51009 count:10`; iCumRate +=1;} //0.751879699마나 100 포션
					case(54){itemString = `id:2006 `; iCumRate +=1;} //0.751879699큰 금화 주머니
					case(55){itemString = `id:14042 `; iCumRate +=1;} //0.751879699컬스틴 레더 아머
					case(56){itemString = `id:16534 `; iCumRate +=1;} //0.751879699컬스틴 레더 건틀렛
					case(57){itemString = `id:17524 `; iCumRate +=1;} //0.751879699컬스틴 레더 부츠
					case(58){itemString = `id:13047 `; iCumRate +=1;} //0.751879699키리누스진 하프 플레이트 아머(남성용)
					case(59){itemString = `id:13048 `; iCumRate +=1;} //0.751879699키리누스진 하프 플레이트 아머(여성용)
					case(60){itemString = `id:14005 `; iCumRate +=1;} //0.751879699드란도스 레더메일
					case(61){itemString = `id:14011 `; iCumRate +=1;} //0.751879699드란도스 레더메일
					case(62){itemString = `id:14013 `; iCumRate +=1;} //0.751879699로리카 세그먼타타에
					case(63){itemString = `id:14019 `; iCumRate +=1;} //0.751879699그레이스 플레이트 아머
					case(64){itemString = `id:14035 `; iCumRate +=1;} //0.751879699피르타 레더 아머
					case(65){itemString = `id:14038 `; iCumRate +=1;} //0.751879699피르타 레더 아머 B타입(여성용)
					case(66){itemString = `id:15014 `; iCumRate +=1;} //0.751879699파발꾼의 옷
					case(67){itemString = `id:15028 `; iCumRate +=1;} //0.751879699코레스 씨프슈트
					case(68){itemString = `id:15042 `; iCumRate +=1;} //0.751879699롱넥 원피스
					case(69){itemString = `id:15052 `; iCumRate +=1;} //0.751879699터크스 투톤 튜닉
					case(70){itemString = `id:15053 `; iCumRate +=1;} //0.751879699플랫칼라 원피스
					case(71){itemString = `id:15055 `; iCumRate +=1;} //0.751879699레더 미니 원피스
					case(72){itemString = `id:15057 `; iCumRate +=1;} //0.751879699롱 레더 코트 (무광)
					case(73){itemString = `id:15070 `; iCumRate +=1;} //0.751879699스탠드칼라 슬리브리스
					case(74){itemString = `id:15128 `; iCumRate +=1;} //0.751879699투 톤 비조 드레스
					case(75){itemString = `id:15135 `; iCumRate +=1;} //0.751879699시크 수트
					case(76){itemString = `id:15136 `; iCumRate +=1;} //0.751879699모험가 슈트
					case(77){itemString = `id:15153 `; iCumRate +=1;} //0.751879699산드라 스나이퍼 수트(남성용)
					case(78){itemString = `id:15154 `; iCumRate +=1;} //0.751879699산드라 스나이퍼 수트(여성용)
					case(79){itemString = `id:15230 `; iCumRate +=1;} //0.751879699가르텐 글렌 체크 스커트
					case(80){itemString = `id:16008 `; iCumRate +=1;} //0.751879699코레스 씨프 글러브
					case(81){itemString = `id:16019 `; iCumRate +=1;} //0.751879699줄무늬 팔목 장갑
					case(82){itemString = `id:16028 `; iCumRate +=1;} //0.751879699카멜 스피리트 글러브
					case(83){itemString = `id:16040 `; iCumRate +=1;} //0.751879699콜린 빅센 글러브
					case(84){itemString = `id:16505 `; iCumRate +=1;} //0.751879699플루트 건틀렛
					case(85){itemString = `id:16520 `; iCumRate +=1;} //0.751879699롱 레더 글러브
					case(86){itemString = `id:17040 `; iCumRate +=1;} //0.751879699엘라 스트랩 부츠
					case(87){itemString = `id:17041 `; iCumRate +=1;} //0.751879699덩굴무늬 헌팅부츠
					case(88){itemString = `id:17045 `; iCumRate +=1;} //0.751879699브이 넥 라인 레더 부츠
					case(89){itemString = `id:17071 `; iCumRate +=1;} //0.751879699니하이 부츠
					case(90){itemString = `id:17087 `; iCumRate +=1;} //0.751879699콜린 빅센 부츠
					case(91){itemString = `id:17506 `; iCumRate +=1;} //0.751879699롱그리브 부츠
					case(92){itemString = `id:17522 `; iCumRate +=1;} //0.751879699피르타 레더 부츠
					case(93){itemString = `id:18008 `; iCumRate +=1;} //0.751879699스트라이프 캡
					case(94){itemString = `id:18023 `; iCumRate +=1;} //0.751879699몬거 씨프 캡
					case(95){itemString = `id:18028 `; iCumRate +=1;} //0.751879699접이식 안경
					case(96){itemString = `id:18029 `; iCumRate +=1;} //0.751879699나무테 안경
					case(97){itemString = `id:18038 `; iCumRate +=1;} //0.751879699깃털 배렛 모자
					case(98){itemString = `id:18040 `; iCumRate +=1;} //0.751879699코레스 꼭지 베레모
					case(99){itemString = `id:18047 `; iCumRate +=1;} //0.751879699코레스 펠트 모자
					case(100){itemString = `id:18502 `; iCumRate +=1;} //0.751879699본 헬름
					case(101){itemString = `id:18506 `; iCumRate +=1;} //0.751879699윙 하프 헬름
					case(102){itemString = `id:18511 `; iCumRate +=1;} //0.751879699플루트 풀 헬름
					case(103){itemString = `id:18513 `; iCumRate +=1;} //0.751879699스파이크 캡
					case(104){itemString = `id:18515 `; iCumRate +=1;} //0.751879699트윈 혼 캡
					case(105){itemString = `id:18525 `; iCumRate +=1;} //0.751879699워터드롭 캡
					case(106){itemString = `id:18542 `; iCumRate +=1;} //0.751879699빅 체인 풀 헬름
					case(107){itemString = `id:18543 `; iCumRate +=1;} //0.751879699슬릿 풀 헬름
					case(108){itemString = `id:19005 `; iCumRate +=1;} //0.751879699머플러 로브
					case(109){itemString = `id:19007 `; iCumRate +=1;} //0.751879699야광 머플러 로브
					case(110){itemString = `id:19020 `; iCumRate +=1;} //0.751879699나타네 설산용 코트
					case(111){itemString = `id:19029 `; iCumRate +=1;} //0.751879699자이언트 베어 로브
					case(112){itemString = `id:19034 `; iCumRate +=1;} //0.751879699가르텐 클로스 오버코트
					case(113){itemString = `id:40014 `; iCumRate +=1;} //0.751879699콤포짓 보우
					case(114){itemString = `id:40015 `; iCumRate +=1;} //0.751879699플루트 숏 소드
					case(115){itemString = `id:40030 `; iCumRate +=1;} //0.751879699투 핸디드 소드
					case(116){itemString = `id:40031 `; iCumRate +=1;} //0.751879699석궁
					case(117){itemString = `id:40038 `; iCumRate +=1;} //0.751879699라이트닝 원드
					case(118){itemString = `id:40039 `; iCumRate +=1;} //0.751879699아이스 원드
					case(119){itemString = `id:40040 `; iCumRate +=1;} //0.751879699파이어 원드
					case(120){itemString = `id:40041 `; iCumRate +=1;} //0.751879699타격용 원드
					case(121){itemString = `id:40079 `; iCumRate +=1;} //0.751879699메이스
					case(122){itemString = `id:40081 `; iCumRate +=1;} //0.751879699레더 롱 보우
					case(123){itemString = `id:40090 `; iCumRate +=1;} //0.751879699힐링 원드
					case(124){itemString = `id:46001  `; iCumRate +=1;} //0.751879699라운드 실드
					case(125){itemString = `id:46006 `; iCumRate +=1;} //0.751879699카이트 실드
					case(126){itemString = `id:40172 `; iCumRate +=1;} //0.751879699그레이트 소드
					case(127){itemString = `id:40174 `; iCumRate +=1;} //0.751879699모닝스타
					case(128){itemString = `id:40177 `; iCumRate +=1;} //0.751879699워리어 액스
					case(129){itemString = `id:40180 `; iCumRate +=1;} //0.751879699홉네일 너클
					case(130){itemString = `id:85056`; iCumRate +=1;} //0.751879699최고급 새도우 크리스탈
					case(131){itemString = `id:85055`; iCumRate +=1;} //0.751879699고급 새도우 크리스탈
					case(132){itemString = `id:85054`; iCumRate +=1;} //0.751879699새도우 크리스탈
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
	}

	return ``;
}