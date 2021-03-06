////////////////////////////////////////////////////////////////////////////////
//                                      		Mabinogi Project Treasure Script
//                                             					   이리아 보물상자
//
//                                   wakeup erinys fecit, begins at 2006. 02. 16
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{
	MoneyCount(_this);
	_this.AddItem(GetItemRewardDesc());

	if(Random(3)==0)
	{
		_this.AddMonster(GetMonsterRace());
	}

	if(GetDay()==0 || GetDay()==3)
	{
		switch(Random(5)) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0) {_this.AddItem(`id:75174 count:1`);}	//순록 모양 메달
			case(1) {_this.AddItem(`id:75175 count:1`);}	//소용돌이 모양 메달
			case(2) {_this.AddItem(`id:75176 count:1`);}	//열매 맺힌 나무 모양 메달
			case(3) {_this.AddItem(`id:75177 count:1`);}	//날개 달린 말 모양 메달
			case(4) {_this.AddItem(`id:75178 count:1`);}	//날지 못하는 새 모양 메달
		}		
	}

	if(GetDay()==1 || GetDay()==4)
	{
		switch(Random(5)) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0) {_this.AddItem(`id:75174 count:1`);}	//순록 모양 메달
			case(1) {_this.AddItem(`id:75175 count:1`);}	//소용돌이 모양 메달
			case(2) {_this.AddItem(`id:75176 count:1`);}	//열매 맺힌 나무 모양 메달
			case(3) {_this.AddItem(`id:75177 count:1`);}	//날개 달린 말 모양 메달
			case(4) {_this.AddItem(`id:75178 count:1`);}	//날지 못하는 새 모양 메달
		}		
	}

	if(GetDay()==2 || GetDay()==5)
	{
		switch(Random(5)) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0) {_this.AddItem(`id:75174 count:1`);}	//순록 모양 메달
			case(1) {_this.AddItem(`id:75175 count:1`);}	//소용돌이 모양 메달
			case(2) {_this.AddItem(`id:75176 count:1`);}	//열매 맺힌 나무 모양 메달
			case(3) {_this.AddItem(`id:75177 count:1`);}	//날개 달린 말 모양 메달
			case(4) {_this.AddItem(`id:75178 count:1`);}	//날지 못하는 새 모양 메달
		}		
	}

	if(GetDay()==6)
	{
		switch(Random(5)) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0) {_this.AddItem(`id:75174 count:1`);}	//순록 모양 메달
			case(1) {_this.AddItem(`id:75175 count:1`);}	//소용돌이 모양 메달
			case(2) {_this.AddItem(`id:75176 count:1`);}	//열매 맺힌 나무 모양 메달
			case(3) {_this.AddItem(`id:75177 count:1`);}	//날개 달린 말 모양 메달
			case(4) {_this.AddItem(`id:75178 count:1`);}	//날지 못하는 새 모양 메달
		}		
	}


	//_this.AddItem(`id:46006`);
	//_this.AddItem(`id:51003 count:2~5`);
	
	// 몬스터 클래스 아이디로 지정
	//_this.AddMonster(`StoneBison3:2`);
	
	// 몬스터 클래스 아이디와 타이틀 지정
	//_this.AddMonster(`MaskGoblin[30026|30027|30028]:3`);
	
	// 콤마로도 구분 가능
	//_this.AddMonster(GoldMaskGhost[30026|30027|30028]:3, Sheep:5`);
	
	// 몬스터 그룹을 지정
	//_this.AddMonster(`group(127)`);
}
////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(40000);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){itemDesc = `id:51001 count:1~3`; iCumRate += 	10000	;} //	생명력 10포션
			case(1){itemDesc = `id:51002 count:1~3`; iCumRate += 	10000	;} //	생명력 30포션
			case(2){itemDesc = `id:51006 count:1~3`; iCumRate += 	10000	;} //	마나 10 포션
			case(3){itemDesc = `id:51007 count:1~3`; iCumRate += 	10000	;} //	마나 30 포션

			default
			{
				bBreak = true;
			}
		}
		if (bBreak)
		{
			break;
		}
		
		if (iRandom < iCumRate) 
		{
			DebugOut(`보물상자에 `+itemDesc+` 넣음`);
			return itemDesc;
		}
		
		++i;
	}
	return `id:51002 count:1`; //아이템이 안나왔다...
}
////////////////////////////////////////////////////////////////////////////////
server string GetMonsterRace()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(4000);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `KingSlate:1`; iCumRate += 1000;} 
			case(1){RaceDesc = `QueenSlate:1`; iCumRate += 1000;} 
			case(2){RaceDesc = `FighterSlate:1`; iCumRate += 1000;} 
			case(3){RaceDesc = `ArcherSlate:1`; iCumRate += 1000;} 

			default
			{
				bBreak = true;
			}
		}
		if (bBreak)
		{
			break;
		}
		
		if (iRandom < iCumRate) 
		{
			//RaceDesc=RaceDesc+`:`+ToString(Random(3));
			DebugOut(`보물상자에 `+RaceDesc+` 배치`);
			return RaceDesc;
		}
		
		++i;
	}
	return `CountryRat:1`; //아이템이 안나왔다...

}
////////////////////////////////////////////////////////////////////////////////
server void  MoneyCount(prop _this)

////////////////////////////////////////////////////////////////////////////////
{
	int money=Random(250)+250;

	if(Random(2)==0) //50% 200골드 불려줌
	{
		money+=100+ Random(100);
	}

	if(Random(100)==0) //1%로 1000골드 불려줌
	{
		money+=1000+ Random(100);
	}
	if(Random(1000)==1) //1/1000로 10000골드 불려줌
	{
		money+=10000+ Random(1000);
	}
	if(Random(5000)==1) //1/5000로 2배
	{
		money=money*2;
	}
	
	int gold=money/1000; //천원자리금덩이수
	int remaingold=money%1000;	//천원안되는돈
	int i;
	for(i=0;i<gold;i++)
	{
		_this.AddItem(`id:2000 count:1000`);
	}
	_this.AddItem(`id:2000 count:`+ToString(remaingold));
}