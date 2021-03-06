/////////////////////////////////////////////////////////////////////////////////////
//																Script Feature Matrix
//
//												  wakeup fecit, begins at 2008. 03. 12
//																	wakeup@nexon.co.kr
/////////////////////////////////////////////////////////////// component of Mabinogi

//-----------------------------------------------------------------------------------
// * 코드 연동 없이 스크립트에서만 사용하는 피쳐를 관장하는 스크립트이다.
// * 피쳐를 추가하거나 바꾸는 경우 로직은 그대로 두고
//   아래 피쳐 조건 변경을 이용해서 투입 시기 등을 컨트롤 하도록 한다.
//-----------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------
// * 피쳐는 주석으로 정리해두자
// - featureXXX : 설명, 날짜
// ex) - featureFavorite : 호감도, 20080308
//
// - featureHMDungeonItemAddition : 하드 모드 던전 아이템 추가
// - featureHotSpringMonkey : 온천 원숭이 추가
// - featurePetHeal : 애완동물을 힐러집에서 치유토록 설정, 20080324
// - featureSkillRankLimitCancelG8S4 : 휴식7랭, 메디9랭, 캠파8랭까지 제한해제, 20080327
// - featureGuildRobe : 길드로브, 20080331
// - featureTutorialPlayUpgrade : 초반 튜토리얼 개선, 20080402
// - featurePartyQuestAdd : 파티 퀘스트 스크롤 추가 제작 (키아/라비/바리), 20080415
// - featureMailBox : 우편함 피쳐 처리
// - featureChinaPremiumPc : 중국 프리미엄 피씨방 던전 추가
// - featureProvokeSkill : 자이언트 도발 스킬 20080512
// - featureWindBreakerSkill : 자이언트 윈드 브레이커 스킬 20080512
// - featureGiantShield : 자이언트 방패 판매 20080520
// - featureFinalShotSkill : 엘프 파이널 샷 스킬  20080520
// - featureG1Skip : G1 스킵 시즌 조정 20080515
// - featureTaiwanWeapon : 대만 무기 공모전 던전 보상
// - featureBossPlayElfGiant : G8S5 엘프 자이언트 레벨 퀘스트 20080528
// - featureChinaGuildWar : 중국 길드전 20080617
// - featureChinaMagicBook : 중국 마법서 던전 보상 추가 20080625
// - featureG2Skip : G2 스킵 시즌 조정 20080709
// - featureG3Skip : G3 스킵 시즌 조정 20080709
// - featureG9MainStream : G9 메인스트림 추가 20080709
// - featureBossCollectionBook : 일본 보스몬스터 컬랙션북 추가 20080709
// - featureNewBagJapan : 일본 신규 가방 판매 20080717
// - featureFlameSkill : G9S2 플레임 스킬 20080923
// - featureSandStormSkill : G9S2 샌드스톰 스킬 20080923
// - featureTrainingItemForBirds : 새 조련 아이템 20081013
// - featureG7G9cutscene : 도서관 G7~G9 컷신 20081015
// - featureElementCylinder : 속성 실린더 20081028
// - featureG10MainStream : G10 메인스트림 추가 20081110
// - featureWallMountItem : 하우징 커튼/액자 시즌 추가 20081120
// - featureGuildQuest : 길드 퀘스트 추가 20081120
// - featureAlbyHigh : 알비 상급 던전 통행증 피쳐 처리 20081125
// - featureNewManualG5S3 : 신규옷본 피쳐 처리 20081125
// - featureAddDice : 주사위 피쳐 처리 20081125
// - featureBossRush : 보스러시 던전 피쳐 처리 20081125
// - featureAddGlassesG6S4 : 보스러시 던전 피쳐 처리 20081125
// - featureSkillRankLimitCancelG5S4 : 캠파 B,A, 응치 A, 휴식 9까지 제한해제, 20081125
// - featureSkillRankLimitCancelMusicKnow : 캠파 B,A, 응치 A, 휴식 9까지 제한해제, 20081125
// - featureGetDemiGodExpOnRebirth : 환생시 반신화 스킬 여부에 따라 나오의 대사가 변함, 20081203
// - featurePartyQuestAdd2 : 파티 퀘스트 스크롤 추가 피쳐 제작 (하드모드 던전), 20081211
// - featureMusicJam : 파티 퀘스트 스크롤 추가 피쳐 제작 (하드모드 던전), 20081211
// - featureDelWeddingDress : 결혼식 예복 가진 캐릭터에서 예복 아이템들 삭제 20081223
// - featureG10TutorialRenewal : G10S1EX에서 엘프 튜토리얼 리뉴얼 2009-0119
// - featureG10TresureBoxMoney : 유물 상자에서 골드 나오지 않도록 변경 2009-0120
// - featureG9MakeEasy2 : G9 난이도 두 번째 하향, G10S1EX에 포함 2009-0114
// - featureAlchemistQuest : G10S2 이멘 마하의 참극 퀘스트 추가 2009-0213
// - featureLileasCFQuest : G10S2 리리스의 벌꿀 원정기 퀘스트 추가 2009-0213
// - featureNewbieMovie : 초보자 튜토리얼 동영상 관련 작업 2009-0216
// - featureFirstHumanUlad : 계정내 최초 인간 캐릭터 생성 시 티르코네일에서만 시작 가능 2009-0216
// - featureFashionShow : G10S2 패션쇼 2009-0217
// - feature50Javelin : G10S2 50개 묶음 숏 자벨린 2009-0220
// - featureHansUpgrade : 거리의 화가 한스 업그레이드 2009-0223
// - featureTaraItemUpgrade : 타라 신규 개조식 2009-0223
// - featureWineMaking : 와인 플레이 2009-0223
// - featureBlaze : 블레이즈 2009-0223
// - featureShip : 뗏목 비용 골드로 지불할 수 있도록 추가 2009-0413
// - featureCylinderUpgrade : 뗏목 비용 골드로 지불할 수 있도록 추가 2009-0413
// - featureGetAdvancedItem : 해외 어드밴스드 아이템 리뉴얼 2009429
// - featureG9Polishing : G9 메인스트림 다듬기 2009-0512
// - featureG10Polishing : G10 메인스트림 다듬기 2009-0512
// - featureVIPBagTaiwan : 대만 VIP 가방 판매 2009-0528
// - featureSecretShopTaiwan : 대만 상시 가챠폰 비밀상점 2009-0605
// - featureWeekRebirth : 일주일 환생 피쳐로 이동 2009-0608
// - accessoriesEnchant : G11S1Ex 하드모드 던전 장신구용 인챈트 추가 2009-0805
// - HousingMailBox : 하우징 지역에 우편함 설치 2009-0805
// - featureG8RedWing : G8 메인스트림 퀘스트에서 여신의 날개를 주어서 더 이동하기 쉽게 처리 2009-0807
// - featureGiantHandBell : 자이언트 음지 6랭크 퀘스트를 위해 전용 핸드벨 추가 2009-0813
// - RoyalAlchemist : G11S2 왕정 연금술사 피처 추가 2009-0818
// - freatureCarpentry : 스킬 목공 2009-0821
// - featureCooking6Rank : 요리 랭크 제한 해제 8 --> 6 2009-0907
// - featureGiantTuba : 자이언트 전용 악기 튜바 투입 2009-0909
// - featureG11S2jenna : G11S2 제너 의 왕성 파티 스토리 퀘스트 2009-0915
// - featurePersonalizeEnchant :  전용화 인챈트 2009-1007 (전용 해제 캐시템과 같이 공급되지 않으면 획귀 컨텐츠가 된다.)
// - featureCashtemDuncan :  신규 캐시템, 전용화 인챈트 던컨이 판매 2009-1007
// - featureBattleFieldAllocMonster :  충돌 미션의 몬스터 배치 조정 2009-1010
// - featureBankArbeit :  은행 배달 아르바이트 G12S1 2009-1202
// - featureGuildEU : 유럽 G1길드 제거
// - featureBankEU : 유럽 G1 개인상점 허가증 제거
// - featureTutorialPlayUpgrade_paperplane : 종이 비행기 G9S2 시즌 추가
// - featureFamily : G12S1 패밀리 시스템 추가
// - featureTreasureOfGod: G12S1 팔리아스의 보물 추가
// - featureBankArbeit : G12S1 택배 아르바이트 추가
// - featureG12MainStream : G12 메인스트림 추가
// - featureG1edernShop : G1 아이데른 무기 탭 안보이게 숨기기
// - featureTowerCylinder : G12 타워실린더 2009-1121
// - featureCylinderExplosion : G12 히트 버스터 2009-1121
// - featureG2MainStreamEasy : G2 메인스트림 하향 - 해외 2009-1201
// - featureG1MainStreamEasy : G1 메인스트림 하향 - 해외 2009-1202
// - featureSelectGod : G12S1 힘을 사용할 신을 번복 2009-1203
// - gfSelectGodKristel : G12S1 테섭에서만 크리스텔이 반신화 번복 2009-1207
// - Newbie_Guide_Movie : G12S1 유저 이탈 방지 용도 - 초보자 가이드 동영상 추가 (트레보/아이리)
// - featureGiveNaoSoulStoneToCharacterByFreeCard : 프리카드로 생성한 캐릭터에 나오의 영혼석 제공
// - featureAlchemyBag : G12S2 연금술 결정 가방 판매  2010-0326
// - featureRemoteWandRepair : G12S2 어드템 - 원격 마법무기 수리 이용권  2010-0402
// - featureLongJavelin : G12S2 롱 자벨린 판매  2010-0403
// - featureC3CutsceneReplay : G12S2 도서관에서 C3 컷신 재감상  2010-0406
// - featureFrozenBlastSkill : G10S1 프로즌 블래스트 스킬 시즌 설정  2010-0408
// - featureDungeonAchievement 그림자 미션/던전 클리어 저널 추가  2010-0409
// - featureMainstreamDifficultyDrop 일부 경험치 낮은 메인스트림 미션 난이도 감소 791001, 792001, 792002, 792009 2010-0410
// - featureSplinterShot 스플린터 샷 습득 퀘스트  2010-0412
// - featureGlewyasChronicle  글루아스 요리 연대기 가이드 2010-0413
// - featureHotkeyPreset  단축키 프리셋 2010-0414
// - featureNuadhaSetitem 누아자 의상 팔리아스 보물에서 지급 2010-0428
// - featureArenaCoin 유럽 에반 아레나 코인 판매 설정 2010-0524
// - featureSionArbeit 유럽 숀 광산 아르바이트 리뉴얼 2010-0524
// - featureG13MainStream G13 메인스트림 2010-0621
// - featureIRentalBagOverse : 해외 유료 가방 8*10 판매 2010-0623
// - featureItemEnhance : 아이템 강화 2010-0625
// - featureFreeCastle : 왕성에 키워드 없이도 입장 가능 2010-0627 //필요없어졌으니 제거합니다.
// - featureFiodhHighDungeon : 피오드 상급 던전 추가  2010-06-28
// - featureBoltMastery : 볼트 마스터리 2010-06-28
// - featureCombineBolts : 볼트 마법 조합 2010-06-28
// - featureAssaultSlash : 어설트 슬래시 2010-06-28
// - featureAncientTreasureChest : 고대의 보물 상자 피쳐 2010-06-29

