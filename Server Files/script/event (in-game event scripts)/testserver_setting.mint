//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G9 Script
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnLogInTestServer(
	character me)
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsTestServer())
	{

		if (!me.HaveKeyword(`Aprestore_test`) && (GetYear() == 2010 && GetDate()<=1208)) // 12월 9일 전까지만 지급
		{
			me.AddKeyword(`Aprestore_test`);
			me.DoStript(`additemex(id:85558 ap:1000)`); // 보상 AP 지급
		}
		//G13S2
		if (GetVersion() >= 1302 && !me.IsGiant())
		{
			//로그인시 다음 스킬들 F 랭크 입수
			//보우, 크로스 보우 마스터리
			me.AddSkill(23060,1);
			me.AddSkill(23061,1);
		}
		//G13S1
		if (GetVersion() >= 1301)
		{
			//로그인시 다음 스킬들 F 랭크 입수
			//리프 어택
			me.AddSkill(20012,1);
			//현혹의 연주
			me.AddSkill(30015,1);
			//볼트 마법 조합
			me.AddSkill(30453,1);
			//소드/액스/블런트 마스터리
			me.AddSkill(23012,1);
			me.AddSkill(23013,1);
			me.AddSkill(23014,1);
			//파이어/아이스/라이트닝 마스터리
			me.AddSkill(30016,1);
			me.AddSkill(30017,1);
			me.AddSkill(30018,1);
			//볼트 마스터리
			me.AddSkill(30019,1);
			//불/물/흙/바람 연금술 마스터리
			me.AddSkill(35016,1);
			me.AddSkill(35017,1);
			me.AddSkill(35018,1);
			me.AddSkill(35019,1);
			//연성 마스터리
			me.AddSkill(35021,1);
			//헤일스톰
			me.AddSkill(30307,1);
		}
		// G12S1 EX
		if (GetVersion() >= 1201.1 )
		{
			// 로그인 시 엑셀레이터(가칭) F랭크 입수
			me.AddSkill(35015,1);

			if (GetVersion() == 1201.1 )
			{
				// G12S1EX 기간 동안만 테스트 서버에 로그인했을 때 페카 중급 통행증이 없으면 넣어준다.
				if(me.GetItemNoWithClassId(63227) == 0)	me.RcvItemWithRewardView(me, 63227);
			}
		}

		//G12S2 신스킬 지급
		if(!me.IsGiant() && IsEnable(`featureSplinterShot`) extern (`data/script/features.mint`))  
		{
			// 크래시 샷 F랭크
			if(!me.IsUsableSkill(22011))
			{
				me.AddSkill(22011,1);
			}
			// 서포트 샷 F랭크
			if(!me.IsUsableSkill(21006))
			{
				me.AddSkill(21006,1);
			}	
		}

		if(IsEnable(`featureTreasureOfGod`) extern (`data/script/features.mint`))
		{
			// 팔리아스 게이트 열고 보물 얻으러 갈 수 있도록 허가
			if(!me.HaveKeyword(`g12_complete`))
			{
				me.AddKeyword(`g12_complete`);
			}
			if(!me.HaveKeyword(`treasure_slot1`))
			{
				me.AddKeyword(`treasure_slot1`);
				me.RcvItemWithRewardView(me, 12279);
				me.RcvItemWithRewardView(me, 12280);

				int iRandom = Random(8);

				// 보물 중 하나를 랜덤하게 지급한다.
				switch(iRandom)
				{
					case(0)	{ me.RcvItemWithRewardView(me, 12226); }
					case(1)	{ me.RcvItemWithRewardView(me, 12231); }
					case(2)	{ me.RcvItemWithRewardView(me, 12236); }
					case(3)	{ me.RcvItemWithRewardView(me, 12241); }
					case(4)	{ me.RcvItemWithRewardView(me, 12246); }
					case(5)	{ me.RcvItemWithRewardView(me, 12251); }
					case(6)	{ me.RcvItemWithRewardView(me, 12261); }
					case(7)	{ me.RcvItemWithRewardView(me, 12266); }
					default	{ me.RcvItemWithRewardView(me, 12266); }
				}
			}
			if(me.GetItemNoWithClassId(65051) == 0)
			{
				me.RcvItemWithRewardView(me, 65051);
			}
			if (!me.HaveKeyword(`testserver_give_brionac`))
			{
				me.DoStript(`additemex(id:40319 rewardview:true)`);
				me.DoStript(`additemex(id:65049 count:10 rewardview:true)`);
				me.AddKeyword(`testserver_give_brionac`);
			}
		}

		if(IsEnable(`featureSelectGod`) extern (`data/script/features.mint`))
		{	
			// 네반의 반신화 스킬 2종 투입 & 새도우 오브 스피리트 투입
			if(!me.IsUsableSkill(45007))
			{
				me.AddSkill(45007,1);
			}
			if(!me.IsUsableSkill(45008))
			{
				me.AddSkill(45008,6);
			}
			if(!me.IsUsableSkill(45009))
			{
				me.AddSkill(45009,6);
			}

			// 모리안 모드로 설정
			me.SetDemiGodSupportType(2);
		}

		if(IsEnable(`featureCylinderExplosion`) extern (`data/script/features.mint`))
		{	
			// 타워 실린더 장비 가능케 하는 키워드 추가
			if(!me.HaveKeyword(`usable_tower_cylinder`))
			{
				me.AddKeyword(`usable_tower_cylinder`);
				me.DoStript(`additemex(id:40338 rewardview:true)`);
			}
		}
		
		if(IsEnable(`featureTowerCylinder`) extern (`data/script/features.mint`))
		{	
			// 히트 버스트 F랭크 습득
			if(!me.IsUsableSkill(35014))
			{
				me.AddSkill(35014,1);
			}
		}

		if(IsEnable(`featureCashtemDuncan`) extern (`data/script/features.mint`))  //던컨이 캐시템을 판다는 것을 알리는 퀘스트
		{
			if (!me.IsQuestTried(207002))
			{
				me.AddGameQuest(207002, 0);
			}
		}

		/////////////////////////////////////
		//
		//	G11S2 연금술 스킬 레벨 올려주기
		//
		/////////////////////////////////////

		if (GetVersion() >= 1102 && GetVersion() < 1201 )
		{
			// 키워드 없으면 아이템 주면서 키워드 주기
			if(me.GetSkillLevel(35003) < 5 )	// 연금술 마스터리가 B 랭크 미만이면 (연습랭크거나 스킬이 없으면 0 리턴)
			{
				me.AddSkill(35003, 5);		// B 랭크로 높여준다.
			}

			// 요리 스킬 테스트 서버에 투입
			if(!me.IsUsableSkill(10020) || me.GetSkillLevel(10020) < 8 )
			{
				me.AddSkill(10020, 8);		// 요리 스킬

			}

			// 요리 스킬북도 투입
			if(!me.HaveKeyword(`testserver_give_cooking_book`))
			{

				me.DoStript(`additemex(id:1221 rewardview:true)`);
				me.DoStript(`additemex(id:1222 rewardview:true)`);

				me.AddKeyword(`testserver_give_cooking_book`);
			}

			// 바드송 음지, 연주 스킬 테스트를 위해 8랭크 주기
			if(!me.IsUsableSkill(10003) || me.GetSkillLevel(10003) < 8 )
			{
				me.AddSkill(10003, 8);		// 악기 연주 스킬

			}

			if(!me.IsUsableSkill(10006) || me.GetSkillLevel(10006) < 8 )
			{
				me.AddSkill(10006, 8);		// 음악적 지식 스킬

			}

			// 컴뱃 마스터리, 매직 마스터리 6랭크 주기: 악보 연주 요구 사항
			if(!me.IsUsableSkill(23002) || me.GetSkillLevel(23002) < 10 )
			{
				me.AddSkill(23002, 10);		// 컴뱃 마스터리

			}

			if(!me.IsUsableSkill(30007) || me.GetSkillLevel(30007) < 10 )
			{
				me.AddSkill(30007, 10);		// 매직 마스터리

			}
			
			// 파티 힐링 변경점 테스트를 위해 8랭크 주기
			if(!me.IsUsableSkill(30008) || me.GetSkillLevel(30008) < 8 )
			{
				me.AddSkill(30008, 8);		// 파티 힐링 스킬

			}

			// 목공 F 랭크 넣어 주기
			if(!me.IsUsableSkill(10033) || me.GetSkillLevel(10033) < 81 )
			{
				me.AddSkill(10033, 1);		// 목공 스킬

			}
		}

		/////////////////////////////////////
		//
		//	G11S1Ex  B+ 폭탄, 브류나크 주기
		//
		/////////////////////////////////////

		if (GetVersion() >= 1101.1 && GetVersion() < 1102)
		{
			// 키워드 없으면 아이템 주면서 키워드 주기
			if(!me.HaveKeyword(`testserver_give_bomb`))
			{
				me.DoStript(`additemex(id:85051 count:10 rewardview:true)`);
				me.AddKeyword(`testserver_give_bomb`);
			}
			if (!me.HaveKeyword(`testserver_give_brionac`))
			{
				me.DoStript(`additemex(id:40319 rewardview:true)`);
				me.DoStript(`additemex(id:65049 count:10 rewardview:true)`);
				me.AddKeyword(`testserver_give_brionac`);
			}
		}

		/////////////////////////////////////
		//
		//	G11 테스트서버 스킬 세팅
		//
		/////////////////////////////////////

		if (GetVersion() >= 1101)
		{
			// 회피 F랭크 습득
			if(!me.IsUsableSkill(23043))
			{
				me.AddSkill(23043,1);
			}

			// 스파크
			if(!me.IsUsableSkill(35013))
			{
				me.AddSkill(35013,1);
			}


		}

		/////////////////////////////////////
		//
		//	G10 S2 EX 테스트서버 _ 스케치 프린팅 의상 제공
		//
		/////////////////////////////////////

		if (GetVersion() >= 1002.1)
		{
			if(!me.HaveKeyword(`g10s2ex_testserver_printing_wear`))
			{
				me.AddItem(15424);    // 프린팅 캐주얼 웨어 지급

				me.AddKeyword(`g10s2ex_testserver_printing_wear`);
			}

		}



		/////////////////////////////////////
		//
		//	G10 S2 테스트서버 연금술 스킬 세팅
		//
		/////////////////////////////////////

		if (GetVersion() >= 1002)
		{
			// 금속 변환
			if(!me.IsUsableSkill(35012))
			{
				me.AddSkill(35012,1);
			}
			// 블레이즈
			if(!me.IsUsableSkill(30470))
			{
				me.AddSkill(30470,1);
			}

		}


		/////////////////////////////////////
		//
		//	G10 테스트서버 연금술 스킬 세팅
		//
		/////////////////////////////////////

		if (GetVersion() >= 1001)
		{
			// 프로즌 블래스트
			if(!me.IsUsableSkill(35011))
			{
				me.AddSkill(35011,1);
			}
			// 레인 캐스팅
			if(!me.IsUsableSkill(35010))
			{
				me.AddSkill(35010,1);
			}
			// 반신화 3종스킬 추가
			if(!me.IsUsableSkill(45001))
			{
				me.AddSkill(45001,1);
			}

			if(!me.IsUsableSkill(45002))
			{
				me.AddSkill(45002,1);
			}

			if(!me.IsUsableSkill(45003))
			{
				me.AddSkill(45003,1);
			}
		}

		/////////////////////////////////////
		//
		//	G9 테스트서버 연금술 스킬 세팅
		//
		/////////////////////////////////////

		if (GetVersion() >= 901)
		{
			// 골렘 연성
			if(!me.IsUsableSkill(50032))
			{
				me.AddSkill(50032,1);
			}
			// 마나 포밍
			if(!me.IsUsableSkill(35001))
			{
				me.AddSkill(35001,1);
			}
			// 분해
			if(!me.IsUsableSkill(10030))
			{
				me.AddSkill(10030,1);
			}
			// 라이프드레인
			if(!me.IsUsableSkill(35002))
			{
				me.AddSkill(35002,1);
			}
			// 합성
			if(!me.IsUsableSkill(10031))
			{
				me.AddSkill(10031,1);
			}
			// 연금술 마스터리
			if(!me.IsUsableSkill(35003))
			{
				me.AddSkill(35003,1);
			}
			// 워터 캐논
			if(!me.IsUsableSkill(35004))
			{
				me.AddSkill(35004,1);
			}
			// 방호벽
			if(!me.IsUsableSkill(35006))
			{
				me.AddSkill(35006,1);
			}
			// 윈드블래스트
			if(!me.IsUsableSkill(35007))
			{
				me.AddSkill(35007,1);
			}
		}

		if (GetVersion() >= 902)
		{
			// 플레임
			if(!me.IsUsableSkill(35008))
			{
				me.AddSkill(35008,1);
			}
			// 샌드 스톰
			if(!me.IsUsableSkill(35009))
			{
				me.AddSkill(35009,1);
			}
		}


		// G8S3 이후 테섭에 로그인하면 마나실드 바로 배운다.
		if( GetVersion() >= 803 && !me.IsUsableSkill(30464) )
		{
			me.KnowSkill(30464);
		}

		//G8S5 에 테섭에 로그인 하면 엘프는 파이널 샷 자이언트는 타운트 & 윈드 브레이커 배운다.
		if(me.IsElf() && (IsEnable(`featureFinalShotSkill`) extern (`data/script/features.mint`)))
		{
			if(!me.IsUsableSkill(23030))
			{
				me.AddSkill(23030,1);
			}
		}
		if(me.IsGiant() && (IsEnable(`featureProvokeSkill`) extern (`data/script/features.mint`)))
		{
			if(!me.IsUsableSkill(23028))
			{
				me.AddSkill(23028,1);
				me.AddSkill(23029,1);
			}
		}

		// 승단 테스트. G7S4에는 테스트 서버에 로그인하면 디펜스/스매시/카운터/윈드밀/매그넘/컴뱃/레인지/아볼/파볼/라볼/천옷/블스 스킬을 1랭크로 만들어 준다. - uhihiho
		if (GetVersion() == 704)
		{
			me.AddSkill(20001,15);		// 디펜스 1랭크
			me.AddSkill(20002,15);		// 스매시 1랭크
			me.AddSkill(20003,15);		// 카운터 어택 1랭크
			me.AddSkill(22001,15);		// 윈드밀 1랭크
			me.AddSkill(23002,15);		// 컴뱃 마스터리 1랭크
			me.AddSkill(30101,15);		// 아볼 1랭크
			me.AddSkill(30201,15);		// 파볼 1랭크
			me.AddSkill(30301,15);		// 라볼 1랭크
			me.AddSkill(10001,15);		// 천옷 1랭크
			me.AddSkill(10016,15);		// 블스 1랭크

			if (me.IsGiant())
			{
				if (me.IsUsableSkill(21001))	// 레인지 컴뱃 마스터리 잘못 지급된 것 삭제
				{
					me.ForgetSkill(21001);
				}
				if (me.IsUsableSkill(21002))	// 매그넘 샷 잘못 지급된 것 삭제
				{
					me.ForgetSkill(21002);
				}
			}
			else
			{
				me.AddSkill(21002,15);		// 매그넘 샷 1랭크
				me.AddSkill(21001,15);		// 레인지 컴뱃 마스터리 1랭크
			}
		}


		// G7S4  테섭 종이비행기 액션 잘못 배운애들 꺼 삭제.
		if( GetVersion() >= 704 && me.GetSkillLevel(50023) == 1 )
		{
			me.ForgetSkill(50023);
		}


		// G7S4 이후 테섭에 로그인하면 종이비행기 액션 바로 배운다.
		if( GetVersion() >= 704 && !me.IsUsableSkill(50023) )
		{
			me.KnowSkill(50023);
			me.OpenSkill(50023);
		}

		// G7S3 이후 테섭에 로그인하면 야금술 스킬 바로 배운다.
		if(GetVersion() >= 703	&& !me.IsUsableSkill(10028)	)
		{
			me.AddSkill(10028,1);
		}

		//G7S2 부터 돌진 알려주기
		if( GetVersion() >= 702 && !me.IsUsableSkill(20011) )
		{
			me.AddSkill(20011,1);
		}


		//G7S1 부터 조련, 매직 실드 알려주기
		if( GetVersion()>=701 )
		{
			if(!me.IsUsableSkill(10026))
			{
				me.AddSkill(10026,1);
			}

			if(!me.IsUsableSkill(30460))
			{
				me.AddSkill(30460,1);
			}

			if(!me.IsUsableSkill(30461))
			{
				me.AddSkill(30461,1);
			}

			if(!me.IsUsableSkill(30462))
			{
				me.AddSkill(30462,1);
			}

			if(!me.IsUsableSkill(30463))
			{
				me.AddSkill(30463,1);
			}
		}


		// G6S4 부터 테섭에 엘프/자이언트 야수화 스킬 공짜로 뿌리기
		if(me.IsElf() && GetVersion() >= 604)
		{
			if(!me.IsUsableSkill(43001))
			{
				me.AddSkill(43001,1);
				me.AddSkill(43002,1);
				me.AddSkill(43011,1);
				me.AddSkill(43012,1);
				me.AddSkill(43013,1);
				me.AddSkill(43021,1);
				me.AddSkill(43022,1);
				me.AddSkill(43023,1);
			}
		}
		if(me.IsGiant() && GetVersion() >= 604 )
		{
			if(!me.IsUsableSkill(44001))
			{
				me.AddSkill(44001,1);
				me.AddSkill(44002,1);
				me.AddSkill(44011,1);
				me.AddSkill(44012,1);
				me.AddSkill(44013,1);
				me.AddSkill(44021,1);
				me.AddSkill(44022,1);
				me.AddSkill(44023,1);
			}
		}

		// G3S4 부터 테섭에 팔라딘 다크나이트 스킬 공짜로 뿌리기
		// 인간만 by jisangs, 060601
		if(me.IsHuman() && !me.IsUsableSkill(40001) && !me.IsUsableSkill(41001) && GetVersion() >= 304 )
		{
			if(Random(100)>50)
			{
				DebugOut(`팔라딘 스킬을 주자`);
				//팔라딘
				me.AddSkill(40001,1);
				me.AddSkill(40002,1);
				me.AddSkill(40003,1);
				me.AddSkill(40004,1);
				me.AddSkill(40011,1);
				me.AddSkill(40012,1);
				me.AddSkill(40013,1);
			}
			else
			{
				DebugOut(`다크 나이트 스킬을 주자`);
				//다크 나이트
				me.AddSkill(41001,1);
				me.AddSkill(41011,1);
				me.AddSkill(41012,1);
				me.AddSkill(41013,1);
				me.AddSkill(41021,1);
				me.AddSkill(41022,1);
				me.AddSkill(41023,1);
				me.AddSkill(41002,1);

			}
		}
	}
}
