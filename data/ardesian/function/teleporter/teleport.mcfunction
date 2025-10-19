# as @e[type=minecraft:armor_stand,tag=TeleportLocation]

# TeleportingEntity -- Typically a player, but can be several entities. This is the entity that should eventually teleport from one place to the other.
# TeleportSource -- item_display at the source location that stores portalPos and portalDim
# ^ The above are permanent objects that do not change.
# v The below are temporary objects used to store temporary data for positioning.
# TeleportLocation -- armor_stand that should be moved to the target location first, and the tp entity will tp directly to this. Use armor stand so that we can (later) translate facing direction.
# PortalAnchor -- Marker that we can use to set the Pos, then tp the TeleportLocation to this.

# *poof* away
execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..4] run \
  function ardesian:teleporter/poof

execute as @e[tag=TeleportSource] run say --telling--
execute as @e[tag=TeleportSource,limit=1,sort=nearest] run tellraw @a [ \
  {"text":"portalPos: "}, \
  {"nbt":"item.components.minecraft:custom_data.portalPos","entity":"@s"} \
]

execute as @e[tag=TeleportSource] run say --setting dim--
say Tag
execute at @s if data entity \
  @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data"{portalDim:"overworld"} \
  run tag @s add overworld
execute at @s if data entity \
  @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data"{portalDim:"the_nether"} \
  run tag @s add the_nether
execute at @s if data entity \
  @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data"{portalDim:"the_end"} \
  run tag @s add the_end

execute as @e[tag=TeleportSource] run say --summoning marker--
say Move
summon minecraft:marker ~ ~ ~ {Tags:["PortalAnchor"]}


execute store result entity @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] \
  Pos[0] double 1 run \
  data get entity @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data".portalPos[0]

execute store result entity @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] \
  Pos[1] double 1 run \
  data get entity @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data".portalPos[1]

execute store result entity @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] \
  Pos[2] double 1 run \
  data get entity @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data".portalPos[2]
# data modify entity @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] Pos set from \
#   entity @e[tag=TeleportSource,limit=1,sort=nearest] \
#   item.components."minecraft:custom_data".portalPos
execute at @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] run \
  tp @e[type=armor_stand,tag=TeleportLocation,limit=1,sort=nearest] ~ ~ ~

execute as @e[tag=TeleportSource] run say --telling--
tellraw @a [ \
  {"text":" | Source portalPos: "}, \
  {"nbt":"Pos", \
   "entity":"@e[tag=TeleportSource,limit=1,sort=nearest]"}, \
  {"text":"Anchor Pos: "}, \
  {"nbt":"Pos","entity":"@e[type=marker,tag=PortalAnchor,limit=1]"}, \
  {"text":"  |  TeleportLocation Pos: "}, \
  {"nbt":"Pos","entity":"@e[type=armor_stand,tag=TeleportLocation,limit=1]"}, \
]
say Dim:
execute if entity @s[tag=overworld] run say Dim: Overworld
execute if entity @s[tag=the_nether] run say Dim: The_Nether
execute if entity @s[tag=the_end] run say Dim: The_End

# Don't change! This should work as long as the marker is in the correct position/dimension.
say TP
execute if entity @s[tag=overworld] \
  in minecraft:overworld positioned as @s \
  run tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
execute if entity @s[tag=the_nether] \
  in minecraft:the_nether positioned as @s \
  run tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
execute if entity @s[tag=the_end] \
  in minecraft:the_end positioned as @s \
  run tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# This works!!!
# /execute in minecraft:the_nether positioned -34 90 42 run tp Rockster160 ~0.5 ~ ~0.5

say Poof

# *poof* in
execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..4] run \
  function ardesian:teleporter/poof

say Clean
kill @e[tag=PortalAnchor]
# tag @e remove TeleportSource

# @e[tag=TeleportLocation]
# tag @s add TeleportSource


# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add overworld
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_nether
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_end

