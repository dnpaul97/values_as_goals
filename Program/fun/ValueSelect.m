function [ValueIndex11, ValueIndex12, ValueIndex21, ValueIndex22]=ValueSelect
rng 'shuffle'
Universalism=[1 2 17 24 26 29 30 35 38];
Benevolence=[6 10 19 28 33 45 49 52 54];
Power=[3 12 23 27 46];
Achievement=[34 39 43 48 55];
Hedonism=[4 50 57];
Stimulation=[9 25 37];
SelfDirection=[5 14 16 21 31 41 53];

UN1=Universalism(randperm(length(Universalism)));
coin=rand(1);
if coin>.5
    UN2=UN1(ceil(length(Universalism)./2)+1:length(Universalism));
    UN1=UN1(1:ceil(length(Universalism)./2));
else
    UN2=UN1(floor(length(Universalism)./2)+1:length(Universalism));
    UN1=UN1(1:floor(length(Universalism)./2));
end
UN11=find(UN1<31);
UN12=find(UN1>30);
UN11=UN1(UN11);
UN12=UN1(UN12);
UN21=find(UN2<31);
UN22=find(UN2>30);
UN21=UN2(UN21);
UN22=UN2(UN22);

BE1=Benevolence(randperm(length(Benevolence)));
coin=rand(1);
if coin>.5
    BE2=BE1(ceil(length(Benevolence)./2)+1:length(Benevolence));
    BE1=BE1(1:ceil(length(Benevolence)./2));
else
    BE2=BE1(floor(length(Benevolence)./2)+1:length(Benevolence));
    BE1=BE1(1:floor(length(Benevolence)./2));
end
BE11=find(BE1<31);
BE12=find(BE1>30);
BE11=BE1(BE11);
BE12=BE1(BE12);
BE21=find(BE2<31);
BE22=find(BE2>30);
BE21=BE2(BE21);
BE22=BE2(BE22);


PO1=Power(randperm(length(Power)));
coin=rand(1);
if coin>.5
    PO2=PO1(ceil(length(Power)./2)+1:length(Power));
    PO1=PO1(1:ceil(length(Power)./2));
else
    PO2=PO1(floor(length(Power)./2)+1:length(Power));
    PO1=PO1(1:floor(length(Power)./2));
end
PO11=find(PO1<31);
PO12=find(PO1>30);
PO11=PO1(PO11);
PO12=PO1(PO12);
PO21=find(PO2<31);
PO22=find(PO2>30);
PO21=PO2(PO21);
PO22=PO2(PO22);

AC1=Achievement(randperm(length(Achievement)));
coin=rand(1);
if coin>.5
    AC2=AC1(ceil(length(Achievement)./2)+1:length(Achievement));
    AC1=AC1(1:ceil(length(Achievement)./2));
else
    AC2=AC1(floor(length(Achievement)./2)+1:length(Achievement));
    AC1=AC1(1:floor(length(Achievement)./2));
end
AC11=find(AC1<31);
AC12=find(AC1>30);
AC11=AC1(AC11);
AC12=AC1(AC12);
AC21=find(AC2<31);
AC22=find(AC2>30);
AC21=AC2(AC21);
AC22=AC2(AC22);

HE1=Hedonism(randperm(length(Hedonism)));
coin=rand(1);
if coin>.5
    HE2=HE1(ceil(length(Hedonism)./2)+1:length(Hedonism));
    HE1=HE1(1:ceil(length(Hedonism)./2));
else
    HE2=HE1(floor(length(Hedonism)./2)+1:length(Hedonism));
    HE1=HE1(1:floor(length(Hedonism)./2));
end
HE11=find(HE1<31);
HE12=find(HE1>30);
HE11=HE1(HE11);
HE12=HE1(HE12);
HE21=find(HE2<31);
HE22=find(HE2>30);
HE21=HE2(HE21);
HE22=HE2(HE22);

ST1=Stimulation(randperm(length(Stimulation)));
coin=rand(1);
if coin>.5
    ST2=ST1(ceil(length(Stimulation)./2)+1:length(Stimulation));
    ST1=ST1(1:ceil(length(Stimulation)./2));
else
    ST2=ST1(floor(length(Stimulation)./2)+1:length(Stimulation));
    ST1=ST1(1:floor(length(Stimulation)./2));
end
ST11=find(ST1<31);
ST12=find(ST1>30);
ST11=ST1(ST11);
ST12=ST1(ST12);
ST21=find(ST2<31);
ST22=find(ST2>30);
ST21=ST2(ST21);
ST22=ST2(ST22);

SD1=SelfDirection(randperm(length(SelfDirection)));
coin=rand(1);
if coin>.5
    SD2=SD1(ceil(length(SelfDirection)./2)+1:length(SelfDirection));
    SD1=SD1(1:ceil(length(SelfDirection)./2));
else
    SD2=SD1(floor(length(SelfDirection)./2)+1:length(SelfDirection));
    SD1=SD1(1:floor(length(SelfDirection)./2));
end
SD11=find(SD1<31);
SD12=find(SD1>30);
SD11=SD1(SD11);
SD12=SD1(SD12);
SD21=find(SD2<31);
SD22=find(SD2>30);
SD21=SD2(SD21);
SD22=SD2(SD22);

ValueIndex11=[UN11 BE11 PO11 AC11 HE11 ST11 SD11];
ValueIndex11=ValueIndex11(randperm(length(ValueIndex11)));
ValueIndex12=[UN12 BE12 PO12 AC12 HE12 ST12 SD12];
ValueIndex12=ValueIndex12(randperm(length(ValueIndex12)));
ValueIndex21=[UN21 BE21 PO21 AC21 HE21 ST21 SD21];
ValueIndex21=ValueIndex21(randperm(length(ValueIndex21)));
ValueIndex22=[UN22 BE22 PO22 AC22 HE22 ST22 SD22];
ValueIndex22=ValueIndex22(randperm(length(ValueIndex22)));
end
