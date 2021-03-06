
//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project PC Script
//                                                                         PC/더미
//
//                                            marlin fecit, begins at 2003. 11. 12
//                                                            marlin22@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnFirstCreate(character me)
// : PC가 캐릭터 맨 처음 생성될 때 딱 한번 불린다.
// : 이 함수는 클라이언트 로그인이 시작하기 전에 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오
}





//////////////////////////////////////////////////////////////////////////////////
server void OnCreate(character me)
// : PC가 서버에 접속하는 순간마다 불리는 함수
// : 이 함수는 클라이언트 로그인이 시작하기 전에 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오
}



//////////////////////////////////////////////////////////////////////////////////
server void PrepareEnterWorld(character me)
// : PC가 월드에 접속하려고 할 때 불리는 함수이다.
// : 이곳에서 반드시 캐릭터를 어디론가 진입시켜줘야 한다. (나오리전? 혹은 디폴트 리전)
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.IsFirstEnterWorld())
	{
		// 이 캐릭터가 생성된 이후 처음 게임 서버에 로드되었다
		// 나오의 튜토리얼 모드를 시작한다
		me.StartTutorial();
	}
	else
	{
		// 게임에 전에도 로그인 한 적이 잇다.
		if (me.IsReadyToRebirth())
		{
			if (IsCurrentEvent(`worldcup_event_2010_korea`))
			{
				// 환생을 위해 로그인 한 것이다. 나오한테 보내자.
				me.EnterEventRegion(1000, 0, 0, `_nao_worldcup`);
			}
			else
			{
				// 환생을 위해 로그인 한 것이다. 나오한테 보내자.
				me.EnterEventRegion(1000, 0, 0);
			}
		}
		else if (me.PrepareForNaosGift())
		{
			// 유료 사용자이고, 오늘이 생일이다.
			// 여기서 반드시!, 무조건 나오한테 보내야 한다.
			// 이유를 설명하자면 길기에, 궁금하면 물어볼 것
			// marlin, 2004. 06. 05
			me.EnterEventRegion(1000, 0, 0);
		}

		/*
		// 여기 걸려서 다른 조건들 체크 안 하고 바로 로그인해버려서 수정
		// G1 여신 만나기
		// 인간만 by jisangs, 060601
		else if (
			me.IsHuman() &&	// 인간만
			me.IsMainStreamPlayablePlayer(1) &&
			me.GetLevel() >= 5 &&
			!me.HaveKeyword(`g1`) &&
			!me.HaveKeyword(`g1_complete`)&&
			!(me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitDuncan`)) &&	// 이리아에서 시작 반영
			GetVersion() >= 100)
		{
			if (	(GetLocale().LowerCase() == `korea`.LowerCase())
				&& !me.HaveKeyword(`g9_complete`)
				&& !me.HaveKeyword(`g1_start`)
				&& GetVersion() >= 901)
			{
				// xx씨 왜그러셨어요 ㅠ.ㅠ
				// 여기 조건에 걸리면 월드 진입이 안되잖아요.
				// 우선 주석 풀어놓을께요.
				me.EnterWorld();
			}
			else
			{
				// G1_챕터0을 보러간다
				me.EnterEventRegion(1002, 3200, 3200);
			}
		} */
		// G1 여신 만나기
		else if (
			me.IsHuman() &&	// 인간만
			me.IsMainStreamPlayablePlayer(1) &&
			me.GetLevel() >= 5 &&
			!me.HaveKeyword(`g1`) &&
			!me.HaveKeyword(`g1_complete`)&&
			(
				(!(me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitDuncan`))) ||  				// 이리아에서 시작 반영
				(me.HaveKeyword(`FirstLoginAtIria`) && me.HaveKeyword(`memorial_character`))			// 메모리얼 캐릭터 시작 반영
			) &&
			GetVersion() >= 100 &&
				!((GetLocale().LowerCase() == `korea`.LowerCase())
				&& !me.HaveKeyword(`g9_complete`)
				&& !me.HaveKeyword(`g1_start`)
				&& GetVersion() >= 901)
			)
		{
			// G1_챕터0을 보러간다
			me.EnterEventRegion(1002, 3200, 3200);
		}

		else if (me.IsMainStreamPlayablePlayer(1) &&
			me.HaveKeyword(`g1_31`) && GetVersion() >= 100)
		{
			// G1_챕터28을 보러간다
			me.EnterEventRegion(1002, 3200, 3200);
		}
		else if (me.IsMainStreamPlayablePlayer(1) &&
			me.HaveKeyword(`g1_34`)&&
			me.HaveKeyword(`g1_34_2`) && GetVersion() >= 100)
		{
			// G1_챕터33을 보러간다
			me.EnterEventRegion(1002, 3200, 3200);
		}
		else if (GetVersion() >= 703	&& !me.HaveKeyword(`g7s3`) &&	!me.HaveKeyword(`g7s3_Complete`) && me.HaveKeyword(`jungle_ruins`) )
		{
			// G7S3 루에리 퀘스트 시작
			me.EnterEventRegion(905, 3200, 3200);
		}

		// G10 메인스트림 시작
		// 그림자 영웅 타이틀이 있고, G10 을 시작 안 했으면 스페셜 소울스트림 리전으로 보낸다.
		else if ( (IsEnable(`featureG10MainStream`) extern (`data/script/features.mint`))
			&& !me.HaveKeyword(`g10`) && !me.HaveKeyword(`g10_complete`) && me.IsSelectableTitle(11010) )
//			&& !IsTestServer())
		{

			me.EnterEventRegion(218, 0, 0);
		}


		// G11 메인스트림 시작
		// G10 클리어 키워드 있고, G11을 시작 안 했으면 메인스트림 전용 장서관 리전으로 보낸다.
		/*
		else if ( (IsEnable(`featureG11MainStream`) extern (`data/script/features.mint`))
			&& !me.HaveKeyword(`g11`) && !me.HaveKeyword(`g11_complete`) && me.HaveKeyword(`g10_complete`))
		{

			me.EnterEventRegion(427, 0, 0);
		}
		*/


		/////////////////////////////////////////
		//
		// 게임내 이벤트 관련 처리는 아래에서 합니다.
		// OnLogin 과 달리 순서를 바꾸면 안 됩니다.
		//
		/////////////////////////////////////////

		else
		{
			BeforeEnter(me) extern (`data/script/event/game_event.mint`);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnEventRegionReady(character me, int _iRegionID)
// : 월드에 진입 전, 이벤트 리전의 준비가 완료되었을 때 불린다.
// : 위 PrepareEnterWorld()에서 EnterEventRegion()을 불렀다면 여기에 올 것이다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (_iRegionID == 1002)
	{
		//여신 리전이다.
		//G1 난이도 하락으로 레벨제한 10 -> 5 로 수정
		// 인간만 by jisangs, 060601
		if (
			me.IsHuman()	// 인간만
			&& me.GetLevel() >= 5
			&& !me.HaveKeyword(`g1`)
			&& !me.HaveKeyword(`g1_complete`)
			&& GetVersion() >= 100)
		{
			//G1_챕터0의 시작
			me.PlayCutScene(`G1_0_a_Morrighan`, 0);
		}
		else
		if (me.HaveKeyword(`g1_31`) && GetVersion() >= 100)
		{
			//G1_챕터28의 시작
			me.PlayCutScene(`G1_28_a_Morrighan`, 0);
		}
		else
		if (me.HaveKeyword(`g1_34`)&&
			me.HaveKeyword(`g1_34_2`) && GetVersion() >= 100)
		{
			//G1_챕터33의 시작
			me.PlayCutScene(`G1_33_a_Morrighan`, 0);
		}
		else
		{
			me.LeaveEventRegion();
		}
	}
	else if (_iRegionID == 905)
	{
		if (me.HaveKeyword(`jungle_ruins`))
		{
			if(me.IsHuman())
			{
				me.PlayCutScene(`g7s3_intro_human`, 0);
			}
			else if(me.IsElf())
			{
				me.PlayCutScene(`g7s3_intro_elf`, 0);
			}
			else if(me.IsGiant())
			{
				me.PlayCutScene(`g7s3_intro_giant`, 0);
			}
		}
	}

	// G10 메인스트림 시작 컷신 - 예지몽
	else if (_iRegionID == 218)
	{
		me.PlayCutScene(`C3G10_S#1_prophecy_dream`, 0);
	}


	// G11 메인스트림 시작 컷신 - 부캐넌 실종
	else if (_iRegionID == 427)
	{
		me.PlayCutScene(`C3G11_S#1_missing_buchanan`, 0);
	}


}

//////////////////////////////////////////////////////////////////////////////////
server void SettingByCharacterCard(character me)
// : 만들거나 환생한 캐릭터카드에 따른 세팅
//////////////////////////////////////////////////////////////////////////////////
{
	int gen_card = me.GetGeneratedCardID();
	int rebirth_card = me.GetRebirthCardID();

	if (gen_card > 0)
	{
		if(gen_card>=93 && gen_card<=108) // 메모리얼 공통 장비, 스킬 세팅
		{
			// DebugOut(`메모리얼 카드로 생성하고 SettingByCharacterCard`);

			// 공통 스킬 - 생활
			me.AddSkill(10023,0);   //낚시 연습랭
			me.AddSkill(10011,0);   //방직 연습랭
			me.AddSkill(10016,0);   //블랙 스미스 연습랭
			me.ModifySkillExpPoint(10016, 1);
			me.AddSkill(10003,0);   //악기 연주 연습랭
			me.AddSkill(10026,0);   //야생동물 조련 연습랭
			me.AddSkill(10033,0);   //목공 연습랭
			me.ModifySkillExpPoint(10033, 1);
			me.AddSkill(10028,0);   //야금술 연습랭
			me.ModifySkillExpPoint(10028, 1);
			me.AddSkill(10020,0);   //요리 연습랭
			me.AddSkill(10009,0);   //응급치료 연습랭
			me.ModifySkillExpPoint(10009, 1);
			me.AddSkill(10005,0);   //작곡 연습랭
			me.AddSkill(10015,0);   //제련 연습랭
			me.AddSkill(10001,0);   //천옷 만들기 연습랭
			me.AddSkill(10008,0);   //캠프 파이어 연습랭
			me.AddSkill(10022,0);   //포션 조제 연습랭
			me.AddSkill(10013,0);   //핸디 크래프트 연습랭
			me.ModifySkillExpPoint(10013, 1);
			me.AddSkill(10004,0);   //휴식 연습랭
			me.AddSkill(10024,0);   //메이킹 마스터리 연습랭
			me.ModifySkillExpPoint(10024, 1);
			me.AddSkill(10021,0);   //약초학 연습랭
			me.AddSkill(10006,0);   //음악적 지식 연습랭
			me.ModifySkillExpPoint(10006, 1);

			// 공통 스킬 - 마법
			me.AddSkill(30101,0);   //라이트닝 볼트 연습랭
			me.ModifySkillExpPoint(30101, 1);
			me.AddSkill(30201,0);   //파이어 볼트 연습랭
			me.ModifySkillExpPoint(30201, 1);
			me.AddSkill(30301,0);   //아이스 볼트 연습랭
			me.ModifySkillExpPoint(30301, 1);
			me.AddSkill(30006,0);   //힐링 연습랭
			me.ModifySkillExpPoint(30006, 1);
			me.AddSkill(30005,0);   //인챈트 연습랭
			me.ModifySkillExpPoint(30005, 1);
			me.AddSkill(30007,0);   //매직 마스터리 연습랭

			// 공통 스킬 - 연금술
			me.AddSkill(35003,0);   //연금술 마스터리 연습랭
			me.AddSkill(35001,0);   //마나 포밍 연습랭
			me.AddSkill(35004,0);   //워터 캐논 연습랭
			me.AddSkill(35007,0);   //윈드 블래스트 연습랭
			me.AddSkill(35008,0);   //플레이머 연습랭

			// 공통 전투 스킬
			me.AddSkill(23002,0);   //컴뱃 마스터리 연습랭
			me.AddSkill(20002,0);   //스매시 연습랭
			me.ModifySkillExpPoint(20002, 1);
			me.AddSkill(22001,0);   //윈드밀 연습랭
			me.ModifySkillExpPoint(22001, 1);
			me.AddSkill(20003,0);   //카운터 어택 연습랭
			me.ModifySkillExpPoint(20003, 1);
			me.AddSkill(23003,0);   //크리티컬 히트 연습랭
			me.ModifySkillExpPoint(23003, 1);
			me.AddSkill(23011,0);   //샤프 마인드 연습랭
			me.AddSkill(20001,0);   //디펜스 연습랭
			me.ModifySkillExpPoint(20001, 1);

			// 공통 액션
			me.AddSkill(50019,0);   //랜드 메이커
			me.AddSkill(50014,0);   //탐사
			me.AddSkill(50018,0);   //공연
			me.AddSkill(50023,0);   //종이 비행기 날리기
			me.AddSkill(50013,0);   //스케치

			// 인간 전용 스킬 & 액션
			if(gen_card>= 93 && gen_card<=96)
			{
				me.AddSkill(21001,0);   //레인지 마스터리 연습
				me.AddSkill(21002,0);   //매스넘 샷 연습
				me.ModifySkillExpPoint(21002, 1);

				me.AddSkill(21006,0);   //서포트 샷 연습
				me.ModifySkillExpPoint(21006, 1);

				me.AddSkill(50020,0);   //돌 던지기
				me.AddSkill(50016,0);   //죽은 척

				me.AddKeyword(`have_complete_ffion_quest`);  // 탐사 튜토리얼 완료 키워드
			}
			// 엘프 전용 스킬 & 액션
			if(gen_card>= 97 && gen_card<=105)
			{
				me.AddSkill(21001,0);   //레인지 마스터리 연습
				me.AddSkill(21002,0);   //매스넘 샷 연습
				me.ModifySkillExpPoint(21002, 1);
				me.AddSkill(21006,0);   //서포트 샷  연습
				me.ModifySkillExpPoint(21006, 1);

				me.AddSkill(50020,0);   //돌 던지기
				me.AddSkill(50016,0);   //죽은 척
				me.AddSkill(50017,0);   //하이드

				me.AddKeyword(`have_complete_vena_quest`);  // 탐사 튜토리얼 완료 키워드

			}
			// 자이언트 전용 스킬 & 액션
			if(gen_card>= 106 && gen_card<=108)
			{
				me.AddSkill(21010,0);   //던지기 공격 연습
				me.AddSkill(22007,0);   //발구르기 연습
				me.ModifySkillExpPoint(22007, 1);

				me.AddKeyword(`have_complete_meriel_quest`);  // 탐사 튜토리얼 완료 키워드

			}

			// 추가 AP 10
			me.ModifyAbility(10);

			// 메모리얼 캐릭터 플래그
			me.SetMemorialCharacterCardFlag();

			// 공통 장비
			me.DoStript(`additemex(id:2006)`); //큰 금화 주머니
			me.DoStript(`additemex(id:63000 count:10)`); //피닉스의 깃털 10개
			me.DoStript(`additemex(id:60005 count:10)`); //붕대 10개

			me.DoStript(`additemex(id:51003 count:10)`); //생명력 50 포션 10개
			me.DoStript(`additemex(id:51003 count:10)`); //생명력 50 포션 10개
			me.DoStript(`additemex(id:51003 count:10)`); //생명력 50 포션 10개

			me.DoStript(`additemex(id:51008 count:10)`); //마나 50 포션 10개
			me.DoStript(`additemex(id:51008 count:10)`); //마나 50 포션 10개
			me.DoStript(`additemex(id:51008 count:10)`); //마나 50 포션 10개

			me.DoStript(`additemex(id:51013 count:10)`); //스태미나 50 포션 10개
			me.DoStript(`additemex(id:51013 count:10)`); //스태미나 50 포션 10개
			me.DoStript(`additemex(id:51013 count:10)`); //스태미나 50 포션 10개

			// 공통 캐시템 - 거래 불가
			// - 나오 영혼석은 나오 대화에서 공급
			me.DoStript(`additemex(id:85051 count:3)`); //긴급탈출 B+ 3개
			me.DoStript(`additemex(id:85033 count:3)`); //밀랍 날개 3개

			// 공통 키워드 - 밀랍 날개 사용가능하게
			me.AddKeyword(`portal_tirchonaill`);		// 티르코네일
			me.AddKeyword(`portal_dunbarton`);		// 던바튼
			me.AddKeyword(`portal_bangor`);			// 반호르
			me.AddKeyword(`portal_emainmacha`);	// 이멘마하
			me.AddKeyword(`portal_qilla_base_camp`);	// 켈라 베이스
			me.AddKeyword(`portal_filia`);			// 필리아
			me.AddKeyword(`portal_vales`);			// 발레스
			me.AddKeyword(`portal_cor`);			// 코르
			me.AddKeyword(`portal_calida`);			// 칼리다
			me.AddKeyword(`portal_taillteann`);		// 탈틴
			me.AddKeyword(`portal_tara`);			// 타라

			// 공통 키워드 - 마나 터널
			me.AddKeyword(`_manatunnel_qilla`);		// 켈라 베이스
			me.AddKeyword(`_manatunnel_filia`);		// 필리아
			me.AddKeyword(`_manatunnel_vales`);	// 발레스
			me.AddKeyword(`_manatunnel_cor`);		// 코르
			me.AddKeyword(`_manatunnel_calida`);	// 칼리다

			// 메모리얼 퀘스트 - 돈 2만 골드와 스탯 영구히 모든 것 +2한다.
			// 인간 퀘스트는 나오와의 첫 대화에서 티르코네일과 켈라에 따라 다르게 공급
			// 엘프용 퀘스트
			if(gen_card>= 97 && gen_card<=105)
			{
				me.AddGameQuest(207004, 1);
			}
			// 자이언트용 퀘스트
			if(gen_card>= 106 && gen_card<=108)
			{
				me.AddGameQuest(207005, 1);
			}
		}

		switch (gen_card) //최초 생성하는 캐릭터 카드 ID에 따라 달라짐에 셋팅
		{
			//PCCardDescription.xml의 카드 ID
			case (4)
			{
				// 프리카드
				if (IsEnable(`featureGiveNaoSoulStoneToCharacterByFreeCard`) extern (`data/script/features.mint`))
				{
					me.DoStript(`additemex(id:85000 count:10)`);
				}
			}
			case (77)
			{
				// 프리카드
				if (IsEnable(`featureGiveNaoSoulStoneToCharacterByFreeCard`) extern (`data/script/features.mint`))
				{
					me.DoStript(`additemex(id:85000 count:10)`);
				}
			}
			case (81)
			{
				// DebugOut(`81번 카드로 생성한뒤 첫 로그인.`);
/*G3팔라딘셋트		me.AddKeyword(`g1_complete`);
				me.AddKeyword(`g2_complete`);
				me.AddKeyword(`g3_complete`);
				me.DoStript(`addtitle(11001)`);			//여신을 구출한 타이틀
				me.DoStript(`additemex(id:62005 prefix:30310)`); //여신의 인챈트 스크롤

				// DebugOut(`팔라딘 스킬을 주자`);
				//팔라딘
				me.AddSkill(40001,1);
				me.AddSkill(40002,1);
				me.AddSkill(40003,1);
				me.AddSkill(40004,1);
				me.AddSkill(40011,1);
				me.AddSkill(40012,1);
				me.AddSkill(40013,1);

//				// DebugOut(`다크 나이트 스킬을 주자`);
				//다크 나이트
//				me.AddSkill(41001,1);
//				me.AddSkill(41011,1);
//				me.AddSkill(41012,1);
//				me.AddSkill(41013,1);
//				me.AddSkill(41021,1);
//				me.AddSkill(41022,1);
//				me.AddSkill(41023,1);
//				me.AddSkill(41002,1);

				me.DoStript(`addtitle(11002)`);		//에린의 수호자 타이틀
				me.DoStript(`additemex(id:62005 suffix:30312)`); //흑요석 인챈트 스크롤
*/
			}
			 case (93) // 인간 컴뱃
			 {
				// 전용 스킬 공급
				me.AddSkill(22001,8);   //윈드밀 8랭
				me.AddSkill(23002,5);   //컴뱃 마스터리 B랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(20002,5);   //스매시 B랭
				me.AddSkill(20003,2);   //카운터 어택 E랭
				me.AddSkill(20001,3);   //디펜스 D랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40011 suffix:30501)`); //자이언트 브로드 소드
				me.DoStript(`additemex(id:40011 suffix:30501)`); //자이언트 브로드 소드
			 }
			 case (94) // 인간 레인지
			 {
				// 전용 스킬 공급
				me.AddSkill(21001,7);   //레인지 컴뱃 마스터리 9랭
				me.AddSkill(21002,6);   //매그넘 샷 A랭
				me.AddSkill(23003,7);   //크리티컬 히트 9랭
				me.AddSkill(23002,4);   //컴뱃 마스터리 C랭
				me.AddSkill(21006,1);   //서포트 샷 F랭
				me.AddSkill(23011,6);   //샤프 마인드 A랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40081 prefix:306 suffix:30715)`); //샤프 명중 레어 롱 보우
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개

			 }
			 case (95) // 인간 매직
			 {
				// 전용 스킬 공급
				me.AddSkill(30007,7);   //매직 마스터리 9랭
				me.AddSkill(30301,6);   //아이스 볼트 A랭
				me.AddSkill(30201,6);   //파이어 볼트 A랭
				me.AddSkill(30101,6);   //라이트닝 볼트 A랭
				me.AddSkill(30003,1);   //메디테이션 F랭
				me.AddSkill(30006,2);   //힐링 E랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,5);   //크리티컬 히트 B랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40233 prefix:20701)`); //거센 피닉스 파이어 원드
			 }
			 case (96) // 인간 연금술
			 {
				// 전용 스킬 공급
				me.AddSkill(35003,4);   //연금술 마스터리 C랭
				me.AddSkill(35004,7);   //워터 캐논 9랭
				me.AddSkill(35007,3);   //윈드 블래스트 D랭
				me.AddSkill(35008,4);   //플레이머 C랭
				me.AddSkill(35009,3);   //샌드 버스트 D랭
				me.AddSkill(10024,5);   //메이킹 마스터리 B랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40287 prefix:21009  suffix:30634)`); //촉촉한 물방울 워터 실린더
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
			 }
			 case (97) // 엘프 컴뱃
			 {
				// 전용 스킬 공급
				me.AddSkill(22001,7);   //윈드밀 9랭
				me.AddSkill(23002,5);   //컴뱃 마스터리 B랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(20002,5);   //스매시 B랭
				me.AddSkill(20003,4);   //카운터 어택 C랭
				me.AddSkill(20001,3);   //디펜스 D랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40079 prefix:20701 suffix:30506)`); //거센 매서운 메이스
				me.DoStript(`additemex(id:46006)`); //카이트 실드

			 }
			 case (98) // 엘프 레인지
			 {
				// 전용 스킬 공급
				me.AddSkill(21001,6);   //레인지 컴뱃 마스터리 A랭
				me.AddSkill(21002,6);   //매그넘 샷 A랭
				me.AddSkill(23003,7);   //크리티컬 히트 9랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(21006,1);   //서포트 샷 F랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40081 prefix:306 suffix:30715)`); //샤프 명중 레어 롱 보우
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개
				me.DoStript(`additemex(id:45001 count:100)`); //화살 100개
			 }
			 case (99) // 엘프 매직
			 {
				// 전용 스킬 공급
				me.AddSkill(30007,6);   //매직 마스터리 A랭
				me.AddSkill(30301,6);   //아이스 볼트 A랭
				me.AddSkill(30201,6);   //파이어 볼트 A랭
				me.AddSkill(30101,5);   //라이트닝 볼트 A랭
				me.AddSkill(30003,1);   //메디테이션 F랭
				me.AddSkill(30006,2);   //힐링 E랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,5);   //크리티컬 히트 B랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40233 prefix:20701)`); //거센 피닉스 파이어 원드

			 }
			 case (105) // 엘프 연금술
			 {
				// 전용 스킬 공급
				me.AddSkill(35003,4);   //연금술 마스터리 C랭
				me.AddSkill(35004,7);   //워터 캐논 9랭
				me.AddSkill(35007,3);   //윈드 블래스트 D랭
				me.AddSkill(35008,4);   //플레이머 C랭
				me.AddSkill(35009,3);   //샌드 버스트 D랭
				me.AddSkill(10024,5);   //메이킹 마스터리 B랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40287 prefix:21009  suffix:30634)`); //촉촉한 물방울 워터 실린더
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
			 }
			 case (106) // 자이 컴뱃
			 {
				// 전용 스킬 공급
				me.AddSkill(22001,8);   //윈드밀 8랭
				me.AddSkill(23002,5);   //컴뱃 마스터리 B랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(20002,5);   //스매시 B랭
				me.AddSkill(20003,2);   //카운터 어택 E랭
				me.AddSkill(20001,3);   //디펜스 D랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40030 suffix:30517)`); //무모한 투 핸디드 소드
				me.DoStript(`additemex(id:46020)`); //발레스 실드

			 }
			 case (107) // 자이 매직
			 {
				// 전용 스킬 공급
				me.AddSkill(30007,7);   //매직 마스터리 9랭
				me.AddSkill(30301,6);   //아이스 볼트 A랭
				me.AddSkill(30201,6);   //파이어 볼트 A랭
				me.AddSkill(30101,6);   //라이트닝 볼트 A랭
				me.AddSkill(30003,1);   //메디테이션 F랭
				me.AddSkill(30006,2);   //힐링 E랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,5);   //크리티컬 히트 B랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40233 prefix:20701)`); //거센 피닉스 파이어 원드

			 }
			 case (108) // 자이 연금술
			 {
				// 전용 스킬 공급
				me.AddSkill(35003,4);   //연금술 마스터리 C랭
				me.AddSkill(35004,7);   //워터 캐논 9랭
				me.AddSkill(35007,3);   //윈드 블래스트 D랭
				me.AddSkill(35008,4);   //플레이머 C랭
				me.AddSkill(35009,3);   //샌드 버스트 D랭
				me.AddSkill(10024,5);   //메이킹 마스터리 B랭
				me.AddSkill(23002,3);   //컴뱃 마스터리 D랭
				me.AddSkill(23003,6);   //크리티컬 히트 A랭
				me.AddSkill(23011,1);   //샤프 마인드 F랭

				// 전용 장비 공급
				me.DoStript(`additemex(id:40287 prefix:21009  suffix:30634)`); //촉촉한 물방울 워터 실린더
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65002 count:50)`); //불의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65003 count:50)`); //물의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65004 count:50)`); //바람의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
				me.DoStript(`additemex(id:65005 count:50)`); //흙의 결정 50개
			 }
			 case (109) // 미국 드래곤 문양 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			 }
			 case (110) // 미국 드래곤 문양 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			 }
			 case (111) // 미국 드래곤 문양 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			 }
			 case (115) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			 }
			 case (116) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			 }
			 case (117) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			 }
			 case (118) // 대만 부엉이 로브 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
			 }
			 case (119) // 대만 부엉이 로브 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
			 }
			 case (120) // 대만 부엉이 로브 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
			 }
			 case (129) // 미국 염색 패키지 캐릭터 카드
			 {
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			 }
			 case (130)  // 미국 염색 패키지 캐릭터 카드
			 {
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			 }
			 case (131) // 미국 염색 패키지 캐릭터 카드
			 {
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			 }
			 case (135) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15452)`); // 수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15453)`); // 수영복
				}
			 }
			 case (136) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15454)`); // 수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15455)`); //수영복
				}
			 }
			 case (137) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15457)`); //수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15458)`); //수영복
				}
			 }
			 case (150) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (154) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (155) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (156) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (151) // 미국 아라시 갑옷 캐릭터 카드 - 인간
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14052)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16546)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14051)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16545)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (152) // 미국 아라시 갑옷 캐릭터 카드 - 엘프
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14052)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16546)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14051)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16545)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (153) // 미국 아라시 갑옷 캐릭터 카드 - 자이
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14054)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16548)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14053)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16547)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (157) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:18345 col1:587459 col2:323232 col3:B279E2)`); // 윈리 록벨 반다나
					me.DoStript(`additemex(id:18347)`); // 윈리 록벨 이어링
				}
			 }
		}
	}
	else if (rebirth_card > 0) // 환생하는 캐릭터 카드에 셋팅 적용
	{
		switch (rebirth_card)
		{
			case (83)
			{
				// DebugOut(`83번 카드로 환생한뒤 첫 로그인.`);
			}
			case (109) // 미국 드래곤 문양 캐릭터 카드
			{
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			}
			case (110) // 미국 드래곤 문양 캐릭터 카드
			{
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			}
			case (111) // 미국 드래곤 문양 캐릭터 카드
			{
				if(me.IsFemale()) //여자면 여자 로브
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19059)`); //나쿠루 드래곤 문양 마법사 로브
				}
				else //남자면 남자 로브
				{
					me.DoStript(`additemex(id:19058)`); //나쿠루 드래곤 문양 마법사 로브
				}
			}
			case (115) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			}
			case (116) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			}
			case (117) // 미국 에메랄드 켈틱 수트 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15420)`); // 에메랄드 켈틱 수트 (여)
					me.DoStript(`additemex(id:18249)`); // 에메랄드 켈틱 헤어밴드
					me.DoStript(`additemex(id:17163)`); // 에메랄드 켈틱 부츠
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15419)`); //에메랄드 켈틱 수트 (남)
					me.DoStript(`additemex(id:18248)`); //에메랄드 켈틱 모자
					me.DoStript(`additemex(id:17162)`); //에메랄드 켈틱 신발
				}
			}
			case (118) // 대만 부엉이 로브 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
			}
			case (119) // 대만 부엉이 로브 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); // 부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
			}
			case (120) // 대만 부엉이 로브 캐릭터 카드
			{
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
				else //남자면
				{
					me.DoStript(`additemex(id:19070)`); //부엉이 로브
				}
			}
			case (129) // 미국 염색 패키지 캐릭터 카드
			{
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			}
			case (130)  // 미국 염색 패키지 캐릭터 카드
			{
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			}
			case (131) // 미국 염색 패키지 캐릭터 카드
			{
				me.DoStript(`additemex(id:63030)`); // 지염
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
				me.DoStript(`additemex(id:63024)`); // 염앰
			}
			 case (135) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15452)`); // 수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15453)`); // 수영복
				}
			 }
			 case (136) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15454)`); // 수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15455)`); //수영복
				}
			 }
			 case (137) // 미국 수영복 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15457)`); //수영복
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15458)`); //수영복
				}
			 }
			 case (150) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (154) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (155) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (156) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:15475)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
				else //남자면
				{
					me.DoStript(`additemex(id:15474)`); // 별 모양 마술사 의상
					me.DoStript(`additemex(id:18269)`); // 별 모양 큰 챙 마술사 모자
				}
			 }
			 case (151) // 미국 아라시 갑옷 캐릭터 카드 - 인간
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14052)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16546)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14051)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16545)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (152) // 미국 아라시 갑옷 캐릭터 카드 - 엘프
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14052)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16546)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14051)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16545)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (153) // 미국 아라시 갑옷 캐릭터 카드 - 자이
			 {
				if(me.IsFemale()) //여자면
				{
					me.DoStript(`additemex(id:14054)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16548)`);
					me.DoStript(`additemex(id:17532)`);
				}
				else //남자면
				{
					me.DoStript(`additemex(id:14053)`);
					me.DoStript(`additemex(id:18586)`);
					me.DoStript(`additemex(id:16547)`);
					me.DoStript(`additemex(id:17531)`);
				}
			 }
			 case (157) // 미국 마술사 의상 캐릭터 카드
			 {
				if(me.IsFemale()) //여자면
				{
					// 전용 장비 공급
					me.DoStript(`additemex(id:18345 col1:587459 col2:323232 col3:B279E2)`); // 윈리 록벨 반다나
					me.DoStript(`additemex(id:18347)`); // 윈리 록벨 이어링
				}
			 }
		}
	}

	// 캐릭터 카드 정보를 지운다.
	me.ClearCharacterCardInfo();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnRebirth(character me)
// : PC가 환생후 맨 처음 로그인 할때 딱 한번 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 만들거나 환생한 캐릭터카드에 따른 세팅 추가
	// by nicolas, 2009.06.18
	SettingByCharacterCard(me);

	// G12S2 자이언트 리뉴얼 이벤트
	// 이벤트 기간 동안 자이언트로 환생 or 생성 하면 지정된 키워드를 준다.
	// by kirie, 2010.04.19
	// 키워드 받은 적 없음 & 자이언트 & 레벨 1로 환생
	if((IsCurrentEvent(`g12s2_giantrenewalevent_korea`)) && me.IsGiant())
	{
		if(!me.HaveKeyword (`2010_giant_renewal1_korea`) && !me.HaveKeyword (`2010_giant_renewal2_korea`) && me.GetLevel() < 2)
		{
			me.AddKeyword(`2010_giant_renewal1_korea`);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnFirstLogin(character me)
// : PC가 캐릭터 생성 후 맨 처음 로그인 할때 딱 한번 불리는 함수이다.
// : 이 함수는 클라이언트 사이드에서도 완전히 로그인이 되었을 때 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 만들거나 환생한 캐릭터카드에 따른 세팅 추가
	// by nicolas, 2009.06.18
	SettingByCharacterCard(me);

	// DebugOut(`메모리얼 카드로 생성하고 OnFirstLogin`);

	// 메모리얼 체크 키워드를 심는다.
	int gen_card = me.GetGeneratedCardID();
	if(gen_card>=93 && gen_card<=108)
	{
		me.AddKeyword(`memorial_character`);	// 메모리얼로 만든 캐릭터다.
	}

	// 인간, 엘프 구분 by jisangs, 060601
	// 자이언트 구분 by jisangs, 061204
	if (me.IsGiant())
	{
		// 메모리얼 캐릭터는 튜토리얼 퀘스트를 받지 않는다.
		if (!me.IsQuestTried(200401) && !me.HaveKeyword(`memorial_character`))
		{
			me.AddGameQuest(200401, 0);
		}

		// 일본, 대만을 제외한 해외에서는
		// 자이언트 캐릭터 생성시 샤프 마인드 스킬을 준다.
		if (
			GetLocale().LowerCase() != `japan`.LowerCase()	// 일본 아니고
			&& GetLocale().LowerCase() != `taiwan`.LowerCase()	// 대만도 아닐 때
		)
		{
			me.KnowSkill(23011);	// 샤프 마인드 스킬
		}

	}
	else if (me.IsElf())
	{
		// 메모리얼 캐릭터는 튜토리얼 퀘스트를 받지 않는다.
		if (!me.IsQuestTried(200301) && !me.HaveKeyword(`memorial_character`))
		{
			me.AddGameQuest(200301, 0);
		}

		// 일본, 대만을 제외한 해외에서는
		// 엘프 캐릭터 생성시 샤프 마인드 스킬을 준다.
		if (
			GetLocale().LowerCase() != `japan`.LowerCase()	// 일본 아니고
			&& GetLocale().LowerCase() != `taiwan`.LowerCase()	// 대만도 아닐 때
		)
		{
			me.KnowSkill(23011);	// 샤프 마인드 스킬
		}

		//엘프에게 죽은 척 하기는 기본
		me.KnowSkill(50016);
		me.OpenSkill(50016);
	}
	else
//	if (me.IsHuman())
	{
		//뉴비퀘스트- 나오의 소개장
		// G3S4 begin 티르 코네일 초반 퀘스트 변경
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
				// 메모리얼 캐릭터는 튜토리얼 퀘스트를 받지 않는다.
				if (!me.IsQuestTried(200201) && !me.HaveKeyword(`memorial_character`))
				{
					me.AddGameQuest(200201, 0);
				}
			}
			else
			{
				if (!me.IsQuestTried(200004) && !me.IsQuestTried(200101) && !me.IsQuestTried(202001) && !me.IsQuestTried(212001) && !me.IsQuestTried(202062))
				{
					if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`)) //2010 new 튜토리얼 적용받는다면
					{
						if (!me.IsQuestTried(202062) && !me.HaveKeyword(`memorial_character`))
						{
							me.AddGameQuest(202062, 0);
						}
						me.PlayCutScene(`into_the_Tir_Chonaill`, 0);
					}
					else //2010 new 튜토리얼 이전
					{
						if (
							((GetVersion()<702) && ((GetLocale().LowerCase() == `korea`) || (GetLocale().LowerCase() == `japan`)))
							|| ((GetVersion()<701) && ((GetLocale().LowerCase() == `taiwan`) || (GetLocale().LowerCase() == `china`)))
						)	// 한국, 일본은 G7S2 이전이고 대만 중국은 G7S1 이전인 경우 기존 퀘스트 지급
						{
							me.AddGameQuest(200101, 0);
						}
						// 메모리얼 캐릭터는 튜토리얼 퀘스트를 받지 않는다.
						else if (((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`))) && (!me.IsQuestTried(212001) && !me.HaveKeyword(`memorial_character`)))
						{
							me.AddGameQuest(212001, 0);
						}
						else if (!me.IsQuestTried(202001) && !me.HaveKeyword(`memorial_character`))
						{
							me.AddGameQuest(202001, 0);
						}
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

	// G12S2 자이언트 리뉴얼 이벤트
	// 이벤트 기간 동안 자이언트로 환생 or 생성 하면 지정된 키워드를 준다.
	// by kirie, 2010.04.19
	if((IsCurrentEvent(`g12s2_giantrenewalevent_korea`)) && me.IsGiant())
	{
		if(!me.HaveKeyword (`2010_giant_renewal1_korea`) && !me.HaveKeyword (`2010_giant_renewal2_korea`))
		{
			me.AddKeyword(`2010_giant_renewal1_korea`);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnLogin(character me)
// : PC가 월드에 로그인 할 때마다 불리는 함수이다.
// : 이 함수는 클라이언트 사이드에서도 완전히 로그인이 되었을 때 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오

	//201150 퀘스트 2단계인데, 3단계 완료 키워드를 받았다면 지웠다가 다시 준다.  - 화이트 데이 이벤트가 종료되어 제거
	/*if(me.GetCompletedQuestObjectiveCount(201150) == 2 &&  me.HaveKeyword(`whiteday2010_korea_couple_suit`))
	{
		me.RemoveKeyword(`whiteday2010_korea_couple_suit`);
		me.AddKeyword(`whiteday2010_korea_couple_suit`);

	}
	*/

	///////////////////////////////////////////////////////////////////
	//
	//       오류 복구는 아래에서 합니다.
	//	  주로 키워드나 퀘스트가 꼬여서 해결해야할 경우
	//       습득해야할 키워드나 타이틀, 퀘스트 등을 못 얻었을 경우
	//
		RestoreErrorOnLogin(me);
	//
	///////////////////////////////////////////////////////////////////

	///////////////////////////////////////////////////////////////////
	//
	//      반신화 모드를 설정  G10 클리어 유저
	//
		SetDemiGodType(me);
	//
	///////////////////////////////////////////////////////////////////

	///////////////////////////////////////////////////////////////////
	//
	//     로그인 시에 튜토리얼 관련 처리는 모두 이곳에서 해줍니다.
	//	죽은척, 종이비행기, 돌던지기등의 초반 컨텐츠를 포함합니다.
	//
		OnLoginTutorial(me) extern (`data/script/event/tutorial_event.mint`);
	//
	///////////////////////////////////////////////////////////////////



	///////////////////////////////////////////////////////////////////
	//
	//     로그인 시에 각종 이벤트 관련 처리는 모두 이곳에서 해줍니다.
	//
		OnLoginEvent(me) extern (`data/script/event/game_event.mint`);
	//
	///////////////////////////////////////////////////////////////////



	///////////////////////////////////////////////////////////////////
	//
	//      테스트 서버 관련 스킬/퀘스트  세팅은 아래에서 해줍니다.
	//
		OnLogInTestServer(me) extern (`data/script/event/testserver_setting.mint`);
	//
	///////////////////////////////////////////////////////////////////

	// 팔라딘 RP를 완료 하지 않으면 팔라딘의 서를 다시 준다.
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))
	{
		if ((!me.HaveKeyword(`paladin_RP_G2_overseas`)) && (me.GetItemNoWithClassId(91147)==0) && me.HaveQuestTemplate(222001))
		{
			me.DoStript(`additemex(id:91147)`); //
		}
	}

	// g13 이미 클리어한 유저는 저널 습득
	if(!me.AchievementHas(1137) && me.HaveKeyword(`g13_complete`))
	{
		me.AchievementAdd(1137);
	}


	// G13 메인스트림 시작하면 변동 요소
	if (IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`))
	{
		// 튜토리얼 리뉴얼 적용 안 받는 유저는 레벨 6이 되면 G13 시작
		if ((me.GetLevel() + me.GetCumLevel())>=6 && !me.HaveKeyword(`character_new_tutorial_2010`) &&
		!me.HaveKeyword(`g13`) && !me.HaveKeyword(`g13_complete`) && !me.IsQuestCompleted(294201))
		{
			// G13은 무조건 시작
			me.AddKeyword(`g13`);
			me.PlayCutScene(`C4G13_prologue_Morrighan`);
			if (IsDevelopment())
			{
				me.AddGameQuest(294201, 2);
			}
			else
			{
				me.AddGameQuest(294201, 20);
			}
		}
		// 테스트 서버용 임시 스크립트. 튜토리얼 리뉴얼 적용됐는데 메인스트림이 리셋되버림
		else if ((me.GetLevel() + me.GetCumLevel())>=15 && IsTestServer())
		{
			// G13은 무조건 시작
			if(!me.HaveKeyword(`g13`) && !me.HaveKeyword(`g13_complete`) && !me.IsQuestCompleted(294201))
			{
				me.AddKeyword(`g13`);
				me.PlayCutScene(`C4G13_prologue_Morrighan`);
				if (IsDevelopment())
				{
					me.AddGameQuest(294201, 2);
				}
				else
				{
					me.AddGameQuest(294201, 20);
				}
			}
		}
		else
		//G13 클리어 했는데 g9 진행한 적 없으면 g9 시작
		if(me.HaveKeyword(`g13_complete`) && !me.HaveKeyword(`g9`) && !me.HaveKeyword(`g9_complete`))
		{
			// 메모리얼이면 누렙 관계없이 바로 시작.
			if((me.GetCumLevel() + me.GetLevel()) >= 10 && !me.HaveKeyword(`memorial_character`))
			{
				me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
			}
			else if((me.GetCumLevel() + me.GetLevel()) >= 3 && me.HaveKeyword(`memorial_character`))
			{
				me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
			}
		}

		// 기존 캐릭터는 하던대로 간다.
		else
		{
			// 종족 불문하고 누렙 10 이상에 로그인 하면 컷신을 본다.
			if (	(IsEnable(`featureG9MainStream`) extern (`data/script/features.mint`))
				&& !me.HaveKeyword(`g9`)
				&& !me.HaveKeyword(`g9_complete`)
				&& me.IsMainStreamPlayablePlayer(9))
			{
				// 메모리얼이면 누렙 관계없이 바로 시작.
				if((me.GetCumLevel() + me.GetLevel()) >= 10 && !me.HaveKeyword(`memorial_character`))
				{
					me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
				}
				else if((me.GetCumLevel() + me.GetLevel()) >= 3 && me.HaveKeyword(`memorial_character`))
				{
					me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
				}
			}
		}
	}
	else
	{

		// G9 메인스트림 원래 규칙대로 시작
		// 종족 불문하고 누렙 10 이상에 로그인 하면 컷신을 본다.
		if (	(IsEnable(`featureG9MainStream`) extern (`data/script/features.mint`))
			&& !me.HaveKeyword(`g9`)
			&& !me.HaveKeyword(`g9_complete`)
			&& me.IsMainStreamPlayablePlayer(9))
		{
			// 메모리얼이면 누렙 관계없이 바로 시작.
			if((me.GetCumLevel() + me.GetLevel()) >= 10 && !me.HaveKeyword(`memorial_character`))
			{
				me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
			}
			else if((me.GetCumLevel() + me.GetLevel()) >= 3 && me.HaveKeyword(`memorial_character`))
			{
				me.PlayCutScene(`C3G9S1_S#1_call_of_adniel`);
			}
		}
	}


	// G11 메인스트림 시작
	// G10 클리어 키워드 있고, G11을 시작 안 했으면 메인스트림 전용 장서관 리전으로 보낸다.
	if ( (IsEnable(`featureG11MainStream`) extern (`data/script/features.mint`))
		&& !me.HaveKeyword(`g11`) && !me.HaveKeyword(`g11_complete`) && me.HaveKeyword(`g10_complete`))
	{
		me.PlayCutScene(`C3G11_S#1_1_meeting_buchanan`);
	}


//=============================================================================================================================


	// G12 메인스트림 시작
	// G11 클리어 키워드 있고, G12를 시작 안 했으면
	else if ( (IsEnable(`featureG12MainStream`) extern (`data/script/features.mint`))
		&& !me.HaveKeyword(`g12`) && !me.HaveKeyword(`g12_complete`) && me.HaveKeyword(`g11_complete`)
		&& !IsTestServer())		// 테섭은 안 준다.
	{
		me.PlayCutScene(`C3G12_S#1_opening`);
	}




	// G12 메인스트림 중 아이바 컷신 틀어준다.
	else if ( (IsEnable(`featureG12MainStream`) extern (`data/script/features.mint`))
	&& me.HaveKeyword(`g12`)
	&& me.IsQuestCompleted(293011)
	&& !me.IsQuestTried(293012)
	&& !me.HaveQuestTemplate(293012)
	&& !IsTestServer())		// 테섭은 안 준다.

//	&& IsDevelopment())      // 정섭 탈 때에는 지워 주기로 해요 개발

	{

		me.PlayCutScene(`C3G12_S#6_eabha_dream1`);


	}


	// G12 메인스트림 중 두 번째 아이바 컷신 틀어준다.
	else if ( (IsEnable(`featureG12MainStream`) extern (`data/script/features.mint`))
	&& me.HaveKeyword(`g12`)
	&& me.IsQuestCompleted(293012)
	&& !me.IsQuestTried(293013)
	&& !me.HaveQuestTemplate(293013)
	&& !IsTestServer())	// 테섭은 안 준다.

//	&& IsDevelopment())      // 정섭 탈 때에는 지워 주기로 해요 개발

	{
		me.PlayCutScene(`C3G12_S#8_eabha_dream2`);


	}


	// G12 메인스트림 중 세 번째 아이바 컷신 틀어준다.
	else if ( (IsEnable(`featureG12MainStream`) extern (`data/script/features.mint`))
	&& me.HaveKeyword(`g12`)
	&& me.IsQuestCompleted(293013)
	&& !me.IsQuestTried(293014)
	&& !me.HaveQuestTemplate(293014)
	&& !IsTestServer())	// 테섭은 안 준다.

//	&& IsDevelopment())      // 정섭 탈 때에는 지워 주기로 해요 개발

	{
		me.PlayCutScene(`C3G12_S#10_eabha_dream3`);


	}




	// G12 히트 버스트 못 얻었을 때는 스킬 넣어준다.
	else if ( (IsEnable(`featureG12MainStream`) extern (`data/script/features.mint`))
	&& !me.IsKnownSkill(35014)
	&& me.IsQuestCompleted(293004))
	{
		me.AddSkill(35014,0);
	}


//=============================================================================================================================



	// G8 메인스트림 시작
	// g7 을 클리어하거나 스킵한 후에 로그인 하면 시작된다
	else if (me.IsMainStreamPlayablePlayer(8) && GetVersion() >= 801)
	{
		if (me.HaveKeyword(`g7s4_Complete`) && !me.HaveKeyword(`g8s1`) && !me.HaveKeyword(`g8s1_complete`))
		{
			me.PlayCutScene(`g8s1_cruaich`, 0);
		}
		else
		if (!me.IsQuestTried(280200) && me.HaveKeyword(`portal_cor`) && !me.IsQuestTried(280201) &&!me.HaveKeyword(`g8s1_Complete`))
		{
			if(IsDevelopment())
			{
				me.AddGameQuest(280200,1);
			}
			else
			{
				me.AddGameQuest(280200,6);
			}
		}
		 // g8s1 스토리 최종보스를 무찔르고 다음에 로그인하면 에필로그 컷신을 보여준다.
		else if(me.HaveKeyword(`g8s1_kill_red`))
		{
			me.AddKeyword(`g8s1_complete`);

			me.RemoveKeyword(`g8s1_kill_red`);
			me.RemoveKeyword(`Elf_oblivion`);
			me.RemoveKeyword(`Give_Ruway_Large_Fish`);
			me.RemoveKeyword(`courcle_heart`);
			me.RemoveKeyword(`g7s4`);
			me.RemoveKeyword(`g8s1`);
			me.RemoveKeyword(`Red_Dragon`);
			me.RemoveKeyword(`g8s1_taunes_keep`);
			me.RemoveKeyword(`g8s1_03_02`);
			me.RemoveKeyword(`g8s1_airballoon_event`);

			me.PlayCutScene(`g8s1_ending`, 0);
		}
	}





	// G9S2 안드라스 스토리 퀘스트 시작
	// G9 메인스트림의 프롤로그를 클리어한 누렙 20 이상 캐럭터가 로그인하면 퀘스트 시작.

	if (	(IsEnable(`featureAndrasStroyQuest`) extern (`data/script/features.mint`)) && me.HaveKeyword(`g9_complete`))
	{
		me.AddGameQuest(290301, 6);	// 1분 후에 퀘스트 배달
	}

	/*
	if (	(IsEnable(`featureAndrasStroyQuest`) extern (`data/script/features.mint`))
		&& me.IsQuestCompleted(290001)
		&& ((me.GetCumLevel() + me.GetLevel()) >= 20))
	{
		me.AddGameQuest(290301, 6);	// 1분 후에 퀘스트 배달
	}
	*/


	// G10S2 이멘 마하의 참극 스토리 퀘스트 시작
	// G9 메인스트림 중 성전기사단 290006을 클리어한 누렙 20 이상 캐릭터가 로그인하면 퀘스트 시작
	if (	(IsEnable(`featureAlchemistQuest`) extern (`data/script/features.mint`))
		&& me.IsQuestCompleted(290006)
		&& ((me.GetCumLevel() + me.GetLevel()) >= 20)
		&& !IsTestServer())		// 테섭은 안 준다.
	{
		me.AddGameQuest(291101, 6);	// 1분 후에 퀘스트 배달
	}

	// G11S2 제너 스토리 퀘스트 시작
	// G11 메인스트림 클리어 후에 로그인하면 준다.
	if (	(IsEnable(`featureG11S2jenna`) extern (`data/script/features.mint`))
		&& me.HaveKeyword(`g11_complete`)
		&& !IsTestServer())		// 테섭은 안 준다.
	{
		me.AddGameQuest(292101, 6);	// 1분 후에 퀘스트 배달
	}

	// 제너 스토리 퀘스트를 클리어하고 로그인하면 시작된다.
	if (	(IsEnable(`featureG11S2jenna`) extern (`data/script/features.mint`))
		&& me.HaveKeyword(`g11_s2_jenna_complete`)
		&& !IsTestServer())		// 테섭은 안 준다.
	{
		me.AddGameQuest(292201, 6);	// 1분 후에 퀘스트 배달
	}



	// g13 리뉴얼부터는 레네스 안 받는다.
	if (!IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`) && IsEnable(`featureRenesPlay`) extern (`data/script/features.mint`))
	{
		if(!me.HaveQuestTemplate(206003) && !me.GetEgoType() == 9 && !me.GetEgoType() == 10 && !me.GetEgoType() == 11 && (me.GetLevel() + me.GetCumLevel()) >= 10)
		{
			me.AddGameQuest(206003, 10);		// 100초 뒤에
		}
	}






	//G7S4 아트라타와 타우네스 퀘스트 시작
	if( GetVersion()>=704 && me.IsMainStreamPlayablePlayer(7)
		&& me.HaveKeyword(`g7s3_Complete`) && !me.HaveKeyword(`g7s4`) && !me.HaveKeyword(`g7s4_Complete`))
	{
		if((me.IsHuman() && me.GetSupportRace()==1) || me.IsElf())
		{
			me.RemoveKeyword(`g7s3_Complete`);
			me.RemoveKeyword(`jungle_ruins`);
			me.AddKeyword(`g7s4`);
			me.AddGameQuest(280101,1);
		}
		if((me.IsHuman() && !me.GetSupportRace()==1) || me.IsGiant())
		{
			me.RemoveKeyword(`g7s3_Complete`);
			me.RemoveKeyword(`jungle_ruins`);
			me.AddKeyword(`g7s4`);
			me.AddGameQuest(280103,1);
		}
	}

	//G7S4 아트라타와 타우네스 퀘스트 진행중
	if(me.HaveKeyword(`g7s4_02`) && !me.HaveQuestTemplate(280104) && !me.IsQuestTried(280104))
	{
		if(IsDevelopment())
		{
			me.AddGameQuest(280104,0);   // 개발 서버면 바로 준다.
		}
		else
		{
			me.AddGameQuest(280104,30);  // 아니면 5분 후에
		}
	}

	//G7S4 아트라타 RP 를 클리어 하고 로그인 시에
	if(me.HaveKeyword(`g7s4_07`) && !me.HaveQuestTemplate(280108) && !me.IsQuestTried(280108))
	{
		if(IsDevelopment())
		{
			me.AddGameQuest(280108,0);   // 개발 서버면 바로 준다.
		}
		else
		{
			me.AddGameQuest(280108,12);  // 아니면 2분 후에
		}
	}


	// 엘프 자이언트 야수화 유료 유저 퀘스트 처리 - uhihiho

	if (me.IsQuestCompleted(260005) || me.IsQuestCompleted(260006) || me.IsQuestCompleted(260007))
	{
		me.RemoveKeyword(`g6_common_PatternInvestigation`);	// 키워드 삭제는 유무료 상관없이 일단 먼저 처리
	}

	if (
	!IsTestServer() &&
	me.IsUsableServiceBeast() &&
	(me.IsElf() || me.IsGiant())
	)
	{
		if ((me.IsQuestCompleted(260002)) && (!me.IsQuestTried(260003)))
		{
			me.AddGameQuest(260003,0);
		}
		if ((me.IsQuestCompleted(260003)) && (!me.IsQuestTried(260011)))
		{
			me.AddGameQuest(260011,0);
		}
		if (me.IsQuestCompleted(260005) || me.IsQuestCompleted(260006) || me.IsQuestCompleted(260007))
		{
			me.RemoveKeyword(`g6_common_PatternInvestigation`);
			if (me.IsElf() && !me.IsQuestTried(260008))
			{
				me.AddGameQuest(260008,0);
				me.AddKeyword(`g6_elf_07`);		// 발레스 잠입
			}
			else if (me.IsGiant() && !me.IsQuestTried(270003))
			{
				me.AddGameQuest(270003,0);
			}
		}
		if ((me.IsQuestCompleted(260008)) && (!me.IsQuestTried(260009)))
		{
			me.AddGameQuest(260009,0);
		}
		if ((me.IsQuestCompleted(260009)) && (!me.IsQuestTried(260010)))
		{
			me.AddGameQuest(260010,0);
		}
		if ((me.IsQuestCompleted(270003)) && (!me.IsQuestTried(270004)))
		{
			me.AddGameQuest(270004,0);
		}
	}


	//합주 액션
	//G6S2부터 합주 액션을 준다
	//
	if(me.GetSkillLevel(10003)>= 4 && me.GetSkillLevel(10006)>= 4)
	{
		// DebugOut(`악기연주 C, 음지 C이니까 합주 퀘스트를 주자`);
		if (
			!me.IsQuestTried(200468)
			&& (IsEnable(`featureMusicJam`) extern (`data/script/features.mint`))
		)
		{
			// DebugOut(`G6S2이고 현재 합주 액션 입수 퀘스트를 받지 않았다`);
			if(me.GetSkillLevel(10003)>= 4 && me.GetSkillLevel(10006)>= 4)
			{
				// DebugOut(`퀘스트를 준다`);
				me.AddGameQuest(200468,1);
			}
		}
	}


	// 레인지 컴뱃 마스터리 9랭 이상이면 스플린터 샷 퀘 공급
	if (IsEnable(`featureSplinterShot`) extern (`data/script/features.mint`) && me.GetSkillLevel(21001) >= 7 && !me.IsUsableSkill(22011) && !me.HaveQuestTemplate(20114))
	{
		me.AddGameQuest(20114,1);
	}

	// 체력 150 이상이면 분신 퀘 제급
	if (IsEnable(`featureBunshin`) extern (`data/script/features.mint`) && me.GetStr() >= 150 && !me.IsUsableSkill(23058) && !me.HaveQuestTemplate(20117))
	{
		DebugOut(`체력 150이상이므로 분신퀘 공급`);

		if(me.HaveKeyword(`use_soulstone`))
		{
			DebugOut(`이전에 가지고있던 use_soulstone 키워드 삭제`);
			me.RemoveKeyword(`use_soulstone`);
		}

		if(me.HaveKeyword(`double_gore_kill`))
		{
			DebugOut(`이전에 가지고있던 double_gore_kill 키워드 삭제`);
			me.RemoveKeyword(`double_gore_kill`);
		}

		me.AddGameQuest(20117,1);

	}
	//////////////////////////////////////////////////////////////////////////////////////
	// 어드밴스드 플레이용 스크립트입니다.
	// 캐릭터는 하루에 한 번씩 부엉이로부터 특수한 선물을 받습니다.
	// 선물의 종류는 요일마다 다릅니다.
	//일주일 : 10080분
	//하루 : 1440분
	//////////////////////////////////////////////////////////////////////////////////////
	meta_array strGift;
	meta_array strGiftForPC;

	string strRandomGift;
	string strRandomGiftForPC;

	// 0: 일요일, 1: 월요일 ... 6: 토요일, -1 : 선물 못받는다.
	int iDay = -1;
	iDay = me.PrepareForAPGift();
	if (iDay >= 0 && iDay < 7)
	{
		if (me.IsHuman())
		{
			GetAdvancedItemListForHumanPersonal(strGift);
			GetAdvancedItemListForHumanPremiumPC(strGiftForPC);
		}
		else if (me.IsElf())
		{
			GetAdvancedItemListForElfPersonal(strGift);
			GetAdvancedItemListForElfPremiumPC(strGiftForPC);
		}
		else if (me.IsGiant())
		{
			GetAdvancedItemListForGiantPersonal(strGift);
			GetAdvancedItemListForGiantPremiumPC(strGiftForPC);
		}

		int i = 0;
		for (i = 0; i < strGift.GetSize(); i++)
		{
			strRandomGift = strRandomGift + (string)strGift.Get(i) + `|`;	//위의 목록 전부 합쳐서 랜덤하게 주기 위해서
		}
		for (i = 0; i < strGiftForPC.GetSize(); i++)
		{
			strRandomGiftForPC = strRandomGiftForPC + (string)strGiftForPC.Get(i) + `|`;	//위의 목록 전부 합쳐서 랜덤하게 주기 위해서
		}

		if (me.IsUsableServiceAdvancedItem())
		{
			me.ShowAPGiftView((string)strGift.Get(iDay), strRandomGift);
		}
		else
		{
			me.ShowAPGiftView((string)strGiftForPC.Get(iDay), strRandomGiftForPC);
		}
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// G2 팔라딘편의 시작
	//////////////////////////////////////////////////////////////////////////////////////

	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& me.IsMainStreamPlayablePlayer(2)
		&& GetVersion() >= 200 	//G2 봉인품 by HanStone		//레벨10 제한 제거하였습니다. by qwerty.
	)
	{
		if (	!me.HaveKeyword(`g2`) &&
			me.HaveKeyword(`g1_complete`) &&
			!me.HaveKeyword(`g2_complete`)
		   )
		{
			if (	(GetLocale().LowerCase() == `korea`.LowerCase())
				&& !me.HaveKeyword(`g9_complete`)
				&& !me.HaveKeyword(`g2_start`)
				&& GetVersion() >= 901)
			{
			}
			else
			{
				//G2_챕터1의 시작
				me.PlayCutScene(`G2_01_a_Morrighan`, 0);
			}
		}

		else
		if (me.HaveKeyword(`g2`) && me.HaveKeyword(`g2_09`)) //G2 봉인품
		{
			//G2_챕터9
			me.PlayCutScene(`G2_09_a`, 0);
		}

		else
		if (me.HaveKeyword(`g2`) && me.HaveKeyword(`g2_20`)) //G2 봉인품
		{
			me.PlayCutScene(`G2_20_a`, 0);
		}
	}

	//G2 이상형 찾기 간략화 된 퀘스트로 교체하는 스크립트 by hanstone@nexon.co.kr

	//////////////////////////////////////////
	/////////////////////////티르 코네일 이상형 찾기 처리
	if((me.IsQuestCompleted(220031) || me.IsQuestCompleted(220032))
	&& (!me.IsQuestTried(220033) || !me.IsQuestTried(220034))) //티르 코네일 이상형 퀘스트 둘 중 하나를 끝냈는데 다음 구 퀘스트가 아직 예약이 안되었다
	{
		// DebugOut(`티르 이상형 퀘스트 둘 중 하나를 완료했으니까 다 한걸로 쳐준다`);
		int MemoItemID;
		for (MemoItemID=74101 ; MemoItemID<=74116 ;  MemoItemID++)
		{
			me.RemoveItemCls(MemoItemID); //삭제
		}

		me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220032);
		me.DoStript(`modify(exp,1,3000)`); //경험치 3000
		me.IncreaseMoney(4000); //돈 4000
		me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

		me.AddGameQuest(220055,1); //신 퀘스트로 바꿔 등록
	}
	else
	if ((me.IsQuestTried(220031) && !me.IsQuestCompleted(220031))
	|| (me.IsQuestTried(220032) && !me.IsQuestCompleted(220032)))
	{
		// DebugOut(`티르코네일 이상형 찾기 퀘스트를 진행중이었다`);
		//3개 이상 쪽지를 모았으면 완료
		//3개 미만이면 남은 쪽지를 제거하고 돌려준다.

		int CountMemo=0;
		int MemoItemID;

		for (MemoItemID=74101 ; MemoItemID<=74116 ;  MemoItemID++)//저 퀘스트에 필요한 쪽지를 모았나 검색해서
		{
			if (me.GetItemNoWithClassId(MemoItemID)!=0 && CountMemo<3)
			{
				++CountMemo; //3개까지 모았나 확인한다
			// DebugOut(`쪽지 아이디:`+ToString(MemoItemID)+` 티르코네일 용 쪽지의 수:`+ToString(CountMemo));
			}
			me.RemoveItemCls(MemoItemID); //삭제
		}

		if (CountMemo==3)
		{
			// DebugOut(`티르 코네일 퀘스트를 3개까지 진행했다`);
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032);

			me.DoStript(`modify(exp,1,3000)`); //경험치 3000
			me.IncreaseMoney(4000); //돈 4000

			me.AddGameQuest(220055,1); //던바튼 이상형 찾기를 예약한다
			me.DoStript(`additemex(id:40045 col2:334433)`); //원래 주던 보상을 준다
			me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
		}
		else
		{
			if(CountMemo!=0)
			{
				me.AddItem(74161,CountMemo); //새로 구해야 할 이상형 퀘스트 만큼을 준다.
			}
			// DebugOut(`쪽지를 이만큼 줘야한다`+ToString(CountMemo));
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032);
			me.DoStript(`additemex(id:74166 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
			me.AddGameQuest(220054,1); //신 퀘스트로 바꿔 등록
		}
	}

	//////////////////////////////////////////
	/////////////////////////던바튼 이상형 찾기 처리
	if((me.IsQuestCompleted(220033) || me.IsQuestCompleted(220034))
	&& (!me.IsQuestTried(220035) || !me.IsQuestTried(220036))) //이상형 퀘스트 둘 중 하나를 끝냈는데 다음 구 퀘스트가 아직 예약이 안되었다
	{
		// DebugOut(`던바튼 퀘스트 둘 중 하나를 완료했으니까 다 한걸로 쳐준다`);

		int MemoItemID;
		for (MemoItemID=74118 ; MemoItemID<=74127;  MemoItemID++)
		{
			me.RemoveItemCls(MemoItemID); //삭제
		}

		me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220034);
		me.DoStript(`modify(exp,1,3000)`); //경험치 3000
		me.IncreaseMoney(4000); //돈 4000

		me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
		me.AddGameQuest(220056,1); //신 퀘스트로 바꿔 등록
	}
	else
	if((me.IsQuestTried(220033) && !me.IsQuestCompleted(220034))
	|| (me.IsQuestTried(220034) &&!me.IsQuestCompleted(220034))) //던바튼 퀘스트를 진행중인 유저다
	{
		// DebugOut(`던바튼 첫번째 이상형 찾기 퀘스트를 진행중이었다`);
		//3개 이상 쪽지를 모았으면 완료
		//3개 미만이면 남은 쪽지를 제거하고 돌려준다.

		int CountMemo=0;
		int MemoItemID;

		for (MemoItemID=74118 ; MemoItemID<=74127;  MemoItemID++)//저 퀘스트에 필요한 쪽지를 모았나 검색해서
		{
			if (me.GetItemNoWithClassId(MemoItemID)!=0 && CountMemo<3)
			{
				++CountMemo; //3개까지 모았나 확인하지만, 이 퀘스트는 원래 3개 모으면 끝낼 수 있다.
			}
			me.RemoveItemCls(MemoItemID); //삭제
		}

		if (CountMemo==3)
		{
			// DebugOut(`던바튼 이상형 퀘스트를 3개까지 진행했다`);
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
			me.DoStript(`modify(exp,1,3000)`); //경험치 3000
			me.IncreaseMoney(4000); //돈 4000

			me.AddGameQuest(220056,1); //반호르 이상형 찾기를 예약한다
			me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

		}
		else
		{
			if(CountMemo!=0)
			{
				me.AddItem(74162,CountMemo); //새로 구해야 할 이상형 퀘스트 만큼을 기존에 있던 것 만큼 준다.
			}
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리

			me.DoStript(`modify(exp,1,3000)`); //경험치 3000
			me.IncreaseMoney(4000); //돈 4000

			me.DoStript(`additemex(id:74166 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

			me.AddGameQuest(220055,1);  //신 퀘스트로 바꿔 등록
		}
	}

	//////////////////////////////////////////
	/////////////////////////반호르 이상형 찾기
	if((me.IsQuestCompleted(220035) || me.IsQuestCompleted(220036))
	&& (!me.IsQuestTried(220037)||!me.IsQuestTried(220038))) //이상형 퀘스트 둘 중 하나를 끝냈는데 다음 구 퀘스트가 아직 예약이 안되었다
	{
		// DebugOut(`반호르 이상형 퀘스트 둘 중 하나 끝냈으니 다 한걸로 쳐주자`);
		int MemoItemID;
		for (MemoItemID=74129 ; MemoItemID<=74137 ;  MemoItemID++)
		{
			me.RemoveItemCls(MemoItemID); //삭제
		}

		me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리

		me.DoStript(`modify(exp,1,3000)`); //경험치 3000
		me.IncreaseMoney(4000); //돈 4000

		me.AddGameQuest(220057,1); //새 이멘 마하 이상형 찾기를 예약한다
		me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
	}
	else
	if ((me.IsQuestTried(220035) && !me.IsQuestCompleted(220035))
	|| (me.IsQuestTried(220036) && !me.IsQuestCompleted(220036)))
	{
		// DebugOut(`반호르 이상형 찾기 퀘스트를 진행중이었다`);
		//3개 이상 쪽지를 모았으면 완료
		//3개 미만이면 남은 쪽지를 제거하고 돌려준다.

		int CountMemo=0;
		int MemoItemID;

		for (MemoItemID=74129 ; MemoItemID<=74137 ;  MemoItemID++)//저 퀘스트에 필요한 쪽지를 모았나 검색해서
		{
			if (me.GetItemNoWithClassId(MemoItemID)!=0 && CountMemo<3)
			{
				++CountMemo; //3개까지 모았나 확인한다
			}
			me.RemoveItemCls(MemoItemID); //삭제
		}

		if (CountMemo==3)
		{
			// DebugOut(`반호르 이상형 퀘스트를 3개까지 진행했다`);
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리

			me.DoStript(`modify(exp,1,3000)`); //경험치 3000
			me.IncreaseMoney(4000); //돈 4000

			me.AddGameQuest(220057,1); //새 이멘 마하 이상형 찾기를 예약한다
			me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

		}
		else
		{
			if(CountMemo!=0)
			{
				me.AddItem(74163,CountMemo); //새로 구해야 할 이상형 퀘스트 만큼을 준다.
			}
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리
			me.AddGameQuest(220056,1); //신 퀘스트로 바꿔 등록
			me.DoStript(`additemex(id:74166 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

		}
	}
	//////////////////////////////////////////
	/////////////////////////이멘 마하 이상형 찾기
	if((me.IsQuestCompleted(220037) || me.IsQuestCompleted(220038)) && !me.IsQuestTried(220040)) // 이상형 퀘스트 둘 중 하나를 끝냈는데 다음 구 퀘스트가 아직 예약이 안되었다
	{
		// DebugOut(`이멘 마하 퀘스트를 하나 끝냈으니 다 한걸로 쳐준다`);

		int MemoItemID;

		for (MemoItemID=74139 ; MemoItemID<=74156 ;  MemoItemID++)//저 퀘스트에 필요한 쪽지를 모았나 검색해서
		{
			me.RemoveItemCls(MemoItemID); //삭제
		}
		me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220037); // 구 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(220038); // 구 퀘스트를 한 것으로 처리

		me.DoStript(`modify(exp,1,3000)`); //경험치 3000
		me.IncreaseMoney(4000); //돈 4000

		me.AddGameQuest(220040, 1);  //네일의 퀘스트 예약
		me.AddKeyword(`g2_23`);
		me.RemoveKeyword(`g2_22`);
		me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
	}
	else
	if ((me.IsQuestTried(220037) && !me.IsQuestCompleted(220037))
	||(me.IsQuestTried(220038) &&!me.IsQuestCompleted(220038)))
	{
		// DebugOut(`이멘 마하 이상형 찾기 퀘스트를 진행중이었다`);
		//3개 이상 쪽지를 모았으면 완료
		//3개 미만이면 남은 쪽지를 제거하고 돌려준다.

		int CountMemo=0;
		int MemoItemID;

		for (MemoItemID=74139 ; MemoItemID<=74156 ;  MemoItemID++)//저 퀘스트에 필요한 쪽지를 모았나 검색해서
		{
			if (me.GetItemNoWithClassId(MemoItemID)!=0 && CountMemo<3)
			{
				++CountMemo; //3개까지 모았나 확인한다
			}
			me.RemoveItemCls(MemoItemID); //삭제
		}

		if (CountMemo==3)
		{
			// DebugOut(`이멘 마하 퀘스트를 3개까지 진행했다`);
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220037); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220038); // 구 퀘스트를 한 것으로 처리

			me.DoStript(`modify(exp,1,3000)`); //경험치 3000
			me.IncreaseMoney(4000); //돈 4000

			me.AddGameQuest(220040, 1);  //네일의 퀘스트 예약
			me.AddKeyword(`g2_23`);
			me.RemoveKeyword(`g2_22`);
			me.DoStript(`additemex(id:74165 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모

		}
		else
		{
			if(CountMemo!=0)
			{
				me.AddItem(74164,CountMemo); //새로 구해야 할 이상형 퀘스트 만큼을 준다.
			}
			me.CleanQuestHistory(220031); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220032); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220033); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220034); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220035); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220036); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220037); // 구 퀘스트를 한 것으로 처리
			me.CleanQuestHistory(220038); // 구 퀘스트를 한 것으로 처리
			me.AddGameQuest(220057,1); //신 퀘스트로 바꿔 등록
			me.DoStript(`additemex(id:74166 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
		}
	}

//G2 이상형 찾기 간략화 된 퀘스트로 교체하는 스크립트의 끝

	//////////////////////////////////////////////////////////////////////////////////////
	// G3 다크나이트의 시작
	//////////////////////////////////////////////////////////////////////////////////////

	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& me.IsMainStreamPlayablePlayer(3)
		&& GetVersion() >= 300
	)
	{
		if (!me.HaveKeyword(`g3`) &&
			me.HaveKeyword(`g2_complete`) &&
			!me.HaveKeyword(`g3_complete`)
		   )
		{
			if (	(GetLocale().LowerCase() == `korea`.LowerCase())
				&& !me.HaveKeyword(`g9_complete`)
				&& !me.HaveKeyword(`g3_start`)
				&& GetVersion() >= 901)
			{
			}
			else
			{
				//g3_챕터1의 시작
				me.PlayCutScene(`g3_01_a_Morrighan`, 0);
			}
		}
		else
		if (me.HaveKeyword(`g3`) && me.HaveKeyword(`g3_13_TalkedToSeumas`))
		{
			//g3_챕터14
			me.RemoveKeyword(`g3_13_TalkedToSeumas`);
			me.RemoveKeyword(`g3_13`);
			//me.RemoveKeyword(`g3_11_Not_Talk_Kristell_Yet`);
			me.RemoveKeyword(`g3_11_Talk_Kristell_Already`);
			me.AddKeyword(`g3_15`);
			me.AddKeyword(`g3_14_PreventionOfResurrection`);
			me.PlayCutScene(`g3_14_a_Morrighan`, 0);
		}
	}

//G3 성별 체크
	if(me.HaveKeyword(`g3_CheckTransGenderStart`))
	{
		if(me.HaveKeyword(`g3_LoveStory_StartAsMale`) && me.IsFemale())
		{
			me.AddKeyword(`g3_LoveStory_TransGender`);
			me.RemoveKeyword(`g3_LoveStory_StartAsMale`);
			me.RemoveKeyword(`g3_CheckTransGenderStart`);
		}

		if(me.HaveKeyword(`g3_LoveStory_StartAsFemale`) && !me.IsFemale())
		{
			me.AddKeyword(`g3_LoveStory_TransGender`);
			me.RemoveKeyword(`g3_LoveStory_StartAsFemale`);
			me.RemoveKeyword(`g3_CheckTransGenderStart`);

		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
	// 영혼의 포션 조제 퀘스트 교체
	// by jisangs, 2006/03/24
	//////////////////////////////////////////////////////////////////////////////////////
	if(
		(me.IsQuestTried(230019) && !me.IsQuestCompleted(230019)) // 영혼의 포션 퀘스트를 수행중이거나 완료 처리를 아직 안했다.
		&& GetVersion() >= 403
/*
		(
			((GetGeneration() == 4 && GetSeason() >= 3 || GetGeneration() >= 5)
			&& GetLocale().LowerCase() == `korea`.LowerCase())
			||
			((GetGeneration() == 4 && GetSeason() >= 1 || GetGeneration() >= 5)
			&& GetLocale().LowerCase() == `japan`.LowerCase())	// 일본 G4S1 패치 이후로 적용
		)
*/
	)
	{
		// DebugOut(`가지고 있는 구 영혼의 포션 퀘스트를 완료 처리하고, 신 영혼의 포션으로 교체한다.`);

		me.CleanQuestHistory(230019); // 구 퀘스트를 한 것으로 처리, 보상 없음 (신 퀘스트 완료시 보상을 주기 때문에)
//		me.DoStript(`modify(exp,1,500)`); //경험치 500
//		me.IncreaseMoney(2000); //돈 2000

		me.AddGameQuest(230047, 1);  // 신 영혼의 포션 퀘스트 예약
		me.DoStript(`additemex(id:74168 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
		me.DoStript(`additemex(id:75003 rewardview:true)`); // 영혼의 포션
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 팔라딘 신규 스킬 입수
	// 이곳의 코드는 2005년 09월 13일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////

	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& GetVersion() >= 303
		&& !IsTestServer()
		// && (IsDevelopment())
		// && me.IsMainStreamPlayablePlayer(3)
		&& (me.GetSkillLevel(40001) != 0) // 스피리트 오브 오더
		&& (me.GetSkillLevel(40011) == 0 || me.GetSkillLevel(40012) == 0 || me.GetSkillLevel(40013) == 0)) // 팔라딘 내츄럴 실드, 팔라딘 헤비 스탠더, 팔라딘 마나 리프랙터
	{
		if(me.HaveKeyword(`g2_complete`) && !me.HaveKeyword(`g2_jump`)) //g2_complete만 있고 g2_jump는 없는 정상 g3 유저
		{
			// addQuest(리다이어의 퀘스트 5페이지);
			if (IsDevelopment())
			{
				if ((!me.IsQuestCompleted(200084) && !me.IsQuestTried(200084))
					&& (!me.IsQuestCompleted(200085) && !me.IsQuestTried(200085)))
				{
					me.AddGameQuest(200084, 0); //0초
				}
			}
			else
			{
				if ((!me.IsQuestCompleted(200084) && !me.IsQuestTried(200084))
					&& (!me.IsQuestCompleted(200085) && !me.IsQuestTried(200085)))
				{
					me.AddGameQuest(200084, 3); //30초
				}
			}
		}
		else if(me.HaveKeyword(`g2_complete`) && me.HaveKeyword(`g2_jump`)) //g2_complete와 g2_jump를 모두 가지고 있는 g2 점프 유저
		{
			// addQuest(리다이어의 퀘스트 7페이지);
			if (IsDevelopment())
			{
				if ((!me.IsQuestCompleted(200084) && !me.IsQuestTried(200084))
					&& (!me.IsQuestCompleted(200085) && !me.IsQuestTried(200085)))
				{
					me.AddGameQuest(200085, 0); //0초
				}
			}
			else
			{
				if ((!me.IsQuestCompleted(200084) && !me.IsQuestTried(200084))
					&& (!me.IsQuestCompleted(200085) && !me.IsQuestTried(200085)))
				{
					me.AddGameQuest(200085, 3); //30초
				}
			}
		}
	}

	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& GetVersion() >= 304
		// && (IsDevelopment())
		// && me.IsMainStreamPlayablePlayer(3)
	)
	{
		if ((!me.IsQuestCompleted(200086) && !me.IsQuestTried(200086))
			&& (me.IsGuildMaster() || me.IsRegularGuildMember()))
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(200086, 0); //0초
			}
			else
			{
				// me.AddGameQuest(200086, 3); //30초
			}
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 이리아 남쪽 해안 어선 할인 승선권 퀘스트 이벤트
	// G4S4 (C2G4S3) 부터 투입된 원양 어선을 위해, 로그인하는 캐릭터에게 퀘스트를 날려줍니다.
	// 선원 지망생 타이틀을 갖고 있으면 퀘스트를 전달합니다.
	// 원양 어선 퀘스트는 포기 가능합니다.
	// 이곳의 코드는 2006년 04월 27일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////
	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& GetVersion() >= 404
		&& me.GetTitle()==36
		&& !me.IsQuestTried(200090)
	)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200090, 0); //0초
		}
		else
		{
			me.AddGameQuest(200090, 3); //30초
		}
	}
	//////////////////////////////////////////////////////////////////////////////////////
	// 페트라의 부탁 새 어장 탐사 이벤트
	// G5 이후 어선 조난을 당해서 콘누스로 흘러들어간다.
	// 포기 가능한 퀘스트
	// 이곳의 코드는 2006년 05월 18일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////
	// 인간만 by jisangs, 060601
	else if (
		me.IsHuman()	// 인간만
		&& GetVersion() >= 500
		&& me.GetTitle()==36
		&& !me.IsQuestTried(200091)
		&&(
			(
				!IsBridgeConstructedOnce(`RanoConnous_Bridge_1`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_2`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_3`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_4`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_5`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_6`)
				&& !IsBridgeConstructedOnce(`RanoConnous_Bridge_7`)
			)
		)
	)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200091, 0); //0초
		}
		else
		{
			me.AddGameQuest(200091, 3); //30초
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 이리아 남쪽 해안 어선 바닷속 고대 유물 낚기 퀘스트 이벤트
	// G7S3부터 로그인하는 캐릭터에게 퀘스트를 날려줍니다.
	// 선원 지망생 타이틀을 갖고 있으면 퀘스트를 전달합니다.
	// 쿠르클레의 탐험가 타이틀을 갖고 있으면 퀘스트를 전달합니다.
	// 원양 어선 퀘스트는 포기 가능합니다.
	// 이곳의 코드는 2007년 09월 18일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////

	if (
		GetVersion() >= 703
		&& me.IsSelectableTitle(36)
		&& me.IsSelectableTitle(71)
		&& !me.IsQuestTried(200099)
	)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(200099, 0); //0초
		}
		else
		{
			me.AddGameQuest(200099, 3); //30초
		}
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 다크나이트 입수
	// 이곳의 코드는 2005년 11월 14일 작성되었습니다.
	//////////////////////////////////////////////////////////////////////////////////////

	// 인간만 by jisangs, 060601
	if (
		me.IsHuman()	// 인간만
		&& !IsTestServer()
		&& GetVersion() >= 304 //G3S4 이후
		// && IsDevelopment()
		// && me.IsMainStreamPlayablePlayer(3)
		&& me.HaveKeyword(`g3_complete`) // g3_complete 사용자
		&& (me.GetSkillLevel(40001) != 0) // 스피리트 오브 오더
		&& (!me.HaveKeyword(`G3_DarkKnight_Start_hidden`) && !me.HaveKeyword(`G3_DarkKnight_Complete_hidden`)))
	{
		int Questdelay = 60;

		if (IsDevelopment())
		{
			Questdelay = 0;
		}
		me.AddGameQuest(230101, Questdelay); //0초
	}


	// 엘프 스킬랭크업/나이/레벨업 퀘스트 지급
	if (me.IsElf())
	{
		//컴뱃 B
		if (me.GetSkillLevel(23002) >= 5 && !me.IsQuestTried(200342))
		{
			me.AddGameQuest(200342, 10);
		}
		//스매시 A
		if (me.GetSkillLevel(20002) >= 6 && !me.IsQuestTried(200343))
		{
			me.AddGameQuest(200343, 10);
		}
		//카운터 B
		if (me.GetSkillLevel(20003) >= 5 && !me.IsQuestTried(200344))
		{
			me.AddGameQuest(200344, 20);
		}
		//윈드밀 D
		if (me.GetSkillLevel(22001) >= 3 && !me.IsQuestTried(200345))
		{
			me.AddGameQuest(200345, 15);
		}
		//레인지마스터리 C
		if (me.GetSkillLevel(21001) >= 4 && !me.IsQuestTried(200346))
		{
			me.AddGameQuest(200346, 10);
		}
		//매그넘샷 D
		if (me.GetSkillLevel(21002) >= 3 && !me.IsQuestTried(200347))
		{
			me.AddGameQuest(200347, 10);
		}
		//힐링 E
		if (me.GetSkillLevel(30006) >= 2 && !me.IsQuestTried(200348))
		{
			me.AddGameQuest(200348, 10);
		}
		//악기연주 E
		if (me.GetSkillLevel(10003) >= 2 && !me.IsQuestTried(200349))
		{
			me.AddGameQuest(200349, 10);
		}
		//작곡 F
		if (me.GetSkillLevel(10005) >= 1 && !me.IsQuestTried(200350))
		{
			me.AddGameQuest(200350, 10);
		}
		//음악지식 E
		if (me.GetSkillLevel(10006) >= 2 && !me.IsQuestTried(200351))
		{
			me.AddGameQuest(200351, 15);
		}
		//캠프파이어 F
		if (me.GetSkillLevel(10008) >= 1 && !me.IsQuestTried(200352))
		{
			me.AddGameQuest(200352, 40);
		}
		//옷만들기 랭크 D
		if (me.GetSkillLevel(10001) >= 3 && !me.IsQuestTried(200353))
		{
			me.AddGameQuest(200353, 15);
		}
		//방직 D
		if (me.GetSkillLevel(10011) >= 3 && !me.IsQuestTried(200354))
		{
			me.AddGameQuest(200354, 20);
		}

		//레벨 15 일때 레벨 20까지 올려라
		if (me.GetLevel() >= 15 && !me.IsQuestTried(200360))
		{
			me.AddGameQuest(200360, 12); //시간의 단위는 1 = 10초
		}

		//레벨 25 일때 레벨 30까지 올려라
		if (me.GetLevel() >= 25 && !me.IsQuestTried(200361))
		{
			me.AddGameQuest(200361, 12);
		}

		//레벨 35 일때 레벨 40까지 올려라
		if (me.GetLevel() >= 35 && !me.IsQuestTried(200362))
		{
			me.AddGameQuest(200362, 12);
		}

		// 나이 20, 30, 40살 되면 퀘스트 지급
		// 20되면 선물주께
		if (me.GetAge() >=20 && !me.IsQuestTried(200365))	//20살 넘었는데 못 받았다
		{
			me.AddGameQuest(200365, 12); //시간의 단위는 1 = 10초
		}

		//30되면 선물주께
		if (me.GetAge() >=30 && !me.IsQuestTried(200366))	//30살 넘었는데 못 받았다
		{
			me.AddGameQuest(200366, 12); //시간의 단위는 1 = 10초
		}

		//40되면 선물주께
		if (me.GetAge()  >= 40 && !me.IsQuestTried(200367))	//40살 넘었는데 못 받았다
		{
			me.AddGameQuest(200367, 12);
		}
	}

	if (me.IsGiant())
	{
		if (GetVersion()>=704)
		{
			//악기연주 E
			if (me.GetSkillLevel(10003) >= 2 && !me.IsQuestTried(200449))
			{
				me.AddGameQuest(200449, 10);
			}
			//작곡 F
			if (me.GetSkillLevel(10005) >= 1 && !me.IsQuestTried(200450))
			{
				me.AddGameQuest(200450, 10);
			}
			//음악지식 E
			if (me.GetSkillLevel(10006) >= 2 && !me.IsQuestTried(200451))
			{
				me.AddGameQuest(200451, 15);
			}
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	//중국 프리미엄 피씨방 유저 전용 통행증과 퀘스트 주기
	//////////////////////////////////////////////////////////////////////////////////////
	if ((IsEnable(`featureChinaPremiumPc`) extern (`data/script/features.mint`)))
	{
		if(me.IsGameRoomPlayer())
		{
			//중국 프리미엄 피씨방용 deed(21)
			if(me.IsEnableDeed(21))
			{
				if (!me.HaveQuestTemplate(201114))
				{
					me.CleanQuestHistory(201114);	 // 퀘스트 기록 제거
					me.AddGameQuest(201114, 1);	 //중국 프리미엄 피씨방 캐릭터 현실 하루에 한번 접속 후 10분 후에 퀘스트 주기(시간단위 10초)
					me.DoneDeed(21);
				}
			}

			//PC방이 아닌 경우 중국 프리미엄PC방용 타이틀
			me.AddTitle(11009);
		}
		else
		{
			//PC방이 아닌 경우 중국 프리미엄PC방용 타이틀 제거
			if (me.IsSelectableTitle(11009))
			{
				me.DeactivateTitle(11009);
			}
		}
	}
	else
	{
		// 중국 프리미엄PC방 서비스가 없는 경우 타이틀이 혹시 달려있다면 제거
		if (me.IsSelectableTitle(11009))
		{
			me.DeactivateTitle(11009);
		}
	}

	///////////////////////////////////////////////////////
	// 엘프/자이언트 및 지지자 타이틀 부여 처리 G6S2부터   //
	// 2007.02.10 - uhihiho                                               //
	///////////////////////////////////////////////////////

	if (GetVersion() >= 602)
	{
		if (me.IsElf() && !me.IsSelectableTitle(10053) && (me.IsQuestCompleted(200301) || me.IsQuestCompleted(207004)))
		{
			me.DoStript(`addtitle(10053)`);
		}
		if (me.IsGiant() && !me.IsSelectableTitle(10055) && (me.IsQuestCompleted(200401) || me.IsQuestCompleted(207005)))
		{
			me.DoStript(`addtitle(10055)`);
		}
		if (me.IsHuman() && me.GetSupportRace()==1 && !me.IsSelectableTitle(10054))
		{
			me.DoStript(`addtitle(10054)`);
		}
		if (me.IsHuman() && me.GetSupportRace()!=1 && me.IsSelectableTitle(10054))
		{
			me.DeactivateTitle(10054);
		}
		if (me.IsHuman() && me.GetSupportRace()==2 && !me.IsSelectableTitle(10056))
		{
			me.DoStript(`addtitle(10056)`);
		}
		if (me.IsHuman() && me.GetSupportRace()!=2 && me.IsSelectableTitle(10056))
		{
			me.DeactivateTitle(10056);
		}
	}

	/////////////////////////////////////////////////
	// 엘프,자이언트 야수화 완료 키워드 처리 2007.05.21. - uhihiho
	/////////////////////////////////////////////////
	if (
		!IsTestServer() && me.IsElf() &&
		!me.HaveKeyword(`g6_elf_complete`) &&
		me.IsUsableSkill(43001)
	)
	{
		me.AddKeyword(`g6_elf_complete`);
	}
	if (
		!IsTestServer() && me.IsGiant() &&
		!me.HaveKeyword(`g6_giant_complete`) &&
		me.IsUsableSkill(44001)
	)
	{
		me.AddKeyword(`g6_giant_complete`);
	}

	/////////////////////////////////////////////////
	// 엘프,자이언트 야수화 입수 처리 2007.05.13. - uhihiho
	/////////////////////////////////////////////////

	if (
		!IsTestServer() &&
		(me.IsUsableServiceBeast() || IsDevelopment()) &&
		GetVersion() >= 604 &&
		(me.GetLevel() >= 5)
	)
	{
		if (me.IsElf() &&
		!me.HaveKeyword(`g6_elf`) &&
		!me.HaveKeyword(`g6_elf_complete`) &&
		!me.IsUsableSkill(43001))
		{
		me.AddGameQuest(260001, 12);
		me.AddKeyword(`g6_elf`);
		}

		if (me.IsGiant() &&
		!me.HaveKeyword(`g6_giant`) &&
		!me.HaveKeyword(`g6_giant_complete`) &&
		!me.IsUsableSkill(44001))
		{
		me.AddGameQuest(270001, 12);
		me.AddKeyword(`g6_giant`);
		}
	}

	// 엘프 야수화 이프리트+사막드래곤 스케치 퀘스트 난이도 하향 처리
	if (me.IsQuestCompleted(260004))
	{
		// DebugOut(`260004 퀘스트 완료 처리`);
		me.CleanQuestHistory(260004); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`260004 대신 260011 퀘스트로 교체`);
		me.ForceCompleteQuest(260011); // 신 퀘스트를 한 것으로 처리
		me.AddKeyword(`g6_common_BookOfIrinid`);
		me.RemoveKeyword(`g6_elf_04`);
		me.GainExp(4500);
	}
	else if (me.IsQuestTried(260004) && (me.GetCompletedQuestObjectiveCount(260004)>=2))
	{
		// DebugOut(`260004 대신 260011 퀘스트로 교체`);
		me.ForceCompleteQuest(260004); // 신 퀘스트를 한 것으로 처리
		me.CleanQuestHistory(260004); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`260004 대신 260011 퀘스트로 교체`);
		me.ForceCompleteQuest(260011); // 신 퀘스트를 한 것으로 처리
		me.AddKeyword(`g6_common_BookOfIrinid`);
		me.RemoveKeyword(`g6_elf_04`);
		me.GainExp(4500);
	}
	else if (me.IsQuestTried(260004))
	{
		// DebugOut(`260004 퀘스트 완료 처리 & 보상`);
		me.ForceCompleteQuest(260004); // 신 퀘스트를 한 것으로 처리
		// DebugOut(`260004 대신 260011 퀘스트로 교체`);
		me.CleanQuestHistory(260004); // 구 퀘스트를 한 것으로 처리
		me.AddGameQuest(260011, 0);	// 다음 퀘스트 지급
	}

	// 자이언트 야수화 매머드+사막드래곤 스케치 퀘스트 난이도 하향 처리
	if (me.IsQuestCompleted(270002))
	{
		// DebugOut(`270002 퀘스트 완료 처리`);
		me.CleanQuestHistory(270002); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`270002 대신 270005 퀘스트로 교체`);
		me.ForceCompleteQuest(270005); // 신 퀘스트를 한 것으로 처리
		me.AddKeyword(`g6_giant_BookOfTheGiant`);
		me.RemoveKeyword(`g6_giant_hidden_01_krugcall`);
		me.RemoveKeyword(`g6_giant_01_AncientGiant`);
		me.RemoveKeyword(`g6_giant_02_honor`);
		me.RemoveKeyword(`g6_giant_02_Honor_mammoth`);
		me.GainExp(5000);
	}
	else if (me.IsQuestTried(270002) && (me.GetCompletedQuestObjectiveCount(270002)>=2))
	{
		// DebugOut(`270002 대신 270005 퀘스트로 교체`);
		me.ForceCompleteQuest(270002);
		me.CleanQuestHistory(270002); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`270002 대신 270005 퀘스트로 교체`);
		me.ForceCompleteQuest(270005); // 신 퀘스트를 한 것으로 처리
		me.AddKeyword(`g6_giant_BookOfTheGiant`);
		me.RemoveKeyword(`g6_giant_hidden_01_krugcall`);
		me.RemoveKeyword(`g6_giant_01_AncientGiant`);
		me.RemoveKeyword(`g6_giant_02_honor`);
		me.RemoveKeyword(`g6_giant_02_Honor_mammoth`);
		me.GainExp(5000);
	}
	else if (me.IsQuestTried(270002))
	{
		// DebugOut(`270002 퀘스트 완료 처리 & 보상`);
		me.ForceCompleteQuest(270002); // 신 퀘스트를 한 것으로 처리
		// DebugOut(`270002 대신 270005 퀘스트로 교체`);
		me.CleanQuestHistory(270002); // 구 퀘스트를 한 것으로 처리
		me.AddGameQuest(270005, 0);	// 다음 퀘스트 지급
	}


	/////////////////////////////////////////////////
	// 승단 시험 있는 날 퀘스트 주기 2007.11.03. - uhihiho
	/////////////////////////////////////////////////

	if (me.IsAppliablePromotionTest() && GetHour()<21)	// 오늘 시험이 있고 아직 안 끝났고, 내가 칠 수 있는 시험이 있는가
	{
		if (
			!me.HaveQuestTemplate(205001) &&
			!me.HaveQuestTemplate(205002) &&
			!me.HaveQuestTemplate(205003) &&
			!me.HaveQuestTemplate(205004)
		)	// 현재 승단 도우미 퀘스트가 없는가
		{
			if (
				(me.GetQuestCompletedDate(205001) != GetDate()) &&
				(me.GetQuestCompletedDate(205002) != GetDate()) &&
				(me.GetQuestCompletedDate(205003) != GetDate()) &&
				(me.GetQuestCompletedDate(205004) != GetDate())
			)	// 퀘스트를 마쳤던 적이 오늘이 아닌가
			{
				me.CleanQuestHistory(205001);
				me.CleanQuestHistory(205002);
				me.CleanQuestHistory(205003);
				me.CleanQuestHistory(205004);

				int PromotionQuestSelect = Random(4);
				if (PromotionQuestSelect == 0)
				{
					me.AddGameQuest(205001,1);
				}
				else
				if (PromotionQuestSelect == 1)
				{
					me.AddGameQuest(205002,1);
				}
				else
				if (PromotionQuestSelect == 2)
				{
					me.AddGameQuest(205003,1);
				}
				else
				{
					me.AddGameQuest(205004,1);
				}
			}
		}
	}

