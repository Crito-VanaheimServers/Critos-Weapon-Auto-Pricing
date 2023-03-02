# Critos-Weapon-Auto-Pricing
	This tool is to help get all weapons that DO NOT have attachments auto priced and quality set for Exile traders.
	It is intended to get you close and cut out alot of manual work for pricing trader files. Some may find results
	to be perfect to use others may need to go thru manually after running and change some things but hopefully help 
	cut out alot of time consuming work for most people. It is not a perfect system due to some things like exile has
	a few sniper rifles classified as assault riffles in their config so they fall under the wrong category but for most
	weapons it works well. I have only tested this with Exile mod, all 4 RHS mods, CUP Weapons mod, and NIArms All In One Mod
	but do not discourage trying to use with other weapon mods.

1. Copy the entire folder 'Critos_Weapon_Auto_Pricing.VR'.

2. Navigate to C:\Users\yourpcusername\Documents\Arma 3 - Other Profiles\TheProfileNameYouPlayWith\mpmissions.

3. Paste the copied folder in the mpmissions folder.

4. Open the config.sqf found in the folder you just pasted and edit you your liking and save changes.

5. Open Arma 3 and load any mods whit weapons you want to auto generate prices and quality lvls for.

6. Click Play and navigate to the editor usually found under single player.

7. Select Virtual Reality for the map and continue. Once in editor go to upper left and select open folder.

8. Select mpmissions and find the name of the folder you copied and pasted earlier in the list.

9. You should now see a soldier standing in the editor screen. Right click on him and select Play As The Character.

10. Use your scroll wheel on your mouse and select the option 'Get Pricing'.

11. Watch the lower left chat messages for the message of completion and that it has coppied and is ready for paste.

12. press Alt+Tab on keyboard and open notepad or any text editor to paste the information into.

Your done now you can move the information where you need. You can Alt+Tab in and out of the editor and change config.sqf
settings for the tool without restarting, just make sure to save changes to the config.sqf each time for changes to work.
If you want a different mod than you will have to close arma and load a new mod to run with it.

EXAMPLE OF PASTED RESULTS BELOW

/////PRICING/////

//HAND GUNS:
class Exile_Weapon_Colt1911                             {quality = 3; price = 1401;};
class Exile_Weapon_Makarov                              {quality = 2; price = 1401;};
class Exile_Weapon_Taurus                               {quality = 3; price = 1401;};
class Exile_Weapon_TaurusGold                           {quality = 3; price = 1401;};
class exile_rifle_SA61                                  {quality = 5; price = 1051;};
class Exile_Weapon_SA61                                 {quality = 5; price = 1051;};

//SHOTGUNS:
class Exile_Weapon_M1014                                {quality = 3; price = 621;};

//SUBMACHINE GUNS:

//ASSAULT RIFFLES:
class Exile_Weapon_AK107                                {quality = 4; price = 2502;};
class Exile_Weapon_AK107_GL                             {quality = 5; price = 2502;};
class Exile_Weapon_AK74                                 {quality = 4; price = 2201;};
class Exile_Weapon_AK74_GL                              {quality = 5; price = 2201;};
class Exile_Weapon_AK47                                 {quality = 6; price = 2201;};
class Exile_Weapon_AKM                                  {quality = 6; price = 2201;};
class Exile_Weapon_AKS                                  {quality = 6; price = 2201;};
class Exile_Weapon_AKS_Gold                             {quality = 6; price = 2201;};
class exile_arifle_M16A4                                {quality = 4; price = 2471;};
class Exile_Weapon_M16A4                                {quality = 4; price = 2471;};
class exile_arifle_M16A2                                {quality = 4; price = 2471;};
class Exile_Weapon_M16A2                                {quality = 4; price = 2471;};
class exile_arifle_M4                                   {quality = 4; price = 2452;};
class Exile_Weapon_M4                                   {quality = 4; price = 2452;};
class Exile_Weapon_DMR                                  {quality = 6; price = 2501;};
class Exile_Weapon_ksvk                                 {quality = 6; price = 3281;};
class Exile_Weapon_LeeEnfield                           {quality = 6; price = 1641;};
class Exile_Weapon_CZ550                                {quality = 3; price = 1531;};
class Exile_Weapon_SVD                                  {quality = 6; price = 2701;};
class Exile_Weapon_SVDCamo                              {quality = 6; price = 2701;};
class Exile_Weapon_VSSVintorez                          {quality = 2; price = 2251;};
class Exile_Weapon_RPK                                  {quality = 4; price = 2401;};

//LIGHT MACHINE GUNS:
class Exile_Weapon_PK                                   {quality = 6; price = 4668;};
class Exile_Weapon_PKP                                  {quality = 6; price = 4668;};

//SNIPER RIFFLES:
class exile_weapons_m107                                {quality = 6; price = 4921;};
class Exile_Weapon_m107                                 {quality = 6; price = 4921;};

//GRENADE LAUNCHERS:

//UNKNOWN:

/////CLASS NAMES/////

//HAND GUNS:
"Exile_Weapon_Colt1911",
"Exile_Weapon_Makarov",
"Exile_Weapon_Taurus",
"Exile_Weapon_TaurusGold",
"exile_rifle_SA61",
"Exile_Weapon_SA61",

//SHOTGUNS:
"Exile_Weapon_M1014",

//SUBMACHINE GUNS:

//ASSAULT RIFFLES:
"Exile_Weapon_AK107",
"Exile_Weapon_AK107_GL",
"Exile_Weapon_AK74",
"Exile_Weapon_AK74_GL",
"Exile_Weapon_AK47",
"Exile_Weapon_AKM",
"Exile_Weapon_AKS",
"Exile_Weapon_AKS_Gold",
"exile_arifle_M16A4",
"Exile_Weapon_M16A4",
"exile_arifle_M16A2",
"Exile_Weapon_M16A2",
"exile_arifle_M4",
"Exile_Weapon_M4",
"Exile_Weapon_DMR",
"Exile_Weapon_ksvk",
"Exile_Weapon_LeeEnfield",
"Exile_Weapon_CZ550",
"Exile_Weapon_SVD",
"Exile_Weapon_SVDCamo",
"Exile_Weapon_VSSVintorez",
"Exile_Weapon_RPK",

//LIGHT MACHINE GUNS:
"Exile_Weapon_PK",
"Exile_Weapon_PKP",

//SNIPER RIFFLES:
"exile_weapons_m107",
"Exile_Weapon_m107",

//GRENADE LAUNCHERS:

//UNKNOWN:

