cd('C:\Users\Lukas Litzellachner\OneDrive\PhD\Values as Goals\Program')
addpath('C:\Users\Lukas Litzellachner\OneDrive\PhD\Values as Goals\Program\fun');
addpath('C:\Users\Lukas Litzellachner\OneDrive\PhD\Values as Goals\Program\Pics');
addpath('C:\Users\Lukas Litzellachner\OneDrive\PhD\Values as Goals\Program\Data');
KbName('UnifyKeyNames');

try
    CD=cd;
    SubFolder='\Data\';
    Name='ValGoalStudy';
    FileType='.xlsx';
    FileName=strcat(CD,SubFolder,Name,FileType);
    
    Data=xlsread(FileName);
    Data=array2table(Data);
    Data.Properties.VariableNames{1}='SN';
    
catch
    ErrLoad=warndlg(sprintf(...
        'ValGoalStudy.xlsx not found.\nA new file will be created.'),...
        '!! Output file not found !!','modal');
    uiwait(ErrLoad)
    Resp = questdlg(sprintf(...
        'Is this the first time, this experiment is conducted on this computer?'));
    switch Resp
        case'Yes'
            Resp=1;
        case'No'
            Resp=0;
    end
    if Resp==0
        Resp = questdlg(sprintf(...
            'Would you like to try to recover data from the last session?'));
        switch Resp
            case'Yes'
                Resp=1;
            case'No'
                Resp=0;
        end
        if Resp==1
            try DataN=Data;
                Data=DataN;
                clear DataN
            catch
                ErrRestore=warndlg(sprintf('No Data could be found'),...
                    '!! Data could not be found !!','modal');
                uiwait(ErrRestore)
            end
        else
            clear Data
        end
    else
        %Go here if it's the first time this experiment is run on this pc
        %Set Output Directory
        ErrRestore=warndlg(sprintf('Please choose your output directory'),...
            'Set Working Directory','modal');
        uiwait(ErrRestore)
        WD = uigetdir(cd,'Set Working Directory');
        if WD==0
            WD=cd;
        else
            cd(WD);
        end
        
        %Create Output folders
        mkdir('Data');
        
    end
end

rng 'shuffle'
try
    %% General
    Def_Subj_Age=0;
    Def_Subj_No=0;
    Date=date;
    ok=0;
    MainScreen=max(Screen('Screens'));
    ScreenRect=get(groot,'ScreenSize');
    Version=3;
    test=0;
    NumbTrial=24;
    
    %for Screen1
    Red=255;
    Green=255;
    Blue=255;
    
    white=WhiteIndex(MainScreen);
    black=BlackIndex(MainScreen);
    color=[Red./white Green./white Blue./white];
    
    red=[Red black black];
    blue=[black black Blue];
    ScreenTitle1='Department of Psychology';
    
    %for Dialog Box 1
    prompt1= {'Subject Number'};
    dlg_title1='To be filled out by the experimenter';
    size1=[1 58];
    Err1_SNInvalid='The Subject Number is invalid:\nThe next logical subject number will be chosen instead';
    Err1_GDInvalid='Some of the input information is not invalid \nPlease enter a valid Goal/Distance Group and Subject Number first.';
    Q1_SNInvalid='The Subject Number you have chosen is not next in logical succession.\nWould you like to proceed anyway?';
    
    %For Experiment Part 1
    text1_Thank='Thank you';
    text1_forparticipate='for participating in this study!';
    text1_forparticipate2='for participating in this study!\n\nPlease call the Experimenter';
    text1_ToAdvance='Press [Space] to continue';
    
    %Thermo Measure Speed in Secs till full
    TimetoFillinSecs=7.5;
    %for Dialog Box 2
    prompt2= {'Please state your age'};
    dlg_title2='To be filled out by the participant';
    size2=[1 58];
    
    %for Drop Down 0.1
    prompt01= {'EXPERIMENTER! Please select the Value condition:'};
    options01={'0','1'};
    dlg_title01='Value Condition';
    size01=[300 75];
    
    %for Drop Down 0.2
    prompt02= {'EXPERIMENTER! Please select the Incl condition:'};
    options02={'0','1'};
    dlg_title02='Inclusion Condition';
    
    %for Drop Down 1
    prompt3= {'Please select your gender:'};
    options1={'female','male'};
    dlg_title3='Gender';
    size3=[200 30];
    
    %for Drop Down 2
    prompt4= {'Please select your current employment status:'};
    options2={'Student','Employed (incl. Self-Emplolyed)','Unemployed',...
        'Retired'};
    size4=[230 60];
    
    %for Optional Drop Down 3
    prompt5= {'Please select your school:'};
    options3={'Engineering and Design','Humanities and Social Sciences',...
        'Management','Science'};
    size5=[300 75];
    
    %ValueNamesList
    ValNames={'Power', 'Achievement', 'Hedonism', 'Stimulation',...
        'Self-Direction', 'Universalism', 'Benevolence', 'Tradition',...
        'Conformity', 'Security'};
   
    %% Condition Boxes

