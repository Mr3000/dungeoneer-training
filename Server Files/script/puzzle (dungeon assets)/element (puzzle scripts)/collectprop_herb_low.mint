////////////////////////////////////////////////////////////////////////////////
//									  Mabinogi Project Dungeon Puzzle Template
//												   던전 퍼즐 템플릿 : 베이스허브의 배치_하급던전용
//
//									 qwerty fecit, begins at 2004. 09. 9
//										qwerty@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 템플릿 이벤트 핸들러
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void
	OnTemplatePrepare(
		puzzle_template _this,
		string _arg1,	//허브1번
		string _arg2,	//허브2번
		string _arg3)	//허브3번
// : 퍼즐 템플릿 생성을 준비한다
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 이 퍼즐 템플릿에서 사용할 장소를 선언한다
	_this.DeclarePlace(`PropPlace`);

	//--------------------------------------------------------------------------
	// 퍼즐을 선언한다
	
	// 그냥 채집 가능 프랍만 있는 방을 추가한다
	puzzle Collect;
	Collect = _this.DeclareSubPuzzle(
		`Collect`,		 // 퍼즐 이름 (서버 내부에서 사용)
		`data/script/puzzle/element/CollectProp_Herb_Low.mint`);

	int iRandom;
	int iColor = 0x808080;
	string herbId;
	int i;
	
	string color1, color2, color3;

	//arg 값을 하나도 넣지 않았을 경우
	if (_arg1.GetLength()==0 && _arg2.GetLength()==0 && _arg3.GetLength()==0) 
	{
		for (i = 1; i <= 3; ++i)
		{

			//랜덤하게 허브의 종류가 정해진다 -----이 부분은 포이즌 허브와 만드레이크가 추가될때, 변경되어야함.
			iRandom = Random(100);

			if (iRandom > 95)
			{
				herbId = `273`;	//골드 허브
				iColor = 0xff8000;      // 금색
			}
			else
			if (iRandom > 85)
			{
				herbId = `270`;	//마나허브
				iColor = 0x0080c0;      // 푸른색
			}
			else
			if (iRandom > 83
				&& GetVersion() >= 302
			)
			{
				herbId = `329`;	//독초
				iColor = 0x77588F;      // 보라색
			}
			else
			if (iRandom > 78
				&& GetVersion() >= 302
			)
			{
				herbId = `330`;	//해독초
				iColor = 0xECE3DD;      // 상아색
			}
			else
			if (iRandom > 70)
			{
				herbId = `271`;	//썬라이트 허브
				iColor = 0xb7b066;      // 노란색
			}
			else
			if (iRandom > 50)
			{
				herbId = `269`;	//블러디 허브
				iColor = 0xaa4261;      // 붉은색
			}
			else
			{
				herbId = `272`;	//베이스 허브
				iColor = 0x808080;      // 녹색
			}

			//세 arg에 허브 아이디를 지정
			switch(i){
				case (1)
				{
					_arg1 = herbId;
					color1 = ToString(iColor);
				}
				case (2)
				{
					_arg2 = herbId;
					color2 = ToString(iColor);
				}
				case (3)
				{
					_arg3 = herbId;
					color3 = ToString(iColor);
				}
			}
		}
	}
	//arg 값을 하나라도 넣었을 경우, 이름이 맞으면 그 허브를 넣고, 아니면 베이스허브를 넣는다.
	else
	{
		for (i = 1; i <= 3; ++i)
		{
			switch(i){
				case (1)
				{
					herbId = _arg1;
				}
				case (2)
				{
					herbId = _arg2;
				}
				case (3)
				{
					herbId = _arg3;
				}
			}

			if (GetVersion() >= 302)
			{
				if(herbId.LowerCase() == `mandrake`
				|| herbId.LowerCase()  == `poisonherb`
				|| herbId.LowerCase()  == `antidoteherb`)
				{
					int iRandom2=Random(4);
					switch (iRandom2)
					{
						case(0)
						{	
							herbId  == `goldherb`;
						}
						case(1)
						{
							herbId  == `manaherb`;
						}
						case(2)
						{
							herbId  == `sunlightherb`;
						}
						case(3)
						{
							herbId  == `bloodyherb`;
						}
					}
				}
			}

			if (herbId.LowerCase()  == `goldherb`)
			{
				herbId = `273`;	        // 골드 허브
				iColor = 0xff8000;      // 금색
			}
			else
			if (herbId.LowerCase()  == `manaherb`)
			{
				herbId = `270`;	        //마나허브
				iColor = 0x0080c0;      // 푸른색
			}
			else
			if (herbId.LowerCase()  == `sunlightherb`)
			{
				herbId = `271`;	        // 썬라이트 허브
				iColor = 0xb7b066;      // 노란색
			}
			else
			if (herbId.LowerCase()  == `bloodyherb`)
			{
				herbId = `269`;	        // 블러디 허브
				iColor = 0xaa4261;      // 붉은색
			}
			else
			if (herbId.LowerCase()  == `whiteherb`)
			{
				herbId = `326`;	        // 화이트 허브
				iColor = 0xdddddd;      //흰색
			}
			else
			if (herbId.LowerCase()  == `mandrake`)
			{
				herbId = `331`;	//맨드레이크
				iColor = 0xF59200 ;      // 주황색
			}
			else
			if (herbId.LowerCase()  == `poisonherb`)
			{
				herbId = `329`;	//독초
				iColor = 0x77588F;      // 보라색
			}
			else
			if (herbId.LowerCase()  == `antidoteherb`)
			{
				herbId = `330`;	//해독초
				iColor = 0xECE3DD;      // 상아색
			}
			else
			{
				herbId = `272`;	        // 베이스 허브
				iColor = 0x808080;      // 녹색
			}
			//세 arg에 허브 아이디를 지정
			switch(i){
				case (1)
				{
					_arg1 = herbId;
					color1 = ToString(iColor);
				}
				case (2)
				{
					_arg2 = herbId;
					color2 = ToString(iColor);
				}
				case (3)
				{
					_arg3 = herbId;
					color3 = ToString(iColor);
				}
			}
		}
	}

	//위에서 정해진 허브아이디를 퍼즐에 세팅
	Collect.Set(`herb1`, _arg1);
	Collect.Set(`herb2`, _arg2);
	Collect.Set(`herb3`, _arg3);
	Collect.Set(`herbcolor1`, color1);
	Collect.Set(`herbcolor2`, color2);
	Collect.Set(`herbcolor3`, color3);

	Collect.AddPlaceToUse(`PropPlace`); // 퍼즐의 0번 방
}