# data modify entity @s \
#   item.components."minecraft:custom_data".portalDim set from \
#   entity @s item.components."minecraft:custom_data".portalDim


# data modify storage ardesian:tp portalPos set from \
#   entity @s item.components."minecraft:custom_data".portalPos
# data modify storage ardesian:tp portalDim set from \
#   entity @s item.components."minecraft:custom_data".portalDim
# # Optional facing – copy stand's yaw/pitch if you want to face the portal
# data modify storage ardesian:tp portalRot set from entity @s Rotation

# # Hard guards
# execute unless data storage ardesian:tp portalPos run return
# execute unless data storage ardesian:tp portalDim run return

# # Branch by cached dim, switch INTO that dim, and run the worker AS the player
# execute if data storage ardesian:tp {portalDim:"overworld"} \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   in minecraft:overworld run function ardesian:teleporter/teleport_with_dim

# execute if data storage ardesian:tp {portalDim:"the_nether"} \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   in minecraft:the_nether run function ardesian:teleporter/teleport_with_dim

# execute if data storage ardesian:tp {portalDim:"the_end"} \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   in minecraft:the_end run function ardesian:teleporter/teleport_with_dim





# Overworld
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#   in minecraft:overworld run summon marker ~ ~ ~ {Tags:["PortalAnchorTmp"]}
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#   in minecraft:overworld run data modify \
#   entity @e[type=marker,tag=PortalAnchorTmp,limit=1] Pos set from \
#   entity @s item.components."minecraft:custom_data".portalPos

# # Nether
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#   in minecraft:the_nether run summon marker ~ ~ ~ {Tags:["PortalAnchorTmp"]}
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#   in minecraft:the_nether run data modify \
#   entity @e[type=marker,tag=PortalAnchorTmp,limit=1] Pos set from \
#   entity @s item.components."minecraft:custom_data".portalPos

# # End
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#   in minecraft:the_end run summon marker ~ ~ ~ {Tags:["PortalAnchorTmp"]}
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#   in minecraft:the_end run data modify \
#   entity @e[type=marker,tag=PortalAnchorTmp,limit=1] Pos set from \
#   entity @s item.components."minecraft:custom_data".portalPos

# Overworld
# execute as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#   in minecraft:overworld \
#   run function ardesian:teleporter/teleport_with_dim

# # Nether
# execute as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#   in minecraft:the_nether \
#   run function ardesian:teleporter/teleport_with_dim

# # End
# execute as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#   in minecraft:the_end \
#   run function ardesian:teleporter/teleport_with_dim

# summon minecraft:armor_stand ~ ~ ~ {Tags:["PortalAnchor"]}
# tp @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] ~ ~ ~ facing entity @e[tag=TeleportingEntity,limit=1,sort=nearest] eyes
# Overworld
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#   in minecraft:overworld run summon minecraft:armor_stand ~ ~ ~ {Tags:["PortalAnchor"]}
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#   in minecraft:the_nether run summon minecraft:armor_stand ~ ~ ~ {Tags:["PortalAnchor"]}
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#   in minecraft:the_end run summon minecraft:armor_stand ~ ~ ~ {Tags:["PortalAnchor"]}

# execute in minecraft:overworld run data modify entity @e[type=armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   Pos set from entity @s item.components."minecraft:custom_data".portalPos
# execute in minecraft:the_nether run data modify entity @e[type=armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   Pos set from entity @s item.components."minecraft:custom_data".portalPos
# execute in minecraft:the_end run data modify entity @e[type=armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   Pos set from entity @s item.components."minecraft:custom_data".portalPos

# data modify entity @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] Pos set from \
#   entity @s item.components."minecraft:custom_data".portalPos

# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add overworld
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_nether
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_end

# tellraw @a [ \
#   {"text":"TeleportSource Pos: "}, \
#   {"nbt":"Pos","entity":"@e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest]"}, \
# ]

# effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

# # Item.components."minecraft:custom_data".portalDim
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add overworld
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_nether
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_end

