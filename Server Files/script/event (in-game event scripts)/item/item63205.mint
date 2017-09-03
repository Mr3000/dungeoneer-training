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
	// 분신 퀘스트 관련 키워드
	if (IsEnable(`featureBunshin`) extern (`data/script/features.mint`)) //분신 키워드 삽입
	{
		// 사념파
		//player.ShowCaption(`영혼 soul`);

		if(player.GetCompletedQuestObjectiveCount(20117)==1 && !player.HaveKeyword(`use_soulstone`))
		{
			player.AddKeyword(`use_soulstone`);
		}
	}
}
