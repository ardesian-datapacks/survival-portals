# Port Key
execute as @s run execute store result entity @s Item.tag.portalPosX double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[0]
execute as @s run execute store result entity @s Item.tag.portalPosY double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[1]
execute as @s run execute store result entity @s Item.tag.portalPosZ double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[2]
execute as @s run execute store result entity @s Item.tag.portalDim int 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Dimension
