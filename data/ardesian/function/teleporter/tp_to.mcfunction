# @e[type=marker,tag=PortalAnchor]

data modify entity @s Pos set from \
  entity @e[tag=TeleportSource,limit=1] item.components."minecraft:custom_data".portalPos

effect give @e[tag=TeleportingEntity] minecraft:resistance 5 255 true

tp @e[tag=TeleportingEntity] @s

# Flip?
# execute as @e[tag=TeleportingEntity] run tp @s ~ ~ ~ ~180 ~

# @e[type=marker,tag=PortalAnchor]
kill @s
