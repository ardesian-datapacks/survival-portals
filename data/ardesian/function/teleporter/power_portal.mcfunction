# @e[tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal]

execute at @s run particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.1 3
execute at @s positioned ~-0.5 ~-1 ~-0.5 \
  run kill @e[dx=0,dz=0,dy=3,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}]
tag @s add PrimedPortal
