////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 던전 스크립트
//
//										    marlin fecit, begins at 2004. 06. 10
//											capella@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : 던전이 생성되었을 때 캐릭터들의 진입 처리 등을 해준다.
////////////////////////////////////////////////////////////////////////////////
{
//	_dungeon.GetCreationTime(); //던전 생성시간을 기록하도록 세팅
	_dungeon.ScheduleAlarm(180); //3분 있다 OnAlarm(dungeon _dungeon)을 불러라


}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{	
	if (CheckValidate(_dungeon) && !_player.IsPet())
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);

		if (leader.HaveKeyword(`g2`) && leader.IsQuestCompleted(220040)) //G2 중이고 이상형퀫스트를 완료했을때에만
		{
			leader.AddGameQuest(220050,0);
		}
	}
	_player.DisableSkill(40001); // 팔라딘 스킬 사용못하도록 막음
	_player.DisableSkill(41001); // 다크나이트 스킬 사용못하도록 막음
}
/*
	이 코드 위험합니다만, 솔플 던전이라 문제가 발생하지 않으므로 그대로 둡니다.
	if((_dungeon.GetPlayerLeader()==_player) && !_player.IsPet())
	{
`	}

	이런 식으로 처리해야 한답니다.   by HanStone

*/
////////////////////////////////////////////////////////////////////////////////
server void OnRPLeaderEntered(
	dungeon _dungeon,
	character _leader)
// : 이 던전에 RP leader가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnAllRPMemberEntered(
	dungeon _dungeon)
// : 이 던전에 예약된 모든 RP 캐릭터들이 입장 완료했을 때 불리는 함수
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterWarped(
	dungeon _dungeon,
	character _player,
	int _iOldFloor,
	int _iNewFloor)
// : 캐릭터가 층을 옮길 때 (0층은 로비를 뜻한다.)
////////////////////////////////////////////////////////////////////////////////
{
	if (_iOldFloor != 0)		//로비에서 이동은, 파티원이 아직 안들어왔을 수 있으므로 체크를 생략.
	{
		CheckValidate(_dungeon);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnSectionComplete(
	dungeon _dungeon,
	int floor,
	int section,
	int region,
	int x,
	int y)
// : 캐릭터가 섹션 끝의 문을 열었을때
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
/*	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`bossroom_OgreBros`);
	}
*/
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
}

////////////////////////////////////////////////////////////////////////////////
server bool CheckValidate(
	dungeon _dungeon) 
// : 이 던전에 필요한 인원이 유지되고 있는지 체크하여 리턴한다.
////////////////////////////////////////////////////////////////////////////////
{
	//string timestring=_dungeon.Get();
	object_list cMemberList = _dungeon.GetCreatorList();

	// 이 던전은 반드시 1명이 와야 한다.
	if (cMemberList.GetSize() == 1)
	{
		character leader = _dungeon.GetPlayerLeader();
		
		//리더가 아직 던전에 있어야한다
		if (leader.IsValid())
		{
			return true;
		}
	}

	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	//인원이 맞지 않으면 각각 쫓아내고, 종료컷신을 틀어준다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.LeaveDungeon();
		cChar.PlayCutScene(`G2_LeaveDungeon`);
	}
	return false;
}
////////////////////////////////////////////////////////////////////////////////
server void OnAlarm(dungeon _dungeon)
// : 알람이 울렸다.
////////////////////////////////////////////////////////////////////////////////

/* 로컬라이즈 문제 수정을 위해 원본을 주석처리하고, 아래 수정본을 붙입니다. 2005.10.26. qwerty

{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int	i;
	int alarminterval =180;
	string noticemessage =["dungeon.g2_24_bangor_barri_dungeon.2"];
	
	int expiretime=_dungeon.GetAge()/60; //던전 생성 시간(초)를 60으로 나눠 분으로 환산
	
	if(expiretime>=48)
	{
		alarminterval = 60;
		noticemessage =["dungeon.g2_24_bangor_barri_dungeon.3"];
	}
	
	if(expiretime>=57)
	{
		noticemessage =["dungeon.g2_24_bangor_barri_dungeon.4"];
	}
	
	if(expiretime>=60)
	{
		// 너 나가라
		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			cChar.LeaveDungeon();
		}
	}

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.ShowCaption(["dungeon.g2_24_bangor_barri_dungeon.1"]+ToString(60-expiretime) +noticemessage);
	}

	_dungeon.ScheduleAlarm(alarminterval); //alarminterval 초 후에 다시 이 함수가 불림
}
*/
{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int	i;
	int alarminterval =180;
	string noticemessage =["dungeon.g2_24_bangor_barri_dungeon.5"];
	
	int expiretime=_dungeon.GetAge()/60; //던전 생성 시간(초)를 60으로 나눠 분으로 환산
	
	if(expiretime>=48)
	{
		alarminterval = 60;
		noticemessage =["dungeon.g2_24_bangor_barri_dungeon.6"];
	}
	
	if(expiretime>=57)
	{
		noticemessage =["dungeon.g2_24_bangor_barri_dungeon.7"];
	}
	
	if(expiretime>=60)
	{
		// 너 나가라
		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			cChar.LeaveDungeon();
		}
	}

	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.ShowCaption(noticemessage<<ToString(60-expiretime));
	}

	_dungeon.ScheduleAlarm(alarminterval); //alarminterval 초 후에 다시 이 함수가 불림
}
////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	player.EnableSkill(40001); // 팔라딘 스킬 사용하도록 풀어줌
	player.EnableSkill(41001); // 다크나이트 스킬 사용하도록 풀어줌
}