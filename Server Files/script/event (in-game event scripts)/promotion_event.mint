//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// 

//////////////////////////////////////////////////////////////////////////////////
server void OnTimeElapsed(int promotionId, int skillId, int skillLevel, int time)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	// Promotion_AllocMonster : 몬스터를 배치한다. 
	// Promotion_ChangeMonsterGhostMode : 몬스터가 투명해지게 한다. false로 바꾸면 투명이 풀린다.
	// Promotion_ChangeMonsterInstantMode : 이 명령을 내릴 당시 그 지역에 있던 몬스터가 리스폰 안 하게 한다. false로 바꾸면 다시 나옴
	// Promotion_FreeMonster(promotion id, event box) : 몬스터를 날려 버린다.
	// Promotion_FreeAllMonsters(promotionId) : 몬스터를 다 날려 버린다.

	int SpawnBoxSelect = 0;

	if (skillId == 20001)		// 디펜스
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 녹색 그렘린
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 녹색 그렘린 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1307)`, false);	// 놀1 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1307)`, false);	// 놀1 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1307)`, false);	// 놀1 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1307)`, false);	// 놀1 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 녹색 그렘린 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀1 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀1 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 되게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// 트롤 등장
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 트롤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 트롤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1312)`, false);	// 레드 코볼트 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1312)`, false);	// 레드 코볼트 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1312)`, false);	// 레드 코볼트 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1312)`, false);	// 레드 코볼트 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1312)`, false);	// 레드 코볼트 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 붉은 낫 라고데사 모두 소환 해제
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1316)`, false);	// 메탈 스켈레톤
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 메탈 스켈레톤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1320)`, false);	// 놀2 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1320)`, false);	// 놀2 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1320)`, false);	// 놀2 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1320)`, false);	// 놀2 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 메탈 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀2 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀2 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// 골렘 + 촌촌 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 골렘+촌촌 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 골렘+촌촌 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1324)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1324)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1324)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1324)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1328)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1328)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1328)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1328)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1328)`, false);	// 해적 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1332)`, false);	// 사하긴 파이터+사하긴 레인저
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 사하긴 파이터+사하긴 레인저 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 사하긴 파이터+사하긴 레인저 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 붉은 도시쥐 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// 오거 전사+베어울프 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 오거 전사+베어울프 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 오거 전사+베어울프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1337)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1337)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1337)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1337)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1337)`, false);	// 갑주 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 갑주 레드 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1341)`, false);	// 다크 랫맨 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1341)`, false);	// 다크 랫맨 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1341)`, false);	// 다크 랫맨 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1341)`, false);	// 다크 랫맨 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1341)`, false);	// 다크 랫맨 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제
			}
		}
	}
	else
	if (skillId == 20002)		// 스매시
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 녹색 그렘린
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 녹색 그렘린 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1308)`, false);	// 놀1 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1308)`, false);	// 놀1 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1308)`, false);	// 놀1 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1308)`, false);	// 놀1 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 녹색 그렘린 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀1 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀1 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 되게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// 트롤 등장
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 트롤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 트롤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1313)`, false);	// 레드 코볼트 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1313)`, false);	// 레드 코볼트 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1313)`, false);	// 레드 코볼트 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1313)`, false);	// 레드 코볼트 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1313)`, false);	// 레드 코볼트 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 붉은 낫 라고데사 모두 소환 해제
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1317)`, false);	// 메탈 스켈레톤
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 메탈 스켈레톤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1321)`, false);	// 놀2 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1321)`, false);	// 놀2 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1321)`, false);	// 놀2 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1321)`, false);	// 놀2 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 메탈 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀2 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀2 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// 골렘 + 촌촌 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 골렘+촌촌 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 골렘+촌촌 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1325)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1325)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1325)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1325)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1329)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1329)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1329)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1329)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1329)`, false);	// 해적 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1333)`, false);	// 사하긴 파이터+사하긴 레인저
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 사하긴 파이터+사하긴 레인저 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 사하긴 파이터+사하긴 레인저 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 붉은 도시쥐 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// 오거 전사+베어울프 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 오거 전사+베어울프 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 오거 전사+베어울프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1338)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1338)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1338)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1338)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1338)`, false);	// 갑주 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 갑주 레드 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1342)`, false);	// 다크 랫맨 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1342)`, false);	// 다크 랫맨 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1342)`, false);	// 다크 랫맨 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1342)`, false);	// 다크 랫맨 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1342)`, false);	// 다크 랫맨 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제
			}
		}
	}
	else
	if (skillId == 20003)		// 카운터 어택
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 녹색 그렘린
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 녹색 그렘린 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1309)`, false);	// 놀1 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1309)`, false);	// 놀1 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1309)`, false);	// 놀1 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1309)`, false);	// 놀1 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 녹색 그렘린 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀1 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀1 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 되게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// 트롤 등장
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 트롤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 트롤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1314)`, false);	// 레드 코볼트 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1314)`, false);	// 레드 코볼트 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1314)`, false);	// 레드 코볼트 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1314)`, false);	// 레드 코볼트 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1314)`, false);	// 레드 코볼트 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 붉은 낫 라고데사 모두 소환 해제
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1318)`, false);	// 메탈 스켈레톤
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 메탈 스켈레톤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1322)`, false);	// 놀2 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1322)`, false);	// 놀2 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1322)`, false);	// 놀2 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1322)`, false);	// 놀2 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 메탈 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀2 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀2 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// 골렘 + 촌촌 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 골렘+촌촌 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 골렘+촌촌 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1326)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1326)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1326)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1326)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1330)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1330)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1330)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1330)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1330)`, false);	// 해적 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1334)`, false);	// 사하긴 파이터+사하긴 레인저
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 사하긴 파이터+사하긴 레인저 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 사하긴 파이터+사하긴 레인저 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 붉은 도시쥐 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// 오거 전사+베어울프 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 오거 전사+베어울프 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 오거 전사+베어울프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1339)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1339)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1339)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1339)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1339)`, false);	// 갑주 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 갑주 레드 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1343)`, false);	// 다크 랫맨 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1343)`, false);	// 다크 랫맨 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1343)`, false);	// 다크 랫맨 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1343)`, false);	// 다크 랫맨 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1343)`, false);	// 다크 랫맨 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제
			}
		}
	}
	else
	if (
		(skillId == 22001) ||		// 윈드밀
		(skillId == 21002) ||		// 매그넘 샷
		(skillId == 23002) ||		// 컴뱃 마스터리
		(skillId == 21001) ||		// 레인지 컴뱃 마스터리
		(skillId == 30101) ||		// 라이트닝볼트
		(skillId == 30201) ||		// 파이어볼트
		(skillId == 30301)			// 아이스볼트
	)
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 녹색 그렘린
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 녹색 그렘린 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1310)`, false);	// 놀1 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1310)`, false);	// 놀1 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1310)`, false);	// 놀1 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1310)`, false);	// 놀1 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 녹색 그렘린 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀1 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀1 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀1 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀1 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 되게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// 트롤 등장
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 트롤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// 붉은 낫 라고데사 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 트롤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 붉은 낫 라고데사 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1315)`, false);	// 레드 코볼트 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1315)`, false);	// 레드 코볼트 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1315)`, false);	// 레드 코볼트 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1315)`, false);	// 레드 코볼트 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1315)`, false);	// 레드 코볼트 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 붉은 낫 라고데사 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 붉은 낫 라고데사 모두 소환 해제
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1319)`, false);	// 메탈 스켈레톤
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 메탈 스켈레톤 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1323)`, false);	// 놀2 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1323)`, false);	// 놀2 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1323)`, false);	// 놀2 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1323)`, false);	// 놀2 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 메탈 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 놀2 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 놀2 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 놀2 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 놀2 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// 골렘 + 촌촌 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 골렘+촌촌 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 골렘+촌촌 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1327)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1327)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1327)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1327)`, false);	// 녹색 뱀+고블린 헌터 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 녹색 뱀+고블린 헌터 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1331)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1331)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1331)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1331)`, false);	// 해적 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1331)`, false);	// 해적 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 녹색 뱀+고블린 헌터 모두 소환 해제
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1335)`, false);	// 사하긴 파이터+사하긴 레인저
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// 일단 투명화
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20초 지나면 투명화 풀기
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 사하긴 파이터+사하긴 레인저 더 이상 리스폰 안 되게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// 붉은 도시쥐 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 사하긴 파이터+사하긴 레인저 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 붉은 도시쥐 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// 우등생 임프 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// 우등생 임프 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 붉은 도시쥐 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 붉은 도시쥐 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 우등생 임프 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 우등생 임프 더 이상 리스폰 안 하게

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// 오거 전사+베어울프 등장
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 우등생 임프 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 우등생 임프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 오거 전사+베어울프 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 오거 전사+베어울프 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1340)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1340)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1340)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1340)`, false);	// 갑주 레드 스켈레톤 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1340)`, false);	// 갑주 레드 스켈레톤 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// 갑주 레드 스켈레톤 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// 로스트 사하긴 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// 갑주 레드 스켈레톤 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// 갑주 레드 스켈레톤 모두 소환 해제

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// 로스트 사하긴 더 이상 리스폰 안 하게

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1344)`, false);	// 다크 랫맨 등장
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1344)`, false);	// 다크 랫맨 등장
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1344)`, false);	// 다크 랫맨 등장
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1344)`, false);	// 다크 랫맨 등장
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1344)`, false);	// 다크 랫맨 등장
					}
					default	// 그럴 일은 없겠지만 이도 저도 아닐 땐 걍 디폴트
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// 로스트 사하긴 모두 소환 해제
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// 로스트 사하긴 모두 소환 해제
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnTesterDied(int promotionId, int skillId, int skillLevel, character tester)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	int DecreasePoint = tester.GetPromotionTestPoint() * ((skillLevel-14)*2+8) / 100;	// 1랭크일 때 10% 감소, 8단일 때 26% 감소
	tester.RemovePromotionTestPoint(DecreasePoint);
	return;
}

//////////////////////////////////////////////////////////////////////////////////
server void OnAllTesterDied(int promotionId, int skillId, int skillLevel)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1345)`, true);	// 자이언트 웜 등장. 리젠 안 됨
}

