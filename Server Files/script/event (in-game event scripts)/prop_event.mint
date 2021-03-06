//////////////////////////////////////////////////////////////////////////////////
//                                            Mabinogi Project : Prop Event Script
//                                                       프랍과 관련된 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 06. 05
//                                                             nicolas@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi


////////////////////////////////////////////////////////////////////////////////
server void OnMazePropCreated(
	prop mazeprop)
// : 프랍이 서버 부팅시 만들어 질 때 불리는 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		// 프랍을 매니저에 등록한다.
		if (mazeprop.RegisterToUndergroundMaze(
			3,
			`data/script/event/prop_event.mint::OnPropTickScript`))
		{
			// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 불려진 함수.`);
		}
		else
		{
			// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 함수 부르기 실패.`);
		}
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnTouchAvonFragment(character me, object _object, string& msg)
// : G13 메인스트림에서 아본의 조각 얻는 부분
////////////////////////////////////////////////////////////////////////////////
{
	if (me.GetCompletedQuestObjectiveCount(294207) == 1)
	{
		me.PlayCutScene(`iria_finding_it`);
		me.AddKeyword(`g13_08_02`);
		me.RemoveKeyword(`g13_08_01`);
		me.DoStript(`additemex(id:75479)`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnPropTickScript(
	prop mazeprop)
// : 지하미로 매니저에 등록된 주기마다 불리는 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `open`)
		{
			mazeprop.SetExtraData(`breaker_name`, ``);
			mazeprop.ChangeState(`closed`);
			// Announce(mazeprop.GetEntityName() + ` 이 시간이 되어 문을 닫았습니다.`);
		}
		else if (propstate == `closed`)
		{
			// Announce(mazeprop.GetEntityName() + ` 프랍은 문이 닫혀 있는 상태입니다.`);
		}

		Announce(mazeprop.GetEntityName() + ` 프랍에서 불려진 틱 메시지.`);
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool OnTouchPropScript(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		prop mazeprop = GetPropFromObject(_object);
		if (!mazeprop.IsNull())
		{
			string propstate = mazeprop.GetState();
			if (propstate == `closed`)
			{
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
				me.ShowMessageView(`이 프랍의 문을 엽니다.`);
				return false;
			}
			else if (propstate == `open`)
			{
				me.ShowMessageView(`이 프랍의 문이 이미 열려 있습니다.`);
				return false;
			}
		}
		me.ShowMessageView(`프랍디비에서 옮아온 테스트용 메시지`);
		return false;
	}
}

////////////////////////////////////////////////////////////////////////////////
server bool OnTouchPropScriptTest(
	character me,
	object _object,
	string& msg)
// : 다누에서 입력된 ServerScript 이벤트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if (IsDevelopment())
	{
		prop mazeprop = GetPropFromObject(_object);
		if (!mazeprop.IsNull())
		{
			string propstate = mazeprop.GetState();
			if (propstate == `closed`)
			{
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
				me.ShowMessageView(`이 프랍의 문을 엽니다. 이것은 다누에서 옮아온 메시지입니다.`);
				return false;
			}
			else if (propstate == `open`)
			{
				me.ShowMessageView(`이 프랍의 문이 이미 열려 있습니다. 이것은 다누에서 옮아온 메시지입니다.`);
				return false;
			}
		}
		me.ShowMessageView(`프랍디비가 아닌 서버스크립트에서 옭아온 테스트용 메시지`);
		return false;
	}
}



////////////////////////////////////////////////////////////////////////////////
server void HitDoor_OnCreated(
	prop mazeprop)
// : 부서지는 문이 서버 부팅시 만들어 질 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 프랍을 매니저에 등록한다.
	if (mazeprop.RegisterToUndergroundMaze(
		9,
		`data/script/event/prop_event.mint::HitDoor_OnTick`))
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 불려진 함수.`);
	}
	else
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 함수 부르기 실패.`);
	}

	//콘누스 지하 미로(01~05)
	if (mazeprop.GetEntityName() == `Hitdoor_01`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_02`)
	{
		mazeprop.SetConditionMax(16);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_03`)
	{
		mazeprop.SetConditionMax(17);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_04`)
	{
		mazeprop.SetConditionMax(6);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_05`)
	{
		mazeprop.SetConditionMax(5);
	}

	//누베스 산맥 지하 터널(11~14)
	else if (mazeprop.GetEntityName() == `Hitdoor_11`)
	{
		mazeprop.SetConditionMax(10);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_12`)
	{
		mazeprop.SetConditionMax(8);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_13`)
	{
		mazeprop.SetConditionMax(6);
	}
	else if (mazeprop.GetEntityName() == `Hitdoor_14`)
	{
		mazeprop.SetConditionMax(8);
	}

}

////////////////////////////////////////////////////////////////////////////////
server void HitDoor_OnTick(
	prop mazeprop)
