////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                               던전 퍼즐 템플릿 : 입구퍼즐
//
//                                     uhihiho, begins at 2006. 11. 01
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
	DebugOut(["puzzle.rp_element.final_dungeon.1"]);
	_this.DeclarePlace(`ThisPlace`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다

	puzzle Monster;

	Monster = _this.DeclareSubPuzzle(
		`Monster`,         // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/element/BossRush.mint`);

	// 몬스터 퍼즐
	Monster.AddPlaceToUse(`ThisPlace`);

}
////////////////////////////////////////////////////////////////////////////////
server void
    OnTemplatePropEvent(
        puzzle_template _this, 
        puzzle _puzzle,
        puzzle_prop _prop,
        string _event,
        string _arg1,			// in)		스테이트 변화
        string _arg2, 			// in)		스테이트 변화를 일으킨 캐릭터
        string _arg3)
// : 퍼즐의 상자에서 이벤트가 발생했다
////////////////////////////////////////////////////////////////////////////////
{

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

    _this.LockPlace(0, `Lock1`, `key`);

    //--------------------------------------------------------------------------
    // 막은 문을 열 수 있는 열쇠를 만든다
    

    puzzle_chest ItemChest;

    ItemChest = _this.NewChest(
        0,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `real_center@1`,   // 배치에 사용할 위치 템플릿, 방의 네 구석 중 한 군데
        `Chest_Key`);   // 상자의 이름
    ItemChest.AddKey(`Lock1`);

}
