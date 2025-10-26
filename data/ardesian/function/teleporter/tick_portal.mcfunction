# @s[tag=zPortal] if entity @p[distance=..32]
function ardesian:teleporter/validate_portal

execute as @s[tag=SummonPortKey] run function ardesian:teleporter/summon_port_key

### Prime Teleporter
execute as @s[tag=PortalLocationSet,tag=!PrimedPortal] at @s positioned ~-0.5 ~-1 ~-0.5 \
  if entity @e[dx=0,dz=0,dy=3,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}] \
  run function ardesian:teleporter/power_portal

### Teleporter functionality
execute as @s[tag=!PortalLocationSet] at @s positioned ~-0.5 ~-1 ~-0.5 \
  run title @p[dx=0,dz=0,dy=3] actionbar {"text": "No Destination", "color": "yellow"}
execute as @s[tag=PortalLocationSet,tag=!PrimedPortal] at @s positioned ~-0.5 ~-1 ~-0.5 \
  run title @p[dx=0,dz=0,dy=3] actionbar {"text": "No Power", "color": "yellow"}
execute as @s[tag=PortalLocationSet,tag=PrimedPortal] at @s positioned ~-0.5 ~-1 ~-0.5 \
  if entity @e[dx=0,dz=0,dy=3,type=!minecraft:item,type=!minecraft:item_display,type=!minecraft:armor_stand] \
  run function ardesian:teleporter/init_teleport
