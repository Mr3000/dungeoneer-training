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
				case(0){itemString = `id:15570`; iCumRate +=2;} //0.621 세인트 패트릭데이 의상
				case(1){itemString = `id:15571`; iCumRate +=2;} //0.621 세인트 패트릭데이 의상
				case(2){itemString = `id:15477`; iCumRate +=6;} //1.863 필그림 의상(여성용)
				case(3){itemString = `id:18271`; iCumRate +=6;} //1.863 필그림 모자(여성용)
				case(4){itemString = `id:15476`; iCumRate +=6;} //1.863 필그림 의상(남성용)
				case(5){itemString = `id:18270`; iCumRate +=6;} //1.863 필그림 모자(남성용)
				case(6){itemString = `id:15481`; iCumRate +=2;} //0.621 필그림 의상(자이언트 여성용)
				case(7){itemString = `id:18283`; iCumRate +=2;} //0.621 필그림 모자(자이언트 여성용)
				case(8){itemString = `id:15480`; iCumRate +=2;} //0.621 필그림 의상(자이언트 남성용)
				case(9){itemString = `id:18282`; iCumRate +=2;} //0.621 필그림 모자(자이언트 남성용)
				case(10){itemString = `id:12283`; iCumRate +=5;} //3.106 푸른 개조석
				case(11){itemString = `id:12284`; iCumRate +=5;} //3.106 붉은 개조석
				case(12){itemString = `id:64042 size:3`; iCumRate +=4;} //3.106 토파즈
				case(13){itemString = `id:64043 size:3`; iCumRate +=4;} //3.106 스타 사파이어
				case(14){itemString = `id:64044 size:3`; iCumRate +=4;} //3.106 에메랄드
				case(15){itemString = `id:64045 size:3`; iCumRate +=4;} //3.106 아쿠아마린
				case(16){itemString = `id:64046 size:3`; iCumRate +=4;} //3.106 가넷
				case(17){itemString = `id:64047 size:3`; iCumRate +=4;} //3.106 재스퍼
				case(18){itemString = `id:64048 size:3`; iCumRate +=4;} //3.106 루비
				case(19){itemString = `id:64049 size:3`; iCumRate +=4;} //3.106 스피넬
				case(20){itemString = `id:64050 size:3`; iCumRate +=2;} //1.863 다이아몬드
				case(21){itemString = `id:51003 count:3`; iCumRate +=30;} //9.317 생명력 50 포션
				case(22){itemString = `id:51008 count:3`; iCumRate +=30;} //9.317 마나 50 포션
				case(23){itemString = `id:51013 count:3`; iCumRate +=30;} //9.317 스태미나 50 포션
				case(24){itemString = `id:51004`; iCumRate +=30;} //9.317 생명력 100 포션
				case(25){itemString = `id:51009`; iCumRate +=30;} //9.317 마나 100 포션
				case(26){itemString = `id:51014`; iCumRate +=30;} //9.317 스태미나 100 포션

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
