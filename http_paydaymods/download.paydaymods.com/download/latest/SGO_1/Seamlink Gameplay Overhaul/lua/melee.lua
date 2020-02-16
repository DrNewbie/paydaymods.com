if not SGO or not SGO.settings.use_melee then return end
local _init_melee_weapons_actual = BlackMarketTweakData._init_melee_weapons
function BlackMarketTweakData:_init_melee_weapons(...)
_init_melee_weapons_actual(self, ...)
--Default
--Weapon BUTT <3
self.melee_weapons.weapon.stats.min_damage = 90
self.melee_weapons.weapon.stats.min_damage_effect = 1
self.melee_weapons.weapon.stats.max_damage_effect =  60
self.melee_weapons.weapon.stats.range = 200
self.melee_weapons.weapon.repeat_expire_t = 0.3
--Fists
self.melee_weapons.fists.stats.min_damage = 80
self.melee_weapons.fists.stats.max_damage = 120
self.melee_weapons.fists.stats.min_damage_effect = 1
self.melee_weapons.fists.stats.max_damage_effect =  60
self.melee_weapons.fists.repeat_expire_t = 0.3
--Long / heavy blades
--Katana
self.melee_weapons.sandsteel.stats.min_damage = 90
self.melee_weapons.sandsteel.stats.max_damage = 120
--Greatsword
self.melee_weapons.great.stats.min_damage = 90
self.melee_weapons.great.stats.max_damage = 120
self.melee_weapons.great.anim_global_param = "melee_sandsteel"
self.melee_weapons.great.repeat_expire_t = 0.5
self.melee_weapons.great.melee_damage_delay = 0.1
self.melee_weapons.great.stats.range = 300
--Fireaxe
self.melee_weapons.fireaxe.stats.min_damage = 90
self.melee_weapons.fireaxe.stats.max_damage = 120
--Brass knuckles
self.melee_weapons.brass_knuckles.stats.min_damage = 80
self.melee_weapons.brass_knuckles.stats.max_damage = 90
self.melee_weapons.brass_knuckles.stats.min_damage_effect = 1
self.melee_weapons.brass_knuckles.stats.max_damage_effect =  60

--Cloaker's Baton
self.melee_weapons.baton.stats.min_damage = 90
self.melee_weapons.baton.stats.max_damage = 120
self.melee_weapons.baton.stats.min_damage_effect = 1
self.melee_weapons.baton.stats.max_damage_effect =  60
--POLICE BRUTALITY--

--Boxing Gloves
self.melee_weapons.boxing_gloves.stats.min_damage = 80
self.melee_weapons.boxing_gloves.stats.max_damage = 60
self.melee_weapons.boxing_gloves.stats.min_damage_effect = 1
self.melee_weapons.boxing_gloves.stats.max_damage_effect =  60

--Ding Dong Breaching Tool
self.melee_weapons.dingdong.stats.min_damage = 90
self.melee_weapons.dingdong.stats.max_damage = 120
self.melee_weapons.dingdong.stats.min_damage_effect = 1
self.melee_weapons.dingdong.stats.max_damage_effect =  60

--Money Bundle
self.melee_weapons.moneybundle.stats.min_damage = 40
self.melee_weapons.moneybundle.stats.max_damage = 90
self.melee_weapons.moneybundle.stats.min_damage_effect = 1
self.melee_weapons.moneybundle.stats.max_damage_effect =  60

--Shovel FUK
self.melee_weapons.shovel.stats.min_damage = 90
self.melee_weapons.shovel.stats.max_damage = 120
self.melee_weapons.shovel.stats.min_damage_effect = 1
self.melee_weapons.shovel.stats.max_damage_effect =  60

--Alien Maul
self.melee_weapons.alien_maul.stats.min_damage = 90
self.melee_weapons.alien_maul.stats.max_damage = 120
self.melee_weapons.alien_maul.stats.min_damage_effect = 1
self.melee_weapons.alien_maul.stats.max_damage_effect = 1
self.melee_weapons.alien_maul.anim_global_param = "melee_sandsteel"
self.melee_weapons.alien_maul.repeat_expire_t = 0.5
self.melee_weapons.alien_maul.melee_damage_delay = 0.1
self.melee_weapons.alien_maul.stats.range = 300

--Baseball Bat HLM DLC
self.melee_weapons.baseballbat.stats.min_damage = 90
self.melee_weapons.baseballbat.stats.max_damage = 120
self.melee_weapons.baseballbat.stats.min_damage_effect = 1
self.melee_weapons.baseballbat.stats.max_damage_effect = 1
self.melee_weapons.baseballbat.anim_global_param = "melee_sandsteel"
self.melee_weapons.baseballbat.repeat_expire_t = 0.5
self.melee_weapons.baseballbat.melee_damage_delay = 0.1
self.melee_weapons.baseballbat.stats.range = 300

