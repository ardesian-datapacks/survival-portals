# @s = the TeleportLocation marker stand, positioned at the source portal.

# Granted before the jump so it survives the dimension change.
effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

# *poof* away (still in the source dimension)
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash{color:[1.0,1.0,1.0,1.0]} ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

# Read the destination off the port key stored on the portal's head slot.
data remove storage ardesian:teleport dest
execute store result storage ardesian:teleport dest.x int 1 run data get entity @e[type=minecraft:armor_stand,tag=TeleportSource,sort=nearest,limit=1] equipment.head.components."minecraft:custom_data".portalPosX
execute store result storage ardesian:teleport dest.y int 1 run data get entity @e[type=minecraft:armor_stand,tag=TeleportSource,sort=nearest,limit=1] equipment.head.components."minecraft:custom_data".portalPosY
execute store result storage ardesian:teleport dest.z int 1 run data get entity @e[type=minecraft:armor_stand,tag=TeleportSource,sort=nearest,limit=1] equipment.head.components."minecraft:custom_data".portalPosZ
data modify storage ardesian:teleport dest.dim set from entity @e[type=minecraft:armor_stand,tag=TeleportSource,sort=nearest,limit=1] equipment.head.components."minecraft:custom_data".portalDim

# Bind the traveller as @s first - @e cannot see across dimensions - then hand the
# destination to the macro, which does the dimension switch before positioning.
execute if data storage ardesian:teleport dest.dim as @e[tag=TeleportingEntity] run function ardesian:teleporter/do_teleport with storage ardesian:teleport dest

# *poof* in - the traveller may now be in a different dimension than this function
execute in minecraft:overworld as @e[tag=TeleportingEntity] at @s run function ardesian:teleporter/arrive
execute in minecraft:the_nether as @e[tag=TeleportingEntity] at @s run function ardesian:teleporter/arrive
execute in minecraft:the_end as @e[tag=TeleportingEntity] at @s run function ardesian:teleporter/arrive