//////////////////////////////////////////////////////////////////////////////////
server void OnAllMonsterDied(int promotionId, int skillId, int skillLevel)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1346)`, true);	// 버그베어 등장. 리젠 안 됨
}

//////////////////////////////////////////////////////////////////////////////////
server void OnTestEnd(int promotionid, int skillid, int skilllevel, character me, bool promote)
// : 테스트가 종료되었다.
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetDate()>=1106 && GetDate()<=1128)
	{
		me.AddKeyword(`Promotion_Event`);
	}
}

/*
잠시 주석 처리

//////////////////////////////////////////////////////////////////////////////////
server void OnTotalPointMoreThan(int promotionId, int skillId, int skillLevel, int point)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	if (skillId == 20001)		// 디펜스
	{
		if (skillLevel == 16)
		{
			if (point == 1000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 갑주 레드 스켈레톤 등장
			}
			else if (point == 2000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 갑주 레드 스켈레톤 등장
			}
			else if (point == 3000)
			{
				Promotion_FreeAllMonsters(promotionId);
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnAveragePointMoreThan(int promotionId, int skillId, int skillLevel, int point)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	if (skillId == 20001)		// 디펜스
	{
		if (skillLevel == 16)
		{
			if (point == 1000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 갑주 레드 스켈레톤 등장
			}
			else if (point == 2000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// 갑주 레드 스켈레톤 등장
			}
			else if (point == 3000)
			{
				Promotion_FreeAllMonsters(promotionId);
			}
		}
	}
}

*/