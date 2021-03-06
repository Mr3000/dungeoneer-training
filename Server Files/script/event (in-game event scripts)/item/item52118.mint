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
		int iRandom = Random(1000);	// 아이템이 나올 확률의 총합을 적는다
		int iRandom2 = 0;			// 보조 확률
		string desc;

		// 어떤 아이템을 줄 것인지 결정

		if (iRandom < 15)
		{
			iRandom2 = Random(3);
			switch(iRandom2)
			{
				case(0)
				{
					player.DoStript(`additemex(id:64050 size:3 rewardview:true)`);				// 다이아몬드 3
				}
				case(1)
				{
					player.DoStript(`additemex(id:64050 size:4 rewardview:true)`);				// 다이아몬드 4
				}
				case(2)
				{
					player.DoStript(`additemex(id:64050 size:5 rewardview:true)`);				// 다이아몬드 5
				}
				default
				{
					player.DoStript(`additemex(id:64050 size:3 rewardview:true)`);				// 다이아몬드 3
				}
			}
		}
		else if(iRandom < 860)
		{
			player.DoStript(`additemex(id:51004 count:10 rewardview:true)`);						// 생명력 100 포션 10개
			player.DoStript(`additemex(id:45106 count:3 rewardview:true)`);						// 롱 자벨린 (저스팅) 3개
		}
		else if(iRandom < 910)
		{
			player.DoStript(`additemex(id:63024 rewardview:true)`);							// 염색 앰플 1개
		}
		else if(iRandom < 960)
		{
			player.DoStript(`additemex(id:63069 rewardview:true)`);							// 금속 염색 앰플 1개
		}
		else if(iRandom < 965)
		{
			player.DoStript(`additemex(id:18159 suffix:30501 rewardview:true)`);					// 자이언트 뿔테 안경
		}
		else if(iRandom < 970)
		{
			player.DoStript(`additemex(id:40240 col1:505050 col2:151515 rewardview:true)`);			// 아이언 메이스 *2 (지정색)
			player.DoStript(`additemex(id:40240 col1:505050 col2:151515 rewardview:true)`);			// 아이언 메이스 *2 (지정색)
		}
		else if(iRandom < 974)
		{
			player.DoStript(`additemex(id:18198 rewardview:true)`);							// 모노클
		}
		else if(iRandom < 977)
		{
			player.DoStript(`additemex(id:40244 prefix:20728 rewardview:true)`);					// 고귀한 베어 너클
		}
		else if(iRandom < 980)
		{
			player.DoStript(`additemex(id:46020 prefix:20505 rewardview:true)`);					// 리자드 발레스 실드
		}
		else if(iRandom < 983)
		{
			player.DoStript(`additemex(id:14044 col1:101010 col2:303030 col3:101010 rewardview:true)`);// 비토 크럭스 세트 (지정색)
			player.DoStript(`additemex(id:16536 col1:101010 col2:303030 rewardview:true)`);			// 비토 크럭스 세트 (지정색)
			player.DoStript(`additemex(id:17526 col1:101010 col2:a0a0a0 rewardview:true)`);			// 비토 크럭스 세트 (지정색)
		}
		else if(iRandom < 986)
		{
			iRandom2 = Random(2);

			if(iRandom2 < 1)
			{
				player.DoStript(`additemex(id:19037 col1:303030 col2:eeeeee col3:303030 rewardview:true)`);		// 자이언트 늑대 로브 (지정색)
			}
			else
			{
				player.DoStript(`additemex(id:19037 col1:f0f0f0 col2:101010 col3:eeeeee rewardview:true)`);		// 자이언트 늑대 로브 (지정색)
			}
		}
		else if(iRandom < 989)
		{
			player.DoStript(`additemex(id:15381 rewardview:true)`);							// 댄디 고딕 케이프 수트
		}
		else if(iRandom < 992)
		{
			player.DoStript(`additemex(id:40176 prefix:9 rewardview:true)`);						// 라이온헌터 배틀 해머
		}
		else if(iRandom < 994)
		{
			player.DoStript(`additemex(id:40178 prefix:20626 rewardview:true)`);					// 든든한 브로드 액스
		}
		else if(iRandom < 996)
		{
			player.DoStript(`additemex(id:40300 suffix:30921 rewardview:true)`);					// 악어 레미니아 성월의 검
		}
		else if(iRandom < 998)
		{
			player.DoStript(`additemex(id:15430 rewardview:true)`);							// 큐트 프린세스 드레스
		}
		else
		{
			player.DoStript(`additemex(id:15432 rewardview:true)`);							// 플라워 이브닝 드레스
		}
}
