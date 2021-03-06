
//////////////////////////////////////////////////////////////////////////////////
//                                        Mabinogi Project Portal Condition Script
//                                                       포탈 이동시 필요한 조건들
//
//                                            jonggn fecit, begins at 2004. 06. 05
//                                                              jonggn@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi
/*
	이곳에 불값을 돌려주는 스크립트 함수를 추가하고
	월드 쪽 포탈 이벤트를 Ask ServerScript로 설정, 이 함수의 경로를 적어주면
	이 함수의 리턴값에 따라 이동을 확정해 준다.

	그냥 Server Script 는 서버의 스크립트를 불러 줄 뿐이다.
	불린 스크립트에서 이동을 시켜주지 않으면 아무 일도 일어나지 않는다.(진짜일까?)
*/

//////////////////////////////////////////////////////////////////////////////////
server bool Tara_ShadowMission_Pass_Check(
	character _me,
	object _object,
	string& _sMsg)
// : 타라 스톤헨지 그림자 미션 통행증 체크
// : return true: 그림자 미션에 들어간다.
// : return false: 그림자 미션에 들어가지 못한다.
//////////////////////////////////////////////////////////////////////////////////
{
	// 테스트 진행을 위해 devcat 타이틀을 달고 있으면 통행증 체크를 안 하도록 한다.
	if (_me.GetTitle() == 60001)
	{
		return true;
	}

	// DebugOut(`[타라 스톤헨지] 통행증 체크 테스트`);
	int missionID = _me.FindShadowMission();

	if (!missionID == 0)
	{
		// DebugOut(`[타라 스톤헨지] 미션을 가지고 있다. (`+ToString(missionID)+`)`);

		if(missionID == 701014				// 파르홀론의 수호신
			|| missionID == 701015		// 그림자 세계의 레드 드래곤
			|| missionID == 701016		// 지하 수로의 비밀 실험
			)
		{
			// 입장 가능 여부 체크
			party _party = _me.GetParty();
			dword PlayerCnt = _party.GetMemberNo();
			object_list	cCharList = _party.GetMemberList();
			character cChar;
			int minLevel = 0;
			int missionLevel = _me.GetShadowMissionLevel();

			switch(missionLevel)
			{
				case(0) { minLevel = 0; }
				case(1) { minLevel = 100; }
				case(2) { minLevel = 300; }
				case(3) { minLevel = 1000; }
				default { minLevel = 1000; }
			}

			int i;
			bool playable = true;
			int cCharLevel;
			string cCharName;

			// 레벨 조건을 만족하지 못하는 사람이 있는지 체크한다.
			if (_party.IsValid())
			{
				for (i = 0 ; i< PlayerCnt; i++)
				{
					cChar = (character)cCharList.GetValue(i);
					cCharLevel = cChar.GetCumLevel() + cChar.GetLevel();
					if(cCharLevel < minLevel)
					{
						if(playable)
						{
							cCharName = cChar.GetDisplayName() + ["event.portal_condition.102"];
						}
						else
						{
							cCharName = cCharName + `, ` + cChar.GetDisplayName() + ["event.portal_condition.103"];
						}
						playable = false;
					}
				}
			}
			else
			{
				cCharLevel = _me.GetCumLevel() + _me.GetLevel();
				if(cCharLevel < minLevel)
				{
					playable = false;
					cCharName = _me.GetDisplayName() + ["event.portal_condition.104"];
				}
			}


			if(!playable)
			{
				_sMsg = cCharName+["event.portal_condition.98"];
				return false;
			}

			// 파티일 경우 파티 리더인가 확인한다.
			if (_party.IsValid())
			{
				if(!_me.IsPartyLeader() && PlayerCnt > 1 )
				{
					_sMsg = ["event.portal_condition.99"];
					return false;
				}
			}

			dungeon2 _dungeon;

			// 다른 파티 멤버가 그림자 세계에 있는지 확인한다.
			if (_party.IsValid())
			{
				for (i = 0 ; i< PlayerCnt; i++)
				{
					cChar = (character)cCharList.GetValue(i);
					_dungeon = cChar.FindDungeon2();

					if (!_dungeon.IsNull())
					{
						playable = false;
					}
				}
			}
			else
			{
				_dungeon = _me.FindDungeon2();

				if (!_dungeon.IsNull())
				{
					playable = false;
				}
			}

			if(!playable)
			{
				_sMsg = ["event.portal_condition.100"];
				return false;
			}

			// DebugOut(`[타라 스톤헨지] 보스 미션이므로 통행증 체크 NPC와 대화 시작`);
			_me.TalkToNPC(`_tara_shadowmission_passcheck`);

			// DebugOut(`[타라 스톤헨지] 여기서는 들여보내지 않는다.`);
			return false;
		}
		else
		{
			// DebugOut(`[타라 스톤헨지] 보스 미션이 아니므로 바로 들여보낸다.`);
			return true;
		}
	}

	// DebugOut(`[타라 스톤헨지] 가지고 있는 미션이 없다.`);
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Return_Castle1F_From_CastleSecretRoom(
	character _me,
	object _object,
	string& _sMsg)
// : 비밀의 방 -> 왕성 1층
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon2 _dungeon = _me.FindDungeon2();

	if (!_dungeon.IsNull())
	{
		int missionID = _dungeon.GetLinkedQuest();

		DebugOut(`[옷장] 테스트1 :`+ToString(missionID));
		// 701015: 그림자 세계의 레드 드래곤
		// 701016: 지하 수로의 비밀 실험
		// 793006: G12 누아자 만나기
		if (missionID == 701015 || missionID == 701016 || missionID == 793006 || missionID == 793004 || missionID == 793005)
		{
			_me.Move(`Tara_castle_1F/_Tara_castle_1F/from_SecretRoom`);

			return true;
		}
	}

	// DebugOut(`[옷장] 테스트3`);
	// 현실 세계나 기타 미션에서는 아무런 반응을 하지 않는다.
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_CastleSecretRoom(
	character _me,
	object _object,
	string& _sMsg)
// : 왕성 1층 -> 지하 수로
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon2 _dungeon = _me.FindDungeon2();

	if (!_dungeon.IsNull())
	{
		int missionID = _dungeon.GetLinkedQuest();

		DebugOut(`[옷장] 테스트1 :`+ToString(missionID));
		// 701015: 그림자 세계의 레드 드래곤
		// 701016: 지하 수로의 비밀 실험
		if (missionID == 701015 || missionID == 701016 || missionID == 793006 || missionID == 793004 || missionID == 793005)
		{

			prop mazeprop = GetPropFromObject(_object);
			if (!mazeprop.IsNull())
			{
				string propstate = mazeprop.GetState();
				if (propstate == `closed`)
				{
					mazeprop.SetExtraData(`breaker_name`, _me.GetDisplayName());
					mazeprop.ChangeState(`open`, _me);

					return true;
				}
				else if (propstate == `open`)
				{
					_me.Move(`Tara_castle_B1_entrance/_Tara_castle_B1_entrance/from_Tara_castle_1F_01`);
					_me.ShowCaption(["event.portal_condition.92"],2000);
				}
			}

			return true;
		}
		else if (missionID == 792203)
		{
			prop mazeprop = GetPropFromObject(_object);
			if (!mazeprop.IsNull())
			{
				string propstate = mazeprop.GetState();
				if (propstate == `closed`)
				{
					mazeprop.SetExtraData(`breaker_name`, _me.GetDisplayName());
					mazeprop.ChangeState(`open`, _me);

					return true;
				}
				else if (propstate == `open`)
				{
					if (_me.GetItemNoWithClassId(75418) < 1 || _me.GetItemNoWithClassId(70028) > 0)
					{
						_me.ShowCaption(["event.portal_condition.93"]);
						return false;
					}
					else
					{
						_me.AddKeyword(`g11_s2_cai_04`);
						_me.Move(`Tara_castle_B1_entrance/_Tara_castle_B1_entrance/from_Tara_castle_1F_01`);
					}
				}
			}

			return true;
		}
	}

	DebugOut(`[옷장] 테스트3`);
	// 현실 세계나 기타 미션에서는 아무런 반응을 하지 않는다.
	return false;
}


//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Greathall_From_Airgarden(
	character _me,
	object _object,
	string& _sMsg)
