//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     아이템 사용시의 이벤트 함수
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi
////////////////////////////////////////////////////////////////////////////////
server bool IsUsableScriptItem(
	character player,
	item cItem)
// : 아이템 사용 여부를 결정한다.
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();
	int itembc = cItem.GetBundleCount(); // 번들넘버

	object_list cItemList;
	cItemList = player.GetItemList(1584);
	item cItem2;
	cItem2 = (item)cItemList.GetValue(0);

	if (itembc == 9)
	{
		if((player.GetItemNoWithClassId (51088)>0) && player.GetItemNoWithClassId (51089)>0 && player.GetItemNoWithClassId (51090)>0 && player.GetItemNoWithClassId (51091)>0 && player.GetItemNoWithClassId (51092)>0 && player.GetItemNoWithClassId (51093)>0 && player.GetItemNoWithClassId (51094)>0 && player.GetItemNoWithClassId (51095)>0 && player.GetItemNoWithClassId (51096)>0)
		{
			player.ShowCaption(["event.item.item51097.1"], 100);
			return false;
		}
		else if(cItem2.IsCollected(0) && cItem2.IsCollected(1) && cItem2.IsCollected(2) && cItem2.IsCollected(3) && cItem2.IsCollected(4) && cItem2.IsCollected(5) && cItem2.IsCollected(6) && cItem2.IsCollected(7) && cItem2.IsCollected(8))
		{
			player.ShowCaption(["event.item.item51097.1"], 100);
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		player.ShowCaption(["event.item.item51097.2"], 100);
		return false;
	}
}
////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : 아이템에 아무 기능이 없으나
//   isusable이고 stringid가 '/script/'를 포함하고 있는 아이템을 사용했을 때
//   불리는 함수
////////////////////////////////////////////////////////////////////////////////
{
	int iCumRate = 0; //확률을 누적해놓는 변수
	int i=0;
	int iRandom = Random(100);	//확률의 총합을 적는다
	int itemID = cItem.GetClassId();
	int itembc = cItem.GetBundleCount(); // 번들넘버

	// 컬렉션 북을 가져온다.
	object_list cItemList;
	cItemList = player.GetItemList(1584);
	item cItem2;
	cItem2 = (item)cItemList.GetValue(0);

	if (itembc == 9)
	{
		if(((!player.GetItemNoWithClassId (51088)>0) && !player.GetItemNoWithClassId (51089)>0 && !player.GetItemNoWithClassId (51090)>0 && !player.GetItemNoWithClassId (51091)>0 && !player.GetItemNoWithClassId (51092)>0 && !player.GetItemNoWithClassId (51093)>0 && !player.GetItemNoWithClassId (51094)>0 && !player.GetItemNoWithClassId (51095)>0 && !player.GetItemNoWithClassId (51096)>0)
		 && (!cItem2.IsCollected(0) &&  !cItem2.IsCollected(1) &&  !cItem2.IsCollected(2) &&  !cItem2.IsCollected(3) &&  !cItem2.IsCollected(4) &&  !cItem2.IsCollected(5) &&  !cItem2.IsCollected(6) &&  !cItem2.IsCollected(7) &&  !cItem2.IsCollected(8)))
		{
			int iRandom2 = Random(9);
			switch(iRandom2)
			{
				case(0)
				{
					player.DoStript(`additemex(id:51088 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(1)
				{
					player.DoStript(`additemex(id:51089 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(2)
				{
					player.DoStript(`additemex(id:51090 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(3)
				{
					player.DoStript(`additemex(id:51091 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(4)
				{
					player.DoStript(`additemex(id:51092 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(5)
				{
					player.DoStript(`additemex(id:51093 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(6)
				{
					player.DoStript(`additemex(id:51094 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(7)
				{
					player.DoStript(`additemex(id:51095 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
				case(8)
				{
					player.DoStript(`additemex(id:51096 rewardview:true)`);
					player.RemoveItemCls(51097,8);
				}
			}
		}
		else if((!player.GetItemNoWithClassId (51088)>0) && !cItem2.IsCollected(0))
		{
			player.DoStript(`additemex(id:51088 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51090)>0) && !cItem2.IsCollected(2))
		{
			player.DoStript(`additemex(id:51090 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51096)>0) && !cItem2.IsCollected(8))
		{
			player.DoStript(`additemex(id:51096 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51092)>0) && !cItem2.IsCollected(4))
		{
			player.DoStript(`additemex(id:51092 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51089)>0) && !cItem2.IsCollected(1))
		{
			player.DoStript(`additemex(id:51089 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51091)>0) && !cItem2.IsCollected(3))
		{
			player.DoStript(`additemex(id:51091 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51093)>0) && !cItem2.IsCollected(5))
		{
			player.DoStript(`additemex(id:51093 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51095)>0) && !cItem2.IsCollected(7))
		{
			player.DoStript(`additemex(id:51095 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else if((!player.GetItemNoWithClassId (51094)>0) && !cItem2.IsCollected(6))
		{
			player.DoStript(`additemex(id:51094 rewardview:true)`);
			player.RemoveItemCls(51097,8);
		}
		else
		{
			player.DoStript(`additemex(id:51097)`);
			player.ShowCaption(["event.item.item51097.3"], 100);
		}
	}
}
