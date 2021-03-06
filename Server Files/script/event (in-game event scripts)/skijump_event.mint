//////////////////////////////////////////////////////////////////////////////////
//                                                Mabinogi Project - SkiJump Event
//                                                      스키점프 이벤트용 스크립트
//
//                                           nicolas fecit, begins at 2009. 11. 30
//                                                             nicolas@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnGetGoodResult(
	character _me,
	int _point)
// : 스키 점프에서 좋은 결과로 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if (_point >= 1800)
	{
		_me.AddKeyword(`skijump_good`);
		if (GetLocale().LowerCase() == `korea`)
		{
			// 한국이면 추가 키워드
			_me.AddKeyword(`skijump2010_korea`);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
server void OnGetGreatResult(
	character _me,
	int _point)
// : 스키 점프에서 아주 좋은 결과로 도착했을 때
//////////////////////////////////////////////////////////////////////////////////
{
	if ((_point >= 1900) && !_me.HaveKeyword(`skijump_best`))
	{
		if (GetLocale().LowerCase() == `korea`)
		{
			// 한국이면 오리엔탈 뱅글 공급 * 이미 크리스마스가 지났기 때문
			_me.DoStript(`additemex(id:16066 rewardview:true)`); 
		}
		else
		{ 
			_me.DoStript(`additemex(id:18285 rewardview:true)`); 
		}	
		_me.AddKeyword(`skijump_best`);
	}
}

//////////////////////////////////////////////////////////////////////////////////
server bool Apply_SkiJump(
	character _me,
	object _object,
	string& _sMsg)
// : 문에 가서 스키 점프 타기 신청
//////////////////////////////////////////////////////////////////////////////////
{
	if (!_me.SkiJumpClickDoor(_sMsg))
	{
		return false;
	}
	return true;
}

//////////////////////////////////////////////////////////////////////////////////
server void SkiJump_ForceJump(
	character _me,
	object _object,
	string& _sMsg)
// : 점프 키를 안 누르고 지나갔을 때 처리
//////////////////////////////////////////////////////////////////////////////////
{
	_me.SkiJumpForceJump();
}