// : 부서지는 문이 일정 시간마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	string propstate = mazeprop.GetState();
	if (propstate == `open`)
	{
		mazeprop.SetExtraData(`breaker_name`, ``);
		mazeprop.ChangeState(`closed`);
		// Announce("{0}이 시간이 되어 문을 닫았습니다."<<mazeprop.GetEntityName());
	}
	else if (propstate == `closed`)
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍은 문이 닫혀 있는 상태입니다.`);
	}

	mazeprop.SetConditionIndex(Random(mazeprop.GetConditionMax()));
}

////////////////////////////////////////////////////////////////////////////////
server bool OnHitDoorScript(
	character me,
	object _object,
	string& msg)
// : 실제로 유저가 부쉈을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	prop mazeprop = GetPropFromObject(_object);
	if (!mazeprop.IsNull())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `closed`)
		{
			if (me.GetTitle() == 60000 || me.GetTitle() ==  60001)
			{
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
				me.ShowCaption(["event.prop_event.1"]);
				return true;
			}
			else
			{
				//me.ShowCaption("지엠이나 데브캣 권한이 아닙니다.");
			}

			//// DebugOut(``+ToString(int));
			// DebugOut(`프랍이름:` + mazeprop.GetEntityName());
			// DebugOut(`조건:` + ToString(mazeprop.GetConditionIndex()) + `/` + ToString(mazeprop.GetConditionMax()));

			// 초급 유저가 깰 수 있는 문
			if (mazeprop.GetEntityName() == `Hitdoor_01`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//아르바이트 회수 3회 이상
					if (me.GetArbeitTotalCount() >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.2"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.3"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//누적 레벨 50 이상
					if (me.GetCumLevel() >= 50)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.4"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.5"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//레벨 20 이상
					if (me.GetLevel() >= 20)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.6"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.7"]);
					}
				}
			}

			// 기초가 튼튼한 생활 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_02`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//메이킹 마스터리 B랭크 이상
					if (me.GetSkillLevel(10024) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.8"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.9"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//휴식 C랭크 이상
					if (me.GetSkillLevel(10004) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.10"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.11"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//응급치료  D랭크 이상
					if (me.GetSkillLevel(10009) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.12"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.13"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//캠프파이어 D랭크 이상
					if (me.GetSkillLevel(10008) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.14"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.15"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//악기 연주 9랭크 이상
					if (me.GetSkillLevel(10003) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.16"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.17"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//음악적 지식 B랭크 이상
					if (me.GetSkillLevel(10006) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.18"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.19"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 6)
				{
					//작곡 C랭크 이상
					if (me.GetSkillLevel(10005) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.20"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.21"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 7)
				{
					//낚시 8랭크 이상
					if (me.GetSkillLevel(10023) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.22"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.23"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 8)
				{
					//요리 C랭크 이상
					if (me.GetSkillLevel(10020) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.24"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.25"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 9)
				{
					//약초학 9랭크 이상
					if (me.GetSkillLevel(10021) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.26"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.27"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 10)
				{
					//포션조제 A랭크 이상
					if (me.GetSkillLevel(10022) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.28"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.29"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 11)
				{
					//제련 A랭크 이상
					if (me.GetSkillLevel(10015) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.30"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.31"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 12)
				{
					//블랙스미스 B랭크 이상
					if (me.GetSkillLevel(10016) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.32"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.33"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 13)
				{
					//방직 B랭크 이상
					if (me.GetSkillLevel(10011) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.34"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.35"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 14)
				{
					//천옷만들기 C랭크 이상
					if (me.GetSkillLevel(10001) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.36"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.37"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 15)
				{
					//핸디크래프트 8랭크 이상
					if (me.GetSkillLevel(10013) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.38"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.39"]);
					}
				}
			}

			// 기초가 튼튼한 전투 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_03`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//컴뱃 마스터리 A랭크 이상
					if (me.GetSkillLevel(23002) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.40"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.41"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//크리티컬 히트 9랭크 이상
					if (me.GetSkillLevel(23003) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.42"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.43"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//샤프마인드 B랭크 이상
					if (me.GetSkillLevel(23011) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.44"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.45"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//디펜스 B랭크 이상
					if (me.GetSkillLevel(20001) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.46"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.47"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//스매시 A랭크 이상
					if (me.GetSkillLevel(20002) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.48"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.49"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//카운터 C랭크 이상
					if (me.GetSkillLevel(20003) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.50"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.51"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 6)
				{
					//윈드밀 D랭크 이상
					if (me.GetSkillLevel(22001) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.52"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.53"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 7)
				{
					//레인지 컴뱃 마스터리 A랭크 이상
					if (me.GetSkillLevel(21001) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.54"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.55"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 8)
				{
					//매그넘샷 A랭크 이상
					if (me.GetSkillLevel(21002) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.56"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.57"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 9)
				{
					//매직 마스터리 A랭크 이상
					if (me.GetSkillLevel(30007) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.58"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.59"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 10)
				{
					//라이트닝 볼트 B랭크 이상
					if (me.GetSkillLevel(30101) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.60"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.61"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 11)
				{
					//파이어 볼트 B랭크 이상
					if (me.GetSkillLevel(30201) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.62"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.63"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 12)
				{
					//아이스 볼트 B랭크 이상
					if (me.GetSkillLevel(30301) >= 5)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.64"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.65"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 13)
				{
					//힐링 9랭크 이상
					if (me.GetSkillLevel(30006) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.66"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.67"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 14)
				{
					//파티힐링 C랭크 이상
					if (me.GetSkillLevel(30008) >= 4)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.68"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.69"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 15)
				{
					//인챈트 D랭크 이상
					if (me.GetSkillLevel(30005) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.70"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.71"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 16)
				{
					//메디테이션 D랭크 이상
					if (me.GetSkillLevel(30003) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.72"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.73"]);
					}
				}
			}

			// 고수가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_04`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//아르바이트 1000회 이상
					if (me.GetArbeitTotalCount() >= 1000)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.74"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.75"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//유적 발견 회수 10000회 이상
					if (me.GetDiscoverCount() >= 10000)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.76"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.77"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//누적 탐험 레벨 500 이상
					if (me.GetExploCumLevel() >= 500)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.78"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.79"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//탐험 레벨 20 이상
					if (me.GetExploLevel() >= 20)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.80"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.169"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//누적 레벨 1000 이상
					if (me.GetCumLevel() >= 1000)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.82"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.83"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//레벨 60 이상
					if (me.GetLevel() >= 60)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.84"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.85"]);
					}
				}
			}

			// 고급 스킬 고랭크 유저
			else if (mazeprop.GetEntityName() == `Hitdoor_05`)
			{

				if (mazeprop.GetConditionIndex() == 0)
				{
					//썬더 5랭크 이상
					if (me.GetSkillLevel(30102) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.86"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.87"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//파이어볼 3랭크 이상
					if (me.GetSkillLevel(30202) >= 13)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.88"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.89"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//아이스 스피어 6랭크 이상
					if (me.GetSkillLevel(30302) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.90"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.91"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					// 애로우 리볼버 4랭크 이상
					if (me.GetSkillLevel(21004) >= 12)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.92"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.93"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//파이널 히트 4랭크 이상
					if (me.GetSkillLevel(22004) >= 12)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.94"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.95"]);
					}
				}
			}

			// 생산 고랭크 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_11`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//메이킹 마스터리 6랭크 이상
					if (me.GetSkillLevel(10024) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.175"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.176"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//낚시 3랭크 이상
					if (me.GetSkillLevel(10023) >= 13)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.177"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.178"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//요리 9랭크 이상
					if (me.GetSkillLevel(10020) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.179"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.180"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//약초학 7랭크 이상
					if (me.GetSkillLevel(10021) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.181"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.182"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//포션조제 8랭크 이상
					if (me.GetSkillLevel(10022) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.183"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.184"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//제련 5랭크 이상
					if (me.GetSkillLevel(10015) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.185"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.186"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 6)
				{
					//블랙스미스 9랭크 이상
					if (me.GetSkillLevel(10016) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.187"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.188"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 7)
				{
					//방직 7랭크 이상
					if (me.GetSkillLevel(10011) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.189"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.190"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 8)
				{
					//천옷만들기 6랭크 이상
					if (me.GetSkillLevel(10001) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.191"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.192"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 9)
				{
					//핸디크래프트 8랭크 이상
					if (me.GetSkillLevel(10013) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.193"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.194"]);
					}
				}
			}

			// 전투 고랭크 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_12`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//컴뱃 마스터리 6랭크 이상
					if (me.GetSkillLevel(23002) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.195"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.196"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//크리티컬 히트 7랭크 이상
					if (me.GetSkillLevel(23003) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.197"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.198"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//디펜스 8랭크 이상
					if (me.GetSkillLevel(20001) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.199"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.200"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//스매시 5랭크 이상
					if (me.GetSkillLevel(20002) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.201"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.202"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//카운터 A랭크 이상
					if (me.GetSkillLevel(20003) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.203"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.204"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//윈드밀 5랭크 이상
					if (me.GetSkillLevel(22001) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.205"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.206"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 6)
				{
					//레인지 컴뱃 마스터리 6랭크 이상
					if (me.GetSkillLevel(21001) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.207"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.208"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 7)
				{
					//매그넘샷 5랭크 이상
					if (me.GetSkillLevel(21002) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.209"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.210"]);
					}
				}
			}

			// 음악 고랭크 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_13`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//휴식 9랭크 이상
					if (me.GetSkillLevel(10004) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.211"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.212"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//응급치료  A랭크 이상
					if (me.GetSkillLevel(10009) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.213"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.214"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//캠프파이어 A랭크 이상
					if (me.GetSkillLevel(10008) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.215"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.216"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//악기 연주 5랭크 이상
					if (me.GetSkillLevel(10003) >= 11)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.217"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.218"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//음악적 지식 7랭크 이상
					if (me.GetSkillLevel(10006) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.219"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.220"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//작곡 8랭크 이상
					if (me.GetSkillLevel(10005) >= 8)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.221"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.222"]);
					}
				}
			}

			// 마법 고랭크 유저가 깰 수 있는 문
			else if (mazeprop.GetEntityName() == `Hitdoor_14`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					//매직 마스터리 6랭크 이상
					if (me.GetSkillLevel(30007) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.223"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.224"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					//라이트닝 볼트 7랭크 이상
					if (me.GetSkillLevel(30101) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.225"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.226"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					//파이어 볼트 7랭크 이상
					if (me.GetSkillLevel(30201) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.227"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.228"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 3)
				{
					//아이스 볼트 7랭크 이상
					if (me.GetSkillLevel(30301) >= 9)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.229"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.230"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 4)
				{
					//힐링 6랭크 이상
					if (me.GetSkillLevel(30006) >= 10)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.231"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.232"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 5)
				{
					//파티힐링 A랭크 이상
					if (me.GetSkillLevel(30008) >= 6)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.233"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.234"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 6)
				{
					//인챈트 9랭크 이상
					if (me.GetSkillLevel(30005) >= 7)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.235"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.236"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 7)
				{
					//메디테이션 D랭크 이상
					if (me.GetSkillLevel(30003) >= 3)
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.237"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.238"]);
					}
				}
			}

		}
		else if (propstate == `open`)
		{
			me.ShowCaption(["event.prop_event.96"]);
			return false;
		}
	}
	return false;
}



////////////////////////////////////////////////////////////////////////////////
server void TouchDoor_OnCreated(
	prop mazeprop)
// : 미는 문이 서버 부팅시 만들어 질 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 프랍을 매니저에 등록한다.
	if (mazeprop.RegisterToUndergroundMaze(
		6,
		`data/script/event/prop_event.mint::TouchDoor_OnTick`))
	{
		//Announce(mazeprop.GetEntityName() + ` 프랍 생성시 불려진 함수.`);
	}
	else
	{
		//Announce(mazeprop.GetEntityName() + ` 프랍 생성시 함수 부르기 실패.`);
	}

	//콘누스 지하 미로(01~05)
	if (mazeprop.GetEntityName() == `Touchdoor_01`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_02`)
	{
		mazeprop.SetConditionMax(8);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_03`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_04`)
	{
		mazeprop.SetConditionMax(6);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_05`)
	{
		mazeprop.SetConditionMax(6);
	}

	//누베스 산맥 지하 터널(11~14)
	else if (mazeprop.GetEntityName() == `Touchdoor_11`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_12`)
	{
		mazeprop.SetConditionMax(4);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_13`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Touchdoor_14`)
	{
		mazeprop.SetConditionMax(4);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void TouchDoor_OnTick(
	prop mazeprop)
// : 미는 문이 일정 시간마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	string propstate = mazeprop.GetState();
	if (propstate == `open`)
	{
		mazeprop.SetExtraData(`breaker_name`, ``);
		mazeprop.ChangeState(`closed`);
		// Announce("{0}이 시간이 되어 문을 닫았습니다."<<mazeprop.GetEntityName());
	}
	else if (propstate == `closed`)
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍은 문이 닫혀 있는 상태입니다.`);
	}

	mazeprop.SetConditionIndex(Random(mazeprop.GetConditionMax()));
}

////////////////////////////////////////////////////////////////////////////////
server bool OnTouchDoorScript(
	character me,
	object _object,
	string& msg)
// : 실제로 유저가 밀었을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	prop mazeprop = GetPropFromObject(_object);
	if (!mazeprop.IsNull())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `closed`)
		{
			if (me.GetTitle() == 60000 || me.GetTitle() ==  60001)
			{
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
				me.ShowCaption(["event.prop_event.97"]);
				return true;
			}
			else
			{
				//me.ShowCaption("지엠이나 데브캣 권한이 아닙니다.");
			}
				//// DebugOut(``+ToString(int));
				// DebugOut(`프랍이름:` + mazeprop.GetEntityName());
				// DebugOut(`조건:` + ToString(mazeprop.GetConditionIndex()) + `/` + ToString(mazeprop.GetConditionMax()));

				// 초급 유저에게 열리는 문
				if (mazeprop.GetEntityName() == `Touchdoor_01`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//발견한 유적수 10개 이상
						if (me.GetDiscoverCount() >= 10)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.98"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.99"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//누적 탐험 레벨 20 이상
						if (me.GetExploCumLevel() >= 20)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.100"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.101"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//탐험 레벨 5 이상
						if (me.GetExploLevel() >= 5)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.102"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.103"]);
						}
					}
				}

				// 타이틀을 수집하는 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_02`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//낚시왕
						if (me.GetTitle() == 19)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.104"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.105"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//럭키가이
						if (me.GetTitle() == 23)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.106"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.107"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//초보엘레멘탈마스터
						if (me.GetTitle() == 28)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.108"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.109"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 3)
					{
						//죽음을 체험한
						if (me.GetTitle() == 37)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.110"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.111"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 4)
					{
						//몸빵
						if (me.GetTitle() == 57)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.112"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.113"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 5)
					{
						//맨 손으로 곰을 잡은
						if (me.GetTitle() == 79)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.114"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.115"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 6)
					{
						//서큐버스를 잡은
						if (me.GetTitle() == 84)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.116"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.117"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 7)
					{
						//불화살
						if (me.GetTitle() == 88)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.118"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.119"]);
						}
					}
				}

				// 상태이상에 걸린 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_03`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//독
						if (me.IsInCondition(0))
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.120"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.121"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//데들리
						if (me.IsInCondition(1))
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.122"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.123"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//포션중독
						if (me.IsInCondition(2))
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.124"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.125"]);
						}
					}
				}

				// 정령 무기를 꾸준히 성장시킨 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_04`)
				{
					item cItem=me.GetEgoWeapon();
					if(cItem.IsValid()) //문을 클릭한 유저가 에고웨폰이 있으면
					{
						if (mazeprop.GetConditionIndex() == 0)
						{
							//정령무기 사회 레벨 25 이상
							if (cItem.GetEgoLevel(0) >= 25)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.126"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.127"]);
							}
						}
						else if (mazeprop.GetConditionIndex() == 1)
						{
							//정령무기 체력 레벨 30 이상
							if (cItem.GetEgoLevel(1) >= 30)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.128"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.129"]);
							}
						}
						else if (mazeprop.GetConditionIndex() == 2)
						{
							//정령무기 지력 레벨 25 이상
							if (cItem.GetEgoLevel(2) >= 25)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.130"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.131"]);
							}
						}
						else if (mazeprop.GetConditionIndex() == 3)
						{
							//정령무기 솜씨 레벨 30 이상
							if (cItem.GetEgoLevel(3) >= 30)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.132"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.133"]);
							}
						}
						else if (mazeprop.GetConditionIndex() == 4)
						{
							//정령무기 의지 레벨 25 이상
							if (cItem.GetEgoLevel(4) >= 25)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.134"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.135"]);
							}
						}
						else if (mazeprop.GetConditionIndex() == 5)
						{
							//정령무기 행운 레벨 30 이상
							if (cItem.GetEgoLevel(5) >= 30)
							{
								mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
								mazeprop.ChangeState(`open`, me);
								me.ShowCaption(["event.prop_event.136"]);
							}
							else
							{
								me.ShowCaption(["event.prop_event.137"]);
							}
						}
					}
					else
					{
						me.ShowCaption(["event.prop_event.138"]);
					}
				}

				// 봉사하는 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_05`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						// 붕대를 200개 이상 소지
						if (me.GetItemNoWithClassId(60005) >= 200)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.139"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.140"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						// 피닉스의 깃털을 100개 이상 소지
						if (me.GetItemNoWithClassId(63000) >= 100)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.141"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.142"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						// 응급치료 B랭크 이상
						if (me.GetSkillLevel(10009) >= 5)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.143"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.144"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 3)
					{
						// 힐링 6랭크 이상
						if (me.GetSkillLevel(30006) >= 10)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.145"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.146"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 4)
					{
						// 최고급 수제 붕대를 20개 이상 소지
						if (me.GetItemNoWithClassId(60049) >= 20)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.147"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.148"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 5)
					{
						// 어드밴스드 피닉스의 깃털을 10개 이상 소지
						if (me.GetItemNoWithClassId(63043) >= 10)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.149"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.150"]);
						}
					}
				}

				// 중급 탐험 유저에게 열리는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_11`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//발견한 유적수 1000개 이상
						if (me.GetDiscoverCount() >= 1000)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.239"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.240"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//누적 탐험 레벨 200 이상
						if (me.GetExploCumLevel() >= 200)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.241"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.242"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//탐험 레벨 20 이상
						if (me.GetExploLevel() >= 20)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.243"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.244"]);
						}
					}
				}

				// 타이틀을 수집하는 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_12`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//말과 타조의 친구
						if (me.GetTitle() == 10)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.245"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.246"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//선원 지망생
						if (me.GetTitle() == 36)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.247"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.248"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//노련한
						if (me.GetTitle() == 55)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.249"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.250"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 3)
					{
						//한 방에 곰을 잡은
						if (me.GetTitle() == 81)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.251"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.252"]);
						}
					}
				}


				// 중급 유저가 깰 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_13`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//아르바이트 100회 이상
						if (me.GetArbeitTotalCount() >= 100)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.253"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.254"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//누적 레벨 500 이상
						if (me.GetCumLevel() >= 500)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.255"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.256"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//레벨 50 이상
						if (me.GetLevel() >= 50)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.257"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.258"]);
						}
					}
				}


				// 타이틀을 수집하는 사람이 열 수 있는 문
				else if (mazeprop.GetEntityName() == `Touchdoor_14`)
				{
					if (mazeprop.GetConditionIndex() == 0)
					{
						//고고학자
						if (me.GetTitle() == 11)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.259"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.260"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 1)
					{
						//손이 미끄러운
						if (me.GetTitle() == 20)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.261"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.262"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 2)
					{
						//10살에 50레벨이 된
						if (me.GetTitle() == 76)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.263"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.264"]);
						}
					}
					else if (mazeprop.GetConditionIndex() == 3)
					{
						//오거를 잡은
						if (me.GetTitle() == 85)
						{
							mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
							mazeprop.ChangeState(`open`, me);
							me.ShowCaption(["event.prop_event.265"]);
						}
						else
						{
							me.ShowCaption(["event.prop_event.266"]);
						}
					}
				}

		}
		else if (propstate == `open`)
		{
			me.ShowCaption(["event.prop_event.151"]);
			return false;
		}
	}
	return false;
}


