//////////////////////////////////////////////////////////////////////////////////
//	1. 서버 필수 함수
//

//////////////////////////////////////////////////////////////////////////////////
//
server void OnZoneCreate(zone _iz)
{
	// DebugOut(`[팔리아스] Called OnZoneCreate`);
	character creator;
	dword startDelay;				// 입장후 시작하기 까지 시간
	int playerCnt = _iz.GetPlayerCount();

	creator = _iz.GetCreator();
	startDelay = 20 * 1000;				// 20초 후에 안바르 등장 (이건 좀 보자)

	_iz.AddInformation(`Level`, ``);
	_iz.AddInformation(`Notice1`, ``);
	_iz.AddInformation(`Notice2`, ``);

	Initializer(creator, startDelay, _iz);		// 리전 세팅해주는 함수
}
//
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
//
server void OnZoneClosed(zone _iz)
{
	// DebugOut(`[팔리아스] Called OnZoneClosed`);
	_iz.DeleteInformation(`Level`);
	_iz.DeleteInformation(`Notice1`);
	_iz.DeleteInformation(`Notice2`);
}
//
//////////////////////////////////////////////////////////////////////////////////

server void OnPropAppear(zone _iz, prop _prop)
{
	// DebugOut(`[팔리아스] Called OnPropAppear`);
}

server void OnPropStateChange(zone _iz, prop _prop, string _oldstate, string _newstate)
{
	// DebugOut(`[팔리아스] Called OnPropStateChange`);

	// 프랍 상태가 completed가 되면
	if(_newstate == `completed`)
	{
		dword stage;
		dword treasure_state;

		_iz.GetData(`stage`, stage);
		_iz.GetData(`treasure_state`, treasure_state);

		// 혹시 모르니 진짜 유물을 얻었도 되는지 여기서 다시 한 번 체크한다.
		if(stage == 8 && treasure_state == 2)
		{
			_iz.SetTimer(`get_treasure`, 0 , 9000);		// 5초 뒤 프랍 애니메이션 끝나고 난 뒤에 유물을 주자
		}
	}
}

server void OnPropDisappear(zone _iz, prop _prop)
{
	// DebugOut(`[팔리아스] Called OnPropDisappear`);
}

server void OnCharacterEnter(zone _iz, character _char)
{
	dword trap_wave;
	dword max_wave;

	dword stage;
	dword treasure_state;
	_iz.GetData(`stage`, stage);

	dword alert;
	_iz.GetData(`alert`, alert);

	string name = _char.GetRaceName();
	string indexname = name.Left(7);

	_iz.GetData(`trap_wave`, trap_wave);

	dword aonbarr_count;
	_iz.GetData(`aonbarr_count`, aonbarr_count);

	// DebugOut(`[팔리아스] Called OnCharacterEnter: `+name+`, MonsterCount: `+ToString(aonbarr_count));

	if (_char.IsStaticPC() &&
		_char.IsPartyMember())
	{
		// 인연 정보를 추가한다.
		object_list cCharList = _iz.GetPlayerList();
		int PlayerCnt = _iz.GetPlayerCount();
		character player;
		int i;
		
		for (i = 0 ; i < PlayerCnt ; i++)
		{
			player = (character)cCharList.GetValue(i);
			if (_char != player &&
				_char.IsPartyMember(player))
			{
				_char.AddRelationEvent(player, 31);
				player.AddRelationEvent(_char, 31);
			}		
		}
	}
	else if((stage == 3 || stage == 4) && aonbarr_count > 35)		// 트랩 중 몬스터가 35마리가 넘으면 실패로 처리한다. (부유석 8, NPC1, 안바르 36 마리 이상)
	{
		int temp = 0+aonbarr_count;
		// DebugOut(`[팔리아스] 안바르 수: `+ToString(temp));
		// 트랩 실패 상태로 스테이트 변경
		stage = 6;
		treasure_state = 6;

		_iz.SetData(`stage`, stage);
		_iz.SetData(`treasure_state`, treasure_state);

		_iz.GetData(`trap_wave`, trap_wave);
		_iz.GetData(`max_wave`, max_wave);

		trap_wave = max_wave + 1;
		_iz.SetData(`trap_wave`, trap_wave);

		MessageDisplay(_iz, ["event.falias.1"], 0);

		_iz.ChangeInformation(`Notice1`, ["event.falias.2"]);
		_iz.ChangeInformation(`Notice2`, ["event.falias.3"]);

		alert = 2;
		_iz.SetData(`alert`, alert);

		// 5초 뒤 안바르를 모두 사라지게 한다.
		_iz.SetTimer(`trap_falied`, 0 , 5000);
	}
	else if((stage == 3 || stage == 4)  && aonbarr_count > 20 && alert == 0)	// 트랩 중 몬스터가 35마리가 넘은 시점에서 경고. (부유석 8, NPC 1, 안바르 20 마리 이상)
	{
		int temp = 0+aonbarr_count;
		// DebugOut(`[팔리아스] 안바르 수: `+ToString(temp));
		alert = 1;
		_iz.SetData(`alert`, alert);

		MessageDisplay(_iz, ["event.falias.4"], 0);
	}

	if(name == `falias_gatekeeper`)		// NPC 방향 설정
	{
		// DebugOut(`[팔리아스] NPC 방향 전환`);
		_iz.SetData(`falias_gatekeeper`, _char);
		_char.SetDirection(-1.897);
	}
	else if(name == `falias_rock`)
	{
		int iPosX = _char.GetPositionX();
		int iPosY = _char.GetPositionY();

		if(iPosX == 12862 && iPosY == 29116)
		{
			// DebugOut(`[팔리아스] 부유석 1 저장`);
			_iz.SetData(`FaliasRock1`, _char);
		}
	}
	else if(indexname == `aonbarr`)		// 스테이지 진행 상황에 따라 몬스터 스탯 조정
	{
		// DebugOut(`[팔리아스] 안바르 스탯 강화`);
		dword stage_level;
		_iz.GetData(`stage_level`, stage_level);

		float Life;
		float Def;
		float Prot;
		short AtkMin;
		short AtkMax;
		short SkillRank1;
		short SkillRank2;

		float trapwaveMod;
		float stagelevelMod;

		Life = _char.GetLifeMax();
		Def = _char.GetDefenseBase();
		Prot = _char.GetProtectBase();

		// 트랩 단계마다 5% 능력 상승
		if(stage == 3 || stage == 4)
		{
			trapwaveMod = 1 + ((trap_wave - 1) * 0.05);
			int temp = trapwaveMod*100;
			// DebugOut(`[팔리아스] 웨이브마다 강화 `+ToString(temp));
		}
		else
		{
			// DebugOut(`[팔리아스] 기본 강화`);
			trapwaveMod = 1;
		}		

		// 스테이지 레벨에 따라 몬스터 능력치, 스킬 랭크 조정
		switch(stage_level)
		{
			case(1)		// 파티 총 누렙 1 ~ 499 (기본)
			{
				Life = 350 * trapwaveMod;
				Def = 15 * trapwaveMod;
				Prot = 5 * trapwaveMod;
				AtkMin = 16 * trapwaveMod;
				AtkMax = 31 * trapwaveMod;
				SkillRank1 = 2;
				SkillRank2 = 7;
				_iz.ChangeInformation(`Level`, ["event.falias.5"]);
			}			
			case(2)		// 파티 총 누렙 500 ~ 999
			{
				Life = 410 * trapwaveMod;
				Def = 21 * trapwaveMod;
				Prot = 10 * trapwaveMod;
				AtkMin = 20 * trapwaveMod;
				AtkMax = 37 * trapwaveMod;
				SkillRank1 = 2;
				SkillRank2 = 8;
				_iz.ChangeInformation(`Level`, ["event.falias.6"]);
			}
			case(3)		// 파티 총 누렙 1000 ~ 1999
			{
				Life = 480 * trapwaveMod;
				Def = 28 * trapwaveMod;
				Prot = 16 * trapwaveMod;
				AtkMin = 25 * trapwaveMod;
				AtkMax = 44 * trapwaveMod;
				SkillRank1 = 3;
				SkillRank2 = 9;
				_iz.ChangeInformation(`Level`, ["event.falias.7"]);
			}
			case(4)		// 파티 총 누렙 2000 ~ 2999
			{
				Life = 570 * trapwaveMod;
				Def = 36 * trapwaveMod;
				Prot = 23 * trapwaveMod;
				AtkMin = 31 * trapwaveMod;
				AtkMax = 53 * trapwaveMod;
				SkillRank1 = 3;
				SkillRank2 = 10;
				_iz.ChangeInformation(`Level`, ["event.falias.8"]);
			}
			case(5)		// 파티 총 누렙 3000 ~ 4999
			{
				Life = 670 * trapwaveMod;
				Def = 45 * trapwaveMod;
				Prot = 31 * trapwaveMod;
				AtkMin = 39 * trapwaveMod;
				AtkMax = 64 * trapwaveMod;
				SkillRank1 = 4;
				SkillRank2 = 11;
				_iz.ChangeInformation(`Level`, ["event.falias.9"]);
			}
			case(6)		// 파티 총 누렙 5000 ~ 9999
			{
				Life = 790 * trapwaveMod;
				Def = 55 * trapwaveMod;
				Prot = 40 * trapwaveMod;
				AtkMin = 49 * trapwaveMod;
				AtkMax = 77 * trapwaveMod;
				SkillRank1 = 4;
				SkillRank2 = 13;
				_iz.ChangeInformation(`Level`, ["event.falias.10"]);
			}
			case(7)		// 파티 총 누렙 10000 ~
			{
				Life = 930 * trapwaveMod;
				Def = 66 * trapwaveMod;
				Prot = 50 * trapwaveMod;
				AtkMin = 61 * trapwaveMod;
				AtkMax = 92 * trapwaveMod;
				SkillRank1 = 5;
				SkillRank2 = 15;
				_iz.ChangeInformation(`Level`, ["event.falias.11"]);
			}
			default		// 예외 상황, 레벨 7 기준
			{
				Life = 460 * trapwaveMod;
				Def = 66 * trapwaveMod;
				Prot = 50 * trapwaveMod;
				AtkMin = 49 * trapwaveMod;
				AtkMax = 71 * trapwaveMod;
				SkillRank1 = 5;
				SkillRank2 = 15;
				_iz.ChangeInformation(`Level`, ["event.falias.12"]);
			}
		}

		// 보호는 최대 80으로 제한
		if (Prot >80)		
		{
			Prot = 80;
		}

		// DebugOut(`[팔리아스] 스탯 보정, Life = `+ToString(Life)+`, Def = `+ToString(Def) +`, Prot = `+ToString(Prot)+`, AtkMin = `+ToString(AtkMin)+`, AtkMax = `+ToString(AtkMax));

		// 지정된 값으로 스탯 보정
		_char.SetLifeBase(Life);
		_char.SetWound(Life);
		_char.SetLife(Life);
		_char.SetDefenseBase(Def);
		_char.SetProtectBase(Prot);
		_char.ModifyAttackMin(AtkMin);
		_char.ModifyAttackMax(AtkMax);

		// 스킬 추가
		_char.AddSkill(23001, SkillRank2);		// 전투 순발력
		_char.AddSkill(23002, SkillRank2);		// 컴뱃 마스터리
		_char.AddSkill(23003, SkillRank2);		// 크리티컬
		_char.AddSkill(23004, SkillRank1);		// 패시브 내츄럴 실드
		_char.AddSkill(23005, SkillRank1);		// 패시브 헤비 스탠더
		_char.AddSkill(23006, SkillRank1);		// 패시브 마나 리프렉터
		_char.AddSkill(20001, SkillRank2);		// 디펜스
		_char.AddSkill(20002, SkillRank2);		// 스매시
		_char.AddSkill(20003, SkillRank2);		// 카운터 어택
		_char.AddSkill(30301, SkillRank2);		// 아이스볼트
	}
}

