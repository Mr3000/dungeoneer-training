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
server void GlewyasBook(character player)
// : 아이템에 아무 기능이 없으나
//  이상한 책의 정독에 성공했을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	player.DoStript(`additemex(id:75356 rewardview:true)`);
	player.AddKeyword(`g11_recipe`);

	if (player.FindShadowMission() == 0)
	{
		player.ShowCaption(["event.item.glewyas_book.1"]);
		player.ShowMessageView(["event.item.glewyas_book.2"]);
		player.AddShadowMission(792002, true);		// 부캐넌 만날 수 있는 진짜 장서관 미션 준다.
	}
	else
	{
		player.ShowCaption(["event.item.glewyas_book.3"]);
		player.ShowMessageView(["event.item.glewyas_book.4"]);
	}
}
