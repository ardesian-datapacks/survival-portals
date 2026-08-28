# @e[type=minecraft:armor_stand,tag=zPortal, tag=SummonPortKey]

execute as @s at @s run function ardesian:teleporter/throw

execute at @s as @e[type=minecraft:item,distance=..5,limit=1,sort=nearest,nbt={Item:{components:{"minecraft:custom_data":{PortKey:1b}}}}] run function ardesian:teleporter/set_port_key_data
execute as @s run tag @s remove SummonPortKey
