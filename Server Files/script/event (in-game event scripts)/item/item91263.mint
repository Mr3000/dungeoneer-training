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
	int iRandom = Random(10000);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString=`id:99993`;iCumRate+=1000;}//2콤보카드
			case(1){itemString=`id:99994`;iCumRate+=500;}//3콤보카드
			case(2){itemString=`id:99995`;iCumRate+=100;}//4콤보카드
			case(3){itemString=`id:99996`;iCumRate+=1;}//5콤보카드
			case(4){itemString=`id:51001`;iCumRate+=700;}//생명력 10 포션
			case(5){itemString=`id:51002`;iCumRate+=600;}//생명력 30 포션
			case(6){itemString=`id:51003`;iCumRate+=300;}//생명력 50 포션
			case(7){itemString=`id:51004`;iCumRate+=200;}//생명력 100 포션
			case(8){itemString=`id:51005`;iCumRate+=200;}//생명력 300 포션
			case(9){itemString=`id:51006`;iCumRate+=699;}//마나 10 포션
			case(10){itemString=`id:51007`;iCumRate+=600;}//마나 30 포션
			case(11){itemString=`id:51008`;iCumRate+=300;}//마나 50 포션
			case(12){itemString=`id:51009`;iCumRate+=200;}//마나 100 포션
			case(13){itemString=`id:51010`;iCumRate+=200;}//마나 300 포션
			case(14){itemString=`id:51011`;iCumRate+=600;}//스태미나 10 포션
			case(15){itemString=`id:51012`;iCumRate+=600;}//스태미나 30 포션
			case(16){itemString=`id:51013`;iCumRate+=400;}//스태미나 50 포션
			case(17){itemString=`id:51014`;iCumRate+=200;}//스태미나 100 포션
			case(18){itemString=`id:51015`;iCumRate+=200;}//스태미나 300 포션
			case(19){itemString=`id:51016`;iCumRate+=600;}//부상 10 치료 포션
			case(20){itemString=`id:51017`;iCumRate+=600;}//부상 30 치료 포션
			case(21){itemString=`id:51018`;iCumRate+=300;}//부상 50 치료 포션
			case(22){itemString=`id:51019`;iCumRate+=200;}//부상 100 치료 포션
			case(23){itemString=`id:51020`;iCumRate+=200;}//부상 300 치료 포션
			case(24){itemString=`id:51031`;iCumRate+=30;}//완전회복포션
			case(25){itemString=`id:63058`;iCumRate+=30;}//회복속도증가포션
			case(26){itemString=`id:63188`;iCumRate+=30;}//원격연금술사의집 이용권
			case(27){itemString=`id:63070`;iCumRate+=30;}//원격무기상점이용권
			case(28){itemString=`id:63057`;iCumRate+=30;}//원격의류수리이용권
			case(29){itemString=`id:63039`;iCumRate+=30;}//캠프키트
			case(30){itemString=`id:63056`;iCumRate+=30;}//원격대장간수리이용권
			case(31){itemString=`id:63029`;iCumRate+=30;}//캠프파이어키트
			case(32){itemString=`id:63026`;iCumRate+=30;}//원격은행이용권
			case(33){itemString=`id:63071`;iCumRate+=30;}//원격관청이용권
			case(34){itemString=`id:63047`;iCumRate+=30;}//원격힐러집이용권
			case(35){itemString=`id:63051`;iCumRate+=30;}//거대한외침의뿔피리
			case(36){itemString=`id:63052`;iCumRate+=30;}//외침의뿔피리
			case(37){itemString=`id:63086`;iCumRate+=30;}//생명력의 엘릭서
			case(38){itemString=`id:63087`;iCumRate+=30;}//마나의 엘릭서
			case(39){itemString=`id:63088`;iCumRate+=30;}//스태미나의 엘릭서
			case(40){itemString=`id:63258`;iCumRate+=10;}//염색 앰플
			case(41){itemString=`id:63259`;iCumRate+=10;}//금속 염색 앰플
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
			GivetodayboxItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GivetodayboxItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
