//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2007. 01. 16
//                                                             nicolas@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi


////////////////////////////////////////////////////////////////////////////////
server bool ProcessGetItem(
	character pet,
	character master,
	item cItem,
	float pet_height,
	int item_gauge)
// : 
////////////////////////////////////////////////////////////////////////////////
{
	if (pet.CheckFastStringID(`/goldpig/`))
	{
		if (cItem.GetClassId() == 2000)
		{
			Process_GoldPig(pet, master, cItem, pet_height, item_gauge);
			return true;
		}
		else if (IsDevelopment())
		{
			if (cItem.GetClassId() == 90005)
			{
				// 무조건 터지는 테스트용 아이템 - 주보크 소드
				Process_GoldPig_Explode(pet, master, pet_height);
				return true;
			}
			else if (cItem.GetClassId() == 50274)
				// 먹으면 무조건 10씩 크는 테스트용 아이템 - 마법 두부
			{
				Process_GoldPig_Grow(pet, master, pet_height, item_gauge, 10.0);
				return true;
			}
			else if (cItem.GetClassId() == 50040)
			{
				// 먹으면 배부름이 초기화되는 아이템 - 마법 콩
				pet.SetItemGetGauge(0);
				master.ShowCaption(["event.item_grow_pet_event.1"]);
				return true;
			}
		}
	}

	return false;		
}

////////////////////////////////////////////////////////////////////////////////
server void OnUpdateTick(
	character pet,
	character master,
	int item_gauge)
// : 5분마다 불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	if (pet.CheckFastStringID(`/goldpig/`))
	{
		OnUpdateTick_GoldPig(pet, master, item_gauge);
	}
}



////////////////////////////////////////////////////////////////////////////////
server void ProcessDropItem(
	character pet,
	character master,
	int itemid,
	int min,
	int max)
// : 황금 돼지가 터져서 아이템을 떨어뜨림
////////////////////////////////////////////////////////////////////////////////
{
	int count = Random(min, max);
	itemclass cItemcls = GetItemClass(itemid);
	int bundlemax = cItemcls.GetBundleMax();

	while (count > bundlemax)
	{
		if (pet.GenerateAndDropItem(`id:` + ToString(itemid) + ` count:` + ToString(bundlemax), master))
		{
			count = count - bundlemax;			
		}
		else
		{
			if (IsDevelopment())
			{
				master.ShowCaption(`id:` + ToString(itemid) + ` count:` + ToString(bundlemax) + ["event.item_grow_pet_event.2"]);
			}
			else
			{
				master.ShowCaption(["event.item_grow_pet_event.11"]);
			}
			break;
		}
	}

	if (pet.GenerateAndDropItem(`id:` + ToString(itemid) + ` count:` + ToString(count), master)) {}
	else
	{
		if (IsDevelopment())
		{
			master.ShowCaption(`id:` + ToString(itemid) + ` count:` + ToString(count) + ["event.item_grow_pet_event.3"]);
		}
		else
		{
			master.ShowCaption(["event.item_grow_pet_event.12"]);
		}
	}
}



////////////////////////////////////////////////////////////////////////////////
// 황금 돼지 관련 함수
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
server void OnUpdateTick_GoldPig(
	character pet,
	character master,
	int item_gauge)
// : 5분마다 불리는 함수 - 황금돼지
////////////////////////////////////////////////////////////////////////////////
{
	int gauge = 0;

	if (Random(100) < 100)
	{
		if (item_gauge < 10)
		{
			gauge = 0;
		}
		else
		{
			gauge = item_gauge - 10;
		}
		pet.SetItemGetGauge(gauge);

		if (IsDevelopment())
		{
			master.ShowCaption(["event.item_grow_pet_event.4"]+ ToString(gauge));
		}
		else
		{
			master.ShowCaption(["event.item_grow_pet_event.5"]);
		}
	}		
}


////////////////////////////////////////////////////////////////////////////////
server void Process_GoldPig(
	character pet,
	character master,
	item cItem,
	float pet_height,
	int item_gauge)
