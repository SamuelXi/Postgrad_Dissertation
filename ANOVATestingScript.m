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


%% Testing for significance between different model

%Read table
fileDataT1 = readtable(filePathNoConR1);
fileDataT2 = readtable(filePathNoConR5);

T1 = fileDataT1.z;
T2 = fileDataT2.z;
test = [T1,T2]
% [h, p, ci, stats] = ttest2(T1,T2);

%% Comparing between anxious and non annxious group in all parameter values
% Create testing group for based on the on anxious and not anxious
% Using all free parameters model data

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

% Group size
anxSize = size(anxPar);
anxNoSize = size(anxNoPar);

% Extract participant information
for i = 1:115
    % No condition
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
    
    %Condtion
    if ismember(con5(i,:).participantsID, anxNoPar)
        %Extract v value
        vNoAnxG2 = [vNoAnxG2,con5(i,:).v_101_];
        %Extract a value
        aNoAnxG2 = [aNoAnxG2,con5(i,:).a_101_];
        %Extract z value
        zNoAnxG2 = [zNoAnxG2,con5(i,:).z_101_];
        %Extract Ter value
        TerNoAnxG2 = [TerNoAnxG2,con5(i,:).Ter_101_];
        %Extract sz value
        szNoAnxG2 = [szNoAnxG2,con5(i,:).sz_101_];
        %Extract st value
        stNoAnxG2 = [stNoAnxG2,con5(i,:).st_101_];
        %Extract eta value
        etaNoAnxG2 = [etaNoAnxG2,con5(i,:).eta_101_];

    elseif ismember(con5(i,:).participantsID, anxPar)
        %Extract v value
        vAnxG2 = [vAnxG2,con5(i,:).v_101_];
        %Extract a value
        aAnxG2 = [aAnxG2,con5(i,:).a_101_];
        %Extract z value
        zAnxG2 = [zAnxG2,con5(i,:).z_101_];
        %Extract Ter value
        TerAnxG2 = [TerAnxG2,con5(i,:).Ter_101_];
        %Extract sz value
        szAnxG2 = [szAnxG2,con5(i,:).sz_101_];
        %Extract st value
        stAnxG2 = [stAnxG2,con5(i,:).st_101_];
        %Extract eta value
        etaAnxG2 = [etaAnxG2,con5(i,:).eta_101_];
    end
end

% T-test setup
% v parameter
[h1, p1, ci1, stats1] = ttest2(vNoAnxG1,vAnxG1); %no Condition
[h2, p2, ci2, stats2] = ttest2(vNoAnxG2,vAnxG2); %Condition

% a parameter
[h3, p3, ci3, stats3] = ttest2(aNoAnxG1,aAnxG1); %no Condition
[h4, p4, ci4, stats4] = ttest2(aNoAnxG2,aAnxG2); %Condition

% z parameter
[h5, p5, ci5, stats5] = ttest2(zNoAnxG1,zAnxG1); %no Condition
[h6, p6, ci6, stats6] = ttest2(zNoAnxG2,zAnxG2); %Condition

% Ter parameter
[h7, p7, ci7, stats7] = ttest2(TerNoAnxG1,TerAnxG1); %no Condition
[h8, p8, ci8, stats8] = ttest2(TerNoAnxG2,TerAnxG2); %Condition

% sz parameter
[h9, p9, ci9, stats9] = ttest2(szNoAnxG1,szAnxG1); %no Condition
[h10, p10, ci10, stats10] = ttest2(szNoAnxG2,szAnxG2); %Condition

% st parameter
[h11, p11, ci11, stats11] = ttest2(stNoAnxG1,stAnxG1); %no Condition
[h12, p12, ci12, stats12] = ttest2(stNoAnxG2,stAnxG2); %Condition

% eta parameter
[h13, p13, ci13, stats13] = ttest2(etaNoAnxG1,etaAnxG1); %no Condition
[h14, p14, ci14, stats14] = ttest2(etaNoAnxG2,etaAnxG2); %Condition


% Display the results
fprintf('_____________No Condition v t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats1.tstat);
fprintf('p-value: %.4f\n', p1);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci1(1), ci1(2));
fprintf('\n')
fprintf('______________Condition v t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats2.tstat);
fprintf('p-value: %.4f\n', p2);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci2(1), ci2(2));
fprintf("\n");
fprintf('_____________No Condition a t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats3.tstat);
fprintf('p-value: %.4f\n', p3);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci3(1), ci3(2));
fprintf('\n')
fprintf('______________Condition a t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats4.tstat);
fprintf('p-value: %.4f\n', p4);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci4(1), ci4(2));
fprintf("\n");
fprintf('_____________No Condition z t-test_____________\n');
fprintf('t-statistic: %.4f\n', stats5.tstat);
fprintf('p-value: %.4f\n', p5);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci5(1), ci5(2));
fprintf('\n')
fprintf('______________Condition z t-test_______________\n');
fprintf('t-statistic: %.4f\n', stats6.tstat);
fprintf('p-value: %.4f\n', p6);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci6(1), ci6(2));
fprintf("\n");
fprintf('____________No Condition Ter t-test____________\n');
fprintf('t-statistic: %.4f\n', stats7.tstat);
fprintf('p-value: %.4f\n', p7);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci7(1), ci7(2));
fprintf('\n')
fprintf('_____________Condition Ter t-test______________\n');
fprintf('t-statistic: %.4f\n', stats8.tstat);
fprintf('p-value: %.4f\n', p8);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci8(1), ci8(2));
fprintf("\n");
fprintf('____________No Condition sz t-test____________\n');
fprintf('t-statistic: %.4f\n', stats9.tstat);
fprintf('p-value: %.4f\n', p9);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci9(1), ci9(2));
fprintf('\n')
fprintf('_____________Condition sz t-test______________\n');
fprintf('t-statistic: %.4f\n', stats10.tstat);
fprintf('p-value: %.4f\n', p10);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci10(1), ci10(2));
fprintf("\n");
fprintf('____________No Condition st t-test____________\n');
fprintf('t-statistic: %.4f\n', stats11.tstat);
fprintf('p-value: %.4f\n', p11);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci11(1), ci11(2));
fprintf('\n')
fprintf('_____________Condition st t-test______________\n');
fprintf('t-statistic: %.4f\n', stats12.tstat);
fprintf('p-value: %.4f\n', p12);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci12(1), ci12(2));
fprintf("\n");
fprintf('____________No Condition eta t-test____________\n');
fprintf('t-statistic: %.4f\n', stats13.tstat);
fprintf('p-value: %.4f\n', p13);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci13(1), ci13(2));
fprintf('\n')
fprintf('_____________Condition eta t-test______________\n');
fprintf('t-statistic: %.4f\n', stats14.tstat);
fprintf('p-value: %.4f\n', p14);
fprintf('95%% Confidence Interval: [%.4f, %.4f]\n', ci14(1), ci14(2));
fprintf("\n");





