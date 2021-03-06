//////////////////////////////////////////////////////////////////////////////////
//								Mabinogi Project  Script
//								컬렉션북
//
//								HanStone begins at 2005. 01. 25
//////////////////////////////////////////////////////////// component of Mabinogi
//////////////////////////////////////////////////////////////////////////////////
server bool OneCollected(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

//	player.ShowEffect(`<effect type='flash' time='3000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() + ["event.collectionbook.2"];

	player.ShowCaption(message);
	return true;

}
//////////////////////////////////////////////////////////////////////////////////
server bool C3OneCollected(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

//	player.ShowEffect(`<effect type='flash' time='3000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() + ["event.collectionbook.2"];

	player.ShowCaption(message);

	if (cItemcollected.GetClassId() == 75250)
	{
		player.AddKeyword(`experiment_clue1`);
	}
	else if (cItemcollected.GetClassId() == 75251)
	{
		player.AddKeyword(`experiment_clue2`);
	}
	else if (cItemcollected.GetClassId() == 75252)
	{
		player.AddKeyword(`experiment_clue3`);
	}
	else if (cItemcollected.GetClassId() == 75253)
	{
		player.AddKeyword(`experiment_clue4`);
	}
	else if (cItemcollected.GetClassId() == 75254)
	{
		player.AddKeyword(`experiment_clue5`);
	}
	else if (cItemcollected.GetClassId() == 75255)
	{
		player.AddKeyword(`experiment_clue6`);
	}
	else if (cItemcollected.GetClassId() == 75256)
	{
		player.AddKeyword(`experiment_clue7`);
	}
	else if (cItemcollected.GetClassId() == 75257)
	{
		player.AddKeyword(`experiment_clue8`);
	}

	return true;
}




//////////////////////////////////////////////////////////////////////////////////
server bool G12OneCollected(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

//	player.ShowEffect(`<effect type='flash' time='3000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() + ["event.collectionbook.2"];

	player.ShowCaption(message);

	if (cItemcollected.GetClassId() == 75433)
	{
		player.AddKeyword(`g12_treasure01`);
	}
	else if (cItemcollected.GetClassId() == 75432)
	{
		player.AddKeyword(`g12_treasure02`);
	}
	else if (cItemcollected.GetClassId() == 75431)
	{
		player.AddKeyword(`g12_treasure03`);
	}
	else if (cItemcollected.GetClassId() == 75434)
	{
		// 75434 아이템은 퀘스트 293019 가 0단계여야만 컬렉션 가능케 설정. 미리 넣는 것을 막고자.
		if(player.HaveQuestTemplate(293019) && player.GetCompletedQuestObjectiveCount(293019)==1)
		{
			player.AddKeyword(`g12_treasure04`);
		}
		else
		{
			message= ["event.collectionbook.85"];
			player.ShowCaption(message);
			return false;
		}
	}
	else if (cItemcollected.GetClassId() == 75429)
	{
		player.AddKeyword(`g12_treasure05`);
	}
	else if (cItemcollected.GetClassId() == 75428)
	{
		player.AddKeyword(`g12_treasure06`);
	}
	else if (cItemcollected.GetClassId() == 75427)
	{
		player.AddKeyword(`g12_treasure07`);
	}
	else if (cItemcollected.GetClassId() == 75430)
	{
		player.AddKeyword(`g12_treasure08`);
	}

	return true;
}






























//////////////////////////////////////////////////////////////////////////////////
server void FullCollected(
	character player,
	item cItembook
	)
//////////////////////////////////////////////////////////////////////////////////

{
	string message;
//	player.ShowEffect(`<effect type='flash' time='1000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.3"];

	player.ShowCaption(message);
}

//////////////////////////////////////////////////////////////////////////////////
server void FullCollectedOwl(
	character player,
	item cItembook
	)
//////////////////////////////////////////////////////////////////////////////////

{
	string message;
//	player.ShowEffect(`<effect type='flash' time='1000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= ["event.collectionbook.83"];

	player.ShowCaption(message);
}

//////////////////////////////////////////////////////////////////////////////////
server void FullCollected_Partholon(
	character player,
	item cItembook
	)
//////////////////////////////////////////////////////////////////////////////////

{
	string message;
//	player.ShowEffect(`<effect type='flash' time='1000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.3"];

	player.AddKeyword(`g11_11`);
	player.ShowCaption(message);
}


