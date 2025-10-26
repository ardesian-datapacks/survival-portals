# @s[nbt={Item:{id:"minecraft:ender_eye"}}]if entity @p[distance=..32] if data entity @s Thrower

execute unless block ~ ~-1 ~ minecraft:redstone_block run return 0
execute unless block ~ ~3 ~ minecraft:sea_lantern run return 0
execute unless block ~ ~ ~ #survival_portals:non_solid run return 0
execute unless block ~ ~1 ~ #survival_portals:non_solid run return 0
execute unless block ~ ~2 ~ #survival_portals:non_solid run return 0

# if zPortal
#   If Eye == PortKey
# --convert
# --connect
# --consume
#   If Eye != PortKey
# --convert
# --consume

# if !zPortal
#   If Eye == PortKey
# --summon
# --convert
# --connect
# --consume
#   If Eye != PortKey
# --summon
# --convert
# --consume

### TODO: Throwing another Ender Eye into a pending portal should still return a new one

# execute if predicate ardesian:is_port_key run say IS PortKey
# execute unless predicate ardesian:is_port_key run say NOT PortKey
execute if predicate ardesian:is_port_key run \
  execute if entity @e[tag=zPortal,tag=PortalLocationSet,limit=1,sort=nearest,distance=..1.5] \
  run return 0

# execute at @s run particle minecraft:portal ~ ~1.5 ~ 0 0 0 0.1 10

### Inside frame, but no zPortal exists (yet
# !zPortal
# --summon (creates the portal armor_stand + returns a PortKey)
execute unless entity @e[tag=zPortal,limit=1,sort=nearest,distance=..2] run \
  function ardesian:teleporter/summon_portal

### Portal exists, but NOT location set and Eye is NOT PortKey
# --convert (creates/returns a new PortKey for connecting here)
# execute unless predicate ardesian:is_port_key \
#   as @e[tag=zPortal,tag=PortalLocationSet,limit=1,sort=nearest,distance=..2] run say --convert
execute unless predicate ardesian:is_port_key \
  at @s run tag @e[tag=zPortal,tag=PortalLocationSet,limit=1,sort=nearest,distance=..2] add SummonPortKey

### zPortal, PortKey thrown in, NOT location set
# Eye == PortKey
# --connect (connects the portal to the PortKey location + returns a new PortKey for this portal)
execute if predicate ardesian:is_port_key run \
  execute as @e[tag=zPortal,tag=!PortalLocationSet,limit=1,sort=nearest,distance=..2] run \
  function ardesian:teleporter/connect_portal

# NOTE: Should only spit out a PortKey for the FIRST portal, not for
# Should NOT spit out a PortKey if the portal already has a PortKeyDisplay

# Consume the eye
# say --consume
kill @s
