//////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project G3 Script
//									G8용 스크립트 모음집
//
//									Orcen begins at 2007. 12. 4
//									orcen@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void Volcano_Enter(
	character _me,
	object _object,
	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
	if (!(_me.HaveKeyword(`entrance_zardine`)))
	{
		_me.PlayCutScene(`entrance_zardine`, 0);
	}
//	_me.Move(22,6457,7167);
}


//////////////////////////////////////////////////////////////////////////////////
server void enter_lavafall(
	character _me,
	object _object,
	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
	if(_me.GetCompletedQuestObjectiveCount(280207)==1
		&& _me.GetItemNoWithClassId (63158)>=1)	// 280207을 1단계 통과하고 눈꽃결정을 갖고 있다면.
	{
		_me.RemoveItemCls(63158, 1);
		_me.PlayCutScene(`meet_Ruari`);
	}
	else
	{
		_me.ShowCaption(["event.g8_event.1"]);
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g8s1_ending(
	character _me,
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
		_me.AddKeyword(`g8s1_complete`);

		_me.RemoveKeyword(`g8s1_kill_red`);
		_me.RemoveKeyword(`Elf_oblivion`);
		_me.RemoveKeyword(`Give_Ruway_Large_Fish`);
		_me.RemoveKeyword(`courcle_heart`);
		_me.RemoveKeyword(`g7s4`);
		_me.RemoveKeyword(`g8s1`);
		_me.RemoveKeyword(`Red_Dragon`);
		_me.RemoveKeyword(`g8s1_taunes_keep`);
		_me.RemoveKeyword(`g8s1_03_02`);
		_me.RemoveKeyword(`g8s1_airballoon_event`);
}





//////////////////////////////////////////////////////////////////////////////////
server void Zardine_Enter(
	character _me,
	object _object,
	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 801)
	{
		if (!(_me.HaveKeyword(`entrance_zardine`)))
		{
			_me.AddKeyword(`entrance_zardine`);
			_me.PlayCutScene(`entrance_zardine`, 0);
		}
		else
		{
			_me.Move(3400,315132,136532);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_entrance_Zardine(
	character _me,
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//	object _object,
//	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
		_me.Move(3400,315132,136532);
}




/////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_meet_Ruari(
	character _me,
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//	object _object,
//	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
	_me.AddKeyword(`g8s1_06_02_help_ruari`);
}


//////////////////////////////////////////////////////////////////////////////////
server void DragonLair_Enter(
	character _me,
	object _object,
	string& _sMsg)
//////////////////////////////////////////////////////////////////////////////////
{
	if (
		_me.IsMainStreamPlayablePlayer(8) &&
		_me.HaveKeyword(`g8s1_08`) &&
		!(_me.HaveKeyword(`g8s1_complete`))
	)
	{
		_me.Move(22,6557,7167);
		_me.PlayCutScene(`g8s1_GoldDragon2`, 0);
	}
	else
	{
		_me.Move(22,6457,7267);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g8s1_cruaich(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g8s1`);
	me.AddKeyword(`g8s1_01`);

//	히스토리를 위해서 지우면 안 되는데, 지우고 있었습니다. 지우지 않도록 수정합니다. 09.4.21 (nade)
//	me.RemoveKeyword(`g7s4_Complete`);
	me.RemoveKeyword(`secret_memorial_tower`);
	if (
		me.IsGiant() ||
		(me.IsHuman() && me.GetSupportRace() != 1)
	)
	{
		if(IsDevelopment())
		{
			me.AddGameQuest(280201,0);
		}
		else
		{
			me.AddGameQuest(280201,12);
		}
	}
	else
	{
		if(IsDevelopment())
		{
			if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
			{
				me.AddGameQuest(280210,0);
			}
			else
			{
				me.AddGameQuest(280202,0);
			}
		}
		else
		{
			if (IsEnable(`featureG8RedWing`) extern (`data/script/features.mint`))
			{
				me.AddGameQuest(280210,12);
			}
			else
			{
				me.AddGameQuest(280202,12);
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g7_summary(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
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

		me.AddKeyword(`g7s4_Complete`);
		me.AddKeyword(`g7_skip`);

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

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G8s1_Atrata(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)			// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
//		me.DoStript(`additemex(id:73118 rewardview:true)`);
}

//////////////////////////////////////////////////////////////////////////////////
//server void OnCutSceneEnded_G8s1_Effies_Brother(
//	character me,					// 컷신을 본 나.
//	object_list _cMemberList)			// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
//{
//		me.DoStript(`additemex(id:73119 rewardview:true)`);
//}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g8s1_to_dragon_lair(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(3400,238752,256412);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g8s1_GoldDragon2(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.IsRenesRegionMaker())
	{
		me.AllocMonster(`mon_Iria_1530`, `group(1530)`, true);
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g8s1_kill_red_dragon(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
//	if (me.HaveKeyword(`g8s1_08`) && !me.HaveQuestTemplate(280209))
//	{
//		if(IsDevelopment())
//		{
//			me.AddGameQuest(280209, 0);
//		}
//		else
//		{
//			me.AddGameQuest(280209, 180);
//		}
//	}
	me.Move(3400,337263,165289);
}





//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Effie_Brother_RP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// 에피 동생의 RP 보스룸 컷신 종료시
//////////////////////////////////////////////////////////////////////////////////
{

	if(me.HaveKeyword(`g8s1_02_03`))
	{
		me.RemoveKeyword(`g8s1_02_03`);
		me.AddKeyword(`g8s1_03`);
	}

	me.LeaveDungeon();
	//나머지 구경꾼들도 던전 나가라 
	int			i;
	character		member;
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		member.LeaveDungeon();
	}
	
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_surveying_volcanism(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// 에피 동생의 RP 보스룸 컷신 종료시
//////////////////////////////////////////////////////////////////////////////////
{
	if(me.HaveKeyword(`g8s1_04`))
	{
		me.RemoveKeyword(`g8s1_04`);
		me.RemoveKeyword(`special_craft`);
		me.AddKeyword(`g8s1_05`);
		me.AddKeyword(`Red_Dragon`);
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_kill_Cruaich(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// 크루아흐 죽인 이후.
//////////////////////////////////////////////////////////////////////////////////
{
	if(me.HaveKeyword(`special_craft2`))
	{
		me.RemoveKeyword(`g8s1_05`);
		me.RemoveKeyword(`special_craft2`);
		me.AddKeyword(`g8s1_06`);
		if(IsDevelopment())
		{
			me.AddGameQuest(280207,0);  // 개발서버 즉시
		}
		else
		{
			me.AddGameQuest(280207,60);  //일단 1시간 후로
		}
	}
}