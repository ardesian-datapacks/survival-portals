# @s[tag=zPortal] if entity @p[distance=..32]
function ardesian:teleporter/validate_portal

execute as @s[tag=SummonPortKey] run function ardesian:teleporter/summon_port_key

# HAS PortKey
# ,nbt={Item:{components:{"minecraft:custom_data":{PortKey:1b}}}}
# NOT has PortKey
# unless data entity @s Item.components."minecraft:custom_data".PortKey

### Ender Eye detection
# execute as
  # if data entity @e[distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}] Thrower \
# execute as @e[tag=!PortalLocationSet] at @s \
  if data entity @e[distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}] Thrower \
#   run function ardesian:teleporter/connect_portal
# 𐄂 execute as @e[nbt={Item:{id:"minecraft:ender_eye"}}] at @s \
# 𐄂   if entity @p[distance=..32] if data entity @s Thrower \
# 𐄂   run function ardesian:teleporter/create_portal

### Prime Teleporter
execute as @s[tag=PortalLocationSet,tag=!PrimedPortal] at @s positioned ~ ~-1 ~ \
  if entity @e[dx=0,dz=0,dy=3,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}] \
  run function ardesian:teleporter/power_portal

### Teleporter functionality
execute as @s[tag=!PortalLocationSet] at @s \
  run title @p[distance=..1] actionbar {"text": "No Destination", "color": "yellow"}
execute as @s[tag=PortalLocationSet,tag=!PrimedPortal] at @s \
  run title @p[distance=..1] actionbar {"text": "No Power", "color": "yellow"}
execute as @s[tag=PortalLocationSet,tag=PrimedPortal] at @s \
  if entity @e[distance=..1,type=!minecraft:item,type=!minecraft:item_display,type=!minecraft:armor_stand] \
  run function ardesian:teleporter/init_teleport
