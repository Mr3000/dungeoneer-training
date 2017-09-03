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
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(13);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:40095 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692드래곤 블레이드
			case(1){itemString = `id:40033 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692클레이모어
			case(2){itemString = `id:40242 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692배틀 소드
			case(3){itemString = `id:46006 col1:c7dc68 col2:ffffff`; iCumRate +=1;} //7.692307692카이트 실드
			case(4){itemString = `id:40193 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692무라마사
			case(5){itemString = `id:40171 col1:ffffff col2:00a968 col3:d8e698`; iCumRate +=1;} //7.692307692마사무네
			case(6){itemString = `id:40195 col1:d8e698 col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692요시미츠
			case(7){itemString = `id:40192 col1:c7dc68 col2:ffffff col3:00a968`; iCumRate +=1;} //7.692307692일본식 한손검
			case(8){itemString = `id:40170 col1:ffffff col2:00a968 col3:d8e698`; iCumRate +=1;} //7.692307692일본식 양손검
			case(9){itemString = `id:40194 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692일본식 단검
			case(10){itemString = `id:40078 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692비펜니스
			case(11){itemString = `id:40081 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692레더 롱 보우
			case(12){itemString = `id:40049 col1:b8c43a col2:00a968 col3:ffffff`; iCumRate +=1;} //7.692307692플루트
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
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
