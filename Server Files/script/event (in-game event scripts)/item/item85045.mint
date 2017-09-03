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
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(2221);	//확률의 총합을 적는다

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요

				case(0){itemString = `id:15338 `; iCumRate +=3;} //0.135074291로맨틱 이브닝 드레스0.135074291
				case(1){itemString = `id:15339 `; iCumRate +=3;} //0.135074291로맨틱 테일 코트0.270148582
				case(2){itemString = `id:15306 `; iCumRate +=3;} //0.135074291트루디 빈티지 웨어0.405222873
				case(3){itemString = `id:15112 `; iCumRate +=3;} //0.135074291셀리나 스쿨보이룩0.540297163
				case(4){itemString = `id:15079 `; iCumRate +=3;} //0.135074291볼레로 앤 점퍼 스커트0.675371454
				case(5){itemString = `id:15233 `; iCumRate +=3;} //0.135074291앨러건트 고딕 드레스0.810445745
				case(6){itemString = `id:15234 `; iCumRate +=3;} //0.135074291앨러건트 고딕 슈트0.945520036
				case(7){itemString = `id:16047 `; iCumRate +=20;} //0.900495272보니타 실키 글러브1.846015308
				case(8){itemString = `id:16050 `; iCumRate +=20;} //0.900495272트루디 포버튼 글러브2.746510581
				case(9){itemString = `id:17120 `; iCumRate +=20;} //0.900495272보니타 플룸 앵클 부츠3.647005853
				case(10){itemString = `id:17121 `; iCumRate +=20;} //0.900495272트루디 슈즈4.547501126
				case(11){itemString = `id:18213 `; iCumRate +=20;} //0.900495272보니타 트윈 리본5.447996398
				case(12){itemString = `id:18214 `; iCumRate +=20;} //0.900495272트루디 빈티지 터번6.34849167
				case(13){itemString = `id:17135 `; iCumRate +=20;} //0.900495272에나멜 펌프스7.248986943
				case(14){itemString = `id:17136 `; iCumRate +=20;} //0.900495272클래식 슈즈8.149482215
				case(15){itemString = `id:16137 `; iCumRate +=20;} //0.900495272펄 샤인 브레이슬렛9.049977488
				case(16){itemString = `id:16136 `; iCumRate +=20;} //0.900495272아이언 피라미드 밴드9.95047276
				case(17){itemString = `id:65048 count:2 `; iCumRate +=500;} //22.51238181마법 골렘의 결정32.46285457
				case(18){itemString = `id:85040 count:3`; iCumRate +=300;} //13.50742909체력 음식45.97028366
				case(19){itemString = `id:85041 count:3`; iCumRate +=300;} //13.50742909솜씨 음식59.47771274
				case(20){itemString = `id:85042 count:3`; iCumRate +=300;} //13.50742909행운 음식72.98514183
				case(21){itemString = `id:85043 count:3`; iCumRate +=300;} //13.50742909의지 음식86.49257091
				case(22){itemString = `id:85044 count:3`; iCumRate +=300;} //13.50742909지력 음식100

				// 여기다 넣으세요의 끝

				default
				{
					itemString = `id:65048`; iCumRate +=1000;
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
				return;
			}

			++i;
		}
}
