# @s = a bound PortKey item with a chorus fruit lying on it.
# Consumes both and leaves a single-use portal to wherever the key points.

tag @s add zQuickPortKey
execute at @s run kill @e[type=minecraft:item,distance=..0.5,sort=nearest,limit=1,nbt={Item:{id:"minecraft:chorus_fruit"}}]

# PrimedPortal both fires the teleport on contact and drives the active particles.
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags: ["QuickPort", "PrimedPortal"],Small:1b,Invisible:1b,Invulnerable:1b,PersistenceRequired:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b}

# init_teleport reads the destination off the stand's head slot, exactly as it
# does for a zPortal, so hand the key over before the item is spent.
execute as @e[type=minecraft:armor_stand,tag=QuickPort,distance=..1,sort=nearest,limit=1] run data modify entity @s equipment.head set from entity @e[type=minecraft:item,tag=zQuickPortKey,distance=..1,sort=nearest,limit=1] Item

kill @s
