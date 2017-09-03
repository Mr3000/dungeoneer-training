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
	// 패션 가챠폰(리뉴얼)
	int itemID = cItem.GetClassId();
	if(GetLocale().LowerCase()== `china`)
	{
		// 중국의 경우
		// 중국 생활 가차폰은 캐시가차폰과 생활 가차폰을 동시에 준다.

		// 캐시 가차폰
		{
			string itemString;

//			itemString = `id:91032`;
			itemString = `id:91186`;	//번들로 교체

			DebugOut(`유저에게 `+itemString+` 를 줌`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
		}

		// 패션 가차폰
		{
			string itemString;

//			itemString = `id:91022`;
			itemString = `id:91187`;	//번들로 교체

			DebugOut(`유저에게 `+itemString+` 를 줌`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
		}
	}
}
