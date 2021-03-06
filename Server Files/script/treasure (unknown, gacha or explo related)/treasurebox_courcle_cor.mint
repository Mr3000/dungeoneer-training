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
	if (IsEnable(`featureG10TresureBoxMoney`) extern (`data/script/features.mint`))	// g10s1ex 부터 한국은 돈 대신 가끔 유물이 나옴
	{
		if (Random(10) == 0)
		{
			_this.AddItem(GetItemRewardDesc());	// 10% 확률로 유물 1개 더 보너스
		}
	}
	else
	{
		MoneyCount(_this);
	}

	_this.AddItem(GetItemRewardDesc());

	if(Random(3)==0)
	{
		_this.AddMonster(GetMonsterRace());
		_this.AddItem(GetItemRewardDesc());	//몬스터가 나오는 경우 아이템 한번 더
	}
	if(GetYear()==2006 && (GetDate()==0505 ||GetDate()==0506 ||GetDate()==0507))
	{
		if(Random(250)==0)
		{
			_this.AddItem(`id:80007 count:1`);//나오 탐험가 복장
		}
	}
	else if(GetDay()==6 || GetDay()==0)
	{
		if(Random(500)==0)
		{
			_this.AddItem(`id:80007 count:1`);//나오 탐험가 복장
		}
	}

	//중국용 청동 방패 투입
	if(
		(GetLocale().LowerCase() == `china` && GetVersion() >= 403)
	)
	{
		if(Random(200)==0)
		{
			_this.AddItem(`id:46012 count:1`);//청동 방패
		}
	}

	//일본용 일본식 양손검 도면 투입
	if(
		(GetLocale().LowerCase() == `japan` && GetVersion() >= 504)
	)
	{
		if(Random(2000)==0)
		{
			_this.AddItem(`manual:20177`);//일본식 양손검 도면
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
	int iRandom = Random(100);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(	0	){	itemDesc = `id:53100`; iCumRate += 	25	;} 
			case(	1	){	itemDesc = `id:53140`; iCumRate += 	15	;} 
			case(	2	){	itemDesc = `id:53120`; iCumRate += 	30	;} 
			case(	3	){	itemDesc = `id:53147`; iCumRate += 	10	;} 
			case(	4	){	itemDesc = `id:53148`; iCumRate += 	10	;} 
			case(	5	){	itemDesc = `id:53149`; iCumRate += 	10	;} 
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
	return `id:51003 count:1`; //아이템이 안나왔다...
}
////////////////////////////////////////////////////////////////////////////////
server string GetMonsterRace()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `JungleMillipede:2`; iCumRate += 90;} //6.926167059
			case(1){RaceDesc = `GiantJungleMillipede:1`; iCumRate += 10;} //6.926167059
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