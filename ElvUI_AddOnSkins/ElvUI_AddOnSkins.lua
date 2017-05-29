local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0", true)
local AS = E:NewModule("AddOnSkins")

local AddOnName = ...

local find, lower, match, trim = string.find, string.lower, string.match, string.trim

local GetAddOnInfo = GetAddOnInfo

local addonList = {
	"_NPCScan",
	"AckisRecipeList",
	"ACP",
	"AdvancedTradeSkillWindow",
	"Archy",
	"Atlas",
	"AtlasLoot",
	"AtlasQuest",
	"AutoEquipQuestItem",
	"BindPad",
	"BugSack",
	"BuyEmAll",
	"Clique",
	"DBM",
	"Doom_CooldownPulse",
	"EveryGoldToBanker",
	"ExtVendor",
	"Factionizer",
	"FishingBuddy",
	"FlightMap",
	"InspectEquip",
	"KarniCrap",
	"KHunterTimers",
	"LightHeaded",
	"MageNuggets",
	"Omen",
	"OneClickEnchantScroll",
	"Overachiever",
	"PallyPower",
	"PlateBuffs",
	"Poisoner",
	"Postal",
	"QuestCompletist",
	"Recount",
	"SexyCooldown",
	"Skada",
	"Spy",
	"Titan",
	"TotemTimers",
	"TradeskillInfo",
	"VanasKoS",
	"WeakAuras",
	"WowLua",
}

AS.addOns = {}

for i = 1, GetNumAddOns() do
	local name, _, _, enabled = GetAddOnInfo(i)
	AS.addOns[lower(name)] = enabled ~= nil
end

function AS:CheckAddOn(addon)
	return self.addOns[lower(addon)] or false
end

function AS:RegisterAddonOption(AddonName, options)
	if select(6, GetAddOnInfo(AddonName)) == "MISSING" then return end

	options.args.skins.args.addOns.args[AddonName] = {
		type = "toggle",
		name = AddonName,
		desc = L["TOGGLESKIN_DESC"],
		hidden = function() return not self:CheckAddOn(AddonName) end
	}
end

local function ColorizeSettingName(settingName)
	return format("|cff1784d1%s|r", settingName)
end

