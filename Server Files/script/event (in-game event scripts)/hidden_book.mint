//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project PC Script
//                                                                         PC/더미
//
//                                            marlin fecit, begins at 2003. 11. 12
//                                                            marlin22@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void dropHiddenBook(dungeon2 _dungeon, dungeon2puzzle _puzzle)
// : 보이지 않는 아이템을 1개 드랍한다.
//////////////////////////////////////////////////////////////////////////////////
{


	if (!_dungeon.IsNull() && !_puzzle.IsNull())
	{
		// 등장 확률은 방 3개에 1개 수준
		if(Random(3)<1)
		{
			dropHiddenBook(_dungeon, _puzzle, 2, `book1`);
			// 입력하지 않으면 33% 확률로 0~1개 드랍
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void dropHiddenBook(dungeon2 _dungeon, dungeon2puzzle _puzzle, string bookType)
// : 보이지 않는 아이템을 1개 드랍한다.
// bookType에 따라 같은 하드급 던전이어도 떨구는게 달라진다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (!_dungeon.IsNull() && !_puzzle.IsNull())
	{
		// 등장 확률은 방 3개에 1개 수준
		// G13 퍼스트 폴리오는 직접 100% 드랍하도록 설정
		if(bookType==`bookPolio`)
		{
			_puzzle.DropItem(`id:75457`, 0, 0, 100, 900, false);
		}
		else if(Random(3)<1)
		{
			dropHiddenBook(_dungeon, _puzzle, 2, bookType);
			// 입력하지 않으면 33% 확률로 0~1개 드랍
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void dropHiddenPolio(dungeon2 _dungeon, dungeon2puzzle _puzzle, string bookType)
// : 보이지 않는 아이템을 1개 드랍한다.
// bookType에 따라 같은 하드급 던전이어도 떨구는게 달라진다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (!_dungeon.IsNull() && !_puzzle.IsNull())
	{
		// 등장 확률은 방 3개에 1개 수준
		// G13 퍼스트 폴리오는 100% 드랍하도록 설정
		if(Random(3)<1 && bookType!=["event.hidden_book.1"])
		{
			dropHiddenBook(_dungeon, _puzzle, 2, bookType);
			// 입력하지 않으면 33% 확률로 0~1개 드랍
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void dropHiddenBook(dungeon2 _dungeon, dungeon2puzzle _puzzle, int count, string bookType)
// : 보이지 않는 아이템을 최대 count개 드랍한다.
//////////////////////////////////////////////////////////////////////////////////
{


	if (!_dungeon.IsNull() && !_puzzle.IsNull())		// 앞에서 해서 굳이 또 할 필요는 없지만..
	{
		int missionLevel = _dungeon.GetMissionLevel();

		if(count==1)
		{
			count++;
		}

		// 최대 count개만큼 드랍
		count = Random(count);

		string itemString;

		int i;
		for(i=0; i<count; i++)
		{
			// 뭘 떨굴지 결정
			itemString = getDropBookID(missionLevel, bookType);

			// 아이템을 드랍한다. DropItem( 아이템 String, x 좌표, y 좌표, 최소 반지름, 최대 반지름, true면 시간 지나서 파괴되는 아이템)
			_puzzle.DropItem(itemString, 0, 0, 100, 900, false);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server string getDropBookID(int missionLevel, string bookType)
// : 어떤 아이템을 떨굴지 가져온다.
//////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);
	//  확률의 총합은 100이라고 가정. 늘리고 싶음 늘림되긴함..iRandom값이 먼저 정해지는게 포인트다..

	if(bookType == `book1`)  // 책 타입이 1번인 경우
	{
		if(missionLevel==0)
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75341`;	// A1-1
						iCumRate += 15;
					}
					case (1)
					{
						itemDesc = `id:75342`;	// A-2
						iCumRate += 15;
					}
					case (2)
					{
						itemDesc = `id:75344`;	// A2-2
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:64584`;	// 빛나는 고서
						iCumRate += 20;
					}
					case (4)
					{
						itemDesc = `id:64586`;	// 빛나는 고서 2페이지
						iCumRate += 20;
					}

					case (5)
					{
						itemDesc = `id:64589`;	// 빛나는 고서
						iCumRate += 15;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==1)  // 중급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.

					case (0)
					{
						itemDesc = `id:75373`;
						iCumRate += 30;
					}
					case (1)
					{
						itemDesc = `id:75375`;
						iCumRate += 30;
					}
					case (2)
					{
						itemDesc = `id:75379`;
						iCumRate += 40;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==2) // 고급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75383`;
						iCumRate += 25;
					}
					case (1)
					{
						itemDesc = `id:75384`;
						iCumRate += 25;
					}
					case (2)
					{
						itemDesc = `id:75387`;
						iCumRate += 25;
					}
					case (3)
					{
						itemDesc = `id:75393`;
						iCumRate += 25;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else   // 하드
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75397`;
						iCumRate += 15;
					}
					case (1)
					{
						itemDesc = `id:75398`;
						iCumRate += 15;
					}
					case (2)
					{
						itemDesc = `id:75403`;
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:75406`;
						iCumRate += 15;
					}
					case (4)
					{
						itemDesc = `id:75408`;
						iCumRate += 25;
					}
					case (5)
					{
						itemDesc = `id:75411`;
						iCumRate += 15;
					}
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
					return itemDesc;
				}
				++i;
			}
		}
	}
	else if(bookType == `book2`) // 책 타입이 2번인 경우
	{
		if(missionLevel==0)
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75348`;
						iCumRate += 15;
					}
					case (1)
					{
						itemDesc = `id:75349`;
						iCumRate += 15;
					}
					case (2)
					{
						itemDesc = `id:75350`;
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:75351`;
						iCumRate += 15;
					}
					case (4)
					{
						itemDesc = `id:64585`;
						iCumRate += 20;
					}
					case (5)
					{
						itemDesc = `id:64587`;
						iCumRate += 20;
					}
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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==1)  // 중급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75376`;
						iCumRate += 30;
					}
					case (1)
					{
						itemDesc = `id:75380`;
						iCumRate += 30;
					}
					case (2)
					{
						itemDesc = `id:75381`;
						iCumRate += 40;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==2) // 고급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75385`;
						iCumRate += 25;
					}
					case (1)
					{
						itemDesc = `id:75389`;
						iCumRate += 25;
					}
					case (2)
					{
						itemDesc = `id:75390`;
						iCumRate += 25;
					}
					case (3)
					{
						itemDesc = `id:75392`;
						iCumRate += 25;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else   // 하드
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75399`;
						iCumRate += 20;
					}
					case (1)
					{
						itemDesc = `id:75400`;
						iCumRate += 20;
					}
					case (2)
					{
						itemDesc = `id:75404`;
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:75407`;
						iCumRate += 15;
					}
					case (4)
					{
						itemDesc = `id:75410`;
						iCumRate += 30;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
	}
	else  //책 타입이 book3이거나 기입 안한 경우
	{
		if(missionLevel==0)
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75343`;
						iCumRate += 15;
					}
					case (1)
					{
						itemDesc = `id:75346`;
						iCumRate += 15;
					}
					case (2)
					{
						itemDesc = `id:75347`;
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:64583`;
						iCumRate += 20;
					}
					case (4)
					{
						itemDesc = `id:64588`;
						iCumRate += 20;
					}
					case (5)
					{
						itemDesc = `id:64590`;
						iCumRate += 15;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==1)  // 중급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75374`;
						iCumRate += 35;
					}
					case (1)
					{
						itemDesc = `id:75377`;
						iCumRate += 30;
					}
					case (2)
					{
						itemDesc = `id:75378`;
						iCumRate += 35;
					}
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
					return itemDesc;
				}
				++i;
			}
		}
		else if(missionLevel==2) // 고급
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75386`;
						iCumRate += 25;
					}
					case (1)
					{
						itemDesc = `id:75388`;
						iCumRate += 25;
					}
					case (2)
					{
						itemDesc = `id:75391`;
						iCumRate += 25;
					}
					case (3)
					{
						itemDesc = `id:75394`;
						iCumRate += 25;
					}
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
					return itemDesc;
				}
				++i;
			}
		}
		else if(bookType == `book3`) // 책 타입이 3번인 경우
		{
			while(true)
			{
				bool bBreak = false;
				string itemDesc;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					//아이템의 종류와 확률을 기록 나올 확률이 큰 것부터 기록하는게 좋다
					//서술된 iCumRate 의 합은 iRandom의 최대값 이하이어야한다.
					case (0)
					{
						itemDesc = `id:75396`;
						iCumRate += 10;
					}
					case (1)
					{
						itemDesc = `id:75401`;
						iCumRate += 10;
					}
					case (2)
					{
						itemDesc = `id:75402`;
						iCumRate += 15;
					}
					case (3)
					{
						itemDesc = `id:75405`;
						iCumRate += 15;
					}
					case (4)
					{
						itemDesc = `id:75409`;
						iCumRate += 50;
					}

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
					return itemDesc;
				}
				++i;
			}
		}
	}	
}
