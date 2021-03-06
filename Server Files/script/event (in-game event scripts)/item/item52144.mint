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
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다
	string itemString =``;

	if (iRandom < 33)
	{
		itemString = `id:18202 count:1`;	//앵그리 호박 모자
	}
	else if (iRandom < 66)
	{
		itemString = `id:18203 count:1`;	//스마일 호박 모자
	}
	else
	{
		itemString = `id:18204 count:1`;	//위키드 호박 모자
	}

	DebugOut(`유저에게 `+itemString+` 를 줌`);
	player.DoStript(`additemex(`+itemString+` rewardview:true)`);
	return;

}
