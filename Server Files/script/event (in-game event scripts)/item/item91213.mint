////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//	jooddang@nexon.co.kr
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
	int itemID = cItem.GetClassId();
	bool bLivingGachaphonGived = false;	//B그룹
	{
		if ((GetLocale().LowerCase() == `japan`) || (GetLocale().LowerCase() == `usa`) || (GetLocale().LowerCase() == `taiwan`))
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3311);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40170 `; iCumRate +=1;} //0.030202356일본식 양손검
					case(1){itemString = `id:14039 `; iCumRate +=1;} //0.030202356차이나 드래곤 아머(인간)
					case(2){itemString = `id:14040 `; iCumRate +=1;} //0.030202356차이나 드래곤 아머(엘프)
					case(3){itemString = `id:14041 `; iCumRate +=1;} //0.030202356차이나 드래곤 아머(자이언트)
					case(4){itemString = `id:16532 `; iCumRate +=1;} //0.030202356차이나 드래곤 건틀렛(인간/자이언트)
					case(5){itemString = `id:16533 `; iCumRate +=1;} //0.030202356차이나 드래곤 건틀렛(엘프)
					case(6){itemString = `id:17095 `; iCumRate +=1;} //0.030202356차이나 드래곤 부츠
					case(7){itemString = `id:18552 `; iCumRate +=1;} //0.030202356차이나 드래곤 헬름
					case(8){itemString = `id:13032 `; iCumRate +=2;} //0.060404712발렌시아 크로스 라인 플레이트 아머(여성용)
					case(9){itemString = `id:13033 `; iCumRate +=2;} //0.060404712발렌시아 크로스 라인 플레이트 아머(남성용)
					case(10){itemString = `id:16521 `; iCumRate +=2;} //0.060404712발렌시아 크로스 라인 플레이트 건틀렛
					case(11){itemString = `id:17514 `; iCumRate +=2;} //0.060404712발렌시아 크로스 라인 플레이트 부츠
					case(12){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712클레이모어
					case(13){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=2;} //0.060404712레더 롱 보우
					case(14){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712힐링 원드
					case(15){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712글라디우스
					case(16){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712라이트닝 원드
					case(17){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712아이스 원드
					case(18){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712파이어 원드
					case(19){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712타격용 원드
					case(20){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=2;} //0.060404712비펜니스
					case(21){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=2;} //0.060404712메이스
					case(22){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=2;} //0.060404712석궁
					case(23){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=2;} //0.060404712투 핸디드 소드
					case(24){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=2;} //0.060404712롱 보우
					case(25){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=2;} //0.060404712guardian bow
					case(26){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=2;} //0.060404712헤테로 카이트 실드
					case(27){itemString = `id:18518 `; iCumRate +=5;} //0.151011779드래곤 크레스트
					case(28){itemString = `id:15113 `; iCumRate +=5;} //0.151011779여성용 검사학교 교복 쇼트타입
					case(29){itemString = `id:15114 `; iCumRate +=5;} //0.151011779남성용 검사학교 교복 롱타입
					case(30){itemString = `id:15065 `; iCumRate +=5;} //0.151011779엘라 베스트 스커트
					case(31){itemString = `id:19008 `; iCumRate +=5;} //0.151011779코코 판다 로브
					case(32){itemString = `id:15137 `; iCumRate +=5;} //0.151011779셀리나 하프 재킷 코트
					case(33){itemString = `id:18041 `; iCumRate +=5;} //0.151011779큰 챙 깃털 모자
					case(34){itemString = `id:19009 `; iCumRate +=5;} //0.151011779코코 래빗 로브
					case(35){itemString = `id:18112 `; iCumRate +=5;} //0.151011779해 분장 소품
					case(36){itemString = `id:17015 `; iCumRate +=5;} //0.151011779Combat Shoes
					case(37){itemString = `id:15055 `; iCumRate +=5;} //0.151011779레더 미니 원피스
					case(38){itemString = `id:15057 `; iCumRate +=5;} //0.151011779롱 레더 코트 (무광)
					case(39){itemString = `id:14036 `; iCumRate +=5;} //0.151011779티오즈 아머(남성용)
					case(40){itemString = `id:14037 `; iCumRate +=5;} //0.151011779티오즈 아머(여성용)
					case(41){itemString = `id:16531 `; iCumRate +=5;} //0.151011779티오즈 건틀렛
					case(42){itemString = `id:17523 `; iCumRate +=5;} //0.151011779티오즈 그리브
					case(43){itemString = `id:15132 `; iCumRate +=5;} //0.151011779내추럴 베스트 웨어
					case(44){itemString = `id:15070 `; iCumRate +=5;} //0.151011779스탠드칼라 슬리브리스
					case(45){itemString = `id:15230 `; iCumRate +=5;} //0.151011779가르텐 글렌 체크 스커트
					case(46){itemString = `id:19034 `; iCumRate +=5;} //0.151011779가르텐 클로스 오버코트
					case(47){itemString = `id:40033 `; iCumRate +=5;} //0.151011779클레이모어
					case(48){itemString = `id:13043 `; iCumRate +=5;} //0.151011779레미니아 성월의 갑옷(남성용)
					case(49){itemString = `id:13044 `; iCumRate +=5;} //0.151011779레미니아 성월의 갑옷(여성용)
					case(50){itemString = `id:13045 `; iCumRate +=5;} //0.151011779아리쉬 아슈빈 아머(남성용)
					case(51){itemString = `id:13046 `; iCumRate +=5;} //0.151011779아리쉬 아슈빈 아머(여성용)
					case(52){itemString = `id:14019 `; iCumRate +=5;} //0.151011779그레이스 플레이트 아머
					case(53){itemString = `id:13031 `; iCumRate +=5;} //0.151011779스파이카 실버 플레이트 아머
					case(54){itemString = `id:13022 `; iCumRate +=5;} //0.151011779로즈 플레이트 아머 (P타입)
					case(55){itemString = `id:18542 `; iCumRate +=5;} //0.151011779빅 체인 풀 헬름
					case(56){itemString = `id:18506 `; iCumRate +=5;} //0.151011779윙 하프 헬름
					case(57){itemString = `id:14042 `; iCumRate +=5;} //0.151011779컬스틴 레더 아머
					case(58){itemString = `id:18045 `; iCumRate +=5;} //0.151011779별장식 마법사 모자
					case(59){itemString = `id:13010 `; iCumRate +=5;} //0.151011779라운드 폴드론 체인메일
					case(60){itemString = `id:14025 `; iCumRate +=5;} //0.151011779카멜 스피리트 아머(남성용)
					case(61){itemString = `id:14026 `; iCumRate +=5;} //0.151011779카멜 스피리트 아머(여성용)
					case(62){itemString = `id:16028 `; iCumRate +=5;} //0.151011779카멜 스피리트 글러브
					case(63){itemString = `id:16511 `; iCumRate +=5;} //0.151011779실버 티니 글러브
					case(64){itemString = `id:17064 `; iCumRate +=5;} //0.151011779카멜 스피리트 부츠
					case(65){itemString = `id:16534 `; iCumRate +=5;} //0.151011779컬스틴 레더 건틀렛
					case(66){itemString = `id:17524 `; iCumRate +=5;} //0.151011779컬스틴 레더 부츠
					case(67){itemString = `id:13047 `; iCumRate +=5;} //0.151011779키리누스진 하프 플레이트 아머(남성용)
					case(68){itemString = `id:13048 `; iCumRate +=5;} //0.151011779키리누스진 하프 플레이트 아머(여성용)
					case(69){itemString = `id:14038 `; iCumRate +=5;} //0.151011779피르타 레더 아머 B타입(여성용)
					case(70){itemString = `id:46012 `; iCumRate +=5;} //0.151011779청동 방패
					case(71){itemString = `id:18111 `; iCumRate +=5;} //0.151011779나무 분장 소품
					case(72){itemString = `id:18110 `; iCumRate +=5;} //0.151011779덤불 분장 소품
					case(73){itemString = `id:18109 `; iCumRate +=5;} //0.151011779나오 분장 소품
					case(74){itemString = `id:18108 `; iCumRate +=5;} //0.151011779바위 분장 소품
					case(75){itemString = `id:40083 `; iCumRate +=5;} //0.151011779훅 커틀러스
					case(76){itemString = `id:40032 `; iCumRate +=5;} //0.151011779가고일 소드
					case(77){itemString = `id:18544 `; iCumRate +=5;} //0.151011779펠리칸 프로텍터
					case(78){itemString = `id:18547 `; iCumRate +=5;} //0.151011779파나쉬 헤드 프로텍터
					case(79){itemString = `id:18521 `; iCumRate +=5;} //0.151011779유러피안 컴프
					case(80){itemString = `id:18500 `; iCumRate +=5;} //0.151011779링 메일 헬름
					case(81){itemString = `id:18511 `; iCumRate +=5;} //0.151011779플루트 풀 헬름
					case(82){itemString = `id:18502 `; iCumRate +=5;} //0.151011779본 헬름
					case(83){itemString = `id:19007 `; iCumRate +=5;} //0.151011779야광 머플러 로브
					case(84){itemString = `id:19017 `; iCumRate +=5;} //0.151011779늑대 로브
					case(85){itemString = `id:19016 `; iCumRate +=5;} //0.151011779곰 로브
					case(86){itemString = `id:15112 `; iCumRate +=5;} //0.151011779셀리나 스쿨보이룩
					case(87){itemString = `id:18034 `; iCumRate +=5;} //0.151011779볼륨 베레모
					case(88){itemString = `id:18006 `; iCumRate +=5;} //0.151011779마법사모자
					case(89){itemString = `id:18113 `; iCumRate +=5;} //0.151011779뾰족귀 고양이 모자
					case(90){itemString = `id:18114 `; iCumRate +=5;} //0.151011779줄무늬 고양이 모자
					case(91){itemString = `id:18115 `; iCumRate +=5;} //0.151011779핀 고양이 모자
					case(92){itemString = `id:18097 `; iCumRate +=5;} //0.151011779세이렌 깃털 가면
					case(93){itemString = `id:18098 `; iCumRate +=5;} //0.151011779세이렌의 안경
					case(94){itemString = `id:18099 `; iCumRate +=5;} //0.151011779세이렌 작은 날개 가면
					case(95){itemString = `id:18100 `; iCumRate +=5;} //0.151011779세이렌 날개 가면
					case(96){itemString = `id:18101 `; iCumRate +=5;} //0.151011779세이렌 박쥐 날개 가면
					case(97){itemString = `id:18102 `; iCumRate +=5;} //0.151011779세이렌의 가면
					case(98){itemString = `id:15055 `; iCumRate +=5;} //0.151011779세이렌 고양이 가면
					case(99){itemString = `id:18044 `; iCumRate +=5;} //0.151011779범죄용 복면
					case(100){itemString = `id:40071 `; iCumRate +=10;} //0.302023558'라' 음 빈 병
					case(101){itemString = `id:40072 `; iCumRate +=10;} //0.302023558'시' 음 빈 병
					case(102){itemString = `id:40073 `; iCumRate +=10;} //0.302023558'도' 음 빈 병
					case(103){itemString = `id:40074 `; iCumRate +=10;} //0.302023558'레' 음 빈 병
					case(104){itemString = `id:40075 `; iCumRate +=10;} //0.302023558'미' 음 빈 병
					case(105){itemString = `id:40076 `; iCumRate +=10;} //0.302023558'파' 음 빈 병
					case(106){itemString = `id:40077 `; iCumRate +=10;} //0.302023558'솔' 음 빈 병
					case(107){itemString = `id:16517 `; iCumRate +=10;} //0.302023558반대 장갑
					case(108){itemString = `id:16516 `; iCumRate +=10;} //0.302023558찬성 장갑
					case(109){itemString = `id:16515 `; iCumRate +=10;} //0.302023558보 장갑
					case(110){itemString = `id:16514 `; iCumRate +=10;} //0.302023558바위 장갑
					case(111){itemString = `id:16513 `; iCumRate +=10;} //0.302023558가위 장갑
					case(112){itemString = `id:40068 `; iCumRate +=10;} //0.302023558가위 모양 지시봉
					case(113){itemString = `id:40069 `; iCumRate +=10;} //0.302023558바위 모양 지시봉
					case(114){itemString = `id:40070 `; iCumRate +=10;} //0.302023558보 모양 지시봉
					case(115){itemString = `id:14013 `; iCumRate +=10;} //0.302023558로리카 세그먼타타에
					case(116){itemString = `id:14035 `; iCumRate +=10;} //0.302023558피르타 레더 아머
					case(117){itemString = `id:40011 `; iCumRate +=15;} //0.453035337브로드 소드
					case(118){itemString = `id:40030 `; iCumRate +=15;} //0.453035337투 핸디드 소드
					case(119){itemString = `id:40012 `; iCumRate +=15;} //0.453035337바스타드 소드
					case(120){itemString = `id:40007 `; iCumRate +=15;} //0.453035337한손도끼
					case(121){itemString = `id:40014 `; iCumRate +=15;} //0.453035337콤포짓 보우
					case(122){itemString = `id:40078 `; iCumRate +=15;} //0.453035337비펜니스
					case(123){itemString = `id:40080 `; iCumRate +=15;} //0.453035337글라디우스
					case(124){itemString = `id:40006 `; iCumRate +=15;} //0.453035337단검
					case(125){itemString = `id:40031 `; iCumRate +=15;} //0.453035337석궁
					case(126){itemString = `id:40081 `; iCumRate +=15;} //0.453035337레더 롱 보우
					case(127){itemString = `id:40079 `; iCumRate +=15;} //0.453035337메이스
					case(128){itemString = `id:40039 `; iCumRate +=15;} //0.453035337아이스 원드
					case(129){itemString = `id:40090 `; iCumRate +=15;} //0.453035337힐링 원드
					case(130){itemString = `id:40040 `; iCumRate +=15;} //0.453035337파이어 원드
					case(131){itemString = `id:40038 `; iCumRate +=15;} //0.453035337라이트닝 원드
					case(132){itemString = `id:15155 `; iCumRate +=15;} //0.453035337이디카이 성직자 예복(남성용)
					case(133){itemString = `id:15156 `; iCumRate +=15;} //0.453035337이디카이 성직자 예복(여성용)
					case(134){itemString = `id:15151 `; iCumRate +=15;} //0.453035337뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(135){itemString = `id:15152 `; iCumRate +=15;} //0.453035337뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(136){itemString = `id:15153 `; iCumRate +=15;} //0.453035337산드라 스나이퍼 수트(남성용)
					case(137){itemString = `id:15154 `; iCumRate +=15;} //0.453035337산드라 스나이퍼 수트(여성용)
					case(138){itemString = `id:15157 `; iCumRate +=15;} //0.453035337위스 보위군 의복(남성용)
					case(139){itemString = `id:15158 `; iCumRate +=15;} //0.453035337위스 보위군 의복(여성용)
					case(140){itemString = `id:15115 `; iCumRate +=15;} //0.453035337재기드 미니 스커트
					case(141){itemString = `id:15059 `; iCumRate +=15;} //0.453035337터크스 탱크탑 반바지
					case(142){itemString = `id:15070 `; iCumRate +=15;} //0.453035337아이돌 리본 드레스
					case(143){itemString = `id:15074 `; iCumRate +=15;} //0.453035337루이스 성직자 코트
					case(144){itemString = `id:15061 `; iCumRate +=15;} //0.453035337물결무늬 옆트임 튜닉
					case(145){itemString = `id:18019 `; iCumRate +=15;} //0.453035337리리나 깃털모자
					case(146){itemString = `id:18020 `; iCumRate +=15;} //0.453035337몬거 깃털모자
					case(147){itemString = `id:18029 `; iCumRate +=15;} //0.453035337나무테 안경
					case(148){itemString = `id:18028 `; iCumRate +=15;} //0.453035337접이식 안경
					case(149){itemString = `id:16500 `; iCumRate +=15;} //0.453035337울나 프로텍터 글러브
					case(150){itemString = `id:40053 `; iCumRate +=15;} //0.453035337보라빛 장미 꽃다발
					case(151){itemString = `id:40054 `; iCumRate +=15;} //0.453035337보라빛 장미 한송이
					case(152){itemString = `id:18089 `; iCumRate +=15;} //0.453035337보라빛 장미 장식
					case(153){itemString = `id:40052 `; iCumRate +=15;} //0.453035337파란 장미 한송이
					case(154){itemString = `id:18090 `; iCumRate +=15;} //0.453035337파란 장미 장식
					case(155){itemString = `id:18086 `; iCumRate +=15;} //0.453035337데이지 꽃 장식
					case(156){itemString = `id:18087 `; iCumRate +=15;} //0.453035337장미 꽃 장식
					case(157){itemString = `id:15131 `; iCumRate +=15;} //0.453035337핀 에이프런 스커트
					case(158){itemString = `id:2006 `; iCumRate +=15;} //0.453035337큰 금화 주머니
					case(159){itemString = `id:15014 `; iCumRate +=15;} //0.453035337파발꾼의 옷
					case(160){itemString = `id:15028 `; iCumRate +=15;} //0.453035337코레스 씨프슈트
					case(161){itemString = `id:15042 `; iCumRate +=15;} //0.453035337롱넥 원피스
					case(162){itemString = `id:15052 `; iCumRate +=15;} //0.453035337터크스 투톤 튜닉
					case(163){itemString = `id:15053 `; iCumRate +=15;} //0.453035337플랫칼라 원피스
					case(164){itemString = `id:15128 `; iCumRate +=15;} //0.453035337투 톤 비조 드레스
					case(165){itemString = `id:15136 `; iCumRate +=15;} //0.453035337모험가 슈트
					case(166){itemString = `id:16008 `; iCumRate +=15;} //0.453035337코레스 씨프 글러브
					case(167){itemString = `id:16019`; iCumRate +=15;} //0.453035337줄무늬 팔목 장갑
					case(168){itemString = `id:16040 `; iCumRate +=15;} //0.453035337콜린 빅센 글러브
					case(169){itemString = `id:16505 `; iCumRate +=15;} //0.453035337플루트 건틀렛
					case(170){itemString = `id:16520 `; iCumRate +=15;} //0.453035337롱 레더 글러브
					case(171){itemString = `id:17040 `; iCumRate +=15;} //0.453035337엘라 스트랩 부츠
					case(172){itemString = `id:17041 `; iCumRate +=15;} //0.453035337덩굴무늬 헌팅부츠
					case(173){itemString = `id:17045 `; iCumRate +=15;} //0.453035337브이 넥 라인 레더 부츠
					case(174){itemString = `id:17071 `; iCumRate +=15;} //0.453035337니하이 부츠
					case(175){itemString = `id:17087 `; iCumRate +=15;} //0.453035337콜린 빅센 부츠
					case(176){itemString = `id:17506 `; iCumRate +=15;} //0.453035337롱그리브 부츠
					case(177){itemString = `id:17522 `; iCumRate +=15;} //0.453035337피르타 레더 부츠
					case(178){itemString = `id:18008 `; iCumRate +=15;} //0.453035337스트라이프 캡
					case(179){itemString = `id:18023 `; iCumRate +=15;} //0.453035337몬거 씨프 캡
					case(180){itemString = `id:18038 `; iCumRate +=15;} //0.453035337깃털 배렛 모자
					case(181){itemString = `id:18047 `; iCumRate +=15;} //0.453035337코레스 펠트 모자
					case(182){itemString = `id:18513 `; iCumRate +=15;} //0.453035337스파이크 캡
					case(183){itemString = `id:18515 `; iCumRate +=15;} //0.453035337트윈 혼 캡
					case(184){itemString = `id:18525 `; iCumRate +=15;} //0.453035337워터드롭 캡
					case(185){itemString = `id:18543 `; iCumRate +=15;} //0.453035337슬릿 풀 헬름
					case(186){itemString = `id:19020 `; iCumRate +=15;} //0.453035337나타네 설산용 코트
					case(187){itemString = `id:19029 `; iCumRate +=15;} //0.453035337자이언트 베어 로브
					case(188){itemString = `id:40081 `; iCumRate +=15;} //0.453035337롱 보우
					case(189){itemString = `id:46001 `; iCumRate +=15;} //0.453035337라운드 실드
					case(190){itemString = `id:46006 `; iCumRate +=15;} //0.453035337카이트 실드
					case(191){itemString = `id:40172 `; iCumRate +=15;} //0.453035337그레이트 소드
					case(192){itemString = `id:40174 `; iCumRate +=15;} //0.453035337모닝스타
					case(193){itemString = `id:40177 `; iCumRate +=15;} //0.453035337워리어 액스
					case(194){itemString = `id:40180 `; iCumRate +=15;} //0.453035337홉네일 너클
					case(195){itemString = `id:40041 `; iCumRate +=15;} //0.453035337타격용 원드
					case(196){itemString = `id:40010 `; iCumRate +=15;} //0.453035337롱 소드
					case(197){itemString = `id:16523 `; iCumRate +=15;} //0.453035337그레이스 건틀렛
					case(198){itemString = `id:17515 `; iCumRate +=15;} //0.453035337그레이스 그리브
					case(199){itemString = `id:18545 `; iCumRate +=15;} //0.453035337그레이스 헬멧
					case(200){itemString = `id:46008 `; iCumRate +=15;} //0.453035337라이트 헤테로 카이트 실드
					case(201){itemString = `id:51007 count:5`; iCumRate +=20;} //0.604047116마나 30 포션
					case(202){itemString = `id:51001 count:5`; iCumRate +=20;} //0.604047116생명력 10 포션
					case(203){itemString = `id:51002 count:5`; iCumRate +=20;} //0.604047116생명력 30 포션
					case(204){itemString = `id:51022 count:5`; iCumRate +=20;} //0.604047116생명력과 마나 30 포션
					case(205){itemString = `id:51027 count:5`; iCumRate +=20;} //0.604047116생명력과 스태미나 30 포션
					case(206){itemString = `id:63000 count:5`; iCumRate +=30;} //0.906070674피닉스의 깃털
					case(207){itemString = `id:60037 count:5`; iCumRate +=30;} //0.906070674블랙 유스 포션
					case(208){itemString = `id:60038 count:5`; iCumRate +=30;} //0.906070674레드 포션
					case(209){itemString = `id:50012 count:5`; iCumRate +=30;} //0.906070674황금 달걀
					case(210){itemString = `id:50013 count:5`; iCumRate +=30;} //0.906070674황금 사과
					case(211){itemString = `id:50541 quality:81`; iCumRate +=30;} //0.906070674에스프레소
					case(212){itemString = `id:50542 quality:81`; iCumRate +=30;} //0.906070674에스프레소 마끼아또 
					case(213){itemString = `id:50543 quality:81`; iCumRate +=30;} //0.906070674카푸치노
					case(214){itemString = `id:50544 quality:81`; iCumRate +=30;} //0.906070674마끼아또
					case(215){itemString = `id:50545 quality:81`; iCumRate +=30;} //0.906070674카페 모카
					case(216){itemString = `id:50546 quality:81`; iCumRate +=30;} //0.906070674아이스 카페 모카
					case(217){itemString = `id:50547 quality:81`; iCumRate +=30;} //0.906070674아이스 마끼아또
					case(218){itemString = `id:50170 quality:81`; iCumRate +=30;} //0.906070674치즈 퐁듀
					case(219){itemString = `id:50171 quality:81`; iCumRate +=30;} //0.906070674이멘 마하산 와인
					case(220){itemString = `id:50172 quality:81`; iCumRate +=30;} //0.906070674레어치즈 케익
					case(221){itemString = `id:50173 quality:81`; iCumRate +=30;} //0.906070674가토 오 쇼콜라
					case(222){itemString = `id:50174 quality:81`; iCumRate +=30;} //0.906070674크로크 무슈
					case(223){itemString = `id:50175 quality:81`; iCumRate +=30;} //0.906070674브라우니
					case(224){itemString = `id:50176 quality:81`; iCumRate +=30;} //0.906070674버터 비스킷
					case(225){itemString = `id:51003 count:5`; iCumRate +=200;} //6.040471157생명력 50 포션
					case(226){itemString = `id:51008 count:5`; iCumRate +=200;} //6.040471157마나 50 포션
					case(227){itemString = `id:51013 count:5`; iCumRate +=200;} //6.040471157스태미나 50 포션
					case(228){itemString = `id:51028 count:5`; iCumRate +=200;} //6.040471157생명력과 스태미나 50 포션
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
				//	GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
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
		else if (GetLocale().LowerCase() == `korea`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3767);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					case(0){itemString = `id:13066 `; iCumRate +=1;} //0.026546323레미니아 성월의 갑옷 (저스팅 남성용)
					case(1){itemString = `id:13067`; iCumRate +=1;} //0.026546323레미니아 성월의 갑옷 (저스팅 여성용)
					case(2){itemString = `id:18287`; iCumRate +=1;} //0.026546323원숭이 탈
					case(3){itemString = `id:13038 `; iCumRate +=1;} //0.026546323더스틴 실버 나이트 아머
					case(4){itemString = `id:16524 `; iCumRate +=1;} //0.026546323더스틴 실버 나이트 뱀브레이스
					case(5){itemString = `id:17517 `; iCumRate +=1;} //0.026546323더스틴 실버 나이트 그리브
					case(6){itemString = `id:18548 `; iCumRate +=1;} //0.026546323더스틴 실버 나이트 헬름
					case(7){itemString = `id:15316 `; iCumRate +=1;} //0.026546323카리스 위자드 수트
					case(8){itemString = `id:17128 `; iCumRate +=1;} //0.026546323카리스 위자드 슈즈
					case(9){itemString = `id:13032 `; iCumRate +=2;} //0.053092647발렌시아 크로스 라인 플레이트 아머(여성용)
					case(10){itemString = `id:13033 `; iCumRate +=2;} //0.053092647발렌시아 크로스 라인 플레이트 아머(남성용)
					case(11){itemString = `id:16521 `; iCumRate +=2;} //0.053092647발렌시아 크로스 라인 플레이트 건틀렛
					case(12){itemString = `id:17514 `; iCumRate +=2;} //0.053092647발렌시아 크로스 라인 플레이트 부츠
					case(13){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647클레이모어
					case(14){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=2;} //0.053092647레더 롱 보우
					case(15){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647힐링 원드
					case(16){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647글라디우스
					case(17){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647라이트닝 원드
					case(18){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647아이스 원드
					case(19){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647파이어 원드
					case(20){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647타격용 원드
					case(21){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=2;} //0.053092647비펜니스
					case(22){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=2;} //0.053092647메이스
					case(23){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=2;} //0.053092647석궁
					case(24){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=2;} //0.053092647투 핸디드 소드
					case(25){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=2;} //0.053092647롱 보우
					case(26){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=2;} //0.053092647가디언 보우
					case(27){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=2;} //0.053092647헤테로 카이트 실드
					case(28){itemString = `id:18518 `; iCumRate +=15;} //0.39819485드래곤 크레스트
					case(29){itemString = `id:15113 `; iCumRate +=15;} //0.39819485여성용 검사학교 교복 쇼트타입
					case(30){itemString = `id:15114 `; iCumRate +=15;} //0.39819485남성용 검사학교 교복 롱타입
					case(31){itemString = `id:15065 `; iCumRate +=15;} //0.39819485엘라 베스트 스커트
					case(32){itemString = `id:19008 `; iCumRate +=15;} //0.39819485코코 판다 로브
					case(33){itemString = `id:15137 `; iCumRate +=15;} //0.39819485셀리나 하프 재킷 코트
					case(34){itemString = `id:18041 `; iCumRate +=15;} //0.39819485큰 챙 깃털 모자
					case(35){itemString = `id:19009 `; iCumRate +=15;} //0.39819485코코 래빗 로브
					case(36){itemString = `id:18112 `; iCumRate +=15;} //0.39819485해 분장 소품
					case(37){itemString = `id:15055 `; iCumRate +=15;} //0.39819485레더 미니 원피스
					case(38){itemString = `id:15057 `; iCumRate +=15;} //0.39819485롱 레더 코트 (무광)
					case(39){itemString = `id:16531 `; iCumRate +=15;} //0.39819485티오즈 건틀렛
					case(40){itemString = `id:17523 `; iCumRate +=15;} //0.39819485티오즈 그리브
					case(41){itemString = `id:15070 `; iCumRate +=15;} //0.39819485스탠드칼라 슬리브리스
					case(42){itemString = `id:15230 `; iCumRate +=15;} //0.39819485가르텐 글렌 체크 스커트
					case(43){itemString = `id:19034 `; iCumRate +=15;} //0.39819485가르텐 클로스 오버코트
					case(44){itemString = `id:40033 `; iCumRate +=15;} //0.39819485클레이모어
					case(45){itemString = `id:13043 `; iCumRate +=15;} //0.39819485레미니아 성월의 갑옷(남성용)
					case(46){itemString = `id:13044 `; iCumRate +=15;} //0.39819485레미니아 성월의 갑옷(여성용)
					case(47){itemString = `id:13045 `; iCumRate +=15;} //0.39819485아리쉬 아슈빈 아머(남성용)
					case(48){itemString = `id:13046 `; iCumRate +=15;} //0.39819485아리쉬 아슈빈 아머(여성용)
					case(49){itemString = `id:14019 `; iCumRate +=15;} //0.39819485그레이스 플레이트 아머
					case(50){itemString = `id:13031 `; iCumRate +=15;} //0.39819485스파이카 실버 플레이트 아머
					case(51){itemString = `id:13022 `; iCumRate +=15;} //0.39819485로즈 플레이트 아머 (P타입)
					case(52){itemString = `id:18542 `; iCumRate +=15;} //0.39819485빅 체인 풀 헬름
					case(53){itemString = `id:18506 `; iCumRate +=15;} //0.39819485윙 하프 헬름
					case(54){itemString = `id:14042 `; iCumRate +=15;} //0.39819485컬스틴 레더 아머
					case(55){itemString = `id:18045 `; iCumRate +=15;} //0.39819485별장식 마법사 모자
					case(56){itemString = `id:13010 `; iCumRate +=15;} //0.39819485라운드 폴드론 체인메일
					case(57){itemString = `id:14025 `; iCumRate +=15;} //0.39819485카멜 스피리트 아머(남성용)
					case(58){itemString = `id:14026 `; iCumRate +=15;} //0.39819485카멜 스피리트 아머(여성용)
					case(59){itemString = `id:16028 `; iCumRate +=15;} //0.39819485카멜 스피리트 글러브
					case(60){itemString = `id:16511 `; iCumRate +=15;} //0.39819485실버 티니 글러브
					case(61){itemString = `id:17064 `; iCumRate +=15;} //0.39819485카멜 스피리트 부츠
					case(62){itemString = `id:16534 `; iCumRate +=15;} //0.39819485컬스틴 레더 건틀렛
					case(63){itemString = `id:17524 `; iCumRate +=15;} //0.39819485컬스틴 레더 부츠
					case(64){itemString = `id:13047 `; iCumRate +=15;} //0.39819485키리누스진 하프 플레이트 아머(남성용)
					case(65){itemString = `id:13048 `; iCumRate +=15;} //0.39819485키리누스진 하프 플레이트 아머(여성용)
					case(66){itemString = `id:14038 `; iCumRate +=15;} //0.39819485피르타 레더 아머 B타입(여성용)
					case(67){itemString = `id:18111 `; iCumRate +=15;} //0.39819485나무 분장 소품
					case(68){itemString = `id:18110 `; iCumRate +=15;} //0.39819485덤불 분장 소품
					case(69){itemString = `id:18109 `; iCumRate +=15;} //0.39819485나오 분장 소품
					case(70){itemString = `id:18108 `; iCumRate +=15;} //0.39819485바위 분장 소품
					case(71){itemString = `id:40083 `; iCumRate +=15;} //0.39819485훅 커틀러스
					case(72){itemString = `id:40032 `; iCumRate +=15;} //0.39819485가고일 소드
					case(73){itemString = `id:18544 `; iCumRate +=15;} //0.39819485펠리칸 프로텍터
					case(74){itemString = `id:18547 `; iCumRate +=15;} //0.39819485파나쉬 헤드 프로텍터
					case(75){itemString = `id:18521 `; iCumRate +=15;} //0.39819485유러피안 컴프
					case(76){itemString = `id:18500 `; iCumRate +=15;} //0.39819485링 메일 헬름
					case(77){itemString = `id:18511 `; iCumRate +=15;} //0.39819485플루트 풀 헬름
					case(78){itemString = `id:18502 `; iCumRate +=15;} //0.39819485본 헬름
					case(79){itemString = `id:19007 `; iCumRate +=15;} //0.39819485야광 머플러 로브
					case(80){itemString = `id:19017 `; iCumRate +=15;} //0.39819485늑대 로브
					case(81){itemString = `id:19016 `; iCumRate +=15;} //0.39819485곰 로브
					case(82){itemString = `id:15112 `; iCumRate +=15;} //0.39819485셀리나 스쿨보이룩
					case(83){itemString = `id:18034 `; iCumRate +=15;} //0.39819485볼륨 베레모
					case(84){itemString = `id:18006 `; iCumRate +=15;} //0.39819485마법사모자
					case(85){itemString = `id:18113 `; iCumRate +=15;} //0.39819485뾰족귀 고양이 모자
					case(86){itemString = `id:18114 `; iCumRate +=15;} //0.39819485줄무늬 고양이 모자
					case(87){itemString = `id:18115 `; iCumRate +=15;} //0.39819485핀 고양이 모자
					case(88){itemString = `id:18097 `; iCumRate +=15;} //0.39819485세이렌 깃털 가면
					case(89){itemString = `id:18098 `; iCumRate +=15;} //0.39819485세이렌의 안경
					case(90){itemString = `id:18099 `; iCumRate +=15;} //0.39819485세이렌 작은 날개 가면
					case(91){itemString = `id:18100 `; iCumRate +=15;} //0.39819485세이렌 날개 가면
					case(92){itemString = `id:18101 `; iCumRate +=15;} //0.39819485세이렌 박쥐 날개 가면
					case(93){itemString = `id:18102 `; iCumRate +=15;} //0.39819485세이렌의 가면
					case(94){itemString = `id:18096 `; iCumRate +=15;} //0.39819485세이렌 고양이 가면
					case(95){itemString = `id:18044 `; iCumRate +=15;} //0.39819485범죄용 복면
					case(96){itemString = `id:51002 count:5`; iCumRate +=100;} //2.654632333생명력 30 포션
					case(97){itemString = `id:51007 count:5`; iCumRate +=100;} //2.654632333마나 30 포션
					case(98){itemString = `id:51012 count:5`; iCumRate +=100;} //2.654632333스태미나 30 포션
					case(99){itemString = `id:51003 count:5`; iCumRate +=100;} //2.654632333생명력 50 포션
					case(100){itemString = `id:51008 count:5`; iCumRate +=100;} //2.654632333마나 50 포션
					case(101){itemString = `id:51013 count:5`; iCumRate +=100;} //2.654632333스태미나 50 포션
					case(102){itemString = `id:51004 count:3`; iCumRate +=100;} //2.654632333생명력 100 포션
					case(103){itemString = `id:51009 count:3`; iCumRate +=100;} //2.654632333마나 100 포션
					case(104){itemString = `id:51014 count:3`; iCumRate +=100;} //2.654632333스태미나 100 포션
					case(105){itemString = `id:51005 `; iCumRate +=100;} //2.654632333생명력 300 포션
					case(106){itemString = `id:51010 `; iCumRate +=100;} //2.654632333마나 300 포션
					case(107){itemString = `id:51015 `; iCumRate +=100;} //2.654632333스태미나 300 포션
					case(108){itemString = `id:51022 count:5`; iCumRate +=100;} //2.654632333생명력과 마나 30 포션
					case(109){itemString = `id:51023 count:5`; iCumRate +=100;} //2.654632333생명력과 마나 50 포션
					case(110){itemString = `id:51024 count:3`; iCumRate +=100;} //2.654632333생명력과 마나 100 포션
					case(111){itemString = `id:51025 `; iCumRate +=100;} //2.654632333생명력과 마나 300 포션
					case(112){itemString = `id:51027 count:5`; iCumRate +=100;} //2.654632333생명력과 스태미나 30 포션
					case(113){itemString = `id:51028 count:5`; iCumRate +=100;} //2.654632333생명력과 스태미나 50 포션
					case(114){itemString = `id:51029 count:3`; iCumRate +=100;} //2.654632333생명력과 스태미나 100 포션
					case(115){itemString = `id:51030 `; iCumRate +=100;} //2.654632333생명력과 스태미나 300 포션
					case(116){itemString = `id:63016 count:5`; iCumRate +=100;} //2.654632333축복의 포션
					case(117){itemString = `id:63225 count:3`; iCumRate +=100;} //2.654632333성화
					case(118){itemString = `id:51046 `; iCumRate +=100;} //2.654632333호감도 포션
					case(119){itemString = `id:51101 count:10`; iCumRate +=100;} //2.654632333블러디 허브
					case(120){itemString = `id:51102 count:10`; iCumRate +=100;} //2.654632333마나 허브
					case(121){itemString = `id:51103 count:10`; iCumRate +=100;} //2.654632333선라이트 허브
					case(122){itemString = `id:51107 count:10`; iCumRate +=100;} //2.654632333화이트 허브


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
				//	GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
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
	}
		// 캐시 가차폰을 못받았다.
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}