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
		int itemID = cItem.GetClassId();
		string charName = player.GetDisplayName();
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(411);	//확률의 총합을 적는다
		string DefItemString;
		int appraise_explore_exp;
		int appraise_gold;

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:40379`; iCumRate +=2;} //0.694444444@트리니티 스태프
				case(1){itemString = `id:40377`; iCumRate +=1;} //0.231481481@글로리 소드
				case(2){itemString = `id:40378`; iCumRate +=1;} //0.231481481@드래곤 투스
				case(3){itemString = `id:40380`; iCumRate +=1;} //0.231481481@볼케이노 실린더
				case(4){itemString = `id:40381`; iCumRate +=1;} //0.231481481@어스퀘이크 실린더
				case(5){itemString = `id:40382`; iCumRate +=1;} //0.231481481@허리케인 실린더
				case(6){itemString = `id:40383`; iCumRate +=1;} //0.231481481@타이달웨이브 실린더
				case(7){itemString = `id:13164`; iCumRate +=1;} //0.231481481버넘 플레이트 아머
				case(8){itemString = `id:16631`; iCumRate +=1;} //0.231481481버넘 플레이트 건틀렛
				case(9){itemString = `id:17623`; iCumRate +=1;} //0.231481481버넘 플레이트 부츠
				case(10){itemString = `id:18660`; iCumRate +=1;} //0.231481481버넘 플레이트 헬멧
				case(11){itemString = `id:16142`; iCumRate +=1;} //0.231481481헤보나 장갑
				case(12){itemString = `id:17238`; iCumRate +=1;} //0.231481481헤보나 슈즈
				case(13){itemString = `id:18317`; iCumRate +=1;} //0.231481481헤보나 서클릿
				case(14){itemString = `id:19126`; iCumRate +=1;} //0.231481481헤보나 로브
				case(15){itemString = `id:15614`; iCumRate +=1;} //0.231481481크레시다 웨어
				case(16){itemString = `id:16145`; iCumRate +=1;} //0.231481481크레시다 글러브
				case(17){itemString = `id:17240`; iCumRate +=1;} //0.231481481크레시다 슈즈
				case(18){itemString = `id:15490`; iCumRate +=1;} //0.231481481페이트런 웨어
				case(19){itemString = `id:16150`; iCumRate +=1;} //0.231481481페이트런 장갑
				case(20){itemString = `id:17244`; iCumRate +=1;} //0.231481481페이트런 슈즈
				case(21){itemString = `id:18330`; iCumRate +=1;} //0.231481481페이트런 모자
				case(22){itemString = `id:15489`; iCumRate +=1;} //0.231481481트리니티 웨어 (남성용)
				case(23){itemString = `id:15495`; iCumRate +=1;} //0.231481481트리니티 웨어 (여성용)
				case(24){itemString = `id:18327`; iCumRate +=1;} //0.231481481트리니티 서클릿
				case(25){itemString = `id:17241`; iCumRate +=1;} //0.231481481트리니티 슈즈
				case(26){itemString = `id:16147`; iCumRate +=1;} //0.231481481트리니티 장갑
				case(27){itemString = `id:15492`; iCumRate +=1;} //0.231481481아도니스 웨어 (남성용)
				case(28){itemString = `id:15496`; iCumRate +=1;} //0.231481481아도니스 웨어 (여성용)
				case(29){itemString = `id:18328`; iCumRate +=1;} //0.231481481아도니스 모자 (남성용)
				case(30){itemString = `id:18332`; iCumRate +=1;} //0.231481481아도니스 모자 (여성용)
				case(31){itemString = `id:17242`; iCumRate +=1;} //0.231481481아도니스 슈즈 (남성용)
				case(32){itemString = `id:17247`; iCumRate +=1;} //0.231481481아도니스 슈즈 (여성용)
				case(33){itemString = `id:16148`; iCumRate +=1;} //0.231481481아도니스 브레이슬렛 (여성용)
				case(34){itemString = `id:18279`; iCumRate +=4;} //0.925925926목도리
				case(35){itemString = `id:18278`; iCumRate +=4;} //0.925925926아얌
				case(36){itemString = `id:15277`; iCumRate +=8;} //1.851851852여성용 한복
				case(37){itemString = `id:15276`; iCumRate +=8;} //1.851851852남성용 한복
				case(38){itemString = `id:15279`; iCumRate +=4;} //0.925925926여자 자이언트용 한복
				case(39){itemString = `id:15278`; iCumRate +=4;} //0.925925926남자 자이언트용 한복
				case(40){itemString = `id:17106`; iCumRate +=8;} //1.851851852남성용 한복 신발
				case(41){itemString = `id:17107`; iCumRate +=8;} //1.851851852여성용 한복 신발
				case(42){itemString = `id:17109`; iCumRate +=4;} //0.925925926여자 자이언트용 한복 신발
				case(43){itemString = `id:17108`; iCumRate +=4;} //0.925925926남자 자이언트용 한복 신발
				case(44){itemString = `id:12283`; iCumRate +=10;} //4.62962963푸른 개조석
				case(45){itemString = `id:12284`; iCumRate +=10;} //4.62962963붉은 개조석
				case(46){itemString = `id:51003 count:3`; iCumRate +=50;} //11.57407407생명력 50 포션
				case(47){itemString = `id:51008 count:3`; iCumRate +=50;} //11.57407407마나 50 포션
				case(48){itemString = `id:51013 count:3`; iCumRate +=50;} //11.57407407스태미나 50 포션
				case(49){itemString = `id:51004 count:2`; iCumRate +=50;} //11.57407407생명력 100 포션
				case(50){itemString = `id:51009 count:2`; iCumRate +=50;} //11.57407407마나 100 포션
				case(51){itemString = `id:51014 count:2`; iCumRate +=50;} //11.57407407스태미나 100 포션


				// 여기다 넣으세요의 끝

				default
				{
					itemString = `id:65040`; iCumRate +=1000;
					bBreak = true;
				}
			}
			if (bBreak)
			{
				break;
			}

			if (iRandom < iCumRate)
			{
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				item newItem;
				string ItemName;
//				player.DoStript(`additemex(`+itemString+` rewardview:true)`);

				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);

			//	newItem = player.AddItemEx(itemString, true);

				return;
			}
			++i;
		}
}
