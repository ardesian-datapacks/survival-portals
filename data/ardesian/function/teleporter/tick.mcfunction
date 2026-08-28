# Function tags always run from the server command source, which is the overworld.
# Portals in the Nether and the End would never be ticked, so fan out explicitly.
execute in minecraft:overworld run function ardesian:teleporter/tick_dimension
execute in minecraft:the_nether run function ardesian:teleporter/tick_dimension
execute in minecraft:the_end run function ardesian:teleporter/tick_dimension
