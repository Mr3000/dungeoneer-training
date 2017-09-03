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
	//중국 특별한 무기 가챠폰
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom;

	iRandom = Random(305);	//대만 확률의 총합을 적는다

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
			case(0){itemString=`id:40004 col1:FF0080 col2:FF0080 col3:FF0080`;iCumRate+=1;}//0.3278688525 305류트
			case(1){itemString=`id:40017 col1:FF0080 col2:FF0080 col3:FF0080`;iCumRate+=1;}//0.3278688525 305만돌린
			case(2){itemString=`id:40048 col1:00FFFF col2:00FFFF col3:00FFFF`;iCumRate+=1;}//0.3278688525 305휘슬
			case(3){itemString=`id:40049 col1:00FFFF col2:00FFFF col3:00FFFF`;iCumRate+=1;}//0.3278688525 305플루트
			case(4){itemString=`id:40050 col1:00FFFF col2:00FFFF col3:01FFFF`;iCumRate+=1;}//0.3278688525 305샬루모
			case(5){itemString=`id:40095 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=1;}//0.3278688525 305드래곤 블레이드
			case(6){itemString=`id:40033 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305클레이모어
			case(7){itemString=`id:40081 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305레더 롱 보우
			case(8){itemString=`id:40090 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305힐링 원드
			case(9){itemString=`id:40080 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305글라디우스
			case(10){itemString=`id:40038 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305라이트닝 원드
			case(11){itemString=`id:40039 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305아이스 원드
			case(12){itemString=`id:40040 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305파이어 원드
			case(13){itemString=`id:40041 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305타격용 원드
			case(14){itemString=`id:40078 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305비펜니스
			case(15){itemString=`id:40079 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305메이스
			case(16){itemString=`id:40031 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305석궁
			case(17){itemString=`id:40030 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305투 핸디드 소드
			case(18){itemString=`id:40013 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305롱 보우
			case(19){itemString=`id:40014 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305콤포짓 보우
			case(20){itemString=`id:40016 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305해머
			case(21){itemString=`id:40010 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305롱 소드
			case(22){itemString=`id:40011 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305브로드 소드
			case(23){itemString=`id:40012 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305바스타드 소드
			case(24){itemString=`id:40015 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305플루트 숏 소드
			case(25){itemString=`id:40003 col1:FFAAD5 col2:FFAAD5 col3:FFAAD5`;iCumRate+=3;}//0.9836065574 305숏 보우
			case(26){itemString=`id:40005 col1:A6FFA6 col2:A6FFA6 col3:A6FFA6`;iCumRate+=3;}//0.9836065574 305숏 소드
			case(27){itemString=`id:40006 col1:66B3FF col2:66B3FF col3:66B3FF`;iCumRate+=3;}//0.9836065574 305단검
			case(28){itemString=`id:40002 col1:FF5151 col2:FF5151 col3:FF5151`;iCumRate+=3;}//0.9836065574 305연습용 목도
			case(29){itemString=`id:40033`;iCumRate+=10;}//3.2786885246 305클레이모어
			case(30){itemString=`id:40081`;iCumRate+=10;}//3.2786885246 305레더 롱 보우
			case(31){itemString=`id:40090`;iCumRate+=10;}//3.2786885246 305힐링 원드
			case(32){itemString=`id:40080`;iCumRate+=10;}//3.2786885246 305글라디우스
			case(33){itemString=`id:40038`;iCumRate+=10;}//3.2786885246 305라이트닝 원드
			case(34){itemString=`id:40039`;iCumRate+=10;}//3.2786885246 305아이스 원드
			case(35){itemString=`id:40040`;iCumRate+=10;}//3.2786885246 305파이어 원드
			case(36){itemString=`id:40041`;iCumRate+=10;}//3.2786885246 305타격용 원드
			case(37){itemString=`id:40078`;iCumRate+=10;}//3.2786885246 305비펜니스
			case(38){itemString=`id:40079`;iCumRate+=10;}//3.2786885246 305메이스
			case(39){itemString=`id:40031`;iCumRate+=10;}//3.2786885246 305석궁
			case(40){itemString=`id:40030`;iCumRate+=10;}//3.2786885246 305투 핸디드 소드
			case(41){itemString=`id:40013`;iCumRate+=10;}//3.2786885246 305롱 보우
			case(42){itemString=`id:40014`;iCumRate+=10;}//3.2786885246 305콤포짓 보우
			case(43){itemString=`id:40016`;iCumRate+=10;}//3.2786885246 305해머
			case(44){itemString=`id:40010`;iCumRate+=10;}//3.2786885246 305롱 소드
			case(45){itemString=`id:40011`;iCumRate+=10;}//3.2786885246 305브로드 소드
			case(46){itemString=`id:40012`;iCumRate+=10;}//3.2786885246 305바스타드 소드
			case(47){itemString=`id:40015`;iCumRate+=10;}//3.2786885246 305플루트 숏 소드
			case(48){itemString=`id:40003`;iCumRate+=10;}//3.2786885246 305숏 보우
			case(49){itemString=`id:40005`;iCumRate+=10;}//3.2786885246 305숏 소드
			case(50){itemString=`id:40006`;iCumRate+=10;}//3.2786885246 305단검
			case(51){itemString=`id:40002`;iCumRate+=10;}//3.2786885246 305연습용 목도
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
