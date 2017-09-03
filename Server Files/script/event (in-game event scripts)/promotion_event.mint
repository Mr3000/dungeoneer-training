//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// 

//////////////////////////////////////////////////////////////////////////////////
server void OnTimeElapsed(int promotionId, int skillId, int skillLevel, int time)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	// Promotion_AllocMonster : ���͸� ��ġ�Ѵ�. 
	// Promotion_ChangeMonsterGhostMode : ���Ͱ� ���������� �Ѵ�. false�� �ٲٸ� ������ Ǯ����.
	// Promotion_ChangeMonsterInstantMode : �� ����� ���� ��� �� ������ �ִ� ���Ͱ� ������ �� �ϰ� �Ѵ�. false�� �ٲٸ� �ٽ� ����
	// Promotion_FreeMonster(promotion id, event box) : ���͸� ���� ������.
	// Promotion_FreeAllMonsters(promotionId) : ���͸� �� ���� ������.

	int SpawnBoxSelect = 0;

	if (skillId == 20001)		// ���潺
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ��� �׷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��� �׷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1307)`, false);	// ��1 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1307)`, false);	// ��1 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1307)`, false);	// ��1 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1307)`, false);	// ��1 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��� �׷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��1 �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��1 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ǰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// Ʈ�� ����
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// Ʈ�� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// ���� �� ����� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// Ʈ�� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1312)`, false);	// ���� �ں�Ʈ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1312)`, false);	// ���� �ں�Ʈ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1312)`, false);	// ���� �ں�Ʈ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1312)`, false);	// ���� �ں�Ʈ ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1312)`, false);	// ���� �ں�Ʈ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� �� ����� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1316)`, false);	// ��Ż ���̷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��Ż ���̷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1320)`, false);	// ��2 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1320)`, false);	// ��2 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1320)`, false);	// ��2 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1320)`, false);	// ��2 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��Ż ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��2 �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��2 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// �� + ���� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��+���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��+���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1324)`, false);	// ��� ��+��� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1324)`, false);	// ��� ��+��� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1324)`, false);	// ��� ��+��� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1324)`, false);	// ��� ��+��� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1328)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1328)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1328)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1328)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1328)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��� ��+��� ���� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1332)`, false);	// ���ϱ� ������+���ϱ� ������
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���ϱ� ������+���ϱ� ������ �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// ���� ������ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// ���� ������ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// ���� ������ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// ���� ������ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���ϱ� ������+���ϱ� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ������ �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// ���� ����+������� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ����+������� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ����+������� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1337)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1337)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1337)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1337)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1337)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ���� ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1341)`, false);	// ��ũ ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1341)`, false);	// ��ũ ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1341)`, false);	// ��ũ ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1341)`, false);	// ��ũ ���� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1341)`, false);	// ��ũ ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
			}
		}
	}
	else
	if (skillId == 20002)		// ���Ž�
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ��� �׷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��� �׷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1308)`, false);	// ��1 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1308)`, false);	// ��1 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1308)`, false);	// ��1 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1308)`, false);	// ��1 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��� �׷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��1 �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��1 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ǰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// Ʈ�� ����
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// Ʈ�� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// ���� �� ����� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// Ʈ�� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1313)`, false);	// ���� �ں�Ʈ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1313)`, false);	// ���� �ں�Ʈ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1313)`, false);	// ���� �ں�Ʈ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1313)`, false);	// ���� �ں�Ʈ ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1313)`, false);	// ���� �ں�Ʈ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� �� ����� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1317)`, false);	// ��Ż ���̷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��Ż ���̷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1321)`, false);	// ��2 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1321)`, false);	// ��2 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1321)`, false);	// ��2 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1321)`, false);	// ��2 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��Ż ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��2 �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��2 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// �� + ���� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��+���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��+���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1325)`, false);	// ��� ��+��� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1325)`, false);	// ��� ��+��� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1325)`, false);	// ��� ��+��� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1325)`, false);	// ��� ��+��� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1329)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1329)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1329)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1329)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1329)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��� ��+��� ���� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1333)`, false);	// ���ϱ� ������+���ϱ� ������
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���ϱ� ������+���ϱ� ������ �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// ���� ������ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// ���� ������ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// ���� ������ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// ���� ������ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���ϱ� ������+���ϱ� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ������ �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// ���� ����+������� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ����+������� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ����+������� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1338)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1338)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1338)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1338)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1338)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ���� ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1342)`, false);	// ��ũ ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1342)`, false);	// ��ũ ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1342)`, false);	// ��ũ ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1342)`, false);	// ��ũ ���� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1342)`, false);	// ��ũ ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
			}
		}
	}
	else
	if (skillId == 20003)		// ī���� ����
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ��� �׷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��� �׷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1309)`, false);	// ��1 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1309)`, false);	// ��1 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1309)`, false);	// ��1 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1309)`, false);	// ��1 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��� �׷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��1 �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��1 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ǰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// Ʈ�� ����
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// Ʈ�� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// ���� �� ����� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// Ʈ�� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1314)`, false);	// ���� �ں�Ʈ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1314)`, false);	// ���� �ں�Ʈ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1314)`, false);	// ���� �ں�Ʈ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1314)`, false);	// ���� �ں�Ʈ ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1314)`, false);	// ���� �ں�Ʈ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� �� ����� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1318)`, false);	// ��Ż ���̷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��Ż ���̷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1322)`, false);	// ��2 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1322)`, false);	// ��2 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1322)`, false);	// ��2 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1322)`, false);	// ��2 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��Ż ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��2 �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��2 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// �� + ���� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��+���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��+���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1326)`, false);	// ��� ��+��� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1326)`, false);	// ��� ��+��� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1326)`, false);	// ��� ��+��� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1326)`, false);	// ��� ��+��� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1330)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1330)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1330)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1330)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1330)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��� ��+��� ���� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1334)`, false);	// ���ϱ� ������+���ϱ� ������
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���ϱ� ������+���ϱ� ������ �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// ���� ������ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// ���� ������ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// ���� ������ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// ���� ������ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���ϱ� ������+���ϱ� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ������ �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// ���� ����+������� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ����+������� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ����+������� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1339)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1339)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1339)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1339)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1339)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ���� ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1343)`, false);	// ��ũ ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1343)`, false);	// ��ũ ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1343)`, false);	// ��ũ ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1343)`, false);	// ��ũ ���� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1343)`, false);	// ��ũ ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
			}
		}
	}
	else
	if (
		(skillId == 22001) ||		// �����
		(skillId == 21002) ||		// �ű׳� ��
		(skillId == 23002) ||		// �Ĺ� �����͸�
		(skillId == 21001) ||		// ������ �Ĺ� �����͸�
		(skillId == 30101) ||		// ����Ʈ�׺�Ʈ
		(skillId == 30201) ||		// ���̾Ʈ
		(skillId == 30301)			// ���̽���Ʈ
	)
	{
		if (skillLevel == 15)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ��� �׷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 60)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��� �׷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1310)`, false);	// ��1 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1310)`, false);	// ��1 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1310)`, false);	// ��1 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1310)`, false);	// ��1 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 130)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��� �׷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��1 �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��1 �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 170)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��1 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��1 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ǰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1303)`, false);	// Ʈ�� ����
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// Ʈ�� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1311)`, false);	// ���� �� ����� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1311)`, false);	// ���� �� ����� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// Ʈ�� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� �� ����� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1315)`, false);	// ���� �ں�Ʈ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1315)`, false);	// ���� �ں�Ʈ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1315)`, false);	// ���� �ں�Ʈ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1315)`, false);	// ���� �ں�Ʈ ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1315)`, false);	// ���� �ں�Ʈ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� �� ����� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� �� ����� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 16)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1319)`, false);	// ��Ż ���̷���
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 50)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��Ż ���̷��� �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1323)`, false);	// ��2 ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1323)`, false);	// ��2 ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1323)`, false);	// ��2 ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1323)`, false);	// ��2 ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��Ż ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��2 �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��2 �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 160)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��2 ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��2 ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1304)`, false);	// �� + ���� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ��+���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 200)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ��+���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1327)`, false);	// ��� ��+��� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1327)`, false);	// ��� ��+��� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1327)`, false);	// ��� ��+��� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1327)`, false);	// ��� ��+��� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ��� ��+��� ���� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1331)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1331)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1331)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1331)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1331)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 270)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ��� ��+��� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ��� ��+��� ���� ��� ��ȯ ����
			}
		}
		else if (skillLevel == 17)
		{
			if (time == 0)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1335)`, false);	// ���ϱ� ������+���ϱ� ������
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, true);		// �ϴ� ����ȭ
			}
			else if (time == 20)
			{
				Promotion_ChangeMonsterGhostMode(promotionId, `testRoom_monster_spawn_01`, false);	// 20�� ������ ����ȭ Ǯ��
			}
			else if (time == 90)
			{
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���ϱ� ������+���ϱ� ������ �� �̻� ������ �� �ǰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1336)`, false);	// ���� ������ ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1336)`, false);	// ���� ������ ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1336)`, false);	// ���� ������ ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1336)`, false);	// ���� ������ ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 120)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���ϱ� ������+���ϱ� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ������ �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ������ �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1300)`, false);	// ���� ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1300)`, false);	// ���� ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1300)`, false);	// ���� ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1300)`, false);	// ���� ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 150)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ������ ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ������ ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// ���� ���� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// ���� ���� �� �̻� ������ �� �ϰ�

				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1305)`, false);	// ���� ����+������� ����
			}
			else if (time == 190)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// ���� ���� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// ���� ���� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ����+������� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1301)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 195)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ����+������� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1340)`, false);	// ���� ���� ���̷��� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1340)`, false);	// ���� ���� ���̷��� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1340)`, false);	// ���� ���� ���̷��� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1340)`, false);	// ���� ���� ���̷��� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1340)`, false);	// ���� ���� ���̷��� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 220)
			{
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
//				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_01`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_02`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_03`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_04`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_05`, true);	// ���� ���� ���̷��� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(4);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_06`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_07`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_08`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_09`, `group(1302)`, false);	// �ν�Ʈ ���ϱ� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 240)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_01`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_02`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_03`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_04`);	// ���� ���� ���̷��� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_05`);	// ���� ���� ���̷��� ��� ��ȯ ����

				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_06`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_07`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_08`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�
				Promotion_ChangeMonsterInstantMode(promotionId, `testRoom_monster_spawn_09`, true);	// �ν�Ʈ ���ϱ� �� �̻� ������ �� �ϰ�

				SpawnBoxSelect = Random(5);
				switch (SpawnBoxSelect)
				{
					case (0)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1344)`, false);	// ��ũ ���� ����
					}
					case (1)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_02`, `group(1344)`, false);	// ��ũ ���� ����
					}
					case (2)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_03`, `group(1344)`, false);	// ��ũ ���� ����
					}
					case (3)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_04`, `group(1344)`, false);	// ��ũ ���� ����
					}
					case (4)
					{
						Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_05`, `group(1344)`, false);	// ��ũ ���� ����
					}
					default	// �׷� ���� �������� �̵� ���� �ƴ� �� �� ����Ʈ
					{
					}
				}
			}
			else if (time == 250)
			{
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_06`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_07`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_08`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
				Promotion_FreeMonster(promotionId, `testRoom_monster_spawn_09`);	// �ν�Ʈ ���ϱ� ��� ��ȯ ����
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnTesterDied(int promotionId, int skillId, int skillLevel, character tester)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	int DecreasePoint = tester.GetPromotionTestPoint() * ((skillLevel-14)*2+8) / 100;	// 1��ũ�� �� 10% ����, 8���� �� 26% ����
	tester.RemovePromotionTestPoint(DecreasePoint);
	return;
}

//////////////////////////////////////////////////////////////////////////////////
server void OnAllTesterDied(int promotionId, int skillId, int skillLevel)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1345)`, true);	// ���̾�Ʈ �� ����. ���� �� ��
}

