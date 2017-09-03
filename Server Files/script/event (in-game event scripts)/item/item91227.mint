//////////////////////////////////////////////////////////////////////////////////
// Mabinogi Project : Use Item Script
// 아이템 사용시의 이벤트 함수
//
// nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
// nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
// isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
// 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(3139);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:40171  `; iCumRate += 1;} //0.0318572794 마사무네
			case(1){itemString = `id:40170  `; iCumRate += 2;} //0.0637145588 일본식 양손검
			case(2){itemString = `id:40193  `; iCumRate += 1;} //0.0318572794 무라마사
			case(3){itemString = `id:40192  `; iCumRate += 2;} //0.0637145588 일본식 한손검
			case(4){itemString = `id:40195  `; iCumRate += 1;} //0.0318572794 요시미츠
			case(5){itemString = `id:40194  `; iCumRate += 2;} //0.0637145588 와키자시(일본식 단검)
			case(6){itemString = `id:46007  col1:000000 col2:660000 col3:ffff00 `; iCumRate += 3;} //0.0955718382 검정, 갈색, 노란 헤테로 카이트 실드
			case(7){itemString = `id:18518  col1:800000 col2:800000 col3:800000 `; iCumRate += 3;} //0.0955718382 붉은 드래곤 크레스트
			case(8){itemString = `id:40010  col1:88bbff col2:404040 col3:202020 `; iCumRate += 3;} //0.0955718382 청색 롱소드
			case(9){itemString = `id:40006  col1:800010 col2:1111111 col3:1111111 `; iCumRate += 3;} //0.0955718382 붉은 단검
			case(10){itemString = `id:40080  col1:800010 col2:1111111 col3:222222 `; iCumRate += 3;} //0.0955718382 붉은 날, 검은 손잡이의 글라디우스
			case(11){itemString = `id:13038  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 어두운 회색 더스틴 실버 나이트 아머
			case(12){itemString = `id:40080  col1:ff66ff col2:404040 col3:202020 suffix:30702`; iCumRate += 3;} //0.0955718382 복숭아색 레이븐 글라디우스
			case(13){itemString = `id:40010  col1:290010 col2:1111111 col3:1111111 `; iCumRate += 3;} //0.0955718382 어두운 적색 롱소드
			case(14){itemString = `id:14013  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 어두운 회색 로리카 세그먼타타에
			case(15){itemString = `id:13022  col1:113010 col2:113011 col3:1130111 `; iCumRate += 3;} //0.0955718382 녹색 로즈 플레이트 아머 (P타입)
			case(16){itemString = `id:16524  col1:666666 col2:222222 col3:222222 suffix:10706`; iCumRate += 3;} //0.0955718382 어두운 회색 더스틴 실버 나이트 뱀브레이스
			case(17){itemString = `id:13033  suffix:30901 `; iCumRate += 3;} //0.0955718382 암흑의 발렌시아 크로스 라인 플레이트 아머(남성용)
			case(18){itemString = `id:13023  col1:ebbe21 col2:111111 col3:ebbe21 `; iCumRate += 3;} //0.0955718382 금색&검은색 로즈 플레이트 아머 (B 타입)
			case(19){itemString = `id:40095  col1:666666 col2:222222 col3:222222 `; iCumRate += 3;} //0.0955718382 어두운 회색의 드래곤 실드
			case(20){itemString = `id:13046  col1:111111 col2:ebbe21  col3:111111 `; iCumRate += 3;} //0.0955718382 금색&검은색 아리쉬 아슈빈 아머(여성용)
			case(21){itemString = `id:40003  durability:11000 durability_max:11000`; iCumRate += 2;} //0.0637145588 숏보우
			case(22){itemString = `id:40005  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 숏소드
			case(23){itemString = `id:40006  durability:13000 durability_max:13000`; iCumRate += 2;} //0.0637145588 단검
			case(24){itemString = `id:40010  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 롱소드
			case(25){itemString = `id:40011  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 브로드소드
			case(26){itemString = `id:40012  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 바스타드소드
			case(27){itemString = `id:40013  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 롱보우
			case(28){itemString = `id:40014  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 콤포짓 보우
			case(29){itemString = `id:40015  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 플루트 숏소드
			case(30){itemString = `id:40016  durability:19000 durability_max:19000`; iCumRate += 2;} //0.0637145588 해머
			case(31){itemString = `id:40030  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 투핸드소드
			case(32){itemString = `id:40031  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 크로스보우(석궁)
			case(33){itemString = `id:40033  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 크레이모어
			case(34){itemString = `id:40038  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 라이트닝 원드
			case(35){itemString = `id:40039  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 아이스 원드
			case(36){itemString = `id:40040  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 파이어 원드
			case(37){itemString = `id:40041  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 타격용 원드
			case(38){itemString = `id:40078  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 비펜니스
			case(39){itemString = `id:40079  durability:19000 durability_max:19000`; iCumRate += 2;} //0.0637145588 메이스
			case(40){itemString = `id:40080  durability:18000 durability_max:18000`; iCumRate += 2;} //0.0637145588 글라디우스
			case(41){itemString = `id:40081  durability:16000 durability_max:16000`; iCumRate += 2;} //0.0637145588 레더 롱 보우
			case(42){itemString = `id:40083  durability:15000 durability_max:15000`; iCumRate += 2;} //0.0637145588 훅커틀러스
			case(43){itemString = `id:40090  durability:12000 durability_max:12000`; iCumRate += 2;} //0.0637145588 힐링 원드
			case(44){itemString = `id:46001  durability:14000 durability_max:14000`; iCumRate += 2;} //0.0637145588 라운드 실드
			case(45){itemString = `id:46006  durability:20000 durability_max:20000`; iCumRate += 2;} //0.0637145588 카이트실드
			case(46){itemString = `id:46008  durability:13000 durability_max:13000`; iCumRate += 2;} //0.0637145588 라이트 헤테로 카이트 실드
			case(47){itemString = `id:13043  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 레미니아 성월의 갑옷(남성용)
			case(48){itemString = `id:13044  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 레미니아 성월의 갑옷(여성용)
			case(49){itemString = `id:13045  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 아리쉬 아슈빈 아머(남성용)
			case(50){itemString = `id:13046  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 아리쉬 아슈빈 아머(여성용)
			case(51){itemString = `id:13047  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 키리누스진 하프 플레이트 아머(남성용)
			case(52){itemString = `id:13048  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 키리누스진 하프 플레이트 아머(여성용)
			case(53){itemString = `id:16525  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 아리쉬 아슈빈 건틀렛
			case(54){itemString = `id:17518  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 아리쉬 아슈빈 부츠(남성용)
			case(55){itemString = `id:17519  durability:17000 durability_max:17000`; iCumRate += 2;} //0.0637145588 아리쉬 아슈빈 부츠(남성용)
			case(56){itemString = `id:13035  `; iCumRate += 15;} //0.4778591908 라이트 멜카 체인메일
			case(57){itemString = `id:13043  `; iCumRate += 15;} //0.4778591908 레미니아 성월의 갑옷(남성용)
			case(58){itemString = `id:13044  `; iCumRate += 15;} //0.4778591908 레미니아 성월의 갑옷(여성용)
			case(59){itemString = `id:13045  `; iCumRate += 15;} //0.4778591908 아리쉬 아슈빈 아머(남성용)
			case(60){itemString = `id:13046  `; iCumRate += 15;} //0.4778591908 아리쉬 아슈빈 아머(여성용)
			case(61){itemString = `id:13047  `; iCumRate += 15;} //0.4778591908 키리누스진 하프 플레이트 아머(남성용)
			case(62){itemString = `id:13048  `; iCumRate += 15;} //0.4778591908 키리누스진 하프 플레이트 아머(남성용)
			case(63){itemString = `id:62005  prefix:20714`; iCumRate += 15;} //0.4778591908 인챈트 스크롤(신중한)
			case(64){itemString = `id:62005  suffix:31002`; iCumRate += 15;} //0.4778591908 인챈트 스크롤(기사)
			case(65){itemString = `id:62005  suffix:31103`; iCumRate += 15;} //0.4778591908 인챈트 스크롤(스파이크)
			case(66){itemString = `id:62005  prefix:8`; iCumRate += 15;} //0.4778591908 인챈트 스크롤(울프헌터)
			case(67){itemString = `id:62005  suffix:30501 `; iCumRate += 15;} //0.4778591908 인챈트 스크롤(자이언트)
			case(68){itemString = `id:62005  suffix:30302 `; iCumRate += 15;} //0.4778591908 인챈트 스크롤(코볼트)
			case(69){itemString = `id:62005  suffix:30702 `; iCumRate += 15;} //0.4778591908 인챈트 스크롤(레이븐)
			case(70){itemString = `id:62005  prefix:207 `; iCumRate += 15;} //0.4778591908 인챈트 스크롤(폭스)
			case(71){itemString = `id:62005  prefix:7 `; iCumRate += 15;} //0.4778591908 인챈트 스크롤(폭스헌터)
			case(72){itemString = `id:14004  `; iCumRate += 20;} //0.6371455878 크로스메일
			case(73){itemString = `id:14005  `; iCumRate += 25;} //0.7964319847 드란도스 레더메일
			case(74){itemString = `id:14006  `; iCumRate += 25;} //0.7964319847 리넨 퀴라스
			case(75){itemString = `id:14019  `; iCumRate += 25;} //0.7964319847 그레이스 플레이트 아머
			case(76){itemString = `id:14023  `; iCumRate += 25;} //0.7964319847 본 마린 아머(남성용)
			case(77){itemString = `id:14024  `; iCumRate += 25;} //0.7964319847 본 마린 아머(여성용)
			case(78){itemString = `id:16000  `; iCumRate += 25;} //0.7964319847 레더 글러브
			case(79){itemString = `id:16001  `; iCumRate += 25;} //0.7964319847 퀼팅 글러브
			case(80){itemString = `id:16002  `; iCumRate += 25;} //0.7964319847 리넨 글러브
			case(81){itemString = `id:16004  `; iCumRate += 25;} //0.7964319847 스터디드 브레이슬렛
			case(82){itemString = `id:16008  `; iCumRate += 25;} //0.7964319847 코레스 씨프 글러브
			case(83){itemString = `id:16015  `; iCumRate += 25;} //0.7964319847 브레이슬렛
			case(84){itemString = `id:16029  `; iCumRate += 25;} //0.7964319847 레더 스티치 글러브
			case(85){itemString = `id:16500  `; iCumRate += 25;} //0.7964319847 울나 프로텍터 글러브
			case(86){itemString = `id:16502  `; iCumRate += 25;} //0.7964319847 플레이트 건틀렛
			case(87){itemString = `id:16505  `; iCumRate += 25;} //0.7964319847 플루트 건틀렛
			case(88){itemString = `id:16506  `; iCumRate += 25;} //0.7964319847 링 글러브
			case(89){itemString = `id:16520  `; iCumRate += 25;} //0.7964319847 롱 레더 글러브
			case(90){itemString = `id:16523  `; iCumRate += 25;} //0.7964319847 그레이스 건틀렛
			case(91){itemString = `id:16525  `; iCumRate += 25;} //0.7964319847 아리쉬 아슈빈 건틀렛
			case(92){itemString = `id:17001  `; iCumRate += 25;} //0.7964319847 가죽 부츠
			case(93){itemString = `id:17002  `; iCumRate += 25;} //0.7964319847 검사 신발
			case(94){itemString = `id:17003  `; iCumRate += 25;} //0.7964319847 가죽 신발
			case(95){itemString = `id:17004  `; iCumRate += 25;} //0.7964319847 마법 학교 신발
			case(96){itemString = `id:17005  `; iCumRate += 25;} //0.7964319847 사냥꾼 신발
			case(97){itemString = `id:17016  `; iCumRate += 25;} //0.7964319847 필드 컴뱃슈즈
			case(98){itemString = `id:17017  `; iCumRate += 25;} //0.7964319847 레더코트 슈즈
			case(99){itemString = `id:17018  `; iCumRate += 25;} //0.7964319847 검사 신발
			case(100){itemString = `id:17019  `; iCumRate += 25;} //0.7964319847 대장장이 신발
			case(101){itemString = `id:17020  `; iCumRate += 25;} //0.7964319847 씨프 슈즈
			case(102){itemString = `id:17021  `; iCumRate += 25;} //0.7964319847 로리카 샌들
			case(103){itemString = `id:17064  `; iCumRate += 25;} //0.7964319847 카멜 스피리트 부츠
			case(104){itemString = `id:17503  `; iCumRate += 25;} //0.7964319847 그리브 부츠
			case(105){itemString = `id:17504  `; iCumRate += 25;} //0.7964319847 라운드폴린 플레이트 부츠
			case(106){itemString = `id:17505  `; iCumRate += 25;} //0.7964319847 플레이트 부츠
			case(107){itemString = `id:17518  `; iCumRate += 25;} //0.7964319847 아리쉬 아슈빈 부츠(남성용)
			case(108){itemString = `id:17519  `; iCumRate += 25;} //0.7964319847 아리쉬 아슈빈 부츠(여성용)
			case(109){itemString = `id:18500  `; iCumRate += 25;} //0.7964319847 링 메일 헬름
			case(110){itemString = `id:18501  `; iCumRate += 25;} //0.7964319847 가디언 헬름
			case(111){itemString = `id:18502  `; iCumRate += 25;} //0.7964319847 본 헬름
			case(112){itemString = `id:18503  `; iCumRate += 25;} //0.7964319847 퀴러시어 헬름
			case(113){itemString = `id:18504  `; iCumRate += 25;} //0.7964319847 크로스 풀 헬름
			case(114){itemString = `id:18505  `; iCumRate += 25;} //0.7964319847 스파이크 헬름
			case(115){itemString = `id:18506  `; iCumRate += 25;} //0.7964319847 윙 하프 헬름
			case(116){itemString = `id:18509  `; iCumRate += 25;} //0.7964319847 배서닛
			case(117){itemString = `id:18511  `; iCumRate += 25;} //0.7964319847 플루트 풀 헬름
			case(118){itemString = `id:18513  `; iCumRate += 25;} //0.7964319847 스파이크 캡
			case(119){itemString = `id:18514  `; iCumRate += 25;} //0.7964319847 버디페이스 캡
			case(120){itemString = `id:18515  `; iCumRate += 25;} //0.7964319847 트윈 혼 캡
			case(121){itemString = `id:18516  `; iCumRate += 25;} //0.7964319847 이블 다잉 크라운
			case(122){itemString = `id:18517  `; iCumRate += 25;} //0.7964319847 아이언 마스킹 헤드기어
			case(123){itemString = `id:18518  `; iCumRate += 25;} //0.7964319847 드래곤 크레스트
			case(124){itemString = `id:18519  `; iCumRate += 25;} //0.7964319847 파나쉬 헤드 프로텍터
			case(125){itemString = `id:18520  `; iCumRate += 25;} //0.7964319847 스틸 헤드기어
			case(126){itemString = `id:18521  `; iCumRate += 25;} //0.7964319847 유러피안 컴프
			case(127){itemString = `id:18522  `; iCumRate += 25;} //0.7964319847 펠리칸 프로텍터
			case(128){itemString = `id:18523  `; iCumRate += 25;} //0.7964319847 스완 윙즈 캡
			case(129){itemString = `id:18524  `; iCumRate += 25;} //0.7964319847 포 윙즈 캡
			case(130){itemString = `id:18525  `; iCumRate += 25;} //0.7964319847 워터드롭 캡
			case(131){itemString = `id:18542  `; iCumRate += 25;} //0.7964319847 빅 체인 풀 헬름
			case(132){itemString = `id:18543  `; iCumRate += 25;} //0.7964319847 빅 슬릿 풀 헬름
			case(133){itemString = `id:18544  `; iCumRate += 25;} //0.7964319847 빅 펠리칸 프로텍터
			case(134){itemString = `id:18545  `; iCumRate += 25;} //0.7964319847 그레이스 헬멧
			case(135){itemString = `id:18546  `; iCumRate += 25;} //0.7964319847 노르만 워리어 헬멧
			case(136){itemString = `id:18547  `; iCumRate += 25;} //0.7964319847 빅 파나쉬 헤드 프로텍터
			case(137){itemString = `id:18551  `; iCumRate += 25;} //0.7964319847 본 마린 헬름
			case(138){itemString = `id:40003  `; iCumRate += 25;} //0.7964319847 숏 보우
			case(139){itemString = `id:40005  `; iCumRate += 25;} //0.7964319847 숏 소드
			case(140){itemString = `id:40006  `; iCumRate += 25;} //0.7964319847 단검
			case(141){itemString = `id:40010  `; iCumRate += 25;} //0.7964319847 롱 소드
			case(142){itemString = `id:40011  `; iCumRate += 25;} //0.7964319847 브로드 소드
			case(143){itemString = `id:40012  `; iCumRate += 25;} //0.7964319847 바스타드 소드
			case(144){itemString = `id:40013  `; iCumRate += 25;} //0.7964319847 롱 보우
			case(145){itemString = `id:40014  `; iCumRate += 25;} //0.7964319847 콤포짓 보우
			case(146){itemString = `id:40015  `; iCumRate += 25;} //0.7964319847 플루트 숏 소드
			case(147){itemString = `id:40016  `; iCumRate += 25;} //0.7964319847 해머
			case(148){itemString = `id:40030  `; iCumRate += 25;} //0.7964319847 투 핸디드 소드
			case(149){itemString = `id:40031  `; iCumRate += 25;} //0.7964319847 석궁
			case(150){itemString = `id:40033  `; iCumRate += 25;} //0.7964319847 석궁
			case(151){itemString = `id:40038  `; iCumRate += 25;} //0.7964319847 라이트닝 원드
			case(152){itemString = `id:40039  `; iCumRate += 25;} //0.7964319847 아이스 원드
			case(153){itemString = `id:40040  `; iCumRate += 25;} //0.7964319847 파이어 원드
			case(154){itemString = `id:40041  `; iCumRate += 25;} //0.7964319847 타격용 원드
			case(155){itemString = `id:40078  `; iCumRate += 25;} //0.7964319847 비펜니스
			case(156){itemString = `id:40079  `; iCumRate += 25;} //0.7964319847 메이스
			case(157){itemString = `id:40080  `; iCumRate += 25;} //0.7964319847 글라디우스
			case(158){itemString = `id:40081  `; iCumRate += 25;} //0.7964319847 레더 롱 보우
			case(159){itemString = `id:40083  `; iCumRate += 25;} //0.7964319847 훅 커틀러스
			case(160){itemString = `id:40090  `; iCumRate += 25;} //0.7964319847 힐링 원드
			case(161){itemString = `id:40100  `; iCumRate += 25;} //0.7964319847 본 마린 소드
			case(162){itemString = `id:46001  `; iCumRate += 25;} //0.7964319847 라운드 실드
			case(163){itemString = `id:46006  `; iCumRate += 25;} //0.7964319847 카이트 실드
			case(164){itemString = `id:46008  `; iCumRate += 25;} //0.7964319847 라이트 헤테로 카이트 실드
			case(165){itemString = `id:91006  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션10
			case(166){itemString = `id:91010  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션11
			case(167){itemString = `id:91011  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션12
			case(168){itemString = `id:91012  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션13
			case(169){itemString = `id:91013  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션14
			case(170){itemString = `id:91014  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션15
			case(171){itemString = `id:91015  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션16
			case(172){itemString = `id:91007  expire:43200`; iCumRate += 20;} //0.6371455878 체형변화포션17
			case(173){itemString = `id:63025  count:3`; iCumRate += 45;} //1.4335775725 대용량 축포
			case(174){itemString = `id:51031  count:3`; iCumRate += 25;} //0.7964319847 완전호복포션
			case(175){itemString = `id:63027  expire:10080`; iCumRate += 25;} //0.7964319847 밀납 날개
			case(176){itemString = `id:51003  count:5`; iCumRate += 25;} //0.7964319847 생명력 포션 50
			case(177){itemString = `id:51004  count:3`; iCumRate += 25;} //0.7964319847 생명력 포션 100
			case(178){itemString = `id:51008  count:5`; iCumRate += 25;} //0.7964319847 마나 포션 50
			case(179){itemString = `id:51013  count:5`; iCumRate += 25;} //0.7964319847 스태미나 포션 50
			case(180){itemString = `id:51014  count:3`; iCumRate += 25;} //0.7964319847 스태미나 포션 100
			case(181){itemString = `id:51022  count:5`; iCumRate += 25;} //0.7964319847 생명력과 마나 30 포션
			case(182){itemString = `id:51027  count:5`; iCumRate += 25;} //0.7964319847 생명력과 스태미나 30 포션
			case(183){itemString = `id:51028  count:3`; iCumRate += 25;} //0.7964319847 생명력과 스태미나 50 포션
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
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
