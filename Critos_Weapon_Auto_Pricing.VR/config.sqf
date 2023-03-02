/*
Critos_Weapon_Auto_Pricing
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 3/01/2023
	
	This tool is to help get all weapons that DO NOT have attachments auto priced and quality set for Exile traders.
	It is intended to get you close and cut out alot of manual work for pricing trader files. Some may find results
	to be perfect to use others may need to go thru manually after running and change some things but hopefully help 
	cut out alot of time consuming work for most people. It is not a perfect system due to some things like exile has
	a few sniper rifles classified as assault riffles in their config so they fall under the wrong category but for most
	weapons it works well. I have only tested this with Exile mod, all 4 RHS mods, CUP Weapons mod, and NIArms All In One Mod
	but do not discourage trying to use with other weapon mods.
*/

targetMod = "Exile";					//name of mod you want weapons from. Leave blank to get all weapon in arma and any loaded mods.
								//possible mod names for use are but not limited to "Exile" = Exile Mod, "CUP" = CUP Weapons Mod,
								//"hlc" = NIArms All In One Mod, "rhs" = all the RHS mods. 

handGunStartQuality = 1;		//Quality you would like your weapons type to start at. Quality determined by amunition type.

handGunBasePrice = 200;			//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

shotGunStartQuality = 1;		//Quality you would like your weapons to start at. Quality determined by amunition type.

shotGunBasePrice = 400;			//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

smgStartQuality = 1;			//Quality you would like your weapons to start at. Quality determined by amunition type.

smgGunBasePrice = 700;			//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

assaultRiffleStartQuality = 2;	//Quality you would like your weapons to start at. Quality determined by amunition type.
								//If it has a grenade launcher its quality is auto increased 1 level from its non launcher version.

assaultRiffleBasePrice = 1000;	//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

lmgStartQuality = 3;			//Quality you would like your weapons to start at. Quality determined by amunition type.

lmgBasePrice = 2000;			//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

sniperStartQuality = 1;			//Quality you would like your weapons to start at. Quality determined by amunition type.

sniperBasePrice = 3000;			//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

GLauncherStartQuality = 5; 		//Quality you would like your weapons to start at. Quality determined by amunition type.
								//These are just grenade launchers not attached to a gun. see assaultRiffleStartQuality info about those.

GLauncherBasePrice = 6000;		//Price you want your weapon type to start at regardless of range, accuracy, and rounds per minute.

rangePrice = 1;					//how many tabs to charge per range stat. If weapon has 500 range than it takes this value multiplied by 500.

accuracyPrice = 3;				//how many tabs to charge per Accuracy stat. Takes this value multiplied Accuracy value.

roundsPerMinPrice = 1;			//how many tabs to charge per Rounds Per Minute stat. If weapon has 750 Rounds Per Minute than it takes this value multiplied by 750.

//List weapons to ignore that are broken in any way that you do not want on your server.
//"Makarov_light","rhs_weap_stgw57","rhs_weap_m4a1_m203s_sa" are broken so I would leave them and just add to the list if needed. 
BadWeapons =	[
					"Makarov_light",
					"rhs_weap_stgw57",
					"rhs_weap_m4a1_m203s_sa"
				];
		
manualMode = false;		//Set to true if have a list of class names and want to price only certain weapons.

//List your class names here if you set the above manualMode to true.
manualModeList =	[
						"Colt1911",
						"Makarov",
						"TaurusTracker455",
						"TaurusTracker455_gold",
						"M1014",
						"arifle_AK107",
						"arifle_AK107_GL",
						"arifle_AK74",
						"arifle_AK74_GL",
						"arifle_AK47",
						"arifle_AKM",
						"arifle_AKS",
						"arifle_AKS_Gold",
						"srifle_DMR",
						"ksvk",
						"srifle_LeeEnfield",
						"srifle_SVD",
						"srifle_SVD_des",
						"srifle_VSSVintorez",
						"arifle_RPK74",
						"srifle_CZ550_shit_1",
						"srifle_CZ550_shit_2",
						"arifle_MX_SW_F",
						"arifle_MX_SW_Black_F",
						"MMG_01_hex_F",
						"MMG_01_tan_F",
						"MMG_02_camo_F",
						"MMG_02_black_F",
						"MMG_02_sand_F",
						"arifle_SPAR_02_blk_F",
						"arifle_SPAR_02_khk_F",
						"arifle_SPAR_02_snd_F",
						"PKP",
						"Pecheneg"
					];