server void OnCharacterLeave(zone _iz, character _char)
{
}

server void OnCharacterDie(zone _iz, character _char, character _killer)
{
	string name = _char.GetRaceName();
	string indexname = name.Left(7);
	// // DebugOut(`[팔리아스] Called OnCharacterDie: `+name);

	dword stage;
	dword treasure_state;
	dword trap_wave;
	dword max_wave;

	_iz.GetData(`stage`, stage);
	_iz.GetData(`trap_wave`, trap_wave);
	_iz.GetData(`max_wave`, max_wave);

	dword aonbarr_count = 0;

	if(indexname == `aonbarr`)		// 스테이지 진행 상황에 따라 몬스터 스탯 조정
	{
		// DebugOut(`[팔리아스] 안바르 죽고 카운트 감소`);
		_iz.GetData(`aonbarr_count`, aonbarr_count);
		aonbarr_count = aonbarr_count - 1;

		if(aonbarr_count < 0)	{	aonbarr_count = 0;	}
		_iz.SetData(`aonbarr_count`, aonbarr_count);
	}

	// DebugOut(`[팔리아스] Called OnCharacterDie: `+name+`, MonsterCount: `+ToString(aonbarr_count));

	// 트랩에서 몬스터 모두 등장한 뒤
	if(stage == 4)
	{
		_iz.GetData(`aonbarr_count`, aonbarr_count);

		if(aonbarr_count == 0)
		{
			// DebugOut(`[팔리아스] 트랩 클리어 (stage 4->5)`);
			stage = 5;
			treasure_state = 5;

			_iz.SetData(`treasure_state`, treasure_state);
			_iz.SetData(`stage`, stage);

			MessageDisplay(_iz, ["event.falias.13"], 0);
			_iz.ChangeInformation(`Notice1`, ["event.falias.14"]);
			_iz.ChangeInformation(`Notice2`, ``);
		}
	}

	else if(stage == 1)
	{
		_iz.GetData(`aonbarr_count`, aonbarr_count);

		if(aonbarr_count == 0)
		{
			// DebugOut(`[팔리아스] 초기 배치 안바르 클리어 (stage 1->2)`);
			stage = 2;
			treasure_state = 1;

			_iz.SetData(`treasure_state`, treasure_state);
			_iz.SetData(`stage`, stage);

			MessageDisplay(_iz, ["event.falias.15"], 0);
			_iz.ChangeInformation(`Notice1`, ["event.falias.16"]);
		}
	}
}

