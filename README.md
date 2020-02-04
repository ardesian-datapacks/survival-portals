# Survival Portals

**Installation:**

1. At the top of the page, click the green "Clone or Download" button.
2. Select "Download Zip"
3. In your Downloads folder (or whichever location you downloaded the file to) extract the file.
4. Locate your [Minecraft Saves](https://minecraft.gamepedia.com/Frequently_asked_questions#Q:_How_do_I_play_an_external_map_in_Survival_Mode.3F) folder and open the world you want to add the datapack into. (Datapacks are per world and must be added to each one that you want individually) For servers, this is the world file in the same folder you start your server.
5. Add a "datapacks" folder if it does not already exist inside of your world folder.
6. Drop the extracted version of your datapack into this folder.
7. If your game is running and you have cheats enabled, type `/reload` into the chat. This can also be done in your server. Otherwise, close and reopen your world and you're ready to go!

## Description

Many teleporting mods offer quick /home /back or /warp commands which make the game far far too easy. However, Vanilla Minecraft has a transportation problem where it just takes too long. (And the Nether is too unreliable)

This datapack adds the ability to construct a portal, which can be connected to another, allowing instant transportation between the two, at a small cost.The goal was to make this "survival friendly" but avoiding making it so easy that it feels like a "dirt-to-diamonds" type mod. It's intentionally expensive to create and continue to use the portals so that it's not too easy- teleporting should not be a quick and easy task!

## Constructing the portal:

The base must be a redstone block, followed by 3 spaces (air/empty blocks) vertically, finally a Seastone Lantern crowns the top.
![Portal Demonstration](https://preview.redd.it/henvwthg9ve41.png?width=1920&format=png&auto=webp&s=bd5235014f878f7ad0b691bbea68e5766dce43eb)
(Back wall of the portal is optional, I used colors to know which portal goes where)

## Activating the portal:

Connecting portals can be a bit complicated. To initialize a portal, you must throw an Eye of Ender onto the Redstone block. The portal will be initialized, but of course, there's nowhere for it to travel yet. This portal (Portal 1) will spit out a new Eye of Ender named "Port Key" which can be placed into another portal to connect, allowing teleportation from Portal 2 back to Portal 1. A new Port Key will be generated for Portal 2, which, when tossed into Portal 1 will give bi-directional travel.

## Multiple Portals:

You can throw a fresh Eye of Ender into an existing portal to create an additional Port Key pointing to that portal. Each portal can only go to 1 location, however you can have multiple portals going to the same location.

## Using the portal:

By default, the portals are passive- they do not teleport anything until they are primed. Priming a portal is done by throwing a Chorus Fruit into it. This will consume the Chorus Fruit, but allow you to travel through the portal. There is no portal cooldown, and once the portal is primed it will remain primed until somebody travels through.

## Deconstructing portals

A portal can be reset by simply breaking the redstone block or lantern, or by placing any block inside of the portal. **Note: This does NOT destroy the other end of the portal.** The opposite portal will still teleport you to the same location where this portal was once set up. After deconstructing a portal, a new Port Key can be thrown in to give it a new location.
