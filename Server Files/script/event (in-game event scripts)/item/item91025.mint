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
	//알렉시나의 모험가 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(2077);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15222`; iCumRate += 4;} //0.1925854598 2077그레이스 숄 드레스(여성용)
			case(1){itemString = `id:40017 col1:86402894 col2:660000 col3:000000 prefix:20501 suffix:31003`; iCumRate += 4;} //0.1925854598 2077빨간색-> 검은색 반짝이, 심플한 위자드(인챈트) 만돌린
			case(2){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 4;} //0.1925854598 2077검은 석궁
			case(3){itemString = `id:40081 col2:800000`; iCumRate += 4;} //0.1925854598 2077붉은 레더 롱 보우
			case(4){itemString = `id:40031 col1:eeeeee`; iCumRate += 4;} //0.1925854598 2077백석 석궁
			case(5){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 4;} //0.1925854598 2077보라색 콤포짓 보우
			case(6){itemString = `id:46006 col1:eeeeee col2:660000 col3:eeeeee`; iCumRate += 4;} //0.1925854598 2077붉은가이트 실드
			case(7){itemString = `id:40011 col1:FFF270 col2:ebbe21 col3:ebbe21`; iCumRate += 4;} //0.1925854598 2077금색 브로드 소드
			case(8){itemString = `id:46001`; iCumRate += 4;} //0.1925854598 2077검은 바탕 흰 테두리 라운드 실드
			case(9){itemString = `id:14013 prefix:20403 suffix:30515`; iCumRate += 4;} //0.1925854598 2077승리의 해적(인챈트) 로리카 세그먼타타에
			case(10){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 4;} //0.1925854598 2077원리의 해적(인챈트) 그레이스 플레이트 아머
			case(11){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 4;} //0.1925854598 2077붉은 색 야광머플러 로브
			case(12){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 4;} //0.1925854598 2077흰색 야광 머플러 로브
			case(13){itemString = `id:19007 col1:800000 col2:ffffff col3:ffffff`; iCumRate += 4;} //0.1925854598 2077검은 색 야광머플러 로브
			case(14){itemString = `id:15135 prefix:207 suffix:10807`; iCumRate += 4;} //0.1925854598 2077폭스 컨시더레이션(인챈트) 시크 수트
			case(15){itemString = `id:40015 col1:ff66ff col2:ff66cc col3:ff66cc`; iCumRate += 4;} //0.1925854598 2077빅 플루트 숏 소드
			case(16){itemString = `id:80007`; iCumRate += 4;} //0.1925854598 2077나오의 탐험가 복장
			case(17){itemString = `id:17073`; iCumRate += 4;} //0.1925854598 2077타이업 롱 부츠
			case(18){itemString = `id:40049 col1:66ffff col2:66ffff col3:66ffff`; iCumRate += 4;} //0.1925854598 2077바다빛 플루트
			case(19){itemString = `id:80008`; iCumRate += 4;} //0.1925854598 2077나오의 이리아 캐주얼 룩
			case(20){itemString = `id:55000`; iCumRate += 8;} //0.3851709196 2077스톤 바이슨의뿔
			case(21){itemString = `id:55001`; iCumRate += 8;} //0.3851709196 2077스톤 바이슨의 이빨
			case(22){itemString = `id:55002`; iCumRate += 8;} //0.3851709196 2077스톤 바이슨의 꼬리털
			case(23){itemString = `id:55003`; iCumRate += 8;} //0.3851709196 2077스톤 바이슨의 の발굽
			case(24){itemString = `id:55005`; iCumRate += 8;} //0.3851709196 2077스톤 하운드의 귀
			case(25){itemString = `id:55006`; iCumRate += 8;} //0.3851709196 2077스톤 하운드의 이빨
			case(26){itemString = `id:55007`; iCumRate += 8;} //0.3851709196 2077스톤 하운드의 꼬리털
			case(27){itemString = `id:55008`; iCumRate += 8;} //0.3851709196 2077스톤 하운드의 발목 장식
			case(28){itemString = `id:55009`; iCumRate += 8;} //0.3851709196 2077스톤 하운드의 발톱
			case(29){itemString = `id:55011`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 서클릿
			case(30){itemString = `id:55012`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 머리장식
			case(31){itemString = `id:55013`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 눈
			case(32){itemString = `id:55014`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 어깨장식
			case(33){itemString = `id:55015`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 벨트
			case(34){itemString = `id:55016`; iCumRate += 8;} //0.3851709196 2077스톤 좀비의 손목 장식
			case(35){itemString = `id:55019`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 모자
			case(36){itemString = `id:55020`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 모자장식
			case(37){itemString = `id:55021`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 보석
			case(38){itemString = `id:55022`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 코
			case(39){itemString = `id:55023`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 귀
			case(40){itemString = `id:55024`; iCumRate += 8;} //0.3851709196 2077스톤 임프의 샌달
			case(41){itemString = `id:55025`; iCumRate += 8;} //0.3851709196 2077항아리 거미의 다리
			case(42){itemString = `id:55026`; iCumRate += 8;} //0.3851709196 2077항아리 거미의 항아리
			case(43){itemString = `id:55027`; iCumRate += 8;} //0.3851709196 2077항아리 거미의 어금니
			case(44){itemString = `id:55028`; iCumRate += 8;} //0.3851709196 2077항아리 거미의 집게발
			case(45){itemString = `id:55029`; iCumRate += 8;} //0.3851709196 2077항아리 거미의 독주머니
			case(46){itemString = `id:55062`; iCumRate += 8;} //0.3851709196 2077스톤 가고일의 어깨장식
			case(47){itemString = `id:55063`; iCumRate += 8;} //0.3851709196 2077스톤 가고일의 글러브
			case(48){itemString = `id:55064`; iCumRate += 8;} //0.3851709196 2077스톤 가고일의 부츠
			case(49){itemString = `id:55031`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 바이슨의 뿔
			case(50){itemString = `id:55032`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 바이슨의 이
			case(51){itemString = `id:55033`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 바이슨의 꼬리
			case(52){itemString = `id:55034`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 바이슨의 발굽
			case(53){itemString = `id:55035`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 바이슨의 석상
			case(54){itemString = `id:55036`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 하운드의 귀
			case(55){itemString = `id:55037`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 하운드의 이
			case(56){itemString = `id:55038`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 하운드의 꼬리
			case(57){itemString = `id:55039`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 하운드의 발목장식
			case(58){itemString = `id:55040`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 하운드의 발톱
			case(59){itemString = `id:55041`; iCumRate += 5;} //0.2407318247 2077빛나는 스톤 하운드의  석상
			case(60){itemString = `id:55042`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 서클릿
			case(61){itemString = `id:55043`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 머리장식
			case(62){itemString = `id:55044`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 눈
			case(63){itemString = `id:55045`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 어깨장식
			case(64){itemString = `id:55046`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 벨트
			case(65){itemString = `id:55047`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 좀비의 목걸이
			case(66){itemString = `id:55048`; iCumRate += 5;} //0.2407318247 2077빛나는 스톤 좀비의  석상
			case(67){itemString = `id:55049`; iCumRate += 5;} //0.2407318247 2077빛나는 스톤 임프의 석상
			case(68){itemString = `id:55050`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 모자
			case(69){itemString = `id:55051`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 모자 장식
			case(70){itemString = `id:55052`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 보석
			case(71){itemString = `id:55053`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 코
			case(72){itemString = `id:55054`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 귀
			case(73){itemString = `id:55055`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 임프의 샌들
			case(74){itemString = `id:55056`; iCumRate += 10;} //0.4814636495 2077빛나는 항아리 거미의 다리
			case(75){itemString = `id:55057`; iCumRate += 10;} //0.4814636495 2077빛나는 항아리 거미의 항아리
			case(76){itemString = `id:55058`; iCumRate += 10;} //0.4814636495 2077빛나는 항아리 거미의 어금니
			case(77){itemString = `id:55059`; iCumRate += 10;} //0.4814636495 2077빛나는 항아리 거미의 집게발
			case(78){itemString = `id:55060`; iCumRate += 10;} //0.4814636495 2077빛나는 항아리 거미의 독주머니
			case(79){itemString = `id:55061`; iCumRate += 5;} //0.2407318247 2077빛나는 항아리 거미의 석상
			case(80){itemString = `id:55065`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 가고일의 어깨장식
			case(81){itemString = `id:55066`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 가고일의 글러브
			case(82){itemString = `id:55067`; iCumRate += 10;} //0.4814636495 2077빛나는 스톤 가고일의 부츠
			case(83){itemString = `id:55068`; iCumRate += 5;} //0.2407318247 2077빛나는 스톤 가고일 석상
			case(84){itemString = `id:62005 suffix:30103`; iCumRate += 10;} //0.4814636495 2077머무른
			case(85){itemString = `id:62005 suffix:30204`; iCumRate += 10;} //0.4814636495 2077잔존한
			case(86){itemString = `id:62005 suffix:30314`; iCumRate += 10;} //0.4814636495 2077정지하는
			case(87){itemString = `id:62005 prefix:20503`; iCumRate += 10;} //0.4814636495 2077강옥
			case(88){itemString = `id:62005 suffix:30615`; iCumRate += 10;} //0.4814636495 2077곤란의
			case(89){itemString = `id:62005 suffix:30813`; iCumRate += 10;} //0.4814636495 2077불편의
			case(90){itemString = `id:62005 suffix:30716`; iCumRate += 10;} //0.4814636495 2077장애의
			case(91){itemString = `id:62005 suffix:30717`; iCumRate += 10;} //0.4814636495 2077해의
			case(92){itemString = `id:62005 suffix:30814`; iCumRate += 10;} //0.4814636495 2077지장의
			case(93){itemString = `id:62005 prefix:20504`; iCumRate += 10;} //0.4814636495 2077금강석
			case(94){itemString = `id:62005 prefix:20108`; iCumRate += 10;} //0.4814636495 2077키위
			case(95){itemString = `id:62005 prefix:20304`; iCumRate += 10;} //0.4814636495 2077타조
			case(96){itemString = `id:62005 prefix:20505`; iCumRate += 10;} //0.4814636495 2077리자드
			case(97){itemString = `id:62005 prefix:20508`; iCumRate += 10;} //0.4814636495 2077수상한
			case(98){itemString = `id:62005 prefix:20618`; iCumRate += 10;} //0.4814636495 2077망설이는
			case(99){itemString = `id:62005 prefix:20718`; iCumRate += 10;} //0.4814636495 2077기묘한
			case(100){itemString = `id:62005 prefix:20209`; iCumRate += 10;} //0.4814636495 2077몽구스
			case(101){itemString = `id:62005 prefix:20409`; iCumRate += 10;} //0.4814636495 2077사막여우
			case(102){itemString = `id:62005 prefix:20615`; iCumRate += 10;} //0.4814636495 2077사막거미
			case(103){itemString = `id:62005 prefix:20212`; iCumRate += 10;} //0.4814636495 2077괴상한
			case(104){itemString = `id:62005 prefix:20412`; iCumRate += 10;} //0.4814636495 2077별난
			case(105){itemString = `id:62005 prefix:20619`; iCumRate += 10;} //0.4814636495 2077특이한
			case(106){itemString = `id:62005 prefix:20110`; iCumRate += 10;} //0.4814636495 2077평원의
			case(107){itemString = `id:62005 prefix:20306`; iCumRate += 10;} //0.4814636495 2077초원의
			case(108){itemString = `id:62005 prefix:20506`; iCumRate += 10;} //0.4814636495 2077고원의
			case(109){itemString = `id:62005 prefix:20109`; iCumRate += 10;} //0.4814636495 2077야생마
			case(110){itemString = `id:62005 prefix:20210`; iCumRate += 10;} //0.4814636495 2077반달곰
			case(111){itemString = `id:62005 prefix:20305`; iCumRate += 10;} //0.4814636495 2077마스크 고블린
			case(112){itemString = `id:62005 prefix:20211`; iCumRate += 10;} //0.4814636495 2077협곡의
			case(113){itemString = `id:62005 prefix:20410`; iCumRate += 10;} //0.4814636495 2077숲의
			case(114){itemString = `id:62005 prefix:20616`; iCumRate += 10;} //0.4814636495 2077강의
			case(115){itemString = `id:62005 prefix:20411`; iCumRate += 10;} //0.4814636495 2077웅덩의
			case(116){itemString = `id:62005 prefix:20507`; iCumRate += 10;} //0.4814636495 2077연못의
			case(117){itemString = `id:62005 prefix:20617`; iCumRate += 10;} //0.4814636495 2077호수의
			case(118){itemString = `id:40026 prefix:20106`; iCumRate += 10;} //0.4814636495 2077활석이 붙은 낫
			case(119){itemString = `id:40026 prefix:20207`; iCumRate += 10;} //0.4814636495 2077방해석이 붙은 낫
			case(120){itemString = `id:40026 prefix:20302`; iCumRate += 10;} //0.4814636495 2077인회석이 붙은 낫
			case(121){itemString = `id:40026 prefix:20407`; iCumRate += 10;} //0.4814636495 2077석영이 붙은 낫
			case(122){itemString = `id:46001 prefix:20212`; iCumRate += 10;} //0.4814636495 2077괴상한이 붙은 라운드 실드
			case(123){itemString = `id:46001 prefix:20412`; iCumRate += 10;} //0.4814636495 2077별난이 붙은 라운드 실드
			case(124){itemString = `id:46001 prefix:20619`; iCumRate += 10;} //0.4814636495 2077특이한이 붙은 라운드 실드
			case(125){itemString = `id:40006`; iCumRate += 10;} //0.4814636495 2077단검
			case(126){itemString = `id:40005`; iCumRate += 10;} //0.4814636495 2077숏 소드
			case(127){itemString = `id:40015`; iCumRate += 10;} //0.4814636495 2077플루트 숏 소드
			case(128){itemString = `id:40010`; iCumRate += 10;} //0.4814636495 2077롱 소드
			case(129){itemString = `id:40011`; iCumRate += 10;} //0.4814636495 2077브로드 소드
			case(130){itemString = `id:40012`; iCumRate += 10;} //0.4814636495 2077바스타드 소드
			case(131){itemString = `id:40080`; iCumRate += 10;} //0.4814636495 2077글라디우스
			case(132){itemString = `id:40083`; iCumRate += 10;} //0.4814636495 2077훅 커틀러스
			case(133){itemString = `id:40030`; iCumRate += 10;} //0.4814636495 2077투 핸디드 소드
			case(134){itemString = `id:40033`; iCumRate += 10;} //0.4814636495 2077클레이모어
			case(135){itemString = `id:40079`; iCumRate += 10;} //0.4814636495 2077메이스
			case(136){itemString = `id:40078`; iCumRate += 10;} //0.4814636495 2077비펜니스
			case(137){itemString = `id:40016`; iCumRate += 10;} //0.4814636495 2077해머
			case(138){itemString = `id:40003`; iCumRate += 10;} //0.4814636495 2077숏 보우
			case(139){itemString = `id:40031`; iCumRate += 10;} //0.4814636495 2077석궁
			case(140){itemString = `id:40014`; iCumRate += 10;} //0.4814636495 2077콤포짓 보우
			case(141){itemString = `id:40013`; iCumRate += 10;} //0.4814636495 2077롱 보우
			case(142){itemString = `id:40081`; iCumRate += 10;} //0.4814636495 2077레더 롱 보우
			case(143){itemString = `id:40038`; iCumRate += 10;} //0.4814636495 2077라이트닝 원드ド
			case(144){itemString = `id:40040`; iCumRate += 10;} //0.4814636495 2077파이어 원드
			case(145){itemString = `id:40039`; iCumRate += 10;} //0.4814636495 2077아이스 원드
			case(146){itemString = `id:18503`; iCumRate += 10;} //0.4814636495 2077퀴러시어 헬름
			case(147){itemString = `id:18504`; iCumRate += 10;} //0.4814636495 2077크로스 풀 헬름
			case(148){itemString = `id:18505`; iCumRate += 10;} //0.4814636495 2077스파이크 헬름
			case(149){itemString = `id:18506`; iCumRate += 10;} //0.4814636495 2077윙 하프 헬름
			case(150){itemString = `id:17506`; iCumRate += 10;} //0.4814636495 2077롱그리브 부츠
			case(151){itemString = `id:17505`; iCumRate += 10;} //0.4814636495 2077플레이트 부츠
			case(152){itemString = `id:16504`; iCumRate += 10;} //0.4814636495 2077카운터 건틀렛
			case(153){itemString = `id:16505`; iCumRate += 10;} //0.4814636495 2077플루트 건틀렛
			case(154){itemString = `id:46001`; iCumRate += 10;} //0.4814636495 2077라운드 실드
			case(155){itemString = `id:15005`; iCumRate += 10;} //0.4814636495 2077모험가 슈트
			case(156){itemString = `id:14008`; iCumRate += 10;} //0.4814636495 2077풀세트 가죽 갑옷
			case(157){itemString = `id:13035`; iCumRate += 10;} //0.4814636495 2077라이트 멜카 체인메일
			case(158){itemString = `id:13037`; iCumRate += 10;} //0.4814636495 2077라이트 서코트 체인메일
			case(159){itemString = `id:13036`; iCumRate += 10;} //0.4814636495 2077라이트 라운드 폴드론 체인메일
			case(160){itemString = `id:13043`; iCumRate += 10;} //0.4814636495 2077레미니아 성월의 갑옷(남성용)
			case(161){itemString = `id:13044`; iCumRate += 10;} //0.4814636495 2077레미니아 성월의 갑옷(여성용))
			case(162){itemString = `id:40071`; iCumRate += 20;} //0.9629272990 2077'라' 음 빈 병
			case(163){itemString = `id:40072`; iCumRate += 20;} //0.9629272990 2077'시' 음 빈 병
			case(164){itemString = `id:40073`; iCumRate += 20;} //0.9629272990 2077'도' 음 빈 병
			case(165){itemString = `id:40074`; iCumRate += 20;} //0.9629272990 2077'레' 음 빈 병
			case(166){itemString = `id:40075`; iCumRate += 20;} //0.9629272990 2077'미' 음 빈 병
			case(167){itemString = `id:40076`; iCumRate += 20;} //0.9629272990 2077'파' 음 빈 병
			case(168){itemString = `id:40077`; iCumRate += 20;} //0.9629272990 2077'솔' 음 빈 병
			case(169){itemString = `id:40097 col1:000000`; iCumRate += 20;} //0.9629272990 2077검은 L 로드
			case(170){itemString = `id:40097 col2:800000`; iCumRate += 20;} //0.9629272990 2077붉은 L 로드
			case(171){itemString = `id:40097 col1:eeeeee`; iCumRate += 20;} //0.9629272990 2077하얀 L 로드
			case(172){itemString = `id:18542`; iCumRate += 20;} //0.9629272990 2077빅 체인 풀 헬름
			case(173){itemString = `id:18543`; iCumRate += 20;} //0.9629272990 2077빅 슬릿 풀 헬름
			case(174){itemString = `id:18544`; iCumRate += 20;} //0.9629272990 2077빅 펠리칸 프로텍터
			case(175){itemString = `id:18547`; iCumRate += 20;} //0.9629272990 2077빅 파나쉬 헤드 프로텍터
			case(176){itemString = `id:91006 expire:43200`; iCumRate += 20;} //0.9629272990 207710살의 키가 되는 포션
			case(177){itemString = `id:91010 expire:43200`; iCumRate += 20;} //0.9629272990 207711살의 키가 되는 포션
			case(178){itemString = `id:91011 expire:43200`; iCumRate += 20;} //0.9629272990 207712살의 키가 되는 포션12
			case(179){itemString = `id:91012 expire:43200`; iCumRate += 20;} //0.9629272990 207713살의 키가 되는 포션13
			case(180){itemString = `id:91013 expire:43200`; iCumRate += 20;} //0.9629272990 207714살의 키가 되는 포션14
			case(181){itemString = `id:91014 expire:43200`; iCumRate += 20;} //0.9629272990 207715살의 키가 되는 포션15
			case(182){itemString = `id:91015 expire:43200`; iCumRate += 20;} //0.9629272990 207716살의 키가 되는 포션16
			case(183){itemString = `id:91007 expire:43200`; iCumRate += 20;} //0.9629272990 207717살의 키가 되는 포션17
			case(184){itemString = `id:63025 count:3`; iCumRate += 20;} //0.9629272990 2077대용량 축복의 포션
			case(185){itemString = `id:51031 count:3`; iCumRate += 20;} //0.9629272990 2077완전 회복의 포션
			case(186){itemString = `id:63027 expire:10080`; iCumRate += 20;} //0.9629272990 2077밀랍 날개
			case(187){itemString = `id:51003 count:5`; iCumRate += 20;} //0.9629272990 2077생명력 50 포션
			case(188){itemString = `id:51004 count:3`; iCumRate += 20;} //0.9629272990 2077생명력100 포션
			case(189){itemString = `id:51008 count:5`; iCumRate += 20;} //0.9629272990 2077마나 50 포션
			case(190){itemString = `id:51013 count:5`; iCumRate += 20;} //0.9629272990 2077스태미나 50 포션
			case(191){itemString = `id:51014 count:3`; iCumRate += 20;} //0.9629272990 2077스태미나 100 포션
			case(192){itemString = `id:51022 count:5`; iCumRate += 20;} //0.9629272990 2077생명력과 마나 30 포션
			case(193){itemString = `id:51027 count:5`; iCumRate += 20;} //0.9629272990 2077생명력과 스태미나 30 포션
			case(194){itemString = `id:51028 count:3`; iCumRate += 20;} //0.9629272990 2077생명력과 스태미나 50 포션


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
