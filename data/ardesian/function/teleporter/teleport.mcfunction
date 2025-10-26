# as @e[type=minecraft:armor_stand,tag=TeleportLocation]

# TeleportingEntity -- Typically a player, but can be several entities. This is the entity that should eventually teleport from one place to the other.
# TeleportSource -- item_display at the source location that stores portalPos and portalDim
# ^ The above are permanent objects that do not change.
# v The below are temporary objects used to store temporary data for positioning.
# TeleportLocation -- armor_stand that should be moved to the target location first, and the tp entity will tp directly to this. Use armor stand so that we can (later) translate facing direction.
# PortalAnchor -- Marker that we can use to set the Pos, then tp the TeleportLocation to this.

# *poof* out
execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..3] run \
  function ardesian:teleporter/poof

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

summon minecraft:marker ~ ~ ~ {Tags:["PortalAnchor"]}

execute as @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] run \
 function ardesian:teleporter/move_tp_anchor

kill @e[tag=PortalAnchor]

# Don't change! This should work as long as the marker is in the correct position/dimension.
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

# *poof* in
execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..3] run \
  function ardesian:teleporter/poof

# Cleanup
tag @e[tag=TeleportSource] remove TeleportSource
tag @e[tag=TeleportingEntity] remove TeleportingEntity
kill @e[tag=TeleportLocation]
