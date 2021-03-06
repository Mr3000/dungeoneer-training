//////////////////////////////////////////////////////////////////////////////////
//                                      Mabinogi Project WaterBalloonBattle Script
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void initialize_banquet_event_2009_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	int itemProbabilityStrong = 0;
	int maxProbabilityStrong = 0;

	int itemProbabilityMuchStrong = 0;
	int maxProbabilityMuchStrong = 0;

	int itemProbabilityBoss = 0;
	int maxProbabilityBoss = 0;

	// 개발 서버는 확률 높게
	if (IsDevelopment())
	{
		// 강함은 5%
		itemProbabilityStrong = 5;
		maxProbabilityStrong = 95;

		// 매우 강함은 10%
		itemProbabilityMuchStrong = 10;
		maxProbabilityMuchStrong = 90;

		// 보스는 15%
		itemProbabilityBoss = 15;
		maxProbabilityBoss = 85;
	}
	else
	{
		// 강함은 0.05%
		itemProbabilityStrong = 5;
		maxProbabilityStrong = 9995;

		// 매우 강함은 0.1%
		itemProbabilityMuchStrong = 10;
		maxProbabilityMuchStrong = 9990;

		// 보스는 0.15%
		itemProbabilityBoss = 15;
		maxProbabilityBoss = 9985;
	}

	AddEventMonsterDropItem(`banquet_event_2009_korea`, `Strong`, `id:52115`, itemProbabilityStrong);
	AddEventMonsterDropItem(`banquet_event_2009_korea`, `Strong`, ``, maxProbabilityStrong);
	
	AddEventMonsterDropItem(`banquet_event_2009_korea`, `MuchStrong`, `id:52115`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`banquet_event_2009_korea`, `MuchStrong`, ``, maxProbabilityMuchStrong);
	
	AddEventMonsterDropItem(`banquet_event_2009_korea`, `Boss`, `id:52115`, itemProbabilityBoss);
	AddEventMonsterDropItem(`banquet_event_2009_korea`, `Boss`, ``, maxProbabilityBoss);
}

/////////////////////////////////////////////////////////////////////////////////
server void finalize_banquet_event_2009_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	ClearEventMonsterDropItem(`banquet_event_2009_korea`);
}

//////////////////////////////////////////////////////////////////////////////////
server void initialize_worldcup_32_1_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	int itemProbabilitySame = 0;
	int maxProbabilitySame = 0;

	int itemProbabilityStrong = 0;
	int maxProbabilityStrong = 0;

	int itemProbabilityMuchStrong = 0;
	int maxProbabilityMuchStrong = 0;

	int itemProbabilityBoss = 0;
	int maxProbabilityBoss = 0;

	// 개발 서버는 확률 높게
	if (IsDevelopment())
	{
		// 동급은 5%
		itemProbabilitySame = 5;
		maxProbabilitySame = 65;

		// 강함은 5%
		itemProbabilityStrong = 5;
		maxProbabilityStrong = 65;

		// 매우 강함은 10%
		itemProbabilityMuchStrong = 10;
		maxProbabilityMuchStrong = 30;

		// 보스는 10%
		itemProbabilityBoss = 10;
		maxProbabilityBoss = 35;
	}
	else
	{
		// 동급은 0.07%
		itemProbabilitySame = 7;
		maxProbabilitySame = 9951;

		// 강함은 0.1%
		itemProbabilityStrong = 10;
		maxProbabilityStrong = 9930;	// 10000 - (10 * 7)

		// 매우 강함은 0.2%
		itemProbabilityMuchStrong = 20;
		maxProbabilityMuchStrong = 9860;	// 10000 - (20 * 7)

		// 보스는 0.3%
		itemProbabilityBoss = 35;
		maxProbabilityBoss = 9755;	// 10000 - (35 * 7)
	}

	// 아이템 ID는 임시로 등록한 상태, 각 응모권으로 변경해줘야 한다.
	// 응모권 드랍 일정
	// 2010.06.10 00:00 ~ 2010.06.12 20:00	그리스 (1경기)
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52119 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52120 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52121 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52122 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52123 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52124 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, `id:52125 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Same`, ``, maxProbabilitySame);

	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52119 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52120 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52121 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52122 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52123 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52124 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, `id:52125 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Strong`, ``, maxProbabilityStrong);
	
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52119 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52120 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52121 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52122 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52123 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52124 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, `id:52125 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `MuchStrong`, ``, maxProbabilityMuchStrong);
	
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52119 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52120 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52121 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52122 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52123 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52124 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, `id:52125 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_1_event_2010_korea`, `Boss`, ``, maxProbabilityBoss);
}

//////////////////////////////////////////////////////////////////////////////////
server void  finalize_worldcup_32_1_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	ClearEventMonsterDropItem(`worldcup_32_1_event_2010_korea`);
}

//////////////////////////////////////////////////////////////////////////////////
server void initialize_worldcup_32_2_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	int itemProbabilitySame = 0;
	int maxProbabilitySame = 0;

	int itemProbabilityStrong = 0;
	int maxProbabilityStrong = 0;

	int itemProbabilityMuchStrong = 0;
	int maxProbabilityMuchStrong = 0;

	int itemProbabilityBoss = 0;
	int maxProbabilityBoss = 0;

	// 개발 서버는 확률 높게
	if (IsDevelopment())
	{
		// 동급은 5%
		itemProbabilitySame = 5;
		maxProbabilitySame = 65;

		// 강함은 5%
		itemProbabilityStrong = 5;
		maxProbabilityStrong = 65;

		// 매우 강함은 10%
		itemProbabilityMuchStrong = 10;
		maxProbabilityMuchStrong = 30;

		// 보스는 10%
		itemProbabilityBoss = 10;
		maxProbabilityBoss = 35;
	}
	else
	{
		// 동급은 0.07%
		itemProbabilitySame = 7;
		maxProbabilitySame = 9951;

		// 강함은 0.1%
		itemProbabilityStrong = 10;
		maxProbabilityStrong = 9930;	// 10000 - (10 * 7)

		// 매우 강함은 0.2%
		itemProbabilityMuchStrong = 20;
		maxProbabilityMuchStrong = 9860;	// 10000 - (20 * 7)

		// 보스는 0.3%
		itemProbabilityBoss = 35;
		maxProbabilityBoss = 9755;	// 10000 - (35 * 7)
	}

	// 아이템 ID는 임시로 등록한 상태, 각 응모권으로 변경해줘야 한다.
	// 응모권 드랍 일정
	// 2010.06.12 20:00 ~ 2010.06.17 20:00	아르헨티나 (2경기)
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52126 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52127 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52128 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52129 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52130 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52131 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, `id:52132 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Same`, ``, maxProbabilitySame);

	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52126 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52127 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52128 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52129 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52130 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52131 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, `id:52132 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Strong`, ``, maxProbabilityStrong);
	
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52126 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52127 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52128 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52129 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52130 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52131 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, `id:52132 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `MuchStrong`, ``, maxProbabilityMuchStrong);
	
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52126 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52127 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52128 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52129 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52130 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52131 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, `id:52132 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_2_event_2010_korea`, `Boss`, ``, maxProbabilityBoss);
}