# execute as @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#       run function ardesian:teleporter/teleport_with_dim
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} \
#      in minecraft:overworld positioned as @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#       run function ardesian:teleporter/teleport_with_dim
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#      in minecraft:the_nether positioned as @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#       run function ardesian:teleporter/teleport_with_dim
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#      in minecraft:the_end positioned as @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#       run function ardesian:teleporter/teleport_with_dim

# # *poof* in
# execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..4] run \
#   function ardesian:teleporter/poof

# tag @e remove TeleportSource
# kill @e[type=minecraft:armor_stand,tag=PortalAnchor]

# # @e[tag=TeleportLocation]


# # Move the armor stand to location
# # execute store result entity @s Pos[0] double 1 run \
# #   data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2] \
# #     item.components."minecraft:custom_data".portalPosX
# # execute store result entity @s Pos[1] double 1 run \
# #   data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2] \
# #     item.components."minecraft:custom_data".portalPosY
# # execute store result entity @s Pos[2] double 1 run \
# #   data get entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2] \
# #     item.components."minecraft:custom_data".portalPosZ
#     # data modify entity @s Rotation[0] set value 180.0f

# # Grant invincible for short time
# effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

# # execute if entity @e[type=item_display] \
# #   run say ALL-item_display
# # execute if entity @e[type=item_display,tag=PortKeyDisplay] \
# #   run say ALL-PortKeyDisplay
# # execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2] \
# #   run say PortKeyDisplay
# # execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2,nbt={item:{components:{"minecraft:custom_data":{portalDim:"overworld"}}}}] \
# #   run say TO:Overworld
# # execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2,nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_nether"}}}}] \
# #   run say TO:Nether
# # execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2,nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_end"}}}}] \
# #   run say TO:TheEnd

# # tellraw @a [ \
# #   {"text":"TeleportSource Pos: "}, \
# #   {"nbt":"Pos","entity":"@s"}, \
# #   {"text":" Dim: "}, \
# #   {"nbt":"item.components.\"minecraft:custom_data\".portalDim","entity":"@e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2]"} \
# # ]
# # tellraw @a [ \
# #   {"text":"TeleportingEntity Pos: "}, \
# #   {"nbt":"Pos","entity":"@e[tag=TeleportingEntity,limit=1,sort=nearest]"}, \
# #   {"text":" Dim: "}, \
# #   {"nbt":"Dimension","entity":"@e[tag=TeleportingEntity,limit=1,sort=nearest]"} \
# # ]

# # Tp to stand
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"overworld"} run \
#   execute in minecraft:overworld run function ardesian:teleporter/teleport_with_dim
# # Overworld
# execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2, \
#   nbt={item:{components:{"minecraft:custom_data":{portalDim:"overworld"}}}}] run \
#   execute in minecraft:overworld positioned as @s run \
#     tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# # Nether
# execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2, \
#   nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_nether"}}}}] run \
#   execute in minecraft:the_nether positioned as @s run \
#     tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# # End
# execute if entity @e[type=item_display,tag=PortKeyDisplay,limit=1,sort=nearest,distance=..2, \
#   nbt={item:{components:{"minecraft:custom_data":{portalDim:"the_end"}}}}] run \
#   execute in minecraft:the_end positioned as @s run \
#     tp @e[tag=TeleportingEntity] ~0.5 ~ ~0.5
# # execute as @e[tag=TeleportingEntity] at @s run tp @s ~ ~ ~ ~180 ~

# # https://minecraft.gamepedia.com/Commands/spreadplayers
# # Spreadplayers may not work because it takes the player to the surface, which would break underground teleporters

# # *poof* in
# execute at @e[tag=TeleportingEntity] run playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
# execute at @e[tag=TeleportingEntity] run particle minecraft:flash{color:[1,1,1,1]} ~ ~0.5 ~
# execute at @e[tag=TeleportingEntity] run particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
