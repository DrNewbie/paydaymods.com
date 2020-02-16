#### Installation Instructions: ####

* Put the Anti Voice Spam 2 folder into the /PAYDAY 2/mods/ folder.
* Enjoy!



#### TROUBLESHOOTING ####

* If you are having problems with the mod, delete the Anti Voice Spam 2 mod save file and launch again.
* If problems persist, please contact me via Discord: Offyerrocker#3878



#### Adding voicelines to the blacklist: ####

==== STEP 1 ====

* Open the Anti Voice Spam 2 mod save file, located at:

/PAYDAY 2/mods/saves/antivoicespam2.txt

* Its contents will look something like:

{"voiceline_id":"true","voiceline_id_2":"true","voiceline_id_3":"true"}

* except with a lot more voicelines, and actual voiceline ids instead of placeholders.


==== STEP 2 ====

* Find the id of the voiceline you want to blacklist. 

* For a list of voice lines, visit:

https://docs.google.com/spreadsheets/d/1m0LBg2PKpB-bnWfOFj40AglCI1dLmAHLH3ydi3Y7uz8/edit?pli=1#gid=0
(There are multiple tabs)


==== STEP 3 ====

* In the save file, add your voiceline entry to the end, in the same format as the others in the file:

"p46":"true"


==== EXAMPLE: ====
* Say you want to block the voiceline "Jump!", which is "p46" according to the spreadsheet above.

* Add the voiceline to the end of the list inside the brackets, so that it goes from 

{"voiceline_id":true,"voiceline_id_2":true,"voiceline_id_3":true}

* to

{"voiceline_id":true,"voiceline_id_2":true,"voiceline_id_3":true,"p46":true}
                                                                ^1  ^2  ^3 ^4
* Notes:
	1. Don't forget the comma in between entries! 
	2. This is the id of your voiceline. Each voiceline should have a separate entry!
	3. "true" or "false" denotes whether or not the voiceline is blacklisted. Make sure this part does not have quotation marks!
		You could delete the entry, but if it's a voiceline that's in the default banlist in nocomment.lua, it'll be recreated on game load.
		Instead, just set it to "false" if you want players to be able to play that sound.
	4. Your new entry should be before the end bracket. DO NOT add a comma after your entry if it is the last entry in the file.





#### MISC ####

* I might make an in-game menu tool to more easily add voicelines to the blacklist later, using QuickKeyboardInput or something
https://modworkshop.net/mydownloads.php?action=view_down&did=22564

* Due to the way voicelines/sounds are played from other players,
	it's difficult to identify a played sound into the relatively easy to read ids like the ones below. 

		