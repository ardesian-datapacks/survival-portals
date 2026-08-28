# @s = a traveller that has just arrived, run at @s
playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
particle minecraft:flash{color:[1.0,1.0,1.0,1.0]} ~ ~0.5 ~
particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
