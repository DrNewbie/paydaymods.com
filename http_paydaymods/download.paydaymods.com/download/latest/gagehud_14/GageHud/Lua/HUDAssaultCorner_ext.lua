if not mod_collection then
	return
end
local assault_texts = {
	"SNAKE IN PROGRESS",
	"WOW THERE ARE SO MANY HUMANS! - RUMIA",
	"DO YOU NEED A LIFE? - DAIYOUSEI",
	"THERE'S WAY TOO MANY!! - CIRNO",
	"IF I CAN PUNCH OUT A CLOAKER, SO CAN YOU! - HONG MEILING",
	"PLEASE WATCH YOUR HEAD - KOAKUMA",
	"REFRAIN FROM TAKING ANY BOOKS - PATCHOULI KNOWLEDGE",
	"THE SLOW MOTION ONLY AFFECTS YOU - SAKUYA IZAYOI",
	"HOW DOES THIS EVEN WORK, SAKUYA? - REMILIA SCARLET",
	"YOU DON'T SEEM LIKE YOU'LL BREAK AS EASY AS THE REST OF MY TOYS - FLANDRE SCARLET",
	"THERE ISN'T MUCH TO SAY - LETTY WHITEROCK",
	"I ROLLED INTO A TREE ONCE - CHEN",
	"YOU NEED MORE COLOURS - ALICE MARGATROID",
	"IT'S SPRING! - LILY WHITE",
	"NO IT'S NOT - LILY BLACK",
	"YOU WANT ME TO WHAT WITH THE KITCHEN KNIFE? - LUNASA PRISMRIVER",
	"SCARE CHORDS? - LYRICA PRISMRIVER",
	"CAN I THROW IT AT YOU? - MERLIN PRISMRIVER",
	"SLOWLY, THESE WEEDS SHALL DISAPPEAR! - YOUMU KONPAKU",
	"ANOTHER PEACEFUL DAY... - YUYUKO SAIGYOUJI",
	"CHEN? - RAN YAKUMO",
	"I HAPPENED TO FIND THESE. - YUKARI YAKUMO",
	"DID YOU SAY ANOTHER GATHERING? - SUIKA IBUKI",
	"GIVE THEM A KICK! - WRIGGLE NIGHTBUG",
	"I CAN'T HELP YOU WITH THOSE FLASHBANGS - MYSTIA LORELEI",
	"NO I WON'T. - KEINE KAMISHIRASAWA",
	"HEY WANNA GET RICH? - TEWI",
	"MY EYES DON'T WORK ON THOSE GOGGLES - REISEN UDONGEIN INABA",
	"EIENTEI IS ALWAYS OPEN - EIRIN YAGOKORO",
	"I WANT A TURN - KAGUYA HOURAISAN",
	"HOW MANY LIVES DO YOU HAVE? - MOKOU FUJIWARA",
	"HERE FOR THE DIRT! - AYA SHAMEIMARU",
	"POISON? SURE! - MEDICINE MELANCHOLY",
	"I HOPE YOU HAVEN'T BURNT ANY FLOWERS - YUUKA KAZAMI",
	"OUT OF AMMO? THROW COINS! - KOMACHI ONOZUKA",
	"HOW DID YOU EVEN GET HERE? - SHIKI EIKI",
	"YOU WHAT? - HATATE HIMEKAIDOU",
	"OH EXCUSE ME - SHIZUHA AKI",
	"WOW I SMELL DELICIOUS TODAY - MINORIKO AKI",
	"DID YOU NEED THAT MISFORTUNE? - HINA KAGIYAMA",
	"I CAN MAKE SOMETHING BETTER! - NITORI KAWASHIRO",
	"HOW DID YOU GET THIS FAR UP? - MOMIJI INUBASHIRI",
	"WELCOME TO THE MORIYA TEMPLE - SANAE KOCHIYA",
	"ANOTHER CHALLENGER? - KANAKO YASAKA",
	"HIYA - SUWAKO MORIYA",
	"DO THAT AGAIN! - TENSHI HINANAWI",
	"STUN THEM? IT SEEMS TO ME THAT YOU'RE FINE.- IKU NAGAE",
	"... - KISUME",
	"NO WEBS FOR YOU - YAMAME KURODANI",
	"KEEP THEM OFF MY BRIDGE - PARSEE MIZUHASHI",
	"HEY LET'S DRINK AFTER THIS! - YUUGI HOSHIGUMA",
	"I... SEE - SATORI KOMEIJI",
	"WHOA LOOK AT ALL THESE DEAD BODIES - RIN KAENBYOU",
	"DO THIS AND THIS AND... DONE - UTSUHOU REIUJI",
	"HELLO - KOISHI KOMEIJI",
	"I SEEM TO HAVE TAKEN THE WRONG TURN - NAZRIN",
	"BOO! - KOGASA TATARA",
	"UNZAN WHERE ARE MY RINGS? - ICHIRIN KUMOI",
	"WHOOPS - MURASA MINAMITSU",
	"NOW WHAT WAS I DOING? - SHOU TORAMARU",
	"WELCOME TO MYOURENJI TEMPLE - BYAKUREN HIJIRI",
	"HAVING FUN I SEE - NUE HOUJUU",
	"HOW MANY HUMANS CAN WE TRAP SUNNY? - LUNA CHILD",
	"FORGET THEM! LET'S GO FOR THE SHRINE MAIDEN! - SUNNY MILK",
	"I'LL GET THE BAND-AIDS - STAR SAPPHIRE",
	"ECHO! - KYOUKO KASODANI",
	"OH WHY HELLO - YOSHIKA MIYAKO",
	"LEAVE MY HAIRPIN ALONE - SEIGA KAKU",
	"YOU CAN'T SEE YOUR LEGS TOO? - TOJIKO SOGA",
	"WHERE'S THAT DAMN SEIJA?! - FUTO MONONOBE",
	"WHERE'D KOKORO GO? - MIKO TOYOSATOMIMI",
	"INTERESTING - MAMIZOU FUTATSUIWA",
	"YOU CAME TO SEE ME? - WAKASAGIHIME",
	"LET GO OF THE CAPE - SEKIBANKI",
	"I'D RATHER NOT SCRATCH YOU - KAGEROU IMAIZUMI",
	"PLEASE KEEP YATSUHASHI IN CHECK - BENBEN TSUKUMO",
	"TAKE HIM OUT TOO! - YATSUHASHI TSUKUMO",
	"GOING FOR THAT PERFECT AIM? WHOOPS MY BAD - SEIJA KIJIN",
	"TAKE MY NEEDLE! - SHINMYOUMARU SUKUNA",
	"ONE, TWO, ONE, TWO - RAIKO HORIKAWA",
	"REIMU STOP RUNNING! - KASEN IBARAKI",
	"IT'S HOOOOT - RENKO USAMI",
	"IT IS INDEED... - MARIBEL HEARN",
	"BACK TO SLEEP! - SUMIREKO USAMI",
	"ANOTHER INCIDENT? - REIMU HAKUREI",
	"MOVE BITCH GET OUT THE WAY - MARISA KIRISAME",
	"THE CAKE IS A LIE!",
	"THE DESYNC IS REAL!",
	"I GOT YOUR DLC RIGHT HERE!",
	"WAR. WAR NEVER CHANGES.",
	"M-M-M-M-MONSTERKILL!!!",
	"PREPARE FOR UNFORESEEN CONSEQUENCES.",
	"I AM ERROR.",
	"YOU WERE ALMOST A JILL SANDWICH!",
	"IT'S TIME TO KICK ASS AND CHEW BUBBLE GUM, AND I'M ALL OUT OF GUM!",
	"WELCOME TO QUAKE 3 ARENA. ENTER THE PORTAL TO BEGIN COMBAT.",
	"ITS'A ME, MARIO!",
	"THAT'S THE SECOND BIGGEST MONKEY HEAD I'VE EVER SEEN!",
	"ALL YOUR BASE ARE BELONG TO US!",
	"DO A BARREL ROLL!",
	"FUS-RO-DAH!",
	"DID I EVER TELL YOU THE DEFINITION OF INSANITY?",
	"WAKKA WAKKA!",
	"THE PRESIDENT HAS BEEN KIDNAPPED BY NINJAS.",
	"NUCLEAR LAUNCH DETECTED.",
	"FINISH HIM!!",
	"FIRST BLOOD!",
	"THANK YOU MARIO! BUT OUR PRINCESS IS IN ANOTHER CASTLE!",
	"STAY A WHILE, AND LISTEN.",
	"WOULD YOU KINDLY?",
	"NEVER PAY MORE THAN 20 BUCKS FOR A COMPUTER GAME.",
	"RISE AND SHINE, MR. FREEMAN. RISE... AND... SHINE.",
	"THE RIGHT MAN IN THE WRONG PLACE CAN MAKE ALL THE DIFFERENCE IN THE WORLD.",
	"WELCOME TO WARP ZONE!",
	"FLAWLESS VICTORY!",
	"THIS IS IT. THIS IS YOUR STORY. IT ALL BEGINS HERE.",
	"CONGRATULATION!!! YOU HAVE COMPLETED A GREAT GAME.",
	"I AM THE GREAT MIGHTY POO AND I'M GOING TO THROW MY SHIT AT YOU!",
	"I USED TO BE AN ADVENTURER LIKE YOU, BUT THEN I TOOK AN ARROW IN THE KNEE.",
	"YOU HAVE DIED OF DYSENTERY.",
	"CONGRATULATION. THIS STORY IS HAPPY END.",
	"A WINNER IS YOU!",
	"KILLTACULAR!",
	"A MAN CHOOSES. A SLAVE OBEYS. OBEY!",
	"SNAKE? SNAAAAAAAAAAAAAAKE?!",
	"E! A! SPORTS! IT'S IN THE GAME!",
	"WAITWAITWAIT! THAT'S NOT HOW IT HAPPENED.",
	"HEY! LISTEN!",
	"WASTED!",
	"X-MEN, WELCOME TO DIE!",
	"EXPLOSIONS?!?!?!?!",
	"SIZE DOESN'T MATTER. EXCEPT WHEN IT DOES. WHICH IS ALWAYS.",
	"YIPPEE KI-YAY, MOTHERFUCKER!",
	"I WILL KILL YOUR DICKS!",
	"C-C-C-COMBO BREAKER!",
	"WAR HAS CHANGED.",
	"HEY DUDES THANKS, FOR RESCUING ME. LET'S GO FOR A BURGER...HA! HA! HA! HA!",
	"REQUIESCAT IN PACE!",
	"AREEEEEEEEEEEEES!!!!!!!",
	"JOB'S DONE.",
	"IT'S DANGEROUS TO GO ALONE! TAKE THIS.",
	"WELCOME TO SUMMONERS RIFT.",
	"YOUR FACE. YOUR ASS. WHAT'S THE DIFFERENCE?",
	"YOU'RE AN INSPIRATION FOR BIRTH CONTROL!",
	"TWINKLE, TWINKLE, LITTLE BAT. WATCH ME KILL YOUR FAVORITE CAT.",
	"ENDURE AND SURVIVE.",
	"A HERO NEED NOT SPEAK. WHEN HE IS GONE, THE WORLD WILL SPEAK FOR HIM.",
	"YOU AND YOUR FRIENDS ARE DEAD!",
	"GAME OVER!",
	"I FELL ASLEEP!!",
	"GOTTA CATCH 'EM ALL!",
	"QUAD DAMAGE!",
	"OH LOOK, ANOTHER VISITOR. STAY AWHILE... STAY FOREVER!",
}
Chance = 40
CloneClass(HUDAssaultCorner)
function HUDAssaultCorner:init(...)
	self.orig.init(self, ...)
	assault_panel = self._hud_panel:child("assault_panel")
	buffs_panel = self._hud_panel:child("buffs_panel")
	assault_panel:set_center(self._hud_panel:center())	
	assault_panel:set_top(0)
	buffs_panel:set_x(assault_panel:left() + self._bg_box:left() - 203)
	self._vip_bg_box:child("vip_icon"):set_center(self._vip_bg_box:w() / 2, self._vip_bg_box:h() / 2)
	if self._hud_panel:child("hostages_panel") then
		self:_hide_hostages()
	end
