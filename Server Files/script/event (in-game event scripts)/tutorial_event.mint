//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G9 Script
//////////////////////////////////////////////////////////// component of Mabinogi


//  튜토리얼 관련된 처리는 이곳에서 해줍니다.




//////////////////////////////////////////////////////////////////////////////////
server void OnLoginTutorial(
	character me)
//////////////////////////////////////////////////////////////////////////////////
{
	//튜토리얼 지역에 로그인 하면 사념파
	if (me.GetRegionId() == 1004)
	{

		me.ShowCaption(["event.pc_event.1"]);
	}



	// g8s3 리뉴얼이후 튜토리얼을 못받는 유저들 처리.
	if (
		((me.IsQuestCompleted(202004)) ||	// AP 3 짜리
		(me.IsQuestCompleted(212004)) ||	// AP 2 짜리
		(me.IsQuestCompleted(202014)) ||	// AP 2 짜리
		(me.IsQuestCompleted(202024)))		// AP 0 짜리
		&& !me.IsQuestTried(202005) && !me.IsQuestCompleted(202005)
		&& !me.IsQuestTried(202036) && !me.IsQuestCompleted(202036)
		&& !me.IsQuestTried(202037) && !me.IsQuestCompleted(202037)
		&& !me.IsQuestTried(202038) && !me.IsQuestCompleted(202038)
		&& !me.IsQuestTried(202039) && !me.IsQuestCompleted(202039)
		&& GetLocale().LowerCase() ==`korea`
	)
	{
		if(!(IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)))
		{
			me.AddGameQuest(202005,1);
		}
		else if(!me.HaveKeyword(`memorial_character`))
		{
			int iRandom=Random(3);
			switch (iRandom)
			{
				case (0)
				{
					me.AddGameQuest(202036,1);
				}
				case (1)
				{
					me.AddGameQuest(202039,1);
				}
				case (2)
				{
					me.AddGameQuest(202040,1);
				}
			}
		}
	}


	// 옛날에 튜토리얼 퀘스트 모두 마치고 g7s2 이후에 접속한 올드 유저
	// 죽은척과 돌던지기 액션 가르쳐줘야한다.
	if( GetVersion()>=702	&& me.IsHuman() && me.IsQuestCompleted(200128) )
	{
		if( !me.IsUsableSkill(50016)	&& !me.HaveQuestTemplate(200092) )
		{
			me.AddGameQuest(200092, 3);	// 30초 뒤 죽은 척 퀘스트 주기
		}
		if( !me.IsUsableSkill(50020)	&& !me.HaveQuestTemplate(200094) )
		{
			me.AddGameQuest(200094,3);	// 30초 뒤 돌 던지기 준다.
		}
	}


	// 달걀 채집 퀘스트를 마치고 감자 캐기 퀘스트에서 링크가 끊어진 유저들을 위한 대책
	if (	me.IsQuestCompleted (202047)			// 달걀 채집 끝났는데
		&& !me.HaveQuestTemplate(202044)		// 감자 캐기가 없다.
		&& IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)	)
	{
		me.AddGameQuest(202044, 1);		// 감자 캐기 퀘스트 10초후에 배달
	}



	// 인간은 3 렙이상, 자이언트/엘프는 18렙 이상에서 로그인 하면 종이비행기 입수 퀘스트 준다.
	/*
	if(GetVersion() >= 704 && !IsTestServer() && !me.IsQuestTried(200133) && !me.IsUsableSkill(50023))
	{
		if (me.IsHuman())	// 인간만
		{
			if (me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitTircho`))	// 이리아에서 시작 반영
			{
			}
			else if ( IsEnable(`featureTutorialPlayUpgrade_G9S2`) extern (`data/script/features.mint`))		//G9S2 부터는 종이비행기 퀘스트가 13 레벨 이후에 온다.
			{
				if ((me.GetLevel()  >= 25) && !me.IsQuestTried(200133))
				{
					me.AddGameQuest(200133,1);
				}
			}
			else if ((me.GetLevel()  >= 3) && !me.IsQuestTried(200133))
			{
				me.AddGameQuest(200133,1);
			}
		}

		if (me.IsElf() || me.IsGiant())	// 엘프나 자이언트는 18렙 이상부터
		{
			if ((me.GetLevel() + me.GetCumLevel() >= 25) && !me.IsQuestTried(200133))
			{
				me.AddGameQuest(200133,1);
			}
		}
	}
	*/

	//인간에게 G5부터 죽은척 액션 알려주기
	if(GetVersion() >= 500 && me.IsHuman() && !me.HaveKeyword(`memorial_character`))
	{
		if (
			(!((GetVersion()>=702) && !me.HaveKeyword(`FirstLoginAtIria`)) &&	// G7S2부터 에린 시작 인간은 바로 주지 않게 - uhihiho
			((GetLocale().LowerCase() == `korea`) || (GetLocale().LowerCase() == `japan`)|| (GetLocale().LowerCase() == `usa`)|| (GetLocale().LowerCase() == `europe`)))

			|| (!((GetVersion()>=701) && !me.HaveKeyword(`FirstLoginAtIria`)) &&
			((GetLocale().LowerCase() == `taiwan`) || (GetLocale().LowerCase() == `china`)))	// 대만 중국은 G7S1부터
		)
		{
			me.AddGameQuest(200092,1);
		}

		// 죽은 척 퀘스트를 얻지 못 했던 유저에 대한 보완 (유럽에서 초기에 퀘스트 script 오류로 못 받은 유저)
		// 유럽에서 인간이 이리아에서 시작해버렸고, 죽척 퀘, 스킬이 없다면 퀘스트 제공
		else if(GetVersion() >= 702
			&& me.IsHuman()
			&& !me.IsUsableSkill(50016)
			&& !me.HaveQuestTemplate(200092)
		//	&& me.HaveKeyword(`FirstLoginAtIria`)
			&& (
				(GetLocale().LowerCase() == `europe`)
				|| (GetLocale().LowerCase() == `usa`)
			)
		)
		{
			me.AddGameQuest(200092,1);
		}
	}

	//인간, 엘프 모두에게 G5S2부터 돌 던지기 액션 알려주기 (자이언트도 줄 지 안줄지는 미정)
	if (me.IsUsableSkill(50020))
	{
		DebugOut(`UsableSkill(50020)`);
	}
	else
	{
		DebugOut(`Not UsableSkill(50020)`);
	}

	if(GetVersion() >= 502
		&& !me.IsGiant()
		&& !me.IsUsableSkill(50020)
		&& !me.HaveQuestTemplate(200094)
	)
	{

		if (
			(!((GetVersion()>=702) && me.IsHuman() && !me.HaveKeyword(`FirstLoginAtIria`)) &&	// G7S2부터 에린 시작 인간은 바로 주지 않게 - uhihiho
			((GetLocale().LowerCase() == `korea`) || (GetLocale().LowerCase() == `japan`)|| (GetLocale().LowerCase() == `usa`)|| (GetLocale().LowerCase() == `europe`)))
			|| (!((GetVersion()>=701) && me.IsHuman() && !me.HaveKeyword(`FirstLoginAtIria`)) &&
			((GetLocale().LowerCase() == `taiwan`) || (GetLocale().LowerCase() == `china`)))	// 대만, 중국은 G7S1부터
		)
		{
			if(IsEnable(`featureG10TutorialRenewal`) extern (`data/script/features.mint`))
			{
				if ((me.GetCumLevel() +me.GetLevel()) >= 20)
				{
					me.AddGameQuest(200094,1);
				}
			}
			else
			{
				me.AddGameQuest(200094,1);
			}
		}

		// 돌던지기 퀘스트를 얻지 못 했던 유저에 대한 보완 (유럽에서 초기에 퀘스트 script 오류로 못 받은 유저)
		// 유럽에서 이리아에서 시작했고, 돌던지기 퀘, 스킬이 없다면 퀘스트 제공
		else if(GetVersion() >= 702
			&& !me.IsGiant()
		//	&& me.HaveKeyword(`FirstLoginAtIria`)
			&& (
				(GetLocale().LowerCase() == `europe`)
				|| (GetLocale().LowerCase() == `usa`)
			)
		)
		{
			me.AddGameQuest(200094,1);
		}
	}

	// 엘프 초반퀘스트에 론가 사막의 유적 던전 퀘스트 추가
	// by jisangs, 060808
	if(
		me.IsElf()	// 엘프만
		&& me.IsQuestCompleted(200316)
		&& !me.IsQuestTried(200331)
		&& GetVersion() >= 501
	)
	{
		me.AddGameQuest(200331,2);	// 론가 사막의 유적 던전
	}


	//샤프 마인드 스킬 주기
	// 인간만 by jisangs, 060601
	if(
		me.IsHuman()	// 인간만
		&&
		(
			(GetLocale().LowerCase()==`korea` )
			|| (GetLocale().LowerCase() !=`japan`	&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china`)
			&& (GetVersion() >= 203)
		)
	)
	{
		if(
			!me.IsUsableSkill(23011)
			&& !me.HaveKeyword(`learn_sharpmind_skill_again`)	// 샤프 마인드 스킬 재입수 키워드가 없을 때
		)
		{
			me.AddSkill(23011,0);
		}
	}



	//////////////////////////////////////////////////////////////////////////////////
	// 이리아에서 시작하고, 아직 티르 코네일까지 못가본 사람은 퀘스트를 주지 않는다.
	// 이리아 초반 퀘스트중 티르 코네일 방문(200227) 완료시, 밀렸던 퀘스트를 한꺼번에 지급한다.
	// 하지만 음악적 지식 E랭크는 울라 NPC 방문 오브젝티브가 없기 때문에,
	// 이리아 시작 캐릭터라도 바로 퀘스트를 진행시켜 준다.
	// by jisangs, 2006/04/19
	//////////////////////////////////////////////////////////////////////////////////
	//음악지식 E
	// 이리아에서 시작하고, 티르 코네일 방문 퀘스트를 완료 못한 캐릭터
	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& me.HaveKeyword(`FirstLoginAtIria`)
		&& !me.HaveKeyword(`FirstLoginAtIria_VisitTircho`))
	{
		if (me.GetSkillLevel(10006) >= 2 && !me.IsQuestTried(200023))
		{
			me.AddGameQuest(200023, 20);
		}
	}


	//나오의 소개장 퀘스트를 못받은 사람 복구용 스크립트
	// G3S4 begin 티르 코네일 초반 퀘스트 변경
	// 인간, 엘프 구분 by jisangs, 060601
	// 자이언트 구분 by jisangs, 061204
	if (me.IsGiant())
	{
		if (!me.IsQuestTried(200401) &&  !me.HaveKeyword(`memorial_character`))
		{
			me.AddGameQuest(200401, 0);
		}
	}
	else
	if (me.IsElf())
	{
		if (!me.IsQuestTried(200301) &&  !me.HaveKeyword(`memorial_character`))
//			&& (IsDevelopment() && !IsTestServer()))
		{
			me.AddGameQuest(200301, 0);
		}
	}
	else
//	if (me.IsHuman())
	{
		if(
			GetLocale().LowerCase()==`korea`
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
			|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
			|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 402)
		)
		{
			if (me.HaveKeyword(`FirstLoginAtIria`)) 	// 이리아에서 시작 반영
			{
				if (!me.IsQuestTried(200201) &&  !me.HaveKeyword(`memorial_character`))
				{
					me.AddGameQuest(200201, 0);
				}
			}
			else
			{
				if (!me.IsQuestTried(200004) && !me.IsQuestTried(200101) && !me.IsQuestTried(202001) && !me.IsQuestTried(212001) && !me.IsQuestTried(202062))
				{
					if (GetVersion()<702)		// G7S2 이전엔 기존 퀘 줘라
					{
						me.AddGameQuest(200101, 0);
					}
					else if (((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`))) && (!me.IsQuestTried(212001) &&  !me.HaveKeyword(`memorial_character`)))
					{
						me.AddGameQuest(212001, 0);
					}
					else if (!IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`) && !me.IsQuestTried(202001) &&  !me.HaveKeyword(`memorial_character`))
					{
						me.AddGameQuest(202001, 0);
					}
					else if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`) && !me.IsQuestTried(202062) &&  !me.HaveKeyword(`memorial_character`))
					{
						me.AddGameQuest(202062, 0);
					}
				}