// : 
////////////////////////////////////////////////////////////////////////////////
{
	if (item_gauge >= 100)
	{
		master.ShowCaption(["event.item_grow_pet_event.6"]);
		return;
	}

	int dwProb = 0;
	int count = cItem.GetBundleCount();
	if (count < 100)
	{
		dwProb = 0;
	}
	else
	{
		dwProb = 50 + (5 * (count / 100 - 1));
	}

	if (Random(100) < dwProb)
	{
		// 커지기 성공
		int dwAge = pet.GetAge();
		if (dwAge > 25) dwAge = 25;

		if (pet_height >= 140.0 || Random(100) < dwAge * 5)
		{
			// 터져버렸다.
			Process_GoldPig_Explode(pet, master, pet_height);
		}
		else
		{
			// 안 터지고 커졌다.
			Process_GoldPig_Grow(pet, master, pet_height, item_gauge, 1);
		}
	}
	else
	{
		// 커지기 실패
		master.ShowCaption(["event.item_grow_pet_event.7"]);
	}
}

////////////////////////////////////////////////////////////////////////////////
server void Process_GoldPig_Explode(
	character pet,
	character master,
	float pet_height)
// : 
////////////////////////////////////////////////////////////////////////////////
{
	DropItem_GoldPig(pet, master, pet_height);

	pet.SetItemGetGauge(100);

	pet.ShowEffect(`<effect type='pet_Goldpig_boom' />`);

	pet.SetFoodGrowHeight(0.0);
}

////////////////////////////////////////////////////////////////////////////////
server void Process_GoldPig_Grow(
	character pet,
	character master,
	float pet_height,
	int item_gauge,
	float pet_increase_point)
// : 
////////////////////////////////////////////////////////////////////////////////
{
	pet_height += (0.7 * pet_increase_point);
	if (pet_height > 140.0) pet_height = 140.0;

	pet.SetFoodGrowHeight(pet_height);

	int gauge = item_gauge + (int)pet_increase_point;
	if (gauge >= 100)
	{
		gauge = 100;
	}
	pet.SetItemGetGauge(gauge);

	if (IsDevelopment())
	{
		master.ShowCaption(["event.item_grow_pet_event.8"]+ ToString(gauge) + ["event.item_grow_pet_event.9"]+ ToString(pet_height / 0.7));
	}
	else
	{
		master.ShowCaption(["event.item_grow_pet_event.10"]);
	}

}



////////////////////////////////////////////////////////////////////////////////
server void DropItem_GoldPig(
	character pet,
	character master,
	float pet_height_original)
