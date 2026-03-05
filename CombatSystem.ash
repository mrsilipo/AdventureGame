// ==========================================
// CombatSystem.ash (HEADER)
// ==========================================
enum CombatState {
  eCombatInactive = 0,
  eCombatRunning = 1,
  eCombatVictory = 2,
  eCombatDefeat = 3
};

enum CombatAction {
  eActNone = 0,
  eActAttack = 1,
  eActDefend = 2,
  eActSpell = 3,
  eActPotion = 4
};

enum MonsterKind {
  eMonsterGoblin = 0,
  eMonsterCount = 1
};

struct MonsterTemplate {
  String name;
  int kind;
  int level;
  int base[STAT_COUNT];
  int hp_max;
  int mp_max;
  int atb_speed;
};

struct CombatRuntime {
  bool active;
  bool player_defending;
  bool enemy_defending;

  int player_atb;
  int enemy_atb;
  int atb_max;

  int selected_melee;
  int known_melee_count;

  int selected_spell;
  int known_spell_count;

  CharSheet* enemy;
  int enemy_kind;

  String melee_names[5];
  int melee_power[5];

  String spell_names[5];
  int spell_power[5];
  int spell_mp_cost[5];

  CombatState state;
};

import CombatRuntime gCombat;

// lifecycle
import void Combat_Init();
import void Combat_Update();

// battle start/end
import bool Combat_IsActive();
import void Combat_StartByKind(MonsterKind kind);
import void Combat_End();

// commands
import void Combat_PlayerAttack();
import void Combat_PlayerDefend();
import void Combat_PlayerCast();
import void Combat_PlayerPotion();

// selection helpers
import void Combat_SelectNextMelee();
import void Combat_SelectPrevMelee();
import void Combat_SelectNextSpell();
import void Combat_SelectPrevSpell();

// setup helpers
import void Combat_RegisterStarterMoves();
import void Combat_RegisterPotion(InventoryItem* item, int heal_hp, int restore_mp);