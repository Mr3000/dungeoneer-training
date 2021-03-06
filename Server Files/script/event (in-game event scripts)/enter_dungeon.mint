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
	// 이 상황은 있을 수 없지만 그래도 안전 코드
	if (_party.GetSize() <= 0) return false;

	if (_item.GetClassId()==75042
	||_item.GetClassId()==75043
	||_item.GetClassId()==75044
	||_item.GetClassId()==75045
	||_item.GetClassId()==75046
	||_item.GetClassId()==75047
	||_item.GetClassId()==75048
	||_item.GetClassId()==75049
	||_item.GetClassId()==75050)
	{
		_reply = ["event.enter_dungeon.121"];
		return false;
	}

	// 요리 대회용 음식은 제단에 바칠 수 없다.
	if (_item.IsExpired() || _item.IsCookingContestFood())
	{
		_reply = ["event.enter_dungeon.121"];
		return false;
	}

	character leader = (character)_party.GetValue(0);

	// 대만 퍼즐 이벤트가 진행중인 경우
	if (IsCurrentEvent(`puzzle2008_taiwan`))
	{
		int partyNum = _party.GetSize();
		int i;
		character cChar;
/*		string InitSwitch;

		switch(Random(4))
		{
			case(0)
			{
				InitSwitch = `switch_counter_0`;
			}
			case(1)
			{
				InitSwitch = `switch_counter_1`;
			}
			case(2)
			{
				InitSwitch = `switch_counter_2`;
			}
			case(3)
			{
				InitSwitch = `switch_counter_3`;
			}
			default
			{}
		}
*/
		for (i = 0; i < partyNum; i++)
		{
			cChar = (character)_party.GetValue(i);

			if ((cChar.GetItemNoWithClassId(65041) + cChar.GetItemNoWithClassId(65042) + cChar.GetItemNoWithClassId(65043) + cChar.GetItemNoWithClassId(65044)) > 1)
			{
				_reply = ["event.enter_dungeon.178"];
				return false;
			}
			cChar.RemoveKeyword(`switch_counter_1`);
			cChar.RemoveKeyword(`switch_counter_2`);
			cChar.RemoveKeyword(`switch_counter_3`);
			cChar.AddKeyword(`switch_counter_0`);
			cChar.AddKeyword(`switch flag`);
		}
	}

///////////////////////////////////////////////////////////////////
////// 알비 던전에 이런 아이템들을 던지면 딴 데로 보낸다
///////////////////////////////////////////////////////////////////
	if (_dungeon.EqualToWithoutCase(`TirCho_Alby_Dungeon`))//원래 알비던전에 갈 예정인디
	{

		// G12S1 트레보의 통행증 외에는 마을 주민 구출 던전으로 안 보낸다.
		if(
			(leader.HaveQuestTemplate(202002) && leader.GetCompletedQuestObjectiveCount(202002)==3)
			|| (leader.HaveQuestTemplate(202012) && leader.GetCompletedQuestObjectiveCount(202012)==3)
			|| (leader.HaveQuestTemplate(202022) && leader.GetCompletedQuestObjectiveCount(202022)==3)
			|| (leader.HaveQuestTemplate(212002) && leader.GetCompletedQuestObjectiveCount(212002)==3)
		)
		{
			if (_item.GetClassId() != 63180)
			{
				_reply = ["event.enter_dungeon.191"];
				return false;
			}

		}
		//new 튜토리얼에서는 트레보 통행증이 아니라 레이널드 통행증이다.
		else if (leader.HaveQuestTemplate(202060) && leader.GetCompletedQuestObjectiveCount(202060)==1)
		{
			if (_item.GetClassId() != 63256)
			{
				_reply = ["event.enter_dungeon.201"];
				return false;
			}
		}

		//2010 new 튜토리얼에선 처음에 일단 말콤의 반지 퀘스트가 시작된다.
		//기존 마을 주민 구출 던전 갈 때처럼 다른 거 넣으면 no! dame!!
		if (leader.HaveQuestTemplate(202055) && leader.GetCompletedQuestObjectiveCount(202055)==2)
		{
			if (_item.GetClassId() != 63257)
			{
				_reply = ["event.enter_dungeon.202"];
				return false;
			}
		}


		//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
		if(leader.HaveQuestTemplate(202002) && leader.GetCompletedQuestObjectiveCount(202002)==3)
		{
			leader.AddKeyword(`Tutorial_Alby_Drop_Item`);
		}
		if(leader.HaveQuestTemplate(212002) && leader.GetCompletedQuestObjectiveCount(212002)==3)
		{
			leader.AddKeyword(`Tutorial_Alby_Drop_Item`);
		}
		if(leader.HaveQuestTemplate(202055) && leader.GetCompletedQuestObjectiveCount(212002)==2)
		{
			leader.AddKeyword(`Tutorial_Alby_Drop_Item`);
		}

		if (_item.GetClassId() == 63116) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.57"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 알비 1인 중급 던전으로 보낸다
					_dungeon = `TirCho_Alby_Middle_1_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.58"];
					return false;
				}
			}
		}

		if (IsCurrentEvent(`whiteday2009_overseas`) && (_item.GetClassId() == 63200))
		{
			//화이트데이 던전
			_dungeon = `TirCho_Alby_Whiteday_Dungeon`;
			return true;
		}



		if (_item.GetClassId() == 90017)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `TirCho_Alby_Middle_2_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 63117)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.59"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 알비 2인 중급 던전
					_dungeon = `TirCho_Alby_Middle_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.60"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 90018)
		{
			//4인 던전 테스트를 위해서
			_dungeon = `TirCho_Alby_Middle_4_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 63118)
		{
			if(_item.IsExpired())
			{
				// 알비 4인 중급 던전
				_reply = ["event.enter_dungeon.61"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 4)
				{
					_dungeon = `TirCho_Alby_Middle_4_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.62"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 63101 )
		{
			//알비 하급
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.63"];
				return false;
			}
			else
			{
				_dungeon = `TirCho_Alby_Low_Dungeon`;
				return true;
			}
		}

		// 알비 상급 관련
		if (_item.GetClassId() == 63159)		// 알비 상급 1인 통행증
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.59"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 알비 1인 상급 던전
					_dungeon = `TirCho_Alby_High_1_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.67"];
					return false;
				}
			}
		}

		// 알비 PC방 던전
		if (_item.GetClassId() == 63265)		// 알비 PC방 통행증
		{
			if(leader.IsGameRoomPlayer())
			{
				if (_party.GetSize() == 1)
				{
					// 알비 1인 상급 던전
					_dungeon = `TirCho_Albypcbang_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.216"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.217"];
				return false;
			}
		}

		// 알비 PC방 상급 던전
		if (_item.GetClassId() == 63262)		// 알비 상급 PC방 통행증
		{
			if(leader.IsGameRoomPlayer())
			{
				if (_party.GetSize() == 1)
				{
					// 알비 1인 상급 던전
					_dungeon = `TirCho_Albypcbang_High_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.218"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.219"];
				return false;
			}
		}

		if (_item.GetClassId() == 90020)
		{
			// 알비 상급 3인 테스트
			_dungeon = `TirCho_Alby_High_3_Dungeon`;
			_option = `bossroom=\"1\"`;
			return true;
		}

		if (_item.GetClassId() == 63160)		// 알비 상급 3인 통행증
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.59"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 알비 3인 상급 던전
					_dungeon = `TirCho_Alby_High_3_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.7"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 90021)
		{
			// 알비 상급 무제한 테스트
			_dungeon = `TirCho_Alby_High_Dungeon`;
			_option = `bossroom=\"1\"`;
			return true;
		}

		if (_item.GetClassId() == 63161)		// 알비 상급 무제한 통행증
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.59"];
				return false;
			}
			else
			{
				// 알비 상급 무제한 던전
				_dungeon = `TirCho_Alby_High_Dungeon`;
				_option = `bossroom=\"1\"`;
				return true;
			}
		}

		if (_item.GetClassId() == 73103)
		{
			//트레보의 사람구하기 RP
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`RP_Trefor_Failed_3`) || leader.HaveKeyword(`RP_Trefor_Failed_2`))
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `RP_Trefor_TirCho_Alby_Dungeon2`;

						return true;
					}
					else return false;
				}
				else
				if (leader.HaveKeyword(`RP_Trefor_Complete`))
				{
					_reply = ["event.enter_dungeon.50"];
					return false;
				}
				else
				if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
				{
					_dungeon = `RP_Trefor_TirCho_Alby_Dungeon`;
					return true;
				}
				else return false;

			}
			else
			{
				_reply = ["event.enter_dungeon.1"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73107) //라사의 원드
		{
			//딜리스와 라사의 술주정뱅이 RP
			if (_party.GetSize() == 2)
			{
				if (leader.HaveKeyword(`RP_LassarDilys_Complete`))
				{
					_reply = ["event.enter_dungeon.51"];
					return false;
				}
				else
				if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
				{
					_dungeon = `RP_LassarDilys_TirCho_Alby_Dungeon`;
					return true;
				}
				else return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.2"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73108) 	//거대거미 스크롤
		{
			//거대거미 RP
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`RP_Monster_GiantSpider_complete`))
				{
					_reply = ["event.enter_dungeon.52"];
					return false;
				}
				else
				if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
				{
					_dungeon = `RP_Monster_GiantSpider`;
					return true;
				}
				else return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.3"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73109) //케이틴의 달걀
		{
			//병아리 RP
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`RP_Monster_Chicken_complete`))
				{
					_reply = ["event.enter_dungeon.53"];
					return false;
				}
				else
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `RP_Monster_Chicken`;
						return true;
					}
					else return false;

				}
			}
			else
			{
				_reply = ["event.enter_dungeon.4"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73002)	//타르라크의 로켓
		{
			if (_party.GetSize() == 3)
			{
				if (leader.HaveKeyword(`g1_03`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G1 타르라크/마리/루에리의 첫 번째RP 던전
							_dungeon = `G1RP_05_TirCho_Alby_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.5"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.6"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.7"];
				return false;
			}
		} else
		if (_item.GetClassId() == 90005)	//쥬보크소드
		{
			_dungeon = `TirCho_Alby_FountainTest_high_Dungeon`;
					// 프라이빗 던전,   위치저장 여신상,       마지막 여신상
			_option = `private=\"true\" savestatueid=\"10032\" laststatueid=\"10032\"`;

				return true;
		}

		if (_item.GetClassId() == 75014)//G3_06 여신상 복구 알비던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Alby`)
					&& (
						(leader.IsQuestTried(230013) && !leader.IsQuestCompleted(230013))
						|| (leader.IsQuestTried(230046) && !leader.IsQuestCompleted(230046))
					)
				)
				{
					_dungeon = `TirCho_Alby_Dungeon_Recover`;
					_option = `private=\"true\"`;	// savestatueid=\"10042\" laststatueid=\"10042\"`;

					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}

		if (_item.GetClassId() == 90011) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.57"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 알비 허브프랍 테스트 던전
					_dungeon = `TirCho_Alby_HerbTest_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.58"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 90012) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.57"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 알비 허브프랍 테스트 던전
					_dungeon = `TirCho_Alby_DungeonNPCTest_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.58"];
					return false;
				}
			}
		}

		// 알비 초보자 이벤트 던전 - uhihiho 2006/10/10
		if (_item.GetClassId() == 63150 )
		{
			if (_party.GetSize() >= 2)
			{
				_dungeon = `TirCho_Alby_Japan_Event_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.143"];
				return false;
			}
		}

		// 알비 초보자 이벤트 던전 - dochigun 2007/05/31
		// 인원수 제한 없는 통행증
		if (_item.GetClassId() == 63164 )
		{
			_dungeon = `TirCho_Alby_Japan_Event_Dungeon`;
			return true;
		}

		// 튜토리얼 리뉴얼 프로토 타입 - 트레보. 임시로 트레보의 통행증. - uhihiho
		if (_item.GetClassId() == 63171 || _item.GetClassId() == 63180)
		{
			if (_party.GetSize() == 1)
			{
				if (
					leader.IsQuestCompleted(202002) || leader.IsQuestCompleted(202012) || leader.IsQuestCompleted(202022) || leader.IsQuestCompleted(212002) ||
					leader.HaveKeyword(`TirChonaill_Tutorial_Judging`) || leader.HaveKeyword(`TirChonaill_Tutorial_Perceiving`)
				)
				{
					_reply = ["event.enter_dungeon.148"];
					return false;
				}
				else
				{
					//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
					if((leader.HaveQuestTemplate(202002) && leader.GetCompletedQuestObjectiveCount(202002)==3) || (leader.HaveQuestTemplate(212002) && leader.GetCompletedQuestObjectiveCount(212002)==3))
					{
						leader.AddKeyword(`Tutorial_Alby_Drop_Trefor_Dagger`);
					}
					_dungeon = `TirCho_Alby_Dungeon_Tutorial_Ranald`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.58"];
				return false;
			}
		}

		// 튜토리얼 리뉴얼 프로토 타입 - 말콤. 임시로 말콤의 통행증. - uhihiho
		if (_item.GetClassId() == 63172 || _item.GetClassId() == 63181)
		{
			if (_party.GetSize() == 1)
			{
				_dungeon = `TirCho_Alby_Dungeon_Tutorial_Malcolm`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.58"];
				return false;
			}
		}

		// 2010 new 튜토리얼용 말콤의 반지 찾기 던전
		if (_item.GetClassId() == 63257)
		{
			if (_party.GetSize() == 1)
			{
				_dungeon = `TirCho_Alby_Dungeon_Tutorial_2010_Malcolm`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.58"];
				return false;
			}
		}

		// 2010 new 튜토리얼용 말썽꾸러기 꼬마 구출 던전
		if (_item.GetClassId() == 63256)
		{
			if (_party.GetSize() == 1)
			{
				if (
					leader.IsQuestCompleted(202060) ||
					leader.HaveKeyword(`TirChonaill_Tutorial_Judging`) || leader.HaveKeyword(`TirChonaill_Tutorial_Perceiving`)
				)
				{
					_reply = ["event.enter_dungeon.203"];
					return false;
				}
				else
				{
					//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
					if(leader.HaveQuestTemplate(202060) && leader.GetCompletedQuestObjectiveCount(202060)==1)
					{
						leader.AddKeyword(`Tutorial_Alby_Drop_Trefor_Dagger`);
					}
					_dungeon = `TirCho_Alby_Dungeon_Tutorial_2010_rescuekid`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.58"];
				return false;
			}
		}

		// 황금쥐 던전
		if (_item.GetClassId() == 63174 )
		{
			if ( IsCurrentEvent(`newyear2008_taiwan`))
			{
				if ((leader.GetLevel() + leader.GetCumLevel()) < 36)
				{
					if (_party.GetSize() == 1)
					{
						_dungeon = `TirCho_Alby_Golden_Rat_Dungeon`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.149"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.150"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.151"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 75472)	// 음유시인의 희곡 페이지
		{
			if (leader.GetCompletedQuestObjectiveCount(294201) == 1)
			{
				int level = leader.GetCumLevel() + leader.GetLevel();

				// 누적레벨 1000 미만은 키아 중급
				if (level > 1000)
				{
					_dungeon = `TirCho_Alby_G13_FirstFolio_High`;
					return true;
				}
				else if(level > 300)
				{
					_dungeon = `TirCho_Alby_G13_FirstFolio_Mid`;
					return true;
				}
				else
				{
					_dungeon = `TirCho_Alby_G13_FirstFolio`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.204"];
				return false;
			}
		}

		//알비 초급 던전
			//(GetGeneration() == 3 && GetSeason() >= 3) || GetGeneration() >= 4)
		if(
			IsNoPetHere(_party,_reply) && leader.GetRebirthCount() == 0 //환생한적이 없고
			&&
			(
				leader.GetLevel() < 10 || _item.GetClassId() == 63140 //10레벨이거나 던진게 알비 초급 던전 통행증이다
			)
		)
		{
			if (_party.GetSize() == 1)
			{
				//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
				if((leader.HaveQuestTemplate(202002) && leader.GetCompletedQuestObjectiveCount(202002)==3) || (leader.HaveQuestTemplate(212002) && leader.GetCompletedQuestObjectiveCount(212002)==3))
				{
					leader.AddKeyword(`Tutorial_Alby_Enter_Beginner`);
				}

				_dungeon = `TirCho_Alby_Beginner_1_Dungeon`;
				return true;
			}
		}
	
		//아니면 그냥 일반던전으로 가라. 내쫓을 필요 없음.

		if (_item.GetClassId() == 63149 )
		{
			//마법 콩 던전
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.63"];
				return false;
			}
			else
			{
				_dungeon = `TirCho_Alby_Magic_Bean_Dungeon`;
				return true;
			}
		}


		// 하드모드 알비 던전 테스트 버전  - 정식으로 하드모드 로비가 잘 되면 의미가 없어지는 부분이다. - orcen 2008/01/15
		if (_item.GetClassId() == 63176)		//  하드 일반
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				int i;
				character	cChar;

				for (i = 0; i < _party.GetSize();  i++)
				{
					cChar = (character)_party.GetValue(i);
					if (((!IsDevelopment() && cChar.GetCumLevel()+cChar.GetLevel()<250)) || (IsDevelopment() && (cChar.GetCumLevel()+cChar.GetLevel()) < 30))
					{
						_reply = ["event.enter_dungeon.158"];
						return false;
					}
				}
				_dungeon = `TirCho_Alby_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63177)		//  하드 하급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				int i;
				character	cChar;

				for (i = 0; i < _party.GetSize();  i++)
				{
					cChar = (character)_party.GetValue(i);
					if (((!IsDevelopment() && cChar.GetCumLevel()+cChar.GetLevel()<250)) || (IsDevelopment() && (cChar.GetCumLevel()+cChar.GetLevel()) < 30))
					{
						_reply = ["event.enter_dungeon.159"];
						return false;
					}
				}
				_dungeon = `TirCho_Alby_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63178)		//  하드 중급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				int i;
				character	cChar;

				for (i = 0; i < _party.GetSize();  i++)
				{
					cChar = (character)_party.GetValue(i);
					if (((!IsDevelopment() && cChar.GetCumLevel()+cChar.GetLevel()<250)) || (IsDevelopment() && (cChar.GetCumLevel()+cChar.GetLevel()) < 30))
					{
						_reply = ["event.enter_dungeon.160"];
						return false;
					}
				}
				_dungeon = `TirCho_Alby_Middle_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63179)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				int i;
				character	cChar;

				for (i = 0; i < _party.GetSize();  i++)
				{
					cChar = (character)_party.GetValue(i);
					if (((!IsDevelopment() && cChar.GetCumLevel()+cChar.GetLevel()<250)) || (IsDevelopment() && (cChar.GetCumLevel()+cChar.GetLevel()) < 30))
					{
						_reply = ["event.enter_dungeon.161"];
						return false;
					}
				}
				_dungeon = `TirCho_Alby_High_Hardmode_Dungeon`;
				_option = `bossroom=\"1\"`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}

		//---------- 튜토리얼 알비 던전 과정 체크용 키워드 추가------------//
		if((leader.HaveQuestTemplate(202002) && leader.GetCompletedQuestObjectiveCount(202002)==3) || (leader.HaveQuestTemplate(212002) && leader.GetCompletedQuestObjectiveCount(212002)==3))
		{
			leader.AddKeyword(`Tutorial_Alby_Enter_Normal`);
		}
	}
///////////////////////////////////////////////////////////////////
////// 하드모드 알비 던전에 이런 아이템들을 던지면 딴 데로 보낸다
///////////////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`TirCho_Alby_Hardmode_Dungeon`))//원래 하드모드 알비던전에 갈 예정인디
	{

		int i;
		character	cChar;

		cChar = (character)_party.GetValue(i);
		//테스트 서버나 개발에서는 5레벨 이하일 경우, 입장 불가
		//정섭에서는 250 이하일 경우, 입장 불가
		if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5) && (_party.GetSize() == 1)) ||
		((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250) && (_party.GetSize() == 1)))
		{
			_reply = ["event.enter_dungeon.162"];
			return false;
		}
		for (i = 0; i < _party.GetSize();  i++)
		{
			cChar = (character)_party.GetValue(i);
			if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5)) ||
			((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250)))
			{
				_reply = ["event.enter_dungeon.163"];
				return false;
			}
		}

		if (_item.GetClassId() == 63101)		//  하드 하급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Alby_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63116 || _item.GetClassId() == 63117 || _item.GetClassId() == 63118)		//  하드 중급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Alby_Middle_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63159 || _item.GetClassId() == 63160 || _item.GetClassId() == 63161)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Alby_High_Hardmode_Dungeon`;
				_option = `bossroom=\"1\"`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
	}