//////////////////////////////////////////////////////////////////////////////////
server void GotCollectedReward(
	character player,
	item cItembook
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

	player.ShowEffect(`<effect type='flash' time='2000' />`);
	player.PlaySound(`<sound file='data/sound/ui/levelup.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.4"];

	player.ShowCaption(message);

	/////////////////////////////////////////////////////////////
	//		컬렉션북이 랜덤 보상이면 아래와 같이 처리.		//
	/////////////////////////////////////////////////////////////

	// 한국 2008년 12월 별똥별 이벤트 관련 보상 수정
	if (cItembook.GetClassId() == 1565 )
	{
		RandomReward(player, 1565);
	}
	if (cItembook.GetClassId() == 1566)
	{
		RandomReward(player, 1566);
	}
	if (cItembook.GetClassId() == 1567)
	{
		RandomReward(player, 1567);
	}
	if (cItembook.GetClassId() == 1568)
	{
		RandomReward(player, 1568);
	}
	if (cItembook.GetClassId() == 1615)
	{
		RandomReward(player, 1615);
	}
	if (cItembook.GetClassId() == 1617)
	{
		RandomReward(player, 1617);
	}

        // 4주년 이벤트를 이벤트 기간에 하면 추가 키워드를 준다.
	if (cItembook.GetClassId() == 1570 && IsCurrentEvent(`4th_anniversary_2008_korea`))
	{
		player.AddKeyword(`4th_anniversary_korea_robe`); //2007 할로윈 이벤트 참가자 체크
	}
	if (cItembook.GetClassId() == 1571 && IsCurrentEvent(`4th_anniversary_2008_korea`))
	{
		player.AddKeyword(`4th_anniversary_korea_shied`); //2007 할로윈 이벤트 참가자 체크
	}
	if (cItembook.GetClassId() == 1584)
	{
		//드래곤 컷신
		player.PlayCutScene(`summon_dragon`, 1);

	}


}

//////////////////////////////////////////////////////////////////////////////////
server bool CanGetReward(
	character player,
	item cItembook
	)
//////////////////////////////////////////////////////////////////////////////////
{
	if (cItembook.GetClassId() == 1584)
	{
		player.Stop();
		
		if (player.IsInDungeon() || player.IsInInstantZone() || player.IsInArena() || player.IsInIndoor())
		{
			player.ShowCaption(["event.collectionbook.90"]);
			return false;
		}
		
		int boxcount = 5;
		if (player.CanCreateRandomBox(cItembook.GetClassId(), boxcount) != boxcount)
		{
			player.ShowCaption(["event.collectionbook.89"]);
			return false;
		}
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool  NewyearOneCollected(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

//	player.ShowEffect(`<effect type='flash' time='3000' />`);
	player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

	message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() + ["event.collectionbook.2"];

	player.ShowCaption(message);

	// 해외신년이벤트2009 이벤트 컬렉션 북 키워드 준다.
	if (cItemcollected.GetClassId() == 91092)
	{
		player.AddKeyword(`NewYearCollect01_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91093)
	{
		player.AddKeyword(`NewYearCollect02_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91094)
	{
		player.AddKeyword(`NewYearCollect03_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91095)
	{
		player.AddKeyword(`NewYearCollect04_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91096)
	{
		player.AddKeyword(`NewYearCollect05_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91097)
	{
		player.AddKeyword(`NewYearCollect06_2010Foreign`);
	}
	else if (cItemcollected.GetClassId() == 91098)
	{
		player.AddKeyword(`NewYearCollect07_2010Foreign`);
	}
	return true;

}

//////////////////////////////////////////////////////////////////////////////////
server bool RandomReward(
	character player,
	int bookID
	)
//////////////////////////////////////////////////////////////////////////////////
{

	// 2010 대만 어린이날 이벤트 아기 호랑이를 부탁해
	if (bookID == 1617)
	{
		player.ShowCaption(["event.collectionbook.86"]);
		int randomSetId = 1032;
		int itemIndex = GetItemIndexFromRandomSet(randomSetId, player);
		
		string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
		
		item newItem;
		newItem = player.AddItemEx(itemString, true);
		player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
		return true;
	}

	// 2009 부엉이를 부탁해 이벤트 보상
	if (bookID == 1615)
	{
		player.ShowCaption(["event.collectionbook.84"]);
		int ItemClassID ;

		ItemClassID = 0 ;

/*
		if (GetLocale().LowerCase() == `korea`) // 2010년 현물 이벤트 제외
		{
			ItemClassID = GetEventReward(`takecareofmyowl2009_korea`);
		}
*/
		if (ItemClassID > 0)
		{
			player.DoStript(`additemex(id:`+ToString(ItemClassID)+` rewardview:true)`);
			player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
			return true;
		}
		else
		{
			//하급
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(10000);	//확률의 총합을 적는다

			if (GetLocale().LowerCase() == `usa`)
			{
				while(true)
				{
					bool bBreak = false;
					string itemString;
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case( 0 ){itemString = `id:15354`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 슈트
						case( 1 ){itemString = `id:15355`; iCumRate += 8 ;} // 0.08 파이릿 우드워커 웨어
						case( 2 ){itemString = `id:15356`; iCumRate += 8 ;} // 0.08 파이릿 크루 유니폼
						case( 3 ){itemString = `id:17140`; iCumRate += 9 ;} // 0.09 파이릿 캡틴 부츠
						case( 4 ){itemString = `id:17141`; iCumRate += 9 ;} // 0.09 파이릿 우드워커 부츠
						case( 5 ){itemString = `id:17142`; iCumRate += 9 ;} // 0.09 파이릿 크루 부츠
						case( 6 ){itemString = `id:18241`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 모자
						case( 7 ){itemString = `id:17044 prefix:20721`; iCumRate += 6 ;} // 0.06 한가한 트윈버클 부츠
						case( 8 ){itemString = `id:40225`; iCumRate += 4 ;} // 0.04 윙보우
						case( 9 ){itemString = `id:18156`; iCumRate += 3 ;} // 0.03 고글모자
						case( 10 ){itemString = `id:15268`; iCumRate += 3 ;} // 0.03 테라 고딕 펑크 수트
						case( 11 ){itemString = `id:15326`; iCumRate += 5 ;} // 0.05 박쥐 드레스
						case( 12 ){itemString = `id:17077`; iCumRate += 20 ;} // 0.2 월터 레더 벤딩 부츠
						case( 13 ){itemString = `id:15325`; iCumRate += 20 ;} // 0.2 박쥐 자켓
						case( 14 ){itemString = `id:18566`; iCumRate += 20 ;} // 0.2 박쥐모자
						case( 15 ){itemString = `id:15316`; iCumRate += 20 ;} // 0.2 카리스 위자드 수트
						case( 16 ){itemString = `id:17132`; iCumRate += 20 ;} // 0.2 박쥐 부츠
						case( 17 ){itemString = `id:15258`; iCumRate += 20 ;} // 0.2 베키 위치 드레스
						case( 18 ){itemString = `id:15096`; iCumRate += 20 ;} // 0.2 셀리나 섹시 베어룩
						case( 19 ){itemString = `id:15065`; iCumRate += 20 ;} // 0.2 엘라 베스트 스커트
						case( 20 ){itemString = `id:40095`; iCumRate += 20 ;} // 0.2 드래곤 블레이드
						case( 21 ){itemString = `id:18028   prefix:20601`; iCumRate += 20 ;} // 0.2 축복의 접이식 안걍
						case( 22 ){itemString = `id:18159   prefix:20612`; iCumRate += 20 ;} // 0.2 근사한 뿔테 안경
						case( 23 ){itemString = `id:18029   prefix:20701`; iCumRate += 20 ;} // 0.2 거센 나무테 안경
						case( 24 ){itemString = `id:16519`; iCumRate += 200 ;} // 2 초호화장갑
						case( 25 ){itemString = `id:40232`; iCumRate += 200 ;} // 2 크라운 아이스 원드
						case( 26 ){itemString = `id:40233`; iCumRate += 200 ;} // 2 피닉스 파이어 원드
						case( 27 ){itemString = `id:40231`; iCumRate += 200 ;} // 2 크리스탈 라이트닝 원드
						case( 28 ){itemString = `id:40234`; iCumRate += 200 ;} // 2 티카나무 힐링 원드
						case( 29 ){itemString = `id:46006`; iCumRate += 200 ;} // 2 카이트 실드
						case( 30 ){itemString = `id:46008`; iCumRate += 200 ;} // 2 라이트 헤테로 카이트 실드
						case( 31 ){itemString = `id:18519`; iCumRate += 200 ;} // 2 파나쉬 헤드 프로텍터
						case( 32 ){itemString = `id:18547`; iCumRate += 200 ;} // 2 빅 파나쉬 헤드 프로텍터
						case( 33 ){itemString = `id:15151`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (남성용)
						case( 34 ){itemString = `id:15152`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (여성용)
						case( 35 ){itemString = `id:14028`; iCumRate += 200 ;} // 2 에스테반 메일 (남성용)
						case( 36 ){itemString = `id:14029`; iCumRate += 200 ;} // 2 에스테반 메일 (여성용)
						case( 37 ){itemString = `id:17069`; iCumRate += 200 ;} // 2 레오 슈즈
						case( 38 ){itemString = `id:17070`; iCumRate += 200 ;} // 2 레오 타이 슈즈
						case( 39 ){itemString = `id:17064`; iCumRate += 200 ;} // 2 카멜 스피리트 부츠
						case( 40 ){itemString = `id:17040`; iCumRate += 200 ;} // 2 엘라 스트랩 부츠
						case( 41 ){itemString = `id:16032`; iCumRate += 200 ;} // 2 엘빈 글러브
						case( 42 ){itemString = `id:15182`; iCumRate += 200 ;} // 2 키라 벨트 스커트 (엘프)
						case( 43 ){itemString = `id:14042`; iCumRate += 200 ;} // 2 컬스틴 레더 아머 (자이언트)
						case( 44 ){itemString = `id:18028`; iCumRate += 240 ;} // 2.4 접이식 안경
						case( 45 ){itemString = `id:18029`; iCumRate += 240 ;} // 2.4 나무테 안경
						case( 46 ){itemString = `id:18160`; iCumRate += 240 ;} // 2.4 트루디 메탈 안경
						case( 47 ){itemString = `id:18153`; iCumRate += 240 ;} // 2.4 얼음 장미
						case( 48 ){itemString = `id:91034`; iCumRate += 240 ;} // 2.4 경험치 포션(5분)
						case( 49 ){itemString = `id:63016   count:10`; iCumRate += 240 ;} // 2.4 축복의 포션 10 개
						case( 50 ){itemString = `id:18044`; iCumRate += 240 ;} // 2.4 범죄용 복면
						case( 51 ){itemString = `id:15255`; iCumRate += 1000 ;} // 10 남성용 수영복
						case( 52 ){itemString = `id:15256`; iCumRate += 1000 ;} // 10 여성용 수영복
						case( 53 ){itemString = `id:15348`; iCumRate += 1000 ;} // 10 남성용 수영복2
						case( 54 ){itemString = `id:15349`; iCumRate += 1000 ;} // 10 여성용 수영복2

						// 여기다 넣으세요의 끝

						default
						{
							bBreak = true;
							itemString = `id:15349`;		// 혹시 잘못되면 수영복이라도 받아랏!
						}
					}
					if (bBreak)
					{
						break;
					}

					if (iRandom < iCumRate)
					{
						DebugOut(`유저에게 `+itemString+` 를 줌`);
						player.DoStript(`additemex(`+itemString+` rewardview:true)`);
						player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
						return true;
					}
					++i;
				}
			}
			if (GetLocale().LowerCase() == `china`)
			{
				while(true)
				{
					bool bBreak = false;
					string itemString;
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case( 0 ){itemString = `id:15354`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 슈트
						case( 1 ){itemString = `id:15355`; iCumRate += 8 ;} // 0.08 파이릿 우드워커 웨어
						case( 2 ){itemString = `id:15356`; iCumRate += 8 ;} // 0.08 파이릿 크루 유니폼
						case( 3 ){itemString = `id:17140`; iCumRate += 9 ;} // 0.09 파이릿 캡틴 부츠
						case( 4 ){itemString = `id:17141`; iCumRate += 9 ;} // 0.09 파이릿 우드워커 부츠
						case( 5 ){itemString = `id:17142`; iCumRate += 9 ;} // 0.09 파이릿 크루 부츠
						case( 6 ){itemString = `id:18241`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 모자
						case( 7 ){itemString = `id:18577`; iCumRate += 6 ;} // 0.06 드래곤 스케일 헬름
						case( 8 ){itemString = `id:40225`; iCumRate += 4 ;} // 0.04 윙보우
						case( 9 ){itemString = `id:17530`; iCumRate += 3 ;} // 0.03 드래곤 스케일 그리브
						case( 10 ){itemString = `id:13060`; iCumRate += 3 ;} // 0.03 드래곤 스케일 아머
						case( 11 ){itemString = `id:13061`; iCumRate += 5 ;} // 0.05 드래곤 스케일 아머
						case( 12 ){itemString = `id:17077`; iCumRate += 20 ;} // 0.2 월터 레더 벤딩 부츠
						case( 13 ){itemString = `id:16543`; iCumRate += 20 ;} // 0.2 드래곤 스케일 건틀렛
						case( 14 ){itemString = `id:15377`; iCumRate += 20 ;} // 0.2 로맨틱 고딕 수트
						case( 15 ){itemString = `id:15316`; iCumRate += 20 ;} // 0.2 카리스 위자드 수트
						case( 16 ){itemString = `id:15381`; iCumRate += 20 ;} // 0.2 댄디 고딕 케이프 수트
						case( 17 ){itemString = `id:15258`; iCumRate += 20 ;} // 0.2 베키 위치 드레스
						case( 18 ){itemString = `id:15096`; iCumRate += 20 ;} // 0.2 셀리나 섹시 베어룩
						case( 19 ){itemString = `id:15065`; iCumRate += 20 ;} // 0.2 엘라 베스트 스커트
						case( 20 ){itemString = `id:40241`; iCumRate += 20 ;} // 0.2 더스틴 실버 나이트 소드
						case( 21 ){itemString = `id:18198   prefix:20601`; iCumRate += 20 ;} // 0.2 축복의 모노클
						case( 22 ){itemString = `id:18198   prefix:20833`; iCumRate += 20 ;} // 0.2 콜드 모노클
						case( 23 ){itemString = `id:18198   prefix:20701`; iCumRate += 20 ;} // 0.2 거센 모노클
						case( 24 ){itemString = `id:16519`; iCumRate += 200 ;} // 2 초호화장갑
						case( 25 ){itemString = `id:40232`; iCumRate += 200 ;} // 2 크라운 아이스 원드
						case( 26 ){itemString = `id:40233`; iCumRate += 200 ;} // 2 피닉스 파이어 원드
						case( 27 ){itemString = `id:40231`; iCumRate += 200 ;} // 2 크리스탈 라이트닝 원드
						case( 28 ){itemString = `id:40234`; iCumRate += 200 ;} // 2 티카나무 힐링 원드
						case( 29 ){itemString = `id:46006`; iCumRate += 200 ;} // 2 카이트 실드
						case( 30 ){itemString = `id:46020`; iCumRate += 200 ;} // 2 발레스 실드
						case( 31 ){itemString = `id:18519`; iCumRate += 200 ;} // 2 파나쉬 헤드 프로텍터
						case( 32 ){itemString = `id:18547`; iCumRate += 200 ;} // 2 빅 파나쉬 헤드 프로텍터
						case( 33 ){itemString = `id:15151`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (남성용)
						case( 34 ){itemString = `id:15152`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (여성용)
						case( 35 ){itemString = `id:14028`; iCumRate += 200 ;} // 2 에스테반 메일 (남성용)
						case( 36 ){itemString = `id:14029`; iCumRate += 200 ;} // 2 에스테반 메일 (여성용)
						case( 37 ){itemString = `id:17069`; iCumRate += 200 ;} // 2 레오 슈즈
						case( 38 ){itemString = `id:17070`; iCumRate += 200 ;} // 2 레오 타이 슈즈
						case( 39 ){itemString = `id:17064`; iCumRate += 200 ;} // 2 카멜 스피리트 부츠
						case( 40 ){itemString = `id:17040`; iCumRate += 200 ;} // 2 엘라 스트랩 부츠
						case( 41 ){itemString = `id:16032`; iCumRate += 200 ;} // 2 엘빈 글러브
						case( 42 ){itemString = `id:15182`; iCumRate += 200 ;} // 2 키라 벨트 스커트 (엘프)
						case( 43 ){itemString = `id:14042`; iCumRate += 200 ;} // 2 컬스틴 레더 아머 (자이언트)
						case( 44 ){itemString = `id:18028`; iCumRate += 240 ;} // 2.4 접이식 안경
						case( 45 ){itemString = `id:18029`; iCumRate += 240 ;} // 2.4 나무테 안경
						case( 46 ){itemString = `id:18160`; iCumRate += 240 ;} // 2.4 트루디 메탈 안경
						case( 47 ){itemString = `id:18153`; iCumRate += 240 ;} // 2.4 얼음 장미
						case( 48 ){itemString = `id:91034`; iCumRate += 240 ;} // 2.4 경험치 포션(5분)
						case( 49 ){itemString = `id:65045   count:10`; iCumRate += 240 ;} // 2.4 구름의 결정 10 개
						case( 50 ){itemString = `id:65009   count:10`; iCumRate += 240 ;} // 2.4 라이프 드레인의 결정 10 개
						case( 51 ){itemString = `id:15255`; iCumRate += 1000 ;} // 10 남성용 수영복
						case( 52 ){itemString = `id:15256`; iCumRate += 1000 ;} // 10 여성용 수영복
						case( 53 ){itemString = `id:15348`; iCumRate += 1000 ;} // 10 남성용 수영복2
						case( 54 ){itemString = `id:15349`; iCumRate += 1000 ;} // 10 여성용 수영복2

						// 여기다 넣으세요의 끝

						default
						{
							bBreak = true;
							itemString = `id:15349`;		// 혹시 잘못되면 수영복이라도 받아랏!
						}
					}
					if (bBreak)
					{
						break;
					}

					if (iRandom < iCumRate)
					{
						DebugOut(`유저에게 `+itemString+` 를 줌`);
						player.DoStript(`additemex(`+itemString+` rewardview:true)`);
						player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
						return true;
					}
					++i;
				}
			}
			if (GetLocale().LowerCase() == `taiwan`)
			{
				while(true)
				{
					bool bBreak = false;
					string itemString;
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case( 0 ){itemString = `id:15354`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 슈트
						case( 1 ){itemString = `id:15355`; iCumRate += 8 ;} // 0.08 파이릿 우드워커 웨어
						case( 2 ){itemString = `id:15356`; iCumRate += 8 ;} // 0.08 파이릿 크루 유니폼
						case( 3 ){itemString = `id:17140`; iCumRate += 9 ;} // 0.09 파이릿 캡틴 부츠
						case( 4 ){itemString = `id:17141`; iCumRate += 9 ;} // 0.09 파이릿 우드워커 부츠
						case( 5 ){itemString = `id:17142`; iCumRate += 9 ;} // 0.09 파이릿 크루 부츠
						case( 6 ){itemString = `id:18241`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 모자
						case( 7 ){itemString = `id:18577`; iCumRate += 6 ;} // 0.06 드래곤 스케일 헬름
						case( 8 ){itemString = `id:40225`; iCumRate += 4 ;} // 0.04 윙보우
						case( 9 ){itemString = `id:17530`; iCumRate += 3 ;} // 0.03 드래곤 스케일 그리브
						case( 10 ){itemString = `id:13060`; iCumRate += 3 ;} // 0.03 드래곤 스케일 아머
						case( 11 ){itemString = `id:13061`; iCumRate += 5 ;} // 0.05 드래곤 스케일 아머
						case( 12 ){itemString = `id:17077`; iCumRate += 20 ;} // 0.2 월터 레더 벤딩 부츠
						case( 13 ){itemString = `id:16543`; iCumRate += 20 ;} // 0.2 드래곤 스케일 건틀렛
						case( 14 ){itemString = `id:15377`; iCumRate += 20 ;} // 0.2 로맨틱 고딕 수트
						case( 15 ){itemString = `id:15316`; iCumRate += 20 ;} // 0.2 카리스 위자드 수트
						case( 16 ){itemString = `id:15381`; iCumRate += 20 ;} // 0.2 댄디 고딕 케이프 수트
						case( 17 ){itemString = `id:15258`; iCumRate += 20 ;} // 0.2 베키 위치 드레스
						case( 18 ){itemString = `id:15096`; iCumRate += 20 ;} // 0.2 셀리나 섹시 베어룩
						case( 19 ){itemString = `id:15065`; iCumRate += 20 ;} // 0.2 엘라 베스트 스커트
						case( 20 ){itemString = `id:40241`; iCumRate += 20 ;} // 0.2 더스틴 실버 나이트 소드
						case( 21 ){itemString = `id:18198   prefix:20601`; iCumRate += 20 ;} // 0.2 축복의 모노클
						case( 22 ){itemString = `id:18198   prefix:20833`; iCumRate += 20 ;} // 0.2 콜드 모노클
						case( 23 ){itemString = `id:18198   prefix:20701`; iCumRate += 20 ;} // 0.2 거센 모노클
						case( 24 ){itemString = `id:16519`; iCumRate += 200 ;} // 2 초호화장갑
						case( 25 ){itemString = `id:40232`; iCumRate += 200 ;} // 2 크라운 아이스 원드
						case( 26 ){itemString = `id:40233`; iCumRate += 200 ;} // 2 피닉스 파이어 원드
						case( 27 ){itemString = `id:40231`; iCumRate += 200 ;} // 2 크리스탈 라이트닝 원드
						case( 28 ){itemString = `id:40234`; iCumRate += 200 ;} // 2 티카나무 힐링 원드
						case( 29 ){itemString = `id:46006`; iCumRate += 200 ;} // 2 카이트 실드
						case( 30 ){itemString = `id:46020`; iCumRate += 200 ;} // 2 발레스 실드
						case( 31 ){itemString = `id:18519`; iCumRate += 200 ;} // 2 파나쉬 헤드 프로텍터
						case( 32 ){itemString = `id:18547`; iCumRate += 200 ;} // 2 빅 파나쉬 헤드 프로텍터
						case( 33 ){itemString = `id:15151`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (남성용)
						case( 34 ){itemString = `id:15152`; iCumRate += 200 ;} // 2 뉴욕 마리오 웨이스트 테일러 웨어 (여성용)
						case( 35 ){itemString = `id:14028`; iCumRate += 200 ;} // 2 에스테반 메일 (남성용)
						case( 36 ){itemString = `id:14029`; iCumRate += 200 ;} // 2 에스테반 메일 (여성용)
						case( 37 ){itemString = `id:17069`; iCumRate += 200 ;} // 2 레오 슈즈
						case( 38 ){itemString = `id:17070`; iCumRate += 200 ;} // 2 레오 타이 슈즈
						case( 39 ){itemString = `id:17064`; iCumRate += 200 ;} // 2 카멜 스피리트 부츠
						case( 40 ){itemString = `id:17040`; iCumRate += 200 ;} // 2 엘라 스트랩 부츠
						case( 41 ){itemString = `id:16032`; iCumRate += 200 ;} // 2 엘빈 글러브
						case( 42 ){itemString = `id:15182`; iCumRate += 200 ;} // 2 키라 벨트 스커트 (엘프)
						case( 43 ){itemString = `id:14042`; iCumRate += 200 ;} // 2 컬스틴 레더 아머 (자이언트)
						case( 44 ){itemString = `id:18028`; iCumRate += 240 ;} // 2.4 접이식 안경
						case( 45 ){itemString = `id:18029`; iCumRate += 240 ;} // 2.4 나무테 안경
						case( 46 ){itemString = `id:18160`; iCumRate += 240 ;} // 2.4 트루디 메탈 안경
						case( 47 ){itemString = `id:18153`; iCumRate += 240 ;} // 2.4 얼음 장미
						case( 48 ){itemString = `id:65049   count:10`; iCumRate += 240 ;} // 2.4 스파크의 결정 10 개
						case( 49 ){itemString = `id:65045   count:10`; iCumRate += 240 ;} // 2.4 구름의 결정 10 개
						case( 50 ){itemString = `id:65009   count:10`; iCumRate += 240 ;} // 2.4 라이프 드레인의 결정 10 개
						case( 51 ){itemString = `id:15255`; iCumRate += 1000 ;} // 10 남성용 수영복
						case( 52 ){itemString = `id:15256`; iCumRate += 1000 ;} // 10 여성용 수영복
						case( 53 ){itemString = `id:15348`; iCumRate += 1000 ;} // 10 남성용 수영복2
						case( 54 ){itemString = `id:15349`; iCumRate += 1000 ;} // 10 여성용 수영복2

						// 여기다 넣으세요의 끝

						default
						{
							bBreak = true;
							itemString = `id:15349`;		// 혹시 잘못되면 수영복이라도 받아랏!
						}
					}
					if (bBreak)
					{
						break;
					}

					if (iRandom < iCumRate)
					{
						DebugOut(`유저에게 `+itemString+` 를 줌`);
						player.DoStript(`additemex(`+itemString+` rewardview:true)`);
						player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
						return true;
					}
					++i;
				}
			}

			if (GetLocale().LowerCase() == `japan`)
			{
				while(true)
				{
					bool bBreak = false;
					string itemString;
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case( 0 ){itemString = `id:15354`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 슈트
						case( 1 ){itemString = `id:15355`; iCumRate += 8 ;} // 0.08 파이릿 우드워커 웨어
						case( 2 ){itemString = `id:15356`; iCumRate += 8 ;} // 0.08 파이릿 크루 유니폼
						case( 3 ){itemString = `id:17140`; iCumRate += 9 ;} // 0.09 파이릿 캡틴 부츠
						case( 4 ){itemString = `id:17141`; iCumRate += 9 ;} // 0.09 파이릿 우드워커 부츠
						case( 5 ){itemString = `id:17142`; iCumRate += 9 ;} // 0.09 파이릿 크루 부츠
						case( 6 ){itemString = `id:18241`; iCumRate += 8 ;} // 0.08 파이릿 캡틴 모자
						case( 7 ){itemString = `id:18577`; iCumRate += 6 ;} // 0.06 드래곤 스케일 헬름
						case( 8 ){itemString = `id:40225`; iCumRate += 4 ;} // 0.04 윙보우
						case( 9 ){itemString = `id:17530`; iCumRate += 3 ;} // 0.03 드래곤 스케일 그리브
						case( 10 ){itemString = `id:13060`; iCumRate += 3 ;} // 0.03 드래곤 스케일 아머
						case( 11 ){itemString = `id:13061`; iCumRate += 5 ;} // 0.05 드래곤 스케일 아머
						case( 12 ){itemString = `id:17077`; iCumRate += 20 ;} // 0.2 월터 레더 벤딩 부츠
						case( 13 ){itemString = `id:16543`; iCumRate += 20 ;} // 0.2 드래곤 스케일 건틀렛
						case( 14 ){itemString = `id:15377`; iCumRate += 20 ;} // 0.2 로맨틱 고딕 수트
						case( 15 ){itemString = `id:15316`; iCumRate += 20 ;} // 0.2 카리스 위자드 수트
						case( 16 ){itemString = `id:15381`; iCumRate += 20 ;} // 0.2 댄디 고딕 케이프 수트
						case( 17 ){itemString = `id:15258`; iCumRate += 20 ;} // 0.2 베키 위치 드레스
						case( 18 ){itemString = `id:15096`; iCumRate += 20 ;} // 0.2 셀리나 섹시 베어룩
						case( 19 ){itemString = `id:15065`; iCumRate += 20 ;} // 0.2 엘라 베스트 스커트
						case( 20 ){itemString = `id:40241`; iCumRate += 20 ;} // 0.2 더스틴 실버 나이트 소드
						case( 21 ){itemString = `id:18198   prefix:20601`; iCumRate += 20 ;} // 0.2 축복의 모노클
						case( 22 ){itemString = `id:18198   prefix:20833`; iCumRate += 20 ;} // 0.2 콜드 모노클
						case( 23 ){itemString = `id:18198   prefix:20701`; iCumRate += 20 ;} // 0.2 거센 모노클
						case( 24 ){itemString = `id:16544`; iCumRate += 200 ;} // 2 드래곤 스케일 건틀렛 자이언트
						case( 25 ){itemString = `id:40232`; iCumRate += 200 ;} // 2 크라운 아이스 원드
						case( 26 ){itemString = `id:40233`; iCumRate += 200 ;} // 2 피닉스 파이어 원드
						case( 27 ){itemString = `id:40231`; iCumRate += 200 ;} // 2 크리스탈 라이트닝 원드
						case( 28 ){itemString = `id:40234`; iCumRate += 200 ;} // 2 티카나무 힐링 원드
						case( 29 ){itemString = `id:46006`; iCumRate += 200 ;} // 2 카이트 실드
						case( 30 ){itemString = `id:46020`; iCumRate += 200 ;} // 2 발레스 실드
						case( 31 ){itemString = `id:18519`; iCumRate += 200 ;} // 2 파나쉬 헤드 프로텍터
						case( 32 ){itemString = `id:18547`; iCumRate += 200 ;} // 2 빅 파나쉬 헤드 프로텍터
						case( 33 ){itemString = `id:13063`; iCumRate += 200 ;} // 2 드래곤 스케일 아머 자이언트 남자
						case( 34 ){itemString = `id:13062`; iCumRate += 200 ;} // 2 드래곤 스케일 아머 자이언트 여자
						case( 35 ){itemString = `id:14028`; iCumRate += 200 ;} // 2 에스테반 메일 (남성용)
						case( 36 ){itemString = `id:14029`; iCumRate += 200 ;} // 2 에스테반 메일 (여성용)
						case( 37 ){itemString = `id:17069`; iCumRate += 200 ;} // 2 레오 슈즈
						case( 38 ){itemString = `id:17070`; iCumRate += 200 ;} // 2 레오 타이 슈즈
						case( 39 ){itemString = `id:17064`; iCumRate += 200 ;} // 2 카멜 스피리트 부츠
						case( 40 ){itemString = `id:17040`; iCumRate += 200 ;} // 2 엘라 스트랩 부츠
						case( 41 ){itemString = `id:16032`; iCumRate += 200 ;} // 2 엘빈 글러브
						case( 42 ){itemString = `id:15182`; iCumRate += 200 ;} // 2 키라 벨트 스커트 (엘프)
						case( 43 ){itemString = `id:14042`; iCumRate += 200 ;} // 2 컬스틴 레더 아머 (자이언트)
						case( 44 ){itemString = `id:18028`; iCumRate += 240 ;} // 2.4 접이식 안경
						case( 45 ){itemString = `id:18029`; iCumRate += 240 ;} // 2.4 나무테 안경
						case( 46 ){itemString = `id:18160`; iCumRate += 240 ;} // 2.4 트루디 메탈 안경
						case( 47 ){itemString = `id:18153`; iCumRate += 240 ;} // 2.4 얼음 장미
						case( 48 ){itemString = `id:65049   count:10`; iCumRate += 240 ;} // 2.4 스파크의 결정 10 개
						case( 49 ){itemString = `id:65045   count:10`; iCumRate += 240 ;} // 2.4 구름의 결정 10 개
						case( 50 ){itemString = `id:65009   count:10`; iCumRate += 240 ;} // 2.4 라이프 드레인의 결정 10 개
						case( 51 ){itemString = `id:15255`; iCumRate += 1000 ;} // 10 남성용 수영복
						case( 52 ){itemString = `id:15256`; iCumRate += 1000 ;} // 10 여성용 수영복
						case( 53 ){itemString = `id:15348`; iCumRate += 1000 ;} // 10 남성용 수영복2
						case( 54 ){itemString = `id:15349`; iCumRate += 1000 ;} // 10 여성용 수영복2

						// 여기다 넣으세요의 끝

						default
						{
							bBreak = true;
							itemString = `id:15349`;		// 혹시 잘못되면 수영복이라도 받아랏!
						}
					}
					if (bBreak)
					{
						break;
					}

					if (iRandom < iCumRate)
					{
						DebugOut(`유저에게 `+itemString+` 를 줌`);
						player.DoStript(`additemex(`+itemString+` rewardview:true)`);
						player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
						return true;
					}
					++i;
				}
			}
			if (GetLocale().LowerCase() == `korea`)
			{
				while(true)
				{
					bool bBreak = false;
					string itemString;
					switch(i)
					//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
					{
						// 여기다 넣으세요
						case(0){itemString = `id:18156 `; iCumRate +=2;} //0.02고글모자
						case(1){itemString = `id:18266 `; iCumRate +=2;} //0.02썸머 니트 캡
						case(2){itemString = `id:15362 `; iCumRate +=2;} //0.02테라 고딕 펑크 수트
						case(3){itemString = `id:40225 `; iCumRate +=4;} //0.04윙보우
						case(4){itemString = `id:15361 `; iCumRate +=5;} //0.05박쥐 드레스
						case(5){itemString = `id:17044 prefix:20736`; iCumRate +=6;} //0.06고결한 트윈버클 부츠
						case(6){itemString = `id:15354 `; iCumRate +=8;} //0.08파이릿 캡틴 슈트
						case(7){itemString = `id:15355 `; iCumRate +=8;} //0.08파이릿 우드워커 웨어
						case(8){itemString = `id:15356 `; iCumRate +=8;} //0.08파이릿 크루 유니폼
						case(9){itemString = `id:18241 `; iCumRate +=8;} //0.08파이릿 캡틴 모자
						case(10){itemString = `id:17140 `; iCumRate +=9;} //0.09파이릿 캡틴 부츠
						case(11){itemString = `id:17141 `; iCumRate +=9;} //0.09파이릿 우드워커 부츠
						case(12){itemString = `id:17142 `; iCumRate +=9;} //0.09파이릿 크루 부츠
						case(13){itemString = `id:17077 `; iCumRate +=20;} //0.2월터 레더 벤딩 부츠
						case(14){itemString = `id:15360 `; iCumRate +=20;} //0.2박쥐 자켓
						case(15){itemString = `id:15377 `; iCumRate +=20;} //0.2로맨틱 고딕 수트
						case(16){itemString = `id:15316 `; iCumRate +=20;} //0.2카리스 위자드 수트
						case(17){itemString = `id:15381 `; iCumRate +=20;} //0.2댄디 고딕 케이프 수트
						case(18){itemString = `id:15258 `; iCumRate +=20;} //0.2베키 위치 드레스
						case(19){itemString = `id:15096 `; iCumRate +=20;} //0.2셀리나 섹시 베어룩
						case(20){itemString = `id:15065 `; iCumRate +=20;} //0.2엘라 베스트 스커트
						case(21){itemString = `id:40241 `; iCumRate +=20;} //0.2더스틴 실버 나이트 소드
						case(22){itemString = `id:18198 prefix:20601`; iCumRate +=20;} //0.2축복의 모노클
						case(23){itemString = `id:18198 prefix:20833`; iCumRate +=20;} //0.2콜드 모노클
						case(24){itemString = `id:18198 prefix:20701`; iCumRate +=20;} //0.2거센 모노클
						case(25){itemString = `id:16519 `; iCumRate +=200;} //2초호화장갑
						case(26){itemString = `id:40232 `; iCumRate +=200;} //2크라운 아이스 원드
						case(27){itemString = `id:40233 `; iCumRate +=200;} //2피닉스 파이어 원드
						case(28){itemString = `id:40231 `; iCumRate +=200;} //2크리스탈 라이트닝 원드
						case(29){itemString = `id:40234 `; iCumRate +=200;} //2티카나무 힐링 원드
						case(30){itemString = `id:46006 `; iCumRate +=200;} //2카이트 실드
						case(31){itemString = `id:46020 `; iCumRate +=200;} //2발레스 실드
						case(32){itemString = `id:18519 `; iCumRate +=200;} //2파나쉬 헤드 프로텍터
						case(33){itemString = `id:18547 `; iCumRate +=200;} //2빅 파나쉬 헤드 프로텍터
						case(34){itemString = `id:15151 `; iCumRate +=200;} //2뉴욕 마리오 웨이스트 테일러 웨어 (남성용)
						case(35){itemString = `id:15152 `; iCumRate +=200;} //2뉴욕 마리오 웨이스트 테일러 웨어 (여성용)
						case(36){itemString = `id:14028 `; iCumRate +=200;} //2에스테반 메일 (남성용)
						case(37){itemString = `id:14029 `; iCumRate +=200;} //2에스테반 메일 (여성용)
						case(38){itemString = `id:17069 `; iCumRate +=200;} //2레오 슈즈
						case(39){itemString = `id:17070 `; iCumRate +=200;} //2레오 타이 슈즈
						case(40){itemString = `id:17064 `; iCumRate +=200;} //2카멜 스피리트 부츠
						case(41){itemString = `id:17040 `; iCumRate +=200;} //2엘라 스트랩 부츠
						case(42){itemString = `id:16032 `; iCumRate +=200;} //2엘빈 글러브
						case(43){itemString = `id:15182 `; iCumRate +=200;} //2키라 벨트 스커트 (엘프)
						case(44){itemString = `id:14042 `; iCumRate +=200;} //2컬스틴 레더 아머 (자이언트)
						case(45){itemString = `id:18028 `; iCumRate +=500;} //5접이식 안경
						case(46){itemString = `id:18029 `; iCumRate +=500;} //5나무테 안경
						case(47){itemString = `id:18160 `; iCumRate +=500;} //5트루디 메탈 안경
						case(48){itemString = `id:18153 `; iCumRate +=500;} //5얼음 장미
						case(49){itemString = `id:65049 count:10`; iCumRate +=500;} //5스파크의 결정 10 개
						case(50){itemString = `id:65045 count:10`; iCumRate +=500;} //5구름의 결정 10 개
						case(51){itemString = `id:65009 count:10`; iCumRate +=500;} //5라이프 드레인의 결정 10 개
						case(52)
						{
							if (player.IsFemale())
							{
								itemString = `id:15263 `; iCumRate +=1090;	//5.45여성용 수영복
							}
							else
							{
								itemString = `id:15264 `; iCumRate +=1090;	//5.45남성용 수영복
							}
						}
						case(53)
						{
							if (player.IsFemale())
							{
								itemString = `id:15349 `; iCumRate +=1090;	//5.45여성용 수영복
							}
							else
							{
								itemString = `id:15348 `; iCumRate +=1090;	//5.45남성용 수영복
							}
						}
						// 여기다 넣으세요의 끝
						default
						{
							bBreak = true;
							itemString = `id:15349`;		// 혹시 잘못되면 수영복이라도 받아랏!
						}
					}
					if (bBreak)
					{
						break;
					}

					if (iRandom < iCumRate)
					{
						DebugOut(`유저에게 `+itemString+` 를 줌`);
						player.DoStript(`additemex(`+itemString+` rewardview:true)`);
						player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
						return true;
					}
					++i;
				}
			}

		}
		player.RemoveItemCls(bookID);		// 부엉이는 이제 없앤다.
		return true;
	}

	if (bookID == 1565)
	{
		if (GetLocale().LowerCase() == `japan`)			// 일본은 100% 확률로 슈팅스타 로브
		{
//			player.DoStript(`additemex(id:19040 rewardview:true)`);
			int iRandom = Random(1000);

			if  (iRandom < 141)
			{
				player.DoStript(`additemex(id:51005 count:10  rewardview:true)`);					// 14.1% 확률로 '생명력 300 포션  10개
			}
			else if (iRandom <282)
			{
				player.DoStript(`additemex(id:51010 count:10 rewardview:true)`);			// 14.1% 확률로 마나 300 포션 10개
			}
			else if (iRandom <423)
			{
				player.DoStript(`additemex(id:51015 count:10 rewardview:true)`);			// 14.1% 확률로 스태미나 300 포션 10개
			}
			else if (iRandom <634)
			{
				player.DoStript(`additemex(id:19085 rewardview:true)`);			// 21.1% 확률로 슈팅스타 로브
			}
			else if (iRandom <744)
			{
				player.DoStript(`additemex(id:15487 rewardview:true)`);			// 11% 별모양 마술사 의상 (남)
			}
			else if (iRandom <854)
			{
				player.DoStript(`additemex(id:15488 rewardview:true)`);			// 11% 별모양 마술사 의상 (여)
			}
			else if (iRandom <964)
			{
				player.DoStript(`additemex(id:18322 rewardview:true)`);			// 11% 확률로 별모양 큰챙 마술사 모자
			}
			else if (iRandom <968)
			{
				player.DoStript(`additemex(id:64042 size:10 rewardview:true)`);			// 0.4% 확률로 토파즈
			}
			else if (iRandom <972)
			{
				player.DoStript(`additemex(id:64043 size:10 rewardview:true)`);			// 0.4% 확률로 스타사파이어
			}
			else if (iRandom <976)
			{
				player.DoStript(`additemex(id:64044 size:10 rewardview:true)`);			// 0.4% 확률로 에메랄드
			}
			else if (iRandom <980)
			{
				player.DoStript(`additemex(id:64045 size:10 rewardview:true)`);			// 0.4% 확률로 아크아마린
			}
			else if (iRandom <984)
			{
				player.DoStript(`additemex(id:64046 size:10 rewardview:true)`);			// 0.4% 확률로 가넷
			}
			else if (iRandom <988)
			{
				player.DoStript(`additemex(id:64047 size:10 rewardview:true)`);			// 0.4% 확률로 재스퍼
			}
			else if (iRandom <992)
			{
				player.DoStript(`additemex(id:64048 size:10 rewardview:true)`);			// 0.4% 확률로 루비
			}
			else if (iRandom <996)
			{
				player.DoStript(`additemex(id:64049 size:10 rewardview:true)`);			// 0.4% 확률로 스피넬
			}
			else
			{
				player.DoStript(`additemex(id:64050 size:10 rewardview:true)`);					// 0.4% 확률로 다이아
			}
			return true;
		}
		else
		{
			int iRandom = Random(1000);

			if  (iRandom < 200)
			{
				player.DoStript(`additemex(id:51005 count:10  rewardview:true)`);					// 20% 확률로 '생명력 300 포션  10개
			}
			else if (iRandom <400)
			{
				player.DoStript(`additemex(id:51010 count:10 rewardview:true)`);			// 20% 확률로 마나 300 포션 10개
			}
			else if (iRandom <600)
			{
				player.DoStript(`additemex(id:51015 count:10 rewardview:true)`);			// 20% 확률로 스태미나 300 포션 10개
			}
			else if (iRandom <800)
			{
				player.DoStript(`additemex(id:19040 rewardview:true)`);			// 20% 확률로 슈팅스타 로브
			}
			else if (iRandom <985)
			{
				player.DoStript(`additemex(id:64043 size:9 rewardview:true)`);			// 18.5% 확률로 9cm 스타 사파이어
			}
			else if (iRandom <995)
			{
				player.DoStript(`additemex(id:19031 rewardview:true)`);			// 1% 확률로 스타라이트 로브
			}
			else
			{
				player.DoStript(`additemex(id:19041 rewardview:true)`);					// 0.5% 확률로 빈티지 스트라이트 로브
			}
			return true;
		}
	}

	if (bookID == 1566)
	{
		int iRandom = Random(100);

		if  (iRandom < 20)
		{
			player.DoStript(`additemex(id:51102 count:10  rewardview:true)`);					// 20% 확률로 '마나 허브' 10개
		}
		else if (iRandom >= 20 && iRandom <40)
		{
			player.DoStript(`additemex(id:60026 count:1 rewardview:true)`);			// 20% 확률로 최고급 가죽 1장
		}
		else if (iRandom >= 40 && iRandom <60)
		{
			player.DoStript(`additemex(id:51009 count:10 rewardview:true)`);			// 20% 확률로 마나 100 포션 10개
		}
		else if (iRandom >= 60 && iRandom <74)
		{
			player.AddManual(20200);
			player.ShowCaption(["event.collectionbook.74"]);							// 14% 확률로 '히터 실드' 도면
		}
		else if (iRandom >= 74 && iRandom <88)
		{
			player.AddManual(20201);
			player.ShowCaption(["event.collectionbook.82"]);							// 14% 확률로 '배틀 소드' 도면
		}
		else if (iRandom >= 88 && iRandom <97)
		{
			player.AddManual(20199);
			player.ShowCaption(["event.collectionbook.75"]);					// 9% 확률로 '더스틴 실버 나이트 소드' 도면
		}
		else
		{
			player.DoStript(`additemex(id:40236 prefix:20701 rewardview:true)`);					// 3% 확률로 '거센 엘븐 숏 보우' 보상
		}
		return true;
	}


	if (bookID == 1567)
	{
		int iRandom = Random(100);

		if  (iRandom < 25)
		{
			player.DoStript(`additemex(id:40237 quality:46 rewardview:true)`);			// 25% 확률로 '엘븐 롱 보우' 퀄리티 46
		}
		else if (iRandom >= 25 && iRandom <45)
		{
			player.DoStript(`additemex(id:40244 quality:46 rewardview:true)`);			// 20% 확률로 '베어 너클' 퀄리티 46
		}
		else if (iRandom >= 45 && iRandom <65)
		{
			player.DoStript(`additemex(id:40243 quality:46 rewardview:true)`);			// 20% 확률로 '배틀 숏 소드' 퀄리티 46
		}
		else if (iRandom >= 65 && iRandom <85)
		{
			player.AddManual(20199);
			player.ShowCaption(["event.collectionbook.76"]);			// 20% 확률로 '더스틴 실버 나이트 소드' 도면
		}
		else
		{
			player.DoStript(`additemex(id:40242 prefix:20819 quality:70 rewardview:true)`);			// 10% 확률로 '육지의 배틀 소드' 퀄리티 70
		}
		return true;
	}


	if (bookID == 1568)
	{
		int iRandom = Random(100);

		if  (iRandom < 30)
		{
			player.DoStript(`additemex(id:60054 count:2 rewardview:true)`);			// 30% 확률로 '나무판' 2개
		}
		else if (iRandom >= 30 && iRandom <60)
		{
			player.DoStript(`additemex(id:60025 count:8 rewardview:true)`);			// 30% 확률로 '고급 가죽' 8장
		}
		else if (iRandom >= 60 && iRandom <95)
		{
			player.DoStript(`additemex(id:40238 suffix:30702 rewardview:true)`);			// 10% 확률로 '레이븐 발레스 그레이트 소드'
		}
		else
		{
			player.DoStript(`additemex(id:40241 suffix:31017 quality:80 rewardview:true)`);			// 5% 확률로 '파괴의 더스틴 실버 나이트 소드' 퀄리티 80
		}
		return true;
	}



	// 랜덤 보상 추가되면 함수 여러개 만들지 말고 여기 아래에 추가하자.


	return false;
}


//////////////////////////////////////////////////////////////////////////////////
server bool HigherThan_80_Quality(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	if (cItemcollected.GetQuality()>=80)
	{
		DebugOut(`품질을 만족한다. 컬렉션하자`);
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
		player.ShowCaption(message);
		return true;
	}
	else
	{
		message= cItemcollected.GetLocalName() + ["event.collectionbook.5"];
		player.ShowCaption(message);
		return false;
	}
}



//////////////////////////////////////////////////////////////////////////////////
server bool HigherThan_90_Quality(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	if (cItemcollected.GetQuality()>=90)
	{
		DebugOut(`품질을 만족한다. 컬렉션하자`);
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
		player.ShowCaption(message);
		return true;
	}
	else
	{
		message= cItemcollected.GetLocalName() + ["event.collectionbook.5"];
		player.ShowCaption(message);
		return false;
	}
}



//////////////////////////////////////////////////////////////////////////////////
server bool HigherThan_95_Quality(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	if (cItemcollected.GetQuality()>=95)
	{
		DebugOut(`품질을 만족한다. 컬렉션하자`);
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
		player.ShowCaption(message);
		return true;
	}
	else
	{
		message= cItemcollected.GetLocalName() + ["event.collectionbook.5"];
		player.ShowCaption(message);
		return false;
	}
}



//////////////////////////////////////////////////////////////////////////////////
server bool Is5starFood(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	if (cItemcollected.IsCookingContestFood())	// 대회용 요리일 때에는 수집되지 않는다.
	{
		DebugOut(`요리 대회용 음식을 제출하였다.`);
		message= cItemcollected.GetLocalName() + ["event.collectionbook.7"];
		player.ShowCaption(message);
		return false;
	}
	else if (cItemcollected.IsExpired())	// expire 시간 지난것은 수집되지 않는다.
	{
		DebugOut(`expire time 이 지난 음식을 제출하였다.`);
		message= cItemcollected.GetLocalName() + ["event.collectionbook.8"];
		player.ShowCaption(message);
		return false;
	 }
	else if (cItemcollected.GetQuality()>=81)
	{
		DebugOut(`품질을 만족한다. 컬렉션하자`);
		//	player.ShowEffect(`<effect type='flash' time='1000' />`);
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];

		player.ShowCaption(message);
		return true;
	}
	else
	{
		message= cItemcollected.GetLocalName() + ["event.collectionbook.5"];
		player.ShowCaption(message);
		return false;
	}
}
//////////////////////////////////////////////////////////////////////////////////
server bool IsFullDurability(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`이거 내구~`+ToString(cItemcollected.GetDurability()));
	if (cItemcollected.GetDurability()==5)
	{
		DebugOut(`내구가 5다`);

		string message;
		//	player.ShowEffect(`<effect type='flash' time='1000' />`);
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];

		player.ShowCaption(message);
		return true;
	}
	else
	{
		string message;

		message= cItemcollected.GetLocalName() + ["event.collectionbook.6"];
		player.ShowCaption(message);
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	물고기 컬렉션 북 함수
//			by jisangs, 2006. 10. 26
//     보석 3cm 이상 체크하는 함수로 확장
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
server bool IsUladhFishMoreThanSize(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	float minSizeofGem = 3;   //이거 이상인 보석만 수집 가능
	float iSize = cItemcollected.GetSize()+0.005;
	int iItemId = cItemcollected.GetClassId();
	DebugOut(`사이즈 : `+ToString(iSize));
	DebugOut(`아이템 : `+ToString(iItemId));

	meta_array iArrayItemID;
	iArrayItemID.Add(50216);	// 민물 거대 육식 어류	- 190
	iArrayItemID.Add(50204);	// 금린어				- 70
	iArrayItemID.Add(50205);	// 무지개 송어		- 100
	iArrayItemID.Add(50159);	// 브리흐네 잉어		- 60
	iArrayItemID.Add(50250);	// 비단 청새치		- 200
	iArrayItemID.Add(50158);	// 은붕어				- 없음


	meta_array iArraySize;
	iArraySize.Add(190);	// 민물 거대 육식 어류	- 190
	iArraySize.Add(70);	// 금린어				- 70
	iArraySize.Add(100);	// 무지개 송어		- 100
	iArraySize.Add(60);	// 브리흐네 잉어		- 60
	iArraySize.Add(200);	// 비단 청새치		- 200
	iArraySize.Add(0);	// 은붕어				- 없음

DebugOut(`IsUladhFishMoreThanSize -----`);
DebugOut(`ItemID : ` + ToString(iItemId));
DebugOut(`Size : ` + ToString(iSize));

DebugOut(`iArrayItemID.GetSize() : ` + ToString((int)iArrayItemID.GetSize()));
	if(iItemId>=64042 && iItemId<=64050)    // 보석인가?
	{
		if(iSize>=minSizeofGem)
		{
			player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
			message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
			player.ShowCaption(message);
			return true;
		}
		else
		{
			message= cItemcollected.GetLocalName() + ["event.collectionbook.9"];
			player.ShowCaption(message);
			return false;
		}
	}

	int i = 0;
	for (i=0;i<iArrayItemID.GetSize();i++)
	{
		if (iItemId == (int)iArrayItemID.Get(i))	// 울라 물고기인가?
		{
			if ((int)iArraySize.Get(i) == 0)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else if ((int)iArraySize.Get(i) <= iSize)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else
			{
				message= cItemcollected.GetLocalName() + ["event.collectionbook.9"];
				player.ShowCaption(message);
				return false;
			}
		}
	}

	return false;
}


//	보석 5cm 크기 체크 추가    //
//////////////////////////////////////////////////////////////////////////////////
server bool IsUladhFishLessThanSize(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)

//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	float minSizeofGem = 5;   //이거 이상인 보석만 수집 가능
	float iSize = cItemcollected.GetSize()+0.005;
	int iItemId = cItemcollected.GetClassId();
	DebugOut(`사이즈 : `+ToString(iSize));
	DebugOut(`아이템 : `+ToString(iItemId));

	meta_array iArrayItemID;
	iArrayItemID.Add(50216);	// 민물 거대 육식 어류	- 190
	iArrayItemID.Add(50204);	// 금린어				- 70
	iArrayItemID.Add(50205);	// 무지개 송어		- 100
	iArrayItemID.Add(50159);	// 브리흐네 잉어		- 60
	iArrayItemID.Add(50250);	// 비단 청새치		- 200
	iArrayItemID.Add(50158);	// 은붕어				- 없음

	meta_array iArraySize;
	iArraySize.Add(200);	// 민물 거대 육식 어류	- 200
	iArraySize.Add(70);	// 금린어				- 70
	iArraySize.Add(100);	// 무지개 송어		- 100
	iArraySize.Add(60);	// 브리흐네 잉어		- 60
	iArraySize.Add(200);	// 비단 청새치		- 200
	iArraySize.Add(0);	// 은붕어				- 없음

DebugOut(`IsUladhFishLessThanSize -----`);
DebugOut(`ItemID : ` + ToString(iItemId));
DebugOut(`Size : ` + ToString(iSize));

	if(iItemId>=64042 && iItemId<=64050)    // 보석인가?
	{
		if(iSize>=minSizeofGem)
		{
			player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
			message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
			player.ShowCaption(message);
			return true;
		}
		else
		{
			message= cItemcollected.GetLocalName() + ["event.collectionbook.9"];
			player.ShowCaption(message);
			return false;
		}
	}

	int i = 0;
DebugOut(`iArrayItemID.GetSize() : ` + ToString((int)iArrayItemID.GetSize()));
	for (i=0;i<iArrayItemID.GetSize();i++)
	{
		if (iItemId == (int)iArrayItemID.Get(i))	// 울라 물고기인가?
		{
			if ((int)iArraySize.Get(i) == 0)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else if ((int)iArraySize.Get(i) >= iSize)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else
			{
				message= cItemcollected.GetLocalName() + ["event.collectionbook.10"];
				player.ShowCaption(message);
				return false;
			}
		}
	}

	return false;
}


//	보석 7cm 크기 체크 추가  //
//////////////////////////////////////////////////////////////////////////////////
server bool IsIriaFishMoreThanSize(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	float minSizeofGem = 7;   //이거 이상인 보석만 수집 가능
	float iSize = cItemcollected.GetSize()+0.005;
	int iItemId = cItemcollected.GetClassId();
	DebugOut(`사이즈 : `+ToString(iSize));
	DebugOut(`아이템 : `+ToString(iItemId));

	meta_array iArrayItemID;
	iArrayItemID.Add(50253);	// 아귀			- 40
	iArrayItemID.Add(50254);	// 날치			- 20
	iArrayItemID.Add(50255);	// 해파리			- 60
	iArrayItemID.Add(50256);	// 킹 크랩		- 100
	iArrayItemID.Add(50257);	// 바다 진주 조개	- 10
	iArrayItemID.Add(50258);	// 청새치			- 70
	iArrayItemID.Add(50259);	// 개복치			- 150
	iArrayItemID.Add(50260);	// 가오리			- 90

	meta_array iArraySize;
	iArraySize.Add(40);	// 아귀			- 40
	iArraySize.Add(20);	// 날치			- 20
	iArraySize.Add(60);	// 해파리			- 60
	iArraySize.Add(100);	// 킹 크랩		- 100
	iArraySize.Add(10);	// 바다 진주 조개	- 10
	iArraySize.Add(70);	// 청새치			- 70
	iArraySize.Add(150);	// 개복치			- 150
	iArraySize.Add(90);	// 가오리			- 90


	if(iItemId>=64042 && iItemId<=64050)    // 보석인가?
	{
		if(iSize>=minSizeofGem)
		{
			player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
			message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
			player.ShowCaption(message);
			return true;
		}
		else
		{
			message= cItemcollected.GetLocalName() + ["event.collectionbook.9"];
			player.ShowCaption(message);
			return false;
		}
	}

	int i = 0;
DebugOut(`iArrayItemID.GetSize() : ` + ToString((int)iArrayItemID.GetSize()));
	for (i=0;i<iArrayItemID.GetSize();i++)
	{
		if (iItemId == (int)iArrayItemID.Get(i))	// 이리아 물고기인가?
		{
			if ((int)iArraySize.Get(i) == 0)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else if ((int)iArraySize.Get(i) <= iSize)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else
			{
				message= cItemcollected.GetLocalName() + ["event.collectionbook.11"];
				player.ShowCaption(message);
				return false;
			}
		}
	}

	return false;
}

//	보석 9.9cm 크기 체크 추가  //
//////////////////////////////////////////////////////////////////////////////////
server bool IsIriaFishLessThanSize(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;
	float minSizeofGem = 9.9;   //이거 이상인 보석만 수집 가능
	float iSize = cItemcollected.GetSize()+0.005;
	int iItemId = cItemcollected.GetClassId();
	DebugOut(`사이즈 : `+ToString(iSize));
	DebugOut(`아이템 : `+ToString(iItemId));

	meta_array iArrayItemID;
	iArrayItemID.Add(50253);	// 아귀			- 40
	iArrayItemID.Add(50254);	// 날치			- 20
	iArrayItemID.Add(50255);	// 해파리			- 60
	iArrayItemID.Add(50256);	// 킹 크랩		- 100
	iArrayItemID.Add(50257);	// 바다 진주 조개	- 10
	iArrayItemID.Add(50258);	// 청새치			- 70
	iArrayItemID.Add(50259);	// 개복치			- 150
	iArrayItemID.Add(50260);	// 가오리			- 90

	meta_array iArraySize;
	iArraySize.Add(40);	// 아귀			- 40
	iArraySize.Add(20);	// 날치			- 20
	iArraySize.Add(60);	// 해파리			- 60
	iArraySize.Add(100);	// 킹 크랩		- 100
	iArraySize.Add(10);	// 바다 진주 조개	- 10
	iArraySize.Add(70);	// 청새치			- 70
	iArraySize.Add(150);	// 개복치			- 150
	iArraySize.Add(90);	// 가오리			- 90


	if(iItemId>=64042 && iItemId<=64050)    // 보석인가?
	{
		if(iSize>=minSizeofGem)
		{
			player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
			message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
			player.ShowCaption(message);
			return true;
		}
		else
		{
			message= cItemcollected.GetLocalName() + ["event.collectionbook.9"];
			player.ShowCaption(message);
			return false;
		}
	}


	int i = 0;
DebugOut(`iArrayItemID.GetSize() : ` + ToString((int)iArrayItemID.GetSize()));
	for (i=0;i<iArrayItemID.GetSize();i++)
	{
		if (iItemId == (int)iArrayItemID.Get(i))	// 이리아 물고기인가?
		{
			if ((int)iArraySize.Get(i) == 0)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else if ((int)iArraySize.Get(i) >= iSize)	// 크기 비교
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);

				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ cItemcollected.GetLocalName() +  ["event.collectionbook.2"];
				player.ShowCaption(message);
				return true;
			}
			else
			{
				message= cItemcollected.GetLocalName() + ["event.collectionbook.12"];
				player.ShowCaption(message);
				return false;
			}
		}
	}

	return false;
}


//////////////////////////////////////////////////////////////////////////////////
//	인챈트 컬렉션 북 함수
//			by jisangs, 2006. 10. 26
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
server bool IsPreifx8(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPreifx8`);
	string strEnchant = ["event.collectionbook.13"];
	dword dwCollectingPrefix = 8;	// 울프 헌터
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}
//////////////////////////////////////////////////////////////////////////////////
server bool IsPrefix9(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix9`);
	string strEnchant = ["event.collectionbook.14"];
	dword dwCollectingPrefix = 9;	// 라이언 헌터
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}
//////////////////////////////////////////////////////////////////////////////////
server bool IsSuffix30801(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30801`);
	string strEnchant = ["event.collectionbook.15"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30801;	// 네이쳐

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}
//////////////////////////////////////////////////////////////////////////////////
server bool IsEnchanted8and30801(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsEnchanted8and30801`);
	string strEnchant = ["event.collectionbook.16"];
	dword dwCollectingPrefix = 8;	// 울프 헌터
	dword dwCollectingSuffix = 30801;	// 네이쳐

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

///////////////////////////// uhihiho 2006.11.5 ////////////////////////////////////
server bool IsEnchanted20101and11304(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsEnchanted20101and11304`);
	string strEnchant = ["event.collectionbook.17"];
	dword dwCollectingPrefix = 20101;	// 초보의
	dword dwCollectingSuffix = 11304;	// 인내의

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 ///////////////////////////////////
server bool IsPrefix305(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix305`);
	string strEnchant = ["event.collectionbook.18"];
	dword dwCollectingPrefix = 305;	// 정교한
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 ///////////////////////////////////
server bool IsPrefix7(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix7`);
	string strEnchant = ["event.collectionbook.19"];
	dword dwCollectingPrefix = 7;	// 폭스헌터
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 ///////////////////////////////////
server bool IsSuffix10403(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10403`);
	string strEnchant = ["event.collectionbook.20"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10403;	// 크레이피쉬

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20401(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20401`);
	string strEnchant = ["event.collectionbook.21"];
	dword dwCollectingPrefix = 20401;	// 영리한
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix302(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix302`);
	string strEnchant = ["event.collectionbook.22"];
	dword dwCollectingPrefix = 302;	// 금이간
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix306(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix306`);
	string strEnchant = ["event.collectionbook.23"];
	dword dwCollectingPrefix = 306;	// 날카로운
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20205(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20205`);
	string strEnchant = ["event.collectionbook.24"];
	dword dwCollectingPrefix = 20205;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix11205(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11205`);
	string strEnchant = ["event.collectionbook.25"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11205;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10402(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10402`);
	string strEnchant = ["event.collectionbook.26"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10402;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20402(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20402`);
	string strEnchant = ["event.collectionbook.27"];
	dword dwCollectingPrefix = 20402;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20106(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20106`);
	string strEnchant = ["event.collectionbook.28"];
	dword dwCollectingPrefix = 20106;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1506(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1506`);
	string strEnchant = ["event.collectionbook.29"];
	dword dwCollectingPrefix = 1506;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20202(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20202`);
	string strEnchant = ["event.collectionbook.30"];
	dword dwCollectingPrefix = 20202;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10704(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix10704`);
	string strEnchant = ["event.collectionbook.31"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10704;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix11006(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11006`);
	string strEnchant = ["event.collectionbook.32"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11006;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30303(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30303`);
	string strEnchant = ["event.collectionbook.33"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30303;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20601(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20601`);
	string strEnchant = ["event.collectionbook.34"];
	dword dwCollectingPrefix = 20601;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

///////////////////////////// uhihiho 2006.11.5 ////////////////////////////////////
server bool IsEnchanted1705and11303(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsEnchanted1705and11303`);
	string strEnchant = ["event.collectionbook.35"];
	dword dwCollectingPrefix = 1705;	// 값싼
	dword dwCollectingSuffix = 11303;	// 늪의

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20104(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20104`);
	string strEnchant = ["event.collectionbook.36"];
	dword dwCollectingPrefix = 20104;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1706(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1706`);
	string strEnchant = ["event.collectionbook.37"];
	dword dwCollectingPrefix = 1706;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix206(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix206`);
	string strEnchant = ["event.collectionbook.38"];
	dword dwCollectingPrefix = 206;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10706(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10706`);
	string strEnchant = ["event.collectionbook.39"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10706;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10503(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10503`);
	string strEnchant = ["event.collectionbook.40"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10503;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20204(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20204`);
	string strEnchant = ["event.collectionbook.41"];
	dword dwCollectingPrefix = 20204;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30101(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30101`);
	string strEnchant = ["event.collectionbook.42"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30101;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10806(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10806`);
	string strEnchant = ["event.collectionbook.43"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10806;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix11206(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11206`);
	string strEnchant = ["event.collectionbook.44"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11206;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30201(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30201`);
	string strEnchant = ["event.collectionbook.45"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30201;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1704(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1704`);
	string strEnchant = ["event.collectionbook.46"];
	dword dwCollectingPrefix = 1704;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1702(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1702`);
	string strEnchant = ["event.collectionbook.47"];
	dword dwCollectingPrefix = 1702;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1501(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1501`);
	string strEnchant = ["event.collectionbook.48"];
	dword dwCollectingPrefix = 1501;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30202(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30202`);
	string strEnchant = ["event.collectionbook.49"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30202;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10605(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10605`);
	string strEnchant = ["event.collectionbook.50"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10605;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30307(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30307`);
	string strEnchant = ["event.collectionbook.51"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30307;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30504(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30504`);
	string strEnchant = ["event.collectionbook.52"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30504;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10504(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10504`);
	string strEnchant = ["event.collectionbook.53"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10504;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10807(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10807`);
	string strEnchant = ["event.collectionbook.54"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10807;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30505(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30505`);
	string strEnchant = ["event.collectionbook.55"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30505;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix11105(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11105`);
	string strEnchant = ["event.collectionbook.56"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11105;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30304(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30304`);
	string strEnchant = ["event.collectionbook.57"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30304;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix11106(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11106`);
	string strEnchant = ["event.collectionbook.58"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11106;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix10404(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10404`);
	string strEnchant = ["event.collectionbook.59"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10404;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsSuffix30503(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30503`);
	string strEnchant = ["event.collectionbook.60"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30503;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix4(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix4`);
	string strEnchant = ["event.collectionbook.61"];
	dword dwCollectingPrefix = 4;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix20406(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20406`);
	string strEnchant = ["event.collectionbook.62"];
	dword dwCollectingPrefix = 20406;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix303(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix303`);
	string strEnchant = ["event.collectionbook.63"];
	dword dwCollectingPrefix = 303;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// uhihiho 2006.11.5 //////////////////////////////////
server bool IsPrefix1502(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix1502`);
	string strEnchant = ["event.collectionbook.64"];
	dword dwCollectingPrefix = 1502;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSuffix30902(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30902`);
	string strEnchant = ["event.collectionbook.65"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30902;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSuffix30701(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30701`);
	string strEnchant = ["event.collectionbook.66"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30701;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSuffix11101(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11101`);
	string strEnchant = ["event.collectionbook.67"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11101;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSuffix11007(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix11007`);
	string strEnchant = ["event.collectionbook.68"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 11007;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSuffix10606(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix10606`);
	string strEnchant = ["event.collectionbook.69"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 10606;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsSufix30404(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSuffix30404`);
	string strEnchant = ["event.collectionbook.70"];
	dword dwCollectingPrefix = 0;
	dword dwCollectingSuffix = 30404;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

////////////////////////////// jisangs 2006.11.07 //////////////////////////////////
server bool IsPrefix20802(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsPrefix20802`);
	string strEnchant = ["event.collectionbook.71"];
	dword dwCollectingPrefix = 20802;
	dword dwCollectingSuffix = 0;

	return IsGivenEnchant(player, cItembook, cItemindex, cItemcollected, strEnchant, dwCollectingPrefix, dwCollectingSuffix);
}

//////////////////////////////////////////////////////////////////////////////////
server bool IsGivenEnchant(
	character player,
	item cItembook, int cItemindex, item cItemcollected,
	string strEnchant, dword dwCollectingPrefix, dword dwCollectingSuffix
	)
//////////////////////////////////////////////////////////////////////////////////
{
	string message;

	if (cItemcollected.GetClassId() == 62005)
	{
DebugOut(`인챈트 스크롤 수집 시도중`);

DebugOut(`dwPrefix : ` + ToString((int)cItemcollected.GetEnchantScrollPrefix()));
DebugOut(`dwSuffix : ` + ToString((int)cItemcollected.GetEnchantScrollSuffix()));

if (cItemcollected.IsPrefixExpired())
{
DebugOut(`IsPrefixExpired : true`);
}
else
{
DebugOut(`IsPrefixExpired : false`);
}
if (cItemcollected.IsSuffixExpired())
{
DebugOut(`IsSuffixExpired : true`);
}
else
{
DebugOut(`IsSuffixExpired : false`);
}
DebugOut(`GetExpireTime : ` + ToString(cItemcollected.GetExpireTime()));
DebugOut(`GetDurability : ` + ToString(cItemcollected.GetDurability()));
		if (
			(0 == dwCollectingPrefix || cItemcollected.GetEnchantScrollPrefix() == dwCollectingPrefix)	// prefix가 설정되지 않았거나, 수집하려는 prefix가 맞을 때
			&& (0 == dwCollectingSuffix || cItemcollected.GetEnchantScrollSuffix() == dwCollectingSuffix)	// suffix가 설정되지 않았거나, 수집하려는 suffix가 맞을 때
			&& 0 < cItemcollected.GetDurability()
		)
		{
			// 주어진 prefix와 suffix 가 expire 되지 않았을 때
			if (
				(0 == dwCollectingPrefix || !cItemcollected.IsPrefixExpired())		// prefix가 주어졌을 때 expire 되지 않아야
				&& (0 == dwCollectingSuffix || !cItemcollected.IsSuffixExpired())	// suffix가 주어졌을 때 expire 되지 않아야
			)
			{
				player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
				message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ strEnchant + ["event.collectionbook.72"];
				player.ShowCaption(message);

				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	else
	{
DebugOut(`일반 아이템 수집 시도중`);
DebugOut(`dwPrefix : ` + ToString((int)cItemcollected.GetPrefix()));
DebugOut(`dwSuffix : ` + ToString((int)cItemcollected.GetSuffix()));

		if (
			(0 == dwCollectingPrefix || cItemcollected.GetPrefix() == dwCollectingPrefix)	// prefix가 설정되지 않았거나, 수집하려는 prefix가 맞을 때
			&& (0 == dwCollectingSuffix || cItemcollected.GetSuffix() == dwCollectingSuffix)	// suffix가 설정되지 않았거나, 수집하려는 suffix가 맞을 때
		)
		{
			player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
			message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ strEnchant + ["event.collectionbook.73"];
			player.ShowCaption(message);

			return true;
		}
	}

	return false;
}

//	할로윈 이벤트 - 스케치 대상 몬스터 체크 //
////////////////////////////// orcen 2007.10.23 //////////////////////////////////
server bool IsSketch100090(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSketch100090`);
DebugOut(`스케치 아이템 수집 시도중`);
DebugOut(`sketchId : ` + ToString((int)cItemcollected.GetSketchClassID()));

	int sketchId = 100090;
	string message;

	if (sketchId == (int)cItemcollected.GetSketchClassID())
	{
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ ["event.collectionbook.77"]+  ["event.collectionbook.2"];
		player.ShowCaption(message);

		return true;
	}
	return false;
}

//	할로윈 이벤트 - 스케치 대상 몬스터 체크 //
////////////////////////////// orcen 2007.10.23 //////////////////////////////////
server bool IsSketch100091(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSketch100091`);
DebugOut(`스케치 아이템 수집 시도중`);
DebugOut(`sketchId : ` + ToString((int)cItemcollected.GetSketchClassID()));

	int sketchId = 100091;
	string message;

	if (sketchId == (int)cItemcollected.GetSketchClassID())
	{
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ ["event.collectionbook.78"]+  ["event.collectionbook.2"];
		player.ShowCaption(message);

		return true;
	}
	return false;
}

//	할로윈 이벤트 - 스케치 대상 몬스터 체크 //
////////////////////////////// orcen 2007.10.23 //////////////////////////////////
server bool IsSketch100092(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSketch100092`);
DebugOut(`스케치 아이템 수집 시도중`);
DebugOut(`sketchId : ` + ToString((int)cItemcollected.GetSketchClassID()));

	int sketchId = 100092;
	string message;

	if (sketchId == (int)cItemcollected.GetSketchClassID())
	{
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ ["event.collectionbook.79"]+  ["event.collectionbook.2"];
		player.ShowCaption(message);

		return true;
	}
	return false;
}

//	할로윈 이벤트 - 스케치 대상 몬스터 체크 //
////////////////////////////// orcen 2007.10.23 //////////////////////////////////
server bool IsSketch100093(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSketch100093`);
DebugOut(`스케치 아이템 수집 시도중`);
DebugOut(`sketchId : ` + ToString((int)cItemcollected.GetSketchClassID()));

	int sketchId = 100093;
	string message;

	if (sketchId == (int)cItemcollected.GetSketchClassID())
	{
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ ["event.collectionbook.80"]+  ["event.collectionbook.2"];
		player.ShowCaption(message);

		return true;
	}
	return false;
}

//	할로윈 이벤트 - 스케치 대상 몬스터 체크 //
////////////////////////////// orcen 2007.10.23 //////////////////////////////////
server bool IsSketch100094(
	character player,
	item cItembook, int cItemindex, item cItemcollected
	)
//////////////////////////////////////////////////////////////////////////////////
{
DebugOut(`IsSketch100094`);
DebugOut(`스케치 아이템 수집 시도중`);
DebugOut(`sketchId : ` + ToString((int)cItemcollected.GetSketchClassID()));

	int sketchId = 100094;
	string message;

	if (sketchId == (int)cItemcollected.GetSketchClassID())
	{
		player.PlaySound(`<sound file='data/sound/emotion_success.wav' />`);
		message= cItembook.GetLocalName() + ["event.collectionbook.1"]+ ["event.collectionbook.81"]+  ["event.collectionbook.2"];
		player.ShowCaption(message);

		return true;
	}
	return false;
}
