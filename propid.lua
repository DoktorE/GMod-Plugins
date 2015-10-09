function ulx.pickid(calling_ply, target_ply)

	tagged_players = {}

	tag = calling_ply:GetEyeTrace()

	if tag.Entity():IsValid

		PrintMessage(HUD_PRINTTALK, "Copied Owner's SteamID to clipboard!")
		SetClipboardText(tag.Entity():GetOwner():SteamID())

		table.insert("Name: " .. tag.Entity():GetPlayer():Nick .. "\n", tagged_players)
		table.insert("SteamID: " .. tag.Entity():GetPlayer():SteamID() .. "\n", tagged_players)
		table.insert("Prop: " .. tag.Entity(), tagged_players)
		table.insert("----------------------------", tagged_players)

	end

	else if tag.Entity():IsPlayer then

		PrintMessage(HUD_PRINTTALK, "Copied player's SteamID to clipboard")
		SetClipboardText(tag.Entity():SteamID())

		table.insert("Name: " .. tag.Entity():GetPlayer():Nick .. "\n", tagged_players)
		table.insert("SteamID: " .. tag.Entity():SteamID() .. "\n", tagged_players)
		table.insert("----------------------------", tagged_players)

	end

	else

		PrintMessage(HUD_PRINTTALK, "You must be looking at a player or an entity!")

	end

	function pdiscon()

		table.Empty(tagged_players)

	end

	function printpicks()

		for i in tagged_players
			PrintMessage(HUD_PRINTTALK, i)
		end

	end
		
end
hook.Add("PlayerDisconnected", "pdisconnectedhook", pdiscon)

local pickid = ulx.command(CATEGORY_NAME, "ulx pickid", ulx.pickid, "!pickid")
printpicks:addParam {type=ULib.cmds.PlayerArg}
printpicks:defaultAccess(ULib.ACCESS_ALL)
printpicks:help("Grabs SteamID of player or owner of prop")

local printpicks = ulx.command(CATEGORY_NAME, "ulx printpicks", ulx.printpicks, "!printpicks")
printpicks:addParam {type=ULib.cmds.PlayerArg}
printpicks:defaultAccess(ULib.ACCESS_ALL)
printpicks:help("Prints picks and stuff")