function [ProgOut,ok]=Progress(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,test,ProgCon)
Screen('Preference', 'SkipSyncTests', 1);
try
    test=1;
    if test==1
        Space=KbName('Space');
        ok=0;
        MainScreen=max(Screen('Screens'));
        ScreenRect=get(groot,'ScreenSize');
        white=WhiteIndex(MainScreen);
        black=BlackIndex(MainScreen);
        ProgCon=0;
    end
    %% Settings
    
    
    header1='Generating Ideas';
    
    text1_1='For the next task, you will be asked if you are willing to generate environmental ideas for the\nUK-based environmental charity “Friends of the Earth”. They are partnering with several\nUniversities around the UK to help them generate ideas on ways in which students like you\ncan help to protect the environment, get more people interested engaged with topics\nsuch as air and water pollution, the protection of the natural environment, recycling, and other\nsustainable and environmental behaviour.';
    text1_2='In this task, you will be asked to think about ways in which students can have a positive impact\non the environment to help the “Friends of the Earth”. The overall aim of the charity for this\nstudy is to generate 50 unique ideas in total by all participants in the study here in Bath.';
    
    text_advance='Press [Space] to advance';
    
    text2_1='We are trying to obtain a diverse set of ideas. Therefore, only ideas that have not been\nmentioned by any other participant before will count as a contribution. You can list as many\nideas as you want. Try to be as origninal as possible. Every original idea helps the\nFriends of the Earth reach their goal';
    text2_20='On the next screen, you will see how many ideas have already been generated';
    text2_21='On the next screen, you will see how many ideas still need to be generated';
    text2_switch={text2_20 text2_21};
    
    Arrow=imread('Pics\Arrow.png');
    [a,b,c]=size(Arrow);
    Out=zeros(a,b);
    for i=1:a
        for j=1:b
            if Arrow(i,j,1)>0
                Out(i,j)=255;
            end
        end
    end
    Arrow(:,:,4)=Out;
    SizeArrow=170;
    
    Lab1={'not\nat all'};
    Lab7={'very\nimportant' 'very\nsatisfied'};
    QuestionList1={'How important is it for you that the charity succeeds in collecting 150 ideas?',...
        'Considering the amount of Ideas already generated,\nhow satisfied are you with this progress?',...
        'Considering the amount of Ideas already generated,\nhow important is it for you to generate many ideas for the “Friends of the Earth”?'};
    QuestionList2={'How important is it for you that the charity succeeds in collecting 150 ideas?',...
        'Considering the number of ideas still needed to reach the goal,\nhow satisfied are you with this progress?',...
        'Considering the number of ideas still needed to reach the goal,\nhow important is it for you to generate many ideas for the “Friends of the Earth”?'};
    QuestionLab1={'Importance_Goal',...
        'Satisfaction_Progress',...
        'Importance_GeneratingIdeas'};
    
    unfilled=imread('Pics\unfilled.png');
    filled=imread('Pics\filled.png');
    Continue=imread('Pics\continue.png');
    ContinueFB=imread('Pics\continue_fb.png');
    SizeButton=ScreenRect(3).*.0253;
    SizeContinue=ScreenRect(3).*.035;
    %% Test Script
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
    ArrowTex=Screen('MakeTexture', Window, Arrow);
    Checkboxes={Texunfilled Texfilled};
    %% First Page
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window, header1,'center',(ScreenRect(4)./100.*15),...
        white);
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, text1_1,'center',(ScreenRect(4)./100.*25),...
        white,0,0,0,1.5);
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, text1_2,'center',(ScreenRect(4)./100.*70),...
        white,0,0,0,1.5);
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text_advance,'center',(ScreenRect(4)./100.*95),...
        white);
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
    %% Second Page
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window, header1,'center',(ScreenRect(4)./100.*15),...
        white);
    Screen('TextSize', Window, Size2);
    DrawFormattedText(Window, text2_1,'center',(ScreenRect(4)./100.*25),...
        white,0,0,0,1.5);
    switch ProgCon
        case 0
            Screen('TextSize', Window, Size2+5);
            DrawFormattedText(Window, text2_switch{1},'center',(ScreenRect(4)./100.*55),...
                white,0,0,0,1.5);
        case 1
            Screen('TextSize', Window, Size2+5);
            DrawFormattedText(Window, text2_switch{2},'center',(ScreenRect(4)./100.*55),...
                white,0,0,0,1.5);
    end
    Screen('TextSize', Window, SizeAdvance);
    DrawFormattedText(Window, text_advance,'center',(ScreenRect(4)./100.*95),...
        white);
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
    
    %% Third Page
    GoalRect=[ScreenRect(3)./8 (ScreenRect(4)./2)-40 (ScreenRect(3)./8).*7 (ScreenRect(4)./2)+40];
    LengthArrow=(GoalRect(3)-GoalRect(1))./2;
    
    Screen('TextSize', Window, Size0);
    DrawFormattedText(Window, header1,'center',(ScreenRect(4)./100.*15),...
        white);

    if ProgCon==0
        ArrowRect=[GoalRect(1) (GoalRect(2)-SizeArrow)+50 GoalRect(1)+LengthArrow GoalRect(2)+50];
        Screen('TextSize', Window, Size0-20);
        DrawFormattedText(Window, '24 Ideas have already been generated.','center',(ScreenRect(4)./100.*34),...
            white);
        Screen('FillRect', Window, 255, GoalRect, 5);
        Screen('TextSize', Window, Size2+10);
        DrawFormattedText(Window, 'Overall Goal: 50 Ideas',GoalRect(1)+10,GoalRect(4)-25,...
            black);
        
        Screen('DrawTexture', Window, ArrowTex,[],ArrowRect)
        
        Screen('TextSize', Window, Size2+10);
        DrawFormattedText(Window, 'To Date: 24 Ideas',ArrowRect(1)+10,ArrowRect(4)-71,...
            black);
        
    else
        ArrowRect=[(GoalRect(1)+(GoalRect(3)-GoalRect(1))./2) (GoalRect(2)-SizeArrow)+50 (GoalRect(1)+(GoalRect(3)-GoalRect(1))./2)+LengthArrow GoalRect(2)+50];
        Screen('TextSize', Window, Size0-20);
        DrawFormattedText(Window, '26 Ideas still need to be generated.','center',(ScreenRect(4)./100.*34),...
            white);
        Screen('FillRect', Window, 255, GoalRect, 5);
        Screen('TextSize', Window, Size2+10);
        DrawFormattedText(Window, 'Overall Goal: 50 Ideas',GoalRect(3)-630,GoalRect(4)-25,...
            black);
        
        Screen('DrawTexture', Window, ArrowTex,[],ArrowRect)
        
        Screen('TextSize', Window, Size2+10);
        DrawFormattedText(Window, 'To Go: 26 Ideas',ArrowRect(1)+10,ArrowRect(4)-71,...
            black);
    end
    
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
    
    %% Questionnaire
    ShowCursor
    if ProgCon==0
        QuestionList=QuestionList1;
    elseif ProgCon==1
        QuestionList=QuestionList2;
    end
    
    Questions=ones(1,length(QuestionList))*99;
    
    for A=1:length(QuestionList)
        Flag=0;
        Choice=99;
        while Flag==0
            Screen('TextSize', Window, (Size0-20));
            DrawFormattedText(Window, QuestionList{A},'center',(ScreenRect(4)./100.*25),...
                white,0,0,0,1);
            
            Screen('TextSize', Window, (Size3+5));
            DrawFormattedText(Window, 'Before we get to generating ideas, please answer the following questions:','center',(ScreenRect(4)./100.*15),...
                white,0,0,0,3);
            
            Screen('TextSize', Window, SizeLabs);
            DrawFormattedText(Window, Lab1{1},(ScreenRect(3 )./100).*12.5,(ScreenRect(4)./100).*51 , white,0,...
                0,0,1.5 );
            if A==2
                DrawFormattedText(Window, Lab7{2},(ScreenRect(3 )./100).*84,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
            else
                DrawFormattedText(Window, Lab7{1},(ScreenRect(3 )./100).*84,(ScreenRect(4)./100).*51 , white,0,...
                    0,0,1.5 );
            end
            
            for i=1:7
                if Choice==0
                    Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                else
                    if i==Choice
                        Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                    else
                        Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
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
                    Screen('TextSize', Window, (Size0-20));
                    DrawFormattedText(Window, QuestionList{A},'center',(ScreenRect(4)./100.*25),...
                        white,0,0,0,1);
                    Screen('TextSize', Window, (Size3+5));
                    DrawFormattedText(Window, 'Before we get to generating ideas, please answer the following questions:','center',(ScreenRect(4)./100.*15),...
                        white,0,0,0,3);
                    Screen('TextSize', Window, SizeLabs);
                    DrawFormattedText(Window, Lab1{1},(ScreenRect(3 )./100).*12.5,(ScreenRect(4)./100).*51 , white,0,...
                        0,0,1.5 );
                    if A==2
                        DrawFormattedText(Window, Lab7{2},(ScreenRect(3 )./100).*84,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                    else
                        DrawFormattedText(Window, Lab7{1},(ScreenRect(3 )./100).*84,(ScreenRect(4)./100).*51 , white,0,...
                            0,0,1.5 );
                    end
                    for i=1:7
                        if Choice==0
                            Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                        else
                            if i==Choice
                                Screen('DrawTexture', Window, Checkboxes{2},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            else
                                Screen('DrawTexture', Window, Checkboxes{1},[],[(ScreenRect(3)./100).*((12.*i)-(.0253./2))  (ScreenRect(4)./100).*55 ((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton ((ScreenRect(4)./100).*55 )+SizeButton])
                            end
                        end
                    end
                    Screen('DrawTexture', Window, TexContinueFB,[],[(ScreenRect(3)./100).*(44)  (ScreenRect(4)./100).*75 ((ScreenRect(3)./100).*44)+SizeContinue*3.57 ((ScreenRect(4)./100).*75 )+SizeContinue])
                    
                    Screen('Flip', Window);
                end
                [PosX,PosY,Buttons]=GetMouse(Window);
            end
            
            for i=1:7
                if PosX>(ScreenRect(3)./100).*((12.*i)-(.0253./2))&&PosX<((ScreenRect(3)./100).*((12.*i)-(.0253./2)) )+SizeButton
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
    ProgOut=ones(1,length(Questions))*99;
    ProgOuttemp=Questions;
    for i=1:length(ProgOuttemp)
        if i==1
            a=table(ProgOuttemp(i));
            a.Properties.VariableNames{i}=QuestionLab1{i};
            ProgOut=a;
        else
            a=table(ProgOuttemp(i));
            a.Properties.VariableNames{1}=QuestionLab1{i};
            ProgOut=[ProgOut a];
        end
    end
catch
    ProgOut=ones(1,length(Questions))*99;
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(0)
end
%% Close
if test==1
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(0)
end
end