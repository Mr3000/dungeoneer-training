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
		int iRandom = Random(100);	//확률의 총합을 적는다

		// 기본으로 주는 것들
		player.DoStript(`additemex(id:85044 count:5 rewardview:true)`);		// 행운의 머핀 5개
		player.DoStript(`additemex(id:52048 rewardview:true)`);		// 네잎 클로버
		player.DoStript(`additemex(id:63075 rewardview:true)`);		// 데브캣 불꽃놀이 키트

		if (iRandom < 8)
		{
			player.DoStript(`additemex(id:18276 rewardview:true)`);  // 샤이닝 스타  8%
		}
		else if (iRandom < 18)
		{
			player.DoStript(`additemex(id:19007 rewardview:true)`);  // 야광로브 - 수리불가  10%
		}
		else if (iRandom < 30)
		{
			player.DoStript(`additemex(id:15115 rewardview:true)`);  // 재기드 미니 스커트	12%
		}
		else if (iRandom < 40)
		{
			player.DoStript(`additemex(id:19053 rewardview:true)`);  // 양로브	10%
		}
		else if (iRandom < 50)
		{
			player.DoStript(`additemex(id:19057 rewardview:true)`);  // 젖소로브	 10%
		}
		else if (iRandom < 62)
		{
			player.DoStript(`additemex(id:15356 rewardview:true)`);  // 파이릿 크루 유니폼	12%
		}
		else if (iRandom < 70)
		{
			player.DoStript(`additemex(id:17128 rewardview:true)`);  // 카리스 위자드 슈즈	8%
		}
		else if (iRandom < 80)
		{
			player.DoStript(`additemex(id:18178 rewardview:true)`);  // 데브캣 귀마개 - 거래불가 10%
		}
		else if (iRandom < 88)
		{
			player.DoStript(`additemex(id:18199 rewardview:true)`);  // 얇은 테 안경	8%
		}
		else
		{
			player.DoStript(`additemex(id:18216 rewardview:true)`);  // 빈티지 볼륨 베레모	12%
		}

}
