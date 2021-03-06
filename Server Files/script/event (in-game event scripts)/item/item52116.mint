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
		int iRandom = Random(245470);	//확률의 총합을 적는다



		if (iRandom <10)
		{
			player.DoStript(`additemex(id:18235 rewardview:true)`);  // 아이리스 나이트 캡 0.004%
			 player.ShowCaption(["event.item.item52116.1"]);
		}
		else if (iRandom < 20)
		{
			player.DoStript(`additemex(id:15361 rewardview:true)`);  // 박쥐 드레스 0.004%
			player.ShowCaption(["event.item.item52116.2"]);
		}
		else if (iRandom < 170)
		{
			player.DoStript(`additemex(id:1208 rewardview:true)`);  // 나의 누베스식 명상법 0.123%
			player.ShowCaption(["event.item.item52116.3"]);
		}

		else if (iRandom < 470)
		{
			player.DoStript(`additemex(id:1209 rewardview:true)`);  // 메이즈 평원의 거대 문양 0.230%
			player.ShowCaption(["event.item.item52116.4"]);
		}

		else if (iRandom < 770)
		{
			player.DoStript(`additemex(id:64591 suffix:40081 rewardview:true)`);  // 스파크 1페이지 0.230%
			player.ShowCaption(["event.item.item52116.5"]);
		}
		else if (iRandom < 1070)
		{
			player.DoStript(`additemex(id:1206 rewardview:true)`);  // 휴식을 위한 시간 0.345%
			player.ShowCaption(["event.item.item52116.6"]);
		}
		else if (iRandom < 1470)
		{
			player.DoStript(`additemex(id:55068 rewardview:true)`);  // 빛나는 스톤 가고일의 석상 0.384%
			player.ShowCaption(["event.item.item52116.7"]);
		}
		else if (iRandom < 2470)
		{
			player.DoStript(`additemex(id:60054 rewardview:true)`);  // 나무판 0.767%
			player.ShowCaption(["event.item.item52116.8"]);

		}
		else if (iRandom < 3470)
		{
			player.DoStript(`additemex(id:60026 rewardview:true)`);  // 최고급 가죽 1.036%
			player.ShowCaption(["event.item.item52116.9"]);
		}

		else if (iRandom < 4970)
		{
			player.DoStript(`additemex(id:60006 count:5 rewardview:true)`);  // 굵은 실뭉치 5개 1.151%
			player.ShowCaption(["event.item.item52116.10"]);
		}


		else if (iRandom < 9970)
		{
			player.DoStript(`additemex(id:51102 count:10 rewardview:true)`);  // 마나 허브 10개 2.494%
			player.ShowCaption(["event.item.item52116.11"]);
		}
		else if (iRandom < 14970)
		{
			player.DoStript(`additemex(id:64513 rewardview:true)`);  // 썬더의 책 3챕터 '썬더 사용의 실제' 2.494%
			player.ShowCaption(["event.item.item52116.12"]);
		}

		else if (iRandom < 19970)
		{
			player.DoStript(`additemex(id:65045 count:5 rewardview:true)`);  //  구름의 결정 5개 2.494%
			player.ShowCaption(["event.item.item52116.13"]);
		}


		else if (iRandom < 25970)
		{
			player.DoStript(`additemex(id:60025 rewardview:true)`);  // 고급 가죽 2.878%
			player.ShowCaption(["event.item.item52116.14"]);
		}
		else if (iRandom < 31970)
		{
			player.DoStript(`additemex(id:63220 rewardview:true)`);  // 고급 나무 장작 2.878%
			player.ShowCaption(["event.item.item52116.15"]);
		}

		else if (iRandom < 37970)
		{
			player.DoStript(`additemex(id:51008 count:10 rewardview:true)`);  // 마나 50 포션 10개 2.878%
			player.ShowCaption(["event.item.item52116.16"]);
		}


		else if (iRandom < 47970)
		{
			player.DoStript(`additemex(id:51102 count:5 rewardview:true)`);  // 마나 허브 5개 3.837%
			player.ShowCaption(["event.item.item52116.17"]);
		}


		else if (iRandom < 57970)
		{
			player.DoStript(`additemex(id:64038 count:5 rewardview:true)`);  // 은광석 조각 5개 3.837%
			player.ShowCaption(["event.item.item52116.18"]);
		}
		else if (iRandom < 67970)
		{
			player.DoStript(`additemex(id:64039 count:5 rewardview:true)`);  // 금광석 조각 5개 3.837%
			player.ShowCaption(["event.item.item52116.19"]);
		}

		else if (iRandom < 77970)
		{
			player.DoStript(`additemex(id:51101 count:10 rewardview:true)`);  // 블러디 허브 10개  3.837%
			player.ShowCaption(["event.item.item52116.20"]);
		}


		else if (iRandom < 97970)
		{
			player.DoStript(`additemex(id:51103 count:10 rewardview:true)`);  // 선라이트 허브 10개 7.673%
			player.ShowCaption(["event.item.item52116.21"]);
		}
		else if (iRandom < 117970)
		{
			player.DoStript(`additemex(id:60027 count:10 rewardview:true)`);  // 저가형 가죽끈 10개 7.673%
			player.ShowCaption(["event.item.item52116.22"]);
		}


		else if (iRandom < 137970)
		{
			player.DoStript(`additemex(id:65045 count:2 rewardview:true)`);  //  구름의 결정 2개 7.673%
			player.ShowCaption(["event.item.item52116.23"]);
		}


		else if (iRandom < 172970)
		{
			player.DoStript(`additemex(id:51103 count:5 rewardview:true)`);  // 선라이트 허브 5개 13.428%
			player.ShowCaption(["event.item.item52116.24"]);
		}
		else if (iRandom < 207970)
		{
			player.DoStript(`additemex(id:51101 count:5 rewardview:true)`);  //블러디허브 5개 13.428%
			player.ShowCaption(["event.item.item52116.25"]);
		}


		else
		{

			player.DoStript(`additemex(id:63016 rewardview:true)`);		// 축복의 포션 1개 14.388%
			player.ShowCaption(["event.item.item52116.26"]);
		}




}
