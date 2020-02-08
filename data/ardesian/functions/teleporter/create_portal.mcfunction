# Scope of Ender Eye

# Check layout of blocks is valid
execute as @s at @s if block ~ ~-1 ~ minecraft:redstone_block run tag @s add zPortalEyeRedstone
execute as @s at @s if block ~ ~3 ~ minecraft:sea_lantern run tag @s add zPortalEyeLantern
execute as @s at @s if block ~ ~ ~ minecraft:air run execute as @s at @s if block ~ ~1 ~ minecraft:air run execute as @s at @s if block ~ ~2 ~ minecraft:air run tag @s add zPortalEyeSpace

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


# --summon
execute at @s[tag=zPortalEyeRedstone,tag=zPortalEyeLantern,tag=zPortalEyeSpace] as @s unless entity @e[tag=zPortal,distance=..1] run function ardesian:teleporter/summon_portal

# --connect
execute at @s run execute as @e[tag=zPortal,tag=!PortalLocationSet,distance=..1] at @s if data entity @e[distance=..1,sort=nearest,limit=1,nbt={Item:{id:"minecraft:ender_eye",tag:{PortKey:1b}}}] Thrower.L run function ardesian:teleporter/connect_portal

# --convert
execute at @s[tag=zPortalEyeRedstone,tag=zPortalEyeLantern,tag=zPortalEyeSpace] as @s if entity @e[tag=zPortal,distance=..1] run tag @e[tag=zPortal,distance=..1,limit=1,sort=nearest] add SummonPortKey
kill @e[tag=zPortalEyeRedstone,tag=zPortalEyeLantern,tag=zPortalEyeSpace]

# Remove tags from other eyes
execute as @e[tag=zPortalEyeRedstone] run tag @s remove zPortalEyeRedstone
execute as @e[tag=zPortalEyeLantern] run tag @s remove zPortalEyeLantern
execute as @e[tag=zPortalEyeSpace] run tag @s remove zPortalEyeSpace
