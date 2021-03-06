//////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project G3 Script
//									G3용 스크립트 모음집
//
//									HanStone begins at 2005. 6. 12
//									hanstone@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_01_a_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.AddKeyword(`g3`);
	me.AddKeyword(`g3_02`);
	me.AddKeyword(`g3_01_BrokenSeal`); 
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_02_a_warptootherworld(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(84,13037+10*Random(50),11136+10*Random(50));
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_05_a_RuairiBeDarkKnight(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(31,13176,14608);	//반호르로 이동
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_06_e_MeetRuairi(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	character cChar;
	int i;
	int regId, posX, posY;

	GetTargetPosition(me, regId, posX, posY) extern (`data/script/korea/npc/common.mint`);
	//프라이스 위치 구해오는 부분. 
	
	me.Move(regId, posX, posY);

	for (i = 0; i < _cMemberList.GetSize();  i++)
	{
		cChar = (character)_cMemberList.GetValue(i);
		cChar.Move(regId, posX, posY);
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_19_a_EndingDragon(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	{
		if(!me.HaveKeyword(`g3_LoveStory_TransGender`) && me.HaveKeyword(`g3_15_HiddenB`))
		{
			if(me.IsFemale())
			{
				me.Move(52,40776,39131);
			}
			else
			{
				me.Move(14,41618,44058);
			}
		}
		else
		{
			me.Move(`Ula_Bangor/_Ula_Bangor/SP_Bangor_Square`);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_g3_11_a_fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.LeaveDungeon();
	me.Resurrect();
	int wound = me.GetWound();
	me.SetWound(me.GetLifeMax());
	me.ModifyLife(wound);
}