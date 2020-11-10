function [SVSThermoOut,Window]=SVSThermoH1(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,TimetoFillinSecs,test,Version,Index1,Index2)
Screen('Preference', 'SkipSyncTests', 1);

if test==1
    [Index1,Index2,ValueIndex21,ValueIndex22]=ValueSelect;
    Space=KbName('Space');
    ok=0;
    MainScreen=max(Screen('Screens'));
    ScreenRect=get(groot,'ScreenSize');
    white=WhiteIndex(MainScreen);
    black=BlackIndex(MainScreen);
    TimetoFillinSecs=10;
    Version=3;
end

rng 'shuffle'
SecInt=1.5;
TimetoFill=TimetoFillinSecs.*60;

%Instructions SVS 1 - Page 1
text1_ToAdvance='Press [Space] to continue';
text1_YouAreGoing='In this questionnaire, please ask yourself:';
text1_YouAreGoing1='"What values are important to ME as guiding principles in MY life,\n and what values are less important to me?"';
text1_YouAreGoing2='There are two lists of values on the following pages. These values come from different cultures.';
text1_YouAreGoing3='In the parenthesis following each value is an explanation that may help you to understand its meaning.';

text1_YourTask='Your task is to rate how important each value is for you as a guiding principle in YOUR life:';
text1_YourTask1='Your will see the rating scale below:';

if Version==1
    text1_Opposed='Opposed to my values';
    text1_Notimportant='Not important';
    text1_Important='Important';
    text1_VeryImportant='Very important';
    text1_SupremeImportance='Of surpreme importance';
    
    None='[-1]';
    Nuller='[0]';
    One='[1]';
    Two='[2]';
    Three='[3]';
    Four='[4]';
    Five='[5]';
    Six='[6]';
    Seven='[7]';
    Numbers={None Nuller One Two Three Four Five Six Seven};
    
elseif Version==2
    
    text1_Notimportant='Of no importance';
    text1_Alittle='Of little importance';
    text1_Slightly='Of slight importance';
    text1_ModeratelyImportant='Of moderate importance';
    text1_AboveAverage='Of above average importance';
    text1_High='Of high importance';
    text1_VeryHigh='Of very high importance';
    text1_SupremeImportance='Of surpreme importance';
    
    Nuller='[0]';
    One='[1]';
    Two='[2]';
    Three='[3]';
    Four='[4]';
    Five='[5]';
    Six='[6]';
    Seven='[7]';
    Numbers={Nuller One Two Three Four Five Six Seven};
    
elseif Version==3
    text1_Notimportant='Of no importance';
    text1_Modimportant='Of moderate importance';
    text1_SupremeImportance='Of surpreme importance';
    
    Nuller='[0%]';
    One='[10%]';
    Two='[20%]';
    Three='[30%]';
    Four='[40%]';
    Five='[50%]';
    Six='[60%]';
    Seven='[70%]';
    Eight='[80%]';
    Nine='[90%]';
    Ten='[100%]';
    Numbers={Nuller One Two Three Four Five Six Seven Eight Nine Ten};
end

Mouse=imread('Pics\mouse.png');
OP=imread('Pics\OP_Button.png');
OPP=imread('Pics\OP_ButtonP.png');
Continue=imread('Pics\continue.png');
ContinueFB=imread('Pics\continue_fb.png');
if Version==1
    Thermo=imread('Pics\Thermoskelleton.png');
elseif Version==2
    Thermo=imread('Pics\Thermoskelleton8.png');
elseif Version==3
    Thermo=imread('Pics\Thermoskelleton100.png');
end
ButtonFill=imread('Pics\fill.png');
ButtonFillP=imread('Pics\fill_pressed.png');
ButtonFillN=imread('Pics\fillN.png');

[a,b]=size(Mouse);
Out=zeros(a,b);
for i=1:a
    for j=1:b
        if Mouse(i,j)>0
            Out(i,j)=255;
        end
    end
end
Mouse(:,:,2)=Out;

Thermo=Thermo(:,:,1:2);
[a,b,~]=size(Thermo);
Out=zeros(a,b);
for i=1:a
    for j=1:b
        if Thermo(i,j)>0
            Out(i,j)=255;
        end
    end
end
Thermo(:,:,2)=Out;



%Instructions page 2
ValueList1_straight={'o EQUALITY (Equal opportunity for all)' 'o INNER HARMONY (at peace with myself)'...
    'o SOCIAL POWER (control of others, dominance)' 'o PLEASURE (gratification of desires)'...
    'o FREEDOM (freedom of action and thought)' 'o A SPIRITUAL LIFE (emphasis on spiritual not material matters)'...
    'o SENSE OF BELONGING (feeling that others care about me)' 'o SOCIAL ORDER (stability of society)'...
    'o AN EXCITING LIFE (stimulating experiences)' 'o MEANING IN LIFE (a purpose in life)'...
    'o POLITENESS (courtesy, good manners)' 'o WEALTH (material possessions)' 'o NATIONAL SECURITY (protection of my nation from enemies)'...
    'o SELF-RESPECT (belief in one’s own worth)' 'o RECIPROCATION OF FAVORS (avoidance of indebtedness)'...
    'o CREATIVITY (uniqueness, imagination)' 'o A WORLD AT PEACE (free of war and conflict)'...
    'o RESPECT FOR TRADITION (preservation of time-honoured customs)' 'o MATURE LOVE (deep emotional & spiritual intimacy)'...
    'o SELF-DISCIPLINE (self-restraint, resistance to temptation)' 'o PRIVACY (the right to have a private sphere)'...
    'o FAMILY SECURITY (safety for loved ones)' 'o SOCIAL RECOGNITION (respect, approval by others)'...
    'o UNITY WITH NATURE (fitting into nature)' 'o A VARIED LIFE (filled with challenge, novelty and change)'...
    'o WISDOM (a mature understanding of life)' 'o AUTHORITY (a right to lead or command)'...
    'o TRUE FRIENDSHIP (close, supportive friends)' 'o A WORLD OF BEAUTY (beauty of nature and the arts)'...
    'o SOCIAL JUSTICE (correcting injustice, care for the weak)'};
ValueList1={'EQUALITY' 'INNER HARMONY' 'SOCIAL POWER' 'PLEASURE'...
    'FREEDOM' 'A SPIRITUAL LIFE' 'SENSE OF BELONGING' 'SOCIAL ORDER'...
    'AN EXCITING LIFE' 'MEANING IN LIFE' 'POLITENESS' 'WEALTH' 'NATIONAL SECURITY'...
    'SELF-RESPECT' 'RECIPROCATION OF FAVORS' 'CREATIVITY' 'A WORLD AT PEACE'...
    'RESPECT FOR TRADITION' 'MATURE LOVE' 'SELF-DISCIPLINE' 'PRIVACY'...
    'FAMILY SECURITY' 'SOCIAL RECOGNITION' 'UNITY WITH NATURE' 'A VARIED LIFE'...
    'WISDOM' 'AUTHORITY' 'TRUE FRIENDSHIP' 'A WORLD OF BEAUTY'...
    'SOCIAL JUSTICE'};
ValueList1_Out={'EQUALITY' 'INNER_HARMONY' 'SOCIAL_POWER' 'PLEASURE'...
    'FREEDOM' 'A_SPIRITUAL_LIFE' 'SENSE_OF_BELONGING' 'SOCIAL_ORDER'...
    'AN_EXCITING_LIFE' 'MEANING_IN_LIFE' 'POLITENESS' 'WEALTH' 'NATIONAL_SECURITY'...
    'SELF_RESPECT' 'RECIPROCATION_OF_FAVORS' 'CREATIVITY' 'A_WORLD_AT_PEACE'...
    'RESPECT_FOR_TRADITION' 'MATURE_LOVE' 'SELF_DISCIPLINE' 'PRIVACY'...
    'FAMILY_SECURITY' 'SOCIAL_RECOGNITION' 'UNITY_WITH_NATURE' 'A_VARIED_LIFE'...
    'WISDOM' 'AUTHORITY' 'TRUE_FRIENDSHIP' 'A_WORLD_OF_BEAUTY'...
    'SOCIAL_JUSTICE'};

text1_instruction3='Before you begin, read the values in List I, choose the one that is most important to you and keep it in mind.\nAlso, choose the value that is most opposed to your values.  If there is no such value, choose the value least important to you.\nKeeps these values in mind. When you are done with the list, you can press space to start rating the values in List I.';
Subtext_List1={ '(Equal opportunity for all)' '(at peace with myself)' '(control of others, dominance)'...
    '(gratification of desires)' '(freedom of action and thought)' '(emphasis on spiritual not material matters)' ...
    '(feeling that others care about me)' '(stability of society)' '(stimulating experiences)'...
    '(a purpose in life)' '(courtesy, good manners)' '(material possessions)' '(protection of my nation from enemies)'...
    '(belief in one’s own worth)' '(avoidance of indebtedness)' '(uniqueness, imagination)' ' (free of war and conflict)'...
    '(preservation of time-honoured customs)' '(deep emotional & spiritual intimacy)' '(self-restraint, resistance to temptation)'...
    '(the right to have a private sphere)' '(safety for loved ones)' '(respect, approval by others)' '(fitting into nature)'...
    '(filled with challenge, novelty and change)' '(a mature understanding of life)' '(a right to lead or command)' '(close, supportive friends)'...
    '(beauty of nature and the arts)' '(correcting injustice, care for the weak)'};

