//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G10 Script
//////////////////////////////////////////////////////////// component of Mabinogi



// G10S2 작업

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEndedMeetJenna_G10S2(
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
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEndedhallalchemist_G10S2(
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
		}
	}
}





//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G10_Begin(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//G10 메인스토리 시작
	me.AddKeyword(`g10`);
	me.AddKeyword(`g10_01`);

	if (IsDevelopment())
	{
		me.AddGameQuest(291001, 0);
	}
	else
	{
		me.AddGameQuest(291001, 9);		//  90초후, 컷신과 안 겹치게.
	}

	me.LeaveEventRegion();
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneSurvivorBegin(
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
server void OnCutSceneSurvivor(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(401, 81524, 125668);  // 타라 제단 앞
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneElatha_And_Leymore(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 레이모어 RP 중
	me.Move(300, 176751, 224288);  // 임시 좌표로 좌표 변경해줘야 해요.

	if (IsDevelopment())
	{
		me.AddGameQuest(291002, 0);
	}
	else
	{
		me.AddGameQuest(291002, 3*6);		//  3분 후에 퀘스트 배달
	}

}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneElatha(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnjoy_Honeydrink(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`honeydrink`);
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneDarklord_Elatha(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 엘라하 + 다크로드 만나는 키아 던전 RP
	character orgChar = me.GetOriginalCharacter();
	me.AddKeyword(`g10_11`);
	me.RemoveKeyword(`g10_10`);

	me.LeaveDungeon(); // 키아 던전
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneArneng_Loveaffair(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 아르넨의 연애사 RP
	character orgChar = me.GetOriginalCharacter();
	me.AddKeyword(`g10_14`);
	me.RemoveKeyword(`g10_13`);

	me.LeaveDungeon(); // 던전
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneVoight_Loveaffair(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 보이트의 연애사 RP
	character orgChar = me.GetOriginalCharacter();

	me.LeaveDungeon(); // 던전

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		member.LeaveDungeon();
	}
}




//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneJames_Rescue(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.LeaveDungeon(); // 던전
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneNeamhain_Secret(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.Move(300, 176751, 224288);  // 임시 좌표로 좌표 변경해줘야 해요.
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_Meet_Mata(
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
server void OnCutScene_Joust_Mata(
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
server void OnCutSceneNeamhain_Entrance(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{


	me.Move(300, 176751, 224288);  // 임시 좌표로 좌표 변경해줘야 해요.
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_neamhein_again(
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
server void OnCutSceneEnded_heart_of_courcle(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	int _size = _cMemberList.GetSize();
	dungeon2 _dungeon = me.FindDungeon2();
	if (!_dungeon.IsNull())
	{
		dungeon2puzzle _puzzle;
		_dungeon.GetData(`activator2`, _puzzle);
		if (!_puzzle.IsNull() && !_puzzle.IsComplete())
		{
			_puzzle.Complete();
		}
		else
		{
			me.ShowMessageView(`던전에 문제가 발생했습니다. 오류 보고 부탁드립니다.`);
		}
	}
}





//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G15S1(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 반신화 3종스킬 추가
	/*
	if(!me.IsUsableSkill(45001))
	{
		me.AddSkill(45001,1);
		me.ModifySkillExpPoint(45001, 1000);
	}

	if(!me.IsUsableSkill(45002))
	{
		me.AddSkill(45002,1);
		me.ModifySkillExpPoint(45002, 1000);
	}

	if(!me.IsUsableSkill(45003))
	{
		me.AddSkill(45003,1);
		me.ModifySkillExpPoint(45003, 1000);
	}
	*/
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G10S1(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 진짜 반신화 3종스킬 추가

	//워프
	me.Move(401, 81498, 125065);

}




//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_14_1_doubleganger(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
	if (me.IsPartyLeader() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
	{

		me.DoStript(`additemex(id:65047 count:5 rewardview:false)`); //
		me.DoStript(`additemex(id:75307 rewardview:false)`); //
		me.DoStript(`additemex(id:40296 rewardview:false)`); //

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
server void OnCutSceneEnded_doubleganger_change_phase(
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
server void OnG10MainQuestClear(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	// 페이단의 소환 완료하면
	if (_idQuest == 291001)
	{
		me.AddKeyword(`g10_03`);   // 레이모어 RP까지 끝냈음 (291001 완료)
		me.RemoveKeyword(`g10_02`);



		me.RemoveItemCls(75290);				// 레이모어의 수첩 삭제

		if (IsDevelopment())
		{
			me.AddGameQuest(291002, 0);   //  다음 퀘스트 - 안드라스에게
		}

		else
		{
			me.AddGameQuest(291002, 3*6);		// 3분 후에 배달
		}
	}


	// 291002 완료 하면
	else if (_idQuest == 291002)
	{

		me.DoStript(`addkeyword("about_Neamhain")`);

		if (IsDevelopment())
		{
			me.AddGameQuest(291003, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291003, 3*6);		// 10분 후에 배달
		}
	}


	// 291003 완료 하면
	else if (_idQuest == 291003)
	{
		me.RemoveKeyword(`g10_04`);
		me.RemoveKeyword(`g10_05`);
		me.RemoveKeyword(`g10_06`);
		me.RemoveKeyword(`g10_07`);
		me.RemoveKeyword(`g10_08`);
		me.RemoveKeyword(`g10_09`);
		me.RemoveKeyword(`honeydrink`);
		me.RemoveKeyword(`g10_cat`);
		me.RemoveKeyword(`g10_dog`);
		me.RemoveKeyword(`g10_zombie`);


		if (IsDevelopment())
		{
			me.AddGameQuest(291008, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291008, 6);		// 1분 후에 배달
		}
	}


	// 291004 한스에게 초상화 얻기
	else if (_idQuest == 291004)
	{

		me.AddKeyword(`g10_05`);   // 네반의 초상화 얻었음

	}

	// 291005 레자르의 탁본 얻기
	else if (_idQuest == 291005)
	{

		me.AddKeyword(`g10_06`);   // 레자르의 탁본 얻기

	}

	// 291006  라이미라크교 성전 얻기
	else if (_idQuest == 291006)
	{

		me.AddKeyword(`g10_07`);   // 라이미라크교 성전 얻었음

	}

	// 291007 네반의 깃털 장식 얻기
	else if (_idQuest == 291007)
	{

		me.AddKeyword(`g10_09`);   // 레자르의 탁본 얻기

	}


	// 291008 완료 하면 (엘라하 - 다크로드 만나는 키아 던전 RP)
	else if (_idQuest == 291008)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전


		me.RemoveKeyword(`g10_met_elatha`);
		if (IsDevelopment())
		{
			me.AddGameQuest(291009, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291009, 6);		// 1분 후에 배달
		}
	}


	// 291009 완료 하면 (엘라하 - 다크로드 만나는 키아 던전 RP)
	else if (_idQuest == 291009)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전


		if(me.IsHuman())   // 인간이면 알렉시나 만나는 퀘스트 준다.
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(291010, 0);   // 다음 퀘스트 준다.
			}
			else
			{
				me.AddGameQuest(291010, 6);		// 1분 후에 배달
			}
		}
		else if(me.IsElf())  // 엘프면, 카스타네아 만나는 퀘스트 준다.
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(291011, 0);   // 다음 퀘스트 준다.
			}
			else
			{
				me.AddGameQuest(291011, 6);		// 1분 후에 배달
			}
		}
		else if(me.IsGiant())
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(291012, 0);   // 다음 퀘스트 준다.
			}
			else
			{
				me.AddGameQuest(291012, 6);		// 1분 후에 배달
			}
		}
	}


	// 291010 완료 하면
	else if (_idQuest == 291010)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전


		me.RemoveKeyword(`about_Neamhain`);

		if (IsDevelopment())
		{
			me.AddGameQuest(291013, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291013, 6);		// 1분 후에 배달
		}
	}


	// 291011 완료 하면
	else if (_idQuest == 291011)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전

		if (IsDevelopment())
		{
			me.AddGameQuest(291013, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291013, 6);		// 1분 후에 배달
		}
	}

	// 291012 완료 하면
	else if (_idQuest == 291012)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전

		if (IsDevelopment())
		{
			me.AddGameQuest(291013, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291013, 6);		// 1분 후에 배달
		}
	}

	// 291013 완료 하면
	else if (_idQuest == 291013)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전

		if (IsDevelopment())
		{
			me.AddGameQuest(291014, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291014, 6);		// 1분 후에 배달
		}
	}


	// 291014 완료 하면
	else if (_idQuest == 291014)
	{

		me.RemoveItemCls(75291); // 네반의 초상화
		me.RemoveItemCls(75297); // 네반의 깃털 장식
		me.RemoveItemCls(75292); // 레자르의 탁본
		me.RemoveItemCls(75294); // 라이미라크교 성전

		if (IsDevelopment())
		{
			me.AddGameQuest(291015, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291015, 6);		// 1분 후에 배달
		}
	}


	// 291015 완료 하면
	else if (_idQuest == 291015)
	{

		if (IsDevelopment())
		{
			me.AddGameQuest(291016, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291016, 6);		// 1분 후에 배달
		}
	}


	// 291016 완료 하면
	else if (_idQuest == 291016)
	{

		if (IsDevelopment())
		{
			me.AddGameQuest(291017, 0);   // 다음 퀘스트 준다.
		}
		else
		{
			me.AddGameQuest(291017, 6);		// 1분 후에 배달
		}
	}



	// 291017 완료 하면
	else if (_idQuest == 291017)
	{
		if (IsCurrentEvent(`g10_clear_2008_korea`))
		{
			me.AddKeyword(`g10_complete_event`);
		}

		me.AddKeyword(`g10_complete`);

		if((IsEnable(`featureG10MainStream`) extern (`data/script/features.mint`)))
		{
			DebugOut(`네반 지원 모드로 변환`);
			me.SetDemiGodSupportType(1);
		}

		// 혹시나 남았을 단계 체크 키워드 다 지워주자.
		me.RemoveKeyword(`g10_01`);
		me.RemoveKeyword(`g10_02`);
		me.RemoveKeyword(`g10_03`);
		me.RemoveKeyword(`g10_04`);
		me.RemoveKeyword(`g10_05`);
		me.RemoveKeyword(`g10_06`);
		me.RemoveKeyword(`g10_07`);
		me.RemoveKeyword(`g10_08`);
		me.RemoveKeyword(`g10_09`);
		me.RemoveKeyword(`g10_10`);
		me.RemoveKeyword(`g10_11`);
		me.RemoveKeyword(`g10_12`);
		me.RemoveKeyword(`g10_13`);
		me.RemoveKeyword(`g10_14`);
		me.RemoveKeyword(`g10_15`); 
		me.RemoveKeyword(`g10_16`);
		me.RemoveKeyword(`g10_17`);
		me.RemoveKeyword(`g10_18`);
		me.RemoveKeyword(`g10_19`);
		me.RemoveKeyword(`g10_20`);
		me.RemoveKeyword(`g10_21`);
		me.RemoveKeyword(`about_Neamhain`);
		me.RemoveKeyword(`honeydrink`);

	}



}