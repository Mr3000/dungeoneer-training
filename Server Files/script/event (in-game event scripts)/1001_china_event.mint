////////////////////////////////////////////////////////////////////////////////
//                                   Mabinogi Project : China National Day Event
//                          중국 국경절 이벤트시에 쿠폰의 드랍율을 선택하는 함수
//
//                                        dochigun fecit, begins at 2007. 08. 10
//                                                          dochigun@nexon.co.kr
////////////////////////////////////////////////////////// component of Mabinogi


////////////////////////////////////////////////////////////////////////////////
server dword OnSelectCharacterCoupon(character player)
// : 글자 쿠폰의 확률을 선택하는 함수
////////////////////////////////////////////////////////////////////////////////
{
  if (!IsCurrentEvent(`1001event_china2007`))
	{
		return 0;
	}

	// 10%의 확률로 나옴
/*	if (Random(100) < 90)
	{
		return 0;
	}
*/
	int iCumRate	= 0;							// 확률을 누적해놓는 변수
	int	i					= 0;							// iterator
	int iRandom		= Random(10000);			// 확률의 총합을 적는다.

	// 결과값
	int dwCouponClassId = 0;

	while (true)
	{
		bool bBreak = false;
		
		switch (i)
		{
			case(0)	{	dwCouponClassId = 75260;	iCumRate	+=	300;	}		// [luo] 쿠폰
			case(1)	{	dwCouponClassId = 75261;	iCumRate	+=	300;	}		// [qi] 쿠폰
			case(2)	{	dwCouponClassId = 75262;	iCumRate	+=	30;	}		// [m] 쿠폰
			case(3)	{	dwCouponClassId = 75263;	iCumRate	+=	30;	}		// [a] 쿠폰	
			case(4)	{	dwCouponClassId = 75264;	iCumRate	+=	30;	}		// [b] 쿠폰	
			case(5)	{	dwCouponClassId = 75265;	iCumRate	+=	30;	}		// [i] 쿠폰	
			case(6)	{	dwCouponClassId = 75266;	iCumRate	+=	30;	}		// [n] 쿠폰	
			case(7)	{	dwCouponClassId = 75267;	iCumRate	+=	6;	}		// [o] 쿠폰	
			case(8)	{	dwCouponClassId = 75268;	iCumRate	+=	30;	}		// [g] 쿠폰	
			case(9)	{	dwCouponClassId = 75269;	iCumRate	+=	30;	}		// [i] 쿠폰	
			case(10)	{	dwCouponClassId = 0;	iCumRate	+=	9184;	}		// 	

			default
			{
				bBreak = true;
			}
		}

		if (bBreak)
		{
			break;
		}

		if (iRandom < iCumRate) 
		{
			return dwCouponClassId;
		}
		
		++i;
	}

	return 0;
}
