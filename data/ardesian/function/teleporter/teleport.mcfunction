# @e[tag=TeleportLocation]

# *poof* away
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run particle minecraft:flash{color:[1,1,1,1]} ~ ~0.5 ~
execute at @s run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20

# Move the armor stand to location
execute store result entity @s Pos[0] double 1 run \
  data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1] \
    item.components."minecraft:custom_data".portalPosX
execute store result entity @s Pos[1] double 1 run \
  data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1] \
    item.components."minecraft:custom_data".portalPosY
execute store result entity @s Pos[2] double 1 run \
  data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1] \
    item.components."minecraft:custom_data".portalPosZ
    # data modify entity @s Rotation[0] set value 180.0f

# Grant invincible for short time
effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

execute if entity @e[type=item_display] \
  run say ALL-item_display
execute if entity @e[type=item_display,tag=PortKeyDisplay] \
  run say ALL-PortKeyDisplay
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1] \
  run say PortKeyDisplay
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1,nbt={item:{components:{"minecraft:custom_data":{portalDim:"overworld"}}}}] \
  run say Overworld
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1,nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_nether"}}}}] \
  run say Nether
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1,nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_end"}}}}] \
  run say TheEnd

tellraw @a [ \
  {"text":"TeleportSource Pos: "}, \
  {"nbt":"Pos","entity":"@s"}, \
  {"text":" Dim: "}, \
  {"nbt":"item.components.\"minecraft:custom_data\".portalDim","entity":"@e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1]"} \
]
tellraw @a [ \
  {"text":"TeleportingEntity Pos: "}, \
  {"nbt":"Pos","entity":"@e[tag=TeleportingEntity,limit=1,sort=nearest]"}, \
  {"text":" Dim: "}, \
  {"nbt":"Dimension","entity":"@e[tag=TeleportingEntity,limit=1,sort=nearest]"} \
]

# Tp to stand
# Overworld
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1, \
  nbt={item:{components:{"minecraft:custom_data":{portalDim:"overworld"}}}}] run \
  execute in minecraft:overworld positioned as @s run \
    tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# Nether
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1, \
  nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_nether"}}}}] run \
  execute in minecraft:the_nether positioned as @s run \
    tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# End
execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..1, \
  nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_end"}}}}] run \
  execute in minecraft:the_end positioned as @s run \
    tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
execute as @e[tag=TeleportingEntity] at @s run tp @s ~ ~ ~ ~180 ~

# https://minecraft.gamepedia.com/Commands/spreadplayers
# Spreadplayers may not work because it takes the player to the surface, which would break underground teleporters

# *poof* in
execute at @e[tag=TeleportingEntity] run playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @e[tag=TeleportingEntity] run particle minecraft:flash{color:[1,1,1,1]} ~ ~0.5 ~
execute at @e[tag=TeleportingEntity] run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