local function getOptions()
	local options = {
		order = 53,
		type = "group",
		name = ColorizeSettingName(L["AddOn Skins"]),
		childGroups = "tab",
		args = {
			skins = {
				order = 1,
				type = "group",
				name = L["Skins"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Skins"]
					},
					addOns = {
						order = 2,
						type = "group",
						name = L["AddOn Skins"],
						guiInline = true,
						get = function(info) return E.private.addOnSkins[info[#info]] end,
						set = function(info, value) E.private.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						args = {}
					},
					blizzard = {
						order = 3,
						type = "group",
						name = L["Blizzard Skins"],
						guiInline = true,
						get = function(info) return E.private.addOnSkins[info[#info]] end,
						set = function(info, value) E.private.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						args = {
							Blizzard_WorldStateFrame = {
								type = "toggle",
								name = "WorldStateFrame",
								desc = L["TOGGLESKIN_DESC"],
							}
						}
					}
				}
			},
			misc = {
				order = 2,
				type = "group",
				name = L["Misc Options"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Misc Options"]
					},
					skadaGroup = {
						order = 2,
						type = "group",
						name = "Skada",
						guiInline = true,
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value Skada:UpdateDisplay() end,
						disabled = function() return not AS:CheckAddOn("Skada") end,
						args = {
							skadaTemplate = {
								order = 1,
								type = "select",
								name = L["Skada Template"],
								values = {
									["Default"] = L["Default"],
									["Transparent"] = L["Transparent"],
									["NONE"] = NONE
								}
							},
							skadaTemplateGloss = {
								order = 2,
								type = "toggle",
								name = L["Skada Template Gloss"],
								disabled = function() return E.db.addOnSkins.skadaTemplate == "Transparent" or E.db.addOnSkins.skadaTemplate == "NONE" or not AS:CheckAddOn("Skada") end
							},
							spacer = {
								order = 3,
								type = "description",
								name = ""
							},
							skadaTitleTemplate = {
								order = 4,
								type = "select",
								name = L["Skada Title Template"],
								values = {
									["Default"] = L["Default"],
									["Transparent"] = L["Transparent"],
									["NONE"] = NONE
								}
							},
							skadaTitleTemplateGloss = {
								order = 5,
								type = "toggle",
								name = L["Skada Title Template Gloss"],
								disabled = function() return E.db.addOnSkins.skadaTitleTemplate == "Transparent" or E.db.addOnSkins.skadaTitleTemplate == "NONE" or not AS:CheckAddOn("Skada") end
							}
						}
					},
					dbmGroup = {
						order = 3,
						type = "group",
						name = "DBM",
						guiInline = true,
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value DBM.Bars:ApplyStyle() DBM.BossHealth:UpdateSettings() end,
						disabled = function() return not AS:CheckAddOn("DBM-Core") end,
						args = {
							dbmBarHeight = {
								order = 1,
								type = "range",
								name = L["Bar Height"],
								min = 6, max = 60,
								step = 1
							},
							spacer = {
								order = 2,
								type = "description",
								name = ""
							},
							dbmFont = {
								order = 3,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font
							},
							dbmFontSize = {
								order = 4,
								type = "range",
								name = L["Font Size"],
								min = 6, max = 22, step = 1
							},
							dbmFontOutline = {
								order = 5,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = NONE,
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								}
							}
						}
					},
					waGroup = {
						order = 4,
						type = "group",
						name = "WeakAuras",
						guiInline = true,
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						disabled = function() return not AS:CheckAddOn("WeakAuras") end,
						args = {
							weakAuraAuraBar = {
								order = 1,
								type = "toggle",
								name = L["AuraBar Backdrop"]
							},
							weakAuraIconCooldown = {
								order = 2,
								type = "toggle",
								name = L["WeakAura Cooldowns"]
							}
						}
					}
				}
			},
			embed = {
				order = 3,
				type = "group",
				name = L["Embed Settings"],
				get = function(info) return E.db.addOnSkins.embed[info[#info]] end,
				set = function(info, value) E.db.addOnSkins.embed[info[#info]] = value E:GetModule("EmbedSystem"):Check() end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Embed Settings"],
					},
					desc = {
						order = 2,
						type = "description",
						name = L["Settings to control Embedded AddOns\n\nAvailable Embeds: Omen | Skada | Recount"]
					},
					rightChat = {
						order = 3,
						type = "toggle",
						name = L["Embed into Right Chat Panel"]
					},
					belowTop = {
						order = 4,
						type = "toggle",
						name = L["Embed Below Top Tab"]
					},
					spacer = {
						order = 5,
						type = "description",
						name = "",
						width = "full"
					},
					embedType = {
						order = 6,
						type = "select",
						name = L["Embed Type"],
						values = {
							["DISABLE"] = L["Disable"],
							["SINGLE"] = L["Single"],
							["DOUBLE"] = L["Double"]
						}
					},
					left = {
						order = 7,
						type = "select",
						name = L["Left Panel"],
						values = {
							["Recount"] = "Recount",
							["Omen"] = "Omen",
							["Skada"] = "Skada"
						},
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					},
					right = {
						order = 8,
						type = "select",
						name = L["Right Panel"],
						values = {
							["Recount"] = "Recount",
							["Omen"] = "Omen",
							["Skada"] = "Skada"
						},
						disabled = function() return E.db.addOnSkins.embed.embedType ~= "DOUBLE" end
					},
					leftWidth = {
						order = 9,
						type = "range",
						name = L["Embed Left Window Width"],
						min = 100,
						max = 300,
						step = 1
					},
					hideChat = {
						order = 10,
						type = "select",
						name = L["Hide Chat Frame"],
						values = E:GetModule("EmbedSystem"):GetChatWindowInfo(),
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					}
				}
			}
		}
	}

	for _, addonName in pairs(addonList) do
		AS:RegisterAddonOption(addonName, options)
	end

	E.Options.args.addOnSkins = options
end

function AS:Initialize()
	EP:RegisterPlugin(AddOnName, getOptions)
end

E:RegisterModule(AS:GetName())