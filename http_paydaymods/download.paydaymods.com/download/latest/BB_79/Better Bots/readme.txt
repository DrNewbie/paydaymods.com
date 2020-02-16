Better Bots, version 46
=======================

- Dominating: Bots will assist human players in dominating enemies. If a player shouts at an enemy to dominate him or tases him with the Electric Brass Knuckles or the Buzzer, the bots will immediately stop targeting him, regardless as to whether the enemy can actually be dominated. If "Bots Dominate Cops Independently" is turned on, they will shout at cops within range who can be dominated on their own.

- Marking: Bots' marking code has been optimized (generally, the vanilla code checks for multiple conditions all at once; the modified code breaks those checks down in order of conditions most likely to fail to least), they can now also mark turrets and they will not mark enemies who are already marked. Furthermore, they will only mark Shields if they can hit them; meaning, if the Shield is within melee range, the bot has the AP rounds booster, and/or the Shield is turned around. The bots will also mark enemies independently; in the vanilla code, all three bots share the same timer. Also, the bots only mark enemies within 30 meters, the same as human players; this further reduces the amount of chatter at any given time. Finally, the bots will automatically mark any Taser as soon as he tases them.

- Chatter: Bots' "war cries" can be disabled, reducing the amount of general chatter while also making bots sound more human.

- Melee: Bots can melee non-special enemies (other than Shields) within 2 meters. Doing so will cause 50% damage to the enemy while knocking him over. If the enemy is a Shield, the Shield will be knocked over as if the bot had aced Shock and Awe; normally this will not do any damage but if the Shield is turned around, it will do 50% damage like with other enemies. The bots can also melee more than one enemy at once, allowing them to handle swarms of enemies at close range.

- Health: Players can choose between three different health options for bots. "Default" is the default health for vanilla bots; this varies depending on difficulty and can be as high as 8000 on Death Sentence. "ZEAL" is the health amount that heavy ZEAL units used before the difficulty overhaul that gave OD units the same health as on DW, being 1440. "No Scaling" is the baseline health for bots that is used on the lowest difficulty before scaling multipliers, which is 750; this is also the amount of health for bots on all difficulties in Payday: The Heist. Players can also enable bots announcing that their health is low; when the bot's health reaches 20% or less, they will ask for a doctor bag (bots cannot actually use doctor bags but it serves the same purpose).

- Offline: The mod includes multiple changes to make offline mode more similar to playing with other human players. In offline mode, bots will use the same colored outlines as human players. Normally, offline mode provides a boost to armor regen speed; the mod removes this. The vanilla game does not include all the bots into the enemy spawn/difficulty calculations (ie, in offline mode, the highest spawns will only match three players and not four); the mod counts all bots as human players for the purposes of those calculations. Lastly, players will normally not get the "crew alive" bonus when playing offline; the mod adds this to offline mode and calculates bots as if they were human players for this bonus.

- Intelligence: The mod removes the "focus" and "aim" delays for the bots, which are arbitrary ways that the vanilla game tries to make the bots more human-like and instead makes them slow and sluggish; their shooting range is also increased to that of Snipers, allowing the bots to actually target them. Additionally, there is the option to enable "Hyper Reflexes." Ordinarily, the game has a list of "tasks" to execute (aiming at a target, moving from one location to another, shooting, etc). This option will also cause bots and Jokers to immediately identify enemies; normally, there is a delay in how long it takes for a bot to identify an enemy, much like the detection meter in stealth except much faster. With this option enabled, they will instantly identify enemies, drastically improving their reaction times. Note that if you use TdlQ's Full Speed Swarm, you do not need this option enabled.

- Reviving: If one player starts reviving another player or bot that a bot has already been assigned to revive, the bot will immediately stop trying to revive the player/bot and return to their usual duties. Additionally, if a bot is carrying a bag with which they can still run (paintings, coke, etc) and/or they have the Inspire booster and the Inspire cooldown is not active, they will not drop the bag to revive the player.

- Carrying: In addition to the changes to bag dropping rules in the event that a player is downed, the mod also changes how the speed reduction due to bag carrying is calculated; in short, the bots will move at the same speed as human players when they carry bags.

- Shooting: The mod edits the "slotmask" of the bots' bullets so that they no longer impact with dominated cops, Jokers, or other bots. A "slotmask" is, in short, a categorization for every rendered object to determine how they should interact with each other; for instance, objects with some slotmasks can be shot through while others cannot, dead bodies are a different slotmask from living enemies despite sharing the same model, etc.

- Intimidation: The code for bots' intimidation of civilians has been optimized (specifically, the vanilla code checks for a collection of conditions to be true all at once, whereas the mod's code breaks these checks down individually, so if one is failed then it does not continue to check the others) and the bots will be more aggressive about keeping civilians on the ground. Essentially, if a civilian is not on the floor then they will shout at them, no matter what.

