//////////////////////////////////////////////////////////////////////////////////
//                                                 Mabinogi Project Banquet Script
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void InitializeBanquet()
//////////////////////////////////////////////////////////////////////////////////
{
	//[참고] AddBanquetRewardItem(여성용, 남성용, 확률)
	if (GetLocale().LowerCase() == `korea`)
	{
		// 연회복
		AddBanquetRewardItem(15433, 15429, 500);
		// 프릴 미니 원피스
		AddBanquetRewardItem(15375, 15375, 50);
		// 덕 부츠
		AddBanquetRewardItem(17074, 17074, 400);
		// 고글 모자
		AddBanquetRewardItem(18156, 18156, 50);
		// 빈티지 더스틴 실버 나이트 헬름
		AddBanquetRewardItem(18554, 18554, 300);
		// 로맨틱 이브닝 드레스
		AddBanquetRewardItem(15382, 15382, 50);
		// 테라 고딕 펑크 수트
		AddBanquetRewardItem(15362, 15362, 150);
		// 보니타 트윈 리본
		AddBanquetRewardItem(18213, 18213, 240);
		// 펄 샤인 브레이슬렛
		AddBanquetRewardItem(16137, 16137, 200);
		// 여성용+남성용 검사학교 교복 쇼트타입
		AddBanquetRewardItem(15113, 15114, 500);
		// 로맨틱 고딕 수트
		AddBanquetRewardItem(15377, 15377, 300);
		// 캐주얼 크로스 스티치 드레스
		AddBanquetRewardItem(15376, 15376, 400);
		// 아이리스 나이트 캡
		AddBanquetRewardItem(18235, 18235, 100);
		// 섬머 니트 캡
		AddBanquetRewardItem(18266, 18266, 100);
		// 안대
		AddBanquetRewardItem(18188, 18188, 300);
		// 얇은 테 안경
		AddBanquetRewardItem(18199, 18199, 250);
		// 아이리스 헤드드레스
		AddBanquetRewardItem(18233, 18233, 20);
		// 에이프런 드레스 쇼트타입
		AddBanquetRewardItem(15552, 15552, 10);
		// 에이프런 드레스 롱타입
		AddBanquetRewardItem(15553, 15553, 10);
		// 레이스 헤드드레스
		AddBanquetRewardItem(18280, 18280, 30);
		// 클래식 포멀 수트
		AddBanquetRewardItem(15554, 15554, 20);

		// 플라이트 뱃지 캡
		AddBanquetRewardItem(18295, 18295, 10);
		// 서큐버스 전대 모자
		AddBanquetRewardItem(18300, 18300, 1);
		// 서큐버스 전대 의상
		AddBanquetRewardItem(15486, 15486, 1);
		// 서큐버스 전대 부츠
		AddBanquetRewardItem(17222, 17222, 1);
		// 서큐버스 전대 장갑
		AddBanquetRewardItem(16067, 16067, 1);

		// 리리스 수트
		AddBanquetRewardItem(15591, 15591, 1);
		// 리리스 신발
		AddBanquetRewardItem(17230, 17230, 1);
		// 코렌틴 드레스
		AddBanquetRewardItem(15593, 15593, 1);
		// 알핀 수트
		AddBanquetRewardItem(15592, 15592, 1);
		// 야만적인 여우 갑옷 (남성용)
		AddBanquetRewardItem(14061, 14061, 1);
		// 야만적인 여우 갑옷 (여성용)
		AddBanquetRewardItem(14062, 14062, 1);
		// 야만적인 여우 장갑 (남성용)
		AddBanquetRewardItem(16078, 16078, 1);
		// 야만적인 여우 장갑 (여성용)
		AddBanquetRewardItem(14061, 14061, 1);
		// 슬리퍼
		AddBanquetRewardItem(17158, 17158, 5);
		// 부엉이 로브
		AddBanquetRewardItem(19070, 19070, 5);
		// 프로텍터 로브
		AddBanquetRewardItem(19071, 19071, 5);

		// 개구리 로브
		AddBanquetRewardItem(19083, 19083, 1);
		// 꽃 코사주
		AddBanquetRewardItem(18575, 18575, 1);
		// 양산
		AddBanquetRewardItem(40969, 40969, 1);
		// 먼지털이
		AddBanquetRewardItem(40970, 40970, 1);
		// 브론즈 미러 블레이드
		AddBanquetRewardItem(40979 ,40979, 1);
		// 딕 스티치 마스크
		AddBanquetRewardItem(18237, 18237, 1);
		// 원숭이 탈
		AddBanquetRewardItem(18287, 18287, 1);
		// 도렌 로브
		AddBanquetRewardItem(19084, 19084, 1);
		// 도렌 신발
		AddBanquetRewardItem(17237, 17237, 1);
		// 엘라하의 옷
		AddBanquetRewardItem(15550, 15550, 1);
		// 엘라하의 뿔
		AddBanquetRewardItem(18316, 18316, 1);
		// 엘라하 부츠
		AddBanquetRewardItem(17552, 17552, 1);
		// 베이릭시드 웨어
		AddBanquetRewardItem(15498, 15498, 1);
		// 안드라스 웨어
		AddBanquetRewardItem(15499, 15499, 1);
		// 레녹스 안경
		AddBanquetRewardItem(18338, 18338, 1);
		// 튤립 머리띠
		AddBanquetRewardItem(18297, 18297, 1);
		// 슬리브리스 웨어 (인/엘)
		AddBanquetRewardItem(15501, 15500, 1);
		// 슬리브리스 웨어 (자이)
		AddBanquetRewardItem(15503, 15502, 1);

		// 드래곤 스케일 아머 (인간)
		AddBanquetRewardItem(16543, 16543, 1);
		// 드래곤 스케일 아머 (자이)
		AddBanquetRewardItem(16544, 16544, 1);
		// 드래곤 스케일 건틀렛
		AddBanquetRewardItem(15503, 15502, 1);
		// 드래곤 스케일 건틀렛 (자이)
		AddBanquetRewardItem(15503, 15502, 1);
		// 드래곤 스케일 그리브
		AddBanquetRewardItem(17530, 17530, 1);
		// 드래곤 스케일 헬름
		AddBanquetRewardItem(18577, 18577, 1);
		// 명사수의 가죽 갑옷
		AddBanquetRewardItem(14060, 14059, 1);
		// 명사수의 가죽 부츠
		AddBanquetRewardItem(17207, 17207, 1);
		// 명사수의 가죽 헬멧
		AddBanquetRewardItem(18273, 18273, 1);
		// 명사수의 가죽 건틀렛
		AddBanquetRewardItem(16064, 16064, 1);
		// 참룡검
		AddBanquetRewardItem(40313, 40313, 1);
	}
	else
	{
		// 연회복
		AddBanquetRewardItem(15433, 15429, 500);
		// 프릴 미니 원피스
		AddBanquetRewardItem(15375, 15375, 50);
		// 덕 부츠
		AddBanquetRewardItem(17074, 17074, 400);
		// 빈티지 더스틴 실버 나이트 헬름
		AddBanquetRewardItem(18554, 18554, 300);
		// 펄 샤인 브레이슬렛
		AddBanquetRewardItem(16137, 16137, 200);
		// 여성용+남성용 검사학교 교복 쇼트타입
		AddBanquetRewardItem(15113, 15114, 500);
		// 로맨틱 고딕 수트
		AddBanquetRewardItem(15377, 15377, 300);
		// 캐주얼 크로스 스티치 드레스
		AddBanquetRewardItem(15376, 15376, 400);
		// 얇은 테 안경
		AddBanquetRewardItem(18199, 18199, 250);
		// 큰 테이블 나이프
		AddBanquetRewardItem(40962, 40962, 50);
		// 큰 테이블 포크
		AddBanquetRewardItem(40963, 40963, 50);
		// 큰 테이블 스푼
		AddBanquetRewardItem(40964, 40964, 50);
	}
}