//				if (!me.IsQuestTried(200004) && !me.IsQuestTried(200101))
//				{
//					me.AddGameQuest(200101, 0);
//				}
			}
		}
		else
		{
			// 원본
			if (!me.IsQuestTried(200004))
			{
				me.AddGameQuest(200004, 0);
			}
		}
		// G3S4 end
	}

	if(
		(GetLocale().LowerCase()==`korea`)
		|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
			&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
	)
		//G3S4 초반퀘스트 변경 - OnLogin
	{
		//녹색구슬 퀘스트 못받은 사람 복구용 <- 녹색구슬 완료하지 않았으면, 퀘스트변경시에 안한것으로 처리됨
	}
	else
	{
		//녹색구슬 퀘스트 못받은 사람 복구용
		if (!me.IsQuestTried(200005) &&  me.IsQuestCompleted(200007))
		{
			me.AddGameQuest(200005, 3);  //딜레이 3
		}
	}

	//매직 마스터리 퀘스트를 못받은 사람 복구용 스크립트
	//G3S4 초반퀘스트 변경 <- 구 퀘스트 기준으로 처리, 추가해주는것에 문제 없음 by jisangs
	//변경되는 시점에 들어온 사람은 여기서 마스터리 스킬 추가해주고, 밑에서 구 퀘스트 지우게 되는 순서... by jisangs
	if (!me.IsQuestTried(200075) &&  me.IsQuestCompleted(200007) && !me.HaveKeyword(`memorial_character`))
	{
		if(
			GetLocale().LowerCase()==`korea`
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| GetLocale().LowerCase() ==`china`
			|| (GetLocale().LowerCase() == `taiwan` && GetVersion() >= 003)
			|| (GetLocale().LowerCase() == `japan` && GetVersion() >= 200)
		)
		{
			me.AddGameQuest(200075, 6);  //딜레이 3 매직 마스터리 교습
		}

	}


	//메이킹 마스터리 퀘스트를 못받은 사람 복구용 스크립트
	/*if(
		(GetGeneration()==3 && GetSeason()>=2)
		||
		GetGeneration()>=4
	)*/
	{
		if (!me.HaveKeyword(`character_new_tutorial_2010`)) // 2010 새로운 튜토리얼에선 메이킹 마스터리 퀘스트를 다른 루트로 받는다.
		{
			if (!me.IsQuestTried(200079) &&  me.IsQuestCompleted(200005) && !me.HaveKeyword(`memorial_character`))
			{
				me.AddGameQuest(200079, 0);
			}
		}
	}


	//----------------------------------------------------------------------------

	//////////////////////////////////////////////////////////////////////////////////////
	// 이곳의 코드는 2004년 12월 19일 작성되었습니다.
	// 추가되는 게임퀘스트를, 이미 조건이 만족되어있던 사람들에게도 주기 위한 코드입니다.
	//////////////////////////////////////////////////////////////////////////////////////

	//////////////////////////////////////////////////////////////////////////////////////
	// 이곳의 코드는 2005년 11월 23일 변경되었습니다.
	// 초반 퀘스트 변경이후에는, 최신퀘스트로 주게 됩니다.
	//////////////////////////////////////////////////////////////////////////////////////

	if (
		(GetLocale().LowerCase()==`korea`)
		|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
			&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
	) //G3S4 초반퀘스트 변경 - OnLogin
	{
		// 초반퀘스트 변경시 아래 내용이 모두 반영된다.
	}
	else
	{
		//양털 깎기 - 던컨의 조언 - 이거 뺌
		//if (me.IsQuestCompleted(200010) && !me.IsQuestTried(200068))
		//{
		//		me.AddGameQuest(200068, 10);
		//}
		//알비던전의 보물상자 - 던컨(물떠보기)
		if (me.IsQuestCompleted(200008) && !me.IsQuestTried(200052))
		{
			me.AddGameQuest(200052, 30);
		}

		//말콤(가는실) - 케이틴(열매채집)
		// 가는실 퀘스트가 포기 가능했던 문제때문에 200027번을 시도만 하는 상태라도 다음 퀘스트를 받게 수정하였음. 2005.1.11. by qwerty

		if (me.IsQuestTried(200027) && !me.IsQuestTried(200031))
		{
			me.AddGameQuest(200031, 50);
		}

		//던바튼 마누스 방문 - 크리스텔(감자채집)
		if (me.IsQuestCompleted(200011) && !me.IsQuestTried(200036))
		{
			me.AddGameQuest(200036, 800);
		}
	}



	//////////////////////////////////////////////////////////////////////////////////////
	// 게임 퀘스트 재배치
	// 이곳의 코드는 2005년 11월 09일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////

	// G3S4 begin 티르 코네일 초반 퀘스트 변경
	// : 퀘스트 재배치를 하면서
	// 강제 완료시킨 구 퀘스트에 대해서, 신 퀘스트의 보상으로 적용해준다.
	// 인간만 by jisangs, 060601
	if(
		me.IsHuman()	// 인간만
		&& (
			GetLocale().LowerCase()==`korea`
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
			|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
			|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
		)
	)
		// && (!me.IsQuestTried(200101) && !me.IsQuestCompleted(200101))) // <- 한번 컨버팅되고 나면 다시 재배치 검사하는 시간이 들지 않도록 하기 위해
	{
		bool bQuestCompensation = false;
		bool bQuestCompleted = false;


		////////////////////////////////////////////////////////////
		// 퀘스트 진행중의 예외처리
		// 피르아스에게 도끼쿠폰을 못받아 장작 퀘스트를 못하는 사람의 예외처리
		DebugOut(`도끼 쿠폰 퀘스트 디버그`);
		if (me.IsQuestTried(200108))
		{
			DebugOut(`도끼 쿠폰 퀘스트 수행중`);
		}
		if (me.IsQuestCompleted(200108))
		{
			DebugOut(`도끼 쿠폰 퀘스트 완료`);
		}
		DebugOut(`도끼 쿠폰 보유 개수 : ` + ToString(me.GetItemNoWithClassId(52026)));
		DebugOut(`수행한 오브젝티브 개수 : ` + ToString(me.GetCompletedQuestObjectiveCount(200108)));
		if (me.GetItemNoWithClassId(52026) == 0 // 도끼쿠폰이 없음
			&& me.IsQuestTried(200108)
			&& !me.IsQuestCompleted(200108)
			&& me.GetCompletedQuestObjectiveCount(200108) < 1
		) // 장작 퀘스트 수행중
		{
			if (((GetVersion()<702) && ((GetLocale().LowerCase() == `korea`) || (GetLocale().LowerCase() == `japan`)))	// G7S2부터는 도끼 쿠폰 안 준다. 영문도 안 준다.
			|| ((GetVersion()<701) && ((GetLocale().LowerCase() == `taiwan`) || (GetLocale().LowerCase() == `china`)))	// 대만,중국은 G7S1부터
			)
			{
				DebugOut(`도끼 쿠폰 받음`);
				me.DoStript(`additemex(id:52026 rewardview:true)`);
			}
		}
		////////////////////////////////////////////////////////////



		// 나오의 소개
		if (me.IsQuestCompleted(200004))
		{
			DebugOut(`200004 퀘스트 완료 처리`);
			me.CleanQuestHistory(200004); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200101); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200004))
		{
			DebugOut(`200004 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200004); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200101); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(100);

			bQuestCompensation = true;
		}

		// 휴식
		if (me.IsQuestCompleted(200009))
		{
			DebugOut(`200009 퀘스트 완료 처리`);
			me.CleanQuestHistory(200009); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200105); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200009))
		{
			DebugOut(`200009 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200009); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200105); // 신 퀘스트를 한 것으로 처리
			//보상
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:1601 rewardview:true)`);
			me.GainExp(500);

			bQuestCompensation = true;
		}

		// 학교가기
		if (me.IsQuestCompleted(200007))
		{
			DebugOut(`200007 퀘스트 완료 처리`);
			me.CleanQuestHistory(200007); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200102); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200007))
		{
			DebugOut(`200007 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200007); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200102); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(200);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:1612 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 녹색구슬
		if (me.IsQuestCompleted(200005))
		{
			DebugOut(`200005 퀘스트 완료 처리`);
			me.CleanQuestHistory(200005); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200107); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200005))
		{
			DebugOut(`200005 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200005); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200107); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(200);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:1602 rewardview:true)`);
			if (GetVersion()<702)
			{
				me.DoStript(`additemex(id:52026 rewardview:true)`);
			}

			bQuestCompensation = true;
		}

		// 장작
		if (me.IsQuestCompleted(200064))
		{
			DebugOut(`200064 퀘스트 완료 처리`);
			me.CleanQuestHistory(200064); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200108); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200064))
		{
			DebugOut(`200064 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200064); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200108); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(1000);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:50007 rewardview:true)`);
			me.DoStript(`additemex(id:1603 rewardview:true)`);
			me.IncreaseMoney(100); //돈 100

			bQuestCompensation = true;
		}
		// 구 장작 퀘스트
		if (me.IsQuestCompleted(200006))
		{
			DebugOut(`200006 퀘스트 완료 처리`);
			me.CleanQuestHistory(200006); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200108); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200006))
		{
			DebugOut(`200006 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200006); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200108); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(1000);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:50007 rewardview:true)`);
			me.DoStript(`additemex(id:1603 rewardview:true)`);
			me.IncreaseMoney(100); //돈 100

			bQuestCompensation = true;
		}

		// 양털
		if (me.IsQuestCompleted(200067))
		{
			DebugOut(`200067 퀘스트 완료 처리`);
			me.CleanQuestHistory(200067); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200109); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200067))
		{
			DebugOut(`200067 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200067); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200109); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(1000);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:63001 rewardview:true)`);

			bQuestCompensation = true;
		}
		// 구 양털
		if (me.IsQuestCompleted(200010))
		{
			DebugOut(`200067 퀘스트 완료 처리`);
			me.CleanQuestHistory(200010); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200109); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200010))
		{
			DebugOut(`200067 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200010); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200109); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(1000);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:63001 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 던컨의 조언
		if (me.IsQuestCompleted(200068))
		{
			DebugOut(`200068 퀘스트 완료 처리`);
			me.CleanQuestHistory(200068); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200120); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200068))
		{
			DebugOut(`200068 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200068); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200120); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:40001 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 트레보 알비던전
		if (me.IsQuestCompleted(200008))
		{
			DebugOut(`200008 퀘스트 완료 처리`);
			me.CleanQuestHistory(200008); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200117); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200008))
		{
			DebugOut(`200008 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200008); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200117); // 신 퀘스트를 한 것으로 처리
			//보상
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:1608 rewardview:true)`);
			me.GainExp(10000);

			bQuestCompensation = true;
		}

		// 물 뜨기
		if (me.IsQuestCompleted(200052))
		{
			DebugOut(`200052 퀘스트 완료 처리`);
			me.CleanQuestHistory(200052); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200124); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200052))
		{
			DebugOut(`200052 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200052); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200124); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);

			bQuestCompensation = true;
		}

		// 거대 흰늑대 -> 갈색곰 퇴치로 변경됨
		if (me.IsQuestCompleted(200056))
		{
			DebugOut(`200056 퀘스트 완료 처리`);
			me.CleanQuestHistory(200056); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200129); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200056))
		{
			DebugOut(`200056 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200056); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200129); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(10000);
			me.IncreaseMoney(3000); //돈 3000

			bQuestCompensation = true;
		}

		// 트레보 키아
		if (me.IsQuestCompleted(200046))
		{
			DebugOut(`200046 퀘스트 완료 처리`);
			me.CleanQuestHistory(200046); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200123); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200046))
		{
			DebugOut(`200046 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200046); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200123); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(30000);
			me.DoStript(`additemex(id:1609 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 아란웬 서큐
		if (me.IsQuestCompleted(200034))
		{
			DebugOut(`200034 퀘스트 완료 처리`);
			me.CleanQuestHistory(200034); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200131); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200034))
		{
			DebugOut(`200034 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200034); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200131); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(50000);
			me.DoStript(`modify(ap, 2)`);

			bQuestCompensation = true;
		}

		// 거미줄
		if (me.IsQuestCompleted(200065))
		{
			DebugOut(`200065 퀘스트 완료 처리`);
			me.CleanQuestHistory(200065); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200114); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200065))
		{
			DebugOut(`200065 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200065); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200114); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:1604 rewardview:true)`);
			me.IncreaseMoney(50); //돈 50

			bQuestCompensation = true;
		}
		// 구 거미줄
		if (me.IsQuestCompleted(200027))
		{
			DebugOut(`200065 퀘스트 완료 처리`);
			me.CleanQuestHistory(200027); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200114); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200027))
		{
			DebugOut(`200065 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200027); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200114); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:1604 rewardview:true)`);
			me.IncreaseMoney(50); //돈 50

			bQuestCompensation = true;
		}

		// 열매 채집
		if (me.IsQuestCompleted(200031))
		{
			DebugOut(`200031 퀘스트 완료 처리`);
			me.CleanQuestHistory(200031); // 구 퀘스트를 한 것으로 처리
DebugOut(`1 - 200115 대신 200132 퀘스트로 교체`);
			// me.ForceCompleteQuest(200115); // 신 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200132); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200031))
		{
			DebugOut(`200031 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200031); // 구 퀘스트를 한 것으로 처리
DebugOut(`2 - 200115 대신 200132 퀘스트로 교체`);
			// me.ForceCompleteQuest(200115); // 신 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200132); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:50004 rewardview:true)`);
			me.IncreaseMoney(1000); //돈 1000

			bQuestCompensation = true;
		}

		// 밀가루
		if (me.IsQuestCompleted(200032))
		{
			DebugOut(`200032 퀘스트 완료 처리`);
			me.CleanQuestHistory(200032); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200116); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200032))
		{
			DebugOut(`200032 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200032); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200116); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`modify(ap, 1)`);
			me.DoStript(`additemex(id:1606 rewardview:true)`);
			me.DoStript(`additemex(id:63016 count:4 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 퍼거스 수리
		if (me.IsQuestCompleted(200050))
		{
			DebugOut(`200050 퀘스트 완료 처리`);
			me.CleanQuestHistory(200050); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200113); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200050))
		{
			DebugOut(`200050 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200050); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200113); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:1607 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 스튜어트 마법상점
		if (me.IsQuestCompleted(200051))
		{
			DebugOut(`200051 퀘스트 완료 처리`);
			me.CleanQuestHistory(200051); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200127); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200051))
		{
			DebugOut(`200051 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200051); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200127); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(10000);

			bQuestCompensation = true;
		}

		// 던바튼 방문
		if (me.IsQuestCompleted(200011))
		{
			DebugOut(`200011 퀘스트 완료 처리`);
			me.CleanQuestHistory(200011); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200125); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200011))
		{
			DebugOut(`200011 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200011); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200125); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(5000);

			bQuestCompensation = true;
		}

		// 감자 캐기
		if (me.IsQuestCompleted(200036))
		{
			DebugOut(`200036 퀘스트 완료 처리`);
			me.CleanQuestHistory(200036); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200126); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200036))
		{
			DebugOut(`200036 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200036); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200126); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(2000);
			me.DoStript(`additemex(id:1610 rewardview:true)`);

			bQuestCompensation = true;
		}

		// 거대 곰 -> 갈색 그리즐리 베어 퇴치로 변경됨
		if (me.IsQuestCompleted(200037))
		{
			DebugOut(`200037 퀘스트 완료 처리`);
			me.CleanQuestHistory(200037); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200130); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200037))
		{
			DebugOut(`200037 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200037); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200130); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(30000);
			me.IncreaseMoney(3000); //돈 3000

			bQuestCompensation = true;
		}

		// 나오의 선물
		if (me.IsQuestCompleted(200012))
		{
			DebugOut(`200012 퀘스트 완료 처리`);
			me.CleanQuestHistory(200012); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200112); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200012))
		{
			DebugOut(`200012 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200012); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200112); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(5000);

			bQuestCompensation = true;
		}

		// 반호르 방문
		if (me.IsQuestCompleted(200038))
		{
			DebugOut(`200038 퀘스트 완료 처리`);
			me.CleanQuestHistory(200038); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200128); // 신 퀘스트를 한 것으로 처리

			bQuestCompleted = true;
		}
		else if(me.IsQuestTried(200038))
		{
			DebugOut(`200038 퀘스트 완료 처리 & 보상`);
			me.CleanQuestHistory(200038); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(200128); // 신 퀘스트를 한 것으로 처리
			//보상
			me.GainExp(20000);
			me.DoStript(`additemex(id:1611 rewardview:true)`);

			bQuestCompensation = true;
		}

