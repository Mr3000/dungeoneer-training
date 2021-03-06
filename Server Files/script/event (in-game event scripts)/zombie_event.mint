//////////////////////////////////////////////////////////////////////////////////
//                                                 Mabinogi Project - Zombie Event
//                                                          좀비 이벤트용 스크립트
//
//                                           nicolas fecit, begins at 2009. 07. 02
//                                                             nicolas@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Zombie_Gate_0_Front(
	character _me,
	object _object,
	string& _sMsg)
// : 첫번째 게이트에 좀비가 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`zombie_2009`))
	{
		_me.EnterZombieEventBox(`Iria_SW_main_field/_Iria_SW_main_field_0063/waypoint_zombie_event_01`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Zombie_Gate_1_Front(
	character _me,
	object _object,
	string& _sMsg)
// : 두번째 게이트에 좀비가 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`zombie_2009`))
	{
		_me.EnterZombieEventBox(`Iria_SW_main_field/_Iria_SW_main_field_0063/waypoint_zombie_event_02`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Zombie_Gate_2_Front(
	character _me,
	object _object,
	string& _sMsg)
// : 세번째 게이트에 좀비가 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`zombie_2009`))
	{
		_me.EnterZombieEventBox(`Iria_SW_main_field/_Iria_SW_main_field_0063/waypoint_zombie_event_03`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Zombie_Gate_Center(
	character _me,
	object _object,
	string& _sMsg)
// : 중앙에 좀비가 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`zombie_2009`))
	{
		_me.EnterZombieEventBox(`Iria_SW_main_field/_Iria_SW_main_field_0063/flag_zombie_event_iria_01`);
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Zombie_GameField(
	character _me,
	object _object,
	string& _sMsg)
// : 좀비 이벤트 필드에 들어왔을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`zombie_2009`))
	{
		_me.EnterZombieEventBox(`Iria_SW_main_field/_Iria_SW_main_field_0064/zombie_event_area`);
	}
	return true;
}