--Bat with wires
self.melee_weapons.barbedwire.stats.min_damage = 90
self.melee_weapons.barbedwire.stats.max_damage = 120
self.melee_weapons.barbedwire.stats.min_damage_effect = 1
self.melee_weapons.barbedwire.stats.max_damage_effect = 10
self.melee_weapons.barbedwire.anim_global_param = "melee_sandsteel"
self.melee_weapons.barbedwire.repeat_expire_t = 0.5
self.melee_weapons.barbedwire.melee_damage_delay = 0.1
self.melee_weapons.barbedwire.stats.range = 300

--Briefcase
self.melee_weapons.briefcase.stats.min_damage = 80
self.melee_weapons.briefcase.stats.max_damage = 120
self.melee_weapons.briefcase.stats.min_damage_effect = 1
self.melee_weapons.briefcase.stats.max_damage_effect = 1
--self.melee_weapons.briefcase.anim_global_param = "melee_sandsteel"
self.melee_weapons.briefcase.repeat_expire_t = 0.5
self.melee_weapons.briefcase.melee_damage_delay = 0.1
self.melee_weapons.barbedwire.stats.range = 300

--Tomahawk Shotgun pack
self.melee_weapons.tomahawk.stats.min_damage = 80
self.melee_weapons.tomahawk.stats.max_damage = 120
self.melee_weapons.tomahawk.stats.min_damage_effect = 1
self.melee_weapons.tomahawk.stats.max_damage_effect = 1
--self.melee_weapons.tomahawk.anim_global_param = "melee_sandsteel"
--self.melee_weapons.tomahawk.repeat_expire_t = 0.5
--self.melee_weapons.tomahawk.melee_damage_delay = 0.1
self.melee_weapons.tomahawk.stats.range = 200

-- Hammer HLM2
self.melee_weapons.hammer.stats.min_damage = 80
self.melee_weapons.hammer.stats.max_damage = 120
self.melee_weapons.hammer.stats.min_damage_effect = 1
self.melee_weapons.hammer.stats.max_damage_effect = 1
--self.melee_weapons.hammer.anim_global_param = "melee_sandsteel"
self.melee_weapons.hammer.repeat_expire_t = 0.5
self.melee_weapons.hammer.melee_damage_delay = 0.1
self.melee_weapons.hammer.stats.range = 200

--Machete Hotline Miami
self.melee_weapons.machete.stats.min_damage = 80
self.melee_weapons.machete.stats.max_damage = 120
self.melee_weapons.machete.stats.min_damage_effect = 1
self.melee_weapons.machete.stats.max_damage_effect = 1
self.melee_weapons.machete.repeat_expire_t = 0.5
self.melee_weapons.machete.melee_damage_delay = 0.1
self.melee_weapons.machete.stats.range = 200

--Talons ninja
self.melee_weapons.tiger.stats.min_damage = 50
self.melee_weapons.tiger.stats.max_damage = 120
self.melee_weapons.tiger.stats.min_damage_effect = 1
self.melee_weapons.tiger.stats.max_damage_effect = 1
self.melee_weapons.tiger.repeat_expire_t = 0.5
self.melee_weapons.tiger.melee_damage_delay = 0.1
self.melee_weapons.tiger.stats.range = 200

--Kunai Knife ninja
self.melee_weapons.cqc.stats.min_damage = 80
self.melee_weapons.cqc.stats.max_damage = 120
self.melee_weapons.cqc.stats.min_damage_effect = 1
self.melee_weapons.cqc.stats.max_damage_effect = 1

--IcePick
self.melee_weapons.iceaxe.stats.min_damage = 90
self.melee_weapons.iceaxe.stats.max_damage = 120
self.melee_weapons.iceaxe.stats.min_damage_effect = 1
self.melee_weapons.iceaxe.stats.max_damage_effect = 1
self.melee_weapons.iceaxe.repeat_expire_t = 0.5
self.melee_weapons.iceaxe.melee_damage_delay = 0.1
self.melee_weapons.iceaxe.stats.range = 200

-- Selfie Stick
self.melee_weapons.selfie.stats.min_damage = 80
self.melee_weapons.selfie.stats.max_damage = 120
self.melee_weapons.selfie.stats.min_damage_effect = 1
self.melee_weapons.selfie.stats.max_damage_effect = 1
self.melee_weapons.selfie.stats.range = 200

--Whiskey bottle
self.melee_weapons.whiskey.stats.min_damage = 80
self.melee_weapons.whiskey.stats.max_damage = 120
self.melee_weapons.whiskey.stats.min_damage_effect = 1
self.melee_weapons.whiskey.stats.max_damage_effect = 1
self.melee_weapons.whiskey.stats.range = 200

--Chain Wip
self.melee_weapons.road.stats.min_damage = 90
self.melee_weapons.road.stats.max_damage = 120
self.melee_weapons.road.stats.min_damage_effect = 1
self.melee_weapons.road.stats.max_damage_effect = 1
--self.melee_weapons.briefcase.anim_global_param = "melee_sandsteel"
self.melee_weapons.road.repeat_expire_t = 0.7
--self.melee_weapons.road.melee_damage_delay = 0.1
self.melee_weapons.road.stats.range = 400

