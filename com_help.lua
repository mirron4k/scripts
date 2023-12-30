function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then 
		return 
	end
	while not isSampAvailable() do 
		wait(100) 
	end

	autoupdate("http://qrlk.me/dev/moonloader/getgun/stats.php", '['..string.upper(thisScript().name)..']: ', "http://vk.com/qrlk.mods")

	function autoupdate(json_url, prefix, url)
		local dlstatus = require('moonloader').download_status
		local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
		if doesFileExist(json) then os.remove(json) end
		downloadUrlToFile(json_url, json,
		  function(id, status, p1, p2)
			if status == dlstatus.STATUSEX_ENDDOWNLOAD then
			  if doesFileExist(json) then
				local f = io.open(json, 'r')
				if f then
				  local info = decodeJson(f:read('*a'))
				  updatelink = info.updateurl
				  updateversion = info.latest
				  f:close()
				  os.remove(json)
				  if updateversion ~= thisScript().version then
					lua_thread.create(function(prefix)
					  local dlstatus = require('moonloader').download_status
					  local color = -1
					  sampAddChatMessage((prefix..'Îáíàðóæåíî îáíîâëåíèå. Ïûòàþñü îáíîâèòüñÿ c '..thisScript().version..' íà '..updateversion), color)
					  wait(250)
					  downloadUrlToFile(updatelink, thisScript().path,
						function(id3, status1, p13, p23)
						  if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
							print(string.format('Çàãðóæåíî %d èç %d.', p13, p23))
						  elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
							print('Çàãðóçêà îáíîâëåíèÿ çàâåðøåíà.')
							sampAddChatMessage((prefix..'Îáíîâëåíèå çàâåðøåíî!'), color)
							goupdatestatus = true
							lua_thread.create(function() wait(500) thisScript():reload() end)
						  end
						  if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
							if goupdatestatus == nil then
							  sampAddChatMessage((prefix..'Îáíîâëåíèå ïðîøëî íåóäà÷íî. Çàïóñêàþ óñòàðåâøóþ âåðñèþ..'), color)
							  update = false
							end
						  end
						end
					  )
					  end, prefix
					)
				  else
					update = false
					print('v'..thisScript().version..': Îáíîâëåíèå íå òðåáóåòñÿ.')
				  end
				end
			  else
				print('v'..thisScript().version..': Íå ìîãó ïðîâåðèòü îáíîâëåíèå. Ñìèðèòåñü èëè ïðîâåðüòå ñàìîñòîÿòåëüíî íà '..url)
				update = false
			  end
			end
		  end
		)
		while update ~= false do wait(100) end
	  end

	wait(2000)
	sampRegisterChatCommand("dm", dm)
	sampRegisterChatCommand("dmgz", dmgz)
	sampRegisterChatCommand("db", db)
	sampRegisterChatCommand("sk", sk)
	sampRegisterChatCommand("rk", rk)
	sampRegisterChatCommand("tk", tk)
	sampRegisterChatCommand("pg", pg)
	sampRegisterChatCommand("nrpoved", dnrpoved)
	sampRegisterChatCommand("sbivt", sbivt)
	sampRegisterChatCommand("dmgetto", dmgetto)
	sampRegisterChatCommand("dmslet", dmslet)
	sampRegisterChatCommand("ezda", ezda)
	sampRegisterChatCommand("copgetto", copgetto)
	sampRegisterChatCommand("offar", offar)
	sampRegisterChatCommand("offkill", offkill)
	sampRegisterChatCommand("sbivstena", sbivstena)
	sampRegisterChatCommand("sbivplayer", sbivplayer)
	sampRegisterChatCommand("otvod", otvod)
	sampRegisterChatCommand("nrpcop", nrpcop)
	sampRegisterChatCommand("dbkov", dbkov)
	sampRegisterChatCommand("sbivap", sbivap)
	sampRegisterChatCommand("sbivtemp", sbivtemp)
	sampRegisterChatCommand("ignor", ignor)
	sampRegisterChatCommand("ignorpr", ignorpr)
	sampRegisterChatCommand("nrpcm", nrpcm)
	sampRegisterChatCommand("giftch", giftch)
	sampRegisterChatCommand("massnrp", massnrp)
	sampRegisterChatCommand("stpas", stpas)
	sampRegisterChatCommand("spyo", spyo)
	sampRegisterChatCommand("stpas", stpas)
	sampRegisterChatCommand("prov", prov)
	sampRegisterChatCommand("animsl", animsl)
	sampRegisterChatCommand("massdm", massdm)
	sampRegisterChatCommand("massdb", massdb)
	sampRegisterChatCommand("nrpaks", nrpaks)
	sampRegisterChatCommand("chelp", chelp)
	wait(500)
	sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜!", -1)
	sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ - {f09205}/chelp", -1)
	sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜˜˜˜ ˜˜ {f09205}Aries RolePlay", -1)
	sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}Version: {f09205}1.0.3", -1)
	while true do
		wait(0)
	end
