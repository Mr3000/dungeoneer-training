////////////////////////////////////////////////////////////////////////////////
//																							Mabinogi Project Treasure Script
//																					 이리아 보물상자 (대만 2주년 이벤트)
//
//																				dochigun fecit, begins at 2007. 05. 23
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{
	_this.AddItem(GetCouponDesc());

	// 이벤트용 처리를 하기 전에 반드시 SetEventType()으로 어떤 이벤트용 상자인지
	// 명시를 해주어야 한다.
	// 명시해주지 않으면 기본값으로 'treasurehunting' 이벤트로 세팅된다.
	_this.SetEventType(`treasurehuntingtaiwan`);
	_this.AddEventItem(GetItemRewardDesc());

	_this.AddAnnounceItem(40170);	//	일본식 양손검								0.00099999
	_this.AddAnnounceItem(16022);	//	고양이 손										0.0199998
	_this.AddAnnounceItem(40200);	//	고양이 손모양 방망이				0.0199998
	_this.AddAnnounceItem(19003);	//	@스파이카 실버 플레이트 부츠0.0799992
	_this.AddAnnounceItem(46008);	//	@라이트 헤테로 카이트 실드	0.1499985
	_this.AddAnnounceItem(18044);	//	범죄용 복면									0.1499985
	_this.AddAnnounceItem(16519);	//	초호화 장갑									0.499995
	_this.AddAnnounceItem(40083);	//	@훅 커틀러스								0.499995

	// 상자를 잠근다.
	_this.Lock();
}
////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100001);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(	0	){itemDesc = `id:40170	`; iCumRate += 	1			;}	//	일본식 양손검								0.00099999
			case(	1	){itemDesc = `id:40200	`; iCumRate += 	20		;}	//	고양이 손모양 방망이				0.0199998
			case(	2	){itemDesc = `id:19003	`; iCumRate += 	80		;}	//	@스파이카 실버 플레이트 부츠0.0799992
			case(	3	){itemDesc = `id:46008	`; iCumRate += 	150		;}	//	@라이트 헤테로 카이트 실드	0.1499985
			case(	4	){itemDesc = `id:18044	`; iCumRate += 	150		;}	//	범죄용 복면									0.1499985
			case(	5	){itemDesc = `id:16519	`; iCumRate += 	500		;}	//	초호화 장갑									0.499995
			case(	6	){itemDesc = `id:40083	`; iCumRate += 	500		;}	//	@훅 커틀러스								0.499995
			case(	7	){itemDesc = `id:46006	`; iCumRate += 	4300	;}	//	@카이트 실드								4.299957
			case(	8	){itemDesc = `id:40079 prefix:20701`; iCumRate += 	4300	;}	//	거센 @메이스		4.299957
			case(	9	){itemDesc = `id:40049	`; iCumRate += 	4500	;}	//	플루트											4.499955
			case(	10){itemDesc = `id:40081	`; iCumRate += 	4500	;}	//	@레더 롱보우								4.499955
			case(	11){itemDesc = `id:40037	`; iCumRate += 	13000	;}	//	푸주칼											12.99987
			case(	12){itemDesc = `id:40031	`; iCumRate += 	13000	;}	//	석궁												12.99987
			case(	13){itemDesc = `id:40016	`; iCumRate += 	14000	;}	//	@해머												13.99986
			case(	14){itemDesc = `id:40012	`; iCumRate += 	14000	;}	//	@바스타드 소드							13.99986
			case(	15){itemDesc = `id:40010	`; iCumRate += 	13000	;}	//	@롱소드											12.99987
			case(	16){itemDesc = `id:40018	`; iCumRate += 	14000	;}	//	우쿨렐레										13.99986

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
server string GetCouponDesc()
// : 아이템 쿠폰을 결정 by dochigun
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
			case(	0	){itemDesc = `id:75147	`; iCumRate += 	13	;}	//	[m] 쿠폰
			case(	1	){itemDesc = `id:75148	`; iCumRate += 	12	;}	//	[a] 쿠폰
			case(	2	){itemDesc = `id:75149	`; iCumRate += 	13	;}	//	[b] 쿠폰
			case(	3	){itemDesc = `id:75150	`; iCumRate += 	12	;}	//	[i] 쿠폰
			case(	4	){itemDesc = `id:75151	`; iCumRate += 	5		;}	//	[n] 쿠폰
			case(	5	){itemDesc = `id:75152	`; iCumRate += 	20	;}	//	[o] 쿠폰
			case(	6	){itemDesc = `id:75153	`; iCumRate += 	10	;}	//	[g] 쿠폰
			case(	7	){itemDesc = `id:75154	`; iCumRate += 	15	;}	//	[i] 쿠폰

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
	return `id:51003 count:1`; //아이템이 안나왔다... 이럴리가 있나...
}