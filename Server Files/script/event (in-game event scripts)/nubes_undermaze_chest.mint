//////////////////////////////////////////////////////////////////////////////////
//                            Mabinogi Project : UnderMaze Chest Prop Event Script
//                                          지하미로 보물상자와 관련된 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 06. 21
//                                                             nicolas@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi


////////////////////////////////////////////////////////////////////////////////
server void UnderMazeChest_OnCreated(
	prop mazeprop)
// : 지하미로 보물상자가 생성될 때의 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 프랍을 매니저에 등록한다.
	if (mazeprop.RegisterToUndergroundMaze(
		36,
		`data/script/event/nubes_undermaze_chest.mint::OnTick_UnderMazeChest`))
	{
		mazeprop.SetChestKey(70147);
		mazeprop.SetConditionMax(2);
	}
	else
	{

	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTick_UnderMazeChest(
	prop mazeprop)
// : 지하미로 매니저에 등록된 보물상자의 주기마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	string propstate = mazeprop.GetState();
	if (propstate == `open`)
	{
		mazeprop.SetExtraData(`breaker_name`, ``);
		mazeprop.ChangeState(`closed`);
	}
	else if (propstate == `closed`)
	{
	}
	mazeprop.SetConditionIndex(Random(mazeprop.GetConditionMax()));
}



////////////////////////////////////////////////////////////////////////////////
server bool OnTouchUnderMazeChestScript(
	character me,
	object _object,
	string& msg)
// : 보물상자를 건드렸을 때의 스크립트 함수
////////////////////////////////////////////////////////////////////////////////
{
	prop mazeprop = GetPropFromObject(_object);
	if (!mazeprop.IsNull())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `closed`)
		{
			// 일단 열쇠를 가지고 있는지 체크
			int chestkey = mazeprop.GetChestKey();
			if (chestkey == 0)
			{
				// 키가 설정이 되어 있지 않으므로 아예 열리지 않는 것으로 변경
				//ProcessItemDrop(mazeprop, me);
				//mazeprop.ChangeState(`open`, me);
			}
			else if(me.GetItemNoWithClassId(75453) >= 1 && me.HaveQuestTemplate(293022) && me.GetCompletedQuestObjectiveCount(293022) == 0)
			{
				// G12 메인 스트림 진행 열쇠를 가지고 있고 퀘스트 진행 중이면 여기로 온다.
				mazeprop.GenerateAndDropItem(`id:75427` , me);
				me.RemoveItemCls(75453);
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
			}
			else if (me.GetItemNoWithClassId(chestkey) >= 1)
			{
				// 열쇠를 가지고 있다.

				// 여기에서 열쇠를 없애고 아이템을 준다.
				if (me.RemoveItemCls(chestkey, 1) == 1)
				{
					ProcessItemDrop(mazeprop, me);
					mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
					mazeprop.ChangeState(`open`, me);

					/* 메인 스트림 전용 열쇠로 변경
					int iRandom = Random(100);
					// G12 메인스트림 퀘스트 진행 중이면 팔리아스 보물 (와드네)를 넣어준다. (100%)
					if(iRandom < 200)
					{
						if(me.HaveQuestTemplate(293022) && me.GetCompletedQuestObjectiveCount(293022) == 0)
						{
							mazeprop.GenerateAndDropItem(`id:75427` , me);
						}
					}
					*/
				}
				else
				{
					me.ShowCaption(["event.connous_undermaze_chest.1"]);
				}
			}
			else
			{
				// 상자에 맞는 열쇠가 필요
				me.ShowCaption(["event.connous_undermaze_chest.2"]);
			}
			return false;
		}
		else if (propstate == `open`)
		{
			me.ShowCaption(["event.nubes_undermaze_chest.1"]);
			return false;
		}
	}
	return false;
}

////////////////////////////////////////////////////////////////////////////////
server void ProcessItemDrop(
	prop mazeprop,
	character me)
