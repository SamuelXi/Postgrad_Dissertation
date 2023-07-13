%% Compile filePath
% No need to get the folder and file path when running the modelFitting2nd as all
% paths have been saved to the workspace
noCon1 = readtable(filePathNoConR1);
noCon2 = readtable(filePathNoConR2);
noCon3 = readtable(filePathNoConR3);
noCon4 = readtable(filePathNoConR4);
noCon5 = readtable(filePathNoConR5);
con1 = readtable(filePathConR1);
con2 = readtable(filePathConR2);
con3 = readtable(filePathConR3);
con4 = readtable(filePathConR4);
con5 = readtable(filePathConR5);

%% Compare and select winning model
% For one Condition
noCon1.AICc_1_
noConSumAICc1 = sum(noCon1.AICc_1_);
noConSumAICc2 = sum(noCon2.AICc_2_);
noConSumAICc3 = sum(noCon3.AICc_3_);
noConSumAICc4 = sum(noCon4.AICc_4_);
noConSumAICc5 = sum(noCon5.AICc_5_);

noConSumBIC1 = sum(noCon1.BIC_1_);
noConSumBIC2 = sum(noCon2.BIC_2_);
noConSumBIC3 = sum(noCon3.BIC_3_);
noConSumBIC4 = sum(noCon4.BIC_4_);
noConSumBIC5 = sum(noCon5.BIC_5_);

ConSumAICc1 = sum(con1.AICc_1_);
ConSumAICc2 = sum(con2.AICc_2_);
ConSumAICc3 = sum(con3.AICc_3_);
ConSumAICc4 = sum(con4.AICc_4_);
ConSumAICc5 = sum(con5.AICc_5_);

ConSumBIC1 = sum(con1.BIC_1_);
ConSumBIC2 = sum(con2.BIC_2_);
ConSumBIC3 = sum(con3.BIC_3_);
ConSumBIC4 = sum(con4.BIC_4_);
ConSumBIC5 = sum(con5.BIC_5_);

noConAICc1Result = [noConSumAICc1,noConSumAICc2,noConSumAICc3,noConSumAICc4,noConSumAICc5]
noConBIC1Result = [noConSumBIC1,noConSumBIC2,noConSumBIC3,noConSumBIC4,noConSumBIC5]
ConSumAICcResult = [ConSumAICc1,ConSumAICc2,ConSumAICc3,ConSumAICc4,ConSumAICc5]
ConSumBICResult = [ConSumBIC1,ConSumBIC2,ConSumBIC3,ConSumBIC4,ConSumBIC5]

% for one condition, the model 5 is the best
% for two conditions, could be model 3 or model 5
% Selecting model 5 for the two conditions in this case

%% Parameters setup
% No condition group
vNoAnxG1 = [];
vAnxG1 = [];
aNoAnxG1 = [];
aAnxG1 = [];
zNoAnxG1 = [];
zAnxG1 = [];
TerNoAnxG1 = [];
TerAnxG1 = [];
szNoAnxG1 = [];
szAnxG1 = [];
stNoAnxG1 = [];
stAnxG1 = [];
etaNoAnxG1 = [];
etaAnxG1 = [];

% Condition group
vNoAnxG2 = [];
vAnxG2 = [];
aNoAnxG2 = [];
aAnxG2 = [];
zNoAnxG2 = [];
zAnxG2 = [];
TerNoAnxG2 = [];
TerAnxG2 = [];
szNoAnxG2 = [];
szAnxG2 = [];
stNoAnxG2 = [];
stAnxG2 = [];
etaNoAnxG2 = [];
etaAnxG2 = [];

% Condition for Separation
vNoAnxG2_Sep_101 = [];
vAnxG2_Sep_101 = [];
aNoAnxG2_Sep_101 = [];
aAnxG2_Sep_101 = [];
zNoAnxG2_Sep_101 = [];
zAnxG2_Sep_101 = [];
TerNoAnxG2_Sep_101 = [];
TerAnxG2_Sep_101 = [];
szNoAnxG2_Sep_101 = [];
szAnxG2_Sep_101 = [];
stNoAnxG2_Sep_101 = [];
stAnxG2_Sep_101 = [];
etaNoAnxG2_Sep_101 = [];
etaAnxG2_Sep_101 = [];

