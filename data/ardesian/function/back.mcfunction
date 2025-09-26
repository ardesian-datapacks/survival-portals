execute unless data entity @s LastDeathLocation run return 0

# ensure (or reuse) a single anchor per dim — cheap and stateless
execute in minecraft:overworld \
  unless entity @e[type=marker,tag=last_death_anchor_ow,limit=1] \
  run summon marker 0 0 0 {Tags:["last_death_anchor_ow"]}
execute in minecraft:the_nether \
  unless entity @e[type=marker,tag=last_death_anchor_nether,limit=1] \
  run summon marker 0 0 0 {Tags:["last_death_anchor_nether"]}
execute in minecraft:the_end \
  unless entity @e[type=marker,tag=last_death_anchor_end,limit=1] \
  run summon marker 0 0 0 {Tags:["last_death_anchor_end"]}

# OVERWORLD branch
execute if data entity @s LastDeathLocation{dimension:"minecraft:overworld"} run \
  execute in minecraft:overworld run data modify entity @e[type=marker,tag=last_death_anchor_ow,limit=1] \
    Pos set from entity @s LastDeathLocation.pos
execute if data entity @s LastDeathLocation{dimension:"minecraft:overworld"} run \
  execute in minecraft:overworld run tp @s @e[type=marker,tag=last_death_anchor_ow,limit=1]

# NETHER branch
execute if data entity @s LastDeathLocation{dimension:"minecraft:the_nether"} run \
  execute in minecraft:the_nether run data modify entity @e[type=marker,tag=last_death_anchor_nether,limit=1] \
    Pos set from entity @s LastDeathLocation.pos
execute if data entity @s LastDeathLocation{dimension:"minecraft:the_nether"} run \
  execute in minecraft:the_nether run tp @s @e[type=marker,tag=last_death_anchor_nether,limit=1]

# END branch
execute if data entity @s LastDeathLocation{dimension:"minecraft:the_end"} run \
  execute in minecraft:the_end run data modify entity @e[type=marker,tag=last_death_anchor_end,limit=1] \
    Pos set from entity @s LastDeathLocation.pos
execute if data entity @s LastDeathLocation{dimension:"minecraft:the_end"} run \
  execute in minecraft:the_end run tp @s @e[type=marker,tag=last_death_anchor_end,limit=1]

return 1
