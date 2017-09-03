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


	player.DoStript(`additemex(id:51004 count:10 rewardview:true)`);	// 생명력 100	
	player.DoStript(`additemex(id:51009 count:10 rewardview:true)`);	// 마나 100
	player.DoStript(`additemex(id:51014 count:10 rewardview:true)`);	// 스태미나 100
	player.DoStript(`additemex(id:63016 count:10 rewardview:true)`);	// 축복의 포션
	player.DoStript(`additemex(id:63000 count:10 rewardview:true)`);	// 피닉스의 깃털
	player.DoStript(`additemex(id:60047 count:10 rewardview:true)`);	// 수제 붕대
	player.DoStript(`additemex(id:63076 count:1 rewardview:true)`);	// 아이스 폭죽

	int iRandom = Random(80);	//확률의 총합을 적는다

	if(GetLocale().LowerCase() == `japan`)
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// 보니타 트윈 리본		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// 샤이닝 스타	
			}
			case (2)
			{
				player.DoStript(`additemex(id:18199 rewardview:true)`);	// 얇은 테 안경		
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// 큰 테이블 스푼
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// 큰 테이블 포크
			}
			case (5)
			{
				player.DoStript(`additemex(id:40258 col1:61000f22 col2:61000f22 col3:61000f22 rewardview:true)`);	// 실린더
			}
			default
			{
			}
		}
	}
	if(GetLocale().LowerCase() == `usa`)
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// 보니타 트윈 리본		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// 샤이닝 스타	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40964 rewardview:true)`);	// 큰 테이블 나이프	
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// 큰 테이블 스푼
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// 큰 테이블 포크
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// 아이리스 헤드 드레스
			}
			default
			{
			}
		}
	}
	if((GetLocale().LowerCase() == `china`) || (GetLocale().LowerCase() == `taiwan`))
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// 보니타 트윈 리본		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18235 rewardview:true)`);	// 아이리스 나이트 캡	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40258 col1:61000f22 col2:61000f22 col3:61000f22 rewardview:true)`);	// 실린더
			}
			case (3)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// 샤이닝 스타		
			}
			case (4)
			{
				player.DoStript(`additemex(id:18188 rewardview:true)`);	// 안대
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// 아이리스 헤드드레스
			}
			default
			{
			}
		}
	}
	if((GetLocale().LowerCase() == `europe`))
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// 보니타 트윈 리본		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// 샤이닝 스타	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40964 rewardview:true)`);	// 큰 테이블 나이프	
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// 큰 테이블 스푼
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// 큰 테이블 포크
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// 아이리스 헤드 드레스
			}
			default
			{
			}
		}
	}
}
