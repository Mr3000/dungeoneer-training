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
//   향후 UseGachaponItem, ... 등으로 분리하는 것이 디버그를 위해서는
//   좋을 거라고 봄...

//   본래 가챠폰에만 쓰이던 함수였는데 쿠키트리 이벤트로도 쓰이게 된다
//   이 스크립트를 불리던 위치도 살짝 변경되었는데,
//   어떤 아이템이든지 /script/ stringid가 있으면 이 함수를 꼭 거치게 된다
////////////////////////////////////////////////////////////////////////////////
{

}

////////////////////////////////////////////////////////////////////////////////
server void UseEventChest(
	character player,
	item cItem,
	bool bUsePremiumKey)
// : 중국 보물상자 이벤트용 스크립트 함수
//   stringid에 /event_chest/가 있는 아이템이 사용될 때 호출된다.
////////////////////////////////////////////////////////////////////////////////
{
	int itemID				= cItem.GetClassId();
	int iMonsterRate	= Random(100);
	bool bMonster			= iMonsterRate < 10;	// 몬스터가 나올지 안나올지 결정한다.
	int iCumRate			= 0;									// 확률을 누적해놓는 변수
	int i							= 0;

	// 중국 보물상자 이벤트용 ~ 보통 보물상자
	if (itemID == 91038)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			int iRandom		= Random(4366);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;

				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13043 `; iCumRate += 1 ;}	//  0.022904260  레미니아 성월의 갑옷(남성용)
					case(1){itemString = `id:13044 `; iCumRate += 1 ;}	//  0.022904260  레미니아 성월의 갑옷(여성용)
					case(2){itemString = `id:13045 `; iCumRate += 1 ;}	//  0.022904260  아리쉬 아슈빈 아머(남성용)
					case(3){itemString = `id:13046 `; iCumRate += 1 ;}	//  0.022904260  아리쉬 아슈빈 아머(여성용)
					case(4){itemString = `id:15153`; iCumRate += 2 ;}	//  0.045808520  @산드라 스나이퍼 수트(남성용)
					case(5){itemString = `id:15154`; iCumRate += 2 ;}	//  0.045808520  @산드라 스나이퍼 수트(여성용)
					case(6){itemString = `id:16026`; iCumRate += 2 ;}	//  0.045808520  @산드라 스나이퍼 수트 글러브
					case(7){itemString = `id:17060`; iCumRate += 2 ;}	//  0.045808520  @산드라 스나이퍼 수트 부츠(남성용)
					case(8){itemString = `id:17061`; iCumRate += 2 ;}	//  0.045808520  @산드라 스나이퍼 수트 부츠(여성용)
					case(9){itemString = `id:13010`; iCumRate += 4 ;}	//  0.091617041  @라운드 폴드론 체인메일
					case(10){itemString = `id:13023`; iCumRate += 4 ;}	//  0.091617041  @로즈 플레이트 아머 (B타입)
					case(11){itemString = `id:16504`; iCumRate += 4 ;}	//  0.091617041  @카운터 건틀렛
					case(12){itemString = `id:17500`; iCumRate += 4 ;}	//  0.091617041  @하이폴린 플레이트 부츠
					case(13){itemString = `id:18508`; iCumRate += 4 ;}	//  0.091617041  @슬릿 풀 헬름
					case(14){itemString = `id:40090`; iCumRate += 8 ;}	//  0.183234082  힐링 원드
					case(15){itemString = `id:40038`; iCumRate += 8 ;}	//  0.183234082  라이트닝 원드
					case(16){itemString = `id:40040`; iCumRate += 8 ;}	//  0.183234082  파이어 원드
					case(17){itemString = `id:40041`; iCumRate += 8 ;}	//  0.183234082  타격용 원드
					case(18){itemString = `id:40006`; iCumRate += 16 ;}	//  0.3664681631  단검
					case(19){itemString = `id:40005`; iCumRate += 16 ;}	//  0.3664681631  숏 소드
					case(20){itemString = `id:40010`; iCumRate += 16 ;}	//  0.3664681631  롱 소드
					case(21){itemString = `id:40007`; iCumRate += 16 ;}	//  0.3664681631  한손 도끼
					case(22){itemString = `id:40016`; iCumRate += 16 ;}	//  0.3664681631  해머
					case(23){itemString = `id:40015`; iCumRate += 16 ;}	//  0.3664681631  플루트 숏소드
					case(24){itemString = `id:40030`; iCumRate += 16 ;}	//  0.3664681631  투 핸디드 소드
					case(25){itemString = `id:40011`; iCumRate += 16 ;}	//  0.3664681631  브로드 소드
					case(26){itemString = `id:40033`; iCumRate += 16 ;}	//  0.3664681631  클레이모어
					case(27){itemString = `id:40012`; iCumRate += 16 ;}	//  0.3664681631  바스타드 소드
					case(28){itemString = `id:40019`; iCumRate += 16 ;}	//  0.3664681631  굵은 나뭇가지
					case(29){itemString = `id:40020`; iCumRate += 16 ;}	//  0.3664681631  나무 몽둥이
					case(30){itemString = `id:40031`; iCumRate += 16 ;}	//  0.3664681631  석궁
					case(31){itemString = `id:40013`; iCumRate += 16 ;}	//  0.3664681631  롱 보우
					case(32){itemString = `id:40014`; iCumRate += 16 ;}	//  0.3664681631  콤포짓 보우
					case(33){itemString = `id:40003`; iCumRate += 16 ;}	//  0.3664681631  숏 보우
					case(34){itemString = `id:46001`; iCumRate += 16 ;}	//  0.3664681631  라운드 실드
					case(35){itemString = `id:62005 prefix:6`; iCumRate += 16 ;}	//  0.3664681631  스네이크헌터
					case(36){itemString = `id:62005 prefix:7`; iCumRate += 16 ;}	//  0.3664681631  폭스헌터
					case(37){itemString = `id:62005 prefix:107`; iCumRate += 16 ;}	//  0.3664681631  폭스테이머
					case(38){itemString = `id:62005 prefix:207`; iCumRate += 16 ;}	//  0.3664681631  폭스
					case(39){itemString = `id:62005 suffix:10604`; iCumRate += 16 ;}	//  0.3664681631  농부의
					case(40){itemString = `id:62005 suffix:11104`; iCumRate += 16 ;}	//  0.3664681631  위크니스
					case(41){itemString = `manual:106`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 포포스커트(여)
					case(42){itemString = `manual:112`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 마법사모자
					case(43){itemString = `manual:114`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 머리띠
					case(44){itemString = `manual:107`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 몬거 여행자옷(여)
					case(45){itemString = `manual:108`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 몬거 여행자옷(남)
					case(46){itemString = `manual:102`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 마법학교 교복(남)
					case(47){itemString = `manual:115`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 몬거 롱스커트(여)
					case(48){itemString = `manual:118`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 코레스 닌자슈트(남)
					case(49){itemString = `manual:111`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 가디언 장갑
					case(50){itemString = `manual:117`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 리리나 롱스커트(여)
					case(51){itemString = `manual:105`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 몬거 모자
					case(52){itemString = `manual:109`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 클로스 메일
					case(53){itemString = `manual:116`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 라이트 레더메일(여)
					case(54){itemString = `manual:120`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 라이트 레더메일(남)
					case(55){itemString = `manual:126`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 루이스 베스트 웨어(남)
					case(56){itemString = `manual:122`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 전문가용 실크방직 장갑
					case(57){itemString = `manual:119`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 코레스 씨프슈트(남)
					case(58){itemString = `manual:123`; iCumRate += 28 ;}	//  0.6413192854  옷본 - 레더 미니 원피스 링타입(여)
					case(59){itemString = `manual:20106`; iCumRate += 28 ;}	//  0.6413192854  도면 - 낫
					case(60){itemString = `manual:20104`; iCumRate += 28 ;}	//  0.6413192854  도면 - 곡괭이
					case(61){itemString = `manual:20131`; iCumRate += 28 ;}	//  0.6413192854  도면 - 숏 소드
					case(62){itemString = `manual:20102`; iCumRate += 28 ;}	//  0.6413192854  도면 - 단검
					case(63){itemString = `manual:20108`; iCumRate += 28 ;}	//  0.6413192854  도면 - 스파이크 캡
					case(64){itemString = `manual:20103`; iCumRate += 28 ;}	//  0.6413192854  도면 - 라운드 실드
					case(65){itemString = `manual:20105`; iCumRate += 28 ;}	//  0.6413192854  도면 - 롱 소드
					case(66){itemString = `manual:20117`; iCumRate += 28 ;}	//  0.6413192854  도면 - 그리브 부츠
					case(67){itemString = `manual:20134`; iCumRate += 28 ;}	//  0.6413192854  도면 - 해머
					case(68){itemString = `manual:20135`; iCumRate += 28 ;}	//  0.6413192854  도면 - 브로드 소드
					case(69){itemString = `manual:20137`; iCumRate += 28 ;}	//  0.6413192854  도면 - 바스타드 소드
					case(70){itemString = `id:60009 count:5`; iCumRate += 40 ;}	//  0.9161704077  양털
					case(71){itemString = `id:60008 count:5`; iCumRate += 40 ;}	//  0.9161704077  거미줄
					case(72){itemString = `id:60004 count:5`; iCumRate += 40 ;}	//  0.9161704077  매듭끈
					case(73){itemString = `id:60028 count:10`; iCumRate += 40 ;}	//  0.9161704077  일반 가죽끈
					case(74){itemString = `id:60013 count:10`; iCumRate += 40 ;}	//  0.9161704077  고급 실크
					case(75){itemString = `id:60021 count:10`; iCumRate += 40 ;}	//  0.9161704077  고급 옷감
					case(76){itemString = `id:60017 count:10`; iCumRate += 40 ;}	//  0.9161704077  고급 마감용 실
					case(77){itemString = `id:60025 count:10`; iCumRate += 40 ;}	//  0.9161704077  고급 가죽
					case(78){itemString = `id:60012 count:10`; iCumRate += 40 ;}	//  0.9161704077  일반 실크
					case(79){itemString = `id:60016 count:10`; iCumRate += 40 ;}	//  0.9161704077  일반 마감용 실
					case(80){itemString = `id:60020 count:10`; iCumRate += 40 ;}	//  0.9161704077  일반 옷감
					case(81){itemString = `id:60024 count:10`; iCumRate += 40 ;}	//  0.9161704077  일반 가죽
					case(82){itemString = `id:64002 count:10`; iCumRate += 40 ;}	//  0.9161704077  철광석
					case(83){itemString = `id:64004 count:10`; iCumRate += 40 ;}	//  0.9161704077  동광석
					case(84){itemString = `id:64006 count:10`; iCumRate += 40 ;}	//  0.9161704077  은광석
					case(85){itemString = `id:64001 count:10`; iCumRate += 40 ;}	//  0.9161704077  철괴
					case(86){itemString = `id:64003 count:10`; iCumRate += 40 ;}	//  0.9161704077  동괴
					case(87){itemString = `id:64005 count:10`; iCumRate += 40 ;}	//  0.9161704077  은괴
					case(88){itemString = `id:51102 count:10`; iCumRate += 40 ;}	//  0.9161704077  마나 허브
					case(89){itemString = `id:51101 count:10`; iCumRate += 40 ;}	//  0.9161704077  블러디 허브
					case(90){itemString = `id:51103 count:10`; iCumRate += 40 ;}	//  0.9161704077  선라이트 허브
					case(91){itemString = `id:62003 count:5`; iCumRate += 40 ;}	//  0.9161704077  축복받은 마법가루
					case(92){itemString = `id:63029 count:5`; iCumRate += 40 ;}	//  0.9161704077  캠프파이어 키트
					case(93){itemString = `id:50006 count:5`; iCumRate += 40 ;}	//  0.9161704077  고기 조각
					case(94){itemString = `id:40025`; iCumRate += 40 ;}	//  0.9161704077  곡괭이
					case(95){itemString = `id:2001`; iCumRate += 40 ;}	//  0.9161704077  금화주머니
					case(96){itemString = `id:40026`; iCumRate += 40 ;}	//  0.9161704077  낫
					case(97){itemString = `id:40024`; iCumRate += 40 ;}	//  0.9161704077  대장장이 망치
					case(98){itemString = `id:50203`; iCumRate += 40 ;}	//  0.9161704077  레드 선라이즈
					case(99){itemString = `id:62004 count:5`; iCumRate += 40 ;}	//  0.9161704077  마법가루
					case(100){itemString = `id:63027 expire:10080`; iCumRate += 40 ;}	//  0.9161704077  밀랍 날개
					case(101){itemString = `id:45002 count:100`; iCumRate += 40 ;}	//  0.9161704077  볼트
					case(102){itemString = `id:60005 count:10`; iCumRate += 40 ;}	//  0.9161704077  붕대
					case(103){itemString = `id:50124 quality:80`; iCumRate += 40 ;}	//  0.9161704077  비프 스테이크 80퀄리티
					case(104){itemString = `id:63020`; iCumRate += 40 ;}	//  0.9161704077  빈 병
					case(105){itemString = `id:51001 count:10`; iCumRate += 40 ;}	//  0.9161704077  생명력 10 포션
					case(106){itemString = `id:51022 count:5`; iCumRate += 40 ;}	//  0.9161704077  생명력과 마나 30 포션
					case(107){itemString = `id:51027 count:5`; iCumRate += 40 ;}	//  0.9161704077  생명력과 스태미나 30 포션
					case(108){itemString = `id:51028 count:3`; iCumRate += 40 ;}	//  0.9161704077  생명력과 스태미나 50 포션
					case(109){itemString = `id:51011 count:10`; iCumRate += 40 ;}	//  0.9161704077  스태미나 10 포션
					case(110){itemString = `id:40042`; iCumRate += 40 ;}	//  0.9161704077  식칼
					case(111){itemString = `id:63019 count:50`; iCumRate += 40 ;}	//  0.9161704077  알비 배틀 아레나 코인
					case(112){itemString = `id:63043 count:3`; iCumRate += 40 ;}	//  0.9161704077  어드밴스드 깃털
					case(113){itemString = `id:63001`; iCumRate += 40 ;}	//  0.9161704077  여신의 날개
					case(114){itemString = `id:40002`; iCumRate += 40 ;}	//  0.9161704077  연습용 목도
					case(115){itemString = `id:51031 count:3`; iCumRate += 40 ;}	//  0.9161704077  완전 회복의 포션
					case(116){itemString = `id:50014`; iCumRate += 40 ;}	//  0.9161704077  왕감자
					case(117){itemString = `id:63026`; iCumRate += 40 ;}	//  0.9161704077  원격 은행 이용권
					case(118){itemString = `id:63057`; iCumRate += 40 ;}	//  0.9161704077  원격 의류 수리 이용권
					case(119){itemString = `id:63047`; iCumRate += 40 ;}	//  0.9161704077  원격 힐러집 이용권
					case(120){itemString = `id:40023`; iCumRate += 40 ;}	//  0.9161704077  채집용 단검
					case(121){itemString = `id:40022`; iCumRate += 40 ;}	//  0.9161704077  채집용 도끼
					case(122){itemString = `id:63016 count:3`; iCumRate += 40 ;}	//  0.9161704077  축복의 포션
					case(123){itemString = `id:63039 expire:10080`; iCumRate += 40 ;}	//  0.9161704077  캠프 키트
					case(124){itemString = `id:63029 count:5`; iCumRate += 40 ;}	//  0.9161704077  캠프파이어키트
					case(125){itemString = `id:50005`; iCumRate += 40 ;}	//  0.9161704077  커다란 고기덩어리
					case(126){itemString = `id:2006`; iCumRate += 40 ;}	//  0.9161704077  큰 금화주머니
					case(127){itemString = `id:50202`; iCumRate += 40 ;}	//  0.9161704077  키스 온 더 립스
					case(128){itemString = `id:63044 count:3`; iCumRate += 40 ;}	//  0.9161704077  파티 부활의 깃털
					case(129){itemString = `id:63000 count:3`; iCumRate += 40 ;}	//  0.9161704077  피닉스의 깃털
					case(130){itemString = `id:40027`; iCumRate += 40 ;}	//  0.9161704077  호미
					case(131){itemString = `id:45001 count:100`; iCumRate += 40 ;}	//  0.9161704077  화살
					case(132){itemString = `id:63058`; iCumRate += 40 ;}	//  0.9161704077  회복 속도 증가 포션
					case(133){itemString = `id:40004`; iCumRate += 40 ;}	//  0.9161704077  류트
					case(134){itemString = `id:40018`; iCumRate += 40 ;}	//  0.9161704077  우쿨렐레
					case(135){itemString = `id:40017`; iCumRate += 40 ;}	//  0.9161704077  만돌린
					case(136){itemString = `id:50201 quality:100`; iCumRate += 32 ;}	//  0.7329363262  BnR
					case(137){itemString = `id:50164 quality:100`; iCumRate += 32 ;}	//  0.7329363262  T본 스테이크
					case(138){itemString = `id:50177  quality:100`; iCumRate += 32 ;}	//  0.732936326 초코칩 쿠키
					case(139){itemString = `id:50178  quality:100`; iCumRate += 32 ;}	//  0.732936326 오렌지 주스
					case(140){itemString = `id:50179  quality:100`; iCumRate += 32 ;}	//  0.732936326 레몬 주스
					case(141){itemString = `id:50180  quality:100`; iCumRate += 32 ;}	//  0.732936326 초콜릿 우유
					case(142){itemString = `id:50181  quality:100`; iCumRate += 32 ;}	//  0.732936326 라인산 진
					case(143){itemString = `id:50182  quality:100`; iCumRate += 32 ;}	//  0.732936326 브리흐네 위스키
					case(144){itemString = `id:50199  quality:100`; iCumRate += 32 ;}	//  0.732936326 스크류 드라이버
					case(145){itemString = `id:50200  quality:100`; iCumRate += 32 ;}	//  0.732936326 라인 슬링
					case(146){itemString = `id:50202  quality:100`; iCumRate += 32 ;}	//  0.732936326 키스 온 더 립스
					case(147){itemString = `id:50203  quality:100`; iCumRate += 32 ;}	//  0.732936326 레드 선라이즈
					case(148){itemString = `id:50183  quality:100`; iCumRate += 32 ;}	//  0.732936326 데브니쉬 흑맥주
					case(149){itemString = `id:50123  quality:100`; iCumRate += 32 ;}	//  0.732936326 베이컨구이
					case(150){itemString = `id:50124  quality:100`; iCumRate += 32 ;}	//  0.732936326 비프 스테이크
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int randomSetId = 1027;   // 고유 ID.. RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);

			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);
			player.ShowCaption(["event.useitem_event.38"]);
			int itemID2 = newItem.GetClassId();
			string charName = player.GetDisplayName();
			string ItemName;
			if (itemID2 == 40292 || itemID2 == 40958 || itemID2 == 40313 || itemID2 == 18261)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
			{
				ItemName = newItem.GetFullLocalName();
				AnnounceAllChannel(2, charName + ["event.useitem_event.44"]+ ItemName + ["event.useitem_event.45"]);
			}

			if (bUsePremiumKey)
			{
				GiveItemByPremiumKey(player, itemID);
			}
			if (bMonster)
			{
				// 몬스터 소환
				GenerateMonster(player);
			}
		}
		else
		{
			int iRandom		= Random(10000);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:40095`; iCumRate += 	2	; } //	드래곤 블레이드	(	0.02	%)
					case(	1	) { itemString = `id:13043`; iCumRate += 	2	; } //	레미니아 성월의 갑옷(남성용)	(	0.02	%)
					case(	2	) { itemString = `id:13044`; iCumRate += 	2	; } //	레미니아 성월의 갑옷(여성용)	(	0.02	%)
					case(	3	) { itemString = `id:13045`; iCumRate += 	2	; } //	아리쉬 아슈빈 아머(남성용)	(	0.02	%)
					case(	4	) { itemString = `id:13046`; iCumRate += 	2	; } //	아리쉬 아슈빈 아머(여성용)	(	0.02	%)
					case(	5	) { itemString = `id:14019`; iCumRate += 	2	; } //	그레이스 플레이트 아머	(	0.02	%)
					case(	6	) { itemString = `id:13031`; iCumRate += 	2	; } //	스파이카 실버 플레이트 아머	(	0.02	%)
					case(	7	) { itemString = `id:13022`; iCumRate += 	2	; } //	로즈 플레이트 아머 (P타입)	(	0.02	%)
					case(	8	) { itemString = `id:40039`; iCumRate += 	20	; } //	아이스 원드	(	0.2	%)
					case(	9	) { itemString = `id:40090`; iCumRate += 	20	; } //	힐링 원드	(	0.2	%)
					case(	10	) { itemString = `id:40040`; iCumRate += 	20	; } //	파이어 원드	(	0.2	%)
					case(	11	) { itemString = `id:40038`; iCumRate += 	20	; } //	라이트닝 원드	(	0.2	%)
					case(	12	) { itemString = `id:40083`; iCumRate += 	20	; } //	훅 커틀러스	(	0.2	%)
					case(	13	) { itemString = `id:40100`; iCumRate += 	20	; } //	본 마린 소드	(	0.2	%)
					case(	14	) { itemString = `id:40032`; iCumRate += 	20	; } //	가고일 소드	(	0.2	%)
					case(	15	) { itemString = `id:18544`; iCumRate += 	20	; } //	펠리칸 프로텍터	(	0.2	%)
					case(	16	) { itemString = `id:18547`; iCumRate += 	20	; } //	파나쉬 헤드 프로텍터	(	0.2	%)
					case(	17	) { itemString = `id:17040`; iCumRate += 	20	; } //	이블 다잉 크라운	(	0.2	%)
					case(	18	) { itemString = `id:18542`; iCumRate += 	20	; } //	빅 체인 풀 헬름	(	0.2	%)
					case(	19	) { itemString = `id:18506`; iCumRate += 	20	; } //	윙 하프 헬름	(	0.2	%)
					case(	20	) { itemString = `id:18521`; iCumRate += 	20	; } //	유러피안 컴프	(	0.2	%)
					case(	21	) { itemString = `id:18500`; iCumRate += 	20	; } //	링 메일 헬름	(	0.2	%)
					case(	22	) { itemString = `id:18511`; iCumRate += 	20	; } //	플루트 풀 헬름	(	0.2	%)
					case(	23	) { itemString = `id:18502`; iCumRate += 	20	; } //	본 헬름	(	0.2	%)
					case(	24	) { itemString = `id:40172`; iCumRate += 	20	; } //	그레이트 소드	(	0.2	%)
					case(	25	) { itemString = `id:15065`; iCumRate += 	30	; } //	엘라 베스트 스커트	(	0.3	%)
					case(	26	) { itemString = `id:19007`; iCumRate += 	30	; } //	야광 머플러 로브	(	0.3	%)
					case(	27	) { itemString = `id:19017`; iCumRate += 	30	; } //	늑대 로브	(	0.3	%)
					case(	28	) { itemString = `id:19016`; iCumRate += 	30	; } //	곰 로브	(	0.3	%)
					case(	29	) { itemString = `id:19008`; iCumRate += 	30	; } //	코코 판다 로브	(	0.3	%)
					case(	30	) { itemString = `id:15137`; iCumRate += 	30	; } //	셀리나 하프 재킷 코트	(	0.3	%)
					case(	31	) { itemString = `id:15112`; iCumRate += 	30	; } //	셀리나 스쿨보이룩	(	0.3	%)
					case(	32	) { itemString = `id:18041`; iCumRate += 	30	; } //	큰 챙 깃털 모자	(	0.3	%)
					case(	33	) { itemString = `id:15135`; iCumRate += 	30	; } //	시크 수트	(	0.3	%)
					case(	34	) { itemString = `id:15155`; iCumRate += 	30	; } //	이디카이 성직자 예복(남성용)	(	0.3	%)
					case(	35	) { itemString = `id:15156`; iCumRate += 	30	; } //	이디카이 성직자 예복(여성용)	(	0.3	%)
					case(	36	) { itemString = `id:15151`; iCumRate += 	30	; } //	뉴욕마리오 웨이스트 테일러 웨어(남성용)	(	0.3	%)
					case(	37	) { itemString = `id:15152`; iCumRate += 	30	; } //	뉴욕마리오 웨이스트 테일러 웨어(여성용)	(	0.3	%)
					case(	38	) { itemString = `id:15153`; iCumRate += 	30	; } //	산드라 스나이퍼 수트(남성용)	(	0.3	%)
					case(	39	) { itemString = `id:15154`; iCumRate += 	30	; } //	산드라 스나이퍼 수트(여성용)	(	0.3	%)
					case(	40	) { itemString = `id:15157`; iCumRate += 	30	; } //	위스 보위군 의복(남성용)	(	0.3	%)
					case(	41	) { itemString = `id:15158`; iCumRate += 	30	; } //	위스 보위군 의복(여성용)	(	0.3	%)
					case(	42	) { itemString = `id:15115`; iCumRate += 	30	; } //	재기드 미니 스커트	(	0.3	%)
					case(	43	) { itemString = `id:15059`; iCumRate += 	30	; } //	터크스 탱크탑 반바지	(	0.3	%)
					case(	44	) { itemString = `id:15070`; iCumRate += 	30	; } //	아이돌 리본 드레스	(	0.3	%)
					case(	45	) { itemString = `id:19009`; iCumRate += 	30	; } //	코코 래빗 로브	(	0.3	%)
					case(	46	) { itemString = `id:19029`; iCumRate += 	30	; } //	자이언트 베어 로브	(	0.3	%)
					case(	47	) { itemString = `id:15074`; iCumRate += 	30	; } //	루이스 성직자 코트	(	0.3	%)
					case(	48	) { itemString = `id:15061`; iCumRate += 	30	; } //	물결무늬 옆트임 튜닉	(	0.3	%)
					case(	49	) { itemString = `id:18045`; iCumRate += 	40	; } //	별장식 마법사 모자	(	0.4	%)
					case(	50	) { itemString = `id:18034`; iCumRate += 	40	; } //	볼륨 베레모	(	0.4	%)
					case(	51	) { itemString = `id:18005`; iCumRate += 	40	; } //	몬거 마법사모자	(	0.4	%)
					case(	52	) { itemString = `id:18006`; iCumRate += 	40	; } //	마법사모자	(	0.4	%)
					case(	53	) { itemString = `id:18019`; iCumRate += 	40	; } //	리리나 깃털모자	(	0.4	%)
					case(	54	) { itemString = `id:18020`; iCumRate += 	40	; } //	몬거 깃털모자	(	0.4	%)
					case(	55	) { itemString = `id:18113`; iCumRate += 	40	; } //	뾰족귀 고양이 모자	(	0.4	%)
					case(	56	) { itemString = `id:18114`; iCumRate += 	40	; } //	줄무늬 고양이 모자	(	0.4	%)
					case(	57	) { itemString = `id:18115`; iCumRate += 	40	; } //	핀 고양이 모자	(	0.4	%)
					case(	58	) { itemString = `id:18097`; iCumRate += 	40	; } //	세이렌 깃털 가면	(	0.4	%)
					case(	59	) { itemString = `id:18098`; iCumRate += 	40	; } //	세이렌의 안경	(	0.4	%)
					case(	60	) { itemString = `id:18099`; iCumRate += 	40	; } //	세이렌 작은 날개 가면	(	0.4	%)
					case(	61	) { itemString = `id:18100`; iCumRate += 	40	; } //	세이렌 날개 가면	(	0.4	%)
					case(	62	) { itemString = `id:18101`; iCumRate += 	40	; } //	세이렌 박쥐 날개 가면	(	0.4	%)
					case(	63	) { itemString = `id:18102`; iCumRate += 	40	; } //	세이렌의 가면	(	0.4	%)
					case(	64	) { itemString = `id:15055`; iCumRate += 	40	; } //	세이렌 고양이 가면	(	0.4	%)
					case(	65	) { itemString = `id:18044`; iCumRate += 	50	; } //	범죄용 복면	(	0.5	%)
					case(	66	) { itemString = `id:18112`; iCumRate += 	50	; } //	해 분장 소품	(	0.5	%)
					case(	67	) { itemString = `id:18111`; iCumRate += 	50	; } //	나무 분장 소품	(	0.5	%)
					case(	68	) { itemString = `id:18110`; iCumRate += 	50	; } //	덤불 분장 소품	(	0.5	%)
					case(	69	) { itemString = `id:18109`; iCumRate += 	50	; } //	나오 분장 소품	(	0.5	%)
					case(	70	) { itemString = `id:18108`; iCumRate += 	50	; } //	바위 분장 소품	(	0.5	%)
					case(	71	) { itemString = `id:18029`; iCumRate += 	50	; } //	나무테 안경	(	0.5	%)
					case(	72	) { itemString = `id:18028`; iCumRate += 	50	; } //	접이식 안경	(	0.5	%)
					case(	73	) { itemString = `id:16500`; iCumRate += 	50	; } //	울나 프로텍터 글러브	(	0.5	%)
					case(	74	) { itemString = `id:40071`; iCumRate += 	60	; } //	'라' 음 빈 병	(	0.6	%)
					case(	75	) { itemString = `id:40072`; iCumRate += 	60	; } //	'시' 음 빈 병	(	0.6	%)
					case(	76	) { itemString = `id:40073`; iCumRate += 	60	; } //	'도' 음 빈 병	(	0.6	%)
					case(	77	) { itemString = `id:40074`; iCumRate += 	60	; } //	'레' 음 빈 병	(	0.6	%)
					case(	78	) { itemString = `id:40075`; iCumRate += 	60	; } //	'미' 음 빈 병	(	0.6	%)
					case(	79	) { itemString = `id:40076`; iCumRate += 	60	; } //	'파' 음 빈 병	(	0.6	%)
					case(	80	) { itemString = `id:40077`; iCumRate += 	60	; } //	'솔' 음 빈 병	(	0.6	%)
					case(	81	) { itemString = `id:16517`; iCumRate += 	60	; } //	반대 장갑	(	0.6	%)
					case(	82	) { itemString = `id:16516`; iCumRate += 	60	; } //	찬성 장갑	(	0.6	%)
					case(	83	) { itemString = `id:16515`; iCumRate += 	60	; } //	보 장갑	(	0.6	%)
					case(	84	) { itemString = `id:16514`; iCumRate += 	60	; } //	바위 장갑	(	0.6	%)
					case(	85	) { itemString = `id:16513`; iCumRate += 	60	; } //	가위 장갑	(	0.6	%)
					case(	86	) { itemString = `id:40068`; iCumRate += 	60	; } //	가위 모양 지시봉	(	0.6	%)
					case(	87	) { itemString = `id:40069`; iCumRate += 	60	; } //	바위 모양 지시봉	(	0.6	%)
					case(	88	) { itemString = `id:40053`; iCumRate += 	60	; } //	보라빛 장미 꽃다발	(	0.6	%)
					case(	89	) { itemString = `id:40054`; iCumRate += 	60	; } //	보라빛 장미 한송이	(	0.6	%)
					case(	90	) { itemString = `id:18089`; iCumRate += 	60	; } //	보라빛 장미 장식	(	0.6	%)
					case(	91	) { itemString = `id:40052`; iCumRate += 	60	; } //	파란 장미 한송이	(	0.6	%)
					case(	92	) { itemString = `id:18090`; iCumRate += 	60	; } //	파란 장미 장식	(	0.6	%)
					case(	93	) { itemString = `id:40070`; iCumRate += 	60	; } //	보 모양 지시봉	(	0.6	%)
					case(	94	) { itemString = `id:18086`; iCumRate += 	60	; } //	데이지 꽃 장식	(	0.6	%)
					case(	95	) { itemString = `id:18087`; iCumRate += 	60	; } //	장미 꽃 장식	(	0.6	%)
					case(	96	) { itemString = `id:62005 prefix:20203`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	97	) { itemString = `id:62005 prefix:21003`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	98	) { itemString = `id:62005 suffix:30201`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	99	) { itemString = `id:62005 suffix:30302`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	100	) { itemString = `id:62005 prefix:20201`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	101	) { itemString = `id:62005 suffix:30304`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	102	) { itemString = `id:62005 suffix:30702`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	103	) { itemString = `id:62005 suffix:30704`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	104	) { itemString = `id:62005 suffix:30801`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	105	) { itemString = `id:62005 suffix:30802`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	106	) { itemString = `id:62005 suffix:30803`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	107	) { itemString = `id:62005 suffix:30804`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	108	) { itemString = `id:62005 prefix:20405`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	109	) { itemString = `id:62005 prefix:20501`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	110	) { itemString = `id:62005 prefix:20602`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	111	) { itemString = `id:62005 prefix:20701`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	112	) { itemString = `id:62005 suffix:30506`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	113	) { itemString = `id:62005 suffix:30614`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	114	) { itemString = `id:62005 prefix:20108`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	115	) { itemString = `id:62005 prefix:20304`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	116	) { itemString = `id:62005 prefix:20505`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	117	) { itemString = `id:62005 prefix:20209`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	118	) { itemString = `id:62005 prefix:20409`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	119	) { itemString = `id:62005 prefix:20615`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	120	) { itemString = `id:62005 prefix:20508`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	121	) { itemString = `id:62005 prefix:20618`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	122	) { itemString = `id:62005 prefix:20718`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	123	) { itemString = `id:62005 prefix:20212`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	124	) { itemString = `id:62005 prefix:20412`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	125	) { itemString = `id:62005 prefix:20619`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	126	) { itemString = `id:62005 suffix:30616`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	127	) { itemString = `id:62005 suffix:30617`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	128	) { itemString = `id:62005 suffix:30618`; iCumRate += 	80	; } //	인챈트 스크롤	(	0.8	%)
					case(	129	) { itemString = `id:91034`; iCumRate += 	184	; } //		(	1.84	%)
					case(	130	) { itemString = `id:40033`; iCumRate += 	70	; } //	클레이모어	(	0.7	%)
					case(	131	) { itemString = `id:40011`; iCumRate += 	70	; } //	브로드 소드	(	0.7	%)
					case(	132	) { itemString = `id:40030`; iCumRate += 	70	; } //	투 핸디드 소드	(	0.7	%)
					case(	133	) { itemString = `id:40012`; iCumRate += 	70	; } //	바스타드 소드	(	0.7	%)
					case(	134	) { itemString = `id:40007`; iCumRate += 	70	; } //	한손도끼	(	0.7	%)
					case(	135	) { itemString = `id:40014`; iCumRate += 	70	; } //	콤포짓 보우	(	0.7	%)
					case(	136	) { itemString = `id:40078`; iCumRate += 	70	; } //	비펜니스	(	0.7	%)
					case(	137	) { itemString = `id:40080`; iCumRate += 	70	; } //	글라디우스	(	0.7	%)
					case(	138	) { itemString = `id:40006`; iCumRate += 	70	; } //	단검	(	0.7	%)
					case(	139	) { itemString = `id:40031`; iCumRate += 	70	; } //	석궁	(	0.7	%)
					case(	140	) { itemString = `id:40081`; iCumRate += 	70	; } //	레더 롱 보우	(	0.7	%)
					case(	141	) { itemString = `id:40079`; iCumRate += 	70	; } //	메이스	(	0.7	%)
					case(	142	) { itemString = `id:51003 count:10`; iCumRate += 	65	; } //	생명력 50 포션	(	0.65	%)
					case(	143	) { itemString = `id:51004 count:10`; iCumRate += 	65	; } //	생명력 100 포션	(	0.65	%)
					case(	144	) { itemString = `id:51007 count:10`; iCumRate += 	65	; } //	마나 30 포션	(	0.65	%)
					case(	145	) { itemString = `id:51008 count:10`; iCumRate += 	65	; } //	마나 50 포션	(	0.65	%)
					case(	146	) { itemString = `id:51013 count:10`; iCumRate += 	65	; } //	스태미나 50 포션	(	0.65	%)
					case(	147	) { itemString = `id:51014 count:10`; iCumRate += 	65	; } //	스태미나 100 포션	(	0.65	%)
					case(	148	) { itemString = `id:51001 count:10`; iCumRate += 	65	; } //	생명력 10 포션	(	0.65	%)
					case(	149	) { itemString = `id:51002 count:10`; iCumRate += 	65	; } //	생명력 30 포션	(	0.65	%)
					case(	150	) { itemString = `id:51022 count:10`; iCumRate += 	65	; } //	생명력과 마나 30 포션	(	0.65	%)
					case(	151	) { itemString = `id:51027 count:10`; iCumRate += 	65	; } //	생명력과 스태미나 30 포션	(	0.65	%)
					case(	152	) { itemString = `id:51028 count:10`; iCumRate += 	65	; } //	생명력과 스태미나 50 포션	(	0.65	%)
					case(	153	) { itemString = `id:51029 count:10`; iCumRate += 	65	; } //	생명력과 스태미나 100 포션	(	0.65	%)
					case(	154	) { itemString = `id:63000 count:10`; iCumRate += 	65	; } //	피닉스의 깃털	(	0.65	%)
					case(	155	) { itemString = `id:60037 count:5`; iCumRate += 	65	; } //	블랙 유스 포션	(	0.65	%)
					case(	156	) { itemString = `id:60038 count:5`; iCumRate += 	65	; } //	레드 포션	(	0.65	%)
					case(	157	) { itemString = `id:62004 count:5`; iCumRate += 	65	; } //	마법가루	(	0.65	%)
					case(	158	) { itemString = `id:50012 count:5`; iCumRate += 	65	; } //	황금 달걀	(	0.65	%)
					case(	159	) { itemString = `id:50013 count:5`; iCumRate += 	65	; } //	황금 사과	(	0.65	%)
					case(	160	) { itemString = `id:50163 quality:100`; iCumRate += 	60	; } //	피쉬 앤 칩스	(	0.6	%)
					case(	161	) { itemString = `id:50164 quality:100`; iCumRate += 	60	; } //	T본 스테이크	(	0.6	%)
					case(	162	) { itemString = `id:50165 quality:100`; iCumRate += 	60	; } //	치즈 그라탕	(	0.6	%)
					case(	163	) { itemString = `id:50166 quality:100`; iCumRate += 	60	; } //	카레 라이스	(	0.6	%)
					case(	164	) { itemString = `id:50167 quality:100`; iCumRate += 	60	; } //	코 코 뱅	(	0.6	%)
					case(	165	) { itemString = `id:50168 quality:100`; iCumRate += 	60	; } //	송어찜	(	0.6	%)
					case(	166	) { itemString = `id:50169 quality:100`; iCumRate += 	60	; } //	부야 베스	(	0.6	%)
					case(	167	) { itemString = `id:50170 quality:100`; iCumRate += 	60	; } //	치즈 퐁듀	(	0.6	%)
					case(	168	) { itemString = `id:50171 quality:100`; iCumRate += 	60	; } //	이멘 마하산 와인	(	0.6	%)
					case(	169	) { itemString = `id:50172 quality:100`; iCumRate += 	60	; } //	레어치즈 케익	(	0.6	%)
					case(	170	) { itemString = `id:50173 quality:100`; iCumRate += 	60	; } //	가토 오 쇼콜라	(	0.6	%)
					case(	171	) { itemString = `id:50174 quality:100`; iCumRate += 	60	; } //	크로크 무슈	(	0.6	%)
					case(	172	) { itemString = `id:50175 quality:100`; iCumRate += 	60	; } //	브라우니	(	0.6	%)
					case(	173	) { itemString = `id:50176 quality:100`; iCumRate += 	60	; } //	버터 비스킷	(	0.6	%)
					case(	174	) { itemString = `id:50177 quality:100`; iCumRate += 	60	; } //	초코칩 쿠키	(	0.6	%)
					case(	175	) { itemString = `id:50178 quality:100`; iCumRate += 	60	; } //	오렌지 주스	(	0.6	%)
					case(	176	) { itemString = `id:50179 quality:100`; iCumRate += 	60	; } //	레몬 주스	(	0.6	%)
					case(	177	) { itemString = `id:50180 quality:100`; iCumRate += 	60	; } //	초콜릿 우유	(	0.6	%)
					case(	178	) { itemString = `id:50181 quality:100`; iCumRate += 	60	; } //	라인산 진	(	0.6	%)
					case(	179	) { itemString = `id:50182 quality:100`; iCumRate += 	60	; } //	브리흐네 위스키	(	0.6	%)
					case(	180	) { itemString = `id:50199 quality:100`; iCumRate += 	60	; } //	스크류 드라이버	(	0.6	%)
					case(	181	) { itemString = `id:50200 quality:100`; iCumRate += 	60	; } //	라인 슬링	(	0.6	%)
					case(	182	) { itemString = `id:50201 quality:100`; iCumRate += 	60	; } //	BnR	(	0.6	%)
					case(	183	) { itemString = `id:50202 quality:100`; iCumRate += 	60	; } //	키스 온 더 립스	(	0.6	%)
					case(	184	) { itemString = `id:50203 quality:100`; iCumRate += 	60	; } //	레드 선라이즈	(	0.6	%)
					case(	185	) { itemString = `id:50183 quality:100`; iCumRate += 	60	; } //	데브니쉬 흑맥주	(	0.6	%)
					case(	186	) { itemString = `id:50123 quality:100`; iCumRate += 	60	; } //	베이컨구이	(	0.6	%)
					case(	187	) { itemString = `id:50124 quality:100`; iCumRate += 	60	; } //	비프 스테이크	(	0.6	%)
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
	}

	// 중국 보물상자 이벤트용 ~ 고급 보물상자
	else if (itemID == 91039)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			int iRandom		= Random(3285);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;

				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;}	//0.030441400 	레미니아 성월의 갑옷(남성용)
					case(1){itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;}	//0.030441400 	레미니아 성월의 갑옷(여성용)
					case(2){itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;}	//0.030441400 	아리쉬 아슈빈 아머(남성용)
					case(3){itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;}	//0.030441400 	아리쉬 아슈빈 아머(여성용)
					case(4){itemString = `id:40033 col1:111111 col2:111111 col3:111111`; iCumRate += 1;}	//0.030441400 	검정빛 클레이모어
					case(5){itemString = `id:63034 col1:ff0000`; iCumRate += 2;}	//0.060882801 	붉은색 염색 앰플
					case(6){itemString = `id:63033 col1:000000`; iCumRate += 2;}	//0.060882801 	검은색 염색 앰플
					case(7){itemString = `id:40033 suffix:30702`; iCumRate += 2;}	//0.060882801 	클레이모어
					case(8){itemString = `id:40090 suffix:31003`; iCumRate += 2;}	//0.060882801 	힐링 원드
					case(9){itemString = `id:40038 suffix:31003`; iCumRate += 2;}	//0.060882801 	라이트닝 원드
					case(10){itemString = `id:40040 suffix:31003`; iCumRate += 2;}	//0.060882801 	파이어 원드
					case(11){itemString = `id:40041 suffix:31003`; iCumRate += 2;}	//0.060882801 	타격용 원드
					case(12){itemString = `id:15043`; iCumRate += 2;}	//0.060882801 	스포티 웨어 세트
					case(13){itemString = `id:40010 col1:6666ff col2:0053A6 col3:004080`; iCumRate += 2;}	//0.060882801 	푸른 롱 소드
					case(14){itemString = `id:63030 col1:61000800`; iCumRate += 2;}	//0.060882801 	반짝이 지정 색상 염색 앰플
					case(15){itemString = `id:13043`; iCumRate += 4;}	//0.121765601 	레미니아 성월의 갑옷(남성용)
					case(16){itemString = `id:13044`; iCumRate += 4;}	//0.121765601 	레미니아 성월의 갑옷(여성용)
					case(17){itemString = `id:13045`; iCumRate += 4;}	//0.121765601 	아리쉬 아슈빈 아머(남성용)
					case(18){itemString = `id:13046`; iCumRate += 4;}	//0.121765601 	아리쉬 아슈빈 아머(여성용)
					case(19){itemString = `id:40081 suffix:30702`; iCumRate += 4;}	//0.121765601 	레더 롱 보우
					case(20){itemString = `id:40080 suffix:30702`; iCumRate += 4;}	//0.121765601 	글라디우스
					case(21){itemString = `id:15153`; iCumRate += 4;}	//0.121765601 	@산드라 스나이퍼 수트(남성용)
					case(22){itemString = `id:15154`; iCumRate += 4;}	//0.121765601 	@산드라 스나이퍼 수트(여성용)
					case(23){itemString = `id:16026`; iCumRate += 4;}	//0.121765601 	@산드라 스나이퍼 수트 글러브
					case(24){itemString = `id:17060`; iCumRate += 4;}	//0.121765601 	@산드라 스나이퍼 수트 부츠(남성용)
					case(25){itemString = `id:17061`; iCumRate += 4;}	//0.121765601 	@산드라 스나이퍼 수트 부츠(여성용)
					case(26){itemString = `id:17031`; iCumRate += 8;}	//0.243531202 	아웃도어 앵클 부츠
					case(27){itemString = `id:40002 col1:202020`; iCumRate += 8;}	//0.243531202 	검은 연습용 목도
					case(28){itemString = `id:15030`; iCumRate += 8;}	//0.243531202 	코레스 힐러 슈트
					case(29){itemString = `id:15041`; iCumRate += 8;}	//0.243531202 	사무직 여성용 슈트
					case(30){itemString = `id:15051`; iCumRate += 8;}	//0.243531202 	타이트 벨트 웨어
					case(31){itemString = `id:17025`; iCumRate += 8;}	//0.243531202 	샌달
					case(32){itemString = `id:40078 suffix:30702`; iCumRate += 8;}	//0.243531202 	비펜니스
					case(33){itemString = `id:40079 prefix:20701`; iCumRate += 8;}	//0.243531202 	메이스
					case(34){itemString = `id:40031 prefix:20701`; iCumRate += 8;}	//0.243531202 	석궁
					case(35){itemString = `id:40030 suffix:30702`; iCumRate += 8;}	//0.243531202 	투 핸디드 소드
					case(36){itemString = `id:40013 prefix:20701`; iCumRate += 8;}	//0.243531202 	롱 보우
					case(37){itemString = `id:40014 prefix:20701`; iCumRate += 8;}	//0.243531202 	콤포짓 보우
					case(38){itemString = `id:40016 prefix:20701`; iCumRate += 8;}	//0.243531202 	해머
					case(39){itemString = `id:40010 suffix:30702`; iCumRate += 8;}	//0.243531202 	롱 소드
					case(40){itemString = `id:40011 suffix:30702`; iCumRate += 8;}	//0.243531202 	브로드 소드
					case(41){itemString = `id:40012 suffix:30702`; iCumRate += 8;}	//0.243531202 	바스타드 소드
					case(42){itemString = `id:40015 suffix:30702`; iCumRate += 8;}	//0.243531202 	플루트 숏 소드
					case(43){itemString = `id:40003 prefix:20701`; iCumRate += 8;}	//0.243531202 	숏 보우
					case(44){itemString = `id:40005 suffix:30702`; iCumRate += 8;}	//0.243531202 	숏 소드
					case(45){itemString = `id:40006 suffix:30702`; iCumRate += 8;}	//0.243531202 	단검
					case(46){itemString = `id:40002 suffix:30702`; iCumRate += 8;}	//0.243531202 	연습용 목도
					case(47){itemString = `id:13010`; iCumRate += 8;}	//0.243531202 	@라운드 폴드론 체인메일
					case(48){itemString = `id:13023`; iCumRate += 8;}	//0.243531202 	@로즈 플레이트 아머 (B타입)
					case(49){itemString = `id:16504`; iCumRate += 8;}	//0.243531202 	@카운터 건틀렛
					case(50){itemString = `id:17500`; iCumRate += 8;}	//0.243531202 	@하이폴린 플레이트 부츠
					case(51){itemString = `id:18508`; iCumRate += 8;}	//0.243531202 	@슬릿 풀 헬름
					case(52){itemString = `id:40006`; iCumRate += 16;}	//0.487062405 	단검
					case(53){itemString = `id:40005`; iCumRate += 16;}	//0.487062405 	숏 소드
					case(54){itemString = `id:40010`; iCumRate += 16;}	//0.487062405 	롱 소드
					case(55){itemString = `id:40007`; iCumRate += 16;}	//0.487062405 	한손 도끼
					case(56){itemString = `id:40016`; iCumRate += 16;}	//0.487062405 	해머
					case(57){itemString = `id:40015`; iCumRate += 16;}	//0.487062405 	플루트 숏소드
					case(58){itemString = `id:40030`; iCumRate += 16;}	//0.487062405 	투 핸디드 소드
					case(59){itemString = `id:40011`; iCumRate += 16;}	//0.487062405 	브로드 소드
					case(60){itemString = `id:40033`; iCumRate += 16;}	//0.487062405 	클레이모어
					case(61){itemString = `id:40012`; iCumRate += 16;}	//0.487062405 	바스타드 소드
					case(62){itemString = `id:40019`; iCumRate += 16;}	//0.487062405 	굵은 나뭇가지
					case(63){itemString = `id:40020`; iCumRate += 16;}	//0.487062405 	나무 몽둥이
					case(64){itemString = `id:40031`; iCumRate += 16;}	//0.487062405 	석궁
					case(65){itemString = `id:40013`; iCumRate += 16;}	//0.487062405 	롱 보우
					case(66){itemString = `id:40014`; iCumRate += 16;}	//0.487062405 	콤포짓 보우
					case(67){itemString = `id:40003`; iCumRate += 16;}	//0.487062405 	숏 보우
					case(68){itemString = `id:46001`; iCumRate += 16;}	//0.487062405 	라운드 실드
					case(69){itemString = `manual:106`; iCumRate += 16;}	//0.487062405 	옷본 - 포포스커트(여)
					case(70){itemString = `manual:112`; iCumRate += 16;}	//0.487062405 	옷본 - 마법사모자
					case(71){itemString = `manual:114`; iCumRate += 16;}	//0.487062405 	옷본 - 머리띠
					case(72){itemString = `manual:107`; iCumRate += 16;}	//0.487062405 	옷본 - 몬거 여행자옷(여)
					case(73){itemString = `manual:108`; iCumRate += 16;}	//0.487062405 	옷본 - 몬거 여행자옷(남)
					case(74){itemString = `manual:102`; iCumRate += 16;}	//0.487062405 	옷본 - 마법학교 교복(남)
					case(75){itemString = `manual:115`; iCumRate += 16;}	//0.487062405 	옷본 - 몬거 롱스커트(여)
					case(76){itemString = `manual:118`; iCumRate += 16;}	//0.487062405 	옷본 - 코레스 닌자슈트(남)
					case(77){itemString = `manual:111`; iCumRate += 16;}	//0.487062405 	옷본 - 가디언 장갑
					case(78){itemString = `manual:117`; iCumRate += 16;}	//0.487062405 	옷본 - 리리나 롱스커트(여)
					case(79){itemString = `manual:105`; iCumRate += 16;}	//0.487062405 	옷본 - 몬거 모자
					case(80){itemString = `manual:109`; iCumRate += 16;}	//0.487062405 	옷본 - 클로스 메일
					case(81){itemString = `manual:116`; iCumRate += 16;}	//0.487062405 	옷본 - 라이트 레더메일(여)
					case(82){itemString = `manual:120`; iCumRate += 16;}	//0.487062405 	옷본 - 라이트 레더메일(남)
					case(83){itemString = `manual:126`; iCumRate += 16;}	//0.487062405 	옷본 - 루이스 베스트 웨어(남)
					case(84){itemString = `manual:122`; iCumRate += 16;}	//0.487062405 	옷본 - 전문가용 실크방직 장갑
					case(85){itemString = `manual:119`; iCumRate += 16;}	//0.487062405 	옷본 - 코레스 씨프슈트(남)
					case(86){itemString = `manual:123`; iCumRate += 16;}	//0.487062405 	옷본 - 레더 미니 원피스 링타입(여)
					case(87){itemString = `manual:20106`; iCumRate += 16;}	//0.487062405 	도면 - 낫
					case(88){itemString = `manual:20104`; iCumRate += 16;}	//0.487062405 	도면 - 곡괭이
					case(89){itemString = `manual:20131`; iCumRate += 16;}	//0.487062405 	도면 - 숏 소드
					case(90){itemString = `manual:20102`; iCumRate += 16;}	//0.487062405 	도면 - 단검
					case(91){itemString = `manual:20108`; iCumRate += 16;}	//0.487062405 	도면 - 스파이크 캡
					case(92){itemString = `manual:20103`; iCumRate += 16;}	//0.487062405 	도면 - 라운드 실드
					case(93){itemString = `manual:20105`; iCumRate += 16;}	//0.487062405 	도면 - 롱 소드
					case(94){itemString = `manual:20117`; iCumRate += 16;}	//0.487062405 	도면 - 그리브 부츠
					case(95){itemString = `manual:20134`; iCumRate += 16;}	//0.487062405 	도면 - 해머
					case(96){itemString = `manual:20135`; iCumRate += 16;}	//0.487062405 	도면 - 브로드 소드
					case(97){itemString = `manual:20137`; iCumRate += 16;}	//0.487062405 	도면 - 바스타드 소드
					case(98){itemString = `id:62005 prefix:6`; iCumRate += 16;}	//0.487062405 	스네이크헌터
					case(99){itemString = `id:62005 prefix:7`; iCumRate += 16;}	//0.487062405 	폭스헌터
					case(100){itemString = `id:62005 prefix:107`; iCumRate += 16;}	//0.487062405 	폭스테이머
					case(101){itemString = `id:62005 prefix:207`; iCumRate += 16;}	//0.487062405 	폭스
					case(102){itemString = `id:62005 suffix:10604`; iCumRate += 16;}	//0.487062405 	농부의
					case(103){itemString = `id:62005 suffix:11104`; iCumRate += 16;}	//0.487062405 	위크니스
					case(104){itemString = `id:60009 count:5`; iCumRate += 32;}	//0.974124810 	양털
					case(105){itemString = `id:60008 count:5`; iCumRate += 32;}	//0.974124810 	거미줄
					case(106){itemString = `id:60004 count:5`; iCumRate += 32;}	//0.974124810 	매듭끈
					case(107){itemString = `id:60028 count:10`; iCumRate += 32;}	//0.974124810 	일반 가죽끈
					case(108){itemString = `id:60013 count:10`; iCumRate += 32;}	//0.974124810 	고급 실크
					case(109){itemString = `id:60021 count:10`; iCumRate += 32;}	//0.974124810 	고급 옷감
					case(110){itemString = `id:60017 count:10`; iCumRate += 32;}	//0.974124810 	고급 마감용 실
					case(111){itemString = `id:60025 count:10`; iCumRate += 32;}	//0.974124810 	고급 가죽
					case(112){itemString = `id:60012 count:10`; iCumRate += 32;}	//0.974124810 	일반 실크
					case(113){itemString = `id:60016 count:10`; iCumRate += 32;}	//0.974124810 	일반 마감용 실
					case(114){itemString = `id:60020 count:10`; iCumRate += 32;}	//0.974124810 	일반 옷감
					case(115){itemString = `id:60024 count:10`; iCumRate += 32;}	//0.974124810 	일반 가죽
					case(116){itemString = `id:64002 count:10`; iCumRate += 32;}	//0.974124810 	철광석
					case(117){itemString = `id:64004 count:10`; iCumRate += 32;}	//0.974124810 	동광석
					case(118){itemString = `id:64006 count:10`; iCumRate += 32;}	//0.974124810 	은광석
					case(119){itemString = `id:64001 count:10`; iCumRate += 32;}	//0.974124810 	철괴
					case(120){itemString = `id:64003 count:10`; iCumRate += 32;}	//0.974124810 	동괴
					case(121){itemString = `id:64005 count:10`; iCumRate += 32;}	//0.974124810 	은괴
					case(122){itemString = `id:51102 count:10`; iCumRate += 32;}	//0.974124810 	마나 허브
					case(123){itemString = `id:51101 count:10`; iCumRate += 32;}	//0.974124810 	블러디 허브
					case(124){itemString = `id:51103 count:10`; iCumRate += 32;}	//0.974124810 	선라이트 허브
					case(125){itemString = `id:62003 count:5`; iCumRate += 32;}	//0.974124810 	축복받은 마법가루
					case(126){itemString = `id:63029 count:5`; iCumRate += 32;}	//0.974124810 	캠프파이어 키트
					case(127){itemString = `id:50006 count:5`; iCumRate += 32;}	//0.974124810 	고기 조각
					case(128){itemString = `id:40025`; iCumRate += 32;}	//0.974124810 	곡괭이
					case(129){itemString = `id:2001`; iCumRate += 32;}	//0.974124810 	금화주머니
					case(130){itemString = `id:40026`; iCumRate += 32;}	//0.974124810 	낫
					case(131){itemString = `id:40024`; iCumRate += 32;}	//0.974124810 	대장장이 망치
					case(132){itemString = `id:50203`; iCumRate += 32;}	//0.974124810 	레드 선라이즈
					case(133){itemString = `id:62004 count:5`; iCumRate += 32;}	//0.974124810 	마법가루
					case(134){itemString = `id:63027 expire:10080`; iCumRate += 32;}	//0.974124810 	밀랍 날개
					case(135){itemString = `id:45002 count:100`; iCumRate += 32;}	//0.974124810 	볼트
					case(136){itemString = `id:60005 count:10`; iCumRate += 32;}	//0.974124810 	붕대
					case(137){itemString = `id:50124 quality:80`; iCumRate += 32;}	//0.974124810 	비프 스테이크 80퀄리티
					case(138){itemString = `id:63020`; iCumRate += 32;}	//0.974124810 	빈 병
					case(139){itemString = `id:51001 count:10`; iCumRate += 32;}	//0.974124810 	생명력 10 포션
					case(140){itemString = `id:51022 count:5`; iCumRate += 32;}	//0.974124810 	생명력과 마나 30 포션
					case(141){itemString = `id:51027 count:5`; iCumRate += 32;}	//0.974124810 	생명력과 스태미나 30 포션
					case(142){itemString = `id:51028 count:3`; iCumRate += 32;}	//0.974124810 	생명력과 스태미나 50 포션
					case(143){itemString = `id:51011 count:10`; iCumRate += 32;}	//0.974124810 	스태미나 10 포션
					case(144){itemString = `id:40042`; iCumRate += 32;}	//0.974124810 	식칼
					case(145){itemString = `id:63019 count:50`; iCumRate += 32;}	//0.974124810 	알비 배틀 아레나 코인
					case(146){itemString = `id:63043 count:3`; iCumRate += 32;}	//0.974124810 	어드밴스드 깃털
					case(147){itemString = `id:63001`; iCumRate += 32;}	//0.974124810 	여신의 날개
					case(148){itemString = `id:40002`; iCumRate += 32;}	//0.974124810 	연습용 목도
					case(149){itemString = `id:51031 count:3`; iCumRate += 32;}	//0.974124810 	완전 회복의 포션
					case(150){itemString = `id:50014`; iCumRate += 32;}	//0.974124810 	왕감자
					case(151){itemString = `id:63026`; iCumRate += 32;}	//0.974124810 	원격 은행 이용권
					case(152){itemString = `id:63057`; iCumRate += 32;}	//0.974124810 	원격 의류 수리 이용권
					case(153){itemString = `id:63047`; iCumRate += 32;}	//0.974124810 	원격 힐러집 이용권
					case(154){itemString = `id:40023`; iCumRate += 32;}	//0.974124810 	채집용 단검
					case(155){itemString = `id:40022`; iCumRate += 32;}	//0.974124810 	채집용 도끼
					case(156){itemString = `id:63016 count:3`; iCumRate += 32;}	//0.974124810 	축복의 포션
					case(157){itemString = `id:63039 expire:10080`; iCumRate += 32;}	//0.974124810 	캠프 키트
					case(158){itemString = `id:63029 count:5`; iCumRate += 32;}	//0.974124810 	캠프파이어키트
					case(159){itemString = `id:50005`; iCumRate += 32;}	//0.974124810 	커다란 고기덩어리
					case(160){itemString = `id:2006`; iCumRate += 32;}	//0.974124810 	큰 금화주머니
					case(161){itemString = `id:50202`; iCumRate += 32;}	//0.974124810 	키스 온 더 립스
					case(162){itemString = `id:63044 count:3`; iCumRate += 32;}	//0.974124810 	파티 부활의 깃털
					case(163){itemString = `id:63000 count:3`; iCumRate += 32;}	//0.974124810 	피닉스의 깃털
					case(164){itemString = `id:40027`; iCumRate += 32;}	//0.974124810 	호미
					case(165){itemString = `id:45001 count:100`; iCumRate += 32;}	//0.974124810 	화살
					case(166){itemString = `id:63058`; iCumRate += 32;}	//0.974124810 	회복 속도 증가 포션
					case(167){itemString = `id:50201 quality:80`; iCumRate += 32;}	//0.974124810 	BnR 80퀄리티
					case(168){itemString = `id:50164 quality:80`; iCumRate += 32;}	//0.974124810 	T본 스테이크 80퀄리티
					case(169){itemString = `id:40004`; iCumRate += 32;}	//0.974124810 	류트
					case(170){itemString = `id:40018`; iCumRate += 32;}	//0.974124810 	우쿨렐레
					case(171){itemString = `id:40017`; iCumRate += 32;}	//0.974124810 	만돌린
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int randomSetId = 1028;   // 고유 ID.. RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);

			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);
			player.ShowCaption(["event.useitem_event.38"]);
			int itemID2 = newItem.GetClassId();
			string charName = player.GetDisplayName();
			string ItemName;
			if (itemID2 == 40292 || itemID2 == 40958 || itemID2 == 40313 || itemID2 == 18261)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
			{
				ItemName = newItem.GetFullLocalName();
				AnnounceAllChannel(2, charName + ["event.useitem_event.44"]+ ItemName + ["event.useitem_event.45"]);
			}

			if (bUsePremiumKey)
			{
				GiveItemByPremiumKey(player, itemID);
			}
			if (bMonster)
			{
				// 몬스터 소환
				GenerateMonster(player);
			}
		}
		else
		{
			int iRandom		= Random(10000);			// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:15079`; iCumRate += 	2	; } //	볼레로 앤 점퍼 스커트	(	0.02	%)
					case(	1	) { itemString = `id:15204`; iCumRate += 	2	; } //	남성용 유카타	(	0.02	%)
					case(	2	) { itemString = `id:15225`; iCumRate += 	2	; } //	여성용 유카타	(	0.02	%)
					case(	3	) { itemString = `id:15224`; iCumRate += 	2	; } //	남성용 유카타	(	0.02	%)
					case(	4	) { itemString = `id:15203`; iCumRate += 	2	; } //	여성용 유카타	(	0.02	%)
					case(	5	) { itemString = `id:40170`; iCumRate += 	2	; } //	일본식 양손검	(	0.02	%)
					case(	6	) { itemString = `id:40095`; iCumRate += 	3	; } //	드래곤 블레이드	(	0.03	%)
					case(	7	) { itemString = `id:13038`; iCumRate += 	3	; } //	더스틴 실버 나이트 아머	(	0.03	%)
					case(	8	) { itemString = `id:13032`; iCumRate += 	4	; } //	발렌시아 크로스 라인 플레이트 아머(여성용)	(	0.04	%)
					case(	9	) { itemString = `id:13033`; iCumRate += 	4	; } //	발렌시아 크로스 라인 플레이트 아머(남성용)	(	0.04	%)
					case(	10	) { itemString = `id:40031`; iCumRate += 	4	; } //	석궁	(	0.04	%)
					case(	11	) { itemString = `id:40081`; iCumRate += 	4	; } //	레더 롱 보우	(	0.04	%)
					case(	12	) { itemString = `id:40172`; iCumRate += 	4	; } //	그레이트 소드	(	0.04	%)
					case(	13	) { itemString = `id:13038 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	더스틴 실버 나이트 아머	(	0.1	%)
					case(	14	) { itemString = `id:14025 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	카멜 스피리트 아머(남성용)	(	0.1	%)
					case(	15	) { itemString = `id:14026 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	카멜 스피리트 아머(여성용)	(	0.1	%)
					case(	16	) { itemString = `id:13032 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	발렌시아 크로스 라인 플레이트 아머(여성용)	(	0.1	%)
					case(	17	) { itemString = `id:13033 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	발렌시아 크로스 라인 플레이트 아머(남성용)	(	0.1	%)
					case(	18	) { itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	레미니아 성월의 갑옷(남성용)	(	0.1	%)
					case(	19	) { itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	레미니아 성월의 갑옷(여성용)	(	0.1	%)
					case(	20	) { itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	아리쉬 아슈빈 아머(남성용)	(	0.1	%)
					case(	21	) { itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	아리쉬 아슈빈 아머(여성용)	(	0.1	%)
					case(	22	) { itemString = `id:14019 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	그레이스 플레이트 아머	(	0.1	%)
					case(	23	) { itemString = `id:18544 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	펠리칸 프로텍터	(	0.1	%)
					case(	24	) { itemString = `id:18547 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	파나쉬 헤드 프로텍터	(	0.1	%)
					case(	25	) { itemString = `id:17040 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	이블 다잉 크라운	(	0.1	%)
					case(	26	) { itemString = `id:40033 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	클레이모어	(	0.1	%)
					case(	27	) { itemString = `id:40039 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	아이스 원드	(	0.1	%)
					case(	28	) { itemString = `id:40090 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	힐링 원드	(	0.1	%)
					case(	29	) { itemString = `id:40040 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	파이어 원드	(	0.1	%)
					case(	30	) { itemString = `id:40038 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	라이트닝 원드	(	0.1	%)
					case(	31	) { itemString = `id:40177 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 	10	; } //	워리어 액스	(	0.1	%)
					case(	32	) { itemString = `id:18113 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	뾰족귀 고양이 모자	(	0.2	%)
					case(	33	) { itemString = `id:18114 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	줄무늬 고양이 모자	(	0.2	%)
					case(	34	) { itemString = `id:18115 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	핀 고양이 모자	(	0.2	%)
					case(	35	) { itemString = `id:18056 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	별 토끼 머리띠1	(	0.2	%)
					case(	36	) { itemString = `id:18057 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	별 토끼 머리띠2	(	0.2	%)
					case(	37	) { itemString = `id:18058 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	별 토끼 머리띠3	(	0.2	%)
					case(	38	) { itemString = `id:18059 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	별 토끼 머리띠4	(	0.2	%)
					case(	39	) { itemString = `id:18060 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	별 토끼 머리띠5	(	0.2	%)
					case(	40	) { itemString = `id:18061 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	털 토끼 머리띠1	(	0.2	%)
					case(	41	) { itemString = `id:18062 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	털 토끼 머리띠2	(	0.2	%)
					case(	42	) { itemString = `id:18063 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	털 토끼 머리띠3	(	0.2	%)
					case(	43	) { itemString = `id:18064 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	털 토끼 머리띠4	(	0.2	%)
					case(	44	) { itemString = `id:18065 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	털 토끼 머리띠5	(	0.2	%)
					case(	45	) { itemString = `id:18066 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	가죽 토끼 머리띠1	(	0.2	%)
					case(	46	) { itemString = `id:18067 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	가죽 토끼 머리띠2	(	0.2	%)
					case(	47	) { itemString = `id:18068 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	가죽 토끼 머리띠3	(	0.2	%)
					case(	48	) { itemString = `id:18069 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	가죽 토끼 머리띠4	(	0.2	%)
					case(	49	) { itemString = `id:18070 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	가죽 토끼 머리띠5	(	0.2	%)
					case(	50	) { itemString = `id:18097 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌 깃털 가면	(	0.2	%)
					case(	51	) { itemString = `id:18098 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌의 안경	(	0.2	%)
					case(	52	) { itemString = `id:18099 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌 작은 날개 가면	(	0.2	%)
					case(	53	) { itemString = `id:18100 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌 날개 가면	(	0.2	%)
					case(	54	) { itemString = `id:18101 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌 박쥐 날개 가면	(	0.2	%)
					case(	55	) { itemString = `id:18102 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌의 가면	(	0.2	%)
					case(	56	) { itemString = `id:15055 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 	20	; } //	세이렌 고양이 가면	(	0.2	%)
					case(	57	) { itemString = `id:13032`; iCumRate += 	45	; } //	발렌시아 크로스 라인 플레이트 아머(여성용)	(	0.45	%)
					case(	58	) { itemString = `id:13033`; iCumRate += 	45	; } //	발렌시아 크로스 라인 플레이트 아머(남성용)	(	0.45	%)
					case(	59	) { itemString = `id:13043`; iCumRate += 	45	; } //	레미니아 성월의 갑옷(남성용)	(	0.45	%)
					case(	60	) { itemString = `id:13044`; iCumRate += 	45	; } //	레미니아 성월의 갑옷(여성용)	(	0.45	%)
					case(	61	) { itemString = `id:13045`; iCumRate += 	45	; } //	아리쉬 아슈빈 아머(남성용)	(	0.45	%)
					case(	62	) { itemString = `id:13046`; iCumRate += 	45	; } //	아리쉬 아슈빈 아머(여성용)	(	0.45	%)
					case(	63	) { itemString = `id:14019`; iCumRate += 	45	; } //	그레이스 플레이트 아머	(	0.45	%)
					case(	64	) { itemString = `id:13031`; iCumRate += 	45	; } //	스파이카 실버 플레이트 아머	(	0.45	%)
					case(	65	) { itemString = `id:13022`; iCumRate += 	45	; } //	로즈 플레이트 아머 (P타입)	(	0.45	%)
					case(	66	) { itemString = `id:40083`; iCumRate += 	60	; } //	훅 커틀러스	(	0.6	%)
					case(	67	) { itemString = `id:40032`; iCumRate += 	60	; } //	가고일 소드	(	0.6	%)
					case(	68	) { itemString = `id:15066`; iCumRate += 	60	; } //	루이스 베스트 웨어	(	0.6	%)
					case(	69	) { itemString = `id:15065`; iCumRate += 	60	; } //	엘라 베스트 스커트	(	0.6	%)
					case(	70	) { itemString = `id:15113`; iCumRate += 	60	; } //	여성용 검사학교 교복 쇼트타입	(	0.6	%)
					case(	71	) { itemString = `id:15114`; iCumRate += 	60	; } //	남성용 검사학교 교복 롱타입	(	0.6	%)
					case(	72	) { itemString = `id:15075`; iCumRate += 	60	; } //	셀리나 레이디 드레스	(	0.6	%)
					case(	73	) { itemString = `id:15095`; iCumRate += 	60	; } //	셀리나 오픈 레더 자켓	(	0.6	%)
					case(	74	) { itemString = `id:15096`; iCumRate += 	60	; } //	셀리나 섹시 베어룩	(	0.6	%)
					case(	75	) { itemString = `id:40100`; iCumRate += 	60	; } //	본 마린 소드	(	0.6	%)
					case(	76	) { itemString = `id:40039`; iCumRate += 	60	; } //	아이스 원드	(	0.6	%)
					case(	77	) { itemString = `id:40090`; iCumRate += 	60	; } //	힐링 원드	(	0.6	%)
					case(	78	) { itemString = `id:40040`; iCumRate += 	60	; } //	파이어 원드	(	0.6	%)
					case(	79	) { itemString = `id:40038`; iCumRate += 	60	; } //	라이트닝 원드	(	0.6	%)
					case(	80	) { itemString = `id:18544`; iCumRate += 	60	; } //	펠리칸 프로텍터	(	0.6	%)
					case(	81	) { itemString = `id:18506`; iCumRate += 	60	; } //	윙 하프 헬름	(	0.6	%)
					case(	82	) { itemString = `id:18547`; iCumRate += 	60	; } //	파나쉬 헤드 프로텍터	(	0.6	%)
					case(	83	) { itemString = `id:18521`; iCumRate += 	60	; } //	유러피안 컴프	(	0.6	%)
					case(	84	) { itemString = `id:18500`; iCumRate += 	60	; } //	링 메일 헬름	(	0.6	%)
					case(	85	) { itemString = `id:17040`; iCumRate += 	60	; } //	이블 다잉 크라운	(	0.6	%)
					case(	86	) { itemString = `id:18502`; iCumRate += 	60	; } //	본 헬름	(	0.6	%)
					case(	87	) { itemString = `id:18511`; iCumRate += 	60	; } //	플루트 풀 헬름	(	0.6	%)
					case(	88	) { itemString = `id:15155`; iCumRate += 	70	; } //	이디카이 성직자 예복(남성용)	(	0.7	%)
					case(	89	) { itemString = `id:15156`; iCumRate += 	70	; } //	이디카이 성직자 예복(여성용)	(	0.7	%)
					case(	90	) { itemString = `id:15065`; iCumRate += 	70	; } //	엘라 베스트 스커트	(	0.7	%)
					case(	91	) { itemString = `id:15135`; iCumRate += 	70	; } //	시크 수트	(	0.7	%)
					case(	92	) { itemString = `id:15151`; iCumRate += 	70	; } //	뉴욕마리오 웨이스트 테일러 웨어(남성용)	(	0.7	%)
					case(	93	) { itemString = `id:15152`; iCumRate += 	70	; } //	뉴욕마리오 웨이스트 테일러 웨어(여성용)	(	0.7	%)
					case(	94	) { itemString = `id:15153`; iCumRate += 	70	; } //	산드라 스나이퍼 수트(남성용)	(	0.7	%)
					case(	95	) { itemString = `id:15154`; iCumRate += 	70	; } //	산드라 스나이퍼 수트(여성용)	(	0.7	%)
					case(	96	) { itemString = `id:15157`; iCumRate += 	70	; } //	위스 보위군 의복(남성용)	(	0.7	%)
					case(	97	) { itemString = `id:15158`; iCumRate += 	70	; } //	위스 보위군 의복(여성용)	(	0.7	%)
					case(	98	) { itemString = `id:19029`; iCumRate += 	70	; } //	자이언트 베어 로브	(	0.7	%)
					case(	99	) { itemString = `id:19007`; iCumRate += 	70	; } //	야광 머플러 로브	(	0.7	%)
					case(	100	) { itemString = `id:19017`; iCumRate += 	70	; } //	늑대 로브	(	0.7	%)
					case(	101	) { itemString = `id:19016`; iCumRate += 	70	; } //	곰 로브	(	0.7	%)
					case(	102	) { itemString = `id:15115`; iCumRate += 	70	; } //	재기드 미니 스커트	(	0.7	%)
					case(	103	) { itemString = `id:15059`; iCumRate += 	70	; } //	터크스 탱크탑 반바지	(	0.7	%)
					case(	104	) { itemString = `id:15070`; iCumRate += 	70	; } //	아이돌 리본 드레스	(	0.7	%)
					case(	105	) { itemString = `id:19009`; iCumRate += 	70	; } //	코코 래빗 로브	(	0.7	%)
					case(	106	) { itemString = `id:19008`; iCumRate += 	70	; } //	코코 판다 로브	(	0.7	%)
					case(	107	) { itemString = `id:15074`; iCumRate += 	70	; } //	루이스 성직자 코트	(	0.7	%)
					case(	108	) { itemString = `id:15061`; iCumRate += 	70	; } //	물결무늬 옆트임 튜닉	(	0.7	%)
					case(	109	) { itemString = `id:15137`; iCumRate += 	70	; } //	셀리나 하프 재킷 코트	(	0.7	%)
					case(	110	) { itemString = `id:15112`; iCumRate += 	70	; } //	셀리나 스쿨보이룩	(	0.7	%)
					case(	111	) { itemString = `id:18045`; iCumRate += 	80	; } //	별장식 마법사 모자	(	0.8	%)
					case(	112	) { itemString = `id:18041`; iCumRate += 	80	; } //	큰 챙 깃털 모자	(	0.8	%)
					case(	113	) { itemString = `id:18034`; iCumRate += 	80	; } //	볼륨 베레모	(	0.8	%)
					case(	114	) { itemString = `id:18005`; iCumRate += 	80	; } //	몬거 마법사모자	(	0.8	%)
					case(	115	) { itemString = `id:18006`; iCumRate += 	80	; } //	마법사모자	(	0.8	%)
					case(	116	) { itemString = `id:18019`; iCumRate += 	80	; } //	리리나 깃털모자	(	0.8	%)
					case(	117	) { itemString = `id:18020`; iCumRate += 	80	; } //	몬거 깃털모자	(	0.8	%)
					case(	118	) { itemString = `id:18113`; iCumRate += 	80	; } //	뾰족귀 고양이 모자	(	0.8	%)
					case(	119	) { itemString = `id:18114`; iCumRate += 	80	; } //	줄무늬 고양이 모자	(	0.8	%)
					case(	120	) { itemString = `id:18115`; iCumRate += 	80	; } //	핀 고양이 모자	(	0.8	%)
					case(	121	) { itemString = `id:18097`; iCumRate += 	80	; } //	세이렌 깃털 가면	(	0.8	%)
					case(	122	) { itemString = `id:18098`; iCumRate += 	80	; } //	세이렌의 안경	(	0.8	%)
					case(	123	) { itemString = `id:18099`; iCumRate += 	80	; } //	세이렌 작은 날개 가면	(	0.8	%)
					case(	124	) { itemString = `id:18100`; iCumRate += 	80	; } //	세이렌 날개 가면	(	0.8	%)
					case(	125	) { itemString = `id:18101`; iCumRate += 	80	; } //	세이렌 박쥐 날개 가면	(	0.8	%)
					case(	126	) { itemString = `id:18102`; iCumRate += 	80	; } //	세이렌의 가면	(	0.8	%)
					case(	127	) { itemString = `id:15055`; iCumRate += 	80	; } //	세이렌 고양이 가면	(	0.8	%)
					case(	128	) { itemString = `id:18044`; iCumRate += 	80	; } //	범죄용 복면	(	0.8	%)
					case(	129	) { itemString = `id:18112`; iCumRate += 	80	; } //	해 분장 소품	(	0.8	%)
					case(	130	) { itemString = `id:18111`; iCumRate += 	80	; } //	나무 분장 소품	(	0.8	%)
					case(	131	) { itemString = `id:18110`; iCumRate += 	80	; } //	덤불 분장 소품	(	0.8	%)
					case(	132	) { itemString = `id:18109`; iCumRate += 	80	; } //	나오 분장 소품	(	0.8	%)
					case(	133	) { itemString = `id:18108`; iCumRate += 	80	; } //	바위 분장 소품	(	0.8	%)
					case(	134	) { itemString = `id:18029`; iCumRate += 	80	; } //	나무테 안경	(	0.8	%)
					case(	135	) { itemString = `id:18028`; iCumRate += 	80	; } //	접이식 안경	(	0.8	%)
					case(	136	) { itemString = `id:62005 prefix:20203`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	137	) { itemString = `id:62005 prefix:21003`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	138	) { itemString = `id:62005 suffix:30201`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	139	) { itemString = `id:62005 suffix:30302`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	140	) { itemString = `id:62005 prefix:20201`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	141	) { itemString = `id:62005 suffix:30304`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	142	) { itemString = `id:62005 suffix:30702`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	143	) { itemString = `id:62005 suffix:30704`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	144	) { itemString = `id:62005 suffix:30801`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	145	) { itemString = `id:62005 suffix:30802`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	146	) { itemString = `id:62005 suffix:30803`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	147	) { itemString = `id:62005 suffix:30804`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	148	) { itemString = `id:62005 prefix:20405`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	149	) { itemString = `id:62005 prefix:20501`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	150	) { itemString = `id:62005 prefix:20602`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	151	) { itemString = `id:62005 prefix:20701`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	152	) { itemString = `id:62005 suffix:30506`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	153	) { itemString = `id:62005 suffix:30614`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	154	) { itemString = `id:62005 prefix:20108`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	155	) { itemString = `id:62005 prefix:20304`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	156	) { itemString = `id:62005 prefix:20505`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	157	) { itemString = `id:62005 prefix:20209`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	158	) { itemString = `id:62005 prefix:20409`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	159	) { itemString = `id:62005 prefix:20615`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	160	) { itemString = `id:62005 prefix:20508`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	161	) { itemString = `id:62005 prefix:20618`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	162	) { itemString = `id:62005 prefix:20718`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	163	) { itemString = `id:62005 prefix:20212`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	164	) { itemString = `id:62005 prefix:20412`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	165	) { itemString = `id:62005 prefix:20619`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	166	) { itemString = `id:62005 suffix:30616`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	167	) { itemString = `id:62005 suffix:30617`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	168	) { itemString = `id:62005 suffix:30618`; iCumRate += 	60	; } //	인챈트 스크롤	(	0.6	%)
					case(	169	) { itemString = `id:91034`; iCumRate += 	165	; } //	??增加?水	(	1.65	%)
					case(	170	) { itemString = `id:40079`; iCumRate += 	50	; } //	메이스	(	0.5	%)
					case(	171	) { itemString = `id:40011`; iCumRate += 	50	; } //	브로드 소드	(	0.5	%)
					case(	172	) { itemString = `id:40030`; iCumRate += 	50	; } //	투 핸디드 소드	(	0.5	%)
					case(	173	) { itemString = `id:40012`; iCumRate += 	50	; } //	바스타드 소드	(	0.5	%)
					case(	174	) { itemString = `id:40007`; iCumRate += 	50	; } //	한손도끼	(	0.5	%)
					case(	175	) { itemString = `id:40014`; iCumRate += 	50	; } //	콤포짓 보우	(	0.5	%)
					case(	176	) { itemString = `id:40078`; iCumRate += 	50	; } //	비펜니스	(	0.5	%)
					case(	177	) { itemString = `id:40080`; iCumRate += 	50	; } //	글라디우스	(	0.5	%)
					case(	178	) { itemString = `id:40006`; iCumRate += 	50	; } //	단검	(	0.5	%)
					case(	179	) { itemString = `id:40031`; iCumRate += 	50	; } //	석궁	(	0.5	%)
					case(	180	) { itemString = `id:40081`; iCumRate += 	50	; } //	레더 롱 보우	(	0.5	%)
					case(	181	) { itemString = `id:51003 count:10`; iCumRate += 	40	; } //	생명력 50 포션	(	0.4	%)
					case(	182	) { itemString = `id:51004 count:10`; iCumRate += 	40	; } //	생명력 100 포션	(	0.4	%)
					case(	183	) { itemString = `id:51007 count:10`; iCumRate += 	40	; } //	마나 30 포션	(	0.4	%)
					case(	184	) { itemString = `id:51008 count:10`; iCumRate += 	40	; } //	마나 50 포션	(	0.4	%)
					case(	185	) { itemString = `id:51013 count:10`; iCumRate += 	40	; } //	스태미나 50 포션	(	0.4	%)
					case(	186	) { itemString = `id:51014 count:10`; iCumRate += 	40	; } //	스태미나 100 포션	(	0.4	%)
					case(	187	) { itemString = `id:51001 count:10`; iCumRate += 	40	; } //	생명력 10 포션	(	0.4	%)
					case(	188	) { itemString = `id:51002 count:10`; iCumRate += 	40	; } //	생명력 30 포션	(	0.4	%)
					case(	189	) { itemString = `id:51022 count:10`; iCumRate += 	40	; } //	생명력과 마나 30 포션	(	0.4	%)
					case(	190	) { itemString = `id:51027 count:10`; iCumRate += 	40	; } //	생명력과 스태미나 30 포션	(	0.4	%)
					case(	191	) { itemString = `id:51028 count:10`; iCumRate += 	40	; } //	생명력과 스태미나 50 포션	(	0.4	%)
					case(	192	) { itemString = `id:51029 count:10`; iCumRate += 	40	; } //	생명력과 스태미나 100 포션	(	0.4	%)
					case(	193	) { itemString = `id:63000 count:10`; iCumRate += 	40	; } //	피닉스의 깃털	(	0.4	%)
					case(	194	) { itemString = `id:60037 count:5`; iCumRate += 	40	; } //	블랙 유스 포션	(	0.4	%)
					case(	195	) { itemString = `id:60038 count:5`; iCumRate += 	40	; } //	레드 포션	(	0.4	%)
					case(	196	) { itemString = `id:50012 count:5`; iCumRate += 	40	; } //	황금 달걀	(	0.4	%)
					case(	197	) { itemString = `id:50013 count:5`; iCumRate += 	40	; } //	황금 사과	(	0.4	%)
					case(	198	) { itemString = `id:50163 quality:100`; iCumRate += 	40	; } //	피쉬 앤 칩스	(	0.4	%)
					case(	199	) { itemString = `id:50164 quality:100`; iCumRate += 	40	; } //	T본 스테이크	(	0.4	%)
					case(	200	) { itemString = `id:50165 quality:100`; iCumRate += 	40	; } //	치즈 그라탕	(	0.4	%)
					case(	201	) { itemString = `id:50166 quality:100`; iCumRate += 	40	; } //	카레 라이스	(	0.4	%)
					case(	202	) { itemString = `id:50167 quality:100`; iCumRate += 	40	; } //	코 코 뱅	(	0.4	%)
					case(	203	) { itemString = `id:50168 quality:100`; iCumRate += 	40	; } //	송어찜	(	0.4	%)
					case(	204	) { itemString = `id:50169 quality:100`; iCumRate += 	40	; } //	부야 베스	(	0.4	%)
					case(	205	) { itemString = `id:50170 quality:100`; iCumRate += 	40	; } //	치즈 퐁듀	(	0.4	%)
					case(	206	) { itemString = `id:50171 quality:100`; iCumRate += 	40	; } //	이멘 마하산 와인	(	0.4	%)
					case(	207	) { itemString = `id:50172 quality:100`; iCumRate += 	40	; } //	레어치즈 케익	(	0.4	%)
					case(	208	) { itemString = `id:50173 quality:100`; iCumRate += 	40	; } //	가토 오 쇼콜라	(	0.4	%)
					case(	209	) { itemString = `id:50174 quality:100`; iCumRate += 	40	; } //	크로크 무슈	(	0.4	%)
					case(	210	) { itemString = `id:50175 quality:100`; iCumRate += 	40	; } //	브라우니	(	0.4	%)
					case(	211	) { itemString = `id:50176 quality:100`; iCumRate += 	40	; } //	버터 비스킷	(	0.4	%)
					case(	212	) { itemString = `id:15222`; iCumRate += 	2	; } //	그레이스 숄 드레스(여성용)	(	0.02	%)
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
					GiveTreasureChestItem(player,itemString,itemID);

					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
	}

	// 중국 보물상자 이벤트용 ~ 보통 보물상자(리뉴얼)
	if (itemID == 91045)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			int iRandom		= Random(4370);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;

				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:91165 `; iCumRate += 1;} //0.0228832952 91165 물결무늬 도넛
					case(1){itemString = `id:91166 `; iCumRate += 1;} //0.0228832952 91166 무지개 도넛
					case(2){itemString = `id:40354 `; iCumRate += 1;} //0.0228832952 경단 소드
					case(3){itemString = `id:40095 `; iCumRate += 1;} //0.0228832952 드래곤 블레이드
					case(4){itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0228832952 레미니아 성월의 갑옷(남성용)
					case(5){itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0228832952 레미니아 성월의 갑옷(여성용)
					case(6){itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0228832952 아리쉬 아슈빈 아머(남성용)
					case(7){itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0228832952 아리쉬 아슈빈 아머(여성용)
					case(8){itemString = `id:15153 `; iCumRate += 2;} //0.0457665904 @산드라 스나이퍼 수트(남성용)
					case(9){itemString = `id:15154 `; iCumRate += 2;} //0.0457665904 @산드라 스나이퍼 수트(여성용)
					case(10){itemString = `id:16026 `; iCumRate += 2;} //0.0457665904 @산드라 스나이퍼 수트 글러브
					case(11){itemString = `id:17060 `; iCumRate += 2;} //0.0457665904 @산드라 스나이퍼 수트 부츠(남성용)
					case(12){itemString = `id:17061 `; iCumRate += 2;} //0.0457665904 @산드라 스나이퍼 수트 부츠(여성용)
					case(13){itemString = `id:13010 `; iCumRate += 4;} //0.0915331808 @라운드 폴드론 체인메일
					case(14){itemString = `id:13023 `; iCumRate += 4;} //0.0915331808 @로즈 플레이트 아머 (B타입)
					case(15){itemString = `id:16504 `; iCumRate += 4;} //0.0915331808 @카운터 건틀렛
					case(16){itemString = `id:17500 `; iCumRate += 4;} //0.0915331808 @하이폴린 플레이트 부츠
					case(17){itemString = `id:18508 `; iCumRate += 4;} //0.0915331808 @슬릿 풀 헬름
					case(18){itemString = `id:40090 `; iCumRate += 8;} //0.1830663616 힐링 원드
					case(19){itemString = `id:40038 `; iCumRate += 8;} //0.1830663616 라이트닝 원드
					case(20){itemString = `id:40040 `; iCumRate += 8;} //0.1830663616 파이어 원드
					case(21){itemString = `id:40041 `; iCumRate += 8;} //0.1830663616 타격용 원드
					case(22){itemString = `id:40006 `; iCumRate += 16;} //0.3661327231 단검
					case(23){itemString = `id:40005 `; iCumRate += 16;} //0.3661327231 숏
					case(24){itemString = `id:40010 `; iCumRate += 16;} //0.3661327231 롱 소드
					case(25){itemString = `id:40007 `; iCumRate += 16;} //0.3661327231 한손 도끼
					case(26){itemString = `id:40016 `; iCumRate += 16;} //0.3661327231 해머
					case(27){itemString = `id:40015 `; iCumRate += 16;} //0.3661327231 플루트 숏소드
					case(28){itemString = `id:40030 `; iCumRate += 16;} //0.3661327231 투 핸디드 소드
					case(29){itemString = `id:40011 `; iCumRate += 16;} //0.3661327231 브로드 소드
					case(30){itemString = `id:40033 `; iCumRate += 16;} //0.3661327231 클레이모어
					case(31){itemString = `id:40012 `; iCumRate += 16;} //0.3661327231 바스타드 소드
					case(32){itemString = `id:40019 `; iCumRate += 16;} //0.3661327231 굵은 나뭇가지
					case(33){itemString = `id:40020 `; iCumRate += 16;} //0.3661327231 나무 몽둥이
					case(34){itemString = `id:40031 `; iCumRate += 16;} //0.3661327231 석궁
					case(35){itemString = `id:40013 `; iCumRate += 16;} //0.3661327231 롱 보우
					case(36){itemString = `id:40014 `; iCumRate += 16;} //0.3661327231 콤포짓 보우
					case(37){itemString = `id:40003 `; iCumRate += 16;} //0.3661327231 숏 보우
					case(38){itemString = `id:46001 `; iCumRate += 16;} //0.3661327231 라운드 실드
					case(39){itemString = `id:62005 prefix:6`; iCumRate += 16;} //0.3661327231 스네이크헌터
					case(40){itemString = `id:62005 prefix:7`; iCumRate += 16;} //0.3661327231 폭스헌터
					case(41){itemString = `id:62005 prefix:107`; iCumRate += 16;} //0.3661327231 폭스테이머
					case(42){itemString = `id:62005 prefix:207`; iCumRate += 16;} //0.3661327231 폭스
					case(43){itemString = `id:62005 suffix:10604`; iCumRate += 16;} //0.3661327231 농부의
					case(44){itemString = `id:62005 suffix:11104`; iCumRate += 16;} //0.3661327231 위크니스
					case(45){itemString = `manual:106 `; iCumRate += 28;} //0.6407322654 옷본 - 포포스커트(여)
					case(46){itemString = `manual:112 `; iCumRate += 28;} //0.6407322654 옷본 - 마법사모자
					case(47){itemString = `manual:114 `; iCumRate += 28;} //0.6407322654 옷본 - 머리띠
					case(48){itemString = `manual:107 `; iCumRate += 28;} //0.6407322654 옷본 - 몬거 여행자옷(여)
					case(49){itemString = `manual:108 `; iCumRate += 28;} //0.6407322654 옷본 - 몬거 여행자옷(남)
					case(50){itemString = `manual:102 `; iCumRate += 28;} //0.6407322654 옷본 - 마법학교 교복(남)
					case(51){itemString = `manual:115 `; iCumRate += 28;} //0.6407322654 옷본 - 몬거 롱스커트(여)
					case(52){itemString = `manual:118 `; iCumRate += 28;} //0.6407322654 옷본 - 코레스 닌자슈트(남)
					case(53){itemString = `manual:111 `; iCumRate += 28;} //0.6407322654 옷본 - 가디언 장갑
					case(54){itemString = `manual:117 `; iCumRate += 28;} //0.6407322654 옷본 - 리리나 롱스커트(여)
					case(55){itemString = `manual:105 `; iCumRate += 28;} //0.6407322654 옷본 - 몬거 모자
					case(56){itemString = `manual:109 `; iCumRate += 28;} //0.6407322654 옷본 - 클로스 메일
					case(57){itemString = `manual:116 `; iCumRate += 28;} //0.6407322654 옷본 - 라이트 레더메일(여)
					case(58){itemString = `manual:120 `; iCumRate += 28;} //0.6407322654 옷본 - 라이트 레더메일(남)
					case(59){itemString = `manual:126 `; iCumRate += 28;} //0.6407322654 옷본 - 루이스 베스트 웨어(남)
					case(60){itemString = `manual:122 `; iCumRate += 28;} //0.6407322654 옷본 - 전문가용 실크방직 장갑
					case(61){itemString = `manual:119 `; iCumRate += 28;} //0.6407322654 옷본 - 코레스 씨프슈트(남)
					case(62){itemString = `manual:123 `; iCumRate += 28;} //0.6407322654 옷본 - 레더 미니 원피스 링타입(여)
					case(63){itemString = `manual:20106 `; iCumRate += 28;} //0.6407322654 도면 - 낫
					case(64){itemString = `manual:20104 `; iCumRate += 28;} //0.6407322654 도면 - 곡괭이
					case(65){itemString = `manual:20131 `; iCumRate += 28;} //0.6407322654 도면 - 숏 소드
					case(66){itemString = `manual:20102 `; iCumRate += 28;} //0.6407322654 도면 - 단검
					case(67){itemString = `manual:20108 `; iCumRate += 28;} //0.6407322654 도면 - 스파이크 캡
					case(68){itemString = `manual:20103 `; iCumRate += 28;} //0.6407322654 도면 - 라운드 실드
					case(69){itemString = `manual:20105 `; iCumRate += 28;} //0.6407322654 도면 - 롱 소드
					case(70){itemString = `manual:20117 `; iCumRate += 28;} //0.6407322654 도면 - 그리브 부츠
					case(71){itemString = `manual:20134 `; iCumRate += 28;} //0.6407322654 도면 - 해머
					case(72){itemString = `manual:20135 `; iCumRate += 28;} //0.6407322654 도면 - 브로드 소드
					case(73){itemString = `manual:20137 `; iCumRate += 28;} //0.6407322654 도면 - 바스타드 소드
					case(74){itemString = `id:60009 count:5`; iCumRate += 40;} //0.9153318078 양털
					case(75){itemString = `id:60008 count:5`; iCumRate += 40;} //0.9153318078 거미줄
					case(76){itemString = `id:60004 count:5`; iCumRate += 40;} //0.9153318078 매듭끈
					case(77){itemString = `id:60028 count:10`; iCumRate += 40;} //0.9153318078 일반 가죽끈
					case(78){itemString = `id:60013 count:10`; iCumRate += 40;} //0.9153318078 고급 실크
					case(79){itemString = `id:60021 count:10`; iCumRate += 40;} //0.9153318078 고급 옷감
					case(80){itemString = `id:60017 count:10`; iCumRate += 40;} //0.9153318078 고급 마감용 실
					case(81){itemString = `id:60025 count:10`; iCumRate += 40;} //0.9153318078 고급 가죽
					case(82){itemString = `id:60012 count:10`; iCumRate += 40;} //0.9153318078 일반 실크
					case(83){itemString = `id:60016 count:10`; iCumRate += 40;} //0.9153318078 일반 마감용 실
					case(84){itemString = `id:60020 count:10`; iCumRate += 40;} //0.9153318078 일반 옷감
					case(85){itemString = `id:60024 count:10`; iCumRate += 40;} //0.9153318078 일반 가죽
					case(86){itemString = `id:64002 count:10`; iCumRate += 40;} //0.9153318078 철광석
					case(87){itemString = `id:64004 count:10`; iCumRate += 40;} //0.9153318078 동광석
					case(88){itemString = `id:64006 count:10`; iCumRate += 40;} //0.9153318078 은광석
					case(89){itemString = `id:64001 count:10`; iCumRate += 40;} //0.9153318078 철괴
					case(90){itemString = `id:64003 count:10`; iCumRate += 40;} //0.9153318078 동괴
					case(91){itemString = `id:64005 count:10`; iCumRate += 40;} //0.9153318078 은괴
					case(92){itemString = `id:51102 count:10`; iCumRate += 40;} //0.9153318078 마나 허브
					case(93){itemString = `id:51101 count:10`; iCumRate += 40;} //0.9153318078 블러디 허브
					case(94){itemString = `id:51103 count:10`; iCumRate += 40;} //0.9153318078 선라이트 허브
					case(95){itemString = `id:62003 count:5`; iCumRate += 40;} //0.9153318078 축복받은 마법가루
					case(96){itemString = `id:63029 count:5`; iCumRate += 40;} //0.9153318078 캠프파이어 키트
					case(97){itemString = `id:50006 count:5`; iCumRate += 40;} //0.9153318078 고기 조각
					case(98){itemString = `id:40025 `; iCumRate += 40;} //0.9153318078 곡괭이
					case(99){itemString = `id:2001 `; iCumRate += 40;} //0.9153318078 금화주머니
					case(100){itemString = `id:40026 `; iCumRate += 40;} //0.9153318078 낫
					case(101){itemString = `id:40024 `; iCumRate += 40;} //0.9153318078 대장장이 망치
					case(102){itemString = `id:50203 `; iCumRate += 40;} //0.9153318078 레드 선라이즈
					case(103){itemString = `id:62004 count:5`; iCumRate += 40;} //0.9153318078 마법가루
					case(104){itemString = `id:63027 expire:10080`; iCumRate += 40;} //0.9153318078 밀랍 날개
					case(105){itemString = `id:45002 count:100`; iCumRate += 40;} //0.9153318078 볼트
					case(106){itemString = `id:60005 count:10`; iCumRate += 40;} //0.9153318078 붕대
					case(107){itemString = `id:50124 quality:80`; iCumRate += 40;} //0.9153318078 비프 스테이크 80퀄리티
					case(108){itemString = `id:63020 `; iCumRate += 40;} //0.9153318078 빈 병
					case(109){itemString = `id:51001 count:10`; iCumRate += 40;} //0.9153318078 생명력 10 포션
					case(110){itemString = `id:51022 count:5`; iCumRate += 40;} //0.9153318078 생명력과 마나 30 포션
					case(111){itemString = `id:51027 count:5`; iCumRate += 40;} //0.9153318078 생명력과 스태미나 30 포션
					case(112){itemString = `id:51028 count:3`; iCumRate += 40;} //0.9153318078 생명력과 스태미나 50 포션
					case(113){itemString = `id:51011 count:10`; iCumRate += 40;} //0.9153318078 스태미나 10 포션
					case(114){itemString = `id:40042 `; iCumRate += 40;} //0.9153318078 식칼
					case(115){itemString = `id:63019 count:50`; iCumRate += 40;} //0.9153318078 알비 배틀 아레나 코인
					case(116){itemString = `id:63043 count:3`; iCumRate += 40;} //0.9153318078 어드밴스드 깃털
					case(117){itemString = `id:63001 `; iCumRate += 40;} //0.9153318078 여신의 날개
					case(118){itemString = `id:40002 `; iCumRate += 40;} //0.9153318078 연습용 목도
					case(119){itemString = `id:51031 count:3`; iCumRate += 40;} //0.9153318078 완전 회복의 포션
					case(120){itemString = `id:50014 `; iCumRate += 40;} //0.9153318078 왕감자
					case(121){itemString = `id:63026 `; iCumRate += 40;} //0.9153318078 원격 은행 이용권
					case(122){itemString = `id:63057 `; iCumRate += 40;} //0.9153318078 원격 의류 수리 이용권
					case(123){itemString = `id:63047 `; iCumRate += 40;} //0.9153318078 원격 힐러집 이용권
					case(124){itemString = `id:40023 `; iCumRate += 40;} //0.9153318078 채집용 단검
					case(125){itemString = `id:40022 `; iCumRate += 40;} //0.9153318078 채집용 도끼
					case(126){itemString = `id:63016 count:3`; iCumRate += 40;} //0.9153318078 축복의 포션
					case(127){itemString = `id:63039 expire:10080`; iCumRate += 40;} //0.9153318078 캠프 키트
					case(128){itemString = `id:63029 count:5`; iCumRate += 40;} //0.9153318078 캠프파이어키트
					case(129){itemString = `id:50005 `; iCumRate += 40;} //0.9153318078 커다란 고기덩어리
					case(130){itemString = `id:2006 `; iCumRate += 40;} //0.9153318078 큰
					case(131){itemString = `id:50202 `; iCumRate += 40;} //0.9153318078 키스 온 더 립스
					case(132){itemString = `id:63044 count:3`; iCumRate += 40;} //0.9153318078 파티 부활의 깃털
					case(133){itemString = `id:63000 count:3`; iCumRate += 40;} //0.9153318078 피닉스의 깃털
					case(134){itemString = `id:40027 `; iCumRate += 40;} //0.9153318078 호미
					case(135){itemString = `id:45001 count:100`; iCumRate += 40;} //0.9153318078 화살
					case(136){itemString = `id:63058 `; iCumRate += 40;} //0.9153318078 회복 속도 증가 포션
					case(137){itemString = `id:40004 `; iCumRate += 40;} //0.9153318078 류트
					case(138){itemString = `id:40018 `; iCumRate += 40;} //0.9153318078 우쿨렐레
					case(139){itemString = `id:40017 `; iCumRate += 40;} //0.9153318078 만돌린
					case(140){itemString = `id:50201 quality:100`; iCumRate += 32;} //0.7322654462 BnR
					case(141){itemString = `id:50164 quality:100`; iCumRate += 32;} //0.7322654462 T본 스테이크
					case(142){itemString = `id:50177 `; iCumRate += 32;} //0.7322654462 초코칩 쿠키
					case(143){itemString = `id:50178 `; iCumRate += 32;} //0.7322654462 오렌지 주스
					case(144){itemString = `id:50179 `; iCumRate += 32;} //0.7322654462 레몬 주스
					case(145){itemString = `id:50180 `; iCumRate += 32;} //0.7322654462 초콜릿 우유
					case(146){itemString = `id:50181 `; iCumRate += 32;} //0.7322654462 라인산 진
					case(147){itemString = `id:50182 `; iCumRate += 32;} //0.7322654462 브리흐네 위스키
					case(148){itemString = `id:50199 `; iCumRate += 32;} //0.7322654462 스크류 드라이버
					case(149){itemString = `id:50200 `; iCumRate += 32;} //0.7322654462 라인 슬링
					case(150){itemString = `id:50202 `; iCumRate += 32;} //0.7322654462 키스 온 더 립스
					case(151){itemString = `id:50203 `; iCumRate += 32;} //0.7322654462 레드 선라이즈
					case(152){itemString = `id:50183 `; iCumRate += 32;} //0.7322654462 데브니쉬 흑맥주
					case(153){itemString = `id:50123 `; iCumRate += 32;} //0.7322654462 베이컨구이
					case(154){itemString = `id:50124 `; iCumRate += 32;} //0.7322654462 비프 스테이크
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int randomSetId = 1027;   // 고유 ID.. RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);

			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);
			player.ShowCaption(["event.useitem_event.38"]);
			int itemID2 = newItem.GetClassId();
			string charName = player.GetDisplayName();
			string ItemName;
			if (itemID2 == 40292 || itemID2 == 40958 || itemID2 == 40313 || itemID2 == 18261)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
			{
				ItemName = newItem.GetFullLocalName();
				AnnounceAllChannel(2, charName + ["event.useitem_event.44"]+ ItemName + ["event.useitem_event.45"]);
			}

			if (bUsePremiumKey)
			{
				GiveItemByPremiumKey(player, itemID);
			}
			if (bMonster)
			{
				// 몬스터 소환
				GenerateMonster(player);
			}
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			int iRandom		= Random(4366);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0229042602 레미니아 성월의 갑옷(남성용)
					case(1){itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0229042602 레미니아 성월의 갑옷(여성용)
					case(2){itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0229042602 아리쉬 아슈빈 아머(남성용)
					case(3){itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} //0.0229042602 아리쉬 아슈빈 아머(여성용)
					case(4){itemString = `id:15153 `; iCumRate += 2;} //0.0458085204 @산드라 스나이퍼 수트(남성용)
					case(5){itemString = `id:15154 `; iCumRate += 2;} //0.0458085204 @산드라 스나이퍼 수트(여성용)
					case(6){itemString = `id:16026 `; iCumRate += 2;} //0.0458085204 @산드라 스나이퍼 수트 글러브
					case(7){itemString = `id:17060 `; iCumRate += 2;} //0.0458085204 @산드라 스나이퍼 수트 부츠(남성용)
					case(8){itemString = `id:17061 `; iCumRate += 2;} //0.0458085204 @산드라 스나이퍼 수트 부츠(여성용)
					case(9){itemString = `id:13010 `; iCumRate += 4;} //0.0916170408 @라운드 폴드론 체인메일
					case(10){itemString = `id:13023 `; iCumRate += 4;} //0.0916170408 @로즈 플레이트 아머 (B타입)
					case(11){itemString = `id:16504 `; iCumRate += 4;} //0.0916170408 @카운터 건틀렛
					case(12){itemString = `id:17500 `; iCumRate += 4;} //0.0916170408 @하이폴린 플레이트 부츠
					case(13){itemString = `id:18508 `; iCumRate += 4;} //0.0916170408 @슬릿 풀 헬름
					case(14){itemString = `id:40090 `; iCumRate += 8;} //0.1832340815 힐링 원드
					case(15){itemString = `id:40038 `; iCumRate += 8;} //0.1832340815 라이트닝 원드
					case(16){itemString = `id:40040 `; iCumRate += 8;} //0.1832340815 파이어 원드
					case(17){itemString = `id:40041 `; iCumRate += 8;} //0.1832340815 타격용 원드
					case(18){itemString = `id:40006 `; iCumRate += 16;} //0.3664681631 단검
					case(19){itemString = `id:40005 `; iCumRate += 16;} //0.3664681631 숏
					case(20){itemString = `id:40010 `; iCumRate += 16;} //0.3664681631 롱 소드
					case(21){itemString = `id:40007 `; iCumRate += 16;} //0.3664681631 한손 도끼
					case(22){itemString = `id:40016 `; iCumRate += 16;} //0.3664681631 해머
					case(23){itemString = `id:40015 `; iCumRate += 16;} //0.3664681631 플루트 숏소드
					case(24){itemString = `id:40030 `; iCumRate += 16;} //0.3664681631 투 핸디드 소드
					case(25){itemString = `id:40011 `; iCumRate += 16;} //0.3664681631 브로드 소드
					case(26){itemString = `id:40033 `; iCumRate += 16;} //0.3664681631 클레이모어
					case(27){itemString = `id:40012 `; iCumRate += 16;} //0.3664681631 바스타드 소드
					case(28){itemString = `id:40019 `; iCumRate += 16;} //0.3664681631 굵은 나뭇가지
					case(29){itemString = `id:40020 `; iCumRate += 16;} //0.3664681631 나무 몽둥이
					case(30){itemString = `id:40031 `; iCumRate += 16;} //0.3664681631 석궁
					case(31){itemString = `id:40013 `; iCumRate += 16;} //0.3664681631 롱 보우
					case(32){itemString = `id:40014 `; iCumRate += 16;} //0.3664681631 콤포짓 보우
					case(33){itemString = `id:40003 `; iCumRate += 16;} //0.3664681631 숏 보우
					case(34){itemString = `id:46001 `; iCumRate += 16;} //0.3664681631 라운드 실드
					case(35){itemString = `id:62005 prefix:6`; iCumRate += 16;} //0.3664681631 스네이크헌터
					case(36){itemString = `id:62005 prefix:7`; iCumRate += 16;} //0.3664681631 폭스헌터
					case(37){itemString = `id:62005 prefix:107`; iCumRate += 16;} //0.3664681631 폭스테이머
					case(38){itemString = `id:62005 prefix:207`; iCumRate += 16;} //0.3664681631 폭스
					case(39){itemString = `id:62005 suffix:10604`; iCumRate += 16;} //0.3664681631 농부의
					case(40){itemString = `id:62005 suffix:11104`; iCumRate += 16;} //0.3664681631 위크니스
					case(41){itemString = `manual:106 `; iCumRate += 28;} //0.6413192854 옷본 - 포포스커트(여)
					case(42){itemString = `manual:112 `; iCumRate += 28;} //0.6413192854 옷본 - 마법사모자
					case(43){itemString = `manual:114 `; iCumRate += 28;} //0.6413192854 옷본 - 머리띠
					case(44){itemString = `manual:107 `; iCumRate += 28;} //0.6413192854 옷본 - 몬거 여행자옷(여)
					case(45){itemString = `manual:108 `; iCumRate += 28;} //0.6413192854 옷본 - 몬거 여행자옷(남)
					case(46){itemString = `manual:102 `; iCumRate += 28;} //0.6413192854 옷본 - 마법학교 교복(남)
					case(47){itemString = `manual:115 `; iCumRate += 28;} //0.6413192854 옷본 - 몬거 롱스커트(여)
					case(48){itemString = `manual:118 `; iCumRate += 28;} //0.6413192854 옷본 - 코레스 닌자슈트(남)
					case(49){itemString = `manual:111 `; iCumRate += 28;} //0.6413192854 옷본 - 가디언 장갑
					case(50){itemString = `manual:117 `; iCumRate += 28;} //0.6413192854 옷본 - 리리나 롱스커트(여)
					case(51){itemString = `manual:105 `; iCumRate += 28;} //0.6413192854 옷본 - 몬거 모자
					case(52){itemString = `manual:109 `; iCumRate += 28;} //0.6413192854 옷본 - 클로스 메일
					case(53){itemString = `manual:116 `; iCumRate += 28;} //0.6413192854 옷본 - 라이트 레더메일(여)
					case(54){itemString = `manual:120 `; iCumRate += 28;} //0.6413192854 옷본 - 라이트 레더메일(남)
					case(55){itemString = `manual:126 `; iCumRate += 28;} //0.6413192854 옷본 - 루이스 베스트 웨어(남)
					case(56){itemString = `manual:122 `; iCumRate += 28;} //0.6413192854 옷본 - 전문가용 실크방직 장갑
					case(57){itemString = `manual:119 `; iCumRate += 28;} //0.6413192854 옷본 - 코레스 씨프슈트(남)
					case(58){itemString = `manual:123 `; iCumRate += 28;} //0.6413192854 옷본 - 레더 미니 원피스 링타입(여)
					case(59){itemString = `manual:20106 `; iCumRate += 28;} //0.6413192854 도면 - 낫
					case(60){itemString = `manual:20104 `; iCumRate += 28;} //0.6413192854 도면 - 곡괭이
					case(61){itemString = `manual:20131 `; iCumRate += 28;} //0.6413192854 도면 - 숏 소드
					case(62){itemString = `manual:20102 `; iCumRate += 28;} //0.6413192854 도면 - 단검
					case(63){itemString = `manual:20108 `; iCumRate += 28;} //0.6413192854 도면 - 스파이크 캡
					case(64){itemString = `manual:20103 `; iCumRate += 28;} //0.6413192854 도면 - 라운드 실드
					case(65){itemString = `manual:20105 `; iCumRate += 28;} //0.6413192854 도면 - 롱 소드
					case(66){itemString = `manual:20117 `; iCumRate += 28;} //0.6413192854 도면 - 그리브 부츠
					case(67){itemString = `manual:20134 `; iCumRate += 28;} //0.6413192854 도면 - 해머
					case(68){itemString = `manual:20135 `; iCumRate += 28;} //0.6413192854 도면 - 브로드 소드
					case(69){itemString = `manual:20137 `; iCumRate += 28;} //0.6413192854 도면 - 바스타드 소드
					case(70){itemString = `id:60009 count:5`; iCumRate += 40;} //0.9161704077 양털
					case(71){itemString = `id:60008 count:5`; iCumRate += 40;} //0.9161704077 거미줄
					case(72){itemString = `id:60004 count:5`; iCumRate += 40;} //0.9161704077 매듭끈
					case(73){itemString = `id:60028 count:10`; iCumRate += 40;} //0.9161704077 일반 가죽끈
					case(74){itemString = `id:60013 count:10`; iCumRate += 40;} //0.9161704077 고급 실크
					case(75){itemString = `id:60021 count:10`; iCumRate += 40;} //0.9161704077 고급 옷감
					case(76){itemString = `id:60017 count:10`; iCumRate += 40;} //0.9161704077 고급 마감용 실
					case(77){itemString = `id:60025 count:10`; iCumRate += 40;} //0.9161704077 고급 가죽
					case(78){itemString = `id:60012 count:10`; iCumRate += 40;} //0.9161704077 일반 실크
					case(79){itemString = `id:60016 count:10`; iCumRate += 40;} //0.9161704077 일반 마감용 실
					case(80){itemString = `id:60020 count:10`; iCumRate += 40;} //0.9161704077 일반 옷감
					case(81){itemString = `id:60024 count:10`; iCumRate += 40;} //0.9161704077 일반 가죽
					case(82){itemString = `id:64002 count:10`; iCumRate += 40;} //0.9161704077 철광석
					case(83){itemString = `id:64004 count:10`; iCumRate += 40;} //0.9161704077 동광석
					case(84){itemString = `id:64006 count:10`; iCumRate += 40;} //0.9161704077 은광석
					case(85){itemString = `id:64001 count:10`; iCumRate += 40;} //0.9161704077 철괴
					case(86){itemString = `id:64003 count:10`; iCumRate += 40;} //0.9161704077 동괴
					case(87){itemString = `id:64005 count:10`; iCumRate += 40;} //0.9161704077 은괴
					case(88){itemString = `id:51102 count:10`; iCumRate += 40;} //0.9161704077 마나 허브
					case(89){itemString = `id:51101 count:10`; iCumRate += 40;} //0.9161704077 블러디 허브
					case(90){itemString = `id:51103 count:10`; iCumRate += 40;} //0.9161704077 선라이트 허브
					case(91){itemString = `id:62003 count:5`; iCumRate += 40;} //0.9161704077 축복받은 마법가루
					case(92){itemString = `id:63029 count:5`; iCumRate += 40;} //0.9161704077 캠프파이어 키트
					case(93){itemString = `id:50006 count:5`; iCumRate += 40;} //0.9161704077 고기 조각
					case(94){itemString = `id:40025 `; iCumRate += 40;} //0.9161704077 곡괭이
					case(95){itemString = `id:2001 `; iCumRate += 40;} //0.9161704077 금화주머니
					case(96){itemString = `id:40026 `; iCumRate += 40;} //0.9161704077 낫
					case(97){itemString = `id:40024 `; iCumRate += 40;} //0.9161704077 대장장이 망치
					case(98){itemString = `id:50203 `; iCumRate += 40;} //0.9161704077 레드 선라이즈
					case(99){itemString = `id:62004 count:5`; iCumRate += 40;} //0.9161704077 마법가루
					case(100){itemString = `id:63027 expire:10080`; iCumRate += 40;} //0.9161704077 밀랍 날개
					case(101){itemString = `id:45002 count:100`; iCumRate += 40;} //0.9161704077 볼트
					case(102){itemString = `id:60005 count:10`; iCumRate += 40;} //0.9161704077 붕대
					case(103){itemString = `id:50124 quality:80`; iCumRate += 40;} //0.9161704077 비프 스테이크 80퀄리티
					case(104){itemString = `id:63020 `; iCumRate += 40;} //0.9161704077 빈 병
					case(105){itemString = `id:51001 count:10`; iCumRate += 40;} //0.9161704077 생명력 10 포션
					case(106){itemString = `id:51022 count:5`; iCumRate += 40;} //0.9161704077 생명력과 마나 30 포션
					case(107){itemString = `id:51027 count:5`; iCumRate += 40;} //0.9161704077 생명력과 스태미나 30 포션
					case(108){itemString = `id:51028 count:3`; iCumRate += 40;} //0.9161704077 생명력과 스태미나 50 포션
					case(109){itemString = `id:51011 count:10`; iCumRate += 40;} //0.9161704077 스태미나 10 포션
					case(110){itemString = `id:40042 `; iCumRate += 40;} //0.9161704077 식칼
					case(111){itemString = `id:63019 count:50`; iCumRate += 40;} //0.9161704077 알비 배틀 아레나 코인
					case(112){itemString = `id:63043 count:3`; iCumRate += 40;} //0.9161704077 어드밴스드 깃털
					case(113){itemString = `id:63001 `; iCumRate += 40;} //0.9161704077 여신의 날개
					case(114){itemString = `id:40002 `; iCumRate += 40;} //0.9161704077 연습용 목도
					case(115){itemString = `id:51031 count:3`; iCumRate += 40;} //0.9161704077 완전 회복의 포션
					case(116){itemString = `id:50014 `; iCumRate += 40;} //0.9161704077 왕감자
					case(117){itemString = `id:63026 `; iCumRate += 40;} //0.9161704077 원격 은행 이용권
					case(118){itemString = `id:63057 `; iCumRate += 40;} //0.9161704077 원격 의류 수리 이용권
					case(119){itemString = `id:63047 `; iCumRate += 40;} //0.9161704077 원격 힐러집 이용권
					case(120){itemString = `id:40023 `; iCumRate += 40;} //0.9161704077 채집용 단검
					case(121){itemString = `id:40022 `; iCumRate += 40;} //0.9161704077 채집용 도끼
					case(122){itemString = `id:63016 count:3`; iCumRate += 40;} //0.9161704077 축복의 포션
					case(123){itemString = `id:63039 expire:10080`; iCumRate += 40;} //0.9161704077 캠프 키트
					case(124){itemString = `id:63029 count:5`; iCumRate += 40;} //0.9161704077 캠프파이어키트
					case(125){itemString = `id:50005 `; iCumRate += 40;} //0.9161704077 커다란 고기덩어리
					case(126){itemString = `id:2006 `; iCumRate += 40;} //0.9161704077 큰
					case(127){itemString = `id:50202 `; iCumRate += 40;} //0.9161704077 키스 온 더 립스
					case(128){itemString = `id:63044 count:3`; iCumRate += 40;} //0.9161704077 파티 부활의 깃털
					case(129){itemString = `id:63000 count:3`; iCumRate += 40;} //0.9161704077 피닉스의 깃털
					case(130){itemString = `id:40027 `; iCumRate += 40;} //0.9161704077 호미
					case(131){itemString = `id:45001 count:100`; iCumRate += 40;} //0.9161704077 화살
					case(132){itemString = `id:63058 `; iCumRate += 40;} //0.9161704077 회복 속도 증가 포션
					case(133){itemString = `id:40004 `; iCumRate += 40;} //0.9161704077 류트
					case(134){itemString = `id:40018 `; iCumRate += 40;} //0.9161704077 우쿨렐레
					case(135){itemString = `id:40017 `; iCumRate += 40;} //0.9161704077 만돌린
					case(136){itemString = `id:50201 quality:100`; iCumRate += 32;} //0.7329363262 BnR
					case(137){itemString = `id:50164 quality:100`; iCumRate += 32;} //0.7329363262 T본 스테이크
					case(138){itemString = `id:50177 `; iCumRate += 32;} //0.7329363262 초코칩 쿠키
					case(139){itemString = `id:50178 `; iCumRate += 32;} //0.7329363262 오렌지 주스
					case(140){itemString = `id:50179 `; iCumRate += 32;} //0.7329363262 레몬 주스
					case(141){itemString = `id:50180 `; iCumRate += 32;} //0.7329363262 초콜릿 우유
					case(142){itemString = `id:50181 `; iCumRate += 32;} //0.7329363262 라인산 진
					case(143){itemString = `id:50182 `; iCumRate += 32;} //0.7329363262 브리흐네 위스키
					case(144){itemString = `id:50199 `; iCumRate += 32;} //0.7329363262 스크류 드라이버
					case(145){itemString = `id:50200 `; iCumRate += 32;} //0.7329363262 라인 슬링
					case(146){itemString = `id:50202 `; iCumRate += 32;} //0.7329363262 키스 온 더 립스
					case(147){itemString = `id:50203 `; iCumRate += 32;} //0.7329363262 레드 선라이즈
					case(148){itemString = `id:50183 `; iCumRate += 32;} //0.7329363262 데브니쉬 흑맥주
					case(149){itemString = `id:50123 `; iCumRate += 32;} //0.7329363262 베이컨구이
					case(150){itemString = `id:50124 `; iCumRate += 32;} //0.7329363262 비프 스테이크
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
					// 몬스터 소환
					GenerateMonster(player);
					}
					return;
				}
				++i;
			}
		}
		else
		{
			int iRandom		= Random(3442);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40095`; iCumRate +=1;} //0.029052876龙剑드래곤 블레이드랜덤
					case(1){itemString = `id:13043`; iCumRate +=1;} //0.029052876蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)랜덤
					case(2){itemString = `id:13044`; iCumRate +=1;} //0.029052876蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)랜덤
					case(3){itemString = `id:13045`; iCumRate +=1;} //0.029052876艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)랜덤
					case(4){itemString = `id:13046`; iCumRate +=1;} //0.029052876艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)랜덤
					case(5){itemString = `id:14019`; iCumRate +=1;} //0.029052876优美的金属铠甲그레이스 플레이트 아머랜덤
					case(6){itemString = `id:13031`; iCumRate +=1;} //0.029052876银光金属盔甲스파이카 실버 플레이트 아머랜덤
					case(7){itemString = `id:13022`; iCumRate +=1;} //0.029052876硬皮甲 (P类型)로즈 플레이트 아머 (P타입)랜덤
					case(8){itemString = `id:40039`; iCumRate +=10;} //0.290528762冰箭魔杖아이스 원드랜덤
					case(9){itemString = `id:40090`; iCumRate +=10;} //0.290528762治疗魔杖힐링 원드랜덤
					case(10){itemString = `id:40040`; iCumRate +=10;} //0.290528762火箭魔杖파이어 원드랜덤
					case(11){itemString = `id:40038`; iCumRate +=10;} //0.290528762雷箭魔杖라이트닝 원드랜덤
					case(12){itemString = `id:40083`; iCumRate +=10;} //0.290528762钩状弯刀훅 커틀러스랜덤
					case(13){itemString = `id:40100`; iCumRate +=10;} //0.290528762鱼骨剑본 마린 소드랜덤
					case(14){itemString = `id:40032`; iCumRate +=10;} //0.290528762翼魔剑가고일 소드랜덤
					case(15){itemString = `id:18544`; iCumRate +=10;} //0.290528762骑士金属头盔펠리칸 프로텍터랜덤
					case(16){itemString = `id:18547`; iCumRate +=10;} //0.290528762羽毛金属头盔파나쉬 헤드 프로텍터랜덤
					case(17){itemString = `id:17040`; iCumRate +=10;} //0.290528762骷髅金属头盔이블 다잉 크라운랜덤
					case(18){itemString = `id:18542`; iCumRate +=10;} //0.290528762巨链盔빅 체인 풀 헬름랜덤
					case(19){itemString = `id:18506`; iCumRate +=10;} //0.290528762翼盔윙 하프 헬름랜덤
					case(20){itemString = `id:18521`; iCumRate +=10;} //0.290528762卫兵金属头盔유러피안 컴프랜덤
					case(21){itemString = `id:18500`; iCumRate +=10;} //0.290528762护颈头盔링 메일 헬름랜덤
					case(22){itemString = `id:18511`; iCumRate +=10;} //0.290528762凹槽盔플루트 풀 헬름랜덤
					case(23){itemString = `id:18502`; iCumRate +=10;} //0.290528762骨头盔본 헬름랜덤
					case(24){itemString = `id:14042`; iCumRate +=10;} //0.290528762凯斯汀皮革铠甲컬스틴 레더 아머
					case(25){itemString = `id:15065`; iCumRate +=14;} //0.406740267爱拉背心短裙엘라 베스트 스커트랜덤
					case(26){itemString = `id:19007`; iCumRate +=14;} //0.406740267夜光长袍야광 머플러 로브랜덤
					case(27){itemString = `id:19017`; iCumRate +=14;} //0.406740267狼长袍늑대 로브랜덤
					case(28){itemString = `id:19016`; iCumRate +=14;} //0.406740267熊长袍곰 로브랜덤
					case(29){itemString = `id:19008`; iCumRate +=14;} //0.406740267可可熊猫长袍코코 판다 로브랜덤
					case(30){itemString = `id:15137`; iCumRate +=14;} //0.406740267萨丽娜短夹克셀리나 하프 재킷 코트랜덤
					case(31){itemString = `id:15112`; iCumRate +=14;} //0.406740267萨丽娜校服셀리나 스쿨보이룩랜덤
					case(32){itemString = `id:18041`; iCumRate +=14;} //0.406740267羽毛法师帽큰 챙 깃털 모자랜덤
					case(33){itemString = `id:15135`; iCumRate +=14;} //0.406740267别致衣服시크 수트랜덤
					case(34){itemString = `id:15155`; iCumRate +=14;} //0.406740267Yidikai圣职者礼服(男性用)이디카이 성직자 예복(남성용)랜덤
					case(35){itemString = `id:15156`; iCumRate +=14;} //0.406740267Yidikai圣职者礼服(女性用)이디카이 성직자 예복(여성용)랜덤
					case(36){itemString = `id:15151`; iCumRate +=14;} //0.406740267纽约玛里奥收腰礼服(男性用)뉴욕마리오 웨이스트 테일러 웨어(남성용)랜덤
					case(37){itemString = `id:15152`; iCumRate +=14;} //0.406740267纽约玛里奥收腰礼服(女性用)뉴욕마리오 웨이스트 테일러 웨어(여성용)랜덤
					case(38){itemString = `id:15153`; iCumRate +=14;} //0.406740267桑德拉狙击手服(男性用)산드라 스나이퍼 수트(남성용)랜덤
					case(39){itemString = `id:15154`; iCumRate +=14;} //0.406740267桑德拉狙击手服(女性用)산드라 스나이퍼 수트(여성용)랜덤
					case(40){itemString = `id:15157`; iCumRate +=14;} //0.406740267威斯保卫军衣服(男性用)위스 보위군 의복(남성용)랜덤
					case(41){itemString = `id:15158`; iCumRate +=14;} //0.406740267威斯保卫军衣服(女性用)위스 보위군 의복(여성용)랜덤
					case(42){itemString = `id:15115`; iCumRate +=14;} //0.406740267不对称迷你裙子재기드 미니 스커트랜덤
					case(43){itemString = `id:15059`; iCumRate +=14;} //0.406740267吊带短裤터크스 탱크탑 반바지랜덤
					case(44){itemString = `id:15070`; iCumRate +=14;} //0.406740267科尔迷你裙아이돌 리본 드레스랜덤
					case(45){itemString = `id:19009`; iCumRate +=14;} //0.406740267可可兔子长袍코코 래빗 로브랜덤
					case(46){itemString = `id:19029`; iCumRate +=14;} //0.406740267자이언트 베어 로브랜덤
					case(47){itemString = `id:15074`; iCumRate +=14;} //0.406740267路易斯牧师服루이스 성직자 코트랜덤
					case(48){itemString = `id:15061`; iCumRate +=14;} //0.406740267路易斯束腰服물결무늬 옆트임 튜닉랜덤
					case(49){itemString = `id:18045`; iCumRate +=18;} //0.522951772星星法师帽별장식 마법사 모자랜덤
					case(50){itemString = `id:18034`; iCumRate +=18;} //0.522951772科尔蓓蕾帽볼륨 베레모랜덤
					case(51){itemString = `id:18005`; iCumRate +=18;} //0.522951772蒙戈魔法帽子몬거 마법사모자랜덤
					case(52){itemString = `id:18006`; iCumRate +=18;} //0.522951772魔法师帽子마법사모자랜덤
					case(53){itemString = `id:18019`; iCumRate +=18;} //0.522951772丽琳羽毛帽子리리나 깃털모자랜덤
					case(54){itemString = `id:18020`; iCumRate +=18;} //0.522951772蒙戈羽毛帽子몬거 깃털모자랜덤
					case(55){itemString = `id:18113`; iCumRate +=18;} //0.522951772尖耳小猫帽子뾰족귀 고양이 모자랜덤
					case(56){itemString = `id:18114`; iCumRate +=18;} //0.522951772猫脸小猫帽子줄무늬 고양이 모자랜덤
					case(57){itemString = `id:18115`; iCumRate +=18;} //0.522951772鱼型小猫帽子핀 고양이 모자랜덤
					case(58){itemString = `id:18097`; iCumRate +=18;} //0.522951772赛连羽翼面具세이렌 깃털 가면랜덤
					case(59){itemString = `id:18098`; iCumRate +=18;} //0.522951772赛连眼镜세이렌의 안경랜덤
					case(60){itemString = `id:18099`; iCumRate +=18;} //0.522951772赛连小翅膀面具세이렌 작은 날개 가면랜덤
					case(61){itemString = `id:18100`; iCumRate +=18;} //0.522951772赛连翅膀面具세이렌 날개 가면랜덤
					case(62){itemString = `id:18101`; iCumRate +=18;} //0.522951772赛连蝙蝠面具세이렌 박쥐 날개 가면랜덤
					case(63){itemString = `id:18102`; iCumRate +=18;} //0.522951772赛连面具세이렌의 가면랜덤
					case(64){itemString = `id:15055`; iCumRate +=18;} //0.522951772赛连猫面具세이렌 고양이 가면랜덤
					case(65){itemString = `id:18044`; iCumRate +=22;} //0.639163277罪人用面具범죄용 복면랜덤
					case(66){itemString = `id:18112`; iCumRate +=22;} //0.639163277太阳伪装装饰해 분장 소품랜덤
					case(67){itemString = `id:18111`; iCumRate +=22;} //0.639163277树伪装装饰나무 분장 소품랜덤
					case(68){itemString = `id:18110`; iCumRate +=22;} //0.639163277草丛伪装装饰덤불 분장 소품랜덤
					case(69){itemString = `id:18109`; iCumRate +=22;} //0.639163277娜儿伪装装饰나오 분장 소품랜덤
					case(70){itemString = `id:18108`; iCumRate +=22;} //0.639163277岩石伪装装饰바위 분장 소품랜덤
					case(71){itemString = `id:18029`; iCumRate +=22;} //0.639163277带框眼镜나무테 안경랜덤
					case(72){itemString = `id:18028`; iCumRate +=22;} //0.639163277轻便眼镜접이식 안경랜덤
					case(73){itemString = `id:16500`; iCumRate +=22;} //0.639163277保护手套울나 프로텍터 글러브랜덤
					case(74){itemString = `id:40071`; iCumRate +=22;} //0.639163277‘拉’音瓶'라' 음 빈 병랜덤
					case(75){itemString = `id:40072`; iCumRate +=22;} //0.639163277‘西’音瓶'시' 음 빈 병랜덤
					case(76){itemString = `id:40073`; iCumRate +=22;} //0.639163277‘哆’音瓶'도' 음 빈 병랜덤
					case(77){itemString = `id:40074`; iCumRate +=22;} //0.639163277‘来’音瓶'레' 음 빈 병랜덤
					case(78){itemString = `id:40075`; iCumRate +=22;} //0.639163277‘咪’音瓶'미' 음 빈 병랜덤
					case(79){itemString = `id:40076`; iCumRate +=22;} //0.639163277‘发’音瓶'파' 음 빈 병랜덤
					case(80){itemString = `id:40077`; iCumRate +=22;} //0.639163277‘嗦’音瓶'솔' 음 빈 병랜덤
					case(81){itemString = `id:16517`; iCumRate +=22;} //0.639163277反对手套반대 장갑랜덤
					case(82){itemString = `id:16516`; iCumRate +=22;} //0.639163277赞成手套찬성 장갑랜덤
					case(83){itemString = `id:16515`; iCumRate +=22;} //0.639163277布手套보 장갑랜덤
					case(84){itemString = `id:16514`; iCumRate +=22;} //0.639163277石头手套바위 장갑랜덤
					case(85){itemString = `id:16513`; iCumRate +=22;} //0.639163277剪子手套가위 장갑랜덤
					case(86){itemString = `id:40068`; iCumRate +=22;} //0.639163277剪刀拳가위 모양 지시봉랜덤
					case(87){itemString = `id:40069`; iCumRate +=22;} //0.639163277石头拳바위 모양 지시봉랜덤
					case(88){itemString = `id:40053`; iCumRate +=22;} //0.639163277一束紫色玫瑰보라빛 장미 꽃다발랜덤
					case(89){itemString = `id:40054`; iCumRate +=22;} //0.639163277一朵紫色玫瑰보라빛 장미 한송이랜덤
					case(90){itemString = `id:18089`; iCumRate +=22;} //0.639163277紫玫瑰花装饰보라빛 장미 장식랜덤
					case(91){itemString = `id:40052`; iCumRate +=22;} //0.639163277一朵蓝色玫瑰파란 장미 한송이랜덤
					case(92){itemString = `id:18090`; iCumRate +=22;} //0.639163277蓝玫瑰花装饰파란 장미 장식랜덤
					case(93){itemString = `id:40070`; iCumRate +=22;} //0.639163277布型指挥棒보 모양 지시봉랜덤
					case(94){itemString = `id:18086`; iCumRate +=22;} //0.639163277雏菊花装饰데이지 꽃 장식랜덤
					case(95){itemString = `id:18087`; iCumRate +=22;} //0.639163277玫瑰花装饰장미 꽃 장식랜덤
					case(96){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.087158629魔法释放卷轴-山查树인챈트 스크롤
					case(97){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.087158629魔法释放卷轴-休闲的인챈트 스크롤
					case(98){itemString = `id:62005 suffix:30201`; iCumRate +=26;} //0.755374782魔法释放卷轴-棕熊인챈트 스크롤랜덤
					case(99){itemString = `id:62005 suffix:30302`; iCumRate +=26;} //0.755374782魔法释放卷轴-地精인챈트 스크롤랜덤
					case(100){itemString = `id:62005 prefix:20201`; iCumRate +=26;} //0.755374782魔法释放卷轴-坚固인챈트 스크롤랜덤
					case(101){itemString = `id:62005 suffix:30304`; iCumRate +=26;} //0.755374782魔法释放卷轴-灰狼인챈트 스크롤랜덤
					case(102){itemString = `id:62005 suffix:30702`; iCumRate +=26;} //0.755374782魔法释放卷轴-乌鸦인챈트 스크롤랜덤
					case(103){itemString = `id:62005 suffix:30704`; iCumRate +=26;} //0.755374782魔法释放卷轴-致命的인챈트 스크롤랜덤
					case(104){itemString = `id:62005 suffix:30801`; iCumRate +=26;} //0.755374782魔法释放卷轴-天然인챈트 스크롤랜덤
					case(105){itemString = `id:62005 suffix:30802`; iCumRate +=26;} //0.755374782魔法释放卷轴-反击인챈트 스크롤랜덤
					case(106){itemString = `id:62005 suffix:30803`; iCumRate +=26;} //0.755374782魔法释放卷轴-风车인챈트 스크롤랜덤
					case(107){itemString = `id:62005 suffix:30804`; iCumRate +=26;} //0.755374782魔法释放卷轴-重击인챈트 스크롤랜덤
					case(108){itemString = `id:62005 prefix:20405`; iCumRate +=26;} //0.755374782魔法释放卷轴-疯狂的인챈트 스크롤랜덤
					case(109){itemString = `id:62005 prefix:20501`; iCumRate +=26;} //0.755374782魔法释放卷轴-简单的인챈트 스크롤랜덤
					case(110){itemString = `id:62005 prefix:20602`; iCumRate +=26;} //0.755374782魔法释放卷轴-坚固的인챈트 스크롤랜덤
					case(111){itemString = `id:62005 prefix:20701`; iCumRate +=26;} //0.755374782魔法释放卷轴-猛烈的인챈트 스크롤랜덤
					case(112){itemString = `id:62005 suffix:30506`; iCumRate +=26;} //0.755374782魔法释放卷轴-可怕的인챈트 스크롤랜덤
					case(113){itemString = `id:62005 suffix:30614`; iCumRate +=26;} //0.755374782魔法释放卷轴-充满力量的인챈트 스크롤랜덤
					case(114){itemString = `id:62005 prefix:20108`; iCumRate +=26;} //0.755374782魔法释放卷轴-无翼鸟인챈트 스크롤랜덤
					case(115){itemString = `id:62005 prefix:20304`; iCumRate +=26;} //0.755374782魔法释放卷轴-鸵鸟인챈트 스크롤랜덤
					case(116){itemString = `id:62005 prefix:20505`; iCumRate +=26;} //0.755374782魔法释放卷轴-蜥蜴인챈트 스크롤랜덤
					case(117){itemString = `id:62005 prefix:20209`; iCumRate +=26;} //0.755374782魔法释放卷轴-猫鼬인챈트 스크롤랜덤
					case(118){itemString = `id:62005 prefix:20409`; iCumRate +=26;} //0.755374782魔法释放卷轴-沙漠狐인챈트 스크롤랜덤
					case(119){itemString = `id:62005 prefix:20615`; iCumRate +=26;} //0.755374782魔法释放卷轴-沙漠蜘蛛인챈트 스크롤랜덤
					case(120){itemString = `id:62005 prefix:20508`; iCumRate +=26;} //0.755374782魔法释放卷轴-可疑的인챈트 스크롤랜덤
					case(121){itemString = `id:62005 prefix:20618`; iCumRate +=26;} //0.755374782魔法释放卷轴-犹豫的인챈트 스크롤랜덤
					case(122){itemString = `id:62005 prefix:20718`; iCumRate +=26;} //0.755374782魔法释放卷轴-奇怪的인챈트 스크롤랜덤
					case(123){itemString = `id:62005 prefix:20212`; iCumRate +=26;} //0.755374782魔法释放卷轴-怪异的인챈트 스크롤랜덤
					case(124){itemString = `id:62005 prefix:20412`; iCumRate +=26;} //0.755374782魔法释放卷轴-奇异的인챈트 스크롤랜덤
					case(125){itemString = `id:62005 prefix:20619`; iCumRate +=26;} //0.755374782魔法释放卷轴-奇特的인챈트 스크롤랜덤
					case(126){itemString = `id:62005 suffix:30616`; iCumRate +=26;} //0.755374782魔法释放卷轴-冷淡的인챈트 스크롤랜덤
					case(127){itemString = `id:62005 suffix:30617`; iCumRate +=26;} //0.755374782魔法释放卷轴-无情的인챈트 스크롤랜덤
					case(128){itemString = `id:62005 suffix:30618`; iCumRate +=26;} //0.755374782魔法释放卷轴-悲惨的인챈트 스크롤랜덤
					case(129){itemString = `id:91034`; iCumRate +=50;} //1.452643812经验增加药水
					case(130){itemString = `id:40033`; iCumRate +=24;} //0.69726903神之刃双手剑클레이모어랜덤
					case(131){itemString = `id:40011`; iCumRate +=24;} //0.69726903阔剑브로드 소드랜덤
					case(132){itemString = `id:40030`; iCumRate +=24;} //0.69726903双手剑투 핸디드 소드랜덤
					case(133){itemString = `id:40012`; iCumRate +=24;} //0.69726903变形剑바스타드 소드랜덤
					case(134){itemString = `id:40007`; iCumRate +=24;} //0.69726903单手斧한손도끼랜덤
					case(135){itemString = `id:40014`; iCumRate +=24;} //0.69726903复合弓콤포짓 보우랜덤
					case(136){itemString = `id:40078`; iCumRate +=24;} //0.69726903两刃斧비펜니스랜덤
					case(137){itemString = `id:40080`; iCumRate +=24;} //0.69726903罗马短剑글라디우스랜덤
					case(138){itemString = `id:40006`; iCumRate +=24;} //0.69726903匕首단검랜덤
					case(139){itemString = `id:40031`; iCumRate +=24;} //0.69726903弩석궁랜덤
					case(140){itemString = `id:40081`; iCumRate +=24;} //0.69726903皮制长弓레더 롱 보우랜덤
					case(141){itemString = `id:40079`; iCumRate +=24;} //0.69726903权杖메이스랜덤
					case(142){itemString = `id:51003 count:10`; iCumRate +=20;} //0.581057525生命药水 50 点생명력 50 포션랜덤
					case(143){itemString = `id:51004 count:10`; iCumRate +=20;} //0.581057525生命药水 100 点생명력 100 포션랜덤
					case(144){itemString = `id:51007 count:10`; iCumRate +=20;} //0.581057525魔法药水 30 点마나 30 포션랜덤
					case(145){itemString = `id:51008 count:10`; iCumRate +=20;} //0.581057525魔法药水 50 点마나 50 포션랜덤
					case(146){itemString = `id:51013 count:10`; iCumRate +=20;} //0.581057525体力药水 50 点스태미나 50 포션랜덤
					case(147){itemString = `id:51014 count:10`; iCumRate +=20;} //0.581057525体力药水 100 点스태미나 100 포션랜덤
					case(148){itemString = `id:51001 count:10`; iCumRate +=20;} //0.581057525生命药水 10 点생명력 10 포션랜덤
					case(149){itemString = `id:51002 count:10`; iCumRate +=20;} //0.581057525生命药水 30 点생명력 30 포션랜덤
					case(150){itemString = `id:51022 count:10`; iCumRate +=20;} //0.581057525生命魔法药水 30 点생명력과 마나 30 포션랜덤
					case(151){itemString = `id:51027 count:10`; iCumRate +=20;} //0.581057525生命体力药水 30 点생명력과 스태미나 30 포션랜덤
					case(152){itemString = `id:51028 count:10`; iCumRate +=20;} //0.581057525生命体力药水 50 点생명력과 스태미나 50 포션랜덤
					case(153){itemString = `id:51029 count:10`; iCumRate +=20;} //0.581057525生命体力药水 100 点생명력과 스태미나 100 포션랜덤
					case(154){itemString = `id:63000 count:10`; iCumRate +=20;} //0.581057525凤凰羽毛피닉스의 깃털랜덤
					case(155){itemString = `id:60037 count:5`; iCumRate +=20;} //0.581057525黑色青春药水블랙 유스 포션랜덤
					case(156){itemString = `id:60038 count:5`; iCumRate +=20;} //0.581057525红色药水레드 포션랜덤
					case(157){itemString = `id:62004 count:5`; iCumRate +=20;} //0.581057525魔法粉마법가루랜덤
					case(158){itemString = `id:50012 count:5`; iCumRate +=20;} //0.581057525金鸡蛋황금 달걀랜덤
					case(159){itemString = `id:50013 count:5`; iCumRate +=20;} //0.581057525金苹果황금 사과랜덤
					case(160){itemString = `id:50541  quality:100`; iCumRate +=16;} //0.46484602意大利浓缩咖啡에스프레소
					case(161){itemString = `id:50542  quality:100`; iCumRate +=16;} //0.46484602意大利式泡沫牛奶에스프레소 마끼아또
					case(162){itemString = `id:50543  quality:100`; iCumRate +=16;} //0.46484602卡布奇诺카푸치노
					case(163){itemString = `id:50544  quality:100`; iCumRate +=16;} //0.46484602玛奇雅朵마끼아또
					case(164){itemString = `id:50545  quality:100`; iCumRate +=16;} //0.46484602摩卡咖啡카페 모카
					case(165){itemString = `id:50546  quality:100`; iCumRate +=16;} //0.46484602冰摩卡咖啡아이스 카페 모카
					case(166){itemString = `id:50547  quality:100`; iCumRate +=16;} //0.46484602冰玛奇雅朵아이스 마끼아또
					case(167){itemString = `id:50170 quality:100`; iCumRate +=16;} //0.46484602芝士酱치즈 퐁듀랜덤
					case(168){itemString = `id:50171 quality:100`; iCumRate +=16;} //0.46484602艾明玛恰红酒이멘 마하산 와인랜덤
					case(169){itemString = `id:50172 quality:100`; iCumRate +=16;} //0.46484602芝士蛋糕레어치즈 케익랜덤
					case(170){itemString = `id:50173 quality:100`; iCumRate +=16;} //0.46484602巧克力奶油蛋糕가토 오 쇼콜라랜덤
					case(171){itemString = `id:50174 quality:100`; iCumRate +=16;} //0.46484602火腿面包크로크 무슈랜덤
					case(172){itemString = `id:50175 quality:100`; iCumRate +=16;} //0.46484602核仁巧克力蛋糕브라우니랜덤
					case(173){itemString = `id:50176 quality:100`; iCumRate +=16;} //0.46484602奶油饼干버터 비스킷랜덤
					case(174){itemString = `id:50177 quality:100`; iCumRate +=16;} //0.46484602巧克力酥饼초코칩 쿠키랜덤
					case(175){itemString = `id:50178 quality:100`; iCumRate +=16;} //0.46484602橙汁오렌지 주스랜덤
					case(176){itemString = `id:50179 quality:100`; iCumRate +=16;} //0.46484602柠檬汁레몬 주스랜덤
					case(177){itemString = `id:50180 quality:100`; iCumRate +=16;} //0.46484602巧克力牛奶초콜릿 우유랜덤
					case(178){itemString = `id:50181 quality:100`; iCumRate +=16;} //0.46484602杜松子酒라인산 진랜덤
					case(179){itemString = `id:50182 quality:100`; iCumRate +=16;} //0.46484602泊利内威士忌브리흐네 위스키랜덤
					case(180){itemString = `id:50199 quality:100`; iCumRate +=16;} //0.46484602血腥玛莉스크류 드라이버랜덤
					case(181){itemString = `id:50200 quality:100`; iCumRate +=16;} //0.46484602水晶之恋라인 슬링랜덤
					case(182){itemString = `id:50201 quality:100`; iCumRate +=16;} //0.46484602BnRBnR랜덤
					case(183){itemString = `id:50202 quality:100`; iCumRate +=16;} //0.46484602烈焰红唇키스 온 더 립스랜덤
					case(184){itemString = `id:50203 quality:100`; iCumRate +=16;} //0.46484602日出东方레드 선라이즈랜덤
					case(185){itemString = `id:50183 quality:100`; iCumRate +=16;} //0.46484602迪夫尼修黑啤酒데브니쉬 흑맥주랜덤
					case(186){itemString = `id:50123 quality:100`; iCumRate +=16;} //0.46484602烤咸肉베이컨구이랜덤
					case(187){itemString = `id:50124 quality:100`; iCumRate +=16;} //0.46484602100%品质 牛排비프 스테이크랜덤
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
					// 몬스터 소환
					GenerateMonster(player);
					}
					return;
				}
				++i;
			}
		}
	}

	// 중국 보물상자 이벤트용 ~ 고급 보물상자(리뉴얼)
	else if (itemID == 91046)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			int iRandom		= Random(3126);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;

				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:14047 `; iCumRate += 1;} //0.0319897633 불꽃 문양 레더 아머 (남성용)
					case(1){itemString = `id:14048 `; iCumRate += 1;} //0.0319897633 불꽃 문양 레더 아머 (여성용)
					case(2){itemString = `id:16054 `; iCumRate += 1;} //0.0319897633 불꽃 문양 레더 글러브
					case(3){itemString = `id:17130 `; iCumRate += 1;} //0.0319897633 불꽃 문양 레더 부츠
					case(4){itemString = `id:18559 `; iCumRate += 1;} //0.0319897633 불꽃 문양 레더 캡
					case(5){itemString = `id:14049 `; iCumRate += 1;} //0.0319897633 야만적인 여우 갑옷 (남성용)
					case(6){itemString = `id:14050 `; iCumRate += 1;} //0.0319897633 야만적인 여우 갑옷 (여성용)
					case(7){itemString = `id:16055 `; iCumRate += 1;} //0.0319897633 야만적인 여우 장갑 (남성용)
					case(8){itemString = `id:16056 `; iCumRate += 1;} //0.0319897633 야만적인 여우 장갑 (여성용)
					case(9){itemString = `id:15327 `; iCumRate += 1;} //0.0319897633 스트라이프 모피 코트
					case(10){itemString = `id:15328 `; iCumRate += 1;} //0.0319897633 스트라이프 모피 드레스
					case(11){itemString = `id:17133 `; iCumRate += 1;} //0.0319897633 스트라이프 털 부츠 (남성용)
					case(12){itemString = `id:17134 `; iCumRate += 1;} //0.0319897633 스트라이프 털 부츠 (여성용)
					case(13){itemString = `id:19048 `; iCumRate += 1;} //0.0319897633 광대 로브
					case(14){itemString = `id:19049 `; iCumRate += 1;} //0.0319897633 스라스 라인 로브 (남성용)
					case(15){itemString = `id:19050 `; iCumRate += 1;} //0.0319897633 스라스 라인 로브 (여성용)
					case(16){itemString = `id:40352 `; iCumRate += 5;} //0.1599488164 소프트 아이스 크림 숏소드
					case(17){itemString = `id:40353 `; iCumRate += 5;} //0.1599488164 폭죽형 활
					case(18){itemString = `id:40355 `; iCumRate += 5;} //0.1599488164 별사탕 메이스
					case(19){itemString = `id:18305 `; iCumRate += 5;} //0.1599488164 도넛 안경
					case(20){itemString = `id:15065 `; iCumRate += 5;} //0.1599488164 엘라 베스트 스커트
					case(21){itemString = `id:18044 col1:101010`; iCumRate += 5;} //0.1599488164 검은색 범죄용 복면
					case(22){itemString = `id:40017 col1:86402894 col2:660000 col3:000000`; iCumRate += 5;} //0.1599488164 빨강->검은 반짝이 만돌린
					case(23){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 5;} //0.1599488164 검정색 석궁
					case(24){itemString = `id:40095 `; iCumRate += 5;} //0.1599488164 드래곤 블레이드
					case(25){itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.1599488164 레미니아 성월의 갑옷(남성용)
					case(26){itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.1599488164 레미니아 성월의 갑옷(여성용)
					case(27){itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.1599488164 아리쉬 아슈빈 아머(남성용)
					case(28){itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 5;} //0.1599488164 아리쉬 아슈빈 아머(여성용)
					case(29){itemString = `id:40033 col1:111111 col2:111111 col3:111111`; iCumRate += 5;} //0.1599488164 검정빛 클레이모어
					case(30){itemString = `id:63034 col1:ff0000`; iCumRate += 5;} //0.1599488164 붉은색 염색 앰플
					case(31){itemString = `id:63033 col1:000000`; iCumRate += 5;} //0.1599488164 검은색 염색 앰플
					case(32){itemString = `id:40033 suffix:30702`; iCumRate += 5;} //0.1599488164 클레이모어
					case(33){itemString = `id:40090 suffix:31003`; iCumRate += 5;} //0.1599488164 힐링 원드
					case(34){itemString = `id:40038 suffix:31003`; iCumRate += 5;} //0.1599488164 라이트닝 원드
					case(35){itemString = `id:40040 suffix:31003`; iCumRate += 5;} //0.1599488164 파이어 원드
					case(36){itemString = `id:40041 suffix:31003`; iCumRate += 5;} //0.1599488164 타격용 원드
					case(37){itemString = `id:15043 `; iCumRate += 5;} //0.1599488164 스포티 웨어 세트
					case(38){itemString = `id:40010 col1:6666ff col2:0053A6 col3:004080`; iCumRate += 5;} //0.1599488164 푸른 롱 소드
					case(39){itemString = `id:63030 col1:61000800`; iCumRate += 5;} //0.1599488164 반짝이 지정 색상 염색 앰플
					case(40){itemString = `id:13043 `; iCumRate += 10;} //0.3198976328 레미니아 성월의 갑옷(남성용)
					case(41){itemString = `id:13044 `; iCumRate += 10;} //0.3198976328 레미니아 성월의 갑옷(여성용)
					case(42){itemString = `id:13045 `; iCumRate += 10;} //0.3198976328 아리쉬 아슈빈 아머(남성용)
					case(43){itemString = `id:13046 `; iCumRate += 10;} //0.3198976328 아리쉬 아슈빈 아머(여성용)
					case(44){itemString = `id:40081 suffix:30702`; iCumRate += 10;} //0.3198976328 레더 롱 보우
					case(45){itemString = `id:40080 suffix:30702`; iCumRate += 10;} //0.3198976328 글라디우스
					case(46){itemString = `id:15153 `; iCumRate += 10;} //0.3198976328 @산드라 스나이퍼 수트(남성용)
					case(47){itemString = `id:15154 `; iCumRate += 10;} //0.3198976328 @산드라 스나이퍼 수트(여성용)
					case(48){itemString = `id:16026 `; iCumRate += 10;} //0.3198976328 @산드라 스나이퍼 수트 글러브
					case(49){itemString = `id:17060 `; iCumRate += 10;} //0.3198976328 @산드라 스나이퍼 수트 부츠(남성용)
					case(50){itemString = `id:17061 `; iCumRate += 10;} //0.3198976328 @산드라 스나이퍼 수트 부츠(여성용)
					case(51){itemString = `id:17031 `; iCumRate += 15;} //0.4798464491 아웃도어 앵클 부츠
					case(52){itemString = `id:40002 col1:202020`; iCumRate += 15;} //0.4798464491 검은 연습용 목도
					case(53){itemString = `id:15030 `; iCumRate += 15;} //0.4798464491 코레스 힐러 슈트
					case(54){itemString = `id:15041 `; iCumRate += 15;} //0.4798464491 사무직 여성용 슈트
					case(55){itemString = `id:15051 `; iCumRate += 15;} //0.4798464491 타이트 벨트 웨어
					case(56){itemString = `id:17025 `; iCumRate += 15;} //0.4798464491 샌달
					case(57){itemString = `id:40078 suffix:30702`; iCumRate += 15;} //0.4798464491 비펜니스
					case(58){itemString = `id:40079 prefix:20701`; iCumRate += 15;} //0.4798464491 메이스
					case(59){itemString = `id:40031 prefix:20701`; iCumRate += 15;} //0.4798464491 석궁
					case(60){itemString = `id:40030 suffix:30702`; iCumRate += 15;} //0.4798464491 투 핸디드 소드
					case(61){itemString = `id:40013 prefix:20701`; iCumRate += 15;} //0.4798464491 롱 보우
					case(62){itemString = `id:40014 prefix:20701`; iCumRate += 15;} //0.4798464491 콤포짓 보우
					case(63){itemString = `id:40016 prefix:20701`; iCumRate += 15;} //0.4798464491 해머
					case(64){itemString = `id:40010 suffix:30702`; iCumRate += 15;} //0.4798464491 롱 소드
					case(65){itemString = `id:40011 suffix:30702`; iCumRate += 15;} //0.4798464491 브로드 소드
					case(66){itemString = `id:40012 suffix:30702`; iCumRate += 15;} //0.4798464491 바스타드 소드
					case(67){itemString = `id:40015 suffix:30702`; iCumRate += 15;} //0.4798464491 플루트 숏 소드
					case(68){itemString = `id:40003 prefix:20701`; iCumRate += 15;} //0.4798464491 숏 보우
					case(69){itemString = `id:40005 suffix:30702`; iCumRate += 15;} //0.4798464491 숏 소드
					case(70){itemString = `id:40006 suffix:30702`; iCumRate += 15;} //0.4798464491 단검
					case(71){itemString = `id:40002 suffix:30702`; iCumRate += 15;} //0.4798464491 연습용 목도
					case(72){itemString = `id:13010 `; iCumRate += 15;} //0.4798464491 @라운드 폴드론 체인메일
					case(73){itemString = `id:13023 `; iCumRate += 15;} //0.4798464491 @로즈 플레이트 아머 (B타입)
					case(74){itemString = `id:16504 `; iCumRate += 15;} //0.4798464491 @카운터 건틀렛
					case(75){itemString = `id:17500 `; iCumRate += 15;} //0.4798464491 @하이폴린 플레이트 부츠
					case(76){itemString = `id:18508 `; iCumRate += 15;} //0.4798464491 @슬릿 풀 헬름
					case(77){itemString = `id:40006 `; iCumRate += 30;} //0.9596928983 단검
					case(78){itemString = `id:40005 `; iCumRate += 30;} //0.9596928983 숏 소드
					case(79){itemString = `id:40010 `; iCumRate += 30;} //0.9596928983 롱 소드
					case(80){itemString = `id:40007 `; iCumRate += 30;} //0.9596928983 한손 도끼
					case(81){itemString = `id:40016 `; iCumRate += 30;} //0.9596928983 해머
					case(82){itemString = `id:40015 `; iCumRate += 30;} //0.9596928983 플루트 숏소드
					case(83){itemString = `id:40030 `; iCumRate += 30;} //0.9596928983 투 핸디드 소드
					case(84){itemString = `id:40011 `; iCumRate += 30;} //0.9596928983 브로드 소드
					case(85){itemString = `id:40033 `; iCumRate += 30;} //0.9596928983 클레이모어
					case(86){itemString = `id:40012 `; iCumRate += 30;} //0.9596928983 바스타드 소드
					case(87){itemString = `id:40019 `; iCumRate += 30;} //0.9596928983 굵은 나뭇가지
					case(88){itemString = `id:40020 `; iCumRate += 30;} //0.9596928983 나무 몽둥이
					case(89){itemString = `id:40031 `; iCumRate += 30;} //0.9596928983 석궁
					case(90){itemString = `id:40013 `; iCumRate += 30;} //0.9596928983 롱 보우
					case(91){itemString = `id:40014 `; iCumRate += 30;} //0.9596928983 콤포짓 보우
					case(92){itemString = `id:40003 `; iCumRate += 30;} //0.9596928983 숏 보우
					case(93){itemString = `id:46001 `; iCumRate += 30;} //0.9596928983 라운드 실드
					case(94){itemString = `manual:106 `; iCumRate += 30;} //0.9596928983 옷본 - 포포스커트(여)
					case(95){itemString = `manual:112 `; iCumRate += 30;} //0.9596928983 옷본 - 마법사모자
					case(96){itemString = `manual:114 `; iCumRate += 30;} //0.9596928983 옷본 - 머리띠
					case(97){itemString = `manual:107 `; iCumRate += 30;} //0.9596928983 옷본 - 몬거 여행자옷(여)
					case(98){itemString = `manual:108 `; iCumRate += 30;} //0.9596928983 옷본 - 몬거 여행자옷(남)
					case(99){itemString = `manual:102 `; iCumRate += 30;} //0.9596928983 옷본 - 마법학교 교복(남)
					case(100){itemString = `manual:115 `; iCumRate += 30;} //0.9596928983 옷본 - 몬거 롱스커트(여)
					case(101){itemString = `manual:118 `; iCumRate += 30;} //0.9596928983 옷본 - 코레스 닌자슈트(남)
					case(102){itemString = `manual:111 `; iCumRate += 30;} //0.9596928983 옷본 - 가디언 장갑
					case(103){itemString = `manual:117 `; iCumRate += 30;} //0.9596928983 옷본 - 리리나 롱스커트(여)
					case(104){itemString = `manual:105 `; iCumRate += 30;} //0.9596928983 옷본 - 몬거 모자
					case(105){itemString = `manual:109 `; iCumRate += 30;} //0.9596928983 옷본 - 클로스 메일
					case(106){itemString = `manual:116 `; iCumRate += 30;} //0.9596928983 옷본 - 라이트 레더메일(여)
					case(107){itemString = `manual:120 `; iCumRate += 30;} //0.9596928983 옷본 - 라이트 레더메일(남)
					case(108){itemString = `manual:126 `; iCumRate += 30;} //0.9596928983 옷본 - 루이스 베스트 웨어(남)
					case(109){itemString = `manual:122 `; iCumRate += 30;} //0.9596928983 옷본 - 전문가용 실크방직 장갑
					case(110){itemString = `manual:119 `; iCumRate += 30;} //0.9596928983 옷본 - 코레스 씨프슈트(남)
					case(111){itemString = `manual:123 `; iCumRate += 30;} //0.9596928983 옷본 - 레더 미니 원피스 링타입(여)
					case(112){itemString = `id:62005 prefix:207`; iCumRate += 30;} //0.9596928983 폭스
					case(113){itemString = `id:60009 count:5`; iCumRate += 30;} //0.9596928983 양털
					case(114){itemString = `id:60008 count:5`; iCumRate += 30;} //0.9596928983 거미줄
					case(115){itemString = `id:60004 count:5`; iCumRate += 30;} //0.9596928983 매듭끈
					case(116){itemString = `id:60028 count:10`; iCumRate += 30;} //0.9596928983 일반 가죽끈
					case(117){itemString = `id:60013 count:10`; iCumRate += 30;} //0.9596928983 고급 실크
					case(118){itemString = `id:60021 count:10`; iCumRate += 30;} //0.9596928983 고급 옷감
					case(119){itemString = `id:60017 count:10`; iCumRate += 30;} //0.9596928983 고급 마감용 실
					case(120){itemString = `id:60025 count:10`; iCumRate += 30;} //0.9596928983 고급 가죽
					case(121){itemString = `id:60012 count:10`; iCumRate += 30;} //0.9596928983 일반 실크
					case(122){itemString = `id:60016 count:10`; iCumRate += 30;} //0.9596928983 일반 마감용 실
					case(123){itemString = `id:60020 count:10`; iCumRate += 30;} //0.9596928983 일반 옷감
					case(124){itemString = `id:60024 count:10`; iCumRate += 30;} //0.9596928983 일반 가죽
					case(125){itemString = `id:64002 count:10`; iCumRate += 30;} //0.9596928983 철광석
					case(126){itemString = `id:64004 count:10`; iCumRate += 30;} //0.9596928983 동광석
					case(127){itemString = `id:64006 count:10`; iCumRate += 30;} //0.9596928983 은광석
					case(128){itemString = `id:64001 count:10`; iCumRate += 30;} //0.9596928983 철괴
					case(129){itemString = `id:64003 count:10`; iCumRate += 30;} //0.9596928983 동괴
					case(130){itemString = `id:64005 count:10`; iCumRate += 30;} //0.9596928983 은괴
					case(131){itemString = `id:51102 count:10`; iCumRate += 30;} //0.9596928983 마나 허브
					case(132){itemString = `id:51101 count:10`; iCumRate += 30;} //0.9596928983 블러디 허브
					case(133){itemString = `id:51103 count:10`; iCumRate += 30;} //0.9596928983 선라이트 허브
					case(134){itemString = `id:62003 count:5`; iCumRate += 30;} //0.9596928983 축복받은 마법가루
					case(135){itemString = `id:63029 count:5`; iCumRate += 30;} //0.9596928983 캠프파이어 키트
					case(136){itemString = `id:50203 `; iCumRate += 30;} //0.9596928983 레드 선라이즈
					case(137){itemString = `id:50124 quality:80`; iCumRate += 30;} //0.9596928983 비프 스테이크 80퀄리티
					case(138){itemString = `id:51022 count:5`; iCumRate += 30;} //0.9596928983 생명력과 마나 30 포션
					case(139){itemString = `id:51027 count:5`; iCumRate += 30;} //0.9596928983 생명력과 스태미나 30 포션
					case(140){itemString = `id:51028 count:3`; iCumRate += 30;} //0.9596928983 생명력과 스태미나 50 포션
					case(141){itemString = `id:63043 count:3`; iCumRate += 30;} //0.9596928983 어드밴스드 깃털
					case(142){itemString = `id:63001 `; iCumRate += 30;} //0.9596928983 여신의 날개
					case(143){itemString = `id:40002 `; iCumRate += 30;} //0.9596928983 연습용 목도
					case(144){itemString = `id:51031 count:3`; iCumRate += 30;} //0.9596928983 완전 회복의 포션
					case(145){itemString = `id:63026 `; iCumRate += 30;} //0.9596928983 원격 은행 이용권
					case(146){itemString = `id:63057 `; iCumRate += 30;} //0.9596928983 원격 의류 수리 이용권
					case(147){itemString = `id:63047 `; iCumRate += 30;} //0.9596928983 원격 힐러집 이용권
					case(148){itemString = `id:63039 expire:10080`; iCumRate += 30;} //0.9596928983 캠프 키트
					case(149){itemString = `id:63029 count:5`; iCumRate += 30;} //0.9596928983 캠프파이어키트
					case(150){itemString = `id:2006 `; iCumRate += 30;} //0.9596928983 큰 금화주머니
					case(151){itemString = `id:50202 `; iCumRate += 30;} //0.9596928983 키스 온 더 립스
					case(152){itemString = `id:63044 count:3`; iCumRate += 30;} //0.9596928983 파티 부활의 깃털
					case(153){itemString = `id:63000 count:3`; iCumRate += 30;} //0.9596928983 피닉스의 깃털
					case(154){itemString = `id:63058 `; iCumRate += 30;} //0.9596928983 회복 속도 증가 포션
					case(155){itemString = `id:50201 quality:80`; iCumRate += 30;} //0.9596928983 BnR 80퀄리티
					case(156){itemString = `id:50164 quality:80`; iCumRate += 30;} //0.9596928983 T본 스테이크 80퀄리티
					case(157){itemString = `id:40004 `; iCumRate += 30;} //0.9596928983 류트
					case(158){itemString = `id:40018 `; iCumRate += 30;} //0.9596928983 우쿨렐레
					case(159){itemString = `id:40017 `; iCumRate += 30;} //0.9596928983 만돌린
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int randomSetId = 1028;   // 고유 ID.. RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);

			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);
			player.ShowCaption(["event.useitem_event.38"]);
			int itemID2 = newItem.GetClassId();
			string charName = player.GetDisplayName();
			string ItemName;
			if (itemID2 == 40292 || itemID2 == 40958 || itemID2 == 40313 || itemID2 == 18261)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
			{
				ItemName = newItem.GetFullLocalName();
				AnnounceAllChannel(2, charName + ["event.useitem_event.44"]+ ItemName + ["event.useitem_event.45"]);
			}

			if (bUsePremiumKey)
			{
				GiveItemByPremiumKey(player, itemID);
			}
			if (bMonster)
			{
				// 몬스터 소환
				GenerateMonster(player);
			}
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			int iRandom		= Random(3285);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13043 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} // 0.0304414레미니아 성월의 갑옷(남성용)
					case(1){itemString = `id:13044 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} // 0.0304414레미니아 성월의 갑옷(여성용)
					case(2){itemString = `id:13045 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} // 0.0304414아리쉬 아슈빈 아머(남성용)
					case(3){itemString = `id:13046 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 1;} // 0.0304414아리쉬 아슈빈 아머(여성용)
					case(4){itemString = `id:40033 col1:111111 col2:111111 col3:111111`; iCumRate += 1;} // 0.0304414검정빛 클레이모어
					case(5){itemString = `id:63034 col1:ff0000`; iCumRate += 2;} // 0.060882801붉은색 염색 앰플
					case(6){itemString = `id:63033 col1:000000`; iCumRate += 2;} // 0.060882801검은색 염색 앰플
					case(7){itemString = `id:40033 suffix:30702`; iCumRate += 2;} // 0.060882801클레이모어
					case(8){itemString = `id:40090 suffix:31003`; iCumRate += 2;} // 0.060882801힐링 원드
					case(9){itemString = `id:40038 suffix:31003`; iCumRate += 2;} // 0.060882801라이트닝 원드
					case(10){itemString = `id:40040 suffix:31003`; iCumRate += 2;} // 0.060882801파이어 원드
					case(11){itemString = `id:40041 suffix:31003`; iCumRate += 2;} // 0.060882801타격용 원드
					case(12){itemString = `id:15043`; iCumRate += 2;} // 0.060882801스포티 웨어 세트
					case(13){itemString = `id:40010 col1:6666ff col2:0053A6 col3:004080`; iCumRate += 2;} // 0.060882801푸른 롱 소드
					case(14){itemString = `id:63030 col1:61000800`; iCumRate += 2;} // 0.060882801반짝이 지정 색상 염색 앰플
					case(15){itemString = `id:13043`; iCumRate += 4;} // 0.121765601레미니아 성월의 갑옷(남성용)
					case(16){itemString = `id:13044`; iCumRate += 4;} // 0.121765601레미니아 성월의 갑옷(여성용)
					case(17){itemString = `id:13045`; iCumRate += 4;} // 0.121765601아리쉬 아슈빈 아머(남성용)
					case(18){itemString = `id:13046`; iCumRate += 4;} // 0.121765601아리쉬 아슈빈 아머(여성용)
					case(19){itemString = `id:40081 suffix:30702`; iCumRate += 4;} // 0.121765601레더 롱 보우
					case(20){itemString = `id:40080 suffix:30702`; iCumRate += 4;} // 0.121765601글라디우스
					case(21){itemString = `id:15153`; iCumRate += 4;} // 0.121765601@산드라 스나이퍼 수트(남성용)
					case(22){itemString = `id:15154`; iCumRate += 4;} // 0.121765601@산드라 스나이퍼 수트(여성용)
					case(23){itemString = `id:16026`; iCumRate += 4;} // 0.121765601@산드라 스나이퍼 수트 글러브
					case(24){itemString = `id:17060`; iCumRate += 4;} // 0.121765601@산드라 스나이퍼 수트 부츠(남성용)
					case(25){itemString = `id:17061`; iCumRate += 4;} // 0.121765601@산드라 스나이퍼 수트 부츠(여성용)
					case(26){itemString = `id:17031`; iCumRate += 8;} // 0.243531202아웃도어 앵클 부츠
					case(27){itemString = `id:40002 col1:202020`; iCumRate += 8;} // 0.243531202검은 연습용 목도
					case(28){itemString = `id:15030`; iCumRate += 8;} // 0.243531202코레스 힐러 슈트
					case(29){itemString = `id:15041`; iCumRate += 8;} // 0.243531202사무직 여성용 슈트
					case(30){itemString = `id:15051`; iCumRate += 8;} // 0.243531202타이트 벨트 웨어
					case(31){itemString = `id:17025`; iCumRate += 8;} // 0.243531202샌달
					case(32){itemString = `id:40078 suffix:30702`; iCumRate += 8;} // 0.243531202비펜니스
					case(33){itemString = `id:40079 prefix:20701`; iCumRate += 8;} // 0.243531202메이스
					case(34){itemString = `id:40031 prefix:20701`; iCumRate += 8;} // 0.243531202석궁
					case(35){itemString = `id:40030 suffix:30702`; iCumRate += 8;} // 0.243531202투 핸디드 소드
					case(36){itemString = `id:40013 prefix:20701`; iCumRate += 8;} // 0.243531202롱 보우
					case(37){itemString = `id:40014 prefix:20701`; iCumRate += 8;} // 0.243531202콤포짓 보우
					case(38){itemString = `id:40016 prefix:20701`; iCumRate += 8;} // 0.243531202해머
					case(39){itemString = `id:40010 suffix:30702`; iCumRate += 8;} // 0.243531202롱 소드
					case(40){itemString = `id:40011 suffix:30702`; iCumRate += 8;} // 0.243531202브로드 소드
					case(41){itemString = `id:40012 suffix:30702`; iCumRate += 8;} // 0.243531202바스타드 소드
					case(42){itemString = `id:40015 suffix:30702`; iCumRate += 8;} // 0.243531202플루트 숏 소드
					case(43){itemString = `id:40003 prefix:20701`; iCumRate += 8;} // 0.243531202숏 보우
					case(44){itemString = `id:40005 suffix:30702`; iCumRate += 8;} // 0.243531202숏 소드
					case(45){itemString = `id:40006 suffix:30702`; iCumRate += 8;} // 0.243531202단검
					case(46){itemString = `id:40002 suffix:30702`; iCumRate += 8;} // 0.243531202연습용 목도
					case(47){itemString = `id:13010`; iCumRate += 8;} // 0.243531202@라운드 폴드론 체인메일
					case(48){itemString = `id:13023`; iCumRate += 8;} // 0.243531202@로즈 플레이트 아머 (B타입)
					case(49){itemString = `id:16504`; iCumRate += 8;} // 0.243531202@카운터 건틀렛
					case(50){itemString = `id:17500`; iCumRate += 8;} // 0.243531202@하이폴린 플레이트 부츠
					case(51){itemString = `id:18508`; iCumRate += 8;} // 0.243531202@슬릿 풀 헬름
					case(52){itemString = `id:40006`; iCumRate += 16;} // 0.487062405단검
					case(53){itemString = `id:40005`; iCumRate += 16;} // 0.487062405숏 소드
					case(54){itemString = `id:40010`; iCumRate += 16;} // 0.487062405롱 소드
					case(55){itemString = `id:40007`; iCumRate += 16;} // 0.487062405한손 도끼
					case(56){itemString = `id:40016`; iCumRate += 16;} // 0.487062405해머
					case(57){itemString = `id:40015`; iCumRate += 16;} // 0.487062405플루트 숏소드
					case(58){itemString = `id:40030`; iCumRate += 16;} // 0.487062405투 핸디드 소드
					case(59){itemString = `id:40011`; iCumRate += 16;} // 0.487062405브로드 소드
					case(60){itemString = `id:40033`; iCumRate += 16;} // 0.487062405클레이모어
					case(61){itemString = `id:40012`; iCumRate += 16;} // 0.487062405바스타드 소드
					case(62){itemString = `id:40019`; iCumRate += 16;} // 0.487062405굵은 나뭇가지
					case(63){itemString = `id:40020`; iCumRate += 16;} // 0.487062405나무 몽둥이
					case(64){itemString = `id:40031`; iCumRate += 16;} // 0.487062405석궁
					case(65){itemString = `id:40013`; iCumRate += 16;} // 0.487062405롱 보우
					case(66){itemString = `id:40014`; iCumRate += 16;} // 0.487062405콤포짓 보우
					case(67){itemString = `id:40003`; iCumRate += 16;} // 0.487062405숏 보우
					case(68){itemString = `id:46001`; iCumRate += 16;} // 0.487062405라운드 실드
					case(69){itemString = `manual:106`; iCumRate += 16;} // 0.487062405옷본 - 포포스커트(여)
					case(70){itemString = `manual:112`; iCumRate += 16;} // 0.487062405옷본 - 마법사모자
					case(71){itemString = `manual:114`; iCumRate += 16;} // 0.487062405옷본 - 머리띠
					case(72){itemString = `manual:107`; iCumRate += 16;} // 0.487062405옷본 - 몬거 여행자옷(여)
					case(73){itemString = `manual:108`; iCumRate += 16;} // 0.487062405옷본 - 몬거 여행자옷(남)
					case(74){itemString = `manual:102`; iCumRate += 16;} // 0.487062405옷본 - 마법학교 교복(남)
					case(75){itemString = `manual:115`; iCumRate += 16;} // 0.487062405옷본 - 몬거 롱스커트(여)
					case(76){itemString = `manual:118`; iCumRate += 16;} // 0.487062405옷본 - 코레스 닌자슈트(남)
					case(77){itemString = `manual:111`; iCumRate += 16;} // 0.487062405옷본 - 가디언 장갑
					case(78){itemString = `manual:117`; iCumRate += 16;} // 0.487062405옷본 - 리리나 롱스커트(여)
					case(79){itemString = `manual:105`; iCumRate += 16;} // 0.487062405옷본 - 몬거 모자
					case(80){itemString = `manual:109`; iCumRate += 16;} // 0.487062405옷본 - 클로스 메일
					case(81){itemString = `manual:116`; iCumRate += 16;} // 0.487062405옷본 - 라이트 레더메일(여)
					case(82){itemString = `manual:120`; iCumRate += 16;} // 0.487062405옷본 - 라이트 레더메일(남)
					case(83){itemString = `manual:126`; iCumRate += 16;} // 0.487062405옷본 - 루이스 베스트 웨어(남)
					case(84){itemString = `manual:122`; iCumRate += 16;} // 0.487062405옷본 - 전문가용 실크방직 장갑
					case(85){itemString = `manual:119`; iCumRate += 16;} // 0.487062405옷본 - 코레스 씨프슈트(남)
					case(86){itemString = `manual:123`; iCumRate += 16;} // 0.487062405옷본 - 레더 미니 원피스 링타입(여)
					case(87){itemString = `manual:20106`; iCumRate += 16;} // 0.487062405도면 - 낫
					case(88){itemString = `manual:20104`; iCumRate += 16;} // 0.487062405도면 - 곡괭이
					case(89){itemString = `manual:20131`; iCumRate += 16;} // 0.487062405도면 - 숏 소드
					case(90){itemString = `manual:20102`; iCumRate += 16;} // 0.487062405도면 - 단검
					case(91){itemString = `manual:20108`; iCumRate += 16;} // 0.487062405도면 - 스파이크 캡
					case(92){itemString = `manual:20103`; iCumRate += 16;} // 0.487062405도면 - 라운드 실드
					case(93){itemString = `manual:20105`; iCumRate += 16;} // 0.487062405도면 - 롱 소드
					case(94){itemString = `manual:20117`; iCumRate += 16;} // 0.487062405도면 - 그리브 부츠
					case(95){itemString = `manual:20134`; iCumRate += 16;} // 0.487062405도면 - 해머
					case(96){itemString = `manual:20135`; iCumRate += 16;} // 0.487062405도면 - 브로드 소드
					case(97){itemString = `manual:20137`; iCumRate += 16;} // 0.487062405도면 - 바스타드 소드
					case(98){itemString = `id:62005 prefix:6`; iCumRate += 16;} // 0.487062405스네이크헌터
					case(99){itemString = `id:62005 prefix:7`; iCumRate += 16;} // 0.487062405폭스헌터
					case(100){itemString = `id:62005 prefix:107`; iCumRate += 16;} // 0.487062405폭스테이머
					case(101){itemString = `id:62005 prefix:207`; iCumRate += 16;} // 0.487062405폭스
					case(102){itemString = `id:62005 suffix:10604`; iCumRate += 16;} // 0.487062405농부의
					case(103){itemString = `id:62005 suffix:11104`; iCumRate += 16;} // 0.487062405위크니스
					case(104){itemString = `id:60009 count:5`; iCumRate += 32;} // 0.97412481양털
					case(105){itemString = `id:60008 count:5`; iCumRate += 32;} // 0.97412481거미줄
					case(106){itemString = `id:60004 count:5`; iCumRate += 32;} // 0.97412481매듭끈
					case(107){itemString = `id:60028 count:10`; iCumRate += 32;} // 0.97412481일반 가죽끈
					case(108){itemString = `id:60013 count:10`; iCumRate += 32;} // 0.97412481고급 실크
					case(109){itemString = `id:60021 count:10`; iCumRate += 32;} // 0.97412481고급 옷감
					case(110){itemString = `id:60017 count:10`; iCumRate += 32;} // 0.97412481고급 마감용 실
					case(111){itemString = `id:60025 count:10`; iCumRate += 32;} // 0.97412481고급 가죽
					case(112){itemString = `id:60012 count:10`; iCumRate += 32;} // 0.97412481일반 실크
					case(113){itemString = `id:60016 count:10`; iCumRate += 32;} // 0.97412481일반 마감용 실
					case(114){itemString = `id:60020 count:10`; iCumRate += 32;} // 0.97412481일반 옷감
					case(115){itemString = `id:60024 count:10`; iCumRate += 32;} // 0.97412481일반 가죽
					case(116){itemString = `id:64002 count:10`; iCumRate += 32;} // 0.97412481철광석
					case(117){itemString = `id:64004 count:10`; iCumRate += 32;} // 0.97412481동광석
					case(118){itemString = `id:64006 count:10`; iCumRate += 32;} // 0.97412481은광석
					case(119){itemString = `id:64001 count:10`; iCumRate += 32;} // 0.97412481철괴
					case(120){itemString = `id:64003 count:10`; iCumRate += 32;} // 0.97412481동괴
					case(121){itemString = `id:64005 count:10`; iCumRate += 32;} // 0.97412481은괴
					case(122){itemString = `id:51102 count:10`; iCumRate += 32;} // 0.97412481마나 허브
					case(123){itemString = `id:51101 count:10`; iCumRate += 32;} // 0.97412481블러디 허브
					case(124){itemString = `id:51103 count:10`; iCumRate += 32;} // 0.97412481선라이트 허브
					case(125){itemString = `id:62003 count:5`; iCumRate += 32;} // 0.97412481축복받은 마법가루
					case(126){itemString = `id:63029 count:5`; iCumRate += 32;} // 0.97412481캠프파이어 키트
					case(127){itemString = `id:50006 count:5`; iCumRate += 32;} // 0.97412481고기 조각
					case(128){itemString = `id:40025`; iCumRate += 32;} // 0.97412481곡괭이
					case(129){itemString = `id:2001`; iCumRate += 32;} // 0.97412481금화주머니
					case(130){itemString = `id:40026`; iCumRate += 32;} // 0.97412481낫
					case(131){itemString = `id:40024`; iCumRate += 32;} // 0.97412481대장장이 망치
					case(132){itemString = `id:50203`; iCumRate += 32;} // 0.97412481레드 선라이즈
					case(133){itemString = `id:62004 count:5`; iCumRate += 32;} // 0.97412481마법가루
					case(134){itemString = `id:63027 expire:10080`; iCumRate += 32;} // 0.97412481밀랍 날개
					case(135){itemString = `id:45002 count:100`; iCumRate += 32;} // 0.97412481볼트
					case(136){itemString = `id:60005 count:10`; iCumRate += 32;} // 0.97412481붕대
					case(137){itemString = `id:50124 quality:80`; iCumRate += 32;} // 0.97412481비프 스테이크 80퀄리티
					case(138){itemString = `id:63020`; iCumRate += 32;} // 0.97412481빈 병
					case(139){itemString = `id:51001 count:10`; iCumRate += 32;} // 0.97412481생명력 10 포션
					case(140){itemString = `id:51022 count:5`; iCumRate += 32;} // 0.97412481생명력과 마나 30 포션
					case(141){itemString = `id:51027 count:5`; iCumRate += 32;} // 0.97412481생명력과 스태미나 30 포션
					case(142){itemString = `id:51028 count:3`; iCumRate += 32;} // 0.97412481생명력과 스태미나 50 포션
					case(143){itemString = `id:51011 count:10`; iCumRate += 32;} // 0.97412481스태미나 10 포션
					case(144){itemString = `id:40042`; iCumRate += 32;} // 0.97412481식칼
					case(145){itemString = `id:63019 count:50`; iCumRate += 32;} // 0.97412481알비 배틀 아레나 코인
					case(146){itemString = `id:63043 count:3`; iCumRate += 32;} // 0.97412481어드밴스드 깃털
					case(147){itemString = `id:63001`; iCumRate += 32;} // 0.97412481여신의 날개
					case(148){itemString = `id:40002`; iCumRate += 32;} // 0.97412481연습용 목도
					case(149){itemString = `id:51031 count:3`; iCumRate += 32;} // 0.97412481완전 회복의 포션
					case(150){itemString = `id:50014`; iCumRate += 32;} // 0.97412481왕감자
					case(151){itemString = `id:63026`; iCumRate += 32;} // 0.97412481원격 은행 이용권
					case(152){itemString = `id:63057`; iCumRate += 32;} // 0.97412481원격 의류 수리 이용권
					case(153){itemString = `id:63047`; iCumRate += 32;} // 0.97412481원격 힐러집 이용권
					case(154){itemString = `id:40023`; iCumRate += 32;} // 0.97412481채집용 단검
					case(155){itemString = `id:40022`; iCumRate += 32;} // 0.97412481채집용 도끼
					case(156){itemString = `id:63016 count:3`; iCumRate += 32;} // 0.97412481축복의 포션
					case(157){itemString = `id:63039 expire:10080`; iCumRate += 32;} // 0.97412481캠프 키트
					case(158){itemString = `id:63029 count:5`; iCumRate += 32;} // 0.97412481캠프파이어키트
					case(159){itemString = `id:50005`; iCumRate += 32;} // 0.97412481커다란 고기덩어리
					case(160){itemString = `id:2006`; iCumRate += 32;} // 0.97412481큰 금화주머니
					case(161){itemString = `id:50202`; iCumRate += 32;} // 0.97412481키스 온 더 립스
					case(162){itemString = `id:63044 count:3`; iCumRate += 32;} // 0.97412481파티 부활의 깃털
					case(163){itemString = `id:63000 count:3`; iCumRate += 32;} // 0.97412481피닉스의 깃털
					case(164){itemString = `id:40027`; iCumRate += 32;} // 0.97412481호미
					case(165){itemString = `id:45001 count:100`; iCumRate += 32;} // 0.97412481화살
					case(166){itemString = `id:63058`; iCumRate += 32;} // 0.97412481회복 속도 증가 포션
					case(167){itemString = `id:50201 quality:80`; iCumRate += 32;} // 0.97412481BnR 80퀄리티
					case(168){itemString = `id:50164 quality:80`; iCumRate += 32;} // 0.97412481T본 스테이크 80퀄리티
					case(169){itemString = `id:40004`; iCumRate += 32;} // 0.97412481류트
					case(170){itemString = `id:40018`; iCumRate += 32;} // 0.97412481우쿨렐레
					case(171){itemString = `id:40017`; iCumRate += 32;} // 0.97412481만돌린
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
					// 몬스터 소환
					GenerateMonster(player);
					}
					return;
				}
				++i;
			}
		}
		else
		{
			int iRandom		= Random(3335);			// 확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
						// 여기다 넣으세요
					case(0){itemString = `id:15269`; iCumRate +=1;} //0.029985007嫦娥的羽裳항아의 날개옷색갈 랜덤
					case(1){itemString = `id:18182`; iCumRate +=1;} //0.029985007嫦娥的发饰항아의 머리장식색갈 랜덤
					case(2){itemString = `id:15217 `; iCumRate +=1;} //0.029985007可爱的连衣裙에이프런 원피스
					case(3){itemString = `id:18161 `; iCumRate +=1;} //0.029985007Devcat耳套데브캣 귀마개
					case(4){itemString = `id:18157 `; iCumRate +=1;} //0.029985007猫爪发卡고양이 귀 머리띠
					case(5){itemString = `id:15233`; iCumRate +=1;} //0.029985007耶莱特高级连衣裙엘레건트 고딕 드레스
					case(6){itemString = `id:15234`; iCumRate +=1;} //0.029985007耶莱特高级套装엘레건트 고딕 슈트
					case(7){itemString = `id:15235`; iCumRate +=1;} //0.029985007耶莱特高级连衣裙엘레건트 고딕 드레스
					case(8){itemString = `id:15079`; iCumRate +=1;} //0.029985007精致小坎肩套裙볼레로 앤 점퍼 스커트색갈 랜덤
					case(9){itemString = `id:15222`; iCumRate +=1;} //0.029985007葛蕾丝长裙（女性用）그레이스 숄 드레스(여성용)색갈 랜덤
					case(10){itemString = `id:15204`; iCumRate +=1;} //0.029985007蒙戈和服（男）남성용 유카타색갈 랜덤
					case(11){itemString = `id:15225`; iCumRate +=1;} //0.029985007蒙戈和服（女）여성용 유카타색갈 랜덤
					case(12){itemString = `id:15224`; iCumRate +=1;} //0.029985007科尔和服（男）남성용 유카타색갈 랜덤
					case(13){itemString = `id:15203`; iCumRate +=1;} //0.029985007科尔和服（女）여성용 유카타색갈 랜덤
					case(14){itemString = `id:40170`; iCumRate +=1;} //0.029985007武士刀일본식 양손검색갈 랜덤
					case(15){itemString = `id:40095`; iCumRate +=2;} //0.059970015龙剑드래곤 블레이드금색
					case(16){itemString = `id:16046 `; iCumRate +=1;} //0.029985007猫手套고양이 손 장갑
					case(17){itemString = `id:18187 `; iCumRate +=1;} //0.029985007大蝴蝶结커다란 리본
					case(18){itemString = `id:18188 `; iCumRate +=1;} //0.029985007独眼眼罩안대
					case(19){itemString = `id:18189 `; iCumRate +=1;} //0.029985007牛仔帽카우보이 모자
					case(20){itemString = `id:40031`; iCumRate +=2;} //0.059970015弩석궁금색
					case(21){itemString = `id:40081`; iCumRate +=2;} //0.059970015皮制长弓레더 롱 보우금색
					case(22){itemString = `id:40172`; iCumRate +=2;} //0.059970015巨剑그레이트 소드금색
					case(23){itemString = `id:13038 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003德斯汀银武士铠甲더스틴 실버 나이트 아머오렌지색
					case(24){itemString = `id:14025 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003卡迈意念铠甲(男性用)카멜 스피리트 아머(남성용)오렌지색
					case(25){itemString = `id:14026 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003卡迈意念铠甲(女性用)카멜 스피리트 아머(여성용)오렌지색
					case(26){itemString = `id:13032 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)오렌지색
					case(27){itemString = `id:13033 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)오렌지색
					case(28){itemString = `id:13043 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)오렌지색
					case(29){itemString = `id:13044 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)오렌지색
					case(30){itemString = `id:13045 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)오렌지색
					case(31){itemString = `id:13046 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)오렌지색
					case(32){itemString = `id:14019 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003优美的金属铠甲그레이스 플레이트 아머오렌지색
					case(33){itemString = `id:18544 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003骑士金属头盔펠리칸 프로텍터오렌지색
					case(34){itemString = `id:18547 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003羽毛金属头盔파나쉬 헤드 프로텍터오렌지색
					case(35){itemString = `id:17040 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003骷髅金属头盔이블 다잉 크라운오렌지색
					case(36){itemString = `id:40033 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003神之刃双手剑클레이모어오렌지색
					case(37){itemString = `id:40039 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003冰箭魔杖아이스 원드오렌지색
					case(38){itemString = `id:40090 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003治疗魔杖힐링 원드오렌지색
					case(39){itemString = `id:40040 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003火箭魔杖파이어 원드오렌지색
					case(40){itemString = `id:40038 col1:FFFF66 col2:FFFF66 col3:FFFF66`; iCumRate +=4;} //0.11994003雷箭魔杖라이트닝 원드오렌지색
					case(41){itemString = `id:18113 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006尖耳小猫帽子뾰족귀 고양이 모자흰색
					case(42){itemString = `id:18114 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006猫脸小猫帽子줄무늬 고양이 모자흰색
					case(43){itemString = `id:18115 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006鱼型小猫帽子핀 고양이 모자흰색
					case(44){itemString = `id:18056 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006星星兔耳发箍1  (不可修理)별 토끼 머리띠1흰색
					case(45){itemString = `id:18057 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006星星兔耳发箍2  (不可修理)별 토끼 머리띠2흰색
					case(46){itemString = `id:18058 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006星星兔耳发箍3 (不可修理)별 토끼 머리띠3흰색
					case(47){itemString = `id:18059 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006星星兔耳发箍4 (不可修理)별 토끼 머리띠4흰색
					case(48){itemString = `id:18060 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006星星兔耳发箍5 (不可修理)별 토끼 머리띠5흰색
					case(49){itemString = `id:18061 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006毛绒兔耳发箍1  (不可修理)털 토끼 머리띠1흰색
					case(50){itemString = `id:18062 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006毛绒兔耳发箍2  (不可修理)털 토끼 머리띠2흰색
					case(51){itemString = `id:18063 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006毛绒兔耳发箍3  (不可修理)털 토끼 머리띠3흰색
					case(52){itemString = `id:18064 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006毛绒兔耳发箍4  (不可修理)털 토끼 머리띠4흰색
					case(53){itemString = `id:18065 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006毛绒兔耳发箍5  (不可修理)털 토끼 머리띠5흰색
					case(54){itemString = `id:18066 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006皮革兔耳发箍1  (不可修理)가죽 토끼 머리띠1흰색
					case(55){itemString = `id:18067 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006皮革兔耳发箍2  (不可修理)가죽 토끼 머리띠2흰색
					case(56){itemString = `id:18068 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006皮革兔耳发箍3 (不可修理)가죽 토끼 머리띠3흰색
					case(57){itemString = `id:18069 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006皮革兔耳发箍4 (不可修理)가죽 토끼 머리띠4흰색
					case(58){itemString = `id:18070 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006皮革兔耳发箍5 (不可修理)가죽 토끼 머리띠5흰색
					case(59){itemString = `id:18097 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连羽翼面具세이렌 깃털 가면흰색
					case(60){itemString = `id:18098 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连眼镜세이렌의 안경흰색
					case(61){itemString = `id:18099 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连小翅膀面具세이렌 작은 날개 가면흰색
					case(62){itemString = `id:18100 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连翅膀面具세이렌 날개 가면흰색
					case(63){itemString = `id:18101 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连蝙蝠面具세이렌 박쥐 날개 가면흰색
					case(64){itemString = `id:18102 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连面具세이렌의 가면흰색
					case(65){itemString = `id:15055 col1:ffffff col2:ffffff col3:ffffff`; iCumRate +=8;} //0.23988006赛连猫面具세이렌 고양이 가면흰색
					case(66){itemString = `id:13032`; iCumRate +=16;} //0.47976012巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)색갈 랜덤
					case(67){itemString = `id:13033`; iCumRate +=16;} //0.47976012巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)색갈 랜덤
					case(68){itemString = `id:13043`; iCumRate +=16;} //0.47976012蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)색갈 랜덤
					case(69){itemString = `id:13044`; iCumRate +=16;} //0.47976012蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)색갈 랜덤
					case(70){itemString = `id:13045`; iCumRate +=16;} //0.47976012艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)색갈 랜덤
					case(71){itemString = `id:13046`; iCumRate +=16;} //0.47976012艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)색갈 랜덤
					case(72){itemString = `id:14019`; iCumRate +=16;} //0.47976012优美的金属铠甲그레이스 플레이트 아머색갈 랜덤
					case(73){itemString = `id:13031`; iCumRate +=16;} //0.47976012银光金属盔甲스파이카 실버 플레이트 아머색갈 랜덤
					case(74){itemString = `id:13022`; iCumRate +=16;} //0.47976012硬皮甲 (P类型)로즈 플레이트 아머 (P타입)색갈 랜덤
					case(75){itemString = `id:40083`; iCumRate +=20;} //0.59970015钩状弯刀훅 커틀러스색갈 랜덤
					case(76){itemString = `id:40032`; iCumRate +=20;} //0.59970015翼魔剑가고일 소드색갈 랜덤
					case(77){itemString = `id:15066`; iCumRate +=20;} //0.59970015路易斯高级男装루이스 베스트 웨어색갈 랜덤
					case(78){itemString = `id:15065`; iCumRate +=20;} //0.59970015爱拉背心短裙엘라 베스트 스커트색갈 랜덤
					case(79){itemString = `id:15113`; iCumRate +=20;} //0.59970015女性用剑士学校校服短款여성용 검사학교 교복 쇼트타입색갈 랜덤
					case(80){itemString = `id:15114`; iCumRate +=20;} //0.59970015男性用剑士学校校服长款남성용 검사학교 교복 롱타입색갈 랜덤
					case(81){itemString = `id:15075`; iCumRate +=20;} //0.59970015萨丽娜连衣裙셀리나 레이디 드레스색갈 랜덤
					case(82){itemString = `id:15095`; iCumRate +=20;} //0.59970015萨丽娜皮夹克셀리나 오픈 레더 자켓색갈 랜덤
					case(83){itemString = `id:15096`; iCumRate +=20;} //0.59970015萨丽娜性感风格셀리나 섹시 베어룩색갈 랜덤
					case(84){itemString = `id:40100`; iCumRate +=20;} //0.59970015鱼骨剑본 마린 소드색갈 랜덤
					case(85){itemString = `id:40039`; iCumRate +=20;} //0.59970015冰箭魔杖아이스 원드색갈 랜덤
					case(86){itemString = `id:40090`; iCumRate +=20;} //0.59970015治疗魔杖힐링 원드색갈 랜덤
					case(87){itemString = `id:40040`; iCumRate +=20;} //0.59970015火箭魔杖파이어 원드색갈 랜덤
					case(88){itemString = `id:40038`; iCumRate +=20;} //0.59970015雷箭魔杖라이트닝 원드색갈 랜덤
					case(89){itemString = `id:18544`; iCumRate +=20;} //0.59970015骑士金属头盔펠리칸 프로텍터색갈 랜덤
					case(90){itemString = `id:18506`; iCumRate +=20;} //0.59970015翼盔윙 하프 헬름색갈 랜덤
					case(91){itemString = `id:18547`; iCumRate +=20;} //0.59970015羽毛金属头盔파나쉬 헤드 프로텍터색갈 랜덤
					case(92){itemString = `id:18521`; iCumRate +=20;} //0.59970015卫兵金属头盔유러피안 컴프색갈 랜덤
					case(93){itemString = `id:18500`; iCumRate +=20;} //0.59970015护颈头盔링 메일 헬름색갈 랜덤
					case(94){itemString = `id:17040`; iCumRate +=20;} //0.59970015骷髅金属头盔이블 다잉 크라운색갈 랜덤
					case(95){itemString = `id:18502`; iCumRate +=20;} //0.59970015骨头盔본 헬름색갈 랜덤
					case(96){itemString = `id:18511`; iCumRate +=20;} //0.59970015凹槽盔플루트 풀 헬름색갈 랜덤
					case(97){itemString = `id:15155`; iCumRate +=22;} //0.659670165Yidikai圣职者礼服(男性用)이디카이 성직자 예복(남성용)색갈 랜덤
					case(98){itemString = `id:15156`; iCumRate +=22;} //0.659670165Yidikai圣职者礼服(女性用)이디카이 성직자 예복(여성용)색갈 랜덤
					case(99){itemString = `id:15065`; iCumRate +=22;} //0.659670165爱拉背心短裙엘라 베스트 스커트색갈 랜덤
					case(100){itemString = `id:15135`; iCumRate +=22;} //0.659670165别致衣服시크 수트색갈 랜덤
					case(101){itemString = `id:15151`; iCumRate +=22;} //0.659670165纽约玛里奥收腰礼服(男性用)뉴욕마리오 웨이스트 테일러 웨어(남성용)색갈 랜덤
					case(102){itemString = `id:15152`; iCumRate +=22;} //0.659670165纽约玛里奥收腰礼服(女性用)뉴욕마리오 웨이스트 테일러 웨어(여성용)색갈 랜덤
					case(103){itemString = `id:15153`; iCumRate +=22;} //0.659670165桑德拉狙击手服(男性用)산드라 스나이퍼 수트(남성용)색갈 랜덤
					case(104){itemString = `id:15154`; iCumRate +=22;} //0.659670165桑德拉狙击手服(女性用)산드라 스나이퍼 수트(여성용)색갈 랜덤
					case(105){itemString = `id:15157`; iCumRate +=22;} //0.659670165威斯保卫军衣服(男性用)위스 보위군 의복(남성용)색갈 랜덤
					case(106){itemString = `id:15158`; iCumRate +=22;} //0.659670165威斯保卫军衣服(女性用)위스 보위군 의복(여성용)색갈 랜덤
					case(107){itemString = `id:19029`; iCumRate +=22;} //0.659670165자이언트 베어 로브색갈 랜덤
					case(108){itemString = `id:19007`; iCumRate +=22;} //0.659670165夜光长袍야광 머플러 로브색갈 랜덤
					case(109){itemString = `id:19017`; iCumRate +=22;} //0.659670165狼长袍늑대 로브색갈 랜덤
					case(110){itemString = `id:19016`; iCumRate +=22;} //0.659670165熊长袍곰 로브색갈 랜덤
					case(111){itemString = `id:15115`; iCumRate +=22;} //0.659670165不对称迷你裙子재기드 미니 스커트색갈 랜덤
					case(112){itemString = `id:15059`; iCumRate +=22;} //0.659670165吊带短裤터크스 탱크탑 반바지색갈 랜덤
					case(113){itemString = `id:15070`; iCumRate +=22;} //0.659670165科尔迷你裙아이돌 리본 드레스색갈 랜덤
					case(114){itemString = `id:19009`; iCumRate +=22;} //0.659670165可可兔子长袍코코 래빗 로브색갈 랜덤
					case(115){itemString = `id:19008`; iCumRate +=22;} //0.659670165可可熊猫长袍코코 판다 로브색갈 랜덤
					case(116){itemString = `id:15074`; iCumRate +=22;} //0.659670165路易斯牧师服루이스 성직자 코트색갈 랜덤
					case(117){itemString = `id:15061`; iCumRate +=22;} //0.659670165路易斯束腰服물결무늬 옆트임 튜닉색갈 랜덤
					case(118){itemString = `id:15137`; iCumRate +=22;} //0.659670165萨丽娜短夹克셀리나 하프 재킷 코트색갈 랜덤
					case(119){itemString = `id:15112`; iCumRate +=22;} //0.659670165萨丽娜校服셀리나 스쿨보이룩색갈 랜덤
					case(120){itemString = `id:18045`; iCumRate +=24;} //0.71964018星星法师帽별장식 마법사 모자색갈 랜덤
					case(121){itemString = `id:18041`; iCumRate +=24;} //0.71964018羽毛法师帽큰 챙 깃털 모자색갈 랜덤
					case(122){itemString = `id:18034`; iCumRate +=24;} //0.71964018科尔蓓蕾帽볼륨 베레모색갈 랜덤
					case(123){itemString = `id:18005`; iCumRate +=24;} //0.71964018蒙戈魔法帽子몬거 마법사모자색갈 랜덤
					case(124){itemString = `id:18006`; iCumRate +=24;} //0.71964018魔法师帽子마법사모자색갈 랜덤
					case(125){itemString = `id:18019`; iCumRate +=24;} //0.71964018丽琳羽毛帽子리리나 깃털모자색갈 랜덤
					case(126){itemString = `id:18020`; iCumRate +=24;} //0.71964018蒙戈羽毛帽子몬거 깃털모자색갈 랜덤
					case(127){itemString = `id:18113`; iCumRate +=24;} //0.71964018尖耳小猫帽子뾰족귀 고양이 모자색갈 랜덤
					case(128){itemString = `id:18114`; iCumRate +=24;} //0.71964018猫脸小猫帽子줄무늬 고양이 모자색갈 랜덤
					case(129){itemString = `id:18115`; iCumRate +=24;} //0.71964018鱼型小猫帽子핀 고양이 모자색갈 랜덤
					case(130){itemString = `id:18097`; iCumRate +=24;} //0.71964018赛连羽翼面具세이렌 깃털 가면색갈 랜덤
					case(131){itemString = `id:18098`; iCumRate +=24;} //0.71964018赛连眼镜세이렌의 안경색갈 랜덤
					case(132){itemString = `id:18099`; iCumRate +=24;} //0.71964018赛连小翅膀面具세이렌 작은 날개 가면색갈 랜덤
					case(133){itemString = `id:18100`; iCumRate +=24;} //0.71964018赛连翅膀面具세이렌 날개 가면색갈 랜덤
					case(134){itemString = `id:18101`; iCumRate +=24;} //0.71964018赛连蝙蝠面具세이렌 박쥐 날개 가면색갈 랜덤
					case(135){itemString = `id:18102`; iCumRate +=24;} //0.71964018赛连面具세이렌의 가면색갈 랜덤
					case(136){itemString = `id:15055`; iCumRate +=24;} //0.71964018赛连猫面具세이렌 고양이 가면색갈 랜덤
					case(137){itemString = `id:18044`; iCumRate +=24;} //0.71964018罪人用面具범죄용 복면색갈 랜덤
					case(138){itemString = `id:18112`; iCumRate +=24;} //0.71964018太阳伪装装饰해 분장 소품색갈 랜덤
					case(139){itemString = `id:18111`; iCumRate +=24;} //0.71964018树伪装装饰나무 분장 소품색갈 랜덤
					case(140){itemString = `id:18110`; iCumRate +=24;} //0.71964018草丛伪装装饰덤불 분장 소품색갈 랜덤
					case(141){itemString = `id:18109`; iCumRate +=24;} //0.71964018娜儿伪装装饰나오 분장 소품색갈 랜덤
					case(142){itemString = `id:18108`; iCumRate +=24;} //0.71964018岩石伪装装饰바위 분장 소품색갈 랜덤
					case(143){itemString = `id:18029`; iCumRate +=24;} //0.71964018带框眼镜나무테 안경색갈 랜덤
					case(144){itemString = `id:18028`; iCumRate +=24;} //0.71964018轻便眼镜접이식 안경색갈 랜덤
					case(145){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.089955022魔法释放卷轴-蜥蜴인챈트 스크롤
					case(146){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.089955022魔法释放卷轴-石南인챈트 스크롤
					case(147){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.089955022魔法释放卷轴-海盗的인챈트 스크롤
					case(148){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.089955022魔法释放卷轴-金针인챈트 스크롤
					case(149){itemString = `id:62005 prefix:20201`; iCumRate +=20;} //0.59970015魔法释放卷轴-坚固인챈트 스크롤
					case(150){itemString = `id:62005 suffix:30304`; iCumRate +=20;} //0.59970015魔法释放卷轴-灰狼인챈트 스크롤
					case(151){itemString = `id:62005 suffix:30702`; iCumRate +=20;} //0.59970015魔法释放卷轴-乌鸦인챈트 스크롤
					case(152){itemString = `id:62005 suffix:30704`; iCumRate +=20;} //0.59970015魔法释放卷轴-致命的인챈트 스크롤
					case(153){itemString = `id:62005 suffix:30801`; iCumRate +=20;} //0.59970015魔法释放卷轴-天然인챈트 스크롤
					case(154){itemString = `id:62005 suffix:30802`; iCumRate +=20;} //0.59970015魔法释放卷轴-反击인챈트 스크롤
					case(155){itemString = `id:62005 suffix:30803`; iCumRate +=20;} //0.59970015魔法释放卷轴-风车인챈트 스크롤
					case(156){itemString = `id:62005 suffix:30804`; iCumRate +=20;} //0.59970015魔法释放卷轴-重击인챈트 스크롤
					case(157){itemString = `id:62005 prefix:20405`; iCumRate +=20;} //0.59970015魔法释放卷轴-疯狂的인챈트 스크롤
					case(158){itemString = `id:62005 prefix:20501`; iCumRate +=20;} //0.59970015魔法释放卷轴-简单的인챈트 스크롤
					case(159){itemString = `id:62005 prefix:20602`; iCumRate +=20;} //0.59970015魔法释放卷轴-坚固的인챈트 스크롤
					case(160){itemString = `id:62005 prefix:20701`; iCumRate +=20;} //0.59970015魔法释放卷轴-猛烈的인챈트 스크롤
					case(161){itemString = `id:62005 suffix:30506`; iCumRate +=20;} //0.59970015魔法释放卷轴-可怕的인챈트 스크롤
					case(162){itemString = `id:62005 suffix:30614`; iCumRate +=20;} //0.59970015魔法释放卷轴-充满力量的인챈트 스크롤
					case(163){itemString = `id:62005 prefix:20108`; iCumRate +=20;} //0.59970015魔法释放卷轴-无翼鸟인챈트 스크롤
					case(164){itemString = `id:62005 prefix:20304`; iCumRate +=20;} //0.59970015魔法释放卷轴-鸵鸟인챈트 스크롤
					case(165){itemString = `id:62005 prefix:20505`; iCumRate +=20;} //0.59970015魔法释放卷轴-蜥蜴인챈트 스크롤
					case(166){itemString = `id:62005 prefix:20209`; iCumRate +=20;} //0.59970015魔法释放卷轴-猫鼬인챈트 스크롤
					case(167){itemString = `id:62005 prefix:20409`; iCumRate +=20;} //0.59970015魔法释放卷轴-沙漠狐인챈트 스크롤
					case(168){itemString = `id:62005 prefix:20615`; iCumRate +=20;} //0.59970015魔法释放卷轴-沙漠蜘蛛인챈트 스크롤
					case(169){itemString = `id:62005 prefix:20508`; iCumRate +=20;} //0.59970015魔法释放卷轴-可疑的인챈트 스크롤
					case(170){itemString = `id:62005 prefix:20618`; iCumRate +=20;} //0.59970015魔法释放卷轴-犹豫的인챈트 스크롤
					case(171){itemString = `id:62005 prefix:20718`; iCumRate +=20;} //0.59970015魔法释放卷轴-奇怪的인챈트 스크롤
					case(172){itemString = `id:62005 prefix:20212`; iCumRate +=20;} //0.59970015魔法释放卷轴-怪异的인챈트 스크롤
					case(173){itemString = `id:62005 prefix:20412`; iCumRate +=20;} //0.59970015魔法释放卷轴-奇异的인챈트 스크롤
					case(174){itemString = `id:62005 prefix:20619`; iCumRate +=20;} //0.59970015魔法释放卷轴-奇特的인챈트 스크롤
					case(175){itemString = `id:62005 suffix:30616`; iCumRate +=20;} //0.59970015魔法释放卷轴-冷淡的인챈트 스크롤
					case(176){itemString = `id:62005 suffix:30617`; iCumRate +=20;} //0.59970015魔法释放卷轴-无情的인챈트 스크롤
					case(177){itemString = `id:62005 suffix:30618`; iCumRate +=20;} //0.59970015魔法释放卷轴-悲惨的인챈트 스크롤
					case(178){itemString = `id:91034`; iCumRate +=60;} //1.79910045经验增加药水
					case(179){itemString = `id:40079`; iCumRate +=18;} //0.539730135权杖메이스색갈 랜덤
					case(180){itemString = `id:40011`; iCumRate +=18;} //0.539730135阔剑브로드 소드색갈 랜덤
					case(181){itemString = `id:40030`; iCumRate +=18;} //0.539730135双手剑투 핸디드 소드색갈 랜덤
					case(182){itemString = `id:40012`; iCumRate +=18;} //0.539730135变形剑바스타드 소드색갈 랜덤
					case(183){itemString = `id:40007`; iCumRate +=18;} //0.539730135单手斧한손도끼색갈 랜덤
					case(184){itemString = `id:40014`; iCumRate +=18;} //0.539730135复合弓콤포짓 보우색갈 랜덤
					case(185){itemString = `id:40078`; iCumRate +=18;} //0.539730135两刃斧비펜니스색갈 랜덤
					case(186){itemString = `id:40080`; iCumRate +=18;} //0.539730135罗马短剑글라디우스색갈 랜덤
					case(187){itemString = `id:40006`; iCumRate +=18;} //0.539730135匕首단검색갈 랜덤
					case(188){itemString = `id:40031`; iCumRate +=18;} //0.539730135弩석궁색갈 랜덤
					case(189){itemString = `id:40081`; iCumRate +=18;} //0.539730135皮制长弓레더 롱 보우색갈 랜덤
					case(190){itemString = `id:51003 count:10`; iCumRate +=16;} //0.47976012生命药水 50 点생명력 50 포션
					case(191){itemString = `id:51004 count:10`; iCumRate +=16;} //0.47976012生命药水 100 点생명력 100 포션
					case(192){itemString = `id:51007 count:10`; iCumRate +=16;} //0.47976012魔法药水 30 点마나 30 포션
					case(193){itemString = `id:51008 count:10`; iCumRate +=16;} //0.47976012魔法药水 50 点마나 50 포션
					case(194){itemString = `id:51013 count:10`; iCumRate +=16;} //0.47976012体力药水 50 点스태미나 50 포션
					case(195){itemString = `id:51014 count:10`; iCumRate +=16;} //0.47976012体力药水 100 点스태미나 100 포션
					case(196){itemString = `id:51001 count:10`; iCumRate +=16;} //0.47976012生命药水 10 点생명력 10 포션
					case(197){itemString = `id:51002 count:10`; iCumRate +=16;} //0.47976012生命药水 30 点생명력 30 포션
					case(198){itemString = `id:51022 count:10`; iCumRate +=16;} //0.47976012生命魔法药水 30 点생명력과 마나 30 포션
					case(199){itemString = `id:51027 count:10`; iCumRate +=16;} //0.47976012生命体力药水 30 点생명력과 스태미나 30 포션
					case(200){itemString = `id:51028 count:10`; iCumRate +=16;} //0.47976012生命体力药水 50 点생명력과 스태미나 50 포션
					case(201){itemString = `id:51029 count:10`; iCumRate +=16;} //0.47976012生命体力药水 100 点생명력과 스태미나 100 포션
					case(202){itemString = `id:63000 count:10`; iCumRate +=16;} //0.47976012凤凰羽毛피닉스의 깃털
					case(203){itemString = `id:60037 count:5`; iCumRate +=16;} //0.47976012黑色青春药水블랙 유스 포션
					case(204){itemString = `id:60038 count:5`; iCumRate +=16;} //0.47976012红色药水레드 포션
					case(205){itemString = `id:50012 count:5`; iCumRate +=16;} //0.47976012金鸡蛋황금 달걀
					case(206){itemString = `id:50013 count:5`; iCumRate +=16;} //0.47976012金苹果황금 사과
					case(207){itemString = `id:50541 quality:100`; iCumRate +=16;} //0.47976012意大利浓缩咖啡에스프레소
					case(208){itemString = `id:50542 quality:100`; iCumRate +=16;} //0.47976012意大利式泡沫牛奶에스프레소 마끼아또
					case(209){itemString = `id:50543 quality:100`; iCumRate +=16;} //0.47976012卡布奇诺카푸치노
					case(210){itemString = `id:50544 quality:100`; iCumRate +=16;} //0.47976012玛奇雅朵마끼아또
					case(211){itemString = `id:50545 quality:100`; iCumRate +=16;} //0.47976012摩卡咖啡카페 모카
					case(212){itemString = `id:50546 quality:100`; iCumRate +=16;} //0.47976012冰摩卡咖啡아이스 카페 모카
					case(213){itemString = `id:50547 quality:100`; iCumRate +=16;} //0.47976012冰玛奇雅朵아이스 마끼아또
					case(214){itemString = `id:50170 quality:100`; iCumRate +=16;} //0.47976012芝士酱치즈 퐁듀
					case(215){itemString = `id:50171 quality:100`; iCumRate +=16;} //0.47976012艾明玛恰红酒이멘 마하산 와인
					case(216){itemString = `id:50172 quality:100`; iCumRate +=16;} //0.47976012芝士蛋糕레어치즈 케익
					case(217){itemString = `id:50173 quality:100`; iCumRate +=16;} //0.47976012巧克力奶油蛋糕가토 오 쇼콜라
					case(218){itemString = `id:50174 quality:100`; iCumRate +=16;} //0.47976012火腿面包크로크 무슈
					case(219){itemString = `id:50175 quality:100`; iCumRate +=16;} //0.47976012核仁巧克力蛋糕브라우니
					case(220){itemString = `id:50176 quality:100`; iCumRate +=16;} //0.47976012奶油饼干버터 비스킷
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
					GiveTreasureChestItem(player,itemString,itemID);
					if (bUsePremiumKey)
					{
						GiveItemByPremiumKey(player, itemID);
					}
					if (bMonster)
					{
						// 몬스터 소환
						GenerateMonster(player);
					}
					return;
				}
				++i;
			}
		}
	}


	// 중국 보물상자 상시 진행용 ~ 동 상자
	else if (itemID == 91085)
	{
		bool bGameTreasureChest = false;
		bool bCashTreasureChest = false;

		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:63043 count:1`; iCumRate += 	6	; } //	어드밴스드 깃털
					case(	1	) { itemString = `id:63044 count:2`; iCumRate += 	6	; } //	파티 부활의 깃털
					case(	2	) { itemString = `id:63064 count:3`; iCumRate += 	10	; } //	하트 모양 불꽃놀이키트
					case(	3	) { itemString = `id:63025 count:1`; iCumRate += 	5	; } //	대용량 축복의 포션
					case(	4	) { itemString = `id:63026 count:2`; iCumRate += 	6	; } //	원격 은행 이용권
					case(	5	) { itemString = `id:63047 count:2`; iCumRate += 	6	; } //	원격 힐러집 이용권
					case(	6	) { itemString = `id:91002 count:2`; iCumRate += 	6	; } //	마나 부스트 포션
					case(	7	) { itemString = `id:91003 count:2`; iCumRate += 	8	; } //	스태미나 부스트 포션
					case(	8	) { itemString = `id:91004 count:2`; iCumRate += 	8	; } //	보호와 방어 부스트 포션
					case(	9	) { itemString = `id:91001 count:2`; iCumRate += 	8	; } //	생명력 부스트 포션
					case(	10	) { itemString = `id:63029 count:1`; iCumRate += 	11	; } //	캠프파이어 키트
					case(	11	) { itemString = `id:63074 count:2`; iCumRate += 	10	; } //	나오 불꽃 놀이 키트
					case(	12	) { itemString = `id:63074 count:2`; iCumRate += 	10	; } //	데브캣 불꽃놀이 키트
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
					GiveTreasureChestItem(player,itemString,itemID);
					bCashTreasureChest = true;
				}
				if (bCashTreasureChest)
				{
					break;
				}

				++i;
			}
		}
		{
			int iRandom = Random(4309);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40325 `; iCumRate +=1;} //0.023207241木制雷杖초보자 라이트닝 나무 원드
					case(1){itemString = `id:40292 `; iCumRate +=1;} //0.023207241水晶剑크리스탈 소드
					case(2){itemString = `id:17133 `; iCumRate +=1;} //0.023207241Alkaleido`s Stripe Fur Boots for Men스트라이프 털 부츠 (남성용)
					case(3){itemString = `id:17134 `; iCumRate +=1;} //0.023207241Alkaleido`s Stripe Fur Boots for Women스트라이프 털 부츠 (여성용)
					case(4){itemString = `id:15327 `; iCumRate +=1;} //0.023207241Alkaleido`s Stripe Fur Coat For men스트라이프 모피 코트
					case(5){itemString = `id:15328 `; iCumRate +=1;} //0.023207241Alkaleido`s Stripe Fur Dress for Women스트라이프 모피 드레스
					case(6){itemString = `id:40253 `; iCumRate +=1;} //0.023207241Quercus Fire Wand퀘르쿠스 파이어 원드
					case(7){itemString = `id:19045 `; iCumRate +=4;} //0.092828963Children's Day Robe For Man어린이날 기념 로브 (남성용)
					case(8){itemString = `id:19046 `; iCumRate +=4;} //0.092828963Children's Day Robe For woman어린이날 기념 로브 (여성용)
					case(9){itemString = `id:40249 `; iCumRate +=4;} //0.092828963Par Ice Wand파르 아이스 원드
					case(10){itemString = `id:40170 `; iCumRate +=3;} //0.069621722武士刀일본식 양손검
					case(11){itemString = `id:14039 `; iCumRate +=3;} //0.069621722东方龙铠（人类）차이나 드래곤 아머(인간)
					case(12){itemString = `id:14040 `; iCumRate +=3;} //0.069621722东方龙铠（精灵）차이나 드래곤 아머(엘프)
					case(13){itemString = `id:14041 `; iCumRate +=3;} //0.069621722东方龙铠（巨人）차이나 드래곤 아머(자이언트)
					case(14){itemString = `id:16532 `; iCumRate +=3;} //0.069621722东方龙护手（人类）차이나 드래곤 건틀렛(인간)
					case(15){itemString = `id:16535 `; iCumRate +=3;} //0.069621722东方龙护手（巨人）차이나 드래곤 건틀렛(자이언트)
					case(16){itemString = `id:16533 `; iCumRate +=3;} //0.069621722东方龙护手（精灵）차이나 드래곤 건틀렛(엘프)
					case(17){itemString = `id:17095 `; iCumRate +=3;} //0.069621722东方龙靴차이나 드래곤 부츠
					case(18){itemString = `id:18552 `; iCumRate +=3;} //0.069621722东方龙盔차이나 드래곤 헬름
					case(19){itemString = `id:13032 `; iCumRate +=2;} //0.046414481巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(20){itemString = `id:13033 `; iCumRate +=2;} //0.046414481巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(21){itemString = `id:13052 `; iCumRate +=2;} //0.046414481巴伦斯亚绚丽十字铠（巨人用）발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(22){itemString = `id:16521 `; iCumRate +=2;} //0.046414481巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(23){itemString = `id:17514 `; iCumRate +=2;} //0.046414481巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(24){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=4;} //0.092828963神之刃双手剑클레이모어
					case(25){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=4;} //0.092828963皮制长弓레더 롱 보우
					case(26){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963治疗魔杖힐링 원드
					case(27){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=4;} //0.092828963罗马短剑글라디우스
					case(28){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963雷箭魔杖라이트닝 원드
					case(29){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963冰箭魔杖아이스 원드
					case(30){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963火箭魔杖파이어 원드
					case(31){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963无属性魔杖타격용 원드
					case(32){itemString = `id:40078 durability:16000 durability_max:16000`; iCumRate +=4;} //0.092828963两刃斧비펜니스
					case(33){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=4;} //0.092828963权杖메이스
					case(34){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=4;} //0.092828963弩석궁
					case(35){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=4;} //0.092828963双手剑투 핸디드 소드
					case(36){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=4;} //0.092828963长弓롱 보우
					case(37){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=4;} //0.092828963守护之弓guardian bow
					case(38){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=4;} //0.092828963复合型燕型盾牌 헤테로 카이트 실드
					case(39){itemString = `id:62005 prefix:20201`; iCumRate +=30;} //0.69621722魔法释放卷轴-坚固인챈트 스크롤
					case(40){itemString = `id:62005 suffix:30304`; iCumRate +=30;} //0.69621722魔法释放卷轴-灰狼인챈트 스크롤
					case(41){itemString = `id:62005 suffix:30702`; iCumRate +=30;} //0.69621722魔法释放卷轴-乌鸦인챈트 스크롤
					case(42){itemString = `id:62005 suffix:30704`; iCumRate +=30;} //0.69621722魔法释放卷轴-致命的인챈트 스크롤
					case(43){itemString = `id:62005 suffix:30801`; iCumRate +=30;} //0.69621722魔法释放卷轴-天然인챈트 스크롤
					case(44){itemString = `id:62005 suffix:30802`; iCumRate +=30;} //0.69621722魔法释放卷轴-反击인챈트 스크롤
					case(45){itemString = `id:62005 suffix:30803`; iCumRate +=30;} //0.69621722魔法释放卷轴-风车인챈트 스크롤
					case(46){itemString = `id:62005 suffix:30804`; iCumRate +=30;} //0.69621722魔法释放卷轴-重击인챈트 스크롤
					case(47){itemString = `id:62005 prefix:20405`; iCumRate +=30;} //0.69621722魔法释放卷轴-疯狂的인챈트 스크롤
					case(48){itemString = `id:62005 prefix:20501`; iCumRate +=30;} //0.69621722魔法释放卷轴-简单的인챈트 스크롤
					case(49){itemString = `id:62005 prefix:20602`; iCumRate +=30;} //0.69621722魔法释放卷轴-坚固的인챈트 스크롤
					case(50){itemString = `id:62005 prefix:20701`; iCumRate +=30;} //0.69621722魔法释放卷轴-猛烈的인챈트 스크롤
					case(51){itemString = `id:62005 suffix:30506`; iCumRate +=30;} //0.69621722魔法释放卷轴-可怕的인챈트 스크롤
					case(52){itemString = `id:62005 suffix:30614`; iCumRate +=30;} //0.69621722魔法释放卷轴-充满力量的인챈트 스크롤
					case(53){itemString = `id:62005 prefix:20108`; iCumRate +=30;} //0.69621722魔法释放卷轴-无翼鸟인챈트 스크롤
					case(54){itemString = `id:62005 prefix:20304`; iCumRate +=30;} //0.69621722魔法释放卷轴-鸵鸟인챈트 스크롤
					case(55){itemString = `id:62005 prefix:20209`; iCumRate +=30;} //0.69621722魔法释放卷轴-猫鼬인챈트 스크롤
					case(56){itemString = `id:62005 prefix:20409`; iCumRate +=30;} //0.69621722魔法释放卷轴-沙漠狐인챈트 스크롤
					case(57){itemString = `id:62005 prefix:20615`; iCumRate +=30;} //0.69621722魔法释放卷轴-沙漠蜘蛛인챈트 스크롤
					case(58){itemString = `id:62005 prefix:20508`; iCumRate +=30;} //0.69621722魔法释放卷轴-可疑的인챈트 스크롤
					case(59){itemString = `id:62005 prefix:20618`; iCumRate +=30;} //0.69621722魔法释放卷轴-犹豫的인챈트 스크롤
					case(60){itemString = `id:62005 prefix:20718`; iCumRate +=30;} //0.69621722魔法释放卷轴-奇怪的인챈트 스크롤
					case(61){itemString = `id:62005 prefix:20212`; iCumRate +=30;} //0.69621722魔法释放卷轴-怪异的인챈트 스크롤
					case(62){itemString = `id:62005 prefix:20412`; iCumRate +=30;} //0.69621722魔法释放卷轴-奇异的인챈트 스크롤
					case(63){itemString = `id:62005 prefix:20619`; iCumRate +=30;} //0.69621722魔法释放卷轴-奇特的인챈트 스크롤
					case(64){itemString = `id:62005 suffix:30616`; iCumRate +=30;} //0.69621722魔法释放卷轴-冷淡的인챈트 스크롤
					case(65){itemString = `id:62005 suffix:30617`; iCumRate +=30;} //0.69621722魔法释放卷轴-无情的인챈트 스크롤
					case(66){itemString = `id:62005 suffix:30618`; iCumRate +=30;} //0.69621722魔法释放卷轴-悲惨的인챈트 스크롤
					case(67){itemString = `id:51003 count:10`; iCumRate +=200;} //4.641448132生命药水 50 点생명력 50 포션
					case(68){itemString = `id:51007 count:10`; iCumRate +=20;} //0.464144813魔法药水 30 点마나 30 포션
					case(69){itemString = `id:51008 count:10`; iCumRate +=200;} //4.641448132魔法药水 50 点마나 50 포션
					case(70){itemString = `id:51013 count:10`; iCumRate +=200;} //4.641448132体力药水 50 点스태미나 50 포션
					case(71){itemString = `id:51001 count:10`; iCumRate +=20;} //0.464144813生命药水 10 点생명력 10 포션
					case(72){itemString = `id:51002 count:10`; iCumRate +=20;} //0.464144813生命药水 30 点생명력 30 포션
					case(73){itemString = `id:51022 count:10`; iCumRate +=20;} //0.464144813生命魔法药水 30 点생명력과 마나 30 포션
					case(74){itemString = `id:51027 count:10`; iCumRate +=20;} //0.464144813生命体力药水 30 点생명력과 스태미나 30 포션
					case(75){itemString = `id:51028 count:10`; iCumRate +=200;} //4.641448132生命体力药水 50 点생명력과 스태미나 50 포션
					case(76){itemString = `id:63000 count:10`; iCumRate +=30;} //0.69621722凤凰羽毛피닉스의 깃털
					case(77){itemString = `id:60037 count:5`; iCumRate +=30;} //0.69621722黑色青春药水블랙 유스 포션
					case(78){itemString = `id:60038 count:5`; iCumRate +=30;} //0.69621722红色药水레드 포션
					case(79){itemString = `id:50012 count:5`; iCumRate +=30;} //0.69621722金鸡蛋황금 달걀
					case(80){itemString = `id:50013 count:5`; iCumRate +=30;} //0.69621722金苹果황금 사과
					case(81){itemString = `id:50541 quality:100`; iCumRate +=30;} //0.69621722意大利浓缩咖啡에스프레소
					case(82){itemString = `id:50542 quality:100`; iCumRate +=30;} //0.69621722意大利式泡沫牛奶에스프레소 마끼아또
					case(83){itemString = `id:50543 quality:100`; iCumRate +=30;} //0.69621722卡布奇诺카푸치노
					case(84){itemString = `id:50544 quality:100`; iCumRate +=30;} //0.69621722玛奇雅朵마끼아또
					case(85){itemString = `id:50545 quality:100`; iCumRate +=30;} //0.69621722摩卡咖啡카페 모카
					case(86){itemString = `id:50546 quality:100`; iCumRate +=30;} //0.69621722冰摩卡咖啡아이스 카페 모카
					case(87){itemString = `id:50547 quality:100`; iCumRate +=30;} //0.69621722冰玛奇雅朵아이스 마끼아또
					case(88){itemString = `id:50170 quality:100`; iCumRate +=30;} //0.69621722芝士酱치즈 퐁듀
					case(89){itemString = `id:50171 quality:100`; iCumRate +=30;} //0.69621722艾明玛恰红酒이멘 마하산 와인
					case(90){itemString = `id:50172 quality:100`; iCumRate +=30;} //0.69621722芝士蛋糕레어치즈 케익
					case(91){itemString = `id:50173 quality:100`; iCumRate +=30;} //0.69621722巧克力奶油蛋糕가토 오 쇼콜라
					case(92){itemString = `id:50174 quality:100`; iCumRate +=30;} //0.69621722火腿面包크로크 무슈
					case(93){itemString = `id:50175 quality:100`; iCumRate +=30;} //0.69621722核仁巧克力蛋糕브라우니
					case(94){itemString = `id:50176 quality:100`; iCumRate +=30;} //0.69621722奶油饼干버터 비스킷
					case(95){itemString = `id:18518 `; iCumRate +=5;} //0.116036203配龙金属头盔드래곤 크레스트
					case(96){itemString = `id:15113 `; iCumRate +=5;} //0.116036203女性用剑士学校校服短款여성용 검사학교 교복 쇼트타입
					case(97){itemString = `id:15114 `; iCumRate +=5;} //0.116036203男性用剑士学校校服长款남성용 검사학교 교복 롱타입
					case(98){itemString = `id:15065 `; iCumRate +=5;} //0.116036203爱拉背心短裙엘라 베스트 스커트
					case(99){itemString = `id:19008 `; iCumRate +=5;} //0.116036203可可熊猫长袍코코 판다 로브
					case(100){itemString = `id:15137 `; iCumRate +=5;} //0.116036203萨丽娜短夹克셀리나 하프 재킷 코트
					case(101){itemString = `id:18041 `; iCumRate +=5;} //0.116036203羽毛法师帽큰 챙 깃털 모자
					case(102){itemString = `id:19009 `; iCumRate +=5;} //0.116036203可可兔子长袍코코 래빗 로브
					case(103){itemString = `id:18112 `; iCumRate +=5;} //0.116036203太阳伪装装饰해 분장 소품
					case(104){itemString = `id:18111 `; iCumRate +=7;} //0.162450685树伪装装饰나무 분장 소품
					case(105){itemString = `id:18110 `; iCumRate +=7;} //0.162450685草丛伪装装饰덤불 분장 소품
					case(106){itemString = `id:18109 `; iCumRate +=7;} //0.162450685娜儿伪装装饰나오 분장 소품
					case(107){itemString = `id:18108 `; iCumRate +=7;} //0.162450685岩石伪装装饰바위 분장 소품
					case(108){itemString = `id:40083 `; iCumRate +=7;} //0.162450685钩状弯刀훅 커틀러스
					case(109){itemString = `id:40032 `; iCumRate +=7;} //0.162450685翼魔剑가고일 소드
					case(110){itemString = `id:18544 `; iCumRate +=7;} //0.162450685骑士金属头盔펠리칸 프로텍터
					case(111){itemString = `id:18547 `; iCumRate +=7;} //0.162450685羽毛金属头盔파나쉬 헤드 프로텍터
					case(112){itemString = `id:18521 `; iCumRate +=7;} //0.162450685卫兵金属头盔유러피안 컴프
					case(113){itemString = `id:18500 `; iCumRate +=7;} //0.162450685护颈头盔링 메일 헬름
					case(114){itemString = `id:18511 `; iCumRate +=7;} //0.162450685凹槽盔플루트 풀 헬름
					case(115){itemString = `id:18502 `; iCumRate +=7;} //0.162450685骨头盔본 헬름
					case(116){itemString = `id:19007 `; iCumRate +=7;} //0.162450685夜光长袍야광 머플러 로브
					case(117){itemString = `id:19017 `; iCumRate +=7;} //0.162450685狼长袍늑대 로브
					case(118){itemString = `id:19016 `; iCumRate +=7;} //0.162450685熊长袍곰 로브
					case(119){itemString = `id:15112 `; iCumRate +=7;} //0.162450685萨丽娜校服셀리나 스쿨보이룩
					case(120){itemString = `id:18034 `; iCumRate +=7;} //0.162450685科尔蓓蕾帽볼륨 베레모
					case(121){itemString = `id:18006 `; iCumRate +=7;} //0.162450685魔法师帽子마법사모자
					case(122){itemString = `id:18113 `; iCumRate +=7;} //0.162450685尖耳小猫帽子뾰족귀 고양이 모자
					case(123){itemString = `id:18114 `; iCumRate +=7;} //0.162450685猫脸小猫帽子줄무늬 고양이 모자
					case(124){itemString = `id:18115 `; iCumRate +=7;} //0.162450685鱼型小猫帽子핀 고양이 모자
					case(125){itemString = `id:18097 `; iCumRate +=7;} //0.162450685赛连羽翼面具세이렌 깃털 가면
					case(126){itemString = `id:18098 `; iCumRate +=7;} //0.162450685赛连眼镜세이렌의 안경
					case(127){itemString = `id:18099 `; iCumRate +=7;} //0.162450685赛连小翅膀面具세이렌 작은 날개 가면
					case(128){itemString = `id:18100 `; iCumRate +=7;} //0.162450685赛连翅膀面具세이렌 날개 가면
					case(129){itemString = `id:18101 `; iCumRate +=7;} //0.162450685赛连蝙蝠面具세이렌 박쥐 날개 가면
					case(130){itemString = `id:18102 `; iCumRate +=7;} //0.162450685赛连面具세이렌의 가면
					case(131){itemString = `id:15055 `; iCumRate +=7;} //0.162450685赛连猫面具세이렌 고양이 가면
					case(132){itemString = `id:18044 `; iCumRate +=7;} //0.162450685罪人用面具범죄용 복면
					case(133){itemString = `id:40071 `; iCumRate +=10;} //0.232072407‘拉’音瓶'라' 음 빈 병
					case(134){itemString = `id:40072 `; iCumRate +=10;} //0.232072407‘西’音瓶'시' 음 빈 병
					case(135){itemString = `id:40073 `; iCumRate +=10;} //0.232072407‘哆’音瓶'도' 음 빈 병
					case(136){itemString = `id:40074 `; iCumRate +=10;} //0.232072407‘来’音瓶'레' 음 빈 병
					case(137){itemString = `id:40075 `; iCumRate +=10;} //0.232072407‘咪’音瓶'미' 음 빈 병
					case(138){itemString = `id:40076 `; iCumRate +=10;} //0.232072407‘发’音瓶'파' 음 빈 병
					case(139){itemString = `id:40077 `; iCumRate +=10;} //0.232072407‘嗦’音瓶'솔' 음 빈 병
					case(140){itemString = `id:16517 `; iCumRate +=10;} //0.232072407反对手套반대 장갑
					case(141){itemString = `id:16516 `; iCumRate +=10;} //0.232072407赞成手套찬성 장갑
					case(142){itemString = `id:16515 `; iCumRate +=10;} //0.232072407布手套보 장갑
					case(143){itemString = `id:16514 `; iCumRate +=10;} //0.232072407石头手套바위 장갑
					case(144){itemString = `id:16513 `; iCumRate +=10;} //0.232072407剪子手套가위 장갑
					case(145){itemString = `id:40068 `; iCumRate +=10;} //0.232072407剪刀拳가위 모양 지시봉
					case(146){itemString = `id:40069 `; iCumRate +=10;} //0.232072407石头拳바위 모양 지시봉
					case(147){itemString = `id:40070 `; iCumRate +=10;} //0.232072407布型指挥棒보 모양 지시봉
					case(148){itemString = `id:17015 `; iCumRate +=5;} //0.116036203格斗靴Combat Shoes
					case(149){itemString = `id:15055 `; iCumRate +=5;} //0.116036203星星迷你裙레더 미니 원피스
					case(150){itemString = `id:15057 `; iCumRate +=5;} //0.116036203无光皮外套롱 레더 코트 (무광)
					case(151){itemString = `id:14036 `; iCumRate +=5;} //0.116036203迪奥斯铠甲(男性用)티오즈 아머(남성용)
					case(152){itemString = `id:14037 `; iCumRate +=5;} //0.116036203迪奥斯铠甲(女性用)티오즈 아머(여성용)
					case(153){itemString = `id:16531 `; iCumRate +=5;} //0.116036203迪奥斯手套티오즈 건틀렛
					case(154){itemString = `id:17523 `; iCumRate +=5;} //0.116036203迪奥斯长靴티오즈 그리브
					case(155){itemString = `id:15132 `; iCumRate +=5;} //0.116036203天然高级男装내추럴 베스트 웨어
					case(156){itemString = `id:15070 `; iCumRate +=5;} //0.116036203路易斯猎人服스탠드칼라 슬리브리스
					case(157){itemString = `id:15230 `; iCumRate +=5;} //0.116036203格伦达短裙가르텐 글렌 체크 스커트
					case(158){itemString = `id:19034 `; iCumRate +=5;} //0.116036203精致羽毛长袍가르텐 클로스 오버코트
					case(159){itemString = `id:40033 `; iCumRate +=5;} //0.116036203神之刃双手剑클레이모어
					case(160){itemString = `id:40011 `; iCumRate +=15;} //0.34810861阔剑브로드 소드
					case(161){itemString = `id:40030 `; iCumRate +=15;} //0.34810861双手剑투 핸디드 소드
					case(162){itemString = `id:40012 `; iCumRate +=15;} //0.34810861变形剑바스타드 소드
					case(163){itemString = `id:40007 `; iCumRate +=15;} //0.34810861单手斧한손도끼
					case(164){itemString = `id:40014 `; iCumRate +=15;} //0.34810861复合弓콤포짓 보우
					case(165){itemString = `id:40078 `; iCumRate +=15;} //0.34810861两刃斧비펜니스
					case(166){itemString = `id:40080 `; iCumRate +=15;} //0.34810861罗马短剑글라디우스
					case(167){itemString = `id:40006 `; iCumRate +=15;} //0.34810861匕首단검
					case(168){itemString = `id:40031 `; iCumRate +=15;} //0.34810861弩석궁
					case(169){itemString = `id:40081 `; iCumRate +=15;} //0.34810861皮制长弓레더 롱 보우
					case(170){itemString = `id:40079 `; iCumRate +=15;} //0.34810861权杖메이스
					case(171){itemString = `id:13043 `; iCumRate +=5;} //0.116036203蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)
					case(172){itemString = `id:13044 `; iCumRate +=5;} //0.116036203蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)
					case(173){itemString = `id:13045 `; iCumRate +=5;} //0.116036203艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)
					case(174){itemString = `id:13046 `; iCumRate +=5;} //0.116036203艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)
					case(175){itemString = `id:14019 `; iCumRate +=5;} //0.116036203优美的金属铠甲그레이스 플레이트 아머
					case(176){itemString = `id:13031 `; iCumRate +=5;} //0.116036203银光金属盔甲스파이카 실버 플레이트 아머
					case(177){itemString = `id:13022 `; iCumRate +=5;} //0.116036203硬皮甲 (P类型)로즈 플레이트 아머 (P타입)
					case(178){itemString = `id:40039 `; iCumRate +=15;} //0.34810861冰箭魔杖아이스 원드
					case(179){itemString = `id:40090 `; iCumRate +=15;} //0.34810861治疗魔杖힐링 원드
					case(180){itemString = `id:40040 `; iCumRate +=15;} //0.34810861火箭魔杖파이어 원드
					case(181){itemString = `id:40038 `; iCumRate +=15;} //0.34810861雷箭魔杖라이트닝 원드
					case(182){itemString = `id:18542 `; iCumRate +=5;} //0.116036203巨链盔빅 체인 풀 헬름
					case(183){itemString = `id:18506 `; iCumRate +=5;} //0.116036203翼盔윙 하프 헬름
					case(184){itemString = `id:14042 `; iCumRate +=5;} //0.116036203凯斯汀皮革铠甲컬스틴 레더 아머
					case(185){itemString = `id:15155 `; iCumRate +=15;} //0.34810861Yidikai圣职者礼服(男性用)이디카이 성직자 예복(남성용)
					case(186){itemString = `id:15156 `; iCumRate +=15;} //0.34810861Yidikai圣职者礼服(女性用)이디카이 성직자 예복(여성용)
					case(187){itemString = `id:15151 `; iCumRate +=15;} //0.34810861纽约玛里奥收腰礼服(男性用)뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(188){itemString = `id:15152 `; iCumRate +=15;} //0.34810861纽约玛里奥收腰礼服(女性用)뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(189){itemString = `id:15153 `; iCumRate +=15;} //0.34810861桑德拉狙击手服(男性用)산드라 스나이퍼 수트(남성용)
					case(190){itemString = `id:15154 `; iCumRate +=15;} //0.34810861桑德拉狙击手服(女性用)산드라 스나이퍼 수트(여성용)
					case(191){itemString = `id:15157 `; iCumRate +=15;} //0.34810861威斯保卫军衣服(男性用)위스 보위군 의복(남성용)
					case(192){itemString = `id:15158 `; iCumRate +=15;} //0.34810861威斯保卫军衣服(女性用)위스 보위군 의복(여성용)
					case(193){itemString = `id:15115 `; iCumRate +=15;} //0.34810861不对称迷你裙子재기드 미니 스커트
					case(194){itemString = `id:15059 `; iCumRate +=15;} //0.34810861吊带短裤터크스 탱크탑 반바지
					case(195){itemString = `id:15070 `; iCumRate +=15;} //0.34810861科尔迷你裙아이돌 리본 드레스
					case(196){itemString = `id:15074 `; iCumRate +=15;} //0.34810861路易斯牧师服루이스 성직자 코트
					case(197){itemString = `id:15061 `; iCumRate +=15;} //0.34810861路易斯束腰服물결무늬 옆트임 튜닉
					case(198){itemString = `id:18045 `; iCumRate +=5;} //0.116036203星星法师帽별장식 마법사 모자
					case(199){itemString = `id:18019 `; iCumRate +=15;} //0.34810861丽琳羽毛帽子리리나 깃털모자
					case(200){itemString = `id:18020 `; iCumRate +=15;} //0.34810861蒙戈羽毛帽子몬거 깃털모자
					case(201){itemString = `id:18029 `; iCumRate +=15;} //0.34810861带框眼镜나무테 안경
					case(202){itemString = `id:18028 `; iCumRate +=15;} //0.34810861轻便眼镜접이식 안경
					case(203){itemString = `id:16500 `; iCumRate +=15;} //0.34810861保护手套울나 프로텍터 글러브
					case(204){itemString = `id:40053 `; iCumRate +=15;} //0.34810861一束紫色玫瑰보라빛 장미 꽃다발
					case(205){itemString = `id:40054 `; iCumRate +=15;} //0.34810861一朵紫色玫瑰보라빛 장미 한송이
					case(206){itemString = `id:18089 `; iCumRate +=15;} //0.34810861紫玫瑰花装饰보라빛 장미 장식
					case(207){itemString = `id:40052 `; iCumRate +=15;} //0.34810861一朵蓝色玫瑰파란 장미 한송이
					case(208){itemString = `id:18090 `; iCumRate +=15;} //0.34810861蓝玫瑰花装饰파란 장미 장식
					case(209){itemString = `id:18086 `; iCumRate +=15;} //0.34810861雏菊花装饰데이지 꽃 장식
					case(210){itemString = `id:18087 `; iCumRate +=15;} //0.34810861玫瑰花装饰장미 꽃 장식
					case(211){itemString = `id:13010 `; iCumRate +=5;} //0.116036203圆形链甲라운드 폴드론 체인메일
					case(212){itemString = `id:14025 `; iCumRate +=5;} //0.116036203卡迈意念铠甲(男性用)카멜 스피리트 아머(남성용)
					case(213){itemString = `id:14026 `; iCumRate +=5;} //0.116036203卡迈意念铠甲(女性用)카멜 스피리트 아머(여성용)
					case(214){itemString = `id:16028 `; iCumRate +=5;} //0.116036203卡迈意念手套카멜 스피리트 글러브
					case(215){itemString = `id:16511 `; iCumRate +=5;} //0.116036203银光手套실버 티니 글러브
					case(216){itemString = `id:17064 `; iCumRate +=5;} //0.116036203卡迈意念靴子카멜 스피리트 부츠
					case(217){itemString = `id:15131 `; iCumRate +=15;} //0.34810861蕾丝吊带裙핀 에이프런 스커트
					case(218){itemString = `id:2006 `; iCumRate +=15;} //0.34810861大金币囊큰 금화 주머니
					case(219){itemString = `id:16534 `; iCumRate +=5;} //0.116036203凯斯汀皮革护手컬스틴 레더 건틀렛
					case(220){itemString = `id:17524 `; iCumRate +=5;} //0.116036203凯斯汀皮革鞋컬스틴 레더 부츠
					case(221){itemString = `id:13047 `; iCumRate +=5;} //0.116036203凯利诺斯金属铠甲(男性用)키리누스진 하프 플레이트 아머(남성용)
					case(222){itemString = `id:13048 `; iCumRate +=5;} //0.116036203凯利诺斯金属铠甲(女性用)키리누스진 하프 플레이트 아머(여성용)
					case(223){itemString = `id:14013 `; iCumRate +=10;} //0.232072407古罗马胸甲로리카 세그먼타타에
					case(224){itemString = `id:14035`; iCumRate +=10;} //0.232072407佩乐皮革盔甲피르타 레더 아머
					case(225){itemString = `id:14038 `; iCumRate +=5;} //0.116036203雪原银铠甲B类型(女性用)피르타 레더 아머 B타입(여성용)
					case(226){itemString = `id:15014 `; iCumRate +=15;} //0.34810861使者衣파발꾼의 옷
					case(227){itemString = `id:15028 `; iCumRate +=15;} //0.34810861科尔盗贼服코레스 씨프슈트
					case(228){itemString = `id:15042 `; iCumRate +=15;} //0.34810861高领子连衣裙롱넥 원피스
					case(229){itemString = `id:15052 `; iCumRate +=15;} //0.34810861男性束腰装터크스 투톤 튜닉
					case(230){itemString = `id:15053 `; iCumRate +=15;} //0.34810861贵妇装플랫칼라 원피스
					case(231){itemString = `id:15128 `; iCumRate +=15;} //0.34810861魔法淑女裙투 톤 비조 드레스
					case(232){itemString = `id:15136 `; iCumRate +=15;} //0.34810861冒险家正装모험가 슈트
					case(233){itemString = `id:16008 `; iCumRate +=15;} //0.34810861科尔盗贼手套코레스 씨프 글러브
					case(234){itemString = `id:16019 `; iCumRate +=15;} //0.34810861丽琳护手줄무늬 팔목 장갑
					case(235){itemString = `id:16040 `; iCumRate +=15;} //0.34810861肯林白狐皮手套콜린 빅센 글러브
					case(236){itemString = `id:16505 `; iCumRate +=15;} //0.34810861长凹槽手套플루트 건틀렛
					case(237){itemString = `id:16520 `; iCumRate +=15;} //0.34810861长红色皮手套롱 레더 글러브
					case(238){itemString = `id:17040 `; iCumRate +=15;} //0.34810861爱拉系带靴엘라 스트랩 부츠
					case(239){itemString = `id:17041 `; iCumRate +=15;} //0.34810861路易斯高筒靴덩굴무늬 헌팅부츠
					case(240){itemString = `id:17045 `; iCumRate +=15;} //0.34810861帅气长靴브이 넥 라인 레더 부츠
					case(241){itemString = `id:17071 `; iCumRate +=15;} //0.34810861倪哈儿靴子니하이 부츠
					case(242){itemString = `id:17087 `; iCumRate +=15;} //0.34810861肯林白狐皮靴콜린 빅센 부츠
					case(243){itemString = `id:17506 `; iCumRate +=15;} //0.34810861长护胫靴롱그리브 부츠
					case(244){itemString = `id:17522 `; iCumRate +=15;} //0.34810861佩尔皮靴피르타 레더 부츠
					case(245){itemString = `id:18008 `; iCumRate +=15;} //0.34810861条纹帽스트라이프 캡
					case(246){itemString = `id:18023 `; iCumRate +=15;} //0.34810861蒙戈盗贼帽子몬거 씨프 캡
					case(247){itemString = `id:18038 `; iCumRate +=15;} //0.34810861路易斯卫兵帽깃털 배렛 모자
					case(248){itemString = `id:18047 `; iCumRate +=15;} //0.34810861科尔花边帽코레스 펠트 모자
					case(249){itemString = `id:18513 `; iCumRate +=15;} //0.34810861铁钉盔스파이크 캡
					case(250){itemString = `id:18515 `; iCumRate +=15;} //0.34810861牛角金属头盔트윈 혼 캡
					case(251){itemString = `id:18525 `; iCumRate +=15;} //0.34810861水滴金属头盔워터드롭 캡
					case(252){itemString = `id:18543 `; iCumRate +=15;} //0.34810861完整的铁盔슬릿 풀 헬름
					case(253){itemString = `id:19020 `; iCumRate +=15;} //0.34810861娜塔内雪山用外套나타네 설산용 코트
					case(254){itemString = `id:19029 `; iCumRate +=15;} //0.34810861巨人贝尔长袍자이언트 베어 로브
					case(255){itemString = `id:40015 `; iCumRate +=15;} //0.34810861带凹槽的短剑플루트 숏 소드
					case(256){itemString = `id:40081 `; iCumRate +=15;} //0.34810861长弓롱 보우
					case(257){itemString = `id:46001 `; iCumRate +=15;} //0.34810861圆盾라운드 실드
					case(258){itemString = `id:46006 `; iCumRate +=15;} //0.34810861燕型盾牌카이트 실드
					case(259){itemString = `id:40172 `; iCumRate +=15;} //0.34810861巨剑그레이트 소드
					case(260){itemString = `id:40174 `; iCumRate +=15;} //0.34810861钉锤모닝스타
					case(261){itemString = `id:40177 `; iCumRate +=15;} //0.34810861长柄巨斧워리어 액스
					case(262){itemString = `id:40180 `; iCumRate +=15;} //0.34810861圆锥拳套홉네일 너클
					case(263){itemString = `id:40041 `; iCumRate +=15;} //0.34810861打击用魔杖타격용 원드
					case(264){itemString = `id:40010 `; iCumRate +=15;} //0.34810861长剑롱 소드
					case(265){itemString = `id:40002 `; iCumRate +=15;} //0.34810861木剑연습용 목도
					case(266){itemString = `id:16523 `; iCumRate +=15;} //0.34810861优美的手套그레이스 건틀렛
					case(267){itemString = `id:17515 `; iCumRate +=15;} //0.34810861优美的护胫그레이스 그리브
					case(268){itemString = `id:18545 `; iCumRate +=15;} //0.34810861优美的头盔그레이스 헬멧
					case(269){itemString = `id:46012 `; iCumRate +=5;} //0.116036203青铜盾牌청동 방패
					case(270){itemString = `id:46008 `; iCumRate +=15;} //0.34810861廉价复合型燕型盾牌라이트 헤테로 카이트 실드
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
					GiveTreasureChestItem(player,itemString,itemID);
					bGameTreasureChest = true;
				}
				if(bGameTreasureChest)
				{
					break;
				}

				++i;
			}
		}
	}

	// 중국 보물상자 상시 진행용 ~ 은 상자
	else if (itemID == 91083)
	{
		bool bGameTreasureChest = false;
		bool bCashTreasureChest = false;
		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:63043 count:2`; iCumRate += 	7	; } //	어드밴스드 깃털
					case(	1	) { itemString = `id:63044 count:4`; iCumRate += 	4	; } //	파티 부활의 깃털
					case(	2	) { itemString = `id:51031 count:3`; iCumRate += 	4	; } //	완전 회복의 포션
					case(	3	) { itemString = `id:63064 count:4`; iCumRate += 	4	; } //	하트 모양 불꽃놀이키트
					case(	4	) { itemString = `id:63025 count:2`; iCumRate += 	4	; } //	대용량 축복의 포션
					case(	5	) { itemString = `id:91005 count:1`; iCumRate += 	8	; } //	전투력 약화 포션
					case(	6	) { itemString = `id:63026 count:4`; iCumRate += 	5	; } //	원격 은행 이용권
					case(	7	) { itemString = `id:63047 count:4`; iCumRate += 	5	; } //	원격 힐러집 이용권
					case(	8	) { itemString = `id:63024 expire:10080 count:1`; iCumRate += 	3	; } //	염색 앰플
					case(	9	) { itemString = `id:91002 count:4`; iCumRate += 	4	; } //	마나 부스트 포션
					case(	10	) { itemString = `id:91003 count:4`; iCumRate += 	4	; } //	스태미나 부스트 포션
					case(	11	) { itemString = `id:91004 count:4`; iCumRate += 	4	; } //	보호와 방어 부스트 포션
					case(	12	) { itemString = `id:91001 count:4`; iCumRate += 	4	; } //	생명력 부스트 포션
					case(	13	) { itemString = `id:63029 count:2`; iCumRate += 	7	; } //	캠프파이어 키트
					case(	14	) { itemString = `id:91007 count:1`; iCumRate += 	8	; } //	17살의 키가 되는 포션
					case(	15	) { itemString = `id:91006 count:1`; iCumRate += 	8	; } //	10살의 키가 되는 포션
					case(	16	) { itemString = `id:63074 count:4`; iCumRate += 	4	; } //	나오 불꽃 놀이 키트
					case(	17	) { itemString = `id:63074 count:4`; iCumRate += 	4	; } //	데브캣 불꽃놀이 키트
					case(	18	) { itemString = `id:91066 count:1`; iCumRate += 	3	; } //	정령무기 수리 포션 1~5
					case(	19	) { itemString = `id:91059 count:1`; iCumRate += 	3	; } //	펫 체형 변화 포션 1살
					case(	20	) { itemString = `id:91063 count:1`; iCumRate += 	3	; } //	펫 체형 변화 포션 5살
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
					GiveTreasureChestItem(player,itemString,itemID);
					bCashTreasureChest = true;
				}
				if (bCashTreasureChest)
				{
					break;
				}

				++i;
			}
		}
		{
			int iRandom = Random(8450);			// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40352 `; iCumRate +=2;} //0.023668639Soft Ice Cream Short Sword소프트 아이스 크림 숏소드
					case(1){itemString = `id:40353 `; iCumRate +=2;} //0.023668639爆竹形弓폭죽형 활
					case(2){itemString = `id:40354 `; iCumRate +=2;} //0.023668639元宵剑경단 소드
					case(3){itemString = `id:40355 `; iCumRate +=2;} //0.023668639星星糖权杖별 사탕 메이스
					case(4){itemString = `id:46028 `; iCumRate +=2;} //0.023668639曲奇盾牌쿠키 방패
					case(5){itemString = `id:18305 `; iCumRate +=2;} //0.023668639炸面圈眼镜도넛 안경
					case(6){itemString = `id:15452 `; iCumRate +=1;} //0.01183432女式泳衣여성용 수영복
					case(7){itemString = `id:15453 `; iCumRate +=1;} //0.01183432男式泳衣남성용 수영복
					case(8){itemString = `id:18199 `; iCumRate +=1;} //0.01183432薄框眼镜얇은테 안경
					case(9){itemString = `id:40959 `; iCumRate +=1;} //0.01183432黑耀石剑흑요석 검
					case(10){itemString = `id:40958 `; iCumRate +=1;} //0.01183432水晶弓유리 활
					case(11){itemString = `id:40960 `; iCumRate +=1;} //0.01183432猫手铃铛棒(Cat Hand Club)고양이 손 방울 몽둥이
					case(12){itemString = `id:18568 `; iCumRate +=1;} //0.01183432柚子帽(Citron Cap)유자 모자
					case(13){itemString = `id:19048 `; iCumRate +=2;} //0.023668639Makadia`s Puppet Robe광대 로브
					case(14){itemString = `id:40254 `; iCumRate +=2;} //0.023668639Metal Ice Wand메탈 아이스 원드
					case(15){itemString = `id:19049 `; iCumRate +=3;} //0.035502959Natane Thrush Line Robe스라스 라인 로브 (남성용)
					case(16){itemString = `id:19050 `; iCumRate +=3;} //0.035502959Natane Thrush Line Robe스라스 라인 로브 (여성용)
					case(17){itemString = `id:40251 `; iCumRate +=3;} //0.035502959Carpinus Healing Wand칼피누스 힐링원드
					case(18){itemString = `id:40255 `; iCumRate +=2;} //0.023668639Panacea Healing Wand파나케아 힐링 원드
					case(19){itemString = `id:40248 `; iCumRate +=1;} //0.01183432Metal Lightning Wand메탈 라이트닝 원드
					case(20){itemString = `id:17527 `; iCumRate +=1;} //0.01183432丛林刺针护胫basil gimlet Greave
					case(21){itemString = `id:13051 `; iCumRate +=1;} //0.01183432丛林刺针盔甲basil gimlet armor
					case(22){itemString = `id:16538 `; iCumRate +=1;} //0.01183432丛林刺针手套basil gimlet Gauntlet
					case(23){itemString = `id:40170 `; iCumRate +=1;} //0.01183432武士刀일본식 양손검
					case(24){itemString = `id:14039 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙铠（人类）차이나 드래곤 아머(인간)
					case(25){itemString = `id:14040 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙铠（精灵）차이나 드래곤 아머(엘프)
					case(26){itemString = `id:14041 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙铠（巨人）차이나 드래곤 아머(자이언트)
					case(27){itemString = `id:16532 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙护手（人类）차이나 드래곤 건틀렛(인간)
					case(28){itemString = `id:16535 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙护手（巨人）차이나 드래곤 건틀렛(자이언트)
					case(29){itemString = `id:16533 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙护手（精灵）차이나 드래곤 건틀렛(엘프)
					case(30){itemString = `id:17095 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙靴차이나 드래곤 부츠
					case(31){itemString = `id:18552 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639东方龙盔차이나 드래곤 헬름
					case(32){itemString = `id:13038 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=1;} //0.01183432德斯汀银武士铠甲더스틴 실버 나이트 아머
					case(33){itemString = `id:16524 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=1;} //0.01183432德斯汀银武士全臂铠甲더스틴 실버 나이트 뱀브레이스
					case(34){itemString = `id:17517 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=1;} //0.01183432德斯汀银武士护胫더스틴 실버 나이트 그리브
					case(35){itemString = `id:13032 prefix:21006`; iCumRate +=1;} //0.01183432巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(36){itemString = `id:13033 prefix:21006`; iCumRate +=1;} //0.01183432巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(37){itemString = `id:13052 prefix:21006`; iCumRate +=2;} //0.023668639巴伦斯亚绚丽十字铠（巨人用）발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(38){itemString = `id:16521 prefix:20625`; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(39){itemString = `id:17514 prefix:20625`; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(40){itemString = `id:14039 `; iCumRate +=2;} //0.023668639东方龙铠（人类）차이나 드래곤 아머(인간)
					case(41){itemString = `id:14040 `; iCumRate +=2;} //0.023668639东方龙铠（精灵）차이나 드래곤 아머(엘프)
					case(42){itemString = `id:14041 `; iCumRate +=2;} //0.023668639东方龙铠（巨人）차이나 드래곤 아머(자이언트)
					case(43){itemString = `id:16532 `; iCumRate +=3;} //0.035502959东方龙护手（人类/巨人）차이나 드래곤 건틀렛(인간/자이언트)
					case(44){itemString = `id:16533 `; iCumRate +=3;} //0.035502959东方龙护手（精灵）차이나 드래곤 건틀렛(엘프)
					case(45){itemString = `id:17095 `; iCumRate +=3;} //0.035502959东方龙靴차이나 드래곤 부츠
					case(46){itemString = `id:18552 `; iCumRate +=3;} //0.035502959东方龙盔차이나 드래곤 헬름
					case(47){itemString = `id:13038 `; iCumRate +=2;} //0.023668639德斯汀银武士铠甲더스틴 실버 나이트 아머
					case(48){itemString = `id:16524 `; iCumRate +=3;} //0.035502959德斯汀银武士全臂铠甲더스틴 실버 나이트 뱀브레이스
					case(49){itemString = `id:17517 `; iCumRate +=3;} //0.035502959德斯汀银武士护胫더스틴 실버 나이트 그리브
					case(50){itemString = `id:13032 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(51){itemString = `id:13033 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=2;} //0.023668639巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(52){itemString = `id:16521 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(53){itemString = `id:17514 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(54){itemString = `id:13032 `; iCumRate +=2;} //0.023668639巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(55){itemString = `id:13033 `; iCumRate +=2;} //0.023668639巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(56){itemString = `id:16521 `; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(57){itemString = `id:17514 `; iCumRate +=3;} //0.035502959巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(58){itemString = `id:40095 durability:16000 durability_max:16000`; iCumRate +=4;} //0.047337278龙剑드래곤 블레이드
					case(59){itemString = `id:40033 durability:17000 durability_max:17000`; iCumRate +=4;} //0.047337278神之刃双手剑클레이모어
					case(60){itemString = `id:40081 prefix:20701 suffix:31103`; iCumRate +=2;} //0.023668639皮制长弓레더 롱 보우
					case(61){itemString = `id:40090 durability:14000 durability_max:14000`; iCumRate +=2;} //0.023668639治疗魔杖힐링 원드
					case(62){itemString = `id:40080 prefix:20625 suffix:31103`; iCumRate +=1;} //0.01183432罗马短剑글라디우스
					case(63){itemString = `id:40038 prefix:8 suffix:31103`; iCumRate +=1;} //0.01183432雷箭魔杖라이트닝 원드
					case(64){itemString = `id:40039 durability:14000 durability_max:14000`; iCumRate +=3;} //0.035502959冰箭魔杖아이스 원드
					case(65){itemString = `id:40040 durability:14000 durability_max:14000`; iCumRate +=3;} //0.035502959火箭魔杖파이어 원드
					case(66){itemString = `id:40041 durability:14000 durability_max:14000`; iCumRate +=3;} //0.035502959无属性魔杖타격용 원드
					case(67){itemString = `id:40078 durability:16000 durability_max:16000`; iCumRate +=3;} //0.035502959两刃斧비펜니스
					case(68){itemString = `id:40079 prefix:20625 suffix:31103`; iCumRate +=1;} //0.01183432权杖메이스
					case(69){itemString = `id:40031 durability:17000 durability_max:17000`; iCumRate +=2;} //0.023668639弩석궁
					case(70){itemString = `id:40030 durability:16000 durability_max:16000`; iCumRate +=2;} //0.023668639双手剑투 핸디드 소드
					case(71){itemString = `id:40013 durability:14000 durability_max:14000`; iCumRate +=2;} //0.023668639长弓롱 보우
					case(72){itemString = `id:40107 durability:22000 durability_max:22000`; iCumRate +=3;} //0.035502959守护之弓guardian bow
					case(73){itemString = `id:46007 durability:19000 durability_max:19000`; iCumRate +=2;} //0.023668639复合型燕型盾牌 헤테로 카이트 실드
					case(74){itemString = `id:40095 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959龙剑드래곤 블레이드
					case(75){itemString = `id:40033 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959神之刃双手剑클레이모어
					case(76){itemString = `id:40081 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959皮制长弓레더 롱 보우
					case(77){itemString = `id:40090 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959治疗魔杖힐링 원드
					case(78){itemString = `id:40080 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959罗马短剑글라디우스
					case(79){itemString = `id:40038 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959雷箭魔杖라이트닝 원드
					case(80){itemString = `id:40039 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959冰箭魔杖아이스 원드
					case(81){itemString = `id:40040 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959火箭魔杖파이어 원드
					case(82){itemString = `id:40041 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959无属性魔杖타격용 원드
					case(83){itemString = `id:40078 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959两刃斧비펜니스
					case(84){itemString = `id:40079 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959权杖메이스
					case(85){itemString = `id:40031 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959弩석궁
					case(86){itemString = `id:40030 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959双手剑투 핸디드 소드
					case(87){itemString = `id:40013 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959长弓롱 보우
					case(88){itemString = `id:40107 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959守护之弓
					case(89){itemString = `id:46007 col1:FFFFFF col2:FFFFFF col3:FFFFFF`; iCumRate +=3;} //0.035502959复合型燕型盾牌 헤테로 카이트 실드
					case(90){itemString = `id:15298 `; iCumRate +=1;} //0.01183432骑兵校服아처리스 스쿨웨어
					case(91){itemString = `id:15292 `; iCumRate +=1;} //0.01183432泳装女남성용 수영복
					case(92){itemString = `id:15293 `; iCumRate +=1;} //0.01183432泳装男여성용 수영복
					case(93){itemString = `id:15294 `; iCumRate +=1;} //0.01183432泳装女남성용 수영복
					case(94){itemString = `id:15295 `; iCumRate +=1;} //0.01183432泳装男여성용 수영복
					case(95){itemString = `id:15296 `; iCumRate +=2;} //0.023668639泳装女남성용 수영복
					case(96){itemString = `id:15297 `; iCumRate +=2;} //0.023668639泳装男여성용 수영복
					case(97){itemString = `id:15203 `; iCumRate +=4;} //0.047337278科尔和服（女）여성용 유카타
					case(98){itemString = `id:15204 `; iCumRate +=2;} //0.023668639蒙戈和服（男）남성용 유카타
					case(99){itemString = `id:15224 `; iCumRate +=4;} //0.047337278科尔和服（男）남성용 유카타
					case(100){itemString = `id:15225 `; iCumRate +=2;} //0.023668639蒙戈和服（女）여성용 유카타
					case(101){itemString = `id:19005 `; iCumRate +=2;} //0.023668639神秘长袍머플러 로브
					case(102){itemString = `id:15217 `; iCumRate +=2;} //0.023668639可爱的连衣裙에이프런 원피스
					case(103){itemString = `id:18161 `; iCumRate +=2;} //0.023668639Devcat耳套데브캣 귀마개
					case(104){itemString = `id:18157 `; iCumRate +=2;} //0.023668639猫爪发卡고양이 귀 머리띠
					case(105){itemString = `id:15233 `; iCumRate +=2;} //0.023668639耶莱特高级连衣裙엘레건트 고딕 드레스
					case(106){itemString = `id:15234 `; iCumRate +=2;} //0.023668639耶莱特高级套装엘레건트 고딕 슈트
					case(107){itemString = `id:15235 `; iCumRate +=2;} //0.023668639耶莱特高级连衣裙엘레건트 고딕 드레스
					case(108){itemString = `id:16046 `; iCumRate +=5;} //0.059171598猫手套고양이 손 장갑
					case(109){itemString = `id:62005 suffix:30918`; iCumRate +=20;} //0.236686391魔法释放卷轴-魔法男巫인챈트 스크롤
					case(110){itemString = `id:62005 suffix:30632`; iCumRate +=20;} //0.236686391魔法释放卷轴-狂暴骑士인챈트 스크롤
					case(111){itemString = `id:62005 suffix:30525`; iCumRate +=20;} //0.236686391魔法释放卷轴-魔法召唤者인챈트 스크롤
					case(112){itemString = `id:62005 suffix:30418`; iCumRate +=20;} //0.236686391魔法释放卷轴-毒狙击兵인챈트 스크롤
					case(113){itemString = `id:62005 prefix:20201`; iCumRate +=35;} //0.414201183魔法释放卷轴-坚固인챈트 스크롤
					case(114){itemString = `id:62005 suffix:30304`; iCumRate +=35;} //0.414201183魔法释放卷轴-灰狼인챈트 스크롤
					case(115){itemString = `id:62005 suffix:30702`; iCumRate +=35;} //0.414201183魔法释放卷轴-乌鸦인챈트 스크롤
					case(116){itemString = `id:62005 suffix:30704`; iCumRate +=35;} //0.414201183魔法释放卷轴-致命的인챈트 스크롤
					case(117){itemString = `id:62005 suffix:30801`; iCumRate +=35;} //0.414201183魔法释放卷轴-天然인챈트 스크롤
					case(118){itemString = `id:62005 suffix:30802`; iCumRate +=35;} //0.414201183魔法释放卷轴-反击인챈트 스크롤
					case(119){itemString = `id:62005 suffix:30803`; iCumRate +=35;} //0.414201183魔法释放卷轴-风车인챈트 스크롤
					case(120){itemString = `id:62005 suffix:30804`; iCumRate +=35;} //0.414201183魔法释放卷轴-重击인챈트 스크롤
					case(121){itemString = `id:62005 prefix:20405`; iCumRate +=35;} //0.414201183魔法释放卷轴-疯狂的인챈트 스크롤
					case(122){itemString = `id:62005 prefix:20501`; iCumRate +=35;} //0.414201183魔法释放卷轴-简单的인챈트 스크롤
					case(123){itemString = `id:62005 prefix:20602`; iCumRate +=35;} //0.414201183魔法释放卷轴-坚固的인챈트 스크롤
					case(124){itemString = `id:62005 prefix:20701`; iCumRate +=35;} //0.414201183魔法释放卷轴-猛烈的인챈트 스크롤
					case(125){itemString = `id:62005 suffix:30506`; iCumRate +=35;} //0.414201183魔法释放卷轴-可怕的인챈트 스크롤
					case(126){itemString = `id:62005 suffix:30614`; iCumRate +=35;} //0.414201183魔法释放卷轴-充满力量的인챈트 스크롤
					case(127){itemString = `id:62005 prefix:20108`; iCumRate +=35;} //0.414201183魔法释放卷轴-无翼鸟인챈트 스크롤
					case(128){itemString = `id:62005 prefix:20304`; iCumRate +=35;} //0.414201183魔法释放卷轴-鸵鸟인챈트 스크롤
					case(129){itemString = `id:62005 prefix:20209`; iCumRate +=35;} //0.414201183魔法释放卷轴-猫鼬인챈트 스크롤
					case(130){itemString = `id:62005 prefix:20409`; iCumRate +=35;} //0.414201183魔法释放卷轴-沙漠狐인챈트 스크롤
					case(131){itemString = `id:62005 prefix:20615`; iCumRate +=35;} //0.414201183魔法释放卷轴-沙漠蜘蛛인챈트 스크롤
					case(132){itemString = `id:62005 prefix:20508`; iCumRate +=35;} //0.414201183魔法释放卷轴-可疑的인챈트 스크롤
					case(133){itemString = `id:62005 prefix:20618`; iCumRate +=35;} //0.414201183魔法释放卷轴-犹豫的인챈트 스크롤
					case(134){itemString = `id:62005 prefix:20718`; iCumRate +=35;} //0.414201183魔法释放卷轴-奇怪的인챈트 스크롤
					case(135){itemString = `id:62005 prefix:20212`; iCumRate +=35;} //0.414201183魔法释放卷轴-怪异的인챈트 스크롤
					case(136){itemString = `id:62005 prefix:20412`; iCumRate +=35;} //0.414201183魔法释放卷轴-奇异的인챈트 스크롤
					case(137){itemString = `id:62005 prefix:20619`; iCumRate +=35;} //0.414201183魔法释放卷轴-奇特的인챈트 스크롤
					case(138){itemString = `id:62005 suffix:30616`; iCumRate +=35;} //0.414201183魔法释放卷轴-冷淡的인챈트 스크롤
					case(139){itemString = `id:62005 suffix:30617`; iCumRate +=35;} //0.414201183魔法释放卷轴-无情的인챈트 스크롤
					case(140){itemString = `id:62005 suffix:30618`; iCumRate +=35;} //0.414201183魔法释放卷轴-悲惨的인챈트 스크롤
					case(141){itemString = `id:62005 suffix:30515`; iCumRate +=30;} //0.355029586魔法释放卷轴-海盗的해적의
					case(142){itemString = `id:62005 prefix:20505`; iCumRate +=30;} //0.355029586魔法释放卷轴-蜥蜴리자드
					case(143){itemString = `id:62005 prefix:21007`; iCumRate +=30;} //0.355029586魔法释放卷轴-石南히스
					case(144){itemString = `id:62005 prefix:20625`; iCumRate +=30;} //0.355029586魔法释放卷轴-金针금속 바늘
					case(145){itemString = `id:62005 suffix:30624`; iCumRate +=30;} //0.355029586魔法释放卷轴-山查树산사나무
					case(146){itemString = `id:62005 prefix:20721`; iCumRate +=30;} //0.355029586魔法释放卷轴-休闲的한가한
					case(147){itemString = `id:51003 count:10`; iCumRate +=60;} //0.710059172生命药水 50 点생명력 50 포션
					case(148){itemString = `id:51004 count:10`; iCumRate +=60;} //0.710059172生命药水 100 点생명력 100 포션
					case(149){itemString = `id:51007 count:10`; iCumRate +=20;} //0.236686391魔法药水 30 点마나 30 포션
					case(150){itemString = `id:51008 count:10`; iCumRate +=60;} //0.710059172魔法药水 50 点마나 50 포션
					case(151){itemString = `id:51013 count:10`; iCumRate +=20;} //0.236686391体力药水 50 点스태미나 50 포션
					case(152){itemString = `id:51014 count:10`; iCumRate +=60;} //0.710059172体力药水 100 点스태미나 100 포션
					case(153){itemString = `id:51001 count:10`; iCumRate +=20;} //0.236686391生命药水 10 点생명력 10 포션
					case(154){itemString = `id:51002 count:10`; iCumRate +=20;} //0.236686391生命药水 30 点생명력 30 포션
					case(155){itemString = `id:51022 count:10`; iCumRate +=20;} //0.236686391生命魔法药水 30 点생명력과 마나 30 포션
					case(156){itemString = `id:51027 count:10`; iCumRate +=20;} //0.236686391生命体力药水 30 点생명력과 스태미나 30 포션
					case(157){itemString = `id:51028 count:10`; iCumRate +=20;} //0.236686391生命体力药水 50 点생명력과 스태미나 50 포션
					case(158){itemString = `id:51029 count:10`; iCumRate +=60;} //0.710059172生命体力药水 100 点생명력과 스태미나 100 포션
					case(159){itemString = `id:63000 count:10`; iCumRate +=20;} //0.236686391凤凰羽毛피닉스의 깃털
					case(160){itemString = `id:60037 count:5`; iCumRate +=20;} //0.236686391黑色青春药水블랙 유스 포션
					case(161){itemString = `id:60038 count:5`; iCumRate +=20;} //0.236686391红色药水레드 포션
					case(162){itemString = `id:50012 count:5`; iCumRate +=20;} //0.236686391金鸡蛋황금 달걀
					case(163){itemString = `id:50013 count:5`; iCumRate +=20;} //0.236686391金苹果황금 사과
					case(164){itemString = `id:50541 quality:100`; iCumRate +=20;} //0.236686391意大利浓缩咖啡에스프레소
					case(165){itemString = `id:50542 quality:100`; iCumRate +=20;} //0.236686391意大利式泡沫牛奶에스프레소 마끼아또
					case(166){itemString = `id:50543 quality:100`; iCumRate +=20;} //0.236686391卡布奇诺카푸치노
					case(167){itemString = `id:50544 quality:100`; iCumRate +=20;} //0.236686391玛奇雅朵마끼아또
					case(168){itemString = `id:50545 quality:100`; iCumRate +=20;} //0.236686391摩卡咖啡카페 모카
					case(169){itemString = `id:50546 quality:100`; iCumRate +=20;} //0.236686391冰摩卡咖啡아이스 카페 모카
					case(170){itemString = `id:50547 quality:100`; iCumRate +=20;} //0.236686391冰玛奇雅朵아이스 마끼아또
					case(171){itemString = `id:50170 quality:100`; iCumRate +=20;} //0.236686391芝士酱치즈 퐁듀
					case(172){itemString = `id:50171 quality:100`; iCumRate +=20;} //0.236686391艾明玛恰红酒이멘 마하산 와인
					case(173){itemString = `id:50172 quality:100`; iCumRate +=20;} //0.236686391芝士蛋糕레어치즈 케익
					case(174){itemString = `id:50173 quality:100`; iCumRate +=20;} //0.236686391巧克力奶油蛋糕가토 오 쇼콜라
					case(175){itemString = `id:50174 quality:100`; iCumRate +=20;} //0.236686391火腿面包크로크 무슈
					case(176){itemString = `id:50175 quality:100`; iCumRate +=20;} //0.236686391核仁巧克力蛋糕브라우니
					case(177){itemString = `id:50176 quality:100`; iCumRate +=20;} //0.236686391奶油饼干버터 비스킷
					case(178){itemString = `id:18518 `; iCumRate +=30;} //0.355029586配龙金属头盔드래곤 크레스트
					case(179){itemString = `id:15113 `; iCumRate +=30;} //0.355029586女性用剑士学校校服短款여성용 검사학교 교복 쇼트타입
					case(180){itemString = `id:15114 `; iCumRate +=30;} //0.355029586男性用剑士学校校服长款남성용 검사학교 교복 롱타입
					case(181){itemString = `id:15065 `; iCumRate +=30;} //0.355029586爱拉背心短裙엘라 베스트 스커트
					case(182){itemString = `id:19008 `; iCumRate +=30;} //0.355029586可可熊猫长袍코코 판다 로브
					case(183){itemString = `id:15137 `; iCumRate +=30;} //0.355029586萨丽娜短夹克셀리나 하프 재킷 코트
					case(184){itemString = `id:18041 `; iCumRate +=30;} //0.355029586羽毛法师帽큰 챙 깃털 모자
					case(185){itemString = `id:19009 `; iCumRate +=30;} //0.355029586可可兔子长袍코코 래빗 로브
					case(186){itemString = `id:18112 `; iCumRate +=30;} //0.355029586太阳伪装装饰해 분장 소품
					case(187){itemString = `id:18111 `; iCumRate +=30;} //0.355029586树伪装装饰나무 분장 소품
					case(188){itemString = `id:18110 `; iCumRate +=30;} //0.355029586草丛伪装装饰덤불 분장 소품
					case(189){itemString = `id:18109 `; iCumRate +=30;} //0.355029586娜儿伪装装饰나오 분장 소품
					case(190){itemString = `id:18108 `; iCumRate +=30;} //0.355029586岩石伪装装饰바위 분장 소품
					case(191){itemString = `id:40083 `; iCumRate +=30;} //0.355029586钩状弯刀훅 커틀러스
					case(192){itemString = `id:40032 `; iCumRate +=30;} //0.355029586翼魔剑가고일 소드
					case(193){itemString = `id:18544 `; iCumRate +=30;} //0.355029586骑士金属头盔펠리칸 프로텍터
					case(194){itemString = `id:18547 `; iCumRate +=30;} //0.355029586羽毛金属头盔파나쉬 헤드 프로텍터
					case(195){itemString = `id:18521 `; iCumRate +=30;} //0.355029586卫兵金属头盔유러피안 컴프
					case(196){itemString = `id:18500 `; iCumRate +=30;} //0.355029586护颈头盔링 메일 헬름
					case(197){itemString = `id:18511 `; iCumRate +=30;} //0.355029586凹槽盔플루트 풀 헬름
					case(198){itemString = `id:18502 `; iCumRate +=30;} //0.355029586骨头盔본 헬름
					case(199){itemString = `id:19007 `; iCumRate +=30;} //0.355029586夜光长袍야광 머플러 로브
					case(200){itemString = `id:19017 `; iCumRate +=30;} //0.355029586狼长袍늑대 로브
					case(201){itemString = `id:19016 `; iCumRate +=30;} //0.355029586熊长袍곰 로브
					case(202){itemString = `id:15112 `; iCumRate +=30;} //0.355029586萨丽娜校服셀리나 스쿨보이룩
					case(203){itemString = `id:18034 `; iCumRate +=30;} //0.355029586科尔蓓蕾帽볼륨 베레모
					case(204){itemString = `id:18006 `; iCumRate +=30;} //0.355029586魔法师帽子마법사모자
					case(205){itemString = `id:18113 `; iCumRate +=30;} //0.355029586尖耳小猫帽子뾰족귀 고양이 모자
					case(206){itemString = `id:18114 `; iCumRate +=30;} //0.355029586猫脸小猫帽子줄무늬 고양이 모자
					case(207){itemString = `id:18115 `; iCumRate +=30;} //0.355029586鱼型小猫帽子핀 고양이 모자
					case(208){itemString = `id:18097 `; iCumRate +=30;} //0.355029586赛连羽翼面具세이렌 깃털 가면
					case(209){itemString = `id:18098 `; iCumRate +=30;} //0.355029586赛连眼镜세이렌의 안경
					case(210){itemString = `id:18099 `; iCumRate +=30;} //0.355029586赛连小翅膀面具세이렌 작은 날개 가면
					case(211){itemString = `id:18100 `; iCumRate +=30;} //0.355029586赛连翅膀面具세이렌 날개 가면
					case(212){itemString = `id:18101 `; iCumRate +=30;} //0.355029586赛连蝙蝠面具세이렌 박쥐 날개 가면
					case(213){itemString = `id:18102 `; iCumRate +=30;} //0.355029586赛连面具세이렌의 가면
					case(214){itemString = `id:15055 `; iCumRate +=30;} //0.355029586赛连猫面具세이렌 고양이 가면
					case(215){itemString = `id:18044 `; iCumRate +=30;} //0.355029586罪人用面具범죄용 복면
					case(216){itemString = `id:40071 `; iCumRate +=30;} //0.355029586‘拉’音瓶'라' 음 빈 병
					case(217){itemString = `id:40072 `; iCumRate +=30;} //0.355029586‘西’音瓶'시' 음 빈 병
					case(218){itemString = `id:40073 `; iCumRate +=30;} //0.355029586‘哆’音瓶'도' 음 빈 병
					case(219){itemString = `id:40074 `; iCumRate +=30;} //0.355029586‘来’音瓶'레' 음 빈 병
					case(220){itemString = `id:40075 `; iCumRate +=30;} //0.355029586‘咪’音瓶'미' 음 빈 병
					case(221){itemString = `id:40076 `; iCumRate +=30;} //0.355029586‘发’音瓶'파' 음 빈 병
					case(222){itemString = `id:40077 `; iCumRate +=30;} //0.355029586‘嗦’音瓶'솔' 음 빈 병
					case(223){itemString = `id:16517 `; iCumRate +=30;} //0.355029586反对手套반대 장갑
					case(224){itemString = `id:16516 `; iCumRate +=30;} //0.355029586赞成手套찬성 장갑
					case(225){itemString = `id:16515 `; iCumRate +=30;} //0.355029586布手套보 장갑
					case(226){itemString = `id:16514 `; iCumRate +=30;} //0.355029586石头手套바위 장갑
					case(227){itemString = `id:16513 `; iCumRate +=30;} //0.355029586剪子手套가위 장갑
					case(228){itemString = `id:40068 `; iCumRate +=30;} //0.355029586剪刀拳가위 모양 지시봉
					case(229){itemString = `id:40069 `; iCumRate +=30;} //0.355029586石头拳바위 모양 지시봉
					case(230){itemString = `id:40070 `; iCumRate +=30;} //0.355029586布型指挥棒보 모양 지시봉
					case(231){itemString = `id:17015 `; iCumRate +=30;} //0.355029586格斗靴Combat Shoes
					case(232){itemString = `id:15055`; iCumRate +=30;} //0.355029586星星迷你裙레더 미니 원피스
					case(233){itemString = `id:15057 `; iCumRate +=30;} //0.355029586无光皮外套롱 레더 코트 (무광)
					case(234){itemString = `id:18040 `; iCumRate +=30;} //0.355029586科尔铃铛帽코레스 꼭지 베레모
					case(235){itemString = `id:80000 `; iCumRate +=30;} //0.355029586娜儿的黑衣服나오의 검은 옷
					case(236){itemString = `id:80001 `; iCumRate +=30;} //0.355029586茹娅的衣服루아의 옷
					case(237){itemString = `id:80002 `; iCumRate +=30;} //0.355029586粉色外套핑크색 코트
					case(238){itemString = `id:80003 `; iCumRate +=30;} //0.355029586黑色外套검은색 코트
					case(239){itemString = `id:80004 `; iCumRate +=30;} //0.355029586娜儿的黄色春装나오의 노란색 봄 옷
					case(240){itemString = `id:80005 `; iCumRate +=30;} //0.355029586娜儿的白色春装나오의 하얀색 봄 옷
					case(241){itemString = `id:80006 `; iCumRate +=30;} //0.355029586娜儿的粉色春装나오의 핑크색 봄 옷
					case(242){itemString = `id:18056 `; iCumRate +=40;} //0.473372781星星兔耳发箍1  (不可修理)별 토끼 머리띠1
					case(243){itemString = `id:18057 `; iCumRate +=40;} //0.473372781星星兔耳发箍2  (不可修理)별 토끼 머리띠2
					case(244){itemString = `id:18058 `; iCumRate +=40;} //0.473372781星星兔耳发箍3 (不可修理)별 토끼 머리띠3
					case(245){itemString = `id:18059 `; iCumRate +=40;} //0.473372781星星兔耳发箍4 (不可修理)별 토끼 머리띠4
					case(246){itemString = `id:18060 `; iCumRate +=40;} //0.473372781星星兔耳发箍5 (不可修理)별 토끼 머리띠5
					case(247){itemString = `id:18061 `; iCumRate +=40;} //0.473372781毛绒兔耳发箍1  (不可修理)털 토끼 머리띠1
					case(248){itemString = `id:18062 `; iCumRate +=40;} //0.473372781毛绒兔耳发箍2  (不可修理)털 토끼 머리띠2
					case(249){itemString = `id:18063 `; iCumRate +=40;} //0.473372781毛绒兔耳发箍3  (不可修理)털 토끼 머리띠3
					case(250){itemString = `id:18064 `; iCumRate +=40;} //0.473372781毛绒兔耳发箍4  (不可修理)털 토끼 머리띠4
					case(251){itemString = `id:18065 `; iCumRate +=40;} //0.473372781毛绒兔耳发箍5  (不可修理)털 토끼 머리띠5
					case(252){itemString = `id:18066 `; iCumRate +=40;} //0.473372781皮革兔耳发箍1  (不可修理)가죽 토끼 머리띠1
					case(253){itemString = `id:18067 `; iCumRate +=40;} //0.473372781皮革兔耳发箍2  (不可修理)가죽 토끼 머리띠2
					case(254){itemString = `id:18068 `; iCumRate +=40;} //0.473372781皮革兔耳发箍3 (不可修理)가죽 토끼 머리띠3
					case(255){itemString = `id:18069 `; iCumRate +=40;} //0.473372781皮革兔耳发箍4 (不可修理)가죽 토끼 머리띠4
					case(256){itemString = `id:18070 `; iCumRate +=40;} //0.473372781皮革兔耳发箍5 (不可修理)가죽 토끼 머리띠5
					case(257){itemString = `id:14036 `; iCumRate +=30;} //0.355029586迪奥斯铠甲(男性用)티오즈 아머(남성용)
					case(258){itemString = `id:14037 `; iCumRate +=30;} //0.355029586迪奥斯铠甲(女性用)티오즈 아머(여성용)
					case(259){itemString = `id:16531 `; iCumRate +=30;} //0.355029586迪奥斯手套티오즈 건틀렛
					case(260){itemString = `id:17523 `; iCumRate +=30;} //0.355029586迪奥斯长靴티오즈 그리브
					case(261){itemString = `id:15132 `; iCumRate +=30;} //0.355029586天然高级男装내추럴 베스트 웨어
					case(262){itemString = `id:15070 `; iCumRate +=30;} //0.355029586路易斯猎人服스탠드칼라 슬리브리스
					case(263){itemString = `id:15230 `; iCumRate +=30;} //0.355029586格伦达短裙가르텐 글렌 체크 스커트
					case(264){itemString = `id:19034 `; iCumRate +=30;} //0.355029586精致羽毛长袍가르텐 클로스 오버코트
					case(265){itemString = `id:40033 `; iCumRate +=30;} //0.355029586神之刃双手剑클레이모어
					case(266){itemString = `id:40011 `; iCumRate +=30;} //0.355029586阔剑브로드 소드
					case(267){itemString = `id:40030 `; iCumRate +=30;} //0.355029586双手剑투 핸디드 소드
					case(268){itemString = `id:40012 `; iCumRate +=30;} //0.355029586变形剑바스타드 소드
					case(269){itemString = `id:40007 `; iCumRate +=30;} //0.355029586单手斧한손도끼
					case(270){itemString = `id:40014 `; iCumRate +=30;} //0.355029586复合弓콤포짓 보우
					case(271){itemString = `id:40078 `; iCumRate +=30;} //0.355029586两刃斧비펜니스
					case(272){itemString = `id:40080 `; iCumRate +=30;} //0.355029586罗马短剑글라디우스
					case(273){itemString = `id:40006 `; iCumRate +=30;} //0.355029586匕首단검
					case(274){itemString = `id:40031 `; iCumRate +=30;} //0.355029586弩석궁
					case(275){itemString = `id:40081 `; iCumRate +=30;} //0.355029586皮制长弓레더 롱 보우
					case(276){itemString = `id:40079 `; iCumRate +=30;} //0.355029586权杖메이스
					case(277){itemString = `id:13043 `; iCumRate +=30;} //0.355029586蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)
					case(278){itemString = `id:13044 `; iCumRate +=30;} //0.355029586蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)
					case(279){itemString = `id:13045 `; iCumRate +=30;} //0.355029586艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)
					case(280){itemString = `id:13046 `; iCumRate +=30;} //0.355029586艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)
					case(281){itemString = `id:14019 `; iCumRate +=30;} //0.355029586优美的金属铠甲그레이스 플레이트 아머
					case(282){itemString = `id:13031 `; iCumRate +=30;} //0.355029586银光金属盔甲스파이카 실버 플레이트 아머
					case(283){itemString = `id:13022 `; iCumRate +=30;} //0.355029586硬皮甲 (P类型)로즈 플레이트 아머 (P타입)
					case(284){itemString = `id:40039 `; iCumRate +=30;} //0.355029586冰箭魔杖아이스 원드
					case(285){itemString = `id:40090 `; iCumRate +=30;} //0.355029586治疗魔杖힐링 원드
					case(286){itemString = `id:40040 `; iCumRate +=30;} //0.355029586火箭魔杖파이어 원드
					case(287){itemString = `id:40038 `; iCumRate +=30;} //0.355029586雷箭魔杖라이트닝 원드
					case(288){itemString = `id:18542 `; iCumRate +=30;} //0.355029586巨链盔빅 체인 풀 헬름
					case(289){itemString = `id:18506 `; iCumRate +=30;} //0.355029586翼盔윙 하프 헬름
					case(290){itemString = `id:14042 `; iCumRate +=30;} //0.355029586凯斯汀皮革铠甲컬스틴 레더 아머
					case(291){itemString = `id:15155 `; iCumRate +=30;} //0.355029586Yidikai圣职者礼服(男性用)이디카이 성직자 예복(남성용)
					case(292){itemString = `id:15156 `; iCumRate +=30;} //0.355029586Yidikai圣职者礼服(女性用)이디카이 성직자 예복(여성용)
					case(293){itemString = `id:15151 `; iCumRate +=30;} //0.355029586纽约玛里奥收腰礼服(男性用)뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(294){itemString = `id:15152 `; iCumRate +=30;} //0.355029586纽约玛里奥收腰礼服(女性用)뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(295){itemString = `id:15153 `; iCumRate +=30;} //0.355029586桑德拉狙击手服(男性用)산드라 스나이퍼 수트(남성용)
					case(296){itemString = `id:15154 `; iCumRate +=30;} //0.355029586桑德拉狙击手服(女性用)산드라 스나이퍼 수트(여성용)
					case(297){itemString = `id:15157 `; iCumRate +=30;} //0.355029586威斯保卫军衣服(男性用)위스 보위군 의복(남성용)
					case(298){itemString = `id:15158 `; iCumRate +=30;} //0.355029586威斯保卫军衣服(女性用)위스 보위군 의복(여성용)
					case(299){itemString = `id:15115 `; iCumRate +=30;} //0.355029586不对称迷你裙子재기드 미니 스커트
					case(300){itemString = `id:15059 `; iCumRate +=30;} //0.355029586吊带短裤터크스 탱크탑 반바지
					case(301){itemString = `id:15070 `; iCumRate +=30;} //0.355029586科尔迷你裙아이돌 리본 드레스
					case(302){itemString = `id:15074 `; iCumRate +=30;} //0.355029586路易斯牧师服루이스 성직자 코트
					case(303){itemString = `id:15061 `; iCumRate +=30;} //0.355029586路易斯束腰服물결무늬 옆트임 튜닉
					case(304){itemString = `id:18045 `; iCumRate +=30;} //0.355029586星星法师帽별장식 마법사 모자
					case(305){itemString = `id:18019 `; iCumRate +=30;} //0.355029586丽琳羽毛帽子리리나 깃털모자
					case(306){itemString = `id:18020 `; iCumRate +=30;} //0.355029586蒙戈羽毛帽子몬거 깃털모자
					case(307){itemString = `id:18029 `; iCumRate +=30;} //0.355029586带框眼镜나무테 안경
					case(308){itemString = `id:18028 `; iCumRate +=30;} //0.355029586轻便眼镜접이식 안경
					case(309){itemString = `id:16500 `; iCumRate +=30;} //0.355029586保护手套울나 프로텍터 글러브
					case(310){itemString = `id:40053 `; iCumRate +=30;} //0.355029586一束紫色玫瑰보라빛 장미 꽃다발
					case(311){itemString = `id:40054 `; iCumRate +=30;} //0.355029586一朵紫色玫瑰보라빛 장미 한송이
					case(312){itemString = `id:18089 `; iCumRate +=30;} //0.355029586紫玫瑰花装饰보라빛 장미 장식
					case(313){itemString = `id:40052 `; iCumRate +=30;} //0.355029586一朵蓝色玫瑰파란 장미 한송이
					case(314){itemString = `id:18090 `; iCumRate +=30;} //0.355029586蓝玫瑰花装饰파란 장미 장식
					case(315){itemString = `id:18086 `; iCumRate +=30;} //0.355029586雏菊花装饰데이지 꽃 장식
					case(316){itemString = `id:18087 `; iCumRate +=30;} //0.355029586玫瑰花装饰장미 꽃 장식
					case(317){itemString = `id:13010 `; iCumRate +=30;} //0.355029586圆形链甲라운드 폴드론 체인메일
					case(318){itemString = `id:14025 `; iCumRate +=30;} //0.355029586卡迈意念铠甲(男性用)카멜 스피리트 아머(남성용)
					case(319){itemString = `id:14026 `; iCumRate +=30;} //0.355029586卡迈意念铠甲(女性用)카멜 스피리트 아머(여성용)
					case(320){itemString = `id:16028 `; iCumRate +=30;} //0.355029586卡迈意念手套카멜 스피리트 글러브
					case(321){itemString = `id:16511 `; iCumRate +=30;} //0.355029586银光手套실버 티니 글러브
					case(322){itemString = `id:17064 `; iCumRate +=30;} //0.355029586卡迈意念靴子카멜 스피리트 부츠
					case(323){itemString = `id:15131 `; iCumRate +=30;} //0.355029586蕾丝吊带裙핀 에이프런 스커트
					case(324){itemString = `id:2006 `; iCumRate +=30;} //0.355029586大金币囊큰 금화 주머니
					case(325){itemString = `id:16534 `; iCumRate +=30;} //0.355029586凯斯汀皮革护手컬스틴 레더 건틀렛
					case(326){itemString = `id:17524 `; iCumRate +=30;} //0.355029586凯斯汀皮革鞋컬스틴 레더 부츠
					case(327){itemString = `id:13047 `; iCumRate +=30;} //0.355029586凯利诺斯金属铠甲(男性用)키리누스진 하프 플레이트 아머(남성용)
					case(328){itemString = `id:13048 `; iCumRate +=30;} //0.355029586凯利诺斯金属铠甲(女性用)키리누스진 하프 플레이트 아머(여성용)
					case(329){itemString = `id:14013 `; iCumRate +=30;} //0.355029586古罗马胸甲로리카 세그먼타타에
					case(330){itemString = `id:14035 `; iCumRate +=30;} //0.355029586佩乐皮革盔甲피르타 레더 아머
					case(331){itemString = `id:14038 `; iCumRate +=30;} //0.355029586雪原银铠甲B类型(女性用)피르타 레더 아머 B타입(여성용)
					case(332){itemString = `id:15014 `; iCumRate +=30;} //0.355029586使者衣파발꾼의 옷
					case(333){itemString = `id:15028 `; iCumRate +=30;} //0.355029586科尔盗贼服코레스 씨프슈트
					case(334){itemString = `id:15042 `; iCumRate +=30;} //0.355029586高领子连衣裙롱넥 원피스
					case(335){itemString = `id:15052 `; iCumRate +=30;} //0.355029586男性束腰装터크스 투톤 튜닉
					case(336){itemString = `id:15053 `; iCumRate +=30;} //0.355029586贵妇装플랫칼라 원피스
					case(337){itemString = `id:15128 `; iCumRate +=30;} //0.355029586魔法淑女裙투 톤 비조 드레스
					case(338){itemString = `id:15136 `; iCumRate +=30;} //0.355029586冒险家正装모험가 슈트
					case(339){itemString = `id:16008 `; iCumRate +=30;} //0.355029586科尔盗贼手套코레스 씨프 글러브
					case(340){itemString = `id:16019 `; iCumRate +=30;} //0.355029586丽琳护手줄무늬 팔목 장갑
					case(341){itemString = `id:16040 `; iCumRate +=30;} //0.355029586肯林白狐皮手套콜린 빅센 글러브
					case(342){itemString = `id:16505 `; iCumRate +=30;} //0.355029586长凹槽手套플루트 건틀렛
					case(343){itemString = `id:16520 `; iCumRate +=30;} //0.355029586长红色皮手套롱 레더 글러브
					case(344){itemString = `id:17040 `; iCumRate +=30;} //0.355029586爱拉系带靴엘라 스트랩 부츠
					case(345){itemString = `id:17041 `; iCumRate +=30;} //0.355029586路易斯高筒靴덩굴무늬 헌팅부츠
					case(346){itemString = `id:17045 `; iCumRate +=30;} //0.355029586帅气长靴브이 넥 라인 레더 부츠
					case(347){itemString = `id:17071 `; iCumRate +=30;} //0.355029586倪哈儿靴子니하이 부츠
					case(348){itemString = `id:17087 `; iCumRate +=30;} //0.355029586肯林白狐皮靴콜린 빅센 부츠
					case(349){itemString = `id:17506 `; iCumRate +=30;} //0.355029586长护胫靴롱그리브 부츠
					case(350){itemString = `id:17522 `; iCumRate +=30;} //0.355029586佩尔皮靴피르타 레더 부츠
					case(351){itemString = `id:18008 `; iCumRate +=30;} //0.355029586条纹帽스트라이프 캡
					case(352){itemString = `id:18023 `; iCumRate +=30;} //0.355029586蒙戈盗贼帽子몬거 씨프 캡
					case(353){itemString = `id:18038 `; iCumRate +=30;} //0.355029586路易斯卫兵帽깃털 배렛 모자
					case(354){itemString = `id:18047 `; iCumRate +=30;} //0.355029586科尔花边帽코레스 펠트 모자
					case(355){itemString = `id:18513 `; iCumRate +=30;} //0.355029586铁钉盔스파이크 캡
					case(356){itemString = `id:18515 `; iCumRate +=30;} //0.355029586牛角金属头盔트윈 혼 캡
					case(357){itemString = `id:18525 `; iCumRate +=30;} //0.355029586水滴金属头盔워터드롭 캡
					case(358){itemString = `id:18543 `; iCumRate +=30;} //0.355029586完整的铁盔슬릿 풀 헬름
					case(359){itemString = `id:19020 `; iCumRate +=30;} //0.355029586娜塔内雪山用外套나타네 설산용 코트
					case(360){itemString = `id:19029 `; iCumRate +=30;} //0.355029586巨人贝尔长袍자이언트 베어 로브
					case(361){itemString = `id:40015 `; iCumRate +=30;} //0.355029586带凹槽的短剑플루트 숏 소드
					case(362){itemString = `id:40081 `; iCumRate +=30;} //0.355029586长弓롱 보우
					case(363){itemString = `id:46001 `; iCumRate +=30;} //0.355029586圆盾라운드 실드
					case(364){itemString = `id:46006 `; iCumRate +=30;} //0.355029586燕型盾牌카이트 실드
					case(365){itemString = `id:40172 `; iCumRate +=30;} //0.355029586巨剑그레이트 소드
					case(366){itemString = `id:40174 `; iCumRate +=30;} //0.355029586钉锤모닝스타
					case(367){itemString = `id:40177 `; iCumRate +=30;} //0.355029586长柄巨斧워리어 액스
					case(368){itemString = `id:40180 `; iCumRate +=30;} //0.355029586圆锥拳套홉네일 너클
					case(369){itemString = `id:40041 `; iCumRate +=30;} //0.355029586打击用魔杖타격용 원드
					case(370){itemString = `id:40010 `; iCumRate +=30;} //0.355029586长剑롱 소드
					case(371){itemString = `id:40002 `; iCumRate +=30;} //0.355029586木剑연습용 목도
					case(372){itemString = `id:16523 `; iCumRate +=30;} //0.355029586优美的手套그레이스 건틀렛
					case(373){itemString = `id:17515 `; iCumRate +=30;} //0.355029586优美的护胫그레이스 그리브
					case(374){itemString = `id:18545 `; iCumRate +=30;} //0.355029586优美的头盔그레이스 헬멧
					case(375){itemString = `id:46012 `; iCumRate +=30;} //0.355029586青铜盾牌청동 방패
					case(376){itemString = `id:46007 `; iCumRate +=30;} //0.355029586复合型燕型盾牌 헤테로 카이트 실드
					case(377){itemString = `id:46008 `; iCumRate +=30;} //0.355029586廉价复合型燕型盾牌라이트 헤테로 카이트 실드
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
					GiveTreasureChestItem(player,itemString,itemID);
					bGameTreasureChest = true;
				}
				if(bGameTreasureChest)
				{
					break;
				}

				++i;
			}
		}
	}
	// 중국 보물상자 상시 진행용 ~ 금 상자
	else if (itemID == 91084)
	{
		bool bGameTreasureChest = false;
		bool bCashTreasureChest = false;

		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:63043 count:4`; iCumRate += 	7	; } //	어드밴스드 깃털
					case(	1	) { itemString = `id:63044 count:7`; iCumRate += 	4	; } //	파티 부활의 깃털
					case(	2	) { itemString = `id:51031 count:5`; iCumRate += 	4	; } //	완전 회복의 포션
					case(	3	) { itemString = `id:63064 count:7`; iCumRate += 	4	; } //	하트 모양 불꽃놀이키트
					case(	4	) { itemString = `id:63025 count:4`; iCumRate += 	4	; } //	대용량 축복의 포션
					case(	5	) { itemString = `id:91005 count:2`; iCumRate += 	8	; } //	전투력 약화 포션
					case(	6	) { itemString = `id:63026 count:7`; iCumRate += 	5	; } //	원격 은행 이용권
					case(	7	) { itemString = `id:63047 count:7`; iCumRate += 	5	; } //	원격 힐러집 이용권
					case(	8	) { itemString = `id:63024 expire:10080 count:2`; iCumRate += 	3	; } //	염색 앰플
					case(	9	) { itemString = `id:91002 count:7`; iCumRate += 	4	; } //	마나 부스트 포션
					case(	10	) { itemString = `id:91003 count:7`; iCumRate += 	4	; } //	스태미나 부스트 포션
					case(	11	) { itemString = `id:91004 count:7`; iCumRate += 	4	; } //	보호와 방어 부스트 포션
					case(	12	) { itemString = `id:91001 count:7`; iCumRate += 	4	; } //	생명력 부스트 포션
					case(	13	) { itemString = `id:63029 count:4`; iCumRate += 	7	; } //	캠프파이어 키트
					case(	14	) { itemString = `id:91007 count:2`; iCumRate += 	8	; } //	17살의 키가 되는 포션
					case(	15	) { itemString = `id:91006 count:2`; iCumRate += 	8	; } //	10살의 키가 되는 포션
					case(	16	) { itemString = `id:63074 count:7`; iCumRate += 	4	; } //	나오 불꽃 놀이 키트
					case(	17	) { itemString = `id:63074 count:7`; iCumRate += 	4	; } //	데브캣 불꽃놀이 키트
					case(	18	) { itemString = `id:91066 count:2`; iCumRate += 	3	; } //	정령무기 수리 포션 1~5
					case(	19	) { itemString = `id:91067 count:1`; iCumRate += 	3	; } //	정령무기 수리 포션 6~10
					case(	20	) { itemString = `id:91059 count:2`; iCumRate += 	3	; } //	펫 체형 변화 포션 1살
					case(	21	) { itemString = `id:91063 count:2`; iCumRate += 	3	; } //	펫 체형 변화 포션 5살
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
					GiveTreasureChestItem(player,itemString,itemID);
					bCashTreasureChest = true;
				}
				if (bCashTreasureChest)
				{
					break;
				}

				++i;
			}
		}
		{
			int iRandom = Random(7971);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40345  suffix:31103 col1:000000 col2:388233 quality:100`; iCumRate +=2;} //0.025090955刺 利刃弯刀(Q100 / 纯色)스파이크 팔카타 (Q100 / 지정색)
					case(1){itemString = `id:40346  suffix:30921 col1:64d1c3 col2:000000 col3:ffffff quality:100`; iCumRate +=2;} //0.025090955鳄鱼 苏格兰高地双手重剑(Q100 / 纯色)크로코다일 하이랜더 클레이모어 (Q100 / 지정색)
					case(2){itemString = `id:40347  prefix:20917 col1:ffffff col2:000000 quality:100`; iCumRate +=1;} //0.012545477光荣的  苏格兰高地长弓(Q100 / 纯色)글로리어스 하이랜더 롱보우 (Q100 / 지정색)
					case(3){itemString = `id:40348  suffix:31019 col1:0049c4 col2:b3e5ff quality:100`; iCumRate +=2;} //0.025090955力量  佛朗基斯卡(Q100 / 纯色)마이트 프랑키스카 (Q100 / 지정색)
					case(4){itemString = `id:46027  suffix:21405 col1:ffffff col2:000000 quality:100`; iCumRate +=2;} //0.025090955将军  圆盾(Q100 / 纯色)마샬 타지 실드 (Q100 / 지정색)
					case(5){itemString = `id:40342 `; iCumRate +=1;} //0.012545477 安德拉斯 木偶娃娃안드라스 퍼핏 인형
					case(6){itemString = `id:40343 `; iCumRate +=1;} //0.012545477 埃拉哈 木偶娃娃엘라하 퍼핏 인형
					case(7){itemString = `id:14059 `; iCumRate +=1;} //0.012545477神射手专用皮革铠甲(男式)명사수의 가죽 갑옷 (남성용)
					case(8){itemString = `id:14060 `; iCumRate +=1;} //0.012545477神射手专用皮革铠甲(女式)명사수의 가죽 갑옷 (여성용)
					case(9){itemString = `id:16064 `; iCumRate +=1;} //0.012545477神射手专用皮革手套명사수의 가죽 건틀랫
					case(10){itemString = `id:17207 `; iCumRate +=1;} //0.012545477神射手专用皮革靴子명사수의 가죽 부츠
					case(11){itemString = `id:18273 `; iCumRate +=1;} //0.012545477神射手专用皮革头盔명사수의 가죽 헬맷
					case(12){itemString = `id:15470 `; iCumRate +=1;} //0.012545477休闲弹跳式便装캐주얼 점프슈트
					case(13){itemString = `id:15471 `; iCumRate +=1;} //0.012545477两件套工作服套装투피스 오버올 셋트
					case(14){itemString = `id:14051 `; iCumRate +=1;} //0.012545477精美盔甲（男式）아라시 익스퀴짓 아머 (남성용)
					case(15){itemString = `id:14052 `; iCumRate +=1;} //0.012545477精美盔甲（女式）아라시 익스퀴짓 아머 (여성용)
					case(16){itemString = `id:14053 `; iCumRate +=1;} //0.012545477精美盔甲（男巨人）아라시 익스퀴짓 아머 (자이언트 남성용)
					case(17){itemString = `id:14054 `; iCumRate +=1;} //0.012545477精美盔甲（女巨人）아라시 익스퀴짓 아머 (자이언트 여성용)
					case(18){itemString = `id:16545 `; iCumRate +=1;} //0.012545477精美手套（男式）아라시 익스퀴짓 건틀렛 (남성용)
					case(19){itemString = `id:16546 `; iCumRate +=1;} //0.012545477精美手套（女式）아라시 익스퀴짓 건틀렛 (여성용)
					case(20){itemString = `id:16547 `; iCumRate +=1;} //0.012545477精美手套（男巨人）아라시 익스퀴짓 건틀렛 (자이언트 남성용)
					case(21){itemString = `id:16548 `; iCumRate +=1;} //0.012545477精美手套（女巨人）아라시 익스퀴짓 건틀렛 (자이언트 여성용)
					case(22){itemString = `id:17531 `; iCumRate +=1;} //0.012545477精美护胫（男式）아라시 익스퀴짓 그리브 (남성용)
					case(23){itemString = `id:17532 `; iCumRate +=1;} //0.012545477精美护胫（女式）아라시 익스퀴짓 그리브 (여성용)
					case(24){itemString = `id:18586 `; iCumRate +=1;} //0.012545477精美头盔아라시 익스퀴짓 헬름
					case(25){itemString = `id:17205 `; iCumRate +=1;} //0.012545477方格矮腰靴체크무늬 앵클 부츠
					case(26){itemString = `id:19062 `; iCumRate +=1;} //0.012545477海象长袍（男式）바다코끼리 로브(남성용)
					case(27){itemString = `id:19063 `; iCumRate +=1;} //0.012545477海象长袍（女式）바다코끼리 로브(여성용)
					case(28){itemString = `id:40979 `; iCumRate +=1;} //0.012545477青铜镜像刀刃브론즈 미러 블레이드
					case(29){itemString = `id:19061 `; iCumRate +=1;} //0.012545477蘑菇长袍버섯버섯 로브
					case(30){itemString = `id:13060 `; iCumRate +=1;} //0.012545477龙鳞盔甲(女性用)드래곤 스케일 아머(여성용)
					case(31){itemString = `id:13061 `; iCumRate +=1;} //0.012545477龙鳞盔甲 (男性用)드래곤 스케일 아머 (남성용)
					case(32){itemString = `id:13062 `; iCumRate +=1;} //0.012545477龙鳞盔甲(巨人女性用)드래곤 스케일 아머(자이언트 여성용)
					case(33){itemString = `id:13063 `; iCumRate +=1;} //0.012545477龙鳞盔甲(巨人男性用)드래곤 스케일 아머(자이언트 남성용)
					case(34){itemString = `id:16543 `; iCumRate +=1;} //0.012545477龙鳞手套드래곤 스케일 건틀렛
					case(35){itemString = `id:16544 `; iCumRate +=1;} //0.012545477龙鳞手套(巨人用)드래곤 스케일 건틀렛(자이언트용)
					case(36){itemString = `id:17530 `; iCumRate +=1;} //0.012545477龙鳞护胫드래곤 스케일 그리브
					case(37){itemString = `id:18577 `; iCumRate +=1;} //0.012545477龙鳞头盔드래곤 스케일 헬름
					case(38){itemString = `id:46026 `; iCumRate +=2;} //0.025090955金属圆盾버클러
					case(39){itemString = `id:40313 `; iCumRate +=2;} //0.025090955 斩龙巨剑참룡검
					case(40){itemString = `id:18261 `; iCumRate +=2;} //0.025090955星星耳钉샤이닝 스타
					case(41){itemString = `id:40969 `; iCumRate +=2;} //0.025090955洋伞(Sunshade)양산
					case(42){itemString = `id:18570 `; iCumRate +=3;} //0.037636432妖精的翅膀(Wing Of Fairy)요정의 날개
					case(43){itemString = `id:16060 `; iCumRate +=3;} //0.037636432东方手镯(Oriental Bangle)오리엔탈 뱅글
					case(44){itemString = `id:16059 `; iCumRate +=1;} //0.012545477银星石手镯(Waveline Bangle)웨이브라인 뱅글
					case(45){itemString = `id:18571 `; iCumRate +=1;} //0.012545477三环耳钉(Silver Three Ring)실버 쓰리링 (양쪽)
					case(46){itemString = `id:18233 `; iCumRate +=1;} //0.012545477彩虹发带(Iris headdress)아이리스 헤드드레스
					case(47){itemString = `id:18574 `; iCumRate +=1;} //0.012545477Prince Crown왕자님 왕관
					case(48){itemString = `id:18575 `; iCumRate +=1;} //0.012545477Flower Corsage플라워 코사주
					case(49){itemString = `id:40252 `; iCumRate +=1;} //0.012545477Emission Lightning Wand이미션 라이트닝 원드
					case(50){itemString = `id:15352 `; iCumRate +=2;} //0.025090955飞龙武道服(男性)천룡지의(남성용)
					case(51){itemString = `id:15353 `; iCumRate +=1;} //0.012545477飞龙武道服(女性)천룡지의(여성용)
					case(52){itemString = `id:17139 `; iCumRate +=1;} //0.012545477飞龙武道靴천룡지화
					case(53){itemString = `id:13059 `; iCumRate +=1;} //0.012545477泰伦铠甲
					case(54){itemString = `id:17529 `; iCumRate +=2;} //0.025090955泰伦重靴
					case(55){itemString = `id:16542 `; iCumRate +=2;} //0.025090955泰伦护手
					case(56){itemString = `id:18569 `; iCumRate +=2;} //0.025090955devCAT头饰devCAT 모자
					case(57){itemString = `id:18237 `; iCumRate +=1;} //0.012545477迪克缝线口罩/Dick Stitch Mask딕 스티치 마스크
					case(58){itemString = `id:40250 `; iCumRate +=1;} //0.012545477Metal Fire Wand메탈 파이어 원드
					case(59){itemString = `id:18562 `; iCumRate +=1;} //0.012545477阿拉丁帽子/Aladdon’s cap
					case(60){itemString = `id:18563 `; iCumRate +=1;} //0.012545477茉莉公主面纱/Jasmine’s mask
					case(61){itemString = `id:17131 `; iCumRate +=1;} //0.012545477阿拉丁鞋/Aladdin’s shoes
					case(62){itemString = `id:15323 `; iCumRate +=1;} //0.012545477阿拉丁服饰알라딘 의상
					case(63){itemString = `id:15324 `; iCumRate +=1;} //0.012545477阿拉丁服饰알라딘 의상
					case(64){itemString = `id:17119 `; iCumRate +=4;} //0.050181909克劳斯骑士靴klaus knight boots
					case(65){itemString = `id:13050 `; iCumRate +=1;} //0.012545477克劳斯骑士盔甲klaus knight armor
					case(66){itemString = `id:16537 `; iCumRate +=5;} //0.062727387克劳斯骑士手套klaus knight Gauntlet
					case(67){itemString = `id:17527 `; iCumRate +=5;} //0.062727387丛林刺针护胫basil gimlet Greave
					case(68){itemString = `id:13051 `; iCumRate +=2;} //0.025090955丛林刺针盔甲basil gimlet armor
					case(69){itemString = `id:16538 `; iCumRate +=5;} //0.062727387丛林刺针手套basil gimlet Gauntlet
					case(70){itemString = `id:40170 `; iCumRate +=5;} //0.062727387武士刀일본식 양손검
					case(71){itemString = `id:40171 `; iCumRate +=1;} //0.012545477唐刀마사무네
					case(72){itemString = `id:14049 `; iCumRate +=1;} //0.012545477野蛮狐狸盔甲 (男性用)Kumataru's Barbarous Fox Armor
					case(73){itemString = `id:14050 `; iCumRate +=1;} //0.012545477野蛮狐狸盔甲 (女性用)Kumataru's Barbarous Fox Armor
					case(74){itemString = `id:16055 `; iCumRate +=3;} //0.037636432野蛮狐狸手套(男性用)Kumataru's Barbarous Fox Glove
					case(75){itemString = `id:16056 `; iCumRate +=3;} //0.037636432野蛮狐狸手套(女性用)Kumataru's Barbarous Fox Glove
					case(76){itemString = `id:14047 `; iCumRate +=1;} //0.012545477火花纹皮革盔甲(男性用)Blanche's Fire Emblem Light Leather Armor
					case(77){itemString = `id:14048 `; iCumRate +=1;} //0.012545477火花纹皮革盔甲(女性用)Blanche's Fire Emblem Light Leather Armor
					case(78){itemString = `id:16054 `; iCumRate +=3;} //0.037636432火花纹皮革手套Blanche's Fire Emblem Light Leather Glove
					case(79){itemString = `id:17130 `; iCumRate +=2;} //0.025090955火花纹皮革靴Blanche's Fire Emblem Light Leather Boots
					case(80){itemString = `id:18559 `; iCumRate +=1;} //0.012545477火花纹皮革帽Blanche's Fire Emblem Light Leather Cap
					case(81){itemString = `id:14039 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙铠（人类）차이나 드래곤 아머(인간)
					case(82){itemString = `id:14040 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙铠（精灵）차이나 드래곤 아머(엘프)
					case(83){itemString = `id:14041 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙铠（巨人）차이나 드래곤 아머(자이언트)
					case(84){itemString = `id:16532 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙护手（人类）차이나 드래곤 건틀렛(인간)
					case(85){itemString = `id:16535 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙护手（巨人）차이나 드래곤 건틀렛(자이언트)
					case(86){itemString = `id:16533 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙护手（精灵）차이나 드래곤 건틀렛(엘프)
					case(87){itemString = `id:17095 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙靴차이나 드래곤 부츠
					case(88){itemString = `id:18552 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477东方龙盔차이나 드래곤 헬름
					case(89){itemString = `id:13038 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477德斯汀银武士铠甲더스틴 실버 나이트 아머
					case(90){itemString = `id:16524 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477德斯汀银武士全臂铠甲더스틴 실버 나이트 뱀브레이스
					case(91){itemString = `id:17517 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477德斯汀银武士护胫더스틴 실버 나이트 그리브
					case(92){itemString = `id:13032 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(93){itemString = `id:13033 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(94){itemString = `id:13052 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（巨人用）발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(95){itemString = `id:16521 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(96){itemString = `id:17514 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(97){itemString = `id:14039 `; iCumRate +=3;} //0.037636432东方龙铠（人类）차이나 드래곤 아머(인간)
					case(98){itemString = `id:14040 `; iCumRate +=3;} //0.037636432东方龙铠（精灵）차이나 드래곤 아머(엘프)
					case(99){itemString = `id:14041 `; iCumRate +=3;} //0.037636432东方龙铠（巨人）차이나 드래곤 아머(자이언트)
					case(100){itemString = `id:16532 `; iCumRate +=3;} //0.037636432东方龙护手（人类）차이나 드래곤 건틀렛(인간)
					case(101){itemString = `id:16535 `; iCumRate +=3;} //0.037636432东方龙护手（巨人）차이나 드래곤 건틀렛(자이언트)
					case(102){itemString = `id:16533 `; iCumRate +=3;} //0.037636432东方龙护手（精灵）차이나 드래곤 건틀렛(엘프)
					case(103){itemString = `id:17095 `; iCumRate +=3;} //0.037636432东方龙靴차이나 드래곤 부츠
					case(104){itemString = `id:18552 `; iCumRate +=3;} //0.037636432东方龙盔차이나 드래곤 헬름
					case(105){itemString = `id:46004 `; iCumRate +=1;} //0.012545477锅냄비
					case(106){itemString = `id:15117 `; iCumRate +=1;} //0.012545477男性用魔法师正装남성용 마법사 정장
					case(107){itemString = `id:15116 `; iCumRate +=1;} //0.012545477女性用魔法师正装여성용 마법사 정장
					case(108){itemString = `id:13038 prefix:20729 suffix:31401`; iCumRate +=1;} //0.012545477德斯汀银武士铠甲더스틴 실버 나이트 아머
					case(109){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.012545477德斯汀银武士全臂铠甲더스틴 실버 나이트 뱀브레이스
					case(110){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.012545477德斯汀银武士护胫더스틴 실버 나이트 그리브
					case(111){itemString = `id:13032 prefix:20729 suffix:31401`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（女性用）발렌시아 크로스 라인 플레이트 아머(여성용)
					case(112){itemString = `id:13033 prefix:20729 suffix:31401`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（男性用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(113){itemString = `id:13052 prefix:20729 suffix:31401`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字铠（巨人用）발렌시아 크로스 라인 플레이트 아머(남성용)
					case(114){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字手套발렌시아 크로스 라인 플레이트 건틀렛
					case(115){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.012545477巴伦斯亚绚丽十字长靴발렌시아 크로스 라인 플레이트 부츠
					case(116){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=4;} //0.050181909龙剑드래곤 블레이드
					case(117){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=4;} //0.050181909神之刃双手剑클레이모어
					case(118){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=2;} //0.025090955皮制长弓레더 롱 보우
					case(119){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=5;} //0.062727387治疗魔杖힐링 원드
					case(120){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.025090955罗马短剑글라디우스
					case(121){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=2;} //0.025090955雷箭魔杖라이트닝 원드
					case(122){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=4;} //0.050181909冰箭魔杖아이스 원드
					case(123){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=4;} //0.050181909火箭魔杖파이어 원드
					case(124){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=5;} //0.062727387无属性魔杖타격용 원드
					case(125){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=4;} //0.050181909两刃斧비펜니스
					case(126){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.025090955权杖메이스
					case(127){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=4;} //0.050181909弩석궁
					case(128){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=3;} //0.037636432双手剑투 핸디드 소드
					case(129){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=3;} //0.037636432长弓롱 보우
					case(130){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=4;} //0.050181909守护之弓
					case(131){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=4;} //0.050181909复合型燕型盾牌 헤테로 카이트 실드
					case(132){itemString = `id:46010 col1:FF0000 col2:FF0000`; iCumRate +=1;} //0.012545477龙盾드래곤 실드
					case(133){itemString = `id:46024 col1:FF0000 col2:FF0000 col3:FF0000`; iCumRate +=1;} //0.012545477复合盾콤포짓 실드
					case(134){itemString = `id:46020 col1:FF0000 col2:FF0000 col3:FF0000`; iCumRate +=1;} //0.012545477巴勒斯盾발레스 실드
					case(135){itemString = `id:40224 col1:ffffff col2:ff0000`; iCumRate +=1;} //0.012545477环形弓링 보우
					case(136){itemString = `id:40225 col1:ffffff col2:ffffff`; iCumRate +=1;} //0.012545477윙보우윙 보우
					case(137){itemString = `id:40031 col1:ffffff`; iCumRate +=1;} //0.012545477弩석궁
					case(138){itemString = `id:40081 col1:ffffff col2:ff0000`; iCumRate +=1;} //0.012545477皮制长弓레더 롱 보우
					case(139){itemString = `id:40095 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477龙剑드래곤 블레이드
					case(140){itemString = `id:40033 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477神之刃双手剑클레이모어
					case(141){itemString = `id:40081 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477皮制长弓레더 롱 보우
					case(142){itemString = `id:40090 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477治疗魔杖힐링 원드
					case(143){itemString = `id:40080 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477罗马短剑글라디우스
					case(144){itemString = `id:40038 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477雷箭魔杖라이트닝 원드
					case(145){itemString = `id:40039 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477冰箭魔杖아이스 원드
					case(146){itemString = `id:40040 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477火箭魔杖파이어 원드
					case(147){itemString = `id:40041 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477无属性魔杖타격용 원드
					case(148){itemString = `id:40078 `; iCumRate +=2;} //0.025090955两刃斧비펜니스
					case(149){itemString = `id:40079 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477权杖메이스
					case(150){itemString = `id:40031 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477弩석궁
					case(151){itemString = `id:40030 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477双手剑투 핸디드 소드
					case(152){itemString = `id:40013 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477长弓롱 보우
					case(153){itemString = `id:40107 col1:FF3366 col2:FF3366 col3:FF3366`; iCumRate +=1;} //0.012545477守护之弓guardian bow
					case(154){itemString = `id:46007 `; iCumRate +=2;} //0.025090955复合型燕型盾牌 헤테로 카이트 실드
					case(155){itemString = `id:15298 `; iCumRate +=1;} //0.012545477骑兵校服아처리스 스쿨웨어
					case(156){itemString = `id:15267 `; iCumRate +=2;} //0.025090955歌德式小礼服테라 고딕 풀 드레스
					case(157){itemString = `id:15268 `; iCumRate +=2;} //0.025090955歌德式朋克套装테라 고딕 펑크 수트
					case(158){itemString = `id:15292 `; iCumRate +=2;} //0.025090955 남성용 수영복
					case(159){itemString = `id:15293 `; iCumRate +=2;} //0.025090955泳装男여성용 수영복
					case(160){itemString = `id:15294 `; iCumRate +=2;} //0.025090955泳装女남성용 수영복
					case(161){itemString = `id:15295 `; iCumRate +=2;} //0.025090955泳装男여성용 수영복
					case(162){itemString = `id:15296 `; iCumRate +=3;} //0.037636432泳装女남성용 수영복
					case(163){itemString = `id:15297 `; iCumRate +=3;} //0.037636432泳装男여성용 수영복
					case(164){itemString = `id:15203 `; iCumRate +=2;} //0.025090955科尔和服（女）여성용 유카타
					case(165){itemString = `id:15204 `; iCumRate +=2;} //0.025090955蒙戈和服（男）남성용 유카타
					case(166){itemString = `id:15224 `; iCumRate +=2;} //0.025090955科尔和服（男）남성용 유카타
					case(167){itemString = `id:15225 `; iCumRate +=2;} //0.025090955蒙戈和服（女）여성용 유카타
					case(168){itemString = `id:19005 `; iCumRate +=2;} //0.025090955神秘长袍머플러 로브
					case(169){itemString = `id:15217 `; iCumRate +=2;} //0.025090955可爱的连衣裙에이프런 원피스
					case(170){itemString = `id:18161 `; iCumRate +=2;} //0.025090955Devcat耳套데브캣 귀마개
					case(171){itemString = `id:18157 `; iCumRate +=2;} //0.025090955猫爪发卡고양이 귀 머리띠
					case(172){itemString = `id:15233 `; iCumRate +=2;} //0.025090955耶莱特高级连衣裙엘레건트 고딕 드레스
					case(173){itemString = `id:15234 `; iCumRate +=2;} //0.025090955耶莱特高级套装엘레건트 고딕 슈트
					case(174){itemString = `id:15235 `; iCumRate +=2;} //0.025090955耶莱特高级连衣裙엘레건트 고딕 드레스
					case(175){itemString = `id:16046 `; iCumRate +=1;} //0.012545477猫手套고양이 손 장갑
					case(176){itemString = `id:18187 `; iCumRate +=1;} //0.012545477大蝴蝶结커다란 리본
					case(177){itemString = `id:18188 `; iCumRate +=1;} //0.012545477独眼眼罩안대
					case(178){itemString = `id:18189 `; iCumRate +=1;} //0.012545477牛仔帽카우보이 모자
					case(179){itemString = `id:15252 `; iCumRate +=1;} //0.012545477男仆装집사 의상
					case(180){itemString = `id:15292 `; iCumRate +=1;} //0.012545477泳装女남성용 수영복
					case(181){itemString = `id:15293 `; iCumRate +=1;} //0.012545477泳装男여성용 수영복
					case(182){itemString = `id:15294 `; iCumRate +=1;} //0.012545477泳装女남성용 수영복
					case(183){itemString = `id:15295 `; iCumRate +=1;} //0.012545477泳装男여성용 수영복
					case(184){itemString = `id:15296 `; iCumRate +=1;} //0.012545477泳装女남성용 수영복
					case(185){itemString = `id:15297 `; iCumRate +=1;} //0.012545477泳装男여성용 수영복
					case(186){itemString = `id:15203 `; iCumRate +=1;} //0.012545477科尔和服（女）여성용 유카타
					case(187){itemString = `id:15204 `; iCumRate +=1;} //0.012545477蒙戈和服（男）남성용 유카타
					case(188){itemString = `id:15224 `; iCumRate +=1;} //0.012545477科尔和服（男）남성용 유카타
					case(189){itemString = `id:15225 `; iCumRate +=1;} //0.012545477蒙戈和服（女）여성용 유카타
					case(190){itemString = `id:19005 `; iCumRate +=1;} //0.012545477神秘长袍머플러 로브
					case(191){itemString = `id:18161 `; iCumRate +=1;} //0.012545477Devcat耳套데브캣 귀마개
					case(192){itemString = `id:18157 `; iCumRate +=1;} //0.012545477猫爪发卡고양이 귀 머리띠
					case(193){itemString = `id:15233 `; iCumRate +=2;} //0.025090955耶莱特高级连衣裙엘레건트 고딕 드레스
					case(194){itemString = `id:15234 `; iCumRate +=2;} //0.025090955耶莱特高级套装엘레건트 고딕 슈트
					case(195){itemString = `id:15235 `; iCumRate +=2;} //0.025090955耶莱特高级连衣裙엘레건트 고딕 드레스
					case(196){itemString = `id:62005 suffix:30918`; iCumRate +=30;} //0.376364321魔法释放卷轴-魔法男巫인챈트 스크롤
					case(197){itemString = `id:62005 suffix:30632`; iCumRate +=30;} //0.376364321魔法释放卷轴-狂暴骑士인챈트 스크롤
					case(198){itemString = `id:62005 suffix:30525`; iCumRate +=30;} //0.376364321魔法释放卷轴-魔法召唤者인챈트 스크롤
					case(199){itemString = `id:62005 suffix:30418`; iCumRate +=30;} //0.376364321魔法释放卷轴-毒狙击兵인챈트 스크롤
					case(200){itemString = `id:62005 prefix:20201`; iCumRate +=30;} //0.376364321魔法释放卷轴-坚固인챈트 스크롤
					case(201){itemString = `id:62005 suffix:30304`; iCumRate +=30;} //0.376364321魔法释放卷轴-灰狼인챈트 스크롤
					case(202){itemString = `id:62005 suffix:30702`; iCumRate +=30;} //0.376364321魔法释放卷轴-乌鸦인챈트 스크롤
					case(203){itemString = `id:62005 suffix:30704`; iCumRate +=30;} //0.376364321魔法释放卷轴-致命的인챈트 스크롤
					case(204){itemString = `id:62005 suffix:30801`; iCumRate +=30;} //0.376364321魔法释放卷轴-天然인챈트 스크롤
					case(205){itemString = `id:62005 suffix:30802`; iCumRate +=30;} //0.376364321魔法释放卷轴-反击인챈트 스크롤
					case(206){itemString = `id:62005 suffix:30803`; iCumRate +=30;} //0.376364321魔法释放卷轴-风车인챈트 스크롤
					case(207){itemString = `id:62005 suffix:30804`; iCumRate +=30;} //0.376364321魔法释放卷轴-重击인챈트 스크롤
					case(208){itemString = `id:62005 prefix:20405`; iCumRate +=30;} //0.376364321魔法释放卷轴-疯狂的인챈트 스크롤
					case(209){itemString = `id:62005 prefix:20501`; iCumRate +=30;} //0.376364321魔法释放卷轴-简单的인챈트 스크롤
					case(210){itemString = `id:62005 prefix:20602`; iCumRate +=30;} //0.376364321魔法释放卷轴-坚固的인챈트 스크롤
					case(211){itemString = `id:62005 prefix:20701`; iCumRate +=30;} //0.376364321魔法释放卷轴-猛烈的인챈트 스크롤
					case(212){itemString = `id:62005 suffix:30506`; iCumRate +=30;} //0.376364321魔法释放卷轴-可怕的인챈트 스크롤
					case(213){itemString = `id:62005 suffix:30614`; iCumRate +=30;} //0.376364321魔法释放卷轴-充满力量的인챈트 스크롤
					case(214){itemString = `id:62005 prefix:20108`; iCumRate +=30;} //0.376364321魔法释放卷轴-无翼鸟인챈트 스크롤
					case(215){itemString = `id:62005 prefix:20304`; iCumRate +=30;} //0.376364321魔法释放卷轴-鸵鸟인챈트 스크롤
					case(216){itemString = `id:62005 prefix:20209`; iCumRate +=30;} //0.376364321魔法释放卷轴-猫鼬인챈트 스크롤
					case(217){itemString = `id:62005 prefix:20409`; iCumRate +=30;} //0.376364321魔法释放卷轴-沙漠狐인챈트 스크롤
					case(218){itemString = `id:62005 prefix:20615`; iCumRate +=30;} //0.376364321魔法释放卷轴-沙漠蜘蛛인챈트 스크롤
					case(219){itemString = `id:62005 prefix:20508`; iCumRate +=30;} //0.376364321魔法释放卷轴-可疑的인챈트 스크롤
					case(220){itemString = `id:62005 prefix:20618`; iCumRate +=30;} //0.376364321魔法释放卷轴-犹豫的인챈트 스크롤
					case(221){itemString = `id:62005 prefix:20718`; iCumRate +=30;} //0.376364321魔法释放卷轴-奇怪的인챈트 스크롤
					case(222){itemString = `id:62005 prefix:20212`; iCumRate +=30;} //0.376364321魔法释放卷轴-怪异的인챈트 스크롤
					case(223){itemString = `id:62005 prefix:20412`; iCumRate +=30;} //0.376364321魔法释放卷轴-奇异的인챈트 스크롤
					case(224){itemString = `id:62005 prefix:20619`; iCumRate +=30;} //0.376364321魔法释放卷轴-奇特的인챈트 스크롤
					case(225){itemString = `id:62005 suffix:30616`; iCumRate +=30;} //0.376364321魔法释放卷轴-冷淡的인챈트 스크롤
					case(226){itemString = `id:62005 suffix:30617`; iCumRate +=30;} //0.376364321魔法释放卷轴-无情的인챈트 스크롤
					case(227){itemString = `id:62005 suffix:30618`; iCumRate +=30;} //0.376364321魔法释放卷轴-悲惨的인챈트 스크롤
					case(228){itemString = `id:62005 suffix:30515`; iCumRate +=25;} //0.313636934魔法释放卷轴-海盗的해적의
					case(229){itemString = `id:62005 prefix:20505`; iCumRate +=25;} //0.313636934魔法释放卷轴-蜥蜴리자드
					case(230){itemString = `id:62005 prefix:21007`; iCumRate +=25;} //0.313636934魔法释放卷轴-石南히스
					case(231){itemString = `id:62005 prefix:20625`; iCumRate +=25;} //0.313636934魔法释放卷轴-金针금속 바늘
					case(232){itemString = `id:62005 suffix:30624`; iCumRate +=25;} //0.313636934魔法释放卷轴-山查树산사나무
					case(233){itemString = `id:62005 prefix:20721`; iCumRate +=25;} //0.313636934魔法释放卷轴-休闲的한가한
					case(234){itemString = `id:62059 prefix:21013`; iCumRate +=30;} //0.376364321魔法释放卷轴-概念的개념의
					case(235){itemString = `id:62059 suffix:30922`; iCumRate +=30;} //0.376364321魔法释放卷轴-白马화이트호스
					case(236){itemString = `id:62005 suffix:31401`; iCumRate +=15;} //0.18818216魔法释放卷轴-复仇인챈트 스크롤-복수
					case(237){itemString = `id:62005 prefix:20825`; iCumRate +=15;} //0.18818216魔法释放卷轴-木针인챈트 스크롤-나무 바늘
					case(238){itemString = `id:62005 suffix:30901`; iCumRate +=15;} //0.18818216魔法释放卷轴-黑暗인챈트 스크롤-다크니스
					case(239){itemString = `id:62005 prefix:20734`; iCumRate +=15;} //0.18818216魔法释放卷轴-迅速인챈트 스크롤-스위프트
					case(240){itemString = `id:51003 count:10`; iCumRate +=40;} //0.501819094生命药水 50 点생명력 50 포션
					case(241){itemString = `id:51004 count:10`; iCumRate +=40;} //0.501819094生命药水 100 点생명력 100 포션
					case(242){itemString = `id:51007 count:10`; iCumRate +=20;} //0.250909547魔法药水 30 点마나 30 포션
					case(243){itemString = `id:51008 count:10`; iCumRate +=40;} //0.501819094魔法药水 50 点마나 50 포션
					case(244){itemString = `id:51013 count:10`; iCumRate +=20;} //0.250909547体力药水 50 点스태미나 50 포션
					case(245){itemString = `id:51014 count:10`; iCumRate +=40;} //0.501819094体力药水 100 点스태미나 100 포션
					case(246){itemString = `id:51001 count:10`; iCumRate +=20;} //0.250909547生命药水 10 点생명력 10 포션
					case(247){itemString = `id:51002 count:10`; iCumRate +=20;} //0.250909547生命药水 30 点생명력 30 포션
					case(248){itemString = `id:51022 count:10`; iCumRate +=20;} //0.250909547生命魔法药水 30 点생명력과 마나 30 포션
					case(249){itemString = `id:51027 count:10`; iCumRate +=20;} //0.250909547生命体力药水 30 点생명력과 스태미나 30 포션
					case(250){itemString = `id:51028 count:10`; iCumRate +=20;} //0.250909547生命体力药水 50 点생명력과 스태미나 50 포션
					case(251){itemString = `id:51029 count:10`; iCumRate +=40;} //0.501819094生命体力药水 100 点생명력과 스태미나 100 포션
					case(252){itemString = `id:63000 count:10`; iCumRate +=20;} //0.250909547凤凰羽毛피닉스의 깃털
					case(253){itemString = `id:60037 count:5`; iCumRate +=20;} //0.250909547黑色青春药水블랙 유스 포션
					case(254){itemString = `id:60038 count:5`; iCumRate +=20;} //0.250909547红色药水레드 포션
					case(255){itemString = `id:50012 count:5`; iCumRate +=20;} //0.250909547金鸡蛋황금 달걀
					case(256){itemString = `id:50013 count:5`; iCumRate +=20;} //0.250909547金苹果황금 사과
					case(257){itemString = `id:50541 quality:100`; iCumRate +=20;} //0.250909547意大利浓缩咖啡에스프레소
					case(258){itemString = `id:50542 quality:100`; iCumRate +=20;} //0.250909547意大利式泡沫牛奶에스프레소 마끼아또
					case(259){itemString = `id:50543 quality:100`; iCumRate +=20;} //0.250909547卡布奇诺카푸치노
					case(260){itemString = `id:50544 quality:100`; iCumRate +=20;} //0.250909547玛奇雅朵마끼아또
					case(261){itemString = `id:50545 quality:100`; iCumRate +=20;} //0.250909547摩卡咖啡카페 모카
					case(262){itemString = `id:50546 quality:100`; iCumRate +=20;} //0.250909547冰摩卡咖啡아이스 카페 모카
					case(263){itemString = `id:50547 quality:100`; iCumRate +=20;} //0.250909547冰玛奇雅朵아이스 마끼아또
					case(264){itemString = `id:50170 quality:100`; iCumRate +=20;} //0.250909547芝士酱치즈 퐁듀
					case(265){itemString = `id:50171 quality:100`; iCumRate +=20;} //0.250909547艾明玛恰红酒이멘 마하산 와인
					case(266){itemString = `id:50172 quality:100`; iCumRate +=20;} //0.250909547芝士蛋糕레어치즈 케익
					case(267){itemString = `id:50173 quality:100`; iCumRate +=20;} //0.250909547巧克力奶油蛋糕가토 오 쇼콜라
					case(268){itemString = `id:50174 quality:100`; iCumRate +=20;} //0.250909547火腿面包크로크 무슈
					case(269){itemString = `id:50175 quality:100`; iCumRate +=20;} //0.250909547核仁巧克力蛋糕브라우니
					case(270){itemString = `id:50176 quality:100`; iCumRate +=20;} //0.250909547奶油饼干버터 비스킷
					case(271){itemString = `id:18518 `; iCumRate +=30;} //0.376364321配龙金属头盔드래곤 크레스트
					case(272){itemString = `id:15113 `; iCumRate +=30;} //0.376364321女性用剑士学校校服短款여성용 검사학교 교복 쇼트타입
					case(273){itemString = `id:15114 `; iCumRate +=30;} //0.376364321男性用剑士学校校服长款남성용 검사학교 교복 롱타입
					case(274){itemString = `id:15065 `; iCumRate +=30;} //0.376364321爱拉背心短裙엘라 베스트 스커트
					case(275){itemString = `id:19008 `; iCumRate +=30;} //0.376364321可可熊猫长袍코코 판다 로브
					case(276){itemString = `id:15137 `; iCumRate +=30;} //0.376364321萨丽娜短夹克셀리나 하프 재킷 코트
					case(277){itemString = `id:18041 `; iCumRate +=30;} //0.376364321羽毛法师帽큰 챙 깃털 모자
					case(278){itemString = `id:19009 `; iCumRate +=30;} //0.376364321可可兔子长袍코코 래빗 로브
					case(279){itemString = `id:18112 `; iCumRate +=30;} //0.376364321太阳伪装装饰해 분장 소품
					case(280){itemString = `id:18111 `; iCumRate +=30;} //0.376364321树伪装装饰나무 분장 소품
					case(281){itemString = `id:18110 `; iCumRate +=30;} //0.376364321草丛伪装装饰덤불 분장 소품
					case(282){itemString = `id:18109 `; iCumRate +=30;} //0.376364321娜儿伪装装饰나오 분장 소품
					case(283){itemString = `id:18108 `; iCumRate +=30;} //0.376364321岩石伪装装饰바위 분장 소품
					case(284){itemString = `id:40083 `; iCumRate +=30;} //0.376364321钩状弯刀훅 커틀러스
					case(285){itemString = `id:40032 `; iCumRate +=30;} //0.376364321翼魔剑가고일 소드
					case(286){itemString = `id:18544 `; iCumRate +=30;} //0.376364321骑士金属头盔펠리칸 프로텍터
					case(287){itemString = `id:18547 `; iCumRate +=30;} //0.376364321羽毛金属头盔파나쉬 헤드 프로텍터
					case(288){itemString = `id:18521 `; iCumRate +=30;} //0.376364321卫兵金属头盔유러피안 컴프
					case(289){itemString = `id:18500 `; iCumRate +=30;} //0.376364321护颈头盔링 메일 헬름
					case(290){itemString = `id:18511 `; iCumRate +=30;} //0.376364321凹槽盔플루트 풀 헬름
					case(291){itemString = `id:18502 `; iCumRate +=30;} //0.376364321骨头盔본 헬름
					case(292){itemString = `id:19007 `; iCumRate +=30;} //0.376364321夜光长袍야광 머플러 로브
					case(293){itemString = `id:19017 `; iCumRate +=30;} //0.376364321狼长袍늑대 로브
					case(294){itemString = `id:19016 `; iCumRate +=30;} //0.376364321熊长袍곰 로브
					case(295){itemString = `id:15112 `; iCumRate +=30;} //0.376364321萨丽娜校服셀리나 스쿨보이룩
					case(296){itemString = `id:18034 `; iCumRate +=30;} //0.376364321科尔蓓蕾帽볼륨 베레모
					case(297){itemString = `id:18006 `; iCumRate +=30;} //0.376364321魔法师帽子마법사모자
					case(298){itemString = `id:18113 `; iCumRate +=30;} //0.376364321尖耳小猫帽子뾰족귀 고양이 모자
					case(299){itemString = `id:18114 `; iCumRate +=30;} //0.376364321猫脸小猫帽子줄무늬 고양이 모자
					case(300){itemString = `id:18115 `; iCumRate +=30;} //0.376364321鱼型小猫帽子핀 고양이 모자
					case(301){itemString = `id:18097 `; iCumRate +=30;} //0.376364321赛连羽翼面具세이렌 깃털 가면
					case(302){itemString = `id:18098 `; iCumRate +=30;} //0.376364321赛连眼镜세이렌의 안경
					case(303){itemString = `id:18099 `; iCumRate +=30;} //0.376364321赛连小翅膀面具세이렌 작은 날개 가면
					case(304){itemString = `id:18100 `; iCumRate +=30;} //0.376364321赛连翅膀面具세이렌 날개 가면
					case(305){itemString = `id:18101 `; iCumRate +=30;} //0.376364321赛连蝙蝠面具세이렌 박쥐 날개 가면
					case(306){itemString = `id:18102 `; iCumRate +=30;} //0.376364321赛连面具세이렌의 가면
					case(307){itemString = `id:15055 `; iCumRate +=30;} //0.376364321赛连猫面具세이렌 고양이 가면
					case(308){itemString = `id:18044 `; iCumRate +=30;} //0.376364321罪人用面具범죄용 복면
					case(309){itemString = `id:40071 `; iCumRate +=30;} //0.376364321‘拉’音瓶'라' 음 빈 병
					case(310){itemString = `id:40072 `; iCumRate +=30;} //0.376364321‘西’音瓶'시' 음 빈 병
					case(311){itemString = `id:40073 `; iCumRate +=30;} //0.376364321‘哆’音瓶'도' 음 빈 병
					case(312){itemString = `id:40074 `; iCumRate +=30;} //0.376364321‘来’音瓶'레' 음 빈 병
					case(313){itemString = `id:40075 `; iCumRate +=30;} //0.376364321‘咪’音瓶'미' 음 빈 병
					case(314){itemString = `id:40076 `; iCumRate +=30;} //0.376364321‘发’音瓶'파' 음 빈 병
					case(315){itemString = `id:40077 `; iCumRate +=30;} //0.376364321‘嗦’音瓶'솔' 음 빈 병
					case(316){itemString = `id:16517 `; iCumRate +=30;} //0.376364321反对手套반대 장갑
					case(317){itemString = `id:16516 `; iCumRate +=30;} //0.376364321赞成手套찬성 장갑
					case(318){itemString = `id:16515 `; iCumRate +=30;} //0.376364321布手套보 장갑
					case(319){itemString = `id:16514 `; iCumRate +=30;} //0.376364321石头手套바위 장갑
					case(320){itemString = `id:16513 `; iCumRate +=30;} //0.376364321剪子手套가위 장갑
					case(321){itemString = `id:40068 `; iCumRate +=30;} //0.376364321剪刀拳가위 모양 지시봉
					case(322){itemString = `id:40069 `; iCumRate +=30;} //0.376364321石头拳바위 모양 지시봉
					case(323){itemString = `id:40070 `; iCumRate +=30;} //0.376364321布型指挥棒보 모양 지시봉
					case(324){itemString = `id:17015 `; iCumRate +=30;} //0.376364321格斗靴Combat Shoes
					case(325){itemString = `id:15055 `; iCumRate +=30;} //0.376364321星星迷你裙레더 미니 원피스
					case(326){itemString = `id:15057 `; iCumRate +=30;} //0.376364321无光皮外套롱 레더 코트 (무광)
					case(327){itemString = `id:18040 `; iCumRate +=30;} //0.376364321科尔铃铛帽코레스 꼭지 베레모
					case(328){itemString = `id:80000 `; iCumRate +=30;} //0.376364321娜儿的黑衣服나오의 검은 옷
					case(329){itemString = `id:80001 `; iCumRate +=30;} //0.376364321茹娅的衣服루아의 옷
					case(330){itemString = `id:80002 `; iCumRate +=30;} //0.376364321粉色外套핑크색 코트
					case(331){itemString = `id:80003 `; iCumRate +=30;} //0.376364321黑色外套검은색 코트
					case(332){itemString = `id:80004 `; iCumRate +=30;} //0.376364321娜儿的黄色春装나오의 노란색 봄 옷
					case(333){itemString = `id:80005 `; iCumRate +=30;} //0.376364321娜儿的白色春装나오의 하얀색 봄 옷
					case(334){itemString = `id:80006 `; iCumRate +=30;} //0.376364321娜儿的粉色春装나오의 핑크색 봄 옷
					case(335){itemString = `id:18056 `; iCumRate +=30;} //0.376364321星星兔耳发箍1  (不可修理)별 토끼 머리띠1
					case(336){itemString = `id:18057 `; iCumRate +=30;} //0.376364321星星兔耳发箍2  (不可修理)별 토끼 머리띠2
					case(337){itemString = `id:18058 `; iCumRate +=30;} //0.376364321星星兔耳发箍3 (不可修理)별 토끼 머리띠3
					case(338){itemString = `id:18059 `; iCumRate +=30;} //0.376364321星星兔耳发箍4 (不可修理)별 토끼 머리띠4
					case(339){itemString = `id:18060 `; iCumRate +=30;} //0.376364321星星兔耳发箍5 (不可修理)별 토끼 머리띠5
					case(340){itemString = `id:18061 `; iCumRate +=30;} //0.376364321毛绒兔耳发箍1  (不可修理)털 토끼 머리띠1
					case(341){itemString = `id:18062 `; iCumRate +=30;} //0.376364321毛绒兔耳发箍2  (不可修理)털 토끼 머리띠2
					case(342){itemString = `id:18063 `; iCumRate +=30;} //0.376364321毛绒兔耳发箍3  (不可修理)털 토끼 머리띠3
					case(343){itemString = `id:18064 `; iCumRate +=30;} //0.376364321毛绒兔耳发箍4  (不可修理)털 토끼 머리띠4
					case(344){itemString = `id:18065 `; iCumRate +=30;} //0.376364321毛绒兔耳发箍5  (不可修理)털 토끼 머리띠5
					case(345){itemString = `id:18066 `; iCumRate +=30;} //0.376364321皮革兔耳发箍1  (不可修理)가죽 토끼 머리띠1
					case(346){itemString = `id:18067 `; iCumRate +=30;} //0.376364321皮革兔耳发箍2  (不可修理)가죽 토끼 머리띠2
					case(347){itemString = `id:18068 `; iCumRate +=30;} //0.376364321皮革兔耳发箍3 (不可修理)가죽 토끼 머리띠3
					case(348){itemString = `id:18069 `; iCumRate +=30;} //0.376364321皮革兔耳发箍4 (不可修理)가죽 토끼 머리띠4
					case(349){itemString = `id:18070 `; iCumRate +=30;} //0.376364321皮革兔耳发箍5 (不可修理)가죽 토끼 머리띠5
					case(350){itemString = `id:14036 `; iCumRate +=30;} //0.376364321迪奥斯铠甲(男性用)티오즈 아머(남성용)
					case(351){itemString = `id:14037 `; iCumRate +=30;} //0.376364321迪奥斯铠甲(女性用)티오즈 아머(여성용)
					case(352){itemString = `id:16531 `; iCumRate +=30;} //0.376364321迪奥斯手套티오즈 건틀렛
					case(353){itemString = `id:17523 `; iCumRate +=30;} //0.376364321迪奥斯长靴티오즈 그리브
					case(354){itemString = `id:15132 `; iCumRate +=30;} //0.376364321天然高级男装내추럴 베스트 웨어
					case(355){itemString = `id:15070 `; iCumRate +=30;} //0.376364321路易斯猎人服스탠드칼라 슬리브리스
					case(356){itemString = `id:15230 `; iCumRate +=30;} //0.376364321格伦达短裙가르텐 글렌 체크 스커트
					case(357){itemString = `id:19034 `; iCumRate +=30;} //0.376364321精致羽毛长袍가르텐 클로스 오버코트
					case(358){itemString = `id:40033 `; iCumRate +=30;} //0.376364321神之刃双手剑클레이모어
					case(359){itemString = `id:40011 `; iCumRate +=30;} //0.376364321阔剑브로드 소드
					case(360){itemString = `id:40030 `; iCumRate +=30;} //0.376364321双手剑투 핸디드 소드
					case(361){itemString = `id:40012 `; iCumRate +=30;} //0.376364321变形剑바스타드 소드
					case(362){itemString = `id:40007 `; iCumRate +=30;} //0.376364321单手斧한손도끼
					case(363){itemString = `id:40014 `; iCumRate +=30;} //0.376364321复合弓콤포짓 보우
					case(364){itemString = `id:40078 `; iCumRate +=30;} //0.376364321两刃斧비펜니스
					case(365){itemString = `id:40080 `; iCumRate +=30;} //0.376364321罗马短剑글라디우스
					case(366){itemString = `id:40006 `; iCumRate +=30;} //0.376364321匕首단검
					case(367){itemString = `id:40031 `; iCumRate +=30;} //0.376364321弩석궁
					case(368){itemString = `id:40081 `; iCumRate +=30;} //0.376364321皮制长弓레더 롱 보우
					case(369){itemString = `id:40079 `; iCumRate +=30;} //0.376364321权杖메이스
					case(370){itemString = `id:13043 `; iCumRate +=30;} //0.376364321蕾米妮雅圣月铠甲(男性用)레미니아 성월의 갑옷(남성용)
					case(371){itemString = `id:13044 `; iCumRate +=30;} //0.376364321蕾米妮雅圣月铠甲(女性用)레미니아 성월의 갑옷(여성용)
					case(372){itemString = `id:13045 `; iCumRate +=30;} //0.376364321艾斯休宾铠甲(男性用)아리쉬 아슈빈 아머(남성용)
					case(373){itemString = `id:13046 `; iCumRate +=30;} //0.376364321艾斯休宾铠甲(女性用)아리쉬 아슈빈 아머(여성용)
					case(374){itemString = `id:14019 `; iCumRate +=30;} //0.376364321优美的金属铠甲그레이스 플레이트 아머
					case(375){itemString = `id:13031 `; iCumRate +=30;} //0.376364321银光金属盔甲스파이카 실버 플레이트 아머
					case(376){itemString = `id:13022 `; iCumRate +=30;} //0.376364321硬皮甲 (P类型)로즈 플레이트 아머 (P타입)
					case(377){itemString = `id:40039 `; iCumRate +=30;} //0.376364321冰箭魔杖아이스 원드
					case(378){itemString = `id:40090 `; iCumRate +=30;} //0.376364321治疗魔杖힐링 원드
					case(379){itemString = `id:40040 `; iCumRate +=30;} //0.376364321火箭魔杖파이어 원드
					case(380){itemString = `id:40038 `; iCumRate +=30;} //0.376364321雷箭魔杖라이트닝 원드
					case(381){itemString = `id:18542 `; iCumRate +=30;} //0.376364321巨链盔빅 체인 풀 헬름
					case(382){itemString = `id:18506 `; iCumRate +=30;} //0.376364321翼盔윙 하프 헬름
					case(383){itemString = `id:14042 `; iCumRate +=30;} //0.376364321凯斯汀皮革铠甲컬스틴 레더 아머
					case(384){itemString = `id:15155 `; iCumRate +=30;} //0.376364321Yidikai圣职者礼服(男性用)이디카이 성직자 예복(남성용)
					case(385){itemString = `id:15156 `; iCumRate +=30;} //0.376364321Yidikai圣职者礼服(女性用)이디카이 성직자 예복(여성용)
					case(386){itemString = `id:15151 `; iCumRate +=30;} //0.376364321纽约玛里奥收腰礼服(男性用)뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(387){itemString = `id:15152 `; iCumRate +=30;} //0.376364321纽约玛里奥收腰礼服(女性用)뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(388){itemString = `id:15153 `; iCumRate +=30;} //0.376364321桑德拉狙击手服(男性用)산드라 스나이퍼 수트(남성용)
					case(389){itemString = `id:15154 `; iCumRate +=30;} //0.376364321桑德拉狙击手服(女性用)산드라 스나이퍼 수트(여성용)
					case(390){itemString = `id:15157 `; iCumRate +=30;} //0.376364321威斯保卫军衣服(男性用)위스 보위군 의복(남성용)
					case(391){itemString = `id:15158 `; iCumRate +=30;} //0.376364321威斯保卫军衣服(女性用)위스 보위군 의복(여성용)
					case(392){itemString = `id:15115 `; iCumRate +=30;} //0.376364321不对称迷你裙子재기드 미니 스커트
					case(393){itemString = `id:15059 `; iCumRate +=30;} //0.376364321吊带短裤터크스 탱크탑 반바지
					case(394){itemString = `id:15070 `; iCumRate +=30;} //0.376364321科尔迷你裙아이돌 리본 드레스
					case(395){itemString = `id:15074 `; iCumRate +=30;} //0.376364321路易斯牧师服루이스 성직자 코트
					case(396){itemString = `id:15061 `; iCumRate +=30;} //0.376364321路易斯束腰服물결무늬 옆트임 튜닉
					case(397){itemString = `id:18045 `; iCumRate +=30;} //0.376364321星星法师帽별장식 마법사 모자
					case(398){itemString = `id:18019 `; iCumRate +=30;} //0.376364321丽琳羽毛帽子리리나 깃털모자
					case(399){itemString = `id:18020 `; iCumRate +=30;} //0.376364321蒙戈羽毛帽子몬거 깃털모자
					case(400){itemString = `id:18029 `; iCumRate +=30;} //0.376364321带框眼镜나무테 안경
					case(401){itemString = `id:18028 `; iCumRate +=30;} //0.376364321轻便眼镜접이식 안경
					case(402){itemString = `id:16500 `; iCumRate +=30;} //0.376364321保护手套울나 프로텍터 글러브
					case(403){itemString = `id:40053 `; iCumRate +=30;} //0.376364321一束紫色玫瑰보라빛 장미 꽃다발
					case(404){itemString = `id:40054 `; iCumRate +=30;} //0.376364321一朵紫色玫瑰보라빛 장미 한송이
					case(405){itemString = `id:18089 `; iCumRate +=30;} //0.376364321紫玫瑰花装饰보라빛 장미 장식
					case(406){itemString = `id:40052 `; iCumRate +=30;} //0.376364321一朵蓝色玫瑰파란 장미 한송이
					case(407){itemString = `id:18090 `; iCumRate +=30;} //0.376364321蓝玫瑰花装饰파란 장미 장식
					case(408){itemString = `id:18086 `; iCumRate +=30;} //0.376364321雏菊花装饰데이지 꽃 장식
					case(409){itemString = `id:18087 `; iCumRate +=30;} //0.376364321玫瑰花装饰장미 꽃 장식
					case(410){itemString = `id:13010 `; iCumRate +=30;} //0.376364321圆形链甲라운드 폴드론 체인메일
					case(411){itemString = `id:14025 `; iCumRate +=30;} //0.376364321卡迈意念铠甲(男性用)카멜 스피리트 아머(남성용)
					case(412){itemString = `id:14026 `; iCumRate +=30;} //0.376364321卡迈意念铠甲(女性用)카멜 스피리트 아머(여성용)
					case(413){itemString = `id:16028 `; iCumRate +=30;} //0.376364321卡迈意念手套카멜 스피리트 글러브
					case(414){itemString = `id:16511 `; iCumRate +=30;} //0.376364321银光手套실버 티니 글러브
					case(415){itemString = `id:17064 `; iCumRate +=30;} //0.376364321卡迈意念靴子카멜 스피리트 부츠
					case(416){itemString = `id:15131 `; iCumRate +=30;} //0.376364321蕾丝吊带裙핀 에이프런 스커트
					case(417){itemString = `id:2006 `; iCumRate +=30;} //0.376364321大金币囊큰 금화 주머니
					case(418){itemString = `id:16534 `; iCumRate +=30;} //0.376364321凯斯汀皮革护手컬스틴 레더 건틀렛
					case(419){itemString = `id:17524 `; iCumRate +=30;} //0.376364321凯斯汀皮革鞋컬스틴 레더 부츠
					case(420){itemString = `id:13047 `; iCumRate +=30;} //0.376364321凯利诺斯金属铠甲(男性用)키리누스진 하프 플레이트 아머(남성용)
					case(421){itemString = `id:13048 `; iCumRate +=30;} //0.376364321凯利诺斯金属铠甲(女性用)키리누스진 하프 플레이트 아머(여성용)
					case(422){itemString = `id:14013 `; iCumRate +=30;} //0.376364321古罗马胸甲로리카 세그먼타타에
					case(423){itemString = `id:14035 `; iCumRate +=30;} //0.376364321佩乐皮革盔甲피르타 레더 아머
					case(424){itemString = `id:14038 `; iCumRate +=30;} //0.376364321雪原银铠甲B类型(女性用)피르타 레더 아머 B타입(여성용)
					case(425){itemString = `id:15014 `; iCumRate +=30;} //0.376364321使者衣파발꾼의 옷
					case(426){itemString = `id:15028 `; iCumRate +=30;} //0.376364321科尔盗贼服코레스 씨프슈트
					case(427){itemString = `id:15042 `; iCumRate +=30;} //0.376364321高领子连衣裙롱넥 원피스
					case(428){itemString = `id:15052 `; iCumRate +=30;} //0.376364321男性束腰装터크스 투톤 튜닉
					case(429){itemString = `id:15053 `; iCumRate +=30;} //0.376364321贵妇装플랫칼라 원피스
					case(430){itemString = `id:15128 `; iCumRate +=30;} //0.376364321魔法淑女裙투 톤 비조 드레스
					case(431){itemString = `id:17040 `; iCumRate +=30;} //0.376364321爱拉系带靴엘라 스트랩 부츠
					case(432){itemString = `id:17041 `; iCumRate +=30;} //0.376364321路易斯高筒靴덩굴무늬 헌팅부츠
					case(433){itemString = `id:17045 `; iCumRate +=30;} //0.376364321帅气长靴브이 넥 라인 레더 부츠
					case(434){itemString = `id:18008 `; iCumRate +=30;} //0.376364321条纹帽스트라이프 캡
					case(435){itemString = `id:18023 `; iCumRate +=30;} //0.376364321蒙戈盗贼帽子몬거 씨프 캡
					case(436){itemString = `id:18038 `; iCumRate +=30;} //0.376364321路易斯卫兵帽깃털 배렛 모자
					case(437){itemString = `id:18047 `; iCumRate +=30;} //0.376364321科尔花边帽코레스 펠트 모자
					case(438){itemString = `id:18513 `; iCumRate +=30;} //0.376364321铁钉盔스파이크 캡
					case(439){itemString = `id:18515 `; iCumRate +=30;} //0.376364321牛角金属头盔트윈 혼 캡
					case(440){itemString = `id:18525 `; iCumRate +=30;} //0.376364321水滴金属头盔워터드롭 캡
					case(441){itemString = `id:18543 `; iCumRate +=30;} //0.376364321完整的铁盔슬릿 풀 헬름
					case(442){itemString = `id:19020 `; iCumRate +=30;} //0.376364321娜塔内雪山用外套나타네 설산용 코트
					case(443){itemString = `id:19029 `; iCumRate +=30;} //0.376364321巨人贝尔长袍자이언트 베어 로브
					case(444){itemString = `id:40015 `; iCumRate +=30;} //0.376364321带凹槽的短剑플루트 숏 소드
					case(445){itemString = `id:40081 `; iCumRate +=30;} //0.376364321长弓롱 보우
					case(446){itemString = `id:46001 `; iCumRate +=30;} //0.376364321圆盾라운드 실드
					case(447){itemString = `id:46006 `; iCumRate +=30;} //0.376364321燕型盾牌카이트 실드
					case(448){itemString = `id:40172 `; iCumRate +=30;} //0.376364321巨剑그레이트 소드
					case(449){itemString = `id:40174 `; iCumRate +=30;} //0.376364321钉锤모닝스타
					case(450){itemString = `id:40177 `; iCumRate +=30;} //0.376364321长柄巨斧워리어 액스
					case(451){itemString = `id:40180 `; iCumRate +=30;} //0.376364321圆锥拳套홉네일 너클
					case(452){itemString = `id:40041 `; iCumRate +=30;} //0.376364321打击用魔杖타격용 원드
					case(453){itemString = `id:40010 `; iCumRate +=30;} //0.376364321长剑롱 소드
					case(454){itemString = `id:40002 `; iCumRate +=30;} //0.376364321木剑연습용 목도
					case(455){itemString = `id:16523 `; iCumRate +=30;} //0.376364321优美的手套그레이스 건틀렛
					case(456){itemString = `id:17515 `; iCumRate +=30;} //0.376364321优美的护胫그레이스 그리브
					case(457){itemString = `id:18545 `; iCumRate +=30;} //0.376364321优美的头盔그레이스 헬멧
					case(458){itemString = `id:46012 `; iCumRate +=30;} //0.376364321青铜盾牌청동 방패
					case(459){itemString = `id:46007 `; iCumRate +=30;} //0.376364321复合型燕型盾牌 헤테로 카이트 실드
					case(460){itemString = `id:46008 `; iCumRate +=30;} //0.376364321廉价复合型燕型盾牌라이트 헤테로 카이트 실드
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
					GiveTreasureChestItem(player,itemString,itemID);
					bGameTreasureChest = true;
				}
				if(bGameTreasureChest)
				{
					break;
				}

				++i;
			}
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void GiveItemByPremiumKey(character player, int itemID)
// : 고급 상자 열쇠를 사용했을 때 주는 아이템
////////////////////////////////////////////////////////////////////////////////
{
	// 고급 열쇠를 사용했다면 캐쉬 아이템을 추가로 준다.
	if (itemID == 91038 || itemID == 91039 || itemID == 91045 || itemID == 91046)
	{
		int iCumRate = 0;			// 확률을 누적해놓는 변수
		int i = 0;

		if (GetLocale().LowerCase() == `taiwan`)
		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0) {itemString = `id:63043 count:2`; iCumRate += 5;}	// 5 어드밴스드 깃털
					case(1) {itemString = `id:63044 count:2`; iCumRate += 5;}	// 5 파티부활의 깃털
					case(2) {itemString = `id:51031 count:2`; iCumRate += 5;}	// 5 완전 회복의 포션
					case(3) {itemString = `id:63064 count:2`; iCumRate += 6;}	// 6 하트 모양 불꽃놀이 키트
					case(4) {itemString = `id:63025`; iCumRate += 4;}	// 4 대용량 축복의 포션
					case(5) {itemString = `id:91005 expire:43200`; iCumRate += 4;}	// 4 전투력 약화 포션
					case(6) {itemString = `id:63026 count:2`; iCumRate += 5;}	// 5 원격 은행 이용권
					case(7) {itemString = `id:63047 count:2`; iCumRate += 5;}	// 5 원격 힐러집 이용권
					case(8) {itemString = `id:63024 expire:10080`; iCumRate += 5;}	// 5 염색 앰플
					case(9) {itemString = `id:91002 expire:43200`; iCumRate += 5;}	// 5 마나 부스트 포션
					case(10) {itemString = `id:91003 expire:43200`; iCumRate += 5;}	// 5 스태미나 부스트 포션
					case(11) {itemString = `id:91004 expire:43200`; iCumRate += 5;}	// 5 보호와 방어 부스트 포션
					case(12) {itemString = `id:91001 expire:43200`; iCumRate += 5;}	// 5 생명력 부스트 포션
					case(13) {itemString = `id:63029 count:2`; iCumRate += 9;}	// 9 캠프파이어 키트
					case(14) {itemString = `id:91007`; iCumRate += 10;}	// 10 17살의 키가 되는 포션
					case(15) {itemString = `id:91006`; iCumRate += 7;}	// 7 10살의 키가 되는 포션
					case(16) {itemString = `id:45014 count:1000`; iCumRate += 5;}	// 5 1000개들이 화살
					case(17) {itemString = `id:45015 count:1000`; iCumRate += 5;}	// 5 1000개들이 볼트
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
					GiveTreasureChestItem(player,itemString,itemID);
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:63043 count:2`; iCumRate += 7;}	// 6.00%	어드밴스드 깃털
					case(1){itemString = `id:63044 count:4`; iCumRate += 7;}	// 6.00%	파티 부활의 깃털
					case(2){itemString = `id:51031 count:3`; iCumRate += 7;}	// 6.00%	완전 회복의 포션
					case(3){itemString = `id:63025 count:2`; iCumRate += 6;}	// 5.00%	대용량 축복의 포션
					case(4){itemString = `id:91005`; iCumRate += 6 ;}	// 5.00%	전투력 약화 포션
					case(5){itemString = `id:63026 count:4`; iCumRate += 8 ;}	// 7.00%	원격 은행 이용권
					case(6){itemString = `id:63047 count:4`; iCumRate += 8 ;}	// 7.00%	원격 힐러집 이용권
					case(7){itemString = `id:63056 count:4`; iCumRate += 8 ;}	// 7.00%	원격 대장간 수리 이용권
					case(8){itemString = `id:63024 expire:10080`; iCumRate += 6 ;}	// 5.00%	염색 앰플
					case(9){itemString = `id:63029	count:2`; iCumRate += 7 ;}	// 5.00%	캠프파이어 키트
					case(10){itemString = `id:91007`; iCumRate += 6;}	// 6.00%	17살의 키가 되는 포션
					case(11){itemString = `id:91006`; iCumRate += 6;}	// 6.00%	10살의 키가 되는 포션
					case(12){itemString = `id:91066`; iCumRate += 6;}	// 5.00%	정령 무기 수리 포션 (1~5)
					case(13){itemString = `id:91070	count:2`; iCumRate += 6;}	// 5.00%	물리 공격력 증가 포션 (30분)
					case(14){itemString = `id:91068`; iCumRate += 6;}	// 5.00%	집결의 뿔피리
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
					GiveTreasureChestItem(player,itemString,itemID);
					return;
				}

				++i;
			}
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			int iRandom = Random(100);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:63043 count:2`; iCumRate += 7;}	// 6.00%	어드밴스드 깃털
					case(1){itemString = `id:63044 count:4`; iCumRate += 7;}	// 6.00%	파티 부활의 깃털
					case(2){itemString = `id:51031 count:3`; iCumRate += 7;}	// 6.00%	완전 회복의 포션
					case(3){itemString = `id:63025 count:2`; iCumRate += 6;}	// 5.00%	대용량 축복의 포션
					case(4){itemString = `id:91005`; iCumRate += 6 ;}	// 5.00%	전투력 약화 포션
					case(5){itemString = `id:63026 count:4`; iCumRate += 8 ;}	// 7.00%	원격 은행 이용권
					case(6){itemString = `id:63047 count:4`; iCumRate += 8 ;}	// 7.00%	원격 힐러집 이용권
					case(7){itemString = `id:63056 count:4`; iCumRate += 8 ;}	// 7.00%	원격 대장간 수리 이용권
					case(8){itemString = `id:63024 expire:10080`; iCumRate += 6 ;}	// 5.00%	염색 앰플
					case(9){itemString = `id:63029	count:2`; iCumRate += 7 ;}	// 5.00%	캠프파이어 키트
					case(10){itemString = `id:91007`; iCumRate += 6;}	// 6.00%	17살의 키가 되는 포션
					case(11){itemString = `id:91006`; iCumRate += 6;}	// 6.00%	10살의 키가 되는 포션
					case(12){itemString = `id:91066`; iCumRate += 6;}	// 5.00%	정령 무기 수리 포션 (1~5)
					case(13){itemString = `id:91070	count:2`; iCumRate += 6;}	// 5.00%	물리 공격력 증가 포션 (30분)
					case(14){itemString = `id:91068`; iCumRate += 6;}	// 5.00%	집결의 뿔피리
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
					GiveTreasureChestItem(player,itemString,itemID);
					return;
				}

				++i;
			}
		}
		else
		{
			int iRandom = Random(99);		// 확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(	0	) { itemString = `id:63043 count:2`; iCumRate += 	4	; } //	어드밴스드 깃털	(	4	%)
					case(	1	) { itemString = `id:63044 count:4`; iCumRate += 	4	; } //	파티 부활의 깃털	(	4	%)
					case(	2	) { itemString = `id:51031 count:3`; iCumRate += 	4	; } //	완전 회복의 포션	(	4	%)
					case(	3	) { itemString = `id:63064 count:4`; iCumRate += 	4	; } //	하트 모양 불꽃놀이키트	(	4	%)
					case(	4	) { itemString = `id:63025 count:2`; iCumRate += 	4	; } //	대용량 축복의 포션	(	4	%)
					case(	5	) { itemString = `id:91005 count:1`; iCumRate += 	5	; } //	전투력 약화 포션	(	5	%)
					case(	6	) { itemString = `id:63026 count:4`; iCumRate += 	5	; } //	원격 은행 이용권	(	5	%)
					case(	7	) { itemString = `id:63047 count:4`; iCumRate += 	5	; } //	원격 힐러집 이용권	(	5	%)
					case(	8	) { itemString = `id:63024 expire:10080`; iCumRate += 	5	; } //	염색 앰플	(	5	%)
					case(	9	) { itemString = `id:91002 count:4`; iCumRate += 	6	; } //	마나 부스트 포션	(	6	%)
					case(	10	) { itemString = `id:91003 count:4`; iCumRate += 	6	; } //	스태미나 부스트 포션	(	6	%)
					case(	11	) { itemString = `id:91004 count:4`; iCumRate += 	7	; } //	보호와 방어 부스트 포션	(	7	%)
					case(	12	) { itemString = `id:91001 count:4`; iCumRate += 	7	; } //	생명력 부스트 포션	(	7	%)
					case(	13	) { itemString = `id:63029 count:2`; iCumRate += 	8	; } //	캠프파이어 키트	(	8	%)
					case(	14	) { itemString = `id:91007 count:1`; iCumRate += 	10	; } //	17살의 키가 되는 포션	(	10	%)
					case(	15	) { itemString = `id:91006 count:1`; iCumRate += 	15	; } //	10살의 키가 되는 포션	(	15	%)
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
					GiveTreasureChestItem(player,itemString,itemID);
					return;
				}

				++i;
			}
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////
server void GiveDyeingAmple(character player, int color, int sourceItem)
{
	string ampleitem = `additemex(id:63030 col1:{0} rewardview:true gachapon:{1})`<<ToHexaString(color)<<ToString(sourceItem);
	player.DoStript(ampleitem);
	if(GetLocale().LowerCase() == `korea`)
	{
		player.ShowCaption("염색 앰플 Set 를 사용하여 지정 색상 염색 앰플을 받았습니다.");
	}
	else
	{
	player.ShowCaption(["event.useitem_event.1"]);
}

}
////////////////////////////////////////////////////////////////////////////////////////
server void GiveZombieGachaphonItem(character player, string  itemString, int sourceItem)
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.46"]);
}
////////////////////////////////////////////////////////////////////////////////////////
server void GivetodayboxItem(character player, string  itemString, int sourceItem)
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.60"]);
}
////////////////////////////////////////////////////////////////////////////////////////
server void GiveFashionGachaphonItem(character player, string  itemString, int sourceItem)
{
	if(GetLocale().LowerCase() == `taiwan`)
	{
		item newItem;
		newItem = player.AddItemEx(itemString, true);
		player.ShowCaption(["event.useitem_event.47"]);
		int itemID = newItem.GetClassId();
		string charName = player.GetDisplayName();
		string ItemName;
		if (itemID == 40342 || itemID == 40343 || itemID == 18297 || itemID == 19069 || itemID == 18301 || itemID == 18570 || itemID == 18574 || itemID == 18575 || itemID == 91193)		// 모험가 가챠폰 고가의 아이템을 획득하면 어나운스를 쏴준다.
		{
			ItemName = newItem.GetFullLocalName();
			AnnounceAllChannel(2, charName + ["event.useitem_event.48"] + ["event.useitem_event.49"]+ ItemName);
		}
		else if (itemID == 19083 ||itemID == 15595 ||itemID == 15594 ||itemID == 18312 ||itemID == 18313 ||itemID == 17231 ||itemID == 17232 ||itemID == 15555 ||itemID == 15556 ||itemID == 16065 ||itemID == 17212 ||itemID == 17213 ||itemID == 15396 ||itemID == 15397 ||itemID == 15398 ||itemID == 15399 ||itemID == 15401 ||itemID == 15402 ||itemID == 15403 ||itemID == 15404 )		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
		{
			ItemName = newItem.GetFullLocalName(); // 패션 가챠폰
			AnnounceAllChannel(2, charName + ["event.useitem_event.50"]+ ["event.useitem_event.51"]+ ItemName );
		}
		else if (itemID == 91165 || itemID == 91166 || itemID == 40352 || itemID == 40353 || itemID == 40354 || itemID == 40355 || itemID == 40356 || itemID == 46028 || itemID == 18305 || itemID == 40171 || itemID == 40193)		// 무기(전사) 가챠폰 고가의 아이템을 획득하면 어나운스를 쏴준다.
		{
			ItemName = newItem.GetFullLocalName();
			AnnounceAllChannel(2, charName + ["event.useitem_event.52"] + ["event.useitem_event.53"]+ ItemName);
		}
		else if (itemID == 15568 || itemID == 15569 || itemID == 18293 || itemID == 18294 || itemID == 17216 || itemID == 17217 || itemID == 15486 || itemID == 18300 || itemID == 17222 || itemID == 16067 || itemID == 15550 || itemID == 18316 || itemID == 17552 || itemID == 15602 || itemID == 19084 || itemID == 15601 || itemID == 17237 || itemID == 17236 || itemID == 17235 || itemID == 46021 || itemID == 19125)		// 5주년 기념 가챠폰 고가의 아이템을 획득하면 어나운스를 쏴준다.
		{
			ItemName = newItem.GetFullLocalName();
			AnnounceAllChannel(2, charName + ["event.useitem_event.58"]+ ["event.useitem_event.59"]+ ItemName);
		}
	}
	else
	{
		string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
		player.DoStript(itemDesc);
		player.ShowCaption(["event.useitem_event.2"]);
	}
}
////////////////////////////////////////////////////////////////////////////////////////
server void GivePremiumGachaphonItem(character player, string  itemString, int sourceItem)
{
	item newItem;
	newItem = player.AddItemEx(itemString, true);
	player.ShowCaption(["event.useitem_event.55"]);
	int itemID = newItem.GetClassId();
	string charName = player.GetDisplayName();
	string ItemName;
	if (itemID == 15550 || itemID == 18316 || itemID == 17552 || itemID == 18189 || itemID == 18187 || itemID == 16046 || itemID == 18188 || itemID == 15298 || itemID == 15305 || itemID == 15306)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
	{
		ItemName = newItem.GetFullLocalName();
		AnnounceAllChannel(2, charName + ["event.useitem_event.56"]+ ["event.useitem_event.57"]+ ItemName);
	}
}
////////////////////////////////////////////////////////////////////////////////
//  패션 가차폰의 사념파 로컬 텍스트를 "가챠폰을 사용해 아이템을 받았습니다."
//  로 통일하고 이후에 다른 가챠폰에도 같은 키값을 쓰기로 했습니다.
//
//
//
////////////////////////////////////////////////////////////////////////////////
server void GivePandaGachaphonItem(character player, string  itemString, int sourceItem)
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.3"]);
}
////////////////////////////////////////////////////////////////////////////////////////
server void GiveHongBaoItem(character player, string  itemString, int sourceItem)
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.39"]);
}
///////////////////////////////////////////////////////////////////////////////////////
server void GiveLittleBoarGachaphonItem(character player, string  itemString, int sourceItem)
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.40"]);
}
////////////////////////////////////////////////////////////////////////////////
server void GiveTreasureChestItem(character player, string  itemString, int sourceItem)
// : 중국 보물상자 이벤트에서 받은 보물상자용 아이템을 지급한다.
////////////////////////////////////////////////////////////////////////////////
{
//	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
//	player.DoStript(itemDesc);

	item newItem;
	newItem = player.AddItemEx(itemString, true);
	player.ShowCaption(["event.useitem_event.38"]);
	int itemID = newItem.GetClassId();
	string charName = player.GetDisplayName();
	string ItemName;
	if (itemID == 40292 || itemID == 40958 || itemID == 40313 || itemID == 18261)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
	{
		ItemName = newItem.GetFullLocalName();
		AnnounceAllChannel(2, charName + ["event.useitem_event.44"]+ ItemName + ["event.useitem_event.45"]);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void GiveDragonShipGachaphonItem(character player, string  itemString, int sourceItem)
// : 대만 용선 이벤트 보상 아이템을 지급한다.
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.41"]);
}
////////////////////////////////////////////////////////////////////////////////
server void GivePartyQuestEventItem(character player, string  itemString, int sourceItem)
// : 대만 파티 퀘스트 이벤트 보상 아이템을 지급한다.
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.42"]);
}
////////////////////////////////////////////////////////////////////////////////
server void GiveSkijumpEventItem(character player, string  itemString, int sourceItem)
// : 대만 파티 퀘스트 이벤트 보상 아이템을 지급한다.
////////////////////////////////////////////////////////////////////////////////
{
	string itemDesc = `additemex({0} rewardview:true gachapon:{1})`<<itemString<<ToString(sourceItem);
	player.DoStript(itemDesc);
	player.ShowCaption(["event.useitem_event.54"]);
}
////////////////////////////////////////////////////////////////////////////////
server void GiveGachaphonCoupon1(character player, int itemRate)
// : 패션 가챠폰 비밀상점 쿠폰 지급
////////////////////////////////////////////////////////////////////////////////
{
	if (itemRate >= 70)
	{
		player.DoStript(`additemex(id:52102 count:4 rewardview:true)`);
	}
	else if (itemRate >= 30)
	{
		player.DoStript(`additemex(id:52102 count:2 rewardview:true)`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void GiveGachaphonCoupon2(character player, int itemRate)
// : 무기 가챠폰 비밀상점 쿠폰 지급
////////////////////////////////////////////////////////////////////////////////
{
	if (itemRate >= 70)
	{
		player.DoStript(`additemex(id:52103 count:4 rewardview:true)`);
	}
	else if (itemRate >= 30)
	{
		player.DoStript(`additemex(id:52103 count:2 rewardview:true)`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void GiveGachaphonCoupon3(character player, int itemRate)
// : 탐험 가챠폰 비밀상점 쿠폰 지급
////////////////////////////////////////////////////////////////////////////////
{
	if (itemRate >= 70)
	{
		player.DoStript(`additemex(id:52104 count:4 rewardview:true)`);
	}
	else if (itemRate >= 30)
	{
		player.DoStript(`additemex(id:52104 count:2 rewardview:true)`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void GiveGachaphonCoupon4(character player, int itemRate)
// : 생산 가챠폰 비밀상점 쿠폰 지급
////////////////////////////////////////////////////////////////////////////////
{
	if (itemRate >= 70)
	{
		player.DoStript(`additemex(id:52105 count:4 rewardview:true)`);
	}
	else if (itemRate >= 30)
	{
		player.DoStript(`additemex(id:52105 count:2 rewardview:true)`);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void GenerateMonster(character player)
// : 중국 보물상자 이벤트에서 받은 보물상자용 몬스터를 소환한다.
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate	= 0;						// 확률을 누적해놓는 변수
	int i					=	0;
	int iRandom		= Random(1000);	// 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string monsterString;
		int count;
		switch(i)
		// i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){ monsterString = `Imp`;								 count = 1; iCumRate += 250; } // 임프
			case(1){ monsterString = `Wisp`;							 count = 1; iCumRate += 150; } // 위습
			case(2){ monsterString = `FlyingSword`;				 count = 1; iCumRate += 200; } // 플라잉소드
			case(3){ monsterString = `BrownGremlin`;			 count = 1; iCumRate += 300; } // 갈색 그렘린
			case(4){ monsterString = `SmallPirateSkeleton`; count = 1; iCumRate +=  25; } // 작은 해적 스켈레톤
			case(5){ monsterString = `SmallCaptinSkeleton`; count = 1; iCumRate +=  25; } // 작은 선장 스켈레톤
			case(6){ monsterString = `SmallSahuagin`;			 count = 1; iCumRate +=  25; } // 작은 사하긴
			case(7){ monsterString = `Weak_Ghost`;				 count = 1; iCumRate +=  25; } // 약한 고스트
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
			DebugOut(`몬스터 `+monsterString+` 가 소환됨`);
			player.GenerateMonster(monsterString, count);
			return;
		}

		++i;
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool GetRandomOptionSet(
	int Category,
	int& Prefix,
	int& Suffix)
// : 랜덤하게 인챈트 옵션을 가져온다.
////////////////////////////////////////////////////////////////////////////////
{
	if (Category == 1)		// 초보자 튜터리얼용 랜덤 인챈트, 카테고리1은 오픈베타 패키지를 고려하여 그 시기까지만 나왔던 인챈트를 발급한다.
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int NewPrefix = 0;
		int NewSuffix = 0;

		int iRandom = Random(28);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(	0	){ NewPrefix = 1;	NewSuffix = 0;		iCumRate += 1 ;}	// 햄스터 헌터
				case(	1	){ NewPrefix = 6;	NewSuffix = 0;		iCumRate += 1 ;}	// 스네이크 헌터
				case(	2	){ NewPrefix = 7;	NewSuffix = 0;		iCumRate += 1 ;}	// 폭스 헌터
				case(	3	){ NewPrefix = 101;	NewSuffix = 0;		iCumRate += 1 ;}	// 햄스터 테이머
				case(	4	){ NewPrefix = 106;	NewSuffix = 0;		iCumRate += 1 ;}	// 스니이크 테이머
				case(	5	){ NewPrefix = 107;	NewSuffix = 0;		iCumRate += 1 ;}	// 폭스 테이머
				case(	6	){ NewPrefix = 201;	NewSuffix = 0;		iCumRate += 1 ;}	// 햄스터
				case(	7	){ NewPrefix = 206;	NewSuffix = 0;		iCumRate += 1 ;}	// 스네이크
				case(	8	){ NewPrefix = 207;	NewSuffix = 0;		iCumRate += 1 ;}	// 폭스
				case(	9	){ NewPrefix = 301;	NewSuffix = 0;		iCumRate += 1 ;}	// 망가진
				case(	10	){ NewPrefix = 305;	NewSuffix = 0;		iCumRate += 1 ;}	// 정교한
				case(	11	){ NewPrefix = 306;	NewSuffix = 0;		iCumRate += 1 ;}	// 날카로운
				case(	12	){ NewPrefix = 1701;	NewSuffix = 0;		iCumRate += 1 ;}	// 페이퍼
				case(	13	){ NewPrefix = 1706;	NewSuffix = 0;		iCumRate += 1 ;}	// 굿
				case(	14	){ NewPrefix = 0;	NewSuffix = 10604;	iCumRate += 1 ;}	// 농부의
				case(	15	){ NewPrefix = 0;	NewSuffix = 10605;	iCumRate += 1 ;}	// 솔져
				case(	16	){ NewPrefix = 0;	NewSuffix = 10805;	iCumRate += 1 ;}	// 망각의
				case(	17	){ NewPrefix = 0;	NewSuffix = 10806;	iCumRate += 1 ;}	// 언더스탠딩
				case(	18	){ NewPrefix = 0;	NewSuffix = 10905;	iCumRate += 1 ;}	// 헤이즈
				case(	19	){ NewPrefix = 0;	NewSuffix = 10606;	iCumRate += 1 ;}	// 샤이닝
				case(	20	){ NewPrefix = 0;	NewSuffix = 11005;	iCumRate += 1 ;}	// 미스포츈
				case(	21	){ NewPrefix = 0;	NewSuffix = 11006;	iCumRate += 1 ;}	// 포츈
				case(	22	){ NewPrefix = 0;	NewSuffix = 11104;	iCumRate += 1 ;}	// 위크니스
				case(	23	){ NewPrefix = 0;	NewSuffix = 11105;	iCumRate += 1 ;}	// 헬스
				case(	24	){ NewPrefix = 0;	NewSuffix = 11204;	iCumRate += 1 ;}	// 티어드랍
				case(	25	){ NewPrefix = 0;	NewSuffix = 11205;	iCumRate += 1 ;}	// 워터
				case(	26	){ NewPrefix = 0;	NewSuffix = 11303;	iCumRate += 1 ;}	// 늪의
				case(	27	){ NewPrefix = 0;	NewSuffix = 11304;	iCumRate += 1 ;}	// 인내의
//				case(	14	){ NewPrefix = 1707;	NewSuffix = 0;		iCumRate += 1 ;}	// 튼튼한(특정부위에만 가능하지만 들어감)
//				case(	17	){ NewPrefix = 0;	NewSuffix = 10704;	iCumRate += 1 ;}	// 느림보의(특정부위에만 가능하지만 들어감)
//				case(	18	){ NewPrefix = 0;	NewSuffix = 10705;	iCumRate += 1 ;}	// 구름의(특정부위에만 가능하지만 들어감)

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
				Prefix = NewPrefix;
				Suffix = NewSuffix;

				return true;
			}
			++i;
		}
	}

	return false;
}



////////////////////////////////////////////////////////////////////////////////
server bool PickDyeingColor(
	int itemClassID,
	int& color)
// : 랜덤하게 염색할 색을 고른다.
//   false를 리턴할 경우, 기존의 염색 앰플 스킬에 색 선택을 맡긴다.
////////////////////////////////////////////////////////////////////////////////
{
	if (itemClassID == 63096)
	{
			meta_array sColorArray;

			sColorArray.Add(0x61000f22); //백색
			sColorArray.Add(0x61000800); //검정
			sColorArray.Add(0x6100f4fa); //노랑
			sColorArray.Add(0x61001e08); //회색,회보라
			sColorArray.Add(0x61009495); //보라,갈색
			sColorArray.Add(0x6100b808); //진회색->레드
			sColorArray.Add(0x86708461); //녹색
			sColorArray.Add(0x8640eff5); //노랑
			sColorArray.Add(0x86400800); //블랙
			sColorArray.Add(0x8640220f); //백색
			sColorArray.Add(0x864097f6); //개나리색->상큼한 보라
			sColorArray.Add(0x86402894); //붉은색->검은색
			sColorArray.Add(0x6140b02a); //군청색->초록빛섞인 하늘색
			sColorArray.Add(0x864037a8); //옅은 카키색->푸른

			int sColorSize = sColorArray.GetSize();

			if (IsDevelopment())
			{
				if (Random(10) == 0)
				{
					//특수칼라가 1/10의 확률
					color = (int)sColorArray.Get(Random(sColorSize));
					return true;
				}
			}
			else
			{
				if (Random(200) == 0)
				{
					//특수칼라가 1/1000의 확률
					// 2009/4/28 일본 요청으로 1/200의 확률로 수정;;; (으.. 유니크가....) by honol01
					color = (int)sColorArray.Get(Random(sColorSize));
					return true;
				}
			}

	}
	if (itemClassID == 63097)
	{
			meta_array sColorArray, nColorArray;

			sColorArray.Add(0x61000f22); //백색
			sColorArray.Add(0x61000800); //검정
			sColorArray.Add(0x6100f4fa); //노랑
			sColorArray.Add(0x61001e08); //회색,회보라
			sColorArray.Add(0x61009495); //보라,갈색
			sColorArray.Add(0x6100b808); //진회색->레드
			sColorArray.Add(0x86708461); //녹색
			sColorArray.Add(0x8640eff5); //노랑
			sColorArray.Add(0x86400800); //블랙
			sColorArray.Add(0x8640220f); //백색
			sColorArray.Add(0x864097f6); //개나리색->상큼한 보라
			sColorArray.Add(0x86402894); //붉은색->검은색
			sColorArray.Add(0x6140b02a); //군청색->초록빛섞인 하늘색
			sColorArray.Add(0x864037a8); //옅은 카키색->푸른색

			int sColorSize = sColorArray.GetSize();

			nColorArray.Add(0xDD9C35);
			nColorArray.Add(0xB28F59);
			nColorArray.Add(0x77384C);
			nColorArray.Add(0x622438);
			nColorArray.Add(0xA2818B);
			nColorArray.Add(0xA01340);
			nColorArray.Add(0x893751);
			nColorArray.Add(0xC90947);
			nColorArray.Add(0xF2A33A);
			nColorArray.Add(0xDD9330);
			nColorArray.Add(0x887B7C);
			nColorArray.Add(0xDFDCDD);
			nColorArray.Add(0xFFFFFF);
			nColorArray.Add(0x000000);
			nColorArray.Add(0x99DBE9);
			nColorArray.Add(0x96C2CB);
			nColorArray.Add(0x06B5DB);
			nColorArray.Add(0x067EDB);
			nColorArray.Add(0x8673C4);
			nColorArray.Add(0xC71967);
			nColorArray.Add(0x8C9697);
			nColorArray.Add(0x557A7C);
			nColorArray.Add(0x578172);
			nColorArray.Add(0x79B49F);
			nColorArray.Add(0x317D61);
			nColorArray.Add(0x42CE3B);
			nColorArray.Add(0x36C72F);
			nColorArray.Add(0x5FD059);
			nColorArray.Add(0x98E294);
			nColorArray.Add(0xE8DE73);
			nColorArray.Add(0xEFEAB5);
			nColorArray.Add(0xABA88A);
			nColorArray.Add(0x98956E);
			nColorArray.Add(0x74703F);
			nColorArray.Add(0x4E7070);
			nColorArray.Add(0x5A4B66);
			nColorArray.Add(0x746B7A);
			nColorArray.Add(0x9F56A2);
			nColorArray.Add(0xAC79AE);
			nColorArray.Add(0xF0F0F0);

			int nColorSize = nColorArray.GetSize();

			if (IsDevelopment())
			{
				if (Random(10) == 0)
				{
					//특수칼라가 1/10의 확률
					color = (int)sColorArray.Get(Random(sColorSize));
				}
				else
				{
					color = (int)nColorArray.Get(Random(nColorSize));
				}
			}
			else
			{
				if (Random(100) == 0)
				{
					//특수칼라가 1/100의 확률
					color = (int)sColorArray.Get(Random(sColorSize));
				}
				else
				{
					color = (int)nColorArray.Get(Random(nColorSize));
				}
			}

			return true;

	}
	if (itemClassID == 63098)
	{
			meta_array sColorArray;

			sColorArray.Add(0x61000f22); //백색
			sColorArray.Add(0x61000800); //검정
			sColorArray.Add(0x6100f4fa); //노랑
			sColorArray.Add(0x61001e08); //회색,회보라
			sColorArray.Add(0x61009495); //보라,갈색
			sColorArray.Add(0x6100b808); //진회색->레드
			sColorArray.Add(0x86708461); //녹색
			sColorArray.Add(0x8640eff5); //노랑
			sColorArray.Add(0x86400800); //블랙
			sColorArray.Add(0x8640220f); //백색
			sColorArray.Add(0x864097f6); //개나리색->상큼한 보라
			sColorArray.Add(0x86402894); //붉은색->검은색
			sColorArray.Add(0x6140b02a); //군청색->초록빛섞인 하늘색
			sColorArray.Add(0x864037a8); //옅은 카키색->푸른

			int sColorSize = sColorArray.GetSize();

			if (IsDevelopment())
			{
				if (Random(10) == 0)
				{
					//특수칼라가 1/10의 확률
					color = (int)sColorArray.Get(Random(sColorSize));
					return true;
				}
			}
			else
			{
				if (Random(10000) == 0)
				{
					//특수칼라가 1/1000의 확률
					color = (int)sColorArray.Get(Random(sColorSize));
					return true;
				}
			}
	}

	return false;
}

////////////////////////////////////////////////////////////////////////////////
server bool GiveHuneyCombItem(
	character player,
	int itemID)
// : 벌집에서 꿀을 채취할 경우 랜덤하게 아이템을 준다.
////////////////////////////////////////////////////////////////////////////////
{
	// 벌집 아이템이 아니면 얻을  수 없다.
	if (itemID != 53150)
	{
		return false;
	}

	int iRandom = Random(100);		// 확률을 구한다.
	int i = 0;
	int iCumRate = 0; //확률을 누적해놓는 변수

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:53151 count:1`; iCumRate += 15;}	// 15.00% 로열 젤리  -- G11S1EX에서 15%로 상향합니다. (기존도 그냥 투입)
			case(1){itemString = `id:53152 count:1`; iCumRate += 30;}	// 30.00%	벌레 사체
			case(2){itemString = `id:53153 count:1`; iCumRate += 20;}	// 20.00%	꽃가루
			case(3){itemString = `id:53154 count:1`; iCumRate += 35;}	// 35.00%	벌꿀
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
			// 아이템을 준다.
			string itemDesc = `additemex({0} rewardview:true)`<<itemString;
			player.DoStript(itemDesc);
			player.ShowCaption(["event.useitem_event.43"]);
			return true;
		}

		++i;
	}

	return false;
}