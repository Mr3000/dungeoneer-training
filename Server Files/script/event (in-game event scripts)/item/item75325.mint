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
	// �������� ������
	player.PlayCutScene(`C3G10_S#5_0_elatha`);
	if (player.FindShadowMission() == 0 && player.GetCompletedQuestObjectiveCount(291002) == 1)
	{
		player.AddShadowMission(791003, true);		// ������ ���� �� �ִ� �׸��� �̼�
	}
	// ���⼭ �� �޾����� �ȵ�󽺿��� ���� �ɾ��.
	return;
}