text1_instruction4='Now rate how important each of the following values are AS GUIDING PRINCIPLES IN YOUR LIFE.';
text1_instruction4_2='You can change your position as many times as you like. Clicking “FILL” will cause the marker to reset and climb up from\nthe bottom again. It will climb for as long as you keep “FILL” clicked. \nWhen a value is opposed to your principles, click:                                       Satisfied with your rating? Just click:';
text1_AsAGuidingP='How important is this value AS A GUIDING PRINCIPLE IN YOUR LIFE?';
text1_instruction6='To indicate how important the value is for you, click the “FILL” button and HOLD IT. This will cause the marker to climb up the\nscale. Just release the button when you think that the position of the marker represents how important the value is to you.\nDon´t worry about having to respond quickly. The marker rises very slowly to make sure you have enough time to respond.';
if Version==1
    text1_instruction7='By stopping the marker in the very bottom of the scale, you indicate that the value is opposed to the principles that guide you.\nBy stopping the marker at top end, you say that the value is of supreme importance as a guiding principle in YOUR life;\nORDINARILY THERE ARE NO MORE THAN TWO SUCH VALUES.\nWhen a value is opposed to your principles, click:                                       Satisfied with your rating? Just click:';
elseif Version==2 || Version==3
    text1_instruction7='By stopping the marker in the very bottom of the scale, you indicate that the value is not important to the principles that guide you.\nBy stopping the marker at top end, you say that the value is of supreme importance as a guiding principle in YOUR life;\nORDINARILY THERE ARE NO MORE THAN TWO SUCH VALUES.\nWhen a value is opposed to your principles, click:                                       Satisfied with your rating? Just click:';
end
text1_instruction8='Every time you click “FILL”, the marker starts to climb up from the bottom again. That means you can change your rating as\nmany times as you like. However, be aware that once you clicked continue, you won’t be able to go back to change your rating.';


%Instructions List II
text1_instruction5='Now rate how important each of the following values is for you as a guiding principle in YOUR life. These values are phrased\nas ways of acting that may be more or less important for you. Once again, try to distinguish as much as possible between\nthe values.\n\nBefore you begin, read the values in List II, choose the one that is most important to you keep it in mind.  Also, choose\nthe value that is most opposed to your values.  If there is no such value, choose the value least important to you. Keep these\nvalues in mind. When you are done with the list you can press space to start rating the values in List II';

ValueList2_straight={'o INDEPENDENT (self-reliant, self-sufficient)' 'o MODERATE (avoiding extremes of feeling & Action)'...
    'o LOYAL (faithful to my friends)' 'o AMBITIOUS (hard-working, aspiring)'...
    'o BROADMINDED (tolerant of different ideas and beliefs)' 'o HUMBLE (modest, self-effacing)'...
    'o DARING (seeking adventure, risk)' 'o PROTECTING THE ENVIRONMENT (preserving nature)'...
    'o INFLUENTAL (having an impact on people and events)' 'o HONORING OF PARENTS AND ELDERS (showing respect)'...
    'o CHOOSING OWN GOALS (selecting own purposes)' 'o HEALTHY (not being sick physically or mentally)' 'o CAPABLE (competent, effective, efficient)'...
    'o ACCEPTING MY PORTION IN LIFE (submitting to life’s circumstances)' 'o HONEST (genuine, sincere)'...
    'o PRESERVING MY PUBLIC IMAGE (protecting my “face”)' 'o OBEDIENT (dutiful, meeting obligations)'...
    'o INTELLIGENT (logical, thinking)' 'o HELPFUL (working for the welfare of others)'...
    'o ENJOYING LIFE (enjoying food, sex, leisure, etc.)' 'o DEVOUT (holding to religious faith & belief)'...
    'o RESPONSIBLE (dependable, reliable)' 'o CURIOUS (interested in everything, exploring)'...
    'o FORGIVING (willing to pardon others)' 'o SUCCESSFUL (achieving goals)' 'o CLEAN (neat, tidy)' ...
    'o SELF-INDULGENT (doing pleasant things)'};
ValueList2={'INDEPENDENT' 'MODERATE' 'LOYAL' 'AMBITIOUS' 'BROADMINDED' 'HUMBLE' 'DARING'...
    'PROTECTING THE ENVIRONMENT' 'INFLUENTAL' 'HONORING OF PARENTS AND ELDERS' 'CHOOSING OWN GOALS'...
    'HEALTHY' 'CAPABLE' 'ACCEPTING MY PORTION IN LIFE' 'HONEST' 'PRESERVING MY PUBLIC IMAGE'...
    'OBEDIENT' 'INTELLIGENT' 'HELPFUL' 'ENJOYING LIFE' 'DEVOUT' 'RESPONSIBLE' 'CURIOUS'...
    'FORGIVING' 'SUCCESSFUL' 'CLEAN' 'SELF-INDULGENT'};
ValueList2_Out={'INDEPENDENT' 'MODERATE' 'LOYAL' 'AMBITIOUS' 'BROADMINDED' 'HUMBLE' 'DARING'...
    'PROTECTING_THE_ENVIRONMENT' 'INFLUENTAL' 'HONORING_OF_PARENTS_AND_ELDERS' 'CHOOSING_OWN_GOALS'...
    'HEALTHY' 'CAPABLE' 'ACCEPTING_MY_PORTION_IN_LIFE' 'HONEST' 'PRESERVING_MY_PUBLIC_IMAGE'...
    'OBEDIENT' 'INTELLIGENT' 'HELPFUL' 'ENJOYING_LIFE' 'DEVOUT' 'RESPONSIBLE' 'CURIOUS'...
    'FORGIVING' 'SUCCESSFUL' 'CLEAN' 'SELF_INDULGENT'};
Subtext_List2={'(self-reliant, self-sufficient)' '(avoiding extremes of feeling & Action)'...
    '(faithful to my friends)' '(hard-working, aspiring)' '(tolerant of different ideas and beliefs)'...
    '(modest, self-effacing)' '(seeking adventure, risk)' '(preserving nature)' '(having an impact on people and events)'...
    '(showing respect)' '(selecting own purposes)' '(not being sick physically or mentally)' '(competent, effective, efficient)'...
    '(submitting to life’s circumstances)' '(genuine, sincere)' '(protecting my “face”)' '(dutiful, meeting obligations)'...
    '(logical, thinking)' '(working for the welfare of others)' '(enjoying food, sex, leisure, etc.)' '(holding to religious faith & belief)'...
    '(dependable, reliable)' '(interested in everything, exploring)' '(willing to pardon others)' '(achieving goals)' '(neat, tidy)' '(doing pleasant things)'};