DebugOut(`퀘스트 보상 처리 전`);
		if(bQuestCompensation || bQuestCompleted)
		{
			int newQuestID = GetFirstGameQuestID(me);

DebugOut(`퀘스트 보상 처리 중, 다음 퀘스트 : ` + ToString(newQuestID));
			if(bQuestCompensation)
			{
DebugOut(`퀘스트 보상을 알리는 쪽지 발송`);
				//퀘스트 강제종료되고 보상받았음을 알리는 쪽지 발송
				me.DoStript(`additemex(id:74167 rewardview:true)`);
			}

			// 다음 퀘스트를 할당 받았을 때에만
			if (newQuestID != 0)
			{
DebugOut(`퀘스트 보상 처리, 다음 퀘스트 예약`);
				ProcessGameQuest(me, newQuestID);
			}
		}
		else
		if (me.IsQuestCompleted(200128))
		{
			// 반호르 방문까지 다 마친 이후에도, 병렬 퀘스트들이 남아 있으면 처리한다.
			ProcessGameQuest(me, 0); // 게임 퀘스트는 실행하지 않고, 병렬 퀘스트들만 실행한다.
		}
	}
	// G3S4 튜토리얼 리뉴얼의 끝




	/////////////////////////////////////////////////
	//     튜토리얼 개선 후
	//     티르코네일 유도 퀘스트 2007.08.08.
	/////////////////////////////////////////////////

	// 현실시간 하루에 한번만 G7S2이후에 받을 수 있음
	//   g8s3 에서 던컨한테 받는 것으로 이동

	/*
	if(
		me.IsEnableDeed(18)
		&& (
			((GetVersion()>=702) || (GetLocale().LowerCase() == `usa`))
			|| ((GetVersion()>=701) && ((GetLocale().LowerCase() == `taiwan`) || (GetLocale().LowerCase() == `china`)))
		)	// 대만, 중국은 G7S1이후부터
	)
	*/

	if(
		me.IsEnableDeed(18)
		&& ((GetVersion()>=702 && !(IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`))))
		// 중국,대만의 경우 G7S1~G8S2 까지 진행되었으나 G7S1 시즌으로 돌아갈 일이 없으므로 G7S2부터로 조건 통일
	)
	{
		int questIndex = Random(6);
		switch(questIndex)
		{
			case (0)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203001, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
			case (1)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203002, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
			case (2)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203003, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
			case (3)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203004, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
			case (4)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203005, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
			case (5)
			{
				me.CleanQuestHistory(203001); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203002); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203003); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203004); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203005); // 구 퀘스트를 한 것으로 처리
				me.CleanQuestHistory(203006); // 구 퀘스트를 한 것으로 처리
				me.AddGameQuest(203006, 180);	// 다음 퀘스트 지급
				me.DoneDeed(18);
			}
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnTutorialQuestCompleted(character me, int _idQuest, bool _bSuccess)
// : 게임 퀘스트를 완료 혹은 실패 했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`퀘스트 ID : ` + ToString(_idQuest));
	if (me.HaveKeyword(`new_character_after_g13`))
	{
		DebugOut(`G13 이후 캐릭`);
	}
	if (!me.HaveKeyword(`FirstLoginAtIria`))
	{
		DebugOut(`이리아 시작 아님`);
	}
	if (!me.HaveKeyword(`memorial_character`))
	{
		DebugOut(`메모리얼 아님`);
	}
	if (me.IsHuman())
	{
		DebugOut(`인간`);
	}
	////G13S1 이후 생성한 모험가가 아닌 캐릭터는 새로운 튜토리얼을 진행한다. by eljjoo. 2010.07.12
	//그 이전에 만든 캐릭터들은 계속 예전 튜토리얼을 진행.
	if (
			me.HaveKeyword(`character_new_tutorial_2010`) //2010 새로운 튜토리얼 적용 대상이고
			&& !me.HaveKeyword(`FirstLoginAtIria`) //티르코네일 시작 캐릭터이고
			&& !me.HaveKeyword(`memorial_character`)//메모리얼 카드 캐릭터가 아니고
			&& me.IsHuman() //인간이고
		)
	{
		if (_bSuccess)
		{
			int delay_boss = 360*24;	// 보스 퀘스트는 24 시간 후에
			int delay = 2;		// 필드 몬스터 퀘스트는 20초 후에
			int delay_NPC = 6;		// 생활형 퀘스트는 1분 후에
			if(IsDevelopment())
			{
				delay_boss = 0;
				delay = 0;
				delay_NPC=0;
			}
			switch (_idQuest)
			{
				//나오의 소개장 -> 묘지의 거미들
				case (202062)
				{
					//연습용 숏 소드 여기서 준다.
					if (me.GetItemListInPocket(10).GetSize()==0)
					{
						me.DoStript(`additemex(id:40374 rewardview:true pocket:10)`);
					}
					else
					{
						me.DoStript(`additemex(id:40374 rewardview:true)`);
					}
					me.AddGameQuest(202058, 0);
				}
				//묘지의 거미들 -> 강력한 일격, 스매시
				case (202058)
				{
					me.AddGameQuest(202061, 0);
				}
				//강력한 일격, 스매시 -> 말썽꾸러기 꼬마 구출 
				case (202061)
				{
					me.AddGameQuest(202060, 0);
				}
				//말썽꾸러기 꼬마 구출  -> 데이안의 양 지키기 
				case (202060)
				{
					me.AddGameQuest(202056, 0);
				}
				//데이안의 양 지키기 -> 휴식 스킬을 배우자
				case (202056)
				{
					if(IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
					{
						me.AddGameQuest(294201, 0);		// 햄릿 스토리 시작
					}
					else
					{
						me.AddGameQuest(202054, 0);							
					}
				}
			
				//휴식 스킬을 배우자 -> 말콤의 반지 
				case (202054)
				{
					me.AddGameQuest(202055, 0);
				}
				//말콤의 반지 -> 캠프 파이어
				case (202055)
				{
					me.AddGameQuest(202057, 0);
				}
				//캠프 파이어 -> 마법을 배우자
				case (202057)
				{
					me.AddGameQuest(202064, 0);
				}
				//매직 마스터리 -> 던컨의 추천
				case (202064)
				{
					int iRandom=Random(4);
					if (iRandom == 0)
					{
						me.AddGameQuest(202036, 0);
					}
					if (iRandom == 1)
					{
						if(me.IsUsableSkill(10004))
						{
							me.AddGameQuest(202037, 0);
						}
						else
						{
							int iRandom2 = Random(3);
							if (iRandom2 == 0)	me.AddGameQuest(202036, 0);
							if (iRandom2 == 1)	me.AddGameQuest(202038, 0);
							if (iRandom2 == 2)	me.AddGameQuest(202039, 0);
						}
					}
					if (iRandom == 2)
					{
						me.AddGameQuest(202038, 0);
					}
					if (iRandom == 3)
					{
						me.AddGameQuest(202039, 0);
					}
				}
				// 던컨의 추천 -> 녹색 구슬 수집 (생활 퀘스트 시작)
				case (202036)
				{
					if(IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
					{
						me.AddGameQuest(294207, 0);		// 햄릿 스토리로 돌아간다.
					}
					else
					{
						me.AddGameQuest(202065, delay_NPC);					
					}
				}
				case (202037)
				{
					if(IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
					{
						me.AddGameQuest(294207, 0);		// 햄릿 스토리로 돌아간다.
					}
					else
					{
						me.AddGameQuest(202065, delay_NPC);					
					}
				}
				case (202038)
				{
					if(IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
					{
						me.AddGameQuest(294207, 0);		// 햄릿 스토리로 돌아간다.
					}
					else
					{
						me.AddGameQuest(202065, delay_NPC);					
					}
				}
				case (202039)
				{
					if(IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
					{
						me.AddGameQuest(294207, 0);		// 햄릿 스토리로 돌아간다.
					}
					else
					{
						me.AddGameQuest(202065, delay_NPC);					
					}
				}

				/////////////////////////////////////////////////////////////
				//				G8S3 신규 생활 퀘스트				//
				/////////////////////////////////////////////////////////////


				// 녹색 구슬 수집 - 나무열매 채집
				case (202065)
				{
					if(!me.HaveKeyword(`memorial_character`))
					{
						me.AddGameQuest(202033, delay_NPC);
					}
				}
				// 열매 채집 - 양털 채집
				case (202033)
				{
					me.AddGameQuest(202035, delay_NPC);
				}
				// 양털채집 - 거미줄 채집
				case (202035)
				{
					me.AddGameQuest(202034, delay_NPC);
				}
				//   거미줄 채집 - 수리해보자.
				case (202034)
				{
					me.AddGameQuest(202042, delay_NPC);
				}
				// 수리해보자 - 벌목
				case (202042)
				{
					me.AddGameQuest(202041, delay_NPC);
				}
				// 벌목 - 스튜어트 방문
				case (202041)
				{
					me.AddGameQuest(202043, delay_NPC);
				}
				// 스튜어트 방문 - 달걀 채집
				case (202043)
				{
					me.AddGameQuest(202047, delay_NPC);
				}
				// 달걀채집 - 감자채집
				case (202047)
				{
					me.AddGameQuest(202044, delay_NPC);
				}
				// 감자 캐기 - 에반 방문
				case (202044)
				{
					me.AddGameQuest(202046, delay_NPC);
				}
				// 에반 방문 - 컴건 방문
				case (202046)
				{
					me.AddGameQuest(202045, delay_NPC);
				}
				// 컴건 방문 - 철광석 채집
				case (202045)
				{
					me.AddGameQuest(202040, delay_NPC);
				}

				/////////////////////////////////////////////////////////////
				//				G8S3 신규 보스 퀘스트				//
				/////////////////////////////////////////////////////////////


				// 거대거미 - 스몰 골렘
				case (202101)
				{
					me.AddGameQuest(202102, delay_boss);
				}
				// 스몰 골렘 - 헬하운드
				case (202102)
				{
					me.AddGameQuest(202104, delay_boss);
				}
				// 헬하운드 - 블랙 서큐버스
				case (202104)
				{
					me.AddGameQuest(202105, delay_boss);
				}
				// 블랙 서큐버스 - 골렘
				case (202105)
				{
					me.AddGameQuest(202103, delay_boss);
				}
				// 골렘 - 오거 전사
				case (202103)
				{
					me.AddGameQuest(202106, delay_boss);
				}


				


				/////////////////////////////////////////////////////////////
				//			G8S3 필드 몬스터 퀘스트				//
				/////////////////////////////////////////////////////////////


				case (202201)
				{
					me.AddGameQuest(202202, delay);
				}
				case (202202)
				{
					me.AddGameQuest(202203, delay);
				}
				case (202203)
				{
					me.AddGameQuest(202204, delay);
				}
				case (202204)
				{
					me.AddGameQuest(202205, delay);
				}
				case (202205)
				{
					me.AddGameQuest(202206, delay);
				}
				case (202206)
				{
					me.AddGameQuest(202207, delay);
				}
				case (202207)
				{
					me.AddGameQuest(202208, delay);
				}
				case (202208)
				{
					me.AddGameQuest(202209, delay);
				}
				case (202209)
				{
					me.AddGameQuest(202210, delay);
				}
				case (202210)
				{
					me.AddGameQuest(202211, delay);
				}
				case (202211)
				{
					me.AddGameQuest(202212, delay);
				}
				case (202212)
				{
					me.AddGameQuest(202213, delay);
				}
				case (202213)
				{
					me.AddGameQuest(202214, delay);
				}
				case (202214)
				{
					me.AddGameQuest(202215, delay);
				}
				case (202215)
				{
					me.AddGameQuest(202216, delay);
				}
				case (202216)
				{
					me.AddGameQuest(202217, delay);
				}
				case (202217)
				{
					me.AddGameQuest(202218, delay);
				}
				case (202218)
				{
					me.AddGameQuest(202219, delay);
				}
				case (202219)
				{
					me.AddGameQuest(202220, delay);
				}
			}
		}
	}


	else //g13s1이전에 생성한 캐릭터 or 앨프 or 자이언트 or 이리아 인간의 경우 예전 거 그냥 진행
	{
		if (_bSuccess)
		{
			int delay_boss = 360*24;	// 보스 퀘스트는 24 시간 후에
			int delay = 2;		// 필드 몬스터 퀘스트는 20초 후에
			int delay_NPC = 6;		// 생활형 퀘스트는 1분 후에
			if(IsDevelopment())
			{
				delay_boss = 0;
				delay = 0;
				delay_NPC=0;
			}


			//////////////////////////////////////////////////////////////////////////////////
			// 북미 오픈, G8S3 부터 적용되는 튜토리얼 리뉴얼
			// 서브 튜토리얼 퀘스트를 레벨업에 따라 주는 것과 별도로 완료시에 다음 퀘스트를 주도록 처리.
			//////////////////////////////////////////////////////////////////////////////////


			switch (_idQuest)
			{
				//G8S5 엘프 레벨 퀘스트
				// 유적 수호자 - 흰 반달곰
				case (202301)
				{
					me.AddGameQuest(202302, delay_boss);
				}
				// 흰 반달곰 - 흰 사막곰
				case (202302)
				{
					me.AddGameQuest(202303, delay_boss);
				}
				//  흰 사막곰 - 붉은 뿔 코브라
				case (202303)
				{
					me.AddGameQuest(202304, delay_boss);
				}
				// 붉은 뿔 코브라 - 샐러맨더
				case (202304)
				{
					me.AddGameQuest(202305, delay_boss);
				}
				// 샐러맨더 - 마법 골렘
				case (202305)
				{
					me.AddGameQuest(202306, delay_boss);
				}


				//G8S5 자이언트 레벨 퀘스트
				// 자이언트 밴더스내치 - 흰 버팔로
				case (202401)
				{
					me.AddGameQuest(202402, delay_boss);
				}
				// 흰 버팔로 - 흰 설원곰
				case (202402)
				{
					me.AddGameQuest(202403, delay_boss);
				}
				// 흰 설원곰 - 웬디고
				case (202403)
				{
					me.AddGameQuest(202404, delay_boss);
				}
				// 웬디고 - 사티로스
				case (202404)
				{
					me.AddGameQuest(202405, delay_boss);
				}
				// 사티로스 - 거울마녀
				case (202405)
				{
					me.AddGameQuest(202406, delay_boss);
				}


				/////////////////////////////////////////////////////////////
				//				G8S3 신규 보스 퀘스트				//
				/////////////////////////////////////////////////////////////


				// 거대거미 - 스몰 골렘
				case (202101)
				{
					me.AddGameQuest(202102, delay_boss);
				}
				// 스몰 골렘 - 헬하운드
				case (202102)
				{
					me.AddGameQuest(202104, delay_boss);
				}
				// 헬하운드 - 블랙 서큐버스
				case (202104)
				{
					me.AddGameQuest(202105, delay_boss);
				}
				// 블랙 서큐버스 - 골렘
				case (202105)
				{
					me.AddGameQuest(202103, delay_boss);
				}
				// 골렘 - 오거 전사
				case (202103)
				{
					me.AddGameQuest(202106, delay_boss);
				}


				/////////////////////////////////////////////////////////////
				//				G8S3 신규 생활 퀘스트				//
				/////////////////////////////////////////////////////////////


				// 녹색 구슬 수집 - 나무열매 채집
				case (202030)
				{
					if(!me.HaveKeyword(`memorial_character`))
					{
						me.AddGameQuest(202033, delay_NPC);
					}
				}
				// 열매 채집 - 양털 채집
				case (202033)
				{
					me.AddGameQuest(202035, delay_NPC);
				}
				// 양털채집 - 거미줄 채집
				case (202035)
				{
					me.AddGameQuest(202034, delay_NPC);
				}
				//   거미줄 채집 - 수리해보자.
				case (202034)
				{
					me.AddGameQuest(202042, delay_NPC);
				}
				// 수리해보자 - 벌목
				case (202042)
				{
					me.AddGameQuest(202041, delay_NPC);
				}
				// 벌목 - 스튜어트 방문
				case (202041)
				{
					me.AddGameQuest(202043, delay_NPC);
				}
				// 스튜어트 방문 - 달걀 채집
				case (202043)
				{
					me.AddGameQuest(202047, delay_NPC);
				}
				// 달걀채집 - 감자채집
				case (202047)
				{
					me.AddGameQuest(202044, delay_NPC);
				}
				// 감자 캐기 - 에반 방문
				case (202044)
				{
					me.AddGameQuest(202046, delay_NPC);
				}
				// 에반 방문 - 컴건 방문
				case (202046)
				{
					me.AddGameQuest(202045, delay_NPC);
				}
				// 컴건 방문 - 철광석 채집
				case (202045)
				{
					me.AddGameQuest(202040, delay_NPC);
				}


				/////////////////////////////////////////////////////////////
				//			G8S3 필드 몬스터 퀘스트				//
				/////////////////////////////////////////////////////////////


				case (202201)
				{
					me.AddGameQuest(202202, delay);
				}
				case (202202)
				{
					me.AddGameQuest(202203, delay);
				}
				case (202203)
				{
					me.AddGameQuest(202204, delay);
				}
				case (202204)
				{
					me.AddGameQuest(202205, delay);
				}
				case (202205)
				{
					me.AddGameQuest(202206, delay);
				}
				case (202206)
				{
					me.AddGameQuest(202207, delay);
				}
				case (202207)
				{
					me.AddGameQuest(202208, delay);
				}
				case (202208)
				{
					me.AddGameQuest(202209, delay);
				}
				case (202209)
				{
					me.AddGameQuest(202210, delay);
				}
				case (202210)
				{
					me.AddGameQuest(202211, delay);
				}
				case (202211)
				{
					me.AddGameQuest(202212, delay);
				}
				case (202212)
				{
					me.AddGameQuest(202213, delay);
				}
				case (202213)
				{
					me.AddGameQuest(202214, delay);
				}
				case (202214)
				{
					me.AddGameQuest(202215, delay);
				}
				case (202215)
				{
					me.AddGameQuest(202216, delay);
				}
				case (202216)
				{
					me.AddGameQuest(202217, delay);
				}
				case (202217)
				{
					me.AddGameQuest(202218, delay);
				}
				case (202218)
				{
					me.AddGameQuest(202219, delay);
				}
				case (202219)
				{
					me.AddGameQuest(202220, delay);
				}
			}
		}



		//////////////////////////////////////////////////////////////////////////////////
		// 이리아에서 시작하고, 티르 코네일 방문(200227) 완료한 사람의 경우
		// 레벨과 나이 퀘스트를 늦게 받기 때문에 여기서 처리해준다.
		// by jisangs, 2006/03/28
		//////////////////////////////////////////////////////////////////////////////////


		// 인간만 by jisangs, 060601
		if (
			me.IsHuman()	// 인간만
			&& me.HaveKeyword(`FirstLoginAtIria`)
			&& me.HaveKeyword(`FirstLoginAtIria_VisitTircho`)	// 이리아에서 시작 반영
		)
		{
			//레벨 15 일때 레벨 20까지 올려라를 완료하면
			if (_idQuest == 200043 && _bSuccess && me.GetLevel() >= 25)
			{
				me.AddGameQuest(200044, 12); //시간의 단위는 1 = 10초
			}

			//레벨 25 일때 레벨 30까지 올려라를 완료하면
			if (_idQuest == 200044 && _bSuccess && me.GetLevel() >= 35)
			{
				me.AddGameQuest(200045, 12); //시간의 단위는 1 = 10초
			}


			//나이 20 일때 선물받기 완료하면
			if (_idQuest == 200076 && _bSuccess
				&& me.GetAge() >= 30 && !me.IsQuestTried(200077)
			)
			{
				me.AddGameQuest(200077, 12); //시간의 단위는 1 = 10초
			}

			//나이 30 일때 선물받기 완료하면
			if (
				(_idQuest == 200077 && _bSuccess)
				&& me.GetAge() >= 40 && !me.IsQuestTried(200078)
			)
			{
				me.AddGameQuest(200078, 12); //시간의 단위는 1 = 10초
			}
		}


		// 엘프 초반 퀘스트
		// G5부터 적용됨
		// 엘프만 by jisangs, 060618
		if (
			me.IsElf()	// 엘프만
			&& GetVersion() >= 500
		)
		{
			// 나오의 소개장
			if (_idQuest == 200301 && _bSuccess)
			{
				me.AddGameQuest(200302, 0);	//
				// 초보자 이벤트 처리
				if ((IsCurrentEvent(`beginnerhelp2006`) || IsCurrentEvent(`beginnerhelp2007`)) && me.HaveKeyword(`_event_beginner`))
				{
					me.AddGameQuest(201005, 0); // 엘프 초보자 퀘스트 예약. 딜레이 0
				}
			}

			//
			if (_idQuest == 200302 && _bSuccess)
			{
				me.AddGameQuest(200303, 0);	//
			}

			//
			if (_idQuest == 200303 && _bSuccess)
			{
				if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(200333, 0);	// 
				}
				else
				{
					me.AddGameQuest(200304, 0);	//
				}
			}

			//
			if ((_idQuest == 200304 || _idQuest == 200333) && _bSuccess)
			{
				me.AddGameQuest(200305, 0);	//
			}

			//
			if (_idQuest == 200305 && _bSuccess)
			{
				if(IsEnable(`featureG10TutorialRenewal`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(201306, 0);	// 금화주머니 주는 퀘스트
				}
				else
				{
					me.AddGameQuest(200306, 0);	// 금화 주머니 안 주는 퀘스트
				}
			}

			//
			if ((_idQuest == 200306 || _idQuest == 201306) && _bSuccess)
			{
				if(IsEnable(`featureG10TutorialRenewal`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(201307, 0);	// 디펜스 F 랭크로 주는 퀘스트
				}
				else
				{
					me.AddGameQuest(200307, 0);	// 디펜스 연습 랭크로 주는 퀘스트
				}
			}

			//
			if ((_idQuest == 200307 || _idQuest == 201307) && _bSuccess)
			{
				me.AddGameQuest(200308, 0);	//
			}

			//
			if (_idQuest == 200308 && _bSuccess)
			{
				me.AddGameQuest(200309, 0);	//
			}

			//
			if (_idQuest == 200309 && _bSuccess)
			{
				me.AddGameQuest(200310, 0);	//
			}

			//
			if (_idQuest == 200310 && _bSuccess)
			{
				me.AddGameQuest(200311, 0);	//
			}

			//
			if (_idQuest == 200311 && _bSuccess)
			{
				if(IsEnable(`featureG10TutorialRenewal`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(201312, 0);	// 카운터 어택 F 랭크로 주는 퀘스트
				}
				else
				{
					me.AddGameQuest(200312, 0);	// 카운터 어택 연습 랭크로 주는 퀘스트
				}
			}

			//
			if ((_idQuest == 200312 || _idQuest == 201312) && _bSuccess)
			{
				me.AddGameQuest(200313, 0);	//
			}

			//
			if (_idQuest == 200313 && _bSuccess)
			{
				me.AddGameQuest(200314, 0);	//
			}

			//
			if (_idQuest == 200314 && _bSuccess)
			{
				me.AddGameQuest(200315, 0);	//
			}

			//
			if (_idQuest == 200315 && _bSuccess)
			{
				me.AddGameQuest(200316, 0);	// 새끼 검붉은 호저의 발톱
			}

			//
			if (_idQuest == 200316 && _bSuccess)
			{
				me.AddGameQuest(200317, 0);	// 새끼 검붉은 호저 스케치하기
				me.AddGameQuest(200331, 2);	// 론가 사막의 유적 던전
			}

			//
			if (_idQuest == 200317 && _bSuccess)
			{
				me.AddGameQuest(200318, 0);	//
			}

			//
			if (_idQuest == 200318 && _bSuccess)
			{
				if(IsEnable(`featureG10TutorialRenewal`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(201319, 0);	// L 로드 주는 퀘스트
				}
				else
				{
					me.AddGameQuest(200319, 0);	// L 로드 안 주는 퀘스트
				}
			}

			//
			if ((_idQuest == 200319 || _idQuest == 201319) && _bSuccess)
			{
				me.AddGameQuest(200320, 0);	// 붉은 모래 전갈의 독주머니
			}

			//
			if (_idQuest == 200320 && _bSuccess)
			{
				me.AddGameQuest(200321, 0);	//
			}

			//
			if (_idQuest == 200321 && _bSuccess)
			{
				me.AddGameQuest(200322, 0);	//
			}

			//
			if (_idQuest == 200322 && _bSuccess)
			{
				me.AddGameQuest(200323, 0);	//
			}

			//
			if (_idQuest == 200323 && _bSuccess)
			{
				me.AddGameQuest(200324, 0);	//
			}

			//
			if (_idQuest == 200324 && _bSuccess)
			{
				me.AddGameQuest(200325, 0);	//
			}

			//
			if (_idQuest == 200325 && _bSuccess)
			{
				me.AddGameQuest(200326, 0);	//
			}

			//
			if (_idQuest == 200326 && _bSuccess)
			{
				me.AddGameQuest(200327, 0);	//
			}

			// 녹색 뿔 코브라 퇴치
			if (_idQuest == 200327 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200328, delay);	//
			}

			// 사막 코뿔소 퇴치
			if (_idQuest == 200328 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200329, delay);	//
			}

			// 폐어 퇴치
			if (_idQuest == 200329 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200330, delay);	//
			}

			// 일본 초보자 이벤트 - uhihiho 2006/10/18
			if (_idQuest == 201005 && _bSuccess)
			{
				if (me.IsSelectableTitle(10052))		// 이벤트 퀘스트 깨면 초보자 타이틀을 known 상태로 (비활성화)
				{
					me.DeactivateTitle(10052);
					me.ShowCaption(["event.pc_event.8"]);
				}
			}

			Call_EgoHelper(me);

		}


		// 자이언트 초반 퀘스트
		// G6부터 적용됨
		// 자이언트만 by jisangs, 061204
		if (
			me.IsGiant()	// 자이언트만
			&& GetVersion() >= 600
		)
		{
			// 나오의 소개장
			if (_idQuest == 200401 && _bSuccess)
			{
				me.AddGameQuest(200402, 0);	// 키리네 여왕 방문
			}

			// 키리네 여왕 방문
			if (_idQuest == 200402 && _bSuccess)
			{
				
				if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(200432, 0);	// new 나무 뽑기
				}
				else
				{
					me.AddGameQuest(200403, 0);	// 나무 뽑기
				}
			}

			// 나무 뽑기
			if ((_idQuest == 200403 || _idQuest == 200432) && _bSuccess)
			{
				me.AddGameQuest(200404, 0);	// 자벨린 던지기
			}

			// 자벨린 던지기
			if (_idQuest == 200404 && _bSuccess)
			{
				me.AddGameQuest(200405, 0);	// 나무열매 채집
			}

			// 나무열매 채집
			if (_idQuest == 200405 && _bSuccess)
			{
				me.AddGameQuest(200406, 0);	// 와인 배달
			}

			// 와인 배달
			if (_idQuest == 200406 && _bSuccess)
			{
				me.AddGameQuest(200407, 0);	// 디펜스 수련
			}

			// 디펜스 수련
			if (_idQuest == 200407 && _bSuccess)
			{
				me.AddGameQuest(200408, 0);	// 힐링 마법을 배우자
			}

			// 힐링 마법을 배우자
			if (_idQuest == 200408 && _bSuccess)
			{
				me.AddGameQuest(200409, 0);	// 근접 전투의 꽃, 윈드밀
			}

			// 근접 전투의 꽃, 윈드밀
			if (_idQuest == 200409 && _bSuccess)
			{
				me.AddGameQuest(200410, 0);	// 응급치료와 부활
			}

			// 응급치료와 부활
			if (_idQuest == 200410 && _bSuccess)
			{
				me.AddGameQuest(200411, 0);	// 카운터 수련
			}

			// 카운터 수련
			if (_idQuest == 200411 && _bSuccess)
			{
				me.AddGameQuest(200412, 0);	// 물을 떠보자
			}

			// 물을 떠보자
			if (_idQuest == 200412 && _bSuccess)
			{
				me.AddGameQuest(200413, 0);	// 수리해보기
			}

			// 수리해보기
			if (_idQuest == 200413 && _bSuccess)
			{
				me.AddGameQuest(200414, 0);	// 태양을 지고 있는 석상 스케치하기
			}

			// 태양을 지고 있는 석상 스케치하기
			if (_idQuest == 200414 && _bSuccess)
			{
				me.AddGameQuest(200415, 0);	// 새끼 회색 피시스 여우 퇴치
			}

			// 새끼 회색 피시스 여우 퇴치
			if (_idQuest == 200415 && _bSuccess)
			{
				me.AddGameQuest(200416, 0);	// 나무장작 채집
			}

			// 나무장작 채집
			if (_idQuest == 200416 && _bSuccess)
			{
				me.AddGameQuest(200417, 0);	// 새끼 붉은 피시스 여우 스케치
			}

			// 새끼 붉은 피시스 여우 스케치
			if (_idQuest == 200417 && _bSuccess)
			{
				me.AddGameQuest(200418, 0);	// 새끼 회색 승냥이의 발톱
			}

			// 새끼 회색 승냥이의 발톱
			if (_idQuest == 200418 && _bSuccess)
			{
				me.AddGameQuest(200419, 0);	// 마법으로 숨겨진 거신상 발견
			}

			// 마법으로 숨겨진 거신상 발견
			if (_idQuest == 200419 && _bSuccess)
			{
				me.AddGameQuest(200420, 0);	// 메이킹 마스터리
			}

			// 메이킹 마스터리
			if (_idQuest == 200420 && _bSuccess)
			{
				me.AddGameQuest(200421, 0);	// 회색 승냥이 퇴치
			}

			// 회색 승냥이 퇴치
			if (_idQuest == 200421 && _bSuccess)
			{
				me.AddGameQuest(200422, 0);	// 눈 속에 묻혀 있는 동물
			}

			// 눈 속에 묻혀 있는 동물
			if (_idQuest == 200422 && _bSuccess)
			{
				me.AddGameQuest(200423, 0);	// 갈색 코요테 퇴치
			}

			// 갈색 코요테 퇴치
			if (_idQuest == 200423 && _bSuccess)
			{
				me.AddGameQuest(200424, 0);	// 라노 베이스 캠프 정찰
			}

			// 라노 베이스 캠프 정찰
			if (_idQuest == 200424 && _bSuccess)
			{
				me.AddGameQuest(200431, 0);	// 양털 5개 채집
				me.AddGameQuest(200425, 10);	// 크루크의 조언
			}

			// 크루크의 조언
			if (_idQuest == 200425 && _bSuccess)
			{
				me.AddGameQuest(200426, 0);	// 흰 피시스 여우 퇴치
			}

			// 흰 피시스 여우 퇴치
			if (_idQuest == 200426 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200427, delay);	// 검은 설원곰 퇴치
			}

			// 검은 설원곰 퇴치
			if (_idQuest == 200427 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200428, delay);	// 흰 워그 퇴치
			}

			// 흰 워그 퇴치
			if (_idQuest == 200428 && _bSuccess)
			{
				int delay = 0;
				if (!IsDevelopment())
				{
					delay = 10;
				}
				me.AddGameQuest(200429, delay);	// 개조해보기
			}

			Call_EgoHelper(me);
		}


		// 이리아 초반 퀘스트
		// 이리아에서 받는 초반 게임 퀘스트
		// 퀘스트 완료시 다음 퀘스트를 받는다.
		// G4S3 이후에 적용됨.
		// 인간만 by jisangs, 060601
		if (
			me.IsHuman()	// 인간만
			&& GetVersion() >= 402
		)
		{

			// 나오의 소개장
			if (_idQuest == 200201 && _bSuccess)
			{
				me.AddGameQuest(200202, 0);	// 전투의 기초. 딜레이 0
				// 초보자 이벤트 처리
				if ((IsCurrentEvent(`beginnerhelp2006`) || IsCurrentEvent(`beginnerhelp2007`)) && (me.HaveKeyword(`FirstLoginAtIria`)) && (me.HaveKeyword(`_event_beginner`)))
				{
					me.AddGameQuest(201003, 0); // 이리아 초보자 퀘스트 예약. 딜레이 0
				}
			}

			// 전투의 기초
			if (_idQuest == 200202 && _bSuccess)
			{
				me.AddGameQuest(200203, 0);	// 힐러의 집 방문. 딜레이 0
			}

			// 힐러의 집 방문
			if (_idQuest == 200203 && _bSuccess)
			{
				me.AddGameQuest(200204, 0);	// 휴식 스킬을 배우자. 딜레이 0
			}

			// 휴식 스킬을 배우자
			if (_idQuest == 200204 && _bSuccess)
			{
				if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`))
				{
					me.AddGameQuest(200232, 0);	// new 새끼 갈색 꼬리 몽구스 잡기. 딜레이 0
				}
				else
				{
					me.AddGameQuest(200205, 0);	// 새끼 갈색 꼬리 몽구스 잡기. 딜레이 0
				}
			}

			// 새끼 갈색 꼬리 몽구스 잡기
			if ((_idQuest == 200205 || _idQuest == 200232) && _bSuccess)
			{
				me.AddGameQuest(200206, 0);	// 새끼 큰 귀 땅돼지 잡기. 딜레이 0
			}

			// 새끼 큰 귀 땅돼지 잡기
			if (_idQuest == 200206 && _bSuccess)
			{
				me.AddGameQuest(200207, 0);	// 매직 마스터리. 딜레이 0
			}

			// 매직 마스터리
			if (_idQuest == 200207 && _bSuccess)
			{
				me.AddGameQuest(200208, 0);	// 나무장작 5개 채집. 딜레이 0
			}

			// 나무장작 5개 채집
			if (_idQuest == 200208 && _bSuccess)
			{
				me.AddGameQuest(200209, 0);	// 대못 5개 채집. 딜레이 0
			}

			// 대못 5개 채집
			if (_idQuest == 200209 && _bSuccess)
			{
				me.AddGameQuest(200210, 0);	// 메이킹 마스터리 스킬. 딜레이 0
			}

			// 메이킹 마스터리 스킬
			if (_idQuest == 200210 && _bSuccess)
			{
				me.AddGameQuest(200211, 0);	// 양털 5개 채집. 딜레이 0
			}

			// 양털 5개 채집
			if (_idQuest == 200211 && _bSuccess)
			{
				me.AddGameQuest(200212, 0);	// 그림이 그려진 기둥 스케치하기. 딜레이 0
			}

			// 그림이 그려진 기둥 스케치하기
			if (_idQuest == 200212 && _bSuccess)
			{
				me.AddGameQuest(200213, 0);	// 새끼 갈색 꼬리 몽구스 스케치하기. 딜레이 0
			}

			// 새끼 갈색 꼬리 몽구스 스케치하기
			if (_idQuest == 200213 && _bSuccess)
			{
				me.AddGameQuest(200214, 0);	// 갈색 꼬리 몽구스 잡기. 딜레이 0
			}

			// 갈색 꼬리 몽구스 잡기
			if (_idQuest == 200214 && _bSuccess)
			{
				me.AddGameQuest(200215, 0);	// 큰 귀 땅돼지 잡기. 딜레이 0
			}

			// 큰 귀 땅돼지 잡기
			if (_idQuest == 200215 && _bSuccess)
			{
				me.AddGameQuest(200216, 0);	// 나오의 선물. 딜레이 0
			}

			// 나오의 선물
			if (_idQuest == 200216 && _bSuccess)
			{
				me.AddGameQuest(200217, 0);	// 수리해보기. 딜레이 0
			}

			// 수리해보기
			if (_idQuest == 200217 && _bSuccess)
			{
				me.AddGameQuest(200218, 0);	// 양털 5개 채집. 딜레이 0
			}

			// 양털 5개 채집
			if (_idQuest == 200218 && _bSuccess)
			{
				me.AddGameQuest(200219, 0);	// 감자 캐기. 딜레이 0
			}

			// 감자 캐기
			if (_idQuest == 200219 && _bSuccess)
			{
				me.AddGameQuest(200220, 0);	// 나무열매 5개 채집. 딜레이 0
			}

			// 나무열매 5개 채집
			if (_idQuest == 200220 && _bSuccess)
			{
				me.AddGameQuest(200221, 0);	// 마법으로 숨겨진 새 석상 기둥. 딜레이 0
			}

			// 마법으로 숨겨진 새 석상 기둥
			if (_idQuest == 200221 && _bSuccess)
			{
				me.AddGameQuest(200222, 0);	// 검은 땅돼지 잡기. 딜레이 0
			}

			// 검은 땅돼지 잡기
			if (_idQuest == 200222 && _bSuccess)
			{
				me.AddGameQuest(200223, 0);	// 회색 꼬리 몽구스 잡기. 딜레이 0
			}

			// 회색 꼬리 몽구스 잡기
			if (_idQuest == 200223 && _bSuccess)
			{
				me.AddGameQuest(200224, 0);	// 개조해보기. 딜레이 0
			}

			// 개조해보기
			if (_idQuest == 200224 && _bSuccess)
			{
				me.AddGameQuest(200225, 0);	// 어린 작은 뿔 누 잡기. 딜레이 0
			}

			// 어린 작은 뿔 누 잡기
			if (_idQuest == 200225 && _bSuccess)
			{
				me.AddGameQuest(200226, 0);	// 알렉시나의 조언. 딜레이 0
			}

			// 알렉시나의 조언
			if (_idQuest == 200226 && _bSuccess)
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200227, 0);	// 티르 코네일 방문. 딜레이 0
					me.AddGameQuest(200228, 0);	// 갈기 땅돼지 퇴치. 딜레이 0
				}
				else
				{
					me.AddGameQuest(200227, 10);	// 티르 코네일 방문. 딜레이 1
					me.AddGameQuest(200228, 15);	// 갈기 땅돼지 퇴치. 딜레이 1
				}
			}

			// 티르 코네일 방문
			if (_idQuest == 200227 && _bSuccess)
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200125, 0);	// (기존 티르 코네일) 던바튼 방문. 딜레이 0
				}
				else
				{
					me.AddGameQuest(200125, 10);	// (기존 티르 코네일) 던바튼 방문. 딜레이 1
				}

				me.AddKeyword(`FirstLoginAtIria_VisitTircho`);
				me.AddKeyword(`FirstLoginAtIria_VisitDuncan`);

				// 기존 나이/레벨/스킬랭크업 관련 퀘스트 해당사항이 있으며 한꺼번에 날려준다?
				{
					// OnAging
					{
						int _iAge = me.GetAge();

						// 20되면 선물주께
						if (_iAge>=20 && !me.IsQuestTried(200076))	//20살 넘었는데 못 받았다
						{
							me.AddGameQuest(200076, 12); //시간의 단위는 1 = 10초
						}

						// 30세, 40세의 경우 OnGameQuestCompleted 에서 준다.
					}

					// OnLevelUp
					{
						int _iLevel = me.GetLevel();

						//레벨 15 일때 레벨 20까지 올려라
						if (_iLevel >= 15 && !me.IsQuestTried(200043))
						{
							me.AddGameQuest(200043, 12); //시간의 단위는 1 = 10초
						}

						// 25 레벨, 35 레벨의 경우 OnGameQuestCompleted 에서 준다.
					}

					// OnSkillLevelUp
					{
						//작곡 F
						if (me.GetSkillLevel(10005) >= 1 && !me.IsQuestTried(200022))
						{
							me.AddGameQuest(200022, 10);
						}
						//캠프파이어 F
						if (me.GetSkillLevel(10008) >= 1 && !me.IsQuestTried(200024))
						{
							me.AddGameQuest(200024, 10);
						}

						//악기연주 E
						if (me.GetSkillLevel(10003) >= 2 && !me.IsQuestTried(200021))
						{
							me.AddGameQuest(200021, 20);
						}
						//힐링 E
						if (me.GetSkillLevel(30006) >= 2 && !me.IsQuestTried(200019))
						{
							me.AddGameQuest(200019, 20);
						}
						//음악지식 E
						if (me.GetSkillLevel(10006) >= 2 && !me.IsQuestTried(200023))
						{
							me.AddGameQuest(200023, 20);
						}

						//응급치료 D랭크 달성
						if (me.GetSkillLevel(10009) >= 4)
						{
							me.RemoveKeyword(`skill_train_firstaid_Drank`);
						}
						//윈드밀 D
						if (me.GetSkillLevel(22001) >= 3 && !me.IsQuestTried(200016))
						{
							me.AddGameQuest(200016, 30);
						}
						//매그넘샷 D
						if (me.GetSkillLevel(21002) >= 3 && !me.IsQuestTried(200018))
						{
							me.AddGameQuest(200018, 30);
						}
						//옷만들기 랭크 D
						if (me.GetSkillLevel(10001) >= 3 && !me.IsQuestTried(200025))
						{
							me.AddGameQuest(200025, 35);
						}
						//방직 D
						if ((me.GetSkillLevel(10011) >= 3) && !me.IsQuestTried(200026))
						{
							me.AddGameQuest(200026, 35);
						}

						//응급치료 C랭크 달성
						if (me.GetSkillLevel(10009) >= 4)
						{
							me.RemoveKeyword(`skill_train_firstaid_Drank`);
							me.RemoveKeyword(`skill_train_firstaid_Crank`);
						}
						//레인지마스터리 C
						if (me.GetSkillLevel(21001) >= 4 && !me.IsQuestTried(200017))
						{
							me.AddGameQuest(200017, 40);
						}

						//응급치료 B
						if (me.GetSkillLevel(10009) >= 5 && !me.IsQuestTried(200020))
						{
							// 이리아 스킬랭크업 들어가면서 응급치료 B랭크까지 도달하게 되었습니다.
							// 아래 200020 퀘스트가 주어지게 되어 있는데,
							// 퀘스트 지급 여부가 확인되지 않아 일단 주석처리 하였습니다.
							// jisangs, 2006/02/17

							// 운영팀의 의견에 따라 퀘스트 오픈
							// jisangs, 2006/10/31
							me.AddGameQuest(200020, 10);
						}
						//컴뱃 B
						if (me.GetSkillLevel(23002)  >= 5 && !me.IsQuestTried(200013))
						{
							me.AddGameQuest(200013, 50);
						}
						//카운터 B
						if (me.GetSkillLevel(20003) >= 5 && !me.IsQuestTried(200015))
						{
							me.AddGameQuest(200015, 50);
						}
						//응급치료 B랭크 달성
						if (me.GetSkillLevel(10009) >= 5)
						{
							me.RemoveKeyword(`skill_train_firstaid_Crank`);
						}

						//스매시 A
						if (me.GetSkillLevel(20002) >= 6 && !me.IsQuestTried(200014))
						{
							me.AddGameQuest(200014, 60);
						}

						//음악지식 9
						if (me.GetSkillLevel(10006) >= 7)
						{
							me.RemoveKeyword(`skill_train_musicknow_9rank`);
							me.RemoveKeyword(`musical_know_a_nele_loeiz`);
						}

						//작곡 8랭크 달성
						if (me.GetSkillLevel(10005) >= 8)
						{
							me.RemoveKeyword(`skill_train_compose_8rank`);
						}
						//음악지식 8랭크 달성
						if (me.GetSkillLevel(10006) >= 8)
						{
							me.RemoveKeyword(`skill_train_musicknow_9rank`);
						}

						//작곡 7랭크 달성
						if (me.GetSkillLevel(10005) >= 9)
						{
							me.RemoveKeyword(`skill_train_compose_8rank`);
						}
					}
				}
			}

			// 갈기 땅돼지 퇴치
			if (_idQuest == 200228 && _bSuccess)
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200229, 0);	// 회색 꼬리 몽구스 퇴치. 딜레이 0
				}
				else
				{
					me.AddGameQuest(200229, 10);	// 회색 꼬리 몽구스 퇴치. 딜레이 1
				}
			}

			// 회색 꼬리 몽구스 퇴치
			if (_idQuest == 200229 && _bSuccess)
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200230, 0);	// 항아리 거미 퇴치. 딜레이 0
				}
				else
				{
					me.AddGameQuest(200230, 10);	// 항아리 거미 퇴치. 딜레이 1
				}
			}

			// 일본 초보자 이벤트 - uhihiho 2006/10/18
			if (_idQuest == 201003 && _bSuccess)
			{
				if (me.IsSelectableTitle(10052))		// 이벤트 퀘스트 깨면 초보자 타이틀을 known 상태로 (비활성화)
				{
					me.DeactivateTitle(10052);
					me.ShowCaption(["event.pc_event.9"]);
				}
			}

			//아이리 부르기
			if(_idQuest>=200201 && _idQuest<=200226 && IsIriaEiry_Enable() extern (`/data/script/Korea/EgoWeapon/ego_eiry.mint`))
			{
				Call_EgoHelper(me);
			}
		}


		// G3S4 begin 티르 코네일 초반 퀘스트 변경
		// : OnGameQuestCompleted 에서 신규 퀘스트들 완료되었을 때
		//  다음 게임 퀘스트와 병렬 퀘스트를 주는 부분
		// 인간만 by jisangs, 060601
		if (
			me.IsHuman()	// 인간만
			&&
			(
				GetLocale().LowerCase()==`korea`
				|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
					&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
				|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
				|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
				|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
			)
		)
		{
			if(_bSuccess)
			{
				int newQuestID = 0;
				newQuestID = GetNextGameQuestID(me, _idQuest);

				if(newQuestID != 0) // next 퀘스트가 할당된 경우
				{
					ProcessGameQuest(me, newQuestID); // newQuestID 퀘스트와 병렬적으로 실행되는 퀘스트들을 실행한다.
				}
				else if(_idQuest == 200129 || _idQuest == 200130) // (병렬 퀘스트) 갈색곰 퇴치, 갈색 그리즐리 베어 퇴치가 완료되었을 경우
				{
					ProcessGameQuest(me, 0); // 게임 퀘스트는 실행하지 않고, 병렬 퀘스트들만 실행한다.
				}
			}
		}
		// G3S4 end

		//뉴비퀘스트 - 휴식스킬 얻기
		if (_idQuest == 200004 && _bSuccess)
		{
			//개발서버면 퀘스트를 바로 준다.

			if (IsDevelopment())
			{
				me.AddGameQuest(200009, 0); //휴식. 딜레이 1
			}
			else
			{
				me.AddGameQuest(200009, 1); //휴식. 딜레이 1
			}
		}


		//휴식 스킬 얻기 - 학교가기

		if (_idQuest == 200009 && _bSuccess)
		{
			//개발서버면 퀘스트를 바로 준다.

			if (IsDevelopment())
			{
				me.AddGameQuest(200007, 0); //학교. 딜레이 6
			}
			else
			{
				me.AddGameQuest(200007, 6); //학교. 딜레이 6
			}
		}

		//학교 가기 - 녹색구슬
		if (_idQuest == 200007 && _bSuccess)
		{
			int delay = 0, delay2 = 0;

			if (IsDevelopment())
			{
				delay = 0;
				delay2 = 0;
			}
			else
			{
				delay = 3;
				delay2 = 6;
			}

			me.AddGameQuest(200005, delay);  //딜레이 3
			if(
				GetLocale().LowerCase()==`korea`
				|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
					&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
				|| GetLocale().LowerCase() ==`china`
				|| (GetLocale().LowerCase() == `taiwan` && GetVersion() >= 003)
				|| (GetLocale().LowerCase() == `japan` && GetVersion() >= 200)
			)//리밸런싱 적용 2005-07-12
			{
				if(!me.HaveKeyword(`memorial_character`))
				{
					me.AddGameQuest(200075, delay2);  //딜레이 3 매직 마스터리 교습
				}
			}
		}

		//녹색구슬 - 트레이시(나무)
		if (_idQuest == 200005 && _bSuccess)
		{
			if (IsDevelopment())
			{
				//me.AddGameQuest(200006, 0); //딜레이 50	 장작 10개 채집 옜날거
				me.AddGameQuest(200064, 0); //딜레이 50
			}
			else
			{
				//me.AddGameQuest(200006, 50); //딜레이 50
				me.AddGameQuest(200064, 0); //딜레이 50
			}

	//		if(
	//			(GetGeneration()==3 && GetSeason()>=2)
	//			||
	//			GetGeneration()>=4
	//		)
			{
				if (IsDevelopment())	//메이킹 마스터리
				{
					me.AddGameQuest(200079, 0); //딜레이 50
				}
				else
				{
					me.AddGameQuest(200079, 12); //딜레이 50
				}
			}

		}

		if(
			(GetLocale().LowerCase()==`korea`)
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
			|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
			|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
		)	//G3S4 초반퀘스트 변경 - OnGameQuestCompleted
		{
			//피르아스(트레이시 대신) - 양털
			if (_idQuest == 200006 && _bSuccess && !me.IsQuestTried(200109))
			{
				me.AddGameQuest(200109, 0); // 양털
			}
		}
		else // 구 퀘스트 진행대로
		{
			//트레이시 - 양치기(양털), 말콤(가는실)
			if ((_idQuest == 200006 && _bSuccess) ||(_idQuest == 200064 && _bSuccess))
			{
				if (IsDevelopment())
				{
					//me.AddGameQuest(200010, 0); //양털 20개 옛날꺼
					me.AddGameQuest(200067, 0);
					//me.AddGameQuest(200027, 0);  //거미줄 가는실
					me.AddGameQuest(200065, 0);  //거미줄 채집
				}
				else
				{
					//me.AddGameQuest(200010, 200); //딜레이 200. 양털 20개 옛날꺼
					me.AddGameQuest(200067, 200); //딜레이 200
					//me.AddGameQuest(200027, 0);  //거미줄 가는실
					me.AddGameQuest(200065, 400);  //거미줄 채집
				}

			}
		}

		if(
			(GetLocale().LowerCase()==`korea`)
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
			|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
			|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
		)	//G3S4 초반퀘스트 변경 - OnGameQuestCompleted
		{
			//양털 - 붉은 여우
			if (_idQuest == 200010 && _bSuccess && !me.IsQuestTried(200110))
			{
				me.AddGameQuest(200110, 0); // 붉은 여우
			}
		}
		else // 구 퀘스트 진행대로
		{
			//양털 - 알비던전의 보물상자
			if (_idQuest == 200010 && _bSuccess)
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200008, 0); //딜레이 800
				}
				else
				{
					me.AddGameQuest(200008, 800); //딜레이 800
				}
			}
		}

		//양털2 -던컨의조언-알비던전의 보물상자

		if (_idQuest == 200067 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200068, 0); //던컨의 조언
				me.AddGameQuest(200008, 0); //알비던전의 보물상자 딜레이 800
			}
			else
			{
				me.AddGameQuest(200068, 30); //던컨의 조언
				me.AddGameQuest(200008, 800); //알비던전의 보물상자 딜레이 800
			}
		}


		//알비던전의 보물상자 - 던컨(물떠보기)
		if (_idQuest == 200008 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200052, 0);
			}
			else
			{
				me.AddGameQuest(200052, 30);
			}
		}

		//던컨(물떠보기) - 데이안(거대흰늑대)
		if (_idQuest == 200052 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200056, 0);
			}
			else
			{
				me.AddGameQuest(200056, 400);
			}
		}

		//데이안(거대흰늑대) - 트레보(키아 파티)
		if (_idQuest == 200056 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200046, 0);
			}
			else
			{
				me.AddGameQuest(200046, 400);
			}
		}

		//트레보(키아 파티) - 아란웬(서큐버스)
		if (_idQuest == 200046 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200034, 0);
			}
			else
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200059, 800);
			}
			else
			{
				me.AddGameQuest(200034, 800);
			}
		}

		if(
			(GetLocale().LowerCase()==`korea`)
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
			|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
			|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
		)	//G3S4 초반퀘스트 변경 - OnGameQuestCompleted
		{
			//말콤(가는실) - 케이틴(열매채집)
	DebugOut(`3 - 200115 대신 200132 퀘스트로 교체`);
			// if (_idQuest == 200027 && _bSuccess && !me.IsQuestTried(200115))
			if (_idQuest == 200027 && _bSuccess && !me.IsQuestTried(200132))
			{
	DebugOut(`4 - 200115 대신 200132 퀘스트로 교체`);
				// me.AddGameQuest(200115, 0); // 열매채집
				me.AddGameQuest(200132, 0); // 열매채집
			}
		}
		else // 구 퀘스트 진행대로
		{
			//말콤(가는실) - 케이틴(열매채집)
			if ((_idQuest == 200027 && _bSuccess) || (_idQuest == 200065 && _bSuccess))
			{
				if (IsDevelopment())
				{
					me.AddGameQuest(200031, 0);
				}
				else
				{
					me.AddGameQuest(200031, 50);
				}
			}
		}

		//케이틴(열매채집) - 엔델리온(밀가루)

		if (_idQuest == 200031 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200032, 0);
			}
			else
			{
				me.AddGameQuest(200032, 80);
			}
		}

		//엔델리온(밀가루) - 퍼거스(수리)

		if (_idQuest == 200032 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200050, 0);
			}
			else
			{
				me.AddGameQuest(200050, 100);
			}
		}

		//퍼거스(수리) - 스튜어트(비밀상점)

		if (_idQuest == 200050 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200051, 0);
			}
			else
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200057, 800);
			}
			else
			{
				me.AddGameQuest(200051, 800);
			}
		}

		//던바튼 마누스 방문 - 크리스텔(감자채집)
		if (_idQuest == 200011 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200036, 0);
			}
			else
			{
				me.AddGameQuest(200036, 800);
			}
		}

		//크리스텔(감자채집) - 에반(거대곰)
		if (_idQuest == 200036 && _bSuccess)
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200037,0);
			}
			else
			{
				me.AddGameQuest(200037,400);
			}
		}

		//에반(거대곰) - 반호르 컴건 방문 레벨 15 이상
		if (_idQuest == 200037 && _bSuccess)
		{
			if (IsDevelopment())
			{
				if (me.GetLevel() >=25)
				{
					me.AddGameQuest(200038, 0);
				}
			}
			else
			{
				if (me.GetLevel() >=25)
				{
					me.AddGameQuest(200038, 100);
				}
			}
		}

	//	//반호르 컴건 방문 - 에일렌(철광석채집)
	//	if (_idQuest == 200038 && _bSuccess)
	//	{
	//		if (IsDevelopment())
	//		{
	//			me.AddGameQuest(200039, 0);
	//		}
	//		else
	//		{
	//			me.AddGameQuest(200039, 5);
	//		}
	//
	//	}
	//
	//	//에일렌(철광석채집) - 에일렌(은광석채집)
	//	if (_idQuest == 200039 && _bSuccess)
	//	{
	//		if (IsDevelopment())
	//		{
	//			if (me.GetLevel() >= 10 && me.GetRebirthCount()>0)
	//			{
	//				me.AddGameQuest(200054, 0);
	//			}
	//		}
	//		else
	//		{
	//			if (me.GetLevel() >= 10 && me.GetRebirthCount()>0)
	//			{
	//				me.AddGameQuest(200054, 20);
	//			}
	//		}
	//	}
	//
	//	//에일렌(은광석채집) - 에일렌(금광석채집)
	//	if (_idQuest == 200054 && _bSuccess)
	//	{
	//		if (IsDevelopment())
	//		{
	//			if (me.GetLevel() >= 10 && me.GetRebirthCount()>1)
	//			{
	//				me.AddGameQuest(200055, 400);
	//			}
	//		}
	//		else
	//		{
	//			if (me.GetLevel() >= 10 && me.GetRebirthCount()>1)
	//			{
	//				me.AddGameQuest(200055, 400);
	//			}
	//		}
	//	}
	} //eljjoo
}




