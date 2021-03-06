////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                                        이벤트용 던젼 스크립트
//
//                                        versable fecit, begins at 2008. 07. 29
//                                                        versable@nexonsd.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void AddEventReward(
	puzzle _this, character	cChar, int i)
// : 대만 퍼즐 이벤트 보상방 보물상자에 보상 아이템을 넣어준다.
////////////////////////////////////////////////////////////////////////////////
{
	string counter;
	string strItem;
	bool HaveMemo = false;

	if (cChar.HaveKeyword(`switch_counter_0`))
	{
		counter = `Ma`;
	}else
	if (cChar.HaveKeyword(`switch_counter_1`))
	{
		counter = `Bi`;
	}else
	if (cChar.HaveKeyword(`switch_counter_2`))
	{
		counter = `No`;
	}else
	if (cChar.HaveKeyword(`switch_counter_3`))
	{
		counter = `Gi`;
	}

	DebugOut(`Ma:` + ToString(cChar.GetItemNoWithClassId(65041)));
	DebugOut(`Bi:` + ToString(cChar.GetItemNoWithClassId(65042)));
	DebugOut(`No:` + ToString(cChar.GetItemNoWithClassId(65043)));
	DebugOut(`Gi:` + ToString(cChar.GetItemNoWithClassId(65044)));

	if (cChar.GetItemNoWithClassId(65041) == 1)
	{
		strItem = `Ma`;
		HaveMemo = true;
	}else
	if (cChar.GetItemNoWithClassId(65042) == 1)
	{
		strItem = `Bi`;
		HaveMemo = true;
	}else
	if (cChar.GetItemNoWithClassId(65043) == 1)
	{
		strItem = `No`;
		HaveMemo = true;
	}else
	if (cChar.GetItemNoWithClassId(65044) == 1)
	{
		strItem = `Gi`;
		HaveMemo = true;
	}

	if ((counter == strItem) && !cChar.HaveKeyword(`switch flag`))
	{
		int iRandom;

		puzzle_chest _treasureChest = (puzzle_chest)(_this.FindProp(`treasure` + ToString(i+1)));

		iRandom = Random(200);

		if (iRandom < 1)
		{
			_treasureChest.AddItem(`id:15267 col1:ffffff col2:63b6e1 col3:000000`);	// 테라 고딕 풀 드레스
		}
		else if (iRandom < 2)
		{
			_treasureChest.AddItem(`id:15268 col1:66573b col2:000000 col3:ffffff`);	// 테라 고딕 펑크 수트
		}
		else if (iRandom < 42)
		{
			_treasureChest.AddItem(`id:63016 count:5`);	//축복의 포션
		}
		else if (iRandom < 82)
		{
			_treasureChest.AddItem(`id:51024 count:10`);	//생명력과 마나 100 포션
		}
		else if (iRandom < 122)
		{
			_treasureChest.AddItem(`id:51029 count:10`);	//생명력과 스태미나 100 포션
		}
		else if (iRandom < 162)
		{
			_treasureChest.AddItem(`id:60049 count:10`);	//최고급 수제 붕대
		}
		else if (iRandom < 176)
		{
			_treasureChest.AddItem(`id:40006 durability:11000 durability_max:11000`);	//단검
		}
		else if (iRandom < 188)
		{
			_treasureChest.AddItem(`id:40176 col1:ffffff col2:cf9132`);	//배틀 해머
		}
		else if (iRandom < 200)
		{
			_treasureChest.AddItem(`id:40107 col1:cf9132`);	//가디언 보우
		}

		DebugOut(`보상 아이템 넣기 완료!`);
	}
	int j;
	if (HaveMemo)
	{
		for (j = 0; j < 4; j++)
		{
			cChar.RemoveItemCls((65041 + j), 1);
		}

		cChar.ShowMessageView(["puzzle.puzzle_event_taiwan.1"]);
	}

	string capt_reply;

	if (cChar.HaveKeyword(`switch flag`))
	{
		capt_reply = ["puzzle.puzzle_event_taiwan.2"];
		cChar.RemoveKeyword(`switch flag`);
	}
	else
	{
		capt_reply = ["puzzle.puzzle_event_taiwan.3"] << counter << strItem;
	}

	cChar.ShowCaption(capt_reply);
}