//////////////////////////////////////////////////////////////////////////////////
server void OnAllMonsterDied(int promotionId, int skillId, int skillLevel)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1346)`, true);	// ���׺��� ����. ���� �� ��
}

//////////////////////////////////////////////////////////////////////////////////
server void OnTestEnd(int promotionid, int skillid, int skilllevel, character me, bool promote)
// : �׽�Ʈ�� ����Ǿ���.
//////////////////////////////////////////////////////////////////////////////////
{
	if (GetDate()>=1106 && GetDate()<=1128)
	{
		me.AddKeyword(`Promotion_Event`);
	}
}

/*
��� �ּ� ó��

//////////////////////////////////////////////////////////////////////////////////
server void OnTotalPointMoreThan(int promotionId, int skillId, int skillLevel, int point)
// : 
//////////////////////////////////////////////////////////////////////////////////
{
	if (skillId == 20001)		// ���潺
	{
		if (skillLevel == 16)
		{
			if (point == 1000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ���� ���� ���̷��� ����
			}
			else if (point == 2000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ���� ���� ���̷��� ����
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
	if (skillId == 20001)		// ���潺
	{
		if (skillLevel == 16)
		{
			if (point == 1000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ���� ���� ���̷��� ����
			}
			else if (point == 2000)
			{
				Promotion_AllocMonster(promotionId, `testRoom_monster_spawn_01`, `group(1306)`, false);	// ���� ���� ���̷��� ����
			}
			else if (point == 3000)
			{
				Promotion_FreeAllMonsters(promotionId);
			}
		}
	}
}

*/