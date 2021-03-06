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
	_this.AddEventItem(GetItemRewardDesc());

	//--------------------------------------------------------------------------
	// 어나운스 대상 아이템 설정
	// 아이템 클래스 아이디로 설정
	//_this.AddAnnounceItem(2000);
	//--------------------------------------------------------------------------
	
	//**************************************************************************
	// 어나운스 대상 아이템으로 등록하고자 하면 _this.AddEventItem으로 등록하고
	// _this.AddAnnounceItem으로도 등록해야지 된다. - cloudy
	//**************************************************************************
	
	//_this.AddAnnounceItem(52008  ); //세계의 명시
	//_this.AddAnnounceItem(52009  ); //큐빅 퍼즐
	
	// 두번째 parameter
	// : 0 이면 상자 밖에 생기는 몬스터 (Addmonster와 같은 동작)
	// : 1 이면 상자 안에 생기는 몬스터
	_this.AddMonsterWithPos(GetMonsterRace(), 1);
}
////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 아이템 추가 예
	// 이벤트 아이템 설정 설정
	//_this.AddEventItem(`id:2000`);
	//_this.AddEventItem(`id:51003 count:2~5`);
	//--------------------------------------------------------------------------
	
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
			case(	0	){itemDesc = `id:62005 count:1 prefix:20106`; iCumRate += 	6	;} //		활석 인챈트
			case(	1	){itemDesc = `id:62005 count:1 prefix:20207`; iCumRate += 	6	;} //		방해석 인챈트
			case(	2	){itemDesc = `id:62005 count:1 prefix:20302`; iCumRate += 	6	;} //		인회석 인챈트
			case(	3	){itemDesc = `id:62005 count:1 prefix:20407`; iCumRate += 	6	;} //		석영 인챈트
			case(	4	){itemDesc = `id:62005 count:1 prefix:20107`; iCumRate += 	6	;} //		석고 인챈트
			case(	5	){itemDesc = `id:62005 count:1 prefix:20208`; iCumRate += 	6	;} //		형석 인챈트
			case(	6	){itemDesc = `id:62005 count:1 prefix:20303`; iCumRate += 	6	;} //		정장석 인챈트
			case(	7	){itemDesc = `id:62005 count:1 prefix:20408`; iCumRate += 	6	;} //		황옥 인챈트
			case(	8	){itemDesc = `id:62005 count:1 prefix:20725`; iCumRate += 	6	;} //		노르만 인챈트
			case(	9	){itemDesc = `id:62005 count:1 prefix:20829`; iCumRate += 	6	;} //		그레이스 인챈트
			case(	10	){itemDesc = `id:62005 count:1 suffix:31014`; iCumRate += 	1	;} //		심해의 인챈트
			case(	11	){itemDesc = `manual:199 count:1	`; iCumRate += 	1	;}	//	@그레이스 플레이트 아머 옷본
			case(	12	){itemDesc = `manual:200 count:1	`; iCumRate += 	1	;}	//	@노르만 워리어 아머 옷본
			case(	13	){itemDesc = `manual:201 count:1	`; iCumRate += 	1	;}	//	@컬스틴 레더 아머 옷본
			case(	14	){itemDesc = `manual:20191 count:1`; iCumRate += 	6	;}	//	@그레이스 그리브 도면
			case(	15	){itemDesc = `manual:20192 count:1`; iCumRate += 	6	;}	//	@그레이스 건틀렛 도면
			case(	16	){itemDesc = `manual:20193 count:1`; iCumRate += 	6	;}	//	@노르만 워리어 헬멧 도면
			case(	17	){itemDesc = `manual:20194 count:1`; iCumRate += 	6	;}	//	@컬스틴 레더 건틀렛 도면
			case(	18	){itemDesc = `manual:20195 count:1`; iCumRate += 	6	;}	//	@컬스틴 레더 부츠 도면
			case(	19	){itemDesc = `manual:20196 count:1`; iCumRate += 	6	;}	//	@그레이스 헬멧 도면

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
// : 
////////////////////////////////////////////////////////////////////////////////
{
	//--------------------------------------------------------------------------
	// 몬스터 등록 예
	// 몬스터 클래스 아이디로 지정
	//_this.AddMonster(`StoneBison3:2`);
	// 몬스터 클래스 아이디와 타이틀 지정
	//_this.AddMonster(`MaskGoblin[30026|30027|30028]:3`);
	// 콤마로도 구분 가능
	//_this.AddMonster(GoldMaskGhost[30026|30027|30028]:3, Sheep:5`);
	// 몬스터 그룹을 지정
	//_this.AddMonster(`group(127)`);
	//--------------------------------------------------------------------------
	
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(5);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `SmallStoneImp`; iCumRate += 1;} //스톤 임프
			case(1){RaceDesc = `SmallStoneZombie`; iCumRate += 1;} //스톤 좀비
			case(2){RaceDesc = `SmallStoneHound`; iCumRate += 1;} //스톤 하운드
			case(3){RaceDesc = `SmallStoneBison`; iCumRate += 1;} //스톤 바이슨
			case(4){RaceDesc = `SmallPotSpider`; iCumRate += 1;} //항아리 거미



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
			RaceDesc=RaceDesc+`:`+ToString(Random(2) + 1);
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