////////////////////////////////////////////////////////
// 키아 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`TirCho_Ciar_Dungeon`))
	{
		//키아 고로 던전
		if (_item.GetClassId() == 63519) //이런 걸 던젔다면
		{
			if (_party.GetSize() == 1)
			{
				// 키아 초급 던전으로 보낸다
				_dungeon = `TirCho_Ciar_Goro_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];
				return false;
			}
		}
		//키아 초급 던전
		if (_item.GetClassId() == 63139) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.68"];
				return false;
			}
			else
			{
				// 키아 초급 던전으로 보낸다
				_dungeon = `TirCho_Ciar_Beginner_1_Dungeon`;
				return true;
			}
		}
		//키아 동물 캐릭터 던전
		if (_item.GetClassId() == 63260) //이런 걸 던젔다면
		{
			if (IsCurrentEvent(`pet_dungeon_event_china`))
			{
				if(IsNoManHere(_party,_reply))
				{
					_dungeon = `TirCho_Ciar_pet_china_Dungeon`;
					return true;
				}
				else return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.214"];
				return false;
			}
		}
		//키아 하급 던전
		else
		if (_item.GetClassId() == 63104)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.8"];
				return false;
			}
			else
			{
				// 키아 하급 던전
				_dungeon = `TirCho_Ciar_Low_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 73102)
		{
			//트레이시, 발터의 골렘사냥 RP

			if (_party.GetSize() == 2)
			{
				if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
				{
					_dungeon = `RP_Tracy_TirCho_Ciar_Dungeon`;
					return true;
				}
				else return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.9"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73024)	//택배원의 메모
		{
			if (leader.HaveKeyword(`g1_25`))
			{
				if (leader.IsMainStreamPlayablePlayer(1))
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
					{
						// G1 키아 레어던전 - 마족의 책 2 얻기
						_dungeon = `G1_21_TirCho_Ciar_Dungeon`;
						return true;
					}
					else return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.10"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.11"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 63122) //트레보가 준 키아 마족 통행증. 현재 이 던전은 사용되지 않고 있고, 일반 키아 던전을 클리어할 때 던전에 3명 있으면, 200046번 퀘스트를 완료할 수 있다.
		{
			if (_party.GetSize() != 2)
			{
				_reply = ["event.enter_dungeon.64"];
				return false;
			}
			else
			{
				// 키아 게임퀘스트용 파티 던전
				_dungeon = `TirCho_Ciar_Dungeon_PartyQuest`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 74007) //팔라딘 갑옷을 만나러 오자
		{
			if (_party.GetSize() == 1)
			{
				if(leader.IsQuestCompleted(220040))
				{
					if (leader.HaveKeyword(`g2_28`) && !leader.HaveKeyword(`g2_jump`))	// g2 점프한 애가 은행 공유로 이 아이템을 소유하고있을 수도 있다.
					{
						if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
						{
							if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
							{
								// G2_28 팔라딘 갑옷
								_dungeon = `G2RP_28_TirCho_Ciar_Dungeon`;
								return true;
							}
							else return false;
						}
						else
						{
							_reply = ["event.enter_dungeon.65"];
							return false;
						}
					}
					else
					{
						_reply = ["event.enter_dungeon.66"];
						return false;
					}
				}
				else
				{
					//"이상형 찾기를 완료하지 않았으므로 더 이상 진행할 수 없습니다";
					G2_Reset_After_G2_23(leader) extern (`data/script/event/g2_event.mint`);
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];
				return false;
			}
		}

		// G11 메인스트림 파르홀론의 고서적 찾기 던전
		else if (_item.GetClassId() == 63217 )
		{
			if (_party.GetSize() == 1)
			{
				if (leader.GetCompletedQuestObjectiveCount(292006) == 1)
				{
					int level = leader.GetCumLevel() + leader.GetLevel();
					// 누적레벨 1000 미만은 키아 중급
					if (level < 1000)
					{
						_dungeon = `TirCho_Ciar_Middle_G11_Dungeon`;
						return true;
					}
					else
					{
						_dungeon = `TirCho_Ciar_High_G11_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.189"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.190"];
				return false;
			}
		}

		// G10 메인스트림 엘라하 RP 다크로드 던전
		if (_item.GetClassId() == 63196 )
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HasSummonedPet())
				{
					_reply = ["event.enter_dungeon.185"];
					return false;
				}

				else
				{
					if (leader.GetCompletedQuestObjectiveCount(291008) == 3)
					{
						_dungeon = `TirCho_Ciar_Dungeon_Elatha_RP`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.186"];
						return false;
					}
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.187"];
				return false;
			}
		}



		else
		if ((_item.GetClassId() == 74008)) //G2스킵후 팔라딘 갑옷을 만나러 오자
		{
			if (_party.GetSize() == 1)
			{
				if (
					leader.HaveKeyword(`g2_jump`)
					&&
					(!leader.IsUsableSkill(40001) && !leader.IsUsableSkill(40002) && !leader.IsUsableSkill(40003) && !leader.IsUsableSkill(40004))
					&&
					leader.IsQuestTried(200080)
					&&!leader.IsQuestCompleted(200080)
				)
				{	//G2를 점프했고 혹시나 늑대RP까지 해서 40001을 배운적은 있지만 팔라딘 스킬은 아직 못쓴다
					if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G2_점프 팔라딘 갑옷
							_dungeon = `G2RP_Jump_TirCho_Ciar_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.65"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.66"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73176)
		{
			if(leader.GetCompletedQuestObjectiveCount(20107) == 0 && leader.HaveQuestTemplate(20107) )
			{
				//윈드 브레이커 1단계 던전
				_dungeon = `TirCho_Ciar_Dungeon_WindBreaker`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.168"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
				return false;

			}
		}

		if (_item.GetClassId() == 63123) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.68"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 키아 1인 중급 던전으로 보낸다
					_dungeon = `TirCho_Ciar_Middle_1_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.69"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 90017)
		{
			//2인 던전 테스트를 위해서
			_reply = ["event.enter_dungeon.70"];
			_dungeon = `TirCho_Ciar_Middle_2_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 63124)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.71"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 키아 2인 중급 던전
					_dungeon = `TirCho_Ciar_Middle_2_Dungeon`;
				return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.72"];
					return false;
				}
			}
		}

		if (_item.GetClassId() == 90018)
		{
			//4인 던전 테스트를 위해서
			_reply = ["event.enter_dungeon.73"];
			_dungeon = `TirCho_Ciar_Middle_4_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 63125)
		{
			if(_item.IsExpired())
			{
				// 키아 4인 중급 던전
				_reply = ["event.enter_dungeon.74"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 4)
				{
					_dungeon = `TirCho_Ciar_Middle_4_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.75"];
					return false;
				}
			}
		}
		//키아 상급
		else
		if (_item.GetClassId() == 63136)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.79"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 키아 2인 상급 던전
					_dungeon = `TirCho_Ciar_High_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.80"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90019)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `TirCho_Ciar_High_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63137)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.81"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 키아 3인 상급 던전
					_dungeon = `TirCho_Ciar_High_3_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.82"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90020)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `TirCho_Ciar_High_3_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63138)
		{
			if(_item.IsExpired())
			{
				// 키아 상급 던전
				_reply = ["event.enter_dungeon.83"];
				return false;
			}
			else
			{
				_dungeon = `TirCho_Ciar_High_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 90021)
		{
			//무제한 던전 테스트를 위해서
			_dungeon = `TirCho_Ciar_High_Dungeon`;
			return true;
		}
		//키아 보스 러시
		else
		if (_item.GetClassId() == 63156)
		{
			if (IsNoPetHere(_party,_reply))
			{
				if(_item.IsExpired())
				{
					_reply = ["event.enter_dungeon.79"];
					return false;
				}
				else
				{
					if (_party.GetSize() == 1)
					{
						// 키아 1인 보스 러시
						_dungeon = `TirCho_Ciar_BossRush_Dungeon`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.78"];
						return false;
					}
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.128"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 75465)	//퍼거스의 인형
		{
			if (_party.GetSize() == 1)
			{		
				if (leader.GetCompletedQuestObjectiveCount(294108) == 2)
				{
					int level = leader.GetCumLevel() + leader.GetLevel();

					// 누적레벨 1000 미만은 키아 중급
					if (level > 1000)
					{
						_dungeon = `TirCho_Ciar_G13_High_Dungeon`;
						return true;
					}
					else if(level > 300)
					{
						_dungeon = `TirCho_Ciar_G13_Mid_Dungeon`;
						return true;
					}
					else
					{
						_dungeon = `TirCho_Ciar_G13_Easy_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.205"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.206"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 75474)	//퍼거스의 대못
		{
			if (leader.GetCompletedQuestObjectiveCount(294204) == 2)
			{
				int level = leader.GetCumLevel() + leader.GetLevel();

				// 누적레벨 1000 미만은 키아 중급
				if (level > 1000)
				{
					_dungeon = `TirCho_Ciar_G13_High_Dungeon`;
					return true;
				}
				else if(level > 300)
				{
					_dungeon = `TirCho_Ciar_G13_Mid_Dungeon`;
					return true;
				}
				else
				{
					_dungeon = `TirCho_Ciar_G13_Easy_Dungeon`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.207"];
				return false;
			}
			
		}
		if (_item.GetClassId() == 75015)	//G3_06 여신상 복구 키아던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Ciar`)
					&& (
						(leader.IsQuestTried(230013) && !leader.IsQuestCompleted(230013))
						|| (leader.IsQuestTried(230046) && !leader.IsQuestCompleted(230046))
					)
				)
				{
					if (
						// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
						GetVersion() >= 403
//						&& GetLocale().LowerCase() == `korea`.LowerCase()
					)
					{
						_dungeon = `TirCho_Ciar_Dungeon_Recover_easy`;
						_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
						return true;
					}
					else
					{
						_dungeon = `TirCho_Ciar_Dungeon_Recover`;
						_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}


		if (_item.GetClassId() == 75113)	// G3_DarkKnight 키아던전 입장
		{
			// 유료, 무료사용자 모두 들어가도록 수정
			if (_party.GetSize() == 1)
			{
				if (IsNoPetHere(_party,_reply))
				{
					if (leader.HaveKeyword(`G3_DarkKnight_Complete_hidden`))
					{
						_reply = ["event.enter_dungeon.50"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
						return false;
					}
					else if (leader.HaveKeyword(`G3_DarkKnight_Start_hidden`)
						&& !leader.HaveKeyword(`G3_DarkKnight_Armor0_hidden`)
						&& leader.GetItemNoWithClassId(75100) == 0)
					{
						// G2jump, G3jump 난이도 상향
						if (
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) && leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Ciar_Dungeon_g2jump_and_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else if(
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) || leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Ciar_Dungeon_g2jump_or_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else
						{
							_dungeon = `G3_DarkKnight_Ciar_Dungeon`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
					}
					else return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.128"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];//이 던전은 혼자서만 들어갈 수 있습니다.
				return false;
			}
		}

		// 하드모드 키아 던전 테스트 버전 - 정식으로 하드모드 로비가 잘 되면 의미가 없어지는 부분이다. - orcen 2008/01/15
		if (_item.GetClassId() == 63176)		//  하드 일반
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63177)		//  하드 하급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63178)		//  하드 중급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_Middle_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63179)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_High_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}

		// 키아 PC방 던전
		if (_item.GetClassId() == 63261)		// 키아 상급 PC방 통행증
		{
			if(leader.IsGameRoomPlayer())
			{
				if (_party.GetSize() == 1)
				{
					// 키아 1인 상급 던전
					_dungeon = `TirCho_Ciarpcbang_High_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.220"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.221"];
				return false;
			}
		}

		// 일본 2주년 키아 이벤트 던전
		if (_item.GetClassId() == 63162)	// 이벤트 통행증
		{
			if(IsCurrentEvent(`japan_2nd_anniversary`) || IsCurrentEvent(`china_community_dungeon`) || IsDevelopment())
			{
				if (!leader.HaveKeyword(`Clear_Ciar_Japan_Event_Dungeon`))
				{
					if (_party.GetSize() >= 2)
					{
						// 누적 레벨에 따라서 통행증을 구분해준다.
						int iCumLevel = leader.GetCumLevel() + leader.GetLevel();
						if(iCumLevel <= 25 && ((GetLocale().LowerCase() != `usa`)||(GetLocale().LowerCase() != `europe`)))	// 미국이 아닌 경우에만 누적 레벨 비교(by versable 08.06.13)
						{
							_dungeon = `TirCho_Ciar_Japan_Event_Dungeon_1`;
							return true;
						}
						else
						{
							_dungeon = `TirCho_Ciar_Japan_Event_Dungeon_2`;
							return true;
						}
					}
					else
					{
						_reply = ["event.enter_dungeon.146"];
						return false;
					}
				}
			}
		}

















	}
///////////////////////////////////////////////////////////////////
////// 하드모드 키아 던전에 이런 아이템들을 던지면 딴 데로 보낸다
///////////////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`TirCho_Ciar_Hardmode_Dungeon`))//원래 하드모드 키아던전에 갈 예정인디
	{

		int i;
		character	cChar;

		cChar = (character)_party.GetValue(i);
		if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5) && (_party.GetSize() == 1)) ||
		((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250) && (_party.GetSize() == 1)))
		{
			_reply = ["event.enter_dungeon.164"];
			return false;
		}
		for (i = 0; i < _party.GetSize();  i++)
		{
			cChar = (character)_party.GetValue(i);
			if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5)) ||
			((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250)))
			{
				_reply = ["event.enter_dungeon.165"];
				return false;
			}
		}


		if (_item.GetClassId() == 63104)		//  하드 하급
		{

			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63123 || _item.GetClassId() == 63124 || _item.GetClassId() == 63125)		//  하드 중급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_Middle_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63136 || _item.GetClassId() == 63137 || _item.GetClassId() == 63138)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `TirCho_Ciar_High_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
	}

////////////////////////////////////////////////////////
///////라비던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`Dunbarton_Rabbie_Dungeon`))
	{
		if (_item.GetClassId() == 90013)
		{
			if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
			{
				_dungeon = `RP_Ranald_Dunbarton_Rabbie_Dungeon`;
				return true;
			}
			else return false;
		}
		else
		if (_item.GetClassId() == 63228)	// 한국 2010 화이트데이 던전
		{
			// 이벤트 진행 중, 2명, 남/녀 파티일때만 입장이 가능합니다.
			if ( IsCurrentEvent(`whiteday_2010_korea`))
			{
				if (_party.GetSize() == 2)
				{
					character	cChar1 = (character)_party.GetValue(0);
					character	cChar2 = (character)_party.GetValue(1);

					if((cChar1.IsFemale() && !cChar2.IsFemale()) ||
					(!cChar1.IsFemale() && cChar2.IsFemale()))
					{
						_dungeon = `Dunbarton_Rabbie_Whiteday_Dungeon`;
						return true;						
					}
					else
					{
						_reply = ["event.enter_dungeon.199"];
						return false;	
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.200"];
					return false;	
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.198"];
				return false;				
			}
		}
		else
		if (_item.GetClassId() == 91160)
		{
			if ( IsCurrentEvent(`StPatricksDay_2010_usa`))
			{
				_dungeon = `Dunbarton_Rabbie_Four_Leaf_Clover_Dungeon`;
				return true;
			}
			//이벤트 기간이 아니면 일반 던전
		}
		//라비 상급
		else
		if (_item.GetClassId() == 63141)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.79"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 라비 2인 상급 던전
					_dungeon = `Dunbarton_Rabbie_High_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.80"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90019)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `Dunbarton_Rabbie_High_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63142)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.81"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 라비 3인 상급 던전
					_dungeon = `Dunbarton_Rabbie_High_3_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.82"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90020)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Dunbarton_Rabbie_High_3_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63143)
		{
			if(_item.IsExpired())
			{
				// 라비 상급 던전
				_reply = ["event.enter_dungeon.83"];
				return false;
			}
			else
			{
				_dungeon = `Dunbarton_Rabbie_High_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 90021)
		{
			//무제한 던전 테스트를 위해서
			_dungeon = `Dunbarton_Rabbie_High_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 63110)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.12"];
				return false;
			}
			else
			{
				// 라비 하급 던전
				_dungeon = `Dunbarton_Rabbie_Low_Dungeon`;
				return true;
			}
		}
		if (_item.GetClassId() == 63182)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.169"];
				return false;
			}
			else
			{
				// 라비 모험 던전(중국 프리미엄PC방 전용 던전)
				_dungeon = `Dunbarton_Rabbie_Premium_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 73101)
		{
			if (_party.GetSize() == 1)
			{
				if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
				{
					_dungeon = `RP_Ranald_Dunbarton_Rabbie_Dungeon`;
					return true;
				}
				else return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.13"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73004)	//부서진 안경
		{
			if (_party.GetSize() == 3)
			{
				if (leader.HaveKeyword(`g1_29`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G1 세전사 RP 던전. 입장하면 티르나노이 던전이다.
							_dungeon = `G1RP_25_Dunbarton_Rabbie_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.16"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.17"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.18"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73022)	//타르라크의 안경주머니
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`g1_15`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G1 타르라크 RP던전
							_dungeon = `G1RP_15_Dunbarton_Rabbie_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.19"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.20"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.21"];
				return false;
			}
		}

		if (_item.GetClassId() == 75016)	//G3_06 여신상 복구 라비던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Rabbie`)
					&&
					(
						(leader.IsQuestTried(230009) && !leader.IsQuestCompleted(230009)) || (leader.IsQuestTried(230010) && !leader.IsQuestCompleted(230010))
						|| (leader.IsQuestTried(230044) && !leader.IsQuestCompleted(230044)) || (leader.IsQuestTried(230045) && !leader.IsQuestCompleted(230045))
					)
				)
				{
					// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
					if (
						GetVersion() >= 403
//						&& GetLocale().LowerCase() == `korea`.LowerCase()
					)
					{
						_dungeon = `Dunbarton_Rabbie_Dungeon_Recover_easy`;
						_option = `private=\"true\"`;// savestatueid=\"21049\" laststatueid=\"21049\"`;
						return true;
					}
					else
					{
						_dungeon = `Dunbarton_Rabbie_Dungeon_Recover`;
						_option = `private=\"true\"`;// savestatueid=\"21049\" laststatueid=\"21049\"`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}

		//마법 카카오 콩 던전
		if (_item.GetClassId() == 63173 )
		{
			if ( IsCurrentEvent(`valentine2008_overseas`) && leader.HaveKeyword(`Valentine_Step1`))
			{

				if(_item.IsExpired())
				{
					_reply = ["event.enter_dungeon.152"];
					return false;
				}
				else
				{
					_dungeon = `Dunbarton_Rabbie_Magic_Cacao_Bean_Dungeon`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.157"];
				return false;
			}
		}

		// 라비 PC방 던전
		if (_item.GetClassId() == 63264)		// 라비 하급 PC방 통행증
		{
			if(leader.IsGameRoomPlayer())
			{
				if (_party.GetSize() == 1)
				{
					// 라비 PC방 하급1인 던전
					_dungeon = `Dunbarton_Rabbiepcbang_Low_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.222"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.223"];
				return false;
			}
		}


		// 황금쥐 던전
		if (_item.GetClassId() == 63175 )
		{
			if ( IsCurrentEvent(`newyear2008_taiwan`))
			{
				if(_item.IsExpired())
				{
					_reply = ["event.enter_dungeon.153"];
					return false;
				}
				else
				{
					_dungeon = `Dunbarton_Rabbie_Golden_Rat_Dungeon`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.154"];
				return false;
			}
		}
		if (_item.GetClassId() == 63185 )
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HasSummonedPet())
				{
					_reply = ["event.enter_dungeon.183"];
					return false;
				}

				else
				{
					if (leader.GetCompletedQuestObjectiveCount(290302) == 1)
					{
						_dungeon = `Dunbarton_Rabbie_Andras_Dungeon`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.180"];
						return false;
					}
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.181"];
				return false;
			}
		}
		 // G3_DarkKnight 라비던전 입장
		if (leader.HaveKeyword(`G3_DarkKnight_Start_hidden`) && !leader.HaveKeyword(`G3_DarkKnight_Complete_hidden`)
			&& leader.HaveKeyword(`G3_DarkKnight_Armor2_hidden`) && !leader.HaveKeyword(`G3_DarkKnight_Armor3_hidden`))
		{
			// 유료, 무료사용자 모두 들어가도록 수정
			if (_party.GetSize() == 1)
			{
				if (IsNoPetHere(_party,_reply))
				{
						// G2jump, G3jump 난이도 상향
						if (
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) && leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Rabbie_Dungeon_g2jump_and_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else if(
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) || leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Rabbie_Dungeon_g2jump_or_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else
						{
							_dungeon = `G3_DarkKnight_Rabbie_Dungeon`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
				}
				else
				{
					// 일반던전으로 보낸다.
				}
			}
			else
			{
				// 일반던전으로 보낸다.
			}
		}
	}
////////////////////////////////////////////////////////
///////마스던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`Dunbarton_Math_Dungeon`))
	{
		if (_item.GetClassId() == 90011)
		{
			_dungeon = `Math_Dungeon_Herb_test`;
			return true;
		}
		if (_item.GetClassId() == 63107)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.22"];
				return false;
			}
			else
			{
				// 마스 하급 던전
				_dungeon = `Dunbarton_Math_Low_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 73104)
		{
			//네리스 마누스 RP 1
			if(leader.HaveKeyword(`RP_NerysManus_Complete`))
			{
				_reply = ["event.enter_dungeon.56"];
				leader.RemoveKeyword(`RP_NerysManus_1`);
				leader.RemoveKeyword(`RP_NerysManus_2`);
				leader.RemoveKeyword(`RP_NerysManus_3`);
				return false;
			}

			if (_party.GetSize() == 3)
			{
				if (leader.HaveKeyword(`RP_NerysManus_1`)
					|| leader.HaveKeyword(`RP_NerysManus_2`)
					|| leader.HaveKeyword(`RP_NerysManus_3`))
				{
					_reply = ["event.enter_dungeon.54"];
					return false;
				}
				else
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `RP_NerysManus_Dunbarton_Math_Dungeon_1`;
						return true;
					}
					else return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.23"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73105)
		{
			//네리스 마누스 RP 2
			if(leader.HaveKeyword(`RP_NerysManus_Complete`))
			{
				_reply = ["event.enter_dungeon.56"];
				leader.RemoveKeyword(`RP_NerysManus_1`);
				leader.RemoveKeyword(`RP_NerysManus_2`);
				leader.RemoveKeyword(`RP_NerysManus_3`);
				return false;
			}
			if (_party.GetSize() == 3)
			{
				if (leader.HaveKeyword(`RP_NerysManus_2`)
					|| leader.HaveKeyword(`RP_NerysManus_3`))
				{
					_reply = ["event.enter_dungeon.55"];
					return false;
				}
				else
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `RP_NerysManus_Dunbarton_Math_Dungeon_2`;
						return true;
					}
					else return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.24"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73106)
		{
			//네리스 마누스 RP 3
			if (leader.HaveKeyword(`RP_NerysManus_Complete`))
			{
				_reply = ["event.enter_dungeon.56"];
				leader.RemoveKeyword(`RP_NerysManus_1`);
				leader.RemoveKeyword(`RP_NerysManus_2`);
				leader.RemoveKeyword(`RP_NerysManus_3`);
				return false;
			}
			if (_party.GetSize() == 3)
			{
				if (leader.HaveKeyword(`RP_NerysManus_3`))
				{
					_reply = ["event.enter_dungeon.55"];
					return false;
				}
				else
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `RP_NerysManus_Dunbarton_Math_Dungeon_3`;
						return true;
					}
					else return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.25"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73003)	//부러진토크
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`g1_21`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply)&& IsNoPetSummonerHere(_party,_reply))
						{	// G1 마우러스 RP
							_dungeon = `G1RP_18_Dunbarton_Math_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.26"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.27"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.28"];
				return false;
			}
		}

		else
		if (_item.GetClassId() == 73005)	//부러진토크2
		{
			if (_party.GetSize() == 2)
			{
				if (leader.HaveKeyword(`g1_34_1`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G1 마우러스 RP2 - 시라의 RP
							_dungeon = `G1RP_31_Dunbarton_Math_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.29"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.30"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.31"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 74004)
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`g2_08`))
				{
					if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							// G2 08 팔라딘 수행의 끝
							_dungeon = `G2_08_Dunbarton_Math_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.76"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.77"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.78"];
				return false;
			}
		}
		//마스 상급
		else
		if (_item.GetClassId() == 63129)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.79"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 마스 2인 상급 던전
					_dungeon = `Dunbarton_Math_High_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.80"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90019)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `Dunbarton_Math_High_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63130)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.81"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 마스 3인 상급 던전
					_dungeon = `Dunbarton_Math_High_3_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.82"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90020)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Dunbarton_Math_High_3_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63131)
		{
			if(_item.IsExpired())
			{
				// 마스 상급 던전
				_reply = ["event.enter_dungeon.83"];
				return false;
			}
			else
			{
				_dungeon = `Dunbarton_Math_High_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 90021)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Dunbarton_Math_High_Dungeon`;
			return true;
		}

		if (_item.GetClassId() == 75017)	//G3_06 여신상 복구 마스던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Math`)
					&&
					(
						(leader.IsQuestTried(230009) && !leader.IsQuestCompleted(230009)) || (leader.IsQuestTried(230010) && !leader.IsQuestCompleted(230010))
						|| (leader.IsQuestTried(230044) && !leader.IsQuestCompleted(230044)) || (leader.IsQuestTried(230045) && !leader.IsQuestCompleted(230045))
					)
				)
				{
					_dungeon = `Dunbarton_Math_Dungeon_Recover`;
					_option = `private=\"true\"`;// savestatueid=\"21049\" laststatueid=\"21049\"`;

					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}

		//마스 초보자 이벤트 던전 - uhihiho 2006/10/12
		if (_item.GetClassId() == 63151 )
		{
			if (_party.GetSize() >= 2)
			{
				_dungeon = `Dunbarton_Math_Japan_Event_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.144"];
				return false;
			}

		}

		// 마스 초보자 이벤트 던전 - dochigun 2007/05/31
		// 인원수 제한 없는 것
		if (_item.GetClassId() == 63165 )
		{
			_dungeon = `Dunbarton_Math_Japan_Event_Dungeon`;
			return true;
		}

		// 마스 던전 허스키 이벤트
		// 이벤트 진행 중 개과자를 던지면 허스키 이벤트 던전으로 들어간다
		if (_item.GetClassId() == 50215 && IsCurrentEvent(`husky2009_1_korea`))
		{
			// DebugOut(`허스키 이벤트 던전에 입장`);
			_dungeon = `Dunbarton_Math_Husky_Event_Dungeon`;
			return true;
		}
	}

////////////////////////////////////////////////////////////////
////바리 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Bangor_Barri_Dungeon`))
	{
		if (_item.GetClassId() == 74004) //팔라딘 마스 코스 수련증인디
		{
			_reply = ["event.enter_dungeon.84"];
			return false;
		}
		if (_item.GetClassId() == 63170)
		{
			// 숨겨진 광산 던전
			_dungeon = `Bangor_Barri_Hidden_Gold_Dungeon`;
			return true;
		}
		//g9 메인스트림 최종장
		else if (_item.GetClassId() == 63183)
		{
			if (!leader.GetCompletedQuestObjectiveCount(290012)==1)
			{
				_reply = ["event.enter_dungeon.179"];
				return false;
			}

			else
			if (!leader.FindShadowMission() == 0)
			{
				_reply = ["event.enter_dungeon.188"];
				return false;
			}

			else
			if (GetDay() == 6 || leader.GetTitle() == 60001 || IsEnable(`featureG9MakeEasy2`) extern (`data/script/features.mint`))	// 토요일이거나 데브캣 타이틀 있거나, 난이도하향패치 이후라면
			{
				if (_party.GetSize() == 1)
				{

					int level = leader.GetCumLevel() + leader.GetLevel();
					// 누적레벨 300 미만은 초급
					if (level < 300)
					{
						_dungeon = `Bangor_Barri_Dungeon_G9S1_easy`;
						return true;
					}
					else if (level >= 800)
					{
						_dungeon = `Bangor_Barri_Dungeon_G9S1_hard`;
						return true;
					}
					else
					{
						_dungeon = `Bangor_Barri_Dungeon_G9S1_normal`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.170"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.171"];
				return false;
			}
		}
		if (_item.GetClassId() == 63113)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.32"];
				return false;
			}
			else
			{
				// 바리 하급 던전
				_dungeon = `Bangor_Barri_Low_Dungeon`;
				return true;
			}
		}
		//바리 상급
		else
		if (_item.GetClassId() == 63133)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.79"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 바리 2인 상급 던전
					_dungeon = `Bangor_Barri_High_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.80"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90019)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `Bangor_Barri_High_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63134)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.81"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 바리 3인 상급 던전
					_dungeon = `Bangor_Barri_High_3_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.82"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90020)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Bangor_Barri_High_3_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63135)
		{
			if(_item.IsExpired())
			{
				// 바리 상급 던전
				_reply = ["event.enter_dungeon.83"];
				return false;
			}
			else
			{
				_dungeon = `Bangor_Barri_High_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 90021)
		{
			//무제한 던전 테스트를 위해서
			_dungeon = `Bangor_Barri_High_Dungeon`;
			return true;
		}
		if (_item.GetClassId() == 63132) //바리 정령화석던전 통행증
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.120"];
				return false;
			}
			else
			{
				// 바리 정령 화석 던전
				_dungeon = `Bangor_Barri_Fossil_Ego_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 73011)	//마족통행증
		{
			if (leader.GetItemNoWithClassId (73021)>0)
			{
				_reply = ["event.enter_dungeon.33"];
				return false;
			}
			else
			{
				if (_party.GetSize() <= 3)
				{
					if (leader.HaveKeyword(`g1_10`)||leader.HaveKeyword(`g1_11`))
					{
						if (leader.IsMainStreamPlayablePlayer(1))
						{
							if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
							{
								if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
								{
									// G1 반호르의 블랙위저드 던전
									_dungeon = `G1_10_Bangor_Barri_Dungeon_EU`;
									return true;
								}
								else
								{
									// G1 반호르의 블랙위저드 던전
									_dungeon = `G1_10_Bangor_Barri_Dungeon`;
									return true;
								}
							}
							else return false;
						}
						else
						{
							_reply = ["event.enter_dungeon.34"];
							return false;
						}
					}
					else
					{
						_reply = ["event.enter_dungeon.35"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.36"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 73012)	//검은마족통행증
		{
			if (_party.GetSize() <= 3)
			{
				if (leader.HaveKeyword(`g1_34`)||
					leader.HaveKeyword(`g1_35`)||
					leader.HaveKeyword(`g1_36`)||
					leader.HaveKeyword(`g1_37`)||
					leader.HaveKeyword(`g1_38`)||
					leader.HaveKeyword(`g1_complete`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							// G1 바리 레어던전 - 티르나노이로 가는 통로
							_dungeon = `G1_30_Bangor_Barri_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.37"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.38"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.39"];
				return false;
			}
		}
		else
		// G2관련 바리
		if (_item.GetClassId() == 74001)//바리로 광부코볼트 잡으러 왔으면
		{
			if (_party.GetSize() == 1) //혼자다
			{
				if (leader.HaveKeyword(`g2`) && !leader.IsQuestCompleted(220005)) //g2를 하고있고, 팔라딘 5차 수업을 완료하기 전까지 들어갈 수 있다
				{
					if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							// G2 02
							_dungeon = `G2_04_Bangor_Barri_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.85"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.86"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.87"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 74002)//바리로 황금 골렘 잡으러 왔으면
		{
			if (_party.GetSize() == 1) //혼자다
			{
				if (leader.HaveKeyword(`g2_37`)) //g2_02번 챕터 수행중이다
				{
					if(leader.IsQuestCompleted(220040))
					{
						if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
						{
							if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
							{
								// G2 32 황금 골렘
								_dungeon = `G2_37_Bangor_Barri_Dungeon`;
								return true;
							}
							else return false;
						}
						else
						{
							_reply = ["event.enter_dungeon.88"];
							return false;
						}
					}
					else
					{
						//"이상형퀘스트를 완료하지 않아 입장할 수 없습니다.";
						G2_Reset_After_G2_23(leader) extern (`data/script/event/g2_event.mint`);
						return false;
					}
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.90"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 74003)//바리로 미스릴 캐러 왔으면
		{
			if (_party.GetSize() == 1) //혼자다
			{

//				if (leader.HaveKeyword(`g2_24`) || leader.HaveKeyword(`g2_25`)) //미스릴 근처다.
				if (leader.HaveKeyword(`g2`) || leader.HaveKeyword(`g3`) || leader.HaveKeyword(`g2_complete`) || leader.HaveKeyword(`g3_complete`)) //미스릴 근처다.
				{
					if (leader.IsMainStreamPlayablePlayer(2) ||
							leader.IsMainStreamPlayablePlayer(3) ||
							IsDevelopment()) // 유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							// G2 24 미수릴던전
							_dungeon = `G2_24_Bangor_Barri_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.91"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.92"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.93"];
				return false;
			}
		}

//G3 ---------------------------------------------------------------

		if (_item.GetClassId() == 75000) //저세상 바리 던전 통행증
		{
			if(leader.IsMainStreamPlayablePlayer(3))
			{
				if(leader.HaveKeyword(`g3`) || leader.HaveKeyword(`g3_complete`))
				{
					if (_party.GetSize() == 1)
					{
						//저세상 바리 던전
						_dungeon = `G3_02_Bangor_Barri_Dungeon`;
						_option = `savestatueid=\"23040\" laststatueid=\"23040\"`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.78"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.122"];
				return false;
			}
		}

		if (_item.GetClassId() == 75022)	//G3_06 여신상 복구 바리던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Barri`)
					&& (
						(leader.IsQuestTried(230006) && !leader.IsQuestCompleted(230006))
						|| (leader.IsQuestTried(230043) && !leader.IsQuestCompleted(230043))
					)
				)
				{
					if (
						// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
						GetVersion() >= 403
//						&& GetLocale().LowerCase() == `korea`.LowerCase()
					)
					{
						_dungeon = `Bangor_Barri_Dungeon_Recover_easy`;
						_option = `private=\"true\"`;// savestatueid=\"23040\" laststatueid=\"23040\"`;
						return true;
					}
					else
					{
						_dungeon = `Bangor_Barri_Dungeon_Recover`;
						_option = `private=\"true\"`;// savestatueid=\"23040\" laststatueid=\"23040\"`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}

		if (_item.GetClassId() == 74212) // 팔라딘 신규스킬 입수
		{
			if (_party.GetSize() == 1) //혼자다
			{
				if (leader.HaveKeyword(`Book_of_Paladin_hidden`)
					&& leader.HaveKeyword(`Book_of_Paladin_G2_jump`)
					&& !leader.HaveKeyword(`Book_of_Paladin_page2`) //2페이지 없음
					&& !leader.HaveKeyword(`Book_of_Paladin_complete`) //팔라딘 서 완성 못했음
					&& (leader.GetItemNoWithClassId(74201) != 0 || leader.GetItemNoWithClassId(74202) != 0))
				{
					if(IsNoPetHere(_party,_reply))
					{
						// G3 팔라딘 스킬
						_dungeon = `Bangor_Barri_Dungeon_Paladin`;
						return true;
					}
					else
					{
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.89"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.90"];
				return false;
			}
		}

		if (_item.GetClassId() == 75112)	// G3_DarkKnight 다크나이트 체험RP 입장
		{
			// 유료, 무료사용자 모두 들어가도록 수정
			if (_party.GetSize() == 1)
			{
				if(IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
//				if (IsNoPetHere(_party,_reply))
				{
					if (leader.HaveKeyword(`G3_DarkKnight_Complete_hidden`))
					{
						_reply = ["event.enter_dungeon.50"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
						return false;
					}
					else if (leader.HaveKeyword(`G3_DarkKnight_Temptation_hidden`))
					{
						_dungeon = `G3RP_DarkKnight_Bari_Dungeon`;
						_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
						return true;
					}
					else return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.129"];
					return false;
				}
			}
			else return false;
//			else
//			{
//				_reply = ["event.enter_dungeon.67"];//이 던전은 혼자서만 들어갈 수 있습니다.
//				return false;
//			}
		}

		// 바리 PC방 던전
		if (_item.GetClassId() == 63263)		// 바리 상급 PC방 통행증
		{
			if(leader.IsGameRoomPlayer())
			{
				if (_party.GetSize() == 1)
				{
					// 바리 PC방 상급 1인 던전
					_dungeon = `Bangor_Barripcbang_High_Dungeon`;
					_option = `bossroom=\"1\"`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.224"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.225"];
				return false;
			}
		}

		//바리 초보자 이벤트 던전 - uhihiho 2006/10/13
		if (_item.GetClassId() == 63152 )
		{
			if (_party.GetSize() >= 2)
			{
				_dungeon = `Bangor_Barri_Japan_Event_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.145"];
				return false;
			}

		}

		// 바리 초보자 이벤트 던전 - dochigun 2007/05/31
		// 인원수 제한 없는 것
		if (_item.GetClassId() == 63166 )
		{
				_dungeon = `Bangor_Barri_Japan_Event_Dungeon`;
				return true;
		}
	}
//////////////////////////////////////////////////////////////
////알베이 던전에 이런 아이템들을 던지면 딴 데로 보낸다
//////////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`Tirnanog_Dungeon`))
	{
		if (_item.GetClassId() == 52004)	//녹색구슬
		{
			if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
			{
				// G1 5봉인-녹색구슬던전
				_dungeon = `G1_37_Green_Tirnanog_Dungeon`;
				return true;
			}
			else return false;
		}
		else
		if (_item.GetClassId() == 52005)	//파란구슬
		{
			if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
			{
				// G1 5봉인-파란구슬던전
				_dungeon = `G1_37_Blue_Tirnanog_Dungeon`;
				return true;
			}
			else return false;
		}
		else
		if (_item.GetClassId() == 52006)	//빨간구슬
		{
			if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
			{
				// G1 5봉인-빨간구슬던전
				_dungeon = `G1_37_Red_Tirnanog_Dungeon`;
				return true;
			}
			else return false;
		}
		else
		if (_item.GetClassId() == 52007)	//은색구슬
		{
			if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
			{
				// G1 5봉인-은색구슬던전
				_dungeon = `G1_37_Silver_Tirnanog_Dungeon`;
				return true;
			}
			else return false;
		}
		else
		if (_item.GetClassId() == 73033)	//검은 구슬
		{
			if (_party.GetSize() <= 3)
			{
				if (leader.HaveKeyword(`g1_36`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{// G1 5봉인-검은구슬던전
							_dungeon = `G1_37_Black_Tirnanog_Dungeon`;
							return true;
						} else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.41"];
						return false;
					}
				}
				else
				if (leader.HaveKeyword(`g1_35`))
				{
					_reply = ["event.enter_dungeon.94"];
					return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.95"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.43"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73029)	//바인드펜던트
		{
			if (_party.GetSize() <= 3)
			{
				if (leader.HaveKeyword(`g1_38`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
							{
								// G1 최종던전
								_dungeon = `G1_39_Tirnanog_Dungeon_EU`;
								return true;
							}
							else
							{
								// G1 최종던전
								_dungeon = `G1_39_Tirnanog_Dungeon`;
								return true;
							}
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.44"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.45"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.46"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 73034)	//여신의 통행증
		{
			if (_party.GetSize() <= 3)
			{
				if (leader.HaveKeyword(`g1_38`))
				{
					if (leader.IsMainStreamPlayablePlayer(1))
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							if ((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
							{
							DebugOut(`하향최종전`);
								// G1 최종던전
								_dungeon = `G1_39_Tirnanog_Dungeon_Again_EU`;
								return true;
							}
							else
							{
							DebugOut(`최종전`);
								// G1 최종던전
								_dungeon = `G1_39_Tirnanog_Dungeon_Again`;
								return true;
							}
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.47"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.48"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.49"];
				return false;
			}
		}

		if (_item.GetClassId() == 75114)	// G3_DarkKnight 알베이던전 입장
		{
			// 유료, 무료사용자 모두 들어가도록 수정
			if (_party.GetSize() == 1)
			{
				if (IsNoPetHere(_party,_reply))
				{
					if (leader.HaveKeyword(`G3_DarkKnight_Complete_hidden`))
					{
						_reply = ["event.enter_dungeon.50"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
						return false;
					}
					if (leader.HaveKeyword(`G3_DarkKnight_Armor3_hidden`)
						&& !leader.HaveKeyword(`G3_DarkKnight_Armor4_hidden`))
					{
						// G2jump, G3jump 난이도 상향
						if (
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) && leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Tirnanog_Dungeon_g2jump_and_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else if(
							(
								// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
								GetVersion() >= 403
//								&& GetLocale().LowerCase() == `korea`.LowerCase()
							)
							&& (leader.HaveKeyword(`g2_jump`) || leader.HaveKeyword(`g3_jump`))
						)
						{
							_dungeon = `G3_DarkKnight_Tirnanog_Dungeon_g2jump_or_g3jump`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
						else
						{
							_dungeon = `G3_DarkKnight_Tirnanog_Dungeon`;
							_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
							return true;
						}
					}
					else return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.130"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];//이 던전은 혼자서만 들어갈 수 있습니다.
				return false;
			}
		}

		if (_item.GetClassId() == 75115)	// G3_DarkKnight 알베이던전2 입장
		{
			// 유료, 무료사용자 모두 들어가도록 수정
			if (_party.GetSize() == 1)
			{
				if (IsNoPetHere(_party,_reply))
				{
					if (leader.HaveKeyword(`G3_DarkKnight_Complete_hidden`))
					{
						_reply = ["event.enter_dungeon.50"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
						return false;
					}
					else if (leader.HaveKeyword(`G3_DarkKnight_Temptation_hidden`))
					{
						_dungeon = `G3_DarkKnight_Tirnanog_Again_Dungeon`;
						_option = `private=\"true\"`;// savestatueid=\"10042\" laststatueid=\"10042\"`;
						return true;
					}
					else return false;
				}
				else
				{
					_reply = ["event.enter_dungeon.131"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.67"];//이 던전은 혼자서만 들어갈 수 있습니다.
				return false;
			}
		}
	}
////////////////////////////////////////////////////////
////피오드 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else if(_dungeon.EqualToWithoutCase(`Danu_Dungeon`))
	{
		if (_item.GetClassId() == 63119)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.96"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 피오드 1인 중급 던전
					_dungeon = `Gairech_Fiodh_Middle_1_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.97"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90017)
		{
			//2인 던전 테스트를 위해서
			_reply = ["event.enter_dungeon.98"];
			_dungeon = `Gairech_Fiodh_Middle_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63120)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.99"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 피오드 2인 중급 던전
					_dungeon = `Gairech_Fiodh_Middle_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.100"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90018)
		{
			//4인 던전 테스트를 위해서
			_reply = ["event.enter_dungeon.101"];
			_dungeon = `Gairech_Fiodh_Middle_4_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63121)
		{
			if(_item.IsExpired())
			{
				// 피오드 4인 중급 던전
				_reply = ["event.enter_dungeon.102"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 4)
				{
					_dungeon = `Gairech_Fiodh_Middle_4_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.103"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 63253)
		{
			if(_item.IsExpired())
			{
				// 피오드 상급 던전 인원 제한 없음
				_reply = ["event.enter_dungeon.102"];
				return false;
			}
			else
			{
				_dungeon = `Gairech_Fiodh_High_Dungeon`;
				return true;
			}
		}		
		else
		if (_item.GetClassId() == 74005)//피오드로 유령 만나러 왔으면
		{
			if (_party.GetSize() == 1)//혼자다
			{
				if (leader.HaveKeyword(`g2_11`))//g2_10번 챕터 수행중이다
				{
					if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment())//유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply))
						{
							//G2_10
							_dungeon = `G2_11_Gairech_Fiodh_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.104"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.105"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.106"];
				return false;
			}
		}

		// G9S2 레이나의 바이올렛 던전
		else
		if (_item.GetClassId() == 63186)
		{
			if (_party.GetSize() == 1)
			{
				_dungeon = `Gairech_Fiodh_Cai_RP`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.182"];
				return false;
			}
		}
		if (_item.GetClassId() == 75018)	//G3_06 여신상 복구 피오드던전
		{

			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Fiodh`)
					&& (
						(leader.IsQuestTried(230006) && !leader.IsQuestCompleted(230006))
						|| (leader.IsQuestTried(230043) && !leader.IsQuestCompleted(230043))
					)
				)
				{
					_dungeon = `Gairech_Fiodh_Dungeon_Recover`;
					_option = `private=\"true\"`;// savestatueid=\"27030\" laststatueid=\"27030\"`;

					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}

			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}
		}

////////////////////////////////////////////////////////
////다른 던전의 통행증을 가지고 들어가려 할 때
////////////////////////////////////////////////////////
		if (IsDungeonPass(_item)	)	// 주어진 통행증이 던전 통행증이고,
		{
			if (IsWrongDungoeonPass(_dungeon, _item))	// 다른 던전의 통행증이라면
			{
				_reply = ["event.enter_dungeon.133"];
				return false;
			}
		}
		if (
			((GetLocale().LowerCase() == `europe`) || (IsCurrentEvent(`g1_easy_overseas`)) || (IsEnable(`featureG1MainStreamEasy`) extern (`data/script/features.mint`)))
			&& (leader.HaveKeyword(`g1_28`))
		)
		{
			_dungeon = `Gairech_Fiodh_Dungeon_EU`;
			return true;
		}
		else
		{
			/////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////
			//이것 절대 누락되면 안됨.
			//던전 입구가 '다누 던전' 이라 '피오드 던전'으로 바꿔 이어주어야 한다. OTL
			_dungeon = `Gairech_Fiodh_Dungeon`;
			return true;
			/////////////////////////////////////////////////////////////
			/////////////////////////////////////////////////////////////
		}
	}

////////////////////////////////////////////////////////
//코일 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Emain_Coill_Dungeon`))
	{
		if (_item.GetClassId() == 74006) //리다이어으 매모리얼 아이템
		{
			if (_party.GetSize() == 1)
			{
				if (leader.HaveKeyword(`g2_18`))
				{
					if (leader.IsMainStreamPlayablePlayer(2) || IsDevelopment()) // 유료사용자거나 개발버전이다
					{
						if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
						{
							// G2RP_18
							_dungeon = `G2RP_18_Emain_Coill_Dungeon`;
							return true;
						}
						else return false;
					}
					else
					{
						_reply = ["event.enter_dungeon.107"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.108"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.109"];
				return false;
			}
		}

		if (_item.GetClassId() == 75019)	//G3_06 여신상 복구 코일던전
		{
			// G3 난이도 하향
			if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Coil`)
				&&
				(
					(leader.IsQuestTried(230001) && !leader.IsQuestCompleted(230001)) || (leader.IsQuestTried(230002) && !leader.IsQuestCompleted(230002))
					|| (leader.IsQuestTried(230041) && !leader.IsQuestCompleted(230041)) || (leader.IsQuestTried(230042) && !leader.IsQuestCompleted(230042))
				)
			)
			{
				if (
					// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
					GetVersion() >= 403
//					&& GetLocale().LowerCase() == `korea`.LowerCase()
				)
				{
					DebugOut(`코일던전 복구 난이도 하향 입장`);
					_dungeon = `Emain_Coill_Dungeon_Recover_easy`;
					_option = `private=\"true\"`;// savestatueid=\"27030\" laststatueid=\"27030\"`;
					return true;
				}
				else
				{
					_dungeon = `Emain_Coill_Dungeon_Recover`;
					_option = `private=\"true\"`;// savestatueid=\"27030\" laststatueid=\"27030\"`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
				return false;
			}
		}
		if (_item.GetClassId() == 74203)	//팔라딘 스킬 입수 코일던전
		{
			if (leader.HaveKeyword(`Book_of_Paladin_hidden`)
				&& leader.HaveKeyword(`Book_of_Paladin_complete`)) // 팔라딘 서의 완성을 뜻함 -_-
			{
				if (_party.GetSize() == 1)
				{
					_dungeon = `Emain_Coill_Dungeon_Paladin`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.109"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
				return false;
			}
		}
		//엘레멘탈 던전
		if (_item.GetClassId() == 63148) //이런 걸 던젔다면
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.68"];
				return false;
			}
			else
			{
				// 엘레멘탈 던전으로 보낸다
				_dungeon = `Emain_Coill_Dungeon_Gianticesprite`;
				return true;
			}
		}
		//엘라하 RP 던전
		if (_item.GetClassId() == 75259 && !leader.HaveKeyword(`elatha_rp_clear`))	// 이미 RP 던전을 클리어한 상태이면 일반 던전으로 보내자
		{
			if (GetDay() == 2 || IsDevelopment() || IsEnable(`featureG9MakeEasy`) extern (`data/script/features.mint`))		// g9s3 부터 국내는 요일 적용 안 받음.
			{
				if (_party.GetSize() == 1)
				{
					if(IsNoPaladinHere(_party,_reply) && IsNoPetHere(_party,_reply) && IsNoPetSummonerHere(_party,_reply))
					{
						_dungeon = `Emain_Coill_Dungeon_G9_ElathaRP`;

						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.172"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.173"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.174"];
				return false;
			}
		}
	}

////////////////////////////////////////////////////////
//룬다 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Emain_Runda_Dungeon`))
	{
		if (_item.GetClassId() == 63126)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 2)
				{
					// 룬다 2인 상급 던전
					_dungeon = `Emain_Runda_High_2_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.111"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 75477)	// 세이렌의 소라고둥
		{
			if (leader.GetCompletedQuestObjectiveCount(294215) == 2)
			{
				int level = leader.GetCumLevel() + leader.GetLevel();

				// 누적레벨 1000 이상은 룬다 하급
				if (level > 1000)
				{
					_dungeon = `Emain_Runda_Dungeon_G13_Hard`;
					return true;
				}
				// 누적레벨 300 이상은 룬다 일반
				else if(level > 300)
				{
					_dungeon = `Emain_Runda_Dungeon_G13_Mid`;
					return true;
				}
				// 누적레벨 300 이하는 룬다 초급
				else
				{
					_dungeon = `Emain_Runda_Dungeon_G13_Easy`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.208"];
				return false;
			}
		}		
		else
		if (_item.GetClassId() == 63105)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}
			else
			{	// 룬다 하급 던전
				_dungeon = `Emain_Runda_Low_Dungeon`;
				return true;
			}
		}
		else
		if (_item.GetClassId() == 63102 )
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 룬다 세이렌 던전
					_dungeon = `Emain_Runda_Middle_Siren_Dungeon`;
					_option = `bossroom=\"1\"`;
					//_option = _option+ ` bossmusic = \"boss2.mp3\"`;

					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.97"];
					return false;
				}

			}
		}

		else
		if (_item.GetClassId() == 91147)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 1)
				{
					// 룬다 세이렌 던전
					_dungeon = `Emain_Runda_Dungeon_G2_Paladin_RP`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.97"];
					return false;
				}

			}
		}

		else
		if (_item.GetClassId() == 90019)
		{
			//2인 던전 테스트를 위해서
			_dungeon = `Emain_Runda_High_2_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63127)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.112"];
				return false;
			}
			else
			{
				if (_party.GetSize() == 3)
				{
					// 룬다 3인 상급 던전
					_dungeon = `Emain_Runda_High_3_Dungeon`;
					return true;
				}
				else
				{
					_reply = ["event.enter_dungeon.113"];
					return false;
				}
			}
		}
		else
		if (_item.GetClassId() == 90020)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Emain_Runda_High_3_Dungeon`;
			return true;
		}
		else
		if (_item.GetClassId() == 63128)
		{
			if(_item.IsExpired())
			{
				// 룬다 상급 던전
				_reply = ["event.enter_dungeon.114"];
				return false;
			}
			else
			{
				_dungeon = `Emain_Runda_High_Dungeon`;
				return true;
			}
		}
		//룬다 보스 러시
		else
		if (_item.GetClassId() == 63157)
		{
			if (IsNoPetHere(_party,_reply))
			{
				if(_item.IsExpired())
				{
					_reply = ["event.enter_dungeon.79"];
					return false;
				}
				else
				{
					if (_party.GetSize() == 1)
					{
						// 룬다 1인 보스 러시
						_dungeon = `Emain_Runda_BossRush_Dungeon`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.78"];
						return false;
					}
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.128"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 90021)
		{
			//3인 던전 테스트를 위해서
			_dungeon = `Emain_Runda_High_Dungeon`;
			return true;
		}
		if (_item.GetClassId() == 75020)	//G3_06 여신상 복구 룬다던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Runda`)
					&&
					(
						(leader.IsQuestTried(230001) && !leader.IsQuestCompleted(230001)) || (leader.IsQuestTried(230002) && !leader.IsQuestCompleted(230002))
						|| (leader.IsQuestTried(230041) && !leader.IsQuestCompleted(230041)) || (leader.IsQuestTried(230042) && !leader.IsQuestCompleted(230042))
					)
				)
				{
					if (
						// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
						GetVersion() >= 403
//						&& GetLocale().LowerCase() == `korea`.LowerCase()
					)
					{
						_dungeon = `Emain_Runda_Dungeon_Recover_easy`;
						_option = `private=\"true\"`;// savestatueid=\"31094\" laststatueid=\"31094\"`;
						return true;
					}
					else
					{
						_dungeon = `Emain_Runda_Dungeon_Recover`;
						_option = `private=\"true\"`;// savestatueid=\"31094\" laststatueid=\"31094\"`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
		}

		if (_item.GetClassId() == 75216)	// G9 성전시가단 지부
		{
			if (_party.GetSize() ==  1 )
			{
				// 던전 보상으로 미션을 지급하기 때문에 미션 체크
				if (leader.FindShadowMission() == 0)
				{
					// 해당 퀘스트를 진행중이거나, devcat 또는 gm 타이틀 달고 있으면
					if (leader.GetCompletedQuestObjectiveCount(290006)==5 || leader.GetTitle() == 60000 || leader.GetTitle() == 60001)
					{
						int level = leader.GetCumLevel() + leader.GetLevel();
						// 누적레벨 300 미만은 초급
						if (level < 300)
						{
							_dungeon = `Emain_Runda_Dungeon_G9_HolyKnights1`;
						}
						// 누적레벨 900 이상은 상급
						else if (level >= 1000)
						{
							_dungeon = `Emain_Runda_Dungeon_G9_HolyKnights3`;
						}
						// 누적레벨 300~900 은 중급
						else
						{
							_dungeon = `Emain_Runda_Dungeon_G9_HolyKnights2`;
						}
						_option = `private=\"true\"`;// savestatueid=\"31094\" laststatueid=\"31094\"`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.175"];	// 퀘스트 진행중인 유저만 입장 가능
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.176"];
					return false;
				}
			}
			else
			{
					_reply = ["event.enter_dungeon.177"];	// 1인만 입장 가능
					return false;
			}
		}



		// G12 메인스트림 중 제너와 함께 도는 룬다 던전
		if (_item.GetClassId() == 75421)		// 기사단의 와펜 던지면
		{

			if (_party.GetSize() == 1)
			{

				if (leader.GetCompletedQuestObjectiveCount(293009) == 5)
				{

					int level = leader.GetCumLevel() + leader.GetLevel();
					// 누적레벨 300 미만은 초급
					if (level < 300)
					{
						_dungeon = `Emain_Runda_Dungeon_G12_HolyKnights`;
					}
					// 누적레벨 1000 이상은 상급
					else if (level >= 1000)
					{
						_dungeon = `Emain_Runda_Dungeon_G12_HolyKnights3`;
					}
					// 누적레벨 300~999 는 중급
					else
					{
						_dungeon = `Emain_Runda_Dungeon_G12_HolyKnights2`;
					}
					_option = `private=\"true\"`;
					return true;

				}
				else
				{
					_reply = ["event.enter_dungeon.192"];
					return false;
				}

			}
			else
			{
				_reply = ["event.enter_dungeon.193"];
				return false;
			}
		}













		// 황금쥐 던전
		if (_item.GetClassId() == 63175 )
		{
			if ( IsCurrentEvent(`newyear2008_taiwan`))
			{
				if(_item.IsExpired())
				{
					_reply = ["event.enter_dungeon.155"];
					return false;
				}
				else
				{
					_dungeon = `Emain_Runda_Golden_Rat_Dungeon`;
					return true;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.156"];
				return false;
			}
		}

		// 하드모드 룬다 던전 테스트 버전  - 정식으로 하드모드 로비가 잘 되면 의미가 없어지는 부분이다. - orcen 2008/01/15
		if (_item.GetClassId() == 63176)		//  하드 일반
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63177)		//  하드 하급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63178)		//  하드 중급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_Middle_Hardmode_Siren_Dungeon`;
				_option = `bossroom=\"1\"`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63179)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_High_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
	}
///////////////////////////////////////////////////////////////////
////// 하드모드 룬다 던전에 이런 아이템들을 던지면 딴 데로 보낸다
///////////////////////////////////////////////////////////////////
	else if (_dungeon.EqualToWithoutCase(`Emain_Runda_Hardmode_Dungeon`))//원래 하드모드 알비던전에 갈 예정인디
	{
		int i;
		character	cChar;

		cChar = (character)_party.GetValue(i);
		if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5) && (_party.GetSize() == 1)) ||
		((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250) && (_party.GetSize() == 1)))
		{
			_reply = ["event.enter_dungeon.166"];
			return false;
		}
		for (i = 0; i < _party.GetSize();  i++)
		{
			cChar = (character)_party.GetValue(i);
			if (((IsTestServer() || IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<5)) ||
			((!IsTestServer() && !IsDevelopment()) && (cChar.GetCumLevel()+cChar.GetLevel()<250)))
			{
				_reply = ["event.enter_dungeon.167"];
				return false;
			}
		}


		if (_item.GetClassId() == 63105)		//  하드 하급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_Low_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63102)		//  하드 중급 - 세이렌
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_Middle_Hardmode_Siren_Dungeon`;
								_option = `bossroom=\"1\"`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
		if (_item.GetClassId() == 63126 || _item.GetClassId() == 63127 || _item.GetClassId() == 63128)		// 하드 상급
		{
			if(!_item.IsExpired() && GetVersion() >= 802)
			{
				_dungeon = `Emain_Runda_High_Hardmode_Dungeon`;
				return true;
			}
			else
			{
				_reply = ["event.enter_dungeon.155"];
				return false;
			}
		}
	}

////////////////////////////////////////////////////////
//페카 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Senmag_Peaca_Dungeon`))
	{
		_option = `gloweffect=\"1\"`;
		if(_item.GetClassId() == 90005)
		{
			_dungeon = `Senmag_Peaca_Dungeon`;
			return true;
		}

		// 페카 초급 던전
		if (_item.GetClassId() == 63144)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.12"];
				return false;
			}
			else
			{
				// 페카 초급 던전
				_dungeon = `Senmag_Peaca_Beginner_Dungeon`;
				return true;
			}
		}

		// 페카 하급 던전
		if (_item.GetClassId() == 63145)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.12"];
				return false;
			}
			else
			{
				// 페카 하급 던전
				_dungeon = `Senmag_Peaca_Low_Dungeon`;
				return true;
			}
		}

		// 페카 중급 던전
		if (_item.GetClassId() == 63227)
		{
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.12"];
				return false;
			}
			else
			{
				// 페카 하급 던전
				_dungeon = `Senmag_Peaca_Middle_Dungeon`;
				return true;
			}
		}


		// G12 메인스트림 중 헬베티우스 만나는 미션
		if (_item.GetClassId() == 75424)		// 페카 통행증
		{

			if (_party.GetSize() == 1)
			{

				if (leader.GetCompletedQuestObjectiveCount(293002) == 3)
				{

					int level = leader.GetCumLevel() + leader.GetLevel();
					// 누적레벨 300 미만은 초급
					if (level < 300)
					{
						_dungeon = `G12_Senmag_Peaca_Dungeon_Easy`;
					}
					// 누적레벨 1000 이상은 상급
					else if (level >= 1000)
					{
						_dungeon = `G12_Senmag_Peaca_Dungeon_Hard`;
					}
					// 누적레벨 300~999 는 중급
					else
					{
						_dungeon = `G12_Senmag_Peaca_Dungeon_Mid`;
					}
					_option = `private=\"true\"`;	// savestatueid=\"31094\" laststatueid=\"31094\"`;
					return true;

				}
				else
				{
					_reply = ["event.enter_dungeon.194"];
					return false;
				}

			}
			else
			{
				_reply = ["event.enter_dungeon.195"];
				return false;
			}
		}








		// 페카 g11 루카스 테러 던전
		if (_item.GetClassId() == 52017)		// 속옷
		{
			if (leader.GetCompletedQuestObjectiveCount(292009) == 3)
			{
				_dungeon = `Senmag_Peaca_Dungeon_G11`;
				return true;
			}
			else
			{
				// 별다른 처리 없다. 일반 아이템으로 간주된다.
			}
		}





		if (_item.GetClassId() == 75021)	//G3_06 여신상 복구 페카던전
		{
			if (leader.IsMainStreamPlayablePlayer(3))
			{
				// G3 난이도 하향
				if (leader.HaveKeyword(`g3_06`) && leader.HaveKeyword(`g3_06_Broken_Peaca`)
					&&
					(
						(leader.IsQuestTried(230001) && !leader.IsQuestCompleted(230001)) || (leader.IsQuestTried(230002) && !leader.IsQuestCompleted(230002))
						|| (leader.IsQuestTried(230041) && !leader.IsQuestCompleted(230041)) || (leader.IsQuestTried(230042) && !leader.IsQuestCompleted(230042))
					)
				)
				{
					if (
						// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
						GetVersion() >= 403
//						&& GetLocale().LowerCase() == `korea`.LowerCase()
					)
					{
						_dungeon = `Senmag_Peaca_Dungeon_Recover_easy`;
						_option = `private=\"true\"`;// savestatueid=\"31095\" laststatueid=\"31095\"`;
						return true;
					}
					else
					{
						_dungeon = `Senmag_Peaca_Dungeon_Recover`;
						_option = `private=\"true\"`;// savestatueid=\"31095\" laststatueid=\"31095\"`;

						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.51"];//이 아이템으로는 더이상 이 던전에 들어갈 수 없습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.5"];	//무료사용자는 못들어갑니다
				return false;
			}

		}

		if (_party.GetSize() < 4)
		{
			_reply = ["event.enter_dungeon.127"];
			return false;
		}
	}

////////////////////////////////////////////////////////
//두갈드 성 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Dugald_Keep_Dungeon`))
	{
		if (_item.GetClassId() == 63146)
		{
			castle target_castle = GetCastleFromName(`dugald_castle`);
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}

			if (target_castle.IsValid())
			{
				if (target_castle.IsOwned())
				{
					if (target_castle.IsSellDungeonPass())
					{
						_dungeon = `Dugald_Keep_Dungeon`;
						return true;
					}
					else
					{
						int i;
						character	cChar;

						for (i = 0; i < _party.GetSize();  i++)
						{
							cChar = (character)_party.GetValue(i);
							if (!target_castle.IsOwner(cChar))
							{
								_reply = ["event.enter_dungeon.135"];
								return false;
							}
						}
						// 다 통과했다 - 파티의 모든 사람이 성 길드원이다.
						_dungeon = `Dugald_Keep_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.136"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.137"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 90005)
		{
			//던전 테스트를 위해서
			_dungeon = `Dugald_Keep_Dungeon`;
			return true;
		}
		else
		{
			// 다른 아이템을 넣으면 못들어갑니다.
			_reply = ["event.enter_dungeon.138"];
			return false;
		}
	}
////////////////////////////////////////////////////////
//센마이 성 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Senmag_Keep_Dungeon`))
	{
		if (_item.GetClassId() == 63147)
		{
			castle target_castle = GetCastleFromName(`senmag_castle`);
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}

			if (target_castle.IsValid())
			{
				if (target_castle.IsOwned())
				{
					if (target_castle.IsSellDungeonPass())
					{
						_dungeon = `Senmag_Keep_Dungeon`;
						return true;
					}
					else
					{
						int i;
						character	cChar;

						for (i = 0; i < _party.GetSize();  i++)
						{
							cChar = (character)_party.GetValue(i);
							if (!target_castle.IsOwner(cChar))
							{
								_reply = ["event.enter_dungeon.139"];
								return false;
							}
						}
						// 다 통과했다 - 파티의 모든 사람이 성 길드원이다.
						_dungeon = `Senmag_Keep_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.140"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.141"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 90005)
		{
			//던전 테스트를 위해서
			_dungeon = `Senmag_Keep_Dungeon`;
			return true;
		}
		else
		{
			// 다른 아이템을 넣으면 못들어갑니다.
			_reply = ["event.enter_dungeon.142"];
			return false;
		}
	}
////////////////////////////////////////////////////////
//아브 네아 성 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Abbneagh_Keep_Dungeon`))
	{
			 DebugOut(`왔나0`);


		if (_item.GetClassId() == 63187)
		{
			castle target_castle = GetCastleFromName(`abbneagh_castle`);
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.110"];
				return false;
			}

			if (target_castle.IsValid())
			{
				// 성 소유자가 있거나, 데브캣이면 입장 가능
				if (target_castle.IsOwned() || leader.GetTitle() == 60001)
				{
					if (target_castle.IsSellDungeonPass() || leader.GetTitle() == 60001)
					{
						_dungeon = `Abbneagh_Keep_Dungeon`;
						return true;
					}
					else
					{
						int i;
						character	cChar;

						for (i = 0; i < _party.GetSize();  i++)
						{
							cChar = (character)_party.GetValue(i);
							if (!target_castle.IsOwner(cChar))
							{
								_reply = ["event.enter_dungeon.135"];
								return false;
							}
						}
						// 다 통과했다 - 파티의 모든 사람이 성 길드원이다.
						_dungeon = `Abbneagh_Keep_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.136"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.137"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 90005)
		{
			//던전 테스트를 위해서
			_dungeon = `Abbneagh_Keep_Dungeon`;
			return true;
		}
		else
		{
			// 다른 아이템을 넣으면 못들어갑니다.
			_reply = ["event.enter_dungeon.184"];
			return false;
		}
	}
////////////////////////////////////////////////////////
//퀼린 성 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	else
	if (_dungeon.EqualToWithoutCase(`Cuilin_Keep_Dungeon`)) 
	{
			 DebugOut(`왔나1`);

		if (_item.GetClassId() == 63254)
		{
			castle target_castle = GetCastleFromName(`cuilin_castle`);
			if(_item.IsExpired())
			{
				_reply = ["event.enter_dungeon.209"];
				return false;
			}

			if (target_castle.IsValid())
			{
				// 성 소유자가 있거나, 데브캣이면 입장 가능
				if (target_castle.IsOwned() || leader.GetTitle() == 60001)
				{
					if (target_castle.IsSellDungeonPass() || leader.GetTitle() == 60001)
					{
						_dungeon = `Cuilin_Keep_Dungeon`;
						return true;
					}
					else
					{
						int i;
						character	cChar;

						for (i = 0; i < _party.GetSize();  i++)
						{
							cChar = (character)_party.GetValue(i);
							if (!target_castle.IsOwner(cChar))
							{
								_reply = ["event.enter_dungeon.210"];
								return false;
							}
						}
						// 다 통과했다 - 파티의 모든 사람이 성 길드원이다.
						_dungeon = `Cuilin_Keep_Dungeon`;
						return true;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.211"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.212"];
				return false;
			}
		}
		else
		if (_item.GetClassId() == 90005)
		{
			//던전 테스트를 위해서
			_dungeon = `Cuilin_Keep_Dungeon`;
			return true;
		}
		else
		{
			// 다른 아이템을 넣으면 못들어갑니다.
			_reply = ["event.enter_dungeon.213"];
			return false;
		}
	}

////////////////////////////////////////////////////////
//바올 던전에 이런 아이템들을 던지면 딴 데로 보낸다
////////////////////////////////////////////////////////
	if (_dungeon.EqualToWithoutCase(`Tirnanog_Baol_Dungeon`))
	{
		if (_item.GetClassId() == 75006)
		{
			if(leader.HaveKeyword(`g3`) && (leader.HaveKeyword(`g3_09`) || leader.HaveKeyword(`g3_10`) || leader.HaveKeyword(`g3_11`)))
			{
				if (GetDay() == 0 ) //일요일이면
				{
					if(_party.GetSize() ==1)
					{
						if(leader.IsMainStreamPlayablePlayer(3))
						{
							if(IsNoPaladinHere(_party,_reply))
							{
								// G3 난이도 하향
								if (
									// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
									GetVersion() >= 403
//									&& GetLocale().LowerCase() == `korea`.LowerCase()
								)
								{
									// 바올 잠입 던전
									_dungeon = `G3_11_Tirnanog_Baol_Dungeon_easy`;
									_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
									return true;
								}
								else
								{
									// 바올 잠입 던전
									_dungeon = `G3_11_Tirnanog_Baol_Dungeon`;
									_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
									return true;
								}
							}
							else
							{
								return false;
							}
						}
						else
						{
							_reply = ["event.enter_dungeon.123"];
							return false;
						}
					}
					else
					{
						_reply = ["event.enter_dungeon.58"];//이 던전은 혼자서만 들어갈 수 있습니다.
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.124"];
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.50"]; //이 아이템으로는 더이상 들어갈 수 없습니다
				return false;
			}
		}
		else if (_item.GetClassId() == 90011)
		{
			// G3 난이도 하향
			if (
				// G3 난이도 하향 : C2G4S2부터 일괄 적용하도록 수정 by jisangs, 06/05/16
				GetVersion() >= 403
//				&& GetLocale().LowerCase() == `korea`.LowerCase()
			)
			{
				// 바올 잠입 던전
				_dungeon = `G3_11_Tirnanog_Baol_Dungeon_easy`;	// 하향 후 지하 1층
				_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
				return true;
			}
			else
			{
				// 바올 잠입 던전
				_dungeon = `G3_11_Tirnanog_Baol_Dungeon`;		// 하향 전 지하 3층
				_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
				return true;
			}
		}
		//최종던전  테스트
		else if (_item.GetClassId() == 75023)
		{
			if(leader.GetTitle()==60001)
			{
				_dungeon = `G3_16_Tirnanog_Baol_Dungeon`;
				_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
				return true;
			}
			else
			if(leader.HaveKeyword(`g3`) && (leader.HaveKeyword(`g3_15`)|| leader.HaveKeyword(`g3_16`) || leader.HaveKeyword(`g3_17`) || leader.HaveKeyword(`g3_18`)))
			{
				if(_party.GetSize() ==3)
				{
					if(leader.IsMainStreamPlayablePlayer(3))
					{
						_dungeon = `G3_16_Tirnanog_Baol_Dungeon`;
						_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
						return true;
					}
					else
					{
						_reply = ["event.enter_dungeon.125"];
						return false;
					}
				}
				else
				{
					_reply = ["event.enter_dungeon.18"]; //3명으로 구성된 파티만이 이 던전에 들어갈 수 있습니다.
					return false;
				}
			}
			else
			{
				_reply = ["event.enter_dungeon.50"]; //이 아이템으로는 더이상 들어갈 수 없습니다
				return false;
			}
		}
		else if (_item.GetClassId() == 90012)
		{
			_dungeon = `G3_16_Tirnanog_Baol_Dungeon`;
			_option = `largebossroom=\"true\" lastfloorsight=\"7\"`;
			return true;
		}
		else
		{
			_reply = ["event.enter_dungeon.126"];
			return false;
		}
	}

	if (_dungeon.EqualToWithoutCase(`JG_Neko_Dungeon`))//고양이 던전
	{
		// JG 고양이 던전
		if (_item.GetClassId() == 63203)
		{
			// (임시) JG 고양이 던전
			_dungeon = `JG_Neko_Dungeon`;
			_option = `no_minimap=\"true\"`;

			return true;
		}
		// JG 고양이 던전2
		else if (_item.GetClassId() == 63204)
		{
			// (임시) JG 고양이 던전
			_dungeon = `JG_Neko_Dungeon2`;
			_option = `no_minimap=\"true\"`;

			return true;
		}
		else if (_item.GetClassId() == 51076)
		{
			// (임시) JG 고양이 던전
			_dungeon = `JG_Neko_Dungeon3`;
			_option = `no_minimap=\"true\"`;

			return true;
		}


		else
		{
			_reply = ["event.enter_dungeon.126"];
			return false;
		}
	}

////////////////////////////////////////////////////////
////다른 던전의 통행증을 가지고 들어가려 할 때
////////////////////////////////////////////////////////
	if (IsDungeonPass(_item)	)	// 주어진 통행증이 던전 통행증이고,
	{
		if (IsWrongDungoeonPass(_dungeon, _item))	// 다른 던전의 통행증이라면
		{
			_reply = ["event.enter_dungeon.134"];
			return false;
		}
	}

////////////////////////////////////////////////////////
////이도 저도 아니면
////////////////////////////////////////////////////////
	return true; //원래 로비에 이어진 던전으로 그냥 가라
}


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		IsAlbyDungeonPass(_item)
		|| IsCiarDungeonPass(_item)
		|| IsRabbieDungeonPass(_item)
		|| IsMathDungeonPass(_item)
		|| IsBarriDungeonPass(_item)
		|| IsTirnanogDungeonPass(_item)
		|| IsDanuDungeonPass(_item)
		|| IsCoillDungeonPass(_item)
		|| IsRundaDungeonPass(_item)
		|| IsPeacaDungeonPass(_item)
		|| IsBaolDungeonPass(_item)
		|| IsDugaldDungeonPass(_item)
		|| IsSenmagDungeonPass(_item)
		|| IsAbbNeaghDungeonPass(_item)
		|| IsCuilinDungeonPass(_item)
		|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsWrongDungoeonPass(
		string& _dungeon,
		item _item)
////////////////////////////////////////////////////////
{
	if (_dungeon.EqualToWithoutCase(`TirCho_Alby_Dungeon`))//원래 알비던전에 갈 예정인디
	{
		if (
//			IsAlbyDungeonPass(_item)
			IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`TirCho_Alby_Hardmode_Dungeon`))//원래 하드모드 알비던전에 갈 예정인디
	{
		if (
//			IsAlbyDungeonPass(_item)
			IsAlbyHardmodeDungeonPass(_item)
			||IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`TirCho_Ciar_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
//			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`TirCho_Ciar_Hardmode_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
//			|| IsCiarDungeonPass(_item)
			|| IsCiarHardmodeDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Dunbarton_Rabbie_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
//			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Dunbarton_Math_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
//			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Bangor_Barri_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
//			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.
		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Tirnanog_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
//			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if(_dungeon.EqualToWithoutCase(`Danu_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
//			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Emain_Coill_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
//			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Emain_Runda_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
//			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Emain_Runda_Hardmode_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
//			|| IsRundaDungeonPass(_item)
			|| IsRundaHardmodeDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Senmag_Peaca_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
//			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Dugald_Keep_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
//			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Senmag_Keep_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
//			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Abbneagh_Keep_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
//			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Cuilin_Keep_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
//			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}
	else if (_dungeon.EqualToWithoutCase(`Tirnanog_Baol_Dungeon`))
	{
		if (
			IsAlbyDungeonPass(_item)
			|| IsCiarDungeonPass(_item)
			|| IsRabbieDungeonPass(_item)
			|| IsMathDungeonPass(_item)
			|| IsBarriDungeonPass(_item)
			|| IsTirnanogDungeonPass(_item)
			|| IsDanuDungeonPass(_item)
			|| IsCoillDungeonPass(_item)
			|| IsRundaDungeonPass(_item)
			|| IsPeacaDungeonPass(_item)
//			|| IsBaolDungeonPass(_item)
			|| IsDugaldDungeonPass(_item)
			|| IsSenmagDungeonPass(_item)
			|| IsAbbNeaghDungeonPass(_item)
			|| IsCuilinDungeonPass(_item)
			|| _item.GetClassId() == 85037   // 무제한 던전 통행증은 떨궈서는 입장할 수 없다.

		)
		{
			return true;
		}
	}

	return false;	// 해당 던전의 통행증이었다.
}


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsAlbyDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63101	// 알비 하급 마족 통행증

		|| _item.GetClassId() == 63116	// 알비 중급 1인 마족 통행증
		|| _item.GetClassId() == 63117	// 알비 중급 2인 마족 통행증
		|| _item.GetClassId() == 63118	// 알비 중급 4인 마족 통행증

		|| _item.GetClassId() == 63159	// 알비 상급 1인 마족 통행증
		|| _item.GetClassId() == 63160	// 알비 상급 3인 마족 통행증
		|| _item.GetClassId() == 63161	// 알비 상급 무제한 마족 통행증

		|| _item.GetClassId() == 63140	// 알비 초급 통행증
		|| _item.GetClassId() == 75014	// 부서진 여신상이 있는 알비 던전 통행증
		|| _item.GetClassId() == 63149	// 마법 콩 던전
		|| _item.GetClassId() == 63174	// 황금쥐 던전
		|| _item.GetClassId() == 63265	// 알비 PC방 던전
		|| _item.GetClassId() == 63262	// 알비 상급 PC방 던전
	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// 하드모드 3종(현재 룬다/알비/키아)를 입장체크하는 이 함수는 알비에는 갈 수 있으나 하드모드 알비에는 갈 수 없는
// 아이템의 리스트를 정리했다. 따라서 여기 있는 리스트를 떨구면 입장할 수 없어야 한다.
server bool
	IsAlbyHardmodeDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63140	// 알비 초급 통행증
		|| _item.GetClassId() == 75014	// 부서진 여신상이 있는 알비 던전 통행증
		|| _item.GetClassId() == 63149	// 마법 콩 던전
		|| _item.GetClassId() == 63174	// 황금쥐 던전
	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsCiarDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63104	// 키아 하급 마족 통행증
		|| _item.GetClassId() == 63122	// 트레보가 준 키아 마족 통행증

		|| _item.GetClassId() == 63123	// 키아 중급 1인 마족 통행증
		|| _item.GetClassId() == 63124	// 키아 중급 2인 마족 통행증
		|| _item.GetClassId() == 63125	// 키아 중급 4인 마족 통행증

		|| _item.GetClassId() == 63136	// 키아 상급 2인 마족 통행증
		|| _item.GetClassId() == 63137	// 키아 상급 3인 마족 통행증
		|| _item.GetClassId() == 63138	// 키아 상급 마족 통행증
		|| _item.GetClassId() == 63261	// 키아 상급 PC방 마족 통행증


		|| _item.GetClassId() == 63139	// 키아 초급 통행증
		|| _item.GetClassId() == 75015	// 부서진 여신상이 있는 키아 던전 통행증
		|| _item.GetClassId() == 75113	// G3_DarkKnight 키아 던전 통행증
		|| _item.GetClassId() == 63156	// 키아 보스 러시 던전 통행증

		|| _item.GetClassId() == 63162	// 키아 이벤트 던전 통행증
	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsCiarHardmodeDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (

		_item.GetClassId() == 63139	// 키아 초급 통행증
		|| _item.GetClassId() == 75015	// 부서진 여신상이 있는 키아 던전 통행증
		|| _item.GetClassId() == 75113	// G3_DarkKnight 키아 던전 통행증
		|| _item.GetClassId() == 63156	// 키아 보스 러시 던전 통행증

		|| _item.GetClassId() == 63162	// 키아 이벤트 던전 통행증

	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsRabbieDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63110	// 라비 하급 마족 통행증

		|| _item.GetClassId() == 63111	// 라비 중급 마족 통행증
		|| _item.GetClassId() == 63264	// 라비 하급 pc방마족 통행증


		|| _item.GetClassId() == 63112	// 라비 상급 마족 통행증 (not used)
		|| _item.GetClassId() == 63141	// 라비 상급 2인 마족 통행증
		|| _item.GetClassId() == 63142	// 라비 상급 3인 마족 통행증
		|| _item.GetClassId() == 63143	// 라비 상급 마족 통행증

		|| _item.GetClassId() == 75016	// 부서진 여신상이 있는 라비 던전 통행증

		|| _item.GetClassId() == 63173	// 마법 카카오 콩 던전 통행증
		|| _item.GetClassId() == 63175	// 황금쥐 던전 통행증
		|| _item.GetClassId() == 63182	// 중국 프리미엄 피씨방 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsMathDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63107	// 마스 하급 마족 통행증

		|| _item.GetClassId() == 63108	// 마스 중급 마족 통행증

		|| _item.GetClassId() == 63109	// 마스 상급 마족 통행증 (not used)
		|| _item.GetClassId() == 63129	// 마스 상급 2인 마족 통행증
		|| _item.GetClassId() == 63130	// 마스 상급 3인 마족 통행증
		|| _item.GetClassId() == 63131	// 마스 상급 마족 통행증

		|| _item.GetClassId() == 74004	// 팔라딘 수련생용 마스 던전 통행증
		|| _item.GetClassId() == 75017	// 부서진 여신상이 있는 마스 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsBarriDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63113	// 바리 하급 마족 통행증
		|| _item.GetClassId() == 63114	// 바리 중급 마족 통행증
		|| _item.GetClassId() == 63115	// 바리 상급 마족 통행증 (not used)
		|| _item.GetClassId() == 63263	// 바리 상급 pc방마족 통행증

		|| _item.GetClassId() == 63132	// 바리 정령 던전 통행증

		|| _item.GetClassId() == 63133	// 바리 상급 2인 마족 통행증
		|| _item.GetClassId() == 63134	// 바리 상급 3인 마족 통행증
		|| _item.GetClassId() == 63135	// 바리 상급 마족 통행증
		|| _item.GetClassId() == 63170	// 바리 숨겨진 광산 통행증

		|| _item.GetClassId() == 73011	// 갈색 마족 통행증
		|| _item.GetClassId() == 73012	// 검은 마족 통행증

		|| _item.GetClassId() == 74001	// 팔라딘 수련생용 바리 던전 통행증
		|| _item.GetClassId() == 74002	// 바리 던전 통행증
		|| _item.GetClassId() == 74003	// 미스릴 광산 통행권
		|| _item.GetClassId() == 74212	// 팔라딘 신규 스킬 입수 - 바리 던전 통행증
		|| _item.GetClassId() == 75000	// 저 세상과 연결된 바리 던전 통행증

		|| _item.GetClassId() == 75022	// 부서진 여신상이 있는 바리 던전 통행증

	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsTirnanogDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 73034	// 여신의 통행증

		|| _item.GetClassId() == 75114	// G3_DarkKnight 알베이 던전 통행증
		|| _item.GetClassId() == 75115	// G3_DarkKnight 알베이 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsDanuDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63119	// 피오드 중급 1인 마족 통행증
		|| _item.GetClassId() == 63120	// 피오드 중급 2인 마족 통행증
		|| _item.GetClassId() == 63121	// 피오드 중급 4인 마족 통행증

		|| _item.GetClassId() == 75018	// 부서진 여신상이 있는 피오드 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsCoillDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 74203	// 팔라딘 스킬 입수 - 각성의 부적

		|| _item.GetClassId() == 75019	// 부서진 여신상이 있는 코일 던전 통행증
		|| _item.GetClassId() == 75259	// G9 엘라하 RP 던전 - 엘라하의 사슬 목걸이
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsRundaDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63102	// 룬다 세이렌 던전 통행증
		|| _item.GetClassId() == 63105	// 룬다 하급 마족 통행증
		|| _item.GetClassId() == 63126	// 룬다 상급 2인 마족 통행증
		|| _item.GetClassId() == 63127	// 룬다 상급 3인 마족 통행증
		|| _item.GetClassId() == 63128	// 룬다 상급 마족 통행증

		|| _item.GetClassId() == 75020	// 부서진 여신상이 있는 룬다 던전 통행증
		|| _item.GetClassId() == 63157	// 룬다 보스 러시 던전 통행증
		|| _item.GetClassId() == 63175	// 황금쥐 던전 통행증
	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsRundaHardmodeDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 75020	// 부서진 여신상이 있는 룬다 던전 통행증
		|| _item.GetClassId() == 63157	// 룬다 보스 러시 던전 통행증
		|| _item.GetClassId() == 63175	// 황금쥐 던전 통행증
	)
	{
		return true;
	}

	return false;
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsPeacaDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63144	// 페카 초급 통행증
		|| _item.GetClassId() == 63145	// 페카 하급 마족 통행증

		|| _item.GetClassId() == 75021	// 부서진 여신상이 있는 페카 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsDugaldDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63146	// 두갈드 성 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsSenmagDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63147	// 센마이 성 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsAbbNeaghDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63187 // 아브 네아 성 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsCuilinDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 63254 // 퀼린 성 던전 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsBaolDungeonPass(
		item _item)
////////////////////////////////////////////////////////
{
	if (
		_item.GetClassId() == 75023	// 바올 던전 통행증
		|| _item.GetClassId() == 75006	// 잠입용 통행증
	)
	{
		return true;
	}

	return false;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
server bool
	IsNoPaladinHere(
		object_list _party,
		string& _reply)
////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	for (i = 0; i < _party.GetSize();  i++)
	{
		cChar = (character)_party.GetValue(i);
		if(cChar.IsTransformed()) //이넘이 팔라딘이냐?
		{
			if (
				GetVersion() >= 604	//G6S4부터는 야수화도
			)
			{
				_reply = ["event.enter_dungeon.147"];
				return false;
			}

			else if (
				GetVersion() >= 304
			)
			{
				_reply = ["event.enter_dungeon.132"];
				return false;
			}
			else
			{
				_reply = ["event.enter_dungeon.115"];
				return false;
			}
		}
	}
	return true; //한넘도 팔라딩이 없었다.
}
////////////////////////////////////////////////////////
server bool
	IsNoPetHere(
		object_list _party,
		string& _reply)
////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	for (i = 0; i < _party.GetSize();  i++)
	{
		cChar = (character)_party.GetValue(i);
		if(cChar.IsPet()) //이넘이 로긴한 펫이냐?
		{
			_reply = ["event.enter_dungeon.118"];
			return false;
		}
	}
	return true; //한넘도 펫이 없었다.
}
////////////////////////////////////////////////////////
server bool
	IsNoManHere(
		object_list _party,
		string& _reply)
////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	for (i = 0; i < _party.GetSize();  i++)
	{
		cChar = (character)_party.GetValue(i);
		if(!cChar.IsPet()) //이넘이 로긴한 펫이냐?
		{
			_reply = ["event.enter_dungeon.215"];
			return false;
		}
	}
	return true; //모두 펫이다..
}
////////////////////////////////////////////////////////
server bool
	IsNoPetSummonerHere(
		object_list _party,
		string& _reply)
////////////////////////////////////////////////////////
{
	int i;
	character	cChar;

	for (i = 0; i < _party.GetSize();  i++)
	{
		cChar = (character)_party.GetValue(i);
		if(cChar.HasSummonedPet()) //이넘이 펫을 소환했당가?
		{
			_reply = ["event.enter_dungeon.119"];
			return false;
		}
	}
	return true; //한넘도 펫이 없었다.
}

