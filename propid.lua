function ulx.pickid(calling_ply, target_ply)

	tagged_players = {}

	tag = calling_ply:GetEyeTrace()

	if tag.Entity():IsValid

		PrintMessage(HUD_PRINTTALK, "Copied Owner's SteamID to clipboard!")
		SetClipboardText(tag.Entity():GetOwner():SteamID())

		table.insert("Name: " .. tag.Entity():GetPlayer():Nick .. "\n")
		table.insert("SteamID: " .. tag.Entity():GetPlayer():SteamID() .. "\n")
		table.insert("Prop: " .. tag.Entity())
		table.insert("----------------------------")

	end

	else if tag.Entity():IsPlayer then

		PrintMessage(HUD_PRINTTALK, "Copied player's SteamID to clipboard")
		SetClipboardText(tag.Entity():SteamID())

		table.insert("Name: " .. tag.Entity():GetPlayer():Nick .. "\n")
		table.insert("SteamID: " .. tag.Entity():SteamID() .. "\n")
		table.insert("----------------------------")

	end

	else

		PrintMessage(HUD_PRINTTALK, "You must be looking at a player or an entity!")

	end

	function pdiscon()

		table.Empty(tagged_players)

	end

	function printpicks()
	-- As of 12:23 am on the hottest day this summer, I can't figure out how to go through with this


	end
		
end
hook.Add("PlayerDisconnected", "pdisconnectedhook", pdiscon)

local pickid = ulx.command(CATEGORY_NAME, "ulx pickid", ulx.pickid, "!pickid")
pmute:addParam {type=ULib.cmds.PlayersArg}
pmute:defaultAccess(ULib.ACCESS_ALL)
pmute:help("Grabs SteamID of player or owner of prop")