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
	// 중국 캐시 가챠폰(리뉴얼) - 셋트로 랜덤 돌림
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		meta_array itemArray;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 확률은 여기에서 기술
			case(0){ iCumRate += 9;}
			case(1){ iCumRate += 9;}
			case(2){ iCumRate += 11;}
			case(3){ iCumRate += 9;}
			case(4){ iCumRate += 9;}
			case(5){ iCumRate += 11;}
			case(6){ iCumRate += 13;}
			case(7){ iCumRate += 9;}
			case(8){ iCumRate += 11;}
			case(9){ iCumRate += 4;}
			case(10){ iCumRate += 5;}

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
					itemString = `id:91002 count:9`;
					itemArray.Add(itemString);	// 마나 부스트 포션 9개
					itemString = `id:91001 count:8`;
					itemArray.Add(itemString);	// 생명력 부스트 포션 8개
				}
				case (1)
				{
					itemString = `id:91004 count:9`;
					itemArray.Add(itemString);	// 보호와 방어 부스트 포션 5개
					itemString = `id:91003 count:8`;
					itemArray.Add(itemString);	// 스태미나 부스트 포션 5개
				}
				case (2)
				{
					itemString = `id:63064 count:5`;
					itemArray.Add(itemString);	// 하트 모양 불꽃놀이 키트 5개
					itemString = `id:63074 count:6`;
					itemArray.Add(itemString);	// 나오 불꽃놀이 키트 6개
					itemString = `id:63075 count:6`;
					itemArray.Add(itemString);	// 데브캣 불꽃놀이 키트 6개
				}
				case (3)
				{
					itemString = `id:63026 count:4`;
					itemArray.Add(itemString);	// 원격 은행 이용권 4개
					itemString = `id:63026 count:5`;
					itemArray.Add(itemString);	// 원격 은행 이용권 5개
					itemString = `id:63047 count:4`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 원격 힐러집 이용권 8개
				}
				case (4)
				{
					itemString = `id:63043 count:7`;
					itemArray.Add(itemString);	// 어드밴스드 깃털 7개
					itemString = `id:63044 count:5`;
					itemArray.Add(itemString);	// 파티 부활의 깃털 5개
				}
				case (5)
				{
					itemString = `id:63027 expire:43200`;	// 밀랍 날개 4개
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemArray.Add(itemString);
					itemString = `id:63029 count:5`;
					itemArray.Add(itemString);
					itemString = `id:63029 count:4`;
					itemArray.Add(itemString);							// 캠프파이어 키트 9개
				}
				case (6)
				{
					itemString = `id:91007 expire:43200 count:2`;
					itemArray.Add(itemString);	// 17살의 키가 되는 포션 2개
					itemString = `id:91006 expire:43200 count:3`;
					itemArray.Add(itemString);	// 10살의 키가 되는 포션 3개
				}
				case (7)
				{
					itemString = `id:63025 count:2`;
					itemArray.Add(itemString);	// 대용량 축복의 포션 2개
					itemString = `id:91005 expire:43200 count:4`;
					itemArray.Add(itemString);	// 전투력 약화 포션 4개
				}
				case (8)
				{
					itemString = `id:51031 count:5`;
					itemArray.Add(itemString);	// 완전 회복의 포션 5개
					itemString = `id:63024 expire:10080`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 염색 앰플 2개
				}
				case (9)
				{
					itemString = `id:91066`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 정령수리포션 1~5
					itemString = `id:91067`;
					itemArray.Add(itemString);	// 정령수리포션6~10
				}
				case (10)
				{
					itemString = `id:91059`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 펫체형1살
					itemString = `id:91063`;
					itemArray.Add(itemString);
					itemArray.Add(itemString);	// 펫체형5살
				}

			}

			int j = 0;
			for (j = 0; j < itemArray.GetSize(); ++j)
			{
				itemString = (string)itemArray.Get(j);
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
	}

	// 실패했을 때의 디폴트 아이템
	GiveFashionGachaphonItem(player, `id:91006`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
	GiveFashionGachaphonItem(player, `id:91007`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
	GiveFashionGachaphonItem(player, `id:91008`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
