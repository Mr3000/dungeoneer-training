////////////////////////////////////////////////////////////////////////////////
//                                      		Mabinogi Project Treasure Script
//                                             					   이리아 디폴트
//
//                                   wakeup erinys fecit, begins at 2006. 02. 16
////////////////////////////////////////////////////////// component of Mabinogi

////////////////////////////////////////////////////////////////////////////////
server void
    OnTreasureCreate(
        prop _this)
// :
////////////////////////////////////////////////////////////////////////////////
{
	// 아이템 부여
	//_this.AddItem(`id:2000`);
	//_this.AddItem(`id:51003 count:2~5`);
	
	// 몬스터 클래스 아이디로 지정
	//_this.AddMonster(`StoneBison3:2`);
	
	// 몬스터 클래스 아이디와 타이틀 지정
	//_this.AddMonster(`MaskGoblin[30026|30027|30028]:3`);
	
	// 콤마로도 구분 가능
	//_this.AddMonster(GoldMaskGhost[30026|30027|30028]:3, Sheep:5`);
	
	// 몬스터 그룹을 지정
	//_this.AddMonster(`group(127)`);
	
	// 이벤트 아이템 설정 설정
	//_this.AddEventItem(`id:2000`);
	//_this.AddEventItem(`id:51003 count:2~5`);
	
	// 어나운스 대상 아이템 설정
	// 아이템 클래스 아이디로 설정
	//_this.AddAnnounceItem(2000);
}
