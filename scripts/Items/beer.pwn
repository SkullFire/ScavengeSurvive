new ItemType:item_Beer = INVALID_ITEM_TYPE;

public OnPlayerUseItem(playerid, itemid)
{
	if(GetItemType(itemid) == item_Beer)
	{
		if(GetItemExtraData(itemid) > 0)
		{
			ApplyAnimation(playerid, "BAR", "dnk_stndM_loop", 3.0, 0, 1, 1, 0, 0, 1);
			SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid) + 400);
			SetItemExtraData(itemid, GetItemExtraData(itemid) - 1);
		}
		else
		{
			ShowMsgBox(playerid, "Empty", 2000, 70);
		}
	}
    return CallLocalFunction("beer_OnPlayerUseItem", "dd", playerid, itemid);
}
#if defined _ALS_OnPlayerUseItem
    #undef OnPlayerUseItem
#else
    #define _ALS_OnPlayerUseItem
#endif
#define OnPlayerUseItem beer_OnPlayerUseItem
forward beer_OnPlayerUseItem(playerid, itemid);

