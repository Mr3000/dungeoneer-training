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
	// 대만 홍빠오
	int itemID = cItem.GetClassId();
	if (GetLocale().LowerCase() == `taiwan`)	// 대만일 경우
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
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
				case(0){itemString = `id:40095 col1:008080`; iCumRate +=1;}//드레곤 블레이드
				case(1){itemString = `id:40081 col1:008080 col2:008080`; iCumRate +=1;}//레더 롱 보우
				case(2){itemString = `id:18228`; iCumRate +=1;}//뱃지가 달린 비행 모자
				case(3){itemString = `id:40103`; iCumRate +=1;}//안령도
				case(4){itemString = `id:15215`; iCumRate +=5;}//중국 신년 빨강옷(남성용)
				case(5){itemString = `id:15216`; iCumRate +=5;}//중국 신년 빨강옷(여성용)
				case(6){itemString = `id:18151`; iCumRate +=5;}//중국 신년 털 모자(남성용)
				case(7){itemString = `id:18152`; iCumRate +=5;}//중국 신년 머리 장식(여성용)
				case(8){itemString = `id:40011 col1:008080`; iCumRate +=5;}//브로드 소드
				case(9){itemString = `id:40012 col1:008080`; iCumRate +=5;}//바스타드 소드
				case(10){itemString = `id:40031 col1:008080`; iCumRate +=5;}//석궁
				case(11){itemString = `id:40080 col1:008080`; iCumRate +=5;}//글라디우스
				case(12){itemString = `id:51004 count:10`; iCumRate +=5;}//생명력 100 포션
				case(13){itemString = `id:51009 count:10`; iCumRate +=5;}//마나 100 포션
				case(14){itemString = `id:51014 count:10`; iCumRate +=5;}//스태미나 100 포션
				case(15){itemString = `id:81142`; iCumRate +=6;}//감귤 나무 화분
				case(16){itemString = `id:81136`; iCumRate +=7;}//춘절 기념 의자
				case(17){itemString = `id:81137`; iCumRate +=7;}//춘절 기념 테이블
				case(18){itemString = `id:81139`; iCumRate +=7;}//춘절 기념 항아리
				case(19){itemString = `id:81140`; iCumRate +=7;}//춘절 기념 화분
				case(20){itemString = `id:81141`; iCumRate +=7;}//파인애플 화분
				// 여기다 넣으세요의 끝
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
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				GiveHongBaoItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}
			++i;
		}
	}
	else // if(IsCurrentEvent(`lunar_newyear_2009_china`))
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
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
				case(0){ iCumRate += 15;}
				case(1){ iCumRate += 20;}
				case(2){ iCumRate += 55;}
				case(3){ iCumRate += 5;}
				case(4){ iCumRate += 5;}
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
						itemString = `id:2000 count:8`;
						itemArray.Add(itemString);	// 금화 8
					}
					case (1)
					{
						itemString = `id:2000 count:88`;
						itemArray.Add(itemString);	// 금화 88
					}
					case (2)
					{
						itemString = `id:2000 count:888`;
						itemArray.Add(itemString);	// 금화 888
					}
					case (3)
					{
						itemString = `id:2000 count:8888`;
						itemArray.Add(itemString);	// 금화 8888
					}
					case (4)
					{
						itemString = `id:46021`;
						itemArray.Add(itemString);	// 판의 방패
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
	}
/*
	else
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
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
				case(0){ iCumRate += 5;}
				case(1){ iCumRate += 15;}
				case(2){ iCumRate += 50;}
				case(3){ iCumRate += 15;}
				case(4){ iCumRate += 5;}
				case(5){ iCumRate += 10;}

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
						itemString = `id:2000 count:10`;
						itemArray.Add(itemString);	// 금화 10
					}
					case (1)
					{
						itemString = `id:2000 count:100`;
						itemArray.Add(itemString);	// 금화 100
					}
					case (2)
					{
						itemString = `id:2000 count:500`;
						itemArray.Add(itemString);	// 금화 500
					}
					case (3)
					{
						itemString = `id:2000 count:1000`;
						itemArray.Add(itemString);	// 금화 1000
					}
					case (4)
					{
						itemString = `id:2000 count:1000`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);	// 금화 5000
					}
					case (5)
					{
						if (player.IsGiant())
						{
							if (player.IsFemale())
							{
								itemString = `id:18212`;
							}
							else
							{
								itemString = `id:18211`;
							}
						}
						else
						{
							itemString = `id:18210`;
						}
						itemArray.Add(itemString);
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
	}
*/

	// 실패했을 때의 디폴트 아이템
	GiveHongBaoItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