while~ok
    [ProgCon,ok]=listdlg('ListString',options02,...
        'SelectionMode','single',...
        'ListSize',size01,...
        'Name', dlg_title02,...
        'PromptString', prompt02,...
        'OKString', 'Next');
end
ProgCon=ProgCon-1; %0 = Progress made, 1 = Progress Outstanding
ok=0;
    %% Dialog Box 1
    while ok==1||isnan(Def_Subj_No)||Def_Subj_No<1
        answer1 = inputdlg(prompt1,dlg_title1,size1);
        
        %Converting Variables
        Subj_No=str2double(answer1{1,1});
        Def_Subj_No=Subj_No;
        
        %Error Messages
        if isempty(Subj_No)||isnan(Def_Subj_No)||Def_Subj_No<1
            ErrSub_NO=warndlg(sprintf('Please enter a valid subject number'),...
                '!! Warning !!','modal');
            uiwait(ErrSub_NO)
        end
        
        %ensures that no subject number appears twice
        try
            Data=sortrows(Data,1);
            EmptyCheck=find(diff(Data.SN)>1);
            
            if isempty(EmptyCheck)
                nextlogSN=(1+max(Data.SN));
            else
                nextlogSN=(1+Data.SN(EmptyCheck));
            end
            
            if Data.SN(1)>1
                nextlogSN=1;
            end
            
            if Subj_No==nextlogSN
                Subj_No=nextlogSN;
                ok=0;
            else
                Check=find(Data.SN==Subj_No);
                Resp = questdlg(sprintf(Q1_SNInvalid));
                switch Resp
                    case'Yes'
                        Resp=1;
                    case'No'
                        Resp=0;
                end
                if Resp==1
                    if Def_Group>1||Def_Group<0||Def_Colour>1||...
                            Def_Colour<0||isempty(Def_Group)||...
                            isempty(Def_Colour)||isnan(Def_Group)||...
                            isnan(Def_Colour)||isnan(Def_Subj_No)||...
                            Def_Subj_No<1
                        ok=1;
                        ErrMisc=warndlg(sprintf(Err1_GDInvalid),...
                            '!! Warning !!','modal');
                        uiwait(ErrMisc)
                    else
                        if isempty(Check)
                            Info_Subj_No=msgbox(...
                                'Subject Number accepted',...
                                'New Subject Number');
                            uiwait(Info_Subj_No)
                            ok=0;
                        else
                            ErrSN=warndlg(sprintf(Err1_SNInvalid),...
                                '!! Warning !!','modal');
                            uiwait(ErrSN)
                            
                            Subj_No=nextlogSN;
                            
                            New_Subj_No=num2str(Subj_No);
                            Info='Your Subject Number is: ';
                            InfoText=strcat(Info,New_Subj_No,'.');
                            
                            Info_Subj_No=msgbox(InfoText,...
                                'New Subject Number');
                            uiwait(Info_Subj_No)
                            ok=0;
                        end
                    end
                else
                    ok=1;
                end
            end
            
        catch
            if Subj_No==1
                Subj_No=1;
                ok=0;
            else
                Resp = questdlg(sprintf(Q1_SNInvalid));
                switch Resp
                    case'Yes'
                        Resp=1;
                    case'No'
                        Resp=0;
                end
                if Resp==1
                    if Def_Group>1||Def_Group<0||Def_Colour>1||...
                            Def_Colour<0||isempty(Def_Group)||...
                            isempty(Def_Colour)||isnan(Def_Group)||...
                            isnan(Def_Colour)||isnan(Def_Subj_No)||...
                            Def_Subj_No<1
                        ok=1;
                        ErrMisc=warndlg(sprintf(Err1_GDInvalid),...
                            '!! Invalid Information !!','modal');
                        uiwait(ErrMisc)
                    else
                        Info_Subj_No=msgbox(...
                            'Subject Number accepted',...
                            'New Subject Number');
                        uiwait(Info_Subj_No)
                        ok=0;
                    end
                else
                    ok=1;
                end
            end
        end
    end
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
    
    
    %% Open PT
    Space=KbName('Space');
    Screen('Preference', 'SkipSyncTests', 1);
    [Window,ScreenRect]=Screen('OpenWindow',MainScreen,black);
    [OffWindow]=Screen('OpenOffscreenWindow',MainScreen);
    FlipInterval=Screen('GetFlipInterval', Window);
    HideCursor
    ListenChar(2)
    Priority(0)
    Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    %First Page
    Screen('TextSize', Window, 80);
    [~, ~, ~] = DrawFormattedText(Window, text1_Thank,'center',...
        (ScreenRect(4)./5.*2), white);
    
    Screen('TextSize', Window, 40);
    
    [~, ~, ~] = DrawFormattedText(Window, text1_forparticipate,'center',...
        (ScreenRect(4)./5.*2.5), white);
    
    Screen('TextSize', Window, 20);
    
    [~, ~, ~] = DrawFormattedText(Window, text1_ToAdvance,'center',...
        ((ScreenRect(4)./5).*4), white);
    
    Screen('Flip', Window);
    
    while ~ ok
        
        [KeyIsDown, ~, keyCode] = KbCheck(-1);
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
    
                %% SVS H1
