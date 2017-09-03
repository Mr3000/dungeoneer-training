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
	// 포인트샵 가챠폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int itemID = cItem.GetClassId();
	int i=0;
	int iRandom = Random(2198);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:15175`; iCumRate += 2;}	//0.090991811	여성용 유카타
			case(1){itemString = `id:15176`; iCumRate += 5;}	//0.227479527	남성용 유카타
			case(2){itemString = `id:18129`; iCumRate += 5;}	//0.227479527	수박 모자
			case(3){itemString = `id:18130`; iCumRate += 5;}	//0.227479527	밀짚 모자
			case(4){itemString = `id:18131`; iCumRate += 5;}	//0.227479527	양모자
			case(5){itemString = `id:15063`; iCumRate += 50;}	//2.274795268	레이어드 프릴 원피스
			case(6){itemString = `id:15070`; iCumRate += 50;}	//2.274795268	스탠드칼라 슬리브리스
			case(7){itemString = `id:19014`; iCumRate += 50;}	//2.274795268	트루디 레인 로브
			case(8){itemString = `id:18158`; iCumRate += 50;}	//2.274795268	코주부 안경
			case(9){itemString = `id:40031 col1:101010 col2:101010 col3:101010`; iCumRate += 55;}	//2.502274795	검정색 석궁
			case(10){itemString = `id:40081 col1:800000 col2:ffffff`; iCumRate += 55;}	//2.502274795	붉은색 레더 롱 보우
			case(11){itemString = `id:40031 col1:eeeeee`; iCumRate += 55;}	//2.502274795	흰색 석궁
			case(12){itemString = `id:40014 col1:6633ff col2:6633ff col3:6633ff`; iCumRate += 55;}	//2.502274795	보라색 콤보짓 보우
			case(13){itemString = `id:40097 col1:000000`; iCumRate += 110;}	//5.004549591	검은색 L로드
			case(14){itemString = `id:40097 col1:800000`; iCumRate += 110;}	//5.004549591	붉은색 L로드
			case(15){itemString = `id:40097 col1:eeeeee`; iCumRate += 110;}	//5.004549591	흰색 L로드
			case(16){itemString = `id:16519`; iCumRate += 182;}	//8.280254777	초호화장갑
			case(17){itemString = `id:16503`; iCumRate += 182;}	//8.280254777	플루트 플레이트 건틀렛
			case(18){itemString = `id:15056`; iCumRate += 182;}	//8.280254777	레더 미니 원피스 링타입
			case(19){itemString = `id:18542`; iCumRate += 220;}	//10.00909918	빅 체인 풀 헬름
			case(20){itemString = `id:18543`; iCumRate += 220;}	//10.00909918	빅 슬릿 풀 헬름
			case(21){itemString = `id:18544`; iCumRate += 220;}	//10.00909918	빅 펠리칸 프로텍터
			case(22){itemString = `id:18547`; iCumRate += 220;}	//10.00909918	빅 파나쉬 헤드 프로텍터
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
