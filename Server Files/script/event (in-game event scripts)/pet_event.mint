//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project PC Script
//                                                                         PC/더미
//
//                                            marlin fecit, begins at 2003. 11. 12
//                                                            marlin22@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

// 주의 : 이 스크립트들은 현재 로그인한 펫에 대해서만 호출된다.
//      : 즉, 소환된 펫에 대해서는 불리지 않는다는 의미

//////////////////////////////////////////////////////////////////////////////////
server void PrepareEnterWorld(character me)
// : PC가 월드에 접속하려고 할 때 불리는 함수이다.
// : 이곳에서 반드시 캐릭터를 어디론가 진입시켜줘야 한다. (나오리전? 혹은 디폴트 리전)
//////////////////////////////////////////////////////////////////////////////////
{

	if (me.IsFirstLogin())
	{
		// 이 캐릭터가 생성된 이후 처음 게임 서버에 로드되었다
		// 펫은 그냥 월드에 들어간다.
		me.EnterWorld();
	}
	else
	{
		// 게임에 전에도 로그인 한 적이 잇다.
		if (me.IsReadyToRebirth())
		{
			// 환생을 위해 로그인 한 것이다. 나오한테 보내자.
			me.EnterEventRegion(1000, 0, 0, `_tin_rebirth`);
		}
		else
		{
			// 일반적인 로그인
			me.EnterWorld();
		}
	}
}


//////////////////////////////////////////////////////////////////////////////////
server void OnLogin(character me)
//펫으로 로그인 했을 때 불리는 함수.
//////////////////////////////////////////////////////////////////////////////////
{
	// 하고 싶은 것을 하시오
	// 2010 광복절 이벤트 - 펫으로 처음 로그인 했을 때도 줘야 한다.
	if (IsCurrentEvent(`liberationday2010_2_korea`))
	{
		// 모든 처리를 코드에서 한다.
		// 52143 - 메타 저장용 아이템 사용
		if(GetLocale().LowerCase()==`korea`)
		{
			me.LiberationDay2010();
		}
		else if(GetLocale().LowerCase()==`usa` && GetYear() == 2010)
		{
			me.LiberationDay2010_USA(2010,8,15);
		}
	}
}



//////////////////////////////////////////////////////////////////////////////////
server void OnSummoned(character me, character master)
//펫이 소환되었을 때 불리는 함수.
//////////////////////////////////////////////////////////////////////////////////
{
	// 물개를 소환하면 하루에 한 번 가이드 사념파가 나온다.
	// getracename이나 CheckFastStringID 로 대상을 구분할 것

	if(master.IsEnableDeed(23) && me.CheckFastStringID(`/seal/`))
	{
		master.ShowCaption(["event.pet_event.1"],5000);
		master.DoneDeed(23);
	}
	if (IsEnable(`featurePetDragon`) extern (`data/script/features.mint`)) //한국 G12S2 이후 드래곤 펫 투입
	{
		if (me.CheckFastStringID(`/pet/dragon/`))
		{
			if (me.IsFirstQuery(`PlayDragonCutscene`))
			{
				if (master.IsGiant())
				{
					master.PlayCutScene(`pet_dragon_giant`);
				}
				else
				{
					master.PlayCutScene(`pet_dragon`);
				}			
			}
			else
			{	
				if (me.CheckFastStringID(`/pet/dragon/lightning_dragon/`))
				{
					me.UseSkill(50136);
				}
				if (me.CheckFastStringID(`/pet/dragon/fire_dragon/`))
				{
					me.UseSkill(50139);
				}
			}
		}
	}
}