////////////////////////////////////////////////////////////////////////////////
// 퍼즐 이벤트 핸들러
// 
// 방배치
//
//	  방번호 0 : 채집 프랍이 배치된 방
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
			// 0번 방의 공간은 퍼즐을 배치하는 데 사용하므로 다른 퍼즐에서
			// 사용할 수 없도록 만든다
			_place.DeclareReserveSpace();

			// 허브가 복도에 나오지 않게 하기 위해 방에 만든다.
			// - 2005/06/27 - yooari
			_place.DeclareRoom(); 
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void
	OnPuzzleCreate(
		puzzle _this)	   // in)	  현재 생성 중인 퍼즐 인스턴스
// : 던전 층 생성시 불리는 핸들러,
//   필요한 퍼즐 요소를 할당하고 기본 상태를 정의한다
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 채집 가능 프랍을 만든다
	puzzle_collect herb;	 // 철광석

	//arg에서 보내온 허브 아이디를 받아온다.
	int herbId1 = _this.Get(["puzzle.element.collectprop_herb_low.1"]).GetInteger();
	int herbId2 = _this.Get(["puzzle.element.collectprop_herb_low.2"]).GetInteger();
	int herbId3 = _this.Get(["puzzle.element.collectprop_herb_low.3"]).GetInteger();
	int herbcolor1 = _this.Get(`herbcolor1`).GetInteger();
	int herbcolor2 = _this.Get(`herbcolor2`).GetInteger();
	int herbcolor3 = _this.Get(`herbcolor3`).GetInteger();

	herb = _this.NewCollectProp(
		herbId1,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Herb@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가. 철광석과 공용.
		`herb1`);	  // 프랍의 이름
	((puzzle_prop) herb).SetColor(0, herbcolor1);   // 인덱스 0 == 컬러 슬롯 b1
		
	herb = _this.NewCollectProp(
		herbId2,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Herb@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가. 철광석과 공용.
		`herb2`);	  // 프랍의 이름
	((puzzle_prop) herb).SetColor(0, herbcolor2);   // 인덱스 0 == 컬러 슬롯 b1
		
	herb = _this.NewCollectProp(
		herbId3,		  // 설치할 프랍 아이디
		0,			  // 퍼즐 템플릿에서 예약한 방의 제로 베이스 인덱스
		`Herb@*!`,	 // 배치에 사용할 위치 템플릿, 방의 귀퉁이 중 어딘가. 철광석과 공용.
		`herb3`);	  // 프랍의 이름
	((puzzle_prop) herb).SetColor(0, herbcolor3);   // 인덱스 0 == 컬러 슬롯 b1
}





