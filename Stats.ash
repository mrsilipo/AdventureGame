// ==========================================
// Stats.ash (HEADER)
// ==========================================
//
// Notes:
// - gHeroStats is a global CharSheet (defined in Stats.asc)
// - base[] contains permanent stat values
// - temp[] contains temporary modifiers (buffs/debuffs)
// - Effective stat = base - temp
//

// ==========================================
// Stat Classes
// ==========================================
enum StatClass{
  eClassFighter = 0,
  eClassMage    = 1,
  eClassTheif   = 2,

  eClassCount   = 3
};
#define CLASS_COUNT eClassCount

// ==========================================
// Stats
// ==========================================
enum Stats{
  eStatStrength      = 0,
  eStatVitality      = 1,
  eStatIntelligence  = 2,
  eStatAgility       = 3,
  eStatKinesthesia   = 4,
  eStatCommunication = 5,

  eStatCount         = 6
};
#define STAT_COUNT eStatCount

// ==========================================
// CharSheet
// ==========================================
// Notes:
// - Managed for save/load safety
// - base[] and temp[] are indexed using Stats enum
// - hp/mp are derived values and must be clamped
managed struct CharSheet{
  StatClass class_id;
  
  int base[STAT_COUNT];
  int temp[STAT_COUNT];

  int hp;
  int hp_max;
  int mp;
  int mp_max;

  int gold;
};

// ==========================================
// Gold
// ==========================================
// Notes:
// - Add gold to gHeroStats
// - Display's current gold stock
import void AddGold(int _amount);

// ==========================================
// Game Lifecycle
// ==========================================
// Notes:
// - Stat_NewGame must be called before gameplay begins
import void Stat_NewGame(StatClass _class);

// ==========================================
// Stat Text Helpers
// ==========================================
// Notes:
// - Return localized words for UI / narration
import String Stat_GetClassWord(StatClass _class);
import String Stat_GetWord(Stats _stat);

// ==========================================
// Stat Accessors
// ==========================================
// Notes:
// - Base = permanent value
// - Effective = base - temp
import int Stat_GetBase(Stats _stat, CharSheet* _sheet);
import int Stat_GetEffective(Stats _stat, CharSheet* _sheet);
import void Stat_ModBase(Stats _stat, int _delta, CharSheet* _sheet);

// ==========================================
// Derived Stats
// ==========================================
// Notes:
// - Must be called after any base stat change
import void   Stat_RecalcDerived(CharSheet* _sheet);
import void   Stat_ClampVitals(CharSheet* _sheet);

// ==========================================
// HP / MP Management
// ==========================================
// Notes:
// - All HP/MP changes must go through these functions
// - Guarantees valid ranges and consistency
import void Stat_ModHP(int _delta, CharSheet* _sheet);
import void Stat_ModMP(int _delta, CharSheet* _sheet);
import void Stat_SetHP(int _value, CharSheet* _sheet);
import void Stat_SetMP(int _value, CharSheet* _sheet);

// ==========================================
// Debug / UI
// ==========================================
// Notes:
// - Builds a readable stat summary string
import String Stat_BuildText(CharSheet* _sheet);

// ==========================================
// Class Base Tables
// ==========================================
// Notes:
// - Class base stats are stored in a flat lookup table
// - Must be initialized once at game start
import void Stat_InitClassBaseTable();
import int Stat_GetClassBase(StatClass _class, Stats _stat);
import void Stat_ApplyBaseClass(StatClass _class, CharSheet* _sheet);

// ==========================================
// Monster Initialization
// ==========================================
// Notes:
// - Initializes monster stats by kind / template
import void   Stat_InitBaseMonsterStats(CharSheet* _sheet, int _kind);

// ==========================================
// Globals
// ==========================================
// Notes:
// - gStatsReady guards access to stat system
// - gHeroName is the player character name
// - gHeroStats is the player character
// - gMonsterStats is a fixed pool for encounters
import bool gStatsReady;
import String gHeroName;
import CharSheet* gHeroStats;
import CharSheet* gMonsterStats[10];
