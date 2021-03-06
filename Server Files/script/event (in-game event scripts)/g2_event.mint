//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G1 Script
//                                                            G2용 스크립트 모음집
//
//                                                  capella begins at 2004. 11. 17
//                                                            capella@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_01_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//G2 메인스토리 시작
	DebugOut(["event.g2_event.1"]);
	me.AddKeyword(`g2`);	
	
	if(me.IsQuestTried(220050))
	{
		G2_Reset_After_G2_23(me);
	}
	//키워드 꼬이는 문제 긴급 수정을 위해 g2_02을 아예 빼버립니다. qwerty.
	//me.AddKeyword(`g2_02`);

	// 이제 여신의 리전에서 나와서 원래 가려던 곳으로 가라
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))
	{
		me.AddGameQuest(222001, 10);
	}
	me.LeaveEventRegion();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_05_a_Ruairi(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 팔라딘 수업 두번째 완료 후 루에리 컷신. 리뉴얼 후에는 이게 첫번째 수업이 된다.
	me.AddKeyword(`g2_06`);		
	me.RemoveKeyword(`g2_05`);

	// 리뉴얼 버전에서는 완료하면 바로 이멘마하로 다시 보내준다.
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))	
	{
		me.Move(52,24390,59070); // 팔라딘 수련장 근처로 이동
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_06_a_Triona(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 팔라딘 수업 세번째 완료 후 트리아나 컷신. 리뉴얼 후에는 이게 두번째 수업이 된다.
	me.AddKeyword(`g2_07`);		
	me.RemoveKeyword(`g2_06`);

	// 리뉴얼 버전에서는 완료하면 바로 이멘마하로 다시 보내준다.
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))	
	{
		me.Move(52,24390,59070); // 팔라딘 수련장 근처로 이동
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_07_a_Darkload(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 팔라딘 수업 다섯번째 완료 후 다크로드 컷신. 리뉴얼 후에는 이게 세번째 수업이 된다.
	me.AddKeyword(`g2_08`);		
	me.RemoveKeyword(`g2_07`);

	// 리뉴얼 버전에서는 완료하면 바로 이멘마하로 다시 보내준다.
	if (IsEnable(`featureG2MainStreamEasy`) extern (`data/script/features.mint`))	
	{
		me.Move(52,24390,59070); // 팔라딘 수련장 근처로 이동
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_08_b_Paladin_exercises(
	character me,					// 컷신을 본 나.
	object_list _cMemberList,
	meta_map cutscene_param
	)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["event.g2_event.2"]);
	TraineeAlloc(me, _cMemberList, cutscene_param)
	extern (`data/script/puzzle/RP_element/G2_08_Triona.mint`);
	//팔라딘수련생들을 생성해라
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_08_c_Paladin_exercises(
	character me,					// 컷신을 본 나.
	object_list _cMemberList,
	meta_map cutscene_param
	)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["event.g2_event.3"]);
	RuariAlloc(me,_cMemberList,cutscene_param)
	extern (`data/script/puzzle/RP_element/G2_08_Triona.mint`);
	//루에리를 생성해라
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_08_d_Paladin_exercises(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.AddKeyword(`g2_09`);		
	me.RemoveKeyword(`g2_08`);
	me.Move(52,24390,59070); // 팔라딘 수련장 근처로 이동

}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_09_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.AddKeyword(`g2_10`);		
	me.RemoveKeyword(`g2_05`);
	me.RemoveKeyword(`g2_06`);
	me.RemoveKeyword(`g2_07`);
	me.RemoveKeyword(`g2_08`);
	me.RemoveKeyword(`g2_09`);
	me.AddKeyword(`g2_10_KnightOfTheLight_Lough`);
	// 이제 여신의 리전에서 나와서 원래 가려던 곳으로 가라
	me.LeaveEventRegion();

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_10_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.AddKeyword(`g2_11a`);		

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_11_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.AddKeyword(`g2_12`);		
	me.RemoveKeyword(`g2_11`);
	me.RemoveKeyword(`g2_11a`);
	me.AddKeyword(`g2_12_LoughGhost`);
	me.RemoveKeyword(`g2_10_Ridire`);
	me.LeaveDungeon();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_18_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g2_19`);		
	me.RemoveKeyword(`g2_18`);
	me.AddKeyword(`g2_19_MeaningOfPaladin`);
	me.RemoveKeyword(`g2_16_GoodDeedEnd`);
	me.LeaveDungeon();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_20_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{

	me.AddKeyword(`g2_21`);		
	me.RemoveKeyword(`g2_20`);
	me.AddKeyword(`g2_21_Spirit`);
	// 이제 여신의 리전에서 나와서 원래 가려던 곳으로 가라
	me.LeaveEventRegion();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_28_c(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if(!me.HaveKeyword(`g2_jump`))
	{
		me.AddKeyword(`g2_29`);		
		me.RemoveKeyword(`g2_27_MythrilArmor`);
		me.RemoveKeyword(`g2_28`);
		me.AddKeyword(`g2_29_SpiritOfPaladin`);
		me.KnowSkill(40001);
		me.LeaveDungeon();
	}
	else	
	{
		me.LeaveDungeon();
//		me.Move(`Uladh_TirCho_ChiefHouse/_Uladh_TirCho_ChiefHouse/Indoor_ChiefHouse_EB`);
	}

}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_36_a(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.GetItemNoWithClassId (74002) == 0)
	{
		if (me.AddItem(74002))
		{
			me.AddKeyword(`g2_37`);		
			me.RemoveKeyword(`g2_36`);
			me.RemoveKeyword(`g2_36_PurposeOfEsras`);
			me.Move (32,3200,2520);
			me.SetDirection(-1.415);
		}
		else
		{
			me.AddKeyword(`g2_37`);		
			me.RemoveKeyword(`g2_36`);
			me.RemoveKeyword(`g2_36_PurposeOfEsras`);
		}
	}
	else
	{
		me.AddKeyword(`g2_37`);		
		me.RemoveKeyword(`g2_36`);
		me.RemoveKeyword(`g2_36_PurposeOfEsras`);
		me.Move (32,3200,2520);
		me.SetDirection(-1.415);
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_37_b(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["event.g2_event.4"]);
	RedireAlloc(me,_cMemberList)
	extern (`data/script/puzzle/RP_boss/G2_37_Bangor_Bari.mint`);
	//리다이어를 생성해라
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_37_c(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["event.g2_event.5"]);
	me.ForgetSkill(40001);
	me.AddSkill(40001,1);
	me.ResetTransformTime();
	me.TransformToPaladin();
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_37_d(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.ReturnTransform();
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G2_37_e(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	//me.AddKeyword(`g2_complete`);
	//me.RemoveKeyword(`g2_37`);
	//me.RemoveKeyword(`g2`);
	//me.AddSkill(40002,1);
	//me.AddSkill(40003,1);
	//me.AddSkill(40004,1);
	//이멘 마하 대성당 근처로 이동
	me.Move(52,40800,32800);
}
//////////////////////////////////////////////////////////////////////////////////
server void G2_Reset_After_G2_23(
	character me)
//////////////////////////////////////////////////////////////////////////////////
{
	me.ShowCaption(["event.g2_event.6"]);

	//220041부터 얻은 것을 다 지우자.
	me.CleanQuestHistory(220041);
	me.CleanQuestHistory(220042);
	me.CleanQuestHistory(220043);
	me.CleanQuestHistory(220044);
	me.CleanQuestHistory(220045);
	me.CleanQuestHistory(220046);
	me.CleanQuestHistory(220047);
	me.CleanQuestHistory(220050);
	me.CleanQuestHistory(220051);
	me.CleanQuestHistory(220052);
	me.CleanQuestHistory(220053);

	me.RemoveKeyword(`g2_24`);
	me.RemoveKeyword(`g2_24_1`);
	me.RemoveKeyword(`g2_24_2`);
	me.RemoveKeyword(`g2_24_3`);
	me.RemoveKeyword(`g2_24_4`);
	me.RemoveKeyword(`g2_24_5`);
	me.RemoveKeyword(`g2_24_6`);
	me.RemoveKeyword(`g2_24_fin`);
	me.RemoveKeyword(`g2_25`);
	me.RemoveKeyword(`g2_26`);
	me.RemoveKeyword(`g2_27`);
	me.RemoveKeyword(`g2_27_MythrilArmor`);
	me.RemoveKeyword(`g2_28`);
	me.RemoveKeyword(`g2_29`);
	me.RemoveKeyword(`g2_30`);
	me.RemoveKeyword(`g2_31`);
	me.RemoveKeyword(`g2_32`);
	me.RemoveKeyword(`g2_33`);
	me.RemoveKeyword(`g2_34`);
	me.RemoveKeyword(`g2_35`);
	me.RemoveKeyword(`g2_36`);
	me.RemoveKeyword(`g2_37`);
	me.RemoveKeyword(`g2_29_SpiritOfPaladin`);
	me.RemoveKeyword(`g2_36_PurposeOfEsras`);
	me.RemoveKeyword(`g2_complete`);

	me.ForgetSkill(40001);
}