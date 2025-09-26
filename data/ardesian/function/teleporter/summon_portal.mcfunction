# @s[ender_eye, !PortKey] !zPortal inside frame

say --summon
tag @s add zPortalSummoned
execute at @s run summon minecraft:armor_stand ~ ~ ~ {Tags: ["zPortal", "SummonPortKey"],Small:1b,Invisible:1b,Invulnerable:1b,PersistenceRequired:1b,NoBasePlate:1b,NoGravity:1b,Marker:1b}
execute as @e[tag=zPortal,sort=nearest,limit=1] run function ardesian:teleporter/align_portal
