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
	//대만 새끼 멧돼지의 선물
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;
	int itemID = cItem.GetClassId();

	iRandom = Random(100);	//대만 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:63030 col1:6e10fdf4`; iCumRate += 4;} // 금/황
			case(1){itemString = `id:63030 col1:86402894`; iCumRate += 4;} // 붉은색/검은색
			case(2){itemString = `id:63030 col1:82f2558d`; iCumRate += 5;} // 파란색/흰색
			case(3){itemString = `id:63030 col1:660000ff`; iCumRate += 5;} // 검은색/흰색
			case(4){itemString = `id:63030 col1:83317370`; iCumRate += 5;} // 자색/붉은색
			case(5){itemString = `id:63030 col1:63001021`; iCumRate += 6;} // 회색/흰색
			case(6){itemString = `id:63030 col1:6240001b`; iCumRate += 6;} // 짙은 갈색/옅은 갈색
			case(7){itemString = `id:63030 col1:FF0000`; iCumRate += 5;} // 붉은색
			case(8){itemString = `id:63030 col1:0033FF`; iCumRate += 8;} // 파란색
			case(9){itemString = `id:63030 col1:FFFFFF`; iCumRate += 8;} // 흰색
			case(10){itemString = `id:63030 col1:000000`; iCumRate += 8;} // 검은색
			case(11){itemString = `id:63030 col1:FFCC00`; iCumRate += 12;} // 황금색
			case(12){itemString = `id:63030 col1:0033FF`; iCumRate += 12;} // 하늘색
			case(13){itemString = `id:63030 col1:FF66FF`; iCumRate += 12;} // 붉은 장미색
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
			for (i = 0; i < 2; i++)
			{
				DebugOut(`유저에게 염색앰플을 줌`);
				GiveLittleBoarGachaphonItem(player,`id:63024 expire:10080`,itemID) extern (`data/script/event/useitem_event.mint`);
			}
			DebugOut(`유저에게 `+itemString+` 를 줌`);
			GiveLittleBoarGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}
		++i;
	}
	GiveLittleBoarGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