vNoAnxG2_Sep_102 = [];
vAnxG2_Sep_102 = [];
aNoAnxG2_Sep_102 = [];
aAnxG2_Sep_102 = [];
zNoAnxG2_Sep_102 = [];
zAnxG2_Sep_102 = [];
TerNoAnxG2_Sep_102 = [];
TerAnxG2_Sep_102 = [];
szNoAnxG2_Sep_102 = [];
szAnxG2_Sep_102 = [];
stNoAnxG2_Sep_102 = [];
stAnxG2_Sep_102 = [];
etaNoAnxG2_Sep_102 = [];
etaAnxG2_Sep_102 = [];

v_Sep_101 = [];
a_Sep_101 = [];
z_Sep_101 = [];
Ter_Sep_101 = [];
sz_Sep_101 = [];
st_Sep_101 = [];
eta_Sep_101 = [];

v_Sep_102 = [];
a_Sep_102 = [];
z_Sep_102 = [];
Ter_Sep_102 = [];
sz_Sep_102 = [];
st_Sep_102 = [];
eta_Sep_102 = [];

v_Sep_101 = con5.v_101_;
a_Sep_101 = con5.a_101_;
z_Sep_101 = con5.z_101_;
Ter_Sep_101 = con5.Ter_101_;
sz_Sep_101 = con5.sz_101_;
st_Sep_101 = con5.st_101_;
eta_Sep_101 = con5.eta_101_;
v_Sep_102 = con5.v_102_;
a_Sep_102 = con5.a_102_;
z_Sep_102 = con5.z_102_;
Ter_Sep_102 = con5.Ter_102_;
sz_Sep_102 = con5.sz_102_;
st_Sep_102 = con5.st_102_;
eta_Sep_102 = con5.eta_102_;


%% Comparing between anxious and non annxious group for all parameter values
% % Group size
% anxSize = size(anxPar);
% anxNoSize = size(anxNoPar);

