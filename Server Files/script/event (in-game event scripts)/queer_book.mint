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
server void QueerBook(character player)
// : 아이템에 아무 기능이 없으나
//  이상한 책의 정독에 성공했을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(253);	//확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:64530 suffix:40030`; iCumRate +=1;} //0.395256917파이어볼 10페이지
			case(1){itemString = `id:62005 suffix:30732`; iCumRate +=4;} //1.581027668수달 인챈트
			case(2){itemString = `id:62005 prefix:20735`; iCumRate +=4;} //1.581027668뜨거운 인챈트
			case(3){itemString = `id:62005 prefix:7`; iCumRate +=4;} //1.581027668폭스헌터 인챈트
			case(4){itemString = `id:62005 prefix:207`; iCumRate +=4;} //1.581027668폭스 인챈트
			case(5){itemString = `id:62005 prefix:21410 `; iCumRate +=4;} //1.581027668기울어진 인챈트
			case(6){itemString = `id:62005 suffix:30634`; iCumRate +=5;} //1.976284585물방울 인챈트
			case(7){itemString = `id:62005 prefix:21412`; iCumRate +=5;} //1.976284585칼라 인챈트
			case(8){itemString = `id:64521 suffix:40021`; iCumRate +=10;} //3.95256917파이어볼 1페이지
			case(9){itemString = `id:64522 suffix:40022`; iCumRate +=10;} //3.95256917파이어볼 2페이지
			case(10){itemString = `id:64523 suffix:40023`; iCumRate +=10;} //3.95256917파이어볼 3페이지
			case(11){itemString = `id:64524 suffix:40024`; iCumRate +=10;} //3.95256917파이어볼 4페이지
			case(12){itemString = `id:64525 suffix:40025`; iCumRate +=10;} //3.95256917파이어볼 5페이지
			case(13){itemString = `id:64526 suffix:40026`; iCumRate +=8;} //3.162055336파이어볼 6페이지
			case(14){itemString = `id:64527 suffix:40027`; iCumRate +=8;} //3.162055336파이어볼 7페이지
			case(15){itemString = `id:64528 suffix:40028`; iCumRate +=8;} //3.162055336파이어볼 8페이지
			case(16){itemString = `id:64529 suffix:40029`; iCumRate +=8;} //3.162055336파이어볼 9페이지
			case(17){itemString = `id:62005 suffix:30506`; iCumRate +=10;} //3.95256917매서운 인챈트
			case(18){itemString = `id:62005 prefix:201`; iCumRate +=10;} //3.95256917햄스터 인챈트
			case(19){itemString = `id:62005 prefix:1`; iCumRate +=10;} //3.95256917햄스터헌터 인챈트
			case(20){itemString = `id:62005 suffix:10605`; iCumRate +=10;} //3.95256917솔져 인챈트
			case(21){itemString = `id:62005 prefix:305`; iCumRate +=10;} //3.95256917파인 인챈트
			case(22){itemString = `id:62005 prefix:20501`; iCumRate +=10;} //3.95256917간편한 인챈트
			case(23){itemString = `id:64018 count:5`; iCumRate +=50;} //19.76284585종이
			case(24){itemString = `id:64051 count:5`; iCumRate +=30;} //11.85770751빤짝이 종이

			// 여기다 넣으세요의 끝

			default
			{
				itemString = `id:64051`; iCumRate +=1000;
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
