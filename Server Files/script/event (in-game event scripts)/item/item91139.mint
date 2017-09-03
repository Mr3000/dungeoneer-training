//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     ������ ������ �̺�Ʈ �Լ�
//
//                                           nicolas fecit, begins at 2006. 03. 14
//			jooddang modified at 1007. 04. 30
//                                                             nicolas@nexon.co.kr
//				jooddang@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi



////////////////////////////////////////////////////////////////////////////////
server void UseScriptItem(
	character player,
	item cItem)
// : �����ۿ� �ƹ� ����� ������
//   isusable�̰� stringid�� '/script/'�� �����ϰ� �ִ� �������� ������� ��
//   �Ҹ��� �Լ�
////////////////////////////////////////////////////////////////////////////////
{


	player.DoStript(`additemex(id:51004 count:10 rewardview:true)`);	// ����� 100	
	player.DoStript(`additemex(id:51009 count:10 rewardview:true)`);	// ���� 100
	player.DoStript(`additemex(id:51014 count:10 rewardview:true)`);	// ���¹̳� 100
	player.DoStript(`additemex(id:63016 count:10 rewardview:true)`);	// �ູ�� ����
	player.DoStript(`additemex(id:63000 count:10 rewardview:true)`);	// �Ǵн��� ����
	player.DoStript(`additemex(id:60047 count:10 rewardview:true)`);	// ���� �ش�
	player.DoStript(`additemex(id:63076 count:1 rewardview:true)`);	// ���̽� ����

	int iRandom = Random(80);	//Ȯ���� ������ ���´�

	if(GetLocale().LowerCase() == `japan`)
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// ����Ÿ Ʈ�� ����		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// ���̴� ��Ÿ	
			}
			case (2)
			{
				player.DoStript(`additemex(id:18199 rewardview:true)`);	// ���� �� �Ȱ�		
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// ū ���̺� ��Ǭ
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// ū ���̺� ��ũ
			}
			case (5)
			{
				player.DoStript(`additemex(id:40258 col1:61000f22 col2:61000f22 col3:61000f22 rewardview:true)`);	// �Ǹ���
			}
			default
			{
			}
		}
	}
	if(GetLocale().LowerCase() == `usa`)
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// ����Ÿ Ʈ�� ����		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// ���̴� ��Ÿ	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40964 rewardview:true)`);	// ū ���̺� ������	
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// ū ���̺� ��Ǭ
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// ū ���̺� ��ũ
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// ���̸��� ��� �巹��
			}
			default
			{
			}
		}
	}
	if((GetLocale().LowerCase() == `china`) || (GetLocale().LowerCase() == `taiwan`))
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// ����Ÿ Ʈ�� ����		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18235 rewardview:true)`);	// ���̸��� ����Ʈ ĸ	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40258 col1:61000f22 col2:61000f22 col3:61000f22 rewardview:true)`);	// �Ǹ���
			}
			case (3)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// ���̴� ��Ÿ		
			}
			case (4)
			{
				player.DoStript(`additemex(id:18188 rewardview:true)`);	// �ȴ�
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// ���̸��� ���巹��
			}
			default
			{
			}
		}
	}
	if((GetLocale().LowerCase() == `europe`))
	{
		switch(iRandom)
		{
			/*
			case (0)
			{
				player.DoStript(`additemex(id:18213 rewardview:true)`);	// ����Ÿ Ʈ�� ����		
			}
			*/
			case (1)
			{
				player.DoStript(`additemex(id:18261 rewardview:true)`);	// ���̴� ��Ÿ	
			}
			case (2)
			{
				player.DoStript(`additemex(id:40964 rewardview:true)`);	// ū ���̺� ������	
			}
			case (3)
			{
				player.DoStript(`additemex(id:40962 rewardview:true)`);	// ū ���̺� ��Ǭ
			}
			case (4)
			{
				player.DoStript(`additemex(id:40963 rewardview:true)`);	// ū ���̺� ��ũ
			}
			case (5)
			{
				player.DoStript(`additemex(id:18233 rewardview:true)`);	// ���̸��� ��� �巹��
			}
			default
			{
			}
		}
	}
}
