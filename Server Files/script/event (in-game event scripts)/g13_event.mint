
//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G12 Script
//////////////////////////////////////////////////////////// component of Mabinogi


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_C4G13_prologue_Morrighan(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.DoStript(`additemex(id:75471 rewardview:true)`);
	me.ShowCaption(["event.g13_event.1"]);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_C4G13_prologue_EX_avon(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.SetDirection(-1.5);
	me.AddKeyword(`g13_03_01`);
	me.RemoveKeyword(`g13_02_01`);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_C4G13_3_2_EX_Fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(501, 65858, 58194);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_C4G13_4_4_EX_follow_fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(501, 65858, 58194);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_C4G13_5_2_EX_dual_fail(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(501, 65858, 58194);
}


//////////////////////////////////////////////////////////////////////////////////
server void OnG13MainQuestClear(
	character me,					// 퀘스트 완료한 유저
	 int _idQuest)		// 완료된 퀘스트 ID
// :	퀘스트 완료시 호출
//////////////////////////////////////////////////////////////////////////////////
{

	if (_idQuest == 294201)
	{
		if (me.GetItemNoWithClassId(75462)<1)
		{
			me.DoStript(`additemex(id:75462 rewardview:true)`);
		}
		if (IsDevelopment())
		{
			me.AddGameQuest(294202, 1);
			me.ShowCaption(["event.g13_event.2"]);
		}
		else
		{
			me.AddGameQuest(294202, 1);		// 5분 후에 배달
		}
	}
	else if (_idQuest == 294202)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294203, 1);		
			me.ShowCaption(["event.g13_event.3"]);			
		}
		else
		{
			me.AddGameQuest(294203, 1);		// 0분 후에 배달
		}
	}

	else if (_idQuest == 294203)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294303, 1);		
			me.ShowCaption(["event.g13_event.4"]);						
		}
		else
		{
			me.AddGameQuest(294303, 6);		// 1분 후에 배달
		}
	}
	else if (_idQuest == 294303)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294204, 1);		
			me.ShowCaption(["event.g13_event.5"]);						
		}
		else
		{
			me.AddGameQuest(294204, 6);		// 1분 후에 배달
		}
	}	
	else if (_idQuest == 294204)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294205, 1);		
			me.ShowCaption(["event.g13_event.6"]);						
		}
		else
		{
			me.AddGameQuest(294205, 1);		// 즉시 준다.
		}
	}
	else if (_idQuest == 294205)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294206, 1);		
			me.ShowCaption(["event.g13_event.7"]);						
		}
		else
		{
			me.AddGameQuest(294206, 1);		// 즉시 준다.
		}
	}	
	// 튜토리얼 리뉴얼 유저면 여기서 튜토리얼로 넘어감
	else if (_idQuest == 294206)
	{
		if (me.HaveKeyword(`character_new_tutorial_2010`) && !me.IsQuestTried(202054))
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(202054, 1);
				me.ShowCaption(["event.g13_event.8"]);
			}
			else
			{
				me.AddGameQuest(202054, 6);		// 1분 후에 배달
			}		
		}
		else
		{
			if (IsDevelopment())
			{
				me.AddGameQuest(294207, 1);		
				me.ShowCaption(["event.g13_event.9"]);
			}
			else
			{
				me.AddGameQuest(294207, 6);		// 1분 후에 배달
			}				
		}
	}	

	
	else if (_idQuest == 294207)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294208, 1);		
			me.ShowCaption(["event.g13_event.10"]);						
		}
		else
		{
			me.AddGameQuest(294208, 1);		// 1분 후에 배달
		}
	}
	
	else if (_idQuest == 294208)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294209, 1);		
			me.ShowCaption(["event.g13_event.11"]);						
		}
		else
		{
			me.AddGameQuest(294209, 1);		// 1분 후에 배달
		}
	}

	else if (_idQuest == 294209)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294210, 1);		
			me.ShowCaption(["event.g13_event.12"]);						
		}
		else
		{
			me.AddGameQuest(294210, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294210)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294211, 1);		
			me.ShowCaption(["event.g13_event.13"]);						
		}
		else
		{
			me.AddGameQuest(294211, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294211)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294212, 1);		
			me.ShowCaption(["event.g13_event.14"]);						
		}
		else
		{
			me.AddGameQuest(294212, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294212)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294213, 1);		
			me.ShowCaption(["event.g13_event.15"]);						
		}
		else
		{
			me.AddGameQuest(294213, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294213)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294214, 1);		
			me.ShowCaption(["event.g13_event.16"]);						
		}
		else
		{
			me.AddGameQuest(294214, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294214)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294215, 1);		
			me.ShowCaption(["event.g13_event.17"]);						
		}
		else
		{
			me.AddGameQuest(294215, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294215)
	{
		//me.PlayCutScene(`C4G13_2_END_Previews`);
	
		/*if (IsTestServer())
		{
			me.PlayCutScene(`C4G13_1_END_Previews`);
		}
		else*/
		if (IsDevelopment())
		{
			me.AddGameQuest(294216, 1);		
			me.ShowCaption(["event.g13_event.18"]);						
		}
		else
		{
			me.AddGameQuest(294216, 1);		// 1분 후에 배달
		}
		
	}	

	else if (_idQuest == 294216)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294217, 1);		
			me.ShowCaption(["event.g13_event.19"]);						
		}
		else
		{
			me.AddGameQuest(294217, 1);		// 1분 후에 배달
		}
		//me.DoStript(`additemex(id:17042 prefix:207 rewardview:true)`);
	}	

	else if (_idQuest == 294217)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294218, 1);		
			me.ShowCaption(["event.g13_event.20"]);						
		}
		else
		{
			me.AddGameQuest(294218, 1);		// 1분 후에 배달
		}
	}	

	else if (_idQuest == 294218)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294219, 1);		
			me.ShowCaption(["event.g13_event.21"]);						
		}
		else
		{
			me.AddGameQuest(294219, 1);		// 1분 후에 배달
		}
	}	
	else if (_idQuest == 294219)
	{
		if (IsDevelopment())
		{
			me.AddGameQuest(294220, 1);		
			me.ShowCaption(["event.g13_event.22"]);						
		}
		else
		{
			me.AddGameQuest(294220, 1);		// 1분 후에 배달
		}
	}		
	// G13 메인스트림 엔딩
	else if (_idQuest == 294220)
	{
		// g13 클리어 저널
		if(!me.AchievementHas(1137))
		{
			me.AchievementAdd(1137);
		}

		me.AddKeyword(`g13_complete`);

		me.RemoveKeyword(`g13`);
		me.RemoveKeyword(`g13_01`);
		me.RemoveKeyword(`g13_02`);
		me.RemoveKeyword(`g13_03`);
		me.RemoveKeyword(`g13_04`);
		me.RemoveKeyword(`g13_05`);
		me.RemoveKeyword(`g13_06`);
		me.RemoveKeyword(`g13_07_1`);   
		me.RemoveKeyword(`g13_07_2`); 
		me.RemoveKeyword(`g13_08`);
		me.RemoveKeyword(`g13_09`);
		me.RemoveKeyword(`g13_10`);
		me.RemoveKeyword(`g13_11`);
		me.RemoveKeyword(`g13_12`);
		me.RemoveKeyword(`g13_13`);
		me.RemoveKeyword(`g13_14`);

		me.RemoveKeyword(`g13_01_01`);
		me.RemoveKeyword(`g13_01_02`);
		me.RemoveKeyword(`g13_02_01`);
		me.RemoveKeyword(`g13_03_01`);
		me.RemoveKeyword(`g13_04_01`);
		me.RemoveKeyword(`g13_05_01`);
		me.RemoveKeyword(`g13_05_02`);
		me.RemoveKeyword(`g13_06_01`);
		me.RemoveKeyword(`g13_07_01`);
		me.RemoveKeyword(`g13_08_01`);
		me.RemoveKeyword(`g13_08_02`);
		me.RemoveKeyword(`g13_09_01`);
		me.RemoveKeyword(`g13_10_01`);
		me.RemoveKeyword(`g13_11_01`);
		me.RemoveKeyword(`g13_12_01`);
		me.RemoveKeyword(`g13_13_01`);
		me.RemoveKeyword(`g13_14_01`);
		me.RemoveKeyword(`g13_15_01`);
		me.RemoveKeyword(`g13_16_01`);
		me.RemoveKeyword(`g13_17_01`);
		me.RemoveKeyword(`g13_18_01`);
		me.RemoveKeyword(`g13_19_01`);

		// 튜토리얼 리뉴얼 유저인데 하다 말고 왔으면 다시 튜토리얼 이어짐
		if (!me.IsQuestTried(202065) && me.HaveKeyword(`character_new_tutorial_2010`))
		{
			me.AddGameQuest(202065, 6);		// 1분 후에 배달. 열매 채집 퀘스트
		}		

	}
}