////////////////////////////////////////////////////////////////////////////////
server void YellDoor_OnCreated(
	prop mazeprop)
// : 말로 열리는 문이 서버 부팅시 만들어 질 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// 프랍을 매니저에 등록한다.
	if (mazeprop.RegisterToUndergroundMaze(
		3,
		`data/script/event/prop_event.mint::YellDoor_OnTick`))
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 불려진 함수.`);
	}
	else
	{
		// Announce(mazeprop.GetEntityName() + ` 프랍 생성시 함수 부르기 실패.`);
	}

	// 콘누스 지하 미로(01~02)
	if (mazeprop.GetEntityName() == `Yelldoor_01`)
	{
		mazeprop.SetConditionMax(2);
	}
	else if (mazeprop.GetEntityName() == `Yelldoor_02`)
	{
		mazeprop.SetConditionMax(3);
	}

	// 누베스 산맥 지하 터널(11~13)
	else if (mazeprop.GetEntityName() == `Yelldoor_11`)
	{
		mazeprop.SetConditionMax(3);
	}
	else if (mazeprop.GetEntityName() == `Yelldoor_12`)
	{
		mazeprop.SetConditionMax(3);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void YellDoor_OnTick(
	prop mazeprop)
// : 말로 열리는 문이 일정 시간마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	string propstate = mazeprop.GetState();
	if (propstate == `open`)
	{
		mazeprop.SetExtraData(`breaker_name`, ``);
		mazeprop.ChangeState(`closed`);
		//Announce("{0}이 시간이 되어 문을 닫았습니다."<<mazeprop.GetEntityName());
	}
	else if (propstate == `closed`)
	{
		//Announce(mazeprop.GetEntityName() + ` 문이 닫혀 있는 상태입니다.`);
	}

	mazeprop.SetConditionIndex(Random(mazeprop.GetConditionMax()));
}

////////////////////////////////////////////////////////////////////////////////
server void OnYellDoorScript(
	character me,
	object _object,
	string _strYell,
	string& msg)
// : 실제로 유저가 외쳤을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	prop mazeprop = GetPropFromObject(_object);
	if (!mazeprop.IsNull())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `closed`)
		{

			if (me.GetTitle() == 60000 || me.GetTitle() ==  60001)
			{
				mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
				mazeprop.ChangeState(`open`, me);
				me.ShowCaption(["event.prop_event.152"]);
			}
			else
			{
				//me.ShowCaption("지엠이나 데브캣 권한이 아닙니다.");
			}

			// DebugOut(`부르는프랍이름:` + mazeprop.GetEntityName());
			// DebugOut(`조건:` + ToString(mazeprop.GetConditionIndex()) + `/` + ToString(mazeprop.GetConditionMax()));

			if (mazeprop.GetEntityName() == `Yelldoor_01`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					if (_strYell == ["event.prop_event.170"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.153"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.154"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					if (_strYell == ["event.prop_event.171"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.155"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.156"]);
					}
				}
			}
			else if (mazeprop.GetEntityName() == `Yelldoor_02`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					if (_strYell == ["event.prop_event.172"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.157"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.158"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					if (_strYell == ["event.prop_event.173"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.159"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.160"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					if (_strYell == ["event.prop_event.174"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.161"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.162"]);
					}
				}
			}
			else if (mazeprop.GetEntityName() == `Yelldoor_11`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					if (_strYell == ["event.prop_event.267"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.268"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.269"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					if (_strYell == ["event.prop_event.270"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.271"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.272"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					if (_strYell == ["event.prop_event.273"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.274"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.275"]);
					}
				}
			}

			else if (mazeprop.GetEntityName() == `Yelldoor_12`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					if (_strYell == ["event.prop_event.276"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.277"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.278"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					if (_strYell == ["event.prop_event.279"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.280"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.281"]);
					}
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					if (_strYell == ["event.prop_event.282"])
					{
						mazeprop.SetExtraData(`breaker_name`, me.GetDisplayName());
						mazeprop.ChangeState(`open`, me);
						me.ShowCaption(["event.prop_event.283"]);
					}
					else
					{
						me.ShowCaption(["event.prop_event.284"]);
					}
				}
			}
		}
		else if (propstate == `open`)
		{
			me.ShowCaption(["event.prop_event.163"]);
		}
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnYellDoorTouchScript(
	character me,
	object _object,
	string& msg)
// : 실제로 유저가 외쳤을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	prop mazeprop = GetPropFromObject(_object);
	if (!mazeprop.IsNull())
	{
		string propstate = mazeprop.GetState();
		if (propstate == `closed`)
		{

			// DebugOut(`부르는프랍이름:` + mazeprop.GetEntityName());
			// DebugOut(`조건:` + ToString(mazeprop.GetConditionIndex()) + `/` + ToString(mazeprop.GetConditionMax()));

			if (mazeprop.GetEntityName() == `Yelldoor_01`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					me.ShowCaption(["event.prop_event.164"]);
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					me.ShowCaption(["event.prop_event.165"]);
				}
			}

			else if (mazeprop.GetEntityName() == `Yelldoor_02`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					me.ShowCaption(["event.prop_event.166"]);
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					me.ShowCaption(["event.prop_event.167"]);
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					me.ShowCaption(["event.prop_event.168"]);
				}
			}

			else if (mazeprop.GetEntityName() == `Yelldoor_11`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					me.ShowCaption(["event.prop_event.285"]);
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					me.ShowCaption(["event.prop_event.286"]);
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					me.ShowCaption(["event.prop_event.287"]);
				}
			}

			else if (mazeprop.GetEntityName() == `Yelldoor_12`)
			{
				if (mazeprop.GetConditionIndex() == 0)
				{
					me.ShowCaption(["event.prop_event.288"]);
				}
				else if (mazeprop.GetConditionIndex() == 1)
				{
					me.ShowCaption(["event.prop_event.289"]);
				}
				else if (mazeprop.GetConditionIndex() == 2)
				{
					me.ShowCaption(["event.prop_event.290"]);
				}
			}
		}
	}
}


////////////////////////////////////////////////////////////////////////////////
server void QueryStateChange_MapleTree(
	prop treeprop,
	character me,
	float fCount)
// : 단풍나무에 물을 줬을 때의 처리
////////////////////////////////////////////////////////////////////////////////
{
	// count가 실제로 물을 준 회수입니다. (fCount가 아니고)
	float count = (fCount / 100.0) - 1.0;

	float grow1_point = 60.0;
	float grow2_point = 80.0;
	float grow3_point = 120.0;
	float complete_point = 180.0;

	if (GetLocale().LowerCase() !=`korea`)
	{
		// 외국의 경우는 회수를 반으로 줄인다.
		grow1_point = 30.0;
		grow2_point = 40.0;
		grow3_point = 60.0;
		complete_point = 90.0;
	}

	if (treeprop.GetState() == `dead` && count >= grow1_point)
	{
		if (treeprop.GetExtraData(`growing_1`) != `true`)
		{
			treeprop.ShowEffect(`<effect type='maple_tree' />`);
			treeprop.ChangeState(`grow1`, me, 2500, true);	// 2.5초 후에 바뀌도록
			treeprop.SetExtraData(`growing_1`, `true`);
		}
	}
	else if (treeprop.GetState() == `grow1` && count >= grow2_point)
	{
		treeprop.ChangeState(`grow2`, me);
		treeprop.SetExtraData(`growing_1`, `false`);
	}
	else if (treeprop.GetState() == `grow2` && count >= grow3_point)
	{
		treeprop.ChangeState(`grow3`, me);

		int color_red = 176;
		int color_green = 191;
		int color_blue = 174;
		int color = color_red * 65536 + color_green * 256 + color_blue;

		treeprop.SetColor(1, color);
	}
	else if (treeprop.GetState() == `grow3` && count >= complete_point)
	{
		treeprop.ChangeState(`completed`, me);

		// 여기에서 아이템을 무더기로 떨어뜨려 주시면 됩니다.
	}
	else if (treeprop.GetState() == `grow3`)
	{
		int n_count = (int)count - grow3_point;
		int color_red = 176 - ((176 - 251) * n_count / (complete_point - grow3_point));
		int color_green = 191 - ((191 - 79) * n_count / (complete_point - grow3_point));
		int color_blue = 174 - ((174 - 4) * n_count / (complete_point - grow3_point));

		int color = color_red * 65536 + color_green * 256 + color_blue;

		if (n_count % 2 == 0)
		{
			treeprop.SetColor(1, color);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnHitMapleTree(
	character me,
	object _object,
	string& msg)
// : 단풍나무를 쳤을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`tree attack.`);
	prop treeprop = GetPropFromObject(_object);
	if (!treeprop.IsNull())
	{
		string propstate = treeprop.GetState();
		if (propstate == `completed`)
		{
			int regionid = treeprop.GetRegionID();
			if (regionid == 1)	// 티르코네일
			{
				int rand = Random(10000);
				if (rand < 30)
				{
					me.GenerateAndDropItem(`id:51061`, me);
				}
				else if (rand < 1000 + 30)
				{
					me.GenerateAndDropItem(`id:51056`, me);
				}
				else if (rand < 500 + 1000 + 30)
				{
					me.GenerateAndDropItem(`id:50064`, me);
				}
			}
			else if (regionid == 14)	// 던바튼
			{
				int rand = Random(10000);
				if (rand < 30)
				{
					me.GenerateAndDropItem(`id:51062`, me);
				}
				else if (rand < 1000 + 30)
				{
					me.GenerateAndDropItem(`id:51057`, me);
				}
				else if (rand < 500 + 1000 + 30)
				{
					me.GenerateAndDropItem(`id:50064`, me);
				}
			}
			else if (regionid == 52)	// 이멘마하
			{
				int rand = Random(10000);
				if (rand < 30)
				{
					me.GenerateAndDropItem(`id:51063`, me);
				}
				else if (rand < 1000 + 30)
				{
					me.GenerateAndDropItem(`id:51058`, me);
				}
				else if (rand < 500 + 1000 + 30)
				{
					me.GenerateAndDropItem(`id:50064`, me);
				}
			}
			else if (regionid == 16)	// 두갈드아일
			{
				int rand = Random(10000);
				if (rand < 30)
				{
					me.GenerateAndDropItem(`id:51064`, me);
				}
				else if (rand < 1000 + 30)
				{
					me.GenerateAndDropItem(`id:51059`, me);
				}
				else if (rand < 500 + 1000 + 30)
				{
					me.GenerateAndDropItem(`id:50064`, me);
				}
			}
			else if (regionid == 53)	// 센마이
			{
				int rand = Random(10000);
				if (rand < 30)
				{
					me.GenerateAndDropItem(`id:51065`, me);
				}
				else if (rand < 1000 + 30)
				{
					me.GenerateAndDropItem(`id:51060`, me);
				}
				else if (rand < 500 + 1000 + 30)
				{
					me.GenerateAndDropItem(`id:50064`, me);
				}
			}
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void QueryStateChange_CherryTree(
	prop treeprop,
	character me,
	float fCount)
// : 벚나무에 물을 줬을 때의 처리
////////////////////////////////////////////////////////////////////////////////
{

	// count가 실제로 물을 준 회수입니다. (fCount가 아니고)
	float count = (fCount / 100.0) - 1.0;

	float grow1_point = 22.0;
	float grow2_point = 44.0;
	float grow3_point = 66.0;
	float complete_point = 90.0;

	if (treeprop.GetState() == `dead` && count >= grow1_point)
	{
		if (treeprop.GetExtraData(`growing_1`) != `true`)
		{
			treeprop.ChangeState(`grow0`, me, 2500, true);	// 2.5초 후에 바뀌도록
			treeprop.SetExtraData(`growing_1`, `true`);
		}
	}
	else if (treeprop.GetState() == `grow0` && count >= grow2_point)
	{
		treeprop.ChangeState(`grow1`, me);
		treeprop.SetExtraData(`growing_1`, `false`);
	}
	else if (treeprop.GetState() == `grow1` && count >= grow3_point)
	{
		treeprop.ChangeState(`grow2`, me);
	}
	else if (treeprop.GetState() == `grow2` && count >= complete_point)
	{
		treeprop.ChangeState(`completed`, me);

		// 여기에서 아이템을 무더기로 떨어뜨려 주시면 됩니다.
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnHitCherryTree(
	character me,
	object _object,
	string& msg)
// :벚나무를 쳤을 때 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`tree attack.`);
	prop treeprop = GetPropFromObject(_object);
	if (!treeprop.IsNull())
	{
		string propstate = treeprop.GetState();
		if (propstate == `completed`)
		{
			int waterCount  = treeprop.GetCount(me);

			// 여기서 플레이어 별로 나무에 물 준 횟수를 받아와야 연산이 가능
			if(waterCount<2)
			{
				int rand = Random(10000);
				if (rand < 50)
				{
					me.GenerateAndDropItem(`id:51072`, me);
				}
				else if (rand < 1000 + 50)
				{
					me.GenerateAndDropItem(`id:51073`, me);
				}

				if (rand%10 == 0)
				{
   					me.ShowCaption(["event.prop_event.304"]);
				}
			}
			else if(waterCount<6)
			{
				int rand = Random(10000);
				if (rand < 150)
				{
					me.GenerateAndDropItem(`id:51072`, me);
				}
				else if (rand < 1000 + 150)
				{
					me.GenerateAndDropItem(`id:51073`, me);
				}
				if (rand%10 == 0)
				{
   					me.ShowCaption(["event.prop_event.305"]);
				}
			}
			else if(waterCount<19)
			{
				int rand = Random(10000);
				if (rand < (150 + ( waterCount - 6) * 10))
				{
					me.GenerateAndDropItem(`id:51072`, me);
				}
				else if (rand < 1000 + 150 + ( waterCount - 6) * 10)
				{
					me.GenerateAndDropItem(`id:51073`, me);
				}
				if (rand%10 == 0)
				{
   					me.ShowCaption(["event.prop_event.306"]);
				}
			}
			else
			{
				int rand = Random(10000);
				if (rand < (150 + ( waterCount - 6) * 10))
				{
					me.GenerateAndDropItem(`id:51072`, me);
				}
				else if (rand < 1000 + 150 + ( waterCount - 6) * 10)
				{
					me.GenerateAndDropItem(`id:51073`, me);
				}
				if (rand%10 == 0)
				{
   					me.ShowCaption(["event.prop_event.307"]);
				}
			}
		}
	}
}



////////////////////////////////////////////////////////////////////////////////
server void OnHitRenesProp(
	character me,
	object _object,
	string& msg)
// : 레네스 돌기둥 쳤을 때 스테이트 변화
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`renes controller attack.`);
	prop _prop = GetPropFromObject(_object);
	if (!_prop.IsNull())
	{
		string propstate = _prop.GetState();

		if (propstate == `completed`)
		{
//			me.ShowCaption("사악한 기운이 사라졌다.");
			_prop.ChangeState(`default`);
		}
		else if (propstate == `default`)
		{
//			me.ShowCaption("사악한 기운이 희미하게 느껴진다. 몬스터들이 이 기운에 반응하는 것 같다.");
			_prop.ChangeState(`completed`);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnHitImpDreamProp(
	character me,
	object _object,
	string& msg)
// : 임프의 꿈 석상 쳤을 때
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`imp dream prop attack.`);
	prop _prop = GetPropFromObject(_object);
	int regionid = _prop.GetRegionID();
	me.AddKeyword(`impdream_nostar`);

	if (!_prop.IsNull())
	{
		me.Move(regionid, 22815, 3146);
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnWeatherChanged(
	prop _prop,
	int prev_weather,
	int cur_weather)
// : 날씨가 바뀌었을 때, 프랍의 동작을 처리
////////////////////////////////////////////////////////////////////////////////
{
	if (_prop.CheckFastStringID(`/burnstone/`))
	{
		OnWeatherChanged_BurnStone(_prop, prev_weather, cur_weather);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnWeatherChanged_BurnStone(
	prop _prop,
	int prev_weather,
	int cur_weather)
// : 날씨가 바뀌었을 때, 프랍의 동작을 처리 - 발화석
////////////////////////////////////////////////////////////////////////////////
{
	if ((prev_weather == 0 || prev_weather == 1) &&
	    (cur_weather == 2 || cur_weather == 3) && _prop.GetState() == `burn`)
	{
		_prop.ChangeState(`normal`);
	}
	else if ((prev_weather == 2 || prev_weather == 3) &&
	    (cur_weather == 0 || cur_weather == 1) && _prop.GetState() == `normal`)
	{
		_prop.ChangeState(`burn`);
	}
}




////////////////////////////////////////////////////////////////////////////////
server void OnPutItemInSnowman(prop _snowman, character me, item _item)
// : 눈사람에 아이템을 넣었을 때
////////////////////////////////////////////////////////////////////////////////
{
	meta_array snowToGrow;
	meta_array decoToGrow;
	meta_array stateList;

	stateList.Add(`base`);
	stateList.Add(`grow1`);
	stateList.Add(`grow2`);
	stateList.Add(`grow3`);
	stateList.Add(`completed`);


	if (me.GetTitle() == 60001 ||me.GetTitle() == 60000)
	{
		// 단계별 눈덩이수			단계별 장식수
		snowToGrow.Add(0);			decoToGrow.Add(0);
		snowToGrow.Add(3);			decoToGrow.Add(0);
		snowToGrow.Add(2);			decoToGrow.Add(0);
		snowToGrow.Add(1);			decoToGrow.Add(0);
		snowToGrow.Add(0);			decoToGrow.Add(3);
	}


	// 개발버젼에서는 조금만 넣어도 된다.
	else if (IsDevelopment())
	{
		// 단계별 눈덩이수			단계별 장식수
		snowToGrow.Add(0);			decoToGrow.Add(0);
		snowToGrow.Add(3);			decoToGrow.Add(0);
		snowToGrow.Add(2);			decoToGrow.Add(0);
		snowToGrow.Add(1);			decoToGrow.Add(0);
		snowToGrow.Add(0);			decoToGrow.Add(3);
	}
	else if (IsCurrentEvent(`christmas2007`))
	{
		snowToGrow.Add(0);			decoToGrow.Add(0);		// 0 -> 1단계
		snowToGrow.Add(300);		decoToGrow.Add(0);		// 1 -> 2단계
		snowToGrow.Add(200);		decoToGrow.Add(0);		// 2 -> 3단계
		snowToGrow.Add(100);		decoToGrow.Add(0);		// 3 -> 4단계
		snowToGrow.Add(0);			decoToGrow.Add(30);		// 4 -> 완성
	}
	else if (IsCurrentEvent(`christmas2007japan`))
	{
		// 일본 이벤트인 경우에는 눈덩이와 장식 개수가 미친듯이 많다.
		snowToGrow.Add(0);			decoToGrow.Add(0);		// 0 -> 1단계
		snowToGrow.Add(15000);	decoToGrow.Add(0);		// 1 -> 2단계
		snowToGrow.Add(10000);	decoToGrow.Add(0);		// 2 -> 3단계
		snowToGrow.Add(5000);		decoToGrow.Add(0);		// 3 -> 4단계
		snowToGrow.Add(0);			decoToGrow.Add(5000);	// 4 -> 완성
	}
	else
	{
		// 개발자 버젼이 아니고 이벤트 중이 아니면 아무것도 할 수 없다.
		return;
	}

	int i;
	for (i = 0; i < 4; ++i)
	{
		// 편리한 계산을 위해 값을 누적시킨다.
		snowToGrow.Set(i + 1, (int)snowToGrow.Get(i) + (int)snowToGrow.Get(i + 1));
		decoToGrow.Set(i + 1, (int)decoToGrow.Get(i) + (int)decoToGrow.Get(i + 1));
	}

	string curState = _snowman.GetState().LowerCase();

	if (curState == (string)stateList.Get(0) ||
			curState == (string)stateList.Get(1) ||
			curState == (string)stateList.Get(2))
	{
		// 아이템이 눈덩이가 아니면 사념파를 내고 끝낸다.
		if (_item.GetClassId() != 51068)
		{
			me.ShowCaption(["event.prop_event.291"]);
			return;
		}
	}
	else
	{
		// 아이템이 장식이 아니면 사념파를 내고 끝낸다.
		if (_item.GetClassId() != 51069)		// 크리스마스용 장식
		{
			me.ShowCaption(["event.prop_event.298"]);
			return;
		}
	}

	bool isSnowball = (_item.GetClassId() == 51068);

	// 눈덩이나 장식을 눈사람에 넣는다.
	if (me.DestroyItem(_item))
	{
		int snowCount = _snowman.GetExtraData(`_RESSNOW`).GetInteger();
		int decoCount = _snowman.GetExtraData(`_RESDECO`).GetInteger();
		int resource;

		if (isSnowball)
		{
			++snowCount;
			_snowman.SetExtraData(`_RESSNOW`, `{0}` << snowCount);
			resource = snowCount;
		}
		else
		{
			++decoCount;
			_snowman.SetExtraData(`_RESDECO`, `{0}` << decoCount);
			resource = decoCount;
		}

		// 일본 이벤트중이면 로그를 기록한다.
		if (IsCurrentEvent(`christmas2007japan`))
		{
			// 눈이나 장식을 넣었다.
			me.WriteLogAddItemToSnowman(isSnowball, resource);
		}

		string xmasKeyword;

		if (IsCurrentEvent(`christmas2007japan`))
		{
			// 일본에서는 히든 키워드인 _christmas2007을 준다.
			xmasKeyword = `_christmas2007`;
		}
		else
		{
			xmasKeyword = `christmas2009_snowman`;
		}

		// 아이템을 넣으면 키워드를 받는다.
		if (!me.HaveKeyword(xmasKeyword))
		{
			me.AddKeyword(xmasKeyword);
		}

		int iCurState, iStateIdx;
		for (iStateIdx = 0; iStateIdx < 4; ++iStateIdx)
		{
			if (curState == (string)stateList.Get(iStateIdx))
			{
				if (snowCount >= (int)snowToGrow.Get(iStateIdx + 1) &&
						decoCount >= (int)decoToGrow.Get(iStateIdx + 1))
				{
					_snowman.ChangeState((string)stateList.Get(iStateIdx + 1), me, 0);

					// 일본 이벤트중이면 로그를 기록한다.
					if (IsCurrentEvent(`christmas2007japan`))
					{
						// 눈사람의 상태가 변하였다.
						me.WriteLogChangeStateOfSnowman(curState, (string)stateList.Get(iStateIdx + 1));

						// 다음 상태가 "completed"라면 눈사람이 완성된 것이다.
						if (iStateIdx + 1 == 4)
						{
							me.WriteLogCompleteToBuildSnowman();
						}
					}
					return;
				}

				iCurState = iStateIdx;
				break;
			}
		}

		int nextSnowToGrow = (int)snowToGrow.Get(iCurState + 1) - (int)snowToGrow.Get(iCurState);
		int nextDecoToGrow = (int)decoToGrow.Get(iCurState + 1) - (int)decoToGrow.Get(iCurState);

		// DebugOut(`iCurState = {0}` << iCurState);
		// DebugOut(`snowCount = {0}` << snowCount);
		// DebugOut(`decoCount = {0}` << decoCount);
		// DebugOut(`nextSnowToGrow = {0}` << nextSnowToGrow);
		// DebugOut(`nextDecoToGrow = {0}` << nextDecoToGrow);

		if (nextSnowToGrow > 0 && nextDecoToGrow > 0)
		{
			me.ShowCaption(["event.prop_event.293"]);
		}
		else if (nextDecoToGrow == 0)
		{
			me.ShowCaption(["event.prop_event.294"]);
		}
		else if (nextSnowToGrow == 0)
		{
			me.ShowCaption(["event.prop_event.295"]);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnPutItemInChristmasTree(prop _tree, character me, item _item)
// : 크리스마스 트리에 아이템을 넣었을 때
////////////////////////////////////////////////////////////////////////////////
{
	// 아이템 장식이 아니면 사념파를 내고 끝낸다.
	if (_item.GetClassId() != 51069)
	{
		me.ShowCaption(["event.prop_event.296"]);
		return;
	}

	meta_array decoToGrow;
	meta_array stateList;

	stateList.Add(`step1`);
	stateList.Add(`step2`);
	stateList.Add(`step3`);

	// 개발버젼에서는 조금만 넣어도 된다.
	if (IsDevelopment())
	{
		decoToGrow.Add(0);
		decoToGrow.Add(5);
		decoToGrow.Add(10);
	}
	else if (IsCurrentEvent(`christmas2007`))
	{
		decoToGrow.Add(0);			// 0 -> 1단계
		decoToGrow.Add(50);			// 1 -> 2단계
		decoToGrow.Add(100);		// 2 -> 3단계
	}
	else if (IsCurrentEvent(`christmas2007japan`))
	{
		// 일본 이벤트인 경우에는 장식 개수가 미친듯이 많다.
		decoToGrow.Add(0);			// 0 -> 1단계
		decoToGrow.Add(5000);		// 1 -> 2단계
		decoToGrow.Add(5000);	// 2 -> 3단계
	}
	else
	{
		// 개발자 버젼이 아니고 이벤트 중이 아니면 아무것도 할 수 없다.
		return;
	}

	int i;
	for (i = 0; i < 2; ++i)
	{
		// 편리한 계산을 위해 값을 누적시킨다.
		decoToGrow.Set(i + 1, (int)decoToGrow.Get(i) + (int)decoToGrow.Get(i + 1));
	}

	// 장식을 트리에 넣는다.
	if (me.DestroyItem(_item))
	{
		int res = _tree.GetExtraData(`_RESOURCE`).GetInteger() + 1;
		_tree.SetExtraData(`_RESOURCE`, `{0}` << res);

		// 일본 이벤트중이면 로그를 기록한다.
		if (IsCurrentEvent(`christmas2007japan`))
		{
			// 장식을 넣었다.
			me.WriteLogAddItemToTree(res);
		}

		string xmasKeyword;

		if (IsCurrentEvent(`christmas2007japan`))
		{
			// 일본에서는 히든 키워드인 _christmas2007을 준다.
			xmasKeyword = `_christmas2007`;
		}
		else
		{
			xmasKeyword = `christmas2009_tree`;
		}

		// 아이템을 넣으면 키워드를 받는다.
		if (!me.HaveKeyword(xmasKeyword))
		{
			me.AddKeyword(xmasKeyword);
		}

		string curState = _tree.GetState();
		curState = curState.LowerCase();

		int iStateIdx;
		for (iStateIdx = 0; iStateIdx < 2; ++iStateIdx)
		{
			if (curState == (string)stateList.Get(iStateIdx))
			{
				if (res >= (int)decoToGrow.Get(iStateIdx + 1))
				{
					_tree.ChangeState((string)stateList.Get(iStateIdx + 1), me, 0);

					// 일본 이벤트중이면 로그를 기록한다.
					if (IsCurrentEvent(`christmas2007japan`))
					{
						// 트리의 상태가 변하였다.
						me.WriteLogChangeStateOfTree(curState, (string)stateList.Get(iStateIdx + 1));

						// 다음 상태가 "step3"라면 트리가 완성된 것이다.
						if (iStateIdx + 1 == 2)
						{
							me.WriteLogCompleteToBuildTree();
						}
					}
					return;
				}
				break;
			}
		}

		me.ShowCaption(["event.prop_event.297"]);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnExchangeWishToGift(character me, int _itemClassId)
// : 일본 신년 이벤트 때에 소원나무에 소원 쪽지를 넣고 '예'를 선택한 경우
//	 개수에 맞게 선물을 주어야 한다.
////////////////////////////////////////////////////////////////////////////////
{
	if (me.GetItemNoWithClassId(_itemClassId)	< 50)
	{
		me.ShowCaption(["event.prop_event.299"]);
		return;
	}

	// 아이템을 삭제한다.
	me.RemoveItemCls(_itemClassId, 50);

	// 선물을 확률에 맞춰서 준다.
	int rate = Random(200);
	int giftId;

	if (rate <= 40)
	{
		giftId = 91050;			// 후쿠부쿠로
	}
	else if (rate <= 100)
	{
		giftId = 12039;			// 오마모리
	}
	else
	{
		giftId = 51071;			// 오미쿠지
	}

	me.RcvItemWithRewardView(me, giftId);

	me.ShowCaption(["event.prop_event.300"]);
}

////////////////////////////////////////////////////////////////////////////////
server void OnPutItemCherryTree(prop _cherrytree, character me, item _item)
// : 꽃놀이 이벤트 나무에 아이템을 넣을 때
////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`blossom2008_japan`))
	{
		if (me.HaveKeyword(`cherry_tree_2`) && _item.GetClassId() == 73164 && me.GetItemNoWithClassId(73164) >= 1)
		{
			me.RemoveKeyword(`cherry_tree_2`);
			me.AddKeyword(`cherry_tree_3`);
			me.RemoveItemCls(73164);
			me.RcvItem(me, 73165);
			me.ShowCaption(["event.prop_event.301"]);
			return;
		}
		// 아이템이 회복약이 아니면 사념파를 내고 끝낸다.
		if (_item.GetClassId() != 73164)		// 나무 회복약
		{
			me.ShowCaption(["event.prop_event.302"]);
			return;
		}
	 }
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchCherryTreeScript(character me, object _object, string& msg)
// : 꽃놀이 이벤트 나무에 아이템을 터치할 때
////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`blossom2008_japan`))
	{
		if (me.HaveKeyword(`cherry_tree`) && !me.HaveQuestTemplate(201112) && !me.IsQuestTried(201112))
		{
			me.AddKeyword(`cherry_tree_0`);
			me.AddGameQuest(201112, 0.1);
		}

		me.ShowCaption(["event.prop_event.303"]);
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnTouchShadowAltar(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
}



////////////////////////////////////////////////////////////////////////////////
server void OnHitShadowTree(
	character me,
	object _object,
	string& msg)
// : 그림자세계 포워르의 열매 때렸을 때 스테이트마다 떨어지는 열매 설정
////////////////////////////////////////////////////////////////////////////////
{
	prop _prop = GetPropFromObject(_object);
	int _random1 = Random(100);
	int _random2 = Random(100);
	if (!_prop.IsNull())
	{
		string propstate = _prop.GetState();

		if (_random1 < 33)
		{
			if (propstate == `pink`)
			{
				me.GenerateAndDropItem(`id:50074`, me);
				if (_random2 < 35)
				{
					_prop.ChangeState(`empty`);
				}
			}
			else if (propstate == `orange`)
			{
				me.GenerateAndDropItem(`id:50075`, me);
				if (_random2 < 35)
				{
					_prop.ChangeState(`empty`);
				}
			}
			else if (propstate == `red`)
			{
				me.GenerateAndDropItem(`id:50076`, me);
				if (_random2 < 35)
				{
					_prop.ChangeState(`empty`);
				}
			}
			else if (propstate == `violet`)
			{
				me.GenerateAndDropItem(`id:50077`, me);
				if (_random2 < 40)
				{
					_prop.ChangeState(`empty`);
				}
			}
			if (propstate == `green`)
			{
			}
			else if (propstate == `empty`)
			{
			}
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnHitSkiNoticeProp(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if ((me.GetPositionX() >= 224225 - 500 && me.GetPositionX() <= 224225 + 500)
		&& (me.GetPositionY() >= 217860 - 500 && me.GetPositionY() <= 217860 + 500))
	{
		me.Move(3200, 198468, 186497);
	}
}
////////////////////////////////////////////////////////////////////////////////
server void OnHitSkijumpNoticeProp(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if ((me.GetPositionX() >= 236499 - 500 && me.GetPositionX() <= 236499 + 500)
		&& (me.GetPositionY() >= 223234 - 500 && me.GetPositionY() <= 223234 + 500))
	{
		me.Move(3200, 237141, 245380);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchMouseholeDoorOutside(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	if(me.IsRiding())
	{
		me.ShowCaption(["event.prop_event.310"]);
	}
	else if (me.IsInConditionWithName(`UseItemMiniPotion`))
	{
		me.SetConditionRemainTimeWithName(`UseItemMiniPotion`, 1800000);
		me.WarpToEventBox(`InsideOfTreasure`);
		me.ShowCaption(["event.prop_event.311"]);
	}
	else
	{
		me.ShowCaption(["event.prop_event.312"]);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchMouseholeDoorInside(
	character me,
	object _object,
	string& msg)
// : PropDB.data에 기술된 Action에 대한 스크립트 함수의 예
////////////////////////////////////////////////////////////////////////////////
{
	me.WarpToEventBox(`OutsideOfTreasure`);

	if (me.IsInConditionWithName(`UseItemMiniPotion`))
	{
		me.SetConditionRemainTimeWithName(`UseItemMiniPotion`, 3000);
		me.ShowCaption(["event.prop_event.313"]);
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnTouchBruinac(character me, object _object, string& msg)
// : 꽃놀이 이벤트 나무에 아이템을 터치할 때
////////////////////////////////////////////////////////////////////////////////
{
	dungeon2 _dungeon = me.FindDungeon2();
//	dungeon2puzzle _puzzle = me.GetDungeon2Puzzle();
	int missionID = 0;
	if (!_dungeon.IsNull())
	{
		missionID = _dungeon.GetLinkedQuest();
	}
	if (me.IsSparkHighVoltageState())
	{
		me.ShowCaptionEx(["event.prop_event.308"], `region`);
		me.PlayCutScene(`C3G11_S#7_2_jenna_rage`);
		me.AddKeyword(`g11_15`);
		me.RemoveKeyword(`g11_14`);
