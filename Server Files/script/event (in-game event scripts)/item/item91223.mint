////////////////////////////////////////////////////////////////////////////////
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
	// 아머 가챠폰
	int itemID = cItem.GetClassId();
	// 중국의 경우
	bool bCashGachaphonGived = false;	//캐시
	bool bLivingGachaphonGived2 = false;	//A그룹
	bool bLivingGachaphonGived = false;	//B그룹
	{
	// 중국의 경우
	// 중국 생활 가차폰은 캐시가차폰과 생활 가차폰을 동시에 준다.
	// 캐시 가차폰
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		meta_array itemArray;
		while(true)
		{
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0) {iCumRate +=	9;}
				case(1) {iCumRate += 9;}
				case(2) {iCumRate += 11;}
				case(3) {iCumRate +=	9;}
				case(4) {iCumRate +=	9;}
				case(5) {iCumRate +=	11;}
				case(6) {iCumRate +=	13;}
				case(7) {iCumRate +=	9;}
				case(8) {iCumRate += 11;}
				case(9) {iCumRate +=	4;}
				case(10) {	iCumRate += 5;}
			}
			if (iRandom < iCumRate)
			{
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0)	// 	
					{
						itemString = `id:91002 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91001 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(1) //	 
					{
						itemString = `id:91004 expire:43200 count:9`;
						itemArray.Add(itemString);
						itemString = `id:91003 expire:43200 count:8`;
						itemArray.Add(itemString);
					}
					case(2) //
					{
						itemString = `id:63064 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63074 count:6`;
						itemArray.Add(itemString);
						itemString = `id:63075 count:6`;
						itemArray.Add(itemString);
					}
					case(3) //
					{
						itemString = `id:63026 count:9`;
						itemArray.Add(itemString);
						itemString = `id:63047 count:8`;
						itemArray.Add(itemString);
					}
					case(4) //
					{
						itemString = `id:63043 count:7`;
						itemArray.Add(itemString);
						itemString = `id:63044 count:5`;
						itemArray.Add(itemString);
					}
					case(5) //
					{
						itemString = `id:63027 expire:10080`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:63029 count:9`;
						itemArray.Add(itemString);
					}
					case(6) //
					{
						itemString = `id:91007 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91006 expire:43200`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(7) //
					{
						itemString = `id:63025 count:2`;
						itemArray.Add(itemString);
						itemString = `id:91005 expire:43200`;
						// 번들이 아니기 때문에 따로 3개 지급
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(8) //
					{
						itemString = `id:51031 count:5`;
						itemArray.Add(itemString);
						itemString = `id:63024 expire:10080`;
						// 번들이 아니기 때문에 따로 2개 지급
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
					case(9) //
					{
						itemString = `id:91066`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91067`;
						itemArray.Add(itemString);
					}
					case(10) //	4.0000000000 	100	완전 회복의 포션
					{
						itemString = `id:91059`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
						itemString = `id:91063`;
						itemArray.Add(itemString);
						itemArray.Add(itemString);
					}
				}
				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemString = (string)itemArray.Get(j);
					DebugOut(`유저에게 `+itemString+` 를 줌`);
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
			}
				bCashGachaphonGived = true;
			}
			if (bCashGachaphonGived)
			{
				break;
			}
			++i;
		}
	}
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		if (iRandom < 11)
		{
			player.DoStript(`additemex(id:85048 quality:99 appraise_explore_exp:9000 rewardview:true)`);
		}
		else if (iRandom < 22)
		{
			player.DoStript(`additemex(id:85049 quality:99 appraise_explore_exp:11000 rewardview:true)`);
		}
		else if (iRandom <33)
		{
			player.DoStript(`additemex(id:85050 quality:99 appraise_explore_exp:13000 rewardview:true)`);
		}
		bLivingGachaphonGived2 = true;
	}
		// 아머 가차폰
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(27742);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15568 col1:000000 col2:000000 col3:000000`; iCumRate += 2;} //0.007209286블랙 서큐버스의 옷
				case(1){itemString = `id:15569 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 2;} //0.007209286레드 서큐버스의 옷
				case(2){itemString = `id:18293 col1:000000 col2:000000 col3:000000`; iCumRate += 9;} //0.032441785블랙 서큐버스 모자
				case(3){itemString = `id:18294 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 9;} //0.032441785레드 서큐버스 모자
				case(4){itemString = `id:17216 col1:000000 col2:000000 col3:000000`; iCumRate += 3;} //0.010813928블랙 서큐버스의 부츠
				case(5){itemString = `id:17217 col1:800010 col2:ff90a0 col3:400005 `; iCumRate += 3;} //0.010813928레드 서큐버스의 부츠
				case(6){itemString = `id:15486 col1:FF90FF`; iCumRate += 3;} //0.010813928서큐버스 전대의 옷
				case(7){itemString = `id:18300 col1:FF90FF`; iCumRate += 9;} //0.032441785서큐버스 전대의 모자
				case(8){itemString = `id:17222 col1:FF90FF`; iCumRate += 3;} //0.010813928서큐버스 전대의 부츠
				case(9){itemString = `id:16067 col1:FF90FF`; iCumRate += 9;} //0.032441785서큐버스 전대의 장갑
				case(10){itemString = `id:15550 `; iCumRate += 10;} //0.036046428엘라하 의상
				case(11){itemString = `id:18316 `; iCumRate += 10;} //0.036046428엘라하 뿔
				case(12){itemString = `id:17552 `; iCumRate += 10;} //0.036046428엘라하의 부츠
				case(13){itemString = `id:40171  `; iCumRate += 40;} //0.144185711마사무네
				case(14){itemString = `id:40193  `; iCumRate += 40;} //0.144185711무라마사
				case(15){itemString = `id:40195  `; iCumRate += 40;} //0.144185711요시미츠
				case(16){itemString = `id:40170  `; iCumRate += 40;} //0.144185711장도
				case(17){itemString = `id:40192  `; iCumRate += 40;} //0.144185711치는 것 칼
				case(18){itemString = `id:40194  `; iCumRate += 40;} //0.144185711호신용 단도
				case(19){itemString = `id:15602 `; iCumRate += 40;} //0.144185711레이모어 의상
				case(20){itemString = `id:19084 `; iCumRate += 40;} //0.144185711도렌 로브
				case(21){itemString = `id:15601 `; iCumRate += 40;} //0.144185711케이 의상
				case(22){itemString = `id:46021 `; iCumRate += 500;} //1.80232139판의 방패
				case(23){itemString = `id:19125 `; iCumRate += 500;} //1.80232139데브캣 고양이 모자
				case(24){itemString = `id:18178 `; iCumRate += 500;} //1.80232139데브캣 귀마개
				case(25){itemString = `id:17237 `; iCumRate += 500;} //1.80232139도렌 신발
				case(26){itemString = `id:17236 `; iCumRate += 500;} //1.80232139레이모어 신발
				case(27){itemString = `id:17235 `; iCumRate += 500;} //1.80232139케이 신발
				case(28){itemString = `id:14045 `; iCumRate += 500;} //1.80232139소라 갑옷(여성용)
				case(29){itemString = `id:14046 `; iCumRate += 500;} //1.80232139소라 갑옷(남성용)
				case(30){itemString = `id:14127 `; iCumRate += 500;} //1.80232139타라 돌격 보병 갑옷 (남성용)
				case(31){itemString = `id:14128 `; iCumRate += 500;} //1.80232139타라 돌격 보병 갑옷 (여성용)
				case(32){itemString = `id:14129 `; iCumRate += 500;} //1.80232139타라 돌격 보병 갑옷 (자이언트 남성용)
				case(33){itemString = `id:14130 `; iCumRate += 500;} //1.80232139타라 돌격 보병 갑옷 (자이언트 여성용)
				case(34){itemString = `id:46024 `; iCumRate += 500;} //1.80232139콤포짓 실드
				case(35){itemString = `id:46011 `; iCumRate += 500;} //1.80232139귀갑 방패
				case(36){itemString = `id:46012`; iCumRate += 500;} //1.80232139청동 방패
				case(37){itemString = `id:14023  `; iCumRate += 500;} //1.80232139뼈 해양 아모(남성용)
				case(38){itemString = `id:14024  `; iCumRate += 500;} //1.80232139뼈 해양 아모(여성용)
				case(39){itemString = `id:18556 `; iCumRate += 500;} //1.80232139소라 투구(여성용)
				case(40){itemString = `id:18558 `; iCumRate += 500;} //1.80232139소라 투구(남성용)
				case(41){itemString = `id:16540 `; iCumRate += 500;} //1.80232139소라 건틀렛
				case(42){itemString = `id:17127 `; iCumRate += 500;} //1.80232139소라 부츠(여성용)
				case(43){itemString = `id:17129 `; iCumRate += 500;} //1.80232139소라 부츠(남성용)
				case(44){itemString = `id:18653 `; iCumRate += 500;} //1.80232139타라 돌격 보병 투구 (남성용)
				case(45){itemString = `id:18654 `; iCumRate += 500;} //1.80232139타라 돌격 보병 투구 (여성용)
				case(46){itemString = `id:18655 `; iCumRate += 500;} //1.80232139타라 돌격 보병 투구 (자이언트 남성용)
				case(47){itemString = `id:18656 `; iCumRate += 500;} //1.80232139타라 돌격 보병 투구 (자이언트 여성용)
				case(48){itemString = `id:16138 `; iCumRate += 500;} //1.80232139타라 돌격 보병 글러브 (남성용)
				case(49){itemString = `id:16139 `; iCumRate += 500;} //1.80232139타라 돌격 보병 글러브 (여성용)
				case(50){itemString = `id:16140 `; iCumRate += 500;} //1.80232139타라 돌격 보병 글러브 (자이언트 남성용)
				case(51){itemString = `id:16141 `; iCumRate += 500;} //1.80232139타라 돌격 보병 글러브 (자이언트 여성용)
				case(52){itemString = `id:17208 `; iCumRate += 500;} //1.80232139타라 돌격 보병 부츠 (남성용)
				case(53){itemString = `id:17209 `; iCumRate += 500;} //1.80232139타라 돌격 보병 부츠 (여성용)
				case(54){itemString = `id:17210 `; iCumRate += 500;} //1.80232139타라 돌격 보병 부츠 (자이언트 남성용)
				case(55){itemString = `id:17211 `; iCumRate += 500;} //1.80232139타라 돌격 보병 부츠 (자이언트 여성용)
				case(56){itemString = `id:63218 `; iCumRate += 500;} //1.802321395주년 기념 폭죽(한국)
				case(57){itemString = `id:50389 `; iCumRate += 500;} //1.802321393주년 기념 케이크
				case(58){itemString = `id:63095 `; iCumRate += 500;} //1.802321393주년 기념 불꽃놀이 키트
				case(59){itemString = `id:18105 `; iCumRate += 800;} //2.8837142241주년 기념 별 장식 미니 모자
				case(60){itemString = `id:19045 `; iCumRate += 800;} //2.883714224어린이날 기념 로브(남성용)
				case(61){itemString = `id:19046 `; iCumRate += 800;} //2.883714224어린이날 기념 로브(여성용)
				case(62){itemString = `id:18561 `; iCumRate += 800;} //2.8837142243주년 기념 몬거 모자
				case(63){itemString = `id:15440 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비웨어(인간 남)
				case(64){itemString = `id:15441 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비웨어(인간녀)
				case(65){itemString = `id:15442 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비웨어(자이언트 남)
				case(66){itemString = `id:15443 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비웨어(자이언트 여)
				case(67){itemString = `id:17195 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비부츠(남자)
				case(68){itemString = `id:17196 `; iCumRate += 800;} //2.8837142244주년 프리미엄 뉴비부츠(여자)
				case(69){itemString = `id:19052 `; iCumRate += 800;} //2.8837142244주년 기념 로브(한국)
				// 여기다 넣으세요의 끝
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
				DebugOut(`유저에게 `+itemString+` 를 줌`);
//				GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				bLivingGachaphonGived = true;
			}
			if (bLivingGachaphonGived)
			{
				break;
			}
				++i;
		}
	}
		// 캐시 가차폰을 못받았다.
	if (!bCashGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived2)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
	if (!bLivingGachaphonGived)
	{
//		GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40022 rewardview:true)`);
	}
}