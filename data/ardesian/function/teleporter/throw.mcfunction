# @s = Entity throwing the item

execute as @s run tag @s add Thrower

# Summon armor stand at 0,0,0 at the same angle as the thrower
summon minecraft:armor_stand 0 0 0 {Tags: ["AngleChecker"]}
execute as @e[tag=AngleChecker] run \
  execute store result entity @s Rotation[0] float 1 run \
  data get entity @e[tag=Thrower,limit=1] Rotation[0]

# Summon an entity in front of the stand, its Pos acts as cos/sin
execute as @e[tag=AngleChecker] at @s run \
  summon minecraft:area_effect_cloud ^ ^ ^1 {Tags: ["CosSin"], Duration: 200}

# Summon the item to throw, with some vertical motion to simulate a "throw"
# Y=1, MotionY=0.3 to simulate throw... Not doing this right now
execute at @s run summon minecraft:item ~ ~ ~ { \
  Tags: ["Thrown", "PortKey", "SetPortKeyData"], \
  Motion: [0.0d, 0.0d, 0.0d], \
  Item: { \
    id: "minecraft:ender_eye", \
    count: 1b, \
    components: { \
      "minecraft:custom_name": { text: "Port Key", italic: false }, \
      "minecraft:custom_data": { PortKey: 1b }, \
      "minecraft:enchantment_glint_override": true \
    } \
  } \
}

# Put cos/sin as motion on thrown item at a scale of 0.1 to reduce throw distance
execute at @s as @e[tag=Thrown,tag=PortKey,sort=nearest,limit=1,distance=..1] run \
  execute store result entity @s Motion[0] double 0.1 run \
  data get entity @e[tag=CosSin,limit=1] Pos[0] 1
execute at @s as @e[tag=Thrown,tag=PortKey,sort=nearest,limit=1,distance=..1] run \
  execute store result entity @s Motion[2] double 0.1 run \
  data get entity @e[tag=CosSin,limit=1] Pos[2] 1

# Clean up
kill @e[tag=AngleChecker]
kill @e[tag=CosSin]
tag @e remove Thrown
tag @e remove Thrower
