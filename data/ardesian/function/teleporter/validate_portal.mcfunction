# Scope of portal armor_stand[zPortal]

# Add each of the tags if they are valid
execute as @s at @s unless block ~ ~-1 ~ minecraft:redstone_block run function ardesian:teleporter/break_portal
execute as @s at @s unless block ~ ~ ~ minecraft:air run function ardesian:teleporter/break_portal
execute as @s at @s unless block ~ ~1 ~ minecraft:air run function ardesian:teleporter/break_portal
execute as @s at @s unless block ~ ~2 ~ minecraft:air run function ardesian:teleporter/break_portal
execute as @s at @s unless block ~ ~3 ~ minecraft:sea_lantern run function ardesian:teleporter/break_portal
