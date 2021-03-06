////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//                               던전 퍼즐 템플릿 : 열쇠 담긴 상자와 몬스터 트랩
//
//                                     eias erinys fecit, begins at 2003. 11. 06
//                                        eias@nexon.co.kr, sheplany@nownuri.net
////////////////////////////////////////////////////////// component of Mabinogi

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
    
    _this.DeclarePlace(`LockedPlace`);
    _this.DeclarePlace(`ChestPlace`);

    //--------------------------------------------------------------------------
    // 퍼즐을 선언한다
    
    // 열쇠가 담긴 상자와 잠긴 문을 배치하는 퍼즐
    puzzle KeyChest;
    KeyChest = _this.DeclareSubPuzzle(
        `KeyChest`,         // 퍼즐 이름 (서버 내부에서 사용)
        `data/script/puzzle/element/KeyChest_Monster.mint`);

    KeyChest.AddPlaceToUse(`LockedPlace`); // 퍼즐의 0번 방
    KeyChest.AddPlaceToUse(`ChestPlace`);  // 퍼즐의 1번 방

    // 몬스터 퍼즐
    puzzle Monster;
    
    int iRandom = Random(2);
    
    switch (iRandom) 
    {
  	  case (0)
  	  {
          Monster = _this.DeclareSubPuzzle(
	        `Monster`,
	        `data/script/puzzle/monster/SingleMob.mint`);
	        
  	  }
    	case (1)
    	{
          Monster = _this.DeclareSubPuzzle(
	        `Monster`,
	        `data/script/puzzle/monster/ChainMob.mint`);
    	  
    	}
  	}

    	Monster.Set(`mob1`, _arg1);
    	Monster.Set(`mob2`, _arg2);
    	Monster.Set(`mob3`, _arg3);
    	        
    Monster.AddPlaceToUse(`ChestPlace`);
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
    if (_puzzle.GetName() == `Monster`.LowerCase() &&
        _event == `complete`)
    {
        // 몬스터 퍼즐이 클리어되었다.
        // 열쇠 방의 문을 모두 연다
        _this.FindPuzzle(`KeyChest`).GetPlace(1).OpenAllDoor();
    }
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
    if (_prop.GetTypeName() == `puzzle_chest`)
    {
        puzzle_chest chest;
        chest = (puzzle_chest) _prop;
    
	    if (_puzzle.GetName() == `KeyChest`.LowerCase() && 
	        chest.GetName() == `Chest_Key`.LowerCase() &&
	        _event == `statechange` &&
	        _arg1 == `open`)
	    {
			_this.FindPuzzle(`Monster`).ClosePuzzleDoor(0);
			
	        // 몬스터 퍼즐을 활성화한다
	        _this.FindPuzzle(`Monster`).Activate();
	    }
    }
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
		if (_name == `Mob_Last`.LowerCase())
		{
			// 몬스터에 열쇠를 추가한다
			_puzzle.FindMonster(`Mob_Last`).AddKey(
				_this.FindPuzzle(`KeyChest`), `Lock1`);
		}
	
        // 열쇠가 담긴 상자가 열렸다
        // 열쇠 방의 문을 닫는다
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
    switch (_index) {
    case (0)
        {
            // 0번 방의 출구를 잠근다
		    _place.DeclareLock();
        }
        
    case (1)
        {
            // 1번 방에는 0번 방의 출구를 여는 열쇠가 있다
            _place.DeclareUnlock(_this.GetPlace(0));
            
            // 1번 방의 공간은 퍼즐을 배치하는 데 사용하므로 다른 퍼즐에서
            // 사용할 수 없도록 만든다
            _place.DeclareReserveSpace();
            
            // 1번 방의 문은 트랩에 사용하므로 다른 퍼즐에서 사용할 수 없도록
            // 만든다
            _place.DeclareReserveDoor();
        }
    }
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
    // 먼저 출구를 막는다
    _this.LockPlace(0, `Lock1`, `key`);

    // 막은 문을 열 수 있는 열쇠를 만든다
    puzzle_chest KeyChest;     // 열쇠가 담긴 상자
    
    KeyChest = _this.NewChest(
        1,              // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
        `center@*`,     // 배치에 사용할 위치 템플릿, 방의 가운데 중 어딘가
        `Chest_Key`);   // 상자의 이름

    //KeyChest.AddKey(`Lock1`);
    if(Random(100)!=0)
    {
	    KeyChest.AddItem(`id:2000 count:10~50`);
	    KeyChest.AddItem(`id:2000 count:10~50`);
    }
    else
    {
		KeyChest.AddItem(`id:2000 count:100~200`);
		KeyChest.AddItem(`id:2000 count:100~200`);
		KeyChest.AddItem(`id:2000 count:100~200`);
		KeyChest.AddItem(`id:2000 count:100~200`);
		KeyChest.AddItem(`id:2000 count:100~200`);
    }
}





 
