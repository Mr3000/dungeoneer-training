//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G1 Script
//                                                            G1용 스크립트 모음집
//
//                                            marlin fecit, begins at 2004. 06. 05
//                                                            marlin22@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Test(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	// 이벤트 리전에서 나와서 원래 가려던 곳으로 가라
	me.LeaveEventRegion();

	//던전을 나가라
	me.LeaveDungeon();

	//플레이어를 옮겨라

	//기타 캐릭터 스크립트가 가능
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_0_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 0  여신의 메시지 컷신이 끝날 때.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g1`);
	me.AddKeyword(`g1_01`);

	// 미국은 유럽 하향 버전 + ap 없는 것으로 새로 시작.
	if (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`))
	{
		me.AddGameQuest(211101, 10);
	}
	//시간 줄여둔것 나중에 수정할것
	else if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
	{
		me.AddGameQuest(211001, 10);
	}
	else
	{
		me.AddGameQuest(210001, 10);
	}
	// 이제 여신의 리전에서 나와서 원래 가려던 곳으로 가라
	me.LeaveEventRegion();
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_5_c_3WarriorsRP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 5  거대거미죽이는 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.HaveKeyword(`g1_03`))
	{
		me.AddKeyword(`g1_goddess`);		//모리안 여신
		me.RemoveKeyword(`g1_tarlach1`);	//타르라크
		me.RemoveKeyword(`g1_tarlach2`);	//사라진 세 전사

		me.AddKeyword(`g1_04`);
		me.RemoveKeyword(`g1_03`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			DebugOut(`파티원 : ` + member.GetDisplayName());
			if (member.IsValid())
			{
				character orgChar = member.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
				orgChar.DoStript(`modify(exp,3000)`); //경험치 3000
				orgChar.IncreaseMoney(4000); //돈 4000
			}
		member.LeaveDungeon();
		}
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_10_a_BlackWizard(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 10  블랙위자드 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_paradise`) && me.HaveKeyword(`g1_10`))
	{
		me.AddKeyword(`g1_medal_of_fomor`);		//마족의 메달
//		me.RemoveKeyword(`g1_paradise`);	//낙원

		me.AddKeyword(`g1_11`);
		me.RemoveKeyword(`g1_10`);
	}

/*
	dungeon _dungeon = me.GetCurrentDungeon();

	if (_dungeon.IsValid())
	{

		me.AddKeyword(`skill_rest`);


		int region, x, y;
		_dungeon.GetBossRoomPos(region, x, y);	//던전 중심좌표를 받아오기

		me.Move(region, x, y-600);	//리더의 위치를 배치

		character member0, member1;

		member0 = (character)_cMemberList.GetValue(0); //구경꾼 1

		if (member0.IsValid())
		{
			me.AddKeyword(`skill_range`);
			member0.Move(region, x+200, y-900);
		}

		member1 = (character)_cMemberList.GetValue(1); //구경꾼 2

		if (member1.IsValid())
		{
			me.AddKeyword(`skill_instrument`);
			member1.Move(region, x-200, y-900);
		}
	}

	*/
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_15_c_TarlachRP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 15  크리스텔 쓰러뜨린 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_dulbrau2`) && me.HaveKeyword(`g1_15`))
	{
		me.AddKeyword(`g1_succubus`);		//크리스텔의 과거
		me.RemoveKeyword(`g1_dulbrau2`);	//둘 브라우 다이람 세넌2

		me.AddKeyword(`g1_16`);
		me.RemoveKeyword(`g1_15`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			DebugOut(`파티원 : ` + member.GetDisplayName());
			if (member.IsValid())
			{
				character orgChar = member.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
				orgChar.DoStript(`modify(exp,3000)`); //경험치 3000
				orgChar.IncreaseMoney(4000); //돈 4000

			}
		member.LeaveDungeon();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_18_c_MoresRP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 18  다크로드와 모리안을 만나는 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_memo_of_lost_thing`) && me.HaveKeyword(`g1_21`))
	{
		me.AddKeyword(`g1_goddess_morrighan1`);		//모리안 여신의 복수
		me.RemoveKeyword(`g1_memo_of_lost_thing`);	//마우러스의 분실물

		me.AddKeyword(`g1_22`);
		me.RemoveKeyword(`g1_21`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			DebugOut(`파티원 : ` + member.GetDisplayName());
			if (member.IsValid())
			{
				character orgChar = member.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
				orgChar.DoStript(`modify(exp,3000)`); //경험치 3000
				orgChar.IncreaseMoney(4000); //돈 4000

			}
		member.LeaveDungeon();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_25_d_3WarriorsRP2(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 18  다크로드와 모리안을 만나는 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.HaveKeyword(`g1_bone_of_glasgavelen`) && me.HaveKeyword(`g1_29`))
	{
		me.AddKeyword(`g1_goddess_morrighan2`);		//모리안의 배신
		me.RemoveKeyword(`g1_bone_of_glasgavelen`);	//글라스 기브넨의 뼈

		me.AddKeyword(`g1_30`);
		me.RemoveKeyword(`g1_29`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			DebugOut(`파티원 : ` + member.GetDisplayName());
			if (member.IsValid())
			{
				character orgChar = member.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
				orgChar.DoStript(`modify(exp,3000)`); //경험치 3000
				orgChar.IncreaseMoney(4000); //돈 4000

			}
		member.LeaveDungeon();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_28_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 28  모리안을 만나는 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_goddess_morrighan2`) && me.HaveKeyword(`g1_31`))
	{
		if (me.AddItem(73026))	//여신의 펜던트
		{
			me.AddKeyword(`g1_request_from_goddess`);	//여신의 부탁
			me.RemoveKeyword(`g1_goddess_morrighan2`);	//모리안의 배신

			me.AddKeyword(`g1_32`);
			me.RemoveKeyword(`g1_31`);
		}
	}

	// 이벤트리전 나가라
	me.LeaveEventRegion();

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_31_c_ShielaRP(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 31  시라 RP 마지막 컷신 종료후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_memorial4`) && me.HaveKeyword(`g1_34_1`))
	{
		me.AddKeyword(`g1_cichol`);		//키홀
		me.RemoveKeyword(`g1_memorial4`);	//부러진 토크

		me.AddKeyword(`g1_34_2`);
		me.RemoveKeyword(`g1_34_1`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			DebugOut(`파티원 : ` + member.GetDisplayName());
			if (member.IsValid())
			{
				character orgChar = member.GetOriginalCharacter();		// rp 일 경우 오리지널 캐릭터 얻어오기
				orgChar.DoStript(`modify(exp,3000)`); //경험치 3000
				orgChar.IncreaseMoney(4000); //돈 4000

			}
		member.LeaveDungeon();
		}
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_33_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 33  모리안을 만나는 컷신 종료 후
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.HaveKeyword(`g1_cichol`) && me.HaveKeyword(`g1_34`) && me.HaveKeyword(`g1_34_2`))
	{
		me.AddKeyword(`g1_tirnanog_seal_breaker`);	//다른 세계로의 씰 브레이커
		me.RemoveKeyword(`g1_cichol`);		//키홀

		me.AddKeyword(`g1_35`);
		me.RemoveKeyword(`g1_34`);
		me.RemoveKeyword(`g1_34_2`);
	}
	// 이벤트리전 나가라
	me.LeaveEventRegion();

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_38_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 38  여신구출 컷신 종료후
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.HaveKeyword(`g1_36`))
	{
		me.AddKeyword(`g1_revive_of_glasgavelen`);	//글라스 기브넨의 부활

		if(me.HaveKeyword(`g1`))
		{
			me.AddKeyword(`g1_37`);
		}
		me.RemoveKeyword(`g1_36`);
	}

	// 리더는 던전 나가라
	me.LeaveDungeon();

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
server void
    OnCutSceneEnded_G1_40_b_Chichol(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 40 다크로드를 쓰러뜨리고 난 뒤
//////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(["event.g1_event.1"]);

	// 일단 던전을 찾아서
	dungeon currentDungeon = me.GetCurrentDungeon(); 

	// 마지막 층을 꺼낸 다음
	dungeon_floor currentFloor = 
	// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
	currentDungeon.GetFloor(currentDungeon.GetFloorNo() - 1);

	// 연결된 보스 퍼즐을 찾고
	puzzle bossPuzzle = currentFloor.GetBossPuzzle();

	// 글라스 기브넨을 스폰한다
	if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)))
	{
		SpawnGlasGavelen(bossPuzzle)
		extern (`data/script/puzzle/rp_boss/G1_39_Tirnanog_dungeon_boss_EU.mint`);
	}
	else
	{
		SpawnGlasGavelen(bossPuzzle)
		extern (`data/script/puzzle/rp_boss/G1_39_Tirnanog_dungeon_boss.mint`);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_G1_41_b_Glas(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : G1 챕터 41  글라스 기브넨 사망후. 최종엔딩
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon currentDungeon = me.GetCurrentDungeon();
	object_list cMemberList = currentDungeon.GetCreatorList();

	me.RemoveKeyword(`g1_ending_cutscene`);	//이 키워드가 남아있다면, 엔딩컷신을 다 본게 아니다.

	me.Move(`Uladh_main/town_TirChonaill/TirChonaill_Spawn_A`);

	int			i;
	character		member;

	//나머지 구경꾼들도 던전 나가라
	for (i = 0; i < cMemberList.GetSize();  i++)
	{
		member = (character)cMemberList.GetValue(i);
		member.Move(`Uladh_main/town_TirChonaill/TirChonaill_Spawn_A`);
	}
}
