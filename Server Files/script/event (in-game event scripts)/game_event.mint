//////////////////////////////////////////////////////////////////////////////////
//
//                                  Mabinogi Project Game Event Script
//
//	: pc_event.mint 에서 이벤트에 관련된 처리는 이곳으로 뺀다.
//
//////////////////////////////////////////////////////////////////////////////////




// : PC가 월드에 접속하려고 할 때 불리는 함수이다.
// : 이벤트기간에 로그인하면 어쩌고~ 이런 처리는 모두 여기서 한다.


//////////////////////////////////////////////////////////////////////////////////
server void BeforeEnter(
	character me	)
//////////////////////////////////////////////////////////////////////////////////
{
	// 대만 퍼즐 이벤트가 아닌 경우
	if (!IsCurrentEvent(`puzzle2008_taiwan`))
	{
		me.RemoveKeyword(`switch flag`);
		me.RemoveKeyword(`switch_counter_0`);
		me.RemoveKeyword(`switch_counter_1`);
		me.RemoveKeyword(`switch_counter_2`);
		me.RemoveKeyword(`switch_counter_3`);
		me.RemoveItemCls(65041);
		me.RemoveItemCls(65042);
		me.RemoveItemCls(65043);
		me.RemoveItemCls(65044);
	}
	else if ((me.GetItemNoWithClassId(65041) + me.GetItemNoWithClassId(65042) + me.GetItemNoWithClassId(65043) + me.GetItemNoWithClassId(65044)) > 1)
	{
		me.RemoveItemCls(65041);
		me.RemoveItemCls(65042);
		me.RemoveItemCls(65043);
		me.RemoveItemCls(65044);
	}
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))
	{
		if (me.IsQuestCompleted(221004))
		{
			me.RemoveKeyword(`g2_05`);
			me.RemoveKeyword(`g2_06`);
			me.RemoveKeyword(`g2_07`);
			me.RemoveKeyword(`g2_08`);
		}
	}
	if((!IsCurrentEvent(`race`)) && (GetLocale().LowerCase() == `usa`))
	{
		me.RemoveKeyword(`evt_20050505_run_entry`);
	}
	if (me.IsEnableDeed(3) && !me.IsFemale() && (IsValentine() extern (`data/script/korea/npc/valentine2005.mint`)) && !me.HaveKeyword(`valentine2008_nao_choco`))	// 이 키워드도 매해 바꿔줘야 하는 슬픈 운명의 키워드
	{
		//발렌타인 데이이고, 나오에게 초코를 안받았다면 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	else if (me.IsEnableDeed(4) && !me.IsFemale() && me.HaveKeyword (`whiteday_promise_nao`) && (IsWhiteday() extern (`data/script/korea/npc/whiteday2005.mint`)))
	{
		DebugOut(`오늘은 화이트데이 선물받으러가자`);
		//화이트 데이이고, 나오에게 사탕을 안줬다면 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	else if(
		(GetYear() == 2006 && (GetDate()>=0505 && GetDate()<=0507))
		&& (GetLocale().LowerCase() == `korea`.LowerCase())
		&& (me.GetAge() <= 13)
		&& (!me.HaveKeyword(`childrensday2006_kittyhand`) || !me.HaveKeyword(`childrensday2006_kittyfoot`))
	)
	{
		// 06년 한국에서 5월 5일~7일까지
		// 13살 이하면 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	else if(
		(GetYear() == 2006 && (GetDate()>=0601 && GetDate()<=0604))
		&& (GetLocale().LowerCase() == `china`.LowerCase())
		&& (me.GetAge() <= 13)
		&& (!me.HaveKeyword(`childrensday2006_kittyhand`) || !me.HaveKeyword(`childrensday2006_kittyfoot`))
	)
	{
		// 06년 중국에서 6월 1일~4일까지
		// 13살 이하면 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	/* 2006년이 아니면 아래처럼 주게 하는 바람에 2007년에도 줄 뻔. 주석처리 - uhihiho
	else if (
		(GetDate()==0505 && GetYear() != 2006)
		&& (GetLocale().LowerCase() ==`korea`.LowerCase())
		&& (me.GetAge()<=13)
		&& (me.IsEnableDeed(7) || me.IsEnableDeed(10))
	)
	{
		// 06년에만 위 적용, 그 이외의 해에는 이걸로 적용
		// 어린이날이고 13살 이하면 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	*/
	/*
	else if (GetDate()==0505	// 한국의 2006년 어린이날이 아닌, 일본의 2006년 어린이날이거나 다른 해의 어린이날이면
		&& (GetLocale()==`Korea` ||GetLocale()==`Japan`)
		&& (me.GetAge()<=13)
		&& (me.IsEnableDeed(7) || me.IsEnableDeed(10))
		)
	{
		//어린이날이고 13살 이하면 나오존으로 간다.
			me.EnterEventRegion(1000, 0, 0);
	}
	*/
	/*else if (
		GetLocale()==`Korea`
		&&  (GetDate() == 1224 || GetDate() == 1225)
		&&
		(
			!me.HaveKeyword(`xmas_present_2005_1_hidden`)	// 크리스마스 케익 못받았을 때
			|| (!me.HaveKeyword(`xmas_present_2005_2_hidden`) && me.IsPayPlayer())	// 유료 사용자이고 산타 모자를 못받았을 때
		)
	)
	*/
	//2006 해외 크리스마스 이벤트
	else if (
			GetYear()==2006
			&&
			(
				(GetLocale().LowerCase()==`japan` && GetDate() >= 1222 &&  GetDate() <= 1226)
				||(GetLocale().LowerCase()==`taiwan` && GetDate() >= 1221 &&  GetDate() <= 1226)
				||(GetLocale().LowerCase()==`china` && GetDate() >= 1222 &&  GetDate() <= 1225)
			)
			&&
			(
				!me.HaveKeyword(`foreign_xmas_present_2006_1`)	// 크리스마스 케익 못받았을 때
				|| (!me.HaveKeyword(`foreign_xmas_present_2006_2`) && me.IsPayPlayer())	// 유료 사용자이고 산타 모자를 못받았을 때
			)
	)
	{
		// 크리스마스 이벤트 기간중이면 모두 나오존으로 보낸다.
		me.EnterEventRegion(1000, 0, 0);
	}
	// 2007 대만 2주년 이벤트
	else if (!me.HaveKeyword(`treasure_hunting_taiwan_2007_06`) && IsCurrentEvent(`treasurehuntingtaiwan`))
	{
		// 신기한 보물상자 열쇠 10개를 받기 위해 나오존으로 간다.
		me.EnterEventRegion(1000, 0, 0);
	}
	else if(IsCurrentEvent(`april_fools_event_2008`) && !me.IsPet() && me.IsEnableDeed(20))
	{
		me.EnterEventRegion(1000, 0, 0, `_nao_ferghus`);
		me.DoneDeed(20);
	}
	// 2008년 5월 봄의 향기 이벤트 추가
	else if(IsCurrentEvent(`scentofspring2008_korea`) && !me.IsPet() && !me.HaveKeyword(`get_flowerpot`)  && me.GetItemNoWithClassId (13058) ==0)

	{
		me.EnterEventRegion(1000, 0, 0);
	}

	// 2008년 5월 봄의 향기 개근상 보상 추가
	else if((me.HaveKeyword(`get_flowerpot`)) && (me.HaveKeyword(`collected_all_stamps`)) && (!me.HaveKeyword(`scentofspring2008_korea`)) && me.GetItemNoWithClassId (13058)>0)
	{
		me.EnterEventRegion(1000, 0, 0);
	}

	// 2009년 한국 5주년 마비노기 여행 마지막 스탬프
	else if((IsCurrentEvent(`5th_anniversary_2009_stamp2_korea`)) && (me.GetItemList(1614).GetSize() > 0) && (me.Get5thAnniversaryStampCount2() == 9))
	{
		me.EnterEventRegion(1000, 0, 0);
	}


	// 2009년 여름을 부탁해 이벤트 추가 -> 2010년 부엉이를 부탁해로 수정
	else if(IsCurrentEvent(`takecareofmyowl2009_korea`) && !me.IsPet() && !me.HaveKeyword(`get_owl_2010`)  && me.GetItemNoWithClassId (1615) ==0)

	{
		me.EnterEventRegion(1000, 0, 0);
	}

	// 2009년 여름을 부탁해 이벤트 추가
	else if(IsCurrentEvent(`takecareofbabytiger_2010_Taiwan`) && !me.IsPet() && !me.HaveKeyword(`get_babytiger`)  && me.GetItemNoWithClassId (1617) ==0)

	{
		me.EnterEventRegion(1000, 0, 0);
	}
	// 2010년 월드컵 이벤트
	else if(IsCurrentEvent(`worldcup_event_2010_korea`) && !me.IsPet() && !me.HaveKeyword(`worldcup_event_2010_korea`))
	{
		me.EnterEventRegion(1000, 0, 0, `_nao_worldcup`);
	}

	// 여기까지
	else
	{
		// 일반적인 로그인
		me.EnterWorld();
	}
}





// : PC가 월드에 로그인 할 때마다 불리는 함수이다.
// : 이 함수는 클라이언트 사이드에서도 완전히 로그인이 되었을 때 불린다.

//////////////////////////////////////////////////////////////////////////////////
server void OnLoginEvent(
	character me	)
//////////////////////////////////////////////////////////////////////////////////
{
	// 2010 미국 자선 단체 제휴 이벤트
	if(IsCurrentEvent(`Starlignt_2010_usa`))
	{
		me.OpenEventPopupView(`Starlignt_2010_usa`);
	}

	// 2010 할로윈 유령 이벤트
	if (IsCurrentEvent(`halloween_ghostquiz_2010_korea`))
	{
		if(me.IsEnableDeed(57))	//
		{
			if (me.RemoveQuestTemplate(30112) > 0) //퀘스트 강제 종료
			{
				// 성공
			}
			me.CleanQuestHistory(201156);
			me.RemoveKeyword(`Helloween_Event_2010_gift`);
			me.RemoveKeyword(`Helloween_Event_2010_lotte`);
			me.RemoveKeyword(`Helloween_Event_2010_nove`);
			me.RemoveKeyword(`Helloween_Event_2010_dodo`);
			me.RemoveKeyword(`Helloween_Event_2010_jere`);
			me.AddGameQuest(201156, 0);
			me.DoneDeed(57);
		}
	}
	// 2010 광복절 이벤트
	if (IsCurrentEvent(`liberationday2010_2_korea`))
	{
		// 모든 처리를 코드에서 한다.
		// 52143 - 메타 저장용 아이템 사용
		if(GetLocale().LowerCase()==`korea`)
		{
			me.LiberationDay2010();
		}
		else if(GetLocale().LowerCase()==`usa` && GetYear() == 2010)
		{
			me.LiberationDay2010_USA(2010,8,15);
		}
	}
	// 2010 모리안 서버 이벤트
	if(IsCurrentEvent(`morrighanserver2010_korea`))
	{
		// 52142 - 메타를 저장 할 아이템 클래스 아이디
		if (me.CanReceiveDailyEventBonus(`morrighanserver2010_korea`, 52142))
		{
			me.OpenGameView(`morrighanserver2010_korea`);
		}
	}
	// 2010 동물 던전 이벤트
	if(IsCurrentEvent(`pet_dungeon_event_china`))
	{
		me.AddGameQuest(201155, 0);
	}

	//2010 화이트데이 이벤트
	if(IsCurrentEvent(`whiteday_2010_korea`))
	{
		me.AddGameQuest(201150, 0);
	}
	//2010 대만 단오절 쫑즈 이벤트
	if(IsCurrentEvent(`Danofestival2010_taiwan`))
	{
		me.AddGameQuest(201153, 0);
	}
	//2010 일본 빙수 이벤트
	if(IsCurrentEvent(`MakeSnowice2010`))
	{
		me.AddGameQuest(201154, 0);
	}
	//2009 영웅전 이벤트 (20091219 하루)
	if(GetLocale().LowerCase()==`korea`)
	{
		if (GetYear() == 2009 && GetDate() == 1219)
		{
			int logoutDayCount = me.GetAccountPlayOutDayCount();
			int loginDayCount = me.GetAccountPlayInDayCount();

			if (logoutDayCount != loginDayCount)
			{
				me.ShowInGamePopupView(`heroes2009_korea`);
			}
		}
	}
	//2010 중국 로그인 이벤트 (2010 1119-1121)
	if(GetLocale().LowerCase()==`china`)
	{
		if (GetYear() == 2010 && GetDate() >= 1119 &&  GetDate() <= 1121)
		{
			if(me.IsEnableDeed(57))	//
			{
				int iRandom = Random(100);
					// 로그인 선물 주기
				if (iRandom<20)
				{
					me.DoStript(`additemex(id:18131  rewardview:true)`);	// 양모자
				}
				else if (iRandom<46)
				{
					me.DoStript(`additemex(id:85054  rewardview:true)`);	// 새도우 크리스탈
				}
				else if (iRandom<72)
				{
					me.DoStript(`additemex(id:85055  rewardview:true)`);	// 새도우 크리스탈
				}
				else
				{
					me.DoStript(`additemex(id:85056  rewardview:true)`);	// 새도우 크리스탈
				}
			me.DoneDeed(57);
			}
		}
	}

	//2009 스키점프 이벤트
	if(IsCurrentEvent(`skijump_event_2009`))
	{
		if((GetYear() == 2010))
		{
			me.AddGameQuest(201158, 0); //스키점프 퀘스트 지급
		}
		else
		{
			me.AddGameQuest(201131, 0); //스키점프 퀘스트 지급
		}

		// 한국이나 일본이면 가이드용 날개 공급
		if(
			(GetLocale().LowerCase()==`korea` || GetLocale().LowerCase()==`japan`)
			&& !me.HaveKeyword(`skijump_event_wing`))
		{
			me.AddKeyword(`skijump_event_wing`);

			// 워프 장소 설정.  r:3200 x:237424 y:223166   반경 : 7m
			me.DoStript(`additemex(id:63226 event_warp:skijump_event_2009 warp_region:3200 warp_x:237424 warp_y:223166 warp_radius:700 rewardview:true)`);

		}

	}
	if (IsCurrentEvent(`newyear_nekojima_japan`)) // 일본 정월 이벤트 퀘스트
	{
		if (me.IsHuman())
		{
			me.AddGameQuest(201132,0);
		}
		else if(me.IsElf())
		{
			me.AddGameQuest(201133,0);
		}
		else if(me.IsGiant())
		{
			me.AddGameQuest(201134,0);
		}
	}
	//2009 한국 허스키 연계 이벤트
	if(IsCurrentEvent(`husky2009_1_korea`))
	{
		me.AddGameQuest(206019, 0);
	}
	else
	{
		// 퀘스트를 진행 중이 아니면 필요없어진 키워드를 제거한다.
		if(me.IsQuestTried(206019) && !me.HaveQuestTemplate(206019))
		{
			me.RemoveKeyword(`husky2009_1_korea`);
			me.RemoveKeyword(`husky2009_2_korea`);
		}
	}

	//2009 해외  할로윈 이벤트
	if(IsCurrentEvent(`halloween2009_overseas`))
	{
		me.AddGameQuest(201128, 0);
	}
	if(IsCurrentEvent(`valentine_2010_overseas`))
	{
		if(me.IsFemale())	// 여자이면 퀘스트 준다
		{
			// 한국은 이벤트 기간이 2월 10일 ~ 2월 14일이다. (퀘스트 번호도 다름)
			if(GetLocale().LowerCase()==`korea`)
			{
				if ((GetDate() >=0210 && GetDate() <=0214) && (!me.IsQuestCompleted(201142) && !me.HaveQuestTemplate(201142)))
				{
					me.AddGameQuest(201142, 0);
				}
				if ((GetDate() >=0211 && GetDate() <=0214) && (!me.IsQuestCompleted(201143) && !me.HaveQuestTemplate(201143)))
				{
					me.AddGameQuest(201143, 0);
				}
				if ((GetDate() >=0212 && GetDate() <=0214) && (!me.IsQuestCompleted(201144) && !me.HaveQuestTemplate(201144)))
				{
					me.AddGameQuest(201144, 0);
				}
				if ((GetDate() >=0213 && GetDate() <=0214) && (!me.IsQuestCompleted(201145) && !me.HaveQuestTemplate(201145)))
				{
					me.AddGameQuest(201145, 0);
				}
				if ((GetDate() == 0214) && (!me.IsQuestCompleted(201146) && !me.HaveQuestTemplate(201146)))
				{
					me.AddGameQuest(201146, 0);
				}
				if ((GetDate() == 0214) && (!me.IsQuestCompleted(201147) && !me.HaveQuestTemplate(201147)))
				{
					me.AddGameQuest(201147, 0);
				}
			}
			else
			{
				if ((GetDate() >=0209 && GetDate() <=0214) && (!me.IsQuestCompleted(201136) && !me.HaveQuestTemplate(201136)))
				{
					me.AddGameQuest(201136, 0);
				}
				if ((GetDate() >=0210 && GetDate() <=0214) && (!me.IsQuestCompleted(201137) && !me.HaveQuestTemplate(201137)))
				{
					me.AddGameQuest(201137, 0);
				}
				if ((GetDate() >=0211 && GetDate() <=0214) && (!me.IsQuestCompleted(201138) && !me.HaveQuestTemplate(201138)))
				{
					me.AddGameQuest(201138, 0);
				}
				if ((GetDate() >=0212 && GetDate() <=0214) && (!me.IsQuestCompleted(201139) && !me.HaveQuestTemplate(201139)))
				{
					me.AddGameQuest(201139, 0);
				}
				if ((GetDate() >=0213 && GetDate() <=0214) && (!me.IsQuestCompleted(201140) && !me.HaveQuestTemplate(201140)))
				{
					me.AddGameQuest(201140, 0);
				}
				if ((GetDate() == 0214) && (!me.IsQuestCompleted(201141) && !me.HaveQuestTemplate(201141)))
				{
					me.AddGameQuest(201141, 0);
				}
			}
		}
	}

	//2009 한국 5주년 마비노기 여행 이벤트
	if(IsCurrentEvent(`5th_anniversary_2009_stamp1_korea`))
	{
		if(!me.IsQuestCompleted(206017) && !me.HaveQuestTemplate(206017)) // 스탬프 북 받는 퀘스트 안 헸으면 퀘스트를 준다.
		{
			me.AddGameQuest(206017, 0);
		}

		if(me.IsEnableDeed(24))	// 5주년 코인 안 받았으면 지급한다.
		{
			me.DoStript(`additemex(id:52106 rewardview:true)`);
			me.DoneDeed(24);
		}

	}

	if(IsCurrentEvent(`5th_anniversary_2009_stamp2_korea`))
	{
		if(!me.IsQuestCompleted(206018) && !me.HaveQuestTemplate(206018)) // 스탬프 북 받는 퀘스트 안 헸으면 퀘스트를 준다.
		{
			me.AddGameQuest(206018, 0);
		}

		if(me.IsEnableDeed(24))	// 5주년 코인 안 받았으면 지급한다.
		{
			me.DoStript(`additemex(id:52106 rewardview:true)`);
			me.DoneDeed(24);
		}
	}
	if (IsCurrentEvent(`takecareofbabytiger_2010_Taiwan`) && me.HaveKeyword(`get_babytiger`))
	{
		// 한국 2009년 여름방학 2차 이벤트때 스탬프 북을 안받았으면 받는다.
		if (me.IsEnableDeed(26))
		{
			if (me.GetItemNoWithClassId(1617) == 0)
			{
				me.DoStript(`additemex(id:1617 rewardview:true)`);
			}
			me.DoneDeed(26);
		}
	}
	if (IsCurrentEvent(`takecareofmyowl2009_korea`) && me.HaveKeyword(`get_owl_2010`))
	{
		// 한국 2009년 여름방학 2차 이벤트때 스탬프 북을 안받았으면 받는다.
		if (me.IsEnableDeed(26))
		{
			if (me.GetItemNoWithClassId(1615) == 0)
			{
				me.DoStript(`additemex(id:1615 rewardview:true)`);
			}
			me.DoneDeed(26);
		}
	}

	// 5한국에서 5주년 코인 주는 것 7월 13일까지 연장
	if(GetLocale().LowerCase()==`korea` && me.IsEnableDeed(24))
	{
		dword day,hour,min;
		GetTime(day, hour, min);
		if (GetYear() == 2009 && GetDate() >= 0706 && ((GetDate() <= 0712) || (GetDate() == 0713 && hour<12)))
		{
			me.DoStript(`additemex(id:52106 rewardview:true)`);
			me.DoneDeed(24);
		}
	}

	//2009 한국 물풍선 이벤트
	if(IsCurrentEvent(`waterballoonbattle_2009_korea`))
	{
		if(!me.IsQuestCompleted(206016) && !me.HaveQuestTemplate(206016))
		{
			me.AddGameQuest(206016, 0);
		}
	}
	//2009년 해외 좀비 이벤트
	if (IsCurrentEvent(`zombie_2009`))
	{
		me.AddGameQuest(201127, 0);
	}

	//2009년 대만 던전 이벤트 퀘스트 주기
	if (IsCurrentEvent(`dungeonevent2009_taiwan`))
	{
		me.AddGameQuest(201125, 0);
	}
	//2009년 대만 4주년 추억 나무 이벤트 퀘스트 주기
	if (IsCurrentEvent(`4th_anniversary_2009_taiwan`))
	{
		if (!me.HaveKeyword(`Grow_Tree_Taiwan_step_1_2010`) && (me.IsQuestCompleted(201126) || !me.HaveQuestTemplate(201126)))
		{
			me.CleanQuestHistory(201126);
		}
		me.AddGameQuest(201126, 0);
	}

	//2009 한국 어린이날 이벤트 퀘스트 주기
	if(IsCurrentEvent(`childrensday2009_korea`))
	{
		if(!me.IsQuestCompleted(206015) && !me.HaveQuestTemplate(206015))
		{
			me.AddGameQuest(206015, 0);
		}
	}

/////	//2009 해외 신년이벤트 퀘스트 주기
//	if(IsCurrentEvent(`NewYear2009_Foreign`))
//	{
//		if(!me.IsQuestCompleted(206006) && !me.HaveQuestTemplate(206006))
//		{
//			me.AddGameQuest(206006, 1);
//		}
//	}
/////	//2010 해외 신년이벤트 퀘스트 주기
	if(IsCurrentEvent(`NewYear2009_Foreign`))
	{
		if(!me.IsQuestCompleted(206020) && !me.HaveQuestTemplate(206020))
		{
			me.AddGameQuest(206020, 1);
		}
	}
	//2010년 세인트 페트릭 데이 이벤트
	if (IsCurrentEvent(`StPatricksDay_2010_usa`))
	{
		if(!me.IsQuestCompleted(201148) && !me.HaveQuestTemplate(201148))
		{
			me.AddGameQuest(201148, 0);
		}
	}

	//일본 JG 네코지마 퀘스트 주기
	if(GetLocale().LowerCase()==`japan`)
	{
		me.AddGameQuest(601000, 1);
	}

	//2009 해외 화이트 이벤트 퀘스트 주기
	if(IsCurrentEvent(`whiteday2009_overseas`) || IsCurrentEvent(`whiteday2009_korea`))
	{
		DebugOut(`여기1`);
		if(!me.IsQuestCompleted(201124) && !me.HaveQuestTemplate(201124))
		{
			me.AddGameQuest(201124, 1);
			DebugOut(`여기2`);
		}
		DebugOut(`여기3`);
	}
	//2009 해외 발렌타인 이벤트 퀘스트 주기
	if(IsCurrentEvent(`valentine2009_overseas`) || IsCurrentEvent(`valentine2009_korea`))
	{
		if(!me.IsQuestCompleted(201123) && !me.HaveQuestTemplate(201123))
		{
			me.AddGameQuest(201123, 1);
		}
	}

	//2008 해외 크리스마스 이벤트 퀘스트 주기
	if(IsCurrentEvent(`christmas2008_foreign`) || IsCurrentEvent(`christmas2008_korea`))
	{
		// 2010년에는 그 전에도 동일 이벤트로 진행한 유저도 또 받을 수 있도록 이벤트 재등록
		if(!me.IsQuestCompleted(206021) && !me.HaveQuestTemplate(206021) && (GetYear() == 2010))
		{
			// 그 이전에 진행한 키워드가 있을 수 있으니 제거
			me.RemoveKeyword(`christmas2008_foreign_R0`);
			me.RemoveKeyword(`christmas2008_foreign_G0`);
			me.RemoveKeyword(`christmas2008_foreign_P0`);
			me.RemoveKeyword(`christmas2008_foreign_Y0`);
			me.RemoveKeyword(`christmas2008_foreign_B0`);
			me.AddGameQuest(206021, 0);
		}
		else if(!me.IsQuestCompleted(206005) && !me.HaveQuestTemplate(206005) && (GetYear() != 2010))
		{
			me.AddGameQuest(206005, 0);
		}

		if (me.HaveKeyword(`christmas2008_foreign_B1`) || me.HaveKeyword(`christmas2008_foreign_Y1`)|| me.HaveKeyword(`christmas2008_foreign_G1`)|| me.HaveKeyword(`christmas2008_foreign_P1`)|| me.HaveKeyword(`christmas2008_foreign_R1`))
		{
			DebugOut(`산타옷으로 갈아 입힘`);
			me.WearEventFullSuit(true);
		}
	}
	else if (!IsCurrentEvent(`christmas2008_foreign`) && !IsCurrentEvent(`christmas2008_korea`) && (GetYear() >= 2009))		//2009년 이후에는 키워드를 지워버림
	{
		me.RemoveKeyword(`christmas2008_foreign_B0`);
		me.RemoveKeyword(`christmas2008_foreign_Y0`);
		me.RemoveKeyword(`christmas2008_foreign_R0`);
		me.RemoveKeyword(`christmas2008_foreign_G0`);
		me.RemoveKeyword(`christmas2008_foreign_P0`);
		me.RemoveKeyword(`christmas2008_foreign_P1`);
		me.RemoveKeyword(`christmas2008_foreign_B1`);
		me.RemoveKeyword(`christmas2008_foreign_Y1`);
		me.RemoveKeyword(`christmas2008_foreign_R1`);
		me.RemoveKeyword(`christmas2008_foreign_G1`);
		me.RemoveKeyword(`christmas2008_foreign_G2`);

	}
	// 할로윈 이벤트
	if(IsCurrentEvent(`halloween`))	 // 이벤트 중일 때
	{
		if (!me.HaveKeyword(`TrickOrTreat`))
		{
			me.AddKeyword(`TrickOrTreat`);
		}
	}
	else if(IsCurrentEvent(`Halloween_ghost2007_korea`))
	{
		if (!me.HaveKeyword(`TrickOrTreat`))
		{
			me.AddKeyword(`TrickOrTreat`);
		}
		if(!me.IsQuestCompleted(201101) && !me.HaveQuestTemplate(201101))
		{
			me.AddGameQuest(201101, 1);	// 20초 뒤 2007 할로윈 퀘스트 주기
		}
	}
	else if (IsCurrentEvent(`halloween_talk`))
	{
		if (!me.HaveKeyword(`TrickOrTreat`))
		{
			me.AddKeyword(`TrickOrTreat`);
		}
	}

	else	// 이벤트중이 아닐 때
	{

		if(me.HaveKeyword(`TrickOrTreat`))
		{
			me.RemoveKeyword(`halloween_trefor`);
			me.RemoveKeyword(`halloween_piaras`);
			me.RemoveKeyword(`halloween_nora`);
			me.RemoveKeyword(`halloween_malcolm`);
			me.RemoveKeyword(`halloween_lassar`);
			me.RemoveKeyword(`halloween_ferghus`);
			me.RemoveKeyword(`halloween_endelyon`);
			me.RemoveKeyword(`halloween_duncan`);
			me.RemoveKeyword(`halloween_dilys`);
			me.RemoveKeyword(`halloween_bebhinn`);
			me.RemoveKeyword(`halloween_walter`);
			me.RemoveKeyword(`halloween_stewart`);
			me.RemoveKeyword(`halloween_simon`);
			me.RemoveKeyword(`halloween_nerys`);
			me.RemoveKeyword(`halloween_kristell`);
			me.RemoveKeyword(`halloween_glenis`);
			me.RemoveKeyword(`halloween_aeira`);
			me.RemoveKeyword(`halloween_bryce`);
			me.RemoveKeyword(`halloween_edern`);
			me.RemoveKeyword(`halloween_jenifer`);
			me.RemoveKeyword(`halloween_ailionoa`);
			me.RemoveKeyword(`halloween_jocelin`);
			me.RemoveKeyword(`halloween_agnes`);
			me.RemoveKeyword(`halloween_osla`);
			me.RemoveKeyword(`halloween_delen`);
			me.RemoveKeyword(`halloween_del`);
			me.RemoveKeyword(`halloween_galvin`);
			me.RemoveKeyword(`halloween_james`);
			me.RemoveKeyword(`halloween_nele`);
			me.RemoveKeyword(`halloween_lucas`);
			me.RemoveKeyword(`halloween_ffion`);
			me.RemoveKeyword(`halloween_alexina`);
			me.RemoveKeyword(`halloween_effie`);
			me.RemoveKeyword(`halloween_heulfryn`);
			me.RemoveKeyword(`halloween_myrddin`);
			me.RemoveKeyword(`halloween_rua`);
			me.RemoveKeyword(`halloween_price`);
			me.RemoveKeyword(`halloween_elain`);
			me.RemoveKeyword(`halloween_erhard`);
			me.RemoveKeyword(`halloween_tin`);
			me.RemoveKeyword(`halloween_seanan`);
			me.RemoveKeyword(`halloween_seumas`);
			me.RemoveKeyword(`halloween_kawsay`);
			me.RemoveKeyword(`halloween_kusina`);
			me.RemoveKeyword(`halloween_ruway`);
			me.RemoveKeyword(`halloween_voight`);
			me.RemoveKeyword(`halloween_wovoka`);
			me.RemoveKeyword(`halloween_tupay`);
			me.RemoveKeyword(`halloween_meriel`);

			me.RemoveKeyword(`TrickOrTreat`);
		}
	}
	if(me.HaveKeyword(`valentine2005`))
	{
		me.RemoveKeyword(`valentine2005`);
		me.RemoveKeyword(`valentine2005_50301`);
		me.RemoveKeyword(`valentine2005_50302`);
		me.RemoveKeyword(`valentine2005_50303`);
		me.RemoveKeyword(`valentine2005_50304`);
		me.RemoveKeyword(`valentine2005_50305`);
		me.RemoveKeyword(`valentine2005_50306`);
		me.RemoveKeyword(`valentine2005_50307`);
		me.RemoveKeyword(`valentine2005_50308`);
		me.RemoveKeyword(`valentine2005_50309`);
		me.RemoveKeyword(`valentine2005_50310`);
		me.RemoveKeyword(`valentine2005_50311`);
		me.RemoveKeyword(`valentine2005_50312`);
		me.RemoveKeyword(`valentine2005_50313`);
		me.RemoveKeyword(`valentine2005_50314`);
		me.RemoveKeyword(`valentine2005_50315`);
		me.RemoveKeyword(`valentine2005_50316`);
		me.RemoveKeyword(`valentine2005_50317`);
		me.RemoveKeyword(`valentine2005_50318`);
		me.RemoveKeyword(`valentine2005_50319`);
		me.RemoveKeyword(`valentine2005_50320`);
		me.RemoveKeyword(`valentine2005_50321`);
		me.RemoveKeyword(`valentine2005_50322`);
		me.RemoveKeyword(`valentine2005_50323`);
		me.RemoveKeyword(`valentine2005_50357`);
	}
	if(me.HaveKeyword(`whiteday2005`))
	{
		{
			me.RemoveKeyword(`whiteday2005`);
			me.RemoveKeyword(`whiteday2005_to_rua`);
			me.RemoveKeyword(`whiteday2005_from_rua`);
			me.RemoveKeyword(`whiteday2005_50327`);
			me.RemoveKeyword(`whiteday2005_50328`);
			me.RemoveKeyword(`whiteday2005_50329`);
			me.RemoveKeyword(`whiteday2005_50330`);
			me.RemoveKeyword(`whiteday2005_50331`);
			me.RemoveKeyword(`whiteday2005_50332`);
			me.RemoveKeyword(`whiteday2005_50333`);
			me.RemoveKeyword(`whiteday2005_50334`);
			me.RemoveKeyword(`whiteday2005_50335`);
			me.RemoveKeyword(`whiteday2005_50336`);
			me.RemoveKeyword(`whiteday2005_50337`);
			me.RemoveKeyword(`whiteday2005_50338`);
			me.RemoveKeyword(`whiteday2005_50339`);
			me.RemoveKeyword(`whiteday2005_50340`);
			me.RemoveKeyword(`whiteday2005_50341`);
			me.RemoveKeyword(`whiteday2005_50342`);
			me.RemoveKeyword(`whiteday2005_50343`);
			me.RemoveKeyword(`whiteday2005_50344`);
			me.RemoveKeyword(`whiteday2005_50345`);
			me.RemoveKeyword(`whiteday2005_50346`);
			me.RemoveKeyword(`whiteday2005_50347`);
			me.RemoveKeyword(`whiteday2005_50348`);
			me.RemoveKeyword(`whiteday2005_50349`);
			me.RemoveKeyword(`whiteday2005_50350`);
			me.RemoveKeyword(`whiteday2005_50351`);
			me.RemoveKeyword(`whiteday2005_50352`);
			me.RemoveKeyword(`whiteday2005_50353`);
			me.RemoveKeyword(`whiteday2005_50354`);
			me.RemoveKeyword(`whiteday2005_seumas`);
			me.RemoveKeyword(`whiteday2005_bryce`);
			me.RemoveKeyword(`whiteday2005_sion`);
			me.RemoveKeyword(`whiteday2005_walter`);
			me.RemoveKeyword(`whiteday2005_nele`);
			me.RemoveKeyword(`whiteday2005_emainguard_talkable`);
			me.RemoveKeyword(`whiteday2005_goro`);
			me.RemoveKeyword(`whiteday2005_trefor`);
			me.RemoveKeyword(`whiteday2005_devcat`);
			me.RemoveKeyword(`whiteday2005_price`);
			me.RemoveKeyword(`whiteday2005_tarlach`);
			me.RemoveKeyword(`whiteday2005_tin`);
		}
	}
		//2006 한국 발렌타인 데이 이벤트 키워드 삭제
	if(me.HaveKeyword(`valentine2006`))
	{
		me.RemoveKeyword(`valentine2006`);
		me.RemoveKeyword(`valentine2006_50301`);
		me.RemoveKeyword(`valentine2006_50302`);
		me.RemoveKeyword(`valentine2006_50303`);
		me.RemoveKeyword(`valentine2006_50304`);
		me.RemoveKeyword(`valentine2006_50305`);
		me.RemoveKeyword(`valentine2006_50306`);
		me.RemoveKeyword(`valentine2006_50307`);
		me.RemoveKeyword(`valentine2006_50308`);
		me.RemoveKeyword(`valentine2006_50309`);
		me.RemoveKeyword(`valentine2006_50310`);
		me.RemoveKeyword(`valentine2006_50311`);
		me.RemoveKeyword(`valentine2006_50312`);
		me.RemoveKeyword(`valentine2006_50313`);
		me.RemoveKeyword(`valentine2006_50314`);
		me.RemoveKeyword(`valentine2006_50315`);
		me.RemoveKeyword(`valentine2006_50316`);
		me.RemoveKeyword(`valentine2006_50317`);
		me.RemoveKeyword(`valentine2006_50318`);
		me.RemoveKeyword(`valentine2006_50319`);
		me.RemoveKeyword(`valentine2006_50320`);
		me.RemoveKeyword(`valentine2006_50321`);
		me.RemoveKeyword(`valentine2006_50322`);
		me.RemoveKeyword(`valentine2006_50323`);
		me.RemoveKeyword(`valentine2006_50357`);
		me.RemoveKeyword(`valentine2006_50358`);
		me.RemoveKeyword(`valentine2006_50359`);
	}
	//2007 발렌타인 데이 이벤트 키워드 삭제
	if(me.HaveKeyword(`valentine2007`) 	&& GetYear()>=2007 && GetDate() > 0217)
	{
		me.RemoveKeyword(`valentine2007`);
		me.RemoveKeyword(`valentine2007_50301`);
		me.RemoveKeyword(`valentine2007_50302`);
		me.RemoveKeyword(`valentine2007_50303`);
		me.RemoveKeyword(`valentine2007_50304`);
		me.RemoveKeyword(`valentine2007_50305`);
		me.RemoveKeyword(`valentine2007_50306`);
		me.RemoveKeyword(`valentine2007_50307`);
		me.RemoveKeyword(`valentine2007_50308`);
		me.RemoveKeyword(`valentine2007_50309`);
		me.RemoveKeyword(`valentine2007_50310`);
		me.RemoveKeyword(`valentine2007_50311`);
		me.RemoveKeyword(`valentine2007_50312`);
		me.RemoveKeyword(`valentine2007_50313`);
		me.RemoveKeyword(`valentine2007_50314`);
		me.RemoveKeyword(`valentine2007_50315`);
		me.RemoveKeyword(`valentine2007_50316`);
		me.RemoveKeyword(`valentine2007_50317`);
		me.RemoveKeyword(`valentine2007_50318`);
		me.RemoveKeyword(`valentine2007_50319`);
		me.RemoveKeyword(`valentine2007_50320`);
		me.RemoveKeyword(`valentine2007_50321`);
		me.RemoveKeyword(`valentine2007_50322`);
		me.RemoveKeyword(`valentine2007_50323`);
		me.RemoveKeyword(`valentine2007_50357`);
		me.RemoveKeyword(`valentine2007_50358`);
		me.RemoveKeyword(`valentine2007_50359`);
		me.RemoveKeyword(`valentine2007_50369`);
		me.RemoveKeyword(`valentine2007_50370`);
		me.RemoveKeyword(`valentine2007_50371`);
		me.RemoveKeyword(`valentine2007_50372`);
		me.RemoveKeyword(`valentine2007_50373`);
		me.RemoveKeyword(`valentine2007_50374`);
		me.RemoveKeyword(`valentine2007_50375`);
		me.RemoveKeyword(`valentine2007_nao_choco`);
	}

	if(me.HaveKeyword(`whiteday2006_start`))
	{
		if(
			(GetLocale().LowerCase()!=`korea` && GetYear()>=2007 && GetDate() > 0315)
			||
			(GetLocale().LowerCase()==`korea`  && GetYear()>=2006 && GetDate() > 0315)
		)
		{
			me.RemoveKeyword(`whiteday2006_leslie`);
			me.RemoveKeyword(`whiteday2006_50360`);
			me.RemoveKeyword(`whiteday2006_50361`);
			me.RemoveKeyword(`whiteday2006`);
			me.RemoveKeyword(`whiteday2006_50363`);
			me.RemoveKeyword(`whiteday2006_50364`);
			me.RemoveKeyword(`whiteday2006_pero`);
			me.RemoveKeyword(`whiteday2006_50327`);
			me.RemoveKeyword(`whiteday2006_50328`);
			me.RemoveKeyword(`whiteday2006_50329`);
			me.RemoveKeyword(`whiteday2006_50330`);
			me.RemoveKeyword(`whiteday2006_50331`);
			me.RemoveKeyword(`whiteday2006_50332`);
			me.RemoveKeyword(`whiteday2006_50333`);
			me.RemoveKeyword(`whiteday2006_50334`);
			me.RemoveKeyword(`whiteday2006_50335`);
			me.RemoveKeyword(`whiteday2006_50336`);
			me.RemoveKeyword(`whiteday2006_50337`);
			me.RemoveKeyword(`whiteday2006_50338`);
			me.RemoveKeyword(`whiteday2006_50339`);
			me.RemoveKeyword(`whiteday2006_50340`);
			me.RemoveKeyword(`whiteday2006_50341`);
			me.RemoveKeyword(`whiteday2006_50342`);
			me.RemoveKeyword(`whiteday2006_50343`);
			me.RemoveKeyword(`whiteday2006_50344`);
			me.RemoveKeyword(`whiteday2006_50345`);
			me.RemoveKeyword(`whiteday2006_50346`);
			me.RemoveKeyword(`whiteday2006_50347`);
			me.RemoveKeyword(`whiteday2006_50348`);
			me.RemoveKeyword(`whiteday2006_50349`);
			me.RemoveKeyword(`whiteday2006_50350`);
			me.RemoveKeyword(`whiteday2006_50351`);
			me.RemoveKeyword(`whiteday2006_50352`);
			me.RemoveKeyword(`whiteday2006_50353`);
			me.RemoveKeyword(`whiteday2006_50354`);
			me.RemoveKeyword(`whiteday2006_seumas`);
			me.RemoveKeyword(`whiteday2006_bryce`);
			me.RemoveKeyword(`whiteday2006_sion`);
			me.RemoveKeyword(`whiteday2006_walter`);
			me.RemoveKeyword(`whiteday2006_nele`);
			me.RemoveKeyword(`whiteday2006_emainguard_talkable`);
			me.RemoveKeyword(`whiteday2006_goro`);
			me.RemoveKeyword(`whiteday2006_trefor`);
			me.RemoveKeyword(`whiteday2006_devcat`);
			me.RemoveKeyword(`whiteday2006_price`);
			me.RemoveKeyword(`whiteday2006_tarlach`);
			me.RemoveKeyword(`whiteday2006_tin`);
			me.RemoveKeyword(`whiteday2006_from_rua`);
		}
	}

	//2008 발렌타인 데이 이벤트 키워드 삭제
	if(me.HaveKeyword(`valentine2008`) 	&& GetYear()>=2008 && GetDate() > 0217)
	{
		me.RemoveKeyword(`valentine2008`);
		me.RemoveKeyword(`valentine2008_50301`);
		me.RemoveKeyword(`valentine2008_50302`);
		me.RemoveKeyword(`valentine2008_50303`);
		me.RemoveKeyword(`valentine2008_50304`);
		me.RemoveKeyword(`valentine2008_50305`);
		me.RemoveKeyword(`valentine2008_50306`);
		me.RemoveKeyword(`valentine2008_50307`);
		me.RemoveKeyword(`valentine2008_50308`);
		me.RemoveKeyword(`valentine2008_50309`);
		me.RemoveKeyword(`valentine2008_50310`);
		me.RemoveKeyword(`valentine2008_50311`);
		me.RemoveKeyword(`valentine2008_50312`);
		me.RemoveKeyword(`valentine2008_50313`);
		me.RemoveKeyword(`valentine2008_50314`);
		me.RemoveKeyword(`valentine2008_50315`);
		me.RemoveKeyword(`valentine2008_50316`);
		me.RemoveKeyword(`valentine2008_50317`);
		me.RemoveKeyword(`valentine2008_50318`);
		me.RemoveKeyword(`valentine2008_50319`);
		me.RemoveKeyword(`valentine2008_50320`);
		me.RemoveKeyword(`valentine2008_50321`);
		me.RemoveKeyword(`valentine2008_50322`);
		me.RemoveKeyword(`valentine2008_50323`);
		me.RemoveKeyword(`valentine2008_50357`);
		me.RemoveKeyword(`valentine2008_50358`);
		me.RemoveKeyword(`valentine2008_50359`);
		me.RemoveKeyword(`valentine2008_50369`);
		me.RemoveKeyword(`valentine2008_50370`);
		me.RemoveKeyword(`valentine2008_50371`);
		me.RemoveKeyword(`valentine2008_50372`);
		me.RemoveKeyword(`valentine2008_50373`);
		me.RemoveKeyword(`valentine2008_50374`);
		me.RemoveKeyword(`valentine2008_50375`);
		me.RemoveKeyword(`valentine2008_50383`);
		me.RemoveKeyword(`valentine2008_50384`);
		me.RemoveKeyword(`valentine2008_nao_choco`);
	}

	if(me.HaveKeyword(`whiteday2008_start`))
	{
		if(
			(GetLocale().LowerCase()!=`korea` && GetYear()>=2009 && GetDate() > 0317)
			||
			(GetLocale().LowerCase()==`korea`  && GetYear()>=2008 && GetDate() > 0317)
		)
		{
			me.RemoveKeyword(`whiteday2008_leslie`);
			me.RemoveKeyword(`whiteday2008_50360`);
			me.RemoveKeyword(`whiteday2008_50361`);
			me.RemoveKeyword(`whiteday2008`);
			me.RemoveKeyword(`whiteday2008_50363`);
			me.RemoveKeyword(`whiteday2008_50364`);
			me.RemoveKeyword(`whiteday2008_pero`);
			me.RemoveKeyword(`whiteday2008_50327`);
			me.RemoveKeyword(`whiteday2008_50328`);
			me.RemoveKeyword(`whiteday2008_50329`);
			me.RemoveKeyword(`whiteday2008_50330`);
			me.RemoveKeyword(`whiteday2008_50331`);
			me.RemoveKeyword(`whiteday2008_50332`);
			me.RemoveKeyword(`whiteday2008_50333`);
			me.RemoveKeyword(`whiteday2008_50334`);
			me.RemoveKeyword(`whiteday2008_50335`);
			me.RemoveKeyword(`whiteday2008_50336`);
			me.RemoveKeyword(`whiteday2008_50337`);
			me.RemoveKeyword(`whiteday2008_50338`);
			me.RemoveKeyword(`whiteday2008_50339`);
			me.RemoveKeyword(`whiteday2008_50340`);
			me.RemoveKeyword(`whiteday2008_50341`);
			me.RemoveKeyword(`whiteday2008_50342`);
			me.RemoveKeyword(`whiteday2008_50343`);
			me.RemoveKeyword(`whiteday2008_50344`);
			me.RemoveKeyword(`whiteday2008_50345`);
			me.RemoveKeyword(`whiteday2008_50346`);
			me.RemoveKeyword(`whiteday2008_50347`);
			me.RemoveKeyword(`whiteday2008_50348`);
			me.RemoveKeyword(`whiteday2008_50349`);
			me.RemoveKeyword(`whiteday2008_50350`);
			me.RemoveKeyword(`whiteday2008_50351`);
			me.RemoveKeyword(`whiteday2008_50352`);
			me.RemoveKeyword(`whiteday2008_50353`);
			me.RemoveKeyword(`whiteday2008_50354`);
			me.RemoveKeyword(`whiteday2008_seumas`);
			me.RemoveKeyword(`whiteday2008_bryce`);
			me.RemoveKeyword(`whiteday2008_sion`);
			me.RemoveKeyword(`whiteday2008_walter`);
			me.RemoveKeyword(`whiteday2008_nele`);
			me.RemoveKeyword(`whiteday2008_emainguard_talkable`);
			me.RemoveKeyword(`whiteday2008_goro`);
			me.RemoveKeyword(`whiteday2008_trefor`);
			me.RemoveKeyword(`whiteday2008_devcat`);
			me.RemoveKeyword(`whiteday2008_price`);
			me.RemoveKeyword(`whiteday2008_tarlach`);
			me.RemoveKeyword(`whiteday2008_tin`);
			me.RemoveKeyword(`whiteday2008_from_rua`);
			me.RemoveKeyword(`whiteday2008_kawsay`);
			me.RemoveKeyword(`whiteday2008_tupay`);
			me.RemoveKeyword(`whiteday2008_voight`);
			me.RemoveKeyword(`whiteday2008_wovoka`);
			me.RemoveKeyword(`whiteday2008_arneng`);
			me.RemoveKeyword(`whiteday2008_kelpie`);
			me.RemoveKeyword(`whiteday2008_ruway`);

		}
	}
	// 일본 스키 이벤트
	if (IsCurrentEvent(`skiing_event_2008`) && (!me.HaveQuestTemplate(201116)) && (!me.IsQuestTried(201116)) && (GetYear() != 2010))
	{
		me.AddGameQuest(201116,1);
	}
	// 일본 스키 이벤트
	// 2010년에 이벤트 새로 등록
	else if (IsCurrentEvent(`skiing_2010_japan`) && (!me.HaveQuestTemplate(201157)) && (!me.IsQuestTried(201157)))
	{
		me.AddGameQuest(201157,1);
	}
	// 유럽 동물 캐릭터 분야 이벤트 추가
	if (IsCurrentEvent(`pet_event_europe`) && (!me.HaveQuestTemplate(201141)) && (!me.IsQuestTried(201141)))
	{
		me.AddGameQuest(201141,1);
	}

	// 한국 스키 이벤트 2010
	if (IsCurrentEvent(`skiing_2010_korea`) && (!me.HaveQuestTemplate(201135)) && (!me.IsQuestTried(201135)))
	{
		me.AddGameQuest(201135,1);
	}

	// 한국 스키 이벤트 2009
	if (IsCurrentEvent(`skiing_2009_korea`) && (!me.HaveQuestTemplate(201120)) && (!me.IsQuestTried(201120)))
	{
		me.AddGameQuest(201120,1);
	}

	// 대만 G8S1 업데이트 이벤트 - 용의 전설
	if (IsCurrentEvent(`regendofdragon_taiwan`) && (!me.HaveQuestTemplate(201115)) && (!me.IsQuestTried(201115)))
	{
		me.AddGameQuest(201115,1);
	}

	// 해외 2008 발렌타인데이 퀘스트 부여
	if (IsCurrentEvent(`valentine2008_overseas`) && (!me.HaveQuestTemplate(201103)) && (!me.IsQuestTried(201103)))
	{
		me.AddGameQuest(201103,1);
		me.AddKeyword(`Valentine_Step0`);
	}

	// 해외 2008 화이트데이 퀘스트 부여
	if (IsCurrentEvent(`white2008_overseas`) && (!me.HaveQuestTemplate(201106)) && (!me.IsQuestTried(201106)))
	{
		me.AddGameQuest(201106,1);
		me.AddKeyword(`White_Step0`);
	}

	// 대만 2008 신년 이벤트 퀘스트 부여
	if (IsCurrentEvent(`newyear2008_taiwan`) && (!me.HaveQuestTemplate(201109)) && (!me.IsQuestTried(201109)))
	{
		me.AddGameQuest(201109,1);
	}

	// 일본 2008 꽃놀이 이벤트 퀘스트 부여
	if (IsCurrentEvent(`blossom2008_japan`) && (!me.HaveQuestTemplate(201111)) && (!me.IsQuestTried(201111)))
	{
		me.AddGameQuest(201111,1);
	}
	if (!IsCurrentEvent(`blossom2008_japan`) && (me.HaveKeyword(`cherry_blossoms`)))
	{
		me.RemoveKeyword(`cherry_blossoms`);
	}
	//중국 길드전 우승 길드 보상
	if ((IsEnable(`featureChinaGuildWar`) extern (`data/script/features.mint`)) || IsDevelopment())
	{
		if (me.IsRegularGuildMember() && me.IsBattleGroundWinnerGuild(1))
		{
			// 길드전 우승 길드의 길드원은 타이틀을 지급해준다.
			me.AddTitle(11008, GetBattleGroundRemainTimeToNextState(`Senmag_Guild_BattleGround`, `prepare`));
		}
		else
		{
			 //길드전 우승 길드의 길드원이 아니면 뺏자
			me.DeactivateTitle(11008);
		}
	}


	//빼빼로 이벤트 부여
	if(IsCurrentEvent(`pepero2007_korea`))
	{
		if(!me.IsQuestCompleted(201102) && !me.HaveQuestTemplate(201102))
		{
			me.AddGameQuest(201102,1);
		}
	}

	//빼빼로 이벤트 부여
	if(IsCurrentEvent(`pepero2008_korea`))
	{
		if(!me.IsQuestCompleted(201119) && !me.HaveQuestTemplate(201119))
		{
			me.AddGameQuest(201119,1);
		}
	}


	//빼빼로 이벤트 부여 2009년
	if(IsCurrentEvent(`pepero2009_korea`))
	{
		if(!me.IsQuestCompleted(201130) && !me.HaveQuestTemplate(201130))
		{
			me.AddGameQuest(201130,1);
		}
	}


	//빼빼로 중 가상 스킬 부여
	if(IsCurrentEvent(`pepero2007_korea`))
	{
		me.AddSkill(50024,0);
	}

	//빼빼로 중 가상 스킬 부여  2009년 도 포함합니다.
	if(IsCurrentEvent(`pepero2008_korea`) || IsCurrentEvent(`pepero2009_korea`) )
	{
		me.AddSkill(50024,0);
	}


	if(IsCurrentEvent(`newyear2008koreaseesaw`) && GetLocale().LowerCase()==`korea`)
	{
		if(!me.IsQuestCompleted(201110) && !me.HaveQuestTemplate(201110))
		{
			me.AddGameQuest(201110,1);
		}
	}

	//2009년 설 이벤트 가이드 퀘스트 (테섭버전)
	if(IsCurrentEvent(`newyear2009_korea`) && GetLocale().LowerCase()==`korea` && IsTestServer())
	{
		if(!me.IsQuestCompleted(201121) && !me.HaveQuestTemplate(201121))
		{
			me.AddGameQuest(201121,1);
		}
	}

	//2009년 설 이벤트 가이드 퀘스트 (Gm, 본섭버전)
	if(IsCurrentEvent(`newyear2009_korea`) &&  !IsTestServer())
	{
		if(!me.IsQuestCompleted(201122) && !me.HaveQuestTemplate(201122))
		{
			me.AddGameQuest(201122,1);
		}
	}

	//2010년 설 이벤트 가이드 퀘스트
	if(IsCurrentEvent(`newyear2010_korea`))
	{
		if(!me.IsQuestCompleted(201149) && !me.HaveQuestTemplate(201149))
		{
			me.AddGameQuest(201149,1);
		}
	}

	//2010년 개학 이벤트 가이드 퀘스트 - 한국
	if(IsCurrentEvent(`startschool2010_korea`))
	{
		if(!me.IsQuestCompleted(201151) && !me.HaveQuestTemplate(201151) && !me.IsQuestTried(201151))
		{
			me.AddGameQuest(201151,0);
			if(me.GetItemNoWithClassId(73211) == 0) // 화분이 없을 때만 화분을 주기 위함
			{
				me.DoStript(`additemex(id:73211)`);	//델이 준 화분
			}
		}

		int remainDay = GetCurrentEventRemainDay(`startschool2010_korea`);

		me.ShowCaptionEx(["event.game_event.2"], `event`);
	}

	//2010년 요리 이벤트 - 한국
	if(IsCurrentEvent(`cooking2010_korea`))
	{
		if(!me.IsQuestCompleted(201152) && !me.HaveQuestTemplate(201152) && !me.IsQuestTried(201152))
		{
			me.AddGameQuest(201152,0);
		}
	}

	// 2008년 임프의 꿈 이벤트 - 가이드 퀘스트 주기
	if(IsCurrentEvent(`sweetdaydream2008_korea`))
	{
		if(!me.IsQuestCompleted(206004) && !me.HaveQuestTemplate(206004))
		{
			me.AddGameQuest(206004,1);
		}
	}

	// 2009년 임프의 꿈 이벤트 - 가이드 퀘스트 주기
	if(IsCurrentEvent(`sweetdaydream2009_korea`))
	{
		if(!me.IsQuestCompleted(206008) && !me.HaveQuestTemplate(206008))
		{
			me.AddGameQuest(206008,1);
		}
	}

	/*	이벤트 기간 종료되어 주석처리했음 by qwerty, 2005.3.4.

	//2005년 설날 한복 이벤트
	//2005년중에 제거해야함
	if (((GetDate() == 208 && GetHour()>=7) ||
	(GetDate()==209) ||
	(GetDate()==210) ||
	(GetDate() ==211 && GetHour()<6)) ||
	IsDevelopment())
	{
		if (!me.IsQuestTried(200069))
		{
			me.AddGameQuest(200069,0);
		}

		if (!me.IsSelectableTitle(62))
		{
			me.DoStript(`addtitle(62)`);
		}
	}

	*/
	//2006년 추석 한복 이벤트
	/*if(
		GetYear()==2005
		&&
		GetLocale().LowerCase()==`korea`
		&&
		(
			(
				(GetDate()==917 && GetHour()>=7) ||
				(GetDate()==918) ||
				(GetDate()==919 && GetHour()<6)
			)
			|| IsDevelopment()
		)
	)*/
	if(IsCurrentEvent(`harvestsimon_2006`) && GetLocale().LowerCase()==`korea`)
	{
		if (!me.IsQuestTried(200095))
		{
			me.AddGameQuest(200095,0);
		}
	}

	if(IsCurrentEvent(`harvestsimon2007_korea`) && GetLocale().LowerCase()==`korea`)
	{
		if (!me.IsQuestTried(200098))
		{
			me.AddGameQuest(200098,0);
		}
	}

	// 2007 단풍놀이 이벤트

	if (IsCurrentEvent(`maple2007_korea`))
	{
		if (!me.IsQuestTried(201100))
		{
			me.AddGameQuest(201100,0);
		}
	}


	//////////////////////////////////////////////////////////////
	//
	//	한국 마비노기 상용화 1주년 기념 아이템 이벤트 스크립트
	//
	//////////////////////////////////////////////////////////////

	/*
	if(GetLocale().LowerCase()==`korea`)
	{
		if ((GetYear() == 2005 && GetDate() >= 622 && GetDate() < 627) || IsDevelopment())	//2005년 6월 22일~26일 이벤트 기간
		{
			if (me.IsPayPlayer())
			{
				if (!me.HaveKeyword(`mabi_1year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18105)`);	//유료유저 상품 : 1주년 기념 별장식 미니모자
					me.AddKeyword(`mabi_1year_present_pay_user`);
				}
			}

			if (!me.HaveKeyword(`mabi_1year_present`))
			{
				me.DoStript(`additemex(id:51031)`);			//전 유저 상품 : 완전회복 포션
				me.AddKeyword(`mabi_1year_present`);
			}
		}
		else
		{
			if (GetYear() >= 2006)		//2006년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_1year_present`);
				me.RemoveKeyword(`mabi_1year_present_pay_user`);
			}
		}

		if ((GetYear() == 2006 && GetDate() >= 622 && GetDate() < 701 )|| IsDevelopment())	//2005년 6월 22일~30일 이벤트 기간
		{
			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_2year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18131)`);	//유료유저 상품 : 2주년 기념 양 모자
					me.AddKeyword(`mabi_2year_present_pay_user`);
				}
			}

			if (!me.HaveKeyword(`mabi_2year_present`))
			{
				me.DoStript(`additemex(id:63025)`);			//전 유저 상품 : 대용량 축포 포션
				me.AddKeyword(`mabi_2year_present`);
			}
		}
		else
		{
			if (GetYear() >= 2007)		//2006년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_2year_present`);
				me.RemoveKeyword(`mabi_2year_present_pay_user`);
			}
		}

		if ((GetYear() == 2007 && GetDate() == 318)|| IsDevelopment())	//2007년 서비스 1000일 이벤트
		{
			if (me.IsRealPayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_1000day_present_pay_user`))
				{
					me.DoStript(`additemex(id:51047)`);	//유료유저 상품 : 틴 포션
					me.AddKeyword(`mabi_1000day_present_pay_user`);
				}
			}

			if (!me.HaveKeyword(`mabi_1000day_present`))
			{
				me.DoStript(`additemex(id:63025)`);			//전 유저 상품 : 대용량 축포 포션
				me.AddKeyword(`mabi_1000day_present`);
			}
		}
		else
		{
			if (GetYear() >= 2008)		//2008년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_1000day_present`);
				me.RemoveKeyword(`mabi_1000day_present_pay_user`);
			}
		}
	}
	*/

	/*
	일본 일주년 기념 이벤트 관련 작업
	한국에서 진행했던 일주년 기념 이벤트
	마비노기 1주년 기념 미니 모자입니다.
	캐릭터 당 한개씩 지급입니다.
	이벤트 기간 : 4월 27일 ~ 5월 11일
	*/

	if(GetLocale().LowerCase()==`japan`)
	{
		if ((GetYear() == 2006 && GetDate() >= 427 && GetDate() < 512) || IsDevelopment())
		{
			//if (me.IsPayPlayer())
			{
				if (!me.HaveKeyword(`mabi_1year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18105)`);	//유료유저 상품 : 1주년 기념 별장식 미니모자
					me.AddKeyword(`mabi_1year_present_pay_user`);
				}
			}

		}
		else
		{
			if (GetYear() >= 2006)		//2006년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_1year_present_pay_user`);
			}
		}

		// 2007년 서비스 일본 2주년 이벤트
		// 2007년 4월 26일 (패치 이후) ~ 5월 25일 00시 (5월 24일 24시)
		if ((GetYear() == 2007 && GetDate() >= 426 && GetDate() < 525) || IsDevelopment())
		{
			bool bReceiveEventItem = false;

			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_2year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18157)`);	//유료유저 상품 : 고양이 귀 머리띠
					me.AddKeyword(`mabi_2year_present_pay_user`);

					bReceiveEventItem = true;
				}
			}

			if (!me.HaveKeyword(`mabi_2year_present`))
			{
				me.DoStript(`additemex(id:51031)`);			//전 유저 상품 : 대용량 축포 포션
				me.AddKeyword(`mabi_2year_present`);

				bReceiveEventItem = true;
			}

			if (bReceiveEventItem)
			{
				me.ShowCaption(["event.pc_event.11"]);
			}
		}
		else
		{
			if (GetYear() >= 2008)		//2008년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_2year_present`);
				me.RemoveKeyword(`mabi_2year_present_pay_user`);
			}
		}
		// 2008년 서비스 일본 3주년 이벤트
		// 2008년 4월 17일 ~ 5월 29일 00시
		if ((GetYear() == 2008 && GetDate() >= 417 && GetDate() < 530) || IsDevelopment())
		{
			bool bReceiveEventItem = false;

			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_3year_present_pay_user`))
				{
					int presentIndex = Random(2);
					switch(presentIndex)
					{
						case (0)
						{
							me.DoStript(`additemex(id:40245 col1:ff4646 col2:eeeb1b)`);	//유료유저 상품 : 장난감 망치
							me.AddKeyword(`mabi_3year_present_pay_user`);
							bReceiveEventItem = true;
						}
						case (1)
						{
							me.DoStript(`additemex(id:40246 col1:BEA2C9)`);	//유료유저 상품 : 장난감 활
							me.AddKeyword(`mabi_3year_present_pay_user`);
							bReceiveEventItem = true;
						}
					}
				}
			}
			if (!me.HaveKeyword(`mabi_3year_present`))
			{
				me.DoStript(`additemex(id:19044)`);			//전 유저 상품 : 3주년 기념 로브
				me.AddKeyword(`mabi_3year_present`);

				bReceiveEventItem = true;
			}

			if (bReceiveEventItem)
			{
				me.ShowCaption(["event.pc_event.11"]);
			}
		}
		else
		{
			if (GetYear() >= 2009)		//2009년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_3year_present`);
				me.RemoveKeyword(`mabi_3year_present_pay_user`);
			}
		}
		// 일본 4주년 이벤트
		// 4월 16일 ~ 5월 31일까지 지급
		if ((GetYear() == 2009 && GetDate() >= 416 && GetDate() < 601) || IsDevelopment())
		{

			bool bReceiveEventItem = false;

			if (!me.HaveKeyword(`mabi_4year_present`))
			{
				int presentIndex = Random(4);
				switch(presentIndex)
				{
					case (0)
					{
						me.RcvItemWithRewardView(me, 18569);	//데브캣 모자
						me.AddKeyword(`mabi_4year_present`);
						bReceiveEventItem = true;
					}
					case (1)
					{
						me.RcvItemWithRewardView(me, 15275);	//나이 제한 없는 고양이 옷
						me.AddKeyword(`mabi_4year_present`);
						bReceiveEventItem = true;
					}
					case (2)
					{
						me.RcvItemWithRewardView(me, 16045);	//나이 제한 없는 고양이 장갑
						me.AddKeyword(`mabi_4year_present`);
						bReceiveEventItem = true;
					}
					case (3)
					{
						me.RcvItemWithRewardView(me, 17101);	//나이 제한 없는 고양이 신발
						me.AddKeyword(`mabi_4year_present`);
						bReceiveEventItem = true;
					}
				}
			}
		}
		else
		{
			if (GetYear() >= 2010)		//2010년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_4year_present`);
			}
		}
		// 일본 5주년 이벤트
		// 4월 15일 ~ 5월 27일까지 지급
		if ((GetYear() == 2010 && GetDate() >= 415 && GetDate() < 528) || IsDevelopment())
		{

			bool bReceiveEventItem = false;

			if (!me.HaveKeyword(`mabi_5year_present`))
			{
				int presentIndex = Random(3);
				switch(presentIndex)
				{
					case (0)
					{
						me.RcvItemWithRewardView(me, 16069);	//백호 장갑
						me.AddKeyword(`mabi_5year_present`);
						bReceiveEventItem = true;
					}
					case (1)
					{
						me.RcvItemWithRewardView(me, 17224);	//백호 슈즈
						me.AddKeyword(`mabi_5year_present`);
						bReceiveEventItem = true;
					}
					case (2)
					{
						me.RcvItemWithRewardView(me, 19080);	//4등 백호 로브
						me.AddKeyword(`mabi_5year_present`);
						bReceiveEventItem = true;
					}
				}
			}
		}
		else
		{
			if (GetYear() >= 2011)		//2011년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_5year_present`);
			}
		}
	}

	/*
	중국 일주년 기념 이벤트 관련 작업
	한국에서 진행했던 일주년 기념 이벤트
	마비노기 1주년 기념 미니 모자입니다.
	모든 캐릭터 당 한개씩 지급입니다.
	이벤트 기간 : 11월 21일
	*/

	if(GetLocale().LowerCase()==`china`)
	{
		//중국 3주년 이벤트
		//2008년 11월21일 ~24일 00시
		if ((GetYear() == 2008 && GetDate() >= 1121 && GetDate() < 1124) || IsDevelopment())
		{
			bool bReceiveEventItem = false;

			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_3year_present_pay_user`))
				{
					int presentIndex = Random(2);
					switch(presentIndex)
					{
						case (0)
						{
							me.DoStript(`additemex(id:40245 col1:ff4646 col2:eeeb1b)`);	//유료유저 상품 : 장난감 망치
							me.AddKeyword(`mabi_3year_present_pay_user`);
							bReceiveEventItem = true;
						}
						case (1)
						{
							me.DoStript(`additemex(id:40246 col1:BEA2C9)`);	//유료유저 상품 : 장난감 활
							me.AddKeyword(`mabi_3year_present_pay_user`);
							bReceiveEventItem = true;
						}
					}
				}
			}
			if (!me.HaveKeyword(`mabi_3year_present`))
			{
				me.DoStript(`additemex(id:19044)`);			//전 유저 상품 : 3주년 기념 로브
				me.AddKeyword(`mabi_3year_present`);

				bReceiveEventItem = true;
			}

			if (bReceiveEventItem)
			{
				me.ShowCaption(["event.pc_event.11"]);
			}
		}
		else
		{
			if (GetYear() >= 2009)		//2009년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_3year_present`);
				me.RemoveKeyword(`mabi_3year_present_pay_user`);
			}
		}
		if ((GetYear() == 2006 && GetDate() ==1121) || IsDevelopment())
		{
			//if (me.IsPayPlayer())
			{
				if (!me.HaveKeyword(`mabi_1year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18105)`);	//상품 : 1주년 기념 별장식 미니모자
					me.AddKeyword(`mabi_1year_present_pay_user`);
				}
			}

		}
		else
		{
			if (GetYear() >= 2006)		//2006년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_1year_present_pay_user`);
			}
		}
		// 중국 노동절 연휴 이벤트
		if (IsCurrentEvent(`give_panda_headband_china`))
		{
			bool bReceiveEventItem = false;
			if (!me.HaveKeyword(`get_panda_headband_china`))
			{
				me.RcvItemWithRewardView(me, 18150);	//팬더 머리띠
				me.AddKeyword(`get_panda_headband_china`);
				bReceiveEventItem = true;
			}
		}
		else
		{
			if (GetYear() >= 2011)		//2011년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`get_panda_headband_china`);
			}
		}
	}
