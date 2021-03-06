////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Extra Description
//																  던전 추가 정보
//
//													henjeon, began at 2005.09.21
//															 henjeon@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 던전 추가 정보 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
	OnExtraDesc(
		dungeon_floor _floor,		// 처리중인 던전 층
		string _arg1,
		string _arg2,
		string _arg3)
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
	DebugOut(`OnExtraDesc()에 진입했습니다.`);
	
	int i;
	
	// 막다른 방의 개수를 얻는다.
	int iDeadEndNodesNo = _floor.GetDeadEndNodesNo();
	DebugOut(`막다른 방의 개수는 `+ToString(iDeadEndNodesNo)+`개 입니다.`);
	
	// 각 방마다...
	for (i = 0 ; i < iDeadEndNodesNo ; ++i)
	{
		//if(Random(2)==0)
		{
			dungeon_node room = _floor.GetDeadEndNode(i);
			
			// 방 가운데에 상자를 배치한다.
			dungeon_extrachest chest = room.CreateExtraChest();
			if (chest.IsValid())
			{
				if(Random(100)<70)
				{
					if(Random(100)<30)
					{
						DebugOut(`방 `+ToString(i)+`에 대박형 상자를 배치했습니다.`);
						
						if(Random(100)<70)
						{
							string MoneyCount;

							MoneyCount=ToString(100+Random(200));
							chest.AddItem(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItem(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItem(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItem(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItem(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItemForAll(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItemForAll(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItemForAll(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItemForAll(`id:2000 count:`+MoneyCount);

							MoneyCount=ToString(100+Random(200));
							chest.AddItemForAll(`id:2000 count:`+MoneyCount);
						}
						else
						{
							chest.AddItemForAll(`id:51003 count:2`);
						}

						if(Random(3)==0)
						{
							chest.AddItemForAll(`id:51003 count:1`);
						}
					}
					else
					{
						DebugOut(`방 `+ToString(i)+`에 소박형 상자를 배치했습니다.`);
						string MoneyCount;

						MoneyCount=ToString(100+Random(200));
						chest.AddItem(`id:2000 count:`+MoneyCount);

						MoneyCount=ToString(100+Random(200));
						chest.AddItem(`id:2000 count:`+MoneyCount);

						MoneyCount=ToString(100+Random(200));
						chest.AddItem(`id:2000 count:`+MoneyCount);

						MoneyCount=ToString(100+Random(200));
						chest.AddItemForAll(`id:2000 count:`+MoneyCount);

						MoneyCount=ToString(100+Random(200));
						chest.AddItemForAll(`id:2000 count:`+MoneyCount);

						if(Random(2)==0)
						{
							chest.AddItemForAll(`id:51003 count:1`);
						}
					}
				}
				else
				{
					DebugOut(`방 `+ToString(i)+`에 꽝 상자를 배치했습니다.`);
					string MoneyCount;

					if(Random(100)<30)
					{
						chest.AddItemForAll(`id:51003 count:1`);
					}
					else
					{
						MoneyCount=ToString(Random(500));
						chest.AddItemForAll(`id:2000 count:`+MoneyCount);
					}
				}
			}
		}
		//else
		{

		}
		/*I// 방 가운데에 몬스터를 배치한다.
		character npc = room.CreateMonster(`Skeleton`);
		if (npc.IsValid())
		{
			DebugOut(`방 `+ToString(i)+`에 몬스터를 배치했습니다.`);	
		}
		*/
	}	
}