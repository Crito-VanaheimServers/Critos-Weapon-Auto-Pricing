/*
Critos_Weapon_Auto_Pricing
By Crito @Vanaheim Gaming Servers
https://discord.gg/WEFzqPa
v1.0 3/01/2023
*/

#include "config.sqf";

_classNameArray = [];

if(manualMode == false)then
{
	if(targetMod == "")then
	{
		_classNameArray = (configFile >> "cfgWeapons") call BIS_fnc_getCfgSubClasses;
	}
	else
	{
		_wpnArray = (configFile >> "cfgWeapons") call BIS_fnc_getCfgSubClasses;
		{
			if([targetMod, _x] call BIS_fnc_inString)then
			{
				_classNameArray pushback _x;
			};
		}forEach _wpnArray;
	};
}
else
{
	_wpnArray = (configFile >> "cfgWeapons") call BIS_fnc_getCfgSubClasses;
	{
		if(_x in _wpnArray)then
		{
			_classNameArray pushBack _x;
		};
	}forEach manualModeList;
};

_arrayCount = count _ClassNameArray;
_arrayCount = _arrayCount - 1;
_counter = 0;
_data = [];
_br = toString [13,10];
_hGunArray = [];
_hGunArrayFormat = "";
_shotGunArray = [];
_shGunArrayFormat = "";
_smgArray = [];
_smgArrayFormat = "";
_assaultRiffleArray = [];
_assrArrayFormat = "";
_lmgArray = [];
_lmgArrayFormat = "";
_sniperArray = [];
_sniperArrayFormat = "";
_gLauncherArray = [];
_glArrayFormat = "";
_unknownArray = [];
_unkwnArrayFormat = "";
_characterNumbersArray = [];
_hGunClassList = [];
_hGunClassListFormat = "";
_smgClassList = [];
_smgClassListFormat = "";
_assRiffleClassList = [];
_assRifClassListFormat = "";
_lmgClassList = [];
_lmgClassListFormat = "";
_sniperClassList = [];
_sniperCalssListFormat = "";
_gLauncherClassList = [];
_gLClassListFormat = "";
_shotGunClassList = [];
_shGnClassListFormat = "";
_unknownClassList = [];
_unknClassListFormat = "";

	{
		_strClass = _x;
		_characterNumbers = count str _strClass;
		_characterNumbersArray pushBack _characterNumbers;
	}forEach _classNameArray;
	
	_maxCharacters = selectMax _characterNumbersArray;

