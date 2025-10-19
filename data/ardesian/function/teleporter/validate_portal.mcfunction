# Scope of portal armor_stand[zPortal]

execute as @s at @s unless block ~ ~-1 ~ minecraft:redstone_block run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~ ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~1 ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~2 ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~3 ~ minecraft:sea_lantern run tag @s add InvalidPortal

execute as @s[tag=InvalidPortal] run function ardesian:teleporter/break_portal
