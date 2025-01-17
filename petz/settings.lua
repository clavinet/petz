local modpath, S = ...

local settings = Settings(modpath .. "/petz.conf")

--A list with all the petz names
petz.settings.petz_list = settings:get("petz_list", "")
petz.petz_list = string.split(petz.settings.petz_list, ',')

petz.settings.type_model = settings:get("type_model", "mesh")
petz.settings.tamagochi_mode = settings:get_bool("tamagochi_mode", true)
petz.settings.tamagochi_check_time = tonumber(settings:get("tamagochi_check_time"))
petz.settings.tamagochi_hunger_damage = tonumber(settings:get("tamagochi_hunger_damage"))
petz.settings.tamagochi_check_if_player_online = settings:get_bool("tamagochi_check_if_player_online", true)
--Create a table with safe nodes
local tamagochi_safe_nodes = settings:get("tamagochi_safe_nodes", "")
petz.settings.tamagochi_safe_nodes = {} --Table with safe nodes for tamagochi mode
petz.settings.tamagochi_safe_nodes = string.split(tamagochi_safe_nodes, ',')
--Enviromental Damage
petz.settings.air_damage = tonumber(settings:get("air_damage"))
petz.settings.igniter_damage = tonumber(settings:get("igniter_damage")) --lava & fire
--API Type
petz.settings.type_api = settings:get("type_api", "mobs_redo")
--Capture Mobs
petz.settings.rob_mobs = settings:get_bool("rob_mobs", false)
--Spawn Engine
petz.settings.spawn_interval = tonumber(settings:get("spawn_interval"))
petz.settings.max_mobs = tonumber(settings:get("max_mobs"))
--Lay Eggs
petz.settings.lay_egg_chance = tonumber(settings:get("lay_egg_chance"))
--Misc Random Sound Chance
petz.settings.misc_sound_chance = tonumber(settings:get("misc_sound_chance"))
petz.settings.max_hear_distance = tonumber(settings:get("max_hear_distance"))
--Fly Behaviour
petz.settings.fly_check_time = tonumber(settings:get("fly_check_time")) 
--Breed Engine
petz.settings.pregnant_count = tonumber(settings:get("pregnant_count"))
petz.settings.pregnancy_time = tonumber(settings:get("pregnancy_time"))
petz.settings.growth_time = tonumber(settings:get("growth_time"))
--Lashing
petz.settings.lashing_tame_count = tonumber(settings:get("lashing_tame_count", "3"))

--Mobs Specific
for i = 1, #petz.petz_list do --load the settings
	local petz_type = petz.petz_list[i]
	petz.settings[petz_type.."_spawn"]  = settings:get_bool(petz_type.."_spawn", false)
	petz.settings[petz_type.."_spawn_chance"]  = tonumber(settings:get(petz_type.."_spawn_chance")) or 0.0
	petz.settings[petz_type.."_spawn_nodes"]  = settings:get(petz_type.."_spawn_nodes", "")	
	petz.settings[petz_type.."_spawn_biome"]  = settings:get(petz_type.."_spawn_biome", "default")
	petz.settings[petz_type.."_follow"] = settings:get(petz_type.."_follow", "")
	petz.settings[petz_type.."_breed"]  = settings:get(petz_type.."_breed", "")
	petz.settings[petz_type.."_predators"]  = settings:get(petz_type.."_predators", "")
	petz.settings[petz_type.."_preys"] = settings:get(petz_type.."_preys", "")
	petz.settings[petz_type.."_copulation_distance"] = tonumber(settings:get(petz_type.."_copulation_distance"))
	if petz_type == "beaver" then
		petz.settings[petz_type.."_create_dam"] = settings:get_bool(petz_type.."_create_dam", false)
	elseif petz_type == "wolf" then
		petz.settings[petz_type.."_to_puppy_count"] = tonumber(settings:get(petz_type.."_to_puppy_count")) or 0.0
	elseif petz_type == "silkworm" then
		petz.settings[petz_type.."_lay_egg_on_node "] = settings:get(petz_type.."_lay_egg_on_node", "")
	end	
end

if petz.settings.type_model == "mesh" then
    petz.settings.visual = "mesh"
    petz.settings.visual_size = {x=15.0, y=15.0}
    petz.settings.rotate = 0
else -- is 'cubic'
    petz.settings.visual = "wielditem"
    petz.settings.visual_size = {x=1.0, y=1.0}
    petz.settings.rotate = 180
end
