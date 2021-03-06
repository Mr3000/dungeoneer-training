//////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project WaterBalloonBattle Script
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void InitializeEvent()
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		// region : 이벤트 리전 번호
		// diff_team : red - blue 팀 멤버 수 차이 허용
		// max_wb : 물풍선 소지 개수 최대
		// max_cp : 캐릭터 포인트 최대
		// ready_time : 이벤트 시작후 실제 게임 준비 시간 (ms)
		// play_time : 실제 게임 플레이 시간 (ms)
		// break_time : 휴식 시간 (ms)
		// finish_time : 게임 마무리 후 종료 시간 (ms)
		// 반복 플레이 횟수 (play + break) * n
		// cp_hb (character point - hit balloon)
		// cp_bb (character point - burst balloon)
		// cp_hc (character point - hit character)
		// cp_dc (character point - down character)
		// victory point (for gameover)
		// hit_delay
		// respawn_delay (down -> respawn)
		if (GetLocale().LowerCase() == `korea`)
		{
			InitializeWaterBalloonBattle(`region:301 diff_team:5 wb:61511 max_wb:20 max_cp:10 ready_time:60000 play_time:300000 break_time:0 finish_time:60000 play_count:1 cp_hb:2 cp_bb:10 cp_hc:1 cp_dc:4 victory_point:120 hit_delay:500 respawn_delay:10000`);
		}
		else
		{
			// 해외는 diff_team을 조정한다.
			InitializeWaterBalloonBattle(`region:301 diff_team:4 wb:61511 max_wb:20 max_cp:10 ready_time:60000 play_time:300000 break_time:0 finish_time:60000 play_count:1 cp_hb:2 cp_bb:10 cp_hc:1 cp_dc:4 victory_point:120 hit_delay:500 respawn_delay:10000`);
		}
		
		// 이벤트 프랍 생성
		// name, prop classid, x, z, angle, state, extra
		// name : 시작이 red -> red팀, blu -> blue팀, 기타 -> 중립
		// angle : degree 기준
		CreateWBBEventProp(`red_reload1`, 41943, 76168, 91283,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`red_reload2`, 41943, 76497, 97806,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`blue_reload1`, 41949, 81683, 87677,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`blue_reload2`, 41949, 87429, 90659,  0, `default`, `color1:FF808080`);
		
		CreateWBBEventProp(`red_balloon1`, 41942, 75538, 90319,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`red_balloon2`, 41942, 79964, 92789,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`red_balloon3`, 41942, 88059, 91622,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`neutral_balloon1`, 41942, 78925, 89480,  0, ``, `hp:4 hit_point:1 burst_point:60 color1:fff2e435`);
		CreateWBBEventProp(`neutral_balloon2`, 41942, 82642, 95164,  0, ``, `hp:4 hit_point:1 burst_point:60 color1:fff2e435`);
		CreateWBBEventProp(`blue_balloon1`, 41942, 81053, 86713,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ff2170e7`);
		CreateWBBEventProp(`blue_balloon2`, 41942, 81540, 91758,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ff2170e7`);
		CreateWBBEventProp(`blue_balloon3`, 41942, 77127, 98770,  0, ``, `hp:4 hit_point:1 burst_point:40 color1:ff2170e7`);
	}
	else
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			InitializeWaterBalloonBattle(`region:301 diff_team:10 wb:61511 max_wb:20 max_cp:10 ready_time:600000 play_time:1200000 break_time:0 finish_time:300000 play_count:1 cp_hb:2 cp_bb:10 cp_hc:1 cp_dc:4 victory_point:120 hit_delay:500 respawn_delay:10000`);
		}
		else
		{
			// 해외는 diff_team을 조정한다.
			InitializeWaterBalloonBattle(`region:301 diff_team:4 wb:61511 max_wb:20 max_cp:10 ready_time:600000 play_time:1200000 break_time:0 finish_time:300000 play_count:1 cp_hb:2 cp_bb:10 cp_hc:1 cp_dc:4 victory_point:120 hit_delay:500 respawn_delay:10000`);
		}
		
		// 이벤트 프랍 생성
		// name, prop classid, x, z, angle, state, extra
		// name : 시작이 red -> red팀, blu -> blue팀, 기타 -> 중립
		// angle : degree 기준
		CreateWBBEventProp(`red_reload1`, 41943, 76168, 91283,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`red_reload2`, 41943, 76497, 97806,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`blue_reload1`, 41949, 81683, 87677,  0, `default`, `color1:FF808080`);
		CreateWBBEventProp(`blue_reload2`, 41949, 87429, 90659,  0, `default`, `color1:FF808080`);
		
		CreateWBBEventProp(`red_balloon1`, 41942, 75538, 90319,  0, ``, `hp:800 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`red_balloon2`, 41942, 79964, 92789,  0, ``, `hp:650 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`red_balloon3`, 41942, 88059, 91622,  0, ``, `hp:650 hit_point:1 burst_point:40 color1:ffdd373c`);
		CreateWBBEventProp(`neutral_balloon1`, 41942, 78925, 89480,  0, ``, `hp:1200 hit_point:1 burst_point:60 color1:fff2e435`);
		CreateWBBEventProp(`neutral_balloon2`, 41942, 82642, 95164,  0, ``, `hp:1200 hit_point:1 burst_point:60 color1:fff2e435`);
		CreateWBBEventProp(`blue_balloon1`, 41942, 81053, 86713,  0, ``, `hp:800 hit_point:1 burst_point:40 color1:ff2170e7`);
		CreateWBBEventProp(`blue_balloon2`, 41942, 81540, 91758,  0, ``, `hp:650 hit_point:1 burst_point:40 color1:ff2170e7`);
		CreateWBBEventProp(`blue_balloon3`, 41942, 77127, 98770,  0, ``, `hp:650 hit_point:1 burst_point:40 color1:ff2170e7`);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void FinalizeEvent()
//////////////////////////////////////////////////////////////////////////////////
{
	//GetMemberListWBBTeam
	//GetWBBBestMember

	// 게임 종료 시레드팀, 블루팀 멤버 가져오기
	object_list redMemberList = GetMemberListWBBTeam(0);
	object_list blueMemberList = GetMemberListWBBTeam(1);
	character cChar;
	int i;

	// 개인 점수가 10점 이상인 유저는 타이틀 획득
	for(i=0; i<redMemberList.GetSize(); i++)
	{
		cChar = (character)redMemberList.GetValue(i);
		if (cChar.GetWBBScore() >= 10)
		{
			cChar.DoStript(`addtitle(11011)`);
		}
	}

	for(i=0; i<blueMemberList.GetSize(); i++)
	{
		cChar = (character)blueMemberList.GetValue(i);
		if (cChar.GetWBBScore() >= 10)
		{
			cChar.DoStript(`addtitle(11011)`);
		}
	}
}
