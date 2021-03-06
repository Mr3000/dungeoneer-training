//////////////////////////////////////////////////////////////////////////////////
//                                          Mabinogi Project Script - BattleGround
//                                                                  전장 지역 제어
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnChangeState(string _name, string _state)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	if (_name == `Senmag_Guild_BattleGround`)
	{
		OnChangeState_Senmag_Guild_BattleGround(_state);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnChangeState_Senmag_Guild_BattleGround(string _state)
// : 길드전에서 State가 바뀔때 불리는 함수
//////////////////////////////////////////////////////////////////////////////////
{
	if (_state == `closed`)
	{
		DebugOut(`battleground closed`);
	}
	else if (_state == `prepare`)
	{
		DebugOut(`battleground prepare`);
	}
	else if (_state == `process`)
	{
		DebugOut(`battleground process`);
	}
	else if (_state == `completing`)
	{
		DebugOut(`battleground completing`);
		
		object_list cMemberList = GetAllMemberSenmagBattleGround();
		int i;

		for(i = 0; i < cMemberList.GetSize(); i++)
		{
			character member = (character)cMemberList.GetValue(i);
			int personalpoint = GetCharPointSenmagBattleGround(member);

			if (personalpoint >= 1)
			{
				string strReward = `modify(exp, ` + ToString(personalpoint*5 ) + `, rewardview:true)`;
				member.DoReward(strReward);
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server dword Senmag_BattleGround_CalculateFlagHolderNum(int _membernum)
// : 현재 참여중인 멤버 수에 따라 깃발 소유자 수를 계산함. 코드에서 불리는 함수
//////////////////////////////////////////////////////////////////////////////////
{
	if (_membernum == 0) return 0;
	else return (_membernum / 12) * 2 + 1;
}