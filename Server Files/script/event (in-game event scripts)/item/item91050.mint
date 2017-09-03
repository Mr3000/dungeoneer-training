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
	// 후쿠부쿠로
	int itemID = cItem.GetClassId();
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(1000);	//확률의 총합을 적는다
	meta_array emptyArray;

	while(true)
	{
		bool bBreak = false;
		meta_array items;		// 동시에 여러개를 주기 위해 배열로 만든다.

		switch(i)
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			// 여기다 넣으세요
		case(0){
				items.Add(`id:40095 col1:333333 col2:111111 col3:111111 `);//검은색 드래곤 블레이드
				items.Add(`id:18551`);//본마린 헬름
				items.Add(`id:16519`);//초호화 장갑
				iCumRate+=8;}
		case(1){
				items.Add(`id:15108`);//섹시 레이디스 탱크탑
				items.Add(`id:15112`);//셀리나 스쿨 보이룩
				items.Add(`id:13045`);//아리쉬 아슈빈 아머 (남성용)
				iCumRate+=8;}
		case(2){
				items.Add(`id:14042`);//컬스틴 레더 아머
				items.Add(`id:46006 col1:eeeeee col2:660000 col3:eeeeee`);//빨간색 카이트 실드
				items.Add(`id:40049 col1:660000`);//플루트
				iCumRate+=8;}
		case(3){
				items.Add(`id:40080 col1:FF99FA col2:000000`);//분홍 글라디우스
				items.Add(`id:40002 col1:FFAAAA`);//연습용 목도
				items.Add(`id:40081 col1:101010 col2:990000`);//붉은색 레더 롱 보우
				iCumRate+=8;}
		case(4){
				items.Add(`id:19013 col1:0053a6 col2:000000 col3:000000`);//야광 머플러 로브
				items.Add(`id:46004 col1:8BBED8`);//하늘색 냄비
				items.Add(`id:40044 col1:8BBED8`);//하늘색 다용도 국자
				iCumRate+=8;}
		case(5){
				items.Add(`id:40003`);//숏보우
				items.Add(`id:40083`);//훅 커틀러스
				items.Add(`id:13023`);//로즈 플레이트 아머(B타입)
				iCumRate+=8;}
		case(6){
				items.Add(`id:40049 col1:111111`);//플루트
				items.Add(`id:40025 col1:000000 col2:f4f4f4`);//곡괭이
				items.Add(`id:17521`);//본마린 부츠
				iCumRate+=73;}
		case(7){
				items.Add(`id:40024 col1:000000 col2:f4f4f4`);//검정&흰색 대장장이 망치
				items.Add(`id:40045`);//낚싯대
				items.Add(`id:18044 col1:000000`);//범죄용 복면
				iCumRate+=73;}
		case(8){
				items.Add(`id:40037`);//푸주칼
				items.Add(`id:17521`);//본마린 부츠
				items.Add(`id:18541`);//대머리 가발
				iCumRate+=73;}
		case(9){
				items.Add(`id:15109`);//티핑수트
				items.Add(`id:40045`);//낚싯대
				items.Add(`id:14023 col1:000000 col2:000000`);//본마린아머 남성용
				iCumRate+=73;}
		case(10){
				items.Add(`id:40177`);//워리어 액스
				items.Add(`id:40002`);//검은색 목도
				items.Add(`id:16527`);//본마린 건틀렛
				iCumRate+=73;}
		case(11){
				items.Add(`id:40011`);//브로드 소드
				items.Add(`id:46005`);//간이테이블
				items.Add(`id:40042 col1:101010 col2:720000 `);//빨간색 식칼
				iCumRate+=73;}
		case(12){
				items.Add(`id:18159 col1:990000`);//뿔테 안경
				items.Add(`id:46004 col1:8CBD47`);//냄비
				items.Add(`id:40044 col1:8CBD47`);//다용도 국자
				iCumRate+=73;}
		case(13){
				items.Add(`id:40044 col1:E5B2E2`);//연보라 다용도 국자
				items.Add(`id:46004 col1:E5B2E2`);//연보라 냄비
				items.Add(`id:40017`);//만돌린
				iCumRate+=73;}
		case(14){
				items.Add(`id:40015`);//플루트 숏 소드
				items.Add(`id:40017 col1:101010 col2:101010 col3:ffffff`);//검은색&흰색 만돌린
				iCumRate+=73;}
		case(15){
				items.Add(`id:16528`);//레이저 건틀렛
				items.Add(`id:18088 col1:8f802d39`);//화관
				items.Add(`id:40002`);//목도
				iCumRate+=73;}
		case(16){
				items.Add(`id:15275`);//고양이옷
				items.Add(`id:40068`);//가위 모양 지시봉
				items.Add(`id:40069`);//바위 모양 지시봉
				items.Add(`id:40070`);//보 모양 지시봉
				iCumRate+=74;}
		case(17){
				items.Add(`id:16026`);//산드라 스나이퍼 수트 글러브
				items.Add(`id:40055`);//O 표시판
				items.Add(`id:40056`);//X 표시판
				iCumRate+=74;}
		case(18){
				items.Add(`id:40163`);//론카도라
				items.Add(`id:18111`);//나무 분장 소품
				items.Add(`id:15061`);//물결 무늬 옆 트임 튜닉
				items.Add(`id:46006`);//카이트실드
				iCumRate+=74;}
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
			int j;
			for (j = 0; j < items.GetSize(); ++j)
			{
				DebugOut(`유저에게 `+ (string)items.Get(j) + ` 를 줌`);
				GiveFashionGachaphonItem(player, (string)items.Get(j), itemID) extern (`data/script/event/useitem_event.mint`);
			}
			return;
		}

		++i;
		items = emptyArray;	// Clear()가 작동하지 않아 임시로 처리
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //스크립트가 틀렸거나 해서 아이템이 제대로 안나오면 일단 이거 줌. 확률값의 총합을 iRandom의 범위값으로 넣는걸 잊지마시오	
}