--Adding! fuck me! this is so long goddamnit-- 

self.melee_weapons.ballistic.stats.min_damage = 90
self.melee_weapons.ballistic.stats.max_damage = 120
self.melee_weapons.ballistic.stats.min_damage_effect = 1
self.melee_weapons.ballistic.stats.max_damage_effect = 1
--self.melee_weapons.ballistic.anim_global_param = "melee_sandsteel"
self.melee_weapons.ballistic.repeat_expire_t = 0.5
self.melee_weapons.ballistic.melee_damage_delay = 0.1
self.melee_weapons.ballistic.stats.range = 200

self.melee_weapons.cutters.stats.min_damage = 90
self.melee_weapons.cutters.stats.max_damage = 120
self.melee_weapons.cutters.stats.min_damage_effect = 1
self.melee_weapons.cutters.stats.max_damage_effect = 1
--self.melee_weapons.cutters.anim_global_param = "melee_sandsteel"
self.melee_weapons.cutters.repeat_expire_t = 0.5
self.melee_weapons.cutters.melee_damage_delay = 0.1
self.melee_weapons.cutters.stats.range = 200

self.melee_weapons.boxcutter.stats.min_damage = 90
self.melee_weapons.boxcutter.stats.max_damage = 120
self.melee_weapons.boxcutter.stats.min_damage_effect = 1
self.melee_weapons.boxcutter.stats.max_damage_effect = 1
--self.melee_weapons.boxcutter.anim_global_param = "melee_sandsteel"
self.melee_weapons.boxcutter.repeat_expire_t = 0.5
self.melee_weapons.boxcutter.melee_damage_delay = 0.1
self.melee_weapons.boxcutter.stats.range = 200

self.melee_weapons.toothbrush.stats.min_damage = 90
self.melee_weapons.toothbrush.stats.max_damage = 120
self.melee_weapons.toothbrush.stats.min_damage_effect = 1
self.melee_weapons.toothbrush.stats.max_damage_effect = 1
--self.melee_weapons.toothbrush.anim_global_param = "melee_sandsteel"
self.melee_weapons.toothbrush.repeat_expire_t = 0.5
self.melee_weapons.toothbrush.melee_damage_delay = 0.1
self.melee_weapons.toothbrush.stats.range = 200

self.melee_weapons.chef.stats.min_damage = 90
self.melee_weapons.chef.stats.max_damage = 120
self.melee_weapons.chef.stats.min_damage_effect = 1
self.melee_weapons.chef.stats.max_damage_effect = 1
--self.melee_weapons.chef.anim_global_param = "melee_sandsteel"
self.melee_weapons.chef.repeat_expire_t = 0.5
self.melee_weapons.chef.melee_damage_delay = 0.1
self.melee_weapons.chef.stats.range = 200

self.melee_weapons.kabartanto.stats.min_damage = 90
self.melee_weapons.kabartanto.stats.max_damage = 120
self.melee_weapons.kabartanto.stats.min_damage_effect = 1
self.melee_weapons.kabartanto.stats.max_damage_effect = 1
--self.melee_weapons.kabartanto.anim_global_param = "melee_sandsteel"
self.melee_weapons.kabartanto.repeat_expire_t = 0.5
self.melee_weapons.kabartanto.melee_damage_delay = 0.1
self.melee_weapons.kabartanto.stats.range = 200

--Utility machete 
self.melee_weapons.becker.stats.min_damage = 90
self.melee_weapons.becker.stats.max_damage = 120
self.melee_weapons.becker.stats.min_damage_effect = 1
self.melee_weapons.becker.stats.max_damage_effect = 1
--self.melee_weapons.becker.anim_global_param = "melee_sandsteel"
self.melee_weapons.becker.repeat_expire_t = 0.5
self.melee_weapons.becker.melee_damage_delay = 0.1
self.melee_weapons.becker.stats.range = 200

--knife
self.melee_weapons.x46.stats.min_damage = 90
self.melee_weapons.x46.stats.max_damage = 120
self.melee_weapons.x46.stats.min_damage_effect = 1
self.melee_weapons.x46.stats.max_damage_effect = 1
--self.melee_weapons.x46.anim_global_param = "melee_sandsteel"
self.melee_weapons.x46.repeat_expire_t = 0.5
self.melee_weapons.x46.melee_damage_delay = 0.1
self.melee_weapons.x46.stats.range = 200

--compact hatchet
self.melee_weapons.bullseye.stats.min_damage = 90
self.melee_weapons.bullseye.stats.max_damage = 120
self.melee_weapons.bullseye.stats.min_damage_effect = 1
self.melee_weapons.bullseye.stats.max_damage_effect = 1
--self.melee_weapons.bullseye.anim_global_param = "melee_sandsteel"
self.melee_weapons.bullseye.repeat_expire_t = 0.5
self.melee_weapons.bullseye.melee_damage_delay = 0.1
self.melee_weapons.bullseye.stats.range = 200

