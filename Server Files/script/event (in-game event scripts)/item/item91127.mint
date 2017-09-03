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
	if (GetLocale().LowerCase() == `korea`)
	{
		//미국 무기 가차폰
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(1245);	//확률의 총합을 적는다
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0) {itemString = ` id:15469 `; iCumRate += 1 ;}// 0.080321285 강시 의상 
				case(1) {itemString = ` id:18518   col1:800000 col2:800000 col3:800000 `; iCumRate += 1 ;}// 0.080321285 붉은 드래곤 크레스트 
				case(2) {itemString = ` id:40225　 `; iCumRate += 1 ;}// 0.080321285 윙 보우　 
				case(3) {itemString = ` id:15499　 `; iCumRate += 1 ;}// 0.080321285 안드라스 웨어　 
				case(4) {itemString = ` id:40350　 `; iCumRate += 1 ;}// 0.080321285 안드라스 퍼핏　 
				case(5) {itemString = ` id:46006 `; iCumRate += 10 ;}// 0.803212851 카이트 실드 
				case(6) {itemString = ` id:13035   `; iCumRate += 20 ;}// 1.606425703 라이트 멜카 체인 메일 
				case(7) {itemString = ` id:18040  `; iCumRate += 20 ;}// 1.606425703 코레스 꼭지 베레모 
				case(8) {itemString = ` id:63030   `; iCumRate += 30 ;}// 2.409638554 지정 색상 염색 앰플 
				case(9) {itemString = ` id:62005  prefix:7 `; iCumRate += 50 ;}// 4.016064257 인챈트 스크롤 (폭스 헌터) 
				case(10) {itemString = ` id:16520   `; iCumRate += 50 ;}// 4.016064257 롱 레더 글러브 
				case(11) {itemString = ` id:14006   `; iCumRate += 50 ;}// 4.016064257 리넨 퀴라스 
				case(12) {itemString = ` id:14004   `; iCumRate += 50 ;}// 4.016064257 클로스 메일 
				case(13) {itemString = ` id:18500   `; iCumRate += 50 ;}// 4.016064257 링 메일 헬름 
				case(14) {itemString = ` id:18501   `; iCumRate += 50 ;}// 4.016064257 가디언 헬름 
				case(15) {itemString = ` id:18502   `; iCumRate += 50 ;}// 4.016064257 본 헬름 
				case(16) {itemString = ` id:18503   `; iCumRate += 50 ;}// 4.016064257 퀴러시어 헬름 
				case(17) {itemString = ` id:18504   `; iCumRate += 50 ;}// 4.016064257 크로스 풀 헬름 
				case(18) {itemString = ` id:18505   `; iCumRate += 50 ;}// 4.016064257 스파이크 헬름 
				case(19) {itemString = ` id:18542   `; iCumRate += 50 ;}// 4.016064257 빅 체인 풀 헬름 
				case(20) {itemString = ` id:18543   `; iCumRate += 50 ;}// 4.016064257 빅 슬릿 풀 헬름 
				case(21) {itemString = ` id:18544   `; iCumRate += 50 ;}// 4.016064257 빅 펠리칸 프로텍터 
				case(22) {itemString = ` id:18547   `; iCumRate += 50 ;}// 4.016064257 빅 파나쉬 헤드 프로텍터 
				case(23) {itemString = ` id:51007   count:10 `; iCumRate += 60 ;}// 4.819277108 마나 30 포션 
				case(24) {itemString = ` id:51003   count:5 `; iCumRate += 100 ;}// 8.032128514 생명력 50 포션 
				case(25) {itemString = ` id:51004   count:3 `; iCumRate += 100 ;}// 8.032128514 생명력 100 포션 
				case(26) {itemString = ` id:51013   count:5 `; iCumRate += 100 ;}// 8.032128514 스태미나 50 포션 
				case(27) {itemString = ` id:51014   count:3 `; iCumRate += 100 ;}// 8.032128514 스태미나 100 포션 
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
				GiveZombieGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}

			++i;
		}
		GiveZombieGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
	}
	else
	{
		//미국 무기 가차폰
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(1278);	//확률의 총합을 적는다
		int itemID = cItem.GetClassId();

		while(true)
		{
			bool bBreak = false;
			string itemString;
			switch(i)
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 여기다 넣으세요
				case(0){itemString = `id:15469`  ; iCumRate += 5 ;} //0.0784929356 강시 의상
				case(1){itemString = `id:18518   col1:800000 col2:800000 col3:800000`; iCumRate += 1 ;} //0.0784929356 붉은 드래곤 크레스트
				case(2){itemString = `id:40171  `; iCumRate += 1 ;} //0.0784929356 마사무네
				case(3){itemString = `id:40170  `; iCumRate += 1 ;} //0.0784929356 일본식 양손검
				case(4){itemString = `id:14023  `; iCumRate += 10;} //0.7849293564 본 마린 아머(남성용)
				case(5){itemString = `id:14024  `; iCumRate += 10;} //0.7849293564 본 마린 아머(여성용)
				case(6){itemString = `id:18551  `; iCumRate += 10;} //0.7849293564 본 마린 헬름
				case(7){itemString = `id:46008  `; iCumRate += 10;} //0.7849293564 라이트 헤테로 카이트 실드
				case(8){itemString = `id:13035  `; iCumRate += 10;} //0.7849293564 라이트 멜카 체인 메일
				case(9){itemString = `id:18040 `; iCumRate += 10;} //0.7849293564 코레스 꼭지 베레모
				case(10){itemString = `id:63030  `; iCumRate += 30 ;} //2.3547880691 지정 색상 염색 앰플
				case(11){itemString = `id:62005  prefix:7`; iCumRate += 50 ;} //3.9246467818 인챈트 스크롤 (폭스 헌터)
				case(12){itemString = `id:16520  `; iCumRate += 50 ;} //3.9246467818 롱 레더 글러브
				case(13){itemString = `id:14006  `; iCumRate += 50 ;} //3.9246467818 리넨 퀴라스
				case(14){itemString = `id:14004  `; iCumRate += 50 ;} //3.9246467818 클로스 메일
				case(15){itemString = `id:18500  `; iCumRate += 50 ;} //3.9246467818 링 메일 헬름
				case(16){itemString = `id:18501  `; iCumRate += 50 ;} //3.9246467818 가디언 헬름
				case(17){itemString = `id:18502  `; iCumRate += 50 ;} //3.9246467818 본 헬름
				case(18){itemString = `id:18503  `; iCumRate += 50 ;} //3.9246467818 퀴러시어 헬름
				case(19){itemString = `id:18504  `; iCumRate += 50 ;} //3.9246467818 크로스 풀 헬름
				case(20){itemString = `id:18505  `; iCumRate += 50 ;} //3.9246467818 스파이크 헬름
				case(21){itemString = `id:18542  `; iCumRate += 50 ;} //3.9246467818 빅 체인 풀 헬름
				case(22){itemString = `id:18543  `; iCumRate += 50 ;} //3.9246467818 빅 슬릿 풀 헬름
				case(23){itemString = `id:18544  `; iCumRate += 50 ;} //3.9246467818 빅 펠리칸 프로텍터
				case(24){itemString = `id:18547  `; iCumRate += 50 ;} //3.9246467818 빅 파나쉬 헤드 프로텍터
				case(25){itemString = `id:51007   count:10`; iCumRate += 80 ;} //6.2794348509 마나 30 포션
				case(26){itemString = `id:51003   count:5`; iCumRate += 100 ;} //7.8492935636 생명력 50 포션
				case(27){itemString = `id:51004   count:3`; iCumRate += 100 ;} //7.8492935636 생명력 100 포션
				case(28){itemString = `id:51013   count:5`; iCumRate += 100 ;} //7.8492935636 스태미나 50 포션
				case(29){itemString = `id:51014   count:3`; iCumRate += 100 ;} //7.8492935636 스태미나 100 포션
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
				GiveZombieGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
				return;
			}

			++i;
		}
		GiveZombieGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오
	}
}