//	누렙 250이 넘으면 하드모드 // 하드모드 가이드 퀘스트를 수행중이거나 완료 처리를 아직 안했다.

	if(
	   (
	    ((IsTestServer() || IsDevelopment()) && (me.GetCumLevel()+me.GetLevel()>=5)) ||
	     ((!IsTestServer() && !IsDevelopment()) && (me.GetCumLevel()+me.GetLevel()>=250))
	    ) &&
	   (!me.IsQuestTried(206001) && !me.IsQuestCompleted(206001)) &&
	   (GetVersion() >= 802))
	{
		me.AddGameQuest(206001,1);
	}


//예전 틴 지역에 있는 플레이어를 최신 틴 지역으로 이동
//이 코드는 절대로 삭제하면 안된다. 현재는 한국과 북미에만 적용되어 있는데, 향후 타국가에 적용한다면 추가하는 형식으로 한다.
	if (IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`))
	{
		if(me.GetRegionId()==1004)
		{
			me.Move(125,23048,74954);
		}
	}

	// 아래 함수는 첫 환생을 체크하는 함수. 여기서 반신화 스킬의 수련치를 올려줌
	// 외형만 바꾸는 경우는 인정하지 않으며 꼭 레벨도 리셋 했어야 한다.
	if (me.IsStatusJustRebirth() && me.IsStatusLevelResetRebirth())
	{

		int demiGodLevel;
		int demiGodExp;


		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (빛의 각성) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45001);
		if (demiGodLevel!=0)
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45001, demiGodExp);
		}

		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (스피어 오브 라이트) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45002);
		if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 1))
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45002, demiGodExp);
		}

		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (퓨리 오브 라이트) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45003);
		if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 1))
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45003, demiGodExp);
		}

		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (새도우 오브 스피리트) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45007);
		if (demiGodLevel!=0)
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45007, demiGodExp);
		}

		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (이클립스 오브 윙스) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45008);
		if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 2))
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45008, demiGodExp);
		}

		demiGodLevel= 0;
		demiGodExp=0;
		// 반신화 (레이지 오브 윙스) 스킬 포인트
		demiGodLevel = me.GetSkillLevel(45009);
		if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 2))
		{
			demiGodExp=GetDemigodExp(demiGodLevel) * 20;
			me.ModifySkillExpPoint(45009, demiGodExp);
		}

	}

	// 아직 G11 파이톤 나이트 전을 마치지 않았다면 스킬을 제거한다.
	if(me.HaveKeyword(`g11_python_knight_battle_shadow`))
	{
		me.ForgetSkill(45007);
	}

	// 아직 G11 파이톤 나이트 전을 마치지 않았다면 스킬을 제거한다.
	if(me.HaveKeyword(`g11_python_knight_battle_light`))
	{
		me.RemoveKeyword(`g11_python_knight_battle_light`);
	}


	// 아직 G12 최종전을 마치지 않았는데, 모리안 모드면 모두 되돌린다.
	if(!me.HaveKeyword(`g12_20`) && !me.HaveKeyword(`g12_complete`) && me.GetDemiGodSupportType()==2)
	{
		// 모리안 반신화 스킬 제거
		me.ForgetSkill(45008);
		me.ForgetSkill(45009);

		// 네반 모드로 수정
		me.SetDemiGodSupportType(1);
	}

	// 지난주 기부 랭킹 1~5위에 들었으면 보상 퀘스트를 준다.
	if(	me.CanReceiveDonationRankingQuest() &&
		me.GetLastDonationRanking() > 0 && me.GetLastDonationRanking() < 6)
	{
		me.AddQuest(1039);
		me.SetDonationRankingQuestFlag();
	}

}

//////////////////////////////////////////////////////////////////////////////////
server void OnEnterRegion(character me, bool isForLogin)
// : PC가 리전을 옮길 때 불리는 함수.
//////////////////////////////////////////////////////////////////////////////////
{
	if (!isForLogin
		&& me.GetRegionId()==13
		&& !me.HaveKeyword(`Tutorial_Alby_Drop_Trefor_Dagger`)
		&& me.HaveQuestTemplate(202060) && me.GetCompletedQuestObjectiveCount(202060)==1)
	{
		me.TalkToNPC(`_dungeonlostkid`);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnLevelUp(character me, int _iLevel)
// : PC가 레벨업 할 때 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	// G12S2 자이언트 리뉴얼 이벤트
	// 이벤트 기간 동안 자이언트로 환생 or 생성한 후 25레벨까지 키우면 키워드를 준다.
	// by kirie, 2010.04.19
	if((IsCurrentEvent(`g12s2_giantrenewalevent_korea`)) && me.IsGiant())
	{
		if(_iLevel >= 25 && me.HaveKeyword (`2010_giant_renewal1_korea`) && !me.HaveKeyword (`2010_giant_renewal2_korea`))
		{
			me.AddKeyword(`2010_giant_renewal2_korea`);
			me.RemoveKeyword(`2010_giant_renewal1_korea`);
			me.DoStript(`additemex(id:52118 rewardview:true)`);
		}
	}

	// 하고 싶은 것을 하시오
	if( me.IsHuman() &&  !me.IsUsableSkill(50016) && !me.HaveQuestTemplate(200092) && GetLocale().LowerCase()==`korea` && GetVersion()>=803)
	{
		if((me.GetCumLevel() + _iLevel) >= 25)
		{
			me.AddGameQuest(200092, 0);	// 죽은 척 퀘스트 주기. 휴면 계정 DB 정리한 후에  습득 불가능한 유저를 위한 경로. (nade98 2008.04.03)
		}
	}

	if( me.IsHuman() && !me.IsUsableSkill(50020)	&& !me.HaveQuestTemplate(200094) && GetLocale().LowerCase()==`korea` && GetVersion()>=803)
	{
		if((me.GetCumLevel() + _iLevel) >= 28)
		{
			me.AddGameQuest(200094,0);	// 돌 던지기 퀘스트 준다. 죽은 척과 동일한 케이스
		}
	}

	// g13 이후에는 튜토리얼에 변경됨에 따라 여기서 돌 던지기, 죽은 척 퀘스트 공급
	if( me.IsHuman() &&  !me.IsUsableSkill(50016) && !me.HaveQuestTemplate(200092) && GetVersion()>=1301)
	{
		if((me.GetCumLevel() + _iLevel) >= 12)
		{
			me.AddGameQuest(200092, 0);	// 죽은 척 퀘스트 주기.
		}
	}

	if( me.IsHuman() && !me.IsUsableSkill(50020)	&& !me.HaveQuestTemplate(200094) && GetVersion()>=1301)
	{
		if((me.GetCumLevel() + _iLevel) >= 15)
		{
			me.AddGameQuest(200094,0);	// 돌 던지기 퀘스트 준다.
		}
	}

	int paladinLevel;
	paladinLevel = me.GetSkillLevel(40001);
	if (paladinLevel!=0)
	{
		me.ModifySkillExpPoint(40001, 10);
	}

	// 다크 나이트 스킬 포인트
	int darkKnightLevel;
	darkKnightLevel = me.GetSkillLevel(41001);
	if (darkKnightLevel!=0)
	{
		me.ModifySkillExpPoint(41001, 10);
	}

	// 엘프 변신 스킬 포인트
	int elfTransformLevel;
	elfTransformLevel = me.GetSkillLevel(43001);
	if (elfTransformLevel!=0)
	{
		me.ModifySkillExpPoint(43001, 10);
	}

	// 자이언트 변신 스킬 포인트
	int giantTransformLevel;
	giantTransformLevel = me.GetSkillLevel(44001);
	if (giantTransformLevel!=0)
	{
		me.ModifySkillExpPoint(44001, 10);
	}

	int demiGodLevel;
	int demiGodExp;


	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (빛의 각성) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45001);
	if (demiGodLevel!=0)
	{
		demiGodExp=GetDemigodExp(demiGodLevel) ;
		me.ModifySkillExpPoint(45001, demiGodExp);
	}

	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (스피어 오브 라이트) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45002);
	if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 1))
	{
		demiGodExp=GetDemigodExp(demiGodLevel);
		me.ModifySkillExpPoint(45002, demiGodExp);
	}

	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (퓨리 오브 라이트) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45003);
	if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 1))
	{
		demiGodExp=GetDemigodExp(demiGodLevel);
		me.ModifySkillExpPoint(45003, demiGodExp);
	}

	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (새도우 오브 스피리트) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45007);
	if (demiGodLevel!=0)
	{
		demiGodExp=GetDemigodExp(demiGodLevel);
		me.ModifySkillExpPoint(45007, demiGodExp);
	}

	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (이클립스 오브 윙스) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45008);
	if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 2))
	{
		demiGodExp=GetDemigodExp(demiGodLevel);
		me.ModifySkillExpPoint(45008, demiGodExp);
	}

	demiGodLevel= 0;
	demiGodExp=0;
	// 반신화 (레이지 오브 윙스) 스킬 포인트
	demiGodLevel = me.GetSkillLevel(45009);
	if (demiGodLevel!=0 && (me.GetDemiGodSupportType()==0 || me.GetDemiGodSupportType()== 2))
	{
		demiGodExp=GetDemigodExp(demiGodLevel);
		me.ModifySkillExpPoint(45009, demiGodExp);
	}

	// G3S4 begin 티르 코네일 초반 퀘스트 변경
	if(
		GetLocale().LowerCase()==`korea`
		|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
			&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
	)
	{
	}
	else
	{
		//던바튼 마누스 방문
		if (_iLevel == 5)
		{
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200058, 20);
			}
			else
			{
				me.AddGameQuest(200011, 20);
			}
		}
		//나오의 선물
		if (_iLevel == 7)
		{
			me.AddGameQuest(200012, 43);
		}
	}

	if (me.GetStr() >= 200 && !me.IsSelectableTitle(53) && !me.IsTransformed())
	{
		me.DoStript(`addtitle(53)`);
	}
	else if (me.GetStr() >= 80 && !me.IsKnownTitle(53) && !me.IsTransformed())
	{
		me.DoStript(`knowtitle(53)`);
	}

	if (me.GetInt() >= 200 && !me.IsSelectableTitle(52) && !me.IsTransformed())
	{
		me.DoStript(`addtitle(52)`);
	}
	else if (me.GetInt() >= 80 && !me.IsKnownTitle(52) && !me.IsTransformed())
	{
		me.DoStript(`knowtitle(52)`);
	}

	if (me.GetDex() >= 200 && !me.IsSelectableTitle(54) && !me.IsTransformed())
	{
		me.DoStript(`addtitle(54)`);
	}
	else if (me.GetDex() >= 80 && !me.IsKnownTitle(54) && !me.IsTransformed())
	{
		me.DoStript(`knowtitle(54)`);
	}

	if (_iLevel >= 45 && _iLevel < 50  && !me.IsKnownTitle(76) && me.GetAge() == 10) //10살인데 레벨이 45~49 면
	{
		me.DoStript(`knowtitle(76)`);	 //10살에 레벨 50타이틀 알게
	}
	if(_iLevel >= 50 && !me.IsSelectableTitle(76) && me.GetAge() == 10)
	{
		me.DoStript(`addtitle(76)`);	//10살에 레벨 50 타이틀 획득
	}

	//에일렌(철광석채집) - 에일렌(은광석채집)
	if (_iLevel ==10 && me.GetRebirthCount()>0)
	{
		 // 환생 회수 체크도 해야함
		if (me.IsQuestCompleted(200039))
		{
			me.AddGameQuest(200054, 20);
		}
	}
	//에일렌(은광석채집) - 에일렌(금광석채집)
	if (_iLevel ==10 && me.GetRebirthCount()>1)
	{
		 // 환생 회수 체크도 해야함
		if (me.IsQuestCompleted(200054))
		{
			me.AddGameQuest(200055, 400);
		}
	}


	//////////////////////////////////////////////////////////////////////////////////
	// 이리아에서 시작하고, 아직 티르 코네일까지 못가본 사람은 퀘스트를 주지 않는다.
	// 이리아 초반 퀘스트중 티르 코네일 방문(200227) 완료시, 밀렸던 퀘스트를 한꺼번에 지급한다.
	// by jisangs, 2006/03/28
	//////////////////////////////////////////////////////////////////////////////////

	// 인간만 by jisangs, 060601
	if (me.IsHuman())	// 인간만
	{
		if (me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitTircho`))	// 이리아에서 시작 반영
		{
			return;
		}
		if (me.HaveKeyword(`character_new_tutorial_2010`) && _iLevel >= 25 && !me.IsQuestTried(200133) && !me.HaveKeyword(`memorial_character`) && IsEnable(`featureTutorialPlayUpgrade_paperplane`) extern (`data/script/features.mint`)) //G13S1 이후 생성 캐릭터는 25 레벨 이후 종이 비행기 날리기
		{
			me.AddGameQuest(200133, 0); //시간의 단위는 1 = 10초
		}
		if (!me.HaveKeyword(`character_new_tutorial_2010`) && _iLevel >= 13 && !me.IsQuestTried(200133) && !me.HaveKeyword(`memorial_character`) && IsEnable(`featureTutorialPlayUpgrade_paperplane`) extern (`data/script/features.mint`))		//G9S2 부터는 종이비행기 퀘스트가 13 레벨 이후에 온다.
		{
			me.AddGameQuest(200133, 0); //시간의 단위는 1 = 10초
		}
		if (_iLevel >= 3 && !me.IsQuestTried(200133) && !me.HaveKeyword(`memorial_character`) && GetVersion()>=704 && !IsEnable(`featureTutorialPlayUpgrade_paperplane`) extern (`data/script/features.mint`))		//레벨 3 일때 종이비행기 날리기 입수 퀘스트준다.
		{
			me.AddGameQuest(200133, 0); //시간의 단위는 1 = 10초
		}
		//레벨 15 일때 레벨 20까지 올려라
		if (_iLevel >= 15 && !me.IsQuestTried(200043))
		{
			me.AddGameQuest(200043, 12); //시간의 단위는 1 = 10초
		}

		//레벨 25 일때 레벨 30까지 올려라
		if (_iLevel >= 25 && !me.IsQuestTried(200044))
		{
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200060, 12);
			}
			else
			{
				me.AddGameQuest(200044, 12);
			}
		}

		//레벨 35 일때 레벨 40까지 올려라
		if (_iLevel >= 35 && !me.IsQuestTried(200045))
		{
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200061, 12);
			}
			else
			{
				me.AddGameQuest(200045, 12);
			}
		}
	}
	else
	if (me.IsElf())
	{
		//레벨 18 일때 종이비행기 날리기 입수 퀘스트준다.
		if(_iLevel == 18 && !me.IsQuestTried(200133) && GetVersion()>=704  && !me.HaveKeyword(`memorial_character`))
		{
			me.AddGameQuest(200133, 0); //시간의 단위는 1 = 10초
		}

		//레벨 15 일때 레벨 20까지 올려라
		if (_iLevel == 15 && !me.IsQuestTried(200360))
		{
			me.AddGameQuest(200360, 12); //시간의 단위는 1 = 10초
		}

		//레벨 25 일때 레벨 30까지 올려라
		if (_iLevel == 25 && !me.IsQuestTried(200361))
		{
			me.AddGameQuest(200361, 12);
		}

		//레벨 35 일때 레벨 40까지 올려라
		if (_iLevel == 35 && !me.IsQuestTried(200362))
		{
			me.AddGameQuest(200362, 12);
		}
	}
	// 자이언트 테섭 이후, 레벨업 퀘스트들을 준비해서 바꿔주어야 합니다.
	// by jisangs, 2006/12/13
	else
	if (me.IsGiant())
	{
		//레벨 18 일때 종이비행기 날리기 입수 퀘스트준다.
		if(_iLevel == 18 && !me.IsQuestTried(200133) && GetVersion()>=704 && !me.HaveKeyword(`memorial_character`))
		{
			me.AddGameQuest(200133, 0); //시간의 단위는 1 = 10초
		}
		//레벨 15 일때 레벨 20까지 올려라
		if (_iLevel == 15 && !me.IsQuestTried(200460))
		{
			me.AddGameQuest(200460, 12); //시간의 단위는 1 = 10초
		}

		//레벨 25 일때 레벨 30까지 올려라
		if (_iLevel == 25 && !me.IsQuestTried(200461))
		{
			me.AddGameQuest(200461, 12);
		}

		//레벨 35 일때 레벨 40까지 올려라
		if (_iLevel == 35 && !me.IsQuestTried(200462))
		{
			me.AddGameQuest(200462, 12);
		}
	}

	///////////////////////////////////////////////////////////////////////
	// 누적레벨 26일 때 에린 시작 인간은 아이리 떠나 보내기
	// 2007년 8월 8일 테스트 서버 패치부터 적용
	///////////////////////////////////////////////////////////////////////
	if (((_iLevel >= 26) || ((me.GetCumLevel() + _iLevel) >= 26)) && !me.IsQuestTried(202006) && (me.GetEgoType() == 9) && me.IsHuman() && !me.HaveKeyword(`FirstLoginAtIria`))	// 26렙 이상이고 퀘스트 안 했고 에린 시작 인간이고 숏소드 아이리가 있다
	{
		me.AddGameQuest(202006,2);		// 아이리 떠나보내기 퀘스트 예약
	}
	//C4 이후에선 아이리 안 주고 연습용 숏 소드 준다. 이 상황도 체크해서 연습용 숏 소드 회수 -> 다른 무기 지급해줘야 한다.
	else if (((_iLevel >= 26) || ((me.GetCumLevel() + _iLevel) >= 26)) && !me.IsQuestTried(202006) && me.GetItemNoWithClassId(40374) > 0 && me.IsHuman() && !me.HaveKeyword(`FirstLoginAtIria`))
	{
		if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(202006,2);
		}
	}
	/*//G13S1이후 생성 캐릭터는 아이리 휘슬, 아이리 실린더 가지고 있어도 떠나보내기 by eljjoo 2010-06-24
	else if (((_iLevel >= 26) || ((me.GetCumLevel() + _iLevel) >= 26)) && me.HaveKeyword(`new_character_after_g13`)	&& !me.IsQuestTried(202006)	&& (me.GetEgoType() == 13 || me.GetEgoType() == 14)	&& me.IsHuman()	&& !me.HaveKeyword(`FirstLoginAtIria`))
	{
		me.AddGameQuest(202006,2);		// 아이리 떠나보내기 퀘스트 예약
	}*/

	//////////////////////////////////////////////////////////////////////////////////////
	// 북미런칭에 맞춘 튜토리얼 리뉴얼
	// 국내는 G8S3 부터.
	//////////////////////////////////////////////////////////////////////////////////////

	//////////////////////////////////////////////////////////////////////////////////////
	// 누적 레벨에 따른 서브 퀘스트 배치
	// 이곳의 코드는 2007년 8월 8일 테스트서버에 적용됩니다.
	//////////////////////////////////////////////////////////////////////////////////////

	if (me.IsHuman() && !(IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)))	// 인간만
	{
		if (me.IsQuestTried(202001) || me.IsQuestTried(212001) || me.IsQuestTried(202062))	// 새로운 나오의 소개장 퀘스트를 가지고 있거나 완료했을 때
		{
			//환생횟수가 0회라면
			if (me.GetRebirthCount() == 0)
			{
				if (_iLevel == 6)
				{
					me.AddGameQuest(400001, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 7)
				{
					me.AddGameQuest(400002, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 8)
				{
					me.AddGameQuest(400003, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 9)
				{
					me.AddGameQuest(400004, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 10)
				{
					me.AddGameQuest(400005, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 11)
				{
					me.AddGameQuest(400006, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 12)
				{
					me.AddGameQuest(400007, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 13)
				{
					me.AddGameQuest(400008, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 14)
				{
					me.AddGameQuest(400009, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 15)
				{
					me.AddGameQuest(400010, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 16)
				{
					me.AddGameQuest(400011, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 17)
				{
					me.AddGameQuest(400012, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 18)
				{
					me.AddGameQuest(400013, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 19)
				{
					me.AddGameQuest(400014, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 20)
				{
					me.AddGameQuest(400015, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 21)
				{
					me.AddGameQuest(400016, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 22)
				{
					me.AddGameQuest(400017, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 23)
				{
					me.AddGameQuest(400018, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 24)
				{
					me.AddGameQuest(400019, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 25)
				{
					me.AddGameQuest(400020, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 26)
				{
					me.AddGameQuest(400021, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 27)
				{
					me.AddGameQuest(400022, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 28)
				{
					me.AddGameQuest(400023, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 29)
				{
					me.AddGameQuest(400024, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 30)
				{
					me.AddGameQuest(400025, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 31)
				{
					me.AddGameQuest(400026, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 32)
				{
					me.AddGameQuest(400027, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 33)
				{
					me.AddGameQuest(400028, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 34)
				{
					me.AddGameQuest(400029, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 35)
				{
					me.AddGameQuest(400030, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 36)
				{
					me.AddGameQuest(400031, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 37)
				{
					me.AddGameQuest(400032, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 38)
				{
					me.AddGameQuest(400033, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 39)
				{
					me.AddGameQuest(400034, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 40)
				{
					me.AddGameQuest(400035, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 41)
				{
					me.AddGameQuest(400036, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 42)
				{
					me.AddGameQuest(400037, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 43)
				{
					me.AddGameQuest(400038, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 44)
				{
					me.AddGameQuest(400039, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 45)
				{
					me.AddGameQuest(400040, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 46)
				{
					me.AddGameQuest(400041, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 47)
				{
					me.AddGameQuest(400042, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 48)
				{
					me.AddGameQuest(400043, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 49)
				{
					me.AddGameQuest(400044, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 50)
				{
					me.AddGameQuest(400045, 1); //시간의 단위는 1 = 10초
				}
			}

			//환생횟수가 1회라면
			if (me.GetRebirthCount() == 1)
			{
				if (_iLevel == 6)
				{
					me.AddGameQuest(401001, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 8)
				{
					me.AddGameQuest(401002, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 10)
				{
					me.AddGameQuest(401003, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 12)
				{
					me.AddGameQuest(401004, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 14)
				{
					me.AddGameQuest(401005, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 16)
				{
					me.AddGameQuest(401006, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 18)
				{
					me.AddGameQuest(401007, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 20)
				{
					me.AddGameQuest(401008, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 22)
				{
					me.AddGameQuest(401009, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 24)
				{
					me.AddGameQuest(401010, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 26)
				{
					me.AddGameQuest(401011, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 28)
				{
					me.AddGameQuest(401012, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 30)
				{
					me.AddGameQuest(401013, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 32)
				{
					me.AddGameQuest(401014, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 34)
				{
					me.AddGameQuest(401015, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 36)
				{
					me.AddGameQuest(401016, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 38)
				{
					me.AddGameQuest(401017, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 40)
				{
					me.AddGameQuest(401018, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 42)
				{
					me.AddGameQuest(401019, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 44)
				{
					me.AddGameQuest(401020, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 46)
				{
					me.AddGameQuest(401021, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 48)
				{
					me.AddGameQuest(401022, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 50)
				{
					me.AddGameQuest(401023, 1); //시간의 단위는 1 = 10초
				}
			}

			//환생횟수가 2회라면
			if (me.GetRebirthCount() == 2)
			{
				if (_iLevel == 6)
				{
					me.AddGameQuest(402001, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 10)
				{
					me.AddGameQuest(402002, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 14)
				{
					me.AddGameQuest(402003, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 18)
				{
					me.AddGameQuest(402004, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 22)
				{
					me.AddGameQuest(402005, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 26)
				{
					me.AddGameQuest(402006, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 30)
				{
					me.AddGameQuest(402007, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 34)
				{
					me.AddGameQuest(402008, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 38)
				{
					me.AddGameQuest(402009, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 42)
				{
					me.AddGameQuest(402010, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 46)
				{
					me.AddGameQuest(402011, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 50)
				{
					me.AddGameQuest(402012, 1); //시간의 단위는 1 = 10초
				}
			}

			//환생횟수가 3회라면
			if (me.GetRebirthCount() == 3)
			{
				if (_iLevel == 6)
				{
					me.AddGameQuest(403001, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 16)
				{
					me.AddGameQuest(403002, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 26)
				{
					me.AddGameQuest(403003, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 36)
				{
					me.AddGameQuest(403004, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 46)
				{
					me.AddGameQuest(403005, 1); //시간의 단위는 1 = 10초
				}
				if (_iLevel == 50)
				{
					me.AddGameQuest(403006, 1); //시간의 단위는 1 = 10초
				}
			}
		}
	}

	else if (me.IsHuman()&& (IsEnable(`featureTutorialPlayUpgrade`) extern (`data/script/features.mint`)))	// 인간이고 리뉴얼 적용 받으면
	{
		if (me.IsQuestTried(202001) || me.IsQuestTried(207003) || me.IsQuestTried(212001) || me.IsQuestTried(202062))	// 새로운 나오의 소개장 퀘스트를 가지고 있거나 완료했을 때  // 메모리얼 캐릭터 - 울라도 허용한다.
		{
			int iCumLevel = 0;
			iCumLevel= _iLevel + me.GetCumLevel();

			if(!me.HaveKeyword(`memorial_character`)
				&& !me.HaveKeyword(`character_new_tutorial_2010`) // G13S1 이후 만든 캐릭터는 레벨별 사냥 퀘스트 안 한다.
				)
			{
					switch(iCumLevel)
					{
						case (6)
						{
							if (!IsEnable(`featureTutorialPlayUpgrade_G9S2`) extern (`data/script/features.mint`))
							{
								me.AddGameQuest(202030, 2);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
							}
						}
						case (12)
						{
							me.AddGameQuest(202201, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (13)
						{
							me.AddGameQuest(202202, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (14)
						{
							me.AddGameQuest(202203, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (15)
						{
							me.AddGameQuest(202204, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (16)
						{
							me.AddGameQuest(202205, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (18)
						{
							me.AddGameQuest(202206, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (19)
						{
							me.AddGameQuest(202207, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (20)
						{
							me.AddGameQuest(202208, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (25)
						{
							me.AddGameQuest(202209, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (27)
						{
							me.AddGameQuest(202210, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (29)
						{
							me.AddGameQuest(202211, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (30)
						{
							me.AddGameQuest(202212, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (31)
						{
							me.AddGameQuest(202213, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (32)
						{
							me.AddGameQuest(202214, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (33)
						{
							me.AddGameQuest(202215, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (35)
						{
							me.AddGameQuest(202216, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (38)
						{
							me.AddGameQuest(202217, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (42)
						{
							me.AddGameQuest(202218, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (50)
						{
							me.AddGameQuest(202219, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
						case (60)
						{
							me.AddGameQuest(202220, 1);	// g8s3 리뉴얼로 추가. 여기서 꼬리를 물고 이어짐
						}
					}
				}
			//}

			switch(iCumLevel)
			{
				// G8S3 되기 전에 이전 튜토리얼 진행하던 유저들 보스 퀘스트 받도록 해준다.
				// 누적레벨이 일정이상인데, 보스 퀘스트 현재 없고, 한적도 없다. 그럼 주자.

				case (21)
				{
					if (!me.IsQuestTried(202101))
					{
						me.AddGameQuest(202101, 10);	// g8s3 이전 유저가 15렙이 됐는데 거대거미 잡기 퀘스트 한적없으면 준다.
					}
				}
				case (24)
				{
					if (!me.IsQuestTried(202101) && !me.IsQuestTried(202102))
					{
						me.AddGameQuest(202102, 10);	// g8s3 이전 유저가 24렙이 됐는데 예전 퀘스트 한적없으면 스몰 골렘 퀘스트 준다.
					}
				}

				case (34)
				{
					if (!me.IsQuestTried(202101) && !me.IsQuestTried(202102) && !me.IsQuestTried(202104))
					{
						me.AddGameQuest(202104, 10);	// g8s3 이전 유저가 34렙이 됐는데 예전 퀘스트 한 적없으면 헬하운드 퀘스트 준다.
					}
				}

				case (43)
				{
					if (!me.IsQuestTried(202101) && !me.IsQuestTried(202102) && !me.IsQuestTried(202104) && !me.IsQuestTried(202105))
					{
						me.AddGameQuest(202105, 10);	// g8s3 이전 유저가 43렙이 됐는데 예전 퀘스트 한 적없으면 블랙 서큐버스 퀘스트 준다.
					}
				}

				case (48)
				{
					if (!me.IsQuestTried(202101) && !me.IsQuestTried(202102) && !me.IsQuestTried(202104) && !me.IsQuestTried(202105)  && !me.IsQuestTried(202103))
					{
						me.AddGameQuest(202103, 10);	// g8s3 이전 유저가 48렙이 됐는데 예전 퀘스트 한 적없으면 골렘 퀘스트 준다.
					}
				}

				case (65)
				{
					if (!me.IsQuestTried(202101) && !me.IsQuestTried(202102) && !me.IsQuestTried(202104) && !me.IsQuestTried(202105)  && !me.IsQuestTried(202103) && !me.IsQuestTried(202106))
					{
						me.AddGameQuest(202106, 10);	// g8s3 이전 유저가 65렙이 됐ԫͰ 예Ġ퀘스트 한 적없으면 오우거 워리어 퀘스트 준다.
					}
				}
			}
		}
	}
	else if (me.IsElf() && (IsEnable(`featureBossPlayElfGiant`) extern (`data/script/features.mint`)))	// 엘프이고 리뉴얼 적용받으면
	{
		int iCumLevel = 0;
		iCumLevel= _iLevel + me.GetCumLevel();

		if (iCumLevel>=20 &&
		iCumLevel <=100 &&
		!me.IsQuestTried(202301) &&
		!me.HaveQuestTemplate(202301))
		{
			me.AddGameQuest(202301, 10);	// 20 레벨부터 퀘스ʸ 공급, 마지막 6단계 퀘스트 적정선인 누렙 100까지는 이 퀘스트들을 준다.
		}
	}
	else if (me.IsGiant() && (IsEnable(`featureBossPlayElfGiant`) extern (`data/script/features.mint`)))	// 자언이고 리뉴얼 적용 받으면
	{
		int iCumLevel = 0;
		iCumLevel= _iLevel + me.GetCumLevel();

		if (iCumLevel>=20 &&
		iCumLevel <=100 &&
		!me.IsQuestTried(202401) &&
		!me.HaveQuestTemplate(202401))
		{
			me.AddGameQuest(202401, 10);	// 20 레벨부터 퀘스트 공급, 마지막 6단계 퀘스트 적정선인 누렙 100까지는 이 퀘스트들을 준다.
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnExploLevelUp(character me, int _iLevel)
// : PC가 탐사 레벨업 할 때 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{

	// 인간, 엘프 구분 by jisangs, 060601
	// 자이언트 추가 by jisangs, 061212

	// 최고 탐험 레벨보다 현재 레벨이 작을 경우 필수 탐험 레벨을 추가할 필요가 없다.
	if (me.GetExploMaxKeyLevel() >= _iLevel)
	{
		return;
	}

	if (me.IsGiant())
	{
		// 5, 10, 15, 20 레벨이 되면
		// 해당 레벨을 넘어가기 위해 달성해야할
		// 레벨별 필수 탐험퀘스تЀ 주어진다.
		if(_iLevel==5)
		{
			me.AddExploQuest(303017,5);
		}
		if(_iLevel==10)
		{
			me.AddExploQuest(303021,10);
		}
		if(_iLevel==15)
		{
			me.AddExploQuest(303008,15);
		}
		if(_iLevel==20)
		{
			me.AddExploQuest(303023,20);
		}
	}
	else
	if (me.IsElf())
	{
		// 5, 10, 15, 20 레벨이 되면
		// 해당 레벨을 넘어가기 위해 달성해야할
		// 레벨별 필수 탐험퀘스트가 주어진다.
		if(_iLevel==5)
		{
			me.AddExploQuest(302001,5);
		}
		if(_iLevel==10)
		{
			me.AddExploQuest(302002,10);
		}
		if(_iLevel==15)
		{
			me.AddExploQuest(302003,15);
		}
		if(_iLevel==20)
		{
			me.AddExploQuest(302004,20);
		}
	}
	else
//	if (me.IsHuman())
	{
		if(_iLevel==5)
		{
			me.AddExploQuest(301025,5);
		}
		if(_iLevel==10)
		{
			me.AddExploQuest(301031,10);
		}
		if(_iLevel==15)
		{
			me.AddExploQuest(301030,15);
		}
		if(_iLevel==20)
		{
			me.AddExploQuest(301034,20);
		}

		// 탐험 퀘스트 못받은 플레이어용 처리 코드
		if (me.IsQuestTried(301025)
			&& !me.IsQuestCompleted(301025)
			&& !me.HaveQuestTemplate(301025)
			&& _iLevel == 5)
		{
			me.CleanQuestHistory(301025);
			me.AddExploQuest(301025,5);
		}
		else if (me.IsQuestTried(301031)
			&& !me.IsQuestCompleted(301031)
			&& !me.HaveQuestTemplate(301031)
			&& _iLevel == 10)
		{
			me.CleanQuestHistory(301031);
			me.AddExploQuest(301031,10);
		}
		else if (me.IsQuestTried(301030)
			&& !me.IsQuestCompleted(301030)
			&& !me.HaveQuestTemplate(301030)
			&& _iLevel == 15)
		{
			me.CleanQuestHistory(301030);
			me.AddExploQuest(301030,15);
		}
		else if (me.IsQuestTried(301034)
			&& !me.IsQuestCompleted(301034)
			&& !me.HaveQuestTemplate(301034)
			&& _iLevel == 20)
		{
			me.CleanQuestHistory(301034);
			me.AddExploQuest(301034,20);
		}
	}
}
/*
301025 거대 석상에 대한 조사
10레벨 301031 신기로운 문양의 봉헌석
14레벨 301030 표정이 변하는 석상
17레벨 301034 시간을 나타내는 건축물
*/


//////////////////////////////////////////////////////////////////////////////////
server void OnAging(character me, int _iAge, int _iOldAge)
// : PC가 나이먹을 때 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	int iGrowOld = _iAge - _iOldAge;

	if (me.IsSelectableTitle(10051))	// 요리사 대회에서 얻은 타이틀이 있으면
	{
		if (
			!me.HaveKeyword(`cook_prize_title_aging`)
			|| (me.HaveKeyword(`cook_prize_title_aging`) && 1 < iGrowOld)
		)
		{
			me.DeactivateTitle(10051);	// know 상태로 되돌린다.
			me.RemoveKeyword(`cook_prize_title_aging`);
		}
		else if (me.HaveKeyword(`cook_prize_title_aging`) && 1 == iGrowOld)
		{
			me.RemoveKeyword(`cook_prize_title_aging`);
		}
	}
	else
	{
		me.RemoveKeyword(`cook_prize_title_aging`);
	}


	if (me.IsHuman())
	{
		//////////////////////////////////////////////////////////////////////////////////
		// 이리아에서 시작하고, 아직 티르 코네일까지 못가본 사람은 퀘스트를 주지 않는다.
		// 이리아 초반 퀘스트중 티르 코네일 방문(200227) 완료시, 밀렸던 퀘스트를 한꺼번에 지급한다.
		// by jisangs, 2006/03/28
		//////////////////////////////////////////////////////////////////////////////////
		if (me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitTircho`))	// 이리아에서 시작 반영
		{
			return;
		}


		// 하고 싶은 것을 하시오
			//15살일때 20되면 선물주께
		/*if (_iAge == 15 && !me.IsQuestTried(200047))
		{
			me.AddGameQuest(200047, 12); //시간의 단위는 1 = 10초
		}

		//25살일때 30되면 선물주께
		if (_iAge == 25 && !me.IsQuestTried(200048))
		{
			me.AddGameQuest(200048, 12); //시간의 단위는 1 = 10초
		}

		//35살일때 40되면 선물주께
		if (_iAge == 35 && !me.IsQuestTried(200049))
		{
			if (GetGeneration() ==0 && GetSeason() ==1)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200062, 12);
			}
			else
			{
				me.AddGameQuest(200049, 12);
			}
		}
		*/

		// 20되면 선물주께
		if (
			(_iAge>=20 && !me.IsQuestTried(200076))//20살 넘었는데 못 받았다
			&&
			!me.IsQuestTried(200047) && !me.IsQuestCompleted(200047)	//구 나이 퀘스트는 예약도 안되었다
		)
		{
			me.AddGameQuest(200076, 12); //시간의 단위는 1 = 10초
		}

		//30되면 선물주께
		if (
			(_iAge>=30 && !me.IsQuestTried(200077))//30살 넘었는데 못 받았다
			&& !me.IsQuestTried(200048)  && !me.IsQuestCompleted(200048)
		)
		{
			me.AddGameQuest(200077, 12); //시간의 단위는 1 = 10초
		}

		//40되면 선물주께
		if (_iAge >= 40 && !me.IsQuestTried(200062) && !me.IsQuestTried(200078) && !me.IsQuestTried(200049) && !me.IsQuestCompleted(200049))
		{
			if (GetVersion() == 001)	//클로즈베타 패키지에서는 다른 퀘스트를 준다.
			{
				me.AddGameQuest(200062, 12);
			}
			else
			{
				me.AddGameQuest(200078, 12);
			}
		}
	}
	// 인간, 엘프 구분 by jisangs, 060601
	else
	if (me.IsElf())
	{
		// 나이 20, 30, 40살 되면 퀘스트 지급
		// 20되면 선물주께
		if (_iAge>=20 && !me.IsQuestTried(200365))	//20살 넘었는데 못 받았다
		{
			me.AddGameQuest(200365, 12); //시간의 단위는 1 = 10초
		}

		//30되면 선물주께
		if (_iAge>=30 && !me.IsQuestTried(200366))	//30살 넘었는데 못 받았다
		{
			me.AddGameQuest(200366, 12); //시간의 단위는 1 = 10초
		}

		//40되면 선물주께
		if (_iAge >= 40 && !me.IsQuestTried(200367))	//40살 넘었는데 못 받았다
		{
			me.AddGameQuest(200367, 12);
		}
	}
	// 자이언트 테섭 이후, 나이 퀘스트들을 준비해서 바꿔주어야 합니다.
	// by jisangs, 2006/12/13
	else
	if (me.IsGiant())
	{
		// 나이 20, 30, 40살 되면 퀘스트 지급
		// 20되면 선물주께
		if (_iAge>=20 && !me.IsQuestTried(200465))	//20살 넘었는데 못 받았다
		{
			me.AddGameQuest(200465, 12); //시간의 단위는 1 = 10초
		}

		//30되면 선물주께
		if (_iAge>=30 && !me.IsQuestTried(200466))	//30살 넘었는데 못 받았다
		{
			me.AddGameQuest(200466, 12); //시간의 단위는 1 = 10초
		}

		//40되면 선물주께
		if (_iAge >= 40 && !me.IsQuestTried(200467))	//40살 넘었는데 못 받았다
		{
			me.AddGameQuest(200467, 12);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnSkillKnow(character me, int _idSkill)
// : PC가 어떤 스킬을 입수할 때 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오

/*	//캠프파이어 얻을때 발생
	if ( _idSkill == 10008)
	{
		me.AddGameQuest(300001, 20);
	} */


}

//////////////////////////////////////////////////////////////////////////////////
server void OnSkillLevelUp(character me, int _idSkill, int _iLevel)
// : PC의 스킬이 레벨업 할 때 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.IsHuman())
	{
		//////////////////////////////////////////////////////////////////////////////////
		// 이리아에서 시작하고, 아직 티르 코네일까지 못가본 사람은 퀘스트를 주지 않는다.
		// 이리아 초반 퀘스트중 티르 코네일 방문(200227) 완료시, 밀렸던 퀘스트를 한꺼번에 지급한다.
		// 하지만 음악적 지식 E랭크 퀘스트는 울라 NPC 방문 오브젝티브가 없기 때문에,
		// 이리아 시작 캐릭터라도 바로 퀘스트를 진행시켜 준다.
		// by jisangs, 2006/04/19
		//////////////////////////////////////////////////////////////////////////////////
		//음악지식 E
		if (_idSkill == 10006 && _iLevel == 2)
		{
			me.AddGameQuest(200023, 15);
		}


		//스매시 C가 되면 리프 어택 습득 퀘스트  by eljjoo 2010-06-29
		//G13S1 리프 어택 스킬 추가 이후부터
		if (me.HaveKeyword(`FirstLoginAtIria`) && IsEnable(`featureAssaultSlash`) extern (`data/script/features.mint`))
		{
			if (_idSkill == 20002 && _iLevel == 4 && !me.IsUsableSkill(20012))
			{
				me.AddGameQuest(200231,0);
			}
		}

		//////////////////////////////////////////////////////////////////////////////////
		// 이리아에서 시작하고, 아직 티르 코네일까지 못가본 사람은 퀘스트를 주지 않는다.
		// 이리아 초반 퀘스트중 티르 코네일 방문(200227) 완료시, 밀렸던 퀘스트를 한꺼번에 지급한다.
		// by jisangs, 2006/03/28
		//////////////////////////////////////////////////////////////////////////////////
		if (me.HaveKeyword(`FirstLoginAtIria`) && !me.HaveKeyword(`FirstLoginAtIria_VisitTircho`))	// 이리아에서 시작 반영
		{
			return;
		}

		// 하고 싶은 것을 하시오
		//서브퀘스트

		//컴뱃 B
		if (_idSkill == 23002 && _iLevel == 5)
		{
			me.AddGameQuest(200013, 10);
		}
		//스매시 A
		if (
			_idSkill == 20002 && _iLevel == 6)
		{
			me.AddGameQuest(200014, 10);
		}
		//카운터 B
		if (_idSkill == 20003 && _iLevel == 5)
		{
			me.AddGameQuest(200015, 20);
		}
		//윈드밀 D
		if (_idSkill == 22001 && _iLevel == 3)
		{
			me.AddGameQuest(200016, 15);
		}
		//레인지마스터리 C
		if (_idSkill == 21001 && _iLevel == 4)
		{
			me.AddGameQuest(200017, 10);
		}
		//매그넘샷 D
		if (_idSkill == 21002 && _iLevel == 3)
		{
			me.AddGameQuest(200018, 10);
		}
		//힐링 E
		if (_idSkill == 30006 && _iLevel == 2)
		{
			me.AddGameQuest(200019, 10);
		}
		//응급치료 B
		if (_idSkill == 10009 && _iLevel == 5)
		{
			// 이리아 스킬랭크업 들어가면서 응급치료 B랭크까지 도달하게 되었습니다.
			// 아래 200020 퀘스트가 주어지게 되어 있는데,
			// 퀘스트 지급 여부가 확인되지 않아 일단 주석처리 하였습니다.
			// jisangs, 2006/02/17

			// 운영팀의 의견에 따라 퀘스트 오픈
			// jisangs, 2006/10/31
			me.AddGameQuest(200020, 10);
		}
		//응급치료 D랭크 달성
		if (_idSkill == 10009 && _iLevel == 4)
		{
			me.RemoveKeyword(`skill_train_firstaid_Drank`);
		}
		//응급치료 C랭크 달성
		if (_idSkill == 10009 && _iLevel == 4)
		{
			me.RemoveKeyword(`skill_train_firstaid_Drank`);
			me.RemoveKeyword(`skill_train_firstaid_Crank`);
		}
		//응급치료 B랭크 달성
		if (_idSkill == 10009 && _iLevel == 5)
		{
			me.RemoveKeyword(`skill_train_firstaid_Crank`);
		}
		//악기연주 E
		if ((GetVersion()>1) && _idSkill == 10003 && _iLevel == 2)
		{
			me.AddGameQuest(200021, 10);
		}
		//작곡 F
		if (_idSkill == 10005 && _iLevel == 1)
		{
			me.AddGameQuest(200022, 10);
		}
		//작곡 8랭크 달성
		if (_idSkill == 10005 && _iLevel == 8)
		{
			me.RemoveKeyword(`skill_train_compose_8rank`);
		}
		//작곡 7랭크 달성
		if (_idSkill == 10005 && _iLevel == 9)
		{
			me.RemoveKeyword(`skill_train_compose_8rank`);
		}

		//음악지식 9
		if (_idSkill == 10006 && _iLevel == 7)
		{
			me.RemoveKeyword(`skill_train_musicknow_9rank`);
			me.RemoveKeyword(`musical_know_a_nele_loeiz`);
		}
		//음악지식 8랭크 달성
		if (_idSkill == 10006 && _iLevel == 8)
		{
			me.RemoveKeyword(`skill_train_musicknow_9rank`);
		}

		//캠프파이어 F
		if ((GetVersion() > 1) && _idSkill == 10008 && _iLevel == 1)
		{
			me.AddGameQuest(200024, 40);
		}
		//옷만들기 랭크 D
		if (_idSkill == 10001 && _iLevel == 3)
		{
			if(IsDevelopment())
			{
				me.AddGameQuest(200074, 15);
			}
			else
			{
				me.AddGameQuest(200025, 15);
			}
		}
		//방직 D
		if (!me.IsQuestTried(200026)&&(_idSkill == 10011 && _iLevel == 3))
		{
			me.AddGameQuest(200026, 20);
		}
	} //if (me.IsHuman()) 의 끝
	// 인간, 엘프 구분 by jisangs, 060601
	else
	if (me.IsElf())
	{
		//스매시 C가 되면 리프 어택 습득 퀘스트  by eljjoo 2010-06-29
		//G13S1 리프 어택 스킬 추가 이후부터
		if (IsEnable(`featureAssaultSlash`) extern (`data/script/features.mint`))
		{
			if (_idSkill == 20002 && _iLevel == 4)
			{
				me.AddGameQuest(200332,0);
			}
		}
		//컴뱃 B
		if (_idSkill == 23002 && _iLevel == 5)
		{
			me.AddGameQuest(200342, 10);
		}
		//스매시 A
		if (
			_idSkill == 20002 && _iLevel == 6)
		{
			me.AddGameQuest(200343, 10);
		}
		//카운터 B
		if (_idSkill == 20003 && _iLevel == 5)
		{
			me.AddGameQuest(200344, 20);
		}
		//윈드밀 D
		if (_idSkill == 22001 && _iLevel == 3)
		{
			me.AddGameQuest(200345, 15);
		}
		//레인지마스터리 C
		if (_idSkill == 21001 && _iLevel == 4)
		{
			me.AddGameQuest(200346, 10);
		}
		//매그넘샷 D
		if (_idSkill == 21002 && _iLevel == 3)
		{
			me.AddGameQuest(200347, 10);
		}
		//힐링 E
		if (_idSkill == 30006 && _iLevel == 2)
		{
			me.AddGameQuest(200348, 10);
		}
		//악기연주 E
		if (_idSkill == 10003 && _iLevel == 2)
		{
			me.AddGameQuest(200349, 10);
		}
		//작곡 F
		if (_idSkill == 10005 && _iLevel == 1)
		{
			me.AddGameQuest(200350, 10);
		}
		//음악지식 E
		if (_idSkill == 10006 && _iLevel == 2)
		{
			me.AddGameQuest(200351, 15);
		}
		//캠프파이어 F
		if (_idSkill == 10008 && _iLevel == 1)
		{
			me.AddGameQuest(200352, 40);
		}
		//옷만들기 랭크 D
		if (_idSkill == 10001 && _iLevel == 3)
		{
			me.AddGameQuest(200353, 15);
		}
		//방직 D
		if (_idSkill == 10011 && _iLevel == 3)
		{
			me.AddGameQuest(200354, 20);
		}
	}//if(me.IsElf())의 끝
	// 자이언트 테섭 이후, 스킬 랭크업 퀘스트들을 준비해서 바꿔주어야 합니다.
	// by jisangs, 2006/12/13
	else
	if (me.IsGiant())
	{
		//스매시 C가 되면 리프 어택 습득 퀘스트 by eljjoo 2010-06-29
		//G13S1 리프 어택 스킬 추가 이후부터
		if (IsEnable(`featureAssaultSlash`) extern (`data/script/features.mint`))
		{
			if (_idSkill == 20002 && _iLevel == 4)
			{
				me.AddGameQuest(200430,0);
			}
		}
		//컴뱃 B
		if (_idSkill == 23002 && _iLevel == 5)
		{
			me.AddGameQuest(200442, 10);
		}
		//스매시 A
		if (
			_idSkill == 20002 && _iLevel == 6)
		{
			me.AddGameQuest(200443, 10);
		}
		//카운터 B
		if (_idSkill == 20003 && _iLevel == 5)
		{
			me.AddGameQuest(200444, 20);
		}
		//윈드밀 D
		if (_idSkill == 22001 && _iLevel == 3)
		{
			me.AddGameQuest(200445, 15);
		}
		//던지기 공격 9
		if (_idSkill == 21010 && _iLevel == 7)
		{
			me.AddGameQuest(200446, 10);
		}
		//발구르기 B
		if (_idSkill == 22007 && _iLevel == 5)
		{
			me.AddGameQuest(200447, 10);
		}
		//힐링 E
		if (_idSkill == 30006 && _iLevel == 2)
		{
			me.AddGameQuest(200448, 10);
		}
		if (GetVersion()>=704)
		{
			//악기연주 E
			if (_idSkill == 10003 && _iLevel == 2)
			{
				me.AddGameQuest(200449, 10);
			}
			//작곡 F
			if (_idSkill == 10005 && _iLevel == 1)
			{
				me.AddGameQuest(200450, 10);
			}
			//음악지식 E
			if (_idSkill == 10006 && _iLevel == 2)
			{
				me.AddGameQuest(200451, 15);
			}
		}
		//캠프파이어 F
		if (_idSkill == 10008 && _iLevel == 1)
		{
			me.AddGameQuest(200452, 40);
		}
		//옷만들기 랭크 D
		if (_idSkill == 10001 && _iLevel == 3)
		{
			me.AddGameQuest(200453, 15);
		}
		//방직 D
		if (_idSkill == 10011 && _iLevel == 3)
		{
			me.AddGameQuest(200454, 20);
		}
	}//자이언트일 경우의 끝

	//합주 액션 배우기
	if(_idSkill==10003 || _idSkill==10006 )
	{
		// DebugOut(`합주 액션을 줄 지도 모르는 단계`);
		if(me.GetSkillLevel(10003)>=4 && me.GetSkillLevel(10006)>=4)
		{
			// DebugOut(`악기 연주와 음악적 지식이 모두 C랭이다`);
			if(GetVersion() >= 602)
			{
				// DebugOut(`줘도 되는 시즌이다`);

				if(!me.IsUsableSkill(50022))//합주 액션을 모른다
				{
					// DebugOut(`합주 액션을 모른다`);

					if(!me.IsQuestTried(200468))
					{
						// DebugOut(`퀘스트를 한 적이 없으니 준다`);
						me.AddGameQuest(200468,1);
					}
				}
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnGameQuestGet(character me, int _idQuest)
// : PC가 퀘스트를 받는 순간 불리는 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오
	//////////////////////////////////////////////////////////////////////////////////
	//	G9 ~G11메인스트림 관련
	//	29xxxx 아이디 대역으로 분류하는 건 좀 위험.
	//////////////////////////////////////////////////////////////////////////////////
	if (_idQuest >= 290001 && _idQuest <= 290012)
	{
		OnG9MainQuestBegin(me,_idQuest) extern(`data/script/Event/g9_event.mint`);
	}
	else if (_idQuest == 292015)
	{
		OnG11MainQuestGet(me, _idQuest) extern(`data/script/Event/g11_event.mint`);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnGameQuestCompleted(character me, int _idQuest, bool _bSuccess)
// : 게임 퀘스트를 완료 혹은 실패 했을 때
//////////////////////////////////////////////////////////////////////////////////
{



	///////////////////////////////////////////////////////
	//
	//	튜토리얼 관련 퀘스트를 실패하거나 성공했을 경우
	//
	///////////////////////////////////////////////////////

	OnTutorialQuestCompleted(me, _idQuest, _bSuccess) extern(`data/script/Event/tutorial_event.mint`);



	///////////////////////////////////////////////////////
	//
	//	이벤트 관련 퀘스트를 실패하거나 성공했을 경우
	//
	///////////////////////////////////////////////////////

	OnEventQuestCompleted(me, _idQuest, _bSuccess) extern(`data/script/Event/game_event.mint`);



	if (_bSuccess)
	{
		//////////////////////////////////////////////////////////////////////////////////
		//	G9 ~G11메인스트림 관련
		//	29xxxx 아이디 대역으로 분류하는 건 좀 위험.
		//////////////////////////////////////////////////////////////////////////////////

		if (_idQuest >= 290001 && _idQuest <= 290900)
		{
			OnG9MainQuestClear(me, _idQuest) extern(`data/script/Event/g9_event.mint`);
		}
		if (_idQuest >= 291001 && _idQuest <= 291900)
		{
			OnG10MainQuestClear(me, _idQuest) extern(`data/script/Event/g10_event.mint`);
		}
		if (_idQuest >= 292001 && _idQuest <= 292900)
		{
			OnG11MainQuestClear(me, _idQuest) extern(`data/script/Event/g11_event.mint`);
		}

		if (_idQuest >= 293001 && _idQuest <= 293900)
		{
			OnG12MainQuestClear(me, _idQuest) extern(`data/script/Event/g12_event.mint`);
		}

		if (_idQuest >= 294001 && _idQuest <= 294900)
		{
			OnG13MainQuestClear(me, _idQuest) extern(`data/script/Event/g13_event.mint`);
		}


		//////////////////////////////////////////////////////////////////////////////////
		//	메모리얼 퀘스트 완료 시 XX의 후예 타이틀 부여
		//////////////////////////////////////////////////////////////////////////////////
		if (_idQuest == 207004)
		{
			me.DoStript(`addtitle(10053)`);
		}
		if (_idQuest == 207005)
		{
			me.DoStript(`addtitle(10055)`);
		}
	}



DebugOut(`게임 퀘스트 포기`);
	if(_idQuest ==200251 && !_bSuccess)
	{
DebugOut(`에트나의 음악적 지식 퀘스트 포기 or 성공`);
		me.RemoveKeyword(`skill_train_musicknow_9rank`);
	}
	if(_idQuest ==200252 && !_bSuccess)
	{
DebugOut(`에피의 작곡 퀘스트 포기 or 성공`);
		me.RemoveKeyword(`skill_train_compose_8rank`);
	}
	if(_idQuest ==200253 && !_bSuccess)
	{
DebugOut(`힐브린의 응급치료 퀘스트 포기 or 성공`);
		me.RemoveKeyword(`skill_train_firstaid_Drank`);
	}
	if(_idQuest ==200254 && !_bSuccess)
	{
DebugOut(`힐브린의 응급치료 퀘스트 포기 or 성공`);
		me.RemoveKeyword(`skill_train_firstaid_Crank`);
	}

	//탐험 퀘스트를 포기했을때
	if(_idQuest>=300000 && _idQuest<400000)// &&!_bSuccess)
	{
		EraseExpQuestKeyword(me,_idQuest) extern(`data/script/Event/exploration_event.mint`);
	}


	// 엘프 , 자이언트  야수화 퀘스트 진행 2007.05.13. -uhihiho, Kurt
	// 결제 여부와 상관없이 기존 키워드 없애고 하는 건 적용되어야 해서, 따로 뺌 - uhihiho

	if (((_idQuest == 260005) || (_idQuest == 260006) || (_idQuest == 260007)) && _bSuccess )
	{
		me.RemoveKeyword(`g6_common_PatternInvestigation`);
		if(me.IsElf())
		{
			me.AddKeyword(`g6_elf_07`);		// 발레스 잠입
		}
	}

	if( !IsTestServer() &&
		(me.IsUsableServiceBeast() || IsDevelopment()) &&
		GetVersion() >= 604 &&
		_bSuccess &&
		(me.IsElf() || me.IsGiant()) &&
		!me.HaveKeyword(`g6_elf_complete`) &&
		!me.HaveKeyword(`g6_giant_complete`)
	  )
	{
		if (_idQuest == 260002)
		{
			me.AddGameQuest(260003,12);
		}

		if (_idQuest == 260003)
		{
			me.AddGameQuest(260011, 12);
		}

		if (
			(_idQuest == 260005) ||
			(_idQuest == 260006) ||
			(_idQuest == 260007)   )
		{
			me.RemoveKeyword(`g6_common_PatternInvestigation`);
			if(me.IsElf())
			{
				me.AddKeyword(`g6_elf_07`);
				// 발레스 잠입
				me.AddGameQuest(260008, 0);
			}
			else if(me.IsGiant())
			{
				// 필리아 잠입
				me.AddGameQuest(270003, 0);
			}

		}

		if (_idQuest == 270003)
		{
			me.AddGameQuest(270004, 12);
		}

		if (_idQuest == 260008 )
		{
			me.AddGameQuest(260009, 12);
		}
		if (_idQuest == 260009)
		{
			me.AddGameQuest(260010, 30);
		}
		if (_idQuest == 270003)
		{
			me.AddGameQuest(270004, 30);
		}
	}

// 엘프 , 자이언트 야수화 퀘스트 진행 여기까지




//--------------------------------------------------------------------------------
// G10S2 리리스 퀘스트 완료하면 다음 퀘 연결해서 준당.

	if (_idQuest == 291102 && _bSuccess)
	{
		me.AddGameQuest(291103, 0);	// 즉시 줍시당!
	}




//--------------------------------------------------------------------------------
//G1 여신강림 스토리 진행 관련 퀘스트
//이 부분은 잘못 막을 경우, 복구가 힘드므로 피쳐매트릭스에서 막지 않는다.
//대신에 G1 시작부분이 막혀있으므로 ok


	//마족의 책 번역의뢰 -> 번역된 책 받아가기
	if (_idQuest == 210003 && _bSuccess)
	{
		me.AddGameQuest(210004, 18);	//플레이타임2시간 ->G1 난이도 하락으로 3분으로 수정
	}
	if (_idQuest == 211003 && _bSuccess)
	{
		me.AddGameQuest(211004, 18);	//플레이타임2시간 ->G1 난이도 하락으로 3분으로 수정
	}

	//마족의 책 2권 주문 -> 택배원의 메모 받아가기
	if (_idQuest == 210005 && _bSuccess)
	{
		me.AddGameQuest(210006, 18);	//플레이타임 2시간 ->G1 난이도 하락으로 3분으로 수정

	}
	//마족의 책 2권 주문 -> 택배원의 메모 받아가기
	if (_idQuest == 211005 && _bSuccess)
	{
		me.AddGameQuest(211006, 18);	//플레이타임 2시간 ->G1 난이도 하락으로 3분으로 수정

	}

	//마족의책 2권 번역본 받아가기 -> 마족의책3권퀘스트
	if (_idQuest == 210007 && _bSuccess)
	{
		me.AddGameQuest(210008, 12);	//플레이타임 2시간 ->G1 난이도 하락으로 2분으로 수정
	}
	//마족의책 2권 번역본 받아가기 -> 마족의책3권퀘스트
	if (_idQuest == 211007 && _bSuccess)
	{
		me.AddGameQuest(211008, 12);	//플레이타임 2시간 ->G1 난이도 하락으로 2분으로 수정
	}

	//마족의책3권퀘스트I -> 마족의책3권퀘스트II
	if (_idQuest == 210008 && _bSuccess)
	{
		me.AddGameQuest(210012, 0);
	}
	//마족의책3권퀘스트I -> 마족의책3권퀘스트II
	if (_idQuest == 211008 && _bSuccess)
	{
		me.AddGameQuest(211012, 0);
	}

	//마족의책3권퀘스트II -> 마족의책3권 번역본 받아가기
	if (_idQuest == 210012 && _bSuccess)
	{
		me.AddGameQuest(210009, 12);	//플레이타임 2시간 ->G1 난이도 하락으로 2분으로 수정
	}
	//마족의책3권퀘스트II -> 마족의책3권 번역본 받아가기
	if (_idQuest == 211012 && _bSuccess)
	{
		me.AddGameQuest(211009, 12);	//플레이타임 2시간 ->G1 난이도 하락으로 2분으로 수정
	}

//--------------------------------------------------------------------------------
//G2 팔라딘 스토리 진행 관련 퀘스트
//이 부분은 잘못 막을 경우, 복구가 힘드므로 피쳐매트릭스에서 막지 않는다.
//대신에 G2 시작부분이 막혀있으므로 ok

	if ((_idQuest == 220001 && _bSuccess) || (_idQuest == 221001 && _bSuccess))
	{
		me.AddKeyword(`g2_05`);
		me.RemoveKeyword(`g2_04`);
	}

	if (_idQuest == 220006 && _bSuccess)
	{
		//이 전에, g2_event.mint에서 삭제해주고는 있지만, 일단 그냥 놔둡니다.
		me.RemoveKeyword(`g2_08`);
	}
	if (_idQuest == 220040 && _bSuccess)
	{
		me.AddKeyword(`g2_24`);
		me.RemoveKeyword(`g2_23`);

	}
	if (_idQuest == 220041 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.

		if (IsDevelopment())
		{
			me.AddGameQuest(220042, 0);
		}
		else
		{
			me.AddGameQuest(220042, 36);		//일반서버 6분
		}

		me.AddKeyword(`g2_30`);
		me.RemoveKeyword(`g2_29`);

	}
	if (_idQuest == 220042 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220043, 0);
		}
		else
		{
			me.AddGameQuest(220043, 36);		//일반서버 6분
		}

		me.AddKeyword(`g2_31`);
		me.RemoveKeyword(`g2_30`);

	}
	if (_idQuest == 220043 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220044, 0);
		}
		else
		{
			me.AddGameQuest(220044, 36);		//일반서버 6분
		}

		me.AddKeyword(`g2_32`);
		me.RemoveKeyword(`g2_31`);

	}
	if (_idQuest == 220044 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220045, 0);
		}
		else
		{
			me.AddGameQuest(220045, 12);		//일반서버 2분
		}

		me.AddKeyword(`g2_33`);
		me.RemoveKeyword(`g2_32`);

	}
	if (_idQuest == 220045 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220046, 0);
		}
		else
		{
			me.AddGameQuest(220046, 12);		//일반서버 2분
		}

		me.AddKeyword(`g2_34`);
		me.RemoveKeyword(`g2_33`);

	}
	if (_idQuest == 220046 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220047, 0);
		}
		else
		{
			me.AddGameQuest(220047, 12);		//일반서버 2분
		}

		me.AddKeyword(`g2_35`);
		me.RemoveKeyword(`g2_34`);

	}
	if (_idQuest == 220050 && _bSuccess) //미스릴 갑옷 퀘스트
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220051, 0);
		}
		else
		{
			me.AddGameQuest(220051, 12);		//2분
		}
	}
	if (_idQuest == 220051 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220052, 0);
		}
		else
		{
			me.AddGameQuest(220052, 12);		//2분
		}
	}
	if (_idQuest == 220052 && _bSuccess)
	{
		//개발서버면 퀘스트를 바로 준다.
		if (IsDevelopment())
		{
			me.AddGameQuest(220053, 0);
		}
		else
		{
			me.AddGameQuest(220053, 12);		//2분
		}
	}
	//구 G2 이상형 퀘스트
//	if ((_idQuest == 220031 && _bSuccess && me.IsQuestCompleted(220032))
//	|| (_idQuest == 220032 && _bSuccess && me.IsQuestCompleted(220031)))
//	{
//		me.AddGameQuest(220033, 0);
//		me.AddGameQuest(220034, 0);
//	}
//	if ((_idQuest == 220033 && _bSuccess && me.IsQuestCompleted(220034))
//	|| (_idQuest == 220034 && _bSuccess && me.IsQuestCompleted(220033)))
//	{
//		me.AddGameQuest(220035, 0);
//		me.AddGameQuest(220036, 0);
//	}
//	if ((_idQuest == 220035 && _bSuccess && me.IsQuestCompleted(220036))
//	|| (_idQuest == 220036 && _bSuccess && me.IsQuestCompleted(220035)))
//	{
//		me.AddGameQuest(220037, 0);
//		me.AddGameQuest(220038, 0);
//	}
//	if ((_idQuest == 220037 && _bSuccess && me.IsQuestCompleted(220038))
//	|| (_idQuest == 220038 && _bSuccess && me.IsQuestCompleted(220037)))
//	{
//		me.AddGameQuest(220040, 0);
//		me.AddKeyword(`g2_23`);
//		me.RemoveKeyword(`g2_22`);
//	}
	if (_idQuest == 220054 && _bSuccess && me.IsQuestCompleted(220054))
	{
		me.AddGameQuest(220055, 0);
		me.RemoveItemCls(74161);
	}
	if (_idQuest == 220055 && _bSuccess && me.IsQuestCompleted(220055))
	{
		me.AddGameQuest(220056, 0);
		me.RemoveItemCls(74162);
	}
	if (_idQuest == 220056 && _bSuccess && me.IsQuestCompleted(220056))
	{
		me.AddGameQuest(220057, 0);
		me.RemoveItemCls(74163);
	}
	if (_idQuest == 220057 && _bSuccess && me.IsQuestCompleted(220057))
	{
		me.AddGameQuest(220040, 0);
		me.RemoveItemCls(74164);
		me.AddKeyword(`g2_23`);
		me.RemoveKeyword(`g2_22`);
	}

//--------------------------------------------------------------------------------
//G3  다크나이트
	if (_idQuest == 230000 && _bSuccess)	//타르라크의 컬렉션 북 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=360;	//1시간
		}

		if(me.IsFemale())	//성별에 따라 이멘 마하 던전 복구 퀘스트를 등록
		{
			// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
			if (GetVersion() >= 403
//				&& GetLocale().LowerCase() == `korea`.LowerCase()
			)
			{
				me.AddGameQuest(230041, Questdelay);	// 이멘 마하 던전복구 - 여자
			}
			else
			{
				me.AddGameQuest(230001, Questdelay);
			}
		}
		else
		{
			// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
			if (GetVersion() >= 403
//				&& GetLocale().LowerCase() == `korea`.LowerCase()
			)
			{
				me.AddGameQuest(230042, Questdelay);	// 이멘 마하 던전복구 - 남자
			}
			else
			{
				me.AddGameQuest(230002, Questdelay);
			}
		}
	}

	if(
		(_idQuest == 230001 && _bSuccess) || (_idQuest == 230002 && _bSuccess)	//이멘 마하 던전 복구 퀘스트를 끝냈으면
		|| (_idQuest == 230041 && _bSuccess) || (_idQuest == 230042 && _bSuccess)	// G3 난이도 하향 이멘 마하 던전 복구 퀘스트를 끝냈으면
	)
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//2시간
		}

		// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
		if (GetVersion() >= 403
//			&& GetLocale().LowerCase() == `korea`.LowerCase()
		)
		{
			me.AddGameQuest(230043, Questdelay);	// 반호르 던전 복구
		}
		else
		{
			me.AddGameQuest(230006, Questdelay);
		}
	}

	if (
		(_idQuest == 230006 && _bSuccess)	//반호르 던전 퀘스트를 끝냈으면 성별에 따라 던바튼 던전 퀘스트
		|| (_idQuest == 230043 && _bSuccess)	// G3 난이도 하향 반호르 던전 퀘스트를 끝냈으면 성별에 따라 던바튼 던전 퀘스트
	)
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//1시간
		}

		if(me.IsFemale())	//성별에 따라 윌로우의 퀘스트를 등록
		{
			// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
			if (GetVersion() >= 403
//				&& GetLocale().LowerCase() == `korea`.LowerCase()
			)
			{
				me.AddGameQuest(230044, Questdelay);	// 던바튼 던전 복구 - 여자
			}
			else
			{
				me.AddGameQuest(230009, Questdelay);
			}
		}
		else
		{
			// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
			if (GetVersion() >= 403
//				&& GetLocale().LowerCase() == `korea`.LowerCase()
			)
			{
				me.AddGameQuest(230045, Questdelay);	// 던바튼 던전 복구 - 남자
			}
			else
			{
				me.AddGameQuest(230010, Questdelay);
			}
		}
	}

	if(
		(_idQuest == 230009 && _bSuccess) || (_idQuest == 230010 && _bSuccess)	//던바튼 던전 복구 퀘스트를 끝냈으면
		|| (_idQuest == 230044 && _bSuccess) || (_idQuest == 230045 && _bSuccess)	// G3 난이도 하향 던바튼 던전 복구 퀘스트를 끝냈으면
	)
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//1시간
		}

		// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
		if (GetVersion() >= 403
//			&& GetLocale().LowerCase() == `korea`.LowerCase()
		)
		{
			me.AddGameQuest(230046, Questdelay);	// 티르 코네일 던전 복구
		}
		else
		{
			me.AddGameQuest(230013, Questdelay);	//티르 코네일 던전 복구
		}
	}

	if((_idQuest == 230016 && _bSuccess) || (_idQuest == 230017 && _bSuccess))	//도르카 페다인 의미 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//1시간
		}

		me.AddGameQuest(230018, Questdelay);	//타르라크의 요청
	}

	if((_idQuest == 230018 && _bSuccess))	//타르라크의 요청 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=180;		//30분
		}

		// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
		if (GetVersion() >= 403
/*
			&& GetLocale().LowerCase() == `korea`.LowerCase()
			||
			((GetGeneration() == 4 && GetSeason() >= 1 || GetGeneration() >= 5)
			&& GetLocale().LowerCase() == `japan`.LowerCase())	// 일본 G4S1 패치 이후로 적용
*/
		)
		{
			me.AddGameQuest(230047, Questdelay);	//영혼의 포션
		}
		else
		{
			me.AddGameQuest(230019, Questdelay);	//영혼의 포션
		}
	}

	if((_idQuest == 230019 && _bSuccess))	//영혼의 포션 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//2시간
		}

		me.AddGameQuest(230020, Questdelay);	//제임스의 의뢰
	}

	// G3 난이도 하향
	if((_idQuest == 230047 && _bSuccess))	//영혼의 포션 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=720;		//2시간
		}

		me.AddGameQuest(230020, Questdelay);	//제임스의 의뢰
	}

//--------------------------------------------------------------------------------
//G3  다크나이트 입수

	if((_idQuest == 230101 && _bSuccess))	//타르라크 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=6;		//1분?
		}

		me.AddGameQuest(230102, Questdelay);	//갑옷조각 모으기
	}

	if((_idQuest == 230102 && _bSuccess))	//영혼의 포션 퀘스트를 끝냈으면
	{
		int Questdelay=0;
		if (!IsDevelopment())		//개발서버면 퀘스트를 바로 준다.
		{
			Questdelay=6;		//1분?
		}

		me.AddGameQuest(230104, Questdelay);	//갑옷 제거
	}



//--------------------------------------------------------------------------------
//G7S4  타우네스와 아트라타 퀘스트


	if((_idQuest == 280108 && _bSuccess))	// g7s4 의 마지막 퀘스트를 완료했다면
	{
		me.AddKeyword(`Elf_oblivion`);	// 망각의 엘프
	}


//--------------------------------------------------------------------------------
//G8S1  퀘스트

	// 크루크 원정대
	if (_idQuest == 280201 && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 36;
		}

		if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(280210,delay);
		}
		else
		{
			me.AddGameQuest(280202,delay);
		}
	}


	// 에피의 동생
	if ((_idQuest == 280202 || _idQuest == 280210) && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 36;
		}

		if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(280211,delay);
		}
		else
		{
			me.AddGameQuest(280203,delay);
		}
	}

	// 아트라타의 편지
	if ((_idQuest == 280203 || _idQuest == 280211) && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 36;
		}

		if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(280212,delay);
		}
		else
		{
			me.AddGameQuest(280204,delay);
		}
	}

	// 아트라타의 편지
	if ((_idQuest == 280204 || _idQuest == 280212) && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 36;
		}

		if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(280213,delay);
		}
		else
		{
			me.AddGameQuest(280205,delay);
		}
	}

	// 레드 드래곤 돕기
	if ((_idQuest == 280205 || _idQuest == 280213) && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 36;
		}
		me.AddGameQuest(280206, delay);
	}

	if (_idQuest == 280207 && _bSuccess)
	{
		int delay = 0;
		if (!IsDevelopment())
		{
			delay = 6;
		}
		me.AddGameQuest(280208, delay);
	}


	// 포기 가능한 필수 탐사 퀘스트를 받았을 경우의 처리
	// 이 경우는 복구가 끝났으므로 주석 처리 - by nicolas. 2006.03.13
	/*
	if (_idQuest == 301025
		&& !_bSuccess
		&& !me.IsQuestCompleted(301025))
	{
		me.AddExploQuest(301025,5);
	}
	else if (_idQuest == 301031
		&& !_bSuccess
		&& !me.IsQuestCompleted(301031))
	{
		me.AddExploQuest(301031,10);
	}
	else if (_idQuest == 301030
		&& !_bSuccess
		&& !me.IsQuestCompleted(301030))
	{
		me.AddExploQuest(301030,15);
	}
	else if (_idQuest == 301034
		&& !_bSuccess
		&& !me.IsQuestCompleted(301034))
	{
		me.AddExploQuest(301034,20);
	}
	*/
	//콘누스 다리 놓기 퀘스트를 포기하거나 성공했을 때, 이런 거 하려다가 서버 죽어서 방식을 바꾸고 있음
	/*if (_idQuest == 200241)
	{
		// DebugOut(`다리를 다 놓았다. 수행기록을 지우자.`);
		me.CleanQuestHistory(200241);
	}
	if (_idQuest == 200242)
	{
		me.CleanQuestHistory(200242);
	}
	if (_idQuest == 200243)
	{
		me.CleanQuestHistory(200243);
	}
	if (_idQuest == 200244)
	{
		me.CleanQuestHistory(200244);
	}
	if (_idQuest == 200245)
	{
		me.CleanQuestHistory(200245);
	}
	if (_idQuest == 200246)
	{
		me.CleanQuestHistory(200246);
	}
	if (_idQuest == 200247)
	{
		me.CleanQuestHistory(200247);
	}*/
}

//////////////////////////////////////////////////////////////////////////////////
server void OnPartyQuestCompleted(character me, int _idQuest)
// : 게임 퀘스트를 완료했을 때. 리더만 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`파티 퀘스트 완료 : ` + me.GetGeneralName() + ToString(_idQuest));
	//대만 파티 붸스트 이벤트
	if (IsCurrentEvent(`partyquest2008_taiwan`))
	{
		if (_idQuest >= 100096 && _idQuest <= 100143)
		{
			if (me == (me.GetParty()).GetLeader())
			{
				int questnum = 100144 + Random(9);
				// DebugOut(`[` + ToString(_idQuest) + `]퀘스트 완료 > [` + ToString(questnum) + `]퀘스트 지급`);
				me.AddQuest(questnum);
			}
		}
		else if (_idQuest >= 100144 && _idQuest <= 100152)
		{
			if (me == (me.GetParty()).GetLeader())
			{
				object_list objPartyList = (me.GetParty()).GetMemberList();
				int partynum = objPartyList.GetSize();
				character cChar;
				int i = 0;
				if (me.IsQuestTimeout(_idQuest))
				{
					for (i; i < partynum; i++)
					{
						cChar = (character)objPartyList.GetValue(i);
						cChar.AddQuest(30108);
					}
				}
				else
				{
					for (i; i < partynum; i++)
					{
						cChar = (character)objPartyList.GetValue(i);
						cChar.AddQuest(30107);
					}
				}
			}
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool GetRespawnList(
	character me,
	string& _list)
// : 현재 가능한 리스폰 리스트를 리턴한다.
// : 현재 `town;here;stay;nao;dungeon_lobby;dungeon_statue;arena_lobby;arena_side` 가능
////////////////////////////////////////////////////////////////////////////////
{
	// 티르나노이 하드코딩
	// task[2265]
	if (me.GetRegionGroupId() == 300 )	// 티르나노이 필드
	{
		// 바인드 이후
		if ((me.IsQuestCompleted(210011) || me.IsQuestCompleted(211011) || me.IsQuestCompleted(211111)) && me.HaveKeyword(`g1_bind`))
		{
			_list = `tirnanog;here;stay`;
		}
		// 바인드 이전
		else
		{
			_list = `barri_lobby;stay`;
		}
		// 오버라이드 했다는 의미로 return true;
		return true;
	}
	else if (me.GetRegionGroupId() == 10300)	// 티르나노이 던전
	{
		// 바인드 이후
		if ((me.IsQuestCompleted(210011) || me.IsQuestCompleted(211011) || me.IsQuestCompleted(211111)) && me.HaveKeyword(`g1_bind`))
		{
			_list = `tirnanog;stay`;
		}
		// 바인드 이전
		else
		{
			_list = `barri_lobby;stay`;
		}
		// 오버라이드 했다는 의미로 return true;
		return true;
	}
	//예전 틴 지역에서 사망시 리스폰 장소
	else
	if (me.GetRegionId() == 1004)
	{
		if (me.GetRebirthCount()>0)
		{
			_list = `tirchonaill;here;stay;nao`;
		}
		else
		{
			_list = `here_tutorial;stay;nao`;
		}

		return true;
	}
	//새로운 틴 지역 (G8S3) 에서 사망시 리스폰 장소
	else
	if (me.GetRegionId() == 125)
	{
		if (me.GetRebirthCount()>0)
		{
			_list = `tirchonaill;here;stay;nao`;
		}
		else
		{
			_list = `here_tutorial;stay;nao`;
		}

		return true;
	}

	else
	if (me.GetRegionId() == 78 || me.GetRegionId() == 83 || me.GetRegionId() == 84)	//바올 던전 로비, 저세상 가이레흐. 저세상 반호르 나오부활 불가능
	{
		_list = `town;here;stay`;
		return true;
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneLeaveDungeon(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : RP던전에서 쫓겨나는 컷신 종료 후 호출된다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 던전을 나가라
	me.LeaveDungeon();
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_TirChonaill(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 티르코네일 진입 컷신 본 후 이동시켜주기
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`))
	{
		me.Move(`Uladh_main/town_TirChonaill/TirChonaill_Spawn_B`);
	}
	else if(
		(GetLocale().LowerCase()==`korea`)
		|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
			&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
	)	//G3S4 마비노기 튠업
	{
		me.Move(1,15200+Random(100),38400+Random(100));
	}
	else
	{
		me.Move(`Uladh_main/town_TirChonaill/inportal_from_tutorial`);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_go_moon(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 티르코네일 진입 컷신 본 후 이동시켜주기
//////////////////////////////////////////////////////////////////////////////////
{
	// 15m 이상 올라갔었다는 키워드 제공 및 달로 워프
	if(me.GetCompletedQuestObjectiveCount(201122)==1)
	{
		me.AddKeyword(`newyear2009_korea_high`);
	}
	me.Move(1003,7643,6731);//달 좌표
}

////////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G7_S3_intro(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
{
	me.AddKeyword(`g7s3`);
	me.AddKeyword(`g7s3_01`);
	me.AddGameQuest(280001, 2);

	// 원래 가려던 곳으로 가라
	me.LeaveEventRegion();
}
////////////////////////////////////////////////////////////////////////////////////

server void OnCutSceneEnded_G7_S3_Raphitea(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
{
// 리파이 차를 꿍쳐놨다가, 컷신 본후 다시 사용할 수도 있다. 퀘스트가 2개가 되면 안되니까.
	if(!me.IsQuestTried(280002)
		&& me.HaveKeyword(`g7s3_02`))
	{
		me.AddGameQuest(280002, 1);
	}
	me.RemoveKeyword(`g7s3_02`);
	me.AddKeyword(`g7s3_03`);

	// 원래 가려던 곳으로 가라
//	me.LeaveEventRegion();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Eiry_GoodBye(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G3S4 아이리 바이바이 컷신 후 키워드 지우기
//////////////////////////////////////////////////////////////////////////////////
{
	me.RemoveKeyword(`ShowEgoByebyeCutScene`);
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Emainmach_telescope(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 이멘마하 망원경 컷신 본후 사념파
//////////////////////////////////////////////////////////////////////////////////
{
	int i = Random(10000);
	int len = ToString(i).GetLength();
	string message;
	if (len == 0)
	{
		message = ["event.pc_event.2"];
	}
	else
	if (len == 1)
	{
		message = ["event.pc_event.3"]+ToString(i);
	}
	else
	if (len == 2)
	{
		message = ["event.pc_event.4"]+ ToString (i);
	}
	else
	if (len == 3)
	{
		message = ["event.pc_event.5"]+ ToString (i);
	}
	else
	{
		message = ToString(i);
	}

	me.ShowCaption(message + ["event.pc_event.6"]);

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_into_the_Scary_School(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 티르코네일 진입 컷신 본 후 이동시켜주기
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(76,10200,7600);//무서운 도서관
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Courcle_Ruin_Lightning(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G7S2 쿠르클레 유적 본 후 루에리 컷신 보여줄지 처리
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(3300,80470,125710);
	if (
		me.HaveKeyword(`CourcleRuinCutscene_Lightning`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Sun`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Snow`)
	)
	{
		me.AddKeyword(`jungle_ruins`);
		me.RemoveKeyword(`CourcleRuinCutscene_Lightning`);
		me.RemoveKeyword(`CourcleRuinCutscene_Sun`);
		me.RemoveKeyword(`CourcleRuinCutscene_Snow`);
	}
	if (me.HaveKeyword(`jungle_ruins`))
	{
		me.PlayCutScene(`weather_changer_center`, 3000);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Courcle_Ruin_Snow(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G7S2 쿠르클레 유적 본 후 루에리 컷신 보여줄지 처리
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(3300,83134,122428);
	if (
		me.HaveKeyword(`CourcleRuinCutscene_Lightning`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Sun`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Snow`)
	)
	{
		me.AddKeyword(`jungle_ruins`);
		me.RemoveKeyword(`CourcleRuinCutscene_Lightning`);
		me.RemoveKeyword(`CourcleRuinCutscene_Sun`);
		me.RemoveKeyword(`CourcleRuinCutscene_Snow`);
	}
	if (me.HaveKeyword(`jungle_ruins`))
	{
		me.PlayCutScene(`weather_changer_center`, 3000);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Courcle_Ruin_Sun(
	character me,				// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G7S2 쿠르클레 유적 본 후 루에리 컷신 보여줄지 처리
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(3300,85831,125889);
	if (
		me.HaveKeyword(`CourcleRuinCutscene_Lightning`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Sun`) &&
		me.HaveKeyword(`CourcleRuinCutscene_Snow`)
	)
	{
		me.AddKeyword(`jungle_ruins`);
		me.RemoveKeyword(`CourcleRuinCutscene_Lightning`);
		me.RemoveKeyword(`CourcleRuinCutscene_Sun`);
		me.RemoveKeyword(`CourcleRuinCutscene_Snow`);
	}
	if (me.HaveKeyword(`jungle_ruins`))
	{
		me.PlayCutScene(`weather_changer_center`, 3000);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Tutorial_Tin(
	character me,
	object_list _cMemberList)				// 컷신을 본 나.
// : G8S3나 북미 이후 틴 컷신 본 후 처리
//////////////////////////////////////////////////////////////////////////////////
{

//	아이리 제공
	if(!me.GetEgoWeapon().IsValid())
	{
		/*//한국 G13 S1 이후 생성된 캐릭터에게 직업에 맞는 아이리 무기를 준다. by eljjoo 2010.06.20
		if (me.HaveKeyword(`new_character_after_g13`))
		{
			//아이리가 될 무기 ID. 디폴트는 연습용 숏 소드 (예전 상태, 지금은 기사랑 상인, 모험가에게만 준다.)
			int egoWeaponID = 40094;
			//정령 무기 타입 값, 디폴트는 9
			int egoWeaponType = 9;

			if (me.IsWizard()) //마법사라면 단검을 준다.
			{
				DebugOut(`마법사니 단검을 준다.`);
				egoWeaponID = 40006;
			}
			else if (me.IsBard()) //음유 시인이라면 휘슬을 준다.
			{
				DebugOut(`음유 시인에게는 휘슬을 준다.`);
				egoWeaponID = 40048;
				egoWeaponType = 14;
			}
			else if (me.IsAlchemist()) //연금술사라면 실린더를 준다.
			{
				DebugOut(`연금술사니 실린더를 준다.`);
				egoWeaponID = 40371; //아이리 실린더를 위해 /not_ego/가 빠진 튜토리얼에서만 지급되는 실린더
				egoWeaponType = 13;
			}
			me.AddItem(egoWeaponID);
			object_list itemlist = me.GetItemList(egoWeaponID);
			me.MakeEgoWeapon((item)itemlist.GetValue(0), egoWeaponType, ["npc.variable.tin.106"]);
		//      아래 FirstMeetEgoBeginnerSword 키워드는 알비 던전 동영상과 충돌이 있으므로 알비 던전에 들어가게 될 때 강제 소멸시킨다.
			me.AddKeyword(`FirstMeetEgoBeginnerSword`);
			me.AddKeyword(`HiddenEgoOption`);
			me.AddKeyword(`HaventSeeMiniMap`);

			//연금술사에게는 워터 캐논 결정을 쥐어주자.
			if (me.IsAlchemist())
			{
				me.AddItem(65003,20);
			}
		}
		else*/
		//{
			DebugOut(`G13S1이전 캐릭터`);
			me.AddItem(40094);
			object_list itemlist = me.GetItemList(40094);
			me.MakeEgoWeapon((item)itemlist.GetValue(0), 9, ["npc.variable.tin.106"]);
		//      아래 FirstMeetEgoBeginnerSword 키워드는 알비 던전 동영상과 충돌이 있으므로 알비 던전에 들어가게 될 때 강제 소멸시킨다.
			me.AddKeyword(`FirstMeetEgoBeginnerSword`);
			me.AddKeyword(`HiddenEgoOption`);
			me.AddKeyword(`HaventSeeMiniMap`);
		//}
	}

	//틴 옆으로 이동
	me.Move(125,23048,74954);
	if (IsEnable(`featureNewbieMovie`) extern (`data/script/features.mint`))
	{
	me.TalkToEgo();
	}


	if (IsEnable(`Newbie_Guide_Movie`) extern (`data/script/features.mint`))
	{
	me.TalkToEgo();
	}




}



//////////////////////////////////
server void
GetAdvancedItemListForPersonal_G9S1(meta_array strGift)
///////////////////////////////////
{
	//염색앰플, 금속염색앰플. 일요일
	strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);
	//완전회복 포션, 원격 연금술사의 집, 회복속도 증가의 포션.  월요일
	strGift.Add(`id:51031 count:1|id:63188 count:1|id:63058 count:1`);
	//원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
	strGift.Add(`id:63070 count:2|id:63057 count:2`);
	//캠프 키트, 원격 대장간 수리 이용권. 수요일
	strGift.Add(`id:63039 expire:10080|id:63056 count:2`);
	// 캠프파이어 키트, 원격 관청, 원격 은행. 목요일
	strGift.Add(`id:63029 count:2|id:63071 count:2|id:63026 count:2`);
	//원격 힐러집 이용권, 거대한 외침의 뿔피리(7일), 외침의 뿔피리(7일). 금요일
	strGift.Add(`id:63047 count:2|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080`);
	//생명력의 엘릭서(7일), 마나의 엘릭서(7일), 스태미나의 엘릭서(7일). 토요일
	strGift.Add(`id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);
}

//////////////////////////////////
server void
GetAdvancedItemListForPremiumPC_G9S1(meta_array strGiftForPC)
///////////////////////////////////
{
	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
	strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);
	//완전회복 포션(PC방), 원격 연금술사의 집, 회복속도 증가의 포션. 월요일
	strGiftForPC.Add(`id:51032 count:1|id:63188 count:1|id:63058 count:1`);
	//원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
	strGiftForPC.Add(`id:63070 count:2|id:63057 count:2`);
	//캠프 키트, 원격 대장간 수리 이용권. 수요일
	strGiftForPC.Add(`id:63039 expire:4320|id:63056 count:2`);
	// 캠프파이어 키트(PC방), 원격 관청, 원격 은행. 목요일
	strGiftForPC.Add(`id:63036 count:2|id:63071 count:2|id:63026 count:2`);
	//원격 힐러집 이용권, 거대한 외침의 뿔피리(7일), 외침의 뿔피리(7일). 금요일
	strGiftForPC.Add(`id:63047 count:2|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080`);
	//생명력의 엘릭서(7일)(PC방), 마나의 엘릭서(7일)(PC방), 스태미나의 엘릭서(7일)(PC방). 토요일
	strGiftForPC.Add(`id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);
}
//////////////////////////////////
server void
GetAdvancedItemListForPersonal_G10S1_overseas(meta_array strGift)
///////////////////////////////////
{
	//염색앰플, 금속염색앰플. 일요일
	strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);
	//완전회복 포션, 생명력/마나/스태미나의 엘릭서. 월요일
	strGift.Add(`id:51031 count:1|id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);
	if (GetLocale().LowerCase()==`japan`)
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 유료 가방 열쇠. 화요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2|id:91199 count:1`);
	}
	else
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);
	}
	//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 원격 연금술사의 집 이용권. 수요일
	strGift.Add(`id:63068 expire:10080|id:63039 expire:10080|id:63056 count:2|id:63188 count:1`);
	// 캠프파이어 키트, 원격 관청, 원격 은행. 목요일
	strGift.Add(`id:63029 count:2|id:63071 count:2|id:63026 count:2`);
	//밀랍 날개, 던전 밀랍 날개, 친구소환캡슐. 금요일
	strGift.Add(`id:63027 expire:10080 count:2|id:63072 expire:10080 count:2|id:63073 expire:10080 count:2`);
	//언트레인 캡슐, 원격 힐러집. 토요일
	strGift.Add(`id:63028 expire:10080|id:63047 count:2`);

	strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
	strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션. 랜덤
}
//////////////////////////////////
server void
GetAdvancedItemListForPremiumPC_G10S1_overseas(meta_array strGiftForPC)
///////////////////////////////////
{
	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
	strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);
	//완전회복 포션(PC방), 생명력/마나/스태미나의 엘릭서(PC방). 월요일
	strGiftForPC.Add(`id:51032 count:1|id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);
	if (GetLocale().LowerCase()==`japan`)
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 유료 가방 열쇠. 화요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2|id:91199 count:1`);
	}
	else
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);
	}
	//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 원격 염금술사의 집 이용권. 수요일
	strGiftForPC.Add(`id:63068 expire:10080|id:63039 expire:4320|id:63056 count:2|id:63188 count:1`);
	// 캠프파이어 키트(PC방), 원격 관청, 원격 은행. 목요일
	strGiftForPC.Add(`id:63036 count:2|id:63071 count:2|id:63026 count:2`);
	//밀랍 날개(PC방), 던전 밀랍 날개(PC방), 친구소환캡슐(PC방). 금요일
	strGiftForPC.Add(`id:63038 expire:10080 count:2|id:63081 expire:10080 count:2|id:63082 expire:10080 count:2`);
	//언트레인 캡슐, 원격 힐러집. 토요일
	strGiftForPC.Add(`id:63028 expire:4320|id:63047 count:2`);

}
//////////////////////////////////
server void
GetAdvancedItemListForPersonal_G12S2(meta_array strGift)
///////////////////////////////////
{
	//염색앰플, 금속염색앰플. 일요일
	strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);
	//완전회복 포션, 원격 연금술사의 집, 회복속도 증가의 포션.  월요일
	strGift.Add(`id:51031 count:1|id:63188 count:2|id:63058 count:1`);
	//원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
	strGift.Add(`id:63070 count:2|id:63057 count:2`);
	//캠프 키트, 원격 대장간 수리 이용권. 수요일
	strGift.Add(`id:63039 expire:10080|id:63056 count:2`);
	// 캠프파이어 키트, 원격 관청, 원격 은행. 목요일
	strGift.Add(`id:63029 count:2|id:63071 count:2|id:63026 count:2|id:63229 count:2`);
	//원격 힐러집 이용권, 거대한 외침의 뿔피리(7일), 외침의 뿔피리(7일). 금요일
	strGift.Add(`id:63047 count:2|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080`);
	//생명력의 엘릭서(7일), 마나의 엘릭서(7일), 스태미나의 엘릭서(7일). 토요일
	strGift.Add(`id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);
}

//////////////////////////////////
server void
GetAdvancedItemListForPremiumPC_G12S2(meta_array strGiftForPC)
///////////////////////////////////
{
	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
	strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);
	//완전회복 포션(PC방), 원격 연금술사의 집, 회복속도 증가의 포션. 월요일
	strGiftForPC.Add(`id:51032 count:1|id:63188 count:2|id:63058 count:1`);
	//원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
	strGiftForPC.Add(`id:63070 count:2|id:63057 count:2`);
	//캠프 키트, 원격 대장간 수리 이용권. 수요일
	strGiftForPC.Add(`id:63039 expire:4320|id:63056 count:2`);
	// 캠프파이어 키트(PC방), 원격 관청, 원격 은행. 목요일
	strGiftForPC.Add(`id:63036 count:2|id:63071 count:2|id:63026 count:2|id:63229 count:2`);
	//원격 힐러집 이용권, 거대한 외침의 뿔피리(7일), 외침의 뿔피리(7일). 금요일
	strGiftForPC.Add(`id:63047 count:2|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080`);
	//생명력의 엘릭서(7일)(PC방), 마나의 엘릭서(7일)(PC방), 스태미나의 엘릭서(7일)(PC방). 토요일
	strGiftForPC.Add(`id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);
}
//////////////////////////////////
server void
GetAdvancedItemListForPersonal_G12S2_overseas(meta_array strGift)
///////////////////////////////////
{
	//염색앰플, 금속염색앰플. 일요일
	strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);
	//완전회복 포션, 생명력/마나/스태미나의 엘릭서. 월요일
	strGift.Add(`id:51031 count:1|id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);
	if (GetLocale().LowerCase()==`japan`)
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 유료 가방 열쇠. 화요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2|id:91199 count:1`);
	}
	else
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);
	}
	//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 원격 연금술사의 집 이용권. 수요일
	strGift.Add(`id:63068 expire:10080|id:63039 expire:10080|id:63056 count:2|id:63188 count:1`);
	// 캠프파이어 키트, 원격 관청, 원격 은행. 목요일
	strGift.Add(`id:63029 count:2|id:63071 count:2|id:63026 count:2`);
	//밀랍 날개, 던전 밀랍 날개, 친구소환캡슐. 금요일
	strGift.Add(`id:63027 expire:10080 count:2|id:63072 expire:10080 count:2|id:63073 expire:10080 count:2`);
	//언트레인 캡슐, 원격 힐러집. 토요일
	strGift.Add(`id:63028 expire:10080|id:63047 count:2|id:63229 count:2`);

	strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
	strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션. 랜덤
}

//////////////////////////////////
server void
GetAdvancedItemListForPremiumPC_G12S2_overseas(meta_array strGiftForPC)
///////////////////////////////////
{
	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
	strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);
	//완전회복 포션(PC방), 생명력/마나/스태미나의 엘릭서(PC방). 월요일
	strGiftForPC.Add(`id:51032 count:1|id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);
	if (GetLocale().LowerCase()==`japan`)
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 유료 가방 열쇠. 화요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2|id:91199 count:1`);
	}
	else
	{
		//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);
	}
	//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 원격 염금술사의 집 이용권. 수요일
	strGiftForPC.Add(`id:63068 expire:10080|id:63039 expire:4320|id:63056 count:2|id:63188 count:1`);
	// 캠프파이어 키트(PC방), 원격 관청, 원격 은행. 목요일
	strGiftForPC.Add(`id:63036 count:2|id:63071 count:2|id:63026 count:2`);
	//밀랍 날개(PC방), 던전 밀랍 날개(PC방), 친구소환캡슐(PC방). 금요일
	strGiftForPC.Add(`id:63038 expire:10080 count:2|id:63081 expire:10080 count:2|id:63082 expire:10080 count:2`);
	//언트레인 캡슐, 원격 힐러집. 토요일
	strGiftForPC.Add(`id:63028 expire:4320|id:63047 count:2|id:63229 count:2`);
}
//////////////////////////////////
server void
GetAdvancedItemListForHumanPersonal(meta_array strGift)
///////////////////////////////////
{
	// DebugOut(`인간 어드밴스드 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPersonal_G12S2(strGift);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPersonal_G12S2_overseas(strGift);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPersonal_G9S1(strGift);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPersonal_G10S1_overseas(strGift);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);	//염색앰플, 금속염색앰플. 일요일
		strGift.Add(`id:51031 count:1|id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);			//완전회복 포션, 생명력/마나/스태미나의 엘릭서. 월요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGift.Add(`id:63068 expire:10080|id:63039 expire:10080|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGift.Add(`id:63029 count:2|id:63071 count:2|id:63026 count:2`);	 // 캠프파이어 키트, 원격 관청, 원격 은행. 목요일
		strGift.Add(`id:63027 expire:10080 count:2|id:63072 expire:10080 count:2|id:63073 expire:10080 count:2`);	//밀랍 날개, 던전 밀랍 날개, 친구소환캡슐. 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGift.Add(`id:63028 expire:10080|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGift.Add(`id:63028 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션. 랜덤
	}
	else if(
		GetLocale().LowerCase()==`korea`							// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 500)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 500)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 500)	// 대만
		|| (GetLocale().LowerCase()==`usa` && GetVersion() >= 100)	// 미국
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`
			&& GetLocale().LowerCase() != `usa`) && GetVersion() >= 500
		)
	)
	{
DebugOut(`인간 어드밴스드 아이템 - 엘프 투입 이후`);
		// 엘프 투입 이후
		// 긴급 탈출 폭탄 B 는 나오 서포트로 이전되었다.

		// 일반 어드밴스드 플레이 유저에게 줄 아이템
		if (GetLocale().LowerCase()==`korea`)	// 한국
		{
			strGift.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else if (GetLocale().LowerCase()==`usa`)  //미국
		{
			strGift.Add(`id:63039 expire:10080`);	 // 캠프 키트. 일요일
		}
		else
		{
			strGift.Add(`id:63029 count:2`);	 // 캠프파이어 키트. 일요일
		}
		strGift.Add(`id:51031 count:1`);				//완전회복 포션. 월요일
		strGift.Add(`id:63024 expire:10080 count:1`);	//염색앰플. 화요일
		strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 수요일
		strGift.Add(`id:63044 count:2`);				//파티 부활 피닉스의 깃털. 목요일
		strGift.Add(`id:63027 expire:10080 count:2`);	//밀랍날개. 금요일
		strGift.Add(`id:63028 expire:10080`);			//언트레인 캡슐. 토요일

		strGift.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGift.Add(`id:63056 count:1;id:63057 count:1`);//원격 대장간 수리 랜덤 원격 의류점 수리 랜덤
		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		if (GetLocale().LowerCase() != `usa`)  //미국이 아니면 준다
		{
			strGift.Add(`id:63039 expire:10080`);			//캠프 키트. 랜덤
		}
		strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGift.Add(`id:63029 count:2`);	 // 캠프파이어 키트. 한국,미국 인간용
		}
	}
	else if (
		(GetLocale().LowerCase()==`japan` && GetVersion() >= 100)												// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 304)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 402)							// 대만
	)
	{
DebugOut(`인간 어드밴스드 아이템 - 엘프 투입 이전`);
		// G5 이전까지만 적용되는 어드밴스드 아이템 지급
		// 엘프 종족 투입 이전이고, 긴급 탈출 폭탄 B 아이템도 어드밴스드 아이템에 포함되어 있다.

		// 일반 어드밴스드 플레이 유저에게 줄 아이템
		strGift.Add(`id:63055 count:4 expire:10080`);	//긴급탈출B폭탄 일요일
		strGift.Add(`id:51031 count:1`);				//완전회복 포션. 월요일
		strGift.Add(`id:63024 expire:10080 count:1`);	//염색앰플. 화요일
		strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 수요일
		strGift.Add(`id:63044 count:2`);				//파티 부활 피닉스의 깃털. 목요일
		strGift.Add(`id:63027 expire:10080 count:2`);	//밀랍날개. 금요일
		strGift.Add(`id:63028 expire:10080`);			//언트레인 캡슐. 토요일

		strGift.Add(`id:63029 count:2`);				//캠프파이어 키트. 랜덤으로만 가능 strGift.Add(`id:63045 expire:10080`);			//나이먹는약. 랜덤으로만 가능
		strGift.Add(`id:63047 count:2`);				//원격 힐러집 이용권. 랜덤으로만 가능
		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGift.Add(`id:63026 count:1`);				//원격 은행 이용권. 랜덤으로만 가능
		strGift.Add(`id:63039 expire:10080`);			//캠프키트. 랜덤
		strGift.Add(`id:63056 count:2`);				//원격 대장간 수리 랜덤
		strGift.Add(`id:63057 count:2`);				//원격 의류점 수리 랜덤
	}
	else if (GetVersion() >= 100)
	{
DebugOut(`인간 어드밴스드 아이템 - 오픈 이후`);
		//일반 어드밴스드 플레이 유저에게 줄 아이템
		strGift.Add(`id:63039 expire:10080`);			//캠프키트. 일요일
		strGift.Add(`id:51031 count:1`);				//완전회복 포션. 월요일
		strGift.Add(`id:63024 expire:10080 count:1`);	//염색앰플. 화요일
		if (GetLocale().LowerCase() == `usa`)
		{
			strGift.Add(`id:63058 expire:10080 count:2`);		//회복속도증가포션, 수요일
		}
		else
		{
			strGift.Add(`id:63025 count:1`);				//대용량 축복의 포션. 수요일
		}
		strGift.Add(`id:63044 count:2`);				//파티 부활 피닉스의 깃털. 목요일
		strGift.Add(`id:63027 expire:10080 count:2`);	//밀랍날개. 금요일
		strGift.Add(`id:63028 expire:10080`);			//언트레인 캡슐. 토요일
		strGift.Add(`id:63029 count:2`);				//캠프파이어 키트. 랜덤으로만 가능 strGift.Add(`id:63045 expire:10080`);			//나이먹는약. 랜덤으로만 가능
		strGift.Add(`id:63047 count:2`);				//원격 힐러집 이용권. 랜덤으로만 가능
		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGift.Add(`id:63026 count:1`);				//원격 은행 이용권. 랜덤으로만 가능
	}
}


//////////////////////////////////
server void
GetAdvancedItemListForHumanPremiumPC(meta_array strGiftForPC)
///////////////////////////////////
{
	// DebugOut(`인간 PC방 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPremiumPC_G12S2(strGiftForPC);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPremiumPC_G12S2_overseas(strGiftForPC);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPremiumPC_G9S1(strGiftForPC);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPremiumPC_G10S1_overseas(strGiftForPC);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
		strGiftForPC.Add(`id:51032 count:1|id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);		//완전회복 포션(PC방), 생명력/마나/스태미나의 엘릭서(PC방). 월요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63057 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 의류 수리 이용권. 화요일
		strGiftForPC.Add(`id:63068 expire:10080|id:63039 expire:4320|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGiftForPC.Add(`id:63036 count:2|id:63071 count:2|id:63026 count:2`);	 // 캠프파이어 키트(PC방), 원격 관청, 원격 은행. 목요일
		strGiftForPC.Add(`id:63038 expire:10080 count:2|id:63081 expire:10080 count:2|id:63082 expire:10080 count:2`);	//밀랍 날개(PC방), 던전 밀랍 날개(PC방), 친구소환캡슐(PC방). 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털(PC방). 랜덤으로만 가능
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);				//전투력 약화 포션(PC방). 랜덤
	}
	else if(
		GetLocale().LowerCase()==`korea`							// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 500)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 500)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 500)	// 대만
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`)
			&& GetVersion() >= 500
		)
	)
	{
DebugOut(`인간 PC방 아이템 - 엘프 투입 이후`);
		// 엘프 투입 이후
		// 긴급 탈출 폭탄 B 는 나오 서포트로 이전되었다.

		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else	// 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63036 count:2`);	 // 캠프파이어 키트. 일요일
		}
		strGiftForPC.Add(`id:51032 count:1`);				//완전회복 포션 (프리미엄PC방). 월요일
		strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플 (프리미엄PC방). 화요일
		strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 수요일
		strGiftForPC.Add(`id:63044 count:2`);				//파티 부활의 깃털. 목요일
		strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 (프리미엄PC방). 금요일
		strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일

		strGiftForPC.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGiftForPC.Add(`id:63056 count:1;id:63057 count:1`);//원격 대장간 수리 랜덤 원격 의류점 수리 랜덤
		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털(PC방). 랜덤으로만 가능
		strGiftForPC.Add(`id:63039 expire:4320`);			//캠프키트. 랜덤
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);	//전투력 약화 포션(PC방용)
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63036 count:2`);	 // 캠프파이어 키트. 한국 인간용
		}
	}
	else if (
		(GetLocale().LowerCase()==`japan` && GetVersion() >= 100)												// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 304)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 402)							// 대만
	)
	{
DebugOut(`인간 PC방 아이템 - 엘프 투입 이전`);
		// G5 이전까지만 적용되는 어드밴스드 아이템 지급
		// 엘프 종족 투입 이전이고, 긴급 탈출 폭탄 B 아이템도 어드밴스드 아이템에 포함되어 있다.

		if(GetLocale().LowerCase()==`japan`)
		{
			//일본 프리미엄PC방에선 다르게 준다
			strGiftForPC.Add(`id:63055 count:4 expire:10080`);	//긴급탈출B폭탄 일요일
			strGiftForPC.Add(`id:51032 count:2`);				//완전회복 포션 (프리미엄PC방). 월요일
			strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플 (프리미엄PC방). 화요일
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 수요일
			strGiftForPC.Add(`id:63044 count:2`);				//파티 부활 피닉스의 깃털. 목요일
			strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 (프리미엄PC방). 금요일
			strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일

			strGiftForPC.Add(`id:63036 count:2`);				//캠프파이어 키트(프리미엄 PC방). 랜덤으로만 가능 나이먹는 약 대처strGiftForPC.Add(`id:63045 expire:4320`);
			strGiftForPC.Add(`id:63047 count:2`);				//원격 힐러집 이용권. 랜덤으로만 가능
			strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털 (프리미엄PC방). 랜덤으로만 가능
			strGiftForPC.Add(`id:63026 count:1`);				//원격 은행 이용권. 랜덤으로만 가능
			strGiftForPC.Add(`id:63039 expire:4320 count:2`);	//캠프키트. 일요일
			strGiftForPC.Add(`id:63056 count:2`);				//원격 대장간 수리 랜덤
			strGiftForPC.Add(`id:63057 count:2`);				//원격 의류점 수리 랜덤
		}
		else
		{
			//프리미엄PC방에서 받을 수 있는 아이템
			strGiftForPC.Add(`id:63055 count:2 expire:10080`);	//긴급탈출B폭탄 일요일
			strGiftForPC.Add(`id:51032 count:1`);				//완전회복 포션 (프리미엄PC방). 월요일
			strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플 (프리미엄PC방). 화요일
			strGiftForPC.Add(`id:63058 expire:10080 count:1`);	//회복속도증가포션, 수요일
			strGiftForPC.Add(`id:63044 count:2`);				//파티 부활 피닉스의 깃털. 목요일
			strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 (프리미엄PC방). 금요일
			strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일

			strGiftForPC.Add(`id:63036 count:2`);				//캠프파이어 키트(프리미엄 PC방). 랜덤으로만 가능 나이먹는 약 대처strGiftForPC.Add(`id:63045 expire:4320`);
			strGiftForPC.Add(`id:63047 count:1`);				//원격 힐러집 이용권. 랜덤으로만 가능
			strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털 (프리미엄PC방). 랜덤으로만 가능
			strGiftForPC.Add(`id:63026 count:1`);				//원격 은행 이용권. 랜덤으로만 가능
			strGiftForPC.Add(`id:63039 expire:4320 count:2`);	//캠프키트. 일요일
			strGiftForPC.Add(`id:63056 count:1`);				//원격 대장간 수리 랜덤
			strGiftForPC.Add(`id:63057 count:1`);				//원격 의류점 수리 랜덤
		}
	}
	else if (GetVersion() >= 100)
	{
DebugOut(`인간 PC방 아이템 - 오픈 이후`);
		//프리미엄PC방에서 받을 수 있는 아이템
		strGiftForPC.Add(`id:63039 expire:4320 count:2`);	//캠프키트. 일요일
		strGiftForPC.Add(`id:51032 count:1`);				//완전회복 포션 (프리미엄PC방). 월요일
		strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플 (프리미엄PC방). 화요일
		if (GetLocale().LowerCase() == `usa`)
		{
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);		//회복속도증가포션, 수요일
		}
		else
		{
			strGiftForPC.Add(`id:63025 count:2`);				//대용량 축복의 포션. 수요일
		}
		strGiftForPC.Add(`id:63044 count:1`);				//파티 부활 피닉스의 깃털. 목요일
		strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 (프리미엄PC방). 금요일
		strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일
		strGiftForPC.Add(`id:63036 count:2`);				//캠프파이어 키트(프리미엄 PC방). 랜덤으로만 가능 나이먹는 약 대처strGiftForPC.Add(`id:63045 expire:4320`);
		strGiftForPC.Add(`id:63047 count:1`);				//원격 힐러집 이용권. 랜덤으로만 가능
		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털 (프리미엄PC방). 랜덤으로만 가능
		strGiftForPC.Add(`id:63026 count:1`);				//원격 은행 이용권. 랜덤으로만 가능
	}
}


//////////////////////////////////
server void
GetAdvancedItemListForElfPersonal(meta_array strGift)
///////////////////////////////////
{
	// DebugOut(`엘프 어드밴스드 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPersonal_G12S2(strGift);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPersonal_G12S2_overseas(strGift);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPersonal_G9S1(strGift);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPersonal_G10S1_overseas(strGift);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);	//염색앰플, 금속염색앰플. 일요일
		strGift.Add(`id:51031 count:1|id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);			//완전회복 포션, 생명력/마나/스태미나의 엘릭서. 월요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63071 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 관청 이용권. 화요일
		strGift.Add(`id:63068 expire:10080|id:63039 expire:10080|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGift.Add(`id:63029 count:2|id:63057 count:2|id:63026 count:2`);	 // 캠프파이어 키트, 원격 의류 수리, 원격 은행. 목요일
		strGift.Add(`id:63027 expire:10080 count:2|id:63072 expire:10080 count:2|id:63073 expire:10080 count:2`);	//밀랍 날개, 던전 밀랍 날개, 친구소환캡슐. 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGift.Add(`id:63028 expire:10080|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGift.Add(`id:63028 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션. 랜덤
	}
	else if (
		(GetLocale().LowerCase()==`korea`&& GetVersion() >= 500)		// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 500)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 500)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 500)	// 대만
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`)
			&& GetVersion() >= 500
		)
	)
	{
DebugOut(`엘프 어드밴스드 아이템 - 엘프 투입 이후`);
		// 엘프 투입 이후
		// 긴급 탈출 폭탄 B 는 나오 서포트로 이전되었다.
		if (GetLocale().LowerCase()==`korea`)	// 한국
		{
			strGift.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else if (GetLocale().LowerCase()==`usa`)  //미국
		{
			strGift.Add(`id:63039 expire:10080`);	 // 캠프 키트. 일요일
		}
		else	// 한국을 제외한 해외
		{
			strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 일요일
		}
		strGift.Add(`id:51031 count:1`);				//완전회복 포션. 월요일
		strGift.Add(`id:63024 expire:10080 count:1`);	//염색앰플. 화요일
		strGift.Add(`id:63047 count:1;id:63026 count:1`);//원격 은행+원격 힐러집
		strGift.Add(`id:63029 count:2 expire:10080`);	//캠프파이어
		strGift.Add(`id:63027 expire:10080 count:2`);	//밀랍날개. 금요일
		strGift.Add(`id:63028 expire:10080`);			//언트레인 캡슐. 토요일

		strGift.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		if (GetLocale().LowerCase() != `usa`)  //미국이 아니면 준다
		{
			strGift.Add(`id:63039 expire:10080`);			//캠프 키트. 랜덤
		}
		strGift.Add(`id:63044 count:2`);				//파티 깃털  랜덤
		strGift.Add(`id:63059 expire:10080 count:1`);	//전투력 약화 포션
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도 증가포션. 한국 엘프용
		}
	}
}


//////////////////////////////////
server void
GetAdvancedItemListForElfPremiumPC(meta_array strGiftForPC)
///////////////////////////////////
{
	DebugOut(`엘프 PC방 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPremiumPC_G12S2(strGiftForPC);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPremiumPC_G12S2_overseas(strGiftForPC);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPremiumPC_G9S1(strGiftForPC);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPremiumPC_G10S1_overseas(strGiftForPC);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
		strGiftForPC.Add(`id:51032 count:1|id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);		//완전회복 포션(PC방), 생명력/마나/스태미나의 엘릭서(PC방). 월요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63071 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 관청 이용권. 화요일
		strGiftForPC.Add(`id:63068 expire:10080|id:63039 expire:4320|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGiftForPC.Add(`id:63036 count:2|id:63057 count:2|id:63026 count:2`);	 // 캠프파이어 키트(PC방), 원격 의류 수리, 원격 은행. 목요일
		strGiftForPC.Add(`id:63038 expire:10080 count:2|id:63081 expire:10080 count:2|id:63082 expire:10080 count:2`);	//밀랍 날개(PC방), 던전 밀랍 날개(PC방), 친구소환캡슐(PC방). 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털(PC방). 랜덤으로만 가능
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);				//전투력 약화 포션(PC방). 랜덤
	}
	else if (
		(GetLocale().LowerCase()==`korea`&& GetVersion() >= 500)		// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 500)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 500)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 500)	// 대만
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`)
			&& GetVersion() >= 500
		)
	)
	{
DebugOut(`엘프 PC방 아이템 - 엘프 투입 이후`);
		// 엘프 투입 이후
		// 긴급 탈출 폭탄 B 는 나오 서포트로 이전되었다.

		//프리미엄 PC방 엘프캐릭터용
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else	// 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 일요일
		}

		strGiftForPC.Add(`id:51032 count:1`);				//완전회복 포션. 월요일
		strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플. 화요일
		strGiftForPC.Add(`id:63047 count:1;id:63026 count:1`);//원격 은행+원격 힐러집
		strGiftForPC.Add(`id:63036 count:2 expire:10080`);	//캠프파이어 키트 PC방
		strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 PC방. 금요일
		strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일

		strGiftForPC.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGiftForPC.Add(`id:63044 count:2`);				//파티 깃털  랜덤
		strGiftForPC.Add(`id:63039 expire:4320`);			//캠프키트. 랜덤
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);	//전투력 약화 포션(PC방용)
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도 증가포션. 한국 엘프용
		}
	}
}


//////////////////////////////////
server void
GetAdvancedItemListForGiantPersonal(meta_array strGift)
///////////////////////////////////
{

	DebugOut(`자이언트 어드밴스드 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPersonal_G12S2(strGift);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPersonal_G12S2_overseas(strGift);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPersonal_G9S1(strGift);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPersonal_G10S1_overseas(strGift);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGift.Add(`id:63024 expire:10080 count:1|id:63069 expire:10080 count:1`);	//염색앰플, 금속염색앰플. 일요일
		strGift.Add(`id:51031 count:1|id:63086 expire:10080 count:1|id:63087 expire:10080 count:1|id:63088 expire:10080 count:1`);			//완전회복 포션, 생명력/마나/스태미나의 엘릭서. 월요일
		strGift.Add(`id:63044 count:2|id:63070 count:2|id:63026 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 은행 이용권. 화요일
		strGift.Add(`id:63068 expire:10080|id:63039 expire:10080|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGift.Add(`id:63029 count:2|id:63071 count:2|id:63057 count:2`);	 // 캠프파이어 키트, 원격 관청, 원격 의류 수리. 목요일
		strGift.Add(`id:63027 expire:10080 count:2|id:63072 expire:10080 count:2|id:63073 expire:10080 count:2`);	//밀랍 날개, 던전 밀랍 날개, 친구소환캡슐. 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGift.Add(`id:63028 expire:10080|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGift.Add(`id:63028 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGift.Add(`id:63059 expire:10080 count:1`);				//전투력 약화 포션. 랜덤
	}
	else if(
		(GetLocale().LowerCase()==`korea`&& GetVersion() >= 600)		// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 600)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 600)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 600)	// 대만
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`)
			&& GetVersion() >= 600
		)
	)
	{
DebugOut(`자이언트 어드밴스드 아이템 - 자이언트 투입 이후`);
		// 자이언트 투입 이후
		if (GetLocale().LowerCase()==`korea`)	// 한국 미국
		{
			strGift.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else if (GetLocale().LowerCase()==`usa`)  //미국
		{
			strGift.Add(`id:63039 expire:10080`);	 // 캠프 키트. 일요일
		}
		else	// 한국을 제외한 해외
		{
			strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 일요일
		}
		strGift.Add(`id:51031 count:1`);				//완전회복 포션. 월요일
		strGift.Add(`id:63024 expire:10080 count:1`);	//염색앰플. 화요일
		strGift.Add(`id:63056 count:1;id:63057 count:1`);//원격무기점+의류점
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGift.Add(`id:63058 expire:10080 count:2`);	//회복속도 증가포션.
		}
		else
		{
			strGift.Add(`id:63029 count:2 expire:10080`);	//캠프파이어
		}
		strGift.Add(`id:63027 expire:10080 count:2`);	//밀랍날개. 금요일
		strGift.Add(`id:63028 expire:10080`);			//언트레인 캡슐. 토요일

		strGift.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGift.Add(`id:63043 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		if (GetLocale().LowerCase() != `usa`)  //미국이 아니면 준다
		{
			strGift.Add(`id:63039 expire:10080`);			//캠프 키트. 랜덤
		}
		strGift.Add(`id:63044 count:2`);				//파티 깃털  랜덤
		strGift.Add(`id:63059 expire:10080 count:1`);	//전투력 약화 포션
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGift.Add(`id:63029 count:2 expire:10080`);	//캠프파이어
		}
	}
}


//////////////////////////////////
server void
GetAdvancedItemListForGiantPremiumPC(meta_array strGiftForPC)
///////////////////////////////////
{
	DebugOut(`자이언트 PC방 아이템`);
	if (GetLocale().LowerCase()==`korea` &&  (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)))
	{
		GetAdvancedItemListForPremiumPC_G12S2(strGiftForPC);
	}
	else if (IsEnable(`featureRemoteWandRepair`) extern (`data/script/features.mint`)) // 해외 G12S2
	{
		GetAdvancedItemListForPremiumPC_G12S2_overseas(strGiftForPC);
	}
	else if (GetLocale().LowerCase()==`korea` && GetVersion() >= 901)
	{
		GetAdvancedItemListForPremiumPC_G9S1(strGiftForPC);
	}
	else if (IsEnable(`featureGetAdvancedItem`) extern (`data/script/features.mint`))
	{
		GetAdvancedItemListForPremiumPC_G10S1_overseas(strGiftForPC);
	}
	else if (GetVersion() >= 701)
	{
		// 어드밴스드 아이템 지정 복수개 도입
		strGiftForPC.Add(`id:63037 expire:5760 count:1|id:63080 expire:5760 count:1`);	//염색앰플(PC방), 금속염색앰플(PC방). 일요일
		strGiftForPC.Add(`id:51032 count:1|id:63089 expire:10080 count:1|id:63090 expire:10080 count:1|id:63091 expire:10080 count:1`);		//완전회복 포션(PC방), 생명력/마나/스태미나의 엘릭서(PC방). 월요일
		strGiftForPC.Add(`id:63044 count:2|id:63070 count:2|id:63026 count:2`);				//파티 부활의 깃털, 원격 무기상점 이용권, 원격 은행 이용권. 화요일
		strGiftForPC.Add(`id:63068 expire:10080|id:63039 expire:4320|id:63056 count:2`);			//고속 채집 포션, 캠프 키트, 원격 대장간 수리 이용권. 수요일
		strGiftForPC.Add(`id:63036 count:2|id:63057 count:2|id:63071 count:2`);	 // 캠프파이어 키트(PC방), 원격 의류 수리, 원격 관청. 목요일
		strGiftForPC.Add(`id:63038 expire:10080 count:2|id:63081 expire:10080 count:2|id:63082 expire:10080 count:2`);	//밀랍 날개(PC방), 던전 밀랍 날개(PC방), 친구소환캡슐(PC방). 금요일
		if (GetLocale().LowerCase()==`korea`) //한국
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63051 count:1 expire:10080|id:63052 count:2 expire:10080|id:63047 count:2`);			//언트레인 캡슐, 거대뿔피리, 뿔피리, 원격 힐러집. 토요일
		}
		else // 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63028 expire:4320|id:63047 count:2`);			//언트레인 캡슐, 원격 힐러집. 토요일
		}

		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털(PC방). 랜덤으로만 가능
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);				//전투력 약화 포션(PC방). 랜덤
	}
	else if(
		(GetLocale().LowerCase()==`korea`&& GetVersion() >= 600)		// 한국
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 600)	// 일본
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 600)	// 중국
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 600)	// 대만
		|| (															// 한국, 일본, 중국, 대만을 제외한 나라
			(GetLocale().LowerCase() != `korea` && GetLocale().LowerCase() != `japan`
			&& GetLocale().LowerCase() != `china` && GetLocale().LowerCase() != `taiwan`)
			&& GetVersion() >= 600
		)
	)
	{
DebugOut(`자이언트 PC방 아이템 - 자이언트 투입 이후`);
		// 자이언트 투입 이후

		//프리미엄 PC방 엘프캐릭터용
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63051 count:1 expire:10080;id:63052 count:2 expire:10080`);	//거대한 외침의 뿔피리 1, 외침의 뿔피리 2
		}
		else	// 한국을 제외한 해외
		{
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도증가포션, 일요일
		}

		strGiftForPC.Add(`id:51032 count:1`);				//완전회복 포션. 월요일
		strGiftForPC.Add(`id:63037 expire:5760 count:1`);	//염색앰플. 화요일
		strGiftForPC.Add(`id:63056 count:1;id:63057 count:1`);	//원격무기점+의류점
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63058 expire:10080 count:2`);	//회복속도 증가포션.
		}
		else
		{
			strGiftForPC.Add(`id:63036 count:2 expire:10080`);	//캠프파이어
		}
		strGiftForPC.Add(`id:63038 expire:10080 count:2`);	//밀랍날개 PC방. 금요일
		strGiftForPC.Add(`id:63028 expire:4320`);			//언트레인 캡슐. 토요일

		strGiftForPC.Add(`id:63047 count:1;id:63026 count:1`);//원격 힐러집 이용권. 원격 은행 이용권. 랜덤으로만 가능
		strGiftForPC.Add(`id:63048 count:1`);				//어드밴스드 깃털. 랜덤으로만 가능
		strGiftForPC.Add(`id:63044 count:2`);				//파티 깃털  랜덤
		strGiftForPC.Add(`id:63039 expire:4320`);			//캠프키트. 랜덤
		strGiftForPC.Add(`id:63060 expire:10080 count:1`);	//전투력 약화 포션(PC방용)
		if ((GetLocale().LowerCase()==`korea`) ||(GetLocale().LowerCase()==`usa`))	// 한국 미국
		{
			strGiftForPC.Add(`id:63036 count:2 expire:10080`);	//캠프파이어 PC방용
		}
	}
}
///////////////////////////////////
server void
OnMaxBundled(item cItem , character me)
///////////////////////////////////
{
	if (!cItem.IsNull() && cItem.GetClass().CheckStringID(`*/appraisal/recovered/bundle/*`))
	{
		// 기존아이템의 위치
		int oriPocketId = cItem.GetPocketID();
		int oriPosX = cItem.GetPosX();
		int oriPosY = cItem.GetPosY();

		int newItemId = 0;
		int newItemQuality = 0;
		int newItemGold = 0;
		int newItemExp = 0;
		string newItemPlace = ``;

		newItemQuality = Random(16) + Random(16) + Random(16) + Random(16) + 30;
//		newItemPlace = cItem.GetApprPlace();
//		newItemGold = (Random(150)+100)*newItemQuality/100+400;
//		newItemExp = (Random(100)+100)*newItemQuality/100+450;

		switch (cItem.GetClass().GetId())
		{
			case (53300)	// 헤르바 코인 조각 *5
			{
				newItemId = 53400;
				newItemGold = (Random(100)+50)*newItemQuality/100+500;
				newItemExp = (Random(100)+50)*newItemQuality/100+500;
			}
			case (53301)	// 뼈 오카리나 조각 *4
			{
				newItemId = 53401;
				newItemGold = (Random(100)+50)*newItemQuality/100+350;
				newItemExp = (Random(100)+50)*newItemQuality/100+350;
			}
			case (53320)	// 청동 자칼 조각 *4
			{
				newItemId = 53420;
				newItemGold = (Random(100)+50)*newItemQuality/100+450;
				newItemExp = (Random(100)+50)*newItemQuality/100+450;
			}
			case (53340)	// 다채색 도자기 조각 *5
			{
				newItemId = 53440;
				newItemGold = (Random(100)+50)*newItemQuality/100+800;
				newItemExp = (Random(100)+50)*newItemQuality/100+800;
			}
			case (53341)	// 고대의 달력 조각 *4
			{
				newItemId = 53441;
				newItemGold = (Random(100)+50)*newItemQuality/100+700;
				newItemExp = (Random(100)+50)*newItemQuality/100+700;
			}
			case (53342)	// 샤먼의 방패 조각 *3
			{
				newItemId = 53442;
				newItemGold = (Random(100)+50)*newItemQuality/100+600;
				newItemExp = (Random(100)+50)*newItemQuality/100+600;
			}
			case (53343)	// 물결무늬 화로 조각 *3
			{
				newItemId = 53443;
				newItemGold = (Random(100)+50)*newItemQuality/100+600;
				newItemExp = (Random(100)+50)*newItemQuality/100+600;
			}
			case (53344)	// 이리니드 수정구슬 조각 *4
			{
				newItemId = 53444;
				newItemGold = (Random(100)+50)*newItemQuality/100+700;
				newItemExp = (Random(100)+50)*newItemQuality/100+700;
			}
			case (53345)	// 쿠르클레 원주민 토기 조각 *4
			{
				newItemId = 53445;
				newItemGold = (Random(100)+50)*newItemQuality/100+700;
				newItemExp = (Random(100)+50)*newItemQuality/100+700;
			}
			case (53346)	// 쿠르클레 점토판 조각 *5
			{
				newItemId = 53446;
				newItemGold = (Random(100)+50)*newItemQuality/100+800;
				newItemExp = (Random(100)+50)*newItemQuality/100+800;
			}
			default
			{
			}
		}

		string strBundleString =
				`id:` + ToString(newItemId) +
				` quality:`+ ToString(newItemQuality) +
//				` appraise_place:` + newItemPlace +
				` appraise_gold:` + ToString(newItemGold) +
				` appraise_explore_exp:` + ToString(newItemExp);

		// 기존 아이템을 삭제함
		if (me.DestroyItem(cItem))
		{
			// 기존 아이템의 위치에 새 아이템 생성
			if ( me.RcvItem(me, oriPocketId, oriPosX, oriPosY, strBundleString) )
			{
				me.ShowCaption(["event.pc_event.12"]);
			}
			else
			{
				// 아이템 지급 불가 상황
			}

		}
		else
		{
			// 아이템 파괴 불가 상황
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void
OnCompleteSheepRaising(character me, int _iLivingSheepNo)
// : 양치기가 끝났을때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (_iLivingSheepNo >= 10)
	{
		me.ShowCaption(["event.pc_event.13"], 5000);
		me.AddKeyword(`TirChonaill_Tutorial_Thinking`);
	}
	else if (_iLivingSheepNo >= 5)
	{
		me.ShowCaption(["event.pc_event.14"], 5000);
		me.AddKeyword(`TirChonaill_Tutorial_Feeling`);
	}
	else if (_iLivingSheepNo < 5)
	{
		me.ShowCaption(["event.pc_event.15"], 5000);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void
OnChangeSheepRaisingLivingSheepCount(character me, int _iLivingSheepNo)
// : 양 마리수가 바뀔 때 불리는 함수?
////////////////////////////////////////////////////////////////////////////////
{
	if (_iLivingSheepNo == 10)
	{
		me.ShowCaption(["event.pc_event.16"], 0);
	}
	else if (_iLivingSheepNo == 7)
	{
		me.ShowCaption(["event.pc_event.17"], 0);
	}
	else if (_iLivingSheepNo == 5)
	{
		me.ShowCaption(["event.pc_event.18"], 0);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool CanLeaveDungeon(character me)
// : 던전에서 나갈 수 있는지 체크한다
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon curDungeon = me.GetCurrentDungeon();
	if (curDungeon.GetName().LowerCase() == `TirCho_Alby_Dungeon_Tutorial_Ranald`.LowerCase())
	{
		if (me.GetItemNoWithClassId(70028) > 0)	// 보물상자 열쇠를 갖고 있는가
		{
			me.ShowCaption(["event.pc_event.19"]);
			return false;
		}
	}
	else if (curDungeon.GetName().LowerCase() == `TirCho_Alby_Dungeon_Tutorial_2010_Malcolm`.LowerCase())
	{
		if (me.GetItemNoWithClassId(70028) > 0)	// 보물상자 열쇠를 갖고 있는가
		{
			me.ShowCaption(["event.pc_event.19"]);
			return false;
		}
	}
	else if (curDungeon.GetName().LowerCase() == `TirCho_Alby_Dungeon_Tutorial_2010_rescuekid`.LowerCase())
	{
		if (me.GetItemNoWithClassId(70028) > 0)	// 보물상자 열쇠를 갖고 있는가
		{
			me.ShowCaption(["event.pc_event.19"]);
			return false;
		}
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool HookTouchLastStatueEvent(character me, string strDungeonName)
// :모든 던전에서 여신상을 클릭하고 로비로 나온직후 호출된다
//////////////////////////////////////////////////////////////////////////////////
{
	if (strDungeonName.LowerCase() == `TirCho_Alby_Dungeon_Tutorial_2010_rescuekid`.LowerCase())
	{
		//////////////////////////////////////////////////////////////////////////////////
		//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
		me.AddKeyword(`Tutorial_Alby_Exit_Out`);
//		me.PlayCutScene(`tuto_out_dungeon`);
//		me.ShowCaptionEx("던전 밖으로 나가 트레보에게 돌아가자.", `region`, 7000, 1000);
//		me.Move(13, 2611, 2577);		// 던전 밖으로 이동.

		// G13 이고 2010 버전 튜토리얼 유저면,
		if (IsEnable(`featureG13MainStream`) extern (`data/script/features.mint`) && me.HaveKeyword(`character_new_tutorial_2010`))
		{
			// G13은 무조건 시작
			if(!me.HaveKeyword(`g13`) && !me.HaveKeyword(`g13_complete`) && !me.IsQuestCompleted(294201))
			{
				me.AddKeyword(`g13`);
				me.Move(13, 2760, 2709);
				me.PlayCutScene(`C4G13_prologue_Morrighan`);
			}
			//튜토리얼 알비 던전 과정 체크용 키워드 제거
			me.RemoveKeyword(`Tutorial_Alby_Portal`);
			me.RemoveKeyword(`Tutorial_Alby_Enter_Altar`);
			me.RemoveKeyword(`Tutorial_Alby_Drop_Item`);
			me.RemoveKeyword(`Tutorial_Alby_Drop_Trefor_Dagger`);
			me.RemoveKeyword(`Tutorial_Alby_Move_1Floor`);
			me.RemoveKeyword(`Tutorial_Alby_Open_Box`);
			me.RemoveKeyword(`Tutorial_Alby_Pickup_Key`);
			me.RemoveKeyword(`Tutorial_Alby_Open_Door`);
			me.RemoveKeyword(`Tutorial_Alby_Hit_Gem`);
			me.RemoveKeyword(`Tutorial_Alby_Open_Bossroom`);
			me.RemoveKeyword(`Tutorial_Alby_Open_TreasureRoom`);
			me.RemoveKeyword(`Tutorial_Alby_Exit_Out`);
			me.RemoveKeyword(`Tutorial_Alby_Enter_Beginner`);
			me.RemoveKeyword(`Tutorial_Alby_Enter_Normal`);
		}
		return true;
	}
	return false;
}




//////////////////////////////////////////////////////////////////////////////////
server void RestoreErrorOnLogin(character me)
// : PC가 월드에 로그인 할 때마다 불리는 함수이다.
// : 이 함수는 클라이언트 사이드에서도 완전히 로그인이 되었을 때 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	// g11중 파르홀론의 서 콜렉션 북을 왕정 연금술사가 미리 수집해버려 진행 안되는 문제 수정
	if (me.HaveQuestTemplate(292008) && !me.HaveKeyword(`g11_11`) && me.HaveKeyword(`g11_12`))
	{
		me.AddKeyword(`g11_11`);
	}

	if (me.IsQuestCompleted(294201) && me.GetItemNoWithClassId(75462)<1)
	{
		me.DoStript(`additemex(id:75462 rewardview:true)`);
	}
	// g12 진행 중 오류 수정
	if (me.HaveQuestTemplate(293019) && me.GetCompletedQuestObjectiveCount(293019) == 0 && me.HaveKeyword(`g12_treasure04`))
	{
		// 파도의 진정 아이템을 주었다가 제거
		me.DoStript(`additemex(id:75434)`);
		me.RemoveItemCls(75434,1);
	}
	if (me.HaveKeyword(`g12_16`) &&  !me.HaveKeyword(`g12_eabha`) )
	{
		me.AddKeyword(`g12_eabha`);
	}


	// g11 진행중 미션 주는 아이템 사라지면 다시 준다.
	if (me.HaveQuestTemplate(292002) && (me.GetCompletedQuestObjectiveCount(292002) == 4) && (me.GetItemNoWithClassId(75356) < 1))
	{
		me.DoStript(`additemex(id:75356)`);		// 진짜 장서관 카드
	}
	if (me.HaveQuestTemplate(292013) && (me.GetCompletedQuestObjectiveCount(292013) == 0) && (me.GetItemNoWithClassId(75371) < 1))
	{
		me.DoStript(`additemex(id:75371)`);		// 여신의 바늘
	}
	if (me.HaveQuestTemplate(292015) && (me.GetCompletedQuestObjectiveCount(292015) == 0) && (me.GetItemNoWithClassId(75372) < 1))
	{
		me.DoStript(`additemex(id:75372)`);		// 칼리번의 통행증
	}

	if ((me.HaveQuestTemplate(601111)) && (!me.GetCompletedQuestObjectiveCount(601111) == 2) && (me.HaveKeyword(`give1_cat_nekojima`)))
	{
		me.RemoveKeyword(`give1_cat_nekojima`);
	}
	if ((me.HaveQuestTemplate(601121)) && (!me.GetCompletedQuestObjectiveCount(601121) == 2) && (me.HaveKeyword(`give2_cat_nekojima`)))
	{
		me.RemoveKeyword(`give2_cat_nekojima`);
	}
	if(!me.HaveKeyword(`g3`) && me.GetItemNoWithClassId(75056)!=0 && GetLocale().LowerCase()==`usa`) //G3가 진행중이 아니고 아이던의 칼조각을 가지고 있으면 지워준다.
	{
		me.RemoveItemCls(75056);
	}

	if (IsEnable(`featureDelWeddingDress`) extern (`data/script/features.mint`))	//결혼식 예복을 가지고 나오는 문제 수정 로그인 시 관련 아이템 삭제
	{
		if ((me.GetItemNoWithClassId(15122) > 0) || (me.GetItemNoWithClassId(15123) > 0) || (me.GetItemNoWithClassId(15185) > 0) || (me.GetItemNoWithClassId(15186) > 0) || (me.GetItemNoWithClassId(15226) > 0) || (me.GetItemNoWithClassId(15227) > 0) || (me.GetItemNoWithClassId(17051) > 0) || (me.GetItemNoWithClassId(17052) > 0) || (me.GetItemNoWithClassId(17078) > 0) || (me.GetItemNoWithClassId(17079) > 0) || (me.GetItemNoWithClassId(17092) > 0) || (me.GetItemNoWithClassId(17093) > 0) || (me.GetItemNoWithClassId(18106) > 0) || (me.GetItemNoWithClassId(18136) > 0) || (me.GetItemNoWithClassId(18137) > 0))
		{
			me.RemoveItemCls(15122);
			me.RemoveItemCls(15123);
			me.RemoveItemCls(15185);
			me.RemoveItemCls(15186);
			me.RemoveItemCls(15226);
			me.RemoveItemCls(15227);
			me.RemoveItemCls(17051);
			me.RemoveItemCls(17052);
			me.RemoveItemCls(17078);
			me.RemoveItemCls(17079);
			me.RemoveItemCls(17092);
			me.RemoveItemCls(17093);
			me.RemoveItemCls(18106);
			me.RemoveItemCls(18136);
			me.RemoveItemCls(18137);
		}
	}


	// g11 1부 끝낸 유저들에게 2부 시작 퀘스트 준다.
	if (me.IsQuestCompleted(292011)
	&& !me.IsQuestTried(292012)
	&& !me.HaveQuestTemplate(292012))
//	&& me.GetItemNoWithClassId(75353) >0)	// 새도우 스톤 가방에 있고
	{
		me.AddGameQuest(292012, 0);  // 292012 퀘스트 준다.
	}




	// g9 메인스트림 난이도 하향
	if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	// 한국 메인스트림 난이도 하향
	{
		if (me.HaveQuestTemplate(290107)) // 포워르의 반격 퀘스트를 수행중이거나 완료 처리를 아직 안했다.
		{
			// DebugOut(`구 반격 퀘스트를 완료처리한다.`);
			me.AddKeyword(`mission_clear_01`);
			me.AddKeyword(`mission_clear_02`);
			me.AddKeyword(`mission_clear_03`);
			me.AddKeyword(`mission_clear_04`);
			me.AddKeyword(`mission_clear_05`);
			me.AddKeyword(`mission_clear_06`);
			/*
			me.CleanQuestHistory(290107); // 구 퀘스트를 한 것으로 처리
			me.ForceCompleteQuest(290107); // 구 퀘스트를 한 것으로 처리.
			me.DoStript(`modify(exp,11000)`); // 퀘스트 보상 준다.
			me.AddGameQuest(290207, 1);  // 다음 퀘스트 예약
			*/
		}
	}

	// 제너 구출 미션을 퀘스트 보드를 통해 진행한 경우 키가 꼬여 드래곤의 표식이 증발한 경우 드래곤의 표식 아이템 지급
	if (me.HaveQuestTemplate(290111) && me.HaveKeyword(`g9_18`) && me.HaveKeyword(`g9_help_jenna`) && me.GetItemNoWithClassId(75222) < 1)
	{
		me.DoStript(`additemex(id:75222 rewardview:true)`);
	}
	// G9 드래곤의 표식 아이템 여분 제거
	if (me.IsQuestCompleted(290111) && !me.HaveKeyword(`g9_18`) && me.GetItemNoWithClassId(75222) > 0)
	{
		me.RemoveItemCls(75222);
	}

	// G8 스토리 도중에 아이템 분실한 유저를 위한 대책
	if ((me.GetCompletedQuestObjectiveCount(280204)==3 ||
		me.GetCompletedQuestObjectiveCount(280212)==3 )	// 280204나 280212를 3단계 통과했는데
		&& me.GetItemNoWithClassId(53362)==0)		// 복원된 기억의 거울이 없는 경우)
	{
		me.AddItem(53362);    // 로그인시 거울을 다시 준다.
	}

	if (me.HaveKeyword(`g8s1`)||me.HaveKeyword(`g8s1_complete`))
	{
		me.RemoveKeyword(`CourcleRuinCutscene_Lightning`);
		me.RemoveKeyword(`CourcleRuinCutscene_Sun`);
		me.RemoveKeyword(`CourcleRuinCutscene_Snow`);
		me.RemoveKeyword(`jungle_ruins`);
		me.RemoveKeyword(`g7s3`);
		me.RemoveKeyword(`g7s3_01`);
		me.RemoveKeyword(`g7s3_02`);
		me.RemoveKeyword(`g7s3_03`);
		me.RemoveKeyword(`g7s3_04`);
		me.RemoveKeyword(`g7s3_05`);
		me.RemoveKeyword(`Give_Ruway_Large_Fish`);
		me.RemoveKeyword(`g7s3_Complete`);
		me.RemoveKeyword(`courcle_heart`);
		me.RemoveKeyword(`g7s4`);
		me.RemoveKeyword(`g7s4_01`);
		me.RemoveKeyword(`g7s4_02`);
		me.RemoveKeyword(`g7s4_03`);
		me.RemoveKeyword(`g7s4_04`);
		me.RemoveKeyword(`g7s4_05`);
		me.RemoveKeyword(`g7s4_06`);
		me.RemoveKeyword(`g7s4_07`);
		me.RemoveKeyword(`secret_memorial_tower`);
		me.RemoveKeyword(`mirror_to_voight`);
		me.RemoveKeyword(`atrata_cheer`);
		me.RemoveKeyword(`voight_g7s4`);

		me.CleanQuestHistory(280001);
		me.CleanQuestHistory(280002);
		me.CleanQuestHistory(280101);
		me.CleanQuestHistory(280103);
		me.CleanQuestHistory(280104);
		me.CleanQuestHistory(280106);
		me.CleanQuestHistory(280108);

		me.RemoveItemCls(73112);		// 코우사이의 리파이 차
		me.RemoveItemCls(73113);		// 루와이의 탐험 일지
		me.RemoveItemCls(73114);		// 기억의 얼음 결정
		me.RemoveItemCls(53261);		// 부서진 기억의 거울 (거울마녀에게 얻은)
		me.RemoveItemCls(53361);		// 부서진 기억의 거울 (보이트가 복원한)
		me.RemoveItemCls(73115);		// 윈드벨
		me.RemoveItemCls(73116);		// 티카 나무 수액 포션
		me.RemoveItemCls(73117);		// 깨진 포션병
	}

	//g8s1 퀘스트 진행중에 기억의 거울 퀘스트를 받지 못하는 유저들 조치
	//280211 280203 둘다 없으면 둘 중 하나를 준다.
	if( GetVersion()>=801 && me.HaveKeyword(`g8s1_02`) && !me.HaveQuestTemplate(280203)  && !me.HaveQuestTemplate(280211))
	{
		if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
		{
			me.AddGameQuest(280211, 1);    //  기억의 거울 받아야하는 단계에서 받지 못하고 있으면 다시 넣어준다.
		}
		else
		{
			me.AddGameQuest(280203, 1);    //  기억의 거울 받아야하는 단계에서 받지 못하고 있으면 다시 넣어준다.
		}
	}

	//g7s4 퀘스트 진행중에 키워드가 꼬인 문제 해결
	if( GetVersion()>=704 && me.IsMainStreamPlayablePlayer(7) && me.HaveKeyword(`g7s4_Complete`))
	{
		me.RemoveKeyword(`g7s3_Complete`);
		me.RemoveKeyword(`jungle_ruins`);
		me.CleanQuestHistory(280101);    //  보이트의 의혹 삭제
		me.CleanQuestHistory(280103);    //  보이트의 의심 삭제
	}

	//G2 팔라딘 마지막 던전 플레이 도중에 재로긴한 유저를 위한 스크립트
	if (me.HaveKeyword(`g2_37`))
	{
		me.ForgetSkill(40001);
		me.AddSkill(40001,0);
	}


	//다크나이트 스킬이 있는데 팔라딘 스킬도 갖고 있는 사람들 제거. 이거 일단 한국에서만.
	//if(GetLocale().LowerCase()==`korea`)
	{
		if(
			me.GetSkillLevel(41001)!=0
			&&
			me.IsQuestTried(200080)	// 이상한 고양이로부터 받은 팔라딘 입수 퀘스트 수행중이면
		)	//다크나이트 변신 스킬을 쓸 수 있는데 팔라딘 입수 퀘스트도 갖고 있다
		{
			//이상한 고양이로부터 받은 팔라딘 입수 퀘스트 삭제 루틴 카피 jisangs. 2006.01.02
			me.CleanQuestHistory(200080); // 팔라딘 스킬 얻기 퀘스트를 삭제
			me.RemoveItemCls(74008);	// 정령의 축복이 깃든 미스릴 갑옷
			me.RemoveKeyword(`g2_jumper_paladin`);	// 키워드
		}

		if(
			(
				// 팔라딘 스킬과 다크나이트 스킬을 동시에 갖고 있다
				me.IsUsableSkill(40001) && me.IsUsableSkill(41001)
			)
			&&
			(
				// 테스트 서버와 개발 서버가 아닐 때
				!IsTestServer() && !IsDevelopment()
			)
		)
		{
			// DebugOut(`테섭이나 개발서버가 아니면, 팔라딘 관련 스킬 삭제`);
			me.ForgetSkill(40001);	// 스피리트오브오더
			me.ForgetSkill(40002);	// 파워오브오더
			me.ForgetSkill(40003);	// 아이오브오더
			me.ForgetSkill(40004);	// 소드오브오더
		}

		if(
			me.GetSkillLevel(41001)!=0
			&&
			(
				me.GetSkillLevel(40011)!=0 || me.GetSkillLevel(40012)!=0 || me.GetSkillLevel(40013)!=0
			)
		)	//다크나이트 변신 스킬을 쓸 수 있는데 패시브 팔라딘 스킬도 갖고있다 -ㅁ-
		{
			// DebugOut(`변태 다크나이트다`);
			me.ForgetSkill(40011);
			me.ForgetSkill(40012);
			me.ForgetSkill(40013);
			//리다이이어에게 들어있던 팔라딘 패시브 스킬 관련 퀘스트 삭제 루틴 카피 HanStone. 2005.11.24

			me.CleanQuestHistory(200084); // 리다이어의 요청 퀘스트를 삭제
			me.CleanQuestHistory(200085); // 리다이어의 요청 퀘스트를 삭제

			me.RemoveKeyword(`Book_of_Paladin_hidden`);
			me.RemoveKeyword(`Book_of_Paladin_G2_complete`);
			me.RemoveKeyword(`Book_of_Paladin_G2_jump`);

			me.RemoveKeyword(`Book_of_Paladin_complete`);

			me.RemoveKeyword(`Book_of_Paladin_page1`);
			me.RemoveKeyword(`Book_of_Paladin_page2`);
			me.RemoveKeyword(`Book_of_Paladin_page3`);
			me.RemoveKeyword(`Book_of_Paladin_page4`);
			me.RemoveKeyword(`Book_of_Paladin_page5`);
			me.RemoveKeyword(`Book_of_Paladin_page6`);
			me.RemoveKeyword(`Book_of_Paladin_page7`);

			me.RemoveKeyword(`Book_of_Paladin_Shena`);
			me.RemoveKeyword(`Book_of_Paladin_Shena_1`);
			me.RemoveKeyword(`Book_of_Paladin_Shena_2`);
			me.RemoveKeyword(`Book_of_Paladin_Beggar_1`);
			me.RemoveKeyword(`Book_of_Paladin_Beggar_2`);

			me.RemoveKeyword(`Book_of_Paladin_Craig_hidden`);

			me.RemoveItemCls(74203); //각성의 부적 - 코일던전 입장용

			me.RemoveItemCls(74201); //팔라딘의 서 - 5페이지짜리
			me.RemoveItemCls(74202); //팔라딘의 서 - 7페이지짜리

			me.RemoveItemCls(74204); //팔라딘의 서 - 1페이지
			me.RemoveItemCls(74205); //팔라딘의 서 - 2페이지
			me.RemoveItemCls(74206); //팔라딘의 서 - 3페이지
			me.RemoveItemCls(74207); //팔라딘의 서 - 4페이지
			me.RemoveItemCls(74208); //팔라딘의 서 - 5페이지
			me.RemoveItemCls(74209); //팔라딘의 서 - 6페이지
			me.RemoveItemCls(74210); //팔라딘의 서 - 7페이지

			me.RemoveItemCls(74211); // 팔라딘의 서 - 훼손된 페이지
			me.RemoveItemCls(74212); // 바리 던전 통행증
			me.RemoveItemCls(73061); // 보존의 마법가루

			me.RemoveItemCls(70078); //진행중이던 모든 페이지 수집 퀘스트 삭제
		}
	}
	//G1 jump하면서 '티르나노이 가는 길' 키워드 잃어버린 유저 복구용 스크립트
	if (me.HaveKeyword(`g1_jump`) && !me.HaveKeyword(`g1_way_to_tirnanog2`))
	{
		me.AddKeyword(`g1_way_to_tirnanog2`);
	}

	//G1 클리어했으나 'g1_33_2' 키워드 삭제 안된 유저 수정용 스크립트
	if (me.HaveKeyword(`g1_complete`) && me.HaveKeyword(`g1_33_2`))
	{
		me.RemoveKeyword(`g1_33_2`);
	}

	//G1 클리어했으나 jump하면서 'g1' 키워드 삭제 안된 유저 수정용 스크립트
	if (me.HaveKeyword(`g1_complete`) && me.HaveKeyword(`g1`))
	{
		me.RemoveKeyword(`g1`);
	}

	//G2 키워드가 꼬인 유저 수정용 스크립트
	if (me.HaveKeyword(`g2_30`) ||me.HaveKeyword(`g2_32`) ||me.HaveKeyword(`g2_34`) ||me.HaveKeyword(`g2_36`) ||me.HaveKeyword(`g2_complete`))
	{
		me.RemoveKeyword(`g2_04`);
		me.RemoveKeyword(`g2_03`);
		me.RemoveKeyword(`g1_KnightOfTheLight`);
		me.RemoveKeyword(`g2_02_Paladin`);
	}



	// G9 진행 후 남은 키워드 삭제 처리 - 09.07.23
	if(me.HaveKeyword(`g9_complete`))
	{
		me.RemoveKeyword(`NoitarArat`);
	}



	//G2 점프시 미스릴 광산 키워드를 못 얻은 유저들을 위한 스크립트
	if(me.HaveKeyword(`g2_jump`) && (!me.HaveKeyword(`g2_24_MythrilMine`) || !me.HaveKeyword(`g2_24_fin`)))
	{
		me.AddKeyword(`g2_24_MythrilMine`);
		me.AddKeyword(`g2_24_fin`);
	}

	//일본에 투입된 '나오에게 선물' 키워드를 삭제하는 스크립트
	if (GetVersion() < 200)
	{
		me.RemoveKeyword(`present_to_nao`);
	}

//	퀘스트 진행중일때 글라스 기브넨 책 -> 마족의 서 1 권으로 바꿔주는 복구 스크립트. 퀘스트 210005번 파일도 같이 수정할것.
//	모두 수정된것으로 보여, 삭제합니다. (2004.12.30. qwerty)
/*	if (me.IsQuestTried(210005) && !me.IsQuestCompleted(210005) && me.GetItemNoWithClassId (73058)>0)
	{
		me.RemoveItemCls(73058);
		me.AddItem(73062);
	}
*/

	//////////////////////////////////////////////////////////////////////////////////////
	// 초보엘레멘탈 마스터 타이틀 복구
	// 이곳의 코드는 2006년 1월 4일 작성되었습니다. by qwerty
	//////////////////////////////////////////////////////////////////////////////////////

	//파볼 아볼 라볼 모두 F랭 이상인데도
	if (me.GetSkillLevel(30101) >= 1 && me.GetSkillLevel(30201) >= 1 && me.GetSkillLevel(30301) >= 1 && !me.IsSelectableTitle(28))
	{
		me.DoStript(`addtitle(28)`);
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 초보 연금술사 타이틀 복구
	// 이곳의 코드는 2008년 7월 29일 작성되었습니다. by orcen
	//////////////////////////////////////////////////////////////////////////////////////

	//연금술 마스터리 F랭 이상이면 스킬을 안다.
	if (me.GetSkillLevel(35003) >= 1 && !me.IsKnownTitle(26))
	{
		me.DoStript(`knowtitle(26)`);
	}

	//연금술 마스터리, 합성, 분해, 마나 포밍, 골렘 연성, 방호벽, 라이프 드레인, 윈드 블래스트, 워터 캐논 F랭 이상이면 스킬을 안다.
	if (me.GetSkillLevel(35007) >= 1 && me.GetSkillLevel(35006) >= 1 && me.GetSkillLevel(35001) >= 1 && me.GetSkillLevel(50032) >= 1 && me.GetSkillLevel(10030) >= 1  && me.GetSkillLevel(35002) >= 1 && me.GetSkillLevel(10031) >= 1 && me.GetSkillLevel(35003) >= 1 && me.GetSkillLevel(35004) >= 1 && !me.IsSelectableTitle(26))
	{
		me.DoStript(`addtitle(26)`);
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 엘프 스매시 입수 불가 복구
	// 이곳의 코드는 2006년 1월 4일 작성되었습니다. by qwerty
	//////////////////////////////////////////////////////////////////////////////////////

	// 디펜스 수련 퀘스트를 완료했는데 스매시 스킬이 없는 경우
	if (me.IsQuestCompleted(200308))
	{
		// DebugOut(`디펜스 수련 완료`);
	}
	if (!me.IsUsableSkill(20002))
	{
		// DebugOut(`스매시 스킬 모름`);
	}
	if (me.IsElf() && me.IsQuestCompleted(200308) && !me.IsUsableSkill(20002))
	{
		// DebugOut(`스매시 스킬 받기`);
		me.DoStript(`knowskill(20002)`);
		me.DoStript(`openskill(20002)`);
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// 열매 채집 수정
	// 이곳의 코드는 2006년 11월 19일 작성되었습니다. by jisangs
	//////////////////////////////////////////////////////////////////////////////////////

	// 열매 채집
	if (me.IsQuestCompleted(200115))
	{
		// DebugOut(`200115 퀘스트 완료 처리`);
		me.CleanQuestHistory(200115); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`10 - 200115 대신 200132 퀘스트로 교체`);
		me.ForceCompleteQuest(200132); // 신 퀘스트를 한 것으로 처리
	}
	else if(me.IsQuestTried(200115))
	{
		// DebugOut(`200115 퀘스트 완료 처리 & 보상`);
		me.CleanQuestHistory(200115); // 구 퀘스트를 한 것으로 처리
		// DebugOut(`11 - 200115 대신 200132 퀘스트로 교체`);
		me.ForceCompleteQuest(200132); // 신 퀘스트를 한 것으로 처리
		me.AddGameQuest(200116, 0);	// 다음 퀘스트 지급
		//보상
		me.GainExp(2000);
		me.DoStript(`additemex(id:50004 rewardview:true)`);
		me.IncreaseMoney(1000); //돈 1000
		me.DoStript(`additemex(id:74167 col1:FFA600 rewardview:true)`); //이상한 고양이가 보낸 메모
	}


	//////////////////////////////////////////////////////////////////////////////////////
	// G1 클리어한 이후, 도우갈과 대화할 때 오류 보고하라고 나오는 현상 수정
	// 저 세상 씰브레이커 타이틀 획득과 함께 g1_36 키워드를 받게 되어서 나타난 현상이었습니다.
	// 이곳의 코드는 2006년 9월 28일 작성되었습니다. by  jisangs
	//////////////////////////////////////////////////////////////////////////////////////
	if (me.HaveKeyword(`g1_complete`))	// G1 을 완료했으면
	{
		if (me.HaveKeyword(`g1_revive_of_glasgavelen`))
		{
			me.RemoveKeyword(`g1_revive_of_glasgavelen`);
		}

		if (me.HaveKeyword(`g1_36`))
		{
			me.RemoveKeyword(`g1_36`);
		}
	}

	//////////////////////////////////////////////////////////////////////////////////////
	// 응급치료 B랭크 이상일 때
	// '치료사의 길' 퀘스트를 받지 못한 사람에게 퀘스트 지급
	// 이곳의 코드는 2006년 10월 31일 작성되었습니다. by  jisangs
	//////////////////////////////////////////////////////////////////////////////////////

	//응급치료 B
	if (me.GetSkillLevel(10009) >= 5 && !me.IsQuestTried(200020))
	{
		me.AddGameQuest(200020, 10);
	}

	if (me.IsHuman())
	{
		// 탐험 퀘스트 못받은 플레이어용 처리 코드
		if (me.IsQuestTried(301025)
			&& !me.IsQuestCompleted(301025)
			&& !me.HaveQuestTemplate(301025)
			&& me.GetExploLevel() == 5)
		{
			me.CleanQuestHistory(301025);
			me.AddExploQuest(301025,5);
		}
		else if (me.IsQuestTried(301031)
			&& !me.IsQuestCompleted(301031)
			&& !me.HaveQuestTemplate(301031)
			&& me.GetExploLevel() == 10)
		{
			me.CleanQuestHistory(301031);
			me.AddExploQuest(301031,10);
		}
		else if (me.IsQuestTried(301030)
			&& !me.IsQuestCompleted(301030)
			&& !me.HaveQuestTemplate(301030)
			&& me.GetExploLevel() == 15)
		{
			me.CleanQuestHistory(301030);
			me.AddExploQuest(301030,15);
		}
		else if (me.IsQuestTried(301034)
			&& !me.IsQuestCompleted(301034)
			&& !me.HaveQuestTemplate(301034)
			&& me.GetExploLevel() == 20)
		{
			me.CleanQuestHistory(301034);
			me.AddExploQuest(301034,20);
		}
	}

	// 미국 확장팩 후 탐험 레벨 5 이상일 때 퀘스트를 준다
	if (GetLocale().LowerCase()== `usa` || IsDevelopment())
	{
		if (!me.IsQuestCompleted(206009)
		&& !me.HaveQuestTemplate(206009)
		&& me.GetExploLevel() >= 5
		&& GetVersion() >= 604
		&& me.IsHuman())
		{
			me.AddGameQuest(206009, 1);
		}
	}
//////////////////////////////////////////////////////////////////////////////////////
//누렙 100이하의 초보자 한테 초보자용 나오의 영혼석 주기
//////////////////////////////////////////////////////////////////////////////////////
	{
		if(me.IsBeginner() && (IsEnable(`featureHelpNewbie`) extern (`data/script/features.mint`)))
		{
			if (GetLocale().LowerCase()!=`japan`)    // 일본에는 나오의 서포트가 있어서 포함하지 않음
			{
				//초보자용 나오 영혼석 지급 deed(58)
				if(me.IsEnableDeed(58))
				{
					me.RemoveItemCls(85539);	// 로그인시 초보자용 나오의 영혼석을 삭제 한다
					me.AddItem(85539,3);    // 로그인시 초보자용 나오의 영혼석을 준다.
	//				me.AddItem(85539);    // 로그인시 초보자용 나오의 영혼석을 준다
	//				me.AddItem(85539);    // 로그인시 초보자용 나오의 영혼석을 준다
					me.DoneDeed(58);
				}
			}
		}
	}

}

/////////////////////////////////////////////////////////////////////////////////
server int GetDemigodExp(
	int _skillLevel)
// : _스킬 랭크값에 따라서 레벨업 시에 얼마나 수Ȭ٘를 올려줄 지 정한다.
//////////////////////////////////////////////////////////////////////////////////
{
	int demigodExp = 0;

	if(_skillLevel == 1)
	{
		demigodExp = 264;
	}
	else if(_skillLevel == 2)
	{
		demigodExp = 246;
	}
	else if(_skillLevel == 3)
	{
		demigodExp = 230;
	}
	else if(_skillLevel == 4)
	{
		demigodExp = 223;
	}
	else if(_skillLevel == 5)
	{
		demigodExp = 210;
	}
	else if(_skillLevel == 6)
	{
		demigodExp = 198;
	}
	else if(_skillLevel == 7)
	{
		demigodExp = 188;
	}
	else if(_skillLevel == 8)
	{
		demigodExp = 178;
	}
	else if(_skillLevel == 9)
	{
		demigodExp = 170;
	}
	else if(_skillLevel == 10)
	{
		demigodExp = 162;
	}
	else if(_skillLevel == 11)
	{
		demigodExp = 151;
	}
	else if(_skillLevel == 12)
	{
		demigodExp = 140;
	}
	else if(_skillLevel == 13)
	{
		demigodExp = 130;
	}
	else if(_skillLevel == 14)
	{
		demigodExp = 120;
	}
	else if(_skillLevel == 15)
	{
		demigodExp = 100;
	}

	// 테섭이면 5배한다.
	if (IsTestServer())
	{
		demigodExp = demigodExp * 5;
	}


	return demigodExp;
}

//////////////////////////////////////////////////////////////////////////////////
server void OnDonationRequest(character player, bool _bSuccess, int donation, int totalDonation )
//////////////////////////////////////////////////////////////////////////////////
{
	if (_bSuccess)
	{
		string caption=["event.pc_event.20"];
		caption = ToString(donation)+["event.pc_event.21"]+ToString(totalDonation)+["event.pc_event.22"];
		player.ShowCaption(caption);

		// DebugOut(`---------- 기부 성공 ----------`);
		// DebugOut(`기부액: `+ToString(donation));
		// DebugOut(`총 기부액: `+ToString(totalDonation));

		if(IsDevelopment())
		{
			if(player.GetTitle() == 60001)
			{
				// 개발 서버 & 데브캣 타이틀은 무조건 요일 보상 퀘스트를 준다
				// DebugOut(`개발 서버 & 데브캣이면 무조건 요일 보상 퀘스트를 준다`);
				player.AddQuest(1038);
			}
		}

		if(GetDay()==6)
		{
			// 토요일에는 요일 보상을 준다.
			int iRandom = Random(10000);
			int iRate1 = 0;
			int iRate2 = 0;

			// 이번에 기부한 금액에 따라 확률 결정 0~3%
			if(donation >= 30000)
			{
				iRate1 = 300;
			}
			else if(donation >= 10000)
			{
				iRate1 = 0.0075 * donation + 75;
			}
			else if(donation >= 1000)
			{
				iRate1 = 0.0111 * donation + 38.889;
			}
			else if(donation >= 100)
			{
				iRate1 = 0.0333 * donation + 16.667;
			}
			else
			{
				iRate1 = 0;
			}

			// 총 금액에 따라 확률 보정 0~3% (취소)
			// 총 금액에 따라 확률 보정,*1 ~ *2,  5만 이상이면 2배가 된다.
			if(totalDonation < 0)
			{
				totalDonation = 0;
			}
			else if(totalDonation > 50000)
			{
				totalDonation = 50000;
			}

			iRate2 = (0.02*totalDonation)+1000;

			// DebugOut(`확률가: `+ToString(iRate1));
			// DebugOut(`확률나: `+ToString(iRate2));

			iRate1 = iRate1 * iRate2 / 1000;

			// DebugOut(`확률다: `+ToString(iRate1));
			// DebugOut(`확률라: `+ToString(iRandom));

			if (iRandom < iRate1)
			{

				// DebugOut(`보상 퀘스트 받는다.`);
				player.AddQuest(1038);
			}
			else
			{

				// DebugOut(`보상 퀘스트 못 받는다. oTL`);
			}

		}
	}
	else
	{
		player.ShowCaption(["event.pc_event.23"]);

		// DebugOut(`---------- 기부 실패 ----------`);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void DonateToBeginner(character player, int donation, bool bAnonymous)
//////////////////////////////////////////////////////////////////////////////////
{

	if (donation >= 50000)		// 누적 기부금이 50000 이상일 경우에만 검사를 한다.
	{
		// 접속하는 유저 중에 초보자 플래그를 확인하여 계정내 레벨 50이하의 캐릭터만 보유하고 있는 유저만 지원금을 받도록 선택된다.
		character beginner = player.FindBeginnerForDonationPlay();

		if (beginner.IsValid())
		{
			string strSenderName = ["event.pc_event.24"];
			string strBeginnerName = beginner.GetDisplayName();
			string strDonatorName = player.GetDisplayName();
			string strBeginnerMsg;
			string strDonatorMsg;

			int itemCharge = 0;	// 메일에서 아이템 받을 때 지불해야 하는 대금

			if (bAnonymous)
			{
				strDonatorMsg = ["event.pc_event.25"];
				strBeginnerMsg = ["event.pc_event.26"];
			}
			else
			{
				strDonatorMsg = ["event.pc_event.27"]+strBeginnerName+["event.pc_event.28"];
				strBeginnerMsg = ["event.pc_event.29"]+strDonatorName+["event.pc_event.30"];
			}

			// 누적 기부금의 12%에 5000 단위로 반올림
			int support = donation * 0.12;
			support = (support/5000 + 0.5);
			support = support * 5000;

			// 지원금은 10000 ~ 100000
			if (support < 10000)
			{
				support = 10000;
			}
			else if(support > 100000)
			{
				support = 100000;
			}

			string strSupportItem = `id:2004 count:` + ToString(support);

			stdapi api;
			if (api.SendAdminMail(strSenderName, strBeginnerName, strBeginnerMsg, strSupportItem, itemCharge))
			{
				// 로그를 기록한다.
				api.WriteDonationSupportLog(player, beginner, support);

				beginner.ShowCaption(["event.pc_event.31"]);
			}
			api.SendAdminMail(strSenderName, strDonatorName, strDonatorMsg, ``, itemCharge);
		}
	}

	return;
}

//////////////////////////////////////////////////////////////////////////////////
server void DonateItem(character player, item cItem)
// : 아이템을 ذ부했다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 리리스의 기부금 아이템을 기부했다.

	int iItemId = cItem.GetClassId();
	string sItemName = cItem.GetLocalName();

	if(iItemId == 75442)
	{
		// 아이템 지우고 키워드 준다.
		player.RemoveItemCls(75442);
		player.AddKeyword(`g12_lileas_money`);
		player.RemoveKeyword(`g12_lileas`);
		player.ShowCaption(["event.pc_event.32"]);
		/*
		if(player.HaveQuestTemplate(293007) && player.GetCompletedQuestObjectiveCount(293007) == 4)
		{
			// 아이템 지우고 키워드 준다.
			player.RemoveItemCls(75442);
			player.AddKeyword(`g12_lileas_money`);
			player.RemoveKeyword(`g12_lileas`);
			player.ShowCaption("리리스에게 받은 기부금을 기부했다.`);
		}
		else
		{
			// 여기오면 안되는데 에러 대비해서 사념파를 표시한다.
			player.ShowCaption("기부함에 넣을 수 없다.`);
		}
		*/
	}
	else
	{
		player.ShowCaption(["event.pc_event.33"]);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void SetDemiGodType(character me)
// : PC가 월드에 로그인 할 때마다 불리는 함수이다.
// : 이 함수는 클라이언트 사이드에서도 완전히 로그인이 되었을 때 불린다.
//////////////////////////////////////////////////////////////////////////////////
{
	if((IsEnable(`featureG10MainStream`) extern (`data/script/features.mint`)))
	{
		if((me.HaveKeyword(`g10_complete`) || me.HaveKeyword(`g11_complete`)) && me.GetDemiGodSupportType()==0)
		// 보스 클리어 했는데, 어느 신도 지원하지 않으면 네반으로 설정
		{
			// DebugOut(`네반 지원 모드로 변환`);
			me.SetDemiGodSupportType(1);
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void ResetCropPrice(character me)
// : 경작물 매수가격이 이상하게 되었을 때 초기화시켜주는 함수
//////////////////////////////////////////////////////////////////////////////////
{
	// 안타깝게도, 초기 값을 가져오는 함수가 없다.
	me.SetCropPrice(1, 9000);		// 호박 9000
	me.SetCropPrice(2, 3000);		// 딸기 3000
	me.SetCropPrice(3, 4000);		// 토마토 4000
	me.SetCropPrice(4, 4000);		// 가지 4000
	me.SetCropPrice(5, 4000);		// 양배추 4000

}