self.melee_weapons.bayonet.stats.min_damage = 90
self.melee_weapons.bayonet.stats.max_damage = 120
self.melee_weapons.bayonet.stats.min_damage_effect = 1
self.melee_weapons.bayonet.stats.max_damage_effect = 1
--self.melee_weapons.bayonet.anim_global_param = "melee_sandsteel"
self.melee_weapons.bayonet.repeat_expire_t = 0.5
self.melee_weapons.bayonet.melee_damage_delay = 0.1
self.melee_weapons.bayonet.stats.range = 200

-- krieger blade
self.melee_weapons.kampfmesser.stats.min_damage = 90
self.melee_weapons.kampfmesser.stats.max_damage = 120
self.melee_weapons.kampfmesser.stats.min_damage_effect = 1
self.melee_weapons.kampfmesser.stats.max_damage_effect = 1
--self.melee_weapons.kampfmesser.anim_global_param = "melee_sandsteel"
self.melee_weapons.kampfmesser.repeat_expire_t = 0.5
self.melee_weapons.kampfmesser.melee_damage_delay = 0.1
self.melee_weapons.kampfmesser.stats.range = 200

--Trautman knife
self.melee_weapons.rambo.stats.min_damage = 90
self.melee_weapons.rambo.stats.max_damage = 120
self.melee_weapons.rambo.stats.min_damage_effect = 1
self.melee_weapons.rambo.stats.max_damage_effect = 1
--self.melee_weapons.rambo.anim_global_param = "melee_sandsteel"
self.melee_weapons.rambo.repeat_expire_t = 0.5
self.melee_weapons.rambo.melee_damage_delay = 0.1
self.melee_weapons.rambo.stats.range = 200

self.melee_weapons.gerber.stats.min_damage = 90
self.melee_weapons.gerber.stats.max_damage = 120
self.melee_weapons.gerber.stats.min_damage_effect = 1
self.melee_weapons.gerber.stats.max_damage_effect = 1
--self.melee_weapons.gerber.anim_global_param = "melee_sandsteel"
self.melee_weapons.gerber.repeat_expire_t = 0.5
self.melee_weapons.gerber.melee_damage_delay = 0.1
self.melee_weapons.gerber.stats.range = 200

self.melee_weapons.kabar.stats.min_damage = 90
self.melee_weapons.kabar.stats.max_damage = 120
self.melee_weapons.kabar.stats.min_damage_effect = 1
self.melee_weapons.kabar.stats.max_damage_effect = 1
--self.melee_weapons.kabar.anim_global_param = "melee_sandsteel"
self.melee_weapons.kabar.repeat_expire_t = 0.5
self.melee_weapons.kabar.melee_damage_delay = 0.1
self.melee_weapons.kabar.stats.range = 200

self.melee_weapons.cleaver.stats.min_damage = 90
self.melee_weapons.cleaver.stats.max_damage = 120
self.melee_weapons.cleaver.stats.min_damage_effect = 1
self.melee_weapons.cleaver.stats.max_damage_effect = 1
--self.melee_weapons.cleaver.anim_global_param = "melee_sandsteel"
self.melee_weapons.cleaver.repeat_expire_t = 0.5
self.melee_weapons.cleaver.melee_damage_delay = 0.1
self.melee_weapons.cleaver.stats.range = 200

--potato masher

self.melee_weapons.model24.stats.min_damage = 90
self.melee_weapons.model24.stats.max_damage = 120
self.melee_weapons.model24.stats.min_damage_effect = 1
self.melee_weapons.model24.stats.max_damage_effect = 1
--self.melee_weapons.model24.anim_global_param = "melee_sandsteel"
self.melee_weapons.model24.repeat_expire_t = 0.5
self.melee_weapons.model24.melee_damage_delay = 0.1
self.melee_weapons.model24.stats.range = 200

--Trench knife
self.melee_weapons.fairbair.stats.min_damage = 90
self.melee_weapons.fairbair.stats.max_damage = 120
self.melee_weapons.fairbair.stats.min_damage_effect = 1
self.melee_weapons.fairbair.stats.max_damage_effect = 1
--self.melee_weapons.fairbair.anim_global_param = "melee_sandsteel"
self.melee_weapons.fairbair.repeat_expire_t = 0.5
self.melee_weapons.fairbair.melee_damage_delay = 0.1
self.melee_weapons.fairbair.stats.range = 200

self.melee_weapons.freedom.stats.min_damage = 90
self.melee_weapons.freedom.stats.max_damage = 120
self.melee_weapons.freedom.stats.min_damage_effect = 1
self.melee_weapons.freedom.stats.max_damage_effect = 1
--self.melee_weapons.freedom.anim_global_param = "melee_sandsteel"
self.melee_weapons.freedom.repeat_expire_t = 0.5
self.melee_weapons.freedom.melee_damage_delay = 0.1
self.melee_weapons.freedom.stats.range = 200

