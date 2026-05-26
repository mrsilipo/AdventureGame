// ==========================================
// GUI_SpellBook.ash (Header)
// Version 1.006
// ==========================================

#define SPELLBOOK_SLOT_START_X 48
#define SPELLBOOK_SLOT_START_Y 39
#define SPELLBOOK_SLOT_GAP_Y 50
#define SPELLBOOK_SLOT_GAP_X 124
#define SPELLBOOK_SLOT_TEXT_X_OFFSET 20
#define SPELLBOOK_SLOT_DESC_Y_OFFSET 22
#define SPELLBOOK_STAT_LINE_Y_OFFSET 13
#define SPELLBOOK_STAT_STRIP_SPRITE 179
#define SPELLBOOK_STAT_STRIP_X_OFFSET -3
#define SPELLBOOK_STAT_STRIP_Y_OFFSET 13

import void SpellBook_Open();
import void SpellBook_Update();
import bool SpellBook_HandleClick(MouseButton button, int mouse_x, int mouse_y);
import int SpellBook_GetSelectedSpellId();
import bool SpellBook_HasSelectedSpell();
import void SpellBook_ClearSelectedSpell();