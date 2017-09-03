//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
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
	// 대만 홍빠오 신년 황금 쥐 펫 용
	int iCumRate = 0; //확률을 누적해놓는 변수
	int itemID = cItem.GetClassId();
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		meta_array itemArray;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 확률은 여기에서 기술
			case(0){ iCumRate += 40;}
			case(1){ iCumRate += 30;}
			case(2){ iCumRate += 15;}
			case(3){ iCumRate += 12;}
			case(4){ iCumRate += 3;}

			// 여기다 넣으세요의 끝
			default
			{
				bBreak = true;
			}
		}

		if (iRandom < iCumRate)
		{
			switch(i)
			{
				// 주는 아이템은 여기에서 기술
				case (0)
				{
					itemString = `id:2000 count:100`;
					itemArray.Add(itemString);	// 금화 100
				}
				case (1)
				{
					itemString = `id:2000 count:500`;
					itemArray.Add(itemString);	// 금화 500
				}
				case (2)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);	// 금화 1000
				}
				case (3)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 금화 5000
				}
				case (4)
				{
					itemString = `id:2000 count:1000`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 금화 10000
				}
			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				GiveHongBaoItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
	}

	// 실패했을 때의 디폴트 아이템
	GiveHongBaoItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