self.melee_weapons.swagger.stats.min_damage = 90
self.melee_weapons.swagger.stats.max_damage = 120
self.melee_weapons.swagger.stats.min_damage_effect = 1
self.melee_weapons.swagger.stats.max_damage_effect = 1
--self.melee_weapons.swagger.anim_global_param = "melee_sandsteel"
self.melee_weapons.swagger.repeat_expire_t = 0.5
self.melee_weapons.swagger.melee_damage_delay = 0.1
self.melee_weapons.swagger.stats.range = 200

self.melee_weapons.shillelagh.stats.min_damage = 90
self.melee_weapons.shillelagh.stats.max_damage = 120
self.melee_weapons.shillelagh.stats.min_damage_effect = 1
self.melee_weapons.shillelagh.stats.max_damage_effect = 1
--self.melee_weapons.shillelagh.anim_global_param = "melee_sandsteel"
self.melee_weapons.shillelagh.repeat_expire_t = 0.5
self.melee_weapons.shillelagh.melee_damage_delay = 0.1
self.melee_weapons.shillelagh.stats.range = 200

--Dragan Cleaver market
self.melee_weapons.meat_cleaver.stats.min_damage = 90
self.melee_weapons.meat_cleaver.stats.max_damage = 120
self.melee_weapons.meat_cleaver.stats.min_damage_effect = 1
self.melee_weapons.meat_cleaver.stats.max_damage_effect = 1
--self.melee_weapons.meat_cleaver.anim_global_param = "melee_sandsteel"
self.melee_weapons.meat_cleaver.repeat_expire_t = 0.5
self.melee_weapons.meat_cleaver.melee_damage_delay = 0.1
self.melee_weapons.meat_cleaver.stats.range = 200

self.melee_weapons.poker.stats.min_damage = 90
self.melee_weapons.poker.stats.max_damage = 120
self.melee_weapons.poker.stats.min_damage_effect = 1
self.melee_weapons.poker.stats.max_damage_effect = 1
--self.melee_weapons.poker.anim_global_param = "melee_sandsteel"
self.melee_weapons.poker.repeat_expire_t = 0.5
self.melee_weapons.poker.melee_damage_delay = 0.1
self.melee_weapons.poker.stats.range = 200

self.melee_weapons.spatula.stats.min_damage = 90
self.melee_weapons.spatula.stats.max_damage = 120
self.melee_weapons.spatula.stats.min_damage_effect = 1
self.melee_weapons.spatula.stats.max_damage_effect = 1
--self.melee_weapons.spatula.anim_global_param = "melee_sandsteel"
self.melee_weapons.spatula.repeat_expire_t = 0.5
self.melee_weapons.spatula.melee_damage_delay = 0.1
self.melee_weapons.spatula.stats.range = 200

self.melee_weapons.tenderizer.stats.min_damage = 90
self.melee_weapons.tenderizer.stats.max_damage = 120
self.melee_weapons.tenderizer.stats.min_damage_effect = 1
self.melee_weapons.tenderizer.stats.max_damage_effect = 1
--self.melee_weapons.tenderizer.anim_global_param = "melee_sandsteel"
self.melee_weapons.tenderizer.repeat_expire_t = 0.5
self.melee_weapons.tenderizer.melee_damage_delay = 0.1
self.melee_weapons.tenderizer.stats.range = 200

self.melee_weapons.fork.stats.min_damage = 90
self.melee_weapons.fork.stats.max_damage = 120
self.melee_weapons.fork.stats.min_damage_effect = 1
self.melee_weapons.fork.stats.max_damage_effect = 1
--self.melee_weapons.fork.anim_global_param = "melee_sandsteel"
self.melee_weapons.fork.repeat_expire_t = 0.5
self.melee_weapons.fork.melee_damage_delay = 0.1
self.melee_weapons.fork.stats.range = 200

self.melee_weapons.bowie.stats.min_damage = 90
self.melee_weapons.bowie.stats.max_damage = 120
self.melee_weapons.bowie.stats.min_damage_effect = 1
self.melee_weapons.bowie.stats.max_damage_effect = 1
--self.melee_weapons.bowie.anim_global_param = "melee_sandsteel"
self.melee_weapons.bowie.repeat_expire_t = 0.5
self.melee_weapons.bowie.melee_damage_delay = 0.1
self.melee_weapons.bowie.stats.range = 200

self.melee_weapons.branding_iron.stats.min_damage = 90
self.melee_weapons.branding_iron.stats.max_damage = 120
self.melee_weapons.branding_iron.stats.min_damage_effect = 1
self.melee_weapons.branding_iron.stats.max_damage_effect = 1
self.melee_weapons.branding_iron.anim_global_param = "melee_sandsteel"
self.melee_weapons.branding_iron.repeat_expire_t = 0.5
self.melee_weapons.branding_iron.melee_damage_delay = 0.1
self.melee_weapons.branding_iron.stats.range = 200

