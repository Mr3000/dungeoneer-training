////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                                             티르나노이:바울던전 최종보스
//                                     eias erinys fecit, begins at 2003. 10. 08
//                                        eias@nexon.co.kr, sheplany@nownuri.net
//						HanStone@nexon.co.kr, edits at 2005. 06. 1
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 
// 방배치
//
//      방번호 0 : 이 트랩이 설치된 방을 의미한다
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
	`ruari`,
        `real_center33`,                           // 배치 템플릿 이름 
        `single(g3_ruari:1)`);

   _this.AllocateMonster(
        0, 
	`morgant`,
        `real_center33`,                           // 배치 템플릿 이름 
        `single(DarkLord:1)`);

	_this.Set(`bossmonstername`,`ruari`);
    // 드래곤 배치
	puzzle_prop Dragon = New(_this, 0, `real_center33@*`, `dragonprop`)
        extern (`data/script/puzzle/prop/g3_dragon.mint`);


}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	dungeon currentDungeon = _this.GetDungeon();

	if (_name == `ruari`.LowerCase() && _remain == 0)
	//루에리가 사라지면
	{
		_this.Set(`bossmonstername`,`dragon`);	
		//보스 이름을 드래곤으로 바꾼다

		DebugOut(`루에리가 사라졌다. 올스타 컷신을 틀자.`);

		object_list cMemberList = _this.GetDungeon().GetCreatorList();
		character cLeader=(character)cMemberList.GetValue(0);
		DebugOut(`루에리가 사라졌을때 컷신을 보여줄 리더의 이름:`+cLeader.GetGeneralName());
		cMemberList.RemoveValue(0);
		
		cLeader.RemoveKeyword(`g3_17`);
		cLeader.AddKeyword(`g3_18`);
		//진행도 키워드 정리

		DebugOut(`올스타 컷신에 인자를 넘겨줄 준비`);
		meta_map cutscene_param;
		cutscene_param.Set(`puzzle_name`,_this.GetFullName());
	
		DebugOut(`올스타 컷신을 튼다`);
		cLeader.PlayCutScene(`g3_17_b_AllStarShow`,0,cMemberList,cutscene_param);

		puzzle_prop Dragon = _this.FindProp(`dragonprop`);
		Dragon.ChangeState(
			`seal`,
			currentDungeon.GetPlayerLeader());  // 던전 생성자가 건드린 셈 친다
	}
	if (_name == `dragon`.LowerCase() && _remain == 0) //용가리를 해치웠으면
	{
		DebugOut(`크로우 크로아흐를 쓰러뜨렸다. 대망의 엔딩`);
		_this.Complete();
	}
}