//////////////////////////////////////////////////////////////////////////////////
server void  finalize_worldcup_32_2_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	ClearEventMonsterDropItem(`worldcup_32_2_event_2010_korea`);
}

//////////////////////////////////////////////////////////////////////////////////
server void initialize_worldcup_32_3_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	int itemProbabilitySame = 0;
	int maxProbabilitySame = 0;

	int itemProbabilityStrong = 0;
	int maxProbabilityStrong = 0;

	int itemProbabilityMuchStrong = 0;
	int maxProbabilityMuchStrong = 0;

	int itemProbabilityBoss = 0;
	int maxProbabilityBoss = 0;

	// 개발 서버는 확률 높게
	if (IsDevelopment())
	{
		// 동급은 5%
		itemProbabilitySame = 5;
		maxProbabilitySame = 65;

		// 강함은 5%
		itemProbabilityStrong = 5;
		maxProbabilityStrong = 65;

		// 매우 강함은 10%
		itemProbabilityMuchStrong = 10;
		maxProbabilityMuchStrong = 30;

		// 보스는 10%
		itemProbabilityBoss = 10;
		maxProbabilityBoss = 35;
	}
	else
	{
		// 동급은 0.07%
		itemProbabilitySame = 7;
		maxProbabilitySame = 9951;

		// 강함은 0.1%
		itemProbabilityStrong = 10;
		maxProbabilityStrong = 9930;	// 10000 - (10 * 7)

		// 매우 강함은 0.2%
		itemProbabilityMuchStrong = 20;
		maxProbabilityMuchStrong = 9860;	// 10000 - (20 * 7)

		// 보스는 0.3%
		itemProbabilityBoss = 35;
		maxProbabilityBoss = 9755;	// 10000 - (35 * 7)
	}

	// 아이템 ID는 임시로 등록한 상태, 각 응모권으로 변경해줘야 한다.
	// 응모권 드랍 일정
	// 2010.06.17 20:00 ~ 2010.06.23 03:00	나이지리아	(3경기)
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52133 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52134 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52135 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52136 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52137 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52138 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, `id:52139 col1:aa1515`, itemProbabilitySame);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Same`, ``, maxProbabilitySame);

	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52133 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52134 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52135 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52136 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52137 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52138 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, `id:52139 col1:aa1515`, itemProbabilityStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Strong`, ``, maxProbabilityStrong);
	
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52133 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52134 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52135 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52136 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52137 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52138 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, `id:52139 col1:aa1515`, itemProbabilityMuchStrong);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `MuchStrong`, ``, maxProbabilityMuchStrong);
	
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52133 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52134 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52135 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52136 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52137 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52138 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, `id:52139 col1:aa1515`, itemProbabilityBoss);
	AddEventMonsterDropItem(`worldcup_32_3_event_2010_korea`, `Boss`, ``, maxProbabilityBoss);
}

//////////////////////////////////////////////////////////////////////////////////
server void  finalize_worldcup_32_3_event_2010_korea()
//////////////////////////////////////////////////////////////////////////////////
{
	ClearEventMonsterDropItem(`worldcup_32_3_event_2010_korea`);
}