execute at @s run \
  playsound minecraft:entity.enderman.teleport block @a[distance=..20] ~ ~ ~ 50 0.5
execute at @s run \
  particle minecraft:flash{color:[1,1,1,1]} ~ ~0.5 ~
execute at @s run \
  particle minecraft:poof ~ ~0.5 ~ 0.5 0.5 0.5 0.2 20
