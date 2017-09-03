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
		int itemID = cItem.GetClassId();
		if(GetLocale().LowerCase()== `japan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(5053);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40031 col1:eeeeee`; iCumRate +=1;} //0.019790224흰색 석궁 내구도 UP
					case(1){itemString = `id:50256 `; iCumRate +=1;} //0.019790224킹 크랩
					case(2){itemString = `id:50259 `; iCumRate +=1;} //0.019790224개복치
					case(3){itemString = `id:18547 col2:5B000c54`; iCumRate +=1;} //0.019790224빅 파나쉬 헤드 프로텍터
					case(4){itemString = `id:18156 col1:eeeeee`; iCumRate +=1;} //0.019790224흰색 고글모
					case(5){itemString = `id:40226 col1:333333 col2:333333 quality:80`; iCumRate +=1;} //0.019790224흑색 주시자의 검 상급
					case(6){itemString = `id:40095 prefix:21402 suffix:31017 quality:85`; iCumRate +=1;} //0.019790224상급 언테임드 디스트럭션 드레곤 블레이드
					case(7){itemString = `id:46006 suffix:31014`; iCumRate +=1;} //0.019790224심해의 카이트실드
					case(8){itemString = `id:46001 col1:111111 col2:eeeeee`; iCumRate +=1;} //0.019790224하양 검정 라운드 실드
					case(9){itemString = `id:13032 quality:90`; iCumRate +=1;} //0.019790224퀄리티 90 발렌시아 아머 (7/4)
					case(10){itemString = `id:18549 prefix:20713`; iCumRate +=1;} //0.019790224디펜시브 드래곤 펠릭스 헬멧 (중갑용)
					case(11){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.019790224디펜시브 드래곤 펠릭스 헬멧 (중갑용)
					case(12){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate +=4;} //0.079160895여성용 마법사 정장（새끼너구리）
					case(13){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate +=4;} //0.079160895붉은색 야광 머플러 로브
					case(14){itemString = `id:19031 `; iCumRate +=4;} //0.079160895스타라이트 로브
					case(15){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate +=4;} //0.079160895흰색 야광 머플러 로브
					case(16){itemString = `id:40231 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895크리스탈 라이트닝 원드 내구업
					case(17){itemString = `id:40232 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895크라운 아이스 원드 내구업
					case(18){itemString = `id:40233 durability:16000 durability_max:16000`; iCumRate +=4;} //0.079160895피닉스 파이어 원드 내구업
					case(19){itemString = `id:62005 suffix:30714`; iCumRate +=4;} //0.079160895인챈트（이지페카)
					case(20){itemString = `id:62005 suffix:31105`; iCumRate +=4;} //0.079160895인챈트（종려나무)
					case(21){itemString = `id:62005 suffix:30913`; iCumRate +=4;} //0.079160895인챈트（떡갈나무)
					case(22){itemString = `id:62005 prefix:21006`; iCumRate +=4;} //0.079160895인챈트（기초의)
					case(23){itemString = `id:63030 col1:000000`; iCumRate +=4;} //0.079160895검은색 지정 색상 염색 앰플
					case(24){itemString = `id:63030 col1:c00000`; iCumRate +=4;} //0.079160895빨강 지정 색상 염색 앰플
					case(25){itemString = `id:63030 col1:f0f0f0`; iCumRate +=4;} //0.079160895하양 지정 색상 염색 앰플
					case(26){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354재기드 미니 스커트
					case(27){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate +=15;} //0.296853354차이나드레스
					case(28){itemString = `id:18044 `; iCumRate +=15;} //0.296853354범죄용 복면
					case(29){itemString = `id:16519 `; iCumRate +=15;} //0.296853354초호화 장갑
					case(30){itemString = `id:18046 `; iCumRate +=15;} //0.296853354왕관형 머리장식
					case(31){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate +=15;} //0.296853354클래식 슬리브 웨어
					case(32){itemString = `id:15060 `; iCumRate +=15;} //0.296853354슬림 이너로브 웨어
					case(33){itemString = `id:17041 `; iCumRate +=15;} //0.296853354덩굴무늬 헌팅부츠
					case(34){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354아이돌 리본 드레스
					case(35){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate +=15;} //0.296853354야광 머플러 로브
					case(36){itemString = `id:18060 `; iCumRate +=15;} //0.296853354털 토끼 머리띠5
					case(37){itemString = `id:18065 `; iCumRate +=15;} //0.296853354가죽 토끼 머리띠5
					case(38){itemString = `id:18070 `; iCumRate +=15;} //0.296853354별 토끼 머리띠5
					case(39){itemString = `id:62005 suffix:30702`; iCumRate +=15;} //0.296853354인챈트（레이븐）
					case(40){itemString = `id:62005 suffix:30501`; iCumRate +=15;} //0.296853354인챈트（자이언트）
					case(41){itemString = `id:62005 suffix:30302`; iCumRate +=15;} //0.296853354인챈트（코볼트）
					case(42){itemString = `id:18051 `; iCumRate +=15;} //0.296853354코레스 리본 모자
					case(43){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate +=15;} //0.296853354코레스 닌자슈트
					case(44){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate +=15;} //0.296853354동양풍 무사복
					case(45){itemString = `id:15055 `; iCumRate +=20;} //0.395804473레더 미니 원피스
					case(46){itemString = `id:46006 `; iCumRate +=20;} //0.395804473카이트 실드
					case(47){itemString = `id:15053 `; iCumRate +=20;} //0.395804473플랫칼라 원피스
					case(48){itemString = `id:17045 `; iCumRate +=20;} //0.395804473브이 넥 라인 레더 부츠
					case(49){itemString = `id:17040 `; iCumRate +=20;} //0.395804473엘라 스트랩 부츠
					case(50){itemString = `id:18113 `; iCumRate +=20;} //0.395804473뾰족귀 고양이 모자
					case(51){itemString = `id:18114 `; iCumRate +=20;} //0.395804473줄무늬 고양이 모자
					case(52){itemString = `id:18115 `; iCumRate +=20;} //0.395804473핀 고양이 모자
					case(53){itemString = `id:62005 prefix:207`; iCumRate +=20;} //0.395804473인챈트（폭스）
					case(54){itemString = `id:15029 `; iCumRate +=20;} //0.395804473토크 대장장이옷
					case(55){itemString = `id:15151 `; iCumRate +=20;} //0.395804473뉴욕마리오 웨이스트 테일러 웨어（남성용）
					case(56){itemString = `id:15152 `; iCumRate +=20;} //0.395804473뉴욕마리오 웨이스트 테일러 웨어（여성용）
					case(57){itemString = `id:15153 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트（남성용）
					case(58){itemString = `id:15154 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트（여성용）
					case(59){itemString = `id:15045 `; iCumRate +=20;} //0.395804473레이스 플래킷 예복
					case(60){itemString = `id:15026 `; iCumRate +=20;} //0.395804473리리나 롱스커트
					case(61){itemString = `id:15016 `; iCumRate +=20;} //0.395804473의장용 스타킹 유니폼
					case(62){itemString = `id:15051 `; iCumRate +=20;} //0.395804473타이트 벨트 웨어
					case(63){itemString = `id:18011 `; iCumRate +=20;} //0.395804473몬거 제스터 캡
					case(64){itemString = `id:18124 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트 캡
					case(65){itemString = `id:18009 `; iCumRate +=20;} //0.395804473몬거 아쳐 캡
					case(66){itemString = `id:18014 `; iCumRate +=20;} //0.395804473몬거 모자
					case(67){itemString = `id:18000 `; iCumRate +=20;} //0.395804473토크 모자
					case(68){itemString = `id:16013 `; iCumRate +=20;} //0.395804473검사 장갑
					case(69){itemString = `id:16032 `; iCumRate +=20;} //0.395804473엘빈 글러브
					case(70){itemString = `id:63030 `; iCumRate +=20;} //0.395804473지정 색상 염색 앰플
					case(71){itemString = `id:18112 `; iCumRate +=20;} //0.395804473해 분장 소품
					case(72){itemString = `id:18111 `; iCumRate +=20;} //0.395804473나무 분장 소품
					case(73){itemString = `id:18110 `; iCumRate +=20;} //0.395804473덤불 분장 소품
					case(74){itemString = `id:18109 `; iCumRate +=20;} //0.395804473나오 분장 소품
					case(75){itemString = `id:18108 `; iCumRate +=20;} //0.395804473바위 분장 소품
					case(76){itemString = `id:18029 `; iCumRate +=20;} //0.395804473나무테 안경
					case(77){itemString = `id:18028 `; iCumRate +=20;} //0.395804473접이식 안경
					case(78){itemString = `id:19008 `; iCumRate +=20;} //0.395804473코코 판다 로브
					case(79){itemString = `id:19009 `; iCumRate +=20;} //0.395804473코코 래빗 로브
					case(80){itemString = `id:19017 `; iCumRate +=20;} //0.395804473늑대 로브
					case(81){itemString = `id:19016 `; iCumRate +=20;} //0.395804473곰 로브
					case(82){itemString = `id:40053 `; iCumRate +=20;} //0.395804473보라빛 장미 꽃다발
					case(83){itemString = `id:40051 `; iCumRate +=20;} //0.395804473보라빛 장미 한송이
					case(84){itemString = `id:18089 `; iCumRate +=20;} //0.395804473보라빛 장미 장식
					case(85){itemString = `id:40054 `; iCumRate +=20;} //0.395804473파란 장미 꽃다발
					case(86){itemString = `id:40052 `; iCumRate +=20;} //0.395804473파란 장미 한송이
					case(87){itemString = `id:16500 `; iCumRate +=20;} //0.395804473울나 프로텍터 글러브
					case(88){itemString = `id:19020 `; iCumRate +=20;} //0.395804473나타네 설산용 코트
					case(89){itemString = `id:62005 prefix:7 `; iCumRate +=20;} //0.395804473인챈트（폭스헌터）
					case(90){itemString = `id:16520 `; iCumRate +=20;} //0.395804473롱 레더 글러브
					case(91){itemString = `id:15128 `; iCumRate +=20;} //0.395804473투 톤 비조 드레스
					case(92){itemString = `id:16019 `; iCumRate +=20;} //0.395804473줄무늬 팔목 장갑
					case(93){itemString = `id:18047 `; iCumRate +=20;} //0.395804473코레스 펠트 모자
					case(94){itemString = `id:18008 `; iCumRate +=20;} //0.395804473스트라이프 캡
					case(95){itemString = `id:15025 `; iCumRate +=20;} //0.395804473마법학교 여자교복
					case(96){itemString = `id:18043 `; iCumRate +=20;} //0.395804473코레스 니트 모자
					case(97){itemString = `id:18026 `; iCumRate +=20;} //0.395804473몬거 상인모자
					case(98){itemString = `id:15052 `; iCumRate +=20;} //0.395804473터크스 투톤 튜닉
					case(99){itemString = `id:19005 `; iCumRate +=20;} //0.395804473머플러 로브
					case(100){itemString = `id:18040 `; iCumRate +=20;} //0.395804473코레스 꼭지 베레모
					case(101){itemString = `id:18038 `; iCumRate +=20;} //0.395804473깃털 배렛 모자
					case(102){itemString = `id:15042 `; iCumRate +=20;} //0.395804473롱넥 원피스
					case(103){itemString = `id:63025 count:3`; iCumRate +=20;} //0.395804473대용량 축복의 포션
					case(104){itemString = `id:17006 `; iCumRate +=20;} //0.395804473천신발
					case(105){itemString = `id:18086 `; iCumRate +=20;} //0.395804473데이지 꽃 장식
					case(106){itemString = `id:18087 `; iCumRate +=20;} //0.395804473장미 꽃 장식
					case(107){itemString = `id:18088 `; iCumRate +=20;} //0.395804473화관
					case(108){itemString = `id:18090 `; iCumRate +=20;} //0.395804473파란 장미 장식
					case(109){itemString = `id:40046 `; iCumRate +=20;} //0.395804473장미 한송이
					case(110){itemString = `id:40047 `; iCumRate +=20;} //0.395804473장미 꽃다발
					case(111){itemString = `id:18541 `; iCumRate +=20;} //0.395804473대머리 가발
					case(112){itemString = `id:18103 `; iCumRate +=20;} //0.395804473종이 모자
					case(113){itemString = `id:18010 `; iCumRate +=20;} //0.395804473몬거 스마트 캡
					case(114){itemString = `id:15131 `; iCumRate +=20;} //0.395804473핀 에이프런 스커트
					case(115){itemString = `id:17005 `; iCumRate +=20;} //0.395804473사냥꾼 신발
					case(116){itemString = `id:17002 `; iCumRate +=20;} //0.395804473검사 신발
					case(117){itemString = `id:17022 `; iCumRate +=20;} //0.395804473레더부츠
					case(118){itemString = `id:17007 `; iCumRate +=20;} //0.395804473가죽 구두
					case(119){itemString = `id:16009 `; iCumRate +=20;} //0.395804473사냥꾼장갑
					case(120){itemString = `id:15031 `; iCumRate +=20;} //0.395804473마법학교의 남자 교복
					case(121){itemString = `id:19012 `; iCumRate +=20;} //0.395804473트루디 레이어드 로브
					case(122){itemString = `id:18004 `; iCumRate +=20;} //0.395804473몬거 패션모자
					case(123){itemString = `id:15132 `; iCumRate +=20;} //0.395804473내추럴 베스트 웨어
					case(124){itemString = `id:15043 `; iCumRate +=20;} //0.395804473스포티 웨어세트
					case(125){itemString = `id:17017 `; iCumRate +=20;} //0.395804473레더코트 슈즈
					case(126){itemString = `id:16006 `; iCumRate +=20;} //0.395804473가디언 장갑
					case(127){itemString = `id:17060 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트 부츠(남성용)
					case(128){itemString = `id:17061 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트 부츠(여성용)
					case(129){itemString = `id:17019 `; iCumRate +=20;} //0.395804473대장장이 신발
					case(130){itemString = `id:17067 `; iCumRate +=20;} //0.395804473엑스 타이 업 슈즈
					case(131){itemString = `id:17008 `; iCumRate +=20;} //0.395804473코레스 부츠（여성용）
					case(132){itemString = `id:17010 `; iCumRate +=20;} //0.395804473코레스 부츠（남성용）
					case(133){itemString = `id:17023 `; iCumRate +=20;} //0.395804473에나멜 신발
					case(134){itemString = `id:16031 `; iCumRate +=20;} //0.395804473쓰리라인 타이트 글러브
					case(135){itemString = `id:16026 `; iCumRate +=20;} //0.395804473산드라 스나이퍼 수트 글러브
					case(136){itemString = `id:16016 `; iCumRate +=20;} //0.395804473라이트 글러브
					case(137){itemString = `id:17003 `; iCumRate +=20;} //0.395804473가죽 신발（남성용）
					case(138){itemString = `id:17024 `; iCumRate +=20;} //0.395804473통굽 샌달
					case(139){itemString = `id:17013 `; iCumRate +=20;} //0.395804473두꺼운 샌달
					case(140){itemString = `id:17069 `; iCumRate +=20;} //0.395804473레오 슈즈
					case(141){itemString = `id:15020 `; iCumRate +=20;} //0.395804473코레스 힐러드레스
					case(142){itemString = `id:15044 `; iCumRate +=20;} //0.395804473목수용 작업복
					case(143){itemString = `id:15041 `; iCumRate +=20;} //0.395804473사무직 여성용 슈트
					case(144){itemString = `id:15027 `; iCumRate +=20;} //0.395804473몬거 롱스커트
					case(145){itemString = `id:15018 `; iCumRate +=20;} //0.395804473몬거 여행자옷（여성용）
					case(146){itemString = `id:15033 `; iCumRate +=20;} //0.395804473몬거 여행자옷(남성용）
					case(147){itemString = `id:15023 `; iCumRate +=20;} //0.395804473토크 사냥꾼옷（여성용）
					case(148){itemString = `id:15035 `; iCumRate +=20;} //0.395804473토크 사냥꾼옷（남성용）
					case(149){itemString = `id:19003 `; iCumRate +=20;} //0.395804473트리콜로르 로브
					case(150){itemString = `id:63024 expire:10080 `; iCumRate +=20;} //0.395804473염색 앰플
					case(151){itemString = `id:18002 `; iCumRate +=20;} //0.395804473몬거 캡
					case(152){itemString = `id:51014 count:5`; iCumRate +=20;} //0.395804473스태미나 100 포션 5개
					case(153){itemString = `id:51004 count:5`; iCumRate +=20;} //0.395804473생명력 100포션 5개
					case(154){itemString = `id:51009 count:5`; iCumRate +=20;} //0.395804473마나 100포션 5개
					case(155){itemString = `id:51101 count:1`; iCumRate +=50;} //0.989511181블러디 허브
					case(156){itemString = `id:51102 count:1`; iCumRate +=50;} //0.989511181마나 허브
					case(157){itemString = `id:51103 count:1`; iCumRate +=50;} //0.989511181썬라이트 허브
					case(158){itemString = `id:51104 count:1`; iCumRate +=50;} //0.989511181베이스 허브
					case(159){itemString = `id:51105 count:1`; iCumRate +=50;} //0.989511181골드 허브
					case(160){itemString = `id:51106 count:1`; iCumRate +=50;} //0.989511181못 쓰게된 허브
					case(161){itemString = `id:51107 count:1`; iCumRate +=50;} //0.989511181화이트 허브
					case(162){itemString = `id:51108 count:1`; iCumRate +=50;} //0.989511181해독초
					case(163){itemString = `id:51109 count:1`; iCumRate +=50;} //0.989511181포이즌 허브
					case(164){itemString = `id:51110 count:1`; iCumRate +=50;} //0.989511181만드레이크
					case(165){itemString = `id:15284 `; iCumRate +=500;} //9.895111815메이플 슈트
					case(166){itemString = `id:15285 `; iCumRate +=500;} //9.895111815메이플 드레스
					case(167){itemString = `id:18568 `; iCumRate +=1000;} //19.79022363유자모자
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
	//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
					return;
				}

				++i;
			}
		}


		else
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(1890);	//확률의 총합을 적는다

			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40031 col1:eeeeee`; iCumRate += 1;} //0.0529100529 1890흰색 석궁
					case(1){itemString = `id:18156 col1:eeeeee`; iCumRate += 1;} //0.0529100529 1890흰색 고글모
					case(2){itemString = `id:40226 col1:333333 col2:333333 quality:80`; iCumRate += 1;} //0.0529100529 1890흑색 주시자의 검 상급
					case(3){itemString = `id:40095 prefix:21402 suffix:31017 quality:85`; iCumRate += 1;} //0.0529100529 1890상급 언테임드 디스트럭션 드레곤 블레이드
					case(4){itemString = `id:46006 suffix:31014`; iCumRate += 1;} //0.0529100529 1890심해의 카이트실드 (약해셋)
					case(5){itemString = `id:46001 col1:111111 col2:eeeeee`; iCumRate += 1;} //0.0529100529 1890하양 검정 라운드 실드
					case(6){itemString = `id:13032 quality:90`; iCumRate += 1;} //0.0529100529 1890퀄리티 90 발렌시아 아머 (7/4)
					case(7){itemString = `id:18549 prefix:20713`; iCumRate += 1;} //0.0529100529 1890디펜시브 드래곤 펠릭스 헬멧 (중갑용)
					case(8){itemString = `id:15116 suffix:31301`; iCumRate += 1;} //0.0529100529 1890여성용 마법사 정장（새끼너구리）
					case(9){itemString = `id:14019 prefix:21105 suffix:30515`; iCumRate += 4;} //0.2116402116 1890원리의 해적 그레이스 플레이트 아머
					case(10){itemString = `id:19007 col1:800000 col2:000000 col3:000000`; iCumRate += 4;} //0.2116402116 1890붉은색 야광 머플러 로브
					case(11){itemString = `id:19031`; iCumRate += 4;} //0.2116402116 1890스타라이트 로브
					case(12){itemString = `id:19007 col1:ffffff col2:000000 col3:000000`; iCumRate += 4;} //0.2116402116 1890흰색 야광 머플러 로브
					case(13){itemString = `id:40231 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890크리스탈 라이트닝 원드 내구업
					case(14){itemString = `id:40232 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890크라운 아이스 원드 내구업
					case(15){itemString = `id:40233 durability:16000 durability_max:16000`; iCumRate += 4;} //0.2116402116 1890피닉스 파이어 원드 내구업
					case(16){itemString = `id:62005 suffix:30714`; iCumRate += 4;} //0.2116402116 1890인챈트（이지페카)
					case(17){itemString = `id:62005 suffix:31105`; iCumRate += 4;} //0.2116402116 1890인챈트（종려나무)
					case(18){itemString = `id:62005 suffix:30913`; iCumRate += 4;} //0.2116402116 1890인챈트（떡갈나무)
					case(19){itemString = `id:62005 prefix:21006`; iCumRate += 4;} //0.2116402116 1890인챈트（기초의)
					case(20){itemString = `id:63030 col1:000000`; iCumRate += 4;} //0.2116402116 1890검은색 지정 색상 염색 앰플
					case(21){itemString = `id:63030 col1:c00000`; iCumRate += 4;} //0.2116402116 1890빨강 지정 색상 염색 앰플
					case(22){itemString = `id:63030 col1:f0f0f0`; iCumRate += 4;} //0.2116402116 1890하양 지정 색상 염색 앰플
					case(23){itemString = `id:15115 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890재기드 미니 스커트
					case(24){itemString = `id:15017 durability:20000 durability_max:20000`; iCumRate += 10;} //0.5291005291 1890차이나드레스
					case(25){itemString = `id:18044`; iCumRate += 10;} //0.5291005291 1890범죄용 복면
					case(26){itemString = `id:16519`; iCumRate += 10;} //0.5291005291 1890초호화 장갑
					case(27){itemString = `id:18046`; iCumRate += 10;} //0.5291005291 1890왕관형 머리장식
					case(28){itemString = `id:15124 durability:17000 durability_max:17000`; iCumRate += 10;} //0.5291005291 1890클래식 슬리브 웨어
					case(29){itemString = `id:15060`; iCumRate += 10;} //0.5291005291 1890슬림 이너로브 웨어
					case(30){itemString = `id:17041`; iCumRate += 10;} //0.5291005291 1890덩굴무늬 헌팅부츠
					case(31){itemString = `id:15064 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890아이돌 리본 드레스
					case(32){itemString = `id:19007 durability:15000 durability_max:15000`; iCumRate += 10;} //0.5291005291 1890야광 머플러 로브
					case(33){itemString = `id:18060`; iCumRate += 10;} //0.5291005291 1890털 토끼 머리띠5
					case(34){itemString = `id:18065`; iCumRate += 10;} //0.5291005291 1890가죽 토끼 머리띠5
					case(35){itemString = `id:18070`; iCumRate += 10;} //0.5291005291 1890별 토끼 머리띠5
					case(36){itemString = `id:62005 suffix:30702`; iCumRate += 10;} //0.5291005291 1890인챈트（레이븐）
					case(37){itemString = `id:62005 suffix:30501`; iCumRate += 10;} //0.5291005291 1890인챈트（자이언트）
					case(38){itemString = `id:62005 suffix:30302`; iCumRate += 10;} //0.5291005291 1890인챈트（코볼트）
					case(39){itemString = `id:18051`; iCumRate += 10;} //0.5291005291 1890코레스 리본 모자
					case(40){itemString = `id:15019 durability:27000 durability_max:27000`; iCumRate += 10;} //0.5291005291 1890코레스 닌자슈트
					case(41){itemString = `id:15067 durability:25000 durability_max:25000`; iCumRate += 10;} //0.5291005291 1890동양풍 무사복
					case(42){itemString = `id:15055`; iCumRate += 15;} //0.7936507937 1890레더 미니 원피스
					case(43){itemString = `id:46006`; iCumRate += 15;} //0.7936507937 1890카이트 실드
					case(44){itemString = `id:15053`; iCumRate += 15;} //0.7936507937 1890플랫칼라 원피스
					case(45){itemString = `id:17045`; iCumRate += 15;} //0.7936507937 1890브이 넥 라인 레더 부츠
					case(46){itemString = `id:17040`; iCumRate += 15;} //0.7936507937 1890엘라 스트랩 부츠
					case(47){itemString = `id:18113`; iCumRate += 15;} //0.7936507937 1890뾰족귀 고양이 모자
					case(48){itemString = `id:18114`; iCumRate += 15;} //0.7936507937 1890줄무늬 고양이 모자
					case(49){itemString = `id:18115`; iCumRate += 15;} //0.7936507937 1890핀 고양이 모자
					case(50){itemString = `id:62005 prefix:207`; iCumRate += 15;} //0.7936507937 1890인챈트（폭스）
					case(51){itemString = `id:15029`; iCumRate += 15;} //0.7936507937 1890토크 대장장이옷
					case(52){itemString = `id:15151`; iCumRate += 15;} //0.7936507937 1890뉴욕마리오 웨이스트 테일러 웨어（남성용）
					case(53){itemString = `id:15152`; iCumRate += 15;} //0.7936507937 1890뉴욕마리오 웨이스트 테일러 웨어（여성용）
					case(54){itemString = `id:15153`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트（남성용）
					case(55){itemString = `id:15154`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트（여성용）
					case(56){itemString = `id:15045`; iCumRate += 15;} //0.7936507937 1890레이스 플래킷 예복
					case(57){itemString = `id:15026`; iCumRate += 15;} //0.7936507937 1890리리나 롱스커트
					case(58){itemString = `id:15016`; iCumRate += 15;} //0.7936507937 1890의장용 스타킹 유니폼
					case(59){itemString = `id:15051`; iCumRate += 15;} //0.7936507937 1890타이트 벨트 웨어
					case(60){itemString = `id:18011`; iCumRate += 15;} //0.7936507937 1890몬거 제스터 캡
					case(61){itemString = `id:18124`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트 캡
					case(62){itemString = `id:18009`; iCumRate += 15;} //0.7936507937 1890몬거 아쳐 캡
					case(63){itemString = `id:18014`; iCumRate += 15;} //0.7936507937 1890몬거 모자
					case(64){itemString = `id:18000`; iCumRate += 15;} //0.7936507937 1890토크 모자
					case(65){itemString = `id:16013`; iCumRate += 15;} //0.7936507937 1890검사 장갑
					case(66){itemString = `id:16032`; iCumRate += 15;} //0.7936507937 1890엘빈 글러브
					case(67){itemString = `id:63030`; iCumRate += 15;} //0.7936507937 1890지정 색상 염색 앰플
					case(68){itemString = `id:18112`; iCumRate += 15;} //0.7936507937 1890해 분장 소품
					case(69){itemString = `id:18111`; iCumRate += 15;} //0.7936507937 1890나무 분장 소품
					case(70){itemString = `id:18110`; iCumRate += 15;} //0.7936507937 1890덤불 분장 소품
					case(71){itemString = `id:18109`; iCumRate += 15;} //0.7936507937 1890나오 분장 소품
					case(72){itemString = `id:18108`; iCumRate += 15;} //0.7936507937 1890바위 분장 소품
					case(73){itemString = `id:18029`; iCumRate += 15;} //0.7936507937 1890나무테 안경
					case(74){itemString = `id:18028`; iCumRate += 15;} //0.7936507937 1890접이식 안경
					case(75){itemString = `id:19008`; iCumRate += 15;} //0.7936507937 1890코코 판다 로브
					case(76){itemString = `id:19009`; iCumRate += 15;} //0.7936507937 1890코코 래빗 로브
					case(77){itemString = `id:19017`; iCumRate += 15;} //0.7936507937 1890늑대 로브
					case(78){itemString = `id:19016`; iCumRate += 15;} //0.7936507937 1890곰 로브
					case(79){itemString = `id:40053`; iCumRate += 15;} //0.7936507937 1890보라빛 장미 꽃다발
					case(80){itemString = `id:40051`; iCumRate += 15;} //0.7936507937 1890보라빛 장미 한송이
					case(81){itemString = `id:18089`; iCumRate += 15;} //0.7936507937 1890보라빛 장미 장식
					case(82){itemString = `id:40054`; iCumRate += 15;} //0.7936507937 1890파란 장미 꽃다발
					case(83){itemString = `id:40052`; iCumRate += 15;} //0.7936507937 1890파란 장미 한송이
					case(84){itemString = `id:16500`; iCumRate += 15;} //0.7936507937 1890울나 프로텍터 글러브
					case(85){itemString = `id:19020`; iCumRate += 15;} //0.7936507937 1890나타네 설산용 코트
					case(86){itemString = `id:62005 prefix:7`; iCumRate += 15;} //0.7936507937 1890인챈트（폭스헌터）
					case(87){itemString = `id:16520`; iCumRate += 15;} //0.7936507937 1890롱 레더 글러브
					case(88){itemString = `id:15128`; iCumRate += 15;} //0.7936507937 1890투 톤 비조 드레스
					case(89){itemString = `id:16019`; iCumRate += 15;} //0.7936507937 1890줄무늬 팔목 장갑
					case(90){itemString = `id:18047`; iCumRate += 15;} //0.7936507937 1890코레스 펠트 모자
					case(91){itemString = `id:18008`; iCumRate += 15;} //0.7936507937 1890스트라이프 캡
					case(92){itemString = `id:15025`; iCumRate += 15;} //0.7936507937 1890마법학교 여자교복
					case(93){itemString = `id:18043`; iCumRate += 15;} //0.7936507937 1890코레스 니트 모자
					case(94){itemString = `id:18026`; iCumRate += 15;} //0.7936507937 1890몬거 상인모자
					case(95){itemString = `id:15052`; iCumRate += 15;} //0.7936507937 1890터크스 투톤 튜닉
					case(96){itemString = `id:19005`; iCumRate += 15;} //0.7936507937 1890머플러 로브
					case(97){itemString = `id:18040`; iCumRate += 15;} //0.7936507937 1890코레스 꼭지 베레모
					case(98){itemString = `id:18038`; iCumRate += 15;} //0.7936507937 1890깃털 배렛 모자
					case(99){itemString = `id:15042`; iCumRate += 15;} //0.7936507937 1890롱넥 원피스
					case(100){itemString = `id:63025 count:3`; iCumRate += 15;} //0.7936507937 1890대용량 축복의 포션
					case(101){itemString = `id:17006`; iCumRate += 15;} //0.7936507937 1890천신발
					case(102){itemString = `id:18086`; iCumRate += 15;} //0.7936507937 1890데이지 꽃 장식
					case(103){itemString = `id:18087`; iCumRate += 15;} //0.7936507937 1890장미 꽃 장식
					case(104){itemString = `id:18088`; iCumRate += 15;} //0.7936507937 1890화관
					case(105){itemString = `id:18090`; iCumRate += 15;} //0.7936507937 1890파란 장미 장식
					case(106){itemString = `id:40046`; iCumRate += 15;} //0.7936507937 1890장미 한송이
					case(107){itemString = `id:40047`; iCumRate += 15;} //0.7936507937 1890장미 꽃다발
					case(108){itemString = `id:18541`; iCumRate += 15;} //0.7936507937 1890대머리 가발
					case(109){itemString = `id:18103`; iCumRate += 15;} //0.7936507937 1890종이 모자
					case(110){itemString = `id:18010`; iCumRate += 15;} //0.7936507937 1890몬거 스마트 캡
					case(111){itemString = `id:15131`; iCumRate += 15;} //0.7936507937 1890핀 에이프런 스커트
					case(112){itemString = `id:17005`; iCumRate += 15;} //0.7936507937 1890사냥꾼 신발
					case(113){itemString = `id:17002`; iCumRate += 15;} //0.7936507937 1890검사 신발
					case(114){itemString = `id:17022`; iCumRate += 15;} //0.7936507937 1890레더부츠
					case(115){itemString = `id:17007`; iCumRate += 15;} //0.7936507937 1890가죽 구두
					case(116){itemString = `id:16009`; iCumRate += 15;} //0.7936507937 1890사냥꾼장갑
					case(117){itemString = `id:15031`; iCumRate += 15;} //0.7936507937 1890마법학교의 남자 교복
					case(118){itemString = `id:19012`; iCumRate += 15;} //0.7936507937 1890트루디 레이어드 로브
					case(119){itemString = `id:18004`; iCumRate += 15;} //0.7936507937 1890몬거 패션모자
					case(120){itemString = `id:15132`; iCumRate += 15;} //0.7936507937 1890내추럴 베스트 웨어
					case(121){itemString = `id:15043`; iCumRate += 15;} //0.7936507937 1890스포티 웨어세트
					case(122){itemString = `id:17017`; iCumRate += 15;} //0.7936507937 1890레더코트 슈즈
					case(123){itemString = `id:16006`; iCumRate += 15;} //0.7936507937 1890가디언 장갑
					case(124){itemString = `id:17060`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트 부츠(남성용)
					case(125){itemString = `id:17061`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트 부츠(여성용)
					case(126){itemString = `id:17019`; iCumRate += 15;} //0.7936507937 1890대장장이 신발
					case(127){itemString = `id:17067`; iCumRate += 15;} //0.7936507937 1890엑스 타이 업 슈즈
					case(128){itemString = `id:17008`; iCumRate += 15;} //0.7936507937 1890코레스 부츠（여성용）
					case(129){itemString = `id:17010`; iCumRate += 15;} //0.7936507937 1890코레스 부츠（남성용）
					case(130){itemString = `id:17023`; iCumRate += 15;} //0.7936507937 1890에나멜 신발
					case(131){itemString = `id:16031`; iCumRate += 15;} //0.7936507937 1890쓰리라인 타이트 글러브
					case(132){itemString = `id:16026`; iCumRate += 15;} //0.7936507937 1890산드라 스나이퍼 수트 글러브
					case(133){itemString = `id:16016`; iCumRate += 15;} //0.7936507937 1890라이트 글러브
					case(134){itemString = `id:17003`; iCumRate += 15;} //0.7936507937 1890가죽 신발（남성용）
					case(135){itemString = `id:17024`; iCumRate += 15;} //0.7936507937 1890통굽 샌달
					case(136){itemString = `id:17013`; iCumRate += 15;} //0.7936507937 1890두꺼운 샌달
					case(137){itemString = `id:17069`; iCumRate += 15;} //0.7936507937 1890레오 슈즈
					case(138){itemString = `id:15020`; iCumRate += 15;} //0.7936507937 1890코레스 힐러드레스
					case(139){itemString = `id:15044`; iCumRate += 15;} //0.7936507937 1890목수용 작업복
					case(140){itemString = `id:15041`; iCumRate += 15;} //0.7936507937 1890사무직 여성용 슈트
					case(141){itemString = `id:15027`; iCumRate += 15;} //0.7936507937 1890몬거 롱스커트
					case(142){itemString = `id:15018`; iCumRate += 15;} //0.7936507937 1890몬거 여행자옷（여성용）
					case(143){itemString = `id:15033`; iCumRate += 15;} //0.7936507937 1890몬거 여행자옷(남성용）
					case(144){itemString = `id:15023`; iCumRate += 15;} //0.7936507937 1890토크 사냥꾼옷（여성용）
					case(145){itemString = `id:15035`; iCumRate += 15;} //0.7936507937 1890토크 사냥꾼옷（남성용）
					case(146){itemString = `id:19003`; iCumRate += 15;} //0.7936507937 1890트리콜로르 로브
					case(147){itemString = `id:18002`; iCumRate += 15;} //0.7936507937 1890몬거 캡
					case(148){itemString = `id:51014 count:5`; iCumRate += 15;} //0.7936507937 1890스태미나 100 포션 5개
					case(149){itemString = `id:51004 count:5`; iCumRate += 15;} //0.7936507937 1890생명력 100포션 5개
					case(150){itemString = `id:51009 count:5`; iCumRate += 15;} //0.7936507937 1890마나 100포션 5개

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
	//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
					return;
				}

				++i;
			}
		}
}
