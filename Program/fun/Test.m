%% Open
Screen('Preference', 'SkipSyncTests', 1);
Space=KbName('Space');
No=KbName('n');
Yes=KbName('y');
ok=0;
MainScreen=max(Screen('Screens'));
ScreenRect=get(groot,'ScreenSize');
white=WhiteIndex(MainScreen);
black=BlackIndex(MainScreen);
[Window,ScreenRect]=Screen('OpenWindow',MainScreen,black);
FlipInterval=Screen('GetFlipInterval', Window);
ListenChar(2)
Priority(1)
Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
[OffWindow]=Screen('OpenOffscreenWindow',MainScreen);
OpenRect=ScreenRect;


Size0=70;
Size2=40;
Size3=25;
SizeAdvance=20;
SizeList=20;
SizeLabs=15;
