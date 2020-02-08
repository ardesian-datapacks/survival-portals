execute as @e[tag=zPortal] run function ardesian:teleporter/validate_portal

# Ender Eye detection
execute as @e[tag=zPortal,tag=!PortalLocationSet] at @s if data entity @e[distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}] Thrower.L run function ardesian:teleporter/connect_portal
execute as @e[nbt={Item:{id:"minecraft:ender_eye"}}] if data entity @s Thrower.L run function ardesian:teleporter/create_portal

# Prime Teleporter
execute as @e[tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal] at @s if entity @e[distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}] run function ardesian:teleporter/power_portal

# Teleporter functionality
execute as @e[tag=zPortal,tag=SummonPortKey] run function ardesian:teleporter/summon_port_key
execute as @e[tag=zPortal,tag=!PortalLocationSet] at @s run title @p[distance=..1] actionbar {"text": "No Destination", "color": "yellow"}
execute as @e[tag=zPortal,tag=PortalLocationSet,tag=!PrimedPortal] at @s run title @p[distance=..1] actionbar {"text": "No Power", "color": "yellow"}
execute as @e[tag=zPortal,tag=PortalLocationSet,tag=PrimedPortal] at @s if entity @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] run function ardesian:teleporter/init_teleport
