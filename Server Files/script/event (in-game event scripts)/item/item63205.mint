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
	// �н� ����Ʈ ���� Ű����
	if (IsEnable(`featureBunshin`) extern (`data/script/features.mint`)) //�н� Ű���� ����
	{
		// �����
		//player.ShowCaption(`��ȥ soul`);

		if(player.GetCompletedQuestObjectiveCount(20117)==1 && !player.HaveKeyword(`use_soulstone`))
		{
			player.AddKeyword(`use_soulstone`);
		}
	}
}
