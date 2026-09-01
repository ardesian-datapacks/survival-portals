# @s = @e[type=minecraft:armor_stand,tag=QuickPort] with something standing in it.

# init_teleport tags @s as TeleportSource and reads the key off its head slot,
# so the whole permanent-portal teleport chain works unchanged.
execute as @s at @s run function ardesian:teleporter/init_teleport

# Single use.
kill @s