//////////////////////////////////////////////////////////////////////////////////
server int GetFirstGameQuestID(character me)
// : 다음 게임 퀘스트 ID를 돌려준다.
//////////////////////////////////////////////////////////////////////////////////
{
	int IndexQuestID = 0;

	// 반호르 방문 - 스튜어트 비밀상점
	if (!me.IsQuestCompleted(200128) && me.IsQuestCompleted(200127))
	{
		IndexQuestID = 200128; // 반호르 방문
	}

	// 스튜어트 비밀상점 - 감자 캐기
	if (!me.IsQuestCompleted(200127) && me.IsQuestCompleted(200126))
	{
		IndexQuestID = 200127; // 스튜어트 비밀상점
	}

	// 감자 캐기 - 던바튼 방문
	if (!me.IsQuestCompleted(200126) && me.IsQuestCompleted(200125))
	{
		IndexQuestID = 200126; // 감자 캐기
	}

	// 던바튼 방문 - 물 뜨기
	if (!me.IsQuestCompleted(200125) && me.IsQuestCompleted(200124))
	{
		IndexQuestID = 200125; // 던바튼 방문
	}

	// 물 뜨기 - 키아 초급
	if (!me.IsQuestCompleted(200124) && me.IsQuestCompleted(200123))
	{
		IndexQuestID = 200124; // 물 뜨기
	}

	// 키아 초급 - 던컨의 조언
	if (!me.IsQuestCompleted(200123) && me.IsQuestCompleted(200120))
	{
		IndexQuestID = 200121; // 흰늑대 20마리
	}

	// 던컨의 조언 - 알비던전
	if (!me.IsQuestCompleted(200120) && me.IsQuestCompleted(200117))
	{
		IndexQuestID = 200118; // 회색늑대 10마리
	}

	// 알비던전 - 밀가루
	if (!me.IsQuestCompleted(200117) && me.IsQuestCompleted(200116))
	{
		IndexQuestID = 200117; // 알비던전
	}

	// 밀가루 - 열매 채집
	// if (!me.IsQuestCompleted(200116) && me.IsQuestCompleted(200115))
	if (!me.IsQuestCompleted(200116) && me.IsQuestCompleted(200132))
	{
DebugOut(`7 - 200115 대신 200132 퀘스트로 교체`);
		IndexQuestID = 200116; // 밀가루
	}

	// 열매 채집 - 거미줄
	// if (!me.IsQuestCompleted(200115) && me.IsQuestCompleted(200114))
	if (!me.IsQuestCompleted(200132) && me.IsQuestCompleted(200114))
	{
DebugOut(`8 - 200115 대신 200132 퀘스트로 교체`);
		// IndexQuestID = 200115; // 열매 채집
		IndexQuestID = 200132; // 열매 채집
	}

	// 거미줄 - 퍼거스 수리
	if (!me.IsQuestCompleted(200114) && me.IsQuestCompleted(200113))
	{
		IndexQuestID = 200114; // 거미줄
	}

	// 퍼거스 수리 - 나오의 선물
	if (!me.IsQuestCompleted(200113) && me.IsQuestCompleted(200112))
	{
		IndexQuestID = 200113; // 퍼거스 수리
	}

	// 나오의 선물 - 양털
	if (!me.IsQuestCompleted(200112) && me.IsQuestCompleted(200109))
	{
		IndexQuestID = 200110; // 붉은여우 5마리
	}

	// 양털 - 장작
	if (!me.IsQuestCompleted(200109) && me.IsQuestCompleted(200108))
	{
		IndexQuestID = 200109; // 양털
	}

	// 장작 - 녹색 구슬
	if (!me.IsQuestCompleted(200108) && me.IsQuestCompleted(200107))
	{
		IndexQuestID = 200108; // 장작
	}

	// 녹색 구슬 - 휴식
	if (!me.IsQuestCompleted(200107) && me.IsQuestCompleted(200105))
	{
		IndexQuestID = 200106; // 흰거미 5마리
	}

	// 휴식 - 학교가기
	if (!me.IsQuestCompleted(200105) && me.IsQuestCompleted(200102))
	{
		IndexQuestID = 200103; // 힐러의 집 방문
	}

	// 학교가기 - 나오의 소개장
	if (!me.IsQuestCompleted(200102) && me.IsQuestCompleted(200101))
	{
		IndexQuestID = 200102; // 학교가기
	}

	// 처음부터 시작 안되어있으면
	if (!me.IsQuestCompleted(200102) && !me.IsQuestCompleted(200101))
	{
		IndexQuestID = 200101; // 나오의 소개장
	}


	return IndexQuestID;
// G3S4 end
}