% Extract participant information
for i = 1:115
    % One condition
    if ismember(noCon5(i,:).participantsID, anxNoPar)
        %Extract v value
        vNoAnxG1 = [vNoAnxG1,noCon5(i,:).v];
        %Extract a value
        aNoAnxG1 = [aNoAnxG1,noCon5(i,:).a];
        %Extract z value
        zNoAnxG1 = [zNoAnxG1,noCon5(i,:).z];
        %Extract Ter value
        TerNoAnxG1 = [TerNoAnxG1,noCon5(i,:).Ter];
        %Extract sz value
        szNoAnxG1 = [szNoAnxG1,noCon5(i,:).sz];
        %Extract st value
        stNoAnxG1 = [stNoAnxG1,noCon5(i,:).st];
        %Extract eta value
        etaNoAnxG1 = [etaNoAnxG1,noCon5(i,:).eta];

    elseif ismember(noCon5(i,:).participantsID, anxPar)
        %Extract v value
        vAnxG1 = [vAnxG1,noCon5(i,:).v];
        %Extract a value
        aAnxG1 = [aAnxG1,noCon5(i,:).a];
        %Extract z value
        zAnxG1 = [zAnxG1,noCon5(i,:).z];
        %Extract Ter value
        TerAnxG1 = [TerAnxG1,noCon5(i,:).Ter];
        %Extract sz value
        szAnxG1 = [szAnxG1,noCon5(i,:).sz];
        %Extract st value
        stAnxG1 = [stAnxG1,noCon5(i,:).st];
        %Extract eta value
        etaAnxG1 = [etaAnxG1,noCon5(i,:).eta];
    end
    
    % Two Condtion
    % % condition 101
    % if ismember(con5(i,:).participantsID, anxNoPar)
    %     %Extract v value
    %     vNoAnxG2 = [vNoAnxG2,con5(i,:).v_101_];
    %     %Extract a value
    %     aNoAnxG2 = [aNoAnxG2,con5(i,:).a_101_];
    %     %Extract z value
    %     zNoAnxG2 = [zNoAnxG2,con5(i,:).z_101_];
    %     %Extract Ter value
    %     TerNoAnxG2 = [TerNoAnxG2,con5(i,:).Ter_101_];
    %     %Extract sz value
    %     szNoAnxG2 = [szNoAnxG2,con5(i,:).sz_101_];
    %     %Extract st value
    %     stNoAnxG2 = [stNoAnxG2,con5(i,:).st_101_];
    %     %Extract eta value
    %     etaNoAnxG2 = [etaNoAnxG2,con5(i,:).eta_101_];
    % 
    % elseif ismember(con5(i,:).participantsID, anxPar)
    %     %Extract v value
    %     vAnxG2 = [vAnxG2,con5(i,:).v_101_];
    %     %Extract a value
    %     aAnxG2 = [aAnxG2,con5(i,:).a_101_];
    %     %Extract z value
    %     zAnxG2 = [zAnxG2,con5(i,:).z_101_];
    %     %Extract Ter value
    %     TerAnxG2 = [TerAnxG2,con5(i,:).Ter_101_];
    %     %Extract sz value
    %     szAnxG2 = [szAnxG2,con5(i,:).sz_101_];
    %     %Extract st value
    %     stAnxG2 = [stAnxG2,con5(i,:).st_101_];
    %     %Extract eta value
    %     etaAnxG2 = [etaAnxG2,con5(i,:).eta_101_];
    % end

    %Condtion Separated 101
    if ismember(con5(i,:).participantsID, anxNoPar)
        %Extract v value
        vNoAnxG2_Sep_101 = [vNoAnxG2_Sep_101,con5(i,:).v_101_];
        %Extract a value
        aNoAnxG2_Sep_101 = [aNoAnxG2_Sep_101,con5(i,:).a_101_];
        %Extract z value
        zNoAnxG2_Sep_101 = [zNoAnxG2_Sep_101,con5(i,:).z_101_];
        %Extract Ter value
        TerNoAnxG2_Sep_101 = [TerNoAnxG2_Sep_101,con5(i,:).Ter_101_];
        %Extract sz value
        szNoAnxG2_Sep_101 = [szNoAnxG2_Sep_101,con5(i,:).sz_101_];
        %Extract st value
        stNoAnxG2_Sep_101 = [stNoAnxG2_Sep_101,con5(i,:).st_101_];
        %Extract eta value
        etaNoAnxG2_Sep_101 = [etaNoAnxG2_Sep_101,con5(i,:).eta_101_];

    elseif ismember(con5(i,:).participantsID, anxPar)
        %Extract v value
        vAnxG2_Sep_101 = [vAnxG2_Sep_101,con5(i,:).v_101_];
        %Extract a value
        aAnxG2_Sep_101 = [aAnxG2_Sep_101,con5(i,:).a_101_];
        %Extract z value
        zAnxG2_Sep_101 = [zAnxG2_Sep_101,con5(i,:).z_101_];
        %Extract Ter value
        TerAnxG2_Sep_101 = [TerAnxG2_Sep_101,con5(i,:).Ter_101_];
        %Extract sz value
        szAnxG2_Sep_101 = [szAnxG2_Sep_101,con5(i,:).sz_101_];
        %Extract st value
        stAnxG2_Sep_101 = [stAnxG2_Sep_101,con5(i,:).st_101_];
        %Extract eta value
        etaAnxG2_Sep_101 = [etaAnxG2_Sep_101,con5(i,:).eta_101_];
    end

    %Condtion Separated 102
    if ismember(con5(i,:).participantsID, anxNoPar)
        %Extract v value
        vNoAnxG2_Sep_102 = [vNoAnxG2_Sep_102,con5(i,:).v_102_];
        %Extract a value
        aNoAnxG2_Sep_102 = [aNoAnxG2_Sep_102,con5(i,:).a_102_];
        %Extract z value
        zNoAnxG2_Sep_102 = [zNoAnxG2_Sep_102,con5(i,:).z_102_];
        %Extract Ter value
        TerNoAnxG2_Sep_102 = [TerNoAnxG2_Sep_102,con5(i,:).Ter_102_];
        %Extract sz value
        szNoAnxG2_Sep_102 = [szNoAnxG2_Sep_102,con5(i,:).sz_102_];
        %Extract st value
        stNoAnxG2_Sep_102 = [stNoAnxG2_Sep_102,con5(i,:).st_102_];
        %Extract eta value
        etaNoAnxG2_Sep_102 = [etaNoAnxG2_Sep_102,con5(i,:).eta_102_];

    elseif ismember(ConSep5_102(i,:).participantsID, anxPar)
        %Extract v value
        vAnxG2_Sep_102 = [vAnxG2_Sep_102,con5(i,:).v_102_];
        %Extract a value
        aAnxG2_Sep_102 = [aAnxG2_Sep_102,con5(i,:).a_102_];
        %Extract z value
        zAnxG2_Sep_102 = [zAnxG2_Sep_102,con5(i,:).z_102_];
        %Extract Ter value
        TerAnxG2_Sep_102 = [TerAnxG2_Sep_102,con5(i,:).Ter_102_];
        %Extract sz value
        szAnxG2_Sep_102 = [szAnxG2_Sep_102,con5(i,:).sz_102_];
        %Extract st value
        stAnxG2_Sep_102 = [stAnxG2_Sep_102,con5(i,:).st_102_];
        %Extract eta value
        etaAnxG2_Sep_102 = [etaAnxG2_Sep_102,con5(i,:).eta_102_];
    end

