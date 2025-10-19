# as @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest]

effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true



# Spawn a temp anchor IN this dim
summon marker ~ ~ ~ {Tags:["PortalAnchorTmp"]}

# Move it exactly to cached coords (no cross-dim reads here)
data modify entity @e[type=marker,tag=PortalAnchorTmp,limit=1] \
  Pos set from storage ardesian:tp portalPos

# Optional: copy cached rotation onto the temp anchor so we can face it
execute if data storage ardesian:tp portalRot run \
  data modify entity @e[type=marker,tag=PortalAnchorTmp,limit=1] \
  Rotation set from storage ardesian:tp portalRot

# Teleport the player TO the temp anchor entity (this swaps dimensions correctly)
tp @s @e[type=marker,tag=PortalAnchorTmp,limit=1]

# Optional: align facing to the anchor
execute if entity @e[type=marker,tag=PortalAnchorTmp,limit=1] run \
  tp @s ~ ~ ~ facing entity @e[type=marker,tag=PortalAnchorTmp,limit=1] eyes

# Cleanup
kill @e[type=marker,tag=PortalAnchorTmp,limit=1]





kill @e[tag=PortalAnchor]
kill @e[tag=PortalAnchorTmp]

# ardesian:teleporter/teleport_with_dim
# # Run as the player, at the anchor's coords, in the target dimension, then TP to context
# execute if entity @s[tag=overworld] \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   at @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   in minecraft:overworld \
#   run tp @s ~ ~ ~ facing entity @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] eyes

# execute if entity @s[tag=the_nether] \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   at @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   in minecraft:the_nether \
#   run tp @s ~ ~ ~ facing entity @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] eyes

# execute if entity @s[tag=the_end] \
#   as @a[tag=TeleportingEntity,limit=1,sort=nearest] \
#   at @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] \
#   in minecraft:the_end \
#   run tp @s ~ ~ ~ facing entity @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] eyes

# execute if entity @s[tag=overworld] \
# #     run execute in minecraft:overworld run function ardesian:teleporter/tp_to
# execute if entity @s[tag=overworld] \
#     run execute in minecraft:overworld positioned as @s \
#     run say overworld
# execute if entity @s[tag=the_nether] \
#     run execute in minecraft:the_nether positioned as @s \
#     run say the_nether
# execute if entity @s[tag=the_end] \
#     run execute in minecraft:the_end positioned as @s \
#     run say the_end

# execute if entity @s[tag=overworld] \
#     run execute in minecraft:overworld positioned as @s \
#     run tp @a[tag=TeleportingEntity] @s
# execute if entity @s[tag=the_nether] \
#     run execute in minecraft:the_nether positioned as @s \
#     run tp @a[tag=TeleportingEntity] @s
# execute if entity @s[tag=the_end] \
#     run execute in minecraft:the_end positioned as @s \
#     run tp @a[tag=TeleportingEntity] @s
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_nether"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_nether
# execute if data entity @s item.components."minecraft:custom_data"{portalDim:"the_end"} \
#     run tag @e[type=minecraft:armor_stand,tag=PortalAnchor,limit=1,sort=nearest] add the_end


# # AS PortKeyDisplay, but located in target dimension

# # TeleportingEntity - player teleporting
# # PortKeyDisplay, TeleportSource - item_display holding the portal key from the source location
# # PortalAnchor - marker at target location

# # summon marker ~ ~ ~ {Tags:["PortalAnchor"]}
# # summon marker ~ ~ ~ {Tags:["PortalAnchor"]}

# data modify entity @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] Pos set from \
#   entity @s item.components."minecraft:custom_data".portalPos

# effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

# execute as @e[tag=TeleportingEntity] run \
#   tp @s @e[type=marker,tag=PortalAnchor,limit=1]

# execute positioned as @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] \
#   run tp @e[tag=TeleportingEntity] @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest]
# execute as @e[tag=TeleportingEntity] run \
#   tp @s @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest]
# # tp @e[tag=TeleportingEntity] @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest]

# # Flip?
# # execute as @e[tag=TeleportingEntity] run tp @s ~ ~ ~ ~180 ~

# # execute as @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] run \
# #   function ardesian:teleporter/tp_to

# kill @s
