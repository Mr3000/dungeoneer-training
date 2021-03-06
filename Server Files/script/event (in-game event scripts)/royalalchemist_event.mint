//////////////////////////////////////////////////////////////////////////////////
//                                          Mabinogi Project RoyalAlchemist Script
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void Initialize()
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		// max_count : 정식연금술사 카운트
		// min_activity_point : 기존 연금술사 최소 활동 포인트
		// launch_date : 시작 날짜
		// launch_time : 시작 시간
		// selection_interval_m : 선발 시간 간격 (분) 60 * 24 * 7 = 10080(분) = 일주일
		// selection_announce_m : 선발 시간 n(분)전 안내 어나운스
		// mainstreamsupport_maxcount : 메인스트림 도우미 맥스 카운트
		// mainstreamsupport_point : 메인스트림 도우미 포인트
		// royalalchemist_mission_maxcount : 왕정 연금술사 미션 맥스 카운트
		// shadowmission_maxcount : 그림자 미션 맥스 카운트
		// shadowmission_point : 그림자 미션 포인트
		
		InitializeRoyalAlchemist(`max_count:2 min_activity_point:1 launch_date:20090829 launch_time:0000 selection_interval_m:10080 selection_announce_m:5 mainstreamsupport_maxcount:2 mainstreamsupport_point:5 royalalchemist_mission_maxcount:1 shadowmission_maxcount:10 shadowmission_point:1`);
	}
	else
	{
		InitializeRoyalAlchemist(`max_count:100 min_activity_point:60 launch_date:20090829 launch_time:0000 selection_interval_m:10080 selection_announce_m:20 mainstreamsupport_maxcount:2 mainstreamsupport_point:5 royalalchemist_mission_maxcount:1 shadowmission_maxcount:10 shadowmission_point:1`);
	}

}
