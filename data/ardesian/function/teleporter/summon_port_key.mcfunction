# @e[tag=zPortal, tag=SummonPortKey]

# say SummonPortKey
tag @s remove SummonPortKey

function ardesian:teleporter/throw

execute at @s as @e[type=item,limit=1,sort=nearest,distance=..1] \
  if predicate ardesian:is_port_key run \
  function ardesian:teleporter/set_port_key_data
