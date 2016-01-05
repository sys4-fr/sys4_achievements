# sys4_achievements
A minetest mod

by Sys4, LGPL 2.1 or later.

This mod extend the mod "awards" from Rubenwardy.
It adds various achievements to minetest and introduce a different gameplay.

The achievements follow a competence tree now and are displayed with different colors in the awards list.
- Green achievements are already triggered achievements.
- Yellow achievements are unlocked achievements which are ready to be triggered because they depends of already triggered achievements (the green ones)
- Red achievements are locked achievements that need to be unlocked by triggering parent achievement (the yellow ones)

There is two game modes proposed :
- The first game mode (default), add some achievements that complete original achievements from Rubenwardy awards mod and following a competence tree.
- The second game mode (almost finished), add many more achievements and lock all the availaible crafts recipes. You have to trigger achievements for unlock craft recipes. This game mode force to play minetest in a different manner and in a harder way too. When an achievement is triggered, a book is given to the player where the unlocked craft recipes are described in details. Oh! and if you intent to craft a locked item, you obtain a waste node which will not be usable.

Developed and tested with minetest stable 0.4.13.

INSTALLATION :
--------------
Download the source code and place it in a new folder named "sys4_achievements" into the mod folder of minetest.

DEPENDS :
---------
- all minetest default game mods (default, stairs, farming, doors, xpanes, ...)
- awards (from Rubenwardy)
- intllib (Optional but recommended)

CONFIGURATION :
---------------
- If you want to play the second game mode, edit the minetest.conf file by adding this lines :
sys4_craftmode = true

and in return set it to false for normal game mode.

- Yon can set a level of difficulty by adding this line in minetest.conf :
sys4_level = 1

"1" is the default. For increase difficulty, change it by a larger number.

TODO :
------
- Make other types of triggers (eat, cook, ...)
- Make a sort of framework for easier achievements coding that could be called from another mods.
- Offer to the player multiples choices of gameplays by choosing others available achievements list.
- Make more achievements to unlock crafts of anothers minetest mods around the world :-)
- (thought) Make automatic achievements creation system. This achievements could be the base of custom achievements. 