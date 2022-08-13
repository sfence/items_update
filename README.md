Minetest mod: items_update
==========================
Mod which update aliased items in player inventory on move/put or/and on join.

After some updates, item names are changed and aliases provide back compatibility.
But aliased items sometimes cause some problems, because the old item in the stack has still an old name, which is linked to the new definition table. But check for item stack name if often used in code and it can cause a problems.

Source code:
--------------------------
Copyright (c) 2022 SFENCE
MIT - check LICENSE file

