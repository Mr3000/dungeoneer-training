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
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(6061);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:18156 `; iCumRate += 1;} //0.026659557고글모
			case(1){itemString = `id:15055 `; iCumRate += 80;} //2.665955745레더 미니 원피스
			case(2){itemString = `id:46006 `; iCumRate += 80;} //2.665955745카이트 실드
			case(3){itemString = `id:15053 `; iCumRate += 80;} //2.665955745플랫칼라 원피스
			case(4){itemString = `id:17045 `; iCumRate += 80;} //2.665955745브이 넥 라인 레더 부츠
			case(5){itemString = `id:17040 `; iCumRate += 80;} //2.665955745엘라 스트랩 부츠
			case(6){itemString = `id:15029 `; iCumRate += 50;} //2.665955745토크 대장장이옷
			case(7){itemString = `id:15151 `; iCumRate += 80;} //2.665955745뉴욕마리오 웨이스트 테일러 웨어（남성용）
			case(8){itemString = `id:15152 `; iCumRate += 80;} //2.665955745뉴욕마리오 웨이스트 테일러 웨어（여성용）
			case(9){itemString = `id:15045 `; iCumRate += 400;} //2.665955745레이스 플래킷 예복
			case(10){itemString = `id:15026 `; iCumRate += 400;} //2.665955745리리나 롱스커트
			case(11){itemString = `id:15016 `; iCumRate += 400;} //2.665955745의장용 스타킹 유니폼
			case(12){itemString = `id:15051 `; iCumRate += 400;} //2.665955745타이트 벨트 웨어
			case(13){itemString = `id:18011 `; iCumRate += 400;} //5.33191149몬거 제스터 캡
			case(14){itemString = `id:18009 `; iCumRate += 300;} //5.33191149몬거 아쳐 캡
			case(15){itemString = `id:18014 `; iCumRate += 300;} //5.33191149몬거 모자
			case(16){itemString = `id:18000 `; iCumRate += 300;} //5.33191149토크 모자
			case(17){itemString = `id:16013 `; iCumRate += 400;} //5.33191149검사 장갑
			case(18){itemString = `id:16032 `; iCumRate += 200;} //5.33191149엘빈 글러브
			case(19){itemString = `id:51014 count:5`; iCumRate += 800;} //11.99680085스태미나 100 포션 5개
			case(20){itemString = `id:51004 count:5`; iCumRate += 700;} //11.99680085생명력 100포션 5개
			case(21){itemString = `id:51009 count:5`; iCumRate += 450;} //11.99680085마나 100포션 5개		
			// 여기다 넣으세요의 끝
			default
			{
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
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
