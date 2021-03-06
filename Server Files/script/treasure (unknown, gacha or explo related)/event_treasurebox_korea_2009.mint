////////////////////////////////////////////////////////////////////////////////
//                                      		Mabinogi Project Treasure Script
//                                             					   이리아 보물상자
//
//                                   wakeup erinys fecit, begins at 2006. 02. 16
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{
	// 이벤트용 처리를 하기 전에 반드시 SetEventType()으로 어떤 이벤트용 상자인지
	// 명시를 해주어야 한다.
	// 명시해주지 않으면 기본값으로 'treasurehunting' 이벤트로 세팅된다.
	_this.SetEventType(`treasurehunting2009_korea`);
	_this.AddEventItem(GetItemRewardDesc());


	_this.AddAnnounceItem(16518);	// 커플 반지 장갑 0.149823458
	_this.AddAnnounceItem(16519);	// 초호화 장갑 0.149823458
	_this.AddAnnounceItem(15139);	// @샤오롱주엔 예복정장(여성용) 0.024970576
	_this.AddAnnounceItem(15140);	// @샤오롱주엔 예복정장(남성용) 0.024970576
	_this.AddAnnounceItem(15149);	// @키린 겨울 천사의 코트(남성용) 0.024970576
	_this.AddAnnounceItem(15150);	// @키린 겨울 천사의 코트(여성용) 0.024970576
	_this.AddAnnounceItem(15151);	// @뉴욕마리오 웨이스트 테일러 웨어(남성용) 0.024970576
	_this.AddAnnounceItem(15152);	// @뉴욕마리오 웨이스트 테일러 웨어(여성용) 0.024970576
	_this.AddAnnounceItem(15153);	// @산드라 스나이퍼 수트(남성용) 0.024970576
	_this.AddAnnounceItem(15154);	// @산드라 스나이퍼 수트(여성용) 0.024970576
	_this.AddAnnounceItem(15155);	// @이디카이 성직자 예복(남성용) 0.024970576
	_this.AddAnnounceItem(15156);	// @이디카이 성직자 예복(여성용) 0.024970576
	_this.AddAnnounceItem(15157);	// @위스 보위군 의복(남성용) 0.024970576
	_this.AddAnnounceItem(15158);	// @위스 보위군 의복(여성용) 0.024970576
	_this.AddAnnounceItem(19018);	// @자부신선 임페리얼 로브 0.024970576
	_this.AddAnnounceItem(19019);	// @라카드 레이어드 머플러 로브 0.024970576
	_this.AddAnnounceItem(19020);	// @나타네 설산용 코트 0.024970576
	_this.AddAnnounceItem(13006);	// @플레이트 메일 0.016647051
	_this.AddAnnounceItem(13010);	// @라운드 폴드론 체인메일 0.016647051
	_this.AddAnnounceItem(13012);	// @스케일 아머 0.016647051
	_this.AddAnnounceItem(13015);	// @브리건딘 0.016647051
	_this.AddAnnounceItem(13017);	// @서코트 체인메일 0.016647051
	_this.AddAnnounceItem(15134);	// @고딕 베이직 수트 0.016647051
	_this.AddAnnounceItem(15135);	// @시크 수트 0.016647051
	_this.AddAnnounceItem(15136);	// @고딕 레이스 스커트 0.016647051
	_this.AddAnnounceItem(15138);	// @트루디 헌팅 수트 0.016647051
	_this.AddAnnounceItem(15008);	// 검사학교 교복 0.009988231
	_this.AddAnnounceItem(15037);	// 검사학교 교복 0.009988231
	_this.AddAnnounceItem(15111);	// @포크룩 웨어 0.009988231
	_this.AddAnnounceItem(15061);	// 물결무늬 옆트임 튜닉 0.00332941
	_this.AddAnnounceItem(15065);	// @엘라 베스트 스커트 0.00332941
	_this.AddAnnounceItem(15067);	// 동양풍 무사복 0.00332941
	_this.AddAnnounceItem(15073);	// 용소저 무도복 0.00332941
	_this.AddAnnounceItem(15108);	// @섹시 레이디스 탱크탑 0.00332941
	_this.AddAnnounceItem(15055);	// @레더 미니 원피스 0.001664705
	_this.AddAnnounceItem(15056);	// @레더 미니 원피스 링타입 0.001664705
	_this.AddAnnounceItem(15057);	// @롱 레더 코트 (무광) 0.001664705
	_this.AddAnnounceItem(15059);	// 터크스 탱크탑 반바지 0.001664705
	_this.AddAnnounceItem(15060);	// @슬림 이너로브 웨어 0.001664705
	_this.AddAnnounceItem(15062);	// @지그재그 튜닉 0.001664705
	_this.AddAnnounceItem(15063);	// @레이어드 프릴 원피스 0.001664705
	_this.AddAnnounceItem(15064);	// @아이돌 리본 드레스 0.001664705
	_this.AddAnnounceItem(15066);	// @루이스 베스트 웨어 0.001664705
	_this.AddAnnounceItem(15070);	// @스탠드칼라 슬리브리스 0.001664705
	_this.AddAnnounceItem(15074);	// @루이스 성직자 코트 0.001664705
	_this.AddAnnounceItem(15075);	// @셀리나 레이디 드레스 0.001664705
	_this.AddAnnounceItem(15095);	// @셀리나 오픈 레더 자켓 0.001664705
	_this.AddAnnounceItem(15096);	// @셀리나 섹시 베어룩 0.001664705
	_this.AddAnnounceItem(15107);	// @몬거 더플 코트 0.001664705
	_this.AddAnnounceItem(15109);	// @티핑 수트 0.001664705
	_this.AddAnnounceItem(15110);	// @셀리나 정장 0.001664705
	_this.AddAnnounceItem(15112);	// @셀리나 스쿨보이룩 0.001664705
	_this.AddAnnounceItem(15113);	// 여성용 검사학교 교복 쇼트타입 0.001664705
	_this.AddAnnounceItem(15114);	// 남성용 검사학교 교복 롱타입 0.001664705
	_this.AddAnnounceItem(15115);	// @재기드 미니 스커트 0.001664705
	_this.AddAnnounceItem(15116);	// 여성용 마법사 정장 0.001664705
	_this.AddAnnounceItem(15117);	// 남성용 마법사 정장 0.001664705
	_this.AddAnnounceItem(15118);	// 남성용 검사학교 교복 쇼트타입 0.001664705
	_this.AddAnnounceItem(15119);	// 여성용 검사학교 교복 롱타입 0.001664705
	_this.AddAnnounceItem(15127);	// @셀리나 트래디셔널 코트 0.001664705
	_this.AddAnnounceItem(15128);	// @투 톤 비조 드레스 0.001664705
	_this.AddAnnounceItem(15131);	// @핀 에이프런 스커트 0.001664705
	_this.AddAnnounceItem(15132);	// @내추럴 베스트 웨어 0.001664705
	_this.AddAnnounceItem(15013);	// 차이나드레스 0.000832353
	_this.AddAnnounceItem(15017);	// 차이나드레스 0.000832353
	_this.AddAnnounceItem(13018);	// @더블 링메일 0.000166471
	_this.AddAnnounceItem(13031);	// @스파이카 실버 플레이트 아머 0.000166471
	_this.AddAnnounceItem(13032);	// @발렌시아 크로스 라인 플레이트 아머(여성용) 0.000166471
	_this.AddAnnounceItem(13033);	// @발렌시아 크로스 라인 플레이트 아머(남성용) 0.000166471
	_this.AddAnnounceItem(13038);	// @더스틴 실버 나이트 아머 0.000166471
	_this.AddAnnounceItem(13043);	// @레미니아 성월의 갑옷(남성용) 0.000166471
	_this.AddAnnounceItem(13044);	// @레미니아 성월의 갑옷(여성용) 0.000166471
	_this.AddAnnounceItem(13045);	// @아리쉬 아슈빈 아머(남성용) 0.000166471
	_this.AddAnnounceItem(13046);	// @아리쉬 아슈빈 아머(여성용) 0.000166471
	_this.AddAnnounceItem(13047);	// @키리누스진 하프 플레이트 아머(남성용) 0.000166471
	_this.AddAnnounceItem(13048);	// @키리누스진 하프 플레이트 아머(여성용) 0.000166471
	_this.AddAnnounceItem(14015);	// @클라우스 머플러 레더 메일 0.000166471
	_this.AddAnnounceItem(14016);	// @크로스벨트 레더 코트 0.000166471
	_this.AddAnnounceItem(14017);	// @쓰리벨트 레더 메일 0.000166471
	_this.AddAnnounceItem(15137);	// @셀리나 하프 재킷 코트 0.000166471
	_this.AddAnnounceItem(13055);	// @콜린 플레이트 아머 0.000499412
	_this.AddAnnounceItem(16541);	// @콜린 플레이트 건틀렛 0.000499412
	_this.AddAnnounceItem(17528);	// @콜린 플레이트 부츠 0.000499412
	_this.AddAnnounceItem(18557);	// @콜린 플레이트 헬멧 0.000499412
	_this.AddAnnounceItem(17520);	// 큰 새 다리 부츠 0.000499412
	_this.AddAnnounceItem(18550);	// 번개 전사의 투구 0.000499412
	_this.AddAnnounceItem(40225);	// @윙 보우 0.000166471
	_this.AddAnnounceItem(40224);	// @링 보우 0.000166471
	_this.AddAnnounceItem(46009);	// 주시자의 방패 0.000166471
	_this.AddAnnounceItem(40226);	// 주시자의 검 0.000166471
	_this.AddAnnounceItem(18043);	// 코레스 니트 모자 0.000166471
	_this.AddAnnounceItem(40198);	// 상아검 0.000166471
	_this.AddAnnounceItem(1205);	// 영원한 휴식 0.000332941
	_this.AddAnnounceItem(64506);	// 탐험 일지 1페이지 0.008323525
	_this.AddAnnounceItem(64508);	// 탐험 일지 3페이지 0.000499412
	_this.AddAnnounceItem(64510);	// 탐험 일지 5페이지 0.008323525
	_this.AddAnnounceItem(14045);	// 소라 갑옷(여성용) 0.000499412
	_this.AddAnnounceItem(14046);	// 소라 갑옷(남성용) 0.000499412
	_this.AddAnnounceItem(16540);	// 소라 건틀렛 0.000499412
	_this.AddAnnounceItem(17127);	// 소라 부츠(여성용) 0.000499412
	_this.AddAnnounceItem(17129);	// 소라 부츠(남성용) 0.000499412
	_this.AddAnnounceItem(18556);	// 소라 투구(여성용) 0.000499412
	_this.AddAnnounceItem(18558);	// 소라 투구(남성용) 0.000499412
	_this.AddAnnounceItem(19030);	// @자이언트 트래디셔널 로브 3.995292214
	_this.AddAnnounceItem(19029);	// @자이언트 베어 로브 0.000166471
	_this.AddAnnounceItem(40175);	// @그레이트 말렛 1.997646107
	_this.AddAnnounceItem(40216);	// 심벌즈 0.499411527
	_this.AddAnnounceItem(14035);	// @피르타 레더 아머 0.001664705

}
////////////////////////////////////////////////////////////////////////////////
server string GetItemRewardDesc()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(600707);

	while(true)
	{
		bool bBreak = false;
		string itemDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){itemDesc = `id:19001`; iCumRate +=24000;}	// @로브	3.995292214
			case(1){itemDesc = `id:19002`; iCumRate +=27000;}	// @슬렌더 로브	4.494703741
			case(2){itemDesc = `id:19003`; iCumRate +=24000;}	// @트리콜로르 로브	3.995292214
			case(3){itemDesc = `id:40003`; iCumRate +=24000;}	// @숏 보우	3.995292214
			case(4){itemDesc = `id:40006`; iCumRate +=27000;}	// 단검	4.494703741
			case(5){itemDesc = `id:19012`; iCumRate +=24000;}	// @트루디 레이어드 로브	3.995292214
			case(6){itemDesc = `id:40004`; iCumRate +=21000;}	// @류트	3.495880687
			case(7){itemDesc = `id:40005`; iCumRate +=21000;}	// @숏 소드	3.495880687
			case(8){itemDesc = `id:40007`; iCumRate +=18000;}	// 한손도끼	2.996469161
			case(9){itemDesc = `id:40010`; iCumRate +=18000;}	// @롱 소드	2.996469161
			case(10){itemDesc = `id:40011`; iCumRate +=18000;}	// @브로드 소드	2.996469161
			case(11){itemDesc = `id:40012`; iCumRate +=18000;}	// @바스타드 소드	2.996469161
			case(12){itemDesc = `id:40013`; iCumRate +=18000;}	// @롱 보우	2.996469161
			case(13){itemDesc = `id:40014`; iCumRate +=18000;}	// @콤포짓 보우	2.996469161
			case(14){itemDesc = `id:40015`; iCumRate +=15000;}	// @플루트 숏 소드	2.497057634
			case(15){itemDesc = `id:19008`; iCumRate +=12000;}	// @코코 판다 로브	1.997646107
			case(16){itemDesc = `id:19009`; iCumRate +=12000;}	// @코코 래빗 로브	1.997646107
			case(17){itemDesc = `id:19010`; iCumRate +=12000;}	// @셀리나 패널 로브	1.997646107
			case(18){itemDesc = `id:19014`; iCumRate +=12000;}	// @트루디 레인 로브	1.997646107
			case(19){itemDesc = `id:40016`; iCumRate +=12000;}	// @해머	1.997646107
			case(20){itemDesc = `id:40030`; iCumRate +=12000;}	// @투 핸디드 소드	1.997646107
			case(21){itemDesc = `id:40031`; iCumRate +=12000;}	// 석궁	1.997646107
			case(22){itemDesc = `id:40032`; iCumRate +=4000;}	// @가고일 소드	0.665882036
			case(23){itemDesc = `id:40033`; iCumRate +=12000;}	// @클레이모어	1.997646107
			case(24){itemDesc = `id:40036`; iCumRate +=9000;}	// 만도	1.49823458
			case(25){itemDesc = `id:40037`; iCumRate +=9000;}	// 푸주칼	1.49823458
			case(26){itemDesc = `id:40078`; iCumRate +=12000;}	// @비펜니스	1.997646107
			case(27){itemDesc = `id:40079`; iCumRate +=15000;}	// @메이스	2.497057634
			case(28){itemDesc = `id:64507`; iCumRate +=15000;}	// 탐험 일지 2페이지	2.497057634
			case(29){itemDesc = `id:40080`; iCumRate +=18000;}	// @글라디우스	2.996469161
			case(30){itemDesc = `id:40081`; iCumRate +=21000;}	// @레더 롱 보우	3.495880687
			case(31){itemDesc = `id:40018`; iCumRate +=9000;}	// @우쿨렐레	1.49823458
			case(32){itemDesc = `id:40083`; iCumRate +=15000;}	// @훅 커틀러스	2.497057634
			case(33){itemDesc = `id:19016`; iCumRate +=6000;}	// 곰 로브	0.998823054
			case(34){itemDesc = `id:19017`; iCumRate +=6000;}	// 늑대 로브	0.998823054
			case(35){itemDesc = `id:40017`; iCumRate +=3000;}	// @만돌린	0.499411527
			case(36){itemDesc = `id:64509`; iCumRate +=3000;}	// 탐험 일지 4페이지	0.499411527
			case(37){itemDesc = `id:16518`; iCumRate +=900;}	// 커플 반지 장갑	0.149823458
			case(38){itemDesc = `id:16519`; iCumRate +=900;}	// 초호화 장갑	0.149823458
			case(39){itemDesc = `id:15139`; iCumRate +=150;}	// @샤오롱주엔 예복정장(여성용)	0.024970576
			case(40){itemDesc = `id:15140`; iCumRate +=150;}	// @샤오롱주엔 예복정장(남성용)	0.024970576
			case(41){itemDesc = `id:15149`; iCumRate +=150;}	// @키린 겨울 천사의 코트(남성용)	0.024970576
			case(42){itemDesc = `id:15150`; iCumRate +=150;}	// @키린 겨울 천사의 코트(여성용)	0.024970576
			case(43){itemDesc = `id:15151`; iCumRate +=150;}	// @뉴욕마리오 웨이스트 테일러 웨어(남성용)	0.024970576
			case(44){itemDesc = `id:15152`; iCumRate +=150;}	// @뉴욕마리오 웨이스트 테일러 웨어(여성용)	0.024970576
			case(45){itemDesc = `id:15153`; iCumRate +=150;}	// @산드라 스나이퍼 수트(남성용)	0.024970576
			case(46){itemDesc = `id:15154`; iCumRate +=150;}	// @산드라 스나이퍼 수트(여성용)	0.024970576
			case(47){itemDesc = `id:15155`; iCumRate +=150;}	// @이디카이 성직자 예복(남성용)	0.024970576
			case(48){itemDesc = `id:15156`; iCumRate +=150;}	// @이디카이 성직자 예복(여성용)	0.024970576
			case(49){itemDesc = `id:15157`; iCumRate +=150;}	// @위스 보위군 의복(남성용)	0.024970576
			case(50){itemDesc = `id:15158`; iCumRate +=150;}	// @위스 보위군 의복(여성용)	0.024970576
			case(51){itemDesc = `id:19018`; iCumRate +=150;}	// @자부신선 임페리얼 로브	0.024970576
			case(52){itemDesc = `id:19019`; iCumRate +=150;}	// @라카드 레이어드 머플러 로브	0.024970576
			case(53){itemDesc = `id:19020`; iCumRate +=150;}	// @나타네 설산용 코트	0.024970576
			case(54){itemDesc = `id:13006`; iCumRate +=100;}	// @플레이트 메일	0.016647051
			case(55){itemDesc = `id:13010`; iCumRate +=100;}	// @라운드 폴드론 체인메일	0.016647051
			case(56){itemDesc = `id:13012`; iCumRate +=100;}	// @스케일 아머	0.016647051
			case(57){itemDesc = `id:13015`; iCumRate +=100;}	// @브리건딘	0.016647051
			case(58){itemDesc = `id:13017`; iCumRate +=100;}	// @서코트 체인메일	0.016647051
			case(59){itemDesc = `id:15134`; iCumRate +=100;}	// @고딕 베이직 수트	0.016647051
			case(60){itemDesc = `id:15135`; iCumRate +=100;}	// @시크 수트	0.016647051
			case(61){itemDesc = `id:15136`; iCumRate +=100;}	// @고딕 레이스 스커트	0.016647051
			case(62){itemDesc = `id:15138`; iCumRate +=100;}	// @트루디 헌팅 수트	0.016647051
			case(63){itemDesc = `id:15008`; iCumRate +=60;}	// 검사학교 교복	0.009988231
			case(64){itemDesc = `id:15037`; iCumRate +=60;}	// 검사학교 교복	0.009988231
			case(65){itemDesc = `id:15111`; iCumRate +=60;}	// @포크룩 웨어	0.009988231
			case(66){itemDesc = `id:15061`; iCumRate +=20;}	// 물결무늬 옆트임 튜닉	0.00332941
			case(67){itemDesc = `id:15065`; iCumRate +=20;}	// @엘라 베스트 스커트	0.00332941
			case(68){itemDesc = `id:15067`; iCumRate +=20;}	// 동양풍 무사복	0.00332941
			case(69){itemDesc = `id:15073`; iCumRate +=20;}	// 용소저 무도복	0.00332941
			case(70){itemDesc = `id:15108`; iCumRate +=20;}	// @섹시 레이디스 탱크탑	0.00332941
			case(71){itemDesc = `id:15055`; iCumRate +=10;}	// @레더 미니 원피스	0.001664705
			case(72){itemDesc = `id:15056`; iCumRate +=10;}	// @레더 미니 원피스 링타입	0.001664705
			case(73){itemDesc = `id:15057`; iCumRate +=10;}	// @롱 레더 코트 (무광)	0.001664705
			case(74){itemDesc = `id:15059`; iCumRate +=10;}	// 터크스 탱크탑 반바지	0.001664705
			case(75){itemDesc = `id:15060`; iCumRate +=10;}	// @슬림 이너로브 웨어	0.001664705
			case(76){itemDesc = `id:15062`; iCumRate +=10;}	// @지그재그 튜닉	0.001664705
			case(77){itemDesc = `id:15063`; iCumRate +=10;}	// @레이어드 프릴 원피스	0.001664705
			case(78){itemDesc = `id:15064`; iCumRate +=10;}	// @아이돌 리본 드레스	0.001664705
			case(79){itemDesc = `id:15066`; iCumRate +=10;}	// @루이스 베스트 웨어	0.001664705
			case(80){itemDesc = `id:15070`; iCumRate +=10;}	// @스탠드칼라 슬리브리스	0.001664705
			case(81){itemDesc = `id:15074`; iCumRate +=10;}	// @루이스 성직자 코트	0.001664705
			case(82){itemDesc = `id:15075`; iCumRate +=10;}	// @셀리나 레이디 드레스	0.001664705
			case(83){itemDesc = `id:15095`; iCumRate +=10;}	// @셀리나 오픈 레더 자켓	0.001664705
			case(84){itemDesc = `id:15096`; iCumRate +=10;}	// @셀리나 섹시 베어룩	0.001664705
			case(85){itemDesc = `id:15107`; iCumRate +=10;}	// @몬거 더플 코트	0.001664705
			case(86){itemDesc = `id:15109`; iCumRate +=10;}	// @티핑 수트	0.001664705
			case(87){itemDesc = `id:15110`; iCumRate +=10;}	// @셀리나 정장	0.001664705
			case(88){itemDesc = `id:15112`; iCumRate +=10;}	// @셀리나 스쿨보이룩	0.001664705
			case(89){itemDesc = `id:15113`; iCumRate +=10;}	// 여성용 검사학교 교복 쇼트타입	0.001664705
			case(90){itemDesc = `id:15114`; iCumRate +=10;}	// 남성용 검사학교 교복 롱타입	0.001664705
			case(91){itemDesc = `id:15115`; iCumRate +=10;}	// @재기드 미니 스커트	0.001664705
			case(92){itemDesc = `id:15116`; iCumRate +=10;}	// 여성용 마법사 정장	0.001664705
			case(93){itemDesc = `id:15117`; iCumRate +=10;}	// 남성용 마법사 정장	0.001664705
			case(94){itemDesc = `id:15118`; iCumRate +=10;}	// 남성용 검사학교 교복 쇼트타입	0.001664705
			case(95){itemDesc = `id:15119`; iCumRate +=10;}	// 여성용 검사학교 교복 롱타입	0.001664705
			case(96){itemDesc = `id:15127`; iCumRate +=10;}	// @셀리나 트래디셔널 코트	0.001664705
			case(97){itemDesc = `id:15128`; iCumRate +=10;}	// @투 톤 비조 드레스	0.001664705
			case(98){itemDesc = `id:15131`; iCumRate +=10;}	// @핀 에이프런 스커트	0.001664705
			case(99){itemDesc = `id:15132`; iCumRate +=10;}	// @내추럴 베스트 웨어	0.001664705
			case(100){itemDesc = `id:15013`; iCumRate +=5;}	// 차이나드레스	0.000832353
			case(101){itemDesc = `id:15017`; iCumRate +=5;}	// 차이나드레스	0.000832353
			case(102){itemDesc = `id:13018`; iCumRate +=1;}	// @더블 링메일	0.000166471
			case(103){itemDesc = `id:13031`; iCumRate +=1;}	// @스파이카 실버 플레이트 아머	0.000166471
			case(104){itemDesc = `id:13032`; iCumRate +=1;}	// @발렌시아 크로스 라인 플레이트 아머(여성용)	0.000166471
			case(105){itemDesc = `id:13033`; iCumRate +=1;}	// @발렌시아 크로스 라인 플레이트 아머(남성용)	0.000166471
			case(106){itemDesc = `id:13038`; iCumRate +=1;}	// @더스틴 실버 나이트 아머	0.000166471
			case(107){itemDesc = `id:13043`; iCumRate +=1;}	// @레미니아 성월의 갑옷(남성용)	0.000166471
			case(108){itemDesc = `id:13044`; iCumRate +=1;}	// @레미니아 성월의 갑옷(여성용)	0.000166471
			case(109){itemDesc = `id:13045`; iCumRate +=1;}	// @아리쉬 아슈빈 아머(남성용)	0.000166471
			case(110){itemDesc = `id:13046`; iCumRate +=1;}	// @아리쉬 아슈빈 아머(여성용)	0.000166471
			case(111){itemDesc = `id:13047`; iCumRate +=1;}	// @키리누스진 하프 플레이트 아머(남성용)	0.000166471
			case(112){itemDesc = `id:13048`; iCumRate +=1;}	// @키리누스진 하프 플레이트 아머(여성용)	0.000166471
			case(113){itemDesc = `id:14015`; iCumRate +=1;}	// @클라우스 머플러 레더 메일	0.000166471
			case(114){itemDesc = `id:14016`; iCumRate +=1;}	// @크로스벨트 레더 코트	0.000166471
			case(115){itemDesc = `id:14017`; iCumRate +=1;}	// @쓰리벨트 레더 메일	0.000166471
			case(116){itemDesc = `id:15137`; iCumRate +=1;}	// @셀리나 하프 재킷 코트	0.000166471
			case(117){itemDesc = `id:13055`; iCumRate +=3;}	// @콜린 플레이트 아머	0.000499412
			case(118){itemDesc = `id:16541`; iCumRate +=3;}	// @콜린 플레이트 건틀렛	0.000499412
			case(119){itemDesc = `id:17528`; iCumRate +=3;}	// @콜린 플레이트 부츠	0.000499412
			case(120){itemDesc = `id:18557`; iCumRate +=3;}	// @콜린 플레이트 헬멧	0.000499412
			case(121){itemDesc = `id:17520`; iCumRate +=3;}	// 큰 새 다리 부츠	0.000499412
			case(122){itemDesc = `id:18550`; iCumRate +=3;}	// 번개 전사의 투구	0.000499412
			case(123){itemDesc = `id:40225`; iCumRate +=1;}	// @윙 보우	0.000166471
			case(124){itemDesc = `id:40224`; iCumRate +=1;}	// @링 보우	0.000166471
			case(125){itemDesc = `id:46009`; iCumRate +=1;}	// 주시자의 방패	0.000166471
			case(126){itemDesc = `id:40226`; iCumRate +=1;}	// 주시자의 검	0.000166471
			case(127){itemDesc = `id:18043`; iCumRate +=1;}	// 코레스 니트 모자	0.000166471
			case(128){itemDesc = `id:40198`; iCumRate +=1;}	// 상아검	0.000166471
			case(129){itemDesc = `id:1205`; iCumRate +=2;}	// 영원한 휴식	0.000332941
			case(130){itemDesc = `id:64506`; iCumRate +=50;}	// 탐험 일지 1페이지	0.008323525
			case(131){itemDesc = `id:64508`; iCumRate +=3;}	// 탐험 일지 3페이지	0.000499412
			case(132){itemDesc = `id:64510`; iCumRate +=50;}	// 탐험 일지 5페이지	0.008323525
			case(133){itemDesc = `id:14045`; iCumRate +=3;}	// 소라 갑옷(여성용)	0.000499412
			case(134){itemDesc = `id:14046`; iCumRate +=3;}	// 소라 갑옷(남성용)	0.000499412
			case(135){itemDesc = `id:16540`; iCumRate +=3;}	// 소라 건틀렛	0.000499412
			case(136){itemDesc = `id:17127`; iCumRate +=3;}	// 소라 부츠(여성용)	0.000499412
			case(137){itemDesc = `id:17129`; iCumRate +=3;}	// 소라 부츠(남성용)	0.000499412
			case(138){itemDesc = `id:18556`; iCumRate +=3;}	// 소라 투구(여성용)	0.000499412
			case(139){itemDesc = `id:18558`; iCumRate +=3;}	// 소라 투구(남성용)	0.000499412
			case(140){itemDesc = `id:19030`; iCumRate +=24000;}	// @자이언트 트래디셔널 로브	3.995292214
			case(141){itemDesc = `id:19029`; iCumRate +=1;}	// @자이언트 베어 로브	0.000166471
			case(142){itemDesc = `id:40175`; iCumRate +=12000;}	// @그레이트 말렛	1.997646107
			case(143){itemDesc = `id:40216`; iCumRate +=3000;}	// 심벌즈	0.499411527
			case(144){itemDesc = `id:14035`; iCumRate +=10;}	// @피르타 레더 아머	0.001664705
			case(145){itemDesc = `id:13052`; iCumRate +=1;}	// @발렌시아 크로스 라인 플레이트 아머(자이언트용)	0.000166471

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
			DebugOut(`보물상자에 `+itemDesc+` 넣음`);
			return itemDesc;
		}
		
		++i;
	}
	return `id:51003 count:1`; //아이템이 안나왔다...
}
////////////////////////////////////////////////////////////////////////////////
server string GetMonsterRace()
// : 아이템 보상을 결정 by Blindex
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(86003);

	while(true)
	{
		bool bBreak = false;
		string RaceDesc;
		switch(i) 
		//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
		{
			case(0){RaceDesc = `Skeleton`; iCumRate += 10000;} //스켈레톤11.62750137
			case(1){RaceDesc = `SkeletonSoldier`; iCumRate += 8000;} //스켈레톤 병사9.302001093
			case(2){RaceDesc = `SkeletonArmorA`; iCumRate += 5000;} //스켈레톤5.813750683
			case(3){RaceDesc = `SkeletonArmorB`; iCumRate += 5000;} //스켈레톤5.813750683
			case(4){RaceDesc = `PoisonSkeletonSoldier`; iCumRate += 5000;} //포이즌 스켈레톤 병사5.813750683
			case(5){RaceDesc = `SkeletonArmorC`; iCumRate += 5000;} //스켈레톤5.813750683
			case(6){RaceDesc = `MetalSkeleton`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(7){RaceDesc = `MetalSkeletonArmorA`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(8){RaceDesc = `MetalSkeletonArmorB`; iCumRate += 4000;} //메탈 스켈레톤4.651000546
			case(9){RaceDesc = `RedSkeleton`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(10){RaceDesc = `RedSkeletonArmorA`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(11){RaceDesc = `RedSkeletonArmorB`; iCumRate += 3000;} //레드 스켈레톤3.48825041
			case(12){RaceDesc = `GiantSkeleton`; iCumRate += 2000;} //거대 스켈레톤2.325500273
			case(13){RaceDesc = `FlyingSword`; iCumRate += 2000;} //플라잉 소드2.325500273
			case(14){RaceDesc = `RedSkeletonArmorC`; iCumRate += 2000;} //레드 스켈레톤2.325500273
			case(15){RaceDesc = `MetalSkeletonArmorC`; iCumRate += 2000;} //메탈 스켈레톤2.325500273
			case(16){RaceDesc = `SkeletonLaghodessa`; iCumRate += 2000;} //해골 라고데사2.325500273
			case(17){RaceDesc = `GhostArmor`; iCumRate += 1000;} //고스트 아머1.162750137
			case(18){RaceDesc = `BlackSpider`; iCumRate += 1000;} //검은거미1.162750137
			case(19){RaceDesc = `RedSpider`; iCumRate += 1000;} //붉은거미1.162750137
			case(20){RaceDesc = `GiantSpider`; iCumRate += 1000;} //거대거미1.162750137
			case(21){RaceDesc = `SickleLaghodessa`; iCumRate += 1000;} //낫 라고데사1.162750137
			case(22){RaceDesc = `SpikeLaghodessa`; iCumRate += 1000;} //가시 라고데사1.162750137
			case(23){RaceDesc = `BrownTownRat`; iCumRate += 1000;} //갈색 도시쥐1.162750137
			case(24){RaceDesc = `GrayTownRat`; iCumRate += 1000;} //회색 도시쥐1.162750137
			case(25){RaceDesc = `CountryRat`; iCumRate += 1000;} //시골쥐1.162750137
			case(26){RaceDesc = `BlackTownRat`; iCumRate += 1000;} //검은 도시쥐1.162750137
			case(27){RaceDesc = `LittleCountryRat`; iCumRate += 1000;} //작은 시골쥐1.162750137
			case(28){RaceDesc = `BrownSnake`; iCumRate += 1000;} //갈색 뱀1.162750137
			case(29){RaceDesc = `BlueSnake`; iCumRate += 1000;} //청색 뱀1.162750137
			case(30){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(31){RaceDesc = `WhiteSnake`; iCumRate += 1000;} //흰 뱀1.162750137
			case(32){RaceDesc = `GiantWorm4`; iCumRate += 1000;} //자이언트 웜1.162750137
			case(33){RaceDesc = `Spine_Earthworm`; iCumRate += 1000;} //가시 지렁이1.162750137
			case(34){RaceDesc = `GiantImp`; iCumRate += 1;} //거대 임프0.00116275
			case(35){RaceDesc = `GiantSkeletonImp`; iCumRate += 1;} //거대 스켈레톤 임프0.00116275
			case(36){RaceDesc = `GolemSoldier`; iCumRate += 1;} //골렘0.00116275
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
			RaceDesc=RaceDesc+`:`+ToString(Random(3));
			DebugOut(`보물상자에 `+RaceDesc+` 배치`);
			return RaceDesc;
		}
		
		++i;
	}
	return `CountryRat:1`; //아이템이 안나왔다...

}
////////////////////////////////////////////////////////////////////////////////
server void  MoneyCount(prop _this)

////////////////////////////////////////////////////////////////////////////////
{
	int money=Random(100);

	if(Random(100)<50) //50% 200골드정도로 불려줌
	{
		money+=100+ Random(100);
	}

	if(Random(100)==0) //1%로 1000골드 불려줌
	{
		money+=1000+ Random(100);
	}
	if(Random(1000)==1) //1/1000로 10000골드 불려줌
	{
		money+=10000+ Random(1000);
	}
	if(Random(5000)==1) //1/5000로 2배
	{
		money=money*2;
	}
	
	int gold=money/1000; //천원자리금덩이수
	int remaingold=money%1000;	//천원안되는돈
	int i;
	for(i=0;i<gold;i++)
	{
		_this.AddItem(`id:2000 count:1000`);
	}
	_this.AddItem(`id:2000 count:`+ToString(remaingold));
}