// : 실제로 아이템을 떨어트리는 처리용 내부 함수
////////////////////////////////////////////////////////////////////////////////
{
	int condition = mazeprop.GetConditionIndex();
	string stritemdesc;
	// 컨디션에 따라 랜덤하게 호출됨
	if (condition == 0)
	{
		// Group 1
		{
			int random = Random(100);

			if (random < 40) 		ProcessMoneyDrop(mazeprop, me, 3000, 4000);
			else if (random < 40+30)	ProcessMoneyDrop(mazeprop, me, 3500, 4500);
			else if (random < 70+20)	ProcessMoneyDrop(mazeprop, me, 4000, 5000);
			else if (random < 90+10)	ProcessMoneyDrop(mazeprop, me, 4500, 5500);

		}

		// Group 2
		{
			int random = Random(100);

			if (random < 30)		stritemdesc = `id:51003 count:3~5`;
			else if (random < 30+30)	stritemdesc = `id:51008 count:3~5`;
			else if (random < 60+30)	stritemdesc = `id:51013 count:3~5`;
			else if (random < 90+10)	stritemdesc = `id:62001 count:1~2`;

			if (mazeprop.GenerateAndDropItem(stritemdesc , me)) {}
			else
			{
				me.ShowCaption(stritemdesc + ["event.nubes_undermaze_chest.2"]);
			}
		}


		// Group 3
		{
			int random = Random(100);

			if (random < 5)		stritemdesc = `id:40172 count:1 durability_max:16000`;
			else if (random < 5+5)	stritemdesc = `id:40175 count:1 durability_max:15000`;
			else if (random < 10+5)	stritemdesc = `id:40016 count:1 suffix:30916`;
			else if (random < 15+5)	stritemdesc = `id:40007 count:1 prefix:20622`;
			else if (random < 20+5)	stritemdesc = `id:15073 count:1 prefix:20621`;
			else if (random < 25+5)	stritemdesc = `id:15061 count:1 prefix:20207`;
			else if (random < 30+5)	stritemdesc = `id:15062 count:1 prefix:20109`;
			else if (random < 35+5)	stritemdesc = `id:15052 count:1 prefix:20210`;
			else if (random < 40+5)	stritemdesc = `id:16009 count:1 suffix:30603`;
			else if (random < 45+5)	stritemdesc = `id:16523 count:1 suffix:30401`;
			else if (random < 50+5)	stritemdesc = `id:16504 count:1 suffix:30626`;
			else if (random < 55+5)	stritemdesc = `id:16501 count:1 prefix:20621`;
			else if (random < 60+5)	stritemdesc = `id:18010 count:1 prefix:20101`;
			else if (random < 65+5)	stritemdesc = `id:18011 count:1 prefix:20406`;
			else if (random < 70+5)	stritemdesc = `id:18046 count:1 prefix:20621`;
			else if (random < 75+5)	stritemdesc = `manual:111 count:1`;
			else if (random < 80+5)	stritemdesc = `manual:113 count:1`;
			else if (random < 85+5)	stritemdesc = `manual:119 count:1`;
			else if (random < 90+5)	stritemdesc = `manual:140 count:1`;
			else if (random < 95+5)	stritemdesc = `id:40182 count:1`;

			if (mazeprop.GenerateAndDropItem(stritemdesc , me)) {}
			else
			{
				me.ShowCaption(stritemdesc + ["event.nubes_undermaze_chest.3"]);
			}
		}
	}
	// 컨디션에 따라 랜덤하게 호출됨
	else if (condition == 1)
	{
		// Group 1
		{
			int random = Random(100);

			if (random < 40) 		ProcessMoneyDrop(mazeprop, me, 1000, 2000);
			else if (random < 40+30)	ProcessMoneyDrop(mazeprop, me, 3000, 4000);
			else if (random < 70+20)	ProcessMoneyDrop(mazeprop, me, 5000, 6000);
			else if (random < 90+10)	ProcessMoneyDrop(mazeprop, me, 7000, 8000);
		}

		// Group 2
		{
			int random = Random(100);

			if (random < 30)		stritemdesc = `id:50171 count:1 quality:50~100`;
			else if (random < 30+30)	stritemdesc = `id:50181 count:1 quality:50~100`;
			else if (random < 60+30)	stritemdesc = `id:50182 count:1 quality:50~100`;
			else if (random < 90+10)	stritemdesc = `id:50183 count:1 quality:50~100`;

			if (mazeprop.GenerateAndDropItem(stritemdesc , me)) {}
			else
			{
				me.ShowCaption(stritemdesc + ["event.nubes_undermaze_chest.4"]);
			}
		}


		// Group 3
		{
			int random = Random(100);
			if (random < 5)		stritemdesc = `id:40030 count:1 suffix:30916`;
			else if (random < 5+5)	stritemdesc = `id:40033 count:1 prefix:20622`;
			else if (random < 10+5)	stritemdesc = `id:40174 count:1 durability_max:17000`;
			else if (random < 15+5)	stritemdesc = `id:40177 count:1 durability_max:17000`;
			else if (random < 20+5)	stritemdesc = `id:14019 count:1 suffix:30701`;
			else if (random < 25+5)	stritemdesc = `id:14030 count:1 prefix:20621`;
			else if (random < 30+5)	stritemdesc = `id:14007 count:1 prefix:20613`;
			else if (random < 35+5)	stritemdesc = `id:14018 count:1 prefix:20712`;
			else if (random < 40+5)	stritemdesc = `id:17506 count:1 suffix:30702`;
			else if (random < 45+5)	stritemdesc = `id:17515 count:1 prefix:20204`;
			else if (random < 50+5)	stritemdesc = `id:17505 count:1 suffix:30626`;
			else if (random < 55+5)	stritemdesc = `id:17501 count:1 prefix:20621`;
			else if (random < 60+5)	stritemdesc = `id:18502 count:1 prefix:20407`;
			else if (random < 65+5)	stritemdesc = `id:18509 count:1 prefix:20110`;
			else if (random < 70+5)	stritemdesc = `id:18516 count:1 suffix:30626`;
			else if (random < 75+5)	stritemdesc = `manual:20119 count:1`;
			else if (random < 80+5)	stritemdesc = `manual:20122 count:1`;
			else if (random < 85+5)	stritemdesc = `manual:20138 count:1`;
			else if (random < 90+5)	stritemdesc = `manual:20140 count:1`;
			else if (random < 95+5)	stritemdesc = `id:40182 count:1`;


			if (mazeprop.GenerateAndDropItem(stritemdesc , me)) {}
			else
			{
				me.ShowCaption(stritemdesc + ["event.nubes_undermaze_chest.5"]);
			}

		}

	}
}

////////////////////////////////////////////////////////////////////////////////
server void ProcessMoneyDrop(
	prop mazeprop,
	character me,
	int min,
	int max)
// : 돈을 떨어뜨리는 처리를 하는 내부 함수
////////////////////////////////////////////////////////////////////////////////
{
	int money = Random(min, max);

	while (money > 1000)
	{
		if (mazeprop.GenerateAndDropItem(`id:2000 count:1000`, me))
		{
			money = money - 1000;			
		}
		else
		{
			me.ShowCaption(`id:2000 count:1000` + ["event.nubes_undermaze_chest.6"]);
			break;
		}
	}

	if (mazeprop.GenerateAndDropItem(`id:2000 count:` + ToString(money), me)) {}
	else
	{
		me.ShowCaption(`id:2000 count:` + ToString(money) + ["event.nubes_undermaze_chest.7"]);
	}
}
