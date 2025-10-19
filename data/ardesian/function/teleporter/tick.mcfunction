# PortKey == Ender Eye that has been set to a portal
# zPortal == armor_stand that acts as a placeholder of the portal

execute as @e[tag=zPortal] at @s \
  if entity @p[distance=..32] \
  run function ardesian:teleporter/tick_portal

execute as @e[nbt={Item:{id:"minecraft:ender_eye"}}] at @s \
  if entity @p[distance=..32] if data entity @s Thrower \
  run function ardesian:teleporter/create_portal

# TODO:
  # [√] FIXME: Portals don't work cross dimension yet.
  # [√] Portals seem to take some time to warm up? Have to throw a fruit into each one first?
    # [√] FIXME: Portals should work immediately and reliably.
  # [√] Maybe? Portals seem to be connecting to themselves.... Sometimes? And maybe changing later?
  # [√] BUG: Item Display doesn't get removed on break
  # [√] Move floating PortKey farther away from block
  # [√] Ensure ground items (chorus) are picked up
  # [√] Throwing a PortKey into a PENDING portal (unattached) should NOT drop a new PortKey.
  # [√] When throwing a PortKey into an existing portal...
    # [√] * Do nothing? Not even change the port key or anything. Just ignore it. Leave it on the ground.
  # [ ] Always facing the same direction instead of relative
  # [ ] Check: TP cross dimension?
  # [ ] Quickport!
    # [ ] PortKey + Fruit on the ground together creates a temporary/single-use portal back to the location of the PortKey

### Test:
# Connect two portals, tp from one to the other and back
# Connect two far portals - outside of render range
# Connect two portals in different dimensions
# Throw additional EnderEyes in to the portal - should get new PortKeys
# Additional PortKeys thrown in should be ignored
# Rename PortKey - Portal should still connect
# * Maybe? Add a text label above the portal with the custom name?


# Show Pos:
# tellraw @a [ \
#   {"text":"TeleportSource Pos: "}, \
#   {"nbt":"Pos","entity":"@e[tag=TeleportSource,limit=1,sort=nearest]"} \
# ]
