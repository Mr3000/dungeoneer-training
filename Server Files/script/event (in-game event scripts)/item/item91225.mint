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
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;

	int iRandom = Random(3233);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15079`; iCumRate += 1;} //0.030931024//0.030864198 볼레로 앤 점퍼 스커트
			case(1){itemString = `id:15112`; iCumRate += 1;} //0.030931024//0.030864198 셀리나 스쿨보이룩
			case(2){itemString = `id:15108`; iCumRate += 1;} //0.030931024//0.030864198 섹시 레이디스 탱크탑
			case(3){itemString = `id:17042`; iCumRate += 1;} //0.030931024//0.030864198 코레스 오리엔탈 롱 부츠
			case(4){itemString = `id:15064col1:ff6699 col2:990000 col3:990000`; iCumRate += 1;} //0.030931024//0.030864198 분홍 아이돌 리본 드레스
			case(5){itemString = `id:15060col1:e8e8e8 col2:e8e8e8 col3:e8e8e8`; iCumRate += 1;} //0.030931024//0.030864198 흰색 슬림 이너로브 웨어
			case(6){itemString = `id:17041col1:101010 col2:101010 col3:101010`; iCumRate += 1;} //0.030931024//0.030864198 검은색 덩굴무늬 헌팅부츠
			case(7){itemString = `id:15063`; iCumRate += 1;} //0.030931024//0.030864198 레이어드 프릴 원피스
			case(8){itemString = `id:15113`; iCumRate += 1;} //0.030931024//0.030864198 여성용 검사학교 교복 쇼트타입
			case(9){itemString = `id:15061`; iCumRate += 1;} //0.030931024//0.030864198 물결무늬 옆트임 튜닉
			case(10){itemString = `id:15059`; iCumRate += 1;} //0.030931024//0.030864198 터크스 탱크탑 반바지
			case(11){itemString = `id:15124col1:ceeeff col2:002c76 col3:ff4419`; iCumRate += 1;} //0.030931024//0.030864198 하늘색 클래식 슬리브 웨어
			case(12){itemString = `id:15065`; iCumRate += 1;} //0.030931024//0.030864198 엘라 베스트 스커트
			case(13){itemString = `id:15074`; iCumRate += 1;} //0.030931024//0.030864198 루이스 성직자 코트
			case(14){itemString = `id:18044col1:101010`; iCumRate += 1;} //0.030931024//0.030864198 검은색 범죄용 복면
			case(15){itemString = `id:63034col1:c00000`; iCumRate += 1;} //0.030931024//0.030864198 붉은색 염색 앰플
			case(16){itemString = `id:63033col1:000000`; iCumRate += 1;} //0.030931024//0.030864198 검은색 염색 앰플
			case(17){itemString = `id:15115`; iCumRate += 3;} //0.092793071//0.092592593 재기드 미니 스커트
			case(18){itemString = `id:15017`; iCumRate += 3;} //0.092793071//0.092592593 차이나드레스
			case(19){itemString = `id:18044`; iCumRate += 3;} //0.092793071//0.092592593 범죄용 복면
			case(20){itemString = `id:16519`; iCumRate += 3;} //0.092793071//0.092592593 초호화 장갑
			case(21){itemString = `id:18046`; iCumRate += 3;} //0.092793071//0.092592593 왕관형 머리장식
			case(22){itemString = `id:15124`; iCumRate += 3;} //0.092793071//0.092592593 클래식 슬리브 웨어
			case(23){itemString = `id:15060`; iCumRate += 3;} //0.092793071//0.092592593 클래식 슬리브 웨어
			case(24){itemString = `id:17041`; iCumRate += 3;} //0.092793071//0.092592593 덩굴무늬 헌팅부츠
			case(25){itemString = `id:15064`; iCumRate += 3;} //0.092793071//0.092592593 아이돌 리본 드레스
			case(26){itemString = `id:15070`; iCumRate += 3;} //0.092793071//0.092592593 아이돌 리본 드레스
			case(27){itemString = `id:40095`; iCumRate += 3;} //0.092793071//0.092592593 드래곤 블레이드
			case(28){itemString = `id:19007`; iCumRate += 3;} //0.092793071//0.092592593 야광 머플러 로브
			case(29){itemString = `id:18056`; iCumRate += 3;} //0.092793071//0.092592593 털 토끼 머리띠1 (수리불가)
			case(30){itemString = `id:18057`; iCumRate += 3;} //0.092793071//0.092592593 털 토끼 머리띠2  (수리불가)
			case(31){itemString = `id:18058`; iCumRate += 3;} //0.092793071//0.092592593 털 토끼 머리띠3  (수리불가)
			case(32){itemString = `id:18059`; iCumRate += 3;} //0.092793071//0.092592593 털 토끼 머리띠4  (수리불가)
			case(33){itemString = `id:18060`; iCumRate += 3;} //0.092793071//0.092592593 털 토끼 머리띠5  (수리불가)
			case(34){itemString = `id:18061`; iCumRate += 3;} //0.092793071//0.092592593 가죽 토끼 머리띠1  (수리불가)
			case(35){itemString = `id:18062`; iCumRate += 3;} //0.092793071//0.092592593 가죽 토끼 머리띠2  (수리불가)
			case(36){itemString = `id:18063`; iCumRate += 3;} //0.092793071//0.092592593 가죽 토끼 머리띠3  (수리불가)
			case(37){itemString = `id:18064`; iCumRate += 3;} //0.092793071//0.092592593 가죽 토끼 머리띠4  (수리불가)
			case(38){itemString = `id:18065`; iCumRate += 3;} //0.092793071//0.092592593 가죽 토끼 머리띠5  (수리불가)
			case(39){itemString = `id:18066`; iCumRate += 3;} //0.092793071//0.092592593 별 토끼 머리띠1  (수리불가)
			case(40){itemString = `id:18067`; iCumRate += 3;} //0.092793071//0.092592593 별 토끼 머리띠2  (수리불가)
			case(41){itemString = `id:18068`; iCumRate += 3;} //0.092793071//0.092592593 별 토끼 머리띠3  (수리불가)
			case(42){itemString = `id:18069`; iCumRate += 3;} //0.092793071//0.092592593 별 토끼 머리띠4  (수리불가)
			case(43){itemString = `id:18070`; iCumRate += 3;} //0.092793071//0.092592593 별 토끼 머리띠5 (수리불가)
			case(44){itemString = `id:18096`; iCumRate += 3;} //0.092793071//0.092592593 세이렌 고양이 가면
			case(45){itemString = `id:18097`; iCumRate += 3;} //0.092793071//0.092592593 세이렌 깃털 가면
			case(46){itemString = `id:18098`; iCumRate += 3;} //0.092793071//0.092592593 세이렌의 안경
			case(47){itemString = `id:18099`; iCumRate += 3;} //0.092793071//0.092592593 세이렌 작은 날개 가면
			case(48){itemString = `id:18100`; iCumRate += 3;} //0.092793071//0.092592593 세이렌 날개 가면
			case(49){itemString = `id:18101`; iCumRate += 3;} //0.092793071//0.092592593 세이렌 박쥐 날개 가면
			case(50){itemString = `id:18102`; iCumRate += 3;} //0.092793071//0.092592593 세이렌의 가면
			case(51){itemString = `id:15055`; iCumRate += 3;} //0.092793071//0.092592593 레더 미니 원피스
			case(52){itemString = `id:62005suffix:30501 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 인챈트 스크롤 (자이언트)
			case(53){itemString = `id:62005suffix:30302 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 인챈트 스크롤 (코볼트)
			case(54){itemString = `id:46006`; iCumRate += 3;} //0.092793071//0.092592593 카이트 실드
			case(55){itemString = `id:15053`; iCumRate += 3;} //0.092793071//0.092592593 플랫칼라 원피스
			case(56){itemString = `id:40030`; iCumRate += 3;} //0.092793071//0.092592593 투 핸디드 소드
			case(57){itemString = `id:17045`; iCumRate += 3;} //0.092793071//0.092592593 브이 넥 라인 레더 부츠
			case(58){itemString = `id:14004`; iCumRate += 3;} //0.092793071//0.092592593 클로스 메일
			case(59){itemString = `id:17040`; iCumRate += 3;} //0.092793071//0.092592593 엘라 스트랩 부츠
			case(60){itemString = `id:18516`; iCumRate += 3;} //0.092793071//0.092592593 이블 다잉 크라운
			case(61){itemString = `id:18521`; iCumRate += 3;} //0.092793071//0.092592593 유러피안 컴프
			case(62){itemString = `id:15136`; iCumRate += 3;} //0.092793071//0.092592593 고딕 레이스 스커트
			case(63){itemString = `id:18525`; iCumRate += 3;} //0.092793071//0.092592593 워터드롭 캡
			case(64){itemString = `id:18511`; iCumRate += 3;} //0.092793071//0.092592593 플루트 풀 헬름
			case(65){itemString = `id:18506`; iCumRate += 3;} //0.092793071//0.092592593 윙 하프 헬름
			case(66){itemString = `id:17505`; iCumRate += 3;} //0.092793071//0.092592593 플레이트 부츠
			case(67){itemString = `id:16505`; iCumRate += 3;} //0.092793071//0.092592593 플레이트 부츠
			case(68){itemString = `id:18502`; iCumRate += 3;} //0.092793071//0.092592593 본 헬름
			case(69){itemString = `id:15014`; iCumRate += 3;} //0.092793071//0.092592593 파발꾼의 옷
			case(70){itemString = `id:18113`; iCumRate += 3;} //0.092793071//0.092592593 뾰족귀 고양이 모자
			case(71){itemString = `id:18114`; iCumRate += 3;} //0.092793071//0.092592593 줄무늬 고양이 모자
			case(72){itemString = `id:18115`; iCumRate += 3;} //0.092793071//0.092592593 핀 고양이 모자
			case(73){itemString = `id:62005suffix:30702 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 인챈트 스크롤 (레이븐)
			case(74){itemString = `id:62005prefix:207 expire:960`; iCumRate += 3;} //0.092793071//0.092592593 인챈트 스크롤 (폭스
			case(75){itemString = `id:16517`; iCumRate += 24;} //0.742344572//0.740740741 반대 장갑
			case(76){itemString = `id:16516`; iCumRate += 24;} //0.742344572//0.740740741 찬성 장갑
			case(77){itemString = `id:16515`; iCumRate += 24;} //0.742344572//0.740740741 보 장갑
			case(78){itemString = `id:16514`; iCumRate += 24;} //0.742344572//0.740740741 바위 장갑
			case(79){itemString = `id:16513`; iCumRate += 24;} //0.742344572//0.740740741 가위 장갑
			case(80){itemString = `id:40068`; iCumRate += 24;} //0.742344572//0.740740741 가위 모양 지시봉
			case(81){itemString = `id:40069`; iCumRate += 24;} //0.742344572//0.740740741 바위 모양 지시봉
			case(82){itemString = `id:40070`; iCumRate += 24;} //0.742344572//0.740740741 보 모양 지시봉
			case(83){itemString = `id:18112`; iCumRate += 24;} //0.742344572//0.740740741 태양 분장
			case(84){itemString = `id:18111`; iCumRate += 24;} //0.742344572//0.740740741 나무 분장
			case(85){itemString = `id:18110`; iCumRate += 24;} //0.742344572//0.740740741 덤불 분장
			case(86){itemString = `id:18109`; iCumRate += 24;} //0.742344572//0.740740741 나오 얼굴 분장
			case(87){itemString = `id:18108`; iCumRate += 24;} //0.742344572//0.740740741 바위 분장
			case(88){itemString = `id:18029`; iCumRate += 24;} //0.742344572//0.740740741 나무테 안경
			case(89){itemString = `id:18028`; iCumRate += 24;} //0.742344572//0.740740741 접이식 안경
			case(90){itemString = `id:19008`; iCumRate += 24;} //0.742344572//0.740740741 코코 판다 로브
			case(91){itemString = `id:19009`; iCumRate += 24;} //0.742344572//0.740740741 코코 래빗 로브
			case(92){itemString = `id:19017`; iCumRate += 24;} //0.742344572//0.740740741 코코 래빗 로브
			case(93){itemString = `id:19016`; iCumRate += 24;} //0.742344572//0.740740741 곰 로브
			case(94){itemString = `id:40038`; iCumRate += 24;} //0.742344572//0.740740741 라이트닝 원드
			case(95){itemString = `id:40039`; iCumRate += 24;} //0.742344572//0.740740741 아이스 원드
			case(96){itemString = `id:40040`; iCumRate += 24;} //0.742344572//0.740740741 파이어 원드
			case(97){itemString = `id:40041`; iCumRate += 24;} //0.742344572//0.740740741 타격용 원드
			case(98){itemString = `id:40090`; iCumRate += 24;} //0.742344572//0.740740741 힐링 원드
			case(99){itemString = `id:40053`; iCumRate += 24;} //0.742344572//0.740740741 보라빛 장미 꽃다발
			case(100){itemString = `id:40051`; iCumRate += 24;} //0.742344572//0.740740741 보라빛 장미 한송이
			case(101){itemString = `id:18089`; iCumRate += 24;} //0.742344572//0.740740741 보라빛 장미 장식
			case(102){itemString = `id:40054`; iCumRate += 24;} //0.742344572//0.740740741 파란 장미 꽃다발
			case(103){itemString = `id:40052`; iCumRate += 24;} //0.742344572//0.740740741 파란 장미 한송이
			case(104){itemString = `manual:16500`; iCumRate += 24;} //0.742344572//0.740740741 울나 프로텍터 글러브
			case(105){itemString = `manual:40056`; iCumRate += 24;} //0.742344572//0.740740741 X 표시판
			case(106){itemString = `manual:18542`; iCumRate += 24;} //0.742344572//0.740740741 빅 체인 풀 헬름
			case(107){itemString = `manual:18543`; iCumRate += 24;} //0.742344572//0.740740741 슬릿 풀 헬름
			case(108){itemString = `manual:18544`; iCumRate += 24;} //0.742344572//0.740740741 펠리칸 프로텍터
			case(109){itemString = `manual:18547`; iCumRate += 24;} //0.742344572//0.740740741 파나쉬 헤드 프로텍터
			case(110){itemString = `manual:19020`; iCumRate += 24;} //0.742344572//0.740740741 나타네 설산용 코트
			case(111){itemString = `manual:62005prefix:7 expire:960`; iCumRate += 24;} //0.742344572//0.740740741 인챈트 스크롤 (폭스 헌터）
			case(112){itemString = `manual:16520`; iCumRate += 24;} //0.742344572//0.740740741 롱 레더 글러브
			case(113){itemString = `manual:15128`; iCumRate += 24;} //0.742344572//0.740740741 투 톤 비조 드레스
			case(114){itemString = `manual:16019`; iCumRate += 24;} //0.742344572//0.740740741 줄무늬 팔목 장갑
			case(115){itemString = `manual:18047`; iCumRate += 24;} //0.742344572//0.740740741 코레스 펠트 모자
			case(116){itemString = `manual:18008`; iCumRate += 24;} //0.742344572//0.740740741 스트라이프 캡
			case(117){itemString = `manual:15025`; iCumRate += 24;} //0.742344572//0.740740741 마법학교 여자교복
			case(118){itemString = `manual:18500`; iCumRate += 24;} //0.742344572//0.740740741 링 메일 헬름
			case(119){itemString = `manual:17504`; iCumRate += 24;} //0.742344572//0.740740741 라운드폴린 플레이트 부츠
			case(120){itemString = `manual:18043`; iCumRate += 24;} //0.742344572//0.740740741 코레스 니트 모자
			case(121){itemString = `manual:17506`; iCumRate += 24;} //0.742344572//0.740740741 롱그리브 부츠
			case(122){itemString = `manual:18026`; iCumRate += 24;} //0.742344572//0.740740741 몬거 상인모자
			case(123){itemString = `manual:15052`; iCumRate += 24;} //0.742344572//0.740740741 터크스 투톤 튜닉
			case(124){itemString = `manual:19005`; iCumRate += 24;} //0.742344572//0.740740741 머플러 로브
			case(125){itemString = `manual:18040`; iCumRate += 24;} //0.742344572//0.740740741 코레스 꼭지 베레모
			case(126){itemString = `manual:18038`; iCumRate += 24;} //0.742344572//0.740740741 깃털 배렛 모자
			case(127){itemString = `manual:15042`; iCumRate += 24;} //0.742344572//0.740740741 롱넥 원피스
			case(128){itemString = `manual:46001`; iCumRate += 24;} //0.742344572//0.740740741 라운드 실드
			case(129){itemString = `manual:40012`; iCumRate += 24;} //0.742344572//0.740740741 바스타드 소드
			case(130){itemString = `manual:91006expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 10살의 키가 되는 포션
			case(131){itemString = `manual:91010expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 11살의 키가 되는 포션
			case(132){itemString = `manual:91011expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 12살의 키가 되는 포션
			case(133){itemString = `id:91012expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 13살의 키가 되는 포션
			case(134){itemString = `id:91013expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 14살의 키가 되는 포션
			case(135){itemString = `id:91014expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 15살의 키가 되는 포션
			case(136){itemString = `id:91015expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 16살의 키가 되는 포션
			case(137){itemString = `id:91007expire:43200`; iCumRate += 22;} //0.680482524//0.679012346 17살의 키가 되는 포션
			case(138){itemString = `id:63025count:3`; iCumRate += 22;} //0.680482524//0.679012346 대용량 축복의 포션
			case(139){itemString = `id:51031count:3`; iCumRate += 22;} //0.680482524//0.679012346 완전 회복의 포션
			case(140){itemString = `id:63026`; iCumRate += 22;} //0.680482524//0.679012346 원격 은행 이용권
			case(141){itemString = `id:63047`; iCumRate += 22;} //0.680482524//0.679012346 원격 힐러집 이용권
			case(142){itemString = `id:63043`; iCumRate += 22;} //0.680482524//0.679012346 어드밴스드 깃털
			case(143){itemString = `id:63043count:3`; iCumRate += 22;} //0.680482524//0.679012346 어드밴스드 깃털
			case(144){itemString = `id:63027expire:10080`; iCumRate += 22;} //0.680482524//0.679012346 밀랍 날개
			case(145){itemString = `id:63029count:5`; iCumRate += 22;} //0.680482524//0.679012346 캠프파이어키트
			case(146){itemString = `id:63044count:3`; iCumRate += 22;} //0.680482524//0.679012346 파티 부활의 깃털
			case(147){itemString = `id:63039expire:10080`; iCumRate += 22;} //0.680482524//0.679012346 캠프 키트
			case(148){itemString = `id:51003count:5`; iCumRate += 22;} //0.680482524//0.679012346 생명력 50 포션
			case(149){itemString = `id:51004count:3`; iCumRate += 22;} //0.680482524//0.679012346 생명력 100 포션
			case(150){itemString = `id:51007`; iCumRate += 22;} //0.680482524//0.679012346 마나 30 포션
			case(151){itemString = `id:51008count:5`; iCumRate += 22;} //0.680482524//0.679012346 마나 50 포션
			case(152){itemString = `id:51013count:5`; iCumRate += 22;} //0.680482524//0.679012346 스태미나 50 포션
			case(153){itemString = `id:51014count:3`; iCumRate += 22;} //0.680482524//0.679012346 스태미나 100 포션
			case(154){itemString = `id:51001count:5`; iCumRate += 22;} //0.680482524//0.679012346 생명력 10 포션
			case(155){itemString = `id:51002count:3`; iCumRate += 22;} //0.680482524//0.679012346 생명력 30 포션
			case(156){itemString = `id:51022count:5`; iCumRate += 22;} //0.680482524//0.679012346 생명력과 마나 30 포션
			case(157){itemString = `id:51027count:5`; iCumRate += 22;} //0.680482524//0.679012346 생명력과 스태미나 30 포션
			case(158){itemString = `id:51028count:3`; iCumRate += 22;} //0.680482524//0.679012346 생명력과 스태미나 50 포션
			case(159){itemString = `id:51029`; iCumRate += 22;} //0.680482524//0.679012346 생명력과 스태미나 100 포션
			case(160){itemString = `id:63000`; iCumRate += 22;} //0.680482524//0.679012346 피닉스의 깃털
			case(161){itemString = `id:51036`; iCumRate += 22;} //0.680482524//0.679012346 다이어트 포션 U
			case(162){itemString = `id:51038`; iCumRate += 22;} //0.680482524//0.679012346 다이어트 포션 L
			case(163){itemString = `id:51039`; iCumRate += 22;} //0.680482524//0.679012346 다이어트 포션 F
			case(164){itemString = `id:17006`; iCumRate += 22;} //0.680482524//0.679012346 천신발
			case(165){itemString = `id:18086`; iCumRate += 22;} //0.680482524//0.679012346 데이지 꽃 장식
			case(166){itemString = `id:18087`; iCumRate += 22;} //0.680482524//0.679012346 장미 꽃 장식
			case(167){itemString = `id:18088`; iCumRate += 22;} //0.680482524//0.679012346 화관
			case(168){itemString = `id:18090`; iCumRate += 22;} //0.680482524//0.679012346 파란 장미 장식
			case(169){itemString = `id:40046`; iCumRate += 22;} //0.680482524//0.679012346 장미 한송이
			case(170){itemString = `id:40047`; iCumRate += 22;} //0.680482524//0.679012346 장미 꽃다발
			case(171){itemString = `id:18541`; iCumRate += 22;} //0.680482524//0.679012346 대머리 가발
			case(172){itemString = `id:18103`; iCumRate += 22;} //0.680482524//0.679012346 종이 모자
			case(173){itemString = `id:40071`; iCumRate += 5;} //0.154655119//0.154320988 '라' 음 빈 병
			case(174){itemString = `id:40072`; iCumRate += 5;} //0.154655119//0.154320988 '시' 음 빈 병
			case(175){itemString = `id:40073`; iCumRate += 5;} //0.154655119//0.154320988 '도' 음 빈 병
			case(176){itemString = `id:40074`; iCumRate += 5;} //0.154655119//0.154320988 '레' 음 빈 병
			case(177){itemString = `id:40075`; iCumRate += 5;} //0.154655119//0.154320988 '미' 음 빈 병
			case(178){itemString = `id:40076`; iCumRate += 5;} //0.154655119//0.154320988 '파' 음 빈 병
			case(179){itemString = `id:40077`; iCumRate += 5;} //0.154655119//0.154320988 '솔' 음 빈 병
			case(180){itemString = `id:60037count:5`; iCumRate += 22;} //0.680482524//0.679012346 블랙 유스 포션
			case(181){itemString = `id:60038count:5`; iCumRate += 22;} //0.680482524//0.679012346 레드 포션
			case(182){itemString = `id:62004count:5`; iCumRate += 22;} //0.680482524//0.679012346 마법가루
			case(183){itemString = `id:50012`; iCumRate += 22;} //0.680482524//0.679012346 황금 달걀
			case(184){itemString = `id:50013`; iCumRate += 22;} //0.680482524//0.679012346 황금 사과
			case(185){itemString = `id:50164quality:100`; iCumRate += 22;} //0.680482524//0.679012346 T본 스테이크 100퀄리티
			case(186){itemString = `id:50201quality:100`; iCumRate += 22;} //0.680482524//0.679012346 BnR 100퀄리티
			case(187){itemString = `id:50123quality:100`; iCumRate += 22;} //0.680482524//0.679012346 베이컨구이 100퀄리티
			case(188){itemString = `id:50124quality:100`; iCumRate += 22;} //0.680482524//0.679012346 비프 스테이크 100퀄리티
			case(189){itemString = `id:50202`; iCumRate += 22;} //0.680482524//0.679012346 키스 온 더 립스
			case(190){itemString = `id:50203`; iCumRate += 22;} //0.680482524//0.679012346 레드 선라이즈
			case(191){itemString = `id:2001`; iCumRate += 22;} //0.680482524//0.679012346 금화주머니
			case(192){itemString = `id:2006`; iCumRate += 22;} //0.680482524//0.679012346 큰 금화주머니
			case(193){itemString = `id:18010`; iCumRate += 22;} //0.680482524//0.679012346 몬거 스마트 캡
			case(194){itemString = `id:15131`; iCumRate += 22;} //0.680482524//0.679012346 핀 에이프런 스커트
			case(195){itemString = `id:40015`; iCumRate += 22;} //0.680482524//0.679012346 플루트 숏 소드
			case(196){itemString = `id:17016`; iCumRate += 22;} //0.680482524//0.679012346 필드 컴뱃슈즈
			case(197){itemString = `id:17015`; iCumRate += 22;} //0.680482524//0.679012346 컴뱃슈즈
			case(198){itemString = `id:17005`; iCumRate += 22;} //0.680482524//0.679012346 사냥꾼 신발
			case(199){itemString = `id:17002`; iCumRate += 22;} //0.680482524//0.679012346 검사 신발
			case(200){itemString = `id:17022`; iCumRate += 22;} //0.680482524//0.679012346 레더부츠
			case(201){itemString = `id:17001`; iCumRate += 22;} //0.680482524//0.679012346 가죽 부츠
			case(202){itemString = `id:17007`; iCumRate += 22;} //0.680482524//0.679012346 가죽 구두
			case(203){itemString = `id:16009`; iCumRate += 22;} //0.680482524//0.679012346 사냥꾼장갑
			case(204){itemString = `id:40005`; iCumRate += 22;} //0.680482524//0.679012346 숏 소드
			case(205){itemString = `id:15031`; iCumRate += 22;} //0.680482524//0.679012346 마법학교 교복
			case(206){itemString = `id:19012`; iCumRate += 22;} //0.680482524//0.679012346 트루디 레이어드 로브
			case(207){itemString = `id:18004`; iCumRate += 22;} //0.680482524//0.679012346 몬거 패션모자
			case(208){itemString = `id:15132`; iCumRate += 22;} //0.680482524//0.679012346 내추럴 베스트 웨어
			case(209){itemString = `id:15043`; iCumRate += 22;} //0.680482524//0.679012346 스포티 웨어세트
			case(210){itemString = `id:40010`; iCumRate += 22;} //0.680482524//0.679012346 @롱 소드
			case(211){itemString = `id:40081`; iCumRate += 22;} //0.680482524//0.679012346 @레더 롱 보우
			case(212){itemString = `id:40078`; iCumRate += 22;} //0.680482524//0.679012346 @비펜니스
			case(213){itemString = `id:40079`; iCumRate += 22;} //0.680482524//0.679012346 @메이스
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