end


%% T-test（One condition)

% v parameter
[h1, p1, ci1, stats1] = ttest2(vNoAnxG1,vAnxG1);
% a parameter
[h3, p3, ci3, stats3] = ttest2(aNoAnxG1,aAnxG1);
% z parameter
[h5, p5, ci5, stats5] = ttest2(zNoAnxG1,zAnxG1);
% Ter parameter
[h7, p7, ci7, stats7] = ttest2(TerNoAnxG1,TerAnxG1);
% sz parameter
[h9, p9, ci9, stats9] = ttest2(szNoAnxG1,szAnxG1); 
% st parameter
[h11, p11, ci11, stats11] = ttest2(stNoAnxG1,stAnxG1);
% eta parameter
[h13, p13, ci13, stats13] = ttest2(etaNoAnxG1,etaAnxG1);

fprintf('_____________One Condition v t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats1.tstat);
fprintf('p-value: %.4f\n', p1);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci1(1), ci1(2));
fprintf('\n')

fprintf('_____________One Condition a t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats3.tstat);
fprintf('p-value: %.4f\n', p3);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci3(1), ci3(2));
fprintf('\n')

fprintf('_____________One Condition z t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats5.tstat);
fprintf('p-value: %.4f\n', p5);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci5(1), ci5(2));
fprintf('\n')

fprintf('____________One Condition Ter t-test____________\n');
fprintf('t-statistic: %.4f\n', stats7.tstat);
fprintf('p-value: %.4f\n', p7);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci7(1), ci7(2));
fprintf('\n')

fprintf('____________One Condition sz t-test____________\n');
fprintf('t-statistic: %.4f\n', stats9.tstat);
fprintf('p-value: %.4f\n', p9);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci9(1), ci9(2));
fprintf('\n')

fprintf('____________One Condition st t-test____________\n');
fprintf('t-statistic: %.4f\n', stats11.tstat);
fprintf('p-value: %.4f\n', p11);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci11(1), ci11(2));
fprintf('\n')

fprintf('____________One Condition eta t-test____________\n');
fprintf('t-statistic: %.4f\n', stats13.tstat);
fprintf('p-value: %.4f\n', p13);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci13(1), ci13(2));
fprintf('\n')
%% Two conditioned
% 101 vs 102 (compare without seperating the anx and non anx)
% v parameter
[h2, p2, ci2, stats2] = ttest2(vNoAnxG2,vAnxG2); %Condition

% a parameter
[h4, p4, ci4, stats4] = ttest2(aNoAnxG2,aAnxG2); %Condition

% z parameter
[h6, p6, ci6, stats6] = ttest2(zNoAnxG2,zAnxG2); %Condition

% Ter parameter
[h8, p8, ci8, stats8] = ttest2(TerNoAnxG2,TerAnxG2); %Condition

% sz parameter
[h10, p10, ci10, stats10] = ttest2(szNoAnxG2,szAnxG2); %Condition

% st parameter
[h12, p12, ci12, stats12] = ttest2(stNoAnxG2,stAnxG2); %Condition

% eta parameter
[h14, p14, ci14, stats14] = ttest2(etaNoAnxG2,etaAnxG2); %Condition



% Display the results

fprintf('______________Condition v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats2.tstat);
fprintf('p-value: %.4f\n', p2);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci2(1), ci2(2));
fprintf("\n");

fprintf('______________Condition a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats4.tstat);
fprintf('p-value: %.4f\n', p4);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci4(1), ci4(2));
fprintf("\n");

fprintf('______________Condition z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats6.tstat);
fprintf('p-value: %.4f\n', p6);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci6(1), ci6(2));
fprintf("\n");

