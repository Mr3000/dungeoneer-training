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
	// 드래곤 가챠폰
	int itemID = cItem.GetClassId();
	// 컬렉션 북을 가져온다.
	object_list cItemList;
	cItemList = player.GetItemList(1584);
	item cItem2;
	cItem2 = (item)cItemList.GetValue(0);

	if (GetLocale().LowerCase() == `china`)
	{
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
		{	//자르딘의 유물
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(100);	//확률의 총합을 적는다
			if (iRandom <10)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					player.DoStript(`additemex(id:51089 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					player.DoStript(`additemex(id:51093 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					player.DoStript(`additemex(id:51091 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					player.DoStript(`additemex(id:51092 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					player.DoStript(`additemex(id:51088 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					player.DoStript(`additemex(id:51090 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					player.DoStript(`additemex(id:51096 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					player.DoStript(`additemex(id:51095 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					player.DoStript(`additemex(id:51094 rewardview:true)`);
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
						}
					}
				}			
			}
			else if (iRandom <33)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:1~3 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:1~4 rewardview:true)`);
						}
					}
				}			
			}
			bLivingGachaphonGived2 = true;
		}
			// 인게임 아이템
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(3203);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:15595 `; iCumRate +=5;} //0.156103653고원민족 전통 의상 (남성용)高原民族??衣服 (男式)
					case(1){itemString = `id:15594 `; iCumRate +=5;} //0.156103653고원민족 전통 의상 (여성용)高原民族??衣服 (女式)
					case(2){itemString = `id:18312 `; iCumRate +=10;} //0.312207306고원민족 전통 모자 (남성용)高原民族??帽子 (男式)
					case(3){itemString = `id:18313 `; iCumRate +=10;} //0.312207306고원민족 전통 모자 (여성용)高原民族??帽子 (女式)
					case(4){itemString = `id:17231 `; iCumRate +=10;} //0.312207306고원민족 신발 (남성용))高原民族鞋子 (男式))
					case(5){itemString = `id:17232 `; iCumRate +=10;} //0.312207306고원민족 신발 (여성용)高原民族鞋子 (女式)
					case(6){itemString = `id:14039 prefix:21106 suffix:30901`; iCumRate +=3;} //0.093662192차이나 드래곤 아머(인간)?方??（人?）
					case(7){itemString = `id:14040 prefix:21106 suffix:30901`; iCumRate +=3;} //0.093662192차이나 드래곤 아머(엘프)?方??（精?）
					case(8){itemString = `id:14041 prefix:21106 suffix:30901`; iCumRate +=3;} //0.093662192차이나 드래곤 아머(자이언트)?方??（巨人）
					case(9){itemString = `id:16532 prefix:21106 suffix:30901`; iCumRate +=2;} //0.062441461차이나 드래곤 건틀렛(인간)?方??手（人?）
					case(10){itemString = `id:16533 prefix:21106 suffix:30901`; iCumRate +=2;} //0.062441461차이나 드래곤 건틀렛(자이언트)?方??手（巨人）
					case(11){itemString = `id:16535 prefix:21106 suffix:30901`; iCumRate +=2;} //0.062441461차이나 드래곤 건틀렛(엘프)?方??手（精?）
					case(12){itemString = `id:17095 prefix:21106 suffix:30901`; iCumRate +=1;} //0.031220731차이나 드래곤 부츠?方?靴
					case(13){itemString = `id:18552 prefix:21106 suffix:30901`; iCumRate +=1;} //0.031220731차이나 드래곤 헬름?方??
					case(14){itemString = `id:18553 prefix:21106 suffix:30901`; iCumRate +=1;} //0.031220731차이나 드래곤 헬름(엘프)?方??（精??用）
					case(15){itemString = `id:62000 `; iCumRate +=5;} //0.156103653고대 마법 가루 古代魔法粉
					case(16){itemString = `id:15325 `; iCumRate +=3;} //0.093662192박쥐 자켓 (남성용)Gamyu`s Bat Jacket for Men(暗夜?族男?)
					case(17){itemString = `id:15326 `; iCumRate +=3;} //0.093662192박쥐 드레스 (여성용)Gamyu`s Bat Dress for Women(暗夜?族女?)
					case(18){itemString = `id:14047 `; iCumRate +=3;} //0.093662192불꽃 문양 레더 아머 (남성용)火花?皮革?甲(男)
					case(19){itemString = `id:14048 `; iCumRate +=3;} //0.093662192불꽃 문양 레더 아머 (여성용)火花?皮革?甲(女)
					case(20){itemString = `id:14049 `; iCumRate +=3;} //0.093662192야만적인 여우 갑옷 (남성용)野?狐狸?甲 (男性用)
					case(21){itemString = `id:14050 `; iCumRate +=3;} //0.093662192야만적인 여우 갑옷 (여성용)野?狐狸?甲 (女性用)
					case(22){itemString = `id:15315 `; iCumRate +=3;} //0.093662192아스틴 댄디 수트活?花花公子套?
					case(23){itemString = `id:15314 `; iCumRate +=3;} //0.093662192비앙카 윙 볼레로Bianca Wing Bolero
					case(24){itemString = `id:15294 col1:83317370 col2:83317370 c템l3:83317370`; iCumRate +=3;} //0.093662192남성용 수영복泳?女
					case(25){itemString = `id:15295 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.093662192여성용 수영복泳?男
					case(26){itemString = `id:18187 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.093662192커다란 리본大蝴蝶?
					case(27){itemString = `id:18188 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.093662192안대?眼眼?
					case(28){itemString = `id:18189 col1:83317370 col2:83317370 col3:83317370`; iCumRate +=3;} //0.093662192카우보이 모자牛仔帽
					case(29){itemString = `id:17132 `; iCumRate +=3;} //0.093662192박쥐 부츠Gamyu`s Bat Boots(暗夜?族短靴)
					case(30){itemString = `id:18566 `; iCumRate +=3;} //0.093662192박쥐 모자Gamyu`s Bat Cap(暗夜?族?帽)
					case(31){itemString = `id:18559 `; iCumRate +=3;} //0.093662192불꽃 문양 레더 캡火花?皮革帽
					case(32){itemString = `id:18227 `; iCumRate +=3;} //0.093662192아스틴 캡活?的帽子
					case(33){itemString = `id:18226 `; iCumRate +=3;} //0.093662192비앙카 캡Bianca Cap
					case(34){itemString = `id:15079 `; iCumRate +=3;} //0.093662192볼레로 앤 점퍼 스커트精致小坎肩套裙
					case(35){itemString = `id:15222 `; iCumRate +=3;} //0.093662192그레이스 숄 드레스(여성용)葛???裙（女性用）
					case(36){itemString = `id:15250 `; iCumRate +=3;} //0.093662192메이드 의상 쇼트 타입女??（短）
					case(37){itemString = `id:15251 `; iCumRate +=3;} //0.093662192메이드 의상 롱 타입女??（?）
					case(38){itemString = `id:15252 `; iCumRate +=3;} //0.093662192집사 의상男??
					case(39){itemString = `id:16046 `; iCumRate +=3;} //0.093662192고양이 손 장갑猫手套
					case(40){itemString = `id:16054 `; iCumRate +=5;} //0.156103653불꽃 문양 레더 글러브火花?皮革手套
					case(41){itemString = `id:16053 `; iCumRate +=5;} //0.156103653아스틴 글러브活?的手套
					case(42){itemString = `id:16052 `; iCumRate +=5;} //0.156103653비앙카 롱 글러브Bianca Long Glove
					case(43){itemString = `id:18176 `; iCumRate +=5;} //0.156103653메이드 머리띠女???
					case(44){itemString = `id:15419 `; iCumRate +=7;} //0.218545114에메랄드 켈틱 패턴 수트(남성용)翡翠??特式衣服（男式）
					case(45){itemString = `id:15420 `; iCumRate +=7;} //0.218545114에메랄드 켈틱 패턴 수트(여성용)翡翠??特式衣服（女式）
					case(46){itemString = `id:15233 `; iCumRate +=5;} //0.156103653엘레건트 고딕 드레스耶?特高??衣裙
					case(47){itemString = `id:15234 `; iCumRate +=5;} //0.156103653엘레건트 고딕 슈트耶?特高?套?
					case(48){itemString = `id:15235 `; iCumRate +=5;} //0.156103653엘레건트 고딕 드레스耶?特高??衣裙
					case(49){itemString = `id:17106 `; iCumRate +=10;} //0.312207306인간/엘프 남성용 한복 신발人?/精?男式?服 鞋子
					case(50){itemString = `id:17107 `; iCumRate +=10;} //0.312207306인간/엘프 여성용 한복 신발人?/精?女式?服 鞋子
					case(51){itemString = `id:17108 `; iCumRate +=10;} //0.312207306자이언트 남성용 한복 신발巨人男式?服 鞋子
					case(52){itemString = `id:17109 `; iCumRate +=10;} //0.312207306자이언트 여성용 한복 신발巨人女式?服 鞋子
					case(53){itemString = `id:15179 `; iCumRate +=10;} //0.312207306대만 전통 무술 복장台???武?服?
					case(54){itemString = `id:17075 `; iCumRate +=10;} //0.312207306대만 무술 전통 신발台?武???鞋子
					case(55){itemString = `id:18248 `; iCumRate +=10;} //0.312207306에메랄드 켈틱 패턴 모자??石??特式帽子
					case(56){itemString = `id:18249 `; iCumRate +=10;} //0.312207306에메랄드 켈틱 패턴 헤어밴드??石??特式??
					case(57){itemString = `id:17162 `; iCumRate +=10;} //0.312207306에메랄드 켈틱 패턴 신발??石??特式鞋子
					case(58){itemString = `id:17163 `; iCumRate +=10;} //0.312207306에메랄드 켈틱 패턴 부츠??石??特式靴子
					case(59){itemString = `id:15189 `; iCumRate +=10;} //0.312207306고대 동양식 전통의복(남성용)古代?方??服?(男式)
					case(60){itemString = `id:15190 `; iCumRate +=10;} //0.312207306동양식 전통의복(여성용)?方??服?(女式)
					case(61){itemString = `id:13010  suffix:30613`; iCumRate +=7;} //0.218545114라운드 폴드론 체인메일?形?甲
					case(62){itemString = `id:13022 suffix:30613`; iCumRate +=7;} //0.218545114로즈 플레이트 아머 (P타입)硬皮甲 (P?型)
					case(63){itemString = `id:13031 suffix:30613`; iCumRate +=7;} //0.218545114스파이카 실버 플레이트 아머?光金??甲
					case(64){itemString = `id:13032 suffix:31401`; iCumRate +=7;} //0.218545114발렌시아 크로스 라인 플레이트 아머(여성용)巴?斯???十字?（女性用）
					case(65){itemString = `id:13033 suffix:31401`; iCumRate +=7;} //0.218545114발렌시아 크로스 라인 플레이트 아머(남성용)巴?斯???十字?（男性用）
					case(66){itemString = `id:14025 suffix:30515`; iCumRate +=7;} //0.218545114카멜 스피리트 아머(남성용)??意念?甲(男性用)
					case(67){itemString = `id:14026 suffix:30515`; iCumRate +=7;} //0.218545114카멜 스피리트 아머(여성용)??意念?甲(女性用)
					case(68){itemString = `id:14036 suffix:30613`; iCumRate +=7;} //0.218545114티오즈 아머(남성용)迪?斯?甲(男性用)
					case(69){itemString = `id:14037 suffix:30613`; iCumRate +=7;} //0.218545114티오즈 아머(여성용)迪?斯?甲(女性用)
					case(70){itemString = `id:16028  suffix:30601`; iCumRate +=7;} //0.218545114카멜 스피리트 글러브??意念手套
					case(71){itemString = `id:16511  suffix:30601`; iCumRate +=7;} //0.218545114실버 티니 글러브?光手套
					case(72){itemString = `id:16521  suffix:30902`; iCumRate +=7;} //0.218545114발렌시아 크로스 라인 플레이트 건틀렛巴?斯???十字手套
					case(73){itemString = `id:16531 suffix:30601`; iCumRate +=7;} //0.218545114티오즈 건틀렛迪?斯手套
					case(74){itemString = `id:17064  suffix:30601`; iCumRate +=7;} //0.218545114카멜 스피리트 부츠??意念靴子
					case(75){itemString = `id:17510 suffix:30601`; iCumRate +=7;} //0.218545114스파이카 실버 플레이트 부츠?光金?鞋
					case(76){itemString = `id:17514 suffix:30902`; iCumRate +=7;} //0.218545114발렌시아 크로스 라인 플레이트 부츠巴?斯???十字?靴
					case(77){itemString = `id:17523 suffix:30601`; iCumRate +=7;} //0.218545114티오즈 그리브迪?斯?靴
					case(78){itemString = `id:18518 suffix:30601`; iCumRate +=7;} //0.218545114드래곤 크레스트配?金???
					case(79){itemString = `id:16513 `; iCumRate +=20;} //0.624414611剪子手套
					case(80){itemString = `id:16514 `; iCumRate +=20;} //0.624414611石?手套
					case(81){itemString = `id:16515 `; iCumRate +=20;} //0.624414611布手套
					case(82){itemString = `id:16516 `; iCumRate +=20;} //0.624414611?成手套
					case(83){itemString = `id:16517 `; iCumRate +=20;} //0.624414611反?手套
					case(84){itemString = `id:16518 `; iCumRate +=20;} //0.624414611?戒手套
					case(85){itemString = `id:16519 `; iCumRate +=20;} //0.624414611超豪?手套
					case(86){itemString = `id:18541 `; iCumRate +=20;} //0.624414611??假?
					case(87){itemString = `id:18542 `; iCumRate +=20;} //0.624414611巨??
					case(88){itemString = `id:18543 `; iCumRate +=20;} //0.624414611完整的巨??
					case(89){itemString = `id:18544 `; iCumRate +=20;} //0.624414611?士金?巨??
					case(90){itemString = `id:18545 `; iCumRate +=20;} //0.624414611?美的??
					case(91){itemString = `id:18546 `; iCumRate +=20;} //0.624414611??曼勇士??
					case(92){itemString = `id:18547 `; iCumRate +=20;} //0.624414611巨羽毛??
					case(93){itemString = `id:18548 `; iCumRate +=5;} //0.156103653德斯?武士??
					case(94){itemString = `id:18549 `; iCumRate +=5;} //0.156103653??士??
					case(95){itemString = `id:18550 `; iCumRate +=20;} //0.624414611???士??
					case(96){itemString = `id:18554 `; iCumRate +=5;} //0.156103653破?的德斯汀?武士??
					case(97){itemString = `id:18555 `; iCumRate +=5;} //0.156103653破?的??士??
					case(98){itemString = `id:18580 `; iCumRate +=20;} //0.624414611羽翼??
					case(99){itemString = `id:19005 `; iCumRate +=25;} //0.780518264머플러 로브神秘?袍
					case(100){itemString = `id:19007 `; iCumRate +=25;} //0.780518264야광 머플러 로브夜光?袍
					case(101){itemString = `id:19020 `; iCumRate +=25;} //0.780518264나타네 설산용 코트娜塔?雪山用外套
					case(102){itemString = `id:19029 `; iCumRate +=25;} //0.780518264자이언트 베어 로브巨人???袍
					case(103){itemString = `id:19034 `; iCumRate +=25;} //0.780518264가르텐 클로스 오버코트精致羽毛?袍
					case(104){itemString = `id:40011 prefix:20701`; iCumRate +=25;} //0.780518264브로드 소드??
					case(105){itemString = `id:40012 prefix:20701`; iCumRate +=25;} //0.780518264바스타드 소드?形?
					case(106){itemString = `id:40014 prefix:20701`; iCumRate +=25;} //0.780518264콤포짓 보우?合弓
					case(107){itemString = `id:40015 prefix:20701`; iCumRate +=25;} //0.780518264플루트 숏 소드?凹槽的短?
					case(108){itemString = `id:40030 prefix:20701`; iCumRate +=25;} //0.780518264투 핸디드 소드?手?
					case(109){itemString = `id:40031 prefix:20701`; iCumRate +=25;} //0.780518264석궁弩
					case(110){itemString = `id:40038 prefix:20701`; iCumRate +=25;} //0.780518264라이트닝 원드雷箭魔杖
					case(111){itemString = `id:40039 prefix:20701`; iCumRate +=25;} //0.780518264아이스 원드?箭魔杖
					case(112){itemString = `id:40040 prefix:20701`; iCumRate +=25;} //0.780518264파이어 원드火箭魔杖
					case(113){itemString = `id:40041 prefix:20701`; iCumRate +=25;} //0.780518264타격용 원드打?用魔杖
					case(114){itemString = `id:40079 prefix:20701`; iCumRate +=25;} //0.780518264메이스?杖
					case(115){itemString = `id:40081 prefix:20701`; iCumRate +=25;} //0.780518264롱 보우?弓
					case(116){itemString = `id:40081 prefix:20701`; iCumRate +=25;} //0.780518264레더 롱 보우皮制?弓
					case(117){itemString = `id:40090 prefix:20701`; iCumRate +=25;} //0.780518264힐링 원드治?魔杖
					case(118){itemString = `id:40172 prefix:20701`; iCumRate +=25;} //0.780518264그레이트 소드巨?
					case(119){itemString = `id:40174 prefix:20701`; iCumRate +=25;} //0.780518264모닝스타??
					case(120){itemString = `id:40177  prefix:20701`; iCumRate +=25;} //0.780518264워리어 액스?柄巨斧
					case(121){itemString = `id:40180  prefix:20701`; iCumRate +=25;} //0.780518264홉네일 너클??拳套
					case(122){itemString = `id:18096 `; iCumRate +=20;} //0.624414611??猫面具
					case(123){itemString = `id:18097 `; iCumRate +=20;} //0.624414611??羽翼面具
					case(124){itemString = `id:18098 `; iCumRate +=20;} //0.624414611??眼?
					case(125){itemString = `id:18099 `; iCumRate +=20;} //0.624414611??小翅膀面具
					case(126){itemString = `id:18100 `; iCumRate +=20;} //0.624414611??翅膀面具
					case(127){itemString = `id:18101 `; iCumRate +=20;} //0.624414611????面具
					case(128){itemString = `id:18102 `; iCumRate +=20;} //0.624414611??面具
					case(129){itemString = `id:52038 `; iCumRate +=20;} //0.624414611普??1次性重?甲改造券
					case(130){itemString = `id:65051 `; iCumRate +=5;} //0.156103653法利阿斯碎片
					case(131){itemString = `id:65013 count:5`; iCumRate +=20;} //0.624414611바위 골렘이 담긴 결정岩石巨人?晶
					case(132){itemString = `id:65014 count:5`; iCumRate +=20;} //0.624414611숲 골렘이 담긴 결정森林石巨人?晶
					case(133){itemString = `id:65015 count:5`; iCumRate +=20;} //0.624414611유황 골렘이 담긴 결정硫?石巨人?晶
					case(134){itemString = `id:65016 count:5`; iCumRate +=20;} //0.624414611순백의 골렘이 담긴 결정?白石巨人?晶
					case(135){itemString = `id:65009 count:10`; iCumRate +=20;} //0.624414611라이프 드레인 결정吸取生命?晶
					case(136){itemString = `id:65010 count:10`; iCumRate +=20;} //0.624414611방호벽을 시전할 때 필요한 결정.???晶
					case(137){itemString = `id:65029 count:5`; iCumRate +=20;} //0.624414611阿拉特?晶
					case(138){itemString = `id:65030 count:10`; iCumRate +=20;} //0.624414611低?魔法保存石
					case(139){itemString = `id:65031 count:10`; iCumRate +=20;} //0.624414611中?魔法保存石
					case(140){itemString = `id:65032 count:10`; iCumRate +=20;} //0.624414611高?魔法保存石
					case(141){itemString = `id:65045 count:10`; iCumRate +=20;} //0.624414611云?晶
					case(142){itemString = `id:65046 count:50`; iCumRate +=20;} //0.624414611?暴?晶
					case(143){itemString = `id:60054 count:5`; iCumRate +=20;} //0.624414611木板
					case(144){itemString = `id:60050 count:10`; iCumRate +=20;} //0.624414611??的?
					case(145){itemString = `id:60051 count:10`; iCumRate +=20;} //0.624414611??的?子
					case(146){itemString = `id:60058 count:5`; iCumRate +=20;} //0.624414611拉巴?子
					case(147){itemString = `id:60029 count:10`; iCumRate +=20;} //0.624414611高?皮?
					case(148){itemString = `id:60030 count:10`; iCumRate +=20;} //0.624414611最高?皮?
					case(149){itemString = `id:60021 count:10`; iCumRate +=20;} //0.624414611高?布料
					case(150){itemString = `id:60022 count:10`; iCumRate +=20;} //0.624414611最高?布料
					case(151){itemString = `id:60025 count:10`; iCumRate +=20;} //0.624414611高?皮革
					case(152){itemString = `id:60026 count:10`; iCumRate +=20;} //0.624414611最高?皮革
					case(153){itemString = `id:85040 count:2`; iCumRate +=50;} //1.561036528力量?糖
					case(154){itemString = `id:85041 count:2`; iCumRate +=50;} //1.561036528敏捷曲奇巧克力
					case(155){itemString = `id:85042 count:2`; iCumRate +=50;} //1.561036528智力棒棒糖
					case(156){itemString = `id:85043 count:2`; iCumRate +=50;} //1.561036528意志慕斯蛋?
					case(157){itemString = `id:85044 count:2`; iCumRate +=50;} //1.561036528幸?妙芙
					case(158){itemString = `id:85063 count:3 quality:99 appraise_explore_exp:9000`; iCumRate +=20;} //0.624414611大象雕像
					case(159){itemString = `id:85064 count:3 quality:99 appraise_explore_exp:11000`; iCumRate +=20;} //0.624414611?雕像
					case(160){itemString = `id:85065 count:3 quality:99 appraise_explore_exp:13000`; iCumRate +=20;} //0.624414611日晷?物
					case(161){itemString = `id:55035 `; iCumRate +=20;} //0.624414611石像野牛的?雕像
					case(162){itemString = `id:55041 `; iCumRate +=20;} //0.624414611石像犬的?光雕像
					case(163){itemString = `id:55048 `; iCumRate +=20;} //0.624414611石像蛇神的?光雕像
					case(164){itemString = `id:55049 `; iCumRate +=20;} //0.624414611石像小鬼的?光雕像
					case(165){itemString = `id:55061 `; iCumRate +=20;} //0.624414611?光大?蜘蛛的雕像
					case(166){itemString = `id:55068 `; iCumRate +=20;} //0.624414611?光石像翼魔的雕像
					case(167){itemString = `id:63158 `; iCumRate +=20;} //0.624414611雪花?晶
					case(168){itemString = `id:62005 prefix:20413`; iCumRate +=5;} //0.156103653Angular魔法?放卷?-有角的
					case(169){itemString = `id:62005 prefix:20915`; iCumRate +=5;} //0.156103653Cypress魔法?放卷?-?柏
					case(170){itemString = `id:62005 prefix:21105`; iCumRate +=5;} //0.156103653Principle魔法?放卷?-原理的
					case(171){itemString = `id:62005 prefix:21104`; iCumRate +=5;} //0.156103653Union魔法?放卷?-?合
					case(172){itemString = `id:62005 prefix:21202`; iCumRate +=5;} //0.156103653Marble魔法?放卷?-大理石
					case(173){itemString = `id:62005 suffix:30312`; iCumRate +=5;} //0.156103653Obsidian魔法?放卷?-黑曜石
					case(174){itemString = `id:62005 suffix:30913`; iCumRate +=5;} //0.156103653Oak魔法?放卷?-落??
					case(175){itemString = `id:62005 suffix:31014`; iCumRate +=5;} //0.156103653Abysmal魔法?放卷?-深海的
					case(176){itemString = `id:62005 suffix:31301`; iCumRate +=5;} //0.156103653Little Raccoon魔法?放卷?-小浣熊
					case(177){itemString = `id:62005 suffix:31401`; iCumRate +=5;} //0.156103653Avenger魔法?放卷?-?仇者
					case(178){itemString = `id:62005 prefix:20714`; iCumRate +=10;} //0.312207306SilverFox?狐狸
					case(179){itemString = `id:62005 prefix:21409`; iCumRate +=10;} //0.312207306Darkred Bear黑?熊
					case(180){itemString = `id:62005 prefix:20729`; iCumRate +=10;} //0.312207306Extraordinary非凡的
					case(181){itemString = `id:62005 prefix:20720`; iCumRate +=10;} //0.312207306Mirage海市蜃?
					case(182){itemString = `id:62005 prefix:20713`; iCumRate +=10;} //0.312207306Defensive自?的
					case(183){itemString = `id:62005 prefix:20824`; iCumRate +=10;} //0.312207306Musician's音?家的
					case(184){itemString = `id:62005 suffix:30722`; iCumRate +=10;} //0.312207306Lily黎?草
					case(185){itemString = `id:62005 suffix:30716`; iCumRate +=10;} //0.312207306Hindrance障碍的
					case(186){itemString = `id:62005 suffix:30819`; iCumRate +=10;} //0.312207306Peace和平的
					case(187){itemString = `id:62005 suffix:30827`; iCumRate +=10;} //0.312207306Hard Peaca硬皮?
					case(188){itemString = `id:62005 suffix:21406`; iCumRate +=10;} //0.312207306Colonel指?官
					case(189){itemString = `id:62005 suffix:30809`; iCumRate +=10;} //0.312207306Dark_Cross黑十字
					case(190){itemString = `id:62005 suffix:30813`; iCumRate +=10;} //0.312207306Inconvenience不便的
					case(191){itemString = `id:62005 prefix:20405`; iCumRate +=30;} //0.936621917거친魔法?放卷?-?狂的
					case(192){itemString = `id:62005 prefix:20508`; iCumRate +=30;} //0.936621917수상한魔法?放卷?-可疑的
					case(193){itemString = `id:62005 prefix:20602`; iCumRate +=30;} //0.936621917견고한魔法?放卷?-?固的
					case(194){itemString = `id:62005 prefix:20615`; iCumRate +=30;} //0.936621917사막거미魔法?放卷?-沙漠蜘蛛
					case(195){itemString = `id:62005 prefix:20619`; iCumRate +=30;} //0.936621917특이한魔法?放卷?-奇特的
					case(196){itemString = `id:62005 prefix:20701`; iCumRate +=30;} //0.936621917거센魔法?放卷?-猛烈的
					case(197){itemString = `id:62005 prefix:21003`; iCumRate +=30;} //0.936621917파멸의魔法?放卷?-毁?的
					case(198){itemString = `id:62005 suffix:30506`; iCumRate +=30;} //0.936621917매서운魔法?放卷?-可?的
					case(199){itemString = `id:62005 suffix:30614`; iCumRate +=30;} //0.936621917기운찬魔法?放卷?-充?力量的
					case(200){itemString = `id:62005 suffix:30616`; iCumRate +=30;} //0.936621917매정한魔法?放卷?-冷淡的
					case(201){itemString = `id:62005 suffix:30617`; iCumRate +=30;} //0.936621917무정한魔法?放卷?-无情的
					case(202){itemString = `id:62005 suffix:30618`; iCumRate +=30;} //0.936621917비참한魔法?放卷?-悲?的
					case(203){itemString = `id:62005 suffix:30704`; iCumRate +=30;} //0.936621917데들리魔法?放卷?-致命的
					case(204){itemString = `id:62005 suffix:30801`; iCumRate +=30;} //0.936621917네이쳐魔法?放卷?-天然
					case(205){itemString = `id:62005 suffix:30515`; iCumRate +=18;} //0.56197315해적의魔法?放卷?-海?的
					case(206){itemString = `id:62005 prefix:20505`; iCumRate +=18;} //0.56197315리자드魔法?放卷?-??
					case(207){itemString = `id:62005 prefix:21007`; iCumRate +=18;} //0.56197315히스魔法?放卷?-石南
					case(208){itemString = `id:62005 prefix:20625`; iCumRate +=18;} //0.56197315금속 바늘魔法?放卷?-金?
					case(209){itemString = `id:62005 suffix:30624`; iCumRate +=18;} //0.56197315산사나무魔法?放卷?-山??
					case(210){itemString = `id:62005 prefix:20721`; iCumRate +=18;} //0.56197315한가한魔法?放卷?-休?的
					case(211){itemString = `id:91034 `; iCumRate +=85;} //2.653762098경험치 증가 포션??增加?水
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
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
		if (!bLivingGachaphonGived2)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
		if (!bLivingGachaphonGived)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
	}
	if (GetLocale().LowerCase() == `taiwan`)
	{
		bool bLivingGachaphonGived2 = false;	//A그룹
		bool bLivingGachaphonGived = false;	//B그룹
		{	//자르딘의 유물
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(100);	//확률의 총합을 적는다
			if (iRandom <10)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					player.DoStript(`additemex(id:51089 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					player.DoStript(`additemex(id:51093 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					player.DoStript(`additemex(id:51091 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					player.DoStript(`additemex(id:51092 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					player.DoStript(`additemex(id:51088 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					player.DoStript(`additemex(id:51090 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					player.DoStript(`additemex(id:51096 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					player.DoStript(`additemex(id:51095 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					player.DoStript(`additemex(id:51094 rewardview:true)`);
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
						}
					}
				}			
			}
			else if (iRandom <33)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:1~3 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:1~4 rewardview:true)`);
						}
					}
				}			
			}
			bLivingGachaphonGived2 = true;
		}
			// 인게임 아이템
		{
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(266);	//확률의 총합을 적는다
			while(true)
			{
				bool bBreak = false;
				string itemString;
				switch(i)
				//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
				{
					// 여기다 넣으세요
					case(0){itemString = `id:13060 `; iCumRate += 1;} //0.37593985 드래곤 스케일 아머(여성용)
					case(1){itemString = `id:13061 `; iCumRate += 1;} //0.37593985 드래곤 스케일 아머 (남성용)
					case(2){itemString = `id:13062 `; iCumRate += 1;} //0.37593985 드래곤 스케일 아머(자이언트 여성용)
					case(3){itemString = `id:13063 `; iCumRate += 1;} //0.37593985 드래곤 스케일 아머(자이언트 남성용)
					case(4){itemString = `id:16543 `; iCumRate += 1;} //0.37593985 드래곤 스케일 건틀렛
					case(5){itemString = `id:16544 `; iCumRate += 1;} //0.37593985 드래곤 스케일 건틀렛(자이언트용)
					case(6){itemString = `id:17530 `; iCumRate += 1;} //0.37593985 드래곤 스케일 그리브
					case(7){itemString = `id:18577 `; iCumRate += 1;} //0.37593985 드래곤 스케일 헬름
					case(8){itemString = `id:15267 `; iCumRate += 2;} //0.751879699테라 고딕 풀 드레스
					case(9){itemString = `id:15362 `; iCumRate += 2;} //0.751879699테라 고딕 펑크 수트
					case(10){itemString = `id:19033 `; iCumRate += 2;} //0.751879699상어 로브
					case(11){itemString = `id:15405 `; iCumRate += 2;} //0.751879699엘리네드 패셔니스타 드레스
					case(12){itemString = `id:17039 `; iCumRate += 2;} //0.751879699코레스 큐트 리본 슈즈
					case(13){itemString = `id:13050 `; iCumRate += 2;} //0.751879699클라우스 나이트 아머
					case(14){itemString = `id:16551 `; iCumRate += 2;} //0.751879699클라우스 나이트 건틀렛
					case(15){itemString = `id:17534 `; iCumRate += 2;} //0.751879699클라우스 나이트 부츠
					case(16){itemString = `id:46010 `; iCumRate += 2;} //0.751879699 @드래곤 실드
					case(17){itemString = `id:18549 `; iCumRate += 5;} //1.879699248 @드래곤 펠릭스 헬름
					case(18){itemString = `id:15373 `; iCumRate += 5;} //1.879699248시스루 칵테일 드레스
					case(19){itemString = `id:18218 `; iCumRate += 5;} //1.879699248빈티지 애드미럴 모자(남성용)
					case(20){itemString = `id:18219 `; iCumRate += 5;} //1.879699248빈티지 애드미럴 모자(여성용)
					case(21){itemString = `id:17141 `; iCumRate += 5;} //1.879699248파이릿 우드워커 부츠
					case(22){itemString = `id:17154 `; iCumRate += 5;} //1.879699248프로퍼 스몰 코드 슈즈
					case(23){itemString = `id:18236 `; iCumRate += 5;} //1.879699248플레인 헤어밴드
					case(24){itemString = `id:17153 `; iCumRate += 5;} //1.879699248비비드 캐주얼 슈즈
					case(25){itemString = `id:18038 `; iCumRate += 5;} //1.879699248깃털 배렛 모자
					case(26){itemString = `id:18567 `; iCumRate += 5;} //1.879699248박쥐 모자
					case(27){itemString = `id:15573 `; iCumRate += 10;} //3.759398496클래식 커플 수트(여성용)
					case(28){itemString = `id:15184 `; iCumRate += 10;} //3.759398496테라 에이션트 패턴 웨어
					case(29){itemString = `id:15066 `; iCumRate += 10;} //3.759398496루이스 베스트 웨어
					case(30){itemString = `id:15099 `; iCumRate += 10;} //3.759398496비앙카 드로워즈 레이어드 스커트
					case(31){itemString = `id:19038 `; iCumRate += 10;} //3.759398496라바 캣 로브
					case(32){itemString = `id:19066 `; iCumRate += 10;} //3.759398496할로윈 호박 로브
					case(33){itemString = `id:15113 `; iCumRate += 10;} //3.759398496여성용 검사학교 교복 쇼트타입
					case(34){itemString = `id:17120 `; iCumRate += 10;} //3.759398496보니타 플룸 앵클 부츠
					case(35){itemString = `id:16136 `; iCumRate += 10;} //3.759398496아이언 피라미드 밴드
					case(36){itemString = `id:15374 `; iCumRate += 10;} //3.759398496샤이니 고딕 프릴 드레스
					case(37){itemString = `id:15136 `; iCumRate += 10;} //3.759398496고딕 레이스 스커트
					case(38){itemString = `id:14032 `; iCumRate += 10;} //3.759398496스티치 롱 로브 아머
					case(39){itemString = `id:18199 `; iCumRate += 10;} //3.759398496얇은테 안경
					case(40){itemString = `id:40095 `; iCumRate += 10;} //3.759398496 @드래곤 블레이드
					case(41){itemString = `id:85040 count:10`; iCumRate += 10;} //3.759398496체력의 젤리빈 10개
					case(42){itemString = `id:85041 count:10`; iCumRate += 10;} //3.759398496솜씨의 초코칩 쿠키 10개
					case(43){itemString = `id:85042 count:10`; iCumRate += 10;} //3.759398496지력의 막대 사탕 10개
					case(44){itemString = `id:85043 count:10`; iCumRate += 10;} //3.759398496의지의 쉬폰 케익 10개
					case(45){itemString = `id:85044 count:10`; iCumRate += 10;} //3.759398496행운의 머핀 10개
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
					player.DoStript(`additemex(`+itemString+` rewardview:true)`);
					if (itemString == `id:85040 count:10` || itemString == `id:85041 count:10` || itemString == `id:85042 count:10` || itemString == `id:85043 count:10` || itemString == `id:85044 count:10`)
					{
						int iRandom2 = Random(6);
						switch(iRandom2)
						{
							case(0)
							{
								player.DoStript(`additemex(id:85060 count:3 rewardview:true)`);
							}
							case(1)
							{
								player.DoStript(`additemex(id:85061 count:3 rewardview:true)`);
							}
							case(2)
							{
								player.DoStript(`additemex(id:85062 count:3 rewardview:true)`);
							}
							case(3)
							{
								player.DoStript(`additemex(id:85063 count:3 quality:99 appraise_explore_exp:9000 rewardview:true)`);
							}
							case(4)
							{
								player.DoStript(`additemex(id:85064 count:3 quality:99 appraise_explore_exp:13000 rewardview:true)`);
							}
							case(5)
							{
								player.DoStript(`additemex(id:85065 count:3 quality:99 appraise_explore_exp:11000 rewardview:true)`);
							}
						}				
					}
					bLivingGachaphonGived = true;
				}
				if (bLivingGachaphonGived)
				{
					break;
				}
					++i;
			}
		}
		if (!bLivingGachaphonGived2)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
		if (!bLivingGachaphonGived)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
	}
	else if (GetLocale().LowerCase() == `korea`)
	{
		bool bLivingGachaphonGived2 = false;	//A그룹
		bool bLivingGachaphonGived = false;	//B그룹
		{	//자르딘의 유물
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(100);	//확률의 총합을 적는다
			if (iRandom <10)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					player.DoStript(`additemex(id:51089 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					player.DoStript(`additemex(id:51093 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					player.DoStript(`additemex(id:51091 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					player.DoStript(`additemex(id:51092 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					player.DoStript(`additemex(id:51088 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					player.DoStript(`additemex(id:51090 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					player.DoStript(`additemex(id:51096 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					player.DoStript(`additemex(id:51095 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					player.DoStript(`additemex(id:51094 rewardview:true)`);
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
						}
					}
				}			
			}
			else if (iRandom <33)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:1~3 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:1~4 rewardview:true)`);
						}
					}
				}			
			}
			bLivingGachaphonGived2 = true;
		}
			// 인게임 아이템
		{
			string charName = player.GetDisplayName();
			int randomSetId = 1040;   // 고유 ID, RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);
			
			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
			bool announce_friendly = IsRandomItemNeedToAnnounceFriend(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);
			if (itemString == `id:85040 count:10` || itemString == `id:85041 count:10` || itemString == `id:85042 count:10` || itemString == `id:85043 count:10` || itemString == `id:85044 count:10`)
			{
				int iRandom2 = Random(6);
				switch(iRandom2)
				{
					case(0)
					{
						player.DoStript(`additemex(id:85060 count:3 rewardview:true)`);
					}
					case(1)
					{
						player.DoStript(`additemex(id:85061 count:3 rewardview:true)`);
					}
					case(2)
					{
						player.DoStript(`additemex(id:85062 count:3 rewardview:true)`);
					}
					case(3)
					{
						player.DoStript(`additemex(id:85063 count:3 quality:99 appraise_explore_exp:9000 rewardview:true)`);
					}
					case(4)
					{
						player.DoStript(`additemex(id:85064 count:3 quality:99 appraise_explore_exp:13000 rewardview:true)`);
					}
					case(5)
					{
						player.DoStript(`additemex(id:85065 count:3 quality:99 appraise_explore_exp:11000 rewardview:true)`);
					}
				}				
			}
			if (!newItem.IsNull())
			{
				string ItemName = newItem.GetFullLocalName();
				
				if (announce)
				{
					Announce(2, charName + ["event.item.item91251.1"]+ ItemName + ["event.item.item91251.2"]);	
				}
				
				if (announce_all)
				{
					AnnounceAllChannel(2, charName + ["event.item.item91251.3"]+ ItemName + ["event.item.item91251.4"]);	
				}
				if (announce_friendly)  // 지인 어나운스
				{
					AnnounceFriend(2, player, charName + ["event.item.item91251.5"]+ ItemName + ["event.item.item91251.6"]);				
				}
				bLivingGachaphonGived = true;
			}
		}

		if (!bLivingGachaphonGived2)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
		if (!bLivingGachaphonGived)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
	}
	else if (GetLocale().LowerCase() == `japan`)
	{
		bool bLivingGachaphonGived2 = false;	//A그룹
		bool bLivingGachaphonGived = false;	//B그룹
		{	//자르딘의 유물
			int iCumRate = 0; //확률을 누적해놓는 변수
			int i=0;
			int iRandom = Random(100);	//확률의 총합을 적는다
			
			if (iRandom <100) // 2010.12월 일본에서는 100%로 자르딘의 유물이 드랍되게 수정
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					// 2010.12월 일본에서는 드래곤의 뼈조각이 드랍되지 않게 수정.
					// player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					player.DoStript(`additemex(id:51089 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					player.DoStript(`additemex(id:51093 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					player.DoStript(`additemex(id:51091 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					player.DoStript(`additemex(id:51092 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					player.DoStript(`additemex(id:51088 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					player.DoStript(`additemex(id:51090 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					player.DoStript(`additemex(id:51096 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					player.DoStript(`additemex(id:51095 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					player.DoStript(`additemex(id:51094 rewardview:true)`);
				}
				else
				{
					int iRandom2 = Random(9);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						
						// 2010.12월 일본에서는 드래곤의 뼈조각이 드랍되지 않게 수정.
						/*case(9)
						{
							player.DoStript(`additemex(id:51097 count:2~4 rewardview:true)`);
						}*/
					}
				}			
			}

			// 2010.12월 일본에서는 100%로 자르딘의 유물이 드랍되게 수정  (수정되어 이 로직은 타지 않는다.)
			else if (iRandom <33)
			{
				if(!player.GetItemNoWithClassId (1584)>0)
				{
					player.DoStript(`additemex(id:1584 rewardview:true)`);
				}
				if(((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
				 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
				{
					player.DoStript(`additemex(id:51097 count:1~3 rewardview:true)`);
				}
				else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
				{
					int iRandom3 = Random(2);
					switch(iRandom3)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51097 count:1~2 rewardview:true)`);
						}
					}
				}
				else
				{
					int iRandom2 = Random(10);
					switch(iRandom2)
					{
						case(0)
						{
							player.DoStript(`additemex(id:51088 rewardview:true)`);
						}
						case(1)
						{
							player.DoStript(`additemex(id:51089 rewardview:true)`);
						}
						case(2)
						{
							player.DoStript(`additemex(id:51090 rewardview:true)`);
						}
						case(3)
						{
							player.DoStript(`additemex(id:51091 rewardview:true)`);
						}
						case(4)
						{
							player.DoStript(`additemex(id:51092 rewardview:true)`);
						}
						case(5)
						{
							player.DoStript(`additemex(id:51093 rewardview:true)`);
						}
						case(6)
						{
							player.DoStript(`additemex(id:51094 rewardview:true)`);
						}
						case(7)
						{
							player.DoStript(`additemex(id:51095 rewardview:true)`);
						}
						case(8)
						{
							player.DoStript(`additemex(id:51096 rewardview:true)`);
						}
						case(9)
						{
							player.DoStript(`additemex(id:51097 count:1~4 rewardview:true)`);
						}
					}
				}			
			}
			bLivingGachaphonGived2 = true;
		}
			// 인게임 아이템
		{
			string charName = player.GetDisplayName();
			int randomSetId = 1053;   // 고유 ID, RandomItemSet.xlsm에 기입
			int itemIndex = GetItemIndexFromRandomSet(randomSetId);
			
			string itemString = GetRandomItemDescWithIndex(randomSetId, itemIndex);
			bool announce = IsRandomItemNeedToAnnounceChannel(randomSetId, itemIndex);
			bool announce_all = IsRandomItemNeedToAnnounceAllChannel(randomSetId, itemIndex);
			bool announce_friendly = IsRandomItemNeedToAnnounceFriend(randomSetId, itemIndex);

			item newItem;
			newItem = player.AddItemEx(itemString, true);

			// 한국에서는 추가 보상으로 유물이나 크리스탈을 줬지만 일본에서는 다 뺀다.
	/*		if (itemString == `id:85040 count:10 gachapon:91251` || itemString == `id:85041 count:10 gachapon:91251` || itemString == `id:85042 count:10 gachapon:91251` || itemString == `id:85043 count:10 gachapon:91251` || itemString == `id:85044 count:10 gachapon:91251`)
			{
				int iRandom2 = Random(6);
				switch(iRandom2)
				{
					case(0)
					{
						player.DoStript(`additemex(id:85060 count:3 rewardview:true)`);
					}
					case(1)
					{
						player.DoStript(`additemex(id:85061 count:3 rewardview:true)`);
					}
					case(2)
					{
						player.DoStript(`additemex(id:85062 count:3 rewardview:true)`);
					}
					case(3)
					{
						player.DoStript(`additemex(id:85063 count:3 quality:99 appraise_explore_exp:9000 rewardview:true)`);
					}
					case(4)
					{
						player.DoStript(`additemex(id:85064 count:3 quality:99 appraise_explore_exp:13000 rewardview:true)`);
					}
					case(5)
					{
						player.DoStript(`additemex(id:85065 count:3 quality:99 appraise_explore_exp:11000 rewardview:true)`);
					}
				}				
			}  */
			if (!newItem.IsNull())
			{
				string ItemName = newItem.GetFullLocalName();
				
				if (announce)
				{
					Announce(2, charName + ["event.item.item91251.1"]+ ItemName + ["event.item.item91251.2"]);	
				}
				
				if (announce_all)
				{
					AnnounceAllChannel(2, charName + ["event.item.item91251.3"]+ ItemName + ["event.item.item91251.4"]);	
				}
				if (announce_friendly)  // 지인 어나운스
				{
					AnnounceFriend(2, player, charName + ["event.item.item91251.5"]+ ItemName + ["event.item.item91251.6"]);				
				}
				bLivingGachaphonGived = true;
			}
		}

		if (!bLivingGachaphonGived2)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
		if (!bLivingGachaphonGived)
		{
			player.DoStript(`additemex(id:40022 rewardview:true)`);
		}
	}
}