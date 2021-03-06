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
		int iRandom = Random(100);	//확률의 총합을 적는다



		if (iRandom <20)
		{
			player.DoStript(`additemex(id:62005 suffix:30601 rewardview:true)`);  // 도둑 인챈트 스크롤
		}
		else if (iRandom < 40)
		{
			player.DoStript(`additemex(id:62005 suffix:31103 rewardview:true)`);  // 스파이크 인챈트 스크롤
		}
		else if (iRandom < 60)
		{
			player.DoStript(`additemex(id:62005 prefix:20206 rewardview:true)`);  //  불안한 인챈트 스크롤
		}

		else if (iRandom < 80)
		{
			player.DoStript(`additemex(id:62005 suffix:30702 rewardview:true)`);  // 레이븐 인챈트 스크롤
		}

		else if (iRandom < 80)
		{
			player.DoStript(`additemex(id:62005 suffix:30822 rewardview:true)`);  // 회복의 인챈트 스크롤
		}


		else if (iRandom < 80)
		{
			player.DoStript(`additemex(id:62005 prefix:201 rewardview:true)`);  // 햄스터 인챈트 스크롤
		}


		else
		{

			player.DoStript(`additemex(id:62005 suffix:31014 rewardview:true)`);		// 심해의 인챈트 스크롤
		}




}