// - featureEliteMission : 그림자 미션 엘리트 등급 2010-06-29
// - featureBlizzardStrike : 헤일스톰 2010-06-29
// - featureCuilinHousing : 퀼린 하우징 2010-07-07
// - featureTutorialRenewal2010 : 튜토리얼 리뉴얼 2010-07-09
// - featurePetDragon : 드래곤 펫 투입 2010-07-19
// - featureArtisanUpgradeRestoreTest :  장인 개조 복원 키트 테스트서버 던컨 판매 2010-08-12
// - featureBunshin : 일본 C4 분신 스킬 2010-08-30
// - featureEliteAchievement : G13S2 엘리트, 퍼펙트 컴플리트 저널 2010-10-14
// - featureG13S2ContentsRenewal : G13S2 마창대회 리뉴얼 2010-10-24
// - featureDayRebirth : 초보자 1일 1회 환생 2010-11-02
// - featureCombocard : 던전/그림자 미션에서 콤보카드 드랍 2010-11-06
// - featureHelpNewbie: 초보자 개선 2010-11-08
// - featurePcbang: 프리미엄PC방 개선 2010-11-09



//
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
// * 사용 방법
// if (IsEnable(`featureXXX`) extern (`data/script/features.mint`))
// {
// }
//-----------------------------------------------------------------------------------

