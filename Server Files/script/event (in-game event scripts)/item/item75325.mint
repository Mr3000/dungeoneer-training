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
	// 엘라하의 오르골
	player.PlayCutScene(`C3G10_S#5_0_elatha`);
	if (player.FindShadowMission() == 0 && player.GetCompletedQuestObjectiveCount(291002) == 1)
	{
		player.AddShadowMission(791003, true);		// 엘라하 만날 수 있는 그림자 미션
	}
	// 여기서 못 받았으면 안드라스에게 말을 걸어라.
	return;
}
