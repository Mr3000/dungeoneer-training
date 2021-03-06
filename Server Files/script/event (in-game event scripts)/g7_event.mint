//////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project G3 Script
//									G3용 스크립트 모음집
//
//									HanStone begins at 2005. 6. 12
//									hanstone@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g7_s4_mirrorwitch(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if(me.HaveKeyword(`g7s4_04`))
	{
		me.RemoveKeyword(`g7s4_04`);
		me.AddKeyword(`g7s4_05`);
		me.DoStript(`additemex(id:53261 quality:90 rewardview:true)`);
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
server void OnCutSceneEnded_Atrata_RP_Fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.LeaveDungeon();

	int			i;
	character		member;
	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		member = (character)_cMemberList.GetValue(i);
		member.LeaveDungeon();
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Atrata_RP_Success(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	if(me.HaveKeyword(`g7s4_06`))
	{
		me.RemoveKeyword(`g7s4_06`);
		me.AddKeyword(`g7s4_07`);
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
server void OnCutSceneEnded_Atrata_Memory_Fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
}