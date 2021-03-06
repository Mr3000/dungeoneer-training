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
		// 일반 보석 종류 중에 하나 골라서 1~7cm 준다.
		int gem_Size = Random(7)+1;
		int gem_ID = 64042 + Random(8);

		player.DoStript(`additemex(id:` + ToString(gem_ID) + ` size:` + ToString(gem_Size) + ` rewardview:true)`);

		int iRandom = Random(10000);

		if (iRandom < 10)
		{
			player.DoStript(`additemex(id:63517 rewardview:true)`);  // 0.1% 지하 수로의 비밀 실험 통행증 (하드)
		}
		else if (iRandom < 30)
		{
			player.DoStript(`additemex(id:63516 rewardview:true)`);  // 0.2% 지하 수로의 비밀 실험 통행증 (고급)
		}
		else if (iRandom < 70)
		{
			player.DoStript(`additemex(id:63515 rewardview:true)`);  // 0.4% 지하 수로의 비밀 실험 통행증 (중급)
		}
		else if (iRandom < 80)
		{
			player.DoStript(`additemex(id:63514rewardview:true)`);  // 0.1% 지하 수로의 레드 드래곤 (하드)
		}
		else if (iRandom < 100)
		{
			player.DoStript(`additemex(id:63513 rewardview:true)`);  // 0.2% 지하 수로의 레드 드래곤 (고급)
		}
		else if (iRandom < 140)
		{
			player.DoStript(`additemex(id:63512 rewardview:true)`);  // 0.4% 지하 수로의 레드 드래곤 (중급)
		}
		else if (iRandom < 150)
		{
			player.DoStript(`additemex(id:63511 rewardview:true)`);  // 0.1% 파르홀론의 수호신 (하드)
		}
		else if (iRandom < 170)
		{
			player.DoStript(`additemex(id:63510 rewardview:true)`);  // 0.2% 파르홀론의 수호신 (고급)
		}
		else if (iRandom < 210)
		{
			player.DoStript(`additemex(id:63509 rewardview:true)`);  // 0.4% 파르홀론의 수호신 (중급)
		}
		else if (iRandom < 510)
		{
			player.DoStript(`additemex(id:40025 col1:62003f39 col2:cfcfcf rewardview:true)`);  // 3% 빤짝이 곡괭이. 손잡이는 흰색
		}
		else if (iRandom < 530)
		{
			player.DoStript(`additemex(id:18657 rewardview:true)`);  // 0.2% 패션 고글 (수가/거가/염가/인챈트 불가)
		}
		else if (iRandom < 540)
		{
			player.DoStript(`additemex(id:19040 rewardview:true)`);  // 0.1% 슈팅스타 로브 (수가/거가/염가)			
		}
		else if (iRandom < 640)
		{
			player.DoStript(`additemex(id:19125 rewardview:true)`);  // 1% 데브캣 모자 (수가/거가/염불가)			
		}
		else if (iRandom < 740)
		{
			player.DoStript(`additemex(id:64050 size:5 rewardview:true)`);  // 1% 5cm 다이아몬드
		}
		else if (iRandom < 940)
		{
			player.DoStript(`additemex(id:64050 size:4 rewardview:true)`);  // 2% 4cm 다이아몬드
		}
		else if (iRandom < 1340)
		{
			gem_Size = Random(3) + 1;
			player.DoStript(`additemex(id:64050 size:`+ToString(gem_Size)+` rewardview:true)`);  // 4% 1~3cm 다이아몬드
		}
}
