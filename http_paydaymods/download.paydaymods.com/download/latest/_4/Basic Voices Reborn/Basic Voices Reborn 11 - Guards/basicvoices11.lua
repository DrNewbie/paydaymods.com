_G.BasicVoices11 = _G.BasicVoices11 or {}
BasicVoices11._path = ModPath
BasicVoices11._data = {}

function BasicVoices11:Play(soundfile)
	if Utils:IsInHeist() and Utils:IsInCustody() == false and Utils:IsInGameState() then
		managers.player:local_player():sound():say(soundfile,true,true)
	end
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_BasicVoices11", function(loc)
	loc:load_localization_file(BasicVoices11._path .. "en.txt")
end)

Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_BasicVoices11", function(menu_manager)
----------------------------------------------------- All the sounds
	BasicVoices11.g1gun = function(self)
		BasicVoices11:Play("l1n_a01")
	end	
	BasicVoices11.g1close = function(self)
		BasicVoices11:Play("l1n_a02")
	end	
	BasicVoices11.g1staff = function(self)
		BasicVoices11:Play("l1n_a03")
	end	
	BasicVoices11.g1quiet = function(self)
		BasicVoices11:Play("l1n_a05")
	end
	BasicVoices11.g1idle = function(self)
		BasicVoices11:Play("l1n_a06")
	end	
	BasicVoices11.g1intruder = function(self)
		BasicVoices11:Play("l1n_a08")
	end		
	BasicVoices11.g1alarm = function(self)
		BasicVoices11:Play("l1n_a09")
	end	
	BasicVoices11.g1window = function(self)
		BasicVoices11:Play("l1n_a10")
	end	
	BasicVoices11.g1deadbody = function(self)
		BasicVoices11:Play("l1n_a11")
	end	
	BasicVoices11.g1deadofficer = function(self)
		BasicVoices11:Play("l1n_a12")
	end	
	BasicVoices11.g1tiedcivi = function(self)
		BasicVoices11:Play("l1n_a13")
	end	
	BasicVoices11.g1tiedofficer = function(self)
		BasicVoices11:Play("l1n_a14")
	end	
	BasicVoices11.g1situation = function(self)
		BasicVoices11:Play("l1n_a15")
	end	
	BasicVoices11.g1officerhelp = function(self)
		BasicVoices11:Play("l1n_a16")
	end	
	BasicVoices11.g1secdoor = function(self)
		BasicVoices11:Play("l1n_a17")
	end	
	BasicVoices11.g1fire = function(self)
		BasicVoices11:Play("l1n_a18")
	end	
	BasicVoices11.g1bodybag = function(self)
		BasicVoices11:Play("l1n_a19")
	end	
	BasicVoices11.g1sentry = function(self)
		BasicVoices11:Play("l1n_a20")
	end	
	BasicVoices11.g1mine = function(self)
		BasicVoices11:Play("l1n_a21")
	end	
	BasicVoices11.g1bag = function(self)
		BasicVoices11:Play("l1n_a22")
	end	
	BasicVoices11.g1intruders = function(self)
		BasicVoices11:Play("l1n_a23")
	end	
	BasicVoices11.g1pc = function(self)
		BasicVoices11:Play("l1n_a24")
	end	
	BasicVoices11.g1drill = function(self)
		BasicVoices11:Play("l1n_a25")
	end
	BasicVoices11.g2gun = function(self)
		BasicVoices11:Play("l2n_a01")
	end	
	BasicVoices11.g2close = function(self)
		BasicVoices11:Play("l2n_a02")
	end	
	BasicVoices11.g2staff = function(self)
		BasicVoices11:Play("l2n_a03")
	end	
	BasicVoices11.g2quiet = function(self)
		BasicVoices11:Play("l2n_a05")
	end
	BasicVoices11.g2idle = function(self)
		BasicVoices11:Play("l2n_a06")
	end		
	BasicVoices11.g2intruder = function(self)
		BasicVoices11:Play("l2n_a08")
	end		
	BasicVoices11.g2alarm = function(self)
		BasicVoices11:Play("l2n_a09")
	end	
	BasicVoices11.g2window = function(self)
		BasicVoices11:Play("l2n_a10")
	end	
	BasicVoices11.g2deadbody = function(self)
		BasicVoices11:Play("l2n_a11")
	end	
	BasicVoices11.g2deadofficer = function(self)
		BasicVoices11:Play("l2n_a12")
	end	
	BasicVoices11.g2tiedcivi = function(self)
		BasicVoices11:Play("l2n_a13")
	end	
	BasicVoices11.g2tiedofficer = function(self)
		BasicVoices11:Play("l2n_a14")
	end	
	BasicVoices11.g2situation = function(self)
		BasicVoices11:Play("l2n_a15")
	end	
	BasicVoices11.g2officerhelp = function(self)
		BasicVoices11:Play("l2n_a16")
	end	
	BasicVoices11.g2secdoor = function(self)
		BasicVoices11:Play("l2n_a17")
	end	
	BasicVoices11.g2fire = function(self)
		BasicVoices11:Play("l2n_a18")
	end	
	BasicVoices11.g2bodybag = function(self)
		BasicVoices11:Play("l2n_a19")
	end	
	BasicVoices11.g2sentry = function(self)
		BasicVoices11:Play("l2n_a20")
	end	
	BasicVoices11.g2mine = function(self)
		BasicVoices11:Play("l2n_a21")
	end	
	BasicVoices11.g2bag = function(self)
		BasicVoices11:Play("l2n_a22")
	end	
	BasicVoices11.g2intruders = function(self)
		BasicVoices11:Play("l2n_a23")
	end	
	BasicVoices11.g2pc = function(self)
		BasicVoices11:Play("l2n_a24")
	end	
	BasicVoices11.g2drill = function(self)
		BasicVoices11:Play("l2n_a25")
	end	
	BasicVoices11.g201 = function(self)
		BasicVoices11:Play("l2n_b01")
	end
	BasicVoices11.g202 = function(self)
		BasicVoices11:Play("l2n_b02")
	end
	BasicVoices11.g203 = function(self)
		BasicVoices11:Play("l2n_b03")
	end		
	BasicVoices11.g204 = function(self)
		BasicVoices11:Play("l2n_b04")
	end
	BasicVoices11.g205 = function(self)
		BasicVoices11:Play("l2n_b05")
	end
	BasicVoices11.g206 = function(self)
		BasicVoices11:Play("l2n_b06")
	end		
	BasicVoices11.g207 = function(self)
		BasicVoices11:Play("l2n_b07")
	end
	BasicVoices11.g208 = function(self)
		BasicVoices11:Play("l2n_b08")
	end
	BasicVoices11.g209 = function(self)
		BasicVoices11:Play("l2n_b09")
	end		
	BasicVoices11.g210 = function(self)
		BasicVoices11:Play("l2n_b10")
	end
	BasicVoices11.g211 = function(self)
		BasicVoices11:Play("l2n_b11")
	end
	BasicVoices11.g212 = function(self)
		BasicVoices11:Play("l2n_b12")
	end
	BasicVoices11.g213 = function(self)
		BasicVoices11:Play("l2n_b13")
	end
	BasicVoices11.g214 = function(self)
		BasicVoices11:Play("l2n_b14")
	end
	BasicVoices11.g215 = function(self)
		BasicVoices11:Play("l2n_b15")
	end		
	BasicVoices11.g216 = function(self)
		BasicVoices11:Play("l2n_b16")
	end
	BasicVoices11.g217 = function(self)
		BasicVoices11:Play("l2n_b17")
	end
	BasicVoices11.g218 = function(self)
		BasicVoices11:Play("l2n_b18")
	end
	BasicVoices11.g219 = function(self)
		BasicVoices11:Play("l2n_b19")
	end
	BasicVoices11.g220 = function(self)
		BasicVoices11:Play("l2n_b20")
	end
	BasicVoices11.g221 = function(self)
		BasicVoices11:Play("l2n_b21")
	end		
	BasicVoices11.g222 = function(self)
		BasicVoices11:Play("l2n_b22")
	end
	BasicVoices11.g223 = function(self)
		BasicVoices11:Play("l2n_b23")
	end
	BasicVoices11.g224 = function(self)
		BasicVoices11:Play("l2n_b24")
	end
	BasicVoices11.g225 = function(self)
		BasicVoices11:Play("l2n_b25")
	end
	BasicVoices11.g226 = function(self)
		BasicVoices11:Play("l2n_b26")
	end
	BasicVoices11.g227 = function(self)
		BasicVoices11:Play("l2n_b27")
	end
	BasicVoices11.g228 = function(self)
		BasicVoices11:Play("l2n_b28")
	end
	
	
	BasicVoices11.g3gun = function(self)
		BasicVoices11:Play("l3n_a01")
	end	
	BasicVoices11.g3close = function(self)
		BasicVoices11:Play("l3n_a02")
	end	
	BasicVoices11.g3staff = function(self)
		BasicVoices11:Play("l3n_a03")
	end	
	BasicVoices11.g3quiet = function(self)
		BasicVoices11:Play("l3n_a05")
	end
	BasicVoices11.g3idle = function(self)
		BasicVoices11:Play("l3n_a06")
	end	
	BasicVoices11.g3intruder = function(self)
		BasicVoices11:Play("l3n_a08")
	end		
	BasicVoices11.g3alarm = function(self)
		BasicVoices11:Play("l3n_a09")
	end	
	BasicVoices11.g3window = function(self)
		BasicVoices11:Play("l3n_a10")
	end	
	BasicVoices11.g3deadbody = function(self)
		BasicVoices11:Play("l3n_a11")
	end	
	BasicVoices11.g3deadofficer = function(self)
		BasicVoices11:Play("l3n_a12")
	end	
	BasicVoices11.g3tiedcivi = function(self)
		BasicVoices11:Play("l3n_a13")
	end	
	BasicVoices11.g3tiedofficer = function(self)
		BasicVoices11:Play("l3n_a14")
	end	
	BasicVoices11.g3situation = function(self)
		BasicVoices11:Play("l3n_a15")
	end	
	BasicVoices11.g3officerhelp = function(self)
		BasicVoices11:Play("l3n_a16")
	end	
	BasicVoices11.g3secdoor = function(self)
		BasicVoices11:Play("l3n_a17")
	end	
	BasicVoices11.g3fire = function(self)
		BasicVoices11:Play("l3n_a18")
	end	
	BasicVoices11.g3bodybag = function(self)
		BasicVoices11:Play("l3n_a19")
	end	
	BasicVoices11.g3sentry = function(self)
		BasicVoices11:Play("l3n_a20")
	end	
	BasicVoices11.g3mine = function(self)
		BasicVoices11:Play("l3n_a21")
	end	
	BasicVoices11.g3bag = function(self)
		BasicVoices11:Play("l3n_a22")
	end	
	BasicVoices11.g3intruders = function(self)
		BasicVoices11:Play("l3n_a23")
	end	
	BasicVoices11.g3pc = function(self)
		BasicVoices11:Play("l3n_a24")
	end	
	BasicVoices11.g3drill = function(self)
		BasicVoices11:Play("l3n_a25")
	end
	
	
	BasicVoices11.g4gun = function(self)
		BasicVoices11:Play("l4n_a01")
	end	
	BasicVoices11.g4close = function(self)
		BasicVoices11:Play("l4n_a02")
	end	
	BasicVoices11.g4staff = function(self)
		BasicVoices11:Play("l4n_a03")
	end	
	BasicVoices11.g4quiet = function(self)
		BasicVoices11:Play("l4n_a05")
	end
	BasicVoices11.g4idle = function(self)
		BasicVoices11:Play("l4n_a06")
	end	
	BasicVoices11.g4intruder = function(self)
		BasicVoices11:Play("l4n_a08")
	end		
	BasicVoices11.g4alarm = function(self)
		BasicVoices11:Play("l4n_a09")
	end	
	BasicVoices11.g4window = function(self)
		BasicVoices11:Play("l4n_a10")
	end	
	BasicVoices11.g4deadbody = function(self)
		BasicVoices11:Play("l4n_a11")
	end	
	BasicVoices11.g4deadofficer = function(self)
		BasicVoices11:Play("l4n_a12")
	end	
	BasicVoices11.g4tiedcivi = function(self)
		BasicVoices11:Play("l4n_a13")
	end	
	BasicVoices11.g4tiedofficer = function(self)
		BasicVoices11:Play("l4n_a14")
	end	
	BasicVoices11.g4situation = function(self)
		BasicVoices11:Play("l4n_a15")
	end	
	BasicVoices11.g4officerhelp = function(self)
		BasicVoices11:Play("l4n_a16")
	end	
	BasicVoices11.g4secdoor = function(self)
		BasicVoices11:Play("l4n_a17")
	end	
	BasicVoices11.g4fire = function(self)
		BasicVoices11:Play("l4n_a18")
	end	
	BasicVoices11.g4bodybag = function(self)
		BasicVoices11:Play("l4n_a19")
	end	
	BasicVoices11.g4sentry = function(self)
		BasicVoices11:Play("l4n_a20")
	end	
	BasicVoices11.g4mine = function(self)
		BasicVoices11:Play("l4n_a21")
	end	
	BasicVoices11.g4bag = function(self)
		BasicVoices11:Play("l4n_a22")
	end	
	BasicVoices11.g4intruders = function(self)
		BasicVoices11:Play("l4n_a23")
	end	
	BasicVoices11.g4pc = function(self)
		BasicVoices11:Play("l4n_a24")
	end	
	BasicVoices11.g4drill = function(self)
		BasicVoices11:Play("l4n_a25")
	end
	
	
	BasicVoices11.g5gun = function(self)
		BasicVoices11:Play("l5n_a01")
	end	
	BasicVoices11.g5close = function(self)
		BasicVoices11:Play("l5n_a02")
	end	
	BasicVoices11.g5staff = function(self)
		BasicVoices11:Play("l5n_a03")
	end	
	BasicVoices11.g5quiet = function(self)
		BasicVoices11:Play("l5n_a05")
	end
	BasicVoices11.g5idle = function(self)
		BasicVoices11:Play("l5n_a06")
	end	
	BasicVoices11.g5intruder = function(self)
		BasicVoices11:Play("l5n_a08")
	end		
	BasicVoices11.g5alarm = function(self)
		BasicVoices11:Play("l5n_a09")
	end	
	BasicVoices11.g5window = function(self)
		BasicVoices11:Play("l5n_a10")
	end	
	BasicVoices11.g5deadbody = function(self)
		BasicVoices11:Play("l5n_a11")
	end	
	BasicVoices11.g5deadofficer = function(self)
		BasicVoices11:Play("l5n_a12")
	end	
	BasicVoices11.g5tiedcivi = function(self)
		BasicVoices11:Play("l5n_a13")
	end	
	BasicVoices11.g5tiedofficer = function(self)
		BasicVoices11:Play("l5n_a14")
	end	
	BasicVoices11.g5situation = function(self)
		BasicVoices11:Play("l5n_a15")
	end	
	BasicVoices11.g5officerhelp = function(self)
		BasicVoices11:Play("l5n_a16")
	end	
	BasicVoices11.g5secdoor = function(self)
		BasicVoices11:Play("l5n_a17")
	end	
	BasicVoices11.g5fire = function(self)
		BasicVoices11:Play("l5n_a18")
	end	
	BasicVoices11.g5bodybag = function(self)
		BasicVoices11:Play("l5n_a19")
	end	
	BasicVoices11.g5sentry = function(self)
		BasicVoices11:Play("l5n_a20")
	end	
	BasicVoices11.g5mine = function(self)
		BasicVoices11:Play("l5n_a21")
	end	
	BasicVoices11.g5bag = function(self)
		BasicVoices11:Play("l5n_a22")
	end	
	BasicVoices11.g5intruders = function(self)
		BasicVoices11:Play("l5n_a23")
	end	
	BasicVoices11.g5pc = function(self)
		BasicVoices11:Play("l5n_a24")
	end	
	BasicVoices11.g5drill = function(self)
		BasicVoices11:Play("l5n_a25")
	end
-----------------------------------------------------
	MenuHelper:LoadFromJsonFile(BasicVoices11._path .. "menu.txt", BasicVoices11, BasicVoices11._data)
end)