fprintf('_____________Condition Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats8.tstat);
fprintf('p-value: %.4f\n', p8);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci8(1), ci8(2));
fprintf("\n");

fprintf('_____________Condition sz t-test______________\n');
fprintf('t-statistic: %.4f\n', stats10.tstat);
fprintf('p-value: %.4f\n', p10);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci10(1), ci10(2));
fprintf("\n");

fprintf('_____________Condition st t-test______________\n');
fprintf('t-statistic: %.4f\n', stats12.tstat);
fprintf('p-value: %.4f\n', p12);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci12(1), ci12(2));
fprintf("\n");

fprintf('_____________Condition eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats14.tstat);
fprintf('p-value: %.4f\n', p14);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci14(1), ci14(2));
fprintf("\n");

%% Seperate test
% Compare 101 and 102 for all value 
% v parameter
[h15, p15, ci15, stats15] = ttest2(v_Sep_101,v_Sep_102); 

% a parameter
[h16, p16, ci16, stats16] = ttest2(a_Sep_101,a_Sep_102); 

% z parameter
[h17, p17, ci17, stats17] = ttest2(z_Sep_101,z_Sep_102); 

% Ter parameter
[h18, p18, ci18, stats18] = ttest2(Ter_Sep_101,Ter_Sep_102); 

% sz parameter
[h19, p19, ci19, stats19] = ttest2(sz_Sep_101,sz_Sep_101); 

% st parameter
[h20, p20, ci20, stats20] = ttest2(st_Sep_101,st_Sep_102); 

% eta parameter
[h21, p21, ci21, stats21] = ttest2(eta_Sep_101,eta_Sep_102); 
fprintf('Compare 101 and 102 for all value\n')
fprintf('______________Condition(Separate fitting) v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats15.tstat);
fprintf('p-value: %.4f\n', p15);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci15(1), ci15(2));
fprintf("\n");
fprintf('______________Condition(Separate fitting) a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats16.tstat);
fprintf('p-value: %.4f\n', p16);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci16(1), ci16(2));
fprintf("\n");
fprintf('______________Condition(Separate fitting) z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats17.tstat);
fprintf('p-value: %.4f\n', p17);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci17(1), ci17(2));
fprintf("\n");
fprintf('_____________Condition(Separate fitting) Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats18.tstat);
fprintf('p-value: %.4f\n', p18);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci18(1), ci18(2));
fprintf("\n");
fprintf('_____________Condition(Separate fitting) sz t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats19.tstat);
fprintf('p-value: %.4f\n', p19);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci19(1), ci19(2));
fprintf("\n");
fprintf('_____________Condition(Separate fitting) st t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats20.tstat);
fprintf('p-value: %.4f\n', p20);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci20(1), ci20(2));
fprintf("\n");
fprintf('_____________Condition(Separate fitting) eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats21.tstat);
fprintf('p-value: %.4f\n', p21);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci21(1), ci21(2));
fprintf("\n");


%% Compare between group 101 anx and Non anx

% T test setup 
% v parameter
[h22, p22, ci22, stats22] = ttest2(vNoAnxG2_Sep_101,vAnxG2_Sep_101); 

% a parameter
[h23, p23, ci23, stats23] = ttest2(aNoAnxG2_Sep_101,aAnxG2_Sep_101); 

% z parameter
[h24, p24, ci24, stats24] = ttest2(zNoAnxG2_Sep_101,zAnxG2_Sep_101); 

% Ter parameter
[h25, p25, ci25, stats25] = ttest2(TerNoAnxG2_Sep_101,TerAnxG2_Sep_101); 

% sz parameter
[h26, p26, ci26, stats26] = ttest2(szNoAnxG2_Sep_101,szAnxG2_Sep_101); 

% st parameter
[h27, p27, ci27, stats27] = ttest2(stNoAnxG2_Sep_101,stAnxG2_Sep_101); 

% eta parameter
[h28, p28, ci28, stats28] = ttest2(etaNoAnxG2_Sep_101,etaAnxG2_Sep_101); 