//////////////////////////////////////////////////////////////////////////////////
server void ProcessGameQuest(character me, int newQuestID)
// : 게임 퀘스트 ID를 실행한다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		me.AddGameQuest(newQuestID, 0); // 개발서버에서는 바로 퀘스트를 준다.

	}
	else
	{
		// 실제 게임서버에서는 아래와 같은 delay가 지난 후에 퀘스트를 준다.
		if(newQuestID == 200124 || newQuestID == 200125 || newQuestID == 200126
			|| newQuestID == 200127 || newQuestID == 200128)
		{
			// 일반 게임퀘스트 진행일 때
			me.AddGameQuest(newQuestID, 40); // 40 * 15초 = 10분
		}
		/*
		if(newQuestID == 0)
		{
			// do nothing
		}
		else if(newQuestID == 200108)
		{
			me.AddGameQuest(newQuestID, 0); // 0초
		}
		else if(newQuestID == 200101 || newQuestID == 200102 || newQuestID == 200107 || newQuestID == 2001)
		{
			me.AddGameQuest(newQuestID, 6); // 6초
		}
		else if(newQuestID == 200120 || newQuestID == 200124)
		{
			me.AddGameQuest(newQuestID, 30); // 30초
		}
		else if(newQuestID == 200115)
		{
			me.AddGameQuest(newQuestID, 50); // 50초
		}
		else if(newQuestID == 200116)
		{
			me.AddGameQuest(newQuestID, 80); // 80초
		}
		else if(newQuestID == 200113 || newQuestID == 200128)
		{
			me.AddGameQuest(newQuestID, 100); // 100초
		}
		else if(newQuestID == 200109)
		{
			me.AddGameQuest(newQuestID, 200); // 200초
		}
		else if(newQuestID == 200114 || newQuestID == 200123)
		{
			me.AddGameQuest(newQuestID, 400); // 400초
		}
		else if(newQuestID == 200117 || newQuestID == 200127 || newQuestID == 200121)
		{
			me.AddGameQuest(newQuestID, 800); // 800초
		}
		else
		{
			me.AddGameQuest(newQuestID, 300); // 300초
		}*/
		me.AddGameQuest(newQuestID, 0); // 0초

	}

	 //G3S4 아이리
	{
		if(
			(newQuestID>=200102 && newQuestID<=200123)
		)
		{
			Call_EgoHelper(me);
		}
	}

	// 퀘스트가 완료되었으면 같이 주어질 퀘스트
	// 학교 가기 완료시 (혹은 최종 반호르방문까지 마쳤을 때) -> 매직 마스터리
	if ((me.IsQuestCompleted(200102) || me.IsQuestCompleted(200128))
		&& !me.IsQuestTried(200075)
		&& me.GetSkillLevel(30007) < 1)
	{
		int delay = 0;

		if (IsDevelopment()) //G3S4 마비노기 튠업
		{
			delay = 0;
		}
		else
		{
			delay = 6;
		}
		if(
			GetLocale().LowerCase()==`korea`
			|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
				&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
			|| GetLocale().LowerCase() ==`china`
			|| (GetLocale().LowerCase() == `taiwan` && GetVersion() >= 003)
			|| (GetLocale().LowerCase() == `japan` && GetVersion() >= 200)
		)
		{
			if(!me.HaveKeyword(`memorial_character`))
			{
				me.AddGameQuest(200075, delay);  //딜레이 3 매직 마스터리 교습
			}
		}
	}
	// 학교가기 완료시 -> 컴뱃 마스터리 D
	if (me.IsQuestCompleted(200102)
		&& !me.IsQuestTried(200087)
		&& me.GetSkillLevel(23002) < 3)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200087, 0); // 컴뱃 마스터리 D
		}
		else
		{
			me.AddGameQuest(200087, 20); // 컴뱃 마스터리 D - 현실 5분 딜레이
		}
	}


	// 녹색구슬 완료시 (혹은 최종 반호르방문까지 마쳤을 때) -> 메이킹 마스터리
	if ((me.IsQuestCompleted(200107) || me.IsQuestCompleted(200128))
		&& !me.IsQuestTried(200079)
		&& me.GetSkillLevel(10024) < 1)
	{
		if (IsDevelopment())	//메이킹 마스터리
		{
			me.AddGameQuest(200079, 0); //딜레이 50
		}
		else
		{
			me.AddGameQuest(200079, 12); //딜레이 50
		}
	}


	// 알비초급 완료시 -> 스매시 F
	if (me.IsQuestCompleted(200117)
		&& !me.IsQuestTried(200088)
		&& me.GetSkillLevel(20002) < 1)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200088, 0); // 스매시 F
		}
		else
		{
			me.AddGameQuest(200088, 20); // 스매시 F - 현실 5분 딜레이
		}
	}


	// 회색늑대 10마리 완료시 -> 윈드밀 F
	if (me.IsQuestCompleted(200118)
		&& !me.IsQuestTried(200089)
		&& me.GetSkillLevel(22001) < 1)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200089, 0); // 윈드밀 F
		}
		else
		{
			me.AddGameQuest(200089, 20); // 윈드밀 F - 현실 5분 딜레이
		}
	}


	// 물뜨기이후 (혹은 최종 반호르방문까지 마쳤을 때) -> 갈색곰 퇴치 or 갈색 그리즐리 베어 or 서큐버스
	if(me.IsQuestCompleted(200124) || me.IsQuestCompleted(200128))
	{
		if(!me.IsQuestTried(200129)) // 갈색곰 퇴치
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200129, 0); // 갈색곰 퇴치
			}
			else
			{
				me.AddGameQuest(200129, 240); // 갈색곰 퇴치 - 현실 1시간 딜레이
			}
		}
		else if(me.IsQuestCompleted(200129) && !me.IsQuestTried(200130)) // 갈색 그리즐리 베어 퇴치
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200130, 0); // 갈색 그리즐리 베어 퇴치
			}
			else
			{
				me.AddGameQuest(200130, 240); // 갈색 그리즐리 베어 퇴치 - 현실 1시간 딜레이
			}
		}
		else if(me.IsQuestCompleted(200129) && me.IsQuestCompleted(200130) && !me.IsQuestTried(200131)) // 서큐버스
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200131, 0); // 서큐버스
			}
			else
			{
				me.AddGameQuest(200131, 240); // 서큐버스 - 현실 1시간 딜레이
			}
		}
	}

}