// : 공중 정원 -> 그레이트홀 문으로 이동
//////////////////////////////////////////////////////////////////////////////////
{
	// 현실 세계 공중정원이면 바로 이동
	if(_me.GetRegionId() == 401)
	{
		_me.Move(`Tara_castle_greathall/_Tara_castle_greathall/from_airgarden_to_GThall`);
		return true;
	}
	else
	{
		dungeon2 _dungeon = _me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			int missionID = _dungeon.GetLinkedQuest();

			if (missionID == 701014)	// 보스 미션1: 우로보로스
			{
				// 미션 진행 중에는 뒤로 되돌아 갈 수 없다.
				_sMsg = ["event.portal_condition.94"];
				return false;
			}
		}
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Airgarden_From_Greathall(
	character _me,
	object _object,
	string& _sMsg)
// : 그레이트홀 -> 공중 정원 문으로 이동
//////////////////////////////////////////////////////////////////////////////////
{
	// 현실 세계 그레이트홀이면 바로 이동
	if(_me.GetRegionId() == 413)
	{
		_me.Move(`Tara_main_field/_Tara_main_field_0018/from_greathall_to_airgarden`);
		return true;
	}
	else
	{
		dungeon2 _dungeon = _me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			int missionID = _dungeon.GetLinkedQuest();

			if (missionID == 701014)	// 보스 미션1: 우로보로스
			{
				// 퍼즐을 풀고 문이 열렸을 때만 공중 정원으로 나갈 수 있다.
				bool DoorOpen;
				_dungeon.GetData(`Gatehall_Clear`, DoorOpen);

				if(DoorOpen)
				{
					_me.Move(`Tara_main_field/_Tara_main_field_0018/from_greathall_to_airgarden`);
					return true;
				}
				else
				{
					_sMsg = ["event.portal_condition.95"];
					return false;
				}
			}
		}
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Greathall_From_2F_Field(
	character _me,
	object _object,
	string& _sMsg)
// : 그레이트홀 -> 왕성 2층 필드 문으로 이동
//////////////////////////////////////////////////////////////////////////////////
{
	// 현실 세계 왕성 2층이면 바로 이동
	if(_me.GetRegionId() == 413)
	{
		_me.Move(`Tara_main_field/_Tara_main_field_0018/from_greathall_to_2F_field`);
		return true;
	}
	else
	{
		dungeon2 _dungeon = _me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			int missionID = _dungeon.GetLinkedQuest();

			if (missionID == 701014)	// 보스 미션1: 우로보로스
			{
				// 퍼즐을 풀고 문이 열렸을 때만 2층으로 나갈 수 있다.
				bool DoorOpen;
				_dungeon.GetData(`Gatehall_Clear`, DoorOpen);

				if(DoorOpen)
				{
					_me.Move(`Tara_main_field/_Tara_main_field_0018/from_greathall_to_2F_field`);
					return true;
				}
				else
				{
					_sMsg = ["event.portal_condition.96"];
					return false;
				}
			}
		}
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Castle_Library(
	character _me,
	object _object,
	string& _sMsg)
// : G11 메인스트림 아르와 제너와 키홀 진행중
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.GetRegionId()== 413)		// 현실 세계 장서관
	{
		_me.Move(`Tara_castle_library/_Tara_castle_library/from_GThall`);
		return true;
	}
	else
	{
		dungeon2 _dungeon = _me.FindDungeon2();
		if (!_dungeon.IsNull())
		{
			int missionID = _dungeon.GetLinkedQuest();
			object_list cCharList = _dungeon.GetPlayerList();
			dword PlayerCnt = _dungeon.GetPlayerCount();
			character cChar;

			if (missionID == 792002)	// 그림자 세계 장서관 퀘스트
			{
				if (_me.GetItemNoWithClassId(65050) > 0)		// 열쇠 있다.
				{
					_dungeon.Complete();
					int i;
					for (i = 0 ; i< PlayerCnt; i++)
					{
						cChar = (character)cCharList.GetValue(i);
						if (cChar.GetCompletedQuestObjectiveCount(292002) == 4)
						{
							cChar.AddKeyword(`g11_03`);
							cChar.RemoveKeyword(`g11_02`);
							cChar.RemoveItemCls(75356);
						}
						cChar.PlayCutScene(`C3G11_S#1_2_meeting_buchanan`);
					}
					return true;
				}
				else				// 없다.
				{
					_sMsg = ["event.portal_condition.87"];
					return false;
				}
			}
			else if (missionID == 792102)	// g11s2 스토리 퀘스트
			{
				if (_me.GetItemNoWithClassId(65050) > 0)		// 열쇠 있다.
				{
					_me.Move(`Tara_castle_library/_Tara_castle_library/from_GThall`);
					return true;
				}
				else				// 없다.
				{
					_sMsg = ["event.portal_condition.97"];
					return false;
				}
			}
		}
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Aer_Jenna(
	character _me,
	object _object,
	string& _sMsg)
// : G11 메인스트림 아르와 제너와 키홀 진행중  + g12도 여기에 묻어가기로 함
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.GetCompletedQuestObjectiveCount(292011)==0 && _me.HaveQuestTemplate(292011))		// 292011 퀘스트 첫번째 진행중
	{
		_me.DoStript(`additemex(id:75353)`);
		_me.AddKeyword(`g11_aer`);
		if (_me.IsHuman() || _me.IsElf())
		{
			_me.PlayCutScene(`C3G11_S#6_cichol_death`);
		}
		else if (_me.IsGiant())
		{
			if (_me.IsFemale())
			{
				_me.PlayCutScene(`C3G11_S#6_cichol_death_giant_female`);
			}
			else
			{
				_me.PlayCutScene(`C3G11_S#6_cichol_death_giant_male`);
			}
		}
		else		// 이런 경우는 없어야 한다.
		{
		}
	}

	else
	if (_me.GetCompletedQuestObjectiveCount(293024)==1 && _me.HaveQuestTemplate(293024)
	&& _me.GetItemNoWithClassId(75423) > 0)
	{

		_me.RemoveItemCls(75423);
		_me.AddKeyword(`g12_17`);
		_me.RemoveKeyword(`g12_16`);

		if (_me.IsGiant())
		{
			if (_me.IsFemale())		// 자이언트 여자
			{
				_me.PlayCutScene(`C3G12_S#11_restore_brionac_giant_female`);
			}
			else
			{
				_me.PlayCutScene(`C3G12_S#11_restore_brionac_giant_male`);
			}
		}
		else
		{
			_me.PlayCutScene(`C3G12_S#11_restore_brionac`);
		}
	}


	else
	{
		_me.Move(68, 5573, 4203);
	}
	return true;

}










//////////////////////////////////////////////////////////////////////////////////
server bool Enter_GuildHall(
	character _me,
	object _object,
	string& _sMsg)
// : 루아 집에 들어가는데 조건이 필요하다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (!_me.HasGuild())		// 길드가 없다.
	{
		_me.ShowCaption(["event.portal_condition.88"]);
		return false;
	}
	else if (!_me.HasGuildHall())		// 길드홀이 없다.
	{
		_me.ShowCaption(["event.portal_condition.89"]);
		return false;
	}
	else
	{
		if (_me.WarpToGuildHall())
		{
			// 길드홀 입장 성공
			return false;
		}
		else
		{
			// 입장 실패
			_me.ShowCaption(["event.portal_condition.90"]);
			return false;
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool G1_GoSidheSneachta(
	character _me,
	object _object,
	string& _sMsg)
// : G1용 포탈 이동시 필요 조건이다.
// : Sidhe Sneachta (시드 스넷타)로 이동하기 위한 조건이다.
//////////////////////////////////////////////////////////////////////////////////
{

	if (_me.IsHuman()&&(_me.HaveKeyword(`g1`)||_me.HaveKeyword(`g1_complete`)))
	{
		if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
		{
			return true;
		}
		else if(IsCurrentEvent(`husky2009_1_korea`))
		{
			// 허스키 이벤트 중에는 자유롭게 들어갈 수 있다.
			return true;
		}
		else
		{
			// 레벨 10 이상이어야 이동가능.
			if (_me.GetLevel() >= 10)
			{
				return true;
			}
			else
			{

				// 못가는 이유 - 레벨제한에 걸림
				_sMsg	= ["event.portal_condition.1"];

				return false;
			}
		}
	}
	else if(_me.IsElf())
	{
		return true;
	}
	else if(_me.IsGiant())
	{
		return true;
	}
	else if(IsCurrentEvent(`husky2009_1_korea`))
	{
		// 허스키 이벤트 중에는 자유롭게 들어갈 수 있다.
		return true;
	}
	else
	{
		// 못가는 이유 - G1을 한적이 없다
		_sMsg	= ["event.portal_condition.g1_pc_sidhe_sneachta02"];

		return false;
	}

}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_EmainMachClub(
	character _me,
	object _object,
	string& _sMsg)
// : 이멘마하 클럽에 낮에는 메세지를 보여주고 입장불가, 밤에만 입장가능하다. 18시~ 다음날 새벽 6시
//////////////////////////////////////////////////////////////////////////////////
{
	int day, hour, min ;
	GetGameTime(day, hour, min);
	int i ;

	if (_me.HasSummonedPet())
	{
		_sMsg = ["event.portal_condition.84"];
		return false;
	}

	//모든 서버에 오픈	qwerty.2004.12.19.
	if (true)
	{
		if (hour>=18 || hour <6)
		{
			object_list cItemList;
			item cItem;
			cItemList = _me.GetItemList(73111);

			for (i = 0; i < cItemList.GetSize();  i++)
			{
				cItem = (item)cItemList.GetValue(i);
				if (cItem.IsValid() && !cItem.IsExpired())
				{
					break;
				}
			}
			if (cItem.IsValid() && !cItem.IsExpired())
			{
				_me.DestroyItem(cItem);
				return true;
			}
			else
			{
				_sMsg = ["event.portal_condition.enter_emain_mach_club_no_ticket"];
				return false;
			}
		}

		//시간이 아님
		_sMsg	= ["event.portal_condition.enter_emain_mach_club"];

		return false;
	}
	else
	{
		_sMsg = ["event.portal_condition.enter_emain_mach_club_testserver_flag"];
		return false;
	}

}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_RuaHome(
	character _me,
	object _object,
	string& _sMsg)
// : 루아 집에 들어가는데 조건이 필요하다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.HaveKeyword(`rua_complete`))
	{
		int offsetA, offsetB;
		offsetA = Random(40);
		offsetB = Random(100);
		_me.Move(63,1245+offsetA,1030+offsetB);
		_me.SetDirection(0.862);
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.enter_ruahome_not_available"];
		return false;
	}
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_EmainMacha_Lord_Room(
	character _me,
	object _object,
	string& _sMsg)
// : 영주방에 들어가려면 키워드가 있어야 함
//////////////////////////////////////////////////////////////////////////////////
{

	// g2_15 키워드가 안사라지는 문제 수정용 스크립트 - 현재 추가 발생은 하지 않으나 이미 발생한 유저 수정용 by qwerty 2005.09.29.
	if (_me.IsQuestCompleted(220007))
	{
		_me.RemoveKeyword(`g2_15`);
	}


	if (_me.HaveKeyword(`g2`) )
	{
		if (_me.HaveKeyword(`g2_03`) || _me.HaveKeyword(`g2_04`) || _me.HaveKeyword(`g2_05`) || _me.HaveKeyword(`g2_06`)
		    || _me.HaveKeyword(`g2_07`) || _me.HaveKeyword(`g2_08`) || _me.HaveKeyword(`g2_09`) || _me.HaveKeyword(`g2_10`)
		    || _me.HaveKeyword(`g2_11`) || _me.HaveKeyword(`g2_12`) || _me.HaveKeyword(`g2_13`) || _me.HaveKeyword(`g2_14`)
		    || _me.HaveKeyword(`g2_15`) || _me.HaveKeyword(`g2_16`) || _me.HaveKeyword(`g2_17`) || _me.HaveKeyword(`g2_18`)
		    || _me.HaveKeyword(`g2_19`) || _me.HaveKeyword(`g2_20`) || _me.HaveKeyword(`g2_21`) || _me.HaveKeyword(`g2_22`)
		    || _me.HaveKeyword(`g2_23`) || _me.HaveKeyword(`g2_24`) || _me.HaveKeyword(`g2_25`) || _me.HaveKeyword(`g2_26`)
		    || _me.HaveKeyword(`g2_27`) || _me.HaveKeyword(`g2_28`) || _me.HaveKeyword(`g2_29`) || _me.HaveKeyword(`g2_30`)
		    || _me.HaveKeyword(`g2_31`) || _me.HaveKeyword(`g2_32`) || _me.HaveKeyword(`g2_33`) || _me.HaveKeyword(`g2_34`)
		    || _me.HaveKeyword(`g2_35`))
		{
			_me.Move(67,6000,5405);
			return true;
		}
		else
		if(_me.HaveKeyword(`g2_36`) || _me.HaveKeyword(`g2_37`) || _me.HaveKeyword(`g2_38`))
		{
			if(_me.IsQuestCompleted(220040))
			{
				_me.PlayCutScene(`G2_36_a`, 0);
				return true;
			}
			else
			{
				G2_Reset_After_G2_23(_me) extern (`data/script/event/g2_event.mint`);
				return false;
			}
		}
		else
		if (_me.HaveKeyword(`g2_01`) || _me.HaveKeyword(`g2_02`))
		{
			_sMsg = ["event.portal_condition.enter_emainmacha_lord_room_not_available"];
		}
		else
		{
			_sMsg = ["event.portal_condition.enter_emainmacha_lord_room_not_available"];
		}
	}
	else
	{
		_me.Move(66,6000,5405);
		if(_me.HaveKeyword(`g3`) && _me.GetItemNoWithClassId(75056)!=0) //G3_ 아이던 감사 퀘스트
		{
			_me.RemoveItemCls(75056);
			_me.AddKeyword(`g3_13_HiddenA`);
			_me.PlayCutScene(`g3_13_a_Recollection_Aodhan`, 0);

		}

		return true;
	}
	return false;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Aer_Room(
	character _me,
	object _object,
	string& _sMsg)
// : 아르방..에 스크립트 달려다가 취소
//////////////////////////////////////////////////////////////////////////////////
{
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Tirchonail(
	character _me,
	object _object,
	string& _sMsg)
// : 튜토리얼 -> 티르코네일 진입시 컷신 틀고 광장으로 이동
//////////////////////////////////////////////////////////////////////////////////
{
	if(
		(GetLocale().LowerCase()==`korea`)
		|| (GetLocale().LowerCase() !=`korea` && GetLocale().LowerCase() !=`japan`
			&& GetLocale().LowerCase() !=`china` && GetLocale().LowerCase() != `taiwan`)
		|| (GetLocale().LowerCase()==`china` && GetVersion() >= 302)
		|| (GetLocale().LowerCase()==`taiwan` && GetVersion() >= 301)
		|| (GetLocale().LowerCase()==`japan` && GetVersion() >= 403)
	)	//G3S4 튠업 아이리 GetLocale().LowerCase()==`korea`
	{
		if(!_me.IsPet()&&_me.GetRebirthCount()==0)
		{
			if(
				(_me.GetEgoWeapon().IsValid()&& _me.GetEgoType()==9) //정령무기랑 계약되었고 그 정령무기를 갖고 있어야
				||_me.HaveKeyword(`FirstLoginAtIria`)	//아니면 이리아에서 왔다거나.. 이거 위험할 거 같은디;
				||_me.HaveKeyword(`memorial_character`)	//아니면 메모리얼 캐릭터면 그냥 통과시켜준다.
			)
			{
				_me.PlayCutScene(`into_the_Tir_Chonaill`, 0);

				return true;
			}
			/*// G13S1 이후 생성 캐릭터는 휘슬, 실린더 정령 무기 계약되어 있으면 통과 by eljjoo 2010-06-22
			else if (_me.HaveKeyword(`new_character_after_g13`) && (_me.GetEgoType()==13 || _me.GetEgoType()==14))
			{
				_me.PlayCutScene(`into_the_Tir_Chonaill`, 0);

				return true;
			}*/
			// 엘프나 자이언트가 오면 바로 입장시켜준다.  2008.08.06 orcen
			else if(_me.IsElf() || _me.IsGiant())
			{
				_me.PlayCutScene(`into_the_Tir_Chonaill`, 0);	//이 컷신후 이동하기 때문에, 이동시키려면 꼭 컷신을 틀어야 한다!
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.25"].SelectRandom());
				return false;
			}
		}
		else
		{
			_me.PlayCutScene(`into_the_Tir_Chonaill`, 0);	//이 컷신후 이동하기 때문에, 이동시키려면 꼭 컷신을 틀어야 한다!
			return true;
		}
	}
	else
	{
		_me.PlayCutScene(`into_the_Tir_Chonaill`, 0);
		return true;
	}
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Hidden_Tutorial_Area(
	character _me,
	object _object,
	string& _sMsg)
// : 환생한 사람만 들어갈 수 있는 지역
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.GetRebirthCount() >0)
	{
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.enter_hidden_tutorial_area_not_rebirth"];
		return false;
	}
}
//////////////////////////////////////////////////////////////////////////////////
server bool Return_Last_Town(
	character _me,
	object _object,
	string& _sMsg)
// : 크리스마스 이벤트 지역에서 돌아오기
//////////////////////////////////////////////////////////////////////////////////
{
	_me.Move(_me.GetLastTown());
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Dunbarton_Library(
	character _me,
	object _object,
	string& _sMsg)
// : 던바튼 도서관에 들어가기
//////////////////////////////////////////////////////////////////////////////////
{
	// 메인스트림 가능, 퀘스트 진행 중. 통행증 있다.
	if (IsEnable(`featureG11MainStream`) extern (`data/script/features.mint`) && _me.GetCompletedQuestObjectiveCount(292001) == 1 && _me.GetItemNoWithClassId(63207) > 0)
	{
		int day,hour,min;
		GetGameTime(day, hour, min);

		if (IsDevelopment())
		{
			_me.ShowMessageView(`이곳은 부캐넌 도서관. 이것은 개발서버 전용 메시지`);
		}
		_me.RemoveItemCls(63207, 1);		// 아이템 삭제를 엄격히 체크할 필요 없다. 어차피 아이라에게 말 걸면 언제든 다시 주는 거.
		_me.Move(172,10200,7600);		// 부캐넌 도서관
		_me.SetDirection(1.57);
		_me.TalkToNPC(`_storyhelper`);
		return true;
	}

	if (GetVersion() >= 203)//G2 부터에
	{
		int day,hour,min;
		int dlrgnid = 76;

		GetGameTime(day, hour, min);

		object_list cList;
		cList = _me.GetItemList(63106);

		if(cList.GetSize()==0)
		{
			// 무서운 도서관이 실행되지 않는지 먼저 확인하고 이후에
			// G3S4 다크나이트 입수 컷신 실행
			if (GetVersion() >= 304 && _me.GetItemNoWithClassId(75111) != 0)
			{
				_me.PlayCutScene(`cutscene_get_darkknight_skill_04_the_past`, 0);
				_me.RemoveItemCls(75111, 1);

				return true;
			}

			_me.Move(72,10200,7600); //일반 도서관
			return true;
		}
		else //무서운 도서관 입장
		{
			if((hour == 0) || (_me.GetTitle()==60001 || _me.GetTitle()==60000)) //적당히 자정이면
			{
				if(GetUserNumber(dlrgnid) <= 40) //인원수가 되면
				{
					item cItem=(item)cList.GetValue(0);
					if(_me.DestroyItem(cItem)) //아이템을 없애고 들어간다
					{
						_me.PlayCutScene(`into_the_Scary_School`, 0);//컷신을 틀고 컷신후 무서운 도서관으로 이동
						return true;
					}
				}
				else
				{
					_sMsg = ["event.portal_condition.5"];
					_me.Move(72,10200,7600);//일반 도서관
					return true;
				}
			}
			else
			{
				if(Random(4)==0)
				{
					_sMsg = ["event.portal_condition.3"];
				}
				//시간이 아니면 도서관으로 입장
				_me.Move(72,10200,7600);
				return true;
			}
		}
	}
	// G11 메인스트림 진행중이다.

	else
	{
		_sMsg = ["event.portal_condition.enter_dunbarton_library"];
		return false;
	}
	return false;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Peaca_dungeon(
	character _me,
	object _object,
	string& _sMsg)
// : 페카던전 진입 제너레이션 처리
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 204)
	{
		DebugOut(`센마이 던전은 G2S4에 입장가능`);
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.4"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Elf_WeddingHall_By_Season(
	character _me,
	object _object,
	string& _sMsg)
// : 콘누스 필리아 마을 결혼식장 입장 제너레이션 처리
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 502)
	{
		_sMsg = ["event.portal_condition.54"];
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.55"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Giant_WeddingHall_By_Season(
	character _me,
	object _object,
	string& _sMsg)
// : 피시스 마을 결혼식장 입장 제너레이션 처리
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 603)
	{
		_sMsg = ["event.portal_condition.54"];
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.55"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool CanEnter_WeddingHall(
	character me,
	object _object,
	string& message)
// : 신랑/신부용 출입문 처리
//////////////////////////////////////////////////////////////////////////////////
{
	qword	marriage = FindWedding(me.GetRegionId());

	if (IsWeddingOwner(marriage, me))
	{
		if (IsWeddingActive(marriage))
		{
			if (me.CanEnterWeddingHallToMarry(`emainmacha`))
			{
				return true;
			}
			else
			{
				message = ["event.portal_condition.63"];
				return false;
			}
		}
		else
		{
			message = ["event.portal_condition.6"];
			return false;
		}
	}
	else
	{
		message = ["event.portal_condition.7"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool CanEnter_Elf_WeddingHall(
	character me,
	object _object,
	string& message)
// : 신랑/신부용 출입문 처리
//////////////////////////////////////////////////////////////////////////////////
{
	qword	marriage = FindWedding(me.GetRegionId());

	if (IsWeddingOwner(marriage, me))
	{
		if (IsWeddingActive(marriage))
		{
			if (me.CanEnterWeddingHallToMarry(`filia`) ||
				me.CanEnterWeddingHallToMarry(`filia_human_female`) ||
				me.CanEnterWeddingHallToMarry(`filia_human_male`))
			{
				return true;
			}
			else
			{
				message = ["event.portal_condition.64"];
				return false;
			}
		}
		else
		{
			message = ["event.portal_condition.6"];
			return false;
		}
	}
	else
	{
		message = ["event.portal_condition.7"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool CanEnter_Giant_WeddingHall(
	character me,
	object _object,
	string& message)
// : 신랑/신부용 출입문 처리
//////////////////////////////////////////////////////////////////////////////////
{
	qword	marriage = FindWedding(me.GetRegionId());

	if (IsWeddingOwner(marriage, me))
	{
		if (IsWeddingActive(marriage))
		{
			if (me.CanEnterWeddingHallToMarry(`vales`) ||
				me.CanEnterWeddingHallToMarry(`vales_human_female`) ||
				me.CanEnterWeddingHallToMarry(`vales_human_male`))
			{
				return true;
			}
			else
			{
				message = ["event.portal_condition.65"];
				return false;
			}
		}
		else
		{
			message = ["event.portal_condition.6"];
			return false;
		}
	}
	else
	{
		message = ["event.portal_condition.7"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool CanLeave_WeddingLobby(
	character me,
	object _object,
	string& message)
// : 신랑/신부용 출입문 처리
//////////////////////////////////////////////////////////////////////////////////
{
	qword	marriage = FindWedding(me.GetRegionId());

	if (IsWeddingOwner(marriage, me))
	{
		// 신랑 혹은 신부이다.
		string	warning = ["event.portal_condition.8"];

		if (me.IsFemale())
		{
			if (me.GetItemNoInPocket(5, 15123) > 0 ||	// 예복
				me.GetItemNoInPocket(8, 18106) > 0 ||	// 면사포
				me.GetItemNoInPocket(7, 17052) > 0 ||		// 신발
				me.GetItemNoInPocket(5, 15186) > 0 ||		// 엘프 예복
				me.GetItemNoInPocket(8, 18137) > 0 ||		// 엘프 면사포
				me.GetItemNoInPocket(7, 17079) > 0 ||		// 엘프 신발
				me.GetItemNoInPocket(5, 15227) > 0 ||		// 자이언트 예복
				me.GetItemNoInPocket(7, 17093) > 0)		// 자이언트 신발

			{
				message = warning;
				return false;
			}
		}
		else
		{
			if (me.GetItemNoInPocket(5, 15122) > 0 ||	// 예복
				me.GetItemNoInPocket(7, 17051) > 0 ||		// 신발
				me.GetItemNoInPocket(5, 15185) > 0 ||		// 엘프 예복
				me.GetItemNoInPocket(8, 18136) > 0 ||		// 엘프 면사포
				me.GetItemNoInPocket(7, 17078) > 0 ||		// 엘프 신발
				me.GetItemNoInPocket(5, 15226) > 0 ||		// 자이언트 예복
				me.GetItemNoInPocket(7, 17092) > 0)		// 자이언트 신발
			{
				message = warning;
				return false;
			}
		}
	}

	// 하객은 자유롭게 나갈 수 있다.
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_House(
	character me,
	string region,
	string area,
	string position,
	string& message)
// : 집에 들어갈 때 처리
//////////////////////////////////////////////////////////////////////////////////
{
	string globalregion = region + `/` + area + `/` + position;
	house target_house = GetHouseFromRegion(globalregion);

	if (target_house.IsValid())
	{
		// 막는 부분 처리
		if (target_house.IsOwned())
		{
			// 누가 살고 있을 때
			if (target_house.IsOwner(me))
			{
				if(!IsTestServer())
				{
					if(!me.IsUsableServiceHousing())
					{
						if (GetVersion() >= 901 && GetLocale().LowerCase()==`korea`)
						{
							message = ["event.portal_condition.79"]; //"스토리지 서비스를 받으셔야 자기 집에 들어갈 수 있습니다.";
						}
						else
						{
							message = ["event.portal_condition.9"]; //"스토리지 서비스를 받으셔야 자기 집에 들어갈 수 있습니다.";
						}
						return false;
					}
				}
			}
			else if (!target_house.IsOwner(me) && !target_house.IsEntranceAllow(me))
			{
				me.ShowCaption(["event.portal_condition.18"]);
				return false;
			}
			return true;
		}
		else if (target_house.IsOnBidding())
		{
			// 경매 중일 때
			if(!IsTestServer())
			{
				if (!me.IsUsableServiceHousing())
				{
					if (GetVersion() >= 901 && GetLocale().LowerCase()==`korea`)
					{
						message = ["event.portal_condition.80"];
					}
					else
					{
						message = ["event.portal_condition.11"];		// "스토리지 서비스를 사용해야  경매 중인 집에 들어갈 수 있습니다.";
					}
					return false;
				}
			}
			return true;
		}
		else
		{
			// 집이 비어 있을 때
			me.ShowCaption(["event.portal_condition.19"]);
			return false;
		}
	}

	message = ["event.portal_condition.13"];
	return false;

}




//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Castle(
	character me,
	string region,
	string area,
	string position,
	string& message)
// : 성에 들어갈 때 처리
//////////////////////////////////////////////////////////////////////////////////
{
	string globalregion = region + `/` + area + `/` + position;
	castle target_castle = GetCastleFromRegion(globalregion);

	if (target_castle.IsValid())
	{
		// 막는 부분 처리
		if (target_castle.IsOwned())
		{
			// 누가 살고 있을 때
			if (target_castle.IsOwner(me))
			{
				if(!IsTestServer())
				{
					if(!me.IsUsableServiceHousing())
					{
						if (GetVersion() >= 901 && GetLocale().LowerCase()==`korea`)
						{
							message = ["event.portal_condition.81"]; // "프리미엄 팩을 사용해야 경매 중인 성에 들어갈 수 있습니다.";
						}
						else
						{
							message = ["event.portal_condition.14"]; // "스토리지 서비스를 사용해야 경매 중인 성에 들어갈 수 있습니다.";
						}
						return false;
					}
				}
			}
			if (!target_castle.IsMainGateEnterable(me))
			{
				message = ["event.portal_condition.20"];
				return false;
			}
			return true;
		}
		else if (target_castle.IsOnBidding())
		{
			// 경매 중일 때
			if(!IsTestServer())
			{
				if (!me.IsUsableServiceHousing())
				{
					if (GetVersion() >= 901 && GetLocale().LowerCase()==`korea`)
					{
						message = ["event.portal_condition.82"];
					}
					else
					{
						message = ["event.portal_condition.15"];
					}
					return false;
				}
			}
			return true;
		}
		else
		{
			// 성이 비어 있을 때
			message = ["event.portal_condition.16"];
			return false;
		}
	}

	message = ["event.portal_condition.17"];
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_GuildRoom(
	character me,
	string region,
	string area,
	string position,
	string& message)
// : 성 관리실에 들어갈 때 처리
//////////////////////////////////////////////////////////////////////////////////
{
	string globalregion = region + `/` + area + `/` + position;
	castle target_castle = GetCastleFromRegion(globalregion);

	if (target_castle.IsValid())
	{
		// 막는 부분 처리
		if (target_castle.IsOwned())
		{
			// 누가 살고 있을 때
			if (!target_castle.IsOwner(me))
			{
				me.ShowCaption(["event.portal_condition.21"]);
				return false;
			}
			else
			if (!IsTestServer())
			{
				if(!me.IsUsableServiceHousing())
				{
					if (GetVersion() >= 901 && GetLocale().LowerCase()==`korea`)
					{
						message = ["event.portal_condition.83"];
					}
					else
					{
						message = ["event.portal_condition.22"]; //"스토리지 서비스를 받으셔야 관리실에 들어갈 수 있습니다.";
					}
					return false;
				}
			}
			return true;
		}
		else
		{
			// 성이 비어 있을 때
			me.ShowCaption(["event.portal_condition.23"]);
			return false;
		}
	}

	message = ["event.portal_condition.17"];
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_RabbieArena(
	character me,
	object _object,
	string& message)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (!me.IsHuman())
	{
		message = ["event.portal_condition.66"];
		return false;
	}
	else
	{
		if (me.IsTransformed())
		{
			return true;
		}
		else
		{
			message = ["event.portal_condition.24"]; //`아레나에 입장하기전에 변신해야 합니다`;
			return false;
		}
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_EventArena(
	character me,
	object _object,
	string& message)
// : GSTAR2005용 이벤트 아레나 입장
//////////////////////////////////////////////////////////////////////////////////
{
	if (me.IsTransformed())
	{
		return true;
	}
	else
	{
		message = `아레나에 입장하기전에 변신해야 합니다`;
		return false;
	}
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Iria_HarborBaseCamp(
	character _me,
	object _object,
	string& _sMsg)
// : 이리아 튜토리얼 필드-> 뻬이스 캠프 진입시이동
//////////////////////////////////////////////////////////////////////////////////
{
	if(_me.IsPet())
	{
		_me.Move(`Iria_SW_main_field/_Iria_SW_main_field_0022/portal_Iria_SW_basecamp_from_tutorial`);
		return true;
	}

	if(_me.HaveKeyword(`have_complete_ffion_quest`))
	{
		_me.Move(`Iria_SW_main_field/_Iria_SW_main_field_0022/portal_Iria_SW_basecamp_from_tutorial`);
		return true;
	}
	else
	{
		if(_me.HaveKeyword(`start_ffion_quest`))
		{
			_me.ShowCaption(["event.portal_condition.26"].SelectRandom());
		}
		else
		{
			_me.ShowCaption(["event.portal_condition.27"].SelectRandom());
		}
		return false;
	}

}
//////////////////////////////////////////////////////////////////////////////////
server bool Iria_Harbor_To_Iria_HarborBaseCamp(
	character _me,
	object _object,
	string& _sMsg)
// : 이리아 항구 -> 뻬이스 캠프 진입시이동
//////////////////////////////////////////////////////////////////////////////////
{
	// by HanStone. 이부분 머리아퍼 죽겠심. 누가 나중에 잘 좀 봐줘

	if(_me.IsHuman() && !_me.HaveKeyword(`portal_qilla_base_camp`)
	)
	{
		_me.Move(3001,165373+Random(200),160708+Random(200));
	}
	else
	{
		_me.Move(`Iria_SW_main_field/_Iria_SW_main_field_0022/portal_Iria_SW_basecamp_from_harbor`);
	}
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool HarborBaseCamp_To_Iria_Tutorial_Field(
	character _me,
	object _object,
	string& _sMsg)
// : 이리아 항구 -> 뻬이스 캠프 진입시이동
//////////////////////////////////////////////////////////////////////////////////
{
	_me.ShowCaption(["event.portal_condition.28"].SelectRandom());
	return false;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Ceann_Harbor_To_Ship(
	character _me,
	object _object,
	string& _sMsg)
// : 케안 항구 -> 배 타기
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsPet())
	{
		_sMsg = ["event.portal_condition.29"];
		return false;
	}


	if (GetVersion() < 402) // G4S2 이전까지는 배를 타지 못한다.
	{
		_sMsg = ["event.portal_condition.49"];
		return false;
	}

	//승선권 있나?
	int i;
	object_list cItemList;
	item cItem;
	cItemList = _me.GetItemList(75118);

	for (i = 0; i < cItemList.GetSize();  i++)
	{
		cItem = (item)cItemList.GetValue(i);
		if (cItem.IsValid() && !cItem.IsExpired())
		{
			break;
		}
	}
	if (cItem.IsValid() && !cItem.IsExpired()) //제대로 된 승선권이 있으면
	{
		qword currentTime = GetGlobalTime();
		qword nextDepartTime = _me.GetNextDepartTime(_me.GetRegionId());

		if (_me.IsBoardingEnable(_me.GetRegionId()))
		{
			if (currentTime + 30 * 1000 <= nextDepartTime)
			{
				if (GetUserNumber(103) <= 60)
				{
					_me.DestroyItem(cItem);
					_me.Move(`Ula_Ceann_Harbor_onboard/_Ula_Ceann_Harbor_onboard_01/portal_ceann_onboard`);
					return true;
				}
				else
				{
					_sMsg = ["event.portal_condition.30"];
					return false;
				}
			}
			else
			{
				_sMsg = ["event.portal_condition.32"];
				return false;
			}
		}
		else
		{
			//시간이 아님
			nextDepartTime = _me.GetNextBoardingTime(_me.GetRegionId());
			if (nextDepartTime < currentTime) nextDepartTime = currentTime;

			int iDay, iHour, iMin, iSec;
			qword timeInterval;
			timeInterval = (nextDepartTime - currentTime) / 1000; //밀리세컨드 -> 세컨드
			iSec = timeInterval % 60;
			timeInterval = (timeInterval - iSec) / 60; //초는 빼고 분단위로 환산
			iMin = timeInterval % 60;
			timeInterval = (timeInterval - iMin) / 60; //분을 빼고 시간단위로 환산
			iHour = timeInterval % 24;
			timeInterval = (timeInterval - iHour) / 24 ; //시간을 빼고 일단위로 환산
			iDay = timeInterval ;
			DebugOut(`Ceann_Harbor_To_Ship {0}일 {1}시간 {2}분 {3}초`<<iDay<<iHour<<iMin<<iSec);
			if (iDay ==0)
			{
				if (iHour == 0)
				{
					if (iMin == 0)
					{
						DebugOut(`Ceann_Harbor_To_Ship 000 {0}일 {1}시간 {2}분 {3}초`<<iDay<<iHour<<iMin<<iSec);
						_sMsg	= ["event.portal_condition.33"]<<iSec;
						return false;
					}
					else
					{
						DebugOut(`Ceann_Harbor_To_Ship 00x {0}일 {1}시간 {2}분 {3}초`<<iDay<<iHour<<iMin<<iSec);
						_sMsg	= ["event.portal_condition.34"]<<iMin<<iSec;
						return false;
					}
				}
				else
				{
					DebugOut(`Ceann_Harbor_To_Ship 0xx {0}일 {1}시간 {2}분 {3}초`<<iDay<<iHour<<iMin<<iSec);
					_sMsg	= ["event.portal_condition.35"]<<iHour<<iMin<<iSec;
					return false;
				}
			}
			else
			{
					DebugOut(`Ceann_Harbor_To_Ship xxx {0}일 {1}시간 {2}분 {3}초`<<iDay<<iHour<<iMin<<iSec);
				_sMsg	= ["event.portal_condition.36"]<<iDay<<iHour<<iMin<<iSec;
				return false;
			}
			DebugOut(`Ceann_Harbor_To_Ship end`);
		}
	}
	else
	{
		_sMsg = ["event.portal_condition.31"]; //"배에 타기 위해서는 승선권이 필요합니다. 셰넌에게 구입하세요.";
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Qilla_Harbor_To_Ship(
	character _me,
	object _object,
	string& _sMsg)
// : 켈라 항구 -> 배 타기
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsPet())
	{
		_sMsg = ["event.portal_condition.37"];
		return false;
	}

	int i;
	object_list cItemList;
	item cItem;
	cItemList = _me.GetItemList(75118);

	for (i = 0; i < cItemList.GetSize();  i++)
	{
		cItem = (item)cItemList.GetValue(i);
		if (cItem.IsValid() && !cItem.IsExpired())
		{
			break;
		}
	}
	if (cItem.IsValid() && !cItem.IsExpired())
	{

		qword currentTime = GetGlobalTime();
		qword nextDepartTime = _me.GetNextDepartTime(_me.GetRegionId());

		if (_me.IsBoardingEnable(_me.GetRegionId()))
		{
			if (currentTime + 30 * 1000 <= nextDepartTime)
			{
				if (GetUserNumber(103) <= 60)
				{
					_me.DestroyItem(cItem);
					_me.Move(`Iria_Harbor_01_onboard/_Iria_Harbor_01_onboard_001/portal_iria_harbor_01_onboard`);
					return true;
				}
				else
				{
					_sMsg = ["event.portal_condition.38"];
					return false;
				}
			}
			else
			{
				_sMsg = ["event.portal_condition.40"];
				return false;
			}
		}
		else
		{
			//시간이 아님
			nextDepartTime = _me.GetNextBoardingTime(_me.GetRegionId());
			if (nextDepartTime < currentTime) nextDepartTime = currentTime;

			int		iDay, iHour, iMin, iSec;
			qword timeInterval;
			timeInterval = (nextDepartTime - currentTime) / 1000; //밀리세컨드 -> 세컨드
			iSec = timeInterval % 60;
			timeInterval = (timeInterval - iSec) / 60; //초는 빼고 분단위로 환산
			iMin = timeInterval % 60;
			timeInterval = (timeInterval - iMin) / 60; //분을 빼고 시간단위로 환산
			iHour = timeInterval % 24;
			timeInterval = (timeInterval - iHour) / 24 ; //시간을 빼고 일단위로 환산
			iDay = timeInterval ;
			if (iDay ==0)
			{
				if (iHour == 0)
				{
					if (iMin == 0)
					{
						_sMsg	= ["event.portal_condition.41"]<<iSec;
						return false;
					}
					else
					{
						_sMsg	= ["event.portal_condition.42"]<<iMin<<iSec;
						return false;
					}
				}
				else
				{
					_sMsg	= ["event.portal_condition.43"]<<iHour<<iMin<<iSec;
					return false;
				}
			}
			else
			{
				_sMsg	= ["event.portal_condition.44"]<<iDay<<iHour<<iMin<<iSec;
				return false;
			}
		}
	}
	else
	{
		_sMsg = ["event.portal_condition.39"];
		return false;
	}
}


//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Senmai_From_MorvaAisle(
	character _me,
	object _object,
	string& _sMsg)
// : 이리아 항구 -> 뻬이스 캠프 진입시이동
//////////////////////////////////////////////////////////////////////////////////
{
	_me.Move(`Sen_Mag_town/_Sen_Mag_town_004/from_Morva_Aisle_Field`);
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_CastleDungeonLobby(
	character _me,
	object _object,
	string& _sMsg)
// : 성 창고 -> 성 로비로 진입시
//////////////////////////////////////////////////////////////////////////////////
{
	// 이 루틴은 Dynamic -> Static으로 가는 루틴입니다.
	// 그러므로 성이 추가될 때마다 수정해 주어야 합니다.
	// by nicolas. 2006.03.25
	DebugOut(`성 로비에서 지하저장소로 들어가려고 한다`);
	int regionid = _me.GetRegionId();
	castle target_castle = GetCastleFromRegionId(regionid);

	if (target_castle.IsValid())
	{
		if (target_castle.GetIndex() == 1)
		{
			if (target_castle.IsOwner(_me) || target_castle.IsSellDungeonPass())
			{
				// 두갈드 성
				_me.Move(`Dugald_Aisle_keep_DgnHall_before/_Dugald_Aisle_keep_DgnHall_before/Dugald_keep_in_portal`);
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.46"]);
				return false;
			}
		}
		else if (target_castle.GetIndex() == 2)
		{
			if (target_castle.IsOwner(_me) || target_castle.IsSellDungeonPass())
			{
				// 센마이 성
				_me.Move(`Sen_Mag_keep_DgnHall_before/_Sen_Mag_keep_DgnHall_before/SenMag_keep_in_portal`);
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.47"]);
				return false;
			}
		}
		else if (target_castle.GetIndex() == 3)
		{
			if (target_castle.IsOwner(_me) || target_castle.IsSellDungeonPass())
			{
				// 아브네아 성
				_me.Move(`Abb_Neagh_keep_DgnHall_before/_Abb_Neagh_keep_DgnHall_before/Abb_Neagh_keep_in_portal`);
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.85"]);
				return false;
			}
		}
		else if (target_castle.GetIndex() == 4)
		{
			if (target_castle.IsOwner(_me) || target_castle.IsSellDungeonPass() || _me.GetTitle() == 60001)
			{
				// 퀼린 성
				_me.Move(`Tara_keep_DgnHall_before/_Tara_keep_DgnHall_before_0/Tara_keep_in_portal`);

				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.105"]);
				return false;
			}
		}
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Leave_CastleDungeonLobby(
	character _me,
	object _object,
	string& _sMsg)
// : 성 로비 -> 성 창고로 진입시
//////////////////////////////////////////////////////////////////////////////////
{
	// 이 루틴은 Static -> Dynamic으로 가는 루틴입니다.
	// 그러므로 성이 추가될 때마다 수정해 주어야 합니다.
	// by nicolas. 2006.03.25

	int regionid = _me.GetRegionId();
	if (regionid == 205)
	{
		// 두갈드 성
		castle target_castle = GetCastleFromName(`dugald_castle`);
		if (target_castle.IsValid())
		{
			if (target_castle.IsOwned())
			{
				int targetregion = target_castle.GetIndoorRegionId(`Dugald_Aisle_UserCastle_warehouse`);
				if (targetregion > 0)
				{
					_me.Move(targetregion, `Dugald_Aisle_UserCastle_warehouse/_Dugald_Aisle_UserCastle_warehouse/Castle_warehouse_portal_from_keepDG`);
					return true;
				}
				else
				{
					// 해당 리전을 못찾을 경우도 성 밖으로 나온다.
					if (target_castle.KickCharacter(_me))
					{
						return true;
					}
				}
			}
			else
			{
				// 성이 부서진 경우 성 밖으로 나온다.
				if (target_castle.KickCharacter(_me))
				{
					return true;
				}
			}
		}
	}
	else if (regionid == 207)
	{
		// 센마이 성
		castle target_castle = GetCastleFromName(`senmag_castle`);
		if (target_castle.IsValid())
		{
			if (target_castle.IsOwned())
			{
				int targetregion = target_castle.GetIndoorRegionId(`Dugald_Aisle_UserCastle_warehouse`);
				if (targetregion > 0)
				{
					_me.Move(targetregion, `Dugald_Aisle_UserCastle_warehouse/_Dugald_Aisle_UserCastle_warehouse/Castle_warehouse_portal_from_keepDG`);
					return true;
				}
				else
				{
					// 해당 리전을 못찾을 경우도 성 밖으로 나온다.
					if (target_castle.KickCharacter(_me))
					{
						return true;
					}
				}
			}
			else
			{
				// 성이 부서진 경우 성 밖으로 나온다.
				if (target_castle.KickCharacter(_me))
				{
					return true;
				}
			}
		}
	}
	else if (regionid == 217)
	{
		// 아브네아 성
		castle target_castle = GetCastleFromName(`abbneagh_castle`);
		if (target_castle.IsValid())
		{
			if (target_castle.IsOwned())
			{
				int targetregion = target_castle.GetIndoorRegionId(`Dugald_Aisle_UserCastle_warehouse`);
				if (targetregion > 0)
				{
					_me.Move(targetregion, `Dugald_Aisle_UserCastle_warehouse/_Dugald_Aisle_UserCastle_warehouse/Castle_warehouse_portal_from_keepDG`);
					return true;
				}
				else
				{
					// 해당 리전을 못찾을 경우도 성 밖으로 나온다.
					if (target_castle.KickCharacter(_me))
					{
						return true;
					}
				}
			}
			else
			{
				// 성이 부서진 경우 성 밖으로 나온다.
				if (target_castle.KickCharacter(_me))
				{
					return true;
				}
			}
		}
	}
	else if (regionid == 60206)
	{
		// 퀼린 성
		castle target_castle = GetCastleFromName(`cuilin_castle`);
		if (target_castle.IsValid())
		{
			if (target_castle.IsOwned())
			{
				int targetregion = target_castle.GetIndoorRegionId(`Dugald_Aisle_UserCastle_warehouse`);
				if (targetregion > 0)
				{
					_me.Move(targetregion, `Dugald_Aisle_UserCastle_warehouse/_Dugald_Aisle_UserCastle_warehouse/Castle_warehouse_portal_from_keepDG`);

					return true;
				}
				else
				{
					// 해당 리전을 못찾을 경우도 성 밖으로 나온다.
					if (target_castle.KickCharacter(_me))
					{
						return true;
					}
				}
			}
			else
			{
				// 성이 부서진 경우 성 밖으로 나온다.
				if (target_castle.KickCharacter(_me))
				{
					return true;
				}
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_BangorToMorvaAisle(
	character _me,
	object _object,
	string& _sMsg)
// : 하우징 리전 진입 가능 여부
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 402)
	{
		// 402이상이면 진입 가능하다.
		return true;
	}

	_sMsg = ["event.portal_condition.48"];
	return false;
}


//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_1`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_1`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_2`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_2`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_3(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_3`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_3`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_4(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_4`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_4`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_5(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_5`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_5`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_6(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_6`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_6`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoConnous_Bridge_7(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoConnous_Bridge_7`))
	{
		return _me.MoveViaBridge(`RanoConnous_Bridge_7`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_1`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_1`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_2`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_2`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_3(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_3`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_3`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_4(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_4`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_4`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_5(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_5`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_5`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_6(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_6`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_6`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_7(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_7`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_7`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_8(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_8`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_8`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_9(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_9`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_9`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_PhysisCourcle_Bridge_10(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`PhysisCourcle_Bridge_10`))
	{
		return _me.MoveViaBridge(`PhysisCourcle_Bridge_10`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_ConnousCourcle_Bridge_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`ConnousCourcle_Bridge_1`))
	{
		return _me.MoveViaBridge(`ConnousCourcle_Bridge_1`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_ConnousCourcle_Bridge_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`ConnousCourcle_Bridge_2`))
	{
		return _me.MoveViaBridge(`ConnousCourcle_Bridge_2`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_ConnousCourcle_Bridge_3(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`ConnousCourcle_Bridge_3`))
	{
		return _me.MoveViaBridge(`ConnousCourcle_Bridge_3`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_ConnousCourcle_Bridge_4(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`ConnousCourcle_Bridge_4`))
	{
		return _me.MoveViaBridge(`ConnousCourcle_Bridge_4`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoCourcle_Bridge_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoCourcle_Bridge_1`))
	{
		return _me.MoveViaBridge(`RanoCourcle_Bridge_1`);
	}
	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Move_Via_RanoCourcle_Bridge_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsBridgeConstructed(`RanoCourcle_Bridge_2`))
	{
		return _me.MoveViaBridge(`RanoCourcle_Bridge_2`);
	}
	return false;
}


//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Iria_Filia_From_Elf_Tutorial(
	character _me,
	object _object,
	string& _sMsg)
// : 엘프 튜토리얼 필드-> 필리아 진입시이동
//////////////////////////////////////////////////////////////////////////////////
{
	if(_me.IsPet())
	{
		_me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0114/Iria_SE_filia_Spawn_01`);
		return true;
	}

	if(_me.HaveKeyword(`have_complete_vena_quest`))	// 퀘스트 마쳤으면 바로 넘어갈 수 있음
	{
		// 환생을 한번도 하지 않은 경고 메모리얼 캐릭터가 아닐때만 정령무기 체크를 한다.
		if(_me.GetRebirthCount()==0 && !_me.HaveKeyword(`memorial_character`))
		{
			if(_me.GetEgoWeapon().IsValid() &&  _me.GetEgoType()==10) //정령무기랑 계약되었고 그 정령무기를 갖고 있어야
			{
				_me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0114/Iria_SE_filia_Spawn_01`);
				return true;
			}
			else if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`)) //C4 새로운 튜토리얼에선 아이리 없으니 그냥 통과
			{
				_me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0114/Iria_SE_filia_Spawn_01`);
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.53"].SelectRandom());
				return false;
			}
		}
		else
		{
			_me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0114/Iria_SE_filia_Spawn_01`);
			return true;
		}
	}
	else
	{
		if(_me.HaveKeyword(`start_vena_quest`))
		{
			_me.ShowCaption(["event.portal_condition.51"].SelectRandom());
		}
		else
		{
			_me.ShowCaption(["event.portal_condition.52"].SelectRandom());
		}
		return false;
	}

}

//////////////////////////////////////////////////////////////////////////////////
server bool Leave_AntHell(
	character _me,
	object _object,
	string& _sMsg)
// : 개미지옥 탈출해서 빠져나올 때
//////////////////////////////////////////////////////////////////////////////////
{
	_me.AddKeyword(`clearAnthellwithParty`);
	_me.RemoveKeyword(`clearAnthellwithParty`);

/*
	if(_me.IsQuestTried(200325) && !_me.IsQuestCompleted(200325))	// 개미지옥 클리어하기 퀘스트 중
	{
		_me.AddKeyword(`clearAnthellwithParty`);
		DebugOut(`clearAnthellwithParty 키워드 추가`);
		_me.RemoveKeyword(`clearAnthellwithParty`);
		DebugOut(`clearAnthellwithParty 키워드 제거`);
	}
	else
	{
		_me.AddKeyword(`clearAnthellwithParty`);
		DebugOut(`clearAnthellwithParty 키워드 추가2`);
		_me.RemoveKeyword(`clearAnthellwithParty`);
		DebugOut(`clearAnthellwithParty 키워드 제거2`);
	}
*/

	_me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0089/Oasis_from_Desert_underground`);
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_ConnousArena(
	character _me,
	object _object,
	string& _sMsg)
// : 콘누스 아레나
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 503)
	{
		// 503 이상이면 진입 가능하다.
		return true;
	}

	_sMsg =["event.portal_condition.56"];
	return false;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_ConnousMonsterRaidArea(
	character _me,
	object _object,
	string& _sMsg)
// : 메투스 몬스터 레이드 지역
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 503)
	{
		// 503 이상이면 진입 가능하다.
		return true;
	}
	_sMsg =["event.portal_condition.57"];
	return false;
}

/*
	이곳에 불값을 돌려주는 스크립트 함수를 추가하고
	월드 쪽 포탈 이벤트를 Ask ServerScript로 설정, 이 함수의 경로를 적어주면
	이 함수의 리턴값에 따라 이동을 확정해 준다.
*/

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Nubes_From_Rano(
	character _me,
	object _object,
	string& _sMsg)
// : 라노에서 누베스 산맥으로 들어가는 포탈
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 600)
	{
		// 601 이상이면 진입 가능하다.
		return true;
	}
	_sMsg =["event.portal_condition.58"];
	return false;
}

/*
	이곳에 불값을 돌려주는 스크립트 함수를 추가하고
	월드 쪽 포탈 이벤트를 Ask ServerScript로 설정, 이 함수의 경로를 적어주면
	이 함수의 리턴값에 따라 이동을 확정해 준다.
*/

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Vales_From_Giant_Tutorial(
	character _me,
	object _object,
	string& _sMsg)
// : 자이언트 튜토리얼 필드-> 발레스 진입시
//////////////////////////////////////////////////////////////////////////////////
{
	if(_me.IsPet())
	{
		_me.Move(`Iria_NW_main_field/_Iria_NW_main_field_0053/Iria_NW_Vales_Spawn_01`);
		return true;
	}

	if(_me.HaveKeyword(`have_complete_meriel_quest`))	// 퀘스트 마쳤으면 바로 넘어갈 수 있음
	{
		// 환생을 한번도 하지 않고 메모리얼이 아닐 때만 정령무기 체크를 한다.
		if(_me.GetRebirthCount()==0 && !_me.HaveKeyword(`memorial_character`))
		{
			if(_me.GetEgoWeapon().IsValid() &&  _me.GetEgoType()==11) //정령무기랑 계약되었고 그 정령무기를 갖고 있어야
			{
				_me.Move(`Iria_NW_main_field/_Iria_NW_main_field_0053/Iria_NW_Vales_Spawn_01`);
				_me.AddKeyword(`portal_vales`);
				return true;
			}
			else if (IsEnable(`featureTutorialRenewal2010`) extern (`data/script/features.mint`)) //C4 새로운 튜토리얼에선 아이리 없으니 그냥 통과
			{
				_me.Move(`Iria_NW_main_field/_Iria_NW_main_field_0053/Iria_NW_Vales_Spawn_01`);
				_me.AddKeyword(`portal_vales`);
				return true;
			}
			else
			{
				_me.ShowCaption(["event.portal_condition.59"].SelectRandom());
				return false;
			}
		}
		else
		{
			_me.Move(`Iria_NW_main_field/_Iria_NW_main_field_0053/Iria_NW_Vales_Spawn_01`);
			return true;
		}
	}
	else
	{
		if(_me.HaveKeyword(`start_meriel_quest`))
		{
			_me.ShowCaption(["event.portal_condition.60"].SelectRandom());
		}
		else
		{
			_me.ShowCaption(["event.portal_condition.61"].SelectRandom());
		}
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Leave_NubesMaze(
	character _me,
	object _object,
	string& _sMsg)
// : 누베스 산맥 미로 탈출해서 켈라 베이스 캠프쪽으로 빠져나올 때
//////////////////////////////////////////////////////////////////////////////////
{
	_me.AddKeyword(`clearNubesMaze`);
	_me.RemoveKeyword(`clearNubesMaze`);

//	다누에서 포털 처리 하였음. 아래 삭제
//	_me.Move(`Iria_SW_main_field/_Iria_SW_main_field_0161/from_tunnel_S`);
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Glaciea_dungeon(
	character _me,
	object _object,
	string& _sMsg)
// : 빙하던전 진입 제너레이션 처리
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 602)
	{
		DebugOut(`빙하 던전은 G6S2에 입장가능`);
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.62"];
		return false;
	}
}


//////////////////////////////////////////////////////////////////////////////////
server bool EnterRiverViaHippo_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsHuman() || _me.IsElf() || _me.IsGiant())
	{
		if (_me.IsRiding())
		{
			// 내가 탈것에 타고 있는 경우는
			// emergency시에 워프할 이벤트 박스 이름을 저장해 놓는다.
			_me.SetExitOnRideEnd(`Iria_C_main_field/_Iria_C_main_field_0126/hippo_river_01`, `Iria_C_main_field/_Iria_C_main_field_0126/hippo_riverside_start_01`);
			DebugOut(`하마 테스트 1`);
			return true;
		}
		else
		{
			// 내가 탈것에 타고 있지 않은 경우는
			// 비정상적으로 온 경우이므로
			// 적어놓은 곳으로 워프해 버린다.
			_me.Move(`Iria_C_main_field/_Iria_C_main_field_0126/hippo_riverside_start_01`);
			DebugOut(`하마 테스트 2`);
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool ArriveRiversideViaHippo_1(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsHuman() || _me.IsElf() || _me.IsGiant())
	{
		// emergency시에 워프할 이벤트 박스 이름을 지운다.
		_me.SetExitOnRideEnd(``, ``);
		DebugOut(`하마 테스트 3`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool EnterRiverViaHippo_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsHuman() || _me.IsElf() || _me.IsGiant())
	{
		if (_me.IsRiding())
		{
			// 내가 탈것에 타고 있는 경우는
			// emergency시에 워프할 이벤트 박스 이름을 저장해 놓는다.
			_me.SetExitOnRideEnd(`Iria_C_main_field/_Iria_C_main_field_0126/hippo_river_02`, `Iria_C_main_field/_Iria_C_main_field_0126/hippo_riverside_start_02`);
			DebugOut(`하마 테스트 11`);
			return true;
		}
		else
		{
			// 내가 탈것에 타고 있지 않은 경우는
			// 비정상적으로 온 경우이므로
			// 적어놓은 곳으로 워프해 버린다.
			_me.Move(`Iria_C_main_field/_Iria_C_main_field_0126/hippo_riverside_start_02`);
			DebugOut(`하마 테스트 12`);
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool ArriveRiversideViaHippo_2(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.IsHuman() || _me.IsElf() || _me.IsGiant())
	{
		// emergency시에 워프할 이벤트 박스 이름을 지운다.
		_me.SetExitOnRideEnd(``, ``);
		DebugOut(`하마 테스트 13`);
	}
	return true;
}


//////////////////////////////////////////////////////////////////////////////////
server bool OnLeaveMarina(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnLeaveThunderAltar(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	_me.PlayCutScene(`weather_changer_lightning_under`, 0);
//	_me.Move(3300,80470,125710);
//	if (_me.HaveKeyword(`CourcleRuinCutscene_Ruairi`))
//	{
//		_me.PlayCutScene(`weather_changer_center`, 1000);
//	}
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool OnLeaveSunAltar(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	_me.PlayCutScene(`weather_changer_sunshine_under`, 0);
//	_me.Move(3300,85780,125880);
//	if (_me.HaveKeyword(`CourcleRuinCutscene_Ruairi`))
//	{
//		_me.PlayCutScene(`weather_changer_center`, 1000);
//	}
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool OnLeaveSnowAltar(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	_me.PlayCutScene(`weather_changer_snow_under`, 0);
//	_me.Move(3300,83060,122440);
//	if (_me.HaveKeyword(`CourcleRuinCutscene_Ruairi`))
//	{
//		_me.PlayCutScene(`weather_changer_center`, 1000);
//	}
	return true;
}
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_PromotionArea(
	character _me,
	object _object,
	string& _sMsg)
// : 테스트 서버이면 들어간다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetVersion() >= 704)
	{
		return true;
	}

	if (IsPromotionTestOpened())
	{
		// : 테스트 서버이면 들어간다.
		return true;
	}

	_sMsg = ["event.portal_condition.67"];
	return false;
}

/*
	이곳에 불값을 돌려주는 스크립트 함수를 추가하고
	월드 쪽 포탈 이벤트를 Ask ServerScript로 설정, 이 함수의 경로를 적어주면
	이 함수의 리턴값에 따라 이동을 확정해 준다.
*/
//////////////////////////////////////////////////////////////////////////////////
//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
server bool OnEnterTutorialAlby(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if((_me.HaveQuestTemplate(202002) && _me.GetCompletedQuestObjectiveCount(202002)==3) ||(_me.HaveQuestTemplate(212002) && _me.GetCompletedQuestObjectiveCount(212002)==3))
	{
		_me.AddKeyword(`Tutorial_Alby_Portal`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
server bool OnEnterTutorialAlbyAltar(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if((_me.HaveQuestTemplate(202002) && _me.GetCompletedQuestObjectiveCount(202002)==3) ||(_me.HaveQuestTemplate(212002) && _me.GetCompletedQuestObjectiveCount(212002)==3))
	{
		_me.AddKeyword(`Tutorial_Alby_Enter_Altar`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Renes(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	party		_party = _me.GetParty();
	object_list cCharList = _party.GetMemberList();
	int isize = _party.GetMemberNo();


	stdapi	api;
	zone		_zone;
	zone		iz;

	_zone = api.FindEnterableInstantZone(_me);

	int i;
	for(i = 0 ; i < isize ; i++)
	{
		character	player = (character)cCharList.GetValue(i);		// 파티원
		if (player.IsRiding())
		{
			_me.ShowCaption(["event.portal_condition.78"]);
			return false;
		}
	}

	// G9 메인스트림 관련 내용을 먼저 처리해준다.(1회성)
	if (_me.HaveQuestTemplate(290111) && _me.HaveKeyword(`g9_18`) && _me.GetItemNoWithClassId(75222) > 0)	// G9 드래곤의 표식 레네스 입장 아이템
	{
		// 드래곤의 표식 없애주자
		_me.RemoveItemCls(75222);		// 들고 있는 드래곤의 표식 아이템을 모두 없애주자.
		if (_me.IsSelectableTitle(11003))	//드래곤의 기사 타이틀 있는 경우 다른 컷신
		{
			_me.PlayCutScene(`C3G9S1_S#15_2_meet_adniel`);	// 아드니엘의 부름 컷신 틀어주자
		}
		else
		{
			_me.PlayCutScene(`C3G9S1_S#15_meet_adniel`);	// 아드니엘의 부름 컷신 틀어주자
		}

		_me.DoStript(`additemex(id:73181 rewardview:true)`);	// 아드니엘의 뿔피리 주자
		_me.RemoveKeyword(`g9_18`);
		_me.AddKeyword(`g9_19`);
		return false;	// 컷신만 보여주고 들어가진 않는다.
	}
	else if (_me.HaveKeyword(`g8s1_08`))
	{
		if (_me.IsPartyLeader())
		{
			_me.WarpToRenes();
			return true;
		}
		else
		{
			_me.ShowCaption(["event.portal_condition.68"]);
			return false;
		}
	}
	else if (_zone.IsValid())			// 나의 파티 또는 내가 만든 존이 있다면
	{
		if (_zone.GetPlayerCount() >= 8)		// 파티리더만 나가고 동굴에 남은 사람은 파티 탈퇴, 밖의 리더가 파티원 추가 모집해서 입장 -> 이런 식으로 하면 무한히 입장 가능
		{
			_me.ShowCaption(["event.portal_condition.71"]);
			return false;
		}
		else
		{
			bool result = _zone.WarpCharacterTo(_me, `_Iria_NN_dragoncave01_04`, `player_point`);
			if (IsDevelopment())
			{
				if (!result)
				{
					_me.ShowCaption(["event.portal_condition.72"]);
				}

			}
			return result;
		}
	}

	else if (_me.GetItemNoWithClassId(73172) > 0 )		// 레네스 입장템 있고
	{
		if( _me.IsPartyLeader())		// 리더면 존 새로 만들어서 파티입장
		{
			iz = api.CreateInstantZone(_me, `Iria_NN_dragoncave01`, `data/script/event/Renes.mint`, `region_variation_empty.xml`, true);
			if (iz.IsValid())
			{
				if (iz.WarpPartyTo(_party, `_Iria_NN_dragoncave01_04`, `player_point`, 3000))
				{
					_me.RemoveItemCls(73172, 1); // 드래곤의 축복 - 입장 아이템 1개 제거
					return true;
				}
				else
				{
					if (IsDevelopment())
					{
						_me.ShowCaption(["event.portal_condition.73"]);
					}
				}
			}
			else
			{
				if (IsDevelopment())
				{
					_me.ShowCaption(["event.portal_condition.74"]);
				}
			}
			return false;
		}
		else if (!_party.IsValid())		// 개인이면 존 새로 만들어서 개인입장
		{
			iz = api.CreateInstantZone(_me, `Iria_NN_dragoncave01`, `data/script/event/Renes.mint`, `region_variation_empty.xml`, true);
			if (iz.IsValid())
			{
				if (iz.WarpCharacterTo(_me, `_Iria_NN_dragoncave01_04`, `player_point`))
				{
					_me.RemoveItemCls(73172, 1); // 드래곤의 축복 - 입장 아이템 1개 제거
					return true;
				}
				else
				{
					if (IsDevelopment())
					{
						_me.ShowCaption(["event.portal_condition.75"]);
					}
				}

			}
			else
			{
				if (IsDevelopment())
				{
					_me.ShowCaption(["event.portal_condition.76"]);
				}
			}
			return false;
		}
		else			// 만들어진 존이 없는데 파티원이 클릭하면 안 만든다.
		{
			_me.ShowCaption(["event.portal_condition.77"]);
			return false;
		}
	}
	else
	{
		_me.ShowCaption(["event.portal_condition.69"]);
		return false;
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Go_HardmodeDungeon(
	character _me,
	object _object,
	string& _sMsg)
// : 하드모드 던전 로비로 입장하기 위한 함수이다.
//////////////////////////////////////////////////////////////////////////////////
{

	// 누렙 250 이상이어야 입장가능 아니면 테섭이나 개발버전에서는 5만 넘어도 가능하다.

	if ((!IsTestServer() && !IsDevelopment()) && (_me.GetCumLevel()+_me.GetLevel()>=250))
	{
		return true;
	}
	else
	if ((IsTestServer() || IsDevelopment()) && (_me.GetCumLevel()+_me.GetLevel()>=5))
	{
		return true;
	}
	else
	{
		_sMsg	= ["event.portal_condition.70"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
//---------- 틴 지역 처음왔을 때 컷신 재생토록 설정
server bool OnEnterTinArea(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	if (!_me.HaveKeyword(`tin_tutorial_guide`) && _me.GetRebirthCount()==0 && !_me.HaveKeyword(`FirstLoginAtIria`))
	{
		_me.PlayCutScene(`tuto_meet_tin`, 0);
		_me.AddKeyword(`tin_tutorial_guide`);
	}
	return true;
}


//////////////////////////////////////////////////////////////////////////////////
//---------- 스톤헨지 지역에 오면 드래곤 소환 못 하던거 해제한다
server bool OnEnterStonehenge(
	character _me,
	object _object,
	string& _sMsg)
// :
//////////////////////////////////////////////////////////////////////////////////
{
	_me.LockDragonSupport(false);
	return true;

}


//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Senmag_From_Emainmacha(
	character _me,
	object _object,
	string& _sMsg)
// : 이멘마하 -> 센마이
//////////////////////////////////////////////////////////////////////////////////
{
	// 센마이 길드전 준비중/진행중일 때에는 길드전 필드로 이동할지를 물어본다.
	if (GetBattleGroundState(`Senmag_Guild_BattleGround`) == `prepare` ||
		GetBattleGroundState(`Senmag_Guild_BattleGround`) == `process`)
	{
		if (FindGuildInSenmagBattleGround(_me))
		{
			AskEnterSenmagBattleGround(_me, 1);
		}
		else
		{
			_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_W_p/inportal_W`);
		}
	}
	else
	{
		_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_W_p/inportal_W`);
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Senmag_From_Gairechhill(
	character _me,
	object _object,
	string& _sMsg)
// : 가이레흐 언덕-> 센마이
//////////////////////////////////////////////////////////////////////////////////
{
	// 센마이 길드전 준비중/진행중일 때에는 길드전 필드로 이동할지를 물어본다.
	// 일단 임시로 prepare면 무조건 이동하도록 설정
	if (GetBattleGroundState(`Senmag_Guild_BattleGround`) == `prepare` ||
		GetBattleGroundState(`Senmag_Guild_BattleGround`) == `process`)
	{
		if (FindGuildInSenmagBattleGround(_me))
		{
			AskEnterSenmagBattleGround(_me, 2);
		}
		else
		{
			_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_E_p/inportal_E`);
		}
	}
	else
	{
		_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_E_p/inportal_E`);
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Senmag_From_Senmagtown(
	character _me,
	object _object,
	string& _sMsg)
// : 센마이 하우징 지역 -> 센마이
//////////////////////////////////////////////////////////////////////////////////
{
	// 센마이 길드전 준비중/진행중일 때에는 길드전 필드로 이동할지를 물어본다.
	// 일단 임시로 prepare면 무조건 이동하도록 설정
	if (GetBattleGroundState(`Senmag_Guild_BattleGround`) == `prepare` ||
		GetBattleGroundState(`Senmag_Guild_BattleGround`) == `process`)
	{
		if (FindGuildInSenmagBattleGround(_me))
		{
			AskEnterSenmagBattleGround(_me, 3);
		}
		else
		{
			_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_S_p/from_Sen_Mag_town`);
		}
	}
	else
	{
		_me.Move(`Ula_Sen_Mag/_Ula_Sen_Mag_S_p/from_Sen_Mag_town`);
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool IsSkiingEvent()
// : 스키 이벤트 도중인지 테스트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`skiing_event_2008`)
	|| IsCurrentEvent(`skiing_2009_korea`)
	|| IsCurrentEvent(`skiing_2010_japan`)
	|| IsCurrentEvent(`skiing_2010_korea`))

	{
		return true;
	}
	else
	{
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_01(
	character _me,
	object _object,
	string& _sMsg)
// : 첫번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 1)
		{
			_me.SetSkiGateIndex(2);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 2)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_02(
	character _me,
	object _object,
	string& _sMsg)
// : 두번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 2)
		{
			_me.SetSkiGateIndex(3);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 3)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 1)
			{
				_me.AddSkiPenalty(2 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(3);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_03(
	character _me,
	object _object,
	string& _sMsg)
// : 세번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 3)
		{
			_me.SetSkiGateIndex(4);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 4)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 2)
			{
				_me.AddSkiPenalty(3 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(4);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_04(
	character _me,
	object _object,
	string& _sMsg)
// : 네번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 4)
		{
			_me.SetSkiGateIndex(5);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 5)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 3)
			{
				_me.AddSkiPenalty(4 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(5);
				_me.StartSkiEventTimeOverSchedule();
			}

		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_05(
	character _me,
	object _object,
	string& _sMsg)
// : 다섯번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 5)
		{
			_me.SetSkiGateIndex(6);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 6)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 4)
			{
				_me.AddSkiPenalty(5 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(6);
				_me.StartSkiEventTimeOverSchedule();
			}

		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_06(
	character _me,
	object _object,
	string& _sMsg)
// : 여섯번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 6)
		{
			_me.SetSkiGateIndex(7);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 7)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 5)
			{
				_me.AddSkiPenalty(6 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(7);
				_me.StartSkiEventTimeOverSchedule();
			}

		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_07(
	character _me,
	object _object,
	string& _sMsg)
// : 일곱번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 7)
		{
			_me.SetSkiGateIndex(8);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 8)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 6)
			{
				_me.AddSkiPenalty(7 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(8);
				_me.StartSkiEventTimeOverSchedule();
			}

		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_08(
	character _me,
	object _object,
	string& _sMsg)
// : 여덟번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 8)
		{
			_me.SetSkiGateIndex(9);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 9)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 7)
			{
				_me.AddSkiPenalty(8 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(9);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_09(
	character _me,
	object _object,
	string& _sMsg)
// : 아홉번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 9)
		{
			_me.SetSkiGateIndex(10);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 10)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 8)
			{
				_me.AddSkiPenalty(9 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(10);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_10(
	character _me,
	object _object,
	string& _sMsg)
// : 열번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 10)
		{
			_me.SetSkiGateIndex(11);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 11)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 9)
			{
				_me.AddSkiPenalty(10 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(11);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}


//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_11(
	character _me,
	object _object,
	string& _sMsg)
// : 열한번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 11)
		{
			_me.SetSkiGateIndex(12);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 12)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 10)
			{
				_me.AddSkiPenalty(11 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(12);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_12(
	character _me,
	object _object,
	string& _sMsg)
// : 열두번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 12)
		{
			_me.SetSkiGateIndex(13);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 13)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 11)
			{
				_me.AddSkiPenalty(12 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(13);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_13(
	character _me,
	object _object,
	string& _sMsg)
// : 열세번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 13)
		{
			_me.SetSkiGateIndex(14);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 14)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 12)
			{
				_me.AddSkiPenalty(13 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(14);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_14(
	character _me,
	object _object,
	string& _sMsg)
// : 열네번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 14)
		{
			_me.SetSkiGateIndex(15);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 15)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 13)
			{
				_me.AddSkiPenalty(14 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(15);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_15(
	character _me,
	object _object,
	string& _sMsg)
// : 열다섯번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 15)
		{
			_me.SetSkiGateIndex(16);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 16)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 14)
			{
				_me.AddSkiPenalty(15 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(16);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_16(
	character _me,
	object _object,
	string& _sMsg)
// : 열여섯번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 16)
		{
			_me.SetSkiGateIndex(17);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 17)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 15)
			{
				_me.AddSkiPenalty(16 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(17);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_17(
	character _me,
	object _object,
	string& _sMsg)
// : 열일곱번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 17)
		{
			_me.SetSkiGateIndex(18);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 18)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 16)
			{
				_me.AddSkiPenalty(17 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(18);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_18(
	character _me,
	object _object,
	string& _sMsg)
// : 열여덟번째 스키 게이트
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 18)
		{
			_me.SetSkiGateIndex(19);
			_me.StartSkiEventTimeOverSchedule();
		}
		else if (_me.GetSkiGateIndex() == 19)
		{
			// 아무 일도 하지 않는다.
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 17)
			{
				_me.AddSkiPenalty(18 - _me.GetSkiGateIndex());
				_me.SetSkiGateIndex(19);
				_me.StartSkiEventTimeOverSchedule();
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_SkiGate_19(
	character _me,
	object _object,
	string& _sMsg)
// : 열아홉번째 스키 게이트 - 결승점
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsSkiingEvent() && _me.GetSkiGateIndex() > 0)
	{
		if (_me.GetSkiGateIndex() == 19)
		{
			// 골인~
			_me.EndSkiEvent(true);
		}
		else
		{
			if (_me.GetSkiGateIndex() <= 18)
			{
				_me.AddSkiPenalty(19 - _me.GetSkiGateIndex());

				// 골인~
				_me.EndSkiEvent(true);
			}
		}
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnEnterDunbartonSowField(
	character _me,
	object _object,
	string& _sMsg)
// : 던바튼 남쪽 밭에 들어갔을 때의 처리
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`halloween2008_usa`) &&
		_me.CheckFastStringID(`/scarecrow/`))
	{
		_me.EnterDunbartonSowField();
	}

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Goto_NekoDungeon_1stFloor(
	character _me,
	object _object,
	string& _sMsg)
// : 네코던전 로비->1층으로 가는 처리
//////////////////////////////////////////////////////////////////////////////////
{
	dungeon _dungeon = _me.GetCurrentDungeon();
	dungeon_floor _floor = _dungeon.GetFloor(0);

	puzzle_template template_seed = _floor.GetPuzzleTemplateByCustomSectionIndex(0, 0);
	string warp_seed = template_seed.FindPuzzle(`monster1`).Get(`warp_seed`);

	int warp_section;
	if (warp_seed == `0`)
	{
		warp_section = 4;

		puzzle_template template_warproom = _floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
		string chest_here = template_warproom.FindPuzzle(`monster1`).Get(`chest`);
		if (chest_here == `1`)
		{
			// 상자방이므로 다른 곳에 워프한다.
			warp_section = 0;
		}
	}
	else
	{
		warp_section = 20;
		puzzle_template template_warproom = _floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
		string chest_here = template_warproom.FindPuzzle(`monster1`).Get(`chest`);
		if (chest_here == `1`)
		{
			// 상자방이므로 다른 곳에 워프한다.
			warp_section = 24;
		}
	}

	puzzle_template template = _floor.GetPuzzleTemplateByCustomSectionIndex(warp_section, 0);
	template.FindPuzzle(`monster1`).GetPlace(0).WarpCharacter(_me);
	_me.ShowCaption(["event.portal_condition.86"]);

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnEnterEventHall(
	character _me,
	object _object,
	string& _sMsg)
// : 공연장에 들어갔을 때의 처리
//////////////////////////////////////////////////////////////////////////////////
{
	_me.OnEnterEventHall();

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnLeaveEventHall(
	character _me,
	object _object,
	string& _sMsg)
// : 공연장에서 나왔을 때의 처리
//////////////////////////////////////////////////////////////////////////////////
{
	_me.OnLeaveEventHall();

	return false;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Tara_Castle(
	character _me,
	object _object,
	string& _sMsg)
// : 타라 왕성 진입 키워드 처리
//////////////////////////////////////////////////////////////////////////////////
{

	if (_me.HaveKeyword(`can_enter_tara_castle`) || IsBanquetOpened() || IsEnable(`featureFreeCastle`) extern (`data/script/features.mint`))   // 입장 키워드가 있다면
	{
		_me.RemoveKeyword(`can_enter_tara_castle`);
		return true;
	}
	else if (_me.GetTitle() == 60000 || _me.GetTitle() ==  60001 || _me.GetRegionId() !=401) // 데브캣이나 gm은 그냥 입장, 그림자도 그냥 입장
	{
		return true;
	}
	else
	{
		_sMsg = ["event.portal_condition.91"];
		return false;
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool LeaveTaraCastleEntrance(
	character _me,
	object _object,
	string& _sMsg)
// : 타라 왕성 입구에서 멀어질 때 호출되는 함수
//////////////////////////////////////////////////////////////////////////////////
{
	if (_me.HaveKeyword(`can_enter_tara_castle`))    // 입장 타이틀이 있다면
	{
		_me.RemoveKeyword(`can_enter_tara_castle`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnLennoxRoom(
	character _me,
	object _object,
	string& _sMsg)
// : 타라 왕성 입구에서 멀어질 때 호출되는 함수
//////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`레녹스방`);

	if(_me.IsInEventZone(`Tara_castle_1F/_Tara_castle_1F/castle1_room1`))
	{
		// DebugOut(`방 안에 있다`);
		_me.Move(410, 24466, 6496);	// r:410 x:24466 y:6496
		_me.SetDirection(-3.031);
	}
	else
	{
		// DebugOut(`방 밖에 있다.`);
		if(_me.HaveKeyword(`g12_lennox`))
		{
			_me.Move(410, 25024, 6501);
			_me.SetDirection(0.123);
		}
		else
		{
			_me.ShowCaption(["event.portal_condition.101"]);
		}
	}

	return true;
}