- Stealth: Ordinarily, the bots will wait until the alarm has gone off before masking up to assist the player. The mod has an option to enable instant masking up as soon as a loud sound has been made (gunshots, saw, etc).

- Reloading: The vanilla bots only reload their weapons when their magazines are completely empty; with the mod, the bots will reload their weapons when they are not engaged in combat if their magazines are at or below 60% capacity.

- Ammo: The mod includes the option to disable ammo pickups if an enemy is killed by a bot; this loosely simulates having teammates who will expend (and thus, collect) ammo, since it is otherwise impossible and impractical to make the bots use ammo.

- Movement: The bots' movement speed has been increased to that of Cloakers. Additionally, their "run_stop" and "run_stop" animations have been removed, allowing them to start and stop following instantly and better keep up with players.

- Dodge: The mod adds the ability for the bots to dodge, using the different presets used by the enemy AI. Whenever a bot dodges, they cannot receive damage during the duration of the dodge animation. Alternatively, the player can force the bots to always stand and never crouch, forcing them to always engage the enemy.

- Cloakers: The mod has an option to cause Cloakers to arrest bots like they did in Payday: The Heist. Note that this does not work in public lobbies, only private and offline.

- One Down: There is an option to cause the bots to immediately go into custody as soon as they are downed, which can add a layer of challenge and can compensate for the fact that bots have infinitely recharging health.

- Equipment: By default, the mod will give each bot the Lightweight Ballistic Vest and either a doctor bag or ammo bag. This is purely cosmetic and can be disabled in the options menu.

- Grenades: Should you choose to turn it on, the mod has the option of giving the bots concussion grenades; one of the three bots will throw a grenade if they encounter a group of at least four enemies closer than 30 feet away within 90 degrees of where they are looking, and they can throw a new one every five seconds.

- Big Lobby: If the player uses the Big Lobby mod, there is an option to populate all the player slots with bots.

- Jokers: Many of the bots' improvements will also apply to Jokers, such as the increased reaction time and better targeting.

- Targeting: The bots' targeting has been completely overhauled. In brief, the bots take the distance of each enemy. That distance is then divided by a priority modifier. If a bot already has a target, then that modifier is 9 (meaning, the distance is divided by 9). Snipers have a modifier of 8, enemies who can heal (meaning, MediDozers and Medics) are 7, Tasers and Cloakers (specials who can disable players, described as "is_very_dangerous" in the code) are 6, Shields who can be hit (meaning, within melee range, turned around, and/or the bot has AP rounds) are 5, all other specials are 4 (typically, this is other Dozers but also includes Winters and his minions), all other visible non-special enemies are 3, and non-human enemies (mostly, this is just turrets) are 2; non-visible enemies do not have their distance modified. The bot then targets the enemy with the smallest resulting distance value.

- Combat: The mod includes an option to overhaul the bots' combat abilities to more closely resemble human players. In brief, every weapon starts at 30 damage and can be fired every 0.2 seconds. All weapons have a 100% chance to hit within a narrow spread (only 5 degrees), meaning they won't dump most of their rounds in a Dozer's body when his faceplate has yet to be destroyed. Pump-action shotguns can be fired every 0.5 seconds; to compensate for this, they do 2.5 times more damage as well. Sniper rifles fire 1 time per second, but do 5 times more damage as a result. The Thanatos will only fire once every 2 seconds, but it subsequently does 10 times more damage. The weapons have a damage multiplier that the player can choose in the options menu; the default is a 5x multiplier (so, a normal weapon will do 150 damage and snipers and pump-action shotguns will be even higher than that). Weapons will have max damage and fire frequency up to 15 meters; after that, they will linearly decrease in both until the damage multiplier becomes 1x and the fire frequency is 1 time every 2 seconds upon reaching 45 meters and beyond. DMRs will fire in semi-auto mode only, weak shotguns like the M1014 will fire at the 0.2 times per second frequency unlike pump-action shotguns but do less damage as a result (meaning, they do not get the 2.5 multiplier mentioned before), and all automatic weapons fire in full automatic mode; double barreled shotguns follow the same rules as pump-action shotguns. Note that Hoppip's Bot Weapons and Equipment mod has its own weapon damage/accuracy/etc changes; if you use that mod then this option should not be enabled.

Credits
-------

Schmuddel
Spruebox
TdlQ
Easternunit100
Hoppip
SC
Sandman/Droidaka
LycanCHKN
chrom[K]a
PsychoticFalcon
DerSushy
shadows
Dr_Newbie
Punk Foxy