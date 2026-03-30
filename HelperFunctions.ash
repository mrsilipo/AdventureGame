// ==========================================
// HelperFunctions.ash (HEADER)
// ==========================================
import void WalkToInteraction(int _x, int _y, int _dir,  int _wait);

import void CursorDisableMouseModes();
import void CursorEnableMouseModes();
import void CursorForcePointerMode();
import void CursorReturnPrevious();
import void IconBarGUI_Enable(bool enable);

import void UpdateBar(Button* _btn_id, int _value, int _value_max, int _bar_width);