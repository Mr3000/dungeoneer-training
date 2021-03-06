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
	//대만 칠석 가챠폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;

	iRandom = Random(3178);	//대만 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15352`; iCumRate += 1;} // 0.031466331 (칠석 남 복장) 東方龍紋武術服(男性專用)
			case(1){itemString = `id:15353`; iCumRate += 1;} // 0.031466331 (칠석 여 복장) 東方龍紋武術服(女性專用)
			case(2){itemString = `id:17139`; iCumRate += 1;} // 0.031466331 (칠석 신발) 東方龍紋武術鞋子
			case(3){itemString = `id:17139`; iCumRate += 1;} // 0.031466331 (칠석 신발) 東方龍紋武術鞋子
			case(4){itemString = `id:14049`; iCumRate += 2;} // 0.062932662 야만적인 여우 갑옷 (남성용)  野蠻狐狸盔甲(男)
			case(5){itemString = `id:14050`; iCumRate += 2;} // 0.062932662 야만적인 여우 갑옷 (여성용) 野蠻狐狸盔甲(女)
			case(6){itemString = `id:16055`; iCumRate += 2;} // 0.062932662 야만적인 여우 장갑 (남성용) 野蠻狐狸手套(男)
			case(7){itemString = `id:16056`; iCumRate += 2;} // 0.062932662 야만적인 여우 장갑 (여성용)  野蠻狐狸手套(女)
			case(8){itemString = `id:14047`; iCumRate += 2;} // 0.062932662 불꽃 문양 레더 아머 (남성용) 火花紋樣輕皮甲 (男)
			case(9){itemString = `id:14048`; iCumRate += 2;} // 0.062932662 불꽃 문양 레더 아머 (여성용) 火花紋樣輕皮甲 (女)
			case(10){itemString = `id:16054`; iCumRate += 2;} // 0.062932662 불꽃 문양 레더 글러브 火花紋樣輕皮手套
			case(11){itemString = `id:17130`; iCumRate += 2;} // 0.062932662 불꽃 문양 레더 부츠 火花紋樣輕皮靴子
			case(12){itemString = `id:18559`; iCumRate += 2;} // 0.062932662 불꽃 문양 레더 캡 火花紋樣輕皮帽子
			case(13){itemString = `id:15323`; iCumRate += 2;} // 0.062932662 알라딘 코스튬 神燈精靈裝
			case(14){itemString = `id:15324`; iCumRate += 2;} // 0.062932662 자스민 코스튬 艷麗舞孃裝
			case(15){itemString = `id:18562`; iCumRate += 2;} // 0.062932662 알라딘 모자 神燈精靈帽子
			case(16){itemString = `id:15269`; iCumRate += 2;} // 0.062932662 2007추석 아이템_항아의 날개옷 嫦娥羽裳
			case(17){itemString = `id:18182`; iCumRate += 2;} // 0.062932662 2007추석 아이템_항아의 머리장식 嫦娥髮飾
			case(18){itemString = `id:17131`; iCumRate += 2;} // 0.062932662 알라딘 슈즈 神燈精靈鞋
			case(19){itemString = `id:18563`; iCumRate += 2;} // 0.062932662 자스민 마스크 艷麗舞孃面紗
			case(20){itemString = `id:80000`; iCumRate += 4;} // 0.125865324 나오의 검은 옷 娜歐的黑色套裝
			case(21){itemString = `id:80001`; iCumRate += 4;} // 0.125865324 루아의 옷 露雅的衣服
			case(22){itemString = `id:80002`; iCumRate += 4;} // 0.125865324 핑크색 코트 粉紅外套
			case(23){itemString = `id:80003`; iCumRate += 4;} // 0.125865324 검은색 코트 黑色外套
			case(24){itemString = `id:80004`; iCumRate += 4;} // 0.125865324 나오의 노란색 봄 옷 娜歐的黃色春衣
			case(25){itemString = `id:80005`; iCumRate += 4;} // 0.125865324 나오의 하얀색 봄 옷 娜歐的白色春衣
			case(26){itemString = `id:80006`; iCumRate += 4;} // 0.125865324 나오의 핑크색 봄 옷 娜歐的粉色春衣
			case(27){itemString = `id:15151 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 뉴욕마리오 웨이스트 테일러 웨어(남성용) 紐約馬利歐  摩登高貴服(男性專用)
			case(28){itemString = `id:15152 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 뉴욕마리오 웨이스트 테일러 웨어(여성용) 紐約馬利歐  摩登高貴服(女性專用)
			case(29){itemString = `id:15153 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 산드라 스나이퍼 수트(남성용) sandra 狙擊手套裝(男性專用)
			case(30){itemString = `id:15154 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 산드라 스나이퍼 수트(여성용) sandra 狙擊手套裝(女性專用)
			case(31){itemString = `id:15155 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 이디카이 성직자 예복(남성용) yidikai 聖職者禮服(男性專用)
			case(32){itemString = `id:15156 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 이디카이 성직자 예복(여성용) yidikai 聖職者禮服(女性專用)
			case(33){itemString = `id:15157 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 위스 보위군 의복(남성용) 域斯 護衛軍儀仗服(男性專用)
			case(34){itemString = `id:15158 col1:ff6600 col2:ff6600 col3:ff6600`; iCumRate += 4;} // 0.125865324 위스 보위군 의복(여성용) 域斯 護衛軍儀仗服(女性專用)
			case(35){itemString = `id:40033 durability:18000 durability_max:18000`; iCumRate += 4;} // 0.125865324 크레이모어 神之刃雙手劍
			case(36){itemString = `id:40083 durability:15000 durability_max:15000`; iCumRate += 4;} // 0.125865324 훅커틀러스 曲鉤短劍
			case(37){itemString = `id:13047 durability:17000 durability_max:17000`; iCumRate += 4;} // 0.125865324 키리누스진 하프 플레이트 아머(남성용) Kirirusjin's 改良式硬皮甲(男性專用)
			case(38){itemString = `id:13048 durability:17000 durability_max:17000`; iCumRate += 4;} // 0.125865324 키리누스진 하프 플레이트 아머(여성용) Kirirusjin's 改良式硬皮甲(女性專用)
			case(39){itemString = `id:14005`; iCumRate += 4;} // 0.125865324 드란도스 레더메일 迪蘭多皮甲(女性專用)
			case(40){itemString = `id:14006`; iCumRate += 4;} // 0.125865324 리넨 퀴라스 亞麻鎧甲
			case(41){itemString = `id:40090 durability:12000 durability_max:12000`; iCumRate += 4;} // 0.125865324 힐링 원드 治癒魔仗
			case(42){itemString = `id:40030 durability:17000 durability_max:17000`; iCumRate += 4;} // 0.125865324 투핸드소드 雙手劍
			case(43){itemString = `id:40078 durability:17000 durability_max:17000`; iCumRate += 4;} // 0.125865324 비펜니스 雙刃斧
			case(44){itemString = `id:40017 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 14;} // 0.440528634 만돌린 曼陀林
			case(45){itemString = `id:40050 col1:ffffff col2:ffffff col3:ffffff`; iCumRate += 14;} // 0.440528634 샬루모 蕭姆管
			case(46){itemString = `id:40004 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 14;} // 0.440528634 류트 魯特琴
			case(47){itemString = `id:40048 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 14;} // 0.440528634 휘슬 口哨
			case(48){itemString = `id:40042 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 14;} // 0.440528634 식칼 菜刀
			case(49){itemString = `id:40043 col1:6100f4fa col2:6100f4fa col3:6100f4fa`; iCumRate += 14;} // 0.440528634 반죽용 밀대 桿麵棍
			case(50){itemString = `id:40044 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 14;} // 0.440528634 다용도 국자 多用途長柄勺
			case(51){itemString = `id:40045 col1:00ff00 col2:00ff00 col3:00ff00`; iCumRate += 14;} // 0.440528634 낚싯대 釣竿
			case(52){itemString = `id:40081`; iCumRate += 16;} // 0.503461296 레더 롱 보우 覆皮長弓
			case(53){itemString = `id:15023`; iCumRate += 16;} // 0.503461296 토크 사냥꾼옷 杜克獵手服
			case(54){itemString = `id:40079`; iCumRate += 16;} // 0.503461296 메이스 釘錘
			case(55){itemString = `id:40031`; iCumRate += 16;} // 0.503461296 석궁 弩
			case(56){itemString = `id:40013`; iCumRate += 16;} // 0.503461296 롱 보우 長弓
			case(57){itemString = `id:40014`; iCumRate += 16;} // 0.503461296 콤포짓 보우 複合弓
			case(58){itemString = `id:46006`; iCumRate += 16;} // 0.503461296 카이트 실드 卡特盾牌
			case(59){itemString = `id:40011`; iCumRate += 16;} // 0.503461296 브로드 소드 闊劍
			case(60){itemString = `id:46001`; iCumRate += 16;} // 0.503461296 라운드 실드 圓盾
			case(61){itemString = `id:14013`; iCumRate += 16;} // 0.503461296 로리카 古羅馬胸甲
			case(62){itemString = `id:14019`; iCumRate += 16;} // 0.503461296 그레이스 플레이트 아머 優雅先鋒盔甲
			case(63){itemString = `id:19007`; iCumRate += 16;} // 0.503461296 야광 머플러 로브 夜光神秘長袍
			case(64){itemString = `id:15135`; iCumRate += 16;} // 0.503461296 시크 수트 時髦套裝
			case(65){itemString = `id:40015`; iCumRate += 16;} // 0.503461296 플루트 숏 소드 刀痕短劍
			case(66){itemString = `id:17071`; iCumRate += 16;} // 0.503461296 니하이 부츠 逆高靴
			case(67){itemString = `id:15153`; iCumRate += 16;} // 0.503461296 산드라 스나이퍼 수트(남성용) sandra 狙擊手套裝(男性專用)
			case(68){itemString = `id:13047`; iCumRate += 16;} // 0.503461296 키리누스진 하프 플레이트 아머(남성용) Kirirusjin's 改良式硬皮甲(男性專用)
			case(69){itemString = `id:17041`; iCumRate += 16;} // 0.503461296 덩굴무늬 헌팅부츠 路易斯高統靴
			case(70){itemString = `id:46008`; iCumRate += 16;} // 0.503461296 라이트 헤테로 카이트 실드 輕異型卡特盾牌
			case(71){itemString = `id:15055`; iCumRate += 16;} // 0.503461296 레더 미니 원피스 星星迷你裙
			case(72){itemString = `id:15053`; iCumRate += 16;} // 0.503461296 플랫칼라 원피스 貴婦裝
			case(73){itemString = `id:40030`; iCumRate += 16;} // 0.503461296 투 핸디드 소드 雙手劍
			case(74){itemString = `id:17045`; iCumRate += 16;} // 0.503461296 브이 넥 라인 레더 부츠 v字型皮長靴
			case(75){itemString = `id:14004`; iCumRate += 16;} // 0.503461296 클로스 메일 棉甲
			case(76){itemString = `id:17040`; iCumRate += 16;} // 0.503461296 엘라 스트랩 부츠 愛拉系帶靴
			case(77){itemString = `id:18516`; iCumRate += 16;} // 0.503461296 이블 다잉 크라운 骷髏金屬頭盔
			case(78){itemString = `id:18521`; iCumRate += 16;} // 0.503461296 유러피안 컴프 衛兵金屬頭盔
			case(79){itemString = `id:15136`; iCumRate += 16;} // 0.503461296 모험가 슈트 哥德式花邊裙子
			case(80){itemString = `id:18525`; iCumRate += 16;} // 0.503461296 워터드롭 캡 水滴金屬頭盔
			case(81){itemString = `id:18511`; iCumRate += 16;} // 0.503461296 플루트 풀 헬름 刀鋒盔
			case(82){itemString = `id:18506`; iCumRate += 16;} // 0.503461296 윙 하프 헬름 飛翼盔
			case(83){itemString = `id:16505`; iCumRate += 16;} // 0.503461296 플루트 건틀렛 長刀峰手套
			case(84){itemString = `id:18502`; iCumRate += 16;} // 0.503461296 본 헬름 骷髏頭盔
			case(85){itemString = `id:15014`; iCumRate += 16;} // 0.503461296 파발꾼의 옷 使者衣
			case(86){itemString = `id:18115`; iCumRate += 16;} // 0.503461296 핀 고양이 모자 髮髻貓帽子
			case(87){itemString = `id:18112`; iCumRate += 16;} // 0.503461296 해 분장 소품 太陽裝扮工具
			case(88){itemString = `id:18111`; iCumRate += 16;} // 0.503461296 나무 분장 소품 樹木裝扮工具
			case(89){itemString = `id:18110`; iCumRate += 16;} // 0.503461296 덤불 분장 소품 灌木裝扮工具
			case(90){itemString = `id:18109`; iCumRate += 16;} // 0.503461296 나오 분장 소품 娜歐裝扮工具
			case(91){itemString = `id:18108`; iCumRate += 16;} // 0.503461296 바위 분장 소품 岩石裝扮工具
			case(92){itemString = `id:18547`; iCumRate += 16;} // 0.503461296 파나쉬 헤드 프로텍터 大型羽毛金屬頭盔
			case(93){itemString = `id:19020`; iCumRate += 16;} // 0.503461296 나타네 설산용 코트 Natane雪山用外套
			case(94){itemString = `id:16520`; iCumRate += 16;} // 0.503461296 롱 레더 글러브 紅色皮手套
			case(95){itemString = `id:19012`; iCumRate += 16;} // 0.503461296 트루디 레이어드 로브 特魯迪路易斯長袍
			case(96){itemString = `id:18004`; iCumRate += 16;} // 0.503461296 몬거 패션모자 蒙果時尚帽子
			case(97){itemString = `id:15132`; iCumRate += 16;} // 0.503461296 내추럴 베스트 웨어 自然風背心
			case(98){itemString = `id:15043`; iCumRate += 16;} // 0.503461296 스포티 웨어세트 運動服
			case(99){itemString = `id:15033`; iCumRate += 16;} // 0.503461296 몬거 여행자옷 蒙果旅行家衣服
			case(100){itemString = `id:51003 count:10`; iCumRate += 16;} // 0.503461296 생명력 50 포션 中型生命藥水(效果50)
			case(101){itemString = `id:51004 count:10`; iCumRate += 16;} // 0.503461296 생명력 100 포션 大型生命藥水(效果100)
			case(102){itemString = `id:51008 count:10`; iCumRate += 16;} // 0.503461296 마나 50 포션 中型魔法藥水(效果50)
			case(103){itemString = `id:51013 count:10`; iCumRate += 16;} // 0.503461296 스태미나 50 포션 中型耐力藥水(效果50)
			case(104){itemString = `id:51014 count:10`; iCumRate += 16;} // 0.503461296 스태미나 100 포션 大型耐力藥水(效果100)
			case(105){itemString = `id:51028 count:10`; iCumRate += 16;} // 0.503461296 생명력과 스태미나 50 포션 中型生命與耐力藥水(效果50)
			case(106){itemString = `id:18029`; iCumRate += 20;} // 0.629326621 나무테 안경 帶框眼鏡
			case(107){itemString = `id:18028`; iCumRate += 20;} // 0.629326621 접이식 안경 輕便眼鏡
			case(108){itemString = `id:40038`; iCumRate += 20;} // 0.629326621 라이트닝 원드 雷矢魔仗
			case(109){itemString = `id:40039`; iCumRate += 20;} // 0.629326621 아이스 원드 冰矛魔仗
			case(110){itemString = `id:40040`; iCumRate += 20;} // 0.629326621 파이어 원드 火焰魔仗
			case(111){itemString = `id:40041`; iCumRate += 20;} // 0.629326621 타격용 원드 無屬性魔仗
			case(112){itemString = `id:40090`; iCumRate += 20;} // 0.629326621 힐링 원드 治癒魔仗
			case(113){itemString = `id:18542`; iCumRate += 20;} // 0.629326621 빅 체인 풀 헬름 大鏈盔
			case(114){itemString = `id:18543`; iCumRate += 20;} // 0.629326621 슬릿 풀 헬름 大全蓋鐵頭盔
			case(115){itemString = `id:18544`; iCumRate += 20;} // 0.629326621 펠리칸 프로텍터 大騎士金屬頭盔
			case(116){itemString = `id:15128`; iCumRate += 20;} // 0.629326621 투 톤 비조 드레스 兩色飛鳥裙
			case(117){itemString = `id:16019`; iCumRate += 20;} // 0.629326621 줄무늬 팔목 장갑 麗琳護手
			case(118){itemString = `id:18047`; iCumRate += 20;} // 0.629326621 코레스 펠트 모자 柯列斯花邊帽
			case(119){itemString = `id:15052`; iCumRate += 20;} // 0.629326621 터크스 투톤 튜닉 男性束腰裝
			case(120){itemString = `id:19005`; iCumRate += 20;} // 0.629326621 머플러 로브 神秘長袍
			case(121){itemString = `id:2001`; iCumRate += 20;} // 0.629326621 금화 주머니 金幣袋子(1萬)
			case(122){itemString = `id:2006`; iCumRate += 20;} // 0.629326621 큰 금화 주머니 金幣袋子(5萬)
			case(123){itemString = `id:18010`; iCumRate += 20;} // 0.629326621 몬거 스마트 캡 蒙果的靈巧帽子
			case(124){itemString = `id:15131`; iCumRate += 20;} // 0.629326621 핀 에이프런 스커트 圍裙型裙子
			case(125){itemString = `id:18008`; iCumRate += 20;} // 0.629326621 스트라이프 캡 條紋帽
			case(126){itemString = `id:16008`; iCumRate += 20;} // 0.629326621 코레스 씨프 글러브 柯列斯盜賊手套
			case(127){itemString = `id:15028`; iCumRate += 20;} // 0.629326621 코레스 씨프슈트 柯列斯盜賊服
			case(128){itemString = `id:17506`; iCumRate += 20;} // 0.629326621 롱그리브 부츠 長護脛靴
			case(129){itemString = `id:18026`; iCumRate += 20;} // 0.629326621 몬거 상인모자 蒙果商人帽子
			case(130){itemString = `id:18040`; iCumRate += 20;} // 0.629326621 코레스 꼭지 베레모 柯列斯齡當貝雷帽
			case(131){itemString = `id:15042`; iCumRate += 20;} // 0.629326621 롱넥 원피스 高領漣衣裙
			case(132){itemString = `id:40012`; iCumRate += 20;} // 0.629326621 바스타드 소드 變形劍
			case(133){itemString = `id:17016`; iCumRate += 20;} // 0.629326621 필드 컴뱃슈즈 野戰靴
			case(134){itemString = `id:17015`; iCumRate += 20;} // 0.629326621 컴뱃슈즈 格鬥靴
			case(135){itemString = `id:17005`; iCumRate += 20;} // 0.629326621 사냥꾼 신발 獵人皮靴
			case(136){itemString = `id:17002`; iCumRate += 20;} // 0.629326621 검사 신발 劍士短靴
			case(137){itemString = `id:17022`; iCumRate += 20;} // 0.629326621 레더부츠 保暖靴
			case(138){itemString = `id:17001`; iCumRate += 20;} // 0.629326621 가죽 부츠 搭扣鞋
			case(139){itemString = `id:16009`; iCumRate += 20;} // 0.629326621 사냥꾼장갑 杜克獵人手套
			case(140){itemString = `id:15031`; iCumRate += 20;} // 0.629326621 마법학교 교복 魔法學校制服
			case(141){itemString = `id:51029 count:10`; iCumRate += 22;} // 0.692259283 생명력과 스태미나 100 포션 大型生命與耐力藥水(效果100)
			case(142){itemString = `id:62005 suffix:31002`; iCumRate += 24;} // 0.755191945 인챈트 스크롤(기사) 魔力賦予捲軸:騎士
			case(143){itemString = `id:62005 suffix:30302`; iCumRate += 24;} // 0.755191945 인챈트 스크롤(코볼트) 魔力賦予捲軸:地靈
			case(144){itemString = `id:62005 prefix:20615`; iCumRate += 24;} // 0.755191945 사막거미 沙漠蜘蛛 魔力賦予捲軸(接頭)
			case(145){itemString = `id:62005 prefix:20508`; iCumRate += 24;} // 0.755191945 수상한 可疑的 魔力賦予捲軸(接頭)
			case(146){itemString = `id:62005 prefix:20618`; iCumRate += 24;} // 0.755191945 망설이는 猶豫的 魔力賦予捲軸(接頭)
			case(147){itemString = `id:62005 prefix:20718`; iCumRate += 24;} // 0.755191945 이상한 奇怪的 魔力賦予捲軸(接頭)
			case(148){itemString = `id:62005 prefix:20212`; iCumRate += 24;} // 0.755191945 괴상한 怪異的 魔力賦予捲軸(接頭)
			case(149){itemString = `id:62005 prefix:20412`; iCumRate += 24;} // 0.755191945 별난 特別的 魔力賦予捲軸(接頭)
			case(150){itemString = `id:62005 prefix:20619`; iCumRate += 24;} // 0.755191945 특이한 獨特的 魔力賦予捲軸(接頭)
			case(151){itemString = `id:62005 suffix:30616`; iCumRate += 24;} // 0.755191945 매정한 冰冷的 魔力賦予捲軸(接尾)
			case(152){itemString = `id:62005 suffix:30617`; iCumRate += 24;} // 0.755191945 무정한 無情的 魔力賦予捲軸(接尾)
			case(153){itemString = `id:62005 suffix:30618`; iCumRate += 24;} // 0.755191945 비참한 悲慘的 魔力賦予捲軸(接尾)
			case(154){itemString = `id:62005 suffix:30726`; iCumRate += 24;} // 0.755191945 하모니 和聲
			case(155){itemString = `id:62005 suffix:30629`; iCumRate += 24;} // 0.755191945 멜로디 旋律
			case(156){itemString = `id:62005 suffix:30727`; iCumRate += 24;} // 0.755191945 소금 鹽巴
			case(157){itemString = `id:62005 suffix:30630`; iCumRate += 24;} // 0.755191945 설탕 砂糖
			case(158){itemString = `id:62005 prefix:20505`; iCumRate += 24;} // 0.755191945 리자드 蜥蜴
			case(159){itemString = `id:62005 prefix:20209`; iCumRate += 24;} // 0.755191945 몽구스 貓鼬
			case(160){itemString = `id:62005 prefix:20409`; iCumRate += 24;} // 0.755191945 사막여우 沙漠狐狸
			case(161){itemString = `id:50164 quality:100`; iCumRate += 24;} // 0.755191945 T본 스테이크 丁骨牛排
			case(162){itemString = `id:50165 quality:100`; iCumRate += 24;} // 0.755191945 치즈 그라탕 起司焗烤
			case(163){itemString = `id:50166 quality:100`; iCumRate += 24;} // 0.755191945 카레 라이스 咖哩飯
			case(164){itemString = `id:50167 quality:100`; iCumRate += 24;} // 0.755191945 코 코 뱅 紅酒燉雞
			case(165){itemString = `id:50168 quality:100`; iCumRate += 24;} // 0.755191945 송어찜 燉松魚
			case(166){itemString = `id:50182 quality:100`; iCumRate += 24;} // 0.755191945 브리흐네 위스키 布里赫威士忌
			case(167){itemString = `id:50199 quality:100`; iCumRate += 24;} // 0.755191945 스크류 드라이버 螺絲起子
			case(168){itemString = `id:50200 quality:100`; iCumRate += 24;} // 0.755191945 라인 슬링 line sling(調酒)
			case(169){itemString = `id:50201 quality:100`; iCumRate += 24;} // 0.755191945 BnR BnR
			case(170){itemString = `id:50202 quality:100`; iCumRate += 24;} // 0.755191945 키스 온 더 립스 kiss on the lips (調酒)
			case(171){itemString = `id:50203 quality:100`; iCumRate += 24;} // 0.755191945 레드 선라이즈 列焰紅日(雞尾酒)
			case(172){itemString = `id:50183 quality:100`; iCumRate += 24;} // 0.755191945 데브니쉬 흑맥주 普利斯布尼 黑啤酒
			case(173){itemString = `id:50123 quality:100`; iCumRate += 24;} // 0.755191945 베이컨구이 烤培根
			case(174){itemString = `id:62005 prefix:20203`; iCumRate += 29;} // 0.9125236 양치기의 牡羊  魔力賦予捲軸(接頭)
			case(175){itemString = `id:62005 prefix:21003`; iCumRate += 29;} // 0.9125236 파멸의 毀滅的 魔力賦予捲軸(接頭)
			case(176){itemString = `id:62005 suffix:30201`; iCumRate += 29;} // 0.9125236 갈색곰 棕雄 魔力賦予捲軸(接尾)
			case(177){itemString = `id:62005 suffix:30302`; iCumRate += 29;} // 0.9125236 코볼트 地靈 魔力賦予捲軸(接尾)
			case(178){itemString = `id:62005 prefix:20201`; iCumRate += 29;} // 0.9125236 하드 堅固　魔力賦予捲軸(接頭)
			case(179){itemString = `id:62005 suffix:30304`; iCumRate += 29;} // 0.9125236 회색늑대 灰狼 魔力賦予捲軸(接尾)
			case(180){itemString = `id:62005 suffix:30702`; iCumRate += 29;} // 0.9125236 레이븐 烏鴉 魔力賦予捲軸(接尾)
			case(181){itemString = `id:62005 suffix:30704`; iCumRate += 29;} // 0.9125236 데들리 致命的 魔力賦予捲軸(接尾)
			case(182){itemString = `id:62005 suffix:30801`; iCumRate += 29;} // 0.9125236 네이쳐 天然 魔力賦予捲軸(接尾)
			case(183){itemString = `id:62005 suffix:30802`; iCumRate += 29;} // 0.9125236 카운터 相反的 魔力賦予捲軸(接尾)
			case(184){itemString = `id:62005 suffix:30803`; iCumRate += 29;} // 0.9125236 윈드밀 旋風擺蓮腿 魔力賦予捲軸(接尾)
			case(185){itemString = `id:62005 suffix:30804`; iCumRate += 29;} // 0.9125236 스매시 重擊 魔力賦予捲軸(接尾)
			case(186){itemString = `id:62005 prefix:20405`; iCumRate += 29;} // 0.9125236 거친 粗狂的 魔力賦予捲軸(接頭)
			case(187){itemString = `id:62005 prefix:20501`; iCumRate += 29;} // 0.9125236 간편한 簡易的 魔力賦予捲軸(接頭)
			case(188){itemString = `id:62005 prefix:20602`; iCumRate += 29;} // 0.9125236 견고한 堅固的 魔力賦予捲軸(接頭)
			case(189){itemString = `id:62005 prefix:20701`; iCumRate += 29;} // 0.9125236 거센 猛烈的 魔力賦予捲軸(接頭)
			case(190){itemString = `id:62005 suffix:30506`; iCumRate += 29;} // 0.9125236 매서운 厲害的 魔力賦予捲軸(接尾)
			case(191){itemString = `id:62005 suffix:30614`; iCumRate += 29;} // 0.9125236 기운찬 氣息 魔力賦予捲軸(接尾)
			case(192){itemString = `id:62005 prefix:20108`; iCumRate += 29;} // 0.9125236 키위 奇異鳥 魔力賦予捲軸(接頭)
			case(193){itemString = `id:62005 prefix:20304`; iCumRate += 29;} // 0.9125236 타조 鴕鳥 魔力賦予捲軸(接頭)
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
