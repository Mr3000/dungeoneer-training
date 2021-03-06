////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             던바튼 : 마스던전 바드변신 스크립트
//
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                     hanstone@nexon.co.kr, edits at 2004. 12. 15
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnHellHoundCleared(
	dungeon _dungeon)
// : 헬하운드가 클리어되었다
////////////////////////////////////////////////////////////////////////////////
{
	object_list	cCharList = _dungeon.GetPlayerList();
	character	leader;
	int		i;

	//인원이 맞지 않으면 각각 쫓아내고, 종료컷신을 틀어준다.
	leader = (character)cCharList.GetValue(0);
	leader.PlayCutScene(`bossroom_Math_BardSkeleton_change`, 500, cCharList);
	//이렇게 리더에게만 틀어줘도 파티원들 모두가 컷신을 볼 수 있음.
}
////////////////////////////////////////////////////////////////////////////////
server void MetalBardAlloc(
	character me,
	object_list _cMemberList
	)
// : 메탈 바드를 생성한다 
////////////////////////////////////////////////////////////////////////////////
{ 
	puzzle _this;

	//컷신이 이 함수를 불러 저 멀리 별나라에서 던전을 다시 찾아온다
	// GetFloorNo()는 n 층이면 n을 리턴하지만 GetFloor()은 0~(n-1)을 받으므로 주의
	_this = me.GetCurrentDungeon().GetFloor(me.GetCurrentDungeon().GetFloorNo() - 1).GetBossPuzzle();
	
	_this.AllocateMonster(
	0, 
	`boss`,
	`center`,                           // 배치 템플릿 이름 
	`single(MetalBardSkeleton:2)`);
	//진보스 메탈바드스켈레톤을 출현시킨다

}