////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                                        이벤트용 던젼 스크립트
//
//                                        dochigun fecit, begins at 2007. 10. 09
//                                                          dochigun@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void AddEventReward(
	string _strDungeonName, puzzle_chest _cChest, int _iChestNum)
////////////////////////////////////////////////////////////////////////////////
{
	// 중국 2주년 이벤트일때 상자에 '아이템 세트 보석'을 넣어준다.
	if (IsCurrentEvent(`china_2nd_anniversary`))
	{
		if (Random(100) < 1)
		{
			_cChest.AddItem(`id:75199`);
		}
	}
}


////////////////////////////////////////////////////////////////////////////////
// grade = 난이도
server void AddCombo(
	string _strDungeonName, puzzle_chest _cChest, int _iChestNum, int grade)
////////////////////////////////////////////////////////////////////////////////
{
	if (IsEnable(`featureCombocard`) extern (`data/script/features.mint`)) //G13s2 이후에 콤보카드 드랍
	{
		// 드랍율 설정
		int Combo=0;

		if (IsTestServer() || IsDevelopment())
		{
			Combo=100;
		}
		else if(grade==1)
		{
			Combo=5;
		}
		else if(grade==2)
		{
			Combo=10;
		}
		else if(grade==3)
		{
			Combo=15;
		}

		DebugOut(ToString(Combo) + `확률이다`);


		int comboRandom = Random(100);	
		int slotRandom = Random(100);	

		if(comboRandom<Combo)
		{
			// 슬롯이 몇개인 카드가 드랍될지 선정 (4~6개)
			if(slotRandom<=33)
			{
				_cChest.AddItem(`id:99995`);
			}
			else if(slotRandom<66)
			{
				_cChest.AddItem(`id:99996`);
			}
			else if(slotRandom<99)
			{
				_cChest.AddItem(`id:99997`);
			}
			// 골드 콤보 카드 제공
			else if(slotRandom==99)
			{
				int goldCombo = Random(4);
				if(goldCombo==0)
				{
					_cChest.AddItem(`id:99000`);
				}
				else if(goldCombo==1)
				{
					_cChest.AddItem(`id:99001`);
				}
				else if(goldCombo==2)
				{
					_cChest.AddItem(`id:99002`);
				}
				else if(goldCombo==3)
				{
					_cChest.AddItem(`id:99003`);
				}
			}
		}

	}

}
