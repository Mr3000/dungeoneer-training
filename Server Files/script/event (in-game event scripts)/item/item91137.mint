//////////////////////////////////////////////////////////////////////////////////
//                                              Mabinogi Project : Use Item Script
//                                                     æ∆¿Ã≈€ ªÁøÎΩ√¿« ¿Ã∫•∆Æ «‘ºˆ
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
// : æ∆¿Ã≈€ø° æ∆π´ ±‚¥…¿Ã æ¯¿∏≥™
//   isusable¿Ã∞Ì stringid∞° '/script/'∏¶ ∆˜«‘«œ∞Ì ¿÷¥¬ æ∆¿Ã≈€¿ª ªÁøÎ«ﬂ¿ª ∂ß
//   ∫“∏Æ¥¬ «‘ºˆ
////////////////////////////////////////////////////////////////////////////////
{
	//¿œ∫ª shop ¿Ã∫•∆Æ
	int iCumRate = 0; //»Æ∑¸¿ª ¥©¿˚«ÿ≥ı¥¬ ∫Øºˆ
	int i=0;
	int iRandom = Random(187);	//»Æ∑¸¿« √—«’¿ª ¿˚¥¬¥Ÿ
	int itemID = cItem.GetClassId();

	while(true)
	{
		bool bBreak = false;
		string itemString;
		switch(i)
		//i∞™¿ª «œ≥™æø ¥√∑¡∞°∏Èº≠ case∑Œ ±∏«ˆµ» ∏ÆΩ∫∆Æ¿« æ∆¿Ã≈€¿« »Æ∑¸∞˙ ∫Ò±≥«—¥Ÿ
		{
			// ø©±‚¥Ÿ ≥÷¿∏ººø‰
			case(0){itemString = `id:19007 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //Â®Œ√´ﬁ´’´È?´Ì?´÷ æﬂ±§ ∏”«√∑Ø ∑Œ∫Í/>
			case(1){itemString = `id:19038 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //´È´–´≠´„´√´»´Ì?´÷∂ÛπŸ ƒπ ∑Œ∫Í/>
			case(2){itemString = `id:40095 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //´…´È´¥´Û´÷´Ï´§´… µÂ∑°∞Ô ∫Ì∑π¿ÃµÂ/>
			case(3){itemString = `id:40253 col1:ffcc66 col2:ff9966`; iCumRate +=1;} //´·´ø´Î´¢´§´π´Ô´Û´…∏ﬁ≈ª æ∆¿ÃΩ∫ ¿©µÂ/>
			case(4){itemString = `id:40250 col1:ffcc66`; iCumRate +=1;} //´·´ø´Î´’´°´§´¢´Ô´Û´…∏ﬁ≈ª ∆ƒ¿ÃæÓ ¿©µÂ/>
			case(5){itemString = `id:40248 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //´·´ø´Î´È´§´»´À´Û´∞´Ô´Û´…∏ﬁ≈ª ∂Û¿Ã∆Æ¥◊ ¿©µÂ/>
			case(6){itemString = `id:40251 col1:ffcc66 col2:ff9966`; iCumRate +=1;} //´´´Î´‘´ ´π´“?´Í´Û´∞´Ô´Û´…ƒÆ««¥©Ω∫ »˙∏µ¿©µÂ/>
			case(7){itemString = `id:40041 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //ˆË?Èƒ´Ô´Û´… ≈∏∞›øÎ ¿©µÂ/>
			case(8){itemString = `id:40230 col1:ffcc66 col2:ff6600 col3:ff0000`; iCumRate +=10;} //´Î´£´®´’´ß´§´∑´ßÌπÔ ø©ø˘∫Òº≥ ¥‹¿⁄π›¡¢/>
			case(9){itemString = `id:18552 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁ‘ﬂ (Ï— ‡,´∏´„´§´¢´Û´»?Èƒ)¬˜¿Ã≥™ µÂ∑°∞Ô «Ô∏ß (¿Œ∞£, ¿⁄¿Ãæ∆Æ ¿¸øÎ)/>
			case(10){itemString = `id:18553 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁ‘ﬂ (´®´Î´’?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô «Ô∏ß (ø§«¡ ¿¸øÎ)/>
			case(11){itemString = `id:14039 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁÀ— (Ï— ‡?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô æ∆∏” (¿Œ∞£ ¿¸øÎ)/>
			case(12){itemString = `id:14040 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁÀ— (´®´Î´’?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô æ∆∏” (ø§«¡ ¿¸øÎ)/>
			case(13){itemString = `id:14041 col1:ffcc66 col2:ff9966 col3:ff6600`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁÀ— (´∏´„´§´¢´Û´»?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô æ∆∏” (¿⁄¿Ãæ∆Æ ¿¸øÎ)/>
			case(14){itemString = `id:16532 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁ?‚¢ (Ï— ‡?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô ∞«∆≤∑ø (¿Œ∞£ ¿¸øÎ)/>
			case(15){itemString = `id:16533 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁ?‚¢ (´®´Î´’?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô ∞«∆≤∑ø (ø§«¡ ¿¸øÎ)/>
			case(16){itemString = `id:16535 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁ?‚¢ (´∏´„´§´¢´Û´»?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô ∞«∆≤∑ø (¿⁄¿Ãæ∆Æ ¿¸øÎ)/>
			case(17){itemString = `id:17095 col1:ffcc66`; iCumRate +=10;} //Ï∂?˘¶◊£„ﬁÎÀ— (Ï— ‡,´®´Î´’,´∏´„´§´¢´Û´»?Èƒ) ¬˜¿Ã≥™ µÂ∑°∞Ô ∫Œ√˜ (¿Œ∞£, ø§√˜, ¿⁄¿Ãæ∆Æ ¿¸øÎ)/>
			case(18){itemString = `id:15232 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=10;} //´È´”´√´»‹◊ ≈‰≥¢ ø />
			case(19){itemString = `id:16043 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //´È´”´√´»´œ´Û´… ≈‰≥¢ º’/>
			case(20){itemString = `id:17094 col1:ffcc66 col2:ff9966`; iCumRate +=10;} //´È´”´√´»´’´√´» ≈‰≥¢ πﬂ/>
			case(21){itemString = `id:15250 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //´·´§´…Î˝?´∑´Á?´»´ø´§´◊∏ﬁ¿ÃµÂ ¿«ªÛ ºÓ∆Æ ≈∏¿‘/>
			case(22){itemString = `id:15251 col1:ffcc66 col2:ff9966 col3:ff6666`; iCumRate +=1;} //´·´§´…Î˝?´Ì´Û´∞´ø´§´◊ ∏ﬁ¿ÃµÂ ¿«ªÛ ∑’ ≈∏¿‘/>
			case(23){itemString = `id:46026 col1:ffcc66 col2:ff0000`; iCumRate +=1;} //´–´√´Ø´È?πˆ≈¨∑Ø/>
			case(24){itemString = `id:18149`; iCumRate +=10;} //Ù¯„˝Ì∫Èƒ™“™Ë™≥Ÿ∂Ì≠√ ∫∏¿⁄øÎ ∫¥æ∆∏Æ ∏¿⁄/>
			// ø©±‚¥Ÿ ≥÷¿∏ººø‰¿« ≥°
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
			DebugOut(`¿Ø¿˙ø°∞‘ `+itemString+` ∏¶ ¡‹`);
			GiveFashionGachaphonItem(player,itemString,itemID) extern (`data/script/event/useitem_event.mint`);
			return;
		}

		++i;
	}
	GiveFashionGachaphonItem(player, `id:40022`,itemID) extern (`data/script/event/useitem_event.mint`); //Ω∫≈©∏≥∆Æ∞° ∆≤∑»∞≈≥™ «ÿº≠ æ∆¿Ã≈€¿Ã ¡¶¥Î∑Œ æ»≥™ø¿∏È ¿œ¥‹ ¿Ã∞≈ ¡‹. »Æ∑¸∞™¿« √—«’¿ª iRandom¿« π¸¿ß∞™¿∏∑Œ ≥÷¥¬∞… ¿ÿ¡ˆ∏∂Ω√ø¿	
}