/////////////////////////////////////////////////////////////////////////////////////
// 시즌 정리
server float CLOSED_BETA()					{	return 001.0;	}
server float OPEN_BETA()					{	return 002.0;	}
server float GENERATION1_SEASON1()			{	return 101.0;	}
server float GENERATION1_SEASON2()			{	return 102.0;	}

server float GENERATION2_SEASON1()			{	return 201.0;	}
server float GENERATION2_SEASON2()			{	return 202.0;	}
server float GENERATION2_SEASON3()			{	return 203.0;	}
server float GENERATION2_SEASON4()			{	return 204.0;	}

server float GENERATION3_SEASON1()			{	return 301.0;	}
server float GENERATION3_SEASON2()			{	return 302.0;	}
server float GENERATION3_SEASON3()			{	return 303.0;	}
server float GENERATION3_SEASON4()			{	return 304.0;	}

server float EXTRA_GENERATION()			{	return 401.0;	}
server float GENERATION4_SEASON1()			{	return 402.0;	}
server float GENERATION4_SEASON2()			{	return 403.0;	}
server float GENERATION4_SEASON3()			{	return 404.0;	}

server float GENERATION5_SEASON1()			{	return 501.0;	}
server float GENERATION5_SEASON2()			{	return 502.0;	}
server float GENERATION5_SEASON3()			{	return 503.0;	}
server float GENERATION5_SEASON4()			{	return 504.0;	}

server float GENERATION6_SEASON1()			{	return 601.0;	}
server float GENERATION6_SEASON2()			{	return 602.0;	}
server float GENERATION6_SEASON3()			{	return 603.0;	}
server float GENERATION6_SEASON4()			{	return 604.0;	}
//미국 확장팩 후 추가 피쳐 추가
server float GENERATION6_SEASON5()			{	return 605.0;	}
server float GENERATION6_SEASON6()			{	return 606.0;	}

server float GENERATION7_SEASON1()			{	return 701.0;	}
server float GENERATION7_SEASON2()			{	return 702.0;	}
server float GENERATION7_SEASON3()			{	return 703.0;	}
server float GENERATION7_SEASON4()			{	return 704.0;	}