fprintf('Compare between anx and Non anx (Condition 101)\n')
fprintf('______________101 Anx & Non Anx(Separate fitting) v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats22.tstat);
fprintf('p-value: %.4f\n', p22);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci22(1), ci22(2));
fprintf("\n");
fprintf('______________101 Anx & Non Anx(Separate fitting) a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats23.tstat);
fprintf('p-value: %.4f\n', p23);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci23(1), ci23(2));
fprintf("\n");
fprintf('______________101 Anx & Non Anx(Separate fitting) z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats24.tstat);
fprintf('p-value: %.4f\n', p24);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci24(1), ci24(2));
fprintf("\n");
fprintf('_____________101 Anx & Non Anx(Separate fitting) Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats25.tstat);
fprintf('p-value: %.4f\n', p25);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci25(1), ci25(2));
fprintf("\n");
fprintf('_____________101 Anx & Non Anx(Separate fitting) sz t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats26.tstat);
fprintf('p-value: %.4f\n', p26);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci26(1), ci26(2));
fprintf("\n");
fprintf('_____________101 Anx & Non Anx(Separate fitting) st t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats27.tstat);
fprintf('p-value: %.4f\n', p27);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci27(1), ci27(2));
fprintf("\n");
fprintf('_____________101 Anx & Non Anx(Separate fitting) eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats28.tstat);
fprintf('p-value: %.4f\n', p28);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci28(1), ci28(2));
fprintf("\n");

%% Compare between group 102 anx and Non anx

% T test setup 
% v parameter
[h29, p29, ci29, stats29] = ttest2(vNoAnxG2_Sep_102,vAnxG2_Sep_102); 

% a parameter
[h30, p30, ci30, stats30] = ttest2(aNoAnxG2_Sep_102,aAnxG2_Sep_102); 

% z parameter
[h31, p31, ci31, stats31] = ttest2(zNoAnxG2_Sep_102,zAnxG2_Sep_102); 

% Ter parameter
[h32, p32, ci32, stats32] = ttest2(TerNoAnxG2_Sep_102,TerAnxG2_Sep_102); 

% sz parameter
[h33, p33, ci33, stats33] = ttest2(szNoAnxG2_Sep_102,szAnxG2_Sep_102); 

% st parameter
[h34, p34, ci34, stats34] = ttest2(stNoAnxG2_Sep_102,stAnxG2_Sep_102); 

% eta parameter
[h35, p35, ci35, stats35] = ttest2(etaNoAnxG2_Sep_102,etaAnxG2_Sep_102); 

fprintf('Compare between anx and Non anx (Condition 102)\n')
fprintf('______________102 Anx & Non Anx(Separate fitting) v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats29.tstat);
fprintf('p-value: %.4f\n', p29);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci29(1), ci29(2));
fprintf("\n");
fprintf('______________102 Anx & Non Anx(Separate fitting) a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats30.tstat);
fprintf('p-value: %.4f\n', p30);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci30(1), ci30(2));
fprintf("\n");
fprintf('______________102 Anx & Non Anx(Separate fitting) z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats31.tstat);
fprintf('p-value: %.4f\n', p31);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci31(1), ci31(2));
fprintf("\n");
fprintf('_____________102 Anx & Non Anx(Separate fitting) Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats32.tstat);
fprintf('p-value: %.4f\n', p32);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci32(1), ci32(2));
fprintf("\n");
fprintf('_____________102 Anx & Non Anx(Separate fitting) sz t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats33.tstat);
fprintf('p-value: %.4f\n', p33);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci33(1), ci33(2));
fprintf("\n");
fprintf('_____________102 Anx & Non Anx(Separate fitting) st t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats34.tstat);
fprintf('p-value: %.4f\n', p34);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci27(1), ci27(2));
fprintf("\n");
fprintf('_____________102 Anx & Non Anx(Separate fitting) eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats35.tstat);
fprintf('p-value: %.4f\n', p35);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci35(1), ci35(2));
fprintf("\n");


%% Compare between condition 101 and 102 anx

% T test setup 
% v parameter
[h36, p36, ci36, stats36] = ttest2(vAnxG2_Sep_101,vAnxG2_Sep_102); 

% a parameter
[h37, p37, ci37, stats37] = ttest2(aAnxG2_Sep_101,aAnxG2_Sep_102); 

% z parameter
[h38, p38, ci38, stats38] = ttest2(zAnxG2_Sep_101,zAnxG2_Sep_102); 

% Ter parameter
[h39, p39, ci39, stats39] = ttest2(TerAnxG2_Sep_101,TerAnxG2_Sep_102); 

