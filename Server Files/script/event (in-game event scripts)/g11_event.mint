//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G10 Script
//////////////////////////////////////////////////////////// component of Mabinogi






//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G11_Begin(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//G11 메인스토리 시작
	me.AddKeyword(`g11`);

	if (IsDevelopment())
	{
		me.AddGameQuest(292001, 0);
	}
	else
	{
		me.AddGameQuest(292001, 9);		//  90초후, 컷신과 안 겹치게.
	}

	me.LeaveEventRegion();
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G11_Meeting_buchanan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	/*
	me.AddKeyword(`g11_03`);
	me.RemoveKeyword(`g11_02`);
	me.RemoveItemCls(75356);
	*/
	me.Move(401, 81524, 125668);  // 타라 제단 앞
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_partholon_mystery(
	character me,					// 퀘스트 완료한 유저
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(300, 176751, 224288);
}





//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Jenna_Rebirth(
	character me,					// 퀘스트 완료한 유저
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(401, 81524, 125668);  // 타라 제단 앞
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_cichol_death(
	character me,					// 퀘스트 완료한 유저
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(300, 222146, 198479);  // 콜헨 앞
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_jenna_offering(
	character me,					// 퀘스트 완료한 유저
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//	레이모어랑 제너 구출하러 갔다. 제단 위로워프
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(me.GetRegionId(), 52311, 62650);	// 제단 위
	dungeon2 _dungeon = me.FindDungeon2();

	if (!_dungeon.IsNull())
	{
		dungeon2puzzle _puzzle;
		_dungeon.GetData(`puzzle_neamhain`, _puzzle);
		if (!_puzzle.IsNull())
		{
			_puzzle.Complete();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_jenna_rage(
	character me,					// 퀘스트 완료한 유저
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//	제너 구출했다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(401, 81524, 125668);  // 타라 제단 앞
}



//////////////////////////////////////////////////////////////////////////////////
server void OnUseShadowStone(
	character me)
//	새도우 스톤을 3번 사용하였다. 새도우 오브 스피릿을 얻는다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 여기에서 파이톤 나이트 1차를 해제해주세요.
	dungeon2 _dungeon = me.FindDungeon2();
	if (!_dungeon.IsNull())
	{
		dungeon2puzzle _puzzle;
		_dungeon.GetData(`phase1`, _puzzle);
		if (!_puzzle.IsNull())
		{
			// 1차를 해제하고 퍼즐 완료시킨다.
			dungeon2monster monsterGroup = _puzzle.FindMonsterGroup(`monster1`);
			monsterGroup.ClearMonster();
			_puzzle.Complete();
		}
	}

	// 기존의 반신화 꺼준다.
	if(me.IsSkillTurnedOn(45001))
	{
		me.SkillTurnOff(45001);
	}

	// 키워드 2종 제공
	me.AddKeyword(`g11_python_knight_battle_light`);
	me.AddKeyword(`g11_python_knight_battle_shadow`);

	me.Move(me.GetRegionId(), 110882, 117341 );


	// 이제 컷신 플레이
	if (me.IsGiant())
	{
		if (me.IsFemale())
		{
			me.PlayCutScene(`C3G11_S#8_2_sprit_of_shadow_giant_female`);
		}
		else
		{
			me.PlayCutScene(`C3G11_S#8_2_sprit_of_shadow_giant_male`);
		}
	}
	else
	{
		me.PlayCutScene(`C3G11_S#8_2_sprit_of_shadow`);
	}
}

// 파이톤 나이트와 만나는 컷신
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Shadowknight_Truth(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon2 _dungeon = me.FindDungeon2();
	if (!_dungeon.IsNull())
	{
		dungeon2puzzle _puzzle;

		_dungeon.GetData(`activator1`, _puzzle);
		if (!_puzzle.IsNull())
		{
			_puzzle.Complete();
		}
	}

	me.PlayMusic(`Boss_Shadow_2.mp3`, 0);

}

// 스피릿 오브 새도우를 받는 컷신을 튼 다음
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Spirit_Of_Shadow(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon2 _dungeon = me.FindDungeon2();
	if (!_dungeon.IsNull())
	{
		dungeon2puzzle _puzzle;
		_dungeon.GetData(`activator2`, _puzzle);
		if (!_puzzle.IsNull())
		{
			_puzzle.Complete();

			// 다시 반신화를 강제로 켜 준다.
			if(!me.IsSkillTurnedOn(45001))
			{
				me.SkillTurnOn(45001);
			}

			// 스피릿 오브 새도우 스킬 부여
			// 키워드 g11_python_knight_battle_shadow 와 함께 있다면 임시 버전으로 사용된다.

			me.AddSkill(45007, 1);
			me.ModifySkillExpPoint(45007, 1000);
		}
	}
}





//////////////////////////////////////////////////////////////////////////////////
server void OnG11MainQuestClear(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{

	// 292201 G11S2 케이 스토리 퀘스트
	if (_idQuest == 292201)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(292202, 0);   // 개발 서버는 바로 준다.
		}
		else
		{
			me.AddGameQuest(292202, 6);		// 1분 후에 배달
		}
	}

	// 292202 G11S2 케이 스토리 퀘스트 완료
	if (_idQuest == 292202)
	{
		// 중간 키워드는 모두 삭제. 완료 키워드만 남긴다.
		me.AddKeyword(`g11_s2_cai_complete`);
		me.RemoveKeyword(`g11_s2_cai_01`);
		me.RemoveKeyword(`g11_s2_cai_02`);
		me.RemoveKeyword(`g11_s2_cai_03`);
		me.RemoveItemCls(63518);
	}





	// 292101  퍼거스의 부탁
	if (_idQuest == 292101)
	{


		if (IsDevelopment())
		{
			me.AddGameQuest(292102, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292102, 6);		// 1분 후에 배달
		}
	}



	// 292102 드레스 구하기
	if (_idQuest == 292102)
	{


		if (IsDevelopment())
		{
			me.AddGameQuest(292103, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292103, 216);		// 36분 후에 배달 - 에린의 1일
		}
	}



	// 292103 드레스 완성
	if (_idQuest == 292103)
	{


		if (IsDevelopment())
		{
			me.AddGameQuest(292104, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292104, 6);		// 1분 후에 배달
		}
	}

	// 292104 에티켓 익히기
	if (_idQuest == 292104)
	{


		if (IsDevelopment())
		{
			me.AddGameQuest(292105, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292105, 6);		// 1분 후에 배달
		}
	}

	// 292105 피부 미용
	if (_idQuest == 292105)
	{


		me.AddKeyword(`g11_s2_jenna_complete`);

		me.RemoveKeyword(`g11_s2_etiquette`);
		me.RemoveKeyword(`g11_s2_glove`);


	}

















	// 292001 서적상 부캐넌 실종사건
	if (_idQuest == 292001)
	{


		me.RemoveKeyword(`g11_00`);


		if (IsDevelopment())
		{
			me.AddGameQuest(292002, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292002, 6);		// 1분 후에 배달
		}
	}


	// 292002 왕성의 요리사
	if (_idQuest == 292002)
	{


		me.RemoveKeyword(`g11_01`);
		me.RemoveKeyword(`g11_02`);

		me.RemoveItemCls(75356); // 부캐넌의 장서관 도서 카드(진짜)

		if (IsDevelopment())
		{
			me.AddGameQuest(292003, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292003, 6);		// 1분 후에 배달
		}
	}



	// 292003 연금술사의 메달
	if (_idQuest == 292003)
	{

		me.RemoveKeyword(`g11_03`);
		me.RemoveKeyword(`g11_04`);
		me.RemoveKeyword(`g11_jenna`);


		if (IsDevelopment())
		{
			me.AddGameQuest(292004, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292004, 6);		// 1분 후에 배달
		}


	}


	// 292004 제너를 찾아서 - 이 퀘스트 완료하고 제너의 편지 아이템 사용하면 292005 받는다.
	if (_idQuest == 292004)
	{

		me.RemoveKeyword(`g11_05`);

		me.RemoveItemCls(75359); // 네반의 수호부 삭제


		if (IsDevelopment())
		{
			me.AddGameQuest(292005, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292005, 6);		// 1분 후에 배달
		}

	}


	// 292005 신들의 검 - 이 퀘스트 완료하고 브류나크 키워드로 왕성 npc들과 대화 중 브리아나와 대화하면 292006 받는다.
	if (_idQuest == 292005)
	{
		me.RemoveKeyword(`g11_06`);



		if (IsDevelopment())
		{
			me.AddGameQuest(292006, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292006, 6);		// 1분 후에 배달
		}

	}




	// 292006 파르홀론의 노래
	if (_idQuest == 292006)
	{

		me.RemoveKeyword(`g11_07`);
		me.RemoveKeyword(`brionac`);

		if (IsDevelopment())
		{
			me.AddGameQuest(292007, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292007, 6);		// 1분 후에 배달
		}
	}

	// 292007 파이톤나이트
	if (_idQuest == 292007)
	{

		me.RemoveKeyword(`g11_08`);
		me.RemoveKeyword(`g11_09`);

		if (IsDevelopment())
		{
			me.AddGameQuest(292008, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292008, 6);		// 1분 후에 배달
		}
	}

	// 292008 그림자 세계의 레프리컨
	if (_idQuest == 292008)
	{

		me.RemoveKeyword(`g11_10`);
		me.RemoveKeyword(`g11_11`);


		me.RemoveItemCls(75360); // 보상 받은  컬렉션북은 지워 준다.

		if (IsDevelopment())
		{
			me.AddGameQuest(292009, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292009, 6);		// 1분 후에 배달
		}
	}

	// 292009 벨리타의 상처
	if (_idQuest == 292009)
	{

		me.RemoveKeyword(`g11_12`);


		if (IsDevelopment())
		{
			me.AddGameQuest(292010, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292010, 6);		// 1분 후에 배달
		}
	}
	// 292010 스파크
	if (_idQuest == 292010)
	{

		me.RemoveKeyword(`g11_13`);

		if (IsDevelopment())
		{
			me.AddGameQuest(292011, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292011, 6);		// 1분 후에 배달
		}
	}





	// 2부부터 12번 퀘스트 바로 오도록 된다~!!!!

	// 292011 브류나크의 진화
	if (_idQuest == 292011)
	{

		me.RemoveItemCls(75370); // 혹시 있을 파르홀론 결정 또 지워주자.


		if (IsDevelopment())
		{
			me.AddGameQuest(292012, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292012, 6);		// 1분 후에 배달
		}
	}

	// 292012 티르 나 노이
	if (_idQuest == 292012)
	{

			me.AddGameQuest(292013, 0);   // 다음 퀘스트 준다.
			me.AddShadowMission(792012, true);


			me.DoStript(`additemex(id:75371 rewardview:true)`);



	}


	// 292013 파르홀론의 왕자
	if (_idQuest == 292013)
	{



		if (IsDevelopment())
		{
			me.AddGameQuest(292014, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(292014, 6);		// 1분 후에 배달
		}
	}

	// 292014 칼리번의 통행증
	if (_idQuest == 292014)
	{

			me.AddGameQuest(292015, 0);   // 다음 퀘스트 준다.
	}

	// 292015 우로보로스

	else if (_idQuest == 292015)
	{

		me.AddKeyword(`g11_complete`);
		me.DoStript(`additemex(id:62005 suffix:30317 timelimit:3600)`); // 칼리번 인챈트 스크롤

		me.RemoveItemCls(75371); // 혹시 여신의 바늘 남았다면 여기서 지워주자.

		me.RemoveItemCls(75372); // 혹시 칼리번 통행증 남았다면 지워줘요.

		// 혹시나 남아있을지 모를 단계 체크 키워드 다 지워주자.


		me.RemoveKeyword(`g11`);
		me.RemoveKeyword(`g11_01`);
		me.RemoveKeyword(`g11_02`);
		me.RemoveKeyword(`g11_03`);
		me.RemoveKeyword(`g11_04`);
		me.RemoveKeyword(`g11_05`);
		me.RemoveKeyword(`g11_06`);
		me.RemoveKeyword(`g11_07`);
		me.RemoveKeyword(`g11_08`);
		me.RemoveKeyword(`g11_09`);
		me.RemoveKeyword(`g11_10`);
		me.RemoveKeyword(`g11_11`);
		me.RemoveKeyword(`g11_12`);
		me.RemoveKeyword(`g11_13`);
		me.RemoveKeyword(`g11_14`);
		me.RemoveKeyword(`g11_15`);
		me.RemoveKeyword(`g11_16`);
		me.RemoveKeyword(`g11_17`);
		me.RemoveKeyword(`g11_aer`);
		me.RemoveKeyword(`g11_book`);
		me.RemoveKeyword(`brionac`);
		me.RemoveKeyword(`uroboros`);
		me.RemoveKeyword(`g11_uroboros`);
		me.RemoveKeyword(`g11_recipe`);
		me.RemoveKeyword(`g11_jenna`);
		me.RemoveKeyword(`g11_python_knight_battle`);
		me.RemoveKeyword(`g11_python_knight_battle_light`);
		me.RemoveKeyword(`g11_python_knight_battle_shadow`);


	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnG11MainQuestGet(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`292015 받아서 미션 줘야 한다.`);
	// 292015 우로보로스, 최종장 미션
	if (_idQuest == 292015)
	{
			// 최종장 미션을 준다
			me.AddShadowMission(792014, true);
	}	
}