server float GENERATION8_SEASON1()			{	return 801.0;	}
server float GENERATION8_SEASON2()			{	return 802.0;	}
server float GENERATION8_SEASON3()			{	return 803.0;	}
server float GENERATION8_SEASON4()			{	return 804.0;	}
// G8 Extra Season
server float GENERATION8_SEASON5()			{	return 805.0;	}

server float GENERATION9_SEASON1()			{	return 901.0;	}
server float GENERATION9_SEASON2()			{	return 902.0;	}
server float GENERATION9_SEASON3()			{	return 903.0;	}
server float GENERATION9_SEASON4()			{	return 904.0;	}

server float GENERATION10_SEASON1()			{	return 1001.0;	}
server float GENERATION10_SEASON1EXTRA()		{	return 1001.1;	}
server float GENERATION10_SEASON2()			{	return 1002.0;	}
server float GENERATION10_SEASON2EXTRA()		{	return 1002.1;	}
server float GENERATION10_SEASON3()			{	return 1003.0;	}
server float GENERATION10_SEASON4()			{	return 1004.0;	}

server float GENERATION11_SEASON1()			{	return 1101.0;	}
server float GENERATION11_SEASON1EXTRA()		{	return 1101.1;	}
server float GENERATION11_SEASON2()			{	return 1102.0;	}
server float GENERATION11_SEASON2EXTRA()		{	return 1102.1;	}

server float GENERATION12_SEASON1()			{	return 1201.0;	}
server float GENERATION12_SEASON1EXTRA()		{	return 1201.1;	}
server float GENERATION12_SEASON2()			{	return 1202.0;	}
server float GENERATION12_SEASON2EXTRA()		{	return 1202.1;	}

server float GENERATION13_SEASON1()			{	return 1301.0;	}
server float GENERATION13_SEASON2()			{	return 1302.0;	}


