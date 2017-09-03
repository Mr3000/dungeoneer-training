//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
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
		int iRandom = Random(120);	//확률의 총합을 적는다



		if (iRandom <20)
		{
			player.DoStript(`additemex(id:62005 prefix:20733 rewardview:true)`);  //빛나는 인챈트 스크롤 0.003%
		}


		else if (iRandom <40)
		{
			player.DoStript(`additemex(id:62005 prefix:207 rewardview:true)`);  // 폭스 인챈트 스크롤 0.003%
		}


		else if (iRandom <60)
		{
			player.DoStript(`additemex(id:62005 prefix:20621 rewardview:true)`);  // 겁없는 인챈트 스크롤 0.003%
		}

		else if (iRandom <80)
		{
			player.DoStript(`additemex(id:62005 prefix:21411 rewardview:true)`);  // 리치  인챈트 스크롤 0.003%
		}

		else if (iRandom <100)
		{
			player.DoStript(`additemex(id:62005 suffix:21411 rewardview:true)`);  // 암흑  인챈트 스크롤 0.003%
		}

		else
		{

			player.DoStript(`additemex(id:62005 suffix:21409 rewardview:true)`);  // 검붉은곰 인챈트 스크롤 0.003%
		}




}