% sz parameter
[h40, p40, ci40, stats40] = ttest2(szAnxG2_Sep_101,szAnxG2_Sep_102); 

% st parameter
[h41, p41, ci41, stats41] = ttest2(stAnxG2_Sep_101,stAnxG2_Sep_102); 

% eta parameter
[h42, p42, ci42, stats42] = ttest2(etaAnxG2_Sep_101,etaAnxG2_Sep_102); 

fprintf('Compare between conditions 101 and 102 (anx)\n')
fprintf('______________101 and 102 anx(Separate fitting) v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats36.tstat);
fprintf('p-value: %.4f\n', p36);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci36(1), ci36(2));
fprintf("\n");
fprintf('______________101 and 102 anx(Separate fitting) a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats37.tstat);
fprintf('p-value: %.4f\n', p37);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci37(1), ci37(2));
fprintf("\n");
fprintf('______________101 and 102 anx(Separate fitting) z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats38.tstat);
fprintf('p-value: %.4f\n', p38);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci38(1), ci38(2));
fprintf("\n");
fprintf('_____________101 and 102 anx(Separate fitting) Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats39.tstat);
fprintf('p-value: %.4f\n', p39);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci39(1), ci39(2));
fprintf("\n");
fprintf('_____________101 and 102 anx(Separate fitting) sz t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats40.tstat);
fprintf('p-value: %.4f\n', p40);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci40(1), ci40(2));
fprintf("\n");
fprintf('_____________101 and 102 anx(Separate fitting) st t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats41.tstat);
fprintf('p-value: %.4f\n', p41);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci41(1), ci41(2));
fprintf("\n");
fprintf('_____________101 and 102 anx(Separate fitting) eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats42.tstat);
fprintf('p-value: %.4f\n', p42);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci42(1), ci42(2));
fprintf("\n");

%% Compare between condition 101 and 102 Non anx

% T test setup 
% v parameter
[h43, p43, ci43, stats43] = ttest2(vNoAnxG2_Sep_101,vNoAnxG2_Sep_102); 

% a parameter
[h44, p44, ci44, stats44] = ttest2(aNoAnxG2_Sep_101,aNoAnxG2_Sep_102); 

% z parameter
[h45, p45, ci45, stats45] = ttest2(zNoAnxG2_Sep_101,zNoAnxG2_Sep_102); 

% Ter parameter
[h46, p46, ci46, stats46] = ttest2(TerNoAnxG2_Sep_101,TerNoAnxG2_Sep_102); 

% sz parameter
[h47, p47, ci47, stats47] = ttest2(szNoAnxG2_Sep_101,szNoAnxG2_Sep_102); 

% st parameter
[h48, p48, ci48, stats48] = ttest2(stNoAnxG2_Sep_101,stNoAnxG2_Sep_102); 

% eta parameter
[h49, p49, ci49, stats49] = ttest2(etaNoAnxG2_Sep_101,etaNoAnxG2_Sep_102); 

fprintf('Compare between conditions 101 and 102 (Non anx)\n')
fprintf('______________101 and 102 Non anx(Separate fitting) v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats43.tstat);
fprintf('p-value: %.4f\n', p43);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci43(1), ci43(2));
fprintf("\n");
fprintf('______________101 and 102 Non anx(Separate fitting) a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats44.tstat);
fprintf('p-value: %.4f\n', p44);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci44(1), ci44(2));
fprintf("\n");
fprintf('______________101 and 102 Non anx(Separate fitting) z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats45.tstat);
fprintf('p-value: %.4f\n', p45);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci45(1), ci45(2));
fprintf("\n");
fprintf('_____________101 and 102 Non anx(Separate fitting) Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats46.tstat);
fprintf('p-value: %.4f\n', p46);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci46(1), ci46(2));
fprintf("\n");
fprintf('_____________101 and 102 Non anx(Separate fitting) sz t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats47.tstat);
fprintf('p-value: %.4f\n', p47);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci47(1), ci47(2));
fprintf("\n");
fprintf('_____________101 and 102 Non anx(Separate fitting) st t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats48.tstat);
fprintf('p-value: %.4f\n', p48);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci48(1), ci48(2));
fprintf("\n");
fprintf('_____________101 and 102 Non anx(Separate fitting) eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats49.tstat);
fprintf('p-value: %.4f\n', p49);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci49(1), ci49(2));
fprintf("\n");

