end

function HUDAssaultCorner:set_control_info(...) 
end
function HUDAssaultCorner:show_casing(...)
end
function HUDAssaultCorner:hide_casing(...)
end
function HUDAssaultCorner:_show_hostages()
end
function HUDAssaultCorner:_animate_text(text_panel, bg_box, color, color_function)
	local text_list = bg_box or self._bg_box:script().text_list
	local text_index = 0
	local texts = {}
	local padding = 10
	local function create_new_text(text_panel, text_list, text_index, texts)
		if texts[text_index] and texts[text_index].text then
			text_panel:remove(texts[text_index].text)
			texts[text_index] = nil
		end
		if math.random(Chance) < 10 then
			randomstring = assault_texts[math.random(#assault_texts)]
		else
			randomstring = nil
		end

		local text_id = text_list[text_index]
		local text_string = ""
		if type(text_id) == "string" then

		if randomstring ~= nil and text_id ~= managers.localization:to_upper_text("hud_assault_end_line") then
			text_string = string.upper(randomstring)
			else
			text_string = managers.localization:to_upper_text(text_id)
			end
		elseif text_id == Idstring("risk") then
			for i = 1, managers.job:current_difficulty_stars() do
			if randomstring ~= nil and text_id ~= managers.localization:to_upper_text("hud_assault_end_line") and text_panel ~= self._casing_bg_box then
				text_string = string.upper(randomstring)
				else
				text_string = text_string .. managers.localization:get_default_macro("BTN_SKULL")
			end
			end
		end
		local mod_color = color_function and color_function() or color or self._assault_color
		local text = text_panel:text({
			text = text_string,
			layer = 1,
			align = "center",
			vertical = "center",
			blend_mode = "normal",
			color = mod_color,
			font_size = tweak_data.hud_corner.assault_size,
			font = tweak_data.hud_corner.assault_font,
			w = 10,
			h = 10
		})
		local _, _, w, h = text:text_rect()
		text:set_size(w, h)
		texts[text_index] = {
			x = text_panel:w() + w * 0.5 + padding * 2,
			text = text
		}
	end
	while true do
		local dt = coroutine.yield()
		local last_text = texts[text_index]
		if last_text and last_text.text then
			if last_text.x + last_text.text:w() * 0.5 + padding < text_panel:w() then
				text_index = text_index % #text_list + 1
				create_new_text(text_panel, text_list, text_index, texts)
			end
		else
			text_index = text_index % #text_list + 1
			create_new_text(text_panel, text_list, text_index, texts)
		end
		local speed = 90
		for i, data in pairs(texts) do
			if data.text then
				data.x = data.x - dt * speed
				data.text:set_center_x(data.x)
				data.text:set_center_y(text_panel:h() * 0.5)
				if 0 > data.x + data.text:w() * 0.5 then
					text_panel:remove(data.text)
					data.text = nil
				end
			end
		end
	end
end
