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

 // 중국 A그룹, B그룹 나눈 스크립트 잠시 보류
{
	// 아머 가챠폰
	int itemID = cItem.GetClassId();

//	string charName = player.GetDisplayName();

	string charName = player.GetProtectiveName();

	bool bCashGachaphonGived = false;	//탐험 유물
	bool bLivingGachaphonGived2 = false;	//A그룹
	bool bLivingGachaphonGived = false;	//B그룹

	bool bLivingGachaphonGivedAmple = false;	//지염그룹

	// 유물 세트
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:85063 quality:99 appraise_explore_exp:10000`; iCumRate +=40;} //40% 코끼리 조각상(12레벨)
				case(1){itemString = `id:85065 quality:99 appraise_explore_exp:19000`; iCumRate +=33;} //33% 해시계 유물(14레벨)
				case(2){itemString = `id:85064 quality:99 appraise_explore_exp:25000`; iCumRate +=27;} //27% 드래곤 조각상(15레벨)
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
				bCashGachaphonGived = true;
			}
			if (bCashGachaphonGived)
			{
				break;
			}
				++i;
		}
	}

	// 지염 세트
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(200);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:63030 col1:61000f22`; iCumRate +=5;} //2.43902439빤짝이 지염백색
				case(1){itemString = `id:63030 col1:61000800`; iCumRate +=5;} //2.43902439빤짝이 지염검정
				case(2){itemString = `id:63030 col1:6100f4fa`; iCumRate +=5;} //2.43902439빤짝이 지염노랑
				case(3){itemString = `id:63030 col1:61001e08`; iCumRate +=5;} //2.43902439빤짝이 지염회색,회보라
				case(4){itemString = `id:63030 col1:61009495`; iCumRate +=5;} //2.43902439빤짝이 지염보라,갈색
				case(5){itemString = `id:63030 col1:6100b808`; iCumRate +=5;} //2.43902439빤짝이 지염진회색->레드
				case(6){itemString = `id:63030 col1:86708461`; iCumRate +=5;} //2.43902439빤짝이 지염녹색
				case(7){itemString = `id:63030 col1:8640eff5`; iCumRate +=5;} //2.43902439빤짝이 지염노랑
				case(8){itemString = `id:63030 col1:6f10a513`; iCumRate +=5;} //2.43902439빤짝이 지염연보라->연노랑
				case(9){itemString = `id:63030 col1:864097f6`; iCumRate +=5;} //2.43902439빤짝이 지염개나리색->상큼한보라
				case(10){itemString = `id:63030 col1:6140b02a`; iCumRate +=5;} //2.43902439빤짝이 지염군청색->초록빛섞인하늘색
				case(11){itemString = `id:63030 col1:680094df`; iCumRate +=5;} //4.87804878빤짝이 지염핫핑크->어두운붉은색
				case(12){itemString = `id:63030 col1:557A7C`; iCumRate +=10;} //4.87804878지염
				case(13){itemString = `id:63030 col1:317D61`; iCumRate +=10;} //4.87804878지염
				case(14){itemString = `id:63030 col1:FFFFFF`; iCumRate +=10;} //4.87804878지염
				case(15){itemString = `id:63030 col1:000000`; iCumRate +=10;} //4.87804878지염
				case(16){itemString = `id:63030 col1:8C9697`; iCumRate +=10;} //4.87804878지염
				case(17){itemString = `id:63030 col1:DFDCDD`; iCumRate +=10;} //4.87804878지염
				case(18){itemString = `id:63030 col1:A01340`; iCumRate +=10;} //4.87804878지염
				case(19){itemString = `id:63030 col1:79B49F`; iCumRate +=10;} //4.87804878지염
				case(20){itemString = `id:63030 col1:36C72F`; iCumRate +=10;} //4.87804878지염
				case(21){itemString = `id:63030 col1:98E294`; iCumRate +=10;} //4.87804878지염
				case(22){itemString = `id:63030 col1:4E7070`; iCumRate +=10;} //4.87804878지염
				case(23){itemString = `id:63030 col1:AC79AE`; iCumRate +=10;} //4.87804878지염
				case(24){itemString = `id:63030 col1:06B5DB`; iCumRate +=10;} //4.87804878지염
				case(25){itemString = `id:63030 col1:9F56A2`; iCumRate +=10;} //4.87804878지염
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
				bLivingGachaphonGivedAmple = true;
			}
			if (bLivingGachaphonGivedAmple)
			{
				break;
			}
				++i;
		}

	//	player.ShowCaption(" "+ToString(iRandom)+" "+ToString(iCumRate), 3000);

	}

	// 추가 프리미엄 가챠폰 
	// 2010/09/15 논의 결과 포함하지 않음
	/*
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(100);	//확률의 총합을 적는다
		string desc;
		// 어떤 아이템을 줄 것인지 결정

		if (iRandom < 5)
		{
			player.DoStript(`additemex(id:91197 rewardview:true)`);			
			bLivingGachaphonGived2 = true;
		}
		else if (iRandom < 9)
		{
			player.DoStript(`additemex(id:91197 count:2 rewardview:true)`);			
			bLivingGachaphonGived2 = true;
		}
		else
		{
			bLivingGachaphonGived2 = true;
		}
	}
	*/
		// 프리미엄 가챠폰
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(597);	//확률의 총합을 적는다
		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15550`; iCumRate +=3;} //0.495049505엘라하의 옷
				case(1){itemString = `id:18316`; iCumRate +=3;} //0.495049505엘라하의 뿔
				case(2){itemString = `id:17552`; iCumRate +=3;} //0.495049505엘라하 부츠
				case(3){itemString = `id:15568 col1:000000 col2:000000 col3:000000`; iCumRate +=1;} //0.165016502블랙 서큐버스의 옷
				case(4){itemString = `id:15569 col1:800010 col2:ff90a0 col3:400005`; iCumRate +=1;} //0.165016502레드 서큐버스의 옷
				case(5){itemString = `id:18293 col1:000000 col2:000000 col3:000000`; iCumRate +=1;} //0.165016502@블랙 서큐버스 모자
				case(6){itemString = `id:18294 col1:800010 col2:ff90a0 col3:400005`; iCumRate +=1;} //0.165016502@레드 서큐버스 모자
				case(7){itemString = `id:17216 col1:000000 col2:000000 col3:000000`; iCumRate +=1;} //0.165016502@블랙 서큐버스의 부츠
				case(8){itemString = `id:17217 col1:800010 col2:ff90a0 col3:400005`; iCumRate +=1;} //0.165016502@레드 서큐버스의 부츠
				case(9){itemString = `id:15486`; iCumRate +=1;} //0.165016502서큐버스 전대 의상
				case(10){itemString = `id:18300`; iCumRate +=1;} //0.165016502서큐버스 전대 모자
				case(11){itemString = `id:17222`; iCumRate +=1;} //0.165016502서큐버스 전대 부츠
				case(12){itemString = `id:16067`; iCumRate +=1;} //0.165016502서큐버스 전대 장갑
				case(13){itemString = `id:62005 prefix:20836 prefixexpire:0`; iCumRate +=7;} //1.155115512인챈트 스크롤
				case(14){itemString = `id:62005 suffix:30638 suffixexpire:0`; iCumRate +=7;} //1.155115512인챈트 스크롤
				case(15){itemString = `id:40345 quality:80`; iCumRate +=7;} //1.155115512@팔카타
				case(16){itemString = `id:40346 quality:80`; iCumRate +=7;} //1.155115512@하이랜더 클레이모어
				case(17){itemString = `id:40347 quality:80`; iCumRate +=7;} //1.155115512@하이랜더 롱 보우
				case(18){itemString = `id:40348 quality:80`; iCumRate +=7;} //1.155115512@프랑키스카
				case(19){itemString = `id:46027 quality:80`; iCumRate +=7;} //1.155115512@타지 실드
				case(20){itemString = `id:15377`; iCumRate +=9;} //1.485148515@로맨틱 고딕 수트
				case(21){itemString = `id:40969`; iCumRate +=9;} //1.485148515양산
				case(22){itemString = `id:15353`; iCumRate +=9;} //1.485148515천룡지의(여성용)
				case(23){itemString = `id:18187 col1:ff0000 col2:ff0000 col3:ff0000`; iCumRate +=9;} //1.485148515커다란 리본
				case(24){itemString = `id:40313`; iCumRate +=9;} //1.485148515참룡검
				case(25){itemString = `id:18199`; iCumRate +=9;} //1.485148515얇은테 안경
				case(26){itemString = `id:18575`; iCumRate +=9;} //1.485148515@플라워 코사주
				case(27){itemString = `id:18297`; iCumRate +=9;} //1.485148515튤립 머리띠
				case(28){itemString = `id:46024 quality:80`; iCumRate +=9;} //1.485148515콤포짓 실드
				case(29){itemString = `id:15555`; iCumRate +=7;} //1.155115512바날렌 여성용 예복
				case(30){itemString = `id:15235`; iCumRate +=21;} //3.465346535@엘레건트 고딕 드레스
				case(31){itemString = `id:15250`; iCumRate +=21;} //3.465346535메이드 의상 쇼트 타입
				case(32){itemString = `id:14033`; iCumRate +=15;} //2.475247525@테라 비라인 포어포인트 아머
				case(33){itemString = `id:13055`; iCumRate +=21;} //3.465346535@콜린 플레이트 아머
				case(34){itemString = `id:18216`; iCumRate +=15;} //2.475247525빈티지 볼륨 베레모
				case(35){itemString = `id:18233`; iCumRate +=15;} //2.475247525@아이리스 헤드드레스
				case(36){itemString = `id:15354`; iCumRate +=15;} //2.475247525@파이릿 캡틴 슈트
				case(37){itemString = `id:18554`; iCumRate +=15;} //2.475247525@빈티지 더스틴 실버 나이트 헬름
				case(38){itemString = `id:15191`; iCumRate +=15;} //2.475247525@키라 플로리 패턴 로브
				case(39){itemString = `id:15471`; iCumRate +=15;} //2.475247525투피스 오버올 셋트
				case(40){itemString = `id:18580`; iCumRate +=15;} //2.475247525날개 투구
				case(41){itemString = `id:40264 quality:80`; iCumRate +=15;} //2.475247525워 소드
				case(42){itemString = `id:15376`; iCumRate +=15;} //2.475247525@캐주얼 크로스 스티치 드레스
				case(43){itemString = `id:18266`; iCumRate +=15;} //2.475247525썸머 니트 캡
				case(44){itemString = `id:15374`; iCumRate +=15;} //2.475247525@샤이니 고딕 프릴 드레스
				case(45){itemString = `id:15267`; iCumRate +=21;} //3.465346535@테라 고딕 풀 드레스
				case(46){itemString = `id:18301`; iCumRate +=15;} //2.475247525호랑이 모자
				case(47){itemString = `id:15316`; iCumRate +=15;} //2.475247525@카리스 위자드 수트
				case(48){itemString = `id:53027`; iCumRate +=21;} //3.465346535사막 드래곤의 비늘
				case(49){itemString = `id:16058`; iCumRate +=21;} //3.465346535@펄 샤인 브레이슬렛
				case(50){itemString = `id:15258`; iCumRate +=21;} //3.465346535@베키 위치 드레스
				case(51){itemString = `id:15352`; iCumRate +=21;} //3.465346535천룡지의(남성용)
				case(52){itemString = `id:18213`; iCumRate +=21;} //3.465346535@보니타 트윈 리본
				case(53){itemString = `id:46014 quality:80`; iCumRate +=21;} //3.465346535@히터 실드
				case(54){itemString = `id:15381`; iCumRate +=21;} //3.465346535@댄디 고딕 케이프 수트

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
				item newItem;
				string ItemName;
//				player.DoStript(`additemex(`+itemString+` rewardview:true)`);
				newItem = player.AddItemEx(itemString, true);

				if (!newItem.IsNull())
				{
					if ( i <= 12)		// 고가의 아이템을 획득하면 어나운스를 쏴준다.
					{
						ItemName = newItem.GetFullLocalName();
						AnnounceAllChannel(2, ItemName +["event.item.item91197.1"]+charName+["event.item.item91197.2"]);	

					}
				}

				bLivingGachaphonGived = true;
				return;
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
//		GivePremiumGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40024 rewardview:true)`);
	}
	if (!bLivingGachaphonGived)
	{
//		GivePremiumGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
		player.DoStript(`additemex(id:40024 rewardview:true)`);
	}
}