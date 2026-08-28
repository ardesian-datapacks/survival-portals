execute as @e[type=minecraft:armor_stand,tag=zPortal] run function ardesian:teleporter/validate_portal

# Ender Eye detection
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=!PortalLocationSet] at @s if data entity @e[type=minecraft:item,distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:ender_eye", components:{"minecraft:custom_data":{PortKey:1b}}}}] Thrower run function ardesian:teleporter/connect_portal
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_eye"}}] if data entity @s Thrower run function ardesian:teleporter/create_portal

# Prime Teleporter
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal] at @s if entity @e[type=minecraft:item,distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}] run function ardesian:teleporter/power_portal

# Teleporter functionality
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=SummonPortKey] run function ardesian:teleporter/summon_port_key
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=!PortalLocationSet] at @s run title @p[distance=..1] actionbar {"text": "No Destination", "color": "yellow"}
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal] at @s run title @p[distance=..1] actionbar {"text": "No Power", "color": "yellow"}
execute as @e[type=minecraft:armor_stand,tag=zPortal,tag=PortalLocationSet,tag=PrimedPortal] at @s if entity @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] run function ardesian:teleporter/init_teleport
