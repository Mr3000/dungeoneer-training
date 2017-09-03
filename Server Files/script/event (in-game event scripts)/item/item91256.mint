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
		int itemID = cItem.GetClassId();
		string charName = player.GetDisplayName();
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(260);	//확률의 총합을 적는다
		string DefItemString;
		int appraise_explore_exp;
		int appraise_gold;

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15215`; iCumRate +=4;} //1.242236025중국 신년 빨강옷(남성용)
				case(1){itemString = `id:15216`; iCumRate +=4;} //1.242236025중국 신년 빨강옷(여성용)
				case(2){itemString = `id:18151`; iCumRate +=4;} //1.242236025중국 신년 털 모자(남성용)
				case(3){itemString = `id:18152`; iCumRate +=4;} //1.242236025중국 신년 머리 장식(여성용)
				case(4){itemString = `id:15280`; iCumRate +=4;} //1.242236025남성용 경극 의상
				case(5){itemString = `id:15281`; iCumRate +=4;} //1.242236025여성용 경극 의상
				case(6){itemString = `id:17110`; iCumRate +=4;} //1.242236025경극 신발
				case(7){itemString = `id:18194`; iCumRate +=4;} //1.242236025남성용 경극 머리장식
				case(8){itemString = `id:18195`; iCumRate +=4;} //1.242236025여성용 경극 머리장식
				case(9){itemString = `id:12283`; iCumRate +=5;} //3.105590062푸른 개조석
				case(10){itemString = `id:12284`; iCumRate +=5;} //3.105590062붉은 개조석
				case(11){itemString = `id:64042 size:3`; iCumRate +=4;} //3.105590062토파즈
				case(12){itemString = `id:64043 size:3`; iCumRate +=4;} //3.105590062스타 사파이어
				case(13){itemString = `id:64044 size:3`; iCumRate +=4;} //3.105590062에메랄드
				case(14){itemString = `id:64045 size:3`; iCumRate +=4;} //3.105590062아쿠아마린
				case(15){itemString = `id:64046 size:3`; iCumRate +=4;} //3.105590062가넷
				case(16){itemString = `id:64047 size:3`; iCumRate +=4;} //3.105590062재스퍼
				case(17){itemString = `id:64048 size:3`; iCumRate +=4;} //3.105590062루비
				case(18){itemString = `id:64049 size:3`; iCumRate +=4;} //3.105590062스피넬
				case(19){itemString = `id:64050 size:3`; iCumRate +=2;} //1.863354037다이아몬드
				case(20){itemString = `id:51003 count:3`; iCumRate +=30;} //9.316770186생명력 50 포션
				case(21){itemString = `id:51008 count:3`; iCumRate +=30;} //9.316770186마나 50 포션
				case(22){itemString = `id:51013 count:3`; iCumRate +=30;} //9.316770186스태미나 50 포션
				case(23){itemString = `id:51004`; iCumRate +=30;} //9.316770186생명력 100 포션
				case(24){itemString = `id:51009`; iCumRate +=30;} //9.316770186마나 100 포션
				case(25){itemString = `id:51014`; iCumRate +=30;} //9.316770186스태미나 100 포션

				// 여기다 넣으세요의 끝

				default
				{
					itemString = `id:65040`; iCumRate +=1000;
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
				item newItem;
				string ItemName;
//				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);

			//	newItem = player.AddItemEx(itemString, true);

				return;
			}
			++i;
		}
}