//		me.DoStript(`additemex(id:40311 rewardview:true)`);
		me.DoStript(`additemex(id:75414 rewardview:true)`);
//		_puzzle.Complete();
		_dungeon.Complete();
	}
	else
	{
		me.ShowCaptionEx(["event.prop_event.309"], `region`);
	}
}


////////////////////////////////////////////////////////////////////////////////
server void OnTouchFaliasWarpProp(character me, object _object, string& msg)
// : 팔리아스 워프 게이트 클릭시
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`[PropEvent] OnTouchFaliasWaprProp`);

	prop _prop = GetPropFromObject(_object);
	party _party = me.GetParty();

	if (_prop.GetExtraData(["event.prop_event.314"]) == ["event.prop_event.315"])
	{
		// 팔리아스에서 되돌아가는 용도
		string lastPos = _prop.GetExtraData(["event.prop_event.316"]);

		if (me.WarpToPosition(lastPos))
		{
			// DebugOut(`[PropEvent] 팔리아스에서 되돌아가기 성공`);
		}
		else
		{
			// DebugOut(`[PropEvent] 팔리아스에서 되돌아가기 실패`);
		}
	}
	else
	{
		// 파티 리더이거나 파티에 가입하지 않을 경우에만 이동 가능
		if (me.IsPartyLeader() ||  !_party.IsValid())
		{
			// 프랍을 만든 캐릭 이름
			string owner = _prop.GetExtraData(["event.prop_event.317"]);

			if (owner == me.GetOriginalName())
			{
				int missionID = me.FindShadowMission();

				// 들어갈 수 있는 그림자 미션이 있는지 먼저 체크한 후, 그림자 미션으로 먼저 보내준다.
				if (!missionID == 0)
				{
					// 793012 미션 들여보낸다.
					// 793014 최종장 들여보낸다.
					if(missionID == 793012 || missionID == 793014)
					{
						if (me.HaveQuestTemplate(293025) && me.GetCompletedQuestObjectiveCount(293025)==0 && !me.HaveKeyword(`g12_18`))
						{
							me.AddKeyword(`g12_18`);
						}

						// 파티일 경우 혼자일 때만 들여보낸다.
						if(_party.IsValid())
						{
							int PlayerCnt = _party.GetMemberNo();
							if(PlayerCnt == 1)
							{
								// 프랍을 없애준다.
								_prop.SetCountDown(500);

								// 혼자일 때만 들여보낸다. (범위, 프랍ID)
								me.EnterDungeon2Directly(1000, _prop);
								return;
							}
							else
							{
								me.ShowMessageView(["event.prop_event.326"]);
								return;
							}
						}
						else
						{
							// 프랍을 없애준다.
							_prop.SetCountDown(500);

							// 혼자일 때만 들여보낸다.
							me.EnterDungeon2Directly(1000, _prop);
							return;
						}
					}
				}

				// 클릭한 사람이 같다.
				if (me.WarpToFalias())
				{
					// 프랍을 없애준다.
					_prop.SetCountDown(500);
				}
				else
				{
					// DebugOut(`[PorpEvent] 워프에 실패했다.`);
				}
			}
			else
			{
				me.ShowMessageView(["event.prop_event.325"]);
				// DebugOut(`[PorpEvent] 오너가 아니다. (`+owner+` / `+ me.GetOriginalName());
			}
		}
		else
		{
			me.ShowMessageView(["event.prop_event.327"]);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchConfessional(character me, object _object, string& msg)
// : 고해소 클릭시
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`[PropEvent] OnTouchConfessional`);

	// 메인 스트림 키워드 g12_09~g12_20, 혹은 g12_complete이면 입장이 가능하다.
	// 메인 스트림 키워드 g12_08일 경우 퀘스트에 진행 상황에 따라 입장이 가능하다.

	if(me.HaveQuestTemplate(293009) && me.GetCompletedQuestObjectiveCount(293009) == 2 && me.HaveKeyword(`g12_08`))
	{
		// 고해소에 처음 들어갈 수 있는 상황이 되면 입장 키워드를 준다.
		if(!me.HaveKeyword(`g12_09_2`))
		{
			me.AddKeyword(`g12_09_2`);
		}
	}

	// 맨손 & 천옷 계열 & 로브 장착 상황에서 입장이 가능하다.
	if(me.HaveKeyword(`g12_09_2`) || me.HaveKeyword(`g12_complete`))
	{
		object_list cItemList1, cItemList2, cItemList3, cItemList4;
		item _weapon1, _weapon2, _cloth, _robe;

		cItemList1 = me.GetItemListInPocket(10);	// 무기 슬롯 1번
		cItemList2 = me.GetItemListInPocket(11);	// 무기 슬롯 2번
		cItemList3 = me.GetItemListInPocket(5);	// 의상
		cItemList4 = me.GetItemListInPocket(9);	// 로브

		_weapon1 = (item)cItemList1.GetValue(0);
		_weapon2 = (item)cItemList2.GetValue(0);
		_cloth = (item)cItemList3.GetValue(0);
		_robe = (item)cItemList4.GetValue(0);

		// 무기 장착하고 있으면 못 들어간다.
		if(_weapon1.IsNull() && _weapon2.IsNull())
		{
			// 천옷을 입고 있어야 한다.
			if(!_cloth.IsNull() && _cloth.GetClass().CheckStringID(`(*/cloth/*)|(*/agelimit_cloth/*)`))
			{
				// 로브를 입고 있어야 한다.
				if(!_robe.IsNull())
				{
					me.WarpToConfessional(467, 792);
					me.SetDirection(0);
				}
				else
				{
					me.ShowCaption(["event.prop_event.319"]);
				}
			}
			else
			{
				me.ShowCaption(["event.prop_event.320"]);
			}
		}
		else
		{
			me.ShowCaption(["event.prop_event.321"]);
		}
	}
	else
	{
		me.ShowCaption(["event.prop_event.318"]);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchConfessionalOut(character me, object _object, string& msg)
// : 고해소 클릭시
////////////////////////////////////////////////////////////////////////////////
{
	// DebugOut(`[PropEvent] OnTouchConfessional`);
	// 고해소 밖으로 나간다.r:421 x:6340 y:6193
	me.Move(421, 6340, 6193);
}


////////////////////////////////////////////////////////////////////////////////
server void OnTouchBalloon(character me, object _object, string& msg)
// : 풍선을 터치할 때
////////////////////////////////////////////////////////////////////////////////
{
	int deedid = 53;

	if (me.IsPet()) return;
	
	if(me.GetTitle() == 60001 ||
		me.IsEnableDeed(deedid)) 
	{
		int itemid = 12124 + Random(3);
		
		item balloon;
		balloon = me.AddItemEx(`id:` + ToString(itemid) + ` usestack:false`, false);
		
		if (balloon.IsValid())
		{
			me.DoneDeed(deedid);
			
			string message = balloon.GetLocalName() + ["event.prop_event.322"];
			me.ShowCaption(message);
			
			// 성공 모션을 보여준다.
			me.Stop();
			me.SetMotionType(14,2,false); // Category, Element, loop
			
			balloon.SetBalloonRevivalExpireTime(24*60*60*1000);
			me.InventorySynchItem(balloon);
		}
		else
		{
			me.ShowCaption(["event.prop_event.323"]);
		}
	}
	else
	{
		me.ShowCaption(["event.prop_event.324"]);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchItemEnhanceProp(character me, object _object, string& msg)
// : 아이템 강화용 프랍을 터치할 때
////////////////////////////////////////////////////////////////////////////////
{
	me.OpenItemEnhanceView();
}

////////////////////////////////////////////////////////////////////////////////
server void OnTouchStageDungerEnterDoor(character me, object _object, string& msg)
// : 무대 던전 입장 투명문 터치할 때
////////////////////////////////////////////////////////////////////////////////
{
	me.OpenStageDungeonEnterView();
}