self.melee_weapons.scalper.stats.min_damage = 90
self.melee_weapons.scalper.stats.max_damage = 120
self.melee_weapons.scalper.stats.min_damage_effect = 1
self.melee_weapons.scalper.stats.max_damage_effect = 1
--self.melee_weapons.scalper.anim_global_param = "melee_sandsteel"
self.melee_weapons.scalper.repeat_expire_t = 0.5
self.melee_weapons.scalper.melee_damage_delay = 0.1
self.melee_weapons.scalper.stats.range = 200

self.melee_weapons.detector.stats.min_damage = 90
self.melee_weapons.detector.stats.max_damage = 120
self.melee_weapons.detector.stats.min_damage_effect = 1
self.melee_weapons.detector.stats.max_damage_effect = 1
--self.melee_weapons.detector.anim_global_param = "melee_sandsteel"
self.melee_weapons.detector.repeat_expire_t = 0.5
self.melee_weapons.detector.melee_damage_delay = 0.1
self.melee_weapons.detector.stats.range = 200

self.melee_weapons.micstand.stats.min_damage = 90
self.melee_weapons.micstand.stats.max_damage = 120
self.melee_weapons.micstand.stats.min_damage_effect = 1
self.melee_weapons.micstand.stats.max_damage_effect = 1
--self.melee_weapons.micstand.anim_global_param = "melee_sandsteel"
self.melee_weapons.micstand.repeat_expire_t = 0.5
self.melee_weapons.micstand.melee_damage_delay = 0.1
self.melee_weapons.micstand.stats.range = 200

self.melee_weapons.microphone.stats.min_damage = 90
self.melee_weapons.microphone.stats.max_damage = 120
self.melee_weapons.microphone.stats.min_damage_effect = 1
self.melee_weapons.microphone.stats.max_damage_effect = 1
--self.melee_weapons.microphone.anim_global_param = "melee_sandsteel"
self.melee_weapons.microphone.repeat_expire_t = 0.5
self.melee_weapons.microphone.melee_damage_delay = 0.1
self.melee_weapons.microphone.stats.range = 200

self.melee_weapons.oldbaton.stats.min_damage = 90
self.melee_weapons.oldbaton.stats.max_damage = 120
self.melee_weapons.oldbaton.stats.min_damage_effect = 1
self.melee_weapons.oldbaton.stats.max_damage_effect = 1
--self.melee_weapons.oldbaton.anim_global_param = "melee_sandsteel"
self.melee_weapons.oldbaton.repeat_expire_t = 0.5
self.melee_weapons.oldbaton.melee_damage_delay = 0.1
self.melee_weapons.oldbaton.stats.range = 200

self.melee_weapons.hockey.stats.min_damage = 90
self.melee_weapons.hockey.stats.max_damage = 120
self.melee_weapons.hockey.stats.min_damage_effect = 1
self.melee_weapons.hockey.stats.max_damage_effect = 1
self.melee_weapons.hockey.anim_global_param = "melee_sandsteel"
self.melee_weapons.hockey.repeat_expire_t = 0.5
self.melee_weapons.hockey.melee_damage_delay = 0.1
self.melee_weapons.hockey.stats.range = 200

self.melee_weapons.croupier_rake.stats.min_damage = 90
self.melee_weapons.croupier_rake.stats.max_damage = 120
self.melee_weapons.croupier_rake.stats.min_damage_effect = 1
self.melee_weapons.croupier_rake.stats.max_damage_effect = 1
--self.melee_weapons.croupier_rake.anim_global_param = "melee_sandsteel"
self.melee_weapons.croupier_rake.repeat_expire_t = 0.5
self.melee_weapons.croupier_rake.melee_damage_delay = 0.1
self.melee_weapons.croupier_rake.stats.range = 200

self.melee_weapons.slot_lever.stats.min_damage = 90
self.melee_weapons.slot_lever.stats.max_damage = 120
self.melee_weapons.slot_lever.stats.min_damage_effect = 1
self.melee_weapons.slot_lever.stats.max_damage_effect = 1
--self.melee_weapons.slot_lever.anim_global_param = "melee_sandsteel"
self.melee_weapons.slot_lever.repeat_expire_t = 0.5
self.melee_weapons.slot_lever.melee_damage_delay = 0.1
self.melee_weapons.slot_lever.stats.range = 200

-- TAZER CAUTION
self.melee_weapons.taser.stats.min_damage = 90
self.melee_weapons.taser.stats.max_damage = 25

self.melee_weapons.switchblade.stats.min_damage = 90
self.melee_weapons.switchblade.stats.max_damage = 120
self.melee_weapons.switchblade.stats.min_damage_effect = 1
self.melee_weapons.switchblade.stats.max_damage_effect = 1
--self.melee_weapons.switchblade.anim_global_param = "melee_sandsteel"
self.melee_weapons.switchblade.repeat_expire_t = 0.5
self.melee_weapons.switchblade.melee_damage_delay = 0.1
self.melee_weapons.switchblade.stats.range = 200

