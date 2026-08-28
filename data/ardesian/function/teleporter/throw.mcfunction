# @s = Entity throwing the item

execute as @s run tag @s add Thrower

# Clear any helper left behind by an earlier throw whose chunk was unloaded
kill @e[type=minecraft:armor_stand,tag=AngleChecker]
kill @e[type=minecraft:area_effect_cloud,tag=CosSin]

# Summon armor stand at 0,0,0 at the same angle as the thrower
summon minecraft:armor_stand 0 0 0 {Tags: ["AngleChecker"]}
execute as @e[type=minecraft:armor_stand,tag=AngleChecker] run execute store result entity @s Rotation[0] float 1 run data get entity @e[tag=Thrower,limit=1] Rotation[0]

# Summon an entity in front of the stand, its Pos acts as cos/sin
execute as @e[type=minecraft:armor_stand,tag=AngleChecker] at @s run summon minecraft:area_effect_cloud ^ ^ ^1 {Tags: ["CosSin"], Duration: 200}

# Summon the item to throw, with some vertical motion to simulate a "throw"
execute at @s run summon minecraft:item ~ ~1 ~ {Tags: ["Thrown"], Motion: [0.0d, 0.3d, 0.0d], Item: {id: "minecraft:ender_eye", count: 1, components: {"minecraft:custom_data": {PortKey: 1b}, "minecraft:custom_name": {text: "Port Key", italic: false}, "minecraft:enchantments": {"minecraft:efficiency": 5}, "minecraft:tooltip_display": {hidden_components: ["minecraft:enchantments"]}}}}

# Put cos/sin as motion on thrown item at a scale of 0.1 to reduce throw distance
execute as @e[type=minecraft:item,tag=Thrown] run execute store result entity @s Motion[0] double 0.1 run data get entity @e[type=minecraft:area_effect_cloud,tag=CosSin,limit=1] Pos[0] 1
execute as @e[type=minecraft:item,tag=Thrown] run execute store result entity @s Motion[2] double 0.1 run data get entity @e[type=minecraft:area_effect_cloud,tag=CosSin,limit=1] Pos[2] 1

# Clean up
kill @e[type=minecraft:armor_stand,tag=AngleChecker]
kill @e[type=minecraft:area_effect_cloud,tag=CosSin]
tag @e[type=minecraft:item,tag=Thrown] remove Thrown
tag @e[tag=Thrower] remove Thrower