// : 황금 돼지가 터져서 아이템을 떨어뜨림
////////////////////////////////////////////////////////////////////////////////
{
	float pet_height = pet_height_original / 0.7;

	if (pet_height < 1.0)		// 0.0 ~ 0.0
	{
		ProcessDropItem(pet, master, 2000, 10, 50);
	}

	if (pet_height >= 1.0 && pet_height < 5.0)		// 1.0 ~ 4.0 : 이 구간은 터지면 손해이며 금화만 나온다.
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(10);	//확률의 총합을 적는다

		while(true)
		{
			int factor = (int)pet_height;
			bool bBreak = false;
			meta_array itemArray, minArray, maxArray;
			int itemid, min, max;
			switch(i) 
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 확률은 여기에서 기술
				case(0){ iCumRate += 10;}

				// 여기다 넣으세요의 끝
				default
				{
					bBreak = true;
				}
			}

			if (iRandom < iCumRate) 
			{
				switch(i)
				{
					// 주는 아이템은 여기에서 기술
					case (0)
					{
						itemArray.Add(2000);	minArray.Add(100*factor);		maxArray.Add(200*factor);
					}
				}

				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemid = (int)itemArray.Get(j);
					min = (int)minArray.Get(j);
					max = (int)maxArray.Get(j);
					ProcessDropItem(pet, master, itemid, min, max);
				}
				return;
			}
			
			++i;
		}
		// 실패했을 때의 처리
		ProcessDropItem(pet, master, 2000, 10, 100);
	}

	if (pet_height >= 5.0 && pet_height < 20.0)		// 5.0 ~ 20.0 : 이 구간은 손해가 될 수도 있고 이익이 날 수도 있다.
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(30);	//확률의 총합을 적는다

		while(true)
		{
			int factor = (int)pet_height;
			bool bBreak = false;
			meta_array itemArray, minArray, maxArray;
			int itemid, min, max;
			switch(i) 
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 확률은 여기에서 기술
				case(0){ iCumRate += 10;}
				case(1){ iCumRate += 10;}
				case(2){ iCumRate += 10;}

				// 여기다 넣으세요의 끝
				default
				{
					bBreak = true;
				}
			}

			if (iRandom < iCumRate) 
			{
				switch(i)
				{
					// 주는 아이템은 여기에서 기술
					// 주의 : meta_array에는 int만 들어갑니다!!!
					case (0)
					{
						itemArray.Add(2000);	minArray.Add(140*factor);		maxArray.Add(260*factor);
					}
					case (1)
					{
						// 반 내림이므로 소수를 사용할 경우 1을 플러스해주자.
						itemArray.Add(64007);	minArray.Add((int)(1+0*factor));	maxArray.Add((int)(1+0.1*factor));
					}
					case (2)
					{
						// 반 내림이므로 소수를 사용할 경우 1을 플러스해주자.
						itemArray.Add(64008);	minArray.Add((int)(1+0*factor));	maxArray.Add((int)(1+0.2*factor));
					}
				}

				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemid = (int)itemArray.Get(j);
					min = (int)minArray.Get(j);
					max = (int)maxArray.Get(j);
					ProcessDropItem(pet, master, itemid, min, max);
				}
				return;
			}
			
			++i;
		}
		// 실패했을 때의 처리
		ProcessDropItem(pet, master, 2000, 10, 100);
	}

	if (pet_height >= 20.0 && pet_height <= 200.0)		// 20.0 ~ 200.0 : 손해보다 이익이 많이 발생하는 구간이다.
	{
		int iCumRate = 0; //확률을 누적해놓는 변수
		int i=0;
		int iRandom = Random(30);	//확률의 총합을 적는다

		while(true)
		{
			int factor = (int)pet_height;
			bool bBreak = false;
			meta_array itemArray, minArray, maxArray;
			int itemid, min, max;
			switch(i) 
			//i값을 하나씩 늘려가면서 case로 구현된 리스트의 아이템의 확률과 비교한다
			{
				// 확률은 여기에서 기술
				case(0){ iCumRate += 10;}
				case(1){ iCumRate += 10;}
				case(2){ iCumRate += 10;}

				// 여기다 넣으세요의 끝
				default
				{
					bBreak = true;
				}
			}

			if (iRandom < iCumRate) 
			{
				switch(i)
				{
					// 주는 아이템은 여기에서 기술
					// 주의 : meta_array에는 int만 들어갑니다!!!
					case (0)
					{
						itemArray.Add(2000);	minArray.Add(180*factor);	maxArray.Add(280*factor);
					}
					case (1)
					{
						// 20이상이 곱해지므로 최소 0.05를 곱하면 1은 나온다. 크기에 반응하면 좋으므로 최소치를 1로 고정하지 않는다.
						itemArray.Add(64007);	minArray.Add((int)(0.05*factor));	maxArray.Add((int)(0.1*factor));
					}
					case (2)
					{
						// 20이상이 곱해지므로 최소 0.05를 곱하면 1은 나온다. 크기에 반응하면 좋으므로 최소치를 1로 고정하지 않는다.
						itemArray.Add(64008);	minArray.Add((int)(0.05*factor));	maxArray.Add((int)(0.2*factor));
					}
				}

				int j = 0;
				for (j = 0; j < itemArray.GetSize(); ++j)
				{
					itemid = (int)itemArray.Get(j);
					min = (int)minArray.Get(j);
					max = (int)maxArray.Get(j);
					ProcessDropItem(pet, master, itemid, min, max);
				}
				return;
			}
			
			++i;
		}
		// 실패했을 때의 처리
		ProcessDropItem(pet, master, 2000, 10, 100);
	}


}
