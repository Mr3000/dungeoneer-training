//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project FashionShow Script
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnStartState(
	string contestName,					// 대회명
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

	if (contestName == `trial`)
	{
		if (strStateName == `notallow`)
		{
			Announce(8, ["event.fashionshow_event.1"]);
			
			string theme = SetTheme();
			SetFashionShowContestTheme(`trial`,  theme);

		}
		else if (strStateName == `contest`)
		{
			Announce(8, ["event.fashionshow_event.2"]);		
		}	
	}
	else if (contestName == `final`)
	{
		if (strStateName == `notallow`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.3"]);		

			string theme = SetTheme();
			SetFashionShowContestTheme(`final`,  theme);		
		}
		else if (strStateName == `contest`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.4"]);		
		}	
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnEndState(
	string contestName,					// 대회명
	string strStateName)				// 상태명
//////////////////////////////////////////////////////////////////////////////////
{	
	if (contestName == `trial`)
	{

		if (strStateName == `application`)
		{
			Announce(8, ["event.fashionshow_event.5"]);		
		}
		else if (strStateName == `contest`)
		{
			Announce(8, ["event.fashionshow_event.6"]);	
			SetFashionShowContestTheme(`trial`,  ``);
		}
	}
	else if (contestName == `final`)
	{
		if (strStateName == `application`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.7"]);		
		}
		else if (strStateName == `contest`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.8"]);		
			SetFashionShowContestTheme(`final`,  ``);
		}	
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnAnnounceTime(
	string contestName,					// 대회명
	string strStateName)				// 상태명
//////////////////////////////////////////////////////////////////////////////////
{
	if (contestName == `trial`)
	{

		if (strStateName == `announce`)
		{
			Announce(8, ["event.fashionshow_event.9"]);		
		}		
		else if (strStateName == `contest`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.10"]);		
		}
	}
	else if (contestName == `final`)
	{
		if (strStateName == `announce`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.11"]);		
		}
		else if (strStateName == `contest`)
		{
			AnnounceAllChannel(8, ["event.fashionshow_event.12"]);		
		}	
	}
}

//////////////////////////////////////////////////////////////////////////////////
server string SetTheme(
)
// 날짜에 따라 테마를 정의한다.
// 유저들이 정확히 추측할 수 없게 한다.
//////////////////////////////////////////////////////////////////////////////////
{
	string theme;

	int themeID=Random(3);

	if(themeID==0)			{		theme = `friend`;		}
	else if(themeID==1)		{		theme = `confident`;		}
	else if(themeID==2)		{		theme = `love`;		}
	
	return theme;
	
}


//////////////////////////////////////////////////////////////////////////////
server void GiveRewardToFashionShowApplicant(
	string index,			//대회 타입         
	object_list _char_list	,	//참가자 그룹
	int grade			)
// 참가자의 보상을 정의한다.
//////////////////////////////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	for (i = 0; i < _char_list.GetSize();  i++)
	{
		cChar = (character)_char_list.GetValue(i);
		if(index==`trial`)
		{
			// 하급 경품획득
			cChar.DoStript(`additemex(id:73192 rewardview:true)`);			

			// 이벤트 기간에 키워드 공급
			if(IsCurrentEvent(`g10s2update2009_korea`))
			{
				cChar.AddKeyword(`g10s2_fashion_gallery`);
			}

			//상위권 50% 안에 든 사람에게 참가권을 준다.
			if((i+1)*2<=_char_list.GetSize())
			{
				cChar.DoStript(`additemex(id:52100 expire:10080)`);			
			}


		}
		else if(index==`final`)
		{
			if(i<10)
			{
				// 10위 안이면 상급 경품획득
				cChar.DoStript(`additemex(id:73194 rewardview:true)`);
			}
			else
			{
				// 10위 밖이면 중급 경품획득
				cChar.DoStript(`additemex(id:73193 rewardview:true)`);
			}

			if(i<5)	// 5위 안이면 의상을 공급 (성별에 따라 다르다.)
			{
				if(cChar.IsFemale())
				{	
					cChar.DoStript(`additemex(id:15405 rewardview:true)`);
				}
				else
				{
					cChar.DoStript(`additemex(id:15421 rewardview:true)`);
				}
			}

			if(i<1)
			{
				// 1위면 패션 센스가 넘치는 타이틀을 획득하게 한다.
				cChar.DoStript(`addtitle(10079)`);

				// 이벤트 기간에 키워드 공급
				if(IsCurrentEvent(`g10s2update2009_korea`))
				{
					cChar.AddKeyword(`g10s2_fashion_winnner`);
				}

			}
			cChar.DoStript(`knowtitle(10079)`);

			// 이벤트 기간에 키워드 공급
			if(IsCurrentEvent(`g10s2update2009_korea`))
			{
				cChar.AddKeyword(`g10s2_fashion_gallery`);
			}

		}
		else if(index==`free` && grade==2)
		{
			if(i==0)
			{
				// 하급 경품획득
				cChar.DoStript(`additemex(id:73192 rewardview:true)`);
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////////////
server void GiveRewardToFashionShowGallery(
	string index,			// 대회 타입
	object_list _char_list	,	// 관람객 그룹
	int grade,				// 상시 패션쇼라면 그 등급
	int Applicant)			// 참가 인원 수
// 관람자의 보상을 정의한다.
//////////////////////////////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	int galleryCnt;	// 관람객 수
	galleryCnt = _char_list.GetSize();

	for (i = 0; i < _char_list.GetSize();  i++)
	{
		cChar = (character)_char_list.GetValue(i);
		if(index==`trial`)			// 예선
		{
			// 하급 경품획득
			cChar.DoStript(`additemex(id:73192 rewardview:true)`);			
		
			// 이벤트 기간에 키워드 공급
			if(IsCurrentEvent(`g10s2update2009_korea`))
			{
				cChar.AddKeyword(`g10s2_fashion_gallery`);
			}
		}
		
		else if(index==`final`)	// 본선
		{
			// 중급 경품획득
			cChar.DoStript(`additemex(id:73193 rewardview:true)`);

			// 이벤트 기간에 키워드 공급
			if(IsCurrentEvent(`g10s2update2009_korea`))
			{
				cChar.AddKeyword(`g10s2_fashion_gallery`);
			}
		}
		else if(index==`free` && grade==2)		// 상시 패션쇼
		{
			//	관람객이 40인 이하면 모두에게 하급 제공
			//	개발에서라면 4인 이하에게 모두 하급 제공
			if((!IsDevelopment() && galleryCnt<40) ||  (IsDevelopment() && galleryCnt<4))
			{
				cChar.DoStript(`additemex(id:73192 rewardview:true)`);
			}
			//	관람객이 40인 이상이면 받을 확률이 비례해서 작아짐
			//	평균적으로 인원수에 관계없이 30개씩 배분
			else
			{
				if(!IsDevelopment())
				{
					 if(Random(100)<=4000/galleryCnt)
					 {
						cChar.DoStript(`additemex(id:73192 rewardview:true)`);
					}
				}
				else
				{
					 if(Random(100)<=400/galleryCnt)
					 {
						cChar.DoStript(`additemex(id:73192 rewardview:true)`);
					}
				}
			}
		}
	}
}




