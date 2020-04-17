# TeleportLocation

# *poof* away
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

# Move the armor stand to location
execute as @s run execute store result entity @s Pos[0] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosX
execute as @s run execute store result entity @s Pos[1] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosY
execute as @s run execute store result entity @s Pos[2] double 1 run data get entity @e[tag=TeleportSource,sort=nearest,limit=1] ArmorItems[3].tag.portalPosZ

# Dimension fix
execute at @s in minecraft:overworld if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:0}}]}] run tp @s ~0.5 ~ ~0.5
execute at @s in minecraft:the_nether if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:-1}}]}] run tp @s ~0.5 ~ ~0.5
execute at @s in minecraft:the_end if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:1}}]}] run tp @s ~0.5 ~ ~0.5

# Tp to stand
execute at @s in minecraft:overworld if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:0}}]}] run tp @e[tag=TeleportingEntity] ~ ~ ~
execute at @s in minecraft:the_nether if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:-1}}]}] run tp @e[tag=TeleportingEntity] ~ ~ ~
execute at @s in minecraft:the_end if entity @e[tag=TeleportSource,sort=nearest,limit=1,nbt={ArmorItems:[{},{},{},{tag:{portalDim:1}}]}] run tp @e[tag=TeleportingEntity] ~ ~ ~

# https://minecraft.gamepedia.com/Commands/spreadplayers
# Spreadplayers may not work because it takes the player to the surface, which would break underground teleporters

# Grant invincible for short time
effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

# *poof* in
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
