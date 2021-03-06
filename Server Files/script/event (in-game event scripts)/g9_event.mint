//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G9 Script
//////////////////////////////////////////////////////////// component of Mabinogi




//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G9S2_RP_Andras(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g9s2_andrasRP_Clear`);
	me.LeaveDungeon();
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Call_Of_Adniel(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//G9 메인스토리 시작
	me.AddKeyword(`g9`);
	me.AddKeyword(`g9_01`);

	if (IsDevelopment())
	{
		me.AddGameQuest(290001, 0);
	}
	else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
	{
		me.AddGameQuest(290001, 6);		//  1분 후에 퀘스트 배달
	}
	else
	{
		me.AddGameQuest(290001, 3*6);		//  3분 후에 퀘스트 배달
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Fallon_RP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 제자리로 워프
	/*
	int posX = me.GetPositionX();
	int posY = me.GetPositionY();
	int _region = me.GetRegionId();
	me.Move(_region, posX, posY);
	*/
	character orgChar = me.GetOriginalCharacter();
	orgChar.AddKeyword(`clear_fallon_rp`);		// 퀘스트 진행 중인 유저에게 키워드 추가
	me.Move(300, 176751, 224288);
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_enter_Shadow(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
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
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leymore_Cai_RP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 1인 미션이 아니면 퀘스트 단계 체크를 해줘야 한다.
	character orgChar = me.GetOriginalCharacter();
	/*
	if (orgChar.GetCompletedQuestObjectiveCount(290002)==5 || orgChar.GetCompletedQuestObjectiveCount(290501)==4)
	{
		orgChar.AddKeyword(`g9_03`);				// 미션 완료
		orgChar.RemoveKeyword(`g9_02`);
	}
	*/
	me.Move(300, 176751, 224288);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_help_fallon(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	me.Move(300, 176751, 224288);

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		DebugOut(`나가는 사람 : ` + cChar.GetDisplayName());
		cChar.Move(300, 176751, 224288);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_first_meet_jenna(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (!me.IsPet())
	{
		me.RemoveItemCls(75249);
		me.DoStript(`additemex(id:75258 crystal_level:7 crystal_charge:5 count:7)`);
	}
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Activate();
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_use_ice(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	me.Move(300, 176751, 224288);


	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		DebugOut(`나가는 사람 : ` + cChar.GetDisplayName());
		cChar.Move(300, 176751, 224288);
	}

}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_jenna_confession(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(64, 5596, 7684);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_jenna_fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g9_09`);
	me.RemoveKeyword(`g9_08`);			// 키워드 교체
	me.RemoveItemCls(75219);			// 화살촉 목걸이 제거
	me.Move(300, 176751, 224288);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_leymore_with_enemy(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	int _radius = Random (300) - 150;
	me.Move(me.GetRegionId(), 212278 + _radius, 191300 + _radius);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_lose_player(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	me.Move(300, 176751, 224288);
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		DebugOut(`나가는 사람 : ` + cChar.GetDisplayName());
		cChar.Move(300, 176751, 224288);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_meet_again_jenna(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Activate();
				DebugOut(`액티베이트!`);
			}
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_enter_cai(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	/*
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;
	*/

	if (!me.IsUsableSkill(35002) && !me.IsPet() )
	{
		me.KnowSkill(35002);
		me.OpenSkill(35002);
	}
	me.Move(300, 176751, 224288);
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_another_race_help(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.GetCompletedQuestObjectiveCount(290011) == 1)
	{
		me.DoStript(`additemex(id:75222 rewardview:true)`);	// 드래곤의 표식 지급
		me.AddKeyword(`g9_help_jenna`);
	}
	else
	{
		me.RemoveItemCls(75222);
	}

	me.Move(300, 177767, 222539);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_fallon_identity(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (	me.GetCompletedQuestObjectiveCount(290012) == 1
		&& !me.HaveKeyword(`get_shadow_mirror`)	)
	{
		me.DoStript(`additemex(id:75223 rewardview:true)`);	// 그림자 거울 지급
		me.AddKeyword(`get_shadow_mirror`);
		me.AddShadowMission(790019, true);		// 최후의 전투
	}
	me.Move(32, 3200, 2880);
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Stop_The_Clau(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	me.Move(300, 177767, 222539);

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		DebugOut(`나가는 사람 : ` + cChar.GetDisplayName());
		cChar.Move(300, 177767, 222539);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Vs_Tethra(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
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
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Rescue_Cai(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator2`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Rescue_Cai2(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator3`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
			}
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Destruct_Machine(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator4`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Kill_Solas(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	me.Move(300, 212795, 199137);

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		DebugOut(`나가는 사람 : ` + cChar.GetDisplayName());
		cChar.Move(300, 212795, 199137);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Appear_Claimhsolas(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
// 로그 아웃할 때까지 드래곤의 지원 못 쓴다. //
{
	me.LockDragonSupport(true);
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Claimhsolas_Change(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
//보스전. 드래곤의 지원을 1번만 쓸 수 있다.//
{
	me.LockDragonSupport(false);
	me.ForceUseDragonSupport(1);
}


/*
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Appear_Claimhsolas(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator4`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
			}
		}
	}
}
*/


//////////////////////////////////////////////////////////////////////////////////
server void OnG9MainQuestBegin(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 받을 때 호출
//////////////////////////////////////////////////////////////////////////////////
{
}



//////////////////////////////////////////////////////////////////////////////////
server void OnG9MainQuestClear(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	// 팔론의 소환 완료
	if (_idQuest == 290001)
	{
		me.RemoveKeyword(`clear_fallon_rp`);		// 팔론 RP 클리어 키워드 삭제
		me.RemoveItemCls(75218);				// 모이투라의 훈장 삭제
		if (IsEnable(`featureG9Polishing`) extern (`data/script/features.mint`))		// g10s2 이후
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(290501, 0);
			}
			else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
			{
				me.AddGameQuest(290501, 6);		//  1분 후에 퀘스트 배달
			}
			else
			{
				me.AddGameQuest(290501, 20*6);		// 20분 후에 배달
			}
		}
		else
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(290002, 0);
			}
			else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
			{
				me.AddGameQuest(290002, 6);		//  1분 후에 퀘스트 배달
			}
			else
			{
				me.AddGameQuest(290002, 20*6);		// 20분 후에 배달
			}
		}
	}
	// 안드라스의 시험 완료
	else if (_idQuest == 290002 || _idQuest == 290501)
	{
		me.RemoveItemCls(75215);				// 연금술사의 인장 삭제
		if (IsDevelopment())
		{
			me.AddGameQuest(290003, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290003, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290003, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290003)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290004, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290004, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290004, 20*6);		// 20분 후에 배달
		}
	}
	else if (_idQuest == 290004)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290005, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290005, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290005, 60);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290005)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290006, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290006, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290006, 60);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290006)
	{
		me.RemoveKeyword(`clue_holyknights`);			// 성전 기사단 키워드
		if (IsDevelopment())
		{
			me.AddGameQuest(290007, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290007, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290007, 60);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290007)
	{
		if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290307, 6);		//  1분 후에 퀘스트 배달, 쉬운 버전으로 바뀜
		}
		else
		{
			me.AddGameQuest(290107, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290107 || _idQuest == 290307 )
	{
		me.RemoveKeyword(`mission_clear_01`);
		me.RemoveKeyword(`mission_clear_02`);
		me.RemoveKeyword(`mission_clear_03`);
		me.RemoveKeyword(`mission_clear_04`);
		me.RemoveKeyword(`mission_clear_05`);
		me.RemoveKeyword(`mission_clear_06`);
		if (IsDevelopment())
		{
			me.AddGameQuest(290207, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290207, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290207, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290207)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290008, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290008, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290008, 10*6);		// 10분 후에 배달
		}
	}
// 도렌이 직접 주는 퀘스트. 스토리 진행상 도렌이 주는 게 좋을 듯 -versable-
/*	else if (_idQuest == 290008)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290108, 0);
		}
		else
		{
			me.AddGameQuest(290108, 60);		// 10분 후에 배달
		}
	}
*/
	else if (_idQuest == 290108)
	{
		me.AddGameQuest(290208, 0);		// 즉시 배달.
	}
	else if (_idQuest == 290208)
	{
		me.RemoveItemCls(75221);		// 290108 에서 지워야하지만 안전빵으로 여기서 지운다.
		if (IsDevelopment())
		{
			me.AddGameQuest(290009, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290009, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290009, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290009)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290010, 0);
			me.AddGameQuest(290109, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290010, 1*6);		// 1분 후에 배달
			me.AddGameQuest(290109, 10*6);		// 10분 후에 배달

		}
		else
		{
			me.AddGameQuest(290010, 10*6);		// 10분 후에 배달
			me.AddGameQuest(290109, 20*6);		// 20분 후에 배달
		}
	}
	else if (_idQuest == 290010)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290011, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290011, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290011, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290011)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290111, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290111, 6);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290111, 5*6);		// 5분 후에 배달
		}
	}
	else if (_idQuest == 290111)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(290012, 0);
		}
		else if (IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))	//한국 메인스트림 난이도 하향
		{
			me.AddGameQuest(290012, 1);		//  1분 후에 퀘스트 배달
		}
		else
		{
			me.AddGameQuest(290012, 10*6);		// 10분 후에 배달
		}
	}
	else if (_idQuest == 290012)
	{
		me.DoStript(`addtitle(11010)`);		// 모든 퀘스트 완료시 타이틀 준다.
		me.DoStript(`additemex(id:62005 suffix:30419 suffixexpire:600 rewardview:true)`);
		me.RemoveKeyword(`g9_09`);
		me.RemoveKeyword(`g9_20`);
		me.RemoveKeyword(`g9_21`);
		me.RemoveKeyword(`get_shadow_mirror`);
		me.RemoveKeyword(`experiment_clue1`);
		me.RemoveKeyword(`experiment_clue2`);
		me.RemoveKeyword(`experiment_clue3`);
		me.RemoveKeyword(`experiment_clue4`);
		me.RemoveKeyword(`experiment_clue5`);
		me.RemoveKeyword(`experiment_clue6`);
		me.RemoveKeyword(`experiment_clue7`);
		me.RemoveKeyword(`experiment_clue8`);
		me.RemoveKeyword(`mission_clear_01`);
		me.RemoveKeyword(`mission_clear_02`);
		me.RemoveKeyword(`mission_clear_03`);
		me.RemoveKeyword(`mission_clear_04`);
		me.RemoveKeyword(`mission_clear_05`);
		me.RemoveKeyword(`NoitarArat`);
		me.RemoveKeyword(`experiment_mission8`);
		me.RemoveKeyword(`sketch_heart`);
		me.RemoveItemCls(75223);
	}
}