end

function dm(id)
if tonumber(id) == nil then
		sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /dm [ID ˜˜˜˜˜˜].", -1)
	else
		sampSendChat("/prison "..id.." 60 DeathMatch")
	end
end

function dmgz(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /dmgz [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 100 DeathMatch in GZ")
		end
	end

function db(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /db [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 DriveBy")
		end
	end

function sk(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /sk [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 SpawnKill")
		end
	end

function rk(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /rk [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 40 RevengeKill")
		end
	end

function tk(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /tk [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 TeamKill")
		end
	end

function pg(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /pg [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 30 PowerGaming")
		end
	end

function nrpoved(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /nrpoved [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 NRP ˜˜˜˜˜˜˜˜˜")
		end
	end

function sbivt(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /sbivt [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 10 ˜˜˜˜ ˜˜˜. ˜˜˜˜˜˜")
		end
	end

function dmgetto(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /dmgetto [ID ˜˜˜˜˜˜].", -1)
		else
		    sampSendChat("/prison "..id.." 80 DeathMatch in Getto")
		end
	end

function dmslet(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /dmslet [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 200 DeathMatch ˜˜ ˜˜˜˜˜")
		end
	end

function ezda(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /ezda [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 10 ˜˜˜˜ ˜˜ ˜˜")
		end
	end

function copgetto(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /copgetto [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 ˜˜˜ ˜ Getto")
		end
	end

function offar(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /offar [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 80 ˜˜˜ ˜˜ ˜˜˜˜˜˜")
		end
	end

function offkill(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /offkill [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 80 ˜˜˜ ˜˜ ˜˜˜˜˜")
		end
	end

function sbivstena(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /sbivstena [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 30 ˜˜˜ ˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜")
		end
	end

function sbivplayer(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ + Warn - /sbivplayer [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 120 ˜˜˜ ˜˜˜˜˜˜˜˜")
			sampSendChat("/warn "..id.."  ˜˜˜ ˜˜˜˜˜˜˜˜")
		end
	end

function otvod(id)
	if tonumber(id) == nil then
		sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ + Warn - /otvod [ID ˜˜˜˜˜˜].", -1)
	else
		sampSendChat("/prison "..id.." 120 ˜˜˜˜˜˜")
		sampSendChat("/warn "..id.."  ˜˜˜˜˜˜")
	end
end

function nrpcop(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /nrpcop [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 120 ˜˜˜ ˜˜˜")
		end
	end

function dbkov(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /dbvok [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 360 DriveBy ˜˜˜˜˜˜/˜˜˜˜˜˜")
		end
	end

function sbivap(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /sbivap [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 10 ˜˜˜˜ ˜˜˜˜˜˜")
		end
	end

function sbivtemp(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /sbivtemp [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 30 ˜˜˜˜ ˜˜˜˜˜")
		end
	end

function ignor(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /ignor [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 ˜˜˜˜˜ RP ˜˜˜˜˜˜˜˜")
		end
	end

function ignorpr(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /ignorpr [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 60 ˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜˜˜˜˜")
		end
	end

function nrpcm(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /nrpcm [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 120 ˜˜˜ /cput - /mboot")
		end
	end

function giftch(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /giftch [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 120 gift ˜˜ ˜˜˜˜˜˜˜˜˜")
		end
	end

function massnrp(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ + Warn - /massnrp [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 120 ˜˜˜˜. ˜˜˜")
			sampSendChat("/warn "..id.."  ˜˜˜˜. ˜˜˜")
		end
	end

function stpas(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /stpas [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 30 ˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜˜˜")
		end
	end

function spyo(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /spyo [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 10 /spy ˜ ˜˜˜. ˜˜˜˜˜")
		end
	end

function prov(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /prov [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 10 ˜˜˜˜˜˜˜˜˜˜")
		end
	end

function animsl(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /animsl [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 15 /anim ˜˜ ˜˜˜˜˜")
		end
	end

function massdm(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /massdm [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 360 ˜˜˜˜. DeathMatch")
		end
	end

function massdb(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /massdb [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 360 ˜˜˜˜. DriveBy")
		end
	end

function nrpaks(id)
	if tonumber(id) == nil then
			sampAddChatMessage("{f09205}[Aries-Help]: {FFFFFF}˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜ - /nrpaks [ID ˜˜˜˜˜˜].", -1)
		else
			sampSendChat("/prison "..id.." 30 NRp ˜˜˜˜˜˜˜˜˜˜")
		end
	end

function chelp()
	sampShowDialog(1338, "˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜", "{f00592}1.{FFFFFF} ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ Prison\n{f00592}2.{FFFFFF} ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ Mute\n{f00592}3.{FFFFFF} ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ Warn\n{f00592}4.{FFFFFF} ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ Ban\n{f00592}5.{FFFFFF} ˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜\n{f00592}6.{FFFFFF} ˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜", "˜˜˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
	lua_thread.create(commandhelp)
end

function commandhelp()
	while sampIsDialogActive() do
		wait(0)
		local result, button, list, input = sampHasDialogRespond(1338)
		if result and list == 0 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜. ˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜ Prison", "/dm - DeathMatch\n/db - DriveBy\n/dmgz - DeathMatch in GZ\n/sk - SpawnKill\n/rk - RevengeKill\n/tk - TeamKill\n/pg - PowerGaming\n/nrpoved - ˜˜˜ ˜˜˜˜˜˜˜˜˜\n/sbivt - ˜˜˜˜ ˜˜˜. ˜˜˜˜˜˜\n/dmgetto - ˜˜ ˜ ˜˜˜˜˜\n/dmslet - ˜˜ ˜˜ ˜˜˜˜˜\n/ezda - ˜˜˜˜ ˜˜ ˜˜\n/copgetto - ˜˜˜ ˜ ˜˜˜˜˜\n/offar - ˜˜˜ ˜˜ ˜˜˜˜˜˜\n/offkill - ˜˜˜ ˜˜ ˜˜˜˜˜(˜˜ ˜˜˜ ˜˜, ˜˜ ˜ ˜˜)\n/sbivstena - ˜˜˜ ˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜\n/sbivplayer - ˜˜˜ ˜˜˜˜˜˜˜˜\n/otvod - ˜˜˜˜˜˜(prison + warn)\n/nrpcop - ˜˜˜ ˜˜˜\n/dbkov - ˜˜ ˜˜˜˜ / ˜˜˜˜˜\n/sbivap - ˜˜˜˜ ˜˜˜˜˜˜\n/sivtemp - ˜˜˜˜ ˜˜˜˜˜\n/ignor - ˜˜˜˜˜ RP ˜˜˜˜˜˜˜˜\n/ignorpr - ˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜˜˜˜˜\n/nrpcm - ˜˜˜ /mboot ˜ /cput\n/giftch - ˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜˜˜\n/massnrp - ˜˜˜˜. ˜˜˜ (prison + warn)\n/stpas - ˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜˜˜\n/spyo - /spy ˜ ˜˜˜. ˜˜˜˜˜\n/prov - ˜˜˜˜˜˜˜˜˜˜\n/animsl - /anim ˜˜ ˜˜˜˜˜\n/massdm - ˜˜˜˜. ˜˜\n/massdb - ˜˜˜˜. ˜˜\n/nrpaks - ˜˜˜ ˜˜˜˜˜˜˜˜˜˜", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		elseif result and list == 1 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜. ˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜ Mute", "SpawnKill - /sk\n˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜ - /npvch\nPoweGaming - /pg\nDeathMatch - /dm\nDeathMatch in GreenZone - /dmzz\nNonRP PD - /ncop\n+C ˜ ˜˜˜˜˜˜ - /cw\n˜˜˜˜ ˜˜˜˜˜˜˜˜ - /asbiv\nCop in Ghetto - /copg\nTeamKill - /tk\nDriveBy - /db", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		elseif result and list == 2 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜. ˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜ Warn", "NonRP /tie - /ntie", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		elseif result and list == 3 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜. ˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜ Ban", "˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ - /oskr\n˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ - /oskp\n˜˜˜˜ - /cheats", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		elseif result and list == 4 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜˜˜ ˜˜˜˜. ˜˜˜˜˜˜˜", "˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ ˜ ˜˜˜˜ - /gh\n˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ - /ss\n˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜ ˜ ˜˜˜˜ - /ghc", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		elseif result and list == 5 and button == 1 then
			sampShowDialog(1339, "˜˜˜˜˜˜˜˜˜ ˜ ˜˜˜˜˜˜˜˜˜", "˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ - {FF0000}Tom Costa\n˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜, ˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ - {ff007b}Hiroshi Miyazaki\n˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜ - {f00592}Aries RP Mobile.\n˜˜˜˜˜ ˜˜˜, ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ - vk.com/himoore", "˜˜˜˜˜", "˜˜˜˜˜˜˜", 2)
			lua_thread.create(noper)
		end
	end
end

function noper()
	while sampIsDialogActive() do
		wait (0)
		local result, button, list, input = sampHasDialogRespond(1339)
		if result and button == 1 then
			chelp()
		end
	end
end