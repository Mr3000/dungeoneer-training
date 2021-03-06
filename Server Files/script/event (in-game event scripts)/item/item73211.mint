////////////////////////////////////////////////////////////////////////////////
server void EventActionItem(
	character player,
	item cItem)
////////////////////////////////////////////////////////////////////////////////
{
	if (IsCurrentEvent(`startschool2010_korea`))
	{
		int date = GetFullDate();
		int lastCountTime = cItem.GetEventCountTime();
		
		if (date == lastCountTime &&
			!player.IsDevcatTitle())
		{
			player.ShowCaption(["event.item.item73211.1"]);
		}
		else
		{
			if (player.IsRainy() && player.IsOutdoor())
			{
				cItem.IncreaseEventCount();
				cItem.SetEventCountTime(date);
				player.ShowCaption(["event.item.item73211.2"]);
			}
			else
			{
				if (player.RemoveItemCls(50118, 1) > 0)
				{
					player.AddItemCls(63020, 1);
					cItem.IncreaseEventCount();
					cItem.SetEventCountTime(date);
					
					player.ShowCaption(["event.item.item73211.3"]);
				}
				else
				{
					player.ShowCaption(["event.item.item73211.4"]);
				}
			}
			
			if (cItem.GetEventCount() >= 3)
			{
				if (player.DestroyItem(cItem))
				{
					player.AddItemCls(73212, 1);
					player.ShowCaption(["event.item.item73211.5"]);
				}
			}
		}
	}
}
