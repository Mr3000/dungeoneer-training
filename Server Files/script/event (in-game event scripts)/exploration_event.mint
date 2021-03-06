//////////////////////////////////////////////////////////////////////////////////
//                                                      Mabinogi Project G1 Script
//                                                            G4용 스크립트 모음집
//
//                                            marlin fecit at 2004. 06. 05
//                                                            hanstone@nexon.co.kr
//////////////////////////////////////////////////////////// component of Mabinogi

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_find_yuffie(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	me.Move(3000,59952,65703);
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_finding_blue_ligntning(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	if(me.IsQuestTried(250003) && !me.IsQuestCompleted(250003))
	{
		me.RemoveKeyword(`00_wood_bird_1`);
		me.RemoveKeyword(`00_wood_bird_2`);
		me.RemoveKeyword(`00_wood_bird_3`);

		me.AddKeyword(`00_wood_bird_4`);
	}
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_Ceann_for_Ocean(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	//이리아로 가는 배에 타서 둥둥 떠감
	me.Move(`Uladh_to_Iria_Ocean/_Uladh_to_Iria_Ocean_01/portal_uladh_to_iria_ocean`);

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_Ocean_for_Iria(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	//이리아에 상륙
	me.Move(`Iria_Harbor_01/_Iria_Harbor_01_001/portal_iria_harbor_01_from_ocean`);

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_Iria_for_Ocean(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	//이리아를 떠나서 배에 둥둥 떠감
	if(!me.HaveKeyword(`landing_iria_by_carasekship`))
	{
		me.AddKeyword(`landing_iria_by_carasekship`);
	}
	me.Move(`Iria_to_Uladh_Ocean/_Iria_to_Uladh_Ocean_01/portal_iria_to_uladh_ocean`);

}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_Ocean_for_Ceann(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	//케안항에 상륙
	me.Move(`Ula_Ceann_Harbor/_Ula_Ceann_Harbor_01/portal_ceann_from_ocean`);
}

//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_iria_for_vessel(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	// 이리아 새문양 근처의 항구에서 쪽배를 타고 떠나, 원양어선에 도착
	me.Move(`Iria_Uladh_Ocean_fishingboat_float/_Iria_Uladh_Ocean_fishingboat_float/portal_from_to_fishingboat_beach_boat`);
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_Leave_vessel_for_iria(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	// 원양어선에서 쪽배를 타고 떠나, 이리아 새문양 근처의 항구에 상륙
	me.Move(`Iria_SW_main_field/_Iria_SW_main_field_0080/portal_from_to_Iria_beach_boat`);
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_ShipWreck_Connous(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	// 폭풍우에 휘말려 콘누스의 어느 해안에 떨어짐
	me.Move(`Iria_SE_main_field/_Iria_SE_main_field_0164/Iria_SE_drifting_beach_01`);
	me.ShowCaption(["event.exploration_event.1"],5000);
	me.AddKeyword(`wayto_rano`);
}
//////////////////////////////////////////////////////////////////////////////////
server void OnCutSceneEnded_ShipWreck_Necojima(
	character me,					// 컷신을 본 나.
	object_list _cMemberList)		// 내가 컷신의 마스터였을 경우, 나와 같이 본 플레이어들의 리스트가 넘어온다.
// : 샘플스크립트
//////////////////////////////////////////////////////////////////////////////////
{
	// 폭풍우에 휘말려 네코지마의 어느 해안에 떨어짐
	me.Move(600,108825,101566);
	me.AddGameQuest(601002,1);
}

////////////////////////////////////////////////////////////////
server void EraseExpQuestKeyword(character player, int QuestID)
///탐험퀘스트를 포기했을 때, 관련 키워드를 지우는 함수
////////////////////////////////////////////////////////////////
{
	switch (QuestID)
	{
		case(301000)
		{
			player.RemoveKeyword(`ex_find_stonepilla_01_1_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_01_2_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_01_3_maiz`);
		}
		case(301001)
		{
			player.RemoveKeyword(`ex_find_stonepilla_02_1_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_02_2_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_02_3_maiz`);
		}
		case(301002)
		{
			player.RemoveKeyword(`ex_find_stonepilla_03_1_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_03_2_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_03_3_maiz`);
		}
		case(301003)
		{
			player.RemoveKeyword(`ex_find_stonepilla_04_1_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_04_2_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_04_3_maiz`);
		}
		case(301004)
		{
			player.RemoveKeyword(`ex_find_stonepilla_05_1_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_05_2_maiz`);
			player.RemoveKeyword(`ex_find_stonepilla_05_3_maiz`);
		}
		case(301005)
		{
			player.RemoveKeyword(`ex_find_stonepilla_06_1_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_06_2_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_06_3_muyu`);
		}
		case(301006)
		{
			player.RemoveKeyword(`ex_find_stonepilla_07_1_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_07_2_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_07_3_muyu`);
		}
		case(301007)
		{
			player.RemoveKeyword(`ex_find_stonepilla_08_1_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_08_2_muyu`);
			player.RemoveKeyword(`ex_find_stonepilla_08_3_muyu`);
		}
		case(301008)
		{
			player.RemoveKeyword(`ex_find_stonepilla_09_1_karu`);
			player.RemoveKeyword(`ex_find_stonepilla_09_2_karu`);
			player.RemoveKeyword(`ex_find_stonepilla_09_3_karu`);
		}
		case(301010)
		{
			player.RemoveKeyword(`ex_find_pole_bird_01_maiz`);
			player.RemoveKeyword(`ex_find_pole_bird_02_maiz`);
			player.RemoveKeyword(`ex_find_pole_bird_03_maiz`);
			player.RemoveKeyword(`ex_find_pole_bird_04_maiz`);
		}
		case(301011)
		{
			player.RemoveKeyword(`ex_find_pole_snake_01`);
			player.RemoveKeyword(`ex_find_pole_snake_02`);
			player.RemoveKeyword(`ex_find_pole_snake_03`);
			player.RemoveKeyword(`ex_find_pole_snake_04`);
		}
		case(301012)
		{
			player.RemoveKeyword(`ex_find_pole_monkey_01`);
			player.RemoveKeyword(`ex_find_pole_monkey_02`);
			player.RemoveKeyword(`ex_find_pole_monkey_03`);
			player.RemoveKeyword(`ex_find_pole_monkey_04`);
		}
		case(301013)
		{
			player.RemoveKeyword(`ex_find_pole_fox_01`);
			player.RemoveKeyword(`ex_find_pole_fox_02`);
			player.RemoveKeyword(`ex_find_pole_fox_03`);
		}
		case(301014)
		{
			player.RemoveKeyword(`ex_find_pole_gnu_01`);
			player.RemoveKeyword(`ex_find_pole_gnu_02`);
			player.RemoveKeyword(`ex_find_pole_gnu_03`);
		}
		case(301015)
		{
			player.RemoveKeyword(`ex_find_pole_lizard_01`);
			player.RemoveKeyword(`ex_find_pole_lizard_02`);
			player.RemoveKeyword(`ex_find_pole_lizard_03`);
			player.RemoveKeyword(`ex_find_pole_lizard_04`);
		}
		case(301025)
		{
			player.RemoveKeyword(`ex_sketch_stonestatue_01`);
			player.RemoveKeyword(`ex_sketch_stonestatue_02`);
			player.RemoveKeyword(`ex_sketch_stonestatue_03`);
			player.RemoveKeyword(`ex_sketch_stonestatue_04`);
			player.RemoveKeyword(`ex_sketch_stonestatue_05`);
			player.RemoveKeyword(`ex_sketch_stonestatue_06`);
			player.RemoveKeyword(`ex_sketch_stonestatue_07`);
			player.RemoveKeyword(`ex_sketch_stonestatue_08`);
		}
		case(301026)
		{
			player.RemoveKeyword(`ex_sketch_giantbird1_01_muyu`);
			player.RemoveKeyword(`ex_sketch_giantbird1_02_muyu`);
			player.RemoveKeyword(`ex_sketch_giantbird1_03_muyu`);
		}
		case(301027)
		{
			player.RemoveKeyword(`ex_sketch_giantbird2_01`);
			player.RemoveKeyword(`ex_sketch_giantbird2_02`);
			player.RemoveKeyword(`ex_sketch_giantbird2_03`);
		}
		case(301028)
		{
			player.RemoveKeyword(`ex_sketch_giantsnake_01_karu`);
			player.RemoveKeyword(`ex_sketch_giantsnake_02_karu`);
			player.RemoveKeyword(`ex_sketch_giantsnake_03_karu`);
			player.RemoveKeyword(`ex_sketch_giantsnake_04_karu`);
		}
		case(301029)
		{
			player.RemoveKeyword(`ex_sketch_laststatue_01`);
			player.RemoveKeyword(`ex_sketch_laststatue_02`);
			player.RemoveKeyword(`ex_sketch_laststatue_03`);
			player.RemoveKeyword(`ex_sketch_laststatue_04`);
		}
		case(301030)
		{
			player.RemoveKeyword(`ex_find_stoneface_01_karu`);
			player.RemoveKeyword(`ex_find_stoneface_02_karu`);
			player.RemoveKeyword(`ex_find_stoneface_03_karu`);
			player.RemoveKeyword(`ex_find_stoneface_04_karu`);
		}
		case(301031)
		{
			player.RemoveKeyword(`ex_find_dedicationstone_01_muyu`);
			player.RemoveKeyword(`ex_find_dedicationstone_02_muyu`);
			player.RemoveKeyword(`ex_find_dedicationstone_03_muyu`);
		}
		case(301032)
		{
			player.RemoveKeyword(`ex_find_dolmen_01`);
			player.RemoveKeyword(`ex_find_dolmen_02`);
			player.RemoveKeyword(`ex_find_dolmen_03`);
			player.RemoveKeyword(`ex_find_dolmen_04`);
			player.RemoveKeyword(`ex_find_dolmen_05`);
			player.RemoveKeyword(`ex_find_dolmen_06`);
			player.RemoveKeyword(`ex_find_dolmen_07`);
		}
		case(301033)
		{
			player.RemoveKeyword(`ex_find_sundial_01_muyu`);
			player.RemoveKeyword(`ex_find_sundial_02_muyu`);
			player.RemoveKeyword(`ex_find_sundial_03_muyu`);
		}
		case(301034)
		{
			player.RemoveKeyword(`ex_find_sundoors_01`);
			player.RemoveKeyword(`ex_find_sundoors_02`);
			player.RemoveKeyword(`ex_find_sundoors_03`);
		}
		case(301035)
		{
			player.RemoveKeyword(`ex_snake_gauntlet_01`);
			player.RemoveKeyword(`ex_snake_gauntlet_02`);
			player.RemoveKeyword(`ex_snake_gauntlet_03`);
			player.RemoveKeyword(`ex_snake_gauntlet_04`);
			player.RemoveKeyword(`snake_gauntlet_hidden`);

			player.RemoveItemCls(53020);	// 완전히 석화된 건틀렛
			player.RemoveItemCls(53021);	// 장갑이 드러난 건틀렛
			player.RemoveItemCls(53022);	// 손목이 드러난 건틀렛
			player.RemoveItemCls(53023);	// 석화가 풀린 봉인된 건틀렛
		}
		case(301036)	// 성스러운 잔에 물 채우기
		{
			player.RemoveKeyword(`ex_sacredgrail_01_karu`);
			player.RemoveKeyword(`ex_sacredgrail_02_karu`);
			player.RemoveKeyword(`ex_sacredgrail_03_karu`);
			player.RemoveKeyword(`ex_sacredgrail_04_karu`);
			player.RemoveKeyword(`ex_sacredgrail_05_karu`);

			player.RemoveKeyword(`mysterious_glass_complete`);

			player.RemoveItemCls(1212);	// 성스러운 잔 컬렉션 북
			player.RemoveItemCls(53024);	// 성스러운 잔
			player.RemoveItemCls(53025);	// 물이 채워진 성스러운 잔
		}
		case(301037)	// 태양이 그려진 비석 스케치
		{
			player.RemoveKeyword(`ex_sunnytomb_01_muyu`);
			player.RemoveKeyword(`ex_sunnytomb_02_muyu`);
			player.RemoveKeyword(`ex_sunnytomb_03_muyu`);
			player.RemoveKeyword(`ex_sunnytomb_04_muyu`);
			player.RemoveKeyword(`ex_sunnytomb_05_muyu`);
		}
		case(301038)	// 구름이 그려진 비석 스케치
		{
			player.RemoveKeyword(`ex_windytomb_01_muyu`);
			player.RemoveKeyword(`ex_windytomb_02_muyu`);
			player.RemoveKeyword(`ex_windytomb_03_muyu`);
			player.RemoveKeyword(`ex_windytomb_04_muyu`);
			player.RemoveKeyword(`ex_windytomb_05_muyu`);
		}
		case(301040)
		{
			player.RemoveKeyword(`ex_find_stoneface2_01_maiz`);
			player.RemoveKeyword(`ex_find_stoneface2_02_maiz`);
			player.RemoveKeyword(`ex_find_stoneface2_03_maiz`);
			player.RemoveKeyword(`ex_find_stoneface2_04_maiz`);
		}
		case(301041)
		{
			player.RemoveKeyword(`ex_sketch_giantsnake2_01`);
			player.RemoveKeyword(`ex_sketch_giantsnake2_02`);
			player.RemoveKeyword(`ex_sketch_giantsnake2_03`);
		}

		
		
		case(310010)
		{
			player.RemoveKeyword(`ex_bigearadvark_maiz#st`);
			player.RemoveKeyword(`ex_bigearadvark_maiz`);
		}
		case(310410)
		{
			player.RemoveKeyword(`ex_whitelinespider_muyu#st`);
			player.RemoveKeyword(`ex_whitelinespider_muyu`);
		}
		case(310400)
		{
			player.RemoveKeyword(`ex_whitespotspider_muyu#st`);
			player.RemoveKeyword(`ex_whitespotspider_muyu`);
		}
		case(310390)
		{
			player.RemoveKeyword(`ex_moonbear_karu#st`);
			player.RemoveKeyword(`ex_moonbear_karu`);
		}
		case(310380)
		{
			player.RemoveKeyword(`ex_scarbear_karu#st`);
			player.RemoveKeyword(`ex_scarbear_karu`);
		}
		case(310360)
		{
			player.RemoveKeyword(`ex_brownlizard_karu#st`);
			player.RemoveKeyword(`ex_brownlizard_karu`);
		}
		case(310350)
		{
			player.RemoveKeyword(`ex_whiteghost_karu#st`);
			player.RemoveKeyword(`ex_whiteghost_karu`);
		}

		case(310340)
		{
			player.RemoveKeyword(`ex_blacklizard_karu#st`);
			player.RemoveKeyword(`ex_blacklizard_karu`);
		}

		case(310330)
		{
			player.RemoveKeyword(`ex_movingleaf_karu#st`);
			player.RemoveKeyword(`ex_movingleaf_karu`);
		}
		case(310310)
		{
			player.RemoveKeyword(`ex_blackearpig_karu#st`);
			player.RemoveKeyword(`ex_blackearpig_karu`);
		}
		case(310300)
		{
			player.RemoveKeyword(`ex_flyingpig_karu#st`);
			player.RemoveKeyword(`ex_flyingpig_karu`);
		}
		case(310290)
		{
			player.RemoveKeyword(`ex_manedpig_karu#st`);
			player.RemoveKeyword(`ex_manedpig_karu`);
		}
		case(310280)
		{
			player.RemoveKeyword(`ex_whiteearpig_karu#st`);
			player.RemoveKeyword(`ex_whiteearpig_karu`);
		}
		case(310270)
		{
			player.RemoveKeyword(`ex_tuata_karu#st`);
			player.RemoveKeyword(`ex_tuata_karu`);
		}
		case(310250)
		{
			player.RemoveKeyword(`ex_whitetailmonguse_maiz#st`);
			player.RemoveKeyword(`ex_whitetailmonguse_maiz`);
		}
		case(310240)
		{
			player.RemoveKeyword(`ex_bluetailmongus_maiz#st`);
			player.RemoveKeyword(`ex_bluetailmongus_maiz`);
		}
		case(310230)
		{
			player.RemoveKeyword(`ex_brtailmonguse_maiz#st`);
			player.RemoveKeyword(`ex_brtailmonguse_maiz`);
		}
		case(310210)
		{
			player.RemoveKeyword(`ex_graytailmongoose_maiz#st`);
			player.RemoveKeyword(`ex_graytailmongoose_maiz`);
		}
		case(310190)
		{
			player.RemoveKeyword(`ex_bluelegfox_muyu#st`);
			player.RemoveKeyword(`ex_bluelegfox_muyu`);
		}
		case(310180)
		{
			player.RemoveKeyword(`ex_redlegfox_muyu#st`);
			player.RemoveKeyword(`ex_redlegfox_muyu`);
		}
		case(310170)
		{
			player.RemoveKeyword(`ex_graylegfox_muyu#st`);
			player.RemoveKeyword(`ex_graylegfox_muyu`);
		}
		case(310160)
		{
			player.RemoveKeyword(`ex_blacklegfox_muyu#st`);
			player.RemoveKeyword(`ex_blacklegfox_muyu`);
		}
		case(310150)
		{
			player.RemoveKeyword(`ex_brownlegfox_muyu#st`);
			player.RemoveKeyword(`ex_brownlegfox_muyu`);
		}

		case(310130)
		{
			player.RemoveKeyword(`ex_shortheiena_muyu#st`);
			player.RemoveKeyword(`ex_shortheiena_muyu`);
		}
		case(310120)
		{
			player.RemoveKeyword(`ex_julheiena_muyu#st`);
			player.RemoveKeyword(`ex_julheiena_muyu`);
		}
		case(310110)
		{
			player.RemoveKeyword(`ex_nudehyena_muyu#st`);
			player.RemoveKeyword(`ex_nudehyena_muyu`);
		}
		case(310100)
		{
			player.RemoveKeyword(`ex_longheiena_muyu#st`);
			player.RemoveKeyword(`ex_longheiena_muyu`);
		}
		case(310080)
		{
			player.RemoveKeyword(`ex_cactuslizard_muyu#st`);
			player.RemoveKeyword(`ex_cactuslizard_muyu`);
		}
		case(310070)
		{
			player.RemoveKeyword(`ex_bighorngnu_maiz#st`);
			player.RemoveKeyword(`ex_bighorngnu_maiz`);
		}
		case(310060)
		{
			player.RemoveKeyword(`ex_0smallhorngnu_maiz#st`);
			player.RemoveKeyword(`ex_0smallhorngnu_maiz`);
		}
		case(310040)
		{
			player.RemoveKeyword(`ex_manedadvark_maiz#st`);
			player.RemoveKeyword(`ex_manedadvark_maiz`);
		}
		case(310030)
		{
			player.RemoveKeyword(`ex_hornadvark_maiz#st`);
			player.RemoveKeyword(`ex_hornadvark_maiz`);
		}
		case(310020)
		{
			player.RemoveKeyword(`ex_blackadvark_maiz#st`);
			player.RemoveKeyword(`ex_blackadvark_maiz`);
		}
		case(310480)
		{
			player.RemoveKeyword(`ex_poisonmushroom_karu#st`);
			player.RemoveKeyword(`ex_poisonmushroom_karu`);
		}
		case(310470)
		{
			player.RemoveKeyword(`ex_bluemushroom_karu#st`);
			player.RemoveKeyword(`ex_bluemushroom_karu`);
		}

		case(310460)
		{
			player.RemoveKeyword(`ex_redmushroom_karu#st`);
			player.RemoveKeyword(`ex_redmushroom_karu`);
		}
		case(310450)
		{
			player.RemoveKeyword(`ex_brownmushroom_karu#st`);
			player.RemoveKeyword(`ex_brownmushroom_karu`);
		}
		case(310430)
		{
			player.RemoveKeyword(`ex_blackspider_muyu#st`);
			player.RemoveKeyword(`ex_blackspider_muyu`);
		}
		case(310420)
		{
			player.RemoveKeyword(`ex_whitespider_muyu#st`);
			player.RemoveKeyword(`ex_whitespider_muyu`);
		}

		case(310220)
		{
			player.RemoveKeyword(`ex_blacktailmonguse_maiz#st`);
			player.RemoveKeyword(`ex_blacktailmonguse_maiz`);
		}

		// 유적 던전 몬스터 스케치 관련 키워드
		case(311202)
		{
			player.RemoveKeyword(`ex_stonedog_karuruin#st`);
			player.RemoveKeyword(`ex_stonedog_karuruin`);
		}
		case(311209)
		{
			player.RemoveKeyword(`ex_stonecow_karuruin#st`);
			player.RemoveKeyword(`ex_stonecow_karuruin`);
		}
		case(311228)
		{
			player.RemoveKeyword(`ex_stonemimic_karuruin#st`);
			player.RemoveKeyword(`ex_stonemimic_karuruin`);
		}
		case(311229)
		{
			player.RemoveKeyword(`ex_jarspider_karuruin#st`);
			player.RemoveKeyword(`ex_jarspider_karuruin`);
		}
		case(311238)
		{
			player.RemoveKeyword(`ex_stonehorse_karuruin#st`);
			player.RemoveKeyword(`ex_stonehorse_karuruin`);
		}
		case(311239)
		{
			player.RemoveKeyword(`ex_stonemanhead_karuruin#st`);
			player.RemoveKeyword(`ex_stonemanhead_karuruin`);
		}
		case(311241)
		{
			player.RemoveKeyword(`ex_stonezombie_karuruin#st`);
			player.RemoveKeyword(`ex_stonezombie_karuruin`);
		}
		case(311250)
		{
			player.RemoveKeyword(`ex_stoneimp_karuruin#st`);
			player.RemoveKeyword(`ex_stoneimp_karuruin`);
		}

	}
}