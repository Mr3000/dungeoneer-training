////////////////////////////////////////////////////////////////////////////////
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
server bool IsUsableScriptItem(
	character player,
	item cItem)
// : 아이템 사용 여부를 결정한다.
////////////////////////////////////////////////////////////////////////////////
{
	if (player.GetItemNoWithClassId(91208) > 0)
	{
		// 임시 인벤토리가 비어 있으면
		if (player.GetItemNoInPocket(20) == 0)
		{
			return true;	
		}
		else
		{
			if (GetLocale().LowerCase() == `korea`)
			{
				player.ShowCaption(["event.item.item91206.1"], 100);
			}
			return false;
		}
	}
	else
	{
		return false;
	}
}
////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	object_list cItemList;
	cItemList = player.GetItemList(91208);
	item ckey = (item)cItemList.GetValue(0);
	player.DecreaseItemBundleCount(ckey, `Ancient_key`);
//	player.RemoveItemCls(91208,1);
	int itemID = cItem.GetClassId();
	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(4443);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40345 `; iCumRate +=1;} //0.022507315팔카타
					case(1){itemString = `id:40346 `; iCumRate +=1;} //0.022507315하이랜더 클레이 모어
					case(2){itemString = `id:40347 `; iCumRate +=1;} //0.022507315하이랜더 롱 보우
					case(3){itemString = `id:40348 `; iCumRate +=1;} //0.022507315프랑키스카
					case(4){itemString = `id:46027 `; iCumRate +=1;} //0.022507315타지 실드
					case(5){itemString = `id:15602 `; iCumRate +=1;} //0.022507315레이모어 의상
					case(6){itemString = `id:17236 `; iCumRate +=1;} //0.022507315레이모어 신발
					case(7){itemString = `id:15601 `; iCumRate +=1;} //0.022507315케이 의상
					case(8){itemString = `id:17235 `; iCumRate +=1;} //0.022507315케이 신발
					case(9){itemString = `id:15420 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 수트(여)
					case(10){itemString = `id:15419 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 수트(남)
					case(11){itemString = `id:18248 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 모자
					case(12){itemString = `id:18249 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 헤어밴드
					case(13){itemString = `id:17163 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 부츠
					case(14){itemString = `id:17162 `; iCumRate +=1;} //0.022507315에메랄드 켈틱 패턴 신발
					case(15){itemString = `id:19059 `; iCumRate +=1;} //0.022507315나쿠루 드래곤 문양 마법사 로브(여)
					case(16){itemString = `id:19058 `; iCumRate +=1;} //0.022507315나쿠루 드래곤 문양 마법사 로브(남)
					case(17){itemString = `id:18569 `; iCumRate +=1;} //0.022507315devCAT 모자
					case(18){itemString = `id:18237 `; iCumRate +=1;} //0.022507315딕 스티치 마스크
					case(19){itemString = `id:40250 `; iCumRate +=1;} //0.022507315메탈 파이어 원드
					case(20){itemString = `id:40171 `; iCumRate +=1;} //0.022507315마사무네
					case(21){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 아머
					case(22){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 뱀브레이스
					case(23){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 그리브
					case(24){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(여성용)
					case(25){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(남성용)
					case(26){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(27){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 건틀렛
					case(28){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 부츠
					case(29){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.022507315냄비(심해의)
					case(30){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.022507315남성용 마법사 정장
					case(31){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.022507315여성용 마법사 정장
					case(32){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 아머
					case(33){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 뱀브레이스
					case(34){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.022507315더스틴 실버 나이트 그리브
					case(35){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(여성용)
					case(36){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(남성용)
					case(37){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(38){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 건틀렛
					case(39){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.022507315발렌시아 크로스 라인 플레이트 부츠
					case(40){itemString = `id:15298 `; iCumRate +=1;} //0.022507315아처리스 스쿨웨어
					case(41){itemString = `id:15079 `; iCumRate +=1;} //0.022507315볼레로 앤 점퍼 스커트
					case(42){itemString = `id:15222 `; iCumRate +=1;} //0.022507315그레이스 숄 드레스(여성용)
					case(43){itemString = `id:16046 `; iCumRate +=1;} //0.022507315고양이 손 장갑
					case(44){itemString = `id:18187 `; iCumRate +=1;} //0.022507315커다란 리본
					case(45){itemString = `id:18188 `; iCumRate +=1;} //0.022507315안대
					case(46){itemString = `id:18189 `; iCumRate +=1;} //0.022507315카우보이 모자
					case(47){itemString = `id:15252 `; iCumRate +=1;} //0.022507315집사 의상
					case(48){itemString = `id:19005 `; iCumRate +=1;} //0.022507315머플러 로브
					case(49){itemString = `id:18161 `; iCumRate +=1;} //0.022507315데브캣 귀마개
					case(50){itemString = `id:18157 `; iCumRate +=1;} //0.022507315고양이 귀 머리띠
					case(51){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=2;} //0.04501463레더 롱 보우
					case(52){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.04501463글라디우스
					case(53){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=2;} //0.04501463라이트닝 원드
					case(54){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.04501463메이스
					case(55){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463드래곤 블레이드
					case(56){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463클레이모어
					case(57){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463레더 롱 보우
					case(58){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463힐링 원드
					case(59){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463글라디우스
					case(60){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463라이트닝 원드
					case(61){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463아이스 원드
					case(62){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463파이어 원드
					case(63){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463타격용 원드
					case(64){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463비펜니스
					case(65){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463메이스
					case(66){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463석궁
					case(67){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463투 핸디드 소드
					case(68){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463롱 보우
					case(69){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463guardian bow
					case(70){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.04501463헤테로 카이트 실드
					case(71){itemString = `id:15267 `; iCumRate +=2;} //0.04501463테라 고딕 풀 드레스
					case(72){itemString = `id:15268 `; iCumRate +=2;} //0.04501463테라 고딕 펑크 수트
					case(73){itemString = `id:19005 `; iCumRate +=2;} //0.04501463머플러 로브
					case(74){itemString = `id:15217 `; iCumRate +=2;} //0.04501463에이프런 원피스
					case(75){itemString = `id:18161 `; iCumRate +=2;} //0.04501463데브캣 귀마개
					case(76){itemString = `id:18157 `; iCumRate +=2;} //0.04501463고양이 귀 머리띠
					case(77){itemString = `id:15233 `; iCumRate +=2;} //0.04501463엘레건트 고딕 드레스
					case(78){itemString = `id:15234 `; iCumRate +=2;} //0.04501463엘레건트 고딕 슈트
					case(79){itemString = `id:15235 `; iCumRate +=2;} //0.04501463엘레건트 고딕 드레스
					case(80){itemString = `id:15233 `; iCumRate +=2;} //0.04501463엘레건트 고딕 드레스
					case(81){itemString = `id:15234 `; iCumRate +=2;} //0.04501463엘레건트 고딕 슈트
					case(82){itemString = `id:15235 `; iCumRate +=2;} //0.04501463엘레건트 고딕 드레스
					case(83){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=3;} //0.067521945드래곤 블레이드
					case(84){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=3;} //0.067521945클레이모어
					case(85){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=3;} //0.067521945힐링 원드
					case(86){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=3;} //0.067521945아이스 원드
					case(87){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=3;} //0.067521945파이어 원드
					case(88){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=3;} //0.067521945타격용 원드
					case(89){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=3;} //0.067521945비펜니스
					case(90){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=3;} //0.067521945석궁
					case(91){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=3;} //0.067521945투 핸디드 소드
					case(92){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=3;} //0.067521945롱 보우
					case(93){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=3;} //0.067521945가디언 보우
					case(94){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=3;} //0.067521945헤테로 카이트 실드
					case(95){itemString = `id:14039 `; iCumRate +=4;} //0.09002926차이나 드래곤 아머(인간)
					case(96){itemString = `id:14040 `; iCumRate +=4;} //0.09002926차이나 드래곤 아머(엘프)
					case(97){itemString = `id:14041 `; iCumRate +=4;} //0.09002926차이나 드래곤 아머(자이언트)
					case(98){itemString = `id:16532 `; iCumRate +=4;} //0.09002926차이나 드래곤 건틀렛(인간/자이언트)
					case(99){itemString = `id:16535 `; iCumRate +=4;} //0.09002926차이나 드래곤 건틀렛(자이언트)
					case(100){itemString = `id:16533 `; iCumRate +=4;} //0.09002926차이나 드래곤 건틀렛(엘프)
					case(101){itemString = `id:17095 `; iCumRate +=4;} //0.09002926차이나 드래곤 부츠
					case(102){itemString = `id:18552 `; iCumRate +=4;} //0.09002926차이나 드래곤 헬름
					case(103){itemString = `id:40170 `; iCumRate +=5;} //0.112536574일본식 양손검
					case(104){itemString = `id:51007 count:10`; iCumRate +=10;} //0.225073149마나 30 포션
					case(105){itemString = `id:51013 count:10`; iCumRate +=10;} //0.225073149스태미나 50 포션
					case(106){itemString = `id:51001 count:10`; iCumRate +=10;} //0.225073149생명력 10 포션
					case(107){itemString = `id:51002 count:10`; iCumRate +=10;} //0.225073149생명력 30 포션
					case(108){itemString = `id:51022 count:10`; iCumRate +=10;} //0.225073149생명력과 마나 30 포션
					case(109){itemString = `id:51027 count:10`; iCumRate +=10;} //0.225073149생명력과 스태미나 30 포션
					case(110){itemString = `id:51028 count:10`; iCumRate +=10;} //0.225073149생명력과 스태미나 50 포션
					case(111){itemString = `id:63000 count:10`; iCumRate +=10;} //0.225073149피닉스의 깃털
					case(112){itemString = `id:60037 count:5`; iCumRate +=10;} //0.225073149블랙 유스 포션
					case(113){itemString = `id:60038 count:5`; iCumRate +=10;} //0.225073149레드 포션
					case(114){itemString = `id:50012 count:5`; iCumRate +=10;} //0.225073149황금 달걀
					case(115){itemString = `id:50013 count:5`; iCumRate +=10;} //0.225073149황금 사과
					case(116){itemString = `id:50541 quality:100`; iCumRate +=10;} //0.225073149에스프레소
					case(117){itemString = `id:50542 quality:100`; iCumRate +=10;} //0.225073149에스프레소 마끼아또 
					case(118){itemString = `id:50543 quality:100`; iCumRate +=10;} //0.225073149카푸치노
					case(119){itemString = `id:50544 quality:100`; iCumRate +=10;} //0.225073149마끼아또
					case(120){itemString = `id:50545 quality:100`; iCumRate +=10;} //0.225073149카페 모카
					case(121){itemString = `id:50546 quality:100`; iCumRate +=10;} //0.225073149아이스 카페 모카
					case(122){itemString = `id:50547 quality:100`; iCumRate +=10;} //0.225073149아이스 마끼아또
					case(123){itemString = `id:50170 quality:100`; iCumRate +=10;} //0.225073149치즈 퐁듀
					case(124){itemString = `id:50171 quality:100`; iCumRate +=10;} //0.225073149이멘 마하산 와인
					case(125){itemString = `id:50172 quality:100`; iCumRate +=10;} //0.225073149레어치즈 케익
					case(126){itemString = `id:50173 quality:100`; iCumRate +=10;} //0.225073149가토 오 쇼콜라
					case(127){itemString = `id:50174 quality:100`; iCumRate +=10;} //0.225073149크로크 무슈
					case(128){itemString = `id:50175 quality:100`; iCumRate +=10;} //0.225073149브라우니
					case(129){itemString = `id:50176 quality:100`; iCumRate +=10;} //0.225073149버터 비스킷
					case(130){itemString = `id:62005 suffix:30515`; iCumRate +=15;} //0.337609723해적의
					case(131){itemString = `id:62005 prefix:20505`; iCumRate +=15;} //0.337609723리자드
					case(132){itemString = `id:62005 prefix:21007`; iCumRate +=15;} //0.337609723히스
					case(133){itemString = `id:62005 prefix:20625`; iCumRate +=15;} //0.337609723금속 바늘
					case(134){itemString = `id:62005 suffix:30624`; iCumRate +=15;} //0.337609723산사나무
					case(135){itemString = `id:62005 prefix:20721`; iCumRate +=15;} //0.337609723한가한
					case(136){itemString = `id:62005 suffix:30918`; iCumRate +=15;} //0.337609723마나 위자드|마나 위자드(suffix)
					case(137){itemString = `id:62005 suffix:30632`; iCumRate +=15;} //0.337609723버스트 나이트|버스트 나이트(suffix)
					case(138){itemString = `id:62005 suffix:30525`; iCumRate +=15;} //0.337609723마나 서머너|마나 서머너(suffix)
					case(139){itemString = `id:62005 suffix:30418`; iCumRate +=15;} //0.337609723포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(140){itemString = `id:18518 `; iCumRate +=20;} //0.450146298드래곤 크레스트
					case(141){itemString = `id:15113 `; iCumRate +=20;} //0.450146298여성용 검사학교 교복 쇼트타입
					case(142){itemString = `id:15114 `; iCumRate +=20;} //0.450146298남성용 검사학교 교복 롱타입
					case(143){itemString = `id:15065 `; iCumRate +=20;} //0.450146298엘라 베스트 스커트
					case(144){itemString = `id:19008 `; iCumRate +=20;} //0.450146298코코 판다 로브
					case(145){itemString = `id:15137 `; iCumRate +=20;} //0.450146298셀리나 하프 재킷 코트
					case(146){itemString = `id:18041 `; iCumRate +=20;} //0.450146298큰 챙 깃털 모자
					case(147){itemString = `id:19009 `; iCumRate +=20;} //0.450146298코코 래빗 로브
					case(148){itemString = `id:18112 `; iCumRate +=20;} //0.450146298해 분장 소품
					case(149){itemString = `id:18111 `; iCumRate +=20;} //0.450146298나무 분장 소품
					case(150){itemString = `id:18110 `; iCumRate +=20;} //0.450146298덤불 분장 소품
					case(151){itemString = `id:18109 `; iCumRate +=20;} //0.450146298나오 분장 소품
					case(152){itemString = `id:18108 `; iCumRate +=20;} //0.450146298바위 분장 소품
					case(153){itemString = `id:40083 `; iCumRate +=20;} //0.450146298훅 커틀러스
					case(154){itemString = `id:40032 `; iCumRate +=20;} //0.450146298가고일 소드
					case(155){itemString = `id:18544 `; iCumRate +=20;} //0.450146298펠리칸 프로텍터
					case(156){itemString = `id:18547 `; iCumRate +=20;} //0.450146298파나쉬 헤드 프로텍터
					case(157){itemString = `id:18521 `; iCumRate +=20;} //0.450146298유러피안 컴프
					case(158){itemString = `id:18500 `; iCumRate +=20;} //0.450146298링 메일 헬름
					case(159){itemString = `id:18511 `; iCumRate +=20;} //0.450146298플루트 풀 헬름
					case(160){itemString = `id:18502 `; iCumRate +=20;} //0.450146298본 헬름
					case(161){itemString = `id:19007 `; iCumRate +=20;} //0.450146298야광 머플러 로브
					case(162){itemString = `id:19017 `; iCumRate +=20;} //0.450146298늑대 로브
					case(163){itemString = `id:19016 `; iCumRate +=20;} //0.450146298곰 로브
					case(164){itemString = `id:15112 `; iCumRate +=20;} //0.450146298셀리나 스쿨보이룩
					case(165){itemString = `id:18034 `; iCumRate +=20;} //0.450146298볼륨 베레모
					case(166){itemString = `id:18006 `; iCumRate +=20;} //0.450146298마법사모자
					case(167){itemString = `id:18113 `; iCumRate +=20;} //0.450146298뾰족귀 고양이 모자
					case(168){itemString = `id:18114 `; iCumRate +=20;} //0.450146298줄무늬 고양이 모자
					case(169){itemString = `id:18115 `; iCumRate +=20;} //0.450146298핀 고양이 모자
					case(170){itemString = `id:18097 `; iCumRate +=20;} //0.450146298세이렌 깃털 가면
					case(171){itemString = `id:18098 `; iCumRate +=20;} //0.450146298세이렌의 안경
					case(172){itemString = `id:18099 `; iCumRate +=20;} //0.450146298세이렌 작은 날개 가면
					case(173){itemString = `id:18100 `; iCumRate +=20;} //0.450146298세이렌 날개 가면
					case(174){itemString = `id:18101`; iCumRate +=20;} //0.450146298세이렌 박쥐 날개 가면
					case(175){itemString = `id:18102 `; iCumRate +=20;} //0.450146298세이렌의 가면
					case(176){itemString = `id:15055 `; iCumRate +=20;} //0.450146298세이렌 고양이 가면
					case(177){itemString = `id:18044 `; iCumRate +=20;} //0.450146298범죄용 복면
					case(178){itemString = `id:40071 `; iCumRate +=20;} //0.450146298'라' 음 빈 병
					case(179){itemString = `id:40072 `; iCumRate +=20;} //0.450146298'시' 음 빈 병
					case(180){itemString = `id:40073 `; iCumRate +=20;} //0.450146298'도' 음 빈 병
					case(181){itemString = `id:40074 `; iCumRate +=20;} //0.450146298'레' 음 빈 병
					case(182){itemString = `id:40075 `; iCumRate +=20;} //0.450146298'미' 음 빈 병
					case(183){itemString = `id:40076 `; iCumRate +=20;} //0.450146298'파' 음 빈 병
					case(184){itemString = `id:40077 `; iCumRate +=20;} //0.450146298'솔' 음 빈 병
					case(185){itemString = `id:16517 `; iCumRate +=20;} //0.450146298반대 장갑
					case(186){itemString = `id:16516 `; iCumRate +=20;} //0.450146298찬성 장갑
					case(187){itemString = `id:16515 `; iCumRate +=20;} //0.450146298보 장갑
					case(188){itemString = `id:16514 `; iCumRate +=20;} //0.450146298바위 장갑
					case(189){itemString = `id:16513 `; iCumRate +=20;} //0.450146298가위 장갑
					case(190){itemString = `id:40068 `; iCumRate +=20;} //0.450146298가위 모양 지시봉
					case(191){itemString = `id:40069 `; iCumRate +=20;} //0.450146298바위 모양 지시봉
					case(192){itemString = `id:40070 `; iCumRate +=20;} //0.450146298보 모양 지시봉
					case(193){itemString = `id:17015 `; iCumRate +=20;} //0.450146298Combat Shoes
					case(194){itemString = `id:15055 `; iCumRate +=20;} //0.450146298레더 미니 원피스
					case(195){itemString = `id:15057 `; iCumRate +=20;} //0.450146298롱 레더 코트 (무광)
					case(196){itemString = `id:18040 `; iCumRate +=20;} //0.450146298코레스 꼭지 베레모
					case(197){itemString = `id:80000 `; iCumRate +=20;} //0.450146298나오의 검은 옷
					case(198){itemString = `id:80001 `; iCumRate +=20;} //0.450146298루아의 옷
					case(199){itemString = `id:80002 `; iCumRate +=20;} //0.450146298핑크색 코트
					case(200){itemString = `id:80003 `; iCumRate +=20;} //0.450146298검은색 코트
					case(201){itemString = `id:80004 `; iCumRate +=20;} //0.450146298나오의 노란색 봄 옷
					case(202){itemString = `id:80005 `; iCumRate +=20;} //0.450146298나오의 하얀색 봄 옷
					case(203){itemString = `id:80006 `; iCumRate +=20;} //0.450146298나오의 핑크색 봄 옷
					case(204){itemString = `id:18056 `; iCumRate +=20;} //0.450146298별 토끼 머리띠1
					case(205){itemString = `id:18057 `; iCumRate +=20;} //0.450146298별 토끼 머리띠2
					case(206){itemString = `id:18058 `; iCumRate +=20;} //0.450146298별 토끼 머리띠3
					case(207){itemString = `id:18059 `; iCumRate +=20;} //0.450146298별 토끼 머리띠4
					case(208){itemString = `id:18060 `; iCumRate +=20;} //0.450146298별 토끼 머리띠5
					case(209){itemString = `id:18061 `; iCumRate +=20;} //0.450146298털 토끼 머리띠1
					case(210){itemString = `id:18062 `; iCumRate +=20;} //0.450146298털 토끼 머리띠2
					case(211){itemString = `id:18063 `; iCumRate +=20;} //0.450146298털 토끼 머리띠3
					case(212){itemString = `id:18064 `; iCumRate +=20;} //0.450146298털 토끼 머리띠4
					case(213){itemString = `id:18065 `; iCumRate +=20;} //0.450146298털 토끼 머리띠5
					case(214){itemString = `id:18066 `; iCumRate +=20;} //0.450146298가죽 토끼 머리띠1
					case(215){itemString = `id:18067 `; iCumRate +=20;} //0.450146298가죽 토끼 머리띠2
					case(216){itemString = `id:18068 `; iCumRate +=20;} //0.450146298가죽 토끼 머리띠3
					case(217){itemString = `id:18069 `; iCumRate +=20;} //0.450146298가죽 토끼 머리띠4
					case(218){itemString = `id:18070 `; iCumRate +=20;} //0.450146298가죽 토끼 머리띠5
					case(219){itemString = `id:14036 `; iCumRate +=20;} //0.450146298티오즈 아머(남성용)
					case(220){itemString = `id:14037 `; iCumRate +=20;} //0.450146298티오즈 아머(여성용)
					case(221){itemString = `id:16531 `; iCumRate +=20;} //0.450146298티오즈 건틀렛
					case(222){itemString = `id:17523 `; iCumRate +=20;} //0.450146298티오즈 그리브
					case(223){itemString = `id:15132 `; iCumRate +=20;} //0.450146298내추럴 베스트 웨어
					case(224){itemString = `id:15070 `; iCumRate +=20;} //0.450146298스탠드칼라 슬리브리스
					case(225){itemString = `id:15230 `; iCumRate +=20;} //0.450146298가르텐 글렌 체크 스커트
					case(226){itemString = `id:19034 `; iCumRate +=20;} //0.450146298가르텐 클로스 오버코트
					case(227){itemString = `id:40033 `; iCumRate +=20;} //0.450146298클레이모어
					case(228){itemString = `id:40011 `; iCumRate +=20;} //0.450146298브로드 소드
					case(229){itemString = `id:40030 `; iCumRate +=20;} //0.450146298투 핸디드 소드
					case(230){itemString = `id:40012 `; iCumRate +=20;} //0.450146298바스타드 소드
					case(231){itemString = `id:40007 `; iCumRate +=20;} //0.450146298한손도끼
					case(232){itemString = `id:40014 `; iCumRate +=20;} //0.450146298콤포짓 보우
					case(233){itemString = `id:40078 `; iCumRate +=20;} //0.450146298비펜니스
					case(234){itemString = `id:40080 `; iCumRate +=20;} //0.450146298글라디우스
					case(235){itemString = `id:40006 `; iCumRate +=20;} //0.450146298단검
					case(236){itemString = `id:40031 `; iCumRate +=20;} //0.450146298석궁
					case(237){itemString = `id:40081 `; iCumRate +=20;} //0.450146298레더 롱 보우
					case(238){itemString = `id:40079 `; iCumRate +=20;} //0.450146298메이스
					case(239){itemString = `id:13043 `; iCumRate +=20;} //0.450146298레미니아 성월의 갑옷(남성용)
					case(240){itemString = `id:13044 `; iCumRate +=20;} //0.450146298레미니아 성월의 갑옷(여성용)
					case(241){itemString = `id:13045 `; iCumRate +=20;} //0.450146298아리쉬 아슈빈 아머(남성용)
					case(242){itemString = `id:13046 `; iCumRate +=20;} //0.450146298아리쉬 아슈빈 아머(여성용)
					case(243){itemString = `id:14019 `; iCumRate +=20;} //0.450146298그레이스 플레이트 아머
					case(244){itemString = `id:13031 `; iCumRate +=20;} //0.450146298스파이카 실버 플레이트 아머
					case(245){itemString = `id:13022 `; iCumRate +=20;} //0.450146298로즈 플레이트 아머 (P타입)
					case(246){itemString = `id:40039 `; iCumRate +=20;} //0.450146298아이스 원드
					case(247){itemString = `id:40090 `; iCumRate +=20;} //0.450146298힐링 원드
					case(248){itemString = `id:40040 `; iCumRate +=20;} //0.450146298파이어 원드
					case(249){itemString = `id:40038 `; iCumRate +=20;} //0.450146298라이트닝 원드
					case(250){itemString = `id:18542 `; iCumRate +=20;} //0.450146298빅 체인 풀 헬름
					case(251){itemString = `id:18506 `; iCumRate +=20;} //0.450146298윙 하프 헬름
					case(252){itemString = `id:14042 `; iCumRate +=20;} //0.450146298컬스틴 레더 아머
					case(253){itemString = `id:15155 `; iCumRate +=20;} //0.450146298이디카이 성직자 예복(남성용)
					case(254){itemString = `id:15156 `; iCumRate +=20;} //0.450146298이디카이 성직자 예복(여성용)
					case(255){itemString = `id:15151 `; iCumRate +=20;} //0.450146298뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(256){itemString = `id:15152 `; iCumRate +=20;} //0.450146298뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(257){itemString = `id:15153 `; iCumRate +=20;} //0.450146298산드라 스나이퍼 수트(남성용)
					case(258){itemString = `id:15154 `; iCumRate +=20;} //0.450146298산드라 스나이퍼 수트(여성용)
					case(259){itemString = `id:15157 `; iCumRate +=20;} //0.450146298위스 보위군 의복(남성용)
					case(260){itemString = `id:15158 `; iCumRate +=20;} //0.450146298위스 보위군 의복(여성용)
					case(261){itemString = `id:15115 `; iCumRate +=20;} //0.450146298재기드 미니 스커트
					case(262){itemString = `id:15059 `; iCumRate +=20;} //0.450146298터크스 탱크탑 반바지
					case(263){itemString = `id:15070 `; iCumRate +=20;} //0.450146298아이돌 리본 드레스
					case(264){itemString = `id:15074 `; iCumRate +=20;} //0.450146298루이스 성직자 코트
					case(265){itemString = `id:15061 `; iCumRate +=20;} //0.450146298물결무늬 옆트임 튜닉
					case(266){itemString = `id:18045 `; iCumRate +=20;} //0.450146298별장식 마법사 모자
					case(267){itemString = `id:18019 `; iCumRate +=20;} //0.450146298리리나 깃털모자
					case(268){itemString = `id:18020 `; iCumRate +=20;} //0.450146298몬거 깃털모자
					case(269){itemString = `id:18029 `; iCumRate +=20;} //0.450146298나무테 안경
					case(270){itemString = `id:18028 `; iCumRate +=20;} //0.450146298접이식 안경
					case(271){itemString = `id:13010 `; iCumRate +=20;} //0.450146298라운드 폴드론 체인메일
					case(272){itemString = `id:14025 `; iCumRate +=20;} //0.450146298카멜 스피리트 아머(남성용)
					case(273){itemString = `id:14026 `; iCumRate +=20;} //0.450146298카멜 스피리트 아머(여성용)
					case(274){itemString = `id:16028 `; iCumRate +=20;} //0.450146298카멜 스피리트 글러브
					case(275){itemString = `id:17064 `; iCumRate +=20;} //0.450146298카멜 스피리트 부츠
					case(276){itemString = `id:15131 `; iCumRate +=20;} //0.450146298핀 에이프런 스커트
					case(277){itemString = `id:2006 `; iCumRate +=20;} //0.450146298큰 금화 주머니
					case(278){itemString = `id:16534 `; iCumRate +=20;} //0.450146298컬스틴 레더 건틀렛
					case(279){itemString = `id:17524 `; iCumRate +=20;} //0.450146298컬스틴 레더 부츠
					case(280){itemString = `id:13047 `; iCumRate +=20;} //0.450146298키리누스진 하프 플레이트 아머(남성용)
					case(281){itemString = `id:13048 `; iCumRate +=20;} //0.450146298키리누스진 하프 플레이트 아머(여성용)
					case(282){itemString = `id:14013 `; iCumRate +=20;} //0.450146298로리카 세그먼타타에
					case(283){itemString = `id:14035 `; iCumRate +=20;} //0.450146298피르타 레더 아머
					case(284){itemString = `id:14038 `; iCumRate +=20;} //0.450146298피르타 레더 아머 B타입(여성용)
					case(285){itemString = `id:15028 `; iCumRate +=20;} //0.450146298코레스 씨프슈트
					case(286){itemString = `id:15042 `; iCumRate +=20;} //0.450146298롱넥 원피스
					case(287){itemString = `id:15052 `; iCumRate +=20;} //0.450146298터크스 투톤 튜닉
					case(288){itemString = `id:15053 `; iCumRate +=20;} //0.450146298플랫칼라 원피스
					case(289){itemString = `id:15128 `; iCumRate +=20;} //0.450146298투 톤 비조 드레스
					case(290){itemString = `id:15136 `; iCumRate +=20;} //0.450146298모험가 슈트
					case(291){itemString = `id:16008 `; iCumRate +=20;} //0.450146298코레스 씨프 글러브
					case(292){itemString = `id:16019 `; iCumRate +=20;} //0.450146298줄무늬 팔목 장갑
					case(293){itemString = `id:16040 `; iCumRate +=20;} //0.450146298콜린 빅센 글러브
					case(294){itemString = `id:16505 `; iCumRate +=20;} //0.450146298플루트 건틀렛
					case(295){itemString = `id:16520 `; iCumRate +=20;} //0.450146298롱 레더 글러브
					case(296){itemString = `id:17040 `; iCumRate +=20;} //0.450146298엘라 스트랩 부츠
					case(297){itemString = `id:17041 `; iCumRate +=20;} //0.450146298덩굴무늬 헌팅부츠
					case(298){itemString = `id:17045 `; iCumRate +=20;} //0.450146298브이 넥 라인 레더 부츠
					case(299){itemString = `id:17071 `; iCumRate +=20;} //0.450146298니하이 부츠
					case(300){itemString = `id:17087 `; iCumRate +=20;} //0.450146298콜린 빅센 부츠
					case(301){itemString = `id:17506 `; iCumRate +=20;} //0.450146298롱그리브 부츠
					case(302){itemString = `id:17522 `; iCumRate +=20;} //0.450146298피르타 레더 부츠
					case(303){itemString = `id:18008 `; iCumRate +=20;} //0.450146298스트라이프 캡
					case(304){itemString = `id:18038 `; iCumRate +=20;} //0.450146298깃털 배렛 모자
					case(305){itemString = `id:18047 `; iCumRate +=20;} //0.450146298코레스 펠트 모자
					case(306){itemString = `id:18513 `; iCumRate +=20;} //0.450146298스파이크 캡
					case(307){itemString = `id:18515 `; iCumRate +=20;} //0.450146298트윈 혼 캡
					case(308){itemString = `id:18525 `; iCumRate +=20;} //0.450146298워터드롭 캡
					case(309){itemString = `id:18543 `; iCumRate +=20;} //0.450146298슬릿 풀 헬름
					case(310){itemString = `id:19020 `; iCumRate +=20;} //0.450146298나타네 설산용 코트
					case(311){itemString = `id:19029 `; iCumRate +=20;} //0.450146298자이언트 베어 로브
					case(312){itemString = `id:40015 `; iCumRate +=20;} //0.450146298플루트 숏 소드
					case(313){itemString = `id:40081 `; iCumRate +=20;} //0.450146298롱 보우
					case(314){itemString = `id:46001 `; iCumRate +=20;} //0.450146298라운드 실드
					case(315){itemString = `id:46006 `; iCumRate +=20;} //0.450146298카이트 실드
					case(316){itemString = `id:40172 `; iCumRate +=20;} //0.450146298그레이트 소드
					case(317){itemString = `id:40174 `; iCumRate +=20;} //0.450146298모닝스타
					case(318){itemString = `id:40177 `; iCumRate +=20;} //0.450146298워리어 액스
					case(319){itemString = `id:40180 `; iCumRate +=20;} //0.450146298홉네일 너클
					case(320){itemString = `id:40041 `; iCumRate +=20;} //0.450146298타격용 원드
					case(321){itemString = `id:16523 `; iCumRate +=20;} //0.450146298그레이스 건틀렛
					case(322){itemString = `id:17515 `; iCumRate +=20;} //0.450146298그레이스 그리브
					case(323){itemString = `id:18545 `; iCumRate +=20;} //0.450146298그레이스 헬멧
					case(324){itemString = `id:46007 `; iCumRate +=20;} //0.450146298헤테로 카이트 실드
					case(325){itemString = `id:46008 `; iCumRate +=20;} //0.450146298라이트 헤테로 카이트 실드
					case(326){itemString = `id:51003 count:10`; iCumRate +=25;} //0.562682872생명력 50 포션
					case(327){itemString = `id:51004 count:10`; iCumRate +=25;} //0.562682872생명력 100 포션
					case(328){itemString = `id:51008 count:10`; iCumRate +=25;} //0.562682872마나 50 포션
					case(329){itemString = `id:51014 count:10`; iCumRate +=25;} //0.562682872스태미나 100 포션
					case(330){itemString = `id:51029 count:10`; iCumRate +=25;} //0.562682872생명력과 스태미나 100 포션
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
					item newItem;
					newItem = player.AddItemEx(itemString, false);
					player.ShowTreasureboxOpenCut(newItem);
					bAncientTreasureChestGived = true;
					return;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(4576);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.021853147코레스 미스터리 로스웰 (UFO)
					case(1){itemString = `id:40255 `; iCumRate +=2;} //0.043706294파나 케아 힐링 원드
					case(2){itemString = `id:40253 `; iCumRate +=2;} //0.043706294메탈 아이스 원드
					case(3){itemString = `id:40254 `; iCumRate +=2;} //0.043706294퀘르쿠스 파이어 원드
					case(4){itemString = `id:40248 `; iCumRate +=2;} //0.043706294메탈 라이트닝 원드
					case(5){itemString = `id:40251 `; iCumRate +=2;} //0.043706294칼피누스 힐링 원드
					case(6){itemString = `id:40249 `; iCumRate +=2;} //0.043706294파르 아이스 원드
					case(7){itemString = `id:40250 `; iCumRate +=2;} //0.043706294메탈 파이어 원드
					case(8){itemString = `id:40252 `; iCumRate +=2;} //0.043706294이미션 라이트닝 원드
					case(9){itemString = `id:18569 `; iCumRate +=2;} //0.043706294devCAT 모자
					case(10){itemString = `id:40171 `; iCumRate +=2;} //0.043706294마사무네
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 아머
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 뱀브레이스
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 그리브
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(여성용)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(남성용)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 건틀렛
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 부츠
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=2;} //0.043706294냄비(심해의)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=2;} //0.043706294남성용 마법사 정장
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=2;} //0.043706294여성용 마법사 정장
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 아머
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 뱀브레이스
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=2;} //0.043706294더스틴 실버 나이트 그리브
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(여성용)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(남성용)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 건틀렛
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=2;} //0.043706294발렌시아 크로스 라인 플레이트 부츠
					case(30){itemString = `id:15298 `; iCumRate +=2;} //0.043706294아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=2;} //0.043706294볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=2;} //0.043706294그레이스 숄 드레스(여성용)
					case(33){itemString = `id:46022 `; iCumRate +=4;} //0.087412587부채
					case(34){itemString = `id:15346 `; iCumRate +=4;} //0.087412587유카타 남
					case(35){itemString = `id:15347 `; iCumRate +=4;} //0.087412587유타카 여
					case(36){itemString = `id:16046 `; iCumRate +=4;} //0.087412587고양이 손 장갑
					case(37){itemString = `id:18187 `; iCumRate +=4;} //0.087412587커다란 리본
					case(38){itemString = `id:18188 `; iCumRate +=4;} //0.087412587안대
					case(39){itemString = `id:18189 `; iCumRate +=4;} //0.087412587카우보이 모자
					case(40){itemString = `id:15252 `; iCumRate +=4;} //0.087412587집사 의상
					case(41){itemString = `id:19005 `; iCumRate +=4;} //0.087412587머플러 로브
					case(42){itemString = `id:18161 `; iCumRate +=4;} //0.087412587데브캣 귀마개
					case(43){itemString = `id:18157 `; iCumRate +=4;} //0.087412587고양이 귀 머리띠
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=4;} //0.087412587레더 롱 보우
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=4;} //0.087412587글라디우스
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=4;} //0.087412587라이트닝 원드
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=4;} //0.087412587메이스
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587드래곤 블레이드
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587클레이모어
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587레더 롱 보우
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587힐링 원드
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587글라디우스
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587라이트닝 원드
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587아이스 원드
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587파이어 원드
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587타격용 원드
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587비펜니스
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587메이스
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587석궁
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587투 핸디드 소드
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587롱 보우
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=4;} //0.087412587헤테로 카이트 실드
					case(64){itemString = `id:15267 `; iCumRate +=4;} //0.087412587테라 고딕 풀 드레스
					case(65){itemString = `id:15268 `; iCumRate +=4;} //0.087412587테라 고딕 펑크 수트
					case(66){itemString = `id:19005 `; iCumRate +=4;} //0.087412587머플러 로브
					case(67){itemString = `id:15217 `; iCumRate +=4;} //0.087412587에이프런 원피스
					case(68){itemString = `id:18161 `; iCumRate +=4;} //0.087412587데브캣 귀마개
					case(69){itemString = `id:18157 `; iCumRate +=4;} //0.087412587고양이 귀 머리띠
					case(70){itemString = `id:15233 `; iCumRate +=4;} //0.087412587엘레건트 고딕 드레스
					case(71){itemString = `id:15234 `; iCumRate +=4;} //0.087412587엘레건트 고딕 슈트
					case(72){itemString = `id:15235 `; iCumRate +=4;} //0.087412587엘레건트 고딕 드레스
					case(73){itemString = `id:15233 `; iCumRate +=4;} //0.087412587엘레건트 고딕 드레스
					case(74){itemString = `id:15234 `; iCumRate +=4;} //0.087412587엘레건트 고딕 슈트
					case(75){itemString = `id:15235 `; iCumRate +=4;} //0.087412587엘레건트 고딕 드레스
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=4;} //0.087412587드래곤 블레이드
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=4;} //0.087412587클레이모어
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=4;} //0.087412587힐링 원드
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=4;} //0.087412587아이스 원드
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=4;} //0.087412587파이어 원드
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=4;} //0.087412587타격용 원드
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=4;} //0.087412587비펜니스
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=4;} //0.087412587석궁
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=4;} //0.087412587투 핸디드 소드
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=4;} //0.087412587롱 보우
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=4;} //0.087412587가디언 보우
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=4;} //0.087412587헤테로 카이트 실드
					case(88){itemString = `id:14039 `; iCumRate +=4;} //0.087412587차이나 드래곤 아머(인간)
					case(89){itemString = `id:14040 `; iCumRate +=4;} //0.087412587차이나 드래곤 아머(엘프)
					case(90){itemString = `id:14041 `; iCumRate +=4;} //0.087412587차이나 드래곤 아머(자이언트)
					case(91){itemString = `id:16532 `; iCumRate +=4;} //0.087412587차이나 드래곤 건틀렛(인간/자이언트)
					case(92){itemString = `id:16535 `; iCumRate +=4;} //0.087412587차이나 드래곤 건틀렛(자이언트)
					case(93){itemString = `id:16533 `; iCumRate +=4;} //0.087412587차이나 드래곤 건틀렛(엘프)
					case(94){itemString = `id:17095 `; iCumRate +=4;} //0.087412587차이나 드래곤 부츠
					case(95){itemString = `id:18552 `; iCumRate +=4;} //0.087412587차이나 드래곤 헬름
					case(96){itemString = `id:40170 `; iCumRate +=4;} //0.087412587일본식 양손검
					case(97){itemString = `id:51007 count:10`; iCumRate +=10;} //0.218531469마나 30 포션
					case(98){itemString = `id:51013 count:10`; iCumRate +=10;} //0.218531469스태미나 50 포션
					case(99){itemString = `id:51001 count:10`; iCumRate +=10;} //0.218531469생명력 10 포션
					case(100){itemString = `id:51002 count:10`; iCumRate +=10;} //0.218531469생명력 30 포션
					case(101){itemString = `id:51022 count:10`; iCumRate +=10;} //0.218531469생명력과 마나 30 포션
					case(102){itemString = `id:51027 count:10`; iCumRate +=10;} //0.218531469생명력과 스태미나 30 포션
					case(103){itemString = `id:51028 count:10`; iCumRate +=10;} //0.218531469생명력과 스태미나 50 포션
					case(104){itemString = `id:63000 count:10`; iCumRate +=10;} //0.218531469피닉스의 깃털
					case(105){itemString = `id:60037 count:5`; iCumRate +=10;} //0.218531469블랙 유스 포션
					case(106){itemString = `id:60038 count:5`; iCumRate +=10;} //0.218531469레드 포션
					case(107){itemString = `id:50012 count:5`; iCumRate +=10;} //0.218531469황금 달걀
					case(108){itemString = `id:50013 count:5`; iCumRate +=10;} //0.218531469황금 사과
					case(109){itemString = `id:50541 quality:100`; iCumRate +=10;} //0.218531469에스프레소
					case(110){itemString = `id:50542 quality:100`; iCumRate +=10;} //0.218531469에스프레소 마끼아또 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=10;} //0.218531469카푸치노
					case(112){itemString = `id:50544 quality:100`; iCumRate +=10;} //0.218531469마끼아또
					case(113){itemString = `id:50545 quality:100`; iCumRate +=10;} //0.218531469카페 모카
					case(114){itemString = `id:50546 quality:100`; iCumRate +=10;} //0.218531469아이스 카페 모카
					case(115){itemString = `id:50547 quality:100`; iCumRate +=10;} //0.218531469아이스 마끼아또
					case(116){itemString = `id:50170 quality:100`; iCumRate +=10;} //0.218531469치즈 퐁듀
					case(117){itemString = `id:50171 quality:100`; iCumRate +=10;} //0.218531469이멘 마하산 와인
					case(118){itemString = `id:50172 quality:100`; iCumRate +=10;} //0.218531469레어치즈 케익
					case(119){itemString = `id:50173 quality:100`; iCumRate +=10;} //0.218531469가토 오 쇼콜라
					case(120){itemString = `id:50174 quality:100`; iCumRate +=10;} //0.218531469크로크 무슈
					case(121){itemString = `id:50175 quality:100`; iCumRate +=10;} //0.218531469브라우니
					case(122){itemString = `id:50176 quality:100`; iCumRate +=10;} //0.218531469버터 비스킷
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=15;} //0.327797203해적의
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=15;} //0.327797203리자드
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=15;} //0.327797203히스
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=15;} //0.327797203금속 바늘
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=15;} //0.327797203산사나무
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=15;} //0.327797203한가한
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=15;} //0.327797203마나 위자드|마나 위자드(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=15;} //0.327797203버스트 나이트|버스트 나이트(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=15;} //0.327797203마나 서머너|마나 서머너(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=15;} //0.327797203포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=20;} //0.437062937드래곤 크레스트
					case(134){itemString = `id:15113 `; iCumRate +=20;} //0.437062937여성용 검사학교 교복 쇼트타입
					case(135){itemString = `id:15114 `; iCumRate +=20;} //0.437062937남성용 검사학교 교복 롱타입
					case(136){itemString = `id:15065 `; iCumRate +=20;} //0.437062937엘라 베스트 스커트
					case(137){itemString = `id:19008 `; iCumRate +=20;} //0.437062937코코 판다 로브
					case(138){itemString = `id:15137 `; iCumRate +=20;} //0.437062937셀리나 하프 재킷 코트
					case(139){itemString = `id:18041 `; iCumRate +=20;} //0.437062937큰 챙 깃털 모자
					case(140){itemString = `id:19009 `; iCumRate +=20;} //0.437062937코코 래빗 로브
					case(141){itemString = `id:18112 `; iCumRate +=20;} //0.437062937해 분장 소품
					case(142){itemString = `id:18111 `; iCumRate +=20;} //0.437062937나무 분장 소품
					case(143){itemString = `id:18110 `; iCumRate +=20;} //0.437062937덤불 분장 소품
					case(144){itemString = `id:18109 `; iCumRate +=20;} //0.437062937나오 분장 소품
					case(145){itemString = `id:18108 `; iCumRate +=20;} //0.437062937바위 분장 소품
					case(146){itemString = `id:40083 `; iCumRate +=20;} //0.437062937훅 커틀러스
					case(147){itemString = `id:40032 `; iCumRate +=20;} //0.437062937가고일 소드
					case(148){itemString = `id:18544 `; iCumRate +=20;} //0.437062937펠리칸 프로텍터
					case(149){itemString = `id:18547 `; iCumRate +=20;} //0.437062937파나쉬 헤드 프로텍터
					case(150){itemString = `id:18521 `; iCumRate +=20;} //0.437062937유러피안 컴프
					case(151){itemString = `id:18500 `; iCumRate +=20;} //0.437062937링 메일 헬름
					case(152){itemString = `id:18511 `; iCumRate +=20;} //0.437062937플루트 풀 헬름
					case(153){itemString = `id:18502 `; iCumRate +=20;} //0.437062937본 헬름
					case(154){itemString = `id:19007 `; iCumRate +=20;} //0.437062937야광 머플러 로브
					case(155){itemString = `id:19017 `; iCumRate +=20;} //0.437062937늑대 로브
					case(156){itemString = `id:19016 `; iCumRate +=20;} //0.437062937곰 로브
					case(157){itemString = `id:15112 `; iCumRate +=20;} //0.437062937셀리나 스쿨보이룩
					case(158){itemString = `id:18034 `; iCumRate +=20;} //0.437062937볼륨 베레모
					case(159){itemString = `id:18006 `; iCumRate +=20;} //0.437062937마법사모자
					case(160){itemString = `id:18113 `; iCumRate +=20;} //0.437062937뾰족귀 고양이 모자
					case(161){itemString = `id:18114 `; iCumRate +=20;} //0.437062937줄무늬 고양이 모자
					case(162){itemString = `id:18115 `; iCumRate +=20;} //0.437062937핀 고양이 모자
					case(163){itemString = `id:18097 `; iCumRate +=20;} //0.437062937세이렌 깃털 가면
					case(164){itemString = `id:18098 `; iCumRate +=20;} //0.437062937세이렌의 안경
					case(165){itemString = `id:18099 `; iCumRate +=20;} //0.437062937세이렌 작은 날개 가면
					case(166){itemString = `id:18100 `; iCumRate +=20;} //0.437062937세이렌 날개 가면
					case(167){itemString = `id:18101`; iCumRate +=20;} //0.437062937세이렌 박쥐 날개 가면
					case(168){itemString = `id:18102 `; iCumRate +=20;} //0.437062937세이렌의 가면
					case(169){itemString = `id:15055 `; iCumRate +=20;} //0.437062937세이렌 고양이 가면
					case(170){itemString = `id:18044 `; iCumRate +=20;} //0.437062937범죄용 복면
					case(171){itemString = `id:40071 `; iCumRate +=20;} //0.437062937'라' 음 빈 병
					case(172){itemString = `id:40072 `; iCumRate +=20;} //0.437062937'시' 음 빈 병
					case(173){itemString = `id:40073 `; iCumRate +=20;} //0.437062937'도' 음 빈 병
					case(174){itemString = `id:40074 `; iCumRate +=20;} //0.437062937'레' 음 빈 병
					case(175){itemString = `id:40075 `; iCumRate +=20;} //0.437062937'미' 음 빈 병
					case(176){itemString = `id:40076 `; iCumRate +=20;} //0.437062937'파' 음 빈 병
					case(177){itemString = `id:40077 `; iCumRate +=20;} //0.437062937'솔' 음 빈 병
					case(178){itemString = `id:16517 `; iCumRate +=20;} //0.437062937반대 장갑
					case(179){itemString = `id:16516 `; iCumRate +=20;} //0.437062937찬성 장갑
					case(180){itemString = `id:16515 `; iCumRate +=20;} //0.437062937보 장갑
					case(181){itemString = `id:16514 `; iCumRate +=20;} //0.437062937바위 장갑
					case(182){itemString = `id:16513 `; iCumRate +=20;} //0.437062937가위 장갑
					case(183){itemString = `id:40068 `; iCumRate +=20;} //0.437062937가위 모양 지시봉
					case(184){itemString = `id:40069 `; iCumRate +=20;} //0.437062937바위 모양 지시봉
					case(185){itemString = `id:40070 `; iCumRate +=20;} //0.437062937보 모양 지시봉
					case(186){itemString = `id:17015 `; iCumRate +=20;} //0.437062937Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=20;} //0.437062937레더 미니 원피스
					case(188){itemString = `id:15057 `; iCumRate +=20;} //0.437062937롱 레더 코트 (무광)
					case(189){itemString = `id:18040 `; iCumRate +=20;} //0.437062937코레스 꼭지 베레모
					case(190){itemString = `id:80000 `; iCumRate +=20;} //0.437062937나오의 검은 옷
					case(191){itemString = `id:80001 `; iCumRate +=20;} //0.437062937루아의 옷
					case(192){itemString = `id:80002 `; iCumRate +=20;} //0.437062937핑크색 코트
					case(193){itemString = `id:80003 `; iCumRate +=20;} //0.437062937검은색 코트
					case(194){itemString = `id:80004 `; iCumRate +=20;} //0.437062937나오의 노란색 봄 옷
					case(195){itemString = `id:80005 `; iCumRate +=20;} //0.437062937나오의 하얀색 봄 옷
					case(196){itemString = `id:80006 `; iCumRate +=20;} //0.437062937나오의 핑크색 봄 옷
					case(197){itemString = `id:18056 `; iCumRate +=20;} //0.437062937별 토끼 머리띠1
					case(198){itemString = `id:18057 `; iCumRate +=20;} //0.437062937별 토끼 머리띠2
					case(199){itemString = `id:18058 `; iCumRate +=20;} //0.437062937별 토끼 머리띠3
					case(200){itemString = `id:18059 `; iCumRate +=20;} //0.437062937별 토끼 머리띠4
					case(201){itemString = `id:18060 `; iCumRate +=20;} //0.437062937별 토끼 머리띠5
					case(202){itemString = `id:18061 `; iCumRate +=20;} //0.437062937털 토끼 머리띠1
					case(203){itemString = `id:18062 `; iCumRate +=20;} //0.437062937털 토끼 머리띠2
					case(204){itemString = `id:18063 `; iCumRate +=20;} //0.437062937털 토끼 머리띠3
					case(205){itemString = `id:18064 `; iCumRate +=20;} //0.437062937털 토끼 머리띠4
					case(206){itemString = `id:18065 `; iCumRate +=20;} //0.437062937털 토끼 머리띠5
					case(207){itemString = `id:18066 `; iCumRate +=20;} //0.437062937가죽 토끼 머리띠1
					case(208){itemString = `id:18067 `; iCumRate +=20;} //0.437062937가죽 토끼 머리띠2
					case(209){itemString = `id:18068 `; iCumRate +=20;} //0.437062937가죽 토끼 머리띠3
					case(210){itemString = `id:18069 `; iCumRate +=20;} //0.437062937가죽 토끼 머리띠4
					case(211){itemString = `id:18070 `; iCumRate +=20;} //0.437062937가죽 토끼 머리띠5
					case(212){itemString = `id:14036 `; iCumRate +=20;} //0.437062937티오즈 아머(남성용)
					case(213){itemString = `id:14037 `; iCumRate +=20;} //0.437062937티오즈 아머(여성용)
					case(214){itemString = `id:16531 `; iCumRate +=20;} //0.437062937티오즈 건틀렛
					case(215){itemString = `id:17523 `; iCumRate +=20;} //0.437062937티오즈 그리브
					case(216){itemString = `id:15132 `; iCumRate +=20;} //0.437062937내추럴 베스트 웨어
					case(217){itemString = `id:15070 `; iCumRate +=20;} //0.437062937스탠드칼라 슬리브리스
					case(218){itemString = `id:15230 `; iCumRate +=20;} //0.437062937가르텐 글렌 체크 스커트
					case(219){itemString = `id:19034 `; iCumRate +=20;} //0.437062937가르텐 클로스 오버코트
					case(220){itemString = `id:40033 `; iCumRate +=20;} //0.437062937클레이모어
					case(221){itemString = `id:40011 `; iCumRate +=20;} //0.437062937브로드 소드
					case(222){itemString = `id:40030 `; iCumRate +=20;} //0.437062937투 핸디드 소드
					case(223){itemString = `id:40012 `; iCumRate +=20;} //0.437062937바스타드 소드
					case(224){itemString = `id:40007 `; iCumRate +=20;} //0.437062937한손도끼
					case(225){itemString = `id:40014 `; iCumRate +=20;} //0.437062937콤포짓 보우
					case(226){itemString = `id:40078 `; iCumRate +=20;} //0.437062937비펜니스
					case(227){itemString = `id:40080 `; iCumRate +=20;} //0.437062937글라디우스
					case(228){itemString = `id:40006 `; iCumRate +=20;} //0.437062937단검
					case(229){itemString = `id:40031 `; iCumRate +=20;} //0.437062937석궁
					case(230){itemString = `id:40081 `; iCumRate +=20;} //0.437062937레더 롱 보우
					case(231){itemString = `id:40079 `; iCumRate +=20;} //0.437062937메이스
					case(232){itemString = `id:13043 `; iCumRate +=20;} //0.437062937레미니아 성월의 갑옷(남성용)
					case(233){itemString = `id:13044 `; iCumRate +=20;} //0.437062937레미니아 성월의 갑옷(여성용)
					case(234){itemString = `id:13045 `; iCumRate +=20;} //0.437062937아리쉬 아슈빈 아머(남성용)
					case(235){itemString = `id:13046 `; iCumRate +=20;} //0.437062937아리쉬 아슈빈 아머(여성용)
					case(236){itemString = `id:14019 `; iCumRate +=20;} //0.437062937그레이스 플레이트 아머
					case(237){itemString = `id:13031 `; iCumRate +=20;} //0.437062937스파이카 실버 플레이트 아머
					case(238){itemString = `id:13022 `; iCumRate +=20;} //0.437062937로즈 플레이트 아머 (P타입)
					case(239){itemString = `id:40039 `; iCumRate +=20;} //0.437062937아이스 원드
					case(240){itemString = `id:40090 `; iCumRate +=20;} //0.437062937힐링 원드
					case(241){itemString = `id:40040 `; iCumRate +=20;} //0.437062937파이어 원드
					case(242){itemString = `id:40038 `; iCumRate +=20;} //0.437062937라이트닝 원드
					case(243){itemString = `id:18542 `; iCumRate +=20;} //0.437062937빅 체인 풀 헬름
					case(244){itemString = `id:18506 `; iCumRate +=20;} //0.437062937윙 하프 헬름
					case(245){itemString = `id:14042 `; iCumRate +=20;} //0.437062937컬스틴 레더 아머
					case(246){itemString = `id:15155 `; iCumRate +=20;} //0.437062937이디카이 성직자 예복(남성용)
					case(247){itemString = `id:15156 `; iCumRate +=20;} //0.437062937이디카이 성직자 예복(여성용)
					case(248){itemString = `id:15151 `; iCumRate +=20;} //0.437062937뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(249){itemString = `id:15152 `; iCumRate +=20;} //0.437062937뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(250){itemString = `id:15153 `; iCumRate +=20;} //0.437062937산드라 스나이퍼 수트(남성용)
					case(251){itemString = `id:15154 `; iCumRate +=20;} //0.437062937산드라 스나이퍼 수트(여성용)
					case(252){itemString = `id:15157 `; iCumRate +=20;} //0.437062937위스 보위군 의복(남성용)
					case(253){itemString = `id:15158 `; iCumRate +=20;} //0.437062937위스 보위군 의복(여성용)
					case(254){itemString = `id:15115 `; iCumRate +=20;} //0.437062937재기드 미니 스커트
					case(255){itemString = `id:15059 `; iCumRate +=20;} //0.437062937터크스 탱크탑 반바지
					case(256){itemString = `id:15070 `; iCumRate +=20;} //0.437062937아이돌 리본 드레스
					case(257){itemString = `id:15074 `; iCumRate +=20;} //0.437062937루이스 성직자 코트
					case(258){itemString = `id:15061 `; iCumRate +=20;} //0.437062937물결무늬 옆트임 튜닉
					case(259){itemString = `id:18045 `; iCumRate +=20;} //0.437062937별장식 마법사 모자
					case(260){itemString = `id:18019 `; iCumRate +=20;} //0.437062937리리나 깃털모자
					case(261){itemString = `id:18020 `; iCumRate +=20;} //0.437062937몬거 깃털모자
					case(262){itemString = `id:18029 `; iCumRate +=20;} //0.437062937나무테 안경
					case(263){itemString = `id:18028 `; iCumRate +=20;} //0.437062937접이식 안경
					case(264){itemString = `id:13010 `; iCumRate +=20;} //0.437062937라운드 폴드론 체인메일
					case(265){itemString = `id:14025 `; iCumRate +=20;} //0.437062937카멜 스피리트 아머(남성용)
					case(266){itemString = `id:14026 `; iCumRate +=20;} //0.437062937카멜 스피리트 아머(여성용)
					case(267){itemString = `id:16028 `; iCumRate +=20;} //0.437062937카멜 스피리트 글러브
					case(268){itemString = `id:17064 `; iCumRate +=20;} //0.437062937카멜 스피리트 부츠
					case(269){itemString = `id:15131 `; iCumRate +=20;} //0.437062937핀 에이프런 스커트
					case(270){itemString = `id:2006 `; iCumRate +=20;} //0.437062937큰 금화 주머니
					case(271){itemString = `id:16534 `; iCumRate +=20;} //0.437062937컬스틴 레더 건틀렛
					case(272){itemString = `id:17524 `; iCumRate +=20;} //0.437062937컬스틴 레더 부츠
					case(273){itemString = `id:13047 `; iCumRate +=20;} //0.437062937키리누스진 하프 플레이트 아머(남성용)
					case(274){itemString = `id:13048 `; iCumRate +=20;} //0.437062937키리누스진 하프 플레이트 아머(여성용)
					case(275){itemString = `id:14013 `; iCumRate +=20;} //0.437062937로리카 세그먼타타에
					case(276){itemString = `id:14035 `; iCumRate +=20;} //0.437062937피르타 레더 아머
					case(277){itemString = `id:14038 `; iCumRate +=20;} //0.437062937피르타 레더 아머 B타입(여성용)
					case(278){itemString = `id:15028 `; iCumRate +=20;} //0.437062937코레스 씨프슈트
					case(279){itemString = `id:15042 `; iCumRate +=20;} //0.437062937롱넥 원피스
					case(280){itemString = `id:15052 `; iCumRate +=20;} //0.437062937터크스 투톤 튜닉
					case(281){itemString = `id:15053 `; iCumRate +=20;} //0.437062937플랫칼라 원피스
					case(282){itemString = `id:15128 `; iCumRate +=20;} //0.437062937투 톤 비조 드레스
					case(283){itemString = `id:15136 `; iCumRate +=20;} //0.437062937모험가 슈트
					case(284){itemString = `id:16008 `; iCumRate +=20;} //0.437062937코레스 씨프 글러브
					case(285){itemString = `id:16019 `; iCumRate +=20;} //0.437062937줄무늬 팔목 장갑
					case(286){itemString = `id:16040 `; iCumRate +=20;} //0.437062937콜린 빅센 글러브
					case(287){itemString = `id:16505 `; iCumRate +=20;} //0.437062937플루트 건틀렛
					case(288){itemString = `id:16520 `; iCumRate +=20;} //0.437062937롱 레더 글러브
					case(289){itemString = `id:17040 `; iCumRate +=20;} //0.437062937엘라 스트랩 부츠
					case(290){itemString = `id:17041 `; iCumRate +=20;} //0.437062937덩굴무늬 헌팅부츠
					case(291){itemString = `id:17045 `; iCumRate +=20;} //0.437062937브이 넥 라인 레더 부츠
					case(292){itemString = `id:17071 `; iCumRate +=20;} //0.437062937니하이 부츠
					case(293){itemString = `id:17087 `; iCumRate +=20;} //0.437062937콜린 빅센 부츠
					case(294){itemString = `id:17506 `; iCumRate +=20;} //0.437062937롱그리브 부츠
					case(295){itemString = `id:17522 `; iCumRate +=20;} //0.437062937피르타 레더 부츠
					case(296){itemString = `id:18008 `; iCumRate +=20;} //0.437062937스트라이프 캡
					case(297){itemString = `id:18038 `; iCumRate +=20;} //0.437062937깃털 배렛 모자
					case(298){itemString = `id:18047 `; iCumRate +=20;} //0.437062937코레스 펠트 모자
					case(299){itemString = `id:18513 `; iCumRate +=20;} //0.437062937스파이크 캡
					case(300){itemString = `id:18515 `; iCumRate +=20;} //0.437062937트윈 혼 캡
					case(301){itemString = `id:18525 `; iCumRate +=20;} //0.437062937워터드롭 캡
					case(302){itemString = `id:18543 `; iCumRate +=20;} //0.437062937슬릿 풀 헬름
					case(303){itemString = `id:19020 `; iCumRate +=20;} //0.437062937나타네 설산용 코트
					case(304){itemString = `id:19029 `; iCumRate +=20;} //0.437062937자이언트 베어 로브
					case(305){itemString = `id:40015 `; iCumRate +=20;} //0.437062937플루트 숏 소드
					case(306){itemString = `id:40081 `; iCumRate +=20;} //0.437062937롱 보우
					case(307){itemString = `id:46001 `; iCumRate +=20;} //0.437062937라운드 실드
					case(308){itemString = `id:46006 `; iCumRate +=20;} //0.437062937카이트 실드
					case(309){itemString = `id:40172 `; iCumRate +=20;} //0.437062937그레이트 소드
					case(310){itemString = `id:40174 `; iCumRate +=20;} //0.437062937모닝스타
					case(311){itemString = `id:40177 `; iCumRate +=20;} //0.437062937워리어 액스
					case(312){itemString = `id:40180 `; iCumRate +=20;} //0.437062937홉네일 너클
					case(313){itemString = `id:40041 `; iCumRate +=20;} //0.437062937타격용 원드
					case(314){itemString = `id:16523 `; iCumRate +=20;} //0.437062937그레이스 건틀렛
					case(315){itemString = `id:17515 `; iCumRate +=20;} //0.437062937그레이스 그리브
					case(316){itemString = `id:18545 `; iCumRate +=20;} //0.437062937그레이스 헬멧
					case(317){itemString = `id:46007 `; iCumRate +=20;} //0.437062937헤테로 카이트 실드
					case(318){itemString = `id:46008 `; iCumRate +=20;} //0.437062937라이트 헤테로 카이트 실드
					case(319){itemString = `id:51003 count:10`; iCumRate +=25;} //0.546328671생명력 50 포션
					case(320){itemString = `id:51004 count:10`; iCumRate +=25;} //0.546328671생명력 100 포션
					case(321){itemString = `id:51008 count:10`; iCumRate +=25;} //0.546328671마나 50 포션
					case(322){itemString = `id:51014 count:10`; iCumRate +=25;} //0.546328671스태미나 100 포션
					case(323){itemString = `id:51029 count:10`; iCumRate +=25;} //0.546328671생명력과 스태미나 100 포션
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
					item newItem;
					newItem = player.AddItemEx(itemString, false);
					player.ShowTreasureboxOpenCut(newItem);
					bAncientTreasureChestGived = true;
					return;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			int jRandom = Random(6);		//유물 확률의 총합을 적는다
	
			DebugOut(`유물 줌`);
			// 한국의 추가 선물 유물 & 크리스탈 획득
			switch(jRandom)
			{
				case(0)		// 코끼리
				{
					player.DoStript(`additemex(id:85063 quality:99 appraise_explore_exp:9000 rewardview:true)`);
				}
				case(1)			// 해시계
				{
					player.DoStript(`additemex(id:85065 quality:99 appraise_explore_exp:11000 rewardview:true)`);
				}
				case(2)			// 드래곤
				{
					player.DoStript(`additemex(id:85064 quality:99 appraise_explore_exp:13000 rewardview:true)`);
				}
				case(3)		// 일반크리스탈
				{
					player.DoStript(`additemex(id:85060 rewardview:true)`);
				}
				case(4)			// 고급크리스탈
				{
					player.DoStript(`additemex(id:85061 rewardview:true)`);
				}
				case(5)			// 최고급크리스탈
				{
					player.DoStript(`additemex(id:85062 rewardview:true)`);
				}
				default
				{
					player.DoStript(`additemex(id:85065 quality:99 appraise_explore_exp:13000 rewardview:true)`);
				}
			}

			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(2491);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19083 `; iCumRate +=2;} //0.080289041개구리 로브
					case(1){itemString = `id:18575 `; iCumRate +=4;} //0.160578081플라워 코사주
					case(2){itemString = `id:40969 `; iCumRate +=4;} //0.160578081양산
					case(3){itemString = `id:40970 `; iCumRate +=4;} //0.160578081먼지떨이
					case(4){itemString = `id:40979 `; iCumRate +=4;} //0.160578081브론즈 미러 블레이드
					case(5){itemString = `id:18237 `; iCumRate +=2;} //0.080289041딕 스티치 마스크
					case(6){itemString = `id:13066 `; iCumRate +=3;} //0.120433561레미니아 성월의 갑옷 (저스팅 남성용)
					case(7){itemString = `id:13067`; iCumRate +=3;} //0.120433561레미니아 성월의 갑옷 (저스팅 여성용)
					case(8){itemString = `id:18287`; iCumRate +=4;} //0.160578081원숭이 탈
					case(9){itemString = `id:15117 suffix:31301`; iCumRate +=3;} //0.120433561남성용 마법사 정장
					case(10){itemString = `id:15116 suffix:31301`; iCumRate +=3;} //0.120433561여성용 마법사 정장
					case(11){itemString = `id:40345`; iCumRate +=2;} //0.080289041팔카타
					case(12){itemString = `id:40346`; iCumRate +=2;} //0.080289041하이랜더 클레이모어
					case(13){itemString = `id:40347`; iCumRate +=2;} //0.080289041하이랜더 롱 보우
					case(14){itemString = `id:40348`; iCumRate +=2;} //0.080289041프랑키스카
					case(15){itemString = `id:46027`; iCumRate +=2;} //0.080289041타지 실드
					case(16){itemString = `id:13038 `; iCumRate +=3;} //0.120433561더스틴 실버 나이트 아머
					case(17){itemString = `id:16524 `; iCumRate +=3;} //0.120433561더스틴 실버 나이트 뱀브레이스
					case(18){itemString = `id:17517 `; iCumRate +=3;} //0.120433561더스틴 실버 나이트 그리브
					case(19){itemString = `id:18548 `; iCumRate +=3;} //0.120433561더스틴 실버 나이트 헬름
					case(20){itemString = `id:15316 `; iCumRate +=3;} //0.120433561카리스 위자드 수트
					case(21){itemString = `id:17128 `; iCumRate +=3;} //0.120433561카리스 위자드 슈즈
					case(22){itemString = `id:13032 `; iCumRate +=3;} //0.120433561발렌시아 크로스 라인 플레이트 아머(여성용)
					case(23){itemString = `id:13033 `; iCumRate +=3;} //0.120433561발렌시아 크로스 라인 플레이트 아머(남성용)
					case(24){itemString = `id:16521 `; iCumRate +=3;} //0.120433561발렌시아 크로스 라인 플레이트 건틀렛
					case(25){itemString = `id:17514 `; iCumRate +=3;} //0.120433561발렌시아 크로스 라인 플레이트 부츠
					case(26){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=3;} //0.120433561클레이모어
					case(27){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=3;} //0.120433561레더 롱 보우
					case(28){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561힐링 원드
					case(29){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=3;} //0.120433561글라디우스
					case(30){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561라이트닝 원드
					case(31){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561아이스 원드
					case(32){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561파이어 원드
					case(33){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561타격용 원드
					case(34){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=3;} //0.120433561비펜니스
					case(35){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=3;} //0.120433561메이스
					case(36){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=3;} //0.120433561석궁
					case(37){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=3;} //0.120433561투 핸디드 소드
					case(38){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=3;} //0.120433561롱 보우
					case(39){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=3;} //0.120433561가디언 보우
					case(40){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=3;} //0.120433561헤테로 카이트 실드
					case(41){itemString = `id:18518 `; iCumRate +=15;} //0.602167804드래곤 크레스트
					case(42){itemString = `id:15113 `; iCumRate +=15;} //0.602167804여성용 검사학교 교복 쇼트타입
					case(43){itemString = `id:15114 `; iCumRate +=15;} //0.602167804남성용 검사학교 교복 롱타입
					case(44){itemString = `id:15065 `; iCumRate +=15;} //0.602167804엘라 베스트 스커트
					case(45){itemString = `id:19008 `; iCumRate +=15;} //0.602167804코코 판다 로브
					case(46){itemString = `id:15137 `; iCumRate +=15;} //0.602167804셀리나 하프 재킷 코트
					case(47){itemString = `id:18041 `; iCumRate +=15;} //0.602167804큰 챙 깃털 모자
					case(48){itemString = `id:19009 `; iCumRate +=15;} //0.602167804코코 래빗 로브
					case(49){itemString = `id:18112 `; iCumRate +=15;} //0.602167804해 분장 소품
					case(50){itemString = `id:15055 `; iCumRate +=15;} //0.602167804레더 미니 원피스
					case(51){itemString = `id:15057 `; iCumRate +=15;} //0.602167804롱 레더 코트 (무광)
					case(52){itemString = `id:16531 `; iCumRate +=15;} //0.602167804티오즈 건틀렛
					case(53){itemString = `id:17523 `; iCumRate +=15;} //0.602167804티오즈 그리브
					case(54){itemString = `id:15070 `; iCumRate +=15;} //0.602167804스탠드칼라 슬리브리스
					case(55){itemString = `id:15230 `; iCumRate +=15;} //0.602167804가르텐 글렌 체크 스커트
					case(56){itemString = `id:19034 `; iCumRate +=15;} //0.602167804가르텐 클로스 오버코트
					case(57){itemString = `id:40033 `; iCumRate +=15;} //0.602167804클레이모어
					case(58){itemString = `id:13043 `; iCumRate +=15;} //0.602167804레미니아 성월의 갑옷(남성용)
					case(59){itemString = `id:13044 `; iCumRate +=15;} //0.602167804레미니아 성월의 갑옷(여성용)
					case(60){itemString = `id:13045 `; iCumRate +=15;} //0.602167804아리쉬 아슈빈 아머(남성용)
					case(61){itemString = `id:13046 `; iCumRate +=15;} //0.602167804아리쉬 아슈빈 아머(여성용)
					case(62){itemString = `id:14019 `; iCumRate +=15;} //0.602167804그레이스 플레이트 아머
					case(63){itemString = `id:13031 `; iCumRate +=15;} //0.602167804스파이카 실버 플레이트 아머
					case(64){itemString = `id:13022 `; iCumRate +=15;} //0.602167804로즈 플레이트 아머 (P타입)
					case(65){itemString = `id:18542 `; iCumRate +=15;} //0.602167804빅 체인 풀 헬름
					case(66){itemString = `id:18506 `; iCumRate +=15;} //0.602167804윙 하프 헬름
					case(67){itemString = `id:14042 `; iCumRate +=15;} //0.602167804컬스틴 레더 아머
					case(68){itemString = `id:18045 `; iCumRate +=15;} //0.602167804별장식 마법사 모자
					case(69){itemString = `id:13010 `; iCumRate +=15;} //0.602167804라운드 폴드론 체인메일
					case(70){itemString = `id:14025 `; iCumRate +=15;} //0.602167804카멜 스피리트 아머(남성용)
					case(71){itemString = `id:14026 `; iCumRate +=15;} //0.602167804카멜 스피리트 아머(여성용)
					case(72){itemString = `id:16028 `; iCumRate +=15;} //0.602167804카멜 스피리트 글러브
					case(73){itemString = `id:16511 `; iCumRate +=15;} //0.602167804실버 티니 글러브
					case(74){itemString = `id:17064 `; iCumRate +=15;} //0.602167804카멜 스피리트 부츠
					case(75){itemString = `id:16534 `; iCumRate +=15;} //0.602167804컬스틴 레더 건틀렛
					case(76){itemString = `id:17524 `; iCumRate +=15;} //0.602167804컬스틴 레더 부츠
					case(77){itemString = `id:13047 `; iCumRate +=15;} //0.602167804키리누스진 하프 플레이트 아머(남성용)
					case(78){itemString = `id:13048 `; iCumRate +=15;} //0.602167804키리누스진 하프 플레이트 아머(여성용)
					case(79){itemString = `id:14038 `; iCumRate +=15;} //0.602167804피르타 레더 아머 B타입(여성용)
					case(80){itemString = `id:18111 `; iCumRate +=15;} //0.602167804나무 분장 소품
					case(81){itemString = `id:18110 `; iCumRate +=15;} //0.602167804덤불 분장 소품
					case(82){itemString = `id:18109 `; iCumRate +=15;} //0.602167804나오 분장 소품
					case(83){itemString = `id:18108 `; iCumRate +=15;} //0.602167804바위 분장 소품
					case(84){itemString = `id:40083 `; iCumRate +=15;} //0.602167804훅 커틀러스
					case(85){itemString = `id:40032 `; iCumRate +=15;} //0.602167804가고일 소드
					case(86){itemString = `id:18544 `; iCumRate +=15;} //0.602167804펠리칸 프로텍터
					case(87){itemString = `id:18547 `; iCumRate +=15;} //0.602167804파나쉬 헤드 프로텍터
					case(88){itemString = `id:18521 `; iCumRate +=15;} //0.602167804유러피안 컴프
					case(89){itemString = `id:18500 `; iCumRate +=15;} //0.602167804링 메일 헬름
					case(90){itemString = `id:18511 `; iCumRate +=15;} //0.602167804플루트 풀 헬름
					case(91){itemString = `id:18502 `; iCumRate +=15;} //0.602167804본 헬름
					case(92){itemString = `id:19007 `; iCumRate +=15;} //0.602167804야광 머플러 로브
					case(93){itemString = `id:19017 `; iCumRate +=15;} //0.602167804늑대 로브
					case(94){itemString = `id:19016 `; iCumRate +=15;} //0.602167804곰 로브
					case(95){itemString = `id:15112 `; iCumRate +=15;} //0.602167804셀리나 스쿨보이룩
					case(96){itemString = `id:18034 `; iCumRate +=15;} //0.602167804볼륨 베레모
					case(97){itemString = `id:18006 `; iCumRate +=15;} //0.602167804마법사모자
					case(98){itemString = `id:18113 `; iCumRate +=15;} //0.602167804뾰족귀 고양이 모자
					case(99){itemString = `id:18114 `; iCumRate +=15;} //0.602167804줄무늬 고양이 모자
					case(100){itemString = `id:18115 `; iCumRate +=15;} //0.602167804핀 고양이 모자
					case(101){itemString = `id:18097 `; iCumRate +=15;} //0.602167804세이렌 깃털 가면
					case(102){itemString = `id:18098 `; iCumRate +=15;} //0.602167804세이렌의 안경
					case(103){itemString = `id:18099 `; iCumRate +=15;} //0.602167804세이렌 작은 날개 가면
					case(104){itemString = `id:18100 `; iCumRate +=15;} //0.602167804세이렌 날개 가면
					case(105){itemString = `id:18101 `; iCumRate +=15;} //0.602167804세이렌 박쥐 날개 가면
					case(106){itemString = `id:18102 `; iCumRate +=15;} //0.602167804세이렌의 가면
					case(107){itemString = `id:18096 `; iCumRate +=15;} //0.602167804세이렌 고양이 가면
					case(108){itemString = `id:18044 `; iCumRate +=15;} //0.602167804범죄용 복면
					case(109){itemString = `id:51002 count:5`; iCumRate +=50;} //2.007226014생명력 30 포션
					case(110){itemString = `id:51007 count:5`; iCumRate +=50;} //2.007226014마나 30 포션
					case(111){itemString = `id:51012 count:5`; iCumRate +=50;} //2.007226014스태미나 30 포션
					case(112){itemString = `id:51003 count:5`; iCumRate +=50;} //2.007226014생명력 50 포션
					case(113){itemString = `id:51008 count:5`; iCumRate +=50;} //2.007226014마나 50 포션
					case(114){itemString = `id:51013 count:5`; iCumRate +=50;} //2.007226014스태미나 50 포션
					case(115){itemString = `id:51004 count:3`; iCumRate +=50;} //2.007226014생명력 100 포션
					case(116){itemString = `id:51009 count:3`; iCumRate +=50;} //2.007226014마나 100 포션
					case(117){itemString = `id:51014 count:3`; iCumRate +=50;} //2.007226014스태미나 100 포션
					case(118){itemString = `id:51005 `; iCumRate +=50;} //2.007226014생명력 300 포션
					case(119){itemString = `id:51010 `; iCumRate +=50;} //2.007226014마나 300 포션
					case(120){itemString = `id:51015 `; iCumRate +=50;} //2.007226014스태미나 300 포션
					case(121){itemString = `id:51022 count:5`; iCumRate +=50;} //2.007226014생명력과 마나 30 포션
					case(122){itemString = `id:51023 count:5`; iCumRate +=50;} //2.007226014생명력과 마나 50 포션
					case(123){itemString = `id:51024 count:3`; iCumRate +=50;} //2.007226014생명력과 마나 100 포션
					case(124){itemString = `id:51025 `; iCumRate +=50;} //2.007226014생명력과 마나 300 포션
					case(125){itemString = `id:51027 count:5`; iCumRate +=50;} //2.007226014생명력과 스태미나 30 포션
					case(126){itemString = `id:51028 count:5`; iCumRate +=50;} //2.007226014생명력과 스태미나 50 포션
					case(127){itemString = `id:51029 count:3`; iCumRate +=50;} //2.007226014생명력과 스태미나 100 포션
					case(128){itemString = `id:51030 `; iCumRate +=50;} //2.007226014생명력과 스태미나 300 포션
					case(129){itemString = `id:63016 count:5`; iCumRate +=50;} //2.007226014축복의 포션
					case(130){itemString = `id:63225 count:3`; iCumRate +=50;} //2.007226014성화
					case(131){itemString = `id:51046`; iCumRate +=50;} //2.007226014호감도 포션
					case(132){itemString = `id:51101 count:10`; iCumRate +=50;} //2.007226014블러디 허브
					case(133){itemString = `id:51102 count:10`; iCumRate +=50;} //2.007226014마나 허브
					case(134){itemString = `id:51103 count:10`; iCumRate +=50;} //2.007226014선라이트 허브
					case(135){itemString = `id:51107 count:10`; iCumRate +=50;} //2.007226014화이트 허브


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
					item newItem;
					newItem = player.AddItemEx(itemString, false);
					player.ShowTreasureboxOpenCut(newItem);
					bAncientTreasureChestGived = true;
					return;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}

		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3809);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:15352 `; iCumRate +=1;} //0.02625361천룡지의(남성용)
					case(1){itemString = `id:15353 `; iCumRate +=1;} //0.02625361천룡지의(여성용)
					case(2){itemString = `id:17139 `; iCumRate +=1;} //0.02625361천룡지화
					case(3){itemString = `id:15269 `; iCumRate +=1;} //0.02625361항아의 날개옷 
					case(4){itemString = `id:46027 `; iCumRate +=1;} //0.02625361타지 실드
					case(5){itemString = `id:15602 `; iCumRate +=1;} //0.02625361레이모어 의상
					case(6){itemString = `id:17236 `; iCumRate +=1;} //0.02625361레이모어 신발
					case(7){itemString = `id:15601 `; iCumRate +=1;} //0.02625361케이 의상
					case(8){itemString = `id:17235 `; iCumRate +=1;} //0.02625361케이 신발
					case(9){itemString = `id:15420 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 수트(여)
					case(10){itemString = `id:15419 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 수트(남)
					case(11){itemString = `id:18248 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 모자
					case(12){itemString = `id:18249 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 헤어밴드
					case(13){itemString = `id:17163 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 부츠
					case(14){itemString = `id:17162 `; iCumRate +=1;} //0.02625361에메랄드 켈틱 패턴 신발
					case(15){itemString = `id:18569 `; iCumRate +=1;} //0.02625361devCAT 모자
					case(16){itemString = `id:18237 `; iCumRate +=1;} //0.02625361딕 스티치 마스크
					case(17){itemString = `id:40250 `; iCumRate +=1;} //0.02625361메탈 파이어 원드
					case(18){itemString = `id:40171 `; iCumRate +=1;} //0.02625361마사무네
					case(19){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361더스틴 실버 나이트 아머
					case(20){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361더스틴 실버 나이트 뱀브레이스
					case(21){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361더스틴 실버 나이트 그리브
					case(22){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361발렌시아 크로스 라인 플레이트 아머(여성용)
					case(23){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361발렌시아 크로스 라인 플레이트 아머(남성용)
					case(24){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(25){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361발렌시아 크로스 라인 플레이트 건틀렛
					case(26){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.02625361발렌시아 크로스 라인 플레이트 부츠
					case(27){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.02625361냄비(심해의)
					case(28){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.02625361남성용 마법사 정장
					case(29){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.02625361여성용 마법사 정장
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.02625361아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.02625361볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.02625361그레이스 숄 드레스(여성용)
					case(33){itemString = `id:16046 `; iCumRate +=1;} //0.02625361고양이 손 장갑
					case(34){itemString = `id:18187 `; iCumRate +=1;} //0.02625361커다란 리본
					case(35){itemString = `id:18188 `; iCumRate +=1;} //0.02625361안대
					case(36){itemString = `id:18189 `; iCumRate +=1;} //0.02625361카우보이 모자
					case(37){itemString = `id:15252 `; iCumRate +=1;} //0.02625361집사 의상
					case(38){itemString = `id:19005 `; iCumRate +=1;} //0.02625361머플러 로브
					case(39){itemString = `id:18161 `; iCumRate +=1;} //0.02625361데브캣 귀마개
					case(40){itemString = `id:18157 `; iCumRate +=1;} //0.02625361고양이 귀 머리띠
					case(41){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=2;} //0.05250722레더 롱 보우
					case(42){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.05250722글라디우스
					case(43){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=2;} //0.05250722라이트닝 원드
					case(44){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.05250722메이스
					case(45){itemString = `id:15267 `; iCumRate +=2;} //0.05250722테라 고딕 풀 드레스
					case(46){itemString = `id:15268 `; iCumRate +=2;} //0.05250722테라 고딕 펑크 수트
					case(47){itemString = `id:19005 `; iCumRate +=2;} //0.05250722머플러 로브
					case(48){itemString = `id:15217 `; iCumRate +=2;} //0.05250722에이프런 원피스
					case(49){itemString = `id:18161 `; iCumRate +=2;} //0.05250722데브캣 귀마개
					case(50){itemString = `id:18157 `; iCumRate +=2;} //0.05250722고양이 귀 머리띠
					case(51){itemString = `id:15233 `; iCumRate +=2;} //0.05250722엘레건트 고딕 드레스
					case(52){itemString = `id:15234 `; iCumRate +=2;} //0.05250722엘레건트 고딕 슈트
					case(53){itemString = `id:15235 `; iCumRate +=2;} //0.05250722엘레건트 고딕 드레스
					case(54){itemString = `id:15233 `; iCumRate +=2;} //0.05250722엘레건트 고딕 드레스
					case(55){itemString = `id:15234 `; iCumRate +=2;} //0.05250722엘레건트 고딕 슈트
					case(56){itemString = `id:15235 `; iCumRate +=2;} //0.05250722엘레건트 고딕 드레스
					case(57){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=3;} //0.07876083드래곤 블레이드
					case(58){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=3;} //0.07876083클레이모어
					case(59){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=3;} //0.07876083힐링 원드
					case(60){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=3;} //0.07876083아이스 원드
					case(61){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=3;} //0.07876083파이어 원드
					case(62){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=3;} //0.07876083타격용 원드
					case(63){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=3;} //0.07876083비펜니스
					case(64){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=3;} //0.07876083석궁
					case(65){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=3;} //0.07876083투 핸디드 소드
					case(66){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=3;} //0.07876083롱 보우
					case(67){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=3;} //0.07876083가디언 보우
					case(68){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=3;} //0.07876083헤테로 카이트 실드
					case(69){itemString = `id:40170 `; iCumRate +=5;} //0.131268049일본식 양손검
					case(70){itemString = `id:62005 suffix:30515`; iCumRate +=15;} //0.393804148해적의
					case(71){itemString = `id:62005 prefix:20505`; iCumRate +=15;} //0.393804148리자드
					case(72){itemString = `id:62005 prefix:21007`; iCumRate +=15;} //0.393804148히스
					case(73){itemString = `id:62005 prefix:20625`; iCumRate +=15;} //0.393804148금속 바늘
					case(74){itemString = `id:62005 suffix:30624`; iCumRate +=15;} //0.393804148산사나무
					case(75){itemString = `id:62005 prefix:20721`; iCumRate +=15;} //0.393804148한가한
					case(76){itemString = `id:62005 suffix:30918`; iCumRate +=15;} //0.393804148마나 위자드|마나 위자드(suffix)
					case(77){itemString = `id:62005 suffix:30632`; iCumRate +=15;} //0.393804148버스트 나이트|버스트 나이트(suffix)
					case(78){itemString = `id:62005 suffix:30525`; iCumRate +=15;} //0.393804148마나 서머너|마나 서머너(suffix)
					case(79){itemString = `id:62005 suffix:30418`; iCumRate +=15;} //0.393804148포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(80){itemString = `id:18518 `; iCumRate +=20;} //0.525072197드래곤 크레스트
					case(81){itemString = `id:15113 `; iCumRate +=20;} //0.525072197여성용 검사학교 교복 쇼트타입
					case(82){itemString = `id:15114 `; iCumRate +=20;} //0.525072197남성용 검사학교 교복 롱타입
					case(83){itemString = `id:15065 `; iCumRate +=20;} //0.525072197엘라 베스트 스커트
					case(84){itemString = `id:19008 `; iCumRate +=20;} //0.525072197코코 판다 로브
					case(85){itemString = `id:15137 `; iCumRate +=20;} //0.525072197셀리나 하프 재킷 코트
					case(86){itemString = `id:18041 `; iCumRate +=20;} //0.525072197큰 챙 깃털 모자
					case(87){itemString = `id:19009 `; iCumRate +=20;} //0.525072197코코 래빗 로브
					case(88){itemString = `id:18112 `; iCumRate +=20;} //0.525072197해 분장 소품
					case(89){itemString = `id:18111 `; iCumRate +=20;} //0.525072197나무 분장 소품
					case(90){itemString = `id:18110 `; iCumRate +=20;} //0.525072197덤불 분장 소품
					case(91){itemString = `id:18109 `; iCumRate +=20;} //0.525072197나오 분장 소품
					case(92){itemString = `id:18108 `; iCumRate +=20;} //0.525072197바위 분장 소품
					case(93){itemString = `id:40083 `; iCumRate +=20;} //0.525072197훅 커틀러스
					case(94){itemString = `id:40032 `; iCumRate +=20;} //0.525072197가고일 소드
					case(95){itemString = `id:18544 `; iCumRate +=20;} //0.525072197펠리칸 프로텍터
					case(96){itemString = `id:18547 `; iCumRate +=20;} //0.525072197파나쉬 헤드 프로텍터
					case(97){itemString = `id:18521 `; iCumRate +=20;} //0.525072197유러피안 컴프
					case(98){itemString = `id:18500 `; iCumRate +=20;} //0.525072197링 메일 헬름
					case(99){itemString = `id:18511 `; iCumRate +=20;} //0.525072197플루트 풀 헬름
					case(100){itemString = `id:18502 `; iCumRate +=20;} //0.525072197본 헬름
					case(101){itemString = `id:19007 `; iCumRate +=20;} //0.525072197야광 머플러 로브
					case(102){itemString = `id:19017 `; iCumRate +=20;} //0.525072197늑대 로브
					case(103){itemString = `id:19016 `; iCumRate +=20;} //0.525072197곰 로브
					case(104){itemString = `id:15112 `; iCumRate +=20;} //0.525072197셀리나 스쿨보이룩
					case(105){itemString = `id:18034 `; iCumRate +=20;} //0.525072197볼륨 베레모
					case(106){itemString = `id:18006 `; iCumRate +=20;} //0.525072197마법사모자
					case(107){itemString = `id:18113 `; iCumRate +=20;} //0.525072197뾰족귀 고양이 모자
					case(108){itemString = `id:18114 `; iCumRate +=20;} //0.525072197줄무늬 고양이 모자
					case(109){itemString = `id:18115 `; iCumRate +=20;} //0.525072197핀 고양이 모자
					case(110){itemString = `id:18097 `; iCumRate +=20;} //0.525072197세이렌 깃털 가면
					case(111){itemString = `id:18098 `; iCumRate +=20;} //0.525072197세이렌의 안경
					case(112){itemString = `id:18099 `; iCumRate +=20;} //0.525072197세이렌 작은 날개 가면
					case(113){itemString = `id:18100 `; iCumRate +=20;} //0.525072197세이렌 날개 가면
					case(114){itemString = `id:18101`; iCumRate +=20;} //0.525072197세이렌 박쥐 날개 가면
					case(115){itemString = `id:18102 `; iCumRate +=20;} //0.525072197세이렌의 가면
					case(116){itemString = `id:15055 `; iCumRate +=20;} //0.525072197세이렌 고양이 가면
					case(117){itemString = `id:18044 `; iCumRate +=20;} //0.525072197범죄용 복면
					case(118){itemString = `id:40071 `; iCumRate +=20;} //0.525072197'라' 음 빈 병
					case(119){itemString = `id:40072 `; iCumRate +=20;} //0.525072197'시' 음 빈 병
					case(120){itemString = `id:40073 `; iCumRate +=20;} //0.525072197'도' 음 빈 병
					case(121){itemString = `id:40074 `; iCumRate +=20;} //0.525072197'레' 음 빈 병
					case(122){itemString = `id:40075 `; iCumRate +=20;} //0.525072197'미' 음 빈 병
					case(123){itemString = `id:40076 `; iCumRate +=20;} //0.525072197'파' 음 빈 병
					case(124){itemString = `id:40077 `; iCumRate +=20;} //0.525072197'솔' 음 빈 병
					case(125){itemString = `id:16517 `; iCumRate +=20;} //0.525072197반대 장갑
					case(126){itemString = `id:16516 `; iCumRate +=20;} //0.525072197찬성 장갑
					case(127){itemString = `id:16515 `; iCumRate +=20;} //0.525072197보 장갑
					case(128){itemString = `id:16514 `; iCumRate +=20;} //0.525072197바위 장갑
					case(129){itemString = `id:16513 `; iCumRate +=20;} //0.525072197가위 장갑
					case(130){itemString = `id:40068 `; iCumRate +=20;} //0.525072197가위 모양 지시봉
					case(131){itemString = `id:40069 `; iCumRate +=20;} //0.525072197바위 모양 지시봉
					case(132){itemString = `id:40070 `; iCumRate +=20;} //0.525072197보 모양 지시봉
					case(133){itemString = `id:17015 `; iCumRate +=20;} //0.525072197Combat Shoes
					case(134){itemString = `id:15055 `; iCumRate +=20;} //0.525072197레더 미니 원피스
					case(135){itemString = `id:15057 `; iCumRate +=20;} //0.525072197롱 레더 코트 (무광)
					case(136){itemString = `id:18040 `; iCumRate +=20;} //0.525072197코레스 꼭지 베레모
					case(137){itemString = `id:80000 `; iCumRate +=20;} //0.525072197나오의 검은 옷
					case(138){itemString = `id:80001 `; iCumRate +=20;} //0.525072197루아의 옷
					case(139){itemString = `id:80002 `; iCumRate +=20;} //0.525072197핑크색 코트
					case(140){itemString = `id:80003 `; iCumRate +=20;} //0.525072197검은색 코트
					case(141){itemString = `id:80004 `; iCumRate +=20;} //0.525072197나오의 노란색 봄 옷
					case(142){itemString = `id:80005 `; iCumRate +=20;} //0.525072197나오의 하얀색 봄 옷
					case(143){itemString = `id:80006 `; iCumRate +=20;} //0.525072197나오의 핑크색 봄 옷
					case(144){itemString = `id:14036 `; iCumRate +=20;} //0.525072197티오즈 아머(남성용)
					case(145){itemString = `id:14037 `; iCumRate +=20;} //0.525072197티오즈 아머(여성용)
					case(146){itemString = `id:16531 `; iCumRate +=20;} //0.525072197티오즈 건틀렛
					case(147){itemString = `id:17523 `; iCumRate +=20;} //0.525072197티오즈 그리브
					case(148){itemString = `id:15132 `; iCumRate +=20;} //0.525072197내추럴 베스트 웨어
					case(149){itemString = `id:15070 `; iCumRate +=20;} //0.525072197스탠드칼라 슬리브리스
					case(150){itemString = `id:15230 `; iCumRate +=20;} //0.525072197가르텐 글렌 체크 스커트
					case(151){itemString = `id:19034 `; iCumRate +=20;} //0.525072197가르텐 클로스 오버코트
					case(152){itemString = `id:40033 `; iCumRate +=20;} //0.525072197클레이모어
					case(153){itemString = `id:40011 `; iCumRate +=20;} //0.525072197브로드 소드
					case(154){itemString = `id:40030 `; iCumRate +=20;} //0.525072197투 핸디드 소드
					case(155){itemString = `id:40012 `; iCumRate +=20;} //0.525072197바스타드 소드
					case(156){itemString = `id:40007 `; iCumRate +=20;} //0.525072197한손도끼
					case(157){itemString = `id:40014 `; iCumRate +=20;} //0.525072197콤포짓 보우
					case(158){itemString = `id:40078 `; iCumRate +=20;} //0.525072197비펜니스
					case(159){itemString = `id:40080 `; iCumRate +=20;} //0.525072197글라디우스
					case(160){itemString = `id:40006 `; iCumRate +=20;} //0.525072197단검
					case(161){itemString = `id:40031 `; iCumRate +=20;} //0.525072197석궁
					case(162){itemString = `id:40081 `; iCumRate +=20;} //0.525072197레더 롱 보우
					case(163){itemString = `id:40079 `; iCumRate +=20;} //0.525072197메이스
					case(164){itemString = `id:13043 `; iCumRate +=20;} //0.525072197레미니아 성월의 갑옷(남성용)
					case(165){itemString = `id:13044 `; iCumRate +=20;} //0.525072197레미니아 성월의 갑옷(여성용)
					case(166){itemString = `id:13045 `; iCumRate +=20;} //0.525072197아리쉬 아슈빈 아머(남성용)
					case(167){itemString = `id:13046 `; iCumRate +=20;} //0.525072197아리쉬 아슈빈 아머(여성용)
					case(168){itemString = `id:14019 `; iCumRate +=20;} //0.525072197그레이스 플레이트 아머
					case(169){itemString = `id:13031 `; iCumRate +=20;} //0.525072197스파이카 실버 플레이트 아머
					case(170){itemString = `id:13022 `; iCumRate +=20;} //0.525072197로즈 플레이트 아머 (P타입)
					case(171){itemString = `id:40039 `; iCumRate +=20;} //0.525072197아이스 원드
					case(172){itemString = `id:40090 `; iCumRate +=20;} //0.525072197힐링 원드
					case(173){itemString = `id:40040 `; iCumRate +=20;} //0.525072197파이어 원드
					case(174){itemString = `id:40038 `; iCumRate +=20;} //0.525072197라이트닝 원드
					case(175){itemString = `id:18542 `; iCumRate +=20;} //0.525072197빅 체인 풀 헬름
					case(176){itemString = `id:18506 `; iCumRate +=20;} //0.525072197윙 하프 헬름
					case(177){itemString = `id:14042 `; iCumRate +=20;} //0.525072197컬스틴 레더 아머
					case(178){itemString = `id:15155 `; iCumRate +=20;} //0.525072197이디카이 성직자 예복(남성용)
					case(179){itemString = `id:15156 `; iCumRate +=20;} //0.525072197이디카이 성직자 예복(여성용)
					case(180){itemString = `id:15151 `; iCumRate +=20;} //0.525072197뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(181){itemString = `id:15152 `; iCumRate +=20;} //0.525072197뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(182){itemString = `id:15153 `; iCumRate +=20;} //0.525072197산드라 스나이퍼 수트(남성용)
					case(183){itemString = `id:15154 `; iCumRate +=20;} //0.525072197산드라 스나이퍼 수트(여성용)
					case(184){itemString = `id:15157 `; iCumRate +=20;} //0.525072197위스 보위군 의복(남성용)
					case(185){itemString = `id:15158 `; iCumRate +=20;} //0.525072197위스 보위군 의복(여성용)
					case(186){itemString = `id:15115 `; iCumRate +=20;} //0.525072197재기드 미니 스커트
					case(187){itemString = `id:15059 `; iCumRate +=20;} //0.525072197터크스 탱크탑 반바지
					case(188){itemString = `id:15070 `; iCumRate +=20;} //0.525072197아이돌 리본 드레스
					case(189){itemString = `id:15074 `; iCumRate +=20;} //0.525072197루이스 성직자 코트
					case(190){itemString = `id:15061 `; iCumRate +=20;} //0.525072197물결무늬 옆트임 튜닉
					case(191){itemString = `id:18045 `; iCumRate +=20;} //0.525072197별장식 마법사 모자
					case(192){itemString = `id:18019 `; iCumRate +=20;} //0.525072197리리나 깃털모자
					case(193){itemString = `id:18020 `; iCumRate +=20;} //0.525072197몬거 깃털모자
					case(194){itemString = `id:18029 `; iCumRate +=20;} //0.525072197나무테 안경
					case(195){itemString = `id:18028 `; iCumRate +=20;} //0.525072197접이식 안경
					case(196){itemString = `id:13010 `; iCumRate +=20;} //0.525072197라운드 폴드론 체인메일
					case(197){itemString = `id:14025 `; iCumRate +=20;} //0.525072197카멜 스피리트 아머(남성용)
					case(198){itemString = `id:14026 `; iCumRate +=20;} //0.525072197카멜 스피리트 아머(여성용)
					case(199){itemString = `id:16028 `; iCumRate +=20;} //0.525072197카멜 스피리트 글러브
					case(200){itemString = `id:17064 `; iCumRate +=20;} //0.525072197카멜 스피리트 부츠
					case(201){itemString = `id:15131 `; iCumRate +=20;} //0.525072197핀 에이프런 스커트
					case(202){itemString = `id:2006 `; iCumRate +=20;} //0.525072197큰 금화 주머니
					case(203){itemString = `id:16534 `; iCumRate +=20;} //0.525072197컬스틴 레더 건틀렛
					case(204){itemString = `id:17524 `; iCumRate +=20;} //0.525072197컬스틴 레더 부츠
					case(205){itemString = `id:13047 `; iCumRate +=20;} //0.525072197키리누스진 하프 플레이트 아머(남성용)
					case(206){itemString = `id:13048 `; iCumRate +=20;} //0.525072197키리누스진 하프 플레이트 아머(여성용)
					case(207){itemString = `id:14013 `; iCumRate +=20;} //0.525072197로리카 세그먼타타에
					case(208){itemString = `id:14035 `; iCumRate +=20;} //0.525072197피르타 레더 아머
					case(209){itemString = `id:14038 `; iCumRate +=20;} //0.525072197피르타 레더 아머 B타입(여성용)
					case(210){itemString = `id:15028 `; iCumRate +=20;} //0.525072197코레스 씨프슈트
					case(211){itemString = `id:15042 `; iCumRate +=20;} //0.525072197롱넥 원피스
					case(212){itemString = `id:15052 `; iCumRate +=20;} //0.525072197터크스 투톤 튜닉
					case(213){itemString = `id:15053 `; iCumRate +=20;} //0.525072197플랫칼라 원피스
					case(214){itemString = `id:15128 `; iCumRate +=20;} //0.525072197투 톤 비조 드레스
					case(215){itemString = `id:15136 `; iCumRate +=20;} //0.525072197모험가 슈트
					case(216){itemString = `id:16008 `; iCumRate +=20;} //0.525072197코레스 씨프 글러브
					case(217){itemString = `id:16019 `; iCumRate +=20;} //0.525072197줄무늬 팔목 장갑
					case(218){itemString = `id:16040 `; iCumRate +=20;} //0.525072197콜린 빅센 글러브
					case(219){itemString = `id:16505 `; iCumRate +=20;} //0.525072197플루트 건틀렛
					case(220){itemString = `id:16520 `; iCumRate +=20;} //0.525072197롱 레더 글러브
					case(221){itemString = `id:17040 `; iCumRate +=20;} //0.525072197엘라 스트랩 부츠
					case(222){itemString = `id:17041 `; iCumRate +=20;} //0.525072197덩굴무늬 헌팅부츠
					case(223){itemString = `id:17045 `; iCumRate +=20;} //0.525072197브이 넥 라인 레더 부츠
					case(224){itemString = `id:17071 `; iCumRate +=20;} //0.525072197니하이 부츠
					case(225){itemString = `id:17087 `; iCumRate +=20;} //0.525072197콜린 빅센 부츠
					case(226){itemString = `id:17506 `; iCumRate +=20;} //0.525072197롱그리브 부츠
					case(227){itemString = `id:17522 `; iCumRate +=20;} //0.525072197피르타 레더 부츠
					case(228){itemString = `id:18008 `; iCumRate +=20;} //0.525072197스트라이프 캡
					case(229){itemString = `id:18038 `; iCumRate +=20;} //0.525072197깃털 배렛 모자
					case(230){itemString = `id:18047 `; iCumRate +=20;} //0.525072197코레스 펠트 모자
					case(231){itemString = `id:18513 `; iCumRate +=20;} //0.525072197스파이크 캡
					case(232){itemString = `id:18515 `; iCumRate +=20;} //0.525072197트윈 혼 캡
					case(233){itemString = `id:18525 `; iCumRate +=20;} //0.525072197워터드롭 캡
					case(234){itemString = `id:18543 `; iCumRate +=20;} //0.525072197슬릿 풀 헬름
					case(235){itemString = `id:19020 `; iCumRate +=20;} //0.525072197나타네 설산용 코트
					case(236){itemString = `id:19029 `; iCumRate +=20;} //0.525072197자이언트 베어 로브
					case(237){itemString = `id:40015 `; iCumRate +=20;} //0.525072197플루트 숏 소드
					case(238){itemString = `id:40081 `; iCumRate +=20;} //0.525072197롱 보우
					case(239){itemString = `id:46001 `; iCumRate +=20;} //0.525072197라운드 실드
					case(240){itemString = `id:46006 `; iCumRate +=20;} //0.525072197카이트 실드
					case(241){itemString = `id:40172 `; iCumRate +=20;} //0.525072197그레이트 소드
					case(242){itemString = `id:40174 `; iCumRate +=20;} //0.525072197모닝스타
					case(243){itemString = `id:40177 `; iCumRate +=20;} //0.525072197워리어 액스
					case(244){itemString = `id:40180 `; iCumRate +=20;} //0.525072197홉네일 너클
					case(245){itemString = `id:40041 `; iCumRate +=20;} //0.525072197타격용 원드
					case(246){itemString = `id:16523 `; iCumRate +=20;} //0.525072197그레이스 건틀렛
					case(247){itemString = `id:17515 `; iCumRate +=20;} //0.525072197그레이스 그리브
					case(248){itemString = `id:18545 `; iCumRate +=20;} //0.525072197그레이스 헬멧
					case(249){itemString = `id:46007 `; iCumRate +=20;} //0.525072197헤테로 카이트 실드
					case(250){itemString = `id:46008 `; iCumRate +=20;} //0.525072197라이트 헤테로 카이트 실드
					case(251){itemString = `id:51003 count:10`; iCumRate +=25;} //0.656340247생명력 50 포션
					case(252){itemString = `id:51004 count:10`; iCumRate +=25;} //0.656340247생명력 100 포션
					case(253){itemString = `id:51008 count:10`; iCumRate +=25;} //0.656340247마나 50 포션
					case(254){itemString = `id:51014 count:10`; iCumRate +=25;} //0.656340247스태미나 100 포션
					case(255){itemString = `id:51029 count:10`; iCumRate +=25;} //0.656340247생명력과 스태미나 100 포션
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
					item newItem;
					newItem = player.AddItemEx(itemString, false);
					player.ShowTreasureboxOpenCut(newItem);
					bAncientTreasureChestGived = true;
					return;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
	}
		// 캐시 가차폰을 못받았다.
	if (!bAncientTreasureChestGived)
	{
//		GivePremiumGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40024)`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server string TreasureDropEffectItem(
	character player,
	item cItem)
// : 보물상자를 그냥 드랍했을 때 유저에게 보여줄 아이템을 리턴하는 함수
////////////////////////////////////////////////////////////////////////////////
{
	int itemID = cItem.GetClassId();

	bool bAncientTreasureChestGived = false;
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(838);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:40345 `; iCumRate +=1;} //0.119331742팔카타
					case(1){itemString = `id:40346 `; iCumRate +=1;} //0.119331742하이랜더 클레이 모어
					case(2){itemString = `id:40347 `; iCumRate +=1;} //0.119331742하이랜더 롱 보우
					case(3){itemString = `id:40348 `; iCumRate +=1;} //0.119331742프랑키스카
					case(4){itemString = `id:46027 `; iCumRate +=1;} //0.119331742타지 실드
					case(5){itemString = `id:15602 `; iCumRate +=1;} //0.119331742레이모어 의상
					case(6){itemString = `id:17236 `; iCumRate +=1;} //0.119331742레이모어 신발
					case(7){itemString = `id:15601 `; iCumRate +=1;} //0.119331742케이 의상
					case(8){itemString = `id:17235 `; iCumRate +=1;} //0.119331742케이 신발
					case(9){itemString = `id:15420 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 수트(여)
					case(10){itemString = `id:15419 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 수트(남)
					case(11){itemString = `id:18248 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 모자
					case(12){itemString = `id:18249 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 헤어밴드
					case(13){itemString = `id:17163 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 부츠
					case(14){itemString = `id:17162 `; iCumRate +=1;} //0.119331742에메랄드 켈틱 패턴 신발
					case(15){itemString = `id:19059 `; iCumRate +=1;} //0.119331742나쿠루 드래곤 문양 마법사 로브(여)
					case(16){itemString = `id:19058 `; iCumRate +=1;} //0.119331742나쿠루 드래곤 문양 마법사 로브(남)
					case(17){itemString = `id:18569 `; iCumRate +=1;} //0.119331742devCAT 모자
					case(18){itemString = `id:18237 `; iCumRate +=1;} //0.119331742딕 스티치 마스크
					case(19){itemString = `id:40250 `; iCumRate +=1;} //0.119331742메탈 파이어 원드
					case(20){itemString = `id:40171 `; iCumRate +=1;} //0.119331742마사무네
					case(21){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 아머
					case(22){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 뱀브레이스
					case(23){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 그리브
					case(24){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(여성용)
					case(25){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(남성용)
					case(26){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(27){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 건틀렛
					case(28){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 부츠
					case(29){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.119331742냄비(심해의)
					case(30){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.119331742남성용 마법사 정장
					case(31){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.119331742여성용 마법사 정장
					case(32){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 아머
					case(33){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 뱀브레이스
					case(34){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.119331742더스틴 실버 나이트 그리브
					case(35){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(여성용)
					case(36){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(남성용)
					case(37){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(38){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 건틀렛
					case(39){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.119331742발렌시아 크로스 라인 플레이트 부츠
					case(40){itemString = `id:15298 `; iCumRate +=1;} //0.119331742아처리스 스쿨웨어
					case(41){itemString = `id:15079 `; iCumRate +=1;} //0.119331742볼레로 앤 점퍼 스커트
					case(42){itemString = `id:15222 `; iCumRate +=1;} //0.119331742그레이스 숄 드레스(여성용)
					case(43){itemString = `id:16046 `; iCumRate +=1;} //0.119331742고양이 손 장갑
					case(44){itemString = `id:18187 `; iCumRate +=1;} //0.119331742커다란 리본
					case(45){itemString = `id:18188 `; iCumRate +=1;} //0.119331742안대
					case(46){itemString = `id:18189 `; iCumRate +=1;} //0.119331742카우보이 모자
					case(47){itemString = `id:15252 `; iCumRate +=1;} //0.119331742집사 의상
					case(48){itemString = `id:19005 `; iCumRate +=1;} //0.119331742머플러 로브
					case(49){itemString = `id:18161 `; iCumRate +=1;} //0.119331742데브캣 귀마개
					case(50){itemString = `id:18157 `; iCumRate +=1;} //0.119331742고양이 귀 머리띠
					case(51){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=2;} //0.238663484레더 롱 보우
					case(52){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.238663484글라디우스
					case(53){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=2;} //0.238663484라이트닝 원드
					case(54){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=2;} //0.238663484메이스
					case(55){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484드래곤 블레이드
					case(56){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484클레이모어
					case(57){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484레더 롱 보우
					case(58){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484힐링 원드
					case(59){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484글라디우스
					case(60){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484라이트닝 원드
					case(61){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484아이스 원드
					case(62){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484파이어 원드
					case(63){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484타격용 원드
					case(64){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484비펜니스
					case(65){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484메이스
					case(66){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484석궁
					case(67){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484투 핸디드 소드
					case(68){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484롱 보우
					case(69){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484guardian bow
					case(70){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=2;} //0.238663484헤테로 카이트 실드
					case(71){itemString = `id:15267 `; iCumRate +=2;} //0.238663484테라 고딕 풀 드레스
					case(72){itemString = `id:15268 `; iCumRate +=2;} //0.238663484테라 고딕 펑크 수트
					case(73){itemString = `id:19005 `; iCumRate +=2;} //0.238663484머플러 로브
					case(74){itemString = `id:15217 `; iCumRate +=2;} //0.238663484에이프런 원피스
					case(75){itemString = `id:18161 `; iCumRate +=2;} //0.238663484데브캣 귀마개
					case(76){itemString = `id:18157 `; iCumRate +=2;} //0.238663484고양이 귀 머리띠
					case(77){itemString = `id:15233 `; iCumRate +=2;} //0.238663484엘레건트 고딕 드레스
					case(78){itemString = `id:15234 `; iCumRate +=2;} //0.238663484엘레건트 고딕 슈트
					case(79){itemString = `id:15235 `; iCumRate +=2;} //0.238663484엘레건트 고딕 드레스
					case(80){itemString = `id:15233 `; iCumRate +=2;} //0.238663484엘레건트 고딕 드레스
					case(81){itemString = `id:15234 `; iCumRate +=2;} //0.238663484엘레건트 고딕 슈트
					case(82){itemString = `id:15235 `; iCumRate +=2;} //0.238663484엘레건트 고딕 드레스
					case(83){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=3;} //0.357995227드래곤 블레이드
					case(84){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=3;} //0.357995227클레이모어
					case(85){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=3;} //0.357995227힐링 원드
					case(86){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=3;} //0.357995227아이스 원드
					case(87){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=3;} //0.357995227파이어 원드
					case(88){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=3;} //0.357995227타격용 원드
					case(89){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=3;} //0.357995227비펜니스
					case(90){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=3;} //0.357995227석궁
					case(91){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=3;} //0.357995227투 핸디드 소드
					case(92){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=3;} //0.357995227롱 보우
					case(93){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=3;} //0.357995227가디언 보우
					case(94){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=3;} //0.357995227헤테로 카이트 실드
					case(95){itemString = `id:14039 `; iCumRate +=3;} //0.357995227차이나 드래곤 아머(인간)
					case(96){itemString = `id:14040 `; iCumRate +=3;} //0.357995227차이나 드래곤 아머(엘프)
					case(97){itemString = `id:14041 `; iCumRate +=3;} //0.357995227차이나 드래곤 아머(자이언트)
					case(98){itemString = `id:16532 `; iCumRate +=3;} //0.357995227차이나 드래곤 건틀렛(인간/자이언트)
					case(99){itemString = `id:16535 `; iCumRate +=3;} //0.357995227차이나 드래곤 건틀렛(자이언트)
					case(100){itemString = `id:16533 `; iCumRate +=3;} //0.357995227차이나 드래곤 건틀렛(엘프)
					case(101){itemString = `id:17095 `; iCumRate +=3;} //0.357995227차이나 드래곤 부츠
					case(102){itemString = `id:18552 `; iCumRate +=3;} //0.357995227차이나 드래곤 헬름
					case(103){itemString = `id:40170 `; iCumRate +=3;} //0.357995227일본식 양손검
					case(104){itemString = `id:18518 `; iCumRate +=4;} //0.477326969드래곤 크레스트
					case(105){itemString = `id:15113 `; iCumRate +=4;} //0.477326969여성용 검사학교 교복 쇼트타입
					case(106){itemString = `id:15114 `; iCumRate +=4;} //0.477326969남성용 검사학교 교복 롱타입
					case(107){itemString = `id:15065 `; iCumRate +=4;} //0.477326969엘라 베스트 스커트
					case(108){itemString = `id:19008 `; iCumRate +=4;} //0.477326969코코 판다 로브
					case(109){itemString = `id:15137 `; iCumRate +=4;} //0.477326969셀리나 하프 재킷 코트
					case(110){itemString = `id:18041 `; iCumRate +=4;} //0.477326969큰 챙 깃털 모자
					case(111){itemString = `id:19009 `; iCumRate +=4;} //0.477326969코코 래빗 로브
					case(112){itemString = `id:18112 `; iCumRate +=4;} //0.477326969해 분장 소품
					case(113){itemString = `id:18111 `; iCumRate +=4;} //0.477326969나무 분장 소품
					case(114){itemString = `id:18110 `; iCumRate +=4;} //0.477326969덤불 분장 소품
					case(115){itemString = `id:18109 `; iCumRate +=4;} //0.477326969나오 분장 소품
					case(116){itemString = `id:18108 `; iCumRate +=4;} //0.477326969바위 분장 소품
					case(117){itemString = `id:40083 `; iCumRate +=4;} //0.477326969훅 커틀러스
					case(118){itemString = `id:40032 `; iCumRate +=4;} //0.477326969가고일 소드
					case(119){itemString = `id:18544 `; iCumRate +=4;} //0.477326969펠리칸 프로텍터
					case(120){itemString = `id:18547 `; iCumRate +=4;} //0.477326969파나쉬 헤드 프로텍터
					case(121){itemString = `id:18521 `; iCumRate +=4;} //0.477326969유러피안 컴프
					case(122){itemString = `id:18500 `; iCumRate +=4;} //0.477326969링 메일 헬름
					case(123){itemString = `id:18511 `; iCumRate +=4;} //0.477326969플루트 풀 헬름
					case(124){itemString = `id:18502 `; iCumRate +=4;} //0.477326969본 헬름
					case(125){itemString = `id:19007 `; iCumRate +=4;} //0.477326969야광 머플러 로브
					case(126){itemString = `id:19017 `; iCumRate +=4;} //0.477326969늑대 로브
					case(127){itemString = `id:19016 `; iCumRate +=4;} //0.477326969곰 로브
					case(128){itemString = `id:15112 `; iCumRate +=4;} //0.477326969셀리나 스쿨보이룩
					case(129){itemString = `id:18034 `; iCumRate +=4;} //0.477326969볼륨 베레모
					case(130){itemString = `id:18113 `; iCumRate +=4;} //0.477326969뾰족귀 고양이 모자
					case(131){itemString = `id:18114 `; iCumRate +=4;} //0.477326969줄무늬 고양이 모자
					case(132){itemString = `id:18115 `; iCumRate +=4;} //0.477326969핀 고양이 모자
					case(133){itemString = `id:18097 `; iCumRate +=4;} //0.477326969세이렌 깃털 가면
					case(134){itemString = `id:18098 `; iCumRate +=4;} //0.477326969세이렌의 안경
					case(135){itemString = `id:18099 `; iCumRate +=4;} //0.477326969세이렌 작은 날개 가면
					case(136){itemString = `id:18100 `; iCumRate +=4;} //0.477326969세이렌 날개 가면
					case(137){itemString = `id:18101`; iCumRate +=4;} //0.477326969세이렌 박쥐 날개 가면
					case(138){itemString = `id:18102 `; iCumRate +=4;} //0.477326969세이렌의 가면
					case(139){itemString = `id:15055 `; iCumRate +=4;} //0.477326969세이렌 고양이 가면
					case(140){itemString = `id:18044 `; iCumRate +=4;} //0.477326969범죄용 복면
					case(141){itemString = `id:16517 `; iCumRate +=4;} //0.477326969반대 장갑
					case(142){itemString = `id:16516 `; iCumRate +=4;} //0.477326969찬성 장갑
					case(143){itemString = `id:16515 `; iCumRate +=4;} //0.477326969보 장갑
					case(144){itemString = `id:16514 `; iCumRate +=4;} //0.477326969바위 장갑
					case(145){itemString = `id:16513 `; iCumRate +=4;} //0.477326969가위 장갑
					case(146){itemString = `id:40068 `; iCumRate +=4;} //0.477326969가위 모양 지시봉
					case(147){itemString = `id:40069 `; iCumRate +=4;} //0.477326969바위 모양 지시봉
					case(148){itemString = `id:40070 `; iCumRate +=4;} //0.477326969보 모양 지시봉
					case(149){itemString = `id:17015 `; iCumRate +=4;} //0.477326969Combat Shoes
					case(150){itemString = `id:15055 `; iCumRate +=4;} //0.477326969레더 미니 원피스
					case(151){itemString = `id:15057 `; iCumRate +=4;} //0.477326969롱 레더 코트 (무광)
					case(152){itemString = `id:18040 `; iCumRate +=4;} //0.477326969코레스 꼭지 베레모
					case(153){itemString = `id:80000 `; iCumRate +=4;} //0.477326969나오의 검은 옷
					case(154){itemString = `id:80001 `; iCumRate +=4;} //0.477326969루아의 옷
					case(155){itemString = `id:80002 `; iCumRate +=4;} //0.477326969핑크색 코트
					case(156){itemString = `id:80003 `; iCumRate +=4;} //0.477326969검은색 코트
					case(157){itemString = `id:80004 `; iCumRate +=4;} //0.477326969나오의 노란색 봄 옷
					case(158){itemString = `id:80005 `; iCumRate +=4;} //0.477326969나오의 하얀색 봄 옷
					case(159){itemString = `id:80006 `; iCumRate +=4;} //0.477326969나오의 핑크색 봄 옷
					case(160){itemString = `id:18060 `; iCumRate +=4;} //0.477326969별 토끼 머리띠5
					case(161){itemString = `id:18065 `; iCumRate +=4;} //0.477326969털 토끼 머리띠5
					case(162){itemString = `id:18070 `; iCumRate +=4;} //0.477326969가죽 토끼 머리띠5
					case(163){itemString = `id:14036 `; iCumRate +=4;} //0.477326969티오즈 아머(남성용)
					case(164){itemString = `id:14037 `; iCumRate +=4;} //0.477326969티오즈 아머(여성용)
					case(165){itemString = `id:16531 `; iCumRate +=4;} //0.477326969티오즈 건틀렛
					case(166){itemString = `id:17523 `; iCumRate +=4;} //0.477326969티오즈 그리브
					case(167){itemString = `id:15132 `; iCumRate +=4;} //0.477326969내추럴 베스트 웨어
					case(168){itemString = `id:15070 `; iCumRate +=4;} //0.477326969스탠드칼라 슬리브리스
					case(169){itemString = `id:15230 `; iCumRate +=4;} //0.477326969가르텐 글렌 체크 스커트
					case(170){itemString = `id:19034 `; iCumRate +=4;} //0.477326969가르텐 클로스 오버코트
					case(171){itemString = `id:40033 `; iCumRate +=4;} //0.477326969클레이모어
					case(172){itemString = `id:40011 `; iCumRate +=4;} //0.477326969브로드 소드
					case(173){itemString = `id:40030 `; iCumRate +=4;} //0.477326969투 핸디드 소드
					case(174){itemString = `id:40012 `; iCumRate +=4;} //0.477326969바스타드 소드
					case(175){itemString = `id:40007 `; iCumRate +=4;} //0.477326969한손도끼
					case(176){itemString = `id:40014 `; iCumRate +=4;} //0.477326969콤포짓 보우
					case(177){itemString = `id:40078 `; iCumRate +=4;} //0.477326969비펜니스
					case(178){itemString = `id:40080 `; iCumRate +=4;} //0.477326969글라디우스
					case(179){itemString = `id:40006 `; iCumRate +=4;} //0.477326969단검
					case(180){itemString = `id:40031 `; iCumRate +=4;} //0.477326969석궁
					case(181){itemString = `id:40081 `; iCumRate +=4;} //0.477326969레더 롱 보우
					case(182){itemString = `id:40079 `; iCumRate +=4;} //0.477326969메이스
					case(183){itemString = `id:13043 `; iCumRate +=4;} //0.477326969레미니아 성월의 갑옷(남성용)
					case(184){itemString = `id:13044 `; iCumRate +=4;} //0.477326969레미니아 성월의 갑옷(여성용)
					case(185){itemString = `id:13045 `; iCumRate +=4;} //0.477326969아리쉬 아슈빈 아머(남성용)
					case(186){itemString = `id:13046 `; iCumRate +=4;} //0.477326969아리쉬 아슈빈 아머(여성용)
					case(187){itemString = `id:14019 `; iCumRate +=4;} //0.477326969그레이스 플레이트 아머
					case(188){itemString = `id:13031 `; iCumRate +=4;} //0.477326969스파이카 실버 플레이트 아머
					case(189){itemString = `id:13022 `; iCumRate +=4;} //0.477326969로즈 플레이트 아머 (P타입)
					case(190){itemString = `id:40039 `; iCumRate +=4;} //0.477326969아이스 원드
					case(191){itemString = `id:40090 `; iCumRate +=4;} //0.477326969힐링 원드
					case(192){itemString = `id:40040 `; iCumRate +=4;} //0.477326969파이어 원드
					case(193){itemString = `id:40038 `; iCumRate +=4;} //0.477326969라이트닝 원드
					case(194){itemString = `id:18542 `; iCumRate +=4;} //0.477326969빅 체인 풀 헬름
					case(195){itemString = `id:18506 `; iCumRate +=4;} //0.477326969윙 하프 헬름
					case(196){itemString = `id:14042 `; iCumRate +=4;} //0.477326969컬스틴 레더 아머
					case(197){itemString = `id:15155 `; iCumRate +=4;} //0.477326969이디카이 성직자 예복(남성용)
					case(198){itemString = `id:15156 `; iCumRate +=4;} //0.477326969이디카이 성직자 예복(여성용)
					case(199){itemString = `id:15151 `; iCumRate +=4;} //0.477326969뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(200){itemString = `id:15152 `; iCumRate +=4;} //0.477326969뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(201){itemString = `id:15153 `; iCumRate +=4;} //0.477326969산드라 스나이퍼 수트(남성용)
					case(202){itemString = `id:15154 `; iCumRate +=4;} //0.477326969산드라 스나이퍼 수트(여성용)
					case(203){itemString = `id:15157 `; iCumRate +=4;} //0.477326969위스 보위군 의복(남성용)
					case(204){itemString = `id:15158 `; iCumRate +=4;} //0.477326969위스 보위군 의복(여성용)
					case(205){itemString = `id:15115 `; iCumRate +=4;} //0.477326969재기드 미니 스커트
					case(206){itemString = `id:15059 `; iCumRate +=4;} //0.477326969터크스 탱크탑 반바지
					case(207){itemString = `id:15070 `; iCumRate +=4;} //0.477326969아이돌 리본 드레스
					case(208){itemString = `id:15074 `; iCumRate +=4;} //0.477326969루이스 성직자 코트
					case(209){itemString = `id:15061 `; iCumRate +=4;} //0.477326969물결무늬 옆트임 튜닉
					case(210){itemString = `id:18045 `; iCumRate +=4;} //0.477326969별장식 마법사 모자
					case(211){itemString = `id:18019 `; iCumRate +=4;} //0.477326969리리나 깃털모자
					case(212){itemString = `id:18020 `; iCumRate +=4;} //0.477326969몬거 깃털모자
					case(213){itemString = `id:18029 `; iCumRate +=4;} //0.477326969나무테 안경
					case(214){itemString = `id:18028 `; iCumRate +=4;} //0.477326969접이식 안경
					case(215){itemString = `id:13010 `; iCumRate +=4;} //0.477326969라운드 폴드론 체인메일
					case(216){itemString = `id:14025 `; iCumRate +=4;} //0.477326969카멜 스피리트 아머(남성용)
					case(217){itemString = `id:14026 `; iCumRate +=4;} //0.477326969카멜 스피리트 아머(여성용)
					case(218){itemString = `id:16028 `; iCumRate +=4;} //0.477326969카멜 스피리트 글러브
					case(219){itemString = `id:17064 `; iCumRate +=4;} //0.477326969카멜 스피리트 부츠
					case(220){itemString = `id:15131 `; iCumRate +=4;} //0.477326969핀 에이프런 스커트
					case(221){itemString = `id:16534 `; iCumRate +=4;} //0.477326969컬스틴 레더 건틀렛
					case(222){itemString = `id:17524 `; iCumRate +=4;} //0.477326969컬스틴 레더 부츠
					case(223){itemString = `id:13047 `; iCumRate +=4;} //0.477326969키리누스진 하프 플레이트 아머(남성용)
					case(224){itemString = `id:13048 `; iCumRate +=4;} //0.477326969키리누스진 하프 플레이트 아머(여성용)
					case(225){itemString = `id:14013 `; iCumRate +=4;} //0.477326969로리카 세그먼타타에
					case(226){itemString = `id:14035 `; iCumRate +=4;} //0.477326969피르타 레더 아머
					case(227){itemString = `id:14038 `; iCumRate +=4;} //0.477326969피르타 레더 아머 B타입(여성용)
					case(228){itemString = `id:15028 `; iCumRate +=4;} //0.477326969코레스 씨프슈트
					case(229){itemString = `id:15042 `; iCumRate +=4;} //0.477326969롱넥 원피스
					case(230){itemString = `id:15052 `; iCumRate +=4;} //0.477326969터크스 투톤 튜닉
					case(231){itemString = `id:15053 `; iCumRate +=4;} //0.477326969플랫칼라 원피스
					case(232){itemString = `id:15128 `; iCumRate +=4;} //0.477326969투 톤 비조 드레스
					case(233){itemString = `id:15136 `; iCumRate +=4;} //0.477326969모험가 슈트
					case(234){itemString = `id:16008 `; iCumRate +=4;} //0.477326969코레스 씨프 글러브
					case(235){itemString = `id:16019 `; iCumRate +=4;} //0.477326969줄무늬 팔목 장갑
					case(236){itemString = `id:16040 `; iCumRate +=4;} //0.477326969콜린 빅센 글러브
					case(237){itemString = `id:16505 `; iCumRate +=4;} //0.477326969플루트 건틀렛
					case(238){itemString = `id:16520 `; iCumRate +=4;} //0.477326969롱 레더 글러브
					case(239){itemString = `id:17040 `; iCumRate +=4;} //0.477326969엘라 스트랩 부츠
					case(240){itemString = `id:17041 `; iCumRate +=4;} //0.477326969덩굴무늬 헌팅부츠
					case(241){itemString = `id:17045 `; iCumRate +=4;} //0.477326969브이 넥 라인 레더 부츠
					case(242){itemString = `id:17071 `; iCumRate +=4;} //0.477326969니하이 부츠
					case(243){itemString = `id:17087 `; iCumRate +=4;} //0.477326969콜린 빅센 부츠
					case(244){itemString = `id:17506 `; iCumRate +=4;} //0.477326969롱그리브 부츠
					case(245){itemString = `id:17522 `; iCumRate +=4;} //0.477326969피르타 레더 부츠
					case(246){itemString = `id:18008 `; iCumRate +=4;} //0.477326969스트라이프 캡
					case(247){itemString = `id:18038 `; iCumRate +=4;} //0.477326969깃털 배렛 모자
					case(248){itemString = `id:18047 `; iCumRate +=4;} //0.477326969코레스 펠트 모자
					case(249){itemString = `id:18513 `; iCumRate +=4;} //0.477326969스파이크 캡
					case(250){itemString = `id:18515 `; iCumRate +=4;} //0.477326969트윈 혼 캡
					case(251){itemString = `id:18525 `; iCumRate +=4;} //0.477326969워터드롭 캡
					case(252){itemString = `id:18543 `; iCumRate +=4;} //0.477326969슬릿 풀 헬름
					case(253){itemString = `id:19020 `; iCumRate +=4;} //0.477326969나타네 설산용 코트
					case(254){itemString = `id:19029 `; iCumRate +=4;} //0.477326969자이언트 베어 로브
					case(255){itemString = `id:40015 `; iCumRate +=4;} //0.477326969플루트 숏 소드
					case(256){itemString = `id:40081 `; iCumRate +=4;} //0.477326969롱 보우
					case(257){itemString = `id:46001 `; iCumRate +=4;} //0.477326969라운드 실드
					case(258){itemString = `id:46006 `; iCumRate +=4;} //0.477326969카이트 실드
					case(259){itemString = `id:40172 `; iCumRate +=4;} //0.477326969그레이트 소드
					case(260){itemString = `id:40174 `; iCumRate +=4;} //0.477326969모닝스타
					case(261){itemString = `id:40177 `; iCumRate +=4;} //0.477326969워리어 액스
					case(262){itemString = `id:40180 `; iCumRate +=4;} //0.477326969홉네일 너클
					case(263){itemString = `id:40041 `; iCumRate +=4;} //0.477326969타격용 원드
					case(264){itemString = `id:16523 `; iCumRate +=4;} //0.477326969그레이스 건틀렛
					case(265){itemString = `id:17515 `; iCumRate +=4;} //0.477326969그레이스 그리브
					case(266){itemString = `id:18545 `; iCumRate +=4;} //0.477326969그레이스 헬멧
					case(267){itemString = `id:46007 `; iCumRate +=4;} //0.477326969헤테로 카이트 실드
					case(268){itemString = `id:46008 `; iCumRate +=4;} //0.477326969라이트 헤테로 카이트 실드
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(948);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:18001 `; iCumRate +=1;} //0.105485232코레스 미스터리 로스웰 (UFO)
					case(1){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파나 케아 힐링 원드
					case(2){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 아이스 원드
					case(3){itemString = `id:40250 `; iCumRate +=1;} //0.105485232퀘르쿠스 파이어 원드
					case(4){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 라이트닝 원드
					case(5){itemString = `id:40250 `; iCumRate +=1;} //0.105485232칼피누스 힐링 원드
					case(6){itemString = `id:40250 `; iCumRate +=1;} //0.105485232파르 아이스 원드
					case(7){itemString = `id:40250 `; iCumRate +=1;} //0.105485232메탈 파이어 원드
					case(8){itemString = `id:40250 `; iCumRate +=1;} //0.105485232이미션 라이트닝 원드
					case(9){itemString = `id:18569 `; iCumRate +=1;} //0.105485232devCAT 모자
					case(10){itemString = `id:40171 `; iCumRate +=1;} //0.105485232마사무네
					case(11){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(12){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(13){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(14){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(15){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(16){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(17){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(18){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(19){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.105485232냄비(심해의)
					case(20){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.105485232남성용 마법사 정장
					case(21){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.105485232여성용 마법사 정장
					case(22){itemString = `id:13038 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 아머
					case(23){itemString = `id:16524 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 뱀브레이스
					case(24){itemString = `id:17517 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232더스틴 실버 나이트 그리브
					case(25){itemString = `id:13032 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(여성용)
					case(26){itemString = `id:13033 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(남성용)
					case(27){itemString = `id:13052 prefix:21006 suffix:31401`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 아머(자이언트용)
					case(28){itemString = `id:16521 prefix:20625 suffix:30819`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 건틀렛
					case(29){itemString = `id:17514 prefix:20625 suffix:30618`; iCumRate +=1;} //0.105485232발렌시아 크로스 라인 플레이트 부츠
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.105485232아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.105485232볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.105485232그레이스 숄 드레스(여성용)
					case(33){itemString = `id:40250 `; iCumRate +=1;} //0.105485232부채
					case(34){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유카타 남
					case(35){itemString = `id:40250 `; iCumRate +=1;} //0.105485232유타카 여
					case(36){itemString = `id:16046 `; iCumRate +=1;} //0.105485232고양이 손 장갑
					case(37){itemString = `id:18187 `; iCumRate +=1;} //0.105485232커다란 리본
					case(38){itemString = `id:18188 `; iCumRate +=1;} //0.105485232안대
					case(39){itemString = `id:18189 `; iCumRate +=1;} //0.105485232카우보이 모자
					case(40){itemString = `id:15252 `; iCumRate +=1;} //0.105485232집사 의상
					case(41){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(42){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(43){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(44){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(45){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232글라디우스
					case(46){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(47){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.105485232메이스
					case(48){itemString = `id:40095 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(49){itemString = `id:40033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232클레이모어
					case(50){itemString = `id:40081 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232레더 롱 보우
					case(51){itemString = `id:40090 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232힐링 원드
					case(52){itemString = `id:40080 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232글라디우스
					case(53){itemString = `id:40038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232라이트닝 원드
					case(54){itemString = `id:40039 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232아이스 원드
					case(55){itemString = `id:40040 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232파이어 원드
					case(56){itemString = `id:40041 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232타격용 원드
					case(57){itemString = `id:40078 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232비펜니스
					case(58){itemString = `id:40079 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232메이스
					case(59){itemString = `id:40031 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232석궁
					case(60){itemString = `id:40030 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(61){itemString = `id:40013 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232롱 보우
					case(62){itemString = `id:40107 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232guardian bow
					case(63){itemString = `id:46007 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(64){itemString = `id:15267 `; iCumRate +=1;} //0.105485232테라 고딕 풀 드레스
					case(65){itemString = `id:15268 `; iCumRate +=1;} //0.105485232테라 고딕 펑크 수트
					case(66){itemString = `id:19005 `; iCumRate +=1;} //0.105485232머플러 로브
					case(67){itemString = `id:15217 `; iCumRate +=1;} //0.105485232에이프런 원피스
					case(68){itemString = `id:18161 `; iCumRate +=1;} //0.105485232데브캣 귀마개
					case(69){itemString = `id:18157 `; iCumRate +=1;} //0.105485232고양이 귀 머리띠
					case(70){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(71){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(72){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(73){itemString = `id:15233 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(74){itemString = `id:15234 `; iCumRate +=1;} //0.105485232엘레건트 고딕 슈트
					case(75){itemString = `id:15235 `; iCumRate +=1;} //0.105485232엘레건트 고딕 드레스
					case(76){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232드래곤 블레이드
					case(77){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232클레이모어
					case(78){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232힐링 원드
					case(79){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232아이스 원드
					case(80){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232파이어 원드
					case(81){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232타격용 원드
					case(82){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.105485232비펜니스
					case(83){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.105485232석궁
					case(84){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.105485232투 핸디드 소드
					case(85){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.105485232롱 보우
					case(86){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.105485232가디언 보우
					case(87){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.105485232헤테로 카이트 실드
					case(88){itemString = `id:14039 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(인간)
					case(89){itemString = `id:14040 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(엘프)
					case(90){itemString = `id:14041 `; iCumRate +=1;} //0.105485232차이나 드래곤 아머(자이언트)
					case(91){itemString = `id:16532 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(인간/자이언트)
					case(92){itemString = `id:16535 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(자이언트)
					case(93){itemString = `id:16533 `; iCumRate +=1;} //0.105485232차이나 드래곤 건틀렛(엘프)
					case(94){itemString = `id:17095 `; iCumRate +=1;} //0.105485232차이나 드래곤 부츠
					case(95){itemString = `id:18552 `; iCumRate +=1;} //0.105485232차이나 드래곤 헬름
					case(96){itemString = `id:40170 `; iCumRate +=1;} //0.105485232일본식 양손검
					case(97){itemString = `id:51007 count:10`; iCumRate +=2;} //0.210970464마나 30 포션
					case(98){itemString = `id:51013 count:10`; iCumRate +=2;} //0.210970464스태미나 50 포션
					case(99){itemString = `id:51001 count:10`; iCumRate +=2;} //0.210970464생명력 10 포션
					case(100){itemString = `id:51002 count:10`; iCumRate +=2;} //0.210970464생명력 30 포션
					case(101){itemString = `id:51022 count:10`; iCumRate +=2;} //0.210970464생명력과 마나 30 포션
					case(102){itemString = `id:51027 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 30 포션
					case(103){itemString = `id:51028 count:10`; iCumRate +=2;} //0.210970464생명력과 스태미나 50 포션
					case(104){itemString = `id:63000 count:10`; iCumRate +=2;} //0.210970464피닉스의 깃털
					case(105){itemString = `id:60037 count:5`; iCumRate +=2;} //0.210970464블랙 유스 포션
					case(106){itemString = `id:60038 count:5`; iCumRate +=2;} //0.210970464레드 포션
					case(107){itemString = `id:50012 count:5`; iCumRate +=2;} //0.210970464황금 달걀
					case(108){itemString = `id:50013 count:5`; iCumRate +=2;} //0.210970464황금 사과
					case(109){itemString = `id:50541 quality:100`; iCumRate +=2;} //0.210970464에스프레소
					case(110){itemString = `id:50542 quality:100`; iCumRate +=2;} //0.210970464에스프레소 마끼아또 
					case(111){itemString = `id:50543 quality:100`; iCumRate +=2;} //0.210970464카푸치노
					case(112){itemString = `id:50544 quality:100`; iCumRate +=2;} //0.210970464마끼아또
					case(113){itemString = `id:50545 quality:100`; iCumRate +=2;} //0.210970464카페 모카
					case(114){itemString = `id:50546 quality:100`; iCumRate +=2;} //0.210970464아이스 카페 모카
					case(115){itemString = `id:50547 quality:100`; iCumRate +=2;} //0.210970464아이스 마끼아또
					case(116){itemString = `id:50170 quality:100`; iCumRate +=2;} //0.210970464치즈 퐁듀
					case(117){itemString = `id:50171 quality:100`; iCumRate +=2;} //0.210970464이멘 마하산 와인
					case(118){itemString = `id:50172 quality:100`; iCumRate +=2;} //0.210970464레어치즈 케익
					case(119){itemString = `id:50173 quality:100`; iCumRate +=2;} //0.210970464가토 오 쇼콜라
					case(120){itemString = `id:50174 quality:100`; iCumRate +=2;} //0.210970464크로크 무슈
					case(121){itemString = `id:50175 quality:100`; iCumRate +=2;} //0.210970464브라우니
					case(122){itemString = `id:50176 quality:100`; iCumRate +=2;} //0.210970464버터 비스킷
					case(123){itemString = `id:62005 suffix:30515`; iCumRate +=3;} //0.316455696해적의
					case(124){itemString = `id:62005 prefix:20505`; iCumRate +=3;} //0.316455696리자드
					case(125){itemString = `id:62005 prefix:21007`; iCumRate +=3;} //0.316455696히스
					case(126){itemString = `id:62005 prefix:20625`; iCumRate +=3;} //0.316455696금속 바늘
					case(127){itemString = `id:62005 suffix:30624`; iCumRate +=3;} //0.316455696산사나무
					case(128){itemString = `id:62005 prefix:20721`; iCumRate +=3;} //0.316455696한가한
					case(129){itemString = `id:62005 suffix:30918`; iCumRate +=3;} //0.316455696마나 위자드|마나 위자드(suffix)
					case(130){itemString = `id:62005 suffix:30632`; iCumRate +=3;} //0.316455696버스트 나이트|버스트 나이트(suffix)
					case(131){itemString = `id:62005 suffix:30525`; iCumRate +=3;} //0.316455696마나 서머너|마나 서머너(suffix)
					case(132){itemString = `id:62005 suffix:30418`; iCumRate +=3;} //0.316455696포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(133){itemString = `id:18518 `; iCumRate +=4;} //0.421940928드래곤 크레스트
					case(134){itemString = `id:15113 `; iCumRate +=4;} //0.421940928여성용 검사학교 교복 쇼트타입
					case(135){itemString = `id:15114 `; iCumRate +=4;} //0.421940928남성용 검사학교 교복 롱타입
					case(136){itemString = `id:15065 `; iCumRate +=4;} //0.421940928엘라 베스트 스커트
					case(137){itemString = `id:19008 `; iCumRate +=4;} //0.421940928코코 판다 로브
					case(138){itemString = `id:15137 `; iCumRate +=4;} //0.421940928셀리나 하프 재킷 코트
					case(139){itemString = `id:18041 `; iCumRate +=4;} //0.421940928큰 챙 깃털 모자
					case(140){itemString = `id:19009 `; iCumRate +=4;} //0.421940928코코 래빗 로브
					case(141){itemString = `id:18112 `; iCumRate +=4;} //0.421940928해 분장 소품
					case(142){itemString = `id:18111 `; iCumRate +=4;} //0.421940928나무 분장 소품
					case(143){itemString = `id:18110 `; iCumRate +=4;} //0.421940928덤불 분장 소품
					case(144){itemString = `id:18109 `; iCumRate +=4;} //0.421940928나오 분장 소품
					case(145){itemString = `id:18108 `; iCumRate +=4;} //0.421940928바위 분장 소품
					case(146){itemString = `id:40083 `; iCumRate +=4;} //0.421940928훅 커틀러스
					case(147){itemString = `id:40032 `; iCumRate +=4;} //0.421940928가고일 소드
					case(148){itemString = `id:18544 `; iCumRate +=4;} //0.421940928펠리칸 프로텍터
					case(149){itemString = `id:18547 `; iCumRate +=4;} //0.421940928파나쉬 헤드 프로텍터
					case(150){itemString = `id:18521 `; iCumRate +=4;} //0.421940928유러피안 컴프
					case(151){itemString = `id:18500 `; iCumRate +=4;} //0.421940928링 메일 헬름
					case(152){itemString = `id:18511 `; iCumRate +=4;} //0.421940928플루트 풀 헬름
					case(153){itemString = `id:18502 `; iCumRate +=4;} //0.421940928본 헬름
					case(154){itemString = `id:19007 `; iCumRate +=4;} //0.421940928야광 머플러 로브
					case(155){itemString = `id:19017 `; iCumRate +=4;} //0.421940928늑대 로브
					case(156){itemString = `id:19016 `; iCumRate +=4;} //0.421940928곰 로브
					case(157){itemString = `id:15112 `; iCumRate +=4;} //0.421940928셀리나 스쿨보이룩
					case(158){itemString = `id:18034 `; iCumRate +=4;} //0.421940928볼륨 베레모
					case(159){itemString = `id:18006 `; iCumRate +=4;} //0.421940928마법사모자
					case(160){itemString = `id:18113 `; iCumRate +=4;} //0.421940928뾰족귀 고양이 모자
					case(161){itemString = `id:18114 `; iCumRate +=4;} //0.421940928줄무늬 고양이 모자
					case(162){itemString = `id:18115 `; iCumRate +=4;} //0.421940928핀 고양이 모자
					case(163){itemString = `id:18097 `; iCumRate +=4;} //0.421940928세이렌 깃털 가면
					case(164){itemString = `id:18098 `; iCumRate +=4;} //0.421940928세이렌의 안경
					case(165){itemString = `id:18099 `; iCumRate +=4;} //0.421940928세이렌 작은 날개 가면
					case(166){itemString = `id:18100 `; iCumRate +=4;} //0.421940928세이렌 날개 가면
					case(167){itemString = `id:18101`; iCumRate +=4;} //0.421940928세이렌 박쥐 날개 가면
					case(168){itemString = `id:18102 `; iCumRate +=4;} //0.421940928세이렌의 가면
					case(169){itemString = `id:15055 `; iCumRate +=4;} //0.421940928세이렌 고양이 가면
					case(170){itemString = `id:18044 `; iCumRate +=4;} //0.421940928범죄용 복면
					case(171){itemString = `id:40071 `; iCumRate +=4;} //0.421940928'라' 음 빈 병
					case(172){itemString = `id:40072 `; iCumRate +=4;} //0.421940928'시' 음 빈 병
					case(173){itemString = `id:40073 `; iCumRate +=4;} //0.421940928'도' 음 빈 병
					case(174){itemString = `id:40074 `; iCumRate +=4;} //0.421940928'레' 음 빈 병
					case(175){itemString = `id:40075 `; iCumRate +=4;} //0.421940928'미' 음 빈 병
					case(176){itemString = `id:40076 `; iCumRate +=4;} //0.421940928'파' 음 빈 병
					case(177){itemString = `id:40077 `; iCumRate +=4;} //0.421940928'솔' 음 빈 병
					case(178){itemString = `id:16517 `; iCumRate +=4;} //0.421940928반대 장갑
					case(179){itemString = `id:16516 `; iCumRate +=4;} //0.421940928찬성 장갑
					case(180){itemString = `id:16515 `; iCumRate +=4;} //0.421940928보 장갑
					case(181){itemString = `id:16514 `; iCumRate +=4;} //0.421940928바위 장갑
					case(182){itemString = `id:16513 `; iCumRate +=4;} //0.421940928가위 장갑
					case(183){itemString = `id:40068 `; iCumRate +=4;} //0.421940928가위 모양 지시봉
					case(184){itemString = `id:40069 `; iCumRate +=4;} //0.421940928바위 모양 지시봉
					case(185){itemString = `id:40070 `; iCumRate +=4;} //0.421940928보 모양 지시봉
					case(186){itemString = `id:17015 `; iCumRate +=4;} //0.421940928Combat Shoes
					case(187){itemString = `id:15055 `; iCumRate +=4;} //0.421940928레더 미니 원피스
					case(188){itemString = `id:15057 `; iCumRate +=4;} //0.421940928롱 레더 코트 (무광)
					case(189){itemString = `id:18040 `; iCumRate +=4;} //0.421940928코레스 꼭지 베레모
					case(190){itemString = `id:80000 `; iCumRate +=4;} //0.421940928나오의 검은 옷
					case(191){itemString = `id:80001 `; iCumRate +=4;} //0.421940928루아의 옷
					case(192){itemString = `id:80002 `; iCumRate +=4;} //0.421940928핑크색 코트
					case(193){itemString = `id:80003 `; iCumRate +=4;} //0.421940928검은색 코트
					case(194){itemString = `id:80004 `; iCumRate +=4;} //0.421940928나오의 노란색 봄 옷
					case(195){itemString = `id:80005 `; iCumRate +=4;} //0.421940928나오의 하얀색 봄 옷
					case(196){itemString = `id:80006 `; iCumRate +=4;} //0.421940928나오의 핑크색 봄 옷
					case(197){itemString = `id:18056 `; iCumRate +=4;} //0.421940928별 토끼 머리띠1
					case(198){itemString = `id:18057 `; iCumRate +=4;} //0.421940928별 토끼 머리띠2
					case(199){itemString = `id:18058 `; iCumRate +=4;} //0.421940928별 토끼 머리띠3
					case(200){itemString = `id:18059 `; iCumRate +=4;} //0.421940928별 토끼 머리띠4
					case(201){itemString = `id:18060 `; iCumRate +=4;} //0.421940928별 토끼 머리띠5
					case(202){itemString = `id:18061 `; iCumRate +=4;} //0.421940928털 토끼 머리띠1
					case(203){itemString = `id:18062 `; iCumRate +=4;} //0.421940928털 토끼 머리띠2
					case(204){itemString = `id:18063 `; iCumRate +=4;} //0.421940928털 토끼 머리띠3
					case(205){itemString = `id:18064 `; iCumRate +=4;} //0.421940928털 토끼 머리띠4
					case(206){itemString = `id:18065 `; iCumRate +=4;} //0.421940928털 토끼 머리띠5
					case(207){itemString = `id:18066 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠1
					case(208){itemString = `id:18067 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠2
					case(209){itemString = `id:18068 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠3
					case(210){itemString = `id:18069 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠4
					case(211){itemString = `id:18070 `; iCumRate +=4;} //0.421940928가죽 토끼 머리띠5
					case(212){itemString = `id:14036 `; iCumRate +=4;} //0.421940928티오즈 아머(남성용)
					case(213){itemString = `id:14037 `; iCumRate +=4;} //0.421940928티오즈 아머(여성용)
					case(214){itemString = `id:16531 `; iCumRate +=4;} //0.421940928티오즈 건틀렛
					case(215){itemString = `id:17523 `; iCumRate +=4;} //0.421940928티오즈 그리브
					case(216){itemString = `id:15132 `; iCumRate +=4;} //0.421940928내추럴 베스트 웨어
					case(217){itemString = `id:15070 `; iCumRate +=4;} //0.421940928스탠드칼라 슬리브리스
					case(218){itemString = `id:15230 `; iCumRate +=4;} //0.421940928가르텐 글렌 체크 스커트
					case(219){itemString = `id:19034 `; iCumRate +=4;} //0.421940928가르텐 클로스 오버코트
					case(220){itemString = `id:40033 `; iCumRate +=4;} //0.421940928클레이모어
					case(221){itemString = `id:40011 `; iCumRate +=4;} //0.421940928브로드 소드
					case(222){itemString = `id:40030 `; iCumRate +=4;} //0.421940928투 핸디드 소드
					case(223){itemString = `id:40012 `; iCumRate +=4;} //0.421940928바스타드 소드
					case(224){itemString = `id:40007 `; iCumRate +=4;} //0.421940928한손도끼
					case(225){itemString = `id:40014 `; iCumRate +=4;} //0.421940928콤포짓 보우
					case(226){itemString = `id:40078 `; iCumRate +=4;} //0.421940928비펜니스
					case(227){itemString = `id:40080 `; iCumRate +=4;} //0.421940928글라디우스
					case(228){itemString = `id:40006 `; iCumRate +=4;} //0.421940928단검
					case(229){itemString = `id:40031 `; iCumRate +=4;} //0.421940928석궁
					case(230){itemString = `id:40081 `; iCumRate +=4;} //0.421940928레더 롱 보우
					case(231){itemString = `id:40079 `; iCumRate +=4;} //0.421940928메이스
					case(232){itemString = `id:13043 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(남성용)
					case(233){itemString = `id:13044 `; iCumRate +=4;} //0.421940928레미니아 성월의 갑옷(여성용)
					case(234){itemString = `id:13045 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(남성용)
					case(235){itemString = `id:13046 `; iCumRate +=4;} //0.421940928아리쉬 아슈빈 아머(여성용)
					case(236){itemString = `id:14019 `; iCumRate +=4;} //0.421940928그레이스 플레이트 아머
					case(237){itemString = `id:13031 `; iCumRate +=4;} //0.421940928스파이카 실버 플레이트 아머
					case(238){itemString = `id:13022 `; iCumRate +=4;} //0.421940928로즈 플레이트 아머 (P타입)
					case(239){itemString = `id:40039 `; iCumRate +=4;} //0.421940928아이스 원드
					case(240){itemString = `id:40090 `; iCumRate +=4;} //0.421940928힐링 원드
					case(241){itemString = `id:40040 `; iCumRate +=4;} //0.421940928파이어 원드
					case(242){itemString = `id:40038 `; iCumRate +=4;} //0.421940928라이트닝 원드
					case(243){itemString = `id:18542 `; iCumRate +=4;} //0.421940928빅 체인 풀 헬름
					case(244){itemString = `id:18506 `; iCumRate +=4;} //0.421940928윙 하프 헬름
					case(245){itemString = `id:14042 `; iCumRate +=4;} //0.421940928컬스틴 레더 아머
					case(246){itemString = `id:15155 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(남성용)
					case(247){itemString = `id:15156 `; iCumRate +=4;} //0.421940928이디카이 성직자 예복(여성용)
					case(248){itemString = `id:15151 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(249){itemString = `id:15152 `; iCumRate +=4;} //0.421940928뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(250){itemString = `id:15153 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(남성용)
					case(251){itemString = `id:15154 `; iCumRate +=4;} //0.421940928산드라 스나이퍼 수트(여성용)
					case(252){itemString = `id:15157 `; iCumRate +=4;} //0.421940928위스 보위군 의복(남성용)
					case(253){itemString = `id:15158 `; iCumRate +=4;} //0.421940928위스 보위군 의복(여성용)
					case(254){itemString = `id:15115 `; iCumRate +=4;} //0.421940928재기드 미니 스커트
					case(255){itemString = `id:15059 `; iCumRate +=4;} //0.421940928터크스 탱크탑 반바지
					case(256){itemString = `id:15070 `; iCumRate +=4;} //0.421940928아이돌 리본 드레스
					case(257){itemString = `id:15074 `; iCumRate +=4;} //0.421940928루이스 성직자 코트
					case(258){itemString = `id:15061 `; iCumRate +=4;} //0.421940928물결무늬 옆트임 튜닉
					case(259){itemString = `id:18045 `; iCumRate +=4;} //0.421940928별장식 마법사 모자
					case(260){itemString = `id:18019 `; iCumRate +=4;} //0.421940928리리나 깃털모자
					case(261){itemString = `id:18020 `; iCumRate +=4;} //0.421940928몬거 깃털모자
					case(262){itemString = `id:18029 `; iCumRate +=4;} //0.421940928나무테 안경
					case(263){itemString = `id:18028 `; iCumRate +=4;} //0.421940928접이식 안경
					case(264){itemString = `id:13010 `; iCumRate +=4;} //0.421940928라운드 폴드론 체인메일
					case(265){itemString = `id:14025 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(남성용)
					case(266){itemString = `id:14026 `; iCumRate +=4;} //0.421940928카멜 스피리트 아머(여성용)
					case(267){itemString = `id:16028 `; iCumRate +=4;} //0.421940928카멜 스피리트 글러브
					case(268){itemString = `id:17064 `; iCumRate +=4;} //0.421940928카멜 스피리트 부츠
					case(269){itemString = `id:15131 `; iCumRate +=4;} //0.421940928핀 에이프런 스커트
					case(270){itemString = `id:2006 `; iCumRate +=4;} //0.421940928큰 금화 주머니
					case(271){itemString = `id:16534 `; iCumRate +=4;} //0.421940928컬스틴 레더 건틀렛
					case(272){itemString = `id:17524 `; iCumRate +=4;} //0.421940928컬스틴 레더 부츠
					case(273){itemString = `id:13047 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(남성용)
					case(274){itemString = `id:13048 `; iCumRate +=4;} //0.421940928키리누스진 하프 플레이트 아머(여성용)
					case(275){itemString = `id:14013 `; iCumRate +=4;} //0.421940928로리카 세그먼타타에
					case(276){itemString = `id:14035 `; iCumRate +=4;} //0.421940928피르타 레더 아머
					case(277){itemString = `id:14038 `; iCumRate +=4;} //0.421940928피르타 레더 아머 B타입(여성용)
					case(278){itemString = `id:15028 `; iCumRate +=4;} //0.421940928코레스 씨프슈트
					case(279){itemString = `id:15042 `; iCumRate +=4;} //0.421940928롱넥 원피스
					case(280){itemString = `id:15052 `; iCumRate +=4;} //0.421940928터크스 투톤 튜닉
					case(281){itemString = `id:15053 `; iCumRate +=4;} //0.421940928플랫칼라 원피스
					case(282){itemString = `id:15128 `; iCumRate +=4;} //0.421940928투 톤 비조 드레스
					case(283){itemString = `id:15136 `; iCumRate +=4;} //0.421940928모험가 슈트
					case(284){itemString = `id:16008 `; iCumRate +=4;} //0.421940928코레스 씨프 글러브
					case(285){itemString = `id:16019 `; iCumRate +=4;} //0.421940928줄무늬 팔목 장갑
					case(286){itemString = `id:16040 `; iCumRate +=4;} //0.421940928콜린 빅센 글러브
					case(287){itemString = `id:16505 `; iCumRate +=4;} //0.421940928플루트 건틀렛
					case(288){itemString = `id:16520 `; iCumRate +=4;} //0.421940928롱 레더 글러브
					case(289){itemString = `id:17040 `; iCumRate +=4;} //0.421940928엘라 스트랩 부츠
					case(290){itemString = `id:17041 `; iCumRate +=4;} //0.421940928덩굴무늬 헌팅부츠
					case(291){itemString = `id:17045 `; iCumRate +=4;} //0.421940928브이 넥 라인 레더 부츠
					case(292){itemString = `id:17071 `; iCumRate +=4;} //0.421940928니하이 부츠
					case(293){itemString = `id:17087 `; iCumRate +=4;} //0.421940928콜린 빅센 부츠
					case(294){itemString = `id:17506 `; iCumRate +=4;} //0.421940928롱그리브 부츠
					case(295){itemString = `id:17522 `; iCumRate +=4;} //0.421940928피르타 레더 부츠
					case(296){itemString = `id:18008 `; iCumRate +=4;} //0.421940928스트라이프 캡
					case(297){itemString = `id:18038 `; iCumRate +=4;} //0.421940928깃털 배렛 모자
					case(298){itemString = `id:18047 `; iCumRate +=4;} //0.421940928코레스 펠트 모자
					case(299){itemString = `id:18513 `; iCumRate +=4;} //0.421940928스파이크 캡
					case(300){itemString = `id:18515 `; iCumRate +=4;} //0.421940928트윈 혼 캡
					case(301){itemString = `id:18525 `; iCumRate +=4;} //0.421940928워터드롭 캡
					case(302){itemString = `id:18543 `; iCumRate +=4;} //0.421940928슬릿 풀 헬름
					case(303){itemString = `id:19020 `; iCumRate +=4;} //0.421940928나타네 설산용 코트
					case(304){itemString = `id:19029 `; iCumRate +=4;} //0.421940928자이언트 베어 로브
					case(305){itemString = `id:40015 `; iCumRate +=4;} //0.421940928플루트 숏 소드
					case(306){itemString = `id:40081 `; iCumRate +=4;} //0.421940928롱 보우
					case(307){itemString = `id:46001 `; iCumRate +=4;} //0.421940928라운드 실드
					case(308){itemString = `id:46006 `; iCumRate +=4;} //0.421940928카이트 실드
					case(309){itemString = `id:40172 `; iCumRate +=4;} //0.421940928그레이트 소드
					case(310){itemString = `id:40174 `; iCumRate +=4;} //0.421940928모닝스타
					case(311){itemString = `id:40177 `; iCumRate +=4;} //0.421940928워리어 액스
					case(312){itemString = `id:40180 `; iCumRate +=4;} //0.421940928홉네일 너클
					case(313){itemString = `id:40041 `; iCumRate +=4;} //0.421940928타격용 원드
					case(314){itemString = `id:16523 `; iCumRate +=4;} //0.421940928그레이스 건틀렛
					case(315){itemString = `id:17515 `; iCumRate +=4;} //0.421940928그레이스 그리브
					case(316){itemString = `id:18545 `; iCumRate +=4;} //0.421940928그레이스 헬멧
					case(317){itemString = `id:46007 `; iCumRate +=4;} //0.421940928헤테로 카이트 실드
					case(318){itemString = `id:46008 `; iCumRate +=4;} //0.421940928라이트 헤테로 카이트 실드
					case(319){itemString = `id:51003 count:10`; iCumRate +=5;} //0.52742616생명력 50 포션
					case(320){itemString = `id:51004 count:10`; iCumRate +=5;} //0.52742616생명력 100 포션
					case(321){itemString = `id:51008 count:10`; iCumRate +=5;} //0.52742616마나 50 포션
					case(322){itemString = `id:51014 count:10`; iCumRate +=5;} //0.52742616스태미나 100 포션
					case(323){itemString = `id:51029 count:10`; iCumRate +=5;} //0.52742616생명력과 스태미나 100 포션
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
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
			int iRandom = Random(258);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:19083 `; iCumRate +=1;} //0.387596899개구리 로브
					case(1){itemString = `id:18575 `; iCumRate +=1;} //0.387596899플라워 코사주
					case(2){itemString = `id:40969 `; iCumRate +=1;} //0.387596899양산
					case(3){itemString = `id:40970 `; iCumRate +=1;} //0.387596899먼지떨이
					case(4){itemString = `id:40979 `; iCumRate +=1;} //0.387596899브론즈 미러 블레이드
					case(5){itemString = `id:18237 `; iCumRate +=1;} //0.387596899딕 스티치 마스크
					case(6){itemString = `id:13066 `; iCumRate +=1;} //0.387596899레미니아 성월의 갑옷 (저스팅 남성용)
					case(7){itemString = `id:13067`; iCumRate +=1;} //0.387596899레미니아 성월의 갑옷 (저스팅 여성용)
					case(8){itemString = `id:18287`; iCumRate +=1;} //0.387596899원숭이 탈
					case(9){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.387596899남성용 마법사 정장
					case(10){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.387596899여성용 마법사 정장
					case(11){itemString = `id:40345`; iCumRate +=1;} //0.387596899팔카타
					case(12){itemString = `id:40346`; iCumRate +=1;} //0.387596899하이랜더 클레이모어
					case(13){itemString = `id:40347`; iCumRate +=1;} //0.387596899하이랜더 롱 보우
					case(14){itemString = `id:40348`; iCumRate +=1;} //0.387596899프랑키스카
					case(15){itemString = `id:46027`; iCumRate +=1;} //0.387596899타지 실드
					case(16){itemString = `id:13038 `; iCumRate +=1;} //0.387596899더스틴 실버 나이트 아머
					case(17){itemString = `id:16524 `; iCumRate +=1;} //0.387596899더스틴 실버 나이트 뱀브레이스
					case(18){itemString = `id:17517 `; iCumRate +=1;} //0.387596899더스틴 실버 나이트 그리브
					case(19){itemString = `id:18548 `; iCumRate +=1;} //0.387596899더스틴 실버 나이트 헬름
					case(20){itemString = `id:15316 `; iCumRate +=1;} //0.387596899카리스 위자드 수트
					case(21){itemString = `id:17128 `; iCumRate +=1;} //0.387596899카리스 위자드 슈즈
					case(22){itemString = `id:13032 `; iCumRate +=1;} //0.387596899발렌시아 크로스 라인 플레이트 아머(여성용)
					case(23){itemString = `id:13033 `; iCumRate +=1;} //0.387596899발렌시아 크로스 라인 플레이트 아머(남성용)
					case(24){itemString = `id:16521 `; iCumRate +=1;} //0.387596899발렌시아 크로스 라인 플레이트 건틀렛
					case(25){itemString = `id:17514 `; iCumRate +=1;} //0.387596899발렌시아 크로스 라인 플레이트 부츠
					case(26){itemString = `id:40033 durability:15000 durability_max:15000`; iCumRate +=1;} //0.387596899클레이모어
					case(27){itemString = `id:40081 durability:13000 durability_max:13000`; iCumRate +=1;} //0.387596899레더 롱 보우
					case(28){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899힐링 원드
					case(29){itemString = `id:40080 durability:15000 durability_max:15000`; iCumRate +=1;} //0.387596899글라디우스
					case(30){itemString = `id:40038 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899라이트닝 원드
					case(31){itemString = `id:40039 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899아이스 원드
					case(32){itemString = `id:40040 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899파이어 원드
					case(33){itemString = `id:40041 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899타격용 원드
					case(34){itemString = `id:40078 durability:14000 durability_max:14000`; iCumRate +=1;} //0.387596899비펜니스
					case(35){itemString = `id:40079 durability:16000 durability_max:16000`; iCumRate +=1;} //0.387596899메이스
					case(36){itemString = `id:40031 durability:15000 durability_max:15000`; iCumRate +=1;} //0.387596899석궁
					case(37){itemString = `id:40030 durability:14000 durability_max:14000`; iCumRate +=1;} //0.387596899투 핸디드 소드
					case(38){itemString = `id:40013 durability:12000 durability_max:12000`; iCumRate +=1;} //0.387596899롱 보우
					case(39){itemString = `id:40107 durability:20000 durability_max:20000`; iCumRate +=1;} //0.387596899가디언 보우
					case(40){itemString = `id:46007 durability:17000 durability_max:17000`; iCumRate +=1;} //0.387596899헤테로 카이트 실드
					case(41){itemString = `id:18518 `; iCumRate +=2;} //0.775193798드래곤 크레스트
					case(42){itemString = `id:15113 `; iCumRate +=2;} //0.775193798여성용 검사학교 교복 쇼트타입
					case(43){itemString = `id:15114 `; iCumRate +=2;} //0.775193798남성용 검사학교 교복 롱타입
					case(44){itemString = `id:15065 `; iCumRate +=2;} //0.775193798엘라 베스트 스커트
					case(45){itemString = `id:19008 `; iCumRate +=2;} //0.775193798코코 판다 로브
					case(46){itemString = `id:15137 `; iCumRate +=2;} //0.775193798셀리나 하프 재킷 코트
					case(47){itemString = `id:18041 `; iCumRate +=2;} //0.775193798큰 챙 깃털 모자
					case(48){itemString = `id:19009 `; iCumRate +=2;} //0.775193798코코 래빗 로브
					case(49){itemString = `id:18112 `; iCumRate +=2;} //0.775193798해 분장 소품
					case(50){itemString = `id:15055 `; iCumRate +=2;} //0.775193798레더 미니 원피스
					case(51){itemString = `id:15057 `; iCumRate +=2;} //0.775193798롱 레더 코트 (무광)
					case(52){itemString = `id:16531 `; iCumRate +=2;} //0.775193798티오즈 건틀렛
					case(53){itemString = `id:17523 `; iCumRate +=2;} //0.775193798티오즈 그리브
					case(54){itemString = `id:15070 `; iCumRate +=2;} //0.775193798스탠드칼라 슬리브리스
					case(55){itemString = `id:15230 `; iCumRate +=2;} //0.775193798가르텐 글렌 체크 스커트
					case(56){itemString = `id:19034 `; iCumRate +=2;} //0.775193798가르텐 클로스 오버코트
					case(57){itemString = `id:40033 `; iCumRate +=2;} //0.775193798클레이모어
					case(58){itemString = `id:13043 `; iCumRate +=2;} //0.775193798레미니아 성월의 갑옷(남성용)
					case(59){itemString = `id:13044 `; iCumRate +=2;} //0.775193798레미니아 성월의 갑옷(여성용)
					case(60){itemString = `id:13045 `; iCumRate +=2;} //0.775193798아리쉬 아슈빈 아머(남성용)
					case(61){itemString = `id:13046 `; iCumRate +=2;} //0.775193798아리쉬 아슈빈 아머(여성용)
					case(62){itemString = `id:14019 `; iCumRate +=2;} //0.775193798그레이스 플레이트 아머
					case(63){itemString = `id:13031 `; iCumRate +=2;} //0.775193798스파이카 실버 플레이트 아머
					case(64){itemString = `id:13022 `; iCumRate +=2;} //0.775193798로즈 플레이트 아머 (P타입)
					case(65){itemString = `id:18542 `; iCumRate +=2;} //0.775193798빅 체인 풀 헬름
					case(66){itemString = `id:18506 `; iCumRate +=2;} //0.775193798윙 하프 헬름
					case(67){itemString = `id:14042 `; iCumRate +=2;} //0.775193798컬스틴 레더 아머
					case(68){itemString = `id:18045 `; iCumRate +=2;} //0.775193798별장식 마법사 모자
					case(69){itemString = `id:13010 `; iCumRate +=2;} //0.775193798라운드 폴드론 체인메일
					case(70){itemString = `id:14025 `; iCumRate +=2;} //0.775193798카멜 스피리트 아머(남성용)
					case(71){itemString = `id:14026 `; iCumRate +=2;} //0.775193798카멜 스피리트 아머(여성용)
					case(72){itemString = `id:16028 `; iCumRate +=2;} //0.775193798카멜 스피리트 글러브
					case(73){itemString = `id:16511 `; iCumRate +=2;} //0.775193798실버 티니 글러브
					case(74){itemString = `id:17064 `; iCumRate +=2;} //0.775193798카멜 스피리트 부츠
					case(75){itemString = `id:16534 `; iCumRate +=2;} //0.775193798컬스틴 레더 건틀렛
					case(76){itemString = `id:17524 `; iCumRate +=2;} //0.775193798컬스틴 레더 부츠
					case(77){itemString = `id:13047 `; iCumRate +=2;} //0.775193798키리누스진 하프 플레이트 아머(남성용)
					case(78){itemString = `id:13048 `; iCumRate +=2;} //0.775193798키리누스진 하프 플레이트 아머(여성용)
					case(79){itemString = `id:14038 `; iCumRate +=2;} //0.775193798피르타 레더 아머 B타입(여성용)
					case(80){itemString = `id:18111 `; iCumRate +=2;} //0.775193798나무 분장 소품
					case(81){itemString = `id:18110 `; iCumRate +=2;} //0.775193798덤불 분장 소품
					case(82){itemString = `id:18109 `; iCumRate +=2;} //0.775193798나오 분장 소품
					case(83){itemString = `id:18108 `; iCumRate +=2;} //0.775193798바위 분장 소품
					case(84){itemString = `id:40083 `; iCumRate +=2;} //0.775193798훅 커틀러스
					case(85){itemString = `id:40032 `; iCumRate +=2;} //0.775193798가고일 소드
					case(86){itemString = `id:18544 `; iCumRate +=2;} //0.775193798펠리칸 프로텍터
					case(87){itemString = `id:18547 `; iCumRate +=2;} //0.775193798파나쉬 헤드 프로텍터
					case(88){itemString = `id:18521 `; iCumRate +=2;} //0.775193798유러피안 컴프
					case(89){itemString = `id:18500 `; iCumRate +=2;} //0.775193798링 메일 헬름
					case(90){itemString = `id:18511 `; iCumRate +=2;} //0.775193798플루트 풀 헬름
					case(91){itemString = `id:18502 `; iCumRate +=2;} //0.775193798본 헬름
					case(92){itemString = `id:19007 `; iCumRate +=2;} //0.775193798야광 머플러 로브
					case(93){itemString = `id:19017 `; iCumRate +=2;} //0.775193798늑대 로브
					case(94){itemString = `id:19016 `; iCumRate +=2;} //0.775193798곰 로브
					case(95){itemString = `id:15112 `; iCumRate +=2;} //0.775193798셀리나 스쿨보이룩
					case(96){itemString = `id:18034 `; iCumRate +=2;} //0.775193798볼륨 베레모
					case(97){itemString = `id:18006 `; iCumRate +=2;} //0.775193798마법사모자
					case(98){itemString = `id:18113 `; iCumRate +=2;} //0.775193798뾰족귀 고양이 모자
					case(99){itemString = `id:18114 `; iCumRate +=2;} //0.775193798줄무늬 고양이 모자
					case(100){itemString = `id:18115 `; iCumRate +=2;} //0.775193798핀 고양이 모자
					case(101){itemString = `id:18097 `; iCumRate +=2;} //0.775193798세이렌 깃털 가면
					case(102){itemString = `id:18098 `; iCumRate +=2;} //0.775193798세이렌의 안경
					case(103){itemString = `id:18099 `; iCumRate +=2;} //0.775193798세이렌 작은 날개 가면
					case(104){itemString = `id:18100 `; iCumRate +=2;} //0.775193798세이렌 날개 가면
					case(105){itemString = `id:18101 `; iCumRate +=2;} //0.775193798세이렌 박쥐 날개 가면
					case(106){itemString = `id:18102 `; iCumRate +=2;} //0.775193798세이렌의 가면
					case(107){itemString = `id:18096 `; iCumRate +=2;} //0.775193798세이렌 고양이 가면
					case(108){itemString = `id:18044 `; iCumRate +=2;} //0.775193798범죄용 복면
					case(109){itemString = `id:51002 count:5`; iCumRate +=3;} //1.162790698생명력 30 포션
					case(110){itemString = `id:51007 count:5`; iCumRate +=3;} //1.162790698마나 30 포션
					case(111){itemString = `id:51012 count:5`; iCumRate +=3;} //1.162790698스태미나 30 포션
					case(112){itemString = `id:51003 count:5`; iCumRate +=3;} //1.162790698생명력 50 포션
					case(113){itemString = `id:51008 count:5`; iCumRate +=3;} //1.162790698마나 50 포션
					case(114){itemString = `id:51013 count:5`; iCumRate +=3;} //1.162790698스태미나 50 포션
					case(115){itemString = `id:51004 count:3`; iCumRate +=3;} //1.162790698생명력 100 포션
					case(116){itemString = `id:51009 count:3`; iCumRate +=3;} //1.162790698마나 100 포션
					case(117){itemString = `id:51014 count:3`; iCumRate +=3;} //1.162790698스태미나 100 포션
					case(118){itemString = `id:51005 `; iCumRate +=3;} //1.162790698생명력 300 포션
					case(119){itemString = `id:51010 `; iCumRate +=3;} //1.162790698마나 300 포션
					case(120){itemString = `id:51015 `; iCumRate +=3;} //1.162790698스태미나 300 포션
					case(121){itemString = `id:51022 count:5`; iCumRate +=3;} //1.162790698생명력과 마나 30 포션
					case(122){itemString = `id:51023 count:5`; iCumRate +=3;} //1.162790698생명력과 마나 50 포션
					case(123){itemString = `id:51024count:3`; iCumRate +=3;} //1.162790698생명력과 마나 100 포션
					case(124){itemString = `id:51025`; iCumRate +=3;} //1.162790698생명력과 마나 300 포션
					case(125){itemString = `id:51027 count:5`; iCumRate +=3;} //1.162790698생명력과 스태미나 30 포션
					case(126){itemString = `id:51028 count:5`; iCumRate +=3;} //1.162790698생명력과 스태미나 50 포션
					case(127){itemString = `id:51029 count:3`; iCumRate +=3;} //1.162790698생명력과 스태미나 100 포션
					case(128){itemString = `id:51030`; iCumRate +=3;} //1.162790698생명력과 스태미나 300 포션
					case(129){itemString = `id:63016 count:5`; iCumRate +=3;} //1.162790698축복의 포션
					case(130){itemString = `id:63225 count:3`; iCumRate +=3;} //1.162790698성화
					case(131){itemString = `id:51046`; iCumRate +=3;} //1.162790698호감도 포션
					case(132){itemString = `id:51101 count:10`; iCumRate +=3;} //1.162790698블러디 허브
					case(133){itemString = `id:51102 count:10`; iCumRate +=3;} //1.162790698마나 허브
					case(134){itemString = `id:51103 count:10`; iCumRate +=3;} //1.162790698선라이트 허브
					case(135){itemString = `id:51107 count:10`; iCumRate +=3;} //1.162790698화이트 허브
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
				++i;
			}
		}
	}
		if (GetLocale().LowerCase() == `taiwan`)
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(256);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:15352 `; iCumRate +=1;} //0.390625천룡지의(남성용)
					case(1){itemString = `id:15353 `; iCumRate +=1;} //0.390625천룡지의(여성용)
					case(2){itemString = `id:17139 `; iCumRate +=1;} //0.390625천룡지화
					case(3){itemString = `id:15269 `; iCumRate +=1;} //0.390625항아의 날개옷 
					case(4){itemString = `id:46027 `; iCumRate +=1;} //0.390625타지 실드
					case(5){itemString = `id:15602 `; iCumRate +=1;} //0.390625레이모어 의상
					case(6){itemString = `id:17236 `; iCumRate +=1;} //0.390625레이모어 신발
					case(7){itemString = `id:15601 `; iCumRate +=1;} //0.390625케이 의상
					case(8){itemString = `id:17235 `; iCumRate +=1;} //0.390625케이 신발
					case(9){itemString = `id:15420 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 수트(여)
					case(10){itemString = `id:15419 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 수트(남)
					case(11){itemString = `id:18248 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 모자
					case(12){itemString = `id:18249 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 헤어밴드
					case(13){itemString = `id:17163 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 부츠
					case(14){itemString = `id:17162 `; iCumRate +=1;} //0.390625에메랄드 켈틱 패턴 신발
					case(15){itemString = `id:18569 `; iCumRate +=1;} //0.390625devCAT 모자
					case(16){itemString = `id:18237 `; iCumRate +=1;} //0.390625딕 스티치 마스크
					case(17){itemString = `id:40250 `; iCumRate +=1;} //0.390625메탈 파이어 원드
					case(18){itemString = `id:40171 `; iCumRate +=1;} //0.390625마사무네
					case(19){itemString = `id:13038 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625더스틴 실버 나이트 아머
					case(20){itemString = `id:16524 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625더스틴 실버 나이트 뱀브레이스
					case(21){itemString = `id:17517 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625더스틴 실버 나이트 그리브
					case(22){itemString = `id:13032 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625발렌시아 크로스 라인 플레이트 아머(여성용)
					case(23){itemString = `id:13033 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625발렌시아 크로스 라인 플레이트 아머(남성용)
					case(24){itemString = `id:13052 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625발렌시아 크로스 라인 플레이트 아머(자이언트)
					case(25){itemString = `id:16521 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625발렌시아 크로스 라인 플레이트 건틀렛
					case(26){itemString = `id:17514 col1:7070FF col2:7070FF col3:7070FF`; iCumRate +=1;} //0.390625발렌시아 크로스 라인 플레이트 부츠
					case(27){itemString = `id:46004 suffix:31014`; iCumRate +=1;} //0.390625냄비(심해의)
					case(28){itemString = `id:15117 suffix:31301`; iCumRate +=1;} //0.390625남성용 마법사 정장
					case(29){itemString = `id:15116 suffix:31301`; iCumRate +=1;} //0.390625여성용 마법사 정장
					case(30){itemString = `id:15298 `; iCumRate +=1;} //0.390625아처리스 스쿨웨어
					case(31){itemString = `id:15079 `; iCumRate +=1;} //0.390625볼레로 앤 점퍼 스커트
					case(32){itemString = `id:15222 `; iCumRate +=1;} //0.390625그레이스 숄 드레스(여성용)
					case(33){itemString = `id:16046 `; iCumRate +=1;} //0.390625고양이 손 장갑
					case(34){itemString = `id:18187 `; iCumRate +=1;} //0.390625커다란 리본
					case(35){itemString = `id:18188 `; iCumRate +=1;} //0.390625안대
					case(36){itemString = `id:18189 `; iCumRate +=1;} //0.390625카우보이 모자
					case(37){itemString = `id:15252 `; iCumRate +=1;} //0.390625집사 의상
					case(38){itemString = `id:19005 `; iCumRate +=1;} //0.390625머플러 로브
					case(39){itemString = `id:18161 `; iCumRate +=1;} //0.390625데브캣 귀마개
					case(40){itemString = `id:18157 `; iCumRate +=1;} //0.390625고양이 귀 머리띠
					case(41){itemString = `id:40081 durability:15000 durability_max:15000 prefix:20701 suffix:31103`; iCumRate +=1;} //0.390625레더 롱 보우
					case(42){itemString = `id:40080 durability:17000 durability_max:17000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.390625글라디우스
					case(43){itemString = `id:40038 durability:14000 durability_max:14000 prefix:8 suffix:31103`; iCumRate +=1;} //0.390625라이트닝 원드
					case(44){itemString = `id:40079 durability:18000 durability_max:18000 prefix:20625 suffix:31103`; iCumRate +=1;} //0.390625메이스
					case(45){itemString = `id:15267 `; iCumRate +=1;} //0.390625테라 고딕 풀 드레스
					case(46){itemString = `id:15268 `; iCumRate +=1;} //0.390625테라 고딕 펑크 수트
					case(47){itemString = `id:19005 `; iCumRate +=1;} //0.390625머플러 로브
					case(48){itemString = `id:15217 `; iCumRate +=1;} //0.390625에이프런 원피스
					case(49){itemString = `id:18161 `; iCumRate +=1;} //0.390625데브캣 귀마개
					case(50){itemString = `id:18157 `; iCumRate +=1;} //0.390625고양이 귀 머리띠
					case(51){itemString = `id:15233 `; iCumRate +=1;} //0.390625엘레건트 고딕 드레스
					case(52){itemString = `id:15234 `; iCumRate +=1;} //0.390625엘레건트 고딕 슈트
					case(53){itemString = `id:15235 `; iCumRate +=1;} //0.390625엘레건트 고딕 드레스
					case(54){itemString = `id:15233 `; iCumRate +=1;} //0.390625엘레건트 고딕 드레스
					case(55){itemString = `id:15234 `; iCumRate +=1;} //0.390625엘레건트 고딕 슈트
					case(56){itemString = `id:15235 `; iCumRate +=1;} //0.390625엘레건트 고딕 드레스
					case(57){itemString = `id:40095 durability:18000 durability_max:18000`; iCumRate +=1;} //0.390625드래곤 블레이드
					case(58){itemString = `id:40033 durability:19000 durability_max:19000`; iCumRate +=1;} //0.390625클레이모어
					case(59){itemString = `id:40090 durability:16000 durability_max:16000`; iCumRate +=1;} //0.390625힐링 원드
					case(60){itemString = `id:40039 durability:16000 durability_max:16000`; iCumRate +=1;} //0.390625아이스 원드
					case(61){itemString = `id:40040 durability:16000 durability_max:16000`; iCumRate +=1;} //0.390625파이어 원드
					case(62){itemString = `id:40041 durability:16000 durability_max:16000`; iCumRate +=1;} //0.390625타격용 원드
					case(63){itemString = `id:40078 durability:20000 durability_max:20000`; iCumRate +=1;} //0.390625비펜니스
					case(64){itemString = `id:40031 durability:19000 durability_max:19000`; iCumRate +=1;} //0.390625석궁
					case(65){itemString = `id:40030 durability:18000 durability_max:18000`; iCumRate +=1;} //0.390625투 핸디드 소드
					case(66){itemString = `id:40013 durability:16000 durability_max:16000`; iCumRate +=1;} //0.390625롱 보우
					case(67){itemString = `id:40107 durability:24000 durability_max:24000`; iCumRate +=1;} //0.390625가디언 보우
					case(68){itemString = `id:46007 durability:21000 durability_max:21000`; iCumRate +=1;} //0.390625헤테로 카이트 실드
					case(69){itemString = `id:40170 `; iCumRate +=1;} //0.390625일본식 양손검
					case(70){itemString = `id:62005 suffix:30515`; iCumRate +=1;} //0.390625해적의
					case(71){itemString = `id:62005 prefix:20505`; iCumRate +=1;} //0.390625리자드
					case(72){itemString = `id:62005 prefix:21007`; iCumRate +=1;} //0.390625히스
					case(73){itemString = `id:62005 prefix:20625`; iCumRate +=1;} //0.390625금속 바늘
					case(74){itemString = `id:62005 suffix:30624`; iCumRate +=1;} //0.390625산사나무
					case(75){itemString = `id:62005 prefix:20721`; iCumRate +=1;} //0.390625한가한
					case(76){itemString = `id:62005 suffix:30918`; iCumRate +=1;} //0.390625마나 위자드|마나 위자드(suffix)
					case(77){itemString = `id:62005 suffix:30632`; iCumRate +=1;} //0.390625버스트 나이트|버스트 나이트(suffix)
					case(78){itemString = `id:62005 suffix:30525`; iCumRate +=1;} //0.390625마나 서머너|마나 서머너(suffix)
					case(79){itemString = `id:62005 suffix:30418`; iCumRate +=1;} //0.390625포이즌 스나이퍼|포이즌 스나이퍼(suffix)
					case(80){itemString = `id:18518 `; iCumRate +=1;} //0.390625드래곤 크레스트
					case(81){itemString = `id:15113 `; iCumRate +=1;} //0.390625여성용 검사학교 교복 쇼트타입
					case(82){itemString = `id:15114 `; iCumRate +=1;} //0.390625남성용 검사학교 교복 롱타입
					case(83){itemString = `id:15065 `; iCumRate +=1;} //0.390625엘라 베스트 스커트
					case(84){itemString = `id:19008 `; iCumRate +=1;} //0.390625코코 판다 로브
					case(85){itemString = `id:15137 `; iCumRate +=1;} //0.390625셀리나 하프 재킷 코트
					case(86){itemString = `id:18041 `; iCumRate +=1;} //0.390625큰 챙 깃털 모자
					case(87){itemString = `id:19009 `; iCumRate +=1;} //0.390625코코 래빗 로브
					case(88){itemString = `id:18112 `; iCumRate +=1;} //0.390625해 분장 소품
					case(89){itemString = `id:18111 `; iCumRate +=1;} //0.390625나무 분장 소품
					case(90){itemString = `id:18110 `; iCumRate +=1;} //0.390625덤불 분장 소품
					case(91){itemString = `id:18109 `; iCumRate +=1;} //0.390625나오 분장 소품
					case(92){itemString = `id:18108 `; iCumRate +=1;} //0.390625바위 분장 소품
					case(93){itemString = `id:40083 `; iCumRate +=1;} //0.390625훅 커틀러스
					case(94){itemString = `id:40032 `; iCumRate +=1;} //0.390625가고일 소드
					case(95){itemString = `id:18544 `; iCumRate +=1;} //0.390625펠리칸 프로텍터
					case(96){itemString = `id:18547 `; iCumRate +=1;} //0.390625파나쉬 헤드 프로텍터
					case(97){itemString = `id:18521 `; iCumRate +=1;} //0.390625유러피안 컴프
					case(98){itemString = `id:18500 `; iCumRate +=1;} //0.390625링 메일 헬름
					case(99){itemString = `id:18511 `; iCumRate +=1;} //0.390625플루트 풀 헬름
					case(100){itemString = `id:18502 `; iCumRate +=1;} //0.390625본 헬름
					case(101){itemString = `id:19007 `; iCumRate +=1;} //0.390625야광 머플러 로브
					case(102){itemString = `id:19017 `; iCumRate +=1;} //0.390625늑대 로브
					case(103){itemString = `id:19016 `; iCumRate +=1;} //0.390625곰 로브
					case(104){itemString = `id:15112 `; iCumRate +=1;} //0.390625셀리나 스쿨보이룩
					case(105){itemString = `id:18034 `; iCumRate +=1;} //0.390625볼륨 베레모
					case(106){itemString = `id:18006 `; iCumRate +=1;} //0.390625마법사모자
					case(107){itemString = `id:18113 `; iCumRate +=1;} //0.390625뾰족귀 고양이 모자
					case(108){itemString = `id:18114 `; iCumRate +=1;} //0.390625줄무늬 고양이 모자
					case(109){itemString = `id:18115 `; iCumRate +=1;} //0.390625핀 고양이 모자
					case(110){itemString = `id:18097 `; iCumRate +=1;} //0.390625세이렌 깃털 가면
					case(111){itemString = `id:18098 `; iCumRate +=1;} //0.390625세이렌의 안경
					case(112){itemString = `id:18099 `; iCumRate +=1;} //0.390625세이렌 작은 날개 가면
					case(113){itemString = `id:18100 `; iCumRate +=1;} //0.390625세이렌 날개 가면
					case(114){itemString = `id:18101`; iCumRate +=1;} //0.390625세이렌 박쥐 날개 가면
					case(115){itemString = `id:18102 `; iCumRate +=1;} //0.390625세이렌의 가면
					case(116){itemString = `id:15055 `; iCumRate +=1;} //0.390625세이렌 고양이 가면
					case(117){itemString = `id:18044 `; iCumRate +=1;} //0.390625범죄용 복면
					case(118){itemString = `id:40071 `; iCumRate +=1;} //0.390625'라' 음 빈 병
					case(119){itemString = `id:40072 `; iCumRate +=1;} //0.390625'시' 음 빈 병
					case(120){itemString = `id:40073 `; iCumRate +=1;} //0.390625'도' 음 빈 병
					case(121){itemString = `id:40074 `; iCumRate +=1;} //0.390625'레' 음 빈 병
					case(122){itemString = `id:40075 `; iCumRate +=1;} //0.390625'미' 음 빈 병
					case(123){itemString = `id:40076 `; iCumRate +=1;} //0.390625'파' 음 빈 병
					case(124){itemString = `id:40077 `; iCumRate +=1;} //0.390625'솔' 음 빈 병
					case(125){itemString = `id:16517 `; iCumRate +=1;} //0.390625반대 장갑
					case(126){itemString = `id:16516 `; iCumRate +=1;} //0.390625찬성 장갑
					case(127){itemString = `id:16515 `; iCumRate +=1;} //0.390625보 장갑
					case(128){itemString = `id:16514 `; iCumRate +=1;} //0.390625바위 장갑
					case(129){itemString = `id:16513 `; iCumRate +=1;} //0.390625가위 장갑
					case(130){itemString = `id:40068 `; iCumRate +=1;} //0.390625가위 모양 지시봉
					case(131){itemString = `id:40069 `; iCumRate +=1;} //0.390625바위 모양 지시봉
					case(132){itemString = `id:40070 `; iCumRate +=1;} //0.390625보 모양 지시봉
					case(133){itemString = `id:17015 `; iCumRate +=1;} //0.390625Combat Shoes
					case(134){itemString = `id:15055 `; iCumRate +=1;} //0.390625레더 미니 원피스
					case(135){itemString = `id:15057 `; iCumRate +=1;} //0.390625롱 레더 코트 (무광)
					case(136){itemString = `id:18040 `; iCumRate +=1;} //0.390625코레스 꼭지 베레모
					case(137){itemString = `id:80000 `; iCumRate +=1;} //0.390625나오의 검은 옷
					case(138){itemString = `id:80001 `; iCumRate +=1;} //0.390625루아의 옷
					case(139){itemString = `id:80002 `; iCumRate +=1;} //0.390625핑크색 코트
					case(140){itemString = `id:80003 `; iCumRate +=1;} //0.390625검은색 코트
					case(141){itemString = `id:80004 `; iCumRate +=1;} //0.390625나오의 노란색 봄 옷
					case(142){itemString = `id:80005 `; iCumRate +=1;} //0.390625나오의 하얀색 봄 옷
					case(143){itemString = `id:80006 `; iCumRate +=1;} //0.390625나오의 핑크색 봄 옷
					case(144){itemString = `id:14036 `; iCumRate +=1;} //0.390625티오즈 아머(남성용)
					case(145){itemString = `id:14037 `; iCumRate +=1;} //0.390625티오즈 아머(여성용)
					case(146){itemString = `id:16531 `; iCumRate +=1;} //0.390625티오즈 건틀렛
					case(147){itemString = `id:17523 `; iCumRate +=1;} //0.390625티오즈 그리브
					case(148){itemString = `id:15132 `; iCumRate +=1;} //0.390625내추럴 베스트 웨어
					case(149){itemString = `id:15070 `; iCumRate +=1;} //0.390625스탠드칼라 슬리브리스
					case(150){itemString = `id:15230 `; iCumRate +=1;} //0.390625가르텐 글렌 체크 스커트
					case(151){itemString = `id:19034 `; iCumRate +=1;} //0.390625가르텐 클로스 오버코트
					case(152){itemString = `id:40033 `; iCumRate +=1;} //0.390625클레이모어
					case(153){itemString = `id:40011 `; iCumRate +=1;} //0.390625브로드 소드
					case(154){itemString = `id:40030 `; iCumRate +=1;} //0.390625투 핸디드 소드
					case(155){itemString = `id:40012 `; iCumRate +=1;} //0.390625바스타드 소드
					case(156){itemString = `id:40007 `; iCumRate +=1;} //0.390625한손도끼
					case(157){itemString = `id:40014 `; iCumRate +=1;} //0.390625콤포짓 보우
					case(158){itemString = `id:40078 `; iCumRate +=1;} //0.390625비펜니스
					case(159){itemString = `id:40080 `; iCumRate +=1;} //0.390625글라디우스
					case(160){itemString = `id:40006 `; iCumRate +=1;} //0.390625단검
					case(161){itemString = `id:40031 `; iCumRate +=1;} //0.390625석궁
					case(162){itemString = `id:40081 `; iCumRate +=1;} //0.390625레더 롱 보우
					case(163){itemString = `id:40079 `; iCumRate +=1;} //0.390625메이스
					case(164){itemString = `id:13043 `; iCumRate +=1;} //0.390625레미니아 성월의 갑옷(남성용)
					case(165){itemString = `id:13044 `; iCumRate +=1;} //0.390625레미니아 성월의 갑옷(여성용)
					case(166){itemString = `id:13045 `; iCumRate +=1;} //0.390625아리쉬 아슈빈 아머(남성용)
					case(167){itemString = `id:13046 `; iCumRate +=1;} //0.390625아리쉬 아슈빈 아머(여성용)
					case(168){itemString = `id:14019 `; iCumRate +=1;} //0.390625그레이스 플레이트 아머
					case(169){itemString = `id:13031 `; iCumRate +=1;} //0.390625스파이카 실버 플레이트 아머
					case(170){itemString = `id:13022 `; iCumRate +=1;} //0.390625로즈 플레이트 아머 (P타입)
					case(171){itemString = `id:40039 `; iCumRate +=1;} //0.390625아이스 원드
					case(172){itemString = `id:40090 `; iCumRate +=1;} //0.390625힐링 원드
					case(173){itemString = `id:40040 `; iCumRate +=1;} //0.390625파이어 원드
					case(174){itemString = `id:40038 `; iCumRate +=1;} //0.390625라이트닝 원드
					case(175){itemString = `id:18542 `; iCumRate +=1;} //0.390625빅 체인 풀 헬름
					case(176){itemString = `id:18506 `; iCumRate +=1;} //0.390625윙 하프 헬름
					case(177){itemString = `id:14042 `; iCumRate +=1;} //0.390625컬스틴 레더 아머
					case(178){itemString = `id:15155 `; iCumRate +=1;} //0.390625이디카이 성직자 예복(남성용)
					case(179){itemString = `id:15156 `; iCumRate +=1;} //0.390625이디카이 성직자 예복(여성용)
					case(180){itemString = `id:15151 `; iCumRate +=1;} //0.390625뉴욕마리오 웨이스트 테일러 웨어(남성용)
					case(181){itemString = `id:15152 `; iCumRate +=1;} //0.390625뉴욕마리오 웨이스트 테일러 웨어(여성용)
					case(182){itemString = `id:15153 `; iCumRate +=1;} //0.390625산드라 스나이퍼 수트(남성용)
					case(183){itemString = `id:15154 `; iCumRate +=1;} //0.390625산드라 스나이퍼 수트(여성용)
					case(184){itemString = `id:15157 `; iCumRate +=1;} //0.390625위스 보위군 의복(남성용)
					case(185){itemString = `id:15158 `; iCumRate +=1;} //0.390625위스 보위군 의복(여성용)
					case(186){itemString = `id:15115 `; iCumRate +=1;} //0.390625재기드 미니 스커트
					case(187){itemString = `id:15059 `; iCumRate +=1;} //0.390625터크스 탱크탑 반바지
					case(188){itemString = `id:15070 `; iCumRate +=1;} //0.390625아이돌 리본 드레스
					case(189){itemString = `id:15074 `; iCumRate +=1;} //0.390625루이스 성직자 코트
					case(190){itemString = `id:15061 `; iCumRate +=1;} //0.390625물결무늬 옆트임 튜닉
					case(191){itemString = `id:18045 `; iCumRate +=1;} //0.390625별장식 마법사 모자
					case(192){itemString = `id:18019 `; iCumRate +=1;} //0.390625리리나 깃털모자
					case(193){itemString = `id:18020 `; iCumRate +=1;} //0.390625몬거 깃털모자
					case(194){itemString = `id:18029 `; iCumRate +=1;} //0.390625나무테 안경
					case(195){itemString = `id:18028 `; iCumRate +=1;} //0.390625접이식 안경
					case(196){itemString = `id:13010 `; iCumRate +=1;} //0.390625라운드 폴드론 체인메일
					case(197){itemString = `id:14025 `; iCumRate +=1;} //0.390625카멜 스피리트 아머(남성용)
					case(198){itemString = `id:14026 `; iCumRate +=1;} //0.390625카멜 스피리트 아머(여성용)
					case(199){itemString = `id:16028 `; iCumRate +=1;} //0.390625카멜 스피리트 글러브
					case(200){itemString = `id:17064 `; iCumRate +=1;} //0.390625카멜 스피리트 부츠
					case(201){itemString = `id:15131 `; iCumRate +=1;} //0.390625핀 에이프런 스커트
					case(202){itemString = `id:2006 `; iCumRate +=1;} //0.390625큰 금화 주머니
					case(203){itemString = `id:16534 `; iCumRate +=1;} //0.390625컬스틴 레더 건틀렛
					case(204){itemString = `id:17524 `; iCumRate +=1;} //0.390625컬스틴 레더 부츠
					case(205){itemString = `id:13047 `; iCumRate +=1;} //0.390625키리누스진 하프 플레이트 아머(남성용)
					case(206){itemString = `id:13048 `; iCumRate +=1;} //0.390625키리누스진 하프 플레이트 아머(여성용)
					case(207){itemString = `id:14013 `; iCumRate +=1;} //0.390625로리카 세그먼타타에
					case(208){itemString = `id:14035 `; iCumRate +=1;} //0.390625피르타 레더 아머
					case(209){itemString = `id:14038 `; iCumRate +=1;} //0.390625피르타 레더 아머 B타입(여성용)
					case(210){itemString = `id:15028 `; iCumRate +=1;} //0.390625코레스 씨프슈트
					case(211){itemString = `id:15042 `; iCumRate +=1;} //0.390625롱넥 원피스
					case(212){itemString = `id:15052 `; iCumRate +=1;} //0.390625터크스 투톤 튜닉
					case(213){itemString = `id:15053 `; iCumRate +=1;} //0.390625플랫칼라 원피스
					case(214){itemString = `id:15128 `; iCumRate +=1;} //0.390625투 톤 비조 드레스
					case(215){itemString = `id:15136 `; iCumRate +=1;} //0.390625모험가 슈트
					case(216){itemString = `id:16008 `; iCumRate +=1;} //0.390625코레스 씨프 글러브
					case(217){itemString = `id:16019 `; iCumRate +=1;} //0.390625줄무늬 팔목 장갑
					case(218){itemString = `id:16040 `; iCumRate +=1;} //0.390625콜린 빅센 글러브
					case(219){itemString = `id:16505 `; iCumRate +=1;} //0.390625플루트 건틀렛
					case(220){itemString = `id:16520 `; iCumRate +=1;} //0.390625롱 레더 글러브
					case(221){itemString = `id:17040 `; iCumRate +=1;} //0.390625엘라 스트랩 부츠
					case(222){itemString = `id:17041 `; iCumRate +=1;} //0.390625덩굴무늬 헌팅부츠
					case(223){itemString = `id:17045 `; iCumRate +=1;} //0.390625브이 넥 라인 레더 부츠
					case(224){itemString = `id:17071 `; iCumRate +=1;} //0.390625니하이 부츠
					case(225){itemString = `id:17087 `; iCumRate +=1;} //0.390625콜린 빅센 부츠
					case(226){itemString = `id:17506 `; iCumRate +=1;} //0.390625롱그리브 부츠
					case(227){itemString = `id:17522 `; iCumRate +=1;} //0.390625피르타 레더 부츠
					case(228){itemString = `id:18008 `; iCumRate +=1;} //0.390625스트라이프 캡
					case(229){itemString = `id:18038 `; iCumRate +=1;} //0.390625깃털 배렛 모자
					case(230){itemString = `id:18047 `; iCumRate +=1;} //0.390625코레스 펠트 모자
					case(231){itemString = `id:18513 `; iCumRate +=1;} //0.390625스파이크 캡
					case(232){itemString = `id:18515 `; iCumRate +=1;} //0.390625트윈 혼 캡
					case(233){itemString = `id:18525 `; iCumRate +=1;} //0.390625워터드롭 캡
					case(234){itemString = `id:18543 `; iCumRate +=1;} //0.390625슬릿 풀 헬름
					case(235){itemString = `id:19020 `; iCumRate +=1;} //0.390625나타네 설산용 코트
					case(236){itemString = `id:19029 `; iCumRate +=1;} //0.390625자이언트 베어 로브
					case(237){itemString = `id:40015 `; iCumRate +=1;} //0.390625플루트 숏 소드
					case(238){itemString = `id:40081 `; iCumRate +=1;} //0.390625롱 보우
					case(239){itemString = `id:46001 `; iCumRate +=1;} //0.390625라운드 실드
					case(240){itemString = `id:46006 `; iCumRate +=1;} //0.390625카이트 실드
					case(241){itemString = `id:40172 `; iCumRate +=1;} //0.390625그레이트 소드
					case(242){itemString = `id:40174 `; iCumRate +=1;} //0.390625모닝스타
					case(243){itemString = `id:40177 `; iCumRate +=1;} //0.390625워리어 액스
					case(244){itemString = `id:40180 `; iCumRate +=1;} //0.390625홉네일 너클
					case(245){itemString = `id:40041 `; iCumRate +=1;} //0.390625타격용 원드
					case(246){itemString = `id:16523 `; iCumRate +=1;} //0.390625그레이스 건틀렛
					case(247){itemString = `id:17515 `; iCumRate +=1;} //0.390625그레이스 그리브
					case(248){itemString = `id:18545 `; iCumRate +=1;} //0.390625그레이스 헬멧
					case(249){itemString = `id:46007 `; iCumRate +=1;} //0.390625헤테로 카이트 실드
					case(250){itemString = `id:46008 `; iCumRate +=1;} //0.390625라이트 헤테로 카이트 실드
					case(251){itemString = `id:51003 count:10`; iCumRate +=1;} //0.390625생명력 50 포션
					case(252){itemString = `id:51004 count:10`; iCumRate +=1;} //0.390625생명력 100 포션
					case(253){itemString = `id:51008 count:10`; iCumRate +=1;} //0.390625마나 50 포션
					case(254){itemString = `id:51014 count:10`; iCumRate +=1;} //0.390625스태미나 100 포션
					case(255){itemString = `id:51029 count:10`; iCumRate +=1;} //0.390625생명력과 스태미나 100 포션
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
					return itemString;
				}
				if (bAncientTreasureChestGived)
				{
					break;
				}
					++i;
			}
		}

	return ``;
}