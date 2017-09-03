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
	//중국 특별한 아머 가챠폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;

	iRandom = Random(201);	//대만 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString=`id:15233 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=5;}//2.4875621891 201엘레건트 고딕 드레스
			case(1){itemString=`id:15234 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=5;}//2.4875621891 201엘레건트 고딕 슈트
			case(2){itemString=`id:15235 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=5;}//2.4875621891 201엘레건트 고딕 드레스
			case(3){itemString=`id:15112 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201셀리나 스쿨보이룩
			case(4){itemString=`id:15113 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201여성용 검사학교 교복 쇼트타입
			case(5){itemString=`id:15114 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201남성용 검사학교 교복 롱타입
			case(6){itemString=`id:15131 col1:FFD9EC col2:FFD9EC col3:FFD9EC`;iCumRate+=6;}//2.9850746269 201핀 에이프런 스커트
			case(7){itemString=`id:15132 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201내추럴 베스트 웨어
			case(8){itemString=`id:15135 col1:000000 col2:FFFFFF col3:FF0000`;iCumRate+=6;}//2.9850746269 201시크 수트
			case(9){itemString=`id:15233`;iCumRate+=10;}//4.9751243781 201엘레건트 고딕 드레스
			case(10){itemString=`id:15234`;iCumRate+=10;}//4.9751243781 201엘레건트 고딕 슈트
			case(11){itemString=`id:15235`;iCumRate+=10;}//4.9751243781 201엘레건트 고딕 드레스
			case(12){itemString=`id:15112`;iCumRate+=20;}//9.9502487562 201셀리나 스쿨보이룩
			case(13){itemString=`id:15113`;iCumRate+=20;}//9.9502487562 201여성용 검사학교 교복 쇼트타입
			case(14){itemString=`id:15114`;iCumRate+=20;}//9.9502487562 201남성용 검사학교 교복 롱타입
			case(15){itemString=`id:15131`;iCumRate+=20;}//9.9502487562 201핀 에이프런 스커트
			case(16){itemString=`id:15132`;iCumRate+=20;}//9.9502487562 201내추럴 베스트 웨어
			case(17){itemString=`id:15135`;iCumRate+=20;}//9.9502487562 201시크 수트
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
