////////////////////////////////////////////////////////////////////////////////
//									Mabinogi Project Treasure Script
//									이리아 보물상자 (일본 3주년 이벤트)
//
//								dochigun fecit, begins at 2007. 05. 23
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{

	// 이벤트용 처리를 하기 전에 반드시 SetEventType()으로 어떤 이벤트용 상자인지
	// 명시를 해주어야 한다.
	// 명시해주지 않으면 기본값으로 'treasurehunting' 이벤트로 세팅된다.
	_this.SetEventType(`4th_anniversary_2008_korea`);
	_this.AddEventItem(GetItemRewardDesc());

}

////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(12);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){itemDesc = `id:73188`; iCumRate += 4;}//이리아의 추억의 보물 상자
			case(1){itemDesc = `id:40022`; iCumRate += 1;}//채집용 도끼 
			case(2){itemDesc = `id:40023`; iCumRate += 1;}//채집용 단검
			case(3){itemDesc = `id:40005`; iCumRate += 1;}//숏 소드 
			case(4){itemDesc = `id:40003`; iCumRate += 1;}//숏 보우
			case(	5){itemDesc = `id:40031`; iCumRate += 	1;}	//	석궁												
			case(	6){itemDesc = `id:40016`; iCumRate += 	1;}	//	@해머											
			case(	7){itemDesc = `id:40012`; iCumRate += 	1;}	//	@바스타드 소드					
			case(	8){itemDesc = `id:40010`; iCumRate += 	1;}	//	@롱소드									


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
	int iRandom = Random(86003);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `Skeleton`; iCumRate += 10000;} //스켈레톤11.62750137
			case(1){RaceDesc = `SkeletonSoldier`; iCumRate += 8000;} //스켈레톤 병사9.302001093
			case(2){RaceDesc = `SkeletonArmorA`; iCumRate += 5000;} //스켈레톤5.813750683
			case(3){RaceDesc = `SkeletonArmorB`; iCumRate += 5000;} //스켈레톤5.813750683
			case(4){RaceDesc = `PoisonSkeletonSoldier`; iCumRate += 5000;} //포이즌 스켈레톤 병사5.813750683
			case(5){RaceDesc = `SkeletonArmorC`; iCumRate += 5000;} //스켈레톤5.813750683
			case(6){RaceDesc = `MetalSkeleton`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(7){RaceDesc = `MetalSkeletonArmorA`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(8){RaceDesc = `MetalSkeletonArmorB`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(9){RaceDesc = `RedSkeleton`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(10){RaceDesc = `RedSkeletonArmorA`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(11){RaceDesc = `RedSkeletonArmorB`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(12){RaceDesc = `GiantSkeleton`; iCumRate += 2000;} //거대 스켈레톤2.325500273
			case(13){RaceDesc = `FlyingSword`; iCumRate += 2000;} //플라잉 소드2.325500273
			case(14){RaceDesc = `RedSkeletonArmorC`; iCumRate += 2000;} //레드 스켈레톤2.325500273
			case(15){RaceDesc = `MetalSkeletonArmorC`; iCumRate += 2000;} //메탈 스켈레톤2.325500273
			case(16){RaceDesc = `SkeletonLaghodessa`; iCumRate += 2000;} //해골 라고데사2.325500273
			case(17){RaceDesc = `GhostArmor`; iCumRate += 1000;} //고스트 아머1.162750137
			case(18){RaceDesc = `BlackSpider`; iCumRate += 1000;} //검은거미1.162750137
			case(19){RaceDesc = `RedSpider`; iCumRate += 1000;} //붉은거미1.162750137
			case(20){RaceDesc = `GiantSpider`; iCumRate += 1000;} //거대거미1.162750137
			case(21){RaceDesc = `SickleLaghodessa`; iCumRate += 1000;} //낫 라고데사1.162750137
			case(22){RaceDesc = `SpikeLaghodessa`; iCumRate += 1000;} //가시 라고데사1.162750137
			case(23){RaceDesc = `BrownTownRat`; iCumRate += 1000;} //갈색 도시쥐1.162750137
			case(24){RaceDesc = `GrayTownRat`; iCumRate += 1000;} //회색 도시쥐1.162750137
			case(25){RaceDesc = `CountryRat`; iCumRate += 1000;} //시골쥐1.162750137
			case(26){RaceDesc = `BlackTownRat`; iCumRate += 1000;} //검은 도시쥐1.162750137
			case(27){RaceDesc = `LittleCountryRat`; iCumRate += 1000;} //작은 시골쥐1.162750137
			case(28){RaceDesc = `BrownSnake`; iCumRate += 1000;} //갈색 뱀1.162750137
			case(29){RaceDesc = `BlueSnake`; iCumRate += 1000;} //청색 뱀1.162750137
			case(30){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(31){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(32){RaceDesc = `GiantWorm4`; iCumRate += 1000;} //자이언트 웜1.162750137
			case(33){RaceDesc = `Spine_Earthworm`; iCumRate += 1000;} //가시 지렁이1.162750137
			case(34){RaceDesc = `GiantImp`; iCumRate += 1;} //거대 임프0.00116275
			case(35){RaceDesc = `GiantSkeletonImp`; iCumRate += 1;} //거대 스켈레톤 임프0.00116275
			case(36){RaceDesc = `GolemSoldier`; iCumRate += 1;} //골렘0.00116275
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
			RaceDesc=RaceDesc+`:`+ToString(Random(3));
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
	int money=Random(100);

	if(Random(100)<50) //50% 200골드정도로 불려줌
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