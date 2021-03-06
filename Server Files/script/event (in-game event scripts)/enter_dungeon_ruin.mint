//////////////////////////////////////////////////////////////////////////////
//                                             Mabinogi Project Dungeon Script
//                                                        던전 라우팅 스크립트
//
//                                   eias erinys fecit, begins at 2004. 06. 02
//                                   eias@nexon.co.kr, sheplany@nownuri.net
//////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////
server bool
	RouteDungeon(
		object_list _party,	// in)		진입하려고 하는 파티 (파티장은 0번이다)
		string& _dungeon,	// in/out)	던전 템플릿 이름
		string& _option,	// out)		던전 생성 옵션
		item _item,		// in)		유저가 던진 아이템
		string& _reply)		// out)	스크립트에서 실패시킬 경우 메시지를 적을 수 있다.
// : 던전에 들어갈 때 불리는 이벤트 핸들러
//   적절한 던전 템플릿을 리턴해야 한다
//////////////////////////////////////////////////////////////////////////////
{

	character	leader = (character)_party.GetValue(0);		// 일단 리더부터 정하고
	int playerCnt = _party.GetSize();

	if (_dungeon.EqualToWithoutCase(`G7RP_ruway_longa_desert_dungeon`))
	{
		if (!leader.HaveKeyword(`g7s3_05`))
		{
			_reply = ["event.enter_dungeon_ruin.1"];
			return false;
		}
		else if (_party.GetSize() >= 2)		// 혼자와야 되는데 여럿이 왔다.
		{
			_reply = ["event.enter_dungeon_ruin.2"];
			return false;
		}
		else if(leader.HasSummonedPet())
		{
			_reply = ["event.enter_dungeon_ruin.6"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`longa_desert_dungeon_RP_Atrata`))
	{
		if (!leader.HaveKeyword(`g7s4_06`))
		{
			_reply = ["event.enter_dungeon_ruin.3"];
			return false;
		}
		else if (_party.GetSize() >= 2)		// 혼자와야 되는데 여럿이 왔
		{
			_reply = ["event.enter_dungeon_ruin.2"];
			return false;
		}
		else if(leader.HasSummonedPet())
		{
			_reply = ["event.enter_dungeon_ruin.7"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`longa_desert_dungeon_RP_Effie_Brother`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(280204)==4 && !leader.GetCompletedQuestObjectiveCount(280212)==4)
		{
			_reply = ["event.enter_dungeon_ruin.4"];
			return false;
		}
		else if (_party.GetSize() >= 2)		// 혼자와야 되는데 여럿이 왔
		{
			_reply = ["event.enter_dungeon_ruin.2"];
			return false;
		}
		else if(leader.HasSummonedPet())
		{
			_reply = ["event.enter_dungeon_ruin.8"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`par_dungeon_g8s1`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(280203)==2 && !leader.GetCompletedQuestObjectiveCount(280211)==2)
		{
			_reply = ["event.enter_dungeon_ruin.5"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`par_dungeon_WindBreaker`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(20107) == 2)
		{
			_reply = ["event.enter_dungeon_ruin.9"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`karuforest_WindBreaker_dungeon`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(20107) == 4)
		{
			_reply = ["event.enter_dungeon_ruin.10"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`longa_desert_final_shot_dungeon`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(20108)==5)
		{
			_reply = ["event.enter_dungeon_ruin.11"];
			return false;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`longa_desert_andras_secret_dungeon`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(290301)==4)
		{
			_reply = ["event.enter_dungeon_ruin.12"];
			return false;
		}
	}
	// 아르넨 RP
	else if (_dungeon.EqualToWithoutCase(`maizplain_dungeon_Arneng_RP`))
	{
		if (!leader.HaveKeyword(`g10_13`))		// 진행단계 체크
		{
			_reply = ["event.enter_dungeon_ruin.13"];
			return false;
		}
		else if (_party.GetSize() >= 2)		// 혼자와야 되는데 여럿이 왔다.
		{
			_reply = ["event.enter_dungeon_ruin.14"];
			return false;
		}
		else if(leader.HasSummonedPet())		// 펫 꺼낸 상태에선 입장 불가
		{
			_reply = ["event.enter_dungeon_ruin.15"];
			return false;
		}
	}
	// 보이트 RP
	else if (_dungeon.EqualToWithoutCase(`maizplain_dungeon_Voight_RP`))
	{
		if (!leader.HaveKeyword(`g10_14`))		// 진행단계 체크
		{
			_reply = ["event.enter_dungeon_ruin.16"];
			return false;
		}
		else if (_party.GetSize() != 2)		// 2인만 입장 가능.
		{
			_reply = ["event.enter_dungeon_ruin.17"];
			return false;
		}
		else				// 펫 꺼낸 상태에선 입장 불가
		{
			int i;
			for (i = 0 ; i < playerCnt ; i++)
			{
				character _char = (character)_party.GetValue(i);
				if (_char.HasSummonedPet())
				{
					_reply = ["event.enter_dungeon_ruin.18"];
					return false;
				}
			}
		}
	}


	else if (_dungeon.EqualToWithoutCase(`longa_desert_dungeon_G10`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(291014)==3)
		{
			_reply = ["event.enter_dungeon_ruin.19"];   // G10S2EX 에 패치
			return false;
		}
		if (!GetDay() == 6 && !leader.GetTitle() == 60001 && !IsEnable(`featureG10Polishing`) extern (`data/script/features.mint`))	// 토요일이거나 데브캣 타이틀 있거나
		{
			_reply = ["event.enter_dungeon_ruin.20"];
			return false;
		}
	}


	else if (_dungeon.EqualToWithoutCase(`Par_dungeon_G10`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(291012)==3)
		{
			_reply = ["event.enter_dungeon_ruin.21"];
			return false;
		}
	}


	else if (_dungeon.EqualToWithoutCase(`karuforest_dungeon_G10`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(291010)==3)
		{
			_reply = ["event.enter_dungeon_ruin.22"];
			return false;
		}
	}

	else if (_dungeon.EqualToWithoutCase(`MaizPlain_dungeon_G10`))
	{
		if (!leader.GetCompletedQuestObjectiveCount(291011)==3)
		{
			_reply = ["event.enter_dungeon_ruin.23"];
			return false;
		}
	}



	return true;
}

