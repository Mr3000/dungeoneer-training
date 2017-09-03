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

		int iRandom = Random(1000000);


		if (iRandom <999990)
		{


			int gem_Size = Random(1)+1;
			int gem_ID = 64042 + Random(8);

			player.DoStript(`additemex(id:` + ToString(gem_ID) + ` size:` + ToString(gem_Size) + ` rewardview:true)`);


			gem_Size = Random(1)+1;
			gem_ID = 64042 + Random(8);

			player.DoStript(`additemex(id:` + ToString(gem_ID) + ` size:` + ToString(gem_Size) + ` rewardview:true)`);


		}

		else
		{

			player.DoStript(`additemex(id:18233 rewardview:true)`);  // 아이리스 헤드 드레스


		}





}