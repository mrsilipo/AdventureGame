// ==========================================
// SpellDataBase.ash (HEADER)
// ==========================================

// ==========================================
// Spell ID's
// ==========================================

// Add spell id's here:
enum SpellId {
  eSpellVindor = 0,
  eSpellPloom = 1,
  eSpellRah = 2,
  eSpellHum = 3,

  eSpellCount = 4
};

// ==========================================

#define SPELL_COUNT eSpellCount
#define SPELLBOOK_CAPACITY 6

#define SPELL_SKILL_LEVEL_COUNT 3
#define SPELL_SKILL_THRESHOLD_1 25
#define SPELL_SKILL_THRESHOLD_2 50
#define SPELL_SKILL_THRESHOLD_3 75
#define SPELL_SKILL_MAX_CAP 100

struct SpellTemplate {
  String name;
  String desc;

  bool usable_in_battle;

  int mp_cost[SPELL_SKILL_LEVEL_COUNT];
  int power[SPELL_SKILL_LEVEL_COUNT];
  
  int battle_fx[SPELL_SKILL_LEVEL_COUNT];
  int adventure_fx;
};

import void SpellDB_Init();
import int SpellDB_GetMaxSkillCap();
import int SpellDB_GetSkillLevelFromSkillValue(int skill_value);

import String SpellDB_GetName(SpellId spell_id);
import bool SpellDB_IsUsable(SpellId spell_id, bool is_battle_context);

import int SpellDB_GetMPCost(SpellId spell_id, bool is_battle_context, int skill_value);
import int SpellDB_GetPower(SpellId spell_id, bool is_battle_context, int skill_value);
import int SpellDB_GetFX(SpellId spell_id, bool is_battle_context, int skill_value);