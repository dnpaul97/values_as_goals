function [SVSLikertOut, Window]=SVSLikertH2(Space,ok,Window,ScreenRect,white,black,test, Index1, Index2)
Screen('Preference', 'SkipSyncTests', 1);
test=1;
if test==1
    Space=KbName('Space');
    ok=0;
    MainScreen=max(Screen('Screens'));
    ScreenRect=get(groot,'ScreenSize');
    white=WhiteIndex(MainScreen);
    black=BlackIndex(MainScreen);
    [ValueIndex11,ValueIndex12,ValueIndex21,ValueIndex22]=ValueSelect;
    
    ValueIndex1=[ValueIndex11 ValueIndex12];
    ValueIndex2=[ValueIndex21 ValueIndex22];
    ItemCheck1=find(ValueIndex1==38);
    ItemCheck2=find(ValueIndex1==24);
    ItemCheck3=find(ValueIndex1==29);
    ItemCheck4=find(ValueIndex2==24);
    ItemCheck5=find(ValueIndex2==29);
    
    if isempty(ItemCheck1)==1
        ValueIndex12=[ValueIndex12 38];
    else
        ValueIndex22=[ValueIndex22 38];
    end
    
    if (isempty(ItemCheck2)==1 && isempty(ItemCheck3)==1)|| (isempty(ItemCheck4)==1 && isempty(ItemCheck5)==1)
        
        if isempty(ItemCheck2)==1 && isempty(ItemCheck3)
            RandCoin=round(rand());
            if RandCoin==1
                remove=find(ValueIndex21==29);
                ValueIndex21=[ValueIndex21(1:(remove-1)) ValueIndex21((remove+1):length(ValueIndex21))];
                ValueIndex11=[ValueIndex11 29];
            else
                remove=find(ValueIndex21==24);
                ValueIndex21=[ValueIndex21(1:(remove-1)) ValueIndex21((remove+1):length(ValueIndex21))];
                ValueIndex11=[ValueIndex11 24];
            end
        end
        if isempty(ItemCheck4)==1 && isempty(ItemCheck5)
            RandCoin=round(rand());
            if RandCoin==1
                remove=find(ValueIndex11==29);
                ValueIndex11=[ValueIndex11(1:(remove-1)) ValueIndex11((remove+1):length(ValueIndex11))];
                ValueIndex21=[ValueIndex21 29];
            else
                remove=find(ValueIndex11==24);
                ValueIndex11=[ValueIndex11(1:(remove-1)) ValueIndex11((remove+1):length(ValueIndex11))];
                ValueIndex21=[ValueIndex11 24];
            end
        end
    end
    Index1=ValueIndex11;
    Index2=ValueIndex12;
end

Size0=70;
Size2=40;
Size3=25;
SizeAdvance=20;
SizeList=20;
SizeLabs=15;

%Instructions SVS 1 - Page 1
text1_ToAdvance='Press [Space] to continue';
text1_YouAreGoing='Before we get to generating the ideas, in this part of the study, we are examining a proposed new set of ideals to include in measures of values.';
text1_YouAreGoing1='Below is a set of values that have been proposed as extensions to the measure you completed earlier.\nThese values are mostly different from those used in the prior measure and have been proposed as a better\nstatistical alternative by a different set of researchers.';
text1_YouAreGoing2='Like before, there are two lists of new values on the following pages. These values come from different cultures.';
text1_YouAreGoing3='We will subject responses to these to statistical analyses that enable us to determine whether they go beyond the values presented earlier.\nFor this reason, we presented the first measure early in this session, but these new values later (after memory has partly decayed).';

text1_YourTask='Your task is to rate how important each value is for you as a guiding principle in YOUR life:';
text1_YourTask1='Your will see the rating scale below:';
text1_Clickon='Click on the circle that represents how important the value is as a guiding principle in YOUR life.The further you place the mark to the right,\n the more important the value is.';
text1_Thecircle='The circle on the far left end is for rating any values opposed to the principles that guide you';
text1_Thecircle1='The circle on the far right end is for rating a value of supreme importance as a guiding principle in your life; ORDINARILY THERE ARE NO MORE\nTHAN TWO SUCH VALUES.';
text1_Whensatisfied='When you are satisfied with your rating, you can click:\n\nBe aware that once you clicked continue, you won´t be able to go back and change your rating ';
text1_Opposed='Opposed to\nmy values';
text1_Notimportant='Not important';
text1_Important='Important';
text1_VeryImportant='Very important';
text1_SupremeImportance='Of surpreme\nimportance';

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