/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
server bool IsEnable(string _strFeature)
/////////////////////////////////////////////////////////////////////////////////////
{
	if (_strFeature == `featureHelpNewbie`)	//초보자 개선
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION13_SEASON2();		// 한국 g13s2일때만
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION13_SEASON2();		// 일본 g13s2일때만
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featurePcbang`)	//프리미엄 PC방 개선
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION13_SEASON2();		// 한국 g13s2일때만
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featureCombocard`)	//콤보카드 드랍
	{
		return GetVersion() >= GENERATION13_SEASON2();		// g13s2일때만
	}

	if (_strFeature == `featureDayRebirth`)	// 초보자 1일 1환생
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION13_SEASON2();		// 한국 g13s2일때만
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION13_SEASON2();		// 일본 g13s2일때만
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featureG13S2ContentsRenewal`)	// 마창 대회 리뉴얼
	{
		return GetVersion() >= GENERATION13_SEASON2();		// 한국 g13s2일때만
	}
	if (_strFeature == `featureEliteAchievement`)	// 그림자 미션 엘리트, 퍼펙트 컴플리트 저널
	{
		return GetVersion() >= GENERATION13_SEASON2();		// 한국 g13s2일때만
	}

	if (_strFeature == `featureBunshin`)	// 분신 스킬
	{
		if (IsDevelopment())
		{
			return GetVersion() >= GENERATION13_SEASON1();		// 개발장비거나
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION13_SEASON1();		// 일본 G13S1일때만
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION13_SEASON1();		// 대만 G13S1일때만
		}
		else
		{
			return false;
		}
	}


	if (_strFeature == `featureArtisanUpgradeRestoreTest`)	// 장인 개조 복원 키트 던컨이 테섭에서 판매
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1일때만
		}
		else
		{
			return false;
		}
	}

	if (_strFeature == `featurePetDragon`)		// 드래곤 펫 투입 한국 G12S2
	{
		return GetVersion() >= GENERATION12_SEASON2();
	}
	if (_strFeature == `featureTutorialRenewal2010`) // 튜토리얼 리뉴얼 2010
	{
		return GetVersion() >= GENERATION13_SEASON1();
	}
	if (_strFeature == `featureCuilinHousing`) //	퀼린 하우징
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	if (_strFeature == `featureBlizzardStrike`) //	헤일스톰
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	if (_strFeature == `featureAssaultSlash`) // 	어설트 슬래시
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}

	if (_strFeature == `featureEliteMission`) // 	그림자미션 엘리트 등급
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	if (_strFeature == `featureCombineBolts`) //	볼트 조합
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	if (_strFeature == `featureBoltMastery`) //	볼트 마스터리
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	if (_strFeature == `featureFiodhHighDungeon`) //	피오드 상급 던전 추가
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}
	/*if (_strFeature == `featureFreeCastle`) //	왕성 입장 시 경비병과 대화할 필요 없게 수정
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}*/
	if (_strFeature == `featureItemEnhance`) //	아이템 강화
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}

	if (_strFeature == `featureG13MainStream`)	//  G13 메인스트림
	{
		return GetVersion() >= GENERATION13_SEASON1();		// 한국 g13s1
	}

	if (_strFeature == `featureNuadhaSetitem`)	// 누아자 의상 지급
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureHotkeyPreset`)	// 단축키 프리셋
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION12_SEASON2();	// 한국 g12s2
		}
	}

	if (_strFeature == `featureGlewyasChronicle`)	// 글루아스 요리 연대기 가이드
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureSplinterShot`)	// 스플린터 샷 습득 퀘스트
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureMainstreamDifficultyDrop`)	// 일부 경험치 낮은 메인스트림 미션 난이도 감소
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureDungeonAchievement`)	// 그림자미션/던전 클리어 저널 추가
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureC3CutsceneReplay`)	// C3 컷신 도서관에서 재감상 가능케 수정
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureLongJavelin`)	// 롱 자벨린 판매 시작
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureRemoteWandRepair`)	// 어드템으로 목요일에 원격 마법무기 수리 이용권 지급 - 한국용
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `featureAlchemyBag`)	// 연금술 결정 주머니를 판매토록 수정
	{
		return GetVersion() >= GENERATION12_SEASON2();		// 한국 g12s2
	}

	if (_strFeature == `Newbie_Guide_Movie`)	// 초보자 가이드 동영상 추가 (스킬 단축키 등록+스킬 사용법 , 화면 전환 방법)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
		}
		else
		{
			return false;
		}
	}

	if (_strFeature == `featureSelectGod`)	// 바이브 카흐 선택 시스템. 반신화 때 두 여신 중 어느 신의 스킬을 쓸지 선언
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `gfSelectGodKristel`)	// 크리스텔이 반신화를 번복해줌
	{
		return GetVersion() == GENERATION12_SEASON1();		// 한국 g12s1일때만 (아직 아이바가 만들어지지 않아서)
	}

	if (_strFeature == `featureG1MainStreamEasy`)	// 메인스트림 G1 난이도 쉽게. 일단 미국만.
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION1_SEASON1();		// 미국 g1s1
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featureG2MainStreamEasy`)	// 메인스트림 G2 난이도 쉽게. 유럽만 초하향
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION2_SEASON1();
		}
		else
		{
			return false;
		}
	}

	if (_strFeature == `featureCylinderExplosion`)	// 히트 버스터
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `featureTowerCylinder`)	// 타워 실린더
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `featureG12MainStream`)	// G12 메인스트림 추가
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `featureFamily`)		// 패밀리 시스템 추가
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}



	if (_strFeature == `featureTreasureOfGod`)	// 팔리아스의 보물
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `featureBankArbeit`)	// G12 택배 배달 아르바이트
	{
		return GetVersion() >= GENERATION12_SEASON1();		// 한국 g12s1
	}

	if (_strFeature == `featureBattleFieldAllocMonster`)	// 충돌 미션 몬스터 배치 조정
	{
		return GetVersion() >= GENERATION11_SEASON2EXTRA();		// 한국 g11s2ex
	}

	if (_strFeature == `featureCashtemDuncan`)	// 전용화 인챈트 던컨이 테섭에서 판매
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() == GENERATION11_SEASON2EXTRA();		// 한국 g11s2ex일때만
		}
		else
		{
			return false;
		}
	}


	if (_strFeature == `featurePersonalizeEnchant`)	// 전용화 인챈트 공급
	{
		return GetVersion() >= GENERATION11_SEASON2EXTRA();		// 한국 g11s2ex
	}


	if (_strFeature == `featureG11S2jenna`)	// 제너 스토리 퀘스트
	{
		return GetVersion() >= GENERATION11_SEASON2();		// 한국 g11s2
	}




	if (_strFeature == `featureGiantTuba`)	// 자이언트 신규 악기 튜바 투입
	{
		return GetVersion() >= GENERATION11_SEASON2();		// 한국 g11s2
	}




	if (_strFeature == `featureCooking6Rank`)	// 요리 랭크 해제
	{
		return GetVersion() >= GENERATION11_SEASON2();		// 한국 g11s2
	}





	if (_strFeature == `freatureCarpentry`)	// 목공 스킬 G11S2
	{
		return GetVersion() >= GENERATION11_SEASON2();		// 한국 g11s2
	}
	if (_strFeature == `RoyalAlchemist`)	// 왕정 연금술사. G11S2
	{
		return GetVersion() >= GENERATION11_SEASON2();		// 한국 g11s2
	}

	if (_strFeature == `featureGiantHandBell`)	// 자이언트 전용 핸드벨: 음지 6랭크를 위해 투입
	{
		return GetVersion() >= GENERATION11_SEASON1EXTRA();		// 한국 g11s1ex
	}



	if (_strFeature == `featureG8RedWing`)	// 여신의 날개 공급 (g8 메인스트림)
	{
		return GetVersion() >= GENERATION11_SEASON1EXTRA();		// 한국 g11s1ex
	}
	if (_strFeature == `HelpBeginner`)	// 초보자 도우미
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON1();  // 유럽 상용화
		}
		else
		{
			return GetVersion() >= GENERATION11_SEASON1EXTRA();		// 한국 g11s1ex
		}
	}
	if (_strFeature == `accessoriesEnchant`)	// 장신구용 인챈트 추가
	{
		return GetVersion() >= GENERATION11_SEASON1EXTRA();		// 한국 g11s1ex
	}
	if (_strFeature == `HousingMailBox`)	// 하우징 리전에 우편함 설치
	{
		return GetVersion() >= GENERATION11_SEASON1EXTRA();		// 한국 g11s1ex
	}

	if (_strFeature == `featureG11MainStream`)	// g11 메인스트림 추가
	{
		return GetVersion() >= GENERATION11_SEASON1();		// 한국 g11s1
	}

	if (_strFeature == `featureG9Polishing`)	// g9 메인스트림 다듬기
	{
		return GetVersion() >= GENERATION10_SEASON2EXTRA();		// 한국 g10s2 엑스트라시즌
	}

	if (_strFeature == `featureG10Polishing`)	// g10 메인스트림 다듬기
	{
		return GetVersion() >= GENERATION10_SEASON2EXTRA();		// 한국 g10s2 엑스트라시즌
	}

	if (_strFeature == `featureCylinderUpgrade`)	// g10s2ex 실린더 개조식 추가
	{
		return GetVersion() >= GENERATION10_SEASON2EXTRA();		// 한국 g10s2 엑스트라시즌
	}
	if (_strFeature == `featureShip`)	// g10s2ex 뗏목 비용 골드로 지불할 수 있도록 변경
	{
		return GetVersion() >= GENERATION10_SEASON2EXTRA();
	}

	if (_strFeature == `featureBlaze`)	// g10s2 블레이즈 입수 퀘스트
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	if (_strFeature == `featureWineMaking`)	// g10s2 와인 플레이
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	if (_strFeature == `featureTaraItemUpgrade`)	// g10s2 페이단 신규 개조식
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	if (_strFeature == `featureHansUpgrade`)	// 거리의 화가 한스가 제대로 그림을 그려준다
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	if (_strFeature == `featureAlchemistQuest`)	// G10S2 이멘 마하의 참극 스토리 퀘스트 추가
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}

	if (_strFeature == `featureLileasCFQuest`)	 // G10S2 리리스 벌꿀 원정기 스토리 퀘스트
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}

	if (_strFeature == `featureG10TresureBoxMoney`)		// G10S1Ex 보물상자 돈 없애기
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION9_SEASON3();		// 일본 G9S3 시즌 적용
		}
		else
		{
			return GetVersion() >= GENERATION10_SEASON1EXTRA();		// 일단 g10s1 엑스트라시즌
		}
	}
	if (_strFeature == `featureG10TutorialRenewal`)		// G10S1Ex 튜토리얼 수정
	{
		return GetVersion() >= GENERATION10_SEASON1EXTRA();		// 일단 g10s1 엑스트라시즌
	}
	if (_strFeature == `featureG9MakeEasy2`)		// G9 메인스트림 난이도 하향 두번째. G10S1 엑스트라 패치에 포함.
	{
		return GetVersion() >= GENERATION10_SEASON1EXTRA();		// 일단 g10s1 엑스트라시즌
	}
	if (_strFeature == `featurePeacaRenewal`)		// 페카 던전 리뉴얼
	{
		return GetVersion() >= GENERATION10_SEASON1EXTRA();		// 일단 g10s1 엑스트라시즌
	}
	if (_strFeature == `featureG9MakeEasy`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION9_SEASON3();
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featureG10MainStream`)
	{
		return GetVersion() >= GENERATION10_SEASON1();
	}
	if (_strFeature == `featureAutoPlayerTest`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION9_SEASON3();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION8_SEASON5();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION8_SEASON5();
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		else
		{
			return false;
		}
	}
	if (_strFeature == `featureAndrasStroyQuest`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	if (_strFeature == `featureVioletStroyQuest`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	if (_strFeature == `featureTutorialPlayUpgrade_G9S2`)
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION1_SEASON2();
		}
		else
		{
			return GetVersion() >= GENERATION9_SEASON2();
		}
	}
	if (_strFeature == `featureTutorialPlayUpgrade_paperplane`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	if (_strFeature == `featureFarming`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	// 서버이전 체크해주는 NPC. 국내 G9S2 이후. 해외는 없음.
	if (_strFeature == `featureTransServer`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION9_SEASON2();
		}
		else
		{
			return false;
		}
	}
	// G2 메인스트림 고양이한테 스킵하기
	if (_strFeature == `featureG2Skip`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION3_SEASON2() && GetVersion() < GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `usa`)	// 미국은 G2 스킵 제거 - 추가일정 미정
		{
			return false;
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return false;
		}
		else
		{
			return GetVersion() >= GENERATION3_SEASON2();
		}
	}
	// G3 메인스트림 고양이한테 스킵하기
	if (_strFeature == `featureG3Skip`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION4_SEASON2() && GetVersion() < GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return false;
		}
		else
		{
			return GetVersion() >= GENERATION3_SEASON2();
		}
	}
	// G9 메인스트림
	// 이 때부터 g1, g2, g3 는 g9 를 깨기 전에 시작할 수 없음.
	// g9 과 동시에 기존 메인스트림을 진행하고 싶다면 데브캣에게 가야함.
	// 이 내용이 g9 메인스트림 피처에 같이 묶여있다.
	// 해외는 별도 처리하고 싶다면 devcat.mfloat 를 수정해야함. (그럴 일은 없었으면 하지만.)
	if (_strFeature == `featureG9MainStream`)
	{
		return GetVersion() >= GENERATION9_SEASON1(); //해외도 G9S1으로 시즌 적용 -honol01
	}
	else if (_strFeature == `featureHMDungeonItemAddition`)
	{
		return GetVersion() >= GENERATION8_SEASON3();
	}
	else if (_strFeature == `featureHotSpringMonkey`)
	{
		return GetVersion() >= GENERATION8_SEASON3();
	}
	else if (_strFeature == `featurePetHeal`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION3_SEASON1();
		}
		else	if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION2_SEASON1();
		}
		else
		{
			return GetVersion() >= GENERATION8_SEASON4();
		}
	}
	else if (_strFeature == `featureSkillRankLimitCancelG8S4`)
	{
		return GetVersion() >= GENERATION8_SEASON4();
	}
	else if (_strFeature == `featureGuildRobe`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		else
		{
			return GetVersion() >= GENERATION8_SEASON4();
		}
	}
	else if (_strFeature == `featureTutorialPlayUpgrade`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION8_SEASON3();
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION8_SEASON1();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION8_SEASON1();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION7_SEASON4();
		}
		else	if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION1_SEASON2();
		}
		else
		{
			return GetVersion() >= OPEN_BETA();
		}
	}
	else if (_strFeature == `featurePartyQuestAdd`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON3();
		}
		else
		{
			return GetVersion() >= GENERATION8_SEASON4();
		}
	}
	else if (_strFeature == `featurePartyQuestAdd2`)
	{
		return GetVersion() >= GENERATION8_SEASON4();
	}
	else if (_strFeature == `featureRenesPlay`)
	{
		return GetVersion() >= GENERATION8_SEASON4();
	}
	else if (_strFeature == `featureMailBox`)
	{
		return IsEnableMailboxFeature();
	}
	else if (_strFeature == `featureChinaPremiumPc`)
	{
		if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION7_SEASON4();
		}
	}
	else if (_strFeature == `featureProvokeSkill`)
	{
		return GetVersion() >= GENERATION8_SEASON5();
	}
	else if (_strFeature == `featureWindBreakerSkill`)
	{
		return GetVersion() >= GENERATION8_SEASON5();
	}
	else if (_strFeature == `featureGiantShield`)
	{
		return GetVersion() >= GENERATION8_SEASON5();
	}
	else if (_strFeature == `featureFinalShotSkill`)
	{
		return GetVersion() >= GENERATION8_SEASON5();
	}
	else if (_strFeature == `featureBossPlayElfGiant`)
	{
		return GetVersion() >= GENERATION8_SEASON5();
	}
	else if (_strFeature == `featureG1Skip`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION2_SEASON2();
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() < GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `europe`)	// 유럽은 G1 스킵 제거
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	else if (_strFeature == `featureTaiwanWeapon`)
	{
		if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION7_SEASON2();
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION8_SEASON2();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION7_SEASON4();
		}
	}
	else if (_strFeature == `featureChinaGuildWar`)
	{
		if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION8_SEASON1();
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION11_SEASON2();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION4_SEASON1();
		}
	}
	else if (_strFeature == `featureChinaMagicBook`)
	{
		if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION8_SEASON1();
		}
	}
	else if (_strFeature == `featureBossCollectionBook`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION8_SEASON3();
		}
	}
	else if (_strFeature == `featureNewBagJapan`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION8_SEASON3();
		}
	}
	else if (_strFeature == `featureFlameSkill`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	else if (_strFeature == `featureFrozenBlastSkill`)
	{
		return GetVersion() >= GENERATION10_SEASON1();
	}
	else if (_strFeature == `featureSandStormSkill`)
	{
		return GetVersion() >= GENERATION9_SEASON2();
	}
	else if (_strFeature == `featureTrainingItemForBirds`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION4_SEASON1();
		}
		else
		{
			return GetVersion() >= GENERATION3_SEASON3();
		}
	}
	else if (_strFeature == `featureG7G9cutscene`)
	{
		{
			return GetVersion() >= GENERATION9_SEASON3();
		}
	}
	else if (_strFeature == `featureElementCylinder`)
		{
			return GetVersion() >= GENERATION9_SEASON3();
		}
	else if (_strFeature == `featureWallMountItem`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION5_SEASON4();
		}
		else
		{
			return GetVersion() >= GENERATION6_SEASON3();
		}
	}
	else if (_strFeature == `featureGuildQuest`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		else
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
	}
	else if (_strFeature == `featureArenaCoin`)
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		else
		{
			return GetVersion() >= GENERATION4_SEASON3();
		}
	}
	else if (_strFeature == `featureSionArbeit`)
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		else
		{
			return GetVersion() >= GENERATION7_SEASON2();
		}
	}
	else if (_strFeature == `featureAlbyHigh`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON5();
		}
		else
		{
			return GetVersion() >= GENERATION6_SEASON3();
		}
	}
	else if (_strFeature == `featureNewManualG5S3`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON6();
		}
		else
		{
			return GetVersion() >= GENERATION5_SEASON3();
		}
	}
	else if (_strFeature == `featureAddDice`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON6();
		}
		else if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION12_SEASON2();
		}
		else
		{
			return GetVersion() >= GENERATION5_SEASON4();
		}
	}
	else if (_strFeature == `featureBossRush`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON5();
		}
		else
		{
			return GetVersion() >= GENERATION5_SEASON4();
		}
	}
	else if (_strFeature == `featureAddGlassesG6S4`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON6();
		}
		else
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
	}
	else if (_strFeature == `featureSkillRankLimitCancelG5S4`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON6();
		}
		else
		{
			return GetVersion() >= GENERATION5_SEASON4();
		}
	}
	else if (_strFeature == `featureSkillRankLimitCancelMusicKnow`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON6();
		}
		else
		{
			return GetVersion() >= GENERATION5_SEASON3();
		}
	}
	else if (_strFeature == `featureGetDemiGodExpOnRebirth`)
	{
		return GetVersion() >= GENERATION10_SEASON1();
	}
	else if (_strFeature == `featureMusicJam`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= EXTRA_GENERATION();
		}
		else
		{
			return GetVersion() >= GENERATION6_SEASON2();
		}
	}
	else if (_strFeature == `featureDelWeddingDress`)
	{
		if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION8_SEASON5();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION8_SEASON5();
		}
	}

	else if (_strFeature == `featureNewbieMovie`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION1_SEASON2();
		}
	}
	else if (_strFeature == `featureFirstHumanUlad`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION10_SEASON2();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION1_SEASON2();
		}
	}
	else if (_strFeature == `featureFashionShow`)
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	else if (_strFeature == `feature50Javelin`)
	{
		return GetVersion() >= GENERATION10_SEASON2();
	}
	else if (_strFeature == `featureGetAdvancedItem`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
	}
	else if (_strFeature == `featureVIPBagTaiwan`)
	{
		if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
	}
	else if (_strFeature == `featureIRentalBagOverse`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION12_SEASON1();
		}
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION12_SEASON1();
		}
	}
	else if (_strFeature == `featureAncientTreasureChest`)
	{
		if (GetLocale().LowerCase() == `japan`)
		{
			return GetVersion() >= GENERATION12_SEASON1(); // 고대의 보물 상자
		}
		else	if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION12_SEASON2(); // 고대의 보물 상자
		}
		else	if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION11_SEASON2(); // 고대의 보물 상자
		}
		else	if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION12_SEASON2(); // 고대의 보물 상자
		}
	}

	else if (_strFeature == `featureSecretShopTaiwan`)
	{
		if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
	}
	else if (_strFeature == `featureWeekRebirth`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION9_SEASON1();
		}
		else if (GetLocale().LowerCase() == `taiwan`)
		{
			return GetVersion() >= GENERATION10_SEASON1();
		}
		else if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION6_SEASON4();
		}
		else if (GetLocale().LowerCase() == `europe`)
		{
			return true;
		}
	}
	else if (_strFeature == `featureGuildEU`)
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION2_SEASON1();
		}
		else
		{
			return GetVersion() >= OPEN_BETA();
		}
	}

	else if (_strFeature == `featureBankEU`)
	{
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON1();
		}
		else
		{
			return GetVersion() >= OPEN_BETA();
		}
	}
	else if (_strFeature == `featureG1edernShop`)
	{
		return GetVersion() >= GENERATION2_SEASON1();
	}
	else if (_strFeature == `featureGiveNaoSoulStoneToCharacterByFreeCard`)
	{
		if (GetLocale().LowerCase() == `usa`)
		{
			return GetVersion() >= GENERATION9_SEASON1();
		}
		if (GetLocale().LowerCase() == `europe`)
		{
			return GetVersion() >= GENERATION3_SEASON4();
		}
		if (GetLocale().LowerCase() == `china`)
		{
			return GetVersion() >= GENERATION12_SEASON1();
		}
	}
	else if (_strFeature == `featureDataDrivenRepairRate`)
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			return GetVersion() >= GENERATION12_SEASON2();
		}
	}

	return false;
}