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
		int iRandom = Random(10000);	//확률의 총합을 적는다


		if (iRandom < 300)		
		{
			player.DoStript(`additemex(id:15098 rewardview:true)`);  // 3% 여성 노멀 한복 (수리가능)
		}
		else if (iRandom < 600)
		{
			player.DoStript(`additemex(id:15100 rewardview:true)`);  // 3% 남성 노멀 한복 (수리가능)
		}
		else if (iRandom < 900)
		{
			player.DoStript(`additemex(id:15200 rewardview:true)`);  // 3% 남성 도련님 한복 (수리가능)
		}
		else if (iRandom < 1200)
		{
			player.DoStript(`additemex(id:15199 rewardview:true)`);  // 3% 여성 민무늬 한복 (수리가능)
		}
		else if (iRandom < 1500)
		{
			player.DoStript(`additemex(id:15277 rewardview:true)`);  // 3% 여성 고려식 한복 (수리가능)
		}
		else if (iRandom < 1800)
		{
			player.DoStript(`additemex(id:15276 rewardview:true)`);  // 3% 남성 고려식 한복 (수리가능)
		}
		else if (iRandom < 2100)
		{
			player.DoStript(`additemex(id:15279 rewardview:true)`);  // 3% 여성 자이언트 고려식 한복 (수리가능)
		}
		else if (iRandom < 2400)
		{
			player.DoStript(`additemex(id:15278 rewardview:true)`);  // 3% 남성 자이언트 고려식 한복 (수리가능)
		}
		else if (iRandom < 3000)
		{
			player.DoStript(`additemex(id:17106 rewardview:true)`);  // 6% 남성 신발 (수리가능)
		}
		else if (iRandom < 3600)
		{
			player.DoStript(`additemex(id:17107 rewardview:true)`);  // 6% 남성 신발 (수리가능)
		}
		else if (iRandom < 4200)
		{
			player.DoStript(`additemex(id:17109 rewardview:true)`);  // 6% 여성 자이언트 신발 (수리가능)
		}
		else if (iRandom < 4800)
		{
			player.DoStript(`additemex(id:17108 rewardview:true)`);  // 6% 남성 자이언트 신발 (수리가능)
		}
		else if (iRandom < 5100)
		{
			player.DoStript(`additemex(id:18279 rewardview:true)`);  // 3% 남성 목도리 (수리가능)
		}
		else if (iRandom < 5400)
		{
			player.DoStript(`additemex(id:18278 rewardview:true)`);  // 3% 여성 아얌 (수리가능)
		}
		else if (iRandom < 7000)
		{
			player.DoStript(`additemex(id:15104 rewardview:true)`);  // 16% 여성 한복 (수불)
		}
		else if (iRandom < 8600)
		{
			player.DoStript(`additemex(id:15105 rewardview:true)`);  // 16% 남성 한복 (수불)
		}
		else if (iRandom < 9300)
		{
			player.DoStript(`additemex(id:15273 rewardview:true)`);  // 7% 여성 자이언트 한복 (수불)
		}
		else
		{
			player.DoStript(`additemex(id:15272 rewardview:true)`);  // 7% 남성 자이언트 한복 (수불)
		}
}
