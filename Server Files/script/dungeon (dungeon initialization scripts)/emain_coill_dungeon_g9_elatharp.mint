////////////////////////////////////////////////////////////////////////////////
//                                               Mabinogi Project Dungeon Script
//                                                                 ���� ��ũ��Ʈ
//
//				          versable fecit, begins at 2008. 07. 31
//						          versable@nexonsd.co.kr
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCreated(
	dungeon _dungeon,
	object_list _char_list)
// : ������ �����Ǿ��� �� ĳ���͵��� ���� ó�� ���� ���ش�.
////////////////////////////////////////////////////////////////////////////////
{
	if (_char_list.GetSize() == 1)
	{
		// ������ Role�� �Է��Ѵ�. (object_list�� ù��° ���� ��Ƽ���̴�.)
		_dungeon.SetPlayerRole((character)_char_list.GetValue(0), `#elatha_rp`, true);  // rp-leader�� ����ϴ� ��
	}

}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterEntered(
	dungeon _dungeon,
	character _player)
// : �� ������ ĳ���Ͱ� ���� �� �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	_player.DisableSkill(40001); // �ȶ�� ��ų �����ϵ��� ����
	_player.DisableSkill(41001); // ��ũ����Ʈ ��ų �����ϵ��� ����
	_player.DisableSkill(43001); // ���� �߼�ȭ ��ų �����ϵ��� ����
	_player.DisableSkill(44001); // ���̾�Ʈ �߼�ȭ ��ų �����ϵ��� ����
}

////////////////////////////////////////////////////////////////////////////////
server void OnRPLeaderEntered(
	dungeon _dungeon,
	character _leader)
// : �� ������ RP leader�� ���� �� �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{

		object_list cMemberList = _dungeon.GetRPMemberList();

		character	leader = (character)cMemberList.GetValue(0);
		cMemberList.RemoveValue(0);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnAllRPMemberEntered(
	dungeon _dungeon)
// : �� ������ ����� ��� RP ĳ���͵��� ���� �Ϸ����� �� �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{
}

////////////////////////////////////////////////////////////////////////////////
server void OnCharacterWarped(
	dungeon _dungeon,
	character _player,
	int _iOldFloor,
	int _iNewFloor)
// : ĳ���Ͱ� ���� �ű� �� (0���� �κ� ���Ѵ�.)
////////////////////////////////////////////////////////////////////////////////
{
	if (_iOldFloor != 0)		//�κ񿡼� �̵���, ��Ƽ���� ���� �ȵ����� �� �����Ƿ� üũ�� ����.
	{
		CheckValidate(_dungeon);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnSectionComplete(
	dungeon _dungeon,
	int floor,
	int section,
	int region,
	int x,
	int y)
// : ĳ���Ͱ� ���� ���� ���� ��������
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
}

////////////////////////////////////////////////////////////////////////////////
server void OnBossActivated(
	dungeon _dungeon)
// : �� ������ ������ ���� ������ ����.
////////////////////////////////////////////////////////////////////////////////
{
	if (CheckValidate(_dungeon))
	{
		object_list cMemberList = _dungeon.GetCreatorList();

		character	leader = (character)cMemberList.GetValue(0);

		leader.PlayCutScene(`C3G9S1_S#8_2_Elatha_fight`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnDungeonCleared(
	dungeon _dungeon)
// : �� ������ Ŭ���� �Ǿ��� �� �Ҹ��� �Լ�(������ �޹��� ������ ���� �Ҹ���)
////////////////////////////////////////////////////////////////////////////////
{
	CheckValidate(_dungeon);
}

////////////////////////////////////////////////////////////////////////////////
server bool CheckValidate(
	dungeon _dungeon)
// : �� ������ �ʿ��� �ο��� �����ǰ� �ִ��� üũ�Ͽ� �����Ѵ�.
////////////////////////////////////////////////////////////////////////////////
{
	object_list cMemberList = _dungeon.GetRPMemberList();

	// �� ������ �ݵ�� 1���� �;� �Ѵ�.
	if (cMemberList.GetSize() == 1)
	{
		return true;
	}
	object_list	cCharList = _dungeon.GetPlayerList();
	character	cChar;
	int		i;

	//�ο��� ���� ������ ���� �ѾƳ���.
	for (i = 0; i < cCharList.GetSize();  i++)
	{

		cChar = (character)cCharList.GetValue(i);
		cChar.LeaveDungeon();
	}

	return false;
}
////////////////////////////////////////////////////////////////////////////////
server bool GetRespawnList(
	dungeon _dungeon,
	character _player,
	string& _list)
// : �� �������� ������ ������ ����Ʈ�� �����Ѵ�.
// : ���� `town;here;stay;nao;dungeon_lobby;dungeon_statue;arena_lobby;arena_side` ����
////////////////////////////////////////////////////////////////////////////////
{
//	_list += `;town`;
	_list += `;dungeon_lobby`;
	_list += `;dungeon_statue`;
//	_list += `;nao`;
	_list += `;stay`;

	// �������̵� �ߴٴ� �ǹ̷� return true;
	return true;
}
////////////////////////////////////////////////////////////////////////////////
server void OnCharacterLeaved(
	dungeon _dungeon,
	character player)
////////////////////////////////////////////////////////////////////////////////
{
	player.EnableSkill(40001); // �ȶ�� ��ų ����ϵ��� Ǯ����
	player.EnableSkill(41001); // ��ũ����Ʈ ��ų ����ϵ��� Ǯ����
	player.EnableSkill(43001); // ���� �߼�ȭ ��ų ����ϵ��� Ǯ����
	player.EnableSkill(44001); // ���̾�Ʈ �߼�ȭ ��ų ����ϵ��� Ǯ����
}