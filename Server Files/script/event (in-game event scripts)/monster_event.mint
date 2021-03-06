//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project PC Script
//                                                                         PC/더미
//
//                                            marlin fecit, begins at 2003. 11. 12
//                                                            marlin22@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnPulse(character _cMe, int _dwRaceId, string _strRaceStringId)
// : 몬스터의 Pulse 신호
//   이것이 호출되고 싶은 몬스터는
//   Race.xml의 FirstCreateStript 항목에 SetPulseInterval(min, max)를 설정해야 하며
//   GameServer의 CMonsterComponent::SetPulseInterval() 함수에서 
//   조건을 지정해주어야 한다.
//   코드쪽은 해당 함수의 주석 참조.
//////////////////////////////////////////////////////////////////////////////////
{
	// 파이톤스톤은 30초마다 배리어 검사를 한다.
	if (_cMe.CheckFastStringID(["event.monster_event.16"]))
	{
		int iLifeInterval = 200;

		if(_cMe.CheckFastStringID(["event.monster_event.17"]))
		{
			iLifeInterval = 800;
		}

		if (_cMe.CheckFastStringID(["event.monster_event.18"]))
		{
			if(_cMe.CheckFastStringID(["event.monster_event.19"]))
			{
				iLifeInterval = 1600;
			}
			else
			{
				iLifeInterval = 400;
			}
		}
		else if(_cMe.CheckFastStringID(["event.monster_event.20"]))
		{
			if(_cMe.CheckFastStringID(["event.monster_event.21"]))
			{
				iLifeInterval = 3200;
			}
			else
			{
				iLifeInterval = 800;
			}
		}
		else if(_cMe.CheckFastStringID(["event.monster_event.22"]))
		{
			if(_cMe.CheckFastStringID(["event.monster_event.23"]))
			{
				iLifeInterval = 4800;
			}
			else
			{
				iLifeInterval = 1200;
			}
		}

		string strConditionName = ["event.monster_event.24"];

		if (!_cMe.IsStatusDead())
		{
			// AI그룹의 멤버중 체력이 가장 큰 놈을 찾는다.
			int iLifeMax = _cMe.GetHighestLifeInAIGroup(`/pythonstone/`);

			// 파이톤스톤이 좀비상태이거나 체력이 가장 체력이 큰 놈과 n이상 차이나면 배리어를 발동시킨다.
			if (_cMe.IsPythonstoneDead() || iLifeMax - _cMe.GetLife() > iLifeInterval)
			{
				if (_cMe.IsInConditionWithName(strConditionName))
				{
					_cMe.RemoveConditionWithName(strConditionName);
				}
				_cMe.AddConditionWithName(strConditionName);
			}
		}
		else
		{
			if (_cMe.IsInConditionWithName(strConditionName))
			{
				_cMe.RemoveConditionWithName(strConditionName);
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool OnItemReceived(
	character _cMe,
	character _cGiver,
	item _cReceivedItem,
	bool _bIsSlave)
// : 몬스터에게 아이템이 전달되면 호출된다.
//////////////////////////////////////////////////////////////////////////////////
{

	if (IsEnable(`featureHotSpringMonkey`) extern (`data/script/features.mint`))
	{

		// 아이템을 받는 종족이 원숭이인 경우 특별한 처리를 해준다.
		if (_cMe.GetRaceName().LowerCase() == `monkey`)
		{
			if (!_cReceivedItem.GetClass().CheckFastStringID(`/food/`))
			{
				_cGiver.ShowCaption(["event.monster_event.1"]);
				return true;
			}
			if (_cReceivedItem.IsExpired())
			{
				_cGiver.ShowCaption(["event.monster_event.2"]);
				return true;
			}

			// 임시 인벤이 열려있으면 음식을 줄 수 없다.
			if (_cGiver.IsStackPocketOpened())
			{
				_cGiver.ShowCaption(["event.monster_event.3"]);
				return true;
			}
	
			bool bGiftAvailable = true;
			// 원숭이의 마나가 5 미만이면 선물을 줄 수 없다.
			if (_cMe.GetMana() < 5)
			{
				bGiftAvailable = false;	
			}
	
			int dwFavorRate = 0;
			string strGiftItem;
	
			if (bGiftAvailable)
			{
				// 음식의 선호도를 가져온다.
				dwFavorRate = GetFavorRate(`monkey`, _cReceivedItem);
				// 선호도에 맞는 선물아이템을 가져온다.
				strGiftItem = GetGiftItem(_cMe, dwFavorRate);
			}
		
			if (_cGiver.DestroyItem(_cReceivedItem))
			{
				if (bGiftAvailable && strGiftItem.GetLength() > 0)
				{
					// 아이템을 보상받는다.
					_cGiver.RcvItemWithRewardView(_cMe, strGiftItem);
	
					// 아이템 생성 문자열로부터 id를 뽑아낸다.
					int dwGiftItemId = 0;
					int idBeginPos = strGiftItem.LowerCase().Find(`id:`);
					if (idBeginPos >= 0)
					{
						idBeginPos += 3;
						int idEndPos = strGiftItem.Find(` `, idBeginPos);
						if (idEndPos < 0)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
						else if (idEndPos > idBeginPos)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos, idEndPos - idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
					}
	
					string strGift;
	
					if(dwFavorRate<61)
					{
						strGift = 
						["event.monster_event.4"]<< ((itemclass)GetItemClass(dwGiftItemId)).GetLocalName();
					}
					else if(dwFavorRate<150)
					{
						strGift = 
						["event.monster_event.5"]<< ((itemclass)GetItemClass(dwGiftItemId)).GetLocalName();
					}
					else
					{
						strGift = 
						["event.monster_event.6"]<< ((itemclass)GetItemClass(dwGiftItemId)).GetLocalName();
					}
	
					if(dwGiftItemId==18230 && !_cGiver.IsSelectableTitle(17))
					{
						// 원숭이의 친구 타이틀을 얻는다.
						_cGiver.DoStript(`addtitle(17)`);	
						_cGiver.ShowCaption(["event.monster_event.25"],3000);
					}
						

	
					// 선호도 164 미만인 음식을 받았을 때에는
					// 1. 온천에 앉아서 쉬고 있을 때에는 friendly 모드로 전환하고 일어선다.
					// 2. 이동중에는 1초간 멈추고 플레이어를 쳐다본다.

					// 현 위치에서 멈추고 클라이언트와 싱크.
					_cMe.SyncStop();
					_cMe.DetachAI(true);
					_cMe.LookAtTarget(_cGiver);
	
					if (dwFavorRate < 150)
					{
						if (_cMe.IsStatusSitDown())
						{
							_cMe.StandUp(false); // no animation
							_cMe.SetMotionType(0, 0, false); // mcStand, motionStandFriendly01, not loop
							_cMe.AttachAI(`monkey`, 1500);
						}
						else
						{
								_cMe.AttachAI(`monkey`, 1000);
						}
					}
					// 선호도 164 이상인 음식을 받았을 때에는
					// 1. 온천에 앉아서 쉬고 있을 때에는 일어나서 플레이어를 향하여 offensive 액션을 취한다.
					// 2. 이동중에는 플레이어를 향하여 offensive 액션을 취한다.
					else
					{
						if (_cMe.IsStatusSitDown())
						{
							_cMe.StandUp(false); // no animation
						}
						
						_cMe.SetMotionType(2, 5, false); // mcSit, motionSit02ToStanding, not loop
						_cMe.AttachAI(`monkey`, 7000);
					}

					_cGiver.ShowCaption(strGift);
					
					// 원숭이의 친구 타이틀이 없다면 알게 된다.
					if(!_cGiver.IsKnownTitle(17))
					{
						_cGiver.DoStript(`knowtitle(17)`);	
	//					_cGiver.ShowCaption(`원숭이의 친구 타이틀을 알게 되었습니다.`,3000);
					}
	
					// 원숭이의 마나를 5깎는다.
					_cMe.ModifyMana(-5);
				}
				else
				{
					_cGiver.ShowCaption(["event.monster_event.7"]);
				}
			}

			return true;
		}
		// 아이템을 받는 종족이 사슴인 경우의 처리
		else if (_cMe.GetRaceName().LowerCase() == `maledeer` || _cMe.GetRaceName().LowerCase() == `femaledeer` || _cMe.GetRaceName().LowerCase() == `littledeer`)
		{
			if (!_cReceivedItem.GetClass().CheckStringID(`*/deer_mushroom/*`))
			{
				_cGiver.ShowCaption(["event.monster_event.8"]);
				return true;
			}
			// 임시 인벤이 열려있으면 음식을 줄 수 없다.
			if (_cGiver.IsStackPocketOpened())
			{
				_cGiver.ShowCaption(["event.monster_event.9"]);
				return true;
			}

			bool bGiftAvailable = true;
			// 사슴의 마나가 20 미만이면 선물을 줄 수 없다.
			if (_cMe.GetMana() < 20)
			{
				bGiftAvailable = false;	
			}

			int dwFavorRate = 0;
			string strGiftItem;
	
			if (bGiftAvailable)
			{
				// 음식의 선호도를 가져온다.
				dwFavorRate = GetFavorRate(_cMe.GetRaceName().LowerCase(), _cReceivedItem);
				// 선호도에 맞는 선물아이템을 가져온다.
				strGiftItem = GetGiftItem(_cMe, dwFavorRate);
			}

			if (_cGiver.DestroyItem(_cReceivedItem))
			{
				if (bGiftAvailable && strGiftItem.GetLength() > 0)
				{
					// 아이템을 보상받는다.
					_cGiver.RcvItemWithRewardView(_cMe, strGiftItem);

					// 아이템 생성 문자열로부터 id를 뽑아낸다.
					int dwGiftItemId = 0;
					int idBeginPos = strGiftItem.LowerCase().Find(`id:`);
					if (idBeginPos >= 0)
					{
						idBeginPos += 3;
						int idEndPos = strGiftItem.Find(` `, idBeginPos);
						if (idEndPos < 0)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
						else if (idEndPos > idBeginPos)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos, idEndPos - idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
					}
		
					string strGift;

					strGift = 
					["event.monster_event.10"]<< ((itemclass)GetItemClass(dwGiftItemId)).GetLocalName();

		
					// 70 미만 (개암 버섯, 담갈색 송이 버섯)을 주었을 때는
					// 이동중에는 1초간 멈추고 플레이어를 쳐다본다.
					// 현 위치에서 멈추고 클라이언트와 싱크.
					_cMe.SyncStop();
					_cMe.DetachAI(true);
					_cMe.LookAtTarget(_cGiver);

					if (dwFavorRate < 70)
					{
						if(_cMe.GetRaceName().LowerCase() == `maledeer`)
						{
							_cMe.AttachAI(`maledeer`, 1000);
						}
						else if(_cMe.GetRaceName().LowerCase() == `femaledeer`)
						{
							_cMe.AttachAI(`femaledeer`, 1000);
						}
						else if(_cMe.GetRaceName().LowerCase() == `littledeer`)
						{
							_cMe.AttachAI(`littledeer`, 1000);
						}
					}
					// 황금 버섯을 주었을 때는 애교 모션을 취한다.
					// 2. 이동중에는 플레이어를 향하여 offensive 액션을 취한다.
					else
					{					
						_cMe.SetMotionType(14, 5, false); 
						if(_cMe.GetRaceName().LowerCase() == `maledeer`)
						{
							_cMe.AttachAI(`maledeer`, 1000);
						}
						else if(_cMe.GetRaceName().LowerCase() == `femaledeer`)
						{
							_cMe.AttachAI(`femaledeer`, 1000);
						}
						else if(_cMe.GetRaceName().LowerCase() == `littledeer`)
						{
							_cMe.AttachAI(`littledeer`, 1000);
						}
					}


					_cGiver.ShowCaption(strGift);

					// 사슴의 마나를 20깎는다.
					_cMe.ModifyMana(-20);
				}
				else
				{
					_cGiver.ShowCaption(["event.monster_event.11"]);
				}
			}		
		return true;
		}
		// 아이템을 받는 종족이 구슬을 즐기는 새인 경우의 처리BrownDipper
		else if (_cMe.GetRaceName().LowerCase() == `browndipper` || _cMe.GetRaceName().LowerCase() == `yellowbreastedbunting` || _cMe.GetRaceName().LowerCase() == `dove`)
		{

			if (!_cReceivedItem.GetClass().CheckStringID(`*/gem_bird/*`))
			{
				_cGiver.ShowCaption(["event.monster_event.12"]);
				return true;
			}
			// 임시 인벤이 열려있으면 음식을 줄 수 없다.
			if (_cGiver.IsStackPocketOpened())
			{
				_cGiver.ShowCaption(["event.monster_event.13"]);
				return true;
			}

			bool bGiftAvailable = true;
			// 새의 마나가 20 미만이면 선물을 줄 수 없다.
			if (_cMe.GetMana() < 20)
			{
				bGiftAvailable = false;	
			}

			int dwFavorRate = 0;
			string strGiftItem;
	
			if (bGiftAvailable)
			{
				// 선호도에 맞는 선물아이템을 가져온다.
				// 새는 구슬을 안 가리므로 선호도는 모두 같다.
				strGiftItem = GetGiftItem(_cMe, dwFavorRate);
			}

			if (_cGiver.DestroyItem(_cReceivedItem))
			{
				if (bGiftAvailable && strGiftItem.GetLength() > 0)
				{
					// 아이템을 보상받는다.
					_cGiver.RcvItemWithRewardView(_cMe, strGiftItem);

					// 아이템 생성 문자열로부터 id를 뽑아낸다.
					int dwGiftItemId = 0;
					int idBeginPos = strGiftItem.LowerCase().Find(`id:`);
					if (idBeginPos >= 0)
					{
						idBeginPos += 3;
						int idEndPos = strGiftItem.Find(` `, idBeginPos);
						if (idEndPos < 0)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
						else if (idEndPos > idBeginPos)
						{
							string strGiftItemId = strGiftItem.Mid(idBeginPos, idEndPos - idBeginPos);
							dwGiftItemId = strGiftItemId.GetInteger();
						}
					}
		
					string strGift;

					strGift = 
					["event.monster_event.14"]<< ((itemclass)GetItemClass(dwGiftItemId)).GetLocalName();

		
					// 70 미만 (개암 버섯, 담갈색 송이 버섯)을 주었을 때는
					// 이동중에는 1초간 멈추고 플레이어를 쳐다본다.
					// 현 위치에서 멈추고 클라이언트와 싱크.
					_cMe.SyncStop();
					_cMe.DetachAI(true);
					_cMe.LookAtTarget(_cGiver);
					_cMe.AttachAI(`BrownDipper`, 1000);


					_cGiver.ShowCaption(strGift);

					// 새의 마나를 20깎는다.
					_cMe.ModifyMana(-20);
				}
				else
				{
					_cGiver.ShowCaption(["event.monster_event.15"]);
				}
			}		
		return true;
		}

	}



	// 이 아래쪽 코드는 피쳐처리되면 안된다. /////////////////////////////////////
	{
		// bool Object_CharacterEtc.cpp::CCharacter::ReceiveItem(object_id _idGiver, object_id _idItem)
		// 에 있던 기존의 코드를 스크립트로 변경
		if (_bIsSlave)
		{
			// 자기의 주인으로부터 선물을 받았다.
			return _cMe.ReceiveItemFromMaster(_cGiver, _cReceivedItem);
		}
		else
		{
			// 그 외의 경우
			return _cGiver.DestroyItem(_cReceivedItem);
		}
	}
		
	return false;
	//////////////////////////////////////////////////////////////////////////////
}

//////////////////////////////////////////////////////////////////////////////////
server int GetFavorRate(
	string _strRaceName,
	item _cItem)
// : _strRaceName의 종족이 _cItem을 얼마나 선호하는지를 반환한다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsEnable(`featureHotSpringMonkey`) extern (`data/script/features.mint`))
	{
		// 아직 원숭이 밖에 없다.
		if (_strRaceName == `monkey`)
		{
			// 음식의 난이도를 레시피로부터 가져온다. 레시피가 없으면 0
			int dwDifficulty = _cItem.GetClass().GetDifficultyFromRecipe();
			// 음식의 품질을 가져온다.
			int dwQuality = _cItem.GetQuality();
			// 음식의 양을 가져온다.
			int dwFoodAmount = _cItem.GetClass().GetFoodAmount();
			
			dwQuality =  (dwQuality - 50);
	
			// 품질은 1~100으로 조정
			if (dwQuality < 1)
			{
				dwQuality = 1;
			}
			else if (dwQuality < 60)
			{
				dwQuality = 40;
			}
			else if (dwQuality < 90)
			{
				dwQuality = 70;
			}
			else
			{
				dwQuality = 95;
			}
	
			// 음식의 양은 최대 30으로 조정
			if (dwFoodAmount > 30)
			{
				dwFoodAmount = 30;
			}
	
			// 계산후 반환
			return dwQuality + dwDifficulty + dwFoodAmount;
		}
		//사슴들의 버섯 선호도 
		else 	if (_strRaceName == `maledeer` || _strRaceName == `femaledeer` || _strRaceName == `littledeer`)
		{
			// 버섯의 퀄리티
			int dwQuality;

			// 개암버섯
			if (_cItem.GetClassId() == 50276)
			{
				dwQuality = 30;
			}
			// 담갈색 송이버섯
			else if (_cItem.GetClassId() == 50275)
			{
				dwQuality = 60;
			}
			// 황금 버섯
			if (_cItem.GetClassId() == 50277)
			{
				dwQuality = 90;
			}

			return dwQuality;
		}

	}
		
	return 0;
}

//////////////////////////////////////////////////////////////////////////////////
server string GetGiftItem(
	character _cMe,
	int _dwFavorRate)
// : _cMe의 선호도에 따라 선물아이템ID를 결정해준다.
//////////////////////////////////////////////////////////////////////////////////
{
	string strItem;
	
	if (IsEnable(`featureHotSpringMonkey`) extern (`data/script/features.mint`))
	{
		// 원숭이 일 때는 다음과 같은 보상템을 준다.	
		if (_cMe.GetRaceName().LowerCase() == `monkey`)
		{
			int iCumRate = 0;							// 확률을 누적해놓는 변수
			int i = 0;									// iterator
			int iRandom = Random(1000);					// 확률의 총합을 적는다.
		
			// 현재는 임시
			if (_dwFavorRate < 61)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51002`;	iCumRate	+=	50;	}		// 라이프 포션 30
						case(1)	{	strItem = `id:51007`;	iCumRate	+=	50;	}		// 마나 포션 30
						case(2)	{	strItem = `id:51012`;	iCumRate	+=	50;	}		// 스태미나 포션 30
						case(3)	{	strItem = `id:63000`;	iCumRate	+=	50;	}		// 피닉스의 깃털
						case(4)	{	strItem = `id:51101`;	iCumRate	+=	50;	}		// 블러디 허브
						case(5)	{	strItem = `id:51001`;	iCumRate	+=	80;	}		// 라이프 포션 10
						case(6)	{	strItem = `id:51006`;	iCumRate	+=	80;	}		// 마나 포션 10
						case(7)	{	strItem = `id:51011`;	iCumRate	+=	80;	}		// 스태미나 포션 10
						case(8)	{	strItem = `id:56065`;	iCumRate	+=	280;	}		// 원숭이 털
						case(9)	{	strItem = `id:60005`;	iCumRate	+=	50;	}		// 붕대
						case(10)	{	strItem = `id:60024`;	iCumRate	+=	50;	}		// 일반 가죽
						case(11)	{	strItem = `id:60007`;	iCumRate	+=	50;	}		// 가는 실 뭉치
						case(12)	{	strItem = `id:63002`;	iCumRate	+=	60;	}		// 나무 장작
						case(13)	{	strItem = `id:60054`;	iCumRate	+=	20;	}		// 나무 판
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			else if (_dwFavorRate < 89)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51003`;	iCumRate	+=	150;	}		// 라이프 포션 50
						case(1)	{	strItem = `id:51008`;	iCumRate	+=	100;	}		// 마나 포션 50
						case(2)	{	strItem = `id:51013`;	iCumRate	+=	100;	}		// 스태미나 포션 50
						case(3)	{	strItem = `id:55056`;	iCumRate	+=	5;	}		// 항아리 거미의 빛나는 다리
						case(4)	{	strItem = `id:55057`;	iCumRate	+=	5;	}		// 항아리 거미의 빛나는 항아리
						case(5)	{	strItem = `id:55058`;	iCumRate	+=	5;	}		// 항아리 거미의 빛나는 어금니
						case(6)	{	strItem = `id:55059`;	iCumRate	+=	5;	}		// 항아리 거미의 빛나는 집게발
						case(7)	{	strItem = `id:55060`;	iCumRate	+=	5;	}		// 항아리 거미의 빛나는 독주머니
						case(8)	{	strItem = `id:45010`;	iCumRate	+=	5;	}		// 토파즈 화살
						case(9)	{	strItem = `id:45011`;	iCumRate	+=	5;	}		// 에메랄드 화살
						case(10)	{	strItem = `id:45012`;	iCumRate	+=	5;	}		// 자수정 화살
						case(11)	{	strItem = `id:40020`;	iCumRate	+=	220;	}		// 나무 몽둥이
						case(12)	{	strItem = `id:40001`;	iCumRate	+=	180;	}		// 나무 막대기
						case(13)	{	strItem = `id:60054`;	iCumRate	+=	40;	}		// 나무 판
						case(14)	{	strItem = `id:51102`;	iCumRate	+=	60;	}		// 마나 허브
						case(15)	{	strItem = `id:51104`;	iCumRate	+=	60;	}		// 베이스 허브
						case(16)	{	strItem = `id:51101`;	iCumRate	+=	50;	}		// 블러디 허브
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			else if (_dwFavorRate < 150)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51004`;	iCumRate	+=	100;	}		// 라이프 포션 100
						case(1)	{	strItem = `id:51009`;	iCumRate	+=	100;	}		// 마나 포션 100
						case(2)	{	strItem = `id:51014`;	iCumRate	+=	100;	}		// 스태미나 포션 100
						case(3)	{	strItem = `id:55031`;	iCumRate	+=	5;	}		// 스톤 바이슨의 빛나는 뿔
						case(4)	{	strItem = `id:55032`;	iCumRate	+=	5;	}		// 스톤 바이슨의 빛나는 이빨
						case(5)	{	strItem = `id:55033`;	iCumRate	+=	5;	}		// 스톤 바이슨의 빛나는 꼬리
						case(6)	{	strItem = `id:55034`;	iCumRate	+=	5;	}		// 스톤 바이슨의 빛나는 발굽
						case(7)	{	strItem = `id:55036`;	iCumRate	+=	5;	}		// 스톤 하운드의 빛나는 귀
						case(8)	{	strItem = `id:55037`;	iCumRate	+=	5;	}		// 스톤 하운드의 빛나는 이빨
						case(9)	{	strItem = `id:55038`;	iCumRate	+=	5;	}		// 스톤 하운드의 빛나는 꼬리
						case(10)	{	strItem = `id:55039`;	iCumRate	+=	5;	}		// 스톤 하운드의 빛나는 발목장식
						case(11)	{	strItem = `id:55040`;	iCumRate	+=	5;	}		// 스톤 하운드의 빛나는 발톱
						case(12)	{	strItem = `id:55042`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 서클릿
						case(13)	{	strItem = `id:55043`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 머리장식
						case(14)	{	strItem = `id:55044`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 눈
		
						case(15)	{	strItem = `id:55045`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 어깨장식
						case(16)	{	strItem = `id:55046`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 벨트
						case(17)	{	strItem = `id:55047`;	iCumRate	+=	5;	}		// 스톤 좀비의 빛나는 손목장식
						case(18)	{	strItem = `id:55050`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 모자
						case(19)	{	strItem = `id:55051`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 모자장식
						case(20)	{	strItem = `id:55052`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 보석
						case(21)	{	strItem = `id:55053`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 코
						case(22)	{	strItem = `id:55054`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 귀
						case(23)	{	strItem = `id:55055`;	iCumRate	+=	5;	}		// 스톤 임프의 빛나는 샌달
						case(24)	{	strItem = `id:55062`;	iCumRate	+=	5;	}		// 스톤 가고일의 어깨장식
						case(25)	{	strItem = `id:55063`;	iCumRate	+=	5;	}		// 스톤 가고일의 글러브
						case(26)	{	strItem = `id:55064`;	iCumRate	+=	5;	}		// 스톤 가고일의 부츠
		
						case(27)	{	strItem = `id:55065`;	iCumRate	+=	5;	}		// 스톤 가고일의 빛나는 어깨장식
						case(28)	{	strItem = `id:55066`;	iCumRate	+=	5;	}		// 스톤 가고일의 빛나는 글러브
						case(29)	{	strItem = `id:55067`;	iCumRate	+=	5;	}		// 스톤 가고일의 빛나는 부츠
						case(30)	{	strItem = `id:40019`;	iCumRate	+=	300;	}		// 굵은 나뭇가지
						case(31)	{	strItem = `id:18230`;	iCumRate	+=	5;	}		// 온천 모자
						case(32)	{	strItem = `id:40239 count:10`;	iCumRate	+=	50;	}		// 신규 무기(아틀라틀)
						case(33)	{	strItem = `id:62005 prefix:21404`;	iCumRate	+=	30;	}		// 방패 인챈 (리지드)
						case(34)	{	strItem = `id:40001`;	iCumRate	+=	180;	}		// 나무 막대기
		
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			else
			{
				// 150 이상
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51004`;	iCumRate	+=	160;	}		// 라이프 포션 100
						case(1)	{	strItem = `id:51009`;	iCumRate	+=	100;	}		// 마나 포션 100
						case(2)	{	strItem = `id:51014`;	iCumRate	+=	100;	}		// 스태미나 포션 100
						case(3)	{	strItem = `id:51005`;	iCumRate	+=	60;	}		// 라이프 포션 300
						case(4)	{	strItem = `id:51010`;	iCumRate	+=	30;	}		// 마나 포션 300
						case(5)	{	strItem = `id:51015`;	iCumRate	+=	30;	}		// 스태미나 포션 300
						case(6)	{	strItem = `id:55035`;	iCumRate	+=	10;	}		// 빛나는 스톤 바이슨의 석상
						case(7)	{	strItem = `id:55041`;	iCumRate	+=	10;	}		// 빛나는 스톤 하운드의 석상
						case(8)	{	strItem = `id:55048`;	iCumRate	+=	10;	}		// 빛나는 스톤 좀비의 석상
						case(9)	{	strItem = `id:55049`;	iCumRate	+=	10;	}		// 빛나는 스톤 임프의 석상
						case(10)	{	strItem = `id:55061`;	iCumRate	+=	10;	}		// 빛나는 항아리 거미의 석상
						case(11)	{	strItem = `id:55068`;	iCumRate	+=	10;	}		// 빛나는 스톤 가고실의 석상
						case(12)	{	strItem = `id:45013`;	iCumRate	+=	30;	}		// 신비한 화살
						case(13)	{	strItem = `id:63158`;	iCumRate	+=	30;	}		// 눈꽃 결정
						case(14)	{	strItem = `id:60025`;	iCumRate	+=	30;	}		// 고급 가죽
		
						case(15)	{	strItem = `id:60026`;	iCumRate	+=	30;	}		// 최고급 가죽
						case(16)	{	strItem = `id:60061 count:10`;	iCumRate	+=	40;	}		// 투파이 조련 미끼
						case(17)	{	strItem = `id:64042 size:3.0`;	iCumRate	+=	20;	}		// 토파즈 3cm
						case(18)	{	strItem = `id:64043 size:3.0`;	iCumRate	+=	20;	}		// 스타 사파이어 3cm
						case(19)	{	strItem = `id:64044 size:3.0`;	iCumRate	+=	20;	}		// 에메랄드  3cm
						case(20)	{	strItem = `id:64045 size:3.0`;	iCumRate	+=	20;	}		// 아쿠아마린  3cm
						case(21)	{	strItem = `id:64046 size:3.0`;	iCumRate	+=	20;	}		// 가넷 3cm
						case(22)	{	strItem = `id:64047 size:3.0`;	iCumRate	+=	20;	}		// 재스퍼 3cm
						case(23)	{	strItem = `id:64048 size:3.0`;	iCumRate	+=	20;	}		// 루비 3cm
						case(24)	{	strItem = `id:64049 size:3.0`;	iCumRate	+=	20;	}		// 스피넬 3cm
						case(25)	{	strItem = `id:64050 size:1.5`;	iCumRate	+=	20;	}		// 다이아몬드 1.5cm
						case(26)	{	strItem = `id:18230`;	iCumRate	+=	30;	}		// 온천 모자
		
						case(27)	{	strItem = `id:40083 suffix:30702`;	iCumRate	+=	20;	}		// 훅 커틀러스(레이븐)
						case(28)	{	strItem = `id:40243 quality:50`;	iCumRate	+=	20;	}		// 신규 무기(배틀 숏 소드)
						case(29)	{	strItem = `id:62005 suffix:21405`;	iCumRate	+=	30;	}		// 방패 인챈(마샬)
		
						case(30)	{	strItem = `id:18557`;	iCumRate	+=	5;	}		// 콜린 플레이트 헬멧
						case(31)	{	strItem = `id:18556`;	iCumRate	+=	5;	}		// 소라투구(남성)
						case(32)	{	strItem = `id:18558`;	iCumRate	+=	5;	}		// 소라투구(여성)
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			
			}
		}
		// 숫사슴일 때는 다음과 같은 보상템을 준다.	
		else if (_cMe.GetRaceName().LowerCase() == `maledeer`)
		{
			int iCumRate = 0;							// 확률을 누적해놓는 변수
			int i = 0;									// iterator
			int iRandom = Random(1000);					// 확률의 총합을 적는다.
		
			// 개암버섯을 주었을 때 
			if (_dwFavorRate < 40)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	400;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	150;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	50;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	100;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	300;	}		// 베이스 허브

		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 담갈색 송이 버섯을 주었을 때 
			else if (_dwFavorRate < 70)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	150;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	100;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	50;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	150;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	200;	}		// 베이스 허브
						case(5)	{	strItem = `id:51104 count:3`;	iCumRate	+=	300;	}		// 베이스 허브 * 3
						case(6)	{	strItem = `id:51104 count:10`;	iCumRate	+=	50;	}		// 베이스 허브 * 10
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 황금 버섯을 주었을 때
			else
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51101`;	iCumRate	+=	100;	}		// 블러디 허브
						case(1)	{	strItem = `id:51102`;	iCumRate	+=	50;	}		// 마나 허브
						case(2)	{	strItem = `id:51103`;	iCumRate	+=	150;	}		// 선라이트 허브
						case(3)	{	strItem = `id:51104`;	iCumRate	+=	200;	}		// 베이스 허브
						case(4)	{	strItem = `id:51104 count:3`;	iCumRate	+=	200;	}		// 베이스 허브 * 3
						case(5)	{	strItem = `id:51105 count:3`;	iCumRate	+=	100;	}		// 골드 허브 * 3
						case(6)	{	strItem = `id:51104 count:10`;	iCumRate	+=	200;	}		// 베이스 허브 * 10
		
						default
						{
							bBreak = true;
						}
					}
					if (bBreak)
					{
						break;
					}
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					++i;
				}
			}
		}
		// 암사슴일 때는 다음과 같은 보상템을 준다.	
		else if (_cMe.GetRaceName().LowerCase() == `femaledeer`)
		{
			int iCumRate = 0;							// 확률을 누적해놓는 변수
			int i = 0;									// iterator
			int iRandom = Random(1000);					// 확률의 총합을 적는다.
		
			// 개암버섯을 주었을 때 
			if (_dwFavorRate < 40)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	500;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	100;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	50;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	200;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	150;	}		// 베이스 허브
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 담갈색 송이 버섯을 주었을 때 
			else if (_dwFavorRate < 70)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	250;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	150;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	100;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	280;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	100;	}		// 베이스 허브
						case(5)	{	strItem = `id:51103 count:3`;	iCumRate	+=	70;	}		// 선라이트 허브 * 3 
						case(6)	{	strItem = `id:51103 count:10`;	iCumRate	+=	50;	}		// 선라이트 허브 * 10
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 황금 버섯을 주었을 때
			else
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	150;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	80;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	150;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	250;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	50;	}		// 베이스 허브
						case(5)	{	strItem = `id:51103 count:3`;	iCumRate	+=	100;	}		// 선라이트 허브 * 3 
						case(6)	{	strItem = `id:51107`;	iCumRate	+=	50;	}		// 화이트 허브
						case(7)	{	strItem = `id:51103 count:10`;	iCumRate	+=	170;	}		// 선라이트 허브 * 10
		
						default
						{
							bBreak = true;
						}
					}
					if (bBreak)
					{
						break;
					}
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					++i;
				}
			}
		}
		// 어린 사슴일 때는 다음과 같은 보상템을 준다.	
		else if (_cMe.GetRaceName().LowerCase() == `littledeer`)
		{
			int iCumRate = 0;							// 확률을 누적해놓는 변수
			int i = 0;									// iterator
			int iRandom = Random(1000);					// 확률의 총합을 적는다.
		
			// 개암버섯을 주었을 때 
			if (_dwFavorRate < 40)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	600;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	50;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	170;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	50;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	100;	}		// 베이스 허브
						case(5)	{	strItem = `id:51107`;	iCumRate	+=	30;	}		// 화이트 허브
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 담갈색 송이 버섯을 주었을 때 
			else if (_dwFavorRate < 70)
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	350;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	100;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	240;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	50;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	90;	}		// 베이스 허브
						case(5)	{	strItem = `id:51107`;	iCumRate	+=	50;	}		// 화이트 허브
						case(6)	{	strItem = `id:51102 count:3`;	iCumRate	+=	120;	}		// 마나 허브 * 3
		
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					
					++i;
				}
			}
			// 황금 버섯을 주었을 때
			else
			{
				while (true)
				{
					bool bBreak = false;
					
					switch (i)
					{
						case(0)	{	strItem = `id:51106`;	iCumRate	+=	250;	}		// 못 쓰게 된 허브
						case(1)	{	strItem = `id:51101`;	iCumRate	+=	180;	}		// 블러디 허브
						case(2)	{	strItem = `id:51102`;	iCumRate	+=	180;	}		// 마나 허브
						case(3)	{	strItem = `id:51103`;	iCumRate	+=	30;	}		// 선라이트 허브
						case(4)	{	strItem = `id:51104`;	iCumRate	+=	30;	}		// 베이스 허브
						case(5)	{	strItem = `id:51107`;	iCumRate	+=	30;	}		// 화이트 허브
						case(6)	{	strItem = `id:51102 count:3`;	iCumRate	+=	200;	}		// 마나 허브 * 3		
						case(7)	{	strItem = `id:51102 count:10`;	iCumRate	+=	100;	}		// 마나 허브 * 10

						default
						{
							bBreak = true;
						}
					}
					if (bBreak)
					{
						break;
					}
					if (iRandom < iCumRate) 
					{
						return strItem;
					}
					++i;
				}
			}
		}
		// 구슬 새일 때는 다음과 같은 보상템을 준다.	
		else if (_cMe.GetRaceName().LowerCase() == `browndipper` || _cMe.GetRaceName().LowerCase() == `yellowbreastedbunting` || _cMe.GetRaceName().LowerCase() == `dove`)
		{
			int iCumRate = 0;							// 확률을 누적해놓는 변수
			int i = 0;									// iterator
			int iRandom = Random(1000);					// 확률의 총합을 적는다.
		
			// 구슬을  주었을 때 
			while (true)
			{
				bool bBreak = false;
				
				switch (i)
				{
					case(0)	{	strItem = `id:64018`;	iCumRate	+=	250;	}		// 종이
					case(1)	{	strItem = `id:51001`;	iCumRate	+=	70;	}		// 라이프 10 포션
					case(2)	{	strItem = `id:51006`;	iCumRate	+=	50;	}		// 마나 10 포션
					case(3)	{	strItem = `id:51011`;	iCumRate	+=	55;	}		// 스태미나 10 포션
					case(4)	{	strItem = `id:64011`;	iCumRate	+=	30;	}		// 화살촉 묶음
					case(5)	{	strItem = `id:64013`;	iCumRate	+=	20;	}		// 고급 화살촉 묶음
					case(6)	{	strItem = `id:64014`;	iCumRate	+=	10;	}		// 최고급 화살촉 묶음
					case(7)	{	strItem = `id:50262`;	iCumRate	+=	5;	}		// 개복치뼈
					case(8)	{	strItem = `id:60005`;	iCumRate	+=	145;	}		// 붕대
					case(9)	{	strItem = `id:52003`;	iCumRate	+=	70;	}		// 대못
					case(10)	{	strItem = `id:60051`;	iCumRate	+=	30;	}		// 질긴끈
					case(11)	{	strItem = `id:64015`;	iCumRate	+=	30;	}		// 볼트촉 묶음
					case(12)	{	strItem = `id:64016`;	iCumRate	+=	20;	}		// 고급 볼트촉 묶음
					case(13)	{	strItem = `id:64017`;	iCumRate	+=	10;	}		// 최고급 볼트촉 묶음
					case(14)	{	strItem = `id:60006`;	iCumRate	+=	20;	}		// 굵은 실뭉치
					case(15)	{	strItem = `id:60007`;	iCumRate	+=	20;	}		// 가는 실뭉치
					case(16)	{	strItem = `id:60027`;	iCumRate	+=	30;	}		// 저가형 가죽끈
					case(17)	{	strItem = `id:63000`;	iCumRate	+=	134;	}		// 피닉스의 깃털
					case(18)	{	strItem = `id:17153`;	iCumRate	+=	1;	}		// 비비드 캐쥬얼 슈즈

	
					default
					{
						bBreak = true;
					}
				}
	
				if (bBreak)
				{
					break;
				}
	
				if (iRandom < iCumRate) 
				{
					return strItem;
				}
				
				++i;
			}
		}
	}

	return strItem;
}
