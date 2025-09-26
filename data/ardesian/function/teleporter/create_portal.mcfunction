# @s[nbt={Item:{id:"minecraft:ender_eye"}}]if entity @p[distance=..32] if data entity @s Thrower

execute unless block ~ ~-1 ~ minecraft:redstone_block run return 0
execute unless block ~ ~3 ~ minecraft:sea_lantern run return 0
execute unless block ~ ~ ~ #survival_portals:non_solid run return 0
execute unless block ~ ~1 ~ #survival_portals:non_solid run return 0
execute unless block ~ ~2 ~ #survival_portals:non_solid run return 0

# if zPortal
#   If Eye == PortKey
# --connect
# --convert
#   If Eye != PortKey
# --convert

# if !zPortal
#   If Eye == PortKey
# --summon
# --connect
# --convert
#   If Eye != PortKey
# --summon
# --convert

execute unless predicate ardesian:is_port_key run say NOT PortKey
execute if predicate ardesian:is_port_key run say IS PortKey

### Inside frame, but no zPortal exists (yet
# !zPortal
# --summon
execute unless entity @e[tag=zPortal,limit=1,sort=nearest,distance=..1] run \
  function ardesian:teleporter/summon_portal

# zPortal
# Eye == PortKey
# --connect
execute if predicate ardesian:is_port_key run \
  execute as @e[tag=zPortal,tag=!PortalLocationSet,limit=1,sort=nearest,distance=..1] run \
  function ardesian:teleporter/connect_portal

# --convert
execute as @e[tag=zPortal,limit=1,sort=nearest,distance=..1] run say --convert
execute at @s run tag @e[tag=zPortal,limit=1,sort=nearest,distance=..1] add SummonPortKey

# NOTE: Should only spit out a PortKey for the FIRST portal, not for
# Should NOT spit out a PortKey if the portal already has a PortKeyDisplay

# Consume the eye
say Consume
kill @s
