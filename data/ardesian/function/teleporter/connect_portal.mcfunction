# @e[tag=zPortal,tag=!PortalLocationSet]

# port key = @e[dx=0.8,dy=3,dz=0.8,nbt={Item:{id:"minecraft:ender_eye", tag:{PortKey:1b}}}]

# say --connect
execute as @e[limit=1,sort=nearest,distance=..1] if predicate ardesian:is_port_key run \
  tag @s add PortKey

# Summon Display
execute at @s run summon item_display ~ ~0.5 ~ { \
  Tags: ["PortKeyDisplay"], \
  item: { \
    id: "minecraft:ender_eye", \
    count: 1b, \
    components: { \
      "minecraft:custom_name": { text: "PortKeyDisplay", italic: false }, \
      "minecraft:enchantment_glint_override": true \
    } \
  }, \
  billboard: "center", \
  transformation: { \
    left_rotation: [0f, 0f, 0f, 1f], \
    right_rotation: [0f, 0f, 0f, 1f], \
    translation: [0f, 0f, 0f], \
    scale: [0.7f, 0.7f, 0.7f] \
  } \
}
# execute at @s run summon text_display ~ ~1.6 ~ { \
#   Tags: ["PortKeyText"], \
#   text: '{"text":"Portal Key","color":"aqua","bold":true}', \
#   billboard: "vertical", \
#   background: 0, \
#   see_through: true, \
#   shadow: true, \
#   transformation: { \
#     left_rotation: [0f, 0f, 0f, 1f], \
#     right_rotation: [0f, 0f, 0f, 1f], \
#     translation: [0f, 0f, 0f], \
#     scale: [0.5f, 0.5f, 0.5f] \
#   } \
# }
# Add Portal data to display
data modify entity @e[tag=PortKeyDisplay,type=item_display,limit=1,sort=nearest] \
  item.components."minecraft:custom_data" \
    set from entity @e[tag=PortKey,type=item,limit=1,sort=nearest] \
      Item.components."minecraft:custom_data"

execute at @s run kill @e[tag=PortKey,limit=1,sort=nearest,distance=..1]
tag @s add PortalLocationSet