server void OnTimer(zone _iz, string name, dword userdata)
{
	// DebugOut(`[팔리아스] Called OnTimer: `+name);
	if(_iz.IsValid())
	{
		dword stage;
		dword state_level;
		dword treasure_state;
		
		_iz.GetData(`stage`, stage);
		_iz.GetData(`stage_level`, state_level);
		_iz.GetData(`treasure_state`, treasure_state);

		if ((name == `allocmonster`) && stage == 0)
		{
			// 스테이지 진행 0 -> 1
			stage = 1;
			_iz.SetData(`stage`, stage);

			// 플레이어 인원 체크 (8명보다 많으면 인스턴스 리전 해제)
			int playerCnt = _iz.GetPlayerCount();
			if (playerCnt > 8)
			{
				object_list cCharList = _iz.GetPlayerList();
				character player;
				int i;
				int IsGM = 0;
				for (i = 0 ; i < playerCnt ; i++)
				{
					player = (character)cCharList.GetValue(i);
					if (player.GetTitle() == 60000)
					{
						IsGM = 1;		// 던전에 지엠이 있다.
					}
				}

				if (IsGM == 0)		// 지엠이 있으면 던전 소멸 시키면 안된다. 
				{
					MessageDisplay(_iz, ["event.falias.17"], 0);
					_iz.ReserveDestroy(3000, ``);
				}
			}
			
			// DebugOut(`[팔리아스] Call monsterspawn`);
			monsterspawn(_iz);
			_iz.ChangeInformation(`Notice1`, ["event.falias.18"]);

		}
		else if ((name == `trap_start`) && stage == 3)
		{
			// 플레이어 인원 체크 (8명보다 많으면 인스턴스 리전 해제)
			int playerCnt = _iz.GetPlayerCount();
			if (playerCnt > 8)
			{
				object_list cCharList = _iz.GetPlayerList();
				character player;
				int i;
				int IsGM = 0;
				for (i = 0 ; i < playerCnt ; i++)
				{
					player = (character)cCharList.GetValue(i);
					if (player.GetTitle() == 60000)
					{
						IsGM = 1;		// 던전에 지엠이 있다.
					}
				}

				if (IsGM == 0)		// 지엠이 있으면 던전 소멸 시키면 안된다. 
				{
					MessageDisplay(_iz, ["event.falias.19"], 0);
					_iz.ReserveDestroy(3000, ``);
				}
			}

			// DebugOut(`[팔리아스] Call monsterspawn`);
			monsterspawn(_iz);
		}
		else if (name == `trap_falied`)
		{
			// 트랩 실패했다. 안바르 모두 없애자.
			_iz.DeallocateMonsterRace(`aonbarr_trap1`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap2`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap3`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap4`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap5`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap6`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap7`, -1);
			_iz.DeallocateMonsterRace(`aonbarr_trap8`, -1);
		}
		else if(name == `treasure_success`)
		{
			prop _prop = _iz.FindProp(`treasureAltar`);

			_prop.ChangeState(`completed`);

			// 기뻐하는 모션
			character creator = _iz.GetCreator();
			creator.PlayAnimation(14,0,true,2000);

			_iz.ChangeInformation(`Notice1`, ["event.falias.20"]);

		}
		else if(name ==  `treasure_fail`)
		{
			// 낙담하는 모션
			character creator = _iz.GetCreator();
			creator.PlayAnimation(14,1,true,2000);

			MessageDisplay(_iz, ["event.falias.21"], 0);

			_iz.ChangeInformation(`Notice1`, ["event.falias.22"]);

		}
		else if(name ==  `treasure_surprise`)
		{
			// 놀라는 모션
			character creator = _iz.GetCreator();
			creator.PlayAnimation(53,7,true,2000);

			_iz.SetTimer(`trap_start`, 0 , 1000);
			MessageDisplay(_iz, ["event.falias.23"], 0);

			dword  max_prop_count;
			_iz.GetData(`max_prop_count`, max_prop_count);
			int imax_prop_count = max_prop_count + 0;

			_iz.ChangeInformation(`Notice1`, ["event.falias.24"]);
			_iz.ChangeInformation(`Notice2`, ["event.falias.25"]+ToString(imax_prop_count));
		}
		else if(name ==  `get_treasure`)
		{
			// 생성자에게 유물을 준다.
			character creator;
			creator = _iz.GetCreator();

			// G12 유물을 8개 중 뭐 줄지 고른다.
			int iRan = Random(8);

			// G12S2 이면 4개 추가되서 12개이다.
			if (GetVersion() >= 1202)
			{
				iRan = Random(12);
			}
			
			// 이 시즌 이후로 누아자 세트 아이템이 나오기도 함
			if (IsEnable(`featureNuadhaSetitem`) extern (`data/script/features.mint`))
			{
				int iCumRate = 0;							// 확률을 누적해놓는 변수
				int i = 0;									// iterator
				int iRandom = Random(3606);					// 확률의 총합을 적는다.

				int getItem = 0;
		
				while (true)
				{
					bool bBreak = false;
					int rewardItem = 0;
					
					switch (i)
					{
						case(0)	{	rewardItem = 12225;		iCumRate	+=	300;	}		// 마법의 곤봉
						case(1)	{	rewardItem = 12230;		iCumRate	+=	300;	}		// 파리니스
						case(2)	{	rewardItem = 12235;		iCumRate	+=	300;	}		// 마법의 흉갑
						case(3)	{	rewardItem = 12240;		iCumRate	+=	300;	}		// 황금 사과
						case(4)	{	rewardItem = 12245;		iCumRate	+=	300;	}		// 와드네
						case(5)	{	rewardItem = 12250;		iCumRate	+=	300;	}		// 진실의 컵
						case(6)	{	rewardItem = 12260;		iCumRate	+=	300;	}		// 수면의 지팡이
						case(7)	{	rewardItem = 12265;		iCumRate	+=	300;	}		// 파도의 진정
						case(8)	{	rewardItem = 12200;		iCumRate	+=	300;	}		// G12S2 붉은 투창
						case(9)	{	rewardItem = 12205;		iCumRate	+=	300;	}		// G12S2 노란 투창
						case(10)	{	rewardItem = 12210;		iCumRate	+=	300;	}		// G12S2 큰 분노
						case(11)	{	rewardItem = 12220;		iCumRate	+=	300;	}		// G12S2 작은 분노
						case(12)	{	rewardItem = 19081;		iCumRate	+=	1;	}		// 누아자 로브 (남성)
						case(13)	{	rewardItem = 19082;		iCumRate	+=	1;	}		// 누아자 로브 (여성)
						case(14)	{	rewardItem = 16554;		iCumRate	+=	2;	}		// 누아자 건틀렛
						case(15)	{	rewardItem = 17551;		iCumRate	+=	2;	}		// 누아자 플레이트 부츠
			
						default
						{
							bBreak = true;
						}
					}
		
					if (bBreak)
					{
						break;
					}
		
					if (iRandom < iCumRate && getItem == 0) 
					{
						// 일단 보상을 저장
						getItem = rewardItem;
					}
					
					++i;
				}

				if(getItem>1)
				{
					// 실제 보상 지급
					creator.RcvItemWithRewardView(creator, getItem);
				}
			}
			else
			{
				switch(iRan)
				{
					case(0)
					{
						creator.RcvItemWithRewardView(creator, 12225);	// 마법의 곤봉
					}
					case(1)
					{
						creator.RcvItemWithRewardView(creator, 12230);	// 파리니스
					}
					case(2)
					{
						creator.RcvItemWithRewardView(creator, 12235);	// 마법의 흉갑
					}
					case(3)
					{
						creator.RcvItemWithRewardView(creator, 12240);	// 황금 사과
					}
					case(4)
					{
						creator.RcvItemWithRewardView(creator, 12245);	// 와드네
					}
					case(5)
					{
						creator.RcvItemWithRewardView(creator, 12250);	// 진실의 컵
					}
					case(6)
					{
						creator.RcvItemWithRewardView(creator, 12260);	// 수면의 지팡이
					}
					case(7)
					{
						creator.RcvItemWithRewardView(creator, 12265);	// 파도의 진정
					}
					case(8)
					{
						creator.RcvItemWithRewardView(creator, 12200);	// G12S2 붉은 투창
					}
					case(9)
					{
						creator.RcvItemWithRewardView(creator, 12205);	// G12S2 노란 투창
					}
					case(10)
					{
						creator.RcvItemWithRewardView(creator, 12210);	// G12S2 큰 분노
					}
					case(11)
					{
						creator.RcvItemWithRewardView(creator, 12220);	// G12S2 작은 분노
					}
					default
					{
						creator.RcvItemWithRewardView(creator, 12225);	// 마법의 곤봉
					}
				}
			}

			
			// 인연 정보를 추가한다.		
			object_list cCharList = _iz.GetPlayerList();
			int playerCnt = _iz.GetPlayerCount();
			character player;
			int i;
		
			for (i = 0 ; i < playerCnt ; i++)
			{
				player = (character)cCharList.GetValue(i);
				if (player.IsStaticPC() &&
					player.IsPartyMember())
				{
					character other;
					int j;
					
					for (j = 0 ; j < playerCnt ; j++)
					{				
						other = (character)cCharList.GetValue(j);				
						if (player != other &&
							other.IsStaticPC() &&
							player.IsPartyMember(other))
						{
							player.AddRelationEvent(other, 32);
						}
					}
				}
			}

			// 경험치를 주고 각 멤버에게 25%의 확률로 보물을 준다.
			dword Basic_EXP;
			dword Party_Member;

			_iz.GetData(`Basic_EXP`, Basic_EXP);
			_iz.GetData(`Party_Member`, Party_Member);

			int pMember = Party_Member;
			float Exp_Mul = 1 + ((pMember-1)*0.4);
			int GetEXP = Basic_EXP * Exp_Mul / Party_Member;
			
			bool bFromTrap;
			_iz.GetData(`FromTrap`, bFromTrap);

			// 트랩을 안 거치고 바로 온 경우 경험치는 10%만 받는다.
			if(!bFromTrap)
			{
				// DebugOut(`[Falis] 바로 성공했으니 경험치는 10분의 1만 받는다.`);
				GetEXP = GetEXP / 10;
			}

			// DebugOut(`[Falis] 1인당 경험치: `+ToString(GetEXP));

			string sName;
			int iRan2;

			for (i = 0 ; i < playerCnt ; i++)
			{
				player = (character)cCharList.GetValue(i);
				
				// 크리에이터 외의 사람은 20%의 확률로 보물을 얻는다.
				// 크리에이터는 이미 보물을 받았다.
				if(player.GetOriginalName() != creator.GetOriginalName())
				{
					// G12 유물을 8개 중 뭐 줄지 고른다.
					iRan = Random(8);

					// G12S2 이면 4개 추가되서 12개이다.
					if (GetVersion() >= 1202)
					{
						iRan = Random(12);
					}
					iRan2 = Random(100);
					name = player.GetOriginalName();

					// DebugOut(`[Falis] 이름: `+name+` 확률1: `+ToString(iRan)+` 확률2: `+ToString(iRan2));

					// 이 시즌 이후로 누아자 세트 아이템이 나오기도 함
					if (IsEnable(`featureNuadhaSetitem`) extern (`data/script/features.mint`))
					{
						if(iRan2 < 20)
						{

							int iCumRate = 0;							// 확률을 누적해놓는 변수
							int j = 0;									// iterator
							int iRandom = Random(3606);					// 확률의 총합을 적는다.
					
							int getItem = 0;

							while (true)
							{
								bool bBreak = false;
								int rewardItem = 0;
								
								switch (j)
								{
									case(0)	{	rewardItem = 12225;		iCumRate	+=	300;	}		// 마법의 곤봉
									case(1)	{	rewardItem = 12230;		iCumRate	+=	300;	}		// 파리니스
									case(2)	{	rewardItem = 12235;		iCumRate	+=	300;	}		// 마법의 흉갑
									case(3)	{	rewardItem = 12240;		iCumRate	+=	300;	}		// 황금 사과
									case(4)	{	rewardItem = 12245;		iCumRate	+=	300;	}		// 와드네
									case(5)	{	rewardItem = 12250;		iCumRate	+=	300;	}		// 진실의 컵
									case(6)	{	rewardItem = 12260;		iCumRate	+=	300;	}		// 수면의 지팡이
									case(7)	{	rewardItem = 12265;		iCumRate	+=	300;	}		// 파도의 진정
									case(8)	{	rewardItem = 12200;		iCumRate	+=	300;	}		// G12S2 붉은 투창
									case(9)	{	rewardItem = 12205;		iCumRate	+=	300;	}		// G12S2 노란 투창
									case(10)	{	rewardItem = 12210;		iCumRate	+=	300;	}		// G12S2 큰 분노
									case(11)	{	rewardItem = 12220;		iCumRate	+=	300;	}		// G12S2 작은 분노
									case(12)	{	rewardItem = 19081;		iCumRate	+=	1;	}		// 누아자 로브 (남성)
									case(13)	{	rewardItem = 19082;		iCumRate	+=	1;	}		// 누아자 로브 (여성)
									case(14)	{	rewardItem = 16554;		iCumRate	+=	2;	}		// 누아자 건틀렛
									case(15)	{	rewardItem = 17551;		iCumRate	+=	2;	}		// 누아자 플레이트 부츠
						
									default
									{
										bBreak = true;
									}
								}
					
								if (bBreak)
								{
									break;
								}
					
								if (iRandom < iCumRate && getItem == 0) 
								{
									// 일단 보상을 저장
									getItem = rewardItem;
								}
								
								++j;
							}

							if(getItem>1)
							{
								// 실제 보상 지급
								player.RcvItemWithRewardView(player, getItem);
							}
						}
					}
					else
					{
						if(iRan2 < 20)
						{
							// DebugOut(`[Falis] 보물 받는다.`);
							switch(iRan)
							{							
								case(0)	
								{
									player.RcvItemWithRewardView(player, 12225);	// 마법의 곤봉
								}
								case(1)
								{
									player.RcvItemWithRewardView(player, 12230);	// 파리니스
								}
								case(2)
								{
									player.RcvItemWithRewardView(player, 12235);	// 마법의 흉갑
								}
								case(3)
								{
									player.RcvItemWithRewardView(player, 12240);	// 황금 사과
								}
								case(4)
								{
									player.RcvItemWithRewardView(player, 12245);	// 와드네
								}
								case(5)
								{
									player.RcvItemWithRewardView(player, 12250);	// 진실의 컵
								}
								case(6)
								{
									player.RcvItemWithRewardView(player, 12260);	// 수면의 지팡이
								}
								case(7)
								{
									player.RcvItemWithRewardView(player, 12265);	// 파도의 진정
								}
								case(8)
								{
									player.RcvItemWithRewardView(player, 12200);	// G12S2 붉은 투창
								}
								case(9)
								{
									player.RcvItemWithRewardView(player, 12205);	// G12S2 노란 투창
								}
								case(10)
								{
									player.RcvItemWithRewardView(player, 12210);	// G12S2 큰 분노
								}
								case(11)
								{
									player.RcvItemWithRewardView(player, 12220);	// G12S2 작은 분노
								}
								default
								{
									player.RcvItemWithRewardView(player, 12225);	// 마법의 곤봉
								}
							}
						}
					}
				}

				// 경험치를 받는다.
				player.GainExp(GetEXP);
				player.ShowCaption(["event.falias.45"]<<GetEXP);
			}
		}
		else if(name == `FliasRockAttackCheck`)
		{
			// DebugOut(`[팔리아스] 공격 트리거 체크`);
			bool fireTrigger;
			_iz.GetData(`fireTrigger`, fireTrigger);

			if(fireTrigger)
			{
				// DebugOut(`[팔리아스] 공격 명령`);
				int magicType = Random(3);

				// 부유석이 공격하도록 한다.
				character mon;
				_iz.GetData(`FaliasRock1`, mon);

				mon.ShowEffect(`<effect type='Falias_Rock' visible='1' />`);

				_iz.SetTimer(`ShootMagics`, 0, 7000);
			}
			else
			{
				// // DebugOut(`부유석: fireTrigger False`);
				_iz.SetTimer(`FliasRockAttackCheck`, 0, 30000);			
			}		
		}
		else if(name == `ShootMagics`)
		{
			// DebugOut(`[팔리아스] 마법 쏜다.`);
			int magicType = Random(3);

			// 지정된 횟수만큼 공격함.
			character mon;
			_iz.GetData(`FaliasRock1`, mon);

			if(magicType==0)
			{
				// 부유석 파이어볼
				mon.UseSkill(30204);
			}
			else if(magicType==1)
			{
				// 부유석 아이스스피어
				// 아이스 스피어 사용하지 않도록 수정
				// mon.UseSkill(30306);
				mon.UseSkill(30204);
			}
			else if(magicType==2)
			{
				// 부유석 썬더
				mon.UseSkill(30103);
			}

			mon.ShowEffect(`<effect type='Falias_Rock' visible='0' />`);

			_iz.SetTimer(`FliasRockAttackCheck`, 0, 30000);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	2. 사용자 정의 함수
// 
//////////////////////////////////////////////////////////////////////////////////
//	2.1 리전 초기화
//
//	입장한 리더의 조건에 따라 맞는 환경을 조성한다
//	# G12 클리어: 신들의 유물을 인스턴스
//	# G11 최종장 소지: 바로 누아자에게 워프할 수 있는 포탈 생성
//	# 기타: 아무 기능도 하지 않고 황량한 팔리아스 광장
//
server void Initializer(character creator, dword startDelay, zone _iz)
{
	// DebugOut(`[팔리아스] Called Initializer`);

	if(creator.HaveKeyword(`g12_complete`))	// G12 클리어 이후에만 유물을 찾기가 가능하다
	{
		// DebugOut(`[팔리아스] 팔리아스 유물을 인던 초기화`);

		// 이름, x, y, 반경(cm), Tick 간격, duration, OnProcess (tick마다 호출), OnEnter (캐릭터 들어올때), OnLeave (캐릭터 나갈때), OnCharacterProcess (범위 안의 캐릭터들에게 tick 간격 마다), OnDestroy (파괴될때)
		// _iz.AddControlZone(`InvadeZone`, 12861, 40280, 3000, 1000, 0, ``, `OnEnter`, ``, ``, ``);

		////////////////////////////////////////////
		//	던전 관련 파라메터 초기화

		int iRandom;
		int party_cumlevel;

		dword value1 = 0;
		dword value2 = 0;
		dword value3 = 4+Random(2)+Random(3);	// 4 ~ 7
		dword value4 = 10;
		dword value5 = 0;	// 기본 경험치

		////////////////////////////////////////////
		//	스테이지 초기화
		//		0: 시작, 1: 광장 안바르 등장, 2: 안바르 퇴치
		//		3: 트랩 발동, 4: 트랩 몬스터 모두 등장, 5: 트랩 해제 성공, 6: 트랩 실패
		//		8: 유물을 획득, 9: 유물을 실패
		_iz.SetData(`stage`, value1);

		////////////////////////////////////////////
		//	유물을 제단 스테이트
		//		0: 작동 안함, 1: 작동 가능, 2: 성공->유물을 얻음
		//		3: 실패, 4: 트랩 발동, 5: 트랩 성공, 6:트랩 실패
		_iz.SetData(`treasure_state`, value1);

		////////////////////////////////////////////
		//	트랩 실패 시 몬스터 최대 등장 회수 결정
		//		4 ~ 7회
		_iz.SetData(`trap_wave`, value1);

		// dword temp = 1;
		// _iz.SetData(`max_wave`, temp);	// 디버그용 트랩에서 몬스터가 한 번만 나온다.
		_iz.SetData(`max_wave`, value3);
		_iz.SetData(`alert`, value1);

		party_cumlevel = PartyCumLevel(_iz);

		if(party_cumlevel > 10000)
		{
			value2 = 7;
			value4 = 11;
			value5 = 88000;
		}
		else if(party_cumlevel > 5000)
		{
			value2 = 6;
			value4 = 11;
			value5 = 56000;
		}
		else if(party_cumlevel > 3000)
		{
			value2 = 5;
			value4 = 13;
			value5 = 40000;
		}
		else if(party_cumlevel > 2000)
		{
			value2 = 4;
			value4 = 13;
			value5 = 24000;
		}
		else if(party_cumlevel > 1000)
		{
			value2 = 3;
			value4 = 13;
			value5 = 16000;
		}
		else if(party_cumlevel > 500)
		{
			value2 = 2;
			value4 = 15;
			value5 = 8000;
		}
		else
		{
			value2 = 1;
			value4 = 15;
			value5 = 4000;
		}

		_iz.SetData(`stage_level`, value2);				// 입장 한 플레이어들의 강함에 따라 인던 레벨 결정
		_iz.SetData(`prop_count`, value4);				// 트랩 발동 시 프랍 카운트가 0이 되면 트랩 해제 실패
		_iz.SetData(`max_prop_count`, value4);			// 트랩 발동 시 프랍 카운트가 0이 되면 트랩 해제 실패
		_iz.SetData(`Basic_EXP`, value5);				// 트랩 클리어 시 받을 수 있는 기본 경험치

		_iz.SetTimer(`allocmonster`, 0 , startDelay);		// 입장 후 startDelay 지나면 게임 시작
		_iz.SetTimer(`FliasRockAttackCheck`, 0, 30000);		// 팔리아스 부유석 30초 뒤에 공격 체크
		_iz.SetData(`fireTrigger`, false);

		dword aonbarr_count = 0;
		_iz.SetData(`aonbarr_count`, aonbarr_count);

		////////////////////////////////////////////
		//	시작시 스폰되어야할 프랍 & NPC

		// DebugOut(`[팔리아스][유물을] 프랍 설치 시작`);

		// 유물 제단
		// _iz.CreateProp(`treasureAltar`, 42091, 12855, 39795, `single`);
		_iz.CreateProp(`treasureAltar`, 42190, 12855, 39795, `default`);
		prop _propAltar = _iz.FindProp(`treasureAltar`);
		_propAltar.SetColor(0, 0x0F909096);

		// 부유석: 입구부터 반시계방향
		_iz.AllocateMonster(`single(falias_rock:1)`, 12862, 29116);
		_iz.AllocateMonster(`single(falias_rock:1)`, 18017, 31254);
		_iz.AllocateMonster(`single(falias_rock:1)`, 20151, 36410);
		_iz.AllocateMonster(`single(falias_rock:1)`, 18013, 41566);
		_iz.AllocateMonster(`single(falias_rock:1)`, 12858, 43694);
		_iz.AllocateMonster(`single(falias_rock:1)`, 7702, 41562);
		_iz.AllocateMonster(`single(falias_rock:1)`, 5568, 36406);
		_iz.AllocateMonster(`single(falias_rock:1)`, 7706, 31250);

		// 1st 부유석 
		_iz.AddControlZone(`RockInvadeZone`, 12862, 29116, 2500, 500, 0, ``, `FaliasRockUp`, `FaliasRockDown`, ``, ``);

		// 입구 NPC
		_iz.AllocateMonster(`single(falias_gatekeeper:1)`, 12127, 23612);
	}
	else
	{
		// DebugOut(`[팔리아스] 아무것도 없는 팔리아스 초기화`);
		// 아무것도 없는 팔리아스에 들어왔다.

		// 유물을 제단도 없다.

		// 부유석: 입구부터 반시계방향
		_iz.AllocateMonster(`single(falias_rock:1)`, 12861, 28317);
		_iz.AllocateMonster(`single(falias_rock:1)`, 18017, 30454);
		_iz.AllocateMonster(`single(falias_rock:1)`, 20150, 35610);
		_iz.AllocateMonster(`single(falias_rock:1)`, 18012, 40766);
		_iz.AllocateMonster(`single(falias_rock:1)`, 12861, 42894);
		_iz.AllocateMonster(`single(falias_rock:1)`, 7702, 40762);
		_iz.AllocateMonster(`single(falias_rock:1)`, 5567, 35605);
		_iz.AllocateMonster(`single(falias_rock:1)`, 7705, 30450);
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	2.2 메시지 출력 함수
//
//	문자열을 받아 플레이어들에게 메시지를 출력한다.
//	# type 0: 사념파로 메시지를 출력한다
//	# type 1: 메시지박스로 메시지를 출력한다
//
server void MessageDisplay(zone _iz, string message, int type)
{
	// DebugOut(`[팔리아스] Called MessageDisplay: `+message);
	object_list cCharList;
	int playerCnt;
	character player;
	int i;

	cCharList = _iz.GetPlayerList();
	playerCnt = _iz.GetPlayerCount();

	for (i = 0 ; i < playerCnt ; i++)
	{
		player = (character)cCharList.GetValue(i);

		if (type == 0)
		{
			player.ShowCaption(message);
		}
		else
		{
			player.ShowMessageView(message);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	2.3 컷 신 출력
//
//	리전에 있는 모든 사람에게 컷신을 틀어준다
//
server void ShowCutScene(zone _iz, string _name)
{
	// DebugOut(`[팔리아스] Called ShowCutScene: `+_name);
	object_list cCharList;
	int playerCnt;
	character player;
	int i;

	cCharList = _iz.GetPlayerList();
	playerCnt = _iz.GetPlayerCount();


	for (i = 0 ; i < playerCnt ; i++)
	{
		player = (character)cCharList.GetValue(i);
		player.PlayCutScene(_name);
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	2.4 누적 레벨 구하기
//
//	Zone 에 속한 캐릭터들의 누적레벨 합을 구한다
//
server int PartyCumLevel(zone _iz)
{
	// DebugOut(`[팔리아스] Called PartyCumLevel`);
	character creator;		// 생성자
	party	pt;				// 파티
	object_list cCharList;
	int isize;
	character player;
	int i;
	int party_cumlevel;
	dword value;

	creator = _iz.GetCreator();
	pt = creator.GetParty();
	cCharList = pt.GetMemberList();
	isize = pt.GetMemberNo();

	if (pt.IsValid())
	{
		for (i = 0 ; i < isize ; i++)
		{
			player = (character)cCharList.GetValue(i);
			party_cumlevel = party_cumlevel + (player.GetCumLevel() + player.GetLevel());
		}

		value = isize;
	}
	else
	{
		party_cumlevel = creator.GetCumLevel() + creator.GetLevel();
		value = 1;
	}

	
	_iz.SetData(`Party_Member`, value);

	return party_cumlevel;
}

//////////////////////////////////////////////////////////////////////////////////
//	2.5 유물을 제단을 클릭했을 때 호출되는 함수
//
//	애니메이션을 호출한다.
//
server void OnTouchFaliasTreasureAltar(character _char, object _object, string& msg)
{
	string name = _char.GetOriginalName();
	// DebugOut(`[팔리아스] Called OnTouchFaliasTreasureAltar: `+name);

	// 캐릭터가 만든 존을 찾아본다.
	stdapi api;
	zone _iz = api.FindEnterableInstantZone(_char);

	// 예외 코드, 793012 미션에서 사용할때의 처리
	dungeon2 _dungeon = _char.FindDungeon2();
	int missionID = 0;
	if (!_dungeon.IsNull())
	{
		missionID = _dungeon.GetLinkedQuest();
	}

	if (missionID == 793012)
	{
		// DebugOut(`[Falias] 793012 미션에서 프랍 터치했다. 퍼즐 완료해서 다시 넘겨준다.`);
		dungeon2puzzle _puzzle;
		_dungeon.GetData(`TreasurePropPuzzle`, _puzzle);

		bool bTouch;
		_dungeon.GetData(`bTouch`, bTouch);

		if(bTouch)
		{
			// DebugOut(`[Falias] 퍼즐 클리어 후에 여기 온다.`);
			// 퍼즐 클리어 시킨다.
			_puzzle.Complete();
		}
		else
		{
			_char.ShowCaption(["event.falias.26"]);
		}

		return;
	}

	// 존의 적합성을 체크한다.
	// IsValid(): 존이 유효한가?
	// GetPlayerList(): 실제로 존에 있는 멤버 중 한명인가?
	if(_iz.IsValid())
	{
		object_list cCharList;
		int playerCnt;
		int i;
		character player;
		string player_name;

		bool flag = false;

		// 크리에이터인지 확인
		player = _iz.GetCreator();
		player_name = player.GetOriginalName();

		if(name == player_name)
		{
			cCharList = _iz.GetPlayerList();
			playerCnt = _iz.GetPlayerCount();	

			for (i = 0 ; i < playerCnt ; i++)
			{
				player = (character)cCharList.GetValue(i);
				player_name = player.GetOriginalName();

				if(name == player_name)
				{
					flag = true;
				}
			}
		}

		// 펫에 탑승 중이거나 비행 중이면 터치할 수 없다.
		if(player.IsRiding())
		{
			if(player.IsPassenger())
			{
				// 펫이나 자이언트에 타고 있는 상태이다.
				_char.ShowCaption(["event.falias.27"]);
				return;
			}
			else
			{
				// 자이언트로 남을 태우고 있는 상태이다.
				_char.ShowCaption(["event.falias.28"]);
				return;
			}
		}
		else if(player.IsFlying())
		{
			_char.ShowCaption(["event.falias.29"]);
			return;
		}

		// flag가 true이면 터치한 캐릭터가 크리에이터이며, 현재 존에 있다.
		if(flag)
		{

			dword stage;
			dword treasure_state;

			_iz.GetData(`stage`, stage);
			_iz.GetData(`treasure_state`, treasure_state);
			
			if(stage == 2 && treasure_state == 1)
			{
				// DebugOut(`[팔리아스] 생성자가 stage2에 프랍 터치`);

				// 일단 애니메이션을 종족 별로 틀어준다.
				// 일반 자세에서 마법 캐스팅
				_char.PlayAnimation(15,0,true,4000);

				// 고정 확률 
				int success_rate = 15;
				int fail_rate = 5;
				int iRandom = Random(100);

				// DebugOut(`[팔리아스] 성공 확률: `+ToString(success_rate)+`, 실패 확률: `+ToString(fail_rate)+`, 주사위 값: `+ToString(iRandom));

				if(iRandom < success_rate)
				{
					// 유물을 획득 성공
					stage = 8;
					treasure_state = 2;

					_iz.SetData(`stage`, stage);
					_iz.SetData(`treasure_state`, treasure_state);
					_iz.SetData(`FromTrap`, false);

					_iz.SetTimer(`treasure_success`, 0 , 4000);
				}
				else if(iRandom < success_rate + fail_rate)
				{
					// 유물을 획득 실패
					stage = 9;
					treasure_state = 3;

					_iz.SetData(`stage`, stage);
					_iz.SetData(`treasure_state`, treasure_state);

					_iz.SetTimer(`treasure_fail`, 0 , 4000);
				}
				else
				{
					// 트랩 발동
					stage = 3;
					treasure_state = 4;

					_iz.SetData(`stage`, stage);
					_iz.SetData(`treasure_state`, treasure_state);

					_iz.SetTimer(`treasure_surprise`, 0 , 4000);
				}
				
			}
			else if(stage == 5 && treasure_state == 5)
			{
				// DebugOut(`[팔리아스] 생성자가 트랩 성공 후 프랍 터치`);
				_char.PlayAnimation(15,0,true,4000);

				// 트랩을 클리어 한 후에는 100% 유물을 얻는다.
				{
					stage = 8;
					treasure_state = 2;

					_iz.SetData(`stage`, stage);
					_iz.SetData(`treasure_state`, treasure_state);
					_iz.SetData(`FromTrap`, true);

					_iz.SetTimer(`treasure_success`, 0 , 4000);
				}				
			}
			else
			{
				// 제단을 클릭해도 아무런 반응이 없다.
				// MessageDisplay(_iz, `아무런 반응이 없다.`, 0);
				if(stage == 0 || stage == 1)
				{
					_char.ShowCaption(["event.falias.30"]);
				}
				else if(stage == 3 || stage == 4)
				{
					_char.ShowCaption(["event.falias.31"]);
				}
				else if(stage == 6)
				{
					_char.ShowCaption(["event.falias.32"]);
				}
				else if(stage == 9)
				{
					_char.ShowCaption(["event.falias.33"]);
				}
				else	// 여기 오면 안되는데 예외로 만들어준다.
				{
					_char.ShowCaption(["event.falias.34"]);
				}
			}
		}
		else
		{
			// 제단을 클릭해도 아무런 반응이 없다.
			_char.ShowCaption(["event.falias.35"]);
			// MessageDisplay(_iz, `아무런 반응이 없다.`, 0);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
//	3. 데이타 관련 함수
// 
//////////////////////////////////////////////////////////////////////////////////
//	3.1 몬스터 스폰
//		초기 안바르 배치
//		트랩 발동 시 컨트롤 존 설치
//		트랩에서 각 웨이브마다 몬스터 수 결정
server bool monsterspawn(zone _iz)
{
	// DebugOut(`[팔리아스] Called monsterspawn`);
	dword stage;
	dword state_level;
	dword treasure_state;
	dword trap_wave;
	dword max_wave;

	string monsterName;
	string monsterName1;
	string monsterName2;
	string monsterName3;
	string monsterName4;
	
	_iz.GetData(`stage`, stage);
	_iz.GetData(`stage_level`, state_level);
	_iz.GetData(`treasure_state`, treasure_state);

	_iz.GetData(`trap_wave`, trap_wave);
	_iz.GetData(`max_wave`, max_wave);

	if(stage == 1)			// 광장에 안바르를 스폰한다
	{
		// DebugOut(`[팔리아스] stage: 1, 안바르 소환`);
		_iz.AllocateMonster(`single(aonbarr_keeper:1)`, 12741, 27350);
		_iz.AllocateMonster(`single(aonbarr_keeper:1)`, 14338, 28013);
		_iz.AllocateMonster(`single(aonbarr_keeper:1)`, 14160, 30249);
		_iz.AllocateMonster(`single(aonbarr_keeper:1)`, 11712, 30883);
		_iz.AllocateMonster(`single(aonbarr_keeper:1)`, 15232, 27983);

		dword aonbarr_count = 5;
		_iz.SetData(`aonbarr_count`, aonbarr_count);
	}
	else if(stage == 3)		// 트랩 발동 후 몬스터 웨이브 소환
	{
		// 트랩 처음 발동 시 컨트롤 존 설치
		if(trap_wave == 0)
		{
			// DebugOut(`[팔리아스] Add Control_zone`);
			// 이름, x, y, 반경(cm), Tick 간격, duration, OnProcess (tick마다 호출), OnEnter (캐릭터 들어올때), OnLeave (캐릭터 나갈때), OnCharacterProcess (범위 안의 캐릭터들에게 tick 간격 마다), OnDestroy (파괴될때)
			// r:35001 x:12859 y:40223
			_iz.AddControlZone(`InvadeZone`, 12861, 40280, 1500, 1000, 0, ``, `OnEnter`, ``, ``, ``);
		}

		if(trap_wave < max_wave)
		{
			trap_wave = trap_wave + 1;
			_iz.SetData(`trap_wave`, trap_wave);

			int iRan = Random(4);

			int var1 = 0;
			int var2 = 0;
			int var3 = 0;

			dword aonbarr_count = 0;

			// 등장하는 몬스터 수 결정
			switch(trap_wave)
			{
				case(1)
				{
					var1 = 1+Random(3);	// 1 ~ 3
					var2 = 0+Random(3);	// 0 ~ 2
					var3 = 1+Random(2);	// 1 ~ 2

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var3);	// 1~3/1~2	 = > 2~5
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 0~2/1~3	 = > 1~5
					monsterName3 = `single(aonbarr_trap5:`+ToString(var1)+`, aonbarr_trap6:`+ToString(var3);	// 1~3/1~2	 = > 2~5
					monsterName4 = `single(aonbarr_trap7:`+ToString(var2)+`, aonbarr_trap8:`+ToString(var1);	// 0~2/1~3	 = > 1~5

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 2) + (var3 * 2);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(2)
				{
					var1 = 1+Random(3);	// 1 ~ 3
					var2 = 0+Random(3);	// 0 ~ 2
					var3 = 1+Random(2);	// 1 ~ 2

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var3);	// 1~3/1~2	 = > 2~5
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 0~2/1~3	 = > 1~5
					monsterName3 = `single(aonbarr_trap5:`+ToString(var1)+`, aonbarr_trap6:`+ToString(var3);	// 1~3/1~2	 = > 2~5
					monsterName4 = `single(aonbarr_trap7:`+ToString(var2)+`, aonbarr_trap8:`+ToString(var1);	// 0~2/1~3	 = > 1~5

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 2) + (var3 * 2);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(3)
				{
					var1 = 1+Random(3);	// 1 ~ 3
					var2 = 1+Random(2);	// 1 ~ 2

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 1~3/1~2	 = > 2~5
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 1~2/1~3	 = > 2~5
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 1~2/1~3	 = > 2~5
					monsterName4 = `single(aonbarr_trap7:`+ToString(var1)+`, aonbarr_trap8:`+ToString(var2);	// 1~3/1~2	 = > 2~5

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(4)
				{
					var1 = 1+Random(3);	// 1 ~ 3
					var2 = 2+Random(2);	// 2 ~ 3

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 1~3/2~3	 = > 3~6
					monsterName2 = `single(aonbarr_trap3:`+ToString(var1)+`, aonbarr_trap4:`+ToString(var2);	// 1~3/2~3	 = > 3~6
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 2~3/1~3	 = > 3~6
					monsterName4 = `single(aonbarr_trap7:`+ToString(var2)+`, aonbarr_trap8:`+ToString(var1);	// 2~3/1~3	 = > 3~6

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(5)
				{
					var1 = 1+Random(3);	// 1 ~ 3
					var2 = 2+Random(2);	// 2 ~ 3

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 1~3/2~3	 = > 3~6
					monsterName2 = `single(aonbarr_trap3:`+ToString(var1)+`, aonbarr_trap4:`+ToString(var2);	// 1~3/2~3	 = > 3~6
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 2~3/1~3	 = > 3~6
					monsterName4 = `single(aonbarr_trap7:`+ToString(var2)+`, aonbarr_trap8:`+ToString(var1);	// 2~3/1~3	 = > 3~6

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(6)
				{
					var1 = 2+Random(3);	// 2 ~ 4
					var2 = 2+Random(2);	// 2 ~ 3

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 2~4/2~3	 = > 4~7
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName4 = `single(aonbarr_trap7:`+ToString(var1)+`, aonbarr_trap8:`+ToString(var2);	// 2~4/2~3	 = > 4~7

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				case(7)
				{
					var1 = 2+Random(3);	// 2 ~ 4
					var2 = 2+Random(2);	// 2 ~ 3

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 2~4/2~3	 = > 4~7
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName4 = `single(aonbarr_trap7:`+ToString(var1)+`, aonbarr_trap8:`+ToString(var2);	// 2~4/2~3	 = > 4~7

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
				default
				{
					var1 = 2+Random(3);	// 2 ~ 4
					var2 = 2+Random(2);	// 2 ~ 3

					monsterName1 = `single(aonbarr_trap1:`+ToString(var1)+`, aonbarr_trap2:`+ToString(var2);	// 2~4/2~3	 = > 4~7
					monsterName2 = `single(aonbarr_trap3:`+ToString(var2)+`, aonbarr_trap4:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName3 = `single(aonbarr_trap5:`+ToString(var2)+`, aonbarr_trap6:`+ToString(var1);	// 2~3/2~4	 = > 4~7
					monsterName4 = `single(aonbarr_trap7:`+ToString(var1)+`, aonbarr_trap8:`+ToString(var2);	// 2~4/2~3	 = > 4~7

					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count + (var1 * 4) + (var2 * 4);
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}
			}

			_iz.AllocateMonster(monsterName1, `Falias_main_field_2`, `monster_spawn_1`);
			_iz.AllocateMonster(monsterName2, `Falias_main_field_2`, `monster_spawn_2`);
			_iz.AllocateMonster(monsterName3, `Falias_main_field_2`, `monster_spawn_2`);
			_iz.AllocateMonster(monsterName4, `Falias_main_field_2`, `monster_spawn_3`);

			if(trap_wave < max_wave)
			{
				// 다음 몬스터 웨이브 소환을 예약한다.
				// 45초마다 스폰된다.
				_iz.SetTimer(`trap_start`, 0 , 45000);
			}
			else
			{
				// DebugOut(`[팔리아스] Stage 3 -> 4`);
				// 모든 몬스터가 다 나왔다.
				stage = 4;
				_iz.SetData(`stage`, stage);
			}
		}
	}

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
//	3.2 컨트롤 존
//		컨트롤 존에 안바르가 들어올 때마다 카운트
server void OnEnter(zone _iz, string _propName, int _time, character _invader)
{
	dword stage;
	_iz.GetData(`stage`, stage);

	string name = _invader.GetRaceName();
	string indexname = name.Left(7);

	// DebugOut(`[팔리아스] Called OnEnter: `+name);

	// 트랩 진행 중
	if(stage == 3 || stage == 4)
	{
		// 안바르가 컨트롤 존에 들어왔다.
		if(indexname == `aonbarr`)
		{
			if(_iz.DeallocateMonster(_invader))
			{
				dword aonbarr_count = 0;

				if(indexname == `aonbarr`)		// 스테이지 진행 상황에 따라 몬스터 스탯 조정
				{
					// DebugOut(`[팔리아스] 안바르 죽고 카운트 감소`);
					_iz.GetData(`aonbarr_count`, aonbarr_count);
					aonbarr_count = aonbarr_count - 1;

					if(aonbarr_count < 0)	{	aonbarr_count = 0;	}
					_iz.SetData(`aonbarr_count`, aonbarr_count);
				}

				dword prop_count;
				_iz.GetData(`prop_count`, prop_count);	

				prop_count = prop_count - 1;
				_iz.SetData(`prop_count`, prop_count);

				int iPropCount = prop_count + 0;

				_iz.ChangeInformation(`Notice2`, ["event.falias.36"]+ToString(iPropCount));

				_iz.GetData(`aonbarr_count`, aonbarr_count);

				// DebugOut(`[팔리아스] stage: `+ToString(stage)+`, 남은 몬스터 수: `+ToString(aonbarr_count));

				// 마지막 남은 안바르가 죽는 것이 아니고 강제로 없앨을 경우에는 여기서 클리어 시켜준다.
				_iz.GetData(`aonbarr_count`, aonbarr_count);

				if(stage == 4 && prop_count > 0 && aonbarr_count == 0)
				{
					// DebugOut(`[팔리아스] 트랩 클리어 (stage 4->5)`);
					stage = 5;
					dword treasure_state = 5;

					_iz.SetData(`treasure_state`, treasure_state);
					_iz.SetData(`stage`, stage);

					MessageDisplay(_iz, ["event.falias.37"], 0);

					_iz.ChangeInformation(`Notice1`, ["event.falias.38"]);
					_iz.ChangeInformation(`Notice2`, ["event.falias.39"]);
				}
				else if(prop_count == 0)		// 실패
				{
					// DebugOut(`[팔리아스] 트랩 실패 (stage 4->6)`);

					// 트랩 실패 상태로 스테이트 변경
					stage = 6;
					dword treasure_state = 6;

					dword trap_wave;
					dword max_wave;

					_iz.SetData(`stage`, stage);
					_iz.SetData(`treasure_state`, treasure_state);

					_iz.GetData(`trap_wave`, trap_wave);
					_iz.GetData(`max_wave`, max_wave);

					trap_wave = max_wave + 1;
					_iz.SetData(`trap_wave`, trap_wave);

					// 5초 뒤 안바르를 모두 사라지게 한다.
					_iz.SetTimer(`trap_falied`, 0 , 5000);

					_iz.ChangeInformation(`Notice1`, ["event.falias.40"]);
					_iz.ChangeInformation(`Notice2`, ``);

					MessageDisplay(_iz, ["event.falias.41"], 0);
				}
				else if(prop_count == 3)	// 위급
				{
					MessageDisplay(_iz, ["event.falias.42"], 0);
				}
				else if(prop_count == 7)	// 경고
				{
					MessageDisplay(_iz, ["event.falias.43"], 0);
				}
				else if(prop_count == 10)	// 알림
				{
					MessageDisplay(_iz, ["event.falias.44"], 0);
				}
			}
		}
	}
}

server void FaliasRockUp(zone _iz, string _propName, int _time, character _invader)
{
	string name = _invader.GetRaceName();
	string indexname = name.Left(7);

	 if(!(indexname == `aonbarr`))
	 {
		// DebugOut(`[팔리아스] 부유석 근처에 입장`);
		character cChar;
		_iz.GetData(`FaliasRock1`, cChar);
		cChar.AddConditionWithMeta(117, `500|1000`);
		_iz.SetData(`fireTrigger`, true);
	 }
}

server void FaliasRockDown(zone _iz, string _propName, int _time, character _invader)
{
	string name = _invader.GetRaceName();
	string indexname = name.Left(7);

	 if(!(indexname == `aonbarr`))
	 {
		bool	bInRange = false;

		// 일단 플레이어만 체크
		float	fPosX = 12862 / 100;
		float	fPosY = 29116 / 100;
		float	fPlayerPosX;
		float	fPlayerPosY;
		float	fDistance;
		int	iDistance;

		object_list cCharList = _iz.GetPlayerList();
		dword PlayerCnt = _iz.GetPlayerCount();
		character cChar;
		character cPet;
		int	i;
			
		// DebugOut(`[팔리아스] InRagne Check`);
		for (i = 0 ; i< PlayerCnt; i++)
		{
			// 캐릭터 거리 체크
			cChar = (character)cCharList.GetValue(i);

			fPlayerPosX = cChar.GetPositionX() / 100;
			fPlayerPosY = cChar.GetPositionY() / 100;

			fDistance = ((fPlayerPosX-fPosX)*(fPlayerPosX-fPosX)) + ((fPlayerPosY-fPosY)*(fPlayerPosY-fPosY));

			if(fDistance <= 400)
			{
				iDistance = fDistance * 1;
				// DebugOut(`[팔리아스] Character InRagne Ture: `+ToString(iDistance));
				bInRange = true;
			}

			// 펫 소환했으면 펫도 체크하자.
			if(cChar.HasSummonedPet())
			{
				// DebugOut(`[팔리아스] Character Summon Pet`);
				cPet = cChar.SummonedPet();

				fPlayerPosX = cPet.GetPositionX() / 100;
				fPlayerPosY = cPet.GetPositionY() / 100;

				fDistance = ((fPlayerPosX-fPosX)*(fPlayerPosX-fPosX)) + ((fPlayerPosY-fPosY)*(fPlayerPosY-fPosY));

				if(fDistance <= 400)
				{
					iDistance = fDistance * 1;
					// DebugOut(`[팔리아스] Character InRagne Ture: `+ToString(iDistance));
					bInRange = true;
				}
			}
		}

		// 거리 내에 아무도 없으면
		if(!bInRange)
		{
			// DebugOut(`[팔리아스] Attack Prop Disable`);
			_iz.SetData(`fireTrigger`, false);

			_iz.GetData(`FaliasRock1`, cChar);
			cChar.RemoveCondition(117);
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
//	99. 기타 알아두면 좋은 것
//
////////////////////////////////////////////////////////////////////////////////////
//	# 좌표 리스트
//	캐릭터 스폰(스폰포인트): player_enter
//	되돌아가는 포탈: r:500 x:11640 y:22779	dir:1.454
//	NPC: r:500 x:12127 y:23612 dir:-1.897
//
//	부유석: (입구부터 반시계방향)
//		r:500 x:12862 y:29116
//		r:500 x:18017 y:31254
//		r:500 x:20151 y:36410
//		r:500 x:18013 y:41566
//		r:500 x:12858 y:43694
//		r:500 x:7702 y:41562
//		r:500 x:5568 y:36406
//		r:500 x:7706 y:31250
//
//	유물을 제단:
//		r:500 x:12855 y:39795
//
//	# 몬스터 등장
//	안바르 1차 등장 (광장)
//		r:35001 x:12741 y:27350
//		r:35001 x:14338 y:28013
//		r:35001 x:14160 y:30249
//		r:35001 x:11712 y:30883
//		r:35001 x:15232 y:27983
//
//	안바르 트랩 발동 / 스폰포인트
//		monster_spawn_1
//		monster_spawn_2
//		monster_spawn_3
//
//	컨트롤 존 좌표
//		r:500 x:11767 y:40105
//		r:500 x:12906 y:41799
//		r:500 x:13891 y:40100


