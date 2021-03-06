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
	// G13 퀘스트 진행
	if(player.GetCompletedQuestObjectiveCount(294201)==2 || player.GetCompletedQuestObjectiveCount(294201)==3)
	{
		player.DoStript(`additemex(id:75473 rewardview:false)`);				//  의문의 희곡 재발급
		player.RemoveKeyword(`g13_01_01`);
		player.AddKeyword(`g13_02_01`);
		player.PlayCutScene(`C4G13_prologue`); 
	}
}
