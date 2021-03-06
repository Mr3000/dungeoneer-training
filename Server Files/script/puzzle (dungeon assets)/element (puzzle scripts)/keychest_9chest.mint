////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//				                              던전 퍼즐 템플릿 : 9개의 보물 상자
//
//                                     eias erinys fecit, begins at 2003. 10. 08
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
	DebugOut(["puzzle.element.keychest_9chest.1"]);
    //--------------------------------------------------------------------------
    // 이 퍼즐에서 사용할 장소를 선언한다
    _this.DeclarePlace(`LockedPlace`);


    //--------------------------------------------------------------------------
    // 퍼즐을 선언한다
    
    // 열쇠가 담긴 상자와 잠긴 문을 배치하는 퍼즐
    puzzle KeyChest;
    KeyChest = _this.DeclareSubPuzzle(
        `KeyChest`,         // 퍼즐 이름 (서버 내부에서 사용)
        `data/script/puzzle/element/KeyChest_9Chest.mint`);

    KeyChest.AddPlaceToUse(`LockedPlace`); // 퍼즐의 0번 방


    // 몬스터 퍼즐
    puzzle Monster;


    Monster = _this.DeclareSubPuzzle(
	    `Monster`,
		`data/script/puzzle/monster/ChainMob.mint`);



   	Monster.Set(`mob1`, _arg1);
   	Monster.Set(`mob2`, _arg2);
   	Monster.Set(`mob3`, _arg3);
	
    Monster.AddPlaceToUse(`LockedPlace`);



}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//      방번호 0 : 잠길 문이 있는 방, 문만 잠그면 되고 공간은 사용하지 않는다
//      방번호 1 : 열쇠가 배치될 방, 상자와 미믹을 배치하므로 공간을 사용한다
//
////////////////////////////////////////////////////////////////////////////////



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
	if ((_name == `keychest1`.LowerCase() || _name == `keychest2`.LowerCase() || _name == `keychest3`.LowerCase() )&& _remain == 0)
	{
		_this.Set(`state1`,ToString(_this.Get(`state1`).GetInteger()-1));
		if (_this.Get(`state1`) == `0`)
		{
	        _this.GetPlace(0).OpenAllDoor();
		}
	}
}
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
	_place.DeclareReserveSpace();
    _place.DeclareReserveDoor();
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
			 (chest.GetName() == _puzzle.Get(`monster1`).LowerCase() || chest.GetName() == _puzzle.Get(`monster2`).LowerCase() || chest.GetName() == _puzzle.Get(`monster3`).LowerCase())&&
	        _event == `statechange` &&
	        _arg1 == `open`)
		{
			_puzzle.Set(`state1`,ToString(_puzzle.Get(`state1`).GetInteger()+1));
			_puzzle.Set(`state2`,ToString(_puzzle.Get(`state2`).GetInteger()+1));
			
			_puzzle.ClosePuzzleDoor(0);
			_puzzle.AllocateMonster(
				0, 
				_puzzle.GetName() + _puzzle.Get(`state2`), 		// 몬스터 이름
				`center@*!`,  
				_this.FindPuzzle(`Monster`).Get(`mob`+_puzzle.Get(`state2`)));


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
	_puzzle.GetPlace(0).CloseAllDoor();
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

    puzzle_chest KeyChest1;
    puzzle_chest KeyChest2;
    puzzle_chest KeyChest3;
    puzzle_chest KeyChest4;
    puzzle_chest KeyChest5;
    puzzle_chest KeyChest6;
    puzzle_chest KeyChest7;
    puzzle_chest KeyChest8;
    puzzle_chest KeyChest9;
	string chestname1;
	string chestname2;
	string chestname3;
	int a,b,c;

	a= Random(9)+1;
	b= Random(9)+1;
	c= Random(9)+1;
	while(a==b)
	{
		b=Random(9)+1;
	}
	while(a==c || b==c)
	{
		c=Random(9)+1;
	}


	chestname1=`treasure` + ToString(a);
	chestname2=`treasure` + ToString(b);
	chestname3=`treasure` + ToString(c);
	// 보물 상자를 배치한다

	KeyChest1 = _this.NewLockedChest(0, `9center@*!`, `treasure1`);
	KeyChest2 = _this.NewLockedChest(0, `9center@*!`, `treasure2`);
	KeyChest3 = _this.NewLockedChest(0, `9center@*!`, `treasure3`);
	KeyChest4 = _this.NewLockedChest(0, `9center@*!`, `treasure4`);
	KeyChest5 = _this.NewLockedChest(0, `9center@*!`, `treasure5`);
	KeyChest6 = _this.NewLockedChest(0, `9center@*!`, `treasure6`);
	KeyChest7 = _this.NewLockedChest(0, `9center@*!`, `treasure7`);
	KeyChest8 = _this.NewLockedChest(0, `9center@*!`, `treasure8`);
	KeyChest9 = _this.NewLockedChest(0, `9center@*!`, `treasure9`);
		
	if (a!=1 && b!=1 && c!=1)
	{
	    KeyChest1.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=2 && b!=2 && c!=2)
	{
	    KeyChest2.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=3 && b!=3 && c!=3)
	{
	    KeyChest3.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=4 && b!=4 && c!=4)
	{
	    KeyChest4.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=5 && b!=5 && c!=5)
	{
	    KeyChest5.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=6 && b!=6 && c!=6)
	{
	    KeyChest6.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=7 && b!=7 && c!=7)
	{
	    KeyChest7.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=8 && b!=8 && c!=8)
	{
	    KeyChest8.AddItem(`id:2000 count:250~1000`);
	}
	if (a!=9 && b!=9 && c!=9)
	{
	    KeyChest9.AddItem(`id:2000 count:250~1000`);
	}
	_this.Set(`monster1`, chestname1);
	_this.Set(`monster2`, chestname2);
	_this.Set(`monster3`, chestname3);
	_this.Set(`state1`, `0`);
	_this.Set(`state2`, `0`);
}



