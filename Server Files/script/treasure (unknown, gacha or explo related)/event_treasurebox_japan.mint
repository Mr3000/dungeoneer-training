////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project Treasure Script
//									이리아 보물상자 (일본 3주년 이벤트)
//
//								dochigun fecit, begins at 2007. 05. 23
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{

	// 이벤트용 처리를 하기 전에 반드시 SetEventType()으로 어떤 이벤트용 상자인지
	// 명시를 해주어야 한다.
	// 명시해주지 않으면 기본값으로 'treasurehunting' 이벤트로 세팅된다.
	_this.SetEventType(`treasurehuntingjapan`);
	_this.AddEventItem(GetItemRewardDesc());

}

////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(812485);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0 ){itemDesc = `id:40192`; iCumRate +=1;}//치는 것 칼0.000123079 
			case(1 ){itemDesc = `id:40194`; iCumRate +=1;}//호신용 단도0.000123079 
			case(2 ){itemDesc = `id:40171`; iCumRate +=1;}//마사무네0.000123079 
			case(3 ){itemDesc = `id:40193`; iCumRate +=1;}//무라마사0.000123079 
			case(4 ){itemDesc = `id:40195`; iCumRate +=1;}//요시미츠0.000123079 
			case(5 ){itemDesc = `id:15013`; iCumRate +=5;}//차이나 드레스0.000615396 
			case(6 ){itemDesc = `id:15017`; iCumRate +=5;}//차이나 드레스0.000615396 
			case(7 ){itemDesc = `id:15055`; iCumRate +=10;}//레더 미니 원피스0.001230792 
			case(8 ){itemDesc = `id:15056`; iCumRate +=10;}//레더 미니 원피스 링 타입0.001230792 
			case(9 ){itemDesc = `id:15057`; iCumRate +=10;}//롱 피혁제 코트 (광택 없음)0.001230792 
			case(10 ){itemDesc = `id:15059`; iCumRate +=10;}//타크스탄크툽반바지0.001230792 
			case(11 ){itemDesc = `id:15060`; iCumRate +=10;}//슬림 이너 로브 웨어0.001230792 
			case(12 ){itemDesc = `id:15062`; iCumRate +=10;}//지그재그 튜닉0.001230792 
			case(13 ){itemDesc = `id:15063`; iCumRate +=10;}//층 프릴 원피스0.001230792 
			case(14 ){itemDesc = `id:15064`; iCumRate +=10;}//아이돌 리본 드레스0.001230792 
			case(15 ){itemDesc = `id:15066`; iCumRate +=10;}//루이스 베스트 에어0.001230792 
			case(16 ){itemDesc = `id:15070`; iCumRate +=10;}//스탠드 칼라 슬리브리스0.001230792 
			case(17 ){itemDesc = `id:15074`; iCumRate +=10;}//루이스 성직자 코트0.001230792 
			case(18 ){itemDesc = `id:15075`; iCumRate +=10;}//세리나레디드레스0.001230792 
			case(19 ){itemDesc = `id:15095`; iCumRate +=10;}//세리나오푼레자쟈켓트0.001230792 
			case(20 ){itemDesc = `id:15096`; iCumRate +=10;}//세리나세크시베아룩크0.001230792 
			case(21 ){itemDesc = `id:15107`; iCumRate +=10;}//몬고잣후르코트0.001230792 
			case(22 ){itemDesc = `id:15109`; iCumRate +=10;}//티핑 슈트0.001230792 
			case(23 ){itemDesc = `id:15110`; iCumRate +=10;}//세리나스트0.001230792 
			case(24 ){itemDesc = `id:15112`; iCumRate +=10;}//세리나스크르보이룩크0.001230792 
			case(25 ){itemDesc = `id:15113`; iCumRate +=10;}//여성용 검사 학교 제복 쇼트 타입0.001230792 
			case(26 ){itemDesc = `id:15114`; iCumRate +=10;}//남성용 검사 학교 제복 롱타이브0.001230792 
			case(27 ){itemDesc = `id:15115`; iCumRate +=10;}//트르디쟈그드미니스카트0.001230792 
			case(28 ){itemDesc = `id:15116`; iCumRate +=10;}//여성용 마도 슈트0.001230792 
			case(29 ){itemDesc = `id:15117`; iCumRate +=10;}//남성용 마도 슈트0.001230792 
			case(30 ){itemDesc = `id:15118`; iCumRate +=10;}//남성용 검사 학교 제복 쇼트 타입0.001230792 
			case(31 ){itemDesc = `id:15119`; iCumRate +=10;}//여성용 검사 학교 제복 롱타이브0.001230792 
			case(32 ){itemDesc = `id:15127`; iCumRate +=10;}//세리나트라디쇼나르코트0.001230792 
			case(33 ){itemDesc = `id:15128`; iCumRate +=10;}//투톤 원조 드레스0.001230792 
			case(34 ){itemDesc = `id:15131`; iCumRate +=10;}//핀 에이프런 스커트0.001230792 
			case(35 ){itemDesc = `id:15132`; iCumRate +=10;}//내츄럴 베스트 에어0.001230792 
			case(36 ){itemDesc = `id:13018`; iCumRate +=10;}//더블 링 메일0.001230792 
			case(37 ){itemDesc = `id:13031`; iCumRate +=10;}//스파이카시르바프레이트아마0.001230792 
			case(38 ){itemDesc = `id:13032`; iCumRate +=10;}//발렌시아 크로스 라인 플레이트 아모(여성용)0.001230792 
			case(39 ){itemDesc = `id:13033`; iCumRate +=10;}//발렌시아 크로스 라인 플레이트 아모(남성용)0.001230792 
			case(40 ){itemDesc = `id:13038`; iCumRate +=10;}//더스틴 실버 나이트 아모0.001230792 
			case(41 ){itemDesc = `id:13043`; iCumRate +=10;}//레미니아성월의 요로이(남성용)0.001230792 
			case(42 ){itemDesc = `id:13044`; iCumRate +=10;}//레미니아성월의 요로이(여성용)0.001230792 
			case(43 ){itemDesc = `id:13045`; iCumRate +=10;}//아릿슈아슈빈아마(남성용)0.001230792 
			case(44 ){itemDesc = `id:13046`; iCumRate +=10;}//아릿슈아슈빈아마(여성용)0.001230792 
			case(45 ){itemDesc = `id:13047`; iCumRate +=10;}//키리누스진하후프레이트아마(남성용)0.001230792 
			case(46 ){itemDesc = `id:13048`; iCumRate +=10;}//키리누스진하후프레이트아마(여성용)0.001230792 
			case(47 ){itemDesc = `id:14015`; iCumRate +=10;}//크라우스 머플러 레더 메일0.001230792 
			case(48 ){itemDesc = `id:14016`; iCumRate +=10;}//크로스 벨트 피혁제 코트0.001230792 
			case(49 ){itemDesc = `id:14017`; iCumRate +=10;}//쓰리 벨트 레더 메일0.001230792 
			case(50 ){itemDesc = `id:15137`; iCumRate +=10;}//세리나하후쟈켓트코트0.001230792 
			case(51 ){itemDesc = `id:14025`; iCumRate +=10;}//카메르스피릿트아마(남성용)0.001230792 
			case(52 ){itemDesc = `id:14026`; iCumRate +=10;}//카메르스피릿트아마(여성용)0.001230792 
			case(53 ){itemDesc = `id:15259`; iCumRate +=10;}//오데리아위자드스트0.001230792 
			case(54 ){itemDesc = `id:15261`; iCumRate +=10;}//다비스콧트프렛드웨아(여성용)0.001230792 
			case(55 ){itemDesc = `id:15260`; iCumRate +=10;}//다비스콧트프렛드웨아(남성용)0.001230792 
			case(56 ){itemDesc = `id:64511`; iCumRate +=10;}//썬더의 본 제1장 [서문]0.001230792 
			case(57 ){itemDesc = `id:64512`; iCumRate +=10;}//썬더의 본 제2장 [마법의 원리]0.001230792 
			case(58 ){itemDesc = `id:64513`; iCumRate +=10;}//썬더의 본 제3장 [실제로 사용하는 썬더]0.001230792 
			case(59 ){itemDesc = `id:64514`; iCumRate +=10;}//썬더의 본 제4장 [마법의 활용]0.001230792 
			case(60 ){itemDesc = `id:64515`; iCumRate +=10;}//썬더의 본 제5장 [마지막에]0.001230792 
			case(61 ){itemDesc = `id:64521 suffix:40021`; iCumRate +=10;}//파이어 볼의 본 1 페이지0.001230792 
			case(62 ){itemDesc = `id:64522 suffix:40022`; iCumRate +=10;}//파이어 볼의 본 2 페이지0.001230792 
			case(63 ){itemDesc = `id:64523 suffix:40023`; iCumRate +=10;}//파이어 볼의 본 3 페이지0.001230792 
			case(64 ){itemDesc = `id:64524 suffix:40024`; iCumRate +=10;}//파이어 볼의 본 4 페이지0.001230792 
			case(65 ){itemDesc = `id:64525 suffix:40025`; iCumRate +=10;}//파이어 볼의 본 5 페이지0.001230792 
			case(66 ){itemDesc = `id:64526 suffix:40026`; iCumRate +=10;}//파이어 볼의 본 6 페이지0.001230792 
			case(67 ){itemDesc = `id:64527 suffix:40027`; iCumRate +=10;}//파이어 볼의 본 7 페이지0.001230792 
			case(68 ){itemDesc = `id:64528 suffix:40028`; iCumRate +=10;}//파이어 볼의 본 8 페이지0.001230792 
			case(69 ){itemDesc = `id:64529 suffix:40029`; iCumRate +=10;}//파이어 볼의 본 9 페이지0.001230792 
			case(70 ){itemDesc = `id:64530 suffix:40030`; iCumRate +=10;}//파이어 볼의 본 10 페이지0.001230792 
			case(71 ){itemDesc = `id:64501`; iCumRate +=10;}//아이스스피아의 본쳅터 1 서문0.001230792 
			case(72 ){itemDesc = `id:64502`; iCumRate +=10;}//아이스스피아의 본쳅터 2 아이스스피아의 발생 원리0.001230792 
			case(73 ){itemDesc = `id:64503`; iCumRate +=10;}//아이스스피아의 본쳅터 3 아이스스피아의 속성0.001230792 
			case(74 ){itemDesc = `id:64504`; iCumRate +=10;}//아이스스피아의 본쳅터 4 아이스스피아의 실제0.001230792 
			case(75 ){itemDesc = `id:64505`; iCumRate +=10;}//아이스스피아의 본쳅터 5 마지막에0.001230792 
			case(76 ){itemDesc = `id:64506`; iCumRate +=10;}//탐험 일지 1 페이지0.001230792 
			case(77 ){itemDesc = `id:64508`; iCumRate +=10;}//탐험 일지 3 페이지0.001230792 
			case(78 ){itemDesc = `id:64510`; iCumRate +=10;}//탐험 일지 5 페이지0.001230792 
			case(79 ){itemDesc = `id:64551 suffix:40051`; iCumRate +=10;}//아로리보르바의 본 1 페이지0.001230792 
			case(80 ){itemDesc = `id:64552 suffix:40052`; iCumRate +=10;}//아로리보르바의 본 2 페이지0.001230792 
			case(81 ){itemDesc = `id:64553 suffix:40053`; iCumRate +=10;}//아로리보르바의 본 3 페이지0.001230792 
			case(82 ){itemDesc = `id:64554 suffix:40054`; iCumRate +=10;}//아로리보르바의 본 4 페이지0.001230792 
			case(83 ){itemDesc = `id:64555 suffix:400553`; iCumRate +=10;}//아로리보르바의 본 5 페이지0.001230792 
			case(84 ){itemDesc = `id:64556 suffix:40056`; iCumRate +=10;}//아로리보르바의 본 6 페이지0.001230792 
			case(85 ){itemDesc = `id:64557 suffix:400573`; iCumRate +=10;}//아로리보르바의 본 7 페이지0.001230792 
			case(86 ){itemDesc = `id:64558 suffix:40058`; iCumRate +=10;}//아로리보르바의 본 8 페이지0.001230792 
			case(87 ){itemDesc = `id:64559 suffix:40059`; iCumRate +=10;}//아로리보르바의 본 9 페이지0.001230792 
			case(88 ){itemDesc = `id:64560 suffix:40060`; iCumRate +=10;}//아로리보르바의 본 10 페이지0.001230792 
			case(89 ){itemDesc = `id:62005 prefix:20822`; iCumRate +=10;}//스노우 드롭0.001230792 
			case(90 ){itemDesc = `id:62005 prefix:20622`; iCumRate +=10;}//단호했다0.001230792 
			case(91 ){itemDesc = `id:62005 prefix:20213`; iCumRate +=10;}//쾌활한0.001230792 
			case(92 ){itemDesc = `id:62005 prefix:207`; iCumRate +=10;}//폭스0.001230792 
			case(93 ){itemDesc = `id:62005 suffix:30501`; iCumRate +=10;}//자이언트0.001230792 
			case(94 ){itemDesc = `id:62005 suffix:30702`; iCumRate +=10;}//레이분0.001230792 
			case(95 ){itemDesc = `id:62005 suffix:30626`; iCumRate +=10;}//용감한0.001230792 
			case(96 ){itemDesc = `id:62005 suffix:10604`; iCumRate +=10;}//농민의0.001230792 
			case(97 ){itemDesc = `id:62005 suffix:11104`; iCumRate +=10;}//위크네스0.001230792 
			case(98 ){itemDesc = `id:62005 suffix:30624`; iCumRate +=10;}//산자시0.001230792 
			case(99 ){itemDesc = `id:62005 suffix:30103`; iCumRate +=10;}//머문다0.001230792 
			case(100 ){itemDesc = `id:62005 suffix:30204`; iCumRate +=10;}//잔존의0.001230792 
			case(101 ){itemDesc = `id:62005 suffix:30314`; iCumRate +=10;}//정지한다0.001230792 
			case(102 ){itemDesc = `id:62005 prefix:20503`; iCumRate +=10;}//강옥0.001230792 
			case(103 ){itemDesc = `id:62005 suffix:30615`; iCumRate +=10;}//곤란의0.001230792 
			case(104 ){itemDesc = `id:62005 suffix:30813`; iCumRate +=10;}//불편의0.001230792 
			case(105 ){itemDesc = `id:62005 suffix:30716`; iCumRate +=10;}//장해의0.001230792 
			case(106 ){itemDesc = `id:62005 suffix:30717`; iCumRate +=10;}//해의0.001230792 
			case(107 ){itemDesc = `id:62005 suffix:30814`; iCumRate +=10;}//지장의0.001230792 
			case(108 ){itemDesc = `id:62005 prefix:20504`; iCumRate +=10;}//금강석0.001230792 
			case(109 ){itemDesc = `id:62005 prefix:20108`; iCumRate +=10;}//키위0.001230792 
			case(110 ){itemDesc = `id:62005 prefix:20304`; iCumRate +=10;}//타조0.001230792 
			case(111 ){itemDesc = `id:62005 prefix:20505`; iCumRate +=10;}//리자드0.001230792 
			case(112 ){itemDesc = `id:62005 prefix:20508`; iCumRate +=10;}//이상하다0.001230792 
			case(113 ){itemDesc = `id:62005 prefix:20618`; iCumRate +=10;}//헤맨다0.001230792 
			case(114 ){itemDesc = `id:62005 prefix:20718`; iCumRate +=10;}//기묘한0.001230792 
			case(115 ){itemDesc = `id:62005 prefix:20209`; iCumRate +=10;}//몽구스0.001230792 
			case(116 ){itemDesc = `id:62005 prefix:20409`; iCumRate +=10;}//페넥크0.001230792 
			case(117 ){itemDesc = `id:62005 prefix:20615`; iCumRate +=10;}//사막 거미0.001230792 
			case(118 ){itemDesc = `id:62005 prefix:20212`; iCumRate +=10;}//기괴한0.001230792 
			case(119 ){itemDesc = `id:62005 prefix:20412`; iCumRate +=10;}//이상한0.001230792 
			case(120 ){itemDesc = `id:62005 prefix:20619`; iCumRate +=10;}//드물다0.001230792 
			case(121 ){itemDesc = `id:62005 prefix:20110`; iCumRate +=10;}//평원의0.001230792 
			case(122 ){itemDesc = `id:62005 prefix:20306`; iCumRate +=10;}//초원의0.001230792 
			case(123 ){itemDesc = `id:62005 prefix:20506`; iCumRate +=10;}//고원의0.001230792 
			case(124 ){itemDesc = `id:62005 prefix:20109`; iCumRate +=10;}//야생마0.001230792 
			case(125 ){itemDesc = `id:62005 prefix:20210`; iCumRate +=10;}//트키노와그마0.001230792 
			case(126 ){itemDesc = `id:62005 prefix:20305`; iCumRate +=10;}//마스크 고블린0.001230792 
			case(127 ){itemDesc = `id:62005 prefix:20211`; iCumRate +=10;}//계곡의0.001230792 
			case(128 ){itemDesc = `id:62005 prefix:20410`; iCumRate +=10;}//숲의0.001230792 
			case(129 ){itemDesc = `id:62005 prefix:20616`; iCumRate +=10;}//강의0.001230792 
			case(130 ){itemDesc = `id:62005 prefix:20411`; iCumRate +=10;}//웅덩이의0.001230792 
			case(131 ){itemDesc = `id:62005 prefix:20507`; iCumRate +=10;}//연못의0.001230792 
			case(132 ){itemDesc = `id:62005 prefix:20617`; iCumRate +=10;}//호수의0.001230792 
			case(133 ){itemDesc = `id:62005 suffix:30316`; iCumRate +=10;}//버스트 솔저0.001230792 
			case(134 ){itemDesc = `id:62005 suffix:30632`; iCumRate +=10;}//버스트 나이트0.001230792 
			case(135 ){itemDesc = `id:62005 suffix:30417`; iCumRate +=10;}//마나마지살0.001230792 
			case(136 ){itemDesc = `id:62005 suffix:30525`; iCumRate +=10;}//마나사마나0.001230792 
			case(137 ){itemDesc = `id:62005 suffix:30206`; iCumRate +=10;}//포이즌아챠0.001230792 
			case(138 ){itemDesc = `id:62005 suffix:30104`; iCumRate +=10;}//멧돼지0.001230792 
			case(139 ){itemDesc = `id:62005 suffix:30105`; iCumRate +=10;}//정신 일도0.001230792 
			case(140 ){itemDesc = `id:62005 prefix:21410`; iCumRate +=10;}//기울었다0.001230792 
			case(141 ){itemDesc = `id:62005 prefix:21408`; iCumRate +=10;}//풍정의0.001230792 
			case(142 ){itemDesc = `id:62005 suffix:30106`; iCumRate +=10;}//혼합했다0.001230792 
			case(143 ){itemDesc = `id:62005 prefix:21412`; iCumRate +=10;}//칼라0.001230792 
			case(144 ){itemDesc = `id:62005 suffix:30107`; iCumRate +=10;}//구원자의0.001230792 
			case(145 ){itemDesc = `id:62005 suffix: 20105`; iCumRate +=10;}//소박한0.001230792 
			case(146 ){itemDesc = `id:62005 suffix: 20101`; iCumRate +=10;}//아마추어0.001230792 
			case(147 ){itemDesc = `id:62005 suffix: 30205`; iCumRate +=10;}//삼0.001230792 
			case(148 ){itemDesc = `id:62005 suffix: 10906`; iCumRate +=10;}//트인크루0.001230792 
			case(149 ){itemDesc = `id:62005 suffix: 30523`; iCumRate +=10;}//대담한0.001230792 
			case(150 ){itemDesc = `id:62005 suffix: 305`; iCumRate +=10;}//정교한0.001230792 
			case(151 ){itemDesc = `id:62005 suffix: 20213`; iCumRate +=10;}//밝은0.001230792 
			case(152 ){itemDesc = `id:62005 suffix: 11204`; iCumRate +=10;}//눈물의0.001230792 
			case(153 ){itemDesc = `id:62005 suffix: 20405`; iCumRate +=10;}//난폭하다0.001230792 
			case(154 ){itemDesc = `id:62005 suffix: 21010`; iCumRate +=10;}//쉿 취한다0.001230792 
			case(155 ){itemDesc = `id:62005 suffix: 20741`; iCumRate +=10;}//뜨겁다0.001230792 
			case(156 ){itemDesc = `id:62005 suffix: 30637`; iCumRate +=10;}//홍수0.001230792 
			case(157 ){itemDesc = `id:62005 suffix: 31306`; iCumRate +=10;}//스칼라0.001230792 
			case(158 ){itemDesc = `manual:20151`; iCumRate +=10;}//펠리칸 프로텍터(도면)0.001230792 
			case(159 ){itemDesc = `id:15061`; iCumRate +=20;}//물결 모양의 클래식 튜닉0.002461584 
			case(160 ){itemDesc = `id:15065`; iCumRate +=20;}//에러 베스트 스커트0.002461584 
			case(161 ){itemDesc = `id:15067`; iCumRate +=20;}//동양식 BUSHI옷0.002461584 
			case(162 ){itemDesc = `id:15073`; iCumRate +=20;}//용소저의 무도옷0.002461584 
			case(163 ){itemDesc = `id:15108`; iCumRate +=20;}//세크시레이데이스탄크툽0.002461584 
			case(164 ){itemDesc = `id:64050`; iCumRate +=20;}//다이아몬드0.002461584 
			case(165 ){itemDesc = `id:64042`; iCumRate +=50;}//황옥0.006153960 
			case(166 ){itemDesc = `id:64043`; iCumRate +=50;}//스타 사파이어0.006153960 
			case(167 ){itemDesc = `id:64044`; iCumRate +=50;}//에메랄드0.006153960 
			case(168 ){itemDesc = `id:64045`; iCumRate +=50;}//아쿠아 마린0.006153960 
			case(169 ){itemDesc = `id:64046`; iCumRate +=50;}//가닛0.006153960 
			case(170 ){itemDesc = `id:64047`; iCumRate +=50;}//쟈스파0.006153960 
			case(171 ){itemDesc = `id:64048`; iCumRate +=50;}//루비0.006153960 
			case(172 ){itemDesc = `id:64049`; iCumRate +=50;}//스피넬0.006153960 
			case(173 ){itemDesc = `id:15008`; iCumRate +=60;}//검사 학교 제복0.007384752 
			case(174 ){itemDesc = `id:15037`; iCumRate +=60;}//검사 학교 제복0.007384752 
			case(175 ){itemDesc = `id:15111`; iCumRate +=60;}//포크 룩 에어0.007384752 
			case(176 ){itemDesc = `id:13006`; iCumRate +=100;}//플레이트 메일0.012307920 
			case(177 ){itemDesc = `id:13010`; iCumRate +=100;}//라운드포르드론체메일0.012307920 
			case(178 ){itemDesc = `id:13012`; iCumRate +=100;}//스케이르아마0.012307920 
			case(179 ){itemDesc = `id:13015`; iCumRate +=100;}//방어 암 다인0.012307920 
			case(180 ){itemDesc = `id:13017`; iCumRate +=100;}//서코트 체인 메일0.012307920 
			case(181 ){itemDesc = `id:15134`; iCumRate +=100;}//고딕 베이직 슈트0.012307920 
			case(182 ){itemDesc = `id:15135`; iCumRate +=100;}//치크 슈트0.012307920 
			case(183 ){itemDesc = `id:15136`; iCumRate +=100;}//고딕 레이스 스커트0.012307920 
			case(184 ){itemDesc = `id:15138`; iCumRate +=100;}//트르디한팅스트0.012307920 
			case(185 ){itemDesc = `id:15139`; iCumRate +=150;}//쇼우론쥬엔포마르드레스(여성용)0.018461879 
			case(186 ){itemDesc = `id:15140`; iCumRate +=150;}//쇼우론쥬엔포마르스트(남성용)0.018461879 
			case(187 ){itemDesc = `id:15149`; iCumRate +=150;}//기린동 천사의 코트(남성용)0.018461879 
			case(188 ){itemDesc = `id:15150`; iCumRate +=150;}//기린동 천사의 코트(여성용)0.018461879 
			case(189 ){itemDesc = `id:15151`; iCumRate +=150;}//뉴욕 마리오 웨스트 테일러 웨어(남성용)0.018461879 
			case(190 ){itemDesc = `id:15152`; iCumRate +=150;}//뉴욕 마리오 웨스트 테일러 웨어(여성용)0.018461879 
			case(191 ){itemDesc = `id:15153`; iCumRate +=150;}//산드라스나이파스트(남성용)0.018461879 
			case(192 ){itemDesc = `id:15154`; iCumRate +=150;}//산드라스나이파스트(여성용)0.018461879 
			case(193 ){itemDesc = `id:15155`; iCumRate +=150;}//이디카이 성직자 예복(남성용)0.018461879 
			case(194 ){itemDesc = `id:15156`; iCumRate +=150;}//이디카이 성직자 예복(여성용)0.018461879 
			case(195 ){itemDesc = `id:15157`; iCumRate +=150;}//위스 방위군의 옷(남성용)0.018461879 
			case(196 ){itemDesc = `id:15158`; iCumRate +=150;}//위스 방위군의 옷(여성용)0.018461879 
			case(197 ){itemDesc = `id:19018`; iCumRate +=150;}//쟈브신센인페리아르로브0.018461879 
			case(198 ){itemDesc = `id:19019`; iCumRate +=150;}//라카드레이야드마후라로브0.018461879 
			case(199 ){itemDesc = `id:19020`; iCumRate +=150;}//나타네모후모후파코트0.018461879 
			case(200 ){itemDesc = `id:14028`; iCumRate +=150;}//에스테반 메일(남성용)0.018461879 
			case(201 ){itemDesc = `id:14029`; iCumRate +=150;}//에스테반 메일(여성용)0.018461879 
			case(202 ){itemDesc = `id:15180`; iCumRate +=150;}//아드라나츄라르넥크라인(남성용)0.018461879 
			case(203 ){itemDesc = `id:15182`; iCumRate +=150;}//키라베르트스카트0.018461879 
			case(204 ){itemDesc = `id:14042`; iCumRate +=150;}//킬스텐 레더 아모0.018461879 
			case(205 ){itemDesc = `id:40038`; iCumRate +=150;}//라이트닝원드0.018461879 
			case(206 ){itemDesc = `id:40039`; iCumRate +=150;}//아이스 wand0.018461879 
			case(207 ){itemDesc = `id:40040`; iCumRate +=150;}//파이어 wand0.018461879 
			case(208 ){itemDesc = `id:40041`; iCumRate +=150;}//타격용 wand0.018461879 
			case(209 ){itemDesc = `id:14036`; iCumRate +=150;}//티오즈아마(여성용?)0.018461879 
			case(210 ){itemDesc = `id:14037`; iCumRate +=150;}//티오즈아마(남성용?)0.018461879 
			case(211 ){itemDesc = `id:15221`; iCumRate +=150;}//에미로린아드미라르드레스0.018461879 
			case(212 ){itemDesc = `id:15220`; iCumRate +=150;}//에미로린아드미라르코트0.018461879 
			case(213 ){itemDesc = `id:18156`; iCumRate +=150;}//큐아레스고굴  카스 모포0.018461879 
			case(214 ){itemDesc = `id:18154`; iCumRate +=150;}//에미로린아드미라르핫트0.018461879 
			case(215 ){itemDesc = `id:18155`; iCumRate +=150;}//에미로린아드미라르핫트0.018461879 
			case(216 ){itemDesc = `id:19031`; iCumRate +=150;}//알 칼레이도 스타 라이트 로브0.018461879 
			case(217 ){itemDesc = `id:16531`; iCumRate +=150;}//티오즈간트렛트0.018461879 
			case(218 ){itemDesc = `id:17523`; iCumRate +=150;}//티오즈그리브0.018461879 
			case(219 ){itemDesc = `manual:289`; iCumRate +=150;}//형지-는세레부 요츠바의 돼지씨모자0.018461879 
			case(220 ){itemDesc = `manual:292`; iCumRate +=150;}//형지-는세레부 요츠바의 돼지씨웨어(여성용)0.018461879 
			case(221 ){itemDesc = `manual:293`; iCumRate +=150;}//형지-는세레부 요츠바의 돼지씨웨어(남성용)0.018461879 
			case(222 ){itemDesc = `manual:290`; iCumRate +=150;}//형지 브란시 여행자의 볼레로 큰 스카프(자이언트 여성용)0.018461879 
			case(223 ){itemDesc = `manual:294`; iCumRate +=150;}//형지 브란시 여행자의 볼레로(자이언트 여성용)0.018461879 
			case(224 ){itemDesc = `manual:296`; iCumRate +=150;}//형지 브란시 여행자의 볼레로 슈즈(자이언트 여성용)0.018461879 
			case(225 ){itemDesc = `manual:291`; iCumRate +=150;}//형지 브란시 여행자의 볼레로 큰 스카프(자이언트 남성용)0.018461879 
			case(226 ){itemDesc = `manual:295`; iCumRate +=150;}//형지 브란시 여행자의 볼레로(자이언트 남성용)0.018461879 
			case(227 ){itemDesc = `manual:297`; iCumRate +=150;}//형지 브란시 여행자의 볼레로 슈즈(자이언트 남성용)0.018461879 
			case(228 ){itemDesc = `manual:298`; iCumRate +=150;}//형지 에레간트라메라아마(여성)0.018461879 
			case(229 ){itemDesc = `manual:299`; iCumRate +=150;}//형지 에레간트라메라아마(남성)0.018461879 
			case(230 ){itemDesc = `manual:302`; iCumRate +=150;}//형지 에레간트라메라헤르멧트0.018461879 
			case(231 ){itemDesc = `manual:300`; iCumRate +=150;}//형지 에레간트라메라그로브0.018461879 
			case(232 ){itemDesc = `manual:301`; iCumRate +=150;}//형지 에레간트라메라브트0.018461879 
			case(233 ){itemDesc = `manual:20222`; iCumRate +=150;}//형지-하프 가이드 레더 아모(남성)0.018461879 
			case(234 ){itemDesc = `manual:20224`; iCumRate +=150;}//형지 하후가드레자간트렛트(남성)0.018461879 
			case(235 ){itemDesc = `manual:20226`; iCumRate +=150;}//형지 하후가드레자그리브(남성)0.018461879 
			case(236 ){itemDesc = `manual:20223`; iCumRate +=150;}//형지-하프 가이드 레더 아모(여성)0.018461879 
			case(237 ){itemDesc = `manual:20224`; iCumRate +=150;}//형지 하후가드레자간트렛트(여성)0.018461879 
			case(238 ){itemDesc = `manual:20226`; iCumRate +=150;}//형지 하후가드레자그리브(여성)0.018461879 
			case(239 ){itemDesc = `manual:286`; iCumRate +=150;}//형지-버섯 로브0.018461879 
			case(240 ){itemDesc = `manual:287`; iCumRate +=150;}//형지 크레슈세이우치로브(남성용)0.018461879 
			case(241 ){itemDesc = `manual:288`; iCumRate +=150;}//형지 크레슈세이우치로브(여성용)0.018461879 
			case(242 ){itemDesc = `id:15351`; iCumRate +=300;}//견습 연금 술사의 슈트0.036923759 
			case(243 ){itemDesc = `id:17138`; iCumRate +=300;}//견습 연금 술사의 슈즈0.036923759 
			case(244 ){itemDesc = `manual:103`; iCumRate +=300;}//마법 학교 제복(여자)(형지)0.036923759 
			case(245 ){itemDesc = `id:16518`; iCumRate +=900;}//커플 반지 장갑0.110771276 
			case(246 ){itemDesc = `id:16519`; iCumRate +=900;}//초호화 장갑0.110771276 
			case(247 ){itemDesc = `id:50259`; iCumRate +=900;}//맘보0.110771276 
			case(248 ){itemDesc = `id:50256`; iCumRate +=900;}//킹 클럽0.110771276 
			case(249 ){itemDesc = `id:52065`; iCumRate +=900;}//소형 열기구 킷0.110771276 
			case(250 ){itemDesc = `id:52066`; iCumRate +=900;}//대형 열기구 킷0.110771276 
			case(251 ){itemDesc = `id:19003`; iCumRate +=3000;}//트리코롤 로브0.369237586 
			case(252 ){itemDesc = `id:40083`; iCumRate +=3000;}//훅 집토끼 라스0.369237586 
			case(253 ){itemDesc = `id:40017`; iCumRate +=3000;}//만돌린0.369237586 
			case(254 ){itemDesc = `id:64509`; iCumRate +=3000;}//탐험 일지 4 페이지0.369237586 
			case(255 ){itemDesc = `id:40176`; iCumRate +=3000;}//배틀 해머0.369237586 
			case(256 ){itemDesc = `id:40177`; iCumRate +=3000;}//워리아악스0.369237586 
			case(257 ){itemDesc = `id:14035`; iCumRate +=3000;}//필 소스더-아모0.369237586 
			case(258 ){itemDesc = `id:19034`; iCumRate +=3000;}//가르텐크로스오바코트0.369237586 
			case(259 ){itemDesc = `id:19029`; iCumRate +=3000;}//자이언트 베어 로브0.369237586 
			case(260 ){itemDesc = `id:15212`; iCumRate +=3000;}//코린 호-더-웨어0.369237586 
			case(261 ){itemDesc = `id:14035`; iCumRate +=3000;}//필 소스더-아모0.369237586 
			case(262 ){itemDesc = `id:15230`; iCumRate +=3000;}//가르텡렌체크스카트0.369237586 
			case(263 ){itemDesc = `id:14038`; iCumRate +=3000;}//필 소스더-아모 B타입(여성용)0.369237586 
			case(264 ){itemDesc = `id:40236`; iCumRate +=3000;}//에르분쇼트보우0.369237586 
			case(265 ){itemDesc = `id:40237`; iCumRate +=3000;}//에르분롱보우0.369237586 
			case(266 ){itemDesc = `id:40238`; iCumRate +=3000;}//바레스 그레이트 소도0.369237586 
			case(267 ){itemDesc = `id:40239`; iCumRate +=3000;}//페자아트라톨0.369237586 
			case(268 ){itemDesc = `id:40240`; iCumRate +=3000;}//아이안메이스0.369237586 
			case(269 ){itemDesc = `id:40242`; iCumRate +=3000;}//배틀 소도0.369237586 
			case(270 ){itemDesc = `id:40243`; iCumRate +=3000;}//배틀 쇼트 소도0.369237586 
			case(271 ){itemDesc = `id:40244`; iCumRate +=3000;}//베어 너클0.369237586 
			case(272 ){itemDesc = `id:60025`; iCumRate +=3000;}//고급가죽0.369237586 
			case(273 ){itemDesc = `id:60026`; iCumRate +=3000;}//최고급혁0.369237586 
			case(274 ){itemDesc = `id:60054 count:5`; iCumRate +=3000;}//나무의 판0.369237586 
			case(275 ){itemDesc = `id:75118`; iCumRate +=3000;}//승선권0.369237586 
			case(276 ){itemDesc = `id:65017 count:10`; iCumRate +=3000;}//저급 쿠린스토0.369237586 
			case(277 ){itemDesc = `id:65018 count:10`; iCumRate +=3000;}//일반 쿠린스토0.369237586 
			case(278 ){itemDesc = `id:65019 count:10`; iCumRate +=3000;}//고급 쿠린스토0.369237586 
			case(279 ){itemDesc = `id:65020 count:10`; iCumRate +=3000;}//최고급 쿠린스토0.369237586 
			case(280 ){itemDesc = `manual:20102`; iCumRate +=3000;}//단검(도면)0.369237586 
			case(281 ){itemDesc = `manual:20104`; iCumRate +=3000;}//곡괭이(도면)0.369237586 
			case(282 ){itemDesc = `manual:20101`; iCumRate +=3000;}//감자용의 초(도면)0.369237586 
			case(283 ){itemDesc = `manual:20131`; iCumRate +=3000;}//쇼트 소도(도면)0.369237586 
			case(284 ){itemDesc = `manual:20105`; iCumRate +=3000;}//롱 소도(도면)0.369237586 
			case(285 ){itemDesc = `manual:20008`; iCumRate +=3000;}//스파이크 캡(도면)0.369237586 
			case(286 ){itemDesc = `manual:20103`; iCumRate +=3000;}//라운드 쉴드(도면)0.369237586 
			case(287 ){itemDesc = `manual:101`; iCumRate +=3000;}//코레스히라드레스(형지)0.369237586 
			case(288 ){itemDesc = `manual:102`; iCumRate +=3000;}//마법 학교 제복(남자)(형지)0.369237586 
			case(289 ){itemDesc = `manual:104`; iCumRate +=3000;}//치료자 글로브(형지)0.369237586 
			case(290 ){itemDesc = `manual:105`; iCumRate +=3000;}//몬고 모자(형지)0.369237586 
			case(291 ){itemDesc = `manual:114`; iCumRate +=3000;}//큰 스카프(형지)0.369237586 
			case(292 ){itemDesc = `id:40258 count:5`; iCumRate +=3000;}//실린더0.369237586 
			case(293 ){itemDesc = `id:65013 count:5`; iCumRate +=3000;}//록크고렘의 결정0.369237586 
			case(294 ){itemDesc = `id:65014 count:5`; iCumRate +=3000;}//포레스트고렘의 결정0.369237586 
			case(295 ){itemDesc = `id:65015 count:5`; iCumRate +=3000;}//사르파고렘의 결정0.369237586 
			case(296 ){itemDesc = `id:65016 count:5`; iCumRate +=3000;}//화이트고렘의 결정0.369237586 
			case(297 ){itemDesc = `id:64061 count:10`; iCumRate +=3000;}//캐츠아이0.369237586 
			case(298 ){itemDesc = `manual:106`; iCumRate +=3000;}//포포스카트(형지)0.369237586 
			case(299 ){itemDesc = `manual:107`; iCumRate +=3000;}//여성용 몬고 여행옷(형지)0.369237586 
			case(300 ){itemDesc = `manual:108`; iCumRate +=3000;}//남성용 몬고 여행옷(형지)0.369237586 
			case(301 ){itemDesc = `manual:110`; iCumRate +=3000;}//코레스히라스트(형지)0.369237586 
			case(302 ){itemDesc = `id:40032`; iCumRate +=4000;}//가고일 소도0.492316781 
			case(303 ){itemDesc = `id:40204`; iCumRate +=4500;}//고대의 조교지팡이0.553856379 
			case(304 ){itemDesc = `id:19016`; iCumRate +=6000;}//곰로브0.738475172 
			case(305 ){itemDesc = `id:19017`; iCumRate +=6000;}//늑대 로브0.738475172 
			case(306 ){itemDesc = `id:19001`; iCumRate +=9000;}//로브1.107712758 
			case(307 ){itemDesc = `id:19002`; iCumRate +=9000;}//슬렌더 로브1.107712758 
			case(308 ){itemDesc = `id:19012`; iCumRate +=9000;}//트르데이레이야드로브1.107712758 
			case(309 ){itemDesc = `id:19008`; iCumRate +=9000;}//코코 팬더 로브1.107712758 
			case(310 ){itemDesc = `id:19009`; iCumRate +=9000;}//코코 래빗 로브1.107712758 
			case(311 ){itemDesc = `id:19010`; iCumRate +=9000;}//세리나페나르로브1.107712758 
			case(312 ){itemDesc = `id:19014`; iCumRate +=9000;}//트르디레인로브1.107712758 
			case(313 ){itemDesc = `id:40036`; iCumRate +=9000;}//대폭 나이프1.107712758 
			case(314 ){itemDesc = `id:40037`; iCumRate +=9000;}//부쳐 나이프1.107712758 
			case(315 ){itemDesc = `id:40018`; iCumRate +=9000;}//우클레레1.107712758 
			case(316 ){itemDesc = `id:19022`; iCumRate +=9000;}//사샤 로브1.107712758 
			case(317 ){itemDesc = `id:19036`; iCumRate +=9000;}//크루 시즈 로브1.107712758 
			case(318 ){itemDesc = `id:19023`; iCumRate +=9000;}//젠마레이야드로브1.107712758 
			case(319 ){itemDesc = `id:40180`; iCumRate +=9000;}//호프 네일 너클1.107712758 
			case(320 ){itemDesc = `id:40172`; iCumRate +=9000;}//그레이트 소도1.107712758 
			case(321 ){itemDesc = `id:40174`; iCumRate +=9000;}//모닝 스타1.107712758 
			case(322 ){itemDesc = `id:40203`; iCumRate +=9000;}//크루크레 조교지팡이1.107712758 
			case(323 ){itemDesc = `id:62000`; iCumRate +=9000;}//고대의 마법의 가루1.107712758 
			case(324 ){itemDesc = `id:60023`; iCumRate +=9000;}//싼 가죽1.107712758 
			case(325 ){itemDesc = `id:60024`; iCumRate +=9000;}//보통 가죽1.107712758 
			case(326 ){itemDesc = `id:40016`; iCumRate +=12000;}//해머1.476950344 
			case(327 ){itemDesc = `id:40030`; iCumRate +=12000;}//투 핸드 소도1.476950344 
			case(328 ){itemDesc = `id:40031`; iCumRate +=12000;}//크로스보우1.476950344 
			case(329 ){itemDesc = `id:40033`; iCumRate +=12000;}//클레이 모어1.476950344 
			case(330 ){itemDesc = `id:40078`; iCumRate +=12000;}//비펜니스1.476950344 
			case(331 ){itemDesc = `id:40107`; iCumRate +=12000;}//가디안보우1.476950344 
			case(332 ){itemDesc = `id:40179`; iCumRate +=12000;}//스파이크드낙크루1.476950344 
			case(333 ){itemDesc = `id:40175`; iCumRate +=12000;}//그레이트 몰1.476950344 
			case(334 ){itemDesc = `id:19030`; iCumRate +=12000;}//자이언트 전통적 로브1.476950344 
			case(335 ){itemDesc = `id:15207`; iCumRate +=12000;}//자이언트 전통옷1.476950344 
			case(336 ){itemDesc = `id:40258`; iCumRate +=12000;}//실린더1.476950344 
			case(337 ){itemDesc = `id:65002 count:50`; iCumRate +=12000;}//불의 결정1.476950344 
			case(338 ){itemDesc = `id:65003 count:50`; iCumRate +=12000;}//물의 결정1.476950344 
			case(339 ){itemDesc = `id:65004 count:50`; iCumRate +=12000;}//바람의 결정1.476950344 
			case(340 ){itemDesc = `id:65005 count:50`; iCumRate +=12000;}//흙의 결정1.476950344 
			case(341 ){itemDesc = `id:40015`; iCumRate +=15000;}//플룻 쇼트 소도1.846187930 
			case(342 ){itemDesc = `id:40079`; iCumRate +=15000;}//메이스1.846187930 
			case(343 ){itemDesc = `id:64507`; iCumRate +=15000;}//탐험 일지 2 페이지1.846187930 
			case(344 ){itemDesc = `id:40003`; iCumRate +=18000;}//쇼트보우2.215425516 
			case(345 ){itemDesc = `id:40006`; iCumRate +=18000;}//단검2.215425516 
			case(346 ){itemDesc = `id:40004`; iCumRate +=18000;}//류트2.215425516 
			case(347 ){itemDesc = `id:40005`; iCumRate +=18000;}//쇼트 소도2.215425516 
			case(348 ){itemDesc = `id:40007`; iCumRate +=18000;}//한 손도끼2.215425516 
			case(349 ){itemDesc = `id:40010`; iCumRate +=18000;}//롱 소도2.215425516 
			case(350 ){itemDesc = `id:40011`; iCumRate +=18000;}//브로드 소도2.215425516 
			case(351 ){itemDesc = `id:40012`; iCumRate +=18000;}//사생아 소도2.215425516 
			case(352 ){itemDesc = `id:40013`; iCumRate +=18000;}//롱보우2.215425516 
			case(353 ){itemDesc = `id:40014`; iCumRate +=18000;}//콘포짓트보우2.215425516 
			case(354 ){itemDesc = `id:40080`; iCumRate +=18000;}//그라디우스2.215425516 
			case(355 ){itemDesc = `id:40081`; iCumRate +=18000;}//레자롱보우2.215425516 
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
			DebugOut(`보물상자에 `+itemDesc+` 넣음`);
			return itemDesc;
		}
		
		++i;
	}
	return `id:51003 count:1`; //아이템이 안나왔다...
}
////////////////////////////////////////////////////////////////////////////////
server string GetMonsterRace()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(812485);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `Skeleton`; iCumRate += 10000;} //스켈레톤11.62750137
			case(1){RaceDesc = `SkeletonSoldier`; iCumRate += 8000;} //스켈레톤 병사9.302001093
			case(2){RaceDesc = `SkeletonArmorA`; iCumRate += 5000;} //스켈레톤5.813750683
			case(3){RaceDesc = `SkeletonArmorB`; iCumRate += 5000;} //스켈레톤5.813750683
			case(4){RaceDesc = `PoisonSkeletonSoldier`; iCumRate += 5000;} //포이즌 스켈레톤 병사5.813750683
			case(5){RaceDesc = `SkeletonArmorC`; iCumRate += 5000;} //스켈레톤5.813750683
			case(6){RaceDesc = `MetalSkeleton`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(7){RaceDesc = `MetalSkeletonArmorA`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(8){RaceDesc = `MetalSkeletonArmorB`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(9){RaceDesc = `RedSkeleton`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(10){RaceDesc = `RedSkeletonArmorA`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(11){RaceDesc = `RedSkeletonArmorB`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(12){RaceDesc = `GiantSkeleton`; iCumRate += 2000;} //거대 스켈레톤2.325500273
			case(13){RaceDesc = `FlyingSword`; iCumRate += 2000;} //플라잉 소드2.325500273
			case(14){RaceDesc = `RedSkeletonArmorC`; iCumRate += 2000;} //레드 스켈레톤2.325500273
			case(15){RaceDesc = `MetalSkeletonArmorC`; iCumRate += 2000;} //메탈 스켈레톤2.325500273
			case(16){RaceDesc = `SkeletonLaghodessa`; iCumRate += 2000;} //해골 라고데사2.325500273
			case(17){RaceDesc = `GhostArmor`; iCumRate += 1000;} //고스트 아머1.162750137
			case(18){RaceDesc = `BlackSpider`; iCumRate += 1000;} //검은거미1.162750137
			case(19){RaceDesc = `RedSpider`; iCumRate += 1000;} //붉은거미1.162750137
			case(20){RaceDesc = `GiantSpider`; iCumRate += 1000;} //거대거미1.162750137
			case(21){RaceDesc = `SickleLaghodessa`; iCumRate += 1000;} //낫 라고데사1.162750137
			case(22){RaceDesc = `SpikeLaghodessa`; iCumRate += 1000;} //가시 라고데사1.162750137
			case(23){RaceDesc = `BrownTownRat`; iCumRate += 1000;} //갈색 도시쥐1.162750137
			case(24){RaceDesc = `GrayTownRat`; iCumRate += 1000;} //회색 도시쥐1.162750137
			case(25){RaceDesc = `CountryRat`; iCumRate += 1000;} //시골쥐1.162750137
			case(26){RaceDesc = `BlackTownRat`; iCumRate += 1000;} //검은 도시쥐1.162750137
			case(27){RaceDesc = `LittleCountryRat`; iCumRate += 1000;} //작은 시골쥐1.162750137
			case(28){RaceDesc = `BrownSnake`; iCumRate += 1000;} //갈색 뱀1.162750137
			case(29){RaceDesc = `BlueSnake`; iCumRate += 1000;} //청색 뱀1.162750137
			case(30){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(31){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(32){RaceDesc = `GiantWorm4`; iCumRate += 1000;} //자이언트 웜1.162750137
			case(33){RaceDesc = `Spine_Earthworm`; iCumRate += 1000;} //가시 지렁이1.162750137
			case(34){RaceDesc = `GiantImp`; iCumRate += 1;} //거대 임프0.00116275
			case(35){RaceDesc = `GiantSkeletonImp`; iCumRate += 1;} //거대 스켈레톤 임프0.00116275
			case(36){RaceDesc = `GolemSoldier`; iCumRate += 1;} //골렘0.00116275
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
			RaceDesc=RaceDesc+`:`+ToString(Random(3));
			DebugOut(`보물상자에 `+RaceDesc+` 배치`);
			return RaceDesc;
		}
		
		++i;
	}
	return `CountryRat:1`; //아이템이 안나왔다...

}
////////////////////////////////////////////////////////////////////////////////
server void  MoneyCount(prop _this)

////////////////////////////////////////////////////////////////////////////////
{
	int money=Random(100);

	if(Random(100)<50) //50% 200골드정도로 불려줌
	{
		money+=100+ Random(100);
	}

	if(Random(100)==0) //1%로 1000골드 불려줌
	{
		money+=1000+ Random(100);
	}
	if(Random(1000)==1) //1/1000로 10000골드 불려줌
	{
		money+=10000+ Random(1000);
	}
	if(Random(5000)==1) //1/5000로 2배
	{
		money=money*2;
	}
	
	int gold=money/1000; //천원자리금덩이수
	int remaingold=money%1000;	//천원안되는돈
	int i;
	for(i=0;i<gold;i++)
	{
		_this.AddItem(`id:2000 count:1000`);
	}
	_this.AddItem(`id:2000 count:`+ToString(remaingold));
}