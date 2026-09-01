# Scope of portal armor_stand[zPortal]

# Portals survive a slab, sign, carpet, ladder etc. in the frame - only a solid
# block breaks them. Collect the verdict on a tag first so break_portal is
# called once, not once per failed check.
execute as @s at @s unless block ~ ~-1 ~ minecraft:redstone_block run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~ ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~1 ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~2 ~ #survival_portals:non_solid run tag @s add InvalidPortal
execute as @s at @s unless block ~ ~3 ~ minecraft:sea_lantern run tag @s add InvalidPortal

execute as @s[tag=InvalidPortal] run function ardesian:teleporter/break_portal
