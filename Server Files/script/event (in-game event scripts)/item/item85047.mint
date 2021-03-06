//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
		int itemID = cItem.GetClassId();
		string charName = player.GetDisplayName();
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(4597);	//확률의 총합을 적는다
		int jRandom = Random(3);	//확률의 총합을 적는다
		string DefItemString;
		int appraise_explore_exp;
		int appraise_gold;

		switch(jRandom)
		{
			case(0)		// 코끼리
			{
				appraise_explore_exp = 8000 + Random(2000);		// 평균 9000
//				appraise_gold = 400 + Random(200);		// 평균 500
				DefItemString = `id:85048 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
			}
			case(1)			// 해시계
			{
				appraise_explore_exp = 10000 + Random(2000);		// 평균 11000
//				appraise_gold = 700 + Random(200);		// 평균 800
				DefItemString = `id:85050 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
			}
			case(2)			// 드래곤
			{
				appraise_explore_exp = 12000 + Random(2000);		// 평균 13000
//				appraise_gold = 1000 + Random(200);		// 평균 1100
				DefItemString = `id:85049 quality:99 appraise_explore_exp:` + ToString(appraise_explore_exp);
			}
			default
			{
				DefItemString = `id:85048 quality:99 appraise_gold:3000 appraise_explore_exp:12000`;
			}
		}

		DebugOut(`유저에게 `+DefItemString+` 를 줌`);
		player.DoStript(`additemex(`+DefItemString+` rewardview:true)`);


		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case( 0 ){itemString = `id:46010    `; iCumRate += 2 ;} // 0.043506635 드래곤 실드  0.043506635
				case( 1 ){itemString = `id:17517   suffix:30827 `; iCumRate += 5 ;} // 0.108766587 하드페카 더스틴 실버 나이트 그리브  0.152273222
				case( 2 ){itemString = `id:17514   suffix:30827 `; iCumRate += 5 ;} // 0.108766587 하드페카 발렌시아 크로스라인 플레이트 부츠  0.261039809
				case( 3 ){itemString = `id:18549   prefix:20413 `; iCumRate += 5 ;} // 0.108766587 각진 드래곤 펠릭스 헬름  0.369806395
				case( 4 ){itemString = `id:18555   prefix:20413 `; iCumRate += 5 ;} // 0.108766587 각진 빈티지 드래곤 펠릭스 헬름  0.478572982
				case( 5 ){itemString = `id:40265   suffix:30921 quality:60 `; iCumRate += 5 ;} // 0.108766587 크로코다일 익스큐셔너스 소드  0.587339569
				case( 6 ){itemString = `id:40265   quality:60 `; iCumRate += 5 ;} // 0.108766587 익스큐셔너스 소드  0.696106156
				case( 7 ){itemString = `id:40264   quality:60 `; iCumRate += 5 ;} // 0.108766587 워 소드  0.804872743
				case( 8 ){itemString = `id:40226   quality:40 `; iCumRate += 5 ;} // 0.108766587 주시자의 검  0.91363933
				case( 9 ){itemString = `id:40225    `; iCumRate += 5 ;} // 0.108766587 윙 보우  1.022405917
				case( 10 ){itemString = `id:40241   quality:60 prefix:21411 suffix:30921 durability:18000 durability_max:18000 `; iCumRate += 5 ;} // 0.108766587 리치 크로코다일 더스틴 실버나이트 소드  1.131172504
				case( 11 ){itemString = `id:40033   quality:80 prefix:21411 suffix:30921 durability:17000 durability_max:17000 `; iCumRate += 5 ;} // 0.108766587 리치 크로코다일 클레이모어  1.239939091
				case( 12 ){itemString = `id:46024    `; iCumRate += 5 ;} // 0.108766587 콤포짓 실드  1.348705678
				case( 13 ){itemString = `id:40300   suffix:30921 quality:80 `; iCumRate += 10 ;} // 0.217533174 악어 레미니아 성월의 검  1.566238851
				case( 14 ){itemString = `id:40978   prefix:20917 quality:70`; iCumRate += 10 ;} // 0.217533174 글로리어스 크리스탈 숏 보우  1.783772025
				case( 15 ){itemString = `id:16524   suffix:30604 `; iCumRate += 10 ;} // 0.217533174 우아한 더스틴 실버나이트 뱀브레이스  2.001305199
				case( 16 ){itemString = `id:16539   suffix:30604 `; iCumRate += 5 ;} // 0.108766587 우아한 발렌시아 크로스라인 플레이트 건틀렛(자이언트)  2.110071786
				case( 17 ){itemString = `id:17517   suffix:30604 `; iCumRate += 10 ;} // 0.217533174 우아한 더스틴 실버나이트 그리브  2.32760496
				case( 18 ){itemString = `id:17514   suffix:30604 `; iCumRate += 10 ;} // 0.217533174 우아한 발렌시아 크로스라인 플레이트 부츠  2.545138134
				case( 19 ){itemString = `id:13038   prefix:20729 quality:70 `; iCumRate += 10 ;} // 0.217533174 비범한 더스틴 실버 나이트 아머 q70  2.762671307
				case( 20 ){itemString = `id:13052   prefix:20729 quality:70 `; iCumRate += 10 ;} // 0.217533174 비범한 발렌시아 아머(자이언트) 퀄리티 70  2.980204481
				case( 21 ){itemString = `id:17517   prefix:20824 `; iCumRate += 10 ;} // 0.217533174 음악가의 더스틴 실버나이트 그리브  3.197737655
				case( 22 ){itemString = `id:17514   prefix:20824 `; iCumRate += 10 ;} // 0.217533174 음악가의 발렌시아 크로스라인 플레이트 부츠  3.415270829
				case( 23 ){itemString = `id:40016   quality:80 prefix:20915 `; iCumRate += 10 ;} // 0.217533174 사이프러스 해머 q 80  3.632804003
				case( 24 ){itemString = `id:40243   quality:80 prefix:20915 suffix:31002 durability_max:17000 `; iCumRate += 10 ;} // 0.217533174 사이프러스 나이트 배틀 숏 소드 q80  3.850337176
				case( 25 ){itemString = `id:40233   suffix:31003 durability:14000 durability_max:14000 `; iCumRate += 10 ;} // 0.217533174 위자드 피닉스 파이어원드 내구 14  4.06787035
				case( 26 ){itemString = `id:40231   suffix:31003 durability:14000 durability_max:14000 `; iCumRate += 10 ;} // 0.217533174 위자드 크리스탈 라이트닝 원드 내구 14  4.285403524
				case( 27 ){itemString = `id:40232   suffix:31003 durability:14000 durability_max:14000 `; iCumRate += 10 ;} // 0.217533174 위자드 크라운 아이스 원드 내구 14  4.502936698
				case( 28 ){itemString = `id:40237   prefix:20917 suffix:31105 `; iCumRate += 10 ;} // 0.217533174 글로리어스 종려나무 엘븐 롱 보우  4.720469872
				case( 29 ){itemString = `id:15372   suffix:31304 `; iCumRate += 10 ;} // 0.217533174 스칼라 레이스 티어드 스커트  4.938003045
				case( 30 ){itemString = `id:15378   suffix:31304 `; iCumRate += 10 ;} // 0.217533174 스칼라 고딕 라이딩 수트   5.155536219
				case( 31 ){itemString = `id:46009   prefix:21403 suffix:21406 `; iCumRate += 10 ;} // 0.217533174 수호의 단장 주시자 방패  5.373069393
				case( 32 ){itemString = `id:40293    `; iCumRate += 10 ;} // 0.217533174 클레이모어(저스팅)  5.590602567
				case( 33 ){itemString = `id:40294    `; iCumRate += 10 ;} // 0.217533174 배틀소드(저스팅)  5.808135741
				case( 34 ){itemString = `id:40295    `; iCumRate += 10 ;} // 0.217533174 엘븐 롱 보우(저스팅)  6.025668915
				case( 35 ){itemString = `id:18549    `; iCumRate += 10 ;} // 0.217533174 드래곤 펠릭스 헬름  6.243202088
				case( 36 ){itemString = `id:13050    `; iCumRate += 10 ;} // 0.217533174 클라우스 나이트 아머  6.460735262
				case( 37 ){itemString = `id:17534    `; iCumRate += 10 ;} // 0.217533174 클라우스 나이트 부츠  6.678268436
				case( 38 ){itemString = `id:16551    `; iCumRate += 10 ;} // 0.217533174 클라우스 나이트 건틀렛  6.89580161
				case( 39 ){itemString = `id:17514    `; iCumRate += 30 ;} // 0.652599521 발렌시아 크로스라인 플레이트 부츠  7.548401131
				case( 40 ){itemString = `id:17517    `; iCumRate += 30 ;} // 0.652599521 더스틴 실버나이트 그리브  8.201000653
				case( 41 ){itemString = `id:46009    `; iCumRate += 30 ;} // 0.652599521 주시자의 방패  8.853600174
				case( 42 ){itemString = `id:40205    `; iCumRate += 30 ;} // 0.652599521 티카 나무 조련 지팡이  9.506199695
				case( 43 ){itemString = `id:19038    `; iCumRate += 30 ;} // 0.652599521 라바 캣 로브  10.15879922
				case( 44 ){itemString = `id:17520    `; iCumRate += 30 ;} // 0.652599521 큰 새 다리 부츠  10.81139874
				case( 45 ){itemString = `id:18550    `; iCumRate += 30 ;} // 0.652599521 번개 전사의 투구  11.46399826
				case( 46 ){itemString = `id:16526    `; iCumRate += 30 ;} // 0.652599521 뱀 건틀렛  12.11659778
				case( 47 ){itemString = `id:40224    `; iCumRate += 30 ;} // 0.652599521 링 보우  12.7691973
				case( 48 ){itemString = `id:53363    `; iCumRate += 70 ;} // 1.522732217 왕실 친위대 무기 개조권  14.29192952
				case( 49 ){itemString = `id:53364    `; iCumRate += 70 ;} // 1.522732217 백화점 개조 상품권  15.81466174
				case( 50 ){itemString = `id:62000    `; iCumRate += 70 ;} // 1.522732217 고대의 마법가루  17.33739395
				case( 51 ){itemString = `id:65048   count:1 `; iCumRate += 800 ;} // 17.4026539 마법 골렘의 결정  34.74004786
				case( 52 ){itemString = `id:85040   count:2 `; iCumRate += 800 ;} // 17.4026539 체력 음식  52.14270176
				case( 53 ){itemString = `id:85041   count:2 `; iCumRate += 800 ;} // 17.4026539 솜씨 음식  69.54535567
				case( 54 ){itemString = `id:85042   count:2 `; iCumRate += 600 ;} // 13.05199043 행운 음식  82.5973461
				case( 55 ){itemString = `id:85043   count:2 `; iCumRate += 400 ;} // 8.701326952 의지 음식  91.29867305
				case( 56 ){itemString = `id:85044   count:2 `; iCumRate += 400 ;} // 8.701326952 지력 음식  100

				// 여기다 넣으세요의 끝

				default
				{
					itemString = `id:65040`; iCumRate +=1000;
					bBreak = true;
				}
			}
			if (bBreak)
			{
				break;
			}

			if (iRandom < iCumRate)
			{
				DebugOut(`유저에게 `+itemString+` 를 줌`);
				item newItem;
				string ItemName;
//				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				newItem = player.AddItemEx(itemString, true);

				if (!newItem.IsNull())
				{
					if ( i <= 38)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
					{
						ItemName = newItem.GetFullLocalName();
						AnnounceAllChannel(2, charName + ["event.item.item85047.1"]+ ItemName + ["event.item.item85047.2"]);	
					}
				}
				else		// 임시 인벤토리까지 꽉 찼거나 해서 아이템 넣어주는 데 실패. 
				{
				}
				return;
			}
			++i;
		}
}
