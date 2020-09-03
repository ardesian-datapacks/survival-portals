# Port Key
execute as @s run execute store result entity @s Item.tag.portalPosX double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[0]
execute as @s run execute store result entity @s Item.tag.portalPosY double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[1]
execute as @s run execute store result entity @s Item.tag.portalPosZ double 1 run data get entity @e[tag=zPortal,sort=nearest,limit=1] Pos[2]

execute as @s[predicate=ardesian:in_overworld] run data modify entity @s Item.tag.portalDim set value overworld
execute as @s[predicate=ardesian:in_the_nether] run data modify entity @s Item.tag.portalDim set value the_nether
execute as @s[predicate=ardesian:in_the_end] run data modify entity @s Item.tag.portalDim set value the_end
