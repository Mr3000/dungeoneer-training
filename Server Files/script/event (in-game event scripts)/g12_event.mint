
//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G12 Script
//////////////////////////////////////////////////////////// component of Mabinogi



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G12_Opening(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//G11 메인스토리 시작
	me.AddKeyword(`g12`);

	if (IsDevelopment())
	{
		me.AddGameQuest(293001, 0);
	}
	else
	{
		me.AddGameQuest(293001, 9);		//  90초후, 컷신과 안 겹치게.
	}


}






//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G12_helvetius(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{


	me.Move(74, 2932, 2453);  // 페카 제단 앞

}




//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G12_Eabha_Dream_01(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{


	if (IsDevelopment())
	{
		me.AddGameQuest(293012, 0);

		if (me.GetItemNoWithClassId (75436) < 1)		//  성수 없을 때만 다시 주기로 해요.
		{

			me.DoStript(`additemex(id:75436 rewardview:true)`); // 팔리아스의 성수

		}

		if(me.FindShadowMission() == 0)
		{
			me.AddShadowMission(793011, true);

		}


	}
	else
	{
		me.AddGameQuest(293012, 0);		//  90초후, 컷신과 안 겹치게.

		if (me.GetItemNoWithClassId (75436) < 1)		//  성수 없을 때만 다시 주기로 해요.
		{

			me.DoStript(`additemex(id:75436 rewardview:true)`); // 팔리아스의 성수

		}


		if(me.FindShadowMission() == 0)
		{
			me.AddShadowMission(793011, true);

		}



	}

}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G12_Eabha_Dream_02(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{


	if (IsDevelopment())
	{
		me.AddGameQuest(293013, 0);
		me.AddKeyword(`g12_15`);

		if (me.GetItemNoWithClassId (75451) < 1)		//  조각 없을 때만 다시 주기로 해요.
		{

			me.DoStript(`additemex(id:75451 rewardview:true)`); // 팔리아스의 조각

		}


		if(me.FindShadowMission() == 0)
		{
			me.AddShadowMission(793012, true);

		}


	}
	else
	{
		me.AddGameQuest(293013, 0);		//  90초후, 컷신과 안 겹치게.
		me.AddKeyword(`g12_15`);

		if (me.GetItemNoWithClassId (75451) < 1)		//  조각 없을 때만 다시 주기로 해요.
		{

			me.DoStript(`additemex(id:75451 rewardview:true)`); // 팔리아스의 조각

		}

		if(me.FindShadowMission() == 0)
		{
			me.AddShadowMission(793012, true);

		}


	}

}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_G12_Eabha_Dream_03(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////

{


	if (IsDevelopment())
	{
		me.AddGameQuest(293014, 0);

	}
	else
	{
		me.AddGameQuest(293014, 9);		//  90초후, 컷신과 안 겹치게.

	}

}





//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_4_1_neamhain_snare(
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
server void OnCutSceneEnded_4_2_neamhain_snare(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	// 키워드, 아이템 소거 작업
	me.AddKeyword(`g12_08`);
	me.RemoveKeyword(`g12_07`);
	me.RemoveItemCls(75437); //  바이브 카흐의 수호부 (2) 삭제

	//me.Move(401, 81456, 125565);

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
//		cChar.Move(401, 81456, 125565);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_5_2_helvetius_Death(
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
		cChar.Move(300, 176751, 224288);
	}


}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutScene_preview(
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
		cChar.Move(300, 176751, 224288);
	}


}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_11_restore_brionac(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
		me.RemoveItemCls(75439);

		if(me.GetItemNoWithClassId(75440) == 0)
		{
			me.DoStript(`additemex(id:75440 rewardview:true)`); //
		}

/*
	party _party = me.GetParty();
	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 던전 생성자면.. (IsPartyLeader 안 쓰는 이유는, 파장 나가면 왕정연금이 파장되니까)
	{
		// 모리안의 깃털 (1) 제거하고 2 공급

	}
*/
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_12_1_fight_nuadha(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 파티가 아니어서 나중에 왕정 연금술사 넣을때는 따로 체크하게 해야 한다.
	// 모리안의 깃털 구버전 삭제하고 신버전 있으면 준다.
	me.RemoveItemCls(75439);

	if(me.GetItemNoWithClassId(75440) == 0)
	{
		me.DoStript(`additemex(id:75440 rewardview:false)`); //
	}

	// 광장에서 누아자가 있는 곳으로 이동
	me.Move(me.GetRegionId(), 5760, 54080);

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

	/*
	party _party = me.GetParty();
	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 던전 생성자면.. (IsPartyLeader 안 쓰는 이유는, 파장 나가면 왕정연금이 파장되니까)
	{
		// 모리안의 깃털 없으면 준다.
		if(me.GetItemNoWithClassId(75440) == 0)
		{
			me.DoStript(`additemex(id:75440 rewardview:false)`); //
		}

		// 광장에서 누아자가 있는 곳으로 이동
		me.Move(me.GetRegionId(), 5760, 54080);

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

	//  던전 생성자 말고도 모리안의 깃털 있으면 일단 제거
	object_list cCharList = _cMemberList;
	character	cChar;
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		if(!cChar.IsDungeon2Creator())
		{
			cChar.RemoveItemCls(75440); //  모리안의 깃털
		}

		// 누아자 앞으로 이동 x:4731 y:54868
		cChar.Move(cChar.GetRegionId(), 4731, 54868);
	}
	*/
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_12_ex_morrighan_feather(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
//	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 미션 생성자면
		me.RemoveItemCls(75440); //  모리안의 깃털 삭제해준다.

		// 기존의 반신화 꺼준다.
		if(me.IsSkillTurnedOn(45001))
		{
			me.SkillTurnOff(45001);
		}

		// 이클립스, 레이지 습득, 수련치 습득
		dungeon2 _dungeon = me.FindDungeon2();
		int iMissionLevel = _dungeon.GetMissionLevel();

		switch(iMissionLevel)
		{
			case(0)
			{
				me.AddSkill(45008, 1);
				me.AddSkill(45009, 1);
			}
			case(1)
			{
				me.AddSkill(45008, 4);
				me.AddSkill(45009, 4);
			}
			case(2)
			{
				me.AddSkill(45008, 7);
				me.AddSkill(45009, 7);
			}
			case(3)
			{
				me.AddSkill(45008, 10);
				me.AddSkill(45009, 10);
			}
			default
			{
				me.AddSkill(45008, 10);
				me.AddSkill(45009, 10);
			}
		}

		// 수련치 습득
		me.ModifySkillExpPoint(45008, 12000);
		me.ModifySkillExpPoint(45009, 12000);

		// 모리안 모드로 변환
		me.SetDemiGodSupportType(2);

		// 반신화, 이클립스 발동
		me.SkillTurnOn(45001);
		me.SkillTurnOn(45008);

		me.Move(me.GetRegionId(), 5760, 54080);

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
server void OnCutSceneEnded_12_2_hold_nuadha(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();

//	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
		me.Move(me.GetRegionId(), 5760, 54080);

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



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_12_3_sealing_nuadha(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
//	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			// 컷신 끝나고 나면 다시 광장으로 이동
			// x:12855 y:40339
			me.Move(me.GetRegionId(), 12855, 40339);
			me.SetDirection(-1.626);

			dungeon2puzzle _puzzle;
			_dungeon.GetData(`activator4`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
			}
		}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_12_4_sealing_nuadha2(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	party _party = me.GetParty();
//	if (me.IsDungeon2Creator() || !_party.IsValid())		// 혼자 왔거나, 파티리더면
		// 컷신 도중에 튕기는 경우도 있으니 컷신 시작할 때 키워드 준다.
		/*
		me.AddKeyword(`g12_20`);
		me.RemoveKeyword(`g12_19`);
		*/

		dungeon2 _dungeon = me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			dungeon2puzzle _puzzle;
			_dungeon.GetData(`pLastPuzzle`, _puzzle);
			if (!_puzzle.IsNull())
			{
				_puzzle.Complete();
				_dungeon.Complete();
				// me.Move(me.GetRegionId(), 5760, 54080);
				me.MoveToLastDungeon();		// 팔리아스 포탈에 들어왔던 위치로 보내준다.
			}
		}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnG12MainQuestClear(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////

{

	if (_idQuest == 293001)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293002, 0);
		}
		else
		{
			me.AddGameQuest(293002, 18);		// 1분 후에 배달
		}
	}

	else if (_idQuest == 293002)
	{



		me.AddKeyword(`g12_lennox`);

		if (IsDevelopment())
		{
			me.AddGameQuest(293003, 0);
		}
		else
		{
			me.AddGameQuest(293003, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293003)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293004, 0);
		}
		else
		{
			me.AddGameQuest(293004, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293004)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293005, 0);
		}
		else
		{
			me.AddGameQuest(293005, 3*6);		// 1분 후에 배달
		}
	}

	else if (_idQuest == 293005)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293006, 0);

			// 누아자 만날 수 있는 그림자 미션 준다.
			if(me.FindShadowMission() == 0)
			{
				me.AddShadowMission(793006, true);

			}

			// 누아자의 수호부 준다.
			me.DoStript(`additemex(id:75435 rewardview:true)`);


		}
		else
		{
			me.AddGameQuest(293006, 0);

			// 누아자 만날 수 있는 그림자 미션 준다.
			if(me.FindShadowMission() == 0)
			{
				me.AddShadowMission(793006, true);

			}
			// 누아자의 수호부 준다.
			me.DoStript(`additemex(id:75435 rewardview:true)`);


		}
	}

	else if (_idQuest == 293006)
	{



		me.RemoveItemCls(75435); //  누아자의 수호부 삭제 해준다.


		if (IsDevelopment())
		{
			me.AddGameQuest(293007, 0);
		}
		else
		{
			me.AddGameQuest(293007, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293007)
	{


		me.RemoveKeyword(`g12_lileas`);
		me.RemoveKeyword(`g12_lileas_set`);
		me.RemoveKeyword(`g12_lileas_money`);



		me.RemoveKeyword(`g12_lileas_padan`);
		me.RemoveKeyword(`g12_lileas_keith`);
		me.RemoveKeyword(`g12_lileas_colm`);
		me.RemoveKeyword(`g12_lileas_lezard`);


		if (IsDevelopment())
		{
			me.AddGameQuest(293008, 0);
		}
		else
		{
			me.AddGameQuest(293008, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293008)
	{


		me.RemoveItemCls(75437); //  바이브 카흐의 수호부 (2) 삭제


		if (IsDevelopment())
		{
			me.AddGameQuest(293009, 0);
		}
		else
		{
			me.AddGameQuest(293009, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293009)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293010, 0);
		}
		else
		{
			me.AddGameQuest(293010, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293010)
	{


		me.RemoveItemCls(75438); //  바이브 카흐의 수호부 (3) 삭제

		if (IsDevelopment())
		{
			me.AddGameQuest(293011, 0);
		}
		else
		{
			me.AddGameQuest(293011, 3*6);		// 1분 후에 배달
		}
	}



	else if (_idQuest == 293011)
	{

		me.RemoveKeyword(`g12_lennox`); // 여기에서부턴 레녹스 안 보여요.


	}


	else if (_idQuest == 293012)
	{
		if (IsDevelopment())
		{
			me.RemoveItemCls(75436);
		}
		else
		{
			me.RemoveItemCls(75436); //  혹시나 성수 남아있으면 여기에서 다 지워줘요.
		}
	}


	// 이것도 서버 시퀀스에서 줍니다.
	else if (_idQuest == 293013)
	{

		me.RemoveKeyword(`g12_eabha`); //
	}



	else if (_idQuest == 293014)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293015, 0);
			me.AddGameQuest(293016, 0);
		}
		else
		{
			me.AddGameQuest(293015, 3*6);		// 1분 후에 배달
			me.AddGameQuest(293016, 3*6);		// 1분 후에 배달
		}
	}

	// 이거 클리어하면 293024 퀘스트 줍니다.
	else if (_idQuest == 293015)
	{

		me.RemoveKeyword(`g12_treasure01`);
		me.RemoveKeyword(`g12_treasure02`);
		me.RemoveKeyword(`g12_treasure03`);
		me.RemoveKeyword(`g12_treasure04`);
		me.RemoveKeyword(`g12_treasure05`);
		me.RemoveKeyword(`g12_treasure06`);
		me.RemoveKeyword(`g12_treasure07`);
		me.RemoveKeyword(`g12_treasure08`);

		me.AddKeyword(`g12_treasure_complete`);

		if (IsDevelopment())
		{
			me.AddGameQuest(293024, 0);
		}
		else
		{
			me.AddGameQuest(293024, 3*6);		// 1분 후에 배달
		}
	}


	else if (_idQuest == 293016)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293017, 0);
		}
		else
		{
			me.AddGameQuest(293017, 3*6);		// 1분 후에 배달
		}
	}



	else if (_idQuest == 293017)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293018, 0);
		}
		else
		{
			me.AddGameQuest(293018, 3*6);		// 1분 후에 배달
		}
	}

	else if (_idQuest == 293018)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293019, 0);
		}
		else
		{
			me.AddGameQuest(293019, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293019)
	{

		me.RemoveItemCls(75441); //  팔리아스의 미끼

		if (IsDevelopment())
		{

			me.AddGameQuest(293020, 0);
		}
		else
		{

			me.AddGameQuest(293020, 3*6);		// 1분 후에 배달
		}
	}



	else if (_idQuest == 293020)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293021, 0);
		}
		else
		{
			me.AddGameQuest(293021, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293021)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293022, 0);
		}
		else
		{
			me.AddGameQuest(293022, 3*6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 293022)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(293023, 0);
		}
		else
		{
			me.AddGameQuest(293023, 3*6);		// 1분 후에 배달
		}
	}


	// 2903023 퀘스트 완료한 뒤에는 퀘스트 주는 거 없당~


	else if (_idQuest == 293024)
	{
		// 최종장에 가는 팔리아스 포탈을 열기 위해 지우지 않는다. g12_complete 얻을 때 지운다.
		// me.RemoveKeyword(`g12_treasure_complete`);

		if (IsDevelopment())
		{
			me.AddGameQuest(293025, 0);
			me.DoStript(`additemex(id:75451 rewardview:true)`); // 팔리아스의 조각

			if(me.FindShadowMission() == 0)
			{
				me.AddShadowMission(793014, true);

			}

		}

		else
		{
			me.AddGameQuest(293025, 0);		// 1분 후에 배달
			me.DoStript(`additemex(id:75451 rewardview:true)`); // 팔리아스의 조각

			if(me.FindShadowMission() == 0)
			{
				me.AddShadowMission(793014, true);

			}


		}
	}



	// G12 메인스트림 엔딩
	else if (_idQuest == 293025)
	{

		if (IsCurrentEvent(`g12update2009_korea`))
		{
			me.AddKeyword(`g12_event`);
		}

		me.AddKeyword(`g12_complete`);
		me.AddKeyword(`treasure_slot1`);

		me.RemoveItemCls(75420); //  바이브 카흐의 수호부 (1)
		me.RemoveItemCls(75421); //  기사단의 문장
		me.RemoveItemCls(75422); //  모이투라 전쟁사
		me.RemoveItemCls(75423); //  아르의 은신처 통행증
		me.RemoveItemCls(75424); //  비밀 지부 통행증
		me.RemoveItemCls(75425); //  기사단의 문장 재료
		me.RemoveItemCls(75426); //  신들의 보물 컬렉션북
		me.RemoveItemCls(75427); //  마법의 곤봉
		me.RemoveItemCls(75428); //  파리니스
		me.RemoveItemCls(75429); //  마법의 흉갑
		me.RemoveItemCls(75430); //  황금 사과
		me.RemoveItemCls(75431); //  수면의 지팡이
		me.RemoveItemCls(75432); //  와드네
		me.RemoveItemCls(75433); //  진실의 컵
		me.RemoveItemCls(75434); //  파도의 진정
		me.RemoveItemCls(75435); //  누아자의 수호부
		me.RemoveItemCls(75436); //  팔리아스의 성수
		me.RemoveItemCls(75437); //  바이브 카흐의 수호부 (2)
		me.RemoveItemCls(75438); //  바이브 카흐의 수호부 (3)
		me.RemoveItemCls(75439); //  모리안의 깃털 (1)
		me.RemoveItemCls(75440); //  모리안의 깃털 (2)
		me.RemoveItemCls(75441); //  팔리아스의 미끼
		me.RemoveItemCls(75442); //  리리스의 기부금
		me.RemoveItemCls(75443); //  헬베티우스의 친서
		me.RemoveItemCls(75451); //  팔리아스의 조각



		me.RemoveKeyword(`g12`);
		me.RemoveKeyword(`g12_01`);
		me.RemoveKeyword(`g12_02`);
		me.RemoveKeyword(`g12_03`);
		me.RemoveKeyword(`g12_04`);
		me.RemoveKeyword(`g12_05`);
		me.RemoveKeyword(`g12_06`);
		me.RemoveKeyword(`g12_07`);
		me.RemoveKeyword(`g12_08`);
		me.RemoveKeyword(`g12_09`);
		me.RemoveKeyword(`g12_09_1`);   // 제너에게 와펜을 받음
		me.RemoveKeyword(`g12_09_2`);   // 고해소에 들어갈 수 있게 해주는 키워드, 이후에는 g12_complete를 사용
		me.RemoveKeyword(`g12_10`);
		me.RemoveKeyword(`g12_11`);
		me.RemoveKeyword(`g12_12`);
		me.RemoveKeyword(`g12_13`);
		me.RemoveKeyword(`g12_14`);
		me.RemoveKeyword(`g12_15`);
		me.RemoveKeyword(`g12_16`);
		me.RemoveKeyword(`g12_17`);
		me.RemoveKeyword(`g12_18`);
		me.RemoveKeyword(`g12_19`);
		me.RemoveKeyword(`g12_20`);
		me.RemoveKeyword(`g12_treasure01`);
		me.RemoveKeyword(`g12_treasure02`);
		me.RemoveKeyword(`g12_treasure03`);
		me.RemoveKeyword(`g12_treasure04`);
		me.RemoveKeyword(`g12_treasure05`);
		me.RemoveKeyword(`g12_treasure06`);
		me.RemoveKeyword(`g12_treasure07`);
		me.RemoveKeyword(`g12_treasure08`);
		me.RemoveKeyword(`g12_treasure_complete`);
		me.RemoveKeyword(`g12_lileas`);
		me.RemoveKeyword(`g12_lileas_money`);
		me.RemoveKeyword(`g12_lileas_set`);
		me.RemoveKeyword(`g12_eabha`);
		me.RemoveKeyword(`g12_eabha_2`);

		me.RemoveKeyword(`g12_morrighan_rp_clear`);
		me.RemoveKeyword(`g12_aer`);
		me.RemoveKeyword(`g12_lennox`);
		me.RemoveKeyword(`g12_final_spark`);

		me.RemoveKeyword(`g12_lileas_padan`);
		me.RemoveKeyword(`g12_lileas_keith`);
		me.RemoveKeyword(`g12_lileas_colm`);
		me.RemoveKeyword(`g12_lileas_lezard`);


	}
}