/*
	대만 일주년 기념 이벤트 관련 작업
	한국에서 진행했던 일주년 기념 이벤트
	모든 캐릭터 당 한개씩 지급입니다.
	*/

	if(GetLocale().LowerCase()==`taiwan`)
	{
		//대만 4주년 이벤트
		if (((GetYear() == 2009 && GetDate() >= 0709 && GetHour() >= 12 ) && (GetYear() == 2009 && GetDate() < 0713)) || IsDevelopment())
		{
			bool bReceiveEventItem = false;

			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`mabi_4year_present_pay_user`))
				{
					me.DoStript(`additemex(id:18579)`);	//유료유저 상품 : 파티용 고깔 모자
					me.AddKeyword(`mabi_4year_present_pay_user`);
					bReceiveEventItem = true;
				}
			}
			if (!me.HaveKeyword(`mabi_4year_present`))
			{
				me.DoStript(`additemex(id:12007)`);			//전 유저 상품 : 데브캣 브로치
				me.AddKeyword(`mabi_4year_present`);

				bReceiveEventItem = true;
			}

			if (bReceiveEventItem)
			{
				me.ShowCaption(["event.game_event.1"]);
			}
		}
		else
		{
			if (GetYear() >= 2010)		//2010년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_4year_present`);
				me.RemoveKeyword(`mabi_4year_present_pay_user`);
			}
		}
		//대만 5주년 이벤트
		if ((GetYear() == 2010 && GetDate() >= 0719) && (GetYear() == 2010 && GetDate() < 0802))
		{
			bool bReceiveEventItem = false;
			if (!me.HaveKeyword(`mabi_5year_present`))
			{
				me.DoStript(`additemex(id:18564)`);			//전 유저 상품 : 나오의 플라워 헬름
				me.AddKeyword(`mabi_5year_present`);

				bReceiveEventItem = true;
			}
		}
		else
		{
			if (GetYear() >= 2011)		//2011년 이후에는 키워드를 지워버림
			{
				me.RemoveKeyword(`mabi_5year_present`);
			}
		}
	}
