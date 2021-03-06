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

	if(player.GetCompletedQuestObjectiveCount(294002)==1)
	{
		player.AddKeyword(`g13_02`);
		player.RemoveKeyword(`g13_01`);

		// 지금 아본의 깃털 없으면 공급
		if(player.GetItemNoWithClassId(75462) == 0)
		{
			player.DoStript(`additemex(id:75462 rewardview:true)`);				//  아본의 깃털
		}
	}
}