--okinawan style sai
self.melee_weapons.twins.stats.min_damage = 90
self.melee_weapons.twins.stats.max_damage = 120
self.melee_weapons.twins.stats.min_damage_effect = 1
self.melee_weapons.twins.stats.max_damage_effect = 1
--self.melee_weapons.twins.anim_global_param = "melee_sandsteel"
self.melee_weapons.twins.repeat_expire_t = 0.5
self.melee_weapons.twins.melee_damage_delay = 0.1
self.melee_weapons.twins.stats.range = 200

-- Empty palm katta
self.melee_weapons.fight.stats.min_damage = 80
self.melee_weapons.fight.stats.max_damage = 120
self.melee_weapons.fight.stats.min_damage_effect = 1
self.melee_weapons.fight.stats.max_damage_effect = 1
--self.melee_weapons.fight.anim_global_param = "melee_sandsteel"
--self.melee_weapons.fight.repeat_expire_t = 0.5
self.melee_weapons.fight.melee_damage_delay = 0.1
self.melee_weapons.fight.stats.range = 200

self.melee_weapons.buck.stats.min_damage = 90
self.melee_weapons.buck.stats.max_damage = 120
self.melee_weapons.buck.stats.min_damage_effect = 1
self.melee_weapons.buck.stats.max_damage_effect = 1
--self.melee_weapons.buck.anim_global_param = "melee_sandsteel"
self.melee_weapons.buck.repeat_expire_t = 0.5
self.melee_weapons.buck.melee_damage_delay = 0.1
self.melee_weapons.buck.stats.range = 200

self.melee_weapons.morning.stats.min_damage = 90
self.melee_weapons.morning.stats.max_damage = 120
self.melee_weapons.morning.stats.min_damage_effect = 1
self.melee_weapons.morning.stats.max_damage_effect = 1
--self.melee_weapons.morning.anim_global_param = "melee_sandsteel"
self.melee_weapons.morning.repeat_expire_t = 0.5
self.melee_weapons.morning.melee_damage_delay = 0.1
self.melee_weapons.morning.stats.range = 200

self.melee_weapons.beardy.stats.min_damage = 90
self.melee_weapons.beardy.stats.max_damage = 120
self.melee_weapons.beardy.stats.min_damage_effect = 1
self.melee_weapons.beardy.stats.max_damage_effect = 1
self.melee_weapons.beardy.anim_global_param = "melee_sandsteel"
self.melee_weapons.beardy.repeat_expire_t = 0.5
self.melee_weapons.beardy.melee_damage_delay = 0.1
self.melee_weapons.beardy.stats.range = 200

--knife diver
self.melee_weapons.pugio.stats.min_damage = 90
self.melee_weapons.pugio.stats.max_damage = 120
self.melee_weapons.pugio.stats.min_damage_effect = 1
self.melee_weapons.pugio.stats.max_damage_effect = 1
--self.melee_weapons.pugio.anim_global_param = "melee_sandsteel"
self.melee_weapons.pugio.repeat_expire_t = 0.5
self.melee_weapons.pugio.melee_damage_delay = 0.1
self.melee_weapons.pugio.stats.range = 200

--machete point break
self.melee_weapons.gator.stats.min_damage = 90
self.melee_weapons.gator.stats.max_damage = 120
self.melee_weapons.gator.stats.min_damage_effect = 1
self.melee_weapons.gator.stats.max_damage_effect = 1
--self.melee_weapons.gator.anim_global_param = "melee_sandsteel"
self.melee_weapons.gator.repeat_expire_t = 0.5
self.melee_weapons.gator.melee_damage_delay = 0.1
self.melee_weapons.gator.stats.range = 200

self.melee_weapons.wing.stats.min_damage = 90
self.melee_weapons.wing.stats.max_damage = 120
self.melee_weapons.wing.stats.min_damage_effect = 1
self.melee_weapons.wing.stats.max_damage_effect = 1
--self.melee_weapons.wing.anim_global_param = "melee_sandsteel"
self.melee_weapons.wing.repeat_expire_t = 0.5
self.melee_weapons.wing.melee_damage_delay = 0.1
self.melee_weapons.wing.stats.range = 200

self.melee_weapons.shawn.stats.min_damage = 90
self.melee_weapons.shawn.stats.max_damage = 120
self.melee_weapons.shawn.stats.min_damage_effect = 1
self.melee_weapons.shawn.stats.max_damage_effect = 1
--self.melee_weapons.shawn.anim_global_param = "melee_sandsteel"
self.melee_weapons.shawn.repeat_expire_t = 0.5
self.melee_weapons.shawn.melee_damage_delay = 0.1
self.melee_weapons.shawn.stats.range = 200