/*
	미국 일주년 기념 이벤트 관련 작업
	한국에서 진행했던 일주년 기념 이벤트
	모든 캐릭터 당 한개씩 지급입니다.
	*/

	if(GetLocale().LowerCase()==`usa`)
	{
		//대만 4주년 이벤트
		if (IsCurrentEvent(`USA_2nd_anniversary`))
		{
			bool bReceiveEventItem = false;
/*
			if (me.IsPayPlayer()) //IsRealPayer():겜방유저는 안주고 싶다면 이걸 써라!
			{
				if (!me.HaveKeyword(`get_2nd_anniversary_USA`))
				{
					me.DoStript(`additemex(id:18652)`);	//유료유저 상품 : 파티용 고깔 모자
					me.AddKeyword(`mabi_4year_present_pay_user`);
					bReceiveEventItem = true;
				}
			}
*/
			if (!me.HaveKeyword(`get_2nd_anniversary_USA`))
			{
				me.DoStript(`additemex(id:18652)`);			//전 유저 상품
				me.AddKeyword(`get_2nd_anniversary_USA`);

				bReceiveEventItem = true;
			}

			if (bReceiveEventItem)
			{
				me.ShowCaption(["event.game_event.3"]);
			}
		}
		else
		{
			if (GetYear() >= 2011)		//2011년 이후에는 키워드를 지워버림
			{
//				me.RemoveKeyword(`get_2nd_anniversary_USA`);
				me.RemoveKeyword(`get_2nd_anniversary_USA`);
			}
		}
	}

	//////////////////////////////////////////////////////////////
	//
	//	한국 2005년 크리스마스 이벤트 키워드 삭제해주기
	//
	//////////////////////////////////////////////////////////////
	if ( (GetYear() == 2005 && GetDate() >= 1226)
		|| GetYear() >= 2006	//2006년 이후에는 키워드를 지워버림
	)
	{
		me.RemoveKeyword(`xmas_present_2005_1_hidden`);
		me.RemoveKeyword(`xmas_present_2005_2_hidden`);
	}

	//////////////////////////////////////////////////////////////
	//
	//	해외 2006년 크리스마스 이벤트 키워드 삭제해주기
	//
	//////////////////////////////////////////////////////////////
	if ( (GetYear() == 2006 && GetDate() >= 1227)
		|| GetYear() >= 2007	//2006년 이후에는 키워드를 지워버림
	)
	{
		me.RemoveKeyword(`foreign_xmas_present_2006_1`);
		me.RemoveKeyword(`foreign_xmas_present_2006_2`);
	}

	//////////////////////////////////////////////////////////////
	//
	//	2006년 어린이날 이벤트 키워드 삭제해주기
	//
	//////////////////////////////////////////////////////////////
	if(
		((GetYear() == 2006 && GetDate() >= 0508) || GetYear() >= 2007)	// 2006년 5월 8일 이후에는 키워드를 지워버림
		&& GetLocale().LowerCase() == `korea`.LowerCase()	// 한국
		&& (me.HaveKeyword(`childrensday2006_kittyhand`) || me.HaveKeyword(`childrensday2006_kittyfoot`))
	)
	{
		me.RemoveKeyword(`childrensday2006_kittyhand`);
		me.RemoveKeyword(`childrensday2006_kittyfoot`);
	}
	if(
		((GetYear() == 2006 && GetDate() >= 0605) || GetYear() >= 2007)	// 2006년 6월 5일 이후에는 키워드를 지워버림
		&& GetLocale().LowerCase() == `china`.LowerCase()	// 중국
		&& (me.HaveKeyword(`childrensday2006_kittyhand`) || me.HaveKeyword(`childrensday2006_kittyfoot`))
	)
	{
		me.RemoveKeyword(`childrensday2006_kittyhand`);
		me.RemoveKeyword(`childrensday2006_kittyfoot`);
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 일본 초보자 이벤트 기간 중 키워드에 따른 퀘스트 획득 및, 기간 종료 후 키워드 삭제 처리
	// 이곳의 코드는 2006년 10월 11일 작성되었습니다. by uhihiho
	// 이벤트 검사 방식을 변경하였습니다. by dochigun, 2007/05/30
	//////////////////////////////////////////////////////////////////////////////////////
	if (IsCurrentEvent(`beginnerhelp2006`) || IsCurrentEvent(`beginnerhelp2007`))
	{
		if ((!me.HaveKeyword(`_event_beginner`)) && (!me.HaveKeyword(`_event_olduser`)) && (me.GetLevel() >= 20))
		// 이벤트 기간이고 레벨 20 이상인 기존 유저가 키워드와 퀘스트 없으면 줌
		{
			me.AddKeyword(`_event_olduser`);
			if (me.IsElf())
				me.AddGameQuest(201006,0);
			else if(me.IsHuman())
			{
				if(me.HaveKeyword(`FirstLoginAtIria`))
					me.AddGameQuest(201004,0);
				else
					me.AddGameQuest(201002,0);
			}
		}
	}
	else
	{
		if (me.HaveKeyword(`_event_beginner`))			// 이벤트 기간 후 초보자 히든 키워드 삭제
			me.RemoveKeyword(`_event_beginner`);
		if (me.HaveKeyword(`_event_olduser`))			// 이벤트 기간 후 기존유저 히든 키워드 삭제
			me.RemoveKeyword(`_event_olduser`);
		if (me.HaveKeyword(`_event_beginner_pass`))			// 이벤트 기간 후 통행증 재발급용 히든 키워드 삭제
			me.RemoveKeyword(`_event_beginner_pass`);
		if (me.IsSelectableTitle(10052))					// 이벤트 기간 후 초보자 타이틀 known 상태로 (비활성화)
		{
			me.DeactivateTitle(10052);
			me.ShowCaption(["event.pc_event.7"]);
		}
		if (me.IsSelectableTitle(10057))					// 이벤트 기간 후 초보자 타이틀 known 상태로 (비활성화)
		{
			me.DeactivateTitle(10057);
			me.ShowCaption(["event.pc_event.7"]);
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 대만 2주년 보물 찾기 이벤트 후 키워드를 제거한다. by dochigun, 2007/05/30
	//////////////////////////////////////////////////////////////////////////////////////
	if (!IsCurrentEvent(`treasurehuntingtaiwan`))
	{
		if (me.HaveKeyword(`treasure_hunting_taiwan_2007_06`))
		{
			me.RemoveKeyword(`treasure_hunting_taiwan_2007_06`);
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 일본 빙수 만들어 여름 나기 이벤트 처리 by dochigun, 2007/07/06
	//////////////////////////////////////////////////////////////////////////////////////
	if (IsCurrentEvent(`makeicejapan2007`))
	{
		if (!me.HaveKeyword(`cool_ice`))
		{
			me.AddKeyword(`cool_ice`);
		}
	}
	else
	{
		if (me.HaveKeyword(`cool_ice`))
		{
			me.RemoveKeyword(`cool_ice`);
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 중국 2주년 기념 이벤트 처리 by dochigun, 2007/10/05
	//////////////////////////////////////////////////////////////////////////////////////
	if (IsCurrentEvent(`china_2nd_anniversary`))
	{
		if (!me.HaveKeyword(`_2nd_anniversary_china_event`))
		{
			me.AddKeyword(`_2nd_anniversary_china_event`);

			// 체험 아이템을 지급한다.
			if (me.IsFemale())
			{
				me.RcvItemWithRewardView(me, 18197);				// 여자용 경극 머리장식 (체험용)
				if (me.IsPayPlayer())
				{
					me.RcvItemWithRewardView(me, 15283);			// 여자용 경극 의상 (체험용)
				}
			}
			else
			{
				me.RcvItemWithRewardView(me, 18196);				// 남자용 경극 머리장식 (체험용)
				if (me.IsPayPlayer())
				{
					me.RcvItemWithRewardView(me, 15282);			// 남자용 경극 의상 (체험용)
				}
			}

			if (me.IsPayPlayer())
			{
				me.RcvItemWithRewardView(me, 17111);				// 경극 신발 (체험용)
			}
		}
	}
	else
	{
		if (me.HaveKeyword(`_2nd_anniversary_china_event`))
		{
			// 체험용 경극 아이템을 제거한다.
			// 머리장식
			me.RemoveItemClsWithNotice(18196);
			me.RemoveItemClsWithNotice(18197);

			// 의상
			me.RemoveItemClsWithNotice(15282);
			me.RemoveItemClsWithNotice(15283);

			// 신발
			me.RemoveItemClsWithNotice(17111);

			// 아이템 세트 보석도 제거한다.
			int itemCount = me.GetItemNoWithClassId(75199);
			if (itemCount > 0)
			{
				me.RemoveItemClsWithNotice(75199, itemCount);
			}
		}
	}



	//////////////////////////////////////////////////////////////////////////////////////
	// 해외 크리스마스 이벤트 후 키워드를 제거한다. by dochigun, 2007/12/05
	//////////////////////////////////////////////////////////////////////////////////////
	if (IsCurrentEvent(`christmas2007`) ||
			IsCurrentEvent(`christmas2007reward1japan`) ||
			IsCurrentEvent(`christmas2007reward2japan`) ||
			IsCurrentEvent(`christmas2007reward3japan`))
	{
		// 이벤트를 진행했다는 플래그를 기록한다.
		if (!me.HaveKeyword(`_christmas2007_flag`))
		{
			me.AddKeyword(`_christmas2007_flag`);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 한국에서는 2007.12.21~2007.12.25일 사이에서 이벤트가 안 떠 있는 상태라도 키워드를 지우지 않도록 한다. by orcen 2007/12/18
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if(GetLocale().LowerCase()==`korea` && GetYear()==2007 && GetDate()>=1221 && GetDate()<=1225)
	{

	}
	else
	{
		// 키워드를 제거한다.
		if (me.HaveKeyword(`_christmas2007_flag`))
		{
			if (!IsCurrentEvent(`christmas2007`) &&
					!IsCurrentEvent(`christmas2007reward1japan`) &&
					!IsCurrentEvent(`christmas2007reward2japan`) &&
					!IsCurrentEvent(`christmas2007reward3japan`))
			{
				if (me.HaveKeyword(`christmas2007`))
				{
					me.RemoveKeyword(`christmas2007`);
				}
				if (me.HaveKeyword(`christmas2007_gift`))
				{
					me.RemoveKeyword(`christmas2007_gift`);
				}
				if (me.HaveKeyword(`_christmas2007`))
				{
					me.RemoveKeyword(`_christmas2007`);
				}
				if (me.HaveKeyword(`_christmas2007_gift`))
				{
					me.RemoveKeyword(`_christmas2007_gift`);
				}
				me.RemoveKeyword(`_christmas2007_flag`);
			}
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnEventQuestCompleted(character me, int _idQuest, bool _bSuccess)
// : 이벤트 관련 퀘스트를 완료 혹은 실패 했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	// 2008 한국 크리스마스 이벤트
	if (_idQuest == 206005 && _bSuccess && IsCurrentEvent(`christmas2008_foreign`) && GetLocale().LowerCase()==`korea`)
	{
		me.AddKeyword(`christmas_2008_korea`);
	}

	//2005년 설날 이벤트
	if (_idQuest == 200069 && _bSuccess)
	{
		if (me.IsFemale())
		{
			me.AddGameQuest(200071,10);
		}
		else
		{
			me.AddGameQuest(200070,10);
		}
	}
	//2005년 추석 이벤트
	if (_idQuest == 200081 && _bSuccess)
	{
		if (me.IsFemale())
		{
			me.AddGameQuest(200083,10);
		}
		else
		{
			me.AddGameQuest(200082,10);
		}
	}
	//2006년 추석 이벤트. 멍청하게 예전 이벤트 지우지 말 것.
	if (_idQuest == 200095 && _bSuccess)
	{
		if (me.IsFemale())
		{
			me.AddGameQuest(200096,10);
		}
		else
		{
			me.AddGameQuest(200097,10);
		}
	}

	//2008년 해외 발렌타인 데이 이벤트
	if (IsCurrentEvent(`valentine2008_overseas`))
	{
		if (_idQuest == 201103 && _bSuccess)
		{
			me.AddGameQuest(201104, 0);
		}

		if (_idQuest == 201104 && _bSuccess)
		{
			me.RemoveKeyword(`Valentine_Step1`);
			me.AddGameQuest(201105, 0);
		}
	}

	//2008 해외 화이트 데이 이벤트
	if (IsCurrentEvent(`white2008_overseas`))
	{
		if (_idQuest == 201106 && _bSuccess)
		{
			me.AddGameQuest(201107, 0);
		}

		if (_idQuest == 201107 && _bSuccess)
		{
			me.AddGameQuest(201108, 0);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void ReceiveDailyEventBonus(character me, string _eventName)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (_eventName == `morrighanserver2010_korea`)
	{
		// 2010 모리안 서버 이벤트
		if(IsCurrentEvent(_eventName))
		{
			if (me.CanReceiveDailyEventBonus(_eventName, 52142))
			{
				if (me.DoReceiveDailyEventBonus(_eventName, 52142, true))
				{
					if (me.IncreaseInvenMoney(3000, true, `morrighanserver2010_korea`))
					{
						me.ShowCaption(["event.game_event.4"]);
					}
					else
					{
						if (me.DoReceiveDailyEventBonus(_eventName, 52142, false))
						{
							me.ShowCaption(["event.game_event.5"]);
						}
						else
						{
							// 정상적인 상황인데 지원금을 받지 못함
							// 복구 최종 실패 : 여기선 수동 복구가 필요합니다
						}
					}
				}
				else
				{
					me.ShowCaption(["event.game_event.6"]);
				}
			}
		}
	}
}