unfilled=imread('Pics\unfilled.png');
filled=imread('Pics\filled.png');
Mouse=imread('Pics\mouse.png');
Continue=imread('Pics\continue.png');
ContinueFB=imread('Pics\continue_fb.png');
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

text1_instruction3='Before you begin, read the values in List I, choose the one that is most important to you keep it in mind.  Also, choose the value that is most\nopposed to your values.  If there is no such value, choose the value least important to you. Keeps these values in mind. When you are done\nwith the list you can press space to start rating the values in List I.';
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
text1_instruction4_1='You can change your position as many times as you like. Once you are satisfied with your choice,\nclick the BLUE CONTINUE BUTTON to rate the next value.';
text1_AsAGuidingP='AS A GUIDING PRINCIPLE IN MY LIFE, this value is:';


%Instructions List II
text1_instruction5='Now rate how important each of the following values is for you as a guiding principle in YOUR life. These values are phrased as ways of acting\nthat may be more or less important for you. Once again, try to distinguish as much as possible between the values.\n\nBefore you begin, read the values in List II, choose the one that is most important to you keep it in mind.  Also, choose the value that is most\nopposed to your values.  If there is no such value, choose the value least important to you. Keeps these values in mind. When you are done\nwith the list you can press space to start rating the values in List II';

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
        HideCursor
        ListenChar(2)
        Priority(0)
        Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    end
    
    Texfilled=Screen('MakeTexture', Window, filled);
    Texunfilled=Screen('MakeTexture', Window, unfilled);
    TexMouse=Screen('MakeTexture', Window, Mouse);
    TexContinue=Screen('MakeTexture', Window, Continue);
    TexContinueFB=Screen('MakeTexture', Window, ContinueFB);
    Checkboxes={Texunfilled Texfilled};
    SizeButton=ScreenRect(3).*.0253;
    SizeMouse=ScreenRect(3).*.019;
    SizeContinue=ScreenRect(3).*.035;
    
    %% First Instructions of the SVS
    Screen('TextSize', Window, 40);
    
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, 20);
    
    DrawFormattedText(Window, text1_YouAreGoing,'center',(ScreenRect(4)./100).*30, white,0,...
        0,0,3);
    Screen('TextSize', Window, 30);
    DrawFormattedText(Window, text1_YouAreGoing1,'center',(ScreenRect(4)./100).*40, white,0,...
        0,0,3);
    Screen('TextSize', Window, 20);
    DrawFormattedText(Window, text1_YouAreGoing2,'center',(ScreenRect(4)./100).*60 , white,0,...
        0,0,3);
    
    DrawFormattedText(Window, text1_YouAreGoing3,'center',(ScreenRect(4)./100).*70 , white,0,...
        0,0,3);
    
    Screen('TextSize', Window, 15);
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    
    while ~ ok
        
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
    Screen('TextSize', Window, 40);
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*10),...
        white);
    
    Screen('TextSize', Window, 20);
    DrawFormattedText(Window, text1_YourTask,'center',(ScreenRect(4)./100).*20, white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_YourTask1,'center',(ScreenRect(4)./100).*23, white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*54 , white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*57, white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*57, white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*31 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*57 , white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*54 , white,0,...
        0,0,1.5 );
    
    DrawFormattedText(Window, text1_Clickon ,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*45 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Thecircle ,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*73 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Thecircle1 ,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*76  , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Whensatisfied ,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*83  , white,0,...
        0,0,1.5 );
    for i=1:9
        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*34  , white,0,...
            0,0,1.5 );
        Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*35 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*35 )+SizeButton])
    end
    
    for i=1:9
        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*60  , white,0,...
            0,0,1.5 );
        if i==6
            Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*61 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*61 )+SizeButton])
        else
            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*61 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*61   )+SizeButton])
        end
        
    end
    
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*61.5  (ScreenRect(4)./100).*63 ((ScreenRect(3)./100).*61.5)+SizeMouse ((ScreenRect(4)./100).*63 )+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(46)  (ScreenRect(4)./100).*78.5 ((ScreenRect(3)./100).*46)+SizeContinue*3.57 ((ScreenRect(4)./100).*78.5)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*56  (ScreenRect(4)./100).*82 ((ScreenRect(3)./100).*56)+SizeMouse ((ScreenRect(4)./100).*82)+(SizeMouse.*1.49)])
    
    Screen('TextSize', Window, 15);
    DrawFormattedText(Window, text1_ToAdvance,'center',((ScreenRect(4)./100).*93  ),...
        white,[],[],[],3);
    
    Screen('Flip', Window);
    while ~ ok
        
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
    Screen('TextSize', Window, 40);
    DrawFormattedText(Window, 'Instruction - VALUE LIST I','center',(ScreenRect(4)./100.*15 ),...
        white);
    
    Screen('TextSize', Window, 20);
    
    DrawFormattedText(Window, text1_instruction3,ScreenRect(3).*.05,(ScreenRect(4)./100).*40, white,0,...
        0,0,2 );
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    while ~ ok
        
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
    
    %% Second page
    Screen('TextSize', Window, 40);
    
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, 20);
    
    DrawFormattedText(Window, text1_instruction4,'center',(ScreenRect(4)./100).*25, white,0,...
        0,0,3);
    DrawFormattedText(Window, text1_instruction4_1,(ScreenRect(3)./100).*05,(ScreenRect(4)./100).*74, white,0,...
        0,0,3);
    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*31 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    
    for i=1:9
        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*34   , white,0,...
            0,0,1.5 );
        if i==6
            Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*35 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*35 )+SizeButton])
        else
            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*35 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*35)+SizeButton])
        end
        
    end
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*61.5  (ScreenRect(4)./100).*37 ((ScreenRect(3)./100).*61.5)+SizeMouse ((ScreenRect(4)./100).*37)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(46)  (ScreenRect(4)./100).*78.5 ((ScreenRect(3)./100).*46)+SizeContinue*3.57 ((ScreenRect(4)./100).*78.5)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*56  (ScreenRect(4)./100).*82 ((ScreenRect(3)./100).*56)+SizeMouse ((ScreenRect(4)./100).*82)+(SizeMouse.*1.49)])
    
    Screen('TextSize', Window, 15);
    DrawFormattedText(Window, 'Press [Space] to begin','center',((ScreenRect(4)./100).*93  ),...
        white,[],[],[],3);
    Screen('Flip', Window);
    while ~ ok
        
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
    
    %% Value List I Likert scale rating
    Random1=Index1;
    Random1=Random1(randperm(length(Random1)));
    ShowCursor
    SVSLikertChoices=ones(1,57)*99;
    
    for SVS_1=1:length(Random1)
        Flag=0;
        Choice=99;
        while Flag==0
            Screen('TextSize', Window, 25);
            DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*10),...
                white,0,0,0,3);
            Screen('TextSize', Window, 80);
            DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*30),...
                white);
            Screen('TextSize', Window, 20);
            DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*35 ),...
                white);
            DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*48 , white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*51, white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*51, white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*51 , white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*48 , white,0,...
                0,0,1.5 );
            
            for i=1:9
                DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*54   , white,0,...
                    0,0,1.5 );
                if Choice==0
                    Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                else
                    if i==Choice
                        Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    else
                        Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    end
                end
            end
            Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
            
            Screen('Flip', Window);
            while ~ ok
                
                [~,~,Buttons]=GetMouse(Window);
                if Buttons(1)
                    ok=1;
                    
                else
                    ok=0;
                end
            end
            [PosX,PosY,Buttons]=GetMouse(Window);
            while any(Buttons)
                if PosX>(ScreenRect(3)./100).*(44) && PosX<((ScreenRect(3)./100).*44)+SizeContinue*3.57 && PosY>(ScreenRect(4)./100).*75 && PosY<((ScreenRect(4)./100).*75 )+SizeContinue
                    Screen('TextSize', Window, 25);
                    DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*10),...
                        white,0,0,0,3);
                    Screen('TextSize', Window, 80);
                    DrawFormattedText(Window, ValueList1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*30),...
                        white);
                    Screen('TextSize', Window, 20);
                    DrawFormattedText(Window, Subtext_List1{Random1(SVS_1)},'center',(ScreenRect(4)./100.*35 ),...
                        white);
                    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*48 , white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*51, white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*51, white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*51 , white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*48 , white,0,...
                        0,0,1.5 );
                    
                    for i=1:9
                        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*54   , white,0,...
                            0,0,1.5 );
                        if Choice==0
                            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                        else
                            if i==Choice
                                Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            else
                                Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            end
                        end
                    end
                    Screen('DrawTexture', Window, TexContinueFB,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
                    
                    Screen('Flip', Window);
                end
                [PosX,PosY,Buttons]=GetMouse(Window);
            end
            
            for i=1:9
                if PosX>(ScreenRect(3)./100).*((10.*i)-(.0253./2))&&PosX<((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton
                    if PosY>(ScreenRect(4)./100).*55&&PosY<((ScreenRect(4)./100).*55)+SizeButton
                        Choice=i;
                    end
                end
            end
            if PosX>(ScreenRect(3)./100).*(44) && PosX<((ScreenRect(3)./100).*44)+SizeContinue*3.57 && PosY>(ScreenRect(4)./100).*75 && PosY<((ScreenRect(4)./100).*75 )+SizeContinue
                if Choice==99
                    Flag=0;
                else
                    SVSLikertChoices(Random1(SVS_1))=(Choice-2);
                    Flag=1;
                end
            end
            ok=0;
        end
    end
    ok=0;
    
    %% Third Page - Third Part
    Screen('TextSize', Window, 40);
    DrawFormattedText(Window, 'Instruction - VALUE LIST II','center',(ScreenRect(4)./100.*15 ),...
        white);
    
    Screen('TextSize', Window, 20);
    
    DrawFormattedText(Window, text1_instruction5,ScreenRect(3).*.05,(ScreenRect(4)./100).*40, white,0,...
        0,0,2 );
    
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*85 ), white);
    
    Screen('Flip', Window);
    while ~ ok
        
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
    Screen('TextSize', Window, 40);
    
    DrawFormattedText(Window, 'Instruction','center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, 20);
    
    DrawFormattedText(Window, text1_instruction4,'center',(ScreenRect(4)./100).*25, white,0,...
        0,0,3);
    DrawFormattedText(Window, text1_instruction4_1,(ScreenRect(3)./100).*05,(ScreenRect(4)./100).*74, white,0,...
        0,0,3);
    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*31, white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*31 , white,0,...
        0,0,1.5 );
    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*28 , white,0,...
        0,0,1.5 );
    
    for i=1:9
        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*34   , white,0,...
            0,0,1.5 );
        if i==6
            Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*35 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*35 )+SizeButton])
        else
            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*35 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*35)+SizeButton])
        end
        
    end
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*61.5  (ScreenRect(4)./100).*37 ((ScreenRect(3)./100).*61.5)+SizeMouse ((ScreenRect(4)./100).*37)+(SizeMouse.*1.49)])
    Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(46)  (ScreenRect(4)./100).*78.5 ((ScreenRect(3)./100).*46)+SizeContinue*3.57 ((ScreenRect(4)./100).*78.5)+SizeContinue])
    Screen('DrawTexture', Window, TexMouse,[],[(ScreenRect(3)./100).*56  (ScreenRect(4)./100).*82 ((ScreenRect(3)./100).*56)+SizeMouse ((ScreenRect(4)./100).*82)+(SizeMouse.*1.49)])
    
    Screen('TextSize', Window, 15);
    DrawFormattedText(Window, 'Press [Space] to begin','center',((ScreenRect(4)./100).*93  ),...
        white,[],[],[],3);
    Screen('Flip', Window);
    while ~ ok
        
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
    %% Value List II Likert scale rating
    Random2=Index2;
    Random2=Random2(randperm(length(Random2)));
    ShowCursor
    
    for SVS_2=1:length(Random2)
        Flag=0;
        Choice=99;
        while Flag==0
            Screen('TextSize', Window, 25);
            DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*10),...
                white,0,0,0,3);
            Screen('TextSize', Window, 80);
            DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*30),...
                white);
            Screen('TextSize', Window, 20);
            DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*35 ),...
                white);
            DrawFormattedText(Window, text1_Opposed,(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*48 , white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3 )./100).*17 ,(ScreenRect(4)./100).*51, white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_Important,(ScreenRect(3 )./100).*48.5 ,(ScreenRect(4)./100).*51, white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3 )./100).*77 ,(ScreenRect(4)./100).*51 , white,0,...
                0,0,1.5 );
            DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3 )./100).*87 ,(ScreenRect(4)./100).*48 , white,0,...
                0,0,1.5 );
            
            for i=1:9
                DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*54   , white,0,...
                    0,0,1.5 );
                if Choice==0
                    Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                else
                    if i==Choice
                        Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    else
                        Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    end
                end
            end
            Screen('DrawTexture', Window, TexContinue,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
            
            Screen('Flip', Window);
            while ~ ok
                [~,~,Buttons]=GetMouse(Window);
                if Buttons(1)
                    ok=1;
                else
                    ok=0;
                end
            end
            [PosX,PosY,Buttons]=GetMouse(Window);
            while any(Buttons)
                if PosX>(ScreenRect(3)./100).*(44) && PosX<((ScreenRect(3)./100).*44)+SizeContinue*3.57 && PosY>(ScreenRect(4)./100).*75 && PosY<((ScreenRect(4)./100).*75 )+SizeContinue
                    Screen('TextSize', Window, 25);
                    DrawFormattedText(Window, text1_AsAGuidingP,'center',(ScreenRect(4)./100.*10),...
                        white,0,0,0,3);
                    Screen('TextSize', Window, 80);
                    DrawFormattedText(Window, ValueList2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*30),...
                        white);
                    Screen('TextSize', Window, 20);
                    DrawFormattedText(Window, Subtext_List2{Random2(SVS_2)-30},'center',(ScreenRect(4)./100.*35 ),...
                        white);
                    DrawFormattedText(Window, text1_Opposed,(ScreenRect(3)./100).*7 ,(ScreenRect(4)./100).*48 , white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_Notimportant,(ScreenRect(3)./100).*17 ,(ScreenRect(4)./100).*51, white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_Important,(ScreenRect(3)./100).*48.5 ,(ScreenRect(4)./100).*51, white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_VeryImportant ,(ScreenRect(3)./100).*77 ,(ScreenRect(4)./100).*51 , white,0,...
                        0,0,1.5 );
                    DrawFormattedText(Window, text1_SupremeImportance ,(ScreenRect(3)./100).*87 ,(ScreenRect(4)./100).*48 , white,0,...
                        0,0,1.5 );
                    
                    for i=1:9
                        DrawFormattedText(Window, Numbers{i} , (ScreenRect(3)./100).*((10.*i)+(.425)) ,(ScreenRect(4)./100).*54   , white,0,...
                            0,0,1.5 );
                        if Choice==0
                            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                        else
                            if i==Choice
                                Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            else
                                Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((10.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            end
                        end
                    end
                    Screen('DrawTexture', Window, TexContinueFB,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
                    
                    Screen('Flip', Window);
                end
                [PosX,PosY,Buttons]=GetMouse(Window);
            end
            
            for i=1:9
                if PosX>(ScreenRect(3)./100).*((10.*i)-(.0253./2))&&PosX<((ScreenRect(3)./100).*((10.*i)-(.0253./2)) )+SizeButton
                    if PosY>(ScreenRect(4)./100).*55&&PosY<((ScreenRect(4)./100).*55)+SizeButton
                        Choice=i;
                    end
                end
            end
            if PosX>(ScreenRect(3)./100).*(44) && PosX<((ScreenRect(3)./100).*44)+SizeContinue*3.57 && PosY>(ScreenRect(4)./100).*75 && PosY<((ScreenRect(4)./100).*75 )+SizeContinue
                if Choice==99
                    Flag=0;
                else
                    SVSLikertChoices(Random2(SVS_2))=(Choice-2);
                    Flag=1;
                end
            end
            ok=0;
        end
    end
    
    
    %% Output
    for i=1:128
        if i==1
            SVSLikertOut=table(99);
            SVSLikertOut.Properties.VariableNames{i}=strcat('H2_SVSLikert_',DimList_Out{i});
        elseif i<5
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikert_',DimList_Out{i});
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        elseif i<15
            SVSOuttemp=table(99);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikert_',ValList_Out{i-4});
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        elseif i<45
            SVSOuttemp=table(SVSLikertChoices(i-14));
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikert_',ValueList1_Out{i-14});
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        elseif i<72
            SVSOuttemp=table(SVSLikertChoices(i-14));
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikert_',ValueList2_Out{i-44});
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        elseif i<(72+length(Random1))
            SVSOuttemp=table(Random1(i-71));
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikertSequence_',N);
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        elseif i<(72+length(Random1)+length(Random2))
            SVSOuttemp=table(Random2(i-(71+length(Random1))));
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikertSequence_',N);
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        else
            SVSOuttemp=table(99);
            N=num2str(i-71);
            SVSOuttemp.Properties.VariableNames{1}=strcat('H2_SVSLikertSequence_',N);
            SVSLikertOut=[SVSLikertOut SVSOuttemp];
        end
    end
    
    %Power
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,17} < -2 || SVSLikertOut{1,17} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,17}>=0
        Temp(1)=SVSLikertOut{1,17};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,26} < -2 || SVSLikertOut{1,26} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,26}>=0
        Temp(2)=SVSLikertOut{1,26};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,37} < -2 || SVSLikertOut{1,37} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,37}>=0
        Temp(3)=SVSLikertOut{1,37};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,41} < -2 || SVSLikertOut{1,41} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,41}>=0
        Temp(4)=SVSLikertOut{1,41};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,60} < -2 || SVSLikertOut{1,60} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,60}>=0
        Temp(5)=SVSLikertOut{1,60};
        else
        Temp(5)=0;
        end
    end
    if 5-DivCount > 0
        SVSLikertOut.H2_SVSLikert_PO(1)=sum(Temp)./(5-DivCount);
    end
    
    %Achievement
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,48} < -2 || SVSLikertOut{1,48} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,48}>=0
        Temp(1)=SVSLikertOut{1,48};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,53} < -2 || SVSLikertOut{1,53} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,53}>=0
        Temp(2)=SVSLikertOut{1,53};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,57} < -2 || SVSLikertOut{1,57} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,57}>=0
        Temp(3)=SVSLikertOut{1,57};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,62} < -2 || SVSLikertOut{1,62} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,62}>=0
        Temp(4)=SVSLikertOut{1,62};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,69} < -2 || SVSLikertOut{1,69} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,69}>=0
        Temp(5)=SVSLikertOut{1,69};
        else
        Temp(5)=0;
        end
    end
    if 5-DivCount > 0
        SVSLikertOut.H2_SVSLikert_AC(1)=sum(Temp)./(5-DivCount);
    end
    
    %Hedonism
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,18} < -2 || SVSLikertOut{1,18} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,18}>=0
        Temp(1)=SVSLikertOut{1,18};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,64} < -2 || SVSLikertOut{1,64} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,64}>=0
        Temp(2)=SVSLikertOut{1,64};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,71} < -2 || SVSLikertOut{1,71} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,71}>=0
        Temp(3)=SVSLikertOut{1,71};
        else
        Temp(3)=0;
        end
    end
    if 3-DivCount > 0
        SVSLikertOut.H2_SVSLikert_HE(1)=(sum(Temp)./(3-DivCount));
    end
    
    %Stimulation
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,23} < -2 || SVSLikertOut{1,23} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,23}>=0
        Temp(1)=SVSLikertOut{1,23};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,39} < -2 || SVSLikertOut{1,39} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,39}>=0
        Temp(2)=SVSLikertOut{1,39};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,51} < -2 || SVSLikertOut{1,51} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,51}>=0
        Temp(3)=SVSLikertOut{1,51};
        else
        Temp(3)=0;
        end
    end
    if 3-DivCount > 0
        SVSLikertOut.H2_SVSLikert_ST(1)=(sum(Temp)./(3-DivCount));
    end
    
    %SelfDirection
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,19} < -2 || SVSLikertOut{1,19} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,19}>=0
        Temp(1)=SVSLikertOut{1,19};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,28} < -2 || SVSLikertOut{1,28} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,28}>=0
        Temp(2)=SVSLikertOut{1,28};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,30} < -2 || SVSLikertOut{1,30} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,30}>=0
        Temp(3)=SVSLikertOut{1,30};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,35} < -2 || SVSLikertOut{1,35} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,35}>=0
        Temp(4)=SVSLikertOut{1,35};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,45} < -2 || SVSLikertOut{1,45} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,45}>=0
        Temp(5)=SVSLikertOut{1,45};
        else
        Temp(5)=0;
        end
    end
    if SVSLikertOut{1,55} < -2 || SVSLikertOut{1,55} > 10
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        if SVSLikertOut{1,55}>=0
        Temp(6)=SVSLikertOut{1,55};
        else
        Temp(6)=0;
        end
    end
    if SVSLikertOut{1,67} < -2 || SVSLikertOut{1,67} > 10
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        if SVSLikertOut{1,67}>=0
        Temp(7)=SVSLikertOut{1,67};
        else
        Temp(7)=0;
        end
    end
    if 7-DivCount > 0
        SVSLikertOut.H2_SVSLikert_SD(1)=sum(Temp)./(7-DivCount);
    end
    
    %Universalism
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,15} < -2 || SVSLikertOut{1,15} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,15}>=0
        Temp(1)=SVSLikertOut{1,15};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,16} < -2 || SVSLikertOut{1,16} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,16}>=0
        Temp(2)=SVSLikertOut{1,16};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,31} < -2 || SVSLikertOut{1,31} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,31}>=0
        Temp(3)=SVSLikertOut{1,31};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,38} < -2 || SVSLikertOut{1,38} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,38}>=0
        Temp(4)=SVSLikertOut{1,38};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,40} < -2 || SVSLikertOut{1,40} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,40}>=0
        Temp(5)=SVSLikertOut{1,40};
        else
        Temp(5)=0;
        end
    end
    if SVSLikertOut{1,43} < -2 || SVSLikertOut{1,43} > 10
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        if SVSLikertOut{1,43}>=0
        Temp(6)=SVSLikertOut{1,43};
        else
        Temp(6)=0;
        end
    end
    if SVSLikertOut{1,44} < -2 || SVSLikertOut{1,44} > 10
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        if SVSLikertOut{1,44}>=0
        Temp(7)=SVSLikertOut{1,44};
        else
        Temp(7)=0;
        end
    end
    if SVSLikertOut{1,49} < -2 || SVSLikertOut{1,49} > 10
        DivCount=DivCount+1;
        Temp(8)=0;
    else
        if SVSLikertOut{1,49}>=0
        Temp(8)=SVSLikertOut{1,49};
        else
        Temp(8)=0;
        end
    end
    if SVSLikertOut{1,52} < -2 || SVSLikertOut{1,52} > 10
        DivCount=DivCount+1;
        Temp(9)=0;
    else
        if SVSLikertOut{1,52}>=0
        Temp(9)=SVSLikertOut{1,52};
        else
        Temp(9)=0;
        end
    end
    if 9-DivCount > 0
        SVSLikertOut.H2_SVSLikert_UN(1)=(sum(Temp)./(9-DivCount));
    end
    
    %Benevolence
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,20} < -2 || SVSLikertOut{1,20} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,20}>=0
        Temp(1)=SVSLikertOut{1,20};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,24} < -2 || SVSLikertOut{1,24} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,24}>=0
        Temp(2)=SVSLikertOut{1,24};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,33} < -2 || SVSLikertOut{1,33} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,33}>=0
        Temp(3)=SVSLikertOut{1,33};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,42} < -2 || SVSLikertOut{1,42} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,42}>=0
        Temp(4)=SVSLikertOut{1,42};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,47} < -2 || SVSLikertOut{1,47} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,47}>=0
        Temp(5)=SVSLikertOut{1,47};
        else
        Temp(5)=0;
        end
    end
    if SVSLikertOut{1,59} < -2 || SVSLikertOut{1,59} > 10
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        if SVSLikertOut{1,59}>=0
        Temp(6)=SVSLikertOut{1,59};
        else
        Temp(6)=0;
        end
    end
    if SVSLikertOut{1,63} < -2 || SVSLikertOut{1,63} > 10
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        if SVSLikertOut{1,63}>=0
        Temp(7)=SVSLikertOut{1,63};
        else
        Temp(7)=0;
        end
    end
    if SVSLikertOut{1,66} < -2 || SVSLikertOut{1,66} > 10
        DivCount=DivCount+1;
        Temp(8)=0;
    else
        if SVSLikertOut{1,66}>=0
        Temp(8)=SVSLikertOut{1,66};
        else
        Temp(8)=0;
        end
    end
    if SVSLikertOut{1,68} < -2 || SVSLikertOut{1,68} > 10
        DivCount=DivCount+1;
        Temp(9)=0;
    else
        if SVSLikertOut{1,68}>=0
        Temp(9)=SVSLikertOut{1,68};
        else
        Temp(9)=0;
        end
    end
    if 9-DivCount > 0
        SVSLikertOut.H2_SVSLikert_BE(1)=(sum(Temp)./(9-DivCount));
    end
    
    %Tradition
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,32} < -2 || SVSLikertOut{1,32} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,32}>=0
        Temp(1)=SVSLikertOut{1,32};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,46} < -2 || SVSLikertOut{1,46} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,46}>=0
        Temp(2)=SVSLikertOut{1,46};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,50} < -2 || SVSLikertOut{1,50} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,50}>=0
        Temp(3)=SVSLikertOut{1,50};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,58} < -2 || SVSLikertOut{1,58} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,58}>=0
        Temp(4)=SVSLikertOut{1,58};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,65} < -2 || SVSLikertOut{1,65} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,65}>=0
        Temp(5)=SVSLikertOut{1,65};
        else
        Temp(5)=0;
        end
    end
    if 5-DivCount > 0
        SVSLikertOut.H2_SVSLikert_TR(1)=(sum(Temp)./(5-DivCount));
    end
    
    %Conformity
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,25} < -2 || SVSLikertOut{1,25} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,25}>=0
        Temp(1)=SVSLikertOut{1,25};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,34} < -2 || SVSLikertOut{1,34} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,34}>=0
        Temp(2)=SVSLikertOut{1,34};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,54} < -2 || SVSLikertOut{1,54} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,54}>=0
        Temp(3)=SVSLikertOut{1,54};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,61} < -2 || SVSLikertOut{1,61} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,61}>=0
        Temp(4)=SVSLikertOut{1,61};
        else
        Temp(4)=0;
        end
    end
    if 4-DivCount > 0
        SVSLikertOut.H2_SVSLikert_CO(1)=(sum(Temp)./(4-DivCount));
    end
    
    %Security
    DivCount=0;
    Temp=0;
    if SVSLikertOut{1,21} < -2 || SVSLikertOut{1,21} > 10
        DivCount=DivCount+1;
        Temp(1)=0;
    else
        if SVSLikertOut{1,21}>=0
        Temp(1)=SVSLikertOut{1,21};
        else
        Temp(1)=0;
        end
    end
    if SVSLikertOut{1,22} < -2 || SVSLikertOut{1,22} > 10
        DivCount=DivCount+1;
        Temp(2)=0;
    else
        if SVSLikertOut{1,22}>=0
        Temp(2)=SVSLikertOut{1,22};
        else
        Temp(2)=0;
        end
    end
    if SVSLikertOut{1,27} < -2 || SVSLikertOut{1,27} > 10
        DivCount=DivCount+1;
        Temp(3)=0;
    else
        if SVSLikertOut{1,27}>=0
        Temp(3)=SVSLikertOut{1,27};
        else
        Temp(3)=0;
        end
    end
    if SVSLikertOut{1,29} < -2 || SVSLikertOut{1,29} > 10
        DivCount=DivCount+1;
        Temp(4)=0;
    else
        if SVSLikertOut{1,29}>=0
        Temp(4)=SVSLikertOut{1,29};
        else
        Temp(4)=0;
        end
    end
    if SVSLikertOut{1,36} < -2 || SVSLikertOut{1,36} > 10
        DivCount=DivCount+1;
        Temp(5)=0;
    else
        if SVSLikertOut{1,36}>=0
        Temp(5)=SVSLikertOut{1,36};
        else
        Temp(5)=0;
        end
    end
    if SVSLikertOut{1,56} < -2 || SVSLikertOut{1,56} > 10
        DivCount=DivCount+1;
        Temp(6)=0;
    else
        if SVSLikertOut{1,56}>=0
        Temp(6)=SVSLikertOut{1,56};
        else
        Temp(6)=0;
        end
    end
    if SVSLikertOut{1,70} < -2 || SVSLikertOut{1,70} > 10
        DivCount=DivCount+1;
        Temp(7)=0;
    else
        if SVSLikertOut{1,70}>=0
        Temp(7)=SVSLikertOut{1,70};
        else
        Temp(7)=0;
        end
    end
    if 7-DivCount > 0
        SVSLikertOut.H2_SVSLikert_SE(1)=(sum(Temp)./(7-DivCount));
    end
    
    %Dimensions
    SVSLikertOut.H2_SVSLikert_Enhancement(1)=(SVSLikertOut.H2_SVSLikert_PO(1)+SVSLikertOut.H2_SVSLikert_AC(1))./2;
    SVSLikertOut.H2_SVSLikert_Openness(1)=(SVSLikertOut.H2_SVSLikert_HE(1)+SVSLikertOut.H2_SVSLikert_ST(1)+SVSLikertOut.H2_SVSLikert_SD(1))./3;
    SVSLikertOut.H2_SVSLikert_Transcendence(1)=(SVSLikertOut.H2_SVSLikert_UN(1)+SVSLikertOut.H2_SVSLikert_BE(1))./2;
    SVSLikertOut.H2_SVSLikert_Conservation(1)=(SVSLikertOut.H2_SVSLikert_CO(1)+SVSLikertOut.H2_SVSLikert_TR(1)+SVSLikertOut.H2_SVSLikert_SE(1))./3;
    
    %MRAT
    DivCount=0;
    Temp=zeros(1,57);
    for i=1:57
        if SVSLikertOut{1,(i+14)} > 1 || SVSLikertOut{1,(i+14)} < 0
            DivCount=DivCount+1;
            Temp(i)=0;
        else
            Temp(i)=SVSLikertOut{1,(i+14)};
        end
    end
    if 57-DivCount > 0
        SVSLikertOut.H2_MRAT=sum(Temp)./(57-DivCount);
    end
    
    SVSLikertOut.H2_SVSLikert_POc(1)=SVSLikertOut{1,5}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_ACc(1)=SVSLikertOut{1,6}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_HEc(1)=SVSLikertOut{1,7}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_STc(1)=SVSLikertOut{1,8}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_SDc(1)=SVSLikertOut{1,9}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_UNc(1)=SVSLikertOut{1,10}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_BEc(1)=SVSLikertOut{1,11}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_TRc(1)=SVSLikertOut{1,12}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_COc(1)=SVSLikertOut{1,13}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_SEc(1)=SVSLikertOut{1,14}-SVSLikertOut{1,129};
    
    SVSLikertOut.H2_SVSLikert_Enhancementc(1)=SVSLikertOut{1,1}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_Opennessc(1)=SVSLikertOut{1,2}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_Transcendencec(1)=SVSLikertOut{1,3}-SVSLikertOut{1,129};
    SVSLikertOut.H2_SVSLikert_Conservationc(1)=SVSLikertOut{1,4}-SVSLikertOut{1,129};
    
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
    SVSLikertOut=table('Size',[1 57], 'VariableTypes',{'double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double','double'});
    
end