///////////////////////////////////
server void
Call_EgoHelper(character player)
///////////////////////////////////
{
	item egoItem=player.GetEgoWeapon();
	if (egoItem.IsValid())
	{
		// 정령 무기의 타입이 초보 정령 무기일때만..
		if (player.GetEgoType() == 9)
		{
			egoItem.SetEgoEventString(`got_gamequest_now`);
			if(IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`))
			{
				//한국 G8S3 이후나 북미에서는 클리어해도 조용히 함
			}
			else
			{
				player.TalkToEgo();
			}
			//player.ShowCaption(`주인님, 지금 뭘 해야 할지 궁금하세요? 알려드릴께요. /키를 눌러주세요!`, 5000);

		}
	}
}



// G3S4 begin
//////////////////////////////////////////////////////////////////////////////////
server int GetNextGameQuestID(character me, int _iQuestID)
// : 다음 게임 퀘스트 ID를 돌려준다.
//////////////////////////////////////////////////////////////////////////////////
{
	int IndexQuestID = _iQuestID;

	// 튜토리얼 리뉴얼 - uhihiho
	if (IndexQuestID == 202001 && me.IsQuestCompleted(202001))
	{
		if(!me.HaveKeyword(`memorial_character`))
		{
			IndexQuestID = 202002;	// 트레보 마을 주민 구하기
		}
		if ((IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)) &&  !me.IsUsableSkill(20001) && !me.HaveKeyword(`memorial_character`))		// 리뉴얼 후, 디펜스를 아직 안배웠으면
		{
			me.AddGameQuest(202029,	1);	// 10초 뒤 디펜스 배우기
		}
	}
	if (IndexQuestID == 212001 && me.IsQuestCompleted(212001))
	{
		if(!me.HaveKeyword(`memorial_character`))
		{
			IndexQuestID = 212002;	// 트레보 마을 주민 구하기
		}
		if ((IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)) &&  !me.IsUsableSkill(20001) && !me.HaveKeyword(`memorial_character`))		// 리뉴얼 후, 디펜스를 아직 안배웠으면
		{
			me.AddGameQuest(212029,	1);	// 10초 뒤 디펜스 배우기
		}
	}

	if (
		(IndexQuestID == 202002 && me.IsQuestCompleted(202002)) ||	// AP 3 짜리
		(IndexQuestID == 212002 && me.IsQuestCompleted(212002)) ||	// 유럽용
		(IndexQuestID == 202012 && me.IsQuestCompleted(202012)) ||	// AP 2 짜리
		(IndexQuestID == 202022 && me.IsQuestCompleted(202022))		// AP 1 짜리
	)
	{
		if(!me.HaveKeyword(`memorial_character`))
		{
			if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
			{
				IndexQuestID = 212003;	// 데이안의 양을 지켜줘
			}
			else
			{
				IndexQuestID = 202003;	// 데이안의 양을 지켜줘
			}
		}
		if((IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)) && !me.IsUsableSkill(10004) && !me.HaveKeyword(`memorial_character`))
		{
			if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
			{
				me.AddGameQuest(212028,	1);	// 10초 뒤 휴식스킬 배우기
			}
			else
			{
				me.AddGameQuest(202028,	1);	// 10초 뒤 휴식스킬 배우기
			}
		}
	}

	if (
		(IndexQuestID == 202003 && me.IsQuestCompleted(202003)) ||	// AP 3 짜리
		(IndexQuestID == 212003 && me.IsQuestCompleted(212003)) ||	// 유럽용
		(IndexQuestID == 202013 && me.IsQuestCompleted(202013)) ||	// AP 2 짜리
		(IndexQuestID == 202023 && me.IsQuestCompleted(202023))		// AP 1 짜리
	)
	{
		if(!me.HaveKeyword(`memorial_character`))
		{
			if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
			{
				IndexQuestID = 212004;	// 카운터 어택으로 거대거미 반지 토하게 하기
			}
			else
			{
				IndexQuestID = 202004;	// 카운터 어택으로 거대거미 반지 토하게 하기
			}
		}
		if((IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)) && !me.IsUsableSkill(10008) && !me.HaveKeyword(`memorial_character`))
		{
			if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
			{
				me.AddGameQuest(212026,	1);	// 10초 뒤 캠프파이어 배우기
			}
			else
			{
				me.AddGameQuest(202026,	1);	// 10초 뒤 캠프파이어 배우기
			}
		}
	}


	if (
		(IndexQuestID == 202004 && me.IsQuestCompleted(202004)) ||	// AP 3 짜리
		(IndexQuestID == 212004 && me.IsQuestCompleted(212004)) ||	// AP 3 짜리
		(IndexQuestID == 202014 && me.IsQuestCompleted(202014)) ||	// AP 2 짜리
		(IndexQuestID == 202024 && me.IsQuestCompleted(202024))		// AP 0 짜리
	)
	{
		if(!(IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)))
		{
			IndexQuestID = 202005;	// 던컨에게 NPC 추천받기.  G8S3 이후와 북미는 아래처럼 바뀐다. 구 던컨의 추천도 진행됨.
		}
		else if(!me.HaveKeyword(`memorial_character`))
		{
			int iRandom=Random(4);
			switch (iRandom)
			{
				case (0)
				{
					IndexQuestID = 202036;
				}
				case (1)
				{
					if(me.IsUsableSkill(10004))
					{
						IndexQuestID = 202037;
					}
					else
					{
						int iRandom2 = Random(3);
						if (iRandom2 == 0)	IndexQuestID = 202036;
						if (iRandom2 == 1)	IndexQuestID = 202038;
						if (iRandom2 == 2)	IndexQuestID = 202039;
					}
				}
				case (2)
				{
					IndexQuestID = 202038;
				}
				case (3)
				{
					IndexQuestID = 202039;
				}
			}
			if((IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)) && !me.IsUsableSkill(10003) && !me.HaveKeyword(`memorial_character`))
			{
				if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
				{
					me.AddGameQuest(212027,	1);	// 10초 뒤 악기연주 배우기
				}
				else
				{
					me.AddGameQuest(202027,	1);	// 10초 뒤 악기연주 배우기
				}
			}
		}
	}

	if (
		(IndexQuestID == 202005 && me.IsQuestCompleted(202005)) ||
		(IndexQuestID == 202036 && me.IsQuestCompleted(202036)) ||
		(IndexQuestID == 202037 && me.IsQuestCompleted(202037)) ||
		(IndexQuestID == 202038 && me.IsQuestCompleted(202038)) ||
		(IndexQuestID == 202039 && me.IsQuestCompleted(202039))
	)
	{
		me.AddGameQuest(202201, 2);	// 20초 뒤에 서브퀘스트 첫번째 배달.
		me.AddGameQuest(200079, 6);	// 1분 뒤 메이킹 마스터리
		me.AddGameQuest(200075, 60);	// 10분 뒤 매직 마스터리
		me.AddGameQuest(202101, 120);	// 20분 뒤 보스 퀘스트 시작
		if (GetVersion() >= 501)	// 액션은 G5S1 이후부터 적용(08.01.24/versable)
		{
			me.AddGameQuest(200092, 360);	// 1시간 뒤 죽은 척 하기
			me.AddGameQuest(200094, 720);	// 2시간 뒤 돌 던지기
		}
		if(IsEnable(`featureTutorialPlayUpgrade_G9S2`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(202030, 5*6);	// 5분 뒤 생활형 퀘스트 시작, 녹색 구슬 채집.
		}
	}

	//뉴비퀘스트 - 레이널드 학교가기
	if (IndexQuestID == 200101 && me.IsQuestCompleted(200101))
	{
		IndexQuestID = 200102; // 레이널드 학교 가기
		// 초보자 퀘스트
		if ((IsCurrentEvent(`beginnerhelp2006`) || IsCurrentEvent(`beginnerhelp2007`)) && (me.HaveKeyword(`_event_beginner`)))
		{
			me.AddGameQuest(201001, 0);
		}
	}



	//학교 가기 - 힐러의 집 방문
	if (IndexQuestID == 200102 && me.IsQuestCompleted(200102))
	{
		IndexQuestID = 200103; // 힐러의 집 방문
	}

	//힐러의 집 방문 - 갈색여우 5마리
	if (IndexQuestID == 200103 && me.IsQuestCompleted(200103))
	{
		IndexQuestID = 200104; // 갈색여우 5마리


	}

	//갈색여우 5마리 - 휴식 스킬 얻기
	if (IndexQuestID == 200104 && me.IsQuestCompleted(200104))
	{
		IndexQuestID = 200105; // 휴식 스킬 얻기


	}

	//휴식 스킬 얻기 - 흰거미 5마리
	if (IndexQuestID == 200105 && me.IsQuestCompleted(200105))
	{
		IndexQuestID = 200106; // 흰거미 5마리

	}

	//흰거미 5마리 - 녹색구슬
	if (IndexQuestID == 200106 && me.IsQuestCompleted(200106))
	{
		IndexQuestID = 200107; // 녹색구슬

	}

	//녹색구슬 - 피르아스(나무)
	if (IndexQuestID == 200107 && me.IsQuestCompleted(200107))
	{
		IndexQuestID = 200108; // 피르아스(나무)
	}

	//피르아스(나무) - 양치기(양털)
	if (IndexQuestID == 200108 && me.IsQuestCompleted(200108))
	{
		IndexQuestID = 200109; // 양털

	}

	//양털 - 나오의 선물
	if (IndexQuestID == 200109 && me.IsQuestCompleted(200109))
	{
		IndexQuestID = 200110; // 붉은여우 5마리


	}

	//붉은여우 5마리 - 회색여우 5마리
	if (IndexQuestID == 200110 && me.IsQuestCompleted(200110))
	{
		IndexQuestID = 200111; // 회색여우 5마리

	}

	//회색여우 5마리 - 나오의 선물
	if (IndexQuestID == 200111 && me.IsQuestCompleted(200111))
	{
		IndexQuestID = 200112; // 나오의 선물

	}

	//나오의 선물 - 퍼거스 수리
	if (IndexQuestID == 200112 && me.IsQuestCompleted(200112))
	{
		IndexQuestID = 200113; // 퍼거스 수리


	}

	//퍼거스 수리 - 거미줄
	if (IndexQuestID == 200113 && me.IsQuestCompleted(200113))
	{
		IndexQuestID = 200114; // 거미줄

	}

	//거미줄 - 열매 채집
	if (IndexQuestID == 200114 && me.IsQuestCompleted(200114))
	{
DebugOut(`5 - 200115 대신 200132 퀘스트로 교체`);
		// IndexQuestID = 200115; // 열매 채집
		IndexQuestID = 200132; // 열매 채집

	}

	//열매 채집 - 밀가루
	// if (IndexQuestID == 200115 && me.IsQuestCompleted(200115))
	if (IndexQuestID == 200115 && me.IsQuestCompleted(200115)
		|| IndexQuestID == 200132 && me.IsQuestCompleted(200132))
	{
DebugOut(`6 - 200115 대신 200132 퀘스트로 교체`);
		IndexQuestID = 200116; // 밀가루

	}

	//밀가루 - 알비던전의 보물상자
	if (IndexQuestID == 200116 && me.IsQuestCompleted(200116))
	{
		IndexQuestID = 200117; // 알비던전의 보물상자

	}

	//알비던전의 보물상자 - 회색늑대 10마리
	if (IndexQuestID == 200117 && me.IsQuestCompleted(200117))
	{
		IndexQuestID = 200118; // 회색늑대 10마리

	}

	//회색늑대 10마리 - 검은늑대 15마리
	if (IndexQuestID == 200118 && me.IsQuestCompleted(200118))
	{
		IndexQuestID = 200119; // 회색늑대 10마리

	}

	//검은늑대 15마리 - 던컨의 조언
	if (IndexQuestID == 200119 && me.IsQuestCompleted(200119))
	{
		IndexQuestID = 200120; // 던컨의 조언

	}

	//던컨의 조언 - 흰늑대 20마리
	if (IndexQuestID == 200120 && me.IsQuestCompleted(200120))
	{
		IndexQuestID = 200121; // 흰늑대 20마리

	}

	//흰늑대 20마리 - 갈색다이어울프 20마리
	if (IndexQuestID == 200121 && me.IsQuestCompleted(200121))
	{
		IndexQuestID = 200122; // 갈색다이어울프 20마리
	}

	//갈색다이어울프 20마리 - 트레보 키아 초급던전
	if (IndexQuestID == 200122 && me.IsQuestCompleted(200122))
	{
		IndexQuestID = 200123; // 트레보 키아 초급던전

	}

	//트레보 키아 초급던전 - 물 뜨기
	if (IndexQuestID == 200123 && me.IsQuestCompleted(200123))
	{
		IndexQuestID = 200124; // 물 뜨기
	}

	//물 뜨기 - 던바튼 방문
	if (IndexQuestID == 200124 && me.IsQuestCompleted(200124))
	{
		IndexQuestID = 200125; // 던바튼 방문
	}

	//던바튼 방문 - 감자 캐기
	if (IndexQuestID == 200125 && me.IsQuestCompleted(200125))
	{
		IndexQuestID = 200126; // 감자 캐기
	}

	//감자 캐기 - 스튜어트 비밀상점
	if (IndexQuestID == 200126 && me.IsQuestCompleted(200126))
	{
		IndexQuestID = 200127; // 스튜어트 비밀상점
	}

	//스튜어트 비밀상점 - 반호르 방문
	if (IndexQuestID == 200127 && me.IsQuestCompleted(200127))
	{
		IndexQuestID = 200128; // 반호르 방문
	}

	// 일본 초보자 이벤트 - uhihiho 2006/10/18
	if (IndexQuestID == 201001 && me.IsQuestCompleted(201001))
	{
		if (me.IsSelectableTitle(10052))		// 이벤트 퀘스트 깨면 초보자 타이틀을 known 상태로 (비활성화)
			{
				me.DeactivateTitle(10052);
				me.ShowCaption(["event.pc_event.10"]);
			}
	}

	//반호르 방문 : 게임 퀘스트 모두 완수했음
	if (IndexQuestID == 200128 && me.IsQuestCompleted(200128))
	{
		IndexQuestID = 0; // 더 이상 수행할 퀘스트 없음
	}


	if(IndexQuestID == _iQuestID)
	{
		return 0;
	}

	return IndexQuestID;
// G3S4 end
}