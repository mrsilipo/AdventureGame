// ==============================
// DayNight.ash (module header)
// ==============================
//
// API (major functions you should use)
//
// 1) Start / tick
//    - Time_Init(day, hour, minute, second)
//    - Time_Update()                    // call from repeatedly_execute_always (or equivalent)
//
// 2) Time control
//    - Time_AdvanceMinutes(minutes)
//    - Time_AdvanceHours(hours)
//    - Time_AdvanceUntilDusk()
//    - Time_AdvanceUntilMorning()
//
// 3) Queries (for gameplay logic)
//    - Time_GetTotalMinutes()
//    - Time_GetDaySlice5()              // returns one of the 5 major time-of-day slices
//    - Time_IsDaySlice5(slice)
//
// 4) Visuals (call from ONE central place, not from every room)
//    - Time_ApplyVisualsForRoom(roomId) // recommended: sets mode + applies visuals safely
//
// 5) UI helpers
//    - Time_GetClockString()            // "HH:MM"
//    - Time_GetClockPeriodString()      // "Evening", "Dawn", etc.
//    - Time_GetClockPeriodAndTimeString()
//
// Notes to prevent code rot:
// - Do NOT call any blocking functions (Display, Wait, dialog, etc.) inside Time_Update.
// - Keep all “what times mean what” in the const values + Time_GetDaySlice5.
// - Keep all “which rooms use background swapping” in Time_RoomUsesBackgroundDayNight.
// - Background frames must follow this order:
//      0 Day, 1 Late Afternoon, 2 Dusk, 3 Night, 4 Dawn

enum eDaySlice5
{
  eSlice_Day = 0,
  eSlice_LateAfternoon = 1,
  eSlice_Dusk = 2,
  eSlice_Night = 3,
  eSlice_Dawn = 4
};

// Clock state
import bool gClockRunning;
import int gTimeDay;
import int gTimeHour;
import int gTimeMinute;
import int gTimeSecond;

// Visual mode: true = swap backgrounds, false = ambient tint only
import bool gBackgroundDayNight;

// Clock API
import void Time_Init(int _startDay, int _startHour, int _startMinute, int _startSecond);
import void Time_Update();
import void Time_AdvanceMinutes(int _minutes);
import void Time_AdvanceHours(int _hours);
import void Time_AdvanceUntilDusk();
import void Time_AdvanceUntilMorning();

// Queries
import int Time_GetTotalMinutes();
import eDaySlice5 Time_GetDaySlice5();
import bool Time_IsDaySlice5(eDaySlice5 _slice);
import int Time_GetBackgroundFrameForSlice(eDaySlice5 _slice);

// UI helpers
import String Time_GetClockString();
import String Time_GetClockPeriodString();
import String Time_GetClockPeriodAndTimeString();

// Visual application
import void Time_ApplyRoomBackgroundForTime();
import void Time_ApplyAmbientTint();
import void Time_ApplyVisuals();

// Room policy (kept inside this module)
import bool Time_RoomUsesBackgroundDayNight(int _room);
import void Time_ApplyVisualsForRoom(int _room);