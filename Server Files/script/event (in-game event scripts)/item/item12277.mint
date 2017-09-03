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
		int iRandom = Random(710);	//확률의 총합을 적는다



		if (iRandom <200)
		{
			player.DoStript(`additemex(id:15377 rewardview:true)`);  // 로맨틱 고딕 수트 0.004%

		}

		else if (iRandom <400)
		{
			player.DoStript(`additemex(id:15036 rewardview:true)`);  // 포포 작업용 바지 0.004%

		}


		else if (iRandom <600)
		{
			player.DoStript(`additemex(id:15374 rewardview:true)`);  // 샤이니 고딕 프릴 드레스 0.004%

		}


		else if (iRandom <650)
		{
			player.DoStript(`additemex(id:15558 rewardview:true)`);  // 신규 코스튬 여자 옷 0.0012%

		}

		else if (iRandom <700)
		{
			player.DoStript(`additemex(id:15559 rewardview:true)`);  // 신규 코스튬 남자 옷 0.0012%

		}


		else
		{

			player.DoStript(`additemex(id:19013 rewardview:true)`);		// 야광 머플러 로브 0.0002%

		}




}