[SVSLikertOutH1,Window]=SVSLikertH1(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,TimetoFillinSecs,test,Version,ValueIndex11,ValueIndex12);


                %% Porgress Manipulation

[ProgOut, Window]=Progress(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,test,ProgCon);

                %% Thermo Measure Values H2
[SVSLikertOutH2,Window]=SVSThermoH2(Space,ok,Window,FlipInterval,OffWindow,ScreenRect,white,black,TimetoFillinSecs,test,Version,ValueIndex21,ValueIndex22);

%x=standardizeMissing(SVSThermoOutH1,99);
%x=x{:,:};
%x(isnan(x))=0;
%SVSThermoOutH1{:,:}=x;

%y=standardizeMissing(SVSThermoOutH2,99);
%y=y{:,:};
%y(isnan(y))=0;
%SVSThermoOutH2{:,:}=y;

%SVSThermoOut=SVSThermoOutH1;

%for i=1:57
%SVSThermoOut{1,14+i}=SVSThermoOutH1{1,14+i}+SVSThermoOutH2{1,14+i};
%end


    %% Close and shut down
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(0)
    
    
catch
    %Close and shut down
    Priority(0)
    close ALL
    ShowCursor
    Screen('CloseAll');
    ListenChar(1)
    PsychHID('KbQueueFlush',-1,3)
    s=lasterror;
    SVSThermoOut=table(99);
    SVSThermoOut.Properties.VariableNames{1}='ErrorA';
    AltOut=table(99);
    AltOut.Properties.VariableNames{1}='ErrorB';
    PolicyOut=table(99);
    PolicyOut.Properties.VariableNames{1}='ErrorC';
