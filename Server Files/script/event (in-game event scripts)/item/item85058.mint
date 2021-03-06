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
	int jRandom = Random(4);		//유물 확률의 총합을 적는다
	int kRandom = Random(10);	//염색 앰플 확률의 총합을 적는다
	string DefItemString;
	int appraise_explore_exp;
	int appraise_gold;


	// 역대 가챠폰 중 하나를 제공
	switch(jRandom)
	{
		case(0)	{	DefItemString = `id:85039`;	}		// 던바튼 관청 일지
		case(1)	{	DefItemString = `id:85046`;	}		// 낡은 유적 지도
		case(2)	{	DefItemString = `id:85052`;	}		// 아이바의 합성 키트
		default	{	DefItemString = `id:85053`;	}		// 시몬의 럭셔리 신상품 상자
	}

	// DebugOut(`유저에게 `+DefItemString+` 를 줌`);
	player.DoStript(`additemex(`+DefItemString+` rewardview:true)`);

}
