//////////////////////////////////////////////////////////////////////////////////
//                                           Mabinogi Project Event Post Processor
//                                                                 이벤트 후처리기
//                      : 이벤트가 끝난 뒤에 후처리할 것이 있으면 여기서 호출된다.
//
//                                          dochigun fecit, begins at 2010. 11. 04
//                                                            dochigun@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnPostProcessFullmetalAlchemist2010(
	character me, item postProcessorItem)
// : [일본] 강철의 연금술사 숨겨진 타이틀 획득 이벤트 후처리기
//////////////////////////////////////////////////////////////////////////////////
{
	word wTitleId = 0;
	postProcessorItem.GetData(`TT_ID`, wTitleId);

	if (wTitleId > 0)
	{
		// 획득하지 못한 타이틀을 제거하고 후처리기를 삭제한다.
		if (!me.IsSelectableTitle((dword)wTitleId))
		{
			me.RemoveTitle((dword)wTitleId);
		}
		me.DestroyItem(postProcessorItem);
	}
}