////////////////////////////////////////////////////////////////////////////////
server void SwitchCounter(
	puzzle _this, object_list cMemberList)
// : 스위치를 타격할 경우 카운트 한다.
////////////////////////////////////////////////////////////////////////////////
{
	if (IsPuzzleEventDungeon(_this))
	{
		int cMemberNum = cMemberList.GetSize();
		character cChar;
		string setStr;
		int i;

		for (i = 0; i < cMemberNum; i++)
		{
			cChar = (character)cMemberList.GetValue(i);
			if (cChar.HaveKeyword(`switch_counter_0`))
			{
				cChar.RemoveKeyword(`switch_counter_0`);
				cChar.AddKeyword(`switch_counter_1`);
				setStr = `Bi`;
				DebugOut(`카운터:0 -> 1로 수정`);
			}else
			if (cChar.HaveKeyword(`switch_counter_1`))
			{
				if (cChar.HaveKeyword(`switch flag`))
				{
					cChar.RemoveKeyword(`switch flag`);
				}
				cChar.RemoveKeyword(`switch_counter_1`);
				cChar.AddKeyword(`switch_counter_2`);
				setStr = `No`;
				DebugOut(`카운터:1 -> 2로 수정`);
			}else
			if (cChar.HaveKeyword(`switch_counter_2`))
			{
				cChar.RemoveKeyword(`switch_counter_2`);
				cChar.AddKeyword(`switch_counter_3`);
				setStr = `Gi`;
				DebugOut(`카운터:2 -> 3로 수정`);
			}else
			if (cChar.HaveKeyword(`switch_counter_3`))
			{
				cChar.RemoveKeyword(`switch_counter_3`);
				cChar.AddKeyword(`switch_counter_0`);
				setStr = `Ma`;
				DebugOut(`카운터:3 -> 0로 수정`);
			}
			cChar.ShowCaption(["puzzle.puzzle_event_taiwan.4"] + setStr + ["puzzle.puzzle_event_taiwan.5"]);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool IsPuzzleEventDungeon(
	puzzle _this)
// : 퍼즐 이벤트 던전인지 검사한다.
////////////////////////////////////////////////////////////////////////////////
{
	dungeon _dungeon = _this.GetDungeon();
	string dungeonName = _dungeon.GetName();
	DebugOut(`현재 입장한 던전은 [` + dungeonName + `] 입니다`);
	bool evDungeon = false;

	if (dungeonName.LowerCase() == `tircho_alby_high_1_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_alby_high_3_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_alby_high_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_ciar_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_ciar_low_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_ciar_high_2_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_ciar_high_3_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `tircho_ciar_high_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_rabbie_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_rabbie_low_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_rabbie_high_2_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_rabbie_high_3_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_rabbie_high_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_math_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `dunbarton_math_low_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `bangor_barri_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `bangor_barri_low_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `bangor_barri_high_2_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `bangor_barri_high_3_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `bangor_barri_high_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `gairech_fiodh_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `emain_coill_dungeon`)
	{
		evDungeon = true;
	}else
/*	if (dungeonName.LowerCase() == `emain_coill_dungeon_gianticesprite`)
	{
		evDungeon = true;
	}else
*/
	if (dungeonName.LowerCase() == `emain_runda_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `emain_runda_low_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `emain_runda_middle_siren_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `senmag_peaca_dungeon`)
	{
		evDungeon = true;
	}else
	if (dungeonName.LowerCase() == `senmag_peaca_low_dungeon`)
	{
		evDungeon = true;
	}

	return evDungeon;
}