// ==========================================
// SpellDataBase.ash (HEADER)
// ==========================================

// ==========================================
// Spell ID's
// ==========================================

// Add spell id's here:
enum SpellId {
  eSpellSpark = 0,
  eSpellFlame = 1,
  eSpellOpen = 2,

  eSpellCount = 3
};

// ==========================================

#define SPELL_COUNT eSpellCount
#define SPELLBOOK_CAPACITY 16

#define SPELL_SKILL_LEVEL_COUNT 3
#define SPELL_SKILL_THRESHOLD_1 10
#define SPELL_SKILL_THRESHOLD_2 25
#define SPELL_SKILL_THRESHOLD_3 50
#define SPELL_SKILL_MAX_CAP 50

struct SpellTemplate {
  String name;
  bool usable_in_battle;

  int battle_mp_cost[SPELL_SKILL_LEVEL_COUNT];
  int battle_power[SPELL_SKILL_LEVEL_COUNT];
  int battle_fx[SPELL_SKILL_LEVEL_COUNT];

  int adventure_mp_cost[SPELL_SKILL_LEVEL_COUNT];
  int adventure_power[SPELL_SKILL_LEVEL_COUNT];
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