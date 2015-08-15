function ulx.pmute(calling_ply, target_ply)

	target_ply.ulx_muted = true

	target_ply:SetPData("permamuted", "true")

	ulx.fancyLogAdmin(calling_ply, "#A permanently muted #T", target_ply)

end

local pmute = ulx.command("Custom", "ulx pmute", ulx.pmute, "!pmute")
pmute:addParam {type=ULib.cmds.PlayersArg}
pmute:defaultAccess(ULib.ACCESS_ADMIN)
pmute:help("Mutes target, disables microphone using pdata")

-- functions to check if players are muted upon them leaving and joining
function pmutePlayerDisconnect(ply)

	if ply:GetPData ("permamuted") == "true" then

		for k, v in pairs (player.GetAll()) do

			if v:IsAdmin() then

				ULib.tsayError(v, ply:Nick() .. "(" .. ply:SteamID .. ") " .. "has left the server and is permanently muted")

			end

		end

	end

end
hook.Add("PlayerDisconnected", "pmuteddisconnect", pmutePlayerDisconnect)

function pmuteuserAuthed(ply)
 
        if ply:GetPData("permamuted") == "true" then
       
                for k,v in pairs(player.GetAll()) do
               
                        if v:IsAdmin() then
                       
                                ULib.tsayError(v, ply:Nick() .. "(" .. ply:SteamID .. ") " .. "has joined the server and is permanently muted")
                               
                        end
                       
                end
               
        end
       
end
hook.Add("PlayerAuthed", "pmuteauthed", pmuteuserAuthed)

-- function to unmute target player
function ulx.unpmute(calling_ply, target_ply)

	-- Determines if target is permanently muted and sets it to false if they are
	if target_ply:GetPData() == "true" then 
		target_ply:setPData("permamuted", "false") 
	end

	target_ply.ulx_muted = false

	if calling_ply:IsAdmin() == true then
		calling_ply:tsayError(target_ply:Nick() .. "(" .. target_ply:SteamID() .. ")" .. " has been unmuted")
	end
end

-- function to list players who are pmuted
function ulx.printpmutes(calling_ply)

	local pmuted = {}

	for k, v in pairs(player.GetAll()) do

		if v:GetPData("permamuted") == "true" then
			
			table.insert(pmuted, v:Nick())

		end

	end

	local pmutes = table.concat(pmuted, "\n") -- concatenate each player in the table with a comma

	ulx.fancyLog( {calling_ply}, "pmuted: #s ", pmutes ) -- prints to calling player only

end

local printpmutes = ulx.command("Custom", "ulx printpmutes", ulx.printpmutes, "!printpmutes", false)
printmutes::defaultAccess(ULib.ACCESS_ADMIN)
printpmutes:help("Prints players who are pmuted")

-- ULX PMute plugin created by GFL Doktor 2015 