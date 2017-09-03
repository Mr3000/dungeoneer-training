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
	//미국 무기 가차폰
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(200000);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString = `id:17128 `; iCumRate +=2;} //0.001카리스 위자드 슈즈
			case(1){itemString = `id:15316 `; iCumRate +=2;} //0.001카리스 위자드 수트
			case(2){itemString = `id:40968 `; iCumRate +=2;} //0.001곰 인형
			case(3){itemString = `id:40969 `; iCumRate +=2;} //0.001양산
			case(4){itemString = `id:40970 `; iCumRate +=2;} //0.001먼지떨이
			case(5){itemString = `id:18233 `; iCumRate +=100;} //0.05아이리스 헤드드레스
			case(6){itemString = `id:18234 `; iCumRate +=100;} //0.05러버 고글
			case(7){itemString = `id:18235 `; iCumRate +=100;} //0.05아이리스 나이트캡
			case(8){itemString = `id:18236 `; iCumRate +=100;} //0.05플레인 헤어밴드
			case(9){itemString = `id:18237 `; iCumRate +=100;} //0.05딕 스티치 마스크
			case(10){itemString = `id:18238 `; iCumRate +=100;} //0.05펄 샤인 드롭
			case(11){itemString = `id:18149 `; iCumRate +=100;} //0.05초보자용 병아리 모자
			case(12){itemString = `id:63064 count:10 `; iCumRate +=6000;} //3하트 모양 불꽃놀이키트
			case(13){itemString = `id:63074 count:10 `; iCumRate +=6000;} //3나오 불꽃놀이 키트
			case(14){itemString = `id:63075 count:10`; iCumRate +=6000;} //3데브캣 불꽃놀이 키트
			case(15){itemString = `id:63076 count:10 `; iCumRate +=6000;} //3아이스 폭죽 키트
			case(16){itemString = `id:91066 `; iCumRate +=6000;} //3정령무기수리포션 (1~5)
			case(17){itemString = `id:91017 `; iCumRate +=6000;} //3일본염약 set 1
			case(18){itemString = `id:91018 `; iCumRate +=6000;} //3일본염약 set 2
			case(19){itemString = `id:85043 count:2`; iCumRate +=7000;} //3.5의지 음식(*2)
			case(20){itemString = `id:85044 count:2 `; iCumRate +=7000;} //3.5지력 음식(*2)
			case(21){itemString = `id:85042 count:2 `; iCumRate +=7000;} //3.5행운 음식(*2)
			case(22){itemString = `id:85040 count:2 `; iCumRate +=7000;} //3.5체력 음식(*2)
			case(23){itemString = `id:85041 count:2 `; iCumRate +=7000;} //3.5솜씨 음식(*2)
			case(24){itemString = `id:65048 `; iCumRate +=7000;} //3.5마법 골렘의 결정
			case(25){itemString = `id:40276 `; iCumRate +=8000;} //4'도' 음 핸드벨
			case(26){itemString = `id:40277 `; iCumRate +=8000;} //4'레' 음 핸드벨
			case(27){itemString = `id:40278 `; iCumRate +=8000;} //4'미' 음 핸드벨
			case(28){itemString = `id:40279 `; iCumRate +=8000;} //4'파' 음 핸드벨
			case(29){itemString = `id:40280 `; iCumRate +=8000;} //4'솔' 음 핸드벨
			case(30){itemString = `id:40281 `; iCumRate +=8000;} //4'라' 음 핸드벨
			case(31){itemString = `id:40282 `; iCumRate +=8000;} //4'시' 음 핸드벨
			case(32){itemString = `id:40283 `; iCumRate +=8000;} //4높은 '도' 음 핸드벨
			case(33){itemString = `id:40018 `; iCumRate +=8000;} //4우쿨렐레
			case(34){itemString = `id:40049 `; iCumRate +=8000;} //4플루트
			case(35){itemString = `id:40050 `; iCumRate +=8000;} //4샬루모
			case(36){itemString = `id:40214 `; iCumRate +=9000;} //4.5큰 북
			case(37){itemString = `id:40215 `; iCumRate +=9000;} //4.5작은 북
			case(38){itemString = `id:40216 `; iCumRate +=9290;} //4.645심벌즈
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
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
