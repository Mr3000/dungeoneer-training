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
		int iRandom = Random(1000);	//확률의 총합을 적는다



		if (iRandom <300)
		{
			player.DoStript(`additemex(id:14023 prefix:21108 rewardview:true)`);  // 근본의 본 마린 아머 0.0011%

		}


		else if (iRandom <600)
		{
			player.DoStript(`additemex(id:18018 prefix:20635 rewardview:true)`);  // 둥근 가죽꼬리 모자 0.0011%

		}

		else if (iRandom <750)
		{
			player.DoStript(`additemex(id:62005 prefix:20835 rewardview:true)`);  // 앰플 인챈트 스크롤 0.0005%

		}

		else if (iRandom <890)
		{
			player.DoStript(`additemex(id:15362 prefix:20206 suffix:30601 rewardview:true)`);  // 불안한 도둑 테라 고딕 펑크 수트 0.0005%

		}

		else if (iRandom <990)
		{
			player.DoStript(`additemex(id:15316 prefix:20621 suffix:30502 rewardview:true)`);  // 겁없는 위습 카리스 슈트 0.0003%

		}


		else
		{

			player.DoStript(`additemex(id:15552 rewardview:true)`);		//에이프런 드레스 숏타입     1/100622

		}




}
