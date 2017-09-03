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
	//대만 3주년 기념 가챠폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(4709);	//확률의 총합을 적는다
	meta_array itemArray;

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){iCumRate += 1;}
			case(1){iCumRate += 1;}
			case(2){iCumRate += 1;}
			case(3){iCumRate += 1;}
			case(4){iCumRate += 1;}
			case(5){iCumRate += 1;}
			case(6){iCumRate += 1;}
			case(7){iCumRate += 1;}
			case(8){iCumRate += 1;}
			case(9){iCumRate += 1;}
			case(10){iCumRate += 1;}
			case(11){iCumRate += 1;}
			case(12){iCumRate += 1;}
			case(13){iCumRate += 2;}
			case(14){iCumRate += 2;}
			case(15){iCumRate += 2;}
			case(16){iCumRate += 2;}
			case(17){iCumRate += 2;}
			case(18){iCumRate += 2;}
			case(19){iCumRate += 2;}
			case(20){iCumRate += 2;}
			case(21){iCumRate += 2;}
			case(22){iCumRate += 2;}
			case(23){iCumRate += 4;}
			case(24){iCumRate += 4;}
			case(25){iCumRate += 4;}
			case(26){iCumRate += 4;}
			case(27){iCumRate += 4;}
			case(28){iCumRate += 4;}
			case(29){iCumRate += 4;}
			case(30){iCumRate += 4;}
			case(31){iCumRate += 4;}
			case(32){iCumRate += 4;}
			case(33){iCumRate += 4;}
			case(34){iCumRate += 4;}
			case(35){iCumRate += 4;}
			case(36){iCumRate += 8;}
			case(37){iCumRate += 8;}
			case(38){iCumRate += 8;}
			case(39){iCumRate += 8;}
			case(40){iCumRate += 8;}
			case(41){iCumRate += 8;}
			case(42){iCumRate += 8;}
			case(43){iCumRate += 8;}
			case(44){iCumRate += 8;}
			case(45){iCumRate += 8;}
			case(46){iCumRate += 16;}
			case(47){iCumRate += 16;}
			case(48){iCumRate += 16;}
			case(49){iCumRate += 16;}
			case(50){iCumRate += 16;}
			case(51){iCumRate += 16;}
			case(52){iCumRate += 32;}
			case(53){iCumRate += 32;}
			case(54){iCumRate += 32;}
			case(55){iCumRate += 32;}
			case(56){iCumRate += 32;}
			case(57){iCumRate += 32;}
			case(58){iCumRate += 32;}
			case(59){iCumRate += 32;}
			case(60){iCumRate += 32;}
			case(61){iCumRate += 32;}
			case(62){iCumRate += 32;}
			case(63){iCumRate += 48;}
			case(64){iCumRate += 48;}
			case(65){iCumRate += 48;}
			case(66){iCumRate += 48;}
			case(67){iCumRate += 48;}
			case(68){iCumRate += 48;}
			case(69){iCumRate += 48;}
			case(70){iCumRate += 48;}
			case(71){iCumRate += 48;}
			case(72){iCumRate += 48;}
			case(73){iCumRate += 48;}
			case(74){iCumRate += 64;}
			case(75){iCumRate += 64;}
			case(76){iCumRate += 64;}
			case(77){iCumRate += 64;}
			case(78){iCumRate += 64;}
			case(79){iCumRate += 64;}
			case(80){iCumRate += 64;}
			case(81){iCumRate += 64;}
			case(82){iCumRate += 64;}
			case(83){iCumRate += 64;}
			case(84){iCumRate += 64;}
			case(85){iCumRate += 64;}
			case(86){iCumRate += 80;}
			case(87){iCumRate += 80;}
			case(88){iCumRate += 80;}
			case(89){iCumRate += 80;}
			case(90){iCumRate += 80;}
			case(91){iCumRate += 96;}
			case(92){iCumRate += 96;}
			case(93){iCumRate += 96;}
			case(94){iCumRate += 96;}
			case(95){iCumRate += 96;}
			case(96){iCumRate += 96;}
			case(97){iCumRate += 96;}
			case(98){iCumRate += 96;}
			case(99){iCumRate += 96;}
			case(100){iCumRate += 96;}
			case(101){iCumRate += 96;}
			case(102){iCumRate += 96;}
			case(103){iCumRate += 128;}
			case(104){iCumRate += 112;}
			case(105){iCumRate += 112;}
			case(106){iCumRate += 112;}
			case(107){iCumRate += 112;}
			case(108){iCumRate += 112;}
			case(109){iCumRate += 112;}
			case(110){iCumRate += 112;}
			case(111){iCumRate += 112;}
			case(112){iCumRate += 112;}
			case(113){iCumRate += 112;}
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:14049`; itemArray.Add(itemString);} //0.021235931 야만적인 여우 갑옷 (남성용)
				case(1){itemString = `id:14050`; itemArray.Add(itemString);} //0.021235931 야만적인 여우 갑옷 (여성용)
				case(2){itemString = `id:16055`; itemArray.Add(itemString);} //0.021235931 야만적인 여우 장갑 (남성용)
				case(3){itemString = `id:16056`; itemArray.Add(itemString);} //0.021235931 야만적인 여우 장갑 (여성용)
				case(4){itemString = `id:14047`; itemArray.Add(itemString);} //0.021235931 불꽃 문양 레더 아머 (남성용)
				case(5){itemString = `id:14048`; itemArray.Add(itemString);} //0.021235931 불꽃 문양 레더 아머 (여성용)
				case(6){itemString = `id:16054`; itemArray.Add(itemString);} //0.021235931 불꽃 문양 레더 글러브
				case(7){itemString = `id:17130`; itemArray.Add(itemString);} //0.021235931 불꽃 문양 레더 부츠
				case(8){itemString = `id:18559`; itemArray.Add(itemString);} //0.021235931 불꽃 문양 레더 캡
				case(9){itemString = `id:15323`; itemArray.Add(itemString);} //0.021235931 알라딘 코스튬
				case(10){itemString = `id:18562`; itemArray.Add(itemString);} //0.021235931 알라딘 모자
				case(11){itemString = `id:15324`; itemArray.Add(itemString);} //0.021235931 자스민 코스튬
				case(12){itemString = `id:18563`; itemArray.Add(itemString);} //0.021235931 자스민 마스크
				case(13){itemString = `id:17130`; itemArray.Add(itemString);} //0.042471862 알라딘 슈즈
				case(14){itemString = `id:15234`; itemArray.Add(itemString);} //0.042471862 엘레건트 고딕 슈트
				case(15){itemString = `id:15269`; itemArray.Add(itemString);} //0.042471862 항아의 날개 옷
				case(16){itemString = `id:15252`; itemArray.Add(itemString);} //0.042471862 집사 의상
				case(17){itemString = `id:15251`; itemArray.Add(itemString);} //0.042471862 메이드 의상 롱타입
				case(18){itemString = `id:18176`; itemArray.Add(itemString);} //0.042471862 메이드 머리띠
				case(19){itemString = `id:40227`; itemArray.Add(itemString);} //0.042471862 디티스 성마 원드
				case(20){itemString = `id:40228`; itemArray.Add(itemString);} //0.042471862 레미니아 성월의 검
				case(21){itemString = `id:40229`; itemArray.Add(itemString);} //0.042471862 샤오란엔 기사의 활
				case(22){itemString = `id:40230`; itemArray.Add(itemString);} //0.042471862 여월비설 단자반접
				case(23){itemString = `id:14043`; itemArray.Add(itemString);} //0.084943725 비토 크럭스 아머
				case(24){itemString = `id:18182`; itemArray.Add(itemString);} //0.084943725 항아의 머리 장식
				case(25){itemString = `id:18548`; itemArray.Add(itemString);} //0.084943725 @더스틴 실버 나이트 헬름
				case(26){itemString = `id:18549`; itemArray.Add(itemString);} //0.084943725 @드래곤 펠릭스 헬름
				case(27){itemString = `id:19027`; itemArray.Add(itemString);} //0.084943725 @할로윈 고스트 로브
				case(28){itemString = `id:19028`; itemArray.Add(itemString);} //0.084943725 @할로윈 위치 로브
				case(29){itemString = `id:40171`; itemArray.Add(itemString);} //0.084943725 마사무네
				case(30){itemString = `id:40193`; itemArray.Add(itemString);} //0.084943725 무라마사
				case(31){itemString = `id:40195`; itemArray.Add(itemString);} //0.084943725 요시미츠
				case(32){itemString = `id:46010`; itemArray.Add(itemString);} //0.084943725 @드래곤 실드
				case(33){itemString = `id:18187`; itemArray.Add(itemString);} //0.084943725 커다란 리본
				case(34){itemString = `id:18188`; itemArray.Add(itemString);} //0.084943725 안대
				case(35){itemString = `id:18189`; itemArray.Add(itemString);} //0.084943725 카우보이 모자
				case(36){itemString = `id:15220`; itemArray.Add(itemString);} //0.16988745 @애드미럴 코트(남성용)
				case(37){itemString = `id:15221`; itemArray.Add(itemString);} //0.16988745 @애드미럴 코트(여성용)
				case(38){itemString = `id:18154`; itemArray.Add(itemString);} //0.16988745 @애드미럴 모자(남성용)
				case(39){itemString = `id:18155`; itemArray.Add(itemString);} //0.16988745 @애드미럴 모자(여성용)
				case(40){itemString = `id:15174`; itemArray.Add(itemString);} //0.16988745 @코이 퀼트 웨어
				case(41){itemString = `id:15258`; itemArray.Add(itemString);} //0.16988745 @베키 위치 드레스
				case(42){itemString = `id:17525`; itemArray.Add(itemString);} //0.16988745 @비토 크럭스 그리브
				case(43){itemString = `id:15112`; itemArray.Add(itemString);} //0.16988745 @셀리나 스쿨보이룩
				case(44){itemString = `id:15175`; itemArray.Add(itemString);} //0.16988745 여성용 유카타
				case(45){itemString = `id:15176`; itemArray.Add(itemString);} //0.16988745 남성용 유카타
				case(46){itemString = `id:17080`; itemArray.Add(itemString);} //0.339774899 일본 전통 신발
				case(47){itemString = `id:40198`; itemArray.Add(itemString);} //0.339774899 상아검
				case(48){itemString = `id:81130`; itemArray.Add(itemString);} //0.339774899 서큐버스 스탠드 배너1
				case(49){itemString = `id:81131`; itemArray.Add(itemString);} //0.339774899 서큐버스 스탠드 배너2
				case(50){itemString = `id:81132`; itemArray.Add(itemString);} //0.339774899 서큐버스 스탠드 배너3
				case(51){itemString = `id:81133`; itemArray.Add(itemString);} //0.339774899 서큐버스 스탠드 배너4
				case(52){itemString = `id:14027`; itemArray.Add(itemString);} //0.679549798 @브래스트 데코 아머
				case(53){itemString = `id:14028`; itemArray.Add(itemString);} //0.679549798 에스테반 메일(남성용)
				case(54){itemString = `id:14029`; itemArray.Add(itemString);} //0.679549798 에스테반 메일(여성용)
				case(55){itemString = `id:14019`; itemArray.Add(itemString);} //0.679549798 @그레이스 플레이트 아머
				case(56){itemString = `id:19031`; itemArray.Add(itemString);} //0.679549798 @스타라이트 로브
				case(57){itemString = `id:18133`; itemArray.Add(itemString);} //0.679549798 @서클 이어링
				case(58){itemString = `id:18134`; itemArray.Add(itemString);} //0.679549798 @다이아몬드 쉐이프 이어링
				case(59){itemString = `id:18135`; itemArray.Add(itemString);} //0.679549798 @윈드 이어링
				case(60){itemString = `id:13038`; itemArray.Add(itemString);} //0.679549798 @더스틴 실버 나이트 아머
				case(61){itemString = `id:14036`; itemArray.Add(itemString);} //0.679549798 @티오즈 아머(남성용)
				case(62){itemString = `id:14037`; itemArray.Add(itemString);} //0.679549798 @티오즈 아머(여성용)
				case(63){itemString = `id:15113`; itemArray.Add(itemString);} //1.019324697 여성용 검사학교 교복 쇼트타입
				case(64){itemString = `id:15114`; itemArray.Add(itemString);} //1.019324697 남성용 검사학교 교복 롱타입
				case(65){itemString = `id:15180`; itemArray.Add(itemString);} //1.019324697 @아도라 네추럴 네크라인(남성용)
				case(66){itemString = `id:15181`; itemArray.Add(itemString);} //1.019324697 @버터플라이 실크 웨어(여성용)
				case(67){itemString = `id:16524`; itemArray.Add(itemString);} //1.019324697 @더스틴 실버 나이트 뱀브레이스
				case(68){itemString = `id:16531`; itemArray.Add(itemString);} //1.019324697 @티오즈 건틀렛
				case(69){itemString = `id:17517`; itemArray.Add(itemString);} //1.019324697 @더스틴 실버 나이트 그리브
				case(70){itemString = `id:17523`; itemArray.Add(itemString);} //1.019324697 @티오즈 그리브
				case(71){itemString = `id:18131`; itemArray.Add(itemString);} //1.019324697 양모자
				case(72){itemString = `id:18156`; itemArray.Add(itemString);} //1.019324697 고글 모자
				case(73){itemString = `id:18157`; itemArray.Add(itemString);} //1.019324697 고양이 귀 머리띠
				case(74){itemString = `id:46011`; itemArray.Add(itemString);} //1.359099597 귀갑방패
				case(75){itemString = `id:46012`; itemArray.Add(itemString);} //1.359099597 청동방패
				case(76){itemString = `id:46007`; itemArray.Add(itemString);} //1.359099597 헤테로 카이트 실드
				case(77){itemString = `id:46008`; itemArray.Add(itemString);} //1.359099597 라이트 헤테로 카이트 실드
				case(78){itemString = `id:40178`; itemArray.Add(itemString);} //1.359099597 브로드 액스
				case(79){itemString = `id:15116`; itemArray.Add(itemString);} //1.359099597 여성용 마법사 정장
				case(80){itemString = `id:15117`; itemArray.Add(itemString);} //1.359099597 남성용 마법사 정장
				case(81){itemString = `id:15217`; itemArray.Add(itemString);} //1.359099597 에이프런 원피스
				case(82){itemString = `id:15260`; itemArray.Add(itemString);} //1.359099597 @다비 스컷 플래드 웨어(남성용)
				case(83){itemString = `id:15261`; itemArray.Add(itemString);} //1.359099597 @다비 스컷 플래드 웨어(여성용)
				case(84){itemString = `id:16519`; itemArray.Add(itemString);} //1.359099597 초호화 장갑
				case(85){itemString = `id:17100`; itemArray.Add(itemString);} //1.359099597 @다비 스컷 플래드 부츠(여성용)
				case(86){itemString = `id:18075`; itemArray.Add(itemString);} //1.698874496 털 토끼 머리띠5
				case(87){itemString = `id:18080`; itemArray.Add(itemString);} //1.698874496 가죽 토끼 머리띠5
				case(88){itemString = `id:18085`; itemArray.Add(itemString);} //1.698874496 별 토끼 머리띠5
				case(89){itemString = `id:19032`; itemArray.Add(itemString);} //1.698874496 돔 로브
				case(90){itemString = `id:19033`; itemArray.Add(itemString);} //1.698874496 상어 로브
				case(91){itemString = `id:64039 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 금광석 조각
				case(92){itemString = `id:51004 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 생명력 100포션
				case(93){itemString = `id:51009 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 마나 100 포션
				case(94){itemString = `id:51014 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);}  //2.038649395 스태미나 100 포션
				case(95){itemString = `id:51024 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 생명력과 마나 100 포션
				case(96){itemString = `id:51029 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.038649395 생명력과 스태미나 100 포션
				case(97){itemString = `id:55035`; itemArray.Add(itemString);} //2.038649395 빛나는 스톤 바이슨의 석상
				case(98){itemString = `id:55041`; itemArray.Add(itemString);} //2.038649395 빛나는 스톤 하운드의 석상
				case(99){itemString = `id:55048`; itemArray.Add(itemString);} //2.038649395 빛나는 스톤 좀비의 석상
				case(100){itemString = `id:55049`; itemArray.Add(itemString);} //2.038649395 빛나는 스톤 임프의 석상
				case(101){itemString = `id:55061`; itemArray.Add(itemString);} //2.038649395 빛나는 항아리 거미의 석상
				case(102){itemString = `id:55068`; itemArray.Add(itemString);} //2.038649395 빛나는 스톤 가고일의 석상
				case(103){itemString = `id:60025 count:10`; itemArray.Add(itemString);} //2.718199193 고급 가죽
				case(104){itemString = `id:60026 count:10`; itemArray.Add(itemString);} //2.378424294 최고급 가죽
				case(105){itemString = `id:63025 count:5`; itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 대용량 축복의 포션
				case(106){itemString = `id:63027 expire:10080`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 밀랍 날개
				case(107){itemString = `id:63043 count:10`; itemArray.Add(itemString);} //2.378424294 어드밴스드 깃털
				case(108){itemString = `id:64038 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 은광석 조각
				case(109){itemString = `id:64036 count:10`; itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);
				      itemArray.Add(itemString);} //2.378424294 철광석 조각
				case(110){itemString = `id:60041 count:5`; itemArray.Add(itemString);} //2.378424294 마법 금실
				case(111){itemString = `id:60042 count:5`; itemArray.Add(itemString);} //2.378424294 마법 은식
				case(112){itemString = `id:60043 count:5`; itemArray.Add(itemString);} //2.378424294 물안개 비단
				case(113){itemString = `id:91005`; itemArray.Add(itemString);} //2.378424294 전투력 약화 포션
			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}
		++i;
	}	
}