for "_i" from 0 to _arrayCount do 
{
	_ClassName = _ClassNameArray select _counter;
	
	_itemCheck = [_ClassName] call BIS_fnc_itemType;
	
	if(_itemCheck select 0 == "")then
	{
		_itemCheck = [_ClassName] call BIS_fnc_ObjectType;
	};
			
	_itemClass = _itemCheck select 0;	
	_itemType = _itemCheck select 1;

	if(["hgun", _ClassName] call BIS_fnc_inString)then
	{
		_itemType = "Handgun";
	};
	
	if(["smg", _ClassName] call BIS_fnc_inString)then
	{
		_itemType = "SubmachineGun";
	};

	if((["glaunch", _ClassName] call BIS_fnc_inString) || (["M32_EP1", _ClassName] call BIS_fnc_inString) || (["M79_EP1", _ClassName] call BIS_fnc_inString) || (["Mk13_EP1", _ClassName] call BIS_fnc_inString))then
	{
		_itemType = "GLauncher";
	};
	
	if(_ClassName in BadWeapons)then
	{
		_itemType = "Throw";
	};
	
	_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
	if (count _modes >= 1) then
	{	
		_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
		
		if(Count _CfgMagazines >= 1)then
		{
			if((["00Buck", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["12g_buck", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["12Gauge", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["74Slug", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["M441", (_CfgMagazines select 0)] call BIS_fnc_inString))then
			{
				_itemType = "Shotgun";
			};
		};
	};
		
	switch (_itemClass) do
	{	
		case "Weapon":
		{			
			switch (_itemType) do
			{
				case "Throw":
				{
					systemChat format ["REMOVED: %1",_ClassName]; 
				};
				case "Handgun":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["rsp30", _ClassName] call BIS_fnc_inString))then
							{
								Crito addWeapon _ClassName;
								
								_wpnItems = handgunItems Crito;
								_wpnAttachment = false;
								
								if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
								{
									_wpnAttachment = true;
								};

								if!(_wpnAttachment)then
								{
									_quality = 0;
									
									{
										if((["Signal", _x] call BIS_fnc_inString) || (["Flare", _x] call BIS_fnc_inString) || (["6x8", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality;
										};
									}forEach _CfgMagazines;
									
									{
										if((["9x21", _x] call BIS_fnc_inString) || (["9x18", _x] call BIS_fnc_inString) || (["9x19", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality + 1;
										};
									}forEach _CfgMagazines;

									{
										if((["40", _x] call BIS_fnc_inString) || (["45", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality + 2;
										};
									}forEach _CfgMagazines;

									{
										if((["357", _x] call BIS_fnc_inString) || (["46", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality + 3;
										};
									}forEach _CfgMagazines;

									{
										if((["762", _x] call BIS_fnc_inString) || (["763", _x] call BIS_fnc_inString) || (["765", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality + 4;
										};
									}forEach _CfgMagazines;

									{
										if((["50", _x] call BIS_fnc_inString) || (["M441", _x] call BIS_fnc_inString) || (["BLASTER", _x] call BIS_fnc_inString))then
										{
											_quality = handGunStartQuality + 5;
										};
									}forEach _CfgMagazines;

									if(_quality > 6)then{_quality = 6;};
									
									_range = 0;
									_accuracy = 999;
									_reloadTime = 999;
																	
									{
										_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
										
										
										_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
										
										
										_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
									}forEach _modes;	
									
									_roundsPerMin = ceil(60 / _reloadTime);
									
									_rangePrice = ceil(rangePrice * _range);
									_accuracyPrice = ceil(accuracyPrice * _accuracy);
									_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);

									_Price = ceil(handGunBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
									_totalPriceRound = floor _Price;
									
									_classListformat = format ['"%1",', _ClassName];
									_hGunClassList pushBack _classListformat;

									_ClassNameCharacters = count _ClassName;
									_addedSpaces = " ";				
									_Spacing = "";
									_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
									_spaceCounter = 0;
									
										for "_i" from 0 to _spacingAmount do
										{
											_spaceCounter = _spaceCounter + 1;
											_Spacing = _Spacing + _addedSpaces;
										};	
										
									_ClassName =  _ClassName splitstring "";
									_Spacing = _Spacing splitstring "";	
									_ClassName = _ClassName + _Spacing;
									_ClassName = _ClassName joinstring "";										

									systemChat format ["ADDED: %1",_ClassName];
									
									_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
									_hGunArray pushback _dataArray;
								};
							};
						};
					};
				};
				case "SubmachineGun":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString))then
							{
								Crito addWeapon _ClassName;
								
								_wpnItems = primaryWeaponItems Crito;
								_wpnAttachment = false;
								
								if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
								{
									_wpnAttachment = true;
								};
								
								if!(_wpnAttachment)then
								{
									if!((["grip1", _ClassName] call BIS_fnc_inString) || (["grip2", _ClassName] call BIS_fnc_inString) || (["grip3", _ClassName] call BIS_fnc_inString))then
									{
										_quality = 0;
										
										{
											if((["9x21", _x] call BIS_fnc_inString) || (["9x19", _x] call BIS_fnc_inString) || (["1143", _x] call BIS_fnc_inString) || (["10mm", _x] call BIS_fnc_inString))then
											{
												_quality = smgStartQuality;
											};
										}forEach _CfgMagazines;
										
										{
											if((["45", _x] call BIS_fnc_inString) || (["46", _x] call BIS_fnc_inString))then
											{
												_quality = smgStartQuality + 1;
											};
										}forEach _CfgMagazines;
									
										{
											if((["570", _x] call BIS_fnc_inString) || (["765", _x] call BIS_fnc_inString))then
											{
												_quality = smgStartQuality + 2;
											};
										}forEach _CfgMagazines;
	
										if(_quality > 6)then{_quality = 6;};
										
										_range = 0;
										_accuracy = 999;
										_reloadTime = 999;
																		
										{
											_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
											
											
											_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
											
											
											_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
										}forEach _modes;	
										
										_roundsPerMin = ceil(60 / _reloadTime);
										
										_rangePrice = ceil(rangePrice * _range);
										_accuracyPrice = ceil(accuracyPrice * _accuracy);
										_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
	
										_Price = ceil(smgGunBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
										_totalPriceRound = floor _Price;
										
										_classListformat = format ['"%1",', _ClassName];
										_smgClassList pushBack _classListformat;

										_ClassNameCharacters = count _ClassName;
										_addedSpaces = " ";				
										_Spacing = "";
										_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
										_spaceCounter = 0;
										
											for "_i" from 0 to _spacingAmount do
											{
												_spaceCounter = _spaceCounter + 1;
												_Spacing = _Spacing + _addedSpaces;
											};	
											
										_ClassName =  _ClassName splitstring "";
										_Spacing = _Spacing splitstring "";	
										_ClassName = _ClassName + _Spacing;
										_ClassName = _ClassName joinstring "";										
	
										systemChat format ["ADDED: %1",_ClassName];
										
										_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
										_smgArray pushback _dataArray;
									};
								};
							};
						};
					};
				};
				case "AssaultRifle":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["00Buck", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["12g_buck", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["12Gauge", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["74Slug", (_CfgMagazines select 0)] call BIS_fnc_inString) || (["M441", (_CfgMagazines select 0)] call BIS_fnc_inString))then
							{
								if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
								{
									Crito addWeapon _ClassName;
									
									_wpnItems = primaryWeaponItems Crito;
									_wpnAttachment = false;
									
									if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
									{
										_wpnAttachment = true;
									};
									
									if!(_wpnAttachment)then
									{
										if!(["grip", _ClassName] call BIS_fnc_inString)then
										{
											_quality = 0;
																		
											{
												if((["9x21", _x] call BIS_fnc_inString) || (["9x19", _x] call BIS_fnc_inString) || (["9x39", _x] call BIS_fnc_inString) || (["10mm", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality;
												};
											}forEach _CfgMagazines;
											
											{
												if((["22LR", _x] call BIS_fnc_inString) || (["5x_22", _x] call BIS_fnc_inString) || (["45", _x] call BIS_fnc_inString) || (["46x30", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality + 1;
												};
											}forEach _CfgMagazines;
										
											{
												if((["545", _x] call BIS_fnc_inString) || (["50BW", _x] call BIS_fnc_inString) || (["556", _x] call BIS_fnc_inString) || (["570", _x] call BIS_fnc_inString) || (["507", _x] call BIS_fnc_inString) || (["580", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality + 2;
												};
											}forEach _CfgMagazines;
					
											{
												if((["65x39", _x] call BIS_fnc_inString) || (["68x43", _x] call BIS_fnc_inString) || (["680", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality + 3;
												};
											}forEach _CfgMagazines;

											{
												if((["75x55", _x] call BIS_fnc_inString) || (["762", _x] call BIS_fnc_inString) || (["765", _x] call BIS_fnc_inString) || (["792", _x] call BIS_fnc_inString) || (["Sa58", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality + 4;
												};
											}forEach _CfgMagazines;

											{
												if((["127x108", _x] call BIS_fnc_inString) || (["300", _x] call BIS_fnc_inString) || (["303", _x] call BIS_fnc_inString) || (["338", _x] call BIS_fnc_inString))then
												{
													_quality = assaultRiffleStartQuality + 5;
												};
											}forEach _CfgMagazines;

											if ((["gl", _ClassName] call BIS_fnc_inString))then
											{
												_quality = _quality + 1;
											};
											
											if(_quality > 6)then{_quality = 6;};
											
											_range = 0;
											_accuracy = 999;
											_reloadTime = 999;
																			
											{
												_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
												
												
												_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
												
												
												_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
											}forEach _modes;	
											
											_roundsPerMin = ceil(60 / _reloadTime);
											
											_rangePrice = ceil(rangePrice * _range);
											_accuracyPrice = ceil(accuracyPrice * _accuracy);
											_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
		
											_Price = ceil(assaultRiffleBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
											_totalPriceRound = floor _Price;
											
											_classListformat = format ['"%1",', _ClassName];
											_assRiffleClassList pushBack _classListformat;
											
											_ClassNameCharacters = count _ClassName;
											_addedSpaces = " ";				
											_Spacing = "";
											_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
											_spaceCounter = 0;
											
												for "_i" from 0 to _spacingAmount do
												{
													_spaceCounter = _spaceCounter + 1;
													_Spacing = _Spacing + _addedSpaces;
												};	
												
											_ClassName =  _ClassName splitstring "";
											_Spacing = _Spacing splitstring "";	
											_ClassName = _ClassName + _Spacing;
											_ClassName = _ClassName joinstring "";										
		
											systemChat format ["ADDED: %1",_ClassName];
											
											_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
											_assaultRiffleArray pushback _dataArray;
										};
									};
								};
							};
						};
					};
				};
				case "MachineGun":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
							{
								if!((["FakeWeapon", _ClassName] call BIS_fnc_inString) || (["Vehic", _ClassName] call BIS_fnc_inString) || (["Painless", _ClassName] call BIS_fnc_inString))then
								{
									_canHaveAttachments = compatibleItems _ClassName;
									
									if (count _canHaveAttachments > 0)then
									{
										Crito addWeapon _ClassName;
										_wpnItems = primaryWeaponItems Crito;
										_wpnAttachment = false;
	
										if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
										{
											_wpnAttachment = true;
										};
										
										if!(_wpnAttachment)then
										{
											if!((["grip", _ClassName] call BIS_fnc_inString) || (["rhs_weap_pkp", _ClassName] call BIS_fnc_inString) || (["rhs_weap_rpk74", _ClassName] call BIS_fnc_inString))then
											{
												_quality = 0;
																			
												{
													if(["545", _x] call BIS_fnc_inString)then
													{
														_quality = lmgStartQuality;
													};
												}forEach _CfgMagazines;
												
												{
													if(["556", _x] call BIS_fnc_inString)then
													{
														_quality = lmgStartQuality + 1;
													};
												}forEach _CfgMagazines;
											
												{
													if(["65x39", _x] call BIS_fnc_inString)then
													{
														_quality = lmgStartQuality + 2;
													};
												}forEach _CfgMagazines;
							
												{
													if(["762", _x] call BIS_fnc_inString)then
													{
														_quality = lmgStartQuality + 3;
													};
												}forEach _CfgMagazines;
							
												{
													if(["792", _x] call BIS_fnc_inString)then
													{
														_quality = lmgStartQuality + 4;
													};
												}forEach _CfgMagazines;
							
												{
													if((["93x64", _x] call BIS_fnc_inString) || (["338", _x] call BIS_fnc_inString))then
													{
														_quality = lmgStartQuality + 5;
													};
												}forEach _CfgMagazines;
							
												if ((["gl", _ClassName] call BIS_fnc_inString) || (["AG36", _ClassName] call BIS_fnc_inString))then
												{
													_quality = _quality + 1;
												};
												
												if(_quality > 6)then{_quality = 6;};
												
												_range = 0;
												_accuracy = 999;
												_reloadTime = 999;
																				
												{
													_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
													
													
													_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
													
													
													_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
												}forEach _modes;	
												
												_roundsPerMin = ceil(60 / _reloadTime);
												
												_rangePrice = ceil(rangePrice * _range);
												_accuracyPrice = ceil(accuracyPrice * _accuracy);
												_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
				
												_Price = ceil(lmgBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
												_totalPriceRound = floor _Price;
												
												_classListformat = format ['"%1",', _ClassName];
												_lmgClassList pushBack _classListformat;
												
												_ClassNameCharacters = count _ClassName;
												_addedSpaces = " ";				
												_Spacing = "";
												_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
												_spaceCounter = 0;
												
													for "_i" from 0 to _spacingAmount do
													{
														_spaceCounter = _spaceCounter + 1;
														_Spacing = _Spacing + _addedSpaces;
													};	
													
												_ClassName =  _ClassName splitstring "";
												_Spacing = _Spacing splitstring "";	
												_ClassName = _ClassName + _Spacing;
												_ClassName = _ClassName joinstring "";										
			
												systemChat format ["ADDED: %1",_ClassName];
												
												_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
												_lmgArray pushback _dataArray;
											};
										};
									};
								};
							};
						};
					};
				};
				case "SniperRifle":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
							{
							Crito addWeapon _ClassName;
							_wpnItems = primaryWeaponItems Crito;
							_wpnAttachment = false;
					
							if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
							{
								_wpnAttachment = true;
							};
							
							if!(_wpnAttachment)then
							{
									_quality = 0;
																
									{
										if((["5x_22", _x] call BIS_fnc_inString) || (["9x39", _x] call BIS_fnc_inString))then
										{
											_quality = sniperStartQuality;
										};
									}forEach _CfgMagazines;
									
									{
										if((["556", _x] call BIS_fnc_inString) || (["650", _x] call BIS_fnc_inString) || (["680", _x] call BIS_fnc_inString))then
										{
											_quality = sniperStartQuality + 1;
										};
									}forEach _CfgMagazines;
								
									{
										if(["762", _x] call BIS_fnc_inString)then
										{
											_quality = sniperStartQuality + 2;
										};
									}forEach _CfgMagazines;
							
									{
										if((["3006", _x] call BIS_fnc_inString) || (["300WM", _x] call BIS_fnc_inString) || (["86x70", _x] call BIS_fnc_inString))then
										{
											_quality = sniperStartQuality + 3;
										};
									}forEach _CfgMagazines;
							
									{
										if((["93x64", _x] call BIS_fnc_inString) || (["338", _x] call BIS_fnc_inString) || (["408", _x] call BIS_fnc_inString))then
										{
											_quality = sniperStartQuality + 4;
										};
									}forEach _CfgMagazines;
							
									{
										if((["127", _x] call BIS_fnc_inString) || (["50BMG", _x] call BIS_fnc_inString))then
										{
											_quality = sniperStartQuality + 5;
										};
									}forEach _CfgMagazines;

									if(_quality > 6)then{_quality = 6;};
									
									_range = 0;
									_accuracy = 999;
									_reloadTime = 999;
																	
									{
										_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
										
										
										_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
										
										
										_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
									}forEach _modes;	
									
									_roundsPerMin = ceil(60 / _reloadTime);
									
									_rangePrice = ceil(rangePrice * _range);
									_accuracyPrice = ceil(accuracyPrice * _accuracy);
									_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
				
									_Price = ceil(sniperBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
									_totalPriceRound = floor _Price;
									
									_classListformat = format ['"%1",', _ClassName];
									_sniperClassList pushBack _classListformat;

									_ClassNameCharacters = count _ClassName;
									_addedSpaces = " ";				
									_Spacing = "";
									_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
									_spaceCounter = 0;
									
										for "_i" from 0 to _spacingAmount do
										{
											_spaceCounter = _spaceCounter + 1;
											_Spacing = _Spacing + _addedSpaces;
										};	
										
									_ClassName =  _ClassName splitstring "";
									_Spacing = _Spacing splitstring "";	
									_ClassName = _ClassName + _Spacing;
									_ClassName = _ClassName joinstring "";										
		
									systemChat format ["ADDED: %1",_ClassName];
									
									_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
									_sniperArray pushback _dataArray;
								};
							};
						};
					};
				};
				case "GLauncher":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
							{
								Crito addWeapon _ClassName;
								_wpnItems = primaryWeaponItems Crito;
								_wpnAttachment = false;
						
								if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
								{
									_wpnAttachment = true;
								};
								
								if!(_wpnAttachment)then
								{
									_quality = GLauncherStartQuality;
																					
									if(_quality > 6)then{_quality = 6;};
									
									_range = 0;
									_accuracy = 999;
									_reloadTime = 999;
																	
									{
										_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
										
										
										_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
										
										
										_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
									}forEach _modes;	
									
									_roundsPerMin = ceil(60 / _reloadTime);
									
									_rangePrice = ceil(rangePrice * _range);
									_accuracyPrice = ceil(accuracyPrice * _accuracy);
									_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
				
									_Price = ceil(GLauncherBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
									_totalPriceRound = floor _Price;
									
									_classListformat = format ['"%1",', _ClassName];
									_gLauncherClassList pushBack _classListformat;

									_ClassNameCharacters = count _ClassName;
									_addedSpaces = " ";				
									_Spacing = "";
									_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
									_spaceCounter = 0;
									
										for "_i" from 0 to _spacingAmount do
										{
											_spaceCounter = _spaceCounter + 1;
											_Spacing = _Spacing + _addedSpaces;
										};	
										
									_ClassName =  _ClassName splitstring "";
									_Spacing = _Spacing splitstring "";	
									_ClassName = _ClassName + _Spacing;
									_ClassName = _ClassName joinstring "";										
		
									systemChat format ["ADDED: %1",_ClassName];	
									
									_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
									_gLauncherArray pushback _dataArray;
								};
							};
						};
					};
				};
				case "Shotgun":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
							{
								if!((["m32", _ClassName] call BIS_fnc_inString) || (["m79", _ClassName] call BIS_fnc_inString))then
								{
									Crito addWeapon _ClassName;
									_wpnItems = primaryWeaponItems Crito;
									_wpnAttachment = false;
							
									if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
									{
										_wpnAttachment = true;
									};
									
									if!(_wpnAttachment)then
									{
										_quality = 0;
																	
										{
											if((["12Gauge", _x] call BIS_fnc_inString) || (["AA12", _x] call BIS_fnc_inString))then
											{
												_quality = shotGunStartQuality;
											};
										}forEach _CfgMagazines;
										
										{
											if((["12g_buck", _x] call BIS_fnc_inString) || (["00Buck", _x] call BIS_fnc_inString))then
											{
												_quality = shotGunStartQuality + 1;
											};
										}forEach _CfgMagazines;
										
										{
											if((["74Slug", _x] call BIS_fnc_inString) || (["12_Slug", _x] call BIS_fnc_inString))then
											{
												_quality = shotGunStartQuality + 2;
											};
										}forEach _CfgMagazines;
											
										if(_quality > 6)then{_quality = 6;};
										
										_range = 0;
										_accuracy = 999;
										_reloadTime = 999;
																		
										{
											_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
											
											
											_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
											
											
											_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
										}forEach _modes;	
										
										_roundsPerMin = ceil(60 / _reloadTime);
										
										_rangePrice = ceil(rangePrice * _range);
										_accuracyPrice = ceil(accuracyPrice * _accuracy);
										_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
						
										_Price = ceil(shotGunBasePrice + _rangePrice + _accuracyPrice + _roundsPerMinPrice);
										_totalPriceRound = floor _Price;
										
										_classListformat = format ['"%1",', _ClassName];
										_shotGunClassList pushBack _classListformat;

										_ClassNameCharacters = count _ClassName;
										_addedSpaces = " ";				
										_Spacing = "";
										_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
										_spaceCounter = 0;
										
											for "_i" from 0 to _spacingAmount do
											{
												_spaceCounter = _spaceCounter + 1;
												_Spacing = _Spacing + _addedSpaces;
											};	
											
										_ClassName =  _ClassName splitstring "";
										_Spacing = _Spacing splitstring "";	
										_ClassName = _ClassName + _Spacing;
										_ClassName = _ClassName joinstring "";										
		
										systemChat format ["ADDED: %1",_ClassName];
											
										_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
										_shotGunArray pushback _dataArray;
									};
								};
							};
						};	
					};
				};
				case "Rifle":
				{
					_modes = getArray(configFile >> "CfgWeapons" >> _ClassName >> "modes");						
					if (count _modes >= 1) then
					{	
						_CfgMagazines = getArray (configFile >> "CfgWeapons" >> _ClassName >> "magazines");
						
						if(Count _CfgMagazines >= 1)then
						{
							if!((["base", _ClassName] call BIS_fnc_inString) || (["mounted", _ClassName] call BIS_fnc_inString) || (["empty", _ClassName] call BIS_fnc_inString))then
							{
								Crito addWeapon _ClassName;
								_wpnItems = primaryWeaponItems Crito;
								_wpnAttachment = false;
						
								if !((_wpnItems select 0 == "") && (_wpnItems select 1 == "") && (_wpnItems select 2 == "") && (_wpnItems select 3 == "")) then
								{
									_wpnAttachment = true;
								};
								
								if!(_wpnAttachment)then
								{
									_quality = 0;
																									
									_range = 0;
									_accuracy = 999;
									_reloadTime = 999;
																	
									{
										_range = _range max getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "maxRange");
										
										
										_accuracy = _accuracy min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "dispersion");
										
										
										_reloadTime = _reloadTime min getNumber(configFile >> "CfgWeapons" >> _ClassName >> _x >> "reloadTime");											
									}forEach _modes;	
									
									_roundsPerMin = ceil(60 / _reloadTime);
									
									_rangePrice = ceil(rangePrice * _range);
									_accuracyPrice = ceil(accuracyPrice * _accuracy);
									_roundsPerMinPrice = ceil(roundsPerMinPrice * _roundsPerMin);
					
									_Price = 0;
									_totalPriceRound = floor _Price;
									
									_classListformat = format ['"%1",', _ClassName];
									_unknownClassList pushBack _classListformat;

									_ClassNameCharacters = count _ClassName;
									_addedSpaces = " ";				
									_Spacing = "";
									_spacingAmount = _maxCharacters - _ClassNameCharacters + 20;
									_spaceCounter = 0;
									
										for "_i" from 0 to _spacingAmount do
										{
											_spaceCounter = _spaceCounter + 1;
											_Spacing = _Spacing + _addedSpaces;
										};	
										
									_ClassName =  _ClassName splitstring "";
									_Spacing = _Spacing splitstring "";	
									_ClassName = _ClassName + _Spacing;
									_ClassName = _ClassName joinstring "";										
		
									systemChat format ["ADDED: %1",_ClassName];
									
									//_unknownInfo = format ["Type: %1 || Rounds Per Min: %2 || Max Range: %3 || Accuracy: %4",_itemType,_roundsPerMin,_range,_accuracy];
									_dataArray = format ['class %1{quality = %2; price = %3;};',_ClassName,_quality,_totalPriceRound];
									_unknownArray pushback _dataArray;
								};
							};
						};
					};
				};
			};		
		};			
	};	
	_counter = _counter + 1;	/// counter to stop the array building loop		
};


	{
		_hGunArrayFormat = _hGunArrayFormat + format['%1%2',_x, endl];
	}forEach _hGunArray;
	
	{
		_shGunArrayFormat = _shGunArrayFormat + format['%1%2',_x, endl];
	}forEach _shotGunArray;
	
	{
		_smgArrayFormat = _smgArrayFormat + format['%1%2',_x, endl];
	}forEach _smgArray;
	
	{
		_assrArrayFormat = _assrArrayFormat + format['%1%2',_x, endl];
	}forEach _assaultRiffleArray;
	
	{
		_lmgArrayFormat = _lmgArrayFormat + format['%1%2',_x, endl];
	}forEach _lmgArray;
	
	{
		_sniperArrayFormat = _sniperArrayFormat + format['%1%2',_x, endl];
	}forEach _sniperArray;
	
	{
		_glArrayFormat = _glArrayFormat + format['%1%2',_x, endl];
	}forEach _gLauncherArray;
	
	{
		_unkwnArrayFormat = _unkwnArrayFormat + format['%1%2',_x, endl];
	}forEach _unknownArray;
	
	{
		_hGunClassListFormat = _hGunClassListFormat + format['%1%2',_x, endl];
	}forEach _hGunClassList;

	{
		_smgClassListFormat = _smgClassListFormat + format['%1%2',_x, endl];
	}forEach _smgClassList;

	{
		_assRifClassListFormat = _assRifClassListFormat + format['%1%2',_x, endl];
	}forEach _assRiffleClassList;

	{
		_lmgClassListFormat = _lmgClassListFormat + format['%1%2',_x, endl];
	}forEach _lmgClassList;

	{
		_sniperCalssListFormat = _sniperCalssListFormat + format['%1%2',_x, endl];
	}forEach _sniperClassList;

	{
		_gLClassListFormat = _gLClassListFormat + format['%1%2',_x, endl];
	}forEach _gLauncherClassList;

	{
		_shGnClassListFormat = _shGnClassListFormat + format['%1%2',_x, endl];
	}forEach _shotGunClassList;

	{
		_unknClassListFormat = _unknClassListFormat + format['%1%2',_x, endl];
	}forEach _unknownClassList;

	_finalPriceInfo = composeText ["/////PRICING/////",_br,_br,"//HAND GUNS:",_br,_hGunArrayFormat,_br,_br,"//SHOTGUNS:",_br,_shGunArrayFormat,_br,_br,"//SUBMACHINE GUNS:",_br,_smgArrayFormat,_br,_br,"//ASSAULT RIFFLES:",_br,_assrArrayFormat,_br,_br,"//LIGHT MACHINE GUNS:",_br,_lmgArrayFormat,_br,_br,"//SNIPER RIFFLES:",_br,_sniperArrayFormat,_br,_br,"//GRENADE LAUNCHERS:",_br,_glArrayFormat,_br,_br,"//UNKNOWN:",_br,_unkwnArrayFormat,_br,
	_br,_br,"/////CLASS NAMES/////",_br,_br,"//HAND GUNS:",_br,_hGunClassListFormat,_br,_br,"//SHOTGUNS:",_br,_shGnClassListFormat,_br,_br,"//SUBMACHINE GUNS:",_br,_smgClassListFormat,_br,_br,"//ASSAULT RIFFLES:",_br,_assRifClassListFormat,_br,_br,"//LIGHT MACHINE GUNS:",_br,_lmgClassListFormat,_br,_br,"//SNIPER RIFFLES:",_br,_sniperCalssListFormat,_br,_br,"//GRENADE LAUNCHERS:",_br,_gLClassListFormat,_br,_br,"//UNKNOWN:",_br,_unknClassListFormat,_br];
	copyToClipboard str _finalPriceInfo;

systemChat str "AUTO PRICING POVIDED BY CRITO";
systemChat str "COMPLETE AND COPIED TO CLIPBOARD READY TO PASTE";
