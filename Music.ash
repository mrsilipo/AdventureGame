// ==========================================
// Music.ash (Header)
// ==========================================

import void MusicSystem_Init();
import void Music_Play(AudioClip* _clip, bool _repeat);
import void Music_PlayPrevious();
import void Music_CrossfadeTo(AudioClip* _newClip);
import void Music_UpdateCrossfade();
import void Music_Stop();
import void Music_StopAll();
import void Sfx_Play(AudioClip* _clip);
import void Sfx_Stop(AudioClip* _clip);
import void Sfx_StopAll();