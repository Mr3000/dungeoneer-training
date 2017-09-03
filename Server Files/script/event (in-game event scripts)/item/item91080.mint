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
	//중국 특별한 아머 가챠폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;

	iRandom = Random(366);	//대만 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString=`id:13032 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=1;}//0.2732240437 366발렌시아 크로스 라인 플레이트 아머(여성용)
			case(1){itemString=`id:13033 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=1;}//0.2732240437 366발렌시아 크로스 라인 플레이트 아머(남성용)
			case(2){itemString=`id:14036 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366티오즈 아머(남성용)
			case(3){itemString=`id:14037 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366티오즈 아머(여성용)
			case(4){itemString=`id:16531 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366티오즈 건틀렛
			case(5){itemString=`id:17523 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366티오즈 그리브
			case(6){itemString=`id:18518  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366드래곤 크레스트
			case(7){itemString=`id:13022 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366로즈 플레이트 아머 (P타입)
			case(8){itemString=`id:13010  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366라운드 폴드론 체인메일
			case(9){itemString=`id:13031 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366스파이카 실버 플레이트 아머
			case(10){itemString=`id:16511  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366실버 티니 글러브
			case(11){itemString=`id:17510  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366스파이카 실버 플레이트 부츠
			case(12){itemString=`id:13043 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366레미니아 성월의 갑옷(남성용)
			case(13){itemString=`id:13044 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366레미니아 성월의 갑옷(여성용)
			case(14){itemString=`id:13047 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366키리누스진 하프 플레이트 아머(남성용)
			case(15){itemString=`id:13048 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366키리누스진 하프 플레이트 아머(여성용)
			case(16){itemString=`id:14025 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366카멜 스피리트 아머(남성용)
			case(17){itemString=`id:14026 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366카멜 스피리트 아머(여성용)
			case(18){itemString=`id:16028  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366카멜 스피리트 글러브
			case(19){itemString=`id:17064  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366카멜 스피리트 부츠
			case(20){itemString=`id:14018  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366노르만 워리어 아머
			case(21){itemString=`id:18546  col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366노르만 워리어 헬멧
			case(22){itemString=`id:14019 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366그레이스 플레이트 아머
			case(23){itemString=`id:16523  col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366그레이스 건틀렛
			case(24){itemString=`id:17515  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366그레이스 그리브
			case(25){itemString=`id:18545  col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366그레이스 헬멧
			case(26){itemString=`id:14016  col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.8196721311 366크로스벨트 레더 코트
			case(27){itemString=`id:14008 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.8196721311 366풀세트 가죽 갑옷
			case(28){itemString=`id:14017  col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.8196721311 366쓰리벨트 레더 메일
			case(29){itemString=`id:14007 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.8196721311 366브레스트 클로스 메일
			case(30){itemString=`id:14036`;iCumRate+=10;}//2.7322404372 366티오즈 아머(남성용)
			case(31){itemString=`id:14037`;iCumRate+=10;}//2.7322404372 366티오즈 아머(여성용)
			case(32){itemString=`id:16531`;iCumRate+=10;}//2.7322404372 366티오즈 건틀렛
			case(33){itemString=`id:17523`;iCumRate+=10;}//2.7322404372 366티오즈 그리브
			case(34){itemString=`id:18518 `;iCumRate+=10;}//2.7322404372 366드래곤 크레스트
			case(35){itemString=`id:13022`;iCumRate+=10;}//2.7322404372 366로즈 플레이트 아머 (P타입)
			case(36){itemString=`id:13010 `;iCumRate+=10;}//2.7322404372 366라운드 폴드론 체인메일
			case(37){itemString=`id:13031`;iCumRate+=10;}//2.7322404372 366스파이카 실버 플레이트 아머
			case(38){itemString=`id:16511 `;iCumRate+=10;}//2.7322404372 366실버 티니 글러브
			case(39){itemString=`id:17510 `;iCumRate+=10;}//2.7322404372 366스파이카 실버 플레이트 부츠
			case(40){itemString=`id:13043`;iCumRate+=10;}//2.7322404372 366레미니아 성월의 갑옷(남성용)
			case(41){itemString=`id:13044`;iCumRate+=10;}//2.7322404372 366레미니아 성월의 갑옷(여성용)
			case(42){itemString=`id:13047`;iCumRate+=10;}//2.7322404372 366키리누스진 하프 플레이트 아머(남성용)
			case(43){itemString=`id:13048`;iCumRate+=10;}//2.7322404372 366키리누스진 하프 플레이트 아머(여성용)
			case(44){itemString=`id:14025`;iCumRate+=10;}//2.7322404372 366카멜 스피리트 아머(남성용)
			case(45){itemString=`id:14026`;iCumRate+=10;}//2.7322404372 366카멜 스피리트 아머(여성용)
			case(46){itemString=`id:16028 `;iCumRate+=10;}//2.7322404372 366카멜 스피리트 글러브
			case(47){itemString=`id:17064 `;iCumRate+=10;}//2.7322404372 366카멜 스피리트 부츠
			case(48){itemString=`id:14018 `;iCumRate+=10;}//2.7322404372 366노르만 워리어 아머
			case(49){itemString=`id:18546 `;iCumRate+=10;}//2.7322404372 366노르만 워리어 헬멧
			case(50){itemString=`id:14019`;iCumRate+=10;}//2.7322404372 366그레이스 플레이트 아머
			case(51){itemString=`id:16523 `;iCumRate+=10;}//2.7322404372 366그레이스 건틀렛
			case(52){itemString=`id:17515 `;iCumRate+=10;}//2.7322404372 366그레이스 그리브
			case(53){itemString=`id:18545 `;iCumRate+=10;}//2.7322404372 366그레이스 헬멧
			case(54){itemString=`id:14016 `;iCumRate+=10;}//2.7322404372 366크로스벨트 레더 코트
			case(55){itemString=`id:14008`;iCumRate+=10;}//2.7322404372 366풀세트 가죽 갑옷
			case(56){itemString=`id:14017 `;iCumRate+=10;}//2.7322404372 366쓰리벨트 레더 메일
			case(57){itemString=`id:14007`;iCumRate+=10;}//2.7322404372 366브레스트 클로스 메일
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
