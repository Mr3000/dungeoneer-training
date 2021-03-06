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
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : 이 던전에 캐릭터가 들어올 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 입장한 캐릭터에게 인트로 컷신을 틀어준다.
	// DebugOut(["dungeon.dunbarton_rabbie_whiteday_dungeon.1"]);
	_player.PlayCutScene(`Event_Whiteday01_intro`);
}

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
////////////////////////////////////////////////////////////////////////////////
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
	// DebugOut(`[Rabbie Whiteday] OnCharacterEntered Called`);
	// DebugOut(`[Rabbie Whiteday] Move From `+ToString(_iOldFloor)+`To: `+ToString(_iNewFloor));

	if((_iOldFloor<_iNewFloor) && _iNewFloor==2 && !_player.IsPet())
	{
		// 2층으로 들어온 플레이어에게 컷신을 틀어준다.
		_player.PlayCutScene(`Event_Whiteday02_2F`);
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
}
////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : 이 던전의 보스방 문이 열리는 순간.
////////////////////////////////////////////////////////////////////////////////
{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;
	
	//솔로 좀비 컷신을 틀어준다.
	for (i = 0; i < cCharList.GetSize();  i++)
	{
		cChar = (character)cCharList.GetValue(i);
		cChar.PlayCutScene(`Event_Whiteday03_boss`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : 이 던전이 클리어 되었을 때 불리는 함수(보스방 뒷문이 열리자 마자 불린다)
////////////////////////////////////////////////////////////////////////////////
{
	if (GetLocale().LowerCase() == `korea`)
	{
		// 키워드, 인원 조사해서 보상 아이템을 넣어준다.
		object_list cCharList = _dungeon.GetPlayerList();
		character cChar;
		int i;
		int iRandom = Random(100);

		// 15%의 확률로 보상을 었는다.
		// DebugOut(`[테스트1] `+ToString(iRandom));
		if(iRandom < 15)
		{
			for (i = 0; i < cCharList.GetSize();  i++)
			{
				cChar = (character)cCharList.GetValue(i);

				// 이미 보상을 받은 캐릭터에게는 (키워드가 있을 경우) 아이템을 주지 않는다.	
				if(!cChar.HaveKeyword(`whiteday2010_korea_couple_suit`))
				{
					if(cChar.IsFemale())
					{
						cChar.DoStript(`additemex(id:15573 rewardview:true)`);	// 커플 수트 롱 (여)
						cChar.DoStript(`additemex(id:17539 rewardview:true)`);	// 커플 신발 (여)
					}
					else
					{
						cChar.DoStript(`additemex(id:15572 rewardview:true)`);	// 커플 수트 롱 (남)
						cChar.DoStript(`additemex(id:17538 rewardview:true)`);	// 커플 신발 (남)
					}

					// DebugOut(`[테스트1] 보상 받음`);
					cChar.AddKeyword(`whiteday2010_korea_couple_suit`);
					cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.5"], 3000);
				}
				else
				{
					// DebugOut(`[테스트1] 이미 보상 받음`);
					cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.6"], 3000);
				}
			}
		}
		else
		{
			for (i = 0; i < cCharList.GetSize();  i++)
			{
				cChar = (character)cCharList.GetValue(i);
				// DebugOut(`[테스트1] 확률이 다름`);
				cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.7"], 3000);
			}
		}
	}
	else
	{
		object_list cCharList = _dungeon.GetPlayerList();
		character cChar;
		int i;
		for (i = 0; i < cCharList.GetSize();  i++)
		{
			cChar = (character)cCharList.GetValue(i);
			if(!cChar.HaveKeyword(`whiteday2010_korea_couple_suit`))
			{
				if(cChar.IsFemale())
				{
					int randomSetId = 1029;
					int itemIndex = GetItemIndexFromRandomSet(randomSetId, cChar);
					
					string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
					
					item newItem;
					newItem = cChar.AddItemEx(itemString, true);
					int itemID2 = newItem.GetClassId();
					if (itemID2 == 2000)
					{
						cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.7"]);
					}
					if (itemID2 == 15573)
					{
						cChar.DoStript(`additemex(id:17539 rewardview:true)`);	// 커플 신발 (여)
						cChar.AddKeyword(`whiteday2010_korea_couple_suit`);
						cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.5"]);
					}

				}
				else
				{
					int randomSetId = 1030; 
					int itemIndex = GetItemIndexFromRandomSet(randomSetId, cChar);
					
					string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
					
					item newItem;
					newItem = cChar.AddItemEx(itemString, true);
					int itemID2 = newItem.GetClassId();
					if (itemID2 == 2000)
					{
						cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.7"]);
					}
					if (itemID2 == 15572)
					{
						cChar.DoStript(`additemex(id:17538 rewardview:true)`);	// 커플 신발 (남)
						cChar.AddKeyword(`whiteday2010_korea_couple_suit`);
						cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.5"]);
					}
				}
			}
			else
			{
				cChar.ShowCaption(["dungeon.dunbarton_rabbie_whiteday_dungeon.7"]);
			}
		}
	}
}