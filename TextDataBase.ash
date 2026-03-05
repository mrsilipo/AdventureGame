// ==========================================
// TextDataBase.ash (HEADER)
// ==========================================
//
// Purpose:
// - Public API for the game's translation + string formatting system.
// - Keeps all text lookups centralized and translation-ready.
//
// Usage:
// - T("KEY") returns translated string, or "KEY" if missing.
// - TF1..TF4 apply token replacement: {0}..{3}
// - I(int) converts integers to String for token functions.
//

// ==========================================
// Lifecycle
// ==========================================

// Initialize the TextDB and load the requested language.
import void TextDB_Init(String lang);

// Change active language at runtime (reloads text files).
import void TextDB_SetLanguage(String lang);

// Returns the active language code (eg "en", "pl").
import String TextDB_GetLanguage();

// ==========================================
// Helpers
// ==========================================

// Integer to String (for token formatting).
import String I(int value);

// ==========================================
// Translation
// ==========================================

// Translate: key -> string
import String T(String key);

// Translate + format helpers.
// Notes:
// - Tokens are {0}, {1}, {2}, {3}
// - Use I(value) for integers
import String TF(String key);
import String TF1(String key, String p0);
import String TF2(String key, String p0, String p1);
import String TF3(String key, String p0, String p1, String p2);
import String TF4(String key, String p0, String p1, String p2, String p3);
