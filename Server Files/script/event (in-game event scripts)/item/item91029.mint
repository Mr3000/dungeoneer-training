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
	//일본 한정지염가차폰 보라
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(891);	//확률의 총합을 적는다
	while(true)
	{
		bool bBreak = false;
		int color;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){color = 0xAEA2C9; iCumRate += 200;} //22.44668911
			case(1){color = 0x4B105C; iCumRate += 200;} //22.44668911
			case(2){color = 0xAC487E; iCumRate += 130;} //22.44668911
			case(3){color = 0xA46898; iCumRate += 130;} //22.44668911
			case(4){color = 0x7D6B9E; iCumRate += 100;} //3.367003367
			case(5){color = 0x524782; iCumRate += 100;} //3.367003367
			case(6){color = 0x73356F; iCumRate += 30;} //3.367003367
			case(7){color = 0x827078CF; iCumRate += 1;} //0.112233446
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
			DebugOut(`유저에게 `+ToString(color)+` 를 줌`);
			GiveDyeingAmple(player,color,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}
		++i;
	}
	GiveDyeingAmple(player, 0xAEA2C9,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 색깔이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
						
}