ValList_Out={'PO' 'AC' 'HE' 'ST' 'SD' 'UN' 'BE' 'TR' 'CO' 'SE'};
DimList_Out={'Enhancement' 'Openness' 'Transcendence' 'Conservation'};
try
    if test==1
        [Window,ScreenRect]=Screen('OpenWindow',MainScreen,black);
        FlipInterval=Screen('GetFlipInterval', Window);
        ListenChar(2)
        Priority(1)
        Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        [OffWindow]=Screen('OpenOffscreenWindow',MainScreen);
    end
    HideCursor;
    Size0=70;
    Size2=40;
    Size3=25;
    SizeAdvance=20;
    SizeList=20;
    SizeLabs=15;
    
    TexMouse=Screen('MakeTexture', Window, Mouse);
    TexContinue=Screen('MakeTexture', Window, Continue);
    TexThermo=Screen('MakeTexture', Window, Thermo);
    TexContinueFB=Screen('MakeTexture', Window, ContinueFB);
    TexButtonFill=Screen('MakeTexture', Window, ButtonFill);
    TexButtonFillP=Screen('MakeTexture', Window, ButtonFillP);
    TexButtonFillN=Screen('MakeTexture', Window, ButtonFillN);
    TexOP=Screen('MakeTexture', Window, OP);
    TexOPP=Screen('MakeTexture', Window, OPP);
    SizeMouse=ScreenRect(3).*.019;
    SizeContinue=ScreenRect(3).*.035;
    SizeButtonFill=[ScreenRect(3).*.07 ScreenRect(4).*.07];
    
    %% First Instructions of the SVS
    Screen('TextSize', Window, Size2);
    
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_YouAreGoing,'center',(ScreenRect(4)./100).*30, white,0,...
        0,0,3);
    Screen('TextSize', Window, (Size3+5));
    DrawFormattedText(Window, text1_YouAreGoing1,'center',(ScreenRect(4)./100).*40, white,0,...
        0,0,3);
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, text1_YouAreGoing2,'center',(ScreenRect(4)./100).*60 , white,0,...
        0,0,3);
    
    DrawFormattedText(Window, text1_YouAreGoing3,'center',(ScreenRect(4)./100).*70 , white,0,...
        0,0,3);
    
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    
    
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    ok=0;
    %% First Page - Second part
    LocationThermo=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*28 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*28)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*10),...
        white);
    
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, text1_YourTask,'center',(ScreenRect(4)./100).*20, white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_YourTask1,'center',(ScreenRect(4)./100).*23, white,0,...
        0,0,1.5 );
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo)
    
    Screen('TextSize', Window, SizeLabs);
    
    if Version==1
        DrawFormattedText(Window, text1_Opposed,LocationThermo(1)-ScreenRect(3).*0.13 ,LocationThermo(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo(1)-ScreenRect(3).*0.087 ,LocationThermo(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo(1)-ScreenRect(3).*0.0714 ,LocationThermo(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo(1)-ScreenRect(3).*0.09 ,LocationThermo(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo(1)-ScreenRect(3).*0.13541 ,LocationThermo(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo(1)+ScreenRect(3).*.015...
            LocationThermo(4)+ScreenRect(4).*.02...
            (LocationThermo(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo(1)-ScreenRect(3).*0.015 ,LocationThermo(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        DrawFormattedText(Window, text1_Notimportant,LocationThermo(1)-ScreenRect(3).*0.10 ,LocationThermo(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo(1)-ScreenRect(3).*0.106 ,LocationThermo(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo(1)-ScreenRect(3).*0.111 ,LocationThermo(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo(1)-ScreenRect(3).*0.131 ,LocationThermo(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo(1)-ScreenRect(3).*0.155 ,LocationThermo(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo(1)-ScreenRect(3).*0.105 ,LocationThermo(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo(1)-ScreenRect(3).*0.1275 ,LocationThermo(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo(1)-ScreenRect(3).*0.13 ,LocationThermo(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo(1)+ScreenRect(3).*.015...
            LocationThermo(4)+ScreenRect(4).*.02...
            (LocationThermo(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo(1)-ScreenRect(3).*0.015 ,LocationThermo(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
    elseif Version==3
        DrawFormattedText(Window, text1_Notimportant,LocationThermo(1)-ScreenRect(3).*0.1175 ,LocationThermo(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo(1)-ScreenRect(3).*0.15 ,LocationThermo(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo(1)-ScreenRect(3).*0.15 ,LocationThermo(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo(1)+ScreenRect(3).*.015...
            LocationThermo(4)+ScreenRect(4).*.02...
            (LocationThermo(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo(1)-ScreenRect(3).*0.032 ,LocationThermo(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo(1)-ScreenRect(3).*0.022 ,LocationThermo(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo(1)-ScreenRect(3).*0.027 ,LocationThermo(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
    end
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text1_ToAdvance,'center',((ScreenRect(4)./100).*93  ),...
        white,[],[],[],3);
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    ok=0;
    %% First Page - Third Part
    LocationThermo1=[(ScreenRect(3)./100).*(75.5)  (ScreenRect(4)./100).*28 ((ScreenRect(3)./100).*75.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*28)+(ScreenRect(4).*0.52)];
    DemoMarker1=[LocationThermo1(1)+ScreenRect(3).*.01  LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.61)  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
    LocationThermo2=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*28 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*28)+(ScreenRect(4).*0.52)];
    DemoMarker2=[LocationThermo2(1)+ScreenRect(3).*.01  LocationThermo2(4)-((LocationThermo2(4)-LocationThermo2(2)).*0.25)  LocationThermo2(3)- ScreenRect(3).*.008  LocationThermo2(4)-ScreenRect(4).*.006];
    LocationThermo3=[(ScreenRect(3)./100).*(17.5)  (ScreenRect(4)./100).*28 ((ScreenRect(3)./100).*17.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*28)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*08 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction6,ScreenRect(3).*.05,(ScreenRect(4)./100).*15, white,0,...
        0,0,2 );
    Screen('FillRect', Window, [0 0 255], DemoMarker1)
    
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
    
    
    
    if Version==1
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.087 ,LocationThermo2(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo2(1)-ScreenRect(3).*0.0714 ,LocationThermo2(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo2(1)-ScreenRect(3).*0.09 ,LocationThermo2(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo2(1)-ScreenRect(3).*0.13541 ,LocationThermo2(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.087 ,LocationThermo3(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo3(1)-ScreenRect(3).*0.0714 ,LocationThermo3(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo3(1)-ScreenRect(3).*0.09 ,LocationThermo3(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo3(1)-ScreenRect(3).*0.13541 ,LocationThermo3(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.10 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo2(1)-ScreenRect(3).*0.106 ,LocationThermo2(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo2(1)-ScreenRect(3).*0.111 ,LocationThermo2(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo2(1)-ScreenRect(3).*0.131 ,LocationThermo2(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo2(1)-ScreenRect(3).*0.155 ,LocationThermo2(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo2(1)-ScreenRect(3).*0.105 ,LocationThermo2(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo2(1)-ScreenRect(3).*0.1275 ,LocationThermo2(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.10 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo3(1)-ScreenRect(3).*0.106 ,LocationThermo3(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo3(1)-ScreenRect(3).*0.111 ,LocationThermo3(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo3(1)-ScreenRect(3).*0.131 ,LocationThermo3(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo3(1)-ScreenRect(3).*0.155 ,LocationThermo3(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo3(1)-ScreenRect(3).*0.105 ,LocationThermo3(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo3(1)-ScreenRect(3).*0.1275 ,LocationThermo3(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==3
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.1175 ,LocationThermo2(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.032 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.022 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.027 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.1175 ,LocationThermo3(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.032 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.022 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.027 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
    end
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*95 ), white);
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*52.5  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*52.5)+SizeMouse ((ScreenRect(4)./100).*85)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*82.5  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*82.5)+SizeMouse ((ScreenRect(4)./100).*85)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*28  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*28)+SizeMouse ((ScreenRect(4)./100).*85)+(SizeMouse.*1.49)])
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    ok=0;
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    %% First Page - Fourth Part
    LocationThermo1=[(ScreenRect(3)./100).*(75.5)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*75.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    DemoMarker1=[LocationThermo1(1)+ScreenRect(3).*.01  LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.61)  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
    LocationThermo2=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    DemoMarker2=[LocationThermo2(1)+ScreenRect(3).*.01  LocationThermo2(4)-((LocationThermo2(4)-LocationThermo2(2)).*0.25)  LocationThermo2(3)- ScreenRect(3).*.008  LocationThermo2(4)-ScreenRect(4).*.006];
    LocationThermo3=[(ScreenRect(3)./100).*(17.5)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*17.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*05 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction7,ScreenRect(3).*.035,(ScreenRect(4)./100).*75, white,0,...
        0,0,2 );
    Screen('FillRect', Window, [0 0 255], DemoMarker1)
    
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
    
    if Version==1
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.087 ,LocationThermo2(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo2(1)-ScreenRect(3).*0.0714 ,LocationThermo2(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo2(1)-ScreenRect(3).*0.09 ,LocationThermo2(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo2(1)-ScreenRect(3).*0.13541 ,LocationThermo2(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.087 ,LocationThermo3(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo3(1)-ScreenRect(3).*0.0714 ,LocationThermo3(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo3(1)-ScreenRect(3).*0.09 ,LocationThermo3(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo3(1)-ScreenRect(3).*0.13541 ,LocationThermo3(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.10 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo2(1)-ScreenRect(3).*0.106 ,LocationThermo2(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo2(1)-ScreenRect(3).*0.111 ,LocationThermo2(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo2(1)-ScreenRect(3).*0.131 ,LocationThermo2(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo2(1)-ScreenRect(3).*0.155 ,LocationThermo2(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo2(1)-ScreenRect(3).*0.105 ,LocationThermo2(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo2(1)-ScreenRect(3).*0.1275 ,LocationThermo2(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.10 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo3(1)-ScreenRect(3).*0.106 ,LocationThermo3(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo3(1)-ScreenRect(3).*0.111 ,LocationThermo3(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo3(1)-ScreenRect(3).*0.131 ,LocationThermo3(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo3(1)-ScreenRect(3).*0.155 ,LocationThermo3(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo3(1)-ScreenRect(3).*0.105 ,LocationThermo3(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo3(1)-ScreenRect(3).*0.1275 ,LocationThermo3(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==3
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.1175 ,LocationThermo2(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.032 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.022 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.027 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.1175 ,LocationThermo3(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.032 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.022 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.027 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
    end
    
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*97.5 ), white);
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*52.5  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*52.5)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*82.5  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*82.5)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*28  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*28)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(86)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*86)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*97  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*97)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexOP,[],[(ScreenRect(3)./100).*(41)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*41)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*43  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*43)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    ok=0;
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    %% First Page - Fifth Part
    LocationThermo1=[(ScreenRect(3)./100).*(75.5)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*75.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    DemoMarker1=[LocationThermo1(1)+ScreenRect(3).*.01  LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.61)  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
    LocationThermo2=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    DemoMarker2=[LocationThermo2(1)+ScreenRect(3).*.01  LocationThermo2(4)-((LocationThermo2(4)-LocationThermo2(2)).*0.25)  LocationThermo2(3)- ScreenRect(3).*.008  LocationThermo2(4)-ScreenRect(4).*.006];
    LocationThermo3=[(ScreenRect(3)./100).*(17.5)  (ScreenRect(4)./100).*8 ((ScreenRect(3)./100).*17.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*8)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*05 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction8,ScreenRect(3).*.05,(ScreenRect(4)./100).*77, white,0,...
        0,0,2 );
    Screen('FillRect', Window, [0 0 255], DemoMarker1)
    
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
    
    if Version==1
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.087 ,LocationThermo2(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo2(1)-ScreenRect(3).*0.0714 ,LocationThermo2(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo2(1)-ScreenRect(3).*0.09 ,LocationThermo2(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo2(1)-ScreenRect(3).*0.13541 ,LocationThermo2(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.087 ,LocationThermo3(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo3(1)-ScreenRect(3).*0.0714 ,LocationThermo3(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo3(1)-ScreenRect(3).*0.09 ,LocationThermo3(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo3(1)-ScreenRect(3).*0.13541 ,LocationThermo3(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.10 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo2(1)-ScreenRect(3).*0.106 ,LocationThermo2(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo2(1)-ScreenRect(3).*0.111 ,LocationThermo2(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo2(1)-ScreenRect(3).*0.131 ,LocationThermo2(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo2(1)-ScreenRect(3).*0.155 ,LocationThermo2(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo2(1)-ScreenRect(3).*0.105 ,LocationThermo2(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo2(1)-ScreenRect(3).*0.1275 ,LocationThermo2(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.10 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo3(1)-ScreenRect(3).*0.106 ,LocationThermo3(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo3(1)-ScreenRect(3).*0.111 ,LocationThermo3(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo3(1)-ScreenRect(3).*0.131 ,LocationThermo3(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo3(1)-ScreenRect(3).*0.155 ,LocationThermo3(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo3(1)-ScreenRect(3).*0.105 ,LocationThermo3(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo3(1)-ScreenRect(3).*0.1275 ,LocationThermo3(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==3
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.1175 ,LocationThermo2(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.032 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.022 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.027 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.1175 ,LocationThermo3(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.032 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.022 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.027 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
    end
    
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*97.5 ), white);
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*52.5  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*52.5)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*82.5  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*82.5)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*28  (ScreenRect(4)./100).*65 ((ScreenRect(3)./100).*28)+SizeMouse ((ScreenRect(4)./100).*65)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(46)  (ScreenRect(4)./100).*87 ((ScreenRect(3)./100).*46)+SizeContinue*3.57 ((ScreenRect(4)./100).*87)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*56  (ScreenRect(4)./100).*91 ((ScreenRect(3)./100).*56)+SizeMouse ((ScreenRect(4)./100).*91)+(SizeMouse.*1.49)])
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    ok=0;
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    %% First Page - Sixth Part
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction - VALUE LIST I','center',(ScreenRect(4)./100.*15 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction3,ScreenRect(3).*.05,(ScreenRect(4)./100).*40, white,0,...
        0,0,4);
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    ok=0;
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    
    %% Present Value List I
    T1=GetSecs();
    T2=GetSecs()+60;
    Random1=Index1;
    Random1=Random1(randperm(length(Random1)));
    
    while ok==0
        while T1<T2
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window, 'VALUE LIST I','center',(ScreenRect(4)./100.*15 ),...
                white);
            Screen('TextSize', Window, SizeList);
            for i=1:length(Random1)
                %j=Random1(i);
                if i<(floor(length(Random1)./2))
                    DrawFormattedText(Window, ValueList1_straight{Random1(i)},ScreenRect(3).*.05,(ScreenRect(4).*(.3 +(.055*i)) ),...
                        white);
                else
                    DrawFormattedText(Window, ValueList1_straight{Random1(i)},ScreenRect(3).*.53   ,(ScreenRect(4).*(.3+(.055*(i-floor(length(Random1)./2)))) ),...
                        white);
                end
            end
            
            Screen('Flip', Window);
            while ~ ok
                GetMouse(Window);
                [~, ~, keyCode] = KbCheck(-1);
                ok=find(keyCode==1);
                if isempty(ok)
                    ok=0;
                elseif ok==Space
                    ok=1;
                else
                    ok=0;
                end
                T1=GetSecs();
                if T1>T2
                    break;
                end
            end
            
            
            
            [keyIsDown] = KbCheck(-1);
            while keyIsDown==1
                [keyIsDown] = KbCheck(-1);
            end
            if ok==1
                break;
            end
            ok=0;
        end
        
        Screen('TextSize', Window, Size2);
        DrawFormattedText(Window, 'VALUE LIST I','center',(ScreenRect(4)./100.*15 ),...
            white);
        Screen('TextSize', Window, SizeList);
        for i=1:length(Random1)
            %j=Random1(i);
            if i<(floor(length(Random1)./2))
                DrawFormattedText(Window, ValueList1_straight{Random1(i)},ScreenRect(3).*.05,(ScreenRect(4).*(.3 +(.055*i)) ),...
                    white);
            else
                DrawFormattedText(Window, ValueList1_straight{Random1(i)},ScreenRect(3).*.53   ,(ScreenRect(4).*(.3+(.055*(i-floor(length(Random1)./2)))) ),...
                    white);
            end
            
            Screen('TextSize', Window, SizeAdvance);
            DrawFormattedText(Window, text1_ToAdvance,'center',...
                ((ScreenRect(4)./100 ).*90  ), white);
        end
        
        T1=Screen('Flip', Window);
        while ~ ok
            GetMouse(Window);
            [~, ~, keyCode] = KbCheck(-1);
            ok=find(keyCode==1);
            if isempty(ok)
                ok=0;
            elseif ok==Space
                ok=1;
            else
                ok=0;
            end
        end
        
        
        
        [keyIsDown] = KbCheck(-1);
        while keyIsDown==1
            [keyIsDown] = KbCheck(-1);
        end
        if ok==1
            break;
        end
        ok=0;
    end
    ok=0;
    
    %% Second Page
    LocationThermo1=[(ScreenRect(3)./100).*(75.5)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*75.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    DemoMarker1=[LocationThermo1(1)+ScreenRect(3).*.01  LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.61)  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
    LocationThermo2=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    DemoMarker2=[LocationThermo2(1)+ScreenRect(3).*.01  LocationThermo2(4)-((LocationThermo2(4)-LocationThermo2(2)).*0.25)  LocationThermo2(3)- ScreenRect(3).*.008  LocationThermo2(4)-ScreenRect(4).*.006];
    LocationThermo3=[(ScreenRect(3)./100).*(17.5)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*17.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction - VALUE LIST I','center',(ScreenRect(4)./100.*5 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction4,'center',(ScreenRect(4)./100).*10, white,0,...
        0,0,2 );
    DrawFormattedText(Window, text1_instruction4_2,ScreenRect(3).*.035,(ScreenRect(4)./100).*79, white,0,...
        0,0,2 );
    Screen('FillRect', Window, [0 0 255], DemoMarker1)
    
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
    
    if Version==1
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.087 ,LocationThermo2(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo2(1)-ScreenRect(3).*0.0714 ,LocationThermo2(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo2(1)-ScreenRect(3).*0.09 ,LocationThermo2(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo2(1)-ScreenRect(3).*0.13541 ,LocationThermo2(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.087 ,LocationThermo3(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo3(1)-ScreenRect(3).*0.0714 ,LocationThermo3(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo3(1)-ScreenRect(3).*0.09 ,LocationThermo3(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo3(1)-ScreenRect(3).*0.13541 ,LocationThermo3(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.10 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo2(1)-ScreenRect(3).*0.106 ,LocationThermo2(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo2(1)-ScreenRect(3).*0.111 ,LocationThermo2(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo2(1)-ScreenRect(3).*0.131 ,LocationThermo2(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo2(1)-ScreenRect(3).*0.155 ,LocationThermo2(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo2(1)-ScreenRect(3).*0.105 ,LocationThermo2(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo2(1)-ScreenRect(3).*0.1275 ,LocationThermo2(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.10 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo3(1)-ScreenRect(3).*0.106 ,LocationThermo3(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo3(1)-ScreenRect(3).*0.111 ,LocationThermo3(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo3(1)-ScreenRect(3).*0.131 ,LocationThermo3(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo3(1)-ScreenRect(3).*0.155 ,LocationThermo3(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo3(1)-ScreenRect(3).*0.105 ,LocationThermo3(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo3(1)-ScreenRect(3).*0.1275 ,LocationThermo3(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==3
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.1175 ,LocationThermo2(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.032 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.022 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.027 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.1175 ,LocationThermo3(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.032 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.022 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.027 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
    end
    
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*97.5 ), white);
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*52.5  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*52.5)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*82.5  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*82.5)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*28  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*28)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(86)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*86)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*97  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*97)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexOP,[],[(ScreenRect(3)./100).*(41)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*41)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*43  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*43)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    
    %% Value List I Thermoscale rating
    rng('shuffle')
    Random1=Random1(randperm(length(Random1)));
    ShowCursor
    LocationThermo1=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*32 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*32)+(ScreenRect(4).*0.52)];
    PosFill=[LocationThermo1(1)+ScreenRect(3).*.015...
        LocationThermo1(4)+ScreenRect(4).*.02...
        (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
        (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)];
    StartVPOS=LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.02);
    SVSThermoChoices=ones(1,57)*99;
    
    Screen('TextSize', OffWindow, (Size3-5));
    %[~,~,Abounds]=DrawFormattedText(OffWindow, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
    %    white);
    %ATextSize=Abounds(3)-Abounds(1);
    %AResidue=(ScreenRect(3)./2)-ATextSize;
    %ATextPos=(ScreenRect(4).*.166667)+(AResidue./2);
    BaseSpeed=((LocationThermo1(4)-LocationThermo1(2))./TimetoFill).*ceil(SecInt);
    PosContinue=[(ScreenRect(3)./100).*(85)  PosFill(2) ((ScreenRect(3)./100).*85)+SizeContinue*3.57 PosFill(2)+SizeContinue];
    PosOP=[PosFill(1)-SizeContinue.*4  PosFill(2) (PosFill(1)-(SizeContinue.*4))+SizeContinue*3.57 PosFill(4)];
    
    for SVS_1=1:length(Random1)
        
        OPFlag=0;
        Res=99;
        Color=[0 0 255];
        Flag=0;
        VPOS=StartVPOS;
        Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
        starttime = GetSecs(); %get start time
        vbl = starttime; %current time, which will increment during animation loop
        while Flag==0
            StartVPOS=LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.02);
            VPOS=StartVPOS;
            ok=0;
            Screen('TextSize', Window, (Size3-5));
            DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                white);
            Screen('TextSize', Window, Size0);
            Screen('TextSize', OffWindow, Size0);
            %[~,~,bounds]=DrawFormattedText(OffWindow, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*30),...
            %    white);
            %TextSize=bounds(3)-bounds(1);
            %Residue=(ScreenRect(3)./2)-TextSize;
            %TextPos=(ScreenRect(4).*.166667)+(Residue./2);
            DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*15),...
                white);
            Screen('TextSize', Window, Size3);
            Screen('TextSize', OffWindow, Size3);
            %[~,~,bounds]=DrawFormattedText(OffWindow, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*30),...
            %    white);
            %TextSize=bounds(3)-bounds(1);
            %Residue=(ScreenRect(3)./2)-TextSize;
            %TextPosSub=(ScreenRect(4).*.166667)+(Residue./2);
            DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*20),...
                white);
            Screen('TextSize', Window, Size3);
            
            if Version==1
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                    0,0,1.5 );
                
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                    0,0,1.5 );
                for i=1:9
                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                        0,0,1.5 );
                end
                
            elseif Version==2
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                    0,0,1.5 );
                for i=1:8
                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                        0,0,1.5 );
                end
            elseif Version==3
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                    0,0,1.5 );
                Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                    LocationThermo1(4)+ScreenRect(4).*.02...
                    (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                    (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                
                for i=1:11
                    if i==11
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    elseif i==1
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    else
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    end
                end
            end
            
            Screen('DrawTexture', Window, TexContinue,[],PosContinue)
            
            if OPFlag==0
                Screen('FillRect', Window, Color, Marker)
                Screen('DrawTexture', Window, TexOP,[],PosOP)
                Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
            else
                VPOS=StartVPOS;
                Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                Screen('FillRect', Window, [255 255 255], Marker)
                Screen('DrawTexture', Window, TexOPP,[],PosOP)
                Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
            end
            Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
            vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
            
            while ~ ok
                [PosX,PosY,Buttons]=GetMouse(Window);
                ok=find(Buttons==1);
                
                if Buttons(1)&&PosX>PosFill(1)&&PosX<PosFill(3)&&PosY>PosFill(2)&&PosY<PosFill(4)
                    
                    while any(Buttons)
                        [~,~,Buttons]=GetMouse(Window);
                        if OPFlag==0
                            VPOS=VPOS-BaseSpeed;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            
                            if Marker(2)<LocationThermo1(2)+ScreenRect(4).*.007
                                Marker(2)=LocationThermo1(2)+ScreenRect(4).*.007;
                            end
                            Range=StartVPOS-(LocationThermo1(2)+ScreenRect(4).*.007);
                            Res=(StartVPOS-Marker(2))./Range;
                            
                            
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                        end
                        %if Res<.25
                        %    Color=[0 round((0+(255.*(Res.*4)))) 255];
                        %elseif Res<.5
                        %    Color=[0 255 round(255-(255.*((Res-.25).*4)))];
                        %elseif Res<.75
                        %    Color=[round((0+(255.*((Res-.5).*4)))) 255 0];
                        %else
                        %    Color=[255 round(255-(255.*((Res-.75).*4))) 0];
                        %end
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*20),...
                            white);
                        Color=[0 0 255];
                        
                        
                        
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            
                            
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            
                            
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                            
                        end
                        
                        Screen('DrawTexture', Window, TexContinue,[],PosContinue)
                        
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexButtonFillP,[],PosFill)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                    end
                    ok=1;
                elseif Buttons(1)&&PosX>PosOP(1) && PosX<PosOP(3) && PosY>PosOP(2) && PosY<PosOP(4)
                    if OPFlag==0
                        OPFlag=1;
                        ok=1;
                    else
                        OPFlag=0;
                        ok=1;
                    end
                    
                    while Buttons(1)==1
                        [~,~,Buttons]=GetMouse(Window);
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*20),...
                            white);
                        Color=[0 0 255];
                        
                        
                        
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            
                            
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                        end
                        
                        Screen('DrawTexture', Window, TexContinue,[],PosContinue)
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                        
                    end
                    
                    
                    
                elseif Buttons(1)&&PosX>PosContinue(1) && PosX<PosContinue(3) && PosY>PosContinue(2) && PosY<PosContinue(4)
                    [~,~,Buttons]=GetMouse(Window);
                    while any(Buttons)
                        [~,~,Buttons]=GetMouse(Window);
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*20 ),...
                            white);
                        
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            
                            
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                        end
                        
                        Screen('DrawTexture', Window, TexContinueFB,[],PosContinue)
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                    end
                    
                    if Res>0&&Res<1.01
                        
                        if OPFlag==1
                            SVSThermoChoices(Random1(SVS_1))=0;
                        else
                            SVSThermoChoices(Random1(SVS_1))=Res;
                        end
                        Flag=1;
                    else
                        if OPFlag==1
                            SVSThermoChoices(Random1(SVS_1))=0;
                            Flag=1;
                        end
                    end
                else
                    ok=0;
                end
            end
        end
    end
    ok=0;
    HideCursor;
    %% Third Page - Third Part
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction - VALUE LIST II','center',(ScreenRect(4)./100.*15 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction5,ScreenRect(3).*.05,(ScreenRect(4)./100).*40, white,0,...
        0,0,2 );
    
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    ok=0;
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    
    %% Present Value List II
    T1=GetSecs();
    T2=GetSecs()+60;
    Random2=Index2;
    Random2=Random2(randperm(length(Random2)));
    
    while ok==0
        while T1<T2
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window, 'VALUE LIST II','center',(ScreenRect(4)./100.*15 ),...
                white);
            Screen('TextSize', Window, SizeList);
            for i=1:length(Random2)
                %j=Random2(i);
                if i<(floor(length(Random2)./2))
                    DrawFormattedText(Window, ValueList2_straight{Random2(i)-30},ScreenRect(3).*.05,(ScreenRect(4).*(.3 +(.055*i)) ),...
                        white);
                else
                    DrawFormattedText(Window, ValueList2_straight{Random2(i)-30},ScreenRect(3).*.53,(ScreenRect(4).*(.3+(.055*(i-floor(length(Random2)./2)))) ),...
                        white);
                end
            end
            
            Screen('Flip', Window);
            while ~ ok
                GetMouse(Window);
                [~, ~, keyCode] = KbCheck(-1);
                ok=find(keyCode==1);
                if isempty(ok)
                    ok=0;
                elseif ok==Space
                    ok=1;
                else
                    ok=0;
                end
                T1=GetSecs();
                if T1>T2
                    break;
                end
            end
            
            
            
            [keyIsDown] = KbCheck(-1);
            while keyIsDown==1
                [keyIsDown] = KbCheck(-1);
            end
            if ok==1
                break;
            end
            ok=0;
        end
        
        Screen('TextSize', Window, Size2);
        DrawFormattedText(Window, 'VALUE LIST II','center',(ScreenRect(4)./100.*15 ),...
            white);
        Screen('TextSize', Window, SizeList);
        for i=1:length(Random2)
            %j=Random2(i);
            if i<(floor(length(Random2)./2))
                DrawFormattedText(Window, ValueList2_straight{Random2(i)-30},ScreenRect(3).*.05,(ScreenRect(4).*(.3 +(.055*i)) ),...
                    white);
            else
                DrawFormattedText(Window, ValueList2_straight{Random2(i)-30},ScreenRect(3).*.53,(ScreenRect(4).*(.3+(.055*(i-floor(length(Random2)./2)))) ),...
                    white);
            end
            Screen('TextSize', Window, SizeAdvance);
            DrawFormattedText(Window, text1_ToAdvance,'center',...
                ((ScreenRect(4)./100 ).*90  ), white);
        end
        
        T1=Screen('Flip', Window);
        while ~ ok
            GetMouse(Window);
            [~, ~, keyCode] = KbCheck(-1);
            ok=find(keyCode==1);
            if isempty(ok)
                ok=0;
            elseif ok==Space
                ok=1;
            else
                ok=0;
            end
        end
        
        
        
        [keyIsDown] = KbCheck(-1);
        while keyIsDown==1
            [keyIsDown] = KbCheck(-1);
        end
        if ok==1
            break;
        end
        ok=0;
    end
    ok=0;
    
    %% Fourth page
    LocationThermo1=[(ScreenRect(3)./100).*(75.5)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*75.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    DemoMarker1=[LocationThermo1(1)+ScreenRect(3).*.01  LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.61)  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
    LocationThermo2=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    DemoMarker2=[LocationThermo2(1)+ScreenRect(3).*.01  LocationThermo2(4)-((LocationThermo2(4)-LocationThermo2(2)).*0.25)  LocationThermo2(3)- ScreenRect(3).*.008  LocationThermo2(4)-ScreenRect(4).*.006];
    LocationThermo3=[(ScreenRect(3)./100).*(17.5)  (ScreenRect(4)./100).*14 ((ScreenRect(3)./100).*17.5)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*14)+(ScreenRect(4).*0.52)];
    
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, 'Instruction - VALUE LIST II','center',(ScreenRect(4)./100.*5 ),...
        white);
    
    Screen('TextSize', Window, Size3);
    
    DrawFormattedText(Window, text1_instruction4,'center',(ScreenRect(4)./100).*10, white,0,...
        0,0,2 );
    DrawFormattedText(Window, text1_instruction4_2,ScreenRect(3).*.035,(ScreenRect(4)./100).*79, white,0,...
        0,0,2 );
    Screen('FillRect', Window, [0 0 255], DemoMarker1)
    
    Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
    
    if Version==1
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.087 ,LocationThermo2(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo2(1)-ScreenRect(3).*0.0714 ,LocationThermo2(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo2(1)-ScreenRect(3).*0.09 ,LocationThermo2(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo2(1)-ScreenRect(3).*0.13541 ,LocationThermo2(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Opposed,LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.087 ,LocationThermo3(4)-ScreenRect(4).*0.0825, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Important, LocationThermo3(1)-ScreenRect(3).*0.0714 ,LocationThermo3(4)-ScreenRect(4).*0.2546, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryImportant, LocationThermo3(1)-ScreenRect(3).*0.09 ,LocationThermo3(2)+ScreenRect(4).*0.091, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo3(1)-ScreenRect(3).*0.13541 ,LocationThermo3(2)+ScreenRect(4).*0.0355, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        for i=1:9
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==2
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.10 ,LocationThermo2(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo2(1)-ScreenRect(3).*0.106 ,LocationThermo2(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo2(1)-ScreenRect(3).*0.111 ,LocationThermo2(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo2(1)-ScreenRect(3).*0.131 ,LocationThermo2(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo2(1)-ScreenRect(3).*0.155 ,LocationThermo2(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo2(1)-ScreenRect(3).*0.105 ,LocationThermo2(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo2(1)-ScreenRect(3).*0.1275 ,LocationThermo2(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.13 ,LocationThermo2(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.015 ,LocationThermo2(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.10 ,LocationThermo3(4)-ScreenRect(4).*0.027, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Alittle,LocationThermo3(1)-ScreenRect(3).*0.106 ,LocationThermo3(4)-ScreenRect(4).*0.0915, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Slightly, LocationThermo3(1)-ScreenRect(3).*0.111 ,LocationThermo3(4)-ScreenRect(4).*0.156, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo3(1)-ScreenRect(3).*0.131 ,LocationThermo3(4)-ScreenRect(4).*0.2205, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_AboveAverage, LocationThermo3(1)-ScreenRect(3).*0.155 ,LocationThermo3(4)-ScreenRect(4).*0.285, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_High, LocationThermo3(1)-ScreenRect(3).*0.105 ,LocationThermo3(4)-ScreenRect(4).*0.3495, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_VeryHigh, LocationThermo3(1)-ScreenRect(3).*0.1275 ,LocationThermo3(4)-ScreenRect(4).*0.414, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.13 ,LocationThermo3(4)-ScreenRect(4).*0.4785, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:8
            DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.015 ,LocationThermo3(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                0,0,1.5 );
        end
        
    elseif Version==3
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo1(1)+ScreenRect(3).*.015...
            LocationThermo1(4)+ScreenRect(4).*.02...
            (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, Size3);
        
        Screen('FillRect', Window, [0 0 255], DemoMarker2)
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo2)
        
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo2(1)-ScreenRect(3).*0.1175 ,LocationThermo2(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo2(1)-ScreenRect(3).*0.15 ,LocationThermo2(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFillP,[],[LocationThermo2(1)+ScreenRect(3).*.015...
            LocationThermo2(4)+ScreenRect(4).*.02...
            (LocationThermo2(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo2(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.032 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.022 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo2(1)-ScreenRect(3).*0.027 ,LocationThermo2(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
        
        
        Screen('TextSize', Window, SizeLabs);
        
        Screen('DrawTexture', Window, TexThermo,[],LocationThermo3)
        
        Screen('TextSize', Window, SizeLabs);
        DrawFormattedText(Window, text1_Notimportant,LocationThermo3(1)-ScreenRect(3).*0.1175 ,LocationThermo3(4)-ScreenRect(4).*0.00001, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_Modimportant, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.25501, white,0,...
            0,0,1.5 );
        DrawFormattedText(Window, text1_SupremeImportance, LocationThermo3(1)-ScreenRect(3).*0.15 ,LocationThermo3(4)-ScreenRect(4).*0.51001, white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo3(1)+ScreenRect(3).*.015...
            LocationThermo3(4)+ScreenRect(4).*.02...
            (LocationThermo3(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
            (LocationThermo3(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
        
        for i=1:11
            if i==11
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.032 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            elseif i==1
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.022 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Numbers{i} , LocationThermo3(1)-ScreenRect(3).*0.027 ,LocationThermo3(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                    0,0,1.5 );
            end
        end
    end
    
    Screen('TextSize', Window, SizeAdvance);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*97.5 ), white);
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*52.5  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*52.5)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*82.5  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*82.5)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*28  (ScreenRect(4)./100).*71 ((ScreenRect(3)./100).*28)+SizeMouse ((ScreenRect(4)./100).*71)+(SizeMouse.*1.49)])
    
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(86)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*86)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*97  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*97)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexOP,[],[(ScreenRect(3)./100).*(41)  (ScreenRect(4)./100).*85 ((ScreenRect(3)./100).*41)+SizeContinue*3.57 ((ScreenRect(4)./100).*85)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*43  (ScreenRect(4)./100).*89 ((ScreenRect(3)./100).*43)+SizeMouse ((ScreenRect(4)./100).*89)+(SizeMouse.*1.49)])
    
    Screen('Flip', Window);
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            ok=1;
        else
            ok=0;
        end
    end
    
    [keyIsDown] = KbCheck(-1);
    while keyIsDown==1
        [keyIsDown] = KbCheck(-1);
    end
    %% Value List II Thermo scale rating
    rng('shuffle')
    
    Random2=Random2(randperm(length(Random2)));
    ShowCursor
    LocationThermo1=[(ScreenRect(3)./100).*(45)  (ScreenRect(4)./100).*32 ((ScreenRect(3)./100).*45)+ScreenRect(3)*0.10 ((ScreenRect(4)./100).*32)+(ScreenRect(4).*0.52)];
    PosFill=[LocationThermo1(1)+ScreenRect(3).*.015...
        LocationThermo1(4)+ScreenRect(4).*.02...
        (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
        (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)];
    PosContinue=[(ScreenRect(3)./100).*(85)  PosFill(2) ((ScreenRect(3)./100).*85)+SizeContinue*3.57 PosFill(2)+SizeContinue];
    
    
    for SVS_2=1:length(Random2)
        OPFlag=0;
        Res=99;
        Color=[0 0 255];
        Flag=0;
        VPOS=StartVPOS;
        Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
        starttime = GetSecs(); %get start time
        vbl = starttime; %current time, which will increment during animation loop
        while Flag==0
            StartVPOS=LocationThermo1(4)-((LocationThermo1(4)-LocationThermo1(2)).*0.02);
            VPOS=StartVPOS;
            ok=0;
            Screen('TextSize', Window, (Size3-5));
            DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                white);
            Screen('TextSize', Window, Size0);
            Screen('TextSize', OffWindow, Size0);
            %[~,~,bounds]=DrawFormattedText(OffWindow, ValueList2{Random2(SVS_2)},'center',(ScreenRect(4)./100.*30),...
            %    white);
            %TextSize=bounds(3)-bounds(1);
            %Residue=(ScreenRect(3)./2)-TextSize;
            %TextPos=(ScreenRect(4).*.166667)+(Residue./2);
            DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*15),...
                white);
            Screen('TextSize', Window, Size3);
            Screen('TextSize', OffWindow, Size3);
            %[~,~,bounds]=DrawFormattedText(OffWindow, Subtext_List2{Random2(SVS_2)},'center',(ScreenRect(4)./100.*30),...
            %    white);
            %TextSize=bounds(3)-bounds(1);
            %Residue=(ScreenRect(3)./2)-TextSize;
            %TextPosSub=(ScreenRect(4).*.166667)+(Residue./2);
            DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*20),...
                white);
            Screen('TextSize', Window, Size3);
            
            if OPFlag==0
                Screen('FillRect', Window, Color, Marker)
            else
                VPOS=StartVPOS;
                Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                Screen('FillRect', Window, [255 255 255], Marker)
            end
            
            Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
            
            if Version==1
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                    0,0,1.5 );
                
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                    0,0,1.5 );
                for i=1:9
                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                        0,0,1.5 );
                end
                
            elseif Version==2
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                    0,0,1.5 );
                for i=1:8
                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                        0,0,1.5 );
                end
            elseif Version==3
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                    0,0,1.5 );
                Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                    LocationThermo1(4)+ScreenRect(4).*.02...
                    (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                    (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                
                for i=1:11
                    if i==11
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    elseif i==1
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    else
                        DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                            0,0,1.5 );
                    end
                end
            end
            
            Screen('DrawTexture', Window, TexContinue,[],PosContinue)
            
            if OPFlag==0
                Screen('FillRect', Window, Color, Marker)
                Screen('DrawTexture', Window, TexOP,[],PosOP)
                Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
            else
                VPOS=StartVPOS;
                Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                Screen('FillRect', Window, [255 255 255], Marker)
                Screen('DrawTexture', Window, TexOPP,[],PosOP)
                Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
            end
            Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
            vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
            
            while ~ ok
                [PosX,PosY,Buttons]=GetMouse(Window);
                ok=find(Buttons==1);
                
                if Buttons(1)&&PosX>PosFill(1)&&PosX<PosFill(3)&&PosY>PosFill(2)&&PosY<PosFill(4)
                    
                    while any(Buttons)
                        [~,~,Buttons]=GetMouse(Window);
                        if OPFlag==0
                            VPOS=VPOS-BaseSpeed;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            
                            if Marker(2)<LocationThermo1(2)+ScreenRect(4).*.007
                                Marker(2)=LocationThermo1(2)+ScreenRect(4).*.007;
                            end
                            Range=StartVPOS-(LocationThermo1(2)+ScreenRect(4).*.007);
                            Res=(StartVPOS-Marker(2))./Range;
                            
                            
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                        end
                        %if Res<.25
                        %    Color=[0 round((0+(255.*(Res.*4)))) 255];
                        %elseif Res<.5
                        %    Color=[0 255 round(255-(255.*((Res-.25).*4)))];
                        %elseif Res<.75
                        %    Color=[round((0+(255.*((Res-.5).*4)))) 255 0];
                        %else
                        %    Color=[255 round(255-(255.*((Res-.75).*4))) 0];
                        %end
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*20),...
                            white);
                        Color=[0 0 255];
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                        end
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                        end
                        
                        Screen('DrawTexture', Window, TexContinue,[],PosContinue)
                        
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFillP,[],PosFill)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                    end
                    ok=1;
                elseif Buttons(1)&&PosX>PosOP(1) && PosX<PosOP(3) && PosY>PosOP(2) && PosY<PosOP(4)
                    if OPFlag==0
                        OPFlag=1;
                        ok=1;
                    else
                        OPFlag=0;
                        ok=1;
                    end
                    
                    while Buttons(1)==1
                        [~,~,Buttons]=GetMouse(Window);
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*20),...
                            white);
                        Color=[0 0 255];
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                        end
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                        end
                        
                        Screen('DrawTexture', Window, TexContinue,[],PosContinue)
                        
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                    end
                    
                    
                    
                elseif Buttons(1)&&PosX>PosContinue(1) && PosX<PosContinue(3) && PosY>PosContinue(2) && PosY<PosContinue(4)
                    [~,~,Buttons]=GetMouse(Window);
                    while any(Buttons)
                        [~,~,Buttons]=GetMouse(Window);
                        Screen('TextSize', Window, (Size3-5));
                        DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*30),...
                            white);
                        Screen('TextSize', Window, Size0);
                        DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*15),...
                            white);
                        Screen('TextSize', Window, Size3);
                        DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*20 ),...
                            white);
                        
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                        end
                        
                        if Version==1
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Opposed,LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.087 ,LocationThermo1(4)-ScreenRect(4).*0.0825, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Important, LocationThermo1(1)-ScreenRect(3).*0.0714 ,LocationThermo1(4)-ScreenRect(4).*0.2546, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryImportant, LocationThermo1(1)-ScreenRect(3).*0.09 ,LocationThermo1(2)+ScreenRect(4).*0.091, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance ,LocationThermo1(1)-ScreenRect(3).*0.13541 ,LocationThermo1(2)+ScreenRect(4).*0.0355, white,0,...
                                0,0,1.5 );
                            for i=1:9
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.057))  , white,0,...
                                    0,0,1.5 );
                            end
                            
                        elseif Version==2
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.10 ,LocationThermo1(4)-ScreenRect(4).*0.027, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Alittle,LocationThermo1(1)-ScreenRect(3).*0.106 ,LocationThermo1(4)-ScreenRect(4).*0.0915, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Slightly, LocationThermo1(1)-ScreenRect(3).*0.111 ,LocationThermo1(4)-ScreenRect(4).*0.156, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_ModeratelyImportant, LocationThermo1(1)-ScreenRect(3).*0.131 ,LocationThermo1(4)-ScreenRect(4).*0.2205, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_AboveAverage, LocationThermo1(1)-ScreenRect(3).*0.155 ,LocationThermo1(4)-ScreenRect(4).*0.285, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_High, LocationThermo1(1)-ScreenRect(3).*0.105 ,LocationThermo1(4)-ScreenRect(4).*0.3495, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_VeryHigh, LocationThermo1(1)-ScreenRect(3).*0.1275 ,LocationThermo1(4)-ScreenRect(4).*0.414, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.13 ,LocationThermo1(4)-ScreenRect(4).*0.4785, white,0,...
                                0,0,1.5 );
                            for i=1:8
                                DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.015 ,LocationThermo1(4)-ScreenRect(4).*(0.027+((i-1).*0.0645))  , white,0,...
                                    0,0,1.5 );
                            end
                        elseif Version==3
                            Screen('TextSize', Window, SizeLabs);
                            DrawFormattedText(Window, text1_Notimportant,LocationThermo1(1)-ScreenRect(3).*0.1175 ,LocationThermo1(4)-ScreenRect(4).*0.00001, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_Modimportant, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.25501, white,0,...
                                0,0,1.5 );
                            DrawFormattedText(Window, text1_SupremeImportance, LocationThermo1(1)-ScreenRect(3).*0.15 ,LocationThermo1(4)-ScreenRect(4).*0.51001, white,0,...
                                0,0,1.5 );
                            Screen('DrawTexture', Window, TexButtonFill,[],[LocationThermo1(1)+ScreenRect(3).*.015...
                                LocationThermo1(4)+ScreenRect(4).*.02...
                                (LocationThermo1(1)+ScreenRect(3).*.015)+SizeButtonFill(1)...
                                (LocationThermo1(4)+ScreenRect(4).*.02)+SizeButtonFill(2)])
                            
                            for i=1:11
                                if i==11
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.032 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                elseif i==1
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.022 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                else
                                    DrawFormattedText(Window, Numbers{i} , LocationThermo1(1)-ScreenRect(3).*0.027 ,LocationThermo1(4)-ScreenRect(4).*(0.00001+((i-1).*0.051))  , white,0,...
                                        0,0,1.5 );
                                end
                            end
                        end
                        
                        Screen('DrawTexture', Window, TexContinueFB,[],PosContinue)
                        
                        if OPFlag==0
                            Screen('FillRect', Window, Color, Marker)
                            Screen('DrawTexture', Window, TexOP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFill,[],PosFill)
                        else
                            VPOS=StartVPOS;
                            Marker=[LocationThermo1(1)+ScreenRect(3).*.01  VPOS  LocationThermo1(3)- ScreenRect(3).*.008  LocationThermo1(4)-ScreenRect(4).*.006];
                            Screen('FillRect', Window, [255 255 255], Marker)
                            Screen('DrawTexture', Window, TexOPP,[],PosOP)
                            Screen('DrawTexture', Window, TexButtonFillN,[],PosFill)
                        end
                        Screen('DrawTexture', Window, TexThermo,[],LocationThermo1)
                        vbl = Screen('Flip',Window, vbl + (SecInt * FlipInterval));
                    end
                    
                    if Res>0&&Res<1.01
                        
                        if OPFlag==1
                            SVSThermoChoices(Random2(SVS_2))=0;
                        else
                            SVSThermoChoices(Random2(SVS_2))=Res;
                        end
                        Flag=1;
                    else
                        if OPFlag==1
                            SVSThermoChoices(Random2(SVS_2))=0;
                            Flag=1;
                        end
                    end
                else
                    ok=0;
                end
            end
        end
    end
    ok=0;
    HideCursor;
    %% Output
    for i=1:128
        if i==1
            SVSThermoOut=table(99);
            SVSThermoOut.Properties.VariableNames{i}=strcat('H1_SVSThermo_',DimList_Out{i});
        elseif i<5
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermo_',DimList_Out{i});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<15
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermo_',ValList_Out{i-4});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<45
            SVSOuttemp=table(SVSThermoChoices(i-14));
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermo_',ValueList1_Out{i-14});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<72
            SVSOuttemp=table(SVSThermoChoices(i-14));
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermo_',ValueList2_Out{i-44});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<(72+length(Random1))
            SVSOuttemp=table(Random1(i-71));
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermoSequence_',N);
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<(72+length(Random1)+length(Random2))
            SVSOuttemp=table(Random2(i-(71+length(Random1))));
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermoSequence_',N);
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        else
            SVSOuttemp=table(99);
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H1_SVSThermoSequence_',N);
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        end
    end
    
    %Power
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,17} > 1 || SVSThermoOut{1,17} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,17};
    end
    if SVSThermoOut{1,26} > 1 || SVSThermoOut{1,26} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,26};
    end
    if SVSThermoOut{1,37} > 1 || SVSThermoOut{1,37} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,37};
    end
    if SVSThermoOut{1,41} > 1 || SVSThermoOut{1,41} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,41};
    end
    if SVSThermoOut{1,60} > 1 || SVSThermoOut{1,60} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,60};
    end
    if 5-DivCount > 0
        SVSThermoOut.H1_SVSThermo_PO(1)=sum(Temp)./(5-DivCount);
    end
    
    %Achievement
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,48} > 1 || SVSThermoOut{1,48} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,48};
    end
    if SVSThermoOut{1,53} > 1 || SVSThermoOut{1,53} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,53};
    end
    if SVSThermoOut{1,57} > 1 || SVSThermoOut{1,57} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,57};
    end
    if SVSThermoOut{1,62} > 1 || SVSThermoOut{1,62} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,62};
    end
    if SVSThermoOut{1,69} > 1 || SVSThermoOut{1,69} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,69};
    end
    if 5-DivCount > 0
        SVSThermoOut.H1_SVSThermo_AC(1)=sum(Temp)./(5-DivCount);
    end
    
    %Hedonism
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,18} > 1 || SVSThermoOut{1,18} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,18};
    end
    if SVSThermoOut{1,64} > 1 || SVSThermoOut{1,64} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,64};
    end
    if SVSThermoOut{1,71} > 1 || SVSThermoOut{1,71} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,71};
    end
    if 3-DivCount > 0
        SVSThermoOut.H1_SVSThermo_HE(1)=(sum(Temp)./(3-DivCount));
    end
    
    %Stimulation
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,23} > 1 || SVSThermoOut{1,23} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,23};
    end
    if SVSThermoOut{1,39} > 1 || SVSThermoOut{1,39} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,39};
    end
    if SVSThermoOut{1,51} > 1 || SVSThermoOut{1,51} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,51};
    end
    if 3-DivCount > 0
        SVSThermoOut.H1_SVSThermo_ST(1)=(sum(Temp)./(3-DivCount));
    end
    
    %SelfDirection
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,19} > 1 || SVSThermoOut{1,19} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,19};
    end
    if SVSThermoOut{1,28} > 1 || SVSThermoOut{1,28} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,28};
    end
    if SVSThermoOut{1,30} > 1 || SVSThermoOut{1,30} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,30};
    end
    if SVSThermoOut{1,35} > 1 || SVSThermoOut{1,35} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,35};
    end
    if SVSThermoOut{1,45} > 1 || SVSThermoOut{1,45} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,45};
    end
    if SVSThermoOut{1,55} > 1 || SVSThermoOut{1,55} < 0
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        Temp(6)=SVSThermoOut{1,55};
    end
    if SVSThermoOut{1,67} > 1 || SVSThermoOut{1,67} < 0
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        Temp(7)=SVSThermoOut{1,67};
    end
    if 7-DivCount > 0
        SVSThermoOut.H1_SVSThermo_SD(1)=sum(Temp)./(7-DivCount);
    end
    
    %Universalism
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,15} > 1 || SVSThermoOut{1,15} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,15};
    end
    if SVSThermoOut{1,16} > 1 || SVSThermoOut{1,16} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,16};
    end
    if SVSThermoOut{1,31} > 1 || SVSThermoOut{1,31} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,31};
    end
    if SVSThermoOut{1,38} > 1 || SVSThermoOut{1,38} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,38};
    end
    if SVSThermoOut{1,40} > 1 || SVSThermoOut{1,40} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,40};
    end
    if SVSThermoOut{1,43} > 1 || SVSThermoOut{1,43} < 0
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        Temp(6)=SVSThermoOut{1,43};
    end
    if SVSThermoOut{1,44} > 1 || SVSThermoOut{1,44} < 0
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        Temp(7)=SVSThermoOut{1,44};
    end
    if SVSThermoOut{1,49} > 1 || SVSThermoOut{1,49} < 0
        DivCount=DivCount+1;
        Temp(8)=0;
    else
        Temp(8)=SVSThermoOut{1,49};
    end
    if SVSThermoOut{1,52} > 1 || SVSThermoOut{1,52} < 0
        DivCount=DivCount+1;
        Temp(9)=0;
    else
        Temp(9)=SVSThermoOut{1,52};
    end
    if 9-DivCount > 0
        SVSThermoOut.H1_SVSThermo_UN(1)=(sum(Temp)./(9-DivCount));
    end
    
    %Benevolence
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,20} > 1 || SVSThermoOut{1,20} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,20};
    end
    if SVSThermoOut{1,24} > 1 || SVSThermoOut{1,24} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,24};
    end
    if SVSThermoOut{1,33} > 1 || SVSThermoOut{1,33} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,33};
    end
    if SVSThermoOut{1,42} > 1 || SVSThermoOut{1,42} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,42};
    end
    if SVSThermoOut{1,47} > 1 || SVSThermoOut{1,47} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,47};
    end
    if SVSThermoOut{1,59} > 1 || SVSThermoOut{1,59} < 0
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        Temp(6)=SVSThermoOut{1,59};
    end
    if SVSThermoOut{1,63} > 1 || SVSThermoOut{1,63} < 0
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        Temp(7)=SVSThermoOut{1,63};
    end
    if SVSThermoOut{1,66} > 1 || SVSThermoOut{1,66} < 0
        DivCount=DivCount+1;
        Temp(8)=0;
    else
        Temp(8)=SVSThermoOut{1,66};
    end
    if SVSThermoOut{1,68} > 1 || SVSThermoOut{1,68} < 0
        DivCount=DivCount+1;
        Temp(9)=0;
    else
        Temp(9)=SVSThermoOut{1,68};
    end
    if 9-DivCount > 0
        SVSThermoOut.H1_SVSThermo_BE(1)=(sum(Temp)./(9-DivCount));
    end
    
    %Tradition
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,32} > 1 || SVSThermoOut{1,32} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,32};
    end
    if SVSThermoOut{1,46} > 1 || SVSThermoOut{1,46} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,46};
    end
    if SVSThermoOut{1,50} > 1 || SVSThermoOut{1,50} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,50};
    end
    if SVSThermoOut{1,58} > 1 || SVSThermoOut{1,58} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,58};
    end
    if SVSThermoOut{1,65} > 1 || SVSThermoOut{1,65} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,65};
    end
    if 5-DivCount > 0
        SVSThermoOut.H1_SVSThermo_TR(1)=(sum(Temp)./(5-DivCount));
    end
    
    %Conformity
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,25} > 1 || SVSThermoOut{1,25} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,25};
    end
    if SVSThermoOut{1,34} > 1 || SVSThermoOut{1,34} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,34};
    end
    if SVSThermoOut{1,54} > 1 || SVSThermoOut{1,54} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,54};
    end
    if SVSThermoOut{1,61} > 1 || SVSThermoOut{1,61} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,61};
    end
    if 4-DivCount > 0
        SVSThermoOut.H1_SVSThermo_CO(1)=(sum(Temp)./(4-DivCount));
    end
    
    %Security
    DivCount=0;
    Temp=0;
    if SVSThermoOut{1,21} > 1 || SVSThermoOut{1,21} < 0
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        Temp(1)=SVSThermoOut{1,21};
    end
    if SVSThermoOut{1,22} > 1 || SVSThermoOut{1,22} < 0
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        Temp(2)=SVSThermoOut{1,22};
    end
    if SVSThermoOut{1,27} > 1 || SVSThermoOut{1,27} < 0
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        Temp(3)=SVSThermoOut{1,27};
    end
    if SVSThermoOut{1,29} > 1 || SVSThermoOut{1,29} < 0
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        Temp(4)=SVSThermoOut{1,29};
    end
    if SVSThermoOut{1,36} > 1 || SVSThermoOut{1,36} < 0
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        Temp(5)=SVSThermoOut{1,36};
    end
    if SVSThermoOut{1,56} > 1 || SVSThermoOut{1,56} < 0
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        Temp(6)=SVSThermoOut{1,56};
    end
    if SVSThermoOut{1,70} > 1 || SVSThermoOut{1,70} < 0
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        Temp(7)=SVSThermoOut{1,70};
    end
    if 7-DivCount > 0
        SVSThermoOut.H1_SVSThermo_SE(1)=(sum(Temp)./(7-DivCount));
    end
    
    %Dimensions
    SVSThermoOut.H1_SVSThermo_Enhancement(1)=(SVSThermoOut.H1_SVSThermo_PO(1)+SVSThermoOut.H1_SVSThermo_AC(1))./2;
    SVSThermoOut.H1_SVSThermo_Openness(1)=(SVSThermoOut.H1_SVSThermo_HE(1)+SVSThermoOut.H1_SVSThermo_ST(1)+SVSThermoOut.H1_SVSThermo_SD(1))./3;
    SVSThermoOut.H1_SVSThermo_Transcendence(1)=(SVSThermoOut.H1_SVSThermo_UN(1)+SVSThermoOut.H1_SVSThermo_BE(1))./2;
    SVSThermoOut.H1_SVSThermo_Conservation(1)=(SVSThermoOut.H1_SVSThermo_CO(1)+SVSThermoOut.H1_SVSThermo_TR(1)+SVSThermoOut.H1_SVSThermo_SE(1))./3;
    
    %MRAT
    DivCount=0;
    Temp=zeros(1,57);
    for i=1:57
        if SVSThermoOut{1,(i+14)} > 1 || SVSThermoOut{1,(i+14)} < 0
            DivCount=DivCount+1;
            Temp(i)=0;
        else
            Temp(i)=SVSThermoOut{1,(i+14)};
        end
    end
    if 57-DivCount > 0
        SVSThermoOut.H1_MRAT=sum(Temp)./(57-DivCount);
    end
    
    SVSThermoOut.H1_SVSThermo_POc(1)=SVSThermoOut{1,5}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_ACc(1)=SVSThermoOut{1,6}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_HEc(1)=SVSThermoOut{1,7}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_STc(1)=SVSThermoOut{1,8}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_SDc(1)=SVSThermoOut{1,9}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_UNc(1)=SVSThermoOut{1,10}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_BEc(1)=SVSThermoOut{1,11}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_TRc(1)=SVSThermoOut{1,12}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_COc(1)=SVSThermoOut{1,13}-SVSThermoOut{1,129};
    SVSThermoOut.H1_SVSThermo_SEc(1)=SVSThermoOut{1,14}-SVSThermoOut{1,129};
    
    SVSThermoOut.SVSThermo_Enhancementc(1)=SVSThermoOut{1,1}-SVSThermoOut{1,129};
    SVSThermoOut.SVSThermo_Opennessc(1)=SVSThermoOut{1,2}-SVSThermoOut{1,129};
    SVSThermoOut.SVSThermo_Transcendencec(1)=SVSThermoOut{1,3}-SVSThermoOut{1,129};
    SVSThermoOut.SVSThermo_Conservationc(1)=SVSThermoOut{1,4}-SVSThermoOut{1,129};
    
    if test==1
        %% Close and shut down
        Priority(0)
        close ALL
        ShowCursor
        Screen('CloseAll');
        ListenChar(0)
    end
    
catch
    %Close and shut down
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(1)
    PsychHID('KbQueueFlush',-1,3)
    for i=1:128
        if i==1
            SVSThermoOut=table(99);
            SVSThermoOut.Properties.VariableNames{i}=strcat('SVSThermo_',DimList_Out{i});
        elseif i<5
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermo_',DimList_Out{i});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<15
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermo_',ValList_Out{i-4});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<45
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermo_',ValueList1_Out{i-14});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<72
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermo_',ValueList2_Out{i-44});
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<102
            SVSOuttemp=table(99);
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermoSequence_',N);
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        elseif i<129
            SVSOuttemp=table(99);
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('SVSThermoSequence_',N);
            SVSThermoOut=[SVSThermoOut SVSOuttemp];
        end
    end
end