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
	// 미션 진행 중이고(793005), 여신상 근처에 있을 경우 사용 가능
	dungeon2 _dungeon = player.FindDungeon2();

	// DebugOut(`75420 사용함`);
	if (!_dungeon.IsNull())
	{			
		int missionID = _dungeon.GetLinkedQuest();

		if (missionID == 793005)
		{
			bool ClearFlag;
			dungeon2puzzle _puzzle;
			dungeon2puzzle _puzzle2;

			_dungeon.GetData(`ClearFlag`, ClearFlag);
			_dungeon.GetData(`StatuePuzzle`, _puzzle);
			_dungeon.GetData(`nuadha_puzzle`, _puzzle2);

			if(ClearFlag)
			{
				_puzzle.DestroyProp(`statue`);
				_puzzle.Complete();

				if(_puzzle.IsComplete())
				{
					DebugOut(`퍼즐 컴플리트`);
				}


				if (player.IsGiant())
				{
					if(player.IsFemale())
					{
						player.PlayCutScene(`C3G12_S#3_1_enter_the_canal_giant_female`);
					}
					else
					{
						player.PlayCutScene(`C3G12_S#3_1_enter_the_canal_giant_male`);
					}
				}
				else
				{
					player.PlayCutScene(`C3G12_S#3_1_enter_the_canal`);
				}

				// 미션 관련 처리들
				int iRegionId = player.GetRegionId();
				player.Move(iRegionId, 10608, 26824);
				player.SetDirection(1.503);

				// 멀리서 누아자랑 다올 안 보이게 여기서 생성해준다.
				character _nuadha =_puzzle2.AllocAINPC(`nuadha`, `_nuadha`, 0, 0, 0, true, ``);	
				_nuadha.SetDirection(-1.626);

				dungeon2monster monsterGroup = _puzzle2.FindMonsterGroup(`monster1`);

				monsterGroup.AllocMonster(`single(daol3:1)`, -309, 333, 0, 0);
				monsterGroup.AllocMonster(`single(daol3:1)`, -88, 353, 0, 0);
				monsterGroup.AllocMonster(`single(daol3:1)`, 251, 254, 0, 0);
				monsterGroup.AllocMonster(`single(daol3:1)`, 481, 178, 0, 0);

				object_list	cMonsterList = monsterGroup.GetRemainMonsterList();
				character	cMonster;
				int		i;
				int		iMonsterCnt = cMonsterList.GetSize();

				DebugOut(`다올 수: `+ToString(iMonsterCnt));
				for (i = 0; i < cMonsterList.GetSize();  i++)
				{
					DebugOut(`다올 방향 전환`);
					cMonster = (character)cMonsterList.GetValue(i);
					cMonster.SetDirection(-1.626);
				}
			}
			else
			{
				player.DoStript(`additemex(id:75420)`);
				player.ShowCaption(["event.item.item75420.1"]);
			}
		}
		else
		{
			player.DoStript(`additemex(id:75420)`);
			player.ShowCaption(["event.item.item75420.2"]);
		}
	}	
	else
	{
		player.DoStript(`additemex(id:75420)`);
		player.ShowCaption(["event.item.item75420.3"]);
	}
}
