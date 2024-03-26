# @e[tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal]

execute at @s run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.1 3
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 run kill @e[dx=1,dz=1,dy=5,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}]
tag @s add PrimedPortal