self.melee_weapons.stick.stats.min_damage = 90
self.melee_weapons.stick.stats.max_damage = 120
self.melee_weapons.stick.stats.min_damage_effect = 1
self.melee_weapons.stick.stats.max_damage_effect = 1
--self.melee_weapons.stick.anim_global_param = "melee_sandsteel"
self.melee_weapons.stick.repeat_expire_t = 0.5
self.melee_weapons.stick.melee_damage_delay = 0.1
self.melee_weapons.stick.stats.range = 200

self.melee_weapons.scoutknife.stats.min_damage = 90
self.melee_weapons.scoutknife.stats.max_damage = 120
self.melee_weapons.scoutknife.stats.min_damage_effect = 1
self.melee_weapons.scoutknife.stats.max_damage_effect = 1
--self.melee_weapons.scoutknife.anim_global_param = "melee_sandsteel"
self.melee_weapons.scoutknife.repeat_expire_t = 0.5
self.melee_weapons.scoutknife.melee_damage_delay = 0.1
self.melee_weapons.scoutknife.stats.range = 200

self.melee_weapons.pitchfork.stats.min_damage = 90
self.melee_weapons.pitchfork.stats.max_damage = 120
self.melee_weapons.pitchfork.stats.min_damage_effect = 1
self.melee_weapons.pitchfork.stats.max_damage_effect = 1
--self.melee_weapons.pitchfork.anim_global_param = "melee_sandsteel"
self.melee_weapons.pitchfork.repeat_expire_t = 0.5
self.melee_weapons.pitchfork.melee_damage_delay = 0.1
self.melee_weapons.pitchfork.stats.range = 200

self.melee_weapons.nin.stats.min_damage = 90
self.melee_weapons.nin.stats.max_damage = 120
self.melee_weapons.nin.stats.min_damage_effect = 1
self.melee_weapons.nin.stats.max_damage_effect = 1
self.melee_weapons.nin.repeat_expire_t = 0.5
self.melee_weapons.nin.melee_damage_delay = 0.1
self.melee_weapons.nin.stats.range = 200
--CHAINS SAW
self.melee_weapons.cs.stats.min_damage = 600
self.melee_weapons.cs.stats.max_damage = 900
self.melee_weapons.cs.stats.min_damage_effect = 1
self.melee_weapons.cs.stats.max_damage_effect = 1
self.melee_weapons.cs.stats.range = 250
self.melee_weapons.cs.repeat_expire_t = 1 --was 2
self.melee_weapons.cs.expire_t = 0.9 --was1.2
self.melee_weapons.cs.melee_damage_delay = 0.35
--Scarface phone
self.melee_weapons.brick.stats.min_damage = 90
self.melee_weapons.brick.stats.max_damage = 120
self.melee_weapons.brick.stats.min_damage_effect = 1
self.melee_weapons.brick.stats.max_damage_effect = 1
self.melee_weapons.brick.repeat_expire_t = 0.5
self.melee_weapons.brick.melee_damage_delay = 0.1
--Mining Pick
self.melee_weapons.mining_pick.stats.min_damage = 90
self.melee_weapons.mining_pick.stats.max_damage = 120
self.melee_weapons.mining_pick.stats.min_damage_effect = 1
self.melee_weapons.mining_pick.stats.max_damage_effect = 1
self.melee_weapons.mining_pick.repeat_expire_t = 0.5
self.melee_weapons.mining_pick.melee_damage_delay = 0.1
--newfree
self.melee_weapons.ostry.stats.min_damage = 90
self.melee_weapons.ostry.stats.max_damage = 120
self.melee_weapons.ostry.stats.min_damage_effect = 1
self.melee_weapons.ostry.stats.max_damage_effect = 1
--self.melee_weapons.ostry.repeat_expire_t = 0.5
--self.melee_weapons.ostry.melee_damage_delay = 0.1
end
--[[Template

Hit Damage
self.melee_weapons..stats.min_damage = 
self.melee_weapons..stats.max_damage = 
Knockdown Chance
self.melee_weapons.baseballbat.stats.min_damage_effect = 1
self.melee_weapons.baseballbat.stats.max_damage_effect = 3

--self.melee_weapons..stats.min_damage = 90
--self.melee_weapons..stats.max_damage = 120
--self.melee_weapons..stats.min_damage_effect = 1
--self.melee_weapons..stats.max_damage_effect = 1
--self.melee_weapons..anim_global_param = "melee_sandsteel"
--self.melee_weapons..repeat_expire_t = 0.5
--self.melee_weapons..melee_damage_delay = 0.1
--self.melee_weapons..stats.range = 200

end
--]]
if not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/assaulttweaks.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogicidle.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/coplogictravel.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/enemymanager.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/groupaistatebase.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/spooclogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/tankcoplogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/shieldlogicattack.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/rebalanceissues.lua")
or not SystemFS:exists("mods/Seamlink Gameplay Overhaul/lua/sync.lua")
then
log("You have messed with SGO, reinstall it.")
	os.exit()
end