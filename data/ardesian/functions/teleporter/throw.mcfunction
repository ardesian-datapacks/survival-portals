# @s = Entity throwing the item

execute as @s run tag @s add Thrower

# Summon armor stand at 0,0,0 at the same angle as the thrower
summon minecraft:armor_stand 0 0 0 {Tags: ["AngleChecker"]}
execute as @e[tag=AngleChecker] run execute store result entity @s Rotation[0] float 1 run data get entity @e[tag=Thrower,limit=1] Rotation[0]

# Summon an entity in front of the stand, its Pos acts as cos/sin
execute as @e[tag=AngleChecker] at @s run summon minecraft:area_effect_cloud ^ ^ ^1 {Tags: ["CosSin"], Duration: 200}

# Summon the item to throw, with some vertical motion to simulate a "throw"
execute at @s run summon minecraft:item ~ ~1 ~ {Tags: ["Thrown"], Motion: [0.0d, 0.3d, 0.0d], Item: { id: "minecraft:ender_eye", Count: 1, tag: { display:{Name:'{"text":"PortKey","italic":false}'}, Enchantments: [{id: efficiency, lvl: 5s}], PortKey: 1b, HideFlags: 1b } }}

# Put cos/sin as motion on thrown item at a scale of 0.1 to reduce throw distance
execute as @e[tag=Thrown] run execute store result entity @s Motion[0] double 0.1 run data get entity @e[tag=CosSin,limit=1] Pos[0] 1
execute as @e[tag=Thrown] run execute store result entity @s Motion[2] double 0.1 run data get entity @e[tag=CosSin,limit=1] Pos[2] 1

# Clean up
kill @e[tag=AngleChecker]
kill @e[tag=CosSin]
tag @e remove Thrown
tag @e remove Thrower