end

%Open white Screen 1
Screen1=figure('position',ScreenRect,'menubar','none','color',color,...
    'Name',ScreenTitle1,'IntegerHandle','off');

%Dialog Box 2
while isempty(Def_Subj_Age)||Def_Subj_Age<1||mod(Def_Subj_Age,1)>0||...
        isnan(Def_Subj_Age)
    answer2 = inputdlg(prompt2,dlg_title2,size2);
    
    %Converting
    Subj_Age=str2double(cell2mat(answer2(1,1)));
    Def_Subj_Age=Subj_Age;
    
    %Error Messages
    if isempty(Def_Subj_Age)
        ErrGoal=warndlg(sprintf('Please enter your age'),...
            '!! Warning !!','modal');
        uiwait(ErrGoal)
    end
    if Def_Subj_Age<1
        ErrSubAge=warndlg(sprintf('Please enter a valid age'),...
            '!! Warning !!','modal');
        uiwait(ErrSubAge)
    end
    if mod(Def_Subj_Age,1)>0
        ErrSubAge=warndlg(sprintf('Please enter a valid age'),...
            '!! Warning !!','modal');
        uiwait(ErrSubAge)
    end
    if isnan(Def_Subj_Age)
        ErrEmSubAge=warndlg(sprintf('Please enter a valid age'),...
            '!! Warning !!','modal');
        uiwait(ErrEmSubAge)
    end
end
ok=0;

%Dropdown 1
while~ok
    [Subj_Gender,ok]=listdlg('ListString',options1,...
        'SelectionMode','single',...
        'ListSize',size3,...
        'Name', dlg_title3,...
        'PromptString', prompt3,...
        'OKString', 'Next');
end
switch Subj_Gender      %wanted female to appear first in the list but have
    case 1              %the higher number in my output labels. Obviously,
        Subj_Gender=2;  %I did this for P.C. ... and because I
    case 2              %wanted to use "switch" somewhere...
        Subj_Gender=1;  %and P.C. of course.
end
ok=0;

%Dropdown 2
while~ok
    [Subj_Occup,ok]=listdlg('ListString',options2,...
        'SelectionMode','single',...
        'ListSize',size4,...
        'Name', 'Occupation',...
        'PromptString', prompt4,...
        'OKString', 'Next');
end
ok=0;

%Optional Dropdown 3
if Subj_Occup==1
    while~ok
        [Subj_School,ok]=listdlg('ListString',options3,...
            'SelectionMode','single',...
            'ListSize',size5,...
            'Name', 'School',...
            'PromptString', prompt5,...
            'OKString', 'Next');
    end
    ok=0;
else
    Subj_School=99;
end
uiwait(msgbox('Thank you for participating! Please call the experimenter!','THANK YOU!','modal'))
close ALL

%% Exporting Data
Subj_No=table(Subj_No);
Progress_Condition=table(ProgCon);
Descriptives=table(Subj_Age, Subj_Gender, Subj_Occup, Subj_School);
Data_Results=[Subj_No Progress_Condition SVSLikertOutH1 ProgOut SVSLikertOutH2 Descriptives];

%Data=Data_Results;
try
    Data.Properties.VariableNames=Data_Results.Properties.VariableNames;
    Data=[Data; Data_Results];
catch
    Data=Data_Results;
end
cd('C:\Users\Lukas Litzellachner\OneDrive\PhD\Values as Goals\Program')
CD=cd;
SubFolder='\Data\';
Name='ValGoalStudy';
Name2=strcat(Name,'_',num2str(Subj_No{1,1}));
FileType='.xlsx';
FileName=strcat(CD,SubFolder,Name,FileType);
FileName2=strcat(CD,SubFolder,Name2,FileType);

writetable(Data,FileName,'Sheet',1)
writetable(Data_Results,FileName2,'Sheet',1)
