//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project Joust Script
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnAnnounceTime(
	int index,
	string strStateName)
//////////////////////////////////////////////////////////////////////////////////
{
	bool bServerMatch = IsServerJoust(index);
	
	if (strStateName == `announce`)
	{
		if (bServerMatch)
		{	
			AnnounceAllChannel(8, ["event.joust_event.1"]);
		}
		else
		{
			Announce(8, ["event.joust_event.2"]);
		}
	}
	else if (strStateName == `application`)
	{
		if (bServerMatch)
		{	
			AnnounceAllChannel(8, ["event.joust_event.15"]);
		}
		else
		{
			Announce(8, ["event.joust_event.16"]);
		}
	}	
}

//////////////////////////////////////////////////////////////////////////////////
server void OnStartJoustState(
	int index,					// 대회Index
	string strStateName)				// 상태명
//////////////////////////////////////////////////////////////////////////////////
{
	// Announce(캡션타입, 메세지) - 현재 채널에 알림
	// AnnounceAllChannel(캡션타입, 메세지) - 전체 채널에 알림
	// 캡션타입:
	//	CAPTION_TYPE_HELP		= 1,
	//	CAPTION_TYPE_NOTICE		= 2,
	//	CAPTION_TYPE_REGION		= 3,
	//	CAPTION_TYPE_MESSAGE		= 4,
	//	CAPTION_TYPE_MINI		= 5,
	//	CAPTION_TYPE_EVENT		= 6,
	//	CAPTION_TYPE_EVENT_HAVE_NOT_STANDING	= 7,
	//	CAPTION_TYPE_CONTEST		= 8,
	//	CAPTION_TYPE_USER_NOTICE	= 9,

	/*

	HELP 는 중앙 상단에 한줄에 스크롤 되는 캡션이고

	NOTICE 는 HELP 바로 밑에 한줄 스크롤

	REGION 은 중앙 1/3 지점에 찍히고

	MESSAGE 는 중앙 1/2 지점에 찍히고

	Mini 는 좌측 1/4 지점에 작게 찍히고

	EVENT 는 5분 간격 녹색인 점만 빼면 NOTICE 와 동일

	CONTEST 는 EVENT 와 동일
	*/

	bool bServerMatch = IsServerJoust(index);

	character joustNPC1 = FindCharacterByName(`_alastrina`);
	character joustNPC2 = FindCharacterByName(`_deniela`);
	character joustNPC3 = FindCharacterByName(`_rhisiart`);

	if (strStateName == `application`)
	{
		if (bServerMatch)
		{
			AnnounceAllChannel(8, ["event.joust_event.3"]);
		}
		else
		{
			Announce(8, ["event.joust_event.4"]);
		}		
	}
	else if (strStateName == `tournament`)
	{
		// 적정인원이 채워졌는지 확인한다.
		int iApplicantCount = GetJoustApplicantCount(index);
		int iMinApplicantCount = GetJoustMinApplicantCount(index);
		
		if (!IsDevelopment() && iApplicantCount < iMinApplicantCount)
		{
			if (bServerMatch)
			{
				AnnounceAllChannel(8, ["event.joust_event.17"]);
			}
			else
			{
				Announce(8, ["event.joust_event.18"]);
			}	
		}
		else
		{
			if (bServerMatch)
			{
				AnnounceAllChannel(8, ["event.joust_event.5"]);
			}
			else
			{
				Announce(8, ["event.joust_event.6"]);
			}				
			// 귀빈석 NPC 스폰
			/*
			if(joustNPC1.IsValid())
			{
				joustNPC1.Show();
			}
			if(joustNPC2.IsValid())
			{
				joustNPC2.Show();
			}
			if(joustNPC3.IsValid())
			{
				joustNPC3.Show();
			}
			*/					
			// 불꽃놀이 시작
			StartFireworkShow(2);
		}		
	}	
	else if (strStateName == `rewarding`)
	{	
		// 불꽃놀이 시작
		StartFireworkShow(2);
		
		if (bServerMatch)
		{		
			// 1등과 2등에게 점수를 준다.
			character	cChar;
			object_list rewardlist = GetJoustRewardList(index, 1);
			int i;
			string strMessage = ["event.joust_event.7"];
			if (rewardlist.GetSize() > 0)
			{				
				for (i = 0; i < rewardlist.GetSize(); i++)
				{
					cChar = (character)rewardlist.GetValue(i);
					if (cChar.IsValid())
					{
						if (i == 0)
						{
							strMessage += ["event.joust_event.8"];
						}
						cChar.IncreaseJoustPoint(96);		
						cChar.PlayCutScene(`cooking_contest`);	
						cChar.ShowCaption(["event.joust_event.19"]);			
						strMessage += cChar.GetDisplayName();						
						if (i < (rewardlist.GetSize() - 1))
						{
							strMessage += `, `;
						}
					}
				}		
				
				if (rewardlist.GetSize() == 1)
				{
					object_list secondlist = GetJoustRewardList(index, 2);
					
					if (secondlist.GetSize() > 0)
					{						
						for (i = 0; i < secondlist.GetSize(); i++)
						{
							cChar = (character)secondlist.GetValue(i);
							if (cChar.IsValid())
							{
								if (i == 0)
								{
									strMessage += ["event.joust_event.9"];
								}
								cChar.IncreaseJoustPoint(42);									
								strMessage += cChar.GetDisplayName();								
								if (i < (secondlist.GetSize() - 1))
								{
									strMessage += `, `;
								}
							}
						}
					}
				}
				if ((GetLocale().LowerCase() == `korea`) || (GetLocale().LowerCase() == `japan`)) //입니다. 쓰는 국가가 두 곳 뿐이다.
				{
					strMessage += ["event.joust_event.10"];
				}				
			}			
			AnnounceAllChannel(8, strMessage);
		}
		else
		{
			Announce(8, ["event.joust_event.11"]);
		}	
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnEndJoustState(
	int index,					// 대회Index
	string strStateName)				// 상태명
//////////////////////////////////////////////////////////////////////////////////
{
	bool bServerMatch = IsServerJoust(index);	
	if (strStateName == `tournament`)
	{		
		character joustNPC1 = FindCharacterByName(`_alastrina`);
		character joustNPC2 = FindCharacterByName(`_deniela`);
		character joustNPC3 = FindCharacterByName(`_rhisiart`);
	
		if(joustNPC1.IsValid())
		{
			joustNPC1.Hide();
		}
		if(joustNPC2.IsValid())
		{
			joustNPC2.Hide();
		}
		if(joustNPC3.IsValid())
		{
			joustNPC3.Hide();
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnApplyJoust(
	int index,					// 대회Index
	character applicant)				// 지원자
// : 마창 대회 접수시 호출
//////////////////////////////////////////////////////////////////////////////////
{
//	string strMsg = applicant.GetDisplayName() + `님께서 마창대회에 접수하였습니다.`;
//	Announce(8, strMsg);	

	string strMsg = ["event.joust_event.12"];
	applicant.ShowCaptionEx(strMsg, `region`);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnEndJoustGame(
	int index,					// 대회Index
	int	rank,					// 승수
	character winner,				// 승자
	character looser,				// 패자	
	string strWinner,				// 중간에 로그아웃했을 수 있기 대문에 승자이름과 패자이름을 따로 보낸다.
	string strLooser)								
// : 마창 대회 접수시 호출
//////////////////////////////////////////////////////////////////////////////////
{
	// 일일대회 패배 - 1점
	// 일일대회 승리 - 3점
	// 서버대회 패배 - 3점
	// 서버대회 승리 - 9점 

	bool bServerMatch = IsServerJoust(index);

	if (bServerMatch)
	{
		winner.IncreaseJoustPoint(9);
		looser.IncreaseJoustPoint(3);
		winner.AddServerJoustWinCount();
		looser.AddServerJoustLoseCount();
	}
	else
	{
		winner.IncreaseJoustPoint(3);
		looser.IncreaseJoustPoint(1);
		winner.AddDailyJoustWinCount();
		looser.AddDailyJoustLoseCount();
		
		int wincount = winner.GetJoustWeekWinCount();			
		int value = wincount / 2;		
		if ((value * 2) == wincount)
		{
			// 서버 대회 출전권을 지급한다.
			winner.DoStript(`additemex(id:52098 expire:10080)`);			
		}
	}

	if (IsCurrentEvent(`joust_2008_korea`))
	{
		winner.AddKeyword(`event_joust`);
	}
	
	string strMsg = ["event.joust_event.13"]+ strWinner + ["event.joust_event.14"]+ strLooser;	
//	Announce(8, strMsg);
	winner.ShowCaptionEx(strMsg, `region`);
	looser.ShowCaptionEx(strMsg, `region`);
}

