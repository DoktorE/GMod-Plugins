function ulx.bancheck (calling_ply, target_ply)
	PrintMessage(HUD_PRINTTALK, "Check console for SteamID")
	PrintMessage(HUD_PRINTCONSOLE, "The player's SteamID is " .. target_ply:SteamID())
	calling_ply:SendLua([[gui.OpenURL('http://gflclan.com/gmodbans/index.php?p=banlist&advSearch=]]..target_ply:SteamID()..[[&advType=steamid')]])
end

local bancheck = ulx.command(CATEGORY_NAME, "ulx bancheck", ulx.bancheck, "!bancheck")
bancheck:addParam{ type=ULib.cmds.PlayerArg }
bancheck:defaultAccess(ULib.ACCESS_ADMIN)
bancheck:help ("Displays the player's SteamID")

-- This may or may not have been stolen from somebody who I may or may not hate
