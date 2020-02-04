# zPortal

execute at @s run summon minecraft:item_frame ~ ~ ~ {Tags: ["AlignPortal"]}
tp @s @e[tag=AlignPortal,limit=1,sort=nearest]
execute at @s run tp @s ~ ~-0.5 ~ facing entity @p eyes
execute at @s run kill @e[tag=AlignPortal,sort=nearest,limit=1,distance=..5]
