///////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project Dungeon Puzzle Template
//					던전 퍼즐 템플릿 : 트리아나만 있는 방
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
	_this.DeclarePlace(`ChestPlace`);
    //--------------------------------------------------------------------------
    // 이 퍼즐 템플릿에서 사용할 장소를 선언한다
        puzzle KeyChest;

	KeyChest = _this.DeclareSubPuzzle(
		`KeyChest`,         // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/RP_element/G2_08_Triona.mint`);

	KeyChest.AddPlaceToUse(`ChestPlace`);  // 퍼즐의 1번 방
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
	switch (_index)
	{
		case (0)
		{
			_place.DeclareRoom();
			_place.DeclareReserveSpace();
		}
		case (1)
		{
			_place.DeclareRoom();
			_place.DeclareReserveSpace();
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
	_this.EnablePlaceWatch(0, true);
}

////////////////////////////////////////////////////////////////////////////////
server void OnPuzzleMonsterDisappear(
	puzzle _this,
	string _name,
	int _remain)
// : 퍼즐이 종료되었다
////////////////////////////////////////////////////////////////////////////////
{
	//트리아나가 쓰러지면
	if (_name == `triona`.LowerCase() && _remain == 0)
	{
		DebugOut(["puzzle.rp_element.g2_08_triona.10"]);
		meta_map cutscene_param;
		cutscene_param.Set(`puzzle_name`,_this.GetFullName()); //컷신에 인자를 넘겨줄 준비!!!!!!!
		
		dungeon _dungeon = _this.GetDungeon();
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	
		// 컷신을 호출한다.
		leader.PlayCutScene(`G2_08_c_Paladin_exercises`,0, cMemberList , cutscene_param);
	}

	if (_name == `npc`.LowerCase() && _remain == 0) // PC 동료 NPC들이 쓰러지면
	{
		OnFellowNPCCleared(_this.GetDungeon()) extern (`data/script/Dungeon/G2_08_Dunbarton_Math_Dungeon.mint`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnPuzzleEnterPlace(
		puzzle _this,
		int _index)
//이 퍼즐에 사람이 들어오면
////////////////////////////////////////////////////////////////////////////////
{
	_this.GetPlace(0).CloseAllDoor();
	
	DebugOut(`트리아나가 있는 방에 사람이 들어왔다`);
	_this.EnablePlaceWatch(0, false);

	DebugOut(`트리아나를 배치한다`);
	_this.AllocateMonster(
	0,
	`triona`,
	`center`,                           // 배치 템플릿 이름 
	`single(Triona:1)`);
		
	meta_map cutscene_param;
	cutscene_param.Set(`puzzle_name`,_this.GetFullName()); //컷신에 인자를 넘겨줄 준비!!!!!!!
	
	dungeon _dungeon = _this.GetDungeon();
	object_list cMemberList = _dungeon.GetCreatorList();
	character	leader = (character)cMemberList.GetValue(0);
	
	cMemberList.RemoveValue(0);
	// 컷신을 호출한다.
	leader.PlayCutScene(`G2_08_b_Paladin_exercises`,0, cMemberList , cutscene_param);
}

////////////////////////////////////////////////////////////////////////////////
server void TraineeAlloc(
	character me,
	object_list _cMemberList,
	meta_map cutscene_param
	)
// : 활성화 요청을 받았다 
////////////////////////////////////////////////////////////////////////////////
{ 
	DebugOut(`던전 퍼즐의 수련생 생성함수까지 잘왔따`);
	puzzle _this;

	string puzzle_name;
	puzzle_name =  (string)cutscene_param.Get(`puzzle_name`); //cutscene param 메터에서 퍼즐네임을 받고
	_this = FindPuzzle(puzzle_name); //그 이름에서 이 퍼즐을 찾아낸다!!!
	
	DebugOut(`수련생 배치 시작`);

	_this.AllocateMonster(
		0,
		`npc`,
		`center`,                          
		`single(PaladinTrainee:4)`); // PC 동료 NPC 배치

	DebugOut(`팔라딘동료를 불러 배치가 끝났다`);
}

////////////////////////////////////////////////////////////////////////////////
server void RuariAlloc(
	character me,
	object_list _cMemberList,
	meta_map cutscene_param
	)
// : 활성화 요청을 받았다 
////////////////////////////////////////////////////////////////////////////////
{ 
	DebugOut(`던전 퍼즐의 루에리 생성함수까지 잘왔따`);
	puzzle _this;

	string puzzle_name;
	puzzle_name =  (string)cutscene_param.Get(`puzzle_name`); //cutscene param 메터에서 퍼즐네임을 받고
	_this = FindPuzzle(puzzle_name); //그 이름에서 이 퍼즐을 찾아낸다!!!
	
	DebugOut(`루에리 배치 시작`);

	_this.AllocateMonster(
		0,
		`rueri`,
		`center`,                          
		`single(G2_Rueri:1)`); // 루에리 배치

	DebugOut(["puzzle.rp_element.g2_08_triona.11"]);
}