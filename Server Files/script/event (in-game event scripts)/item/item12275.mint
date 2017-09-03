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
		int iRandom = Random(1310);	//확률의 총합을 적는다



		if (iRandom <20)
		{
			player.DoStript(`additemex(id:17074 rewardview:true)`);  // 덕 부츠 0.002%

		}



		else if (iRandom <420)
		{
			player.DoStript(`additemex(id:15141 rewardview:true)`);  // 이너 로브 0.053%

		}


		else if (iRandom <820)
		{
			player.DoStript(`additemex(id:15041 rewardview:true)`);  // 사무직 여성용 수트 0.053%

		}


		else if (iRandom <1220)
		{
			player.DoStript(`additemex(id:15033 rewardview:true)`);  // 몬거 여행자 옷 0.053%

		}



		else if (iRandom <1240)
		{
			player.DoStript(`additemex(id:15096 rewardview:true)`);  // 셀리나 섹시 베어룩 0.004%

		}


		else if (iRandom <1270)
		{
			player.DoStript(`additemex(id:17152 rewardview:true)`);  // 고딕 라이딩 슈즈 0.004%

		}


		else if (iRandom <1300)
		{
			player.DoStript(`additemex(id:40241 rewardview:true)`);  // 더스틴 실버 나이트 소드 0.004%

		}


		else
		{

			player.DoStript(`additemex(id:15113 rewardview:true)`);		// 여성용 검사학교 교복 숏타입 0.0013%

		}




}
