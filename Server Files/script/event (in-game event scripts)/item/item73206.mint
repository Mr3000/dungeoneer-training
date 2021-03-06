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
		int iRandom = Random(9000);	//확률의 총합을 적는다

		// 일반 보석 종류별로 1~7cm 준다.
		int j;
		for (j = 0; j < 8; j++)
		{
			int gem_Size= Random(7)+1;	// 보석사이즈. 1~7
			int gem_ID = 64042 + j;			// 보석 아이템 ID, 64042~64049
			player.DoStript(`additemex(id:` + ToString(gem_ID) + ` size:` + ToString(gem_Size) + ` rewardview:true)`);
		}

		player.DoStript(`additemex(id:63075 rewardview:true)`);		// 데브캣 불꽃놀이 키트

		if (iRandom < 10)
		{
			player.DoStript(`additemex(id:19013 rewardview:true)`);  // 0.33% 확률로 야광 머플로 로브 (수가)
		}
		else if (iRandom < 20)
		{
			player.DoStript(`additemex(id:53030 rewardview:true)`);  // 0.33% 확률로 사막드래곤의 눈
		}
		else if (iRandom < 60)
		{
			player.DoStript(`additemex(id:19005 rewardview:true)`);  // 1.33% 확률로 머플러 로브
		}
		else if (iRandom < 260)
		{
			player.DoStript(`additemex(id:40025 col1:62003f39 col2:cfcfcf rewardview:true)`);  // 6.67% 확률로 빤짝이 곡괭이. 손잡이는 흰색
		}
		else if (iRandom < 560)
		{
			player.DoStript(`additemex(id:18277 rewardview:true)`);  // 10% 확률로 수리 가능 데브캣 귀마개
		}
		else if (iRandom < 1060)
		{
			player.DoStript(`additemex(id:64050 size:2 rewardview:true)`);  // 16.67% 확률로 2cm 다이아몬드
		}
		else if (iRandom < 1360)
		{
			player.DoStript(`additemex(id:64050 size:3 rewardview:true)`);  // 10% 확률로 3cm 다이아몬드
		}
		else if (iRandom < 1460)
		{
			player.DoStript(`additemex(id:64050 size:4 rewardview:true)`);  // 3.3% 확률로 4cm 다이아몬드
		}
}
