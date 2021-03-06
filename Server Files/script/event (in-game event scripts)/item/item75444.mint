//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//
//////////////////////////////////////////////////////////// component of Mabinogi




////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////

{
	// 미션 진행 중이고(793014), 무너진 스톤헨지 근처에서만 사용 가능
	// 리전 불가 아이템이라 밖으로 가지고 나올리는 없지만 그래도 체크는 하자.
	dungeon2 _dungeon = player.FindDungeon2();

	// DebugOut(`75444 사용함`);
	if (!_dungeon.IsNull())
	{			
		int missionID = _dungeon.GetLinkedQuest();

		// 최종장에서 사용
		if (missionID == 793014)
		{
			// 일단 먼저 광장 퍼즐이 클리어 되어 있는지 확인하고
			// 클리어 안 되어 있으면 각 스톤헨지 별로 클리어 여부/퍼즐 타입/캐릭터가 안에 있는지를 체크해서
			// 제일 먼저 걸리는 것이 있으면 사용해주고 끝낸다.

			dungeon2puzzle _pCenterPuzzle;
			_dungeon.GetData(`CenterPuzzle`, _pCenterPuzzle);

			// DebugOut(`[Item:75444] 793014에서 아이템 사용`);

			if(!_pCenterPuzzle.IsNull())
			{
				// 광장 퍼즐이 진행 중일 때만 사용이 가능하다. (Activate, Not Complete)
				if(!_pCenterPuzzle.IsComplete() && _pCenterPuzzle.IsActivate())
				{
					dungeon2puzzle _puzzle;
					bool bClearFlag;
					bool bPlayerIn;
					int iPuzzleType;

					// DebugOut(`[Item:75444] 사용할 수 있는 스톤헨지를 찾는다.`);
					int i;
					for(i=1; i<8; i++)
					{
						_dungeon.GetData(`Stonehenge_`+ToString(i), _puzzle);

						if(!_puzzle.IsNull())
						{
							_puzzle.GetData(`iPuzzleType`, iPuzzleType);
							_dungeon.GetData(`bClearFlag_`+ToString(i), bClearFlag);

							if(!_puzzle.IsComplete() && iPuzzleType == 3 && bClearFlag)
							{
								_puzzle.GetData(player.GetOriginalName(), bPlayerIn);

								// 캐릭터가 복원할 수 있는 스톤헨지 근처에 있다.
								if(bPlayerIn)
								{
									// DebugOut(`[Item:75444] 스톤헨지를 복원한다. i: [`+ToString(i)+`]`);
									_puzzle.SetData(`bShowCaption`, true);
									_puzzle.Complete();
									return;
								}
							}
						}
					}

					// 복원할 수 있는 스톤헨지가 없다. 못 쓴다.
					// DebugOut(`[Item:75444] 복원할 수 있는 스톤헨지를 찾지 못했다.`);
					player.DoStript(`additemex(id:75444)`);
					player.ShowCaption(["event.item.item75444.1"]);
				}
				else if(_pCenterPuzzle.IsComplete())
				{
					// 이미 광장 퍼즐이 클리어 됐으므로 쓸 필요 없다.
					// 혹시 모르니 남아있는 것 다 지워버린다.
					// DebugOut(`[Item:75444] 이미 광장 퍼즐 클리어했다.`);
					player.ShowCaption(["event.item.item75444.2"]);
					// player.RemoveItemCls(75444);
				}
				else if(!_pCenterPuzzle.IsActivate())
				{
					// 아직 광장 퍼즐 시작안했다.
					// 먼저 스파크로 석판을 활성화하고 광장 퍼즐을 시작하자.
					// DebugOut(`[Item:75444] 광장 중앙 퍼즐이 액티베이션 안 됐다.`);
					player.DoStript(`additemex(id:75444)`);
					player.ShowCaption(["event.item.item75444.3"]);
				}
				else
				{
					// 여기로 오면 안되지만 안전 코드
					player.DoStript(`additemex(id:75444)`);
					player.ShowCaption(["event.item.item75444.4"]);
				}
			}
			else
			{
				// 여기로 오면 안되지만 안전 코드
				// 최종장에서 중앙 석판이 작동을 안 한다.
				player.DoStript(`additemex(id:75444)`);
				player.ShowCaption(["event.item.item75444.5"]);
			}
		}
		else
		{
			player.DoStript(`additemex(id:75444)`);
			player.ShowCaption(["event.item.item75444.6"]);
		}
	}	
	else
	{
		player.DoStript(`additemex(id:75444)`);
		player.ShowCaption(["event.item.item75444.7"]);
	}
}
