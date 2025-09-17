# PortKey and Chorus Fruit on the ground creates a 1 way portal
execute as @e[type=item,nbt={Item:{id:"minecraft:ender_eye",tag:{PortKey:1b}}}] at @s run execute if entity @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}},distance=..0.5] run function ardesian:quickport/summon

execute as @e[tag=QuickPort] at @s if entity @e[distance=..1,type=!minecraft:item,type=!minecraft:armor_stand] run function ardesian:quickport/teleport
