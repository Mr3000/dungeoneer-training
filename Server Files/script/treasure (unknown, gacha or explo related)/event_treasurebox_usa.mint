////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project Treasure Script
//									이리아 보물상자 (미국 이벤트)
//
//								dochigun fecit, begins at 2009. 02. 06
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
	_this.SetEventType(`treasurehuntingusa`);
	_this.AddEventItem(GetItemRewardDesc());

	_this.AddAnnounceItem(40170);	//	일본식 양손검								0.00099999
	_this.AddAnnounceItem(16022);	//	고양이 손										0.0199998
	_this.AddAnnounceItem(40200);	//	고양이 손모양 방망이				0.0199998
	_this.AddAnnounceItem(19003);	//	@스파이카 실버 플레이트 부츠0.0799992
	_this.AddAnnounceItem(46008);	//	@라이트 헤테로 카이트 실드	0.1499985
	_this.AddAnnounceItem(18044);	//	범죄용 복면									0.1499985
	_this.AddAnnounceItem(16519);	//	초호화 장갑									0.499995
	_this.AddAnnounceItem(40083);	//	@훅 커틀러스								0.499995

}

////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(753285);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){itemDesc = `id:40192 `; iCumRate +=1;} //0.000132752일본식 한손검0.000128306 
			case(1){itemDesc = `id:40194 `; iCumRate +=1;} //0.000132752일본식 단검0.000128306 
			case(2){itemDesc = `id:40171 `; iCumRate +=1;} //0.000132752마사무네0.000128306 
			case(3){itemDesc = `id:40193 `; iCumRate +=1;} //0.000132752무라마사0.000128306 
			case(4){itemDesc = `id:40195 `; iCumRate +=1;} //0.000132752요시미츠0.000128306 
			case(5){itemDesc = `id:15013 `; iCumRate +=5;} //0.000663759차이나 드레스0.000641531 
			case(6){itemDesc = `id:15017 `; iCumRate +=5;} //0.000663759차이나 드레스0.000641531 
			case(7){itemDesc = `id:15055 `; iCumRate +=10;} //0.001327519레더 미니 원피스0.001283063 
			case(8){itemDesc = `id:15056 `; iCumRate +=10;} //0.001327519레더 미니 원피스 링타입0.001283063 
			case(9){itemDesc = `id:15057 `; iCumRate +=10;} //0.001327519롱 레더 코트 무광0.001283063 
			case(10){itemDesc = `id:15059 `; iCumRate +=10;} //0.001327519터크스 탱크탑 반바지0.001283063 
			case(11){itemDesc = `id:15060 `; iCumRate +=10;} //0.001327519슬림 이너로브 웨어0.001283063 
			case(12){itemDesc = `id:15062 `; iCumRate +=10;} //0.001327519지그재그 튜닉0.001283063 
			case(13){itemDesc = `id:15063 `; iCumRate +=10;} //0.001327519레이어드 프릴 원피스0.001283063 
			case(14){itemDesc = `id:15064 `; iCumRate +=10;} //0.001327519아이돌 리본 드레스0.001283063 
			case(15){itemDesc = `id:15066 `; iCumRate +=10;} //0.001327519루이스 베스트 웨어0.001283063 
			case(16){itemDesc = `id:15070 `; iCumRate +=10;} //0.001327519스탠드칼라 슬리브리스0.001283063 
			case(17){itemDesc = `id:15074 `; iCumRate +=10;} //0.001327519루이스 성직자 코트0.001283063 
			case(18){itemDesc = `id:15075 `; iCumRate +=10;} //0.001327519셀리나 레이디 드레스0.001283063 
			case(19){itemDesc = `id:15095 `; iCumRate +=10;} //0.001327519셀리나 오픈 레더 자켓0.001283063 
			case(20){itemDesc = `id:15096 `; iCumRate +=10;} //0.001327519셀리나 섹시 베어룩0.001283063 
			case(21){itemDesc = `id:15107 `; iCumRate +=10;} //0.001327519몬거 더플 코트0.001283063 
			case(22){itemDesc = `id:15109 `; iCumRate +=10;} //0.001327519티핑 수트0.001283063 
			case(23){itemDesc = `id:15110 `; iCumRate +=10;} //0.001327519셀리나 정장0.001283063 
			case(24){itemDesc = `id:15112 `; iCumRate +=10;} //0.001327519셀리나 스쿨보이룩0.001283063 
			case(25){itemDesc = `id:15113 `; iCumRate +=10;} //0.001327519여성용 검사학교 교복 쇼트타입0.001283063 
			case(26){itemDesc = `id:15114 `; iCumRate +=10;} //0.001327519남성용 검사학교 교복 롱타입0.001283063 
			case(27){itemDesc = `id:15115 `; iCumRate +=10;} //0.001327519재기드 미니 스커트0.001283063 
			case(28){itemDesc = `id:15116 `; iCumRate +=10;} //0.001327519여성용 마법사 정장0.001283063 
			case(29){itemDesc = `id:15117 `; iCumRate +=10;} //0.001327519남성용 마법사 정장0.001283063 
			case(30){itemDesc = `id:15118 `; iCumRate +=10;} //0.001327519남성용 검사학교 교복 쇼트타입0.001283063 
			case(31){itemDesc = `id:15119 `; iCumRate +=10;} //0.001327519여성용 검사학교 교복 롱타입0.001283063 
			case(32){itemDesc = `id:15127 `; iCumRate +=10;} //0.001327519셀리나 트래디셔널 코트0.001283063 
			case(33){itemDesc = `id:15128 `; iCumRate +=10;} //0.001327519투 톤 비조 드레스0.001283063 
			case(34){itemDesc = `id:15131 `; iCumRate +=10;} //0.001327519핀 에이프런 스커트0.001283063 
			case(35){itemDesc = `id:15132 `; iCumRate +=10;} //0.001327519내추럴 베스트 웨어0.001283063 
			case(36){itemDesc = `id:13018 `; iCumRate +=10;} //0.001327519더블 링메일0.001283063 
			case(37){itemDesc = `id:13031 `; iCumRate +=10;} //0.001327519스파이카 실버 플레이트 아머0.001283063 
			case(38){itemDesc = `id:13032 `; iCumRate +=10;} //0.001327519발렌시아 크로스 라인 플레이트 아머(여성용)0.001283063 
			case(39){itemDesc = `id:13033 `; iCumRate +=10;} //0.001327519발렌시아 크로스 라인 플레이트 아머(남성용)0.001283063 
			case(40){itemDesc = `id:13038 `; iCumRate +=10;} //0.001327519더스틴 실버 나이트 아머0.001283063 
			case(41){itemDesc = `id:13043 `; iCumRate +=10;} //0.001327519레미니아 성월의 갑옷(남성용)0.001283063 
			case(42){itemDesc = `id:13044 `; iCumRate +=10;} //0.001327519레미니아 성월의 갑옷(여성용)0.001283063 
			case(43){itemDesc = `id:13045 `; iCumRate +=10;} //0.001327519아리쉬 아슈빈 아머(남성용)0.001283063 
			case(44){itemDesc = `id:13046 `; iCumRate +=10;} //0.001327519아리쉬 아슈빈 아머(여성용)0.001283063 
			case(45){itemDesc = `id:13047 `; iCumRate +=10;} //0.001327519키리누스진 하프 플레이트 아머(남성용)0.001283063 
			case(46){itemDesc = `id:13048 `; iCumRate +=10;} //0.001327519키리누스진 하프 플레이트 아머(여성용)0.001283063 
			case(47){itemDesc = `id:14015 `; iCumRate +=10;} //0.001327519클라우스 머플러 레더 메일0.001283063 
			case(48){itemDesc = `id:14016 `; iCumRate +=10;} //0.001327519크로스벨트 레더 코트0.001283063 
			case(49){itemDesc = `id:14017 `; iCumRate +=10;} //0.001327519쓰리벨트 레더 메일0.001283063 
			case(50){itemDesc = `id:15137 `; iCumRate +=10;} //0.001327519셀리나 하프 재킷 코트0.001283063 
			case(51){itemDesc = `id:14025 `; iCumRate +=10;} //0.001327519카멜 스피리트 아머(남성용)0.001283063 
			case(52){itemDesc = `id:14026 `; iCumRate +=10;} //0.001327519카멜 스피리트 아머(여성용)0.001283063 
			case(53){itemDesc = `id:64511 `; iCumRate +=10;} //0.001327519썬더의 책 제1장 0.001283063 
			case(54){itemDesc = `id:64512 `; iCumRate +=10;} //0.001327519썬더의 책 제2장 0.001283063 
			case(55){itemDesc = `id:64513 `; iCumRate +=10;} //0.001327519썬더의 책 제3장 0.001283063 
			case(56){itemDesc = `id:64514 `; iCumRate +=10;} //0.001327519썬더의 책 제4장0.001283063 
			case(57){itemDesc = `id:64515 `; iCumRate +=10;} //0.001327519썬더의 책 제5장0.001283063 
			case(58){itemDesc = `id:64521 suffix:40021`; iCumRate +=10;} //0.001327519파이어볼의 책 　1페이지0.001283063 
			case(59){itemDesc = `id:64522 suffix:40022`; iCumRate +=10;} //0.001327519파이어볼의 책 　2페이지0.001283063 
			case(60){itemDesc = `id:64523 suffix:40023`; iCumRate +=10;} //0.001327519파이어볼의 책 　3페이지0.001283063 
			case(61){itemDesc = `id:64524 suffix:40024`; iCumRate +=10;} //0.001327519파이어볼의 책 　4페이지0.001283063 
			case(62){itemDesc = `id:64525 suffix:40025`; iCumRate +=10;} //0.001327519파이어볼의 책 　5페이지0.001283063 
			case(63){itemDesc = `id:64526 suffix:40026`; iCumRate +=10;} //0.001327519파이어볼의 책 　6페이지0.001283063 
			case(64){itemDesc = `id:64527 suffix:40027`; iCumRate +=10;} //0.001327519파이어볼의 책 　7페이지0.001283063 
			case(65){itemDesc = `id:64528 suffix:40028`; iCumRate +=10;} //0.001327519파이어볼의 책 　8페이지0.001283063 
			case(66){itemDesc = `id:64529 suffix:40029`; iCumRate +=10;} //0.001327519파이어볼의 책 　9페이지0.001283063 
			case(67){itemDesc = `id:64530 suffix:40030`; iCumRate +=10;} //0.001327519파이어볼의 책 　10페이지0.001283063 
			case(68){itemDesc = `id:64501 `; iCumRate +=10;} //0.001327519아이스 스피어의 책  1장0.001283063 
			case(69){itemDesc = `id:64502 `; iCumRate +=10;} //0.001327519아이스 스피어의 책  2장0.001283063 
			case(70){itemDesc = `id:64503 `; iCumRate +=10;} //0.001327519아이스 스피어의 책  3장0.001283063 
			case(71){itemDesc = `id:64504 `; iCumRate +=10;} //0.001327519아이스 스피어의 책  4 장0.001283063 
			case(72){itemDesc = `id:64505 `; iCumRate +=10;} //0.001327519아이스 스피어의 책  5장0.001283063 
			case(73){itemDesc = `id:64506 `; iCumRate +=10;} //0.001327519탐험 일지1페이지0.001283063 
			case(74){itemDesc = `id:64508 `; iCumRate +=10;} //0.001327519탐험 일지3페이지0.001283063 
			case(75){itemDesc = `id:64510 `; iCumRate +=10;} //0.001327519탐험 일지5페이지0.001283063 
			case(76){itemDesc = `id:64551 suffix:40051`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　1페이지0.001283063 
			case(77){itemDesc = `id:64552 suffix:40052`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　2페이지0.001283063 
			case(78){itemDesc = `id:64553 suffix:40053`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　3페이지0.001283063 
			case(79){itemDesc = `id:64554 suffix:40054`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　4페이지0.001283063 
			case(80){itemDesc = `id:64555 suffix:40055`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　5페이지0.001283063 
			case(81){itemDesc = `id:64556 suffix:40056`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　6페이지0.001283063 
			case(82){itemDesc = `id:64557 suffix:40057`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　7페이지0.001283063 
			case(83){itemDesc = `id:64558 suffix:40058`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　8페이지0.001283063 
			case(84){itemDesc = `id:64559 suffix:40059`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　9페이지0.001283063 
			case(85){itemDesc = `id:64560 suffix:40060`; iCumRate +=10;} //0.001327519애로우 리볼버의 책 　10페이지0.001283063 
			case(86){itemDesc = `id:62005 prefix:20822`; iCumRate +=10;} //0.001327519스노드롭0.001283063 
			case(87){itemDesc = `id:62005 prefix:20622`; iCumRate +=10;} //0.001327519단호한0.001283063 
			case(88){itemDesc = `id:62005 prefix:20213`; iCumRate +=10;} //0.001327519쾌활한0.001283063 
			case(89){itemDesc = `id:62005 prefix:207`; iCumRate +=10;} //0.001327519폭스0.001283063 
			case(90){itemDesc = `id:62005 suffix:30501`; iCumRate +=10;} //0.001327519자이언트0.001283063 
			case(91){itemDesc = `id:62005 suffix:30702`; iCumRate +=10;} //0.001327519레이븐0.001283063 
			case(92){itemDesc = `id:62005 suffix:30626`; iCumRate +=10;} //0.001327519용감한0.001283063 
			case(93){itemDesc = `id:62005 suffix:10604`; iCumRate +=10;} //0.001327519농부의0.001283063 
			case(94){itemDesc = `id:62005 suffix:11104`; iCumRate +=10;} //0.001327519위크니스0.001283063 
			case(95){itemDesc = `id:62005 suffix:30624`; iCumRate +=10;} //0.001327519산사나무0.001283063 
			case(96){itemDesc = `id:62005 suffix:30103`; iCumRate +=10;} //0.001327519머무른0.001283063 
			case(97){itemDesc = `id:62005 suffix:30204`; iCumRate +=10;} //0.001327519잔존한0.001283063 
			case(98){itemDesc = `id:62005 suffix:30314`; iCumRate +=10;} //0.001327519정지하는0.001283063 
			case(99){itemDesc = `id:62005 prefix:20503`; iCumRate +=10;} //0.001327519강옥0.001283063 
			case(100){itemDesc = `id:62005 suffix:30615`; iCumRate +=10;} //0.001327519곤란의0.001283063 
			case(101){itemDesc = `id:62005 suffix:30813`; iCumRate +=10;} //0.001327519불편의0.001283063 
			case(102){itemDesc = `id:62005 suffix:30716`; iCumRate +=10;} //0.001327519장애의0.001283063 
			case(103){itemDesc = `id:62005 suffix:30717`; iCumRate +=10;} //0.001327519해의0.001283063 
			case(104){itemDesc = `id:62005 suffix:30814`; iCumRate +=10;} //0.001327519지장의0.001283063 
			case(105){itemDesc = `id:62005 prefix:20504`; iCumRate +=10;} //0.001327519금강석0.001283063 
			case(106){itemDesc = `id:62005 prefix:20108`; iCumRate +=10;} //0.001327519키위0.001283063 
			case(107){itemDesc = `id:62005 prefix:20304`; iCumRate +=10;} //0.001327519타조0.001283063 
			case(108){itemDesc = `id:62005 prefix:20505`; iCumRate +=10;} //0.001327519리자드0.001283063 
			case(109){itemDesc = `id:62005 prefix:20508`; iCumRate +=10;} //0.001327519수상한0.001283063 
			case(110){itemDesc = `id:62005 prefix:20618`; iCumRate +=10;} //0.001327519망설이는0.001283063 
			case(111){itemDesc = `id:62005 prefix:20718`; iCumRate +=10;} //0.001327519이상한0.001283063 
			case(112){itemDesc = `id:62005 prefix:20209`; iCumRate +=10;} //0.001327519몽구스0.001283063 
			case(113){itemDesc = `id:62005 prefix:20409`; iCumRate +=10;} //0.001327519사막여우0.001283063 
			case(114){itemDesc = `id:62005 prefix:20615`; iCumRate +=10;} //0.001327519사막거미0.001283063 
			case(115){itemDesc = `id:62005 prefix:20212`; iCumRate +=10;} //0.001327519괴상한0.001283063 
			case(116){itemDesc = `id:62005 prefix:20412`; iCumRate +=10;} //0.001327519별난0.001283063 
			case(117){itemDesc = `id:62005 prefix:20619`; iCumRate +=10;} //0.001327519특이한0.001283063 
			case(118){itemDesc = `id:62005 prefix:20110`; iCumRate +=10;} //0.001327519평원의0.001283063 
			case(119){itemDesc = `id:62005 prefix:20306`; iCumRate +=10;} //0.001327519초원의0.001283063 
			case(120){itemDesc = `id:62005 prefix:20506`; iCumRate +=10;} //0.001327519고원의0.001283063 
			case(121){itemDesc = `id:62005 prefix:20109`; iCumRate +=10;} //0.001327519야생마0.001283063 
			case(122){itemDesc = `id:62005 prefix:20210`; iCumRate +=10;} //0.001327519반달곰0.001283063 
			case(123){itemDesc = `id:62005 prefix:20305`; iCumRate +=10;} //0.001327519마스크 고블린0.001283063 
			case(124){itemDesc = `id:62005 prefix:20211`; iCumRate +=10;} //0.001327519협곡의0.001283063 
			case(125){itemDesc = `id:62005 prefix:20410`; iCumRate +=10;} //0.001327519숲의0.001283063 
			case(126){itemDesc = `id:62005 prefix:20616`; iCumRate +=10;} //0.001327519강의0.001283063 
			case(127){itemDesc = `id:62005 prefix:20411`; iCumRate +=10;} //0.001327519웅덩이의0.001283063 
			case(128){itemDesc = `id:62005 prefix:20507`; iCumRate +=10;} //0.001327519연못의0.001283063 
			case(129){itemDesc = `id:62005 prefix:20617`; iCumRate +=10;} //0.001327519호수의0.001283063 
			case(130){itemDesc = `manual:20151 `; iCumRate +=10;} //0.001327519펠리칸 프로텍터（도면）0.001283063 
			case(131){itemDesc = `id:15061 `; iCumRate +=20;} //0.002655038물결무늬 옆트임 튜닉0.002566126 
			case(132){itemDesc = `id:15065 `; iCumRate +=20;} //0.002655038엘라 베스트 스커트0.002566126 
			case(133){itemDesc = `id:15067 `; iCumRate +=20;} //0.002655038동양풍 무사복0.002566126 
			case(134){itemDesc = `id:15073 `; iCumRate +=20;} //0.002655038용소저 무도복0.002566126 
			case(135){itemDesc = `id:15108 `; iCumRate +=20;} //0.002655038섹시 레이디스 탱크탑0.002566126 
			case(136){itemDesc = `id:15008 `; iCumRate +=60;} //0.007965113검사학교 교복0.007698378 
			case(137){itemDesc = `id:15037 `; iCumRate +=60;} //0.007965113검사학교 교복0.007698378 
			case(138){itemDesc = `id:15111 `; iCumRate +=60;} //0.007965113포크룩 웨어0.007698378 
			case(139){itemDesc = `id:13006 `; iCumRate +=100;} //0.013275188플레이트 메일0.012830629 
			case(140){itemDesc = `id:13010 `; iCumRate +=100;} //0.013275188라운드 폴드론 체인메일0.012830629 
			case(141){itemDesc = `id:13012 `; iCumRate +=100;} //0.013275188스케일 아머0.012830629 
			case(142){itemDesc = `id:13015 `; iCumRate +=100;} //0.013275188브리건딘0.012830629 
			case(143){itemDesc = `id:13017 `; iCumRate +=100;} //0.013275188서코트 체인메일0.012830629 
			case(144){itemDesc = `id:15134 `; iCumRate +=100;} //0.013275188고딕 베이직 수트0.012830629 
			case(145){itemDesc = `id:15135 `; iCumRate +=100;} //0.013275188시크 수트0.012830629 
			case(146){itemDesc = `id:15136 `; iCumRate +=100;} //0.013275188고딕 레이스 스커트0.012830629 
			case(147){itemDesc = `id:15138 `; iCumRate +=100;} //0.013275188트루디 헌팅 수트0.012830629 
			case(148){itemDesc = `id:15139 `; iCumRate +=150;} //0.019912782샤오롱주엔 예복정장(여성용)0.019245944 
			case(149){itemDesc = `id:15140 `; iCumRate +=150;} //0.019912782샤오롱주엔 예복정장(남성용)0.019245944 
			case(150){itemDesc = `id:15149 `; iCumRate +=150;} //0.019912782키린 겨울 천사의 코트(남성용)0.019245944 
			case(151){itemDesc = `id:15150 `; iCumRate +=150;} //0.019912782키린 겨울 천사의 코트(여성용)0.019245944 
			case(152){itemDesc = `id:15151 `; iCumRate +=150;} //0.019912782뉴욕마리오 웨이스트 테일러 웨어(남성용)0.019245944 
			case(153){itemDesc = `id:15152 `; iCumRate +=150;} //0.019912782뉴욕마리오 웨이스트 테일러 웨어(여성용)0.019245944 
			case(154){itemDesc = `id:15153 `; iCumRate +=150;} //0.019912782산드라 스나이퍼 수트(남성용)0.019245944 
			case(155){itemDesc = `id:15154 `; iCumRate +=150;} //0.019912782산드라 스나이퍼 수트(여성용)0.019245944 
			case(156){itemDesc = `id:15155 `; iCumRate +=150;} //0.019912782이디카이 성직자 예복(남성용)0.019245944 
			case(157){itemDesc = `id:15156 `; iCumRate +=150;} //0.019912782이디카이 성직자 예복(여성용)0.019245944 
			case(158){itemDesc = `id:15157 `; iCumRate +=150;} //0.019912782위스 보위군 의복(남성용)0.019245944 
			case(159){itemDesc = `id:15158 `; iCumRate +=150;} //0.019912782위스 보위군 의복(여성용)0.019245944 
			case(160){itemDesc = `id:19018 `; iCumRate +=150;} //0.019912782자부신선 임페리얼 로브0.019245944 
			case(161){itemDesc = `id:19019 `; iCumRate +=150;} //0.019912782라카드 레이어드 머플러 로브0.019245944 
			case(162){itemDesc = `id:19020 `; iCumRate +=150;} //0.019912782나타네 설산용 코트0.019245944 
			case(163){itemDesc = `id:14028 `; iCumRate +=150;} //0.019912782에스테반 메일(남성용)0.019245944 
			case(164){itemDesc = `id:14029 `; iCumRate +=150;} //0.019912782에스테반 메일(여성용)0.019245944 
			case(165){itemDesc = `id:15180 `; iCumRate +=150;} //0.019912782아도라 네추럴 네크라인(남성용)0.019245944 
			case(166){itemDesc = `id:15182 `; iCumRate +=150;} //0.019912782키라 벨트 스커트0.019245944 
			case(167){itemDesc = `id:40038 `; iCumRate +=150;} //0.019912782라이트닝 원드0.019245944 
			case(168){itemDesc = `id:40039 `; iCumRate +=150;} //0.019912782아이스 원드0.019245944 
			case(169){itemDesc = `id:40040 `; iCumRate +=150;} //0.019912782파이어 원드0.019245944 
			case(170){itemDesc = `id:40041 `; iCumRate +=150;} //0.019912782타격용 원드0.019245944 
			case(171){itemDesc = `id:14036 `; iCumRate +=150;} //0.019912782티오즈 아머(여성용)0.019245944 
			case(172){itemDesc = `id:14037 `; iCumRate +=150;} //0.019912782티오즈 아머(남성용)0.019245944 
			case(173){itemDesc = `id:15221 `; iCumRate +=150;} //0.019912782에드미럴 코트(여성용)0.019245944 
			case(174){itemDesc = `id:15220 `; iCumRate +=150;} //0.019912782에드미럴 코트(남성용)0.019245944 
			case(175){itemDesc = `id:18156 `; iCumRate +=150;} //0.019912782고글 모자0.019245944 
			case(176){itemDesc = `id:18154 `; iCumRate +=150;} //0.019912782에드미럴 모자(남성용)0.019245944 
			case(177){itemDesc = `id:18155 `; iCumRate +=150;} //0.019912782에드미럴 모자(여성용)0.019245944 
			case(178){itemDesc = `id:19031 `; iCumRate +=150;} //0.019912782스타 라이트 로브0.019245944 
			case(179){itemDesc = `id:16531 `; iCumRate +=150;} //0.019912782티오즈 건틀렛0.019245944 
			case(180){itemDesc = `id:17523 `; iCumRate +=150;} //0.019912782티오즈 그리브0.019245944 
			case(181){itemDesc = `manual:103 `; iCumRate +=300;} //0.039825564마법학교 여자교복（옷본）0.038491888 
			case(182){itemDesc = `id:16518 `; iCumRate +=900;} //0.119476692커플 반지 장갑0.115475664 
			case(183){itemDesc = `id:16519 `; iCumRate +=900;} //0.119476692초호화 장갑0.115475664 
			case(184){itemDesc = `id:50259 `; iCumRate +=900;} //0.119476692개복치0.115475664 
			case(185){itemDesc = `id:50256 `; iCumRate +=900;} //0.119476692킹 크랩0.115475664 
			case(186){itemDesc = `id:40017 `; iCumRate +=3000;} //0.39825564만돌린0.384918878 
			case(187){itemDesc = `id:64509 `; iCumRate +=3000;} //0.39825564탐험 일지 4페이지0.384918878 
			case(188){itemDesc = `id:40176 `; iCumRate +=3000;} //0.39825564배틀 해머0.384918878 
			case(189){itemDesc = `id:40177 `; iCumRate +=3000;} //0.39825564워리어 액스0.384918878 
			case(190){itemDesc = `id:14035 `; iCumRate +=3000;} //0.39825564피르타 레더 아머0.384918878 
			case(191){itemDesc = `id:19034 `; iCumRate +=3000;} //0.39825564가르텐 클로스 오버코트0.384918878 
			case(192){itemDesc = `id:19029 `; iCumRate +=3000;} //0.39825564자이언트 베어 로브0.384918878 
			case(193){itemDesc = `id:15212 `; iCumRate +=3000;} //0.39825564콜린 하저 웨어0.384918878 
			case(194){itemDesc = `id:14035 `; iCumRate +=3000;} //0.39825564피르타 레더 아머0.384918878 
			case(195){itemDesc = `id:15230 `; iCumRate +=3000;} //0.39825564가르텐 글렌 체크 스커트0.384918878 
			case(196){itemDesc = `id:14038 `; iCumRate +=3000;} //0.39825564피르타 레더 아머 B타입(여성용)0.384918878 
			case(197){itemDesc = `manual:20102 `; iCumRate +=3000;} //0.39825564단검（도면）0.384918878 
			case(198){itemDesc = `manual:20104 `; iCumRate +=3000;} //0.39825564곡괭이(도면）0.384918878 
			case(199){itemDesc = `manual:20101 `; iCumRate +=3000;} //0.39825564호미（도면）0.384918878 
			case(200){itemDesc = `manual:20131 `; iCumRate +=3000;} //0.39825564숏 소드（도면）0.384918878 
			case(201){itemDesc = `manual:20105 `; iCumRate +=3000;} //0.39825564롱 소드（도면）0.384918878 
			case(202){itemDesc = `manual:20008 `; iCumRate +=3000;} //0.39825564스파이크 캡（도면）0.384918878 
			case(203){itemDesc = `manual:20103 `; iCumRate +=3000;} //0.39825564라운드 실드（도면）0.384918878 
			case(204){itemDesc = `manual:101 `; iCumRate +=3000;} //0.39825564코레스 힐러드레스（옷본）0.384918878 
			case(205){itemDesc = `manual:102 `; iCumRate +=3000;} //0.39825564마법학교 교복（옷본）0.384918878 
			case(206){itemDesc = `manual:104 `; iCumRate +=3000;} //0.39825564코레스 힐러 글러브（옷본）0.384918878 
			case(207){itemDesc = `manual:105 `; iCumRate +=3000;} //0.39825564몬거 모자（옷본）0.384918878 
			case(208){itemDesc = `manual:114 `; iCumRate +=3000;} //0.39825564머리띠（옷본）0.384918878 
			case(209){itemDesc = `manual:106 `; iCumRate +=3000;} //0.39825564포포 스커트（옷본）0.384918878 
			case(210){itemDesc = `manual:107 `; iCumRate +=3000;} //0.39825564몬거 여행자옷(여)（옷본）0.384918878 
			case(211){itemDesc = `manual:108 `; iCumRate +=3000;} //0.39825564몬거 여행자옷(남)（옷본）0.384918878 
			case(212){itemDesc = `manual:110 `; iCumRate +=3000;} //0.39825564코레스 힐러슈트（옷본）0.384918878 
			case(213){itemDesc = `id:40032 `; iCumRate +=4000;} //0.53100752가고일 소드0.513225171 
			case(214){itemDesc = `id:19016 `; iCumRate +=6000;} //0.796511281곰 로브0.769837757 
			case(215){itemDesc = `id:19017 `; iCumRate +=6000;} //0.796511281늑대 로브0.769837757 
			case(216){itemDesc = `id:40036 `; iCumRate +=9000;} //1.194766921만도1.154756635 
			case(217){itemDesc = `id:40037 `; iCumRate +=9000;} //1.194766921푸주칼1.154756635 
			case(218){itemDesc = `id:40018 `; iCumRate +=9000;} //1.194766921우쿨렐레1.154756635 
			case(219){itemDesc = `id:40180 `; iCumRate +=9000;} //1.194766921홉네일 너클1.154756635 
			case(220){itemDesc = `id:40172 `; iCumRate +=9000;} //1.194766921그레이트 소드1.154756635 
			case(221){itemDesc = `id:40174 `; iCumRate +=9000;} //1.194766921모닝구 스타1.154756635 
			case(222){itemDesc = `id:19008 `; iCumRate +=12000;} //1.593022561코코 판다 로브1.539675513 
			case(223){itemDesc = `id:19009 `; iCumRate +=12000;} //1.593022561코코 래빗 로브1.539675513 
			case(224){itemDesc = `id:19010 `; iCumRate +=12000;} //1.593022561셀리나 패널 로브1.539675513 
			case(225){itemDesc = `id:19014 `; iCumRate +=12000;} //1.593022561트루디 레인 로브1.539675513 
			case(226){itemDesc = `id:40016 `; iCumRate +=12000;} //1.593022561해머1.539675513 
			case(227){itemDesc = `id:40030 `; iCumRate +=12000;} //1.593022561투 핸디드 소드1.539675513 
			case(228){itemDesc = `id:40031 `; iCumRate +=12000;} //1.593022561석궁1.539675513 
			case(229){itemDesc = `id:40033 `; iCumRate +=12000;} //1.593022561클레이모어1.539675513 
			case(230){itemDesc = `id:40078 `; iCumRate +=12000;} //1.593022561비펜니스1.539675513 
			case(231){itemDesc = `id:19022 `; iCumRate +=12000;} //1.593022561사샤 로브1.539675513 
			case(232){itemDesc = `id:19023 `; iCumRate +=12000;} //1.593022561젬마 레이어드 로브1.539675513 
			case(233){itemDesc = `id:40107 `; iCumRate +=12000;} //1.593022561가디언 보우1.539675513 
			case(234){itemDesc = `id:40179 `; iCumRate +=12000;} //1.593022561스파이크드 너클1.539675513 
			case(235){itemDesc = `id:40175 `; iCumRate +=12000;} //1.593022561그레이트 말렛1.539675513 
			case(236){itemDesc = `id:19030 `; iCumRate +=12000;} //1.593022561자이언트 트레디셔널 로브1.539675513 
			case(237){itemDesc = `id:15207 `; iCumRate +=12000;} //1.593022561자이언트 전통의복1.539675513 
			case(238){itemDesc = `id:40015 `; iCumRate +=15000;} //1.991278201플루트 숏 소드1.924594392 
			case(239){itemDesc = `id:40079 `; iCumRate +=15000;} //1.991278201메이스1.924594392 
			case(240){itemDesc = `id:64507 `; iCumRate +=15000;} //1.991278201탐험 일지 2페이지1.924594392 
			case(241){itemDesc = `id:40083 `; iCumRate +=15000;} //1.991278201훅 커틀러스1.924594392 
			case(242){itemDesc = `id:40007 `; iCumRate +=18000;} //2.389533842한손도끼2.309513270 
			case(243){itemDesc = `id:40010 `; iCumRate +=18000;} //2.389533842롱 소드2.309513270 
			case(244){itemDesc = `id:40011 `; iCumRate +=18000;} //2.389533842브로드 소드2.309513270 
			case(245){itemDesc = `id:40012 `; iCumRate +=18000;} //2.389533842바스타드 소드2.309513270 
			case(246){itemDesc = `id:40013 `; iCumRate +=18000;} //2.389533842롱 보우2.309513270 
			case(247){itemDesc = `id:40014 `; iCumRate +=18000;} //2.389533842콤포짓 보우2.309513270 
			case(248){itemDesc = `id:40080 `; iCumRate +=18000;} //2.389533842글라디우스2.309513270 
			case(249){itemDesc = `id:40004 `; iCumRate +=21000;} //2.787789482류트2.694432148 
			case(250){itemDesc = `id:40005 `; iCumRate +=21000;} //2.787789482숏 소드2.694432148 
			case(251){itemDesc = `id:40081 `; iCumRate +=21000;} //2.787789482레더 롱 보우2.694432148 
			case(252){itemDesc = `id:19001 `; iCumRate +=24000;} //3.186045122로브3.079351027 
			case(253){itemDesc = `id:19003 `; iCumRate +=24000;} //3.186045122트리콜로르 로브3.079351027 
			case(254){itemDesc = `id:40003 `; iCumRate +=24000;} //3.186045122숏 보우3.079351027 
			case(255){itemDesc = `id:19012 `; iCumRate +=24000;} //3.186045122트루디 레이어드 로브3.079351027 
			case(256){itemDesc = `id:19002 `; iCumRate +=27000;} //3.584300763슬렌더 로브3.464269905 
			case(257){itemDesc = `id:40006 `; iCumRate +=27000;} //3.584300763단검3.464269905 
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
	int iRandom = Random(86003);

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