
//////////////////////////////////////////////////////////////////////////////////
server bool Enter_Destination_Box1(
	character _me,
	object _object,
	string& _sMsg)
// : 눈덩이 도착 (빙수만들기 이벤트에서 사용합니다.)
//////////////////////////////////////////////////////////////////////////////////
{
	_me.EnterEventBoxReport(`Iria_NW_main_field/_Iria_NW_main_field_0032/MakeSnowIceFin01`);
//	_me.EnterEventBoxReport(`Iria_NW_main_field/_Iria_NW_main_field_0025/MakeSnowIceFin02`);
//	_me.EnterEventBoxReport(`Iria_NW_main_field/_Iria_NW_main_field_0038/MakeSnowIceFin03`);
//	_me.EnterEventBoxReport(`Iria_NW_main_field/_Iria_NW_main_field_0052/MakeSnowIceFin04`);
	return true;
}