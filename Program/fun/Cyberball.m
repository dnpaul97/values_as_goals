function [CyberballOut, Window]=Cyberball(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,test,HighVal,ValCon,IncCon,NumbTrial)
Screen('Preference', 'SkipSyncTests', 1);

if test==1
    [Index1,Index2,ValueIndex21,ValueIndex22]=ValueSelect;
    Space=KbName('Space');
    ok=0;
    MainScreen=max(Screen('Screens'));
    ScreenRect=get(groot,'ScreenSize');
    white=WhiteIndex(MainScreen);
    black=BlackIndex(MainScreen);
    HighVal=[0.6284, 0.9473, 0.7482, 0.7449, 0.9013, 0.9923, 0.4863, 0.0782, 0.1311, 0.3368];
    ValCon=0;
    IncCon=0;
    NumbTrial=24;
end
rng 'shuffle'
try
    %% Text
    %Introduction Page 1
    ThankYou='Thank You';
    Text1='For completing the first Questionnaire! Well done!\n\nWe used this questionnaire to get a sense of what you deem important in life';
    BasedOnText='Based on your responses in this previous section, we think that one of the things, most important to you is:';
    ValNames={'POWER', 'ACHIEVEMENT', 'HEDONISM', 'STIMULATION',...
        'SELF-DIRECTION', 'UNIVERSALISM', 'BENEVOLENCE', 'TRADITION',...
        'CONFORMITY', 'SECURITY'};
    LowValNames={'Power', 'Achievement', 'Hedonism', 'Stimulation',...
        'Self-Direction', 'Universalism', 'Benevolence', 'Tradition',...
        'Conformity', 'Security'};
    ValueDesc={'Control over people, material and social resources',...
        'Success according to social standards','Pleasure and sensuous gratification',...
        'Excitement, novelty and change', 'Freedom to cultivate ideas, abilities and to determine your own action'...
        'Understanding, appreciating, tolerating and protecting the welfare\nof all people and the natural environment',...
        'Preserving and enhancing the welfare of people with whom you are\nin frequent personal contact',...
        'Maintaining and preserving cultural, family or religious traditions',...
        'Avoiding to harm or upset other people. Complying with rules laws and formal obligations'...
        'Safety and stability in your own immediate environment, your family or wider society'};
    OpValueDesc={'Control over people, material and social resources',...
        'Success according to social standards','Pleasure and sensuous gratification',...
        'Excitement, novelty and change', 'Freedom to cultivate ideas, abilities and to determine their own action'...
        'Understanding, appreciating, tolerating and protecting the welfare\nof all people and the natural environment',...
        'Preserving and enhancing the welfare of people with whom they are\nin frequent personal contact',...
        'Maintaining and preserving cultural, family or religious traditions',...
        'Avoiding to harm or upset other people. Complying with rules laws and formal obligations'...
        'Safety and stability in their own immediate environment, their family or wider society'};
    No=KbName('n');
    Yes=KbName('y');
    HighValAlt=HighVal;
    HighVal1=find(HighValAlt==max(HighValAlt));
    if ValCon==1
        OpVal=HighVal1;
    else
        for i=1:5
            HighValAlt(HighVal1)=0;
            HighVal1=find(HighValAlt==max(HighValAlt));
        end
        Random=randi(10);
        while HighValAlt(Random)==0
            Random=randi(10);
        end
        OpVal=Random;
        HighValAlt=HighVal;
    end
    HighVal1=find(HighValAlt==max(HighValAlt));
    
    Correct='Is this correct?';
    Press='Press "Y" to answer YES and "N" to answer NO';
    text1_ToAdvance='Press [Space] to continue';
    Text2='Let´s see if we can get it right this time.';
    
    %Intro Page 2
    Header2='All right!';
    Text3='Next you are going to playing a BALL TOSSING GAME with other participants over the internet.\n Here we want to study the effect of mentally visualising others on task performance. To help you visualise the other players,\nyou will learn about their values and they will learn about yours.\nAre you ok with anonymously sharing the important value you told us with two other players?';
    Reminder='As a reminder, you told us that';
    Important='is very important to you';
    Press2='Press "Y" to answer YES and "N" to answer NO. Press "B" if you would like to be share a different value.';
    
    %Cyberball Introduction
    Wifi(:,:,:,1)=imread('Pics\WIFI0.png');
    Wifi(:,:,:,2)=imread('Pics\WIFI1.png');
    Wifi(:,:,:,3)=imread('Pics\WIFI2.png');
    Wifi(:,:,:,4)=imread('Pics\WIFI3.png');
    Connection='Establishing Connection';
    CBIntro='Next up, you will play a BALL TOSSING GAME with two other players\nover the internet.\n\nWhile doing so, we would like to ask you to form a MENTAL IMAGE of your opponents.\n\nTry to imagine:\nWhat they look like\nWhat sort of people they are\nWhere you are playing, etc.\n\nTo help you with that, you will shortly recieve information about the other players.\nThey will receive the same information about you.';
    
    %Introducing Player 1 & Player 2
    Header3='This is Player 1';
    Header4='This is Player 2';
    ImportantValue='Important Value:';
    IsVeryImportant='is the most important guiding principle in their life';
    Avatar(:,:,:,1)=imread('Pics\AV_1.jpeg');
    Avatar(:,:,:,2)=imread('Pics\AV_2.jpeg');
    LearnPlayer1='To learn about Player 2, press [Space]';
    LearnPlayer2='To start the Ball Tossing Game, press [Space]';
    RandomPic=round(rand);
    Player1_Pic=RandomPic+1;
    if Player1_Pic==1
        Player2_Pic=2;
    else
        Player2_Pic=1;
    end
    
    %Open "Chrome"
    Chromeback=imread('Pics\ChromeBack.jpg');
    LoadingDot(:,:,:,1)=imread('Pics\Load1.png');
    LoadingDot(:,:,:,2)=imread('Pics\Load2.png');
    LoadingDot(:,:,:,3)=imread('Pics\Load3.png');
    LoadingDot(:,:,:,4)=imread('Pics\Load4.png');
    LoadingDot(:,:,:,5)=imread('Pics\Load5.png');
    LoadingDot(:,:,:,6)=imread('Pics\Load6.png');
    LoadingDot(:,:,:,7)=imread('Pics\Load7.png');
    LoadingDot(:,:,:,8)=imread('Pics\Load8.png');
    
    %Cyberball Instructions
    Instr(:,:,:,1)=imread('Pics\Cyberball_pre.png');
    Instr(:,:,:,2)=imread('Pics\Cyberball.png');
    
    %Cyberball
    Ball=imread('Pics\Ball.jpg');
    PlayerPic=imread('Pics\AV_3.jpeg');
    
    %Post Questionnaire instructions
    CompletingGame='For playing the ball tossing game\n You have been successfully disconnected.';
    PQ_Inst='Now, we would like to ask you some general questions about your experience while playing the game and some opinion related questions as well.\nFor every question, simply select the option that is most appropriate for the answer you would like to give by clicking on it.\nWhen you are satisfied with your answer, click the continue button to move on to the next question.';
    unfilled=imread('Pics\unfilled.png');
    filled=imread('Pics\filled.png');
    Continue=imread('Pics\continue.png');
    ContinueFB=imread('Pics\continue_fb.png');
    SizeButton=ScreenRect(3).*.0253;
    SizeContinue=ScreenRect(3).*.035;
    
    Lab1={'Power','Strongly Disagree'};
    Lab2={'Achievement'};
    Lab3={'Hedonism','Disagree'};
    Lab4={'Stimulation'};
    Lab5={'Self-Direction','Slightly Disagree',};
    Lab6={'Universalism','Slightly Agree'};
    Lab7={'Benevolence'};
    Lab8={'Tradition','Agree'};
    Lab9={'Conformity'};
    Lab10={'Security','Strongly Agree',};
    QuestionList1={'What was most important to Player 1?',...
        'What was most important to Player 2?',...
        'I found it difficult to picture the other players',...
        'I found it difficult to picture Player 1',...
        'I found it difficult to picture Player 2', ...
        'In regards to various characteristics,\nI pictured Player 1 to look similar to me',...
        'In regards to various characteristics,\nI pictured Player 2 to look similar to me',...
        'Player 1 liked me', 'Player 2 liked me', 'I liked Player 1', ...
        'I liked Player 2','I felt included by the other players',...
        'I would like to hurt the other players', 'I would like to swear at the other players'...
        'I would like to continue playing with the other players','I would like to insult the other players',...
        'I would like to make fun of the other players','I would like to meet the other players',...
        'I would like to take revenge against the other players'...
        'To lead the best, meaningful life,\none most belong to one, true religion',...
        'All of the religions in the world\nhave flaws and wrong teachings',...
        'There is a religion on this earth that teaches,\nwithout error, God´s truth',...
        'God will punish most severely those\nwho abandon his true religion',...
        'God has given mankind a complete,\nunfailing guide to happiness and salvation,\nwhich must be totally followed',...
        };
    QuestionLab1={'Player1_MostImp',...
        'Player2_MostImp',...
        'Mentalpicture_other_players',...
        'Mentalpicture_Player1',...
        'Mentalpicture_Player2', ...
        'Player1_similar',...
        'Player2_similar',...
        'Player1_liked_me', 'Player2_liked_me', 'I_liked_Player1', ...
        'I_liked_Player2','Incl_I_felt_included',...
        'Incl_hurt', 'Incl_swear'...
        'Incl_continue_playing','Incl_insult',...
        'Incl_make_fun','Incl_meet',...
        'Incl_revenge'...
        'Fund_one_true_religion',...
        'Fund_flaws',...
        'Fund_without_error',...
        'Fund_God_will_punish',...
        'Fund_guide_to_happiness',...
        };
    %% Start Programme
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
    Texfilled=Screen('MakeTexture', Window, filled);
    Texunfilled=Screen('MakeTexture', Window, unfilled);
    TexContinue=Screen('MakeTexture', Window, Continue);
    TexContinueFB=Screen('MakeTexture', Window, ContinueFB);
    Checkboxes={Texunfilled Texfilled};
    %% First Page of the Instruction
    
    Screen('TextSize', Window, Size2);
    
    DrawFormattedText(Window, ThankYou,'center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, Text1,'center',(ScreenRect(4)./100).*20, white,0,...
        0,0,3);
    DrawFormattedText(Window, BasedOnText,'center',(ScreenRect(4)./100).*40, white,0,...
        0,0,3);
    
    Screen('TextSize', Window, Size0+5);
    DrawFormattedText(Window, ValNames{HighVal1},'center',(ScreenRect(4)./100).*55, white,0,...
        0,0,3);
    Screen('TextSize', Window, Size2+5);
    DrawFormattedText(Window, ValueDesc{HighVal1},'center',(ScreenRect(4)./100).*60, white,0,...
        0,0,1);
    
    DrawFormattedText(Window, Correct,'center',(ScreenRect(4)./100).*80, white,0,...
        0,0,3);
    
    Screen('TextSize', Window, Size2);
    
    DrawFormattedText(Window, Press,'center',...
        ((ScreenRect(4)./100 ).*91 ), white);
    
    Screen('Flip', Window);
    
    
    while ~ ok
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Yes
            Flag=1;
            PermaFlag=0;
            ok=1;
        elseif ok==No
            Flag=2;
            PermaFlag=1;
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
    
    while Flag==2
        HighValAlt(HighVal1)=0;
        HighVal1=find(HighValAlt==max(HighValAlt));
        
        Screen('TextSize', Window, Size2);
        
        DrawFormattedText(Window, 'Apologies','center',(ScreenRect(4)./100.*15),...
            white);
        
        Screen('TextSize', Window, Size3);
        DrawFormattedText(Window, Text2,'center',(ScreenRect(4)./100).*20, white,0,...
            0,0,3);
        DrawFormattedText(Window, BasedOnText,'center',(ScreenRect(4)./100).*40, white,0,...
            0,0,3);
        
        Screen('TextSize', Window, Size0+5);
        DrawFormattedText(Window, ValNames{HighVal1},'center',(ScreenRect(4)./100).*55, white,0,...
            0,0,3);
        Screen('TextSize', Window, Size2+5);
        DrawFormattedText(Window, ValueDesc{HighVal1},'center',(ScreenRect(4)./100).*60, white,0,...
            0,0,1);
        
        DrawFormattedText(Window, Correct,'center',(ScreenRect(4)./100).*80, white,0,...
            0,0,3);
        
        Screen('TextSize', Window, Size2);
        
        DrawFormattedText(Window, Press,'center',...
            ((ScreenRect(4)./100 ).*91 ), white);
        
        Screen('Flip', Window);
        
        
        while ~ ok
            GetMouse(Window);
            [~, ~, keyCode] = KbCheck(-1);
            ok=find(keyCode==1);
            if isempty(ok)
                ok=0;
            elseif ok==Yes
                Flag=1;
                ok=1;
            elseif ok==No
                Flag=2;
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
    end
    
    %% Second Page of Introductions
    SuperFlag=0;
    while ~SuperFlag
        Screen('TextSize', Window, Size2);
        
        DrawFormattedText(Window, Header2,'center',(ScreenRect(4)./100).*10,...
            white);
        
        Screen('TextSize', Window, Size3);
        DrawFormattedText(Window, Text3,'center',(ScreenRect(4)./100).*20, white,0,...
            0,0,2);
        DrawFormattedText(Window, Reminder,'center',(ScreenRect(4)./100).*45, white,0,...
            0,0,3);
        
        Screen('TextSize', Window, Size0+5);
        DrawFormattedText(Window, ValNames{HighVal1},'center',(ScreenRect(4)./100).*55, white,0,...
            0,0,3);
        Screen('TextSize', Window, Size2+5);
        DrawFormattedText(Window, ValueDesc{HighVal1},'center',(ScreenRect(4)./100).*60, white,0,...
            0,0,1);
        Screen('TextSize', Window, Size3);
        DrawFormattedText(Window, Important,'center',(ScreenRect(4)./100).*80, white,0,...
            0,0,3);
        
        Screen('TextSize', Window, Size2);
        
        DrawFormattedText(Window, Press,'center',...
            ((ScreenRect(4)./100 ).*91 ), white);
        
        Screen('Flip', Window);
        
        
        while ~ ok
            GetMouse(Window);
            [~, ~, keyCode] = KbCheck(-1);
            ok=find(keyCode==1);
            if isempty(ok)
                ok=0;
            elseif ok==Yes
                Flag=1;
                SuperFlag=1;
                ok=1;
            elseif ok==No
                Flag=2;
                PermaFlag=1;
                SuperFlag=0;
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
        
        while Flag==2
            HighValAlt(HighVal1)=0;
            HighVal1=find(HighValAlt==max(HighValAlt));
            
            Screen('TextSize', Window, Size2);
            
            DrawFormattedText(Window, 'Apologies','center',(ScreenRect(4)./100.*15),...
                white);
            
            Screen('TextSize', Window, Size3);
            DrawFormattedText(Window, Text2,'center',(ScreenRect(4)./100).*20, white,0,...
                0,0,3);
            DrawFormattedText(Window, BasedOnText,'center',(ScreenRect(4)./100).*40, white,0,...
                0,0,3);
            
            Screen('TextSize', Window, Size0+5);
            DrawFormattedText(Window, ValNames{HighVal1},'center',(ScreenRect(4)./100).*55, white,0,...
                0,0,3);
            Screen('TextSize', Window, Size2+5);
            DrawFormattedText(Window, ValueDesc{HighVal1},'center',(ScreenRect(4)./100).*60, white,0,...
                0,0,1);
            
            DrawFormattedText(Window, Correct,'center',(ScreenRect(4)./100).*80, white,0,...
                0,0,3);
            
            Screen('TextSize', Window, Size2);
            
            DrawFormattedText(Window, Press,'center',...
                ((ScreenRect(4)./100 ).*91 ), white);
            
            Screen('Flip', Window);
            
            
            while ~ ok
                GetMouse(Window);
                [~, ~, keyCode] = KbCheck(-1);
                ok=find(keyCode==1);
                if isempty(ok)
                    ok=0;
                elseif ok==Yes
                    Flag=1;
                    ok=1;
                elseif ok==No
                    Flag=2;
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
        end
    end
    %% Waiting for Connection
    T1=GetSecs;
    T2=GetSecs;
    T3=GetSecs;
    PosRect=[832.5 412.5 1087 667];
    CoverRect=[550 412.5 1387 667];
    TextPos=[565 PosRect(4)-90];
    Speed=5;
    Run1=0;
    Run2=3;
    Run3=3;
    Run4=3;
    Blub=1;
    Time1=10;
    Time2=3;
    Time3=2;
    GridLine=[ScreenRect(3)./5 ScreenRect(4)./3 (ScreenRect(3)./5).*4 (ScreenRect(4)./3)+2];
    VertLine1=[(ScreenRect(3)./5)+200 (ScreenRect(4)./3)-20 (ScreenRect(3)./5)+202 (ScreenRect(4)./3).*2];
    VertLine2=[(ScreenRect(3)./5)+600 (ScreenRect(4)./3)-20 (ScreenRect(3)./5)+602 (ScreenRect(4)./3).*2];
    Dots1=0;
    Dots2=0;
    Dots3=0;
    TextPos1=GridLine(1)+30;
    TextPos2=GridLine(1)+250;
    
    %First Loop
    while (T2-T1)<Time1
        T2=GetSecs;
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window, Connection,565,PosRect(4)-90, white,0,...
            0,0,3);
        Screen('FillRect', Window, black, CoverRect)
        
        if (T2-T1)>5 && PosRect(1)>300
            PosRect=[PosRect(1)-Speed PosRect(2) PosRect(3)-Speed PosRect(4)];
            CoverRect=[CoverRect(1)-(Speed+3) CoverRect(2) CoverRect(3)-(Speed+3) CoverRect(4)];
        end
        
        if (T2-T1)<.5
            Run1=1;
        else
            Run1=Run1;
        end
        
        if (T2-T1)>.5 && Blub == 1
            T3=GetSecs;
            Run1=mod(Run1,4)+1;
            Blub =0;
        end
        if (T2-T3)>.5
            T3=GetSecs;
            Run1=mod(Run1,4)+1;
        end
        
        Screen('PutImage', Window, Wifi(:,:,:,Run1),PosRect);
        
        Screen('Flip', Window);
    end
    
    
    %Second Loop
    T1=GetSecs;
    Blub=90;
    while (T2-T1)<(Time1+5)
        T2=GetSecs;
        
        if PosRect(2)> 20
            PosRect=[PosRect(1) PosRect(2)-Speed PosRect(3) PosRect(4)-Speed];
            TextPos=[TextPos(1) TextPos(2)-Speed];
        else
            if Blub>60
                Screen('FillRect', Window, 150, VertLine1);
                Screen('FillRect', Window, 150, VertLine2);
                Screen('FillRect', Window, white, GridLine);
                
                
                Screen('TextSize', Window, Size2);
                DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                    0,0,3);
                Blub=Blub-1;
                T4=GetSecs;
                
            elseif Blub>10
                if (T2-T4)>.5
                    T4=GetSecs;
                    Run2=Run2+1;
                    Dots1=mod(Run2,4);
                end
                Screen('FillRect', Window, 150, VertLine1);
                Screen('FillRect', Window, 150, VertLine2);
                Screen('FillRect', Window, white, GridLine);
                
                
                Screen('TextSize', Window, Size2);
                DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                    0,0,3);
                switch Dots1
                    case 0
                        DrawFormattedText(Window,'Connecting',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'Connecting.',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'Connecting..',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'Connecting...',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                end
                DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                    0,0,3);
                Blub=Blub-1;
                T5=GetSecs;
            elseif Blub>0
                if (T2-T4)>.5
                    T4=GetSecs;
                    Run2=Run2+1;
                    Dots1=mod(Run2,4);
                end
                if (T2-T5)>.5
                    T5=GetSecs;
                    Run3=Run3+1;
                    Dots2=mod(Run3,4);
                end
                Screen('FillRect', Window, 150, VertLine1);
                Screen('FillRect', Window, 150, VertLine2);
                Screen('FillRect', Window, white, GridLine);
                
                
                Screen('TextSize', Window, Size2);
                DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                    0,0,3);
                switch Dots2
                    case 0
                        DrawFormattedText(Window,'',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'.',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'..',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'...',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                end
                DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                    0,0,3);
                switch Dots1
                    case 0
                        DrawFormattedText(Window,'Connecting',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'Connecting.',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'Connecting..',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'Connecting...',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                end
                DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                    0,0,3);
                Blub=Blub-1;
                T6=GetSecs;
            else
                if (T2-T4)>.5
                    T4=GetSecs;
                    Run2=Run2+1;
                    Dots1=mod(Run2,4);
                end
                if (T2-T5)>.5
                    T5=GetSecs;
                    Run3=Run3+1;
                    Dots2=mod(Run3,4);
                end
                if (T2-T6)>.5
                    T6=GetSecs;
                    Run4=Run4+1;
                    Dots3=mod(Run4,4);
                end
                Screen('FillRect', Window, 150, VertLine1);
                Screen('FillRect', Window, 150, VertLine2);
                Screen('FillRect', Window, white, GridLine);
                
                
                Screen('TextSize', Window, Size2);
                DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                    0,0,3);
                switch Dots2
                    case 0
                        DrawFormattedText(Window,'',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'.',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'..',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'...',GridLine(1)+30,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+250,GridLine(2)+160, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+650,GridLine(2)+160, white,0,...
                            0,0,3);
                end
                
                switch Dots3
                    case 0
                        DrawFormattedText(Window,'',GridLine(1)+30,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+250,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'',GridLine(1)+650,GridLine(2)+240, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'.',GridLine(1)+30,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+250,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'.',GridLine(1)+650,GridLine(2)+240, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'..',GridLine(1)+30,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+250,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'..',GridLine(1)+650,GridLine(2)+240, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'...',GridLine(1)+30,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+250,GridLine(2)+240, white,0,...
                            0,0,3);
                        DrawFormattedText(Window,'...',GridLine(1)+650,GridLine(2)+240, white,0,...
                            0,0,3);
                end
                
                DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                    0,0,3);
                
                switch Dots1
                    case 0
                        DrawFormattedText(Window,'Connecting',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 1
                        DrawFormattedText(Window,'Connecting.',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 2
                        DrawFormattedText(Window,'Connecting..',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                    case 3
                        DrawFormattedText(Window,'Connecting...',GridLine(1)+250,GridLine(2)+80, white,0,...
                            0,0,3);
                end
                DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                    0,0,3);
                DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                    0,0,3);
            end
            
        end
        
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window, Connection,TextPos(1),TextPos(2), white,0,...
            0,0,3);
        
        if (T2-T3)>.5
            T3=GetSecs;
            Run1=mod(Run1,4)+1;
        end
        
        Screen('PutImage', Window, Wifi(:,:,:,Run1),PosRect);
        
        Screen('Flip', Window);
    end
    
    %Third Loop
    T1=GetSecs;
    while (T2-T1)<Time2
        
        T2=GetSecs;
        Screen('PutImage', Window, Wifi(:,:,:,4),PosRect);
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window,'Connected' ,TextPos(1),TextPos(2),[0 255 0],0,...
            0,0,3);
        Screen('FillRect', Window, 150, VertLine1);
        Screen('FillRect', Window, 150, VertLine2);
        Screen('FillRect', Window, white, GridLine);
        
        if (T2-T1)>.15
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+80, [0 0 255],0,...
                0,0,3);
            DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                0,0,3);
        end
        
        if (T2-T1)>.45
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Player_1',GridLine(1)+30,GridLine(2)+160, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+80, [0 0 255],0,...
                0,0,3);
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+160, [0 0 255],0,...
                0,0,3)
            DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{OpVal},GridLine(1)+650,GridLine(2)+160, white,0,...
                0,0,3);
        end
        if (T2-T1)>.5
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'Player',GridLine(1)+50,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'YOU',GridLine(1)+30,GridLine(2)+80, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Player_1',GridLine(1)+30,GridLine(2)+160, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Player_2',GridLine(1)+30,GridLine(2)+240, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Status',GridLine(1)+350,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+80, [0 0 255],0,...
                0,0,3);
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+160, [0 0 255],0,...
                0,0,3)
            DrawFormattedText(Window,'Waiting',GridLine(1)+250,GridLine(2)+240, [0 0 255],0,...
                0,0,3)
            DrawFormattedText(Window,'Important Value',GridLine(1)+650,GridLine(2)-5, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{HighVal1},GridLine(1)+650,GridLine(2)+80, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{OpVal},GridLine(1)+650,GridLine(2)+160, white,0,...
                0,0,3);
            DrawFormattedText(Window,LowValNames{OpVal},GridLine(1)+650,GridLine(2)+240, white,0,...
                0,0,3);
        end
        Screen('Flip', Window);
    end
    
    ConnectSize=Size2;
    TextPos21=GridLine(2)+160;
    TextPos22=GridLine(2)+240;
    
    %Fourth Loop
    T1=GetSecs;
    while (T2-T1)<Time3
        T2=GetSecs;
        if (T2-T1)>0.3 && (T2-T1)<1.5
            Screen('PutImage', Window, Wifi(:,:,:,3),PosRect);
        else
            Screen('PutImage', Window, Wifi(:,:,:,4),PosRect);
        end
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window,'Connected' ,TextPos(1),TextPos(2),[0 255 0],0,...
            0,0,3);
        
        if (T2-T1)>.0001 && TextPos1>10
            TextPos1=TextPos1-Speed;
            TextPos2=TextPos2-(Speed+.5);
            TextPos21=TextPos21-.4;
            TextPos22=TextPos22-(.4.*2);
            if ConnectSize > 35
                ConnectSize=ConnectSize-3;
            end
            
        end
        Screen('TextSize', Window, ConnectSize)
        DrawFormattedText(Window,'YOU',TextPos1,GridLine(2)+80, white,0,...
            0,0,3);
        DrawFormattedText(Window,'Player_1',TextPos1,TextPos21, white,0,...
            0,0,3);
        DrawFormattedText(Window,'Player_2',TextPos1,TextPos22, white,0,...
            0,0,3);
        DrawFormattedText(Window,'Waiting',TextPos2,GridLine(2)+80, [0 0 255],0,...
            0,0,3);
        DrawFormattedText(Window,'Waiting',TextPos2,TextPos21, [0 0 255],0,...
            0,0,3)
        DrawFormattedText(Window,'Waiting',TextPos2,TextPos22, [0 0 255],0,...
            0,0,3)
        Screen('Flip', Window);
    end
    
    %% Cyberball instructions
    Time4=40; %Will set to 30
    T1=GetSecs;
    Flag=0;
    ok=0;
    while (T2-T1) < Time4 || Flag == 0
        T2=GetSecs;
        if (T2-T1)>3 && (T2-T1)<4.2
            Screen('PutImage', Window, Wifi(:,:,:,3),PosRect);
        elseif (T2-T1)>12 && (T2-T1)<13
            Screen('PutImage', Window, Wifi(:,:,:,3),PosRect);
        elseif (T2-T1)>19 && (T2-T1)<23
            if(T2-T1)>19 && (T2-T1)<20.3
                Screen('PutImage', Window, Wifi(:,:,:,3),PosRect);
            elseif (T2-T1)>20.2 && (T2-T1)<22.5
                Screen('PutImage', Window, Wifi(:,:,:,2),PosRect);
            else
                Screen('PutImage', Window, Wifi(:,:,:,3),PosRect);
            end
        else
            Screen('PutImage', Window, Wifi(:,:,:,4),PosRect);
        end
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window,'Connected' ,TextPos(1),TextPos(2),[0 255 0],0,...
            0,0,3);
        Screen('TextSize', Window, ConnectSize)
        DrawFormattedText(Window,'YOU',TextPos1,GridLine(2)+80, white,0,...
            0,0,3);
        DrawFormattedText(Window,'Player_1',TextPos1,TextPos21, white,0,...
            0,0,3);
        DrawFormattedText(Window,'Player_2',TextPos1,TextPos22, white,0,...
            0,0,3);
        
        if Flag==0
            DrawFormattedText(Window,'Waiting',TextPos2,GridLine(2)+80, [0 0 255],0,...
                0,0,3);
            DrawFormattedText(Window,'Press [Space] when you are ready to proceed','center',...
                ((ScreenRect(4)./100 ).*91 ),white,0,0,0,3);
        elseif Flag==1
            DrawFormattedText(Window,'Waiting for other players...','center',...
                ((ScreenRect(4)./100 ).*91 ),[0 0 255],0,0,0,3);
            DrawFormattedText(Window,'Ready',TextPos2,GridLine(2)+80, [0 255 0],0,...
                0,0,3);
        end
        
        
        if (T2-T1)>(Time4./2)
            DrawFormattedText(Window,'Ready',TextPos2,TextPos21, [0 255 0],0,...
                0,0,3)
        else
            DrawFormattedText(Window,'Waiting',TextPos2,TextPos21, [0 0 255],0,...
                0,0,3)
        end
        
        if (T2-T1)>Time4
            DrawFormattedText(Window,'Ready',TextPos2,TextPos22, [0 255 0],0,...
                0,0,3)
        else
            DrawFormattedText(Window,'Waiting',TextPos2,TextPos22, [0 0 255],0,...
                0,0,3)
        end
        
        Screen('TextSize', Window, Size3)
        DrawFormattedText(Window,CBIntro,'center','center', white,0,...
            0,0,1.5)
        
        Screen('Flip', Window);
        
        GetMouse(Window);
        [~, ~, keyCode] = KbCheck(-1);
        ok=find(keyCode==1);
        if isempty(ok)
            ok=0;
        elseif ok==Space
            Flag=1;
            ok=1;
        else
            ok=0;
        end
    end
    
    Screen('PutImage', Window, Wifi(:,:,:,4),PosRect);
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window,'Connected' ,TextPos(1),TextPos(2),[0 255 0],0,...
        0,0,3);
    Screen('TextSize', Window, ConnectSize)
    DrawFormattedText(Window,'YOU',TextPos1,GridLine(2)+80, white,0,...
        0,0,3);
    DrawFormattedText(Window,'Player_1',TextPos1,TextPos21, white,0,...
        0,0,3);
    DrawFormattedText(Window,'Player_2',TextPos1,TextPos22, white,0,...
        0,0,3);
    DrawFormattedText(Window,'Waiting for other players...','center',...
        ((ScreenRect(4)./100 ).*91 ),[0 0 255],0,0,0,3);
    DrawFormattedText(Window,'Ready',TextPos2,GridLine(2)+80, [0 255 0],0,...
        0,0,3);
    DrawFormattedText(Window,'Ready',TextPos2,TextPos21, [0 255 0],0,...
        0,0,3);
    DrawFormattedText(Window,'Ready',TextPos2,TextPos22, [0 255 0],0,...
        0,0,3);
    Screen('TextSize', Window, Size3)
    DrawFormattedText(Window,CBIntro,'center','center', white,0,...
        0,0,1.5)
    Screen('Flip', Window);
    WaitSecs(1.5);
    
    %% Introducing Player 1
    ok=0;
    AvPos=[(ScreenRect(3)./2)-140 (ScreenRect(4)./100).*18 ((ScreenRect(3)./2)+140) ((ScreenRect(4)./100).*18)+280];
    
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window, Header3,'center',(ScreenRect(4)./100).*10,...
        white);
    Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),AvPos);
    
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, ImportantValue,'center',(ScreenRect(4)./100).*52,...
        white);
    Screen('TextSize', Window, Size0+5);
    DrawFormattedText(Window, ValNames{OpVal},'center',(ScreenRect(4)./100).*60, white,0,...
        0,0,3);
    Screen('TextSize', Window, Size2+5);
    DrawFormattedText(Window, OpValueDesc{OpVal},'center',(ScreenRect(4)./100).*66, white,0,...
        0,0,1);
    Screen('TextSize', Window, Size3);
    if OpVal==6 || OpVal==7
        DrawFormattedText(Window, IsVeryImportant,'center',(ScreenRect(4)./100).*80,...
            white);
    else
        DrawFormattedText(Window, IsVeryImportant,'center',(ScreenRect(4)./100).*72,...
            white);
    end
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, LearnPlayer1,'center',...
        ((ScreenRect(4)./100 ).*91 ), white);
    
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
    
    %% Introducing Player 2
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window, Header4,'center',(ScreenRect(4)./100).*10,...
        white);
    Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),AvPos);
    
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, ImportantValue,'center',(ScreenRect(4)./100).*52,...
        white);
    Screen('TextSize', Window, Size0+5);
    DrawFormattedText(Window, ValNames{OpVal},'center',(ScreenRect(4)./100).*60, white,0,...
        0,0,3);
    Screen('TextSize', Window, Size2+5);
    DrawFormattedText(Window, OpValueDesc{OpVal},'center',(ScreenRect(4)./100).*66, white,0,...
        0,0,1);
    
    Screen('TextSize', Window, Size3);
    if OpVal==6 || OpVal==7
        DrawFormattedText(Window, IsVeryImportant,'center',(ScreenRect(4)./100).*80,...
            white);
    else
        DrawFormattedText(Window, IsVeryImportant,'center',(ScreenRect(4)./100).*72,...
            white);
    end
    
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, LearnPlayer2,'center',...
        ((ScreenRect(4)./100 ).*91 ), white);
    
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
    WaitSecs(1);
    ShowCursor;
    Screen('Flip', Window);
    WaitSecs(1);
    %% Open "Chrome"
    Fill=20;
    Chromeback(:,:,4)=Fill;
    OpenRect=ScreenRect;
    Multiplyer=3;
    Growth=49;
    SpeedG=49./Multiplyer;
    SpeedT=235/Multiplyer;
    OpenRect(1)=(ScreenRect(3)./100).*Growth;
    OpenRect(2)=(ScreenRect(4)./100).*Growth;
    OpenRect(3)=(ScreenRect(3)./100).*(100-Growth);
    OpenRect(4)=(ScreenRect(4)./100).*(100-Growth);
    
    while Growth>0
        
        if (Growth-SpeedG)>0
            Growth=Growth-SpeedG;
        else
            Growth=0;
        end
        
        if (Fill+SpeedT)<255
            Fill=Fill+SpeedT;
        else
            Fill = 255;
        end
        
        OpenRect(1)=(ScreenRect(3)./100).*Growth;
        OpenRect(2)=(ScreenRect(4)./100).*Growth;
        OpenRect(3)=(ScreenRect(3)./100).*(100-Growth);
        OpenRect(4)=(ScreenRect(4)./100).*(100-Growth);
        Chromeback(:,:,4)=Fill;
        Screen('PutImage', Window, Chromeback,OpenRect);
        Screen('Flip', Window);
    end
    
    Screen('PutImage', Window, Chromeback,OpenRect);
    
    Screen('Flip', Window);
    
    WaitSecs(2);
    
    Loadflag=0;
    k=1;
    T1=GetSecs;
    Blub=1;
    while Loadflag==0
        T2=GetSecs;
        Screen('PutImage', Window, Chromeback,OpenRect);
        Screen('PutImage', Window, LoadingDot(:,:,:,k),[ScreenRect(3)./3 (ScreenRect(4)./2)-100 ScreenRect(3)./3+200 (ScreenRect(4)./2)+100]);
        
        if Blub==1
            k=mod(k,8)+1;
            T3=GetSecs;
            Blub=0;
        elseif (T2-T3)>.4
            k=mod(k,8)+1;
            T3=GetSecs;
        end
        
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window,'Loading' ,(ScreenRect(3)/6).*3,'center',black,0,...
            0,0,3);
        Screen('Flip', Window);
        if (T2-T1)>2.5
            Loadflag=1;
        end
    end
    Screen('PutImage', Window, Chromeback,OpenRect);
    Screen('Flip', Window);
    WaitSecs(0.5);
    
    %% Instructions Cyberball
    
    
    Screen('PutImage', Window, Chromeback,OpenRect);
    Screen('PutImage', Window, Instr(:,:,:,1),[(ScreenRect(3)./2)-499 (ScreenRect(4)./2)-414 (ScreenRect(3)./2)+499 (ScreenRect(4)./2)+535]);
    Screen('Flip', Window);
    
    while ~ ok
        [x,y,button]=GetMouse(Window);
        
        Screen('PutImage', Window, Chromeback,OpenRect);
        
        if x>1233 && y>993 && x<1436 && y<1006
            Screen('PutImage', Window, Instr(:,:,:,2),[(ScreenRect(3)./2)-499 (ScreenRect(4)./2)-414 (ScreenRect(3)./2)+499 (ScreenRect(4)./2)+535]);
        else
            Screen('PutImage', Window, Instr(:,:,:,1),[(ScreenRect(3)./2)-499 (ScreenRect(4)./2)-414 (ScreenRect(3)./2)+499 (ScreenRect(4)./2)+535]);
        end
        if x>1233 && y>993 && x<1436 && y<1006 && button(1)==1
            ok=1;
        end
        Screen('TextSize', Window, Size3);
        Screen('Flip', Window);
    end
    WaitSecs(.05);
    
    %Loading Screen 2
    
    Loadflag=0;
    k=1;
    T1=GetSecs;
    Blub=1;
    
    while Loadflag==0
        T2=GetSecs;
        Screen('PutImage', Window, Chromeback,OpenRect);
        Screen('PutImage', Window, LoadingDot(:,:,:,k),[(ScreenRect(3)./2)-100 (ScreenRect(4)./2)-20 (ScreenRect(3)./2)+100 (ScreenRect(4)./2)+180]);
        
        if Blub==1
            k=mod(k,8)+1;
            T3=GetSecs;
            Blub=0;
        elseif (T2-T3)>.4
            k=mod(k,8)+1;
            T3=GetSecs;
        end
        
        Screen('TextSize', Window, Size0);
        DrawFormattedText(Window,'Waiting for other players' ,'center',(ScreenRect(4)./2)-70,black,0,...
            0,0,3);
        Screen('Flip', Window);
        if (T2-T1)>6
            Loadflag=1;
        end
    end
    
    %% Playing Cyberball
    Screen('PutImage', Window, Chromeback,OpenRect);
    Screen('Flip', Window);
    WaitSecs(0.5)
    
    PlayerPos=[((ScreenRect(3)/100).*50)-100 ((ScreenRect(4)/100).*85)-100 ((ScreenRect(3)/100).*50)+100 ((ScreenRect(4)/100).*85)+100];
    Player1Pos=[((ScreenRect(3)/100).*25)-100 ((ScreenRect(4)/100).*30)-100 ((ScreenRect(3)/100).*25)+100 ((ScreenRect(4)/100).*30)+100];
    Player2Pos=[((ScreenRect(3)/100).*75)-100 ((ScreenRect(4)/100).*30)-100 ((ScreenRect(3)/100).*75)+100 ((ScreenRect(4)/100).*30)+100];
    BallPos=[Player1Pos(3)+10, Player1Pos(2)+75 Player1Pos(3)+60, Player1Pos(2)+125;
        Player2Pos(1)-60, Player2Pos(2)+75 Player2Pos(1)-10, Player2Pos(2)+125;
        PlayerPos(1)+75, PlayerPos(2)-60 PlayerPos(3)-75, PlayerPos(2)-10];
    
    Screen('TextSize', OffWindow, Size2);
    [~,~,tb]=DrawFormattedText(OffWindow,LowValNames{OpVal}, Player1Pos(1)+22,Player1Pos(4)+73,black);
    
    ValuePos1=(Player1Pos(1)+((Player1Pos(3)-Player1Pos(1))./2))-((tb(3)-tb(1))./2);
    ValuePos2=(Player2Pos(1)+((Player2Pos(3)-Player2Pos(1))./2))-((tb(3)-tb(1))./2);
    
    CyberballOut=ones(1,NumbTrial.*3)*99;
    
    if IncCon==0
        PlayerCounter=0;
    end
    for i=1:NumbTrial
        RoundFlag=0;
        if i==1
            Holding=2;
        end
        CyberballOut((i.*3)-2)=Holding;
        while RoundFlag==0
            Screen('PutImage', Window, Chromeback,OpenRect);
            
            Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
            Screen('FrameRect', Window,black,Player1Pos,5);
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
            Screen('TextSize', Window, Size3);
            DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
            
            Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
            Screen('FrameRect', Window,black,Player2Pos,5);
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
            Screen('TextSize', Window, Size3);
            DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
            
            
            Screen('PutImage', Window, PlayerPic,PlayerPos);
            Screen('FrameRect', Window,black,PlayerPos,5);
            Screen('TextSize', Window, Size2);
            DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
            DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
            Screen('TextSize', Window, Size3);
            DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
            
            Screen('PutImage', Window, Ball,BallPos(Holding,:));
            Screen('Flip', Window);
            if Holding==1||Holding==2
                RandomWait=(1+(3.*rand));
                WaitSecs(RandomWait);
                if IncCon==1
                    next=round(rand);
                else
                    randomly=rand;
                    if randomly>.75
                        next=1;
                        PlayerCounter=PlayerCounter+1;
                    else
                        next=0;
                    end
                    if PlayerCounter>2
                        next=0;
                    end
                end
                CyberballOut((i.*3)-1)=RandomWait;
                if next==1
                    CyberballOut(i.*3)=3;
                    if Holding==1
                        Move=(BallPos(1,:)-BallPos(3,:))/60;
                        CurPos=BallPos(1,:);
                        while CurPos(1)<BallPos(3,1)&&CurPos(2)<BallPos(3,2)
                            CurPos=CurPos-(Move.*2);
                            Screen('PutImage', Window, Chromeback,OpenRect);
                            Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                            Screen('FrameRect', Window,black,Player1Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                            Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                            Screen('FrameRect', Window,black,Player2Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                            Screen('PutImage', Window, PlayerPic,PlayerPos);
                            Screen('FrameRect', Window,black,PlayerPos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                            DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                            
                            Screen('PutImage', Window, Ball,CurPos);
                            Screen('TextSize', Window, Size3);
                            Screen('Flip', Window);
                        end
                        Holding=3;
                        RoundFlag=1;
                    else
                        Move=(BallPos(2,:)-BallPos(3,:))/60;
                        CurPos=BallPos(2,:);
                        while CurPos(1)>BallPos(3,1)&&CurPos(2)<BallPos(3,2)
                            CurPos=CurPos-(Move.*2);
                            Screen('PutImage', Window, Chromeback,OpenRect);
                            Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                            Screen('FrameRect', Window,black,Player1Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                            Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                            Screen('FrameRect', Window,black,Player2Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                            Screen('PutImage', Window, PlayerPic,PlayerPos);
                            Screen('FrameRect', Window,black,PlayerPos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                            DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                            
                            Screen('PutImage', Window, Ball,CurPos);
                            Screen('TextSize', Window, Size3);
                            Screen('Flip', Window);
                            
                        end
                        Holding=3;
                        RoundFlag=1;
                    end
                else
                    switch Holding
                        case 1
                            CyberballOut(i.*3)=2;
                            Move=(BallPos(1,:)-BallPos(2,:))/60;
                            CurPos=BallPos(1,:);
                            while CurPos(1)<BallPos(2,1)
                                CurPos=CurPos-(Move.*2);
                                Screen('PutImage', Window, Chromeback,OpenRect);
                                Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                                Screen('FrameRect', Window,black,Player1Pos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                                DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                                Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                                Screen('FrameRect', Window,black,Player2Pos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                                DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                                Screen('PutImage', Window, PlayerPic,PlayerPos);
                                Screen('FrameRect', Window,black,PlayerPos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                                DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                                
                                Screen('PutImage', Window, Ball,CurPos);
                                Screen('TextSize', Window, Size3);
                                Screen('Flip', Window);
                            end
                            Holding=2;
                            RoundFlag=1;
                        case 2
                            CyberballOut(i.*3)=1;
                            Move=(BallPos(2,:)-BallPos(1,:))/60;
                            CurPos=BallPos(2,:);
                            while CurPos(1)>BallPos(1,1)
                                CurPos=CurPos-(Move.*2);
                                Screen('PutImage', Window, Chromeback,OpenRect);
                                Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                                Screen('FrameRect', Window,black,Player1Pos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                                DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                                Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                                Screen('FrameRect', Window,black,Player2Pos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                                DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                                Screen('PutImage', Window, PlayerPic,PlayerPos);
                                Screen('FrameRect', Window,black,PlayerPos,5);
                                Screen('TextSize', Window, Size2);
                                DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                                DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                                Screen('TextSize', Window, Size3);
                                DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                                
                                Screen('PutImage', Window, Ball,CurPos);
                                Screen('TextSize', Window, Size3);
                                Screen('Flip', Window);
                            end
                            Holding=1;
                            RoundFlag=1;
                    end
                end
            else
                ok=0;
                TStart=GetSecs;
                while~ok
                    [x,y,button]=GetMouse(Window);
                    Screen('PutImage', Window, Chromeback,OpenRect);
                    
                    Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                    Screen('FrameRect', Window,black,Player1Pos,5);
                    Screen('TextSize', Window, Size2);
                    DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                    DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                    Screen('TextSize', Window, Size3);
                    DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                    
                    Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                    Screen('FrameRect', Window,black,Player2Pos,5);
                    Screen('TextSize', Window, Size2);
                    DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                    DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                    Screen('TextSize', Window, Size3);
                    DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                    
                    
                    Screen('PutImage', Window, PlayerPic,PlayerPos);
                    Screen('FrameRect', Window,black,PlayerPos,5);
                    Screen('TextSize', Window, Size2);
                    DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                    DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                    Screen('TextSize', Window, Size3);
                    DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                    
                    Screen('PutImage', Window, Ball,BallPos(Holding,:));
                    Screen('TextSize', Window, Size3);
                    Screen('Flip', Window);
                    if x>Player1Pos(1) && x<Player1Pos(3) && y>Player1Pos(2) && y<Player1Pos(4) && button(1)==1
                        TDesc=GetSecs;
                        CyberballOut((i.*3)-1)=TDesc-TStart;
                        CyberballOut(i.*3)=1;
                        Move=(BallPos(3,:)-BallPos(1,:))/60;
                        CurPos=BallPos(3,:);
                        while CurPos(1)>BallPos(1,1)&&CurPos(2)>BallPos(1,2)
                            CurPos=CurPos-Move.*2;
                            Screen('PutImage', Window, Chromeback,OpenRect);
                            Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                            Screen('FrameRect', Window,black,Player1Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                            Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                            Screen('FrameRect', Window,black,Player2Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                            Screen('PutImage', Window, PlayerPic,PlayerPos);
                            Screen('FrameRect', Window,black,PlayerPos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                            DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                            
                            Screen('PutImage', Window, Ball,CurPos);
                            Screen('TextSize', Window, Size3);
                            Screen('Flip', Window);
                        end
                        Holding=1;
                        RoundFlag=1;
                        ok=1;
                    elseif x>Player2Pos(1) && x<Player2Pos(3) && y>Player2Pos(2) && y<Player2Pos(4) && button(1)==1
                        TDesc=GetSecs;
                        CyberballOut((i.*3)-1)=TDesc-TStart;
                        CyberballOut(i.*3)=2;
                        Move=(BallPos(3,:)-BallPos(2,:))/60;
                        CurPos=BallPos(3,:);
                        while CurPos(1)<BallPos(2,1)&&CurPos(2)>BallPos(2,2)
                            CurPos=CurPos-(Move.*2);
                            Screen('PutImage', Window, Chromeback,OpenRect);
                            Screen('PutImage', Window, Avatar(:,:,:,Player1_Pic),Player1Pos);
                            Screen('FrameRect', Window,black,Player1Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 1', Player1Pos(1)+22,Player1Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos1,Player1Pos(4)+73,black);
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player1Pos(1)+7,Player1Pos(4)+23,black)
                            Screen('PutImage', Window, Avatar(:,:,:,Player2_Pic),Player2Pos);
                            Screen('FrameRect', Window,black,Player2Pos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'Player 2', Player2Pos(1)+22,Player2Pos(2)-15,black)
                            DrawFormattedText(Window,LowValNames{OpVal}, ValuePos2,Player2Pos(4)+73,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', Player2Pos(1)+7,Player2Pos(4)+23,black)
                            Screen('PutImage', Window, PlayerPic,PlayerPos);
                            Screen('FrameRect', Window,black,PlayerPos,5);
                            Screen('TextSize', Window, Size2);
                            DrawFormattedText(Window,'YOU', PlayerPos(1)-100,PlayerPos(2)+120,black)
                            DrawFormattedText(Window,LowValNames{HighVal1}, PlayerPos(3)+10,PlayerPos(2)+130,black)
                            Screen('TextSize', Window, Size3);
                            DrawFormattedText(Window,'Important Value:', PlayerPos(3)+10,PlayerPos(2)+80,black)
                            
                            Screen('PutImage', Window, Ball,CurPos);
                            Screen('TextSize', Window, Size3);
                            Screen('Flip', Window);
                        end
                        
                        Holding=2;
                        RoundFlag=1;
                        ok=1;
                    end
                end
            end
        end
    end
    
    WaitSecs(4);
    
    Screen('Flip', Window);
    
    WaitSecs(4);
    
    %% Post Game Questionnaire
    ok=0;
    Screen('TextSize', Window, Size2+40);
    
    DrawFormattedText(Window, ThankYou,'center',(ScreenRect(4)./100.*15),...
        white);
    
    Screen('TextSize', Window, Size3+5);
    DrawFormattedText(Window, CompletingGame,'center',(ScreenRect(4)./100.*22),...
        white,0,0,0,1.5);
    Screen('TextSize', Window, Size3);
    DrawFormattedText(Window, PQ_Inst,'center',(ScreenRect(4)./100.*40),...
        white,0,0,0,3);
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./100 ).*91 ), white);
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
    
    
    ShowCursor
    Questions=ones(1,length(QuestionList1))*99;
    
    
    for A=1:length(QuestionList1)
        Flag=0;
        Choice=99;
        while Flag==0
            Screen('TextSize', Window, (Size0));
            DrawFormattedText(Window, QuestionList1{A},'center',(ScreenRect(4)./100.*25),...
                white,0,0,0,1);
            if A<3
                Screen('TextSize', Window, (Size3+5));
                DrawFormattedText(Window, 'Do you remember?','center',(ScreenRect(4)./100.*15),...
                    white,0,0,0,3);
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, Lab1{1},(ScreenRect(3 )./100).*9.25,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab2{1},(ScreenRect(3 )./100).*17,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab3{1},(ScreenRect(3 )./100).*26.5,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab4{1},(ScreenRect(3 )./100).*35.5,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab5{1},(ScreenRect(3 )./100).*44,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab6{1},(ScreenRect(3 )./100).*52.75,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab7{1},(ScreenRect(3 )./100).*62,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab8{1},(ScreenRect(3 )./100).*71.75,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab9{1},(ScreenRect(3 )./100).*80.25,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab10{1},(ScreenRect(3 )./100).*89.5 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
            else
                Screen('TextSize', Window, (Size3+5));
                DrawFormattedText(Window, 'To what extent do you (dis)agree with the following statement:','center',(ScreenRect(4)./100.*15),...
                    white,0,0,0,3);
                Screen('TextSize', Window, SizeLabs);
                DrawFormattedText(Window, Lab1{2},(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab3{2},(ScreenRect(3 )./100).*26.75 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab5{2},(ScreenRect(3 )./100).*43.25 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab6{2},(ScreenRect(3 )./100).*53 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab8{2},(ScreenRect(3 )./100).*72 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
                DrawFormattedText(Window, Lab10{2},(ScreenRect(3 )./100).*89 ,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
            end
            
            for i=1:10
                if Choice==0
                    Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                else
                    if i==Choice
                        Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    else
                        Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
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
                    Screen('TextSize', Window, (Size0));
                    DrawFormattedText(Window, QuestionList1{A},'center',(ScreenRect(4)./100.*25),...
                        white,0,0,0,1);
                    if A<3
                        Screen('TextSize', Window, (Size3+5));
                        DrawFormattedText(Window, 'Do you remember?','center',(ScreenRect(4)./100.*15),...
                            white,0,0,0,3);
                        Screen('TextSize', Window, SizeLabs);
                        DrawFormattedText(Window, Lab1{1},(ScreenRect(3 )./100).*9.25,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab2{1},(ScreenRect(3 )./100).*17,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab3{1},(ScreenRect(3 )./100).*26.5,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab4{1},(ScreenRect(3 )./100).*35.5,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab5{1},(ScreenRect(3 )./100).*44,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab6{1},(ScreenRect(3 )./100).*52.75,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab7{1},(ScreenRect(3 )./100).*62,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab8{1},(ScreenRect(3 )./100).*71.75,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab9{1},(ScreenRect(3 )./100).*80.25,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab10{1},(ScreenRect(3 )./100).*89.5 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                    else
                        Screen('TextSize', Window, (Size3+5));
                        DrawFormattedText(Window, 'To what extent do you (dis)agree with the following statement:','center',(ScreenRect(4)./100.*15),...
                            white,0,0,0,3);
                        Screen('TextSize', Window, SizeLabs);
                        DrawFormattedText(Window, Lab1{2},(ScreenRect(3 )./100).*7 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab3{2},(ScreenRect(3 )./100).*26.75 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab5{2},(ScreenRect(3 )./100).*43.25 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab6{2},(ScreenRect(3 )./100).*53 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab8{2},(ScreenRect(3 )./100).*72 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                        DrawFormattedText(Window, Lab10{2},(ScreenRect(3 )./100).*89 ,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                    end
                    
                    for i=1:10
                        if Choice==0
                            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                        else
                            if i==Choice
                                Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            else
                                Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((9.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            end
                        end
                    end
                    Screen('DrawTexture', Window, TexContinueFB,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
                    
                    Screen('Flip', Window);
                end
                [PosX,PosY,Buttons]=GetMouse(Window);
            end
            
            for i=1:10
                if PosX>(ScreenRect(3)./100).*((9.*i)-(.0253./2))&&PosX<((ScreenRect(3)./100).*((9.*i)-(.0253./2)) )+SizeButton
                    if PosY>(ScreenRect(4)./100).*55&&PosY<((ScreenRect(4)./100).*55)+SizeButton
                        Choice=i;
                    end
                end
            end
            if PosX>(ScreenRect(3)./100).*(44) && PosX<((ScreenRect(3)./100).*44)+SizeContinue*3.57 && PosY>(ScreenRect(4)./100).*75 && PosY<((ScreenRect(4)./100).*75 )+SizeContinue
                if Choice==99
                    Flag=0;
                else
                    Questions(A)=Choice;
                    Flag=1;
                end
            end
            ok=0;
        end
    end
    
    %% Output
    Cyberballtemp=[CyberballOut Questions HighVal1 OpVal PermaFlag];
    for i=1:length(Cyberballtemp)
        if i==1
            CyberballOut=table(Cyberballtemp(i));
            CyberballOut.Properties.VariableNames{i}=strcat('Holding_Round_',num2str(i));
        else
            a=table(Cyberballtemp(i));
            if i<(NumbTrial.*3)+1
                if mod(i,3)==1
                    a.Properties.VariableNames{1}=strcat('Holding_Round_',num2str(ceil(i./3)));
                elseif mod(i,3)==2
                    a.Properties.VariableNames{1}=strcat('Time_Round_',num2str(ceil(i./3)));
                elseif mod(i,3)==0
                    a.Properties.VariableNames{1}=strcat('Target_Round_',num2str(ceil(i./3)));
                end
            elseif i<(NumbTrial.*3)+1+length(Questions)
                a.Properties.VariableNames{1}=QuestionLab1{i-(NumbTrial.*3)};
            else
                if i==(NumbTrial.*3)+2+length(Questions)
                    a.Properties.VariableNames{1}='Own_Highest_Value';
                elseif i==(NumbTrial.*3)+3+length(Questions)
                    a.Properties.VariableNames{1}='Opponent_Highest_Value';
                else
                a.Properties.VariableNames{1}='Value_Inaccurate_Flag';
                end
                
            end
            CyberballOut=[CyberballOut a];
        end
    end
    
    %% Close and shut down
    if test==1
        Priority(0)
        close ALL
        ShowCursor
        Screen('CloseAll');
        ListenChar(0)
    end
    
catch
    CyberballOut=ones(1,NumbTrial.*3)*99;
    Questions=ones(1,length(QuestionList1))*99;
    Cyberballtemp=[CyberballOut Questions];
    for i=1:length(Cyberballtemp)
        if i==1
            CyberballOut=table(Cyberballtemp(i));
            CyberballOut.Properties.VariableNames{i}=strcat('Holding_Round_',num2str(i));
        else
            a=table(Cyberballtemp(i));
            if i<(NumbTrial.*3)+1
                if mod(i,3)==1
                    a.Properties.VariableNames{1}=strcat('Holding_Round_',num2str(ceil(i./3)));
                elseif mod(i,3)==2
                    a.Properties.VariableNames{1}=strcat('Time_Round_',num2str(ceil(i./3)));
                elseif mod(i,3)==0
                    a.Properties.VariableNames{1}=strcat('Target_Round_',num2str(ceil(i./3)));
                end
            else
                a.Properties.VariableNames{1}=QuestionLab1{i-(NumbTrial.*3)};
            end
            CyberballOut=[CyberballOut a];
        end
    end
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(1)
    PsychHID('KbQueueFlush',-1,3)
end
end