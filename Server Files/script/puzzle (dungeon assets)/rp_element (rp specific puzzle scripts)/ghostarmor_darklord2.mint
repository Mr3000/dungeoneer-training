////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                               던전 퍼즐 템플릿 : 입구퍼즐
//
//                                     eias erinys fecit, begins at 2003. 11. 06
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi
//
//							KeyChest_Monster.mint2와 유사한 퍼즐로
//				전투없이 보상이 없다. 모든 던전의 1층 첫 섹션에 넣는다.
//				몬스터 클라이언트가 다운되었을때는, 진행할 수 없도록 한다.
//
////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
    OnTemplatePrepare(
        puzzle_template _this,
        string _arg1,	//체인몹1번
        string _arg2,	//체인몹2번
        string _arg3)	//체인몹3번 또는 싱글몹. 열쇠포함.
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	DebugOut(["puzzle.rp_element.ghostarmor_darklord2.1"]);
	_this.DeclarePlace(`ThisPlace`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다

	puzzle Monster;

	Monster = _this.DeclareSubPuzzle(
		`Monster`,         // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/RP_element/GhostArmor_DarkLord2.mint`);

	// 몬스터 퍼즐
	Monster.AddPlaceToUse(`ThisPlace`);

}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleActivate(
	puzzle _this)
// : 활성화 요청을 받았다
////////////////////////////////////////////////////////////////////////////////
{

}

////////////////////////////////////////////////////////////////////////////////
server void
    OnTemplatePuzzleEvent(
        puzzle_template _this,
        puzzle _puzzle,
        string _event)
// : 퍼즐에서 이벤트가 발생했다
////////////////////////////////////////////////////////////////////////////////
{
}
////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////

{
	DebugOut(["puzzle.rp_element.ghostarmor_darklord2.2"]+ _name);
    if (_name == `mob1`.LowerCase() && _remain == 0)
    {

        // 고스트 아머 클리어 하면 다크로드 만들고 컷신을 튼다
	    _this.AllocateMonster(
		    0, 
			`mob2`,
		    `center`,                           // 배치 템플릿 이름 
			`single(DarkLord:1)`);
//		OnGhostArmorCleared(_this.GetDungeon()) extern (`data/script/dungeon/g1rp_25_dunbarton_rabbie_dungeon_test.mint`);
    }
//	else
//  if (_name == `mob2`.LowerCase() && _remain == 0)
//    {
//        // 다크로드 클리어 하면 열쇠주고 컷신을 튼다
//		OnDarkLordCleared(_this.GetDungeon()) extern (`data/script/dungeon/g1rp_25_dunbarton_rabbie_dungeon_test.mint`);

//    }
}


////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplateMonsterAllocate(
		puzzle_template _this,
		puzzle _puzzle,
		string _name,
		bool _bSucceeded)
// : 퍼즐에서 몬스터 할당 이벤트가 발생했다
////////////////////////////////////////////////////////////////////////////////
{
	if (_bSucceeded)
	{
		if (_name == `mob2`.LowerCase())
		{
			// 몬스터에 열쇠를 추가한다
			DebugOut(["puzzle.rp_element.ghostarmor_darklord2.3"]);
			_puzzle.FindMonster(`mob2`).AddKey(
				_this.FindPuzzle(`Monster`), `Lock1`);
		}
		else 
		{
			DebugOut(["puzzle.rp_element.ghostarmor_darklord2.4"]);
			// 열쇠가 담긴 상자가 열렸다
		    // 열쇠 방의 문을 닫는다
		}
	        _puzzle.GetPlace(0).CloseAllDoor();
	}
	else
	{
		// 실패인 경우 무조건 몬스터 퍼즐 종료이고, 열쇠를 드랍할
		// 회색 여우가 스폰될 수가 없었으므로 열쇠를 무조건 드랍
		_this.FindPuzzle(`KeyChest`).DropKey(1, `Lock1`);
	
        // 열쇠가 담긴 상자가 열렸다
        // 열쇠 방의 문을 연다
        _puzzle.GetPlace(0).OpenAllDoor();
	}
}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//      방번호 0 : 잠길 문이 있는 방, 문만 잠그면 되고 공간은 사용하지 않는다
//      방번호 1 : 열쇠가 배치될 방, 상자와 몬스터를 배치하므로 공간을 예약한다
//                 또, 트랩으로 문을 닫을 것이므로 문도 예약한다
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
    OnPuzzlePlaceAdded(
        puzzle _this,
        int _index,
        puzzle_place _place)
// : 이 퍼즐에서 필요로 하는 장소가 추가되었다
//   해당 장소에 필요한 속성을 설정한다
////////////////////////////////////////////////////////////////////////////////
{
	_place.DeclareLockSelf();
	_place.DeclareReserveSpace();

}

////////////////////////////////////////////////////////////////////////////////
server void
    OnPuzzleCreate(
        puzzle _this)       // in)      현재 생성 중인 퍼즐 인스턴스
// : 던전 층 생성시 불리는 핸들러,
//   필요한 퍼즐 요소를 할당하고 기본 상태를 정의한다
////////////////////////////////////////////////////////////////////////////////
{
    //--------------------------------------------------------------------------
    _this.LockPlace(0, `Lock1`, `key`);
    // 몬스터를 배치한다
    _this.AllocateMonster(
        0, 
		`mob1`,
        `center`,                           // 배치 템플릿 이름 
        `single(GhostArmor:6)`);

}
