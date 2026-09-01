# A bound PortKey lying on the ground with a chorus fruit dropped on it makes a
# single-use, one-way portal to wherever the key points. portalDim is only set by
# set_port_key_data, so testing it skips keys that were never bound to a portal.
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_eye", components:{"minecraft:custom_data":{PortKey:1b}}}}] at @s if data entity @s Item.components."minecraft:custom_data".portalDim if entity @e[type=minecraft:item,distance=..0.5,nbt={Item:{id:"minecraft:chorus_fruit"}}] run function ardesian:quickport/summon

execute as @e[type=minecraft:armor_stand,tag=QuickPort] at @s if entity @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] run function ardesian:quickport/teleport
