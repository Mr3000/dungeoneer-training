//////////////////////////////////////////////////////////////////////////////////
//                       Mabinogi Project : Use Item Script
//                           아이템 사용시의 이벤트 함수
//
//                      nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                               nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//  isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//  불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//미국 모험가 가차폰
/*	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;

	int randomSetId = 1033;  // 고유 ID.. RandomItemSet.xlsm에 기입
	int itemIndex = GetItemIndexFromRandomSet(randomSetId);
	
	string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
	bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
	bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
	
	item newItem;
	newItem = player.AddItemEx(itemString, true);	
*/	
	
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2108);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	int jRandom = Random(3);		
	if (!player.IsRiding())
	{
		switch(jRandom)
		// 가챠폰 까는 모션 출력
		{
			case(0)
			{
				player.SetMotionType(14, 15, false); // mcStand, motionStandFriendly01, not loop
			}
			case(1)
			{
				player.SetMotionType(14, 16, false); // mcStand, motionStandFriendly01, not loop
			}
			case(2)
			{
				player.SetMotionType(14, 17, false); // mcStand, motionStandFriendly01, not loop
			}
		}
	}

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:18233 col1:6040FF13 col2:604011FF col3:60404503`; iCumRate += 1;} //0.0474383320아이리스 헤드드레스（레어컬러）
			case(1){itemString = `id:18234 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0474383320러버 고글（레어컬러）
			case(2){itemString = `id:16058 col1:6040FF4b col2:604013FF`; iCumRate += 1;} //0.0474383320펄 샤인 브레이슬렛（레어컬러）
			case(3){itemString = `id:18238 col1:6040FF4b`; iCumRate += 1;} //0.0474383320펄 샤인 드롭（레어컬러）
			case(4){itemString = `id:18235 col1:6040FF13 col2:604011FF col3:60404503`; iCumRate += 1;} //0.0474383320아이리스 나이트캡（레어컬러）
			case(5){itemString = `id:16057 col1:60404503 col2:604013FF`; iCumRate += 1;} //0.0474383320아이언 피라밋 밴드（레어컬러）
			case(6){itemString = `id:18237 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0474383320딕 스티치 마스크（레어컬러）
			case(7){itemString = `id:18189 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0474383320카우보이 모자（레어컬러）
			case(8){itemString = `id:18187 col1:6040FF13 col2:604013FF`; iCumRate += 1;} //0.0474383320큰 리본（레어컬러）
			case(9){itemString = `id:16046 col1:60404503`; iCumRate += 1;} //0.0474383320고양이 손 장갑（레어컬러）
			case(10){itemString = `id:18188 col1:60400426 col2:60400426`; iCumRate += 1;} //0.0474383320안대（레어컬러）
			case(11){itemString = `id:18570 `; iCumRate += 2;} //0.0948766620날개모양의 귀걸이
			case(12){itemString = `id:18571 `; iCumRate += 2;} //0.0948766620링 3개의 귀걸이type1
			case(13){itemString = `id:18572 `; iCumRate += 2;} //0.0948766620링 3개의 귀걸이type２
			case(14){itemString = `id:18573 `; iCumRate += 2;} //0.0948766620링 3개의 귀걸이type３
			case(15){itemString = `id:16059 `; iCumRate += 2;} //0.0948766620팔찌１
			case(16){itemString = `id:16060 `; iCumRate += 2;} //0.0948766620팔찌2
			case(17){itemString = `id:46026 `; iCumRate += 2;} //0.0948766620팔에 착용하는 소형 방패
			case(18){itemString = `id:18574 `; iCumRate += 2;} //0.0948766620왕관
			case(19){itemString = `id:18575 `; iCumRate += 2;} //0.0948766620꽃을 모티브로한 코사쥬
			case(20){itemString = `id:18576 `; iCumRate += 2;} //0.0948766620꽃으로 장식한 티아라
			case(21){itemString = `id:18233 `; iCumRate += 3;} //0.14231499120아이리스 헤드드레스
			case(22){itemString = `id:18234 `; iCumRate += 3;} //0.14231499120러버 고글
			case(23){itemString = `id:16058 `; iCumRate += 3;} //0.14231499120펄 샤인 브레이슬렛
			case(24){itemString = `id:18238 `; iCumRate += 3;} //0.14231499120펄 샤인 드롭
			case(25){itemString = `id:18235 `; iCumRate += 3;} //0.14231499120아이리스 나이트캡
			case(26){itemString = `id:16057 `; iCumRate += 3;} //0.14231499120아이언 피라밋 밴드
			case(27){itemString = `id:18237 `; iCumRate += 3;} //0.14231499120딕 스티치 마스크
			case(28){itemString = `id:18189 `; iCumRate += 3;} //0.14231499120카우보이 모자
			case(29){itemString = `id:18187 `; iCumRate += 3;} //0.14231499120큰 리본
			case(30){itemString = `id:16046 `; iCumRate += 3;} //0.14231499120고양이 손 장갑
			case(31){itemString = `id:18188 `; iCumRate += 3;} //0.14231499120안대
			case(32){itemString = `id:91194 `; iCumRate += 3;} //0.14231499120모험가 갈색 코리안 숏헤어(미니펫)
			case(33){itemString = `id:91195 `; iCumRate += 3;} //0.14231499120꽃장식 미니어처 핀셔(미니펫)
			case(34){itemString = `id:55000 `; iCumRate += 4;} //0.18975332120스톤 바이슨의 뿔
			case(35){itemString = `id:55001 `; iCumRate += 4;} //0.18975332120스톤 바이슨의 이빨
			case(36){itemString = `id:55002 `; iCumRate += 4;} //0.18975332120스톤 바이슨의 꼬리
			case(37){itemString = `id:55003 `; iCumRate += 4;} //0.18975332120스톤 바이슨의 발굽
			case(38){itemString = `id:55005 `; iCumRate += 4;} //0.18975332120스톤 하운드의 귀
			case(39){itemString = `id:55006 `; iCumRate += 4;} //0.18975332120스톤 하운드의 이빨
			case(40){itemString = `id:55007 `; iCumRate += 4;} //0.18975332120스톤 하운드의 꼬리
			case(41){itemString = `id:55008 `; iCumRate += 4;} //0.18975332120스톤 하운드의 발목 장식
			case(42){itemString = `id:55009 `; iCumRate += 4;} //0.18975332120스톤 하운드의 발톱
			case(43){itemString = `id:55011 `; iCumRate += 4;} //0.18975332120스톤 좀비의 서클릿
			case(44){itemString = `id:55012 `; iCumRate += 4;} //0.18975332120스톤 좀비의 머리장식
			case(45){itemString = `id:55013 `; iCumRate += 4;} //0.18975332120스톤 좀비의 눈
			case(46){itemString = `id:55014 `; iCumRate += 4;} //0.18975332120스톤 좀비의 어깨 장식
			case(47){itemString = `id:55015 `; iCumRate += 4;} //0.18975332120스톤 좀비의 벨트
			case(48){itemString = `id:55016 `; iCumRate += 4;} //0.18975332120스톤 좀비의 손목 장식
			case(49){itemString = `id:55019 `; iCumRate += 4;} //0.18975332120스톤 임프의 모자
			case(50){itemString = `id:55020 `; iCumRate += 4;} //0.18975332120스톤 임프의 모자장식
			case(51){itemString = `id:55021 `; iCumRate += 4;} //0.18975332120스톤 임프의 보석
			case(52){itemString = `id:55022 `; iCumRate += 4;} //0.18975332120스톤 임프의 코
			case(53){itemString = `id:55023 `; iCumRate += 4;} //0.18975332120스톤 임프의 귀
			case(54){itemString = `id:55024 `; iCumRate += 4;} //0.18975332120스톤 임프의 샌들
			case(55){itemString = `id:55025 `; iCumRate += 4;} //0.18975332120항아리 거미의 다리
			case(56){itemString = `id:55026 `; iCumRate += 4;} //0.18975332120항아리 거미의 항아리
			case(57){itemString = `id:55027 `; iCumRate += 4;} //0.18975332120항아리 거미의 어금니
			case(58){itemString = `id:55028 `; iCumRate += 4;} //0.18975332120항아리 거미의 집게발
			case(59){itemString = `id:55029 `; iCumRate += 4;} //0.18975332120항아리 거미의 독 주머니
			case(60){itemString = `id:55062 `; iCumRate += 4;} //0.18975332120스톤 가고일의 어깨 장식
			case(61){itemString = `id:55063 `; iCumRate += 4;} //0.18975332120스톤 가고일의 글로브
			case(62){itemString = `id:55064 `; iCumRate += 4;} //0.18975332120스톤 가고일의 부츠
			case(63){itemString = `id:55031 `; iCumRate += 4;} //0.18975332120빛나는 스톤 바이슨의 뿔
			case(64){itemString = `id:55032 `; iCumRate += 4;} //0.18975332120빛나는 스톤 바이슨의 이빨
			case(65){itemString = `id:55033 `; iCumRate += 4;} //0.18975332120빛나는 스톤 바이슨의 꼬리
			case(66){itemString = `id:55034 `; iCumRate += 4;} //0.18975332120빛나는 스톤 바이슨의 발굽
			case(67){itemString = `id:55035 `; iCumRate += 4;} //0.18975332120빛나는 스톤 바이슨의 석상
			case(68){itemString = `id:55036 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 귀
			case(69){itemString = `id:55037 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 이빨
			case(70){itemString = `id:55038 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 꼬리
			case(71){itemString = `id:55039 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 발목 장식
			case(72){itemString = `id:55040 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 발톱
			case(73){itemString = `id:55041 `; iCumRate += 4;} //0.18975332120빛나는 스톤 하운드의 석상
			case(74){itemString = `id:55042 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 서클릿
			case(75){itemString = `id:55043 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 머리장식
			case(76){itemString = `id:55044 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 눈
			case(77){itemString = `id:55045 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 어깨 장식
			case(78){itemString = `id:55046 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 벨트
			case(79){itemString = `id:55047 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 손목 장식
			case(80){itemString = `id:55048 `; iCumRate += 4;} //0.18975332120빛나는 스톤 좀비의 석상
			case(81){itemString = `id:55049 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 석상
			case(82){itemString = `id:55050 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 모자
			case(83){itemString = `id:55051 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 모자장식
			case(84){itemString = `id:55052 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 보석
			case(85){itemString = `id:55053 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 코
			case(86){itemString = `id:55054 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 귀
			case(87){itemString = `id:55055 `; iCumRate += 4;} //0.18975332120빛나는 스톤 임프의 샌들
			case(88){itemString = `id:55056 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 다리
			case(89){itemString = `id:55057 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 항아리
			case(90){itemString = `id:55058 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 어금니
			case(91){itemString = `id:55059 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 집게발
			case(92){itemString = `id:55060 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 독 주머니
			case(93){itemString = `id:55061 `; iCumRate += 4;} //0.18975332120빛나는 항아리 거미의 석상
			case(94){itemString = `id:55065 `; iCumRate += 4;} //0.18975332120빛나는 스톤 가고일의 어깨 장식
			case(95){itemString = `id:55066 `; iCumRate += 4;} //0.18975332120빛나는 스톤 가고일의 글로브
			case(96){itemString = `id:55067 `; iCumRate += 4;} //0.18975332120빛나는 스톤 가고일의 부츠
			case(97){itemString = `id:55068 `; iCumRate += 4;} //0.18975332120빛나는 스톤 가고일의 석상
			case(98){itemString = `id:40049 col1:0000c0`; iCumRate += 6;} //0.28462998120플루트（레어컬러）
			case(99){itemString = `id:40048 col1:f3f33a`; iCumRate += 6;} //0.28462998120휘슬（레어컬러）
			case(100){itemString = `id:40018 col1:c00000 col2:000000`; iCumRate += 6;} //0.28462998120우쿨렐레（레어컬러）
			case(101){itemString = `id:40004 col1:45c4fa`; iCumRate += 6;} //0.28462998120류트（레어컬러）
			case(102){itemString = `id:40017  col1:000000 col2:000000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 6;} //0.28462998120만도린（레어컬러）
			case(103){itemString = `id:46007 col1:ffffff col2:ffffff col3:31d960`; iCumRate += 6;} //0.28462998120헤테로 카이트 실드（레어컬러）
			case(104){itemString = `id:46007  col1:181818 col2:181818 col3:583c90`; iCumRate += 6;} //0.28462998120헤테로 카이트 실드（레어컬러）
			case(105){itemString = `id:40204 `; iCumRate += 6;} //0.28462998120고대의 조련 지팡이
			case(106){itemString = `id:40205 `; iCumRate += 6;} //0.28462998120티카 나무 조련 지팡이
			case(107){itemString = `id:62005 prefix:20625`; iCumRate += 6;} //0.28462998120금속 바늘（metal needle)
			case(108){itemString = `id:62005 prefix:20825`; iCumRate += 6;} //0.28462998120나무 바늘（wooden needle）
			case(109){itemString = `id:62005 prefix:20915`; iCumRate += 6;} //0.28462998120사이프러스（cypress）
			case(110){itemString = `id:62005 prefix:20621`; iCumRate += 6;} //0.28462998120겁없는（Dauntless）
			case(111){itemString = `id:15222 `; iCumRate += 6;} //0.28462998120그레이스 숄 드레스
			case(112){itemString = `id:40017  col1:86402894 col2:660000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 6;} //0.28462998120빨강과 검정으로 반짝거리는 다루기 쉬운 위자드 만돌린
			case(113){itemString = `id:40031  col1:101010 col2:101010 col3:101010`; iCumRate += 6;} //0.28462998120검은색 석궁
			case(114){itemString = `id:40081  col1:800000 col2:ffffff`; iCumRate += 6;} //0.28462998120빨강과 흰색의 레더 롱 보우
			case(115){itemString = `id:40031  col1:eeeeee`; iCumRate += 6;} //0.28462998120흰색 석궁
			case(116){itemString = `id:40014  col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 6;} //0.28462998120보라색 콤포짓 보우
			case(117){itemString = `id:46006  col1:eeeeee col2:660000 col3:eeeeee`; iCumRate += 6;} //0.28462998120빨간색 카이트 실드
			case(118){itemString = `id:40242 col1:650000 col2:523226 col3:523226`; iCumRate += 6;} //0.28462998120배틀소드
			case(119){itemString = `id:40011 col1:be0000 col2:101010 col3:101010`; iCumRate += 6;} //0.28462998120브로드소드
			case(120){itemString = `id:14013  prefix:20403 suffix:30515`; iCumRate += 6;} //0.28462998120승리의 해적(인챈트) 로리카 세그먼타타에
			case(121){itemString = `id:14019  prefix:21105 suffix:30515`; iCumRate += 6;} //0.28462998120원리의 해적(인챈트) 그레이스 플레이트 아머
			case(122){itemString = `id:19007  col1:800000 col2:000000 col3:000000`; iCumRate += 6;} //0.28462998120검정과 빨강의 야광 머플러 로브
			case(123){itemString = `id:19007  col1:ffffff col2:000000 col3:000000`; iCumRate += 6;} //0.28462998120흰색 야광 머플러 로브
			case(124){itemString = `id:19007  col1:800000 col2:ffffff col3:ffffff`; iCumRate += 6;} //0.28462998120빨강과 흰생의 야광 머플러 로브
			case(125){itemString = `id:15135  prefix:207 suffix:10807`; iCumRate += 6;} //0.28462998120폭스 컨시더레이션 시크 수트
			case(126){itemString = `id:40015 id:40015 col1:3caeff col2:eeeeee col3:eeeeee`; iCumRate += 6;} //0.28462998120플루트 숏 소드
			case(127){itemString = `id:80007 `; iCumRate += 6;} //0.28462998120나오의 탐험가 복장
			case(128){itemString = `id:17073 `; iCumRate += 6;} //0.28462998120타이업 롱 부츠
			case(129){itemString = `id:40049  col1:66ffff col2:66ffff col3:66ffff`; iCumRate += 6;} //0.28462998120바다색 플루트
			case(130){itemString = `id:80008 `; iCumRate += 6;} //0.28462998120나오의 이리아 캐주얼 룩
			case(131){itemString = `id:40231 `; iCumRate += 6;} //0.28462998120크리스탈 라이트닝 원드
			case(132){itemString = `id:40232 `; iCumRate += 6;} //0.28462998120크라운 아이스 원드
			case(133){itemString = `id:40233 `; iCumRate += 6;} //0.28462998120피닉스 파이어 원드
			case(134){itemString = `id:40234 `; iCumRate += 6;} //0.28462998120티카 나무 힐링 원드
			case(135){itemString = `id:45010  count:20`; iCumRate += 10;} //0.47438330220토파즈 화살
			case(136){itemString = `id:45011  count:20`; iCumRate += 10;} //0.47438330220에메랄드 화살
			case(137){itemString = `id:45012  count:20`; iCumRate += 10;} //0.47438330220자수정 화살
			case(138){itemString = `id:63072  expire:10080`; iCumRate += 10;} //0.47438330220던전 밀랍 날개
			case(139){itemString = `id:63086  expire:43200`; iCumRate += 10;} //0.47438330220생명력의 엘릭서
			case(140){itemString = `id:63087  expire:43200`; iCumRate += 10;} //0.47438330220마나의 엘릭서
			case(141){itemString = `id:63088  expire:43200`; iCumRate += 10;} //0.47438330220스태미나의 엘릭서
			case(142){itemString = `id:63058  expire:43200`; iCumRate += 10;} //0.47438330220회복 속도 증가 포션
			case(143){itemString = `id:62005 prefix:6`; iCumRate += 10;} //0.47438330220스네이크헌터
			case(144){itemString = `id:62005 prefix:7`; iCumRate += 10;} //0.47438330220폭스헌터
			case(145){itemString = `id:62005 prefix:107`; iCumRate += 10;} //0.47438330220폭스테이머
			case(146){itemString = `id:62005 prefix:20822`; iCumRate += 10;} //0.47438330220스노드롭（snow drop）
			case(147){itemString = `id:62005 prefix:20622`; iCumRate += 10;} //0.47438330220단호한（determined）
			case(148){itemString = `id:62005 prefix:20213`; iCumRate += 10;} //0.47438330220쾌활한（cheerful）
			case(149){itemString = `id:62005 prefix:207`; iCumRate += 10;} //0.47438330220폭스（fox）
			case(150){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.47438330220자이언트（of giant）
			case(151){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.47438330220레이븐（of raven）
			case(152){itemString = `id:62005 suffix:30626`; iCumRate += 10;} //0.47438330220용감한（of brave）
			case(153){itemString = `id:62005 suffix:10604`; iCumRate += 10;} //0.47438330220농부의（of Farmer）
			case(154){itemString = `id:62005 suffix:11104`; iCumRate += 10;} //0.47438330220위크니스（weakness）
			case(155){itemString = `id:62005 suffix:30624`; iCumRate += 10;} //0.47438330220산사나무（of hawthorn）
			case(156){itemString = `id:62005 suffix:30103`; iCumRate += 10;} //0.47438330220머무른
			case(157){itemString = `id:62005 suffix:30204`; iCumRate += 10;} //0.47438330220잔존한
			case(158){itemString = `id:62005 suffix:30314`; iCumRate += 10;} //0.47438330220정지하는
			case(159){itemString = `id:62005 prefix:20503`; iCumRate += 10;} //0.47438330220강옥
			case(160){itemString = `id:62005 suffix:30615`; iCumRate += 10;} //0.47438330220곤란의
			case(161){itemString = `id:62005 suffix:30813`; iCumRate += 10;} //0.47438330220불편의
			case(162){itemString = `id:62005 suffix:30716`; iCumRate += 10;} //0.47438330220장애의
			case(163){itemString = `id:62005 suffix:30717`; iCumRate += 10;} //0.47438330220해의
			case(164){itemString = `id:62005 suffix:30814`; iCumRate += 10;} //0.47438330220지장의
			case(165){itemString = `id:62005 prefix:20504`; iCumRate += 10;} //0.47438330220금강석
			case(166){itemString = `id:62005 prefix:20108`; iCumRate += 10;} //0.47438330220키위
			case(167){itemString = `id:62005 prefix:20304`; iCumRate += 10;} //0.47438330220타조
			case(168){itemString = `id:62005 prefix:20505`; iCumRate += 10;} //0.47438330220리자드
			case(169){itemString = `id:62005 prefix:20508`; iCumRate += 10;} //0.47438330220수상한
			case(170){itemString = `id:62005 prefix:20618`; iCumRate += 10;} //0.47438330220망설이는
			case(171){itemString = `id:62005 prefix:20718`; iCumRate += 10;} //0.47438330220이상한
			case(172){itemString = `id:62005 prefix:20209`; iCumRate += 10;} //0.47438330220몽구스
			case(173){itemString = `id:62005 prefix:20409`; iCumRate += 10;} //0.47438330220사막여우
			case(174){itemString = `id:62005 prefix:20615`; iCumRate += 10;} //0.47438330220사막거미
			case(175){itemString = `id:62005 prefix:20212`; iCumRate += 10;} //0.47438330220괴상한
			case(176){itemString = `id:62005 prefix:20412`; iCumRate += 10;} //0.47438330220별난
			case(177){itemString = `id:62005 prefix:20619`; iCumRate += 10;} //0.47438330220특이한
			case(178){itemString = `id:62005 prefix:20110`; iCumRate += 10;} //0.47438330220평원의
			case(179){itemString = `id:62005 prefix:20306`; iCumRate += 10;} //0.47438330220초원의
			case(180){itemString = `id:62005 prefix:20506`; iCumRate += 10;} //0.47438330220고원의
			case(181){itemString = `id:62005 prefix:20109`; iCumRate += 10;} //0.47438330220야생마
			case(182){itemString = `id:62005 prefix:20210`; iCumRate += 10;} //0.47438330220반달곰
			case(183){itemString = `id:62005 prefix:20305`; iCumRate += 10;} //0.47438330220마스크 고블린
			case(184){itemString = `id:62005 prefix:20211`; iCumRate += 10;} //0.47438330220협곡의
			case(185){itemString = `id:62005 prefix:20410`; iCumRate += 10;} //0.47438330220숲의
			case(186){itemString = `id:62005 prefix:20616`; iCumRate += 10;} //0.47438330220강의
			case(187){itemString = `id:62005 prefix:20411`; iCumRate += 10;} //0.47438330220웅덩이의
			case(188){itemString = `id:62005 prefix:20507`; iCumRate += 10;} //0.47438330220연못의
			case(189){itemString = `id:62005 prefix:20617`; iCumRate += 10;} //0.47438330220호수의
			case(190){itemString = `id:40026 prefix:20106`; iCumRate += 10;} //0.47438330220활석의 종
			case(191){itemString = `id:40026 prefix:20207`; iCumRate += 10;} //0.47438330220방해석의 종
			case(192){itemString = `id:40026 prefix:20302`; iCumRate += 10;} //0.47438330220인회석의 종
			case(193){itemString = `id:40026 prefix:20407`; iCumRate += 10;} //0.47438330220석영의 종
			case(194){itemString = `id:46001 prefix:20212`; iCumRate += 10;} //0.47438330220괴상한  라운드 실드
			case(195){itemString = `id:46001 prefix:20412`; iCumRate += 10;} //0.47438330220별난  라운드 실드
			case(196){itemString = `id:46001 prefix:20619`; iCumRate += 10;} //0.47438330220특이한  라운드 실드
			case(197){itemString = `id:40242 `; iCumRate += 10;} //0.47438330220배틀
			case(198){itemString = `id:40243 `; iCumRate += 10;} //0.47438330220배틀 숏 소드
			case(199){itemString = `id:40235 `; iCumRate += 10;} //0.47438330220시미터
			case(200){itemString = `id:40006 `; iCumRate += 10;} //0.47438330220단검
			case(201){itemString = `id:40005 `; iCumRate += 10;} //0.47438330220숏 소드
			case(202){itemString = `id:40015 `; iCumRate += 10;} //0.47438330220플루트 숏 소드
			case(203){itemString = `id:40010 `; iCumRate += 10;} //0.47438330220롱 소드
			case(204){itemString = `id:40011 `; iCumRate += 10;} //0.47438330220브로드 소드
			case(205){itemString = `id:40012 `; iCumRate += 10;} //0.47438330220바스타드 소드
			case(206){itemString = `id:40080 `; iCumRate += 10;} //0.47438330220글라디우스
			case(207){itemString = `id:40083 `; iCumRate += 10;} //0.47438330220훅 커틀러스
			case(208){itemString = `id:40030 `; iCumRate += 10;} //0.47438330220투 핸디드 소드
			case(209){itemString = `id:40033 `; iCumRate += 10;} //0.47438330220클레이모어
			case(210){itemString = `id:40079 `; iCumRate += 10;} //0.47438330220메이스
			case(211){itemString = `id:40078 `; iCumRate += 10;} //0.47438330220비펜니스
			case(212){itemString = `id:40016 `; iCumRate += 10;} //0.47438330220해머
			case(213){itemString = `id:40003 `; iCumRate += 10;} //0.47438330220숏 보우
			case(214){itemString = `id:40031 `; iCumRate += 10;} //0.47438330220석궁
			case(215){itemString = `id:40014 `; iCumRate += 10;} //0.47438330220콤포짓 보우
			case(216){itemString = `id:40013 `; iCumRate += 10;} //0.47438330220롱 보우
			case(217){itemString = `id:40081 `; iCumRate += 10;} //0.47438330220레더 롱 보우
			case(218){itemString = `id:40237 `; iCumRate += 10;} //0.47438330220엘븐 롱 보우
			case(219){itemString = `id:40236 `; iCumRate += 10;} //0.47438330220엘븐 숏 보우
			case(220){itemString = `id:40038 `; iCumRate += 10;} //0.47438330220라이트닝 원드
			case(221){itemString = `id:40040 `; iCumRate += 10;} //0.47438330220파이어 원드
			case(222){itemString = `id:40039 `; iCumRate += 10;} //0.47438330220아이스 원드
			case(223){itemString = `id:18503 `; iCumRate += 10;} //0.47438330220퀴러시어 헬름
			case(224){itemString = `id:18504 `; iCumRate += 10;} //0.47438330220크로스 풀 헬름
			case(225){itemString = `id:18505 `; iCumRate += 10;} //0.47438330220스파이크 헬름
			case(226){itemString = `id:18506 `; iCumRate += 10;} //0.47438330220윙 하프 헬름
			case(227){itemString = `id:17506 `; iCumRate += 10;} //0.47438330220롱그리브 부츠
			case(228){itemString = `id:17505 `; iCumRate += 10;} //0.47438330220플레이트 부츠
			case(229){itemString = `id:16504 `; iCumRate += 10;} //0.47438330220카운터 건틀렛
			case(230){itemString = `id:16505 `; iCumRate += 10;} //0.47438330220플루트 건틀렛
			case(231){itemString = `id:46001 `; iCumRate += 10;} //0.47438330220라운드 실드
			case(232){itemString = `id:15005 `; iCumRate += 10;} //0.47438330220모험가 슈트
			case(233){itemString = `id:14008 `; iCumRate += 10;} //0.47438330220풀세트 가죽 갑옷
			case(234){itemString = `id:13035 `; iCumRate += 10;} //0.47438330220라이트 멜카 체인메일
			case(235){itemString = `id:13037 `; iCumRate += 10;} //0.47438330220라이트 서코트 체인메일
			case(236){itemString = `id:13036 `; iCumRate += 10;} //0.47438330220라이트 라운드 폴드론 체인메일
			case(237){itemString = `id:13043 `; iCumRate += 10;} //0.47438330220레미니아 성월의 갑옷(남성용)
			case(238){itemString = `id:13044 `; iCumRate += 10;} //0.47438330220레미니아 성월의 갑옷(여성용)
			case(239){itemString = `id:40071 `; iCumRate += 20;} //0.94876660320''라' 음 빈 병
			case(240){itemString = `id:40072 `; iCumRate += 20;} //0.94876660320''시' 음 빈 병
			case(241){itemString = `id:40073 `; iCumRate += 20;} //0.94876660320''도' 음 빈 병
			case(242){itemString = `id:40074 `; iCumRate += 20;} //0.94876660320'레' 음 빈 병
			case(243){itemString = `id:40075 `; iCumRate += 20;} //0.94876660320'미' 음 빈 병
			case(244){itemString = `id:40076 `; iCumRate += 20;} //0.94876660320'파' 음 빈 병
			case(245){itemString = `id:40077 `; iCumRate += 20;} //0.94876660320'솔' 음 빈 병
			case(246){itemString = `id:40097  col1:000000 col2:000000`; iCumRate += 20;} //0.94876660320검은색 L 로드
			case(247){itemString = `id:40097  col1:800000 col2:800000`; iCumRate += 20;} //0.94876660320빨간색 L 로드
			case(248){itemString = `id:40097  col1:eeeeee col2:eeeeee`; iCumRate += 20;} //0.94876660320흰색 L 로드
			case(249){itemString = `id:40097  col1:583c90　col2:583c90`; iCumRate += 20;} //0.94876660320보라색 L 로드
			case(250){itemString = `id:18542 `; iCumRate += 20;} //0.94876660320빅 체인 풀 헬름
			case(251){itemString = `id:18543 `; iCumRate += 20;} //0.94876660320빅 슬릿 풀 헬름
			case(252){itemString = `id:18544 `; iCumRate += 20;} //0.94876660320빅 펠리칸 프로텍터
			case(253){itemString = `id:18547 `; iCumRate += 20;} //0.94876660320빅 파나쉬 헤드 프로텍터
			case(254){itemString = `id:63025  count:3`; iCumRate += 20;} //0.94876660320대용량 축복의 포션
			case(255){itemString = `id:51031  count:3`; iCumRate += 20;} //0.94876660320완전 회복의 포션
			case(256){itemString = `id:63027  expire:10080`; iCumRate += 20;} //0.94876660320밀랍 날개
			case(257){itemString = `id:51003  count:5`; iCumRate += 20;} //0.94876660320생명력50
			case(258){itemString = `id:51004  count:3`; iCumRate += 20;} //0.94876660320생명력100
			case(259){itemString = `id:51008  count:5`; iCumRate += 20;} //0.94876660320마나포션50
			case(260){itemString = `id:51013  count:5`; iCumRate += 20;} //0.94876660320스테미너포션50
			case(261){itemString = `id:51014  count:3`; iCumRate += 20;} //0.94876660320스테미너포션100
			case(262){itemString = `id:51022  count:5`; iCumRate += 20;} //0.94876660320생명력과 마나 30
			case(263){itemString = `id:51027  count:5`; iCumRate += 20;} //0.94876660320생명력과 스태미나30
			case(264){itemString = `id:51028  count:3`; iCumRate += 20;} //0.94876660320생명력과 스태미나50

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
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:15033`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	

}
