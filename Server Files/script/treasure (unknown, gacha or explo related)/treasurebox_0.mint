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
		(GetLocale().LowerCase() == `japan` && GetVersion() >= 502)
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
	int iRandom = Random(886602);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(	0	){	itemDesc = `id:51003 count:1~3`; iCumRate += 	300000	;} //	생명력 50포션	33.83705428
			case(	1	){	itemDesc = `id:51001 count:1~3`; iCumRate += 	100000	;} //	생명력 10포션	11.27901809
			case(	2	){	itemDesc = `id:51007 count:1~3`; iCumRate += 	50000	;} //	마나 30 포션	5.639509047
			case(	3	){	itemDesc = `id:51008 count:1~3`; iCumRate += 	50000	;} //	마나 50 포션	5.639509047
			case(	4	){	itemDesc = `id:64507`; iCumRate += 	50000	;} //	탐험 일지 2페이지	5.639509047
			case(	5	){	itemDesc = `id:53004`; iCumRate += 	40000	;} //	흙피리	4.511607238
			case(	6	){	itemDesc = `id:64509`; iCumRate += 	10000	;} //	탐험 일지 4페이지	1.127901809
			case(	7	){	itemDesc = `id:40006`; iCumRate += 	10000	;} //	단검	1.127901809
			case(	8	){	itemDesc = `id:40003`; iCumRate += 	10000	;} //	@숏 보우	1.127901809
			case(	9	){	itemDesc = `id:40005`; iCumRate += 	8000	;} //	@숏 소드	0.902321448
			case(	10	){	itemDesc = `id:40010`; iCumRate += 	8000	;} //	@롱 소드	0.902321448
			case(	11	){	itemDesc = `id:62005 count:1 prefix:20108`; iCumRate += 	7500	;} //		0.845926357
			case(	12	){	itemDesc = `id:62005 count:1 prefix:20304`; iCumRate += 	7500	;} //		0.845926357
			case(	13	){	itemDesc = `id:62005 count:1 prefix:20505`; iCumRate += 	7500	;} //		0.845926357
			case(	14	){	itemDesc = `id:62005 count:1 prefix:20209`; iCumRate += 	7500	;} //		0.845926357
			case(	15	){	itemDesc = `id:62005 count:1 prefix:20409`; iCumRate += 	7500	;} //		0.845926357
			case(	16	){	itemDesc = `id:62005 count:1 prefix:20615`; iCumRate += 	7500	;} //		0.845926357
			case(	17	){	itemDesc = `id:62005 count:1 prefix:20109`; iCumRate += 	7500	;} //		0.845926357
			case(	18	){	itemDesc = `id:62005 count:1 prefix:20210`; iCumRate += 	7500	;} //		0.845926357
			case(	19	){	itemDesc = `id:62005 count:1 prefix:20305`; iCumRate += 	7500	;} //		0.845926357
			case(	20	){	itemDesc = `id:62005 count:1 prefix:20110`; iCumRate += 	7500	;} //		0.845926357
			case(	21	){	itemDesc = `id:62005 count:1 prefix:20306`; iCumRate += 	7500	;} //		0.845926357
			case(	22	){	itemDesc = `id:62005 count:1 prefix:20506`; iCumRate += 	7500	;} //		0.845926357
			case(	23	){	itemDesc = `id:62005 count:1 prefix:20211`; iCumRate += 	7500	;} //		0.845926357
			case(	24	){	itemDesc = `id:62005 count:1 prefix:20410`; iCumRate += 	7500	;} //		0.845926357
			case(	25	){	itemDesc = `id:62005 count:1 prefix:20616`; iCumRate += 	7500	;} //		0.845926357
			case(	26	){	itemDesc = `id:62005 count:1 prefix:20411`; iCumRate += 	7500	;} //		0.845926357
			case(	27	){	itemDesc = `id:62005 count:1 prefix:20507`; iCumRate += 	7500	;} //		0.845926357
			case(	28	){	itemDesc = `id:62005 count:1 prefix:20617`; iCumRate += 	7500	;} //		0.845926357
			case(	29	){	itemDesc = `id:62005 count:1 prefix:20508`; iCumRate += 	7500	;} //		0.845926357
			case(	30	){	itemDesc = `id:62005 count:1 prefix:20618`; iCumRate += 	7500	;} //		0.845926357
			case(	31	){	itemDesc = `id:62005 count:1 prefix:20718`; iCumRate += 	7500	;} //		0.845926357
			case(	32	){	itemDesc = `id:62005 count:1 prefix:20212`; iCumRate += 	7500	;} //		0.845926357
			case(	33	){	itemDesc = `id:62005 count:1 prefix:20412`; iCumRate += 	7500	;} //		0.845926357
			case(	34	){	itemDesc = `id:62005 count:1 prefix:20619`; iCumRate += 	7500	;} //		0.845926357
			case(	35	){	itemDesc = `id:40013`; iCumRate += 	6000	;} //	@롱 보우	0.676741086
			case(	36	){	itemDesc = `id:46001`; iCumRate += 	5000	;} //	@라운드 실드	0.563950905
			case(	37	){	itemDesc = `id:40011`; iCumRate += 	5000	;} //	@브로드 소드	0.563950905
			case(	38	){	itemDesc = `id:40083`; iCumRate += 	4000	;} //	@훅 커틀러스	0.451160724
			case(	39	){	itemDesc = `id:17505`; iCumRate += 	4000	;} //	@플레이트 부츠	0.451160724
			case(	40	){	itemDesc = `id:17506`; iCumRate += 	4000	;} //	@롱그리브 부츠	0.451160724
			case(	41	){	itemDesc = `id:40031`; iCumRate += 	3400	;} //	석궁	0.383486615
			case(	42	){	itemDesc = `id:40081`; iCumRate += 	3000	;} //	@레더 롱 보우	0.338370543
			case(	43	){	itemDesc = `id:18504`; iCumRate += 	2800	;} //	@크로스 풀 헬름	0.315812507
			case(	44	){	itemDesc = `id:18505`; iCumRate += 	2800	;} //	@스파이크 헬름	0.315812507
			case(	45	){	itemDesc = `id:18506`; iCumRate += 	2800	;} //	@윙 하프 헬름	0.315812507
			case(	46	){	itemDesc = `id:18503`; iCumRate += 	2600	;} //	@퀴러시어 헬름	0.29325447
			case(	47	){	itemDesc = `id:16504`; iCumRate += 	2000	;} //	카운터 건틀렛	0.225580362
			case(	48	){	itemDesc = `id:16505`; iCumRate += 	2000	;} //	플루트 건틀렛	0.225580362
			case(	49	){	itemDesc = `id:40014`; iCumRate += 	2000	;} //	@콤포짓 보우	0.225580362
			case(	50	){	itemDesc = `id:40016`; iCumRate += 	2000	;} //	@해머	0.225580362
			case(	51	){	itemDesc = `id:40030`; iCumRate += 	2000	;} //	@투 핸디드 소드	0.225580362
			case(	52	){	itemDesc = `id:40078`; iCumRate += 	2000	;} //	@비펜니스	0.225580362
			case(	53	){	itemDesc = `id:40079`; iCumRate += 	2000	;} //	@메이스	0.225580362
			case(	54	){	itemDesc = `id:40080`; iCumRate += 	2000	;} //	@글라디우스	0.225580362
			case(	55	){	itemDesc = `id:40015`; iCumRate += 	1800	;} //	@플루트 숏 소드	0.203022326
			case(	56	){	itemDesc = `id:40012`; iCumRate += 	1800	;} //	@바스타드 소드	0.203022326
			case(	57	){	itemDesc = `id:40033`; iCumRate += 	1800	;} //	@클레이모어	0.203022326
			case(	58	){	itemDesc = `id:40038`; iCumRate += 	800	;} //	@라이트닝 원드	0.090232145
			case(	59	){	itemDesc = `id:40039`; iCumRate += 	800	;} //	@아이스 원드	0.090232145
			case(	60	){	itemDesc = `id:40040`; iCumRate += 	800	;} //	@파이어 원드	0.090232145
			case(	61	){	itemDesc = `id:14008`; iCumRate += 	800	;} //	풀세트 가죽 갑옷	0.090232145
			case(	62	){	itemDesc = `id:13035`; iCumRate += 	200	;} //	라이트 멜카 체인메일	0.022558036
			case(	63	){	itemDesc = `id:13036`; iCumRate += 	200	;} //	라이트 라운드 폴드론 체인메일	0.022558036
			case(	64	){	itemDesc = `id:13037`; iCumRate += 	200	;} //	라이트 서코트 체인메일	0.022558036
			case(	65	){	itemDesc = `id:13043 c1:c00010`; iCumRate += 	1	;} //	성월의 갑옷	0.00011279
			case(	66	){	itemDesc = `id:13044 c1:c00010`; iCumRate += 	1	;} //	성월의갑옷 여	0.00011279

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
	int iRandom = Random(28876);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `MaskGoblin:1`; iCumRate += 2000;} //6.926167059
			case(1){RaceDesc = `FighterSlate:1`; iCumRate += 2000;} //6.926167059
			case(2){RaceDesc = `MaskGoblin:2`; iCumRate += 1800;} //6.233550353
			case(3){RaceDesc = `FighterSlate:2`; iCumRate += 1800;} //6.233550353
			case(4){RaceDesc = `MaskGoblin2:2 `; iCumRate += 1200;} //4.155700235
			case(5){RaceDesc = `MaskGoblin2:1`; iCumRate += 1200;} //4.155700235
			case(6){RaceDesc = `MaskGoblin:1, MaskGolbin2:1, MaskGoblinArcher:1`; iCumRate += 1000;} //3.46308353
			case(7){RaceDesc = `MaskGoblin2:2, MaskGoblinArcher:1`; iCumRate += 1000;} //3.46308353
			case(8){RaceDesc = `MaskGoblin:2`; iCumRate += 1000;} //3.46308353
			case(9){RaceDesc = `FighterSlate:2, ArcherSlate:1`; iCumRate += 1000;} //3.46308353
			case(10){RaceDesc = `FighterSlate:2, ArcherSlate:1`; iCumRate += 1000;} //3.46308353
			case(11){RaceDesc = `ArcherSlate:2`; iCumRate += 1000;} //3.46308353
			case(12){RaceDesc = `ArcherSlate:2`; iCumRate += 1000;} //3.46308353
			case(13){RaceDesc = `ArcherSlate:3`; iCumRate += 1000;} //3.46308353
			case(14){RaceDesc = `PotSpider:2`; iCumRate += 1000;} //3.46308353
			case(15){RaceDesc = `MaskGoblinArcher:2`; iCumRate += 800;} //2.770466824
			case(16){RaceDesc = `MaskGoblinArcher:1, MaskGoblin2:1`; iCumRate += 800;} //2.770466824
			case(17){RaceDesc = `MaskGoblinArcher:2`; iCumRate += 800;} //2.770466824
			case(18){RaceDesc = `MaskGoblinArcher:1, MaskGoblin2:1`; iCumRate += 800;} //2.770466824
			case(19){RaceDesc = `FighterSlate:4,  ArcherSlate:2`; iCumRate += 800;} //2.770466824
			case(20){RaceDesc = `MaskGoblin:4`; iCumRate += 700;} //2.424158471
			case(21){RaceDesc = `FighterSlate:4`; iCumRate += 700;} //2.424158471
			case(22){RaceDesc = `PotSpider:3`; iCumRate += 700;} //2.424158471
			case(23){RaceDesc = `MaskGoblin2:4`; iCumRate += 600;} //2.077850118
			case(24){RaceDesc = `MaskGoblin2:2`; iCumRate += 600;} //2.077850118
			case(25){RaceDesc = `MaskGoblinArcher:1`; iCumRate += 500;} //1.731541765
			case(26){RaceDesc = `MaskGoblin:2, MaskGolbin2:2, MaskGoblinArcher:2`; iCumRate += 500;} //1.731541765
			case(27){RaceDesc = `MaskGoblin2:4, MaskGoblinArcher:2`; iCumRate += 500;} //1.731541765
			case(28){RaceDesc = `PotSpider:4`; iCumRate += 500;} //1.731541765
			case(29){RaceDesc = `MaskGoblinArcher:1`; iCumRate += 500;} //1.731541765
			case(30){RaceDesc = `StoneImp:1`; iCumRate += 50;} //0.173154176
			case(31){RaceDesc = `StoneImp:2`; iCumRate += 25;} //0.086577088
			case(32){RaceDesc = `Golem:1`; iCumRate += 1;} //0.003463084
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