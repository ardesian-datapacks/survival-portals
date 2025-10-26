say Doing

# *poof* away
execute at @e[tag=TeleportingEntity,limit=1,sort=nearest,distance=..3] run \
  function ardesian:teleporter/poof

data modify entity @s Pos set from \
  entity @e[tag=TeleportSource,limit=1,sort=nearest] \
  item.components."minecraft:custom_data".portalPos

execute as @e[type=armor_stand,tag=TeleportLocation,limit=1,sort=nearest] run tellraw @a [ \
  {"text":"Location: "}, \
  {"nbt":"Pos","entity":"@s"} \
]
tp @e[type=armor_stand,tag=TeleportLocation,limit=1,sort=nearest] @s
# execute at @e[type=marker,tag=PortalAnchor,limit=1,sort=nearest] run \
#   tp @e[type=armor_stand,tag=TeleportLocation,limit=1,sort=nearest] ~ ~ ~
execute as @e[type=armor_stand,tag=TeleportLocation,limit=1,sort=nearest] run tellraw @a [ \
  {"text":"Location: "}, \
  {"nbt":"Pos","entity":"@s"} \
]
