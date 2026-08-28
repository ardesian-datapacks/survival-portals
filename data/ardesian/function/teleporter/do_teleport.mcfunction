# Macro. @s = the traveller. Arguments: dim, x, y, z (from storage ardesian:teleport dest).
#
# `execute in <dimension>` multiplies the carried position by the coordinate scale
# between the two dimensions (Nether is 8, everything else 1). So the dimension switch
# must come BEFORE the position is set, otherwise the destination is scaled by 8x.
# Setting the position afterwards needs literal numbers, which is why this is a macro.
$execute in minecraft:$(dim) positioned $(x) $(y) $(z) run tp @s ~0.5 ~ ~0.5
