//////////////////////////////////////////////////////////////////////////////////
//	1. 서버 필수 함수
//

//////////////////////////////////////////////////////////////////////////////////
//
server void OnZoneCreate(zone _iz)
{
	// 사용 변수 초기화
	_iz.SetData(`bTalk`, false);		// 현재 NPC와 대화중인가 체크 (NPC와 대화 시작할 때 true, 대화 끝날 때 false로 바꿔줘야 한다.)
	_iz.SetData(`sTalkNPC`, `6`);
	
	// 시간마다 NPC와 대화하는 것 체크
	// 입장 후 30초에서 1분 뒤에 대화 가능한 NPC가 있는가 체크
	int iRandom = Random(30) + 30;
	iRandom = iRandom * 1000;
	_iz.SetTimer(`Npc_Check`, 0 , iRandom);

	_iz.SetData(`NPC1`, true);
	_iz.SetData(`NPC2`, true);
	_iz.SetData(`NPC3`, true);
	_iz.SetData(`NPC4`, true);
	_iz.SetData(`NPC5`, true);
	_iz.SetData(`NPC6`, true);

	character creator = _iz.GetCreator();
	creator.ShowCaption(["event.confessional.1"], 3000);

	// 의자 프랍 생성
	_iz.CreateProp(`chair`, 42051, 523, 22, 791, 3.14, `stand`);
}
//
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//
server void OnZoneClosed(zone _iz)
{
	
}
//
//////////////////////////////////////////////////////////////////////////////////

server void OnPropAppear(zone _iz, prop _prop)
{
	
}

server void OnPropStateChange(zone _iz, prop _prop, string _oldstate, string _newstate)
{
	
}

server void OnPropDisappear(zone _iz, prop _prop)
{
	
}

server void OnCharacterEnter(zone _iz, character _char)
{
}

server void OnCharacterLeave(zone _iz, character _char)
{
}

server void OnCharacterDie(zone _iz, character _char, character _killer)
{
	
}

server void OnTimer(zone _iz, string name, dword userdata)
{
	// DebugOut(`[Confessional] Called OnTimer: `+name);
	if(_iz.IsValid())
	{
		bool bTalk;
		bool bNPCTalk;
		_iz.GetData(`bTalk`, bTalk);
		int iRandom;

		// NPC와 대화 중이 아닐 때만 처리한다.
		if(!bTalk)
		{
			character creator = _iz.GetCreator();

			// 게임 시간을 가져와서 대화할 NPC를 결정해준다.
			int day, hour, min;
			GetGameTime(day, hour, min);

			/*
				_iz.GetData(`NPC2`, bNPCTalk);
				if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
				{
					_iz.SetData(`bTalk`, true);
					_iz.SetData(`sTalkNPC`, `2`);		// 퍼거스
					creator.TalkToNPC(`_confessional`);
				}
				else
				{
					creator.ShowCaption("아무도 오지 않는 것 같다.\n다른 시간에 다시 찾아오자.");
				}
			*/

			// 퀘스트 진행 중이면 항상 메인스트림 NPC가 나온다.
			if(creator.HaveQuestTemplate(293009) && creator.GetCompletedQuestObjectiveCount(293009) == 2 && creator.HaveKeyword(`g12_08`))
			{
				_iz.GetData(`NPC1`, bNPCTalk);
				if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
				{
					_iz.SetData(`bTalk`, true);
					_iz.SetData(`sTalkNPC`, `1`);		// 장서관 사서
					creator.TalkToNPC(`_confessional`);
				}
				else
				{
					creator.ShowCaption(["event.confessional.2"]);
				}
			}
			
			else if(hour >= 8 && hour < 12)
			{
				iRandom = Random(100);

				if(iRandom < 50)
				{
					_iz.GetData(`NPC2`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `2`);		// 퍼거스
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption(["event.confessional.3"]);
					}
				}
				else
				{	
					_iz.GetData(`NPC3`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `3`);		// 왕성 경비병
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption(["event.confessional.4"]);
					}
				}

			}
			/*
			else if(hour >= 12 && hour < 16)
			{
				// 퀘스트 진행 중인가 체크한다.
				if(creator.HaveQuestTemplate(293009) && creator.GetCompletedQuestObjectiveCount(293009) == 2 && creator.HaveKeyword(`g12_08`))
				{
					_iz.GetData(`NPC1`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `1`);		// 장서관 사서
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption("아무도 오지 않는 것 같다.\n다른 시간에 다시 찾아오자.");
					}
				}
				// 퀘스트 진행 중이 아닐 때는 G12 메인스트림 NPC는 등장하지 않는다.
				else
				{
					creator.ShowCaption("아무도 오지 않는 것 같다.\n다른 시간에 다시 찾아오자.");
				}

			}
			*/
			else if(hour >= 16 && hour < 20)
			{
				iRandom = Random(100);

				if(iRandom < 50)
				{
					_iz.GetData(`NPC4`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `4`);		// 왕성 메이드
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption(["event.confessional.5"]);
					}
			
				}
				else if(iRandom < 85)
				{
					_iz.GetData(`NPC5`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `5`);		// 리리스
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption(["event.confessional.6"]);
					}
				}
				else
				{
					creator.ShowCaption(["event.confessional.7"]);
				}
			}
			else if(hour >= 20 && hour < 24)
			{
				iRandom = Random(100);

				if(iRandom < 20)
				{
					_iz.GetData(`NPC6`, bNPCTalk);
					if(bNPCTalk)		// NPC랑 대화 안 했을 때만 등장
					{
						_iz.SetData(`bTalk`, true);
						_iz.SetData(`sTalkNPC`, `6`);		// 나크
						creator.TalkToNPC(`_confessional`);
					}
					else
					{
						creator.ShowCaption(["event.confessional.8"]);
					}
				}
				else
				{
					creator.ShowCaption(["event.confessional.9"]);
				}
			}
			else
			{
				creator.ShowCaption(["event.confessional.10"]);
			}

			// 대화 시작했으니 30초 ~ 1분 30초 뒤에 다시 대화 체크를 한다.
			iRandom = Random(30) + 60;
			iRandom = iRandom * 1000;
			_iz.SetTimer(`Npc_Check`, 0 , iRandom);

		}
		else
		{
			// 대화 중일 경우 30초 ~1분 30초 뒤에 다시 대화가 가능한지 체크한다.
			iRandom = Random(30) + 60;
			iRandom = iRandom * 1000;
			_iz.SetTimer(`Npc_Check`, 0 , iRandom);
		}
	}
}