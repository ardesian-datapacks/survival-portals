# @e[tag=zPortal, tag=SummonPortKey]

execute as @s at @s run function ardesian:teleporter/throw

execute at @s as @e[limit=1,sort=nearest,nbt={Item:{tag:{PortKey:1b}}}] run function ardesian:teleporter/set_port_key_data
execute as @s run tag @s remove SummonPortKey
